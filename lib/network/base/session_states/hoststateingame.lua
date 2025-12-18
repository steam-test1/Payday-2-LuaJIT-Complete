HostStateInGame = HostStateInGame or class(HostStateBase)
HostStateInGame.STATE_INDEX = 3

function HostStateInGame:enter(data, enter_params)
	print("[HostStateInGame:enter]", data, inspect(enter_params))

	self._new_peers = {}
end

function HostStateInGame:on_join_request_received(data, peer_name, peer_account_type_str, peer_account_id, is_invite, client_preferred_character, xuid, peer_level, peer_rank, peer_stinger_index, join_attempt_identifier, sender)
	local peer_id = sender:ip_at_index(0)
	local my_user_id = data.local_peer:user_id() or ""
	peer_name = managers.network:sanitize_peer_name(peer_name)
	local drop_in_name = peer_name

	print("[HostStateInGame:on_join_request_received]", data, peer_name, peer_account_type_str, peer_account_id, client_preferred_character, xuid, peer_level, join_attempt_identifier, peer_id)

	if peer_account_type_str == "STEAM" then
		local temp = peer_name

		if SystemInfo:distribution() == Idstring("STEAM") then
			peer_name = managers.network.account:username_by_id(peer_account_id)
		elseif SystemInfo:matchmaking() == Idstring("MM_STEAM") then
			peer_name = managers.network.matchmake:username_by_id(peer_account_id)
		end

		if peer_name == "" or peer_name == "[unknown]" then
			peer_name = temp
		end
	end

	if SocialHubFriends:is_blocked(peer_id) then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.SHUB_BLOCKED, my_user_id)

		return
	end

	if not is_invite and managers.network.matchmake:get_lobby_type() == "friend" then
		print("[HostStateInGame:on_join_request_received] lobby type friend only, check if friend")

		if SocialHubFriends:is_friend_global(peer_id, peer_account_type_str, peer_account_id) then
			print("[HostStateInGame:on_join_request_received] ok we are friend with ", peer_name)
		else
			print("[HostStateInGame:on_join_request_received] we are NOT friend with ", peer_name, " deny request")
			self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.SHUB_NOT_FRIEND, my_user_id)

			return
		end
	end

	if self:_has_peer_left_PSN(peer_name) then
		print("this CLIENT has left us from PSN, ignore his request", peer_name)

		return
	end

	if not self:_is_in_server_state() then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.FAILED_CONNECT, my_user_id)

		return
	end

	if Global.game_settings.single_player then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.FAILED_CONNECT, my_user_id)

		return
	end

	if not NetworkManager.DROPIN_ENABLED or not Global.game_settings.drop_in_allowed then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.GAME_STARTED, my_user_id)

		return
	end

	if managers.groupai and not managers.groupai:state():chk_allow_drop_in() then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.GAME_STARTED, my_user_id)

		return
	end

	if self:_is_banned(peer_name, peer_account_id) then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.BANNED, my_user_id)

		return
	end

	if peer_level < Global.game_settings.reputation_permission then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.LOW_LEVEL, my_user_id)

		return
	end

	if data.wants_to_load_level then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.HOST_LOADING, my_user_id)

		return
	end

	if not managers.network:session():local_peer() then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.FAILED_CONNECT, my_user_id)

		return
	end

	if not MenuCallbackHandler:is_modded_client() and not Global.game_settings.allow_modded_players then
		local is_modded = false

		if SystemInfo:distribution() == Idstring("STEAM") and peer_account_type_str == "STEAM" then
			local user = Steam:user(peer_id)
			is_modded = user:rich_presence("is_modded") == "1"
		end

		if SystemInfo:distribution() == Idstring("EPIC") and peer_account_type_str == "EPIC" then
			-- Nothing
		end

		if is_modded then
			self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.MODS_DISALLOWED, my_user_id)

			return
		end
	end

	local old_peer = data.session:chk_peer_already_in(sender)

	if old_peer then
		if join_attempt_identifier ~= old_peer:join_attempt_identifier() then
			self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.ALREADY_JOINED, my_user_id)
			data.session:remove_peer(old_peer, old_peer:id(), "lost")
		end

		return
	end

	if data.session:peer_by_account_id(peer_account_id) then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.FAILED_CONNECT, my_user_id)
	end

	if table.size(data.peers) >= tweak_data.max_players - 1 then
		print("server is full")
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.GAME_FULL, my_user_id)

		return
	end

	local character = managers.network:session():check_peer_preferred_character(client_preferred_character)
	local xnaddr = ""
	local new_peer_id, new_peer = data.session:add_peer(peer_name, nil, false, false, false, nil, character, peer_id, peer_account_type_str, peer_account_id, xuid, xnaddr)

	if not new_peer_id then
		print("there was no clean peer_id")
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.FAILED_CONNECT, my_user_id)

		return
	end

	new_peer:set_xuid(xuid)
	new_peer:set_name_drop_in(drop_in_name)
	new_peer:set_join_attempt_identifier(join_attempt_identifier)

	local new_peer_rpc = nil

	if sender:protocol_at_index(0) == "TCP_IP" then
		new_peer_rpc = managers.network:session():resolve_new_peer_rpc(new_peer, sender)
	else
		new_peer_rpc = sender
	end

	new_peer:set_rpc(new_peer_rpc)
	new_peer:set_ip_verified(true)
	Network:add_co_client(new_peer_rpc)
	new_peer:set_rank(peer_rank)
	new_peer:set_join_stinger_index(peer_stinger_index)

	local ticket = new_peer:create_ticket(data.local_peer:account_id())

	new_peer:send("request_join_auth", HostNetworkSession.JOIN_REPLY.OK, ticket)
