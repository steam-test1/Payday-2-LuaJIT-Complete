core:module("UserManager")
core:import("CoreEvent")
core:import("CoreTable")

UserManager = UserManager or class()
UserManager.PLATFORM_CLASS_MAP = {}

function UserManager:new(...)
	return (self.PLATFORM_CLASS_MAP[Idstring("WIN32"):key()] or GenericUserManager):new(...)
end

GenericUserManager = GenericUserManager or class()
GenericUserManager.STORE_SETTINGS_ON_PROFILE = false
GenericUserManager.CAN_SELECT_USER = false
GenericUserManager.CAN_SELECT_STORAGE = false
GenericUserManager.NOT_SIGNED_IN_STATE = nil
GenericUserManager.CAN_CHANGE_STORAGE_ONLY_ONCE = true

function GenericUserManager:init()
	self._setting_changed_callback_handler_map = {}
	self._user_state_changed_callback_handler = CoreEvent.CallbackEventHandler:new()
	self._active_user_state_changed_callback_handler = CoreEvent.CallbackEventHandler:new()
	self._storage_changed_callback_handler = CoreEvent.CallbackEventHandler:new()

	if not self:is_global_initialized() then
		Global.user_manager = {
			initializing = true,
			setting_map = {},
			setting_data_map = {},
			setting_data_id_to_name_map = {},
			user_map = {}
		}

		self:setup_setting_map()

		Global.user_manager.initializing = nil
	end
end

function GenericUserManager:init_finalize()
	self:update_all_users()
end

function GenericUserManager:is_global_initialized()
	return Global.user_manager and not Global.user_manager.initializing
end

local is_ps4 = IS_PS4
local is_xb1 = IS_XB1

