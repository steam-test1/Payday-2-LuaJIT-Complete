local ids_base = Idstring("base")
PlayerTurretBase = PlayerTurretBase or class(RaycastWeaponBase)
PlayerTurretBase.INTERACTION_PREFIX = "interact_"
PlayerTurretBase.INTERACT_INVALID = 0
PlayerTurretBase.INTERACT_ACTIVATE = 1
PlayerTurretBase.INTERACT_DEACTIVATE = 2
PlayerTurretBase.INTERACT_ASSEMBLE = 3
PlayerTurretBase.INTERACT_DISASSEMBLE = 4
PlayerTurretBase.INTERACT_ENTER = 5
PlayerTurretBase.INTERACT_EXIT = 6
PlayerTurretBase.STATE_INVALID = 0
PlayerTurretBase.STATE_INACTIVE = 1
PlayerTurretBase.STATE_ASSEMBLABLE = 2
PlayerTurretBase.STATE_OPERATIONAL = 3
PlayerTurretBase.STATE_IN_USE = 4
PlayerTurretBase.SYNC_START_FIRE = 15
PlayerTurretBase.SYNC_STOP_FIRE = 16
PlayerTurretBase.STATE_SEQUENCES = {
	{
		"on_deactivated",
		"on_deactivated"
	},
	{
		"on_activated",
		"on_disassembled"
	},
	{
		"on_assembled",
		"on_exited"
	},
	{
		"on_entered",
		"on_entered"
	}
}
PlayerTurretBase.STATE_ACTIONS = {
	{
		[PlayerTurretBase.INTERACT_ACTIVATE] = PlayerTurretBase.STATE_ASSEMBLABLE,
		[PlayerTurretBase.INTERACT_ASSEMBLE] = PlayerTurretBase.STATE_OPERATIONAL
	},
	{
		[PlayerTurretBase.INTERACT_DEACTIVATE] = PlayerTurretBase.STATE_INACTIVE,
		[PlayerTurretBase.INTERACT_ASSEMBLE] = PlayerTurretBase.STATE_OPERATIONAL
	},
	{
		[PlayerTurretBase.INTERACT_DEACTIVATE] = PlayerTurretBase.STATE_INACTIVE,
		[PlayerTurretBase.INTERACT_DISASSEMBLE] = PlayerTurretBase.STATE_ASSEMBLABLE,
		[PlayerTurretBase.INTERACT_ENTER] = PlayerTurretBase.STATE_IN_USE
	},
	{
		[PlayerTurretBase.INTERACT_EXIT] = PlayerTurretBase.STATE_OPERATIONAL
	}
}
PlayerTurretBase.SETTABLE_STATES = {
	inactive = PlayerTurretBase.STATE_INACTIVE,
	assemblable = PlayerTurretBase.STATE_ASSEMBLABLE,
	operational = PlayerTurretBase.STATE_OPERATIONAL
}

