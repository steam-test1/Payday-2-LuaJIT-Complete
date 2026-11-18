local mvec3_set_stat = mvector3.set_static
local mrot_mul = mrotation.multiply
local mrot_set_ypr = mrotation.set_yaw_pitch_roll
local math_obj_to_light_rotation = math.obj_to_light_rotation
local mvec1 = Vector3()
local mrot1 = Rotation()
local mrot2 = Rotation()
local IDS_A_FLASHLIGHT = Idstring("a_flashlight")
local IDS_G_LIGHT = Idstring("g_light")
local IDS_BASE = Idstring("base")

WeaponFlashLight = WeaponFlashLight or class(WeaponGadgetBase)
WeaponFlashLight.GADGET_TYPE = "flashlight"
WeaponFlashLight.LIGHT_SETTINGS = {
	default = {
		far_range = 1000,
		light_type = "spot|specular|plane_projection",
		spot_angle_end = 60,
		start_mul = 2,
		texture = "units/lights/spot_light_projection_textures/spotprojection_11_flashlight_df",
		effect = Idstring("effects/particles/weapons/flashlight/fp_flashlight_multicolor"),
		effect_npc = Idstring("effects/particles/weapons/flashlight/flashlight_multicolor")
	},
	haunted = {
		far_range = 10000,
		light_type = "spot|specular|plane_projection",
		spot_angle_end = 60,
		start_mul = 2,
		texture = "units/lights/spot_light_projection_textures/spotprojection_22_flashlight_df",
		effect = Idstring("effects/particles/weapons/flashlight_spooky/fp_flashlight"),
		effect_npc = Idstring("effects/particles/weapons/flashlight_spooky/flashlight")
	}
}
WeaponFlashLight.HALLOWEEN_FLICKER = 1
WeaponFlashLight.HALLOWEEN_WARP = 2
WeaponFlashLight.HALLOWEEN_FROZEN = 3
WeaponFlashLight.HALLOWEEN_LAUGHTER = 4
WeaponFlashLight.HALLOWEEN_SPOOC = 5
WeaponFlashLight.HALLOWEEN_EVENTS = {
	{
		chance = 0.75,
		haunted_cooldown = 5,
		haunted_cooldown_var = 10,
		start_event_fn_name = "_start_flicker",
		stop_event_fn_name = "_stop_flicker",
		event_id = WeaponFlashLight.HALLOWEEN_FLICKER
	},
	{
		chance = 0.35,
		haunted_cooldown = 6,
		haunted_cooldown_var = 6,
		start_event_fn_name = "_start_warp",
		stop_event_fn_name = "_stop_warp",
		event_id = WeaponFlashLight.HALLOWEEN_WARP
	},
	{
		chance = 0.3,
		haunted_cooldown = 10,
		haunted_cooldown_var = 5,
		start_event_fn_name = "_start_frozen",
		stop_event_fn_name = "_stop_frozen",
		event_id = WeaponFlashLight.HALLOWEEN_FROZEN
	},
	{
		chance = 0.25,
		haunted_cooldown = 8,
		haunted_cooldown_var = 5,
		start_event_fn_name = "_start_laughter",
		stop_event_fn_name = "_stop_laughter",
		event_id = WeaponFlashLight.HALLOWEEN_LAUGHTER
	},
	{
		chance = 0.15,
		haunted_cooldown = 5,
		haunted_cooldown_var = 2,
		start_event_fn_name = "_start_spooc"
	},
	{
		chance = 1,
		haunted_cooldown = 3,
		haunted_cooldown_var = 5
	}
}
WeaponFlashLight.HALLOWEEN_EVENTS_START_TIME = 20
WeaponFlashLight.HALLOWEEN_EVENTS_START_TIME_VAR = 5

