core:import("CoreElementArea")
core:import("CoreClass")

ElementAreaTrigger = ElementAreaTrigger or class(CoreElementArea.ElementAreaTrigger)

local instigator_find_functions = {}

function instigator_find_functions.player(values, instigators)
	local player_unit = managers.player:player_unit()

	if player_unit then
		table.insert(instigators, player_unit)
	end
end

function instigator_find_functions.vr_player(values, instigators)
	if _G.IS_VR then
		local player_unit = managers.player:player_unit()

		if player_unit then
			table.insert(instigators, player_unit)
		end
	end
end

function instigator_find_functions.vehicle(values, instigators)
	for _, vehicle_unit in ipairs(managers.vehicle:get_all_vehicles()) do
		if not vehicle_unit:npc_vehicle_driving() then
			table.insert(instigators, vehicle_unit)
		end
	end
end

function instigator_find_functions.npc_vehicle(values, instigators)
	for _, vehicle_unit in ipairs(managers.vehicle:get_all_vehicles()) do
		if vehicle_unit:npc_vehicle_driving() then
			table.insert(instigators, vehicle_unit)
		end
	end
end

function instigator_find_functions.vehicle_with_players(values, instigators)
	for _, vehicle_unit in ipairs(managers.vehicle:get_all_vehicles()) do
		if vehicle_unit:vehicle_driving() then
			table.insert(instigators, vehicle_unit)
		end
	end
end

function instigator_find_functions.enemies(values, instigators)
	local has_hostages = managers.groupai:state():police_hostage_count() > 0
	local has_converted_enemies = managers.groupai:state():get_amount_enemies_converted_to_criminals() > 0

	if has_converted_enemies then
		if has_hostages then
			for _, data in pairs(managers.enemy:all_enemies()) do
				if not data.is_converted and not data.unit:brain():surrendered() then
					table.insert(instigators, data.unit)
				end
			end
		else
			for _, data in pairs(managers.enemy:all_enemies()) do
				if not data.is_converted then
					table.insert(instigators, data.unit)
				end
			end
		end
	elseif has_hostages then
		for _, data in pairs(managers.enemy:all_enemies()) do
			if not data.unit:brain():surrendered() then
				table.insert(instigators, data.unit)
			end
		end
	else
		for _, data in pairs(managers.enemy:all_enemies()) do
			table.insert(instigators, data.unit)
		end
	end
end

function instigator_find_functions.intimidated_enemies(values, instigators)
	local has_hostages = managers.groupai:state():police_hostage_count() > 0
	local has_converted_enemies = managers.groupai:state():get_amount_enemies_converted_to_criminals() > 0

	if has_converted_enemies then
		if has_hostages then
			for _, data in pairs(managers.enemy:all_enemies()) do
				if data.is_converted or data.unit:brain():surrendered() then
					table.insert(instigators, data.unit)
				end
			end
		else
			for _, data in pairs(managers.enemy:all_enemies()) do
				if data.is_converted then
					table.insert(instigators, data.unit)
				end
			end
		end
	elseif has_hostages then
		for _, data in pairs(managers.enemy:all_enemies()) do
			if data.unit:brain():surrendered() then
				table.insert(instigators, data.unit)
			end
		end
	end
end

function instigator_find_functions.civilians(values, instigators)
	for _, data in pairs(managers.enemy:all_civilians()) do
		table.insert(instigators, data.unit)
	end
end

function instigator_find_functions.escorts(values, instigators)
	for _, data in pairs(managers.enemy:all_civilians()) do
		if data.unit:base():char_tweak().is_escort then
			table.insert(instigators, data.unit)
		end
	end
end

