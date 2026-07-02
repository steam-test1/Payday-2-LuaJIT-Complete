require("lib/tweak_data/GeneratedMarketLinkTweakData")

EconomyTweakData = EconomyTweakData or class()

function EconomyTweakData:init(tweak_data)
	self.safes = {}
	self.drills = {}
	self.gameplay = {}
	self.contents = {}
	self.bundles = {}
	self.rarities = {}
	self.qualities = {}
	self.item_convert = {
		[103602] = {
			bundle_id = 3602,
			item_id = 100497
		},
		[103603] = {
			bundle_id = 3603,
			item_id = 100527
		},
		[103604] = {
			bundle_id = 3604,
			item_id = 100272
		},
		[103605] = {
			bundle_id = 3605,
			item_id = 100304
		},
		[103606] = {
			bundle_id = 3606,
			item_id = 100219
		},
		[103607] = {
			bundle_id = 3607,
			item_id = 100030
		},
		[103608] = {
			bundle_id = 3608,
			item_id = 100400
		},
		[103609] = {
			bundle_id = 3609,
			item_id = 100212
		},
		[103610] = {
			bundle_id = 3610,
			item_id = 100406
		},
		[103611] = {
			bundle_id = 3611,
			item_id = 100453
		}
	}
	self.market_links = init_auto_generated_steam_market_links()
	self.rarities.common = {}
	self.rarities.common.index = 1
	self.rarities.common.fake_chance = 75
	self.rarities.common.open_safe_sequence = "anim_open_01"
	self.rarities.common.color = Color("2360D8")
	self.rarities.common.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_common"
	self.rarities.common.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_common"
	self.rarities.common.name_id = "bm_menu_rarity_common"
	self.rarities.common.armor_sequence = "cvc_var1"
	self.rarities.uncommon = {}
	self.rarities.uncommon.index = 2
	self.rarities.uncommon.fake_chance = 20
	self.rarities.uncommon.open_safe_sequence = "anim_open_02"
	self.rarities.uncommon.color = Color("9900FF")
	self.rarities.uncommon.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_uncommon"
	self.rarities.uncommon.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_uncommon"
	self.rarities.uncommon.name_id = "bm_menu_rarity_uncommon"
	self.rarities.uncommon.armor_sequence = "cvc_var2"
	self.rarities.rare = {}
	self.rarities.rare.index = 3
	self.rarities.rare.fake_chance = 4
	self.rarities.rare.open_safe_sequence = "anim_open_03"
	self.rarities.rare.color = Color("FF00FF")
	self.rarities.rare.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_rare"
	self.rarities.rare.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_rare"
	self.rarities.rare.name_id = "bm_menu_rarity_rare"
	self.rarities.rare.armor_sequence = "cvc_var3"
	self.rarities.epic = {}
	self.rarities.epic.index = 4
	self.rarities.epic.fake_chance = 1
	self.rarities.epic.open_safe_sequence = "anim_open_04"
	self.rarities.epic.color = Color("FF0000")
	self.rarities.epic.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_epic"
	self.rarities.epic.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_epic"
	self.rarities.epic.name_id = "bm_menu_rarity_epic"
	self.rarities.epic.armor_sequence = "cvc_var3"
	self.rarities.legendary = {}
	self.rarities.legendary.index = 5
	self.rarities.legendary.fake_chance = 0
	self.rarities.legendary.open_safe_sequence = "anim_open_05"
	self.rarities.legendary.color = Color("FFAA00")
	self.rarities.legendary.header_col = "guis/dlcs/cash/textures/pd2/safe_raffle/header_col_legendary"
	self.rarities.legendary.bg_texture = "guis/dlcs/cash/textures/pd2/blackmarket/icons/rarity_legendary"
	self.rarities.legendary.name_id = "bm_menu_rarity_legendary"
	self.rarities.legendary.armor_sequence = "cvc_var3"
	self.qualities.poor = {}
	self.qualities.poor.index = 1
	self.qualities.poor.wear_tear_value = 0.3
	self.qualities.poor.name_id = "bm_menu_quality_poor"
	self.qualities.fair = {}
	self.qualities.fair.index = 2
	self.qualities.fair.wear_tear_value = 0.45
	self.qualities.fair.name_id = "bm_menu_quality_fair"
	self.qualities.good = {}
	self.qualities.good.index = 3
	self.qualities.good.wear_tear_value = 0.6
	self.qualities.good.name_id = "bm_menu_quality_good"
	self.qualities.fine = {}
	self.qualities.fine.index = 4
	self.qualities.fine.wear_tear_value = 0.8
	self.qualities.fine.name_id = "bm_menu_quality_fine"
	self.qualities.mint = {}
	self.qualities.mint.index = 5
	self.qualities.mint.wear_tear_value = 1
	self.qualities.mint.name_id = "bm_menu_quality_mint"
	self.contents.legendary = {}
	self.contents.legendary.def_id = 10000
	self.contents.legendary.contains = {
		weapon_skins = {
			"ak74_rodina"
		}
	}
	self.contents.legendary.rarity = "legendary"
	self.contents.overkill_01 = {}
	self.contents.overkill_01.def_id = 10001
	self.contents.overkill_01.contains = {
		weapon_skins = {
			"new_m4_skullimov",
			"deagle_skullimov",
			"p90_skullimov",
			"plainsrider_skullimov",
			"m95_bombmatta",
			"huntsman_bloodsplat",
			"r93_wooh",
			"judge_wooh",
			"b92fs_bloodsplat",
			"mg42_bloodsplat",
			"m134_bloodsplat",
			"flamethrower_mk2_bloodsplat",
			"rpg7_bloodsplat",
			"g36_bloodsplat",
			"serbu_stunner",
			"new_m14_bloodsplat",
			"new_raging_bull_bloodsplat",
			"famas_bloodsplat",
			"r93_bloodsplat",
			"ak74_bloodsplat",
			"ppk_bloodsplat",
			"b92fs_wooh"
		},
		contents = {
			"overkill_01_legendary"
		}
	}
	self.contents.overkill_01_legendary = {}
	self.contents.overkill_01_legendary.def_id = 10002
	self.contents.overkill_01_legendary.rarity = "legendary"
	self.contents.overkill_01_legendary.contains = {
		weapon_skins = {
			"flamethrower_mk2_fire",
			"rpg7_boom",
			"m134_bulletstorm"
		}
	}
	self.contents.event_01 = {}
	self.contents.event_01.def_id = 10003
	self.contents.event_01.contains = {
		weapon_skins = {
			"m95_forest",
			"famas_forest",
			"huntsman_forest",
			"r93_forest",
			"b92fs_forest",
			"m134_forest",
			"serbu_camohex",
			"new_m14_camohex",
			"judge_camohex",
			"mg42_camohex",
			"p90_luxury",
			"ak74_luxury",
			"ppk_luxury",
			"plainsrider_linked",
			"new_m4_payday"
		},
		contents = {
			"event_01_legendary"
		}
	}
	self.contents.event_01_legendary = {}
	self.contents.event_01_legendary.def_id = 10004
	self.contents.event_01_legendary.rarity = "legendary"
	self.contents.event_01_legendary.contains = {
		weapon_skins = {
			"deagle_bling"
		}
	}
	self.contents.weapon_01 = {}
	self.contents.weapon_01.def_id = 10005
	self.contents.weapon_01.contains = {
		weapon_skins = {
			"serbu_woodland",
			"p90_woodland",
			"plainsrider_woodland",
			"rpg7_woodland",
			"ppk_woodland",
			"judge_woodland",
			"new_m4_goldstripes",
			"new_raging_bull_goldstripes",
			"flamethrower_mk2_goldstripes",
			"g36_goldstripes",
			"new_m14_luxury",
			"m95_luxury",
			"b92fs_luxury",
			"famas_hypno",
			"huntsman_hypno"
		},
		contents = {
			"legendary"
		}
	}
	self.contents.event_red = {}
	self.contents.event_red.def_id = 10006
	self.contents.event_red.type = "limited"
	self.contents.event_red.contains = {
		weapon_skins = {
			"p90_golddigger",
			"m95_golddigger",
			"serbu_golddigger",
			"huntsman_golddigger",
			"r93_golddigger",
			"ak74_golddigger",
			"m134_golddigger",
			"famas_golddigger",
			"new_m14_golddigger",
			"ppk_golddigger"
		},
		contents = {
			"event_01_legendary"
		}
	}
	self.contents.event_dinner = {}
	self.contents.event_dinner.def_id = 10007
	self.contents.event_dinner.contains = {
		weapon_skins = {
			"judge_bloodbath",
			"b92fs_bloodbath",
			"new_raging_bull_bloodbath",
			"mg42_bloodbath",
			"plainsrider_bloodbath",
			"new_m4_bloodbath",
			"g36_bloodbath",
			"flamethrower_mk2_bloodbath",
			"deagle_bloodbath",
			"rpg7_bloodbath"
		},
		contents = {
			"legendary"
		}
	}
	self.contents.event_dinner.type = "limited"
	self.contents.dallas_01 = {}
	self.contents.dallas_01.def_id = 10008
	self.contents.dallas_01.contains = {
		weapon_skins = {
			"new_raging_bull_dallas",
			"mg42_dallas",
			"famas_dallas",
			"flamethrower_mk2_dallas",
			"huntsman_dallas",
			"r93_dallas",
			"ak74_dallas",
			"ppk_dallas",
			"deagle_dallas",
			"new_m14_dallas",
			"judge_dallas",
			"b92fs_dallas",
			"serbu_dallas",
			"g36_dallas",
			"m95_dallas"
		},
		contents = {
			"dallas_01_legendary"
		}
	}
	self.contents.dallas_01_legendary = {}
	self.contents.dallas_01_legendary.def_id = 10009
	self.contents.dallas_01_legendary.contains = {
		weapon_skins = {
			"p90_dallas_sallad"
		}
	}
	self.contents.dallas_01_legendary.rarity = "legendary"
	self.contents.surf_01 = {}
	self.contents.surf_01.def_id = 10010
	self.contents.surf_01.contains = {
		weapon_skins = {
			"akm_waves",
			"asval_waves",
			"m16_waves",
			"baka_waves",
			"s552_waves",
			"usp_waves",
			"mac10_waves",
			"aug_waves",
			"scar_waves",
			"colt_1911_waves",
			"polymer_waves",
			"ak5_waves",
			"mosin_waves",
			"striker_waves",
			"x_g22c_waves"
		},
		contents = {
			"surf_01_legendary"
		}
	}
	self.contents.surf_01_legendary = {}
	self.contents.surf_01_legendary.def_id = 10011
	self.contents.surf_01_legendary.contains = {
		weapon_skins = {
			"r870_waves"
		}
	}
	self.contents.surf_01_legendary.rarity = "legendary"
	self.contents.event_flake = {}
	self.contents.event_flake.def_id = 10012
	self.contents.event_flake.contains = {
		weapon_skins = {
			"saiga_ginger",
			"p226_ginger",
			"new_mp5_ginger",
			"m249_ginger",
			"x_b92fs_ginger",
			"ksg_ginger",
			"m1928_ginger",
			"g22c_ginger",
			"wa2000_ginger",
			"akmsu_ginger"
		},
		contents = {
			"event_flake_legendary"
		}
	}
	self.contents.event_flake_legendary = {}
	self.contents.event_flake_legendary.def_id = 10013
	self.contents.event_flake_legendary.contains = {
		weapon_skins = {
			"x_1911_ginger"
		}
	}
	self.contents.event_flake_legendary.rarity = "legendary"
	self.contents.event_bah = {}
	self.contents.event_bah.def_id = 10014
	self.contents.event_bah.contains = {
		weapon_skins = {
			"ak5_baaah",
			"wa2000_baaah",
			"r870_baaah",
			"x_g22c_baaah",
			"usp_baaah",
			"polymer_baaah",
			"m16_baaah",
			"m249_baaah",
			"x_1911_baaah",
			"ksg_baaah"
		},
		contents = {}
	}
	self.contents.event_bah.type = "limited"
	self.contents.event_bah_legendary = {}
	self.contents.event_bah_legendary.def_id = 10015
	self.contents.event_bah_legendary.contains = {
		weapon_skins = {
			"model70_baaah"
		}
	}
	self.contents.event_bah_legendary.rarity = "legendary"
	self.contents.pack_01 = {}
	self.contents.pack_01.def_id = 10016
	self.contents.pack_01.contains = {
		weapon_skins = {
			"striker_wolf",
			"mosin_wolf",
			"colt_1911_wolf",
			"scar_wolf",
			"saiga_wolf",
			"g22c_wolf",
			"mac10_wolf",
			"p226_wolf",
			"akm_wolf",
			"baka_wolf",
			"aug_wolf",
			"asval_wolf",
			"x_deagle_wolf",
			"s552_wolf",
			"m16_wolf"
		},
		contents = {
			"pack_01_legendary"
		}
	}
	self.contents.pack_01_legendary = {}
	self.contents.pack_01_legendary.def_id = 10017
	self.contents.pack_01_legendary.contains = {
		weapon_skins = {
			"par_wolf"
		}
	}
	self.contents.pack_01_legendary.rarity = "legendary"
	self.contents.cola_01 = {}
	self.contents.cola_01.def_id = 10018
	self.contents.cola_01.contains = {
		weapon_skins = {
			"glock_17_cola",
			"scorpion_cola",
			"amcar_cola",
			"uzi_cola",
			"x_usp_cola",
			"m37_cola",
			"sparrow_cola",
			"benelli_cola",
			"hunter_cola",
			"hs2000_cola",
			"olympic_cola",
			"g3_cola",
			"b682_cola",
			"gre_m79_cola",
			"fal_cola"
		},
		contents = {
			"cola_01_legendary"
		}
	}
	self.contents.cola_01_legendary = {}
	self.contents.cola_01_legendary.def_id = 10019
	self.contents.cola_01_legendary.contains = {
		weapon_skins = {
			"m16_cola"
		}
	}
	self.contents.cola_01_legendary.rarity = "legendary"
	self.contents.burn_01 = {}
	self.contents.burn_01.def_id = 10020
	self.contents.burn_01.contains = {
		weapon_skins = {
			"gre_m79_burn",
			"b682_burn",
			"g3_burn",
			"mp9_burn",
			"hs2000_burn",
			"hunter_burn",
			"benelli_burn",
			"sparrow_burn",
			"m37_burn",
			"spas12_burn",
			"fal_burn",
			"glock_18c_burn",
			"uzi_burn",
			"glock_17_burn",
			"scorpion_burn"
		},
		contents = {
			"burn_01_legendary"
		}
	}
	self.contents.burn_01_legendary = {}
	self.contents.burn_01_legendary.def_id = 10021
	self.contents.burn_01_legendary.contains = {
		weapon_skins = {
			"judge_burn"
		}
	}
	self.contents.burn_01_legendary.rarity = "legendary"
	self.contents.buck_01 = {}
	self.contents.buck_01.def_id = 10022
	self.contents.buck_01.contains = {
		weapon_skins = {
			"wa2000_buck",
			"akmsu_buck",
			"x_1911_buck",
			"rpk_buck",
			"x_b92fs_buck",
			"ksg_buck",
			"m249_buck",
			"g22c_buck",
			"saw_buck",
			"winchester1874_buck",
			"m45_buck",
			"saiga_buck",
			"p226_buck",
			"new_mp5_buck",
			"m1928_buck"
		},
		contents = {
			"buck_01_legendary"
		}
	}
	self.contents.buck_01_legendary = {}
	self.contents.buck_01_legendary.def_id = 10023
	self.contents.buck_01_legendary.contains = {
		weapon_skins = {
			"boot_buck"
		}
	}
	self.contents.buck_01_legendary.rarity = "legendary"
	self.contents.same_01 = {}
	self.contents.same_01.def_id = 10024
	self.contents.same_01.contains = {
		weapon_skins = {
			"amcar_same",
			"usp_same",
			"gre_m79_same",
			"deagle_same",
			"colt_1911_same",
			"b92fs_same",
			"judge_same",
			"p90_same",
			"akm_same",
			"ak5_same",
			"baka_same",
			"model70_same",
			"new_raging_bull_same",
			"new_m14_same",
			"par_same"
		},
		contents = {
			"same_01_legendary"
		}
	}
	self.contents.same_01_legendary = {}
	self.contents.same_01_legendary.def_id = 10025
	self.contents.same_01_legendary.contains = {
		weapon_skins = {
			"ksg_same"
		}
	}
	self.contents.same_01_legendary.rarity = "legendary"
	self.bundles.same_01 = {}
	self.bundles.same_01.def_id = 30000
	self.bundles.same_01.dlc_id = "518760"
	self.bundles.same_01.quality = "mint"
	self.bundles.same_01.bonus = false
	self.bundles.same_01.contains = {
		weapon_skins = {
			"amcar_same",
			"usp_same",
			"gre_m79_same",
			"deagle_same",
			"colt_1911_same",
			"b92fs_same",
			"judge_same",
			"p90_same",
			"akm_same",
			"ak5_same",
			"baka_same",
			"model70_same",
			"new_raging_bull_same",
			"new_m14_same",
			"par_same",
			"ksg_same"
		}
	}
	self.contents.grunt_01 = {}
	self.contents.grunt_01.def_id = 10026
	self.contents.grunt_01.contains = {
		weapon_skins = {
			"saiga_grunt",
			"m1928_grunt",
			"m45_grunt",
			"p226_grunt",
			"new_mp5_grunt",
			"wa2000_grunt",
			"boot_grunt",
			"g22c_grunt",
			"m249_grunt",
			"ksg_grunt",
			"winchester1874_grunt",
			"rpk_grunt",
			"x_b92fs_grunt",
			"akmsu_grunt",
			"x_1911_grunt"
		},
		contents = {
			"grunt_01_legendary"
		}
	}
	self.contents.grunt_01_legendary = {}
	self.contents.grunt_01_legendary.def_id = 10027
	self.contents.grunt_01_legendary.contains = {
		weapon_skins = {
			"tecci_grunt"
		}
	}
	self.contents.grunt_01_legendary.rarity = "legendary"
	self.contents.lones_01 = {}
	self.contents.lones_01.def_id = 10028
	self.contents.lones_01.contains = {
		weapon_skins = {
			"x_mp5_lones",
			"sparrow_lones",
			"china_lones",
			"akmsu_lones",
			"par_lones",
			"model70_lones",
			"judge_lones"
		},
		contents = {
			"lones_01_legendary",
			"lones_01_legendary_02"
		}
	}
	self.contents.lones_01.type = "crimefest"
	self.contents.lones_01_legendary = {}
	self.contents.lones_01_legendary.def_id = 10029
	self.contents.lones_01_legendary.rarity = "legendary"
	self.contents.lones_01_legendary.contains = {
		weapon_skins = {
			"serbu_lones"
		}
	}
	self.contents.lones_01_legendary_02 = {}
	self.contents.lones_01_legendary_02.def_id = 10030
	self.contents.lones_01_legendary_02.rarity = "legendary"
	self.contents.lones_01_legendary_02.contains = {
		weapon_skins = {
			"new_m14_lones"
		}
	}
	self.contents.smosh_01 = {}
	self.contents.smosh_01.def_id = 10031
	self.contents.smosh_01.contains = {
		weapon_skins = {
			"scar_smosh",
			"colt_1911_smosh",
			"scorpion_smosh",
			"deagle_smosh",
			"r870_smosh",
			"m32_smosh",
			"x_1911_smosh",
			"hs2000_smosh",
			"saw_smosh",
			"m37_smosh",
			"m1928_smosh",
			"mateba_smosh",
			"polymer_smosh",
			"new_m4_smosh",
			"aug_smosh"
		},
		contents = {
			"smosh_01_legendary"
		}
	}
	self.contents.smosh_01_legendary = {}
	self.contents.smosh_01_legendary.def_id = 10032
	self.contents.smosh_01_legendary.rarity = "legendary"
	self.contents.smosh_01_legendary.contains = {
		weapon_skins = {
			"new_raging_bull_smosh"
		}
	}
	self.bundles.smosh_01 = {}
	self.bundles.smosh_01.def_id = 30001
	self.bundles.smosh_01.dlc_id = "558270"
	self.bundles.smosh_01.quality = "mint"
	self.bundles.smosh_01.bonus = false
	self.bundles.smosh_01.contains = {
		weapon_skins = {
			"scar_smosh",
			"colt_1911_smosh",
			"scorpion_smosh",
			"deagle_smosh",
			"r870_smosh",
			"m32_smosh",
			"x_1911_smosh",
			"hs2000_smosh",
			"saw_smosh",
			"m37_smosh",
			"m1928_smosh",
			"mateba_smosh",
			"polymer_smosh",
			"new_m4_smosh",
			"aug_smosh",
			"new_raging_bull_smosh"
		}
	}
	self.contents.sfs_01 = {}
	self.contents.sfs_01.def_id = 10033
	self.contents.sfs_01.contains = {
		weapon_skins = {
			"peacemaker_sfs",
			"x_akmsu_sfs",
			"china_sfs",
			"olympic_sfs",
			"desertfox_sfs",
			"msr_sfs",
			"hk21_sfs",
			"m16_sfs",
			"uzi_sfs",
			"spas12_sfs",
			"mateba_sfs",
			"colt_1911_sfs",
			"r870_sfs",
			"mac10_sfs",
			"galil_sfs"
		},
		contents = {}
	}
	self.contents.sfs_01.removed_items = {
		contents = {
			"sfs_01_legendary"
		}
	}
	self.contents.sfs_01_legendary = {}
	self.contents.sfs_01_legendary.def_id = 10034
	self.contents.sfs_01_legendary.contains = {
		weapon_skins = {}
	}
	self.contents.sfs_01_legendary.rarity = "legendary"
	self.contents.sfs_01_legendary.removed_items = {
		weapon_skins = {
			"contraband_sfs"
		}
	}
	self.contents.wac_01 = {}
	self.contents.wac_01.def_id = 10035
	self.contents.wac_01.contains = {
		weapon_skins = {
			"mateba_wac",
			"c96_wac",
			"ksg_wac",
			"glock_18c_wac",
			"galil_wac",
			"spas12_wac",
			"amcar_wac",
			"aa12_wac",
			"mp9_wac",
			"desertfox_wac",
			"vhs_wac",
			"mp7_wac",
			"g26_wac",
			"x_mp5_wac",
			"msr_wac"
		},
		contents = {
			"wac_01_legendary"
		}
	}
	self.contents.wac_01_legendary = {}
	self.contents.wac_01_legendary.def_id = 10036
	self.contents.wac_01_legendary.contains = {
		weapon_skins = {
			"x_akmsu_wac"
		}
	}
	self.contents.wac_01_legendary.rarity = "legendary"
	self.contents.cs3_01 = {}
	self.contents.cs3_01.def_id = 10037
	self.contents.cs3_01.contains = {
		weapon_skins = {
			"judge_cs3",
			"m95_cs3",
			"peacemaker_cs3",
			"arbiter_cs3",
			"flint_cs3",
			"aa12_cs3",
			"new_mp5_cs3",
			"saw_cs3",
			"frankish_cs3",
			"new_m4_cs3",
			"sparrow_cs3",
			"tti_cs3",
			"new_raging_bull_cs3",
			"huntsman_cs3",
			"polymer_cs3"
		},
		contents = {
			"cs3_01_legendary"
		}
	}
	self.contents.cs3_01_legendary = {}
	self.contents.cs3_01_legendary.def_id = 10038
	self.contents.cs3_01_legendary.contains = {
		weapon_skins = {
			"ppk_cs3"
		}
	}
	self.contents.cs3_01_legendary.rarity = "legendary"
	self.bundles.cs3_01 = {}
	self.bundles.cs3_01.def_id = 30002
	self.bundles.cs3_01.dlc_id = "627400"
	self.bundles.cs3_01.quality = "mint"
	self.bundles.cs3_01.bonus = false
	self.bundles.cs3_01.contains = {
		weapon_skins = {
			"judge_cs3",
			"m95_cs3",
			"peacemaker_cs3",
			"arbiter_cs3",
			"flint_cs3",
			"aa12_cs3",
			"new_mp5_cs3",
			"saw_cs3",
			"frankish_cs3",
			"new_m4_cs3",
			"sparrow_cs3",
			"tti_cs3",
			"new_raging_bull_cs3",
			"huntsman_cs3",
			"ppk_cs3",
			"polymer_cs3"
		}
	}
	self.contents.cvc_01 = {}
	self.contents.cvc_01.def_id = 10039
	self.contents.cvc_01.contains = {
		armor_skins = {
			"cvc_woodland_camo",
			"cvc_city_camo",
			"cvc_desert_camo",
			"cvc_avenger",
			"cvc_swat",
			"cvc_bone"
		},
		contents = {}
	}
	self.contents.mxs_01 = {}
	self.contents.mxs_01.def_id = 10040
	self.contents.mxs_01.contains = {
		weapon_skins = {
			"x_usp_mxs",
			"x_deagle_mxs",
			"amcar_mxs",
			"tec9_mxs",
			"striker_mxs",
			"siltstone_mxs",
			"scar_mxs",
			"rota_mxs",
			"par_mxs",
			"lemming_mxs",
			"jowi_mxs",
			"chinchilla_mxs",
			"china_mxs",
			"akm_mxs"
		},
		contents = {
			"mxs_01_legendary"
		}
	}
	self.contents.mxs_01.removed_items = {
		weapon_skins = {
			"contraband_mxs"
		}
	}
	self.contents.mxs_01_legendary = {}
	self.contents.mxs_01_legendary.def_id = 10041
	self.contents.mxs_01_legendary.contains = {
		weapon_skins = {
			"x_chinchilla_mxs"
		}
	}
	self.contents.mxs_01_legendary.rarity = "legendary"
	self.contents.cs4_01 = {}
	self.contents.cs4_01.def_id = 10042
	self.contents.cs4_01.contains = {
		weapon_skins = {
			"polymer_cs4",
			"l85a2_cs4",
			"amcar_cs4",
			"usp_cs4",
			"m16_cs4",
			"benelli_cs4",
			"wa2000_cs4",
			"serbu_cs4",
			"arbiter_cs4",
			"flint_cs4",
			"chinchilla_cs4",
			"rpg7_cs4",
			"mac10_cs4",
			"new_raging_bull_cs4",
			"striker_cs4"
		},
		contents = {
			"cs4_01_legendary"
		}
	}
	self.contents.cs4_01_legendary = {}
	self.contents.cs4_01_legendary.def_id = 10043
	self.contents.cs4_01_legendary.contains = {
		weapon_skins = {
			"p90_cs4"
		}
	}
	self.contents.cs4_01_legendary.rarity = "legendary"
	self.bundles.cs4_01 = {}
	self.bundles.cs4_01.def_id = 30003
	self.bundles.cs4_01.dlc_id = "694940"
	self.bundles.cs4_01.quality = "mint"
	self.bundles.cs4_01.bonus = false
	self.bundles.cs4_01.contains = {
		weapon_skins = {
			"polymer_cs4",
			"l85a2_cs4",
			"amcar_cs4",
			"usp_cs4",
			"m16_cs4",
			"benelli_cs4",
			"wa2000_cs4",
			"serbu_cs4",
			"arbiter_cs4",
			"flint_cs4",
			"chinchilla_cs4",
			"rpg7_cs4",
			"mac10_cs4",
			"new_raging_bull_cs4",
			"striker_cs4",
			"p90_cs4"
		}
	}
	self.contents.ast_01 = {}
	self.contents.ast_01.def_id = 10044
	self.contents.ast_01.contains = {
		armor_skins = {
			"ast_armor1",
			"ast_armor2",
			"ast_armor3",
			"ast_armor4",
			"ast_armor5",
			"ast_armor6"
		},
		contents = {}
	}
	self.contents.wwt_01 = {}
	self.contents.wwt_01.def_id = 10045
	self.contents.wwt_01.contains = {
		weapon_skins = {
			"m1928_wwt",
			"b682_wwt",
			"flamethrower_mk2_wwt",
			"sterling_wwt",
			"peacemaker_wwt",
			"erma_wwt",
			"ching_wwt",
			"m37_wwt",
			"breech_wwt",
			"mg42_wwt"
		},
		contents = {
			"wwt_01_legendary"
		}
	}
	self.contents.wwt_01_legendary = {}
	self.contents.wwt_01_legendary.def_id = 10046
	self.contents.wwt_01_legendary.rarity = "legendary"
	self.contents.wwt_01_legendary.contains = {
		weapon_skins = {
			"colt_1911_wwt"
		}
	}
	self.contents.skf_01 = {}
	self.contents.skf_01.def_id = 10047
	self.contents.skf_01.contains = {
		weapon_skins = {
			"new_m4_skf",
			"p226_skf",
			"amcar_skf",
			"ppk_skf",
			"aug_skf",
			"lemming_skf",
			"g26_skf",
			"ching_skf",
			"mp7_skf",
			"ray_skf",
			"b682_skf",
			"ak5_skf",
			"scar_skf",
			"famas_skf",
			"g36_skf"
		},
		contents = {
			"skf_01_legendary"
		}
	}
	self.contents.skf_01_legendary = {}
	self.contents.skf_01_legendary.def_id = 10048
	self.contents.skf_01_legendary.rarity = "legendary"
	self.contents.skf_01_legendary.contains = {
		weapon_skins = {
			"mac10_skf"
		}
	}
	self.bundles.skf_01 = {}
	self.bundles.skf_01.def_id = 30004
	self.bundles.skf_01.dlc_id = "729560"
	self.bundles.skf_01.quality = "mint"
	self.bundles.skf_01.bonus = false
	self.bundles.skf_01.contains = {
		weapon_skins = {
			"new_m4_skf",
			"p226_skf",
			"amcar_skf",
			"ppk_skf",
			"aug_skf",
			"lemming_skf",
			"g26_skf",
			"ching_skf",
			"mp7_skf",
			"ray_skf",
			"b682_skf",
			"ak5_skf",
			"scar_skf",
			"famas_skf",
			"g36_skf",
			"mac10_skf"
		}
	}
	self.contents.cas_01 = {}
	self.contents.cas_01.def_id = 10049
	self.contents.cas_01.contains = {
		armor_skins = {
			"cas_m90",
			"cas_police",
			"cas_miami",
			"cas_slayer",
			"cas_trash",
			"cas_gensec"
		},
		contents = {}
	}
	self.bundles.cas_01 = {}
	self.bundles.cas_01.def_id = 30005
	self.bundles.cas_01.dlc_id = "763390"
	self.bundles.cas_01.contains = {
		armor_skins = {
			"cas_m90",
			"cas_police",
			"cas_miami",
			"cas_slayer",
			"cas_trash",
			"cas_gensec"
		}
	}
	self.contents.css_01 = {}
	self.contents.css_01.def_id = 10050
	self.contents.css_01.contains = {
		weapon_skins = {
			"x_1911_css",
			"par_css",
			"breech_css",
			"c96_css",
			"m95_css",
			"m37_css",
			"sparrow_css",
			"g26_css",
			"flint_css",
			"coal_css",
			"r93_css",
			"ching_css",
			"lemming_css",
			"ppk_css"
		},
		contents = {
			"css_01_legendary"
		}
	}
	self.contents.css_01.removed_items = {
		weapon_skins = {
			"contraband_css"
		}
	}
	self.contents.css_01_legendary = {}
	self.contents.css_01_legendary.def_id = 10051
	self.contents.css_01_legendary.contains = {
		weapon_skins = {
			"polymer_css"
		}
	}
	self.contents.css_01_legendary.rarity = "legendary"
	self.bundles.css_01 = {}
	self.bundles.css_01.def_id = 30006
	self.bundles.css_01.dlc_id = "802500"
	self.bundles.css_01.quality = "mint"
	self.bundles.css_01.bonus = false
	self.bundles.css_01.contains = {
		weapon_skins = table.list_add(self.contents.css_01.contains.weapon_skins, self.contents.css_01_legendary.contains.weapon_skins)
	}
	self.contents.dss_01 = {}
	self.contents.dss_01.def_id = 10052
	self.contents.dss_01.contains = {
		weapon_skins = {
			"gre_m79_dss",
			"erma_dss",
			"boot_dss",
			"m1928_dss",
			"peacemaker_dss",
			"m45_dss",
			"x_shrew_dss",
			"mg42_dss",
			"ching_dss",
			"colt_1911_dss",
			"chinchilla_dss",
			"c96_dss",
			"winchester1874_dss",
			"huntsman_dss",
			"b682_dss"
		},
		contents = {
			"dss_01_legendary"
		}
	}
	self.contents.dss_01_legendary = {}
	self.contents.dss_01_legendary.def_id = 10053
	self.contents.dss_01_legendary.rarity = "legendary"
	self.contents.dss_01_legendary.contains = {
		weapon_skins = {
			"shrew_dss"
		}
	}
	self.contents.cat_01 = {}
	self.contents.cat_01.def_id = 10054
	self.contents.cat_01.contains = {
		weapon_skins = {
			"mp7_cat",
			"x_coal_cat",
			"m16_cat",
			"scar_cat",
			"deagle_cat",
			"p90_cat",
			"ksg_cat",
			"serbu_cat",
			"x_judge_cat",
			"new_mp5_cat",
			"x_chinchilla_cat",
			"boot_cat",
			"erma_cat",
			"x_usp_cat",
			"usp_cat"
		},
		contents = {
			"cat_01_legendary"
		}
	}
	self.contents.cat_01_legendary = {}
	self.contents.cat_01_legendary.def_id = 10055
	self.contents.cat_01_legendary.rarity = "legendary"
	self.contents.cat_01_legendary.contains = {
		weapon_skins = {
			"p226_cat"
		}
	}
	self.bundles.cat_01 = {}
	self.bundles.cat_01.def_id = 30007
	self.bundles.cat_01.dlc_id = "892410"
	self.bundles.cat_01.quality = "mint"
	self.bundles.cat_01.bonus = false
	self.bundles.cat_01.contains = {
		weapon_skins = table.list_add(self.contents.cat_01.contains.weapon_skins, self.contents.cat_01_legendary.contains.weapon_skins)
	}
	self.contents.ait_01 = {}
	self.contents.ait_01.def_id = 10056
	self.contents.ait_01.contains = {
		weapon_skins = {
			"lemming_ait",
			"b92fs_ait",
			"sub2000_ait",
			"deagle_ait",
			"elastic_ait",
			"slap_ait",
			"m16_ait",
			"system_ait",
			"mac10_ait",
			"polymer_ait",
			"spas12_ait",
			"rota_ait",
			"komodo_ait",
			"tecci_ait",
			"uzi_ait"
		},
		contents = {
			"ait_01_legendary"
		}
	}
	self.contents.ait_01_legendary = {}
	self.contents.ait_01_legendary.def_id = 10057
	self.contents.ait_01_legendary.rarity = "legendary"
	self.contents.ait_01_legendary.contains = {
		weapon_skins = {
			"scar_ait"
		}
	}
	self.bundles.ait_01 = {}
	self.bundles.ait_01.def_id = 30008
	self.bundles.ait_01.dlc_id = "892410"
	self.bundles.ait_01.quality = "mint"
	self.bundles.ait_01.bonus = false
	self.bundles.ait_01.contains = {
		weapon_skins = table.list_add(self.contents.ait_01.contains.weapon_skins, self.contents.ait_01_legendary.contains.weapon_skins)
	}
	self.contents.nin_01 = {}
	self.contents.nin_01.def_id = 10058
	self.contents.nin_01.contains = {
		weapon_skins = {
			"amcar_nin",
			"glock_18c_nin",
			"shepheard_nin",
			"x_chinchilla_nin",
			"deagle_nin",
			"corgi_nin",
			"scorpion_nin",
			"tec9_nin",
			"ray_nin",
			"ak74_nin",
			"winchester1874_nin",
			"akm_nin",
			"par_nin",
			"rota_nin",
			"legacy_nin"
		},
		contents = {
			"nin_01_legendary"
		}
	}
	self.contents.nin_01_legendary = {}
	self.contents.nin_01_legendary.def_id = 10059
	self.contents.nin_01_legendary.rarity = "legendary"
	self.contents.nin_01_legendary.contains = {
		weapon_skins = {
			"saw_nin"
		}
	}
	self.bundles.nin_01 = {}
	self.bundles.nin_01.def_id = 30009
	self.bundles.nin_01.dlc_id = "1257321"
	self.bundles.nin_01.quality = "mint"
	self.bundles.nin_01.bonus = false
	self.bundles.nin_01.contains = {
		weapon_skins = table.list_add(self.contents.nin_01.contains.weapon_skins, self.contents.nin_01_legendary.contains.weapon_skins)
	}
	self.safes.overkill_01 = {}
	self.safes.overkill_01.def_id = 50000
	self.safes.overkill_01.promo = true
	self.safes.overkill_01.drill = "overkill_01"
	self.safes.overkill_01.content = "overkill_01"
	self.safes.overkill_01.unit_name = "units/payday2_cash/safes/eco_safe_overkill_01/eco_safe_overkill_01"
	self.safes.overkill_01.name_id = "bm_menu_safe_overkill_01"
	self.safes.overkill_01.texture_bundle_folder = "cash/safes/cop"
	self.safes.overkill_01.dlc = "complete_overkill_pack"
	self.safes.event_01 = {}
	self.safes.event_01.free = true
	self.safes.event_01.def_id = 50001
	self.safes.event_01.convert_drill = true
	self.safes.event_01.drill = "event_01"
	self.safes.event_01.content = "event_01"
	self.safes.event_01.unit_name = "units/payday2_cash/safes/eco_safe_event_01/eco_safe_event_01"
	self.safes.event_01.name_id = "bm_menu_safe_event_01"
	self.safes.event_01.texture_bundle_folder = "cash/safes/cf15"
	self.safes.weapon_01 = {}
	self.safes.weapon_01.free = true
	self.safes.weapon_01.def_id = 50002
	self.safes.weapon_01.convert_drill = true
	self.safes.weapon_01.drill = "weapon_01"
	self.safes.weapon_01.content = "weapon_01"
	self.safes.weapon_01.unit_name = "units/payday2_cash/safes/eco_safe_weapon_01/eco_safe_weapon_01"
	self.safes.weapon_01.name_id = "bm_menu_safe_weapon_01"
	self.safes.weapon_01.texture_bundle_folder = "cash/safes/sputnik"
	self.safes.event_red = {}
	self.safes.event_red.def_id = 50003
	self.safes.event_red.free = true
	self.safes.event_red.convert_drill = true
	self.safes.event_red.drill = "event_red"
	self.safes.event_red.content = "event_red"
	self.safes.event_red.unit_name = "units/payday2_cash/safes/red/safe/eco_safe_event_red"
	self.safes.event_red.name_id = "bm_menu_safe_event_red"
	self.safes.event_red.texture_bundle_folder = "cash/safes/red"
	self.safes.event_red.achievement = "green_7"
	self.safes.event_dinner = {}
	self.safes.event_dinner.def_id = 50004
	self.safes.event_dinner.free = true
	self.safes.event_dinner.convert_drill = true
	self.safes.event_dinner.drill = "event_dinner"
	self.safes.event_dinner.content = "event_dinner"
	self.safes.event_dinner.unit_name = "units/payday2_cash/safes/dinner/safe/eco_safe_event_dinner"
	self.safes.event_dinner.name_id = "bm_menu_safe_event_dinner"
	self.safes.event_dinner.texture_bundle_folder = "cash/safes/dinner"
	self.safes.event_dinner.achievement = "farm_6"
	self.safes.dallas_01 = {}
	self.safes.dallas_01.free = true
	self.safes.dallas_01.def_id = 50005
	self.safes.dallas_01.convert_drill = true
	self.safes.dallas_01.drill = "dallas_01"
	self.safes.dallas_01.content = "dallas_01"
	self.safes.dallas_01.name_id = "bm_menu_safe_dallas_01"
	self.safes.dallas_01.unit_name = "units/payday2_cash/safes/dallas/safe/eco_safe_dallas"
	self.safes.dallas_01.texture_bundle_folder = "cash/safes/dallas"
	self.safes.surf_01 = {}
	self.safes.surf_01.drill = "surf_01"
	self.safes.surf_01.content = "surf_01"
	self.safes.surf_01.def_id = 50006
	self.safes.surf_01.free = true
	self.safes.surf_01.convert_drill = true
	self.safes.surf_01.name_id = "bm_menu_safe_surf_01"
	self.safes.surf_01.unit_name = "units/payday2_cash/safes/surf/safe/eco_safe_surf"
	self.safes.surf_01.texture_bundle_folder = "cash/safes/surf"
	self.safes.event_flake = {}
	self.safes.event_flake.def_id = 50007
	self.safes.event_flake.free = true
	self.safes.event_flake.convert_drill = true
	self.safes.event_flake.drill = "event_flake"
	self.safes.event_flake.content = "event_flake"
	self.safes.event_flake.name_id = "bm_menu_safe_event_flake"
	self.safes.event_flake.unit_name = "units/payday2_cash/safes/flake/safe/eco_safe_event_flake"
	self.safes.event_flake.texture_bundle_folder = "cash/safes/flake"
	self.safes.event_flake.achievement = "flake_1"
	self.safes.event_bah = {}
	self.safes.event_bah.def_id = 50008
	self.safes.event_bah.free = true
	self.safes.event_bah.convert_drill = true
	self.safes.event_bah.drill = "event_bah"
	self.safes.event_bah.content = "event_bah"
	self.safes.event_bah.unit_name = "units/payday2_cash/safes/bah/safe/eco_safe_bah"
	self.safes.event_bah.name_id = "bm_menu_safe_event_bah"
	self.safes.event_bah.texture_bundle_folder = "cash/safes/bah"
	self.safes.event_bah.achievement = "bah_1"
	self.safes.pack_01 = {}
	self.safes.pack_01.free = true
	self.safes.pack_01.def_id = 50009
	self.safes.pack_01.convert_drill = true
	self.safes.pack_01.drill = "pack_01"
	self.safes.pack_01.content = "pack_01"
	self.safes.pack_01.name_id = "bm_menu_safe_pack_01"
	self.safes.pack_01.unit_name = "units/payday2_cash/safes/pack/safe/eco_safe_pack"
	self.safes.pack_01.texture_bundle_folder = "cash/safes/pack"
	self.safes.cola_01 = {}
	self.safes.cola_01.free = true
	self.safes.cola_01.convert_drill = true
	self.safes.cola_01.def_id = 50010
	self.safes.cola_01.drill = "cola_01"
	self.safes.cola_01.content = "cola_01"
	self.safes.cola_01.name_id = "bm_menu_safe_cola_01"
	self.safes.cola_01.unit_name = "units/payday2_cash/safes/cola/safe/eco_safe_cola"
	self.safes.cola_01.texture_bundle_folder = "cash/safes/cola"
	self.safes.burn_01 = {}
	self.safes.burn_01.free = true
	self.safes.burn_01.convert_drill = true
	self.safes.burn_01.def_id = 50011
	self.safes.burn_01.drill = "burn_01"
	self.safes.burn_01.content = "burn_01"
	self.safes.burn_01.name_id = "bm_menu_safe_burn_01"
	self.safes.burn_01.unit_name = "units/payday2_cash/safes/burn/safe/eco_safe_burn"
	self.safes.burn_01.texture_bundle_folder = "cash/safes/burn"
	self.safes.buck_01 = {}
	self.safes.buck_01.free = true
	self.safes.buck_01.drill = "buck_01"
	self.safes.buck_01.content = "buck_01"
	self.safes.buck_01.name_id = "bm_menu_safe_buck_01"
	self.safes.buck_01.unit_name = "units/payday2_cash/safes/buck/safe/eco_safe_buck"
	self.safes.buck_01.texture_bundle_folder = "cash/safes/buck"
	self.safes.same_01 = {}
	self.safes.same_01.free = true
	self.safes.same_01.prio = 10
	self.safes.same_01.drill = "same_01"
	self.safes.same_01.content = "same_01"
	self.safes.same_01.bundle = "same_01"
	self.safes.same_01.name_id = "bm_menu_safe_same_01"
	self.safes.same_01.unit_name = "units/payday2_cash/safes/same/safe/eco_safe_same"
	self.safes.same_01.texture_bundle_folder = "cash/safes/same"
	self.safes.grunt_01 = {}
	self.safes.grunt_01.free = true
	self.safes.grunt_01.drill = "grunt_01"
	self.safes.grunt_01.content = "grunt_01"
	self.safes.grunt_01.name_id = "bm_menu_safe_grunt_01"
	self.safes.grunt_01.unit_name = "units/payday2_cash/safes/grunt/safe/eco_safe_grunt"
	self.safes.grunt_01.texture_bundle_folder = "cash/safes/grunt"
	self.safes.lones_01 = {}
	self.safes.lones_01.free = true
	self.safes.lones_01.drill = "lones_01"
	self.safes.lones_01.content = "lones_01"
	self.safes.lones_01.name_id = "bm_menu_safe_lones_01"
	self.safes.lones_01.unit_name = "units/payday2_cash/safes/lones/safe/eco_safe_lones"
	self.safes.lones_01.texture_bundle_folder = "cash/safes/lones"
	self.safes.smosh_01 = {}
	self.safes.smosh_01.free = true
	self.safes.smosh_01.prio = 10
	self.safes.smosh_01.drill = "smosh_01"
	self.safes.smosh_01.content = "smosh_01"
	self.safes.smosh_01.bundle = "smosh_01"
	self.safes.smosh_01.name_id = "bm_menu_safe_smosh_01"
	self.safes.smosh_01.unit_name = "units/payday2_cash/safes/smosh/safe/eco_safe_smosh"
	self.safes.smosh_01.texture_bundle_folder = "cash/safes/smosh"
	self.safes.sfs_01 = {}
	self.safes.sfs_01.free = true
	self.safes.sfs_01.drill = "sfs_01"
	self.safes.sfs_01.content = "sfs_01"
	self.safes.sfs_01.name_id = "bm_menu_safe_sfs_01"
	self.safes.sfs_01.unit_name = "units/payday2_cash/safes/sfs/safe/eco_safe_sfs"
	self.safes.sfs_01.texture_bundle_folder = "cash/safes/sfs"
	self.safes.wac_01 = {}
	self.safes.wac_01.free = true
	self.safes.wac_01.drill = "wac_01"
	self.safes.wac_01.content = "wac_01"
	self.safes.wac_01.name_id = "bm_menu_safe_wac_01"
	self.safes.wac_01.unit_name = "units/payday2_cash/safes/wac/safe/eco_safe_wac"
	self.safes.wac_01.texture_bundle_folder = "cash/safes/wac"
	self.safes.cs3_01 = {}
	self.safes.cs3_01.free = true
	self.safes.cs3_01.prio = 10
	self.safes.cs3_01.drill = "cs3_01"
	self.safes.cs3_01.content = "cs3_01"
	self.safes.cs3_01.bundle = "cs3_01"
	self.safes.cs3_01.name_id = "bm_menu_safe_cs3_01"
	self.safes.cs3_01.unit_name = "units/payday2_cash/safes/cs3/safe/eco_safe_cs3"
	self.safes.cs3_01.texture_bundle_folder = "cash/safes/cs3"
	self.safes.cvc_01 = {}
	self.safes.cvc_01.free = true
	self.safes.cvc_01.prio = 1
	self.safes.cvc_01.drill = "cvc_01"
	self.safes.cvc_01.content = "cvc_01"
	self.safes.cvc_01.name_id = "bm_menu_safe_cvc_01"
	self.safes.cvc_01.unit_name = "units/payday2_cash/safes/cvc/safe/eco_safe_cvc"
	self.safes.cvc_01.texture_bundle_folder = "cash/safes/cvc"
	self.safes.mxs_01 = {}
	self.safes.mxs_01.free = true
	self.safes.mxs_01.drill = "mxs_01"
	self.safes.mxs_01.content = "mxs_01"
	self.safes.mxs_01.name_id = "bm_menu_safe_mxs_01"
	self.safes.mxs_01.unit_name = "units/payday2_cash/safes/mxs/safe/eco_safe_mxs"
	self.safes.mxs_01.texture_bundle_folder = "cash/safes/mxs"
	self.safes.cs4_01 = {}
	self.safes.cs4_01.free = true
	self.safes.cs4_01.prio = 10
	self.safes.cs4_01.drill = "cs4_01"
	self.safes.cs4_01.content = "cs4_01"
	self.safes.cs4_01.bundle = "cs4_01"
	self.safes.cs4_01.name_id = "bm_menu_safe_cs4_01"
	self.safes.cs4_01.unit_name = "units/payday2_cash/safes/cs4/safe/eco_safe_cs4"
	self.safes.cs4_01.texture_bundle_folder = "cash/safes/cs4"
	self.safes.ast_01 = {}
	self.safes.ast_01.free = true
	self.safes.ast_01.prio = 1
	self.safes.ast_01.drill = "ast_01"
	self.safes.ast_01.content = "ast_01"
	self.safes.ast_01.name_id = "bm_menu_safe_ast_01"
	self.safes.ast_01.unit_name = "units/payday2_cash/safes/ast/safe/eco_safe_ast"
	self.safes.ast_01.texture_bundle_folder = "cash/safes/ast"
	self.safes.wwt_01 = {}
	self.safes.wwt_01.free = true
	self.safes.wwt_01.drill = "wwt_01"
	self.safes.wwt_01.content = "wwt_01"
	self.safes.wwt_01.name_id = "bm_menu_safe_wwt_01"
	self.safes.wwt_01.unit_name = "units/payday2_cash/safes/wwt/safe/eco_safe_wwt"
	self.safes.wwt_01.texture_bundle_folder = "cash/safes/wwt"
	self.safes.skf_01 = {}
	self.safes.skf_01.free = true
	self.safes.skf_01.prio = 10
	self.safes.skf_01.drill = "skf_01"
	self.safes.skf_01.content = "skf_01"
	self.safes.skf_01.bundle = "skf_01"
	self.safes.skf_01.name_id = "bm_menu_safe_skf_01"
	self.safes.skf_01.unit_name = "units/payday2_cash/safes/skf/safe/eco_safe_skf"
	self.safes.skf_01.texture_bundle_folder = "cash/safes/skf"
	self.safes.cas_01 = {}
	self.safes.cas_01.free = true
	self.safes.cas_01.prio = 11
	self.safes.cas_01.drill = "cas_01"
	self.safes.cas_01.content = "cas_01"
	self.safes.cas_01.bundle = "cas_01"
	self.safes.cas_01.name_id = "bm_menu_safe_cas_01"
	self.safes.cas_01.unit_name = "units/payday2_cash/safes/cas/safe/eco_safe_cas"
	self.safes.cas_01.texture_bundle_folder = "cash/safes/cas"
	self.safes.css_01 = {}
	self.safes.css_01.free = true
	self.safes.css_01.prio = 10
	self.safes.css_01.drill = "css_01"
	self.safes.css_01.content = "css_01"
	self.safes.css_01.bundle = "css_01"
	self.safes.css_01.name_id = "bm_menu_safe_css_01"
	self.safes.css_01.unit_name = "units/payday2_cash/safes/css/safe/eco_safe_css"
	self.safes.css_01.texture_bundle_folder = "cash/safes/css"
	self.safes.dss_01 = {}
	self.safes.dss_01.free = true
	self.safes.dss_01.drill = "dss_01"
	self.safes.dss_01.content = "dss_01"
	self.safes.dss_01.name_id = "bm_menu_safe_dss_01"
	self.safes.dss_01.unit_name = "units/payday2_cash/safes/dss/safe/eco_safe_dss"
	self.safes.dss_01.texture_bundle_folder = "cash/safes/dss"
	self.safes.cat_01 = {}
	self.safes.cat_01.free = true
	self.safes.cat_01.prio = 10
	self.safes.cat_01.drill = "cat_01"
	self.safes.cat_01.content = "cat_01"
	self.safes.cat_01.bundle = "cat_01"
	self.safes.cat_01.name_id = "bm_menu_safe_cat_01"
	self.safes.cat_01.unit_name = "units/payday2_cash/safes/cat/safe/eco_safe_cat"
	self.safes.cat_01.texture_bundle_folder = "cash/safes/cat"
	self.safes.ait_01 = {}
	self.safes.ait_01.free = true
	self.safes.ait_01.prio = 10
	self.safes.ait_01.drill = "ait_01"
	self.safes.ait_01.content = "ait_01"
	self.safes.ait_01.bundle = "ait_01"
	self.safes.ait_01.name_id = "bm_menu_safe_ait_01"
	self.safes.ait_01.unit_name = "units/payday2_cash/safes/ait/safe/eco_safe_ait"
	self.safes.ait_01.texture_bundle_folder = "cash/safes/ait"
	self.safes.nin_01 = {}
	self.safes.nin_01.free = true
	self.safes.nin_01.prio = 10
	self.safes.nin_01.drill = "nin_01"
	self.safes.nin_01.content = "nin_01"
	self.safes.nin_01.bundle = "nin_01"
	self.safes.nin_01.name_id = "bm_menu_safe_nin_01"
	self.safes.nin_01.unit_name = "units/payday2_cash/safes/nin/safe/eco_safe_nin"
	self.safes.nin_01.texture_bundle_folder = "cash/safes/nin"
	self.drills.overkill_01 = {}
	self.drills.overkill_01.safe = "overkill_01"
	self.drills.overkill_01.def_id = 70000
	self.drills.overkill_01.promo = true
	self.drills.overkill_01.unit_name = "units/payday2_cash/drills/eco_drill_overkill_01/eco_drill_overkill_01"
	self.drills.overkill_01.name_id = "bm_menu_drill_overkill_01"
	self.drills.overkill_01.desc_id = "bm_menu_drill_overkill_01_desc"
	self.drills.overkill_01.texture_bundle_folder = "cash/safes/cop"
	self.drills.overkill_01.dlc = "complete_overkill_pack"
	self.drills.event_01 = {}
	self.drills.event_01.safe = "event_01"
	self.drills.event_01.def_id = 70001
	self.drills.event_01.force_include = true
	self.drills.event_01.unit_name = "units/payday2_cash/drills/eco_drill_event_01/eco_drill_event_01"
	self.drills.event_01.name_id = "bm_menu_drill_event_01"
	self.drills.event_01.desc_id = "bm_menu_drill_event_01_desc"
	self.drills.event_01.texture_bundle_folder = "cash/safes/cf15"
	self.drills.weapon_01 = {}
	self.drills.weapon_01.safe = "weapon_01"
	self.drills.weapon_01.def_id = 70002
	self.drills.weapon_01.force_include = true
	self.drills.weapon_01.unit_name = "units/payday2_cash/drills/eco_drill_weapon_01/eco_drill_weapon_01"
	self.drills.weapon_01.name_id = "bm_menu_drill_weapon_01"
	self.drills.weapon_01.desc_id = "bm_menu_drill_weapon_01_desc"
	self.drills.weapon_01.texture_bundle_folder = "cash/safes/sputnik"
	self.drills.event_red = {}
	self.drills.event_red.safe = "event_red"
	self.drills.event_red.def_id = 70003
	self.drills.event_red.force_include = true
	self.drills.event_red.unit_name = "units/payday2_cash/safes/red/drill/eco_drill_event_red"
	self.drills.event_red.name_id = "bm_menu_drill_event_red"
	self.drills.event_red.desc_id = "bm_menu_drill_event_red_desc"
	self.drills.event_red.texture_bundle_folder = "cash/safes/red"
	self.drills.event_red.achievement = "green_7"
	self.drills.event_dinner = {}
	self.drills.event_dinner.def_id = 70004
	self.drills.event_dinner.safe = "event_dinner"
	self.drills.event_dinner.force_include = true
	self.drills.event_dinner.unit_name = "units/payday2_cash/safes/dinner/drill/eco_drill_event_dinner"
	self.drills.event_dinner.name_id = "bm_menu_drill_event_dinner"
	self.drills.event_dinner.desc_id = "bm_menu_drill_event_dinner_desc"
	self.drills.event_dinner.texture_bundle_folder = "cash/safes/dinner"
	self.drills.event_dinner.achievement = "farm_6"
	self.drills.dallas_01 = {}
	self.drills.dallas_01.safe = "dallas_01"
	self.drills.dallas_01.def_id = 70005
	self.drills.dallas_01.force_include = true
	self.drills.dallas_01.name_id = "bm_menu_drill_dallas_01"
	self.drills.dallas_01.desc_id = "bm_menu_drill_dallas_01_desc"
	self.drills.dallas_01.unit_name = "units/payday2_cash/safes/dallas/drill/eco_drill_dallas"
	self.drills.dallas_01.texture_bundle_folder = "cash/safes/dallas"
	self.drills.surf_01 = {}
	self.drills.surf_01.def_id = 70006
	self.drills.surf_01.safe = "surf_01"
	self.drills.surf_01.force_include = true
	self.drills.surf_01.unit_name = "units/payday2_cash/safes/surf/drill/eco_drill_surf"
	self.drills.surf_01.name_id = "bm_menu_drill_surf"
	self.drills.surf_01.desc_id = "bm_menu_drill_surf_desc"
	self.drills.surf_01.texture_bundle_folder = "cash/safes/surf"
	self.drills.event_flake = {}
	self.drills.event_flake.def_id = 70007
	self.drills.event_flake.safe = "event_flake"
	self.drills.event_flake.force_include = true
	self.drills.event_flake.unit_name = "units/payday2_cash/safes/flake/drill/eco_drill_flake"
	self.drills.event_flake.name_id = "bm_menu_drill_event_flake"
	self.drills.event_flake.desc_id = "bm_menu_drill_event_flake_desc"
	self.drills.event_flake.texture_bundle_folder = "cash/safes/flake"
	self.drills.event_flake.achievement = "flake_1"
	self.drills.event_bah = {}
	self.drills.event_bah.def_id = 70008
	self.drills.event_bah.safe = "event_bah"
	self.drills.event_bah.force_include = true
	self.drills.event_bah.unit_name = "units/payday2_cash/safes/bah/drill/eco_drill_bah"
	self.drills.event_bah.name_id = "bm_menu_drill_event_bah"
	self.drills.event_bah.desc_id = "bm_menu_drill_event_bah_desc"
	self.drills.event_bah.texture_bundle_folder = "cash/safes/bah"
	self.drills.event_bah.achievement = "bah_1"
	self.drills.pack_01 = {}
	self.drills.pack_01.safe = "pack_01"
	self.drills.pack_01.def_id = 70009
	self.drills.pack_01.force_include = true
	self.drills.pack_01.name_id = "bm_menu_drill_pack_01"
	self.drills.pack_01.desc_id = "bm_menu_drill_pack_01_desc"
	self.drills.pack_01.unit_name = "units/payday2_cash/safes/pack/drill/eco_drill_pack"
	self.drills.pack_01.texture_bundle_folder = "cash/safes/pack"
	self.drills.cola_01 = {}
	self.drills.cola_01.safe = "cola_01"
	self.drills.cola_01.def_id = 70010
	self.drills.cola_01.force_include = true
	self.drills.cola_01.name_id = "bm_menu_drill_cola_01"
	self.drills.cola_01.desc_id = "bm_menu_drill_cola_01_desc"
	self.drills.cola_01.unit_name = "units/payday2_cash/safes/cola/drill/eco_drill_cola"
	self.drills.cola_01.texture_bundle_folder = "cash/safes/cola"
	self.drills.burn_01 = {}
	self.drills.burn_01.safe = "burn_01"
	self.drills.burn_01.def_id = 70011
	self.drills.burn_01.force_include = true
	self.drills.burn_01.name_id = "bm_menu_drill_burn_01"
	self.drills.burn_01.desc_id = "bm_menu_drill_burn_01_desc"
	self.drills.burn_01.unit_name = "units/payday2_cash/safes/burn/drill/eco_drill_burn"
	self.drills.burn_01.texture_bundle_folder = "cash/safes/burn"
	self.drills.buck_01 = {}
	self.drills.buck_01.safe = "buck_01"
	self.drills.buck_01.unit_name = "units/payday2_cash/safes/buck/drill/eco_drill_buck"
	self.drills.same_01 = {}
	self.drills.same_01.safe = "same_01"
	self.drills.same_01.unit_name = "units/payday2_cash/safes/same/drill/eco_drill_same"
	self.drills.grunt_01 = {}
	self.drills.grunt_01.safe = "grunt_01"
	self.drills.grunt_01.unit_name = "units/payday2_cash/safes/grunt/drill/eco_drill_grunt"
	self.drills.lones_01 = {}
	self.drills.lones_01.safe = "lones_01"
	self.drills.lones_01.unit_name = "units/payday2_cash/safes/lones/drill/eco_drill_lones"
	self.drills.smosh_01 = {}
	self.drills.smosh_01.safe = "smosh_01"
	self.drills.smosh_01.unit_name = "units/payday2_cash/safes/smosh/drill/eco_drill_smosh"
	self.drills.sfs_01 = {}
	self.drills.sfs_01.safe = "sfs_01"
	self.drills.sfs_01.unit_name = "units/payday2_cash/safes/sfs/drill/eco_drill_sfs"
	self.drills.wac_01 = {}
	self.drills.wac_01.safe = "wac_01"
	self.drills.wac_01.unit_name = "units/payday2_cash/safes/wac/drill/eco_drill_wac"
	self.drills.cs3_01 = {}
	self.drills.cs3_01.safe = "cs3_01"
	self.drills.cs3_01.unit_name = "units/payday2_cash/safes/cs3/drill/eco_drill_cs3"
	self.drills.cvc_01 = {}
	self.drills.cvc_01.safe = "cvc_01"
	self.drills.cvc_01.unit_name = "units/payday2_cash/safes/cvc/drill/eco_drill_cvc"
	self.drills.mxs_01 = {}
	self.drills.mxs_01.safe = "mxs_01"
	self.drills.mxs_01.unit_name = "units/payday2_cash/safes/mxs/drill/eco_drill_mxs"
	self.drills.cs4_01 = {}
	self.drills.cs4_01.safe = "cs4_01"
	self.drills.cs4_01.unit_name = "units/payday2_cash/safes/cs4/drill/eco_drill_cs4"
	self.drills.ast_01 = {}
	self.drills.ast_01.safe = "ast_01"
	self.drills.ast_01.unit_name = "units/payday2_cash/safes/ast/drill/eco_drill_ast"
	self.drills.wwt_01 = {}
	self.drills.wwt_01.safe = "wwt_01"
	self.drills.wwt_01.unit_name = "units/payday2_cash/safes/wwt/drill/eco_drill_wwt"
	self.drills.skf_01 = {}
	self.drills.skf_01.safe = "skf_01"
	self.drills.skf_01.unit_name = "units/payday2_cash/safes/skf/drill/eco_drill_skf"
	self.drills.cas_01 = {}
	self.drills.cas_01.safe = "cas_01"
	self.drills.cas_01.unit_name = "units/payday2_cash/safes/cas/drill/eco_drill_cas"
	self.drills.css_01 = {}
	self.drills.css_01.safe = "css_01"
	self.drills.css_01.unit_name = "units/payday2_cash/safes/css/drill/eco_drill_css"
	self.drills.dss_01 = {}
	self.drills.dss_01.safe = "dss_01"
	self.drills.dss_01.unit_name = "units/payday2_cash/safes/dss/drill/eco_drill_dss"
	self.drills.cat_01 = {}
	self.drills.cat_01.safe = "cat_01"
	self.drills.cat_01.unit_name = "units/payday2_cash/safes/cat/drill/eco_drill_cat"
	self.drills.ait_01 = {}
	self.drills.ait_01.safe = "ait_01"
	self.drills.ait_01.unit_name = "units/payday2_cash/safes/ait/drill/eco_drill_ait"
	self.drills.nin_01 = {}
	self.drills.nin_01.safe = "nin_01"
	self.drills.nin_01.unit_name = "units/payday2_cash/safes/nin/drill/eco_drill_nin"
	self.bonuses = {}
	self.bonuses.concealment_p1 = {}
	self.bonuses.concealment_p1.name_id = "bm_menu_bonus_concealment"
	self.bonuses.concealment_p1.stats = {
		concealment = 1
	}
	self.bonuses.concealment_p2 = {}
	self.bonuses.concealment_p2.name_id = "bm_menu_bonus_concealment"
	self.bonuses.concealment_p2.stats = {
		concealment = 2
	}
	self.bonuses.concealment_p3 = {}
	self.bonuses.concealment_p3.name_id = "bm_menu_bonus_concealment"
	self.bonuses.concealment_p3.stats = {
		concealment = 3
	}
	self.bonuses.spread_p1 = {}
	self.bonuses.spread_p1.name_id = "bm_menu_bonus_spread"
	self.bonuses.spread_p1.stats = {
		spread = 1
	}
	self.bonuses.spread_n1 = {}
	self.bonuses.spread_n1.name_id = "bm_menu_bonus_spread"
	self.bonuses.spread_n1.stats = {
		spread = -1
	}
	self.bonuses.recoil_p1 = {}
	self.bonuses.recoil_p1.name_id = "bm_menu_bonus_recoil"
	self.bonuses.recoil_p1.stats = {
		recoil = 1
	}
	self.bonuses.recoil_p2 = {}
	self.bonuses.recoil_p2.name_id = "bm_menu_bonus_recoil"
	self.bonuses.recoil_p2.stats = {
		recoil = 2
	}
	self.bonuses.damage_p1 = {}
	self.bonuses.damage_p1.name_id = "bm_menu_bonus_damage"
	self.bonuses.damage_p1.stats = {
		damage = 1
	}
	self.bonuses.damage_p2 = {}
	self.bonuses.damage_p2.name_id = "bm_menu_bonus_damage"
	self.bonuses.damage_p2.stats = {
		damage = 2
	}
	self.bonuses.total_ammo_p1 = {}
	self.bonuses.total_ammo_p1.name_id = "bm_menu_bonus_total_ammo"
	self.bonuses.total_ammo_p1.stats = {
		total_ammo_mod = 1
	}
	self.bonuses.total_ammo_p3 = {}
	self.bonuses.total_ammo_p3.name_id = "bm_menu_bonus_total_ammo"
	self.bonuses.total_ammo_p3.stats = {
		total_ammo_mod = 3
	}
	self.bonuses.concealment_p1_tem_p1 = {}
	self.bonuses.concealment_p1_tem_p1.name_id = "bm_menu_bonus_concealment_tem"
	self.bonuses.concealment_p1_tem_p1.stats = {
		concealment = 1
	}
	self.bonuses.concealment_p1_tem_p1.exp_multiplier = 1.01
	self.bonuses.concealment_p1_tem_p1.money_multiplier = 1.01
	self.bonuses.concealment_p2_tem_p1 = {}
	self.bonuses.concealment_p2_tem_p1.name_id = "bm_menu_bonus_concealment_tem"
	self.bonuses.concealment_p2_tem_p1.stats = {
		concealment = 2
	}
	self.bonuses.concealment_p2_tem_p1.exp_multiplier = 1.01
	self.bonuses.concealment_p2_tem_p1.money_multiplier = 1.01
	self.bonuses.concealment_p3_tem_p1 = {}
	self.bonuses.concealment_p3_tem_p1.name_id = "bm_menu_bonus_concealment_tem"
	self.bonuses.concealment_p3_tem_p1.stats = {
		concealment = 3
	}
	self.bonuses.concealment_p3_tem_p1.exp_multiplier = 1.01
	self.bonuses.concealment_p3_tem_p1.money_multiplier = 1.01
	self.bonuses.spread_p1_tem_p1 = {}
	self.bonuses.spread_p1_tem_p1.name_id = "bm_menu_bonus_spread_tem"
	self.bonuses.spread_p1_tem_p1.stats = {
		spread = 1
	}
	self.bonuses.spread_p1_tem_p1.exp_multiplier = 1.01
	self.bonuses.spread_p1_tem_p1.money_multiplier = 1.01
	self.bonuses.spread_n1_tem_p1 = {}
	self.bonuses.spread_n1_tem_p1.name_id = "bm_menu_bonus_spread_tem"
	self.bonuses.spread_n1_tem_p1.stats = {
		spread = -1
	}
	self.bonuses.spread_n1_tem_p1.exp_multiplier = 1.01
	self.bonuses.spread_n1_tem_p1.money_multiplier = 1.01
	self.bonuses.recoil_p1_tem_p1 = {}
	self.bonuses.recoil_p1_tem_p1.name_id = "bm_menu_bonus_recoil_tem"
	self.bonuses.recoil_p1_tem_p1.stats = {
		recoil = 1
	}
	self.bonuses.recoil_p1_tem_p1.exp_multiplier = 1.01
	self.bonuses.recoil_p1_tem_p1.money_multiplier = 1.01
	self.bonuses.recoil_p2_tem_p1 = {}
	self.bonuses.recoil_p2_tem_p1.name_id = "bm_menu_bonus_recoil_tem"
	self.bonuses.recoil_p2_tem_p1.stats = {
		recoil = 2
	}
	self.bonuses.recoil_p2_tem_p1.exp_multiplier = 1.01
	self.bonuses.recoil_p2_tem_p1.money_multiplier = 1.01
	self.bonuses.damage_p1_tem_p1 = {}
	self.bonuses.damage_p1_tem_p1.name_id = "bm_menu_bonus_damage_tem"
	self.bonuses.damage_p1_tem_p1.stats = {
		damage = 1
	}
	self.bonuses.damage_p1_tem_p1.exp_multiplier = 1.01
	self.bonuses.damage_p1_tem_p1.money_multiplier = 1.01
	self.bonuses.damage_p2_tem_p1 = {}
	self.bonuses.damage_p2_tem_p1.name_id = "bm_menu_bonus_damage_tem"
	self.bonuses.damage_p2_tem_p1.stats = {
		damage = 2
	}
	self.bonuses.damage_p2_tem_p1.exp_multiplier = 1.01
	self.bonuses.damage_p2_tem_p1.money_multiplier = 1.01
	self.bonuses.total_ammo_p1_tem_p1 = {}
	self.bonuses.total_ammo_p1_tem_p1.name_id = "bm_menu_bonus_total_ammo_tem"
	self.bonuses.total_ammo_p1_tem_p1.stats = {
		total_ammo_mod = 1
	}
	self.bonuses.total_ammo_p1_tem_p1.exp_multiplier = 1.01
	self.bonuses.total_ammo_p1_tem_p1.money_multiplier = 1.01
	self.bonuses.total_ammo_p3_tem_p1 = {}
	self.bonuses.total_ammo_p3_tem_p1.name_id = "bm_menu_bonus_total_ammo_tem"
	self.bonuses.total_ammo_p3_tem_p1.stats = {
		total_ammo_mod = 3
	}
	self.bonuses.total_ammo_p3_tem_p1.exp_multiplier = 1.01
	self.bonuses.total_ammo_p3_tem_p1.money_multiplier = 1.01
	self.bonuses.team_exp_money_p3 = {}
	self.bonuses.team_exp_money_p3.name_id = "bm_menu_bonus_team_exp_money"
	self.bonuses.team_exp_money_p3.exp_multiplier = 1.03
	self.bonuses.team_exp_money_p3.money_multiplier = 1.03

	self:_init_armor_skins()
	self:_init_ip_content(tweak_data)
	self:_init_rarity_contents(tweak_data)
