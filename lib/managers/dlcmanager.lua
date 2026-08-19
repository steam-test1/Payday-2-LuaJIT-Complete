DLCManager = DLCManager or class()
DLCManager.PLATFORM_CLASS_MAP = {}

function DLCManager:new(...)
	return (self.PLATFORM_CLASS_MAP[Idstring("STEAM"):key()] or GenericDLCManager):new(...)
end

GenericDLCManager = GenericDLCManager or class()

function GenericDLCManager:init()
	self._debug_on = Application:production_build()

	self:_set_dlc_save_table()
end

function GenericDLCManager:_set_dlc_save_table()
	if not Global.dlc_save then
		Global.dlc_save = {
			packages = {}
		}
	end
end

function GenericDLCManager:chk_vr_dlc()
	return nil
end

function GenericDLCManager:check_pdth(clbk)
	if clbk then
		clbk(false, false)
	end
end

function GenericDLCManager:setup()
	self:_modify_locked_content()
	self:_create_achievement_locked_content_table()
	self:_create_skirmish_locked_content_table()
	self:_create_crimespree_locked_content_table()
	self:_create_infamy_locked_content_table()
end

function GenericDLCManager:_create_achievement_locked_content_table()
	self._achievement_locked_content = {}
	self._achievement_milestone_locked_content = {}
	self._dlc_locked_content = {}

	for name, dlc in pairs(tweak_data.dlc) do
		local content = dlc.content

		if content then
			local loot_drops = content.loot_drops

			if loot_drops then
				for _, loot_drop in ipairs(loot_drops) do
					if loot_drop.type_items then
						if dlc.achievement_id then
							self._achievement_locked_content[loot_drop.type_items] = self._achievement_locked_content[loot_drop.type_items] or {}
							self._achievement_locked_content[loot_drop.type_items][loot_drop.item_entry] = name
						elseif dlc.milestone_id then
							self._achievement_milestone_locked_content[loot_drop.type_items] = self._achievement_milestone_locked_content[loot_drop.type_items] or {}
							self._achievement_milestone_locked_content[loot_drop.type_items][loot_drop.item_entry] = name
						else
							self._dlc_locked_content[loot_drop.type_items] = self._dlc_locked_content[loot_drop.type_items] or {}
							self._dlc_locked_content[loot_drop.type_items][loot_drop.item_entry] = name
						end
					end
				end
			end
		end
	end
end

function GenericDLCManager:_create_skirmish_locked_content_table()
	self._skirmish_locked_content = {}

	for id, rewards in pairs(tweak_data.skirmish.weekly_rewards) do
		for category, reward_list in pairs(rewards) do
			self._skirmish_locked_content[category] = self._skirmish_locked_content[category] or {}

			for _, entry in ipairs(reward_list) do
				self._skirmish_locked_content[category][entry] = self._skirmish_locked_content[category][entry] or {}

				table.insert(self._skirmish_locked_content[category][entry], "w_" .. tostring(id))
			end
		end
	end

	for id, rewards in pairs(tweak_data.skirmish.additional_rewards) do
		for category, reward_list in pairs(rewards) do
			self._skirmish_locked_content[category] = self._skirmish_locked_content[category] or {}

			for _, entry in ipairs(reward_list) do
				self._skirmish_locked_content[category][entry] = self._skirmish_locked_content[category][entry] or {}

				table.insert(self._skirmish_locked_content[category][entry], "a_" .. tostring(id))
			end
		end
	end
end

function GenericDLCManager:_create_crimespree_locked_content_table()
	self._crimespree_locked_content = {}

	for index, reward in ipairs(tweak_data.crime_spree.cosmetic_rewards) do
		self._crimespree_locked_content[reward.type] = self._crimespree_locked_content[reward.type] or {}
		self._crimespree_locked_content[reward.type][reward.id] = self._crimespree_locked_content[reward.type][reward.id] or {}

		table.insert(self._crimespree_locked_content[reward.type][reward.id], "cs_" .. tostring(index))
	end
end

function GenericDLCManager:_create_infamy_locked_content_table()
	self._infamy_locked_content = {}

	for rank, item in pairs(tweak_data.infamy.tree) do
		for _, reward in ipairs(tweak_data.infamy.items[item].upgrades) do
			local gv, category, entry_id = unpack(reward)

			self._infamy_locked_content[category] = self._infamy_locked_content[category] or {}
			self._infamy_locked_content[category][entry_id] = self._infamy_locked_content[category][entry_id] or {}

			table.insert(self._infamy_locked_content[category][entry_id], "inf_" .. tostring(rank))
		end
	end
end

