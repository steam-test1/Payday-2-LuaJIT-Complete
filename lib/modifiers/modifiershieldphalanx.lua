ModifierShieldPhalanx = ModifierShieldPhalanx or class(BaseModifier)
ModifierShieldPhalanx._type = "ModifierShieldPhalanx"
ModifierShieldPhalanx.name_id = "none"
ModifierShieldPhalanx.desc_id = "menu_cs_modifier_shield_phalanx"

function ModifierShieldPhalanx:init(data)
	ModifierShieldPhalanx.super.init(data)

	local copied_tweak = deep_clone(tweak_data.group_ai.unit_categories.Phalanx_minion)
	copied_tweak.is_captain = nil
	tweak_data.group_ai.unit_categories.CS_shield = copied_tweak
	tweak_data.group_ai.unit_categories.FBI_shield = copied_tweak
end

function ModifierShieldPhalanx:modify_value(id, value, unit)
	if id ~= "PlayerStandart:_start_action_intimidate" then
		return value
	end

	local unit_tweak = unit:base()._tweak_table

	if unit_tweak ~= "phalanx_minion" then
		return value
	end

	if unit:base().is_phalanx then
		return
	end

	return "f31x_any"
end
