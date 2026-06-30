HeistTimerOperatorUnitElement = HeistTimerOperatorUnitElement or class(TimerOperatorUnitElement)
HeistTimerOperatorUnitElement.LINK_VALUES = {
	{
		output = true,
		table_value = "elements",
		type = "operator"
	}
}

function HeistTimerOperatorUnitElement:add_element()
	local ray = managers.editor:unit_by_raycast({
		mask = 10,
		ray_type = "editor"
	})

	if ray and ray.unit and ray.unit:name() == Idstring("units/dev_tools/mission_elements/logic_heist_timer/logic_heist_timer") then
		local id = ray.unit:unit_data().unit_id

		if table.contains(self._hed.elements, id) then
			table.delete(self._hed.elements, id)
		else
			table.insert(self._hed.elements, id)
		end
	end
end

HeistTimerTriggerUnitElement = HeistTimerTriggerUnitElement or class(TimerTriggerUnitElement)
HeistTimerTriggerUnitElement.LINK_VALUES = {
	{
		table_value = "elements",
		type = "trigger"
	}
}

function HeistTimerTriggerUnitElement:add_element()
	local ray = managers.editor:unit_by_raycast({
		mask = 10,
		ray_type = "editor"
	})

	if ray and ray.unit and ray.unit:name() == Idstring("units/dev_tools/mission_elements/logic_heist_timer/logic_heist_timer") then
		local id = ray.unit:unit_data().unit_id

		if table.contains(self._hed.elements, id) then
			table.delete(self._hed.elements, id)
		else
			table.insert(self._hed.elements, id)
		end
	end
end
