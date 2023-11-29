DOTManager = DOTManager or class()

function DOTManager:init()
	self._doted_units = {}
	self._doted_units_lookup = {}
end

function DOTManager:update(t, dt)
	local doted_units = self._doted_units
	local dot_info = nil

	for i = #doted_units, 1, -1 do
		dot_info = doted_units[i]

		if dot_info then
			for var_name, var_info in pairs(dot_info.variants) do
				var_info.dot_counter = var_info.dot_counter + dt

				if var_info.dot_tick_period <= var_info.dot_counter then
					var_info.dot_ticks_remaining = var_info.dot_ticks_remaining - 1
					var_info.dot_counter = var_info.dot_counter - var_info.dot_tick_period
					local killed = self:_damage_dot(dot_info, var_info)

					if killed then
						break
					end
				end

				if var_info.dot_ticks_remaining <= 0 then
					self:_remove_variant(dot_info, var_name)

					if not next(dot_info.variants) then
						self:_remove_dot(dot_info, false)

						break
					end
				end
			end
		end
	end
end

function DOTManager:_remove_dot(dot_info, destroyed)
	table.delete(self._doted_units, dot_info)

	self._doted_units_lookup[dot_info.unit_key] = nil

	self:_on_removed_dot(dot_info, destroyed)
end

function DOTManager:_remove_variant(dot_info, var_name)
	local var_info = dot_info.variants[var_name]
	dot_info.variants[var_name] = nil

	self:_on_removed_variant(dot_info, var_info, false)
end

function DOTManager:_clbk_doted_unit_died(dot_info)
	self:_remove_dot(dot_info, false)
end

function DOTManager:_clbk_doted_unit_destroyed(dot_info)
	self:_remove_dot(dot_info, true)
end

function DOTManager:_on_removed_dot(dot_info, destroyed)
	if not destroyed then
		if dot_info.death_listener_key then
			dot_info.unit:character_damage():remove_listener(dot_info.death_listener_key)

			dot_info.death_listener_key = nil
		end

		if dot_info.destroy_listener_key then
			local destroy_listener_class = dot_info.unit:base()
			destroy_listener_class = destroy_listener_class and destroy_listener_class.add_destroy_listener and destroy_listener_class or dot_info.unit:unit_data() or nil
			destroy_listener_class = destroy_listener_class and destroy_listener_class.add_destroy_listener and destroy_listener_class or nil

			if destroy_listener_class then
				destroy_listener_class:remove_destroy_listener(dot_info.destroy_listener_key)
			end

			dot_info.destroy_listener_key = nil
		end
	end

	for var_name, var_info in pairs(dot_info.variants) do
		self:_on_removed_variant(dot_info, var_info, destroyed)
	end
end

function DOTManager:_on_removed_variant(dot_info, var_info, destroyed)
	if var_info.effects then
		local effect_m = World:effect_manager()
		local kill_f = destroyed and effect_m.kill or effect_m.fade_kill

		for _, effect_id in ipairs(var_info.effects) do
			kill_f(effect_m, effect_id)
		end

		var_info.effects = nil
	end

	if var_info.sound_source then
		var_info.sound_source:stop()

		var_info.sound_source = nil
	end

	if var_info.on_removed_clbk then
		var_info.on_removed_clbk(dot_info, var_info, destroyed)
	end
end

function DOTManager:is_enemy_doted(unit, by_variant)
	local dot_info = self._doted_units_lookup[unit:key()]

	if dot_info then
		if not by_variant then
			return true
		elseif dot_info.variants[by_variant] then
			return true
		end
	end

	return false
end

