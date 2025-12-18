local mvec3_set = mvector3.set
local mvec3_add = mvector3.add
local mvec3_dot = mvector3.dot
local mvec3_sub = mvector3.subtract
local mvec3_mul = mvector3.multiply
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_set_l = mvector3.set_length
local mvec3_len = mvector3.length
local mvec3_len_sq = mvector3.length_sq
local math_clamp = math.clamp
local math_lerp = math.lerp
local math_acos = math.acos
local math_pow = math.pow
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_rot1 = Rotation()
RaycastWeaponBase = RaycastWeaponBase or class(UnitBase)
RaycastWeaponBase.TRAIL_EFFECT = Idstring("effects/particles/weapons/weapon_trail")
RaycastWeaponBase.SHIELD_MIN_KNOCK_BACK = tweak_data.upgrades.values.player.shield_knock_bullet.max_damage
RaycastWeaponBase.SHIELD_KNOCK_BACK_CHANCE = tweak_data.upgrades.values.player.shield_knock_bullet.chance

function RaycastWeaponBase:init(unit)
	UnitBase.init(self, unit, false)

	self._unit = unit
	self._name_id = self.name_id or "amcar"
	self.name_id = nil
	self._visible = false

	self:_create_use_setups()

	self._setup = {}
	self._digest_values = true
	self._ammo_data = false
	local td = tweak_data.weapon[self._name_id]
	self._do_shotgun_push = td.do_shotgun_push or false

	self:replenish()

	self._aim_assist_data = td.aim_assist
	self._autohit_data = td.autohit
	self._autohit_current = self._autohit_data and self._autohit_data.INIT_RATIO
	self._can_shoot_through_shield = td.can_shoot_through_shield
	self._can_shoot_through_enemy = td.can_shoot_through_enemy
	self._can_shoot_through_wall = td.can_shoot_through_wall
	local bullet_class = td.bullet_class

	if bullet_class ~= nil then
		bullet_class = CoreSerialize.string_to_classtable(bullet_class)

		if bullet_class then
			self._bullet_class = bullet_class
		else
			Application:error("[RaycastWeaponBase:init] Unexisting class for bullet_class string ", weap_tweak.bullet_class, "defined for tweak data ID ", name_id)

			self._bullet_class = InstantBulletBase
		end
	else
		self._bullet_class = InstantBulletBase
	end

	self._bullet_slotmask = self._bullet_class:bullet_slotmask()
	self._blank_slotmask = self._bullet_class:blank_slotmask()
	self._next_fire_allowed = -1000
	self._obj_fire = self._unit:get_object(Idstring("fire"))
	self._muzzle_effect = Idstring(td.muzzleflash or "effects/particles/test/muzzleflash_maingun")
	self._muzzle_effect_table = {
		force_synch = true,
		effect = self._muzzle_effect,
		parent = self._obj_fire
	}
	self._use_shell_ejection_effect = true
	self._obj_shell_ejection = self._unit:get_object(Idstring("a_shell"))
	self._shell_ejection_effect = Idstring(td.shell_ejection or "effects/payday2/particles/weapons/shells/shell_556")
	self._shell_ejection_effect_table = {
		effect = self._shell_ejection_effect,
		parent = self._obj_shell_ejection
	}
	self._sound_fire = SoundDevice:create_source("fire")

	self._sound_fire:link(self._unit:orientation_object())

	self._trail_effect = td.trail_effect and Idstring(td.trail_effect) or self.TRAIL_EFFECT
	self._trail_effect_table = {
		effect = self._trail_effect,
		position = Vector3(),
		normal = Vector3()
	}
	self._shot_fired_stats_table = {
		hit = false,
		weapon_unit = self._unit
	}
	self._magazine_empty_objects = {}
	self._concussion_tweak = td.concussion_data
	local mutator = nil

	if managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
		mutator = managers.mutators:get_mutator(MutatorPiggyRevenge)
	end

	if mutator and mutator.check_modify_weapon then
		self._active_modify_mutator = mutator
	end

	RaycastWeaponBase.shield_mask = RaycastWeaponBase.shield_mask or managers.slot:get_mask("enemy_shield_check")
	RaycastWeaponBase.enemy_mask = RaycastWeaponBase.enemy_mask or managers.slot:get_mask("enemies")
	RaycastWeaponBase.wall_mask = RaycastWeaponBase.wall_mask or managers.slot:get_mask("world_geometry")
	RaycastWeaponBase.wall_vehicle_mask = RaycastWeaponBase.wall_vehicle_mask or managers.slot:get_mask("world_geometry", "vehicles")
end

function RaycastWeaponBase:bullet_class()
	return self._bullet_class or InstantBulletBase
end

function RaycastWeaponBase:override_bullet_class(bullet_class_string)
	if self._default_bullet_class == nil then
		self._default_bullet_class = self._bullet_class
	end

	local bullet_class = bullet_class_string and CoreSerialize.string_to_classtable(bullet_class_string)
	bullet_class = bullet_class or self._default_bullet_class
	self._bullet_class = bullet_class or InstantBulletBase
	self._bullet_slotmask = self._bullet_class:bullet_slotmask()

	if self._setup and self._setup.user_unit == managers.player:player_unit() then
		self._bullet_slotmask = managers.mutators:modify_value("RaycastWeaponBase:modify_slot_mask", self._bullet_slotmask)
	end

	self._blank_slotmask = self._bullet_class:blank_slotmask()
end

function RaycastWeaponBase:shooting_count()
	return 0
end

function RaycastWeaponBase:shooting()
	return self._shooting
end

function RaycastWeaponBase:change_fire_object(new_obj)
	self._obj_fire = new_obj
	self._muzzle_effect_table.parent = new_obj
end

function RaycastWeaponBase:fire_object()
	return self._obj_fire
end

function RaycastWeaponBase:get_name_id()
	if self:gadget_overrides_weapon_functions() then
		local name_id = self:gadget_function_override("get_name_id")

		if name_id ~= nil then
			return name_id
		end
	end

	return self._name_id
end

function RaycastWeaponBase:has_part(part_id)
	return false
end

function RaycastWeaponBase:categories()
	return self:weapon_tweak_data().categories
end

function RaycastWeaponBase:is_category(...)
	local arg = {
		...
	}
	local categories = self:categories()

	if not categories then
		return false
	end

	for i = 1, #arg do
		if table.contains(categories, arg[i]) then
			return true
		end
	end

	return false
end

function RaycastWeaponBase:_weapon_tweak_data_id()
	local override_gadget = self:gadget_overrides_weapon_functions()

	if override_gadget then
		return override_gadget.name_id
	end

	return self._name_id
end

function RaycastWeaponBase:weapon_tweak_data()
	return tweak_data.weapon[self:_weapon_tweak_data_id()] or tweak_data.weapon.amcar
end

function RaycastWeaponBase:selection_index()
	return self:weapon_tweak_data().use_data.selection_index
end

function RaycastWeaponBase:get_stance_id()
	return self:weapon_tweak_data().use_stance or self:get_name_id()
end

function RaycastWeaponBase:movement_penalty()
	local primary_category = self:weapon_tweak_data().categories and self:weapon_tweak_data().categories[1]

	return tweak_data.upgrades.weapon_movement_penalty[primary_category] or 1
end

function RaycastWeaponBase:armor_piercing_chance()
	return self:weapon_tweak_data().armor_piercing_chance or 0
end

function RaycastWeaponBase:got_silencer()
	return false
end

function RaycastWeaponBase:run_and_shoot_allowed()
	return managers.player:has_category_upgrade("player", "run_and_shoot")
end

function RaycastWeaponBase:_create_use_setups()
	local sel_index = tweak_data.weapon[self._name_id].use_data.selection_index
	local align_place = tweak_data.weapon[self._name_id].use_data.align_place or "right_hand"
	local use_data = {}
	self._use_data = use_data
	local player_setup = {}
	use_data.player = player_setup
	player_setup.selection_index = sel_index
	player_setup.equip = {
		align_place = align_place
	}
	player_setup.unequip = {
		align_place = "back"
	}
	local npc_setup = {}
	use_data.npc = npc_setup
	npc_setup.selection_index = sel_index
	npc_setup.equip = {
		align_place = align_place
	}
	npc_setup.unequip = {}
end

function RaycastWeaponBase:get_use_data(character_setup)
	return self._use_data[character_setup]
end

function RaycastWeaponBase:setup(setup_data, damage_multiplier)
	self._autoaim = setup_data.autoaim
	local td = tweak_data.weapon[self._name_id]
	local stats = td.stats
	self._alert_events = setup_data.alert_AI and {} or nil
	self._alert_fires = {}
	local weapon_stats = tweak_data.weapon.stats

	if stats then
		self._zoom = self._zoom or weapon_stats.zoom[stats.zoom]
		self._alert_size = self._alert_size or weapon_stats.alert_size[stats.alert_size]
		self._suppression = self._suppression or weapon_stats.suppression[stats.suppression]
		self._spread = self._spread or weapon_stats.spread[stats.spread]
		self._recoil = self._recoil or weapon_stats.recoil[stats.recoil]
		self._spread_moving = self._spread_moving or weapon_stats.spread_moving[stats.spread_moving]
		self._concealment = self._concealment or weapon_stats.concealment[stats.concealment]
		self._value = self._value or weapon_stats.value[stats.value]
		self._total_ammo_mod = self._total_ammo_mod or weapon_stats.total_ammo_mod[stats.total_ammo_mod]
		self._extra_ammo = self._extra_ammo or weapon_stats.extra_ammo[stats.extra_ammo]
		self._reload = self._reload or weapon_stats.reload[stats.reload]

		for i, _ in pairs(weapon_stats) do
			local stat = self["_" .. tostring(i)]

			if not stat then
				self["_" .. tostring(i)] = weapon_stats[i][5]

				debug_pause("[RaycastWeaponBase] Weapon \"" .. tostring(self._name_id) .. "\" is missing stat \"" .. tostring(i) .. "\"!")
			end
		end
	else
		debug_pause("[RaycastWeaponBase] Weapon \"" .. tostring(self._name_id) .. "\" is missing stats block!")

		self._zoom = 60
		self._alert_size = 5000
		self._suppression = 1
		self._spread = 1
		self._recoil = 1
		self._spread_moving = 1
		self._reload = 1
	end

	if self._suppression then
		self._suppression_data = {
			near_angle = td.suppression_custom_data and td.suppression_custom_data.near_angle or 50,
			far_angle = td.suppression_custom_data and td.suppression_custom_data.far_angle or 5,
			far_dis = td.suppression_custom_data and td.suppression_custom_data.far_dis or 5000
		}
	else
		self._suppression_data = nil
	end

	self._bullet_slotmask = setup_data.hit_slotmask or self._bullet_slotmask

	if setup_data.user_unit == managers.player:player_unit() then
		self._bullet_slotmask = managers.mutators:modify_value("RaycastWeaponBase:modify_slot_mask", self._bullet_slotmask)
	end

	self._panic_suppression_chance = setup_data.panic_suppression_skill and self:weapon_tweak_data().panic_suppression_chance

	if self._panic_suppression_chance == 0 then
		self._panic_suppression_chance = false
	end

	self._setup = setup_data
	self._fire_mode = self._fire_mode or td.FIRE_MODE or "single"

	if self._setup.timer then
		self:set_timer(self._setup.timer)
	end
end

function RaycastWeaponBase:gadget_overrides_weapon_functions()
	return false
end

function RaycastWeaponBase:get_all_override_weapon_gadgets()
	return {}
end

function RaycastWeaponBase:gadget_function_override(func, ...)
end

function RaycastWeaponBase:underbarrel_toggle()
end

function RaycastWeaponBase:underbarrel_name_id()
	return self._name_id
end

function RaycastWeaponBase:ammo_base()
	local base = self.parent_weapon and self.parent_weapon:base() or self

	if base:gadget_overrides_weapon_functions() then
		base = base:gadget_overrides_weapon_functions():ammo_base() or base
	end

	return base
end

function RaycastWeaponBase:fire_mode()
	if not self._fire_mode then
		self._fire_mode = tweak_data.weapon[self._name_id].FIRE_MODE or "single"
	end

	return self._fire_mode
end

function RaycastWeaponBase:alt_fire_active()
	return false
end

function RaycastWeaponBase:fire_on_release()
	return false
end

function RaycastWeaponBase:dryfire()
	self:play_tweak_data_sound("dryfire")
end

function RaycastWeaponBase:weapon_fire_rate()
	local weapon_tweak_data = self:weapon_tweak_data()

	return weapon_tweak_data.fire_mode_data and weapon_tweak_data.fire_mode_data.fire_rate or 0
end

function RaycastWeaponBase:recoil_wait()
	return tweak_data.weapon[self._name_id].FIRE_MODE == "auto" and self:weapon_fire_rate() or nil
end

function RaycastWeaponBase:_fire_sound()
	if self:weapon_tweak_data().sounds.fire_ammo then
		local fire_ammo = self:weapon_tweak_data().sounds.fire_ammo
		local ammo = self:ammo_base():get_ammo_remaining_in_clip() - 1

		for _, data in ipairs(fire_ammo) do
			if type(data[1]) == "table" then
				if data[1][1] <= ammo and ammo <= data[1][2] then
					self:play_sound(data[2])

					return
				end
			elseif data[1] == ammo then
				self:play_sound(data[2])

				return
			end
		end
	end

	self:play_tweak_data_sound(self:fire_mode() == "auto" and not self:weapon_tweak_data().sounds.fire_single and "fire_auto" or "fire_single", "fire")
end

function RaycastWeaponBase:start_shooting_allowed()
	if self:gadget_overrides_weapon_functions() then
		return self:gadget_function_override("start_shooting_allowed")
	end

	return self._next_fire_allowed <= self._unit:timer():time()
end

function RaycastWeaponBase:start_shooting()
	if self:gadget_overrides_weapon_functions() then
		local gadget_func = self:gadget_function_override("start_shooting")

		if gadget_func then
			return gadget_func
		end
	end

	self:_fire_sound()

	self._next_fire_allowed = math.max(self._next_fire_allowed, self._unit:timer():time())
	self._shooting = true
	self._bullets_fired = 0
