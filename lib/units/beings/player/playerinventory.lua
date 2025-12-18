PlayerInventory = PlayerInventory or class()
PlayerInventory._all_event_types = {
	"add",
	"equip",
	"unequip",
	"shield_equip",
	"shield_unequip"
}
local ids_unit = Idstring("unit")
PlayerInventory._NET_EVENTS = {
	feedback_start = 3,
	jammer_start = 1,
	jammer_stop = 2,
	feedback_stop = 4
}

function PlayerInventory:init(unit)
	self._unit = unit
	self._available_selections = {}
	self._equipped_selection = nil
	self._latest_addition = nil
	self._selected_primary = nil
	self._use_data_alias = "player"
	self._align_places = {
		right_hand = {
			on_body = false,
			obj3d_name = Idstring("a_weapon_right")
		},
		left_hand = {
			on_body = false,
			obj3d_name = Idstring("a_weapon_left")
		}
	}
	self._listener_id = "PlayerInventory" .. tostring(unit:key())
	self._listener_holder = EventListenerHolder:new()
	self._mask_unit = nil
	self._melee_weapon_unit = nil
	self._melee_weapon_unit_name = nil
end

function PlayerInventory:pre_destroy(unit)
	if self._weapon_add_clbk then
		if managers.enemy:is_clbk_registered(self._weapon_add_clbk) then
			managers.enemy:remove_delayed_clbk(self._weapon_add_clbk)
		else
			Application:error("[PlayerInventory] Attempted to remove a callback that wasn't registred! " .. tostring(self._weapon_add_clbk))
		end

		self._weapon_add_clbk = nil
	end

	if self._shield_request_clbk_id then
		managers.enemy:remove_delayed_clbk(self._shield_request_clbk_id)

		self._shield_request_clbk_id = nil
	end

	self:destroy_all_items()
	self:_chk_remove_queued_jammer_effects()
	self:_stop_jammer_effect()
	self:_stop_feedback_effect()

	if self._ignore_units then
		local destroy_key = self._ignore_destroy_listener_key

		for _, ig_unit in pairs(self._ignore_units) do
			if alive(ig_unit) then
				local has_destroy_listener = nil
				local listener_class = ig_unit:base()

				if listener_class and listener_class.add_destroy_listener then
					has_destroy_listener = true
				else
					listener_class = ig_unit:unit_data()

					if listener_class and listener_class.add_destroy_listener then
						has_destroy_listener = true
					end
				end

				if has_destroy_listener then
					listener_class:remove_destroy_listener(destroy_key)
				end
			end
		end

		self._ignore_units = nil
	end
end

function PlayerInventory:destroy_all_items()
	for i_sel, selection_data in pairs(self._available_selections) do
		if selection_data.unit and selection_data.unit:base() then
			selection_data.unit:base():remove_destroy_listener(self._listener_id)
			selection_data.unit:base():set_slot(selection_data.unit, 0)

			if selection_data.unit:base():charm_data() then
				managers.charm:remove_weapon(selection_data.unit)
				managers.belt:remove_weapon(selection_data.unit)
			end
		else
			debug_pause_unit(self._unit, "[PlayerInventory:destroy_all_items] broken inventory unit", selection_data.unit, selection_data.unit:base())
		end
	end

	self._equipped_selection = nil
	self._available_selections = {}

	if alive(self._mask_unit) then
		for _, linked_unit in ipairs(self._mask_unit:children()) do
			linked_unit:unlink()
			World:delete_unit(linked_unit)
		end

		World:delete_unit(self._mask_unit)

		self._mask_unit = nil
	end

	if self._melee_weapon_unit_name then
		managers.dyn_resource:unload(Idstring("unit"), self._melee_weapon_unit_name, DynamicResourceManager.DYN_RESOURCES_PACKAGE, false)

		self._melee_weapon_unit_name = nil
	end

	local shield_unit = self._shield_unit

	if alive(shield_unit) then
		self:unequip_shield()

		if Network:is_server() or shield_unit:id() == -1 then
			shield_unit:set_slot(0)
		else
			shield_unit:set_enabled(false)
		end
	end
end

function PlayerInventory:add_ignore_unit(unit)
	local has_destroy_listener = nil
	local listener_class = unit:base()

	if listener_class and listener_class.add_destroy_listener then
		has_destroy_listener = true
	else
		listener_class = unit:unit_data()

		if listener_class and listener_class.add_destroy_listener then
			has_destroy_listener = true
		end
	end

	if not has_destroy_listener then
		Application:error("[PlayerInventory:add_ignore_unit] Cannot set unit for ignoring as it lacks a destroy listener.", unit)

		return
	end

	self._ignore_destroy_listener_key = self._ignore_destroy_listener_key or "PlayerInventory" .. tostring(unit:key())

	listener_class:add_destroy_listener(self._ignore_destroy_listener_key, callback(self, self, "_clbk_remove_ignore_unit"))

	self._ignore_units = self._ignore_units or {}

	table.insert(self._ignore_units, unit)

	local weapon_selections = self:available_selections()

	if weapon_selections then
		for i_sel, selection_data in pairs(weapon_selections) do
			local weap_unit = selection_data.unit
			local weap_base = weap_unit and weap_unit:base()

			if weap_base and weap_base.add_ignore_unit then
				weap_base:add_ignore_unit(unit)
			end
		end
	end
end

function PlayerInventory:_clbk_remove_ignore_unit(unit)
	self:remove_ignore_unit(unit, true)
end

function PlayerInventory:remove_ignore_unit(unit, is_callback)
	if not self._ignore_units then
		return
	end

	table.delete(self._ignore_units, unit)

	if not next(self._ignore_units) then
		self._ignore_units = nil
	end

	local weapon_selections = self:available_selections()

	if weapon_selections then
		for i_sel, selection_data in pairs(weapon_selections) do
			local weap_unit = selection_data.unit
			local weap_base = weap_unit and weap_unit:base()

			if weap_base and weap_base.remove_ignore_unit then
				weap_base:remove_ignore_unit(unit)
			end
		end
	end

	if not is_callback and alive(unit) then
		local has_destroy_listener = nil
		local listener_class = unit:base()

		if listener_class and listener_class.add_destroy_listener then
			has_destroy_listener = true
		else
			listener_class = unit:unit_data()

			if listener_class and listener_class.add_destroy_listener then
				has_destroy_listener = true
			end
		end

		if has_destroy_listener then
			listener_class:remove_destroy_listener(self._ignore_destroy_listener_key)
		end
	end
