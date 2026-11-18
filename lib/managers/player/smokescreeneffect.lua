local mvec3_dist_sq = mvector3.distance_sq
local tmp_vec1 = Vector3()

SmokeScreenEffect = SmokeScreenEffect or class()
SmokeScreenEffect.DEFAULT_RADIUS = 400
SmokeScreenEffect.EFFECT_IDS = Idstring("effects/particles/explosions/smoke_screen")
SmokeScreenEffect.SOUND_EVENT_NAME = "lung_explode"
SmokeScreenEffect.SOUND_STOP_EVENT_NAME = "lung_loop_end"
SmokeScreenEffect.SOUND_DISPOSE_IDX = 0
SmokeScreenEffect.START_KILL_TIME = 2

function SmokeScreenEffect:init(position, normal, timer_override, has_dodge_bonus, grenade_unit)
	self._position = position
	self._radius = self.DEFAULT_RADIUS
	self._radius_sq = self._radius * self._radius
	self._dodge_bonus = has_dodge_bonus and managers.player:upgrade_value_by_level("player", "smoke_screen_ally_dodge_bonus", 1) or 0

	if self.SOUND_EVENT_NAME then
		self._sound_source = SoundDevice:create_source("SmokeScreenEffect")

		self._sound_source:set_position(position)
		self._sound_source:post_event(self.SOUND_EVENT_NAME)
	end

	if self.EFFECT_IDS then
		self._effect = World:effect_manager():spawn({
			effect = self.EFFECT_IDS,
			position = position,
			normal = normal
		})
	end

	if alive(grenade_unit) then
		self._grenade_unit = grenade_unit

		local base_ext = grenade_unit:base()

		if base_ext then
			self._variant = base_ext._projectile_entry
			self._tweak_entry = tweak_data.projectiles[self._variant]
			self._mine = base_ext:thrower_unit() == managers.player:player_unit()
		end
	end

	self._timer = timer_override or self._tweak_entry and self._tweak_entry.duration or tweak_data.projectiles.smoke_screen_grenade.duration
end

function SmokeScreenEffect:variant()
	return self._variant
end

function SmokeScreenEffect:tweak_entry()
	return self._tweak_entry
end

function SmokeScreenEffect:dodge_bonus()
	return self._dodge_bonus
end

function SmokeScreenEffect:position()
	return self._position
end

function SmokeScreenEffect:alive()
	return not not self._timer
end

function SmokeScreenEffect:mine()
	return self._mine
end

function SmokeScreenEffect:is_in_smoke(m_pos)
	local in_smoke = mvec3_dist_sq(m_pos, self._position) <= self._radius_sq

	return in_smoke, self._variant, self._tweak_entry
end

function SmokeScreenEffect:_dispose_of_sound()
	return
end

function SmokeScreenEffect:update(t, dt)
	if self._timer then
		self._timer = self._timer - dt

		if self._timer <= self.START_KILL_TIME then
			if self._effect then
				World:effect_manager():fade_kill(self._effect)

				self._effect = nil
			end

			if not self._sound_killed then
				self._sound_killed = true

				if self._sound_source then
					if self.SOUND_STOP_EVENT_NAME then
						self._sound_source:post_event(self.SOUND_STOP_EVENT_NAME)

						SmokeScreenEffect.SOUND_DISPOSE_IDX = SmokeScreenEffect.SOUND_DISPOSE_IDX + 1

						local clbk_id = "SmokeScreenEffect" .. SmokeScreenEffect.SOUND_DISPOSE_IDX

						managers.enemy:add_delayed_clbk(clbk_id, callback(self, self, "_dispose_of_sound", {
							sound_source = self._sound_source
						}), t + 4)

						self._sound_source = nil
					else
						self._sound_source:stop()

						self._sound_source = nil
					end
				end
			end
		end

		if self._timer <= 0 then
			self._timer = nil
		end
	end
end

function SmokeScreenEffect:destroy()
	if alive(self._grenade_unit) then
		if Network:is_server() or self._grenade_unit:id() == -1 then
			self._grenade_unit:set_slot(0)
		else
			self._grenade_unit:set_visible(false)
			self._grenade_unit:set_enabled(false)
		end
	end

	self._grenade_unit = nil

	if self._effect then
		World:effect_manager():fade_kill(self._effect)

		self._effect = nil
	end

	if self._sound_source then
		self._sound_source:stop()

		self._sound_source = nil
	end
end
