CarryData = CarryData or class()
CarryData.disable_dye_packs = true
CarryData.EVENT_IDS = {
	will_explode = 1,
	explode = 2,
	dye_pack_exploded = 3,
	poof = 4,
	expire = 5
}
CarryData._bodies_to_find_AI = {
	Idstring("g_bag"),
	Idstring("g_canvasbag"),
	Idstring("g_g"),
	Idstring("g_goat"),
	Idstring("g_bodybag")
}
CarryData.carry_links = {}

function CarryData._register_remove_on_weapons_hot(unit, carry_id)
	if not Network:is_server() or tweak_data.levels:get_prevent_carry_disposal(carry_id) then
		return
	end

	CarryData._to_dispose = CarryData._to_dispose or {}
	CarryData._to_dispose[unit:key()] = unit

	if managers.groupai:state():enemy_weapons_hot() then
		if not CarryData._disposal_clbk_id then
			CarryData._disposal_clbk_id = "carrydata_disposal_clbk"

			managers.enemy:add_delayed_clbk(CarryData._disposal_clbk_id, callback(CarryData, CarryData, "_clbk_do_disposal"), TimerManager:game():time() + 2)
		end
	elseif not CarryData._weapons_hot_listener_id then
		CarryData._weapons_hot_listener_id = "carrydata_disposal_listener"

		managers.groupai:state():add_listener(CarryData._weapons_hot_listener_id, {
			"enemy_weapons_hot"
		}, callback(CarryData, CarryData, "_clbk_weapons_hot"))
	end
end

function CarryData._unregister_remove_on_weapons_hot(unit)
	if not Network:is_server() or not CarryData._to_dispose or not CarryData._to_dispose[unit:key()] then
		return
	end

	CarryData._to_dispose[unit:key()] = nil

	if next(CarryData._to_dispose) then
		return
	end

	CarryData._to_dispose = nil

	if CarryData._weapons_hot_listener_id then
		managers.groupai:state():remove_listener(CarryData._weapons_hot_listener_id)

		CarryData._weapons_hot_listener_id = nil
	end

	if CarryData._disposal_clbk_id then
		managers.enemy:remove_delayed_clbk(CarryData._disposal_clbk_id)

		CarryData._disposal_clbk_id = nil
	end
end

function CarryData._clbk_weapons_hot()
	managers.groupai:state():remove_listener(CarryData._weapons_hot_listener_id)

	CarryData._weapons_hot_listener_id = nil

	if not CarryData._disposal_clbk_id then
		CarryData._disposal_clbk_id = "carrydata_disposal_clbk"

		managers.enemy:add_delayed_clbk(CarryData._disposal_clbk_id, callback(CarryData, CarryData, "_clbk_do_disposal"), TimerManager:game():time() + 2)
	end
end

function CarryData._clbk_do_disposal()
	local to_keep = {}

	for u_key, unit in pairs(CarryData._to_dispose) do
		if not unit:parent() then
			CarryData._to_dispose[u_key] = nil

			unit:set_slot(0)
		end
	end

	if next(CarryData._to_dispose) then
		managers.enemy:add_delayed_clbk(CarryData._disposal_clbk_id, callback(CarryData, CarryData, "_clbk_do_disposal"), TimerManager:game():time() + 5)

		return
	end

	CarryData._to_dispose = nil
	CarryData._disposal_clbk_id = nil
end

function CarryData:init(unit)
	self._unit = unit
	self._dye_initiated = nil
	self._has_dye_pack = nil
	self._dye_value_multiplier = 100
	self._linked_to = nil

	self:set_carry_id(self._carry_id, true)

	if not Network:is_server() then
		self._link_body = unit:body("hinge_body_1") or unit:body(0)

		unit:set_extension_update_enabled(Idstring("carry_data"), false)

		return
	end

	local enable_update = true

	if unit:interaction() then
		local has_dynamic_body = nil
		local nr_bodies = unit:num_bodies()

		for i = 0, nr_bodies - 1 do
			local body = unit:body(i)

			if body:dynamic() then
				has_dynamic_body = true

				break
			end
		end

		if has_dynamic_body then
			local link_body = unit:body("hinge_body_1") or unit:body(0)

			if link_body then
				self._link_body = link_body
				local get_obj_f = unit.get_object
				local link_obj = nil

				for _, body_ids_name in ipairs(CarryData._bodies_to_find_AI) do
					link_obj = get_obj_f(unit, body_ids_name)

					if link_obj then
						break
					end
				end

				if link_obj then
					self._link_obj = link_obj
					self._oobb_mod = 10
				else
					enable_update = false
				end
			else
				enable_update = false
			end
		else
			enable_update = false
		end

		self._spawn_time = TimerManager:game():time()
	else
		enable_update = false
	end

	unit:set_extension_update_enabled(Idstring("carry_data"), enable_update)
	self:_set_expire_enabled(true)
end

function CarryData:set_mission_element(mission_element)
	self._mission_element = mission_element
end

function CarryData:trigger_load(instigator)
	if not self._mission_element then
		return
	end

	self._mission_element:trigger("load", instigator)
end

function CarryData:enable_update()
	self._unit:set_extension_update_enabled(Idstring("carry_data"), true)
end

