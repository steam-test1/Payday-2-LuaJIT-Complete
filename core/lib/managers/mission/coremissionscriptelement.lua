core:module("CoreMissionScriptElement")
core:import("CoreXml")
core:import("CoreCode")
core:import("CoreClass")

MissionScriptElement = MissionScriptElement or class()

function MissionScriptElement:init(mission_script, data)
	self._mission_script = mission_script
	self._id = data.id
	self._editor_name = data.editor_name
	self._values = data.values
end

function MissionScriptElement:on_created()
	return
end

function MissionScriptElement:on_script_activated()
	if self._values.rules_elements then
		self._rules_elements = {}

		for _, id in ipairs(self._values.rules_elements) do
			local element = self:get_mission_element(id)

			table.insert(self._rules_elements, element)
		end
	end
end

function MissionScriptElement:get_mission_element(id)
	return self._mission_script:element(id)
end

function MissionScriptElement:editor_name()
	return self._editor_name
end

function MissionScriptElement:id()
	return self._id
end

function MissionScriptElement:_unique_string_id()
	return "" .. self._id
end

function MissionScriptElement:values()
	return self._values
end

function MissionScriptElement:value(name)
	if self._values.instance_name and self._values.instance_var_names and self._values.instance_var_names[name] then
		local value = managers.world_instance:get_instance_param(self._values.instance_name, self._values.instance_var_names[name])

		if value then
			return value
		end
	end

	return self._values[name]
end

function MissionScriptElement:get_random_table_value(value)
	if tonumber(value) then
		return value
	end

	return value[1] + math.random(value[2] + 1) - 1
end

function MissionScriptElement:get_random_table_value_float(value)
	if tonumber(value) then
		return value
	end

	return value[1] + math.rand(value[2])
end

function MissionScriptElement:enabled()
	return self._values.enabled
end

function MissionScriptElement:_check_instigator(instigator)
	if CoreClass.type_name(instigator) == "Unit" then
		return instigator
	end

	return managers.player:player_unit()
end

function MissionScriptElement:on_executed(instigator, alternative, skip_execute_on_executed, sync_id_from)
	if not self._values.enabled then
		return
	end

	instigator = self:_check_instigator(instigator)

	if Network:is_server() then
		local last_orientation_index = self._last_orientation_index or 0

		sync_id_from = sync_id_from or 0

		if alive(instigator) and instigator:id() ~= -1 then
			managers.network:session():send_to_peers_synched("run_mission_element", self._id, instigator, last_orientation_index, sync_id_from)
		else
			managers.network:session():send_to_peers_synched("run_mission_element_no_instigator", self._id, last_orientation_index, sync_id_from)
		end
	end

	self._last_orientation_index = nil

	self:_reduce_trigger_times()

	if Network:is_server() and not skip_execute_on_executed then
		self:_trigger_execute_on_executed(instigator, alternative)
	end
end

function MissionScriptElement:_trigger_execute_on_executed(instigator, alternative)
	local clbk_data = {
		instigator = instigator,
		alternative = alternative
	}
	local base_delay = self:_calc_base_delay()

	if base_delay > 0 then
		local clbk = callback(self, self, "_execute_on_executed", clbk_data)

		self._mission_script:add(clbk, base_delay, 1)
	else
		self:execute_on_executed(clbk_data)
	end
end

function MissionScriptElement:_calc_base_delay()
	if not self._values.base_delay_rand then
		return self._values.base_delay
	end

	return self._values.base_delay + math.rand(self._values.base_delay_rand)
end

function MissionScriptElement:_debug_executed_string(instigator, alternative)
	local str = "[Element] '" .. self._editor_name .. "' [ID:" .. self:_unique_string_id() .. "] executed"

	if type(alternative) == "string" then
		str = str .. " '" .. alternative .. "'"
	end

	if alive(instigator) then
		local name = "unit"

		str = str .. " with instigator: '" .. name .. "' [ID:" .. instigator:id() .. "]"
	end

	return str
end

function MissionScriptElement:_execute_on_executed(params)
	self:execute_on_executed(params)
end

function MissionScriptElement:_calc_element_delay(params)
	if not params.delay_rand then
		return params.delay
	end

	return params.delay + math.rand(params.delay_rand)
end

function MissionScriptElement:execute_on_executed(execute_params)
	for _, params in ipairs(self._values.on_executed) do
		if not execute_params.alternative or not params.alternative or execute_params.alternative == params.alternative then
			local element = self:get_mission_element(params.id)

			if element then
				local delay = self:_calc_element_delay(params)
				local sync_id_from = element.client_local_on_executed and self._id or nil

				if delay > 0 then
					if self:is_debug() or element:is_debug() then
						self._mission_script:debug_output("[Element] Queuing '" .. element:editor_name() .. "' for " .. delay .. " seconds ...", DEBUG_PRINT_COLOR_ELEMENT)
					end

					local clbk = callback(element, element, "_clbk_on_execute_element", {
						execute_params.instigator or nil,
						execute_params.alternative or nil,
						false,
						sync_id_from
					})

					self._mission_script:add(clbk, delay, 1)
				else
					if self:is_debug() or element:is_debug() then
						self._mission_script:debug_output("[Element] Executing '" .. element:editor_name() .. "' ...", DEBUG_PRINT_COLOR_ELEMENT)
					end

					element:on_executed(execute_params.instigator or nil, execute_params.alternative or nil, false, sync_id_from)
				end
			end
		end
	end