function GenericUserManager:setup_setting_map()
	self:setup_setting(1, "invert_camera_x", false)
	self:setup_setting(2, "invert_camera_y", false)
	self:setup_setting(3, "camera_sensitivity", 1)
	self:setup_setting(4, "rumble", true)
	self:setup_setting(5, "music_volume", 20)
	self:setup_setting(6, "sfx_volume", 20)
	self:setup_setting(7, "subtitle", true)
	self:setup_setting(8, "brightness", 1)
	self:setup_setting(9, "hold_to_steelsight", true)
	self:setup_setting(10, "hold_to_run", not is_ps4 and not is_xb1 and true)
	self:setup_setting(11, "voice_volume", 0.8)
	self:setup_setting(12, "controller_mod", {})
	self:setup_setting(13, "alienware_mask", true)
	self:setup_setting(14, "developer_mask", true)
	self:setup_setting(15, "voice_chat", true)
	self:setup_setting(16, "push_to_talk", true)
	self:setup_setting(17, "hold_to_duck", false)
	self:setup_setting(18, "video_color_grading", nil)
	self:setup_setting(19, "video_anti_alias", "AA")
	self:setup_setting(20, "video_animation_lod", 3)
	self:setup_setting(21, "video_streaks", true)
	self:setup_setting(22, "mask_set", "clowns")
	self:setup_setting(23, "use_lightfx", false)
	self:setup_setting(24, "fov_standard", 75)
	self:setup_setting(25, "fov_zoom", 75)
	self:setup_setting(26, "camera_zoom_sensitivity", 1)
	self:setup_setting(27, "enable_camera_zoom_sensitivity", false)
	self:setup_setting(28, "light_adaption", true)
	self:setup_setting(29, "menu_theme", "fire")
	self:setup_setting(30, "newest_theme", "fire")
	self:setup_setting(31, "hit_indicator", true)
	self:setup_setting(32, "aim_assist", true)
	self:setup_setting(33, "controller_mod_type", "pc")
	self:setup_setting(34, "objective_reminder", true)
	self:setup_setting(35, "effect_quality", _G.tweak_data.EFFECT_QUALITY)
	self:setup_setting(36, "fov_multiplier", 1)
	self:setup_setting(37, "southpaw", false)
	self:setup_setting(38, "dof_setting", "standard")
	self:setup_setting(39, "fps_cap", 135)
	self:setup_setting(40, "use_headbob", true)
	self:setup_setting(41, "max_streaming_chunk", 4096)
	self:setup_setting(42, "net_packet_throttling", false)
	self:setup_setting(43, "__unused", false)
	self:setup_setting(44, "net_use_compression", true)
	self:setup_setting(45, "net_forwarding", true)
	self:setup_setting(46, "flush_gpu_command_queue", true)
	self:setup_setting(47, "use_thq_weapon_parts", true)
	self:setup_setting(48, "video_ao", "aob")
	self:setup_setting(49, "parallax_mapping", true)
	self:setup_setting(50, "video_aa", not _G.IS_VR and "fxaa" or "off")
	self:setup_setting(51, "workshop", false)
	self:setup_setting(52, "enable_fov_based_sensitivity", true)
	self:setup_setting(53, "quickplay_stealth", true)
	self:setup_setting(54, "quickplay_loud", true)
	self:setup_setting(55, "corpse_limit", 8)
	self:setup_setting(56, "quickplay_mutators", false)
	self:setup_setting(57, "crimenet_filter_friends_only", false)
	self:setup_setting(58, "crimenet_filter_new_servers_only", -1)
	self:setup_setting(59, "crimenet_filter_in_lobby", -1)
	self:setup_setting(60, "crimenet_filter_level_appopriate", true)
	self:setup_setting(61, "crimenet_filter_mutators", false)
	self:setup_setting(62, "crimenet_filter_tactic", -1)
	self:setup_setting(63, "crimenet_filter_max_servers", 30)
	self:setup_setting(64, "crimenet_filter_distance", 2)
	self:setup_setting(65, "crimenet_filter_difficulty", -1)
	self:setup_setting(66, "crimenet_filter_contract", -1)
	self:setup_setting(67, "crimenet_filter_kick", -1)
	self:setup_setting(68, "crimenet_filter_safehouses", false)
	self:setup_setting(69, "camera_sensitivity_x", 1)
	self:setup_setting(70, "camera_sensitivity_y", 1)
	self:setup_setting(71, "enable_camera_sensitivity_separate", false)
	self:setup_setting(73, "throwable_contour", false)
	self:setup_setting(74, "ammo_contour", false)
	self:setup_setting(75, "chromatic_setting", "standard")
	self:setup_setting(76, "mute_heist_vo", false)
	self:setup_setting(77, "camera_zoom_sensitivity_x", 1)
	self:setup_setting(78, "camera_zoom_sensitivity_y", 1)
	self:setup_setting(80, "sticky_aim", true)
	self:setup_setting(82, "crimenet_gamemode_filter", "standard")
	self:setup_setting(83, "crime_spree_lobby_diff", -1)
	self:setup_setting(84, "loading_screen_show_controller", true)
	self:setup_setting(85, "loading_screen_show_hints", true)
	self:setup_setting(86, "crimenet_filter_modded", true)
	self:setup_setting(87, "show_vr_descs", false)
	self:setup_setting(88, "crimenet_filter_one_down", false)
	self:setup_setting(89, "crimenet_filter_weekly_skirmish", false)
	self:setup_setting(90, "crimenet_filter_skirmish_wave", 99)
	self:setup_setting(91, "color_blind_hit_direction", false)
	self:setup_setting(92, "infamy_roman_rank", true)
	self:setup_setting(93, "infamy_roman_card", true)
	self:setup_setting(94, "event_music", true)
	self:setup_setting(95, "accessibility_dot", "off")
	self:setup_setting(96, "accessibility_dot_size", 5)
	self:setup_setting(97, "accessibility_dot_hide_ads", true)
	self:setup_setting(98, "accessibility_screenflash_color", "default")
	self:setup_setting(99, "accessibility_screenflash_color_hit_flash", "off")
	self:setup_setting(100, "accessibility_screenflash_color_blurzone", "default")
	self:setup_setting(101, "accessibility_sounds_tinnitus", false)
	self:setup_setting(102, "toggle_socialhub_hide_code", false)
	self:setup_setting(103, "socialhub_invite", "all")
	self:setup_setting(104, "socialhub_notification", "full")
	self:setup_setting(105, "crimenet_filter_distance_epic", 3)
	self:setup_setting(106, "tap_to_interact", "off")
	self:setup_setting(107, "tap_to_interact_time", 1)
	self:setup_setting(108, "tap_to_interact_show_text", false)
	self:setup_setting(109, "alt_hud_ammo", false)
	self:setup_setting(200, "use_telemetry", false)
	self:setup_setting(201, "use_gamesight", false)
	self:setup_setting(300, "adaptive_quality", true)
	self:setup_setting(301, "window_zoom", true)
	self:setup_setting(302, "arm_animation", true)