function PlayerTurretBase:init(unit)
	UnitBase.init(self, unit, false)

	self._name_id = self.name_id or "amcar"
	self.name_id = nil
	self._visible = true
	self._tweak_data = tweak_data.player_turrets[self.tweak_data_entry] or tweak_data.player_turrets.ranc_heavy_machine_gun

	self:_create_use_setups()

	self._setup = {}
	self._digest_values = false
	self._ammo_data = false
	self._damage = 0
	self._autohit_data = {
		INIT_RATIO = 1,
		MAX_RATIO = 1,
		far_angle = 0.0005,
		far_dis = 10000,
		MIN_RATIO = 0,
		near_angle = 0.0005
	}
	self._autohit_current = self._autohit_data.INIT_RATIO
	local weap_tweak = self:weapon_tweak_data()
	self._bullet_class = InstantBulletBase
	self._bullet_slotmask = self._bullet_class:bullet_slotmask()
	self._blank_slotmask = self._bullet_class:blank_slotmask()
	self._next_fire_allowed = -1000
	self._obj_fire = self._unit:get_object(Idstring("fire"))
	self._muzzle_effect = Idstring(weap_tweak.muzzleflash or "effects/particles/test/muzzleflash_maingun")
	self._muzzle_effect_table = {
		force_synch = true,
		effect = self._muzzle_effect,
		parent = self._obj_fire
	}
	self._use_shell_ejection_effect = true
	self._obj_shell_ejection = self._unit:get_object(Idstring("shell"))
	self._shell_ejection_effect = Idstring(weap_tweak.shell_ejection or "effects/payday2/particles/weapons/shells/shell_556")
	self._shell_ejection_effect_table = {
		effect = self._shell_ejection_effect,
		parent = self._obj_shell_ejection
	}
	self._sound_fire = SoundDevice:create_source("fire")

	self._sound_fire:link(self._unit:orientation_object())

	local trail_effect_ids = weap_tweak.trail_effect and Idstring(weap_tweak.trail_effect) or self.TRAIL_EFFECT
	self._trail_effect_table = {
		effect = trail_effect_ids,
		position = Vector3(),
		normal = Vector3()
	}
	self._shot_fired_stats_table = {
		hit = false,
		weapon_unit = self._unit
	}
	self._player_attach_ids = self.player_attach_point and Idstring(self.player_attach_point) or self._unit:orientation_object():name()
	self._third_attach_ids = self.third_attach_point and Idstring(self.third_attach_point) or self._unit:orientation_object():name()
	self._player_attach_local_pos = self._player_attach_ids and self._unit:get_object(self._player_attach_ids):local_position()
	self._third_attach_local_pos = self._third_attach_ids and self._unit:get_object(self._third_attach_ids):local_position()
	self._current_state = PlayerTurretBase.STATE_INACTIVE

	tweak_data:add_reload_callback(self, self.tweak_data_clbk_reload)

	self._do_shotgun_push = tweak_data.weapon[self._name_id].can_do_shotgun_push
	self._can_shoot_through_shield = tweak_data.weapon[self._name_id].can_shoot_through_shield
	self._can_shoot_through_enemy = tweak_data.weapon[self._name_id].can_shoot_through_enemy
	self._can_shoot_through_wall = tweak_data.weapon[self._name_id].can_shoot_through_wall
	self._material = self._unit:material_config()

	if self._tweak_data.bullet_objects then
		self._bullet_objects = {}
		local prefix = self._tweak_data.bullet_objects.prefix

		for i = 1, self._tweak_data.bullet_objects.amount do
			local object = self._unit:get_object(Idstring(prefix .. i))

			if object then
				self._bullet_objects[i] = self._bullet_objects[i] or {}

				table.insert(self._bullet_objects[i], object)
			end
		end

		local extra_objects = self._tweak_data.bullet_objects.extra_objects or {}

		for _, extra in pairs(extra_objects) do
			local i = extra.ammo
			local object = self._unit:get_object(Idstring(extra.object))

			if object then
				self._bullet_objects[i] = self._bullet_objects[i] or {}

				table.insert(self._bullet_objects[i], object)
			end
		end
	end
end

function PlayerTurretBase:tweak_data_clbk_reload()
	self._tweak_data = tweak_data.player_turrets[self.tweak_data_entry] or tweak_data.player_turrets.ranc_heavy_machine_gun
end

function PlayerTurretBase:post_init()
	local unit = self._unit
	self._ext_movement = unit:movement()
	self._ext_brain = unit:brain()
	self._ext_interaction = unit:interaction()
	self._ext_network = unit:network()
	self._current_state = self.SETTABLE_STATES[self.state] or PlayerTurretBase.STATE_INACTIVE

	if self._difficulty_sequences then
		local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
		local difficulty_index = tweak_data:difficulty_to_index(difficulty)
		local difficulty_sequences_split = string.split(self._difficulty_sequences, ";")
		local difficulty_sequence = difficulty_sequences_split[difficulty_index]

		if difficulty_sequence and difficulty_sequence ~= "" then
			self:run_sequence(difficulty_sequence)
		end
	end

	self._ext_movement:post_init()
	self._ext_brain:post_init()

	local setup_data = {
		user_unit = nil,
		ignore_units = {
			self._unit
		},
		autoaim = true,
		expend_ammo = true,
		hit_slotmask = managers.slot:get_mask("bullet_impact_targets"),
		hit_player = false,
		user_sound_variant = nil,
		alert_AI = true,
		alert_filter = nil
	}

	self:setup(setup_data)
end

function PlayerTurretBase:setup(setup_data)
	print("PlayerTurretBase:setup")
	RaycastWeaponBase.setup(self, setup_data)
	self:replenish()
end

function PlayerTurretBase:activate_turret()
	print("PlayerTurretBase:activate_turret")

	if not Network:is_server() then
		return
	end

	if self._current_state == PlayerTurretBase.STATE_INACTIVE then
		managers.player:server_player_turret_action(PlayerTurretBase.INTERACT_ACTIVATE, self._unit, 0, nil)
	end
end

