ShieldBase = ShieldBase or class(UnitBase)

function ShieldBase:init(unit)
	ShieldBase.super.init(self, unit, false)
end

function ShieldBase:get_use_data()
	return nil
end

function ShieldBase:request_use(t)
end

SyncedShieldBase = SyncedShieldBase or class(ShieldBase)

function SyncedShieldBase:init(...)
	SyncedShieldBase.super.init(self, ...)

	if Network:is_client() then
		self._unit:set_enabled(false)
	end
end

function SyncedShieldBase:save(data)
	SyncedShieldBase.super.save(self, data)

	if managers.enemy:is_shield_registered(self._unit) then
		data.SyncedShieldBase = {
			register_dropped_shield = true
		}
	end
end

function SyncedShieldBase:load(data)
	SyncedShieldBase.super.load(self, data)

	if data.SyncedShieldBase and data.SyncedShieldBase.register_dropped_shield then
		self._unit:set_enabled(true)
		managers.enemy:register_shield(self._unit)
	end
end

local tmp_vec1 = Vector3()
ShieldFlashBase = ShieldFlashBase or class(SyncedShieldBase)
ShieldFlashBase._NET_EVENTS = {
	start_flash = 1
}

function ShieldFlashBase:init(...)
	ShieldFlashBase.super.init(self, ...)

	self._flash_charge_cooldown_t = 0
	local shield_tweak_data = self._shield_tweak_name and tweak_data.group_ai.flash_shields[self._shield_tweak_name]

	if not shield_tweak_data then
		if self._shield_tweak_name then
			Application:error("[ShieldFlashBase:init] No tweak data found for tweak id '" .. self._shield_tweak_name .. "' defined in unit. Falling back to default tweak data.", self._unit)
		else
			Application:error("[ShieldFlashBase:init] No _shield_tweak_name variable defined in unit. Falling back to default tweak data.", self._unit)
		end

		shield_tweak_data = tweak_data.group_ai.flash_shields.default
	end

	self._shield_tweak_data = shield_tweak_data
	self._flash_range = shield_tweak_data.flash_range
	self._flash_range_min = shield_tweak_data.flash_range_min
	self._flash_shape = shield_tweak_data.flash_shape or "cylinder"
	self._flash_shape_radius = shield_tweak_data.flash_shape_radius
	self._flash_slotmask = managers.slot:make_slot_mask(shield_tweak_data.flash_slotmask or "explosion_targets")
	self._flash_effect = shield_tweak_data.flash_effect and Idstring(shield_tweak_data.flash_effect) or nil
	self._flash_sound = shield_tweak_data.flash_sound
	self._flash_charge_range = shield_tweak_data.flash_charge_range
	self._flash_charge_timer = shield_tweak_data.flash_charge_timer
	self._flash_charge_cooldown = shield_tweak_data.flash_charge_cooldown or 0
	self._flash_charge_stun_range = shield_tweak_data.flash_charge_stun_range
	self._flash_charge_stun_slotmask = managers.slot:make_slot_mask(shield_tweak_data.flash_charge_stun_slotmask or "explosion_targets")
	self._flash_charge_stun_effect = shield_tweak_data.flash_charge_stun_effect or nil
	self._flash_charge_stun_sound = shield_tweak_data.flash_charge_stun_sound
	self._flash_charge_stun_sound_explosion = shield_tweak_data.flash_charge_stun_sound_explosion or "no_sound"
	self._beep_speeds = shield_tweak_data.beep_speeds
	self._beep_effect = shield_tweak_data.beep_effect and Idstring(shield_tweak_data.beep_effect) or nil
	self._beep_sound = shield_tweak_data.beep_sound
	local light_data = shield_tweak_data.beep_light_data
	self._beep_light_data = light_data
	local light_par_obj_str = self._effect_parent_obj_name or "e_01"
	local parent_obj = self._unit:get_object(Idstring(light_par_obj_str))

	if not parent_obj then
		Application:error("[ShieldFlashBase:init] No effect parent object with name '" .. light_par_obj_str .. "' found in unit. Falling back to orientation object.", self._unit)

		parent_obj = self._unit:orientation_object()
	end

	self._effect_parent_obj = parent_obj

	if light_data then
		local light = World:create_light(light_data.type_str)
		self._beep_light_obj = light

		light:link(parent_obj)
		light:set_far_range(light_data.range)
		light:set_color(light_data.color)
		light:set_specular_multiplier(light_data.specular_mul)
		light:set_multiplier(0)
		light:set_falloff_exponent(light_data.falloff_exp)
		light:set_enable(false)

		self._beep_light_mul = 0
		self._beep_light_range = light_data.range
		self._beep_light_mul_beep = light_data.beep_mul
		self._beep_light_fade_speed = light_data.beep_fade_speed
	end

	if self._flash_sound or self._flash_charge_stun_sound or self._beep_sound then
		self._snd_src = self._unit:sound_source()

		if not self._snd_src then
			self._snd_src_dispose = true
			self._snd_src = SoundDevice:create_source("ShieldFlashBase")

			self._snd_src:link(parent_obj)
		end
	end
end