function CarryData:update(unit, t, dt)
	local needs_updating = false

	if Network:is_server() then
		needs_updating = self:_update_throw_link(unit, t, dt) or needs_updating
		needs_updating = self:_update_teleport(unit, t, dt) or needs_updating
		needs_updating = self:_update_expire_t(unit, t, dt) or needs_updating
	else
		needs_updating = self:_update_teleport(unit, t, dt) or needs_updating
	end

	if not needs_updating then
		unit:set_extension_update_enabled(Idstring("carry_data"), false)
	end
end

function CarryData:_set_expire_enabled(enabled)
	self._expire_t = enabled and self._expire_time or nil
	self._expire_paused = false

	if self._expire_t then
		self:enable_update()
	end
end

function CarryData:_update_expire_t(unit, t, dt)
	if self._expire_t and not self._expire_paused then
		self._expire_t = self._expire_t - dt

		if self._expire_t <= 0 then
			self._expire_t = nil

			self:_expire()

			return false
		end
	end

	return self._expire_t and true or false
end

function CarryData:set_expire_paused(paused)
	self._expire_paused = paused
end

function CarryData:_update_throw_link(unit, t, dt)
	if self._linked_to or not self._spawn_time or t > self._spawn_time + 1 or not self._link_obj or not self._link_obj:visibility() then
		return false
	end

	local bag_center = self._link_obj:oobb():center()
	local links = CarryData.carry_links
	local oobb_mod = self._oobb_mod

	for u_key, entry in pairs(managers.groupai:state():all_AI_criminals()) do
		if not links[u_key] then
			local mov_ext = entry.unit:movement()

			if not mov_ext.vehicle_unit and not mov_ext:cool() and not mov_ext:downed() then
				local body_oobb = entry.unit:oobb()

				body_oobb:grow(oobb_mod)

				if body_oobb:point_inside(bag_center) then
					body_oobb:shrink(oobb_mod)
					entry.unit:sound():say("r03x_sin", true)
					self:link_to(entry.unit)

					return false
				end

				body_oobb:shrink(oobb_mod)
			end
		end
	end

	return true
end

function CarryData:_update_teleport(unit, t, dt)
	if self._teleport_perform_push then
		self._teleport_perform_push = nil

		if self._teleport_push then
			self._unit:push(unpack(self._teleport_push))

			self._teleport_push = nil
		end
	end

	if self._teleport_reset_dynamic_bodies then
		self._teleport_reset_dynamic_bodies = nil

		if self._teleport_dynamic_bodies then
			for i, body in ipairs(self._teleport_dynamic_bodies) do
				body:set_dynamic()
			end

			self._teleport_dynamic_bodies = nil
		end

		self._teleport_perform_push = true
	end

	if self._teleport_pos then
		self._unit:set_position(self._teleport_pos)

		self._teleport_pos = nil
		self._teleport_reset_dynamic_bodies = true
	end

	return self:is_teleporting()
end

function CarryData:_check_dye_explode()
	if CarryData.disable_dye_packs then
		return
	end

	local chance = math.rand(1)

	if chance < 0.25 then
		self._dye_risk = nil

		self:_dye_exploded()

		return
	end

	self._dye_risk.next_t = TimerManager:game():time() + 2 + math.random(3)
end

function CarryData:_dye_exploded(was_synced)
	if CarryData.disable_dye_packs then
		return
	end

	if not was_synced then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "carry_data", CarryData.EVENT_IDS.dye_pack_exploded)
	end

	self._value = self._value * (1 - self._dye_value_multiplier / 100)
	self._value = math.round(self._value)
	self._has_dye_pack = false
	self._dye_pack_smoke = World:effect_manager():spawn({
		effect = Idstring("effects/payday2/particles/dye_pack/dye_pack_smoke"),
		parent = self._unit:orientation_object()
	})
	self._remove_dye_smoke_clbk_id = "carrydata_remove_dye_smoke" .. tostring(unit:key())

	managers.enemy:add_delayed_clbk(self._remove_dye_smoke_clbk_id, callback(self, self, "_clbk_remove_dye_smoke"), TimerManager:game():time() + 5)
end

function CarryData:_remove_dye_smoke()
	if self._dye_pack_smoke then
		World:effect_manager():fade_kill(self._dye_pack_smoke)

		self._dye_pack_smoke = nil
	end
end

function CarryData:_clbk_remove_dye_smoke()
	self._remove_dye_smoke_clbk_id = nil

	self:_remove_dye_smoke()
end

function CarryData:check_explodes_on_impact(vel_vector, air_time)
	if not self:can_explode() or air_time < 0.5 then
		return
	end

	local vel = mvector3.length(vel_vector)
	local vel_limit = 500

	if vel < vel_limit then
		return
	end

	local chance = math.lerp(0, 0.9, math.min((vel - vel_limit) / (1200 - vel_limit), 1))

	if math.rand(1) <= chance then
		self:start_explosion()

		return true
	end
end

function CarryData:explode_sequence_started()
	return self._explode_t and true or false
end

function CarryData:tag_for_explosion()
	self._tagged_for_explosion = true
end

function CarryData:is_tagged_for_explosion()
	return self._tagged_for_explosion
end

function CarryData:can_explode()
	if not Network:is_server() or not self._can_explode or self._explode_t or self._linked_to or self._disarmed or self._zipline_unit then
		return false
	end

	return true
end

