CoreUnitSequenceUnitElement = CoreUnitSequenceUnitElement or class(MissionElement)
CoreUnitSequenceUnitElement.LINK_VALUES = {
	{
		output = true,
		table_key = "notify_unit_id",
		table_value = "trigger_list",
		layer = "Statics"
	}
}
UnitSequenceUnitElement = UnitSequenceUnitElement or class(CoreUnitSequenceUnitElement)

function UnitSequenceUnitElement:init(...)
	CoreUnitSequenceUnitElement.init(self, ...)
end

function CoreUnitSequenceUnitElement:init(unit)
	MissionElement.init(self, unit)

	self._hed.trigger_list = {}
	self._hed.only_for_local_player = nil

	table.insert(self._save_values, "trigger_list")
	table.insert(self._save_values, "only_for_local_player")
end

function CoreUnitSequenceUnitElement:update_unselected(...)
	MissionElement.update_unselected(self, ...)
	self:verify_trigger_units()
end

function CoreUnitSequenceUnitElement:update_selected(...)
	MissionElement.update_selected(self, ...)
	self:verify_trigger_units()
	self:_draw_trigger_units(0, 1, 1)
end

function CoreUnitSequenceUnitElement:verify_trigger_units()
	for i = #self._hed.trigger_list, 1, -1 do
		local unit = managers.editor:unit_with_id(self._hed.trigger_list[i].notify_unit_id)

		if not alive(unit) then
			table.remove(self._hed.trigger_list, i)
		end
	end
end

function CoreUnitSequenceUnitElement:draw_links_unselected(...)
	CoreUnitSequenceUnitElement.super.draw_links_unselected(self, ...)
	self:_draw_trigger_units(0, 0.75, 0.75)
end

function CoreUnitSequenceUnitElement:_get_sequence_units()
	local units = {}
	local trigger_name_list = self._unit:damage():get_trigger_name_list()

	if trigger_name_list then
		for _, trigger_name in ipairs(trigger_name_list) do
			local trigger_data = self._unit:damage():get_trigger_data_list(trigger_name)

			if trigger_data and #trigger_data > 0 then
				for _, data in ipairs(trigger_data) do
					if alive(data.notify_unit) then
						table.insert(units, data.notify_unit)
					end
				end
			end
		end
	end

	return units
end

function CoreUnitSequenceUnitElement:_draw_trigger_units(r, g, b)
	for _, unit in ipairs(self:_get_sequence_units()) do
		local params = {
			from_unit = self._unit,
			to_unit = unit,
			r = r,
			g = g,
			b = b
		}

		self:_draw_link(params)
		Application:draw(unit, r, g, b)
	end
end

function CoreUnitSequenceUnitElement:new_save_values(...)
	self:_set_trigger_list()

	return MissionElement.new_save_values(self, ...)
end

function CoreUnitSequenceUnitElement:save_values(...)
	self:_set_trigger_list()
	MissionElement.save_values(self, ...)
end

function CoreUnitSequenceUnitElement:_set_trigger_list()
	self._hed.trigger_list = {}
	local triggers = managers.sequence:get_trigger_list(self._unit:name())

	if #triggers > 0 then
		local trigger_name_list = self._unit:damage():get_trigger_name_list() or {}

		for _, trigger_name in ipairs(trigger_name_list) do
			local trigger_data = self._unit:damage():get_trigger_data_list(trigger_name)

			if trigger_data and #trigger_data > 0 then
				for _, data in ipairs(trigger_data) do
					local notify_unit_data = data.notify_unit:unit_data()

					if notify_unit_data.instance then
						Application:warn("[CoreUnitSequenceUnitElement] Attempted to store an instanced unit to this element", self._unit:name(), " - notify unit ID:", notify_unit_data.unit_id)
					else
						table.insert(self._hed.trigger_list, {
							name = data.trigger_name,
							id = data.id,
							notify_unit_id = notify_unit_data.unit_id,
							time = data.time,
							notify_unit_sequence = data.notify_unit_sequence
						})
					end
				end
			end
		end
	end
end

function CoreUnitSequenceUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	self:_build_value_checkbox(panel, panel_sizer, "only_for_local_player")

	local help = {
		text = "Use the \"Edit Triggable\" interface, which you enable in the down left toolbar, to select and edit which units and sequences you want to run.",
		panel = panel,
		sizer = panel_sizer
	}

	self:add_help_text(help)
end

function CoreUnitSequenceUnitElement:add_to_mission_package()
	managers.editor:add_to_world_package({
		name = "core/units/run_sequence_dummy/run_sequence_dummy",
		category = "units",
		continent = self._unit:unit_data().continent
	})
	managers.editor:add_to_world_package({
		name = "core/units/run_sequence_dummy/run_sequence_dummy.sequence_manager",
		category = "script_data",
		continent = self._unit:unit_data().continent
	})
end
