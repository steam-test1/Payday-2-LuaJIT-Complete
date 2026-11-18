ModifierCivilianAlarm = ModifierCivilianAlarm or class(BaseModifier)
ModifierCivilianAlarm._type = "ModifierCivilianAlarm"
ModifierCivilianAlarm.name_id = "none"
ModifierCivilianAlarm.desc_id = "menu_cs_modifier_civs"
ModifierCivilianAlarm.default_value = "count"
ModifierCivilianAlarm.stealth = true

function ModifierCivilianAlarm:init(...)
	ModifierCivilianAlarm.super.init(self, ...)

	self._is_server = Network:is_server()
end

function ModifierCivilianAlarm:OnCivilianKilled()
	if not self._is_server or self._alarmed then
		return
	end

	if managers.groupai:state():is_police_called() then
		self._alarmed = true

		return
	end

	self._body_count = (self._body_count or 0) + 1

	if self._body_count > self:value() then
		self._alarmed = true

		managers.groupai:state():on_police_called("civ_too_many_killed")
	end
end
