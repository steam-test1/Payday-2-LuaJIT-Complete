CrimeSpreeTweakData = CrimeSpreeTweakData or class()

function CrimeSpreeTweakData:init(tweak_data)
	self.unlock_level = 60
	self.base_difficulty = "overkill_145"
	self.base_difficulty_index = 5
	self.starting_levels = {
		0,
		20,
		40
	}
	self.allow_highscore_continue = true
	self.initial_cost = 0
	self.cost_per_level = 0.5
	self.randomization_cost = 6
	self.randomization_multiplier = 2
	self.catchup_bonus = 0.035
	self.catchup_limit = 100
	self.catchup_min_level = 100
	self.winning_streak = 0.005
	self.winning_streak_reset_on_failure = false
	self.continue_cost = {
		6,
		0.7
	}
	self.crash_causes_loss = true
	self.protection_threshold = 16
	self.announce_modifier_stinger = "stinger_feedback_positive"

	self:init_missions(tweak_data)
	self:init_rewards(tweak_data)
	self:init_modifiers(tweak_data)
	self:init_gage_assets(tweak_data)
	self:init_gui(tweak_data)
	self:init_exclusion_data()
end

function CrimeSpreeTweakData:init_exclusion_data()
	self.excluded_enemies = {
		damage = table.list_to_set({
			"sniper",
			"heavy_swat_sniper"
		}),
		health = table.list_to_set({})
	}
end

