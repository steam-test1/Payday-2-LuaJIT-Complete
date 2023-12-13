ModifierCloakerTearGas = ModifierCloakerTearGas or class(BaseModifier)
ModifierCloakerTearGas._type = "ModifierCloakerTearGas"
ModifierCloakerTearGas.name_id = "none"
ModifierCloakerTearGas.desc_id = "menu_cs_modifier_cloaker_tear_gas"

function ModifierCloakerTearGas:OnEnemyDied(unit, damage_info)
	local base_ext = unit:base()

	if base_ext and base_ext.has_tag and base_ext:has_tag("spooc") then
		local pos = unit:position()
		local ray = unit:raycast("ray", pos, pos + math.UP * -500, "slot_mask", managers.slot:get_mask("world_geometry"))

		if ray then
			mvector3.set(pos, ray.hit_position)
		else
			local tracker = unit:movement():nav_tracker()

			if tracker then
				if tracker:lost() then
					tracker:field_m_position(pos)
				else
					tracker:m_position(pos)
				end
			end
		end

		local grenade = World:spawn_unit(Idstring("units/pd2_dlc_drm/weapons/smoke_grenade_tear_gas/smoke_grenade_tear_gas_local"), pos, Rotation(math.random() * 360, 0, 0))

		grenade:base():set_properties({
			radius = self:value("diameter") * 0.5 * 100,
			damage = self:value("damage") * 0.1,
			duration = self:value("duration")
		})
		grenade:base():detonate()
	end
end
