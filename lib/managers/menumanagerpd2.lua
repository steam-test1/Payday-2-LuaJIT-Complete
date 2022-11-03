core:import("CoreMenuManager")
core:import("CoreMenuCallbackHandler")
require("lib/managers/menu/MenuSceneManager")
require("lib/managers/menu/MenuComponentManager")
require("lib/managers/menu/items/MenuItemExpand")
require("lib/managers/menu/items/MenuItemDivider")
require("lib/managers/menu/items/MenuItemColoredDivider")
require("lib/managers/menu/MenuInitiatorBase")
core:import("CoreEvent")

function MenuManager:update(t, dt, ...)
	MenuManager.super.update(self, t, dt, ...)
end

function MenuManager:on_view_character(user)
	local outfit = user:rich_presence("outfit")

	if outfit ~= "" then
		if managers.menu:active_menu().logic:selected_node_name() ~= "view_character" then
			managers.menu:active_menu().logic:select_node("view_character", true, {})
		end

		managers.menu_scene:set_main_character_outfit(outfit)
		managers.menu_component:create_view_character_profile_gui(user, 0, 300)
	end
end

function MenuManager:on_enter_lobby()
	print("function MenuManager:on_enter_lobby()")

	if game_state_machine:gamemode().id == GamemodeCrimeSpree.id then
		managers.menu:active_menu().logic:select_node("crime_spree_lobby", true, {})
	else
		managers.menu:active_menu().logic:select_node("lobby", true, {})
	end

	managers.platform:set_rich_presence("MPLobby")
	managers.menu_component:pre_set_game_chat_leftbottom(0, 50)
	managers.network:session():on_entered_lobby()
	self:setup_local_lobby_character()
	managers.tango:attempt_announce_tango_weapon()
	managers.crime_spree:on_entered_lobby()

	if Global.exe_argument_level or self._lobby_autoplay then
		MenuCallbackHandler:start_the_game()
	end
end

function MenuManager:on_leave_active_job()
	managers.statistics:stop_session({
		quit = true
	})
	managers.savefile:save_progress()
	managers.job:deactivate_current_job()
	managers.gage_assignment:deactivate_assignments()

	if managers.groupai then
		managers.groupai:state():set_AI_enabled(false)
	end

	self._sound_source:post_event("menu_exit")
	managers.menu:close_menu("lobby_menu")
	managers.menu:close_menu("menu_pause")
end

function MenuManager:set_lobby_autoplay(autoplay)
	self._lobby_autoplay = autoplay
end

function MenuManager:setup_local_lobby_character()
	local local_peer = managers.network:session():local_peer()
	local level = managers.experience:current_level()
	local rank = managers.experience:current_rank()
	local character = local_peer:character()
	local progress = managers.upgrades:progress()

	if managers.menu_scene and not Global.game_settings.single_player then
		managers.menu_scene:set_lobby_character_out_fit(local_peer:id(), managers.blackmarket:outfit_string(), rank)
	end

	local_peer:set_outfit_string(managers.blackmarket:outfit_string())
	managers.network:session():send_to_peers_loaded("sync_profile", level, rank)
	managers.network:session():check_send_outfit()
end

function MenuManager:set_cash_safe_scene_done(done, silent)
	self._cash_safe_scene_done = done

	if not silent then
		local logic = managers.menu:active_menu().logic

		if logic then
			logic:refresh_node()
		end
	end
end

function MenuManager:cash_safe_scene_done()
	return self._cash_safe_scene_done
end

function MenuManager:http_test()
	Steam:http_request("http://www.overkillsoftware.com/?feed=rss", callback(self, self, "http_test_result"))
end

function MenuManager:http_test_result(success, body)
	print("success", success)
	print("body", body)
	print(inspect(self:_get_text_block(body, "<title>", "</title>")))
	print(inspect(self:_get_text_block(body, "<link>", "</link>")))
end

function MenuCallbackHandler:continue_to_lobby()
end

function MenuCallbackHandler:on_view_character_focus(node, in_focus, data)
	if not in_focus or not data then
		managers.menu_scene:set_main_character_outfit(managers.blackmarket:outfit_string())
		managers.menu_component:close_view_character_profile_gui()
	end
end

function MenuCallbackHandler:on_character_customization()
	managers.menu_component:close_weapon_box()
end

function MenuCallbackHandler:start_job(job_data)
	if not managers.job:activate_job(job_data.job_id) then
		return
	end

	Global.game_settings.level_id = managers.job:current_level_id()
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.world_setting = managers.job:current_world_setting()
	Global.game_settings.difficulty = job_data.difficulty
	Global.game_settings.one_down = job_data.one_down
	Global.game_settings.weekly_skirmish = job_data.weekly_skirmish
	local matchmake_attributes = self:get_matchmake_attributes()

	if Network:is_server() then
		local job_id_index = tweak_data.narrative:get_index_from_job_id(managers.job:current_job_id())
		local level_id_index = tweak_data.levels:get_index_from_level_id(Global.game_settings.level_id)
		local difficulty_index = tweak_data:difficulty_to_index(Global.game_settings.difficulty)
		local one_down = Global.game_settings.one_down
		local weekly_skirmish = Global.game_settings.weekly_skirmish

		managers.network:session():send_to_peers("sync_game_settings", job_id_index, level_id_index, difficulty_index, one_down, weekly_skirmish)
		managers.network.matchmake:set_server_attributes(matchmake_attributes)
		managers.mutators:update_lobby_info()
		managers.menu_component:on_job_updated()
		managers.menu:open_node("lobby")
		managers.menu:active_menu().logic:refresh_node("lobby", true)
	else
		managers.network.matchmake:create_lobby(matchmake_attributes)
	end

	managers.platform:refresh_rich_presence()
end

function MenuCallbackHandler:play_single_player_job(item)
	self:play_single_player()
	self:start_single_player_job({
		difficulty = "normal",
		job_id = item:parameter("job_id")
	})
end

function MenuCallbackHandler:play_quick_start_job(item)
	self:start_job({
		difficulty = "normal",
		job_id = item:parameter("job_id")
	})
end

function MenuCallbackHandler:start_single_player_job(job_data)
	if not managers.job:activate_job(job_data.job_id) then
		return
	end

	Global.game_settings.level_id = managers.job:current_level_id()
	Global.game_settings.mission = managers.job:current_mission()
	Global.game_settings.world_setting = managers.job:current_world_setting()
	Global.game_settings.difficulty = job_data.difficulty
	Global.game_settings.one_down = job_data.one_down
	Global.game_settings.weekly_skirmish = job_data.weekly_skirmish

	MenuCallbackHandler:start_the_game()
end

function MenuCallbackHandler:crimenet_focus_changed(node, in_focus)
	if in_focus then
		if node:parameters().no_servers then
			managers.crimenet:start_no_servers()
		else
			managers.crimenet:start()
		end

		managers.menu_component:create_crimenet_gui()
	else
		managers.crimenet:stop()
		managers.menu_component:close_crimenet_gui()
	end
end

function MenuCallbackHandler:can_buy_weapon(item)
	return not Global.blackmarket_manager.weapons[item:parameter("weapon_id")].owned
end

function MenuCallbackHandler:owns_weapon(item)
	return not self:can_buy_weapon(item)
end

function MenuCallbackHandler:open_blackmarket_node()
	managers.menu:active_menu().logic:select_node("blackmarket")
end

function MenuCallbackHandler:leave_blackmarket(item)
	self:_leave_blackmarket()

	if managers.blackmarket:remove_all_new_drop() then
		managers.savefile:save_progress()
	end
end

function MenuCallbackHandler:_leave_blackmarket()
	managers.menu_component:close_weapon_box()
	managers.menu_scene:remove_item()
	managers.menu_scene:delete_workbench_room()
	managers.blackmarket:release_preloaded_blueprints()
end

function MenuCallbackHandler:_left_blackmarket()
	managers.menu_scene:remove_item()
end

function MenuCallbackHandler:blackmarket_abort_customize_mask()
	managers.blackmarket:abort_customize_mask()
end

function MenuCallbackHandler:got_skillpoint_to_spend()
	return managers.skilltree and managers.skilltree:points() > 0
end

function MenuCallbackHandler:got_new_lootdrop()
	return managers.blackmarket and managers.blackmarket:got_any_new_drop()
end