function CrimeSpreeTweakData:init_missions(tweak_data)
	local debug_short_add = 5
	local debug_med_add = 7
	local debug_long_add = 10

	self.missions = {
		{
			{
				icon = "csm_branchbank",
				id = "bb_cash",
				stage_id = "branchbank_cash",
				add = debug_short_add,
				level = tweak_data.narrative.stages.branchbank_cash
			},
			{
				icon = "csm_carshop",
				id = "cage",
				stage_id = "cage",
				add = debug_short_add,
				level = tweak_data.narrative.stages.cage
			},
			{
				icon = "csm_shadow_raid",
				id = "kosugi",
				stage_id = "kosugi",
				add = debug_short_add,
				level = tweak_data.narrative.stages.kosugi
			},
			{
				icon = "csm_murky",
				id = "dark",
				stage_id = "dark",
				add = debug_short_add,
				level = tweak_data.narrative.stages.dark
			},
			{
				add = 5,
				icon = "csm_fs_2",
				id = "fs_2",
				stage_id = "firestarter_2",
				level = tweak_data.narrative.stages.firestarter_2
			},
			{
				add = 4,
				icon = "csm_hoxvenge",
				id = "hox_3",
				stage_id = "hox_3",
				level = tweak_data.narrative.stages.hox_3
			},
			{
				add = 4,
				icon = "csm_yacht",
				id = "fish",
				stage_id = "fish",
				level = tweak_data.narrative.stages.fish
			},
			{
				add = 4,
				icon = "csm_election_2",
				id = "ed_2",
				stage_id = "election_day_2",
				level = tweak_data.narrative.stages.election_day_2
			},
			{
				add = 8,
				icon = "csm_docks",
				id = "crojob1",
				stage_id = "crojob1",
				level = tweak_data.narrative.stages.crojob1
			},
			{
				icon = "csm_framing_3",
				id = "framing_frame_3",
				stage_id = "framing_frame_3",
				add = debug_med_add,
				level = tweak_data.narrative.stages.framing_frame_3
			},
			{
				icon = "csm_train_forest",
				id = "arm_for",
				stage_id = "arm_for",
				add = debug_med_add,
				level = tweak_data.narrative.stages.arm_for
			},
			{
				add = 8,
				icon = "csm_friend",
				id = "friend",
				stage_id = "friend",
				level = tweak_data.narrative.stages.friend
			},
			{
				add = 13,
				icon = "csm_big",
				id = "big",
				stage_id = "big",
				level = tweak_data.narrative.stages.big
			},
			{
				icon = "csm_diamond",
				id = "mus",
				stage_id = "mus",
				add = debug_long_add,
				level = tweak_data.narrative.stages.mus
			},
			{
				icon = "csm_go",
				id = "roberts",
				stage_id = "roberts",
				add = debug_long_add,
				level = tweak_data.narrative.stages.roberts
			},
			{
				icon = "csm_fwb",
				id = "red2",
				stage_id = "red2",
				add = debug_long_add,
				level = tweak_data.narrative.stages.red2
			},
			{
				icon = "csm_pex",
				id = "pex",
				stage_id = "pex",
				add = debug_short_add,
				level = tweak_data.narrative.stages.pex
			},
			{
				icon = "csm_tag",
				id = "tag",
				stage_id = "tag",
				add = debug_short_add,
				level = tweak_data.narrative.stages.tag
			}
		},
		{
			{
				add = 8,
				icon = "csm_wwh",
				id = "wwh",
				stage_id = "wwh",
				level = tweak_data.narrative.stages.wwh
			},
			{
				add = 8,
				icon = "csm_rvd_1",
				id = "rvd1",
				stage_id = "rvd1",
				level = tweak_data.narrative.stages.rvd_1
			},
			{
				add = 10,
				icon = "csm_rvd_2",
				id = "rvd2",
				stage_id = "rvd2",
				level = tweak_data.narrative.stages.rvd_2
			},
			{
				add = 8,
				icon = "csm_brb",
				id = "brb",
				stage_id = "brb",
				level = tweak_data.narrative.stages.brb
			},
			{
				icon = "csm_crossroads",
				id = "arm_cro",
				stage_id = "arm_cro",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_cro
			},
			{
				icon = "csm_prison",
				id = "help",
				stage_id = "help",
				add = debug_short_add,
				level = tweak_data.narrative.stages.help
			},
			{
				icon = "csm_overpass",
				id = "arm_und",
				stage_id = "cage",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_und
			},
			{
				icon = "csm_downtown",
				id = "arm_hcm",
				stage_id = "arm_hcm",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_hcm
			},
			{
				icon = "csm_park",
				id = "arm_par",
				stage_id = "arm_par",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_par
			},
			{
				icon = "csm_harbor",
				id = "arm_fac",
				stage_id = "arm_fac",
				add = debug_short_add,
				level = tweak_data.narrative.stages.arm_fac
			},
			{
				add = 3,
				icon = "csm_biker_2",
				id = "biker_2",
				stage_id = "chew",
				level = tweak_data.narrative.stages.chew
			},
			{
				add = 4,
				icon = "csm_fs_1",
				id = "fs_1",
				stage_id = "firestarter_1",
				level = tweak_data.narrative.stages.firestarter_1
			},
			{
				icon = "csm_labrats",
				id = "nail",
				stage_id = "nail",
				add = debug_short_add,
				level = tweak_data.narrative.stages.nail
			},
			{
				add = 6,
				icon = "csm_watchdogs_1",
				id = "watchdogs_1_d",
				stage_id = "watchdogs_1_d",
				level = tweak_data.narrative.stages.watchdogs_1_d
			},
			{
				icon = "csm_white_xmas",
				id = "pines",
				stage_id = "pines",
				add = debug_med_add,
				level = tweak_data.narrative.stages.pines
			},
			{
				icon = "csm_stealing_xmas",
				id = "moon",
				stage_id = "moon",
				add = debug_med_add,
				level = tweak_data.narrative.stages.moon
			},
			{
				add = 8,
				icon = "csm_brooklyn",
				id = "spa",
				stage_id = "spa",
				level = tweak_data.narrative.stages.spa
			},
			{
				add = 8,
				icon = "csm_santas_workshop",
				id = "cane",
				stage_id = "cane",
				level = tweak_data.narrative.stages.cane
			},
			{
				add = 8,
				icon = "csm_miami_2",
				id = "mia_2",
				stage_id = "mia_2",
				level = tweak_data.narrative.stages.mia_2
			},
			{
				icon = "csm_bex",
				id = "bex",
				stage_id = "bex",
				add = debug_med_add,
				level = tweak_data.narrative.stages.bex
			},
			{
				icon = "csm_sah",
				id = "sah",
				stage_id = "sah",
				add = debug_med_add,
				level = tweak_data.narrative.stages.sah
			}
		},
		{
			{
				add = 9,
				icon = "csm_sky",
				id = "pbr2",
				stage_id = "pbr2",
				level = tweak_data.narrative.stages.pbr2
			},
			{
				add = 9,
				icon = "csm_counterfeit",
				id = "pal",
				stage_id = "pal",
				level = tweak_data.narrative.stages.pal
			},
			{
				add = 12,
				icon = "csm_panic_room",
				id = "flat",
				stage_id = "flat",
				level = tweak_data.narrative.stages.flat
			},
			{
				icon = "csm_biker_1",
				id = "born",
				stage_id = "born",
				add = debug_long_add,
				level = tweak_data.narrative.stages.born
			},
			{
				add = 15,
				icon = "csm_hoxout_2",
				id = "hoxton_2",
				stage_id = "hox_2",
				level = tweak_data.narrative.stages.hox_2
			},
			{
				add = 10,
				icon = "csm_hoxout_1",
				id = "hoxton_1",
				stage_id = "hox_1",
				level = tweak_data.narrative.stages.hox_1
			},
			{
				add = 14,
				icon = "csm_bigoil_2",
				id = "bo_2",
				stage_id = "welcome_to_the_jungle_2",
				level = tweak_data.narrative.stages.welcome_to_the_jungle_2
			},
			{
				add = 10,
				icon = "csm_miami_1",
				id = "mia_1",
				stage_id = "mia_1",
				level = tweak_data.narrative.stages.mia_1
			},
			{
				add = 13,
				icon = "csm_rats_1",
				id = "cook_off",
				stage_id = "rat",
				level = tweak_data.narrative.stages.rat
			},
			{
				icon = "csm_mountain",
				id = "pbr",
				stage_id = "pbr",
				add = debug_long_add,
				level = tweak_data.narrative.stages.pbr
			},
			{
				add = 12,
				icon = "csm_glace",
				id = "glace",
				stage_id = "glace",
				level = tweak_data.narrative.stages.glace
			},
			{
				add = 12,
				icon = "csm_run",
				id = "run",
				stage_id = "run",
				level = tweak_data.narrative.stages.run
			},
			{
				icon = "csm_undercover",
				id = "man",
				stage_id = "man",
				add = debug_long_add,
				level = tweak_data.narrative.stages.man
			},
			{
				add = 12,
				icon = "csm_slaughterhouse",
				id = "dinner",
				stage_id = "dinner",
				level = tweak_data.narrative.stages.dinner
			},
			{
				add = 12,
				icon = "csm_aftershock",
				id = "jolly",
				stage_id = "jolly",
				level = tweak_data.narrative.stages.jolly
			},
			{
				icon = "csm_mad",
				id = "mad",
				stage_id = "mad",
				add = debug_long_add,
				level = tweak_data.narrative.stages.mad
			},
			{
				add = 12,
				icon = "csm_arena",
				id = "arena",
				stage_id = "arena",
				level = tweak_data.narrative.stages.arena
			}
		}
	}
