local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
local empty_vec = Vector3()
local empty_rot = Rotation()
local IDS_SPAWN_MANAGER = Idstring("spawn_manager")

ManageSpawnedUnits = ManageSpawnedUnits or class()

function ManageSpawnedUnits:init(unit)
	self._unit = unit
	self._is_server = Network:is_server()
	self._spawned_units = {}
	self._sync_spawn_and_link = {}
	self._visibility_state = true
	self._destroy_listener_key = "ManageSpawnedUnits" .. tostring(unit:key())

	unit:set_extension_update_enabled(IDS_SPAWN_MANAGER, false)
end

function ManageSpawnedUnits:spawned_units()
	return self._spawned_units
end

function ManageSpawnedUnits:linked_units()
	return self._sync_spawn_and_link
end

function ManageSpawnedUnits:get_unit(unit_id)
	local entry = self._spawned_units[unit_id]

	if not entry or not alive(entry.unit) then
		return nil
	end

	return entry.unit
end

function ManageSpawnedUnits:set_visibility_state(state)
	state = state and true or false
	self._visibility_state = state

	for unit_id, unit_entry in pairs(self._spawned_units) do
		if alive(unit_entry.unit) then
			unit_entry.unit:set_visible(state)
		end
	end
end

function ManageSpawnedUnits:destroy(unit)
	for unit_id, unit_entry in pairs(self._spawned_units) do
		if alive(unit_entry.unit) then
			unit_entry.unit:unlink()
			unit_entry.unit:set_visible(false)
			unit_entry.unit:set_enabled(false)

			local unit_data_ext = unit_entry.unit:unit_data()

			unit_data_ext.parent_unit = nil

			unit_data_ext:remove_destroy_listener(self._destroy_listener_key)

			if self._is_server or unit_entry.unit:id() == -1 then
				unit_entry.unit:set_slot(0)
			end
		end
	end

	self._spawned_units = {}
	self._sync_spawn_and_link = {}
end

function ManageSpawnedUnits:_clbk_spawned_unit_destroyed(destroyed_unit_id)
	local unit_entry = self._spawned_units[destroyed_unit_id]

	if not unit_entry then
		return
	end

	self._spawned_units[destroyed_unit_id] = nil

	if self._sync_spawn_and_link[destroyed_unit_id] then
		self._sync_spawn_and_link[destroyed_unit_id] = nil
	end
end

function ManageSpawnedUnits:on_post_detached_from_network()
	for unit_id, unit_entry in pairs(self._spawned_units) do
		if alive(unit_entry.unit) and unit_entry.unit:id() ~= -1 then
			detach_unit_from_network(unit_entry.unit)
		end
	end
end

function ManageSpawnedUnits:_clbk_drop_in_sync(clbk_data)
	if not alive(self._unit) or self._unit:id() == -1 then
		return
	end

	local peer = managers.network:get_peer_safe(clbk_data.peer_id)

	if not peer then
		return
	end

	for unit_id in pairs(clbk_data.networked_units) do
		local unit_entry = self._spawned_units[unit_id]

		if unit_entry and alive(unit_entry.unit) and unit_entry.unit:id() ~= -1 then
			managers.network:send_to_peer_synched(peer, "sync_unit_spawn", self._unit, unit_entry.unit, unit_entry.align_obj_name, unit_id, "spawn_manager")

			local link_entry = self._sync_spawn_and_link[unit_id]

			if link_entry then
				managers.network:send_to_peer_synched(peer, "sync_link_spawned_unit", self._unit, unit_id, link_entry.joint_table, "spawn_manager")
			end
		end
	end
end

function ManageSpawnedUnits:save(data)
	if self._unit:id() == -1 then
		return
	end

	local local_units, networked_units = {}, {}

	for unit_id, unit_entry in pairs(self._spawned_units) do
		if alive(unit_entry.unit) then
			local spawn_link_entry = self._sync_spawn_and_link[unit_id]
			local joint_table = spawn_link_entry and spawn_link_entry.joint_table or nil

			if unit_entry.unit:id() ~= -1 then
				if not self.local_only then
					networked_units[unit_id] = true
				end
			elseif unit_entry.unit_name then
				local_units[unit_id] = {
					unit_name = unit_entry.unit_name
				}

				if joint_table then
					local_units[unit_id].joint_table = joint_table
				else
					local_units[unit_id].align_obj_name = unit_entry.align_obj_name
				end
			end
		end
	end

	if next(local_units) then
		data.ManageSpawnedUnits = {}
		data.ManageSpawnedUnits.local_units = local_units
	end

	if next(networked_units) then
		local peer = managers.network:get_dropin_peer_safe()

		if peer then
			local clbk_data = {
				peer_id = peer:id(),
				networked_units = networked_units
			}
			local clbk_id = "ManageSpawnedUnitsDropIn" .. tostring(clbk_data.peer_id) .. tostring(self._unit:key())

			managers.enemy:add_delayed_clbk(clbk_id, callback(self, self, "_clbk_drop_in_sync", clbk_data), TimerManager:game():time() + 0.1)
		end
	end
