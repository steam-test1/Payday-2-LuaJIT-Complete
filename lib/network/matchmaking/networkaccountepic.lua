require("lib/network/matchmaking/NetworkAccount")

NetworkAccountEPIC = NetworkAccountEPIC or class(NetworkAccount)
NetworkAccountEPIC.static_lifetime_stat = {
	pda_stat_b = 1,
	pda_stat_a = 1,
	gsu = 4,
	pda_stat_d = 1,
	pda_stat_c = 1
}
NetworkAccountEPIC.lb_diffs = {
	hard = "Hard",
	overkill = "Very Hard",
	overkill_145 = "Overkill",
	normal = "Normal",
	easy_wish = "Easy Wish",
	overkill_290 = "Death Wish",
	sm_wish = "SM Wish",
	easy = "Easy"
}
NetworkAccountEPIC.lb_levels = {
	slaughter_house = "Slaughterhouse",
	diamond_heist = "Diamond Heist",
	hospital = "No Mercy",
	suburbia = "Counterfeit",
	bridge = "Green Bridge",
	secret_stash = "Undercover",
	apartment = "Panic Room",
	bank = "First World Bank",
	heat_street = "Heat Street"
}

function NetworkAccountEPIC:init()
	NetworkAccount.init(self)

	self._listener_holder = EventListenerHolder:new()
	self._gamepad_text_listeners = {}

	self:_set_presences()
	managers.savefile:add_load_done_callback(callback(self, self, "_load_done"))
	self:set_lightfx()
	self:inventory_load()
end

function NetworkAccountEPIC:_load_done(...)
	print("NetworkAccountEPIC:_load_done()", ...)
	self:_set_presences()
end

function NetworkAccountEPIC:update()
	self:_chk_inventory_outfit_refresh()
end

function NetworkAccountEPIC:_set_presences()
	if MenuCallbackHandler:is_modded_client() then
		-- Nothing
	end
end

function NetworkAccountEPIC:set_presences_peer_id(peer_id)
end

function NetworkAccountEPIC:get_win_ratio(difficulty, level)
	local win_ratio = 0

	return win_ratio
end

function NetworkAccount:is_overlay_enabled()
	return EpicOverlayHandler:overlay_enabled()
end

function NetworkAccountEPIC:overlay_activate(...)
	if self._overlay_opened then
		return
	end

	if self:is_overlay_enabled() and EpicOverlayHandler:overlay_activate(...) then
		self._overlay_opened = true

		self:_call_listeners("overlay_open")
		managers.menu:show_epic_separate_window_opened({
			ok_func = callback(self, self, "_on_close_overlay")
		})
	end
end

function NetworkAccountEPIC:_on_close_overlay()
	if not self._overlay_opened then
		return
	end

	self._overlay_opened = false

	self:_call_listeners("overlay_close")
	managers.dlc:chk_content_updated()
	Entitlement:CheckAndVerifyUserEntitlement()
end

function NetworkAccountEPIC:_on_gamepad_text_submitted(submitted, submitted_text)
	print("[NetworkAccountEPIC:_on_gamepad_text_submitted]", "submitted", submitted, "submitted_text", submitted_text)

	for id, clbk in pairs(self._gamepad_text_listeners) do
		clbk(submitted, submitted_text)
	end

	self._gamepad_text_listeners = {}
end

function NetworkAccountEPIC:show_gamepad_text_input(id, callback, params)
	return false
end

function NetworkAccountEPIC:add_gamepad_text_listener(id, clbk)
	if self._gamepad_text_listeners[id] then
		debug_pause("[NetworkAccountEPIC:add_gamepad_text_listener] ID already added!", id, "Old Clbk", self._gamepad_text_listeners[id], "New Clbk", clbk)
	end

	self._gamepad_text_listeners[id] = clbk
end

function NetworkAccountEPIC:remove_gamepad_text_listener(id)
	if not self._gamepad_text_listeners[id] then
		debug_pause("[NetworkAccountEPIC:remove_gamepad_text_listener] ID do not exist!", id)
	end

	self._gamepad_text_listeners[id] = nil
end

function NetworkAccountEPIC:achievements_fetched()
	self._achievements_fetched = true
end

function NetworkAccountEPIC:challenges_loaded()
	self._challenges_loaded = true
end

function NetworkAccountEPIC:experience_loaded()
	self._experience_loaded = true
end

function NetworkAccountEPIC._on_leaderboard_stored(status)
	print("[NetworkAccountEPIC:_on_leaderboard_stored] Leaderboard stored, ", status, ".")
end

function NetworkAccountEPIC._on_leaderboard_mapped()
	print("[NetworkAccountEPIC:_on_leaderboard_stored] Leaderboard mapped.")
end

function NetworkAccountEPIC._on_stats_stored(status)
	print("[NetworkAccountEPIC:_on_stats_stored] Statistics stored, ", status, ". Publishing leaderboard score to Epic!")
end

function NetworkAccountEPIC:get_stat(key)
	return EpicAchievementHandler:get_stat(key)
end

function NetworkAccountEPIC:has_stat(key)
	return true
