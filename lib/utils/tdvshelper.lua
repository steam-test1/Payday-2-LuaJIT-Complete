local json = require("lib/utils/accelbyte/json")

TDVS = TDVS or {}
Global.TDVS = Global.TDVS or {}

local function jwt_payload(jwt)
	if type(jwt) ~= "string" then
		return nil
	end

	local split = string.split(jwt, "[.]")

	if #split < 3 then
		return nil
	end

	local payload = base64.decode(split[2])

	if not payload then
		return nil
	end

	return json.decode(payload)
end

function TDVS:should_use()
	return IS_EPIC_MM
end

function TDVS:available()
	return not Global.TDVS.cannot_reach_server
end

function TDVS:has_ticket()
	return Global.TDVS.local_ticket ~= nil
end

function TDVS:waiting_for_ticket()
	return Global.TDVS.waiting_for_get_ticket_response
end

function TDVS:local_ticket(callback)
	local request_new = true

	if Global.TDVS.local_ticket and Global.TDVS.local_ticket_expiry - os.time() > 300 then
		request_new = false
	end

	if request_new then
		Global.TDVS.waiting_for_get_ticket_response = true

		local function platform_ticket_callback(platform_ticket)
			local function tdvs_ticket_callback(error, status_code, response)
				Global.TDVS.cannot_reach_server = error == 2 or status_code == 404
				Global.TDVS.waiting_for_get_ticket_response = false

				if status_code == 200 then
					local resp = json.decode(response)

					Global.TDVS.local_ticket = resp.token

					if resp.token then
						Global.TDVS.local_ticket_expiry = jwt_payload(resp.token).exp
					end

					print("[Ticket DLC Validation System] Received ticket for local user (expiry: " .. tostring(Global.TDVS.local_ticket_expiry) .. ")")
				else
					print("[Ticket DLC Validation System] local_ticket response: " .. tostring(response))
				end

				if Global.TDVS.cannot_reach_server then
					Global.TDVS.local_ticket = nil
					Global.TDVS.local_ticket_expiry = nil
				end

				if callback then
					callback(Global.TDVS.local_ticket)
				end
			end

			local form = "ticket=" .. platform_ticket
			local url = ""

			if IS_STEAM then
				url = "https://p2wapi.paydaythegame.com/tdvs/v1/get_token_steam"
			elseif IS_EPIC then
				url = "https://p2wapi.paydaythegame.com/tdvs/v1/get_token_epic"
				form = form .. "&sandbox=" .. Distribution:sandbox_identifier()
			end

			Distribution:make_http_request("POST", url, tdvs_ticket_callback, {}, "application/x-www-form-urlencoded", form, string.len(form))
		end

		Distribution:create_secure_ticket_for_services("tdvs", platform_ticket_callback)
	elseif callback then
		callback(Global.TDVS.local_ticket)
	end
end

function TDVS:begin_ticket_session(account_id, ticket, callback)
	print("[Ticket DLC Validation System] begin_ticket_session " .. account_id .. " " .. string.sub(ticket, 0, 20) .. "...")

	local jwt = jwt_payload(ticket)

	if not jwt then
		callback(false, "invalid_jwt")

		return false
	end

	if not account_id or not jwt.user_id or account_id ~= jwt.user_id then
		print("[Ticket DLC Validation System] Expected account id: " .. account_id .. " got: " .. jwt.user_id)
		callback(false, "invalid_account_id")

		return false
	end

	Global.TDVS.peer_tickets = Global.TDVS.peer_tickets or {}

	if Global.TDVS.peer_tickets[account_id] and Global.TDVS.peer_tickets[account_id].pending_owned_dlc then
		return true
	end

	local peer_data = {}

	Global.TDVS.peer_tickets[account_id] = peer_data
	peer_data.account_type = jwt.account_type
	peer_data.pending_owned_dlc = true
	peer_data.owned_dlc = {}

	local function validate_callback(error, status_code, response)
		Global.TDVS.cannot_reach_server = error == 2 or status_code == 404

		print("[Ticket DLC Validation System] " .. tostring(response))

		peer_data.pending_owned_dlc = false

		local valid = Global.TDVS.cannot_reach_server
		local reason = ""

		if status_code == 200 then
			local resp = json.decode(response)

			valid = resp.valid
			reason = "success"

			for _, id in ipairs(jwt.owned_dlc) do
				peer_data.owned_dlc[tostring(id)] = true
			end
		elseif response then
			local resp = json.decode(response)

			reason = resp.error
		elseif Global.TDVS.cannot_reach_server then
			valid = true
			reason = "success"
		end

		callback(valid, reason)
	end

	local form = "token=" .. ticket

	Distribution:make_http_request("POST", "https://p2wapi.paydaythegame.com/tdvs/v1/validate_token", validate_callback, {}, "application/x-www-form-urlencoded", form, string.len(form))

	return true
end

function TDVS:end_ticket_session(account_id)
	if type(account_id) ~= "string" then
		return
	end

	Global.TDVS.peer_tickets = Global.TDVS.peer_tickets or {}
	Global.TDVS.peer_tickets[account_id] = nil
end

function TDVS:is_user_product_owned(account_id, dlc_data)
	if not TDVS:available() then
		return true
	end

	local peer_data = Global.TDVS.peer_tickets[account_id]

	if not peer_data or not peer_data.owned_dlc then
		return true
	end

	local product_id

	if peer_data.account_type == "STEAM" then
		product_id = dlc_data.app_id
	elseif peer_data.account_type == "EPIC" then
		product_id = dlc_data.epic_id
	end

	if not product_id then
		return false
	end

	return peer_data.owned_dlc[product_id]
end

local TICKET_CHUNK_SIZE = 1000

function TDVS:should_chunk_auth_ticket(ticket)
	if type(ticket) ~= "string" then
		print("[Ticket DLC Validation System] Invalid auth ticket")

		return nil
	end

	return string.len(ticket) >= TICKET_CHUNK_SIZE
end

function TDVS:send_auth_ticket_in_chunks(ticket, peer, request, ...)
	local rpc_function

	rpc_function = request and "join_request_auth_chunk" or "join_request_reply_auth_chunk"

	local ticket_len = string.len(ticket)
	local num_chunks = math.ceil(ticket_len / TICKET_CHUNK_SIZE)
	local remaining_size = ticket_len

	print("[Ticket DLC Validation System] Sending auth ticket of size " .. tostring(ticket_len) .. " in " .. tostring(num_chunks) .. " chunks with " .. rpc_function)

	for i = 0, num_chunks - 1 do
		local current_chunk_start = i * TICKET_CHUNK_SIZE
		local current_chunk_end = math.min((i + 1) * TICKET_CHUNK_SIZE, ticket_len)

		if current_chunk_start ~= 0 then
			current_chunk_start = current_chunk_start + 1
		end

		local chunk = string.sub(ticket, current_chunk_start, current_chunk_end)

		remaining_size = remaining_size - (current_chunk_end - current_chunk_start)

		if peer then
			peer[rpc_function](peer, i, num_chunks, ticket_len, chunk, ...)
		end
	end
end
