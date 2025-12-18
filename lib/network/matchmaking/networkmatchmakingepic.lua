require("lib/utils/accelbyte/Telemetry")

NetworkMatchMakingEPIC = NetworkMatchMakingEPIC or class()
NetworkMatchMakingEPIC.OPEN_SLOTS = tweak_data.max_players
NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY = pd2_version()

function NetworkMatchMakingEPIC:init()
	cat_print("lobby", "matchmake = NetworkMatchMakingEPIC")

	self._callback_map = {}
	self._lobby_filters = {}
	self._distance_filter = -1
	self._difficulty_filter = 0
	self._lobby_return_count = 30
	self._try_re_enter_lobby = nil
	self._server_joinable = true
end

function NetworkMatchMakingEPIC:register_callback(event, callback)
	self._callback_map[event] = callback
end

function NetworkMatchMakingEPIC:_call_callback(name, ...)
	if self._callback_map[name] then
		return self._callback_map[name](...)
	else
		Application:error("Callback " .. name .. " not found.")
	end
end

function NetworkMatchMakingEPIC:_has_callback(name)
	if self._callback_map[name] then
		return true
	end

	return false
end

function NetworkMatchMakingEPIC:_split_attribute_number(attribute_number, splitter)
	if not splitter or splitter == 0 or type(splitter) ~= "number" then
		Application:error("NetworkMatchMakingEPIC:_split_attribute_number. splitter needs to be a non 0 number!", "attribute_number", attribute_number, "splitter", splitter)
		Application:stack_dump()

		return 1, 1
	end

	return attribute_number % splitter, math.floor(attribute_number / splitter)
end

function NetworkMatchMakingEPIC:destroy_game()
	self:leave_game()
end

function NetworkMatchMakingEPIC:_load_globals()
	if Global.epic and Global.epic.match then
		self.lobby_handler = Global.epic.match.lobby_handler
		self._lobby_attributes = Global.epic.match.lobby_attributes

		if self.lobby_handler then
			self.lobby_handler:setup_callbacks(NetworkMatchMakingEPIC._on_memberstatus_change, NetworkMatchMakingEPIC._on_data_update)
		end

		self._try_re_enter_lobby = Global.epic.match.try_re_enter_lobby
		self._server_rpc = Global.epic.match.server_rpc
		self._lobby_filters = Global.epic.match.lobby_filters or self._lobby_filters
		self._distance_filter = Global.epic.match.distance_filter or self._distance_filter
		self._difficulty_filter = Global.epic.match.difficulty_filter or self._difficulty_filter
		self._lobby_return_count = Global.epic.match.lobby_return_count or self._lobby_return_count
		Global.epic.match = nil
	end
end

function NetworkMatchMakingEPIC:_save_globals()
	if not Global.epic then
		Global.epic = {}
	end

	Global.epic.match = {
		lobby_handler = self.lobby_handler,
		lobby_attributes = self._lobby_attributes,
		try_re_enter_lobby = self._try_re_enter_lobby,
		server_rpc = self._server_rpc,
		lobby_filters = self._lobby_filters,
		distance_filter = self._distance_filter,
		difficulty_filter = self._difficulty_filter,
		lobby_return_count = self._lobby_return_count
	}
end

function NetworkMatchMakingEPIC:load_user_filters()
	Global.game_settings.search_friends_only = managers.user:get_setting("crimenet_filter_friends_only")
	Global.game_settings.search_appropriate_jobs = managers.user:get_setting("crimenet_filter_level_appopriate")
	Global.game_settings.allow_search_safehouses = managers.user:get_setting("crimenet_filter_safehouses")
	Global.game_settings.search_mutated_lobbies = managers.user:get_setting("crimenet_filter_mutators")
	Global.game_settings.search_modded_lobbies = managers.user:get_setting("crimenet_filter_modded")
	Global.game_settings.search_one_down_lobbies = managers.user:get_setting("crimenet_filter_one_down")
	Global.game_settings.gamemode_filter = managers.user:get_setting("crimenet_gamemode_filter")
	Global.game_settings.crime_spree_max_lobby_diff = managers.user:get_setting("crime_spree_lobby_diff")
	Global.game_settings.search_only_weekly_skirmish = managers.user:get_setting("crimenet_filter_weekly_skirmish")
	Global.game_settings.skirmish_wave_filter = managers.user:get_setting("crimenet_filter_skirmish_wave")
	local new_servers = managers.user:get_setting("crimenet_filter_new_servers_only")
	local in_lobby = managers.user:get_setting("crimenet_filter_in_lobby")
	local max_servers = managers.user:get_setting("crimenet_filter_max_servers")
	local distance = managers.user:get_setting("crimenet_filter_distance_epic")
	local difficulty = managers.user:get_setting("crimenet_filter_difficulty")
	local job_id = managers.user:get_setting("crimenet_filter_contract")
	local kick = managers.user:get_setting("crimenet_filter_kick")
	local tactic = managers.user:get_setting("crimenet_filter_tactic")

	managers.network.matchmake:add_lobby_filter("state", in_lobby, "equal")
	managers.network.matchmake:set_lobby_return_count(max_servers)
	managers.network.matchmake:add_lobby_filter("num_players", new_servers, "equal")
	managers.network.matchmake:set_distance_filter(managers.user:get_setting("crimenet_filter_distance_epic"))
	managers.network.matchmake:add_lobby_filter("difficulty", difficulty, "equal")
	managers.network.matchmake:add_lobby_filter("job_id", job_id, "equal")
	managers.network.matchmake:add_lobby_filter("kick_option", kick, "equal")
	managers.network.matchmake:add_lobby_filter("job_plan", tactic, "equal")
