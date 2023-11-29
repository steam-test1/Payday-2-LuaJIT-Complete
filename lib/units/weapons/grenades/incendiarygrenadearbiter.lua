IncendiaryGrenadeArbiter = IncendiaryGrenadeArbiter or class(IncendiaryGrenade)

function IncendiaryGrenadeArbiter:_spawn_environment_fire(normal)
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local data = tweak_data.env_effect:incendiary_fire_arbiter()
	local tweak = tweak_data.projectiles[self._tweak_projectile_entry] or {}
	data.burn_duration = tweak.burn_duration or data.burn_duration or 3
	data.sound_event_impact_duration = tweak.sound_event_impact_duration or data.sound_event_impact_duration or 1
	local groundfire_unit, time_until_destruction = EnvironmentFire.spawn(position, rotation, data, normal, self._thrower_unit, self._unit, 0, 1)

	if self._dot_data then
		local explosion_dot_length = self._dot_data.dot_length + 1
		time_until_destruction = time_until_destruction and math.max(time_until_destruction, explosion_dot_length) or explosion_dot_length
	end

	return time_until_destruction
end
