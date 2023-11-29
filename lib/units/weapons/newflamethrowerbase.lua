NewFlamethrowerBase = NewFlamethrowerBase or class(NewRaycastWeaponBase)
NewFlamethrowerBase.EVENT_IDS = {
	flamethrower_effect = 1
}
local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_lerp = mvector3.lerp
local mvec3_dir = mvector3.direction
local mvec3_cpy = mvector3.copy
local tmp_vec1 = Vector3()
local mrot_set_look_at = mrotation.set_look_at
local tmp_rot = Rotation()
local math_up = math.UP
local math_lerp = math.lerp

function NewFlamethrowerBase:init(...)
	self.flamethrower = true

	NewFlamethrowerBase.super.init(self, ...)

	self._upd_state = false
	self._effect_manager = World:effect_manager()
	self._timer = self._timer or TimerManager:game()

	self:setup_default()
end

function NewFlamethrowerBase:destroy(...)
	self:kill_effects()
	NewFlamethrowerBase.super.destroy(self, ...)
end

function NewFlamethrowerBase:update(unit, t, dt)
	local effect_manager = self._effect_manager

	if self._showing_nozzle_effect then
		local time_since_firing = self._timer:time() - self._last_fire_t

		if self._nozzle_expire_t <= time_since_firing then
			self._showing_nozzle_effect = false

			if self._visible then
				local nozzle_effect_id = self._nozzle_effect

				effect_manager:set_hidden(nozzle_effect_id, true)
				effect_manager:set_frozen(nozzle_effect_id, true)
			end
		end
	end

	local flame_collection = self._flame_effect_collection

	if flame_collection then
		local effect_entry, effect_id = nil
		local move_func = effect_manager.move
		local alive_func = effect_manager.alive
		local move_vec = tmp_vec1
		local needs_cleaning, lifetime, duration = nil

		for i = 1, #flame_collection do
			effect_entry = flame_collection[i]
			effect_id = effect_entry.id
			local can_continue = true

			if not alive_func(effect_manager, effect_id) then
				if effect_entry.been_alive then
					flame_collection[i] = false
					can_continue = false
					needs_cleaning = true
				end
			else
				effect_entry.been_alive = true
			end

			if can_continue then
				lifetime = effect_entry.lifetime + dt
				duration = effect_entry.duration

				if lifetime < duration then
					effect_entry.lifetime = lifetime

					mvec3_lerp(move_vec, effect_entry.from_pos, effect_entry.to_pos, lifetime / duration)
					move_func(effect_manager, effect_id, move_vec)
				else
					flame_collection[i] = false

					move_func(effect_manager, effect_id, effect_entry.to_pos)

					needs_cleaning = true
				end
			end
		end

		if needs_cleaning then
			local new_collection = {}

			for i = 1, #flame_collection do
				effect_entry = flame_collection[i]

				if effect_entry then
					new_collection[#new_collection + 1] = effect_entry
				end
			end

			flame_collection = new_collection
			self._flame_effect_collection = flame_collection
		end
	end

	self:chk_upd_state()
end

function NewFlamethrowerBase:chk_upd_state()
	local upd_state = self._showing_nozzle_effect or false

	if not upd_state then
		if (self._shooting or self._check_shooting_expired) and (self._flame_effect_ids or self._nozzle_effect) then
			upd_state = true
		end

		if not upd_state then
			local flame_collection = self._flame_effect_collection

			if flame_collection and next(flame_collection) then
				upd_state = true
			end
		end
	end

	if upd_state ~= self._upd_state then
		self._upd_state = upd_state

		self._unit:set_extension_update_enabled(Idstring("base"), upd_state)
	end
end

function NewFlamethrowerBase:on_enabled(...)
	NewFlamethrowerBase.super.on_enabled(self, ...)

	if not self._visible then
		return
	end

	local effect_manager = self._effect_manager
	local pilot_effect_id = self._pilot_effect

	if pilot_effect_id then
		effect_manager:set_hidden(pilot_effect_id, false)
		effect_manager:set_frozen(pilot_effect_id, false)
	end

	if self._showing_nozzle_effect then
		local nozzle_effect_id = self._nozzle_effect

		effect_manager:set_hidden(nozzle_effect_id, false)
		effect_manager:set_frozen(nozzle_effect_id, false)
	end
end

function NewFlamethrowerBase:on_disabled(...)
	NewFlamethrowerBase.super.on_disabled(self, ...)

	local effect_manager = self._effect_manager
	local pilot_effect_id = self._pilot_effect

	if pilot_effect_id then
		effect_manager:set_hidden(pilot_effect_id, true)
		effect_manager:set_frozen(pilot_effect_id, true)
	end

	local nozzle_effect_id = self._nozzle_effect

	if nozzle_effect_id then
		self._last_fire_t = -100
		self._showing_nozzle_effect = false

		effect_manager:set_hidden(nozzle_effect_id, true)
		effect_manager:set_frozen(nozzle_effect_id, true)
	end

	local flame_collection = self._flame_effect_collection

	if flame_collection then
		self._last_effect_t = -100
		self._flame_effect_collection = {}
		local effect_entry = nil
		local kill_func = effect_manager.kill

		for i = 1, #flame_collection do
			effect_entry = flame_collection[i]

			if effect_entry then
				kill_func(effect_manager, effect_entry.id)
			end
		end
	end

	if self._upd_state then
		self._upd_state = false

		self._unit:set_extension_update_enabled(Idstring("base"), false)
	end
end

function NewFlamethrowerBase:set_visibility_state(state)
	NewFlamethrowerBase.super.set_visibility_state(self, state)

	if not self._enabled then
		return
	end

	local effect_manager = self._effect_manager
	local pilot_effect_id = self._pilot_effect

	if pilot_effect_id then
		effect_manager:set_hidden(pilot_effect_id, not state)
		effect_manager:set_frozen(pilot_effect_id, not state)
	end

	if self._showing_nozzle_effect then
		local nozzle_effect_id = self._nozzle_effect

		effect_manager:set_hidden(nozzle_effect_id, not state)
		effect_manager:set_frozen(nozzle_effect_id, not state)
	end
end

function NewFlamethrowerBase:kill_effects()
	local effect_manager = self._effect_manager
	local kill_func = effect_manager.kill
	local pilot_effect_id = self._pilot_effect

	if pilot_effect_id then
		self._pilot_effect = nil

		kill_func(effect_manager, pilot_effect_id)
	end

	local nozzle_effect_id = self._nozzle_effect

	if nozzle_effect_id then
		self._nozzle_effect = nil

		kill_func(effect_manager, nozzle_effect_id)
	end

	local flame_collection = self._flame_effect_collection

	if flame_collection then
		self._flame_effect_collection = nil
		local effect_entry = nil

		for i = 1, #flame_collection do
			effect_entry = flame_collection[i]

			if effect_entry then
				kill_func(effect_manager, effect_entry.id)
			end
		end
	end
end

function NewFlamethrowerBase:setup_default()
	self:kill_effects()

	local unit = self._unit
	local nozzle_obj = unit:get_object(Idstring("fire"))
	self._nozzle_obj = nozzle_obj
	local name_id = self._name_id
	local weap_tweak = tweak_data.weapon[name_id]
	local flame_effect_range = weap_tweak.flame_max_range
	self._range = flame_effect_range
	self._flame_max_range = flame_effect_range
	self._flame_radius = weap_tweak.flame_radius or 40
	local flame_effect = weap_tweak.flame_effect

	if flame_effect then
		self._last_effect_t = -100
		self._flame_effect_collection = {}
		self._flame_effect_ids = Idstring(flame_effect)
		self._flame_max_range_sq = flame_effect_range * flame_effect_range
		local effect_duration = weap_tweak.single_flame_effect_duration
		self._single_flame_effect_duration = effect_duration
		self._single_flame_effect_cooldown = effect_duration * 0.1
	else
		self._last_effect_t = nil
		self._flame_effect_collection = nil
		self._flame_effect_ids = nil
		self._flame_max_range_sq = nil
		self._single_flame_effect_duration = nil
		self._single_flame_effect_cooldown = nil

		print("[NewFlamethrowerBase:setup_default] No flame effect defined for tweak data ID ", name_id)
	end

	local effect_manager = self._effect_manager
	local pilot_effect = weap_tweak.pilot_effect

	if pilot_effect then
		local parent_obj = nil
		local parent_name = weap_tweak.pilot_parent_name

		if parent_name then
			parent_obj = unit:get_object(Idstring(parent_name))

			if not parent_obj then
				print("[NewFlamethrowerBase:setup_default] No pilot parent object found with name ", parent_name, "in unit ", unit)
			end
		end

		parent_obj = parent_obj or nozzle_obj
		local force_synch = self.is_npc and not self:is_npc()
		local pilot_offset = weap_tweak.pilot_offset or nil
		local normal = weap_tweak.pilot_normal or Vector3(0, 0, 1)
		local pilot_effect_id = effect_manager:spawn({
			effect = Idstring(pilot_effect),
			parent = parent_obj,
			force_synch = force_synch,
			position = pilot_offset,
			normal = normal
		})
		self._pilot_effect = pilot_effect_id
		local state = (not self._enabled or not self._visible) and true or false

		effect_manager:set_hidden(pilot_effect_id, state)
		effect_manager:set_frozen(pilot_effect_id, state)
	else
		self._pilot_effect = nil
	end

	local nozzle_effect = weap_tweak.nozzle_effect

	if nozzle_effect then
		self._last_fire_t = -100
		self._nozzle_expire_t = weap_tweak.nozzle_expire_time or 0.2
		local force_synch = self.is_npc and not self:is_npc()
		local normal = weap_tweak.nozzle_normal or Vector3(0, 1, 0)
		local nozzle_effect_id = effect_manager:spawn({
			effect = Idstring(nozzle_effect),
			parent = nozzle_obj,
			force_synch = force_synch,
			normal = normal
		})
		self._nozzle_effect = nozzle_effect_id

		effect_manager:set_hidden(nozzle_effect_id, true)
		effect_manager:set_frozen(nozzle_effect_id, true)

		self._showing_nozzle_effect = false
	else
		self._last_fire_t = nil
		self._nozzle_expire_t = nil
		self._nozzle_effect = nil
		self._showing_nozzle_effect = nil
	end

	local bullet_class = weap_tweak.bullet_class

	if bullet_class ~= nil then
		bullet_class = CoreSerialize.string_to_classtable(bullet_class)

		if not bullet_class then
			print("[NewFlamethrowerBase:setup_default] Unexisting class for bullet_class string ", weap_tweak.bullet_class, "defined for tweak data ID ", name_id)

			bullet_class = FlameBulletBase
		end
	else
		bullet_class = FlameBulletBase
	end

	self._bullet_class = bullet_class
	self._bullet_slotmask = bullet_class:bullet_slotmask()

	if self._setup and self._setup.user_unit == managers.player:player_unit() then
		self._bullet_slotmask = managers.mutators:modify_value("RaycastWeaponBase:modify_slot_mask", self._bullet_slotmask)
	end

	self._blank_slotmask = bullet_class:blank_slotmask()
end

function NewFlamethrowerBase:_create_use_setups()
	local use_data = {}
	local player_setup = {
		selection_index = tweak_data.weapon[self._name_id].use_data.selection_index,
		equip = {
			align_place = tweak_data.weapon[self._name_id].use_data.align_place or "left_hand"
		},
		unequip = {
			align_place = "back"
		}
	}
	use_data.player = player_setup
	self._use_data = use_data
end

function NewFlamethrowerBase:_update_stats_values()
	self._bullet_class = nil

	NewFlamethrowerBase.super._update_stats_values(self)
	self:setup_default()

	local ammo_data = self._ammo_data

	if ammo_data then
		local rays = ammo_data.rays

		if rays ~= nil then
			self._rays = rays
		end

		local bullet_class = ammo_data.bullet_class

		if bullet_class ~= nil then
			bullet_class = CoreSerialize.string_to_classtable(bullet_class)

			if bullet_class then
				self._bullet_class = bullet_class
				self._bullet_slotmask = bullet_class:bullet_slotmask()

				if self._setup and self._setup.user_unit == managers.player:player_unit() then
					self._bullet_slotmask = managers.mutators:modify_value("RaycastWeaponBase:modify_slot_mask", self._bullet_slotmask)
				end

				self._blank_slotmask = bullet_class:blank_slotmask()
			else
				print("[NewFlamethrowerBase:_update_stats_values] Unexisting class for bullet_class string ", ammo_data.bullet_class, "defined in ammo_data for tweak data ID ", self._name_id)
			end
		end
	end
end

function NewFlamethrowerBase:get_damage_falloff(damage, col_ray, user_unit)
	return damage
end

function NewFlamethrowerBase:_spawn_muzzle_effect(to_pos, direction)
end

function NewFlamethrowerBase:_spawn_flame_effect(to_pos, direction, skip_t_check)
	if not self._enabled then
		return
	end

	local t = nil
	local effect_manager = self._effect_manager
	local nozzle_effect_id = not skip_t_check and self._nozzle_effect

	if nozzle_effect_id then
		t = self._timer:time()
		self._last_fire_t = t

		if not self._showing_nozzle_effect then
			self._showing_nozzle_effect = true

			if self._visible then
				effect_manager:set_hidden(nozzle_effect_id, false)
				effect_manager:set_frozen(nozzle_effect_id, false)
			end
		end
	end

	local spawned_effect_no_skip = false
	local flame_effect_ids = self._flame_effect_ids

	if flame_effect_ids then
		t = t or self._timer:time()
		local can_spawn_effect = skip_t_check or self._single_flame_effect_cooldown < t - self._last_effect_t

		if can_spawn_effect then
			if not skip_t_check then
				self._last_effect_t = t
				spawned_effect_no_skip = true
			end

			local nozzle_pos = tmp_vec1

			self._nozzle_obj:m_position(nozzle_pos)

			local dir_rot = tmp_rot

			mrot_set_look_at(dir_rot, direction, math_up)

			local duration_lerp = mvec3_dis_sq(nozzle_pos, to_pos) / self._flame_max_range_sq

			if duration_lerp > 1 then
				duration_lerp = 1
			end

			local duration = math_lerp(0, self._single_flame_effect_duration, duration_lerp)
			local flame_collection = self._flame_effect_collection
			local flame_effect_id = effect_manager:spawn({
				effect = flame_effect_ids,
				position = nozzle_pos,
				rotation = dir_rot
			})
			flame_collection[#flame_collection + 1] = {
				been_alive = false,
				lifetime = 0,
				id = flame_effect_id,
				from_pos = mvec3_cpy(nozzle_pos),
				to_pos = mvec3_cpy(to_pos),
				duration = duration
			}
		end
	end

	self:chk_upd_state()

	return spawned_effect_no_skip
end

local mvec_to = Vector3()
local mvec_direction = Vector3()
local mvec_spread_direction = Vector3()

function NewFlamethrowerBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, shoot_through_data)
	local result = {}
	local damage = self:_get_current_damage(dmg_mul)
	local damage_range = self._flame_max_range or self._range

	mvec3_set(mvec_to, direction)
	mvec3_mul(mvec_to, damage_range)
	mvec3_add(mvec_to, from_pos)

	local col_ray = World:raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units)

	if col_ray then
		local col_dis = col_ray.distance

		if col_dis < damage_range then
			damage_range = col_dis or damage_range
		end

		mvec3_set(mvec_to, direction)
		mvec3_mul(mvec_to, damage_range)
		mvec3_add(mvec_to, from_pos)
	end

	self:_spawn_flame_effect(mvec_to, direction)

	local hit_bodies = World:find_bodies("intersect", "capsule", from_pos, mvec_to, self._flame_radius, self._bullet_slotmask)
	local weap_unit = self._unit
	local enemies_hit = {}
	local valid_hit_bodies = {}
	local units_hit = {}
	local hit_body, hit_unit, hit_u_key = nil
	local ignore_units = self._setup.ignore_units
	local t_contains = table.contains
	local in_slot_f = Unit.in_slot
	local enemy_mask = self.enemy_mask

	for i = 1, #hit_bodies do
		hit_body = hit_bodies[i]
		hit_unit = hit_body:unit()

		if not t_contains(ignore_units, hit_unit) then
			hit_u_key = hit_unit:key()

			if not units_hit[hit_u_key] then
				units_hit[hit_u_key] = true
				valid_hit_bodies[#valid_hit_bodies + 1] = hit_body

				if in_slot_f(hit_unit, enemy_mask) then
					enemies_hit[hit_u_key] = hit_unit
				end
			end
		end
	end

	local hit_count = 0
	local bullet_class = self:bullet_class()
	local hit_body, fake_ray_dir, fake_ray_dis = nil

	for i = 1, #valid_hit_bodies do
		hit_body = valid_hit_bodies[i]
		fake_ray_dir = hit_body:center_of_mass()
		fake_ray_dis = mvec3_dir(fake_ray_dir, from_pos, fake_ray_dir)
		local hit_pos = hit_body:position()
		local fake_ray = {
			body = hit_body,
			unit = hit_body:unit(),
			ray = fake_ray_dir,
			normal = fake_ray_dir,
			distance = fake_ray_dis,
			position = hit_pos,
			hit_position = hit_pos
		}

		if bullet_class:on_collision(fake_ray, weap_unit, user_unit, damage) then
			hit_count = hit_count + 1
		end
	end

	result.enemies_in_cone = self._suppression and self:check_suppression(from_pos, direction, enemies_hit) or nil

	if self._alert_events then
		result.rays = {}
	end

	if hit_count > 0 then
		result.hit_enemy = true

		managers.statistics:shot_fired({
			hit = true,
			hit_count = hit_count,
			weapon_unit = weap_unit
		})
	else
		result.hit_enemy = false

		managers.statistics:shot_fired({
			hit = false,
			weapon_unit = weap_unit
		})
	end

	return result
end

function NewFlamethrowerBase:reload_interuptable()
	return false
end

function NewFlamethrowerBase:calculate_vertical_recoil_kick()
	return 0
end

function NewFlamethrowerBase:third_person_important()
	return true
end
