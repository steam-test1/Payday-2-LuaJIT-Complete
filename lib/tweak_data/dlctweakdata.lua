DLCTweakData = DLCTweakData or class()

require("lib/tweak_data/GeneratedDLCTweakData")

function DLCTweakData:init(tweak_data)
	if managers.dlc:is_installing() then
		tweak_data.BUNDLED_DLC_PACKAGES = {}
	else
		tweak_data.BUNDLED_DLC_PACKAGES = {
			alienware_alpha = true,
			animal = true,
			apa = true,
			bbq = true,
			big_bank = true,
			born = true,
			butcher_pack_mods = true,
			cash = true,
			character_pack_bonnie = true,
			character_pack_clover = true,
			character_pack_dragan = true,
			character_pack_sokol = true,
			chill = 1,
			cmo = true,
			cmt = true,
			coco = true,
			dlc1 = true,
			dlc_akm4 = 1,
			dlc_arena = true,
			dlc_pack_overkill = true,
			dnm = true,
			dos = true,
			dragon = true,
			dsg = true,
			ecp = true,
			favorite = true,
			fdm = true,
			fez1 = true,
			fgl = true,
			fir = true,
			fish = true,
			gage_pack = true,
			gage_pack_assault = true,
			gage_pack_historical = true,
			gage_pack_jobs = false,
			gage_pack_lmg = true,
			gage_pack_shotgun = true,
			gage_pack_snp = true,
			gcm = true,
			ggac = true,
			ghm = true,
			grv = true,
			hl_miami = true,
			hlm2 = true,
			howl = 1,
			hoxton_revenge = 1,
			humble_summer_2015 = 1,
			infamous = 1,
			jigg = 1,
			joy = true,
			kenaz = true,
			khp = true,
			ktm = true,
			lxy = true,
			mad = true,
			max = true,
			mdm = 1,
			mmh = true,
			mom = true,
			mrm = 1,
			myh = true,
			opera = true,
			osa = true,
			pal = true,
			paydaycon2016 = 1,
			pbm = true,
			pd2_goty = 1,
			pd2_hw_boxing = true,
			pd2_million = true,
			peta = true,
			pic = true,
			pim = true,
			pines = true,
			pmp = true,
			pn2 = true,
			ram = true,
			rip = true,
			sdb = true,
			season_pass = true,
			sft = true,
			sha = true,
			spa = true,
			sparkle = 1,
			speedrunners = 1,
			ssm = true,
			steel = true,
			super = 1,
			swm = 1,
			tam = true,
			the_bomb = true,
			tng = true,
			trk = true,
			turtles = true,
			twitch_pack = 1,
			washington_reveal = true,
			west = true,
			wild = true,
			wmp = true,
			wwh = true,
			yor = 1,
			ztm = true
		}
	end

	self:init_generated()

	self.starvr_free = {}
	self.starvr_free.free = true
	self.starvr_free.content = {}
	self.starvr_free.content.loot_global_value = "infamous"
	self.starvr_free.content.loot_drops = {
		{
			amount = 1,
			item_entry = "starvr",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "starvr",
			type_items = "textures"
		}
	}
	self.starter_kit = {}
	self.starter_kit.free = true
	self.starter_kit.content = {}
	self.starter_kit.content.loot_global_value = "normal"
	self.starter_kit.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_pis_medium",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_m4_uupg_m_std",
			type_items = "weapon_mods"
		}
	}
	self.starter_kit.content.upgrades = {
		"fists",
		"molotov",
		"frag",
		"dynamite"
	}

	do
		local lootdrops = {}
		local all_normal_masks = {
			"alienware",
			"babyrhino",
			"mr_sinister",
			"day_of_the_dead",
			"irondoom",
			"greek_tragedy",
			"hockey",
			"kawaii",
			"demonictender",
			"monkeybiss",
			"rubber_male",
			"scarecrow",
			"tounge",
			"rubber_female",
			"oni",
			"biglips",
			"brainiack",
			"bullet",
			"outlandish_a",
			"clowncry",
			"dripper",
			"gagball",
			"hog",
			"demon",
			"jaw",
			"mummy",
			"outlandish_b",
			"outlandish_c",
			"stonekisses",
			"buha",
			"shogun",
			"shrunken",
			"clown_56",
			"troll",
			"dawn_of_the_dead",
			"vampire",
			"zipper",
			"zombie"
		}

		for _, mask_id in ipairs(all_normal_masks) do
			table.insert(lootdrops, {
				amount = 1,
				type_items = "masks",
				item_entry = mask_id
			})
		end

		self.starter_kit_mask = {}
		self.starter_kit_mask.free = true
		self.starter_kit_mask.content = {}
		self.starter_kit_mask.content.loot_global_value = "normal"
		self.starter_kit_mask.content.loot_drops = {
			lootdrops
		}
	end

	self.dlc_achievement = {}
	self.dlc_achievement.free = true
	self.dlc_achievement.content = {}
	self.dlc_achievement.content.loot_global_value = "normal"
	self.dlc_achievement.content.loot_drops = {}
	self.pd2_clan = {}
	self.pd2_clan.content = {}
	self.pd2_clan.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bear",
			type_items = "masks"
		}
	}
	self.pd2_clan2 = {}
	self.pd2_clan2.content = {}
	self.pd2_clan2.dlc = "has_pd2_clan"
	self.pd2_clan2.content.loot_global_value = "pd2_clan"
	self.pd2_clan2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fl_pis_tlr1",
			type_items = "weapon_mods"
		}
	}
	self.pd2_clan2.content.upgrades = {
		"usp"
	}
	self.pd2_clan3 = {}
	self.pd2_clan3.content = {}
	self.pd2_clan3.dlc = "has_pd2_clan"
	self.pd2_clan3.content.loot_global_value = "pd2_clan"
	self.pd2_clan3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "heat",
			type_items = "masks"
		}
	}
	self.pd2_clan4 = {}
	self.pd2_clan4.content = {}
	self.pd2_clan4.dlc = "has_pd2_clan"
	self.pd2_clan4.content.loot_global_value = "pd2_clan"
	self.pd2_clan4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "santa_happy",
			type_items = "masks"
		}
	}
	self.pd2_clan5 = {}
	self.pd2_clan5.content = {}
	self.pd2_clan5.dlc = "has_pd2_clan"
	self.pd2_clan5.content.loot_global_value = "pd2_clan"
	self.pd2_clan5.content.loot_drops = {}
	self.pd2_clan5.content.upgrades = {
		"brass_knuckles"
	}
	self.pd2_clan6 = {}
	self.pd2_clan6.content = {}
	self.pd2_clan6.dlc = "has_pd2_clan"
	self.pd2_clan6.content.loot_global_value = "pd2_clan"
	self.pd2_clan6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "unicorn",
			type_items = "masks"
		}
	}
	self.raidww2_clan_bundle = {}
	self.raidww2_clan_bundle.content = {}
	self.raidww2_clan_bundle.dlc = "has_raidww2_clan"
	self.raidww2_clan_bundle.content.loot_drops = {}
	self.pd2_clan_crimefest_oct19 = {}
	self.pd2_clan_crimefest_oct19.content = {}
	self.pd2_clan_crimefest_oct19.dlc = "has_pd2_clan"
	self.pd2_clan_crimefest_oct19.content.loot_global_value = "pd2_clan"
	self.pd2_clan_crimefest_oct19.content.loot_drops = {
		{
			amount = 1,
			item_entry = "combusto",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "spackle",
			type_items = "masks"
		}
	}
	self.pd2_clan_johnwick = {}
	self.pd2_clan_johnwick.content = {}
	self.pd2_clan_johnwick.dlc = "has_john_wick_character"
	self.pd2_clan_johnwick.content.loot_global_value = "john_wick_character"
	self.pd2_clan_johnwick.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_pis_g26_b_custom",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_g26_body_custom",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_g26_m_contour",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_g26_g_gripforce",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fl_pis_crimson",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_pis_ipsccomp",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_pis_medium_gem",
			type_items = "weapon_mods"
		}
	}
	self.pd2_clan_crimefest_oct23 = {}
	self.pd2_clan_crimefest_oct23.content = {}
	self.pd2_clan_crimefest_oct23.dlc = "has_pd2_clan"
	self.pd2_clan_crimefest_oct23.content.loot_global_value = "pd2_clan"
	self.pd2_clan_crimefest_oct23.content.loot_drops = {
		{
			amount = 1,
			item_entry = "smiley",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "gumbo",
			type_items = "masks"
		}
	}
	self.pd2_clan_lgl = {}
	self.pd2_clan_lgl.content = {}
	self.pd2_clan_lgl.dlc = "has_pd2_clan"
	self.pd2_clan_lgl.content.loot_global_value = "pd2_clan"
	self.pd2_clan_lgl.content.loot_drops = {
		{
			amount = 1,
			item_entry = "crazy_lion",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_s_spas12_folded",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_s_spas12_nostock",
			type_items = "weapon_mods"
		}
	}
	self.pd2_clan_lgl.content.upgrades = {
		"spas12"
	}
	self.pd2_clan_hoxton = {}
	self.pd2_clan_hoxton.content = {}
	self.pd2_clan_hoxton.dlc = "has_pd2_clan"
	self.pd2_clan_hoxton.content.loot_global_value = "pd2_clan"
	self.pd2_clan_hoxton.content.loot_drops = {}
	self.ach_bulldog_1 = {}
	self.ach_bulldog_1.dlc = "has_achievement"
	self.ach_bulldog_1.achievement_id = "bulldog_1"
	self.ach_bulldog_1.content = {}
	self.ach_bulldog_1.content.loot_global_value = "infamous"
	self.ach_bulldog_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "old_hoxton",
			type_items = "masks"
		}
	}
	self.freed_old_hoxton = {}
	self.freed_old_hoxton.dlc = "has_freed_old_hoxton"
	self.freed_old_hoxton.achievement_id = "bulldog_1"
	self.freed_old_hoxton.content = {}
	self.freed_old_hoxton.content.loot_global_value = "pd2_clan"
	self.freed_old_hoxton.content.loot_drops = {}
	self.freed_old_hoxton.content.upgrades = {
		"toothbrush"
	}
	self.crimefest2_u2 = {}
	self.crimefest2_u2.content = {}
	self.crimefest2_u2.free = true
	self.crimefest2_u2.content.loot_global_value = "normal"
	self.crimefest2_u2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "rus_hat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sputnik",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tiara",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "baba_yaga",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "vlad_armor",
			type_items = "masks"
		}
	}
	self.crimefest2_par = {}
	self.crimefest2_par.content = {}
	self.crimefest2_par.free = true
	self.crimefest2_par.content.loot_global_value = "normal"
	self.crimefest2_par.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_bp_lmg_lionbipod",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_par_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_par_s_plastic",
			type_items = "weapon_mods"
		}
	}
	self.crimefest2_rave = {}
	self.crimefest2_rave.content = {}
	self.crimefest2_rave.free = true
	self.crimefest2_rave.content.loot_global_value = "normal"
	self.crimefest2_rave.content.loot_drops = {
		{
			amount = 1,
			item_entry = "lcv",
			type_items = "masks"
		}
	}
	self.crimefest2_u8 = {}
	self.crimefest2_u8.content = {}
	self.crimefest2_u8.free = true
	self.crimefest2_u8.content.loot_global_value = "normal"
	self.crimefest2_u8.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pirate_skull",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "fatboy",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "oliver",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "eggian",
			type_items = "masks"
		}
	}
	self.crimefest2_u9 = {}
	self.crimefest2_u9.content = {}
	self.crimefest2_u9.free = true
	self.crimefest2_u9.content.loot_global_value = "normal"
	self.crimefest2_u9.content.loot_drops = {
		{
			amount = 1,
			item_entry = "groucho_glasses",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "glasses_tinted_love",
			type_items = "masks"
		}
	}
	self.ach_brooklyn_1 = {}
	self.ach_brooklyn_1.dlc = "has_achievement"
	self.ach_brooklyn_1.achievement_id = "brooklyn_1"
	self.ach_brooklyn_1.content = {}
	self.ach_brooklyn_1.content.loot_global_value = "normal"
	self.ach_brooklyn_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "baitface",
			type_items = "masks"
		}
	}
	self.ach_brooklyn_2 = {}
	self.ach_brooklyn_2.dlc = "has_achievement"
	self.ach_brooklyn_2.achievement_id = "brooklyn_2"
	self.ach_brooklyn_2.content = {}
	self.ach_brooklyn_2.content.loot_global_value = "normal"
	self.ach_brooklyn_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "nomegusta",
			type_items = "masks"
		}
	}
	self.ach_brooklyn_3 = {}
	self.ach_brooklyn_3.dlc = "has_achievement"
	self.ach_brooklyn_3.achievement_id = "brooklyn_3"
	self.ach_brooklyn_3.content = {}
	self.ach_brooklyn_3.content.loot_global_value = "normal"
	self.ach_brooklyn_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "rageface",
			type_items = "masks"
		}
	}
	self.ach_brooklyn_4 = {}
	self.ach_brooklyn_4.dlc = "has_achievement"
	self.ach_brooklyn_4.achievement_id = "brooklyn_4"
	self.ach_brooklyn_4.content = {}
	self.ach_brooklyn_4.content.loot_global_value = "normal"
	self.ach_brooklyn_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dawg",
			type_items = "masks"
		}
	}
	self.pd2_clan_bonnie = {}
	self.pd2_clan_bonnie.content = {}
	self.pd2_clan_bonnie.dlc = "has_pd2_clan"
	self.pd2_clan_bonnie.content.loot_global_value = "infamous"
	self.pd2_clan_bonnie.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bonnie",
			type_items = "masks"
		}
	}
	self.preorder = {}
	self.preorder.content = {}
	self.preorder.content_on_consoles = true
	self.preorder.content.loot_drops = {
		{
			amount = 1,
			item_entry = "solid_flat_red",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "solid_flat_black",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "fan",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "skull",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_aimpoint_2",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "cash_preorder",
			type_items = "cash"
		}
	}
	self.preorder.content.upgrades = {
		"player_crime_net_deal"
	}

	if IS_PS4 then
		table.insert(self.preorder.content.loot_drops, {
			amount = 1,
			item_entry = "finger",
			type_items = "masks"
		})
	elseif IS_XB1 then
		table.insert(self.preorder.content.loot_drops, {
			amount = 1,
			item_entry = "instinct",
			type_items = "masks"
		})
	end

	self.cce = {}
	self.cce.content = {}
	self.cce.content.loot_drops = {}
	self.cce.content.upgrades = {
		"player_crime_net_deal_2"
	}
	self.soundtrack = {}
	self.soundtrack.content = {}
	self.soundtrack.content.loot_drops = {}
	self.poetry_soundtrack = {}
	self.poetry_soundtrack.free = true
	self.poetry_soundtrack.dlc = "has_soundtrack_or_cce"
	self.poetry_soundtrack.content = {}
	self.poetry_soundtrack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "metalhead",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tcn",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "surprise",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "optimist_prime",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "blackmetal",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "carbongrid",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "cosmoline",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "electronic",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "deathcube",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "tcn",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "tribalstroke",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "kraken",
			type_items = "textures"
		}
	}
	self.ach_lab_1 = {}
	self.ach_lab_1.dlc = "has_achievement"
	self.ach_lab_1.achievement_id = "lab_1"
	self.ach_lab_1.content = {}
	self.ach_lab_1.content.loot_global_value = "halloween"
	self.ach_lab_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "invader",
			type_items = "masks"
		}
	}
	self.ach_lab_2 = {}
	self.ach_lab_2.dlc = "has_achievement"
	self.ach_lab_2.achievement_id = "lab_2"
	self.ach_lab_2.content = {}
	self.ach_lab_2.content.loot_global_value = "halloween"
	self.ach_lab_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "satan",
			type_items = "masks"
		}
	}
	self.free_halloween_textures = {}
	self.free_halloween_textures.free = true
	self.free_halloween_textures.content = {}
	self.free_halloween_textures.content.loot_global_value = "halloween"
	self.free_halloween_textures.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pumpgrin",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "shout",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "webbed",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "hannibalistic",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "stitches",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "doomweaver",
			type_items = "textures"
		}
	}
	self.halloween_nightmare_1 = {}
	self.halloween_nightmare_1.dlc = "has_achievement"
	self.halloween_nightmare_1.achievement_id = "halloween_nightmare_1"
	self.halloween_nightmare_1.content = {}
	self.halloween_nightmare_1.content.loot_global_value = "halloween"
	self.halloween_nightmare_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "baby_happy",
			type_items = "masks"
		}
	}
	self.halloween_nightmare_2 = {}
	self.halloween_nightmare_2.dlc = "has_achievement"
	self.halloween_nightmare_2.achievement_id = "halloween_nightmare_2"
	self.halloween_nightmare_2.content = {}
	self.halloween_nightmare_2.content.loot_global_value = "halloween"
	self.halloween_nightmare_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "brazil_baby",
			type_items = "masks"
		}
	}
	self.halloween_nightmare_3 = {}
	self.halloween_nightmare_3.dlc = "has_achievement"
	self.halloween_nightmare_3.achievement_id = "halloween_nightmare_3"
	self.halloween_nightmare_3.content = {}
	self.halloween_nightmare_3.content.loot_global_value = "halloween"
	self.halloween_nightmare_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "baby_angry",
			type_items = "masks"
		}
	}
	self.halloween_nightmare_4 = {}
	self.halloween_nightmare_4.dlc = "has_achievement"
	self.halloween_nightmare_4.achievement_id = "halloween_nightmare_4"
	self.halloween_nightmare_4.content = {}
	self.halloween_nightmare_4.content.loot_global_value = "halloween"
	self.halloween_nightmare_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "baby_cry",
			type_items = "masks"
		}
	}
	self.armored_transport = {}
	self.armored_transport.content = {}
	self.armored_transport.content.loot_drops = {
		{
			{
				amount = 1,
				item_entry = "clinton",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "bush",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "obama",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "nixon",
				type_items = "masks"
			}
		},
		{
			{
				amount = 1,
				item_entry = "cash",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "jade",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "redwhiteblue",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "marble",
				type_items = "materials"
			}
		},
		{
			{
				amount = 1,
				item_entry = "racestripes",
				type_items = "textures"
			},
			{
				amount = 1,
				item_entry = "americaneagle",
				type_items = "textures"
			},
			{
				amount = 1,
				item_entry = "stars",
				type_items = "textures"
			},
			{
				amount = 1,
				item_entry = "forestcamo",
				type_items = "textures"
			}
		}
	}
	self.armored_transport.content.upgrades = {
		"m45",
		"s552",
		"ppk"
	}
	self.armored_transport_intel = {}
	self.armored_transport_intel.dlc = "has_armored_transport_and_intel"
	self.armored_transport_intel.achievement_id = "armored_2"
	self.armored_transport_intel.content = {}
	self.armored_transport_intel.content.loot_drops = {}
	self.gage_pack = {}
	self.gage_pack.content = {}
	self.gage_pack.content.loot_drops = {
		{
			amount = 5,
			item_entry = "wpn_fps_upg_i_singlefire",
			type_items = "weapon_mods"
		},
		{
			amount = 5,
			item_entry = "wpn_fps_upg_i_autofire",
			type_items = "weapon_mods"
		},
		{
			{
				amount = 1,
				item_entry = "goat",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "panda",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "pitbull",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "eagle",
				type_items = "masks"
			}
		},
		{
			{
				amount = 1,
				item_entry = "fur",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "galvanized",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "heavymetal",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "oilmetal",
				type_items = "materials"
			}
		},
		{
			{
				amount = 1,
				item_entry = "army",
				type_items = "textures"
			},
			{
				amount = 1,
				item_entry = "commando",
				type_items = "textures"
			},
			{
				amount = 1,
				item_entry = "hunter",
				type_items = "textures"
			},
			{
				amount = 1,
				item_entry = "digitalcamo",
				type_items = "textures"
			}
		}
	}
	self.gage_pack.content.upgrades = {
		"mp7",
		"scar",
		"p226"
	}
	self.gage_pack_shotgun_free = {}
	self.gage_pack_shotgun_free.free = true
	self.gage_pack_shotgun_free.content = {}
	self.gage_pack_shotgun_free.content.loot_global_value = "normal"
	self.gage_pack_shotgun_free.content.loot_drops = {
		{
			amount = 2,
			item_entry = "wpn_fps_upg_a_custom_free",
			type_items = "weapon_mods"
		}
	}
	self.gage_pack_shotgun = {}
	self.gage_pack_shotgun.content = {}
	self.gage_pack_shotgun.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_slug",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_custom",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_explosive",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_piercing",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage4_2 = {}
	self.ach_gage4_2.dlc = "has_achievement"
	self.ach_gage4_2.achievement_id = "gage4_2"
	self.ach_gage4_2.content = {}
	self.ach_gage4_2.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_mbus_rear",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage4_4 = {}
	self.ach_gage4_4.dlc = "has_achievement"
	self.ach_gage4_4.achievement_id = "gage4_4"
	self.ach_gage4_4.content = {}
	self.ach_gage4_4.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mandril",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "explosive",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "terror",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ben_b_short",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage4_5 = {}
	self.ach_gage4_5.dlc = "has_achievement"
	self.ach_gage4_5.achievement_id = "gage4_5"
	self.ach_gage4_5.content = {}
	self.ach_gage4_5.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ben_b_long",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage4_6 = {}
	self.ach_gage4_6.dlc = "has_achievement"
	self.ach_gage4_6.achievement_id = "gage4_6"
	self.ach_gage4_6.content = {}
	self.ach_gage4_6.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ben_s_collapsed",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage4_7 = {}
	self.ach_gage4_7.dlc = "has_achievement"
	self.ach_gage4_7.achievement_id = "gage4_7"
	self.ach_gage4_7.content = {}
	self.ach_gage4_7.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_7.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ksg_b_short",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage4_8 = {}
	self.ach_gage4_8.dlc = "has_achievement"
	self.ach_gage4_8.achievement_id = "gage4_8"
	self.ach_gage4_8.content = {}
	self.ach_gage4_8.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_8.content.loot_drops = {
		{
			amount = 1,
			item_entry = "skullmonkey",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "leaf",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "monkeyskull",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ksg_b_long",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage4_9 = {}
	self.ach_gage4_9.dlc = "has_achievement"
	self.ach_gage4_9.achievement_id = "gage4_9"
	self.ach_gage4_9.content = {}
	self.ach_gage4_9.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_9.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ben_s_solid",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage4_10 = {}
	self.ach_gage4_10.dlc = "has_achievement"
	self.ach_gage4_10.achievement_id = "gage4_10"
	self.ach_gage4_10.content = {}
	self.ach_gage4_10.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_10.content.loot_drops = {
		{
			amount = 1,
			item_entry = "silverback",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sparks",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "chief",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_striker_b_long",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage4_11 = {}
	self.ach_gage4_11.dlc = "has_achievement"
	self.ach_gage4_11.achievement_id = "gage4_11"
	self.ach_gage4_11.content = {}
	self.ach_gage4_11.content.loot_global_value = "gage_pack_shotgun"
	self.ach_gage4_11.content.loot_drops = {
		{
			amount = 1,
			item_entry = "orangutang",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bananapeel",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "banana",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_striker_b_suppressed",
			type_items = "weapon_mods"
		}
	}
	self.gage_pack_assault = {}
	self.gage_pack_assault.content = {}
	self.gage_pack_assault.content.loot_drops = {}
	self.ach_gage5_1 = {}
	self.ach_gage5_1.dlc = "has_achievement"
	self.ach_gage5_1.achievement_id = "gage5_1"
	self.ach_gage5_1.content = {}
	self.ach_gage5_1.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "evil",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_b_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_fg_psg",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_g_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_s_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_fg_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_g_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_b_sniper",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage5_2 = {}
	self.ach_gage5_2.dlc = "has_achievement"
	self.ach_gage5_2.achievement_id = "gage5_2"
	self.ach_gage5_2.content = {}
	self.ach_gage5_2.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "crowgoblin",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_gre_m79_stock_short",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage5_3 = {}
	self.ach_gage5_3.dlc = "has_achievement"
	self.ach_gage5_3.achievement_id = "gage5_3"
	self.ach_gage5_3.content = {}
	self.ach_gage5_3.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_fg_mar",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_plastic",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage5_4 = {}
	self.ach_gage5_4.dlc = "has_achievement"
	self.ach_gage5_4.achievement_id = "gage5_4"
	self.ach_gage5_4.content = {}
	self.ach_gage5_4.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "evil",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "vicious",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_fg_retro_plastic",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_light",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_b_short",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage5_5 = {}
	self.ach_gage5_5.dlc = "has_achievement"
	self.ach_gage5_5.achievement_id = "gage5_5"
	self.ach_gage5_5.content = {}
	self.ach_gage5_5.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bone",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "muerte",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_gre_m79_barrel_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_wood",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage5_6 = {}
	self.ach_gage5_6.dlc = "has_achievement"
	self.ach_gage5_6.achievement_id = "gage5_6"
	self.ach_gage5_6.content = {}
	self.ach_gage5_6.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "void",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "death",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_fg_railed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_fg_sar",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage5_7 = {}
	self.ach_gage5_7.dlc = "has_achievement"
	self.ach_gage5_7.achievement_id = "gage5_7"
	self.ach_gage5_7.content = {}
	self.ach_gage5_7.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_7.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_fg_retro",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_g_retro",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_s_wood",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage5_8 = {}
	self.ach_gage5_8.dlc = "has_achievement"
	self.ach_gage5_8.achievement_id = "gage5_8"
	self.ach_gage5_8.content = {}
	self.ach_gage5_8.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_8.content.loot_drops = {
		{
			amount = 1,
			item_entry = "frost",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "emperor",
			type_items = "textures"
		}
	}
	self.ach_gage5_9 = {}
	self.ach_gage5_9.dlc = "has_achievement"
	self.ach_gage5_9.achievement_id = "gage5_9"
	self.ach_gage5_9.content = {}
	self.ach_gage5_9.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_9.content.loot_drops = {
		{
			amount = 1,
			item_entry = "volt",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_fg_fab",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_fab",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_skeletal",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage5_10 = {}
	self.ach_gage5_10.dlc = "has_achievement"
	self.ach_gage5_10.achievement_id = "gage5_10"
	self.ach_gage5_10.content = {}
	self.ach_gage5_10.content.loot_global_value = "gage_pack_assault"
	self.ach_gage5_10.content.loot_drops = {
		{
			amount = 1,
			item_entry = "galax",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_g_retro",
			type_items = "weapon_mods"
		}
	}
	self.gage_pack_lmg = {}
	self.gage_pack_lmg.content = {}
	self.gage_pack_lmg.content.loot_drops = {
		{
			{
				amount = 1,
				item_entry = "cloth_commander",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "gage_blade",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "gage_rambo",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "gage_deltaforce",
				type_items = "masks"
			}
		},
		{
			{
				amount = 1,
				item_entry = "gunmetal",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "mud",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "splinter",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "erdl",
				type_items = "materials"
			}
		},
		{
			{
				amount = 1,
				item_entry = "styx",
				type_items = "textures"
			},
			{
				amount = 1,
				item_entry = "fingerpaint",
				type_items = "textures"
			},
			{
				amount = 1,
				item_entry = "fighter",
				type_items = "textures"
			},
			{
				amount = 1,
				item_entry = "warrior",
				type_items = "textures"
			}
		}
	}
	self.gage_pack_lmg.content.upgrades = {
		"rpk",
		"kabar"
	}
	self.gage_pack_snp = {}
	self.gage_pack_snp.content = {}
	self.gage_pack_snp.content.loot_drops = {}
	self.gage_pack_snp.content.upgrades = {}
	self.ach_gage3_3 = {}
	self.ach_gage3_3.dlc = "has_achievement"
	self.ach_gage3_3.achievement_id = "gage3_3"
	self.ach_gage3_3.content = {}
	self.ach_gage3_3.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "robberfly",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "carapace",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "bugger",
			type_items = "textures"
		}
	}
	self.ach_gage3_4 = {}
	self.ach_gage3_4.dlc = "has_achievement"
	self.ach_gage3_4.achievement_id = "gage3_4"
	self.ach_gage3_4.content = {}
	self.ach_gage3_4.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "spider",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "insectoid",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "spidereyes",
			type_items = "textures"
		}
	}
	self.ach_gage3_5 = {}
	self.ach_gage3_5.dlc = "has_achievement"
	self.ach_gage3_5.achievement_id = "gage3_5"
	self.ach_gage3_5.content = {}
	self.ach_gage3_5.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wasp",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bugshell",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "venomous",
			type_items = "textures"
		}
	}
	self.ach_gage3_6 = {}
	self.ach_gage3_6.dlc = "has_achievement"
	self.ach_gage3_6.achievement_id = "gage3_6"
	self.ach_gage3_6.content = {}
	self.ach_gage3_6.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mantis",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "hardshell",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "wingsofdeath",
			type_items = "textures"
		}
	}
	self.ach_gage3_7 = {}
	self.ach_gage3_7.dlc = "has_achievement"
	self.ach_gage3_7.achievement_id = "gage3_7"
	self.ach_gage3_7.content = {}
	self.ach_gage3_7.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_7.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_m95_barrel_long",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_8 = {}
	self.ach_gage3_8.dlc = "has_achievement"
	self.ach_gage3_8.achievement_id = "gage3_8"
	self.ach_gage3_8.content = {}
	self.ach_gage3_8.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_8.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_r93_b_suppressed",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_9 = {}
	self.ach_gage3_9.dlc = "has_achievement"
	self.ach_gage3_9.achievement_id = "gage3_9"
	self.ach_gage3_9.content = {}
	self.ach_gage3_9.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_9.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_45iron",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_10 = {}
	self.ach_gage3_10.dlc = "has_achievement"
	self.ach_gage3_10.achievement_id = "gage3_10"
	self.ach_gage3_10.content = {}
	self.ach_gage3_10.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_10.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_r93_b_short",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_11 = {}
	self.ach_gage3_11.dlc = "has_achievement"
	self.ach_gage3_11.achievement_id = "gage3_11"
	self.ach_gage3_11.content = {}
	self.ach_gage3_11.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_11.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_m95_barrel_suppressed",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_12 = {}
	self.ach_gage3_12.dlc = "has_achievement"
	self.ach_gage3_12.achievement_id = "gage3_12"
	self.ach_gage3_12.content = {}
	self.ach_gage3_12.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_12.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_m95_barrel_short",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_13 = {}
	self.ach_gage3_13.dlc = "has_achievement"
	self.ach_gage3_13.achievement_id = "gage3_13"
	self.ach_gage3_13.content = {}
	self.ach_gage3_13.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_13.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_leupold",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_14 = {}
	self.ach_gage3_14.dlc = "has_achievement"
	self.ach_gage3_14.achievement_id = "gage3_14"
	self.ach_gage3_14.content = {}
	self.ach_gage3_14.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_14.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_msr_body_msr",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_15 = {}
	self.ach_gage3_15.dlc = "has_achievement"
	self.ach_gage3_15.achievement_id = "gage3_15"
	self.ach_gage3_15.content = {}
	self.ach_gage3_15.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_15.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_r93_body_wood",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_16 = {}
	self.ach_gage3_16.dlc = "has_achievement"
	self.ach_gage3_16.achievement_id = "gage3_16"
	self.ach_gage3_16.content = {}
	self.ach_gage3_16.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_16.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_msr_ns_suppressor",
			type_items = "weapon_mods"
		}
	}
	self.ach_gage3_17 = {}
	self.ach_gage3_17.dlc = "has_achievement"
	self.ach_gage3_17.achievement_id = "gage3_17"
	self.ach_gage3_17.content = {}
	self.ach_gage3_17.content.loot_global_value = "gage_pack_snp"
	self.ach_gage3_17.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_msr_b_long",
			type_items = "weapon_mods"
		}
	}
	self.big_bank = {}
	self.big_bank.content = {}
	self.big_bank.content.loot_drops = {}
	self.ach_bigbank_1 = {}
	self.ach_bigbank_1.dlc = "has_achievement"
	self.ach_bigbank_1.achievement_id = "bigbank_1"
	self.ach_bigbank_1.content = {}
	self.ach_bigbank_1.content.loot_global_value = "big_bank"
	self.ach_bigbank_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "franklin",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "parchment",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "roman",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_g_01",
			type_items = "weapon_mods"
		}
	}
	self.ach_bigbank_2 = {}
	self.ach_bigbank_2.dlc = "has_achievement"
	self.ach_bigbank_2.achievement_id = "bigbank_2"
	self.ach_bigbank_2.content = {}
	self.ach_bigbank_2.content.loot_global_value = "big_bank"
	self.ach_bigbank_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "washington",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "old",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "ruler",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_m_01",
			type_items = "weapon_mods"
		}
	}
	self.ach_bigbank_3 = {}
	self.ach_bigbank_3.dlc = "has_achievement"
	self.ach_bigbank_3.achievement_id = "bigbank_3"
	self.ach_bigbank_3.content = {}
	self.ach_bigbank_3.content.loot_global_value = "big_bank"
	self.ach_bigbank_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "lincoln",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "clay",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "spartan",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_fg_04",
			type_items = "weapon_mods"
		}
	}
	self.ach_bigbank_4 = {}
	self.ach_bigbank_4.dlc = "has_achievement"
	self.ach_bigbank_4.achievement_id = "bigbank_4"
	self.ach_bigbank_4.content = {}
	self.ach_bigbank_4.content.loot_global_value = "big_bank"
	self.ach_bigbank_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_fg_wood",
			type_items = "weapon_mods"
		}
	}
	self.ach_bigbank_5 = {}
	self.ach_bigbank_5.dlc = "has_achievement"
	self.ach_bigbank_5.achievement_id = "bigbank_5"
	self.ach_bigbank_5.content = {}
	self.ach_bigbank_5.content.loot_global_value = "big_bank"
	self.ach_bigbank_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_s_01",
			type_items = "weapon_mods"
		}
	}
	self.ach_bigbank_6 = {}
	self.ach_bigbank_6.dlc = "has_achievement"
	self.ach_bigbank_6.achievement_id = "bigbank_6"
	self.ach_bigbank_6.content = {}
	self.ach_bigbank_6.content.loot_global_value = "big_bank"
	self.ach_bigbank_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "grant",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "gemstone",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "wargod",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_s_wood",
			type_items = "weapon_mods"
		}
	}
	self.ach_bigbank_7 = {}
	self.ach_bigbank_7.dlc = "has_achievement"
	self.ach_bigbank_7.achievement_id = "bigbank_7"
	self.ach_bigbank_7.content = {}
	self.ach_bigbank_7.content.loot_global_value = "big_bank"
	self.ach_bigbank_7.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_fg_01",
			type_items = "weapon_mods"
		}
	}
	self.ach_bigbank_8 = {}
	self.ach_bigbank_8.dlc = "has_achievement"
	self.ach_bigbank_8.achievement_id = "bigbank_8"
	self.ach_bigbank_8.content = {}
	self.ach_bigbank_8.content.loot_global_value = "big_bank"
	self.ach_bigbank_8.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_fg_03",
			type_items = "weapon_mods"
		}
	}
	self.ach_bigbank_10 = {}
	self.ach_bigbank_10.dlc = "has_achievement"
	self.ach_bigbank_10.achievement_id = "bigbank_10"
	self.ach_bigbank_10.content = {}
	self.ach_bigbank_10.content.loot_global_value = "big_bank"
	self.ach_bigbank_10.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_s_03",
			type_items = "weapon_mods"
		}
	}
	self.skull_mask_1 = {}
	self.skull_mask_1.dlc = "has_achievement"
	self.skull_mask_1.achievement_id = "death_27"
	self.skull_mask_1.content = {}
	self.skull_mask_1.content.loot_global_value = "infamous"
	self.skull_mask_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "skullhard",
			type_items = "masks"
		}
	}
	self.skull_mask_2 = {}
	self.skull_mask_2.dlc = "has_achievement"
	self.skull_mask_2.achievement_id = "death_28"
	self.skull_mask_2.content = {}
	self.skull_mask_2.content.loot_global_value = "infamous"
	self.skull_mask_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "skullveryhard",
			type_items = "masks"
		}
	}
	self.skull_mask_3 = {}
	self.skull_mask_3.dlc = "has_achievement"
	self.skull_mask_3.achievement_id = "death_29"
	self.skull_mask_3.content = {}
	self.skull_mask_3.content.loot_global_value = "infamous"
	self.skull_mask_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "skulloverkill",
			type_items = "masks"
		}
	}
	self.skull_mask_31 = {}
	self.skull_mask_31.dlc = "has_achievement"
	self.skull_mask_31.achievement_id = "pick_66"
	self.skull_mask_31.content = {}
	self.skull_mask_31.content.loot_global_value = "infamous"
	self.skull_mask_31.content.loot_drops = {
		{
			amount = 1,
			item_entry = "gitgud_e_wish",
			type_items = "masks"
		}
	}
	self.skull_mask_4 = {}
	self.skull_mask_4.dlc = "has_achievement"
	self.skull_mask_4.achievement_id = "death_30"
	self.skull_mask_4.content = {}
	self.skull_mask_4.content.loot_global_value = "infamous"
	self.skull_mask_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "skulloverkillplus",
			type_items = "masks"
		}
	}
	self.skull_mask_41 = {}
	self.skull_mask_41.dlc = "has_achievement"
	self.skull_mask_41.achievement_id = "axe_66"
	self.skull_mask_41.content = {}
	self.skull_mask_41.content.loot_global_value = "infamous"
	self.skull_mask_41.content.loot_drops = {
		{
			amount = 1,
			item_entry = "gitgud_sm_wish",
			type_items = "masks"
		}
	}
	self.charliesierra = {}
	self.charliesierra.free = true
	self.charliesierra.content = {}
	self.charliesierra.content.loot_global_value = "normal"
	self.charliesierra.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_acog",
			type_items = "weapon_mods"
		}
	}
	self.xmas_soundtrack = {}
	self.xmas_soundtrack.free = true
	self.xmas_soundtrack.content = {}
	self.xmas_soundtrack.content.loot_global_value = "xmas_soundtrack"
	self.xmas_soundtrack.content.loot_drops = {
		{
			{
				amount = 1,
				item_entry = "santa_mad",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "santa_drunk",
				type_items = "masks"
			},
			{
				amount = 1,
				item_entry = "santa_surprise",
				type_items = "masks"
			}
		}
	}
	self.gage_pack_jobs = {}
	self.gage_pack_jobs = {}
	self.gage_pack_jobs.content = {}
	self.gage_pack_jobs.content.loot_drops = {}
	self.kosugi_4 = {}
	self.kosugi_4.dlc = "has_achievement"
	self.kosugi_4.achievement_id = "kosugi_4"
	self.kosugi_4.content = {}
	self.kosugi_4.content.loot_global_value = "infamous"
	self.kosugi_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "samurai",
			type_items = "masks"
		}
	}
	self.twitch_pack = {}
	self.twitch_pack.content = {}
	self.twitch_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "twitch_orc",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ancient",
			type_items = "masks"
		}
	}
	self.twitch_pack2 = {}
	self.twitch_pack2.dlc = "has_twitch_pack"
	self.twitch_pack2.content = {}
	self.twitch_pack2.content.loot_global_value = "twitch_pack"
	self.twitch_pack2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "twitch_orc",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ancient",
			type_items = "masks"
		}
	}
	self.humble_pack2 = {}
	self.humble_pack2.content = {}
	self.humble_pack2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "the_one_below",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "lycan",
			type_items = "masks"
		}
	}
	self.humble_pack3 = {}
	self.humble_pack3.content = {}
	self.humble_pack3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "titan",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "pokachu",
			type_items = "masks"
		}
	}
	self.humble_pack4 = {}
	self.humble_pack4.content = {}
	self.humble_pack4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "moon",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "borsuk",
			type_items = "masks"
		}
	}
	self.e3_s15a = {}
	self.e3_s15a.content = {}
	self.e3_s15a.content.loot_drops = {
		{
			amount = 1,
			item_entry = "card_jack",
			type_items = "masks"
		}
	}
	self.e3_s15b = {}
	self.e3_s15b.content = {}
	self.e3_s15b.content.loot_drops = {
		{
			amount = 1,
			item_entry = "card_queen",
			type_items = "masks"
		}
	}
	self.e3_s15c = {}
	self.e3_s15c.content = {}
	self.e3_s15c.content.loot_drops = {
		{
			amount = 1,
			item_entry = "card_king",
			type_items = "masks"
		}
	}
	self.e3_s15d = {}
	self.e3_s15d.content = {}
	self.e3_s15d.content.loot_drops = {
		{
			amount = 1,
			item_entry = "card_joker",
			type_items = "masks"
		}
	}
	self.sweettooth = {}
	self.sweettooth.content = {}
	self.sweettooth.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sweettooth",
			type_items = "masks"
		}
	}
	self.hl_miami = {}
	self.hl_miami.content = {}
	self.hl_miami.content.loot_drops = {}
	self.hlm_game = {}
	self.hlm_game.dlc = "has_hlm_game"
	self.hlm_game.content = {}
	self.hlm_game.content.loot_drops = {
		{
			amount = 1,
			item_entry = "rooster",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tiger",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "panther",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "horse",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "neon",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hatred",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "cushion",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "rug",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "uglyrug",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "hotline",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "leopard",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "shutupandbleed",
			type_items = "textures"
		}
	}
	self.hlm_game.content.upgrades = {
		"briefcase"
	}
	self.ach_miami_2 = {}
	self.ach_miami_2.dlc = "has_achievement"
	self.ach_miami_2.achievement_id = "pig_2"
	self.ach_miami_2.content = {}
	self.ach_miami_2.content.loot_global_value = "hl_miami"
	self.ach_miami_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "owl",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "chromescape",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "palmtrees",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_uzi_fg_rail",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_uzi_s_leather",
			type_items = "weapon_mods"
		}
	}
	self.ach_miami_3 = {}
	self.ach_miami_3.dlc = "has_achievement"
	self.ach_miami_3.achievement_id = "pig_3"
	self.ach_miami_3.content = {}
	self.ach_miami_3.content.loot_global_value = "hl_miami"
	self.ach_miami_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "white_wolf",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "rubber",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hiptobepolygon",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_uzi_s_solid",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_scorpion_g_wood",
			type_items = "weapon_mods"
		}
	}
	self.ach_miami_4 = {}
	self.ach_miami_4.dlc = "has_achievement"
	self.ach_miami_4.achievement_id = "pig_4"
	self.ach_miami_4.content = {}
	self.ach_miami_4.content.loot_global_value = "hl_miami"
	self.ach_miami_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "rabbit",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "error",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "bsomebody",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_tec9_ns_ext",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_tec9_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_tec9_s_unfolded",
			type_items = "weapon_mods"
		}
	}
	self.ach_miami_5 = {}
	self.ach_miami_5.dlc = "has_achievement"
	self.ach_miami_5.achievement_id = "pig_5"
	self.ach_miami_5.content = {}
	self.ach_miami_5.content.loot_global_value = "hl_miami"
	self.ach_miami_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_smg_uzi_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_uzi_s_standard",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_scorpion_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_scorpion_s_nostock",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_tec9_b_standard",
			type_items = "weapon_mods"
		}
	}
	self.ach_miami_7 = {}
	self.ach_miami_7.dlc = "has_achievement"
	self.ach_miami_7.achievement_id = "pig_7"
	self.ach_miami_7.content = {}
	self.ach_miami_7.content.loot_global_value = "hl_miami"
	self.ach_miami_7.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pig",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sunset",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "doodles",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_scorpion_g_ergo",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_scorpion_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_scorpion_s_unfolded",
			type_items = "weapon_mods"
		}
	}
	self.ach_eagle_1 = {}
	self.ach_eagle_1.dlc = "has_achievement"
	self.ach_eagle_1.achievement_id = "eagle_1"
	self.ach_eagle_1.content = {}
	self.ach_eagle_1.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "de_gaulle",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "gunsmoke",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "dazzle",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_b_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_b_standard",
			type_items = "weapon_mods"
		}
	}
	self.ach_eagle_2 = {}
	self.ach_eagle_2.dlc = "has_achievement"
	self.ach_eagle_2.achievement_id = "eagle_2"
	self.ach_eagle_2.content = {}
	self.ach_eagle_2.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "red_hurricane",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "redsun",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "deathdealer",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_b_e11",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_nozzle",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_sight",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_m_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_s_folded",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_s_nostock",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_s_solid",
			type_items = "weapon_mods"
		}
	}
	self.ach_eagle_3 = {}
	self.ach_eagle_3.dlc = "has_achievement"
	self.ach_eagle_3.achievement_id = "eagle_3"
	self.ach_eagle_3.content = {}
	self.ach_eagle_3.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_body_black",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_m_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_mg42_b_vg38",
			type_items = "weapon_mods"
		}
	}
	self.ach_eagle_4 = {}
	self.ach_eagle_4.dlc = "has_achievement"
	self.ach_eagle_4.achievement_id = "eagle_4"
	self.ach_eagle_4.content = {}
	self.ach_eagle_4.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "churchill",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "armygreen",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "filthythirteen",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_s_solid",
			type_items = "weapon_mods"
		}
	}
	self.ach_eagle_5 = {}
	self.ach_eagle_5.dlc = "has_achievement"
	self.ach_eagle_5.achievement_id = "eagle_5"
	self.ach_eagle_5.content = {}
	self.ach_eagle_5.content.loot_global_value = "gage_pack_historical"
	self.ach_eagle_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "patton",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "patriot",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "captainwar",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_mg42_b_mg34",
			type_items = "weapon_mods"
		}
	}
	self.gage_pack_historical = {}
	self.gage_pack_historical.content = {}
	self.gage_pack_historical.content.loot_global_value = "gage_pack_historical"
	self.gage_pack_historical.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_ns_bayonet",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_iron_sight",
			type_items = "weapon_mods"
		}
	}
	self.gage_pack_historical.content.upgrades = {
		"swagger"
	}
	self.alienware_alpha = {}
	self.alienware_alpha.dlc = "alienware_alpha"
	self.alienware_alpha.content = {}
	self.alienware_alpha.content.loot_drops = {
		{
			amount = 1,
			item_entry = "area51",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "alien_helmet",
			type_items = "masks"
		}
	}
	self.alienware_alpha_promo = {}
	self.alienware_alpha_promo.content = {}
	self.alienware_alpha_promo.content.loot_drops = {}
	self.alienware_alpha_promo.content.upgrades = {
		"alien_maul"
	}
	self.goty_weapon_bundle_2014 = {}
	self.goty_weapon_bundle_2014.dlc = "has_goty_weapon_bundle_2014"
	self.goty_weapon_bundle_2014.content = {}
	self.goty_weapon_bundle_2014.content.loot_drops = {
		{
			amount = 1,
			item_entry = "robo_arnold",
			type_items = "masks"
		}
	}
	self.goty_heist_bundle_2014 = {}
	self.goty_heist_bundle_2014.dlc = "has_goty_heist_bundle_2014"
	self.goty_heist_bundle_2014.content = {}
	self.goty_heist_bundle_2014.content.loot_drops = {
		{
			amount = 1,
			item_entry = "nun_town",
			type_items = "masks"
		}
	}
	self.goty_dlc_bundle_2014 = {}
	self.goty_dlc_bundle_2014.dlc = "has_goty_all_dlc_bundle_2014"
	self.goty_dlc_bundle_2014.content = {}
	self.goty_dlc_bundle_2014.content.loot_drops = {
		{
			amount = 1,
			item_entry = "arch_nemesis",
			type_items = "masks"
		}
	}
	self.ach_deer_1 = {}
	self.ach_deer_1.dlc = "has_achievement"
	self.ach_deer_1.achievement_id = "deer_1"
	self.ach_deer_1.content = {}
	self.ach_deer_1.content.loot_global_value = "normal"
	self.ach_deer_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mrs_claus",
			type_items = "masks"
		}
	}
	self.ach_deer_2 = {}
	self.ach_deer_2.dlc = "has_achievement"
	self.ach_deer_2.achievement_id = "deer_2"
	self.ach_deer_2.content = {}
	self.ach_deer_2.content.loot_global_value = "normal"
	self.ach_deer_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "strinch",
			type_items = "masks"
		}
	}
	self.ach_deer_3 = {}
	self.ach_deer_3.dlc = "has_achievement"
	self.ach_deer_3.achievement_id = "deer_3"
	self.ach_deer_3.content = {}
	self.ach_deer_3.content.loot_global_value = "normal"
	self.ach_deer_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "krampus",
			type_items = "masks"
		}
	}
	self.ach_deer_4 = {}
	self.ach_deer_4.dlc = "has_achievement"
	self.ach_deer_4.achievement_id = "deer_4"
	self.ach_deer_4.content = {}
	self.ach_deer_4.content.loot_global_value = "normal"
	self.ach_deer_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "robo_santa",
			type_items = "masks"
		}
	}
	self.ach_deer_6 = {}
	self.ach_deer_6.dlc = "has_achievement"
	self.ach_deer_6.achievement_id = "deer_6"
	self.ach_deer_6.content = {}
	self.ach_deer_6.content.loot_global_value = "normal"
	self.ach_deer_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "almirs_beard",
			type_items = "masks"
		}
	}
	self.character_pack_clover = {}
	self.character_pack_clover.content = {}
	self.character_pack_clover.content.loot_drops = {
		{
			amount = 1,
			item_entry = "msk_grizel",
			type_items = "masks"
		},
		{
			{
				amount = 1,
				item_entry = "wpn_fps_ass_l85a2_m_emag",
				type_items = "weapon_mods"
			},
			{
				amount = 1,
				item_entry = "wpn_fps_ass_l85a2_fg_short",
				type_items = "weapon_mods"
			},
			{
				amount = 1,
				item_entry = "wpn_fps_ass_l85a2_g_worn",
				type_items = "weapon_mods"
			},
			{
				amount = 1,
				item_entry = "wpn_fps_ass_l85a2_b_long",
				type_items = "weapon_mods"
			},
			{
				amount = 1,
				item_entry = "wpn_fps_ass_l85a2_b_short",
				type_items = "weapon_mods"
			}
		}
	}
	self.hope_diamond = {}
	self.hope_diamond.content = {}
	self.hope_diamond.content.loot_drops = {}
	self.ach_bat_2 = {}
	self.ach_bat_2.dlc = "has_achievement"
	self.ach_bat_2.achievement_id = "bat_2"
	self.ach_bat_2.content = {}
	self.ach_bat_2.content.loot_global_value = "hope_diamond"
	self.ach_bat_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "cursed_crown",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sand",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hieroglyphs",
			type_items = "textures"
		}
	}
	self.ach_bat_3 = {}
	self.ach_bat_3.dlc = "has_achievement"
	self.ach_bat_3.achievement_id = "bat_3"
	self.ach_bat_3.content = {}
	self.ach_bat_3.content.loot_global_value = "hope_diamond"
	self.ach_bat_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "medusa",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "rust",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "runes",
			type_items = "textures"
		}
	}
	self.ach_bat_4 = {}
	self.ach_bat_4.dlc = "has_achievement"
	self.ach_bat_4.achievement_id = "bat_4"
	self.ach_bat_4.content = {}
	self.ach_bat_4.content.loot_global_value = "hope_diamond"
	self.ach_bat_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pazuzu",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "diamond",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "horus",
			type_items = "textures"
		}
	}
	self.ach_bat_6 = {}
	self.ach_bat_6.dlc = "has_achievement"
	self.ach_bat_6.achievement_id = "bat_6"
	self.ach_bat_6.content = {}
	self.ach_bat_6.content.loot_global_value = "hope_diamond"
	self.ach_bat_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "anubis",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bandages",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hawkhelm",
			type_items = "textures"
		}
	}
	self.the_bomb = {}
	self.the_bomb.content = {}
	self.the_bomb.content.loot_drops = {}
	self.ach_cow_3 = {}
	self.ach_cow_3.dlc = "has_achievement"
	self.ach_cow_3.achievement_id = "cow_3"
	self.ach_cow_3.content = {}
	self.ach_cow_3.content.loot_global_value = "the_bomb"
	self.ach_cow_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "butcher",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "meat",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "cro_pattern_4",
			type_items = "textures"
		}
	}
	self.ach_cow_4 = {}
	self.ach_cow_4.dlc = "has_achievement"
	self.ach_cow_4.achievement_id = "cow_4"
	self.ach_cow_4.content = {}
	self.ach_cow_4.content.loot_global_value = "the_bomb"
	self.ach_cow_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "tech_lion",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "rock_marble",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "cro_pattern_3",
			type_items = "textures"
		}
	}
	self.ach_cow_5 = {}
	self.ach_cow_5.dlc = "has_achievement"
	self.ach_cow_5.achievement_id = "cow_5"
	self.ach_cow_5.content = {}
	self.ach_cow_5.content.loot_global_value = "the_bomb"
	self.ach_cow_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "doctor",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "plywood",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "cro_pattern_1",
			type_items = "textures"
		}
	}
	self.ach_cow_8 = {}
	self.ach_cow_8.dlc = "has_achievement"
	self.ach_cow_8.achievement_id = "cow_8"
	self.ach_cow_8.content = {}
	self.ach_cow_8.content.loot_global_value = "the_bomb"
	self.ach_cow_8.content.loot_drops = {
		{
			amount = 1,
			item_entry = "lady_butcher",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "rhino_skin",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "cro_pattern_2",
			type_items = "textures"
		}
	}
	self.ach_cow_9 = {}
	self.ach_cow_9.dlc = "has_achievement"
	self.ach_cow_9.achievement_id = "cow_9"
	self.ach_cow_9.content = {}
	self.ach_cow_9.content.loot_global_value = "the_bomb"
	self.ach_cow_9.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_pis_hs2000_m_extended",
			type_items = "weapon_mods"
		}
	}
	self.ach_cow_10 = {}
	self.ach_cow_10.dlc = "has_achievement"
	self.ach_cow_10.achievement_id = "cow_10"
	self.ach_cow_10.content = {}
	self.ach_cow_10.content.loot_global_value = "the_bomb"
	self.ach_cow_10.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_pis_hs2000_sl_long",
			type_items = "weapon_mods"
		}
	}
	self.ach_cow_11 = {}
	self.ach_cow_11.dlc = "has_achievement"
	self.ach_cow_11.achievement_id = "cow_11"
	self.ach_cow_11.content = {}
	self.ach_cow_11.content.loot_global_value = "the_bomb"
	self.ach_cow_11.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_pis_hs2000_sl_custom",
			type_items = "weapon_mods"
		}
	}
	self.akm4_pack = {}
	self.akm4_pack.content = {}
	self.akm4_pack.content.loot_drops = {}
	self.ach_ameno_1 = {}
	self.ach_ameno_1.dlc = "has_achievement"
	self.ach_ameno_1.achievement_id = "ameno_1"
	self.ach_ameno_1.content = {}
	self.ach_ameno_1.content.loot_global_value = "akm4_pack"
	self.ach_ameno_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_m4_upper_reciever_core",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_m4_lower_reciever_core",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_m16_fg_stag",
			type_items = "weapon_mods"
		}
	}
	self.ach_ameno_2 = {}
	self.ach_ameno_2.dlc = "has_achievement"
	self.ach_ameno_2.achievement_id = "ameno_2"
	self.ach_ameno_2.content = {}
	self.ach_ameno_2.content.loot_global_value = "akm4_pack"
	self.ach_ameno_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_g_rk3",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_fg_zenit",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_m4_upper_reciever_ballos",
			type_items = "weapon_mods"
		}
	}
	self.ach_ameno_3 = {}
	self.ach_ameno_3.dlc = "has_achievement"
	self.ach_ameno_3.achievement_id = "ameno_3"
	self.ach_ameno_3.content = {}
	self.ach_ameno_3.content.loot_global_value = "akm4_pack"
	self.ach_ameno_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_ak_scopemount",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_ass_pbs1",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "carnotaurus",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "dawn",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "dinoskull",
			type_items = "textures"
		}
	}
	self.ach_ameno_4 = {}
	self.ach_ameno_4.dlc = "has_achievement"
	self.ach_ameno_4.achievement_id = "ameno_4"
	self.ach_ameno_4.content = {}
	self.ach_ameno_4.content.loot_global_value = "akm4_pack"
	self.ach_ameno_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_ak_b_zastava",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_m_uspalm",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "triceratops",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "prehistoric",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "dinostripes",
			type_items = "textures"
		}
	}
	self.ach_ameno_5 = {}
	self.ach_ameno_5.dlc = "has_achievement"
	self.ach_ameno_5.achievement_id = "ameno_5"
	self.ach_ameno_5.content = {}
	self.ach_ameno_5.content.loot_global_value = "akm4_pack"
	self.ach_ameno_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_m4_fg_moe",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_smg_olympic_fg_lr300",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_m4_fg_lvoa",
			type_items = "weapon_mods"
		}
	}
	self.ach_ameno_6 = {}
	self.ach_ameno_6.dlc = "has_achievement"
	self.ach_ameno_6.achievement_id = "ameno_6"
	self.ach_ameno_6.content = {}
	self.ach_ameno_6.content.loot_global_value = "akm4_pack"
	self.ach_ameno_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_s_solidstock",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_m4_s_ubr",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "pachy",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "fossil",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "predator",
			type_items = "textures"
		}
	}
	self.ach_ameno_7 = {}
	self.ach_ameno_7.dlc = "has_achievement"
	self.ach_ameno_7.achievement_id = "ameno_7"
	self.ach_ameno_7.content = {}
	self.ach_ameno_7.content.loot_global_value = "akm4_pack"
	self.ach_ameno_7.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_m4_b_beowulf",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_m4_m_l5",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "velociraptor",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "feathers",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "dinoscars",
			type_items = "textures"
		}
	}
	self.ach_ameno_8 = {}
	self.ach_ameno_8.dlc = "has_achievement"
	self.ach_ameno_8.achievement_id = "ameno_8"
	self.ach_ameno_8.content = {}
	self.ach_ameno_8.content.loot_global_value = "akm4_pack"
	self.ach_ameno_8.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_fg_trax",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_fg_krebs",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_b_ak105",
			type_items = "weapon_mods"
		}
	}
	self.butch_pack_free = {}
	self.butch_pack_free.free = true
	self.butch_pack_free.content = {}
	self.butch_pack_free.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_saw_body_silent",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_saw_body_speed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_saw_m_blade_durable",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_saw_m_blade_sharp",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_aug_body_f90",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_ak5_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_mp5_m_straight",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_mp9_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_p90_b_civilian",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_p90_b_ninja",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_m14_scopemount",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_1911_g_engraved",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_beretta_g_engraved",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fl_ass_utg",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fl_pis_m3x",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_ns_battle",
			type_items = "weapon_mods"
		},
		{
			amount = 5,
			item_entry = "wpn_fps_upg_ns_ass_filter",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_pis_jungle",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_sho_salvo_large",
			type_items = "weapon_mods"
		}
	}
	self.character_pack_dragan = {}
	self.character_pack_dragan.content = {}
	self.character_pack_dragan.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dragan",
			type_items = "masks"
		}
	}
	self.ach_gorilla_1 = {}
	self.ach_gorilla_1.dlc = "has_achievement"
	self.ach_gorilla_1.achievement_id = "gorilla_1"
	self.ach_gorilla_1.content = {}
	self.ach_gorilla_1.content.loot_global_value = "normal"
	self.ach_gorilla_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "champion_dallas",
			type_items = "masks"
		}
	}
	self.overkill_pack = {}
	self.overkill_pack.content = {}
	self.overkill_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "the_overkill_mask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_m134_barrel_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_m134_barrel_extreme",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_m134_body_upper_light",
			type_items = "weapon_mods"
		}
	}
	self.complete_overkill_pack = {}
	self.complete_overkill_pack.content = {}
	self.complete_overkill_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dallas_glow",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wolf_glow",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "hoxton_glow",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "chains_glow",
			type_items = "masks"
		}
	}
	self.complete_overkill_pack2 = {}
	self.complete_overkill_pack2.dlc = "has_parent_dlc"
	self.complete_overkill_pack2.parent_dlc = "complete_overkill_pack"
	self.complete_overkill_pack2.content = {}
	self.complete_overkill_pack2.content.loot_global_value = "complete_overkill_pack"
	self.complete_overkill_pack2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "megacthulhu",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "hunter",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cop_skull",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cop_plague_doctor",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cop_kawaii",
			type_items = "masks"
		}
	}
	self.complete_overkill_pack3 = {}
	self.complete_overkill_pack3.dlc = "has_parent_dlc"
	self.complete_overkill_pack3.parent_dlc = "complete_overkill_pack"
	self.complete_overkill_pack3.content = {}
	self.complete_overkill_pack3.content.loot_global_value = "complete_overkill_pack"
	self.complete_overkill_pack3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "fab_mega_grin",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "fab_mega_doctor",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "fab_mega_alien",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cop_mega_gage_blade",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "fab_mega_mark",
			type_items = "masks"
		}
	}
	self.hlm2 = {}
	self.hlm2.dlc = "has_hlm2"
	self.hlm2.content = {}
	self.hlm2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "jake",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "richter",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "biker",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "alex",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "corey",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tonys_revenge",
			type_items = "masks"
		}
	}
	self.hlm2_deluxe = {}
	self.hlm2_deluxe.dlc = "has_hlm2_deluxe"
	self.hlm2_deluxe.content = {}
	self.hlm2_deluxe.content.loot_drops = {
		{
			amount = 1,
			item_entry = "richard_returns",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_cobray_body_upper_jacket",
			type_items = "weapon_mods"
		}
	}
	self.hlm2_deluxe_addon_1 = {
		dlc = "has_parent_dlc",
		parent_dlc = "hlm2_deluxe",
		content = {
			loot_global_value = "hlm2_deluxe",
			loot_drops = {
				{
					amount = 1,
					item_entry = "mega_richard_returns",
					type_items = "masks"
				}
			}
		}
	}
	self.ach_fort_4 = {}
	self.ach_fort_4.dlc = "has_achievement"
	self.ach_fort_4.achievement_id = "fort_4"
	self.ach_fort_4.content = {}
	self.ach_fort_4.content.loot_global_value = "normal"
	self.ach_fort_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "simpson",
			type_items = "masks"
		}
	}
	self.speedrunners = {}
	self.speedrunners.content = {}
	self.speedrunners.content.loot_drops = {
		{
			amount = 1,
			item_entry = "hothead",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "falcon",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "unic",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "speedrunner",
			type_items = "masks"
		}
	}
	self.ach_payback_3 = {}
	self.ach_payback_3.dlc = "has_achievement"
	self.ach_payback_3.achievement_id = "payback_3"
	self.ach_payback_3.content = {}
	self.ach_payback_3.content.loot_global_value = "infamous"
	self.ach_payback_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "hectors_helmet",
			type_items = "masks"
		}
	}
	self.bbq = {}
	self.bbq.content = {}
	self.bbq.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_gre_m32_no_stock",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_gre_m32_barrel_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_aa12_barrel_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_aa12_barrel_silenced",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_aa12_mag_drum",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_dragons_breath",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_grenade_launcher_incendiary",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_fla_mk2_mag_rare",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_fla_mk2_mag_welldone",
			type_items = "weapon_mods"
		}
	}
	self.ach_bbq_1 = {}
	self.ach_bbq_1.dlc = "has_achievement"
	self.ach_bbq_1.achievement_id = "grill_1"
	self.ach_bbq_1.content = {}
	self.ach_bbq_1.content.loot_global_value = "bbq"
	self.ach_bbq_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "firedemon",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "coal",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "fireborn",
			type_items = "textures"
		}
	}
	self.ach_bbq_2 = {}
	self.ach_bbq_2.dlc = "has_achievement"
	self.ach_bbq_2.achievement_id = "grill_2"
	self.ach_bbq_2.content = {}
	self.ach_bbq_2.content.loot_global_value = "bbq"
	self.ach_bbq_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "gasmask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "candlelight",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "flammable",
			type_items = "textures"
		}
	}
	self.ach_bbq_3 = {}
	self.ach_bbq_3.dlc = "has_achievement"
	self.ach_bbq_3.achievement_id = "grill_3"
	self.ach_bbq_3.content = {}
	self.ach_bbq_3.content.loot_global_value = "bbq"
	self.ach_bbq_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "firemask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "burn",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "flamer",
			type_items = "textures"
		}
	}
	self.ach_bbq_4 = {}
	self.ach_bbq_4.dlc = "has_achievement"
	self.ach_bbq_4.achievement_id = "grill_4"
	self.ach_bbq_4.content = {}
	self.ach_bbq_4.content.loot_global_value = "bbq"
	self.ach_bbq_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "chef_hat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "toast",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hotflames",
			type_items = "textures"
		}
	}
	self.west = {}
	self.west.content = {}
	self.west.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_bow_explosion",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_winchester_o_classic",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_winchester_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_winchester_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_peacemaker_s_skeletal",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_peacemaker_g_bling",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_peacemaker_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_peacemaker_b_long",
			type_items = "weapon_mods"
		}
	}
	self.ach_west_1 = {}
	self.ach_west_1.dlc = "has_achievement"
	self.ach_west_1.achievement_id = "scorpion_1"
	self.ach_west_1.content = {}
	self.ach_west_1.content.loot_global_value = "west"
	self.ach_west_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bullskull",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "westernsunset",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "pattern",
			type_items = "textures"
		}
	}
	self.ach_west_2 = {}
	self.ach_west_2.dlc = "has_achievement"
	self.ach_west_2.achievement_id = "scorpion_2"
	self.ach_west_2.content = {}
	self.ach_west_2.content.loot_global_value = "west"
	self.ach_west_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bandit",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cactus",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "coyote",
			type_items = "textures"
		}
	}
	self.ach_west_3 = {}
	self.ach_west_3.dlc = "has_achievement"
	self.ach_west_3.achievement_id = "scorpion_3"
	self.ach_west_3.content = {}
	self.ach_west_3.content.loot_global_value = "west"
	self.ach_west_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "lone",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "scorpion",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "totem",
			type_items = "textures"
		}
	}
	self.ach_west_4 = {}
	self.ach_west_4.dlc = "has_achievement"
	self.ach_west_4.achievement_id = "scorpion_4"
	self.ach_west_4.content = {}
	self.ach_west_4.content.loot_global_value = "west"
	self.ach_west_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "kangee",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "goldfever",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "native",
			type_items = "textures"
		}
	}
	self.ach_melt_3 = {}
	self.ach_melt_3.dlc = "has_achievement"
	self.ach_melt_3.achievement_id = "melt_3"
	self.ach_melt_3.content = {}
	self.ach_melt_3.content.loot_global_value = "infamous"
	self.ach_melt_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "grendel",
			type_items = "masks"
		}
	}
	self.arena = {}
	self.arena.content = {}
	self.arena.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_pis_2006m_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_2006m_b_medium",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_2006m_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_2006m_g_bling",
			type_items = "weapon_mods"
		}
	}
	self.ach_arena_2 = {}
	self.ach_arena_2.dlc = "has_achievement"
	self.ach_arena_2.achievement_id = "live_2"
	self.ach_arena_2.content = {}
	self.ach_arena_2.content.loot_global_value = "arena"
	self.ach_arena_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "boombox",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "enlightment",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "arena_logo",
			type_items = "textures"
		}
	}
	self.ach_arena_3 = {}
	self.ach_arena_3.dlc = "has_achievement"
	self.ach_arena_3.achievement_id = "live_3"
	self.ach_arena_3.content = {}
	self.ach_arena_3.content.loot_global_value = "arena"
	self.ach_arena_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "cantus",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bionic",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "circle_raster",
			type_items = "textures"
		}
	}
	self.ach_arena_4 = {}
	self.ach_arena_4.dlc = "has_achievement"
	self.ach_arena_4.achievement_id = "live_4"
	self.ach_arena_4.content = {}
	self.ach_arena_4.content.loot_global_value = "arena"
	self.ach_arena_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "concert_female",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "stained_glass",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "soundwave",
			type_items = "textures"
		}
	}
	self.ach_arena_5 = {}
	self.ach_arena_5.dlc = "has_achievement"
	self.ach_arena_5.achievement_id = "live_5"
	self.ach_arena_5.content = {}
	self.ach_arena_5.content.loot_global_value = "arena"
	self.ach_arena_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "concert_male",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "dimblue",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "smoke",
			type_items = "textures"
		}
	}
	self.character_pack_sokol = {}
	self.character_pack_sokol.content = {}
	self.character_pack_sokol.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sokol",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_asval_b_proto",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_asval_s_solid",
			type_items = "weapon_mods"
		}
	}
	self.kenaz = {}
	self.kenaz.content = {}
	self.kenaz.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_ass_sub2000_fg_gen2",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_sub2000_fg_railed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_sub2000_fg_suppressed",
			type_items = "weapon_mods"
		}
	}
	self.ach_kenaz_2 = {}
	self.ach_kenaz_2.dlc = "has_achievement"
	self.ach_kenaz_2.achievement_id = "kenaz_2"
	self.ach_kenaz_2.content = {}
	self.ach_kenaz_2.content.loot_global_value = "kenaz"
	self.ach_kenaz_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "croupier_hat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "stars",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "chips",
			type_items = "textures"
		}
	}
	self.ach_kenaz_3 = {}
	self.ach_kenaz_3.dlc = "has_achievement"
	self.ach_kenaz_3.achievement_id = "kenaz_3"
	self.ach_kenaz_3.content = {}
	self.ach_kenaz_3.content.loot_global_value = "kenaz"
	self.ach_kenaz_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "gladiator_helmet",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "casino",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "royale",
			type_items = "textures"
		}
	}
	self.ach_kenaz_4 = {}
	self.ach_kenaz_4.dlc = "has_achievement"
	self.ach_kenaz_4.achievement_id = "kenaz_4"
	self.ach_kenaz_4.content = {}
	self.ach_kenaz_4.content.loot_global_value = "kenaz"
	self.ach_kenaz_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "the_king_mask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "plush",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "cards",
			type_items = "textures"
		}
	}
	self.ach_kenaz_5 = {}
	self.ach_kenaz_5.dlc = "has_achievement"
	self.ach_kenaz_5.achievement_id = "kenaz_5"
	self.ach_kenaz_5.content = {}
	self.ach_kenaz_5.content.loot_global_value = "kenaz"
	self.ach_kenaz_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sports_utility_mask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "carpet",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "dices",
			type_items = "textures"
		}
	}
	self.turtles = {}
	self.turtles.content = {}
	self.turtles.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_bow_hunter_b_carbon",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_hunter_b_skeletal",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_hunter_g_camo",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_hunter_g_walnut",
			type_items = "weapon_mods"
		}
	}
	self.turtles_mods_fix = {}
	self.turtles_mods_fix.dlc = "has_turtles"
	self.turtles_mods_fix.content = {}
	self.turtles_mods_fix.content.loot_global_value = "turtles"
	self.turtles_mods_fix.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_wa2000_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_wa2000_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_wa2000_g_light",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_wa2000_g_stealth",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_wa2000_g_walnut",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_polymer_barrel_precision",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_polymer_ns_silencer",
			type_items = "weapon_mods"
		}
	}
	self.turtles_free = {}
	self.turtles_free.free = true
	self.turtles_free.content = {}
	self.turtles_free.content.loot_global_value = "normal"
	self.turtles_free.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_bow_poison",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_crossbow_poison",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_crossbow_explosion",
			type_items = "weapon_mods"
		}
	}
	self.ach_turtles_1 = {}
	self.ach_turtles_1.dlc = "has_achievement"
	self.ach_turtles_1.achievement_id = "turtles_1"
	self.ach_turtles_1.content = {}
	self.ach_turtles_1.content.loot_global_value = "turtles"
	self.ach_turtles_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "slicer",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "still_waters",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "youkai",
			type_items = "textures"
		}
	}
	self.ach_turtles_2 = {}
	self.ach_turtles_2.dlc = "has_achievement"
	self.ach_turtles_2.achievement_id = "turtles_2"
	self.ach_turtles_2.content = {}
	self.ach_turtles_2.content.loot_global_value = "turtles"
	self.ach_turtles_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "kage",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sakura",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "oni",
			type_items = "textures"
		}
	}
	self.ach_turtles_3 = {}
	self.ach_turtles_3.dlc = "has_achievement"
	self.ach_turtles_3.achievement_id = "turtles_3"
	self.ach_turtles_3.content = {}
	self.ach_turtles_3.content.loot_global_value = "turtles"
	self.ach_turtles_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ninja_hood",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bamboo",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "koi",
			type_items = "textures"
		}
	}
	self.ach_turtles_4 = {}
	self.ach_turtles_4.dlc = "has_achievement"
	self.ach_turtles_4.achievement_id = "turtles_4"
	self.ach_turtles_4.content = {}
	self.ach_turtles_4.content.loot_global_value = "turtles"
	self.ach_turtles_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "shirai",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "origami",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "origami",
			type_items = "textures"
		}
	}
	self.dragon = {}
	self.dragon.content = {}
	self.dragon.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_smg_baka_b_comp",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_baka_b_longsupp",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_baka_b_midsupp",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_baka_b_smallsupp",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_baka_s_standard",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_baka_s_unfolded",
			type_items = "weapon_mods"
		}
	}
	self.dragon_maskfix = {}
	self.dragon_maskfix.dlc = "has_dragon"
	self.dragon_maskfix.content = {}
	self.dragon_maskfix.content.loot_global_value = "dragon"
	self.dragon_maskfix.content.loot_drops = {
		{
			amount = 1,
			item_entry = "jiro",
			type_items = "masks"
		}
	}
	self.steel_free = {}
	self.steel_free.free = true
	self.steel_free.content = {}
	self.steel_free.content.loot_global_value = "normal"
	self.steel_free.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_bow_arblast_m_poison",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_arblast_m_explosive",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_frankish_m_poison",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_frankish_m_explosive",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_long_m_explosive",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_long_m_poison",
			type_items = "weapon_mods"
		}
	}
	self.ach_steel_1 = {}
	self.ach_steel_1.dlc = "has_achievement"
	self.ach_steel_1.achievement_id = "steel_1"
	self.ach_steel_1.content = {}
	self.ach_steel_1.content.loot_global_value = "steel"
	self.ach_steel_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "agatha_knight",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "blooded",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "agatha",
			type_items = "textures"
		}
	}
	self.ach_steel_2 = {}
	self.ach_steel_2.dlc = "has_achievement"
	self.ach_steel_2.achievement_id = "steel_2"
	self.ach_steel_2.content = {}
	self.ach_steel_2.content.loot_global_value = "steel"
	self.ach_steel_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "agatha_vanguard_veteran",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "chain_armor",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "med_pat",
			type_items = "textures"
		}
	}
	self.ach_steel_3 = {}
	self.ach_steel_3.dlc = "has_achievement"
	self.ach_steel_3.achievement_id = "steel_3"
	self.ach_steel_3.content = {}
	self.ach_steel_3.content.loot_global_value = "steel"
	self.ach_steel_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mason_knight_veteran",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "scale_armor",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "mason",
			type_items = "textures"
		}
	}
	self.ach_steel_4 = {}
	self.ach_steel_4.dlc = "has_achievement"
	self.ach_steel_4.achievement_id = "steel_4"
	self.ach_steel_4.content = {}
	self.ach_steel_4.content.loot_global_value = "steel"
	self.ach_steel_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mason_vanguard_veteran",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "forged",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "checkered_out",
			type_items = "textures"
		}
	}
	self.rip_free = {}
	self.rip_free.content = {}
	self.rip_free.dlc = "has_rvd"
	self.rip_free.content.loot_global_value = "rvd"
	self.rip_free.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_snp_model70_iron_sight",
			type_items = "weapon_mods"
		}
	}
	self.ach_berry_2 = {}
	self.ach_berry_2.dlc = "has_achievement"
	self.ach_berry_2.achievement_id = "berry_2"
	self.ach_berry_2.content = {}
	self.ach_berry_2.content.loot_global_value = "berry"
	self.ach_berry_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "water_spirit",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "flow",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "sunavatar",
			type_items = "textures"
		}
	}
	self.ach_berry_5 = {}
	self.ach_berry_5.dlc = "has_achievement"
	self.ach_berry_5.achievement_id = "berry_5"
	self.ach_berry_5.content = {}
	self.ach_berry_5.content.loot_global_value = "berry"
	self.ach_berry_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "tane",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sancti",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "tribalface",
			type_items = "textures"
		}
	}
	self.ach_jerry_3 = {}
	self.ach_jerry_3.dlc = "has_achievement"
	self.ach_jerry_3.achievement_id = "jerry_3"
	self.ach_jerry_3.content = {}
	self.ach_jerry_3.content.loot_global_value = "berry"
	self.ach_jerry_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "oro",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "glade",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "tribalwave",
			type_items = "textures"
		}
	}
	self.ach_jerry_4 = {}
	self.ach_jerry_4.dlc = "has_achievement"
	self.ach_jerry_4.achievement_id = "jerry_4"
	self.ach_jerry_4.content = {}
	self.ach_jerry_4.content.loot_global_value = "berry"
	self.ach_jerry_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "maui",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wade",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "ornamentalcrown",
			type_items = "textures"
		}
	}
	self.tormentor_mask = {}
	self.tormentor_mask.free = true
	self.tormentor_mask.content = {}
	self.tormentor_mask.content.loot_global_value = "normal"
	self.tormentor_mask.content.loot_drops = {
		{
			amount = 1,
			item_entry = "tormentor",
			type_items = "masks"
		}
	}
	self.ach_cane_3 = {}
	self.ach_cane_3.dlc = "has_achievement"
	self.ach_cane_3.achievement_id = "cane_3"
	self.ach_cane_3.content = {}
	self.ach_cane_3.content.loot_global_value = "normal"
	self.ach_cane_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "rudeolph",
			type_items = "masks"
		}
	}
	self.ach_cane_4 = {}
	self.ach_cane_4.dlc = "has_achievement"
	self.ach_cane_4.achievement_id = "cane_4"
	self.ach_cane_4.content = {}
	self.ach_cane_4.content.loot_global_value = "normal"
	self.ach_cane_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "greedy_the_elf",
			type_items = "masks"
		}
	}
	self.ach_peta_2 = {}
	self.ach_peta_2.dlc = "has_achievement"
	self.ach_peta_2.achievement_id = "peta_2"
	self.ach_peta_2.content = {}
	self.ach_peta_2.content.loot_global_value = "peta"
	self.ach_peta_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "tall_goat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "goateye",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "giraffe",
			type_items = "textures"
		}
	}
	self.ach_peta_3 = {}
	self.ach_peta_3.dlc = "has_achievement"
	self.ach_peta_3.achievement_id = "peta_3"
	self.ach_peta_3.content = {}
	self.ach_peta_3.content.loot_global_value = "peta"
	self.ach_peta_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "goat_goat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "flamingoeye",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "illumigoati",
			type_items = "textures"
		}
	}
	self.ach_peta_4 = {}
	self.ach_peta_4.dlc = "has_achievement"
	self.ach_peta_4.achievement_id = "peta_4"
	self.ach_peta_4.content = {}
	self.ach_peta_4.content.loot_global_value = "peta"
	self.ach_peta_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wet_goat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "hay",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "goatface",
			type_items = "textures"
		}
	}
	self.ach_peta_5 = {}
	self.ach_peta_5.dlc = "has_achievement"
	self.ach_peta_5.achievement_id = "peta_5"
	self.ach_peta_5.content = {}
	self.ach_peta_5.content.loot_global_value = "peta"
	self.ach_peta_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "fancy_goat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tongue",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "fur",
			type_items = "textures"
		}
	}
	self.ach_pal_2 = {}
	self.ach_pal_2.dlc = "has_achievement"
	self.ach_pal_2.achievement_id = "pal_2"
	self.ach_pal_2.content = {}
	self.ach_pal_2.content.loot_global_value = "pal"
	self.ach_pal_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "horned_king",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "houndstooth",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "fenris",
			type_items = "textures"
		}
	}
	self.ach_pal_3 = {}
	self.ach_pal_3.dlc = "has_achievement"
	self.ach_pal_3.achievement_id = "pal_3"
	self.ach_pal_3.content = {}
	self.ach_pal_3.content.loot_global_value = "pal"
	self.ach_pal_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "viking",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "day",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "kurbits",
			type_items = "textures"
		}
	}
	self.ach_man_3 = {}
	self.ach_man_3.dlc = "has_achievement"
	self.ach_man_3.achievement_id = "man_3"
	self.ach_man_3.content = {}
	self.ach_man_3.content.loot_global_value = "pal"
	self.ach_man_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "nutcracker",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "redwhite",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "luse",
			type_items = "textures"
		}
	}
	self.ach_man_4 = {}
	self.ach_man_4.dlc = "has_achievement"
	self.ach_man_4.achievement_id = "man_4"
	self.ach_man_4.content = {}
	self.ach_man_4.content.loot_global_value = "pal"
	self.ach_man_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "divided",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mushroom_cloud",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "split",
			type_items = "textures"
		}
	}
	self.coco = {}
	self.coco.dlc = "has_coco"
	self.coco.content = {}
	self.coco.content.loot_drops = {
		{
			amount = 1,
			global_value = "infamous",
			item_entry = "jimmy_duct",
			type_items = "masks"
		}
	}
	self.mad = {}
	self.mad.dlc = "has_mad"
	self.mad.content = {}
	self.mad.content.loot_drops = {
		{
			amount = 1,
			global_value = "normal",
			item_entry = "wpn_fps_pis_pl14_b_comp",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			global_value = "normal",
			item_entry = "wpn_fps_pis_pl14_m_extended",
			type_items = "weapon_mods"
		}
	}
	self.ach_mad_2 = {}
	self.ach_mad_2.dlc = "has_achievement"
	self.ach_mad_2.achievement_id = "mad_2"
	self.ach_mad_2.content = {}
	self.ach_mad_2.content.loot_global_value = "normal"
	self.ach_mad_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mad_mask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "nebula",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hexagons",
			type_items = "textures"
		}
	}
	self.ach_mad_3 = {}
	self.ach_mad_3.dlc = "has_achievement"
	self.ach_mad_3.achievement_id = "mad_3"
	self.ach_mad_3.content = {}
	self.ach_mad_3.content.loot_global_value = "normal"
	self.ach_mad_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "visor",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "planet",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "jimmy_phoenix",
			type_items = "textures"
		}
	}
	self.ach_dark_2 = {}
	self.ach_dark_2.dlc = "has_achievement"
	self.ach_dark_2.achievement_id = "dark_2"
	self.ach_dark_2.content = {}
	self.ach_dark_2.content.loot_global_value = "normal"
	self.ach_dark_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mad_goggles",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "rusty",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "rebel",
			type_items = "textures"
		}
	}
	self.ach_dark_3 = {}
	self.ach_dark_3.dlc = "has_achievement"
	self.ach_dark_3.achievement_id = "dark_3"
	self.ach_dark_3.content = {}
	self.ach_dark_3.content.loot_global_value = "normal"
	self.ach_dark_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "half_mask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "spaceship",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "squares",
			type_items = "textures"
		}
	}
	self.pim = {}
	self.pim.content = {}
	self.pim.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_pis_packrat_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_packrat_ns_wick",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_packrat_o_expert",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_schakal_b_civil",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_schakal_m_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_schakal_m_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_schakal_ns_silencer",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_schakal_s_civil",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_schakal_s_folded",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_schakal_vg_surefire",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_desertfox_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_desertfox_b_silencer",
			type_items = "weapon_mods"
		}
	}
	self.ach_pim_1 = {}
	self.ach_pim_1.dlc = "has_achievement"
	self.ach_pim_1.achievement_id = "pim_1"
	self.ach_pim_1.content = {}
	self.ach_pim_1.content.loot_global_value = "pim"
	self.ach_pim_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pim_mustang",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wheel",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "oneshot",
			type_items = "textures"
		}
	}
	self.ach_pim_2 = {}
	self.ach_pim_2.dlc = "has_achievement"
	self.ach_pim_2.achievement_id = "pim_2"
	self.ach_pim_2.content = {}
	self.ach_pim_2.content.loot_global_value = "pim"
	self.ach_pim_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pim_hotelier",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "club",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "piety",
			type_items = "textures"
		}
	}
	self.ach_pim_3 = {}
	self.ach_pim_3.dlc = "has_achievement"
	self.ach_pim_3.achievement_id = "pim_3"
	self.ach_pim_3.content = {}
	self.ach_pim_3.content.loot_global_value = "pim"
	self.ach_pim_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pim_russian_ballistic",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mist",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "warface",
			type_items = "textures"
		}
	}
	self.ach_pim_4 = {}
	self.ach_pim_4.dlc = "has_achievement"
	self.ach_pim_4.achievement_id = "pim_4"
	self.ach_pim_4.content = {}
	self.ach_pim_4.content.loot_global_value = "pim"
	self.ach_pim_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pim_dog",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "dog",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "daisy",
			type_items = "textures"
		}
	}
	self.opera = {}
	self.opera.content = {}
	self.opera.content.loot_global_value = "opera"
	self.opera.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sydney",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_tecci_ns_special",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_tecci_b_long",
			type_items = "weapon_mods"
		}
	}
	self.dos = {}
	self.dos.free = true
	self.dos.content = {}
	self.dos.content.loot_global_value = "normal"
	self.dos.content.loot_drops = {}
	self.dos.content.upgrades = {}
	self.jigg = {}
	self.jigg.content = {}
	self.jigg.content.loot_drops = {
		{
			amount = 1,
			item_entry = "jig_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "jig_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "damned",
			type_items = "masks"
		}
	}
	self.dbd_clan = {}
	self.dbd_clan.content = {}
	self.dbd_clan.content.loot_drops = {}
	self.dbd_clan_award = {}
	self.dbd_clan_award.dlc = "has_dbd_clan"
	self.dbd_clan_award.content = {}
	self.dbd_clan_award.content.loot_global_value = "dbd_clan"
	self.dbd_clan_award.content.loot_drops = {
		{
			amount = 1,
			item_entry = "devourer",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "unborn",
			type_items = "masks"
		}
	}
	self.dbd_deluxe = {}
	self.dbd_deluxe.dlc = "has_dbd_deluxe"
	self.dbd_deluxe.content = {}
	self.dbd_deluxe.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dbd_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "dbd_03",
			type_items = "masks"
		}
	}
	self.pdcon_2015 = {}
	self.pdcon_2015.content = {}
	self.pdcon_2015.content.loot_drops = {
		{
			amount = 1,
			item_entry = "king_of_jesters",
			type_items = "masks"
		}
	}
	self.pdcon_2016 = {}
	self.pdcon_2016.content = {}
	self.pdcon_2016.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pdc16_clover",
			type_items = "masks"
		}
	}
	self.bobblehead = {}
	self.bobblehead.content = {}
	self.bobblehead.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bobblehead_dozer",
			type_items = "masks"
		}
	}
	self.free_jwshades = {}
	self.free_jwshades.dlc = "has_john_wick_character"
	self.free_jwshades.content = {}
	self.free_jwshades.content.loot_global_value = "infamous"
	self.free_jwshades.content.loot_drops = {
		{
			amount = 1,
			item_entry = "jw_shades",
			type_items = "masks"
		}
	}
	self.john_wick_character = {}
	self.john_wick_character.dlc = "has_john_wick_character"
	self.john_wick_character.content = {}
	self.john_wick_character.content.loot_global_value = "pd2_clan"
	self.john_wick_character.content.loot_drops = {
		{
			amount = 1,
			item_entry = "stoneface",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wayfarer",
			type_items = "masks"
		}
	}
	self.john_wick_character.content.upgrades = {
		"kabartanto"
	}
	self.dbd_boo_0_award = {}
	self.dbd_boo_0_award.dlc = "has_dbd_clan"
	self.dbd_boo_0_award.content = {}
	self.dbd_boo_0_award.content.loot_global_value = "dbd_clan"
	self.dbd_boo_0_award.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dbd_04",
			type_items = "masks"
		}
	}
	self.dbd_boo_1_award = {}
	self.dbd_boo_1_award.dlc = "has_dbd_clan"
	self.dbd_boo_1_award.content = {}
	self.dbd_boo_1_award.content.loot_global_value = "dbd_clan"
	self.dbd_boo_1_award.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dbd_01",
			type_items = "masks"
		}
	}
	self.dbd_boo_4_award = {}
	self.dbd_boo_4_award.dlc = "has_dbd_clan"
	self.dbd_boo_4_award.content = {}
	self.dbd_boo_4_award.content.loot_global_value = "dbd_clan"
	self.dbd_boo_4_award.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dbd_slasher",
			type_items = "masks"
		}
	}
	self.wild = {}
	self.wild.content = {}
	self.wild.content.loot_global_value = "wild"
	self.wild.content.loot_drops = {
		{
			amount = 1,
			item_entry = "rust",
			type_items = "masks"
		}
	}
	self.born = {}
	self.born.content = {}
	self.born.content.loot_drops = {}
	self.ach_born_3 = {}
	self.ach_born_3.dlc = "has_achievement"
	self.ach_born_3.achievement_id = "born_3"
	self.ach_born_3.content = {}
	self.ach_born_3.content.loot_global_value = "born"
	self.ach_born_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "born_biker_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "hotrod_red",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "skull_engine",
			type_items = "textures"
		}
	}
	self.ach_born_4 = {}
	self.ach_born_4.dlc = "has_achievement"
	self.ach_born_4.achievement_id = "born_4"
	self.ach_born_4.content = {}
	self.ach_born_4.content.loot_global_value = "born"
	self.ach_born_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "born_biker_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "shiny_and_chrome",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "tire_fire",
			type_items = "textures"
		}
	}
	self.ach_born_5 = {}
	self.ach_born_5.dlc = "has_achievement"
	self.ach_born_5.achievement_id = "born_5"
	self.ach_born_5.content = {}
	self.ach_born_5.content.loot_global_value = "born"
	self.ach_born_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "born_biker_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "devil_eye",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "skull_wing",
			type_items = "textures"
		}
	}
	self.ach_born_6 = {}
	self.ach_born_6.dlc = "has_achievement"
	self.ach_born_6.achievement_id = "born_6"
	self.ach_born_6.content = {}
	self.ach_born_6.content.loot_global_value = "born"
	self.ach_born_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "brutal",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "chromey",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "biker_face",
			type_items = "textures"
		}
	}
	self.solus_clan = {}
	self.solus_clan.content = {}
	self.solus_clan.content.loot_drops = {}
	self.solus_clan_award = {}
	self.solus_clan_award.dlc = "has_solus_clan"
	self.solus_clan_award.content = {}
	self.solus_clan_award.content.loot_global_value = "solus_clan"
	self.solus_clan_award.content.loot_drops = {
		{
			amount = 1,
			item_entry = "solus",
			type_items = "masks"
		}
	}
	self.pd2_clan_migg = {}
	self.pd2_clan_migg.content = {}
	self.pd2_clan_migg.dlc = "has_pd2_clan"
	self.pd2_clan_migg.content.loot_global_value = "pd2_clan"
	self.pd2_clan_migg.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mig_death",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mig_war",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mig_conquest",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mig_famine",
			type_items = "masks"
		}
	}
	self.pd2_clan_fibb = {}
	self.pd2_clan_fibb.content = {}
	self.pd2_clan_fibb.dlc = "has_pd2_clan"
	self.pd2_clan_fibb.content.loot_global_value = "pd2_clan"
	self.pd2_clan_fibb.content.loot_drops = {
		{
			amount = 1,
			item_entry = "fib_fox",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "fib_cat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "fib_mouse",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "fib_hare",
			type_items = "masks"
		}
	}
	self.gotti_bundle = {}
	self.gotti_bundle.content = {}
	self.gotti_bundle.content.loot_global_value = "normal"
	self.gotti_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "gti_al_capone",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "gti_bugsy",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "gti_madame_st_claire",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "gti_lucky_luciano",
			type_items = "masks"
		}
	}
	self.nyck_bundle = {}
	self.nyck_bundle.content = {}
	self.nyck_bundle.content.loot_global_value = "normal"
	self.nyck_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "nyck_cap",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "nyck_ace",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "nyck_beret",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "nyck_pickle",
			type_items = "masks"
		}
	}
	self.urf_bundle = {}
	self.urf_bundle.content = {}
	self.urf_bundle.content.loot_global_value = "normal"
	self.urf_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "urf_seal",
			type_items = "masks"
		}
	}
	self.howl = {}
	self.howl.free = true
	self.howl.content = {}
	self.howl.content.loot_global_value = "halloween"
	self.howl.content.loot_drops = {
		{
			amount = 1,
			item_entry = "hwl_dallas_zombie",
			type_items = "masks"
		}
	}
	self.ach_help_4 = {}
	self.ach_help_4.dlc = "has_achievement"
	self.ach_help_4.achievement_id = "orange_4"
	self.ach_help_4.content = {}
	self.ach_help_4.content.loot_global_value = "halloween"
	self.ach_help_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "hwl_wolf_zombie",
			type_items = "masks"
		}
	}
	self.ach_help_5 = {}
	self.ach_help_5.dlc = "has_achievement"
	self.ach_help_5.achievement_id = "orange_5"
	self.ach_help_5.content = {}
	self.ach_help_5.content.loot_global_value = "halloween"
	self.ach_help_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "howl_chains_zombie",
			type_items = "masks"
		}
	}
	self.ach_help_6 = {}
	self.ach_help_6.dlc = "has_achievement"
	self.ach_help_6.achievement_id = "orange_6"
	self.ach_help_6.content = {}
	self.ach_help_6.content.loot_global_value = "halloween"
	self.ach_help_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "hwl_hoxton_zombie",
			type_items = "masks"
		}
	}
	self.tango = {}
	self.tango.content = {}
	self.tango.content.loot_global_value = "tango"
	self.tango.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_45rds",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_1911_m_big",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_mp5_fg_flash",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_spot",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_aug_m_quick",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_mp5_s_folding",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_m4_upg_m_quick",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_p90_m_strap",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_duck",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_usp_m_big",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_gre_arbiter_b_comp",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_mac10_m_quick",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g36_m_quick",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_m_quick",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_g36_fg_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g36_o_vintage",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_box",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_saiga_fg_holy",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_saiga_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sr2_m_quick",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_gre_arbiter_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_grenade_launcher_incendiary_arbiter",
			type_items = "weapon_mods"
		}
	}
	self.win_bundle = {}
	self.win_bundle.content = {}
	self.win_bundle.content.loot_global_value = "normal"
	self.win_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "win_donald",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "win_donald_mega",
			type_items = "masks"
		}
	}
	self.ach_moon_4 = {}
	self.ach_moon_4.dlc = "has_achievement"
	self.ach_moon_4.achievement_id = "moon_4"
	self.ach_moon_4.content = {}
	self.ach_moon_4.content.loot_global_value = "normal"
	self.ach_moon_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "moon_paycheck_dallas",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "moon_paycheck_chains",
			type_items = "masks"
		}
	}
	self.chico_bundle = {}
	self.chico_bundle.content = {}
	self.chico_bundle.content.loot_global_value = "chico"
	self.chico_bundle.dlc = "has_chico"
	self.chico_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "chc_terry",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "chc_terry_begins",
			type_items = "masks"
		}
	}
	self.friend_bundle = {}
	self.friend_bundle.content = {}
	self.friend_bundle.content.loot_global_value = "friend"
	self.friend_bundle.dlc = "has_friend"
	self.friend_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sfm_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "golden_hour",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "scar_mask",
			type_items = "textures"
		}
	}
	self.ach_friend_4 = {}
	self.ach_friend_4.dlc = "has_achievement"
	self.ach_friend_4.achievement_id = "friend_4"
	self.ach_friend_4.content = {}
	self.ach_friend_4.content.loot_global_value = "friend"
	self.ach_friend_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sfm_04",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "black_marble",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "diablada",
			type_items = "textures"
		}
	}
	self.ach_friend_5 = {}
	self.ach_friend_5.dlc = "has_achievement"
	self.ach_friend_5.achievement_id = "friend_5"
	self.ach_friend_5.content = {}
	self.ach_friend_5.content.loot_global_value = "friend"
	self.ach_friend_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sfm_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "oxidized_copper",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "liberty_flame",
			type_items = "textures"
		}
	}
	self.ach_friend_6 = {}
	self.ach_friend_6.dlc = "has_achievement"
	self.ach_friend_6.achievement_id = "friend_6"
	self.ach_friend_6.content = {}
	self.ach_friend_6.content.loot_global_value = "friend"
	self.ach_friend_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sfm_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "red_velvet",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "my_little",
			type_items = "textures"
		}
	}
	self.swm_bundle = {}
	self.swm_bundle.dlc = "has_swm"
	self.swm_bundle.content = {}
	self.swm_bundle.content.loot_global_value = "swm"
	self.swm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "swm_sydney",
			type_items = "masks"
		}
	}
	self.sparkle_bundle = {}
	self.sparkle_bundle.dlc = "has_sparkle"
	self.sparkle_bundle.content = {}
	self.sparkle_bundle.content.loot_global_value = "sparkle"
	self.sparkle_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "spk_party",
			type_items = "masks"
		}
	}
	self.sha_bundle = {}
	self.sha_bundle.dlc = "has_sha"
	self.sha_bundle.content = {}
	self.sha_bundle.content.loot_global_value = "sha"
	self.sha_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sha_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sha_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sha_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sha_04",
			type_items = "masks"
		}
	}
	self.yor_bundle = {}
	self.yor_bundle.free = true
	self.yor_bundle.content = {}
	self.yor_bundle.content.loot_global_value = "normal"
	self.yor_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "yor",
			type_items = "masks"
		}
	}
	self.spa_bundle = {}
	self.spa_bundle.content = {}
	self.spa_bundle.content.loot_global_value = "spa"
	self.spa_bundle.dlc = "has_spa"
	self.spa_bundle.content.loot_drops = {}
	self.ach_spa_5 = {}
	self.ach_spa_5.dlc = "has_achievement"
	self.ach_spa_5.achievement_id = "spa_5"
	self.ach_spa_5.content = {}
	self.ach_spa_5.content.loot_global_value = "spa"
	self.ach_spa_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "spa_04",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "underground_neon",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "baba_yaga",
			type_items = "textures"
		}
	}
	self.ach_spa_6 = {}
	self.ach_spa_6.dlc = "has_achievement"
	self.ach_spa_6.achievement_id = "spa_6"
	self.ach_spa_6.content = {}
	self.ach_spa_6.content.loot_global_value = "spa"
	self.ach_spa_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "spa_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "carbon_fiber_weave",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hood_stripes",
			type_items = "textures"
		}
	}
	self.ach_fish_5 = {}
	self.ach_fish_5.dlc = "has_achievement"
	self.ach_fish_5.achievement_id = "fish_5"
	self.ach_fish_5.content = {}
	self.ach_fish_5.content.loot_global_value = "spa"
	self.ach_fish_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "spa_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "neon_blue",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hotel_pattern",
			type_items = "textures"
		}
	}
	self.ach_fish_6 = {}
	self.ach_fish_6.dlc = "has_achievement"
	self.ach_fish_6.achievement_id = "fish_6"
	self.ach_fish_6.content = {}
	self.ach_fish_6.content.loot_global_value = "spa"
	self.ach_fish_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "spa_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "black_suede",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "continental",
			type_items = "textures"
		}
	}
	self.grv_bundle = {}
	self.grv_bundle.content = {}
	self.grv_bundle.content.loot_global_value = "grv"
	self.grv_bundle.dlc = "has_grv"
	self.grv_bundle.content.loot_drops = {}
	self.ach_grv_1 = {}
	self.ach_grv_1.dlc = "has_achievement"
	self.ach_grv_1.achievement_id = "grv_1"
	self.ach_grv_1.content = {}
	self.ach_grv_1.content.loot_global_value = "grv"
	self.ach_grv_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "grv_04",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tricolor",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "russian_gamble",
			type_items = "textures"
		}
	}
	self.ach_grv_2 = {}
	self.ach_grv_2.dlc = "has_achievement"
	self.ach_grv_2.achievement_id = "grv_2"
	self.ach_grv_2.content = {}
	self.ach_grv_2.content.loot_global_value = "grv"
	self.ach_grv_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "grv_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "russian_camouflage",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "red_star",
			type_items = "textures"
		}
	}
	self.ach_grv_3 = {}
	self.ach_grv_3.dlc = "has_achievement"
	self.ach_grv_3.achievement_id = "grv_3"
	self.ach_grv_3.content = {}
	self.ach_grv_3.content.loot_global_value = "grv"
	self.ach_grv_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "grv_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "propaganda_palette",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "bear_fight",
			type_items = "textures"
		}
	}
	self.ach_grv_4 = {}
	self.ach_grv_4.dlc = "has_achievement"
	self.ach_grv_4.achievement_id = "grv_4"
	self.ach_grv_4.content = {}
	self.ach_grv_4.content.loot_global_value = "grv"
	self.ach_grv_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "grv_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ceramics_gzhel",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "prison_statement",
			type_items = "textures"
		}
	}
	self.bny_bundle = {}
	self.bny_bundle.free = true
	self.bny_bundle.content = {}
	self.bny_bundle.content.loot_global_value = "normal"
	self.bny_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bny_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bny_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bny_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bny_04",
			type_items = "masks"
		}
	}
	self.ach_cee_3 = {}
	self.ach_cee_3.dlc = "has_achievement"
	self.ach_cee_3.achievement_id = "cee_3"
	self.ach_cee_3.content = {}
	self.ach_cee_3.content.loot_global_value = "infamous"
	self.ach_cee_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mrm",
			type_items = "masks"
		}
	}
	self.pn2_bundle = {}
	self.pn2_bundle.dlc = "has_pn2"
	self.pn2_bundle.content = {}
	self.pn2_bundle.content.loot_global_value = "pn2"
	self.pn2_bundle.content.loot_drops = {}
	self.mp2_bundle = {}
	self.mp2_bundle.free = true
	self.mp2_bundle.content = {}
	self.mp2_bundle.content.loot_global_value = "normal"
	self.mp2_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mp2_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mp2_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mp2_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mp2_04",
			type_items = "masks"
		}
	}
	self.amp_bundle = {}
	self.amp_bundle.free = true
	self.amp_bundle.content = {}
	self.amp_bundle.content.loot_global_value = "normal"
	self.amp_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "amp_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "amp_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "amp_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "amp_04",
			type_items = "masks"
		}
	}
	self.flip_bundle = {}
	self.flip_bundle.free = true
	self.flip_bundle.content = {}
	self.flip_bundle.content.loot_global_value = "normal"
	self.flip_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_xpsg33_magnifier",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_45rds_v2",
			type_items = "weapon_mods"
		}
	}
	self.mdm_bundle = {}
	self.mdm_bundle.free = true
	self.mdm_bundle.content = {}
	self.mdm_bundle.content.loot_global_value = "infamous"
	self.mdm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mdm",
			type_items = "masks"
		}
	}
	self.ant_free = {}
	self.ant_free.dlc = "has_ant_free"
	self.ant_free.content = {}
	self.ant_free.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ant_05",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ant_07",
			type_items = "masks"
		}
	}
	self.ant = {}
	self.ant.dlc = "has_ant"
	self.ant.content = {}
	self.ant.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ant_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ant_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ant_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ant_04",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ant_06",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ant_08",
			type_items = "masks"
		}
	}
	self.dgm_bundle = {}
	self.dgm_bundle.free = true
	self.dgm_bundle.content = {}
	self.dgm_bundle.content.loot_global_value = "pd2_clan"
	self.dgm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dgm",
			type_items = "masks"
		}
	}
	self.gcm_bundle = {}
	self.gcm_bundle.free = true
	self.gcm_bundle.content = {}
	self.gcm_bundle.content.loot_global_value = "pd2_clan"
	self.gcm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "gcm",
			type_items = "masks"
		}
	}
	self.ztm_bundle = {}
	self.ztm_bundle.dlc = "has_ztm"
	self.ztm_bundle.content = {}
	self.ztm_bundle.content.loot_global_value = "ztm"
	self.ztm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ztm",
			type_items = "masks"
		}
	}
	self.wmp_bundle = {}
	self.wmp_bundle.free = true
	self.wmp_bundle.content = {}
	self.wmp_bundle.content.loot_global_value = "pd2_clan"
	self.wmp_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wmp_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wmp_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wmp_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wmp_04",
			type_items = "masks"
		}
	}
	self.cmo_bundle = {}
	self.cmo_bundle.free = true
	self.cmo_bundle.content = {}
	self.cmo_bundle.content.loot_global_value = "normal"
	self.cmo_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "cmo_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cmo_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cmo_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cmo_04",
			type_items = "masks"
		}
	}
	self.cmt = {}
	self.cmt.free = true
	self.cmt.content = {}
	self.cmt.content.loot_drops = {}
	self.pbm_bundle = {}
	self.pbm_bundle.dlc = "has_pbm"
	self.pbm_bundle.content = {}
	self.pbm_bundle.content.loot_global_value = "pbm"
	self.pbm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pbm",
			type_items = "masks"
		}
	}
	self.dnm = {}
	self.dnm.free = true
	self.dnm.content = {}
	self.dnm.content.loot_drops = {}
	self.ach_trk_a_0 = {}
	self.ach_trk_a_0.dlc = "has_achievement"
	self.ach_trk_a_0.achievement_id = "trk_a_0"
	self.ach_trk_a_0.content = {}
	self.ach_trk_a_0.content.loot_global_value = "infamous"
	self.ach_trk_a_0.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dnm",
			type_items = "masks"
		}
	}
	self.wwh = {}
	self.wwh.free = true
	self.wwh.content = {}
	self.wwh.content.loot_drops = {}
	self.eng = {}
	self.eng.free = true
	self.eng.content = {}
	self.eng.content.loot_drops = {}
	self.ach_eng_1 = {}
	self.ach_eng_1.dlc = "has_achievement"
	self.ach_eng_1.achievement_id = "eng_1"
	self.ach_eng_1.content = {}
	self.ach_eng_1.content.loot_global_value = "eng"
	self.ach_eng_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "eng_01",
			type_items = "masks"
		}
	}
	self.ach_eng_2 = {}
	self.ach_eng_2.dlc = "has_achievement"
	self.ach_eng_2.achievement_id = "eng_2"
	self.ach_eng_2.content = {}
	self.ach_eng_2.content.loot_global_value = "eng"
	self.ach_eng_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "eng_02",
			type_items = "masks"
		}
	}
	self.ach_eng_3 = {}
	self.ach_eng_3.dlc = "has_achievement"
	self.ach_eng_3.achievement_id = "eng_4"
	self.ach_eng_3.content = {}
	self.ach_eng_3.content.loot_global_value = "eng"
	self.ach_eng_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "eng_03",
			type_items = "masks"
		}
	}
	self.ach_eng_4 = {}
	self.ach_eng_4.dlc = "has_achievement"
	self.ach_eng_4.achievement_id = "eng_3"
	self.ach_eng_4.content = {}
	self.ach_eng_4.content.loot_global_value = "eng"
	self.ach_eng_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "eng_04",
			type_items = "masks"
		}
	}
	self.fdm_bundle = {}
	self.fdm_bundle.dlc = "has_fdm"
	self.fdm_bundle.content = {}
	self.fdm_bundle.content.loot_global_value = "fdm"
	self.fdm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "fdm",
			type_items = "masks"
		}
	}
	self.jfr = {}
	self.jfr.free = true
	self.jfr.content = {}
	self.kwm_bundle = {}
	self.kwm_bundle.free = true
	self.kwm_bundle.content = {}
	self.kwm_bundle.content.loot_global_value = "normal"
	self.kwm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "kwm",
			type_items = "masks"
		}
	}
	self.mmj_bundle = {}
	self.mmj_bundle.free = true
	self.mmj_bundle.content = {}
	self.mmj_bundle.content.loot_global_value = "normal"
	self.mmj_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mmj",
			type_items = "masks"
		}
	}
	self.ami_2 = {}
	self.ami_2.dlc = "has_achievement_milestone"
	self.ami_2.milestone_id = "ami_2"
	self.ami_2.content = {}
	self.ami_2.content.loot_global_value = "infamous"
	self.ami_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ami_02",
			type_items = "masks"
		}
	}
	self.ami_4 = {}
	self.ami_4.dlc = "has_achievement_milestone"
	self.ami_4.milestone_id = "ami_4"
	self.ami_4.content = {}
	self.ami_4.content.loot_global_value = "infamous"
	self.ami_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ami_03",
			type_items = "masks"
		}
	}
	self.ami_6 = {}
	self.ami_6.dlc = "has_achievement_milestone"
	self.ami_6.milestone_id = "ami_6"
	self.ami_6.content = {}
	self.ami_6.content.loot_global_value = "infamous"
	self.ami_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ami_05",
			type_items = "masks"
		}
	}
	self.ami_8 = {}
	self.ami_8.dlc = "has_achievement_milestone"
	self.ami_8.milestone_id = "ami_8"
	self.ami_8.content = {}
	self.ami_8.content.loot_global_value = "infamous"
	self.ami_8.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ami_04",
			type_items = "masks"
		}
	}
	self.ami_10 = {}
	self.ami_10.dlc = "has_achievement_milestone"
	self.ami_10.milestone_id = "ami_10"
	self.ami_10.content = {}
	self.ami_10.content.loot_global_value = "infamous"
	self.ami_10.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ami_01",
			type_items = "masks"
		}
	}
	self.ami_12 = {}
	self.ami_12.dlc = "has_achievement_milestone"
	self.ami_12.milestone_id = "ami_12"
	self.ami_12.content = {}
	self.ami_12.content.loot_global_value = "infamous"
	self.ami_12.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ami_06",
			type_items = "masks"
		}
	}
	self.ami_13 = {}
	self.ami_13.dlc = "has_achievement_milestone"
	self.ami_13.milestone_id = "ami_13"
	self.ami_13.content = {}
	self.ami_13.content.loot_global_value = "tam"
	self.ami_13.content.loot_drops = {
		{
			amount = 1,
			item_entry = "tam",
			type_items = "masks"
		},
		{
			item_entry = "tam",
			type_items = "armor_skins"
		},
		{
			amount = 1,
			item_entry = "color_immortal_python",
			type_items = "weapon_skins"
		}
	}

	for key, _ in pairs(tweak_data.weapon) do
		if tweak_data.blackmarket.weapon_skins[key .. "_tam"] then
			local drop = {
				type_items = "weapon_skins",
				item_entry = key .. "_tam"
			}

			table.insert(self.ami_13.content.loot_drops, drop)
		end
	end

	self.ecp_bundle = {}
	self.ecp_bundle.dlc = "has_ecp"
	self.ecp_bundle.content = {}
	self.ecp_bundle.content.loot_global_value = "ecp"
	self.ecp_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ecp_female",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ecp_male",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ecp_female_begins",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ecp_male_begins",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_ecp_m_arrows_explosive",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_ecp_m_arrows_poison",
			type_items = "weapon_mods"
		}
	}
	self.fgl_bundle = {}
	self.fgl_bundle.dlc = "has_fgl"
	self.fgl_bundle.content = {}
	self.fgl_bundle.content.loot_global_value = "fgl"
	self.fgl_bundle.content.loot_drops = {}
	self.osa_bundle = {}
	self.osa_bundle.dlc = "has_osa"
	self.osa_bundle.content = {}
	self.osa_bundle.content.loot_global_value = "osa"
	self.osa_bundle.content.loot_drops = {}
	self.gwm_bundle = {}
	self.gwm_bundle.free = true
	self.gwm_bundle.content = {}
	self.gwm_bundle.content.loot_global_value = "pd2_clan"
	self.gwm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "gwm",
			type_items = "masks"
		}
	}
	self.rvd_bundle = {}
	self.rvd_bundle.dlc = "has_rvd"
	self.rvd_bundle.content = {}
	self.rvd_bundle.content.loot_global_value = "rvd"
	self.rvd_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "rvd_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "rvd_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "rvd_03",
			type_items = "masks"
		}
	}
	self.bodhi_bundle = {}
	self.bodhi_bundle.content = {}
	self.bodhi_bundle.dlc = "has_rvd"
	self.bodhi_bundle.content.loot_global_value = "infamous"
	self.bodhi_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bodhi",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bodhi_begins",
			type_items = "masks"
		}
	}
	self.ach_brb_8 = {}
	self.ach_brb_8.dlc = "has_achievement"
	self.ach_brb_8.achievement_id = "brb_8"
	self.ach_brb_8.content = {}
	self.ach_brb_8.content.loot_global_value = "cmt"
	self.ach_brb_8.content.loot_drops = {
		{
			amount = 1,
			item_entry = "cmt_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cmt_02",
			type_items = "masks"
		}
	}
	self.ach_brb_9 = {}
	self.ach_brb_9.dlc = "has_achievement"
	self.ach_brb_9.achievement_id = "brb_9"
	self.ach_brb_9.content = {}
	self.ach_brb_9.content.loot_global_value = "cmt"
	self.ach_brb_9.content.loot_drops = {
		{
			amount = 1,
			item_entry = "cmt_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cmt_04",
			type_items = "masks"
		}
	}
	self.ami_bundle = {}
	self.ami_bundle.dlc = "has_ami"
	self.ami_bundle.content = {}
	self.ami_bundle.content.loot_global_value = "normal"
	self.ami_bundle.content.loot_drops = {}
	self.dmg_bundle = {}
	self.dmg_bundle.dlc = "has_dmg"
	self.dmg_bundle.content = {}
	self.dmg_bundle.content.loot_global_value = "dmg"
	self.dmg_bundle.content.loot_drops = {}
	self.ach_ggez_1 = {}
	self.ach_ggez_1.dlc = "has_achievement"
	self.ach_ggez_1.achievement_id = "ggez_1"
	self.ach_ggez_1.content = {}
	self.ach_ggez_1.content.loot_global_value = "infamous"
	self.ach_ggez_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ggac_od_t2",
			type_items = "masks"
		}
	}
	self.pmp_bundle = {}
	self.pmp_bundle.dlc = "has_pmp"
	self.pmp_bundle.content = {}
	self.pmp_bundle.content.loot_global_value = "normal"
	self.pmp_bundle.content.loot_drops = {
		{
			item_entry = "pizzaface",
			type_items = "textures"
		},
		{
			{
				item_entry = "solid_greyscale70",
				type_items = "materials"
			},
			{
				item_entry = "solid_greyscale50",
				type_items = "materials"
			},
			{
				item_entry = "solid_greyscale10",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "solid_green",
				type_items = "materials"
			},
			{
				item_entry = "solid_yellow",
				type_items = "materials"
			},
			{
				item_entry = "solid_orange",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "solid_purple",
				type_items = "materials"
			},
			{
				item_entry = "solid_blue",
				type_items = "materials"
			},
			{
				item_entry = "solid_paydayblue",
				type_items = "materials"
			},
			{
				item_entry = "solid_teal",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "solid_red",
				type_items = "materials"
			},
			{
				item_entry = "solid_pink",
				type_items = "materials"
			},
			{
				item_entry = "solid_magenta",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "solid_green_dark",
				type_items = "materials"
			},
			{
				item_entry = "solid_yellow_dark",
				type_items = "materials"
			},
			{
				item_entry = "solid_orange_dark",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "solid_purple_dark",
				type_items = "materials"
			},
			{
				item_entry = "solid_blue_dark",
				type_items = "materials"
			},
			{
				item_entry = "solid_paydayblue_dark",
				type_items = "materials"
			},
			{
				item_entry = "solid_teal_dark",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "solid_pink_dark",
				type_items = "materials"
			},
			{
				item_entry = "solid_magenta_dark",
				type_items = "materials"
			},
			{
				item_entry = "solid_red_dark",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "solid_green_desaturated",
				type_items = "materials"
			},
			{
				item_entry = "solid_yellow_desaturated",
				type_items = "materials"
			},
			{
				item_entry = "solid_orange_desaturated",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "solid_purple_desaturated",
				type_items = "materials"
			},
			{
				item_entry = "solid_blue_desaturated",
				type_items = "materials"
			},
			{
				item_entry = "solid_paydayblue_desaturated",
				type_items = "materials"
			},
			{
				item_entry = "solid_teal_desaturated",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "solid_pink_desaturated",
				type_items = "materials"
			},
			{
				item_entry = "solid_magenta_desaturated",
				type_items = "materials"
			},
			{
				item_entry = "solid_red_desaturated",
				type_items = "materials"
			}
		},
		{
			{
				amount = 1,
				item_entry = "solid_flat_white",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "solid_flat_gray",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "solid_flat_black",
				type_items = "materials"
			}
		},
		{
			{
				amount = 1,
				item_entry = "solid_flat_red",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "solid_flat_green",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "solid_flat_blue",
				type_items = "materials"
			}
		},
		{
			{
				amount = 1,
				item_entry = "solid_flat_yellow",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "solid_flat_purple",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "solid_flat_orange",
				type_items = "materials"
			}
		},
		{
			{
				amount = 1,
				item_entry = "solid_flat_dark_red",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "solid_flat_dark_green",
				type_items = "materials"
			},
			{
				amount = 1,
				item_entry = "solid_flat_dark_slate_blue",
				type_items = "materials"
			}
		},
		{
			{
				item_entry = "hands_batman",
				type_items = "textures"
			},
			{
				item_entry = "hands_ok",
				type_items = "textures"
			},
			{
				item_entry = "hands_peace",
				type_items = "textures"
			},
			{
				item_entry = "hands_loser",
				type_items = "textures"
			},
			{
				item_entry = "hands_shutup",
				type_items = "textures"
			},
			{
				item_entry = "hands_pans",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "clowns_qc",
				type_items = "textures"
			},
			{
				item_entry = "clowns_ahe",
				type_items = "textures"
			},
			{
				item_entry = "clowns_hoc",
				type_items = "textures"
			},
			{
				item_entry = "clowns_in",
				type_items = "textures"
			},
			{
				item_entry = "clowns_it",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "barf",
				type_items = "textures"
			},
			{
				item_entry = "basketball",
				type_items = "textures"
			},
			{
				item_entry = "crashdummy",
				type_items = "textures"
			},
			{
				item_entry = "friedegg",
				type_items = "textures"
			},
			{
				item_entry = "phantom",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "facepaint_cupcake",
				type_items = "textures"
			},
			{
				item_entry = "facepaint_flowers",
				type_items = "textures"
			},
			{
				item_entry = "facepaint_football",
				type_items = "textures"
			},
			{
				item_entry = "facepaint_rainbow",
				type_items = "textures"
			},
			{
				item_entry = "facepaint_skull",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "heraldry_ord_fess",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_ord_pale",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_ord_pall",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_ord_saltire",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "heraldry_ord_cross",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_ord_chevron",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_ord_bend",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "heraldry_div_tiercedpall",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_div_quarterly",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_div_persaltire",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_div_perpale",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "heraldry_div_perfess",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_div_perchevron",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_div_perbend",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "heraldry_geo_paly",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_geo_lozengy",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_geo_gyronny",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_geo_fusil",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "heraldry_geo_checky",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_geo_bendy",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_geo_barrypale",
				type_items = "textures"
			},
			{
				item_entry = "heraldry_geo_barry",
				type_items = "textures"
			}
		},
		{
			{
				item_entry = "warpaint_freedom",
				type_items = "textures"
			},
			{
				item_entry = "warpaint_half_hawk",
				type_items = "textures"
			},
			{
				item_entry = "warpaint_crow_beak",
				type_items = "textures"
			},
			{
				item_entry = "warpaint_cross_marking",
				type_items = "textures"
			},
			{
				item_entry = "warpaint_darkness_eyes",
				type_items = "textures"
			}
		}
	}
	self.joy_bundle = {}
	self.joy_bundle.dlc = "has_joy"
	self.joy_bundle.content = {}
	self.joy_bundle.content.loot_global_value = "infamous"
	self.joy_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "joy",
			type_items = "masks"
		}
	}
	self.ghm_bundle = {}
	self.ghm_bundle.dlc = "has_ghm"
	self.ghm_bundle.content = {}
	self.ghm_bundle.content.loot_global_value = "pd2_clan"
	self.ghm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ghm",
			type_items = "masks"
		}
	}
	self.khp_bundle = {}
	self.khp_bundle.free = true
	self.khp_bundle.content = {}
	self.khp_bundle.content.loot_global_value = "normal"
	self.khp_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_pis_legacy_b_threaded",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_legacy_g_wood",
			type_items = "weapon_mods"
		}
	}
	self.sdb_bundle = {}
	self.sdb_bundle.free = true
	self.sdb_bundle.content = {}
	self.sdb_bundle.content.loot_global_value = "normal"
	self.sdb_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_sho_coach_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_coach_s_short",
			type_items = "weapon_mods"
		}
	}
	self.ram_bundle = {}
	self.ram_bundle.free = true
	self.ram_bundle.content = {}
	self.ram_bundle.content.loot_global_value = "normal"
	self.ram_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_bow_elastic_m_explosive",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_elastic_m_poison",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_elastic_body_tactic",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_elastic_g_2",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_bow_elastic_g_3",
			type_items = "weapon_mods"
		}
	}
	self.sms_bundle_1 = {}
	self.sms_bundle_1.dlc = "has_stat"
	self.sms_bundle_1.stat_id = "tester"
	self.sms_bundle_1.content = {}
	self.sms_bundle_1.content.loot_global_value = "infamous"
	self.sms_bundle_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sms_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sms_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sms_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sms_04",
			type_items = "masks"
		}
	}
	self.sms_bundle_2 = {}
	self.sms_bundle_2.dlc = "has_achievement"
	self.sms_bundle_2.achievement_id = "fin_1"
	self.sms_bundle_2.content = {}
	self.sms_bundle_2.content.loot_global_value = "infamous"
	self.sms_bundle_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sms_05",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sms_06",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sms_07",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sms_08",
			type_items = "masks"
		}
	}
	self.scm_bundle = {}
	self.scm_bundle.dlc = "has_stat"
	self.scm_bundle.stat_id = "uno_puzzle_door_activated"
	self.scm_bundle.content = {}
	self.scm_bundle.content.loot_global_value = "infamous"
	self.scm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "scm_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "scm_02",
			type_items = "masks"
		}
	}
	self.ach_trd_dah_1 = {}
	self.ach_trd_dah_1.dlc = "has_achievement"
	self.ach_trd_dah_1.achievement_id = "dah_1"
	self.ach_trd_dah_1.content = {}
	self.ach_trd_dah_1.content.loot_drops = {
		{
			item_entry = "sneak_suit",
			type_items = "player_styles"
		}
	}
	self.ach_trd_nmh_1 = {}
	self.ach_trd_nmh_1.dlc = "has_achievement"
	self.ach_trd_nmh_1.achievement_id = "nmh_1"
	self.ach_trd_nmh_1.content = {}
	self.ach_trd_nmh_1.content.loot_drops = {
		{
			item_entry = "scrub",
			type_items = "player_styles"
		}
	}
	self.ach_trd_glace_1 = {}
	self.ach_trd_glace_1.dlc = "has_achievement"
	self.ach_trd_glace_1.achievement_id = "glace_1"
	self.ach_trd_glace_1.content = {}
	self.ach_trd_glace_1.content.loot_drops = {
		{
			item_entry = "raincoat",
			type_items = "player_styles"
		}
	}
	self.ach_trd_sah_1 = {}
	self.ach_trd_sah_1.dlc = "has_achievement"
	self.ach_trd_sah_1.achievement_id = "sah_1"
	self.ach_trd_sah_1.content = {}
	self.ach_trd_sah_1.content.loot_drops = {
		{
			item_entry = "tux",
			type_items = "player_styles"
		}
	}
	self.ach_trd_wwh_1 = {}
	self.ach_trd_wwh_1.dlc = "has_achievement"
	self.ach_trd_wwh_1.achievement_id = "wwh_1"
	self.ach_trd_wwh_1.content = {}
	self.ach_trd_wwh_1.content.loot_drops = {
		{
			item_entry = "winter_suit",
			type_items = "player_styles"
		}
	}
	self.ach_trd_mex_9 = {}
	self.ach_trd_mex_9.dlc = "has_achievement"
	self.ach_trd_mex_9.achievement_id = "mex_9"
	self.ach_trd_mex_9.content = {}
	self.ach_trd_mex_9.content.loot_drops = {
		{
			item_entry = "murky_suit",
			type_items = "player_styles"
		}
	}
	self.pd2_clan_trd = {}
	self.pd2_clan_trd.content = {}
	self.pd2_clan_trd.dlc = "has_pd2_clan"
	self.pd2_clan_trd.content.loot_drops = {
		{
			item_entry = "jail_pd2_clan",
			type_items = "player_styles"
		}
	}
	self.ach_trk_cou_0 = {}
	self.ach_trk_cou_0.dlc = "has_achievement"
	self.ach_trk_cou_0.achievement_id = "trk_cou_0"
	self.ach_trk_cou_0.content = {}
	self.ach_trk_cou_0.content.loot_drops = {
		{
			item_entry = "poolrepair",
			type_items = "player_styles"
		}
	}
	self.ach_trd_mex_10 = {}
	self.ach_trd_mex_10.dlc = "has_achievement"
	self.ach_trd_mex_10.achievement_id = "mex_10"
	self.ach_trd_mex_10.content = {}
	self.ach_trd_mex_10.content.loot_global_value = "mex"
	self.ach_trd_mex_10.content.loot_drops = {
		{
			amount = 1,
			item_entry = "roman",
			type_items = "masks"
		}
	}
	self.wcs_starter_pack = {}
	self.wcs_starter_pack.free = true
	self.wcs_starter_pack.content = {}
	self.wcs_starter_pack.content.loot_global_value = "normal"
	self.wcs_starter_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_gray_black",
			type_items = "weapon_skins"
		},
		{
			amount = 1,
			item_entry = "color_tan_khaki",
			type_items = "weapon_skins"
		}
	}
	self.wcs_pd2_clan = {}
	self.wcs_pd2_clan.dlc = "has_pd2_clan"
	self.wcs_pd2_clan.content = {}
	self.wcs_pd2_clan.content.loot_global_value = "pd2_clan"
	self.wcs_pd2_clan.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_blue_payday",
			type_items = "weapon_skins"
		}
	}
	self.ach_trd_sus_1 = {}
	self.ach_trd_sus_1.dlc = "has_achievement"
	self.ach_trd_sus_1.achievement_id = "trk_sh_0"
	self.ach_trd_sus_1.content = {}
	self.ach_trd_sus_1.content.loot_global_value = "sus"
	self.ach_trd_sus_1.content.loot_drops = {
		{
			item_entry = "slaughterhouse",
			type_items = "player_styles"
		}
	}
	self.ach_trd_bex_1 = {}
	self.ach_trd_bex_1.dlc = "has_achievement"
	self.ach_trd_bex_1.achievement_id = "bex_1"
	self.ach_trd_bex_1.content = {}
	self.ach_trd_bex_1.content.loot_global_value = "bex"
	self.ach_trd_bex_1.content.loot_drops = {
		{
			item_entry = "mariachi",
			type_items = "player_styles"
		}
	}
	self.ach_trd_bex_2 = {}
	self.ach_trd_bex_2.dlc = "has_achievement"
	self.ach_trd_bex_2.achievement_id = "bex_2"
	self.ach_trd_bex_2.content = {}
	self.ach_trd_bex_2.content.loot_global_value = "bex"
	self.ach_trd_bex_2.content.loot_drops = {
		{
			type_items = "suit_variations",
			item_entry = {
				"mariachi",
				"brown"
			}
		}
	}
	self.ach_trd_bex_3 = {}
	self.ach_trd_bex_3.dlc = "has_achievement"
	self.ach_trd_bex_3.achievement_id = "bex_4"
	self.ach_trd_bex_3.content = {}
	self.ach_trd_bex_3.content.loot_global_value = "bex"
	self.ach_trd_bex_3.content.loot_drops = {
		{
			type_items = "suit_variations",
			item_entry = {
				"mariachi",
				"white"
			}
		}
	}
	self.ach_trd_bex_4 = {}
	self.ach_trd_bex_4.dlc = "has_achievement"
	self.ach_trd_bex_4.achievement_id = "bex_6"
	self.ach_trd_bex_4.content = {}
	self.ach_trd_bex_4.content.loot_global_value = "bex"
	self.ach_trd_bex_4.content.loot_drops = {
		{
			type_items = "suit_variations",
			item_entry = {
				"mariachi",
				"red"
			}
		}
	}
	self.ach_trd_bex_5 = {}
	self.ach_trd_bex_5.dlc = "has_achievement"
	self.ach_trd_bex_5.achievement_id = "bex_7"
	self.ach_trd_bex_5.content = {}
	self.ach_trd_bex_5.content.loot_global_value = "bex"
	self.ach_trd_bex_5.content.loot_drops = {
		{
			type_items = "suit_variations",
			item_entry = {
				"mariachi",
				"black"
			}
		}
	}
	self.ach_mask_bex_9 = {}
	self.ach_mask_bex_9.dlc = "has_achievement"
	self.ach_mask_bex_9.achievement_id = "bex_9"
	self.ach_mask_bex_9.content = {}
	self.ach_mask_bex_9.content.loot_global_value = "bex"
	self.ach_mask_bex_9.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sombrero",
			type_items = "masks"
		}
	}
	self.ach_wcs_bex_10 = {}
	self.ach_wcs_bex_10.dlc = "has_achievement"
	self.ach_wcs_bex_10.achievement_id = "bex_10"
	self.ach_wcs_bex_10.content = {}
	self.ach_wcs_bex_10.content.loot_global_value = "normal"
	self.ach_wcs_bex_10.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_white",
			type_items = "weapon_skins"
		}
	}
	self.ach_wcs_bex_11 = {}
	self.ach_wcs_bex_11.dlc = "has_achievement"
	self.ach_wcs_bex_11.achievement_id = "bex_11"
	self.ach_wcs_bex_11.content = {}
	self.ach_wcs_bex_11.content.loot_global_value = "normal"
	self.ach_wcs_bex_11.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_green_money",
			type_items = "weapon_skins"
		}
	}
	self.wcc_starter_pack = {}
	self.wcc_starter_pack.free = true
	self.wcc_starter_pack.content = {}
	self.wcc_starter_pack.content.loot_global_value = "normal"
	self.wcc_starter_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_camo_free_01",
			type_items = "weapon_skins"
		}
	}
	self.pd2_clan_wcc = {}
	self.pd2_clan_wcc.content = {}
	self.pd2_clan_wcc.dlc = "has_pd2_clan"
	self.pd2_clan_wcc.content.loot_global_value = "pd2_clan"
	self.pd2_clan_wcc.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_camo_free_02",
			type_items = "weapon_skins"
		}
	}
	self.ach_wcc_pex_9 = {}
	self.ach_wcc_pex_9.content = {}
	self.ach_wcc_pex_9.dlc = "has_achievement"
	self.ach_wcc_pex_9.achievement_id = "pex_9"
	self.ach_wcc_pex_9.content.loot_global_value = "normal"
	self.ach_wcc_pex_9.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_camo_achievement_01",
			type_items = "weapon_skins"
		}
	}
	self.ach_wcc_pex_11 = {}
	self.ach_wcc_pex_11.content = {}
	self.ach_wcc_pex_11.dlc = "has_achievement"
	self.ach_wcc_pex_11.achievement_id = "pex_11"
	self.ach_wcc_pex_11.content.loot_global_value = "normal"
	self.ach_wcc_pex_11.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_camo_achievement_02",
			type_items = "weapon_skins"
		}
	}
	self.ach_hnd_dah_1 = {}
	self.ach_hnd_dah_1.dlc = "has_achievement"
	self.ach_hnd_dah_1.achievement_id = "dah_1"
	self.ach_hnd_dah_1.content = {}
	self.ach_hnd_dah_1.content.loot_global_value = "normal"
	self.ach_hnd_dah_1.content.loot_drops = {
		{
			item_entry = "sneak",
			type_items = "gloves"
		}
	}
	self.ach_hnd_mex_9 = {}
	self.ach_hnd_mex_9.dlc = "has_achievement"
	self.ach_hnd_mex_9.achievement_id = "mex_9"
	self.ach_hnd_mex_9.content = {}
	self.ach_hnd_mex_9.content.loot_global_value = "normal"
	self.ach_hnd_mex_9.content.loot_drops = {
		{
			item_entry = "murky",
			type_items = "gloves"
		}
	}
	self.ach_hnd_bex_1 = {}
	self.ach_hnd_bex_1.dlc = "has_achievement"
	self.ach_hnd_bex_1.achievement_id = "bex_1"
	self.ach_hnd_bex_1.content = {}
	self.ach_hnd_bex_1.content.loot_global_value = "bex"
	self.ach_hnd_bex_1.content.loot_drops = {
		{
			item_entry = "mariatchi",
			type_items = "gloves"
		}
	}
	self.fex_starter_pack = {}
	self.fex_starter_pack.free = true
	self.fex_starter_pack.content = {}
	self.fex_starter_pack.content.loot_global_value = "normal"
	self.fex_starter_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_fex_01",
			type_items = "weapon_skins"
		},
		{
			amount = 1,
			item_entry = "color_fex_02",
			type_items = "weapon_skins"
		}
	}
	self.ach_wcc_fex_4 = {}
	self.ach_wcc_fex_4.content = {}
	self.ach_wcc_fex_4.dlc = "has_achievement"
	self.ach_wcc_fex_4.achievement_id = "fex_4"
	self.ach_wcc_fex_4.content.loot_global_value = "fex"
	self.ach_wcc_fex_4.content.loot_drops = {
		{
			item_entry = "cartelboss",
			type_items = "player_styles"
		}
	}
	self.ach_wcc_fex_11 = {}
	self.ach_wcc_fex_11.content = {}
	self.ach_wcc_fex_11.dlc = "has_achievement"
	self.ach_wcc_fex_11.achievement_id = "fex_11"
	self.ach_wcc_fex_11.content.loot_global_value = "fex"
	self.ach_wcc_fex_11.content.loot_drops = {
		{
			amount = 1,
			item_entry = "buluc",
			type_items = "masks"
		}
	}
	self.ach_mask_xm20_1 = {}
	self.ach_mask_xm20_1.dlc = "has_achievement"
	self.ach_mask_xm20_1.achievement_id = "xm20_1"
	self.ach_mask_xm20_1.content = {}
	self.ach_mask_xm20_1.content.loot_global_value = "infamous"
	self.ach_mask_xm20_1.content.loot_drops = {
		{
			item_entry = "mega_max",
			type_items = "masks"
		}
	}
	self.xm20_free = {}
	self.xm20_free.free = true
	self.xm20_free.content = {}
	self.xm20_free.content.loot_global_value = "xm20"
	self.xm20_free.content.loot_drops = {
		{
			item_entry = "wpn_fps_upg_o_tf90",
			type_items = "weapon_mods"
		}
	}
	self.faco_free = {}
	self.faco_free.free = true
	self.faco_free.content = {}
	self.faco_free.content.loot_global_value = "normal"
	self.faco_free.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_faco_00",
			type_items = "weapon_skins"
		}
	}
	self.ach_gsu_01 = {}
	self.ach_gsu_01.content = {}
	self.ach_gsu_01.dlc = "has_achievement"
	self.ach_gsu_01.achievement_id = "gsu_01"
	self.ach_gsu_01.content.loot_global_value = "apfo"
	self.ach_gsu_01.content.loot_drops = {}
	self.ach_gsu_01.content.upgrades = {
		"spoon_gold"
	}
	self.sawp_starter_pack = {}
	self.sawp_starter_pack.free = true
	self.sawp_starter_pack.content = {}
	self.sawp_starter_pack.content.loot_global_value = "normal"
	self.sawp_starter_pack.content.loot_drops = {
		{
			item_entry = "cable_guy",
			type_items = "player_styles"
		}
	}
	self.sawp_grenade = {}
	self.sawp_grenade.dlc = "has_sawp_dlc_or_achievement"
	self.sawp_grenade.achievement_id = "sawp_1"
	self.sawp_grenade.content = {}
	self.sawp_grenade.content.loot_drops = {}
	self.sawp_grenade.content.upgrades = {
		"wpn_gre_electric"
	}
	self.srtr = {}
	self.srtr.dlc = "has_srtr_or_srtr2"
	self.srtr.content = {}
	self.srtr.content.loot_global_value = "srtr"
	self.srtr.content.loot_drops = {
		{
			item_entry = "boss",
			type_items = "player_styles"
		},
		{
			amount = 1,
			item_entry = "boss",
			type_items = "masks"
		}
	}
	self.pda8_wpn_money = {}
	self.pda8_wpn_money.content = {}
	self.pda8_wpn_money.dlc = "has_pda8_wpn_money"
	self.pda8_wpn_money.content.loot_global_value = "pda8_wpn_money"
	self.pda8_wpn_money.content.loot_drops = {}
	self.pda8_wpn_money.content.upgrades = {}
	self.pda10_bessy = {}
	self.pda10_bessy.content = {}
	self.pda10_bessy.dlc = "has_pda10_bessy"
	self.pda10_bessy.content.loot_global_value = "pda10_bessy"
	self.pda10_bessy.content.loot_drops = {}
	self.pda10_bessy.content.upgrades = {}
	self.pda10_piggy_hammer = {}
	self.pda10_piggy_hammer.content = {}
	self.pda10_piggy_hammer.dlc = "has_pda10_piggy_hammer"
	self.pda10_piggy_hammer.content.loot_global_value = "pda10_piggy_hammer"
	self.pda10_piggy_hammer.content.loot_drops = {}
	self.pda10_piggy_hammer.content.upgrades = {}
	self.xmas_snowball = {}
	self.xmas_snowball.content = {}
	self.xmas_snowball.dlc = "has_xmas_snowball"
	self.xmas_snowball.content.loot_global_value = "xmas_snowball"
	self.xmas_snowball.content.loot_drops = {}
	self.xmas_snowball.content.upgrades = {}
	self.ach_tawp_1 = {}
	self.ach_tawp_1.content = {}
	self.ach_tawp_1.dlc = "has_achievement"
	self.ach_tawp_1.achievement_id = "tawp_1"
	self.ach_tawp_1.content.loot_global_value = "normal"
	self.ach_tawp_1.content.loot_drops = {
		{
			item_entry = "wpn_fps_upg_charm_cloaker",
			type_items = "weapon_mods"
		}
	}
	self.ach_tawp_1.content.upgrades = {}
	self.pd2_clan_charm = {}
	self.pd2_clan_charm.content = {}
	self.pd2_clan_charm.dlc = "has_pd2_clan"
	self.pd2_clan_charm.content.loot_global_value = "pd2_clan"
	self.pd2_clan_charm.content.loot_drops = {
		{
			item_entry = "wpn_fps_upg_charm_skulldozer",
			type_items = "weapon_mods"
		}
	}
	self.tawp_gage_pack_shotgun = {}
	self.tawp_gage_pack_shotgun.dlc = "has_gage_pack_shotgun"
	self.tawp_gage_pack_shotgun.content = {}
	self.tawp_gage_pack_shotgun.content.loot_global_value = "gage_pack_shotgun"
	self.tawp_gage_pack_shotgun.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_pis_type54_underbarrel_slug",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_type54_underbarrel_piercing",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_x_type54_underbarrel_slug",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_x_type54_underbarrel_piercing",
			type_items = "weapon_mods"
		}
	}
	self.tawp_bbq = {}
	self.tawp_bbq.dlc = "has_bbq"
	self.tawp_bbq.content = {}
	self.tawp_bbq.content.loot_global_value = "bbq"
	self.tawp_bbq.content.loot_drops = {}
	self.lawp_starter_pack = {}
	self.lawp_starter_pack.free = true
	self.lawp_starter_pack.content = {}
	self.lawp_starter_pack.content.loot_global_value = "normal"
	self.lawp_starter_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fl_pis_perst",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_pis_putnik",
			type_items = "weapon_mods"
		}
	}
	self.a10mask_bundle = {}
	self.a10mask_bundle.dlc = "has_a10mask"
	self.a10mask_bundle.content = {}
	self.a10mask_bundle.content.loot_global_value = "a10th"
	self.a10mask_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "jesterskulls",
			type_items = "masks"
		}
	}
	self.ach_pxp1_01 = {}
	self.ach_pxp1_01.dlc = "has_achievement"
	self.ach_pxp1_01.achievement_id = "pxp1_1"
	self.ach_pxp1_01.content = {}
	self.ach_pxp1_01.content.loot_drops = {}
	self.ach_pxp1_01.content.upgrades = {
		"poison_gas_grenade"
	}
	self.pxp1_bbq = {}
	self.pxp1_bbq.dlc = "has_bbq"
	self.pxp1_bbq.content = {}
	self.pxp1_bbq.content.loot_global_value = "bbq"
	self.pxp1_bbq.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_grenade_launcher_incendiary_ms3gl",
			type_items = "weapon_mods"
		}
	}
	self.pxp1_sawp = {}
	self.pxp1_sawp.dlc = "has_sawp"
	self.pxp1_sawp.content = {}
	self.pxp1_sawp.content.loot_global_value = "sawp"
	self.pxp1_sawp.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_grenade_launcher_electric_ms3gl",
			type_items = "weapon_mods"
		}
	}
	self.ach_pxp2_1 = {}
	self.ach_pxp2_1.dlc = "has_achievement"
	self.ach_pxp2_1.achievement_id = "pxp2_1"
	self.ach_pxp2_1.content = {}
	self.ach_pxp2_1.content.loot_global_value = "pxp2"
	self.ach_pxp2_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_hailstorm_conversion",
			type_items = "weapon_mods"
		}
	}
	self.ach_pxp2_2 = {}
	self.ach_pxp2_2.dlc = "has_achievement"
	self.ach_pxp2_2.achievement_id = "pxp2_2"
	self.ach_pxp2_2.content = {}
	self.ach_pxp2_2.content.loot_global_value = "pxp2"
	self.ach_pxp2_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_sho_sko12_conversion",
			type_items = "weapon_mods"
		}
	}
	self.ach_pxp2_3 = {}
	self.ach_pxp2_3.dlc = "has_achievement"
	self.ach_pxp2_3.achievement_id = "pxp2_3"
	self.ach_pxp2_3.content = {}
	self.ach_pxp2_3.content.loot_global_value = "normal"
	self.ach_pxp2_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_rip",
			type_items = "weapon_mods"
		}
	}
	self.pxp2_starter_pack = {}
	self.pxp2_starter_pack.free = true
	self.pxp2_starter_pack.content = {}
	self.pxp2_starter_pack.content.loot_global_value = "normal"
	self.pxp2_starter_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_charm_beer",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_charm_foam",
			type_items = "weapon_mods"
		}
	}
	self.pxp3_starter_pack = {}
	self.pxp3_starter_pack.free = true
	self.pxp3_starter_pack.content = {}
	self.pxp3_starter_pack.content.loot_global_value = "normal"
	self.pxp3_starter_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_grenade_launcher_hornet",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_underbarrel_hornet",
			type_items = "weapon_mods"
		}
	}
	self.pxp4_starter_pack = {}
	self.pxp4_starter_pack.free = true
	self.pxp4_starter_pack.content = {}
	self.pxp4_starter_pack.content.loot_global_value = "normal"
	self.pxp4_starter_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_pxp4_01",
			type_items = "weapon_skins"
		},
		{
			amount = 1,
			item_entry = "color_pxp4_02",
			type_items = "weapon_skins"
		},
		{
			amount = 1,
			item_entry = "color_pxp4_03",
			type_items = "weapon_skins"
		},
		{
			amount = 1,
			item_entry = "color_pxp4_04",
			type_items = "weapon_skins"
		},
		{
			amount = 1,
			item_entry = "color_pxp4_05",
			type_items = "weapon_skins"
		},
		{
			amount = 1,
			item_entry = "color_pxp4_06",
			type_items = "weapon_skins"
		},
		{
			amount = 1,
			item_entry = "color_pxp4_07",
			type_items = "weapon_skins"
		},
		{
			amount = 1,
			item_entry = "color_pxp4_08",
			type_items = "weapon_skins"
		}
	}
	self.sbzac_elegantteeth = {}
	self.sbzac_elegantteeth.content = {}
	self.sbzac_elegantteeth.content.loot_global_value = "sbzac_elegantteeth"
	self.sbzac_elegantteeth.content.loot_drops = {
		{
			amount = 1,
			item_entry = "elegantteeth",
			type_items = "masks"
		}
	}
	self.sbzac_wpn_fps_upg_charm_skullz = {}
	self.sbzac_wpn_fps_upg_charm_skullz.content = {}
	self.sbzac_wpn_fps_upg_charm_skullz.content.loot_global_value = "sbzac_wpn_fps_upg_charm_skullz"
	self.sbzac_wpn_fps_upg_charm_skullz.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_charm_skullz",
			type_items = "weapon_mods"
		}
	}
	self.sbzac_elegantscarf = {}
	self.sbzac_elegantscarf.content = {}
	self.sbzac_elegantscarf.content.loot_global_value = "sbzac_elegantscarf"
	self.sbzac_elegantscarf.content.loot_drops = {
		{
			amount = 1,
			item_entry = "elegantscarf",
			type_items = "player_styles"
		}
	}
	self.sbzac_color_sbzac2_01 = {}
	self.sbzac_color_sbzac2_01.content = {}
	self.sbzac_color_sbzac2_01.content.loot_global_value = "sbzac_color_sbzac2_01"
	self.sbzac_color_sbzac2_01.content.loot_drops = {
		{
			amount = 1,
			item_entry = "color_sbzac2_01",
			type_items = "weapon_skins"
		}
	}
	self.ach_dec21_01 = {}
	self.ach_dec21_01.content = {}
	self.ach_dec21_01.dlc = "has_achievement"
	self.ach_dec21_01.achievement_id = "dec21_01"
	self.ach_dec21_01.content.loot_global_value = "xm21"
	self.ach_dec21_01.content.loot_drops = {
		{
			item_entry = "wpn_fps_upg_charm_lusse",
			type_items = "weapon_mods"
		}
	}
	self.ach_dec21_02 = {}
	self.ach_dec21_02.content = {}
	self.ach_dec21_02.dlc = "has_achievement"
	self.ach_dec21_02.achievement_id = "dec21_02"
	self.ach_dec21_02.content.loot_global_value = "xm21"
	self.ach_dec21_02.content.loot_drops = {
		{
			item_entry = "wpn_fps_upg_charm_ball",
			type_items = "weapon_mods"
		}
	}
	self.ach_ja22_01 = {}
	self.ach_ja22_01.dlc = "has_achievement"
	self.ach_ja22_01.achievement_id = "ja22_01"
	self.ach_ja22_01.content = {}
	self.ach_ja22_01.content.loot_global_value = "ja22"
	self.ach_ja22_01.content.loot_drops = {
		{
			item_entry = "wpn_fps_m4_upg_fg_mk12",
			type_items = "weapon_mods"
		}
	}
	self.ach_mask_pent_9 = {}
	self.ach_mask_pent_9.content = {}
	self.ach_mask_pent_9.dlc = "has_achievement"
	self.ach_mask_pent_9.achievement_id = "pent_9"
	self.ach_mask_pent_9.content.loot_global_value = "pent"
	self.ach_mask_pent_9.content.loot_drops = {
		{
			item_entry = "yufuhelmet",
			type_items = "masks"
		}
	}
	self.ach_trd_pent_11 = {}
	self.ach_trd_pent_11.content = {}
	self.ach_trd_pent_11.dlc = "has_achievement"
	self.ach_trd_pent_11.achievement_id = "pent_11"
	self.ach_trd_pent_11.content.loot_global_value = "pent"
	self.ach_trd_pent_11.content.loot_drops = {
		{
			item_entry = "kungfumaster",
			type_items = "player_styles"
		}
	}
	self.ach_deep_10 = {}
	self.ach_deep_10.content = {}
	self.ach_deep_10.dlc = "has_achievement"
	self.ach_deep_10.achievement_id = "deep_10"
	self.ach_deep_10.content.loot_global_value = "deep"
	self.ach_deep_10.content.loot_drops = {
		{
			item_entry = "bossflag",
			type_items = "player_styles"
		},
		{
			item_entry = "bossflagmask",
			type_items = "masks"
		}
	}
	self.ach_deep_12 = {}
	self.ach_deep_12.content = {}
	self.ach_deep_12.dlc = "has_achievement"
	self.ach_deep_12.achievement_id = "deep_12"
	self.ach_deep_12.content.loot_global_value = "deep"
	self.ach_deep_12.content.loot_drops = {
		{
			item_entry = "gabhelm",
			type_items = "masks"
		}
	}
	self.rat_oilbaron = {}
	self.rat_oilbaron.content = {}
	self.rat_oilbaron.content.loot_global_value = "rat_oilbaron"
	self.rat_oilbaron.content.loot_drops = {
		{
			amount = 1,
			item_entry = "oilbaron",
			type_items = "masks"
		}
	}
	self.rat_ranchdiesel = {}
	self.rat_ranchdiesel.content = {}
	self.rat_ranchdiesel.content.loot_global_value = "rat_ranchdiesel"
	self.rat_ranchdiesel.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ranchdiesel",
			type_items = "gloves"
		}
	}
	self.rat_mocow = {}
	self.rat_mocow.content = {}
	self.rat_mocow.content.loot_global_value = "rat_mocow"
	self.rat_mocow.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mocow",
			type_items = "player_styles"
		}
	}
	self.prim_primtime = {}
	self.prim_primtime.content = {}
	self.prim_primtime.content.loot_global_value = "prim_primtime"
	self.prim_primtime.content.loot_drops = {
		{
			amount = 1,
			item_entry = "primtime",
			type_items = "masks"
		}
	}
	self.prim_darkmat = {}
	self.prim_darkmat.content = {}
	self.prim_darkmat.content.loot_global_value = "prim_darkmat"
	self.prim_darkmat.content.loot_drops = {
		{
			amount = 1,
			item_entry = "darkmat",
			type_items = "gloves"
		}
	}
	self.prim_newhorizon = {}
	self.prim_newhorizon.content = {}
	self.prim_newhorizon.content.loot_global_value = "prim_newhorizon"
	self.prim_newhorizon.content.loot_drops = {
		{
			amount = 1,
			item_entry = "newhorizon",
			type_items = "player_styles"
		}
	}
	self.a11th_homburg = {}
	self.a11th_homburg.content = {}
	self.a11th_homburg.content.loot_global_value = "a11th_homburg"
	self.a11th_homburg.content.loot_drops = {
		{
			amount = 1,
			item_entry = "homburg",
			type_items = "masks"
		}
	}
	self.a11th_homburg_grey = {}
	self.a11th_homburg_grey.content = {}
	self.a11th_homburg_grey.content.loot_global_value = "a11th_homburg_grey"
	self.a11th_homburg_grey.content.loot_drops = {
		{
			amount = 1,
			item_entry = "homburg_grey",
			type_items = "masks"
		}
	}
	self.a11th_corl = {}
	self.a11th_corl.content = {}
	self.a11th_corl.content.loot_global_value = "a11th_corl"
	self.a11th_corl.content.loot_drops = {
		{
			amount = 1,
			item_entry = "corl",
			type_items = "player_styles"
		}
	}
	self.a11th_stinger = {}
	self.a11th_stinger.content = {}
	self.a11th_stinger.content.loot_global_value = "a11th_stinger"
	self.trt_railhat = {}
	self.trt_railhat.content = {}
	self.trt_railhat.content.loot_global_value = "trt_railhat"
	self.trt_railhat.content.loot_drops = {
		{
			amount = 1,
			item_entry = "railhat",
			type_items = "masks"
		}
	}
	self.trt_railwork = {}
	self.trt_railwork.content = {}
	self.trt_railwork.content.loot_global_value = "trt_railwork"
	self.trt_railwork.content.loot_drops = {
		{
			amount = 1,
			item_entry = "railwork",
			type_items = "gloves"
		}
	}
	self.trt_railroad = {}
	self.trt_railroad.content = {}
	self.trt_railroad.content.loot_global_value = "trt_railroad"
	self.trt_railroad.content.loot_drops = {
		{
			amount = 1,
			item_entry = "railroad",
			type_items = "player_styles"
		}
	}
	self.h22_deadman = {}
	self.h22_deadman.content = {}
	self.h22_deadman.content.loot_global_value = "h22_deadman"
	self.h22_deadman.content.loot_drops = {
		{
			amount = 1,
			item_entry = "deadman",
			type_items = "masks"
		}
	}
	self.h22_nightwalker = {}
	self.h22_nightwalker.content = {}
	self.h22_nightwalker.content.loot_global_value = "h22_nightwalker"
	self.h22_nightwalker.content.loot_drops = {
		{
			amount = 1,
			item_entry = "nightwalker",
			type_items = "player_styles"
		}
	}
	self.h22_tasslefringe = {}
	self.h22_tasslefringe.content = {}
	self.h22_tasslefringe.content.loot_global_value = "h22_tasslefringe"
	self.h22_tasslefringe.content.loot_drops = {
		{
			amount = 1,
			item_entry = "tasslefringe",
			type_items = "gloves"
		}
	}
	self.h22_bloodysnarl = {}
	self.h22_bloodysnarl.content = {}
	self.h22_bloodysnarl.content.loot_global_value = "h22_bloodysnarl"
	self.h22_bloodysnarl.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bloodysnarl",
			type_items = "masks"
		}
	}
	self.h22_ghostly = {}
	self.h22_ghostly.content = {}
	self.h22_ghostly.content.loot_global_value = "h22_ghostly"
	self.h22_ghostly.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ghostly",
			type_items = "player_styles"
		}
	}
	self.h22_tornrags = {}
	self.h22_tornrags.content = {}
	self.h22_tornrags.content.loot_global_value = "h22_tornrags"
	self.h22_tornrags.content.loot_drops = {
		{
			amount = 1,
			item_entry = "tornrags",
			type_items = "gloves"
		}
	}
	self.h22_banshee = {}
	self.h22_banshee.content = {}
	self.h22_banshee.content.loot_global_value = "h22_banshee"
	self.h22_banshee.content.loot_drops = {
		{
			amount = 1,
			item_entry = "banshee",
			type_items = "masks"
		}
	}
	self.h22_darkprince = {}
	self.h22_darkprince.content = {}
	self.h22_darkprince.content.loot_global_value = "h22_darkprince"
	self.h22_darkprince.content.loot_drops = {
		{
			amount = 1,
			item_entry = "darkprince",
			type_items = "player_styles"
		}
	}
	self.h22_devilclaws = {}
	self.h22_devilclaws.content = {}
	self.h22_devilclaws.content.loot_global_value = "h22_devilclaws"
	self.h22_devilclaws.content.loot_drops = {
		{
			amount = 1,
			item_entry = "devilclaws",
			type_items = "gloves"
		}
	}
	self.h22_devilhorn = {}
	self.h22_devilhorn.content = {}
	self.h22_devilhorn.content.loot_global_value = "h22_devilhorn"
	self.h22_devilhorn.content.loot_drops = {
		{
			amount = 1,
			item_entry = "devilhorn",
			type_items = "masks"
		}
	}
	self.cot_smilecigar = {}
	self.cot_smilecigar.content = {}
	self.cot_smilecigar.content.loot_global_value = "cot_smilecigar"
	self.cot_smilecigar.content.loot_drops = {
		{
			amount = 1,
			item_entry = "smilecigar",
			type_items = "masks"
		}
	}
	self.cot_sleekygent = {}
	self.cot_sleekygent.content = {}
	self.cot_sleekygent.content.loot_global_value = "cot_sleekygent"
	self.cot_sleekygent.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sleekygent",
			type_items = "player_styles"
		}
	}
	self.cot_beigedriver = {}
	self.cot_beigedriver.content = {}
	self.cot_beigedriver.content.loot_global_value = "cot_beigedriver"
	self.cot_beigedriver.content.loot_drops = {
		{
			amount = 1,
			item_entry = "beigedriver",
			type_items = "gloves"
		}
	}
	self.dot_roclown_suit = {}
	self.dot_roclown_suit.content = {}
	self.dot_roclown_suit.content.loot_global_value = "dot_roclown_suit"
	self.dot_roclown_suit.content.loot_drops = {
		{
			amount = 1,
			item_entry = "roclown",
			type_items = "player_styles"
		}
	}
	self.dot_roclogrip_glv = {}
	self.dot_roclogrip_glv.content = {}
	self.dot_roclogrip_glv.content.loot_global_value = "dot_roclogrip_glv"
	self.dot_roclogrip_glv.content.loot_drops = {
		{
			amount = 1,
			item_entry = "roclogrip",
			type_items = "gloves"
		}
	}
	self.dot_roclown_msk = {}
	self.dot_roclown_msk.content = {}
	self.dot_roclown_msk.content.loot_global_value = "dot_roclown_msk"
	self.dot_roclown_msk.content.loot_drops = {
		{
			amount = 1,
			item_entry = "roclown",
			type_items = "masks"
		}
	}
	self.mrwi_deck = {}
	self.mrwi_deck.content = {}
	self.mrwi_deck.dlc = "has_mrwi_deck"
	self.mrwi_deck.content.loot_global_value = "mrwi_deck"
	self.mrwi_deck.content.loot_drops = {}
	self.mrwi_deck.content.upgrades = {}
	self.chico_or_mrwi_deck = {}
	self.chico_or_mrwi_deck.content = {}
	self.chico_or_mrwi_deck.dlc = "has_chico_or_mrwi_deck"
	self.chico_or_mrwi_deck.content.loot_global_value = "chico"
	self.chico_or_mrwi_deck.content.loot_drops = {}
	self.chico_or_mrwi_deck.content.upgrades = {}
	self.ecp_or_mrwi_deck = {}
	self.ecp_or_mrwi_deck.content = {}
	self.ecp_or_mrwi_deck.dlc = "has_ecp_or_mrwi_deck"
	self.ecp_or_mrwi_deck.content.loot_global_value = "ecp"
	self.ecp_or_mrwi_deck.content.loot_drops = {}
	self.ecp_or_mrwi_deck.content.upgrades = {}
	self.mxm_upgrades = {}
	self.mxm_upgrades.content = {}
	self.mxm_upgrades.dlc = "has_mxm"
	self.mxm_upgrades.content.loot_global_value = "mxm"
	self.mxm_upgrades.content.loot_drops = {}
	self.mxm_upgrades.content.upgrades = {
		"sticky_grenade",
		"grenade_crate"
	}
	self.esp_upgrades = {
		dlc = "has_esp",
		content = {
			loot_global_value = "esp",
			loot_drops = {},
			upgrades = {
				"spy_camera"
			}
		}
	}
	self.victor_mods_pack_1 = {}
	self.victor_mods_pack_1.content = {}
	self.victor_mods_pack_1.dlc = "has_victor_mods_pack_1"
	self.victor_mods_pack_1.content.loot_global_value = "victor_mods_pack_1"
	self.victor_mods_pack_1.content.loot_drops = {}
	self.victor_mods_pack_1.content.upgrades = {}
	self.victor_mods_pack_2 = {}
	self.victor_mods_pack_2.content = {}
	self.victor_mods_pack_2.dlc = "has_victor_mods_pack_2"
	self.victor_mods_pack_2.content.loot_global_value = "victor_mods_pack_2"
	self.victor_mods_pack_2.content.loot_drops = {}
	self.victor_mods_pack_2.content.upgrades = {}
	self.ach_lrfo_1 = {}
	self.ach_lrfo_1.content = {}
	self.ach_lrfo_1.dlc = "has_achievement"
	self.ach_lrfo_1.achievement_id = "lrfo_1"
	self.ach_lrfo_1.content.loot_global_value = "lrfo"
	self.ach_lrfo_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "hackmask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "hacksuit",
			type_items = "player_styles"
		},
		{
			amount = 1,
			item_entry = "hackglove",
			type_items = "gloves"
		}
	}
end
