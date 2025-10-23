MutatorExplodingEnemies = MutatorExplodingEnemies or class(BaseMutator)
MutatorExplodingEnemies._type = "MutatorExplodingEnemies"
MutatorExplodingEnemies.name_id = "mutator_creeps"
MutatorExplodingEnemies.desc_id = "mutator_creeps_desc"
MutatorExplodingEnemies.has_options = true
MutatorExplodingEnemies.reductions = {
	money = 0.5,
	exp = 0.5
}
MutatorExplodingEnemies.categories = {
	"enemies",
	"gameplay"
}
MutatorExplodingEnemies.icon_coords = {
	2,
	1
}

function MutatorExplodingEnemies:register_values(mutator_manager)
	self:register_value("explosion_size", 4, "es")
	self:register_value("nuclear_dozers", false, "nd")
	self:register_value("explosion_delay", 0, "ed")
end

function MutatorExplodingEnemies:setup(mutator_manager)
	self._explosions = {}

	mutator_manager:register_message(Message.OnCopDamageDeath, "MutatorExplodingEnemies", callback(self, self, "explode"))
end

function MutatorExplodingEnemies:name()
	local name = MutatorExplodingEnemies.super.name(self)

	if self:_mutate_name("explosion_size") then
		name = string.format("%s - %.1fm", name, tonumber(self:value("explosion_size")))
	end

	if self:_mutate_name("nuclear_dozers") then
		name = string.format("%s - %s", name, managers.localization:text("menu_mutator_creeps_nuclear"))
	end

	if self:_mutate_name("explosion_delay") then
		local macros = {
			delay = string.format("%.2f", self:value("explosion_delay"))
		}
		name = string.format("%s - %s", name, managers.localization:text("menu_mutator_creeps_name_delay", macros))
	end

	return name
end

function MutatorExplodingEnemies:default_explosion_size()
	return 4
end

function MutatorExplodingEnemies:get_explosion_size()
	return self:value("explosion_size")
end

function MutatorExplodingEnemies:use_nuclear_bulldozers()
	return self:value("nuclear_dozers")
end

function MutatorExplodingEnemies:explosion_delay()
	return self:value("explosion_delay")
end

function MutatorExplodingEnemies:_min_explosion_size()
	return 2
end

function MutatorExplodingEnemies:_max_explosion_size()
	return 6
end

function MutatorExplodingEnemies:setup_options_gui(node)
	local params = {
		name = "explosion_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_creeps_scale",
		update_callback = callback(self, self, "_update_explosion_size")
	}
	local data_node = {
		show_value = true,
		step = 0.5,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 1,
		min = self:_min_explosion_size(),
		max = self:_max_explosion_size()
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:get_explosion_size())
	node:add_item(new_item)

	local params = {
		name = "delay_slider",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_creeps_delay",
		update_callback = callback(self, self, "_update_explosion_delay")
	}
	local data_node = {
		show_value = true,
		min = 0,
		step = 0.25,
		type = "CoreMenuItemSlider.ItemSlider",
		decimal_count = 2,
		max = 3
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:explosion_delay())
	node:add_item(new_item)

	local params = {
		name = "nuclear_dozers_toggle",
		callback = "_update_mutator_value",
		text_id = "menu_mutator_creeps_nuclear",
		update_callback = callback(self, self, "_toggle_nuclear_bulldozers")
	}
	local data_node = {
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "on",
			s_w = 24,
			s_h = 24,
			s_x = 24,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 24,
			s_icon = "guis/textures/menu_tickbox"
		},
		{
			w = 24,
			y = 0,
			h = 24,
			s_y = 24,
			value = "off",
			s_w = 24,
			s_h = 24,
			s_x = 0,
			_meta = "option",
			icon = "guis/textures/menu_tickbox",
			x = 0,
			s_icon = "guis/textures/menu_tickbox"
		},
		type = "CoreMenuItemToggle.ItemToggle"
	}
	local new_item = node:create_item(data_node, params)

	new_item:set_value(self:use_nuclear_bulldozers() and "on" or "off")
	node:add_item(new_item)

	self._node = node

	return new_item
end

function MutatorExplodingEnemies:_update_explosion_size(item)
	self:set_value("explosion_size", item:value())
end

function MutatorExplodingEnemies:_toggle_nuclear_bulldozers(item)
	self:set_value("nuclear_dozers", item:value() == "on")
end