end

function EconomyTweakData:_add_content(data, content, tweaks)
	for category, items in pairs(content.contains) do
		for _, entry in pairs(items) do
			if category == "contents" then
				local rarity = self.contents[entry].rarity

				data[rarity] = data[rarity] or {}
				data[rarity] = entry
			else
				local item_data = tweaks[category][entry]

				if item_data then
					local rarity = content.rarity or item_data.rarity or "common"

					data[rarity] = data[rarity] or {}
					data[rarity][category] = data[rarity][category] or {}

					table.insert(data[rarity][category], entry)
				end
			end
		end
	end
end

function EconomyTweakData:_init_ip_content(tweak_data)
	self.safes.wac_01.ip_content = true
	self.safes.surf_01.ip_content = true
	self.safes.cola_01.ip_content = true
	self.safes.sfs_01.ip_content = true
	self.safes.sfs_01.first_file_extra = 0

	local weapon_skins_tweak = tweak_data.blackmarket.weapon_skins
	local add_ip_content

	function add_ip_content(content)
		content.ip_content = true

		if content.contains and content.contains.contents then
			content.removed_items = content.removed_items or {}
			content.removed_items.contents = content.removed_items.contents or {}

			for _, content_content in ipairs(content.contains.contents) do
				add_ip_content(self.contents[content_content])
				table.insert(content.removed_items.contents, content_content)
			end

			content.contains.contents = {}
		end
	end

	local content, skin_tweak

	for safe_id, safe_data in pairs(self.safes) do
		if safe_data.ip_content then
			add_ip_content(self.contents[safe_data.content])
		end
	end

	local weapon_id, weapon_tweak, should_hide_unavailable

	local function set_marketable_weapon_skins(data)
		local weapon_skins = data.contains.weapon_skins

		for _, skin_id in ipairs(weapon_skins) do
			skin_tweak = weapon_skins_tweak[skin_id]

			if skin_tweak then
				weapon_id = skin_tweak.weapon_ids and skin_tweak.weapon_ids[1] or skin_tweak.weapon_id
				weapon_tweak = weapon_id and tweak_data.weapon[weapon_id]
				should_hide_unavailable = tweak_data:get_raw_value("lootdrop", "global_values", weapon_tweak and weapon_tweak.global_value or false, "hide_unavailable")

				if should_hide_unavailable or data.ip_content then
					data.removed_items = data.removed_items or {}
					data.removed_items.weapon_skins = data.removed_items.weapon_skins or {}

					table.insert(data.removed_items.weapon_skins, skin_id)
				end
			end
		end

		if data.removed_items and data.removed_items.weapon_skins and #data.removed_items.weapon_skins > 0 then
			for _, skin_id in ipairs(data.removed_items.weapon_skins) do
				table.delete(weapon_skins, skin_id)

				skin_tweak = weapon_skins_tweak[skin_id]

				if skin_tweak then
					skin_tweak.is_marketable = false
				end
			end
		end
	end

	for id, data in pairs(self.contents) do
		for content_type, items in pairs(data.contains or {}) do
			if content_type == "weapon_skins" then
				set_marketable_weapon_skins(data)
			end
		end
	end