end

function ManageSpawnedUnits:load(data)
	if self._link_after_load then
		self._loaded = true

		for _, params in ipairs(self._link_after_load) do
			self:spawn_and_link_unit(unpack(params))
		end

		self._link_after_load = nil
		self._loaded = nil
	end

	local save_data = data.ManageSpawnedUnits or data.managed_spawned_units

	if not save_data then
		return
	end

	if type(save_data) ~= "table" or type(save_data.local_units) ~= "table" then
		return
	end

	self._loaded = true

	for unit_id, synced_entry in pairs(save_data.local_units) do
		if type(synced_entry) == "table" and type(synced_entry.unit_name) == "string" then
			local name_ids = Idstring(synced_entry.unit_name)

			if not DB:has(IDS_UNIT, name_ids) then
				Application:error("[ManageSpawnedUnits] load() - attempted to spawn local unit \"" .. tostring(synced_entry.unit_name) .. "\" which doesn't exist.")
			elseif not PackageManager:has(IDS_UNIT, name_ids) then
				Application:error("[ManageSpawnedUnits] load() - attempted to spawn local unit \"" .. tostring(synced_entry.unit_name) .. "\" that isn't loaded.", self._unit)
			elseif synced_entry.joint_table then
				self:spawn_and_link_unit(synced_entry.joint_table, unit_id, synced_entry.unit_name)
			else
				self:spawn_unit(unit_id, synced_entry.align_obj_name, synced_entry.unit_name)
			end
		end
	end

	self._loaded = nil
end

function ManageSpawnedUnits:link_spawned_unit(unit_id, joint_table)
	if not unit_id then
		Application:error("[ManageSpawnedUnits] link_spawned_unit() - param1 (unit_id) is nil", self._unit)
	end

	if type(joint_table) ~= "string" then
		Application:error("[ManageSpawnedUnits] link_spawned_unit() - param2 (joint_table) isn't a string", self._unit, joint_table)

		joint_table = nil
	elseif type(self[joint_table]) ~= "table" then
		Application:error("[ManageSpawnedUnits] link_spawned_unit() - param2 (joint_table) \"" .. tostring(joint_table) .. "\" doesn't point to a table in \"spawn_manager\" extension", self._unit)

		joint_table = nil
	end

	if not unit_id or not joint_table then
		return
	end

	local unit_entry = self._spawned_units[unit_id]

	if not unit_entry or not alive(unit_entry.unit) then
		return
	end

	self:_link_joints(unit_id, joint_table)
end

function ManageSpawnedUnits:_link_joints(unit_id, joint_table)
	local parent_unit = self._unit
	local ids, parent_object, child_object, linked_any
	local child_unit = self._spawned_units[unit_id].unit

	for i, object_name in ipairs(self[joint_table]) do
		if i > 1 and type(object_name) == "string" then
			ids = Idstring(object_name)
			parent_object = parent_unit:get_object(ids)
			child_object = child_unit:get_object(ids)

			if not parent_object then
				Application:error("[ManageSpawnedUnits] _link_joints() - no \"" .. tostring(object_name) .. "\" object found on unit", parent_unit)
			end

			if not child_object then
				Application:error("[ManageSpawnedUnits] _link_joints() - no \"" .. tostring(object_name) .. "\" object found on unit", child_unit)
			end

			if parent_object and child_object then
				linked_any = true

				child_object:set_local_position(empty_vec)
				child_object:set_local_rotation(empty_rot)
				child_object:link(parent_object)
			end
		end
	end

	if linked_any then
		parent_unit:set_moving()
	end
end

function ManageSpawnedUnits:_spawn_run_sequence(unit_id, sequence_name)
	if not unit_id then
		Application:error("[ManageSpawnedUnits] _spawn_run_sequence() - param1 (unit_id) is nil", self._unit)
	end

	if type(sequence_name) ~= "string" then
		Application:error("[ManageSpawnedUnits] _spawn_run_sequence() - param2 (sequence_name) isn't a string", self._unit, sequence_name)

		sequence_name = nil
	end

	if not unit_id or not sequence_name then
		return
	end

	local unit

	if unit_id == "self" then
		unit = self._unit
	else
		local entry = self._spawned_units[unit_id]

		if not entry or not alive(entry.unit) then
			return
		end

		unit = entry.unit
	end

	local dmg_ext = unit:damage()

	if not dmg_ext then
		Application:error("[ManageSpawnedUnits] _spawn_run_sequence() - no \"damage\" extension on unit:", unit)
	elseif dmg_ext:has_sequence(sequence_name) then
		dmg_ext:run_sequence_simple(sequence_name)
	else
		Application:error("[ManageSpawnedUnits] _spawn_run_sequence() - sequence with name \"" .. tostring(sequence_name) .. "\" does not exist in unit", unit)
	end
