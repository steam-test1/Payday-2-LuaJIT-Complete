CarryUnitElement = CarryUnitElement or class(MissionElement)
CarryUnitElement.SAVE_UNIT_POSITION = false
CarryUnitElement.SAVE_UNIT_ROTATION = false

function CarryUnitElement:init(unit)
	MissionElement.init(self, unit)

	self._hed.elements = {}
	self._hed.operation = "secure"
	self._hed.type_filter = "none"

	table.insert(self._save_values, "operation")
	table.insert(self._save_values, "type_filter")
end

function CarryUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local operations = {
		"remove",
		"freeze",
		"secure",
		"secure_silent",
		"add_to_respawn",
		"filter_only",
		"poof"
	}
	local type_filter_list = table.list_add({
		"none"
	}, tweak_data.carry:get_carry_ids())

	self:_build_value_combobox(panel, panel_sizer, "operation", operations)
	self:_build_value_combobox(panel, panel_sizer, "type_filter", type_filter_list)
end
