core:import("CoreEws")

InteractionUnitElement = InteractionUnitElement or class(MissionElement)
InteractionUnitElement.ON_EXECUTED_ALTERNATIVES = {
	"interacted",
	"interupt",
	"start"
}
InteractionUnitElement.default_distance = 150
InteractionUnitElement.color = Color(0.15, 1, 0, 1)
InteractionUnitElement._axis = {
	x = Vector3(-1, 0, 0),
	y = Vector3(0, -1, 0),
	z = Vector3(0, 0, -1)
}

function InteractionUnitElement:init(unit)
	InteractionUnitElement.super.init(self, unit)

	self._hed.tweak_data_id = "none"
	self._hed.override_timer = -1
	self._hed.host_only = false
	self._hed.debug_mode = false

	table.insert(self._save_values, "tweak_data_id")
	table.insert(self._save_values, "override_timer")
	table.insert(self._save_values, "host_only")

	self._brush = Draw:brush()
end

function InteractionUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	self:_build_value_checkbox(panel, panel_sizer, "debug_mode", "Show area of interaction", "Debug Mode")
	self:_build_value_combobox(panel, panel_sizer, "tweak_data_id", table.list_add({
		"none"
	}, table.map_keys(tweak_data.interaction)))
	self:_build_value_number(panel, panel_sizer, "override_timer", {
		floats = 1,
		min = -1
	}, "Can be used to override the interaction time specified in tweak data. -1 means that it should not override.")
	self:_build_value_checkbox(panel, panel_sizer, "host_only", "Only allow the host of the game to interact with this.", "Host  Only")
	self:_add_help_text("This element creates an interaction. Override time is optional and will replace tweak data timer (-1 means do not overrride). Use disabled/enabled state on element to set active state on interaction.")
end

function InteractionUnitElement:add_to_mission_package()
	managers.editor:add_to_world_package({
		name = "units/dev_tools/mission_elements/point_interaction/interaction_dummy",
		category = "units",
		continent = self._unit:unit_data().continent
	})
	managers.editor:add_to_world_package({
		name = "units/dev_tools/mission_elements/point_interaction/interaction_dummy_nosync",
		category = "units",
		continent = self._unit:unit_data().continent
	})
end

function InteractionUnitElement:update_selected()
	self.super:update_selected()

	if self._hed.debug_mode then
		self:draw_debug()
	end
end

function InteractionUnitElement:draw_debug()
	local data = tweak_data.interaction[self._hed.tweak_data_id]

	if not data then
		return
	end

	local radius = self.default_distance

	if data.interact_distance then
		radius = data.interact_distance
	end

	local position = self._unit:position()
	local color = self.color

	if data.axis then
		local normal = self._axis[data.axis]
		normal = normal:rotate_with(self._unit:rotation())

		self:_draw_debug_halph_sphere(position, radius, color, normal)
	else
		self:_draw_debug_sphere(position, radius, color)
	end
end

function InteractionUnitElement:_draw_debug_sphere(position, radius, color)
	self._brush:set_color(color)
	self._brush:sphere(position, radius, 4)
	Application:draw_sphere(position, radius, color.red, color.green, color.blue)
end

function InteractionUnitElement:_draw_debug_halph_sphere(position, radius, color, normal)
	self._brush:set_color(color)
	self._brush:half_sphere(position, radius, normal, 4)
	Application:draw_sphere(position, radius, color.red, color.green, color.blue)
end