function PlayerTurretBase:deactivate_turret()
	print("PlayerTurretBase:deactivate_turret")

	if not Network:is_server() then
		return
	end

	if self._current_state ~= PlayerTurretBase.STATE_INACTIVE then
		managers.player:server_player_turret_action(PlayerTurretBase.INTERACT_DEACTIVATE, self._unit, 0, nil)
	end
end

function PlayerTurretBase:assemble_turret()
	print("PlayerTurretBase:assemble_turret")

	if not Network:is_server() then
		return
	end

	if self._current_state < PlayerTurretBase.STATE_OPERATIONAL then
		managers.player:server_player_turret_action(PlayerTurretBase.INTERACT_ASSEMBLE, self._unit, 0, nil)
	end
end

function PlayerTurretBase:disassemble_turret()
	print("PlayerTurretBase:disassemble_turret")

	if not Network:is_server() then
		return
	end

	if self._current_state == PlayerTurretBase.STATE_OPERATIONAL then
		managers.player:server_player_turret_action(PlayerTurretBase.INTERACT_DISASSEMBLE, self._unit, 0, nil)
	end
end

function PlayerTurretBase:get_turret_tweak_data()
	return self._tweak_data
end

function PlayerTurretBase:change_state(state)
	if state == self._current_state or state <= PlayerTurretBase.STATE_INVALID or PlayerTurretBase.STATE_IN_USE < state then
		return false
	end

	local seqeunce_order_index = self._current_state < state and 1 or 2
	local dir_i = self._current_state < state and 1 or -1
	local start_i = self._current_state + dir_i
	local end_i = state

	for i = start_i, end_i, dir_i do
		self:run_sequence(PlayerTurretBase.STATE_SEQUENCES[i][seqeunce_order_index])
	end

	self._current_state = state

	if managers.network:session() and Network:is_server() then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", state)
	end

	return true
end

function PlayerTurretBase:run_sequence(sequence)
	print("PlayerTurretBase:run_sequence", sequence)

	if self._unit:damage():has_sequence(sequence) then
		self._unit:damage():run_sequence_simple(sequence)
	end
end

function PlayerTurretBase:get_state_from_action(action)
	local state = PlayerTurretBase.STATE_ACTIONS[self._current_state]
	state = state and state[action]

	return state or PlayerTurretBase.STATE_INVALID
end

function PlayerTurretBase:get_action_for_interaction(player, locator)
	if not locator then
		return PlayerTurretBase.INTERACT_INVALID
	end

	local locator_name = locator:name()

	if self._current_state == PlayerTurretBase.STATE_INACTIVE then
		local activate_interaction = self._tweak_data.activate_point and Idstring(PlayerTurretBase.INTERACTION_PREFIX .. self._tweak_data.activate_point)

		if locator_name == activate_interaction then
			return PlayerTurretBase.INTERACT_ACTIVATE
		end
	elseif self._current_state == PlayerTurretBase.STATE_ASSEMBLABLE then
		local deactivate_interaction = self._tweak_data.deactivate_point and Idstring(PlayerTurretBase.INTERACTION_PREFIX .. self._tweak_data.deactivate_point)

		if locator_name == deactivate_interaction then
			return PlayerTurretBase.INTERACT_DEACTIVATE
		end

		local assemble_interaction = self._tweak_data.assemble_point and Idstring(PlayerTurretBase.INTERACTION_PREFIX .. self._tweak_data.assemble_point)

		if locator_name == assemble_interaction then
			return PlayerTurretBase.INTERACT_ASSEMBLE
		end
	elseif self._current_state == PlayerTurretBase.STATE_OPERATIONAL then
		local disassemble_interaction = self._tweak_data.disassemble_point and Idstring(PlayerTurretBase.INTERACTION_PREFIX .. self._tweak_data.disassemble_point)

		if locator_name == disassemble_interaction then
			if self._tweak_data.disassemble_into_inactive then
				return PlayerTurretBase.INTERACT_DEACTIVATE
			end

			return PlayerTurretBase.INTERACT_DISASSEMBLE
		end

		local enter_interaction = self._tweak_data.enter_point and Idstring(PlayerTurretBase.INTERACTION_PREFIX .. self._tweak_data.enter_point)

		if locator_name == enter_interaction then
			return PlayerTurretBase.INTERACT_ENTER
		end
	elseif self._current_state == PlayerTurretBase.STATE_IN_USE then
		local exit_interaction = self._tweak_data.exit_point and Idstring(PlayerTurretBase.INTERACTION_PREFIX .. self._tweak_data.exit_point)

		if locator_name == exit_interaction then
			return PlayerTurretBase.INTERACT_EXIT
		end
	end

	return PlayerTurretBase.INTERACT_INVALID
