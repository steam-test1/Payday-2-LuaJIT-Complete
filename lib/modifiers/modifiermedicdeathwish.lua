ModifierMedicDeathwish = ModifierMedicDeathwish or class(BaseModifier)
ModifierMedicDeathwish._type = "ModifierMedicDeathwish"
ModifierMedicDeathwish.name_id = "none"
ModifierMedicDeathwish.desc_id = "menu_cs_modifier_medic_deathwish"

function ModifierMedicDeathwish:OnEnemyDied(unit, damage_info)
	if damage_info.is_synced or not managers.enemy:is_unit_registered_as_medic(unit) then
		return
	end

	local char_dmg_ext = unit:character_damage()

	if not char_dmg_ext or not char_dmg_ext.get_healing_radius then
		local str = not char_dmg_ext and "No 'character_damage_extension' on unit." or "No 'get_healing_radius' function in 'character_damage' extension of unit."

		Application:error("[ModifierMedicDeathwish:OnEnemyDied] " .. str, unit)

		return
	end

	local enemies = World:find_units_quick(unit, "sphere", unit:position(), char_dmg_ext:get_healing_radius(), managers.slot:get_mask("enemies"))
	local healed_anyone = false

	for _, enemy in ipairs(enemies) do
		if char_dmg_ext:heal_unit_external(enemy, false) then
			healed_anyone = true
		end
	end

	if healed_anyone then
		MedicActionHeal.check_achievements()
		managers.network:session():send_to_peers_synched("sync_medic_heal", nil)
	end
end