end

function ManageSpawnedUnits:spawn_unit(unit_id, align_obj_name, unit, no_local_unit_dropin)
	if not unit_id then
		Application:error("[ManageSpawnedUnits] spawn_unit() - param1 (unit_id) is nil", self._unit, unit_id)
	end

	if type(align_obj_name) ~= "string" then
		Application:error("[ManageSpawnedUnits] spawn_unit() - param2 (align_obj_name) isn't a string", self._unit, align_obj_name)

		align_obj_name = nil
	end

	local unit_param_type = type_name(unit)

	if unit_param_type ~= "string" and unit_param_type ~= "Unit" then
		Application:error("[ManageSpawnedUnits] spawn_unit() - param3 (unit) is neither a string or a Unit", self._unit, unit)

		unit = nil
	end

	if not unit_id or not align_obj_name or not unit then
		return
	end

	if self._spawned_units[unit_id] then
		return
	end

	local obj_name_ids = Idstring(align_obj_name)
	local align_obj = self._unit:get_object(obj_name_ids)

	if not align_obj then
		Application:error("[ManageSpawnedUnits] spawn_unit() - no \"" .. tostring(align_obj_name) .. "\" object found on unit", self._unit)

		return
	end

	local spawn_unit, unit_name

	if unit_param_type == "string" then
		unit_name = unit

		if self._is_server or self.allow_client_spawn then
			local spawn_pos = align_obj:position()
			local spawn_rot = align_obj:rotation()

			spawn_unit = safe_spawn_unit(Idstring(unit), spawn_pos, spawn_rot)
		end
	elseif unit_param_type == "Unit" then
		spawn_unit = unit
	end

	if not spawn_unit then
		return
	end

	local unit_data_ext = spawn_unit:unit_data()

	unit_data_ext.parent_unit = self._unit

	unit_data_ext:add_destroy_listener(self._destroy_listener_key, callback(self, self, "_clbk_spawned_unit_destroyed", unit_id))
	self._unit:link(obj_name_ids, spawn_unit, spawn_unit:orientation_object():name())

	local contour_ext = self._unit:contour()
	local spawned_contour_ext = spawn_unit:contour()

	if contour_ext and spawned_contour_ext then
		if spawned_contour_ext.init_contour then
			Application:error("[ManageSpawnedUnits] spawn_unit() - spawned child unit shouldn't have a init contour defined in unit file", spawn_unit)
		end

		spawned_contour_ext:set_is_child(true)

		for _, contour in ipairs(contour_ext:contour_list()) do
			spawned_contour_ext:add(contour.type, false, nil, contour.color)
		end
	end

	spawn_unit:set_visible(self._visibility_state)

	local unit_entry = {
		unit = spawn_unit,
		align_obj_name = align_obj_name
	}

	if unit_name and not no_local_unit_dropin and spawn_unit:id() == -1 then
		unit_entry.unit_name = unit_name
	end

	self._spawned_units[unit_id] = unit_entry

	if self._is_server and not self.local_only and self._unit:id() ~= -1 and spawn_unit:id() ~= -1 then
		managers.network:send_to_peers_synched("sync_unit_spawn", self._unit, spawn_unit, align_obj_name, unit_id, "spawn_manager")
	end
end

function ManageSpawnedUnits:spawn_and_link_unit(joint_table, unit_id, unit, no_local_unit_dropin)
	if type(joint_table) ~= "string" then
		Application:error("[ManageSpawnedUnits] spawn_and_link_unit() - param1 (joint_table) isn't a string", self._unit, joint_table)

		joint_table = nil
	elseif type(self[joint_table]) ~= "table" then
		Application:error("[ManageSpawnedUnits] spawn_and_link_unit() - param1 (joint_table) \"" .. tostring(joint_table) .. "\" doesn't point to a table in \"spawn_manager\" extension", self._unit)

		joint_table = nil
	end

	if not unit_id then
		Application:error("[ManageSpawnedUnits] spawn_and_link_unit() - param2 (unit_id) is nil", self._unit)
	end

	if not unit then
		Application:error("[ManageSpawnedUnits] spawn_and_link_unit() - param3 (unit) is nil", self._unit)
	end

	if not joint_table or not unit_id or not unit then
		return
	end

	if self._spawned_units[unit_id] then
		return
	end

	if not self._is_server and not self._loaded and not self.allow_client_spawn then
		self._link_after_load = self._link_after_load or {}

		table.insert(self._link_after_load, {
			joint_table,
			unit_id,
			unit
		})

		return
	end

	self:spawn_unit(unit_id, self[joint_table][1], unit, no_local_unit_dropin)

	if not self._spawned_units[unit_id] then
		return
	end

	self._sync_spawn_and_link[unit_id] = {
		unit = unit,
		joint_table = joint_table
	}

	if self._is_server or self._loaded or self.allow_client_spawn then
		self:_link_joints(unit_id, joint_table)
	end

	if self._is_server and not self.local_only and self._unit:id() ~= -1 then
		managers.network:send_to_peers_synched("sync_link_spawned_unit", self._unit, unit_id, joint_table, "spawn_manager")
	end
