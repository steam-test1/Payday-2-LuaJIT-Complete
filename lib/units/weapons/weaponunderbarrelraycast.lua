WeaponUnderbarrelRaycast = WeaponUnderbarrelRaycast or class(WeaponUnderbarrel)
WeaponUnderbarrelRaycast.GADGET_TYPE = "underbarrel_raycast"

mixin(WeaponUnderbarrelRaycast, RaycastWeaponBase)

function WeaponUnderbarrelRaycast:init(unit)
	WeaponUnderbarrel.init(self, unit)
	RaycastWeaponBase.init(self, unit)
end

function WeaponUnderbarrelRaycast:setup_data(setup_data, damage_multiplier, ammo_data)
	WeaponUnderbarrel.setup_data(self, setup_data, damage_multiplier, ammo_data)

	self._base_stats_modifiers = ammo_data and ammo_data.base_stats_modifiers or {}
	self._blueprint = {}
	self._parts = {}

	self:_update_stats_values(false, ammo_data)
	RaycastWeaponBase.setup(self, setup_data, damage_multiplier)
end

function WeaponUnderbarrelRaycast:modify_base_stats(stats)
	for stat, value in pairs(self._base_stats_modifiers) do
		stats[stat] = (stats[stat] or 1) + value
	end
end

function WeaponUnderbarrelRaycast:replenish()
	self._ammo:replenish()
	self:update_damage()
end

function WeaponUnderbarrelRaycast:ammo_base()
	return self._ammo
end

function WeaponUnderbarrelRaycast:_spawn_muzzle_effect()
	return nil
end

function WeaponUnderbarrelRaycast:_spawn_shell_eject_effect()
	return true
end