end

function HostStateInGame:on_join_auth_received(data, auth_ticket, sender)
	print("[HostStateInGame:on_join_auth_received] auth ticket received")

	local new_peer = data.session:chk_peer_already_in(sender)
	local my_user_id = data.local_peer:user_id() or ""

	if not new_peer then
		self:_send_request_denied(sender, HostNetworkSession.JOIN_REPLY.FAILED_CONNECT, my_user_id)

		return
	end

	if not new_peer:begin_ticket_session(auth_ticket) then
		self:_send_request_denied(sender, 8, my_user_id)
		data.session:remove_peer(new_peer, new_peer:id(), "auth_fail")

		return
	end

	local level_index = tweak_data.levels:get_index_from_level_id(Global.game_settings.level_id)
	local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
	local job_id_index = 0
	local job_stage = 0
	local alternative_job_stage = 0
	local interupt_job_stage_level_index = 0

	if managers.job:has_active_job() then
		job_id_index = tweak_data.narrative:get_index_from_job_id(managers.job:current_job_id())
		job_stage = managers.job:current_stage()
		alternative_job_stage = managers.job:alternative_stage() or 0
		local interupt_stage_level = managers.job:interupt_stage()
		interupt_job_stage_level_index = interupt_stage_level and tweak_data.levels:get_index_from_level_id(interupt_stage_level) or 0
	end

	local server_xuid = ""
	local new_peer_id = new_peer:id()
	local params = {
		HostNetworkSession.JOIN_REPLY.OK,
		new_peer_id,
		new_peer:character(),
		level_index,
		difficulty_index,
		Global.game_settings.one_down,
		self.STATE_INDEX,
		data.local_peer:character(),
		my_user_id,
		Global.game_settings.mission,
		job_id_index,
		job_stage,
		alternative_job_stage,
		interupt_job_stage_level_index,
		server_xuid
	}

	new_peer:send("join_request_reply", unpack(params))
	new_peer:send("set_loading_state", false, data.session:load_counter())
	managers.vote:sync_server_kick_option(new_peer)
	data.session:send_ok_to_load_level()
	self:on_handshake_confirmation(data, new_peer, 1)

	self._new_peers[new_peer_id] = true
end

function HostStateInGame:on_peer_finished_loading(data, peer)
	self:_introduce_new_peer_to_old_peers(data, peer, false, peer:name(), peer:character(), peer:xuid(), peer:xnaddr())
	self:_introduce_old_peers_to_new_peer(data, peer)

	if data.game_started then
		peer:send("set_dropin")
	end

	if self._new_peers[peer:id()] then
		local join_stinger_index = peer:join_stinger_index()

		managers.menu:play_join_stinger_by_index(join_stinger_index)
		managers.network:session():send_to_peers_except(peer:id(), "peer_joined_sound", join_stinger_index)
		managers.crime_spree:on_peer_finished_loading(peer)
	end
end

function HostStateInGame:is_joinable(data)
	return not data.wants_to_load_level
end
