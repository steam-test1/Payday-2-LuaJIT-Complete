core:import("CoreMissionScriptElement")

ElementSmokeGrenade = ElementSmokeGrenade or class(CoreMissionScriptElement.MissionScriptElement)

function ElementSmokeGrenade:init(...)
	ElementSmokeGrenade.super.init(self, ...)
end

function ElementSmokeGrenade:client_on_executed(...)
	return
end

function ElementSmokeGrenade:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	local id = tostring(self:id())
	local shooter_pos = self._values.shooter_position
	local is_flashbang = self._values.effect_type == "flash"
	local instant = self._values.instant_detonation
	local state = managers.groupai:state()

	state:queue_smoke_grenade(id, self._values.position, shooter_pos, self._values.duration, self._values.ignore_control, is_flashbang, instant)

	if self._values.immediate and (self._values.ignore_control or state:get_assault_mode()) then
		state:detonate_world_smoke_grenade(id, true)
	end

	ElementSmokeGrenade.super.on_executed(self, instigator)
end