end

function GenericUserManager:setup_setting(id, name, default_value)
	assert(not Global.user_manager.setting_data_map[name], "[UserManager] Setting name \"" .. tostring(name) .. "\" already exists.")
	assert(not Global.user_manager.setting_data_id_to_name_map[id], "[UserManager] Setting id \"" .. tostring(id) .. "\" already exists.")

	local setting_data = {
		id = id,
		default_value = self:get_clone_value(default_value)
	}

	Global.user_manager.setting_data_map[name] = setting_data
	Global.user_manager.setting_data_id_to_name_map[id] = name
	Global.user_manager.setting_map[id] = self:get_default_setting(name)
end

function GenericUserManager:update(t, dt)
	return
end

function GenericUserManager:paused_update(t, dt)
	self:update(t, dt)
end

function GenericUserManager:reset_setting_map()
	for name in pairs(Global.user_manager.setting_data_map) do
		self:set_setting(name, self:get_default_setting(name))
	end
end

function GenericUserManager:reset_controls_setting_map()
	local settings = {
		"camera_sensitivity",
		"camera_zoom_sensitivity",
		"enable_camera_zoom_sensitivity",
		"enable_fov_based_sensitivity",
		"invert_camera_y",
		"southpaw",
		"hold_to_steelsight",
		"hold_to_run",
		"hold_to_duck",
		"rumble",
		"aim_assist",
		"controller_mod",
		"controller_mod_type",
		"invert_camera_x",
		"camera_sensitivity_x",
		"camera_sensitivity_y",
		"enable_camera_sensitivity_separate",
		"camera_zoom_sensitivity_x",
		"camera_zoom_sensitivity_y",
		"sticky_aim",
		"tap_to_interact",
		"tap_to_interact_time",
		"tap_to_interact_show_text"
	}

	for _, name in pairs(settings) do
		self:set_setting(name, self:get_default_setting(name))
	end
end

function GenericUserManager:reset_video_setting_map()
	local settings = {
		"subtitle",
		"objective_reminder",
		"brightness",
		"effect_quality",
		"dof_setting",
		"chromatic_setting",
		"video_animation_lod",
		"fps_cap",
		"use_lightfx",
		"fov_multiplier",
		"use_headbob",
		"max_streaming_chunk",
		"flush_gpu_command_queue",
		"video_color_grading",
		"video_anti_alias",
		"video_streaks",
		"fov_standard",
		"fov_zoom",
		"light_adaption",
		"use_thq_weapon_parts",
		"video_ao",
		"parallax_mapping",
		"video_aa",
		"corpse_limit",
		"adaptive_quality",
		"window_zoom",
		"arm_animation"
	}

	for _, name in pairs(settings) do
		self:set_setting(name, self:get_default_setting(name))
	end
end

function GenericUserManager:reset_sound_setting_map()
	local settings = {
		"music_volume",
		"sfx_volume",
		"voice_volume",
		"voice_chat",
		"push_to_talk",
		"mute_heist_vo"
	}

	for _, name in pairs(settings) do
		self:set_setting(name, self:get_default_setting(name))
	end
end

function GenericUserManager:reset_network_setting_map()
	local settings = {
		"net_packet_throttling",
		"net_forwarding",
		"net_use_compression"
	}

	for _, name in pairs(settings) do
		self:set_setting(name, self:get_default_setting(name))
	end
end

function GenericUserManager:reset_user_interface_setting_map()
	local settings = {
		"hit_indicator",
		"color_blind_hit_direction",
		"loading_screen_show_hints",
		"show_vr_descs",
		"throwable_contour",
		"ammo_contour",
		"infamy_roman_rank",
		"infamy_roman_card",
		"alt_hud_ammo"
	}

	for _, name in pairs(settings) do
		self:set_setting(name, self:get_default_setting(name))
	end
end

