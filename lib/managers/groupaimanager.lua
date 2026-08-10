require("lib/managers/group_ai_states/GroupAIStateBase")
require("lib/managers/group_ai_states/GroupAIStateEmpty")
require("lib/managers/group_ai_states/GroupAIStateBesiege")
require("lib/managers/group_ai_states/GroupAIStateStreet")

GroupAIManager = GroupAIManager or class()
GroupAIManager.STATE_CLASS_LOOKUP = {
	empty = function()
		return GroupAIStateEmpty
	end,
	street = function()
		return GroupAIStateStreet
	end,
	besiege = function()
		local level_tweak = managers.job and managers.job:current_level_data() or nil

		return GroupAIStateBesiege, level_tweak and level_tweak.group_ai_state or "besiege"
	end
}
GroupAIManager.STATE_CLASS_LOOKUP.airport = GroupAIManager.STATE_CLASS_LOOKUP.besiege
GroupAIManager.STATE_CLASS_LOOKUP.zombie_apocalypse = GroupAIManager.STATE_CLASS_LOOKUP.besiege

function GroupAIManager:init()
	self:set_state("empty")

	self._event_listener_holder = EventListenerHolder:new()
end

function GroupAIManager:add_event_listener(...)
	self._event_listener_holder:add(...)
end

function GroupAIManager:remove_event_listener(...)
	self._event_listener_holder:remove(...)
end

function GroupAIManager:dispatch_event(...)
	self._event_listener_holder:call(...)
end

function GroupAIManager:update(t, dt)
	self._state:update(t, dt)
end

function GroupAIManager:paused_update(t, dt)
	self._state:paused_update(t, dt)
end

function GroupAIManager:set_state(name)
	local new_state_getter = GroupAIManager.STATE_CLASS_LOOKUP[name]

	if not new_state_getter then
		Application:error("[GroupAIManager:set_state] Inexistent state name.", name)

		return
	end

	local new_state_class, state_tweak_type = new_state_getter()

	if not new_state_class then
		Application:error("[GroupAIManager:set_state] Inexistent state class..?", name)

		return
	end

	local persisting_data

	if self._state ~= nil then
		persisting_data = self._state:get_persisting_data()

		self._state:destroy()
	end

	self._state_name = name
	self._state = new_state_class:new(state_tweak_type)

	if persisting_data then
		self._state:set_persisting_data(persisting_data)
	end
end

function GroupAIManager:state()
	return self._state
end

function GroupAIManager:state_name()
	return self._state_name
end

function GroupAIManager:state_names()
	return table.map_keys(GroupAIManager.STATE_CLASS_LOOKUP)
end

function GroupAIManager:on_simulation_started()
	self:set_state(self:state_name())
end

function GroupAIManager:on_simulation_ended()
	self._state:on_simulation_ended()
end

function GroupAIManager:visualization_enabled()
	return self._state._draw_enabled
end