function instigator_find_functions.hostages(values, instigators)
	if managers.groupai:state():hostage_count() > 0 then
		if managers.groupai:state():police_hostage_count() > 0 then
			for _, data in pairs(managers.enemy:all_enemies()) do
				if data.unit:brain():is_hostage() then
					table.insert(instigators, data.unit)
				end
			end
		end

		local brain_ext

		for _, data in pairs(managers.enemy:all_civilians()) do
			brain_ext = data.unit:brain()

			if brain_ext:is_hostage() or brain_ext:is_tied() then
				table.insert(instigators, data.unit)
			end
		end
	end
end

function instigator_find_functions.local_criminals(values, instigators)
	local player_unit = managers.player:player_unit()

	if player_unit then
		table.insert(instigators, player_unit)
	end

	for _, data in pairs(managers.groupai:state():all_AI_criminals()) do
		table.insert(instigators, data.unit)
	end
end

function instigator_find_functions.persons(values, instigators)
	local player_unit = managers.player:player_unit()

	if player_unit then
		table.insert(instigators, player_unit)
	end

	for _, data in pairs(managers.groupai:state():all_AI_criminals()) do
		table.insert(instigators, data.unit)
	end

	for _, data in pairs(managers.enemy:all_enemies()) do
		table.insert(instigators, data.unit)
	end

	for _, data in pairs(managers.enemy:all_civilians()) do
		table.insert(instigators, data.unit)
	end
end

function instigator_find_functions.ai_teammates(values, instigators)
	for _, data in pairs(managers.groupai:state():all_AI_criminals()) do
		table.insert(instigators, data.unit)
	end
end

function instigator_find_functions.loot(values, instigators)
	local carry_list = ElementAreaTrigger.carry_list
	local carry_ext

	for _, unit in ipairs(World:find_units_quick("all", 14)) do
		carry_ext = unit:carry_data()

		if carry_ext and carry_list[carry_ext:carry_id()] then
			table.insert(instigators, unit)
		end
	end
end

function instigator_find_functions.unique_loot(values, instigators)
	local carry_tweak_data = tweak_data.carry
	local carry_ext, carry_entry

	for _, unit in ipairs(World:find_units_quick("all", 14)) do
		carry_ext = unit:carry_data()
		carry_entry = carry_ext and carry_tweak_data[carry_ext:carry_id()]

		if carry_entry and carry_entry.is_unique_loot then
			table.insert(instigators, unit)
		end
	end
end

function instigator_find_functions.equipment(values, instigators)
	local wanted_name = values.instigator_name

	if wanted_name ~= nil then
		local base_ext

		for _, unit in ipairs(World:find_units_quick("all", 14)) do
			base_ext = unit:base()

			if base_ext and base_ext.get_name_id and base_ext:get_name_id() == wanted_name then
				table.insert(instigators, unit)
			end
		end
	end
end

function instigator_find_functions.enemy_corpses(values, instigators)
	if not managers.enemy:is_corpse_disposal_enabled() then
		local is_civ_func = CopDamage.is_civilian
		local base_ext, tweak_name

		for _, unit in ipairs(World:find_units_quick("all", 17)) do
			base_ext = unit:base()
			tweak_name = base_ext and base_ext._tweak_table

			if tweak_name and not is_civ_func(tweak_name) then
				table.insert(instigators, unit)
			end
		end
	end
end

function instigator_find_functions.civilian_corpses(values, instigators)
	if not managers.enemy:is_corpse_disposal_enabled() then
		local is_civ_func = CopDamage.is_civilian
		local base_ext, tweak_name

		for _, unit in ipairs(World:find_units_quick("all", 17)) do
			base_ext = unit:base()
			tweak_name = base_ext and base_ext._tweak_table

			if tweak_name and is_civ_func(tweak_name) then
				table.insert(instigators, unit)
			end
		end
	end
end

function instigator_find_functions.all_corpses(values, instigators)
	if not managers.enemy:is_corpse_disposal_enabled() then
		table.list_append(instigators, World:find_units_quick("all", 17))
	end
end

function instigator_find_functions.player1(values, instigators)
	local session = managers.network:session()

	if session then
		local id = tonumber(string.match(values.instigator, "%d$"))

		if session:local_peer():id() == id then
			local player_unit = managers.player:player_unit()

			if player_unit then
				table.insert(instigators, player_unit)
			end
		end
	end