function CarryData:can_poof()
	if not Network:is_server() or not self._can_poof or self._linked_to or self._zipline_unit or self._explode_t then
		return false
	end

	return true
end

function CarryData:start_explosion(instant)
	if not self:can_explode() then
		return
	end

	self:_unregister_steal_SO()
	self:_start_explosion()

	if not instant then
		local unit = self._unit

		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", unit, "carry_data", CarryData.EVENT_IDS.will_explode)

		self._explode_t = TimerManager:game():time() + 1 + math.rand(3)
		self._delayed_explode_clbk_id = "_delayed_carry_explosion" .. tostring(unit:key())

		managers.enemy:add_delayed_clbk(self._delayed_explode_clbk_id, callback(self, self, "_clbk_delayed_explosion"), self._explode_t)
	else
		self._explode_t = TimerManager:game():time()

		self:_explode()
	end
end

function CarryData:_clbk_delayed_explosion()
	self._delayed_explode_clbk_id = nil

	self:_explode()
end

function CarryData:_start_explosion()
	if self._unit:interaction() then
		self._unit:interaction():set_active(false)
	end
end

function CarryData:disarm()
	if self._delayed_explode_clbk_id then
		managers.enemy:remove_delayed_clbk(self._delayed_explode_clbk_id)

		self._delayed_explode_clbk_id = nil
	end

	self._explode_t = nil
	self._disarmed = true
end

CarryData.EXPLOSION_SETTINGS = {
	damage = 40,
	range = 1000,
	curve_pow = 3,
	player_damage = 20,
	effect = "effects/payday2/particles/explosions/bag_explosion"
}
CarryData.EXPLOSION_CUSTOM_PARAMS = {
	camera_shake_mul = 4,
	effect = CarryData.EXPLOSION_SETTINGS.effect
}
local mvec1 = Vector3()
local mvec3_set = mvector3.set
local mvec3_dis = mvector3.distance
local math_lerp = math.lerp
local math_rand = math.rand

function CarryData:_explode()
	managers.mission:call_global_event("loot_exploded")

	local pos = self._unit:position()
	local normal = math.UP
	local range = self.EXPLOSION_SETTINGS.range
	local slot_mask = managers.slot:get_mask("explosion_targets")

	self:_local_player_explosion_damage()
	managers.explosion:play_sound_and_effects(pos, normal, range, self.EXPLOSION_CUSTOM_PARAMS)
	QuickFlashGrenade:make_flash(pos, range, {
		self._unit
	})

	local hit_units, splinters = managers.explosion:detect_and_give_dmg({
		player_damage = 0,
		hit_pos = pos,
		range = range,
		collision_slotmask = slot_mask,
		curve_pow = self.EXPLOSION_SETTINGS.curve_pow,
		damage = self.EXPLOSION_SETTINGS.damage,
		ignore_unit = self._unit
	})

	managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "carry_data", CarryData.EVENT_IDS.explode)

	local to_explode = {}
	local chance, distance, carry_ext = nil
	local raycast_f = Unit.raycast
	local splinter_slotmask = managers.slot:get_mask("world_geometry")

	for _, unit in pairs(hit_units) do
		carry_ext = alive(unit) and unit:carry_data()

		if carry_ext and not carry_ext:is_tagged_for_explosion() and carry_ext:can_explode() then
			unit:m_position(mvec1)

			distance = mvec3_dis(pos, mvec1)
			chance = math_lerp(1, 0, math.max(distance - range / 2, 0) / range)

			if math_rand(1) < chance then
				for i_splinter, s_pos in ipairs(splinters) do
					if not raycast_f(self._unit, "ray", s_pos, mvec1, "slot_mask", splinter_slotmask, "ignore_unit", {
						unit
					}, "report") then
						to_explode[unit:key()] = carry_ext

						carry_ext:tag_for_explosion()

						break
					end
				end
			end
		end
	end

	self:_handle_hiding_and_destruction(true)

	for u_key, carry_ext in pairs(to_explode) do
		carry_ext:start_explosion(true)
	end
end

function CarryData:_local_player_explosion_damage()
	local pos = self._unit:position()

	managers.explosion:give_local_player_dmg(pos, self.EXPLOSION_SETTINGS.range, self.EXPLOSION_SETTINGS.player_damage)
end

CarryData.EXPIRE_SETTINGS = {
	curve_pow = 1,
	range = 100
}
CarryData.EXPIRE_CUSTOM_PARAMS = {
	sound_event = "hlp_poof_small",
	effect = "effects/payday2/particles/explosions/burnpuff",
	camera_shake_mul = 0
}

function CarryData:_expire(was_synced)
	self:_unregister_steal_SO()
	managers.mission:call_global_event("loot_exploded")

	local pos = self._unit:position()
	local normal = math.UP
	local range = self.EXPIRE_SETTINGS.range

	managers.explosion:play_sound_and_effects(pos, normal, range, self.EXPIRE_CUSTOM_PARAMS)

	if not was_synced then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "carry_data", self.EVENT_IDS.expire)
	end

	self:_handle_hiding_and_destruction(true)
end

CarryData.POOF_SETTINGS = {
	curve_pow = 3,
	range = 1000
}
CarryData.POOF_CUSTOM_PARAMS = {
	sound_event = "hlp_poof_small",
	effect = "effects/payday2/environment/nail_green_smoke_explosion",
	camera_shake_mul = 4
}

