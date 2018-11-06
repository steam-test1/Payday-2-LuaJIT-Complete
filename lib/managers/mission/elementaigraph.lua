core:import("CoreMissionScriptElement")

ElementAIGraph = ElementAIGraph or class(CoreMissionScriptElement.MissionScriptElement)

function ElementAIGraph:init(...)
	ElementAIGraph.super.init(self, ...)
end

function ElementAIGraph:on_script_activated()
end

function ElementAIGraph:client_on_executed(...)
	self:on_executed(...)
end

function ElementAIGraph:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	local handler_func = nil
	local is_meta_operation = table.contains(NavigationManager.nav_meta_operations, self._values.operation)
	handler_func = is_meta_operation and NavigationManager.perform_nav_segment_meta_operation or NavigationManager.set_nav_segment_state

	for _, id in ipairs(self._values.graph_ids) do
		handler_func(managers.navigation, id, self._values.operation, self._values.filter_group)
	end

	ElementAIGraph.super.on_executed(self, instigator)
end