end

instigator_find_functions.player_not_in_vehicle = instigator_find_functions.player
instigator_find_functions.criminals = instigator_find_functions.local_criminals
instigator_find_functions.player_criminals = instigator_find_functions.player
instigator_find_functions.player2 = instigator_find_functions.player1
instigator_find_functions.player3 = instigator_find_functions.player1

local instigator_find_functions_client = {}

instigator_find_functions_client.player = instigator_find_functions.player
instigator_find_functions_client.player_not_in_vehicle = instigator_find_functions.player
instigator_find_functions_client.criminals = instigator_find_functions.player
instigator_find_functions_client.player_criminals = instigator_find_functions.player
instigator_find_functions_client.local_criminals = instigator_find_functions.player
instigator_find_functions_client.persons = instigator_find_functions.player
instigator_find_functions_client.player1 = instigator_find_functions.player1
instigator_find_functions_client.player2 = instigator_find_functions.player1
instigator_find_functions_client.player3 = instigator_find_functions.player1
instigator_find_functions_client.player4 = instigator_find_functions.player1
instigator_find_functions_client.vr_player = instigator_find_functions.vr_player

local instigator_project_all_functions = {}

function instigator_project_all_functions.criminals()
	local counter = 0

	for _, data in pairs(managers.groupai:state():all_char_criminals()) do
		counter = counter + 1
	end

	return counter
end

function instigator_project_all_functions.ai_teammates()
	local counter = 0

	for _, data in pairs(managers.groupai:state():all_AI_criminals()) do
		counter = counter + 1
	end

	return counter
end

instigator_project_all_functions.local_criminals = instigator_project_all_functions.criminals

local instigator_project_inside_functions = {}

function instigator_project_inside_functions.player_not_in_vehicle(instigators_inside)
	local counter = 0
	local all_vehicles = managers.vehicle:get_all_vehicles()
	local vehicle_ext

	for _, player_unit in ipairs(instigators_inside) do
		local in_vehicle = false

		for _, vehicle_unit in ipairs(all_vehicles) do
			vehicle_ext = vehicle_unit:vehicle_driving()

			if vehicle_ext and vehicle_ext:find_seat_for_player(player_unit) then
				in_vehicle = true

				break
			end
		end

		if not in_vehicle then
			counter = counter + 1
		end
	end

	return counter
end

local instigator_valid_functions = {}

function instigator_valid_functions:vehicle_with_players(unit)
	if not unit then
		return true
	end

	if not unit:vehicle_driving() then
		return false
	end

	local amount = self._values.amount == "all" and self:project_amount_all()

	amount = amount or tonumber(self._values.amount)

	local result = false
	local inside_vehicle = unit:vehicle_driving():num_players_inside()

	if inside_vehicle > 0 and amount <= inside_vehicle then
		result = true
	end

	return result
end

function instigator_valid_functions:player_not_in_vehicle()
	local all_vehicles = managers.vehicle:get_all_vehicles()
	local vehicle_ext

	for _, player_unit in ipairs(self._inside) do
		for _, vehicle_unit in ipairs(all_vehicles) do
			vehicle_ext = vehicle_unit:vehicle_driving()

			if vehicle_ext and vehicle_ext:find_seat_for_player(player_unit) then
				return false
			end
		end
	end

	return true
end

local check_amount_functions = {}

function check_amount_functions:vehicle_with_players(unit)
	if self._values.trigger_on ~= "on_enter" then
		self.super._check_amount(self, unit)

		return
	end

	self:_clean_destroyed_units()

	if unit and self:is_instigator_valid(unit) then
		self:on_executed(unit)

		return
	end

	for i, instigator in ipairs(self._inside) do
		if self:is_instigator_valid(instigator) then
			self:on_executed(instigator)

			break
		end
	end
end

