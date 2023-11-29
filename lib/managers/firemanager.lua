FireManager = FireManager or class()
local idstr_small_light_fire = Idstring("effects/particles/fire/small_light_fire")
local idstr_explosion_std = Idstring("explosion_std")
local empty_idstr = Idstring("")
local molotov_effect = "effects/payday2/particles/explosions/molotov_grenade"

function FireManager:init()
	self._dozers_on_fire = {}
	self._enemies_on_fire = {}
end

function FireManager:_on_dot_removed(dot_info, var_info)
	if self._dozers_on_fire[dot_info.unit_key] and self._dozers_on_fire[dot_info.unit_key][var_info.variant] then
		self._dozers_on_fire[dot_info.unit_key][var_info.variant] = nil

		if not next(self._dozers_on_fire[dot_info.unit_key]) then
			self._dozers_on_fire[dot_info.unit_key] = nil
		end
	end

	if self._enemies_on_fire[dot_info.unit_key] and self._enemies_on_fire[dot_info.unit_key][var_info.variant] then
		self._enemies_on_fire[dot_info.unit_key][var_info.variant] = nil

		if not next(self._enemies_on_fire[dot_info.unit_key]) then
			self._enemies_on_fire[dot_info.unit_key] = nil
		end
	end
end

function FireManager:check_achievements(unit, var_info)
	unit = var_info.check_achievements and alive(unit) and unit or nil
	local u_key = unit and unit:key()
	local base_ext = unit and unit:base()

	if u_key and tweak_data.achievement.disco_inferno then
		self._enemies_on_fire[u_key] = self._enemies_on_fire[u_key] or {}
		self._enemies_on_fire[u_key][var_info.variant] = true

		if table.size(self._enemies_on_fire) >= 10 then
			managers.achievment:award(tweak_data.achievement.disco_inferno)
		end
	end

	if tweak_data.achievement.overgrill then
		local t = TimerManager:game():time()

		if u_key and (not self._dozers_on_fire[u_key] or not self._dozers_on_fire[u_key][var_info.variant]) and base_ext and base_ext.has_tag and base_ext:has_tag("tank") then
			self._dozers_on_fire[u_key] = self._dozers_on_fire[u_key] or {}
			self._dozers_on_fire[u_key][var_info.variant] = t
		end

		for u_key, var_entries in pairs(self._dozers_on_fire) do
			for var, added_t in pairs(var_entries) do
				if t - added_t >= 10 then
					managers.achievment:award(tweak_data.achievement.overgrill)

					break
				end
			end
		end
	end
end

function FireManager:is_set_on_fire(unit, variant)
	return managers.dot:is_enemy_doted(unit, variant or "fire")
end

function FireManager:_chk_add_clbks_to_data(data)
	data.on_added_clbk = data.on_added_clbk or callback(self, self, "_clbk_on_dot_var_added")
	data.on_updated_clbk = data.on_updated_clbk or callback(self, self, "_clbk_on_dot_var_updated")
	data.on_updated_override_clbk = data.on_updated_override_clbk or callback(self, self, "_clbk_on_dot_var_updated_override")
	data.on_removed_clbk = data.on_removed_clbk or callback(self, self, "_clbk_on_dot_var_removed")
	data.check_achivements_clbk = data.check_achivements_clbk or callback(self, self, "check_achievements")
end

function FireManager:add_doted_enemy(...)
	self:_chk_add_clbks_to_data(...)
	managers.dot:add_doted_enemy(...)
end

function FireManager:sync_add_dot(...)
	self:_chk_add_clbks_to_data(...)
	managers.dot:sync_add_dot(...)
end

function FireManager:should_sync_dot_through_here(...)
	if tweak_data.fire:has_dot(...) then
		return true
	end

	return false
end

function FireManager:_clbk_on_dot_var_added(dot_info, var_info, data)
	var_info.burn_sound_name = data.dot_data.burn_sound_name
	var_info.burn_fade_sound_name = data.dot_data.burn_fade_sound_name
	var_info.fire_effect_variant = data.dot_data.fire_effect_variant

	if not var_info.burn_sound_source and var_info.burn_sound_name ~= "no_sound" then
		self:start_burn_body_sound(dot_info.unit, var_info, nil)
	end

	if not var_info.fire_effects then
		self:_start_enemy_fire_effect(dot_info.unit, var_info)
	end
end

