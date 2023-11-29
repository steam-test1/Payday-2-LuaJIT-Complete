ModifierMedicAdrenaline = ModifierMedicAdrenaline or class(BaseModifier)
ModifierMedicAdrenaline._type = "ModifierMedicAdrenaline"
ModifierMedicAdrenaline.name_id = "none"
ModifierMedicAdrenaline.desc_id = "menu_cs_modifier_medic_adrenaline"

function ModifierMedicAdrenaline:OnEnemyHealed(target)
	local base_ext = target:base()

	if base_ext and base_ext.add_buff then
		local buff_name = self:value("damage_buff_name") or "base_damage"

		base_ext:add_buff(buff_name, self:value("damage") * 0.01)
	end
end