end

function RaycastWeaponBase:stop_shooting()
	self:play_tweak_data_sound("stop_fire")

	self._shooting = nil
	self._kills_without_releasing_trigger = nil
	self._bullets_fired = nil
end

function RaycastWeaponBase:update_next_shooting_time()
	if self:gadget_overrides_weapon_functions() then
		local gadget_func = self:gadget_function_override("update_next_shooting_time")

		if gadget_func then
			return gadget_func
		end
	end

	local next_fire = self:weapon_fire_rate() / self:fire_rate_multiplier()
	self._next_fire_allowed = self._next_fire_allowed + next_fire
end

function RaycastWeaponBase:trigger_pressed(...)
	local fired = nil

	if self:start_shooting_allowed() then
		fired = self:fire(...)

		if fired then
			self:update_next_shooting_time()
		end
	end

	return fired
end

function RaycastWeaponBase:trigger_held(...)
	local fired = nil

	if self:start_shooting_allowed() then
		fired = self:fire(...)

		if fired then
			self:update_next_shooting_time()
		end
	end

	return fired
end

function RaycastWeaponBase:ammo_usage()
	return 1
end

function RaycastWeaponBase:fire(from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit)
	if managers.player:has_activate_temporary_upgrade("temporary", "no_ammo_cost_buff") then
		managers.player:deactivate_temporary_upgrade("temporary", "no_ammo_cost_buff")

		if managers.player:has_category_upgrade("temporary", "no_ammo_cost") then
			managers.player:activate_temporary_upgrade("temporary", "no_ammo_cost")
		end
	end

	if self._autoaim and self._active_modify_mutator then
		self._active_modify_mutator:check_modify_weapon(self)
	end

	if self._bullets_fired then
		if self._bullets_fired == 1 and self:weapon_tweak_data().sounds.fire_single then
			self:play_tweak_data_sound("stop_fire")
			self:play_tweak_data_sound("fire_auto", "fire")
		end

		self._bullets_fired = self._bullets_fired + 1
	end

	local is_player = self._setup.user_unit == managers.player:player_unit()
	local consume_ammo = not managers.player:has_active_temporary_property("bullet_storm") and (not managers.player:has_activate_temporary_upgrade("temporary", "berserker_damage_multiplier") or not managers.player:has_category_upgrade("player", "berserker_no_ammo_cost")) or not is_player
	local ammo_usage = self:ammo_usage()

	if consume_ammo and (is_player or Network:is_server()) then
		local base = self:ammo_base()

		if base:get_ammo_remaining_in_clip() == 0 then
			return
		end

		if is_player then
			for _, category in ipairs(self:weapon_tweak_data().categories) do
				if managers.player:has_category_upgrade(category, "consume_no_ammo_chance") then
					local roll = math.rand(1)
					local chance = managers.player:upgrade_value(category, "consume_no_ammo_chance", 0)

					if roll < chance then
						ammo_usage = 0

						print("NO AMMO COST")
					end
				end
			end
		end

		local mutator = nil

		if managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
			mutator = managers.mutators:get_mutator(MutatorPiggyRevenge)
		end

		if mutator and mutator.get_free_ammo_chance and mutator:get_free_ammo_chance() then
			ammo_usage = 0
		end

		local ammo_in_clip = base:get_ammo_remaining_in_clip()
		local remaining_ammo = ammo_in_clip - ammo_usage

		if remaining_ammo < 0 then
			ammo_usage = ammo_usage + remaining_ammo
			remaining_ammo = 0
		end

		if ammo_in_clip > 0 and remaining_ammo <= (self.AKIMBO and 1 or 0) then
			local w_td = self:weapon_tweak_data()

			if w_td.animations and w_td.animations.magazine_empty then
				self:tweak_data_anim_play("magazine_empty")
			end

			if w_td.sounds and w_td.sounds.magazine_empty then
				self:play_tweak_data_sound("magazine_empty")
			end

			if w_td.effects and w_td.effects.magazine_empty then
				self:_spawn_tweak_data_effect("magazine_empty")
			end

			self:set_magazine_empty(true)
		end

		base:set_ammo_remaining_in_clip(ammo_in_clip - ammo_usage)
		self:use_ammo(base, ammo_usage)
	end

	local user_unit = self._setup.user_unit

	self:_check_ammo_total(user_unit)

	if alive(self._obj_fire) then
		self:_spawn_muzzle_effect(from_pos, direction)
	end

	self:_spawn_shell_eject_effect()

	local ray_res = self:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul, target_unit, ammo_usage)

	if self._alert_events and ray_res.rays then
		self:_check_alert(ray_res.rays, from_pos, direction, user_unit)
	end

	self:_build_suppression(ray_res.enemies_in_cone, suppr_mul)
	managers.player:send_message(Message.OnWeaponFired, nil, self._unit, ray_res)

	return ray_res
end

function RaycastWeaponBase:_build_suppression(enemies_in_cone, suppr_mul)
	if self:gadget_overrides_weapon_functions() then
		local r = self:gadget_function_override("_build_suppression", self, enemies_in_cone, suppr_mul)

		if r ~= nil then
			return
		end
	end

	if enemies_in_cone then
		local panic_chance = self._panic_suppression_chance

		for u_key, data in pairs(enemies_in_cone) do
			data.unit:character_damage():build_suppression(suppr_mul * data.error_mul * self._suppression, panic_chance and panic_chance * data.error_mul)
		end
	end
end

function RaycastWeaponBase:use_ammo(base, ammo_usage)
	local is_player = self._setup.user_unit == managers.player:player_unit()

	if ammo_usage > 0 then
		base:set_ammo_total(base:get_ammo_total() - ammo_usage)
	end
end

function RaycastWeaponBase:_spawn_muzzle_effect()
	if self:gadget_overrides_weapon_functions() then
		local r = self:gadget_function_override("_spawn_muzzle_effect")

		if r ~= nil then
			return
		end
	end

	World:effect_manager():spawn(self._muzzle_effect_table)
end

function RaycastWeaponBase:_spawn_shell_eject_effect()
	if self:gadget_overrides_weapon_functions() then
		local r = self:gadget_function_override("_spawn_shell_eject_effect")

		if r ~= nil then
			return
		end
	end

	if self._use_shell_ejection_effect then
		World:effect_manager():spawn(self._shell_ejection_effect_table)
	end
end

function RaycastWeaponBase:_spawn_tweak_data_effect(effect_id)
	local effect_data = self:weapon_tweak_data().effects[effect_id]
	self._tweak_data_effects = self._tweak_data_effects or {}

	if not self._tweak_data_effects[effect_id] then
		self._tweak_data_effects[effect_id] = {
			effect = Idstring(effect_data.effect),
			parent = self._unit:get_object(Idstring(effect_data.parent))
		}
	end

	local effect_table = self._tweak_data_effects[effect_id]

	World:effect_manager():spawn(effect_table)
end

function RaycastWeaponBase:_check_ammo_total(unit)
	if self:get_ammo_total() <= 0 and unit:base().is_local_player and unit:inventory():all_out_of_ammo() then
		PlayerStandard.say_line(unit:sound(), "g81x_plu")
	end
end

function RaycastWeaponBase:get_damage_falloff(damage, col_ray, user_unit)
	return damage
end

function RaycastWeaponBase:can_shoot_through_wall()
	return self._can_shoot_through_wall
end

function RaycastWeaponBase:can_shoot_through_shield()
	return self._can_shoot_through_shield
end

function RaycastWeaponBase:can_shoot_through_enemy()
	return self._can_shoot_through_enemy
end

function RaycastWeaponBase:override_shoot_through(wall, shield, enemy)
	if self._default_can_shoot_through_wall == nil then
		self._default_can_shoot_through_wall = self._can_shoot_through_wall
	end

	if self._default_can_shoot_through_shield == nil then
		self._default_can_shoot_through_shield = self._can_shoot_through_shield
	end

	if self._default_can_shoot_through_enemy == nil then
		self._default_can_shoot_through_enemy = self._can_shoot_through_enemy
	end

	if wall ~= nil then
		self._can_shoot_through_wall = wall
	else
		self._can_shoot_through_wall = self._default_can_shoot_through_wall
	end

	if shield ~= nil then
		self._can_shoot_through_shield = shield
	else
		self._can_shoot_through_shield = self._default_can_shoot_through_shield
	end

	if enemy ~= nil then
		self._can_shoot_through_enemy = enemy
	else
		self._can_shoot_through_enemy = self._default_can_shoot_through_enemy
	end
end

