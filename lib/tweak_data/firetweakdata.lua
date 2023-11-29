FireTweakData = FireTweakData or class()

function FireTweakData:init(tweak_data)
	self:_init_tweak_data()
	self:_init_dot_entries(tweak_data)
	self:_process_dot_entries()
end

function FireTweakData:_init_tweak_data()
	self.fire_bones = {
		"Spine",
		"LeftArm",
		"RightArm",
		"LeftLeg",
		"RightLeg"
	}
	self.fire_bones_sound = {
		"Spine"
	}
	self.effects = {
		endless = {
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless",
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_cheap",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light"
		},
		short = {
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire",
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_cheap",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_cheap"
		},
		[5] = {
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s",
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s_cheap",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s_cheap"
		},
		[7] = {
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_7s",
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_7s_cheap",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_7s_cheap"
		},
		[9] = {
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_9s",
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_9s_cheap",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_9s_cheap"
		},
		short_money = {
			expensive = "effects/payday2/particles/explosions/sparkle_enemies_11sec",
			cheap = "effects/payday2/particles/explosions/sparkle_enemies_11sec",
			normal = "effects/payday2/particles/explosions/sparkle_enemies_11sec"
		},
		endless_money = {
			expensive = "effects/payday2/particles/explosions/sparkle_enemies",
			cheap = "effects/payday2/particles/explosions/sparkle_enemies",
			normal = "effects/payday2/particles/explosions/sparkle_enemies"
		}
	}
	self.effects_cost = {
		"expensive",
		"normal",
		"normal",
		"cheap",
		"cheap"
	}
	self.fire_death_anims = {
		[0] = {
			duration = 3,
			effect = "short"
		},
		{
			duration = 9,
			effect = 9
		},
		{
			duration = 6,
			effect = 7
		},
		{
			duration = 6,
			effect = 7
		},
		{
			duration = 7,
			effect = 9
		},
		{
			duration = 4,
			effect = 5
		}
	}
	self.money_death_anims = {
		[0] = {
			duration = 3,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 9,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 7,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 9,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 6,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 9,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 8,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 7,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 9,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 11,
			effect = "short_money",
			burn_sound_name = "no_sound"
		},
		{
			duration = 10,
			effect = "short_money",
			burn_sound_name = "no_sound"
		}
	}
end

function FireTweakData:_init_dot_entries(...)
	local entries = {}
	self.dot_entries = entries

	self:_init_dot_entries_fire(entries, ...)
end

function FireTweakData:_init_dot_entries_fire(entries)
	local fire_entries = {}
	entries.fire = fire_entries
	fire_entries.default_fire = {
		PROCESSED = true,
		name = "default",
		dot_length = 6,
		dot_trigger_chance = 0.35,
		dot_trigger_max_distance = 3000,
		dot_grace_period = 1,
		variant = "fire",
		dot_damage = 13,
		damage_class = "FlameBulletBase",
		dot_tick_period = 0.5
	}
	fire_entries.weapon_kacchainsaw_flamethrower = {
		dot_trigger_chance = 0.75,
		dot_damage = 4,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.weapon_flamethrower_mk2 = {
		dot_trigger_chance = 0.75,
		dot_damage = 20,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.weapon_money = {
		dot_trigger_max_distance = false,
		dot_damage = 10,
		dot_length = 1,
		burn_sound_name = "no_sound",
		dot_trigger_chance = 0.75,
		fire_effect_variant = "endless_money"
	}
	fire_entries.weapon_system = {
		dot_trigger_chance = 0.75,
		dot_damage = 15,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_dragons_breath = {
		dot_trigger_chance = 1,
		dot_damage = 9,
		dot_length = 3,
		dot_trigger_max_distance = 1400
	}
	fire_entries.ammo_flamethrower_mk2_rare = {
		dot_trigger_chance = 0.75,
		dot_damage = 15,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_flamethrower_mk2_welldone = {
		dot_trigger_chance = 0.75,
		dot_damage = 25,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_system_low = {
		dot_trigger_chance = 0.75,
		dot_damage = 10,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_system_high = {
		dot_trigger_chance = 0.75,
		dot_damage = 20,
		dot_length = 1.5,
		dot_trigger_max_distance = false
	}
	fire_entries.melee_spoon_gold = {
		dot_trigger_chance = 0.2,
		dot_damage = 7,
		dot_length = 3,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_molotov = {
		dot_trigger_chance = 1,
		dot_damage = 21,
		dot_length = 10,
		dot_trigger_max_distance = false,
		is_molotov = true
	}
	fire_entries.proj_launcher_incendiary = {
		dot_trigger_max_distance = false,
		dot_damage = 21,
		dot_trigger_chance = 1
	}
	fire_entries.proj_launcher_incendiary_arbiter = {
		dot_trigger_max_distance = false,
		dot_damage = 21,
		dot_length = 3,
		dot_trigger_chance = 1
	}
	fire_entries.proj_fire_com = {
		dot_trigger_chance = 1,
		dot_damage = 21,
		dot_length = 2,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_molotov_groundfire = {
		is_molotov = true,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_launcher_incendiary_groundfire = {
		dot_trigger_max_distance = false
	}
	fire_entries.proj_launcher_incendiary_arbiter_groundfire = clone(fire_entries.proj_launcher_incendiary_groundfire)
	fire_entries.equipment_tripmine_groundfire = clone(fire_entries.proj_launcher_incendiary_groundfire)
	fire_entries.enemy_triad_boss_groundfire = clone(fire_entries.proj_launcher_incendiary_groundfire)
	fire_entries.enemy_mutator_cloaker_groundfire = {
		dot_trigger_max_distance = false
	}
end

function FireTweakData:_process_dot_entries()
	for variant, dot_tweaks in pairs(self.dot_entries) do
		local default_entry = dot_tweaks["default_" .. variant]

		for dot_tweak_name, dot_tweak_data in pairs(dot_tweaks) do
			if not dot_tweak_data.PROCESSED then
				dot_tweak_data.PROCESSED = true
				dot_tweak_data.name = dot_tweak_name
				dot_tweak_data.variant = variant

				if default_entry then
					for var_name, var in pairs(default_entry) do
						if dot_tweak_data[var_name] == nil then
							dot_tweak_data[var_name] = default_entry[var_name]
						end
					end
				end
			end
		end
	end
end

function FireTweakData:has_dot(tweak_name)
	for variant, dot_entries in pairs(self.dot_entries) do
		if dot_entries[tweak_name] then
			return true
		end
	end

	return false
end