function CarryData:poof(was_synced)
	if not was_synced and not self:can_poof() then
		return
	end

	self:_unregister_steal_SO()
	managers.mission:call_global_event("loot_exploded")

	local pos = self._unit:position()
	local normal = math.UP
	local range = self.POOF_SETTINGS.range

	managers.explosion:play_sound_and_effects(pos, normal, range, self.POOF_CUSTOM_PARAMS)

	if not was_synced then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "carry_data", CarryData.EVENT_IDS.poof)
	end

	self:_handle_hiding_and_destruction(true)
end

function CarryData:sync_net_event(event_id)
	if event_id == CarryData.EVENT_IDS.explode then
		local range = self.EXPLOSION_SETTINGS.range

		self:_local_player_explosion_damage()
		managers.explosion:explode_on_client(self._unit:position(), math.UP, nil, self.EXPLOSION_SETTINGS.damage, range, self.EXPLOSION_SETTINGS.curve_pow, self.EXPLOSION_CUSTOM_PARAMS)
		QuickFlashGrenade:make_flash(self._unit:position(), range, {
			self._unit
		})
	elseif event_id == CarryData.EVENT_IDS.will_explode then
		self:_start_explosion()
	elseif event_id == CarryData.EVENT_IDS.dye_pack_exploded then
		self:_dye_exploded(true)
	elseif event_id == CarryData.EVENT_IDS.poof then
		self:poof(true)
	elseif event_id == CarryData.EVENT_IDS.expire then
		self:_expire(true)
	end
end

function CarryData:clbk_out_of_world()
	if self._bodies_to_revert then
		for i_body, body in ipairs(self._bodies_to_revert) do
			body:set_dynamic()
		end

		self._bodies_to_revert = nil
		self._register_out_of_world_dynamic_clbk_id = nil

		return
	elseif self._unit:position().z < PlayerMovement.OUT_OF_WORLD_Z then
		self._bodies_to_revert = {}
		local bodies = self._unit:num_bodies()

		for i_body = 0, bodies - 1 do
			local body = self._unit:body(i_body)

			if body:enabled() and body:dynamic() then
				table.insert(self._bodies_to_revert, body)
				body:set_keyframed()
			end
		end

		local tracker = managers.navigation:create_nav_tracker(self._unit:position(), false)

		self._unit:set_position(tracker:field_position())
		managers.navigation:destroy_nav_tracker(tracker)

		self._register_out_of_world_dynamic_clbk_id = "BagOutOfWorldDynamic" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._register_out_of_world_dynamic_clbk_id, callback(self, self, "clbk_out_of_world"), TimerManager:game():time() + 0.2)

		self._register_out_of_world_clbk_id = nil

		return
	end

	managers.enemy:add_delayed_clbk(self._register_out_of_world_clbk_id, callback(self, self, "clbk_out_of_world"), TimerManager:game():time() + 2)
end

function CarryData:carry_id()
	return self._carry_id
end

function CarryData:carry_tweak()
	if not self._carry_id then
		return
	end

	local carry_tweaks = tweak_data.carry
	local carry_tweak = carry_tweaks[self._carry_id]

	return carry_tweak
end

function CarryData:carry_type_tweak()
	if not self._carry_id then
		return
	end

	local carry_tweaks = tweak_data.carry
	local carry_tweak = carry_tweaks[self._carry_id]
	local carry_type_tweak = carry_tweak and carry_tweaks.types[carry_tweak.type]

	return carry_type_tweak
end

function CarryData:set_carry_id(carry_id, is_init)
	local carry_tweaks = tweak_data.carry
	self._carry_id = carry_id

	if carry_id then
		self._value = managers.money:get_bag_value(self._carry_id, self._multiplier)
		local carry_tweak = carry_tweaks[self._carry_id]
		local carry_type_tweak = carry_tweaks.types[carry_tweak.type]

		if Network:is_server() then
			self._AI_carry = carry_tweak.AI_carry

			if carry_tweak.remove_on_weapons_hot then
				CarryData._register_remove_on_weapons_hot(self._unit, carry_id)
			end
		end

		self._can_explode = carry_type_tweak.can_explode and true or false
		self._can_poof = carry_type_tweak.can_poof and true or false
		self._expire_time = carry_tweak.expire_t or nil
	else
		self._value = tweak_data:get_value("money_manager", "bag_values", "default")
		self._AI_carry = false
		self._can_explode = false
		self._can_poof = false
		self._expire_time = nil
	end

	if not is_init then
		self._register_steal_SO_clbk_id = "carrydata_registerSO" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._register_steal_SO_clbk_id, callback(self, self, "clbk_register_steal_SO"), 0)
	end
end

function CarryData:clbk_register_steal_SO()
	self._register_steal_SO_clbk_id = nil

	self:_chk_register_steal_SO()
end

function CarryData:set_dye_initiated(initiated)
	self._dye_initiated = initiated
end

function CarryData:dye_initiated()
	return self._dye_initiated
end

function CarryData:has_dye_pack()
	return self._has_dye_pack
end

function CarryData:dye_value_multiplier()
	return self._dye_value_multiplier
end

function CarryData:set_dye_pack_data(dye_initiated, has_dye_pack, dye_value_multiplier)
	self._dye_initiated = dye_initiated
	self._has_dye_pack = has_dye_pack
	self._dye_value_multiplier = dye_value_multiplier

	if not Network:is_server() then
		return
	end

	if self._has_dye_pack then
		self._dye_risk = {
			next_t = TimerManager:game():time() + 2 + math.random(3)
		}
	end
