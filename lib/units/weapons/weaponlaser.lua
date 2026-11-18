local mvec3_set = mvector3.set
local mvec3_set_stat = mvector3.set_static
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_step = mvector3.step
local mvec3_rot = mvector3.rotate_with
local mvec3_neg = mvector3.negate
local mvec3_lerp = mvector3.lerp
local mrot_x = mrotation.x
local mrot_y = mrotation.y
local mrot_set_look_at = mrotation.set_look_at
local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
local mvec4 = Vector3()
local mvec_l_dir = Vector3()
local mrot1 = Rotation()
local math_obj_to_light_rotation = math.obj_to_light_rotation
local IDS_BASE = Idstring("base")
local IDS_A_LASER = Idstring("a_laser")
local IDS_G_LASER = Idstring("g_laser")
local IDS_G_INDICATOR = Idstring("g_indicator")

WeaponLaser = WeaponLaser or class(WeaponGadgetBase)
WeaponLaser.GADGET_TYPE = "laser"
WeaponLaser._max_distance = 3000
WeaponLaser._scale_distance = 1000
WeaponLaser._themes = {
	default = {
		light = Vector3(0, 10, 0),
		glow = Vector3(0, 0.2, 0),
		brush = Color(0.05, 0, 1, 0)
	},
	cop_sniper = {
		light = Vector3(10, 0, 0),
		glow = Vector3(0.2, 0, 0),
		brush = Color(0.15, 1, 0, 0)
	},
	turret_module_active = {
		light = Vector3(10, 0, 0),
		glow = Vector3(0.2, 0, 0),
		brush = Color(0.15, 1, 0, 0)
	},
	turret_module_rearming = {
		light = Vector3(10, 0, 0),
		glow = Vector3(0.2, 0.2, 0),
		brush = Color(0.11, 1, 1, 0)
	},
	turret_module_mad = {
		light = Vector3(10, 0, 0),
		glow = Vector3(0, 0.2, 0),
		brush = Color(0.15, 0, 1, 0)
	}
}
WeaponLaser.LIGHT_SETTINGS = {
	light = {
		far_range = 75,
		near_range = 40,
		spot_angle_end = 3
	},
	light_glow = {
		far_range = 75,
		near_range = 40,
		spot_angle_end = 20
	}
}

function WeaponLaser:init(unit)
	WeaponLaser.super.init(self, unit)

	self._on_event = "gadget_laser_aim_on"
	self._off_event = "gadget_laser_aim_off"
	self._theme_type = "default"

	local obj = self._unit:get_object(IDS_A_LASER)

	self._laser_obj = obj
	self._g_laser = self._unit:get_object(IDS_G_LASER)
	self._g_indicator = self._unit:get_object(IDS_G_INDICATOR)

	local light_obj_rot = mrot1

	math_obj_to_light_rotation(obj, light_obj_rot)

	self._light = World:create_light("spot|specular")

	self._light:set_spot_angle_end(self.LIGHT_SETTINGS.light.spot_angle_end)
	self._light:set_far_range(self.LIGHT_SETTINGS.light.far_range)
	self._light:set_near_range(self.LIGHT_SETTINGS.light.near_range)
	self._light:link(obj)
	self._light:set_rotation(light_obj_rot)

	self._light_color = Vector3()

	mvec3_set(self._light_color, self._themes[self._theme_type].light)
	self._light:set_color(self._light_color)
	self._light:set_enable(false)

	self._light_glow = World:create_light("spot|specular")

	self._light_glow:set_spot_angle_end(self.LIGHT_SETTINGS.light_glow.spot_angle_end)
	self._light_glow:set_far_range(self.LIGHT_SETTINGS.light_glow.far_range)
	self._light_glow:set_near_range(self.LIGHT_SETTINGS.light_glow.near_range)

	self._light_glow_color = Vector3()

	mvec3_set(self._light_glow_color, self._themes[self._theme_type].glow)
	self._light_glow:set_color(self._light_glow_color)
	self._light_glow:link(obj)
	self._light_glow:set_rotation(light_obj_rot)
	self._light_glow:set_enable(false)

	self._slotmask = managers.slot:get_mask("bullet_impact_targets")
	self._brush = Draw:brush(self._themes[self._theme_type].brush, "VertexColor")

	self._brush:set_blend_mode("opacity_add")
