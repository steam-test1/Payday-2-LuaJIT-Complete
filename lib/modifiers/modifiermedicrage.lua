ModifierMedicRage = ModifierMedicRage or class(BaseModifier)
ModifierMedicRage._type = "ModifierMedicRage"
ModifierMedicRage.name_id = "none"
ModifierMedicRage.desc_id = "menu_cs_modifier_medic_rage"

function ModifierMedicRage:OnEnemyDied(unit)
	if Network:is_client() then
		return
	end

	local base_ext = nil
	local medics = managers.enemy:find_nearby_affiliated_medics(unit)
	local buff_name = self:value("damage_buff_name") or "base_damage"
	local buff_value = self:value("damage") * 0.01

	for _, medic in pairs(medics) do
		base_ext = medic:base()

		if base_ext and base_ext.add_buff then
			print("[ModifierMedicRage:OnEnemyDied] Valid enemy died within healing range of a Medic, buffing medic damage.")
			base_ext:add_buff(buff_name, buff_value)
		end
	end
end
