core:import("CoreMissionScriptElement")

ElementKillZone = ElementKillZone or class(CoreMissionScriptElement.MissionScriptElement)

function ElementKillZone:init(...)
	ElementKillZone.super.init(self, ...)
end

function ElementKillZone:set_enable_client_local_on_executed(element_id)
	self._can_client_local_on_execute = self._can_client_local_on_execute or {}
	self._can_client_local_on_execute[element_id] = true
end

function ElementKillZone:client_on_executed(...)
	self:on_executed(...)
end

function ElementKillZone:client_local_on_executed(instigator, element_id)
	if not self._values.enabled or not self._can_client_local_on_execute or not self._can_client_local_on_execute[element_id] then
		return
	end

	self._values.type = self._values.type or "sniper"

	if alive(instigator) and instigator == managers.player:player_unit() then
		managers.killzone:set_unit(instigator, self._values.type, self._id)
	end
end

function ElementKillZone:on_executed(instigator, alternative, skip_execute_on_executed, sync_id_from)
	if not self._values.enabled then
		return
	end

	self._values.type = self._values.type or "sniper"

	if alive(instigator) then
		if Network:is_client() then
			if instigator == managers.player:player_unit() and (not sync_id_from or not self._can_client_local_on_execute or not self._can_client_local_on_execute[sync_id_from]) then
				managers.killzone:set_unit(instigator, self._values.type, self._id)
			end
		elseif Network:is_server() then
			local char_dmg = instigator:character_damage()

			if char_dmg and (char_dmg.damage_killzone or char_dmg.damage_mission) and (not instigator:base() or not instigator:base().is_husk_player) then
				managers.killzone:set_unit(instigator, self._values.type, self._id)
			else
				Application:error("[ElementKillZone:on_executed] Unsupported unit type: ", inspect(instigator))
			end
		end
	end

	ElementKillZone.super.on_executed(self, self._unit or instigator, alternative, skip_execute_on_executed, sync_id_from)
end
