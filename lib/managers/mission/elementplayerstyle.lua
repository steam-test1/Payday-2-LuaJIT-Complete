core:import("CoreMissionScriptElement")

ElementPlayerStyle = ElementPlayerStyle or class(CoreMissionScriptElement.MissionScriptElement)

function ElementPlayerStyle:init(...)
	ElementPlayerStyle.super.init(self, ...)
end

function ElementPlayerStyle:client_on_executed(...)
	self:on_executed(...)
end

function ElementPlayerStyle:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	managers.player:change_player_look(self._values.style)
	ElementPlayerStyle.super.on_executed(self, instigator)
end

