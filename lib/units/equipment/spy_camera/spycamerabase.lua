SpyCameraBase = SpyCameraBase or class(UnitBase)
SpyCameraBase.UPDATE_RATE = 1.5
SpyCameraBase.WHISPER_UPDATE_RATE = 4

local IDS_MATERIAL = IDS_MATERIAL
local IDS_UV0_SPEED = Idstring("uv0_speed")

function SpyCameraBase.spawn(position, rotation, owner, peer_id)
	local unit_name = "units/pd2_dlc_esp/equipment/esp_equipment_spy_camera/esp_equipment_spy_camera"
	local unit = World:spawn_unit(Idstring(unit_name), position, rotation)

	managers.network:session():send_to_peers_synched("sync_equipment_setup", unit, 0, peer_id or 0)
	unit:base():setup(0, owner)

	local owner_id = unit:base():get_owner_id()

	if owner_id then
		local access_unit_name = "units/pd2_dlc_esp/equipment/esp_equipment_spy_camera/esp_equipment_spy_camera_access"
		local access_unit = World:spawn_unit(Idstring(access_unit_name), position, rotation)

		unit:base():interaction_setup(access_unit, owner_id)
		managers.network:session():send_to_peers_synched("sync_spy_camera_interaction", unit, access_unit, owner_id)
	end

	return unit
end

function SpyCameraBase:set_server_information(peer_id)
	self._server_information = {
		owner_peer_id = peer_id
	}

	managers.network:session():peer(peer_id):set_used_deployable(true)
end

function SpyCameraBase:server_information()
	return self._server_information
end

function SpyCameraBase:init(unit)
	local is_server = Network:is_server()

	SpyCameraBase.super.init(self, unit, is_server)

	self._slotmask = managers.slot:get_mask("world_geometry")

	if not is_server then
		self._validate_clbk_id = "spy_camera_validate" .. tostring(unit:key())

		managers.enemy:add_delayed_clbk(self._validate_clbk_id, callback(self, self, "_clbk_validate"), Application:time() + 60)
	end

	self._material_clbk_id = "spy_camera_material" .. tostring(unit:key())

	managers.enemy:add_delayed_clbk(self._material_clbk_id, callback(self, self, "_update_materials"), Application:time() + 0.1)
end

function SpyCameraBase:_clbk_validate()
	self._validate_clbk_id = nil

	if not self._was_dropin then
		local peer = managers.network:session():server_peer()

		peer:mark_cheater(VoteManager.REASON.many_assets)
	end
end

function SpyCameraBase:setup(upgrade_lvl, owner)
	self:set_owner(owner)
end

function SpyCameraBase:sync_setup(upgrade_lvl, peer_id)
	if self._validate_clbk_id then
		managers.enemy:remove_delayed_clbk(self._validate_clbk_id)

		self._validate_clbk_id = nil
	end

	managers.player:verify_equipment(peer_id, "spy_camera")
end

function SpyCameraBase:get_name_id()
	return "spy_camera"
end

function SpyCameraBase:set_owner(owner)
	self._owner = owner

	local is_whisper_mode = managers.groupai and managers.groupai:state():whisper_mode()

	self._update_rate = is_whisper_mode and self.WHISPER_UPDATE_RATE or self.UPDATE_RATE

	if owner then
		local peer = managers.network:session():peer_by_unit(owner)

		if peer then
			self._owner_id = peer:id()

			if self._unit:interaction() then
				self._unit:interaction():set_owner_id(self._owner_id)
			end

			if self._owner == managers.player:local_player() then
				if self._unit:damage() then
					local owner_id = self._owner_id <= 4 and tostring(self._owner_id) or "none"

					self._unit:damage():has_then_run_sequence_simple("set_owner_peer_" .. owner_id)
				end

				self._is_local_owner = true

				self:_update_materials()

				if is_whisper_mode then
					self._whisper_listener = "SpyCameraBase" .. tostring(self._unit:key())

					managers.groupai:state():add_listener(self._whisper_listener, {
						"whisper_mode"
					}, callback(self, self, "on_whisper_mode_changed"))
				end

				self._unit:set_extension_update_enabled(Idstring("base"), true)
			end
		end
	end