function WeaponFlashLight:init(unit)
	WeaponFlashLight.super.init(self, unit)

	self._on_event = "gadget_flashlight_on"
	self._off_event = "gadget_flashlight_off"

	local obj = self._unit:get_object(IDS_A_FLASHLIGHT)

	self._a_flashlight_obj = obj
	self._g_light = self._unit:get_object(IDS_G_LIGHT)

	self:_init_chk_haunted()

	self._theme = self:_get_base_theme()

	local settings = WeaponFlashLight.LIGHT_SETTINGS[self._theme] or WeaponFlashLight.LIGHT_SETTINGS.default

	self._light = World:create_light(settings.light_type, settings.texture)
	self._light_multiplier = settings.start_mul

	self._light:set_spot_angle_end(settings.spot_angle_end)
	self._light:set_far_range(settings.far_range)
	self._light:set_multiplier(self._light_multiplier)
	self._light:link(obj)

	local light_obj_rot = mrot1

	math_obj_to_light_rotation(obj, light_obj_rot)
	self._light:set_rotation(light_obj_rot)
	self._light:set_enable(false)

	local effect_manager = World:effect_manager()

	self._light_effect = effect_manager:spawn({
		force_synch = true,
		effect = settings.effect,
		parent = obj
	})

	effect_manager:set_hidden(self._light_effect, true)
	effect_manager:set_frozen(self._light_effect, true)
end

function WeaponFlashLight:_get_base_theme()
	return self._is_haunted and "haunted" or "default"
end

function WeaponFlashLight:is_haunted()
	return self._is_haunted
end

function WeaponFlashLight:_init_chk_haunted()
	if self._is_haunted ~= nil then
		return
	end

	local job_id = managers.job and managers.job:current_job_id()
	local tweak = job_id and tweak_data.narrative.jobs[job_id]

	self._is_haunted = tweak and tweak.is_halloween_level and true or false

	if self._is_haunted then
		self._light_speed = 1
		self._light_rotation = 0
		self._current_light_multiplier = self._light_multiplier
		self.update = self.update_haunted
		self._haunted_updator = self._update_spiral
	end
end

function WeaponFlashLight:set_npc()
	self._is_npc = true

	if self._light_effect then
		World:effect_manager():kill(self._light_effect)
	end

	local settings = WeaponFlashLight.LIGHT_SETTINGS[self._theme] or WeaponFlashLight.LIGHT_SETTINGS.default
	local effect_manager = World:effect_manager()

	self._light_effect = effect_manager:spawn({
		effect = settings.effect_npc,
		parent = self._a_flashlight_obj
	})

	effect_manager:set_hidden(self._light_effect, not self._on)

	local freeze = (self._frozen_t or not self._on) and true or false

	effect_manager:set_frozen(self._light_effect, freeze)

	self._haunted_timer = nil
end

function WeaponFlashLight:_check_state(current_state)
	WeaponFlashLight.super._check_state(self, current_state)
	self._light:set_enable(self._on)
	self._g_light:set_visibility(self._on)

	local effect_manager = World:effect_manager()

	effect_manager:set_hidden(self._light_effect, not self._on)

	local freeze = (self._frozen_t or not self._on) and true or false

	effect_manager:set_frozen(self._light_effect, freeze)

	if self._is_haunted and not self._is_npc and self._on and not self._haunted_timer then
		self._haunted_timer = self.HALLOWEEN_EVENTS_START_TIME + math.random(self.HALLOWEEN_EVENTS_START_TIME_VAR)
	end

	self._unit:set_extension_update_enabled(IDS_BASE, self._on)
end

function WeaponFlashLight:destroy(unit)
	WeaponFlashLight.super.destroy(self, unit)

	if alive(self._light) then
		World:delete_light(self._light)
	end

	self._light = nil

	if self._light_effect then
		World:effect_manager():kill(self._light_effect)

		self._light_effect = nil
	end
end

function WeaponFlashLight:update(unit, t, dt)
	self._a_flashlight_obj:m_position(mvec1)
	math_obj_to_light_rotation(self._a_flashlight_obj, mrot1)
	self._light:set_rotation(mrot1)
	self._light:set_final_position(mvec1)
end

WeaponFlashLight.EFFECT_OPACITY_MAX = 16
WeaponFlashLight.NPC_GLOW_OPACITY_MAX = 100
WeaponFlashLight.NPC_CONE_OPACITY_MAX = 8