end

function NetworkMatchMakingEPIC:reset_filters()
	local usr = managers.user

	usr:set_setting("crimenet_filter_friends_only", usr:get_default_setting("crimenet_filter_friends_only"))
	usr:set_setting("crimenet_filter_level_appopriate", usr:get_default_setting("crimenet_filter_level_appopriate"))
	usr:set_setting("crimenet_filter_safehouses", usr:get_default_setting("crimenet_filter_safehouses"))
	usr:set_setting("crimenet_filter_mutators", usr:get_default_setting("crimenet_filter_mutators"))
	usr:set_setting("crimenet_gamemode_filter", usr:get_default_setting("crimenet_gamemode_filter"))
	usr:set_setting("crime_spree_lobby_diff", usr:get_default_setting("crime_spree_lobby_diff"))
	usr:set_setting("crimenet_filter_modded", usr:get_default_setting("crimenet_filter_modded"))
	usr:set_setting("crimenet_filter_weekly_skirmish", usr:get_default_setting("crimenet_filter_weekly_skirmish"))
	usr:set_setting("crimenet_filter_skirmish_wave", usr:get_default_setting("crimenet_filter_skirmish_wave"))
	usr:set_setting("crimenet_filter_one_down", usr:get_default_setting("crimenet_filter_one_down"))
	usr:set_setting("crimenet_filter_new_servers_only", usr:get_default_setting("crimenet_filter_new_servers_only"))
	usr:set_setting("crimenet_filter_in_lobby", usr:get_default_setting("crimenet_filter_in_lobby"))
	usr:set_setting("crimenet_filter_max_servers", usr:get_default_setting("crimenet_filter_max_servers"))
	usr:set_setting("crimenet_filter_distance_epic", usr:get_default_setting("crimenet_filter_distance_epic"))
	usr:set_setting("crimenet_filter_difficulty", usr:get_default_setting("crimenet_filter_difficulty"))
	usr:set_setting("crimenet_filter_contract", usr:get_default_setting("crimenet_filter_contract"))
	usr:set_setting("crimenet_filter_kick", usr:get_default_setting("crimenet_filter_kick"))
	usr:set_setting("crimenet_filter_tactic", usr:get_default_setting("crimenet_filter_tactic"))
	self:load_user_filters()
end

function NetworkMatchMakingEPIC:set_join_invite_pending(lobby_id)
	self._join_invite_pending = lobby_id
end

function NetworkMatchMakingEPIC:update()
	EpicMM:update()

	if self._try_re_enter_lobby then
		if self._try_re_enter_lobby == "lost" then
			Application:error("REQUESTING RE-OPEN LOBBY")
			self._server_rpc:re_open_lobby_request(true)

			self._try_re_enter_lobby = "asked"
		elseif self._try_re_enter_lobby == "asked" then
			-- Nothing
		elseif self._try_re_enter_lobby == "open" then
			self._try_re_enter_lobby = "joining"

			Application:error("RE-ENTERING LOBBY", self.lobby_handler:id())

			local function _join_lobby_result_f(result, handler)
				if result == "success" then
					Application:error("SUCCESS!")

					self.lobby_handler = handler

					self._server_rpc:re_open_lobby_request(false)

					self._try_re_enter_lobby = nil
				else
					Application:error("FAIL!")

					self._try_re_enter_lobby = "open"
				end
			end

			EpicMM:join_lobby(self.lobby_handler:id(), _join_lobby_result_f)
		end
	end

	if self._join_invite_pending and not managers.network:session() then
		managers.network.matchmake:join_server_with_check(self._join_invite_pending, true)

		self._join_invite_pending = nil
	end
end

