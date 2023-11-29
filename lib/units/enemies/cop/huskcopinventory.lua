HuskCopInventory = HuskCopInventory or class(HuskPlayerInventory)

function HuskCopInventory:init(unit)
	CopInventory.init(self, unit)
end

function HuskCopInventory:set_visibility_state(state)
	CopInventory.set_visibility_state(self, state)
end

function HuskCopInventory:add_unit_by_name(new_unit_name, equip)
	local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())

	managers.mutators:modify_value("CopInventory:add_unit_by_name", self)
	CopInventory._chk_spawn_shield(self, new_unit)

	local ignore_units = {
		self._unit,
		new_unit
	}

	if self._ignore_units then
		for idx, ig_unit in pairs(self._ignore_units) do
			table.insert(ignore_units, ig_unit)
		end
	end

	local setup_data = {
		user_unit = self._unit,
		ignore_units = ignore_units,
		expend_ammo = false,
		hit_slotmask = managers.slot:get_mask("bullet_impact_targets_no_AI"),
		hit_player = true,
		user_sound_variant = tweak_data.character[self._unit:base()._tweak_table].weapon_voice
	}

	new_unit:base():setup(setup_data)

	if new_unit:base().AKIMBO then
		new_unit:base():create_second_gun(new_unit_name)
	end

	CopInventory.add_unit(self, new_unit, equip)
end

function HuskCopInventory:get_weapon()
	CopInventory.get_weapon(self)
end

function HuskCopInventory:drop_weapon()
	CopInventory.drop_weapon(self)
end

function HuskCopInventory:drop_shield()
	CopInventory.drop_shield(self)
end

function HuskCopInventory:destroy_all_items()
	CopInventory.destroy_all_items(self)
end

function HuskCopInventory:add_unit(new_unit, equip)
	CopInventory.add_unit(self, new_unit, equip)
end

function HuskCopInventory:set_visibility_state(state)
	CopInventory.set_visibility_state(self, state)
end

function HuskCopInventory:on_shield_break(...)
	CopInventory.on_shield_break(self, ...)
end

function HuskCopInventory:from_server_link_shield(shield_unit)
	local cur_shield = self._shield_unit
	self._shield_unit_name = nil
	local vis_state = false
	local enabled_state = false

	if alive(cur_shield) then
		if cur_shield:visible() then
			vis_state = true
		else
			vis_state = false
		end

		if cur_shield:enabled() then
			enabled_state = true
		else
			enabled_state = false
		end

		self:unequip_shield()

		if cur_shield:id() == -1 then
			cur_shield:set_slot(0)
		else
			cur_shield:set_enabled(false)
		end
	else
		local equipped_weapon = self:equipped_unit()

		if alive(equipped_weapon) then
			if equipped_weapon:visible() then
				vis_state = true
			else
				vis_state = false
			end

			if equipped_weapon:enabled() then
				enabled_state = true
			else
				enabled_state = false
			end
		end
	end

	local align_name = self._shield_align_name or Idstring("a_weapon_left_front")
	local align_obj = self._unit:get_object(align_name)

	if not align_obj then
		Application:error("[HuskCopInventory:from_server_link_shield] No align object with name '" .. tostring(align_name) .. "' found in unit. Falling back to orientation object.", self._unit)

		align_obj = self._unit:orientation_object()
		align_name = align_obj:name()
	end

	self:equip_shield(shield_unit, align_name)

	if self._shield_unit then
		self:set_shield_visible(vis_state)
		self:set_shield_enabled(enabled_state)
	else
		Application:error("[HuskCopInventory:from_server_link_shield] Failed to equip synced shield.", self._unit, shield_unit)
	end
end
