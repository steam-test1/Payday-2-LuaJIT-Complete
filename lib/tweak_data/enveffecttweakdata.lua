EnvEffectTweakData = EnvEffectTweakData or class()

function EnvEffectTweakData:init()
	self.lightning = {}
	self.lightning.event_name = "thunder_struck"
	self.lightning.min_interval = 10
	self.lightning.rnd_interval = 10
	self.lightning_tag = {}
	self.lightning_tag.event_name = "thunder_struck_muffled"
	self.lightning_tag.min_interval = 30
	self.lightning_tag.rnd_interval = 40
	self.rain = {}
	self.rain.effect_name = Idstring("effects/particles/rain/rain_01_a")
	self.rain.ripples = true
	self.rain_only = {}
	self.rain_only.effect_name = Idstring("effects/particles/rain/rain_only")
	self.rain_only.ripples = true
	self.snow = {}
	self.snow.effect_name = Idstring("effects/particles/snow/snow_01")
	self.snow_slow = {}
	self.snow_slow.effect_name = Idstring("effects/particles/snow/snow_slow")
end

function EnvEffectTweakData:molotov_fire()
	local params = {
		alert_radius = 1500,
		burn_duration = 15,
		burn_tick_period = 0.5,
		curve_pow = 3,
		damage = 1,
		dot_data_name = "proj_molotov_groundfire",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade",
		fire_alert_radius = 1500,
		is_molotov = true,
		player_damage = 2,
		range = 75,
		sound_event = "molotov_impact",
		sound_event_burning = "no_sound",
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		sound_event_impact_duration = 0
	}

	return params
end

function EnvEffectTweakData:trip_mine_fire()
	local params = {
		alert_radius = 15000,
		burn_duration = 10,
		burn_tick_period = 0.5,
		curve_pow = 3,
		damage = 1,
		dot_data_name = "equipment_tripmine_groundfire",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade",
		fire_alert_radius = 15000,
		player_damage = 2,
		range = 75,
		sound_event = "no_sound",
		sound_event_burning = "burn_loop_gen",
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		sound_event_impact_duration = 0
	}

	return params
end

function EnvEffectTweakData:incendiary_fire()
	local params = {
		alert_radius = 1500,
		burn_duration = 6,
		burn_tick_period = 0.5,
		curve_pow = 3,
		damage = 1,
		dot_data_name = "proj_launcher_incendiary_groundfire",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade",
		fire_alert_radius = 1500,
		player_damage = 2,
		range = 75,
		sound_event = "no_sound",
		sound_event_burning = "burn_loop_gen",
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		sound_event_impact_duration = 0
	}

	return params
end

function EnvEffectTweakData:incendiary_fire_arbiter()
	local params = {
		alert_radius = 1500,
		burn_duration = 3,
		burn_tick_period = 0.5,
		curve_pow = 3,
		damage = 1,
		dot_data_name = "proj_launcher_incendiary_arbiter_groundfire",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade",
		fire_alert_radius = 1500,
		player_damage = 2,
		range = 75,
		sound_event = "no_sound",
		sound_event_burning = "burn_loop_gen",
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		sound_event_impact_duration = 0
	}

	return params
end

function EnvEffectTweakData:triad_boss_aoe_fire()
	local params = {
		burn_duration = 1,
		burn_tick_period = 0.2,
		curve_pow = 1,
		damage = 4,
		dot_data_name = "enemy_triad_boss_groundfire",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade_pent_boss",
		no_fire_alert = true,
		player_damage = 4,
		range = 100,
		sound_event = "PENT_Boss_Molotov_Drop",
		sound_event_burning = "no_sound",
		sound_event_burning_stop = "burn_loop_gen_stop_fade",
		sound_event_impact_duration = 0
	}

	return params
end

function EnvEffectTweakData:snowman_boss_aoe_fire()
	local params = {
		burn_duration = 1,
		burn_tick_period = 0.2,
		curve_pow = 1,
		damage = 1.3,
		effect_name = "effects/payday2/particles/character/snowman_molotov",
		no_fire_alert = true,
		player_damage = 1.3,
		range = 100,
		sound_event = "snowmolo_impact",
		sound_event_burning = "no_sound",
		sound_event_burning_stop = "snowmolo_burn_loop_stop",
		sound_event_impact_duration = 0
	}

	return params
end
