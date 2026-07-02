KillzoneManager = KillzoneManager or class()

function KillzoneManager:init()
	self._units = {}
end

KillzoneManager.type_upd_funcs = {}

function KillzoneManager.type_upd_funcs.sniper(obj, t, dt, data)
	data.timer = data.timer + dt

	if data.timer > data.next_shot then
		data.next_shot = data.timer + math.rand(data.timer > data.warning_time and 0.5 or 1)

		local warning_shot = math.max(data.warning_time - data.timer, 1)

		warning_shot = math.rand(warning_shot) > 0.75

		if warning_shot then
			obj:_warning_shot(data.unit)
		else
			obj:_deal_damage(data.unit)
		end
	end
end

function KillzoneManager.type_upd_funcs.gas(obj, t, dt, data)
	data.timer = data.timer + dt

	if data.timer > data.next_gas then
		data.timer = data.timer - data.next_gas

		if not data.first_passed then
			data.first_passed = true
			data.next_gas = data.next_after_first
		end

		obj:_deal_gas_damage(data.unit)
	end
end

function KillzoneManager.type_upd_funcs.fire(obj, t, dt, data)
	data.timer = data.timer + dt

	if data.timer > data.next_fire then
		data.timer = data.timer - data.next_fire

		if not data.first_passed then
			data.first_passed = true
			data.next_fire = data.next_after_first
		end

		obj:_deal_fire_damage(data.unit)
	end
end

function KillzoneManager.type_upd_funcs.laser(obj, t, dt, data)
	if not data.killed then
		data.timer = data.timer + dt

		if data.timer > data.kill_at then
			data.killed = true

			obj:_kill_unit(data.unit)
		end
	end
end

function KillzoneManager.type_upd_funcs.electricity(obj, t, dt, data)
	if data.unit:movement():tased() then
		data.timer = 0
	else
		data.timer = data.timer + dt

		if data.timer > data.next_tase then
			data.timer = data.timer - data.next_tase

			if not data.first_passed then
				data.first_passed = true
				data.next_tase = data.next_after_first
			end

			local electrocution_time_mul = math.random(2, 4) * 0.1

			obj:_electrocute_unit(data.unit, electrocution_time_mul)
		end
	end
end

function KillzoneManager.type_upd_funcs.electricity_lethal(obj, t, dt, data)
	if not data.killed then
		data.timer = data.timer + dt

		if data.timer > data.kill_at then
			data.killed = true

			obj:_kill_unit(data.unit)
		end
	end
end

function KillzoneManager:update(t, dt)
	local upd_funcs = KillzoneManager.type_upd_funcs

	for u_key, unit_entry in pairs(self._units) do
		for zone_type, zone_entry in pairs(unit_entry) do
			for element_id, data in pairs(zone_entry) do
				if alive(data.unit) then
					upd_funcs[zone_type](self, t, dt, data)
				else
					zone_entry[element_id] = nil

					if not next(zone_entry) then
						unit_entry[zone_type] = nil

						if not next(unit_entry) then
							self._units[u_key] = nil
						end
					end
				end
			end
		end
	end
end

function KillzoneManager:set_unit(unit, zone_type, element_id)
	local entry = self._units[unit:key()]

	if entry and entry[zone_type] and entry[zone_type][element_id] then
		self:_remove_unit(unit, zone_type, element_id)
	elseif KillzoneManager.type_upd_funcs[zone_type] then
		self:_add_unit(unit, zone_type, element_id)
	else
		Application:error("[KillzoneManager:set_unit] Unsupported killzone type '" .. tostring(zone_type) .. "'. Won't add unit.")
	end
end

function KillzoneManager:_kill_unit(unit)
	if unit:character_damage().need_revive and unit:character_damage():need_revive() then
		return
	end

	if unit:character_damage().damage_killzone then
		unit:character_damage():damage_killzone({
			instant_death = true
		})
	elseif unit:character_damage().damage_mission then
		unit:character_damage():damage_mission({
			forced = true,
			col_ray = {}
		})
	end
end

function KillzoneManager:_electrocute_unit(unit, electrocution_time_mul)
	if unit:character_damage().can_be_tased and not unit:character_damage():can_be_tased() then
		return
	end

	unit:character_damage():on_non_lethal_electrocution(electrocution_time_mul)
end