end

function CarryData:dye_pack_data()
	return self._dye_initiated, self._has_dye_pack, self._dye_value_multiplier
end

function CarryData:_disable_dye_pack()
	self._dye_risk = nil
end

function CarryData:value()
	return self._value
end

function CarryData:set_value(value)
	self._value = value
end

function CarryData:multiplier()
	return self._multiplier
end

function CarryData:set_multiplier(multiplier)
	self._multiplier = multiplier
end

function CarryData:sequence_clbk_secured()
	self:_disable_dye_pack()
end

function CarryData:_unregister_steal_SO()
	if not self._steal_SO_data then
		return
	end

	if self._steal_SO_data.SO_registered then
		managers.groupai:state():remove_special_objective(self._steal_SO_data.SO_id)
		managers.groupai:state():unregister_loot(self._unit:key())
	elseif self._steal_SO_data.thief then
		local thief = self._steal_SO_data.thief
		self._steal_SO_data.thief = nil

		if self._steal_SO_data.picked_up then
			self:unlink()
		end

		if alive(thief) then
			thief:brain():set_objective(nil)
		end
	end

	self._steal_SO_data = nil
end

function CarryData:_chk_register_steal_SO()
	if not self._link_body then
		return
	end

	if not self._has_body_activation_clbk then
		local clbk = callback(self, self, "clbk_body_active_state")
		self._has_body_activation_clbk = {
			[self._link_body:key()] = clbk
		}

		self._unit:add_body_activation_callback(clbk)
		self._link_body:set_activate_tag(Idstring("bag_moving"))
		self._link_body:set_deactivate_tag(Idstring("bag_still"))
	end

	if not Network:is_server() or self._steal_SO_data or self._linked_to or self._zipline_unit or self._link_body:active() or not managers.navigation:is_data_ready() then
		return
	end

	if not self._AI_carry then
		return
	end

	local tracker_pickup = managers.navigation:create_nav_tracker(self._unit:position(), false)
	local pickup_nav_seg = tracker_pickup:nav_segment()
	local pickup_pos = tracker_pickup:field_position()
	local pickup_area = managers.groupai:state():get_area_from_nav_seg_id(pickup_nav_seg)

	managers.navigation:destroy_nav_tracker(tracker_pickup)

	if pickup_area.enemy_loot_drop_points then
		return
	end

	local drop_pos, drop_nav_seg, drop_area = nil
	local drop_point = managers.groupai:state():get_safe_enemy_loot_drop_point(pickup_nav_seg)

	if drop_point then
		drop_pos = mvector3.copy(drop_point.pos)
		drop_nav_seg = drop_point.nav_seg
		drop_area = drop_point.area
	elseif not self._register_steal_SO_clbk_id then
		self._register_steal_SO_clbk_id = "carrydata_registerSO" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._register_steal_SO_clbk_id, callback(self, self, "clbk_register_steal_SO"), TimerManager:game():time() + 10)

		return
	end

	local drop_objective = {
		type = "act",
		interrupt_health = 0.5,
		path_ahead = true,
		action_duration = 1,
		haste = "run",
		pose = "crouch",
		interrupt_dis = 200,
		nav_seg = drop_nav_seg,
		pos = drop_pos,
		area = drop_area,
		fail_clbk = callback(self, self, "on_secure_SO_failed"),
		complete_clbk = callback(self, self, "on_secure_SO_completed"),
		action = {
			align_sync = true,
			type = "act",
			body_part = 1,
			variant = "untie",
			blocks = {
				action = -1,
				walk = -1
			}
		}
	}
	local pickup_objective = {
		destroy_clbk_key = false,
		type = "act",
		action_duration = 1,
		haste = "run",
		interrupt_health = 0.5,
		pose = "crouch",
		interrupt_dis = 200,
		nav_seg = pickup_nav_seg,
		area = pickup_area,
		pos = pickup_pos,
		fail_clbk = callback(self, self, "on_pickup_SO_failed"),
		complete_clbk = callback(self, self, "on_pickup_SO_completed"),
		action = {
			align_sync = true,
			type = "act",
			body_part = 1,
			variant = "untie",
			blocks = {
				action = -1,
				walk = -1
			}
		},
		followup_objective = drop_objective
	}
	local so_descriptor = {
		interval = 0,
		base_chance = 1,
		chance_inc = 0,
		usage_amount = 1,
		objective = pickup_objective,
		search_pos = pickup_objective.pos,
		verification_clbk = callback(self, self, "clbk_pickup_SO_verification"),
		AI_group = self._AI_carry.SO_category,
		admin_clbk = callback(self, self, "on_pickup_SO_administered")
	}
	local so_id = "carrysteal" .. tostring(self._unit:key())
	self._steal_SO_data = {
		SO_registered = true,
		picked_up = false,
		SO_id = so_id,
		pickup_area = pickup_area,
		pickup_objective = pickup_objective,
		secure_pos = drop_pos,
		pickup_pos = pickup_pos
	}

	managers.groupai:state():add_special_objective(so_id, so_descriptor)
	managers.groupai:state():register_loot(self._unit, pickup_area)
end

