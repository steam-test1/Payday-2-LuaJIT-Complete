PoisonGasGrenade = PoisonGasGrenade or class(FragGrenade)

function PoisonGasGrenade:init(unit)
	PoisonGasGrenade.super.init(self, unit)
end

function PoisonGasGrenade:_setup_server_data()
	PoisonGasGrenade.super._setup_server_data(self)

	self._timer = 0.1
end

function PoisonGasGrenade:_setup_from_tweak_data()
	local grenade_entry = self:projectile_entry()
	local tweak_entry = tweak_data.projectiles[grenade_entry]
	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
	self._range = tweak_entry.range
	self._effect_name = tweak_entry.effect_name or "effects/payday2/particles/explosions/grenade_explosion"
	self._curve_pow = tweak_entry.curve_pow or 3
	self._damage = tweak_entry.damage
	self._player_damage = tweak_entry.player_damage
	self._alert_radius = tweak_entry.alert_radius
	self._idstr_decal = tweak_entry.idstr_decal
	self._idstr_effect = tweak_entry.idstr_effect
	local sound_event = tweak_entry.sound_event or "grenade_explode"
	self._custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = self._effect_name,
		idstr_decal = self._idstr_decal,
		idstr_effect = self._idstr_effect,
		sound_event = sound_event,
		feedback_range = self._range * 2
	}

	return tweak_entry
end

function PoisonGasGrenade:set_projectile_entry(projectile_entry)
	self._projectile_entry = projectile_entry

	self:_setup_from_tweak_data()

	if Network:is_server() then
		self:_setup_server_data()
	end
end

function PoisonGasGrenade:projectile_entry()
	return self._projectile_entry or self._tweak_projectile_entry or "launcher_poison"
end

function PoisonGasGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._detonated then
		return
	end

	local pos = self._unit:position()
	local normal = math.UP
	local range = self._range
	local grenade_entry = self:projectile_entry()
	local tweak_entry = tweak_data.projectiles[grenade_entry]

	managers.player:spawn_poison_gas(pos, normal, tweak_entry, self._unit)
	self._unit:set_extension_update_enabled(Idstring("base"), false)

	self._timer = nil
	self._detonated = true

	if Network:is_server() then
		local slot_mask = managers.slot:get_mask("explosion_targets")
		local hit_units, splinters = managers.explosion:detect_and_give_dmg({
			player_damage = 0,
			hit_pos = pos,
			range = range,
			collision_slotmask = slot_mask,
			curve_pow = self._curve_pow,
			damage = self._damage,
			ignore_unit = self._unit,
			alert_radius = self._alert_radius,
			user = self:thrower_unit() or self._unit,
			owner = self._unit
		})

		managers.explosion:give_local_player_dmg(pos, range, self._player_damage)
		managers.explosion:play_sound_and_effects(pos, normal, range, self._custom_params)

		if self._unit:id() ~= -1 and managers.network:session() then
			managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", GrenadeBase.EVENT_IDS.detonate)
		end
	end

	self:_handle_hiding_and_destroying(false, nil)
end

function PoisonGasGrenade:bullet_hit()
end

function PoisonGasGrenade:_detonate_on_client()
	if self._detonated then
		return
	end

	self:_detonate()

	local pos = self._unit:position()
	local range = self._range

	managers.explosion:give_local_player_dmg(pos, range, self._player_damage)
	managers.explosion:explode_on_client(pos, math.UP, nil, self._damage, range, self._curve_pow, self._custom_params)
end

function PoisonGasGrenade:update(unit, t, dt)
	if self._timer then
		self._timer = self._timer - dt

		if self._timer <= 0 and mvector3.length(self._unit:body("static_body"):velocity()) < 1 then
			self._timer = nil

			self:_detonate()
		end
	end

	ProjectileBase.update(self, unit, t, dt)
end

function PoisonGasGrenade:save(data)
	PoisonGasGrenade.super.save(self, data)

	local state = {
		timer = self._timer,
		detonated = self._detonated,
		projectile_entry = self._projectile_entry,
		has_trail_effect = self._added_trail_effect
	}
	data.PoisonGasGrenade = state
end

function PoisonGasGrenade:load(data)
	PoisonGasGrenade.super.load(self, data)

	local state = data.PoisonGasGrenade
	self._timer = state.timer
	self._detonated = state.detonated
	self._projectile_entry = state.projectile_entry

	self:_setup_from_tweak_data()

	if state.has_trail_effect then
		self:add_trail_effect()
	end

	if self._detonated then
		self:_handle_hiding_and_destroying(false, nil)
	end
end