function NetworkMatchMakingEPIC:leave_game()
	self._server_rpc = nil

	if self.lobby_handler then
		self.lobby_handler:leave_lobby()
	end

	self.lobby_handler = nil
	self._server_joinable = true

	if self._try_re_enter_lobby then
		self._try_re_enter_lobby = nil
	end

	Telemetry:last_quickplay_room_id(0)
	print("NetworkMatchMakingEPIC:leave_game()")
end

function NetworkMatchMakingEPIC:_get_mutators_from_lobby(lobby)
	return managers.mutators:get_mutators_from_lobby(lobby)
end

function NetworkMatchMakingEPIC:username()
	return EpicMM:username()
end

function NetworkMatchMakingEPIC:username_by_id(id)
	return EpicMM:username(id)
end

function NetworkMatchMakingEPIC:userid()
	return EpicMM:userid()
end

function NetworkMatchMakingEPIC:is_user_friend(userid, account_id)
	local friends = EpicMM:logged_on()

	return managers.network.account:is_player_friend(account_id)
end

function NetworkMatchMakingEPIC:invite_friends_to_lobby()
	local lobby_id = self.lobby_handler and self.lobby_handler:id()

	if lobby_id then
		-- Nothing
	end
end

function NetworkMatchMakingEPIC:search_friends_only()
	return self._search_friends_only
end

function NetworkMatchMakingEPIC:distance_filter()
	return self._distance_filter
end

function NetworkMatchMakingEPIC:set_distance_filter(filter)
	self._distance_filter = filter
end

function NetworkMatchMakingEPIC:get_lobby_data()
	local eos_lobby_data = self.lobby_handler and self.lobby_handler:get_lobby_data()

	if eos_lobby_data then
		local remapped_lobby_data = {}

		for upper_key, value in pairs(eos_lobby_data) do
			local lower_key = string.lower(upper_key)
			remapped_lobby_data[lower_key] = value
		end

		return remapped_lobby_data
	end
end

function NetworkMatchMakingEPIC:get_lobby_return_count()
	return self._lobby_return_count
end

function NetworkMatchMakingEPIC:set_lobby_return_count(lobby_return_count)
	self._lobby_return_count = lobby_return_count
end

function NetworkMatchMakingEPIC:lobby_filters()
	return self._lobby_filters
end

function NetworkMatchMakingEPIC:set_lobby_filters(filters)
	self._lobby_filters = filters or {}
end

function NetworkMatchMakingEPIC:add_lobby_filter(key, value, comparision_type)
	self._lobby_filters[key] = {
		key = key,
		value = value,
		comparision_type = comparision_type
	}
end

function NetworkMatchMakingEPIC:get_lobby_filter(key)
	return self._lobby_filters[key] and self._lobby_filters[key].value or false
end

function NetworkMatchMakingEPIC:difficulty_filter()
	return self._difficulty_filter
end

function NetworkMatchMakingEPIC:set_difficulty_filter(filter)
	self._difficulty_filter = filter
end

function NetworkMatchMakingEPIC:_make_room_info(lobby)
	local owner_name = lobby:key_value("owner_name")
	local sanitized_name = managers.network:sanitize_peer_name(owner_name)
	local room_info = {
		owner_id = lobby:key_value("owner_id"),
		owner_name = sanitized_name,
		owner_account_id = lobby:key_value("owner_account_id"),
		room_id = lobby:id(),
		owner_level = lobby:key_value("owner_level")
	}

	return room_info
end

function NetworkMatchMakingEPIC:lobby_search_reset()
	LobbyBrowser:reset()
end