end

function MissionScriptElement:_clbk_on_execute_element(data)
	self:on_executed(unpack(data))
end

function MissionScriptElement:_has_on_executed_alternative(alternative)
	for _, params in ipairs(self._values.on_executed) do
		if alternative then
			if params.alternative and params.alternative == alternative then
				return true
			end
		elseif params.alternative ~= nil then
			return true
		end
	end

	return false
end

function MissionScriptElement:enabled()
	return self._values.enabled
end

function MissionScriptElement:set_enabled(enabled)
	self._values.enabled = enabled

	self:on_set_enabled(enabled)
end

function MissionScriptElement:on_set_enabled(enabled)
	return
end

function MissionScriptElement:on_toggle()
	return
end

function MissionScriptElement:set_trigger_times(trigger_times)
	self._values.trigger_times = trigger_times
end

function MissionScriptElement:_reduce_trigger_times()
	if self._values.trigger_times > 0 then
		self._values.trigger_times = self._values.trigger_times - 1

		if self._values.trigger_times <= 0 then
			self._values.enabled = false
		end
	end
end

function MissionScriptElement:operation_add()
	if Application:editor() then
		managers.editor:output_error("Element " .. self:editor_name() .. " doesn't have an 'add' operator implemented.")
	end
end

function MissionScriptElement:operation_remove()
	if Application:editor() then
		managers.editor:output_error("Element " .. self:editor_name() .. " doesn't have a 'remove' operator implemented.")
	end
end

function MissionScriptElement:apply_job_value()
	if Application:editor() then
		managers.editor:output_error("Element " .. self:editor_name() .. " doesn't have a 'apply_job_value' function implemented.")
	end
end

function MissionScriptElement:get_orientation(use_last_orientation_index)
	local index = use_last_orientation_index and self._last_orientation_index

	index = index or self._synced_orientation_element_index or self:_get_orientation_index()
	self._last_orientation_index = index

	if Network:is_server() then
		if self._orientation_index_history then
			table.insert(self._orientation_index_history, index)
		else
			self._orientation_index_history = {
				index
			}
		end
	elseif self._orientation_index_history then
		index = table.remove(self._orientation_index_history)

		if #self._orientation_index_history == 0 then
			self._orientation_index_history = nil
		end
	end

	return self:_get_orientation_by_index(index)
end

function MissionScriptElement:set_synced_orientation_element_index(orientation_element_index)
	if orientation_element_index and orientation_element_index > 0 then
		self._synced_orientation_element_index = orientation_element_index
	else
		self._synced_orientation_element_index = nil
	end
end

function MissionScriptElement:_get_orientation_by_index(index)
	if not index or index == 0 then
		return self._values.position, self._values.rotation
	end

	local id = self._values.orientation_elements[index]
	local element = self:get_mission_element(id)

	if self._values.execute_orientation_on_use then
		element:on_executed(nil, nil, nil, nil)
	end

	if self._values.disable_orientation_on_use then
		element:set_enabled(false)
	end

	return element:_get_orientation_by_index(0)
end

function MissionScriptElement:_get_orientation_index()
	if self._values.orientation_elements and #self._values.orientation_elements > 0 then
		if not self._unused_orientation_indices then
			self._unused_orientation_indices = {}

			for index, id in ipairs(self._values.orientation_elements) do
				table.insert(self._unused_orientation_indices, index)
			end
		end

		local unused_alternative_orientation_elements = {}

		for i, index in ipairs(self._unused_orientation_indices) do
			local element_id = self._values.orientation_elements[index]
			local element = self:get_mission_element(element_id)

			if element:enabled() then
				table.insert(unused_alternative_orientation_elements, i)
			end
		end

		if #unused_alternative_orientation_elements == 0 then
			if #self._unused_orientation_indices == #self._values.orientation_elements then
				_G.debug_pause("There where no enabled orientation elements!", self:editor_name())

				return
			elseif #self._unused_orientation_indices < #self._values.orientation_elements then
				self._unused_orientation_indices = nil

				return self:_get_orientation_index()
			end
		end

		local use_i = unused_alternative_orientation_elements[self._values.use_orientation_sequenced and 1 or math.random(#unused_alternative_orientation_elements)]
		local index = table.remove(self._unused_orientation_indices, use_i)

		self._unused_orientation_indices = #self._unused_orientation_indices > 0 and self._unused_orientation_indices or nil

		return index
	else
		return 0
	end
end

function MissionScriptElement:is_debug()
	return self._values.debug or self._mission_script:is_debug()
end

function MissionScriptElement:debug_draw()
	return
end

function MissionScriptElement:stop_simulation(...)
	return
end

function MissionScriptElement:pre_destroy()
	return
end

function MissionScriptElement:destroy()
	return
end
