require("lib/units/weapons/grenades/FragGrenade")

StickyGrenade = StickyGrenade or class(FragGrenade)
local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
local mvec4 = Vector3()
local mvec5 = Vector3()
local mvec6 = Vector3()
local mvec7 = Vector3()
local mvec8 = Vector3()
local mrot1 = Rotation()

function StickyGrenade:_setup_from_tweak_data(projectile_entry)
	local projectile_entry = self._tweak_projectile_entry or "frag"
	local tweak_entry = tweak_data.projectiles[projectile_entry]
	self._tweak_projectile_entry = projectile_entry
	self._slot_mask = managers.slot:get_mask("explosion_targets")
	self._mass_look_up_modifier = tweak_entry.mass_look_up_modifier
	self._curve_pow = tweak_entry.curve_pow or 3
	self._damage = tweak_entry.damage or 1
	self._player_damage = tweak_entry.player_damage
	self._range = tweak_entry.range
	self._alert_radius = tweak_entry.alert_radius
	self._sphere_cast_radius = tweak_entry.sweep_radius or 25

	if self._unit:id() == -1 or Network:is_server() then
		self._timer = tweak_entry.in_air_timer or 10
	end

	self._effect_name = tweak_entry.effect_name or "effects/payday2/particles/explosions/grenade_explosion"
	self._idstr_decal = tweak_entry.idstr_decal
	self._idstr_effect = tweak_entry.idstr_effect
	local sound_event = tweak_entry.sound_event or "grenade_explode"
	self._custom_params = {
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = self._effect_name,
		idstr_decal = self._idstr_decal,
		idstr_effect = self._idstr_effect,
		sound_event = sound_event,
		feedback_range = self._range * 2
	}

	return tweak_entry
end

function StickyGrenade:_setup_server_data()
end

function StickyGrenade:throw(params)
	self:_tweak_data_play_sound("flyby")

	self._requires_stop_flyby_sound = true

	StickyGrenade.super.throw(self, params)
end

function StickyGrenade:_tweak_data_play_sound(...)
	ArrowBase._tweak_data_play_sound(self, ...)
end

function StickyGrenade:create_sweep_data()
	StickyGrenade.super.create_sweep_data(self)

	self._sweep_data.slot_mask = managers.slot:get_mask("sticky_grenade_sweep")
end

function StickyGrenade:set_owner_peer_id(peer_id)
	self._owner_peer_id = peer_id
	ArrowBase._arrow_units[peer_id] = ArrowBase._arrow_units[peer_id] or {}
	ArrowBase._arrow_units[peer_id][self._unit:key()] = self._unit
end

