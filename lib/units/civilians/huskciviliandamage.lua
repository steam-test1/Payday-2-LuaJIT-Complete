HuskCivilianDamage = HuskCivilianDamage or class(HuskCopDamage)
HuskCivilianDamage._HEALTH_INIT = CivilianDamage._HEALTH_INIT
HuskCivilianDamage.damage_bullet = CivilianDamage.damage_bullet
HuskCivilianDamage.damage_melee = CivilianDamage.damage_melee
HuskCivilianDamage.damage_tase = CivilianDamage.damage_tase
HuskCivilianDamage.sync_damage_tase = CivilianDamage.sync_damage_tase
HuskCivilianDamage._play_civilian_tase_effect = CivilianDamage._play_civilian_tase_effect
HuskCivilianDamage._tase_effect_clbk = CivilianDamage._tase_effect_clbk
HuskCivilianDamage.no_intimidation_by_dmg = CivilianDamage.no_intimidation_by_dmg
HuskCivilianDamage.healed = CivilianDamage.healed
HuskCivilianDamage.check_medic_heal = CivilianDamage.check_medic_heal
HuskCivilianDamage.do_medic_heal = CivilianDamage.do_medic_heal
HuskCivilianDamage.do_medic_heal_and_action = CivilianDamage.do_medic_heal_and_action

function HuskCivilianDamage:_on_damage_received(damage_info)
	CivilianDamage._on_damage_received(self, damage_info)
end

function HuskCivilianDamage:_unregister_from_enemy_manager(damage_info)
	CivilianDamage._unregister_from_enemy_manager(self, damage_info)
end

function HuskCivilianDamage:die(attack_data)
	managers.modifiers:run_func("OnCivilianKilled", self._unit)
	self:_remove_debug_gui()
	self._unit:base():set_slot(self._unit, 17)

	self._health = 0
	self._health_ratio = 0
	self._dead = true

	self:set_mover_collision_state(false)

	if self._tmp_invulnerable_clbk_key then
		managers.enemy:remove_delayed_clbk(self._tmp_invulnerable_clbk_key)

		self._tmp_invulnerable_clbk_key = nil
	end
end

function HuskCivilianDamage:damage_explosion(attack_data)
	if attack_data.variant == "explosion" then
		attack_data.damage = 10
	end

	return CopDamage.damage_explosion(self, attack_data)
end

function HuskCivilianDamage:damage_fire(attack_data)
	if attack_data.variant == "fire" then
		attack_data.damage = 10
	end

	return CopDamage.damage_fire(self, attack_data)
end