end

function EconomyTweakData:_init_rarity_contents(tweak_data)
	local weapon_skin_tweak = tweak_data.blackmarket.weapon_skins
	local armor_skin_tweak = self.armor_skins
	local tweaks = {
		weapon_skins = tweak_data.blackmarket.weapon_skins,
		armor_skins = self.armor_skins
	}
	local contents = {}

	for safe_id, safe_data in pairs(self.safes) do
		if not safe_data.promo and not safe_data.ip_content then
			local content = self.contents[safe_data.content]

			contents[safe_id] = {}

			self:_add_content(contents[safe_id], content, tweaks)
		end
	end

	local ids = {}

	for safe_id, data in pairs(contents) do
		self.safes[safe_id].rarity_contents = {}

		for rarity, contains in pairs(data) do
			local content_id

			if type(contains) == "table" then
				local rarity_index = self.rarities[rarity].index
				local def_id = 20000 + rarity_index * 1000 + self.contents[safe_id].def_id % 10000

				content_id = safe_id .. "_" .. rarity
				self.contents[content_id] = {
					def_id = def_id,
					rarity = rarity,
					contains = clone(contains)
				}
			else
				content_id = contains
			end

			self.safes[safe_id].rarity_contents[rarity] = content_id
			ids[rarity] = ids[rarity] or {}

			table.insert(ids[rarity], content_id)
		end
	end

	for rarity, items in pairs(ids) do
		local rarity_index = self.rarities[rarity].index
		local rarity_id = "rarity_" .. rarity
		local def_id = 20000 + rarity_index

		self.contents[rarity_id] = {
			def_id = def_id,
			contains = {
				contents = table.list_union(items)
			}
		}
	end