function RaycastWeaponBase.collect_hits(from, to, setup_data)
	setup_data = setup_data or {}
	local ray_hits = nil
	local hit_enemy = false
	local ignore_unit = setup_data.ignore_units or {}
	local enemy_mask = setup_data.enemy_mask
	local bullet_slotmask = setup_data.bullet_slotmask or managers.slot:get_mask("bullet_impact_targets")

	if setup_data.stop_on_impact then
		ray_hits = {}
		local hit = World:raycast("ray", from, to, "slot_mask", bullet_slotmask, "ignore_unit", ignore_unit)

		if hit then
			table.insert(ray_hits, hit)

			hit_enemy = hit.unit:in_slot(enemy_mask)
		end

		return ray_hits, hit_enemy, hit_enemy and {
			[hit.unit:key()] = hit.unit
		} or nil
	end

	local can_shoot_through_wall = setup_data.can_shoot_through_wall
	local can_shoot_through_shield = setup_data.can_shoot_through_shield
	local can_shoot_through_enemy = setup_data.can_shoot_through_enemy
	local wall_mask = setup_data.wall_mask
	local shield_mask = setup_data.shield_mask
	local ai_vision_ids = Idstring("ai_vision")
	local bulletproof_ids = Idstring("bulletproof")

	if can_shoot_through_wall then
		ray_hits = World:raycast_wall("ray", from, to, "slot_mask", bullet_slotmask, "ignore_unit", ignore_unit, "thickness", 40, "thickness_mask", wall_mask)
	else
		ray_hits = World:raycast_all("ray", from, to, "slot_mask", bullet_slotmask, "ignore_unit", ignore_unit)
	end

	local unique_hits = {}
	local enemies_hit = {}
	local unit, u_key, is_enemy = nil
	local units_hit = {}
	local in_slot_func = Unit.in_slot
	local has_ray_type_func = Body.has_ray_type

	for i, hit in ipairs(ray_hits) do
		unit = hit.unit
		u_key = unit:key()

		if not units_hit[u_key] then
			units_hit[u_key] = true
			unique_hits[#unique_hits + 1] = hit
			hit.hit_position = hit.position
			is_enemy = in_slot_func(unit, enemy_mask)

			if is_enemy then
				enemies_hit[u_key] = unit
				hit_enemy = true
			end

			if not can_shoot_through_enemy and is_enemy then
				break
			elseif not can_shoot_through_shield and in_slot_func(unit, shield_mask) then
				break
			elseif not can_shoot_through_wall and in_slot_func(unit, wall_mask) and (has_ray_type_func(hit.body, ai_vision_ids) or has_ray_type_func(hit.body, bulletproof_ids)) then
				break
			end
		end
	end

	return unique_hits, hit_enemy, hit_enemy and enemies_hit or nil
end

function RaycastWeaponBase:_collect_hits(from, to)
	local setup_data = {
		stop_on_impact = self:bullet_class().stop_on_impact,
		can_shoot_through_wall = self:can_shoot_through_wall(),
		can_shoot_through_shield = self:can_shoot_through_shield(),
		can_shoot_through_enemy = self:can_shoot_through_enemy(),
		bullet_slotmask = self._bullet_slotmask,
		enemy_mask = self.enemy_mask,
		wall_mask = self.wall_vehicle_mask,
		shield_mask = self.shield_mask,
		ignore_units = self._setup.ignore_units
	}

	return RaycastWeaponBase.collect_hits(from, to, setup_data)
end

local mvec_to = Vector3()
local mvec_right_ax = Vector3()
local mvec_up_ay = Vector3()
local mvec_ax = Vector3()
local mvec_ay = Vector3()
local mvec_spread_direction = Vector3()

function RaycastWeaponBase:_fire_raycast(user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	if self:gadget_overrides_weapon_functions() then
		return self:gadget_function_override("_fire_raycast", self, user_unit, from_pos, direction, dmg_mul, shoot_player, spread_mul, autohit_mul, suppr_mul)
	end

	local result = {}
	local ray_distance = self:weapon_range()
	local spread_x, spread_y = self:_get_spread(user_unit)
	spread_y = spread_y or spread_x
	spread_mul = spread_mul or 1

	mvector3.cross(mvec_right_ax, direction, math.UP)
	mvec3_norm(mvec_right_ax)
	mvector3.cross(mvec_up_ay, direction, mvec_right_ax)
	mvec3_norm(mvec_up_ay)
	mvec3_set(mvec_spread_direction, direction)

	local theta = math.random() * 360

	mvec3_mul(mvec_right_ax, math.rad(math.sin(theta) * math.random() * spread_x * spread_mul))
	mvec3_mul(mvec_up_ay, math.rad(math.cos(theta) * math.random() * spread_y * spread_mul))
	mvec3_add(mvec_spread_direction, mvec_right_ax)
	mvec3_add(mvec_spread_direction, mvec_up_ay)
	mvec3_set(mvec_to, mvec_spread_direction)
	mvec3_mul(mvec_to, ray_distance)
	mvec3_add(mvec_to, from_pos)

	local ray_hits, hit_enemy, enemies_hit = self:_collect_hits(from_pos, mvec_to)

	if self._autoaim and self._autohit_data then
		local weight = 0.1

		if hit_enemy then
			self._autohit_current = (self._autohit_current + weight) / (1 + weight)
		else
			local auto_hit_candidate, enemies_to_suppress = self:check_autoaim(from_pos, direction, nil, nil, nil, true)
			result.enemies_in_cone = enemies_to_suppress or false

			if auto_hit_candidate then
				local autohit_chance = self:get_current_autohit_chance_for_roll()

				if autohit_mul then
					autohit_chance = autohit_chance * autohit_mul
				end

				if math.random() < autohit_chance then
					self._autohit_current = (self._autohit_current + weight) / (1 + weight)

					mvec3_set(mvec_spread_direction, auto_hit_candidate.ray)
					mvec3_set(mvec_to, mvec_spread_direction)
					mvec3_mul(mvec_to, ray_distance)
					mvec3_add(mvec_to, from_pos)

					ray_hits, hit_enemy, enemies_hit = self:_collect_hits(from_pos, mvec_to)
				end
			end

			if hit_enemy then
				self._autohit_current = (self._autohit_current + weight) / (1 + weight)
			elseif auto_hit_candidate then
				self._autohit_current = self._autohit_current / (1 + weight)
			end
		end
	end

	local hit_count = 0
	local hit_anyone = false
	local cop_kill_count = 0
	local hit_through_wall = false
	local hit_through_shield = false
	local is_civ_f = CopDamage.is_civilian
	local damage = self:_get_current_damage(dmg_mul)

	for _, hit in ipairs(ray_hits) do
		local dmg = self:get_damage_falloff(damage, hit, user_unit)

		if dmg > 0 then
			local hit_result = self:bullet_class():on_collision(hit, self._unit, user_unit, dmg)
			hit_through_wall = hit_through_wall or hit.unit:in_slot(self.wall_mask)
			hit_through_shield = hit_through_shield or hit.unit:in_slot(self.shield_mask) and alive(hit.unit:parent())

			if hit_result then
				hit.damage_result = hit_result
				hit_anyone = true
				hit_count = hit_count + 1

				if hit_result.type == "death" then
					local unit_base = hit.unit:base()
					local unit_type = unit_base and unit_base._tweak_table
					local is_civilian = unit_type and is_civ_f(unit_type)

					if not is_civilian then
						cop_kill_count = cop_kill_count + 1
					end

					self:_check_kill_achievements(cop_kill_count, unit_base, unit_type, is_civilian, hit_through_wall, hit_through_shield)
				end
			end
		end
	end

	self:_check_tango_achievements(cop_kill_count)

	result.hit_enemy = hit_anyone

	if self._autoaim then
		self._shot_fired_stats_table.hit = hit_anyone
		self._shot_fired_stats_table.hit_count = hit_count

		if not self._ammo_data or not self._ammo_data.ignore_statistic then
			managers.statistics:shot_fired(self._shot_fired_stats_table)
		end
	end

	local furthest_hit = ray_hits[#ray_hits]

	if (not furthest_hit or furthest_hit.distance > 600) and alive(self._obj_fire) then
		self._obj_fire:m_position(self._trail_effect_table.position)
		mvec3_set(self._trail_effect_table.normal, mvec_spread_direction)

		local trail = World:effect_manager():spawn(self._trail_effect_table)

		if furthest_hit then
			World:effect_manager():set_remaining_lifetime(trail, math_clamp((furthest_hit.distance - 600) / 10000, 0, furthest_hit.distance))
		end
	end

	if result.enemies_in_cone == nil then
		result.enemies_in_cone = self._suppression and self:check_suppression(from_pos, direction, enemies_hit) or nil
	elseif enemies_hit and self._suppression then
		result.enemies_in_cone = result.enemies_in_cone or {}
		local all_enemies = managers.enemy:all_enemies()

		for u_key, enemy in pairs(enemies_hit) do
			if all_enemies[u_key] then
				result.enemies_in_cone[u_key] = {
					error_mul = 1,
					unit = enemy
				}
			end
		end
	end

	if self._alert_events then
		result.rays = ray_hits
	end

	return result
end

function RaycastWeaponBase:_check_kill_achievements(cop_kill_count, unit_base, unit_type, is_civilian, hit_through_wall, hit_through_shield)
	if not is_civilian and self:is_category(tweak_data.achievement.easy_as_breathing.weapon_type) then
		self._kills_without_releasing_trigger = (self._kills_without_releasing_trigger or 0) + 1

		if tweak_data.achievement.easy_as_breathing.count <= self._kills_without_releasing_trigger then
			managers.achievment:award(tweak_data.achievement.easy_as_breathing.award)
		end
	end

	if cop_kill_count > 0 then
		local multi_kill, enemy_pass, enemy_tag_pass, obstacle_pass, weapon_pass, weapons_pass, weapon_type_pass = nil

		for achievement, achievement_data in pairs(tweak_data.achievement.sniper_kill_achievements) do
			multi_kill = not achievement_data.multi_kill or cop_kill_count == achievement_data.multi_kill
			enemy_pass = not achievement_data.enemy or unit_type == achievement_data.enemy
			enemy_tag_pass = not achievement_data.enemy_tag or unit_base and unit_base.has_tag and unit_base:has_tag(achievement_data.enemy_tag)
			obstacle_pass = not achievement_data.obstacle or achievement_data.obstacle == "wall" and hit_through_wall or achievement_data.obstacle == "shield" and hit_through_shield
			weapon_pass = not achievement_data.weapon or self._name_id == achievement_data.weapon
			weapons_pass = not achievement_data.weapons or table.contains(achievement_data.weapons, self._name_id)
			weapon_type_pass = not achievement_data.weapon_type or self:is_category(achievement_data.weapon_type)

			if multi_kill and enemy_pass and enemy_tag_pass and obstacle_pass and weapon_pass and weapons_pass and weapon_type_pass then
				if achievement_data.stat then
					managers.achievment:award_progress(achievement_data.stat)
				elseif achievement_data.award then
					managers.achievment:award(achievement_data.award)
				elseif achievement_data.challenge_stat then
					managers.challenge:award_progress(achievement_data.challenge_stat)
				elseif achievement_data.trophy_stat then
					managers.custom_safehouse:award(achievement_data.trophy_stat)
				elseif achievement_data.challenge_award then
					managers.challenge:award(achievement_data.challenge_award)
				end
			end
		end
	end
end

function RaycastWeaponBase:_check_tango_achievements(cop_kill_count)
	if not tweak_data.achievement.tango_4.difficulty or table.contains(tweak_data.achievement.tango_4.difficulty, Global.game_settings.difficulty) then
		local second_sight_index, has_second_sight = nil

		for index, data in ipairs(self._second_sights or {}) do
			if data.part_id == "wpn_fps_upg_o_45rds" then
				second_sight_index = index
				has_second_sight = true

				break
			end
		end

		if has_second_sight and cop_kill_count > 0 and managers.player:player_unit():movement():current_state():in_steelsight() then
			local second_sight_on = self._second_sight_on and self._second_sight_on > 0 and self._second_sight_on

			if self._tango_4_data then
				local is_correct_sight = second_sight_on ~= self._tango_4_data.last_second_sight_state and (not second_sight_on or second_sight_on == second_sight_index)

				if is_correct_sight then
					self._tango_4_data.last_second_sight_state = second_sight_on
					self._tango_4_data.count = self._tango_4_data.count + 1
				else
					self._tango_4_data = nil
				end

				if self._tango_4_data and tweak_data.achievement.tango_4.count <= self._tango_4_data.count then
					managers.achievment:_award_achievement(tweak_data.achievement.tango_4, "tango_4")
				end
			else
				self._tango_4_data = {
					count = 1,
					last_second_sight_state = second_sight_on
				}
			end
		elseif self._tango_4_data then
			self._tango_4_data = nil
		end
	end
end

function RaycastWeaponBase:get_current_autohit_chance_for_roll()
	return self._autohit_data and 1 - math_clamp((self._autohit_current - self._autohit_data.MIN_RATIO) / (self._autohit_data.MAX_RATIO - self._autohit_data.MIN_RATIO), 0, 1)
end

function RaycastWeaponBase:get_aim_assist(...)
	local closest_ray = self:check_autoaim(...)

	return closest_ray
end

function RaycastWeaponBase:check_autoaim(from_pos, direction, max_dist, use_aim_assist, autohit_override_data, check_suppression)
	local autohit = autohit_override_data or use_aim_assist and self._aim_assist_data or self._autohit_data

	if not autohit then
		return nil, {}
	end

	local autohit_near_angle = autohit.near_angle
	local autohit_far_angle = autohit.far_angle
	local autohit_far_dis = autohit.far_dis
	local closest_error, closest_ray = nil
	local tar_vec = tmp_vec1
	local ignore_units = self._setup.ignore_units
	local slotmask = self._bullet_slotmask
	local in_steel_sight = nil
	local user_unit = self._setup.user_unit
	local current_state = user_unit:movement() and user_unit:movement()._current_state

	if current_state then
		in_steel_sight = current_state:in_steelsight()
	end

	local suppression_near_angle, suppression_far_angle, suppression_far_dis, suppression_enemies = nil

	if check_suppression and self._suppression and self._suppression_data then
		suppression_near_angle = self._suppression_data.near_angle
		suppression_far_angle = self._suppression_data.far_angle
		suppression_far_dis = self._suppression_data.far_dis
		suppression_enemies = {}
	end

	local enemy, mov_ext, chk_pos, error_angle, tar_aim_dot, tar_vec_len, autohit_min_angle, suppression_min_angle, vis_ray = nil
	local tar_vec = tmp_vec1
	local in_slot_func = Unit.in_slot
	local world = World
	local raycast_f = World.raycast

	for u_key, enemy_data in pairs(managers.enemy:all_enemies()) do
		enemy = enemy_data.unit
		mov_ext = enemy:movement()

		if enemy:base():lod_stage() and not in_slot_func(enemy, 16) then
			local from_m_com, already_normalized = nil

			if suppression_enemies and not mov_ext:cool() then
				from_m_com = true
				chk_pos = mov_ext:m_com()

				mvec3_set(tar_vec, chk_pos)
				mvec3_sub(tar_vec, from_pos)

				tar_aim_dot = mvec3_dot(direction, tar_vec)

				if tar_aim_dot > 0 then
					already_normalized = true
					tar_vec_len = mvec3_norm(tar_vec)
					error_angle = math_acos(mvec3_dot(direction, tar_vec))
					suppression_min_angle = math_lerp(suppression_near_angle, suppression_far_angle, math_pow(tar_aim_dot / suppression_far_dis, 0.25))

					if error_angle < suppression_min_angle then
						suppression_enemies[u_key] = {
							unit = enemy,
							error_mul = 1 - error_angle / suppression_min_angle
						}
					end
				end
			end

			if in_steel_sight or not from_m_com then
				chk_pos = in_steel_sight and mov_ext:m_head_pos() or mov_ext:m_com()

				mvec3_set(tar_vec, chk_pos)
				mvec3_sub(tar_vec, from_pos)

				tar_aim_dot = mvec3_dot(direction, tar_vec)
			end

			if tar_aim_dot > 0 and (not max_dist or tar_aim_dot < max_dist) then
				if not in_steel_sight and from_m_com and already_normalized then
					tar_vec_len = math_clamp(tar_vec_len, 1, autohit_far_dis)
				else
					tar_vec_len = math_clamp(mvec3_norm(tar_vec), 1, autohit_far_dis)
					error_angle = math_acos(mvec3_dot(direction, tar_vec))
				end

				autohit_min_angle = math_lerp(autohit_near_angle, autohit_far_angle, math_pow(tar_aim_dot / autohit_far_dis, 0.25))

				if error_angle < autohit_min_angle then
					local percent_error = error_angle / autohit_min_angle

					if not closest_error or closest_error > error_angle / autohit_min_angle then
						tar_vec_len = tar_vec_len + 100

						mvec3_mul(tar_vec, tar_vec_len)
						mvec3_add(tar_vec, from_pos)

						vis_ray = raycast_f(world, "ray", from_pos, tar_vec, "slot_mask", slotmask, "ignore_unit", ignore_units)

						if vis_ray and vis_ray.unit:key() == u_key and (not closest_error or error_angle < closest_error) then
							closest_error = error_angle
							closest_ray = vis_ray

							mvec3_set(tmp_vec1, chk_pos)
							mvec3_sub(tmp_vec1, from_pos)

							local d = mvec3_dot(direction, tmp_vec1)

							mvec3_set(tmp_vec1, direction)
							mvec3_mul(tmp_vec1, d)
							mvec3_add(tmp_vec1, from_pos)
							mvec3_sub(tmp_vec1, chk_pos)

							closest_ray.distance_to_aim_line = mvec3_len(tmp_vec1)
						end
					end
				end
			end
		end
	end

	return closest_ray, suppression_enemies and next(suppression_enemies) and suppression_enemies or nil
end

function RaycastWeaponBase:check_suppression(from_pos, direction, hit_enemies)
	if not self._suppression_data then
		return nil
	end

	local suppression_enemies = {}
	local near_angle = self._suppression_data.near_angle
	local far_angle = self._suppression_data.far_angle
	local far_dis = self._suppression_data.far_dis
	local com, enemy, mov_ext, error_angle, tar_aim_dot, suppression_min_angle = nil
	local tar_vec = tmp_vec1
	local in_slot_func = Unit.in_slot

	for u_key, enemy_data in pairs(managers.enemy:all_enemies()) do
		enemy = enemy_data.unit
		mov_ext = enemy:movement()

		if not mov_ext:cool() then
			if hit_enemies and hit_enemies[u_key] then
				suppression_enemies[u_key] = {
					error_mul = 1,
					unit = enemy
				}
			elseif enemy:base():lod_stage() and not in_slot_func(enemy, 16) then
				com = mov_ext:m_com()

				mvec3_set(tar_vec, com)
				mvec3_sub(tar_vec, from_pos)

				tar_aim_dot = mvec3_dot(direction, tar_vec)

				if tar_aim_dot > 0 then
					mvec3_norm(tar_vec)

					error_angle = math_acos(mvec3_dot(direction, tar_vec))
					suppression_min_angle = math_lerp(near_angle, far_angle, math_pow(tar_aim_dot / far_dis, 0.25))

					if error_angle < suppression_min_angle then
						suppression_enemies[u_key] = {
							unit = enemy,
							error_mul = 1 - error_angle / suppression_min_angle
						}
					end
				end
			end
		end
	end

	return next(suppression_enemies) and suppression_enemies or nil
end

function RaycastWeaponBase:debug_draw_proj_cone(from_pos, direction, near_angle, far_angle, far_dis, pause)
	for i = 1, far_dis / 100 do
		local proj_dis = i * 100
		local test_angle = math_lerp(near_angle, far_angle, (proj_dis / far_dis)^0.25)
		local test_radius = proj_dis * math.tan(test_angle * 0.5)

		Application:draw_cone(from_pos, from_pos + direction * proj_dis, test_radius * 2, 0, 0, 0.7)
	end

	if pause then
		Application:set_pause(true)
	end
end

local mvec_from_pos = Vector3()

function RaycastWeaponBase:_check_alert(rays, fire_pos, direction, user_unit)
	if self:gadget_overrides_weapon_functions() then
		local r = self:gadget_function_override("_check_alert", self, rays, fire_pos, direction, user_unit)

		if r ~= nil then
			return
		end
	end

	local group_ai = managers.groupai:state()
	local t = TimerManager:game():time()
	local exp_t = t + 1.5
	local mvec3_dis = mvector3.distance_sq
	local all_alerts = self._alert_events
	local alert_rad = self._alert_size / 4
	local filter = self._setup.alert_filter
	local from_pos = mvec_from_pos
	local copied_from_pos = nil
	local tolerance = 250000

	mvec3_set(from_pos, direction)
	mvec3_mul(from_pos, -alert_rad)
	mvec3_add(from_pos, fire_pos)

	if #rays > 0 then
		local event_pos = nil

		for _, ray in ipairs(rays) do
			event_pos = ray.position
			local alert_data = nil

			for i = #all_alerts, 1, -1 do
				alert_data = all_alerts[i]

				if alert_data[4] < t then
					table.remove(all_alerts, i)
				elseif alert_data[3] == alert_rad and mvec3_dis(alert_data[1], event_pos) < tolerance and mvec3_dis(alert_data[2], from_pos) < tolerance then
					event_pos = nil

					break
				end
			end

			if event_pos then
				copied_from_pos = copied_from_pos or mvector3.copy(from_pos)

				table.insert(all_alerts, {
					event_pos,
					copied_from_pos,
					alert_rad,
					exp_t
				})

				local new_alert = {
					"bullet",
					event_pos,
					alert_rad,
					filter,
					user_unit,
					copied_from_pos
				}

				group_ai:propagate_alert(new_alert)
			end
		end
	end

	local skip_alert = false
	local fire_alerts = self._alert_fires
	alert_rad = self._alert_size
	local alert_data = nil

	for i = #fire_alerts, 1, -1 do
		alert_data = fire_alerts[i]

		if alert_data[3] < t then
			table.remove(fire_alerts, i)
		elseif alert_data[2] == alert_rad and mvec3_dis(alert_data[1], fire_pos) < tolerance then
			skip_alert = true

			break
		end
	end

	if not skip_alert then
		fire_pos = mvector3.copy(fire_pos)
		copied_from_pos = copied_from_pos or mvector3.copy(from_pos)

		table.insert(fire_alerts, {
			fire_pos,
			alert_rad,
			exp_t
		})

		local new_alert = {
			"bullet",
			fire_pos,
			alert_rad,
			filter,
			user_unit,
			copied_from_pos
		}

		group_ai:propagate_alert(new_alert)
	end
end

function RaycastWeaponBase:damage_player(col_ray, from_pos, direction, params)
	local unit = managers.player:player_unit()

	if not unit then
		return
	end

	local ray_data = {
		ray = direction,
		normal = -direction
	}
	local head_pos = unit:movement():m_head_pos()
	local head_dir = tmp_vec1
	local head_dis = mvec3_dir(head_dir, from_pos, head_pos)
	local shoot_dir = tmp_vec2

	mvec3_set(shoot_dir, col_ray and col_ray.ray or direction)

	local cos_f = mvec3_dot(shoot_dir, head_dir)

	if not col_ray then
		local max_range = self._weapon_range or self._range or 20000

		if head_dis > max_range then
			return
		end
	end

	if cos_f <= 0.1 then
		return
	end

	local b = head_dis / cos_f

	if not col_ray or b < col_ray.distance then
		if col_ray and b - col_ray.distance < 60 then
			unit:character_damage():build_suppression(self._suppression)
		end

		mvec3_set_l(shoot_dir, b)
		mvec3_mul(head_dir, head_dis)
		mvec3_sub(shoot_dir, head_dir)

		local proj_len_sq = mvec3_len_sq(shoot_dir)
		ray_data.position = head_pos + shoot_dir

		if not col_ray and proj_len_sq < 3600 then
			unit:character_damage():build_suppression(self._suppression)
		end

		if proj_len_sq < 900 and (not params or not params.guaranteed_miss) then
			if World:raycast("ray", from_pos, head_pos, "slot_mask", self._bullet_slotmask, "ignore_unit", self._setup.ignore_units, "report") then
				return nil, ray_data
			else
				return true, ray_data
			end
		elseif proj_len_sq < 10000 and b > 500 then
			unit:character_damage():play_whizby(ray_data.position)
		end
	elseif b - col_ray.distance < 60 then
		unit:character_damage():build_suppression(self._suppression)
	end

	return nil, ray_data
end

function RaycastWeaponBase:force_hit(from_pos, direction, user_unit, impact_pos, impact_normal, hit_unit, hit_body)
	self:set_ammo_remaining_in_clip(math.max(0, self:get_ammo_remaining_in_clip() - 1))

	local col_ray = {
		position = impact_pos,
		ray = direction,
		normal = impact_normal,
		unit = hit_unit,
		body = hit_body or hit_unit:body(0)
	}

	self:bullet_class():on_collision(col_ray, self._unit, user_unit, self._damage)
end

function RaycastWeaponBase:_get_tweak_data_weapon_animation(anim)
	if self:gadget_overrides_weapon_functions() then
		return self:gadget_function_override("_get_tweak_data_weapon_animation", anim)
	end

	local animations = self:weapon_tweak_data().animations

	return animations and animations[anim]
end

function RaycastWeaponBase:_get_anim_start_offset(anim)
	return false
end

function RaycastWeaponBase:tweak_data_anim_play(anim, ...)
	local animation = self:_get_tweak_data_weapon_animation(anim)

	if animation then
		self:anim_play(animation, ...)

		return true
	end

	return false
end

function RaycastWeaponBase:anim_play(anim, speed_multiplier)
	if anim then
		local length = self._unit:anim_length(Idstring(anim))
		speed_multiplier = speed_multiplier or 1

		self._unit:anim_stop(Idstring(anim))
		self._unit:anim_play_to(Idstring(anim), length, speed_multiplier)

		local offset = self:_get_anim_start_offset(anim)

		if offset then
			self._unit:anim_set_time(Idstring(anim), offset)
		end
	end
end

function RaycastWeaponBase:tweak_data_anim_play_at_end(anim, ...)
	local animation = self:_get_tweak_data_weapon_animation(anim)

	if animation then
		self:anim_play_at_end(animation, ...)

		return true
	end

	return false
end

function RaycastWeaponBase:anim_play_at_end(anim, speed_multiplier)
	if anim then
		local length = self._unit:anim_length(Idstring(anim))
		speed_multiplier = speed_multiplier or 1

		self._unit:anim_stop(Idstring(anim))
		self._unit:anim_play_to(Idstring(anim), length, speed_multiplier)
		self._unit:anim_set_time(Idstring(anim), length)
	end
end

function RaycastWeaponBase:tweak_data_anim_stop(anim, ...)
	local animation = self:_get_tweak_data_weapon_animation(anim)

	if animation then
		self:anim_stop(animation, ...)

		return true
	end

	return false
end

function RaycastWeaponBase:anim_stop(anim)
	self._unit:anim_stop(Idstring(anim))
end

function RaycastWeaponBase:tweak_data_anim_is_playing(anim)
	local animation = self:_get_tweak_data_weapon_animation(anim)

	if animation then
		return self:is_playing_anim(animation)
	end

	return false
end

function RaycastWeaponBase:is_playing_anim(anim)
	return self._unit:anim_is_playing(anim)
end

function RaycastWeaponBase:digest_value(value, digest)
	if self._digest_values then
		return Application:digest_value(value, digest)
	else
		return value
	end
end

function RaycastWeaponBase:set_ammo_max_per_clip(ammo_max_per_clip)
	self._ammo_max_per_clip = ammo_max_per_clip
end

function RaycastWeaponBase:get_ammo_max_per_clip()
	return self._ammo_max_per_clip
end

function RaycastWeaponBase:set_ammo_max(ammo_max)
	self._ammo_max = ammo_max
end

function RaycastWeaponBase:get_ammo_max()
	return self._ammo_max
end

function RaycastWeaponBase:set_ammo_total(ammo_total)
	self._ammo_total = ammo_total

	if self:has_stored_pickup_ammo() and self:get_ammo_max() <= ammo_total then
		self:remove_pickup_ammo()
	end
end

function RaycastWeaponBase:add_ammo_to_pool(ammo, index)
	local max_ammo = self:get_ammo_max()
	local current_ammo = self:get_ammo_total()
	local new_ammo = current_ammo + ammo

	if max_ammo < new_ammo then
		new_ammo = max_ammo
	end

	self:set_ammo_total(new_ammo)
	managers.hud:set_ammo_amount(index, self:ammo_info())
end

function RaycastWeaponBase:get_ammo_total()
	return self._ammo_total
end

function RaycastWeaponBase:get_ammo_ratio()
	local ammo_max = self:get_ammo_max()
	local ammo_total = self:get_ammo_total()

	return ammo_total / math.max(ammo_max, 1)
end

function RaycastWeaponBase:get_ammo_ratio_excluding_clip()
	local ammo_in_clip = self:get_ammo_max_per_clip()
	local max_ammo = self:get_ammo_max() - ammo_in_clip
	local current_ammo = self:get_ammo_total() - ammo_in_clip

	if current_ammo == 0 then
		return 0
	end

	return current_ammo / max_ammo
end

function RaycastWeaponBase:get_max_ammo_excluding_clip()
	local ammo_in_clip = self:get_ammo_max_per_clip()
	local max_ammo = self:get_ammo_max() - ammo_in_clip

	return max_ammo
end

function RaycastWeaponBase:remove_ammo_from_pool(percent)
	local ammo_in_clip = self:get_ammo_max_per_clip()
	local current_ammo = self:get_ammo_total() - ammo_in_clip

	if current_ammo > 0 then
		current_ammo = current_ammo * percent
		current_ammo = math.floor(current_ammo)

		self:set_ammo_total(ammo_in_clip + current_ammo)
	end
end

function RaycastWeaponBase:remove_ammo(percent)
	local total_ammo = self:get_ammo_total()
	local ammo = math.floor(total_ammo * percent)

	self:set_ammo_total(ammo)

	local ammo_in_clip = self:get_ammo_remaining_in_clip()

	if self:get_ammo_total() < ammo_in_clip then
		self:set_ammo_remaining_in_clip(ammo)
	end

	return total_ammo - ammo
end

function RaycastWeaponBase:set_ammo_remaining_in_clip(ammo_remaining_in_clip)
	self._ammo_remaining_in_clip = ammo_remaining_in_clip
end

function RaycastWeaponBase:get_ammo_remaining_in_clip()
	return self._ammo_remaining_in_clip
end

function RaycastWeaponBase:replenish()
	local ammo_max_multiplier = managers.player:upgrade_value("player", "extra_ammo_multiplier", 1)

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		ammo_max_multiplier = ammo_max_multiplier * managers.player:upgrade_value(category, "extra_ammo_multiplier", 1)
	end

	ammo_max_multiplier = ammo_max_multiplier + ammo_max_multiplier * (self._total_ammo_mod or 0)
	ammo_max_multiplier = managers.modifiers:modify_value("WeaponBase:GetMaxAmmoMultiplier", ammo_max_multiplier)
	local ammo_max_per_clip = self:calculate_ammo_max_per_clip()
	local ammo_max = math.round((tweak_data.weapon[self._name_id].AMMO_MAX + managers.player:upgrade_value(self._name_id, "clip_amount_increase") * ammo_max_per_clip) * ammo_max_multiplier)
	ammo_max_per_clip = math.min(ammo_max_per_clip, ammo_max)

	self:set_ammo_max_per_clip(ammo_max_per_clip)
	self:set_ammo_max(ammo_max)
	self:set_ammo_total(ammo_max)
	self:set_ammo_remaining_in_clip(ammo_max_per_clip)

	self._ammo_pickup = tweak_data.weapon[self._name_id].AMMO_PICKUP

	self:update_damage()
end

function RaycastWeaponBase:upgrade_blocked(category, upgrade)
	if not self:weapon_tweak_data().upgrade_blocks then
		return false
	end

	if not self:weapon_tweak_data().upgrade_blocks[category] then
		return false
	end

	return table.contains(self:weapon_tweak_data().upgrade_blocks[category], upgrade)
end

function RaycastWeaponBase:calculate_ammo_max_per_clip()
	local ammo = tweak_data.weapon[self._name_id].CLIP_AMMO_MAX
	ammo = ammo + managers.player:upgrade_value(self._name_id, "clip_ammo_increase")

	if not self:upgrade_blocked("weapon", "clip_ammo_increase") then
		ammo = ammo + managers.player:upgrade_value("weapon", "clip_ammo_increase", 0)
	end

	for _, category in ipairs(tweak_data.weapon[self._name_id].categories) do
		if not self:upgrade_blocked(category, "clip_ammo_increase") then
			ammo = ammo + managers.player:upgrade_value(category, "clip_ammo_increase", 0)
		end
	end

	ammo = ammo + (self._extra_ammo or 0)

	return ammo
end

function RaycastWeaponBase:has_stored_pickup_ammo()
	return self._stored_pickup_ammo and true or false
end

function RaycastWeaponBase:get_stored_pickup_ammo()
	return self._stored_pickup_ammo and self:digest_value(self._stored_pickup_ammo, false)
end

function RaycastWeaponBase:store_pickup_ammo(ammo_to_store)
	self._stored_pickup_ammo = self:digest_value(ammo_to_store, true)
end

function RaycastWeaponBase:remove_pickup_ammo()
	self._stored_pickup_ammo = nil
end

function RaycastWeaponBase:_get_current_damage(dmg_mul)
	local damage = self._damage * (dmg_mul or 1)
	damage = damage * managers.player:temporary_upgrade_value("temporary", "combat_medic_damage_multiplier", 1)

	return damage
end

function RaycastWeaponBase:update_damage()
	self._damage = tweak_data.weapon[self._name_id].DAMAGE * self:damage_multiplier()
end

function RaycastWeaponBase:recoil()
	return self._recoil
end

function RaycastWeaponBase:spread_moving()
	return self._spread_moving
end

function RaycastWeaponBase:reload_speed_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "reload_speed_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value("weapon", "passive_reload_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "reload_speed_multiplier", 1)
	multiplier = managers.modifiers:modify_value("WeaponBase:GetReloadSpeedMultiplier", multiplier)

	return multiplier
end

function RaycastWeaponBase:reload_speed_stat()
	return self._reload
end

function RaycastWeaponBase:damage_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "damage_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "damage_multiplier", 1)

	return multiplier
end

function RaycastWeaponBase:melee_damage_multiplier()
	return managers.player:upgrade_value(self._name_id, "melee_multiplier", 1)
end

function RaycastWeaponBase:spread_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "spread_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value("weapon", self:fire_mode() .. "_spread_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "spread_multiplier", 1)

	return multiplier
end

function RaycastWeaponBase:exit_run_speed_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "exit_run_speed_multiplier", 1)
	end

	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "exit_run_speed_multiplier", 1)

	return multiplier
