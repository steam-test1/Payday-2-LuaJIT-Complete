require("lib/managers/CharmManager")

local mrot_set = mrotation.set_yaw_pitch_roll
local mrot_pitch = mrotation.pitch
local math_clamp = math.clamp
MachineGunBeltManager = MachineGunBeltManager or class(CharmManager)
MachineGunBeltManager.damping_constant = 0.12
MachineGunBeltManager.menu_left_roll_angle = -90
MachineGunBeltManager.menu_right_roll_angle = 90
MachineGunBeltManager.freq_factor = 2 * math.pi
MachineGunBeltManager.oscillation_speed = 25600
MachineGunBeltManager.max_amplitude = 85
MachineGunBeltManager.noise_gain_speed = 4
MachineGunBeltManager.max_noise_gain_speed = 85
MachineGunBeltManager.yaw_modifier = 1.2
MachineGunBeltManager.pitch_modifier = 1.1
MachineGunBeltManager.roll_modifier = 1.2
MachineGunBeltManager.chaos_factor = 3
MachineGunBeltManager.lerping_duration = 0.25

function MachineGunBeltManager:init()
	self.super.init(self)
end

function MachineGunBeltManager:add_weapon(weapon_unit, parts, user_unit, is_menu, custom_params)
	if not custom_params or not custom_params.bullet_belt or not custom_params.bullet_belt.parts then
		return
	end

	local u_key = weapon_unit:key()
	local existing_entries = self._weapons
	local charm_data = {}
	local belt_data = {}
	local index = 1

	if parts and custom_params.bullet_belt then
		local parent_id = custom_params.bullet_belt.parent
		local parts_tweak = tweak_data.weapon.factory.parts

		for i, part_id in ipairs(custom_params.bullet_belt.parts) do
			local charm_part = parts[part_id]
			local part_tweak = parts_tweak[part_id]

			if charm_part then
				local charm_unit = charm_part.unit

				if charm_unit then
					local custom_body_name = part_tweak.body_name
					local custom_parent_name = part_tweak.parent_name
					local charm_entry = self:get_charm_data(charm_data, charm_unit, custom_body_name, custom_parent_name, is_menu)
					belt_data[index] = charm_entry
					index = index + 1
				end
			end
		end
	end

	local entry = {
		weapon_unit = weapon_unit,
		charm_data = charm_data,
		mov_data = self:get_movement_data(weapon_unit, user_unit, is_menu),
		belt_data = belt_data
	}
	existing_entries[u_key] = entry
	self._enabled_weapons[u_key] = entry

	weapon_unit:base():set_charm_data(charm_data, true)
	self:_chk_updator()
end