end

function NetworkAccountEPIC:set_stat(key, value)
	EpicAchievementHandler:set_stat(key, value)
end

function NetworkAccountEPIC:get_lifetime_stat(key)
	return NetworkAccountEPIC.static_lifetime_stat[key] or 0
end

function NetworkAccountEPIC:get_global_stat(key, days)
	local value = 0
	local global_stat = nil

	if days and days < 0 then
		local day = math.abs(days) + 1
		global_stat = {}

		return global_stat[day] or 0
	elseif days then
		global_stat = {}

		for i = days > 1 and 2 or 1, #global_stat do
			value = value + global_stat[i]
		end
	else
		global_stat = {}

		for _, day in ipairs(global_stat) do
			value = value + day
		end
	end

	return value
end

function NetworkAccountEPIC:publish_statistics(stats, force_store)
	if managers.dlc:is_trial() then
		return
	end

	cat_tag_print("NetworkAccountEPIC", "Publishing statistics to Epic!")

	local err = false
	local val, mval, res = nil

	for key, stat in pairs(stats) do
		res = false

		if stat.type == "int" then
			val = 0
			val = math.max(0, val)

			if stat.method == "lowest" then
				if stat.value < val then
					res = false
				else
					res = true
				end
			elseif stat.method == "highest" then
				if val < stat.value then
					res = false
				else
					res = true
				end
			elseif stat.method == "set" then
				res = false
			elseif stat.value > 0 then
				mval = val / 1000 + stat.value / 1000

				if mval >= 2147483 then
					cat_tag_error("NetworkAccountEPIC", "Trying to set too high a value on stat " .. key)

					res = false
				else
					res = false
				end
			else
				res = true
			end
		elseif stat.type == "float" then
			if stat.value > 0 then
				val = 0
				res = false
			else
				res = true
			end
		elseif stat.type == "avgrate" then
			res = false
		end

		if not res then
			cat_tag_error("NetworkAccountEPIC", "Could not set stat " .. key)

			err = true
		end
	end

	if not err then
		-- Nothing
	end
end

function NetworkAccountEPIC._on_disconnected(lobby_id, friend_id)
	cat_tag_print("NetworkAccountEPIC", "on_disconnected", lobby_id, friend_id)

	local cur_game_state = game_state_machine and game_state_machine:current_state()

	if cur_game_state and cur_game_state.on_disconnected_from_service then
		cur_game_state:on_disconnected_from_service()
	end
end

function NetworkAccountEPIC._on_ipc_fail(lobby_id, friend_id)
	cat_tag_print("NetworkAccountEPIC", "on_ipc_fail", lobby_id, friend_id)
end

function NetworkAccountEPIC._on_join_request(lobby_id, friend_id)
	cat_tag_print("NetworkAccountEPIC", "on_join_request", lobby_id, friend_id)

	if managers.network.matchmake.lobby_handler and managers.network.matchmake.lobby_handler:id() == lobby_id then
		return
	end

	if managers.network:session() and managers.network:session():_local_peer_in_lobby() then
		Global.game_settings.single_player = false

		MenuCallbackHandler:_dialog_leave_lobby_yes()
		managers.network.matchmake:set_join_invite_pending(lobby_id)

		return
	elseif game_state_machine:current_state_name() ~= "menu_main" then
		Global.game_settings.single_player = false
		Global.boot_invite = lobby_id

		MenuCallbackHandler:_dialog_end_game_yes()

		return
	else
		if not Global.user_manager.user_index or not Global.user_manager.active_user_state_change_quit then
			Global.boot_invite = lobby_id

			return
		end

		Global.game_settings.single_player = false

		managers.network.matchmake:join_server_with_check(lobby_id, true)
	end
end

function NetworkAccountEPIC._on_server_request(ip, pw)
	cat_tag_print("NetworkAccountEPIC", "on_server_request", ip, pw)
	print("[NetworkAccountEPIC._on_server_request]")
end

function NetworkAccountEPIC._on_connect_fail(ip, pw)
	cat_tag_print("NetworkAccountEPIC", "on_connect_fail", ip, pw)
end

function NetworkAccountEPIC:signin_state()
	if self:local_signin_state() == true then
		return "signed in"
	end

	return "not signed in"
end

function NetworkAccountEPIC:local_signin_state()
	return EpicMM:logged_on()
end

function NetworkAccountEPIC:username_id()
	return EpicMM:username()
end

function NetworkAccountEPIC:username_by_id(id)
	return EpicMM:username(id)
end

function NetworkAccountEPIC:player_id()
	return EpicEntitlements:get_account_id()
end

function NetworkAccountEPIC:is_connected()
	return true
end

function NetworkAccountEPIC:lan_connection()
	return true
end

function NetworkAccountEPIC:set_playing(state)
end

function NetworkAccountEPIC:set_played_with(peer)
end

function NetworkAccountEPIC:get_friend_user(user_id)
	return {
		invite = function (self, lobby_id)
			EpicSocialHub:invite_user_to_lobby(user_id, lobby_id)
		end
	}
end