function MenuCallbackHandler:is_new_player_story_glow()
	return managers.experience:current_level() <= tweak_data.story.main_menu_glow_level_limit and managers.experience:current_rank() <= 0
end

function MenuCallbackHandler:not_completed_all_story_assignments()
	local current = managers.story:current_mission() or {}

	return not current.last_mission or not current.rewarded
end

function MenuCallbackHandler:got_completed_story_mission()
	local current = managers.story:current_mission() or {}

	return current.completed and not current.rewarded
end

function MenuCallbackHandler:show_side_job_menu_icon()
	local all_challenges = {}

	for _, challenge in pairs(managers.challenge:get_all_active_challenges()) do
		table.insert(all_challenges, challenge)
	end

	for _, challenge in ipairs(managers.tango:challenges()) do
		table.insert(all_challenges, challenge)
	end

	for _, side_jobs in ipairs(managers.generic_side_jobs:side_jobs()) do
		for _, challenge in ipairs(side_jobs.manager:challenges()) do
			table.insert(all_challenges, challenge)
		end
	end

	for _, challenge in ipairs(all_challenges) do
		if challenge.completed and not challenge.rewarded then
			return true
		end
	end
end

function MenuCallbackHandler:show_custom_safehouse_menu_icon()
	return managers.custom_safehouse:is_daily_new() or managers.custom_safehouse:has_completed_daily() and not managers.custom_safehouse:has_rewarded_daily()
end

function MenuCallbackHandler:close_custom_safehouse_menu()
	managers.custom_safehouse:disable_in_game_menu()
end

function MenuCallbackHandler:should_show_old_safehouse()
	return not managers.custom_safehouse:unlocked()
end

function MenuCallbackHandler:got_new_content_update()
	return false
end

function MenuCallbackHandler:got_new_fav_videos()
	return false
end

function MenuCallbackHandler:not_got_new_content_update()
	return not self:got_new_content_update()
end

function MenuCallbackHandler:do_content_lootdrop(node)
	managers.menu:open_node("crimenet_contract_casino_lootdrop", {
		increase_infamous = false,
		secure_cards = 0
	})
end

function MenuCallbackHandler:test_clicked_weapon(item)
	if not item:parameter("customize") then
		managers.menu_scene:clicked_blackmarket_item()
		managers.menu_component:create_weapon_box(item:parameter("weapon_id"), {
			condition = math.round(item:parameter("condition") / item:_max_condition() * 100)
		})
	end
end

function MenuCallbackHandler:buy_weapon(item)
	local name = managers.localization:text(tweak_data.weapon[item:parameter("weapon_id")].name_id)
	local cost = 50000
	local yes_func = callback(self, self, "on_buy_weapon_yes", {
		item = item,
		cost = cost
	})

	managers.menu:show_buy_weapon({
		yes_func = yes_func
	}, name, "$" .. cost)
end

