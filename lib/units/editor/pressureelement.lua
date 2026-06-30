PressureUnitElement = PressureUnitElement or class(MissionElement)

function PressureUnitElement:init(unit)
	PressureUnitElement.super.init(self, unit)

	self._hed.points = 0
	self._hed.interval = 0

	table.insert(self._save_values, "points")
	table.insert(self._save_values, "interval")
end

function PressureUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	local interval_params = {
		ctrlr_proportions = 2,
		floats = 0,
		max = 600,
		min = 0,
		name = "Interval:",
		name_proportions = 1,
		tooltip = "Use this to set the interval in seconds when to add new pressure point (0 means it is disabled)",
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.interval
	}
	local interval = CoreEWS.number_controller(interval_params)

	interval:connect("EVT_COMMAND_TEXT_ENTER", callback(self, self, "set_element_data"), {
		value = "interval",
		ctrlr = interval
	})
	interval:connect("EVT_KILL_FOCUS", callback(self, self, "set_element_data"), {
		value = "interval",
		ctrlr = interval
	})

	local pressure_points_params = {
		ctrlr_proportions = 2,
		floats = 0,
		max = 10,
		min = -10,
		name = "Pressure points:",
		name_proportions = 1,
		tooltip = "Can add pressure points or cool down points",
		panel = panel,
		sizer = panel_sizer,
		value = self._hed.points
	}
	local pressure_points = CoreEWS.number_controller(pressure_points_params)

	pressure_points:connect("EVT_COMMAND_TEXT_ENTER", callback(self, self, "set_element_data"), {
		value = "points",
		ctrlr = pressure_points
	})
	pressure_points:connect("EVT_KILL_FOCUS", callback(self, self, "set_element_data"), {
		value = "points",
		ctrlr = pressure_points
	})

	local help = {}

	help.text = "If pressure points ~= 0 the interval value wont be used. Add negative pressure points value will generate cool down points. If interval is 0 it will be disabled."
	help.panel = panel
	help.sizer = panel_sizer

	self:add_help_text(help)
end
