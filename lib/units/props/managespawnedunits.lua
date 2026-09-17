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
	for i, entry in pairs(self._spawned_units) do
		if alive(entry.unit) then
			entry.unit:unlink()
			entry.unit:set_visible(false)
			entry.unit:set_enabled(false)

			if self._is_server or entry.unit:id() == -1 then
				entry.unit:set_slot(0)
			end
		end
	end

	self._spawned_units = {}
	self._sync_spawn_and_link = {}
end

function ManageSpawnedUnits:on_post_detached_from_network()
	for unit_id, unit_entry in pairs(self._spawned_units) do
		if alive(unit_entry.unit) and unit_entry.unit:id() ~= -1 then
			detach_unit_from_network(unit_entry.unit)
		end
	end
end

function ManageSpawnedUnits:_clbk_drop_in_sync(data)
	if not alive(self._unit) or self._unit:id() == -1 then
		return
	end

	local peer = managers.network:get_peer_safe(data.peer_id)

	if not peer then
		return
	end

	for unit_id, sync_data in pairs(data.networked_units) do
		if self._spawned_units[unit_id] and alive(sync_data.unit) and sync_data.unit:id() ~= -1 then
			managers.network:send_to_peer_synched(peer, "sync_unit_spawn", self._unit, sync_data.unit, sync_data.align_obj_name, unit_id, "spawn_manager")

			if sync_data.joint_table then
				managers.network:send_to_peer_synched(peer, "sync_link_spawned_unit", self._unit, unit_id, sync_data.joint_table, "spawn_manager")
			end
		end
	end
end

function ManageSpawnedUnits:save(data)
	if not alive(self._unit) or self._unit:id() == -1 or self.local_only then
		data.ManageSpawnedUnits = nil

		return
	end

	local local_units, networked_units = {}, {}

	for unit_id, unit_entry in pairs(self._spawned_units) do
		if alive(unit_entry.unit) then
			local spawn_link_entry = self._sync_spawn_and_link[unit_id]
			local joint_table = spawn_link_entry and spawn_link_entry.joint_table or nil

			if unit_entry.unit:id() ~= -1 then
				networked_units[unit_id] = {
					unit = unit_entry.unit,
					align_obj_name = unit_entry.align_obj_name
				}

				if joint_table then
					networked_units[unit_id].joint_table = joint_table
				end
			elseif false and unit_entry.unit_name then
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

		managers.enemy:add_delayed_clbk("ManageSpawnedUnitsDropIn" .. tostring(self._unit:key()), callback(self, self, "_clbk_drop_in_sync", {
			peer_id = peer:id(),
			networked_units = networked_units
		}), TimerManager:game():time() + 0.1)
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

		return
	end

	local save_data = data.ManageSpawnedUnits or data.managed_spawned_units

	if not save_data then
		return
	end

	if save_data.local_units then
		self._loaded = true

		for unit_id, synced_entry in pairs(save_data.local_units) do
			if synced_entry.joint_table then
				self:spawn_and_link_unit(synced_entry.joint_table, unit_id, synced_entry.unit_name)
			else
				self:spawn_unit(unit_id, synced_entry.align_obj_name, synced_entry.unit_name)
			end
		end

		self._loaded = nil
	end
end

function ManageSpawnedUnits:link_spawned_unit(unit_id, joint_table)
	if not joint_table then
		Application:error("[ManageSpawnedUnits] link_spawned_unit() - param1 (joint_table) is nil", self._unit)
	elseif not self[joint_table] then
		Application:error("[ManageSpawnedUnits] link_spawned_unit() - missing joint table \"" .. tostring(joint_table) .. "\" from unit file", self._unit)
	end

	if not unit_id then
		Application:error("[ManageSpawnedUnits] link_spawned_unit() - param2 (unit_id) is nil", self._unit)
	end

	if not self[joint_table] or not unit_id then
		return
	end

	local unit_entry = self._spawned_units[unit_id]

	if not unit_entry or not alive(unit_entry.unit) then
		return
	end

	self:_link_joints(unit_id, joint_table)
end

function ManageSpawnedUnits:_link_joints(unit_id, joint_table)
	local ids, parent_object, child_object
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

