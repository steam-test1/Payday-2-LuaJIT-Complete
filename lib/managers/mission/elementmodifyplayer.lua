core:import("CoreMissionScriptElement")

ElementModifyPlayer = ElementModifyPlayer or class(CoreMissionScriptElement.MissionScriptElement)

function ElementModifyPlayer:init(...)
	ElementModifyPlayer.super.init(self, ...)
end

function ElementModifyPlayer:set_enable_client_local_on_executed(element_id)
	self._can_client_local_on_execute = self._can_client_local_on_execute or {}
	self._can_client_local_on_execute[element_id] = true
end

function ElementModifyPlayer:client_on_executed(...)
	self:on_executed(...)
end

function ElementModifyPlayer:client_local_on_executed(instigator, element_id)
	if not self._values.enabled or not self._can_client_local_on_execute or not self._can_client_local_on_execute[element_id] then
		return
	end

	if alive(instigator) and instigator == managers.player:player_unit() then
		instigator:character_damage():set_mission_damage_blockers("damage_fall_disabled", self._values.damage_fall_disabled)
		instigator:character_damage():set_mission_damage_blockers("invulnerable", self._values.invulnerable)
	end
end

function ElementModifyPlayer:on_executed(instigator, alternative, skip_execute_on_executed, sync_id_from)
	if not self._values.enabled then
		return
	end

	if alive(instigator) then
		if Network:is_client() then
			if instigator == managers.player:player_unit() then
				if not sync_id_from or not self._can_client_local_on_execute or not self._can_client_local_on_execute[sync_id_from] then
					instigator:character_damage():set_mission_damage_blockers("damage_fall_disabled", self._values.damage_fall_disabled)
					instigator:character_damage():set_mission_damage_blockers("invulnerable", self._values.invulnerable)
				end
			else
				instigator:character_damage():set_mission_damage_blockers("damage_fall_disabled", self._values.damage_fall_disabled)
				instigator:character_damage():set_mission_damage_blockers("invulnerable", self._values.invulnerable)
			end
		elseif Network:is_server() then
			instigator:character_damage():set_mission_damage_blockers("damage_fall_disabled", self._values.damage_fall_disabled)
			instigator:character_damage():set_mission_damage_blockers("invulnerable", self._values.invulnerable)
		end
	end

	ElementModifyPlayer.super.on_executed(self, instigator, alternative, skip_execute_on_executed, sync_id_from)
end