function FireManager:_clbk_on_dot_var_updated(dot_info, var_info, data)
	local cur_sound = var_info.burn_sound_name or var_info.burn_sound_source and var_info.burn_sound_source.burn_sound_name
	var_info.burn_sound_name = data.dot_data.burn_sound_name
	var_info.burn_fade_sound_name = data.dot_data.burn_fade_sound_name

	if cur_sound ~= var_info.burn_sound_name then
		if var_info.burn_sound_source then
			var_info.burn_sound_source.destroyed = true

			self:stop_burn_body_sound(var_info.burn_sound_source)

			var_info.burn_sound_source = nil
		end

		if var_info.burn_sound_name ~= "no_sound" then
			self:start_burn_body_sound(dot_info.unit, var_info, nil)
		end
	end

	local cur_effect = var_info.fire_effect_variant
	var_info.fire_effect_variant = data.dot_data.fire_effect_variant

	if cur_effect ~= var_info.fire_effect_variant then
		if var_info.fire_effects then
			self:stop_enemy_fire_effects(var_info, false)

			var_info.fire_effects = nil
		end

		self:_start_enemy_fire_effect(dot_info.unit, var_info)
	end
end

function FireManager:_clbk_on_dot_var_updated_override(...)
	self:_clbk_on_dot_var_updated(...)
end

function FireManager:_clbk_on_dot_var_removed(dot_info, var_info, destroyed)
	self:_on_dot_removed(dot_info, var_info)

	if var_info.fire_effects then
		self:stop_enemy_fire_effects(var_info, destroyed)

		var_info.fire_effects = nil
	end

	if var_info.burn_sound_source then
		var_info.burn_sound_source.destroyed = destroyed

		self:stop_burn_body_sound(var_info.burn_sound_source)

		var_info.burn_sound_source = nil
	end
end

function FireManager:stop_enemy_fire_effects(entry, destroyed)
	if entry.fire_effects then
		local effect_m = World:effect_manager()
		local kill_f = destroyed and effect_m.kill or effect_m.fade_kill

		for _, effect_id in ipairs(entry.fire_effects) do
			kill_f(effect_m, effect_id)
		end
	end
end

function FireManager:start_burn_body_sound(unit, entry, delay)
	local sound_loop_burn_body = SoundDevice:create_source("FireBurnBody")
	local found_bone = nil

	for idx, sound_bone in ipairs(tweak_data.fire.fire_bones_sound) do
		found_bone = unit:get_object(Idstring(sound_bone))

		if found_bone then
			break
		end
	end

	if found_bone then
		sound_loop_burn_body:link(found_bone)
	else
		sound_loop_burn_body:set_position(unit:position())
	end

	sound_loop_burn_body:post_event(entry.burn_sound_name or "burn_loop_body")

	local key_str = tostring(unit:key())
	local data = {
		sound_source = sound_loop_burn_body,
		key_str = key_str,
		burn_sound_name = entry.burn_sound_name,
		burn_fade_sound_name = entry.burn_fade_sound_name
	}
	entry.burn_sound_name = nil
	entry.burn_fade_sound_name = nil
	entry.burn_sound_source = data

	if delay then
		data.stop_clbk_id = "FireBurnBody" .. key_str

		managers.enemy:add_delayed_clbk(data.stop_clbk_id, callback(self, self, "stop_burn_body_sound", data), TimerManager:game():time() + delay - 0.5)
	end
end

function FireManager:stop_burn_body_sound(data)
	if data.stop_clbk_id then
		if managers.enemy:is_clbk_registered(data.stop_clbk_id) then
			managers.enemy:remove_delayed_clbk(data.stop_clbk_id)
		end

		data.stop_clbk_id = nil
	end

	if data.destroyed or data.burn_fade_sound_name == "no_sound" then
		data.sound_source:stop()
	else
		data.sound_source:post_event(data.burn_fade_sound_name or "burn_loop_body_stop")
		managers.enemy:add_delayed_clbk("FireBurnBodyFade" .. data.key_str, callback(self, self, "_release_sound_source", {
			sound_source = data.sound_source
		}), TimerManager:game():time() + 0.5)
	end
end

function FireManager:_release_sound_source(...)
end

local tmp_used_flame_objects = nil