function NetworkMatchMakingEPIC:search_lobby(friends_only, no_filters)
	self._search_friends_only = friends_only

	if not self:_has_callback("search_lobby") then
		return
	end

	local function refresh_lobby()
		local lobbies = LobbyBrowser:lobbies()
		local info = {
			room_list = {},
			attribute_list = {}
		}

		if lobbies then
			for _, lobby in ipairs(lobbies) do
				local owner_name = lobby:key_value("owner_name")
				local difficulty = tonumber(lobby:key_value("difficulty"))
				local filters_passed = utf8.len(owner_name) <= NetworkManager.MAX_PEER_NAME_LENGTH and (self._difficulty_filter == 0 or self._difficulty_filter == difficulty)

				if filters_passed then
					table.insert(info.room_list, self:_make_room_info(lobby))

					local attributes_data = {
						numbers = self:_lobby_to_numbers(lobby),
						mutators = self:_get_mutators_from_lobby(lobby),
						crime_spree = tonumber(lobby:key_value("crime_spree")),
						crime_spree_mission = lobby:key_value("crime_spree_mission"),
						mods = lobby:key_value("mods"),
						one_down = tonumber(lobby:key_value("one_down")),
						skirmish = tonumber(lobby:key_value("skirmish")),
						skirmish_wave = tonumber(lobby:key_value("skirmish_wave")),
						skirmish_weekly_modifiers = lobby:key_value("skirmish_weekly_modifiers")
					}

					table.insert(info.attribute_list, attributes_data)
				else
					Application:error("[NetworkMatchMakingEPIC:search_lobby] found lobby failed filter checks")
				end
			end
		end

		self:_call_callback("search_lobby", info)
	end

	LobbyBrowser:set_friends_filter(friends_only)
	LobbyBrowser:set_callbacks(refresh_lobby)

	local interest_keys = {
		"owner_id",
		"owner_name",
		"level",
		"difficulty",
		"permission",
		"state",
		"num_players",
		"drop_in",
		"min_level",
		"kick_option",
		"job_class_min",
		"job_class_max",
		"allow_mods"
	}

	if self._BUILD_SEARCH_INTEREST_KEY then
		table.insert(interest_keys, self._BUILD_SEARCH_INTEREST_KEY)
	end

	LobbyBrowser:set_interest_keys(interest_keys)
	LobbyBrowser:set_distance_filter(self._distance_filter)

	local use_filters = not no_filters

	if Global.game_settings.gamemode_filter ~= GamemodeStandard.id then
		use_filters = false
	end

	LobbyBrowser:set_lobby_filter(self._BUILD_SEARCH_INTEREST_KEY, "true", "equal")

	local has_filter, filter_value, filter_type = self:get_modded_lobby_filter()

	if has_filter then
		LobbyBrowser:set_lobby_filter("mods", filter_value, filter_type)
	else
		LobbyBrowser:set_lobby_filter("mods")
	end

	local has_filter, filter_value, filter_type = self:get_allow_mods_filter()

	if has_filter then
		LobbyBrowser:set_lobby_filter("allow_mods", filter_value, filter_type)
	else
		LobbyBrowser:set_lobby_filter("allow_mods")
	end

	LobbyBrowser:set_lobby_filter("one_down", Global.game_settings.search_one_down_lobbies and 1 or 0, "equalto_less_than")

	if use_filters then
		LobbyBrowser:set_lobby_filter("min_level", managers.experience:current_level(), "equalto_less_than")

		if Global.game_settings.search_appropriate_jobs then
			local min_ply_jc = managers.job:get_min_jc_for_player()
			local max_ply_jc = managers.job:get_max_jc_for_player()

			LobbyBrowser:set_lobby_filter("job_class_min", min_ply_jc, "equalto_or_greater_than")
			LobbyBrowser:set_lobby_filter("job_class_max", max_ply_jc, "equalto_less_than")
		end
	end

	if not no_filters then
		if false then
			-- Nothing
		elseif Global.game_settings.gamemode_filter == GamemodeCrimeSpree.id then
			local min_level = 0

			if Global.game_settings.crime_spree_max_lobby_diff >= 0 then
				min_level = managers.crime_spree:spree_level() - (Global.game_settings.crime_spree_max_lobby_diff or 0)
				min_level = math.max(min_level, 0)
			end

			LobbyBrowser:set_lobby_filter("crime_spree", min_level, "equalto_or_greater_than")
			LobbyBrowser:set_lobby_filter("skirmish", 0, "equalto_less_than")
			LobbyBrowser:set_lobby_filter("skirmish_wave")
		elseif Global.game_settings.gamemode_filter == "skirmish" then
			local min = SkirmishManager.LOBBY_NORMAL

			LobbyBrowser:set_lobby_filter("crime_spree", -1, "equalto_less_than")
			LobbyBrowser:set_lobby_filter("skirmish", min, "equalto_or_greater_than")
			LobbyBrowser:set_lobby_filter("skirmish_wave", Global.game_settings.skirmish_wave_filter or 99, "equalto_less_than")
		elseif Global.game_settings.gamemode_filter == GamemodeStandard.id then
			LobbyBrowser:set_lobby_filter("crime_spree", -1, "equalto_less_than")
			LobbyBrowser:set_lobby_filter("skirmish", 0, "equalto_less_than")
			LobbyBrowser:set_lobby_filter("skirmish_wave")
		end
	end

	if use_filters then
		for key, data in pairs(self._lobby_filters) do
			if data.value and data.value ~= -1 then
				LobbyBrowser:set_lobby_filter(data.key, data.value, data.comparision_type)
				print(data.key, data.value, data.comparision_type)
			elseif LobbyBrowser.remove_lobby_filter then
				LobbyBrowser:remove_lobby_filter(data.key)
			end
		end
	end

	LobbyBrowser:set_max_lobby_return_count(self._lobby_return_count)
	LobbyBrowser:refresh()