end

function PlayerInventory:equipped_selection()
	return self._equipped_selection
end

function PlayerInventory:equipped_unit()
	return self._equipped_selection and self._available_selections[self._equipped_selection].unit
end

function PlayerInventory:unit_by_selection(selection)
	selection = (tonumber(selection) - 1) % 2 + 1

	return self._available_selections[selection] and self._available_selections[selection].unit
end

function PlayerInventory:is_selection_available(selection_index)
	return self._available_selections[selection_index] and true or false
end

function PlayerInventory:add_unit(new_unit, is_equip, equip_is_instant)
	local new_selection = {}
	local use_data = new_unit:base():get_use_data(self._use_data_alias)
	new_selection.use_data = use_data
	new_selection.unit = new_unit

	new_unit:base():add_destroy_listener(self._listener_id, callback(self, self, "clbk_weapon_unit_destroyed"))

	local selection_index = use_data.selection_index

	if self._available_selections[selection_index] then
		local old_weapon_unit = self._available_selections[selection_index].unit
		is_equip = is_equip or old_weapon_unit == self:equipped_unit()

		old_weapon_unit:base():remove_destroy_listener(self._listener_id)
		old_weapon_unit:base():set_slot(old_weapon_unit, 0)
		World:delete_unit(old_weapon_unit)

		if self._equipped_selection == selection_index then
			self._equipped_selection = nil
		end
	end

	self._available_selections[selection_index] = new_selection
	self._latest_addition = selection_index
	self._selected_primary = self._selected_primary or selection_index

	self:_call_listeners("add")

	if is_equip then
		self:equip_latest_addition(equip_is_instant)
	else
		self:_place_selection(selection_index, is_equip)
	end
end

function PlayerInventory:clbk_weapon_unit_destroyed(weap_unit)
	local weapon_key = weap_unit:key()

	managers.dyn_resource:unload(ids_unit, weap_unit:name(), managers.dyn_resource.DYN_RESOURCES_PACKAGE)

	for i_sel, sel_data in pairs(self._available_selections) do
		if sel_data.unit:key() == weapon_key then
			if i_sel == self._equipped_selection then
				self:_call_listeners("unequip")
			end

			self:remove_selection(i_sel, true)

			break
		end
	end
end

function PlayerInventory:get_latest_addition_hud_data()
	local unit = self._available_selections[self._latest_addition].unit
	local _, _, amount = unit:base():ammo_info()

	return {
		is_equip = self._latest_addition == self._selected_primary,
		amount = amount,
		inventory_index = self._latest_addition,
		unit = unit
	}
end

function PlayerInventory:add_unit_by_name(new_unit_name, equip, instant)
	for _, selection in pairs(self._available_selections) do
		if selection.unit:name() == new_unit_name then
			return
		end
	end

	managers.dyn_resource:load(ids_unit, new_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)

	local new_unit = World:spawn_unit(new_unit_name, Vector3(), Rotation())
	local ignore_units = {
		self._unit,
		new_unit
	}

	if self._ignore_units then
		for idx, ig_unit in pairs(self._ignore_units) do
			table.insert(ignore_units, ig_unit)
		end
	end

	local setup_data = {
		user_unit = self._unit,
		ignore_units = ignore_units,
		expend_ammo = true,
		autoaim = true,
		alert_AI = true,
		alert_filter = self._unit:movement():SO_access()
	}

	new_unit:base():setup(setup_data)
	self:add_unit(new_unit, equip, instant)
end

function PlayerInventory:add_unit_by_factory_name(factory_name, equip, instant, blueprint, cosmetics, texture_switches)
	local ids_unit_name = Idstring(managers.weapon_factory:get_weapon_unit(factory_name, blueprint))

	managers.dyn_resource:load(ids_unit, ids_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE, nil)

	local new_unit = World:spawn_unit(ids_unit_name, Vector3(), Rotation())

	new_unit:base():set_factory_data(factory_name)
	new_unit:base():set_cosmetics_data(cosmetics)
	new_unit:base():set_texture_switches(texture_switches)

	if blueprint then
		new_unit:base():assemble_from_blueprint(factory_name, blueprint)
	else
		new_unit:base():assemble(factory_name)
	end

	local ignore_units = {
		self._unit,
		new_unit
	}

	if self._ignore_units then
		for idx, ig_unit in pairs(self._ignore_units) do
			table.insert(ignore_units, ig_unit)
		end
	end

	local setup_data = {
		user_unit = self._unit,
		ignore_units = ignore_units,
		expend_ammo = true,
		autoaim = true,
		alert_AI = true,
		alert_filter = self._unit:movement():SO_access(),
		timer = managers.player:player_timer()
	}

	if blueprint then
		setup_data.panic_suppression_skill = not managers.weapon_factory:has_perk("silencer", factory_name, blueprint) and managers.player:has_category_upgrade("player", "panic_suppression") or false
	end

	new_unit:base():setup(setup_data)
	self:add_unit(new_unit, equip, instant)

	if new_unit:base().AKIMBO then
		new_unit:base():create_second_gun()
	end
end

function PlayerInventory:remove_selection(selection_index, instant)
	selection_index = selection_index or self._equipped_selection
	local weap_unit = self._available_selections[selection_index].unit

	if alive(weap_unit) then
		weap_unit:base():remove_destroy_listener(self._listener_id)
	end

	self._available_selections[selection_index] = nil

	if self._equipped_selection == selection_index then
		self._equipped_selection = nil
	end

	if selection_index == self._selected_primary then
		self._selected_primary = self:_select_new_primary()
	end
end

function PlayerInventory:equip_latest_addition(instant)
	return self:equip_selection(self._latest_addition, instant)
end

function PlayerInventory:equip_selected_primary(instant)
	return self:equip_selection(self._selected_primary, instant)
end

function PlayerInventory:get_next_selection()
	local i = self._selected_primary

	for i = self._selected_primary, self._selected_primary + 9 do
		local selection = 1 + math.mod(i, 10)

		if self._available_selections[selection] then
			return self._available_selections[selection], selection
		end
	end

	return nil
