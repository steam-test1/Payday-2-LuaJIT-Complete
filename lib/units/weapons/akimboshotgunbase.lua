AkimboShotgunBase = AkimboShotgunBase or class(AkimboWeaponBase)

function AkimboShotgunBase:init(...)
	AkimboShotgunBase.super.init(self, ...)

	self._hip_fire_rate_inc = 0
	self._do_shotgun_push = true

	self:setup_default()
end

function AkimboShotgunBase:setup_default(...)
	ShotgunBase.setup_default(self, ...)
end

function AkimboShotgunBase:_fire_raycast(...)
	return ShotgunBase._fire_raycast(self, ...)
end

function AkimboShotgunBase:fire_rate_multiplier(...)
	return ShotgunBase.fire_rate_multiplier(self, ...)
end

function AkimboShotgunBase:run_and_shoot_allowed(...)
	return ShotgunBase.run_and_shoot_allowed(self, ...)
end

function AkimboShotgunBase:_update_stats_values(...)
	ShotgunBase._update_stats_values(self, ...)
end

function AkimboShotgunBase:_check_one_shot_shotgun_achievements(...)
	ShotgunBase._check_one_shot_shotgun_achievements(self, ...)
end

NPCAkimboShotgunBase = NPCAkimboShotgunBase or class(NPCAkimboWeaponBase)