function FireManager:_start_enemy_fire_effect(unit, entry)
	local fire_td = tweak_data.fire
	local fire_bones = fire_td.fire_bones

	if not tmp_used_flame_objects then
		tmp_used_flame_objects = {}

		for _, effect in ipairs(fire_bones) do
			table.insert(tmp_used_flame_objects, false)
		end
	end

	local effect_category = entry.fire_effect_variant and fire_td.effects[entry.fire_effect_variant] or fire_td.effects.endless
	local num_objects = #fire_bones
	local num_effects = num_objects == 0 and 0 or num_objects <= 3 and math.random(num_objects) or math.random(3, num_objects)
	local effects_table = {}
	local costs = fire_td.effects_cost
	local get_object_f = unit.get_object
	local effect_m = World:effect_manager()
	local spawn_f = effect_m.spawn
	local idx = 1
	local effect_id = nil

	for i = 1, num_effects do
		while tmp_used_flame_objects[idx] do
			idx = math.random(num_objects)
		end

		local effect_name = effect_category[costs[i] or "cheap"]

		if effect_name then
			local bone = get_object_f(unit, Idstring(fire_bones[idx]))

			if bone then
				effect_id = spawn_f(effect_m, {
					effect = Idstring(effect_name),
					parent = bone
				})

				table.insert(effects_table, effect_id)
			end
		end

		tmp_used_flame_objects[idx] = true
	end

	entry.fire_effects = effects_table

	for idx, _ in ipairs(tmp_used_flame_objects) do
		tmp_used_flame_objects[idx] = false
	end
end

function FireManager:give_local_player_dmg(pos, range, damage)
	local player = managers.player:player_unit()

	if player then
		player:character_damage():damage_fire({
			variant = "fire",
			position = pos,
			range = range,
			damage = damage
		})
	end
end

