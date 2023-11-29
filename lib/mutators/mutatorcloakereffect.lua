MutatorCloakerEffect = MutatorCloakerEffect or class(BaseMutator)
MutatorCloakerEffect._type = "MutatorCloakerEffect"
MutatorCloakerEffect.name_id = "mutator_cloaker_effect"
MutatorCloakerEffect.desc_id = "mutator_cloaker_effect_desc"
MutatorCloakerEffect.has_options = true
MutatorCloakerEffect.reductions = {
	money = 0,
	exp = 0
}
MutatorCloakerEffect.disables_achievements = true
MutatorCloakerEffect.categories = {
	"enemies"
}
MutatorCloakerEffect.icon_coords = {
	2,
	2
}

function MutatorCloakerEffect:register_values(mutator_manager)
	self:register_value("kick_effect", "explode", "ke")
end

function MutatorCloakerEffect:name(lobby_data)
	local name = MutatorCloakerEffect.super.name(self)

	if self:_mutate_name("kick_effect") then
		return string.format("%s - %s", name, managers.localization:text("menu_mutator_cloaker_effect_" .. tostring(self:value("kick_effect"))))
	else
		return name
	end
end

function MutatorCloakerEffect:kick_effect()
	return self:value("kick_effect")
end

function MutatorCloakerEffect:setup_options_gui(node)
	local params = {
		callback = "_update_mutator_value",
		name = "effect_selector_choice",
		text_id = "menu_mutator_cloaker_effect",
		filter = true,
		update_callback = callback(self, self, "_update_selected_effect")
	}
	local data_node = {
		{
			value = "explode",
			text_id = "menu_mutator_cloaker_effect_explode",
			_meta = "option"
		},
		{
			value = "fire",
			text_id = "menu_mutator_cloaker_effect_fire",
			_meta = "option"
		},
		{
			value = "smoke",
			text_id = "menu_mutator_cloaker_effect_smoke",
			_meta = "option"
		},
		{
			value = "random",
			text_id = "menu_mutator_cloaker_effect_random",
			_meta = "option"
		},
		type = "MenuItemMultiChoice"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:kick_effect())
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorCloakerEffect:_update_selected_effect(item)
	self:set_value("kick_effect", item:value())
end

function MutatorCloakerEffect:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("effect_selector_choice")

		if slider then
			slider:set_value(self:kick_effect())
		end
	end
end

function MutatorCloakerEffect:OnPlayerCloakerKicked(cloaker_unit)
	local effect_func = MutatorCloakerEffect["effect_" .. tostring(self:kick_effect())]

	if effect_func then
		effect_func(self, cloaker_unit)
	end
end

function MutatorCloakerEffect:effect_smoke(unit)
	local mov_ext = unit:movement()
	local tracker = mov_ext and mov_ext:nav_tracker()
	local pos = tracker and tracker:field_position() or unit:position()
	local ray_to = mvector3.copy(pos)

	mvector3.set_z(ray_to, ray_to.z - 50)

	local ground_ray = unit:raycast("ray", pos, ray_to, "slot_mask", managers.slot:get_mask("statics"))

	if ground_ray then
		mvector3.set(pos, ground_ray.hit_position)
		mvector3.set_z(pos, pos.z + 3)
	end

	local duration = tweak_data.group_ai.smoke_grenade_lifetime

	managers.groupai:state():spawn_instant_local_smoke_grenade(pos, duration)
end

function MutatorCloakerEffect:effect_fire(unit)
	local mov_ext = unit:movement()
	local tracker = mov_ext and mov_ext:nav_tracker()
	local pos = tracker and tracker:field_position() or unit:position()
	local ray_to = mvector3.copy(pos)

	mvector3.set_z(ray_to, ray_to.z - 50)

	local ground_ray = unit:raycast("ray", pos, ray_to, "slot_mask", managers.slot:get_mask("statics"))

	if ground_ray then
		mvector3.set(pos, ground_ray.hit_position)
		mvector3.set_z(pos, pos.z + 3)
	end

	local data = managers.mutators:is_mutator_active(MutatorEnemyReplacer) and self:cloaker_fire_small() or self:cloaker_fire_large()

	EnvironmentFire.spawn(pos, unit:rotation(), data, math.UP, unit, nil, 0, 1)
end

function MutatorCloakerEffect:effect_explode(unit)
	local foot = unit:get_object(Idstring("RightFoot"))
	local pos = foot and foot:position() or unit:position()
	local range = 800
	local ply_damage = 100
	local normal = math.UP
	local effect_params = {
		sound_event = "grenade_explode",
		effect = "effects/payday2/particles/explosions/grenade_explosion",
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		feedback_range = range * 2
	}

	managers.explosion:give_local_player_dmg(pos, range, ply_damage)
	managers.explosion:play_sound_and_effects(pos, normal, range, effect_params)

	if Network:is_server() then
		local damage = 1000
		local curve_pow = 3
		local damage_params = {
			no_raycast_check_characters = true,
			player_damage = 0,
			hit_pos = pos,
			range = range,
			collision_slotmask = managers.slot:get_mask("explosion_targets"),
			curve_pow = curve_pow,
			damage = damage,
			user = unit,
			ignore_unit = unit
		}

		managers.explosion:detect_and_give_dmg(damage_params)
		managers.network:session():send_to_peers_synched("element_explode_on_client", pos, normal, damage, range, curve_pow)
	end
end

MutatorCloakerEffect.random_effects = {
	"effect_smoke",
	"effect_fire",
	"effect_explode"
}

function MutatorCloakerEffect:effect_random(unit)
	local len = #self.random_effects
	local rand = math.clamp(unit:id() % len + 1, 1, len)
	local effect = self.random_effects[rand]

	self[effect](self, unit)
end

function MutatorCloakerEffect:cloaker_fire_large()
	local params = {
		sound_event = "molotov_impact",
		range = 75,
		curve_pow = 3,
		damage = 1,
		fire_alert_radius = 1500,
		hexes = 6,
		sound_event_burning = "burn_loop_gen",
		alert_radius = 1500,
		player_damage = 2,
		sound_event_impact_duration = 4,
		burn_tick_period = 0.5,
		burn_duration = 15,
		dot_data_name = "enemy_mutator_cloaker_groundfire",
		effect_name = "effects/payday2/particles/explosions/molotov_grenade"
	}

	return params
end

function MutatorCloakerEffect:cloaker_fire_small()
	local params = self:cloaker_fire_large()
	params.hexes = 2

	return params
end