function CarryData:clbk_pickup_SO_verification(candidate_unit)
	if not self._steal_SO_data or not self._steal_SO_data.SO_id then
		debug_pause_unit(self._unit, "[CarryData:clbk_pickup_SO_verification] SO is not registered", self._unit, candidate_unit, inspect(self._steal_SO_data))

		return
	end

	local mov_ext = candidate_unit:movement()

	if mov_ext:cool() then
		return
	end

	if not candidate_unit:base():char_tweak().steal_loot then
		return
	end

	local nav_seg = mov_ext:nav_tracker():nav_segment()

	if not self._steal_SO_data.pickup_area.nav_segs[nav_seg] then
		if math.abs(self._steal_SO_data.pickup_pos.z - mov_ext:m_pos().z) >= 250 then
			return
		end

		local close_by = nil

		for _, neighbour_area in pairs(self._steal_SO_data.pickup_area.neighbours) do
			if neighbour_area.nav_segs[nav_seg] then
				close_by = true

				break
			end
		end

		if not close_by then
			return
		end
	end

	return true
end

function CarryData:on_pickup_SO_administered(thief)
	if self._steal_SO_data.thief then
		debug_pause("[CarryData:on_pickup_SO_administered] Already had a thief!!!!", thief, self._steal_SO_data.thief)
	end

	self._steal_SO_data.thief = thief
	self._steal_SO_data.SO_registered = false

	managers.groupai:state():unregister_loot(self._unit:key())
end

function CarryData:on_pickup_SO_completed(thief)
	if thief ~= self._steal_SO_data.thief then
		debug_pause_unit(thief, "[CarryData:on_pickup_SO_completed] idiot thinks he is stealing", thief)

		return
	end

	self._steal_SO_data.picked_up = true

	self:link_to(thief)
end

function CarryData:on_pickup_SO_failed(thief)
	if not self._steal_SO_data.thief then
		return
	end

	if thief ~= self._steal_SO_data.thief then
		debug_pause_unit(thief, "[CarryData:on_pickup_SO_failed] idiot thinks he is stealing", thief)

		return
	end

	self._steal_SO_data = nil

	self:_chk_register_steal_SO()
end

function CarryData:on_secure_SO_completed(thief)
	if thief ~= self._steal_SO_data.thief then
		debug_pause_unit(thief, "[CarryData:on_secure_SO_completed] idiot thinks he is stealing", thief)

		return
	end

	local secure_pos = self._steal_SO_data.secure_pos
	self._steal_SO_data = nil

	managers.mission:call_global_event("loot_lost")
	self:unlink()
	managers.network:session():send_to_peers("sync_carry_set_position_and_throw", self._unit, secure_pos:with_z(self._unit:position().z), Vector3(0, 0, 0), 0)
end

function CarryData:on_secure_SO_failed(thief)
	if not self._steal_SO_data.thief then
		return
	end

	if thief ~= self._steal_SO_data.thief then
		debug_pause_unit(thief, "[CarryData:on_pickup_SO_failed] idiot thinks he is stealing", thief)

		return
	end

	self._steal_SO_data = nil

	self:unlink()
end

function CarryData:_remove_collisions()
	self._disabled_collisions = self._disabled_collisions or {}
	self._disabled_rays = self._disabled_rays or {
		block = {},
		pass = {}
	}
	local body, ray_mode = nil
	local body_f = Unit.body
	local t_ins = table.insert
	local ids_ray_pass = Idstring("pass")
	local ids_ray_block = Idstring("block")
	local ids_ray_ignore = Idstring("ignore")

	for i_body = 0, self._unit:num_bodies() - 1 do
		body = body_f(self._unit, i_body)

		if body then
			if body:collisions_enabled() then
				body:set_collisions_enabled(false)
				t_ins(self._disabled_collisions, body)
			end

			ray_mode = body:ray_mode()

			if ray_mode == ids_ray_block then
				body:set_ray_mode(ids_ray_ignore)
				t_ins(self._disabled_rays.block, body)
			elseif ray_mode == ids_ray_pass then
				body:set_ray_mode(ids_ray_ignore)
				t_ins(self._disabled_rays.pass, body)
			end
		end
	end
end

function CarryData:_restore_collisions()
	local disabled_collisions = self._disabled_collisions

	if self._disabled_collisions then
		for _, body in ipairs(self._disabled_collisions) do
			body:set_collisions_enabled(true)
		end

		self._disabled_collisions = nil
	end

	if self._disabled_rays then
		local ids_ray_pass = Idstring("pass")
		local ids_ray_block = Idstring("block")
		local ids_ray_ignore = Idstring("ignore")

		for _, body in ipairs(self._disabled_rays.block) do
			if body:ray_mode() == ids_ray_ignore then
				body:set_ray_mode(ids_ray_block)
			end
		end

		for _, body in ipairs(self._disabled_rays.pass) do
			if body:ray_mode() == ids_ray_ignore then
				body:set_ray_mode(ids_ray_pass)
			end
		end

		self._disabled_rays = nil
	end
end