end

function RaycastWeaponBase:recoil_addend()
	return 0
end

function RaycastWeaponBase:recoil_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "recoil_multiplier", 1)

		if managers.player:has_team_category_upgrade(category, "recoil_multiplier") then
			multiplier = multiplier * managers.player:team_upgrade_value(category, "recoil_multiplier", 1)
		elseif managers.player:player_unit() and managers.player:player_unit():character_damage():is_suppressed() then
			multiplier = multiplier * managers.player:team_upgrade_value(category, "suppression_recoil_multiplier", 1)
		end
	end

	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "recoil_multiplier", 1)

	return multiplier
end

function RaycastWeaponBase:enter_steelsight_speed_multiplier()
	local multiplier = 1

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		multiplier = multiplier * managers.player:upgrade_value(category, "enter_steelsight_speed_multiplier", 1)
	end

	multiplier = multiplier * managers.player:temporary_upgrade_value("temporary", "combat_medic_enter_steelsight_speed_multiplier", 1)
	multiplier = multiplier * managers.player:upgrade_value(self._name_id, "enter_steelsight_speed_multiplier", 1)

	return multiplier
end

function RaycastWeaponBase:fire_rate_multiplier()
	return 1
end

function RaycastWeaponBase:upgrade_value(value, default)
	return managers.player:upgrade_value(self._name_id, value, default)
