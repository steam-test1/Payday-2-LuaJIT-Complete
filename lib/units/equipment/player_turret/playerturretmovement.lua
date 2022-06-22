PlayerTurretMovement = PlayerTurretMovement or class()
local mvec3_dir = mvector3.direction
local tmp_rot1 = Rotation()
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()

function PlayerTurretMovement:init(unit)
	self._unit = unit
	self._head_obj = self._unit:get_object(Idstring("a_detect"))
	self._spin_obj = self._unit:get_object(Idstring(self.spin_obj_name))
	self._pitch_obj = self._unit:get_object(Idstring(self.pitch_obj_name))
	self._m_rot = unit:rotation()
	self._m_head_fwd = self._m_rot:y()
	self._unit_up = self._m_rot:z()
	self._unit_fwd = self._m_rot:y()
	self._m_head_pos = self._head_obj:position()

	self._unit:set_extension_update_enabled(Idstring("movement"), false)
end

function PlayerTurretMovement:post_init()
end

function PlayerTurretMovement:set_look_dir(direction)
	self:_upd_mutables()
	mvector3.set(self._m_head_fwd, direction)

	local look_rel_polar = self._m_head_fwd:to_polar_with_reference(self._unit_fwd, self._unit_up)

	self._spin_obj:set_local_rotation(Rotation(look_rel_polar.spin, 0, 0))
	self._pitch_obj:set_local_rotation(Rotation(0, look_rel_polar.pitch, 0))
	self._unit:set_moving(true)
end

function PlayerTurretMovement:get_look_dir()
	return self._m_head_fwd
end

function PlayerTurretMovement:get_spin_pitch()
	return self._spin_obj:local_rotation():yaw(), self._pitch_obj:local_rotation():pitch()
end

function PlayerTurretMovement:m_rot()
	return self._m_rot
end

function PlayerTurretMovement:m_pos()
	return self._m_head_pos
end

function PlayerTurretMovement:_upd_mutables()
	self._head_obj:m_position(self._m_head_pos)
	self._unit:m_rotation(self._m_rot)
	self._head_obj:m_rotation(tmp_rot1)
	mrotation.y(tmp_rot1, self._m_head_fwd)
	mrotation.y(self._m_rot, self._unit_fwd)
	mrotation.z(self._m_rot, self._unit_up)
end

function PlayerTurretMovement:switch_off()
	self._unit:set_extension_update_enabled(Idstring("movement"), true)
end

function PlayerTurretMovement:switch_on()
	self._unit:set_extension_update_enabled(Idstring("movement"), false)
end

function PlayerTurretMovement:update(unit, t, dt)
	local cur_pitch = self._pitch_obj:local_rotation():pitch()
	local new_pitch = math.step(cur_pitch, 0, 90 * dt)

	self._pitch_obj:set_local_rotation(Rotation(0, new_pitch, 0))
	self._unit:set_moving(true)

	if new_pitch == 0 then
		self._unit:set_extension_update_enabled(Idstring("movement"), false)
	end
end