end

function PlayerInventory:equip_next(instant)
	local got, selection = self:get_next_selection()

	if got then
		return self:equip_selection(selection, instant)
	end

	return false
end

function PlayerInventory:get_previous_selection()
	local i = self._selected_primary

	for i = self._selected_primary, self._selected_primary - 9, -1 do
		local selection = 1 + math.mod(8 + i, 10)

		if self._available_selections[selection] then
			return self._available_selections[selection], selection
		end
	end

	return nil
end

function PlayerInventory:equip_previous(instant)
	local got, selection = self:get_previous_selection()

	if got then
		return self:equip_selection(selection, instant)
	end

	return false
end

function PlayerInventory:get_selected(selection_index)
	return selection_index and selection_index ~= self._equipped_selection and self._available_selections[selection_index]
end

function PlayerInventory:equip_selection(selection_index, instant)
	if selection_index and selection_index ~= self._equipped_selection and self._available_selections[selection_index] then
		if self._equipped_selection then
			self:unequip_selection(nil, instant)
		end

		self._equipped_selection = selection_index

		self:_place_selection(selection_index, true)

		self._selected_primary = selection_index

		self:_send_equipped_weapon()
		self:_call_listeners("equip")

		if self._unit:unit_data().mugshot_id then
			local hud_icon_id = self:equipped_unit():base():weapon_tweak_data().hud_icon

			managers.hud:set_mugshot_weapon(self._unit:unit_data().mugshot_id, hud_icon_id, self:equipped_unit():base():weapon_tweak_data().use_data.selection_index)
		end

		self:equipped_unit():base():set_flashlight_enabled(true)
		self:equipped_unit():base():set_scope_enabled(true)

		return true
	end

	return false
end

function PlayerInventory:_send_equipped_weapon()
	local equipped_unit_base = self:equipped_unit():base()
	local equipped_unit_name = equipped_unit_base._factory_id or self:equipped_unit():name()
	local item_index = self._get_weapon_sync_index(equipped_unit_name)

	if not item_index then
		debug_pause("[PlayerInventory:_send_equipped_weapon] cannot sync weapon", equipped_unit_name, self._unit)

		return
	end

	local blueprint_string = equipped_unit_base._blueprint and equipped_unit_base.blueprint_to_string and equipped_unit_base:blueprint_to_string() or ""
	local cosmetics_data = equipped_unit_base.get_cosmetics and equipped_unit_base:get_cosmetics()
	local cosmetics_string = managers.blackmarket:outfit_string_from_cosmetics(cosmetics_data)

	self._unit:network():send("set_equipped_weapon", item_index, blueprint_string, cosmetics_string)
end

function PlayerInventory:unequip_selection(selection_index, instant)
	if not selection_index or selection_index == self._equipped_selection then
		self:_call_listeners("unequip")
		self:equipped_unit():base():set_flashlight_enabled(false)
		self:equipped_unit():base():set_scope_enabled(false)

		selection_index = selection_index or self._equipped_selection

		self:_place_selection(selection_index, false)

		self._equipped_selection = nil
	end
end

function PlayerInventory:is_equipped(index)
	return index == self._equipped_selection
end

function PlayerInventory:available_selections()
	return self._available_selections
end

function PlayerInventory:num_selections()
	return table.size(self._available_selections)
end

function PlayerInventory:_align_place(equip, unit, align_place)
	if equip and self._primary_hand ~= nil then
		return self._primary_hand == 0 and self._align_places.right_hand or self._align_places.left_hand, unit:base().AKIMBO and self._primary_hand == 0 and self._align_places.left_hand or self._align_places.right_hand
	end

	return self._align_places[align_place]
end

function PlayerInventory:_place_selection(selection_index, is_equip)
	local selection = self._available_selections[selection_index]
	local unit = selection.unit
	local weap_align_data = selection.use_data[is_equip and "equip" or "unequip"]
	local align_place = self:_align_place(is_equip, unit, weap_align_data.align_place)

	if align_place then
		if is_equip then
			call_on_next_update(function ()
				if alive(unit) then
					unit:set_enabled(true)
					unit:base():on_enabled()
				end
			end)
		end

		local res = self:_link_weapon(unit, align_place)
	else
		unit:unlink()
		unit:set_enabled(false)
		unit:base():on_disabled()

		if unit:base().gadget_on and self._unit:movement().set_cbt_permanent then
			self._unit:movement():set_cbt_permanent(false)
		end
	end
end

function PlayerInventory:_link_weapon(unit, align_place)
	if _G.IS_VR then
		local is_player = managers.player:player_unit() == self._unit

		if is_player then
			return
		end
	end

	local parent_unit = align_place.on_body and self._unit or self._unit:camera()._camera_unit
	local res = parent_unit:link(align_place.obj3d_name, unit, unit:orientation_object():name())

	return res
end

function PlayerInventory:_select_new_primary()
	for index, use_data in pairs(self._available_selections) do
		return index
	end
end

function PlayerInventory:add_listener(key, events, clbk)
	events = events or self._all_event_types

	self._listener_holder:add(key, events, clbk)
end

function PlayerInventory:remove_listener(key)
	self._listener_holder:remove(key)
end

function PlayerInventory:_call_listeners(event)
	self._listener_holder:call(event, self._unit, event)
end

function PlayerInventory:on_death_exit()
	for i, selection in pairs(self._available_selections) do
		selection.unit:unlink()
	end

	self:_chk_remove_queued_jammer_effects()
	self:_stop_jammer_effect()
	self:_stop_feedback_effect()
end

function PlayerInventory._chk_create_w_factory_indexes()
	if PlayerInventory._weapon_factory_indexed then
		return
	end

	local weapon_factory_indexed = {}
	PlayerInventory._weapon_factory_indexed = weapon_factory_indexed

	for id, data in pairs(tweak_data.weapon.factory) do
		if id ~= "parts" and data.unit then
			table.insert(weapon_factory_indexed, id)
		end
	end

	table.sort(weapon_factory_indexed, function (a, b)
		return a < b
	end)
end

