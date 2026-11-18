ModifierMedicRage = ModifierMedicRage or class(BaseModifier)
ModifierMedicRage._type = "ModifierMedicRage"
ModifierMedicRage.name_id = "none"
ModifierMedicRage.desc_id = "menu_cs_modifier_medic_rage"

function ModifierMedicRage:init(...)
	ModifierMedicRage.super.init(self, ...)

	self._is_server = Network:is_server()
end

function ModifierMedicRage:OnEnemyDied(target)
	if not self._is_server then
		return
	end

	local medics = managers.enemy:find_nearby_affiliated_medics(unit)
	local buff_name = self:value("damage_buff_name") or "base_damage"
	local buff_value = self:value("damage") * 0.01
	local base_ext

	for _, medic in pairs(medics) do
		base_ext = medic:base()

		if base_ext and base_ext.add_buff then
			base_ext:add_buff(buff_name, buff_value)
		end
	end
end