end

function SpyCameraBase:on_whisper_mode_changed()
	if self._whisper_listener then
		managers.groupai:state():remove_listener(self._whisper_listener)

		self._whisper_listener = nil
	end

	self._update_rate = self.UPDATE_RATE

	self:_update_materials()
end

function SpyCameraBase:_update_materials()
	if alive(self._unit) then
		self._material_clbk_id = nil

		local uv0_speed = Vector3(1 / (self._update_rate or 1), 0, 0)

		for _, material in ipairs(self._unit:get_objects_by_type(IDS_MATERIAL)) do
			if material:variable_exists(IDS_UV0_SPEED) then
				material:set_variable(IDS_UV0_SPEED, uv0_speed)
				material:set_time(0)
			end
		end
	end
end

function SpyCameraBase:get_owner_id()
	return self._owner_id or 1
end

function SpyCameraBase:owner()
	if not alive(self._owner) then
		local peer = managers.network:session():peer(self._owner_id)

		if peer then
			self._owner = peer:unit()
		end
	end

	return self._owner
end

function SpyCameraBase:link_attachment()
	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local forward = rotation:y()
	local from_pos = position + forward * 10
	local to_pos = position + forward * -10
	local ray = self._unit:raycast("ray", from_pos, to_pos, "slot_mask", self._slotmask)

	if ray then
		local body = ray.body

		self._attached_data = {
			index = 1,
			max_index = 3,
			body = body,
			position = body:position(),
			rotation = body:rotation()
		}
	end
end

function SpyCameraBase:update(unit, t, dt)
	if self._removed then
		return
	end

	if Network:is_server() then
		self:_check_body()
	end

	if not self._is_local_owner then
		return
	end

	if self._next_update_t and t < self._next_update_t then
		return
	end

	self._next_update_t = t + self._update_rate

	local position = self._unit:position()
	local rotation = self._unit:rotation()
	local forward = rotation:y()
	local found_units = World:find_units_quick("cone", position, position + forward * 3000, 2300, managers.slot:get_mask("persons_no_players"))

	if not found_units then
		return
	end

	for _, found_unit in ipairs(found_units) do
		if alive(found_unit) and not found_unit:character_damage():dead() and found_unit:base()._tweak_table then
			local should_mark = true

			if managers.groupai:state():whisper_mode() then
				if not tweak_data.character[found_unit:base()._tweak_table].silent_priority_shout and not tweak_data.character[found_unit:base()._tweak_table].priority_shout then
					should_mark = false
				end
			elseif not tweak_data.character[found_unit:base()._tweak_table].priority_shout then
				should_mark = false
			end

			if should_mark then
				local ray = self._unit:raycast("ray", found_unit:movement():m_head_pos(), position + forward * 2, "ray_type", "ai_vision", "slot_mask", self._slotmask, "report")

				if not ray and managers.game_play_central:auto_highlight_enemy(found_unit, true) then
					break
				end
			end
		end
	end
end

function SpyCameraBase:on_interaction()
	if Network:is_server() then
		SpyCameraBase.on_picked_up()
		self:remove()
	else
		managers.network:session():send_to_host("picked_up_spy_camera", self._unit)
	end
end

function SpyCameraBase.on_picked_up()
	managers.player:add_spy_camera()
end

function SpyCameraBase:remove()
	self._removed = true

	self._unit:set_slot(0)
end

function SpyCameraBase:is_removed()
	return self._removed
end

function SpyCameraBase:_check_body()
	if self._is_dynamic or not self._attached_data then
		return
	end

	if not alive(self._attached_data.body) then
		self:server_set_dynamic()

		return
	end

	if self._attached_data.index == 1 then
		if not self._attached_data.body:enabled() then
			self:server_set_dynamic()
		end
	elseif self._attached_data.index == 2 then
		if not mrotation.equal(self._attached_data.rotation, self._attached_data.body:rotation()) then
			self:server_set_dynamic()
		end
	elseif self._attached_data.index == 3 and mvector3.not_equal(self._attached_data.position, self._attached_data.body:position()) then
		self:server_set_dynamic()
	end

	self._attached_data.index = (self._attached_data.index < self._attached_data.max_index and self._attached_data.index or 0) + 1