function MachineGunBeltManager:simulate_menu_standard(entry, _, charm_data)
	local new_rot = Rotation()

	entry.weapon_unit:m_rotation(new_rot)
	mrot_set(new_rot, 0, mrot_pitch(new_rot), 0)

	for i = 1, #entry.belt_data do
		local c_data = entry.belt_data[i]
		local damping_factor = self:_calculate_belt_damping(c_data, i, #entry.belt_data)
		local rot = Rotation(new_rot:yaw() * damping_factor * self.yaw_modifier, new_rot:pitch() * damping_factor * self.pitch_modifier, new_rot:roll() * damping_factor * self.roll_modifier)

		c_data.ring:set_local_rotation(rot)
		c_data.unit:set_moving()
	end
end

function MachineGunBeltManager:simulate_menu_no_character(entry, mov_data, charm_data)
	local weap_rot = Rotation()

	entry.weapon_unit:m_rotation(weap_rot)

	local old_to_new_rot = mov_data.prev_weapon_rot

	self:_orient_charm(old_to_new_rot, weap_rot)

	local roll_supressor = 1

	for i = 1, #entry.belt_data do
		local c_data = entry.belt_data[i]
		local damping_factor = self:_calculate_belt_damping(c_data, i, #entry.belt_data)

		if old_to_new_rot:roll() < -2 then
			if i == 1 then
				roll_supressor = 1 / damping_factor
			else
				roll_supressor = 0
			end
		end

		local rot = Rotation(old_to_new_rot:yaw() * damping_factor * self.yaw_modifier, old_to_new_rot:pitch() * damping_factor * self.pitch_modifier, old_to_new_rot:roll() * damping_factor * self.roll_modifier * roll_supressor)

		c_data.ring:set_local_rotation(rot)
		c_data.unit:set_moving()
	end
end

function MachineGunBeltManager:simulate_ingame_standard(entry, mov_data, charm_data, dt)
	local alpha = 1
	local is_shooting = entry.weapon_unit:base():shooting()

	if is_shooting then
		entry._shooting_flag = true
		entry._lerping_flag = false
	else
		if entry._shooting_flag then
			entry._lerping_flag = true
			entry._lerping_time = 0

			for i = 1, #entry.belt_data do
				local c_data = entry.belt_data[i]
				c_data.prev_rot = c_data.ring:local_rotation()
			end
		end

		entry._shooting_flag = false
	end

	if entry._lerping_flag then
		entry._lerping_time = entry._lerping_time + dt
		alpha = math_clamp(entry._lerping_time, 0, self.lerping_duration) / self.lerping_duration
	end

	local new_rot = self:_get_ingame_rotation(entry, mov_data, dt)

	for i = 1, #entry.belt_data do
		local c_data = entry.belt_data[i]
		local damping_factor = self:_calculate_belt_damping(c_data, i, #entry.belt_data)
		local noise = self:_noise_signal(entry, c_data, dt, i, #entry.belt_data, is_shooting)
		local rot = Rotation(math_clamp(new_rot:yaw() * damping_factor * self.yaw_modifier + noise, -self.yaw_angle, self.yaw_angle), math_clamp(new_rot:pitch() * damping_factor * self.pitch_modifier + noise, -self.pitch_angle, self.pitch_angle), math_clamp(new_rot:roll() * damping_factor * self.roll_modifier + noise, -self.left_roll_angle, self.right_roll_angle))

		if entry._lerping_flag then
			rot = Rotation(c_data.prev_rot:yaw() * (1 - alpha) + rot:yaw() * alpha, c_data.prev_rot:pitch() * (1 - alpha) + rot:pitch() * alpha, c_data.prev_rot:roll() * (1 - alpha) + rot:roll() * alpha)

			if self.lerping_duration < entry._lerping_time then
				entry._lerping_flag = false
			end
		end

		c_data.ring:set_local_rotation(rot)
		c_data.unit:set_moving()
	end
end

function MachineGunBeltManager:_calculate_belt_damping(c_data, dist, belt_length)
	if c_data.damping_factor then
		return c_data.damping_factor
	end

	local v = (belt_length - (dist - 1)) / belt_length
	c_data.damping_factor = self.damping_constant * v

	return c_data.damping_factor
end

function MachineGunBeltManager:_curve(x, max)
	x = x / max
	local ret = (-32.6401 * math.pow(x, 4) + 70.4845 * math.pow(x, 3) - 46.9253 * math.pow(x, 2) + 9.9483 * x + 0.1004) * max

	return ret
end

function MachineGunBeltManager:_noise_signal(entry, c_data, dt, distance_to_root, belt_length, is_shooting)
	if is_shooting then
		entry.amplitude = math_clamp(entry.amplitude + dt * self.noise_gain_speed, 0, self.max_noise_gain_speed)

		return self:_curve(entry.amplitude, self.max_noise_gain_speed) / self.max_noise_gain_speed * self.max_amplitude * math.sin(math.rad(os.clock() * self.oscillation_speed) * distance_to_root / belt_length * self.freq_factor) * c_data.damping_factor + self:_chaos()
	end

	entry.amplitude = 0

	return 0
end

function MachineGunBeltManager:_chaos()
	return (math.random() + 0.5) * self.chaos_factor
end
