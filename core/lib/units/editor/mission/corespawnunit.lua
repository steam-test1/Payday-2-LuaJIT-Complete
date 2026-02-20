CoreSpawnUnitUnitElement = CoreSpawnUnitUnitElement or class(MissionElement)
CoreSpawnUnitUnitElement.USES_POINT_ORIENTATION = true
CoreSpawnUnitUnitElement.LINK_VALUES = {
	{
		value = "counter_id",
		type = "counter"
	}
}
SpawnUnitUnitElement = SpawnUnitUnitElement or class(CoreSpawnUnitUnitElement)

function SpawnUnitUnitElement:init(...)
	CoreSpawnUnitUnitElement.init(self, ...)
end

function CoreSpawnUnitUnitElement:init(unit)
	MissionElement.init(self, unit)

	self._hed.unit_name = "none"
	self._hed.unit_spawn_sequence = "none"
	self._hed.unit_spawn_settled = false
	self._hed.unit_spawn_amount = 1
	self._hed.unit_spawn_velocity = 0
	self._hed.unit_spawn_mass = 0
	self._hed.unit_spawn_dir = Vector3(0, 0, 1)
	self._hed.counter_id = nil

	table.insert(self._save_values, "unit_name")
	table.insert(self._save_values, "unit_spawn_sequence")
	table.insert(self._save_values, "unit_spawn_settled")
	table.insert(self._save_values, "unit_spawn_amount")
	table.insert(self._save_values, "unit_spawn_velocity")
	table.insert(self._save_values, "unit_spawn_mass")
	table.insert(self._save_values, "unit_spawn_dir")
	table.insert(self._save_values, "counter_id")

	self._test_units = {}
	self._unit_sequences = {
		"none"
	}
end

function CoreSpawnUnitUnitElement:set_element_data(params, ...)
	CoreSpawnUnitUnitElement.super.set_element_data(self, params, ...)

	if params.value == "unit_name" then
		self:_set_unit_name_data()
	end
end

function CoreSpawnUnitUnitElement:selected()
	self:_set_unit_name_data()
	CoreSpawnUnitUnitElement.super.selected(self)
end

function CoreSpawnUnitUnitElement:_set_unit_name_data()
	self._unit_sequences = {
		"none"
	}

	if self._hed.unit_name == "none" then
		self._hed.unit_spawn_sequence = "none"

		CoreEWS.change_combobox_value(self._unit_spawn_sequence_combobox_params, self._hed.unit_spawn_sequence)

		return
	end

	self._unit_sequences = self:_get_unit_sequences(self._hed.unit_name)

	CoreEWS.update_combobox_options(self._unit_spawn_sequence_combobox_params, self._unit_sequences)
	CoreEWS.change_combobox_value(self._unit_spawn_sequence_combobox_params, self._hed.unit_spawn_sequence)
end

function CoreSpawnUnitUnitElement:_get_unit_sequences(unit_name)
	local t = {
		"none"
	}
	local unit = safe_spawn_unit(unit_name, self._unit:position(), self._unit:rotation())

	if alive(unit) then
		local sequence_list = managers.sequence:get_sequence_list(unit:name())

		for _, sequence_id in ipairs(sequence_list) do
			table.insert(t, sequence_id)
		end

		unit:set_slot(0)
	end

	return t
end

function CoreSpawnUnitUnitElement:update_editing()
end

function CoreSpawnUnitUnitElement:draw_links(t, dt, selected_unit, all_units)
	CoreSpawnUnitUnitElement.super.draw_links(self, t, dt, selected_unit, all_units)

	if self._hed.counter_id then
		local unit = all_units[self._hed.counter_id]
		local draw = not selected_unit or unit == selected_unit or self._unit == selected_unit

		if draw then
			self:_draw_link({
				g = 0.85,
				b = 0.25,
				r = 0.85,
				from_unit = unit,
				to_unit = self._unit
			})
		end
	end
end

function CoreSpawnUnitUnitElement:add_element()
	local ray = managers.editor:unit_by_raycast({
		ray_type = "editor",
		mask = 10
	})

	if ray and ray.unit and ray.unit:name() == Idstring("core/units/mission_elements/logic_counter/logic_counter") then
		local id = ray.unit:unit_data().unit_id

		if self._hed.counter_id == id then
			self._hed.counter_id = nil
		else
			self._hed.counter_id = id
		end
	end
end

function CoreSpawnUnitUnitElement:add_triggers(vc)
	vc:add_trigger(Idstring("lmb"), callback(self, self, "add_element"))
end

function CoreSpawnUnitUnitElement:remove_links(unit)
	if self._hed.counter_id and self._hed.counter_id == unit:unit_data().unit_id then
		self._hed.counter_id = nil
	end
end

function CoreSpawnUnitUnitElement:_add_counter_filter(unit)
	return unit:name() == Idstring("core/units/mission_elements/logic_counter/logic_counter")