function PlayerInventory._get_weapon_sync_index(wanted_weap_name)
	if type_name(wanted_weap_name) == "Idstring" then
		for i, test_weap_name in ipairs(tweak_data.character.weap_unit_names) do
			if test_weap_name == wanted_weap_name then
				return i
			end
		end
	end

	PlayerInventory._chk_create_w_factory_indexes()

	local start_index = #tweak_data.character.weap_unit_names

	for i, factory_id in ipairs(PlayerInventory._weapon_factory_indexed) do
		if wanted_weap_name == factory_id then
			return start_index + i
		end
	end
end

function PlayerInventory._get_weapon_name_from_sync_index(w_index)
	if w_index <= #tweak_data.character.weap_unit_names then
		return tweak_data.character.weap_unit_names[w_index]
	end

	w_index = w_index - #tweak_data.character.weap_unit_names

	PlayerInventory._chk_create_w_factory_indexes()

	return PlayerInventory._weapon_factory_indexed[w_index]
end

function PlayerInventory:hide_equipped_unit()
	local unit = self._equipped_selection and self._available_selections[self._equipped_selection].unit

	if unit then
		unit:base():set_visibility_state(false)

		local was_gadget_on = unit:base().is_gadget_on and unit:base()._gadget_on or false

		if was_gadget_on then
			unit:base()._last_gadget_idx = was_gadget_on

			unit:base():set_gadget_on(0)
		end
	end
end

function PlayerInventory:show_equipped_unit()
	local unit = self._equipped_selection and self._available_selections[self._equipped_selection].unit

	if unit then
		unit:base():set_visibility_state(true)

		if unit:base()._last_gadget_idx and unit:base()._last_gadget_idx > 0 then
			unit:base():set_gadget_on(unit:base()._last_gadget_idx)
		end
	end
end

PlayerInventory._start_jammer_func_lookup_drop_in_save = {
	jamming = "_start_jammer_effect_drop_in_save",
	feedback = "_start_feedback_effect_drop_in_save"
}
PlayerInventory._start_jammer_func_lookup_drop_in_load = {
	jamming = "_start_jammer_effect_drop_in_load",
	feedback = "_start_feedback_effect_drop_in_load"
}

function PlayerInventory:_start_jammer_effect_drop_in_save(save_data, jammer_data)
	save_data._jammer_data = {
		t = jammer_data.t - TimerManager:game():time(),
		effect = jammer_data.effect,
		queued_effects = jammer_data.queued_effects
	}
end

function PlayerInventory:_start_feedback_effect_drop_in_save(save_data, jammer_data)
	save_data._jammer_data = {
		t = jammer_data.t - TimerManager:game():time(),
		effect = jammer_data.effect,
		queued_effects = jammer_data.queued_effects
	}
end

function PlayerInventory:_start_jammer_effect_drop_in_load(jammer_data)
	self:_start_jammer_effect(jammer_data.t)
end

function PlayerInventory:_start_feedback_effect_drop_in_load(jammer_data)
	self:_start_feedback_effect(jammer_data.t)
end

function PlayerInventory:save(save_data)
	local my_save_data = {}

	if self._equipped_selection then
		local eq_weap_name = self:equipped_unit():base()._factory_id or self:equipped_unit():name()
		local index = self._get_weapon_sync_index(eq_weap_name)
		my_save_data.equipped_weapon_index = index
		my_save_data.mask_visibility = self._mask_visibility
		my_save_data.blueprint_string = self:equipped_unit():base().blueprint_to_string and self:equipped_unit():base():blueprint_to_string() or nil
		my_save_data.gadget_on = self:equipped_unit():base().gadget_on and self:equipped_unit():base()._gadget_on
		local gadget = self:equipped_unit():base().get_active_gadget and self:equipped_unit():base():get_active_gadget()

		if gadget and gadget.color then
			my_save_data.gadget_color = gadget:color()
		end

		local cosmetics_data = self:equipped_unit():base().get_cosmetics and self:equipped_unit():base():get_cosmetics()
		my_save_data.cosmetics_string = managers.blackmarket:outfit_string_from_cosmetics(cosmetics_data)
	end

	local jammer_func = self._jammer_data and self._start_jammer_func_lookup_drop_in_save[self._jammer_data.effect]

	if jammer_func and self[jammer_func] then
		self[jammer_func](self, my_save_data, self._jammer_data)
	end

	if alive(self._shield_unit) then
		if self._shield_unit:id() ~= -1 then
			my_save_data.needs_shield_link_request = true
		end
	elseif self._shield_was_synced then
		my_save_data.chk_shield_dummy_removal = true
	end

	if next(my_save_data) then
		save_data.inventory = my_save_data
	end
end

function PlayerInventory:cosmetics_string_from_peer(peer, weapon_name)
	if peer then
		local outfit = peer:blackmarket_outfit()
		local cosmetics = outfit.primary.factory_id .. "_npc" == weapon_name and outfit.primary.cosmetics or outfit.secondary.factory_id .. "_npc" == weapon_name and outfit.secondary.cosmetics

		return managers.blackmarket:outfit_string_from_cosmetics(cosmetics)
	end
end

function PlayerInventory:load(load_data)
	local my_load_data = load_data.inventory

	if not my_load_data then
		return
	end

	if my_load_data.equipped_weapon_index then
		self._weapon_add_clbk = "playerinventory_load_weapon_add" .. tostring(self._unit:key())
		local delayed_data = {
			equipped_weapon_index = my_load_data.equipped_weapon_index,
			blueprint_string = my_load_data.blueprint_string,
			cosmetics_string = my_load_data.cosmetics_string,
			gadget_on = my_load_data.gadget_on,
			gadget_color = my_load_data.gadget_color
		}

		managers.enemy:add_delayed_clbk(self._weapon_add_clbk, callback(self, self, "_clbk_weapon_add", delayed_data), Application:time() + 1)
	end

	self._mask_visibility = my_load_data.mask_visibility and true or false
	local jammer_data = my_load_data._jammer_data
	local jammer_func = jammer_data and self._start_jammer_func_lookup_drop_in_load[jammer_data.effect]

	if jammer_func and self[jammer_func] then
		self[jammer_func](self, jammer_data)

		if self._jammer_data and jammer_data.queued_effects then
			self._jammer_data.queued_effects = jammer_data.queued_effects
		end
	end

	if my_load_data.chk_shield_dummy_removal then
		self._shield_unit_name = nil
		local shield_unit = self._shield_unit

		if alive(shield_unit) and shield_unit:id() == -1 then
			self:unequip_shield()
			shield_unit:set_slot(0)
		end
	elseif my_load_data.needs_shield_link_request then
		self._shield_request_clbk_id = "playerinventory_load_shield_link" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._shield_request_clbk_id, callback(self, self, "clbk_shield_link_request"), TimerManager:game():time() + 0.1)
	end