end

function RaycastWeaponBase:transition_duration()
	return self:weapon_tweak_data().transition_duration
end

function RaycastWeaponBase:melee_damage_info()
	local my_tweak_data = self:weapon_tweak_data()
	local dmg = my_tweak_data.damage_melee * self:melee_damage_multiplier()
	local dmg_effect = dmg * my_tweak_data.damage_melee_effect_mul

	return dmg, dmg_effect
end

function RaycastWeaponBase:ammo_info()
	return self:ammo_base():get_ammo_max_per_clip(), self:ammo_base():get_ammo_remaining_in_clip(), self:ammo_base():get_ammo_total(), self:ammo_base():get_ammo_max()
end

function RaycastWeaponBase:set_ammo_info(max_clip, current_clip, current_left, max)
	self:set_ammo_max_per_clip(max_clip)
	self:set_ammo_max(max)
	self:set_ammo_total(current_left)
	self:set_ammo_remaining_in_clip(current_clip)
end

function RaycastWeaponBase:set_ammo(ammo)
	local ammo_num = math.floor(ammo * self:ammo_base():get_ammo_max())

	self:ammo_base():set_ammo_total(ammo_num)
	self:ammo_base():set_ammo_remaining_in_clip(math.min(self:ammo_base():get_ammo_max_per_clip(), ammo_num))
end

function RaycastWeaponBase:ammo_full()
	local function is_full(ammo_base)
		return ammo_base:get_ammo_total() == ammo_base:get_ammo_max()
	end

	if not is_full(self) then
		return false
	end

	for _, gadget in ipairs(self:get_all_override_weapon_gadgets()) do
		if gadget and gadget.ammo_base and not is_full(gadget:ammo_base()) then
			return false
		end
	end

	return true
end

function RaycastWeaponBase:clip_full()
	return self:ammo_base():get_ammo_remaining_in_clip() == self:ammo_base():get_ammo_max_per_clip()
end

function RaycastWeaponBase:clip_ratio()
	return self:ammo_base():get_ammo_max_per_clip() / self:ammo_base():get_ammo_remaining_in_clip()
end

function RaycastWeaponBase:clip_empty()
	return self:ammo_base():get_ammo_remaining_in_clip() == 0
end

function RaycastWeaponBase:clip_not_empty()
	return self:ammo_base():get_ammo_remaining_in_clip() > 0
end

function RaycastWeaponBase:remaining_full_clips()
	return math.max(math.floor((self:ammo_base():get_ammo_total() - self:ammo_base():get_ammo_remaining_in_clip()) / self:ammo_base():get_ammo_max_per_clip()), 0)
end

function RaycastWeaponBase:set_remaining_full_clips(full_clips)
	self:set_ammo_total(full_clips * self:ammo_base():get_ammo_max_per_clip() + self:ammo_base():get_ammo_remaining_in_clip())
end

function RaycastWeaponBase:zoom()
	return self._zoom
end

function RaycastWeaponBase:reload_expire_t()
	return nil
end

function RaycastWeaponBase:reload_enter_expire_t()
	return nil
end

function RaycastWeaponBase:reload_exit_expire_t()
	return nil
end

function RaycastWeaponBase:use_shotgun_reload()
	return false
end

function RaycastWeaponBase:update_reloading(t, dt, time_left)
end

function RaycastWeaponBase:start_reload()
	self._reload_ammo_base = self:ammo_base()

	self:set_magazine_empty(false)
end

function RaycastWeaponBase:reload_interuptable()
	return false
end

function RaycastWeaponBase:on_reload(amount)
	local ammo_base = self._reload_ammo_base or self:ammo_base()
	amount = amount or ammo_base:get_ammo_max_per_clip()

	if self._setup.expend_ammo then
		ammo_base:set_ammo_remaining_in_clip(math.min(ammo_base:get_ammo_total(), amount))
	else
		ammo_base:set_ammo_remaining_in_clip(amount)
		ammo_base:set_ammo_total(amount)
	end

	managers.job:set_memory("kill_count_no_reload_" .. tostring(self._name_id), nil, true)

	self._reload_ammo_base = nil
	self._next_fire_allowed = self._unit:timer():time()
end

function RaycastWeaponBase:ammo_max()
	return self:ammo_base():get_ammo_max() == self:ammo_base():get_ammo_total()
end

function RaycastWeaponBase:out_of_ammo()
	return self:ammo_base():get_ammo_total() == 0
end

function RaycastWeaponBase:reload_prefix()
	return ""
end

function RaycastWeaponBase:can_reload()
	return self:ammo_base():get_ammo_remaining_in_clip() < self:ammo_base():get_ammo_total()
end

function RaycastWeaponBase:add_ammo_in_bullets(bullets)
	local function add_ammo(ammo_base, bullets)
		local ammo_max = ammo_base:get_ammo_max()
		local ammo_total = ammo_base:get_ammo_total()
		local ammo = math.clamp(ammo_total + bullets, 0, ammo_max)

		ammo_base:set_ammo_total(ammo)

		return bullets - (ammo - ammo_total)
	end

	bullets = add_ammo(self, bullets)

	for _, gadget in ipairs(self:get_all_override_weapon_gadgets()) do
		if gadget and gadget.ammo_base then
			bullets = add_ammo(gadget:ammo_base(), bullets)
		end
	end
end

function RaycastWeaponBase:add_ammo(ratio, add_amount_override)
	local mul_1 = managers.player:upgrade_value("player", "pick_up_ammo_multiplier", 1) - 1
	local mul_2 = managers.player:upgrade_value("player", "pick_up_ammo_multiplier_2", 1) - 1
	local crew_mul = managers.player:crew_ability_upgrade_value("crew_scavenge", 0)
	local pickup_mul = 1 + mul_1 + mul_2 + crew_mul

	local function _add_ammo(ammo_base, ratio, add_amount_override)
		if ammo_base:get_ammo_max() == ammo_base:get_ammo_total() then
			return false, 0
		end

		local picked_up = true
		local stored_pickup_ammo = nil
		local add_amount = add_amount_override

		if not add_amount then
			local min_pickup = ammo_base._ammo_pickup[1]
			local max_pickup = ammo_base._ammo_pickup[2]

			if ammo_base._ammo_data and (ammo_base._ammo_data.ammo_pickup_min_mul or ammo_base._ammo_data.ammo_pickup_max_mul) then
				min_pickup = min_pickup * (ammo_base._ammo_data.ammo_pickup_min_mul or 1)
				max_pickup = max_pickup * (ammo_base._ammo_data.ammo_pickup_max_mul or 1)
			end

			add_amount = math.lerp(min_pickup * pickup_mul, max_pickup * pickup_mul, math.random())
			picked_up = add_amount > 0
			add_amount = add_amount * (ratio or 1)
			stored_pickup_ammo = ammo_base:get_stored_pickup_ammo()

			if stored_pickup_ammo then
				add_amount = add_amount + stored_pickup_ammo

				ammo_base:remove_pickup_ammo()
			end
		end

		local rounded_amount = math.floor(add_amount)
		local new_ammo = ammo_base:get_ammo_total() + rounded_amount
		local max_allowed_ammo = ammo_base:get_ammo_max()

		if not add_amount_override and new_ammo < max_allowed_ammo then
			local leftover_ammo = add_amount - rounded_amount

			if leftover_ammo > 0 then
				ammo_base:store_pickup_ammo(leftover_ammo)
			end
		end

		ammo_base:set_ammo_total(math.clamp(new_ammo, 0, max_allowed_ammo))

		if stored_pickup_ammo then
			add_amount = math.floor(add_amount - stored_pickup_ammo)
		else
			add_amount = rounded_amount
		end

		return picked_up, add_amount
	end

	local picked_up, add_amount = nil
	picked_up, add_amount = _add_ammo(self, ratio, add_amount_override)

	if self.AKIMBO then
		local akimbo_rounding = self:get_ammo_total() % 2 + #self._fire_callbacks

		if akimbo_rounding > 0 then
			_add_ammo(self, nil, akimbo_rounding)
		end
	end

	for _, gadget in ipairs(self:get_all_override_weapon_gadgets()) do
		if gadget and gadget.ammo_base then
			local p, a = _add_ammo(gadget:ammo_base(), ratio, add_amount_override)
			picked_up = p or picked_up
			add_amount = add_amount + a

			if self.AKIMBO then
				local akimbo_rounding = gadget:ammo_base():get_ammo_total() % 2 + #self._fire_callbacks

				if akimbo_rounding > 0 then
					_add_ammo(gadget:ammo_base(), nil, akimbo_rounding)
				end
			end
		end
	end

	return picked_up, add_amount
end

function RaycastWeaponBase:add_ammo_ratio(ammo_ratio_increase)
	local function _add_ammo(ammo_base, ammo_ratio_increase)
		if ammo_base:get_ammo_max() == ammo_base:get_ammo_total() then
			return
		end

		local ammo_max = ammo_base:get_ammo_max()
		local ammo_total = ammo_base:get_ammo_total()
		ammo_total = math.ceil(ammo_total * ammo_ratio_increase)
		ammo_total = math.clamp(ammo_total, 0, ammo_max)

		ammo_base:set_ammo_total(ammo_total)
	end

	_add_ammo(self, ammo_ratio_increase)

	for _, gadget in ipairs(self:get_all_override_weapon_gadgets()) do
		if gadget and gadget.ammo_base then
			_add_ammo(gadget:ammo_base(), ammo_ratio_increase)
		end
	end
end

function RaycastWeaponBase:add_ammo_from_bag(available)
	local function process_ammo(ammo_base, amount_available)
		if ammo_base:get_ammo_max() == ammo_base:get_ammo_total() then
			return 0
		end

		local ammo_max = ammo_base:get_ammo_max()
		local ammo_total = ammo_base:get_ammo_total()
		local wanted = 1 - ammo_total / ammo_max
		local can_have = math.min(wanted, amount_available)

		ammo_base:set_ammo_total(math.min(ammo_max, ammo_total + math.ceil(can_have * ammo_max)))
		print(wanted, can_have, math.ceil(can_have * ammo_max), ammo_base:get_ammo_total())

		return can_have
	end

	local can_have = process_ammo(self, available)
	available = available - can_have

	for _, gadget in ipairs(self:get_all_override_weapon_gadgets()) do
		if gadget and gadget.ammo_base then
			local ammo = process_ammo(gadget:ammo_base(), available)
			can_have = can_have + ammo
			available = available - ammo

			gadget:on_add_ammo_from_bag()
		end
	end

	return can_have
end

