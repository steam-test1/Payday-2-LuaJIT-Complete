SpawnDeployableUnitElement = SpawnDeployableUnitElement or class(MissionElement)

function SpawnDeployableUnitElement:init(unit)
	MissionElement.init(self, unit)

	self._hed.deployable_id = "none"

	table.insert(self._save_values, "deployable_id")
end

function SpawnDeployableUnitElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer

	self:_build_value_combobox(panel, panel_sizer, "deployable_id", {
		"none",
		"doctor_bag",
		"ammo_bag",
		"grenade_crate",
		"bodybags_bag"
	}, "Select a deployable_id to be spawned.")
end

function SpawnDeployableUnitElement:test_element()
	if alive(self._test_spawned_deployable) then
		self._test_spawned_deployable:set_slot(0)
	end

	self._test_spawned_deployable = nil

	if self._hed.deployable_id ~= "none" then
		local equipment_data = tweak_data.equipments[self._hed.deployable_id]
		local dummy_unit_name = equipment_data and equipment_data.dummy_unit or nil

		if self._hed.deployable_id == "grenade_crate" then
			dummy_unit_name = "units/payday2/equipment/gen_equipment_grenade_crate/gen_equipment_grenade_crate"
		end

		if dummy_unit_name then
			self._test_spawned_deployable = safe_spawn_unit(Idstring(dummy_unit_name), self._unit:position(), self._unit:rotation())
		end
	end
end

function SpawnDeployableUnitElement:stop_test_element()
	if alive(self._test_spawned_deployable) then
		self._test_spawned_deployable:set_slot(0)
	end

	self._test_spawned_deployable = nil
end