end

function CoreSpawnUnitUnitElement:_set_counter_id(unit)
	self._hed.counter_id = unit:unit_data().unit_id
end

function CoreSpawnUnitUnitElement:_remove_counter_filter(unit)
	return self._hed.counter_id == unit:unit_data().unit_id
end

function CoreSpawnUnitUnitElement:_remove_counter_id(unit)
	self._hed.counter_id = nil
end

function CoreSpawnUnitUnitElement:test_element()
	if self._hed.unit_name ~= "none" then
		for i = 1, self._hed.unit_spawn_amount do
			local unit = safe_spawn_unit(self._hed.unit_name, self._unit:position(), self._unit:rotation())

			table.insert(self._test_units, unit)
			unit:push(self._hed.unit_spawn_mass, self._hed.unit_spawn_dir * self._hed.unit_spawn_velocity)
		end
	end
end

function CoreSpawnUnitUnitElement:stop_test_element()
	for _, unit in ipairs(self._test_units) do
		if alive(unit) then
			World:delete_unit(unit)
		end
	end

	self._test_units = {}
end

function CoreSpawnUnitUnitElement:update_selected(time, rel_time)
	Application:draw_arrow(self._unit:position(), self._unit:position() + self._hed.unit_spawn_dir * 400, 0.75, 0.75, 0.75)
end

function CoreSpawnUnitUnitElement:update_editing(time, rel_time)
	local kb = Input:keyboard()
	local speed = 60 * rel_time

	if kb:down(Idstring("left")) then
		self._hed.unit_spawn_dir = self._hed.unit_spawn_dir:rotate_with(Rotation(speed, 0, 0))
	end

	if kb:down(Idstring("right")) then
		self._hed.unit_spawn_dir = self._hed.unit_spawn_dir:rotate_with(Rotation(-speed, 0, 0))
	end

	if kb:down(Idstring("up")) then
		self._hed.unit_spawn_dir = self._hed.unit_spawn_dir:rotate_with(Rotation(0, 0, speed))
	end

	if kb:down(Idstring("down")) then
		self._hed.unit_spawn_dir = self._hed.unit_spawn_dir:rotate_with(Rotation(0, 0, -speed))
	end

	local from = self._unit:position()
	local to = from + self._hed.unit_spawn_dir * 100000
	local ray = managers.editor:unit_by_raycast({
		from = from,
		to = to,
		mask = managers.slot:get_mask("statics_layer")
	})

	if ray and ray.unit then
		Application:draw_sphere(ray.position, 25, 1, 0, 0)
	end
end

function CoreSpawnUnitUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local unit_options = {
		"none"
	}

	for name, _ in pairs(managers.editor:layers().Statics:get_unit_map()) do
		table.insert(unit_options, managers.editor:get_real_name(name))
	end

	self:_build_add_remove_static_unit_from_list(panel, panel_sizer, {
		single = true,
		add_filter = callback(self, self, "_add_counter_filter"),
		add_result = callback(self, self, "_set_counter_id"),
		remove_filter = callback(self, self, "_remove_counter_filter"),
		remove_result = callback(self, self, "_remove_counter_id")
	})
	self:_build_value_combobox(panel, panel_sizer, "unit_name", unit_options, "Select a unit from the combobox")

	local _, params = self:_build_value_combobox(panel, panel_sizer, "unit_spawn_sequence", self._unit_sequences, "Select a sequence from the combobox")
	self._unit_spawn_sequence_combobox_params = params

	self:_build_value_checkbox(panel, panel_sizer, "unit_spawn_settled", "Will attempt to settle to the ground directly below it.")
	self:_build_value_number(panel, panel_sizer, "unit_spawn_amount", {
		floats = 0,
		min = 1
	}, "How many rabbits will come out of this hat.")
	self:_build_value_number(panel, panel_sizer, "unit_spawn_velocity", {
		floats = 0,
		min = 0
	}, "Use this to add a velocity to a physic push on the spawned unit(will need mass as well)", "Velocity")
	self:_build_value_number(panel, panel_sizer, "unit_spawn_mass", {
		floats = 0,
		min = 0
	}, "Use this to add a mass to a physic push on the spawned unit(will need velocity as well)", "Mass")
	self:_add_help_text([[
Select a unit to be spawned in the unit combobox.

Add velocity and mass if you want to give the spawned unit a push as if it was hit by an object of mass mass, traveling at a velocity of velocity relative to the unit (both values are required to give the push)

Body slam (80 kg, 10 m/s)
Fist punch (8 kg, 10 m/s)
Bullet hit (10 g, 900 m/s)]])
end

function CoreSpawnUnitUnitElement:add_to_mission_package()
	managers.editor:add_to_world_package({
		category = "units",
		name = self._hed.unit_name,
		continent = self._unit:unit_data().continent
	})
end
