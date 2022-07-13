ModifierEnemyHealthAndDamage = ModifierEnemyHealthAndDamage or class(BaseModifier)
ModifierEnemyHealthAndDamage._type = "ModifierEnemyHealthAndDamage"
ModifierEnemyHealthAndDamage.name_id = "none"
ModifierEnemyHealthAndDamage.desc_id = "menu_cs_modifier_enemy_health_damage"
ModifierEnemyHealthAndDamage.total_localization = "menu_cs_modifier_health_damage_total"

function ModifierEnemyHealthAndDamage:init(data)
	ModifierEnemyHealthAndDamage.super.init(self, data)

	local excluded_enemies = tweak_data.crime_spree.excluded_enemies
	local health_exclude_list = excluded_enemies and excluded_enemies.health
	self._damage_exclude_list = excluded_enemies and excluded_enemies.damage

	MutatorEnemyHealth:modify_character_tweak_data(tweak_data.character, self:get_health_multiplier(), health_exclude_list)
end

function ModifierEnemyHealthAndDamage:get_health_multiplier()
	return 1 + self:value("health") / 100
end

function ModifierEnemyHealthAndDamage:get_damage_multiplier()
	return 1 + self:value("damage") / 100
end

function ModifierEnemyHealthAndDamage:modify_value(id, value, tweak_name)
	if id == "PlayerDamage:TakeDamageBullet" then
		local is_included = not self._damage_exclude_list or not self._damage_exclude_list[tweak_name]

		if is_included then
			return value * self:get_damage_multiplier()
		end
	end

	return value
end