function WeaponFlashLight:set_color(color)
	if self._is_haunted then
		return
	end

	if not color then
		return
	end

	local opacity_ids = Idstring("opacity")
	local col_vec = Vector3(color.r, color.g, color.b)

	self._light:set_color(col_vec)

	local effect_manager = World:effect_manager()

	if self._is_npc then
		effect_manager:set_simulator_var_float(self._light_effect, Idstring("glow base camera r"), opacity_ids, opacity_ids, color.r * WeaponFlashLight.NPC_GLOW_OPACITY_MAX)
		effect_manager:set_simulator_var_float(self._light_effect, Idstring("glow base camera g"), opacity_ids, opacity_ids, color.g * WeaponFlashLight.NPC_GLOW_OPACITY_MAX)
		effect_manager:set_simulator_var_float(self._light_effect, Idstring("glow base camera b"), opacity_ids, opacity_ids, color.b * WeaponFlashLight.NPC_GLOW_OPACITY_MAX)
		effect_manager:set_simulator_var_float(self._light_effect, Idstring("lightcone r"), opacity_ids, opacity_ids, color.r * WeaponFlashLight.NPC_CONE_OPACITY_MAX)
		effect_manager:set_simulator_var_float(self._light_effect, Idstring("lightcone g"), opacity_ids, opacity_ids, color.g * WeaponFlashLight.NPC_CONE_OPACITY_MAX)
		effect_manager:set_simulator_var_float(self._light_effect, Idstring("lightcone b"), opacity_ids, opacity_ids, color.b * WeaponFlashLight.NPC_CONE_OPACITY_MAX)
	else
		local r_ids = Idstring("red")
		local g_ids = Idstring("green")
		local b_ids = Idstring("blue")

		effect_manager:set_simulator_var_float(self._light_effect, r_ids, r_ids, opacity_ids, color.r * WeaponFlashLight.EFFECT_OPACITY_MAX)
		effect_manager:set_simulator_var_float(self._light_effect, g_ids, g_ids, opacity_ids, color.g * WeaponFlashLight.EFFECT_OPACITY_MAX)
		effect_manager:set_simulator_var_float(self._light_effect, b_ids, b_ids, opacity_ids, color.b * WeaponFlashLight.EFFECT_OPACITY_MAX)
	end
end

function WeaponFlashLight:color()
	local col = self._color_vec or self._light:color()

	return Color(col.x, col.y, col.z)
end

function WeaponFlashLight:sync_net_event(event_id)
	if not self._is_haunted then
		return
	end

	for _, event_data in ipairs(self.HALLOWEEN_EVENTS) do
		if event_id == event_data.event_id then
			if self._current_event_stop_fn_name then
				self[self._current_event_stop_fn_name](self)
			end

			self._current_event_stop_fn_name = event_data.stop_event_fn_name

			if event_data.start_event_fn_name then
				self[event_data.start_event_fn_name](self)
			end

			break
		end
	end
end

function WeaponFlashLight:update_haunted(unit, t, dt)
	if not self._is_npc then
		self:_update_haunted_timer(t, dt)
	end

	self:_haunted_updator(t, dt)
end

function WeaponFlashLight:_update_haunted_timer(t, dt)
	self._haunted_timer = self._haunted_timer - dt

	if self._haunted_timer > 0 then
		return
	end

	for _, event_data in ipairs(self.HALLOWEEN_EVENTS) do
		if event_data.chance >= 1 or event_data.chance > math.random() then
			self._haunted_timer = event_data.haunted_cooldown + math.random(event_data.haunted_cooldown_var)

			if event_data.start_event_fn_name then
				if self._current_event_stop_fn_name then
					self[self._current_event_stop_fn_name](self)
				end

				self._current_event_stop_fn_name = event_data.stop_event_fn_name

				if event_data.start_event_fn_name then
					self[event_data.start_event_fn_name](self)
				end
			end

			break
		end
	end
end

function WeaponFlashLight:_update_spiral(t, dt)
	self._a_flashlight_obj:m_position(mvec1)
	math_obj_to_light_rotation(self._a_flashlight_obj, mrot1)

	self._light_speed = math.step(self._light_speed, 1, dt * (math.random(4) + 2))
	self._light_rotation = self._light_rotation + dt * -50 * self._light_speed

	mrot_set_ypr(mrot2, self._light_rotation, 0, 0)
	mrot_mul(mrot1, mrot2)
	self._light:set_rotation(mrot1)
	self._light:set_final_position(mvec1)