end

function CrimeSpreeTweakData:init_modifiers(tweak_data)
	local health_increase = 25
	local damage_increase = 25

	self.max_modifiers_displayed = 3
	self.modifier_levels = {
		forced = 50,
		loud = 20,
		stealth = 26
	}
	self.modifiers = {
		forced = {
			{
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				id = "damage_health_1",
				level = 50,
				data = {
					health = {
						20,
						"add"
					},
					damage = {
						15,
						"add"
					}
				}
			}
		},
		loud = {
			{
				class = "ModifierShieldReflect",
				icon = "crime_spree_shield_reflect",
				id = "shield_reflect",
				data = {}
			},
			{
				class = "ModifierCloakerKick",
				icon = "crime_spree_cloaker_smoke",
				id = "cloaker_smoke",
				data = {
					effect = {
						"smoke",
						"none"
					}
				}
			},
			{
				class = "ModifierHealSpeed",
				icon = "crime_spree_medic_speed",
				id = "medic_heal_1",
				data = {
					speed = {
						20,
						"add"
					}
				}
			},
			{
				class = "ModifierNoHurtAnims",
				icon = "crime_spree_no_hurt",
				id = "no_hurt",
				data = {}
			},
			{
				class = "ModifierTaserOvercharge",
				icon = "crime_spree_taser_overcharge",
				id = "taser_overcharge",
				data = {
					speed = {
						50,
						"add"
					}
				}
			},
			{
				class = "ModifierHeavies",
				icon = "crime_spree_heavies",
				id = "heavies",
				data = {}
			},
			{
				class = "ModifierMoreMedics",
				icon = "crime_spree_more_medics",
				id = "medic_1",
				data = {
					inc = {
						2,
						"add"
					}
				}
			},
			{
				class = "ModifierHeavySniper",
				icon = "crime_spree_heavy_sniper",
				id = "heavy_sniper",
				data = {
					spawn_chance = {
						5,
						"add"
					}
				}
			},
			{
				class = "ModifierDozerRage",
				icon = "crime_spree_dozer_rage",
				id = "dozer_rage",
				data = {
					damage = {
						100,
						"add"
					}
				}
			},
			{
				class = "ModifierCloakerTearGas",
				icon = "crime_spree_cloaker_tear_gas",
				id = "cloaker_tear_gas",
				data = {
					diameter = {
						4,
						"none"
					},
					damage = {
						30,
						"none"
					},
					duration = {
						10,
						"none"
					}
				}
			},
			{
				class = "ModifierMoreDozers",
				icon = "crime_spree_more_dozers",
				id = "dozer_1",
				data = {
					inc = {
						2,
						"add"
					}
				}
			},
			{
				class = "ModifierHealSpeed",
				icon = "crime_spree_medic_speed",
				id = "medic_heal_2",
				data = {
					speed = {
						20,
						"add"
					}
				}
			},
			{
				class = "ModifierSkulldozers",
				icon = "crime_spree_dozer_lmg",
				id = "dozer_lmg",
				data = {}
			},
			{
				class = "ModifierMedicAdrenaline",
				icon = "crime_spree_medic_adrenaline",
				id = "medic_adrenaline",
				data = {
					damage = {
						100,
						"add"
					}
				}
			},
			{
				class = "ModifierShieldPhalanx",
				icon = "crime_spree_shield_phalanx",
				id = "shield_phalanx",
				data = {}
			},
			{
				class = "ModifierMoreDozers",
				icon = "crime_spree_more_dozers",
				id = "dozer_2",
				data = {
					inc = {
						2,
						"add"
					}
				}
			},
			{
				class = "ModifierMedicDeathwish",
				icon = "crime_spree_medic_deathwish",
				id = "medic_deathwish",
				data = {}
			},
			{
				class = "ModifierDozerMinigun",
				icon = "crime_spree_dozer_minigun",
				id = "dozer_minigun",
				data = {}
			},
			{
				class = "ModifierMoreMedics",
				icon = "crime_spree_more_medics",
				id = "medic_2",
				data = {
					inc = {
						2,
						"add"
					}
				}
			},
			{
				class = "ModifierExplosionImmunity",
				icon = "crime_spree_dozer_explosion",
				id = "dozer_immunity",
				data = {}
			},
			{
				class = "ModifierDozerMedic",
				icon = "crime_spree_dozer_medic",
				id = "dozer_medic",
				data = {}
			},
			{
				class = "ModifierAssaultExtender",
				icon = "crime_spree_assault_extender",
				id = "assault_extender",
				data = {
					duration = {
						50,
						"add"
					},
					spawn_pool = {
						50,
						"add"
					},
					deduction = {
						4,
						"add"
					},
					max_hostages = {
						8,
						"none"
					}
				}
			},
			{
				class = "ModifierCloakerArrest",
				icon = "crime_spree_cloaker_arrest",
				id = "cloaker_arrest",
				data = {}
			},
			{
				class = "ModifierMedicRage",
				icon = "crime_spree_medic_rage",
				id = "medic_rage",
				data = {
					damage = {
						20,
						"add"
					}
				}
			}
		},
		stealth = {
			{
				class = "ModifierLessPagers",
				icon = "crime_spree_pager",
				id = "pagers_1",
				level = 26,
				data = {
					count = {
						1,
						"max"
					}
				}
			},
			{
				class = "ModifierCivilianAlarm",
				icon = "crime_spree_civs_killed",
				id = "civs_1",
				level = 26,
				data = {
					count = {
						10,
						"min"
					}
				}
			},
			{
				class = "ModifierLessConcealment",
				icon = "crime_spree_concealment",
				id = "conceal_1",
				level = 26,
				data = {
					conceal = {
						3,
						"add"
					}
				}
			},
			{
				class = "ModifierCivilianAlarm",
				icon = "crime_spree_civs_killed",
				id = "civs_2",
				level = 52,
				data = {
					count = {
						7,
						"min"
					}
				}
			},
			{
				class = "ModifierLessPagers",
				icon = "crime_spree_pager",
				id = "pagers_2",
				level = 78,
				data = {
					count = {
						2,
						"max"
					}
				}
			},
			{
				class = "ModifierLessConcealment",
				icon = "crime_spree_concealment",
				id = "conceal_2",
				level = 104,
				data = {
					conceal = {
						3,
						"add"
					}
				}
			},
			{
				class = "ModifierLessPagers",
				icon = "crime_spree_pager",
				id = "pagers_3",
				level = 130,
				data = {
					count = {
						3,
						"max"
					}
				}
			},
			{
				class = "ModifierCivilianAlarm",
				icon = "crime_spree_civs_killed",
				id = "civs_3",
				level = 156,
				data = {
					count = {
						4,
						"min"
					}
				}
			},
			{
				class = "ModifierLessPagers",
				icon = "crime_spree_pager",
				id = "pagers_4",
				level = 182,
				data = {
					count = {
						4,
						"max"
					}
				}
			}
		}
	}
	self.repeating_modifiers = {
		forced = {
			{
				class = "ModifierEnemyHealthAndDamage",
				icon = "crime_spree_health",
				id = "damage_health_rpt_",
				level = 5,
				data = {
					health = {
						20,
						"add"
					},
					damage = {
						15,
						"add"
					}
				}
			}
		}
	}
