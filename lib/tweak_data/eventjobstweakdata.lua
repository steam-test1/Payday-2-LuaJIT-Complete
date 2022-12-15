EventJobsTweakData = EventJobsTweakData or class()

function EventJobsTweakData:init(tweak_data)
	self.challenges = {}
	self.current_event = "CG22"

	self:_init_pda8_challenges(tweak_data)
	self:_init_pda9_challenges(tweak_data)
	self:_init_cg22_challenges(tweak_data)

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
		pda9 = {},
		cg22 = {}
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
		reward_id = "menu_pda8_2_reward",
		global_value = "pda8",
		name_id = "menu_pda8_2",
		desc_id = "menu_pda8_2_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda8_2",
		id = "pda8_2",
		objectives = {
			self:_collective("pda8_collective", 4, {
				name_id = "menu_pda8_2_prog_obj",
				desc_id = "menu_pda8_2_prog_obj_desc"
			}),
			self:_stage("pda8_stages", 1, {
				name_id = "menu_pda8_2_track_obj",
				desc_id = "",
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
		reward_id = "menu_pda8_3_reward",
		global_value = "pda8",
		name_id = "menu_pda8_3",
		desc_id = "menu_pda8_3_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda8_3",
		id = "pda8_3",
		objectives = {
			self:_collective("pda8_collective", 6, {
				name_id = "menu_pda8_3_prog_obj",
				desc_id = "menu_pda8_3_prog_obj_desc"
			}),
			self:_stage("pda8_stages", 1, {
				name_id = "menu_pda8_3_track_obj",
				desc_id = "",
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
		reward_id = "menu_pda8_4_reward",
		global_value = "pda8",
		name_id = "menu_pda8_4",
		desc_id = "menu_pda8_4_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda8_4",
		id = "pda8_4",
		objectives = {
			tweak_data.safehouse:_progress("pda8_item_1", 1, {
				name_id = "menu_pda8_item_1",
				desc_id = "menu_pda8_item_1_desc"
			}),
			tweak_data.safehouse:_progress("pda8_item_2", 1, {
				name_id = "menu_pda8_item_2",
				desc_id = ""
			}),
			tweak_data.safehouse:_progress("pda8_item_3", 1, {
				name_id = "menu_pda8_item_3",
				desc_id = ""
			}),
			tweak_data.safehouse:_progress("pda8_item_4", 1, {
				name_id = "menu_pda8_item_4",
				desc_id = ""
			}),
			tweak_data.safehouse:_progress("pda8_item_5", 1, {
				name_id = "menu_pda8_item_5",
				desc_id = ""
			}),
			tweak_data.safehouse:_progress("pda8_item_6", 1, {
				name_id = "menu_pda8_item_6",
				desc_id = ""
			}),
			tweak_data.safehouse:_progress("pda8_item_7", 1, {
				name_id = "menu_pda8_item_7",
				desc_id = ""
			}),
			tweak_data.safehouse:_progress("pda8_item_8", 1, {
				name_id = "menu_pda8_item_8",
				desc_id = ""
			}),
			self:_stage("pda8_stages", 1, {
				name_id = "menu_pda8_4_track_obj",
				desc_id = "",
				stages = {
					4,
					5
				}
			})
		},
		rewards = {
			{
				type_items = "masks",
				item_entry = "eighthgrin",
				amount = 1
			}
		}
	})
end

function EventJobsTweakData:_init_pda9_challenges(tweak_data)
	table.insert(self.challenges, {
		reward_id = "menu_pda9_1_reward",
		name_id = "menu_pda9_1",
		temp_challenge = "PDA9",
		desc_id = "menu_pda9_1_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda9_1",
		id = "pda9_1",
		objectives = {
			self:_collective("pda9_collective_1", 2, {
				name_id = "menu_pda9_item_2",
				desc_id = "menu_pda9_item_1_desc"
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
		reward_id = "menu_pda9_2_reward",
		name_id = "menu_pda9_2",
		temp_challenge = "PDA9",
		desc_id = "menu_pda9_2_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda9_2",
		id = "pda9_2",
		objectives = {
			self:_collective("pda9_collective_2", 3, {
				name_id = "menu_pda9_item_2",
				desc_id = "menu_pda9_item_2_desc"
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
		reward_id = "menu_pda9_3_reward",
		name_id = "menu_pda9_3",
		temp_challenge = "PDA9",
		desc_id = "menu_pda9_3_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda9_3",
		id = "pda9_3",
		objectives = {
			self:_collective("pda9_collective_3", 6, {
				name_id = "menu_pda9_item_3",
				desc_id = "menu_pda9_item_3_desc"
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
		reward_id = "menu_pda9_4_reward",
		name_id = "menu_pda9_4",
		temp_challenge = "PDA9",
		desc_id = "menu_pda9_4_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda9_4",
		id = "pda9_4",
		objectives = {
			self:_collective("pda9_collective_4", 10, {
				name_id = "menu_pda9_item_4",
				desc_id = "menu_pda9_item_4_desc"
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
		reward_id = "menu_pda9_community_1_reward",
		global_value = "pda9",
		name_id = "menu_pda9_community_1",
		desc_id = "menu_pda9_community_1_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda9_community_1",
		id = "pda9_community_1",
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda9_piggy_stage_1", 1, {
					name_id = "menu_pda9_item_1",
					desc_id = ""
				}),
				tweak_data.safehouse:_progress("pda9_n1", 1, {
					name_id = "menu_pda9_item_n1",
					desc_id = "menu_pda9_item_n1_desc"
				})
			}, 1, {
				name_id = "menu_pda9_1_choice_obj",
				choice_id = "pda9_community_1",
				desc_id = ""
			}),
			self:_stage("pda9_stages", 1, {
				name_id = "menu_pda9_1_track_obj",
				desc_id = "menu_pda9_community_item_1_desc",
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
		reward_id = "menu_pda9_community_2_reward",
		global_value = "pda9",
		name_id = "menu_pda9_community_2",
		desc_id = "menu_pda9_community_2_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda9_community_2",
		id = "pda9_community_2",
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda9_piggy_stage_2", 1, {
					name_id = "menu_pda9_item_1",
					desc_id = ""
				}),
				tweak_data.safehouse:_progress("pda9_n2", 99, {
					name_id = "menu_pda9_item_n2",
					desc_id = "menu_pda9_item_n2_desc"
				})
			}, 1, {
				name_id = "menu_pda9_2_choice_obj",
				choice_id = "pda9_community_2",
				desc_id = ""
			}),
			self:_stage("pda9_stages", 1, {
				name_id = "menu_pda9_1_track_obj",
				desc_id = "menu_pda9_community_item_2_desc",
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
		reward_id = "menu_pda9_community_3_reward",
		global_value = "pda9",
		name_id = "menu_pda9_community_3",
		desc_id = "menu_pda9_community_3_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda9_community_3",
		id = "pda9_community_3",
		objectives = {
			self:_choice({
				tweak_data.safehouse:_progress("pda9_piggy_stage_1", 6, {
					name_id = "menu_pda9_item_2",
					desc_id = ""
				}),
				tweak_data.safehouse:_progress("pda9_n3", 99, {
					name_id = "menu_pda9_item_n3",
					desc_id = "menu_pda9_item_n3_desc"
				})
			}, 1, {
				name_id = "menu_pda9_3_choice_obj",
				choice_id = "pda9_community_3",
				desc_id = ""
			}),
			self:_stage("pda9_stages", 1, {
				name_id = "menu_pda9_1_track_obj",
				desc_id = "menu_pda9_community_item_3_desc",
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
		reward_id = "menu_pda9_community_4_reward",
		global_value = "pda9",
		name_id = "menu_pda9_community_4",
		desc_id = "menu_pda9_community_4_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda9_community_4",
		id = "pda9_community_4",
		objectives = {
			self:_choice({
				self:_collective("pda9_collective_1", 1, {
					name_id = "menu_pda9_community_objective_1",
					desc_id = "menu_pda9_community_objective_1_desc"
				}),
				tweak_data.safehouse:_progress("pda9_n4", 99, {
					name_id = "menu_pda9_item_n4",
					desc_id = "menu_pda9_item_n4_desc"
				})
			}, 1, {
				name_id = "menu_pda9_4_choice_obj",
				choice_id = "pda9_community_4",
				desc_id = ""
			}),
			self:_stage("pda9_stages", 1, {
				name_id = "menu_pda9_1_track_obj",
				desc_id = "menu_pda9_community_item_4_desc",
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
		reward_id = "menu_pda9_community_5_reward",
		global_value = "pda9",
		name_id = "menu_pda9_community_5",
		desc_id = "menu_pda9_community_5_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_pda9_community_5",
		id = "pda9_community_5",
		objectives = {
			self:_choice({
				self:_collective("pda9_collective_1", 1, {
					name_id = "menu_pda9_community_objective_1",
					desc_id = "menu_pda9_community_objective_2_desc"
				}),
				tweak_data.safehouse:_progress("pda9_n5", 9, {
					name_id = "menu_pda9_item_n5",
					desc_id = "menu_pda9_item_n5_desc"
				})
			}, 1, {
				name_id = "menu_pda9_5_choice_obj",
				choice_id = "pda9_community_5",
				desc_id = ""
			}),
			self:_stage("pda9_stages", 1, {
				name_id = "menu_pda9_1_track_obj",
				desc_id = "menu_pda9_community_item_5_desc",
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
		reward_id = "menu_cg22_1_reward",
		name_id = "menu_cg22_1",
		temp_challenge = "CG22",
		desc_id = "menu_cg22_1_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_cg22_1",
		id = "cg22_1",
		objectives = {
			tweak_data.safehouse:_progress("cg22_personal_1", 100, {
				name_id = "menu_cg22_personal_1",
				desc_id = "menu_cg22_personal_1_desc"
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
		reward_id = "menu_cg22_2_reward",
		name_id = "menu_cg22_2",
		temp_challenge = "CG22",
		desc_id = "menu_cg22_2_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_cg22_2",
		id = "cg22_2",
		objectives = {
			tweak_data.safehouse:_progress("cg22_personal_2", 500, {
				name_id = "menu_cg22_personal_2",
				desc_id = "menu_cg22_personal_2_desc"
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
		reward_id = "menu_cg22_3_reward",
		name_id = "menu_cg22_3",
		temp_challenge = "CG22",
		desc_id = "menu_cg22_3_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_cg22_3",
		id = "cg22_3",
		objectives = {
			tweak_data.safehouse:_progress("cg22_personal_3", 150, {
				name_id = "menu_cg22_personal_3",
				desc_id = "menu_cg22_personal_3_desc"
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
		reward_id = "menu_cg22_community_1_reward",
		name_id = "menu_cg22_community_1",
		temp_challenge = "CG22",
		desc_id = "menu_cg22_community_1_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_cg22_community_1",
		id = "cg22_community_1",
		objectives = {
			tweak_data.safehouse:_progress("cg22_secure_objective", 3, {
				name_id = "menu_cg22_item_1",
				desc_id = "menu_cg22_item_1_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_1_track_obj",
				desc_id = "menu_cg22_community_item_1_desc",
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
		reward_id = "menu_cg22_community_2_reward",
		name_id = "menu_cg22_community_2",
		temp_challenge = "CG22",
		desc_id = "menu_cg22_community_2_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_cg22_community_2",
		id = "cg22_community_2",
		objectives = {
			tweak_data.safehouse:_progress("cg22_sacrifice_objective", 3, {
				name_id = "menu_cg22_item_2",
				desc_id = "menu_cg22_item_2_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_2_track_obj",
				desc_id = "menu_cg22_community_item_2_desc",
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
		reward_id = "menu_cg22_community_3_reward",
		name_id = "menu_cg22_community_3",
		temp_challenge = "CG22",
		desc_id = "menu_cg22_community_3_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_cg22_community_3",
		id = "cg22_community_3",
		objectives = {
			tweak_data.safehouse:_progress("cg22_snowman_objective", 1, {
				name_id = "menu_cg22_item_3",
				desc_id = "menu_cg22_item_3_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_3_track_obj",
				desc_id = "menu_cg22_community_item_3_desc",
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
		reward_id = "menu_cg22_community_4_reward",
		name_id = "menu_cg22_community_4",
		temp_challenge = "CG22",
		desc_id = "menu_cg22_community_4_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_cg22_community_4",
		id = "cg22_community_4",
		objectives = {
			tweak_data.safehouse:_progress("cg22_sacrifice_objective", 30, {
				name_id = "menu_cg22_item_2",
				desc_id = "menu_cg22_item_2_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_4_track_obj",
				desc_id = "menu_cg22_community_item_4_desc",
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
		reward_id = "menu_cg22_community_5_reward",
		name_id = "menu_cg22_community_5",
		temp_challenge = "CG22",
		desc_id = "menu_cg22_community_5_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_cg22_community_5",
		id = "cg22_community_5",
		objectives = {
			tweak_data.safehouse:_progress("cg22_snowman_objective", 10, {
				name_id = "menu_cg22_item_3",
				desc_id = "menu_cg22_item_3_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_5_track_obj",
				desc_id = "menu_cg22_community_item_5_desc",
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
		reward_id = "menu_cg22_community_6_reward",
		name_id = "menu_cg22_community_6",
		temp_challenge = "CG22",
		desc_id = "menu_cg22_community_6_desc",
		show_progress = true,
		locked_id = "bm_menu_locked_cg22_community_6",
		id = "cg22_community_6",
		objectives = {
			tweak_data.safehouse:_progress("cg22_secure_objective", 30, {
				name_id = "menu_cg22_item_1",
				desc_id = "menu_cg22_item_1_desc"
			}),
			self:_stage("cg22_stages", 1, {
				name_id = "menu_cg22_6_track_obj",
				desc_id = "menu_cg22_community_item_6_desc",
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
		progress = 0,
		completed = false,
		displayed = true,
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
		progress = 0,
		completed = false,
		displayed = true,
		max_progress = 1,
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
		progress = 0,
		completed = false,
		displayed = true,
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