function KillzoneManager:_warning_shot(unit)
	local rot = unit:camera() and unit:camera():rotation() or unit:rotation()

	rot = Rotation(rot:yaw(), 0, 0)

	local pos = unit:position() + rot:y() * (100 + math.random(200))
	local dir = Rotation(math.rand(360), 0, 0):y()

	dir = dir:with_z(-0.4):normalized()

	local from_pos = pos + dir * -100
	local to_pos = pos + dir * 100
	local col_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", managers.slot:get_mask("world_geometry", "vehicles"), "ignore_unit", unit)

	if col_ray and col_ray.unit then
		managers.game_play_central:play_impact_sound_and_effects({
			col_ray = col_ray
		})
	end
end

function KillzoneManager:_deal_damage(unit)
	if unit:character_damage().need_revive and unit:character_damage():need_revive() then
		return
	end

	local col_ray = {}
	local ray = Rotation(math.rand(360), 0, 0):y()

	ray = ray:with_z(-0.4):normalized()
	col_ray.ray = ray

	local attack_data = {
		damage = 1,
		col_ray = col_ray
	}

	unit:character_damage():damage_killzone(attack_data)
end

function KillzoneManager:_deal_gas_damage(unit)
	local attack_data = {
		damage = 0.75,
		col_ray = {
			ray = math.UP
		}
	}

	unit:character_damage():damage_killzone(attack_data)
end

function KillzoneManager:_deal_fire_damage(unit)
	local attack_data = {
		damage = 0.5,
		col_ray = {
			ray = math.UP
		}
	}

	unit:character_damage():damage_killzone(attack_data)
end

function KillzoneManager:_add_unit(unit, zone_type, element_id)
	local data
	local u_key = unit:key()

	if zone_type == "sniper" then
		if not unit:character_damage().damage_killzone then
			return
		end

		local warning_time = 4

		data = {
			timer = 0,
			type = zone_type,
			next_shot = math.rand(1),
			warning_time = warning_time,
			unit = unit
		}
	elseif zone_type == "gas" then
		if not unit:character_damage().damage_killzone then
			return
		end

		data = {
			first_passed = false,
			next_after_first = 0.25,
			timer = 0,
			type = zone_type,
			next_gas = math.rand(1),
			unit = unit
		}
	elseif zone_type == "fire" then
		if not unit:character_damage().damage_killzone then
			return
		end

		data = {
			first_passed = false,
			next_after_first = 0.25,
			timer = 0,
			type = zone_type,
			next_fire = math.rand(1),
			unit = unit
		}
	elseif zone_type == "laser" then
		if not unit:character_damage().damage_killzone then
			return
		end

		data = {
			timer = 0,
			type = zone_type,
			kill_at = math.rand(0.2),
			unit = unit
		}
	elseif zone_type == "electricity" then
		if unit == managers.player:player_unit() or managers.groupai:state():all_AI_criminals()[u_key] then
			if not unit:character_damage().on_non_lethal_electrocution or not unit:movement() or not unit:movement().tased then
				return
			end

			data = {
				first_passed = false,
				next_after_first = 3,
				next_tase = -1,
				timer = 0,
				type = zone_type,
				unit = unit
			}
		else
			zone_type = "electricity_lethal"

			local kill_at = 1.8 + math.rand(1)

			data = {
				timer = 0,
				type = zone_type,
				kill_at = kill_at,
				unit = unit
			}

			if unit:character_damage().damage_tase then
				local action_data = {}

				action_data.variant = "heavy"
				action_data.damage = 0
				action_data.col_ray = {}
				action_data.forced = true

				unit:character_damage():damage_tase(action_data)
			end
		end
	end

	self._units[u_key] = self._units[u_key] or {}
	self._units[u_key][zone_type] = self._units[u_key][zone_type] or {}
	self._units[u_key][zone_type][element_id] = data
end

function KillzoneManager:_remove_unit(unit, zone_type, element_id)
	local u_entry = self._units[unit:key()]

	if u_entry then
		local t_entry = u_entry[zone_type]

		if t_entry then
			if t_entry[element_id] then
				t_entry[element_id] = nil

				if not next(t_entry) then
					u_entry[zone_type] = nil

					if not next(u_entry) then
						self._units[unit:key()] = nil
					end
				end
			else
				Application:error("[KillzoneManager:_remove_unit] No element entry found with id '" .. tostring(element_id) .. "' for type '" .. tostring(zone_type) .. "'.", unit)
			end
		else
			Application:error("[KillzoneManager:_remove_unit] No zone type entry found with with type '" .. tostring(zone_type) .. "'.", unit)
		end
	else
		Application:error("[KillzoneManager:_remove_unit] No entry for unit.", unit)
	end
end
