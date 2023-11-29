MutatorShieldDozers = MutatorShieldDozers or class(BaseMutator)
MutatorShieldDozers._type = "MutatorShieldDozers"
MutatorShieldDozers.name_id = "mutator_shield_dozers"
MutatorShieldDozers.desc_id = "mutator_shield_dozers_desc"
MutatorShieldDozers.reductions = {
	money = 0,
	exp = 0
}
MutatorShieldDozers.disables_achievements = true
MutatorShieldDozers.categories = {
	"enemies"
}
MutatorShieldDozers.icon_coords = {
	1,
	2
}
MutatorShieldDozers.shield_units = {
	"units/payday2/characters/ene_acc_shield_lights/ene_acc_shield_lights",
	"units/payday2/characters/ene_acc_shield_lights/ene_acc_shield_lights",
	"units/payday2/characters/ene_acc_shield_small/shield_small"
}

function MutatorShieldDozers:modify_value(id, value)
	if id == "CopInventory:add_unit_by_name" then
		local base_ext = value._unit:base()

		if base_ext and base_ext.has_tag and base_ext:has_tag("tank") then
			local len = #self.shield_units
			local rand = math.clamp(value._unit:id() % len + 1, 1, len)
			local shield = self.shield_units[rand]
			value._shield_unit_name = self.shield_units[rand]
			value._shield_align_name = Idstring("a_weapon_left_front")
		end
	end
end