function DOTManager:add_doted_enemy(data)
	local dot_info, var_info, should_sync = self:_add_doted_enemy(data)

	if should_sync then
		if data.unit:id() == -1 then
			Application:error("[DOTManager:add_doted_enemy] Unit is not network-synced, can't sync dot.", data.unit)

			return dot_info, var_info
		end

		local tweak_sync_index = tweak_data.dot:get_sync_index_from_name(data.dot_data.name)

		if not tweak_sync_index then
			Application:error("[DOTManager:add_doted_enemy] No sync index found for tweak name '" .. tostring(data.dot_data.name) .. "', can't sync dot.")

			return dot_info, var_info
		end

		local selection_index = nil
		local weapon = data.weapon_unit
		local attacker = data.attacker_unit
		attacker = attacker and attacker:id() ~= -1 and attacker or nil

		if weapon then
			local base_ext = weapon:base()
			selection_index = base_ext and base_ext.selection_index and base_ext:selection_index()
			weapon = weapon:id() ~= -1 and weapon or nil
		end

		local is_melee = tweak_data.blackmarket and tweak_data.blackmarket.melee_weapons and tweak_data.blackmarket.melee_weapons[data.weapon_id] and true or false
		local hurt_anim = data.hurt_animation and true or false

		managers.network:session():send_to_peers_synched("sync_add_doted_enemy", data.unit, attacker, weapon, is_melee, hurt_anim, tweak_sync_index, selection_index or 0)
	end

	return dot_info, var_info
end

function DOTManager:sync_add_dot(...)
	self:_add_doted_enemy(...)
end

function DOTManager:_chk_local_updating(var_info)
	local is_local_player = false
	local attacker = var_info.last_attacker_unit
	local base_ext = alive(attacker) and attacker:base()

	if base_ext then
		if base_ext.thrower_unit then
			attacker = base_ext:thrower_unit()
			base_ext = alive(attacker) and attacker:base()
		end

		is_local_player = base_ext and base_ext.is_local_player
	end

	if Network:is_server() then
		var_info.can_deal_damage = not base_ext or not base_ext.is_husk_player or false
	else
		var_info.can_deal_damage = is_local_player or false
	end

	var_info.check_achievements = var_info.check_achievements or is_local_player
end

function DOTManager:_is_new_dot_stronger(var_info, data, t)
	local damage_left_to_deal = var_info.dot_ticks_remaining * var_info.dot_damage
	local new_total_damage = math.max(1, math.floor((data.modified_length or data.dot_data.dot_length) / data.dot_data.dot_tick_period)) * data.dot_data.dot_damage

	if damage_left_to_deal < new_total_damage then
		return true, false
	elseif damage_left_to_deal == new_total_damage then
		local old_length = var_info.dot_applied_time + var_info.dot_length
		local new_length = t + (data.modified_length or data.dot_data.dot_length)

		if old_length < new_length then
			return false, true
		end
	end

	return false, false
end

function DOTManager:_add_variant_data(dot_info, data, t)
	t = t or data.time_override or TimerManager:game():time()
	local var_info = {}
	dot_info.variants[data.dot_data.variant] = var_info
	var_info.variant = data.dot_data.variant
	var_info.damage_class = data.dot_data.damage_class
	var_info.last_weapon_id = data.weapon_id
	var_info.last_weapon_unit = data.weapon_unit
	var_info.last_attacker_unit = data.attacker_unit
	var_info.hurt_animation = data.hurt_animation
	var_info.apply_hurt_once = data.dot_data.apply_hurt_once
	var_info.dot_applied_time = t
	var_info.dot_damage = data.dot_data.dot_damage
	var_info.dot_length = data.modified_length or data.dot_data.dot_length
	var_info.dot_tick_period = data.dot_data.dot_tick_period
	var_info.dot_grace_period = data.dot_data.dot_grace_period
	var_info.dot_ticks_remaining = math.max(1, math.floor(var_info.dot_length / var_info.dot_tick_period))
	var_info.dot_counter = var_info.dot_tick_period - math.max(var_info.dot_tick_period, var_info.dot_grace_period)

	if data.on_added_clbk then
		data.on_added_clbk(dot_info, var_info, data)
	end

	var_info.on_removed_clbk = data.on_removed_clbk
	var_info.check_achivements_clbk = data.check_achivements_clbk

	self:_chk_local_updating(var_info)
end

