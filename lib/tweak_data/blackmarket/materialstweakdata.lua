function BlackMarketTweakData:_init_materials(tweak_data)
	local C_HI = 0.8
	local C_MD = 0.4
	local C_LO = 0.2
	local C_NO = 0.05
	local color_generic_white = Color(C_HI, C_HI, C_HI)
	local color_generic_light = Color(C_MD, C_MD, C_MD)
	local color_generic_dark = Color(C_LO, C_LO, C_LO)
	local color_generic_black = Color(C_NO, C_NO, C_NO)
	local color_generic_red = Color(C_HI, C_NO, C_NO)
	local color_generic_red_white = Color(C_HI, C_MD, C_MD)
	local color_generic_red_light = Color(C_HI, C_LO, C_LO)
	local color_generic_red_dark = Color(C_MD, C_NO, C_NO)
	local color_generic_red_black = Color(C_LO, C_NO, C_NO)
	local color_generic_green = Color(C_NO, C_HI, C_NO)
	local color_generic_green_white = Color(C_MD, C_HI, C_MD)
	local color_generic_green_light = Color(C_LO, C_HI, C_LO)
	local color_generic_green_dark = Color(C_NO, C_MD, C_NO)
	local color_generic_green_black = Color(C_NO, C_LO, C_NO)
	local color_generic_blue = Color(C_NO, C_NO, C_HI)
	local color_generic_blue_white = Color(C_MD, C_MD, C_HI)
	local color_generic_blue_light = Color(C_LO, C_LO, C_HI)
	local color_generic_blue_dark = Color(C_NO, C_NO, C_MD)
	local color_generic_blue_black = Color(C_NO, C_NO, C_LO)
	self.materials = {
		strip_paint = {}
	}
	self.materials.strip_paint.name_id = "bm_mtl_strip_paint"
	self.materials.strip_paint.texture = "units/payday2/matcaps/matcap_plastic_df"
	self.materials.strip_paint.material_amount = 2
	self.materials.strip_paint.value = 0
	self.materials.strip_paint.color = color_generic_white
	self.materials.strip_paint.texture_bundle_folder = "lic"
	self.materials.strip_paint.does_not_apply_color = true
	self.materials.strip_paint.unlimited = true
	self.materials.nothing = {
		name_id = "bm_mtl_nothing",
		texture = "units/payday2/matcaps/matcap_plastic_df",
		tintable_gui = "guis/dlcs/lic/textures/pd2/blackmarket/icons/materials/nothing",
		material_amount = 2,
		value = 0,
		color = Color(0.25, 0.25, 0.25),
		texture_bundle_folder = "lic",
		unlimited = true
	}
	self.materials.plastic = {
		name_id = "bm_mtl_plastic",
		texture = "units/payday2/matcaps/matcap_plastic_df",
		value = 0,
		color = color_generic_white,
		unlimited = true
	}
	self.materials.titanium = {
		name_id = "bm_mtl_titanium",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_titanium_df",
		infamous = true,
		value = 5,
		color = color_generic_light
	}
	self.materials.mercury = {
		name_id = "bm_mtl_mercury",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_mercury_df",
		value = 3,
		color = color_generic_light
	}
	self.materials.oxide_bronze = {
		name_id = "bm_mtl_oxide_bronze",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_oxide_bronze_df",
		value = 4,
		color = Color("615b4c")
	}
	self.materials.deep_bronze = {
		name_id = "bm_mtl_deep_bronze",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_deep_bronze_df",
		infamous = true,
		value = 5,
		color = Color("896138")
	}
	self.materials.slime = {
		name_id = "bm_mtl_slime",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_slime_df",
		infamous = true,
		value = 2,
		color = Color("5b9370")
	}
	self.materials.gold_clean = {
		name_id = "bm_mtl_gold_clean",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_gold_clean_df",
		infamous = true,
		value = 10,
		color = Color("ad8931")
	}
	self.materials.concrete1 = {
		name_id = "bm_mtl_concrete1",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_concrete1_df",
		material_amount = 0,
		value = 2,
		color = Color("a6a3a0")
	}
	self.materials.rock1 = {
		name_id = "bm_mtl_rock1",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_rock1_df",
		material_amount = 0,
		value = 3,
		color = Color("80715c")
	}
	self.materials.rock2 = {
		name_id = "bm_mtl_rock2",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_rock2_df",
		material_amount = 0,
		value = 2,
		color = Color("8a8a8e")
	}
	self.materials.rock3 = {
		name_id = "bm_mtl_rock3",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_rock3_df",
		material_amount = 0,
		value = 2,
		color = Color("8e8b8b")
	}
	self.materials.whiterock = {
		name_id = "bm_mtl_whiterock",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_whiterock_df",
		material_amount = 0,
		value = 3,
		color = Color("9ca4bf")
	}
	self.materials.metal1 = {
		name_id = "bm_mtl_metal1",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_metal1_df",
		material_amount = 0,
		value = 6,
		color = Color("757a78")
	}
	self.materials.cracks1 = {
		name_id = "bm_mtl_cracks1",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_cracks1_df",
		material_amount = 0,
		value = 2,
		color = Color("82898b")
	}
	self.materials.wicker1 = {
		name_id = "bm_mtl_wicker1",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_wicker1_df",
		material_amount = 0,
		value = 3,
		color = Color("c7a785")
	}
	self.materials.scales = {
		name_id = "bm_mtl_scales",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_scales_df",
		infamous = true,
		material_amount = 0,
		value = 7,
		color = Color("d7e069")
	}
	self.materials.oldbronze = {
		name_id = "bm_mtl_oldbronze",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_oldbronze_df",
		material_amount = 0,
		infamous = true,
		value = 8,
		color = Color("7eb49b")
	}
	self.materials.bark1 = {
		name_id = "bm_mtl_bark1",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_bark1_df",
		material_amount = 0,
		value = 4,
		color = Color("726c52")
	}
	self.materials.bark2 = {
		name_id = "bm_mtl_bark2",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_bark2_df",
		material_amount = 0,
		value = 3,
		color = Color("a18042")
	}
	self.materials.bark3 = {
		name_id = "bm_mtl_bark3",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_bark3_df",
		material_amount = 0,
		value = 2,
		color = Color("8d7b64")
	}
	self.materials.carbon = {
		name_id = "bm_mtl_carbon",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_carbon_df",
		material_amount = 0,
		value = 6,
		color = Color("595959")
	}
	self.materials.leather = {
		name_id = "bm_mtl_leather1",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_leather1_df",
		material_amount = 0,
		value = 6,
		color = Color("973b08")
	}
	self.materials.bloodred = {
		name_id = "bm_mtl_bloodred",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_bloodred_df",
		value = 8,
		color = Color("c33d3e")
	}
	self.materials.waterblue = {
		name_id = "bm_mtl_waterblue",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_waterblue_df",
		value = 4,
		color = Color("98c7d4")
	}
	self.materials.matteblack = {
		name_id = "bm_mtl_matteblack",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_matteblack_df",
		value = 9,
		color = Color("404040")
	}
	self.materials.pianoblack = {
		name_id = "bm_mtl_pianoblack",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_pianoblack_df",
		infamous = true,
		value = 10,
		color = Color("3f3f3f")
	}
	self.materials.twoblue = {
		name_id = "bm_mtl_twoblue",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_twoblue_df",
		value = 6,
		color = Color("6772a1")
	}
	self.materials.rainbow = {
		name_id = "bm_mtl_rainbow",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_rainbow_df",
		infamous = true,
		value = 3,
		color = Color("7da683")
	}
	self.materials.magma = {
		name_id = "bm_mtl_magma",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_magma_df",
		value = 6,
		color = Color("bd6407")
	}
	self.materials.radioactive = {
		name_id = "bm_mtl_radioactive",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_radioactive_df",
		infamous = true,
		value = 7,
		color = Color("5b6c22")
	}
	self.materials.bismuth = {
		name_id = "bm_mtl_bismuth",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_bismuth_df",
		value = 3,
		color = Color("5974a6")
	}
	self.materials.greygloss = {
		name_id = "bm_mtl_greygloss",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_greygloss_df",
		value = 5,
		color = Color("5c5b5c")
	}
	self.materials.finewood = {
		name_id = "bm_mtl_finewood",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_finewood_df",
		material_amount = 0,
		value = 8,
		color = Color("79311b")
	}
	self.materials.skin = {
		name_id = "bm_mtl_skin",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_skin_df",
		material_amount = 0,
		value = 6,
		color = Color("d4b3a2")
	}
	self.materials.alligator = {
		name_id = "bm_mtl_alligator",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_alligator_df",
		material_amount = 0,
		value = 6,
		color = Color("545639")
	}
	self.materials.denim = {
		name_id = "bm_mtl_denim",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_denim_df",
		material_amount = 0,
		value = 2,
		color = Color("6f829e")
	}
	self.materials.candy = {
		name_id = "bm_mtl_candy",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_candy_df",
		value = 5,
		color = Color("c59ac2")
	}
	self.materials.chrome_purple = {
		name_id = "bm_mtl_chrome_purple",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_chrome_purple_df",
		value = 5,
		color = Color("6e3f9e")
	}
	self.materials.hot_cold = {
		name_id = "bm_mtl_hot_cold",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_hot_cold_df",
		value = 5,
		color = Color("888d98")
	}
	self.materials.orchish = {
		name_id = "bm_mtl_orchish",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/payday2/matcaps/matcap_orcish_df",
		value = 5,
		color = Color("655b25")
	}
	self.materials.cash = {
		name_id = "bm_mtl_cash",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc1/matcaps/matcap_cash_df",
		material_amount = 0,
		value = 5,
		dlc = "armored_transport",
		color = Color("989a87")
	}
	self.materials.jade = {
		name_id = "bm_mtl_jade",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc1/matcaps/matcap_jade_df",
		value = 5,
		dlc = "armored_transport",
		color = Color("4e8f5f")
	}
	self.materials.redwhiteblue = {
		name_id = "bm_mtl_redwhiteblue",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc1/matcaps/matcap_redwhiteblue_df",
		value = 5,
		dlc = "armored_transport",
		color = Color("b2758d")
	}
	self.materials.marble = {
		name_id = "bm_mtl_marble",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc1/matcaps/matcap_marble_df",
		value = 5,
		dlc = "armored_transport",
		color = Color("bcada6")
	}
	self.materials.fur = {
		name_id = "bm_mtl_fur",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_dec5/matcaps/matcap_fur_df",
		material_amount = 0,
		value = 5,
		dlc = "gage_pack",
		color = Color("c39870")
	}
	self.materials.galvanized = {
		name_id = "bm_mtl_galvanized",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_dec5/matcaps/matcap_galvanized_df",
		material_amount = 0,
		value = 5,
		dlc = "gage_pack",
		color = Color("959b8f")
	}
	self.materials.heavymetal = {
		name_id = "bm_mtl_heavymetal",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_dec5/matcaps/matcap_heavymetal_df",
		material_amount = 0,
		value = 5,
		dlc = "gage_pack",
		color = Color("343537")
	}
	self.materials.oilmetal = {
		name_id = "bm_mtl_oilmetal",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_dec5/matcaps/matcap_oilmetal_df",
		value = 5,
		dlc = "gage_pack",
		color = Color("7a7b85")
	}
	self.materials.gunmetal = {
		name_id = "bm_mtl_gunmetal",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_gunmetal_df",
		value = 5,
		dlc = "gage_pack_lmg",
		color = Color("80807e")
	}
	self.materials.mud = {
		name_id = "bm_mtl_mud",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_mud_df",
		material_amount = 0,
		value = 5,
		dlc = "gage_pack_lmg",
		color = Color("766345")
	}
	self.materials.splinter = {
		name_id = "bm_mtl_splinter",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_splinter_df",
		material_amount = 0,
		value = 5,
		dlc = "gage_pack_lmg",
		color = Color("777978")
	}
	self.materials.erdl = {
		name_id = "bm_mtl_erdl",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_erdl_df",
		material_amount = 0,
		value = 5,
		dlc = "gage_pack_lmg",
		color = Color("5e5b48")
	}
	self.materials.arizona = {
		name_id = "bm_mtl_arizona",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_arizona_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_maskpack_destroyer",
		color = Color("927765")
	}
	self.materials.baby = {
		name_id = "bm_mtl_baby",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_baby_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_maskpack_lurker",
		color = Color("5f68a7")
	}
	self.materials.alien_slime = {
		name_id = "bm_mtl_alien_slime",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_alien_slime_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_maskpack_ranger",
		color = Color("4f6a81")
	}
	self.materials.eye = {
		name_id = "bm_mtl_eye",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_eye_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_maskpack_balaclava",
		color = Color("85958c")
	}
	self.materials.hades = {
		name_id = "bm_mtl_hades",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_hades_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_maskpack_pain",
		color = Color("c45a4c")
	}
	self.materials.punk = {
		name_id = "bm_mtl_punk",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_punk_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_maskpack_punk",
		color = Color("5a76b0")
	}
	self.materials.haze = {
		name_id = "bm_mtl_haze",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_haze_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_maskpack_daft",
		color = Color("446770")
	}
	self.materials.plastic_hood = {
		name_id = "bm_mtl_plastic_hood",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_plastic_hood_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_maskpack_hood",
		color = Color("343434")
	}
	self.materials.copper = {
		name_id = "bm_mtl_copper",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_copper_df",
		material_amount = 0,
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_enforcer",
		color = Color("b77646")
	}
	self.materials.dark_leather = {
		name_id = "bm_mtl_dark_leather",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_dark_leather_df",
		material_amount = 0,
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_mastermind",
		color = Color("1d1d1d")
	}
	self.materials.sinister = {
		name_id = "bm_mtl_sinister",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_sinister_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_ghost",
		color = Color("966768")
	}
	self.materials.electric = {
		name_id = "bm_mtl_electric",
		pcs = {},
		texture = "units/pd2_dlc_infamy/matcaps/matcap_electric_df",
		value = 0,
		global_value = "infamy",
		infamy_lock = "infamy_technician",
		color = Color("506e9b")
	}
	self.materials.bugshell = {
		name_id = "bm_mtl_bugshell",
		pcs = {},
		texture = "units/pd2_dlc_gage_snp/materials/matcap_bugshell_df",
		material_amount = 0,
		value = 0,
		dlc = "gage_pack_snp",
		color = Color("59b473")
	}
	self.materials.carapace = {
		name_id = "bm_mtl_carapace",
		pcs = {},
		texture = "units/pd2_dlc_gage_snp/materials/matcap_carapace_df",
		value = 0,
		dlc = "gage_pack_snp",
		color = Color("683f39")
	}
	self.materials.hardshell = {
		name_id = "bm_mtl_hardshell",
		pcs = {},
		texture = "units/pd2_dlc_gage_snp/materials/matcap_hardshell_df",
		material_amount = 0,
		value = 0,
		dlc = "gage_pack_snp",
		color = Color("967f82")
	}
	self.materials.insectoid = {
		name_id = "bm_mtl_insectoid",
		pcs = {},
		texture = "units/pd2_dlc_gage_snp/materials/matcap_insectoid_df",
		value = 0,
		dlc = "gage_pack_snp",
		color = Color("817360")
	}
	self.materials.blackmetal = {
		name_id = "bm_mtl_blackmetal",
		pcs = {},
		texture = "units/pd2_poetry_winners/materials/matcap_blackmetal_df",
		material_amount = 0,
		value = 0,
		dlc = "poetry_soundtrack",
		global_value = "poetry_soundtrack",
		color = Color("535c5f")
	}
	self.materials.carbongrid = {
		name_id = "bm_mtl_carbongrid",
		pcs = {},
		texture = "units/pd2_poetry_winners/materials/matcap_carbongrid_df",
		material_amount = 0,
		value = 0,
		dlc = "poetry_soundtrack",
		global_value = "poetry_soundtrack",
		color = Color("929292")
	}
	self.materials.cosmoline = {
		name_id = "bm_mtl_cosmoline",
		pcs = {},
		texture = "units/pd2_poetry_winners/materials/matcap_cosmoline_df",
		value = 0,
		dlc = "poetry_soundtrack",
		global_value = "poetry_soundtrack",
		color = Color("55482c")
	}
	self.materials.electronic = {
		name_id = "bm_mtl_electronic",
		pcs = {},
		texture = "units/pd2_poetry_winners/materials/matcap_electronic_df",
		material_amount = 0,
		value = 0,
		dlc = "poetry_soundtrack",
		global_value = "poetry_soundtrack",
		color = Color("749280")
	}
	self.materials.gemstone = {
		name_id = "bm_mtl_gemstone",
		pcs = {},
		texture = "units/pd2_dlc_big/matcaps/matcap_gemstone_df",
		value = 0,
		dlc = "big_bank",
		color = Color("a7474b")
	}
	self.materials.old = {
		name_id = "bm_mtl_old",
		pcs = {},
		texture = "units/pd2_dlc_big/matcaps/matcap_old_df",
		value = 0,
		dlc = "big_bank",
		color = Color("615855")
	}
	self.materials.clay = {
		name_id = "bm_mtl_clay",
		pcs = {},
		texture = "units/pd2_dlc_big/matcaps/matcap_clay_df",
		material_amount = 0,
		value = 0,
		dlc = "big_bank",
		color = Color("bb6c45")
	}
	self.materials.parchment = {
		name_id = "bm_mtl_parchment",
		pcs = {},
		texture = "units/pd2_dlc_big/matcaps/matcap_parchment_df",
		material_amount = 0,
		value = 0,
		dlc = "big_bank",
		color = Color("b5a897")
	}
	self.materials.sparks = {
		name_id = "bm_mtl_sparks",
		pcs = {},
		texture = "units/pd2_dlc_gage_shot/matcaps/matcap_sparks_df",
		value = 0,
		dlc = "gage_pack_shotgun",
		color = Color("8a7265")
	}
	self.materials.explosive = {
		name_id = "bm_mtl_explosive",
		pcs = {},
		texture = "units/pd2_dlc_gage_shot/matcaps/matcap_explosive_df",
		value = 0,
		dlc = "gage_pack_shotgun",
		color = Color("ba4528")
	}
	self.materials.bananapeel = {
		name_id = "bm_mtl_bananapeel",
		pcs = {},
		texture = "units/pd2_dlc_gage_shot/matcaps/matcap_bananapeel_df",
		material_amount = 0,
		value = 0,
		dlc = "gage_pack_shotgun",
		color = Color("bd9128")
	}
	self.materials.leaf = {
		name_id = "bm_mtl_leaf",
		pcs = {},
		texture = "units/pd2_dlc_gage_shot/matcaps/matcap_leaf_df",
		material_amount = 0,
		value = 0,
		dlc = "gage_pack_shotgun",
		color = Color("4d7a01")
	}
	self.materials.bone = {
		name_id = "bm_mtl_bone",
		pcs = {},
		texture = "units/pd2_dlc_gage_assault/materials/matcap_bone_df",
		material_amount = 0,
		value = 0,
		dlc = "gage_pack_assault",
		color = Color("d9caad")
	}
	self.materials.frost = {
		name_id = "bm_mtl_frost",
		pcs = {},
		texture = "units/pd2_dlc_gage_assault/materials/matcap_frost_df",
		material_amount = 0,
		value = 0,
		dlc = "gage_pack_assault",
		color = Color("81a4b8")
	}
	self.materials.evil = {
		name_id = "bm_mtl_evil",
		pcs = {},
		texture = "units/pd2_dlc_gage_assault/materials/matcap_evil_df",
		value = 0,
		dlc = "gage_pack_assault",
		color = Color("995c53")
	}
	self.materials.void = {
		name_id = "bm_mtl_void",
		pcs = {},
		texture = "units/pd2_dlc_gage_assault/materials/matcap_void_df",
		value = 0,
		dlc = "gage_pack_assault",
		color = Color("4f60b2")
	}
	self.materials.sunset = {
		name_id = "bm_mtl_sunset",
		pcs = {},
		texture = "units/pd2_dlc_miami/matcaps/matcap_sunset_df",
		value = 0,
		dlc = "hl_miami",
		color = Color("d1909c")
	}
	self.materials.chromescape = {
		name_id = "bm_mtl_chromescape",
		pcs = {},
		texture = "units/pd2_dlc_miami/matcaps/matcap_chromescape_df",
		value = 0,
		dlc = "hl_miami",
		color = Color("858a92")
	}
	self.materials.rubber = {
		name_id = "bm_mtl_rubber",
		pcs = {},
		texture = "units/pd2_dlc_miami/matcaps/matcap_rubber_df",
		value = 0,
		dlc = "hl_miami",
		color = Color("7f7c76")
	}
	self.materials.error = {
		name_id = "bm_mtl_error",
		pcs = {},
		texture = "units/pd2_dlc_miami/matcaps/matcap_error_df",
		material_amount = 0,
		value = 0,
		dlc = "hl_miami",
		color = Color("8984a0")
	}
	self.materials.rug = {
		name_id = "bm_mtl_rug",
		pcs = {},
		texture = "units/pd2_dlc_miami/matcaps/matcap_rug_df",
		material_amount = 0,
		value = 0,
		dlc = "hlm_game",
		color = Color("babbb6")
	}
	self.materials.cushion = {
		name_id = "bm_mtl_cushion",
		pcs = {},
		texture = "units/pd2_dlc_miami/matcaps/matcap_cushion_df",
		material_amount = 0,
		value = 0,
		dlc = "hlm_game",
		color = Color("ba7f76")
	}
	self.materials.hatred = {
		name_id = "bm_mtl_hatred",
		pcs = {},
		texture = "units/pd2_dlc_miami/matcaps/matcap_hatred_df",
		value = 0,
		dlc = "hlm_game",
		color = Color("b15d47")
	}
	self.materials.neon = {
		name_id = "bm_mtl_neon",
		pcs = {},
		texture = "units/pd2_dlc_miami/matcaps/matcap_neon_df",
		value = 0,
		dlc = "hlm_game",
		color = Color("b7a4d5")
	}
	self.materials.armygreen = {
		name_id = "bm_mtl_armygreen",
		pcs = {},
		texture = "units/pd2_dlc_gage_historical/materials/matcap_armygreen_df",
		material_amount = 0,
		value = 0,
		dlc = "gage_pack_historical",
		color = Color("6e693c")
	}
	self.materials.gunsmoke = {
		name_id = "bm_mtl_gunsmoke",
		pcs = {},
		texture = "units/pd2_dlc_gage_historical/materials/matcap_gunsmoke_df",
		value = 0,
		dlc = "gage_pack_historical",
		color = Color("505c5c")
	}
	self.materials.patriot = {
		name_id = "bm_mtl_patriot",
		pcs = {},
		texture = "units/pd2_dlc_gage_historical/materials/matcap_patriot_df",
		material_amount = 0,
		value = 0,
		dlc = "gage_pack_historical",
		color = Color("bb6666")
	}
	self.materials.redsun = {
		name_id = "bm_mtl_redsun",
		pcs = {},
		texture = "units/pd2_dlc_gage_historical/materials/matcap_redsun_df",
		value = 0,
		dlc = "gage_pack_historical",
		color = Color("7f7c76")
	}
	self.materials.diamond = {
		name_id = "bm_mtl_diamond",
		pcs = {},
		texture = "units/pd2_indiana/materials/matcap_diamond_df",
		value = 0,
		dlc = "hope_diamond",
		color = Color("7d8cac")
	}
	self.materials.bandages = {
		name_id = "bm_mtl_bandages",
		pcs = {},
		texture = "units/pd2_indiana/materials/matcap_bandages_df",
		material_amount = 0,
		value = 0,
		dlc = "hope_diamond",
		color = Color("c5b48a")
	}
	self.materials.rust = {
		name_id = "bm_mtl_dark_rust",
		pcs = {},
		texture = "units/pd2_indiana/materials/matcap_rust_df",
		material_amount = 0,
		value = 0,
		dlc = "hope_diamond",
		color = Color("ae654e")
	}
	self.materials.sand = {
		name_id = "bm_mtl_dark_sand",
		pcs = {},
		texture = "units/pd2_indiana/materials/matcap_sand_df",
		material_amount = 0,
		value = 0,
		dlc = "hope_diamond",
		color = Color("bfa067")
	}
	self.materials.meat = {
		name_id = "bm_mtl_meat",
		pcs = {},
		texture = "units/pd2_dlc_cro/matcaps/matcaps_meat_df",
		material_amount = 0,
		value = 0,
		dlc = "the_bomb",
		texture_bundle_folder = "the_bomb",
		color = Color("cf564c")
	}
	self.materials.plywood = {
		name_id = "bm_mtl_plywood",
		pcs = {},
		texture = "units/pd2_dlc_cro/matcaps/matcaps_plywood_df",
		material_amount = 0,
		value = 0,
		dlc = "the_bomb",
		texture_bundle_folder = "the_bomb",
		color = Color("987554")
	}
	self.materials.rhino_skin = {
		name_id = "bm_mtl_rhino",
		pcs = {},
		texture = "units/pd2_dlc_cro/matcaps/matcaps_rhino_df",
		material_amount = 0,
		value = 0,
		dlc = "the_bomb",
		texture_bundle_folder = "the_bomb",
		color = Color("8c7962")
	}
	self.materials.rock_marble = {
		name_id = "bm_mtl_rock_marble",
		pcs = {},
		texture = "units/pd2_dlc_cro/matcaps/matcaps_rock_marble_df",
		material_amount = 0,
		value = 0,
		dlc = "the_bomb",
		texture_bundle_folder = "the_bomb",
		color = Color("626c60")
	}
	self.materials.dawn = {
		name_id = "bm_mtl_dawn",
		pcs = {},
		texture = "units/pd2_dlc_akm4_modpack/materials/matcap_dawn_df",
		value = 0,
		dlc = "akm4_pack",
		texture_bundle_folder = "dlc_akm4",
		color = Color("908283")
	}
	self.materials.prehistoric = {
		name_id = "bm_mtl_prehistoric",
		pcs = {},
		texture = "units/pd2_dlc_akm4_modpack/materials/matcap_prehistoric_df",
		value = 0,
		dlc = "akm4_pack",
		texture_bundle_folder = "dlc_akm4",
		color = Color("6b5635")
	}
	self.materials.fossil = {
		name_id = "bm_mtl_fossil",
		pcs = {},
		texture = "units/pd2_dlc_akm4_modpack/materials/matcap_fossil_df",
		material_amount = 0,
		value = 0,
		dlc = "akm4_pack",
		texture_bundle_folder = "dlc_akm4",
		color = Color("b2a48a")
	}
	self.materials.feathers = {
		name_id = "bm_mtl_feathers",
		pcs = {},
		texture = "units/pd2_dlc_akm4_modpack/materials/matcap_feathers_df",
		material_amount = 0,
		value = 0,
		dlc = "akm4_pack",
		texture_bundle_folder = "dlc_akm4",
		color = Color("817a6f")
	}
	self.materials.candlelight = {
		name_id = "bm_mtl_candlelight",
		pcs = {},
		texture = "units/pd2_dlc_bbq/materials/matcap_candlelight_df",
		value = 0,
		dlc = "bbq",
		texture_bundle_folder = "bbq",
		color = Color("d4b5a6")
	}
	self.materials.burn = {
		name_id = "bm_mtl_burn",
		pcs = {},
		texture = "units/pd2_dlc_bbq/materials/matcap_burn_df",
		value = 0,
		dlc = "bbq",
		texture_bundle_folder = "bbq",
		color = Color("a02e11")
	}
	self.materials.toast = {
		name_id = "bm_mtl_toast",
		pcs = {},
		texture = "units/pd2_dlc_bbq/materials/matcap_toast_df",
		value = 0,
		material_amount = 0,
		dlc = "bbq",
		texture_bundle_folder = "bbq",
		color = Color("6c3310")
	}
	self.materials.coal = {
		name_id = "bm_mtl_coal",
		pcs = {},
		texture = "units/pd2_dlc_bbq/materials/matcap_coal_df",
		value = 0,
		material_amount = 0,
		dlc = "bbq",
		texture_bundle_folder = "bbq",
		color = Color("4f2c20")
	}
	self.materials.goldfever = {
		name_id = "bm_mtl_goldfever",
		pcs = {},
		texture = "units/pd2_dlc_west/masks/materials/matcap_goldfever_df",
		dlc = "west",
		value = 0,
		color = Color("4f4038")
	}
	self.materials.westernsunset = {
		name_id = "bm_mtl_westernsunset",
		pcs = {},
		texture = "units/pd2_dlc_west/masks/materials/matcap_westernsunset_df",
		dlc = "west",
		value = 0,
		color = Color("a77163")
	}
	self.materials.scorpion = {
		name_id = "bm_mtl_scorpion",
		pcs = {},
		texture = "units/pd2_dlc_west/masks/materials/matcap_scorpion_df",
		dlc = "west",
		material_amount = 0,
		value = 0,
		color = Color("77726d")
	}
	self.materials.cactus = {
		name_id = "bm_mtl_cactus",
		pcs = {},
		texture = "units/pd2_dlc_west/masks/materials/matcap_cactus_df",
		dlc = "west",
		material_amount = 0,
		value = 0,
		color = Color("898d61")
	}
	self.materials.stained_glass = {
		name_id = "bm_mtl_stained_glass",
		pcs = {},
		texture = "units/pd2_dlc_arena/masks/materials/matcap_stained_glass_df",
		dlc = "arena",
		material_amount = 0,
		value = 0,
		color = Color("b39d50")
	}
	self.materials.bionic = {
		name_id = "bm_mtl_bionic",
		pcs = {},
		texture = "units/pd2_dlc_arena/masks/materials/matcap_bionic_df",
		dlc = "arena",
		material_amount = 0,
		value = 0,
		color = Color("76beca")
	}
	self.materials.enlightment = {
		name_id = "bm_mtl_enlightment",
		pcs = {},
		texture = "units/pd2_dlc_arena/masks/materials/matcap_enlightment_df",
		dlc = "arena",
		value = 0,
		color = Color("4e4e9f")
	}
	self.materials.dimblue = {
		name_id = "bm_mtl_dimblue",
		pcs = {},
		texture = "units/pd2_dlc_arena/masks/materials/matcap_dimblue_df",
		dlc = "arena",
		value = 0,
		color = Color("3c586a")
	}
	self.materials.carpet = {
		name_id = "bm_mtl_carpet",
		pcs = {},
		texture = "units/pd2_dlc_casino/matcaps/matcap_carpet_df",
		material_amount = 0,
		value = 0,
		dlc = "kenaz",
		texture_bundle_folder = "kenaz",
		color = Color("417242")
	}
	self.materials.casino = {
		name_id = "bm_mtl_casino",
		pcs = {},
		texture = "units/pd2_dlc_casino/matcaps/matcap_casino_df",
		value = 0,
		dlc = "kenaz",
		texture_bundle_folder = "kenaz",
		color = Color("ca7362")
	}
	self.materials.plush = {
		name_id = "bm_mtl_plush",
		pcs = {},
		texture = "units/pd2_dlc_casino/matcaps/matcap_plush_df",
		material_amount = 0,
		value = 0,
		dlc = "kenaz",
		texture_bundle_folder = "kenaz",
		color = Color("df5e5e")
	}
	self.materials.stars = {
		name_id = "bm_mtl_stars",
		pcs = {},
		texture = "units/pd2_dlc_casino/matcaps/matcap_stars_df",
		value = 0,
		dlc = "kenaz",
		texture_bundle_folder = "kenaz",
		color = Color("968b74")
	}
	self.materials.still_waters = {
		name_id = "bm_mtl_still_waters",
		pcs = {},
		texture = "units/pd2_dlc_turtles/masks/materials/matcap_still_waters_df",
		value = 0,
		dlc = "turtles",
		color = Color("7d8890")
	}
	self.materials.sakura = {
		name_id = "bm_mtl_sakura",
		pcs = {},
		texture = "units/pd2_dlc_turtles/masks/materials/matcap_sakura_df",
		value = 0,
		dlc = "turtles",
		color = Color("7d8890")
	}
	self.materials.bamboo = {
		name_id = "bm_mtl_bamboo",
		pcs = {},
		texture = "units/pd2_dlc_turtles/masks/materials/matcap_bamboo_df",
		material_amount = 0,
		value = 0,
		dlc = "turtles",
		color = Color("4c6a2e")
	}
	self.materials.origami = {
		name_id = "bm_mtl_origami",
		pcs = {},
		texture = "units/pd2_dlc_turtles/masks/materials/matcap_origami_df",
		material_amount = 0,
		value = 0,
		dlc = "turtles",
		color = Color("87708f")
	}
	self.materials.forged = {
		name_id = "bm_mtl_forged",
		pcs = {},
		texture = "units/pd2_dlc_steel/masks/materials/matcap_forged_df",
		value = 0,
		dlc = "steel",
		color = Color("8a827b")
	}
	self.materials.blooded = {
		name_id = "bm_mtl_blooded",
		pcs = {},
		texture = "units/pd2_dlc_steel/masks/materials/matcap_blooded_df",
		value = 0,
		dlc = "steel",
		color = Color("89474c")
	}
	self.materials.chain_armor = {
		name_id = "bm_mtl_chain_armor",
		pcs = {},
		texture = "units/pd2_dlc_steel/masks/materials/matcap_chain_armor_df",
		material_amount = 0,
		value = 0,
		dlc = "steel",
		color = Color("909ba6")
	}
	self.materials.scale_armor = {
		name_id = "bm_mtl_scale_armor",
		pcs = {},
		texture = "units/pd2_dlc_steel/masks/materials/matcap_scale_armor_df",
		material_amount = 0,
		value = 0,
		dlc = "steel",
		color = Color("a7aeb3")
	}
	self.materials.flow = {
		name_id = "bm_mtl_flow",
		pcs = {},
		texture = "units/pd2_dlc_jerry/masks/materials/matcap_flow_df",
		dlc = "berry",
		material_amount = 0,
		value = 0,
		color = Color("a89774")
	}
	self.materials.sancti = {
		name_id = "bm_mtl_sancti",
		pcs = {},
		texture = "units/pd2_dlc_jerry/masks/materials/matcap_sancti_df",
		dlc = "berry",
		value = 0,
		color = Color("909292")
	}
	self.materials.glade = {
		name_id = "bm_mtl_glade",
		pcs = {},
		texture = "units/pd2_dlc_jerry/masks/materials/matcap_glade_df",
		dlc = "berry",
		value = 0,
		color = Color("a1814e")
	}
	self.materials.wade = {
		name_id = "bm_mtl_wade",
		pcs = {},
		texture = "units/pd2_dlc_jerry/masks/materials/matcap_wade_df",
		dlc = "berry",
		value = 0,
		color = Color("5eacb5")
	}
	self.materials.goateye = {
		name_id = "bm_mtl_goateye",
		pcs = {},
		texture = "units/pd2_dlc_peta/masks/materials/matcap_goateye_df",
		value = 0,
		dlc = "peta",
		color = Color("bd874c")
	}
	self.materials.flamingoeye = {
		name_id = "bm_mtl_flamingoeye",
		pcs = {},
		texture = "units/pd2_dlc_peta/masks/materials/matcap_flamingoeye_df",
		value = 0,
		dlc = "peta",
		color = Color("aea0c1")
	}
	self.materials.hay = {
		name_id = "bm_mtl_hay",
		pcs = {},
		texture = "units/pd2_dlc_peta/masks/materials/matcap_hay_df",
		material_amount = 0,
		value = 0,
		dlc = "peta",
		color = Color("e8c370")
	}
	self.materials.tongue = {
		name_id = "bm_mtl_tongue",
		pcs = {},
		texture = "units/pd2_dlc_peta/masks/materials/matcap_tongue_df",
		material_amount = 0,
		value = 0,
		dlc = "peta",
		color = Color("b07776")
	}
	self.materials.day = {
		name_id = "bm_mtl_days",
		pcs = {},
		texture = "units/pd2_dlc_lupus/materials/matcap_days_df",
		material_amount = 0,
		value = 0,
		dlc = "pal",
		color = Color("a9aca0")
	}
	self.materials.houndstooth = {
		name_id = "bm_mtl_houndstooth",
		pcs = {},
		texture = "units/pd2_dlc_lupus/materials/matcap_houndstooth_df",
		material_amount = 0,
		value = 0,
		dlc = "pal",
		color = Color("ababab")
	}
	self.materials.redwhite = {
		name_id = "bm_mtl_matcap_redwhite_df",
		pcs = {},
		texture = "units/pd2_dlc_lupus/materials/matcap_redwhite_df",
		value = 0,
		dlc = "pal",
		color = Color("603a3c")
	}
	self.materials.mushroom_cloud = {
		name_id = "bm_mtl_matcap_mushroom_cloud_df",
		pcs = {},
		texture = "units/pd2_dlc_lupus/materials/matcap_mushroom_cloud_df",
		value = 0,
		dlc = "pal",
		color = Color("8d9bb1")
	}
	self.materials.nebula = {
		name_id = "bm_mtl_nebula",
		pcs = {},
		texture = "units/pd2_dlc_mad/masks/materials/matcap_nebula_df",
		value = 0,
		color = Color("aea0c1")
	}
	self.materials.planet = {
		name_id = "bm_mtl_planet",
		pcs = {},
		texture = "units/pd2_dlc_mad/masks/materials/matcap_planet_df",
		value = 0,
		color = Color("be9f87")
	}
	self.materials.rusty = {
		name_id = "bm_mtl_rusty",
		pcs = {},
		texture = "units/pd2_dlc_mad/masks/materials/matcap_rusty_df",
		material_amount = 0,
		value = 0,
		color = Color("a15d33")
	}
	self.materials.spaceship = {
		name_id = "bm_mtl_spaceship",
		pcs = {},
		texture = "units/pd2_dlc_mad/masks/materials/matcap_spaceship_df",
		material_amount = 0,
		value = 0,
		color = Color("3d3e3d")
	}
	self.materials.chromey = {
		name_id = "bm_mtl_chromey",
		pcs = {},
		texture = "units/pd2_dlc_born/masks/materials/matcap_chrome_pastel_df",
		value = 0,
		texture_bundle_folder = "born",
		dlc = "born",
		color = Color("87889b")
	}
	self.materials.devil_eye = {
		name_id = "bm_mtl_devil_eye",
		pcs = {},
		texture = "units/pd2_dlc_born/masks/materials/matcap_devil_eye_df",
		value = 0,
		texture_bundle_folder = "born",
		dlc = "born",
		color = Color("af7c71")
	}
	self.materials.hotrod_red = {
		name_id = "bm_mtl_hotrod_red",
		pcs = {},
		texture = "units/pd2_dlc_born/masks/materials/matcap_hotrod_red_df",
		value = 0,
		texture_bundle_folder = "born",
		dlc = "born",
		color = Color("c67a7c")
	}
	self.materials.shiny_and_chrome = {
		name_id = "bm_mtl_shiny_and_chrome",
		pcs = {},
		texture = "units/pd2_dlc_born/masks/materials/matcap_red_gold_df",
		value = 0,
		texture_bundle_folder = "born",
		dlc = "born",
		color = Color("c29f4b")
	}
	self.materials.club = {
		name_id = "bm_mtl_club",
		pcs = {},
		texture = "units/pd2_dlc_pim/masks/materials/matcap_club_df",
		value = 0,
		dlc = "pim",
		color = Color("795f9e")
	}
	self.materials.mist = {
		name_id = "bm_mtl_mist",
		pcs = {},
		texture = "units/pd2_dlc_pim/masks/materials/matcap_mist_df",
		value = 0,
		dlc = "pim",
		color = Color("8a969a")
	}
	self.materials.dog = {
		material_amount = 0,
		name_id = "bm_mtl_dog",
		pcs = {},
		texture = "units/pd2_dlc_pim/masks/materials/matcap_dog_df",
		value = 0,
		dlc = "pim",
		color = Color("9d8260")
	}
	self.materials.wheel = {
		material_amount = 0,
		name_id = "bm_mtl_wheel",
		pcs = {},
		texture = "units/pd2_dlc_pim/masks/materials/matcap_wheel_df",
		value = 0,
		dlc = "pim",
		color = Color("525156")
	}
	self.materials.army_deep_green = {
		name_id = "bm_mtl_army_deep_green",
		pcs = {},
		texture = "units/pd2_dlc_tng/masks/materials/matcap_army_deep_green_df",
		value = 0,
		dlc = "tango",
		color = Color("374b36")
	}
	self.materials.ranger_black = {
		name_id = "bm_mtl_ranger_black",
		pcs = {},
		texture = "units/pd2_dlc_tng/masks/materials/matcap_ranger_black_df",
		value = 0,
		dlc = "tango",
		color = Color("2b2d2d")
	}
	self.materials.digital_camo = {
		name_id = "bm_mtl_digital_camo",
		pcs = {},
		texture = "units/pd2_dlc_tng/masks/materials/matcap_digital_camo_df",
		value = 0,
		material_amount = 0,
		dlc = "tango",
		color = Color("7e8288")
	}
	self.materials.midnight_camo = {
		name_id = "bm_mtl_midnight_camo",
		pcs = {},
		texture = "units/pd2_dlc_tng/masks/materials/matcap_midnight_camo_df",
		value = 0,
		material_amount = 0,
		dlc = "tango",
		color = Color("3b3c3c")
	}
	self.materials.oxidized_copper = {
		name_id = "bm_mtl_oxidized_copper",
		pcs = {},
		texture = "units/pd2_dlc_friend/masks/materials/matcap_oxidized_copper_df",
		value = 0,
		material_amount = 0,
		dlc = "friend",
		color = Color("6a7155")
	}
	self.materials.golden_hour = {
		name_id = "bm_mtl_golden_hour",
		pcs = {},
		texture = "units/pd2_dlc_friend/masks/materials/matcap_golden_hour_df",
		value = 0,
		dlc = "friend",
		color = Color("b48a38")
	}
	self.materials.red_velvet = {
		name_id = "bm_mtl_red_velvet",
		pcs = {},
		texture = "units/pd2_dlc_friend/masks/materials/matcap_red_velvet_df",
		value = 0,
		dlc = "friend",
		color = Color("510602")
	}
	self.materials.black_marble = {
		name_id = "bm_mtl_black_marble",
		pcs = {},
		texture = "units/pd2_dlc_friend/masks/materials/matcap_black_marble_df",
		value = 0,
		material_amount = 0,
		dlc = "friend",
		color = Color("2c2c2c")
	}
	self.materials.carbon_fiber_weave = {
		name_id = "bm_mtl_carbon_fiber_weave",
		pcs = {},
		texture = "units/pd2_dlc_spa/masks/materials/matcap_carbon_fiber_weave_df",
		value = 0,
		material_amount = 0,
		dlc = "spa",
		color = Color("1a1a1a")
	}
	self.materials.black_suede = {
		name_id = "bm_mtl_black_suede",
		pcs = {},
		texture = "units/pd2_dlc_spa/masks/materials/matcap_black_suede_df",
		value = 0,
		material_amount = 0,
		dlc = "spa",
		color = Color("2e2e2e")
	}
	self.materials.neon_blue = {
		name_id = "bm_mtl_neon_blue",
		pcs = {},
		texture = "units/pd2_dlc_spa/masks/materials/matcap_neon_blue_df",
		value = 0,
		dlc = "spa",
		color = Color("165c8d")
	}
	self.materials.underground_neon = {
		name_id = "bm_mtl_underground_neon",
		pcs = {},
		texture = "units/pd2_dlc_spa/masks/materials/matcap_underground_neon_df",
		value = 0,
		dlc = "spa",
		color = Color("a63a2d")
	}
	self.materials.russian_camouflage = {
		name_id = "bm_mtl_russian_camouflage",
		pcs = {},
		texture = "units/pd2_dlc_grv/masks/materials/matcap_russian_camouflage_df",
		value = 0,
		material_amount = 0,
		dlc = "grv",
		color = Color("746963")
	}
	self.materials.ceramics_gzhel = {
		name_id = "bm_mtl_ceramics_gzhel",
		pcs = {},
		texture = "units/pd2_dlc_grv/masks/materials/matcap_ceramics_gzhel_df",
		value = 0,
		material_amount = 0,
		dlc = "grv",
		color = Color("a1a7b3")
	}
	self.materials.propaganda_palette = {
		name_id = "bm_mtl_propaganda_palette",
		pcs = {},
		texture = "units/pd2_dlc_grv/masks/materials/matcap_propaganda_palette_df",
		value = 0,
		dlc = "grv",
		color = Color("a88e7a")
	}
	self.materials.tricolor = {
		name_id = "bm_mtl_tricolor",
		pcs = {},
		texture = "units/pd2_dlc_grv/masks/materials/matcap_tricolor_df",
		value = 0,
		dlc = "grv",
		color = Color("9d8087")
	}
	self.materials.solid_greyscale70 = {
		name_id = "bm_mtl_matcap_solid_greyscale70",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_greyscale70_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("ababab")
	}
	self.materials.solid_greyscale50 = {
		name_id = "bm_mtl_matcap_solid_grey50",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_greyscale50_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("474747")
	}
	self.materials.solid_greyscale10 = {
		name_id = "bm_mtl_matcap_solid_greyscale10",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_greyscale10_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("212121")
	}
	self.materials.solid_green = {
		name_id = "bm_mtl_matcap_solid_green",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_green_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("4db14d")
	}
	self.materials.solid_green_dark = {
		name_id = "bm_mtl_matcap_solid_green_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_green_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("194b19")
	}
	self.materials.solid_green_desaturated = {
		name_id = "bm_mtl_matcap_solid_green_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_green_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("8b8b73")
	}
	self.materials.solid_yellow = {
		name_id = "bm_mtl_matcap_solid_yellow",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_yellow_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("b0b14d")
	}
	self.materials.solid_yellow_dark = {
		name_id = "bm_mtl_matcap_solid_yellow_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_yellow_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("4b4b19")
	}
	self.materials.solid_yellow_desaturated = {
		name_id = "bm_mtl_matcap_solid_yellow_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_yellow_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("8b8b73")
	}
	self.materials.solid_orange = {
		name_id = "bm_mtl_matcap_solid_orange",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_orange_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("b17e4d")
	}
	self.materials.solid_orange_dark = {
		name_id = "bm_mtl_matcap_solid_orange_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_orange_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("4b3119")
	}
	self.materials.solid_orange_desaturated = {
		name_id = "bm_mtl_matcap_solid_orange_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_orange_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("8b7f73")
	}
	self.materials.solid_red = {
		name_id = "bm_mtl_matcap_solid_red",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_red_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("db2323")
	}
	self.materials.solid_red_dark = {
		name_id = "bm_mtl_matcap_solid_red_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_red_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("4c1919")
	}
	self.materials.solid_red_desaturated = {
		name_id = "bm_mtl_matcap_solid_red_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_red_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("8c7474")
	}
	self.materials.solid_purple = {
		name_id = "bm_mtl_matcap_solid_purple",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_purple_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("8f4db1")
	}
	self.materials.solid_purple_dark = {
		name_id = "bm_mtl_matcap_solid_purple_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_purple_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("3b194b")
	}
	self.materials.solid_purple_desaturated = {
		name_id = "bm_mtl_matcap_solid_purple_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_purple_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("83738b")
	}
	self.materials.solid_pink = {
		name_id = "bm_mtl_matcap_solid_pink",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_pink_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("b14db0")
	}
	self.materials.solid_pink_dark = {
		name_id = "bm_mtl_matcap_solid_pink_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_pink_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("4b194b")
	}
	self.materials.solid_pink_desaturated = {
		name_id = "bm_mtl_matcap_solid_pink_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_pink_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("8b738b")
	}
	self.materials.solid_blue = {
		name_id = "bm_mtl_matcap_solid_blue",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_blue_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("3a5cb3")
	}
	self.materials.solid_blue_dark = {
		name_id = "bm_mtl_matcap_solid_blue_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_blue_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("19194b")
	}
	self.materials.solid_blue_desaturated = {
		name_id = "bm_mtl_matcap_solid_blue_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_blue_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("73738b")
	}
	self.materials.solid_paydayblue = {
		name_id = "bm_mtl_matcap_solid_paydayblue",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_paydayblue_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("4d8fb1")
	}
	self.materials.solid_paydayblue_dark = {
		name_id = "bm_mtl_matcap_solid_paydayblue_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_paydayblue_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("193b4b")
	}
	self.materials.solid_paydayblue_desaturated = {
		name_id = "bm_mtl_matcap_solid_paydayblue_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_paydayblue_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("73838b")
	}
	self.materials.solid_teal = {
		name_id = "bm_mtl_matcap_solid_teal",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_teal_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("194b4b")
	}
	self.materials.solid_teal_dark = {
		name_id = "bm_mtl_matcap_solid_teal_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_teal_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("194b4b")
	}
	self.materials.solid_teal_desaturated = {
		name_id = "bm_mtl_matcap_solid_teal_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_teal_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("738b8b")
	}
	self.materials.solid_magenta = {
		name_id = "bm_mtl_matcap_solid_magenta",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_magenta_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("843951")
	}
	self.materials.solid_magenta_dark = {
		name_id = "bm_mtl_matcap_solid_magenta_dark",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_magenta_dark_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("391320")
	}
	self.materials.solid_magenta_desaturated = {
		name_id = "bm_mtl_matcap_solid_magenta_desaturated",
		pcs = {
			10,
			20,
			30,
			40
		},
		texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_magenta_desaturated_df",
		value = 1,
		material_amount = 0,
		texture_bundle_folder = "pmp",
		color = Color("68565c")
	}
	local tintable_gui_plastic = "guis/textures/pd2/blackmarket/icons/materials/plastic"
	self.materials.solid_flat_warm_yellow = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_warm_yellow_df",
		name_id = "bm_mclr_warm_yellow",
		material_amount = 0,
		value = 1,
		color = Color(0.98039221763611, 0.61568629741669, 0.027450982481241),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_lime_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_lime_green_df",
		name_id = "bm_mclr_lime_green",
		material_amount = 0,
		value = 1,
		color = Color(0, 0.65098041296005, 0.31764706969261),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_purple = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_purple_df",
		name_id = "bm_mclr_purple",
		material_amount = 0,
		value = 1,
		color = Color(0.60392159223557, 0.26666668057442, 0.86274516582489),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_light_brown = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_light_brown_df",
		name_id = "bm_mclr_light_brown",
		material_amount = 0,
		value = 1,
		color = Color(0.80000007152557, 0.45098042488098, 0.13725490868092),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_sea_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_sea_blue_df",
		name_id = "bm_mclr_sea_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.023529414087534, 0.21568629145622, 0.21960785984993),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_cyan = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_cyan_df",
		name_id = "bm_mclr_cyan",
		material_amount = 0,
		value = 1,
		color = Color(0, 1, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_coral_red = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_coral_red_df",
		name_id = "bm_mclr_coral_red",
		material_amount = 0,
		value = 1,
		color = Color(0.83529418706894, 0.14117647707462, 0.20784315466881),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_bravo_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_bravo_blue_df",
		name_id = "bm_mclr_bravo_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.82745105028152, 0.89019614458084, 0.95294123888016),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_twilight_lavender = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_twilight_lavender_df",
		name_id = "bm_mclr_twilight_lavender",
		material_amount = 0,
		value = 1,
		color = Color(0.5137255191803, 0.26666668057442, 0.43529415130615),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_mindaro = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_mindaro_df",
		name_id = "bm_mclr_mindaro",
		material_amount = 0,
		value = 1,
		color = Color(0.90588241815567, 1, 0.53725492954254),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_leaf_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_leaf_green_df",
		name_id = "bm_mclr_leaf_green",
		material_amount = 0,
		value = 1,
		color = Color(0.4078431725502, 0.74901962280273, 0.21176472306252),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_may_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_may_green_df",
		name_id = "bm_mclr_may_green",
		material_amount = 0,
		value = 1,
		color = Color(0.27843138575554, 0.55294120311737, 0.27843138575554),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_white = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_white_df",
		name_id = "bm_mclr_white",
		material_amount = 0,
		value = 1,
		color = Color(1, 1, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_tickle_pink = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_tickle_pink_df",
		name_id = "bm_mclr_tickle_pink",
		material_amount = 0,
		value = 1,
		color = Color(1, 0.5137255191803, 0.70980393886566),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_orange = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_orange_df",
		name_id = "bm_mclr_orange",
		material_amount = 0,
		value = 1,
		color = Color(1, 0.36862745881081, 0.05882353335619),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_blithe_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_blithe_blue_df",
		name_id = "bm_mclr_blithe_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.56470590829849, 0.74901962280273, 0.74901962280273),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_guppie_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_guppie_green_df",
		name_id = "bm_mclr_guppie_green",
		material_amount = 0,
		value = 1,
		color = Color(0, 1, 0.48627454042435),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_congo_pink = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_congo_pink_df",
		name_id = "bm_mclr_congo_pink",
		material_amount = 0,
		value = 1,
		color = Color(1, 0.53333336114883, 0.4588235616684),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_fern_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_fern_green_df",
		name_id = "bm_mclr_fern_green",
		material_amount = 0,
		value = 1,
		color = Color(0.33333334326744, 0.49803924560547, 0.23529413342476),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_blood_red = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_blood_red_df",
		name_id = "bm_mclr_blood_red",
		material_amount = 0,
		value = 1,
		color = Color(0.54117649793625, 0.066666670143604, 0.035294119268656),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_gray = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_gray_df",
		name_id = "bm_mclr_gray",
		material_amount = 0,
		value = 1,
		color = Color(0.50196081399918, 0.50196081399918, 0.50196081399918),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_deep_aquamarine = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_deep_aquamarine_df",
		name_id = "bm_mclr_deep_aquamarine",
		material_amount = 0,
		value = 1,
		color = Color(0.26274511218071, 0.54509806632996, 0.47450983524323),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_mud = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_mud_df",
		name_id = "bm_mclr_mud",
		material_amount = 0,
		value = 1,
		color = Color(0.41176474094391, 0.33725491166115, 0.29411765933037),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_olive_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_olive_green_df",
		name_id = "bm_mclr_olive_green",
		material_amount = 0,
		value = 1,
		color = Color(0.28235295414925, 0.35294118523598, 0.19607844948769),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_rifle_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_rifle_green_df",
		name_id = "bm_mclr_rifle_green",
		material_amount = 0,
		value = 1,
		color = Color(0.27843138575554, 0.30196079611778, 0.24705883860588),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_green_df",
		name_id = "bm_mclr_green",
		material_amount = 0,
		value = 1,
		color = Color(0, 1, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_magenta = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_magenta_df",
		name_id = "bm_mclr_magenta",
		material_amount = 0,
		value = 1,
		color = Color(1, 0, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_red = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_red_df",
		name_id = "bm_mclr_dark_red",
		material_amount = 0,
		value = 1,
		color = Color(0.43137258291245, 0.05882353335619, 0.086274512112141),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_turquoise = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_turquoise_df",
		name_id = "bm_mclr_turquoise",
		material_amount = 0,
		value = 1,
		color = Color(0, 0.81960791349411, 0.61568629741669),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_deep_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_deep_green_df",
		name_id = "bm_mclr_deep_green",
		material_amount = 0,
		value = 1,
		color = Color(0.17254902422428, 0.20000001788139, 0.098039224743843),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_parisian_patina = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_parisian_patina_df",
		name_id = "bm_mclr_parisian_patina",
		material_amount = 0,
		value = 1,
		color = Color(0.48627454042435, 0.64705884456635, 0.50980395078659),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_sand = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_sand_df",
		name_id = "bm_mclr_sand",
		material_amount = 0,
		value = 1,
		color = Color(0.6745098233223, 0.55294120311737, 0.48235297203064),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_heliotrope = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_heliotrope_df",
		name_id = "bm_mclr_heliotrope",
		material_amount = 0,
		value = 1,
		color = Color(0.89411771297455, 0.47450983524323, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_gray_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_gray_blue_df",
		name_id = "bm_mclr_gray_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.047058828175068, 0.26666668057442, 0.32941177487373),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_sea_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_sea_green_df",
		name_id = "bm_mclr_sea_green",
		material_amount = 0,
		value = 1,
		color = Color(0, 1, 0.74901962280273),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_neon_red = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_neon_red_df",
		name_id = "bm_mclr_neon_red",
		material_amount = 0,
		value = 1,
		color = Color(1, 0, 0.23529413342476),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_electric_indigo = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_electric_indigo_df",
		name_id = "bm_mclr_electric_indigo",
		material_amount = 0,
		value = 1,
		color = Color(0.37647062540054, 0, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_chartreuse = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_chartreuse_df",
		name_id = "bm_mclr_chartreuse",
		material_amount = 0,
		value = 1,
		color = Color(0.49803924560547, 1, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_toxic_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_toxic_green_df",
		name_id = "bm_mclr_toxic_green",
		material_amount = 0,
		value = 1,
		color = Color(0.65490198135376, 0.97254908084869, 0.34117648005486),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_matte_purple = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_matte_purple_df",
		name_id = "bm_mclr_matte_purple",
		material_amount = 0,
		value = 1,
		color = Color(0.41960787773132, 0.32941177487373, 0.56470590829849),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_maximum_purple = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_maximum_purple_df",
		name_id = "bm_mclr_maximum_purple",
		material_amount = 0,
		value = 1,
		color = Color(0.4627451300621, 0.25098040699959, 0.51764708757401),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_french_sky_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_french_sky_blue_df",
		name_id = "bm_mclr_french_sky_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.47843140363693, 0.61568629741669, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_shadow_yellow = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_shadow_yellow_df",
		name_id = "bm_mclr_shadow_yellow",
		material_amount = 0,
		value = 1,
		color = Color(0.63529413938522, 0.63529413938522, 0.38039219379425),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_green_df",
		name_id = "bm_mclr_dark_green",
		material_amount = 0,
		value = 1,
		color = Color(0.027450982481241, 0.23921570181847, 0.035294119268656),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_pink = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_pink_df",
		name_id = "bm_mclr_pink",
		material_amount = 0,
		value = 1,
		color = Color(1, 0.47843140363693, 0.90196084976196),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_gray = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_gray_df",
		name_id = "bm_mclr_dark_gray",
		material_amount = 0,
		value = 1,
		color = Color(0.25098040699959, 0.25098040699959, 0.25098040699959),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_branch_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_branch_green_df",
		name_id = "bm_mclr_branch_green",
		material_amount = 0,
		value = 1,
		color = Color(0.3647058904171, 0.3647058904171, 0.19215688109398),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_brown = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_brown_df",
		name_id = "bm_mclr_brown",
		material_amount = 0,
		value = 1,
		color = Color(0.50196081399918, 0.27450981736183, 0.050980396568775),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_slate_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_slate_blue_df",
		name_id = "bm_mclr_dark_slate_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.28627452254295, 0.28627452254295, 0.57647061347961),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_coffee = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_coffee_df",
		name_id = "bm_mclr_coffee",
		material_amount = 0,
		value = 1,
		color = Color(0.41960787773132, 0.32549020648003, 0.21568629145622),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_puce = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_puce_df",
		name_id = "bm_mclr_dark_puce",
		material_amount = 0,
		value = 1,
		color = Color(0.31764706969261, 0.16862745583057, 0.22745099663734),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_light_gray = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_light_gray_df",
		name_id = "bm_mclr_light_gray",
		material_amount = 0,
		value = 1,
		color = Color(0.74901962280273, 0.74901962280273, 0.74901962280273),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_haven = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_haven_df",
		name_id = "bm_mclr_haven",
		material_amount = 0,
		value = 1,
		color = Color(0.64705884456635, 0.73333334922791, 0.56078433990479),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_cordovan = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_cordovan_df",
		name_id = "bm_mclr_cordovan",
		material_amount = 0,
		value = 1,
		color = Color(0.51764708757401, 0.24705883860588, 0.27450981736183),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_aquamarine = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_aquamarine_df",
		name_id = "bm_mclr_aquamarine",
		material_amount = 0,
		value = 1,
		color = Color(0.49019610881805, 1, 0.8705883026123),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_brandeis_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_brandeis_blue_df",
		name_id = "bm_mclr_brandeis_blue",
		material_amount = 0,
		value = 1,
		color = Color(0, 0.46666669845581, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_black = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_black_df",
		name_id = "bm_mclr_black",
		material_amount = 0,
		value = 1,
		color = Color(0.1, 0.1, 0.1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_scary_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_scary_green_df",
		name_id = "bm_mclr_scary_green",
		material_amount = 0,
		value = 1,
		color = Color(0.36078432202339, 1, 0.4588235616684),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_skin_pink = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_skin_pink_df",
		name_id = "bm_mclr_skin_pink",
		material_amount = 0,
		value = 1,
		color = Color(0.90196084976196, 0.57647061347961, 0.54901963472366),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_purple = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_purple_df",
		name_id = "bm_mclr_dark_purple",
		material_amount = 0,
		value = 1,
		color = Color(0.41960787773132, 0, 0.29019609093666),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_yellow = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_yellow_df",
		name_id = "bm_mclr_yellow",
		material_amount = 0,
		value = 1,
		color = Color(1, 1, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_red = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_red_df",
		name_id = "bm_mclr_red",
		material_amount = 0,
		value = 1,
		color = Color(1, 0, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_blue_bell = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_blue_bell_df",
		name_id = "bm_mclr_blue_bell",
		material_amount = 0,
		value = 1,
		color = Color(0.65882354974747, 0.61960786581039, 0.8156863451004),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_fashion_fuchsia = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_fashion_fuchsia_df",
		name_id = "bm_mclr_fashion_fuchsia",
		material_amount = 0,
		value = 1,
		color = Color(1, 0, 0.69019609689713),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_matte_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_matte_blue_df",
		name_id = "bm_mclr_matte_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.21960785984993, 0.38039219379425, 0.65882354974747),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_shadow_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_shadow_blue_df",
		name_id = "bm_mclr_shadow_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.47450983524323, 0.54901963472366, 0.63529413938522),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_heat_wave = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_heat_wave_df",
		name_id = "bm_mclr_heat_wave",
		material_amount = 0,
		value = 1,
		color = Color(1, 0.47450983524323, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_coyote_brown = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_coyote_brown_df",
		name_id = "bm_mclr_coyote_brown",
		material_amount = 0,
		value = 1,
		color = Color(0.47450983524323, 0.41176474094391, 0.23137256503105),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_mellow_green = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_mellow_green_df",
		name_id = "bm_mclr_mellow_green",
		material_amount = 0,
		value = 1,
		color = Color(0.80392163991928, 0.80392163991928, 0.56078433990479),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_vivid_raspberry = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_vivid_raspberry_df",
		name_id = "bm_mclr_vivid_raspberry",
		material_amount = 0,
		value = 1,
		color = Color(1, 0, 0.039215687662363),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_slate_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_slate_blue_df",
		name_id = "bm_mclr_slate_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.49803924560547, 0.49803924560547, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_blue_df",
		name_id = "bm_mclr_blue",
		material_amount = 0,
		value = 1,
		color = Color(0, 0, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_lavender = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_lavender_df",
		name_id = "bm_mclr_lavender",
		material_amount = 0,
		value = 1,
		color = Color(0.68627452850342, 0.49411767721176, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_kilim_beige = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_kilim_beige_df",
		name_id = "bm_mclr_kilim_beige",
		material_amount = 0,
		value = 1,
		color = Color(0.84705889225006, 0.7607843875885, 0.68235296010971),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_navy_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_navy_blue_df",
		name_id = "bm_mclr_navy_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.15686275064945, 0.2039215862751, 0.33725491166115),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_baroness = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_baroness_df",
		name_id = "bm_mclr_baroness",
		material_amount = 0,
		value = 1,
		color = Color(0.678431391716, 0.52549022436142, 0.6745098233223),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_russian_violet = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_russian_violet_df",
		name_id = "bm_mclr_russian_violet",
		material_amount = 0,
		value = 1,
		color = Color(0.23529413342476, 0.14901961386204, 0.29803922772408),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_pastel_yellow = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_pastel_yellow_df",
		name_id = "bm_mclr_pastel_yellow",
		material_amount = 0,
		value = 1,
		color = Color(1, 1, 0.52156865596771),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_imperial_purple = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_imperial_purple_df",
		name_id = "bm_mclr_imperial_purple",
		material_amount = 0,
		value = 1,
		color = Color(0.42352944612503, 0, 0.29019609093666),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_rosebay = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_rosebay_df",
		name_id = "bm_mclr_rosebay",
		material_amount = 0,
		value = 1,
		color = Color(0.78823536634445, 0.58823531866074, 0.72549021244049),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_vivid_sky_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_vivid_sky_blue_df",
		name_id = "bm_mclr_vivid_sky_blue",
		material_amount = 0,
		value = 1,
		color = Color(0, 0.77647066116333, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_vivid_orchid = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_vivid_orchid_df",
		name_id = "bm_mclr_vivid_orchid",
		material_amount = 0,
		value = 1,
		color = Color(0.80000007152557, 0, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_vivid_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_vivid_blue_df",
		name_id = "bm_mclr_vivid_blue",
		material_amount = 0,
		value = 1,
		color = Color(0, 0.26274511218071, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_bone_white = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_bone_white_df",
		name_id = "bm_mclr_bone_white",
		material_amount = 0,
		value = 1,
		color = Color(1, 0.93333339691162, 0.59215688705444),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_bright_yellow = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_bright_yellow_df",
		name_id = "bm_mclr_bright_yellow",
		material_amount = 0,
		value = 1,
		color = Color(1, 0.8117647767067, 0.29803922772408),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_light_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_light_blue_df",
		name_id = "bm_mclr_light_blue",
		material_amount = 0,
		value = 1,
		color = Color(0.49411767721176, 0.77647066116333, 0.93333339691162),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_upsdell_red = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_upsdell_red_df",
		name_id = "bm_mclr_upsdell_red",
		material_amount = 0,
		value = 1,
		color = Color(0.65098041296005, 0.12156863510609, 0.17254902422428),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_cobalt_blue = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_cobalt_blue_df",
		name_id = "bm_mclr_cobalt_blue",
		material_amount = 0,
		value = 1,
		color = Color(0, 0.3647058904171, 0.78039222955704),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_stg_orange = {
		texture = "units/pd2_dlc_lic/masks/materials/matcap_stg_orange_df",
		texture_bundle_folder = "lic",
		material_amount = 0,
		name_id = "bm_mclr_stg_orange",
		value = 1,
		color = Color("fc4c02"),
		tintable_gui = tintable_gui_plastic
	}
	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.materials) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end
end