end

function WeaponLaser:set_position(pos)
	self._custom_position = pos
end

function WeaponLaser:set_rotation(rot)
	self._custom_rotation = rot
end

function WeaponLaser:update(unit, t, dt)
	self:_update_laser(unit, t, dt, self._laser_obj, self._light, self._light_glow)

	self._custom_position = nil
	self._custom_rotation = nil
end

function WeaponLaser:_update_laser(unit, t, dt, laser_obj, light_obj, light_glow_obj)
	local rotation = self._custom_rotation

	if not rotation then
		rotation = mrot1

		laser_obj:m_rotation(rotation)
	end

	mrot_y(rotation, mvec_l_dir)

	local from = mvec1

	if self._custom_position then
		mvec3_set(from, laser_obj:local_position())
		mvec3_rot(from, rotation)
		mvec3_add(from, self._custom_position)
	else
		laser_obj:m_position(from)
	end

	local to = mvec2

	mvec3_set(to, mvec_l_dir)
	mvec3_mul(to, self._max_distance)
	mvec3_add(to, from)

	local ray = unit:raycast("ray", from, to, "slot_mask", self._slotmask, self._ray_ignore_units and "ignore_unit" or nil, self._ray_ignore_units)

	if ray then
		if not self._is_npc then
			local spot_distance = ray.distance / self._max_distance

			light_obj:set_spot_angle_end(math.lerp(1, 18, spot_distance))
			light_glow_obj:set_spot_angle_end(math.lerp(8, 80, spot_distance))

			local scale = (math.clamp(ray.distance, self._max_distance - self._scale_distance, self._max_distance) - (self._max_distance - self._scale_distance)) / self._scale_distance

			scale = 1 - scale

			light_obj:set_multiplier(scale)
			light_glow_obj:set_multiplier(scale * 0.1)
		end

		self._brush:cylinder(from, ray.position, self._is_npc and 0.5 or 0.25)

		local pos = mvec1

		mvec3_set(pos, mvec_l_dir)
		mvec3_mul(pos, 50)
		mvec3_neg(pos)
		mvec3_add(pos, ray.position)
		light_obj:set_final_position(pos)
		light_glow_obj:set_final_position(pos)
	else
		light_obj:set_position(to)
		light_glow_obj:set_position(to)
		self._brush:cylinder(from, to, self._is_npc and 0.5 or 0.25)
	end
end

function WeaponLaser:_check_state(current_state)
	WeaponLaser.super._check_state(self, current_state)
	self._light:set_enable(self._on)
	self._light_glow:set_enable(self._on)
	self._g_laser:set_visibility(self._on)
	self._g_indicator:set_visibility(self._on)
	self._unit:set_extension_update_enabled(IDS_BASE, self._on)
end

function WeaponLaser:set_npc()
	self._is_npc = true
end

function WeaponLaser:destroy(unit)
	WeaponLaser.super.destroy(self, unit)

	if alive(self._light) then
		World:delete_light(self._light)
	end

	if alive(self._light_glow) then
		World:delete_light(self._light_glow)
	end

	self._light = nil
	self._light_glow = nil
end

function WeaponLaser:set_color_by_theme(type)
	self._theme_type = type

	local theme = self._themes[type] or self._themes.default

	mvec3_set(self._light_color, theme.light)
	self._light:set_color(self._light_color)
	mvec3_set(self._light_glow_color, theme.glow)
	self._light_glow:set_color(self._light_glow_color)
	self._brush:set_color(theme.brush)
end

function WeaponLaser:theme_type()
	return self._theme_type
end

function WeaponLaser:set_color(color)
	if not color then
		return
	end

	self._color = color
	self._light_color = Vector3(color.r * 10, color.g * 10, color.b * 10)

	self._light:set_color(self._light_color)

	self._light_glow_color = Vector3(color.r * 0.2, color.g * 0.2, color.b * 0.2)

	self._light_glow:set_color(self._light_glow_color)
	self._brush:set_color(color)
end

function WeaponLaser:color()
	return self._color or tweak_data.custom_colors.defaults.laser
end

function WeaponLaser:set_max_distace(dis)
	self._max_distance = dis