function WeaponUnderbarrelRaycast:_fire_raycast(weapon_base, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	return RaycastWeaponBase._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
end

function WeaponUnderbarrelRaycast:_get_tweak_data_weapon_animation(anim)
	return WeaponUnderbarrel._get_tweak_data_weapon_animation(self, anim)
end

function WeaponUnderbarrelRaycast:_get_sound_event(weapon, event, alternative_event)
	return WeaponUnderbarrel._get_sound_event(self, weapon, event, alternative_event)
end

function WeaponUnderbarrelRaycast:fire_mode()
	return WeaponUnderbarrel.fire_mode(self)
end

function WeaponUnderbarrelRaycast:reload_prefix()
	return WeaponUnderbarrel.reload_prefix(self)
end

function WeaponUnderbarrelRaycast:_check_alert(weapon, rays, fire_pos, direction, user_unit)
	RaycastWeaponBase._check_alert(self, rays, fire_pos, direction, user_unit)

	return true
end

function WeaponUnderbarrelRaycast:_build_suppression(weapon, enemies_in_cone, suppr_mul)
	RaycastWeaponBase._build_suppression(self, enemies_in_cone, suppr_mul)

	return true
end

WeaponUnderbarrelShotgunRaycast = WeaponUnderbarrelShotgunRaycast or class(WeaponUnderbarrelRaycast)

mixin(WeaponUnderbarrelShotgunRaycast, NewRaycastWeaponBase)
mixin(WeaponUnderbarrelShotgunRaycast, ShotgunBase)

function WeaponUnderbarrelShotgunRaycast:init(unit)
	self._blueprint = {}
	self._parts = {}

	WeaponUnderbarrel.init(self, unit)
	ShotgunBase.init(self, unit)
end

function WeaponUnderbarrelShotgunRaycast:replenish()
	self._ammo:replenish()
	self:update_damage()
end

function WeaponUnderbarrelShotgunRaycast:ammo_base()
	return self._ammo
end

function WeaponUnderbarrelShotgunRaycast:_get_tweak_data_weapon_animation(anim)
	return WeaponUnderbarrel._get_tweak_data_weapon_animation(self, anim)
end

function WeaponUnderbarrelShotgunRaycast:can_toggle_firemode()
	return WeaponUnderbarrel.can_toggle_firemode(self)
end

function WeaponUnderbarrelShotgunRaycast:reload_prefix()
	return WeaponUnderbarrel.reload_prefix(self)
end

function WeaponUnderbarrelShotgunRaycast:is_single_shot()
	return WeaponUnderbarrel.is_single_shot(self)
end

function WeaponUnderbarrelShotgunRaycast:_fire_raycast(weapon_base, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	return ShotgunBase._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
end

function WeaponUnderbarrelShotgunRaycast:_check_alert(weapon, rays, fire_pos, direction, user_unit)
	ShotgunBase._check_alert(self, rays, fire_pos, direction, user_unit)

	return true
end

function WeaponUnderbarrelShotgunRaycast:_build_suppression(weapon, enemies_in_cone, suppr_mul)
	ShotgunBase._build_suppression(self, enemies_in_cone, suppr_mul)

	return true
end

WeaponUnderbarrelFlamethrower = WeaponUnderbarrelFlamethrower or class(WeaponUnderbarrelRaycast)

mixin(WeaponUnderbarrelFlamethrower, NewRaycastWeaponBase)
mixin(WeaponUnderbarrelFlamethrower, NewFlamethrowerBase)

function WeaponUnderbarrelFlamethrower:init(unit)
	self._blueprint = {}
	self._parts = {}

	WeaponUnderbarrel.init(self, unit)
	NewFlamethrowerBase.init(self, unit)
end

function WeaponUnderbarrelFlamethrower:_fire_raycast(weapon_base, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	return NewFlamethrowerBase._fire_raycast(self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
end

function WeaponUnderbarrelFlamethrower:_check_alert(weapon, rays, fire_pos, direction, user_unit)
	NewFlamethrowerBase._check_alert(self, rays, fire_pos, direction, user_unit)

	return true
end

function WeaponUnderbarrelFlamethrower:_build_suppression(weapon, enemies_in_cone, suppr_mul)
	NewFlamethrowerBase._build_suppression(self, enemies_in_cone, suppr_mul)

	return true
end

function WeaponUnderbarrelFlamethrower:_spawn_muzzle_effect()
	return false
end

function WeaponUnderbarrelFlamethrower:_spawn_shell_eject_effect()
	return false
end

function WeaponUnderbarrelFlamethrower:_get_tweak_data_weapon_animation(anim)
	return WeaponUnderbarrel._get_tweak_data_weapon_animation(self, anim)
end

function WeaponUnderbarrelFlamethrower:reload_prefix()
	return WeaponUnderbarrel.reload_prefix(self)
end

function WeaponUnderbarrelFlamethrower:_check_state(current_state)
	WeaponUnderbarrelRaycast._check_state(self, current_state)

	self._enabled = self._on

	if self._enabled then
		self:on_enabled()
	else
		self:on_disabled()
	end
end

function WeaponUnderbarrelFlamethrower:_get_sound_event(weapon, event, alternative_event)
	return WeaponUnderbarrel._get_sound_event(self, weapon, event, alternative_event)
end

function WeaponUnderbarrelFlamethrower:start_shooting(weapon)
	self._next_fire_allowed = math.max(self._next_fire_allowed, self._unit:timer():time())
	self._shooting = true
	self._bullets_fired = 0
end

function WeaponUnderbarrelFlamethrower:tweak_data_anim_play(...)
	Application:error("WeaponUnderbarrelFlamethrower:tweak_data_anim_play", ...)
end

function WeaponUnderbarrelFlamethrower:tweak_data_anim_play_at_end(...)
	Application:error("WeaponUnderbarrelFlamethrower:tweak_data_anim_play_at_end", ...)
end

function WeaponUnderbarrelFlamethrower:tweak_data_anim_stop(...)
	Application:error("WeaponUnderbarrelFlamethrower:tweak_data_anim_stop", ...)
end

function WeaponUnderbarrelFlamethrower:tweak_data_anim_is_playing(...)
	Application:error("WeaponUnderbarrelFlamethrower:tweak_data_anim_is_playing", ...)
end
