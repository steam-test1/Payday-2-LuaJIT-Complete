EconomyTweakData.sorting_groups = EconomyTweakData.sorting_groups or {}
EconomyTweakData.ordered_sorting_groups = EconomyTweakData.ordered_sorting_groups or {}
EconomyTweakData.sorting_groups.armor_skins = {
	camo = 2,
	crime_spree = 1,
	none = 0,
	tam = 3
}
EconomyTweakData.ordered_sorting_groups.armor_skins = {
	"none",
	"crime_spree",
	"camo",
	"tam"
}

local sorting_groups = EconomyTweakData.sorting_groups.armor_skins

function EconomyTweakData:get_real_armor_skin_id(skin_id)
	local lbv = "_lbv"

	if string.sub(skin_id, #skin_id - #lbv + 1, #skin_id) == lbv then
		return string.sub(skin_id, 1, #skin_id - #lbv)
	else
		return skin_id
	end
end

function EconomyTweakData:get_armor_skin_id(skin_id)
	return skin_id
end

function EconomyTweakData:get_armor_based_value(value_table, armor_level)
	if not armor_level then
		Application:stack_dump_error("")
	end

	if type(value_table) == "table" then
		for level, value in pairs(value_table) do
			if type(level) == "string" then
				local level_num = tonumber(level)

				if level_num then
					value_table[level_num] = value
					value_table[level] = nil
				end
			end
		end

		if table.size(value_table) == 1 then
			for _, value in pairs(value_table) do
				return value
			end
		else
			for level, value in pairs(value_table) do
				if level == armor_level then
					return value
				end
			end

			local highest_idx = 0

			for level, value in pairs(value_table) do
				if highest_idx < level then
					highest_idx = level
				end
			end

			if highest_idx > 0 then
				return value_table[highest_idx]
			end
		end
	else
		return value_table
	end
end

function EconomyTweakData:_init_armor_skins()
	local ids_big = Idstring("units/payday2/characters/shared_textures/vest_big_01_df")
	local ids_small = Idstring("units/payday2/characters/shared_textures/vest_small_01_df")
	local armor_skins_configs = {
		["units/payday2/characters/npc_criminal_female_1/mtr_fem1"] = "units/payday2/characters/npc_criminal_female_1/mtr_fem1_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_bodhi"] = "units/payday2/characters/npc_criminals_suit_1/mtr_bodhi_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_chains"] = "units/payday2/characters/npc_criminals_suit_1/mtr_chains_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_dallas"] = "units/payday2/characters/npc_criminals_suit_1/mtr_dallas_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_dragan"] = "units/payday2/characters/npc_criminals_suit_1/mtr_dragan_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_hoxton"] = "units/payday2/characters/npc_criminals_suit_1/mtr_hoxton_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_jacket"] = "units/payday2/characters/npc_criminals_suit_1/mtr_jacket_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_jimmy"] = "units/payday2/characters/npc_criminals_suit_1/mtr_jimmy_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_jiro"] = "units/payday2/characters/npc_criminals_suit_1/mtr_jiro_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_john_wick"] = "units/payday2/characters/npc_criminals_suit_1/mtr_john_wick_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_old_hoxton"] = "units/payday2/characters/npc_criminals_suit_1/mtr_old_hoxton_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_sokol"] = "units/payday2/characters/npc_criminals_suit_1/mtr_sokol_cc",
		["units/payday2/characters/npc_criminals_suit_1/mtr_wolf"] = "units/payday2/characters/npc_criminals_suit_1/mtr_wolf_cc",
		["units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/mtr_bonnie"] = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/mtr_bonnie_cc",
		["units/pd2_dlc_chico/characters/npc_criminals_terry/mtr_criminal_terry"] = "units/pd2_dlc_chico/characters/npc_criminals_terry/mtr_criminal_terry_cc",
		["units/pd2_dlc_ecp/characters/npc_criminals_ecp_female/mtr_criminal_ecp_female"] = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_female/mtr_criminal_ecp_female_cc",
		["units/pd2_dlc_ecp/characters/npc_criminals_ecp_male/mtr_criminal_ecp_male"] = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_male/mtr_criminal_ecp_male_cc",
		["units/pd2_dlc_joy/characters/npc_criminals_joy_1/mtr_criminal_joy_1"] = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/mtr_criminal_joy_1_cc",
		["units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max"] = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_cc",
		["units/pd2_dlc_myh/characters/npc_criminals_myh/mtr_criminal_myh"] = "units/pd2_dlc_myh/characters/npc_criminals_myh/mtr_criminal_myh_cc",
		["units/pd2_dlc_opera/characters/npc_criminals_fem_3/mtr_criminal_sydney"] = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/mtr_criminal_sydney_cc",
		["units/pd2_dlc_wild/characters/npc_criminals_wild_1/mtr_criminal_wild_1"] = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/mtr_criminal_wild_1_cc"
	}

	self.armor_skins_configs = {}
	self.armor_skins_configs_map = {}

	for orig, cc in pairs(armor_skins_configs) do
		self.armor_skins_configs[Idstring(orig):key()] = Idstring(cc)
		self.armor_skins_configs_map[Idstring(cc):key()] = Idstring(orig)
	end

	self.character_cc_configs = {
		american = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_hoxton_cc"),
		german = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_wolf_cc"),
		russian = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_dallas_cc"),
		spanish = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_chains_cc"),
		jowi = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_john_wick_cc"),
		old_hoxton = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_old_hoxton_cc"),
		female_1 = Idstring("units/payday2/characters/npc_criminal_female_1/mtr_fem1_cc"),
		dragan = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_dragan_cc"),
		jacket = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_jacket_cc"),
		bonnie = Idstring("units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/mtr_bonnie_cc"),
		sokol = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_sokol_cc"),
		dragon = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_jiro_cc"),
		bodhi = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_bodhi_cc"),
		jimmy = Idstring("units/payday2/characters/npc_criminals_suit_1/mtr_jimmy_cc"),
		sydney = Idstring("units/pd2_dlc_opera/characters/npc_criminals_fem_3/mtr_criminal_sydney_cc"),
		wild = Idstring("units/pd2_dlc_wild/characters/npc_criminals_wild_1/mtr_criminal_wild_1_cc"),
		chico = Idstring("units/pd2_dlc_chico/characters/npc_criminals_terry/mtr_criminal_terry_cc"),
		max = Idstring("units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_cc"),
		joy = Idstring("units/pd2_dlc_joy/characters/npc_criminals_joy_1/mtr_criminal_joy_1_cc"),
		myh = Idstring("units/pd2_dlc_myh/characters/npc_criminals_myh/mtr_criminal_myh_cc"),
		ecp_female = Idstring("units/pd2_dlc_ecp/characters/npc_criminals_ecp_female/mtr_criminal_ecp_female_cc"),
		ecp_male = Idstring("units/pd2_dlc_ecp/characters/npc_criminals_ecp_male/mtr_criminal_ecp_male_cc")
	}
	self.armor_skins = {}
	self.armor_skins.none = {}
	self.armor_skins.none.name_id = "bm_askn_none"
	self.armor_skins.none.desc_id = "bm_askn_none_desc"
	self.armor_skins.none.reserve_quality = true
	self.armor_skins.none.sorted = false
	self.armor_skins.none.free = true
	self.armor_skins.none.unlocked = true
	self.armor_skins.none.ignore_cc = true
	self.armor_skins.none.default = true
	self.armor_skins.none.texture_bundle_folder = "cash/safes/cvc"

	self:_init_armor_skins_crime_spree()
	self:_init_armor_skins_armor_safe()