function ManageSpawnedUnits:_spawn_run_sequence(unit_id, sequence_name)
	if not unit_id then
		Application:error("[ManageSpawnedUnits] _spawn_run_sequence() - param1 (unit_id) is nil", self._unit)

		return
	end

	if not sequence_name then
		Application:error("[ManageSpawnedUnits] _spawn_run_sequence() - param2 (sequence_name) is nil", self._unit)

		return
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

	if dmg_ext:has_sequence(sequence_name) then
		dmg_ext:run_sequence_simple(sequence_name)
	else
		Application:error("[ManageSpawnedUnits] _spawn_run_sequence() - sequence with name \"" .. tostring(sequence_name) .. "\" does not exist in unit", unit)
	end
end

function ManageSpawnedUnits:spawn_unit(unit_id, align_obj_name, unit)
	local obj_name_ids = Idstring(align_obj_name)
	local align_obj = self._unit:get_object(obj_name_ids)
	local spawn_unit, unit_name

	if type(unit) == "string" then
		unit_name = unit

		if self._is_server or self.allow_client_spawn then
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
		unit_name = unit_name,
		align_obj_name = align_obj_name
	}

	self._spawned_units[unit_id] = unit_entry

	if self._is_server and not self.local_only and self._unit:id() ~= -1 and spawn_unit:id() ~= -1 then
		managers.network:send_to_peers_synched("sync_unit_spawn", self._unit, spawn_unit, align_obj_name, unit_id, "spawn_manager")
	end
end

function ManageSpawnedUnits:spawn_and_link_unit(joint_table, unit_id, unit)
	if self._spawned_units[unit_id] then
		return
	end

	if not joint_table then
		Application:error("[ManageSpawnedUnits] spawn_and_link_unit() - param1 (joint_table) is nil", self._unit)
	elseif not self[joint_table] then
		Application:error("[ManageSpawnedUnits] spawn_and_link_unit() - missing joint table \"" .. tostring(joint_table) .. "\" from unit file", self._unit)
	end

	if not unit_id then
		Application:error("[ManageSpawnedUnits] spawn_and_link_unit() - param2 (unit_id) is nil", self._unit)
	end

	if not unit then
		Application:error("[ManageSpawnedUnits] spawn_and_link_unit() - param3 (unit) is nil", self._unit)
	end

	if not self[joint_table] or not unit_id or not unit then
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

	self:spawn_unit(unit_id, self[joint_table][1], unit)

	self._sync_spawn_and_link[unit_id] = {
		unit = unit,
		joint_table = joint_table
	}

	if self._is_server or self.allow_client_spawn then
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

	if not mass then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param2 (mass) is nil", self._unit)
	end

	if not pow then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param3 (pow) is nil", self._unit)
	end

	if not vec3_obj_a then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param4 (vec3_obj_a) is nil", self._unit)
	end

	if not vec3_obj_b then
		Application:error("[ManageSpawnedUnits] local_push_child_unit() - param5 (vec3_obj_b) is nil", self._unit)
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

	local dir = tmp_vec3

	mvector3.direction(dir, from, to)
	mvector3.multiply(dir, pow)

	if self._push_spread then
		mvector3.spread(dir, self._push_spread)
	end

	unit_entry.unit:push(mass, dir)

	if self._is_server and not self.local_only and self._unit:id() ~= -1 then
		managers.network:send_to_peers_synched("run_local_push_child_unit", self._unit, "spawn_manager", unit_id, mass, pow, vec3_obj_a, vec3_obj_b)
	end
end

function ManageSpawnedUnits:remove_unit(unit_id)
	if self._link_after_load then
		for i, u_data in ipairs(self._link_after_load) do
			if u_data[2] == unit_id then
				removed = true

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

		if self._is_server or entry.unit:id() == -1 then
			entry.unit:set_slot(0)
		end
	end

	self._spawned_units[unit_id] = nil
	self._sync_spawn_and_link[unit_id] = nil
end

function ManageSpawnedUnits:spawn_run_sequence(unit_id, sequence_name)
	local entry = self._spawned_units[unit_id]

	if unit_id ~= "self" and (not entry or not alive(entry.unit)) then
		return
	end

	if self._is_server and not self.local_only and self._unit:id() ~= -1 then
		managers.network:send_to_peers_synched("run_spawn_unit_sequence", self._unit, "spawn_manager", unit_id, sequence_name)
	end

	self:_spawn_run_sequence(unit_id, sequence_name)
end