end

function WeaponLaser:add_ray_ignore_unit(unit)
	self._ray_ignore_units = self._ray_ignore_units or {}

	table.insert(self._ray_ignore_units, unit)
end

WeaponMultiLaser = WeaponMultiLaser or class(WeaponLaser)
WeaponMultiLaser.GADGET_TYPE = "laser"

function WeaponMultiLaser:init(unit)
	WeaponLaser.super.init(self, unit)

	self._on_event = "gadget_laser_aim_on"
	self._off_event = "gadget_laser_aim_off"
	self._theme_type = "default"
	self._light_color = Vector3()

	mvec3_set(self._light_color, self._themes[self._theme_type].light)

	self._light_glow_color = Vector3()

	mvec3_set(self._light_glow_color, self._themes[self._theme_type].glow)

	local obj

	self._g_lasers = {}

	for _, obj_name in ipairs(self.g_lasers or {}) do
		obj = self._unit:get_object(Idstring(obj_name))

		if obj then
			table.insert(self._g_lasers, obj)
		else
			Application:error("[WeaponMultiLaser:init] No g_laser object found with name.", obj_name, self._unit)
		end
	end

	self._g_indicators = {}

	for _, obj_name in ipairs(self.g_indicators or {}) do
		obj = self._unit:get_object(Idstring(obj_name))

		if obj then
			table.insert(self._g_indicators, obj)
		else
			Application:error("[WeaponMultiLaser:init] No g_indicator object found with name.", obj_name, self._unit)
		end
	end

	self._lights = {}
	self._light_glows = {}
	self._laser_objs = {}

	for _, obj_name in ipairs(self.laser_objects or {}) do
		obj = self._unit:get_object(Idstring(obj_name))

		if obj then
			table.insert(self._laser_objs, obj)

			local light_obj_rot = mrot1

			math_obj_to_light_rotation(obj, light_obj_rot)

			local light = World:create_light("spot|specular")

			table.insert(self._lights, light)
			light:set_spot_angle_end(self.LIGHT_SETTINGS.light.spot_angle_end)
			light:set_far_range(self.LIGHT_SETTINGS.light.far_range)
			light:set_near_range(self.LIGHT_SETTINGS.light.near_range)
			light:link(obj)
			light:set_rotation(light_obj_rot)
			light:set_color(self._light_color)
			light:set_enable(false)

			local light_glow = World:create_light("spot|specular")

			table.insert(self._light_glows, light_glow)
			light_glow:set_spot_angle_end(self.LIGHT_SETTINGS.light_glow.spot_angle_end)
			light_glow:set_far_range(self.LIGHT_SETTINGS.light_glow.far_range)
			light_glow:set_near_range(self.LIGHT_SETTINGS.light_glow.near_range)
			light_glow:set_color(self._light_glow_color)
			light_glow:link(obj)
			light_glow:set_rotation(light_obj_rot)
			light_glow:set_enable(false)
		else
			Application:error("[WeaponMultiLaser:init] No laser object found with name.", obj_name, self._unit)
		end
	end

	self._slotmask = managers.slot:get_mask("bullet_impact_targets")
	self._brush = Draw:brush(self._themes[self._theme_type].brush, "VertexColor")

	self._brush:set_blend_mode("opacity_add")
end

function WeaponMultiLaser:update(unit, t, dt)
	for index, laser_obj in pairs(self._laser_objs) do
		self:_update_laser(unit, t, dt, laser_obj, self._lights[index], self._light_glows[index])
	end

	self._custom_position = nil
	self._custom_rotation = nil
end

function WeaponMultiLaser:_check_state(current_state)
	WeaponLaser.super._check_state(self, current_state)

	for _, light in ipairs(self._lights) do
		light:set_enable(self._on)
	end

	for _, light_glow in ipairs(self._light_glows) do
		light_glow:set_enable(self._on)
	end

	for _, g_laser in ipairs(self._g_lasers) do
		g_laser:set_visibility(self._on)
	end

	for _, g_indicator in ipairs(self._g_indicators) do
		g_indicator:set_visibility(self._on)
	end

	self._unit:set_extension_update_enabled(IDS_BASE, self._on)
end

