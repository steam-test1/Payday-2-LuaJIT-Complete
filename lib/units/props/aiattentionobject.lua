AIAttentionObject = AIAttentionObject or class()
AIAttentionObject.REACT_IDLE = 1
AIAttentionObject.REACT_CURIOUS = 2
AIAttentionObject.REACT_CHECK = 3
AIAttentionObject.REACT_SUSPICIOUS = 4
AIAttentionObject.REACT_SURPRISED = 5
AIAttentionObject.REACT_SCARED = 6
AIAttentionObject.REACT_AIM = 7
AIAttentionObject.REACT_ARREST = 8
AIAttentionObject.REACT_DISARM = 9
AIAttentionObject.REACT_SHOOT = 10
AIAttentionObject.REACT_MELEE = 11
AIAttentionObject.REACT_COMBAT = 12
AIAttentionObject.REACT_SPECIAL_ATTACK = 13
AIAttentionObject.REACT_MIN = AIAttentionObject.REACT_IDLE
AIAttentionObject.REACT_MAX = AIAttentionObject.REACT_SPECIAL_ATTACK

function AIAttentionObject:init(unit, is_not_extension)
	self._unit = unit
	self._attention_data = nil
	self._listener_holder = ListenerHolder:new()

	self:setup_attention_positions(nil, nil)

	self._is_extension = not is_not_extension

	if self._is_extension then
		if Network:is_client() and unit:unit_data().only_visible_in_editor then
			unit:set_visible(false)
		end

		if self._initial_settings then
			local preset_list = string.split(self._initial_settings, " ")

			for _, preset_name in ipairs(preset_list) do
				local attention_desc = tweak_data.attention.settings[preset_name]
				local att_setting = PlayerMovement._create_attention_setting_from_descriptor(self, attention_desc, preset_name)

				self:add_attention(att_setting)
			end
		end

		self:set_update_enabled(true)
	end
end

function AIAttentionObject:is_extension()
	return self._is_extension
end

function AIAttentionObject:update(unit, t, dt)
	self._attention_obj:m_position(self._observer_info.m_pos)
end

function AIAttentionObject:set_update_enabled(state)
	if not self._is_extension then
		return
	end

	if state and not self._registered then
		state = false
	end

	self._unit:set_extension_update_enabled(Idstring("attention"), state)
end

function AIAttentionObject:set_detection_object_name(obj_name)
	self._attention_obj_name = obj_name

	self:setup_attention_positions()
end

function AIAttentionObject:setup_attention_positions()
	if self._attention_obj_name then
		self._attention_obj = self._unit:get_object(Idstring(self._attention_obj_name))
	else
		self._attention_obj = self._unit:orientation_object()
	end

	self._observer_info = {
		m_pos = self._attention_obj:position()
	}
end

function AIAttentionObject:attention_data()
	return self._attention_data
end

function AIAttentionObject:unit()
	return self._unit
end

function AIAttentionObject:add_attention(settings)
	local needs_register = nil

	if not self._attention_data then
		self._attention_data = {}
		needs_register = true
	end

	self._attention_data[settings.id] = settings

	if needs_register or not self._registered then
		self:_register()
	end

	self:_call_listeners()
end

function AIAttentionObject:remove_attention(id)
	if not self._attention_data then
		return
	end

	if self._attention_data[id] then
		self._attention_data[id] = nil

		if not next(self._attention_data) then
			self._attention_data = nil

			if self._registered then
				self:_unregister()
			end
		else
			self:_chk_update_registered_state()
		end

		self:_call_listeners()
	end
end

function AIAttentionObject:set_attention(settings, id)
	if self._attention_data then
		if settings then
			self._attention_data = {
				[id or settings.id] = settings
			}

			self:_chk_update_registered_state()
		else
			self._attention_data = nil

			if self._registered then
				self:_unregister()
			end
		end

		self:_call_listeners()
	elseif settings then
		self._attention_data = {}
		self._attention_data = {
			[id or settings.id] = settings
		}

		self:_register()
		self:_call_listeners()
	end
end