local on_empty_find_func_switch = {}

function on_empty_find_func_switch.criminals(values, instigators)
	for _, data in pairs(managers.groupai:state():all_char_criminals()) do
		table.insert(instigators, data.unit)
	end
end

function on_empty_find_func_switch.player_criminals(values, instigators)
	for _, data in pairs(managers.groupai:state():all_player_criminals()) do
		table.insert(instigators, data.unit)
	end
end

function on_empty_find_func_switch.persons(values, instigators)
	for _, data in pairs(managers.groupai:state():all_char_criminals()) do
		table.insert(instigators, data.unit)
	end

	for _, data in pairs(managers.enemy:all_enemies()) do
		table.insert(instigators, data.unit)
	end

	for _, data in pairs(managers.enemy:all_civilians()) do
		table.insert(instigators, data.unit)
	end
end

ElementAreaTrigger.instigator_find_functions = instigator_find_functions
ElementAreaTrigger.instigator_find_functions_client = instigator_find_functions_client
ElementAreaTrigger.instigator_project_all_functions = instigator_project_all_functions
ElementAreaTrigger.instigator_project_inside_functions = instigator_project_inside_functions
ElementAreaTrigger.instigator_valid_functions = instigator_valid_functions
ElementAreaTrigger.check_amount_functions = check_amount_functions
ElementAreaTrigger.on_empty_find_func_switch = on_empty_find_func_switch
instigator_find_functions = nil
instigator_find_functions_client = nil
instigator_project_all_functions = nil
instigator_project_inside_functions = nil
instigator_valid_functions = nil
check_amount_functions = nil
on_empty_find_func_switch = nil

function ElementAreaTrigger:init(...)
	ElementAreaTrigger.super.init(self, ...)

	ElementAreaTrigger.carry_list = ElementAreaTrigger.carry_list or tweak_data.carry:get_carry_ids_lookup_for_area_trigger()

	local instigator_type = self._values and self._values.instigator

	if Network:is_client() then
		self._instigator_find_func = ElementAreaTrigger.instigator_find_functions_client[instigator_type]
	else
		self._instigator_find_func = ElementAreaTrigger.instigator_find_functions[instigator_type]
		self._check_amount_func = ElementAreaTrigger.check_amount_functions[instigator_type]

		if self._values.trigger_on == "on_empty" then
			local temp_switch = ElementAreaTrigger.on_empty_find_func_switch[instigator_type]

			if temp_switch then
				self._on_empty_find_func_switch = self._instigator_find_func
				self._instigator_find_func = temp_switch
			end
		end
	end

	self._instigator_count_all_func = ElementAreaTrigger.instigator_project_all_functions[instigator_type]
	self._instigator_count_inside_func = ElementAreaTrigger.instigator_project_inside_functions[instigator_type]
	self._instigator_valid_func = ElementAreaTrigger.instigator_valid_functions[instigator_type]
end

function ElementAreaTrigger:project_instigators()
	local instigators = {}

	if self._instigator_find_func then
		self._instigator_find_func(self._values, instigators)
	end

	return instigators
end

function ElementAreaTrigger:project_amount_all()
	if self._instigator_count_all_func then
		return self._instigator_count_all_func()
	end

	return managers.network:session() and managers.network:session():amount_of_alive_players() or 0
end

function ElementAreaTrigger:project_amount_inside()
	if self._instigator_count_inside_func then
		return self._instigator_count_inside_func(self._inside)
	end

	return #self._inside
end

function ElementAreaTrigger:is_instigator_valid(unit)
	if self._instigator_valid_func then
		return self._instigator_valid_func(self, unit)
	end

	return true
end

function ElementAreaTrigger:_check_amount(...)
	if self._check_amount_func then
		self._check_amount_func(self, ...)
	end

	ElementAreaTrigger.super._check_amount(self, ...)
end

CoreClass.override_class(CoreElementArea.ElementAreaTrigger, ElementAreaTrigger)
