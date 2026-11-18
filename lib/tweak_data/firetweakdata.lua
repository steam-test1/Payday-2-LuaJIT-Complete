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
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_cheap",
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_endless_no_light"
		},
		short = {
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_cheap",
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_cheap"
		},
		[5] = {
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s_cheap",
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_5s_cheap"
		},
		[7] = {
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_7s_cheap",
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_7s",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_7s_cheap"
		},
		[9] = {
			cheap = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_9s_cheap",
			expensive = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_9s",
			normal = "effects/payday2/particles/explosions/molotov_grenade_enemy_on_fire_9s_cheap"
		},
		short_money = {
			cheap = "effects/payday2/particles/explosions/sparkle_enemies_11sec",
			expensive = "effects/payday2/particles/explosions/sparkle_enemies_11sec",
			normal = "effects/payday2/particles/explosions/sparkle_enemies_11sec"
		},
		endless_money = {
			cheap = "effects/payday2/particles/explosions/sparkle_enemies",
			expensive = "effects/payday2/particles/explosions/sparkle_enemies",
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
			burn_sound_name = "no_sound",
			duration = 3,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 9,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 7,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 9,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 6,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 9,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 8,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 7,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 9,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 11,
			effect = "short_money"
		},
		{
			burn_sound_name = "no_sound",
			duration = 10,
			effect = "short_money"
		}
	}
end

function FireTweakData:_init_dot_entries(...)
	local entries = {}

	self.dot_entries = entries

	self:_init_dot_entries_fire(entries, ...)
end

function FireTweakData:_init_dot_entries_fire(entries)
	local variant = "fire"
	local fire_entries = {}

	entries[variant] = fire_entries

	local default_name = "default_" .. variant

	fire_entries[default_name] = {
		PROCESSED = true,
		damage_class = "FlameBulletBase",
		dot_damage = 13,
		dot_grace_period = 1,
		dot_length = 6,
		dot_tick_period = 0.5,
		dot_trigger_chance = 0.35,
		dot_trigger_max_distance = 3000,
		variant = variant,
		name = default_name
	}
	fire_entries.weapon_kacchainsaw_flamethrower = {
		dot_damage = 4,
		dot_length = 1.5,
		dot_trigger_chance = 0.75,
		dot_trigger_max_distance = false
	}
	fire_entries.weapon_flamethrower_mk2 = {
		dot_damage = 20,
		dot_length = 1.5,
		dot_trigger_chance = 0.75,
		dot_trigger_max_distance = false
	}
	fire_entries.weapon_money = {
		burn_sound_name = "no_sound",
		dot_damage = 10,
		dot_length = 1,
		dot_trigger_chance = 0.75,
		dot_trigger_max_distance = false,
		fire_effect_variant = "endless_money"
	}
	fire_entries.weapon_system = {
		dot_damage = 15,
		dot_length = 1.5,
		dot_trigger_chance = 0.75,
		dot_trigger_max_distance = false
	}
	fire_entries.ammo_dragons_breath = {
		dot_damage = 9,
		dot_length = 3,
		dot_trigger_chance = 1,
		dot_trigger_max_distance = 1400
	}
	fire_entries.ammo_flamethrower_mk2_rare = table.map_copy(fire_entries.weapon_flamethrower_mk2)
	fire_entries.ammo_flamethrower_mk2_rare.dot_damage = 15
	fire_entries.ammo_flamethrower_mk2_welldone = table.map_copy(fire_entries.weapon_flamethrower_mk2)
	fire_entries.ammo_flamethrower_mk2_welldone.dot_damage = 25
	fire_entries.ammo_system_low = table.map_copy(fire_entries.weapon_system)
	fire_entries.ammo_system_low.dot_damage = 15
	fire_entries.ammo_system_high = table.map_copy(fire_entries.weapon_system)
	fire_entries.ammo_system_high.dot_damage = 25
	fire_entries.melee_spoon_gold = {
		dot_damage = 7,
		dot_length = 3,
		dot_trigger_chance = 0.2,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_molotov = {
		dot_damage = 21,
		dot_length = 10,
		dot_trigger_chance = 1,
		dot_trigger_max_distance = false,
		is_molotov = true
	}
	fire_entries.proj_launcher_incendiary = {
		dot_damage = 21,
		dot_trigger_chance = 1,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_launcher_incendiary_arbiter = {
		dot_damage = 21,
		dot_length = 3,
		dot_trigger_chance = 1,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_fire_com = {
		dot_damage = 21,
		dot_length = 2,
		dot_trigger_chance = 1,
		dot_trigger_max_distance = false
	}
	fire_entries.proj_molotov_groundfire = {
		dot_trigger_max_distance = false,
		is_molotov = true
	}
	fire_entries.proj_launcher_incendiary_groundfire = {
		dot_trigger_max_distance = false
	}
	fire_entries.proj_launcher_incendiary_arbiter_groundfire = table.map_copy(fire_entries.proj_launcher_incendiary_groundfire)
	fire_entries.equipment_tripmine_groundfire = table.map_copy(fire_entries.proj_launcher_incendiary_groundfire)
	fire_entries.enemy_triad_boss_groundfire = table.map_copy(fire_entries.proj_launcher_incendiary_groundfire)
	fire_entries.enemy_mutator_cloaker_groundfire = table.map_copy(fire_entries.proj_launcher_incendiary_groundfire)
end

function FireTweakData:_process_dot_entries()
	local t_set_defaults = table.set_defaults

	for variant, dot_tweaks in pairs(self.dot_entries) do
		local default_entry = dot_tweaks["default_" .. variant]

		for dot_tweak_name, dot_tweak_data in pairs(dot_tweaks) do
			if not dot_tweak_data.PROCESSED then
				dot_tweak_data.PROCESSED = true
				dot_tweak_data.name = dot_tweak_name
				dot_tweak_data.variant = variant

				if default_entry then
					t_set_defaults(dot_tweak_data, default_entry)
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

function FireTweakData:mod_add_dot_tweak_entries(new_entries)
	for dot_type, dot_tweak_entries in pairs(new_entries) do
		local entries = self.dot_entries[dot_type]

		if not entries then
			entries = {}
			self.dot_entries[dot_type] = entries
		end

		for dot_name, dot_tweak_data in pairs(dot_tweak_entries) do
			dot_tweak_data.MODDED = true

			if entries[dot_name] then
				Application:error("[FireTweakData] mod_add_dot_tweak_entries() - dot entry with name \"" .. tostring(dot_name) .. "\" already exists!")
			else
				entries[dot_name] = dot_tweak_data
			end
		end
	end

	self:_process_dot_entries()

	if tweak_data.dot then
		tweak_data.dot:mod_add_dot_tweak_entries(new_entries)
	end
end