end

function EconomyTweakData:_init_armor_skins_crime_spree()
	self.armor_skins.cvc_green = {}
	self.armor_skins.cvc_green.name_id = "bm_askn_cvc_green"
	self.armor_skins.cvc_green.desc_id = "bm_askn_cvc_green_desc"
	self.armor_skins.cvc_green.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.cvc_green.rarity = "uncommon"
	self.armor_skins.cvc_green.reserve_quality = false
	self.armor_skins.cvc_green.steam_economy = false
	self.armor_skins.cvc_green.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_green.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_004_df")
	}
	self.armor_skins.cvc_green.sticker = {
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_001_df")
	}
	self.armor_skins.cvc_green.uv_scale = {
		[3] = Vector3(12.086, 12.086, 1)
	}
	self.armor_skins.cvc_green.uv_offset_rot = {
		[3] = Vector3(-0.320689, 1.38638, 0)
	}
	self.armor_skins.cvc_green.sticker = {
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_001_df")
	}
	self.armor_skins.cvc_green.pattern_tweak = {
		[3] = Vector3(2.82853, 0, 1)
	}
	self.armor_skins.cvc_green.uv_scale = {
		[3] = Vector3(9.32087, 11.1325, 1)
	}
	self.armor_skins.cvc_green.uv_offset_rot = {
		[3] = Vector3(-0.320768, 1.37938, 0)
	}
	self.armor_skins.cvc_green.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.cvc_black = {}
	self.armor_skins.cvc_black.name_id = "bm_askn_black"
	self.armor_skins.cvc_black.desc_id = "bm_askn_black_desc"
	self.armor_skins.cvc_black.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.cvc_black.rarity = "uncommon"
	self.armor_skins.cvc_black.reserve_quality = false
	self.armor_skins.cvc_black.steam_economy = false
	self.armor_skins.cvc_black.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_black.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_001_df")
	}
	self.armor_skins.cvc_black.sticker = {
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_001_df")
	}
	self.armor_skins.cvc_black.pattern_tweak = {
		[3] = Vector3(2.82853, 0, 1)
	}
	self.armor_skins.cvc_black.uv_scale = {
		[3] = Vector3(9.32087, 11.1325, 1)
	}
	self.armor_skins.cvc_black.uv_offset_rot = {
		[3] = Vector3(-0.320768, 1.37938, 0)
	}
	self.armor_skins.cvc_black.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.cvc_tan = {}
	self.armor_skins.cvc_tan.name_id = "bm_askn_cvc_tan"
	self.armor_skins.cvc_tan.desc_id = "bm_askn_cvc_tan_desc"
	self.armor_skins.cvc_tan.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.cvc_tan.rarity = "uncommon"
	self.armor_skins.cvc_tan.reserve_quality = false
	self.armor_skins.cvc_tan.steam_economy = false
	self.armor_skins.cvc_tan.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_tan.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_007_df")
	}
	self.armor_skins.cvc_tan.sticker = {
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_001_df")
	}
	self.armor_skins.cvc_tan.pattern_tweak = {
		[3] = Vector3(2.82853, 0, 1)
	}
	self.armor_skins.cvc_tan.uv_scale = {
		[3] = Vector3(9.32087, 11.1325, 1)
	}
	self.armor_skins.cvc_tan.uv_offset_rot = {
		[3] = Vector3(-0.320768, 1.37938, 0)
	}
	self.armor_skins.cvc_tan.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.cvc_grey = {}
	self.armor_skins.cvc_grey.name_id = "bm_askn_cvc_grey"
	self.armor_skins.cvc_grey.desc_id = "bm_askn_cvc_grey_desc"
	self.armor_skins.cvc_grey.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.cvc_grey.rarity = "uncommon"
	self.armor_skins.cvc_grey.reserve_quality = false
	self.armor_skins.cvc_grey.steam_economy = false
	self.armor_skins.cvc_grey.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_grey.base_gradient = {
		[2] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_002_c_df"),
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_002_df")
	}
	self.armor_skins.cvc_grey.sticker = {
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_001_df")
	}
	self.armor_skins.cvc_grey.pattern_tweak = {
		[3] = Vector3(2.82853, 0, 1)
	}
	self.armor_skins.cvc_grey.uv_scale = {
		[3] = Vector3(9.32087, 11.1325, 1)
	}
	self.armor_skins.cvc_grey.uv_offset_rot = {
		[3] = Vector3(-0.320768, 1.37938, 0)
	}
	self.armor_skins.cvc_grey.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.cvc_navy_blue = {}
	self.armor_skins.cvc_navy_blue.name_id = "bm_askn_navy_blue"
	self.armor_skins.cvc_navy_blue.desc_id = "bm_askn_navy_blue_desc"
	self.armor_skins.cvc_navy_blue.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.cvc_navy_blue.rarity = "uncommon"
	self.armor_skins.cvc_navy_blue.reserve_quality = false
	self.armor_skins.cvc_navy_blue.steam_economy = false
	self.armor_skins.cvc_navy_blue.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_navy_blue.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_008_df")
	}
	self.armor_skins.cvc_navy_blue.sticker = {
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_001_df")
	}
	self.armor_skins.cvc_navy_blue.pattern_tweak = {
		[3] = Vector3(2.82853, 0, 1)
	}
	self.armor_skins.cvc_navy_blue.uv_scale = {
		[3] = Vector3(9.32087, 11.1325, 1)
	}
	self.armor_skins.cvc_navy_blue.uv_offset_rot = {
		[3] = Vector3(-0.320768, 1.37938, 0)
	}
	self.armor_skins.cvc_navy_blue.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_tree_stump = {}
	self.armor_skins.drm_tree_stump.name_id = "bm_askn_drm_tree_stump"
	self.armor_skins.drm_tree_stump.desc_id = "bm_askn_drm_tree_stump_desc"
	self.armor_skins.drm_tree_stump.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_tree_stump.rarity = "uncommon"
	self.armor_skins.drm_tree_stump.reserve_quality = false
	self.armor_skins.drm_tree_stump.steam_economy = false
	self.armor_skins.drm_tree_stump.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_tree_stump.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_001_df")
	}
	self.armor_skins.drm_tree_stump.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern_gradient/gradient_grunt_001_df")
	}
	self.armor_skins.drm_tree_stump.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_001_df")
	}
	self.armor_skins.drm_tree_stump.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_tree_stump.pattern_tweak = {
		[3] = Vector3(3.11472, 0, 1)
	}
	self.armor_skins.drm_tree_stump.pattern_pos = {
		[3] = Vector3(0, 0.37825, 0)
	}
	self.armor_skins.drm_tree_stump.uv_scale = {
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_tree_stump.uv_offset_rot = {
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_tree_stump.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_gray_raider = {}
	self.armor_skins.drm_gray_raider.name_id = "bm_askn_drm_gray_raider"
	self.armor_skins.drm_gray_raider.desc_id = "bm_askn_drm_gray_raider_desc"
	self.armor_skins.drm_gray_raider.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_gray_raider.rarity = "uncommon"
	self.armor_skins.drm_gray_raider.reserve_quality = false
	self.armor_skins.drm_gray_raider.steam_economy = false
	self.armor_skins.drm_gray_raider.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_gray_raider.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_004_df")
	}
	self.armor_skins.drm_gray_raider.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_002_df")
	}
	self.armor_skins.drm_gray_raider.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_003_df")
	}
	self.armor_skins.drm_gray_raider.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_gray_raider.pattern_tweak = {
		[2] = Vector3(1.87455, 0, 1),
		[3] = Vector3(3.49631, 0, 1)
	}
	self.armor_skins.drm_gray_raider.pattern_pos = {
		[2] = Vector3(-0.0796563, 0.111138, 0),
		[3] = Vector3(0.607203, 0.988791, 0)
	}
	self.armor_skins.drm_gray_raider.uv_scale = {
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_gray_raider.uv_offset_rot = {
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_gray_raider.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_desert_twilight = {}
	self.armor_skins.drm_desert_twilight.name_id = "bm_askn_drm_desert_twilight"
	self.armor_skins.drm_desert_twilight.desc_id = "bm_askn_drm_desert_twilight_desc"
	self.armor_skins.drm_desert_twilight.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_desert_twilight.rarity = "uncommon"
	self.armor_skins.drm_desert_twilight.reserve_quality = false
	self.armor_skins.drm_desert_twilight.steam_economy = false
	self.armor_skins.drm_desert_twilight.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_desert_twilight.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_002_df")
	}
	self.armor_skins.drm_desert_twilight.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/bah/pattern_gradient/gradient_bah_002_df")
	}
	self.armor_skins.drm_desert_twilight.pattern = {
		[3] = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_pixel_camo_df")
	}
	self.armor_skins.drm_desert_twilight.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_desert_twilight.pattern_tweak = {
		[3] = Vector3(4.25948, 0, 1)
	}
	self.armor_skins.drm_desert_twilight.pattern_pos = {
		[3] = Vector3(0.607203, 0.988791, 0)
	}
	self.armor_skins.drm_desert_twilight.uv_scale = {
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_desert_twilight.uv_offset_rot = {
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_desert_twilight.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_navy_breeze = {}
	self.armor_skins.drm_navy_breeze.name_id = "bm_askn_drm_navy_breeze"
	self.armor_skins.drm_navy_breeze.desc_id = "bm_askn_drm_navy_breeze_desc"
	self.armor_skins.drm_navy_breeze.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_navy_breeze.rarity = "uncommon"
	self.armor_skins.drm_navy_breeze.reserve_quality = false
	self.armor_skins.drm_navy_breeze.steam_economy = false
	self.armor_skins.drm_navy_breeze.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_navy_breeze.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_004_df")
	}
	self.armor_skins.drm_navy_breeze.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_crime_df")
	}
	self.armor_skins.drm_navy_breeze.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_007_df")
	}
	self.armor_skins.drm_navy_breeze.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_navy_breeze.pattern_tweak = {
		[2] = Vector3(1.87455, 0, 1),
		[3] = Vector3(3.16242, 0, 1)
	}
	self.armor_skins.drm_navy_breeze.pattern_pos = {
		[2] = Vector3(-0.0796563, 0.111138, 0),
		[3] = Vector3(0.607203, 0.988791, 0)
	}
	self.armor_skins.drm_navy_breeze.uv_scale = {
		[2] = Vector3(15.5653, 15.5663, 1),
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_navy_breeze.uv_offset_rot = {
		[2] = Vector3(0.222614, 0.924553, 0.049451),
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_navy_breeze.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_woodland_tech = {}
	self.armor_skins.drm_woodland_tech.name_id = "bm_askn_drm_woodland_tech"
	self.armor_skins.drm_woodland_tech.desc_id = "bm_askn_drm_woodland_tech_desc"
	self.armor_skins.drm_woodland_tech.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_woodland_tech.rarity = "uncommon"
	self.armor_skins.drm_woodland_tech.reserve_quality = false
	self.armor_skins.drm_woodland_tech.steam_economy = false
	self.armor_skins.drm_woodland_tech.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_woodland_tech.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_003_df")
	}
	self.armor_skins.drm_woodland_tech.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/pattern_gradient/gradient_drm_002_df")
	}
	self.armor_skins.drm_woodland_tech.pattern = {
		[3] = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_pixel_camo_df")
	}
	self.armor_skins.drm_woodland_tech.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_woodland_tech.pattern_tweak = {
		[2] = Vector3(1.87455, 0, 1),
		[3] = Vector3(3.49631, 0, 1)
	}
	self.armor_skins.drm_woodland_tech.pattern_pos = {
		[2] = Vector3(-0.0796563, 0.111138, 0),
		[3] = Vector3(0.607203, 0.988791, 0)
	}
	self.armor_skins.drm_woodland_tech.uv_scale = {
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_woodland_tech.uv_offset_rot = {
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_woodland_tech.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_khaki_eclipse = {}
	self.armor_skins.drm_khaki_eclipse.name_id = "bm_askn_drm_khaki_eclipse"
	self.armor_skins.drm_khaki_eclipse.desc_id = "bm_askn_drm_khaki_eclipse_desc"
	self.armor_skins.drm_khaki_eclipse.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_khaki_eclipse.rarity = "uncommon"
	self.armor_skins.drm_khaki_eclipse.reserve_quality = false
	self.armor_skins.drm_khaki_eclipse.steam_economy = false
	self.armor_skins.drm_khaki_eclipse.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_khaki_eclipse.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_006_df")
	}
	self.armor_skins.drm_khaki_eclipse.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern_gradient/gradient_grunt_001_df")
	}
	self.armor_skins.drm_khaki_eclipse.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_001_df")
	}
	self.armor_skins.drm_khaki_eclipse.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_khaki_eclipse.pattern_tweak = {
		[3] = Vector3(3.11472, 0, 1)
	}
	self.armor_skins.drm_khaki_eclipse.pattern_pos = {
		[3] = Vector3(0, 0.37825, 0)
	}
	self.armor_skins.drm_khaki_eclipse.uv_scale = {
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_khaki_eclipse.uv_offset_rot = {
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_khaki_eclipse.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_desert_tech = {}
	self.armor_skins.drm_desert_tech.name_id = "bm_askn_drm_desert_tech"
	self.armor_skins.drm_desert_tech.desc_id = "bm_askn_drm_desert_tech_desc"
	self.armor_skins.drm_desert_tech.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_desert_tech.rarity = "uncommon"
	self.armor_skins.drm_desert_tech.reserve_quality = false
	self.armor_skins.drm_desert_tech.steam_economy = false
	self.armor_skins.drm_desert_tech.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_desert_tech.base_gradient = {
		[2] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_004_df"),
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_007_df")
	}
	self.armor_skins.drm_desert_tech.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/pattern_gradient/gradient_drm_001_df")
	}
	self.armor_skins.drm_desert_tech.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_006_df")
	}
	self.armor_skins.drm_desert_tech.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_desert_tech.pattern_tweak = {
		[2] = Vector3(1.87455, 0, 1),
		[3] = Vector3(3.49631, 0, 1)
	}
	self.armor_skins.drm_desert_tech.pattern_pos = {
		[2] = Vector3(-0.0796563, 0.111138, 0),
		[3] = Vector3(0.607203, 0.988791, 0)
	}
	self.armor_skins.drm_desert_tech.uv_scale = {
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_desert_tech.uv_offset_rot = {
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_desert_tech.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_misted_grey = {}
	self.armor_skins.drm_misted_grey.name_id = "bm_askn_drm_misted_grey"
	self.armor_skins.drm_misted_grey.desc_id = "bm_askn_drm_misted_grey_desc"
	self.armor_skins.drm_misted_grey.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_misted_grey.rarity = "uncommon"
	self.armor_skins.drm_misted_grey.reserve_quality = false
	self.armor_skins.drm_misted_grey.steam_economy = false
	self.armor_skins.drm_misted_grey.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_misted_grey.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_008_df")
	}
	self.armor_skins.drm_misted_grey.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/pattern_gradient/gradient_drm_002_df")
	}
	self.armor_skins.drm_misted_grey.pattern = {
		[3] = Idstring("units/payday2_cash/safes/sputnik/pattern/pattern_pixel_camo_df")
	}
	self.armor_skins.drm_misted_grey.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_misted_grey.pattern_tweak = {
		[3] = Vector3(3.49631, 0, 1)
	}
	self.armor_skins.drm_misted_grey.pattern_pos = {
		[3] = Vector3(0.607203, 0.988791, 0)
	}
	self.armor_skins.drm_misted_grey.uv_scale = {
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_misted_grey.uv_offset_rot = {
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_misted_grey.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_khaki_regular = {}
	self.armor_skins.drm_khaki_regular.name_id = "bm_askn_drm_khaki_regular"
	self.armor_skins.drm_khaki_regular.desc_id = "bm_askn_drm_khaki_regular_desc"
	self.armor_skins.drm_khaki_regular.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_khaki_regular.rarity = "uncommon"
	self.armor_skins.drm_khaki_regular.reserve_quality = false
	self.armor_skins.drm_khaki_regular.steam_economy = false
	self.armor_skins.drm_khaki_regular.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_khaki_regular.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_009_df")
	}
	self.armor_skins.drm_khaki_regular.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/cf15/pattern_gradient/gradient_cf15_005_df")
	}
	self.armor_skins.drm_khaki_regular.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_khaki_regular.pattern_tweak = {
		[3] = Vector3(3.49631, 0, 1)
	}
	self.armor_skins.drm_khaki_regular.pattern_pos = {
		[3] = Vector3(0.607203, 0.988791, 0)
	}
	self.armor_skins.drm_khaki_regular.uv_scale = {
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_khaki_regular.uv_offset_rot = {
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_khaki_regular.sorting_idx = sorting_groups.crime_spree
	self.armor_skins.drm_somber_woodland = {}
	self.armor_skins.drm_somber_woodland.name_id = "bm_askn_drm_somber_woodland"
	self.armor_skins.drm_somber_woodland.desc_id = "bm_askn_drm_somber_woodland_desc"
	self.armor_skins.drm_somber_woodland.unlock_id = "bm_askn_find_in_crime_spree"
	self.armor_skins.drm_somber_woodland.rarity = "uncommon"
	self.armor_skins.drm_somber_woodland.reserve_quality = false
	self.armor_skins.drm_somber_woodland.steam_economy = false
	self.armor_skins.drm_somber_woodland.texture_bundle_folder = "cash/safes/drm"
	self.armor_skins.drm_somber_woodland.base_gradient = {
		[2] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_004_df"),
		[3] = Idstring("units/payday2_cash/safes/drm/base_gradient/base_drm_010_df")
	}
	self.armor_skins.drm_somber_woodland.pattern_gradient = {
		[2] = Idstring("units/payday2_cash/safes/grunt/pattern_gradient/gradient_grunt_010_df"),
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern_gradient/gradient_grunt_010_df")
	}
	self.armor_skins.drm_somber_woodland.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_007_df")
	}
	self.armor_skins.drm_somber_woodland.sticker = {
		[3] = Idstring("units/payday2_cash/safes/drm/sticker/drm_sticker_001_df")
	}
	self.armor_skins.drm_somber_woodland.pattern_tweak = {
		[2] = Vector3(1.87455, 0, 1),
		[3] = Vector3(3.49631, 0, 1)
	}
	self.armor_skins.drm_somber_woodland.pattern_pos = {
		[2] = Vector3(-0.0796563, 0.111138, 0),
		[3] = Vector3(0.721679, 0.988791, 0)
	}
	self.armor_skins.drm_somber_woodland.uv_scale = {
		[3] = Vector3(15.5653, 15.5663, 1)
	}
	self.armor_skins.drm_somber_woodland.uv_offset_rot = {
		[3] = Vector3(0.222614, 0.924553, 0.049451)
	}
	self.armor_skins.drm_somber_woodland.sorting_idx = sorting_groups.crime_spree
end

function EconomyTweakData:_init_armor_skins_armor_safe()
	self.armor_skins.ast_armor1 = {}
	self.armor_skins.ast_armor1.name_id = "bm_askn_ast_armor3"
	self.armor_skins.ast_armor1.desc_id = "bm_askn_ast_armor3_desc"
	self.armor_skins.ast_armor1.rarity = "uncommon"
	self.armor_skins.ast_armor1.reserve_quality = false
	self.armor_skins.ast_armor1.texture_bundle_folder = "cash/safes/ast"
	self.armor_skins.ast_armor1.base_gradient = {
		[7] = "units/payday2_cash/safes/ast/base_gradient/base_ast_001_df"
	}
	self.armor_skins.ast_armor1.pattern_gradient = {
		[7] = "units/payday2_cash/safes/ast/pattern_gradient/gradient_ast_004_df"
	}
	self.armor_skins.ast_armor1.pattern = {
		[7] = "units/payday2_cash/safes/ast/pattern/ast_pattern_005_df"
	}
	self.armor_skins.ast_armor1.sticker = {
		[7] = "units/payday2_cash/safes/ast/sticker/ast_sticker_005_df"
	}
	self.armor_skins.ast_armor1.pattern_tweak = {
		[7] = Vector3(1.39757, 0, 1)
	}
	self.armor_skins.ast_armor1.pattern_pos = {
		[7] = Vector3(-0.404006, -1.06225, 0)
	}
	self.armor_skins.ast_armor1.uv_scale = {
		[7] = Vector3(20, 20, 0)
	}
	self.armor_skins.ast_armor1.uv_offset_rot = {
		[7] = Vector3(0.216075, 0.931553, 0)
	}
	self.armor_skins.ast_armor1.steam_economy = true
	self.armor_skins.ast_armor2 = {}
	self.armor_skins.ast_armor2.name_id = "bm_askn_ast_armor1"
	self.armor_skins.ast_armor2.desc_id = "bm_askn_ast_armor1_desc"
	self.armor_skins.ast_armor2.rarity = "uncommon"
	self.armor_skins.ast_armor2.reserve_quality = false
	self.armor_skins.ast_armor2.texture_bundle_folder = "cash/safes/ast"
	self.armor_skins.ast_armor2.base_gradient = {
		[7] = "units/payday2_cash/safes/ast/base_gradient/base_ast_002_df"
	}
	self.armor_skins.ast_armor2.pattern_gradient = {
		[7] = "units/payday2_cash/safes/ast/pattern_gradient/gradient_ast_002_df"
	}
	self.armor_skins.ast_armor2.pattern = {
		[7] = "units/payday2_cash/safes/ast/pattern/ast_pattern_002_df"
	}
	self.armor_skins.ast_armor2.sticker = {
		[7] = "units/payday2_cash/safes/ast/sticker/ast_sticker_004_df"
	}
	self.armor_skins.ast_armor2.pattern_tweak = {
		[7] = Vector3(3.83019, 0, 1)
	}
	self.armor_skins.ast_armor2.pattern_pos = {
		[7] = Vector3(0, 0, 0)
	}
	self.armor_skins.ast_armor2.uv_scale = {
		[7] = Vector3(1.01, 1.01, 0)
	}
	self.armor_skins.ast_armor2.uv_offset_rot = {
		[7] = Vector3(0, 0.998331, 0),
		[2] = Vector3(-2, -2, 0)
	}
	self.armor_skins.ast_armor2.steam_economy = true
	self.armor_skins.ast_armor3 = {}
	self.armor_skins.ast_armor3.name_id = "bm_askn_ast_armor2"
	self.armor_skins.ast_armor3.desc_id = "bm_askn_ast_armor2_desc"
	self.armor_skins.ast_armor3.rarity = "uncommon"
	self.armor_skins.ast_armor3.reserve_quality = false
	self.armor_skins.ast_armor3.texture_bundle_folder = "cash/safes/ast"
	self.armor_skins.ast_armor3.base_gradient = {
		[7] = "units/payday2_cash/safes/ast/base_gradient/base_ast_003_df"
	}
	self.armor_skins.ast_armor3.pattern_gradient = {
		[7] = "units/payday2_cash/safes/ast/pattern_gradient/gradient_ast_003_df"
	}
	self.armor_skins.ast_armor3.pattern = {
		[7] = "units/payday2_cash/safes/ast/pattern/ast_pattern_004_df"
	}
	self.armor_skins.ast_armor3.sticker = {
		[7] = "units/payday2_cash/safes/ast/sticker/ast_sticker_002_df"
	}
	self.armor_skins.ast_armor3.pattern_tweak = {
		[7] = Vector3(2.87622, 0, 1)
	}
	self.armor_skins.ast_armor3.pattern_pos = {
		[7] = Vector3(-0.0224181, -0.461245, 0)
	}
	self.armor_skins.ast_armor3.uv_scale = {
		[7] = Vector3(11.4173, 11.4173, 0)
	}
	self.armor_skins.ast_armor3.uv_offset_rot = {
		[7] = Vector3(-0.324689, 1.38854, 0)
	}
	self.armor_skins.ast_armor3.steam_economy = true
	self.armor_skins.ast_armor4 = {}
	self.armor_skins.ast_armor4.name_id = "bm_askn_ast_armor4"
	self.armor_skins.ast_armor4.desc_id = "bm_askn_ast_armor4_desc"
	self.armor_skins.ast_armor4.rarity = "rare"
	self.armor_skins.ast_armor4.reserve_quality = false
	self.armor_skins.ast_armor4.texture_bundle_folder = "cash/safes/ast"
	self.armor_skins.ast_armor4.base_gradient = {
		[7] = "units/payday2_cash/safes/ast/base_gradient/base_ast_004_df"
	}
	self.armor_skins.ast_armor4.pattern_gradient = {
		[7] = "units/payday2_cash/safes/red/pattern_gradient/gradient_france_df"
	}
	self.armor_skins.ast_armor4.pattern = {
		[7] = "units/payday2_cash/safes/default/pattern/pattern_default_df"
	}
	self.armor_skins.ast_armor4.sticker = {
		[2] = "units/payday2_cash/safes/wwt/sticker/wwt_sticker_001_df",
		[7] = "units/payday2_cash/safes/ast/sticker/ast_sticker_001_df"
	}
	self.armor_skins.ast_armor4.pattern_tweak = {
		[7] = Vector3(1, 0, 1)
	}
	self.armor_skins.ast_armor4.pattern_pos = {
		[7] = Vector3(0, 0, 0)
	}
	self.armor_skins.ast_armor4.uv_scale = {
		[2] = Vector3(1.20187, 2.10769, 1),
		[7] = Vector3(1.00349, 1.00349, 0)
	}
	self.armor_skins.ast_armor4.uv_offset_rot = {
		[2] = Vector3(0.001, 1.12589, 6.28319),
		[7] = Vector3(0.001, 1.00163, 6.28319)
	}
	self.armor_skins.ast_armor4.cubemap_pattern_control = {
		[7] = Vector3(0, 0, 0)
	}
	self.armor_skins.ast_armor4.steam_economy = true
	self.armor_skins.ast_armor5 = {}
	self.armor_skins.ast_armor5.name_id = "bm_askn_ast_armor5"
	self.armor_skins.ast_armor5.desc_id = "bm_askn_ast_armor5_desc"
	self.armor_skins.ast_armor5.rarity = "rare"
	self.armor_skins.ast_armor5.reserve_quality = false
	self.armor_skins.ast_armor5.texture_bundle_folder = "cash/safes/ast"
	self.armor_skins.ast_armor5.base_gradient = {
		[7] = "units/payday2_cash/safes/ast/base_gradient/base_ast_005_df"
	}
	self.armor_skins.ast_armor5.pattern_gradient = {
		[7] = "units/payday2_cash/safes/red/pattern_gradient/gradient_france_df"
	}
	self.armor_skins.ast_armor5.sticker = {
		[7] = "units/payday2_cash/safes/ast/sticker/ast_sticker_003_df"
	}
	self.armor_skins.ast_armor5.pattern_pos = {
		[6] = Vector3(0, 0, 0)
	}
	self.armor_skins.ast_armor5.uv_scale = {
		[2] = Vector3(0.629771, 1.00417, 0.367994),
		[7] = Vector3(1.0325, 1.0325, 0.367994)
	}
	self.armor_skins.ast_armor5.uv_offset_rot = {
		[2] = Vector3(-0.445466, 1.06887, 0),
		[7] = Vector3(0, 1.01187, 0),
		[6] = Vector3(0.009, 1.01087, 0)
	}
	self.armor_skins.ast_armor5.steam_economy = true
	self.armor_skins.ast_armor6 = {}
	self.armor_skins.ast_armor6.name_id = "bm_askn_ast_armor6"
	self.armor_skins.ast_armor6.desc_id = "bm_askn_ast_armor6_desc"
	self.armor_skins.ast_armor6.rarity = "epic"
	self.armor_skins.ast_armor6.reserve_quality = false
	self.armor_skins.ast_armor6.texture_bundle_folder = "cash/safes/ast"
	self.armor_skins.ast_armor6.base_gradient = {
		[7] = "units/payday2_cash/safes/ast/base_gradient/base_ast_006_df"
	}
	self.armor_skins.ast_armor6.pattern_gradient = {
		[7] = "units/payday2_cash/safes/red/pattern_gradient/gradient_france_df"
	}
	self.armor_skins.ast_armor6.pattern = {
		[7] = "units/payday2_cash/safes/default/pattern/pattern_default_df"
	}
	self.armor_skins.ast_armor6.sticker = {
		[7] = "units/payday2_cash/safes/ast/sticker/ast_sticker_006_df"
	}
	self.armor_skins.ast_armor6.uv_scale = {
		[7] = Vector3(1.01117, 1.01117, 0),
		[2] = Vector3(0.486747, 0.868144, 0)
	}
	self.armor_skins.ast_armor6.uv_offset_rot = {
		[2] = Vector3(0.590884, 1.10919, 3.16632),
		[7] = Vector3(0.00266134, 1.01049, 0)
	}
	self.armor_skins.ast_armor6.steam_economy = true
	self.armor_skins.cas_m90 = {}
	self.armor_skins.cas_m90.name_id = "bm_askn_cas_m90"
	self.armor_skins.cas_m90.desc_id = "bm_askn_cas_m90_desc"
	self.armor_skins.cas_m90.rarity = "rare"
	self.armor_skins.cas_m90.reserve_quality = false
	self.armor_skins.cas_m90.texture_bundle_folder = "cash/safes/cas"
	self.armor_skins.cas_m90.base_gradient = "units/payday2_cash/safes/cas/base_gradient/base_cas_001_df"
	self.armor_skins.cas_m90.pattern_gradient = "units/payday2_cash/safes/cas/pattern_gradient/gradient_cas_001_df"
	self.armor_skins.cas_m90.pattern = "units/payday2_cash/safes/cas/pattern/cas_pattern_001_df"
	self.armor_skins.cas_m90.sticker = "units/payday2_cash/safes/cas/sticker/cas_sticker_001_df"
	self.armor_skins.cas_m90.pattern_tweak = {
		[2] = Vector3(2.73313, 3.07641, 1),
		[7] = Vector3(2.82853, 0, 1),
		[6] = Vector3(3.16242, 0, 1)
	}
	self.armor_skins.cas_m90.pattern_pos = {
		[2] = Vector3(0.311472, 0, 0),
		[7] = Vector3(-0.299069, 0, 0),
		[6] = Vector3(-0.241831, 0, 0)
	}
	self.armor_skins.cas_m90.uv_scale = {
		[2] = Vector3(5.01584, 11.2136, 1),
		[3] = Vector3(13.645, 13.645, 1),
		[4] = Vector3(14.8368, 14.8368, 1),
		[6] = Vector3(7.44725, 7.44725, 1),
		[7] = Vector3(7.87632, 7.87632, 1)
	}
	self.armor_skins.cas_m90.uv_offset_rot = {
		[2] = Vector3(0.149297, 1.22728, 3.07641),
		[3] = Vector3(0.225614, 0.902934, 0),
		[4] = Vector3(0.225614, 0.902934, 0),
		[6] = Vector3(-0.318149, 1.38946, 0),
		[7] = Vector3(-0.318149, 1.38946, 0)
	}
	self.armor_skins.cas_m90.cubemap_pattern_control = {
		[6] = Vector3(0, 0, 0)
	}
	self.armor_skins.cas_m90.steam_economy = true
	self.armor_skins.cas_police = {}
	self.armor_skins.cas_police.name_id = "bm_askn_cas_police"
	self.armor_skins.cas_police.desc_id = "bm_askn_cas_police_desc"
	self.armor_skins.cas_police.rarity = "rare"
	self.armor_skins.cas_police.reserve_quality = false
	self.armor_skins.cas_police.texture_bundle_folder = "cash/safes/cas"
	self.armor_skins.cas_police.base_gradient = "units/payday2_cash/safes/cas/base_gradient/base_cas_002_df"
	self.armor_skins.cas_police.pattern_gradient = "units/payday2_cash/safes/cas/pattern_gradient/gradient_cas_002_df"
	self.armor_skins.cas_police.pattern = "units/payday2_cash/safes/cas/pattern/cas_pattern_002_df"
	self.armor_skins.cas_police.sticker = "units/payday2_cash/safes/cas/sticker/cas_sticker_002_df"
	self.armor_skins.cas_police.pattern_tweak = {
		[2] = Vector3(1, 0, 1),
		[7] = Vector3(1, 0, 1),
		[6] = Vector3(1, 0, 1)
	}
	self.armor_skins.cas_police.pattern_pos = {
		[2] = Vector3(0, 0, 0),
		[7] = Vector3(0, 0, 0)
	}
	self.armor_skins.cas_police.uv_scale = {
		[2] = Vector3(0.772794, 0.772794, 1),
		[7] = Vector3(1.01, 1.01, 1)
	}
	self.armor_skins.cas_police.uv_offset_rot = {
		[2] = Vector3(0.301932, 0.778918, 3.13635),
		[7] = Vector3(0, 0, 0)
	}
	self.armor_skins.cas_police.steam_economy = true
	self.armor_skins.cas_miami = {}
	self.armor_skins.cas_miami.name_id = "bm_askn_cas_miami"
	self.armor_skins.cas_miami.desc_id = "bm_askn_cas_miami_desc"
	self.armor_skins.cas_miami.rarity = "uncommon"
	self.armor_skins.cas_miami.reserve_quality = false
	self.armor_skins.cas_miami.texture_bundle_folder = "cash/safes/cas"
	self.armor_skins.cas_miami.base_gradient = "units/payday2_cash/safes/cas/base_gradient/base_cas_003_df"
	self.armor_skins.cas_miami.pattern_gradient = "units/payday2_cash/safes/cas/pattern_gradient/gradient_cas_003_df"
	self.armor_skins.cas_miami.pattern = "units/payday2_cash/safes/cas/pattern/cas_pattern_003_df"
	self.armor_skins.cas_miami.sticker = "units/payday2_cash/safes/cas/sticker/cas_sticker_003_df"
	self.armor_skins.cas_miami.pattern_tweak = {
		[7] = Vector3(2.35154, 0, 1)
	}
	self.armor_skins.cas_miami.pattern_pos = {
		[7] = Vector3(-0.814214, 0.235154, 0)
	}
	self.armor_skins.cas_miami.uv_scale = {
		[7] = Vector3(5.87399, 5.87399, 1)
	}
	self.armor_skins.cas_miami.uv_offset_rot = {
		[7] = Vector3(0.285, 1.2559, 3.16632)
	}
	self.armor_skins.cas_miami.steam_economy = true
	self.armor_skins.cas_slayer = {}
	self.armor_skins.cas_slayer.name_id = "bm_askn_cas_slayer"
	self.armor_skins.cas_slayer.desc_id = "bm_askn_cas_slayer_desc"
	self.armor_skins.cas_slayer.rarity = "epic"
	self.armor_skins.cas_slayer.reserve_quality = false
	self.armor_skins.cas_slayer.texture_bundle_folder = "cash/safes/cas"
	self.armor_skins.cas_slayer.base_gradient = "units/payday2_cash/safes/cas/base_gradient/base_cas_004_df"
	self.armor_skins.cas_slayer.pattern_gradient = "units/payday2_cash/safes/cas/pattern_gradient/gradient_cas_004_df"
	self.armor_skins.cas_slayer.pattern = "units/payday2_cash/safes/cas/pattern/cas_pattern_004_df"
	self.armor_skins.cas_slayer.sticker = "units/payday2_cash/safes/cas/sticker/cas_sticker_004_df"
	self.armor_skins.cas_slayer.pattern_tweak = {
		[2] = Vector3(1.68376, 0, 0),
		[6] = Vector3(3.5917, 0, 0)
	}
	self.armor_skins.cas_slayer.uv_scale = {
		[7] = Vector3(1.01117, 1.01117, 1)
	}
	self.armor_skins.cas_slayer.uv_offset_rot = {
		[7] = Vector3(0, 0.998331, 0)
	}
	self.armor_skins.cas_slayer.steam_economy = true
	self.armor_skins.cas_trash = {}
	self.armor_skins.cas_trash.name_id = "bm_askn_cas_trash"
	self.armor_skins.cas_trash.desc_id = "bm_askn_cas_trash_desc"
	self.armor_skins.cas_trash.rarity = "uncommon"
	self.armor_skins.cas_trash.reserve_quality = false
	self.armor_skins.cas_trash.texture_bundle_folder = "cash/safes/cas"
	self.armor_skins.cas_trash.base_gradient = "units/payday2_cash/safes/cas/base_gradient/base_cas_005_df"
	self.armor_skins.cas_trash.pattern_gradient = "units/payday2_cash/safes/cas/pattern_gradient/gradient_cas_005_df"
	self.armor_skins.cas_trash.pattern = "units/payday2_cash/safes/cas/pattern/cas_pattern_005_df"
	self.armor_skins.cas_trash.sticker = "units/payday2_cash/safes/cas/sticker/cas_sticker_005_df"
	self.armor_skins.cas_trash.pattern_tweak = {
		[6] = Vector3(1, 0, 1)
	}
	self.armor_skins.cas_trash.pattern_pos = {
		[6] = Vector3(0, 0, 0)
	}
	self.armor_skins.cas_trash.uv_scale = {
		[2] = Vector3(0.772794, 0.772794, 1),
		[6] = Vector3(1.01, 1.01, 1)
	}
	self.armor_skins.cas_trash.uv_offset_rot = {
		[2] = Vector3(0.282853, 0.788457, 3.13635),
		[6] = Vector3(0, 0, 3.13635)
	}
	self.armor_skins.cas_trash.steam_economy = true
	self.armor_skins.cas_gensec = {}
	self.armor_skins.cas_gensec.name_id = "bm_askn_cas_gensec"
	self.armor_skins.cas_gensec.desc_id = "bm_askn_cas_gensec_desc"
	self.armor_skins.cas_gensec.rarity = "uncommon"
	self.armor_skins.cas_gensec.reserve_quality = false
	self.armor_skins.cas_gensec.texture_bundle_folder = "cash/safes/cas"
	self.armor_skins.cas_gensec.base_gradient = "units/payday2_cash/safes/cas/base_gradient/base_cas_006_df"
	self.armor_skins.cas_gensec.sticker = "units/payday2_cash/safes/cas/sticker/cas_sticker_006_df"
	self.armor_skins.cas_gensec.uv_scale = {
		[2] = Vector3(0.582095, 1.01, 1),
		[7] = Vector3(1.01, 1.01, 1)
	}
	self.armor_skins.cas_gensec.uv_offset_rot = {
		[2] = Vector3(0.502266, 1.12235, 3.12136),
		[7] = Vector3(0, 1, 0)
	}
	self.armor_skins.cas_gensec.steam_economy = true
	self.armor_skins.tam = {}
	self.armor_skins.tam.name_id = "bm_askn_tam"
	self.armor_skins.tam.unlock_id = "bm_askn_tam_unlock"
	self.armor_skins.tam.rarity = "epic"
	self.armor_skins.tam.reserve_quality = false
	self.armor_skins.tam.texture_bundle_folder = "tam/textures/pd2/blackmarket/icons"
	self.armor_skins.tam.base_gradient = "units/pd2_dlc_tam/base_gradient/tam_basegradient_001_armor_df"
	self.armor_skins.tam.sticker = "units/pd2_dlc_tam/sticker/tam_sticker_003_armor_df"
	self.armor_skins.tam.pattern_tweak = Vector3(7.88457, 0, 1)
	self.armor_skins.tam.uv_scale = {
		[2] = Vector3(1.01, 1.01, 0),
		[7] = Vector3(1.01, 1.01, 0)
	}
	self.armor_skins.tam.uv_offset_rot = {
		[2] = Vector3(0.588123, 1.11581, 3.15133),
		[7] = Vector3(0, 1.00003, 0),
		[6] = Vector3(0.0017407, 0.999791, 0)
	}
	self.armor_skins.tam.normal_map = {
		[2] = Idstring("units/payday2/characters/shared_textures/vest_small_nm"),
		[3] = Idstring("units/pd2_dlc_tam/normal_map/tam_nm")
	}
	self.armor_skins.tam.steam_economy = false
	self.armor_skins.tam.sorting_idx = sorting_groups.tam
	self.armor_skins.cvc_woodland_camo = {}
	self.armor_skins.cvc_woodland_camo.name_id = "bm_askn_cvc_woodland_camo"
	self.armor_skins.cvc_woodland_camo.desc_id = "bm_askn_cvc_woodland_camo_desc"
	self.armor_skins.cvc_woodland_camo.rarity = "uncommon"
	self.armor_skins.cvc_woodland_camo.reserve_quality = false
	self.armor_skins.cvc_woodland_camo.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_woodland_camo.base_gradient = {
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_012_df")
	}
	self.armor_skins.cvc_woodland_camo.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern_gradient/gradient_grunt_004_df")
	}
	self.armor_skins.cvc_woodland_camo.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_003_df")
	}
	self.armor_skins.cvc_woodland_camo.sticker = {
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_006_df")
	}
	self.armor_skins.cvc_woodland_camo.uv_scale = {
		[3] = Vector3(20, 18.5698, 1)
	}
	self.armor_skins.cvc_woodland_camo.uv_offset_rot = {
		[3] = Vector3(0.216614, 0.925013, 0)
	}
	self.armor_skins.cvc_woodland_camo.pattern_tweak = {
		[3] = Vector3(4.64107, 0, 1)
	}
	self.armor_skins.cvc_woodland_camo.pattern_pos = {
		[3] = Vector3(0.244694, 0.397329, 0)
	}
	self.armor_skins.cvc_woodland_camo.sorting_idx = sorting_groups.camo
	self.armor_skins.cvc_woodland_camo.steam_economy = true
	self.armor_skins.cvc_city_camo = {}
	self.armor_skins.cvc_city_camo.name_id = "bm_askn_cvc_city_camo"
	self.armor_skins.cvc_city_camo.desc_id = "bm_askn_cvc_city_camo_desc"
	self.armor_skins.cvc_city_camo.rarity = "uncommon"
	self.armor_skins.cvc_city_camo.reserve_quality = false
	self.armor_skins.cvc_city_camo.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_city_camo.base_gradient = {
		[2] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_002_b_df"),
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_002_df")
	}
	self.armor_skins.cvc_city_camo.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern_gradient/gradient_grunt_010_df")
	}
	self.armor_skins.cvc_city_camo.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_006_df")
	}
	self.armor_skins.cvc_city_camo.sticker = {
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_006_df")
	}
	self.armor_skins.cvc_city_camo.pattern_tweak = {
		[2] = Vector3(1.77916, 0, 1),
		[3] = Vector3(1.87455, 0, 1)
	}
	self.armor_skins.cvc_city_camo.pattern_pos = {
		[2] = Vector3(0.216075, 0.473647, 0),
		[3] = Vector3(0.216075, 0.445028, 0)
	}
	self.armor_skins.cvc_city_camo.uv_scale = {
		[3] = Vector3(20, 18.5698, 1)
	}
	self.armor_skins.cvc_city_camo.uv_offset_rot = {
		[3] = Vector3(0.216614, 0.925013, 0)
	}
	self.armor_skins.cvc_city_camo.sorting_idx = sorting_groups.camo
	self.armor_skins.cvc_city_camo.steam_economy = true
	self.armor_skins.cvc_desert_camo = {}
	self.armor_skins.cvc_desert_camo.name_id = "bm_askn_desert_camo"
	self.armor_skins.cvc_desert_camo.desc_id = "bm_askn_desert_camo_desc"
	self.armor_skins.cvc_desert_camo.rarity = "uncommon"
	self.armor_skins.cvc_desert_camo.reserve_quality = false
	self.armor_skins.cvc_desert_camo.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_desert_camo.base_gradient = {
		[2] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_009_b_df"),
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_009_df")
	}
	self.armor_skins.cvc_desert_camo.pattern_gradient = {
		[2] = Idstring("units/payday2_cash/safes/grunt/pattern_gradient/gradient_grunt_006_df"),
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern_gradient/gradient_grunt_005_df")
	}
	self.armor_skins.cvc_desert_camo.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_001_df")
	}
	self.armor_skins.cvc_desert_camo.sticker = {
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_006_df")
	}
	self.armor_skins.cvc_desert_camo.uv_scale = {
		[3] = Vector3(20, 18.5698, 1)
	}
	self.armor_skins.cvc_desert_camo.uv_offset_rot = {
		[3] = Vector3(0.216614, 0.925013, 0)
	}
	self.armor_skins.cvc_desert_camo.pattern_tweak = {
		[2] = Vector3(1.92225, 0, 1),
		[3] = Vector3(2.82853, 0, 1)
	}
	self.armor_skins.cvc_desert_camo.uv_scale = {
		[3] = Vector3(20, 18.5698, 1)
	}
	self.armor_skins.cvc_desert_camo.sorting_idx = sorting_groups.camo
	self.armor_skins.cvc_desert_camo.steam_economy = true
	self.armor_skins.cvc_avenger = {}
	self.armor_skins.cvc_avenger.name_id = "bm_askn_cvc_avenger"
	self.armor_skins.cvc_avenger.desc_id = "bm_askn_cvc_avenger_desc"
	self.armor_skins.cvc_avenger.rarity = "rare"
	self.armor_skins.cvc_avenger.reserve_quality = false
	self.armor_skins.cvc_avenger.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_avenger.base_gradient = {
		[2] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_011_df"),
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_013_df")
	}
	self.armor_skins.cvc_avenger.pattern_gradient = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern_gradient/gradient_grunt_003_df")
	}
	self.armor_skins.cvc_avenger.pattern = {
		[3] = Idstring("units/payday2_cash/safes/grunt/pattern/grunt_pattern_001_df")
	}
	self.armor_skins.cvc_avenger.sticker = {
		[2] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_005_b_df"),
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_005_df")
	}
	self.armor_skins.cvc_avenger.pattern_tweak = {
		[3] = Vector3(2.01765, 0, 1)
	}
	self.armor_skins.cvc_avenger.pattern_pos = {
		[3] = Vector3(0.216075, 0.445028, 0)
	}
	self.armor_skins.cvc_avenger.uv_offset_rot = {
		[2] = Vector3(-0.00333866, 1.33222, 3.13635),
		[3] = Vector3(0.00374075, 0.996331, 0)
	}
	self.armor_skins.cvc_avenger.uv_scale = {
		[2] = Vector3(1.3592, 2.26502, 1),
		[3] = Vector3(1, 1, 1)
	}
	self.armor_skins.cvc_avenger.steam_economy = true
	self.armor_skins.cvc_swat = {}
	self.armor_skins.cvc_swat.name_id = "bm_askn_cvc_swat"
	self.armor_skins.cvc_swat.desc_id = "bm_askn_cvc_swat_desc"
	self.armor_skins.cvc_swat.rarity = "rare"
	self.armor_skins.cvc_swat.reserve_quality = false
	self.armor_skins.cvc_swat.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_swat.base_gradient = {
		[2] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_008_df"),
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_006_df")
	}
	self.armor_skins.cvc_swat.sticker = {
		[2] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_002_b_df"),
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_002_df")
	}
	self.armor_skins.cvc_swat.uv_scale = {
		[2] = Vector3(1.97897, 2.83711, 0),
		[3] = Vector3(1, 1, 0)
	}
	self.armor_skins.cvc_swat.uv_offset_rot = {
		[2] = Vector3(0.0168202, 1.28452, 3.13635),
		[3] = Vector3(0, 0.99987, 0)
	}
	self.armor_skins.cvc_swat.steam_economy = true
	self.armor_skins.cvc_bone = {}
	self.armor_skins.cvc_bone.name_id = "bm_askn_cvc_bone"
	self.armor_skins.cvc_bone.desc_id = "bm_askn_cvc_bone_desc"
	self.armor_skins.cvc_bone.rarity = "epic"
	self.armor_skins.cvc_bone.reserve_quality = false
	self.armor_skins.cvc_bone.texture_bundle_folder = "cash/safes/cvc"
	self.armor_skins.cvc_bone.base_gradient = {
		[2] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_011_df"),
		[3] = Idstring("units/payday2_cash/safes/cvc/base_gradient/base_cvc_011_df")
	}
	self.armor_skins.cvc_bone.sticker = {
		[2] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_004_df"),
		[3] = Idstring("units/payday2_cash/safes/cvc/sticker/cvc_sticker_004_df")
	}
	self.armor_skins.cvc_bone.uv_scale = {
		[2] = Vector3(0.69175, 0.834774, 1),
		[3] = Vector3(1, 1, 1)
	}
	self.armor_skins.cvc_bone.uv_offset_rot = {
		[2] = Vector3(0.416408, 1.14143, 3.12136),
		[3] = Vector3(-0.001, 0.994791, 0)
	}
	self.armor_skins.cvc_bone.cubemap_pattern_control = Vector3(0, 0.001, 0)
	self.armor_skins.cvc_bone.steam_economy = true
end
