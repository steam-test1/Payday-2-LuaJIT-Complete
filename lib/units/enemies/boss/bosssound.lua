BossSound = BossSound or class(CopSound)

function BossSound:init(unit)
	self._unit = unit
	self._speak_expire_t = 0
	self._events_map = self._events_map or {}
	local base_ext = unit:base()
	local char_tweak = base_ext:char_tweak()

	if char_tweak.spawn_sound_event then
		self._unit:sound():play(char_tweak.spawn_sound_event, nil, nil)
	end

	base_ext:post_init()
end

function BossSound:say(sound_name, sync, skip_prefix, important, clbk)
	local t = TimerManager:game():time()
	local unique_event_data = self._events_map[sound_name]

	if unique_event_data then
		if self._last_imp_speech_data and self._last_imp_speech_data.prio < unique_event_data.prio then
			return
		end

		if unique_event_data.cd_t and t <= unique_event_data.cd_t then
			return
		end
	elseif self._last_imp_speech_data then
		return
	end

	if self._last_speech then
		self._last_speech:stop()
	end

	local full_sound = nil

	if skip_prefix then
		full_sound = sound_name
	else
		full_sound = self._prefix .. sound_name
	end

	local event_id = nil

	if type(full_sound) == "number" then
		event_id = full_sound
		full_sound = nil
	end

	if sync then
		event_id = event_id or SoundDevice:string_to_id(full_sound)

		self._unit:network():send("say", event_id)
	end

	self._last_speech = self:_play(full_sound or event_id, nil, unique_event_data and callback(self, self, "_important_say_done") or nil)

	if not self._last_speech then
		self._last_imp_speech_data = nil

		return
	end

	self._last_imp_speech_data = unique_event_data or nil

	if unique_event_data then
		unique_event_data.cd_t = t + unique_event_data.cooldown
	end

	self._speak_expire_t = t + 2
end

function BossSound:_important_say_done()
	self._last_imp_speech_data = nil
end
