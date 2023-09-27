PlayerMovementState = PlayerMovementState or class()
PlayerMovementState.settings_clbks_to_add = {
	hold_to_steelsight = true,
	hold_to_run = true,
	hold_to_duck = true,
	fov_multiplier = true,
	use_headbob = true,
	aim_assist = true,
	tap_to_interact = {
		clbk_name = "_clbk_sett_var_changed"
	},
	tap_to_interact_time = {
		clbk_name = "_clbk_sett_var_changed"
	},
	tap_to_interact_show_text = {
		clbk_name = "_clbk_sett_var_changed"
	},
	accessibility_dot_hide_ads = {
		var_name = "_setting_dot_hide_ads"
	}
}

function PlayerMovementState:init(unit)
	self._unit = unit

	managers.user:check_add_setting_clbks_to_obj(self)
end

function PlayerMovementState:enter(state_data, enter_data)
end

function PlayerMovementState:exit(state_data)
end

function PlayerMovementState:update(t, dt)
end

function PlayerMovementState:chk_action_forbidden(action_type)
	if self._current_action then
		local unblock_data = self._current_action["unblock_" .. action_type .. "_t"]

		if unblock_data and (unblock_data == -1 or managers.player:player_timer():time() < unblock_data) then
			return true
		end
	end
end

function PlayerMovementState:_reset_delay_action()
	self._delay_action = nil
end

function PlayerMovementState:_set_delay_action(action_data)
	if self._delay_action then
		self:_reset_delay_action()
	end

	self._delay_action = action_data
end

function PlayerMovementState:_reset_current_action()
	local previous_action = self._current_action

	if previous_action and self["_end_action_" .. previous_action.type] then
		self["_end_action_" .. previous_action.type](self, previous_action)

		if previous_action.root_blending_disabled then
			self._machine:set_root_blending(true)
		end
	end

	self._current_action = nil
end

function PlayerMovementState:_set_current_action(action_data)
	if self._current_action then
		self:_reset_current_action()
	end

	self._current_action = action_data
end

function PlayerMovementState:interaction_blocked()
	return false
end

function PlayerMovementState:save(data)
end

function PlayerMovementState:pre_destroy()
	if managers.user then
		managers.user:check_remove_setting_clbks_from_obj(self)
	end
end

function PlayerMovementState:destroy()
	if managers.user then
		managers.user:check_remove_setting_clbks_from_obj(self)
	end
end

function PlayerMovementState:_clbk_sett_var_changed(setting_name, old_value, new_value)
	self["_setting_" .. setting_name] = new_value ~= "off" and new_value or nil
end