function CarryData:link_to(parent_unit)
	if not self._link_body then
		Application:error("[CarryData:link_to] No available link body carry unit. ", self._unit)

		return
	end

	if CarryData.carry_links[parent_unit:key()] then
		debug_pause_unit(parent_unit, "[CarryData:link_to] Parent unit was already carrying something?. ", parent_unit)
	end

	CarryData.carry_links[parent_unit:key()] = true

	if self._linked_to then
		local linked_mov_ext = self._linked_to:movement()

		if linked_mov_ext and linked_mov_ext.set_carrying_bag then
			linked_mov_ext:set_carrying_bag(nil)
		end

		self._unit:unlink()
	end

	self._link_body:set_keyframed()

	local int_ext = self._unit:interaction()

	if int_ext then
		int_ext._has_modified_timer = true
		int_ext._air_start_time = TimerManager:game():time()
	end

	local body_active_clbk = self._has_body_activation_clbk
	body_active_clbk = body_active_clbk and body_active_clbk[self._link_body:key()]

	if self._has_body_activation_clbk and self._has_body_activation_clbk[self._link_body:key()] then
		self._unit:remove_body_activation_callback(self._has_body_activation_clbk[self._link_body:key()])
		self._link_body:set_activate_tag(Idstring(""))
		self._link_body:set_deactivate_tag(Idstring(""))

		self._has_body_activation_clbk = nil
	end

	if self._steal_SO_data and (not self._steal_SO_data.picked_up or parent_unit ~= self._steal_SO_data.thief) then
		self:_unregister_steal_SO()
	end

	if self._register_out_of_world_clbk_id then
		managers.enemy:remove_delayed_clbk(self._register_out_of_world_clbk_id)

		self._register_out_of_world_clbk_id = nil
	end

	if self._register_steal_SO_clbk_id then
		managers.enemy:remove_delayed_clbk(self._register_steal_SO_clbk_id)

		self._register_steal_SO_clbk_id = nil
	end

	call_on_next_update(function ()
		if not alive(self._unit) or not alive(parent_unit) then
			return
		end

		local parent_obj_name = Idstring("Neck")
		local parent_obj = parent_unit:get_object(parent_obj_name)

		if not parent_obj then
			parent_obj = parent_unit:orientation_object()
			parent_obj_name = parent_obj:name()
		end

		parent_unit:link(parent_obj_name, self._unit)

		local parent_obj_rot = parent_obj:rotation()
		local world_pos = parent_obj:position() - parent_obj_rot:z() * 30 - parent_obj_rot:y() * 10

		self._unit:set_position(world_pos)
		self._unit:set_velocity(Vector3(0, 0, 0))

		local world_rot = Rotation(parent_obj_rot:x(), -parent_obj_rot:z())

		self._unit:set_rotation(world_rot)
	end)
	self:_remove_collisions()

	self._linked_to = parent_unit
	local linked_mov_ext = parent_unit:movement()

	if linked_mov_ext and linked_mov_ext.set_carrying_bag then
		linked_mov_ext:set_carrying_bag(self._unit)
	end

	self:_set_expire_enabled(false)

	if Network:is_server() then
		managers.network:session():send_to_peers_synched("loot_link", self._unit, parent_unit)
	end
end

function CarryData:unlink()
	if not self._link_body or not self._linked_to then
		return
	end

	local linked_to = self._linked_to
	self._linked_to = nil
	CarryData.carry_links[linked_to:key()] = nil
	local linked_mov_ext = linked_to:movement()

	if linked_mov_ext and linked_mov_ext.set_carrying_bag then
		linked_mov_ext:set_carrying_bag(nil)
	end

	self._unit:unlink()
	self._link_body:set_dynamic()
	self:_restore_collisions()

	local int_ext = self._unit:interaction()

	if int_ext then
		int_ext:register_collision_callbacks()
	end

	self:_set_expire_enabled(true)

	if Network:is_server() then
		managers.network:session():send_to_peers_synched("loot_link", self._unit, self._unit)
	end

	if not self._register_steal_SO_clbk_id then
		self._register_steal_SO_clbk_id = "carrydata_registerSO" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._register_steal_SO_clbk_id, callback(self, self, "clbk_register_steal_SO"), 0)
	end
end

function CarryData:clbk_body_active_state(tag, unit, body, activated)
	if not self._has_body_activation_clbk[body:key()] then
		return
	end

	if activated then
		if self._steal_SO_data and not self._steal_SO_data.picked_up then
			self:_unregister_steal_SO()
		end

		if self._register_steal_SO_clbk_id then
			managers.enemy:remove_delayed_clbk(self._register_steal_SO_clbk_id)

			self._register_steal_SO_clbk_id = nil
		end

		if not self._register_out_of_world_clbk_id then
			self._register_out_of_world_clbk_id = "BagOutOfWorld" .. tostring(self._unit:key())

			managers.enemy:add_delayed_clbk(self._register_out_of_world_clbk_id, callback(self, self, "clbk_out_of_world"), TimerManager:game():time() + 2)
		end
	else
		self:_chk_register_steal_SO()

		if self._register_out_of_world_clbk_id then
			managers.enemy:remove_delayed_clbk(self._register_out_of_world_clbk_id)

			self._register_out_of_world_clbk_id = nil
		end
	end
end

