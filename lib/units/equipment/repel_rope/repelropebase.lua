RepelRopeBase = RepelRopeBase or class(UnitBase)

local tmpvec = Vector3()

function RepelRopeBase:init(unit)
	UnitBase.init(self, unit, false)

	self._unit = unit
	self._end_object = unit:get_object(Idstring(self._end_object_name))
end

function RepelRopeBase:update(unit, t, dt)
	if self._retracting then
		local prog = (t - self._retract_start_t) / self._retract_duration

		if prog > 1 then
			unit:set_slot(0)
		else
			prog = prog^3

			self._unit:m_position(tmpvec)
			mvector3.lerp(tmpvec, self._retract_pos, tmpvec, prog)
			self._end_object:set_position(tmpvec)
		end
	else
		self._attach_obj:m_position(tmpvec)
		self._end_object:set_position(tmpvec)
	end
end

function RepelRopeBase:setup(attach_object)
	self._attach_obj = attach_object

	self._unit:set_extension_update_enabled(Idstring("base"), true)
end

function RepelRopeBase:retract()
	if not self._retracting then
		self._retracting = true
		self._retract_start_t = TimerManager:game():time()
		self._retract_pos = self._attach_obj:position()

		self._unit:m_position(tmpvec)

		self._retract_duration = math.max(1, mvector3.distance(self._retract_pos, tmpvec)) / 600
	end
end