function RaycastWeaponBase:reduce_ammo_by_procentage_of_total(ammo_procentage)
	local ammo_max = self:get_ammo_max()
	local ammo_total = self:get_ammo_total()
	local ammo_ratio = self:get_ammo_ratio()

	if ammo_total == 0 then
		return
	end

	local ammo_after_reduction = math.max(ammo_total - math.ceil(ammo_max * ammo_procentage), 0)

	self:set_ammo_total(math.round(math.min(ammo_total, ammo_after_reduction)))
	print("reduce_ammo_by_procentage_of_total", math.round(math.min(ammo_total, ammo_after_reduction)), ammo_after_reduction, ammo_max * ammo_procentage)

	local ammo_remaining_in_clip = self:get_ammo_remaining_in_clip()

	self:set_ammo_remaining_in_clip(math.round(math.min(ammo_after_reduction, ammo_remaining_in_clip)))
end

function RaycastWeaponBase:on_equip(user_unit)
	self:_check_magazine_empty()
end

function RaycastWeaponBase:_check_magazine_empty()
	local mag = self:ammo_base():get_ammo_remaining_in_clip()

	if mag <= (self.AKIMBO and 1 or 0) then
		local w_td = self:weapon_tweak_data()

		if w_td.animations and w_td.animations.magazine_empty then
			self:tweak_data_anim_play_at_end("magazine_empty")
		end

		self:set_magazine_empty(true)
	end
end

function RaycastWeaponBase:on_unequip(user_unit)
	if self._tango_4_data then
		self._tango_4_data = nil
	end
end

function RaycastWeaponBase:on_enabled()
	self._enabled = true

	self:_check_magazine_empty()
end

function RaycastWeaponBase:on_disabled()
	self._enabled = false
end

function RaycastWeaponBase:enabled()
	return self._enabled
end

function RaycastWeaponBase:play_tweak_data_sound(event, alternative_event)
	local event = self:_get_sound_event(event, alternative_event)

	if event then
		self:play_sound(event)
	end
end

function RaycastWeaponBase:play_sound(event)
	self._sound_fire:post_event(event)
end

function RaycastWeaponBase:_get_sound_event(event, alternative_event)
	if self:gadget_overrides_weapon_functions() then
		return self:gadget_function_override("_get_sound_event", self, event, alternative_event)
	end

	local str_name = self._name_id

	if not self.third_person_important or not self:third_person_important() then
		str_name = self._name_id:gsub("_npc", "")
	end

	local sounds = tweak_data.weapon[str_name].sounds
	local sound_event = sounds and (sounds[event] or sounds[alternative_event])

	if self:alt_fire_active() then
		event = event and event .. "_alt"
		alternative_event = alternative_event and alternative_event .. "_alt"

		if sounds and (not event or not sounds[event]) and alternative_event then
			sound_event = sounds[alternative_event] or sound_event
		end
	end

	return sound_event
end

function RaycastWeaponBase:add_ignore_unit(unit)
	local ignore_units = self._setup.ignore_units

	if not ignore_units or table.contains(ignore_units, unit) then
		return
	end

	table.insert(ignore_units, unit)
end

function RaycastWeaponBase:remove_ignore_unit(unit)
	local ignore_units = self._setup.ignore_units

	if not ignore_units then
		return
	end

	table.delete(ignore_units, unit)
end

function RaycastWeaponBase:destroy(unit)
	RaycastWeaponBase.super.pre_destroy(self, unit)

	if self._shooting then
		self:stop_shooting()
	end
end

function RaycastWeaponBase:_get_spread(user_unit)
	local spread_multiplier = self:spread_multiplier()
	local current_state = user_unit:movement()._current_state

	if current_state._moving then
		for _, category in ipairs(self:weapon_tweak_data().categories) do
			spread_multiplier = spread_multiplier * managers.player:upgrade_value(category, "move_spread_multiplier", 1)
		end
	end

	if current_state:in_steelsight() then
		return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_steelsight" or "steelsight"] * spread_multiplier
	end

	for _, category in ipairs(self:weapon_tweak_data().categories) do
		spread_multiplier = spread_multiplier * managers.player:upgrade_value(category, "hip_fire_spread_multiplier", 1)
	end

	if current_state._state_data.ducking then
		return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_crouching" or "crouching"] * spread_multiplier
	end

	return self._spread * tweak_data.weapon[self._name_id].spread[current_state._moving and "moving_standing" or "standing"] * spread_multiplier
end

function RaycastWeaponBase:set_visibility_state(state)
	self._unit:set_visible(state)

	self._visible = state
end

function RaycastWeaponBase:update_visibility_state()
end

function RaycastWeaponBase:get_steelsight_swap_progress_trigger()
	return self:weapon_tweak_data().steelsight_swap_progress_trigger or 1
end

function RaycastWeaponBase:second_sight_use_steelsight_unit()
	return false
end

function RaycastWeaponBase:set_bullet_hit_slotmask(new_slotmask)
	self._bullet_slotmask = new_slotmask
end

function RaycastWeaponBase:flashlight_state_changed()
end

function RaycastWeaponBase:set_flashlight_enabled(enabled)
end

function RaycastWeaponBase:set_scope_enabled(enabled)
end

function RaycastWeaponBase:set_timer(timer)
	self._timer = timer

	self._unit:set_timer(timer)
	self._unit:set_animation_timer(timer)
end

function RaycastWeaponBase:set_objects_visible(unit, objects, visible)
	if type(objects) == "string" then
		objects = {
			objects
		}
	end

	for _, object_name in ipairs(objects) do
		local graphic_object = unit:get_object(Idstring(object_name))

		if graphic_object then
			graphic_object:set_visibility(visible)
		end
	end
end

function RaycastWeaponBase:set_magazine_empty(is_empty)
	local data = tweak_data.weapon.factory[self._factory_id]

	if data then
		local magazine_empty_objects = data.magazine_empty_objects

		if magazine_empty_objects then
			self._magazine_empty_objects[self._name_id] = magazine_empty_objects
		elseif self._magazine_empty_objects then
			magazine_empty_objects = self._magazine_empty_objects[self.name_id]
		end

		if magazine_empty_objects then
			self:set_objects_visible(self._unit, magazine_empty_objects, not is_empty)
		end
	end
end

function RaycastWeaponBase:weapon_range()
	return self._weapon_range or 20000
end

function RaycastWeaponBase:charging()
	return false
end

function RaycastWeaponBase:apply_grip(apply)
	if apply then
		local weapon_tweak = self:weapon_tweak_data()

		if weapon_tweak.vr and weapon_tweak.vr.grip_offset then
			self._unit:set_local_position(weapon_tweak.vr.grip_offset)
		end
	else
		self._unit:set_local_position(Vector3(0, 0, 0))
	end
end

function RaycastWeaponBase:_chk_has_charms(parts, setup)
end

function RaycastWeaponBase:charm_data()
end

function RaycastWeaponBase:set_charm_data(data, upd_state)
end

function RaycastWeaponBase:_chk_charm_upd_state()
end

function RaycastWeaponBase:variant()
	return self._variant
end

function RaycastWeaponBase:ammo_data()
	return self._ammo_data
end

function RaycastWeaponBase:should_shotgun_push()
	return self._do_shotgun_push
end

function RaycastWeaponBase:concussion_tweak()
	return self._concussion_tweak
end

function RaycastWeaponBase:has_armor_piercing()
	return self._use_armor_piercing
end

function RaycastWeaponBase:is_knock_down()
	if not self._knock_down then
		return false
	end

	return self._knock_down > 0 and math.random() < self._knock_down
end

function RaycastWeaponBase:is_stagger()
	return self._stagger
end

function RaycastWeaponBase:can_shield_knock()
	return self._shield_knock
end

function RaycastWeaponBase:chk_shield_knock(hit_unit, col_ray, weapon_unit, user_unit, damage)
	if not self:can_shield_knock() or not hit_unit:in_slot(self.shield_mask) then
		return false
	end

	local enemy_unit = hit_unit:parent()
	local char_dmg_ext = alive(enemy_unit) and enemy_unit:character_damage()

	if not char_dmg_ext or not char_dmg_ext.force_hurt then
		return false
	end

	if char_dmg_ext.is_immune_to_shield_knockback and char_dmg_ext:is_immune_to_shield_knockback() then
		return false
	end

	local dmg_ratio = math.min(damage, self.SHIELD_MIN_KNOCK_BACK)
	dmg_ratio = dmg_ratio / self.SHIELD_MIN_KNOCK_BACK + 1
	local rand = math.random() * dmg_ratio

	if self.SHIELD_KNOCK_BACK_CHANCE < rand then
		local damage_info = {
			damage = 0,
			type = "shield_knock",
			variant = "melee",
			col_ray = col_ray,
			result = {
				variant = "melee",
				type = "shield_knock"
			}
		}

		char_dmg_ext:force_hurt(damage_info)

		return true
	end

	return false
end

InstantBulletBase = InstantBulletBase or class()
InstantBulletBase.id = "instant"

function InstantBulletBase:chk_friendly_fire(hit_unit, user_unit)
	local dmg_ext = hit_unit:character_damage()

	if dmg_ext and dmg_ext.is_friendly_fire and not dmg_ext:dead() and dmg_ext:is_friendly_fire(user_unit) then
		return true
	end

	local parent = not dmg_ext and hit_unit:parent()

	if alive(parent) then
		dmg_ext = parent:character_damage()

		if dmg_ext and dmg_ext.is_friendly_fire and not dmg_ext:dead() and dmg_ext:is_friendly_fire(user_unit) then
			return true
		end
	end

	return false
end

function InstantBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank, no_sound)
	local hit_unit = col_ray.unit
	user_unit = alive(user_unit) and user_unit or nil

	if user_unit and self:chk_friendly_fire(hit_unit, user_unit) then
		return "friendly_fire"
	end

	weapon_unit = alive(weapon_unit) and weapon_unit or nil
	local endurance_alive_chk = false

	if hit_unit:damage() then
		local body_dmg_ext = col_ray.body:extension() and col_ray.body:extension().damage

		if body_dmg_ext then
			local sync_damage = not blank and hit_unit:id() ~= -1
			local network_damage = math.ceil(damage * 163.84)
			local body_damage = network_damage / 163.84

			if sync_damage and managers.network:session() then
				local normal_vec_yaw, normal_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.normal, 128, 64)
				local dir_vec_yaw, dir_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.ray, 128, 64)

				managers.network:session():send_to_peers_synched("sync_body_damage_bullet", col_ray.unit:id() ~= -1 and col_ray.body or nil, user_unit and user_unit:id() ~= -1 and user_unit or nil, normal_vec_yaw, normal_vec_pitch, col_ray.position, dir_vec_yaw, dir_vec_pitch, math.min(16384, network_damage))
			end

			local local_damage = not blank or hit_unit:id() == -1

			if local_damage then
				endurance_alive_chk = true
				local weap_cats = weapon_unit and weapon_unit:base().categories and weapon_unit:base():categories()

				body_dmg_ext:damage_bullet(user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)

				if hit_unit:alive() then
					body_dmg_ext:damage_damage(user_unit, col_ray.normal, col_ray.position, col_ray.ray, body_damage)
				end

				if weap_cats and hit_unit:alive() then
					for _, category in ipairs(weap_cats) do
						body_dmg_ext:damage_bullet_type(category, user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)
					end
				end
			end
		end
	end

	if endurance_alive_chk and not hit_unit:alive() then
		return
	end

	local do_shotgun_push, result, do_push, push_mul = nil
	local hit_dmg_ext = hit_unit:character_damage()
	local play_impact_flesh = not hit_dmg_ext or not hit_dmg_ext._no_blood

	if not blank and weapon_unit then
		local weap_base = weapon_unit:base()

		if weap_base and weap_base.chk_shield_knock then
			weap_base:chk_shield_knock(hit_unit, col_ray, weapon_unit, user_unit, damage)
		end

		if hit_dmg_ext and hit_dmg_ext.damage_bullet then
			local was_alive = not hit_dmg_ext:dead()
			local armor_piercing, knock_down, stagger, variant = nil

			if weap_base then
				armor_piercing = weap_base.has_armor_piercing and weap_base:has_armor_piercing()
				knock_down = weap_base.is_knock_down and weap_base:is_knock_down()
				stagger = weap_base.is_stagger and weap_base:is_stagger()
				variant = weap_base.variant and weap_base:variant()
			end

			result = self:give_impact_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing, false, knock_down, stagger, variant)

			if result ~= "friendly_fire" then
				local has_died = hit_dmg_ext:dead()
				do_push = true
				push_mul = self:_get_character_push_multiplier(weapon_unit, was_alive and has_died)

				if weap_base and result and result.type == "death" and weap_base.should_shotgun_push and weap_base:should_shotgun_push() then
					do_shotgun_push = true
				end
			else
				play_impact_flesh = false
			end
		else
			do_push = true
		end
	else
		do_push = true
	end

	if do_push then
		managers.game_play_central:physics_push(col_ray, push_mul)
	end

	if do_shotgun_push then
		managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance, user_unit)
	end

	if play_impact_flesh then
		managers.game_play_central:play_impact_flesh({
			col_ray = col_ray,
			no_sound = no_sound
		})
		self:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
	end

	return result
end

function InstantBulletBase:on_collision_effects(col_ray, weapon_unit, user_unit, damage, blank, no_sound)
	local hit_unit = col_ray.unit
	user_unit = alive(user_unit) and user_unit or nil

	if user_unit and self:chk_friendly_fire(hit_unit, user_unit) then
		return "friendly_fire"
	end

	local play_impact_flesh = not hit_unit:character_damage() or not hit_unit:character_damage()._no_blood

	if play_impact_flesh then
		managers.game_play_central:play_impact_flesh({
			col_ray = col_ray,
			no_sound = no_sound
		})
		self:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
	end
end

function InstantBulletBase:_get_character_push_multiplier(weapon_unit, died)
	local weap_base = alive(weapon_unit) and weapon_unit:base()

	if weap_base and weap_base.should_shotgun_push and weap_base:should_shotgun_push() then
		return nil
	end

	return died and 2.5 or nil
end