function FireManager:detect_and_give_dmg(params)
	local hit_pos = params.hit_pos
	local slotmask = params.collision_slotmask
	local user_unit = params.user
	local dmg = params.damage
	local player_dmg = params.player_damage or dmg
	local range = params.range
	local ignore_unit = params.ignore_unit
	local curve_pow = params.curve_pow
	local col_ray = params.col_ray
	local alert_filter = params.alert_filter or managers.groupai:state():get_unit_type_filter("civilians_enemies")
	local owner = params.owner
	local push_units = false
	local dot_data = params.dot_data
	local results = {}
	local is_molotov = params.is_molotov

	if params.push_units ~= nil then
		push_units = params.push_units
	end

	local player = managers.player:player_unit()

	if alive(player) and player_dmg ~= 0 then
		player:character_damage():damage_fire({
			variant = "fire",
			position = hit_pos,
			range = range,
			damage = player_dmg
		})
	end

	local cast_c_class = alive(ignore_unit) and ignore_unit or World
	local bodies = cast_c_class:find_bodies("intersect", "sphere", hit_pos, range, slotmask)
	local splinters = {
		mvector3.copy(hit_pos)
	}
	local dirs = {
		Vector3(range, 0, 0),
		Vector3(-range, 0, 0),
		Vector3(0, range, 0),
		Vector3(0, -range, 0),
		Vector3(0, 0, range),
		Vector3(0, 0, -range)
	}
	local pos = Vector3()

	for _, dir in ipairs(dirs) do
		mvector3.set(pos, dir)
		mvector3.add(pos, hit_pos)

		local splinter_ray = cast_c_class:raycast("ray", hit_pos, pos, "slot_mask", slotmask)
		pos = (splinter_ray and splinter_ray.position or pos) - dir:normalized() * math.min(splinter_ray and splinter_ray.distance or 0, 10)
		local near_splinter = false

		for _, s_pos in ipairs(splinters) do
			if mvector3.distance_sq(pos, s_pos) < 900 then
				near_splinter = true

				break
			end
		end

		if not near_splinter then
			table.insert(splinters, mvector3.copy(pos))
		end
	end

	local count_cops = 0
	local count_gangsters = 0
	local count_civilians = 0
	local count_cop_kills = 0
	local count_gangster_kills = 0
	local count_civilian_kills = 0
	local characters_hit = {}
	local units_to_push = {}
	local hit_units = {}
	local ignore_units = {}

	if alive(ignore_unit) then
		table.insert(ignore_units, ignore_unit)
	end

	if not params.no_raycast_check_characters then
		for _, hit_body in ipairs(bodies) do
			local character = hit_body:unit():character_damage() and hit_body:unit():character_damage().damage_fire

			if character then
				table.insert(ignore_units, hit_body:unit())
			end
		end
	end

	local type = nil

	for _, hit_body in ipairs(bodies) do
		local character = hit_body:unit():character_damage() and hit_body:unit():character_damage().damage_fire
		local apply_dmg = hit_body:extension() and hit_body:extension().damage
		units_to_push[hit_body:unit():key()] = hit_body:unit()
		local dir, len, damage, ray_hit = nil

		if character and not characters_hit[hit_body:unit():key()] then
			if params.no_raycast_check_characters then
				ray_hit = true
				characters_hit[hit_body:unit():key()] = true
			else
				for i_splinter, s_pos in ipairs(splinters) do
					ray_hit = not World:raycast("ray", s_pos, hit_body:center_of_mass(), "slot_mask", slotmask, "ignore_unit", ignore_units, "report")

					if ray_hit then
						characters_hit[hit_body:unit():key()] = true

						break
					end
				end
			end

			if ray_hit then
				local hit_unit = hit_body:unit()

				if hit_unit:base() and hit_unit:base()._tweak_table and not hit_unit:character_damage():dead() then
					type = hit_unit:base()._tweak_table

					if CopDamage.is_civilian(type) then
						count_civilians = count_civilians + 1
					elseif CopDamage.is_gangster(type) then
						count_gangsters = count_gangsters + 1
					elseif type ~= "russian" and type ~= "german" and type ~= "spanish" and type ~= "american" and type ~= "jowi" then
						if type ~= "hoxton" then
							count_cops = count_cops + 1
						end
					end
				end
			end
		elseif apply_dmg or hit_body:dynamic() then
			ray_hit = true
		end

		if ray_hit then
			dir = hit_body:center_of_mass()
			len = mvector3.direction(dir, hit_pos, dir)
			damage = dmg

			if apply_dmg then
				self:_apply_body_damage(true, hit_body, user_unit, dir, damage)
			end

			damage = math.max(damage, 1)
			local hit_unit = hit_body:unit()
			hit_units[hit_unit:key()] = hit_unit

			if character then
				local dead_before = hit_unit:character_damage():dead()
				local col_ray = {
					unit = hit_unit,
					position = hit_body:position(),
					ray = dir
				}
				local action_data = {
					variant = "fire",
					damage = damage,
					attacker_unit = user_unit,
					weapon_unit = owner,
					col_ray = col_ray,
					is_molotov = is_molotov
				}
				local t = TimerManager:game():time()
				local defense_data = hit_unit:character_damage():damage_fire(action_data)
				local dead_now = hit_unit:character_damage():dead()

				if not dead_before and hit_unit:base() and hit_unit:base()._tweak_table and dead_now then
					type = hit_unit:base()._tweak_table

					if CopDamage.is_civilian(type) then
						count_civilian_kills = count_civilian_kills + 1
					elseif CopDamage.is_gangster(type) then
						count_gangster_kills = count_gangster_kills + 1
					elseif type ~= "russian" and type ~= "german" and type ~= "spanish" then
						if type ~= "american" then
							count_cop_kills = count_cop_kills + 1
						end
					end
				end

				if dot_data and not dead_now and defense_data and defense_data ~= "friendly_fire" and hit_unit:character_damage().damage_dot then
					local damage_class = CoreSerialize.string_to_classtable(dot_data.damage_class)

					if damage_class then
						damage_class:start_dot_damage(col_ray, owner, dot_data, nil, user_unit, defense_data)
					else
						Application:error("[FireManager:detect_and_give_dmg] No '" .. tostring(dot_data.damage_class) .. "' class found for dot tweak with name '" .. tostring(dot_data.name) .. "'.")
					end
				end
			end
		end
	end

	if not params.no_alert then
		local alert_radius = params.alert_radius or 3000
		local alert_unit = user_unit

		if alive(alert_unit) and alert_unit:base() and alert_unit:base().thrower_unit then
			alert_unit = alert_unit:base():thrower_unit()
		end

		managers.groupai:state():propagate_alert({
			"fire",
			hit_pos,
			alert_radius,
			alert_filter,
			alert_unit
		})
	end

	if push_units and push_units == true then
		managers.explosion:units_to_push(units_to_push, hit_pos, range)
	end

	if owner then
		results.count_cops = count_cops
		results.count_gangsters = count_gangsters
		results.count_civilians = count_civilians
		results.count_cop_kills = count_cop_kills
		results.count_gangster_kills = count_gangster_kills
		results.count_civilian_kills = count_civilian_kills
	end

	return hit_units, splinters, results
