EventJobsTweakData = EventJobsTweakData or class()

function EventJobsTweakData:init(tweak_data)
	self.challenges = {}

	self:_init_pda8_challenges(tweak_data)
	self:_init_pda9_challenges(tweak_data)
	self:_init_cg22_challenges(tweak_data)
	self:_init_pda10_challenges(tweak_data)
	self:_init_community_challenges(tweak_data)

	self.event_info = {
		pda8 = {
			steam_stages = {
				false,
				"pda_stat_a",
				"pda_stat_b",
				"pda_stat_c",
				"pda_stat_d"
			}
		},
		pda9 = {
			stage_offset = 1
		},
		cg22 = {
			stage_offset = 1
		},
		pda10 = {
			stage_offset = 1
		}
	}
	self.collective_stats = {
		pda8_collective = {
			found = {},
			all = {
				"pda8_item_1",
				"pda8_item_2",
				"pda8_item_3",
				"pda8_item_4",
				"pda8_item_5",
				"pda8_item_6",
				"pda8_item_7",
				"pda8_item_8"
			}
		},
		pda9_collective_1 = {
			found = {},
			all = {}
		},
		pda9_collective_2 = {
			found = {},
			all = {}
		},
		pda9_collective_3 = {
			found = {},
			all = {}
		},
		pda9_collective_4 = {
			found = {},
			all = {}
		}
	}

	for _, job_id in ipairs(tweak_data.mutators.piggybank.event_jobs_from_level) do
		table.insert(self.collective_stats.pda9_collective_1.all, "pda9_collective_1_" .. job_id)
		table.insert(self.collective_stats.pda9_collective_2.all, "pda9_collective_2_" .. job_id)
		table.insert(self.collective_stats.pda9_collective_3.all, "pda9_collective_3_" .. job_id)
		table.insert(self.collective_stats.pda9_collective_4.all, "pda9_collective_4_" .. job_id)
	end

	self.pda_base = 0
end