function InstantBulletBase:on_hit_player(col_ray, weapon_unit, user_unit, damage)
	local armor_piercing = alive(weapon_unit) and weapon_unit:base():weapon_tweak_data().armor_piercing or nil
	col_ray.unit = managers.player:player_unit()

	return self:give_impact_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing)
end

function InstantBulletBase:bullet_slotmask()
	return managers.slot:get_mask("bullet_impact_targets")
end

function InstantBulletBase:blank_slotmask()
	return managers.slot:get_mask("bullet_blank_impact_targets")
end

function InstantBulletBase:_get_sound_and_effects_params(weapon_unit, col_ray, no_sound)
	local bullet_tweak = self.id and (tweak_data.blackmarket.bullets[self.id] or {}) or {}
	local params = {
		col_ray = col_ray,
		no_sound = no_sound,
		effect = bullet_tweak.effect,
		sound_switch_name = bullet_tweak.sound_switch_name,
		immediate = alive(weapon_unit) and weapon_unit:base().weapon_tweak_data and weapon_unit:base():weapon_tweak_data() and weapon_unit:base():weapon_tweak_data().rays ~= nil
	}

	return params
end

function InstantBulletBase:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
	managers.game_play_central:play_impact_sound_and_effects(self:_get_sound_and_effects_params(weapon_unit, col_ray, no_sound))
end

function InstantBulletBase:give_impact_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing, shield_knock, knock_down, stagger, variant)
	local action_data = {
		variant = variant or "bullet",
		damage = damage,
		weapon_unit = weapon_unit,
		attacker_unit = user_unit,
		col_ray = col_ray,
		armor_piercing = armor_piercing,
		shield_knock = shield_knock,
		origin = user_unit:position(),
		knock_down = knock_down,
		stagger = stagger
	}
	local defense_data = col_ray.unit:character_damage():damage_bullet(action_data)

	return defense_data
end

function InstantBulletBase._get_vector_sync_yaw_pitch(dir, yaw_resolution, pitch_resolution)
	mrotation.set_look_at(tmp_rot1, dir, math.UP)

	local packed_yaw = mrotation.yaw(tmp_rot1)
	packed_yaw = packed_yaw + 180
	packed_yaw = math.clamp(math.floor((yaw_resolution - 1) * packed_yaw / 360), 0, yaw_resolution - 1)
	local packed_pitch = mrotation.pitch(tmp_rot1)
	packed_pitch = packed_pitch + 90
	packed_pitch = math.clamp(math.floor((pitch_resolution - 1) * packed_pitch / 180), 0, pitch_resolution - 1)

	return packed_yaw, packed_pitch
end

InstantExplosiveBulletBase = InstantExplosiveBulletBase or class(InstantBulletBase)
InstantExplosiveBulletBase.stop_on_impact = true
InstantExplosiveBulletBase.is_explosive_bullet = true
InstantExplosiveBulletBase.id = "explosive"
InstantExplosiveBulletBase.CURVE_POW = tweak_data.upgrades.explosive_bullet.curve_pow
InstantExplosiveBulletBase.PLAYER_DMG_MUL = tweak_data.upgrades.explosive_bullet.player_dmg_mul
InstantExplosiveBulletBase.RANGE = tweak_data.upgrades.explosive_bullet.range
InstantExplosiveBulletBase.EFFECT_PARAMS = {
	sound_event = "round_explode",
	effect = "effects/payday2/particles/impacts/shotgun_explosive_round",
	on_unit = true,
	sound_muffle_effect = true,
	feedback_range = tweak_data.upgrades.explosive_bullet.feedback_range,
	camera_shake_max_mul = tweak_data.upgrades.explosive_bullet.camera_shake_max_mul,
	idstr_decal = Idstring("explosion_round"),
	idstr_effect = Idstring("")
}

function InstantExplosiveBulletBase:bullet_slotmask()
	return managers.slot:get_mask("bullet_impact_targets")
end

function InstantExplosiveBulletBase:blank_slotmask()
	return managers.slot:get_mask("bullet_blank_impact_targets")
end

function InstantExplosiveBulletBase:play_impact_sound_and_effects(weapon_unit, col_ray)
	managers.game_play_central:play_impact_sound_and_effects(self:_get_sound_and_effects_params(weapon_unit, col_ray, false))
end

function InstantExplosiveBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank, no_sound)
	local hit_unit = col_ray.unit
	user_unit = alive(user_unit) and user_unit or nil
	weapon_unit = alive(weapon_unit) and weapon_unit or nil

	if not user_unit or not self:chk_friendly_fire(hit_unit, user_unit) then
		if not hit_unit:character_damage() or not hit_unit:character_damage()._no_blood then
			self:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
		end

		if not blank and weapon_unit then
			local weap_base = weapon_unit:base()

			if weap_base and weap_base.chk_shield_knock then
				weap_base:chk_shield_knock(hit_unit, col_ray, weapon_unit, user_unit, damage)
			end
		end
	end

	if not blank and weapon_unit then
		mvec3_set(tmp_vec1, col_ray.position)
		mvec3_set(tmp_vec2, col_ray.ray)
		mvec3_norm(tmp_vec2)
		mvec3_mul(tmp_vec2, 20)
		mvec3_sub(tmp_vec1, tmp_vec2)
		self:on_collision_server(tmp_vec1, col_ray.normal, damage, user_unit, weapon_unit, managers.network:session():local_peer():id())

		return {
			variant = "explosion",
			col_ray = col_ray
		}
	end

	return nil
end

function InstantExplosiveBulletBase:on_collision_server(position, normal, damage, user_unit, weapon_unit, owner_peer_id, owner_selection_index)
	local slot_mask = managers.slot:get_mask("explosion_targets")

	managers.explosion:play_sound_and_effects(position, normal, self.RANGE, self.EFFECT_PARAMS)

	local hit_units, splinters, results = managers.explosion:detect_and_give_dmg({
		hit_pos = position,
		range = self.RANGE,
		collision_slotmask = slot_mask,
		curve_pow = self.CURVE_POW,
		damage = damage,
		player_damage = damage * self.PLAYER_DMG_MUL,
		alert_radius = self.ALERT_RADIUS,
		ignore_unit = weapon_unit,
		user = user_unit,
		owner = weapon_unit
	})
	local network_damage = math.ceil(damage * 163.84)

	managers.network:session():send_to_peers_synched("sync_explode_bullet", position, normal, math.min(16384, network_damage), owner_peer_id)

	if managers.network:session():local_peer():id() == owner_peer_id then
		local enemies_hit = (results.count_gangsters or 0) + (results.count_cops or 0)
		local enemies_killed = (results.count_gangster_kills or 0) + (results.count_cop_kills or 0)

		managers.statistics:shot_fired({
			hit = false,
			weapon_unit = weapon_unit
		})

		for i = 1, enemies_hit do
			managers.statistics:shot_fired({
				skip_bullet_count = true,
				hit = true,
				weapon_unit = weapon_unit
			})
		end

		local weapon_pass, weapon_type_pass, count_pass, all_pass = nil

		for achievement, achievement_data in pairs(tweak_data.achievement.explosion_achievements) do
			weapon_pass = not achievement_data.weapon or true
			weapon_type_pass = not achievement_data.weapon_type or weapon_unit:base() and weapon_unit:base().weapon_tweak_data and weapon_unit:base():is_category(achievement_data.weapon_type)
			count_pass = not achievement_data.count or achievement_data.count <= (achievement_data.kill and enemies_killed or enemies_hit)
			all_pass = weapon_pass and weapon_type_pass and count_pass

			if all_pass and achievement_data.award then
				managers.achievment:award(achievement_data.award)
			end
		end
	else
		local peer = managers.network:session():peer(owner_peer_id)
		local SYNCH_MIN = 0
		local SYNCH_MAX = 31
		local count_cops = math.clamp(results.count_cops, SYNCH_MIN, SYNCH_MAX)
		local count_gangsters = math.clamp(results.count_gangsters, SYNCH_MIN, SYNCH_MAX)
		local count_civilians = math.clamp(results.count_civilians, SYNCH_MIN, SYNCH_MAX)
		local count_cop_kills = math.clamp(results.count_cop_kills, SYNCH_MIN, SYNCH_MAX)
		local count_gangster_kills = math.clamp(results.count_gangster_kills, SYNCH_MIN, SYNCH_MAX)
		local count_civilian_kills = math.clamp(results.count_civilian_kills, SYNCH_MIN, SYNCH_MAX)

		managers.network:session():send_to_peer_synched(peer, "sync_explosion_results", count_cops, count_gangsters, count_civilians, count_cop_kills, count_gangster_kills, count_civilian_kills, owner_selection_index)
	end
end

function InstantExplosiveBulletBase:on_collision_client(position, normal, damage, user_unit)
	managers.explosion:give_local_player_dmg(position, self.RANGE, damage * self.PLAYER_DMG_MUL)
	managers.explosion:explode_on_client(position, normal, user_unit, damage, self.RANGE, self.CURVE_POW, self.EFFECT_PARAMS)
end

FlameBulletBase = FlameBulletBase or class(InstantExplosiveBulletBase)
FlameBulletBase.stop_on_impact = nil
FlameBulletBase.id = "flame"
FlameBulletBase.EFFECT_PARAMS = {
	sound_event = "round_explode",
	sound_muffle_effect = true,
	on_unit = true,
	feedback_range = tweak_data.upgrades.flame_bullet.feedback_range,
	camera_shake_max_mul = tweak_data.upgrades.flame_bullet.camera_shake_max_mul,
	idstr_decal = Idstring("explosion_round"),
	idstr_effect = Idstring(""),
	pushunits = tweak_data.upgrades.flame_bullet.push_units
}
FlameBulletBase.VARIANT = "fire"
FlameBulletBase.DOT_DATA_NAME = "default_fire"

function FlameBulletBase:bullet_slotmask()
	return managers.slot:get_mask("bullet_impact_targets_no_shields")
end

function FlameBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank, no_sound)
	local hit_unit = col_ray.unit
	user_unit = alive(user_unit) and user_unit or nil

	if user_unit and self:chk_friendly_fire(hit_unit, user_unit) then
		return "friendly_fire"
	end

	weapon_unit = alive(weapon_unit) and weapon_unit or nil
	local endurance_alive_chk = false

	if hit_unit:damage() then
		local body_dmg_ext = col_ray.body:extension() and col_ray.body:extension().damage

		if body_dmg_ext then
			local sync_damage = not blank and hit_unit:id() ~= -1
			local network_damage = math.ceil(damage * 163.84)
			local body_damage = network_damage / 163.84

			if sync_damage and managers.network:session() then
				local normal_vec_yaw, normal_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.normal, 128, 64)
				local dir_vec_yaw, dir_vec_pitch = self._get_vector_sync_yaw_pitch(col_ray.ray, 128, 64)

				managers.network:session():send_to_peers_synched("sync_body_damage_bullet", col_ray.unit:id() ~= -1 and col_ray.body or nil, user_unit and user_unit:id() ~= -1 and user_unit or nil, normal_vec_yaw, normal_vec_pitch, col_ray.position, dir_vec_yaw, dir_vec_pitch, math.min(16384, network_damage))
			end

			local local_damage = not blank or hit_unit:id() == -1

			if local_damage then
				endurance_alive_chk = true
				local weap_cats = weapon_unit and weapon_unit:base().categories and weapon_unit:base():categories()

				body_dmg_ext:damage_bullet(user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)

				if hit_unit:alive() then
					body_dmg_ext:damage_damage(user_unit, col_ray.normal, col_ray.position, col_ray.ray, body_damage)
				end

				if weap_cats and hit_unit:alive() then
					for _, category in ipairs(weap_cats) do
						body_dmg_ext:damage_bullet_type(category, user_unit, col_ray.normal, col_ray.position, col_ray.ray, 1)
					end
				end
			end
		end
	end

	if endurance_alive_chk and not hit_unit:alive() then
		return
	end

	local do_shotgun_push, result, do_push, push_mul = nil
	local hit_dmg_ext = hit_unit:character_damage()
	local play_impact_flesh = not hit_dmg_ext or not hit_dmg_ext._no_blood

	if not blank and weapon_unit then
		local weap_base = weapon_unit:base()

		if weap_base and weap_base.chk_shield_knock then
			weap_base:chk_shield_knock(hit_unit, col_ray, weapon_unit, user_unit, damage)
		end

		if hit_dmg_ext and hit_dmg_ext.damage_fire then
			local was_alive = not hit_dmg_ext:dead()
			local armor_piercing, knock_down, stagger, variant = nil

			if weap_base then
				armor_piercing = weap_base.has_armor_piercing and weap_base:has_armor_piercing()
				knock_down = weap_base.is_knock_down and weap_base:is_knock_down()
				stagger = weap_base.is_stagger and weap_base:is_stagger()
				variant = weap_base.variant and weap_base:variant()
			end

			result = self:give_fire_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing, false, knock_down, stagger, variant)

			if result ~= "friendly_fire" then
				local ammo_data = weap_base and weap_base.ammo_data and weap_base:ammo_data()

				if ammo_data and ammo_data.push_units then
					local has_died = hit_dmg_ext:dead()
					do_push = true
					push_mul = self:_get_character_push_multiplier(weapon_unit, was_alive and has_died)

					if result and result.type == "death" and weap_base.should_shotgun_push and weap_base:should_shotgun_push() then
						do_shotgun_push = true
					end
				end
			else
				play_impact_flesh = false
			end
		else
			local ammo_data = weap_base and weap_base.ammo_data and weap_base:ammo_data()
			do_push = ammo_data and ammo_data.push_units
		end
	elseif weapon_unit then
		local weap_base = weapon_unit:base()
		local ammo_data = weap_base and weap_base.ammo_data and weap_base:ammo_data()
		do_push = ammo_data and ammo_data.push_units
	end

	if do_push then
		managers.game_play_central:physics_push(col_ray, push_mul)
	end

	if do_shotgun_push then
		managers.game_play_central:do_shotgun_push(col_ray.unit, col_ray.position, col_ray.ray, col_ray.distance, user_unit)
	end

	if play_impact_flesh then
		managers.game_play_central:play_impact_flesh({
			col_ray = col_ray,
			no_sound = no_sound ~= false
		})
		self:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
	end

	return result