end

function ManageSpawnedUnits:local_push_child_unit(unit_id, mass, pow, vec3_obj_a, vec3_obj_b)
	if not unit_id then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param1 (unit_id) is nil", self._unit)
	end

	if type(mass) ~= "number" then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param2 (mass) isn't a number", self._unit, mass)

		mass = nil
	end

	if type(pow) ~= "number" then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param3 (pow) isn't a number", self._unit, pow)

		pow = nil
	end

	if type(vec3_obj_a) ~= "string" then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param4 (vec3_obj_a) isn't a string", self._unit, vec3_obj_a)

		vec3_obj_a = nil
	end

	if type(vec3_obj_b) ~= "string" then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param5 (vec3_obj_b) isn't a string", self._unit, vec3_obj_b)

		vec3_obj_b = nil
	end

	if not unit_id or not mass or not pow or not vec3_obj_a or not vec3_obj_b then
		return
	end

	local unit_entry = self._spawned_units[unit_id]

	if not unit_entry or not alive(unit_entry.unit) then
		return
	end

	local obj_a = self._unit:get_object(Idstring(vec3_obj_a))
	local obj_b = self._unit:get_object(Idstring(vec3_obj_b))

	if not obj_a then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - no \"" .. tostring(vec3_obj_a) .. "\" object found on unit", self._unit)
	end

	if not obj_b then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - no \"" .. tostring(vec3_obj_b) .. "\" object found on unit", self._unit)
	end

	if not obj_a or not obj_b then
		return
	end

	local from = tmp_vec1
	local to = tmp_vec2

	obj_a:m_position(from)
	obj_b:m_position(to)

	local push_vec = tmp_vec3

	mvector3.direction(push_vec, from, to)
	mvector3.multiply(push_vec, pow)

	if self._push_spread then
		mvector3.spread(push_vec, self._push_spread)
	end

	unit_entry.unit:push(mass, push_vec)

	if self._is_server and not self.local_only and self._unit:id() ~= -1 then
		managers.network:send_to_peers_synched("run_local_push_child_unit", self._unit, "spawn_manager", unit_id, mass, pow, vec3_obj_a, vec3_obj_b)
	end
end

function ManageSpawnedUnits:remove_unit(unit_id)
	if not unit_id then
		Application:error("[ManageSpawnedUnits] remove_unit() - param1 (unit_id) is nil", self._unit)

		return
	end

	if self._link_after_load then
		for i, u_data in ipairs(self._link_after_load) do
			if u_data[2] == unit_id then
				table.remove(self._link_after_load, i)

				if not next(self._link_after_load) then
					self._link_after_load = nil
				end

				return
			end
		end
	end

	local entry = self._spawned_units[unit_id]

	if entry and alive(entry.unit) then
		entry.unit:unlink()
		entry.unit:set_visible(false)
		entry.unit:set_enabled(false)

		local unit_data_ext = entry.unit:unit_data()

		unit_data_ext.parent_unit = nil

		unit_data_ext:remove_destroy_listener(self._destroy_listener_key)

		if self._is_server or entry.unit:id() == -1 then
			entry.unit:set_slot(0)
		end
	end

	self._spawned_units[unit_id] = nil

	if self._sync_spawn_and_link[unit_id] then
		self._sync_spawn_and_link[unit_id] = nil
	end
end

function ManageSpawnedUnits:spawn_run_sequence(unit_id, sequence_name)
	if not unit_id then
		Application:error("[ManageSpawnedUnits] spawn_run_sequence() - param1 (unit_id) is nil", self._unit)
	end

	if type(sequence_name) ~= "string" then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param2 (sequence_name) isn't a string", self._unit, sequence_name)

		sequence_name = nil
	end

	if not unit_id or not sequence_name then
		return
	end

	if unit_id ~= "self" then
		local entry = self._spawned_units[unit_id]

		if not entry or not alive(entry.unit) then
			return
		end
	end

	if self._is_server and not self.local_only and self._unit:id() ~= -1 then
		managers.network:send_to_peers_synched("run_spawn_unit_sequence", self._unit, "spawn_manager", unit_id, sequence_name)
	end

	self:_spawn_run_sequence(unit_id, sequence_name)
end
