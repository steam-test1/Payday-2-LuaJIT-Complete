NetworkAccount = NetworkAccount or class()

function NetworkAccount:init()
	self._postprocess_username = callback(self, self, "_standard_username")

	self:set_lightfx()

	self._friends = {}
	self._listener_holder = EventListenerHolder:new()
end

function NetworkAccount:update()
end

function NetworkAccount:create_account(name, password, email)
end

function NetworkAccount:reset_password(name, email)
end

function NetworkAccount:login(name, password, cdkey)
end

function NetworkAccount:logout()
end

function NetworkAccount:register_callback(event, callback)
end

function NetworkAccount:register_post_username(cb)
	self._postprocess_username = cb
end

function NetworkAccount:username()
	return self._postprocess_username(self:username_id())
end

function NetworkAccount:username_id()
	return 0
end

function NetworkAccount:username_by_id()
	return ""
end

function NetworkAccount:player_id()
	return ""
end

function NetworkAccount:is_achievements_fetched()
	return self._achievements_fetched
end

function NetworkAccount:is_player_friend(player_id)
	for _, friend in ipairs(self._friends) do
		if friend.id == player_id then
			return true
		end
	end

	return false
end

function NetworkAccount:add_friend(id, name)
	if self:is_player_friend(id) then
		return false
	end

	table.insert(self._friends, {
		id = id,
		name = name
	})

	return true
end

function NetworkAccount:remove_friend(id)
	for i, friend in ipairs(self._friends) do
		if friend.id == player_id then
			table.remove(self._friends, i)

			return true
		end
	end

	return false
end

function NetworkAccount:get_friend_user(player_id)
	return nil
end

function NetworkAccount:signin_state()
	return "not signed in"
end

function NetworkAccount:set_lightfx()
	if SystemInfo:platform() ~= Idstring("WIN32") then
		return
	end

	local LightFXClass = getmetatable(LightFX)

	if not LightFXClass then
		return
	end

	if managers.user:get_setting("use_lightfx") then
		print("[NetworkAccount:init] Initializing LightFX...")

		self._has_alienware = LightFX:initialize() and LightFX:has_lamps()

		if self._has_alienware then
			LightFX:set_lamps(0, 255, 0, 255)
		end
	else
		self._has_alienware = nil
	end
end

function NetworkAccount:has_alienware()
	return self._has_alienware
end

function NetworkAccount:_call_listeners(event, params)
	if self._listener_holder then
		self._listener_holder:call(event, params)
	end
end

function NetworkAccount:add_overlay_listener(key, events, clbk)
	self._listener_holder:add(key, events, clbk)
end

function NetworkAccount:remove_overlay_listener(key)
	self._listener_holder:remove(key)
end

function NetworkAccount:is_overlay_enabled()
	return false
end

function NetworkAccount:overlay_activate()
end

function NetworkAccount:open_dlc_store_page(dlc_data, context)
	return false
end

function NetworkAccount:open_new_heist_page(new_heist_data)
	return false
end

function NetworkAccount:clan_tag()
	if managers.save.get_profile_setting and managers.save:get_profile_setting("clan_tag") and string.len(managers.save:get_profile_setting("clan_tag")) > 0 then
		return "[" .. managers.save:get_profile_setting("clan_tag") .. "]"
	end

	return ""
end

function NetworkAccount:_standard_username(name)
	return name
end

function NetworkAccount:set_playing(state)
end

function NetworkAccount:set_played_with(peer)
end

function NetworkAccount:_load_globals()
end

function NetworkAccount:_save_globals()
end

function NetworkAccount:inventory_load()
end

function NetworkAccount:inventory_is_loading()
end

function NetworkAccount:inventory_reward(item)
	return false
end

function NetworkAccount:inventory_reward_dlc()
end

function NetworkAccount:inventory_reward_unlock(box, key)
end

function NetworkAccount:inventory_reward_open(item)
end

function NetworkAccount:inventory_outfit_refresh()
end

function NetworkAccount:inventory_outfit_verify(id, outfit_data, outfit_callback)
end

function NetworkAccount:inventory_outfit_signature()
	return ""
end

function NetworkAccount:inventory_repair_list(list)
end

function NetworkAccount:is_ready_to_close()
	return true
end

function NetworkAccount:experience_loaded()
end

local sa_handler_funcs = {
	"init",
	"initialized",
	"store_data",
	"clear_all_stats",
	"stats_store_callback",
	"has_stat",
	"has_stat_float",
	"set_stats",
	"set_stat",
	"set_stat_float",
	"set_stat_avgrate",
	"get_stat",
	"get_stat_float",
	"get_global_stat",
	"get_global_stat_float",
	"get_lifetime_stat",
	"refresh_global_stats",
	"refresh_global_stats_cb",
	"initialized_callback",
	"achievement_store_callback",
	"set_achievement",
	"achievement_attribute",
	"clear_achievement",
	"has_achievement",
	"achievement_unlock_time",
	"achievement_achieved_percent",
	"achievement_icon",
	"indicate_achievement_progress",
	"friends_achievements_cache",
	"friends_achievements_clear",
	"friends_with_achievement",
	"concurrent_users_callback",
	"get_concurrent_users"
}
local sa_handler_stub = class()

for _, func_name in ipairs(sa_handler_funcs) do
	sa_handler_stub[func_name] = function (self)
		print("[NetworkAccount] sa_handler NYI", func_name)
	end
end

function NetworkAccount:get_sa_handler()
	return sa_handler_stub
end

function NetworkAccount:set_stat(key, value)
end

function NetworkAccount:get_stat(key)
	return 0
end

function NetworkAccount:has_stat(key)
	return false
end

function NetworkAccount:achievement_unlock_time(key)
	return nil
end

function NetworkAccount:get_lifetime_stat(key)
	return 0
end

function NetworkAccount:get_global_stat(key, days)
	return 0
end

function NetworkAccount:publish_statistics(stats, force_store)
end
