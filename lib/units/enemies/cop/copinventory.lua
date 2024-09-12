CopInventory = CopInventory or class(PlayerInventory)

function CopInventory:init(unit)
	CopInventory.super.init(self, unit)

	self._unit = unit
	self._available_selections = {}
	self._equipped_selection = nil
	self._latest_addition = nil
	self._selected_primary = nil
	self._use_data_alias = "npc"
	self._align_places = {
		right_hand = {
			on_body = true,
			obj3d_name = Idstring("a_weapon_right_front")
		},
		back = {
			on_body = true,
			obj3d_name = Idstring("Hips")
		}
	}
	self._listener_id = "CopInventory" .. tostring(unit:key())
end

function CopInventory:add_unit_by_name(new_unit_name, equip)
	local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())

	managers.mutators:modify_value("CopInventory:add_unit_by_name", self)
	self:_chk_spawn_shield(new_unit)

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
		hit_slotmask = managers.slot:get_mask("bullet_impact_targets"),
		hit_player = true,
		user_sound_variant = tweak_data.character[self._unit:base()._tweak_table].weapon_voice,
		alert_AI = true,
		alert_filter = self._unit:brain():SO_access()
	}

	new_unit:base():setup(setup_data)

	if new_unit:base().AKIMBO then
		new_unit:base():create_second_gun(new_unit_name)
	end

	self:add_unit(new_unit, equip)
end

function CopInventory:_chk_spawn_shield(weapon_unit)
	if self._shield_unit_name and not alive(self._shield_unit) then
		self._shield_was_synced = nil
		local align_name = self._shield_align_name or Idstring("a_weapon_left_front")
		local align_obj = self._unit:get_object(align_name)

		if not align_obj then
			Application:error("[CopInventory:_chk_spawn_shield] No align object with name '" .. tostring(align_name) .. "' found in unit. Falling back to orientation object.", self._unit)

			align_obj = self._unit:orientation_object()
			align_name = align_obj:name()
		end

		local shield_unit = World:spawn_unit(Idstring(self._shield_unit_name), align_obj:position(), align_obj:rotation())

		shield_unit:set_enabled(false)
		self:equip_shield(shield_unit, align_name)

		if self._shield_unit and shield_unit:id() ~= -1 and Network:is_server() then
			managers.network:session():send_to_peers_synched("sync_shield_unit_link", self._unit, shield_unit)
		end
	end
end

function CopInventory:add_unit(new_unit, equip)
	CopInventory.super.add_unit(self, new_unit, equip)
	new_unit:set_enabled(true)
	new_unit:set_visible(true)
end

function CopInventory:get_sync_data(sync_data)
	MPPlayerInventory.get_sync_data(self, sync_data)
end

function CopInventory:get_weapon()
	local selection = self._available_selections[self._equipped_selection]
	local unit = selection and selection.unit

	return unit
end

function CopInventory:drop_weapon()
	local selection = self._available_selections[self._equipped_selection]
	local unit = selection and selection.unit

	if unit and unit:damage() then
		unit:unlink()
		unit:damage():run_sequence_simple("enable_body")
		self:_call_listeners("unequip")
		managers.game_play_central:weapon_dropped(unit)

		if unit:base() and unit:base()._second_gun then
			local second_gun = unit:base()._second_gun

			second_gun:unlink()

			if second_gun:damage() then
				second_gun:damage():run_sequence_simple("enable_body")
				managers.game_play_central:weapon_dropped(second_gun)
			end
		end
	end
end

function CopInventory:on_shield_break(attacker_unit)
	if not alive(self._shield_unit) then
		return
	end

	local shield_pos = self._shield_unit:oobb():center()
	local shield_fwd_inv = -self._shield_unit:rotation():y()

	PlayerInventory.on_shield_break(self)

	local switch_data = self._shield_break_data

	if not switch_data then
		return
	end

	if self._unit:base() then
		if switch_data.tweak_table_name_switch and self._unit:base().change_char_tweak then
			self._unit:base():change_char_tweak(switch_data.tweak_table_name_switch)
		end

		if switch_data.stats_name_switch and self._unit:base().change_stats_name then
			self._unit:base():change_stats_name(switch_data.stats_name_switch)
		end
	end

	if switch_data.anim_global_switch and self._unit:movement() and self._unit:movement().set_new_anim_global then
		self._unit:movement():set_new_anim_global(switch_data.anim_global_switch)
	end

	if switch_data.hurt_data and self._unit:character_damage() and self._unit:character_damage().force_hurt then
		attacker_unit = alive(attacker_unit) and attacker_unit or nil
		local has_authority = false
		has_authority = (not Network:is_server() or attacker_unit and attacker_unit:base() and not attacker_unit:base().is_husk_player and false) and attacker_unit and attacker_unit:base() and attacker_unit:base().is_local_player

		if has_authority then
			local attack_data = {
				variant = "bullet",
				type = switch_data.hurt_data.hurt_type or "hurt",
				position = shield_pos,
				direction = shield_fwd_inv,
				col_ray = {
					position = shield_pos,
					ray = shield_fwd_inv
				}
			}

			self._unit:character_damage():force_hurt(attack_data)
		end
	end

	if switch_data.weapon_switch_selection and Network:is_server() and self:equipped_selection() ~= switch_data.weapon_switch_selection and self:is_selection_available(switch_data.weapon_switch_selection) then
		self:equip_selection(switch_data.weapon_switch_selection, true)
		self:set_weapon_enabled(true)
		self:set_visibility_state(true)
	end
end

function CopInventory:anim_clbk_weapon_attached(unit, state)
	print("[CopInventory:anim_clbk_weapon_attached]", state)

	if location == true then
		print("linking")

		local weap_unit = self._equipped_selection.unit
		local weap_align_data = selection.use_data.equip
		local align_place = self._align_places[weap_align_data.align_place]
		local parent_unit = self._unit
		local res = parent_unit:link(align_place.obj3d_name, weap_unit, weap_unit:orientation_object():name())
	else
		print("unlinking")
		self._equipped_selection.unit:unlink()
	end
end

function CopInventory:destroy_all_items()
	CopInventory.super.destroy_all_items(self)
	self:_call_listeners("unequip")
end