end

function PlayerInventory:clbk_shield_link_request()
	self._shield_request_clbk_id = nil

	if not alive(self._unit) or self._unit:id() == -1 then
		return
	end

	managers.network:session():send_to_host("request_shield_unit_link", self._unit)
end

function PlayerInventory:_clbk_weapon_add(data)
	self._weapon_add_clbk = nil

	if not alive(self._unit) then
		return
	end

	local eq_weap_name = self._get_weapon_name_from_sync_index(data.equipped_weapon_index)

	if type(eq_weap_name) == "string" then
		if not managers.network:session() then
			return
		end

		self:add_unit_by_factory_name(eq_weap_name, true, true, data.blueprint_string, self:cosmetics_string_from_peer(managers.network:session():peer_by_unit(self._unit), eq_weap_name) or data.cosmetics_string)
		self:synch_weapon_gadget_state(data.gadget_on)

		if data.gadget_color then
			self:sync_weapon_gadget_color(data.gadget_color)
		end
	else
		self._unit:inventory():add_unit_by_name(eq_weap_name, true, true)
	end

	self:on_weapon_add()

	if self._unit:unit_data().mugshot_id then
		local icon = self:equipped_unit():base():weapon_tweak_data().hud_icon

		managers.hud:set_mugshot_weapon(self._unit:unit_data().mugshot_id, icon, self:equipped_unit():base():weapon_tweak_data().use_data.selection_index)
	end
end

function PlayerInventory:on_weapon_add()
end

function PlayerInventory:mask_visibility()
	return self._mask_visibility or false
end

function PlayerInventory:set_mask_visibility(state)
	self._mask_visibility = state

	if self._unit == managers.player:player_unit() or not alive(self._unit) then
		return
	end

	local character_name = managers.criminals:character_name_by_unit(self._unit)

	if not character_name then
		return
	end

	self._mask_visibility = state

	if alive(self._mask_unit) then
		if not state then
			for _, linked_unit in ipairs(self._mask_unit:children()) do
				linked_unit:unlink()
				World:delete_unit(linked_unit)
			end

			self._mask_unit:unlink()

			local name = self._mask_unit:name()

			World:delete_unit(self._mask_unit)
		end

		return
	end

	if not state then
		return
	end

	local mask_unit_name = managers.criminals:character_data_by_name(character_name).mask_obj

	if not managers.dyn_resource:is_resource_ready(Idstring("unit"), mask_unit_name, managers.dyn_resource.DYN_RESOURCES_PACKAGE) then
		return
	end

	mask_unit_name = mask_unit_name[Global.level_data.level_id] or mask_unit_name.default or mask_unit_name
	local mask_align = self._unit:get_object(Idstring("Head"))
	local mask_unit = World:spawn_unit(Idstring(mask_unit_name), mask_align:position(), mask_align:rotation())

	mask_unit:base():apply_blueprint(managers.criminals:character_data_by_name(character_name).mask_blueprint)
	self._unit:link(mask_align:name(), mask_unit)

	self._mask_unit = mask_unit
	local mask_id = managers.criminals:character_data_by_name(character_name).mask_id
	local peer = managers.network:session():peer_by_unit(self._unit)
	local mask_data = {
		mask_id = mask_id,
		mask_unit = mask_unit,
		mask_align = mask_align,
		peer_id = peer and peer:id(),
		character_name = character_name
	}

	self:update_mask_offset(mask_data)

	local base_ext = self._unit:base()

	if base_ext and base_ext.visibility_state then
		mask_unit:set_visible(base_ext:visibility_state())
	end

	if not mask_id or not tweak_data.blackmarket.masks[mask_id].type then
		local backside = World:spawn_unit(Idstring("units/payday2/masks/msk_backside/msk_backside"), mask_align:position(), mask_align:rotation())

		if base_ext and base_ext.visibility_state then
			backside:set_visible(base_ext:visibility_state())
		end

		self._mask_unit:link(self._mask_unit:orientation_object():name(), backside, backside:orientation_object():name())
	end

	if not mask_id or not tweak_data.blackmarket.masks[mask_id].skip_mask_on_sequence then
		local mask_on_sequence = managers.blackmarket:character_mask_on_sequence_by_character_name(character_name)

		if mask_on_sequence then
			self._unit:damage():run_sequence_simple(mask_on_sequence)
		end
	end

	managers.criminals:update_character_visual_state(character_name, {})
end

function PlayerInventory:update_mask_offset(mask_data)
	local char = nil

	if mask_data.peer_id then
		char = managers.blackmarket:get_real_character(nil, mask_data.peer_id)
	else
		char = managers.blackmarket:get_real_character(mask_data.character_name, nil)
	end

	local mask_tweak = tweak_data.blackmarket.masks[mask_data.mask_id]

	if mask_tweak and mask_tweak.offsets and mask_tweak.offsets[char] then
		local char_tweak = mask_tweak.offsets[char]

		self:set_mask_offset(mask_data.mask_unit, mask_data.mask_align, char_tweak[1] or Vector3(0, 0, 0), char_tweak[2] or Rotation(0, 0, 0))
		self:set_mask_offset(mask_data.mask_unit, mask_data.mask_align, char_tweak[1] or Vector3(0, 0, 0), char_tweak[2] or Rotation(0, 0, 0))
	else
		self:set_mask_offset(mask_data.mask_unit, mask_data.mask_align, Vector3(0, 0, 0), Rotation(0, 0, 0))
	end
end

function PlayerInventory:set_mask_offset(mask_unit, mask_align, position, rotation)
	if not alive(mask_unit) then
		return
	end

	if rotation then
		mask_unit:set_rotation(mask_align:rotation() * rotation)
	end

	if position then
		mask_unit:set_position(mask_align:position() + mask_unit:rotation():x() * position.x + mask_unit:rotation():z() * position.z + mask_unit:rotation():y() * position.y)
	end
end

