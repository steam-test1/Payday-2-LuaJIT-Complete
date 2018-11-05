WhisperStateUnitElement = WhisperStateUnitElement or class(MissionElement)

function WhisperStateUnitElement:init(unit)
	WhisperStateUnitElement.super.init(self, unit)

	self._hed.state = false

	table.insert(self._save_values, "state")
end

function WhisperStateUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local state = EWS:CheckBox(panel, "Whisper state", "")

	state:set_value(self._hed.state)
	state:connect("EVT_COMMAND_CHECKBOX_CLICKED", callback(self, self, "set_element_data"), {
		value = "state",
		ctrlr = state
	})
	panel_sizer:add(state, 0, 0, "EXPAND")

	local help = {
		text = "Sets if whisper state should be turned on or off.",
		panel = panel,
		sizer = panel_sizer
	}

	self:add_help_text(help)
end