function StickyGrenade:clbk_impact(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._collided then
		return
	end

	if self._sweep_data then
		mvector3.set(mvec2, position)
		mvector3.subtract(mvec2, self._sweep_data.last_pos)
		mvector3.multiply(mvec2, 2)
		mvector3.add(mvec2, self._sweep_data.last_pos)

		local raycast_params = {
			"ray",
			self._sweep_data.last_pos,
			mvec2,
			"slot_mask",
			self._slot_mask
		}

		if self._ignore_units then
			table.list_append(raycast_params, {
				"ignore_unit",
				self._ignore_units
			})
		end

		local col_ray = World:raycast(unpack(raycast_params))

		if col_ray and col_ray.unit then
			col_ray.velocity = velocity

			mvector3.direction(mvec1, self._sweep_data.last_pos, col_ray.position)
			mvector3.add(mvec1, col_ray.position)
			self._unit:set_position(mvec1)
			self._unit:set_position(mvec1)

			self._collided = true

			self:_on_collision(col_ray)
		end
	elseif alive(other_unit) and other_unit:slot() == 1 then
		self._collided = true

		self:_set_body_enabled(false)
	end
end

function StickyGrenade:_on_collision(col_ray)
	self._col_ray = col_ray

	self:_attach_to_hit_unit(false)
end

function StickyGrenade:_check_stop_flyby_sound(skip_impact)
	if not self._requires_stop_flyby_sound then
		self._requires_stop_flyby_sound = nil

		self:_tweak_data_play_sound("flyby_stop")
	end

	if not skip_impact then
		self:_tweak_data_play_sound("impact")
	end
end

function StickyGrenade:add_trail_effect()
	managers.game_play_central:add_projectile_trail(self._unit, self._unit:orientation_object())
end

function StickyGrenade:_kill_trail()
	managers.game_play_central:remove_projectile_trail(self._unit)
end

function StickyGrenade:_set_body_enabled(enabled)
	self._unit:body("dynamic_body"):set_enabled(enabled)

	if enabled then
		self._unit:body("dynamic_body"):set_dynamic()
	else
		self._unit:body("dynamic_body"):set_keyframed()
	end
end

function StickyGrenade:_attach_to_hit_unit(is_remote)
	self:_check_stop_flyby_sound()
	self:_kill_trail()
	mrotation.set_look_at(mrot1, self._col_ray.velocity, math.UP)
	self._unit:set_rotation(mrot1)
	self._unit:set_enabled(true)
	self:_set_body_enabled(false)

	local hit_unit = self._col_ray.unit
	local parent_obj, child_obj, parent_body = nil
	local global_pos = mvec1
	local local_pos = mvec2
	local collision_to_parent = mvec3
	local segment_dir = mvec4
	local parent_pos = mvec5
	local child_pos = mvec6
	local projected_pos = mvec7
	local dir_from_segment = mvec8
	local rot = mrot1

	mvector3.set(global_pos, self._col_ray.position)

	if alive(hit_unit) then
		local damage_ext = hit_unit:character_damage()

		if damage_ext and damage_ext.get_impact_segment then
			parent_obj, child_obj = damage_ext:get_impact_segment(global_pos)

			if parent_obj then
				if not child_obj then
					hit_unit:link(parent_obj:name(), self._unit, self._unit:orientation_object():name())
				else
					parent_obj:m_position(parent_pos)
					child_obj:m_position(child_pos)
					mvector3.set(collision_to_parent, global_pos)
					mvector3.subtract(collision_to_parent, parent_pos)

					local segment_dist = mvector3.direction(segment_dir, parent_pos, child_pos)
					local projected_dist = mvector3.dot(collision_to_parent, segment_dir)
					projected_dist = math.clamp(projected_dist, 0, segment_dist)

					mvector3.set(projected_pos, segment_dir)
					mvector3.multiply(projected_pos, projected_dist)
					mvector3.add(projected_pos, parent_pos)

					local max_dist_from_segment = 10

					if damage_ext.impact_body_distance then
						local parent_key = parent_obj:name():key()
						local child_key = child_obj:name():key()
						local body_key = alive(self._col_ray.body) and self._col_ray.body:enabled() and self._col_ray.body:name():key()
						local parent_impact_distance = damage_ext.impact_body_distance[parent_key] or 10
						local child_impact_distance = damage_ext.impact_body_distance[child_key] or 10
						local alpha = segment_dist > 0 and projected_dist / segment_dist or 0
						max_dist_from_segment = math.lerp(parent_impact_distance, child_impact_distance, alpha)
						local ray_impact_distance = body_key and damage_ext.impact_body_distance[body_key]

						if ray_impact_distance then
							max_dist_from_segment = max_dist_from_segment + ray_impact_distance
						end
					end

					local dist_from_segment = mvector3.direction(dir_from_segment, projected_pos, global_pos)

					if max_dist_from_segment < dist_from_segment then
						mvector3.set(global_pos, dir_from_segment)
						mvector3.multiply(global_pos, max_dist_from_segment)
						mvector3.add(global_pos, projected_pos)
					end

					parent_obj:m_rotation(rot)
					mrotation.invert(rot)
					mvector3.set(local_pos, global_pos)
					mvector3.subtract(local_pos, parent_pos)
					mvector3.rotate_with(local_pos, rot)
				end
			end
		elseif not alive(self._col_ray.body) or not self._col_ray.body:enabled() then
			hit_unit:m_rotation(rot)
			mrotation.invert(rot)
			hit_unit:m_position(parent_pos)
			mvector3.set(local_pos, global_pos)
			mvector3.subtract(local_pos, parent_pos)
			mvector3.rotate_with(local_pos, rot)
		else
			parent_body = self._col_ray.body
			parent_obj = self._col_ray.body:root_object()

			parent_obj:m_rotation(rot)
			mrotation.invert(rot)
			parent_obj:m_position(parent_pos)
			mvector3.set(local_pos, global_pos)
			mvector3.subtract(local_pos, parent_pos)
			mvector3.rotate_with(local_pos, rot)
		end

		local has_destroy_listener = nil
		local listener_class = hit_unit:base()

		if listener_class and listener_class.add_destroy_listener then
			has_destroy_listener = true
		else
			listener_class = hit_unit:unit_data()

			if listener_class and listener_class.add_destroy_listener then
				has_destroy_listener = true
			end
		end

		if has_destroy_listener then
			self._destroy_listener_id = "StickyGrenade_destroy" .. tostring(self._unit:key())

			listener_class:add_destroy_listener(self._destroy_listener_id, callback(self, self, "clbk_hit_unit_destroyed"))
		end
	end

	self._unit:set_position(global_pos)
	self._unit:set_position(global_pos)

	if parent_obj then
		hit_unit:link(parent_obj:name(), self._unit)
	else
		print("StickyGrenade:attach_to_hit_unit(): No parent object!!")
	end

	if alive(hit_unit) and parent_body then
		self._attached_body_disabled_clbk_data = {
			clbk = callback(self, self, "clbk_attached_body_disabled"),
			unit = hit_unit,
			body = parent_body
		}

		hit_unit:add_body_enabled_callback(self._attached_body_disabled_clbk_data.clbk)
	end

	if not is_remote and managers.network:session() then
		local dir = mvec1

		mvector3.set(dir, self._col_ray.velocity)
		mvector3.normalize(dir)

		local unit = alive(hit_unit) and hit_unit:id() ~= -1 and hit_unit

		managers.network:session():send_to_peers_synched("sync_attach_projectile", self._unit:id() ~= -1 and self._unit or nil, false, unit or nil, unit and parent_body or nil, unit and parent_obj or nil, unit and local_pos or self._unit:position(), dir, tweak_data.blackmarket:get_index_from_projectile_id(self._tweak_projectile_entry), self._owner_peer_id)
	end

	if alive(hit_unit) then
		local dir = self._col_ray.velocity

		mvector3.normalize(dir)

		if parent_body then
			local id = hit_unit:editor_id()

			if id ~= -1 then
				self._sync_attach_data = {
					parent_unit = hit_unit,
					parent_unit_id = id,
					parent_body = parent_body,
					local_pos = local_pos or self._unit:position(),
					dir = dir
				}
			end
		elseif hit_unit:id() ~= -1 then
			self._sync_attach_data = {
				character = true,
				parent_unit = hit_unit,
				parent_obj = parent_obj,
				parent_body = parent_body,
				local_pos = local_pos,
				dir = dir
			}
		end
	end

	if self._unit:id() ~= -1 then
		local tweak_entry = tweak_data.projectiles[self._tweak_projectile_entry]
		self._timer = tweak_entry.detonate_timer or 3
	else
		self._timer = nil
	end
end

function StickyGrenade:sync_attach_to_unit(instant_dynamic_pickup, parent_unit, parent_body, parent_obj, local_pos, dir, drop_in)
	if parent_body then
		parent_obj = parent_body:root_object() or parent_obj
	end

	local world_position = Vector3()

	if drop_in then
		self._unit:m_position(world_position)

		dir = self._unit:rotation():y()
	elseif parent_obj then
		local pos = mvec1
		local rot = mrot1

		parent_obj:m_rotation(rot)
		parent_obj:m_position(pos)
		mvector3.set(world_position, local_pos)
		mvector3.rotate_with(world_position, rot)
		mvector3.add(world_position, pos)
	elseif alive(parent_unit) and parent_body then
		local pos = mvec1
		local rot = mrot1

		parent_unit:m_rotation(rot)
		parent_unit:m_position(pos)
		mvector3.set(world_position, local_pos)
		mvector3.rotate_with(world_position, rot)
		mvector3.add(world_position, pos)
	else
		mvector3.set(world_position, local_pos)
	end

	self._col_ray = {
		position = world_position,
		unit = parent_unit,
		body = parent_body,
		velocity = dir
	}

	if not parent_obj then
		local from_pos = mvec1
		local to_pos = mvec2

		mvector3.set(from_pos, dir)
		mvector3.multiply(from_pos, -10)
		mvector3.add(from_pos, world_position)
		mvector3.set(to_pos, dir)
		mvector3.multiply(to_pos, 10)
		mvector3.add(to_pos, world_position)

		local col_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", self._slot_mask, "ignore_unit", self._unit)

		if col_ray and col_ray.unit then
			self._col_ray = col_ray
			self._col_ray.velocity = dir
		end
	end

	self:_attach_to_hit_unit(true)
end

function StickyGrenade:sync_throw_projectile(dir, projectile_type)
	self:throw({
		dir = dir,
		projectile_entry = projectile_type
	})
	self._unit:damage():add_body_collision_callback(callback(self._unit:base(), self._unit:base(), "clbk_impact"))
end

function StickyGrenade:clbk_attached_body_disabled(unit, body)
	if not self._attached_body_disabled_clbk_data then
		print("Got callback but didn't have data!")

		return
	end

	if self._attached_body_disabled_clbk_data.body ~= body then
		return
	end

	if not body:enabled() then
		self:_detach()
	end
end

function StickyGrenade:clbk_hit_unit_destroyed()
	self:_detach()
end

function StickyGrenade:_detonate(...)
	if self._unit:id() ~= -1 and not Network:is_server() then
		self:_detonate_on_client()

		return
	end

	if self._sync_attach_data and self._sync_attach_data.dir then
		local parent_unit = self._sync_attach_data.parent_unit

		if alive(parent_unit) and parent_unit:in_slot(managers.slot:get_mask("body_area_damage")) then
			self._unit:m_position(mvec1)
			mvector3.set(mvec2, self._sync_attach_data.dir)
			mvector3.negate(mvec2)
			mvector3.multiply(mvec2, 5)
			mvector3.add(mvec2, mvec1)
			self._unit:set_position(mvec2)
			self._unit:set_position(mvec2)
		end
	end

	StickyGrenade.super._detonate(self, ...)
end

function StickyGrenade:_detach()
	if self._attached_body_disabled_clbk_data and alive(self._attached_body_disabled_clbk_data.unit) then
		self._attached_body_disabled_clbk_data.unit:remove_body_enabled_callback(self._attached_body_disabled_clbk_data.clbk)
	end

	self._attached_body_disabled_clbk_data = nil

	managers.enemy:remove_delayed_clbk("delay_sync_attach" .. tostring(self._unit:key()), true)

	if self._destroy_listener_id and alive(self._col_ray.unit) then
		local has_destroy_listener = false
		local listener_class = self._col_ray.unit:base()

		if listener_class and listener_class.remove_destroy_listener then
			has_destroy_listener = true
		else
			listener_class = self._col_ray.unit:unit_data()

			if listener_class and listener_class.remove_destroy_listener then
				has_destroy_listener = true
			end
		end

		if has_destroy_listener then
			listener_class:remove_destroy_listener(self._destroy_listener_id)
		end
	end

	self._destroy_listener_id = nil

	if self._collided and not self._detonated and not self._destroying then
		self._collided = false
		self._col_ray = nil

		self._unit:unlink()
		self:_set_body_enabled(true)
		self:create_sweep_data()
		self:add_trail_effect()
	end
end

function StickyGrenade:update(unit, t, dt)
	StickyGrenade.super.update(self, unit, t, dt)

	if self._drop_in_sync_data then
		self._drop_in_sync_data.f = self._drop_in_sync_data.f - 1

		if self._drop_in_sync_data.f < 0 then
			local parent_unit = self._drop_in_sync_data.parent_unit

			if alive(parent_unit) then
				local state = self._drop_in_sync_data.state
				local parent_body = parent_unit:body(state.sync_attach_data.parent_body_index)
				local parent_obj = parent_body:root_object()

				self:sync_attach_to_unit(false, parent_unit, parent_body, parent_obj, state.sync_attach_data.local_pos, state.sync_attach_data.dir, true)
			end

			self._drop_in_sync_data = nil
		end
	end
end

function StickyGrenade:outside_worlds_bounding_box()
	self:_detonate()
end

function StickyGrenade:save(data)
	StickyGrenade.super.save(self, data)

	local state = {}

	if self._sync_attach_data then
		if self._sync_attach_data.character then
			local peer = managers.network:session():dropin_peer()

			managers.enemy:add_delayed_clbk("delay_sync_attach" .. tostring(self._unit:key()), callback(self, self, "_delay_sync_attach", peer), TimerManager:game():time() + 0.1)
		else
			state.sync_attach_data = {
				parent_unit_id = self._sync_attach_data.parent_unit_id
			}

			if self._sync_attach_data.parent_body then
				state.sync_attach_data.parent_body_index = self._sync_attach_data.parent_unit:get_body_index(self._sync_attach_data.parent_body:name())
			else
				print("no parent body", self._sync_attach_data.parent_unit)
			end

			state.sync_attach_data.local_pos = self._sync_attach_data.local_pos
			state.sync_attach_data.dir = self._sync_attach_data.dir
		end
	end

	state.owner_peer_id = self._owner_peer_id
	data.StickyGrenade = state
end

function StickyGrenade:load(data)
	StickyGrenade.super.load(self, data)

	local state = data.StickyGrenade

	if state.sync_attach_data then
		local function _dropin_attach(parent_unit)
			local parent_body = parent_unit:body(state.sync_attach_data.parent_body_index)
			local parent_obj = parent_body:root_object()
			self._drop_in_sync_data = {
				f = 2,
				parent_unit = parent_unit,
				state = state
			}
		end

		local parent_unit = managers.worlddefinition:get_unit_on_load(state.sync_attach_data.parent_unit_id, _dropin_attach)

		if alive(parent_unit) then
			_dropin_attach(parent_unit)
		end
	end

	self._owner_peer_id = state.owner_peer_id
end

function StickyGrenade:_delay_sync_attach(peer)
	if not managers.network:session() then
		return
	end

	if not peer then
		return
	end

	if not alive(self._sync_attach_data.parent_unit) then
		return
	end

	peer:send_queued_sync("sync_attach_projectile", self._unit:id() ~= -1 and self._unit or nil, false, self._sync_attach_data.parent_unit, nil, self._sync_attach_data.parent_obj, self._sync_attach_data.local_pos, self._sync_attach_data.dir, tweak_data.blackmarket:get_index_from_projectile_id(self._tweak_projectile_entry), self._owner_peer_id)
end

function StickyGrenade:pre_destroy(unit)
	StickyGrenade.super.pre_destroy(self, unit)
	self:_check_stop_flyby_sound(true)
	self:_kill_trail()
	self:_detach()

	if self._owner_peer_id and ArrowBase._arrow_units[self._owner_peer_id] then
		ArrowBase._arrow_units[self._owner_peer_id][self._unit:key()] = nil
	end
end

function StickyGrenade:destroy(unit)
	self:pre_destroy(unit)
	StickyGrenade.super.destroy(self, unit)
end
