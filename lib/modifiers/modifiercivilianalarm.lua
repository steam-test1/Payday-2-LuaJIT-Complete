ModifierCivilianAlarm = ModifierCivilianAlarm or class(BaseModifier)
ModifierCivilianAlarm._type = "ModifierCivilianAlarm"
ModifierCivilianAlarm.name_id = "none"
ModifierCivilianAlarm.desc_id = "menu_cs_modifier_civs"
ModifierCivilianAlarm.default_value = "count"
ModifierCivilianAlarm.stealth = true

function ModifierCivilianAlarm:OnCivilianKilled()
	if Network:is_client() or self._alarmed or managers.groupai:state():is_police_called() then
		return
	end

	self._body_count = (self._body_count or 0) + 1

	if self:value() < self._body_count then
		self._alarmed = true

		managers.groupai:state():on_police_called("civ_too_many_killed")
	end
end
