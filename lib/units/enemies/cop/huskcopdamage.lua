HuskCopDamage = HuskCopDamage or class(CopDamage)

function HuskCopDamage:die(attack_data)
	managers.modifiers:run_func("OnEnemyDied", self._unit, attack_data)
	CopDamage.MAD_3_ACHIEVEMENT(attack_data)
	self:_check_friend_4(attack_data)
	self:_check_ranc_9(attack_data)
	self._unit:base():set_slot(self._unit, 17)
	self:_remove_debug_gui()

	if self._unit:inventory() then
		self._unit:inventory():drop_shield()
	end

	self:_chk_unique_death_requirements(attack_data, true)

	self._health = 0
	self._health_ratio = 0
	self._dead = true

	self:set_mover_collision_state(false)

	if self._unit:interaction() and self._unit:interaction().tweak_data == "hostage_convert" then
		self._unit:interaction():set_active(false)
	end

	if self._death_sequence then
		if self._unit:damage() and self._unit:damage():has_sequence(self._death_sequence) then
			self._unit:damage():run_sequence_simple(self._death_sequence)
		else
			debug_pause_unit(self._unit, "[HuskCopDamage:die] does not have death sequence", self._death_sequence, self._unit)
		end
	end

	if self._unit:base():char_tweak().die_sound_event then
		self._unit:sound():play(self._unit:base():char_tweak().die_sound_event, nil, nil)
	end

	self:_on_death()

	if self._tmp_invulnerable_clbk_key then
		managers.enemy:remove_delayed_clbk(self._tmp_invulnerable_clbk_key)

		self._tmp_invulnerable_clbk_key = nil
	end
end