end

function CrimeSpreeTweakData:get_reward_icon(reward)
	for _, data in ipairs(self.rewards) do
		if data.id == reward then
			return data.icon
		end
	end

	return tweak_data.lootdrop.type_to_card_fallback
end

function CrimeSpreeTweakData:init_rewards(tweak_data)
	self.loot_drop_reward_pay_class = 40

	local offshore_rate = tweak_data.money_manager.offshore_rate

	self.rewards = {
		{
			always_show = true,
			amount = 20000,
			card_inc = 200000,
			icon = "upcard_xp",
			id = "experience",
			max_cards = 10,
			name_id = "menu_challenge_xp_drop"
		},
		{
			always_show = true,
			amount = 400000,
			card_inc = 4000000,
			cash_string = "$",
			icon = "upcard_cash",
			id = "cash",
			max_cards = 10,
			name_id = "menu_challenge_cash_drop"
		},
		{
			amount = 0.4,
			card_inc = 4,
			icon = "upcard_coins",
			id = "continental_coins",
			max_cards = 5,
			name_id = "menu_cs_coins"
		},
		{
			amount = 0.2,
			card_inc = 5,
			icon = "upcard_random",
			id = "loot_drop",
			max_cards = 5,
			name_id = "menu_challenge_loot_drop"
		},
		{
			amount = 0.007,
			card_inc = 1,
			icon = "upcard_cosmetic",
			id = "random_cosmetic",
			max_cards = 5,
			name_id = "menu_challenge_cosmetic_drop"
		}
	}
	self.all_cosmetics_reward = {
		amount = 6,
		type = "continental_coins"
	}
	self.cosmetic_rewards = {
		{
			id = "cvc_green",
			type = "armor"
		},
		{
			id = "cvc_black",
			type = "armor"
		},
		{
			id = "cvc_grey",
			type = "armor"
		},
		{
			id = "cvc_tan",
			type = "armor"
		},
		{
			id = "cvc_navy_blue",
			type = "armor"
		},
		{
			id = "drm_tree_stump",
			type = "armor"
		},
		{
			id = "drm_gray_raider",
			type = "armor"
		},
		{
			id = "drm_desert_twilight",
			type = "armor"
		},
		{
			id = "drm_navy_breeze",
			type = "armor"
		},
		{
			id = "drm_woodland_tech",
			type = "armor"
		},
		{
			id = "drm_khaki_eclipse",
			type = "armor"
		},
		{
			id = "drm_desert_tech",
			type = "armor"
		},
		{
			id = "drm_misted_grey",
			type = "armor"
		},
		{
			id = "drm_khaki_regular",
			type = "armor"
		},
		{
			id = "drm_somber_woodland",
			type = "armor"
		},
		{
			id = "color_anv_04",
			type = "weapon_skins"
		},
		{
			id = "color_anv_05",
			type = "weapon_skins"
		}
	}
