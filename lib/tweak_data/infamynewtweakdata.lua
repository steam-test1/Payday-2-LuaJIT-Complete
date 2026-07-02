InfamyTweakData = InfamyTweakData or class()

function InfamyTweakData:init()
	local function digest(value)
		return Application:digest_value(value, true)
	end

	local cost_old = digest(200000000)
	local cost_new = digest(0)

	self.ranks = 500
	self.offshore_cost = {
		cost_old,
		cost_old,
		cost_old,
		cost_old,
		cost_old,
		cost_new
	}
	self.card_sequences = {}
	self.statistics_rank_steps = {}

	for i = 0, 100 do
		table.insert(self.statistics_rank_steps, 1, i)
	end

	for i = 150, self.ranks, 50 do
		table.insert(self.statistics_rank_steps, 1, i)
	end

	self.join_stingers = 36
	self.free_join_stingers = {
		0,
		18
	}
	self.dlc_join_stingers = {
		{
			dlc = "a11th_stinger",
			join_stinger = 36
		}
	}
	self.icon_rank_step = 100
	self.infamy_icons = {
		{
			hud_icon = "infamy_icon_1",
			color = Color("000000")
		},
		{
			hud_icon = "infamy_icon_2",
			color = Color("B8000A")
		},
		{
			hud_icon = "infamy_icon_3",
			color = Color("000000")
		},
		{
			hud_icon = "infamy_icon_4",
			color = Color("B8000A")
		},
		{
			hud_icon = "infamy_icon_5",
			color = Color("FFD700")
		}
	}
	self.tree = {}
	self.tree[1] = "infamy_root"
	self.tree[2] = "infamy_xp_medium_4"
	self.tree[3] = "infamy_mastermind"
	self.tree[4] = "infamy_xp_medium_5"
	self.tree[5] = "infamy_enforcer"
	self.tree[6] = "infamy_xp_medium_8"
	self.tree[7] = "infamy_technician"
	self.tree[8] = "infamy_xp_medium_9"
	self.tree[9] = "infamy_ghost"
	self.tree[10] = "infamy_xp_medium_2"
	self.tree[11] = "infamy_maskpack_balaclava"
	self.tree[12] = "infamy_xp_medium_6"
	self.tree[13] = "infamy_maskpack_lurker"
	self.tree[14] = "infamy_xp_medium_7"
	self.tree[15] = "infamy_maskpack_daft"
	self.tree[16] = "infamy_xp_medium_11"
	self.tree[17] = "infamy_maskpack_punk"
	self.tree[18] = "infamy_xp_medium_1"
	self.tree[19] = "infamy_maskpack_pain"
	self.tree[20] = "infamy_xp_medium_3"
	self.tree[21] = "infamy_maskpack_ranger"
	self.tree[22] = "infamy_xp_medium_10"
	self.tree[23] = "infamy_maskpack_hood"
	self.tree[24] = "infamy_xp_medium_12"
	self.tree[25] = "infamy_maskpack_destroyer"
	self.tree[26] = "infamy_stinger_002"
	self.tree[27] = "infamy_color_inf_01"
	self.tree[28] = "infamy_color_inf_02"
	self.tree[29] = "infamy_stinger_003"
	self.tree[30] = "infamy_suitpack_t800"
	self.tree[31] = "infamy_stinger_004"
	self.tree[32] = "infamy_color_inf_03"
	self.tree[33] = "infamy_color_inf_04"
	self.tree[34] = "infamy_stinger_005"
	self.tree[35] = "infamy_glovepack_molten"
	self.tree[36] = "infamy_stinger_006"
	self.tree[37] = "infamy_color_inf_05"
	self.tree[38] = "infamy_color_inf_06"
	self.tree[39] = "infamy_stinger_007"
	self.tree[40] = "infamy_suitpack_t800_toughboy"
	self.tree[41] = "infamy_stinger_008"
	self.tree[42] = "infamy_color_inf_07"
	self.tree[43] = "infamy_color_inf_08"
	self.tree[44] = "infamy_stinger_009"
	self.tree[45] = "infamy_glovepack_tiger"
	self.tree[46] = "infamy_stinger_010"
	self.tree[47] = "infamy_color_inf_09"
	self.tree[48] = "infamy_color_inf_10"
	self.tree[49] = "infamy_stinger_011"
	self.tree[50] = "infamy_suitpack_t800_red"
	self.tree[51] = "infamy_stinger_012"
	self.tree[52] = "infamy_color_inf_11"
	self.tree[53] = "infamy_color_inf_12"
	self.tree[54] = "infamy_stinger_013"
	self.tree[55] = "infamy_glovepack_cosmos"
	self.tree[56] = "infamy_stinger_014"
	self.tree[57] = "infamy_color_inf_13"
	self.tree[58] = "infamy_color_inf_14"
	self.tree[59] = "infamy_stinger_015"
	self.tree[60] = "infamy_suitpack_t800_cowboy"
	self.tree[61] = "infamy_stinger_016"
	self.tree[62] = "infamy_color_inf_15"
	self.tree[63] = "infamy_color_inf_16"
	self.tree[64] = "infamy_stinger_017"
	self.tree[65] = "infamy_glovepack_neoncity"
	self.tree[66] = "in31_suitpack_leather"
	self.tree[67] = "in31_weapon_color_stinger_01"
	self.tree[68] = "in31_glovepack_wool"
	self.tree[69] = "in31_weapon_color_stinger_02"
	self.tree[70] = "in31_suitpack_leather_black"
	self.tree[71] = "in31_weapon_color_stinger_03"
	self.tree[72] = "in31_maskpack_lastlaugh"
	self.tree[73] = "in31_weapon_color_stinger_04"
	self.tree[74] = "in31_suitpack_leather_red"
	self.tree[75] = "in31_weapon_color_stinger_05"
	self.tree[76] = "in31_maskpack_cyberpunk"
	self.tree[77] = "in31_weapon_color_stinger_06"
	self.tree[78] = "in31_suitpack_leather_white"
	self.tree[79] = "in31_weapon_color_stinger_07"
	self.tree[80] = "in31_glovepack_silver"
	self.tree[81] = "in31_weapon_color_stinger_08"
	self.tree[82] = "in32_glovepack_goldnet"
	self.tree[83] = "in32_weapon_color_stinger_01"
	self.tree[84] = "in32_suitpack_gangstercoat"
	self.tree[85] = "in32_weapon_color_stinger_02"
	self.tree[86] = "in32_suitpack_gangstercoat_british"
	self.tree[87] = "in32_weapon_color_stinger_03"
	self.tree[88] = "in32_maskpack_goldenbrute"
	self.tree[89] = "in32_weapon_color_stinger_04"
	self.tree[90] = "in32_suitpack_gangstercoat_french"
	self.tree[91] = "in32_weapon_color_stinger_05"
	self.tree[92] = "in32_suitpack_gangstercoat_irish"
	self.tree[93] = "in32_weapon_color_stinger_06"
	self.tree[94] = "in32_maskpack_ingoldnito"
	self.tree[95] = "in32_weapon_color_stinger_07"
	self.tree[96] = "in32_suitpack_general_default_blue"
	self.tree[97] = "in32_weapon_color_stinger_08"
	self.tree[98] = "in32_suitglovepack_general_postmoto"
	self.tree[99] = "in32_weapon_color_stinger_09"
	self.tree[100] = "in33_one_hundred"
	self.cost = {
		root = digest(0),
		tier1 = digest(0)
	}
	self.items = {}

	local skilltree_multiplier = 0.9
	local skillcost_multiplier = 0.75
	local skilltree_readable_multiplier = "10%"
	local skillcost_readable_multiplier = "25%"
	local infamous_lootdrop_multiplier = 2
	local infamous_readable_multiplier = "100%"
	local infamous_xp_multiplier_base = 1.05
	local infamous_readable_xp_multiplier_base = "5%"
	local infamous_xp_multiplier_small = 1.075
	local infamous_readable_xp_multiplier_small = "7.5%"
	local infamous_xp_multiplier_medium = 1.1
	local infamous_readable_xp_multiplier_medium = "10%"
	local infamous_xp_multiplier_large = 1.15
	local infamous_readable_xp_multiplier_large = "15%"

	self.items.infamy_root = {
		add_tier = false,
		desc_id = "menu_infamy_desc_root_new",
		name_id = "menu_infamy_name_root",
		desc_params = {
			cashcost = skillcost_readable_multiplier,
			xpboost = infamous_readable_xp_multiplier_base,
			multibasic = skilltree_readable_multiplier
		},
		icon_xy = {
			0,
			0
		},
		cost = self.cost.root,
		upgrades = {
			{
				nil,
				"masks",
				"aviator"
			},
			join_stingers = {
				1
			},
			infamous_lootdrop = infamous_lootdrop_multiplier,
			infamous_xp = infamous_xp_multiplier_base,
			skillcost = {
				multiplier = skillcost_multiplier
			},
			skilltree = {
				trees = {
					"mastermind",
					"enforcer",
					"technician",
					"ghost",
					"hoxton"
				},
				multiplier = skilltree_multiplier
			}
		}
	}
	self.items.infamy_mastermind = {
		add_tier = false,
		desc_id = "menu_infamy_desc_mastermind_new",
		name_id = "menu_infamy_name_mastermind",
		desc_params = {
			multibasic = skilltree_readable_multiplier,
			xpboost = infamous_readable_xp_multiplier_base
		},
		icon_xy = {
			2,
			0
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"plague"
			},
			{
				nil,
				"textures",
				"imperial"
			},
			{
				nil,
				"materials",
				"dark_leather"
			},
			infamous_xp = infamous_xp_multiplier_base
		}
	}
	self.items.infamy_enforcer = {
		add_tier = false,
		desc_id = "menu_infamy_desc_enforcer_new",
		name_id = "menu_infamy_name_enforcer",
		desc_params = {
			multibasic = skilltree_readable_multiplier,
			xpboost = infamous_readable_xp_multiplier_base
		},
		icon_xy = {
			3,
			0
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"welder"
			},
			{
				nil,
				"textures",
				"fatman"
			},
			{
				nil,
				"materials",
				"copper"
			},
			infamous_xp = infamous_xp_multiplier_base
		}
	}
	self.items.infamy_technician = {
		add_tier = false,
		desc_id = "menu_infamy_desc_technician_new",
		name_id = "menu_infamy_name_technician",
		desc_params = {
			multibasic = skilltree_readable_multiplier,
			xpboost = infamous_readable_xp_multiplier_base
		},
		icon_xy = {
			1,
			0
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"smoker"
			},
			{
				nil,
				"textures",
				"toto"
			},
			{
				nil,
				"materials",
				"electric"
			},
			infamous_xp = infamous_xp_multiplier_base
		}
	}
	self.items.infamy_ghost = {
		add_tier = false,
		desc_id = "menu_infamy_desc_ghost_new",
		name_id = "menu_infamy_name_ghost",
		desc_params = {
			multibasic = skilltree_readable_multiplier,
			xpboost = infamous_readable_xp_multiplier_base
		},
		icon_xy = {
			0,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"ghost"
			},
			{
				nil,
				"textures",
				"ribcage"
			},
			{
				nil,
				"materials",
				"sinister"
			},
			infamous_xp = infamous_xp_multiplier_base
		}
	}

	local generic_medium_xp_item = {
		add_tier = false,
		desc_id = "menu_infamy_desc_xp",
		name_id = "menu_infamy_name_xp",
		desc_params = {
			xpboost = infamous_readable_xp_multiplier_medium
		},
		icon_xy = {
			1,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			infamous_xp = infamous_xp_multiplier_medium
		}
	}

	for i = 1, 15 do
		self.items["infamy_xp_medium_" .. i] = deep_clone(generic_medium_xp_item)
	end

	self.items.infamy_maskpack_balaclava = {
		add_tier = false,
		desc_id = "menu_infamy_desc_balaclava",
		name_id = "menu_infamy_name_balaclava",
		desc_params = {
			xpboost = infamous_readable_xp_multiplier_small
		},
		icon_xy = {
			2,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"balaclava"
			},
			{
				nil,
				"textures",
				"pain"
			},
			{
				nil,
				"materials",
				"eye"
			},
			infamous_xp = infamous_xp_multiplier_small
		}
	}
	self.items.infamy_maskpack_lurker = {
		add_tier = false,
		desc_id = "menu_infamy_desc_lurker",
		name_id = "menu_infamy_name_lurker",
		desc_params = {
			xpboost = infamous_readable_xp_multiplier_small
		},
		icon_xy = {
			2,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"infamy_lurker"
			},
			{
				nil,
				"textures",
				"hellsanchor"
			},
			{
				nil,
				"materials",
				"baby"
			},
			infamous_xp = infamous_xp_multiplier_small
		}
	}
	self.items.infamy_maskpack_hood = {
		add_tier = false,
		desc_id = "menu_infamy_desc_hood",
		name_id = "menu_infamy_name_hood",
		desc_params = {
			xpboost = infamous_readable_xp_multiplier_small
		},
		icon_xy = {
			2,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"infamy_hood"
			},
			{
				nil,
				"textures",
				"evileye"
			},
			{
				nil,
				"materials",
				"plastic_hood"
			},
			infamous_xp = infamous_xp_multiplier_small
		}
	}
	self.items.infamy_maskpack_pain = {
		add_tier = false,
		desc_id = "menu_infamy_desc_pain",
		name_id = "menu_infamy_name_pain",
		desc_params = {
			xpboost = infamous_readable_xp_multiplier_small
		},
		icon_xy = {
			2,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"pain"
			},
			{
				nil,
				"textures",
				"spook"
			},
			{
				nil,
				"materials",
				"hades"
			},
			infamous_xp = infamous_xp_multiplier_small
		}
	}
	self.items.infamy_maskpack_ranger = {
		add_tier = false,
		desc_id = "menu_infamy_desc_ranger",
		name_id = "menu_infamy_name_ranger",
		desc_params = {
			xpboost = infamous_readable_xp_multiplier_small
		},
		icon_xy = {
			2,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"ranger"
			},
			{
				nil,
				"textures",
				"monstervisor"
			},
			{
				nil,
				"materials",
				"alien_slime"
			},
			infamous_xp = infamous_xp_multiplier_small
		}
	}
	self.items.infamy_maskpack_punk = {
		add_tier = false,
		desc_id = "menu_infamy_desc_punk",
		name_id = "menu_infamy_name_punk",
		desc_params = {
			xpboost = infamous_readable_xp_multiplier_small
		},
		icon_xy = {
			2,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"punk"
			},
			{
				nil,
				"textures",
				"steampunk"
			},
			{
				nil,
				"materials",
				"punk"
			},
			infamous_xp = infamous_xp_multiplier_small
		}
	}
	self.items.infamy_maskpack_daft = {
		add_tier = false,
		desc_id = "menu_infamy_desc_daft",
		name_id = "menu_infamy_name_daft",
		desc_params = {
			xpboost = infamous_readable_xp_multiplier_small
		},
		icon_xy = {
			2,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"daft"
			},
			{
				nil,
				"textures",
				"digital"
			},
			{
				nil,
				"materials",
				"haze"
			},
			infamous_xp = infamous_xp_multiplier_small
		}
	}
	self.items.infamy_maskpack_destroyer = {
		add_tier = false,
		desc_id = "menu_infamy_desc_destroyer",
		name_id = "menu_infamy_name_destroyer",
		desc_params = {
			xpboost = infamous_readable_xp_multiplier_small
		},
		icon_xy = {
			2,
			1
		},
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"destroyer"
			},
			{
				nil,
				"textures",
				"exmachina"
			},
			{
				nil,
				"materials",
				"arizona"
			},
			infamous_xp = infamous_xp_multiplier_small
		}
	}

	local generic_join_stinger_item = {
		desc_id = "menu_infamy_join_stinger_desc",
		name_id = "",
		desc_params = {},
		icon_xy = {
			0,
			2
		},
		cost = self.cost.tier1,
		upgrades = {
			join_stingers = {}
		}
	}
	local single_pack_join_stingers = {
		2,
		3,
		4,
		5,
		6,
		7,
		8,
		9,
		10,
		11,
		12,
		13,
		14,
		15,
		16,
		17
	}

	for _, index in ipairs(single_pack_join_stingers) do
		local item_id = string.format("infamy_stinger_%03d", index)

		self.items[item_id] = deep_clone(generic_join_stinger_item)
		self.items[item_id].name_id = "menu_" .. item_id .. "_name"

		table.insert(self.items[item_id].upgrades.join_stingers, index)
	end

	self.items.infamy_suitpack_t800 = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_infamy_name_suitpack_t800",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"t800",
				"default"
			}
		}
	}
	self.items.infamy_suitpack_t800_cowboy = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_infamy_name_suitpack_t800_cowboy",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"t800",
				"cowboy"
			}
		}
	}
	self.items.infamy_suitpack_t800_toughboy = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_infamy_name_suitpack_t800_toughboy",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"t800",
				"toughboy"
			}
		}
	}
	self.items.infamy_suitpack_t800_red = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_infamy_name_suitpack_t800_red",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"t800",
				"red"
			}
		}
	}
	self.items.infamy_glovepack_tiger = {
		desc_id = "menu_infamy_gloves_desc",
		name_id = "menu_infamy_name_glovepack_tiger",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"gloves",
				"tiger"
			}
		}
	}
	self.items.infamy_glovepack_neoncity = {
		desc_id = "menu_infamy_gloves_desc",
		name_id = "menu_infamy_name_glovepack_neoncity",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"gloves",
				"neoncity"
			}
		}
	}
	self.items.infamy_glovepack_cosmos = {
		desc_id = "menu_infamy_gloves_desc",
		name_id = "menu_infamy_name_glovepack_cosmos",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"gloves",
				"cosmos"
			}
		}
	}
	self.items.infamy_glovepack_molten = {
		desc_id = "menu_infamy_gloves_desc",
		name_id = "menu_infamy_name_glovepack_molten",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"gloves",
				"molten"
			}
		}
	}

	local generic_weapon_color_item = {
		desc_id = "menu_infamy_weapon_color_desc",
		name_id = "",
		desc_params = {},
		icon_xy = {
			2,
			3
		},
		cost = self.cost.tier1,
		upgrades = {}
	}
	local weapon_colors = {
		"color_inf_01",
		"color_inf_02",
		"color_inf_03",
		"color_inf_04",
		"color_inf_05",
		"color_inf_06",
		"color_inf_07",
		"color_inf_08",
		"color_inf_09",
		"color_inf_10",
		"color_inf_11",
		"color_inf_12",
		"color_inf_13",
		"color_inf_14",
		"color_inf_15",
		"color_inf_16"
	}

	for _, id in ipairs(weapon_colors) do
		local item_id = "infamy_" .. id
		local color_id = id

		self.items[item_id] = deep_clone(generic_weapon_color_item)
		self.items[item_id].name_id = "menu_infamy_" .. id .. "_name"

		table.insert(self.items[item_id].upgrades, {
			nil,
			"weapon_skins",
			color_id
		})
	end

	local infamy_color_and_stinger_packs = {}

	self.items.in31_maskpack_cyberpunk = {
		desc_id = "menu_in31_maskpack_cyberpunk_desc",
		name_id = "menu_in31_maskpack_cyberpunk_name",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"cyberpunk"
			}
		}
	}
	self.items.in31_maskpack_lastlaugh = {
		desc_id = "menu_in31_maskpack_lastlaugh_desc",
		name_id = "menu_in31_maskpack_lastlaugh_name",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"lastlaugh"
			}
		}
	}
	self.items.in31_glovepack_wool = {
		desc_id = "menu_infamy_gloves_desc",
		name_id = "menu_infamy_name_glovepack_wool",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"gloves",
				"wool"
			}
		}
	}
	self.items.in31_glovepack_silver = {
		desc_id = "menu_infamy_gloves_desc",
		name_id = "menu_infamy_name_glovepack_silver",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"gloves",
				"silver"
			}
		}
	}
	self.items.in31_suitpack_leather = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_infamy_name_suitpack_leather",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"leather",
				"default"
			}
		}
	}
	self.items.in31_suitpack_leather_black = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_infamy_name_suitpack_leather_black",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"leather",
				"black"
			}
		}
	}
	self.items.in31_suitpack_leather_red = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_infamy_name_suitpack_leather_red",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"leather",
				"red"
			}
		}
	}
	self.items.in31_suitpack_leather_white = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_infamy_name_suitpack_leather_white",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"leather",
				"white"
			}
		}
	}

	table.list_append(infamy_color_and_stinger_packs, {
		{
			item_id = "in31_weapon_color_stinger_01",
			join_stinger = 19,
			weapon_color = "color_in31_06"
		},
		{
			item_id = "in31_weapon_color_stinger_02",
			join_stinger = 20,
			weapon_color = "color_in31_04"
		},
		{
			item_id = "in31_weapon_color_stinger_03",
			join_stinger = 21,
			weapon_color = "color_in31_05"
		},
		{
			item_id = "in31_weapon_color_stinger_04",
			join_stinger = 22,
			weapon_color = "color_in31_02"
		},
		{
			item_id = "in31_weapon_color_stinger_05",
			join_stinger = 23,
			weapon_color = "color_in31_01"
		},
		{
			item_id = "in31_weapon_color_stinger_06",
			join_stinger = 24,
			weapon_color = "color_in31_08"
		},
		{
			item_id = "in31_weapon_color_stinger_07",
			join_stinger = 25,
			weapon_color = "color_in31_03"
		},
		{
			item_id = "in31_weapon_color_stinger_08",
			join_stinger = 26,
			weapon_color = "color_in31_07"
		}
	})

	self.items.in32_maskpack_goldenbrute = {
		desc_id = "menu_in32_maskpack_goldenbrute_desc",
		name_id = "menu_in32_maskpack_goldenbrute_name",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"goldenbrute"
			}
		}
	}
	self.items.in32_maskpack_ingoldnito = {
		desc_id = "menu_in32_maskpack_ingoldnito_desc",
		name_id = "menu_in32_maskpack_ingoldnito_name",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"masks",
				"ingoldnito"
			}
		}
	}
	self.items.in32_suitpack_gangstercoat = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_in32_suitpack_gangstercoat",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"gangstercoat",
				"default"
			}
		}
	}
	self.items.in32_suitpack_gangstercoat_irish = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_in32_suitpack_gangstercoat_irish",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"gangstercoat",
				"irish"
			}
		}
	}
	self.items.in32_suitpack_gangstercoat_british = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_in32_suitpack_gangstercoat_british",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"gangstercoat",
				"british"
			}
		}
	}
	self.items.in32_suitpack_gangstercoat_french = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_in32_suitpack_gangstercoat_french",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"gangstercoat",
				"french"
			}
		}
	}
	self.items.in32_suitpack_general_default_blue = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_in32_suitpack_general_default_blue",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"general",
				"default"
			},
			{
				nil,
				"player_styles",
				"general",
				"blue"
			}
		}
	}
	self.items.in32_suitglovepack_general_postmoto = {
		desc_id = "menu_infamy_suits_desc",
		name_id = "menu_in32_suitglovepack_general_postmoto",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"player_styles",
				"general",
				"red"
			},
			{
				nil,
				"player_styles",
				"general",
				"white"
			},
			{
				nil,
				"gloves",
				"postmoto"
			}
		}
	}
	self.items.in32_glovepack_goldnet = {
		desc_id = "menu_infamy_gloves_desc",
		name_id = "menu_in32_glovepack_goldnet",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"gloves",
				"goldnet"
			}
		}
	}

	table.list_append(infamy_color_and_stinger_packs, {
		{
			item_id = "in32_weapon_color_stinger_01",
			join_stinger = 27,
			weapon_color = "color_in32_01"
		},
		{
			item_id = "in32_weapon_color_stinger_02",
			join_stinger = 28,
			weapon_color = "color_in32_02"
		},
		{
			item_id = "in32_weapon_color_stinger_03",
			join_stinger = 29,
			weapon_color = "color_in32_03"
		},
		{
			item_id = "in32_weapon_color_stinger_04",
			join_stinger = 30,
			weapon_color = "color_in32_04"
		},
		{
			item_id = "in32_weapon_color_stinger_05",
			join_stinger = 31,
			weapon_color = "color_in32_05"
		},
		{
			item_id = "in32_weapon_color_stinger_06",
			join_stinger = 32,
			weapon_color = "color_in32_06"
		},
		{
			item_id = "in32_weapon_color_stinger_07",
			join_stinger = 33,
			weapon_color = "color_in32_07"
		},
		{
			item_id = "in32_weapon_color_stinger_08",
			join_stinger = 34,
			weapon_color = "color_in32_08"
		},
		{
			item_id = "in32_weapon_color_stinger_09",
			join_stinger = 35,
			weapon_color = "color_in32_09"
		}
	})

	local generic_infamy_weapon_color_and_stinger_item = {
		desc_id = "menu_infamy_color_stinger_desc",
		name_id = "menu_infamy_color_stinger_name",
		desc_params = {},
		desc_param_ids = {},
		icon_xy = {
			2,
			3
		},
		cost = self.cost.tier1,
		upgrades = {
			join_stingers = {}
		}
	}

	for index, data in ipairs(infamy_color_and_stinger_packs) do
		local item_id = data.item_id
		local color_id = data.weapon_color
		local join_stinger = data.join_stinger
		local join_stinger_id = string.format("infamy_stinger_%03d", data.join_stinger)

		self.items[item_id] = deep_clone(generic_infamy_weapon_color_and_stinger_item)
		self.items[item_id].desc_param_ids.weapon_color = "bm_wskn_" .. color_id
		self.items[item_id].desc_param_ids.join_stinger = "menu_" .. join_stinger_id .. "_name"

		table.insert(self.items[item_id].upgrades, {
			nil,
			"weapon_skins",
			color_id
		})
		table.insert(self.items[item_id].upgrades.join_stingers, join_stinger)
	end

	self.items.infamy_stinger_009.upgrades = self.items.infamy_stinger_009.upgrades or {}
	self.items.infamy_stinger_013.upgrades = self.items.infamy_stinger_013.upgrades or {}
	self.items.infamy_stinger_017.upgrades = self.items.infamy_stinger_017.upgrades or {}

	table.insert(self.items.infamy_stinger_009.upgrades, {
		nil,
		"weapon_mods",
		"wpn_fps_upg_charm_musket"
	})
	table.insert(self.items.infamy_stinger_013.upgrades, {
		nil,
		"weapon_mods",
		"wpn_fps_upg_charm_toast"
	})
	table.insert(self.items.infamy_stinger_017.upgrades, {
		nil,
		"weapon_mods",
		"wpn_fps_upg_charm_pyramid"
	})

	self.items.infamy_stinger_009.name_id = "menu_in33_name_stinger_009_charm_musket"
	self.items.infamy_stinger_013.name_id = "menu_in33_name_stinger_013_charm_toast"
	self.items.infamy_stinger_017.name_id = "menu_in33_name_stinger_017_charm_pyramid"
	self.items.infamy_stinger_009.desc_id = "menu_in33_desc_stinger_009_charm_musket"
	self.items.infamy_stinger_013.desc_id = "menu_in33_desc_stinger_013_charm_toast"
	self.items.infamy_stinger_017.desc_id = "menu_in33_desc_stinger_017_charm_pyramid"
	self.items.infamy_color_inf_04.upgrades = self.items.infamy_color_inf_04.upgrades or {}
	self.items.infamy_color_inf_08.upgrades = self.items.infamy_color_inf_08.upgrades or {}
	self.items.infamy_color_inf_12.upgrades = self.items.infamy_color_inf_12.upgrades or {}
	self.items.infamy_color_inf_16.upgrades = self.items.infamy_color_inf_16.upgrades or {}

	table.insert(self.items.infamy_color_inf_04.upgrades, {
		nil,
		"weapon_skins",
		"color_in33_01"
	})
	table.insert(self.items.infamy_color_inf_08.upgrades, {
		nil,
		"weapon_skins",
		"color_in33_02"
	})
	table.insert(self.items.infamy_color_inf_12.upgrades, {
		nil,
		"weapon_skins",
		"color_in33_03"
	})
	table.insert(self.items.infamy_color_inf_16.upgrades, {
		nil,
		"weapon_skins",
		"color_in33_04"
	})

	self.items.infamy_color_inf_04.name_id = "menu_in33_name_color_inf_04_in33_01"
	self.items.infamy_color_inf_08.name_id = "menu_in33_name_color_inf_08_in33_02"
	self.items.infamy_color_inf_12.name_id = "menu_in33_name_color_inf_12_in33_03"
	self.items.infamy_color_inf_16.name_id = "menu_in33_name_color_inf_16_in33_04"
	self.items.infamy_color_inf_04.desc_id = "menu_in33_desc_weapon_color_multiple"
	self.items.infamy_color_inf_08.desc_id = "menu_in33_desc_weapon_color_multiple"
	self.items.infamy_color_inf_12.desc_id = "menu_in33_desc_weapon_color_multiple"
	self.items.infamy_color_inf_16.desc_id = "menu_in33_desc_weapon_color_multiple"
	self.items.in32_suitpack_general_default_blue.desc_id = "menu_in33_desc_suitpack_general_default_blue"
	self.items.in32_suitglovepack_general_postmoto.desc_id = "menu_in33_desc_suitglovepack_general_postmoto"
	self.items.in33_one_hundred = {
		desc_id = "menu_in33_one_hundred_desc",
		name_id = "menu_in33_one_hundred",
		cost = self.cost.tier1,
		upgrades = {
			{
				nil,
				"weapon_mods",
				"wpn_fps_upg_charm_diamond"
			},
			{
				nil,
				"weapon_skins",
				"color_in33_05"
			},
			{
				nil,
				"masks",
				"overkillpunk"
			},
			{
				nil,
				"gloves",
				"overkillpunk"
			},
			{
				nil,
				"player_styles",
				"overkillpunk"
			}
		}
	}
	self.items.infamy_secret_9 = {
		icon_xy = {
			1,
			1
		}
	}
	self.items.infamy_secret_8 = {
		icon_xy = {
			2,
			1
		}
	}
	self.items.infamy_secret_7 = {
		icon_xy = {
			3,
			1
		}
	}
	self.items.infamy_secret_6 = {
		icon_xy = {
			0,
			2
		}
	}
	self.items.infamy_secret_5 = {
		icon_xy = {
			1,
			2
		}
	}
	self.items.infamy_secret_4 = {
		icon_xy = {
			2,
			2
		}
	}
	self.items.infamy_secret_3 = {
		icon_xy = {
			3,
			2
		}
	}
	self.items.infamy_secret_2 = {
		icon_xy = {
			0,
			3
		}
	}
	self.items.infamy_secret_1 = {
		icon_xy = {
			1,
			3
		}
	}
end

function InfamyTweakData:get_infamy_item_rank_requirement(infamy_item)
	for rank, item in pairs(self.tree) do
		if item == infamy_item then
			return rank
		end
	end

	return nil
end