end

function NetworkMatchMakingEPIC:search_lobby_done()
	managers.system_menu:close("find_server")
end

function NetworkMatchMakingEPIC:game_owner_name()
	local owner_name = managers.network.matchmake.lobby_handler:get_lobby_data("owner_name")
	local sanitized_name = managers.network:sanitize_peer_name(owner_name)

	return sanitized_name
end

function NetworkMatchMakingEPIC:game_owner_account_type_str()
	return managers.network.matchmake.lobby_handler:get_lobby_data("owner_account_type")
end

function NetworkMatchMakingEPIC:game_owner_account_id()
	return managers.network.matchmake.lobby_handler:get_lobby_data("owner_account_id")
end

function NetworkMatchMakingEPIC:is_server_ok(friends_only, room, attributes_list, is_invite)
	local lobby = EpicMM:lobby(room.room_id)

	if not lobby then
		print("NetworkMatchMakingEPIC:is_server_ok failed to get lobby from room_id ", room.room_id)

		return false
	end

	local attributes_numbers = attributes_list.numbers
	local attributes_mutators = attributes_list.mutators
	local permission = tweak_data:index_to_permission(attributes_numbers[3])
	local level_index, job_index = self:_split_attribute_number(attributes_numbers[1], 1000)
	local level_name = tweak_data.levels:get_level_name_from_index(level_index)

	if not level_name then
		Application:error("No level data for index " .. level_index .. ". Payday1 data not compatible with Payday2.")

		return false
	end

	if (not NetworkManager.DROPIN_ENABLED or attributes_numbers[6] == 0) and attributes_numbers[4] ~= 1 then
		Application:debug("NetworkMatchMakingEPIC:is_server_ok() server rejected. DROPING NOT ENABLED")

		return false, 1
	end

	local server_difficulty = tweak_data:index_to_difficulty(attributes_numbers[2])

	if not server_difficulty then
		Application:debug("NetworkMatchMakingEPIC:is_server_ok() server rejected. INVALID DIFFICULTY")

		return false, 1
	end

	if managers.experience:current_level() < attributes_numbers[7] then
		Application:debug("NetworkMatchMakingEPIC:is_server_ok() server rejected. REPUTATION CAP")

		return false, 3
	end

	if not is_invite and permission == "private" then
		Application:debug("NetworkMatchMakingEPIC:is_server_ok() server rejected. PRIVATE GAME")

		return false, 2
	end

	if not is_invite and attributes_mutators and not Global.game_settings.search_mutated_lobbies then
		Application:debug("NetworkMatchMakingEPIC:is_server_ok() server rejected. MUTATED GAME")

		return false
	end

	local level_tweak = tweak_data.levels[level_name]

	if not is_invite and level_tweak and level_tweak.is_safehouse and not Global.game_settings.allow_search_safehouses then
		Application:debug("NetworkMatchMakingEPIC:is_server_ok() server rejected. HIDE ALL SAFEHOUSES")

		return false
	end

	if not MenuCallbackHandler:is_modded_client() and not is_invite and attributes_list.mods and attributes_list.mods ~= self:no_mod_string() and not Global.game_settings.search_modded_lobbies then
		Application:debug("NetworkMatchMakingEPIC:is_server_ok() server rejected. MODDED GAME")

		return false
	end

	local job_id = tweak_data.narrative:get_job_name_from_index(job_index)

	if tweak_data.narrative:is_job_locked(job_id) then
		Application:debug("NetworkMatchMakingEPIC:is_server_ok() server rejected. LOCKED")

		return false, 5
	end

	local lobby_crime_spree = room and tonumber(lobby:key_value("crime_spree"))

	if lobby_crime_spree and lobby_crime_spree > 0 and not managers.crime_spree:unlocked() then
		return false, 6
	end

	if permission == "public" then
		return true
	end

	return true
end

