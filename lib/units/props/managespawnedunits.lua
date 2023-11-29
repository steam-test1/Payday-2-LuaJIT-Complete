ManageSpawnedUnits = ManageSpawnedUnits or class()

function ManageSpawnedUnits:init(unit)
	self._unit = unit
	self._spawned_units = {}
	self._visibility_state = true

	unit:set_extension_update_enabled(Idstring("spawn_manager"), false)
end

function ManageSpawnedUnits:spawn_unit(unit_id, align_obj_name, unit)
	local align_obj = self._unit:get_object(Idstring(align_obj_name))
	local spawn_unit = nil

	if type_name(unit) == "string" then
		if Network:is_server() or self.allow_client_spawn then
			local spawn_pos = align_obj:position()
			local spawn_rot = align_obj:rotation()
			spawn_unit = safe_spawn_unit(Idstring(unit), spawn_pos, spawn_rot)
			spawn_unit:unit_data().parent_unit = self._unit
		end
	else
		spawn_unit = unit
	end

	if not spawn_unit then
		return
	end

	self._unit:link(Idstring(align_obj_name), spawn_unit, spawn_unit:orientation_object():name())

	local contour_ext = self._unit:contour()
	local spawned_contour_ext = spawn_unit:contour()

	if contour_ext and spawned_contour_ext then
		if spawned_contour_ext.init_contour then
			Application:error("[ManageSpawnedUnits:spawn_unit] Spawned child unit shouldn't have a init contour defined in unit file.", spawn_unit)
		end

		spawned_contour_ext:set_is_child(true)

		for _, contour in ipairs(contour_ext:contour_list()) do
			spawned_contour_ext:add(contour.type, false, nil, contour.color)
		end
	end

	spawn_unit:set_visible(self._visibility_state)

	local unit_entry = {
		align_obj_name = align_obj_name,
		unit = spawn_unit
	}
	self._spawned_units[unit_id] = unit_entry

	if Network:is_server() and not self.local_only then
		managers.network:session():send_to_peers_synched("sync_unit_spawn", self._unit, spawn_unit, align_obj_name, unit_id, "spawn_manager")
	end
end

function ManageSpawnedUnits:spawned_units()
	return self._spawned_units
end

function ManageSpawnedUnits:spawn_and_link_unit(joint_table, unit_id, unit)
	if self._spawned_units[unit_id] then
		return
	end

	if not Network:is_server() and not self._loaded and not self.allow_client_spawn then
		self._link_after_load = self._link_after_load or {}

		table.insert(self._link_after_load, {
			joint_table,
			unit_id,
			unit
		})

		return
	end

	if not self[joint_table] then
		Application:error("No table named:", joint_table, "in unit file:", self._unit:name())
		print("[ManageSpawnedUnits] No table named:", joint_table, "in unit file:", self._unit:name())

		return
	end

	if not unit_id then
		Application:error("param2", "nil:\n", self._unit:name())
		print("[ManageSpawnedUnits] param2", "nil:\n", self._unit:name())

		return
	end

	if not unit then
		Application:error("param3", "nil:\n", self._unit:name())
		print("[ManageSpawnedUnits] param3", "nil:\n", self._unit:name())

		return
	end

	self:spawn_unit(unit_id, self[joint_table][1], unit)

	self._sync_spawn_and_link = self._sync_spawn_and_link or {}
	self._sync_spawn_and_link[unit_id] = {
		unit = unit,
		joint_table = joint_table
	}

	if Network:is_server() or self.allow_client_spawn then
		self:_link_joints(unit_id, joint_table)
	end

	if Network:is_server() and not self.local_only then
		managers.network:session():send_to_peers_synched("sync_link_spawned_unit", self._unit, unit_id, joint_table, "spawn_manager")
	end
end

function ManageSpawnedUnits:linked_units()
	return self._sync_spawn_and_link
end

function ManageSpawnedUnits:spawn_run_sequence(unit_id, sequence_name)
	local entry = self._spawned_units[unit_id]

	if unit_id ~= "self" then
		if not entry then
			return
		end

		if not alive(entry.unit) then
			return
		end
	end

	if Network:is_server() and not self.local_only then
		managers.network:session():send_to_peers_synched("run_spawn_unit_sequence", self._unit, "spawn_manager", unit_id, sequence_name)
	end

	self:_spawn_run_sequence(unit_id, sequence_name)
end

function ManageSpawnedUnits:local_push_child_unit(unit_id, mass, pow, vec3_a, vec3_b)
	if not unit_id then
		Application:error("param1", "nil:\n", self._spawned_units[unit_id].unit:name())

		return
	end

	if not mass then
		Application:error("param2", "nil:\n", self._spawned_units[unit_id].unit:name())

		return
	end

	if not pow then
		Application:error("param3", "nil:\n", self._spawned_units[unit_id].unit:name())

		return
	end

	if not vec3_a then
		Application:error("param4", "nil:\n", self._spawned_units[unit_id].unit:name())

		return
	end

	if not vec3_b then
		Application:error("param5", "nil:\n", self._spawned_units[unit_id].unit:name())

		return
	end

	if not self._spawned_units then
		return
	end

	if not self._spawned_units[unit_id] then
		return
	end

	if not alive(self._spawned_units[unit_id].unit) then
		return
	end

	local dir = Vector3()
	local spawnObj = self._unit:get_object(Idstring(vec3_a)):position()
	local forwObj = self._unit:get_object(Idstring(vec3_b)):position()

	mvector3.direction(dir, spawnObj, forwObj)
	mvector3.multiply(dir, pow)

	if self._push_spread then
		mvector3.spread(dir, self._push_spread)
	end

	self._spawned_units[unit_id].unit:push(mass, dir)

	if Network:is_server() and not self.local_only then
		managers.network:session():send_to_peers_synched("run_local_push_child_unit", self._unit, "spawn_manager", unit_id, mass, pow, vec3_a, vec3_b)
	end