function DOTManager:_update_variant_override(dot_info, var_info, data, t)
	t = t or data.time_override or TimerManager:game():time()
	var_info.damage_class = data.dot_data.damage_class
	var_info.last_weapon_id = data.weapon_id
	var_info.last_weapon_unit = data.weapon_unit
	var_info.last_attacker_unit = data.attacker_unit
	var_info.hurt_animation = data.hurt_animation
	var_info.apply_hurt_once = data.dot_data.apply_hurt_once
	var_info.dot_applied_time = t
	var_info.dot_damage = data.dot_data.dot_damage
	var_info.dot_length = data.modified_length or data.dot_data.dot_length
	var_info.dot_tick_period = data.dot_data.dot_tick_period
	var_info.dot_grace_period = data.dot_data.dot_grace_period
	var_info.dot_ticks_remaining = math.max(1, math.floor(var_info.dot_length / var_info.dot_tick_period))

	if data.on_updated_override_clbk then
		data.on_updated_override_clbk(dot_info, var_info, data)
	end

	self:_chk_local_updating(var_info)
end

function DOTManager:_update_variant(dot_info, var_info, data, t)
	t = t or data.time_override or TimerManager:game():time()
	var_info.last_weapon_id = data.weapon_id
	var_info.last_weapon_unit = data.weapon_unit
	var_info.last_attacker_unit = data.attacker_unit
	var_info.hurt_animation = data.hurt_animation
	var_info.dot_applied_time = t
	var_info.dot_ticks_remaining = math.max(1, math.floor(var_info.dot_length / var_info.dot_tick_period))

	if data.on_updated_clbk then
		data.on_updated_clbk(dot_info, var_info, data)
	end

	self:_chk_local_updating(var_info)
end

function DOTManager:_update_variant_attacker(dot_info, var_info, data, t)
	self:_chk_local_updating(var_info)
end

function DOTManager:_add_doted_enemy(data)
	local target_unit = data.unit
	local char_dmg_ext = target_unit:character_damage()

	if not char_dmg_ext or char_dmg_ext.dead and char_dmg_ext:dead() then
		if not char_dmg_ext then
			Application:error("[DOTManager:_add_doted_enemy] Unit has no 'character_damage' extension, can't add.", target_unit)
		else
			Application:error("[DOTManager:_add_doted_enemy] Unit is dead, can't add or update dot.", target_unit)
		end

		return nil, nil, false
	end

	local t = data.time_override or TimerManager:game():time()
	local unit_key = target_unit:key()
	local existing_dot_info = self._doted_units_lookup[unit_key]

	if existing_dot_info then
		local should_sync = true
		local existing_var_info = existing_dot_info.variants[data.dot_data.variant]

		if existing_var_info then
			local is_stronger, should_update = self:_is_new_dot_stronger(existing_var_info, data, t)

			if is_stronger then
				self:_update_variant_override(existing_dot_info, existing_var_info, data, t)
			elseif should_update then
				self:_update_variant(existing_dot_info, existing_var_info, data, t)
			else
				should_sync = false

				self:_update_variant_attacker(existing_dot_info, existing_var_info, data)
			end
		else
			existing_var_info = self:_add_variant_data(existing_dot_info, data, t)

			self:check_achievemnts()
		end

		return existing_dot_info, existing_var_info, should_sync
	end

	if not char_dmg_ext.add_listener then
		Application:error("[DOTManager:_add_doted_enemy] No listener functionality in 'character_damage' extension to listen for death event, can't add.", target_unit)

		return nil, nil, false
	end

	local destroy_listener_class = target_unit:base()
	destroy_listener_class = destroy_listener_class and destroy_listener_class.add_destroy_listener and destroy_listener_class or target_unit:unit_data() or nil
	destroy_listener_class = destroy_listener_class and destroy_listener_class.add_destroy_listener and destroy_listener_class or nil

	if not destroy_listener_class then
		Application:error("[DOTManager:_add_doted_enemy] No 'base' or 'unit_data' extension, or no destroy listener functionality in either, can't add.", target_unit)

		return nil, nil, false
	end

	local new_dot_info = {
		unit = target_unit,
		unit_key = unit_key,
		death_listener_key = "doted_unit_died" .. tostring(unit_key),
		destroy_listener_key = "doted_unit_destroyed" .. tostring(unit_key),
		variants = {}
	}

	char_dmg_ext:add_listener(new_dot_info.death_listener_key, {
		"death"
	}, callback(self, self, "_clbk_doted_unit_died", new_dot_info))
	destroy_listener_class:add_destroy_listener(new_dot_info.destroy_listener_key, callback(self, self, "_clbk_doted_unit_destroyed", new_dot_info))

	local var_info = self:_add_variant_data(new_dot_info, data, t)

	table.insert(self._doted_units, 1, new_dot_info)

	self._doted_units_lookup[unit_key] = new_dot_info

	self:check_achievemnts()

	return new_dot_info, var_info, true