function ShieldFlashBase:get_use_data()
	return Network:is_server() and {
		range = self._flash_charge_range,
		cooldown = self._flash_charge_cooldown_t
	} or nil
end

function ShieldFlashBase:request_use(t)
	t = t or TimerManager:game():time()

	if not Network:is_server() or t < self._flash_charge_cooldown_t then
		return
	end

	self._flash_charge_cooldown_t = t + self._flash_charge_cooldown

	self:_start_flash()

	return self._flash_charge_cooldown_t
end

function ShieldFlashBase:sync_net_event(event_id)
	if event_id == self._NET_EVENTS.start_flash then
		self:_start_flash()
	end
end

function ShieldFlashBase:is_charging()
	return self._charge_upd_enabled
end

function ShieldFlashBase:_start_flash()
	if self._unit:damage() and self._unit:damage():has_sequence("verify_start_flash") then
		self._unit:damage():run_sequence_simple("verify_start_flash")
	end
end

function ShieldFlashBase:_flash()
	if self._unit:damage() and self._unit:damage():has_sequence("verify_flash") then
		self._unit:damage():run_sequence_simple("verify_flash")
	end
end

function ShieldFlashBase:clbk_seq_flash_start(parent_obj)
	if self:is_charging() then
		return
	end

	if parent_obj and parent_obj ~= self._effect_parent_obj then
		if self._snd_src then
			self._snd_src:link(parent_obj)
		end

		if self._beep_light_obj then
			self._beep_light_obj:unlink()
			self._beep_light_obj:link(parent_obj)
		end

		self._effect_parent_obj = parent_obj
	end

	if Network:is_server() then
		managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", self._NET_EVENTS.start_flash)
	end

	self._timer = self._flash_charge_timer

	self:_beep()

	if self._beep_light_obj then
		self._beep_light_obj:set_enable(true)

		self._beep_light_mul = math.clamp(self._beep_light_mul - self._beep_light_fade_speed, 0, 1)

		self._beep_light_obj:set_multiplier(self._beep_light_mul)
		self._beep_light_obj:set_far_range(self._beep_light_range * self._beep_light_mul)
	end

	self._charge_upd_enabled = true

	self._unit:set_extension_update_enabled(Idstring("base"), true)
end

function ShieldFlashBase:clbk_seq_flash(pos, dir)
	if self._beep_light_obj then
		self._beep_light_mul = 0

		self._beep_light_obj:set_multiplier(0)
		self._beep_light_obj:set_far_range(self._beep_light_range)
		self._beep_light_obj:set_enable(false)
	end

	if self._charge_upd_enabled then
		self._charge_upd_enabled = nil

		self._unit:set_extension_update_enabled(Idstring("base"), false)
	end

	if self._snd_src and self._flash_sound then
		self._snd_event_flash = self._snd_src:post_event(self._flash_sound, callback(self, self, "_clbk_snd_event_end", "flash"), nil, "end_of_event")
	end

	if self._flash_effect then
		World:effect_manager():spawn({
			effect = self._flash_effect,
			parent = self._effect_parent_obj
		})
	end

	local range = self._flash_range

	self:_flash_local_player(pos, dir, range)

	if Network:is_server() then
		managers.explosion:detect_and_stun({
			damage = 0,
			curve_pow = 1,
			alert_radius = 10000,
			player_damage = 0,
			hit_pos = pos,
			to_pos = pos + dir * range,
			range = range,
			radius = self._flash_shape_radius,
			shape = self._flash_shape,
			collision_slotmask = self._flash_slotmask,
			ignore_unit = self._unit:parent(),
			user = self._unit:parent(),
			owner = self._unit,
			verify_callback = callback(self, self, "_can_flash_unit")
		})
	end
end

function ShieldFlashBase:clbk_seq_chk_interrupt_flash(parent_obj)
	if not self._charge_upd_enabled or parent_obj ~= self._effect_parent_obj then
		return
	end

	self._charge_upd_enabled = nil

	self._unit:set_extension_update_enabled(Idstring("base"), false)

	if self._beep_light_obj then
		self._beep_light_mul = 0

		self._beep_light_obj:set_multiplier(0)
		self._beep_light_obj:set_far_range(self._beep_light_range)
		self._beep_light_obj:set_enable(false)
	end

	if self._snd_src and self._flash_charge_stun_sound then
		self._snd_event_stun = self._snd_src:post_event(self._flash_charge_stun_sound, callback(self, self, "_clbk_snd_event_end", "stun"), nil, "end_of_event")
	end
end

function ShieldFlashBase:clbk_seq_chk_interrupt_flash_hit(pos, normal, attacker_unit)
	local was_charging = self._charge_upd_enabled

	self:clbk_seq_chk_interrupt_flash(self._effect_parent_obj)

	if was_charging then
		attacker_unit = alive(attacker_unit) and attacker_unit or nil

		self:_do_counter_stun(pos, normal, attacker_unit)
	end
end