end

function PlayerTurretBase:get_attach_point_obj(third_point)
	return self._unit:get_object(third_point and self._third_attach_ids or self._player_attach_ids)
end

function PlayerTurretBase:get_attach_point_local_pos(third_point)
	return third_point and self._third_attach_local_pos or self._player_attach_local_pos
end

function PlayerTurretBase:on_player_enter(player_unit)
	print("on_player_enter", player_unit)

	if alive(player_unit) then
		self._owner = player_unit

		self._owner:link(self._unit)
		self._owner:base():add_destroy_listener(self._unit:key(), callback(self, self, "remove_dead_owner"))
		self._ext_brain:switch_on()

		if self._owner == managers.player:local_player() and self.fps_material then
			managers.dyn_resource:change_material_config(Idstring(self.fps_material), self._unit, true)
		end
	end
end

function PlayerTurretBase:on_player_exit()
	print("on_player_exit", self._owner)
	self._ext_brain:switch_off()
	self._unit:unlink()

	if alive(self._owner) then
		if self._owner == managers.player:local_player() and self.fps_material then
			managers.dyn_resource:change_material_config(self._material, self._unit, true)
		end

		self._owner:base():remove_destroy_listener(self._unit:key())
	end

	self._owner = nil
end

function PlayerTurretBase:switch_on()
	self._setup.user_unit = self._owner
	self._setup.ignore_units = {
		self._unit,
		self._owner
	}
end

function PlayerTurretBase:switch_off()
	self._setup.user_unit = nil
	self._setup.ignore_units = {
		self._unit
	}
end

function PlayerTurretBase:remove_dead_owner(dead_owner)
	local peer_id = managers.criminals:character_peer_id_by_unit(dead_owner) or 0

	managers.player:sync_exit_player_turret(peer_id, dead_owner)
end

function PlayerTurretBase:third_person_important()
	return true
end

function PlayerTurretBase:start_shooting()
	PlayerTurretBase.super.start_shooting(self)

	if managers.network:session() then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", PlayerTurretBase.SYNC_START_FIRE)
	end
end

function PlayerTurretBase:stop_shooting()
	PlayerTurretBase.super.stop_shooting(self)

	if managers.network:session() then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", PlayerTurretBase.SYNC_STOP_FIRE)
	end
end

function PlayerTurretBase:set_ammo_remaining_in_clip(ammo_remaining_in_clip)
	PlayerTurretBase.super.set_ammo_remaining_in_clip(self, ammo_remaining_in_clip)
	self._sound_fire:set_rtpc("ammo_left", ammo_remaining_in_clip)
	self:check_bullet_objects()
end

function PlayerTurretBase:check_bullet_objects()
	if self._bullet_objects then
		self:_update_bullet_objects("get_ammo_remaining_in_clip")
	end
end

function PlayerTurretBase:_update_bullet_objects(func_name)
	if self._bullet_objects then
		local ammo_base = self:ammo_base()
		local ammo_func = ammo_base[func_name]

		for i, objects in pairs(self._bullet_objects) do
			for _, object in ipairs(objects) do
				if object then
					local ammo = ammo_func(ammo_base)

					object:set_visibility(i <= ammo)
				end
			end
		end
	end
end

function PlayerTurretBase:auto_trigger_held(direction)
	local fired = false

	if self._next_fire_allowed <= self._unit:timer():time() then
		fired = self:auto_fire_blank(direction)

		if fired then
			local weap_tweak = self:weapon_tweak_data()
			local fire_rate = weap_tweak and weap_tweak.auto and weap_tweak.auto.fire_rate
			fire_rate = fire_rate or 0.1
			self._next_fire_allowed = self._next_fire_allowed + fire_rate
		end
	end

	return fired
end

local mto = Vector3()
local mfrom = Vector3()
local mspread = Vector3()

