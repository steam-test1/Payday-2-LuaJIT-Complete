ModifierShieldPhalanx = ModifierShieldPhalanx or class(BaseModifier)
ModifierShieldPhalanx._type = "ModifierShieldPhalanx"
ModifierShieldPhalanx.name_id = "none"
ModifierShieldPhalanx.desc_id = "menu_cs_modifier_shield_phalanx"

function ModifierShieldPhalanx:init(data)
	ModifierShieldPhalanx.super.init(data)

	tweak_data.group_ai.unit_categories.CS_shield = tweak_data.group_ai.unit_categories.Phalanx_minion
	tweak_data.group_ai.unit_categories.FBI_shield = tweak_data.group_ai.unit_categories.Phalanx_minion
end