function MutatorExplodingEnemies:_update_explosion_delay(item)
	self:set_value("explosion_delay", item:value())
end

function MutatorExplodingEnemies:reset_to_default()
	self:clear_values()

	if self._node then
		local slider = self._node:item("explosion_slider")

		if slider then
			slider:set_value(self:get_explosion_size())
		end

		local slider = self._node:item("delay_slider")

		if slider then
			slider:set_value(self:explosion_delay())
		end

		local toggle = self._node:item("nuclear_dozers_toggle")

		if toggle then
			toggle:set_value(self:use_nuclear_bulldozers() and "on" or "off")
		end
	end
end

function MutatorExplodingEnemies:options_fill()
	return self:_get_percentage_fill(self:_min_explosion_size(), self:_max_explosion_size(), self:get_explosion_size())
end

function MutatorExplodingEnemies:update(t, dt)
	for i = #self._explosions, 1, -1 do
		local entry = self._explosions[i]
		entry.t = entry.t - dt

		if entry.t < 0 then
			self:_detonate(entry.data)
			table.remove(self._explosions, i)
		end
	end
end

function MutatorExplodingEnemies:explode(unit, attack_data)
	local attacker, can_sync = self:_get_attacker_unit_and_sync(attack_data.attacker_unit)
	local data = {
		unit = unit,
		attacker_unit = attacker,
		can_sync = can_sync,
		is_nuclear = self:_chk_nuclear(unit),
		m_com = unit:movement() and unit:movement():m_com(),
		damage = math.max(attack_data.raw_damage or attack_data.damage or unit:character_damage() and unit:character_damage().init_health or 8, 0)
	}
	local explosion_delay = self:explosion_delay()

	if explosion_delay <= 0 then
		self:_detonate(data)
	else
		table.insert(self._explosions, {
			data = data,
			t = explosion_delay
		})
	end
end

function MutatorExplodingEnemies:_chk_nuclear(unit)
	if not self:use_nuclear_bulldozers() then
		return false
	end

	local base_ext = unit:base()

	if base_ext and base_ext.has_tag and base_ext:has_tag("tank") then
		return true
	end

	return false
end

function MutatorExplodingEnemies:_get_attacker_unit_and_sync(attacker)
	local is_local_player = false
	local base_ext = alive(attacker) and attacker:base()

	if base_ext then
		if base_ext.thrower_unit then
			attacker = base_ext:thrower_unit()
			base_ext = alive(attacker) and attacker:base()
		end

		is_local_player = base_ext and base_ext.is_local_player
	end

	attacker = alive(attacker) and attacker or nil
	local can_deal_and_sync_damage = nil
	can_deal_and_sync_damage = (not Network:is_server() or base_ext and base_ext.is_husk_player and false and false) and (is_local_player or false)

	return attacker, can_deal_and_sync_damage
end

function MutatorExplodingEnemies:_detonate(data)
	local pos = mvector3.copy(data.m_com)
	local range = data.is_nuclear and 2000 or self:get_explosion_size() * 100
	range = math.clamp(range, 0, 4000)
	local damage = data.damage * (data.is_nuclear and 2.5 or 1)
	damage = math.clamp(damage, 0, 100)
	local ply_damage = damage * 0.5
	local normal = math.UP
	local curve_pow = data.is_nuclear and 6 or 4
	local effect = data.is_nuclear and "effects/payday2/particles/explosions/bag_explosion" or "effects/payday2/particles/explosions/grenade_explosion"
	local effect_params = {
		sound_event = "grenade_explode",
		camera_shake_max_mul = 4,
		sound_muffle_effect = true,
		effect = effect,
		feedback_range = range * 2
	}

	managers.explosion:give_local_player_dmg(pos, range, ply_damage)
	managers.explosion:play_sound_and_effects(pos, normal, range, effect_params)

	if data.can_sync then
		local damage_params = {
			no_raycast_check_characters = true,
			hit_pos = pos,
			range = range,
			collision_slotmask = managers.slot:get_mask("explosion_targets"),
			curve_pow = curve_pow,
			damage = damage,
			player_damage = ply_damage,
			ignore_unit = alive(data.unit) and data.unit or nil,
			user = alive(data.attacker_unit) and data.attacker_unit or nil
		}

		managers.explosion:detect_and_give_dmg(damage_params)
		managers.network:session():send_to_peers_synched("element_explode_on_client", pos, normal, damage, range, curve_pow)
	end
end
