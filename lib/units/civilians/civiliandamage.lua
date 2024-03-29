CivilianDamage = CivilianDamage or class(CopDamage)

function CivilianDamage:init(unit)
	CivilianDamage.super.init(self, unit)

	self._pickup = nil
end

function CivilianDamage:check_medic_heal(...)
end

function CivilianDamage:do_medic_heal(...)
end

function CivilianDamage:do_medic_heal_and_action(...)
end

function CivilianDamage:healed(...)
	return false
end

function CivilianDamage:die(attack_data)
	managers.modifiers:run_func("OnCivilianKilled", self._unit)
	self:_remove_debug_gui()
	self._unit:base():set_slot(self._unit, 17)
	self:drop_pickup()

	if self._unit:unit_data().mission_element then
		self._unit:unit_data().mission_element:event("death", self._unit)

		if not self._unit:unit_data().alerted_event_called then
			self._unit:unit_data().alerted_event_called = true

			self._unit:unit_data().mission_element:event("alerted", self._unit)
		end
	end

	self._health = 0
	self._health_ratio = 0
	self._dead = true

	self:set_mover_collision_state(false)

	if self._tmp_invulnerable_clbk_key then
		managers.enemy:remove_delayed_clbk(self._tmp_invulnerable_clbk_key)

		self._tmp_invulnerable_clbk_key = nil
	end
end

function CivilianDamage:_on_damage_received(damage_info)
	self:_call_listeners(damage_info)

	if damage_info.result.type == "death" then
		self:_unregister_from_enemy_manager(damage_info)

		if Network:is_client() then
			self._unit:interaction():set_active(false, false)
		end
	end

	local attacker_unit = damage_info and damage_info.attacker_unit

	if alive(attacker_unit) and attacker_unit:base() then
		if attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
		elseif attacker_unit:base().sentry_gun then
			attacker_unit = attacker_unit:base():get_owner()
		end
	end

	if attacker_unit == managers.player:player_unit() and damage_info then
		managers.player:on_damage_dealt(self._unit, damage_info)
	end
end

function CivilianDamage:print(...)
	cat_print("civ_damage", ...)
end

function CivilianDamage:_unregister_from_enemy_manager(damage_info)
	managers.enemy:on_civilian_died(self._unit, damage_info)
end

function CivilianDamage:no_intimidation_by_dmg()
	if self._ignore_intimidation_by_damage then
		return true
	end

	if self._unit and self._unit:anim_data() then
		return self._unit:anim_data().no_intimidation_by_dmg
	end

	return true
end

function CivilianDamage:is_friendly_fire(unit)
	if not alive(unit) or not unit:movement() then
		return false
	end

	if not alive(self._unit) or not self._unit:movement() then
		return false
	end

	if unit:movement():team() == self._unit:movement():team() then
		return true
	end

	local is_player = unit == managers.player:player_unit()

	if not is_player then
		return true
	end

	return false
end

function CivilianDamage:damage_bullet(attack_data)
	if managers.player:has_category_upgrade("player", "civ_harmless_bullets") and self.no_intimidation_by_dmg and not self:no_intimidation_by_dmg() and (not self._survive_shot_t or self._survive_shot_t < TimerManager:game():time()) then
		self._survive_shot_t = TimerManager:game():time() + 2.5

		self._unit:brain():on_intimidated(1, attack_data.attacker_unit)

		return
	end

	attack_data.damage = 10

	return CopDamage.damage_bullet(self, attack_data)
end

function CivilianDamage:damage_explosion(attack_data)
	if attack_data.variant == "explosion" then
		attack_data.damage = 10
	end

	return CopDamage.damage_explosion(self, attack_data)
end

function CivilianDamage:damage_fire(attack_data)
	if attack_data.variant == "fire" then
		attack_data.damage = 10
	end

	return CopDamage.damage_fire(self, attack_data)
end

function CivilianDamage:stun_hit(attack_data)
	if self._dead or self._invulnerable then
		return
	end

	if not self._lie_down_clbk_id then
		self._lie_down_clbk_id = "lie_down_" .. tostring(self._unit:key())
		local rnd = math.random()
		local t = TimerManager:game():time()

		if not self._char_tweak.is_escort then
			managers.enemy:add_delayed_clbk(self._lie_down_clbk_id, callback(self, self, "_lie_down_clbk", attack_data.attacker_unit), t + rnd)
		end
	end
end

function CivilianDamage:_lie_down_clbk(attacker_unit)
	if alive(attacker_unit) and alive(self._unit) then
		local params = {
			force_lie_down = true
		}

		self._unit:brain():set_logic("surrender", params)

		self._lie_down_clbk_id = nil
	end
end

function CivilianDamage:damage_melee(attack_data)
	if managers.player:has_category_upgrade("player", "civ_harmless_melee") and self.no_intimidation_by_dmg and not self:no_intimidation_by_dmg() and (not self._survive_shot_t or self._survive_shot_t < TimerManager:game():time()) then
		self._survive_shot_t = TimerManager:game():time() + 2.5

		self._unit:brain():on_intimidated(1, attack_data.attacker_unit)

		return
	end

	if _G.IS_VR and attack_data.damage == 0 then
		return
	end

	attack_data.damage = 10

	return CopDamage.damage_melee(self, attack_data)
end

function CivilianDamage:damage_tase(attack_data)
	if self._dead or self._invulnerable or self._char_tweak.is_escort then
		return
	end

	self._unit:brain():on_intimidated(1, attack_data.attacker_unit)
	self:_play_civilian_tase_effect()
	self:_send_tase_attack_result(attack_data, 0, 0)
end

function CivilianDamage:sync_damage_tase(attacker_unit, damage_percent, variant, death)
	self:_play_civilian_tase_effect()
end

function CivilianDamage:_play_civilian_tase_effect()
	if self._tase_effect then
		World:effect_manager():fade_kill(self._tase_effect)
	end

	self._tase_effect = World:effect_manager():spawn(self._tase_effect_table)

	if not self._tase_effect_clbk_id then
		self._tase_effect_clbk_id = "tase_effect_" .. tostring(self._unit:key())
		local t = TimerManager:game():time()

		managers.enemy:add_delayed_clbk(self._tase_effect_clbk_id, callback(self, self, "_tase_effect_clbk"), t + 1.5)
	end
end

function CivilianDamage:_tase_effect_clbk(attacker_unit)
	if alive(self._unit) then
		self:on_tase_ended()
	end

	self._tase_effect_clbk_id = nil
end