function CarryData:set_zipline_unit(zipline_unit)
	self._zipline_unit = zipline_unit

	self:_set_expire_enabled(not self._zipline_unit)

	if self._zipline_unit and self._zipline_unit:zipline():ai_ignores_bag() then
		if self._unit:attention() then
			self._saved_attention_data = deep_clone(self._unit:attention():attention_data())

			for attention_id, _ in pairs(self._saved_attention_data) do
				self._unit:attention():remove_attention(attention_id)
			end
		end
	elseif not self._zipline_unit then
		if self._saved_attention_data then
			for attention_id, attention_data in pairs(self._saved_attention_data) do
				self._unit:attention():add_attention(attention_data)
			end

			self._saved_attention_data = nil
		end

		local int_ext = self._unit:interaction()

		if int_ext then
			int_ext._has_modified_timer = true
			int_ext._air_start_time = TimerManager:game():time()
		end
	end
end

function CarryData:is_attached_to_zipline_unit()
	return self._zipline_unit and true
end

function CarryData:_on_load_attach_to_zipline(zipline_unit)
	if alive(zipline_unit) then
		zipline_unit:zipline():attach_bag(self._unit)
	end
end

function CarryData:save(data)
	local state = {
		carry_id = self._carry_id,
		value = self._value,
		dye_initiated = self._dye_initiated,
		has_dye_pack = self._has_dye_pack,
		dye_value_multiplier = self._dye_value_multiplier
	}
	data.zip_line_unit_id = self._zipline_unit and self._zipline_unit:editor_id()
	data.CarryData = state
end

function CarryData:load(data)
	local state = data.CarryData
	self._carry_id = state.carry_id
	self._value = state.value
	self._dye_initiated = state.dye_initiated
	self._has_dye_pack = state.has_dye_pack
	self._dye_value_multiplier = state.dye_value_multiplier

	if data.zip_line_unit_id then
		self:_on_load_attach_to_zipline(managers.worlddefinition:get_unit_on_load(data.zip_line_unit_id, callback(self, self, "_on_load_attach_to_zipline")))
	end
end

function CarryData:_handle_hiding_and_destruction(destroy)
	if self._unit:interaction() then
		self._unit:interaction():set_active(false)
	end

	self._unit:set_visible(false)
	self._unit:set_enabled(false)

	if destroy and (Network:is_server() or self._unit:id() == -1) then
		self._unit:set_slot(0)
	end
end

function CarryData:destroy()
	if self._dye_pack_smoke then
		World:effect_manager():fade_kill(self._dye_pack_smoke)

		self._dye_pack_smoke = nil
	end

	if self._remove_dye_smoke_clbk_id then
		managers.enemy:remove_delayed_clbk(self._remove_dye_smoke_clbk_id)

		self._remove_dye_smoke_clbk_id = nil
	end

	if self._delayed_explode_clbk_id then
		managers.enemy:remove_delayed_clbk(self._delayed_explode_clbk_id)

		self._delayed_explode_clbk_id = nil
	end

	if self._register_out_of_world_clbk_id then
		managers.enemy:remove_delayed_clbk(self._register_out_of_world_clbk_id)

		self._register_out_of_world_clbk_id = nil
	end

	if self._register_out_of_world_dynamic_clbk_id then
		managers.enemy:remove_delayed_clbk(self._register_out_of_world_dynamic_clbk_id)

		self._register_out_of_world_dynamic_clbk_id = nil
	end

	self:_unregister_steal_SO()

	if self._register_steal_SO_clbk_id then
		managers.enemy:remove_delayed_clbk(self._register_steal_SO_clbk_id)

		self._register_steal_SO_clbk_id = nil
	end

	if alive(self._linked_to) then
		local linked_mov_ext = self._linked_to:movement()

		if linked_mov_ext and linked_mov_ext.set_carrying_bag then
			linked_mov_ext:set_carrying_bag(nil)
		end

		self._unit:unlink()

		CarryData.carry_links[self._linked_to:key()] = nil
	end

	self._linked_to = nil

	CarryData._unregister_remove_on_weapons_hot(self._unit)
end

function CarryData:set_latest_peer_id(peer_id)
	self._latest_peer_id = peer_id

	if not peer_id or not Network:is_server() then
		return
	end

	local local_peer = managers.network:session():local_peer()

	if peer_id == local_peer:id() then
		if local_peer:is_vr() then
			self._oobb_mod = 25
		end
	else
		local peer = managers.network:session():peer(peer_id)
		self._oobb_mod = peer and peer:is_vr() and 50 or 25
	end
end

function CarryData:latest_peer_id()
	return self._latest_peer_id
end

function CarryData:is_linked_to_unit()
	return self._linked_to or false
end

function CarryData:is_teleporting()
	return (self._teleport_pos or self._teleport_reset_dynamic_bodies or self._teleport_perform_push) and true or false
end

function CarryData:teleport_to(pos)
	self._teleport_pos = pos
	self._teleport_dynamic_bodies = {}

	for i = 0, self._unit:num_bodies() - 1 do
		local body = self._unit:body(i)

		if body:dynamic() then
			body:set_keyframed()
			table.insert(self._teleport_dynamic_bodies, body)
		end
	end
end

function CarryData:teleport_push(force, direction)
	self._teleport_push = {
		force,
		direction
	}
end

function CarryData:set_position_and_throw(position, direction, force)
	if self._linked_to then
		return
	end

	self:teleport_to(position)

	if force > 0 then
		self:teleport_push(force, direction)
	end

	self:enable_update()

	if Network:is_server() then
		managers.network:session():send_to_peers("sync_carry_set_position_and_throw", self._unit, position, direction, force)
	end
end