function AIAttentionObject:override_attention(original_preset_name, override_preset)
	if override_preset then
		self._overrides = self._overrides or {}
		local call_listeners = self._attention_data and self._attention_data[original_preset_name] or self._overrides[original_preset_name]
		self._overrides[original_preset_name] = override_preset

		self:_chk_update_registered_state()

		if call_listeners then
			self:_call_listeners()
		end
	elseif self._overrides and self._overrides[original_preset_name] then
		self._overrides[original_preset_name] = nil

		if not next(self._overrides) then
			self._overrides = nil
		end

		self:_chk_update_registered_state()
		self:_call_listeners()
	end
end

function AIAttentionObject:get_attention(filter, min, max, team)
	if not self._registered or not self._attention_data then
		return
	end

	min = min or AIAttentionObject.REACT_MIN
	max = max or AIAttentionObject.REACT_MAX
	local nav_manager = managers.navigation
	local access_f = nav_manager.check_access
	local settings_match, relation = nil

	if team and self._team then
		if team.foes[self._team.id] then
			relation = "foe"
		else
			relation = "friend"
		end
	end

	for id, settings in pairs(self._attention_data) do
		if (not self._overrides or not self._overrides[id]) and min <= settings.reaction and settings.reaction <= max and (not settings_match or settings_match.reaction < settings.reaction) and (not relation or not settings.relation or relation == settings.relation) and access_f(nav_manager, settings.filter, filter, 0) then
			settings_match = settings
		end
	end

	if self._overrides then
		for id, settings in pairs(self._overrides) do
			if min <= settings.reaction and settings.reaction <= max and (not settings_match or settings_match.reaction < settings.reaction) and (not relation or not settings.relation or relation == settings.relation) and access_f(nav_manager, settings.filter, filter, 0) then
				settings_match = settings
			end
		end
	end

	return settings_match
end

function AIAttentionObject:verify_attention(test_settings, min, max, team)
	if not self._attention_data then
		return
	end

	local new_settings = self:get_attention(filter, min, max, team)

	return new_settings == test_settings
end

function AIAttentionObject:get_attention_m_pos(settings)
	return self._observer_info.m_pos
end

function AIAttentionObject:get_detection_m_pos()
	return self._observer_info.m_pos
end

function AIAttentionObject:get_ground_m_pos()
	return self._observer_info.m_pos
end

function AIAttentionObject:add_listener(key, clbk)
	self._listener_holder:add(key, clbk)
end

function AIAttentionObject:remove_listener(key)
	self._listener_holder:remove(key)
end

function AIAttentionObject:_call_listeners()
	if not self._register_key then
		return
	end

	managers.groupai:state():on_AI_attention_changed(self._register_key)
	self._listener_holder:call(self._register_key)
end

function AIAttentionObject:_register()
	if self._registered then
		debug_pause_unit(self._unit, "[AIAttentionObject:_register] Already registered? ", self._parent_unit, self._unit)

		return
	end

	if not managers.groupai:state():enemy_weapons_hot() or not self:is_attention_irrelevant_for_weapons_hot() then
		local tracker = not self._is_extension and self._unit:movement() and self._unit:movement():nav_tracker()

		managers.groupai:state():register_AI_attention_object(self._parent_unit or self._unit, self, tracker)

		self._registered = true
		self._register_key = (self._parent_unit or self._unit):key()

		self:set_update_enabled(true)
	end
end

function AIAttentionObject:_unregister()
	if not self._registered then
		debug_pause_unit(self._unit, "[AIAttentionObject:_unregister] Wasn't registered? ", self._parent_unit, self._unit)

		return
	end

	self._registered = nil

	managers.groupai:state():unregister_AI_attention_object(self._register_key)
	self:_call_listeners()

	self._register_key = nil

	self:set_update_enabled(false)
end

function AIAttentionObject:_chk_update_registered_state()
	if not self._attention_data or not managers.groupai:state():enemy_weapons_hot() then
		return
	end

	if self._registered then
		if self:is_attention_irrelevant_for_weapons_hot() then
			self:_unregister()
		end
	elseif not self:is_attention_irrelevant_for_weapons_hot() then
		self:_register()
	end
end

