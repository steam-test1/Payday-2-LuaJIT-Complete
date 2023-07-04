core:import("CoreMissionScriptElement")

ElementPlayerState = ElementPlayerState or class(CoreMissionScriptElement.MissionScriptElement)

function ElementPlayerState:init(...)
	ElementPlayerState.super.init(self, ...)
end

function ElementPlayerState:set_enable_client_local_on_executed(element_id)
	self._can_client_local_on_execute = self._can_client_local_on_execute or {}
	self._can_client_local_on_execute[element_id] = true
end

function ElementPlayerState:client_on_executed(...)
	self:on_executed(...)
end

function ElementPlayerState:client_local_on_executed(instigator, element_id)
	if not self._values.enabled or not self._can_client_local_on_execute or not self._can_client_local_on_execute[element_id] then
		return
	end

	self:set_state(instigator)
end

function ElementPlayerState:on_executed(instigator, alternative, skip_execute_on_executed, sync_id_from)
	if not self._values.enabled then
		return
	end

	if Network:is_client() then
		if not sync_id_from or not self._can_client_local_on_execute or not self._can_client_local_on_execute[sync_id_from] then
			self:set_state(instigator)
		end
	elseif Network:is_server() then
		self:set_state(instigator)
	end

	ElementPlayerState.super.on_executed(self, self._unit or instigator, alternative, skip_execute_on_executed, sync_id_from)
end

function ElementPlayerState:set_state(instigator)
	local state = self._values.state
	local player_unit = managers.player:player_unit()
	local requires_alive_player = false

	if self._values.state == "electrocution" then
		state = "tased"
		requires_alive_player = true

		if alive(player_unit) then
			player_unit:movement():on_non_lethal_electrocution()
		end
	end

	if (not self._values.use_instigator or instigator == player_unit) and (not requires_alive_player or alive(player_unit)) then
		if self._values.state ~= "none" then
			managers.player:set_player_state(state)
		elseif Application:editor() then
			managers.editor:output_error("Cant change to player state " .. state .. " in element " .. self._editor_name .. ".")
		end
	end
end

ElementPlayerStateTrigger = ElementPlayerStateTrigger or class(CoreMissionScriptElement.MissionScriptElement)

function ElementPlayerStateTrigger:init(...)
	ElementPlayerStateTrigger.super.init(self, ...)
end

function ElementPlayerStateTrigger:on_script_activated()
	managers.player:add_listener(self._id, {
		self._values.state
	}, callback(self, self, Network:is_client() and "send_to_host" or "on_executed"))
end

function ElementPlayerStateTrigger:send_to_host(instigator)
	if instigator then
		managers.network:session():send_to_host("to_server_mission_element_trigger", self._id, instigator)
	end
end

function ElementPlayerStateTrigger:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	ElementPlayerStateTrigger.super.on_executed(self, self._unit or instigator)
end