function NetworkMatchMakingEPIC:join_server_with_check(room_id, is_invite)
	managers.menu:show_joining_lobby_dialog()
	managers.socialhub:remove_pending_lobby(room_id)

	local function lobby_found_cb(lobby)
		print("NetworkMatchMakingEPIC:join_server_with_check lobby_found_cb", lobby)

		if not lobby then
			print("no lobby found from id", room_id)
			managers.system_menu:close("join_server")
			managers.menu:show_failed_joining_dialog()

			return
		end

		local attributes = self:_lobby_to_numbers(lobby)

		if NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY then
			local ikey = lobby:key_value(NetworkMatchMakingEPIC._BUILD_SEARCH_INTEREST_KEY)

			if ikey == "value_missing" then
				print("Wrong version!!")
				managers.system_menu:close("join_server")
				managers.menu:show_failed_joining_dialog()

				return
			end
		end

		local server_ok, ok_error = self:is_server_ok(nil, self:_make_room_info(lobby), {
			numbers = attributes
		}, is_invite)

		if server_ok then
			self:join_server(room_id, true, false, is_invite)
		else
			managers.system_menu:close("join_server")

			if ok_error == 1 then
				managers.menu:show_game_started_dialog()
			elseif ok_error == 2 then
				managers.menu:show_game_permission_changed_dialog()
			elseif ok_error == 3 then
				managers.menu:show_too_low_level()
			elseif ok_error == 4 then
				managers.menu:show_does_not_own_heist()
			elseif ok_error == 5 then
				managers.menu:show_heist_is_locked_dialog()
			elseif ok_error == 6 then
				managers.menu:show_crime_spree_locked_dialog()
			end

			self:search_lobby(self:search_friends_only())
		end
	end

	EpicMM:lobby(room_id, lobby_found_cb)
end

function NetworkMatchMakingEPIC._on_member_left(epic_id, status)
	if not managers.network:session() then
		return
	end

	local peer = managers.network:session():peer_by_user_id(epic_id)

	if not peer then
		return
	end

	if peer == managers.network:session():local_peer() and managers.network:session():is_server() then
		managers.network:session():on_peer_left(peer, peer_id)

		return
	elseif peer == managers.network:session():local_peer() and not managers.network:session():closing() then
		Application:error("OMG I LEFT THE LOBBY")

		managers.network.matchmake._try_re_enter_lobby = "lost"
	end

	managers.network:session():on_peer_left_lobby(peer)
end

function NetworkMatchMakingEPIC._on_memberstatus_change(memberstatus)
	print("[NetworkMatchMakingEPIC._on_memberstatus_change]", memberstatus)

	local user, status = unpack(string.split(memberstatus, ":"))

	if status == "lost_epic_connection" or status == "left_become_owner" or status == "left" or status == "kicked" or status == "banned" or status == "invalid" then
		NetworkMatchMakingEPIC._on_member_left(user, status)
	end
end

function NetworkMatchMakingEPIC._on_data_update(...)
end

function NetworkMatchMakingEPIC:join_server(room_id, skip_showing_dialog, quickplay, is_invite)
	if not skip_showing_dialog then
		managers.menu:show_joining_lobby_dialog()
	end

	local function f(result, handler)
		print("[NetworkMatchMakingEPIC:join_server:f]", result, handler)
		managers.system_menu:close("join_server")

		if result == "success" then
			print("Success!")

			self.lobby_handler = handler
			local host_id = self.lobby_handler:owner_id()

			print("[NetworkMatchMakingEPIC:join_server:f] server host id ", host_id)
			print("Gonna handshake now!")

			self._server_rpc = Network:handshake(host_id:tostring(), nil, "EPIC")

			print("Handshook!")
			print("[NetworkMatchMakingEPIC:join_server:f] Server RPC:", self._server_rpc and self._server_rpc:ip_at_index(0))

			if not self._server_rpc then
				return
			end

			self.lobby_handler:setup_callbacks(NetworkMatchMakingEPIC._on_memberstatus_change, NetworkMatchMakingEPIC._on_data_update)

			local lobby_data = self:get_lobby_data()

			managers.network:start_client()
			managers.menu:show_waiting_for_server_response({
				cancel_func = function ()
					managers.network:session():on_join_request_cancelled()
				end
			})

			if lobby_data then
				local spree_level = tonumber(lobby_data.crime_spree)

				if spree_level and spree_level >= 0 then
					managers.crime_spree:enable_crime_spree_gamemode()

					if lobby_data.crime_spree_mission then
						managers.crime_spree:set_temporary_mission(lobby_data.crime_spree_mission)
					end
				end
			end

			managers.skirmish:on_joined_server(lobby_data)

			local function joined_game(res, level_index, difficulty_index, state_index)
				if res ~= "JOINED_LOBBY" and res ~= "JOINED_GAME" then
					managers.crime_spree:disable_crime_spree_gamemode()
				end

				managers.system_menu:close("waiting_for_server_response")
				print("[NetworkMatchMakingEPIC:join_server:joined_game]", res, level_index, difficulty_index, state_index)

				if res == "JOINED_LOBBY" then
					MenuCallbackHandler:crimenet_focus_changed(nil, false)
					managers.menu:on_enter_lobby()
				elseif res == "JOINED_GAME" then
					local level_id = tweak_data.levels:get_level_name_from_index(level_index)
					Global.game_settings.level_id = level_id

					managers.network:session():local_peer():set_in_lobby(false)
				elseif res == "KICKED" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_peer_kicked_dialog()
				elseif res == "TIMED_OUT" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_request_timed_out_dialog()
				elseif res == "GAME_STARTED" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_game_started_dialog()
				elseif res == "DO_NOT_OWN_HEIST" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_does_not_own_heist()
				elseif res == "CANCELLED" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
				elseif res == "FAILED_CONNECT" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_failed_joining_dialog()
				elseif res == "GAME_FULL" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_game_is_full()
				elseif res == "LOW_LEVEL" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_too_low_level()
				elseif res == "WRONG_VERSION" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_wrong_version_message()
				elseif res == "AUTH_FAILED" or res == "AUTH_HOST_FAILED" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()

					Global.on_remove_peer_message = res == "AUTH_HOST_FAILED" and "dialog_authentication_host_fail" or "dialog_authentication_fail"

					managers.menu:show_peer_kicked_dialog()
				elseif res == "BANNED" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_peer_banned_dialog()
				elseif res == "MODS_DISALLOWED" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_mods_disallowed_dialog()
				elseif res == "SHUB_BLOCKED" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_shub_blocked_dialog()
				elseif res == "SHUB_NOT_FRIEND" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_shub_not_friend_dialog()
				elseif res == "HOST_LOADING" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_host_loading_dialog()
				elseif res == "ALREADY_JOINED" then
					managers.network.matchmake:leave_game()
					managers.network.voice_chat:destroy_voice()
					managers.network:queue_stop_network()
					managers.menu:show_already_joined_dialog()
				else
					Application:error("[NetworkMatchMakingEPIC:join_server] FAILED TO START MULTIPLAYER!", res)
				end
			end

			managers.network:join_game_at_host_rpc(self._server_rpc, is_invite, joined_game)

			if quickplay then
				Telemetry:last_quickplay_room_id(self.lobby_handler:id())
			end
		else
			managers.menu:show_failed_joining_dialog()
			self:search_lobby(self:search_friends_only())
		end
	end

	EpicMM:join_lobby(room_id, f)
