CopActionIdle = CopActionIdle or class()
local mvec3_set = mvector3.set
local mvec3_sub = mvector3.subtract
local tmp_vec = Vector3()

function CopActionIdle:init(action_desc, common_data)
	if action_desc.non_persistent then
		return
	end

	self._common_data = common_data
	self._unit = common_data.unit
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_base = common_data.ext_base
	self._ext_brain = common_data.ext_brain
	self._body_part = action_desc.body_part
	self._machine = common_data.machine
	local res = nil

	if self._body_part == 3 then
		if self._ext_anim.upper_body_active and not self._ext_anim.upper_body_empty then
			res = self._ext_movement:play_redirect("up_idle")
		end
	elseif action_desc.anim then
		local state_name = self._machine:index_to_state_name(action_desc.anim)
		res = self._ext_movement:play_state_idstr(state_name, action_desc.start_anim_time)

		if not res then
			Application:error("[CopActionIdle:init] Failed drop-in state redirect.")
		end
	elseif not self._ext_anim.idle then
		if self._ext_anim.needs_idle then
			res = self._ext_movement:play_redirect("exit")
		else
			res = self._ext_movement:play_redirect("idle")
		end

		self._ext_movement:enable_update()
	end

	if res == false then
		local seg_ids_name = self._body_part == 3 and Idstring("upper_body") or Idstring("base")

		debug_pause_unit(self._unit, "[CopActionIdle:init] idle failed in", self._machine:segment_state(seg_ids_name), self._unit)

		return
	end

	self._is_cool = common_data.is_cool
	self._skipped_frames = 0

	self:on_attention(common_data.attention)

	if Network:is_server() and (self._body_part == 1 or self._body_part == 2) then
		local stand_rsrv = self._ext_brain:get_pos_rsrv("stand")

		if not stand_rsrv or mvector3.distance_sq(stand_rsrv.position, common_data.pos) > 400 then
			self._ext_brain:add_pos_rsrv("stand", {
				radius = 30,
				position = mvector3.copy(common_data.pos)
			})
		end
	end

	if action_desc.sync then
		self._common_data.ext_network:send("action_idle_start", self._body_part)
	end

	self:_init_ik()

	return true
end

function CopActionIdle:_init_ik(...)
	if self._body_part ~= 1 and self._body_part ~= 3 then
		return
	end

	CopActionAct._init_ik(self, ...)
end

function CopActionIdle:_ik_update_func(...)
	CopActionAct._ik_update_func(self, ...)
end

function CopActionIdle:_update_ik_type(...)
	CopActionAct._update_ik_type(self, ...)
end

function CopActionIdle:_set_ik_modifier_state(...)
	CopActionAct._set_ik_modifier_state(self, ...)
end

function CopActionIdle:on_exit()
	self:_set_ik_modifier_state(false)
end

function CopActionIdle:update(t)
	local vis_state = self._ext_base:lod_stage()
	vis_state = vis_state or 4

	if vis_state == 1 then
		-- Nothing
	elseif self._skipped_frames < vis_state then
		self._skipped_frames = self._skipped_frames + 1

		return
	else
		self._skipped_frames = 1
	end

	if self._ik_update then
		self._ik_update(t)
	end

	local rot_target_spin = nil

	if self._m_attention_head_pos and self._turn_allowed or self._start_fwd then
		local active_actions = self._common_data.active_actions
		local queued_actions = self._common_data.queued_actions

		if not active_actions[1] and (not active_actions[2] or active_actions[2]:type() == "idle") and (not queued_actions or not queued_actions[1] and not queued_actions[2]) and not self._ext_movement:chk_action_forbidden("walk") then
			if self._m_attention_head_pos and self._turn_allowed then
				self._m_head_pos = self._m_head_pos or self._ext_movement:m_head_pos()
				local look_from_pos = self._m_head_pos
				local target_vec = tmp_vec

				mvec3_set(target_vec, self._m_attention_head_pos)
				mvec3_sub(target_vec, look_from_pos)

				local spin = target_vec:to_polar_with_reference(self._common_data.fwd, math.UP).spin

				if math.abs(spin) > 40 then
					rot_target_spin = spin

					if self._common_data.is_cool then
						self._start_fwd = self._start_fwd or mvector3.copy(self._common_data.fwd)
					end
				end
			elseif self._start_fwd then
				if self._common_data.is_cool then
					rot_target_spin = self._start_fwd:to_polar_with_reference(self._common_data.fwd, math.UP).spin
				end

				self._start_fwd = nil
			end
		end
	end

	if rot_target_spin then
		local new_action_data = {
			body_part = 2,
			type = "turn",
			angle = rot_target_spin
		}

		self._ext_movement:action_request(new_action_data)
	end
end

function CopActionIdle:type()
	return "idle"
end

function CopActionIdle:on_attention(attention)
	if self._body_part ~= 1 and self._body_part ~= 3 then
		return
	end

	CopActionAct.on_attention(self, attention)

	if self._is_cool or self._body_part ~= 3 or not Network:is_client() then
		return
	end

	local turn_allowed = nil

	if attention then
		if attention.handler then
			turn_allowed = AIAttentionObject.REACT_IDLE < attention.reaction
		elseif attention.unit or attention.pos then
			turn_allowed = true
		end
	end

	self._turn_allowed = turn_allowed
end

function CopActionIdle:need_upd()
	return (self._look_trans or self._start_fwd or self._attention and self._attention.unit) and true or false
end

function CopActionIdle:save(save_data)
	if self._body_part == 1 then
		save_data.is_save = true
		save_data.type = "idle"
		save_data.body_part = 1
		local state_name = self._machine:segment_state(Idstring("base"))
		local state_index = self._machine:state_name_to_index(state_name)
		save_data.anim = state_index
		save_data.start_anim_time = self._machine:segment_real_time(Idstring("base"))
	end
end