function GenericUserManager:reset_quickplay_setting_map()
	local settings = {
		"quickplay_stealth",
		"quickplay_loud",
		"quickplay_mutators"
	}

	for _, name in pairs(settings) do
		self:set_setting(name, self:get_default_setting(name))
	end
end

function GenericUserManager:get_clone_value(value)
	if type(value) == "table" then
		return CoreTable.deep_clone(value)
	else
		return value
	end
end

function GenericUserManager:get_setting(name)
	local setting_data = Global.user_manager.setting_data_map[name]

	assert(setting_data, "[UserManager] Tried to get non-existing setting \"" .. tostring(name) .. "\".")

	return Global.user_manager.setting_map[setting_data.id]
end

function GenericUserManager:get_default_setting(name)
	local setting_data = Global.user_manager.setting_data_map[name]

	assert(setting_data, "[UserManager] Tried to get non-existing default setting \"" .. tostring(name) .. "\".")

	return self:get_clone_value(setting_data.default_value)
end

function GenericUserManager:set_setting(name, value, force_change)
	local setting_data = Global.user_manager.setting_data_map[name]

	if not setting_data then
		Application:error("[UserManager] Tried to set non-existing default setting \"" .. tostring(name) .. "\".")

		return
	end

	local old_value = Global.user_manager.setting_map[setting_data.id]

	Global.user_manager.setting_map[setting_data.id] = value

	if self:has_setting_changed(old_value, value) or force_change then
		managers.savefile:setting_changed()

		local callback_handler = self._setting_changed_callback_handler_map[name]

		if callback_handler then
			callback_handler:dispatch(name, old_value, value)
		end
	end
end

function GenericUserManager:add_setting_changed_callback(setting_name, callback_func, trigger_changed_from_default_now)
	assert(Global.user_manager.setting_data_map[setting_name], "[UserManager] Tried to add setting changed callback for non-existing setting \"" .. tostring(setting_name) .. "\".")

	local callback_handler = self._setting_changed_callback_handler_map[setting_name] or CoreEvent.CallbackEventHandler:new()

	self._setting_changed_callback_handler_map[setting_name] = callback_handler

	callback_handler:add(callback_func)

	if trigger_changed_from_default_now then
		local value = self:get_setting(setting_name)
		local default_value = self:get_default_setting(setting_name)

		if self:has_setting_changed(default_value, value) then
			callback_func(setting_name, default_value, value)
		end
	end
end

function GenericUserManager:remove_setting_changed_callback(setting_name, callback_func)
	local callback_handler = self._setting_changed_callback_handler_map[setting_name]

	assert(Global.user_manager.setting_data_map[setting_name], "[UserManager] Tried to remove setting changed callback for non-existing setting \"" .. tostring(setting_name) .. "\".")
	assert(callback_handler, "[UserManager] Tried to remove non-existing setting changed callback for setting \"" .. tostring(setting_name) .. "\".")
	callback_handler:remove(callback_func)
end

function GenericUserManager:has_setting_changed(old_value, new_value)
	if type(old_value) == "table" and type(new_value) == "table" then
		for k, old_sub_value in pairs(old_value) do
			if self:has_setting_changed(new_value[k], old_sub_value) then
				return true
			end
		end

		for k, new_sub_value in pairs(new_value) do
			if self:has_setting_changed(new_sub_value, old_value[k]) then
				return true
			end
		end

		return false
	else
		return old_value ~= new_value
	end
end

function GenericUserManager:check_add_setting_clbks_to_obj(obj, to_add)
	if type(obj) ~= "table" then
		Application:error("[GenericUserManager:check_add_setting_clbks_to_obj] obj isn't a table. ", type(obj), inspect(obj))

		return
	end

	local clbks = to_add or obj.settings_clbks_to_add

	if not clbks then
		Application:error("[GenericUserManager:check_add_setting_clbks_to_obj] No callbacks sent and no 'settings_clbks_to_add' table found in obj.", inspect(obj))

		return
	end

	obj._setting_clbks = obj._setting_clbks or {}

	for sett_name, sett_data in pairs(to_add or obj.settings_clbks_to_add) do
		if not obj._setting_clbks[sett_name] then
			local data = type(sett_data) == "table" and sett_data or {}
			local var_name = data.var_name or "_setting_" .. tostring(sett_name)

			obj[var_name] = self:get_setting(sett_name)
			obj._setting_clbks[sett_name] = data.clbk or data.clbk_name and callback(obj, obj, data.clbk_name) or function(setting_name, old_value, new_value)
				obj[var_name] = new_value
			end

			self:add_setting_changed_callback(sett_name, obj._setting_clbks[sett_name], data.trigger_default_now)
		end
	end
