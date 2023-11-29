local tmp_vec1 = Vector3()
QuickSmokeGrenade = QuickSmokeGrenade or class()

function QuickSmokeGrenade:init(unit)
	self._unit = unit
	self._state = 0

	unit:set_visible(false)
end

function QuickSmokeGrenade:update(unit, t, dt)
	if self._remove_t then
		if self._remove_t < t then
			self._unit:set_slot(0)
		end

		return
	end

	if self._state == 1 then
		self._timer = self._timer - dt

		if self._timer <= 0 then
			self._timer = self._timer + 0.2
			self._state = 2

			self:_play_sound_and_effects()
		end
	elseif self._state == 2 then
		self._timer = self._timer - dt

		if self._timer <= 0 then
			self._timer = self._timer + 0.3
			self._state = 3

			self:_play_sound_and_effects()
		end
	elseif self._state == 3 then
		self._timer = self._timer - dt

		if self._timer <= 0 then
			self._state = 4

			self:detonate()
		end
	end
end

function QuickSmokeGrenade:activate(position, duration)
	self:_activate(1, 0.5, position, duration)
end

function QuickSmokeGrenade:activate_immediately(position, duration)
	self._unit:set_visible(true)
	self:_activate(4, 0, position, duration)
end

function QuickSmokeGrenade:_activate(state, timer, position, duration)
	self._state = state
	self._timer = timer
	self._shoot_position = position
	self._duration = duration

	if state == 4 then
		self:detonate()
	else
		self:_play_sound_and_effects()
	end
end

function QuickSmokeGrenade:detonate()
	self:_play_sound_and_effects()

	self._remove_t = TimerManager:game():time() + self._duration
end

function QuickSmokeGrenade:sound_playback_complete_clbk(event_instance, sound_source, event_type, sound_source_again)
end

function QuickSmokeGrenade:preemptive_kill()
	self._unit:sound_source():post_event("grenade_gas_stop")
	self._unit:set_slot(0)
end

function QuickSmokeGrenade:_play_sound_and_effects()
	if self._state == 1 then
		if self._shoot_position then
			local sound_source = SoundDevice:create_source("grenade_fire_source")

			sound_source:set_position(self._shoot_position)
			sound_source:post_event("grenade_gas_npc_fire")
		end
	elseif self._state == 2 then
		if self._shoot_position then
			local bounce_point = tmp_vec1

			self._unit:m_position(bounce_point)
			mvector3.lerp(bounce_point, self._shoot_position, bounce_point, 0.65)

			local sound_source = SoundDevice:create_source("grenade_bounce_source")

			sound_source:set_position(bounce_point)
			sound_source:post_event("grenade_gas_bounce", callback(self, self, "sound_playback_complete_clbk"), sound_source, "end_of_event")
		else
			self._unit:sound_source():post_event("grenade_gas_bounce")
		end
	elseif self._state == 3 then
		self._unit:set_visible(true)
	elseif self._state == 4 then
		World:effect_manager():spawn({
			effect = Idstring("effects/particles/explosions/explosion_smoke_grenade"),
			position = self._unit:position(),
			normal = self._unit:rotation():y()
		})
		self._unit:sound_source():post_event("grenade_gas_explode")

		local parent = self._unit:orientation_object()
		self._smoke_effect = World:effect_manager():spawn({
			effect = Idstring("effects/particles/explosions/smoke_grenade_smoke"),
			parent = parent
		})
	end
end

function QuickSmokeGrenade:destroy()
	if self._smoke_effect then
		World:effect_manager():fade_kill(self._smoke_effect)

		self._smoke_effect = nil
	end
end