function NetworkAccountEPIC:is_player_friend(player_id)
	return NetworkAccountEPIC.super.is_player_friend(self, player_id)
end

function NetworkAccountEPIC:_load_globals()
	if Global.epic and Global.epic.account then
		self._outfit_signature = Global.epic.account.outfit_signature and Global.epic.account.outfit_signature:get_data()

		if Global.epic.account.outfit_signature then
			Global.epic.account.outfit_signature:destroy()
		end

		Global.epic.account = nil
	end
end

function NetworkAccountEPIC:_save_globals()
	Global.epic = Global.epic or {}
	Global.epic.account = {
		outfit_signature = self._outfit_signature and Application:create_luabuffer(self._outfit_signature)
	}
end

function NetworkAccountEPIC:is_ready_to_close()
	return not self._inventory_is_loading and not self._inventory_outfit_refresh_requested and not self._inventory_outfit_refresh_in_progress
end

function NetworkAccountEPIC:open_dlc_store_page(dlc_data, context)
	if dlc_data then
		if context == "buy_dlc" and dlc_data.epic_webpage then
			return self:overlay_activate("url", dlc_data.epic_webpage)
		end

		if dlc_data.epic_id then
			local url = "com.epicgames.launcher://store/product/payday-2-c66369"

			return self:overlay_activate("url", url)
		end
	end

	return false
end

function NetworkAccountEPIC:open_new_heist_page(new_heist_data)
	if new_heist_data then
		return false
	end

	return false
end

function NetworkAccountEPIC:inventory_load()
end

function NetworkAccountEPIC:inventory_is_loading()
	return false
end

function NetworkAccountEPIC:inventory_reward(reward_callback, item)
	return false
end

function NetworkAccount:inventory_reward_unlock(safe, safe_instance_id, drill_instance_id, reward_unlock_callback)
end

function NetworkAccount:inventory_reward_open(safe, safe_instance_id, reward_unlock_callback)
end

function NetworkAccountEPIC:inventory_reward_dlc(def_id, reward_promo_callback)
end

function NetworkAccountEPIC:inventory_outfit_refresh()
end

function NetworkAccountEPIC:_inventory_outfit_refresh()
end

function NetworkAccountEPIC:_chk_inventory_outfit_refresh()
	if not self._inventory_outfit_refresh_requested then
		return
	end

	if self._inventory_outfit_refresh_in_progress then
		return
	end

	self._inventory_outfit_refresh_requested = nil

	self:_inventory_outfit_refresh()
end

function NetworkAccountEPIC:inventory_outfit_verify(user_id, outfit_data, outfit_callback)
	return outfit_callback and outfit_callback(nil, false, {})
end

function NetworkAccountEPIC:inventory_outfit_signature()
	return "foobar"
end

function NetworkAccountEPIC:_on_item_converted(error, items_new, items_removed)
end

function NetworkAccountEPIC:inventory_repair_list(list)
end

function NetworkAccountEPIC:_clbk_inventory_load(error, list)
end

function NetworkAccountEPIC:_clbk_tradable_outfit_data(error, outfit_signature)
end

function NetworkAccountEPIC:_on_drill_converted(data, error, items_new, items_removed)
end

function NetworkAccountEPIC:convert_drills_to_safes(list)
end

function NetworkAccountEPIC:achievement_unlock_time(key)
	local res = tonumber(EpicAchievementHandler:achievement_unlock_time(key))

	return res ~= -1 and res or nil
end

function NetworkAccountEPIC:publish_statistics(stats, force_store)
	if managers.dlc:is_trial() then
		return
	end

	local handler = EpicAchievementHandler

	print("[NetworkAccountEPIC:publish_statistics] Publishing statistics to Epic!")

	local err = false

	for key, stat in pairs(stats) do
		local res = nil

		if stat.type == "int" then
			local val = math.max(0, handler:get_stat(key))

			if stat.method == "lowest" then
				if stat.value < val then
					res = handler:set_stat(key, stat.value)
				else
					res = true
				end
			elseif stat.method == "highest" then
				if val < stat.value then
					res = handler:set_stat(key, stat.value)
				else
					res = true
				end
			elseif stat.method == "set" then
				res = handler:set_stat(key, math.clamp(stat.value, 0, 2147483000))
			elseif stat.value > 0 then
				local mval = val / 1000 + stat.value / 1000

				if mval >= 2147483 then
					Application:error("[NetworkAccountEPIC:publish_statistics] Warning, trying to set too high a value on stat " .. key)

					res = handler:set_stat(key, 2147483000)
				else
					res = handler:set_stat(key, val + stat.value)
				end
			else
				res = true
			end
		elseif stat.type == "float" then
			if stat.value > 0 then
				local val = handler:get_stat_float(key)
				res = handler:set_stat_float(key, val + stat.value)
			else
				res = true
			end
		elseif stat.type == "avgrate" then
			res = handler:set_stat_float(key, stat.value, stat.hours)
		end

		if not res then
			Application:error("[NetworkAccountEPIC:publish_statistics] Error, could not set stat " .. key)

			err = true
		end
	end

	if not err then
		handler:store_data()
	end
end
