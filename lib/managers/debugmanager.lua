core:module("DebugManager")
core:import("CoreDebugManager")
core:import("CoreClass")

local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_set_l = mvector3.set_length
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_rot = mvector3.rotate_with
local mvec3_rand_orth = mvector3.random_orthogonal
local mvec3_lerp = mvector3.lerp
local mrot_axis_angle = mrotation.set_axis_angle
DebugManager = DebugManager or class(CoreDebugManager.DebugManager)

function DebugManager:qa_debug(username)
	self:set_qa_debug_enabled(username, true)
end

function DebugManager:get_qa_debug_enabled()
	return self._qa_debug_enabled
end

function DebugManager:set_qa_debug_enabled(username, enabled)
	enabled = not not enabled
	local cat_print_list = {
		"qa"
	}

	for _, cat in ipairs(cat_print_list) do
		Global.category_print[cat] = enabled
	end

	self._qa_debug_enabled = enabled
end

CoreClass.override_class(CoreDebugManager.DebugManager, DebugManager)

function DebugManager:test_vector(x, y, z)
	local enemy_vec = Vector3()
	local temp_rot1 = Vector3()
	local pos = Vector3(75, 0, 0)

	mvec3_set(enemy_vec, pos)
	mvec3_sub(enemy_vec, Vector3(100, 0, 0))
	print(enemy_vec)

	local error_vec = Vector3()

	mvec3_cross(error_vec, enemy_vec, math.UP)
	print(error_vec)
	mrot_axis_angle(temp_rot1, enemy_vec, math.random(360))
	print(temp_rot1)
	mvec3_rot(error_vec, temp_rot1)
	print(error_vec)

	local error_vec_len = 31 + 20 * math.random() + 40 * math.random() * 1

	print(error_vec_len)
	mvec3_set_l(error_vec, error_vec_len)
	print(error_vec)
	mvec3_add(error_vec, pos)
	print(error_vec)
end

function DebugManager:test_tel_gs(...)
	local telemetry_state = true
	local gamesight_state = true

	local function telemetry_toggle_func(state)
		managers.user:set_setting("use_telemetry", state, true)
		_G.MenuCallbackHandler:save_settings()

		telemetry_state = state
	end

	local function gamesight_toggle_func(state)
		managers.user:set_setting("use_gamesight", state, true)
		_G.MenuCallbackHandler:save_settings()

		gamesight_state = state
	end

	local function accept_func()
		managers.user:set_setting("use_telemetry", telemetry_state, true)
		managers.user:set_setting("use_gamesight", gamesight_state, true)
		_G.MenuCallbackHandler:save_settings()
		_G.Telemetry:send_on_game_launch()
	end

	Global.use_telemetry_gamesight_decided = true

	managers.savefile:setting_changed()
	managers.menu:show_accept_gamesight_telemetry({
		telemetry_func = telemetry_toggle_func,
		gamesight_func = gamesight_toggle_func,
		accept_func = accept_func
	})
end

function DebugManager:test_tel_gs_new(...)
	local function gamesight_accept_func()
		managers.user:set_setting("use_gamesight", true, true)
		_G.MenuCallbackHandler:save_settings()
	end

	local function gamesight_deny_func()
		managers.user:set_setting("use_gamesight", false, true)
		_G.MenuCallbackHandler:save_settings()
	end

	local function telemetry_accept_func()
		managers.user:set_setting("use_telemetry", true, true)
		_G.MenuCallbackHandler:save_settings()
		managers.menu:show_accept_gamesight_new({
			accept_func = gamesight_accept_func,
			deny_func = gamesight_deny_func
		})
	end

	local function telemetry_deny_func()
		managers.user:set_setting("use_telemetry", false, true)
		_G.MenuCallbackHandler:save_settings()
		managers.menu:show_accept_gamesight_new({
			accept_func = gamesight_accept_func,
			deny_func = gamesight_deny_func
		})
	end

	local function eula_accept_func()
		managers.menu:show_accept_telemetry_new({
			accept_func = telemetry_accept_func,
			deny_func = telemetry_deny_func
		})
	end

	local function eula_deny_func()
		_G.setup:quit()
	end

	managers.menu:show_accept_policy_new({
		accept_func = eula_accept_func,
		deny_func = eula_deny_func
	})
end

function DebugManager:look_at_object(pos, distance)
	_G.setup:freeflight():_set_camera(pos + Vector3(distance, distance, distance), Rotation(120, -30, 0))
end