function PlayerTurretBase:auto_fire_blank(direction)
	local user_unit = self._setup.user_unit

	if self._obj_fire then
		self._obj_fire:m_position(mfrom)
	else
		self._unit:m_position(mfrom)
	end

	local rays = {}
	local right = direction:cross(math.UP):normalized()
	local up = direction:cross(right):normalized()
	local spread_x, spread_y = self:_get_spread()
	local theta = math.random() * 360
	local ax = math.sin(theta) * math.random() * spread_x
	local ay = math.cos(theta) * math.random() * (spread_y or spread_x)

	mvector3.set(mspread, direction)
	mvector3.add(mspread, right * math.rad(ax))
	mvector3.add(mspread, up * math.rad(ay))
	mvector3.set(mto, mspread)
	mvector3.multiply(mto, 20000)
	mvector3.add(mto, mfrom)

	local col_ray = World:raycast("ray", mfrom, mto, "slot_mask", self._blank_slotmask, "ignore_unit", self._setup.ignore_units)

	if alive(self._obj_fire) then
		self._obj_fire:m_position(self._trail_effect_table.position)
		mvector3.set(self._trail_effect_table.normal, mspread)
	end

	local trail = nil

	if not self:weapon_tweak_data().no_trail then
		trail = alive(self._obj_fire) and (not col_ray or col_ray.distance > 650) and World:effect_manager():spawn(self._trail_effect_table) or nil
	end

	if col_ray then
		if alive(user_unit) then
			InstantBulletBase:on_collision(col_ray, self._unit, user_unit, self._damage, true)
		end

		if trail then
			World:effect_manager():set_remaining_lifetime(trail, math.clamp((col_ray.distance - 600) / 10000, 0, col_ray.distance))
		end

		table.insert(rays, col_ray)
	end

	if alive(self._obj_fire) then
		self:_spawn_muzzle_effect(mfrom, direction)
	end

	if self._use_shell_ejection_effect then
		World:effect_manager():spawn(self._shell_ejection_effect_table)
	end

	if self:weapon_tweak_data().has_fire_animation then
		self:tweak_data_anim_play("fire", self:fire_rate_multiplier())
	end

	if alive(user_unit) and user_unit:movement() then
		local anim_data = user_unit:anim_data()

		if not anim_data or not anim_data.reload then
			user_unit:movement():play_redirect("recoil_single")
		end
	end

	self:play_tweak_data_sound("fire_single_npc", "fire_single")

	return true
end

function PlayerTurretBase:_get_spread()
	return self._spread * (tweak_data.weapon[self._name_id] and tweak_data.weapon[self._name_id].spread.standing or 1)
end

function PlayerTurretBase:update_damage()
	local weapon_stats = tweak_data.weapon.stats
	local damage_modifier = weapon_stats.stats_modifiers and weapon_stats.stats_modifiers.damage or 1
	local stats = tweak_data.weapon[self._name_id].stats
	local base_damage = (stats and weapon_stats.damage[stats.damage] or 0) * damage_modifier
	self._damage = (base_damage + self:damage_addend()) * self:damage_multiplier()
end

function PlayerTurretBase:damage_addend()
	local user_unit = self._setup and self._setup.user_unit
	local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state

	return managers.blackmarket:damage_addend(self._name_id, self:weapon_tweak_data().categories, self._silencer, nil, current_state, self._blueprint)
end

function PlayerTurretBase:damage_multiplier()
	local user_unit = self._setup and self._setup.user_unit
	local current_state = alive(user_unit) and user_unit:movement() and user_unit:movement()._current_state

	return managers.blackmarket:damage_multiplier(self._name_id, self:weapon_tweak_data().categories, self._silencer, nil, current_state, self._blueprint)
end

function PlayerTurretBase:pre_destroy()
	PlayerTurretBase.super.pre_destroy(self, self._unit)
	self:remove_dead_owner()
end

function PlayerTurretBase:save(save_data)
	local my_save_data = {}
	save_data.base = my_save_data
	my_save_data.state = self._current_state
	my_save_data.is_shooting = self:shooting()
	my_save_data.next_fire_allowed = self._next_fire_allowed - self._unit:timer():time()
end

function PlayerTurretBase:load(save_data)
	local my_save_data = save_data.base

	self:change_state(my_save_data.state)

	self._shooting = my_save_data.is_shooting
	self._next_fire_allowed = self._unit:timer():time() + my_save_data.next_fire_allowed
end

function PlayerTurretBase:sync_net_event(state)
	if state == PlayerTurretBase.SYNC_START_FIRE then
		self._shooting = true
		self._next_fire_allowed = math.max(self._next_fire_allowed, self._unit:timer():time())
	elseif state == PlayerTurretBase.SYNC_STOP_FIRE then
		self._shooting = false
	elseif PlayerTurretBase.STATE_INVALID < state and state <= PlayerTurretBase.STATE_IN_USE then
		self:change_state(state)
	end
end