end

function FireManager:units_to_push(units_to_push, hit_pos, range)
end

function FireManager:_apply_body_damage(is_server, hit_body, user_unit, dir, damage)
	local hit_unit = hit_body:unit()
	local local_damage = is_server or hit_unit:id() == -1
	local sync_damage = is_server and hit_unit:id() ~= -1

	if not local_damage and not sync_damage then
		print("_apply_body_damage skipped")

		return
	end

	local normal = dir
	local prop_damage = math.min(damage, 200)

	if prop_damage < 0.25 then
		prop_damage = math.round(prop_damage, 0.25)
	end

	if prop_damage == 0 then
		-- Nothing
	end

	if prop_damage > 0 then
		local local_damage = is_server or hit_unit:id() == -1
		local sync_damage = is_server and hit_unit:id() ~= -1
		local network_damage = math.ceil(prop_damage * 163.84)
		prop_damage = network_damage / 163.84

		if local_damage then
			hit_body:extension().damage:damage_fire(user_unit, normal, hit_body:position(), dir, prop_damage)
			hit_body:extension().damage:damage_damage(user_unit, normal, hit_body:position(), dir, prop_damage)
		end

		if sync_damage and managers.network:session() then
			if alive(user_unit) then
				managers.network:session():send_to_peers_synched("sync_body_damage_fire", hit_body, user_unit, normal, hit_body:position(), dir, math.min(32768, network_damage))
			else
				managers.network:session():send_to_peers_synched("sync_body_damage_fire_no_attacker", hit_body, normal, hit_body:position(), dir, math.min(32768, network_damage))
			end
		end
	end
end

function FireManager:explode_on_client(position, normal, user_unit, dmg, range, curve_pow, custom_params)
	self:play_sound_and_effects(position, normal, range, custom_params)
	self:client_damage_and_push(position, normal, user_unit, dmg, range, curve_pow)
end

function FireManager:client_damage_and_push(position, normal, user_unit, dmg, range, curve_pow)
	local bodies = World:find_bodies("intersect", "sphere", position, range, managers.slot:get_mask("bullet_impact_targets"))
	local units_to_push = {}

	for _, hit_body in ipairs(bodies) do
		local hit_unit = hit_body:unit()
		local apply_dmg = hit_body:extension() and hit_body:extension().damage and hit_unit:id() == -1
		local dir, len, damage = nil

		if apply_dmg then
			dir = hit_body:center_of_mass()
			len = mvector3.direction(dir, position, dir)
			damage = dmg * math.pow(math.clamp(1 - len / range, 0, 1), curve_pow)

			self:_apply_body_damage(false, hit_body, user_unit, dir, damage)
		end
	end

	self:units_to_push(units_to_push, position, range)
end

function FireManager:play_sound_and_effects(position, normal, range, custom_params, molotov_damage_effect_table)
	self:player_feedback(position, normal, range, custom_params)
	self:spawn_sound_and_effects(position, normal, range, custom_params and custom_params.effect, custom_params and custom_params.sound_event, custom_params and custom_params.on_unit, custom_params and custom_params.idstr_decal, custom_params and custom_params.idstr_effect, molotov_damage_effect_table, custom_params.sound_event_burning, custom_params.sound_event_impact_duration or 0, custom_params.sound_event_duration or 0, custom_params.sound_event_burning_stop)
end

function FireManager:player_feedback(position, normal, range, custom_params)
end

local decal_ray_from = Vector3()
local decal_ray_to = Vector3()

