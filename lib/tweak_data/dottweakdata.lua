DOTTweakData = DOTTweakData or class()
DOTTweakData.MAX_DOT_ENTRIES_READ_ONLY = 512

function DOTTweakData:init(tweak_data)
	self:_init_tweak_data()
	self:_init_dot_entries(tweak_data)
	self:_process_dot_entries()
	self:_setup_networking()
end

function DOTTweakData:_init_tweak_data()
	return
end

function DOTTweakData:_init_dot_entries(...)
	local entries = {}

	self.dot_entries = entries

	self:_init_dot_entries_poison(entries, ...)
	self:_init_dot_entries_fire(entries, ...)
end

function DOTTweakData:_init_dot_entries_fire(entries, tweak_data)
	local fire_entries = tweak_data.fire.dot_entries

	if not fire_entries then
		return
	end

	for dot_type, dot_entry in pairs(fire_entries) do
		if entries[dot_type] then
			Application:error("[DOTTweakData] _init_dot_entries_fire() - dot entry for type '" .. tostring(dot_type) .. "' already exists.", inspect(entries[dot_type]), inspect(dot_entry))
		end

		entries[dot_type] = dot_entry
	end
end

function DOTTweakData:_init_dot_entries_poison(entries)
	local variant = "poison"
	local poison_entries = {}

	entries[variant] = poison_entries

	local default_name = "default_" .. variant

	poison_entries[default_name] = {
		PROCESSED = true,
		damage_class = "PoisonBulletBase",
		dot_damage = 25,
		dot_grace_period = 1,
		dot_length = 6,
		dot_tick_period = 0.5,
		variant = variant,
		name = default_name
	}
	poison_entries.weapon_dotbulletbase = {
		dot_damage = 0.5
	}
	poison_entries.ammo_proj_bow = {
		damage_class = "ProjectilesPoisonBulletBase"
	}
	poison_entries.ammo_proj_crossbow = table.map_copy(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_arblast = table.map_copy(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_frankish = table.map_copy(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_long = table.map_copy(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_ecp = table.map_copy(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_elastic = table.map_copy(poison_entries.ammo_proj_bow)
	poison_entries.ammo_proj_dart = table.map_copy(poison_entries.ammo_proj_bow)
	poison_entries.ammo_rip = {
		dot_damage = 12,
		dot_length = 5,
		use_weapon_damage_falloff = true
	}
	poison_entries.melee_piggy_hammer = {
		dot_damage = 12,
		dot_length = 5
	}
	poison_entries.melee_cqc = {
		dot_length = 1,
		hurt_animation_chance = 0.7
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

function DOTTweakData:_setup_networking()
	local names_lookup = {}

	self._idx_to_name = names_lookup

	if self.dot_entries then
		local modded_entries = {}
		local t_ins = table.insert

		for variant, dot_tweaks in pairs(self.dot_entries) do
			for dot_tweak_name, dot_tweak_data in pairs(dot_tweaks) do
				if dot_tweak_data.MODDED then
					t_ins(modded_entries, dot_tweak_name)
				else
					t_ins(names_lookup, dot_tweak_name)
				end
			end
		end

		table.sort(names_lookup)
		table.sort(modded_entries)
		table.list_append(names_lookup, modded_entries)
	end

	local limit = DOTTweakData.MAX_DOT_ENTRIES_READ_ONLY

	if limit < #names_lookup then
		Application:error("[DOTTweakData] _setup_networking() - amount of tweak entries exceeds limit set for RPC in network_settings.", tostring(#names_lookup) .. " > " .. tostring(limit))
	end

	self._name_to_idx = table.reverse_map(names_lookup)
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

function DOTTweakData:mod_add_dot_tweak_entries(new_entries)
	for dot_type, dot_tweak_entries in pairs(new_entries) do
		local entries = self.dot_entries[dot_type]

		if not entries then
			entries = {}
			self.dot_entries[dot_type] = entries
		end

		for dot_name, dot_tweak_data in pairs(dot_tweak_entries) do
			dot_tweak_data.MODDED = true

			if entries[dot_name] then
				Application:error("[DOTTweakData] mod_add_dot_tweak_entries() - dot entry with name \"" .. tostring(dot_name) .. "\" already exists!")
			else
				entries[dot_name] = dot_tweak_data
			end
		end
	end

	self:_process_dot_entries()
	self:_setup_networking()
end
