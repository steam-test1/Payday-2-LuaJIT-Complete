NewNPCFlamethrowerBase = NewNPCFlamethrowerBase or class(NewNPCRaycastWeaponBase)
NewNPCFlamethrowerBase.kill_effects = NewFlamethrowerBase.kill_effects
NewNPCFlamethrowerBase.chk_upd_state = NewFlamethrowerBase.chk_upd_state
NewNPCFlamethrowerBase._spawn_flame_effect = NewFlamethrowerBase._spawn_flame_effect
local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_dis = mvector3.distance
local mvec3_dir = mvector3.direction
local mvec3_cross = mvector3.cross
local mvec3_neg = mvector3.negate
local mvec3_norm = mvector3.normalize
local mvec3_lerp = mvector3.lerp
local mrot_y = mrotation.y
local math_up = math.UP

function NewNPCFlamethrowerBase:init(...)
	self.flamethrower = true

	NewNPCFlamethrowerBase.super.init(self, ...)

	self._upd_state = false
	self._effect_manager = World:effect_manager()
	self._timer = self._timer or TimerManager:game()

	self:setup_default()
end

function NewNPCFlamethrowerBase:destroy(...)
	self:kill_effects()
	NewNPCFlamethrowerBase.super.destroy(self, ...)
end

function NewNPCFlamethrowerBase:setup_default(...)
	self._use_shell_ejection_effect = false
	self._use_trails = false

	NewFlamethrowerBase.setup_default(self, ...)
end

function NewNPCFlamethrowerBase:_spawn_muzzle_effect(from_pos, direction)
end

function NewNPCFlamethrowerBase:update(unit, t, dt)
	local chk_shoot_expired = self._check_shooting_expired

	if chk_shoot_expired and chk_shoot_expired.check_t < t then
		self._check_shooting_expired = nil

		self:play_tweak_data_sound("stop_fire")
	end

	NewFlamethrowerBase.update(self, unit, t, dt)
end

local mvec_to = Vector3()

function NewNPCFlamethrowerBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	local result = {}
	local ignore_units = self._setup.ignore_units
	local damage_range = self._flame_max_range or self._range or 1000

	mvec3_set(mvec_to, direction)
	mvec3_mul(mvec_to, damage_range)
	mvec3_add(mvec_to, from_pos)

	local damage = self._damage * (dmg_mul or 1)
	local col_ray = World:raycast("ray", from_pos, mvec_to, "slot_mask", self._bullet_slotmask, "ignore_unit", ignore_units)

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
	local hit_body, hit_unit, hit_u_key = nil
	local units_hit = {}
	local valid_hit_bodies = {}
	local t_contains = table.contains

	for i = 1, #hit_bodies do
		hit_body = hit_bodies[i]
		hit_unit = hit_body:unit()

		if not t_contains(ignore_units, hit_unit) then
			hit_u_key = hit_unit:key()

			if not units_hit[hit_u_key] then
				units_hit[hit_u_key] = true
				valid_hit_bodies[#valid_hit_bodies + 1] = hit_body
			end
		end
	end

	local bullet_class = self:bullet_class()
	local fake_ray_dir, fake_ray_dis, hit_base_ext = nil

	for i = 1, #valid_hit_bodies do
		hit_body = valid_hit_bodies[i]
		hit_unit = hit_body:unit()
		fake_ray_dir = hit_body:center_of_mass()
		fake_ray_dis = mvec3_dir(fake_ray_dir, from_pos, fake_ray_dir)
		local hit_pos = hit_body:position()
		local fake_ray = {
			body = hit_body,
			unit = hit_unit,
			ray = fake_ray_dir,
			normal = fake_ray_dir,
			distance = fake_ray_dis,
			position = hit_pos,
			hit_position = hit_pos
		}
		hit_base_ext = hit_unit:base()

		if hit_base_ext and hit_base_ext.is_local_player then
			bullet_class:on_hit_player(fake_ray, self._unit, user_unit, damage)
		else
			bullet_class:on_collision(fake_ray, self._unit, user_unit, damage, self._fires_blanks)
		end
	end

	if target_unit and not shoot_player and not units_hit[target_unit:key()] and target_unit:character_damage() and target_unit:character_damage().build_suppression then
		target_unit:character_damage():build_suppression(tweak_data.weapon[self._name_id].suppression)
	end

	if self._alert_events then
		result.rays = {
			{
				position = from_pos
			}
		}
	end

	return result
end

local mvec_from = Vector3()
local mrot_fire = Rotation()
local mvec_fire_local_override = Vector3()

function NewNPCFlamethrowerBase:fire_blank(direction, impact, sub_id, override_direction)
	local chk_shoot_expired = self._check_shooting_expired

	if not chk_shoot_expired then
		self:play_tweak_data_sound("fire")

		self._check_shooting_expired = {
			check_t = self._timer:time() + 0.3
		}
	else
		chk_shoot_expired.check_t = self._timer:time() + 0.3
	end

	local m_ray_from = nil
	local weap_unit = self._unit
	local setup_data = self._setup
	local user_unit = setup_data and setup_data.user_unit
	local fire_obj = self:fire_object() or weap_unit

	fire_obj:m_position(mvec_from)

	if override_direction then
		fire_obj:m_rotation(mrot_fire)
		mrot_y(mrot_fire, mvec_fire_local_override)

		direction = mvec_fire_local_override
	elseif user_unit then
		local mov_ext = alive(user_unit) and user_unit:movement()

		if mov_ext then
			m_ray_from = mov_ext.detect_m_pos and mov_ext:detect_m_pos() or mov_ext.m_head_pos and mov_ext:m_head_pos()
		end
	end

	local range = self._flame_max_range or self._range or 1000

	mvec3_set(mvec_to, direction)
	mvec3_mul(mvec_to, range)
	mvec3_add(mvec_to, m_ray_from or mvec_from)

	local hit_something = nil

	if impact then
		local ignore_units = setup_data and setup_data.ignore_units
		local col_ray = World:raycast("ray", m_ray_from or mvec_from, mvec_to, "slot_mask", self._blank_slotmask, ignore_units and "ignore_unit" or nil, ignore_units or nil)

		if col_ray then
			hit_something = true
			local col_dis = col_ray.distance

			if col_dis < range then
				range = col_dis or range
			end

			self:bullet_class():on_collision(col_ray, weap_unit, user_unit, self._damage, true)
		end
	end

	if m_ray_from or hit_something then
		mvec3_set(mvec_to, direction)
		mvec3_mul(mvec_to, range)
		mvec3_add(mvec_to, mvec_from)
	end

	self:_spawn_flame_effect(mvec_to, direction)
end

function NewNPCFlamethrowerBase:auto_fire_blank(...)
	self:fire_blank(...)
end

function NewNPCFlamethrowerBase:_sound_autofire_start(nr_shots)
	local tweak_sound = tweak_data.weapon[self._name_id].sounds or {}

	self._sound_fire:stop()

	local sound = self._sound_fire:post_event(tweak_sound.fire, callback(self, self, "_on_auto_fire_stop"), nil, "end_of_event")
	sound = sound or self._sound_fire:post_event(tweak_sound.fire)
end

function NewNPCFlamethrowerBase:_sound_autofire_end()
	local tweak_sound = tweak_data.weapon[self._name_id].sounds or {}
	local sound = self._sound_fire:post_event(tweak_sound.stop_fire)
	sound = sound or self._sound_fire:post_event(tweak_sound.stop_fire)
end

function NewNPCFlamethrowerBase:third_person_important()
	return NewFlamethrowerBase.third_person_important(self)
end

NPCFlamethrowerBase = NPCFlamethrowerBase or class(NPCRaycastWeaponBase)
NPCFlamethrowerBase.kill_effects = NewNPCFlamethrowerBase.kill_effects
NPCFlamethrowerBase.chk_upd_state = NewNPCFlamethrowerBase.chk_upd_state
NPCFlamethrowerBase._spawn_flame_effect = NewNPCFlamethrowerBase._spawn_flame_effect
NPCFlamethrowerBase.setup_default = NewNPCFlamethrowerBase.setup_default
NPCFlamethrowerBase._spawn_muzzle_effect = NewNPCFlamethrowerBase._spawn_muzzle_effect
NPCFlamethrowerBase.update = NewNPCFlamethrowerBase.update
NPCFlamethrowerBase._fire_raycast = NewNPCFlamethrowerBase._fire_raycast
NPCFlamethrowerBase.fire_blank = NewNPCFlamethrowerBase.fire_blank
NPCFlamethrowerBase.auto_fire_blank = NewNPCFlamethrowerBase.auto_fire_blank
NPCFlamethrowerBase._sound_autofire_start = NewNPCFlamethrowerBase._sound_autofire_start
NPCFlamethrowerBase._sound_autofire_end = NewNPCFlamethrowerBase._sound_autofire_end
NPCFlamethrowerBase._on_auto_fire_stop = NewNPCFlamethrowerBase._on_auto_fire_stop

function NPCFlamethrowerBase:init(...)
	self.flamethrower = true

	NPCFlamethrowerBase.super.init(self, ...)

	self._upd_state = false
	self._effect_manager = World:effect_manager()
	self._timer = self._timer or TimerManager:game()

	self:setup_default()
end

function NPCFlamethrowerBase:destroy(...)
	self:kill_effects()
	NPCFlamethrowerBase.super.destroy(self, ...)
end

function NPCFlamethrowerBase:third_person_important()
	return false
end

NPCBossFlamethrowerBase = NPCBossFlamethrowerBase or class(NPCFlamethrowerBase)

function NPCBossFlamethrowerBase:setup_default(...)
	NPCBossFlamethrowerBase.super.setup_default(self, ...)

	self._extra_capsule_offset = tweak_data.weapon[self._name_id].extra_flames_offset or self._extra_capsule_offset or 0.05
end

local mvec_to = Vector3()
local mvec_dir = Vector3()
local mvec_offset = Vector3()
local mvec_offset2 = Vector3()

function NPCBossFlamethrowerBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	local result = {}
	local ignore_units = self._setup.ignore_units
	local slotmask = self._bullet_slotmask
	local flame_radius = self._flame_radius
	local damage = self._damage * (dmg_mul or 1)
	local capsule_offset = self._extra_capsule_offset
	local orig_damage_range = self._flame_max_range or self._range or 1000

	local function find_bodies_and_adjust_vecs()
		local damage_range = orig_damage_range

		mvec3_set(mvec_to, mvec_dir)
		mvec3_mul(mvec_to, damage_range)
		mvec3_add(mvec_to, from_pos)

		local col_ray = World:raycast("ray", from_pos, mvec_to, "slot_mask", slotmask, "ignore_unit", ignore_units)

		if col_ray then
			local col_dis = col_ray.distance

			if col_dis < damage_range then
				damage_range = col_dis or damage_range
			end

			mvec3_set(mvec_to, mvec_dir)
			mvec3_mul(mvec_to, damage_range)
			mvec3_add(mvec_to, from_pos)
		end

		return World:find_bodies("intersect", "capsule", from_pos, mvec_to, flame_radius, slotmask)
	end

	mvec3_set(mvec_dir, direction)

	local hit_bodies1 = find_bodies_and_adjust_vecs()
	local can_spawn_effects = self:_spawn_flame_effect(mvec_to, mvec_dir)

	mvec3_cross(mvec_offset, direction, math_up)
	mvec3_norm(mvec_offset)
	mvec3_set(mvec_offset2, mvec_offset)
	mvec3_mul(mvec_offset, capsule_offset)
	mvec3_mul(mvec_offset2, -capsule_offset)
	mvec3_set(mvec_dir, direction)
	mvec3_add(mvec_dir, mvec_offset)

	local hit_bodies2 = find_bodies_and_adjust_vecs()

	if can_spawn_effects then
		self:_spawn_flame_effect(mvec_to, mvec_dir, true)
	end

	mvec3_set(mvec_dir, direction)
	mvec3_add(mvec_dir, mvec_offset2)

	local hit_bodies3 = find_bodies_and_adjust_vecs()

	if can_spawn_effects then
		self:_spawn_flame_effect(mvec_to, mvec_dir, true)
	end

	local hit_body, hit_unit, hit_u_key = nil
	local units_hit = {}
	local valid_hit_bodies = {}
	local t_contains = table.contains

	for _, hit_bodies in ipairs({
		hit_bodies1,
		hit_bodies2,
		hit_bodies3
	}) do
		for i = 1, #hit_bodies do
			hit_body = hit_bodies[i]
			hit_unit = hit_body:unit()

			if not t_contains(ignore_units, hit_unit) then
				hit_u_key = hit_unit:key()

				if not units_hit[hit_u_key] then
					units_hit[hit_u_key] = true
					valid_hit_bodies[#valid_hit_bodies + 1] = hit_body
				end
			end
		end
	end

	local bullet_class = self:bullet_class()
	local fake_ray_dir, fake_ray_dis, hit_base_ext = nil

	for i = 1, #valid_hit_bodies do
		hit_body = valid_hit_bodies[i]
		hit_unit = hit_body:unit()
		fake_ray_dir = hit_body:center_of_mass()
		fake_ray_dis = mvec3_dir(fake_ray_dir, from_pos, fake_ray_dir)
		local hit_pos = hit_body:position()
		local fake_ray = {
			body = hit_body,
			unit = hit_unit,
			ray = fake_ray_dir,
			normal = fake_ray_dir,
			distance = fake_ray_dis,
			position = hit_pos,
			hit_position = hit_pos
		}
		hit_base_ext = hit_unit:base()

		if hit_base_ext and hit_base_ext.is_local_player then
			bullet_class:on_hit_player(fake_ray, self._unit, user_unit, damage)
		else
			bullet_class:on_collision(fake_ray, self._unit, user_unit, damage, self._fires_blanks)
		end
	end

	if target_unit and not shoot_player and not units_hit[target_unit:key()] and target_unit:character_damage() and target_unit:character_damage().build_suppression then
		target_unit:character_damage():build_suppression(tweak_data.weapon[self._name_id].suppression)
	end

	if self._alert_events then
		result.rays = {
			{
				position = from_pos
			}
		}
	end

	return result
end