end

function EconomyTweakData:get_entry_from_index(category, index)
	for entry, data in pairs(self[category] or {}) do
		if not data.index then
			break
		end

		if data.index == index then
			return entry
		end
	end
end

function EconomyTweakData:get_index_from_entry(category, entry)
	return self[category] and self[category][entry] and self[category][entry].index
end

function EconomyTweakData:get_bonus_icons(entry)
	local bonus_data = self.bonuses[entry]
	local bonuses = {}

	if bonus_data then
		if bonus_data.stats then
			table.insert(bonuses, "guis/dlcs/cash/textures/pd2/safe_raffle/statboost_icon")
		end

		if bonus_data.exp_multiplier or bonus_data.money_multiplier then
			table.insert(bonuses, "guis/dlcs/cash/textures/pd2/safe_raffle/teamboost_icon")
		end
	end

	return bonuses
end

EconomyTweakData.market_link_search = "https://steamcommunity.com/market/search?appid=218620&q="

function EconomyTweakData:create_weapon_skin_market_search_url(weapon_id, cosmetic_id)
	local market_link = self.market_links.weapon_skins[cosmetic_id]

	if market_link then
		return EconomyTweakData.market_link_search .. market_link
	end

	local cosmetic_name = tweak_data.blackmarket.weapon_skins[cosmetic_id] and managers.localization:text(tweak_data.blackmarket.weapon_skins[cosmetic_id].name_id)
	local weapon_name = managers.weapon_factory:get_weapon_name_by_weapon_id(weapon_id)

	if cosmetic_name and weapon_name then
		cosmetic_name = string.gsub(cosmetic_name, " ", "+")
		weapon_name = string.gsub(weapon_name, " ", "+")

		return string.gsub(EconomyTweakData.market_link_search .. cosmetic_name .. "+" .. weapon_name, "++", "+")
	end

	return nil