function EventJobsTweakData:_init_pda8_challenges(tweak_data)
	table.insert(self.challenges, {
		desc_id = "menu_pda8_2_desc",
		global_value = "pda8",
		id = "pda8_2",
		locked_id = "bm_menu_locked_pda8_2",
		name_id = "menu_pda8_2",
		reward_id = "menu_pda8_2_reward",
		show_progress = true,
		objectives = {
			self:_collective("pda8_collective", 4, {
				desc_id = "menu_pda8_2_prog_obj_desc",
				name_id = "menu_pda8_2_prog_obj"
			}),
			self:_stage("pda8_stages", 1, {
				desc_id = "",
				name_id = "menu_pda8_2_track_obj",
				stages = {
					2,
					3,
					4,
					5
				}
			})
		},
		rewards = {
			{
				item_entry = "jesterstripe",
				type_items = "gloves"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda8_3_desc",
		global_value = "pda8",
		id = "pda8_3",
		locked_id = "bm_menu_locked_pda8_3",
		name_id = "menu_pda8_3",
		reward_id = "menu_pda8_3_reward",
		show_progress = true,
		objectives = {
			self:_collective("pda8_collective", 6, {
				desc_id = "menu_pda8_3_prog_obj_desc",
				name_id = "menu_pda8_3_prog_obj"
			}),
			self:_stage("pda8_stages", 1, {
				desc_id = "",
				name_id = "menu_pda8_3_track_obj",
				stages = {
					3,
					4,
					5
				}
			})
		},
		rewards = {
			{
				item_entry = "baron",
				type_items = "player_styles"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda8_4_desc",
		global_value = "pda8",
		id = "pda8_4",
		locked_id = "bm_menu_locked_pda8_4",
		name_id = "menu_pda8_4",
		reward_id = "menu_pda8_4_reward",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("pda8_item_1", 1, {
				desc_id = "menu_pda8_item_1_desc",
				name_id = "menu_pda8_item_1"
			}),
			tweak_data.safehouse:_progress("pda8_item_2", 1, {
				desc_id = "",
				name_id = "menu_pda8_item_2"
			}),
			tweak_data.safehouse:_progress("pda8_item_3", 1, {
				desc_id = "",
				name_id = "menu_pda8_item_3"
			}),
			tweak_data.safehouse:_progress("pda8_item_4", 1, {
				desc_id = "",
				name_id = "menu_pda8_item_4"
			}),
			tweak_data.safehouse:_progress("pda8_item_5", 1, {
				desc_id = "",
				name_id = "menu_pda8_item_5"
			}),
			tweak_data.safehouse:_progress("pda8_item_6", 1, {
				desc_id = "",
				name_id = "menu_pda8_item_6"
			}),
			tweak_data.safehouse:_progress("pda8_item_7", 1, {
				desc_id = "",
				name_id = "menu_pda8_item_7"
			}),
			tweak_data.safehouse:_progress("pda8_item_8", 1, {
				desc_id = "",
				name_id = "menu_pda8_item_8"
			}),
			self:_stage("pda8_stages", 1, {
				desc_id = "",
				name_id = "menu_pda8_4_track_obj",
				stages = {
					4,
					5
				}
			})
		},
		rewards = {
			{
				amount = 1,
				item_entry = "eighthgrin",
				type_items = "masks"
			}
		}
	})
end

function EventJobsTweakData:_init_pda9_challenges(tweak_data)
	table.insert(self.challenges, {
		desc_id = "menu_pda9_1_desc",
		id = "pda9_1",
		locked_id = "bm_menu_locked_pda9_1",
		name_id = "menu_pda9_1",
		reward_id = "menu_pda9_1_reward",
		show_progress = true,
		temp_challenge = "PDA9",
		objectives = {
			self:_collective("pda9_collective_1", 2, {
				desc_id = "menu_pda9_item_1_desc",
				name_id = "menu_pda9_item_2"
			})
		},
		rewards = {
			{
				item_entry = "xp_pda9_1",
				type_items = "xp"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda9_2_desc",
		id = "pda9_2",
		locked_id = "bm_menu_locked_pda9_2",
		name_id = "menu_pda9_2",
		reward_id = "menu_pda9_2_reward",
		show_progress = true,
		temp_challenge = "PDA9",
		objectives = {
			self:_collective("pda9_collective_2", 3, {
				desc_id = "menu_pda9_item_2_desc",
				name_id = "menu_pda9_item_2"
			})
		},
		rewards = {
			{
				item_entry = "xp_pda9_1",
				type_items = "xp"
			},
			{
				item_entry = "xp_pda9_1",
				type_items = "xp"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda9_3_desc",
		id = "pda9_3",
		locked_id = "bm_menu_locked_pda9_3",
		name_id = "menu_pda9_3",
		reward_id = "menu_pda9_3_reward",
		show_progress = true,
		temp_challenge = "PDA9",
		objectives = {
			self:_collective("pda9_collective_3", 6, {
				desc_id = "menu_pda9_item_3_desc",
				name_id = "menu_pda9_item_3"
			})
		},
		rewards = {
			{
				item_entry = "xp_pda9_2",
				type_items = "xp"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda9_4_desc",
		id = "pda9_4",
		locked_id = "bm_menu_locked_pda9_4",
		name_id = "menu_pda9_4",
		reward_id = "menu_pda9_4_reward",
		show_progress = true,
		temp_challenge = "PDA9",
		objectives = {
			self:_collective("pda9_collective_4", 10, {
				desc_id = "menu_pda9_item_4_desc",
				name_id = "menu_pda9_item_4"
			})
		},
		rewards = {
			{
				item_entry = "xp_pda9_2",
				type_items = "xp"
			},
			{
				item_entry = "xp_pda9_2",
				type_items = "xp"
			},
			{
				item_entry = "xp_pda9_2",
				type_items = "xp"
			},
			{
				item_entry = "xp_pda9_2",
				type_items = "xp"
			},
			{
				item_entry = "xp_pda9_2",
				type_items = "xp"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda9_community_1_desc",
		global_value = "pda9",
		id = "pda9_community_1",
		locked_id = "bm_menu_locked_pda9_community_1",
		name_id = "menu_pda9_community_1",
		reward_id = "menu_pda9_community_1_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda9_piggy_stage_1", 1, {
					desc_id = "",
					name_id = "menu_pda9_item_1"
				}),
				tweak_data.safehouse:_progress("pda9_n1", 1, {
					desc_id = "menu_pda9_item_n1_desc",
					name_id = "menu_pda9_item_n1"
				})
			}, 1, {
				choice_id = "pda9_community_1",
				desc_id = "",
				name_id = "menu_pda9_1_choice_obj"
			}),
			self:_stage("pda9_stages", 1, {
				desc_id = "menu_pda9_community_item_1_desc",
				name_id = "menu_pda9_1_track_obj",
				stages = {
					2,
					3,
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "leatherspark",
				type_items = "gloves"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda9_community_2_desc",
		global_value = "pda9",
		id = "pda9_community_2",
		locked_id = "bm_menu_locked_pda9_community_2",
		name_id = "menu_pda9_community_2",
		reward_id = "menu_pda9_community_2_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda9_piggy_stage_2", 1, {
					desc_id = "",
					name_id = "menu_pda9_item_1"
				}),
				tweak_data.safehouse:_progress("pda9_n2", 99, {
					desc_id = "menu_pda9_item_n2_desc",
					name_id = "menu_pda9_item_n2"
				})
			}, 1, {
				choice_id = "pda9_community_2",
				desc_id = "",
				name_id = "menu_pda9_2_choice_obj"
			}),
			self:_stage("pda9_stages", 1, {
				desc_id = "menu_pda9_community_item_2_desc",
				name_id = "menu_pda9_1_track_obj",
				stages = {
					3,
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "moneysuit",
				type_items = "player_styles"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda9_community_3_desc",
		global_value = "pda9",
		id = "pda9_community_3",
		locked_id = "bm_menu_locked_pda9_community_3",
		name_id = "menu_pda9_community_3",
		reward_id = "menu_pda9_community_3_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda9_piggy_stage_1", 6, {
					desc_id = "",
					name_id = "menu_pda9_item_2"
				}),
				tweak_data.safehouse:_progress("pda9_n3", 99, {
					desc_id = "menu_pda9_item_n3_desc",
					name_id = "menu_pda9_item_n3"
				})
			}, 1, {
				choice_id = "pda9_community_3",
				desc_id = "",
				name_id = "menu_pda9_3_choice_obj"
			}),
			self:_stage("pda9_stages", 1, {
				desc_id = "menu_pda9_community_item_3_desc",
				name_id = "menu_pda9_1_track_obj",
				stages = {
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "skulldia",
				type_items = "masks"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda9_community_4_desc",
		global_value = "pda9",
		id = "pda9_community_4",
		locked_id = "bm_menu_locked_pda9_community_4",
		name_id = "menu_pda9_community_4",
		reward_id = "menu_pda9_community_4_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				self:_collective("pda9_collective_1", 1, {
					desc_id = "menu_pda9_community_objective_1_desc",
					name_id = "menu_pda9_community_objective_1"
				}),
				tweak_data.safehouse:_progress("pda9_n4", 99, {
					desc_id = "menu_pda9_item_n4_desc",
					name_id = "menu_pda9_item_n4"
				})
			}, 1, {
				choice_id = "pda9_community_4",
				desc_id = "",
				name_id = "menu_pda9_4_choice_obj"
			}),
			self:_stage("pda9_stages", 1, {
				desc_id = "menu_pda9_community_item_4_desc",
				name_id = "menu_pda9_1_track_obj",
				stages = {
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				type_items = "suit_variations",
				item_entry = {
					"moneysuit",
					"gold"
				}
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda9_community_5_desc",
		global_value = "pda9",
		id = "pda9_community_5",
		locked_id = "bm_menu_locked_pda9_community_5",
		name_id = "menu_pda9_community_5",
		reward_id = "menu_pda9_community_5_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				self:_collective("pda9_collective_1", 1, {
					desc_id = "menu_pda9_community_objective_2_desc",
					name_id = "menu_pda9_community_objective_1"
				}),
				tweak_data.safehouse:_progress("pda9_n5", 9, {
					desc_id = "menu_pda9_item_n5_desc",
					name_id = "menu_pda9_item_n5"
				})
			}, 1, {
				choice_id = "pda9_community_5",
				desc_id = "",
				name_id = "menu_pda9_5_choice_obj"
			}),
			self:_stage("pda9_stages", 1, {
				desc_id = "menu_pda9_community_item_5_desc",
				name_id = "menu_pda9_1_track_obj",
				stages = {
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "megaskulldia",
				type_items = "masks"
			}
		}
	})
end

function EventJobsTweakData:_init_cg22_challenges(tweak_data)
	table.insert(self.challenges, {
		desc_id = "menu_cg22_1_desc",
		id = "cg22_1",
		locked_id = "bm_menu_locked_cg22_1",
		name_id = "menu_cg22_1",
		reward_id = "menu_cg22_1_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_personal_1", 100, {
					desc_id = "menu_cg22_personal_1_desc",
					name_id = "menu_cg22_personal_1"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_1", 2000, {
					desc_id = "menu_cg22_post_objective_1_desc",
					name_id = "menu_cg22_post_objective_1"
				})
			}, 1, {
				choice_id = "cg22_personal_1",
				desc_id = "menu_cg22_post_objective_1_desc",
				name_id = "menu_cg22_1_choice_obj"
			})
		},
		rewards = {
			{
				item_entry = "victor",
				type_items = "upgrades"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_cg22_2_desc",
		id = "cg22_2",
		locked_id = "bm_menu_locked_cg22_2",
		name_id = "menu_cg22_2",
		reward_id = "menu_cg22_2_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_personal_2", 500, {
					desc_id = "menu_cg22_personal_2_desc",
					name_id = "menu_cg22_personal_2"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_2", 150, {
					desc_id = "menu_cg22_post_objective_2_desc",
					name_id = "menu_cg22_post_objective_2"
				})
			}, 1, {
				choice_id = "cg22_personal_2",
				desc_id = "menu_cg22_post_objective_2_desc",
				name_id = "menu_cg22_2_choice_obj"
			})
		},
		rewards = {
			{
				item_entry = "wpn_fps_m4_uupg_s_zulu",
				type_items = "weapon_mods"
			},
			{
				item_entry = "wpn_fps_snp_victor_s_mod0",
				type_items = "weapon_mods"
			},
			{
				item_entry = "wpn_fps_snp_victor_g_mod3",
				type_items = "weapon_mods"
			},
			{
				item_entry = "wpn_fps_snp_victor_o_standard",
				type_items = "weapon_mods"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_cg22_3_desc",
		id = "cg22_3",
		locked_id = "bm_menu_locked_cg22_3",
		name_id = "menu_cg22_3",
		reward_id = "menu_cg22_3_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_personal_3", 150, {
					desc_id = "menu_cg22_personal_3_desc",
					name_id = "menu_cg22_personal_3"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_3", 1000, {
					desc_id = "menu_cg22_post_objective_3_desc",
					name_id = "menu_cg22_post_objective_3"
				})
			}, 1, {
				choice_id = "cg22_personal_3",
				desc_id = "menu_cg22_post_objective_3_desc",
				name_id = "menu_cg22_3_choice_obj"
			})
		},
		rewards = {
			{
				item_entry = "wpn_fps_snp_victor_sbr_kit",
				type_items = "weapon_mods"
			},
			{
				item_entry = "wpn_fps_snp_victor_ns_omega",
				type_items = "weapon_mods"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_cg22_community_1_desc",
		id = "cg22_community_1",
		locked_id = "bm_menu_locked_cg22_community_1",
		name_id = "menu_cg22_community_1",
		reward_id = "menu_cg22_community_1_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_secure_objective", 3, {
					desc_id = "menu_cg22_item_1_desc",
					name_id = "menu_cg22_item_1"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_4", 20, {
					desc_id = "menu_cg22_post_objective_4_desc",
					name_id = "menu_cg22_post_objective_4"
				})
			}, 1, {
				choice_id = "cg22_community_1",
				desc_id = "menu_cg22_post_objective_4_desc",
				name_id = "menu_cg22_4_choice_obj"
			}),
			self:_stage("cg22_stages", 1, {
				desc_id = "menu_cg22_community_item_1_desc",
				name_id = "menu_cg22_1_track_obj",
				stages = {
					2,
					3,
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "elfsuit",
				type_items = "player_styles"
			},
			{
				item_entry = "wpn_fps_upg_charm_teddymoo",
				type_items = "weapon_mods"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_cg22_community_2_desc",
		id = "cg22_community_2",
		locked_id = "bm_menu_locked_cg22_community_2",
		name_id = "menu_cg22_community_2",
		reward_id = "menu_cg22_community_2_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_sacrifice_objective", 3, {
					desc_id = "menu_cg22_item_2_desc",
					name_id = "menu_cg22_item_2"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_5", 40, {
					desc_id = "menu_cg22_post_objective_5_desc",
					name_id = "menu_cg22_post_objective_5"
				})
			}, 1, {
				choice_id = "cg22_community_2",
				desc_id = "menu_cg22_post_objective_5_desc",
				name_id = "menu_cg22_5_choice_obj"
			}),
			self:_stage("cg22_stages", 1, {
				desc_id = "menu_cg22_community_item_2_desc",
				name_id = "menu_cg22_2_track_obj",
				stages = {
					3,
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				type_items = "suit_variations",
				item_entry = {
					"elfsuit",
					"red"
				}
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_cg22_community_3_desc",
		id = "cg22_community_3",
		locked_id = "bm_menu_locked_cg22_community_3",
		name_id = "menu_cg22_community_3",
		reward_id = "menu_cg22_community_3_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_snowman_objective", 1, {
					desc_id = "menu_cg22_item_3_desc",
					name_id = "menu_cg22_item_3"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_4", 100, {
					desc_id = "menu_cg22_post_objective_6_desc",
					name_id = "menu_cg22_post_objective_6"
				})
			}, 1, {
				choice_id = "cg22_community_3",
				desc_id = "menu_cg22_post_objective_6_desc",
				name_id = "menu_cg22_6_choice_obj"
			}),
			self:_stage("cg22_stages", 1, {
				desc_id = "menu_cg22_community_item_3_desc",
				name_id = "menu_cg22_3_track_obj",
				stages = {
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				type_items = "suit_variations",
				item_entry = {
					"elfsuit",
					"violet"
				}
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_cg22_community_4_desc",
		id = "cg22_community_4",
		locked_id = "bm_menu_locked_cg22_community_4",
		name_id = "menu_cg22_community_4",
		reward_id = "menu_cg22_community_4_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_sacrifice_objective", 30, {
					desc_id = "menu_cg22_item_2_desc",
					name_id = "menu_cg22_item_2"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_4", 250, {
					desc_id = "menu_cg22_post_objective_7_desc",
					name_id = "menu_cg22_post_objective_7"
				})
			}, 1, {
				choice_id = "cg22_community_4",
				desc_id = "menu_cg22_post_objective_7_desc",
				name_id = "menu_cg22_7_choice_obj"
			}),
			self:_stage("cg22_stages", 1, {
				desc_id = "menu_cg22_community_item_4_desc",
				name_id = "menu_cg22_4_track_obj",
				stages = {
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = 23,
				type_items = "perkdeck"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_cg22_community_5_desc",
		id = "cg22_community_5",
		locked_id = "bm_menu_locked_cg22_community_5",
		name_id = "menu_cg22_community_5",
		reward_id = "menu_cg22_community_5_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_snowman_objective", 10, {
					desc_id = "menu_cg22_item_3_desc",
					name_id = "menu_cg22_item_3"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_5", 200, {
					desc_id = "menu_cg22_post_objective_8_desc",
					name_id = "menu_cg22_post_objective_8"
				})
			}, 1, {
				choice_id = "cg22_community_5",
				desc_id = "menu_cg22_post_objective_8_desc",
				name_id = "menu_cg22_8_choice_obj"
			}),
			self:_stage("cg22_stages", 1, {
				desc_id = "menu_cg22_community_item_5_desc",
				name_id = "menu_cg22_5_track_obj",
				stages = {
					6,
					7
				}
			})
		},
		rewards = {
			{
				type_items = "suit_variations",
				item_entry = {
					"elfsuit",
					"yellow"
				}
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_cg22_community_6_desc",
		id = "cg22_community_6",
		locked_id = "bm_menu_locked_cg22_community_6",
		name_id = "menu_cg22_community_6",
		reward_id = "menu_cg22_community_6_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("cg22_secure_objective", 30, {
					desc_id = "menu_cg22_item_1_desc",
					name_id = "menu_cg22_item_1"
				}),
				tweak_data.safehouse:_progress("cg22_post_objective_4", 500, {
					desc_id = "menu_cg22_post_objective_9_desc",
					name_id = "menu_cg22_post_objective_9"
				})
			}, 1, {
				choice_id = "cg22_community_6",
				desc_id = "menu_cg22_post_objective_9_desc",
				name_id = "menu_cg22_9_choice_obj"
			}),
			self:_stage("cg22_stages", 1, {
				desc_id = "menu_cg22_community_item_6_desc",
				name_id = "menu_cg22_6_track_obj",
				stages = {
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "elfhat",
				type_items = "masks"
			},
			{
				item_entry = "elfhat_red",
				type_items = "masks"
			},
			{
				item_entry = "elfhat_yellow",
				type_items = "masks"
			},
			{
				item_entry = "elfhat_violet",
				type_items = "masks"
			}
		}
	})