end

function GenericUserManager:check_remove_setting_clbks_from_obj(obj, to_remove)
	if not obj._setting_clbks or not next(obj._setting_clbks) then
		return
	end

	if to_remove then
		local rem_type = type(to_remove)

		if rem_type == "string" or rem_type == "number" then
			if obj._setting_clbks[to_remove] then
				self:remove_setting_changed_callback(to_remove, obj._setting_clbks[to_remove])

				obj._setting_clbks[to_remove] = nil
			end
		elseif rem_type == "table" then
			for sett_name, _ in pairs(to_remove) do
				if obj._setting_clbks[to_remove] then
					self:remove_setting_changed_callback(to_remove, obj._setting_clbks[to_remove])

					obj._setting_clbks[to_remove] = nil
				end
			end
		else
			Application:error("[GenericUserManager:check_remove_setting_clbks_from_obj] Invalid 'to_remove' parameter: " .. rem_type, inspect(to_remove))
		end
	else
		for sett_name, set_clbk in pairs(obj._setting_clbks) do
			self:remove_setting_changed_callback(sett_name, set_clbk)
		end

		obj._setting_clbks = nil
	end
end

function GenericUserManager:is_online_menu()
	return false
end

function GenericUserManager:update_all_users()
	return
end

function GenericUserManager:update_user(user_index, ignore_username_change)
	return
end

function GenericUserManager:add_user_state_changed_callback(callback_func)
	self._user_state_changed_callback_handler:add(callback_func)
end

function GenericUserManager:remove_user_state_changed_callback(callback_func)
	self._user_state_changed_callback_handler:remove(callback_func)
end

function GenericUserManager:add_active_user_state_changed_callback(callback_func)
	self._active_user_state_changed_callback_handler:add(callback_func)
end

function GenericUserManager:remove_active_user_state_changed_callback(callback_func)
	self._active_user_state_changed_callback_handler:remove(callback_func)
end

function GenericUserManager:add_storage_changed_callback(callback_func)
	self._storage_changed_callback_handler:add(callback_func)
end

function GenericUserManager:remove_storage_changed_callback(callback_func)
	self._storage_changed_callback_handler:remove(callback_func)
end

function GenericUserManager:set_user_soft(user_index, platform_id, storage_id, username, signin_state, ignore_username_change)
	local old_user_data = self:_get_user_data(user_index)
	local user_data = {
		user_index = user_index,
		platform_id = platform_id,
		storage_id = storage_id,
		username = username,
		signin_state = signin_state
	}

	Global.user_manager.user_map[user_index] = user_data
end

function GenericUserManager:set_user(user_index, platform_id, storage_id, username, signin_state, ignore_username_change)
	local old_user_data = self:_get_user_data(user_index)
	local user_data = {
		user_index = user_index,
		platform_id = platform_id,
		storage_id = storage_id,
		username = username,
		signin_state = signin_state
	}

	Global.user_manager.user_map[user_index] = user_data

	self:check_user_state_change(old_user_data, user_data, ignore_username_change)
end