function AIAttentionObject:is_attention_irrelevant_for_weapons_hot()
	if not self._is_extension then
		return false
	end

	local overrides = self._overrides
	local react_requirement = self.REACT_SHOOT

	if overrides then
		for id, settings in pairs(overrides) do
			if react_requirement <= settings.reaction then
				return false
			end
		end
	end

	for id, settings in pairs(self._attention_data) do
		if (not overrides or not overrides[id]) and react_requirement <= settings.reaction then
			return false
		end
	end

	return true
end

function AIAttentionObject:on_enemy_weapons_hot()
	if self._registered and self:is_attention_irrelevant_for_weapons_hot() then
		self:_unregister()
	end
end

function AIAttentionObject:link(parent_unit, obj_name, local_pos)
	self._unit:unlink()

	if parent_unit then
		self._parent_unit = parent_unit
		self._parent_obj_name = obj_name
		self._local_pos = local_pos
		self._parent_unit_key = parent_unit:key()

		self._unit:body(0):set_enabled(false)
		self._unit:set_moving()

		local parent_obj = parent_unit:get_object(Idstring(obj_name))
		local parent_pos = parent_obj:position()
		local parent_rot = parent_obj:rotation()
		local att_obj_w_pos = local_pos:rotate_with(parent_rot) + parent_pos

		parent_unit:link(Idstring(obj_name), self._unit)
		self._unit:set_position(att_obj_w_pos)

		if Network:is_server() then
			if self._parent_unit:id() == -1 then
				debug_pause_unit(self._parent_unit, "[AIAttentionObject:set_parent_unit] attention object parent is not network synched", self._parent_unit)
			end

			managers.network:session():send_to_peers_synched("link_attention_no_rot", self._parent_unit, self._unit, obj_name, local_pos)
		end

		if self._registered then
			self:_unregister()
			self:_register()
			self:_call_listeners()
		end

		self:set_update_enabled(true)
	else
		local had_parent = self._parent_unit
		self._parent_unit = nil
		self._parent_obj_name = nil
		self._local_pos = nil
		self._parent_unit_key = nil

		if Network:is_server() then
			managers.network:session():send_to_peers_synched("unlink_attention", self._unit)
		end

		if had_parent and self._registered then
			self:_unregister()
			self:_register()
			self:_call_listeners()
		end

		self:set_update_enabled(false)
	end
end

function AIAttentionObject:set_team(team)
	local call_listeners = self._team ~= team or team and team.id ~= self._team.id
	self._team = team

	if self._attention_data then
		for id, setting in pairs(self._attention_data) do
			setting.team = team
		end
	end

	if self._overrides then
		for id, setting in pairs(self._overrides) do
			setting.team = team
		end
	end

	self:_call_listeners()
end

function AIAttentionObject:save(data)
	if alive(self._parent_unit) then
		data.parent_u_id = self._parent_unit:unit_data().unit_id
		data.parent_obj_name = self._parent_obj_name
		data.local_pos = self._local_pos
	end
end

function AIAttentionObject:load(data)
	if not data or not data.parent_u_id then
		return
	end

	local parent_unit = nil

	if Application:editor() then
		parent_unit = managers.editor:unit_with_id(data.parent_u_id)
	else
		parent_unit = managers.worlddefinition:get_unit_on_load(data.parent_u_id, callback(self, self, "clbk_load_parent_unit"))
	end

	if parent_unit then
		self:link(parent_unit, data.parent_obj_name, data.local_pos)
	elseif not Application:editor() then
		self._load_data = data
	else
		debug_pause_unit(self._unit, "[AIAttentionObject:load] failed to link", self._unit)
	end
end

function AIAttentionObject:clbk_load_parent_unit(parent_unit)
	if parent_unit then
		self:link(parent_unit, self._load_data.parent_obj_name, self._load_data.local_pos)
	end

	self._load_data = nil
end

function AIAttentionObject:destroy()
	self:set_attention(nil)

	local extensions = self._unit:extensions()
	local last_extension_name = extensions[#extensions]
	local last_extension = self._unit[last_extension_name]

	if self == last_extension then
		self._unit:base():pre_destroy(self._unit)
	end
end
