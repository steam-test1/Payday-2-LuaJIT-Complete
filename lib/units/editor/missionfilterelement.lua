MissionFilterUnitElement = MissionFilterUnitElement or class(MissionElement)
MissionFilterUnitElement.SAVE_UNIT_POSITION = false
MissionFilterUnitElement.SAVE_UNIT_ROTATION = false
MissionFilterUnitElement.MAX_FLAGS = 5

function MissionFilterUnitElement:init(unit)
	MissionFilterUnitElement.super.init(self, unit)

	for i = 1, MissionFilterUnitElement.MAX_FLAGS or 5 do
		self._hed[i] = true

		table.insert(self._save_values, i)
	end
end

function MissionFilterUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	for i = 1, MissionFilterUnitElement.MAX_FLAGS or 5 do
		local var_idx = EWS:CheckBox(panel, "Mission filter " .. i, "")

		var_idx:set_value(self._hed[i])
		var_idx:connect("EVT_COMMAND_CHECKBOX_CLICKED", callback(self, self, "set_element_data"), {
			value = 1,
			ctrlr = var_idx
		})
		panel_sizer:add(var_idx, 0, 0, "EXPAND")
	end
end