function GenericUserManager:check_user_state_change(old_user_data, user_data, ignore_username_change)
	local username = user_data and user_data.username
	local signin_state = user_data and user_data.signin_state or self.NOT_SIGNED_IN_STATE
	local old_signin_state = old_user_data and old_user_data.signin_state or self.NOT_SIGNED_IN_STATE
	local old_username = old_user_data and old_user_data.username
	local username_changed = old_username ~= username
	local old_user_has_signed_out = old_user_data and old_user_data.has_signed_out
	local user_changed, active_user_changed
	local was_signed_in = old_signin_state ~= self.NOT_SIGNED_IN_STATE
	local is_signed_in = signin_state ~= self.NOT_SIGNED_IN_STATE
	local sign_in_state_changed = was_signed_in ~= is_signed_in
	local user_index = user_data and user_data.user_index or old_user_data and old_user_data.user_index
	local was_active_user = user_index == self:get_index()

	if sign_in_state_changed or not ignore_username_change and username_changed or old_user_has_signed_out then
		if was_active_user then
			active_user_changed = true
		end

		if Global.category_print.user_manager then
			if active_user_changed then
				cat_print("user_manager", "[UserManager] Active user changed.")
			else
				cat_print("user_manager", "[UserManager] User index changed.")
			end

			cat_print("user_manager", "[UserManager] Old user: " .. self:get_user_data_string(old_user_data) .. ".")
			cat_print("user_manager", "[UserManager] New user: " .. self:get_user_data_string(user_data) .. ".")
		end

		user_changed = true
	end

	if user_changed then
		if active_user_changed then
			self:active_user_change_state(old_user_data, user_data)
		end

		self._user_state_changed_callback_handler:dispatch(old_user_data, user_data)
	end

	local storage_id = user_data and user_data.storage_id
	local old_storage_id = old_user_data and old_user_data.storage_id
	local ignore_storage_change = self.CAN_CHANGE_STORAGE_ONLY_ONCE and Global.user_manager.storage_changed

	if not ignore_storage_change and (active_user_changed or user_index == self:get_index() and storage_id ~= old_storage_id) then
		self:storage_changed(old_user_data, user_data)

		Global.user_manager.storage_changed = true
	end
end

function GenericUserManager:active_user_change_state(old_user_data, user_data)
	if self:get_active_user_state_change_quit() then
		print("-- Cause loading", self:get_active_user_state_change_quit(), managers.savefile:is_in_loading_sequence())

		local dialog_data = {}

		dialog_data.title = managers.localization:text("dialog_signin_change_title")
		dialog_data.text = managers.localization:text("dialog_signin_change")
		dialog_data.id = "user_changed"

		local ok_button = {}

		ok_button.text = managers.localization:text("dialog_ok")
		dialog_data.button_list = {
			ok_button
		}

		managers.system_menu:add_init_show(dialog_data)
		self:perform_load_start_menu()
	end

	self._active_user_state_changed_callback_handler:dispatch(old_user_data, user_data)
end

function GenericUserManager:perform_load_start_menu()
	managers.system_menu:force_close_all()
	self:set_index(nil)
	managers.menu:on_user_sign_out()

	if managers.groupai then
		managers.groupai:state():set_AI_enabled(false)
	end

	_G.setup:load_start_menu()
	_G.game_state_machine:set_boot_from_sign_out(true)
	self:set_active_user_state_change_quit(false)
end

function GenericUserManager:storage_changed(old_user_data, user_data)
	managers.savefile:storage_changed()
	self._storage_changed_callback_handler:dispatch(old_user_data, user_data)
end

function GenericUserManager:load_platform_setting_map(callback_func)
	if callback_func then
		callback_func(nil)
	end
end

function GenericUserManager:get_user_string(user_index)
	local user_data = self:_get_user_data(user_index)

	return self:get_user_data_string(user_data)
end

function GenericUserManager:get_user_data_string(user_data)
	if user_data then
		local user_index = tostring(user_data.user_index)
		local signin_state = tostring(user_data.signin_state)
		local username = tostring(user_data.username)
		local platform_id = tostring(user_data.platform_id)
		local storage_id = tostring(user_data.storage_id)

		return string.format("User index: %s, Platform id: %s, Storage id: %s, Signin state: %s, Username: %s", user_index, platform_id, storage_id, signin_state, username)
	else
		return "nil"
	end
end

function GenericUserManager:get_index()
	return Global.user_manager.user_index
end

function GenericUserManager:set_index(user_index)
	if Global.user_manager.user_index ~= user_index then
		local old_user_index = Global.user_manager.user_index

		cat_print("user_manager", "[UserManager] Changed user index from " .. tostring(old_user_index) .. " to " .. tostring(user_index) .. ".")

		Global.user_manager.user_index = user_index

		local old_user_data = old_user_index and self:_get_user_data(old_user_index)

		if not user_index and old_user_data and not is_xb1 then
			old_user_data.storage_id = nil
		end

		if not user_index and not is_xb1 then
			for _, data in pairs(Global.user_manager.user_map) do
				data.storage_id = nil
			end
		end

		local user_data = self:_get_user_data(user_index)

		self:check_user_state_change(old_user_data, user_data, false)
	end