function ShieldFlashBase:_do_counter_stun(pos, normal, attacker_unit, range_mul)
	local range = self._flash_range * (range_mul or 1)
	local slot_mask = self._flash_charge_stun_slotmask
	local effect_params = {
		camera_shake_max_mul = 4,
		effect = self._flash_charge_stun_effect,
		sound_event = self._flash_charge_stun_sound_explosion,
		feedback_range = range * 2
	}

	managers.explosion:play_sound_and_effects(pos, normal, range, effect_params)

	if Network:is_server() then
		managers.explosion:detect_and_stun({
			damage = 0,
			curve_pow = 1,
			player_damage = 0,
			alert_radius = 10000,
			hit_pos = pos,
			range = range,
			collision_slotmask = slot_mask,
			user = attacker_unit or nil,
			verify_callback = callback(self, self, "_can_stun_unit", self._unit:parent() and self._unit:parent():key())
		})
	end
end

function ShieldFlashBase:_can_stun_unit(parent_key, unit)
	if unit:key() == parent_key then
		return true
	end

	return self:_can_flash_unit(unit)
end

function ShieldFlashBase:_can_flash_unit(unit)
	if unit:brain() and unit:brain().is_hostage and unit:brain():is_hostage() then
		return false
	end

	local base_ext = unit:base()

	if base_ext and base_ext.char_tweak and base_ext:char_tweak().immune_to_concussion then
		return false
	end

	return true
end

function ShieldFlashBase:_flash_local_player(detonate_pos, dir, range)
	local player_unit = managers.player:player_unit()

	if not player_unit then
		return
	end

	local head_pos = player_unit:movement():m_head_pos()

	if self._flash_shape == "cylinder" then
		mvector3.set(tmp_vec1, head_pos)
		mvector3.subtract(tmp_vec1, detonate_pos)

		local dot = dir:dot(tmp_vec1)

		if dot > 0 and dot < range then
			mvector3.set(tmp_vec1, dir)
			mvector3.multiply(tmp_vec1, range)
			mvector3.add(tmp_vec1, detonate_pos)

			if self._flash_shape_radius < math.distance_to_segment(head_pos, detonate_pos, tmp_vec1) then
				return
			end
		else
			return
		end
	else
		return
	end

	local ignore_units = {
		self._unit
	}
	local parent = self._unit:parent()

	if parent then
		table.insert(ignore_units, parent)
	end

	local affected, line_of_sight, travel_dis, linear_dis = QuickFlashGrenade._chk_dazzle_local_player(self, detonate_pos, range, ignore_units)

	if affected then
		managers.environment_controller:set_flashbang(detonate_pos, line_of_sight, travel_dis, linear_dis, tweak_data.character.flashbang_multiplier, true, true)
	end
end

function ShieldFlashBase:update(unit, t, dt)
	if not self._charge_upd_enabled then
		return
	end

	self._timer = self._timer - dt
	self._beep_t = self._beep_t - dt

	if self._beep_t < 0 then
		self:_beep()
	end

	if alive(self._beep_light_obj) then
		self._beep_light_mul = math.clamp(self._beep_light_mul - dt * self._beep_light_fade_speed, 0, 1)

		self._beep_light_obj:set_multiplier(self._beep_light_mul)
		self._beep_light_obj:set_far_range(self._beep_light_range * self._beep_light_mul)
	end

	if self._timer <= 0 then
		self:_flash()
	end
end

function ShieldFlashBase:_beep()
	if self._beep_effect then
		World:effect_manager():spawn({
			effect = self._beep_effect,
			parent = self._effect_parent_obj
		})
	end

	if self._snd_src and self._beep_sound then
		self._snd_event_beep = self._snd_src:post_event(self._beep_sound, callback(self, self, "_clbk_snd_event_end", "beep"), nil, "end_of_event")
	end

	self._beep_t = self:_get_next_beep_time(self._beep_speeds)
	self._beep_light_mul = self._beep_light_mul_beep
end

function ShieldFlashBase:_get_next_beep_time(speeds)
	return self._timer / speeds[1] * speeds[2]
end

function ShieldFlashBase:_clbk_snd_event_end(event_type)
	local event = self["_snd_event" .. event_type]

	if event then
		self["_snd_event" .. event_type] = nil

		event:stop()

		if self._del_src_on_event_end then
			self:destroy_sound_source()
		end
	end
end

function ShieldFlashBase:pre_destroy(...)
	ShieldFlashBase.super.pre_destroy(self, ...)

	self._charge_upd_enabled = nil

	self:destroy_light()
	self:destroy_sound_source()
end

function ShieldFlashBase:destroy(...)
	ShieldFlashBase.super.destroy(self, ...)

	self._charge_upd_enabled = nil

	self:destroy_light()
	self:destroy_sound_source()
end

function ShieldFlashBase:destroy_light()
	local light = self._beep_light_obj
	self._beep_light_obj = nil

	if light then
		World:delete_light(light)
	end
end

function ShieldFlashBase:destroy_sound_source()
	if not self._snd_src_dispose then
		return
	end

	local sound_source = self._snd_src

	if sound_source then
		if self._snd_event_flash or self._snd_event_stun or self._snd_event_beep then
			self._del_src_on_event_end = true
		else
			self._snd_src = nil
			self._del_src_on_event_end = nil

			sound_source:stop()
			sound_source:delete()
		end
	end
end
