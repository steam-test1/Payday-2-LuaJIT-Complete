ModifierEnemyDamage = ModifierEnemyDamage or class(BaseModifier)
ModifierEnemyDamage._type = "ModifierEnemyDamage"
ModifierEnemyDamage.name_id = "none"
ModifierEnemyDamage.desc_id = "menu_cs_modifier_enemy_damage"
ModifierEnemyDamage.default_value = "damage"
ModifierEnemyDamage.total_localization = "menu_cs_modifier_total_generic_percent"

function ModifierEnemyDamage:init(data)
	ModifierEnemyDamage.super.init(self, data)

	local excluded_enemies = tweak_data.crime_spree.excluded_enemies
	self._damage_exclude_list = excluded_enemies and excluded_enemies.damage
end

function ModifierEnemyDamage:get_damage_multiplier()
	return 1 + self:value() / 100
end

function ModifierEnemyDamage:modify_value(id, value, tweak_name)
	if id == "PlayerDamage:TakeDamageBullet" then
		local is_included = not self._damage_exclude_list or not self._damage_exclude_list[tweak_name]

		if is_included then
			return value * self:get_damage_multiplier()
		end
	end

	return value
end
