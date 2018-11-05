AchievementsTweakData = AchievementsTweakData or class()

function AchievementsTweakData:init(tweak_data)
	local normal_and_above = {
		"normal",
		"hard",
		"overkill",
		"overkill_145",
		"easy_wish",
		"overkill_290",
		"sm_wish"
	}
	local hard_and_above = {
		"hard",
		"overkill",
		"overkill_145",
		"easy_wish",
		"overkill_290",
		"sm_wish"
	}
	local veryhard_and_above = {
		"overkill",
		"overkill_145",
		"easy_wish",
		"overkill_290",
		"sm_wish"
	}
	local overkill_and_above = {
		"overkill_145",
		"easy_wish",
		"overkill_290",
		"sm_wish"
	}
	local easywish_and_above = {
		"easy_wish",
		"overkill_290",
		"sm_wish"
	}
	local deathwish_and_above = {
		"overkill_290",
		"sm_wish"
	}
	local sm_wish_and_above = {"sm_wish"}
	self.im_a_healer_tank_damage_dealer = 10
	self.iron_man = "level_7"
	self.going_places = 1000000
	self.spend_money_to_make_money = 1000000
	self.fully_loaded = 9
	self.weapon_collector = 18
	self.arms_dealer = 72
	self.how_do_you_like_me_now = "level_1"
	self.like_an_angry_bear = "bear"
	self.merry_christmas = "santa_happy"
	self.witch_doctor = {
		stat = "halloween_4_stats",
		mask = "witch"
	}
	self.its_alive_its_alive = {
		stat = "halloween_5_stats",
		mask = "frank"
	}
	self.pump_action = {
		stat = "halloween_6_stats",
		mask = "pumpkin_king"
	}
	self.cant_hear_you_scream = {
		stat = "halloween_7_stats",
		mask = "venomorph"
	}
	self.unique_selling_point = "usp"
	self.relation_with_bulldozer = {
		stat = "armored_8_stat",
		mask = "clinton"
	}
	self.no_we_cant = {
		stat = "armored_10_stat",
		mask = "obama"
	}
	self.heat_around_the_corner = "heat"
	self.fire_in_the_hole = {
		stat = "gage_9_stats",
		grenade = {
			"frag",
			"frag_com",
			"concussion",
			"dada_com"
		}
	}
	self.level_achievements = {
		you_gotta_start_somewhere = {
			award = "you_gotta_start_somewhere",
			level = 5
		},
		guilty_of_crime = {
			award = "guilty_of_crime",
			level = 10
		},
		gone_in_30_seconds = {
			award = "gone_in_30_seconds",
			level = 25
		},
		armed_and_dangerous = {
			award = "armed_and_dangerous",
			level = 50
		},
		big_shot = {
			award = "big_shot",
			level = 75
		},
		most_wanted = {
			award = "most_wanted",
			level = 100
		},
		story_basics_lvl10 = {
			story = "story_basics_lvl10",
			level = 10
		},
		story_chill_level = {
			story = "story_chill_level",
			level = 25
		},
		story_half_lvl = {
			story = "story_half_lvl",
			level = 50
		}
	}
	self.tango_4 = {
		award = "tango_achieve_4",
		count = 10,
		difficulty = overkill_and_above
	}
	self.infamous = {
		"ignominy_1",
		"ignominy_2",
		"ignominy_3",
		"ignominy_4",
		"ignominy_5",
		"ignominy_6",
		"ignominy_7",
		"ignominy_8",
		"ignominy_9",
		"ignominy_10",
		"ignominy_11",
		"ignominy_12",
		"ignominy_13",
		"ignominy_14",
		"ignominy_15",
		"ignominy_16",
		"ignominy_17",
		"ignominy_18",
		"ignominy_19",
		"ignominy_20",
		"ignominy_21",
		"ignominy_22",
		"ignominy_23",
		"ignominy_24",
		"ignominy_25"
	}
	self.final_rule = {
		heist = "nightclub",
		stat = "gage2_3_stats",
		melee_type = "fists"
	}
	self.easy_as_breathing = {
		award = "gage2_4",
		weapon_type = "lmg",
		count = 10
	}
	self.first_blood = {
		award = "gage2_5",
		count = 220,
		weapon_type = "lmg"
	}
	self.in_town_you_are_law = {
		award = "gage2_6",
		weapon_type = "shotgun"
	}
	self.dont_push_it = {
		award = "gage2_7",
		weapon = "deagle"
	}
	self.finally = {award = "gage2_8"}
	self.demise_knuckles = "brass_knuckles"
	self.vote_for_change = "g22c"
	self.steam_500k = "akm_gold"
	self.shotgun_one_o_one = {
		award = "gage4_5",
		count = 50,
		accuracy = 101
	}
	self.close_and_personal = {
		kill_type = "melee",
		count = 50,
		award = "gage4_3"
	}
	self.cavity = {
		award = "bulldog_4",
		melee_type = "toothbrush"
	}
	self.double_trouble = {
		award = "ovk_9",
		converted_cops = 4,
		difficulty = overkill_and_above
	}
	self.never_let_you_go = {
		weapon_id = "m134",
		timer = 25,
		award = "ovk_3"
	}
	self.nothing_to_see_here = {
		timer = 90,
		award = "slakt_2",
		total_value = 4
	}
	self.drive_away = "fort_2"
	self.disco_inferno = "grill_1"
	self.overgrill = "grill_4"
	self.pickup_sticks = {
		weapon_category = "bow",
		stat = "scorpion_1_stats"
	}
	self.pincushion = {
		award = "scorpion_3",
		weapon_category = "bow",
		enemy = "tank",
		count = 10
	}
	self.jordan_1 = "brooklyn_1"
	self.jordan_2 = {
		award = "brooklyn_2",
		timer = 30,
		count = 100
	}
	self.one_man_army = {
		award = "gage5_3",
		equipped = {
			secondary = "serbu",
			primary = "gre_m79",
			armor = "level_7"
		}
	}
	self.man_5 = {
		weapon_category = "grenade_launcher",
		award = "man_5",
		job = "man",
		difficulty = overkill_and_above
	}
	self.mad_5 = "mad_5"
	self.peta_4 = {
		carry_id = "goat",
		award = "peta_4",
		count = 1
	}
	self.weapons_owned = {
		gage4_2 = {
			"huntsman",
			"r870",
			"saiga",
			"ksg",
			"striker",
			"serbu",
			"benelli"
		},
		gage5_4 = {
			"gre_m79",
			"g3",
			"galil",
			"famas"
		}
	}
	self.gage_assignments = {
		green_mantis = "gmod_1_stats",
		yellow_bull = "gmod_2_stats",
		red_spider = "gmod_3_stats",
		blue_eagle = "gmod_4_stats",
		purple_snake = "gmod_5_stats"
	}
	self.gonna_find_them_all = 1
	self.weapon_blueprints = {
		gmod_7 = {
			"wpn_fps_upg_fg_jp",
			"wpn_fps_upg_m4_m_quad",
			"wpn_fps_upg_ass_ns_jprifles"
		},
		gmod_8 = {
			"wpn_fps_upg_o_rmr",
			"wpn_fps_upg_pis_ns_flash"
		},
		gmod_9 = {
			"wpn_fps_upg_fg_smr",
			"wpn_fps_upg_ass_ns_surefire",
			"wpn_fps_upg_o_eotech_xps",
			"wpn_fps_upg_m4_s_crane",
			"wpn_fps_upg_fl_ass_peq15"
		},
		gmod_10 = {
			"wpn_fps_upg_fg_midwest",
			"wpn_fps_upg_ak_b_draco",
			"wpn_fps_upg_ak_m_quad",
			"wpn_fps_upg_ass_ns_linear"
		},
		eagle_4 = {
			"wpn_fps_pis_c96_nozzle",
			"wpn_fps_pis_c96_sight"
		}
	}
	self.explosion_achievements = {shock_awe = {
		count = 4,
		award = "gage4_9",
		weapon_type = "shotgun"
	}}
	self.dot_achievements = {turtles_4 = {
		award = "turtles_4",
		count = 3,
		variant = "poison"
	}}
	self.grenade_achievements = {
		bada_boom = {
			kill = true,
			grenade_type = "launcher_frag",
			count = 4,
			award = "gage5_2"
		},
		artillery_barrage = {
			kill = true,
			grenade_type = "launcher_frag",
			distance = 4000,
			stat = "gage5_5_stats"
		},
		boom_shakalaka = {
			kill = true,
			flying_strike = true,
			award = "gage5_7",
			enemy = "spooc",
			grenade_type = "launcher_frag"
		},
		not_invited = {
			timer = 10,
			grenade_type = "launcher_frag_m32",
			award = "grill_3",
			kill_count = 10
		},
		threemite = {
			kill = true,
			grenade_type = "dynamite",
			count = 3,
			award = "scorpion_2"
		},
		steel_3 = {
			kill = true,
			grenade_type = "wpn_prj_jav",
			award = "steel_3",
			enemy = "spooc"
		},
		pim_2 = {
			kill = true,
			grenade_type = "wpn_prj_target",
			success = true,
			job = "dark",
			crouching = true,
			stat = "pim_2_stats",
			is_civilian = false
		},
		tango_2 = {
			kill = true,
			stat = "tango_2_stats",
			enemy = "sniper",
			grenade_type = "launcher_frag_arbiter"
		},
		any_kills = {
			kill = true,
			challenge_stat = "any_kills"
		},
		any_sniper_kills = {
			kill = true,
			enemy = "sniper",
			challenge_stat = "any_sniper_kills"
		},
		any_shield_kills = {
			kill = true,
			enemy = "shield",
			challenge_stat = "any_shield_kills"
		},
		any_taser_kills = {
			kill = true,
			enemy = "taser",
			challenge_stat = "any_taser_kills"
		},
		any_tank_kills = {
			kill = true,
			enemy = "tank",
			challenge_stat = "any_tank_kills"
		},
		any_spooc_kills = {
			kill = true,
			enemy = "spooc",
			challenge_stat = "any_spooc_kills"
		},
		trophy_special_kills = {
			kill = true,
			trophy_stat = "trophy_special_kills",
			enemies = {
				"sniper",
				"shield",
				"taser",
				"tank",
				"spooc",
				"medic"
			}
		},
		trophy_ace = {
			kill = true,
			trophy_stat = "trophy_ace",
			grenade_type = "wpn_prj_ace",
			difficulties = overkill_and_above
		},
		trophy_washington = {
			kill = true,
			trophy_stat = "trophy_washington"
		},
		trophy_medic = {
			kill = true,
			trophy_stat = "trophy_medic",
			enemies = {"medic"}
		},
		daily_grenades = {
			kill = true,
			trophy_stat = "daily_grenades",
			grenade_type = "frag",
			is_civilian = false
		},
		daily_grenades_community = {
			kill = true,
			trophy_stat = "daily_grenades",
			grenade_type = "frag_com",
			is_civilian = false
		},
		daily_grenades_dynamite = {
			kill = true,
			trophy_stat = "daily_grenades",
			grenade_type = "dynamite",
			is_civilian = false
		},
		daily_grenades_dada = {
			kill = true,
			trophy_stat = "daily_grenades",
			grenade_type = "dada_com",
			is_civilian = false
		}
	}
	self.shotgun_single_shot_kills = {tango_1 = {
		award = "tango_achieve_1",
		count = 3,
		is_not_civilian = true,
		headshot = true,
		blueprint = {"wpn_fps_upg_ns_duck"}
	}}
	self.enemy_kill_achievements = {
		try_out_your_usp = {
			weapon = "usp",
			stat = "halloween_8_stats"
		},
		license_to_kill = {
			weapon = "ppk",
			stat = "armored_5_stat"
		},
		im_not_a_crook = {
			weapon = "s552",
			stat = "armored_7_stat",
			enemy = "sniper",
			mask = "nixon"
		},
		fool_me_once = {
			weapon = "m45",
			stat = "armored_9_stat",
			enemy = "shield",
			mask = "bush"
		},
		wanted = {
			weapon = "ak5",
			stat = "gage_1_stats",
			mask = "goat"
		},
		three_thousand_miles = {
			weapon = "p90",
			stat = "gage_2_stats",
			mask = "panda"
		},
		commando = {
			weapon = "aug",
			stat = "gage_3_stats",
			mask = "pitbull"
		},
		public_enemies = {
			weapon = "colt_1911",
			stat = "gage_4_stats",
			mask = "eagle"
		},
		inception = {
			weapon = "scar",
			stat = "gage_5_stats"
		},
		hard_corps = {
			weapon = "mp7",
			stat = "gage_6_stats"
		},
		above_the_law = {
			weapon = "p226",
			stat = "gage_7_stats"
		},
		surprise_motherfucker = {
			weapon = "m95",
			stat = "gage3_12_stats",
			enemy = "tank"
		},
		man_with_golden_gun = {
			weapon = "akm_gold",
			stat = "gage3_2_stats",
			enemy = "tank",
			enemy_weapon = "m249"
		},
		lord_of_flies = {
			in_head = true,
			stat = "gage3_3_stats",
			weapon_type = "snp"
		},
		arachnes_curse = {
			in_head = true,
			stat = "gage3_4_stats",
			weapon_type = "snp"
		},
		pest_control = {
			in_head = true,
			stat = "gage3_5_stats",
			weapon_type = "snp"
		},
		seer_of_death = {
			in_head = true,
			stat = "gage3_6_stats",
			weapon_type = "snp"
		},
		far_far_away = {
			weapon = "m95",
			stat = "gage3_7_stats",
			distance = 4000
		},
		last_action_villian = {
			in_head = true,
			weapon = "r93",
			award = "gage3_8",
			on_zipline = true
		},
		dodge_this = {
			in_head = true,
			stat = "gage3_11_stats",
			enemy = "spooc",
			weapon = "m95"
		},
		didnt_see_this_coming = {
			stat = "gage3_13_stats",
			weapon_type = "snp",
			on_zipline = true
		},
		grand_master_sniper = {
			weapon = "msr",
			stat = "gage3_14_stats",
			enemy = "sniper"
		},
		public_enemy_no_one = {
			weapon = "msr",
			stat = "gage3_17_stats"
		},
		knock_knock = {
			weapon_type = "shotgun",
			stat = "gage4_6_stats",
			enemy = "shield",
			part_id = "wpn_fps_upg_a_slug"
		},
		peek_a_boo = {
			weapon_type = "shotgun",
			stat = "gage4_8_stats",
			enemy = "sniper",
			part_id = "wpn_fps_upg_a_piercing"
		},
		seven_eleven = {
			count = 7,
			timer = 11,
			award = "gage4_4",
			in_head = true,
			weapon_type = "shotgun"
		},
		bang_for_buck = {
			weapon_type = "shotgun",
			stat = "gage4_10_stats",
			enemy = "tank",
			parts = {
				"wpn_fps_upg_a_custom",
				"wpn_fps_upg_a_custom_free"
			}
		},
		grind_fest = {
			weapon = "g3",
			stat = "gage5_1_stats",
			enemy = "tank"
		},
		kill_streak = {
			weapon = "galil",
			stat = "gage5_9_stats",
			enemy = "spooc"
		},
		le_picnic = {
			weapon = "famas",
			stat = "gage5_10_stats"
		},
		repel_from_rope = {
			weapon = "mosin",
			stat = "eagle_1_stats",
			on_rope = true
		},
		bullet_hell = {
			weapon = "mg42",
			timer = 10,
			award = "eagle_5",
			count = 10
		},
		akm4_shootout = {
			is_cop = true,
			stat = "ameno_08_stats",
			weapons = {
				"ak74",
				"akm",
				"akm_gold",
				"saiga",
				"rpk",
				"amcar",
				"new_m4",
				"m16",
				"akmsu",
				"olympic",
				"flint"
			}
		},
		scorpion_4 = {
			in_steelsight = false,
			timer = 6,
			award = "scorpion_4",
			weapon = "peacemaker",
			count = 6
		},
		turtles_1 = {
			weapon = "wa2000",
			award = "turtles_1",
			count_no_reload = 11
		},
		turtles_2 = {
			weapon = "polymer",
			kill_count = 100,
			award = "turtles_2"
		},
		berry_5 = {
			in_steelsight = false,
			count_in_row = 10,
			award = "berry_5",
			weapon = "model70",
			in_head = true
		},
		assault_rifle_kills = {
			weapon_type = "assault_rifle",
			challenge_stat = "assault_rifle_kills"
		},
		shotgun_kills = {
			weapon_type = "shotgun",
			challenge_stat = "shotgun_kills"
		},
		smg_kills = {
			weapon_type = "smg",
			challenge_stat = "smg_kills"
		},
		pistol_kills = {
			weapon_type = "pistol",
			challenge_stat = "pistol_kills"
		},
		any_kills = {challenge_stat = "any_kills"},
		any_headshot_kills = {
			in_head = true,
			challenge_stat = "any_headshot_kills"
		},
		any_sniper_kills = {
			enemy = "sniper",
			challenge_stat = "any_sniper_kills"
		},
		any_shield_kills = {
			enemy = "shield",
			challenge_stat = "any_shield_kills"
		},
		any_taser_kills = {
			enemy = "taser",
			challenge_stat = "any_taser_kills"
		},
		any_tank_kills = {
			enemy = "tank",
			challenge_stat = "any_tank_kills"
		},
		any_spooc_kills = {
			enemy = "spooc",
			challenge_stat = "any_spooc_kills"
		},
		trophy_headshots = {
			in_head = true,
			trophy_stat = "trophy_headshots"
		},
		trophy_washington = {trophy_stat = "trophy_washington"},
		trophy_smg = {
			timer = 25,
			trophy_stat = "trophy_smg",
			weapon_type = "smg",
			count = 25
		},
		trophy_special_kills = {
			trophy_stat = "trophy_special_kills",
			enemies = {
				"sniper",
				"shield",
				"taser",
				"tank",
				"spooc",
				"medic"
			}
		},
		trophy_medic = {
			trophy_stat = "trophy_medic",
			enemies = {"medic"}
		},
		pim_1 = {
			weapon = "desertfox",
			stat = "pim_1_stats",
			difficulty = overkill_and_above,
			enemies = {"sniper"}
		},
		pim_3 = {
			weapon = "schakal",
			level_id = "mad",
			stat = "pim_3_stats",
			difficulty = overkill_and_above,
			enemies = {
				"sniper",
				"shield",
				"taser",
				"tank",
				"spooc",
				"medic"
			}
		},
		grv_2 = {
			weapon = "coal",
			award = "grv_2",
			count_no_reload = 32
		},
		grv_3 = {
			stat = "grv_3_stats",
			weapons = {
				"siltstone",
				"flint",
				"coal"
			}
		},
		aru_2 = {
			stat = "aru_2",
			weapons = {"breech"}
		},
		aru_3 = {
			stat = "aru_3",
			weapons = {"erma"}
		},
		aru_4 = {
			stat = "aru_4",
			weapons = {"ching"}
		}
	}
	self.enemy_melee_kill_achievements = {
		cloak_n_dagger = {
			award = "gage2_2",
			melee_type = "knife",
			enemy = "spooc"
		},
		are_you_kidding_me = {
			award = "gage2_10",
			melee_type = "knife",
			enemy = "tank"
		},
		no_time_to_bleed = {
			health = 25,
			stat = "gage2_9_stats",
			melee_type = "knife",
			enemies = {
				"fbi_swat",
				"fbi_heavy_swat"
			},
			difficulty = overkill_and_above
		},
		police_brutality = {
			award = "gage4_1",
			melee_id = "baton",
			enemy = "shield"
		},
		every_day_shovelin = {
			melee_id = "shovel",
			stat = "gage4_7_stats",
			is_cop = true,
			level_id = "nightclub"
		},
		cant_touch_this = {
			melee_id = "dingdong",
			stat = "gage5_8_stats",
			is_gangster = true
		},
		hurting_people = {
			melee_id = "baseballbat",
			stat = "pig_3_stats",
			enemies = {
				"mobster",
				"mobster_boss",
				"biker_boss"
			},
			jobs = {"mia"}
		},
		special_operations = {
			melee_id = "fairbair",
			stat = "eagle_2_stats",
			is_not_civilian = true,
			is_stealth = true
		},
		knockout = {
			award = "gorilla_1",
			melee_id = "boxing_gloves",
			enemy = "tank"
		},
		stick_a_fork_in_me = {
			is_on_fire = true,
			melee_id = "fork",
			award = "grill_2",
			is_not_civilian = true
		},
		steel_2 = {
			award = "steel_2",
			melee_weapons = {
				"morning",
				"buck",
				"beardy",
				"great"
			},
			enemy_kills = {
				enemy = "shield",
				count = 10
			}
		},
		steel_4 = {
			enemy = "tank",
			melee_id = "great",
			award = "steel_4",
			enemy_weapon = "saiga"
		},
		melee_kills = {
			is_not_civilian = true,
			challenge_stat = "melee_kills"
		},
		any_kills = {
			is_not_civilian = true,
			challenge_stat = "any_kills"
		},
		any_sniper_kills = {
			is_not_civilian = true,
			enemy = "sniper",
			challenge_stat = "any_sniper_kills"
		},
		any_shield_kills = {
			is_not_civilian = true,
			enemy = "shield",
			challenge_stat = "any_shield_kills"
		},
		any_taser_kills = {
			is_not_civilian = true,
			enemy = "taser",
			challenge_stat = "any_taser_kills"
		},
		any_tank_kills = {
			is_not_civilian = true,
			enemy = "tank",
			challenge_stat = "any_tank_kills"
		},
		any_spooc_kills = {
			is_not_civilian = true,
			enemy = "spooc",
			challenge_stat = "any_spooc_kills"
		},
		trophy_knockouts = {
			melee_id = "boxing_gloves",
			trophy_stat = "trophy_knockouts",
			is_not_civilian = true,
			enemies = {
				"tank",
				"tank_hw"
			}
		},
		trophy_washington = {
			is_not_civilian = true,
			trophy_stat = "trophy_washington"
		},
		trophy_medic = {
			is_not_civilian = true,
			trophy_stat = "trophy_medic",
			enemy = "medic"
		},
		trophy_special_kills = {
			is_not_civilian = true,
			trophy_stat = "trophy_special_kills",
			enemies = {
				"sniper",
				"shield",
				"taser",
				"tank",
				"spooc",
				"medic"
			}
		},
		daily_hangover = {
			melee_id = "whiskey",
			trophy_stat = "daily_hangover",
			is_not_civilian = true
		},
		raid_aru_1 = {
			melee_id = "push",
			stat = "aru_1",
			is_not_civilian = true
		}
	}
	self.complete_heist_achievements = {
		in_soviet_russia = {
			contract = "vlad",
			stat = "halloween_10_stats",
			mask = "bear",
			difficulty = overkill_and_above
		},
		i_take_scores = {
			stat = "armored_4_stat",
			mask = "heat",
			difficulty = overkill_and_above,
			jobs = {
				"arm_cro",
				"arm_und",
				"arm_hcm",
				"arm_par",
				"arm_fac"
			}
		},
		eco_round = {
			award = "charliesierra_7",
			no_shots = "primaries",
			job = "roberts",
			difficulty = overkill_and_above
		},
		stealth_election_day = {
			stealth = true,
			award = "bob_3",
			job = "election_day"
		},
		death_stealth_election_day = {
			award = "bob_7",
			stealth = true,
			job = "election_day",
			difficulty = deathwish_and_above
		},
		easywish_ukranian = {
			award = "pick_1",
			job = "ukrainian_job_prof",
			difficulty = easywish_and_above
		},
		easywish_mallcrasher = {
			award = "pick_2",
			job = "mallcrasher",
			difficulty = easywish_and_above
		},
		easywish_four_stores = {
			award = "pick_3",
			job = "four_stores",
			difficulty = easywish_and_above
		},
		easywish_nightclub = {
			award = "pick_4",
			job = "nightclub",
			difficulty = easywish_and_above
		},
		easywish_watchdogs = {
			award = "pick_5",
			difficulty = easywish_and_above,
			jobs = {
				"watchdogs_wrapper",
				"watchdogs_night",
				"watchdogs"
			}
		},
		easywish_rats = {
			award = "pick_7",
			job = "alex",
			difficulty = easywish_and_above
		},
		easywish_firestarter = {
			award = "pick_9",
			job = "firestarter",
			difficulty = easywish_and_above
		},
		easywish_framing_frame = {
			award = "pick_11",
			job = "framing_frame",
			difficulty = easywish_and_above
		},
		easywish_big_oil = {
			award = "pick_13",
			difficulty = easywish_and_above,
			jobs = {
				"welcome_to_the_jungle_wrapper_prof",
				"welcome_to_the_jungle_night_prof",
				"welcome_to_the_jungle_prof"
			}
		},
		easywish_jewelry_store = {
			award = "pick_14",
			job = "jewelry_store",
			difficulty = easywish_and_above
		},
		easywish_diamond_store = {
			award = "pick_15",
			job = "family",
			difficulty = easywish_and_above
		},
		easywish_go_bank = {
			award = "pick_16",
			job = "roberts",
			difficulty = easywish_and_above
		},
		easywish_bank_heist = {
			award = "pick_17",
			job = "branchbank_prof",
			difficulty = easywish_and_above
		},
		easywish_bank_heist_gold = {
			award = "pick_18",
			job = "branchbank_gold_prof",
			difficulty = easywish_and_above
		},
		easywish_bank_heist_cash = {
			award = "pick_19",
			job = "branchbank_cash",
			difficulty = easywish_and_above
		},
		easywish_bank_heist_deposit = {
			award = "pick_20",
			job = "branchbank_deposit",
			difficulty = easywish_and_above
		},
		easywish_transport_crossroads = {
			award = "pick_21",
			job = "arm_cro",
			difficulty = easywish_and_above
		},
		easywish_transport_downtown = {
			award = "pick_22",
			job = "arm_hcm",
			difficulty = easywish_and_above
		},
		easywish_transport_harbor = {
			award = "pick_23",
			job = "arm_fac",
			difficulty = easywish_and_above
		},
		easywish_transport_park = {
			award = "pick_24",
			job = "arm_par",
			difficulty = easywish_and_above
		},
		easywish_transport_underpass = {
			award = "pick_25",
			job = "arm_und",
			difficulty = easywish_and_above
		},
		easywish_transport_train = {
			award = "pick_26",
			job = "arm_for",
			difficulty = easywish_and_above
		},
		easywish_election_day = {
			award = "pick_27",
			job = "election_day",
			difficulty = easywish_and_above
		},
		easywish_kosugi = {
			award = "pick_29",
			job = "kosugi",
			difficulty = easywish_and_above
		},
		easywish_bigbank = {
			award = "pick_30",
			job = "big",
			difficulty = easywish_and_above
		},
		easywish_miami = {
			award = "pick_31",
			job = "mia",
			difficulty = easywish_and_above
		},
		easywish_artgallery = {
			award = "pick_33",
			job = "gallery",
			difficulty = easywish_and_above
		},
		easywish_hoxton = {
			award = "pick_34",
			job = "hox",
			difficulty = easywish_and_above
		},
		easywish_mus = {
			award = "pick_36",
			job = "mus",
			difficulty = easywish_and_above
		},
		easywish_red = {
			award = "pick_37",
			job = "red2",
			difficulty = easywish_and_above
		},
		easywish_dinner = {
			award = "pick_38",
			job = "dinner",
			difficulty = easywish_and_above
		},
		easywish_hox_3 = {
			award = "pick_39",
			job = "hox_3",
			difficulty = easywish_and_above
		},
		easywish_rat = {
			award = "pick_40",
			job = "rat",
			difficulty = easywish_and_above
		},
		easywish_cage = {
			award = "pick_41",
			job = "cage",
			difficulty = easywish_and_above
		},
		easywish_shoutout = {
			award = "pick_42",
			job = "shoutout_raid",
			difficulty = easywish_and_above
		},
		easywish_arena = {
			award = "pick_43",
			job = "arena",
			difficulty = easywish_and_above
		},
		easywish_kenaz = {
			award = "pick_44",
			difficulty = easywish_and_above,
			jobs = {"kenaz"}
		},
		easywish_sinus = {
			award = "pick_45",
			job = "jolly",
			difficulty = easywish_and_above
		},
		easywish_nails = {
			award = "pick_46",
			job = "nail",
			difficulty = easywish_and_above
		},
		easywish_berry = {
			award = "pick_47",
			job = "pbr",
			difficulty = easywish_and_above
		},
		easywish_jerry = {
			award = "pick_48",
			job = "pbr2",
			difficulty = easywish_and_above
		},
		easywish_peta = {
			award = "pick_49",
			difficulty = easywish_and_above,
			jobs = {"peta"}
		},
		easywish_pal = {
			award = "pick_51",
			job = "pal",
			difficulty = easywish_and_above
		},
		easywish_man = {
			award = "pick_52",
			job = "man",
			difficulty = easywish_and_above
		},
		easywish_dark = {
			award = "pick_53",
			job = "dark",
			difficulty = easywish_and_above
		},
		easywish_cane = {
			award = "pick_54",
			job = "cane",
			difficulty = easywish_and_above
		},
		easywish_flat = {
			award = "pick_55",
			job = "flat",
			difficulty = easywish_and_above
		},
		easywish_mad = {
			award = "pick_56",
			job = "mad",
			difficulty = easywish_and_above
		},
		easywish_born = {
			award = "pick_57",
			job = "born",
			difficulty = easywish_and_above
		},
		easywish_help = {
			award = "orange_1",
			job = "help",
			difficulty = easywish_and_above
		},
		easywish_moon = {
			award = "moon_1",
			job = "moon",
			difficulty = easywish_and_above
		},
		easywish_friend = {
			award = "friend_1",
			job = "friend",
			difficulty = easywish_and_above
		},
		easywish_spa = {
			award = "spa_1",
			job = "spa",
			difficulty = easywish_and_above
		},
		easywish_fish = {
			award = "fish_1",
			job = "fish",
			difficulty = easywish_and_above
		},
		easywish_glace = {
			award = "glace_5",
			job = "glace",
			difficulty = easywish_and_above
		},
		easywish_run = {
			award = "run_5",
			job = "run",
			difficulty = easywish_and_above
		},
		complete_pines_easywish = {
			award = "pick_59",
			difficulty = easywish_and_above,
			jobs = {"pines"}
		},
		complete_crojob_dock_easywish = {
			award = "pick_61",
			difficulty = easywish_and_above,
			jobs = {"crojob1"}
		},
		complete_crojob_for_easywish = {
			award = "pick_60",
			difficulty = easywish_and_above,
			jobs = {
				"crojob_wrapper",
				"crojob2",
				"crojob2_night"
			}
		},
		death_ukranian = {
			award = "death_1",
			job = "ukrainian_job_prof",
			difficulty = deathwish_and_above
		},
		death_mallcrasher = {
			award = "death_2",
			job = "mallcrasher",
			difficulty = deathwish_and_above
		},
		death_four_stores = {
			award = "death_3",
			job = "four_stores",
			difficulty = deathwish_and_above
		},
		death_nightclub = {
			award = "death_4",
			job = "nightclub",
			difficulty = deathwish_and_above
		},
		death_watchdogs = {
			award = "death_34",
			difficulty = deathwish_and_above,
			jobs = {
				"watchdogs_wrapper",
				"watchdogs_night",
				"watchdogs"
			}
		},
		death_rats = {
			award = "death_33",
			job = "alex",
			difficulty = deathwish_and_above
		},
		death_firestarter = {
			award = "death_32",
			job = "firestarter",
			difficulty = deathwish_and_above
		},
		death_framing_frame = {
			award = "death_35",
			job = "framing_frame",
			difficulty = deathwish_and_above
		},
		death_big_oil = {
			award = "death_11",
			difficulty = deathwish_and_above,
			jobs = {
				"welcome_to_the_jungle_wrapper_prof",
				"welcome_to_the_jungle_night_prof",
				"welcome_to_the_jungle_prof"
			}
		},
		death_jewelry_store = {
			award = "death_13",
			job = "jewelry_store",
			difficulty = deathwish_and_above
		},
		death_diamond_store = {
			award = "death_14",
			job = "family",
			difficulty = deathwish_and_above
		},
		death_go_bank = {
			award = "death_15",
			job = "roberts",
			difficulty = deathwish_and_above
		},
		death_bank_heist = {
			award = "death_16",
			job = "branchbank_prof",
			difficulty = deathwish_and_above
		},
		death_bank_heist_gold = {
			award = "death_17",
			job = "branchbank_gold_prof",
			difficulty = deathwish_and_above
		},
		death_bank_heist_cash = {
			award = "death_18",
			job = "branchbank_cash",
			difficulty = deathwish_and_above
		},
		death_bank_heist_deposit = {
			award = "death_19",
			job = "branchbank_deposit",
			difficulty = deathwish_and_above
		},
		death_transport_crossroads = {
			award = "death_20",
			job = "arm_cro",
			difficulty = deathwish_and_above
		},
		death_transport_downtown = {
			award = "death_21",
			job = "arm_hcm",
			difficulty = deathwish_and_above
		},
		death_transport_harbor = {
			award = "death_22",
			job = "arm_fac",
			difficulty = deathwish_and_above
		},
		death_transport_park = {
			award = "death_23",
			job = "arm_par",
			difficulty = deathwish_and_above
		},
		death_transport_underpass = {
			award = "death_24",
			job = "arm_und",
			difficulty = deathwish_and_above
		},
		death_transport_train = {
			award = "death_25",
			job = "arm_for",
			difficulty = deathwish_and_above
		},
		death_election_day = {
			award = "bob_9",
			job = "election_day",
			difficulty = deathwish_and_above
		},
		death_kosugi = {
			award = "kosugi_6",
			job = "kosugi",
			difficulty = deathwish_and_above
		},
		death_bigbank = {
			award = "bigbank_9",
			job = "big",
			difficulty = deathwish_and_above
		},
		death_miami = {
			award = "pig_1",
			job = "mia",
			difficulty = deathwish_and_above
		},
		death_artgallery = {
			award = "squek",
			job = "gallery",
			difficulty = deathwish_and_above
		},
		death_hoxton = {
			award = "bulldog_2",
			job = "hox",
			difficulty = deathwish_and_above
		},
		death_mus = {
			award = "bat_1",
			job = "mus",
			difficulty = deathwish_and_above
		},
		death_red = {
			award = "green_5",
			job = "red2",
			difficulty = deathwish_and_above
		},
		death_dinner = {
			award = "farm_5",
			job = "dinner",
			difficulty = deathwish_and_above
		},
		death_hox_3 = {
			award = "payback_1",
			job = "hox_3",
			difficulty = deathwish_and_above
		},
		death_rat = {
			award = "djur_1",
			job = "rat",
			difficulty = deathwish_and_above
		},
		death_cage = {
			award = "fort_1",
			job = "cage",
			difficulty = deathwish_and_above
		},
		death_shoutout = {
			award = "melt_1",
			job = "shoutout_raid",
			difficulty = deathwish_and_above
		},
		death_arena = {
			award = "live_1",
			job = "arena",
			difficulty = deathwish_and_above
		},
		death_kenaz = {
			award = "kenaz_1",
			difficulty = deathwish_and_above,
			jobs = {"kenaz"}
		},
		death_sinus = {
			award = "sinus_2",
			job = "jolly",
			difficulty = deathwish_and_above
		},
		death_nails = {
			award = "lab_3",
			job = "nail",
			difficulty = deathwish_and_above
		},
		death_berry = {
			award = "berry_1",
			job = "pbr",
			difficulty = deathwish_and_above
		},
		death_jerry = {
			award = "jerry_1",
			job = "pbr2",
			difficulty = deathwish_and_above
		},
		death_peta = {
			award = "peta_1",
			difficulty = deathwish_and_above,
			jobs = {"peta"}
		},
		death_pal = {
			award = "pal_1",
			job = "pal",
			difficulty = deathwish_and_above
		},
		death_man = {
			award = "man_1",
			job = "man",
			difficulty = deathwish_and_above
		},
		death_dark = {
			award = "dark_1",
			job = "dark",
			difficulty = deathwish_and_above
		},
		death_cane = {
			award = "cane_1",
			job = "cane",
			difficulty = deathwish_and_above
		},
		death_flat = {
			award = "flat_1",
			job = "flat",
			difficulty = deathwish_and_above
		},
		death_mad = {
			award = "mad_1",
			job = "mad",
			difficulty = deathwish_and_above
		},
		death_born = {
			award = "born_1",
			job = "born",
			difficulty = deathwish_and_above
		},
		death_help = {
			award = "orange_2",
			job = "help",
			difficulty = deathwish_and_above
		},
		death_moon = {
			award = "moon_2",
			job = "moon",
			difficulty = deathwish_and_above
		},
		death_friend = {
			award = "friend_2",
			job = "friend",
			difficulty = deathwish_and_above
		},
		death_spa = {
			award = "spa_2",
			job = "spa",
			difficulty = deathwish_and_above
		},
		death_fish = {
			award = "fish_2",
			job = "fish",
			difficulty = deathwish_and_above
		},
		death_glace = {
			award = "glace_6",
			job = "glace",
			difficulty = deathwish_and_above
		},
		death_run = {
			award = "run_6",
			job = "run",
			difficulty = deathwish_and_above
		},
		complete_pines_deathwish = {
			award = "deer_5",
			difficulty = deathwish_and_above,
			jobs = {"pines"}
		},
		complete_crojob_for_deathwish = {
			award = "cow_2",
			difficulty = deathwish_and_above,
			jobs = {
				"crojob_wrapper",
				"crojob2",
				"crojob2_night"
			}
		},
		complete_crojob_dock_deathwish = {
			award = "cow_7",
			difficulty = deathwish_and_above,
			jobs = {"crojob1"}
		},
		sm_wish_ukranian = {
			award = "axe_1",
			job = "ukrainian_job_prof",
			difficulty = sm_wish_and_above
		},
		sm_wish_mallcrasher = {
			award = "axe_2",
			job = "mallcrasher",
			difficulty = sm_wish_and_above
		},
		sm_wish_four_stores = {
			award = "axe_3",
			job = "four_stores",
			difficulty = sm_wish_and_above
		},
		sm_wish_nightclub = {
			award = "axe_4",
			job = "nightclub",
			difficulty = sm_wish_and_above
		},
		sm_wish_watchdogs = {
			award = "axe_5",
			difficulty = sm_wish_and_above,
			jobs = {
				"watchdogs_wrapper",
				"watchdogs_night",
				"watchdogs"
			}
		},
		sm_wish_rats = {
			award = "axe_7",
			job = "alex",
			difficulty = sm_wish_and_above
		},
		sm_wish_firestarter = {
			award = "axe_9",
			job = "firestarter",
			difficulty = sm_wish_and_above
		},
		sm_wish_framing_frame = {
			award = "axe_11",
			job = "framing_frame",
			difficulty = sm_wish_and_above
		},
		sm_wish_big_oil = {
			award = "axe_13",
			difficulty = sm_wish_and_above,
			jobs = {
				"welcome_to_the_jungle_wrapper_prof",
				"welcome_to_the_jungle_night_prof",
				"welcome_to_the_jungle_prof"
			}
		},
		sm_wish_jewelry_store = {
			award = "axe_14",
			job = "jewelry_store",
			difficulty = sm_wish_and_above
		},
		sm_wish_diamond_store = {
			award = "axe_15",
			job = "family",
			difficulty = sm_wish_and_above
		},
		sm_wish_go_bank = {
			award = "axe_16",
			job = "roberts",
			difficulty = sm_wish_and_above
		},
		sm_wish_bank_heist = {
			award = "axe_17",
			job = "branchbank_prof",
			difficulty = sm_wish_and_above
		},
		sm_wish_bank_heist_gold = {
			award = "axe_18",
			job = "branchbank_gold_prof",
			difficulty = sm_wish_and_above
		},
		sm_wish_bank_heist_cash = {
			award = "axe_19",
			job = "branchbank_cash",
			difficulty = sm_wish_and_above
		},
		sm_wish_bank_heist_deposit = {
			award = "axe_20",
			job = "branchbank_deposit",
			difficulty = sm_wish_and_above
		},
		sm_wish_transport_crossroads = {
			award = "axe_21",
			job = "arm_cro",
			difficulty = sm_wish_and_above
		},
		sm_wish_transport_downtown = {
			award = "axe_22",
			job = "arm_hcm",
			difficulty = sm_wish_and_above
		},
		sm_wish_transport_harbor = {
			award = "axe_23",
			job = "arm_fac",
			difficulty = sm_wish_and_above
		},
		sm_wish_transport_park = {
			award = "axe_24",
			job = "arm_par",
			difficulty = sm_wish_and_above
		},
		sm_wish_transport_underpass = {
			award = "axe_25",
			job = "arm_und",
			difficulty = sm_wish_and_above
		},
		sm_wish_transport_train = {
			award = "axe_26",
			job = "arm_for",
			difficulty = sm_wish_and_above
		},
		sm_wish_election_day = {
			award = "axe_27",
			job = "election_day",
			difficulty = sm_wish_and_above
		},
		sm_wish_kosugi = {
			award = "axe_29",
			job = "kosugi",
			difficulty = sm_wish_and_above
		},
		sm_wish_bigbank = {
			award = "axe_30",
			job = "big",
			difficulty = sm_wish_and_above
		},
		sm_wish_miami = {
			award = "axe_31",
			job = "mia",
			difficulty = sm_wish_and_above
		},
		sm_wish_artgallery = {
			award = "axe_33",
			job = "gallery",
			difficulty = sm_wish_and_above
		},
		sm_wish_hoxton = {
			award = "axe_34",
			job = "hox",
			difficulty = sm_wish_and_above
		},
		sm_wish_mus = {
			award = "axe_36",
			job = "mus",
			difficulty = sm_wish_and_above
		},
		sm_wish_red = {
			award = "axe_37",
			job = "red2",
			difficulty = sm_wish_and_above
		},
		sm_wish_dinner = {
			award = "axe_38",
			job = "dinner",
			difficulty = sm_wish_and_above
		},
		sm_wish_hox_3 = {
			award = "axe_39",
			job = "hox_3",
			difficulty = sm_wish_and_above
		},
		sm_wish_rat = {
			award = "axe_40",
			job = "rat",
			difficulty = sm_wish_and_above
		},
		sm_wish_cage = {
			award = "axe_41",
			job = "cage",
			difficulty = sm_wish_and_above
		},
		sm_wish_shoutout = {
			award = "axe_42",
			job = "shoutout_raid",
			difficulty = sm_wish_and_above
		},
		sm_wish_arena = {
			award = "axe_43",
			job = "arena",
			difficulty = sm_wish_and_above
		},
		sm_wish_kenaz = {
			award = "axe_44",
			difficulty = sm_wish_and_above,
			jobs = {"kenaz"}
		},
		sm_wish_sinus = {
			award = "axe_45",
			job = "jolly",
			difficulty = sm_wish_and_above
		},
		sm_wish_nails = {
			award = "axe_46",
			job = "nail",
			difficulty = sm_wish_and_above
		},
		sm_wish_berry = {
			award = "axe_47",
			job = "pbr",
			difficulty = sm_wish_and_above
		},
		sm_wish_jerry = {
			award = "axe_48",
			job = "pbr2",
			difficulty = sm_wish_and_above
		},
		sm_wish_peta = {
			award = "axe_49",
			difficulty = sm_wish_and_above,
			jobs = {"peta"}
		},
		sm_wish_pal = {
			award = "axe_51",
			job = "pal",
			difficulty = sm_wish_and_above
		},
		sm_wish_man = {
			award = "axe_52",
			job = "man",
			difficulty = sm_wish_and_above
		},
		sm_wish_dark = {
			award = "axe_53",
			job = "dark",
			difficulty = sm_wish_and_above
		},
		sm_wish_cane = {
			award = "axe_54",
			job = "cane",
			difficulty = sm_wish_and_above
		},
		sm_wish_flat = {
			award = "axe_55",
			job = "flat",
			difficulty = sm_wish_and_above
		},
		sm_wish_mad = {
			award = "axe_56",
			job = "mad",
			difficulty = sm_wish_and_above
		},
		sm_wish_born = {
			award = "axe_57",
			job = "born",
			difficulty = sm_wish_and_above
		},
		sm_wish_help = {
			award = "orange_3",
			job = "help",
			difficulty = sm_wish_and_above
		},
		sm_wish_moon = {
			award = "moon_3",
			job = "moon",
			difficulty = sm_wish_and_above
		},
		sm_wish_friend = {
			award = "friend_3",
			job = "friend",
			difficulty = sm_wish_and_above
		},
		sm_wish_spa = {
			award = "spa_3",
			job = "spa",
			difficulty = sm_wish_and_above
		},
		sm_wish_fish = {
			award = "fish_3",
			job = "fish",
			difficulty = sm_wish_and_above
		},
		sm_wish_glace = {
			award = "glace_7",
			job = "glace",
			difficulty = sm_wish_and_above
		},
		sm_wish_run = {
			award = "run_7",
			job = "run",
			difficulty = sm_wish_and_above
		},
		complete_pines_sm_wish = {
			award = "axe_59",
			difficulty = sm_wish_and_above,
			jobs = {"pines"}
		},
		complete_crojob_for_sm_wish = {
			award = "axe_60",
			difficulty = sm_wish_and_above,
			jobs = {
				"crojob_wrapper",
				"crojob2",
				"crojob2_night"
			}
		},
		complete_crojob_dock_sm_wish = {
			award = "axe_61",
			difficulty = sm_wish_and_above,
			jobs = {"crojob1"}
		},
		complete_hoxton = {
			award = "bulldog_1",
			jobs = {"hox"}
		},
		complete_pines_normal = {
			award = "deer_1",
			difficulty = normal_and_above,
			jobs = {"pines"}
		},
		complete_pines_hard = {
			award = "deer_2",
			difficulty = hard_and_above,
			jobs = {"pines"}
		},
		complete_pines_veryhard = {
			award = "deer_3",
			difficulty = veryhard_and_above,
			jobs = {"pines"}
		},
		complete_pines_overkill = {
			award = "deer_4",
			difficulty = overkill_and_above,
			jobs = {"pines"}
		},
		complete_crojob_for_all = {
			award = "cow_1",
			difficulty = normal_and_above,
			jobs = {
				"crojob_wrapper",
				"crojob2",
				"crojob2_night"
			}
		},
		complete_crojob_dock_all = {
			award = "cow_6",
			difficulty = normal_and_above,
			jobs = {"crojob1"}
		},
		melt_2 = {
			award = "melt_2",
			job = "shoutout_raid",
			difficulty = normal_and_above
		},
		farm_1 = {
			phalanx_vip_alive = true,
			award = "farm_1",
			job = "dinner",
			difficulty = overkill_and_above
		},
		hox_3_silent = {
			stealth = true,
			award = "payback_2",
			job = "hox_3"
		},
		owe_saw = {
			award = "ameno_1",
			job = "nightclub",
			equipped_team = {
				secondary = "wpn_fps_saw_secondary",
				primary = "wpn_fps_saw"
			}
		},
		pain_train = {
			loud = true,
			num_players = 4,
			award = "ameno_4",
			need_full_job = true,
			jobs = {"firestarter"},
			difficulty = overkill_and_above,
			equipped_team = {
				secondary_unmodded = true,
				primary_unmodded = true,
				primaries = {"wpn_fps_ass_74"},
				secondaries = {"wpn_fps_smg_olympic"}
			}
		},
		turtle_wins = {
			timer = 240,
			stealth = true,
			award = "ameno_6",
			job = "gallery",
			equipped_team = {
				reverse_deployable = true,
				armor = "level_7",
				deployable = "armor_kit"
			}
		},
		anticimex = {
			num_players = 4,
			award = "ovk_1",
			need_full_job = true,
			jobs = {"alex"},
			difficulty = overkill_and_above,
			equipped_team = {
				armor = "level_6",
				mask = "the_overkill_mask",
				primaries = {"wpn_fps_lmg_m134"},
				secondaries = {"wpn_fps_rpg7"}
			}
		},
		modern_ninja = {
			stealth = true,
			award = "ovk_2",
			job = "kosugi",
			equipped = {
				primaries = {weapon_id = "m134"},
				secondaries = {weapon_id = "rpg7"}
			}
		},
		newbee = {
			award = "ovk_4",
			need_full_job = true,
			jobs = {"watchdogs_wrapper"},
			difficulty = overkill_and_above,
			equipped_team = {
				num_skills = 0,
				primaries = {"wpn_fps_ass_amcar"},
				secondaries = {"wpn_fps_pis_g17"}
			}
		},
		intel_thief = {
			award = "ovk_6",
			stealth = true,
			levels = {
				"welcome_to_the_jungle_1",
				"welcome_to_the_jungle_1_night"
			},
			difficulty = overkill_and_above
		},
		ovk_8 = {
			num_players = 2,
			award = "ovk_8",
			need_full_job = true,
			jobs = {"welcome_to_the_jungle_wrapper_prof"},
			difficulty = overkill_and_above,
			equipped_team = {
				armor = "level_1",
				primaries = {"wpn_fps_x_b92fs"}
			}
		},
		kenaz_silent = {
			stealth = true,
			award = "kenaz_2",
			jobs = {"kenaz"}
		},
		kenaz_timed = {
			timer = 840,
			award = "kenaz_4",
			jobs = {"kenaz"}
		},
		not_for_old_men = {
			stealth = true,
			award = "gage4_11",
			equipped = {secondaries = {
				weapon_id = "serbu",
				blueprint = {{"wpn_fps_upg_ns_shot_thick"}}
			}}
		},
		turtles_3 = {
			killed_by_weapons = 0,
			stealth = true,
			award = "turtles_3",
			killed_by_melee = 0,
			killed_by_grenade = 4,
			civilians_killed = 0,
			equipped = {grenades = "wpn_prj_four"}
		},
		jordan_3 = {
			award = "brooklyn_3",
			memory = {is_shortterm = false}
		},
		jordan_4 = {
			jump_timer = 4,
			award = "brooklyn_4",
			memory = {
				value = true,
				is_shortterm = false
			}
		},
		steel_1 = {
			num_players = 4,
			award = "steel_1",
			need_full_job = true,
			difficulty = overkill_and_above,
			equipped_team = {
				primaries = {
					"wpn_fps_bow_long",
					"wpn_fps_bow_frankish",
					"wpn_fps_bow_arblast"
				},
				masks = {
					"mason_knight_veteran",
					"agatha_knight",
					"agatha_vanguard_veteran",
					"mason_vanguard_veteran"
				},
				armors = {
					"level_3",
					"level_4",
					"level_5",
					"level_6",
					"level_7"
				},
				melee_weapons = {
					"morning",
					"buck",
					"beardy",
					"great"
				}
			}
		},
		green_2 = {
			num_players = 4,
			award = "green_2",
			job = "red2",
			difficulty = overkill_and_above,
			equipped_team = {
				primaries = {"wpn_fps_shot_r870"},
				secondaries = {"wpn_fps_pis_beretta"},
				characters = {
					"russian",
					"german",
					"spanish",
					"old_hoxton"
				}
			}
		},
		jerry_5 = {
			award = "jerry_5",
			job = "pbr2",
			difficulty = overkill_and_above,
			equipped_team = {
				secondary_category = "pistol",
				armor = "level_1",
				primary_category = "akimbo"
			}
		},
		cane_4 = {
			award = "cane_4",
			job = "cane",
			equipped_team = {
				secondary_category = "shotgun",
				primary_category = "shotgun"
			}
		},
		mad_3 = {
			award = "mad_3",
			job = "mad",
			difficulty = veryhard_and_above,
			memory = {
				value = true,
				is_shortterm = false
			}
		},
		mad_4 = {
			award = "mad_4",
			job = "mad",
			difficulty = overkill_and_above,
			equipped_team = {
				primaries = {"wpn_fps_ass_akm_gold"},
				masks = {"rus_hat"}
			}
		},
		flake_1 = {
			award = "flake_1",
			need_full_job = true,
			jobs = {"framing_frame"},
			difficulty = overkill_and_above,
			equipped_team = {
				num_skills = 0,
				armor = "level_1",
				primaries = {"wpn_fps_snp_model70"},
				secondaries = {"wpn_fps_pis_judge"}
			}
		},
		pim_4 = {
			everyone_killed_by_melee = 0,
			award = "pim_4",
			job = "firestarter",
			need_full_job = true,
			everyone_killed_by_grenade = 0,
			difficulty = overkill_and_above,
			shots_by_weapon = {
				"packrat",
				"x_packrat"
			}
		},
		orange_6 = {
			award = "orange_6",
			job = "help",
			need_full_job = true,
			everyone_killed_by_grenade = 0,
			everyone_killed_by_weapons = 0,
			difficulty = hard_and_above,
			characters = {"old_hoxton"},
			equipped_team = {melee_weapons = {"toothbrush"}}
		},
		tango_3 = {
			award = "tango_achieve_3",
			difficulty = veryhard_and_above,
			killed_by_blueprint = {
				blueprint = "wpn_fps_upg_o_spot",
				amount = 200
			}
		},
		spa_4 = {
			award = "spa_4",
			job = "spa",
			need_full_job = true,
			difficulty = overkill_and_above,
			equipped_team = {
				primary_category = "snp",
				secondaries = {"wpn_fps_saw_secondary"}
			}
		},
		fish_4 = {
			timer = 360,
			award = "fish_4",
			job = "fish",
			difficulty = overkill_and_above
		},
		fish_5 = {
			everyone_killed_by_weapons = 0,
			everyone_killed_by_melee = 0,
			award = "fish_5",
			job = "fish",
			everyone_killed_by_grenade = 0
		},
		grv_1 = {
			award = "grv_1",
			difficulty = overkill_and_above,
			equipped_outfit = {
				secondary = "wpn_fps_smg_coal",
				melee_weapon = "oxide",
				primaries = {
					"wpn_fps_snp_siltstone",
					"wpn_fps_ass_flint"
				}
			}
		},
		grv_4 = {
			stealth = true,
			award = "grv_4",
			equipped_outfit = {
				secondary = "wpn_fps_smg_coal",
				melee_weapon = "oxide",
				primaries = {
					"wpn_fps_snp_siltstone",
					"wpn_fps_ass_flint"
				}
			}
		},
		glace_1 = {
			award = "glace_1",
			job = "glace",
			difficulty = normal_and_above
		},
		glace_2 = {
			award = "glace_2",
			job = "glace",
			difficulty = hard_and_above
		},
		glace_3 = {
			award = "glace_3",
			job = "glace",
			difficulty = veryhard_and_above
		},
		glace_4 = {
			award = "glace_4",
			job = "glace",
			difficulty = overkill_and_above
		},
		run_1 = {
			award = "run_1",
			job = "run",
			difficulty = normal_and_above
		},
		run_2 = {
			award = "run_2",
			job = "run",
			difficulty = hard_and_above
		},
		run_3 = {
			award = "run_3",
			job = "run",
			difficulty = veryhard_and_above
		},
		run_4 = {
			award = "run_4",
			job = "run",
			difficulty = overkill_and_above
		},
		bain_jobs = {
			complete_job = true,
			contract = "bain",
			challenge_stat = "bain_jobs"
		},
		vlad_jobs = {
			complete_job = true,
			contract = "vlad",
			challenge_stat = "vlad_jobs"
		},
		hector_jobs = {
			complete_job = true,
			contract = "hector",
			challenge_stat = "hector_jobs"
		},
		elephant_jobs = {
			complete_job = true,
			contract = "the_elephant",
			challenge_stat = "elephant_jobs"
		},
		dentist_jobs = {
			complete_job = true,
			contract = "the_dentist",
			challenge_stat = "dentist_jobs"
		},
		butcher_jobs = {
			complete_job = true,
			contract = "the_butcher",
			challenge_stat = "butcher_jobs"
		},
		any_jobs = {
			complete_job = true,
			challenge_stat = "any_jobs"
		},
		monthly_rats = {
			challenge_award = "monthly_rats",
			need_full_job = true,
			jobs = {"alex"},
			difficulty = overkill_and_above,
			equipped_team = {
				num_skills = 0,
				armor = "level_1",
				primaries = {"wpn_fps_ass_amcar"},
				secondaries = {"wpn_fps_pis_g17"}
			}
		},
		monthly_firestarter = {
			challenge_award = "monthly_firestarter",
			need_full_job = true,
			jobs = {"firestarter"},
			difficulty = overkill_and_above,
			equipped_team = {
				num_skills = 0,
				armor = "level_1",
				primaries = {"wpn_fps_ass_amcar"},
				secondaries = {"wpn_fps_pis_g17"}
			}
		},
		monthly_shadowraid = {
			challenge_award = "monthly_shadowraid",
			job = "kosugi",
			need_full_job = true,
			difficulty = overkill_and_above,
			equipped_team = {
				num_skills = 0,
				armor = "level_1",
				primaries = {"wpn_fps_ass_amcar"},
				secondaries = {"wpn_fps_pis_g17"}
			}
		},
		trophy_transport_crossroads = {
			trophy_stat = "trophy_transport_crossroads",
			level_id = "arm_cro",
			difficulty = overkill_and_above
		},
		trophy_transport_downtown = {
			trophy_stat = "trophy_transport_downtown",
			level_id = "arm_hcm",
			difficulty = overkill_and_above
		},
		trophy_transport_harbor = {
			trophy_stat = "trophy_transport_harbor",
			level_id = "arm_fac",
			difficulty = overkill_and_above
		},
		trophy_transport_park = {
			trophy_stat = "trophy_transport_park",
			level_id = "arm_par",
			difficulty = overkill_and_above
		},
		trophy_transport_underpass = {
			trophy_stat = "trophy_transport_underpass",
			level_id = "arm_und",
			difficulty = overkill_and_above
		},
		trophy_transport_train = {
			trophy_stat = "trophy_transport_train",
			level_id = "arm_for",
			difficulty = overkill_and_above
		},
		trophy_escapes = {
			trophy_stat = "trophy_escapes",
			levels = {
				"escape_cafe",
				"escape_cafe_day",
				"escape_park",
				"escape_park_day",
				"escape_street",
				"escape_overpass",
				"escape_garage"
			}
		},
		trophy_basics_stealth = {
			job = "short1",
			trophy_stat = "trophy_basics_stealth"
		},
		trophy_basics_loud = {
			job = "short2",
			trophy_stat = "trophy_basics_loud"
		},
		trophy_car_shop = {
			job = "cage",
			trophy_stat = "trophy_car_shop"
		},
		trophy_golden_grin = {
			trophy_stat = "trophy_golden_grin",
			used_weapon_category = "pistol",
			difficulty = deathwish_and_above,
			jobs = {"kenaz"},
			equipped = {secondaries = {
				category = "pistol",
				blueprint_part_data = {sub_type = "silencer"}
			}}
		},
		trophy_nightclub_dw = {
			stealth = true,
			trophy_stat = "trophy_nightclub_dw",
			job = "nightclub",
			difficulty = deathwish_and_above
		},
		trophy_tiara = {
			trophy_stat = "trophy_tiara",
			job = "ukrainian_job_prof",
			difficulty = deathwish_and_above,
			equipped_team = {
				deployable = "ecm_jammer",
				reverse_deployable = true
			}
		},
		trophy_train_bomb = {
			trophy_stat = "trophy_train_bomb",
			difficulty = deathwish_and_above,
			jobs = {
				"crojob_wrapper",
				"crojob2",
				"crojob2_night"
			}
		},
		trophy_shoutout = {
			timer = 420,
			trophy_stat = "trophy_shoutout",
			job = "shoutout_raid",
			difficulty = overkill_and_above
		},
		trophy_stealth = {
			stealth = true,
			trophy_stat = "trophy_stealth",
			difficulty = overkill_and_above,
			jobs = {
				"gallery",
				"nightclub",
				"ukrainian_job_prof",
				"four_stores",
				"jewelry_store",
				"family",
				"roberts",
				"branchbank_prof",
				"branchbank_gold_prof",
				"branchbank_cash",
				"branchbank_deposit",
				"arm_for",
				"election_day",
				"kosugi",
				"big",
				"hox_3",
				"arena",
				"red2",
				"crojob1",
				"firestarter",
				"kenaz",
				"mus",
				"framing_frame",
				"dark",
				"friend",
				"fish"
			}
		},
		trophy_bank_heists = {
			trophy_stat = "trophy_bank_heists",
			difficulty = overkill_and_above,
			jobs = {
				"branchbank_prof",
				"branchbank_gold_prof",
				"branchbank_cash",
				"branchbank_deposit"
			}
		},
		trophy_carshop_stealth = {
			trophy_stat = "trophy_carshop_stealth",
			job = "cage",
			equipped_team = {
				reverse_deployable = true,
				deployable = "ecm_jammer",
				detection = {
					max = 100,
					min = 70
				}
			}
		},
		trophy_watchout = {
			trophy_stat = "trophy_watchout",
			need_full_job = true,
			used_weapon_category = "snp",
			total_accuracy = 100,
			jobs = {
				"watchdogs_wrapper",
				"watchdogs_night",
				"watchdogs"
			},
			equipped = {primaries = {category = "snp"}}
		},
		trophy_piggy_bank = {
			trophy_stat = "trophy_piggy_bank",
			job = "big",
			difficulty = overkill_and_above,
			equipped_team = {num_skills = 0}
		},
		trophy_jfk = {
			everyone_killed_by_melee = 0,
			everyone_killed_by_grenade = 0,
			job = "man",
			everyone_used_weapon_category = "snp",
			trophy_stat = "trophy_jfk",
			difficulty = overkill_and_above,
			equipped_team = {
				armor = "level_1",
				num_skills = 0,
				primary_category = "snp"
			}
		},
		trophy_dance = {
			killed_by_weapons = 0,
			killed_by_melee = 0,
			job = "nightclub",
			trophy_stat = "trophy_dance",
			killed_by_grenade = 0,
			equipped_team = {deployable = "trip_mine"}
		},
		trophy_fbi = {
			trophy_stat = "trophy_fbi",
			stealth = true,
			levels = {"firestarter_2"}
		},
		trophy_host = {
			need_full_job = true,
			trophy_stat = "trophy_host",
			is_host = true
		},
		trophy_framing_frame = {
			need_full_stealth = true,
			trophy_stat = "trophy_framing_frame",
			need_full_job = true,
			difficulty = overkill_and_above,
			jobs = {"framing_frame"}
		},
		trophy_courtesy = {
			complete_job = true,
			job = "pbr",
			trophy_stat = "trophy_courtesy",
			difficulty = easywish_and_above,
			killed = {medic = 0}
		},
		trophy_evolution = {
			complete_job = true,
			trophy_stat = "trophy_evolution",
			mutators = true
		},
		trophy_flawless = {
			complete_job = true,
			num_players = 4,
			trophy_stat = "trophy_flawless",
			difficulty = deathwish_and_above,
			mutators = {"MutatorFriendlyFire"},
			memory = {is_shortterm = false}
		},
		trophy_defender = {
			complete_job = true,
			trophy_stat = "trophy_defender",
			difficulty = overkill_and_above,
			jobs = {"chill_combat"}
		},
		trophy_friendly_car = {
			stealth = false,
			complete_job = true,
			job = "friend",
			num_players = 4,
			trophy_stat = "trophy_friendly_car",
			difficulty = easywish_and_above,
			equipped_team = {
				num_skills = 0,
				perk_deck = 14
			}
		},
		trophy_fish_trophy = {
			need_full_job = true,
			trophy_stat = "trophy_fish_trophy",
			job = "fish",
			equipped_team = {detection = {
				max = 100,
				min = 75
			}}
		},
		trophy_glace_completion = {
			trophy_stat = "trophy_glace_completion",
			job = "glace",
			difficulty = normal_and_above
		},
		daily_classics = {
			trophy_stat = "daily_classics",
			jobs = {
				"red2",
				"flat",
				"dinner",
				"pal",
				"man",
				"run",
				"glace"
			}
		},
		daily_discord = {
			converted_cops = 1,
			trophy_stat = "daily_discord"
		},
		daily_fwtd = {
			everyone_killed_by_melee = 0,
			everyone_killed_by_grenade = 0,
			job = "red2",
			trophy_stat = "daily_fwtd",
			difficulty = overkill_and_above,
			everyone_weapons_used = {
				"sentry_gun",
				"swat_van_turret_module"
			}
		},
		daily_gears = {
			trophy_stat = "daily_gears",
			difficulty = overkill_and_above,
			jobs = {
				"arm_cro",
				"arm_und",
				"arm_hcm",
				"arm_fac",
				"arm_par",
				"arm_for"
			},
			equipped_team = {
				primaries = {"wpn_fps_saw"},
				secondaries = {"wpn_fps_saw_secondary"}
			},
			memory = {is_shortterm = true}
		},
		daily_spacetime = {
			need_full_job = true,
			trophy_stat = "daily_spacetime",
			jobs = {"hox"},
			characters = {"old_hoxton"}
		},
		daily_night_out = {
			trophy_stat = "daily_night_out",
			everyone_killed_by_weapons = 0,
			job = "nightclub"
		},
		daily_naked = {
			trophy_stat = "daily_naked",
			difficulty = overkill_and_above,
			jobs = {
				"pbr",
				"pbr2"
			},
			equipped_team = {
				perk_deck = 3,
				armor = "level_1",
				num_skills = 0
			}
		},
		daily_ninja = {
			killed_by_weapons = 0,
			trophy_stat = "daily_ninja",
			job = "arm_cro",
			equipped_outfit = {grenade = {
				"wpn_prj_ace",
				"wpn_prj_four",
				"wpn_prj_jav",
				"wpn_prj_hur",
				"wpn_prj_target",
				"chico_injector",
				"smoke_screen_grenade"
			}}
		},
		daily_whats_stealth = {
			job = "kosugi",
			need_full_job = true,
			trophy_stat = "daily_whats_stealth",
			difficulty = deathwish_and_above,
			equipped_team = {armor = "level_7"},
			memory = {is_shortterm = true}
		},
		daily_akimbo = {
			trophy_stat = "daily_akimbo",
			total_accuracy = 80,
			equipped_outfit = {primary_category = "akimbo"},
			equipped = {secondaries = {
				category = "pistol",
				blueprint_part_data = {sub_type = "silencer"}
			}}
		},
		story_basics_stealth = {
			job = "short1",
			story = "story_basics_stealth"
		},
		story_basics_loud = {
			job = "short2",
			story = "story_basics_loud"
		},
		story_jewelry_store = {
			job = "jewelry_store",
			story = "story_jewelry_store"
		},
		story_bank_heist = {
			story = "story_bank_heist",
			jobs = {
				"branchbank_prof",
				"branchbank_gold_prof",
				"branchbank_cash",
				"branchbank_deposit"
			}
		},
		story_go_bank = {
			job = "roberts",
			story = "story_go_bank"
		},
		story_diamond_store = {
			job = "family",
			story = "story_diamond_store"
		},
		story_transport_mult = {
			story = "story_transport_mult",
			jobs = {
				"arm_cro",
				"arm_hcm",
				"arm_fac",
				"arm_par",
				"arm_und",
				"arm_for"
			}
		},
		story_train_heist = {
			job = "arm_for",
			story = "story_train_heist"
		},
		story_hard_mallcrasher = {
			job = "mallcrasher",
			story = "story_hard_mallcrasher",
			difficulty = hard_and_above
		},
		story_hard_four_store = {
			job = "four_stores",
			story = "story_hard_four_store",
			difficulty = hard_and_above
		},
		story_hard_white_xmas = {
			job = "pines",
			story = "story_hard_white_xmas",
			difficulty = hard_and_above
		},
		story_hard_ukrainian_job = {
			job = "ukrainian_job_prof",
			story = "story_hard_ukrainian_job",
			difficulty = hard_and_above
		},
		story_hard_meltdown = {
			job = "shoutout_raid",
			story = "story_hard_meltdown",
			difficulty = hard_and_above
		},
		story_hard_aftershock = {
			job = "jolly",
			story = "story_hard_aftershock",
			difficulty = hard_and_above
		},
		story_hard_stealing_xmas = {
			job = "moon",
			story = "story_hard_stealing_xmas",
			difficulty = hard_and_above
		},
		story_hard_nightclub = {
			job = "nightclub",
			story = "story_hard_nightclub",
			difficulty = hard_and_above
		},
		story_very_hard_watchdog = {
			story = "story_very_hard_watchdog",
			jobs = {
				"watchdogs_wrapper",
				"watchdogs_night",
				"watchdogs"
			},
			difficulty = veryhard_and_above
		},
		story_very_hard_firestarter = {
			job = "firestarter",
			story = "story_very_hard_firestarter",
			difficulty = veryhard_and_above
		},
		story_very_hard_rats = {
			job = "alex",
			story = "story_very_hard_rats",
			difficulty = veryhard_and_above
		},
		story_very_hard_big_oil = {
			story = "story_very_hard_big_oil",
			jobs = {
				"welcome_to_the_jungle_wrapper_prof",
				"welcome_to_the_jungle_night_prof",
				"welcome_to_the_jungle_prof"
			},
			difficulty = veryhard_and_above
		},
		story_very_hard_framing_frames = {
			job = "framing_frame",
			story = "story_very_hard_framing_frames",
			difficulty = veryhard_and_above
		},
		story_very_hard_election_day = {
			job = "election_day",
			story = "story_very_hard_election_day",
			difficulty = veryhard_and_above
		},
		story_very_hard_big_bank = {
			job = "big",
			story = "story_very_hard_big_bank",
			difficulty = veryhard_and_above
		},
		story_very_hard_hotline_miami = {
			job = "mia",
			story = "story_very_hard_hotline_miami",
			difficulty = veryhard_and_above
		},
		story_very_hard_hoxton_breakout = {
			job = "hox",
			story = "story_very_hard_hoxton_breakout",
			difficulty = veryhard_and_above
		},
		story_very_hard_hoxton_revenge = {
			job = "hox_3",
			story = "story_very_hard_hoxton_revenge",
			difficulty = veryhard_and_above
		},
		story_very_hard_diamond = {
			job = "mus",
			story = "story_very_hard_diamond",
			difficulty = veryhard_and_above
		},
		story_very_hard_golden_grin = {
			job = "kenaz",
			story = "story_very_hard_golden_grin",
			difficulty = veryhard_and_above
		},
		story_very_hard_bomb_dockyard = {
			job = "crojob1",
			story = "story_very_hard_bomb_dockyard",
			difficulty = veryhard_and_above
		},
		story_very_hard_bomb_forest = {
			story = "story_very_hard_bomb_forest",
			jobs = {
				"crojob_wrapper",
				"crojob2",
				"crojob2_night"
			},
			difficulty = veryhard_and_above
		},
		story_very_hard_scarface = {
			job = "friend",
			story = "story_very_hard_scarface",
			difficulty = veryhard_and_above
		}
	}
	self.check_equipment_memory_on_leave = {
		self.complete_heist_achievements.daily_whats_stealth,
		self.complete_heist_achievements.daily_gears
	}
	self.complete_heist_statistics_achievements = {
		immortal_ballot = {
			num_players = 4,
			award = "ovk_5",
			total_downs = 0,
			levels = {
				"election_day_3",
				"election_day_3_skip1",
				"election_day_3_skip2"
			},
			difficulty = deathwish_and_above
		},
		full_two_twenty = {
			num_players = 4,
			total_kills = 120,
			award = "ovk_7",
			total_accuracy = 120
		},
		berry_4 = {
			is_dropin = false,
			award = "berry_4",
			level_id = "pbr",
			total_downs = 0,
			difficulty = overkill_and_above
		},
		flat_5 = {
			success = true,
			level_id = "flat",
			award = "flat_5",
			total_accuracy = 200
		},
		daily_professional = {
			trophy_stat = "daily_professional",
			difficulty = overkill_and_above,
			total_headshots = {
				invert = true,
				amount = 0
			}
		}
	}
	self.loot_cash_achievements = {
		mallrunner = {
			award = "ameno_3",
			total_value = 1800000,
			total_time = 50,
			jobs = {"mallcrasher"},
			difficulties = {"overkill_145"}
		},
		cane_5 = {
			award = "cane_5",
			job = "cane",
			no_deployable = true,
			no_assets = true,
			secured = {
				carry_id = "present",
				total_amount = 10
			}
		},
		pal_2 = {
			award = "pal_2",
			job = "pal",
			secured = {
				carry_id = "counterfeit_money",
				value = 1000000
			}
		},
		trophy_tfturret = {
			trophy_stat = "trophy_tfturret",
			is_dropin = false,
			jobs = {"arm_for"},
			difficulties = overkill_and_above,
			secured = {
				{
					carry_id = "ammo",
					total_amount = 20
				},
				{
					carry_id = "turret",
					total_amount = 3
				}
			}
		},
		daily_mortage = {
			trophy_stat = "daily_mortage",
			is_dropin = false,
			jobs = {"family"},
			secured = {
				carry_id = "diamonds",
				total_amount = 16
			}
		},
		daily_toast = {
			trophy_stat = "daily_toast",
			is_dropin = false,
			jobs = {"pines"},
			secured = {
				carry_id = "sandwich",
				amount = 1
			}
		},
		daily_lodsofemone = {
			trophy_stat = "daily_lodsofemone",
			secured = {
				carry_id = "money",
				amount = 1
			}
		},
		daily_heirloom = {
			trophy_stat = "daily_heirloom",
			is_dropin = false,
			jobs = {"kosugi"},
			secured = {
				carry_id = "samurai_suit",
				total_amount = 4
			}
		},
		daily_candy = {
			trophy_stat = "daily_candy",
			secured = {{
				amount = 1,
				carry_id = {
					"coke",
					"coke_light",
					"coke_pure",
					"present",
					"yayo"
				}
			}}
		},
		daily_art = {
			trophy_stat = "daily_art",
			is_dropin = false,
			jobs = {"gallery"},
			secured = {
				carry_id = "painting",
				total_amount = 9
			}
		},
		trophy_coke = {
			trophy_stat = "trophy_coke",
			jobs = {"friend"},
			secured = {{
				amount = 1,
				carry_id = {"yayo"}
			}}
		},
		story_shadow_raid_bags = {
			amount = 1,
			story = "story_shadow_raid_bags",
			jobs = {"kosugi"}
		}
	}
	self.job_list = {
		vlad = {
			"ukrainian_job_prof",
			"mallcrasher",
			"four_stores",
			"nightclub",
			"pines",
			"shoutout_raid",
			"jolly",
			"cane",
			"peta",
			"moon"
		},
		hector = {
			"watchdogs_wrapper",
			"alex",
			"firestarter"
		},
		the_elephant = {
			"framing_frame",
			"welcome_to_the_jungle_wrapper_prof",
			"election_day",
			"born"
		},
		bain = {
			"jewelry_store",
			"family",
			"roberts",
			"branchbank_prof",
			"branchbank_gold_prof",
			"branchbank_cash",
			"branchbank_deposit",
			"arm_cro",
			"arm_hcm",
			"arm_fac",
			"arm_par",
			"arm_und",
			"arm_for",
			"kosugi",
			"gallery",
			"rat",
			"cage",
			"arena"
		},
		the_dentist = {
			"big",
			"mia",
			"hox",
			"mus",
			"hox_3",
			"kenaz"
		},
		the_butcher = {
			"crojob_wrapper",
			"crojob1",
			"friend"
		},
		classic = {
			"red2",
			"dinner",
			"pal",
			"man",
			"flat",
			"run",
			"glace"
		},
		locke = {
			"pbr",
			"pbr2"
		},
		jimmy = {
			"mad",
			"dark"
		},
		events = {
			"nail",
			"help"
		},
		the_continental = {
			"spa",
			"fish"
		}
	}
	local jobs = {}
	local job_data = nil
	local available_jobs = {}

	for _, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		if tweak_data.narrative:job_data(job_id).contact ~= "wip" and tweak_data.narrative:job_data(job_id).contact ~= "tests" then
			jobs[job_id] = true
			available_jobs[job_id] = tweak_data.narrative:job_data(job_id).contact
		end
	end

	for _, list in pairs(self.job_list) do
		for _, job_id in pairs(list) do
			if tweak_data.narrative:has_job_wrapper(job_id) then
				available_jobs[job_id] = nil

				for _, job_id in ipairs(tweak_data.narrative:job_data(job_id).job_wrapper) do
					available_jobs[job_id] = nil
				end
			elseif jobs[job_id] then
				available_jobs[job_id] = nil
			else
				Application:debug("[TWEAKDATA:ACHIEVEMENTS] Job missing in narrative", job_id)
			end
		end
	end

	if table.size(available_jobs) > 0 then
		Application:debug("[TWEAKDATA:ACHIEVEMENTS] Jobs not yet in achievement 'job_list':", inspect(available_jobs))
	end

	self.complete_heist_stats_achievements = {
		easywish_vlad = {
			award = "pick_62",
			contact = "vlad",
			difficulty = easywish_and_above
		},
		easywish_hector = {
			award = "pick_63",
			contact = "hector",
			difficulty = easywish_and_above
		},
		easywish_elephant = {
			award = "pick_64",
			contact = "the_elephant",
			difficulty = easywish_and_above
		},
		easywish_bain = {
			award = "pick_65",
			contact = "bain",
			difficulty = easywish_and_above
		},
		death_vlad = {
			award = "death_5",
			contact = "vlad",
			difficulty = deathwish_and_above
		},
		death_hector = {
			award = "death_9",
			contact = "hector",
			difficulty = deathwish_and_above
		},
		death_elephant = {
			award = "death_12",
			contact = "the_elephant",
			difficulty = deathwish_and_above
		},
		death_bain = {
			award = "death_26",
			contact = "bain",
			difficulty = deathwish_and_above
		},
		sm_vlad = {
			award = "axe_62",
			contact = "vlad",
			difficulty = sm_wish_and_above
		},
		sm_hector = {
			award = "axe_63",
			contact = "hector",
			difficulty = sm_wish_and_above
		},
		sm_elephant = {
			award = "axe_64",
			contact = "the_elephant",
			difficulty = sm_wish_and_above
		},
		sm_bain = {
			award = "axe_65",
			contact = "bain",
			difficulty = sm_wish_and_above
		},
		skull_hard = {
			award = "death_27",
			contact = "all",
			difficulty = hard_and_above
		},
		skull_very_hard = {
			award = "death_28",
			contact = "all",
			difficulty = veryhard_and_above
		},
		skull_overkill = {
			award = "death_29",
			contact = "all",
			difficulty = overkill_and_above
		},
		skull_easywish = {
			award = "pick_66",
			contact = "all",
			difficulty = easywish_and_above
		},
		skull_deathwish = {
			award = "death_30",
			contact = "all",
			difficulty = deathwish_and_above
		},
		skull_smwish = {
			award = "axe_66",
			contact = "all",
			difficulty = sm_wish_and_above
		},
		trophy_smwish = {
			contact = "all",
			trophy_stat = "trophy_smwish",
			difficulty = sm_wish_and_above
		}
	}
	self.four_mask_achievements = {
		reindeer_games = {
			award = "charliesierra_9",
			masks = {
				"santa_happy",
				"santa_mad",
				"santa_drunk",
				"santa_surprise"
			}
		},
		ghost_riders = {
			award = "bob_10",
			masks = {
				"skullhard",
				"skullveryhard",
				"skulloverkill",
				"skulloverkillplus",
				"gitgud_e_wish",
				"gitgud_sm_wish"
			}
		},
		funding_father = {
			award = "bigbank_10",
			masks = {
				"franklin",
				"lincoln",
				"grant",
				"washington"
			}
		},
		go_bananas = {
			award = "gage4_12",
			jobs = {"alex"},
			difficulties = overkill_and_above,
			masks = {
				"silverback",
				"mandril",
				"skullmonkey",
				"orangutang"
			}
		},
		animal_fight = {
			award = "pig_5",
			jobs = {"mia"},
			difficulties = hard_and_above,
			masks = {
				"white_wolf",
				"owl",
				"rabbit",
				"pig"
			}
		},
		guy_with_gun_now_with_night_jobs = {
			award = "gage5_6",
			jobs = {
				"watchdogs_wrapper",
				"watchdogs",
				"watchdogs_night"
			},
			difficulties = overkill_and_above,
			masks = {
				"galax",
				"crowgoblin",
				"evil",
				"volt"
			}
		},
		wind_of_change = {
			award = "eagle_3",
			jobs = {"hox"},
			difficulties = overkill_and_above,
			masks = {
				"churchill",
				"red_hurricane",
				"patton",
				"de_gaulle"
			}
		},
		xmas_2014 = {
			award = "deer_6",
			jobs = {"pines"},
			difficulties = deathwish_and_above,
			masks = {
				"krampus",
				"mrs_claus",
				"strinch",
				"robo_santa"
			}
		},
		blight = {
			award = "bat_5",
			jobs = {"mus"},
			difficulties = overkill_and_above,
			masks = {
				"medusa",
				"anubis",
				"pazuzu",
				"cursed_crown"
			}
		}
	}
	self.sniper_kill_achievements = {
		did_i_do_that = {
			weapon_type = "snp",
			award = "gage3_9",
			multi_kill = 3
		},
		max_peneration = {
			weapon = "r93",
			stat = "gage3_10_stats",
			obstacle = "shield",
			enemy = "shield"
		},
		you_cant_hide = {
			weapon = "r93",
			stat = "gage3_15_stats",
			obstacle = "wall"
		},
		two_for_one = {
			weapon = "msr",
			stat = "gage3_16_stats",
			multi_kill = 2
		}
	}
	self.inventory = {}
	self.crime_spree = {
		cee_1 = {
			award = "cee_1",
			level = 50
		},
		cee_2 = {
			award = "cee_2",
			level = 100
		},
		cee_3 = {
			award = "cee_3",
			level = 250
		},
		story_crime_spree = {
			story = "story_crime_spree",
			level = 20
		}
	}
	local gage_5_1_achievement = {
		max_progress = 25,
		stat = "gage5_1_stats",
		text_id = "bm_wp_gage5_1_achievment"
	}
	local gage_5_2_achievement = {
		award = "gage5_2",
		text_id = "bm_wp_gage5_2_achievment"
	}
	local gage_5_3_achievement = {
		award = "gage5_3",
		text_id = "bm_wp_gage5_3_achievment"
	}
	local gage_5_4_achievement = {
		award = "gage5_4",
		text_id = "bm_wp_gage5_4_achievment"
	}
	local gage_5_5_achievement = {
		max_progress = 25,
		stat = "gage5_5_stats",
		text_id = "bm_wp_gage5_5_achievment"
	}
	local gage_5_6_achievement = {
		award = "gage5_6",
		text_id = "bm_wp_gage5_6_achievment"
	}
	local gage_5_7_achievement = {
		award = "gage5_7",
		text_id = "bm_wp_gage5_7_achievment"
	}
	local gage_5_9_achievement = {
		max_progress = 10,
		stat = "gage5_9_stats",
		text_id = "bm_wp_gage5_9_achievment"
	}
	local gage_5_10_achievement = {
		max_progress = 200,
		stat = "gage5_10_stats",
		text_id = "bm_wp_gage5_10_achievment"
	}
	local pig_1_achievement = {
		award = "pig_1",
		text_id = "bm_wp_pig_1_achievment"
	}
	local pig_2_achievement = {
		award = "pig_2",
		text_id = "bm_wp_pig_2_achievment"
	}
	local pig_3_achievement = {
		max_progress = 25,
		stat = "pig_3_stats",
		text_id = "bm_wp_pig_3_achievment"
	}
	local pig_4_achievement = {
		award = "pig_4",
		text_id = "bm_wp_pig_4_achievment"
	}
	local pig_5_achievement = {
		award = "pig_5",
		text_id = "bm_wp_pig_5_achievment"
	}
	local eagle_1_achievement = {
		max_progress = 25,
		stat = "eagle_1_stats",
		text_id = "bm_wp_eagle_1_achievment"
	}
	local eagle_2_achievement = {
		max_progress = 25,
		stat = "eagle_2_stats",
		text_id = "bm_wp_eagle_2_achievment"
	}
	local eagle_3_achievement = {
		award = "eagle_3",
		text_id = "bm_wp_eagle_3_achievment"
	}
	local eagle_4_achievement = {
		award = "eagle_4",
		text_id = "bm_wp_eagle_4_achievment"
	}
	local eagle_5_achievement = {
		award = "eagle_5",
		text_id = "bm_wp_eagle_5_achievment"
	}
	local ameno_1_achievement = {
		award = "ameno_1",
		text_id = "bm_wp_ameno_1_achievment"
	}
	local ameno_2_achievement = {
		award = "ameno_2",
		text_id = "bm_wp_ameno_2_achievment"
	}
	local ameno_3_achievement = {
		award = "ameno_3",
		text_id = "bm_wp_ameno_3_achievment"
	}
	local ameno_4_achievement = {
		award = "ameno_4",
		text_id = "bm_wp_ameno_4_achievment"
	}
	local ameno_5_achievement = {
		award = "ameno_5",
		text_id = "bm_wp_ameno_5_achievment"
	}
	local ameno_6_achievement = {
		award = "ameno_6",
		text_id = "bm_wp_ameno_6_achievment"
	}
	local ameno_7_achievement = {
		award = "ameno_7",
		text_id = "bm_wp_ameno_7_achievment"
	}
	local ameno_8_achievement = {
		max_progress = 100,
		stat = "ameno_08_stats",
		text_id = "bm_wp_ameno_8_achievment"
	}
	self.mask_tracker = {}
	self.weapon_part_tracker = {
		wpn_fps_snp_m95_barrel_long = {
			max_progress = 25,
			stat = "gage3_7_stats",
			text_id = "bm_wp_m95_b_barrel_long_achievment"
		},
		wpn_fps_snp_r93_b_suppressed = {
			award = "gage3_8",
			text_id = "bm_wp_r93_b_suppressed_achievment"
		},
		wpn_fps_upg_o_45iron = {
			award = "gage3_9",
			text_id = "bm_wp_upg_o_45iron_achievment"
		},
		wpn_fps_snp_r93_b_short = {
			max_progress = 10,
			stat = "gage3_10_stats",
			text_id = "bm_wp_r93_b_short_achievment"
		},
		wpn_fps_snp_m95_barrel_suppressed = {
			max_progress = 10,
			stat = "gage3_11_stats",
			text_id = "bm_wp_m95_b_barrel_suppressed_achievment"
		},
		wpn_fps_snp_m95_barrel_short = {
			max_progress = 10,
			award = "gage3_12_stats",
			text_id = "bm_wp_m95_b_barrel_short_achievment"
		},
		wpn_fps_upg_o_leupold = {
			max_progress = 10,
			stat = "gage3_13_stats",
			text_id = "bm_wp_upg_o_leupold_achievment"
		},
		wpn_fps_snp_msr_body_msr = {
			max_progress = 25,
			stat = "gage3_14_stats",
			text_id = "bm_wp_msr_body_msr_achievment"
		},
		wpn_fps_snp_r93_body_wood = {
			max_progress = 25,
			stat = "gage3_15_stats",
			text_id = "bm_wp_r93_body_wood_achievment"
		},
		wpn_fps_snp_msr_ns_suppressor = {
			max_progress = 25,
			stat = "gage3_16_stats",
			text_id = "bm_wp_snp_msr_ns_suppressor_achievment"
		},
		wpn_fps_snp_msr_b_long = {
			max_progress = 250,
			stat = "gage3_17_stats",
			text_id = "bm_wp_snp_msr_b_long_achievment"
		},
		wpn_fps_ass_fal_fg_01 = {
			award = "bigbank_7",
			text_id = "bm_wp_fal_fg_01_achievment"
		},
		wpn_fps_ass_fal_fg_03 = {
			award = "bigbank_8",
			text_id = "bm_wp_fal_fg_03_achievment"
		},
		wpn_fps_ass_fal_fg_04 = {
			award = "bigbank_3",
			text_id = "bm_wp_fal_fg_04_achievment"
		},
		wpn_fps_ass_fal_fg_wood = {
			award = "bigbank_4",
			text_id = "bm_wp_fal_fg_wood_achievment"
		},
		wpn_fps_ass_fal_s_01 = {
			award = "bigbank_5",
			text_id = "bm_wp_fal_s_01_achievment"
		},
		wpn_fps_ass_fal_s_03 = {
			award = "bigbank_10",
			text_id = "bm_wp_fal_s_03_achievment"
		},
		wpn_fps_ass_fal_s_wood = {
			award = "bigbank_6",
			text_id = "bm_wp_fal_s_wood_achievment"
		},
		wpn_fps_ass_fal_g_01 = {
			award = "bigbank_1",
			text_id = "bm_wp_fal_g_01_achievment"
		},
		wpn_fps_ass_fal_m_01 = {
			award = "bigbank_2",
			text_id = "bm_wp_fal_m_01_achievment"
		},
		wpn_fps_upg_o_mbus_rear = {
			award = "gage4_2",
			text_id = "bm_wp_upg_o_mbus_rear_achievment"
		},
		wpn_fps_sho_ben_b_short = {
			award = "gage4_4",
			text_id = "bm_wp_ben_b_short_achievment"
		},
		wpn_fps_sho_ben_b_long = {
			award = "gage4_5",
			text_id = "bm_wp_ben_b_long_achievment"
		},
		wpn_fps_sho_ben_s_collapsed = {
			max_progress = 50,
			stat = "gage4_6",
			text_id = "bm_wp_ben_s_collapsed_achievment"
		},
		wpn_fps_sho_ksg_b_short = {
			max_progress = 25,
			stat = "gage4_7",
			text_id = "bm_wp_ksg_b_short_achievment"
		},
		wpn_fps_sho_ksg_b_long = {
			max_progress = 10,
			stat = "gage4_8",
			text_id = "bm_wp_ksg_b_long_achievment"
		},
		wpn_fps_sho_ben_s_solid = {
			award = "gage4_9",
			text_id = "bm_wp_ben_s_solid_achievment"
		},
		wpn_fps_sho_striker_b_long = {
			max_progress = 10,
			stat = "gage4_10_stats",
			text_id = "bm_wp_striker_b_long_achievment"
		},
		wpn_fps_sho_striker_b_suppressed = {
			award = "gage4_11",
			text_id = "bm_wp_striker_b_suppressed_achievment"
		},
		wpn_fps_gre_m79_barrel_short = gage_5_5_achievement,
		wpn_fps_gre_m79_stock_short = gage_5_2_achievement,
		wpn_fps_ass_g3_b_sniper = gage_5_1_achievement,
		wpn_fps_ass_g3_fg_psg = gage_5_1_achievement,
		wpn_fps_ass_g3_g_sniper = gage_5_1_achievement,
		wpn_fps_ass_g3_s_sniper = gage_5_1_achievement,
		wpn_fps_ass_g3_b_short = gage_5_4_achievement,
		wpn_fps_ass_g3_fg_retro_plastic = gage_5_4_achievement,
		wpn_fps_ass_g3_fg_railed = gage_5_6_achievement,
		wpn_fps_ass_g3_fg_retro = gage_5_7_achievement,
		wpn_fps_ass_g3_g_retro = gage_5_7_achievement,
		wpn_fps_ass_g3_s_wood = gage_5_7_achievement,
		wpn_fps_ass_galil_s_sniper = gage_5_1_achievement,
		wpn_fps_ass_galil_fg_sniper = gage_5_1_achievement,
		wpn_fps_ass_galil_g_sniper = gage_5_1_achievement,
		wpn_fps_ass_galil_fg_sar = gage_5_6_achievement,
		wpn_fps_ass_galil_fg_mar = gage_5_3_achievement,
		wpn_fps_ass_galil_s_plastic = gage_5_3_achievement,
		wpn_fps_ass_galil_s_light = gage_5_4_achievement,
		wpn_fps_ass_galil_s_wood = gage_5_5_achievement,
		wpn_fps_ass_galil_fg_fab = gage_5_9_achievement,
		wpn_fps_ass_galil_s_fab = gage_5_9_achievement,
		wpn_fps_ass_galil_s_skeletal = gage_5_9_achievement,
		wpn_fps_ass_famas_b_sniper = gage_5_1_achievement,
		wpn_fps_ass_famas_b_short = gage_5_4_achievement,
		wpn_fps_ass_famas_b_long = gage_5_6_achievement,
		wpn_fps_ass_famas_g_retro = gage_5_10_achievement,
		wpn_fps_ass_famas_b_suppressed = gage_5_10_achievement,
		wpn_fps_smg_scorpion_g_ergo = pig_1_achievement,
		wpn_fps_smg_scorpion_m_extended = pig_1_achievement,
		wpn_fps_smg_scorpion_s_unfolded = pig_1_achievement,
		wpn_fps_smg_uzi_fg_rail = pig_2_achievement,
		wpn_fps_smg_uzi_s_leather = pig_2_achievement,
		wpn_fps_smg_uzi_s_solid = pig_3_achievement,
		wpn_fps_smg_scorpion_g_wood = pig_3_achievement,
		wpn_fps_smg_tec9_ns_ext = pig_4_achievement,
		wpn_fps_smg_tec9_m_extended = pig_4_achievement,
		wpn_fps_smg_tec9_s_unfolded = pig_4_achievement,
		wpn_fps_smg_uzi_b_suppressed = pig_5_achievement,
		wpn_fps_smg_uzi_s_standard = pig_5_achievement,
		wpn_fps_smg_scorpion_b_suppressed = pig_5_achievement,
		wpn_fps_smg_scorpion_s_nostock = pig_5_achievement,
		wpn_fps_smg_tec9_b_standard = pig_5_achievement,
		wpn_fps_snp_mosin_b_sniper = eagle_1_achievement,
		wpn_fps_snp_mosin_b_standard = eagle_1_achievement,
		wpn_fps_smg_sterling_b_e11 = eagle_2_achievement,
		wpn_fps_pis_c96_nozzle = eagle_2_achievement,
		wpn_fps_pis_c96_sight = eagle_2_achievement,
		wpn_fps_smg_sterling_b_short = eagle_2_achievement,
		wpn_fps_smg_sterling_b_suppressed = eagle_2_achievement,
		wpn_fps_smg_sterling_m_short = eagle_2_achievement,
		wpn_fps_smg_sterling_s_folded = eagle_2_achievement,
		wpn_fps_smg_sterling_s_nostock = eagle_2_achievement,
		wpn_fps_smg_sterling_s_solid = eagle_2_achievement,
		wpn_fps_snp_mosin_body_black = eagle_3_achievement,
		wpn_fps_pis_c96_b_long = eagle_3_achievement,
		wpn_fps_snp_mosin_b_short = eagle_3_achievement,
		wpn_fps_smg_sterling_m_long = eagle_3_achievement,
		wpn_fps_smg_sterling_b_long = eagle_3_achievement,
		wpn_fps_lmg_mg42_b_vg38 = eagle_3_achievement,
		wpn_fps_pis_c96_m_extended = eagle_4_achievement,
		wpn_fps_pis_c96_s_solid = eagle_4_achievement,
		wpn_fps_lmg_mg42_b_mg34 = eagle_5_achievement,
		wpn_fps_upg_ass_m4_upper_reciever_core = ameno_1_achievement,
		wpn_fps_upg_ass_m4_lower_reciever_core = ameno_1_achievement,
		wpn_fps_upg_ass_m16_fg_stag = ameno_1_achievement,
		wpn_fps_upg_ak_g_rk3 = ameno_2_achievement,
		wpn_fps_upg_ak_fg_zenit = ameno_2_achievement,
		wpn_fps_upg_ass_m4_upper_reciever_ballos = ameno_2_achievement,
		wpn_fps_upg_o_ak_scopemount = ameno_3_achievement,
		wpn_fps_upg_ns_ass_pbs1 = ameno_3_achievement,
		wpn_fps_upg_ass_ak_b_zastava = ameno_4_achievement,
		wpn_fps_upg_ak_m_uspalm = ameno_4_achievement,
		wpn_fps_upg_ass_m4_fg_moe = ameno_5_achievement,
		wpn_fps_upg_smg_olympic_fg_lr300 = ameno_5_achievement,
		wpn_fps_upg_ass_m4_fg_lvoa = ameno_5_achievement,
		wpn_fps_upg_ak_s_solidstock = ameno_6_achievement,
		wpn_fps_upg_m4_s_ubr = ameno_6_achievement,
		wpn_fps_upg_ass_m4_b_beowulf = ameno_7_achievement,
		wpn_fps_upg_m4_m_l5 = ameno_7_achievement,
		wpn_fps_upg_ak_fg_trax = ameno_8_achievement,
		wpn_fps_upg_ak_fg_krebs = ameno_8_achievement,
		wpn_fps_upg_ak_b_ak105 = ameno_8_achievement
	}

	if SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1") then
		self.weapon_part_tracker = {}
	end
end

