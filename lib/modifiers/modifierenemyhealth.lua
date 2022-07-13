ModifierEnemyHealth = ModifierEnemyHealth or class(BaseModifier)
ModifierEnemyHealth._type = "ModifierEnemyHealth"
ModifierEnemyHealth.name_id = "none"
ModifierEnemyHealth.desc_id = "menu_cs_modifier_enemy_health"
ModifierEnemyHealth.default_value = "health"
ModifierEnemyHealth.total_localization = "menu_cs_modifier_total_generic_percent"

function ModifierEnemyHealth:init(data)
	ModifierEnemyHealth.super.init(self, data)

	local excluded_enemies = tweak_data.crime_spree.excluded_enemies
	local health_exclude_list = excluded_enemies and excluded_enemies.health

	MutatorEnemyHealth:modify_character_tweak_data(tweak_data.character, self:get_health_multiplier(), health_exclude_list)
end

function ModifierEnemyHealth:get_health_multiplier()
	return 1 + self:value() / 100
end
