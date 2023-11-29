ModifierNoHurtAnims = ModifierNoHurtAnims or class(BaseModifier)
ModifierNoHurtAnims._type = "ModifierNoHurtAnims"
ModifierNoHurtAnims.name_id = "none"
ModifierNoHurtAnims.desc_id = "menu_cs_modifier_no_hurt"
ModifierNoHurtAnims.PreventedHurtTypes = table.list_to_set({
	"expl_hurt",
	"fire_hurt",
	"poison_hurt",
	"heavy_hurt",
	"hurt"
})
ModifierNoHurtAnims.IgnoredVariants = table.list_to_set({
	"melee",
	"stun"
})

function ModifierNoHurtAnims:modify_value(id, value, variant)
	if id == "CopMovement:HurtType" and not ModifierNoHurtAnims.IgnoredVariants[variant] and ModifierNoHurtAnims.PreventedHurtTypes[value] then
		return nil, true
	end

	return value
end