function PlayerInventory:set_melee_weapon(melee_weapon_id, is_npc)
	self._melee_weapon_data = managers.blackmarket:get_melee_weapon_data(melee_weapon_id)
	self._melee_weapon_id = melee_weapon_id

	if is_npc then
		if self._melee_weapon_data.third_unit then
			self._melee_weapon_unit_name = Idstring(self._melee_weapon_data.third_unit)
		end
	elseif self._melee_weapon_data.unit then
		self._melee_weapon_unit_name = Idstring(self._melee_weapon_data.unit)
	end

	if self._melee_weapon_unit_name then
		managers.dyn_resource:load(Idstring("unit"), self._melee_weapon_unit_name, "packages/dyn_resources", false)
	end
end

function PlayerInventory:set_melee_weapon_by_peer(peer)
end

function PlayerInventory:get_melee_weapon_id()
	return self._melee_weapon_id
end

function PlayerInventory:set_ammo(ammo)
	for id, weapon in pairs(self._available_selections) do
		weapon.unit:base():set_ammo(ammo)
		managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
	end
end

function PlayerInventory:need_ammo()
	for _, weapon in pairs(self._available_selections) do
		if not weapon.unit:base():ammo_full() then
			return true
		end
	end

	return false
end

function PlayerInventory:all_out_of_ammo()
	for _, weapon in pairs(self._available_selections) do
		if not weapon.unit:base():out_of_ammo() then
			return false
		end
	end

	return true
end

function PlayerInventory:anim_cbk_spawn_character_mask(unit)
	self:set_mask_visibility(true)
end

function PlayerInventory:anim_clbk_equip_exit(unit)
	self:set_mask_visibility(true)
end

function PlayerInventory:shield_unit()
	return self._shield_unit
end

function PlayerInventory:drop_shield()
	local shield_unit = self._shield_unit

	self:unequip_shield()

	if alive(shield_unit) then
		local u_dmg = shield_unit:damage()

		if u_dmg and u_dmg:has_sequence("enable_body") then
			u_dmg:run_sequence_simple("enable_body")
		end

		managers.enemy:register_shield(shield_unit)
	end
end

function PlayerInventory:equip_shield(shield_unit, align_name)
	if self._shield_unit then
		Application:stack_dump_error("[PlayerInventory:equip_shield] Attempted to equip a shield when a shield was already equipped.", self._shield_unit, self._unit)

		return
	end

	local has_destroy_listener = nil
	local listener_class = shield_unit:base()

	if listener_class and listener_class.add_destroy_listener then
		has_destroy_listener = true
	else
		listener_class = shield_unit:unit_data()

		if listener_class and listener_class.add_destroy_listener then
			has_destroy_listener = true
		end
	end

	if not has_destroy_listener then
		Application:error("[PlayerInventory:equip_shield] Shield unit lacks destroy listener.", shield_unit)

		return
	end

	self._shield_unit = shield_unit

	self._unit:link(align_name, shield_unit, shield_unit:orientation_object():name())

	self._shield_destroyed_clbk_id = "ShieldDestroyed" .. tostring(self._unit:key())

	listener_class:add_destroy_listener(self._shield_destroyed_clbk_id, callback(self, self, "_clbk_shield_destroyed"))
	self:add_ignore_unit(shield_unit)
	self:_call_listeners("shield_equip")
end

function PlayerInventory:_clbk_shield_destroyed(shield_unit)
	self:unequip_shield(true)
end

function PlayerInventory:unequip_shield(is_callback)
	local shield_unit = self._shield_unit
	self._shield_unit = nil

	if alive(shield_unit) then
		shield_unit:unlink()

		if shield_unit:id() ~= -1 then
			self._shield_was_synced = true
		end

		if not is_callback and self._shield_destroyed_clbk_id then
			local has_destroy_listener = nil
			local listener_class = shield_unit:base()

			if listener_class and listener_class.add_destroy_listener then
				has_destroy_listener = true
			else
				listener_class = shield_unit:unit_data()

				if listener_class and listener_class.add_destroy_listener then
					has_destroy_listener = true
				end
			end

			if has_destroy_listener then
				listener_class:remove_destroy_listener(self._shield_destroyed_clbk_id)
			end
		end

		self:remove_ignore_unit(shield_unit)
	end

	self._shield_destroyed_clbk_id = nil

	if shield_unit then
		self:_call_listeners("shield_unequip")
	end
end

function PlayerInventory:from_server_link_shield(shield_unit)
end

function PlayerInventory:on_shield_break(attacker_unit)
	self:drop_shield()
end

function PlayerInventory:set_lod_stage(stage)
	local weapon = self.get_weapon and self:get_weapon()

	if weapon then
		local base_ext = weapon:base()

		if base_ext and base_ext.set_flashlight_light_lod_enabled then
			base_ext:set_flashlight_light_lod_enabled(stage == 1)
		end
	end
end

function PlayerInventory:set_visibility_state(state)
	for i, sel_data in pairs(self._available_selections) do
		local enabled = sel_data.unit:enabled()

		sel_data.unit:base():set_visibility_state(enabled and state)
	end

	self:set_shield_visible(state)

	if alive(self._mask_unit) then
		self._mask_unit:set_visible(state)

		for _, linked_unit in ipairs(self._mask_unit:children()) do
			linked_unit:set_visible(state)
		end
	end
end

function PlayerInventory:set_shield_visible(state)
	if alive(self._shield_unit) then
		self._shield_unit:set_visible(state)
	end
end

function PlayerInventory:set_weapon_enabled(state)
	if self._equipped_selection then
		self:equipped_unit():set_enabled(state)
	end

	self:set_shield_enabled(state)
end

function PlayerInventory:set_shield_enabled(state)
	if alive(self._shield_unit) then
		self._shield_unit:set_enabled(state)
	end
end

PlayerInventory._start_jammer_func_lookup = {
	jamming = "_start_jammer_effect",
	feedback = "_start_feedback_effect"
}
PlayerInventory._stop_jammer_func_lookup = {
	jamming = "_stop_jammer_effect",
	feedback = "_stop_feedback_effect"
}

