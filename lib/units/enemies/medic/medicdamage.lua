MedicDamage = MedicDamage or class(CopDamage)

function MedicDamage:init(...)
	MedicDamage.super.init(self, ...)
	self:_init_medic()
end

function MedicDamage:_init_medic()
	self._heal_cooldown = tweak_data.medic.cooldown
	self._heal_cooldown = managers.modifiers:modify_value("MedicDamage:CooldownTime", self._heal_cooldown)
	self._heal_cooldown_t = 0
	self._heal_radius = tweak_data.medic.radius

	self:_register_healing()
end

function MedicDamage:_register_healing()
	if not self._registered then
		self._registered = true

		managers.enemy:register_medic(self._unit)
	end
end

function MedicDamage:_unregister_healing()
	if self._registered then
		self._registered = nil

		managers.enemy:unregister_medic(self._unit)
	end
end

function MedicDamage:get_healing_radius()
	return self._heal_radius
end

function MedicDamage:get_healing_radius_sq()
	return self._heal_radius * self._heal_radius
end

function MedicDamage:verify_heal_requesting_unit(requesting_unit)
	local base_ext = requesting_unit:base()
	local char_tweak = base_ext and base_ext.char_tweak and base_ext:char_tweak()

	if not char_tweak or char_tweak.can_be_healed == false then
		return false
	end

	local mov_ext = requesting_unit:movement()
	local team = mov_ext and mov_ext.team and mov_ext:team()

	if not team then
		return false
	end

	local my_team = self._unit:movement():team()

	if team ~= my_team and not team.friends[my_team.id] then
		return false
	end

	return true
end

function MedicDamage:is_available_for_healing(requesting_unit)
	if self._unit:anim_data().act then
		return false
	end

	if self._unit:character_damage():tased() then
		return false
	end

	if TimerManager:game():time() <= self._heal_cooldown_t then
		return false
	end

	if not self:verify_heal_requesting_unit(requesting_unit) then
		return false
	end

	return true
end

function MedicDamage:heal_unit(unit)
	self._heal_cooldown_t = TimerManager:game():time() + self._heal_cooldown

	unit:character_damage():do_medic_heal()

	local action_data = {
		client_interrupt = true,
		body_part = 3,
		type = "heal",
		blocks = {
			action = -1
		}
	}

	self._unit:movement():action_request(action_data)
	self._unit:sound():say("heal")
	managers.network:session():send_to_peers_synched("sync_medic_heal", self._unit:id() ~= -1 and self._unit or nil)
	MedicActionHeal.check_achievements()

	return true
end

function MedicDamage:heal_unit_external(unit, skip_verification)
	if not skip_verification and not self:verify_heal_requesting_unit(unit) then
		return false
	end

	return unit:character_damage():do_medic_heal_and_action(true)
end

function MedicDamage:sync_heal_action()
	self._heal_cooldown_t = TimerManager:game():time() + self._heal_cooldown
	local action_data = nil

	if Network:is_server() then
		if not self._unit:anim_data().act then
			action_data = {
				body_part = 3,
				type = "heal",
				blocks = {
					action = -1
				}
			}
		end
	else
		action_data = {
			block_type = "action",
			type = "heal",
			body_part = 3,
			client_interrupt = not self._unit:anim_data().act,
			blocks = {
				action = -1
			}
		}
	end

	if action_data then
		self._unit:movement():action_request(action_data)
	end

	if self._unit:sound() then
		self._unit:sound():say("heal")
	end
end

function MedicDamage:check_medic_heal(...)
	if self._healed then
		return false
	end

	return MedicDamage.super.check_medic_heal(self, ...)
end

function MedicDamage:do_medic_heal_and_action(...)
	if self._healed then
		return false
	end

	return MedicDamage.super.do_medic_heal_and_action(self, ...)
end

function MedicDamage:die(...)
	MedicDamage.super.die(self, ...)
	self:_unregister_healing()
end

function MedicDamage:destroy(...)
	MedicDamage.super.destroy(self, ...)
	self:_unregister_healing()
end