end

function EventJobsTweakData:_init_pda10_challenges(tweak_data)
	table.insert(self.challenges, {
		desc_id = "menu_pda10_3_desc",
		id = "pda10_3",
		locked_id = "bm_menu_locked_pda10_3",
		name_id = "menu_pda10_3",
		reward_id = "menu_pda10_3_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda10_heist_objective", 2, {
					desc_id = "menu_pda10_personal_3_desc",
					name_id = "menu_pda10_personal_3"
				}),
				tweak_data.safehouse:_progress("pda10_heist_post_objective", 50, {
					desc_id = "menu_pda10_post_objective_3_desc",
					name_id = "menu_pda10_post_objective_3"
				})
			}, 1, {
				choice_id = "pda10_personal_3",
				desc_id = "menu_pda10_post_objective_3_desc",
				name_id = "menu_pda10_3_choice_obj"
			}),
			self:_stage("pda10_stages", 1, {
				desc_id = "menu_pda10_stage_3_desc",
				name_id = "menu_pda10_stage_3",
				stages = {
					2,
					3,
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "zoothat_black",
				type_items = "masks"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda10_5_desc",
		id = "pda10_5",
		locked_id = "bm_menu_locked_pda10_5",
		name_id = "menu_pda10_5",
		reward_id = "menu_pda10_5_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda10_musket_objective", 10, {
					desc_id = "menu_pda10_personal_5_desc",
					name_id = "menu_pda10_personal_5"
				}),
				tweak_data.safehouse:_progress("pda10_musket_post_objective", 100, {
					desc_id = "menu_pda10_post_objective_5_desc",
					name_id = "menu_pda10_post_objective_5"
				})
			}, 1, {
				choice_id = "pda10_personal_5",
				desc_id = "menu_pda10_post_objective_5_desc",
				name_id = "menu_pda10_5_choice_obj"
			}),
			self:_stage("pda10_stages", 1, {
				desc_id = "menu_pda10_stage_5_desc",
				name_id = "menu_pda10_stage_5",
				stages = {
					3,
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "tiger_red",
				type_items = "gloves"
			},
			{
				item_entry = "zoothat_red",
				type_items = "masks"
			},
			{
				item_entry = "gangzsta",
				type_items = "player_styles"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda10_2_desc",
		id = "pda10_2",
		locked_id = "bm_menu_locked_pda10_2",
		name_id = "menu_pda10_2",
		reward_id = "menu_pda10_2_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda10_bags_objective", 25, {
					desc_id = "menu_pda10_personal_2_desc",
					name_id = "menu_pda10_personal_2"
				}),
				tweak_data.safehouse:_progress("pda10_bags_post_objective", 100, {
					desc_id = "menu_pda10_post_objective_2_desc",
					name_id = "menu_pda10_post_objective_2"
				})
			}, 1, {
				choice_id = "pda10_personal_2",
				desc_id = "menu_pda10_post_objective_2_desc",
				name_id = "menu_pda10_2_choice_obj"
			}),
			self:_stage("pda10_stages", 1, {
				desc_id = "menu_pda10_stage_2_desc",
				name_id = "menu_pda10_stage_2",
				stages = {
					4,
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "zoothat_yellow",
				type_items = "masks"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda10_6_desc",
		id = "pda10_6",
		locked_id = "bm_menu_locked_pda10_6",
		name_id = "menu_pda10_6",
		reward_id = "menu_pda10_6_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda10_hammer_objective", 25, {
					desc_id = "menu_pda10_personal_6_desc",
					name_id = "menu_pda10_personal_6"
				}),
				tweak_data.safehouse:_progress("pda10_hammer_post_objective", 100, {
					desc_id = "menu_pda10_post_objective_6_desc",
					name_id = "menu_pda10_post_objective_6"
				})
			}, 1, {
				choice_id = "pda10_personal_6",
				desc_id = "menu_pda10_post_objective_6_desc",
				name_id = "menu_pda10_6_choice_obj"
			}),
			self:_stage("pda10_stages", 1, {
				desc_id = "menu_pda10_stage_6_desc",
				name_id = "menu_pda10_stage_6",
				stages = {
					5,
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "tiger_neon",
				type_items = "gloves"
			},
			{
				item_entry = "zoothat_blue",
				type_items = "masks"
			},
			{
				item_entry = "splitcrim",
				type_items = "masks"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda10_1_desc",
		id = "pda10_1",
		locked_id = "bm_menu_locked_pda10_1",
		name_id = "menu_pda10_1",
		reward_id = "menu_pda10_1_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda10_dozer_objective", 25, {
					desc_id = "menu_pda10_personal_1_desc",
					name_id = "menu_pda10_personal_1"
				}),
				tweak_data.safehouse:_progress("pda10_dozer_post_objective", 100, {
					desc_id = "menu_pda10_post_objective_1_desc",
					name_id = "menu_pda10_post_objective_1"
				})
			}, 1, {
				choice_id = "pda10_personal_1",
				desc_id = "menu_pda10_post_objective_1_desc",
				name_id = "menu_pda10_1_choice_obj"
			}),
			self:_stage("pda10_stages", 1, {
				desc_id = "menu_pda10_stage_1_desc",
				name_id = "menu_pda10_stage_1",
				stages = {
					6,
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "teddymoo",
				type_items = "masks"
			},
			{
				item_entry = "wpn_fps_pis_deagle_ck",
				type_items = "weapon_mods"
			},
			{
				type_items = "suit_variations",
				item_entry = {
					"thug",
					"gold"
				}
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_pda10_4_desc",
		id = "pda10_4",
		locked_id = "bm_menu_locked_pda10_4",
		name_id = "menu_pda10_4",
		reward_id = "menu_pda10_4_reward",
		show_progress = true,
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda10_buff_objective", 35, {
					desc_id = "menu_pda10_personal_4_desc",
					name_id = "menu_pda10_personal_4"
				}),
				tweak_data.safehouse:_progress("pda10_buff_post_objective", 100, {
					desc_id = "menu_pda10_post_objective_4_desc",
					name_id = "menu_pda10_post_objective_4"
				})
			}, 1, {
				choice_id = "pda10_personal_4",
				desc_id = "menu_pda10_post_objective_4_desc",
				name_id = "menu_pda10_4_choice_obj"
			}),
			self:_stage("pda10_stages", 1, {
				desc_id = "menu_pda10_stage_4_desc",
				name_id = "menu_pda10_stage_4",
				stages = {
					7
				}
			})
		},
		rewards = {
			{
				item_entry = "guldgris",
				type_items = "masks"
			},
			{
				item_entry = "wpn_fps_pis_g17_ck",
				type_items = "weapon_mods"
			},
			{
				type_items = "suit_variations",
				item_entry = {
					"sneak_suit",
					"camo"
				}
			}
		}
	})
