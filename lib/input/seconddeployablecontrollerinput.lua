SecondDeployableControllerInput = SecondDeployableControllerInput or class()

function SecondDeployableControllerInput:init()
	self._secondary_deployable_t = 0
	self._secondary_deployable_waiting = true
end

function SecondDeployableControllerInput:update(t, dt, controller, input, current_state_name)
	if current_state_name == "carry" then
		return
	end

	input.btn_use_item_press = false

	if input.any_input_pressed and controller:get_input_pressed("use_item") then
		self._secondary_deployable_t = t
		self._secondary_deployable_waiting = true
	elseif (not input.any_input_downed or not controller:get_input_bool("use_item") or self._secondary_deployable_waiting and t - self._secondary_deployable_t > 0.5 and false) and input.any_input_released and controller:get_input_released("use_item") then
		self._secondary_deployable_t = 0

		if self._secondary_deployable_waiting then
			self._secondary_deployable_waiting = false
			input.btn_change_equipment = true
		end
	end
end

