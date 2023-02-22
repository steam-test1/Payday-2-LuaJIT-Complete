core:import("CoreMissionScriptElement")

ElementKillZone = ElementKillZone or class(CoreMissionScriptElement.MissionScriptElement)

function ElementKillZone:init(...)
	ElementKillZone.super.init(self, ...)
end

function ElementKillZone:client_on_executed(...)
	self:on_executed(...)
end

function ElementKillZone:client_local_on_executed(instigator, event_type)
	if not self._values.enabled then
		return
	end

	self._values.type = self._values.type or "sniper"

	if alive(instigator) and instigator == managers.player:player_unit() then
		managers.killzone:set_unit(instigator, self._values.type, self._id)
	end
end

function ElementKillZone:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	self._values.type = self._values.type or "sniper"

	if not Network:is_client() and alive(instigator) then
		local char_dmg = instigator:character_damage()

		if char_dmg and (char_dmg.damage_killzone or char_dmg.damage_mission) and (not instigator:base() or not instigator:base().is_husk_player) then
			managers.killzone:set_unit(instigator, self._values.type, self._id)
		else
			Application:error("[ElementKillZone:on_executed] Unsupported unit type: ", inspect(instigator))
		end
	end

	ElementKillZone.super.on_executed(self, self._unit or instigator)
end