end

function EventJobsTweakData:_init_community_challenges(tweak_data)
	self.community_challenges = {}
	self.community_challenges.pda9 = {
		url = "https://www.paydaythegame.com/ovk-media/redux/ninth-2yrgbaw/ninthstage.json",
		event_data = {
			pigs = "pigs",
			stage = "unlockstage"
		},
		event_over = {
			pigs = 20000000,
			unlockstage = 5
		}
	}
	self.community_challenges.cg22 = {
		url = "https://www.paydaythegame.com/ovk-media/redux/hl22-u3yhfbfaud/holiday22stage.json",
		event_data = {
			bags = "bags",
			stage = "unlockstage"
		},
		event_over = {
			bags = 6417206,
			unlockstage = 6
		}
	}
	self.community_challenges.pda10 = {
		url = "https://www.paydaythegame.com/ovk-media/redux/pd210-uty37awwutu63fa/piggybucks.json",
		event_data = {
			bags = "bucks",
			stage = "unlockstage"
		},
		event_over = {
			bucks = 21825945,
			unlockstage = 6
		}
	}
end

function EventJobsTweakData:_collective(collective_id, max_progress, data)
	data.collective_id = collective_id

	local save_values = {
		"achievement_id",
		"progress_id",
		"collective_id",
		"completed",
		"progress"
	}

	if data.save_values then
		for idx, value in ipairs(data.save_values) do
			table.insert(save_values, value)
		end
	end

	local obj = {
		completed = false,
		displayed = true,
		progress = 0,
		achievement_id = data.achievement_id,
		name_id = data.name_id,
		desc_id = data.desc_id,
		collective_id = collective_id,
		max_progress = data.collective_id and max_progress or 1,
		verify = data.verify,
		save_values = save_values
	}

	return obj