end

function FlameBulletBase:give_fire_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing, shield_knock, knock_down, stagger, variant)
	local action_data = {
		variant = variant or self.VARIANT,
		damage = damage,
		weapon_unit = weapon_unit,
		attacker_unit = user_unit,
		col_ray = col_ray,
		armor_piercing = armor_piercing,
		shield_knock = shield_knock,
		knock_down = knock_down,
		stagger = stagger
	}
	local defense_data = col_ray.unit:character_damage():damage_fire(action_data)

	if defense_data and defense_data ~= "friendly_fire" then
		local char_dmg_ext = alive(col_ray.unit) and col_ray.unit:character_damage()

		if char_dmg_ext and char_dmg_ext.damage_dot and (not char_dmg_ext.dead or not char_dmg_ext:dead()) then
			local dot_data = DOTBulletBase._dot_data_by_weapon(self, weapon_unit)

			if dot_data then
				self:start_dot_damage(col_ray, weapon_unit, dot_data, nil, user_unit, defense_data)
			end
		end
	end

	return defense_data
end

function FlameBulletBase:start_dot_damage(col_ray, weapon_unit, dot_data, weapon_id, user_unit, defense_data)
	local target_unit = col_ray.unit

	if not alive(target_unit) then
		return
	end

	local target_base_ext = target_unit:base()
	local char_tweak = target_base_ext and target_base_ext.char_tweak and target_base_ext:char_tweak()
	local flammable = char_tweak and char_tweak.flammable ~= false
	local can_dot = flammable

	if not can_dot then
		return
	end

	can_dot = not dot_data.dot_trigger_chance or math.random() <= dot_data.dot_trigger_chance or false

	if not can_dot then
		return
	end

	local weapon = nil
	local attacker = alive(user_unit) and user_unit or nil

	if attacker then
		local base_ext = attacker:base()

		if base_ext and base_ext.thrower_unit then
			attacker = base_ext:thrower_unit()
			attacker = alive(attacker) and attacker or nil
			weapon = user_unit
		end
	end

	if dot_data.dot_trigger_max_distance then
		if not attacker then
			return
		end

		local distance = mvector3.distance(attacker:position(), target_unit:position())
		can_dot = distance <= dot_data.dot_trigger_max_distance
	end

	if not can_dot then
		return
	end

	weapon = weapon or alive(weapon_unit) and weapon_unit or nil

	if not weapon_id and weapon then
		local base_ext = weapon:base()
		weapon_id = base_ext and base_ext.get_name_id and base_ext:get_name_id()
	end

	local data = {
		unit = target_unit,
		dot_data = dot_data,
		weapon_id = weapon_id,
		weapon_unit = weapon,
		attacker_unit = attacker
	}

	managers.fire:add_doted_enemy(data)

	if char_tweak and char_tweak.use_animation_on_fire_damage ~= false then
		local char_dmg_ext = target_unit:character_damage()

		if char_dmg_ext.get_last_time_unit_got_fire_damage and char_dmg_ext.force_hurt then
			local last_fire_t = char_dmg_ext:get_last_time_unit_got_fire_damage()
			local t = TimerManager:game():time()

			if not last_fire_t or t - last_fire_t > (char_tweak.fire_animation_cooldown or 1) then
				local damage_info = nil

				if type(defense_data) == "table" and defense_data.attack_data then
					damage_info = defense_data.attack_data
					damage_info.type = "fire_hurt"

					if damage_info.result then
						damage_info.result.type = "fire_hurt"
						damage_info.result.variant = dot_data.variant or self.VARIANT
					else
						damage_info.result = {
							type = "fire_hurt",
							variant = dot_data.variant or self.VARIANT
						}
					end
				else
					damage_info = {
						damage = 0,
						type = "fire_hurt",
						variant = dot_data.variant or self.VARIANT,
						col_ray = col_ray,
						result = {
							type = "fire_hurt",
							variant = dot_data.variant or self.VARIANT
						}
					}
				end

				char_dmg_ext:force_hurt(damage_info)
			end
		end
	end
end

function FlameBulletBase:give_damage_dot(col_ray, weapon_unit, attacker_unit, damage, hurt_animation, weapon_id, variant)
	local action_data = {
		variant = variant or self.VARIANT,
		damage = damage,
		weapon_unit = weapon_unit,
		attacker_unit = attacker_unit,
		col_ray = col_ray,
		weapon_id = weapon_id
	}
	local defense_data = nil
	local char_dmg_ext = col_ray and alive(col_ray.unit) and col_ray.unit:character_damage()

	if char_dmg_ext and char_dmg_ext.damage_dot then
		defense_data = char_dmg_ext:damage_dot(action_data)
	end

	return defense_data
end

function FlameBulletBase:play_impact_sound_and_effects(weapon_unit, col_ray, no_sound)
end

function FlameBulletBase:on_hit_player(col_ray, weapon_unit, user_unit, damage)
	col_ray.unit = managers.player:player_unit()
	local action_data = {
		is_hit = true,
		variant = "fire",
		damage = damage,
		weapon_unit = weapon_unit,
		attacker_unit = user_unit,
		col_ray = col_ray
	}
	local defense_data = col_ray.unit:character_damage():damage_fire(action_data)

	return defense_data
end

DragonBreathBulletBase = DragonBreathBulletBase or class(InstantBulletBase)
DragonBreathBulletBase.id = "dragons_breath"

function DragonBreathBulletBase:give_impact_damage(col_ray, weapon_unit, user_unit, damage, armor_piercing, shield_knock, knock_down, stagger, variant)
	local action_data = {
		variant = variant or "bullet",
		damage = damage,
		weapon_unit = weapon_unit,
		attacker_unit = user_unit,
		col_ray = col_ray,
		armor_piercing = armor_piercing,
		shield_knock = shield_knock,
		origin = user_unit:position(),
		knock_down = knock_down,
		stagger = stagger
	}
	local defense_data = col_ray.unit:character_damage():damage_bullet(action_data)

	return defense_data
end

DOTBulletBase = DOTBulletBase or class(InstantBulletBase)
DOTBulletBase.DOT_DATA_NAME = "weapon_dotbulletbase"

function DOTBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank)
	local result = DOTBulletBase.super.on_collision(self, col_ray, weapon_unit, user_unit, damage, blank, self.NO_BULLET_INPACT_SOUND)

	if not blank and result and result ~= "friendly_fire" then
		local hit_unit = col_ray.unit
		local hit_dmg_ext = alive(hit_unit) and hit_unit:character_damage()

		if hit_dmg_ext and hit_dmg_ext.damage_dot and not hit_dmg_ext:dead() then
			user_unit = alive(user_unit) and user_unit or nil
			weapon_unit = alive(weapon_unit) and weapon_unit or nil
			local weap_base = weapon_unit and weapon_unit:base()
			local weapon_id = weap_base and weap_base.get_name_id and weap_base:get_name_id()

			self:start_dot_damage(col_ray, weapon_unit, self:_dot_data_by_weapon(weapon_unit), weapon_id, user_unit)
		end
	end

	return result
end

function DOTBulletBase:_dot_data_by_weapon(weapon_unit)
	local weap_base = alive(weapon_unit) and weapon_unit:base()
	local ammo_data = weap_base.ammo_data and weap_base:ammo_data()
	local dot_data_name = ammo_data and ammo_data.dot_data_name

	if not dot_data_name then
		local weapon_tweak_data = weap_base and weap_base.weapon_tweak_data and weap_base:weapon_tweak_data()
		dot_data_name = weapon_tweak_data and weapon_tweak_data.dot_data_name
	end

	if dot_data_name then
		return tweak_data.dot:get_dot_data(dot_data_name)
	end

	return nil
end

function DOTBulletBase:start_dot_damage(col_ray, weapon_unit, dot_data, weapon_id, user_unit)
	if not alive(col_ray.unit) then
		return
	end

	dot_data = dot_data or tweak_data.dot:get_dot_data(self.DOT_DATA_NAME)
	weapon_unit = alive(weapon_unit) and weapon_unit or nil
	user_unit = alive(user_unit) and user_unit or nil
	local hurt_animation = not dot_data.hurt_animation_chance or math.rand(1) < dot_data.hurt_animation_chance
	local modified_length = nil

	if dot_data.use_weapon_damage_falloff then
		local weap_base = weapon_unit and weapon_unit:base()

		if weap_base and weap_base.get_damage_falloff then
			modified_length = weap_base:get_damage_falloff(dot_data.dot_length, col_ray, user_unit)
		end
	end

	local data = {
		unit = col_ray.unit,
		dot_data = dot_data,
		hurt_animation = hurt_animation,
		modified_length = modified_length,
		weapon_id = weapon_id,
		weapon_unit = weapon_unit,
		attacker_unit = user_unit
	}

	managers.dot:add_doted_enemy(data)
end

function DOTBulletBase:give_damage_dot(col_ray, weapon_unit, attacker_unit, damage, hurt_animation, weapon_id, variant)
	local action_data = {
		variant = variant or self.VARIANT,
		damage = damage,
		weapon_unit = weapon_unit,
		attacker_unit = attacker_unit,
		col_ray = col_ray,
		hurt_animation = hurt_animation,
		weapon_id = weapon_id
	}
	local defense_data = nil
	local char_dmg_ext = col_ray and alive(col_ray.unit) and col_ray.unit:character_damage()

	if char_dmg_ext and char_dmg_ext.damage_dot then
		defense_data = char_dmg_ext:damage_dot(action_data)
	end

	return defense_data
end

PoisonBulletBase = PoisonBulletBase or class(DOTBulletBase)
PoisonBulletBase.VARIANT = "poison"
ProjectilesPoisonBulletBase = ProjectilesPoisonBulletBase or class(PoisonBulletBase)
ProjectilesPoisonBulletBase.NO_BULLET_INPACT_SOUND = true

function ProjectilesPoisonBulletBase:on_collision(col_ray, weapon_unit, user_unit, damage, blank)
	local result = DOTBulletBase.super.on_collision(self, col_ray, weapon_unit, user_unit, damage, blank, self.NO_BULLET_INPACT_SOUND)

	if not blank and result and result ~= "friendly_fire" then
		local hit_unit = col_ray.unit
		local hit_dmg_ext = alive(hit_unit) and hit_unit:character_damage()

		if hit_dmg_ext and hit_dmg_ext.damage_dot and not hit_dmg_ext:dead() then
			local weap_base = alive(weapon_unit) and weapon_unit:base()

			if weap_base then
				local dot_data = tweak_data.projectiles[weap_base._projectile_entry]
				dot_data = dot_data and dot_data.dot_data_name and tweak_data.dot:get_dot_data(dot_data.dot_data_name)

				if dot_data then
					local weapon_id = weap_base and weap_base.get_name_id and weap_base:get_name_id()

					self:start_dot_damage(col_ray, weapon_unit, dot_data, weapon_id, user_unit)
				end
			end
		end
	end

	return result
end

ConcussiveInstantBulletBase = ConcussiveInstantBulletBase or class(InstantBulletBase)

function ConcussiveInstantBulletBase:give_impact_damage(col_ray, weapon_unit, user_unit, damage, ...)
	if col_ray.unit:character_damage().on_concussion then
		local conc_tweak = alive(weapon_unit) and weapon_unit:base().concussion_tweak and weapon_unit:base():concussion_tweak()
		local conc_mul = conc_tweak and conc_tweak.mul or tweak_data.character.concussion_multiplier
		local sound_tweak = conc_tweak and conc_tweak.sound_duration
		local sound_eff_mul = sound_tweak and sound_tweak.mul or 0.3

		managers.environment_controller:set_concussion_grenade(col_ray.unit:movement():m_head_pos(), true, 0, 0, conc_mul, true, true)
		col_ray.unit:character_damage():on_concussion(sound_eff_mul, false, sound_tweak)
	elseif Network:is_server() and col_ray.unit:character_damage().stun_hit then
		local function can_stun(hit_unit)
			local brain_ext = hit_unit:brain()

			if brain_ext and brain_ext.is_hostage and brain_ext:is_hostage() then
				return false
			end

			local base_ext = hit_unit:base()

			if base_ext and base_ext.char_tweak and base_ext:char_tweak().immune_to_concussion then
				return false
			end

			return true
		end

		if can_stun(col_ray.unit) then
			local action_data = {
				variant = "stun",
				damage = 0,
				attacker_unit = user_unit,
				weapon_unit = weapon_unit,
				col_ray = col_ray
			}

			col_ray.unit:character_damage():stun_hit(action_data)
		end
	end

	return self.super.give_impact_damage(self, col_ray, weapon_unit, user_unit, damage, ...)
end

InstantSnowballBase = InstantSnowballBase or class(InstantExplosiveBulletBase)
InstantSnowballBase.id = "xmas_snowball"
InstantSnowballBase.CURVE_POW = tweak_data.projectiles.xmas_snowball.curve_pow
InstantSnowballBase.PLAYER_DMG_MUL = tweak_data.projectiles.xmas_snowball.player_dmg_mul
InstantSnowballBase.RANGE = tweak_data.projectiles.xmas_snowball.range
InstantSnowballBase.ALERT_RADIUS = tweak_data.projectiles.xmas_snowball.alert_radius
InstantSnowballBase.EFFECT_PARAMS = {
	on_unit = true,
	sound_muffle_effect = true,
	effect = tweak_data.projectiles.xmas_snowball.effect_name,
	sound_event = tweak_data.projectiles.xmas_snowball.sound_event,
	feedback_range = tweak_data.projectiles.xmas_snowball.feedback_range,
	camera_shake_max_mul = tweak_data.projectiles.xmas_snowball.camera_shake_max_mul,
	idstr_decal = tweak_data.projectiles.xmas_snowball.idstr_decal,
	idstr_effect = tweak_data.projectiles.xmas_snowball.idstr_effect
}