end

function NetworkMatchMakingEPIC:send_join_invite(friend)
end

function NetworkMatchMakingEPIC:set_server_attributes(settings)
	self:set_attributes(settings)
end

function NetworkMatchMakingEPIC:create_lobby(settings)
	self._num_players = nil
	local dialog_data = {
		title = managers.localization:text("dialog_creating_lobby_title"),
		text = managers.localization:text("dialog_wait"),
		id = "create_lobby",
		no_buttons = true
	}

	managers.system_menu:show(dialog_data)

	local function f(result, handler)
		print("Create lobby callback!!", result, handler)

		if result == "success" then
			self.lobby_handler = handler

			self:set_attributes(settings)

			self._server_joinable = true

			self.lobby_handler:set_joinable(true)
			self.lobby_handler:setup_callbacks(NetworkMatchMakingEPIC._on_memberstatus_change, NetworkMatchMakingEPIC._on_data_update)
			managers.system_menu:close("create_lobby")
			managers.menu:created_lobby()
		else
			managers.system_menu:close("create_lobby")

			local title = managers.localization:text("dialog_error_title")
			local dialog_data = {
				title = title,
				text = managers.localization:text("dialog_err_failed_creating_lobby"),
				button_list = {
					{
						text = managers.localization:text("dialog_ok")
					}
				}
			}

			managers.system_menu:show(dialog_data)
		end
	end

	return EpicMM:create_lobby(f, NetworkMatchMakingEPIC.OPEN_SLOTS, "invisible")
end

function NetworkMatchMakingEPIC:set_num_players(num)
	print("NetworkMatchMakingEPIC:set_num_players", num)

	self._num_players = num

	if self._lobby_attributes then
		self._lobby_attributes.num_players = num

		self.lobby_handler:set_lobby_data(self._lobby_attributes)
	end
end

function NetworkMatchMakingEPIC:set_server_state(state)
	if self._lobby_attributes then
		local state_id = tweak_data:server_state_to_index(state)
		self._lobby_attributes.state = state_id

		if self.lobby_handler then
			self.lobby_handler:set_lobby_data(self._lobby_attributes)

			if not NetworkManager.DROPIN_ENABLED then
				self.lobby_handler:set_joinable(state == "in_lobby")
			end
		end
	end
end

function NetworkMatchMakingEPIC:set_server_joinable(state)
	print("[NetworkMatchMakingEPIC:set_server_joinable]", state)

	self._server_joinable = state

	if self.lobby_handler then
		self.lobby_handler:set_joinable(state)
	end
end

function NetworkMatchMakingEPIC:is_server_joinable()
	return self._server_joinable
end