end

function ManageSpawnedUnits:remove_unit(unit_id)
	local entry = self._spawned_units[unit_id]

	if entry and alive(entry.unit) then
		entry.unit:unlink()
		entry.unit:set_visible(false)
		entry.unit:set_enabled(false)

		if Network:is_server() or entry.unit:id() == -1 then
			entry.unit:set_slot(0)
		end
	end

	self._spawned_units[unit_id] = nil
end

function ManageSpawnedUnits:destroy(unit)
	local allowed_to_delete = Network:is_server()

	for i, entry in pairs(self._spawned_units) do
		if alive(entry.unit) then
			entry.unit:unlink()
			entry.unit:set_visible(false)
			entry.unit:set_enabled(false)

			if allowed_to_delete or entry.unit:id() == -1 then
				entry.unit:set_slot(0)
			end
		end
	end

	self._spawned_units = {}
end

function ManageSpawnedUnits:on_post_detached_from_network()
	if self._sync_spawn_and_link then
		local spawned_units = self._spawned_units

		for unit_id, _ in pairs(self._sync_spawn_and_link) do
			local unit_entry = spawned_units[unit_id]

			if unit_entry and alive(unit_entry.unit) and unit_entry.unit:id() ~= -1 then
				detach_unit_from_network(unit_entry.unit)
			end
		end
	end
end

function ManageSpawnedUnits:save(data)
	if not alive(self._unit) or self._unit:id() == -1 or self.local_only then
		data.managed_spawned_units = nil

		return
	end

	data.managed_spawned_units = {
		linked_joints = self._sync_spawn_and_link
	}
	local sync_units = {}

	for unit_id, unit_entry in pairs(self._spawned_units) do
		if alive(unit_entry.unit) and unit_entry.unit:id() ~= -1 then
			sync_units[unit_id] = unit_entry
		end
	end

	if next(sync_units) then
		local peer = managers.network:session():dropin_peer()

		managers.enemy:add_delayed_clbk("ManageSpawnedUnitsDropIn" .. tostring(self._unit:key()), callback(self, self, "_clbk_drop_in_sync", {
			peer_id = peer:id(),
			sync_units = sync_units
		}), TimerManager:game():time() + 0.1)
	end
end

function ManageSpawnedUnits:load(data)
	if not data.managed_spawned_units then
		return
	end

	self._sync_spawn_and_link = data.managed_spawned_units.linked_joints or {}
	self._loaded = true

	if self._link_after_load then
		for _, data in ipairs(self._link_after_load) do
			self:spawn_and_link_unit(unpack(data))
		end
	else
		for id, data in pairs(self._sync_spawn_and_link) do
			self:spawn_and_link_unit(data.joint_table, id, data.unit)
		end
	end
end

function ManageSpawnedUnits:_clbk_drop_in_sync(data)
	if not alive(self._unit) or self._unit:id() == -1 then
		return
	end

	local session = managers.network:session()

	if not session then
		return
	end

	local peer = session:peer(data.peer_id)

	if not peer then
		return
	end

	for unit_id, unit_entry in pairs(data.sync_units) do
		if alive(unit_entry.unit) and unit_entry.unit:id() ~= -1 then
			session:send_to_peer_synched(peer, "sync_unit_spawn", self._unit, unit_entry.unit, unit_entry.align_obj_name, unit_id, "spawn_manager")
		end
	end
end

function ManageSpawnedUnits:_spawn_run_sequence(unit_id, sequence_name)
	local entry = self._spawned_units[unit_id]

	if unit_id ~= "self" then
		if not entry then
			return
		end

		if not alive(entry.unit) then
			return
		end
	end

	if not sequence_name then
		Application:error("No sequence_name param passed\n", self._unit:name(), "\n")

		return
	end

	local unit = unit_id == "self" and self._unit or entry and entry.unit

	if unit:damage():has_sequence(sequence_name) then
		unit:damage():run_sequence_simple(sequence_name)
	else
		Application:error("[ManageSpawnedUnits:_spawn_run_sequence] Sequence name '" .. tostring(sequence_name) .. "' does not exist in unit:\n", unit:name())
	end
end

local empty_vec = Vector3()
local empty_rot = Rotation()

function ManageSpawnedUnits:_link_joints(unit_id, joint_table)
	local ids, parent_object, child_object = nil
	local parent_unit = self._unit
	local child_unit = self._spawned_units[unit_id].unit

	for index, value in ipairs(self[joint_table]) do
		if index > 1 then
			ids = Idstring(value)
			parent_object = parent_unit:get_object(ids)
			child_object = child_unit:get_object(ids)

			child_object:set_local_position(empty_vec)
			child_object:set_local_rotation(empty_rot)
			child_object:link(parent_object)
		end
	end

	parent_unit:set_moving()
end

function ManageSpawnedUnits:get_unit(unit_id)
	local entry = self._spawned_units[unit_id]

	if not entry then
		return
	end

	if not alive(entry.unit) then
		return
	end

	return entry.unit
end

function ManageSpawnedUnits:set_visibility_state(state)
	self._visibility_state = state

	if self._sync_spawn_and_link then
		local spawned_units = self._spawned_units

		for unit_id, _ in pairs(self._sync_spawn_and_link) do
			local unit_entry = spawned_units[unit_id]

			if unit_entry and alive(unit_entry.unit) then
				unit_entry.unit:set_visible(state)
			end
		end
	end
end