function WeaponMultiLaser:set_color_by_theme(type)
	self._theme_type = type

	local theme = self._themes[type] or self._themes.default

	mvec3_set(self._light_color, theme.light)

	for _, light in ipairs(self._lights) do
		light:set_color(self._light_color)
	end

	mvec3_set(self._light_glow_color, theme.glow)

	for _, light_glow in ipairs(self._light_glows) do
		light_glow:set_color(self._light_glow_color)
	end

	self._brush:set_color(theme.brush)
end

function WeaponMultiLaser:set_color(color)
	if not color then
		return
	end

	self._color = color

	mvec3_set_stat(self._light_color, color.r * 10, color.g * 10, color.b * 10)

	for _, light in ipairs(self._lights) do
		light:set_color(self._light_color)
	end

	mvec3_set_stat(self._light_glow_color, color.r * 0.2, color.g * 0.2, color.b * 0.2)

	for _, light_glow in ipairs(self._light_glows) do
		light_glow:set_color(self._light_glow_color)
	end

	self._brush:set_color(color)
end

function WeaponMultiLaser:destroy(unit)
	WeaponLaser.super.destroy(self, unit)

	for _, light in ipairs(self._lights) do
		if alive(light) then
			World:delete_light(light)
		end
	end

	for _, light_glow in ipairs(self._light_glows) do
		if alive(light_glow) then
			World:delete_light(light_glow)
		end
	end

	self._lights = {}
	self._light_glows = {}
end

WatchLaser = WatchLaser or class(UnitBase)
WatchLaser.MAX_DISTANCE = 68

function WatchLaser:init(unit)
	WatchLaser.super.init(self, unit, false)

	self._active = false

	if self._laser_obj_name and self._impact_obj_name and self._impact_effect_name then
		self._laser_obj = self._unit:get_object(Idstring(self._laser_obj_name))
		self._impact_obj = self._unit:get_object(Idstring(self._impact_obj_name))
		self._impact_effect = self._unit:effect_spawner(Idstring(self._impact_effect_name))
	end

	if self._impact_sound_source_name then
		self._impact_sound_source = self._unit:sound_source(Idstring(self._impact_sound_source_name))
	end

	self._projectile_data = tweak_data.blackmarket.projectiles[self._tweak_projectile_entry or "laser_watch"]
	self._slotmask = managers.slot:get_mask("bullet_impact_targets")
end

function WatchLaser:set_enabled(enabled)
	local has_laser = not not self._impact_effect

	self._unit:set_extension_update_enabled(IDS_BASE, enabled and has_laser)

	local event = self._projectile_data.sounds and self._projectile_data.sounds[enabled and "activate" or "deactivate"]

	if event then
		self._unit:sound_source():post_event(event)
	end

	if not enabled and has_laser then
		self._active = false

		self._impact_effect:kill_effect()

		local event = self._projectile_data.sounds and self._projectile_data.sounds.impact_stop

		if event and self._impact_sound_source then
			self._impact_sound_source:post_event(event)
		end
	end
end

function WatchLaser:update(unit, t, dt)
	self._laser_obj:m_rotation(mrot1)
	mrot_x(mrot1, mvec_l_dir)

	local from = mvec1

	self._laser_obj:m_position(from)

	local to = mvec2

	mvec3_set(to, mvec_l_dir)
	mvec3_neg(to)
	mvec3_mul(to, self.MAX_DISTANCE)
	mvec3_add(to, from)

	local ray = self._unit:raycast("ray", from, to, "slot_mask", self._slotmask)

	if ray then
		mvec3_set(to, ray.position)
		mvec3_add(to, ray.normal)
		mrot_set_look_at(mrot1, ray.normal, math.UP)
		self._impact_obj:set_position(to)
		self._impact_obj:set_rotation(mrot1)

		if not self._active then
			self._active = true

			self._impact_effect:activate()

			local event = self._projectile_data.sounds and self._projectile_data.sounds.impact_start

			if event and self._impact_sound_source then
				self._impact_sound_source:post_event(event)
			end
		end
	elseif self._active then
		self._active = false

		self._impact_effect:kill_effect()

		local event = self._projectile_data.sounds and self._projectile_data.sounds.impact_stop

		if event and self._impact_sound_source then
			self._impact_sound_source:post_event(event)
		end
	end
end
