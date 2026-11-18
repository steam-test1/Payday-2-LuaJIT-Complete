HuskTeamAIInventory = HuskTeamAIInventory or class(HuskCopInventory)
HuskTeamAIInventory.preload_mask = TeamAIInventory.preload_mask
HuskTeamAIInventory.clbk_mask_unit_loaded = TeamAIInventory.clbk_mask_unit_loaded
HuskTeamAIInventory._reset_mask_visibility = TeamAIInventory._reset_mask_visibility
HuskTeamAIInventory.set_visibility_state = TeamAIInventory.set_visibility_state
HuskTeamAIInventory.update_ap_ammo = TeamAIInventory.update_ap_ammo
HuskTeamAIInventory._ensure_weapon_visibility = TeamAIInventory._ensure_weapon_visibility

function HuskTeamAIInventory:_chk_setup_data(setup_data)
	if setup_data.alert_filter then
		setup_data.alert_filter = nil
	end

	setup_data.alert_AI = false
	setup_data.hit_slotmask = managers.slot:get_mask("bullet_impact_targets_no_AI")
	setup_data.user_sound_variant = setup_data.user_sound_variant or self._unit:base():char_tweak().weapon_voice
end

function HuskTeamAIInventory:add_unit_by_name(new_unit_name, equip)
	local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())
	local ignore_units = {
		self._unit,
		new_unit
	}

	if self._ignore_units then
		for idx, ig_unit in pairs(self._ignore_units) do
			table.insert(ignore_units, ig_unit)
		end
	end

	local setup_data = {}

	setup_data.user_unit = self._unit
	setup_data.ignore_units = ignore_units
	setup_data.expend_ammo = false
	setup_data.hit_slotmask = managers.slot:get_mask("bullet_impact_targets_no_AI")
	setup_data.hit_player = false
	setup_data.user_sound_variant = self._unit:base():char_tweak().weapon_voice

	self:_chk_setup_data(setup_data)
	new_unit:base():setup(setup_data)
	TeamAIInventory.add_unit(self, new_unit, equip)
end

function HuskTeamAIInventory:pre_destroy(unit)
	HuskTeamAIInventory.super.pre_destroy(self, unit)
	TeamAIInventory._unload_mask(self)
end

function HuskTeamAIInventory:add_unit(new_unit, equip)
	HuskTeamAIInventory.super.add_unit(self, new_unit, equip)
	self:_ensure_weapon_visibility(new_unit)
end

function HuskTeamAIInventory:equip_selection(selection_index, instant)
	local res = HuskTeamAIInventory.super.equip_selection(self, selection_index, instant)

	self:_ensure_weapon_visibility()

	return res
end