function PlayerInventory:sync_net_event(event_id, peer)
	if self._unit:base().is_local_player then
		return
	end

	local net_events = self._NET_EVENTS

	if event_id == net_events.jammer_start then
		self:_start_jammer_effect()
	elseif event_id == net_events.jammer_stop then
		local found_queued = self:_chk_remove_queued_jammer_effects("jamming")

		if not found_queued then
			self:_stop_jammer_effect()
		end
	elseif event_id == net_events.feedback_start then
		self:_start_feedback_effect()
	elseif event_id == net_events.feedback_stop then
		local found_queued = self:_chk_remove_queued_jammer_effects("feedback")

		if not found_queued then
			self:_stop_feedback_effect()
		end
	end
end

function PlayerInventory:get_jammer_time()
	local upgrade_value = self._unit:base():upgrade_value("player", "pocket_ecm_jammer_base")

	return upgrade_value and upgrade_value.duration or 0
end

function PlayerInventory:get_jammer_affect()
	local upgrade_value = self._unit:base():upgrade_value("player", "pocket_ecm_jammer_base")

	return upgrade_value and upgrade_value.affects_cameras or false, upgrade_value and upgrade_value.affects_pagers or false
end

function PlayerInventory:get_feedback_values()
	local upgrade_value = self._unit:base():upgrade_value("player", "pocket_ecm_jammer_base")

	return upgrade_value and upgrade_value.feedback_interval or 0, upgrade_value and upgrade_value.feedback_range or 0
end

function PlayerInventory:_send_net_event(event_id)
	managers.network:session():send_to_peers_synched("sync_unit_event_id_16", self._unit, "inventory", event_id)
end

function PlayerInventory:_send_net_event_to_host(event_id)
	managers.network:session():send_to_host("sync_unit_event_id_16", self._unit, "inventory", event_id)
end

function PlayerInventory:is_jammer_active()
	return self._jammer_data and true or false
end

function PlayerInventory:start_jammer_effect()
	local started = self:_start_jammer_effect()

	if started then
		self:_send_net_event(self._NET_EVENTS.jammer_start)
	end

	return started
end

function PlayerInventory:_start_jammer_effect(end_time)
	if self._jammer_data then
		self:_chk_queue_jammer_effect("jamming")

		return
	end

	end_time = end_time or self:get_jammer_time()

	if end_time == 0 then
		return false
	end

	end_time = TimerManager:game():time() + end_time
	local key_str = tostring(self._unit:key())
	self._jammer_data = {
		effect = "jamming",
		t = end_time,
		sound = self._unit:sound_source():post_event("ecm_jammer_jam_signal"),
		stop_jamming_callback_key = "PocketECMJamming" .. key_str
	}
	local affects_cameras, affects_pagers = self:get_jammer_affect()

	managers.groupai:state():register_ecm_jammer(self._unit, {
		call = true,
		camera = affects_cameras,
		pager = affects_pagers
	})
	managers.enemy:add_delayed_clbk(self._jammer_data.stop_jamming_callback_key, callback(self, self, "_clbk_stop_jammer_effect"), end_time)

	local local_player = managers.player:player_unit()
	local user_is_local_player = local_player and local_player:key() == self._unit:key()
	local dodge = user_is_local_player and self._unit:base():upgrade_value("temporary", "pocket_ecm_kill_dodge")

	if dodge then
		self._jammer_data.dodge_kills = dodge[3]
		self._jammer_data.dodge_listener_key = "PocketECMJammingDodge" .. key_str

		managers.player:register_message(Message.OnEnemyKilled, self._jammer_data.dodge_listener_key, callback(self, self, "_jamming_kill_dodge"))
	end

	return true
end

function PlayerInventory:stop_jammer_effect()
	local stopped = self:_stop_jammer_effect()

	if stopped and managers.network:session() then
		self:_send_net_event(self._NET_EVENTS.jammer_stop)
	end
end

function PlayerInventory:_clbk_stop_jammer_effect()
	self:_stop_jammer_effect(true)
end

function PlayerInventory:_stop_jammer_effect(is_callback)
	local jammer_data = self._jammer_data

	if not jammer_data or jammer_data.effect ~= "jamming" then
		return false
	end

	self._jammer_data = nil

	if jammer_data.sound then
		jammer_data.sound:stop()
		self._unit:sound_source():post_event("ecm_jammer_jam_signal_stop")
	end

	managers.groupai:state():register_ecm_jammer(self._unit, false)

	if not is_callback then
		managers.enemy:remove_delayed_clbk(jammer_data.stop_jamming_callback_key, true)
	end

	if jammer_data.dodge_listener_key then
		managers.player:unregister_message(Message.OnEnemyKilled, jammer_data.dodge_listener_key, true)
	end

	self:_chk_start_queued_jammer_effect(jammer_data)

	return true
end

function PlayerInventory:start_feedback_effect()
	local started = self:_start_feedback_effect()

	if started then
		self:_send_net_event(self._NET_EVENTS.feedback_start)
	end

	return started
end

function PlayerInventory:_start_feedback_effect(end_time)
	if self._jammer_data then
		self:_chk_queue_jammer_effect("feedback")

		return
	end

	end_time = end_time or self:get_jammer_time()

	if end_time == 0 then
		return false
	end

	local interval, range, nr_ticks = nil

	if Network:is_server() then
		interval, range = self:get_feedback_values()

		if interval == 0 or range == 0 then
			return false
		end

		nr_ticks = math.max(1, math.floor(end_time / interval))
	end

	local t = TimerManager:game():time()
	local key_str = tostring(self._unit:key())
	end_time = t + end_time
	self._jammer_data = {
		effect = "feedback",
		t = end_time,
		interval = interval,
		range = range,
		sound = self._unit:sound_source():post_event("ecm_jammer_puke_signal"),
		feedback_callback_key = "PocketECMFeedback" .. key_str,
		nr_ticks = nr_ticks
	}

	if Network:is_server() then
		local interval_t = t + interval

		if nr_ticks == 1 and end_time < interval_t then
			interval_t = end_time or interval_t
		end

		managers.enemy:add_delayed_clbk(self._jammer_data.feedback_callback_key, callback(self, self, "_do_feedback"), interval_t)
	else
		managers.enemy:add_delayed_clbk(self._jammer_data.feedback_callback_key, callback(self, self, "_clbk_stop_feedback_effect"), end_time)
	end

	local local_player = managers.player:player_unit()
	local user_is_local_player = local_player and local_player:key() == self._unit:key()
	local dodge = user_is_local_player and self._unit:base():upgrade_value("temporary", "pocket_ecm_kill_dodge")
	local heal = user_is_local_player and self._unit:base():upgrade_value("player", "pocket_ecm_heal_on_kill") or self._unit:base():upgrade_value("team", "pocket_ecm_heal_on_kill")

	if dodge then
		self._jammer_data.dodge_kills = dodge[3]
		self._jammer_data.dodge_listener_key = "PocketECMFeedbackDodge" .. key_str

		managers.player:register_message(Message.OnEnemyKilled, self._jammer_data.dodge_listener_key, callback(self, self, "_jamming_kill_dodge"))
	end

	if heal then
		self._jammer_data.heal = heal
		self._jammer_data.heal_listener_key = "PocketECMFeedbackHeal" .. key_str

		managers.player:register_message(Message.OnEnemyKilled, self._jammer_data.heal_listener_key, callback(self, self, "_feedback_heal_on_kill"))
	end

	return true
