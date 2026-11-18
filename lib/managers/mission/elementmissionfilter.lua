core:import("CoreMissionScriptElement")

ElementMissionFilter = ElementMissionFilter or class(CoreMissionScriptElement.MissionScriptElement)
ElementMissionFilter.MAX_FLAGS = 5

function ElementMissionFilter:init(...)
	ElementMissionFilter.super.init(self, ...)
end

function ElementMissionFilter:client_on_executed(...)
	self:on_executed(...)
end

function ElementMissionFilter:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	if not self:_check_mission_filters() then
		return
	end

	ElementMissionFilter.super.on_executed(self, instigator)
end

function ElementMissionFilter:_check_mission_filters()
	for idx = 1, ElementMissionFilter.MAX_FLAGS do
		if self._values[idx] and managers.mission:check_mission_filter(idx) then
			return true
		end
	end

	return false
end