end

function WeaponFlashLight:_clear_haunted()
	self._current_event_stop_fn_name = nil
	self._haunted_updator = self._update_spiral
end

function WeaponFlashLight:_start_flicker()
	self._flicker_t = 2 + math.random()
	self._current_light_multiplier = self._light_multiplier
	self._haunted_updator = self._update_flicker
end

function WeaponFlashLight:_stop_flicker()
	self._flicker_t = nil
	self._current_light_multiplier = nil

	self._light:set_multiplier(self._light_multiplier)
	self:_clear_haunted()
end

function WeaponFlashLight:_update_flicker(t, dt)
	self._flicker_t = self._flicker_t - dt

	if self._flicker_t <= 0 then
		self:_stop_flicker()
		self:_update_spiral(t, dt)

		return
	end

	if self._flicker_t > 0.15 then
		self._current_light_multiplier = math.clamp(self._current_light_multiplier + (math.rand(40) - 20) * dt, 0, 5)
	else
		self._current_light_multiplier = math.lerp(self._current_light_multiplier, self._light_multiplier, 1 - self._flicker_t * 4)
	end

	self._light:set_multiplier(self._current_light_multiplier)
	self:_update_spiral(t, dt)
end

function WeaponFlashLight:_start_warp()
	self._light_speed_warp = self._light_speed
	self._light_speed = math.random(30) + 15
	self._haunted_updator = self._update_warp
end

function WeaponFlashLight:_stop_warp()
	self._light_speed = self._light_speed_warp
	self._light_speed_warp = nil

	self:_clear_haunted()
end

function WeaponFlashLight:_update_warp(t, dt)
	self:_update_spiral(t, dt)

	if self._light_speed <= self._light_speed_warp then
		self:_stop_warp()
	end
end

function WeaponFlashLight:_start_frozen()
	self._frozen_t = 2 + math.random() * 2
	self._haunted_updator = self._update_frozen

	World:effect_manager():set_frozen(self._light_effect, true)
	self._light:m_position(mvec1)
	self._light:m_rotation(mrot1)
	self._light:unlink()
	self._light:set_rotation(mrot1)
	self._light:set_final_position(mvec1)
end

function WeaponFlashLight:_stop_frozen()
	self._frozen_t = nil

	World:effect_manager():set_frozen(self._light_effect, not self._on)
	self._light:link(self._a_flashlight_obj)
	self:_clear_haunted()
end

function WeaponFlashLight:_update_frozen(t, dt)
	self._frozen_t = self._frozen_t - dt

	if self._frozen_t <= 0 then
		self:_stop_frozen()
		self:_update_spiral(t, dt)
	end
end

function WeaponFlashLight:_start_laughter()
	self._laughter_t = 3 + math.random(3)
	self._color_vec = self._light:color()
	self._haunted_updator = self._update_laughter
end

function WeaponFlashLight:_stop_laughter()
	self._laughter_t = nil

	self._light:set_color(self._color_vec)

	self._color_vec = nil

	self:_clear_haunted()
end

function WeaponFlashLight:_update_laughter(t, dt)
	self._laughter_t = self._laughter_t - dt

	if self._laughter_t <= 0 then
		self:_stop_laughter()
		self:_update_spiral(t, dt)

		return
	end

	local math_sin = math.sin(self._laughter_t * 720)

	mvec3_set_stat(mvec1, 1, 0.6 + math_sin * 0.4, 0.7 + math_sin * 0.3)
	self._light:set_color(mvec1)

	math_sin = math.sin(self._laughter_t * 720) * math.sin(self._laughter_t * 90)

	local math_cos = math.cos(self._laughter_t * 720) * math.sin(self._laughter_t * 90)

	mvec3_set_stat(mvec1, -math_cos * 25, 0, math_sin * 25)
	self._light:set_local_position(mvec1)
end

function WeaponFlashLight:_start_spooc()
	if not self._is_npc then
		managers.player:on_hallowSPOOCed()
	end
end