end

function PlayerInventory:stop_feedback_effect()
	local stopped = self:_stop_feedback_effect()

	if stopped and managers.network:session() then
		self:_send_net_event(self._NET_EVENTS.feedback_stop)
	end
end

function PlayerInventory:_clbk_stop_feedback_effect()
	self:_stop_feedback_effect(true)
end

function PlayerInventory:_stop_feedback_effect(is_callback)
	local jammer_data = self._jammer_data

	if not jammer_data or jammer_data.effect ~= "feedback" then
		return false
	end

	self._jammer_data = nil

	if jammer_data.sound then
		jammer_data.sound:stop()
		self._unit:sound_source():post_event("ecm_jammer_puke_signal_stop")
	end

	if not is_callback then
		managers.enemy:remove_delayed_clbk(jammer_data.feedback_callback_key, true)
	end

	if jammer_data.dodge_listener_key then
		managers.player:unregister_message(Message.OnEnemyKilled, jammer_data.dodge_listener_key, true)
	end

	if jammer_data.heal_listener_key then
		managers.player:unregister_message(Message.OnEnemyKilled, jammer_data.heal_listener_key, true)
	end

	self:_chk_start_queued_jammer_effect(jammer_data)

	return true
end

function PlayerInventory:_feedback_heal_on_kill()
	if not self._jammer_data or not self._jammer_data.heal or not alive(self._unit) then
		return
	end

	local local_player = managers.player:player_unit()
	local damage_ext = local_player and local_player:character_damage()

	if not damage_ext or damage_ext:dead() or damage_ext:need_revive() or damage_ext:is_berserker() then
		return
	end

	local chk_berserker = self._unit:key() ~= local_player:key()

	damage_ext:restore_health(self._jammer_data.heal, true, chk_berserker)
end

function PlayerInventory:_jamming_kill_dodge()
	local unit = managers.player:player_unit()
	local data = self._jammer_data

	if not alive(self._unit) or not unit or not data then
		return
	end

	if data.dodge_kills then
		data.dodge_kills = data.dodge_kills - 1

		if data.dodge_kills == 0 then
			managers.player:activate_temporary_upgrade("temporary", "pocket_ecm_kill_dodge")
			managers.player:unregister_message(Message.OnEnemyKilled, self._jammer_data.dodge_listener_key, true)
		end
	end
end

function PlayerInventory:_get_feedback_pos()
	if not self._unit:movement() then
		return self._unit:position()
	end

	if self._unit:base() and self._unit:base().is_husk_player then
		return self._unit:movement():m_detect_pos()
	else
		return self._unit:movement():m_head_pos()
	end
end

function PlayerInventory:_do_feedback()
	if not alive(self._unit) then
		self:_chk_remove_queued_jammer_effects()
		self:_clbk_stop_feedback_effect()

		return
	end

	local jammer_data = self._jammer_data

	if not jammer_data then
		self:_clbk_stop_feedback_effect()

		return
	end

	ECMJammerBase._detect_and_give_dmg(self:_get_feedback_pos(), nil, self._unit, jammer_data.range)

	jammer_data.nr_ticks = jammer_data.nr_ticks - 1
	local t = TimerManager:game():time()
	local end_time = jammer_data.t

	if jammer_data.nr_ticks == 0 then
		if t < end_time then
			managers.enemy:add_delayed_clbk(jammer_data.feedback_callback_key, callback(self, self, "_clbk_stop_feedback_effect"), end_time)
		else
			self:_clbk_stop_feedback_effect()
		end

		return
	end

	local interval_t = t + jammer_data.interval

	if jammer_data.nr_ticks == 1 and end_time < interval_t then
		interval_t = end_time or interval_t
	end

	managers.enemy:add_delayed_clbk(jammer_data.feedback_callback_key, callback(self, self, "_do_feedback"), interval_t)
end

function PlayerInventory:_chk_queue_jammer_effect(effect)
	if self._unit:base().is_husk_player then
		if self._jammer_data.queued_effects then
			table.insert(self._jammer_data.queued_effects, effect)
		else
			self._jammer_data.queued_effects = {
				effect
			}
		end
	end
end

function PlayerInventory:_chk_start_queued_jammer_effect(jammer_data)
	if not jammer_data or not jammer_data.queued_effects then
		return
	end

	local cur_effect = table.remove(jammer_data.queued_effects, 1)

	if not next(jammer_data.queued_effects) then
		jammer_data.queued_effects = nil
	end

	local jammer_func = self._start_jammer_func_lookup[cur_effect]

	if jammer_func and self[jammer_func] then
		self[jammer_func](self)
	end

	if self._jammer_data then
		self._jammer_data.queued_effects = jammer_data.queued_effects
	else
		self:_chk_start_queued_jammer_effect(jammer_data)
	end
end

function PlayerInventory:_chk_remove_queued_jammer_effects(search_effect)
	if self._jammer_data then
		if not search_effect then
			self._jammer_data.queued_effects = nil
		else
			for i, effect in ipairs(self._jammer_data.queued_effects) do
				if effect == search_effect then
					table.remove(self._jammer_data.queued_effects, i)

					if not next(self._jammer_data.queued_effects) then
						self._jammer_data.queued_effects = nil
					end

					return i
				end
			end
		end
	end

	return false
end
