DOTTweakData = DOTTweakData or class()

function DOTTweakData:init(tweak_data)
	self:_init_tweak_data()
	self:_init_dot_entries(tweak_data)
	self:_process_dot_entries()
	self:_setup_networking()
end

function DOTTweakData:_init_tweak_data()
end

function DOTTweakData:_init_dot_entries(...)
	local entries = {}
	self.dot_entries = entries

	self:_init_dot_entries_poison(entries, ...)
	self:_init_dot_entries_fire(entries, ...)
end

function DOTTweakData:_init_dot_entries_fire(entries, tweak_data)
	local fire_entries = tweak_data.fire.dot_entries

	if fire_entries then
		for dot_type, dot_entry in pairs(fire_entries) do
			if entries[dot_type] then
				Application:error("[DOTTweakData:_init_dot_entries_fire] A dot entry for type '" .. tostring(dot_type) .. "' already exists.", inspect(entries[dot_type]), inspect(dot_entry))
			end

			entries[dot_type] = dot_entry
		end
	end
end

function DOTTweakData:_init_dot_entries_poison(entries)
	local poison_entries = {}
	entries.poison = poison_entries
	poison_entries.default_poison = {
		PROCESSED = true,
		name = "default",
		dot_length = 6,
		dot_damage = 25,
		damage_class = "PoisonBulletBase",
		dot_tick_period = 0.5,
		dot_grace_period = 1,
		variant = "poison"
	}
	poison_entries.weapon_dotbulletbase = {
		dot_damage = 0.5
	}
	poison_entries.ammo_proj_bow = {
		damage_class = "ProjectilesPoisonBulletBase"
	}
	poison_entries.ammo_proj_crossbow = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_arblast = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_frankish = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_long = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_ecp = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_elastic = clone(poison_entries.ammo_proj_bow)
	poison_entries.ammo_rip = {
		use_weapon_damage_falloff = true,
		dot_damage = 12,
		dot_length = 5
	}
	poison_entries.melee_piggy_hammer = {
		dot_length = 5,
		dot_damage = 12
	}
	poison_entries.melee_cqc = {
		hurt_animation_chance = 0.7,
		dot_length = 1
	}
	poison_entries.melee_fear = {
		dot_length = 3
	}
	poison_entries.proj_four = {
		damage_class = "ProjectilesPoisonBulletBase"
	}
	poison_entries.proj_gas_grenade_cloud = {
		apply_hurt_once = true,
		dot_damage = 2,
		dot_length = 30
	}
	poison_entries.proj_launcher_cloud = {
		apply_hurt_once = true,
		dot_damage = 1,
		dot_length = 30
	}
	poison_entries.proj_launcher_arbiter_cloud = {
		apply_hurt_once = true,
		dot_damage = 0.8,
		dot_length = 10
	}
end

function DOTTweakData:_process_dot_entries()
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

function DOTTweakData:_setup_networking()
	local names_lookup = {}
	self._idx_to_name = names_lookup

	if self.dot_entries and next(self.dot_entries) then
		local idx = 0

		for variant, dot_tweaks in pairs(self.dot_entries) do
			for dot_tweak_name, dot_tweak_data in pairs(dot_tweaks) do
				idx = idx + 1
				names_lookup[idx] = dot_tweak_name
			end
		end

		table.sort(names_lookup)
	end

	local indexes_lookup = {}
	self._name_to_idx = indexes_lookup
	local tweak_name = nil

	for idx = 1, #names_lookup do
		tweak_name = names_lookup[idx]

		if indexes_lookup[tweak_name] then
			Application:error("[DOTTweakData:_setup_networking] Duplicate tweak entry with name '" .. tostring(tweak_name) .. "'. This will cause issues both locally and when syncing if not addressed.")
		end

		indexes_lookup[tweak_name] = idx
	end

	if #indexes_lookup > 512 then
		Application:error("[DOTTweakData:_setup_networking] Total amount of tweak entries exceeds limit set for RPC in network.network_settings. Amount: " .. tostring(#indexes_lookup) .. " | Max amount: " .. tostring(512))
	end
end

function DOTTweakData:get_sync_index_from_name(tweak_name)
	return self._name_to_idx[tweak_name]
end

function DOTTweakData:get_name_from_sync_index(tweak_idx)
	return self._idx_to_name[tweak_idx]
end

function DOTTweakData:get_dot_data(tweak_name)
	for variant, dot_entries in pairs(self.dot_entries) do
		if dot_entries[tweak_name] then
			return dot_entries[tweak_name]
		end
	end

	return nil
end