function GenericDLCManager:_modify_locked_content()
	if IS_PC then
		return
	end

	local function _modify_loot_drop(loot_drop)
		local entry = tweak_data.blackmarket[loot_drop.type_items] and tweak_data.blackmarket[loot_drop.type_items][loot_drop.item_entry]

		if entry then
			if not entry.pc and (not entry.pcs or #entry.pcs == 0) then
				entry.pcs = {
					10,
					20,
					30,
					40
				}

				if loot_drop.type_items == "weapon_mods" then
					tweak_data.weapon.factory.parts[loot_drop.item_entry].pcs = {
						10,
						20,
						30,
						40
					}
				end
			end
		else
			print(" -- entry not exists")
		end
	end

	for name, dlc in pairs(tweak_data.dlc) do
		if not dlc.content_on_consoles then
			local content = dlc.content

			if content then
				local loot_drops = content.loot_drops

				if loot_drops then
					for _, loot_drop in ipairs(loot_drops) do
						if #loot_drop > 0 then
							for _, lp in ipairs(loot_drop) do
								_modify_loot_drop(lp)
							end
						else
							_modify_loot_drop(loot_drop)
						end
					end

					content.loot_drops = {}
				end
			end
		end
	end
end

function GenericDLCManager:is_content_achievement_locked(category, entry)
	local achievement_dlc_id = self._achievement_locked_content and self._achievement_locked_content[category] and self._achievement_locked_content[category][entry]

	if achievement_dlc_id then
		local dlc_tweak = tweak_data.dlc[achievement_dlc_id]
		local achievement = dlc_tweak and dlc_tweak.achievement_id

		return not achievement or not managers.achievment:get_info(achievement) or not managers.achievment:get_info(achievement).awarded
	end

	return false
end

function GenericDLCManager:is_content_achievement_milestone_locked(category, entry)
	local dlc_id = self._achievement_milestone_locked_content and self._achievement_milestone_locked_content[category] and self._achievement_milestone_locked_content[category][entry]
	local dlc_tweak = tweak_data.dlc[dlc_id]
	local unlocked_check_function = dlc_tweak and self[dlc_tweak.dlc]

	if unlocked_check_function then
		return not unlocked_check_function(self, dlc_tweak)
	end

	return false
end

function GenericDLCManager:achievement_locked_content()
	return self._achievement_locked_content
end

function GenericDLCManager:is_mask_achievement_locked(mask_id)
	return self._achievement_locked_content.masks and self._achievement_locked_content.masks[mask_id]
end

function GenericDLCManager:is_material_achievement_locked(material_id)
	return self._achievement_locked_content.materials and self._achievement_locked_content.materials[material_id]
end

function GenericDLCManager:is_texture_achievement_locked(texture_id)
	return self._achievement_locked_content.textures and self._achievement_locked_content.textures[texture_id]
end

function GenericDLCManager:is_weapon_mod_achievement_locked(weapon_mod_id)
	return self._achievement_locked_content.weapon_mods and self._achievement_locked_content.weapon_mods[weapon_mod_id]
end

function GenericDLCManager:is_mask_achievement_milestone_locked(mask_id)
	return self._achievement_milestone_locked_content.masks and self._achievement_milestone_locked_content.masks[mask_id]
end

function GenericDLCManager:is_weapon_mod_achievement_milestone_locked(weapon_mod_id)
	return self._achievement_milestone_locked_content.weapon_mods and self._achievement_milestone_locked_content.weapon_mods[weapon_mod_id]
end

function GenericDLCManager:get_achievement_from_locked_content(category, id)
	return self._achievement_locked_content[category] and self._achievement_locked_content[category][id] or self._achievement_milestone_locked_content[category] and self._achievement_milestone_locked_content[category][id]
end

function GenericDLCManager:skirmish_locked_content()
	return self._skirmish_locked_content
end

function GenericDLCManager:is_content_skirmish_locked(category, entry)
	return self._skirmish_locked_content and self._skirmish_locked_content[category] and self._skirmish_locked_content[category][entry] and true or false
end

function GenericDLCManager:crimespree_locked_content()
	return self._crimespree_locked_content
end

function GenericDLCManager:is_content_crimespree_locked(category, entry)
	return self._crimespree_locked_content and self._crimespree_locked_content[category] and self._crimespree_locked_content[category][entry] and true or false
end

function GenericDLCManager:infamy_locked_content()
	return self._infamy_locked_content
end

function GenericDLCManager:is_content_infamy_locked(category, entry)
	return self._infamy_locked_content and self._infamy_locked_content[category] and self._infamy_locked_content[category][entry] and true or false
end

function GenericDLCManager:dlc_locked_content()
	return self._dlc_locked_content
end

function GenericDLCManager:weapon_color_achievement_locked_content(weapon_color)
	return self._achievement_locked_content.weapon_skins and self._achievement_locked_content.weapon_skins[weapon_color]
end

function GenericDLCManager:weapon_color_achievement_milestone_locked_content(weapon_color)
	return self._achievement_milestone_locked_content.weapon_skins and self._achievement_milestone_locked_content.weapon_skins[weapon_color]
end

function GenericDLCManager:on_tweak_data_reloaded()
	self:setup()
end

function GenericDLCManager:init_finalize()
	managers.savefile:add_load_sequence_done_callback_handler(callback(self, self, "_load_done"))
end

function GenericDLCManager:chk_content_updated()
	return
end

function GenericDLCManager:give_dlc_and_verify_blackmarket()
	self:give_dlc_package()

	Global.dlc_manager.verify_content_update = nil

	managers.event_jobs:aquire_claimed_upgrades()
	managers.infamy:give_dlc()

	if managers.experience and managers.upgrades then
		for level = 0, managers.experience:current_level() do
			managers.upgrades:aquire_from_level_tree(level, true)
			managers.upgrades:verify_level_tree(level, true)
		end
	end

	if managers.blackmarket then
		managers.blackmarket:tradable_dlcs()
		managers.blackmarket:verify_dlc_items()
	else
		Application:error("[GenericDLCManager] _load_done(): BlackMarketManager not yet initialized!")
	end

	if managers.crime_spree then
		managers.crime_spree:_setup_mission_lists()
	end
end

function GenericDLCManager:_load_done(...)
	self:give_dlc_and_verify_blackmarket()
end

function GenericDLCManager:give_dlc_package()
	for package_id, data in pairs(tweak_data.dlc) do
		if self:is_dlc_unlocked(package_id) then
			if not Global.dlc_save.packages[package_id] then
				Global.dlc_save.packages[package_id] = true

				for _, loot_drop in ipairs(data.content.loot_drops or {}) do
					local loot_drop = #loot_drop > 0 and loot_drop[math.random(#loot_drop)] or loot_drop
					local add_to_inventory = true

					if add_to_inventory and loot_drop.type_items == "armor_skins" then
						managers.blackmarket:on_aquired_armor_skin(loot_drop.item_entry)

						add_to_inventory = false
					end

					if add_to_inventory and loot_drop.type_items == "player_styles" then
						managers.blackmarket:on_aquired_player_style(loot_drop.item_entry)

						add_to_inventory = false
					end

					if add_to_inventory and loot_drop.type_items == "suit_variations" then
						managers.blackmarket:on_aquired_suit_variation(loot_drop.item_entry[1], loot_drop.item_entry[2])

						add_to_inventory = false
					end

					if add_to_inventory and loot_drop.type_items == "gloves" then
						managers.blackmarket:on_aquired_glove_id(loot_drop.item_entry)

						add_to_inventory = false
					end

					if add_to_inventory then
						for i = 1, loot_drop.amount or 1 do
							local entry = tweak_data.blackmarket[loot_drop.type_items][loot_drop.item_entry]
							local global_value = loot_drop.global_value or data.content.loot_global_value or package_id

							managers.blackmarket:add_to_inventory(global_value, loot_drop.type_items, loot_drop.item_entry)
						end
					end
				end
			end

			local identifier = UpgradesManager.AQUIRE_STRINGS[5] .. tostring(package_id)

			for _, upgrade in ipairs(data.content.upgrades or {}) do
				if not managers.upgrades:aquired(upgrade, identifier) then
					managers.upgrades:aquire_default(upgrade, identifier)
				end
			end
		else
			local identifier = UpgradesManager.AQUIRE_STRINGS[5] .. tostring(package_id)

			for _, upgrade in ipairs(data.content.upgrades or {}) do
				if managers.upgrades:aquired(upgrade, identifier) then
					managers.upgrades:unaquire(upgrade, identifier)
				end
			end
		end
	end
end

function GenericDLCManager:give_missing_package()
	local name_converter = {
		colors = "color",
		materials = "material",
		textures = "pattern"
	}
	local entry, global_value, passed, has_item, name, check_loot_drop

	for package_id, data in pairs(tweak_data.dlc) do
		if Global.dlc_save.packages[package_id] and self:is_dlc_unlocked(package_id) then
			for _, loot_drop in ipairs(data.content and data.content.loot_drops or {}) do
				check_loot_drop = #loot_drop == 0

				if check_loot_drop and loot_drop.type_items == "armor_skins" then
					entry = tweak_data.economy.armor_skins[loot_drop.item_entry]
					has_item = managers.blackmarket:armor_skin_unlocked(loot_drop.item_entry)

					if not entry.steam_economy and not has_item then
						managers.blackmarket:on_aquired_armor_skin(loot_drop.item_entry)
					end

					check_loot_drop = false
				end

				if check_loot_drop and loot_drop.type_items == "player_styles" then
					if not managers.blackmarket:player_style_unlocked(loot_drop.item_entry) then
						managers.blackmarket:on_aquired_player_style(loot_drop.item_entry)
					end

					check_loot_drop = false
				end

				if check_loot_drop and loot_drop.type_items == "suit_variations" then
					if not managers.blackmarket:suit_variation_unlocked(loot_drop.item_entry[1], loot_drop.item_entry[2]) then
						managers.blackmarket:on_aquired_suit_variation(loot_drop.item_entry[1], loot_drop.item_entry[2])
					end

					check_loot_drop = false
				end

				if check_loot_drop and loot_drop.type_items == "gloves" then
					if not managers.blackmarket:glove_id_unlocked(loot_drop.item_entry) then
						managers.blackmarket:on_aquired_glove_id(loot_drop.item_entry)
					end

					check_loot_drop = false
				end

				if check_loot_drop then
					entry = tweak_data.blackmarket[loot_drop.type_items][loot_drop.item_entry]
					global_value = loot_drop.global_value or data.content.loot_global_value or package_id
					passed = false

					if (loot_drop.type_items == "weapon_mods" or loot_drop.type_items == "weapon_skins") and entry.is_a_unlockable then
						has_item = managers.blackmarket:get_item_amount(global_value, loot_drop.type_items, loot_drop.item_entry, true) > 0
						passed = not has_item
					elseif loot_drop.type_items ~= "weapon_mods" and entry.value and entry.value == 0 then
						has_item = managers.blackmarket:get_item_amount(global_value, loot_drop.type_items, loot_drop.item_entry, true) > 0

						if not has_item then
							if loot_drop.type_items == "masks" then
								for slot, crafted in pairs(Global.blackmarket_manager.crafted_items.masks) do
									if slot ~= 1 and crafted.mask_id == loot_drop.item_entry and crafted.global_value == global_value then
										has_item = true

										break
									end
								end
							elseif loot_drop.type_items == "materials" or loot_drop.type_items == "textures" or loot_drop.type_items == "colors" then
								for slot, crafted in pairs(Global.blackmarket_manager.crafted_items.masks) do
									if slot ~= 1 then
										name = name_converter[loot_drop.type_items]

										if crafted.blueprint[name].id == loot_drop.item_entry and crafted.blueprint[name].global_value == global_value then
											has_item = true

											break
										end
									end
								end
							end

							passed = not has_item
						end
					end

					if passed then
						print("[GenericDLCManager:give_missing_package] Found missing Item!", loot_drop.amount, global_value, loot_drop.type_items, loot_drop.item_entry)

						for i = 1, loot_drop.amount or 1 do
							managers.blackmarket:add_to_inventory(global_value, loot_drop.type_items, loot_drop.item_entry)
						end
					end
				end
			end
		end
	end
end

function GenericDLCManager:list_dlc_package(dlcs)
	local t = {}

	for package_id, data in pairs(tweak_data.dlc) do
		if not dlcs or dlcs[package_id] or table.contains(dlcs, package_id) then
			for _, loot_drop in ipairs(data.content.loot_drops or {}) do
				t.items = t.items or {}

				if #loot_drop > 0 then
					-- Nothing
				else
					local global_value = loot_drop.global_value or data.content.loot_global_value or package_id
					local category = loot_drop.type_items
					local entry = loot_drop.item_entry
					local amount = loot_drop.amount

					table.insert(t.items, {
						global_value,
						category,
						entry,
						amount
					})
				end
			end

			for _, upgrade in ipairs(data.content.upgrades or {}) do
				t.upgrades = t.upgrades or {}

				table.insert(t.upgrades, upgrade)
			end
		end
	end

	return t
end

function GenericDLCManager:save(data)
	data.dlc_save = Global.dlc_save
end

function GenericDLCManager:load(data)
	if data.dlc_save and data.dlc_save.packages then
		Global.dlc_save = data.dlc_save
	end
end

function GenericDLCManager:on_reset_profile()
	Global.dlc_save = nil

	self:_set_dlc_save_table()
	self:give_dlc_package()
end

function GenericDLCManager:on_achievement_award_loot()
	Application:debug("GenericDLCManager:on_achievement_award_loot()")
	self:give_dlc_package()
end

function GenericDLCManager:on_signin_complete()
	return
end

function GenericDLCManager:global_value_to_dlc(global_value)
	local gv_tweak = tweak_data.lootdrop.global_values[global_value]

	return gv_tweak and gv_tweak.dlc and global_value or nil
end

function GenericDLCManager:dlc_to_global_value(dlc)
	local gv_tweak = tweak_data.lootdrop.global_values[dlc]

	if gv_tweak and gv_tweak.dlc then
		return dlc
	end

	local dlc_data = tweak_data.dlc[dlc]

	return dlc_data and dlc_data.content and dlc_data.content.loot_global_value or nil
end

function GenericDLCManager:is_global_value_unlocked(global_value)
	local dlc = self:global_value_to_dlc(global_value)

	return not dlc or self:is_dlc_unlocked(dlc)
end

function GenericDLCManager:should_hide_unavailable(dlc_or_gv, is_global_value, alt_tweak_data)
	alt_tweak_data = alt_tweak_data or tweak_data

	local global_value = is_global_value and dlc_or_gv or self:dlc_to_global_value(dlc_or_gv)
	local lootdrop_tweak = global_value and alt_tweak_data.lootdrop.global_values[global_value] or {}

	if not lootdrop_tweak.hide_unavailable then
		return false
	end

	if type(lootdrop_tweak.hide_unavailable) == "string" then
		local dlc = lootdrop_tweak.hide_unavailable
		local is_unlocked = not Global.dlc_manager.all_dlc_data[dlc] or Global.dlc_manager.all_dlc_data[dlc].verified

		if not is_unlocked then
			return true
		end

		return false
	end

	return true
end

function GenericDLCManager:get_unavailable_id(global_value)
	local lootdrop_tweak = global_value and tweak_data.lootdrop.global_values[global_value]

	return lootdrop_tweak and lootdrop_tweak.unavailable_id or "bm_menu_dlc_locked"
end

function GenericDLCManager:is_dlcs_unlocked(list_of_dlcs)
	for _, dlc in ipairs(list_of_dlcs) do
		if not self:is_dlc_unlocked(dlc) then
			return false
		end
	end

	return true
end

function GenericDLCManager:is_dlc_unlocked(dlc)
	return tweak_data.dlc[dlc] and tweak_data.dlc[dlc].free or self:has_dlc(dlc)
end

GenericDLCManager.dlc_data_name_converter = {
	cce = "career_criminal_edition"
}

function GenericDLCManager:has_dlc(dlc)
	local dlc_tweak = tweak_data.dlc[dlc]

	if dlc_tweak and dlc_tweak.dlc then
		local unlocked_check_function = self[dlc_tweak.dlc]

		if unlocked_check_function then
			return unlocked_check_function(self, dlc_tweak)
		else
			Application:error("Didn't have dlc has function for", dlc, "has_dlc()", dlc_tweak.dlc)
		end
	end

	dlc = self.dlc_data_name_converter[dlc] or dlc

	local dlc_data = Global.dlc_manager.all_dlc_data[dlc]

	if not dlc_data then
		Application:error("Didn't have dlc data for ", dlc)

		return false
	end

	return dlc_data.verified
end

function GenericDLCManager:has_full_game()
	return Global.dlc_manager.all_dlc_data.full_game.verified
end

function GenericDLCManager:is_trial()
	return not self:has_full_game()
end

function GenericDLCManager:is_installing()
	if not DB:is_bundled() or IS_PC then
		return false, 1
	end

	local install_progress = Application:installer():get_progress()
	local is_installing = install_progress < 1

	return is_installing, install_progress
end

function GenericDLCManager:dlcs_string()
	local s = ""

	s = s .. (self:is_dlc_unlocked("preorder") and "preorder " or "")

	return s
end

function GenericDLCManager:has_corrupt_data()
	return self._has_corrupt_data
end

function GenericDLCManager:has_all_dlcs()
	return self:is_dlcs_unlocked({
		"armored_transport",
		"gage_pack"
	})
end

function GenericDLCManager:has_goty_weapon_bundle_2014()
	return self:is_dlcs_unlocked({
		"gage_pack",
		"gage_pack_lmg",
		"gage_pack_jobs",
		"gage_pack_snp",
		"gage_pack_shotgun",
		"gage_pack_assault",
		"gage_pack_historical"
	})
end

function GenericDLCManager:has_goty_heist_bundle_2014()
	return self:is_dlcs_unlocked({
		"armored_transport",
		"big_bank",
		"hl_miami",
		"hope_diamond"
	})
end

function GenericDLCManager:has_pd2_clan()
	return self:is_dlc_unlocked("pd2_clan")
end

function GenericDLCManager:has_john_wick_character()
	return Global.dlc_manager.all_dlc_data.john_wick_character and Global.dlc_manager.all_dlc_data.john_wick_character.verified and self:is_dlc_unlocked("pd2_clan")
end

function GenericDLCManager:has_raidww2_clan()
	return self:is_dlc_unlocked("raidww2_clan")
end

function GenericDLCManager:has_twitch_pack()
	return self:is_dlc_unlocked("twitch_pack")
end

function GenericDLCManager:has_turtles()
	return self:is_dlc_unlocked("turtles")
end

function GenericDLCManager:has_dragon()
	return self:is_dlc_unlocked("dragon")
end

function GenericDLCManager:has_dbd_clan()
	local verified = self:is_dlc_unlocked("dbd_clan")

	return verified
end

function GenericDLCManager:has_dbd_deluxe()
	local dbd_deluxe_data = Global.dlc_manager.all_dlc_data.dbd_deluxe
	local dbd_regular_data = Global.dlc_manager.all_dlc_data.dbd_regular
	local verified = dbd_deluxe_data and dbd_deluxe_data.verified

	verified = verified or dbd_regular_data and dbd_regular_data.verified

	return verified
end

function GenericDLCManager:has_solus_clan()
	local verified = self:is_dlc_unlocked("solus_clan")

	return verified
end

function GenericDLCManager:has_tango()
	return self:is_dlc_unlocked("tango")
end

function GenericDLCManager:has_chico()
	return self:is_dlc_unlocked("chico")
end

function GenericDLCManager:has_friend()
	return self:is_dlc_unlocked("friend")
end

function GenericDLCManager:has_sparkle()
	return self:is_dlc_unlocked("sparkle")
end

function GenericDLCManager:has_swm()
	return self:is_dlc_unlocked("swm")
end

function GenericDLCManager:has_spa()
	return self:is_dlc_unlocked("spa")
end

function GenericDLCManager:has_sha()
	return self:is_dlc_unlocked("sha")
end

function GenericDLCManager:has_rvd()
	return self:is_dlc_unlocked("rvd")
end

function GenericDLCManager:has_grv()
	return self:is_dlc_unlocked("grv")
end

function GenericDLCManager:has_amp()
	return self:is_dlc_unlocked("amp")
end

function GenericDLCManager:has_mp2()
	return self:is_dlc_unlocked("mp2")
end

function GenericDLCManager:has_ant_free()
	local verified = Global.dlc_manager.all_dlc_data.ant_free and Global.dlc_manager.all_dlc_data.ant_free.verified

	return verified
end

function GenericDLCManager:has_ant()
	local verified = Global.dlc_manager.all_dlc_data.ant and Global.dlc_manager.all_dlc_data.ant.verified

	return verified
end

function GenericDLCManager:has_coco()
	return Global.dlc_manager.all_dlc_data.coco and Global.dlc_manager.all_dlc_data.coco.verified
end

function GenericDLCManager:has_mad()
	return Global.dlc_manager.all_dlc_data.mad and Global.dlc_manager.all_dlc_data.mad.verified
end

function GenericDLCManager:has_pn2()
	return self:is_dlc_unlocked("pn2")
end

function GenericDLCManager:has_max()
	return self:is_dlc_unlocked("max")
end

function GenericDLCManager:has_dgm()
	return self:is_dlc_unlocked("dgm")
end

function GenericDLCManager:has_gcm()
	return self:is_dlc_unlocked("gcm")
end

function GenericDLCManager:has_ztm()
	return self:is_dlc_unlocked("ztm")
end

function GenericDLCManager:has_joy()
	return self:is_dlc_unlocked("joy")
end

function GenericDLCManager:has_fdm()
	return self:is_dlc_unlocked("fdm")
end

function GenericDLCManager:has_ecp()
	return self:is_dlc_unlocked("ecp")
end

function GenericDLCManager:has_myh()
	return self:is_dlc_unlocked("myh")
end

function GenericDLCManager:has_pbm()
	return self:is_dlc_unlocked("pbm")
end

function GenericDLCManager:has_fgl()
	return self:is_dlc_unlocked("fgl")
end

function GenericDLCManager:has_osa()
	return self:is_dlc_unlocked("osa")
end

function GenericDLCManager:has_gwm()
	return self:is_dlc_unlocked("gwm")
end

function GenericDLCManager:has_ami()
	return self:is_dlc_unlocked("ami")
end

function GenericDLCManager:has_pmp()
	return self:is_dlc_unlocked("pmp")
end

function GenericDLCManager:has_ghm()
	return self:is_dlc_unlocked("ghm")
end

function GenericDLCManager:has_pda8_wpn_money()
	return managers.perpetual_event:has_event_upgrade("money")
end

function GenericDLCManager:has_pda10_bessy()
	return managers.perpetual_event:has_event_upgrade("bessy")
end

function GenericDLCManager:has_pda10_piggy_hammer()
	return managers.perpetual_event:has_event_upgrade("piggy_hammer")
end

function GenericDLCManager:has_xmas_snowball()
	return managers.perpetual_event:has_event_upgrade("xmas_snowball")
end

function GenericDLCManager:has_victor_mods_pack_1()
	return managers.event_jobs and (managers.event_jobs:has_already_claimed_reward("cg22_2", 1) or managers.event_jobs:has_already_claimed_reward("cg22_2", 2) or managers.event_jobs:has_already_claimed_reward("cg22_2", 3))
end

function GenericDLCManager:has_victor_mods_pack_2()
	return managers.event_jobs and (managers.event_jobs:has_already_claimed_reward("cg22_3", 1) or managers.event_jobs:has_already_claimed_reward("cg22_3", 2))
end

function GenericDLCManager:has_gage_pack_shotgun()
	return self:is_dlc_unlocked("gage_pack_shotgun")
end

function GenericDLCManager:has_bbq()
	return self:is_dlc_unlocked("bbq")
end

function GenericDLCManager:has_a10mask()
	return self:is_dlc_unlocked("a10mask")
end

function GenericDLCManager:has_mrwi_deck()
	return managers.event_jobs:has_completed_and_claimed_rewards("cg22_community_4")
end

function GenericDLCManager:has_mrwi_deck_equipped_mimicing(choice)
	local has_deck_unlocked = self:has_mrwi_deck()
	local has_deck_equipped = managers.skilltree:get_specialization_value("current_specialization") == 23
	local has_choice = managers.skilltree:get_specialization_value(23, "choices", 9) == choice

	return has_deck_unlocked and has_deck_equipped and has_choice
end

function GenericDLCManager:has_chico_or_mrwi_deck()
	return self:has_chico() or self:has_mrwi_deck_equipped_mimicing(17)
end

function GenericDLCManager:has_ecp_or_mrwi_deck()
	return self:has_ecp() or self:has_mrwi_deck_equipped_mimicing(20)
end

function GenericDLCManager:has_goty_all_dlc_bundle_2014()
	return self:has_goty_weapon_bundle_2014() and self:has_goty_heist_bundle_2014() and self:is_dlcs_unlocked({
		"character_pack_clover"
	})
end

function GenericDLCManager:has_soundtrack_or_cce()
	return self:is_dlc_unlocked("soundtrack") or self:is_dlc_unlocked("cce")
end

function GenericDLCManager:has_freed_old_hoxton(data)
	if IS_PC then
		if self:is_dlc_unlocked("pd2_clan") then
			if self:has_achievement(data) then
				return true
			else
				local stats_sessions = managers.statistics._global.sessions
				local stats_hox_2 = stats_sessions.hox_2

				if stats_hox_2 and stats_hox_2.completed and stats_hox_2.completed > 0 then
					Application:warn("[GenericDLCManager:has_freed_old_hoxton] Tripped the double check", inspect(data))

					return true
				end
			end
		end
	else
		return true
	end

	return false
end

function GenericDLCManager:has_armored_transport_and_intel(data)
	return self:is_dlc_unlocked("armored_transport") and self:has_achievement(data)
end

function GenericDLCManager:has_hlm_game()
	local verified = false

	for _, id in ipairs({
		"hlm_game",
		"hlm_dlc"
	}) do
		local dlc_data = Global.dlc_manager.all_dlc_data[id]

		verified = dlc_data and dlc_data.verified

		if verified then
			break
		end
	end

	return verified
end

function GenericDLCManager:has_hlm2()
	local verified = false

	for _, id in ipairs({
		"hlm2",
		"hlm_dlc",
		"hlm2_aus",
		"hlm26"
	}) do
		local dlc_data = Global.dlc_manager.all_dlc_data[id]

		verified = dlc_data and dlc_data.verified

		if verified then
			break
		end
	end

	return verified
end

function GenericDLCManager:has_hlm2_deluxe()
	local verified = false

	for _, id in ipairs({
		"hlm2_deluxe",
		"hlm_dlc",
		"hlm2_aus",
		"hlm26"
	}) do
		local dlc_data = Global.dlc_manager.all_dlc_data[id]

		verified = dlc_data and dlc_data.verified

		if verified then
			break
		end
	end

	return verified
end

function GenericDLCManager:has_sawp_dlc_or_achievement(data)
	return self:is_dlc_unlocked("sawp") or self:has_achievement(data)
end

function GenericDLCManager:has_srtr_or_srtr2()
	local verified = Global.dlc_manager.all_dlc_data.srtr and Global.dlc_manager.all_dlc_data.srtr.verified

	verified = verified or Global.dlc_manager.all_dlc_data.srtr2 and Global.dlc_manager.all_dlc_data.srtr2.verified

	return verified
end

function GenericDLCManager:has_parent_dlc(data)
	return data and data.parent_dlc and self:is_dlc_unlocked(data.parent_dlc)
end

function GenericDLCManager:has_achievement(data)
	local achievement = managers.achievment and data and data.achievement_id and managers.achievment:get_info(data.achievement_id)

	return achievement and achievement.awarded or false
end

function GenericDLCManager:has_achievement_milestone(data)
	local milestone = data and data.milestone_id and managers.achievment:get_milestone(data.milestone_id)

	return milestone.awarded
end

function GenericDLCManager:has_stat(data)
	return true
end

function GenericDLCManager:has_dlc_or_soundtrack_or_cce(dlc)
	return managers.dlc:is_dlc_unlocked(dlc) or managers.dlc:has_soundtrack_or_cce()
end

WINDLCManager = WINDLCManager or class(GenericDLCManager)

function WINDLCManager:init()
	WINDLCManager.super.init(self)

	if not Global.dlc_manager then
		Global.dlc_manager = {}
		Global.dlc_manager.all_dlc_data = {}
		Global.dlc_manager.entitlements = {}

		self:init_dlc_data()
		self:init_generated()
		self:init_entitlements()
		self:_chk_blocked()
	end

	self._promoted_dlc_list = {}

	if Distribution:logged_on() then
		self:_verify_dlcs()
		self:_init_promoted_dlc_list()
	else
		Distribution:add_login_callback(function()
			self:_verify_dlcs()
			self:_init_promoted_dlc_list()
		end)
	end
end

function WINDLCManager:_chk_blocked()
	if self.blocked_dlcs then
		for blocked_dlc_name, _ in pairs(self.blocked_dlcs) do
			if Global.dlc_manager.all_dlc_data[blocked_dlc_name] then
				Global.dlc_manager.all_dlc_data[blocked_dlc_name].blocked = true
			end
		end
	end
end

function WINDLCManager:_init_promoted_dlc_list()
	self._promoted_dlc_list = {
		"deep",
		"pxp4",
		"txt4",
		"corp",
		"pxp3",
		"mxm",
		"txt3",
		"trai",
		"pxp2",
		"tma1",
		"txt2",
		"ranc",
		"pxp1",
		"txt1",
		"pent",
		"gdtp",
		"lawp",
		"snow",
		"chca",
		"cctp",
		"tawp",
		"sand",
		"sdtp",
		"sawp",
		"chas",
		"fawp",
		"fex",
		"mxw",
		"pgo",
		"ocp",
		"pex",
		"wcc",
		"atw",
		"bex",
		"afp",
		"wcs",
		"mbs",
		"mex",
		"mwm",
		"trd",
		"ecp",
		"grv",
		"spa",
		"friend",
		"tango",
		"pim",
		"born",
		"wild",
		"opera",
		"pal",
		"peta",
		"berry",
		"steel",
		"dragon",
		"turtles",
		"character_pack_sokol",
		"kenaz",
		"arena",
		"west",
		"bbq",
		"overkill_pack",
		"akm4_pack",
		"character_pack_dragan",
		"the_bomb",
		"character_pack_clover",
		"hope_diamond",
		"gage_pack_historical",
		"hl_miami",
		"gage_pack_assault",
		"gage_pack_shotgun",
		"big_bank",
		"gage_pack_snp",
		"gage_pack_jobs",
		"gage_pack_lmg",
		"gage_pack",
		"armored_transport"
	}
end

function WINDLCManager:get_promoted_dlc_list()
	return self._promoted_dlc_list
end

function WINDLCManager:_verify_dlcs()
	for dlc_name, dlc_data in pairs(Global.dlc_manager.all_dlc_data) do
		if not dlc_data.verified and self:_check_dlc_data(dlc_data) then
			dlc_data.verified = true
		end
	end
end

function WINDLCManager:chk_content_updated()
	local has_content
	local content_updated = false

	for dlc_name, dlc_data in pairs(Global.dlc_manager.all_dlc_data) do
		has_content = self:_check_dlc_data(dlc_data)
		content_updated = content_updated or has_content ~= dlc_data.verified
		dlc_data.verified = has_content
	end

	if content_updated then
		if (game_state_machine and game_state_machine:current_state_name()) == "menu_main" then
			self:give_dlc_and_verify_blackmarket()
		else
			Global.dlc_manager.verify_content_update = true
		end
	end
end

function WINDLCManager:set_entitlements(entitlements)
	Global.dlc_manager.entitlements = table.list_to_set(entitlements or {})
	Global.dlc_manager.received_entitlements = true

	self:chk_content_updated()
end

function WINDLCManager:has_entitlement(entitlement_id)
	return Global.dlc_manager.entitlements[entitlement_id]
end

function WINDLCManager:save(data)
	WINDLCManager.super.save(self, data)

	data.dlc_entitlements = Global.dlc_manager.entitlements
end

function WINDLCManager:load(data)
	WINDLCManager.super.load(self, data)

	if data.dlc_entitlements and not Global.dlc_manager.received_entitlements then
		Global.dlc_manager.entitlements = data.dlc_entitlements

		self:chk_content_updated()
	end
end

function WINDLCManager:init_finalize()
	WINDLCManager.super.init_finalize(self)

	if Global.dlc_manager.verify_content_update and (game_state_machine and game_state_machine:last_queued_state_name()) == "menu_main" then
		self:give_dlc_and_verify_blackmarket()
	end
end

WinSteamDLCManager = WinSteamDLCManager or class(WINDLCManager)
DLCManager.PLATFORM_CLASS_MAP[Idstring("STEAM"):key()] = WinSteamDLCManager

function WinSteamDLCManager:init()
	WinSteamDLCManager.super.init(self)
end

function WinSteamDLCManager:_init_promoted_dlc_list()
	WinSteamDLCManager.super._init_promoted_dlc_list(self)
end

function WinSteamDLCManager:has_stat(data)
	local sa_handler = Steam:sa_handler()

	return sa_handler:get_stat(data.stat_id) >= (data.stat_value or 1)
end

function WinSteamDLCManager:_check_dlc_data(dlc_data)
	if dlc_data.blocked then
		return false
	end

	local had_verification = false
	local verify_all = dlc_data.verify_all

	if dlc_data.app_id or dlc_data.epic_id then
		had_verification = true

		local app_id

		if IS_STEAM then
			app_id = dlc_data.app_id
		elseif IS_EPIC then
			app_id = dlc_data.epic_id
		end

		app_id = app_id or ""

		if dlc_data.no_install then
			if Distribution:is_product_owned(app_id) then
				if not verify_all then
					return true
				end
			elseif verify_all then
				return false
			end
		elseif Distribution:is_product_installed(app_id) then
			if not verify_all then
				return true
			end
		elseif verify_all then
			return false
		end
	end

	if dlc_data.source_id and IS_STEAM then
		had_verification = true

		if Steam:is_user_in_source(Steam:userid(), dlc_data.source_id) then
			if not verify_all then
				return true
			end
		elseif verify_all then
			return false
		end
	end

	if dlc_data.entitlement_id then
		had_verification = true

		if self:has_entitlement(dlc_data.entitlement_id) then
			if not verify_all then
				return true
			end
		elseif verify_all then
			return false
		end
	end

	if verify_all then
		return had_verification
	end

	return false
end

function WinSteamDLCManager:_verify_dlcs()
	WinSteamDLCManager.super._verify_dlcs(self)
end

function WinSteamDLCManager:check_pdth(clbk)
	if Distribution:type() ~= Idstring("STEAM") then
		clbk(false, false)

		return
	end

	if not self._check_pdth_request and clbk and Global.dlc_manager.has_pdth ~= nil then
		clbk(Global.dlc_manager.has_pdth, Global.dlc_manager.pdth_tester)

		return
	end

	self._check_pdth_callback = clbk

	if self._check_pdth_request or Global.dlc_manager.has_pdth ~= nil then
		return
	end

	local has_pdth = Steam:is_product_owned(24240)

	Global.dlc_manager.has_pdth = has_pdth

	if has_pdth then
		local function result_function(success, page)
			if success then
				local json_reply_match = "\"([^,:\"]+)\"%s*:%s*\"([^\"]+)\""
				local key, value = string.gmatch(page, json_reply_match)()

				if key and value then
					key = string.lower(key)
					value = string.lower(value)

					if key == "achieved" and value == "true" then
						Global.dlc_manager.pdth_tester = true
					elseif key == "error" then
						print("[WinSteamDLCManager:check_pdth] Request error ", value)
					end
				end
			end

			if self._check_pdth_callback then
				self._check_pdth_callback(Global.dlc_manager.has_pdth, Global.dlc_manager.pdth_tester)

				self._check_pdth_callback = nil
			end

			self._check_pdth_request = nil
		end

		print("[WinSteamDLCManager:check_pdth] Send request")

		self._check_pdth_request = true

		HttpRequest:get("https://fbi.paydaythegame.com/veterancheck/veterancheck.php?steamid=" .. Steam:userid(), result_function)
	end
end

function WinSteamDLCManager:chk_vr_dlc()
	local steam_vr = Steam:is_app_installed("250820")
	local payday2_vr = Steam:is_product_installed("826090")

	if steam_vr and not payday2_vr then
		Steam:install_dlc("826090")

		return true
	elseif not steam_vr and payday2_vr then
		Steam:uninstall_dlc("826090")

		return false
	end

	return nil
end

if IS_PC then
	require("lib/managers/dlc/DLCManagerWin32Data")
	require("lib/managers/dlc/DLCManagerEntitlementData")
end

require("lib/managers/dlc/DLCManagerGeneratedData")