end

function GenericUserManager:get_active_user_state_change_quit()
	return Global.user_manager.active_user_state_change_quit
end

function GenericUserManager:set_active_user_state_change_quit(active_user_state_change_quit)
	if not Global.user_manager.active_user_state_change_quit ~= not active_user_state_change_quit then
		cat_print("user_manager", "[UserManager] User state change quits to title screen: " .. tostring(not not active_user_state_change_quit))

		Global.user_manager.active_user_state_change_quit = active_user_state_change_quit
	end
end

function GenericUserManager:get_platform_id(user_index)
	local user_data = self:_get_user_data(user_index)

	return user_data and user_data.platform_id
end

function GenericUserManager:is_signed_in(user_index)
	local user_data = self:_get_user_data(user_index)

	return user_data and user_data.signin_state ~= self.NOT_SIGNED_IN_STATE
end

function GenericUserManager:signed_in_state(user_index)
	local user_data = self:_get_user_data(user_index)

	return user_data and user_data.signin_state
end

function GenericUserManager:get_storage_id(user_index)
	local user_data = self:_get_user_data(user_index)

	return user_data and user_data.storage_id
end

function GenericUserManager:is_storage_selected(user_index)
	if self.CAN_SELECT_STORAGE then
		local user_data = self:_get_user_data(user_index)

		return user_data and not not user_data.storage_id
	else
		return true
	end
end

function GenericUserManager:_get_user_data(user_index)
	local user_index = user_index or self:get_index()

	return user_index and Global.user_manager.user_map[user_index]
end

function GenericUserManager:check_user(callback_func, show_select_user_question_dialog)
	if not self.CAN_SELECT_USER or self:is_signed_in(nil) then
		if callback_func then
			callback_func(true)
		end
	else
		local confirm_callback = callback(self, self, "confirm_select_user_callback", callback_func)

		if show_select_user_question_dialog then
			self._active_check_user_callback_func = callback_func

			local dialog_data = {}

			dialog_data.id = "show_select_user_question_dialog"
			dialog_data.title = managers.localization:text("dialog_signin_title")
			dialog_data.text = managers.localization:text("dialog_signin_question")
			dialog_data.focus_button = 1

			local yes_button = {}

			yes_button.text = managers.localization:text("dialog_yes")
			yes_button.callback_func = callback(self, self, "_success_callback", confirm_callback)

			local no_button = {}

			no_button.text = managers.localization:text("dialog_no")
			no_button.callback_func = callback(self, self, "_fail_callback", confirm_callback)
			dialog_data.button_list = {
				yes_button,
				no_button
			}

			managers.system_menu:show(dialog_data)
		else
			confirm_callback(true)
		end
	end
end

function GenericUserManager:_success_callback(callback_func)
	if callback_func then
		callback_func(true)
	end
end

function GenericUserManager:_fail_callback(callback_func)
	if callback_func then
		callback_func(false)
	end
end

function GenericUserManager:confirm_select_user_callback(callback_func, success)
	self._active_check_user_callback_func = nil

	if success then
		managers.system_menu:show_select_user({
			count = 1,
			callback_func = callback(self, self, "select_user_callback", callback_func)
		})
	elseif callback_func then
		callback_func(false)
	end
end

function GenericUserManager:select_user_callback(callback_func)
	self:update_all_users()

	if callback_func then
		self._active_check_user_callback_func = nil

		callback_func(self:is_signed_in(nil))
	end
end

function GenericUserManager:check_storage(callback_func, auto_select)
	if not self.CAN_SELECT_STORAGE or self:get_storage_id(nil) then
		if callback_func then
			callback_func(true)
		end
	else
		local function wrapped_callback_func(success, result, ...)
			if success then
				self:update_all_users()
			end

			if callback_func then
				callback_func(success, result, ...)
			end
		end

		managers.system_menu:show_select_storage({
			count = 1,
			min_bytes = managers.savefile.RESERVED_BYTES,
			callback_func = wrapped_callback_func,
			auto_select = auto_select
		})
	end
end