end

function DOTManager:check_achievemnts()
	local dotted_enemies_by_variant = {}
	local base_ext, tweak_name = nil
	local is_civ_f = CopDamage.is_civilian

	for i, dot_info in ipairs(self._doted_units) do
		base_ext = dot_info.unit:base()
		tweak_name = base_ext and base_ext.char_tweak_name and base_ext:char_tweak_name()

		if tweak_name and not is_civ_f(tweak_name) then
			for var_name, var_info in pairs(dot_info.variants) do
				if var_info.check_achivements_clbk then
					var_info.check_achivements_clbk(dot_info.unit, var_info)
				elseif var_info.check_achievements then
					dotted_enemies_by_variant[var_name] = dotted_enemies_by_variant[var_name] or {}

					table.insert(dotted_enemies_by_variant[var_name], true)
				end
			end
		end
	end

	if not tweak_data.achievement.dot_achievements then
		return
	end

	local variant_count_pass, all_pass = nil

	for achievement, achievement_data in pairs(tweak_data.achievement.dot_achievements) do
		variant_count_pass = not achievement_data.count or achievement_data.variant and dotted_enemies_by_variant[achievement_data.variant] and achievement_data.count <= #dotted_enemies_by_variant[achievement_data.variant]
		all_pass = variant_count_pass

		if all_pass then
			managers.achievment:award_data(achievement_data)
		end
	end
end

function DOTManager:_damage_dot(dot_info, var_info)
	if not var_info.damage_class then
		return false
	end

	if not var_info.can_deal_damage then
		if var_info.apply_hurt_once then
			var_info.hurt_animation = false
		end

		return false
	end

	local damage_class = CoreSerialize.string_to_classtable(var_info.damage_class)

	if damage_class and damage_class.give_damage_dot then
		local col_ray = {
			unit = dot_info.unit
		}
		local weapon_unit = var_info.last_weapon_unit
		weapon_unit = alive(weapon_unit) and weapon_unit or nil
		local attacker = var_info.last_attacker_unit
		attacker = alive(attacker) and attacker or nil

		if attacker then
			local base_ext = attacker:base()

			if base_ext and base_ext.thrower_unit then
				attacker = base_ext:thrower_unit()
				attacker = alive(attacker) and attacker or nil
			end
		end

		local result = damage_class:give_damage_dot(col_ray, weapon_unit, attacker, var_info.dot_damage, var_info.hurt_animation, var_info.last_weapon_id, var_info.variant)

		if result and result ~= "friendly_fire" then
			local base_ext = weapon_unit and weapon_unit:base()

			if base_ext and base_ext.thrower_unit and base_ext._check_achievements then
				local is_dead = result.type == "death"

				base_ext:_check_achievements(dot_info.unit, is_dead, result.damage_percent or 0, 1, is_dead and 1 or 0, var_info.variant)
			end
		end

		if var_info.apply_hurt_once then
			var_info.hurt_animation = false
		end
	elseif damage_class then
		Application:error("[DOTManager:_damage_dot] Class '" .. tostring(var_info.damage_class) .. "' lacks 'give_damage_dot' function.")
	else
		Application:error("[DOTManager:_damage_dot] No class found with '" .. tostring(var_info.damage_class) .. "'.")
	end

	return not alive(dot_info.unit) or dot_info.unit:character_damage().dead and dot_info.unit:character_damage():dead()
end

function DOTManager:on_simulation_ended()
	local doted_units = self._doted_units

	for i = #doted_units, 1, -1 do
		self:_on_removed_dot(doted_units[i], false)
	end

	self._doted_units = {}
	self._doted_units_lookup = {}
end