end

function SpyCameraBase:server_set_dynamic()
	self:_set_dynamic()

	if managers.network:session() then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", 1)
	end
end

function SpyCameraBase:sync_net_event(event_id)
	if event_id == 1 then
		self:_set_dynamic()
	end
end

function SpyCameraBase:_set_dynamic()
	self._is_dynamic = true

	self._unit:body("dynamic"):set_enabled(true)

	if alive(self._interaction_unit) then
		self._interaction_unit:base():set_destroyed(true)
	end
end

function SpyCameraBase:interaction_setup(interaction_unit, owner_id)
	if alive(interaction_unit) then
		self._unit:link(self._unit:orientation_object():name(), interaction_unit, interaction_unit:orientation_object():name())

		self._interaction_unit = interaction_unit

		self._interaction_unit:base():set_owner_id(owner_id)
	end

	if self._unit:damage() then
		local sequence = "set_owner_peer_" .. tostring(owner_id)

		if self._unit:damage():has_sequence(sequence) then
			self._unit:damage():run_sequence_simple(sequence)
		else
			self._unit:damage():run_sequence_simple("set_owner_peer_none")
		end

		print("[SpyCameraBase]", "set_owner_peer_" .. owner_id)
	end
end

function SpyCameraBase:destroy(unit)
	SpyCameraBase.super.destroy(self, unit)

	if self._validate_clbk_id then
		managers.enemy:remove_delayed_clbk(self._validate_clbk_id)

		self._validate_clbk_id = nil
	end

	if self._dropin_clbk_id then
		managers.enemy:remove_delayed_clbk(self._dropin_clbk_id)

		self._dropin_clbk_id = nil
	end

	if self._material_clbk_id then
		managers.enemy:remove_delayed_clbk(self._material_clbk_id)

		self._material_clbk_id = nil
	end

	if self._whisper_listener then
		managers.groupai:state():remove_listener(self._whisper_listener)

		self._whisper_listener = nil
	end

	if Network:is_server() then
		self:remove_interaction()
	end
end

function SpyCameraBase:remove_interaction()
	if self._interaction_unit and alive(self._interaction_unit) then
		self._interaction_unit:set_slot(0)

		self._interaction_unit = nil
	end
end

function SpyCameraBase:save(data)
	local state = {}

	state.is_dynamic = self._is_dynamic
	data.SpyCameraBase = state

	if self._interaction_unit then
		local peer = managers.network:session():dropin_peer()

		self._dropin_clbk_id = "SpyCameraBase" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._dropin_clbk_id, callback(self, self, "_clbk_drop_in_sync", peer:id()), TimerManager:game():time() + 0.1)
	end
end

function SpyCameraBase:_clbk_drop_in_sync(peer_id)
	self._dropin_clbk_id = nil

	if not self._interaction_unit then
		return
	end

	local session = managers.network:session()

	if not session then
		return
	end

	local peer = session:peer(peer_id)

	if not peer then
		return
	end

	session:send_to_peer_synched(peer, "sync_spy_camera_interaction", self._unit, self._interaction_unit, self._owner_id)
end

function SpyCameraBase:load(data)
	local state = data.SpyCameraBase

	if state.is_dynamic then
		self:_set_dynamic()
	end

	self._was_dropin = true
end

SpyCameraDummyBase = SpyCameraDummyBase or class()

function SpyCameraDummyBase:init(unit)
	if not unit:damage() then
		return
	end

	local session = managers.network:session()

	if not session then
		return
	end

	local peer_id = session:local_peer():id()
	local sequence = "set_owner_peer_" .. tostring(peer_id)

	if unit:damage():has_sequence(sequence) then
		unit:damage():run_sequence_simple(sequence)
	else
		unit:damage():run_sequence_simple("set_owner_peer_none")
	end