function MenuCallbackHandler:on_buy_weapon_yes(params)
	Global.blackmarket_manager.weapons[params.item:parameter("weapon_id")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true

	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end

function MenuCallbackHandler:equip_weapon(item)
	Global.player_manager.kit.weapon_slots[item:parameter("weapon_slot")] = item:parameter("weapon_id")

	for weapon_id, data in pairs(Global.blackmarket_manager.weapons) do
		if data.selection_index == item:parameter("weapon_slot") then
			data.equipped = weapon_id == item:parameter("weapon_id")
		end
	end
end

function MenuCallbackHandler:repair_weapon(item)
	if item:_at_max_condition() then
		return
	end

	local name = managers.localization:text(tweak_data.weapon[item:parameter("weapon_id")].name_id)
	local cost = 50000 * (1 - item:parameter("parent_item"):condition() / item:_max_condition())
	local yes_func = callback(self, self, "on_repair_yes", {
		item = item,
		cost = cost
	})

	managers.menu:show_repair_weapon({
		yes_func = yes_func
	}, name, "$" .. cost)
end

function MenuCallbackHandler:on_repair_yes(params)
	Global.blackmarket_manager.weapons[params.item:parameters().weapon_id].condition = params.item:_max_condition()

	params.item:dirty()
	self:test_clicked_weapon(params.item:parameters().parent_item)
end

function MenuCallbackHandler:clicked_weapon_upgrade_type(item)
	managers.menu_scene:clicked_weapon_upgrade_type(item:parameters().name)
end

function MenuCallbackHandler:can_buy_weapon_upgrade(item)
	return not self:owns_weapon_upgrade(item)
end

function MenuCallbackHandler:owns_weapon_upgrade(item)
	return Global.blackmarket_manager.weapon_upgrades[item:parameter("weapon_id")][item:parameter("weapon_upgrade")].owned
end

function MenuCallbackHandler:buy_weapon_upgrades(item)
end

function MenuCallbackHandler:_on_buy_weapon_upgrade_yes(params)
	Global.blackmarket_manager.weapon_upgrades[params.item:parameter("weapon_id")][params.item:parameter("weapon_upgrade")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true

	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end

function MenuCallbackHandler:clicked_customize_character_category(item)
	local name = item:name()

	if name == "masks" then
		if item:expanded() then
			managers.menu_scene:clicked_masks()

			return
		end
	elseif name == "armor" and item:expanded() then
		managers.menu_scene:clicked_armor()

		return
	end

	managers.menu_scene:clicked_customize_character_category()
end

function MenuCallbackHandler:test_clicked_mask(item)
	if not item:parameter("customize") then
		managers.menu_scene:clicked_blackmarket_item()
	end

	managers.menu_component:close_weapon_box()
	managers.menu_scene:spawn_mask(item:parameter("mask_id"))
end

function MenuCallbackHandler:can_buy_mask(item)
	return not self:owns_mask(item)
end

function MenuCallbackHandler:owns_mask(item)
	return Global.blackmarket_manager.masks[item:parameter("mask_id")].owned
end

function MenuCallbackHandler:equip_mask(item)
	local mask_id = item:parameter("mask_id")

	managers.blackmarket:on_buy_mask(mask_id, "normal", 9)
	managers.blackmarket:equip_mask(9)
	self:_update_outfit_information()
end

function MenuCallbackHandler:_update_outfit_information()
	if Global.block_update_outfit_information then
		return
	end

	local outfit_string = managers.blackmarket:outfit_string()

	if self:is_steam() then
		Steam:set_rich_presence("outfit", outfit_string)
	end

	if managers.network:session() then
		local local_peer = managers.network:session():local_peer()
		local in_lobby = local_peer:in_lobby() and game_state_machine:current_state_name() ~= "ingame_lobby_menu"

		if managers.menu_scene and in_lobby then
			local id = local_peer:id()

			managers.menu_scene:set_lobby_character_out_fit(id, outfit_string, managers.experience:current_rank())
		end

		local kit_menu = managers.menu:get_menu("kit_menu")

		if kit_menu then
			local id = local_peer:id()
			local criminal_name = local_peer:character()

			kit_menu.renderer:set_slot_outfit(id, criminal_name, outfit_string)
		end

		local_peer:set_outfit_string(outfit_string)

		local local_player = managers.player:local_player()

		if alive(local_player) and local_player:character_damage() and local_player:character_damage().update_armor_stored_health then
			local_player:character_damage():update_armor_stored_health()
		end

		if managers.player then
			managers.player._cached_detection_risk = nil
		end

		managers.network:session():check_send_outfit()
	end
end

function MenuCallbackHandler:buy_mask(item)
	local name = managers.localization:text(tweak_data.blackmarket.masks[item:parameter("mask_id")].name_id)
	local cost = 10000
	local yes_func = callback(self, self, "_on_buy_mask_yes", {
		item = item,
		cost = cost
	})

	managers.menu:show_buy_weapon({
		yes_func = yes_func
	}, name, "$" .. cost)
end

function MenuCallbackHandler:_on_buy_mask_yes(params)
	Global.blackmarket_manager.masks[params.item:parameter("mask_id")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true

	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end

function MenuCallbackHandler:leave_character_customization()
	self:leave_blackmarket()
end

function MenuCallbackHandler:clicked_character(item)
	print("MenuCallbackHandler:clicked_character", item)
end

function MenuCallbackHandler:equip_character(item)
	local character_id = item:parameter("character_id")
	Global.blackmarket_manager.characters[character_id].equipped = true

	managers.menu_scene:set_character(character_id)

	for id, character in pairs(Global.blackmarket_manager.characters) do
		if id ~= character_id then
			character.equipped = false
		end
	end

	self:_update_outfit_information()
end

function MenuCallbackHandler:can_buy_character(item)
	return not self:owns_character(item)
end

function MenuCallbackHandler:owns_character(item)
	return Global.blackmarket_manager.characters[item:parameter("character_id")].owned
end

function MenuCallbackHandler:buy_character(item)
	local name = managers.localization:text(tweak_data.blackmarket.characters[item:parameter("character_id")].name_id)
	local cost = 10000
	local yes_func = callback(self, self, "_on_buy_character_yes", {
		item = item,
		cost = cost
	})

	managers.menu:show_buy_weapon({
		yes_func = yes_func
	}, name, "$" .. cost)
end

function MenuCallbackHandler:_on_buy_character_yes(params)
	Global.blackmarket_manager.characters[params.item:parameter("character_id")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true

	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end

function MenuCallbackHandler:test_clicked_armor(item)
	managers.menu_component:close_weapon_box()

	if not item:parameter("customize") then
		-- Nothing
	end
end

function MenuCallbackHandler:can_buy_armor(item)
	return not self:owns_armor(item)
end

function MenuCallbackHandler:owns_armor(item)
	return Global.blackmarket_manager.armors[item:parameter("armor_id")].owned
end

function MenuCallbackHandler:buy_armor(item)
	local name = managers.localization:text(tweak_data.blackmarket.armors[item:parameter("armor_id")].name_id)
	local cost = 20000
	local yes_func = callback(self, self, "_on_buy_armor_yes", {
		item = item,
		cost = cost
	})

	managers.menu:show_buy_weapon({
		yes_func = yes_func
	}, name, "$" .. cost)
end

function MenuCallbackHandler:_on_buy_armor_yes(params)
	Global.blackmarket_manager.armors[params.item:parameter("armor_id")].owned = true
	params.item:parameter("parent_item"):parameters().owned = true

	params.item:dirty()
	params.item:parameters().parent_item:on_buy(params.item:parameters().gui_node)
end

function MenuCallbackHandler:equip_armor(item)
	local armor_id = item:parameter("armor_id")
	Global.blackmarket_manager.armors[armor_id].equipped = true

	managers.menu_scene:set_character_armor(armor_id)

	for id, armor in pairs(Global.blackmarket_manager.armors) do
		if id ~= armor_id then
			armor.equipped = false
		end
	end

	self:_update_outfit_information()
end

function MenuCallbackHandler:repair_armor(item)
	if item:_at_max_condition() then
		return
	end

	local armor_id = item:parameter("armor_id")
	local name = managers.localization:text(tweak_data.blackmarket.armors[armor_id].name_id)
	local cost = 30000 * (1 - item:parameter("parent_item"):condition() / item:_max_condition())
	local yes_func = callback(self, self, "on_repair_armor_yes", {
		item = item,
		cost = cost
	})

	managers.menu:show_repair_weapon({
		yes_func = yes_func
	}, name, "$" .. cost)
end

function MenuCallbackHandler:on_repair_armor_yes(params)
	Global.blackmarket_manager.armors[params.item:parameters().armor_id].condition = params.item:_max_condition()

	params.item:dirty()
end

function MenuCallbackHandler:stage_success()
	if not managers.job:has_active_job() then
		return true
	end

	return managers.job:stage_success()
end

function MenuCallbackHandler:stage_not_success()
	return not self:stage_success()
end

function MenuCallbackHandler:is_job_finished()
	return managers.job:is_job_finished()
end

function MenuCallbackHandler:is_job_not_finished()
	return not self:is_job_finished()
end

function MenuCallbackHandler:got_job()
	return managers.job:has_active_job()
end

function MenuCallbackHandler:got_no_job()
	return not self:got_job()
end

function MenuCallbackHandler:start_safe_test_overkill()
end

function MenuCallbackHandler:start_safe_test_event_01()
	managers.menu_scene:_test_start_open_economy_safe("event_01")
end

function MenuCallbackHandler:start_safe_test_weapon_01()
	managers.menu_scene:_test_start_open_economy_safe("weapon_01")
end

function MenuCallbackHandler:start_safe_test_random()
	local safe_names = table.map_keys(tweak_data.economy.safes)

	table.delete(safe_names, "weapon_01")

	local safe_name = safe_names[math.random(#safe_names)]

	managers.menu_scene:_test_start_open_economy_safe(safe_name)
end

function MenuCallbackHandler:reset_safe_scene()
	if not managers.menu:cash_safe_scene_done() then
		return true
	end

	managers.menu:set_cash_safe_scene_done(false)
	managers.menu_scene:reset_economy_safe()
end

function MenuCallbackHandler:is_cash_safe_back_visible()
	return managers.menu:cash_safe_scene_done()
end

MenuComponentInitiator = MenuComponentInitiator or class()

function MenuComponentInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)

	if data and data.back_callback then
		table.insert(node:parameters().back_callback, data.back_callback)
	end

	node:parameters().menu_component_data = data

	return node
end

MenuLoadoutInitiator = MenuLoadoutInitiator or class()

function MenuLoadoutInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)
	node:parameters().menu_component_data = data
	node:parameters().menu_component_next_node_name = "loadout"

	return node
end

MenuCrimeNetInitiator = MenuCrimeNetInitiator or class()

function MenuCrimeNetInitiator:modify_node(node)
	local new_node = deep_clone(node)

	self:refresh_node(new_node)

	return new_node
end

function MenuCrimeNetInitiator:refresh_node(node)
	return node

	local dead_list = {}

	for _, item in ipairs(node:items()) do
		dead_list[item:parameters().name] = true
	end

	local online = {}
	local offline = {}

	if SystemInfo:distribution() == Idstring("STEAM") then
		for _, user in ipairs(Steam:friends()) do
			if math.random(2) == 1 and user:state() == "online" or user:state() == "away" then
				table.insert(online, user)
			else
				table.insert(offline, user)
			end
		end
	end

	node:delete_item("online")

	if not node:item("online") then
		local params = {
			text_id = "menu_online",
			name = "online",
			type = "MenuItemDivider"
		}
		local new_item = node:create_item({
			type = "MenuItemDivider"
		}, params)

		node:add_item(new_item)
	end

	for _, user in ipairs(online) do
		local name = user:id()
		local item = node:item(name)

		if item then
			node:delete_item(name)
		end

		local params = {
			localize = "false",
			name = name,
			text_id = user:name()
		}
		local new_item = node:create_item(nil, params)

		node:add_item(new_item)
	end

	node:delete_item("offline")

	if not node:item("offline") then
		local params = {
			text_id = "menu_offline",
			name = "offline",
			type = "MenuItemDivider"
		}
		local new_item = node:create_item({
			type = "MenuItemDivider"
		}, params)

		node:add_item(new_item)
	end

	for _, user in ipairs(offline) do
		local name = user:id()
		local item = node:item(name)

		if item then
			node:delete_item(name)
		end

		local params = {
			localize = "false",
			name = name,
			text_id = user:name()
		}
		local new_item = node:create_item(nil, params)

		node:add_item(new_item)
	end

	managers.menu:add_back_button(node)

	return node
end

function MenuManager:show_repair_weapon(params, weapon, cost)
	local dialog_data = {
		title = managers.localization:text("dialog_repair_weapon_title"),
		text = managers.localization:text("dialog_repair_weapon_message", {
			WEAPON = weapon,
			COST = cost
		})
	}
	local yes_button = {
		text = managers.localization:text("dialog_yes"),
		callback_func = params.yes_func
	}
	local no_button = {
		text = managers.localization:text("dialog_no")
	}
	dialog_data.button_list = {
		yes_button,
		no_button
	}

	managers.system_menu:show(dialog_data)
end

function MenuManager:show_buy_weapon(params, weapon, cost)
	local dialog_data = {
		title = managers.localization:text("dialog_buy_weapon_title"),
		text = managers.localization:text("dialog_buy_weapon_message", {
			WEAPON = weapon,
			COST = cost
		})
	}
	local yes_button = {
		text = managers.localization:text("dialog_yes"),
		callback_func = params.yes_func
	}
	local no_button = {
		text = managers.localization:text("dialog_no")
	}
	dialog_data.button_list = {
		yes_button,
		no_button
	}

	managers.system_menu:show(dialog_data)
end

function MenuCallbackHandler:on_visit_crimefest_challenges()
	if SystemInfo:distribution() == Idstring("STEAM") then
		Steam:overlay_activate("url", tweak_data.gui.crimefest_challenges_webpage)
	end
end

function MenuCallbackHandler:got_new_steam_lootdrop(item)
	return managers.blackmarket:has_new_tradable_items()
end

function MenuCallbackHandler:leave_steam_inventory(item)
	MenuCallbackHandler:_leave_blackmarket()
end

function MenuCallbackHandler:can_toggle_chat()
	local input = managers.menu:active_menu() and managers.menu:active_menu().input

	return not input or input.can_toggle_chat and input:can_toggle_chat()
end

function MenuCallbackHandler:on_visit_fbi_files()
	if SystemInfo:distribution() == Idstring("STEAM") then
		if MenuCallbackHandler:is_overlay_enabled() then
			Steam:overlay_activate("url", tweak_data.gui.fbi_files_webpage)
		else
			managers.menu:show_enable_steam_overlay()
		end
	end
end

function MenuCallbackHandler:on_visit_fbi_files_suspect(item)
	if item and SystemInfo:distribution() == Idstring("STEAM") then
		if MenuCallbackHandler:is_overlay_enabled() then
			Steam:overlay_activate("url", tweak_data.gui.fbi_files_webpage .. (item and "/suspect/" .. item:name() .. "/" or ""))
		else
			managers.menu:show_enable_steam_overlay()
		end
	end
end

FbiFilesInitiator = FbiFilesInitiator or class()

function FbiFilesInitiator:modify_node(node, up)
	node:clean_items()

	local params = {
		callback = "on_visit_fbi_files",
		name = "on_visit_fbi_files",
		help_id = "menu_visit_fbi_files_help",
		text_id = "menu_visit_fbi_files"
	}
	local new_item = node:create_item(nil, params)

	node:add_item(new_item)

	if managers.network:session() then
		local peer = managers.network:session():local_peer()
		local name = peer:name()
		local color_range_offset = utf8.len(name) + 2
		local experience, color_ranges = managers.experience:gui_string(level, rank, color_range_offset)
		experience = " (" .. experience .. ")"
		local params = {
			localize = false,
			localize_help = false,
			callback = "on_visit_fbi_files_suspect",
			to_upper = false,
			name = peer:user_id(),
			text_id = name .. experience,
			color_ranges = color_ranges,
			rpc = peer:rpc(),
			peer = peer
		}
		local new_item = node:create_item(nil, params)

		node:add_item(new_item)

		for _, peer in pairs(managers.network:session():peers()) do
			local name = peer:name()
			local color_range_offset = utf8.len(name) + 2
			local experience, color_ranges = managers.experience:gui_string(level, rank, color_range_offset)
			experience = " (" .. experience .. ")"
			local params = {
				localize = false,
				localize_help = false,
				callback = "on_visit_fbi_files_suspect",
				to_upper = false,
				name = peer:user_id(),
				text_id = name .. experience,
				color_ranges = color_ranges,
				rpc = peer:rpc(),
				peer = peer
			}
			local new_item = node:create_item(nil, params)

			node:add_item(new_item)
		end
	end

	managers.menu:add_back_button(node)

	return node
end

function FbiFilesInitiator:refresh_node(node)
	return self:modify_node(node)
end

PlayerListInitiator = PlayerListInitiator or class(MenuInitiatorBase)

function PlayerListInitiator:get_peer_name(peer)
	if not peer then
		return "No peer"
	end

	local name = peer:name()
	local level, rank = nil

	if peer == managers.network:session():local_peer() then
		level = managers.experience:current_level() or ""
		rank = managers.experience:current_rank() or ""
	else
		level = peer:level() or ""
		rank = peer:rank() or ""
	end

	local color_range_offset = utf8.len(name) + 2
	local experience, color_ranges = managers.experience:gui_string(level, rank, color_range_offset)
	name = name .. " (" .. experience .. ")"

	return name, color_ranges
end

function PlayerListInitiator:add_peer_item(node, peer)
	local rank = managers.network:session():local_peer() and managers.experience:current_rank() or peer:rank()
	local texture, texture_rect = managers.experience:rank_icon_data(rank)
	local text_id, color_ranges = self:get_peer_name(peer)
	local params = {
		icon_align = "left",
		localize = false,
		localize_help = false,
		callback = "on_player_list_inspect_peer",
		to_upper = false,
		name = peer:user_id(),
		text_id = text_id,
		color_ranges = color_ranges,
		icon = texture,
		icon_rect = texture_rect,
		rpc = peer:rpc(),
		peer = peer
	}
	local new_item = node:create_item(nil, params)

	node:add_item(new_item)
end

function PlayerListInitiator:modify_node(node, up)
	node:clean_items()

	local params = {
		callback = "on_visit_fbi_files",
		name = "on_visit_fbi_files",
		help_id = "menu_visit_fbi_files_help",
		text_id = "menu_visit_fbi_files"
	}
	local new_item = node:create_item(nil, params)

	node:add_item(new_item)
	self:create_divider(node, "fbi_spacer")

	if managers.network:session() then
		self:add_peer_item(node, managers.network:session():local_peer())

		for _, peer in pairs(managers.network:session():peers()) do
			self:add_peer_item(node, peer)
		end
	end

	managers.menu:add_back_button(node)

	return node
end

function PlayerListInitiator:refresh_node(node)
	return self:modify_node(node)
end

function MenuCallbackHandler:on_player_list_inspect_peer(item, node)
	if item then
		managers.menu:open_node("inspect_player", {
			item:parameters().peer
		})
	end
end

InspectPlayerInitiator = InspectPlayerInitiator or class(MenuInitiatorBase)

function InspectPlayerInitiator:modify_node(node, inspect_peer)
	node:clean_items()

	if not inspect_peer then
		Application:error("Can not open inpsect player without a specified peer!")
		managers.menu:back()
	end

	local is_local_peer = inspect_peer == managers.network:session():local_peer()
	local text_id, color_ranges = PlayerListInitiator.get_peer_name(self, inspect_peer)
	local params = {
		name = "peer_name",
		localize = false,
		no_text = false,
		text_id = text_id,
		color_ranges = color_ranges,
		color = tweak_data.screen_colors.text
	}
	local data_node = {
		type = "MenuItemDivider"
	}
	local new_item = node:create_item(data_node, params)

	node:add_item(new_item)

	local params = {
		callback = "on_visit_fbi_files_suspect",
		help_id = "menu_visit_fbi_files_help",
		text_id = "menu_visit_fbi_files",
		name = inspect_peer:user_id()
	}
	local new_item = node:create_item(nil, params)

	node:add_item(new_item)
	self:create_divider(node, "fbi_spacer")

	if not is_local_peer and Network:is_server() then
		if MenuCallbackHandler:kick_player_visible() or MenuCallbackHandler:kick_vote_visible() then
			local params = {
				callback = "kick_player",
				name = "kick_player",
				text_id = MenuCallbackHandler:kick_player_visible() and "menu_kick_player" or "menu_kick_vote",
				rpc = inspect_peer:rpc(),
				peer = inspect_peer
			}
			local new_item = node:create_item(nil, params)

			node:add_item(new_item)
		end

		local function get_identifier(peer)
			return SystemInfo:platform() == Idstring("WIN32") and peer:user_id() or peer:name()
		end

		local params = {
			callback = "kick_ban_player",
			text_id = "menu_players_list_ban",
			name = inspect_peer:name(),
			identifier = get_identifier(inspect_peer),
			rpc = inspect_peer:rpc(),
			peer = inspect_peer
		}
		local new_item = node:create_item(nil, params)

		node:add_item(new_item)
	end

	if not is_local_peer then
		local toggle_mute = self:create_toggle(node, {
			localize = true,
			name = "toggle_mute",
			enabled = true,
			text_id = "menu_players_list_mute",
			callback = "mute_player",
			rpc = inspect_peer:rpc(),
			peer = inspect_peer
		})

		toggle_mute:set_value(inspect_peer:is_muted() and "on" or "off")
	end

	self:create_divider(node, "admin_spacer")

	local user = Steam:user(inspect_peer:ip())

	if user and user:rich_presence("is_modded") == "1" or inspect_peer:is_modded() then
		local params = {
			text_id = "menu_players_list_mods",
			name = "peer_mods",
			no_text = false,
			size = 8,
			color = tweak_data.screen_colors.text
		}
		local data_node = {
			type = "MenuItemDivider"
		}
		local new_item = node:create_item(data_node, params)

		node:add_item(new_item)

		for i, mod in ipairs(inspect_peer:synced_mods()) do
			local params = {
				callback = "inspect_mod",
				localize = false,
				name = "mod_" .. tostring(i),
				text_id = mod.name,
				mod_id = mod.id
			}
			local new_item = node:create_item(nil, params)

			node:add_item(new_item)
		end
	end

	managers.menu:add_back_button(node)
	node:set_default_item_name("back")

	return node
end

function InspectPlayerInitiator:refresh_node(node)
	return self:modify_node(node)
end

function MenuCallbackHandler:inspect_mod(item)
	local mod_name = item:parameters().mod_id

	if mod_name then
		Steam:overlay_activate("url", "https://modworkshop.net/find/mod?q=" .. mod_name .. "&tags=&gid=1")
	else
		Steam:overlay_activate("url", "https://modworkshop.net")
	end
end

function MenuCallbackHandler:kick_ban_player(item)
	local dialog_data = {
		title = managers.localization:text("dialog_sure_to_ban_title"),
		text = managers.localization:text("dialog_sure_to_kick_ban_body", {
			USER = item:parameters().name
		})
	}
	local yes_button = {
		text = managers.localization:text("dialog_yes"),
		callback_func = callback(self, self, "_kick_ban_player_confirm", item)
	}
	local no_button = {
		text = managers.localization:text("dialog_no"),
		cancel_button = true
	}
	dialog_data.button_list = {
		yes_button,
		no_button
	}

	managers.system_menu:show(dialog_data)
end

function MenuCallbackHandler:_kick_ban_player_confirm(item)
	local peer = item:parameters().peer

	if peer then
		managers.ban_list:ban(item:parameters().identifier, item:parameters().name)

		local message_id = 0
		message_id = 6

		managers.network:session():send_to_peers("kick_peer", peer:id(), message_id)
		managers.network:session():on_peer_kicked(peer, peer:id(), message_id)
	end
end

MenuChooseWeaponCosmeticInitiator = MenuChooseWeaponCosmeticInitiator or class(MenuInitiatorBase)

function MenuChooseWeaponCosmeticInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)

	node:clean_items()

	if not node:item("divider_end") then
		if data and data.instance_ids then
			local sort_items = {}

			for id, data in pairs(data.instance_ids) do
				table.insert(sort_items, id)
			end

			for _, instance_id in ipairs(sort_items) do
				self:create_item(node, {
					localize = false,
					enabled = true,
					name = instance_id,
					text_id = instance_id
				})
			end

			print(inspect(data.instance_ids))
		end

		self:create_divider(node, "end")
		self:add_back_button(node)
		node:set_default_item_name("back")
		node:select_item("back")
	end

	managers.menu_component:set_blackmarket_enabled(false)

	return node
end

function MenuChooseWeaponCosmeticInitiator:add_back_button(node)
	node:delete_item("back")

	local params = {
		visible_callback = "is_pc_controller",
		name = "back",
		halign = "right",
		text_id = "menu_back",
		last_item = "true",
		align = "right",
		previous_node = "true"
	}
	local data_node = {}
	local new_item = node:create_item(data_node, params)

	node:add_item(new_item)

	return new_item
end

MenuOpenContainerInitiator = MenuOpenContainerInitiator or class(MenuInitiatorBase)

function MenuOpenContainerInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)
	node:parameters().container_data = data.container or {}

	managers.menu_component:set_blackmarket_enabled(false)
	self:update_node(node)

	return node
end

function MenuOpenContainerInitiator:refresh_node(node)
	self:update_node(node)

	return node
end

function MenuOpenContainerInitiator:update_node(node)
	local item = node:item("open_container")

	if item then
		item:set_enabled(MenuCallbackHandler:have_safe_and_drill_for_container(node:parameters().container_data))
	end
end

function MenuCallbackHandler:have_no_drills_for_container(item)
	if not managers.menu:active_menu() or not managers.menu:active_menu().logic:selected_node() then
		return false
	end

	local data = managers.menu:active_menu().logic:selected_node():parameters().container_data

	return true
end

function MenuCallbackHandler:can_buy_drill(item)
	if not managers.menu:active_menu() or not managers.menu:active_menu().logic:selected_node() then
		return false
	end

	local data = managers.menu:active_menu().logic:selected_node():parameters().container_data

	if not data then
		return
	end

	local drill = data.drill

	if not drill then
		return
	end

	return tweak_data.economy.drills[drill].price and not not tweak_data.economy.drills[drill].def_id
end

function MenuCallbackHandler:have_safe_and_drill_for_container(data)
	if not data then
		return
	end

	local drill = data.drill
	local safe = data.safe
	local safe_free = tweak_data.economy.safes[safe] and tweak_data.economy.safes[safe].free
	local have_drill = safe_free or managers.blackmarket:have_inventory_tradable_item("drills", drill)
	local have_safe = managers.blackmarket:have_inventory_tradable_item("safes", safe)

	return have_drill and have_safe
end

function MenuCallbackHandler:steam_buy_drill(item, data)
	local node = managers.menu:active_menu() and managers.menu:active_menu().logic:selected_node()
	local quantity_item = node:item("buy_quantity")
	data = data or managers.menu:active_menu().logic:selected_node():parameters().container_data

	if not data then
		return
	end

	local drill = data.drill
	local quantity = quantity_item and tonumber(quantity_item:value()) or 1
	local def_id = tweak_data.economy.drills[drill] and tweak_data.economy.drills[drill].def_id

	if not MenuCallbackHandler:is_overlay_enabled() then
		managers.menu:show_enable_steam_overlay_tradable_item()
	elseif def_id then
		managers.network.account:add_overlay_listener("steam_transaction_tradable_item", {
			"overlay_close"
		}, callback(MenuCallbackHandler, MenuCallbackHandler, "on_steam_transaction_over"))
		Steam:overlay_activate("url", tweak_data.economy:create_buy_tradable_url(def_id, quantity))
		managers.menu:show_buying_tradable_item_dialog()
	end
end

function MenuCallbackHandler:steam_buy_safe_from_community(item, data)
	local node = managers.menu:active_menu() and managers.menu:active_menu().logic:selected_node()
	local quantity_item = node:item("buy_quantity")
	data = data or managers.menu:active_menu().logic:selected_node():parameters().container_data

	if not data then
		return
	end

	local safe = data.safe
	local quantity = quantity_item and tonumber(quantity_item:value()) or 1

	if not MenuCallbackHandler:is_overlay_enabled() then
		managers.menu:show_enable_steam_overlay_tradable_item()
	elseif safe then
		managers.network.account:add_overlay_listener("steam_transaction_tradable_item", {
			"overlay_close"
		}, callback(MenuCallbackHandler, MenuCallbackHandler, "on_steam_transaction_over"))
		Steam:overlay_activate("url", tweak_data.economy:create_market_link_url("safes", safe))
		managers.menu:show_buying_tradable_item_dialog()
	end
end

function MenuCallbackHandler:steam_find_item_from_community(item, data)
	local node = managers.menu:active_menu() and managers.menu:active_menu().logic:selected_node()
	local quantity_item = node:item("buy_quantity")
	data = data or managers.menu:active_menu().logic:selected_node():parameters().container_data

	if not data then
		return
	end

	local cosmetic_id = data.cosmetic_id
	local weapon_id = data.weapon_id

	if not MenuCallbackHandler:is_overlay_enabled() then
		managers.menu:show_enable_steam_overlay_tradable_item()
	elseif cosmetic_id and weapon_id then
		managers.network.account:add_overlay_listener("steam_transaction_tradable_item", {
			"overlay_close"
		}, callback(MenuCallbackHandler, MenuCallbackHandler, "on_steam_transaction_over"))
		Steam:overlay_activate("url", tweak_data.economy:create_weapon_skin_market_search_url(weapon_id, cosmetic_id))
		managers.menu:show_buying_tradable_item_dialog()
	elseif cosmetic_id and data.armor then
		managers.network.account:add_overlay_listener("steam_transaction_tradable_item", {
			"overlay_close"
		}, callback(MenuCallbackHandler, MenuCallbackHandler, "on_steam_transaction_over"))
		Steam:overlay_activate("url", tweak_data.economy:create_armor_skin_market_search_url(data.cosmetic_id))
		managers.menu:show_buying_tradable_item_dialog()
	end
end

function MenuCallbackHandler:steam_sell_item(item)
	local steam_id = Steam:userid()
	local instance_id = item.instance_id

	if not MenuCallbackHandler:is_overlay_enabled() then
		managers.menu:show_enable_steam_overlay_tradable_item()
	elseif steam_id and instance_id then
		print("selling item", "steam_id", steam_id, "instance_id", instance_id)
		managers.network.account:add_overlay_listener("steam_transaction_tradable_item", {
			"overlay_close"
		}, callback(MenuCallbackHandler, MenuCallbackHandler, "on_steam_transaction_over"))
		Steam:overlay_activate("url", tweak_data.economy:create_sell_tradable_url(steam_id, instance_id))
	end
end

function MenuCallbackHandler:on_steam_transaction_over(canceled)
	print("on_steam_transaction_over", canceled)
	managers.network.account:remove_overlay_listener("steam_transaction_tradable_item")
	managers.network.account:inventory_load()
	managers.system_menu:close("buy_tradable_item")
end

function MenuCallbackHandler:steam_open_container(item)
	if not managers.menu:active_menu() or not managers.menu:active_menu().logic:selected_node() then
		return false
	end

	local data = managers.menu:active_menu().logic:selected_node():parameters().container_data

	if not MenuCallbackHandler:have_safe_and_drill_for_container(data) then
		return
	end

	local safe_entry = data.safe
	local safe_tweak = tweak_data.economy.safes[safe_entry]

	local function ready_clbk()
		print("ECONOMY SAFE READY CALLBACK")
		managers.menu:back()
		managers.system_menu:force_close_all()
		managers.menu_component:set_blackmarket_enabled(false)
		managers.menu:open_node("open_steam_safe", {
			data.content
		})
	end

	managers.menu_component:set_blackmarket_disable_fetching(true)
	managers.menu_component:set_blackmarket_enabled(false)
	managers.menu_scene:create_economy_safe_scene(safe_entry, ready_clbk)

	local safe_id = data.safe_id
	local drill_id = data.drill_id
	data.safe_id = nil
	data.drill_id = nil

	if safe_tweak and safe_tweak.free then
		managers.network.account:inventory_reward_open(safe_entry, safe_id, callback(MenuCallbackHandler, MenuCallbackHandler, "_safe_result_recieved"))
	else
		managers.network.account:inventory_reward_unlock(safe_entry, safe_id, drill_id, callback(MenuCallbackHandler, MenuCallbackHandler, "_safe_result_recieved"))
	end
end

function MenuCallbackHandler:_safe_result_recieved(error, items_new, items_removed)
	local active_node_gui = managers.menu:active_menu().renderer:active_node_gui()

	managers.network.account:inventory_repair_list(items_new)
	managers.network.account:inventory_repair_list(items_removed)

	if active_node_gui and active_node_gui._safe_result_recieved then
		active_node_gui:_safe_result_recieved(error, items_new, items_removed)
	else
		managers.menu_scene:store_safe_result(error, items_new, items_removed)
	end
end

MenuEconomySafeInitiator = MenuEconomySafeInitiator or class()

function MenuEconomySafeInitiator:modify_node(node, safe_entry)
	node:parameters().safe_entry = safe_entry

	return node
end

MenuBanListInitiator = MenuBanListInitiator or class(MenuInitiatorBase)

function MenuBanListInitiator:modify_node(node)
	node:clean_items()

	local added = false

	local function get_identifier(peer)
		return SystemInfo:platform() == Idstring("WIN32") and peer:user_id() or peer:name()
	end

	if managers.network:session() then
		for _, user in pairs(managers.network:session():peers()) do
			if not managers.ban_list:banned(get_identifier(user)) then
				self:create_item(node, {
					localize = false,
					enabled = true,
					align = "left",
					callback = "ban_player",
					name = user:name(),
					text_id = user:name(),
					identifier = get_identifier(user)
				})

				added = true
			end
		end
	end

	if not added then
		self:create_item(node, {
			align = "left",
			name = "no_ban_items",
			enabled = false,
			text_id = "bm_menu_no_items"
		})
	end

	added = false

	for _, user in ipairs(managers.ban_list:ban_list()) do
		self:create_item(node, {
			localize = false,
			enabled = true,
			align = "left",
			callback = "unban_player",
			left_column = true,
			name = user.name,
			text_id = user.name,
			identifier = user.identifier
		})

		added = true
	end

	if not added then
		self:create_item(node, {
			name = "no_unban_items",
			enabled = false,
			text_id = "bm_menu_no_items",
			align = "left",
			left_column = true
		})
	end

	self:add_back_button(node)

	return node
end

function MenuBanListInitiator:refresh_node(node)
	self:modify_node(node)
end

function MenuCallbackHandler:ban_player(item, force)
	if item:parameters().identifier and item:parameters().name then
		if not force then
			local dialog_data = {
				title = managers.localization:text("dialog_sure_to_ban_title"),
				text = managers.localization:text("dialog_sure_to_ban_body", {
					USER = item:parameters().name
				})
			}
			local yes_button = {
				text = managers.localization:text("dialog_yes"),
				callback_func = callback(self, self, "ban_player", item, force)
			}
			local no_button = {
				text = managers.localization:text("dialog_no"),
				cancel_button = true
			}
			dialog_data.button_list = {
				yes_button,
				no_button
			}

			managers.system_menu:show(dialog_data)

			return
		else
			managers.ban_list:ban(item:parameters().identifier, item:parameters().name)
		end
	end

	local node = managers.menu:active_menu().logic:get_node("ban_list")

	managers.menu:active_menu().renderer:active_node_gui():refresh_gui(node)
end

function MenuCallbackHandler:unban_player(item, force)
	if item:parameters().identifier and item:parameters().name then
		if not force then
			local dialog_data = {
				title = managers.localization:text("dialog_sure_to_unban_title"),
				text = managers.localization:text("dialog_sure_to_unban_body", {
					USER = item:parameters().name
				})
			}
			local yes_button = {
				text = managers.localization:text("dialog_yes"),
				callback_func = callback(self, self, "unban_player", item, force)
			}
			local no_button = {
				text = managers.localization:text("dialog_no"),
				cancel_button = true
			}
			dialog_data.button_list = {
				yes_button,
				no_button
			}

			managers.system_menu:show(dialog_data)

			return
		else
			managers.ban_list:unban(item:parameters().identifier)
		end
	end

	local node = managers.menu:active_menu().logic:get_node("ban_list")

	managers.menu:active_menu().renderer:active_node_gui():refresh_gui(node)
end

function MenuCallbackHandler:start_quickplay_game(item)
	managers.crimenet:join_quick_play_game()
end

MenuQuickplaySettingsInitiator = MenuQuickplaySettingsInitiator or class(MenuInitiatorBase)

function MenuQuickplaySettingsInitiator:modify_node(node)
	local stealth_item = node:item("quickplay_settings_stealth")
	local loud_item = node:item("quickplay_settings_loud")
	local stealth_on = managers.user:get_setting("quickplay_stealth")
	local loud_on = managers.user:get_setting("quickplay_loud")

	stealth_item:set_value(stealth_on and "on" or "off")
	loud_item:set_value(loud_on and "on" or "off")
	stealth_item:set_parameter("loud", loud_item)
	loud_item:set_parameter("stealth", stealth_item)
	node:item("quickplay_settings_level_min"):set_max(tweak_data.quickplay.max_level_diff[1])
	node:item("quickplay_settings_level_min"):set_value(Global.crimenet and Global.crimenet.quickplay and Global.crimenet.quickplay.level_diff_min or tweak_data.quickplay.default_level_diff[1])
	node:item("quickplay_settings_level_max"):set_max(tweak_data.quickplay.max_level_diff[2])
	node:item("quickplay_settings_level_max"):set_value(Global.crimenet and Global.crimenet.quickplay and Global.crimenet.quickplay.level_diff_max or tweak_data.quickplay.default_level_diff[2])

	local mutators_item = node:item("quickplay_settings_mutators")
	local mutators_on = managers.user:get_setting("quickplay_mutators")

	mutators_item:set_value(mutators_on and "on" or "off")

	local difficulty_item = node:item("quickplay_settings_difficulty")

	if not difficulty_item then
		local options = {
			{
				value = "any",
				text_id = "menu_any",
				_meta = "option"
			}
		}

		for _, difficulty in ipairs(tweak_data.difficulties) do
			if difficulty ~= "easy" then
				table.insert(options, {
					_meta = "option",
					text_id = tweak_data.difficulty_name_ids[difficulty],
					value = difficulty
				})
			end
		end

		difficulty_item = self:create_multichoice(node, options, {
			callback = "quickplay_difficulty",
			name = "quickplay_settings_difficulty",
			help_id = "menu_quickplay_settings_difficulty",
			text_id = "menu_quickplay_settings_difficulty"
		}, 1)
	end

	if Global.crimenet and Global.crimenet.quickplay and Global.crimenet.quickplay.difficulty then
		difficulty_item:set_value(Global.crimenet.quickplay.difficulty)
	else
		difficulty_item:set_value("any")
	end

	return node
end

function MenuQuickplaySettingsInitiator:refresh_node(node)
	self:modify_node(node)
end

function MenuCallbackHandler:quickplay_stealth_toggle(item)
	local on = item:value() == "on"

	managers.user:set_setting("quickplay_stealth", on)

	if not on and item:parameter("loud"):value() == "off" then
		item:parameter("loud"):set_value("on")
		managers.user:set_setting("quickplay_loud", true)
	end
end

function MenuCallbackHandler:quickplay_loud_toggle(item)
	local on = item:value() == "on"

	managers.user:set_setting("quickplay_loud", on)

	if not on and item:parameter("stealth"):value() == "off" then
		item:parameter("stealth"):set_value("on")
		managers.user:set_setting("quickplay_stealth", true)
	end
end

function MenuCallbackHandler:quickplay_mutators_toggle(item)
	local on = item:value() == "on"

	managers.user:set_setting("quickplay_mutators", on)
end

function MenuCallbackHandler:quickplay_level_min(item)
	Global.crimenet.quickplay.level_diff_min = math.floor(item:value() + 0.5)
end

function MenuCallbackHandler:quickplay_level_max(item)
	Global.crimenet.quickplay.level_diff_max = math.floor(item:value() + 0.5)
end

function MenuCallbackHandler:save_crimenet()
	managers.savefile:save_progress()
end

function MenuCallbackHandler:quickplay_difficulty(item)
	if item:value() == "any" then
		Global.crimenet.quickplay.difficulty = nil
	else
		Global.crimenet.quickplay.difficulty = item:value()
	end
end

function MenuCallbackHandler:set_default_quickplay_options()
	local params = {
		text = managers.localization:text("dialog_default_quickplay_options_message"),
		callback = function ()
			managers.user:reset_quickplay_setting_map()

			Global.crimenet.quickplay = {}

			self:refresh_node()
		end
	}

	managers.menu:show_default_option_dialog(params)
end

MenuMutatorsInitiator = MenuMutatorsInitiator or class(MenuInitiatorBase)

function MenuMutatorsInitiator:modify_node(node)
	node:clean_items()

	local function get_identifier(peer)
		return SystemInfo:platform() == Idstring("WIN32") and peer:user_id() or peer:name()
	end

	if #managers.mutators:mutators() < 1 then
		self:create_item(node, {
			align = "left",
			name = "no_mutators",
			enabled = false,
			text_id = "bm_menu_no_items"
		})
	else
		self:populate_mutators_list(node)
	end

	self:add_back_button(node)

	return node
end

function MenuMutatorsInitiator:populate_mutators_list(node)
	self:create_item(node, {
		name = "header_active",
		enabled = false,
		text_id = "menu_mutators_active",
		align = "left",
		both_column = true
	})

	for i, mutator in ipairs(managers.mutators:active_mutators()) do
		self:_create_mutator_node(node, mutator)
	end

	local params = {
		size = 16,
		name = "divider_mutators_list",
		both_column = true,
		no_text = true
	}
	local data_node = {
		type = "MenuItemDivider"
	}
	local new_item = node:create_item(data_node, params)

	node:add_item(new_item)
	self:create_item(node, {
		name = "header_inactive",
		enabled = false,
		text_id = "menu_mutators_inactive",
		align = "left",
		both_column = true
	})

	for i, mutator in ipairs(managers.mutators:inactive_mutators()) do
		self:_create_mutator_node(node, mutator)
	end
end

function MenuMutatorsInitiator:_create_mutator_node(node, mutator)
	self:create_item(node, {
		localize = false,
		enabled = true,
		align = "left",
		left_column = true,
		name = mutator:id(),
		text_id = mutator:name(),
		mutator = mutator
	})

	if mutator:show_options() then
		self:create_item(node, {
			callback = "_open_mutator_options",
			enabled = true,
			text_id = "menu_mutators_option",
			options = true,
			align = "left",
			name = mutator:id() .. "_options",
			mutator = mutator
		})
	end
end

function MenuMutatorsInitiator:refresh_node(node)
	for i, item in ipairs(node:items()) do
		if item:parameters().mutator and not item:parameters().options then
			item:set_parameter("text_id", item:parameters().mutator:name())
			item:dirty()
		end
	end
end

function MenuCallbackHandler:_open_mutator_options(item)
	managers.menu:open_node("mutators_options", {
		item:parameters().mutator
	})
end

function MenuCallbackHandler:_update_mutator_value(item)
	if item:parameters().update_callback then
		item:parameters().update_callback(item)
	end
end

function MenuCallbackHandler:toggle_controller_hint(item)
	managers.user:set_setting("loading_screen_show_controller", item:value() == "on")
end

function MenuCallbackHandler:toggle_loading_hints(item)
	managers.user:set_setting("loading_screen_show_hints", item:value() == "on")
end

function MenuCallbackHandler:toggle_vr_descs(item)
	managers.user:set_setting("show_vr_descs", item:value() == "on")
end

function MenuCallbackHandler:enable_movie_theater()
	return managers.achievment:get_info("vit_1").awarded
end

function MenuCallbackHandler:only_one_movie()
	if tweak_data.movies then
		return #tweak_data.movies == 1
	end

	return false
end

function MenuCallbackHandler:more_than_one_movie()
	if tweak_data.movies then
		return #tweak_data.movies > 1
	end

	return false
end

local function get_weapon_color_data(node)
	node = node or managers.menu:active_menu().logic:selected_node()

	return node and node.weapon_color_data
end

function MenuCallbackHandler:refresh_weapon_color(node)
	local weapon_color_data = get_weapon_color_data(node)
	local crafted = managers.blackmarket:get_crafted_category_slot(weapon_color_data.category, weapon_color_data.slot)

	if not crafted then
		return node
	end

	local cosmetic_data = crafted.cosmetics
	local weapon_unit_data = managers.menu_scene and managers.menu_scene:get_item_unit_data()
	local weapon_unit = weapon_unit_data and weapon_unit_data.unit

	if alive(weapon_unit) then
		weapon_unit:base():change_cosmetics(cosmetic_data)
	end

	local second_unit = weapon_unit_data and weapon_unit_data.second_unit

	if alive(second_unit) then
		second_unit:base():change_cosmetics(cosmetic_data)
	end
end

function MenuCallbackHandler:on_exit_weapon_color_customize(node)
	local weapon_color_data = get_weapon_color_data(node)

	if weapon_color_data and weapon_color_data.any_changes then
		local dialog_data = {
			title = managers.localization:text("dialog_warning_title"),
			text = managers.localization:text("dialog_abort_weapon_color_customize")
		}
		local yes_button = {
			text = managers.localization:text("dialog_yes"),
			callback_func = function ()
				weapon_color_data.any_changes = false

				managers.menu:back(true)
			end
		}
		local cancel_button = {
			text = managers.localization:text("dialog_cancel"),
			cancel_button = true
		}
		dialog_data.button_list = {
			yes_button,
			cancel_button
		}

		managers.system_menu:show(dialog_data)

		return true
	end

	MenuCallbackHandler:refresh_weapon_color(node)
end

function MenuCallbackHandler:can_apply_weapon_color(node)
	local weapon_color_data = get_weapon_color_data(node)

	if not weapon_color_data then
		return false
	end

	local cosmetic_data = weapon_color_data.cosmetic_data
	local crafted = managers.blackmarket:get_crafted_category_slot(weapon_color_data.category, weapon_color_data.slot)

	if crafted then
		local crafted_cosmetics = crafted.cosmetics
		weapon_color_data.any_changes = crafted_cosmetics.id ~= cosmetic_data.id or crafted_cosmetics.quality ~= cosmetic_data.quality or crafted_cosmetics.color_index ~= cosmetic_data.color_index or (crafted_cosmetics.pattern_scale or tweak_data.blackmarket.weapon_color_pattern_scale_default) ~= cosmetic_data.pattern_scale
	end

	local cosmetic_color_item = node:item("cosmetic_color")
	local color_item_option = cosmetic_color_item:get_option(cosmetic_data.id)

	if not self:is_weapon_color_option_unlocked(color_item_option) then
		return false
	end

	return weapon_color_data.any_changes
end

function MenuCallbackHandler:apply_weapon_color(item)
	local weapon_color_data = get_weapon_color_data()

	if not weapon_color_data then
		return
	end

	local cosmetic_data = weapon_color_data.cosmetic_data
	weapon_color_data.any_changes = false

	managers.blackmarket:on_equip_weapon_color(weapon_color_data.category, weapon_color_data.slot, cosmetic_data, false)
	managers.menu:back()
end

function MenuCallbackHandler:should_show_weapon_color_apply(item)
	return not MenuCallbackHandler:should_show_weapon_color_buy(item)
end

function MenuCallbackHandler:should_show_weapon_color_buy(item)
	local weapon_color_data = get_weapon_color_data()

	if not weapon_color_data then
		return
	end

	local cosmetic_data = weapon_color_data.cosmetic_data
	local color_tweak = tweak_data.blackmarket.weapon_skins[cosmetic_data.id]
	local dlc = color_tweak.dlc or managers.dlc:global_value_to_dlc(color_tweak.global_value)
	local is_unlocked = not dlc or managers.dlc:is_dlc_unlocked(dlc)

	if not is_unlocked then
		local dlc_data = Global.dlc_manager.all_dlc_data[dlc]

		return dlc_data and not dlc_data.external and (dlc_data.app_id and tostring(dlc_data.app_id) ~= "218620" or dlc_data.source_id)
	end

	return false
end

function MenuCallbackHandler:should_show_pattern_scale()
	local weapon_color_data = get_weapon_color_data()

	if not weapon_color_data then
		return
	end

	local cosmetic_data = weapon_color_data.cosmetic_data
	local color_tweak = tweak_data.blackmarket.weapon_skins[cosmetic_data.id]
	local color_skin_data = color_tweak.color_skin_data

	return color_tweak.pattern_scale == nil and color_skin_data.pattern_default and true or false
end

function MenuCallbackHandler:should_show_pattern_divider(item)
	return not MenuCallbackHandler:should_show_pattern_scale(item)
end

function MenuCallbackHandler:buy_weapon_color_dlc(item)
	if not MenuCallbackHandler:is_overlay_enabled() then
		managers.menu:show_enable_steam_overlay()

		return
	end

	local weapon_color_data = get_weapon_color_data()

	if not weapon_color_data then
		return
	end

	local cosmetic_data = weapon_color_data.cosmetic_data
	local color_tweak = tweak_data.blackmarket.weapon_skins[cosmetic_data.id]
	local dlc = color_tweak.dlc or managers.dlc:global_value_to_dlc(color_tweak.global_value)

	MenuCallbackHandler:open_dlc_store_page(dlc, "weapon_colors")
end

function MenuCallbackHandler:is_weapon_color_option_visible(item_option)
	local id = item_option:value()
	local color_tweak = tweak_data.blackmarket.weapon_skins[id]
	local global_value = color_tweak.global_value or managers.dlc:dlc_to_global_value(color_tweak.dlc)
	local gvalue_tweak = tweak_data.lootdrop.global_values[global_value]

	if gvalue_tweak and gvalue_tweak.hide_unavailable and not self:is_weapon_color_option_unlocked(item_option) then
		return false
	end

	local group_id = color_tweak.group_id
	local node = managers.menu:active_menu().logic:selected_node()
	local color_group_data = node.color_group_data
	local value = color_group_data and color_group_data.options[color_group_data.selected].value or nil

	return value == "all" or value == group_id
end

function MenuCallbackHandler:is_weapon_color_option_unlocked(item_option)
	local unlocked = item_option:get_parameter("unlocked")
	local have_color = item_option:get_parameter("have_color")

	return unlocked and have_color
end

function MenuCallbackHandler:get_weapon_color_disabled_icon(item_option)
	local id = item_option:value()
	local color_tweak = tweak_data.blackmarket.weapon_skins[id]
	local dlc = color_tweak.dlc or managers.dlc:global_value_to_dlc(color_tweak.global_value)
	local unlocked = item_option:get_parameter("unlocked")
	local have_color = item_option:get_parameter("have_color")

	if not unlocked then
		local dlc_data = Global.dlc_manager.all_dlc_data[dlc]

		if dlc_data then
			if dlc_data.source_id then
				return "guis/textures/pd2/lock_community"
			end

			return "guis/textures/pd2/lock_dlc"
		end
	end

	if not have_color then
		local achievement_locked_content = managers.dlc:weapon_color_achievement_locked_content(id)
		local dlc_tweak = tweak_data.dlc[achievement_locked_content]
		local achievement_info = managers.achievment:get_info(dlc_tweak and dlc_tweak.achievement_id)

		if achievement_info and not achievement_info.awarded then
			return "guis/textures/pd2/lock_achievement"
		end

		if managers.dlc:is_content_skirmish_locked("weapon_skins", id) then
			return "guis/textures/pd2/skilltree/padlock"
		end

		if managers.dlc:is_content_crimespree_locked("weapon_skins", id) then
			return "guis/textures/pd2/skilltree/padlock"
		end

		if managers.dlc:is_content_infamy_locked("weapon_skins", id) then
			return "guis/textures/pd2/lock_infamy"
		end
	end

	return "guis/textures/pd2/skilltree/padlock"
end

function MenuCallbackHandler:sort_weapon_colors(x_option, y_option)
	if x_option.enabled ~= y_option.enabled then
		return x_option.enabled
	end

	local x_id = x_option:value()
	local y_id = y_option:value()
	local x_td = tweak_data.blackmarket.weapon_skins[x_id]
	local y_td = tweak_data.blackmarket.weapon_skins[y_id]
	local x_sn = 0
	local y_sn = 0
	local x_cat = x_td.group_id
	local y_cat = y_td.group_id

	if x_cat ~= y_cat then
		local x_gv = tweak_data.lootdrop.global_value_category[x_cat] or tweak_data.lootdrop.global_values[x_cat]
		local y_gv = tweak_data.lootdrop.global_value_category[y_cat] or tweak_data.lootdrop.global_values[y_cat]
		x_sn = x_gv and x_gv.sort_number or 0
		y_sn = y_gv and y_gv.sort_number or 0

		if x_sn ~= y_sn then
			return x_sn < y_sn
		end
	end

	local x_gv = x_td.global_value or managers.dlc:dlc_to_global_value(x_td.dlc)
	local y_gv = y_td.global_value or managers.dlc:dlc_to_global_value(y_td.dlc)
	x_sn = (x_gv and tweak_data.lootdrop.global_values[x_gv].sort_number or 0) + (x_td.sort_number or 0)
	y_sn = (y_gv and tweak_data.lootdrop.global_values[y_gv].sort_number or 0) + (y_td.sort_number or 0)

	if x_sn ~= y_sn then
		return x_sn < y_sn
	end

	return y_id < x_id
end

function MenuCallbackHandler:open_dlc_store_page(dlc, context)
	if not MenuCallbackHandler:is_overlay_enabled() then
		managers.menu:show_enable_steam_overlay()

		return false
	end

	local dlc_data = Global.dlc_manager.all_dlc_data[dlc]

	if not dlc_data then
		dlc = managers.dlc:global_value_to_dlc(dlc)
		dlc_data = Global.dlc_manager.all_dlc_data[dlc]
	end

	if dlc_data then
		if dlc_data.app_id then
			local url = string.format("https://store.steampowered.com/app/%s/?utm_source=%s&utm_medium=%s&utm_campaign=%s", tostring(dlc_data.app_id), "ingame", context and tostring(context) or "inventory", "ingameupsell")

			Steam:overlay_activate("url", url)
		elseif dlc_data.source_id then
			Steam:overlay_activate("game", "OfficialGameGroup")
		else
			Steam:overlay_activate("url", tweak_data.gui.store_page)
		end

		return true
	end

	return false
end
