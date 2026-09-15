VehicleCarryOperatorElement = VehicleCarryOperatorElement or class(MissionElement)
VehicleCarryOperatorElement.SAVE_UNIT_POSITION = false
VehicleCarryOperatorElement.SAVE_UNIT_ROTATION = false
VehicleCarryOperatorElement.ACTIONS = {
	"none",
	"add",
	"remove",
	"override"
}
VehicleCarryOperatorElement.LINK_VALUES = {
	{
		layer = "Statics",
		output = true,
		table_value = "elements",
		type = "operator"
	}
}

function VehicleCarryOperatorElement:init(unit)
	VehicleCarryOperatorElement.super.init(self, unit)

	self._hed.operation = "none"
	self._hed.elements = {}
	self._hed.carry_ids = {}

	table.insert(self._save_values, "use_instigator")
	table.insert(self._save_values, "operation")
	table.insert(self._save_values, "elements")
	table.insert(self._save_values, "carry_ids")

	self._actions = VehicleCarryOperatorElement.ACTIONS
end

function VehicleCarryOperatorElement:add_element()
	local ray = managers.editor:unit_by_raycast({
		ray_type = "body",
		sample = true,
		mask = managers.slot:get_mask("vehicles")
	})

	if ray and ray.unit then
		local id = ray.unit:unit_data().unit_id

		if table.contains(self._hed.elements, id) then
			table.delete(self._hed.elements, id)
		else
			table.insert(self._hed.elements, id)
		end
	end
end

function VehicleCarryOperatorElement:add_triggers(vc)
	vc:add_trigger(Idstring("lmb"), callback(self, self, "add_element"))
end

function VehicleCarryOperatorElement:update_editing()
	local ray = managers.editor:unit_by_raycast({
		ray_type = "body",
		sample = true,
		mask = managers.slot:get_mask("vehicles")
	})

	if ray and ray.unit then
		local sequences = managers.sequence:get_sequence_list(ray.unit:name())

		if #sequences > 0 then
			Application:draw(ray.unit, 0, 1, 0)
		end
	end
end

function VehicleCarryOperatorElement:draw_links_unselected(...)
	VehicleCarryOperatorElement.super.draw_links_unselected(self, ...)

	for _, id in ipairs(self._hed.elements) do
		local unit = managers.editor:unit_with_id(id)

		if alive(unit) then
			local params = {
				b = 0.5,
				g = 0,
				r = 0,
				from_unit = unit,
				to_unit = self._unit
			}

			self:_draw_link(params)
			Application:draw(unit, 0, 0, 0.5)
		end
	end
end

function VehicleCarryOperatorElement:draw_links_selected(...)
	VehicleCarryOperatorElement.super.draw_links_selected(self, ...)

	for _, id in ipairs(self._hed.elements) do
		local unit = managers.editor:unit_with_id(id)
		local params = {
			b = 0.5,
			g = 0,
			r = 0,
			from_unit = unit,
			to_unit = self._unit
		}

		self:_draw_link(params)
		Application:draw(unit, 0.25, 1, 0.25)
	end
end

function VehicleCarryOperatorElement:add_unit_list_btn()
	local script = self._unit:mission_element_data().script

	local function f(unit)
		if not unit:mission_element_data() or unit:mission_element_data().script ~= script then
			return
		end

		local id = unit:unit_data().unit_id

		if table.contains(self._hed.elements, id) then
			return false
		end

		return managers.editor:layer("Mission"):category_map()[unit:type():s()]
	end

	local dialog = SelectUnitByNameModal:new("Add Unit", f)

	for _, unit in ipairs(dialog:selected_units()) do
		local id = unit:unit_data().unit_id

		table.insert(self._hed.elements, id)
	end
end

function VehicleCarryOperatorElement:remove_unit_list_btn()
	local function f(unit)
		return table.contains(self._hed.elements, unit:unit_data().unit_id)
	end

	local dialog = SelectUnitByNameModal:new("Remove Unit", f)

	for _, unit in ipairs(dialog:selected_units()) do
		local id = unit:unit_data().unit_id

		table.delete(self._hed.elements, id)
	end
end

function VehicleCarryOperatorElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	local toolbar = EWS:ToolBar(panel, "", "TB_FLAT,TB_NODIVIDER")

	toolbar:add_tool("ADD_UNIT_LIST", "Add unit from unit list", CoreEws.image_path("world_editor\\unit_by_name_list.png"), nil)
	toolbar:connect("ADD_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(self, self, "add_unit_list_btn"), nil)
	toolbar:add_tool("REMOVE_UNIT_LIST", "Remove unit from unit list", CoreEws.image_path("toolbar\\delete_16x16.png"), nil)
	toolbar:connect("REMOVE_UNIT_LIST", "EVT_COMMAND_MENU_SELECTED", callback(self, self, "remove_unit_list_btn"), nil)
	toolbar:realize()
	panel_sizer:add(toolbar, 0, 1, "EXPAND,LEFT")
	self:_build_value_combobox(panel, panel_sizer, "operation", self._actions, "Select an operation for the selected elements")
	self:_build_value_checkbox(panel, panel_sizer, "use_instigator")
	self:_build_panel_carry_rules_list(panel, panel_sizer)
end

function VehicleCarryOperatorElement:_build_panel_carry_rules_list(panel, panel_sizer)
	self._rules_panel = EWS:Panel(panel, "rules_panel", "TAB_TRAVERSAL")
	self._rules_panel_sizer = EWS:BoxSizer("VERTICAL")

	self._rules_panel:set_sizer(self._rules_panel_sizer)
	self._rules_panel:destroy_children()
	panel_sizer:add(self._rules_panel, 1, 1, "EXPAND")

	local list = CoreEws.list_selector({
		name = "Carry ids:",
		tooltip = "Select carry IDs",
		panel = panel,
		sizer = panel_sizer,
		options = tweak_data.carry:get_carry_ids(),
		value = self._hed.carry_ids,
		updated_callback = callback(self, self, "_carry_id_rule_updated")
	})

	self._rules_panel:layout()
	self._panel:layout()
	managers.editor:layer("Mission"):do_layout()
end

function VehicleCarryOperatorElement:_carry_id_rule_updated(carry_ids)
	self._hed.carry_ids = carry_ids or {}
end
