function DLCTweakData:init_console()
	self.complete_overkill_pack.content_on_consoles = true
	self.complete_overkill_pack2.content_on_consoles = true
	self.complete_overkill_pack3.content_on_consoles = true
	self.xone_bonus = {}
	self.xone_bonus.free = true
	self.xone_bonus.content = {}
	self.xone_bonus.content_on_consoles = true
	self.xone_bonus.content.loot_global_value = "infamous"
	self.xone_bonus.content.loot_drops = {
		{
			amount = 1,
			item_entry = "unforsaken",
			type_items = "masks"
		}
	}
	self.console_kenaz = {}
	self.console_kenaz.content_on_consoles = true
	self.console_kenaz.dlc = "has_parent_dlc"
	self.console_kenaz.parent_dlc = "kenaz"
	self.console_kenaz.content = {}
	self.console_kenaz.content.loot_global_value = "kenaz"
	self.console_kenaz.content.loot_drops = {
		{
			amount = 1,
			item_entry = "croupier_hat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "gladiator_helmet",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "the_king_mask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sports_utility_mask",
			type_items = "masks"
		}
	}
	self.console_akm4_pack = {}
	self.console_akm4_pack.content_on_consoles = true
	self.console_akm4_pack.dlc = "has_parent_dlc"
	self.console_akm4_pack.parent_dlc = "akm4_pack"
	self.console_akm4_pack.content = {}
	self.console_akm4_pack.content.loot_global_value = "akm4_pack"
	self.console_akm4_pack.content.loot_drops = {
		{
			amount = 1,
			item_entry = "carnotaurus",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "triceratops",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "pachy",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "velociraptor",
			type_items = "masks"
		}
	}
	self.console_bbq = {}
	self.console_bbq.content_on_consoles = true
	self.console_bbq.dlc = "has_parent_dlc"
	self.console_bbq.parent_dlc = "bbq"
	self.console_bbq.content = {}
	self.console_bbq.content.loot_global_value = "bbq"
	self.console_bbq.content.loot_drops = {
		{
			amount = 1,
			item_entry = "firedemon",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "gasmask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "firemask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "chef_hat",
			type_items = "masks"
		}
	}
	self.console_west = {}
	self.console_west.content_on_consoles = true
	self.console_west.dlc = "has_parent_dlc"
	self.console_west.parent_dlc = "west"
	self.console_west.content = {}
	self.console_west.content.loot_global_value = "west"
	self.console_west.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bandit",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bullskull",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "kangee",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "lone",
			type_items = "masks"
		}
	}
	self.console_arena = {}
	self.console_arena.content_on_consoles = true
	self.console_arena.dlc = "has_parent_dlc"
	self.console_arena.parent_dlc = "arena"
	self.console_arena.content = {}
	self.console_arena.content.loot_global_value = "arena"
	self.console_arena.content.loot_drops = {
		{
			amount = 1,
			item_entry = "concert_male",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "concert_female",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "boombox",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "cantus",
			type_items = "masks"
		}
	}
	self.console_turtles = {}
	self.console_turtles.content_on_consoles = true
	self.console_turtles.dlc = "has_parent_dlc"
	self.console_turtles.parent_dlc = "turtles"
	self.console_turtles.content = {}
	self.console_turtles.content.loot_global_value = "turtles"
	self.console_turtles.content.loot_drops = {
		{
			amount = 1,
			item_entry = "slicer",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "kage",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "ninja_hood",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "shirai",
			type_items = "masks"
		}
	}
	self.console_berry = {}
	self.console_berry.content_on_consoles = true
	self.console_berry.dlc = "has_parent_dlc"
	self.console_berry.parent_dlc = "berry"
	self.console_berry.content = {}
	self.console_berry.content.loot_global_value = "berry"
	self.console_berry.content.loot_drops = {
		{
			amount = 1,
			item_entry = "water_spirit",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tane",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "oro",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "maui",
			type_items = "masks"
		}
	}
	self.console_steel = {}
	self.console_steel.content_on_consoles = true
	self.console_steel.dlc = "has_parent_dlc"
	self.console_steel.parent_dlc = "steel"
	self.console_steel.content = {}
	self.console_steel.content.loot_global_value = "steel"
	self.console_steel.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mason_knight_veteran",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "agatha_knight",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "agatha_vanguard_veteran",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mason_vanguard_veteran",
			type_items = "masks"
		}
	}
	self.console_sokol = {}
	self.console_sokol.content_on_consoles = true
	self.console_sokol.dlc = "has_parent_dlc"
	self.console_sokol.parent_dlc = "character_pack_sokol"
	self.console_sokol.content = {}
	self.console_sokol.content.loot_global_value = "character_pack_sokol"
	self.console_sokol.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sokol",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sokol_begins",
			type_items = "masks"
		}
	}
	self.console_dragon = {}
	self.console_dragon.content_on_consoles = true
	self.console_dragon.dlc = "has_parent_dlc"
	self.console_dragon.parent_dlc = "dragon"
	self.console_dragon.content = {}
	self.console_dragon.content.loot_global_value = "dragon"
	self.console_dragon.content.loot_drops = {
		{
			amount = 1,
			item_entry = "jiro",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "jiro_begins",
			type_items = "masks"
		}
	}
	self.console_hlm2_deluxe = {}
	self.console_hlm2_deluxe.content_on_consoles = true
	self.console_hlm2_deluxe.free = true
	self.console_hlm2_deluxe.content = {}
	self.console_hlm2_deluxe.content.loot_global_value = "normal"
	self.console_hlm2_deluxe.content.loot_drops = {
		{
			amount = 1,
			item_entry = "richard_returns",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "richard_begins",
			type_items = "masks"
		}
	}
	self.console_bonnie = {}
	self.console_bonnie.content_on_consoles = true
	self.console_bonnie.free = true
	self.console_bonnie.content = {}
	self.console_bonnie.content.loot_global_value = "infamous"
	self.console_bonnie.content.loot_drops = {
		{
			amount = 1,
			item_entry = "bonnie",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "bonnie_begins",
			type_items = "masks"
		}
	}
	self.console_rip = {}
	self.console_rip.content_on_consoles = true
	self.console_rip.free = true
	self.console_rip.content = {}
	self.console_rip.content.loot_global_value = "infamous"
	self.console_rip.content.loot_drops = {
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
	self.console_crimewave = {}
	self.console_crimewave.content_on_consoles = true
	self.console_crimewave.dlc = "has_crimewave_edition"
	self.console_crimewave.content = {}
	self.console_crimewave.content.loot_global_value = "normal"
	self.console_crimewave.content.loot_drops = {
		{
			amount = 2,
			item_entry = "clinton",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "bush",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "obama",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "nixon",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_m45_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_m45_g_bling",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_s552_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_s552_fg_railed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_m45_b_small",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_ppk_g_laser",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_s552_g_standard_green",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_ppk_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_m45_g_ergo",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_s552_body_standard_black",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_cmore",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_s552_s_standard_green",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_m45_b_green",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_m45_body_green",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_s552_fg_standard_green",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_m45_s_folded",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "goat",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "panda",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "pitbull",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "eagle",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_m4_g_mgrip",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_i_singlefire",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_p226_co_comp_1",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_scar_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_scar_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_scar_s_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_m4_g_hgrip",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_i_autofire",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_scar_fg_railext",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_p226_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_p226_co_comp_2",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_mp7_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_mp7_s_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_p226_b_equinox",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_mp7_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_p226_g_ergo",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_p226_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "cloth_commander",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "gage_blade",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "gage_rambo",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "gage_deltaforce",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_m249_fg_mk46",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_hk21_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_m249_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_rpk_s_standard",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_rpk_fg_standard",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_m249_s_solid",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_hk21_g_ergo",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_hk21_fg_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_g_hgrip",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_rage_extra",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fg_midwest",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fg_jp",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_m4_s_mk46",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_eotech_xps",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_reflex",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_fg_tapco",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_deagle_extra",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fg_smr",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_cs",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_pis_ns_flash",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_g_wgrip",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_rx30",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_g_pgrip",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_shot_ns_king",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_ns_surefire",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_b_draco",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fl_ass_laser",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_rx01",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_fl_ass_peq15",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_m4_m_quad",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ak_m_quad",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_pis_medium_slim",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_ns_linear",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_rmr",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ass_ns_jprifles",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_m4_s_crane",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "robberfly",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "spider",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "mantis",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "wasp",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_msr_body_msr",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_r93_body_wood",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_r93_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_leupold",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_45iron",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_m95_barrel_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_msr_ns_suppressor",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_r93_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_m95_barrel_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_m95_barrel_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_msr_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "silverback",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "mandril",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "skullmonkey",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "orangutang",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_striker_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_mbus_rear",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ben_s_collapsed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_piercing",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ksg_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ksg_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ben_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_explosive",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_custom",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_striker_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ben_s_solid",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_sho_ben_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_a_slug",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "galax",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "crowgoblin",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "evil",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "volt",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_fg_sar",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_s_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_g_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_fg_fab",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_g_retro",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_fab",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_g_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_fg_railed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_s_wood",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_skeletal",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_fg_retro_plastic",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_b_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_gre_m79_barrel_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_fg_psg",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_famas_g_retro",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_gre_m79_stock_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_light",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_fg_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_wood",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_s_plastic",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_fg_retro",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_galil_fg_mar",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_g3_b_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "churchill",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "red_hurricane",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "patton",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "de_gaulle",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_m_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_s_nostock",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_iron_sight",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_b_standard",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_mg42_b_mg34",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_s_solid",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_b_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_m_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_s_solid",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_lmg_mg42_b_vg38",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_body_black",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_nozzle",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_s_folded",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_c96_sight",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_sterling_b_e11",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_snp_mosin_ns_bayonet",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "franklin",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "lincoln",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "grant",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "washington",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_g_01",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_fg_04",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_s_01",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_fg_wood",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_fg_03",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_s_03",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_s_wood",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_m_01",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_fal_fg_01",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "white_wolf",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "owl",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "rabbit",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "pig",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "panther",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "rooster",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "horse",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "tiger",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_scorpion_s_nostock",
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
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_uzi_b_suppressed",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_tec9_b_standard",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_uzi_fg_rail",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_tec9_s_unfolded",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_uzi_s_solid",
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
			item_entry = "wpn_fps_smg_tec9_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_scorpion_g_wood",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_tec9_ns_ext",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_uzi_s_leather",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_smg_scorpion_g_ergo",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "medusa",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "anubis",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "pazuzu",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "cursed_crown",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "msk_grizel",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "grizel_clean",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_l85a2_b_long",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_l85a2_g_worn",
			type_items = "weapon_mods"
		},
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
			item_entry = "wpn_fps_ass_l85a2_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "dragan",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "dragan_begins",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_vhs_b_short",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_vhs_b_silenced",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_ass_vhs_b_sniper",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "butcher",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "doctor",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "tech_lion",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "lady_butcher",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_hs2000_sl_custom",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_hs2000_m_extended",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_pis_hs2000_sl_long",
			type_items = "weapon_mods"
		},
		{
			amount = 2,
			item_entry = "santa_mad",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "santa_drunk",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "santa_surprise",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "nun_town",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "robo_arnold",
			type_items = "masks"
		},
		{
			amount = 2,
			item_entry = "arch_nemesis",
			type_items = "masks"
		}
	}
	self.console_mad = {}
	self.console_mad.content_on_consoles = true
	self.console_mad.dlc = "has_parent_dlc"
	self.console_mad.parent_dlc = "mad"
	self.console_mad.content = {}
	self.console_mad.content.loot_global_value = "mad"
	self.console_mad.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mad_mask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "half_mask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "mad_goggles",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "visor",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "nebula",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "planet",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "rusty",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "spaceship",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hexagons",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "jimmy_phoenix",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "rebel",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "squares",
			type_items = "textures"
		}
	}
	self.console_coco = {}
	self.console_coco.content_on_consoles = true
	self.console_coco.dlc = "has_parent_dlc"
	self.console_coco.parent_dlc = "coco"
	self.console_coco.content = {}
	self.console_coco.content.loot_global_value = "coco"
	self.console_coco.content.loot_drops = {
		{
			amount = 1,
			item_entry = "jimmy",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "jimmy_duct",
			type_items = "masks"
		}
	}
	self.console_pal = {}
	self.console_pal.content_on_consoles = true
	self.console_pal.dlc = "has_parent_dlc"
	self.console_pal.parent_dlc = "pal"
	self.console_pal.content = {}
	self.console_pal.content.loot_global_value = "pal"
	self.console_pal.content.loot_drops = {
		{
			amount = 1,
			item_entry = "divided",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "viking",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "nutcracker",
			type_items = "masks"
		},
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
			item_entry = "day",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "redwhite",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "mushroom_cloud",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "fenris",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "kurbits",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "luse",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "split",
			type_items = "textures"
		}
	}
	self.console_peta = {}
	self.console_peta.content_on_consoles = true
	self.console_peta.dlc = "has_parent_dlc"
	self.console_peta.parent_dlc = "peta"
	self.console_peta.content = {}
	self.console_peta.content.loot_global_value = "peta"
	self.console_peta.content.loot_drops = {
		{
			amount = 1,
			item_entry = "goat_goat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "fancy_goat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tall_goat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wet_goat",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "goateye",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "flamingoeye",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hay",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "tongue",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "giraffe",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "illumigoati",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "goatface",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "fur",
			type_items = "textures"
		}
	}
	self.console_opera = {}
	self.console_opera.content_on_consoles = true
	self.console_opera.dlc = "has_parent_dlc"
	self.console_opera.parent_dlc = "opera"
	self.console_opera.content = {}
	self.console_opera.content.loot_global_value = "opera"
	self.console_opera.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sydney",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sydney_begins",
			type_items = "masks"
		}
	}
	self.console_born = {}
	self.console_born.content_on_consoles = true
	self.console_born.dlc = "has_parent_dlc"
	self.console_born.parent_dlc = "born"
	self.console_born.content = {}
	self.console_born.content.loot_global_value = "born"
	self.console_born.content.loot_drops = {
		{
			amount = 1,
			item_entry = "born_biker_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "born_biker_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "born_biker_03",
			type_items = "masks"
		},
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
			item_entry = "devil_eye",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "hotrod_red",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "shiny_and_chrome",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "biker_face",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "skull_engine",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "skull_wing",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "tire_fire",
			type_items = "textures"
		}
	}
	self.console_wild = {}
	self.console_wild.content_on_consoles = true
	self.console_wild.dlc = "has_parent_dlc"
	self.console_wild.parent_dlc = "wild"
	self.console_wild.content = {}
	self.console_wild.content.loot_global_value = "wild"
	self.console_wild.content.loot_drops = {
		{
			amount = 1,
			item_entry = "rust",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "rust_begins",
			type_items = "masks"
		}
	}
	self.console_clan_migg = {}
	self.console_clan_migg.content_on_consoles = true
	self.console_clan_migg.free = true
	self.console_clan_migg.content = {}
	self.console_clan_migg.content.loot_global_value = "normal"
	self.console_clan_migg.content.loot_drops = {
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
	self.console_clan_fibb = {}
	self.console_clan_fibb.content_on_consoles = true
	self.console_clan_fibb.free = true
	self.console_clan_fibb.content = {}
	self.console_clan_fibb.content.loot_global_value = "normal"
	self.console_clan_fibb.content.loot_drops = {
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
	self.console_gotti_bundle = {}
	self.console_gotti_bundle.content_on_consoles = true
	self.console_gotti_bundle.free = true
	self.console_gotti_bundle.content = {}
	self.console_gotti_bundle.content.loot_global_value = "normal"
	self.console_gotti_bundle.content.loot_drops = {
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
	self.console_nyck_bundle = {}
	self.console_nyck_bundle.content_on_consoles = true
	self.console_nyck_bundle.free = false
	self.console_nyck_bundle.content = {}
	self.console_nyck_bundle.content.loot_global_value = "normal"
	self.console_nyck_bundle.content.loot_drops = {
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
	self.console_urf_bundle = {}
	self.console_urf_bundle.content_on_consoles = true
	self.console_urf_bundle.free = false
	self.console_urf_bundle.content = {}
	self.console_urf_bundle.content.loot_global_value = "normal"
	self.console_urf_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "urf_seal",
			type_items = "masks"
		}
	}
	self.console_howl = {}
	self.console_howl.content_on_consoles = true
	self.console_howl.free = false
	self.console_howl.content = {}
	self.console_howl.content.loot_global_value = "halloween"
	self.console_howl.content.loot_drops = {
		{
			amount = 1,
			item_entry = "hwl_dallas_zombie",
			type_items = "masks"
		}
	}
	self.console_help_4 = {}
	self.console_help_4.content_on_consoles = true
	self.console_help_4.free = false
	self.console_help_4.content = {}
	self.console_help_4.content.loot_global_value = "halloween"
	self.console_help_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "hwl_wolf_zombie",
			type_items = "masks"
		}
	}
	self.console_help_5 = {}
	self.console_help_5.content_on_consoles = true
	self.console_help_5.free = false
	self.console_help_5.achievement_id = "orange_5"
	self.console_help_5.content = {}
	self.console_help_5.content.loot_global_value = "halloween"
	self.console_help_5.content.loot_drops = {
		{
			amount = 1,
			item_entry = "howl_chains_zombie",
			type_items = "masks"
		}
	}
	self.console_help_6 = {}
	self.console_help_6.content_on_consoles = true
	self.console_help_6.free = false
	self.console_help_6.content = {}
	self.console_help_6.content.loot_global_value = "halloween"
	self.console_help_6.content.loot_drops = {
		{
			amount = 1,
			item_entry = "hwl_hoxton_zombie",
			type_items = "masks"
		}
	}
	self.console_moon = {}
	self.console_moon.content_on_consoles = true
	self.console_moon.free = true
	self.console_moon.content = {}
	self.console_moon.content.loot_global_value = "normal"
	self.console_moon.content.loot_drops = {
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
	self.console_win_bundle = {}
	self.console_win_bundle.content_on_consoles = true
	self.console_win_bundle.free = false
	self.console_win_bundle.content = {}
	self.console_win_bundle.content.loot_global_value = "normal"
	self.console_win_bundle.content.loot_drops = {
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
	self.console_yor_bundle = {}
	self.console_yor_bundle.content_on_consoles = true
	self.console_yor_bundle.free = false
	self.console_yor_bundle.content = {}
	self.console_yor_bundle.content.loot_global_value = "normal"
	self.console_yor_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "yor",
			type_items = "masks"
		}
	}
	self.console_yor_bundle.content.upgrades = {
		"chinchilla"
	}
	self.console_bny_bundle = {}
	self.console_bny_bundle.content_on_consoles = true
	self.console_bny_bundle.free = false
	self.console_bny_bundle.content = {}
	self.console_bny_bundle.content.loot_global_value = "normal"
	self.console_bny_bundle.content.loot_drops = {
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
	self.console_amp_bundle = {}
	self.console_amp_bundle.content_on_consoles = true
	self.console_amp_bundle.free = true
	self.console_amp_bundle.content = {}
	self.console_amp_bundle.content.loot_global_value = "normal"
	self.console_amp_bundle.content.loot_drops = {
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
	self.console_mdm_bundle = {}
	self.console_mdm_bundle.content_on_consoles = true
	self.console_mdm_bundle.free = false
	self.console_mdm_bundle.content = {}
	self.console_mdm_bundle.content.loot_global_value = "infamous"
	self.console_mdm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mdm",
			type_items = "masks"
		}
	}
	self.console_pim = {}
	self.console_pim.content_on_consoles = true
	self.console_pim.dlc = "has_parent_dlc"
	self.console_pim.parent_dlc = "pim"
	self.console_pim.content = {}
	self.console_pim.content.loot_global_value = "pim"
	self.console_pim.content.loot_drops = {
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
		},
		{
			amount = 1,
			item_entry = "pim_mustang",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "pim_hotelier",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "pim_russian_ballistic",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "pim_dog",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "wheel",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "club",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "mist",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "dog",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "oneshot",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "piety",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "warface",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "daisy",
			type_items = "textures"
		}
	}
	self.console_tango = {}
	self.console_tango.content_on_consoles = true
	self.console_tango.dlc = "has_parent_dlc"
	self.console_tango.parent_dlc = "tango"
	self.console_tango.content = {}
	self.console_tango.content.loot_global_value = "tango"
	self.console_tango.content.loot_drops = {
		{
			amount = 1,
			item_entry = "tng_bandana",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tng_cloaker",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tng_zeal_swat_mask",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tng_cap",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "army_deep_green",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "ranger_black",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "digital_camo",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "midnight_camo",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "facepaint",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "sight",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "bullets",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "stripes",
			type_items = "textures"
		},
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
	self.console_chico_bundle = {}
	self.console_chico_bundle.content_on_consoles = true
	self.console_chico_bundle.dlc = "has_parent_dlc"
	self.console_chico_bundle.parent_dlc = "chico"
	self.console_chico_bundle.content = {}
	self.console_chico_bundle.content.loot_global_value = "chico"
	self.console_chico_bundle.content.loot_drops = {
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
	self.console_friend_bundle = {}
	self.console_friend_bundle.content_on_consoles = true
	self.console_friend_bundle.dlc = "has_parent_dlc"
	self.console_friend_bundle.parent_dlc = "friend"
	self.console_friend_bundle.content = {}
	self.console_friend_bundle.content.loot_global_value = "friend"
	self.console_friend_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "sfm_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sfm_04",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sfm_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "sfm_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "golden_hour",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "black_marble",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "oxidized_copper",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "red_velvet",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "scar_mask",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "diablada",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "liberty_flame",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "my_little",
			type_items = "textures"
		}
	}
	self.console_spa_bundle = {}
	self.console_spa_bundle.content_on_consoles = true
	self.console_spa_bundle.dlc = "has_parent_dlc"
	self.console_spa_bundle.parent_dlc = "spa"
	self.console_spa_bundle.content = {}
	self.console_spa_bundle.content.loot_global_value = "spa"
	self.console_spa_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "spa_04",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "spa_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "spa_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "spa_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "underground_neon",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "carbon_fiber_weave",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "neon_blue",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "black_suede",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "baba_yaga",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "hood_stripes",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "hotel_pattern",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "continental",
			type_items = "textures"
		}
	}
	self.console_grv_bundle = {}
	self.console_grv_bundle.content_on_consoles = true
	self.console_grv_bundle.dlc = "has_parent_dlc"
	self.console_grv_bundle.parent_dlc = "grv"
	self.console_grv_bundle.content = {}
	self.console_grv_bundle.content.loot_global_value = "grv"
	self.console_grv_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "grv_04",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "grv_01",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "grv_03",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "grv_02",
			type_items = "masks"
		},
		{
			amount = 1,
			item_entry = "tricolor",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "russian_camouflage",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "propaganda_palette",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "ceramics_gzhel",
			type_items = "materials"
		},
		{
			amount = 1,
			item_entry = "russian_gamble",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "red_star",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "bear_fight",
			type_items = "textures"
		},
		{
			amount = 1,
			item_entry = "prison_statement",
			type_items = "textures"
		}
	}
	self.console_flip_bundle = {}
	self.console_flip_bundle.content_on_consoles = true
	self.console_flip_bundle.free = true
	self.console_flip_bundle.content = {}
	self.console_flip_bundle.content.loot_global_value = "normal"
	self.console_flip_bundle.content.loot_drops = {
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
	self.console_kwm_bundle = {}
	self.console_kwm_bundle.content_on_consoles = true
	self.console_kwm_bundle.free = true
	self.console_kwm_bundle.content = {}
	self.console_kwm_bundle.content.loot_global_value = "normal"
	self.console_kwm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "kwm",
			type_items = "masks"
		}
	}
	self.console_mmj_bundle = {}
	self.console_mmj_bundle.content_on_consoles = true
	self.console_mmj_bundle.free = true
	self.console_mmj_bundle.content = {}
	self.console_mmj_bundle.content.loot_global_value = "normal"
	self.console_mmj_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mmj",
			type_items = "masks"
		}
	}
	self.ant_free = {}
	self.ant_free.dlc = "has_ant_free"
	self.ant_free.content_on_consoles = true
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
	self.ant.content_on_consoles = true
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
	self.ach_eng_1 = {}
	self.ach_eng_1.content_on_consoles = true
	self.ach_eng_1.content = {}
	self.ach_eng_1.dlc = true
	self.ach_eng_1.free = true
	self.ach_eng_1.content.loot_global_value = "eng"
	self.ach_eng_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "eng_01",
			type_items = "masks"
		}
	}
	self.ach_eng_2 = {}
	self.ach_eng_2.content_on_consoles = true
	self.ach_eng_2.content = {}
	self.ach_eng_2.dlc = true
	self.ach_eng_2.free = true
	self.ach_eng_2.content.loot_global_value = "eng"
	self.ach_eng_2.content.loot_drops = {
		{
			amount = 1,
			item_entry = "eng_02",
			type_items = "masks"
		}
	}
	self.ach_eng_3 = {}
	self.ach_eng_3.content_on_consoles = true
	self.ach_eng_3.content = {}
	self.ach_eng_3.dlc = true
	self.ach_eng_3.free = true
	self.ach_eng_3.content.loot_global_value = "eng"
	self.ach_eng_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "eng_03",
			type_items = "masks"
		}
	}
	self.ach_eng_4 = {}
	self.ach_eng_4.content_on_consoles = true
	self.ach_eng_4.content = {}
	self.ach_eng_4.dlc = true
	self.ach_eng_4.free = true
	self.ach_eng_4.content.loot_global_value = "eng"
	self.ach_eng_4.content.loot_drops = {
		{
			amount = 1,
			item_entry = "eng_04",
			type_items = "masks"
		}
	}
	self.sha_bundle = {}
	self.sha_bundle.content = {}
	self.sha_bundle.free = true
	self.sha_bundle.content_on_consoles = true
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
	self.kouti_bundle = {}
	self.kouti_bundle.content_on_consoles = true
	self.kouti_bundle.content = {}
	self.kouti_bundle.content.loot_global_value = "infamous"
	self.kouti_bundle.dlc = "has_parent_dlc"
	self.kouti_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "unforsaken_mega",
			type_items = "masks"
		},
		{
			item_entry = "ast_armor1",
			type_items = "armor_skins"
		},
		{
			item_entry = "ast_armor2",
			type_items = "armor_skins"
		},
		{
			item_entry = "ast_armor3",
			type_items = "armor_skins"
		},
		{
			item_entry = "ast_armor4",
			type_items = "armor_skins"
		},
		{
			item_entry = "ast_armor5",
			type_items = "armor_skins"
		},
		{
			item_entry = "ast_armor6",
			type_items = "armor_skins"
		}
	}
	self.dbd_clan_award = {}
	self.dbd_clan_award.dlc = true
	self.dbd_clan_award.free = true
	self.dbd_clan_award.content_on_consoles = true
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
	self.dbd_deluxe.content_on_consoles = true
	self.dbd_deluxe.dlc = true
	self.dbd_deluxe.content = {}
	self.dbd_deluxe.content.loot_global_value = "dbd_clan"
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
	self.dbd_boo_0_award = {}
	self.dbd_boo_0_award.content_on_consoles = true
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
	self.dbd_boo_1_award.content_on_consoles = true
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
	self.dbd_boo_4_award.content_on_consoles = true
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
	self.solus_clan_award = {}
	self.solus_clan_award.free = true
	self.solus_clan_award.dlc = true
	self.solus_clan_award.content_on_consoles = true
	self.solus_clan_award.content = {}
	self.solus_clan_award.content.loot_global_value = "solus_clan"
	self.solus_clan_award.content.loot_drops = {
		{
			amount = 1,
			item_entry = "solus",
			type_items = "masks"
		}
	}
	self.console_wmp_bundle = {}
	self.console_wmp_bundle.free = true
	self.console_wmp_bundle.content_on_consoles = true
	self.console_wmp_bundle.content = {}
	self.console_wmp_bundle.content.loot_global_value = "normal"
	self.console_wmp_bundle.content.loot_drops = {
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
	self.console_jfr = {}
	self.console_jfr.content = {}
	self.console_jfr.content_on_consoles = true
	self.console_dgm_bundle = {}
	self.console_dgm_bundle.free = true
	self.console_dgm_bundle.content_on_consoles = true
	self.console_dgm_bundle.content = {}
	self.console_dgm_bundle.content.loot_global_value = "normal"
	self.console_dgm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dgm",
			type_items = "masks"
		}
	}
	self.console_ach_trk_a_0 = {}
	self.console_ach_trk_a_0.content = {}
	self.console_ach_trk_a_0.free = true
	self.console_ach_trk_a_0.content_on_consoles = true
	self.console_ach_trk_a_0.content.loot_global_value = "infamous"
	self.console_ach_trk_a_0.content.loot_drops = {
		{
			amount = 1,
			item_entry = "dnm",
			type_items = "masks"
		}
	}
	self.console_cmo_bundle = {}
	self.console_cmo_bundle.free = true
	self.console_cmo_bundle.content_on_consoles = true
	self.console_cmo_bundle.content = {}
	self.console_cmo_bundle.content.loot_global_value = "normal"
	self.console_cmo_bundle.content.loot_drops = {
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
	self.console_pn2_bundle = {}
	self.console_pn2_bundle.free = true
	self.console_pn2_bundle.content_on_consoles = true
	self.console_pn2_bundle.content = {}
	self.console_pn2_bundle.content.loot_global_value = "normal"
	self.console_pn2_bundle.content.loot_drops = {}
	self.console_pbm_bundle = {}
	self.console_pbm_bundle.free = true
	self.console_pbm_bundle.content_on_consoles = true
	self.console_pbm_bundle.content = {}
	self.console_pbm_bundle.content.loot_global_value = "normal"
	self.console_pbm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "pbm",
			type_items = "masks"
		}
	}
	self.console_ach_cee_3 = {}
	self.console_ach_cee_3.free = false
	self.console_ach_cee_3.content_on_consoles = true
	self.console_ach_cee_3.content = {}
	self.console_ach_cee_3.content.loot_global_value = "infamous"
	self.console_ach_cee_3.content.loot_drops = {
		{
			amount = 1,
			item_entry = "mrm",
			type_items = "masks"
		}
	}
	self.console_rvd_bundle = {}
	self.console_rvd_bundle.content = {}
	self.console_rvd_bundle.free = true
	self.console_rvd_bundle.content_on_consoles = true
	self.console_rvd_bundle.content.loot_global_value = "rvd"
	self.console_rvd_bundle.content.loot_drops = {
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
	self.console_gcm_bundle = {}
	self.console_gcm_bundle.free = true
	self.console_gcm_bundle.content = {}
	self.console_gcm_bundle.content_on_consoles = true
	self.console_gcm_bundle.content.loot_global_value = "normal"
	self.console_gcm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "gcm",
			type_items = "masks"
		}
	}
	self.console_ach_ggez_1 = {}
	self.console_ach_ggez_1.free = false
	self.console_ach_ggez_1.content_on_consoles = true
	self.console_ach_ggez_1.content = {}
	self.console_ach_ggez_1.content.loot_global_value = "infamous"
	self.console_ach_ggez_1.content.loot_drops = {
		{
			amount = 1,
			item_entry = "ggac_od_t2",
			type_items = "masks"
		}
	}
	self.console_ghx_bundle = {}
	self.console_ghx_bundle.free = true
	self.console_ghx_bundle.content_on_consoles = true
	self.console_ghx_bundle.content = {}
	self.console_ghx_bundle.content.loot_global_value = "normal"
	self.console_ghx_bundle.content.loot_drops = {}
	self.console_maw_bundle = {}
	self.console_maw_bundle.free = true
	self.console_maw_bundle.content_on_consoles = true
	self.console_maw_bundle.content = {}
	self.console_maw_bundle.content.loot_global_value = "infamous"
	self.console_maw_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "maw_01",
			type_items = "masks"
		}
	}
	self.console_mwm_bundle = {}
	self.console_mwm_bundle.dlc = "has_parent_dlc"
	self.console_mwm_bundle.parent_dlc = "mwm"
	self.console_mwm_bundle.content_on_consoles = true
	self.console_mwm_bundle.content = {}
	self.console_mwm_bundle.content.loot_global_value = "mwm"
	self.console_mwm_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_ass_smg_v6",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_g_m4_surgeon",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_sig",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_bmg",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_rms",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_rikt",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_uh",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_fc1",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_o_45steel",
			type_items = "weapon_mods"
		},
		{
			amount = 1,
			item_entry = "wpn_fps_upg_ns_pis_typhoon",
			type_items = "weapon_mods"
		}
	}
	self.console_mex_bundle = {}
	self.console_mex_bundle.dlc = "has_parent_dlc"
	self.console_mex_bundle.parent_dlc = "mex"
	self.console_mex_bundle.content_on_consoles = true
	self.console_mex_bundle.content = {}
	self.console_mex_bundle.content.loot_global_value = "mex"
	self.console_mex_bundle.content.loot_drops = {}
	self.console_trd_bundle = {}
	self.console_trd_bundle.dlc = "has_parent_dlc"
	self.console_trd_bundle.parent_dlc = "trd"
	self.console_trd_bundle.content_on_consoles = true
	self.console_trd_bundle.content = {}
	self.console_trd_bundle.content.loot_global_value = "trd"
	self.console_trd_bundle.content.loot_drops = {
		{
			amount = 1,
			item_entry = "jumpsuit",
			type_items = "player_styles"
		},
		{
			amount = 1,
			item_entry = "clown",
			type_items = "player_styles"
		},
		{
			amount = 1,
			item_entry = "miami",
			type_items = "player_styles"
		},
		{
			amount = 1,
			item_entry = "peacoat",
			type_items = "player_styles"
		}
	}
end
