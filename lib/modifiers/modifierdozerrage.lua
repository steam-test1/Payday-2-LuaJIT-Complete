ModifierDozerRage = ModifierDozerRage or class(BaseModifier)
ModifierDozerRage._type = "ModifierDozerRage"
ModifierDozerRage.name_id = "none"
ModifierDozerRage.desc_id = "menu_cs_modifier_dozer_rage"

function ModifierDozerRage:OnTankVisorShatter(unit, damage_info)
	local base_ext = unit:base()

	if base_ext and base_ext.add_buff then
		local buff_name = self:value("damage_buff_name") or "base_damage"

		base_ext:add_buff(buff_name, self:value("damage") * 0.01)
	end
end