end

function CrimeSpreeTweakData:init_gage_assets(tweak_data)
	local asset_cost = 18

	self.max_assets_unlocked = 4
	self.assets = {}
	self.assets.increased_health = {}
	self.assets.increased_health.name_id = "menu_cs_ga_increased_health"
	self.assets.increased_health.unlock_desc_id = "menu_cs_ga_increased_health_desc"
	self.assets.increased_health.icon = "csb_health"
	self.assets.increased_health.cost = asset_cost
	self.assets.increased_health.data = {
		health = 10
	}
	self.assets.increased_health.class = "GageModifierMaxHealth"
	self.assets.increased_armor = {}
	self.assets.increased_armor.name_id = "menu_cs_ga_increased_armor"
	self.assets.increased_armor.unlock_desc_id = "menu_cs_ga_increased_armor_desc"
	self.assets.increased_armor.icon = "csb_armor"
	self.assets.increased_armor.cost = asset_cost
	self.assets.increased_armor.data = {
		armor = 10
	}
	self.assets.increased_armor.class = "GageModifierMaxArmor"
	self.assets.increased_stamina = {}
	self.assets.increased_stamina.name_id = "menu_cs_ga_increased_stamina"
	self.assets.increased_stamina.unlock_desc_id = "menu_cs_ga_increased_stamina_desc"
	self.assets.increased_stamina.icon = "csb_stamina"
	self.assets.increased_stamina.cost = asset_cost
	self.assets.increased_stamina.data = {
		stamina = 100
	}
	self.assets.increased_stamina.class = "GageModifierMaxStamina"
	self.assets.increased_ammo = {}
	self.assets.increased_ammo.name_id = "menu_cs_ga_increased_ammo"
	self.assets.increased_ammo.unlock_desc_id = "menu_cs_ga_increased_ammo_desc"
	self.assets.increased_ammo.icon = "csb_ammo"
	self.assets.increased_ammo.cost = asset_cost
	self.assets.increased_ammo.data = {
		ammo = 15
	}
	self.assets.increased_ammo.class = "GageModifierMaxAmmo"
	self.assets.increased_lives = {}
	self.assets.increased_lives.name_id = "menu_cs_ga_increased_lives"
	self.assets.increased_lives.unlock_desc_id = "menu_cs_ga_increased_lives_desc"
	self.assets.increased_lives.icon = "csb_lives"
	self.assets.increased_lives.cost = asset_cost
	self.assets.increased_lives.data = {
		lives = 1
	}
	self.assets.increased_lives.class = "GageModifierMaxLives"
	self.assets.increased_throwables = {}
	self.assets.increased_throwables.name_id = "menu_cs_ga_increased_throwables"
	self.assets.increased_throwables.unlock_desc_id = "menu_cs_ga_increased_throwables_desc"
	self.assets.increased_throwables.icon = "csb_throwables"
	self.assets.increased_throwables.cost = asset_cost
	self.assets.increased_throwables.data = {
		throwables = 70
	}
	self.assets.increased_throwables.class = "GageModifierMaxThrowables"
	self.assets.increased_deployables = {}
	self.assets.increased_deployables.name_id = "menu_cs_ga_increased_deployables"
	self.assets.increased_deployables.unlock_desc_id = "menu_cs_ga_increased_deployables_desc"
	self.assets.increased_deployables.icon = "csb_deployables"
	self.assets.increased_deployables.cost = asset_cost
	self.assets.increased_deployables.data = {
		deployables = 50
	}
	self.assets.increased_deployables.class = "GageModifierMaxDeployables"
	self.assets.increased_absorption = {}
	self.assets.increased_absorption.name_id = "menu_cs_ga_increased_absorption"
	self.assets.increased_absorption.unlock_desc_id = "menu_cs_ga_increased_absorption_desc"
	self.assets.increased_absorption.icon = "csb_absorb"
	self.assets.increased_absorption.cost = asset_cost
	self.assets.increased_absorption.data = {
		absorption = 0.5
	}
	self.assets.increased_absorption.class = "GageModifierDamageAbsorption"
	self.assets.quick_reload = {}
	self.assets.quick_reload.name_id = "menu_cs_ga_quick_reload"
	self.assets.quick_reload.unlock_desc_id = "menu_cs_ga_quick_reload_desc"
	self.assets.quick_reload.icon = "csb_reload"
	self.assets.quick_reload.cost = asset_cost
	self.assets.quick_reload.data = {
		speed = 25
	}
	self.assets.quick_reload.class = "GageModifierQuickReload"
	self.assets.quick_switch = {}
	self.assets.quick_switch.name_id = "menu_cs_ga_quick_switch"
	self.assets.quick_switch.unlock_desc_id = "menu_cs_ga_quick_switch_desc"
	self.assets.quick_switch.icon = "csb_switch"
	self.assets.quick_switch.cost = asset_cost
	self.assets.quick_switch.data = {
		speed = 50
	}
	self.assets.quick_switch.class = "GageModifierQuickSwitch"
	self.assets.melee_invulnerability = {}
	self.assets.melee_invulnerability.name_id = "menu_cs_ga_melee_invulnerability"
	self.assets.melee_invulnerability.unlock_desc_id = "menu_cs_ga_melee_invulnerability_desc"
	self.assets.melee_invulnerability.icon = "csb_melee"
	self.assets.melee_invulnerability.cost = asset_cost
	self.assets.melee_invulnerability.data = {
		time = 5
	}
	self.assets.melee_invulnerability.class = "GageModifierMeleeInvincibility"
	self.assets.explosion_immunity = {}
	self.assets.explosion_immunity.name_id = "menu_cs_ga_explosion_immunity"
	self.assets.explosion_immunity.unlock_desc_id = "menu_cs_ga_explosion_immunity_desc"
	self.assets.explosion_immunity.icon = "csb_explosion"
	self.assets.explosion_immunity.cost = asset_cost
	self.assets.explosion_immunity.data = {}
	self.assets.explosion_immunity.class = "GageModifierExplosionImmunity"
	self.assets.life_steal = {}
	self.assets.life_steal.name_id = "menu_cs_ga_life_steal"
	self.assets.life_steal.unlock_desc_id = "menu_cs_ga_life_steal_desc"
	self.assets.life_steal.icon = "csb_lifesteal"
	self.assets.life_steal.cost = asset_cost
	self.assets.life_steal.data = {
		armor_restored = 0.05,
		cooldown = 5,
		health_restored = 0.05
	}
	self.assets.life_steal.class = "GageModifierLifeSteal"
	self.assets.quick_pagers = {}
	self.assets.quick_pagers.name_id = "menu_cs_ga_quick_pagers"
	self.assets.quick_pagers.unlock_desc_id = "menu_cs_ga_quick_pagers_desc"
	self.assets.quick_pagers.icon = "csb_pagers"
	self.assets.quick_pagers.cost = asset_cost
	self.assets.quick_pagers.data = {
		speed = 50
	}
	self.assets.quick_pagers.stealth = true
	self.assets.quick_pagers.class = "GageModifierQuickPagers"
	self.assets.increased_body_bags = {}
	self.assets.increased_body_bags.name_id = "menu_cs_ga_increased_body_bags"
	self.assets.increased_body_bags.unlock_desc_id = "menu_cs_ga_increased_body_bags_desc"
	self.assets.increased_body_bags.icon = "csb_bodybags"
	self.assets.increased_body_bags.cost = asset_cost
	self.assets.increased_body_bags.data = {
		bags = 2
	}
	self.assets.increased_body_bags.stealth = true
	self.assets.increased_body_bags.class = "GageModifierMaxBodyBags"
	self.assets.quick_locks = {}
	self.assets.quick_locks.name_id = "menu_cs_ga_quick_locks"
	self.assets.quick_locks.unlock_desc_id = "menu_cs_ga_quick_locks_desc"
	self.assets.quick_locks.icon = "csb_locks"
	self.assets.quick_locks.cost = asset_cost
	self.assets.quick_locks.data = {
		speed = 25
	}
	self.assets.quick_locks.stealth = true
	self.assets.quick_locks.class = "GageModifierQuickLocks"