function NetworkMatchMakingEPIC:server_state_name()
	return tweak_data:index_to_server_state(self._lobby_attributes.state)
end

function NetworkMatchMakingEPIC:no_mod_string()
	return "7d66a433be3a1fe2"
end

function NetworkMatchMakingEPIC:build_mods_list()
	if MenuCallbackHandler:is_modded_client() then
		local mods = nil
		mods = MenuCallbackHandler:build_mods_list()
		local mods_str = ""

		for _, data in ipairs(mods) do
			mods_str = mods_str .. string.format("%s|%s|", unpack(data))
		end

		return mods_str
	else
		return self:no_mod_string()
	end
end

function NetworkMatchMakingEPIC:get_modded_lobby_filter()
	if MenuCallbackHandler:is_modded_client() or Global.game_settings.search_modded_lobbies then
		return false
	else
		return true, self:no_mod_string(), "equal"
	end
end

function NetworkMatchMakingEPIC:get_allow_mods_setting()
	if MenuCallbackHandler:is_modded_client() then
		return 1
	else
		return Global.game_settings.allow_modded_players and 1 or 0
	end
end

function NetworkMatchMakingEPIC:get_allow_mods_filter()
	if MenuCallbackHandler:is_modded_client() then
		return true, 1, "equal"
	else
		return false
	end
end

function NetworkMatchMakingEPIC:set_attributes(settings)
	if not self.lobby_handler then
		return
	end

	local permissions = {
		"public",
		"friend",
		"private"
	}
	local level_index, job_index = self:_split_attribute_number(settings.numbers[1], 1000)
	local lobby_attributes = {
		owner_name = self:username(),
		owner_id = self:userid(),
		owner_account_type = NetworkPeer:account_type_str_from_type(SystemInfo:distribution()),
		owner_account_id = managers.network.account:player_id(),
		owner_level = managers.experience:current_level(),
		level = level_index,
		difficulty = settings.numbers[2],
		permission = settings.numbers[3],
		state = settings.numbers[4] or self._lobby_attributes and self._lobby_attributes.state or 1,
		min_level = settings.numbers[7] or 0,
		num_players = self._num_players or 1,
		drop_in = settings.numbers[6] or 1,
		job_id = job_index or 0,
		kick_option = settings.numbers[8] or 0,
		job_class_min = settings.numbers[9] or 10,
		job_class_max = settings.numbers[9] or 10,
		job_plan = settings.numbers[10],
		mods = self:build_mods_list(),
		allow_mods = self:get_allow_mods_setting(),
		one_down = Global.game_settings.one_down and 1 or 0
	}

	if self._BUILD_SEARCH_INTEREST_KEY then
		lobby_attributes[self._BUILD_SEARCH_INTEREST_KEY] = "true"
	end

	managers.mutators:apply_matchmake_attributes(lobby_attributes)
	managers.crime_spree:apply_matchmake_attributes(lobby_attributes)
	managers.skirmish:apply_matchmake_attributes(lobby_attributes)

	self._lobby_attributes = lobby_attributes

	self.lobby_handler:set_lobby_data(lobby_attributes)
	self.lobby_handler:set_lobby_type(permissions[settings.numbers[3]])
end

function NetworkMatchMakingEPIC:_lobby_to_numbers(lobby)
	return {
		tonumber(lobby:key_value("level")) + 1000 * tonumber(lobby:key_value("job_id")),
		tonumber(lobby:key_value("difficulty")),
		tonumber(lobby:key_value("permission")),
		tonumber(lobby:key_value("state")),
		tonumber(lobby:key_value("num_players")),
		tonumber(lobby:key_value("drop_in")),
		tonumber(lobby:key_value("min_level")),
		tonumber(lobby:key_value("kick_option")),
		tonumber(lobby:key_value("job_class")),
		tonumber(lobby:key_value("job_plan"))
	}
end

function NetworkMatchMakingEPIC:get_lobby_type()
	if not self.lobby_handler then
		return "unknown"
	end

	return self.lobby_handler:lobby_type()
end

function NetworkMatchMakingEPIC:from_host_lobby_re_opened(status)
	print("[NetworkMatchMakingEPIC::from_host_lobby_re_opened]", self._try_re_enter_lobby, status)

	if self._try_re_enter_lobby == "asked" then
		if status then
			self._try_re_enter_lobby = "open"
		else
			self._try_re_enter_lobby = nil

			managers.network.matchmake:leave_game()
		end
	end
end

function NetworkMatchMakingEPIC:set_login_time(login_time)
	self._login_time = login_time
end

function NetworkMatchMakingEPIC:login_time()
	return self._login_time or self:server_time()
end

function NetworkMatchMakingEPIC:server_time()
	return os.time()
end