end

function EconomyTweakData:create_armor_skin_market_search_url(cosmetic_id)
	local market_link = self.market_links.armor_skins[cosmetic_id]

	if market_link then
		return EconomyTweakData.market_link_search .. market_link
	end

	local cosmetic_name = tweak_data.economy.armor_skins[cosmetic_id] and managers.localization:text(tweak_data.economy.armor_skins[cosmetic_id].name_id)

	if cosmetic_name then
		cosmetic_name = string.gsub(cosmetic_name, " ", "+")

		return string.gsub(EconomyTweakData.market_link_search .. cosmetic_name .. "+", "++", "+")
	end

	return nil
end

function EconomyTweakData:create_market_link_url(category, entry)
	return self[category] and self[category][entry] and self[category][entry].market_link
end

function EconomyTweakData:create_buy_tradable_url(def_id, quantity)
	return "https://store.steampowered.com/buyitem/218620/" .. tostring(def_id) .. "/"
end

function EconomyTweakData:create_sell_tradable_url(steam_id, instance_id)
	return "https://steamcommunity.com/profiles/" .. tostring(steam_id) .. "/inventory/?sellOnLoad=1#218620_2_" .. tostring(instance_id)
end

function EconomyTweakData:get_bonuses_by_safe(safe)
	local safe_tweak = self.contents[safe]
	local ids = deep_clone(safe_tweak.contains.weapon_skins)

	if safe_tweak.contains.contents then
		for _, content in ipairs(safe_tweak.contains.contents) do
			local legendary_tweak = self.contents[content]

			for _, new_id in ipairs(legendary_tweak.contains.weapon_skins) do
				table.insert(ids, new_id)
			end
		end
	end

	local bonuses = {}

	for _, wid in ipairs(ids) do
		local bonus = "none"
		local item = tweak_data.blackmarket.weapon_skins[wid]

		if item.bonus then
			local bonus_data = self.bonuses[item.bonus]

			bonus = bonus_data.stats and (bonus_data.exp_multiplier or bonus_data.money_multiplier) and "both" or bonus_data.stats and "single" or "team"
		end

		bonuses[wid] = bonus
	end

	return bonuses
end