end

function CrimeSpreeTweakData:init_gui(tweak_data)
	self.gui = {}
	self.gui.randomize_time = {
		1.25,
		2.5
	}
	self.gui.spin_speed = 800
	self.gui.spin_speed_limit = {
		80,
		1000
	}
	self.gui.max_chat_lines = {
		lobby = 11,
		preplanning = 11
	}
	self.gui.missions_displayed = 3
	self.gui.modifiers_before_scroll = 7
end

function CrimeSpreeTweakData:get_mission_type_from_index(index)
	return index
end

function CrimeSpreeTweakData:get_index_from_id(level_id)
	if level_id then
		for i = 1, 3 do
			local mission_type = self:get_mission_type_from_index(i)

			for index, mission in ipairs(self.missions[mission_type]) do
				if mission.id == level_id then
					local merged_index = i * 100 + index

					return merged_index
				end
			end
		end
	else
		return -1
	end
end

function CrimeSpreeTweakData:get_id_from_index(merged_index)
	local index_has_data = merged_index > 100

	if index_has_data then
		local mission_type = self:get_mission_type_from_index(math.floor(merged_index / 100))
		local mission_index = merged_index % 100
		local mission_id = self.missions[mission_type][mission_index].id

		return mission_id
	else
		return -1
	end
end