function FireManager:spawn_sound_and_effects(position, normal, range, effect_name, sound_event, on_unit, idstr_decal, idstr_effect, molotov_damage_effect_table, sound_event_burning, sound_event_impact_duration, sound_event_duration, sound_event_burning_stop)
	effect_name = effect_name or "effects/payday2/particles/explosions/molotov_grenade"
	molotov_damage_effect_table = type(molotov_damage_effect_table) == "table" and molotov_damage_effect_table or nil
	local effect_id = nil

	if molotov_damage_effect_table then
		if effect_name ~= "none" then
			effect_id = World:effect_manager():spawn({
				effect = Idstring(effect_name),
				position = position,
				normal = normal
			})
		end

		table.insert(molotov_damage_effect_table, {
			effect_id = effect_id,
			detonation_position = position,
			detonation_normal = normal
		})
	end

	local slotmask_world_geometry = managers.slot:get_mask("world_geometry")

	if on_unit then
		mvector3.set(decal_ray_from, position)
		mvector3.set(decal_ray_to, normal)
		mvector3.multiply(decal_ray_to, 100)
		mvector3.add(decal_ray_from, decal_ray_to)
		mvector3.multiply(decal_ray_to, -2)
		mvector3.add(decal_ray_to, decal_ray_from)
	else
		mvector3.set(decal_ray_from, position)
		mvector3.set(decal_ray_to, math.UP)
		mvector3.multiply(decal_ray_to, -100)
		mvector3.add(decal_ray_to, decal_ray_from)
	end

	local ray = World:raycast("ray", decal_ray_from, decal_ray_to, "slot_mask", slotmask_world_geometry)
	local sound_switch_name = nil

	if ray then
		local material_name, _, _ = World:pick_decal_material(ray.unit, decal_ray_from, decal_ray_to, slotmask_world_geometry)
		sound_switch_name = material_name ~= empty_idstr and material_name
	end

	if not molotov_damage_effect_table or #molotov_damage_effect_table <= 1 then
		if sound_event ~= "no_sound" then
			if sound_event_burning == "no_sound" and sound_event_burning_stop ~= "no_sound" then
				self:_dispose_of_impact_sound({
					position = position,
					sound_switch_name = sound_switch_name,
					sound_event_duration = sound_event_duration,
					sound_event_impact_duration = sound_event_impact_duration,
					sound_event_burning = sound_event,
					sound_event_burning_stop = sound_event_burning_stop
				})
			else
				local sound_source = SoundDevice:create_source("MolotovImpact")

				sound_source:set_position(position)

				if sound_switch_name then
					sound_source:set_switch("materials", managers.game_play_central:material_name(sound_switch_name))
				end

				sound_source:post_event(sound_event)
				managers.enemy:add_delayed_clbk("MolotovImpact", callback(GrenadeBase, GrenadeBase, "_dispose_of_sound", {
					sound_source = sound_source
				}), TimerManager:game():time() + sound_event_impact_duration)
			end
		end

		if sound_event_burning ~= "no_sound" then
			managers.enemy:add_delayed_clbk("MolotovBurn", callback(FireManager, FireManager, "_dispose_of_impact_sound", {
				position = position,
				sound_event_duration = sound_event_duration,
				sound_event_impact_duration = sound_event_impact_duration,
				sound_event_burning = sound_event_burning,
				sound_event_burning_stop = sound_event_burning_stop
			}), TimerManager:game():time() + sound_event_impact_duration)
		end
	end

	self:project_decal(ray, decal_ray_from, decal_ray_to, on_unit and ray and ray.unit, idstr_decal, idstr_effect)
end

function FireManager:project_decal(ray, from, to, on_unit, idstr_decal, idstr_effect)
end

function FireManager:_dispose_of_impact_sound(custom_params)
	local sound_source_burning_loop = SoundDevice:create_source("MolotovBurning")

	sound_source_burning_loop:set_position(custom_params.position)

	if custom_params.sound_switch_name then
		sound_source_burning_loop:set_switch("materials", managers.game_play_central:material_name(custom_params.sound_switch_name))
	end

	sound_source_burning_loop:post_event(custom_params.sound_event_burning or "burn_loop_gen")

	local t = custom_params.sound_event_duration or tonumber(tweak_data.env_effect:molotov_fire().burn_duration)

	managers.enemy:add_delayed_clbk("MolotovBurning", callback(FireManager, FireManager, "_fade_out_burn_loop_sound", {
		position = custom_params.position,
		sound_source = sound_source_burning_loop,
		sound_event_burning_stop = custom_params.sound_event_burning_stop
	}), TimerManager:game():time() + t - custom_params.sound_event_impact_duration)
end

function FireManager:_fade_out_burn_loop_sound(custom_params)
	if custom_params.sound_event_burning_stop ~= "no_sound" then
		custom_params.sound_source:post_event(custom_params.sound_event_burning_stop or "burn_loop_gen_stop_fade")

		local fade_duration = 2

		managers.enemy:add_delayed_clbk("MolotovFading", callback(GrenadeBase, GrenadeBase, "_dispose_of_sound", custom_params), TimerManager:game():time() + fade_duration)
	else
		custom_params.sound_source:stop()
	end
end

function FireManager:on_simulation_ended()
	self._enemies_on_fire = {}
	self._dozers_on_fire = {}
end