end

SpyAccessCameraBase = SpyAccessCameraBase or class(UnitBase)

function SpyAccessCameraBase:init(unit)
	SpyAccessCameraBase.super.init(self, unit, true)

	self._tweak_data = tweak_data.equipments.spy_camera
	self._camera_object = self._unit:get_object(Idstring("a_camera"))
	self._obstruction_slotmask = managers.slot:get_mask("interaction_obstruction")
	self._values = {
		destroyed = false,
		text_id = "hud_cam_access_spy_camera",
		theme = "spy_camera",
		position = self:camera_position(),
		rotation = self:camera_rotation(),
		yaw_limit = self._tweak_data.yaw_limit,
		pitch_limit = self._tweak_data.pitch_limit,
		text_macros = {}
	}
	self._destroyed = false

	managers.game_play_central:add_access_camera(self._tweak_data.access_channel, self)
end

function SpyAccessCameraBase:destroy()
	managers.game_play_central:remove_access_camera(self._tweak_data.access_channel, self)

	local current_state = game_state_machine:current_state()

	if current_state and current_state.on_camera_access_changed then
		current_state:on_camera_access_changed(self._unit)
	end
end

function SpyAccessCameraBase:add_trigger(id, type, callback)
	if type == "destroyed" then
		self:add_destroy_listener(id, callback)
	end
end

function SpyAccessCameraBase:remove_trigger(id, type)
	if type == "destroyed" then
		self:remove_destroy_listener(id)
	end
end

function SpyAccessCameraBase:trigger_accessed(instigator)
	self._values.position = self:camera_position()
	self._values.rotation = self:camera_rotation()
end

function SpyAccessCameraBase:is_moving()
	if self._destroyed then
		return
	end

	local position = self._values.position
	local rotation = self._values.rotation
	local forward = rotation:y()
	local obstracted = self._unit:raycast("ray", position + forward, position + forward * 35, "slot_mask", self._obstruction_slotmask, "report")

	if obstracted then
		self:set_destroyed(true)
	end
end

function SpyAccessCameraBase:enabled()
	return true
end

function SpyAccessCameraBase:has_camera_unit()
	return alive(self._unit)
end

function SpyAccessCameraBase:camera_unit()
	return self._unit
end

function SpyAccessCameraBase:camera_position()
	return self._camera_object:position()
end

function SpyAccessCameraBase:camera_rotation()
	return self._camera_object:rotation()
end

function SpyAccessCameraBase:value(value)
	return self._values[value]
end

function SpyAccessCameraBase:set_destroyed(value)
	self._values.destroyed = value
	self._destroyed = value

	if value then
		self._destroy_listener_holder:call(self._unit)
	end
end

function SpyAccessCameraBase:set_owner_id(owner_id)
	local owner_peer = managers.network:session():peer(owner_id)

	if not owner_peer then
		return
	end

	self._owner_id = owner_id

	local theme_id = "spy_camera_peer_" .. owner_id

	self._values.theme = tweak_data.camera_themes[theme_id] and theme_id or "spy_camera"

	local character_name = owner_peer:character()

	self._values.text_macros.NAME = managers.localization:text("menu_" .. character_name)
end

function SpyAccessCameraBase:m_camera_rotation(m_rot)
	if not m_rot then
		return self:camera_rotation()
	end

	self._unit:m_rotation(m_rot)

	return m_rot
end

function SpyAccessCameraBase:m_camera_position(m_vec)
	if not m_vec then
		return self:camera_position()
	end

	self._unit:m_position(m_vec)

	return m_vec
end

function SpyAccessCameraBase:save(data)
	local state = {
		owner_id = self._owner_id,
		destroyed = self._values.destroyed
	}

	data.SpyAccessCameraBase = state
end

function SpyAccessCameraBase:load(data)
	local state = data.SpyAccessCameraBase

	self:set_owner_id(state.owner_id or 1)

	self._values.destroyed = state.destroyed or false
end