end

function EventJobsTweakData:_choice(challenge_choices, max_progress, data)
	local save_values = {
		"choice_id",
		"progress_id",
		"completed",
		"progress",
		"challenge_choices_saved_values"
	}

	if data.save_values then
		for idx, value in ipairs(data.save_values) do
			table.insert(save_values, value)
		end
	end

	local challenge_choices_saved_values = {}

	if challenge_choices then
		for index, challenge in ipairs(challenge_choices) do
			if challenge.save_values then
				challenge_choices_saved_values[index] = {}

				for idx, value in ipairs(challenge.save_values) do
					challenge_choices_saved_values[index][value] = challenge[value]
				end
			end
		end
	end

	local obj = {
		completed = false,
		displayed = true,
		max_progress = 1,
		progress = 0,
		choice_id = data.choice_id,
		name_id = data.name_id,
		desc_id = data.desc_id,
		challenge_choices = challenge_choices,
		challenge_choices_saved_values = challenge_choices_saved_values,
		verify = data.verify,
		save_values = save_values
	}

	return obj
end

function EventJobsTweakData:_stage(stage_id, max_progress, data)
	data.stage_id = stage_id

	local save_values = {
		"achievement_id",
		"progress_id",
		"track_id",
		"completed",
		"progress",
		"track_id",
		"stage_id"
	}

	if data.save_values then
		for idx, value in ipairs(data.save_values) do
			table.insert(save_values, value)
		end
	end

	local obj = {
		completed = false,
		displayed = true,
		progress = 0,
		achievement_id = data.achievement_id,
		name_id = data.name_id,
		desc_id = data.desc_id,
		stage_id = stage_id,
		stages = data.stages,
		max_progress = data.stage_id and max_progress or 1,
		verify = data.verify,
		save_values = save_values
	}

	return obj
end
