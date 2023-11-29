local tmp_vec = Vector3()
local tmp_rot = Rotation()
local mrot_set_ypr = mrotation.set_yaw_pitch_roll
CopActionTurn = CopActionTurn or class()
CopActionTurn.turn_dt_mul = 0.75
ShieldActionTurn = ShieldActionTurn or class(CopActionTurn)
ShieldActionTurn.turn_dt_mul = 0.5

function CopActionTurn:init(action_desc, common_data)
	self._common_data = common_data
	self._action_desc = action_desc
	self._unit = common_data.unit
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_base = common_data.ext_base
	self._ext_network = common_data.ext_network
	self._machine = common_data.machine

	if not action_desc.angle and (action_desc.direction or action_desc.rotation) then
		action_desc.angle = (action_desc.direction or action_desc.rotation:y()):to_polar_with_reference(common_data.fwd, math.UP).spin
	end

	if not action_desc.angle then
		debug_pause_unit(self._unit, "[CopActionTurn:init] No angle?", self._unit)

		return false
	end

	if not self._ext_anim.idle and not self._ext_anim.to_idle then
		self._ext_movement:play_redirect("idle")
	end

	if Network:is_server() then
		local stand_rsrv = common_data.ext_brain:get_pos_rsrv("stand")

		if not stand_rsrv or mvector3.distance_sq(stand_rsrv.position, common_data.pos) > 400 then
			self._reserved_position = mvector3.copy(common_data.pos)

			common_data.ext_brain:add_pos_rsrv("stand", {
				radius = 30,
				position = self._reserved_position
			})
		end
	end

	self._end_angle = action_desc.angle
	self._turn_left = action_desc.angle > 0
	local fwd_polar = common_data.fwd:to_polar()
	self._end_dir = fwd_polar:with_spin(fwd_polar.spin + action_desc.angle):to_vector()
	self._end_rot = Rotation()

	mrotation.set_look_at(self._end_rot, self._end_dir, math.UP)

	self._skipped_frames = 0
	self._timer = TimerManager:game()
	self._last_upd_t = self._timer:time() - 0.001

	self._ext_movement:enable_update()

	if action_desc.sync and Network:is_server() then
		local sync_yaw = self._end_rot:yaw()

		if sync_yaw < 0 then
			sync_yaw = 360 + sync_yaw
		end

		sync_yaw = math.ceil(255 * sync_yaw / 360)

		if sync_yaw == 0 then
			sync_yaw = 255
		end

		self._ext_network:send("action_turn", sync_yaw)
	end

	return true
end

function CopActionTurn:on_exit()
	if not self._expired and self._ext_anim.turn then
		self._ext_movement:play_redirect("idle")
	end
end

function CopActionTurn:update(t)
	local vis_state = self._ext_base:lod_stage() or 4

	if vis_state == 1 then
		-- Nothing
	elseif self._skipped_frames < vis_state then
		self._skipped_frames = self._skipped_frames + 1

		return
	else
		self._skipped_frames = 1
	end

	local dt = t - self._last_upd_t
	self._last_upd_t = self._timer:time()
	local new_rot = tmp_rot

	self._unit:m_rotation(new_rot)
	mrotation.slerp(new_rot, new_rot, self._end_rot, math.min(1, dt * 5 * self.turn_dt_mul))

	local new_fwd = tmp_vec

	mrotation.y(new_rot, tmp_vec)

	if new_fwd:dot(self._end_dir) < 0.98 then
		self._ext_movement:set_rotation(new_rot)

		if not self._ext_anim.turn and self._ext_anim.idle_full_blend then
			self:_play_turn_anim(new_fwd)
		end
	else
		self._ext_movement:set_rotation(self._end_rot)

		if self._ext_anim.turn then
			self._ext_movement:play_redirect("idle")
		end

		self._expired = true
	end

	if self._ext_anim.base_need_upd then
		self._ext_movement:upd_m_head_pos()
	end
end

function CopActionTurn:_play_turn_anim(new_fwd)
	local redir_res = self._ext_movement:play_redirect("turn_" .. (self._turn_left and "l" or "r"))

	if not redir_res then
		return
	end

	local abs_angle = math.abs(self._end_dir:to_polar_with_reference(new_fwd, math.UP).spin)

	if abs_angle > 135 then
		self._machine:set_parameter(redir_res, "angle135", 1)
	elseif abs_angle > 90 then
		local lerp = (abs_angle - 90) / 45

		self._machine:set_parameter(redir_res, "angle135", lerp)
		self._machine:set_parameter(redir_res, "angle90", 1 - lerp)
	elseif abs_angle > 45 then
		local lerp = (abs_angle - 45) / 45

		self._machine:set_parameter(redir_res, "angle90", lerp)
		self._machine:set_parameter(redir_res, "angle45", 1 - lerp)
	else
		self._machine:set_parameter(redir_res, "angle45", 1)
	end
end

function CopActionTurn:type()
	return "turn"
end

function CopActionTurn:expired()
	return self._expired
end

function CopActionTurn:need_upd()
	return true
end
