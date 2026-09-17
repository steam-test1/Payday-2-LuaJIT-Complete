core:import("CoreMissionScriptElement")

ElementAIGraph = ElementAIGraph or class(CoreMissionScriptElement.MissionScriptElement)

function ElementAIGraph:init(...)
	ElementAIGraph.super.init(self, ...)
end

function ElementAIGraph:on_script_activated()
	return
end

function ElementAIGraph:client_on_executed(...)
	self:on_executed(...)
end

function ElementAIGraph:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	local nav_manager = managers.navigation
	local operation = self._values.operation
	local filter_group = self._values.filter_group

	for _, id in ipairs(self._values.graph_ids) do
		nav_manager:perform_graph_operation(id, operation, filter_group)
	end

	ElementAIGraph.super.on_executed(self, instigator)
end