function GenericUserManager:get_setting_map()
	return CoreTable.deep_clone(Global.user_manager.setting_map or {})
end

function GenericUserManager:set_setting_map(setting_map)
	for id, value in pairs(setting_map or {}) do
		local name = Global.user_manager.setting_data_id_to_name_map[id]

		self:set_setting(name, value)
	end
end

function GenericUserManager:save_setting_map(setting_map, callback_func)
	if callback_func then
		Appliction:error("[UserManager] Setting map cannot be saved on this platform.")
		callback_func(false)
	end
end

function GenericUserManager:save(data)
	local state = self:get_setting_map()

	data.UserManager = state

	if Global.DEBUG_MENU_ON then
		data.debug_post_effects_enabled = Global.debug_post_effects_enabled
	end

	data.use_telemetry_gamesight_eula_decided = Global.use_telemetry_gamesight_eula_decided
end

function GenericUserManager:load(data, cache_version)
	if cache_version == 0 then
		self:set_setting_map(data)
	else
		self:set_setting_map(data.UserManager)
	end

	if Global.DEBUG_MENU_ON then
		Global.debug_post_effects_enabled = data.debug_post_effects_enabled ~= false
	else
		Global.debug_post_effects_enabled = true
	end

	Global.use_telemetry_gamesight_eula_decided = data.use_telemetry_gamesight_eula_decided

	self:sanitize_settings()
end

function GenericUserManager:sanitize_settings()
	local color_grading = self:get_setting("video_color_grading")
	local color_grading_valid = false

	for _, cg in ipairs(_G.tweak_data.color_grading) do
		if color_grading == cg.value then
			color_grading_valid = true

			break
		end
	end

	if not color_grading_valid then
		self:set_setting("video_color_grading", nil)
	end
end

WinUserManager = WinUserManager or class(GenericUserManager)
UserManager.PLATFORM_CLASS_MAP[Idstring("WIN32"):key()] = WinUserManager

function WinUserManager:init()
	self._init_finalize_index = not self:is_global_initialized()

	GenericUserManager.init(self)
end

function WinUserManager:init_finalize()
	GenericUserManager.init_finalize(self)

	if self._init_finalize_index then
		if Application:editor() then
			self:set_index(1)
		else
			self:set_user(1, nil, true, nil, true, false)
		end

		self._init_finalize_index = nil
	end
end

function WinUserManager:set_index(user_index)
	if IS_EPIC and not self._epic_logged_in_and_ready then
		self._epic_user_index = user_index

		return
	end

	if user_index then
		self:set_user_soft(user_index, nil, true, nil, true, false)
	end

	GenericUserManager.set_index(self, user_index)
end

function WinUserManager:check_user(callback_func, show_select_user_question_dialog)
	if IS_EPIC and not self._epic_logged_in_and_ready then
		if not self._epic_check_user_params then
			self._epic_dlcs_checked = false
			self._epic_achievements_fetched = false
			self._epic_logged_in_and_ready = false
			self._epic_check_user_params = {
				callback_func,
				show_select_user_question_dialog
			}
		end

		return
	end

	GenericUserManager.check_user(self, callback_func, show_select_user_question_dialog)
end

function WinUserManager:update(t, dt)
	if IS_EPIC and self._epic_check_user_params and DistributionMatchmaking:logged_on() then
		if not Global.dlc_manager.ownership_check_called then
			Global.dlc_manager.ownership_check_called = true
		end

		if not Global.achievment_manager.init_called then
			Global.achievment_manager.init_called = true

			managers.achievment.handler:init()
		end

		if not self._epic_dlcs_checked then
			self._epic_dlcs_checked = true
		end

		if not self._epic_achievements_fetched and managers.network.account:is_achievements_fetched() then
			self._epic_achievements_fetched = true
		end

		if self._epic_dlcs_checked and self._epic_achievements_fetched then
			self._epic_logged_in_and_ready = true

			local user_index = self._epic_user_index

			self._epic_user_index = nil

			if user_index then
				self:set_index(user_index)
			end

			local callback_func, show_select_user_question_dialog = unpack(self._epic_check_user_params)

			self._epic_check_user_params = nil

			self:check_user(callback_func, show_select_user_question_dialog)

			return
		end
	end
end
