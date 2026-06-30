AttentionTweakData = AttentionTweakData or class()

function AttentionTweakData:init()
	self.settings = {}
	self.indexes = {}

	self:_init_player()
	self:_init_team_AI()
	self:_init_civilian()
	self:_init_enemy()
	self:_init_drill()
	self:_init_sentry_gun()
	self:_init_prop()
	self:_init_custom()
	self:_post_init()
end

function AttentionTweakData:_init_player()
	self.settings.pl_civilian = {
		filter = "none",
		max_range = 1,
		notice_delay_mul = 1,
		notice_requires_FOV = true,
		reaction = "REACT_IDLE",
		release_delay = 1,
		verification_interval = 4
	}
	self.settings.pl_mask_off_friend_combatant = {
		filter = "combatant",
		max_range = 1000,
		notice_delay_mul = 1,
		notice_requires_FOV = false,
		reaction = "REACT_IDLE",
		relation = "friend",
		release_delay = 3,
		verification_interval = 4,
		duration = {
			2,
			5
		},
		pause = {
			15,
			25
		}
	}
	self.settings.pl_mask_off_foe_combatant = {
		filter = "combatant",
		max_range = 600,
		notice_delay_mul = 0.3,
		notice_requires_FOV = true,
		reaction = "REACT_SUSPICIOUS",
		relation = "foe",
		release_delay = 2,
		suspicion_duration = 4,
		suspicion_range = 500,
		turn_around_range = 250,
		uncover_range = 150,
		verification_interval = 0.02
	}
	self.settings.pl_mask_off_foe_non_combatant = {
		attract_chance = 0.5,
		filter = "non_combatant",
		max_range = 600,
		notice_delay_mul = 0,
		notice_interval = 0.5,
		notice_requires_FOV = true,
		reaction = "REACT_IDLE",
		release_delay = 3,
		verification_interval = 2,
		duration = {
			2,
			15
		},
		pause = {
			10,
			60
		}
	}
	self.settings.pl_mask_off_friend_non_combatant = {
		attract_chance = 0.5,
		filter = "non_combatant",
		max_range = 600,
		notice_delay_mul = 0,
		notice_interval = 0.5,
		notice_requires_FOV = true,
		reaction = "REACT_IDLE",
		relation = "friend",
		release_delay = 3,
		verification_interval = 2,
		duration = {
			2,
			15
		},
		pause = {
			10,
			60
		}
	}
	self.settings.pl_mask_on_friend_combatant_whisper_mode = {
		filter = "combatant",
		max_range = 2000,
		notice_delay_mul = 1,
		notice_requires_FOV = true,
		reaction = "REACT_CHECK",
		relation = "friend",
		release_delay = 3,
		verification_interval = 4,
		duration = {
			2,
			5
		},
		pause = {
			25,
			50
		}
	}
	self.settings.pl_mask_on_friend_non_combatant_whisper_mode = self.settings.pl_mask_off_friend_non_combatant
	self.settings.pl_mask_on_foe_combatant_whisper_mode_stand = {
		filter = "combatant",
		max_range = 2000,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_delay_mul = 2,
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		relation = "foe",
		release_delay = 1,
		uncover_range = 200,
		verification_interval = 0.1
	}
	self.settings.pl_mask_on_foe_non_combatant_whisper_mode_stand = {
		filter = "non_combatant",
		notice_clbk = "clbk_attention_notice_sneak",
		notice_delay_mul = 1.5,
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		release_delay = 1,
		uncover_range = 550,
		verification_interval = 0.1
	}
	self.settings.pl_mask_on_foe_combatant_whisper_mode_crouch = {
		filter = "combatant",
		max_range = 1200,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_delay_mul = 2,
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		relation = "foe",
		release_delay = 1,
		uncover_range = 200,
		verification_interval = 0.1
	}
	self.settings.pl_mask_on_foe_non_combatant_whisper_mode_crouch = {
		filter = "non_combatant",
		max_range = 1500,
		notice_clbk = "clbk_attention_notice_sneak",
		notice_delay_mul = 3,
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		release_delay = 1,
		uncover_range = 200,
		verification_interval = 0.1
	}
	self.settings.pl_friend_combatant_cbt = {
		filter = "combatant",
		max_range = 3000,
		notice_delay_mul = 1,
		notice_requires_FOV = false,
		reaction = "REACT_CHECK",
		relation = "friend",
		release_delay = 3,
		verification_interval = 4,
		duration = {
			2,
			3
		},
		pause = {
			45,
			60
		}
	}
	self.settings.pl_friend_non_combatant_cbt = {
		filter = "non_combatant",
		notice_delay_mul = 1.5,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		relation = "friend",
		release_delay = 1,
		uncover_range = 550,
		verification_interval = 0.1
	}
	self.settings.pl_foe_combatant_cbt_crouch = {
		filter = "combatant",
		notice_delay_mul = 2,
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		relation = "foe",
		release_delay = 1,
		uncover_range = 350,
		verification_interval = 0.1
	}
	self.settings.pl_foe_combatant_cbt_stand = {
		filter = "combatant",
		notice_clbk = "clbk_attention_notice_sneak",
		notice_interval = 0.1,
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		relation = "foe",
		release_delay = 1,
		uncover_range = 550,
		verification_interval = 1
	}
	self.settings.pl_foe_non_combatant_cbt_crouch = {
		filter = "non_combatant",
		notice_clbk = "clbk_attention_notice_sneak",
		notice_delay_mul = 2.5,
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		release_delay = 1,
		uncover_range = 200,
		verification_interval = 0.1
	}
	self.settings.pl_foe_non_combatant_cbt_stand = deep_clone(self.settings.pl_foe_combatant_cbt_stand)
	self.settings.pl_foe_non_combatant_cbt_stand.filter = "non_combatant"
end

function AttentionTweakData:_init_team_AI()
	self.settings.team_team_idle = {
		filter = "all",
		max_range = 1000,
		notice_requires_FOV = false,
		reaction = "REACT_IDLE",
		relation = "friend",
		release_delay = 2,
		verification_interval = 3,
		duration = {
			1.5,
			4
		},
		pause = {
			25,
			40
		}
	}
	self.settings.team_enemy_idle = {
		filter = "combatant",
		max_range = 550,
		notice_requires_FOV = false,
		reaction = "REACT_IDLE",
		relation = "foe",
		release_delay = 1,
		verification_interval = 3,
		duration = {
			1.5,
			3
		},
		pause = {
			35,
			60
		}
	}
	self.settings.team_enemy_cbt = {
		filter = "all",
		max_range = 20000,
		notice_interval = 1,
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		relation = "foe",
		release_delay = 1,
		uncover_range = 400,
		verification_interval = 1.5,
		weight_mul = 0.5
	}
end

function AttentionTweakData:_init_civilian()
	self.settings.civ_all_peaceful = {
		filter = "all",
		max_range = 2000,
		notice_requires_FOV = true,
		reaction = "REACT_IDLE",
		release_delay = 2,
		verification_interval = 3,
		duration = {
			1.5,
			6
		},
		pause = {
			35,
			60
		}
	}
	self.settings.civ_enemy_cbt = {
		filter = "all",
		max_range = 8000,
		notice_clbk = "clbk_attention_notice_corpse",
		notice_delay_mul = 1,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 6,
		uncover_range = 300,
		verification_interval = 0.1,
		duration = {
			3,
			6
		}
	}
	self.settings.civ_murderer_cbt = {
		filter = "murderer",
		max_range = 20000,
		notice_interval = 1,
		notice_requires_FOV = true,
		reaction = "REACT_SHOOT",
		relation = "foe",
		release_delay = 1,
		uncover_range = 300,
		verification_interval = 1.5,
		weight_mul = 0.75
	}
	self.settings.civ_enemy_corpse_sneak = {
		filter = "all",
		max_range = 2500,
		notice_delay_mul = 0.05,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 6,
		uncover_range = 300,
		verification_interval = 0.1
	}
	self.settings.civ_civ_cbt = {
		filter = "all",
		notice_delay_mul = 0.05,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 6,
		uncover_range = 300,
		verification_interval = 0.1,
		duration = {
			3,
			6
		}
	}
end

function AttentionTweakData:_init_enemy()
	self.settings.enemy_team_idle = {
		filter = "combatant",
		max_range = 2000,
		notice_requires_FOV = false,
		reaction = "REACT_IDLE",
		relation = "foe",
		release_delay = 1,
		verification_interval = 3,
		duration = {
			2,
			4
		},
		pause = {
			9,
			40
		}
	}
	self.settings.enemy_team_cbt = {
		filter = "combatant",
		max_range = 20000,
		notice_delay_mul = 0,
		notice_interval = 0.2,
		notice_requires_FOV = false,
		reaction = "REACT_COMBAT",
		relation = "foe",
		release_delay = 2,
		verification_interval = 0.75
	}
	self.settings.enemy_law_corpse_sneak = self.settings.civ_enemy_corpse_sneak
	self.settings.enemy_team_corpse_sneak = self.settings.civ_enemy_corpse_sneak
	self.settings.enemy_combatant_corpse_cbt = {
		filter = "combatant",
		max_range = 800,
		notice_delay_mul = 0.1,
		notice_requires_FOV = true,
		reaction = "REACT_CHECK",
		release_delay = 1,
		verification_interval = 1.5,
		duration = {
			2,
			3
		}
	}
	self.settings.enemy_enemy_cbt = {
		filter = "combatant",
		max_range = 3900,
		notice_delay_mul = 0.5,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		relation = "friend",
		release_delay = 1,
		uncover_range = 300,
		verification_interval = 0.5
	}
	self.settings.enemy_civ_cbt = {
		filter = "non_combatant",
		max_range = 8000,
		notice_delay_mul = 0.2,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 6,
		uncover_range = 300,
		verification_interval = 0.5,
		duration = {
			1.5,
			3
		}
	}
end

function AttentionTweakData:_init_custom()
	self.settings.custom_void = {
		filter = "none",
		max_range = 2000,
		reaction = "REACT_IDLE",
		release_delay = 10,
		verification_interval = 10
	}
	self.settings.custom_team_idle = {
		filter = "criminal",
		max_range = 2000,
		notice_requires_FOV = false,
		reaction = "REACT_IDLE",
		release_delay = 1,
		verification_interval = 3,
		duration = {
			2,
			4
		},
		pause = {
			9,
			40
		}
	}
	self.settings.custom_team_cbt = {
		filter = "criminal",
		max_range = 20000,
		notice_requires_FOV = false,
		reaction = "REACT_COMBAT",
		release_delay = 2,
		verification_interval = 1.5
	}
	self.settings.custom_team_shoot_const = {
		filter = "criminal",
		max_range = 10000,
		notice_requires_FOV = false,
		reaction = "REACT_SHOOT",
		release_delay = 2,
		verification_interval = 1.5
	}
	self.settings.custom_team_shoot_burst = {
		filter = "criminal",
		max_range = 10000,
		notice_requires_FOV = false,
		reaction = "REACT_SHOOT",
		release_delay = 2,
		verification_interval = 1.5,
		duration = {
			2,
			4
		}
	}
	self.settings.custom_team_aim_const = {
		filter = "criminal",
		max_range = 10000,
		notice_requires_FOV = false,
		reaction = "REACT_AIM",
		release_delay = 2,
		verification_interval = 1.5
	}
	self.settings.custom_enemy_forest_survive_kruka = {
		filter = "all_enemy",
		max_range = 20000,
		notice_requires_FOV = false,
		reaction = "REACT_COMBAT",
		release_delay = 2,
		verification_interval = 1
	}
	self.settings.custom_enemy_suburbia_shootout = {
		filter = "all_enemy",
		max_range = 12000,
		notice_requires_FOV = true,
		reaction = "REACT_SHOOT",
		release_delay = 5,
		turn_around_range = 15000,
		verification_interval = 2,
		weight_mul = 0.5
	}
	self.settings.custom_enemy_suburbia_shootout_cops = {
		filter = "all_enemy",
		max_range = 2000,
		notice_requires_FOV = true,
		reaction = "REACT_SHOOT",
		release_delay = 5,
		turn_around_range = 15000,
		verification_interval = 2
	}
	self.settings.custom_enemy_china_store_vase_shoot = {
		filter = "all_enemy",
		max_range = 1200,
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		release_delay = 3,
		turn_around_range = 500,
		verification_interval = 2
	}
	self.settings.custom_enemy_china_store_vase_melee = {
		filter = "all_enemy",
		max_range = 500,
		notice_requires_FOV = true,
		pause = 10,
		reaction = "REACT_MELEE",
		release_delay = 10,
		turn_around_range = 250,
		verification_interval = 5
	}
	self.settings.custom_enemy_china_store_vase_aim = {
		filter = "all_enemy",
		max_range = 500,
		notice_requires_FOV = false,
		pause = 10,
		reaction = "REACT_COMBAT",
		release_delay = 10,
		verification_interval = 5
	}
	self.settings.custom_enemy_shoot_const = {
		filter = "all_enemy",
		max_range = 10000,
		notice_requires_FOV = true,
		reaction = "REACT_SHOOT",
		release_delay = 2,
		verification_interval = 1
	}
	self.settings.custom_gangster_shoot_const = {
		filter = "gangster",
		max_range = 10000,
		notice_requires_FOV = true,
		reaction = "REACT_SHOOT",
		release_delay = 2,
		verification_interval = 1
	}
	self.settings.custom_law_shoot_const = {
		filter = "law_enforcer",
		max_range = 100000,
		notice_requires_FOV = false,
		reaction = "REACT_SHOOT",
		release_delay = 2,
		verification_interval = 1
	}
	self.settings.custom_law_look_in_container = {
		filter = "law_enforcer",
		max_range = 100000,
		notice_requires_FOV = false,
		reaction = "REACT_AIM",
		release_delay = 2,
		verification_interval = 1
	}
	self.settings.custom_law_shoot_const_escape_vehicle = {
		filter = "law_enforcer",
		max_range = 4500,
		notice_requires_FOV = false,
		reaction = "REACT_COMBAT",
		release_delay = 2,
		verification_interval = 1
	}
	self.settings.custom_law_shoot_const_container = {
		filter = "law_enforcer",
		max_range = 2000,
		notice_requires_FOV = false,
		reaction = "REACT_SHOOT",
		release_delay = 2,
		verification_interval = 1
	}
	self.settings.custom_gangsters_shoot_warehouse = {
		filter = "gangster",
		max_range = 2000,
		notice_requires_FOV = false,
		reaction = "REACT_COMBAT",
		release_delay = 2,
		verification_interval = 1
	}
	self.settings.custom_gangster_sniper_apartment_suspicous = {
		filter = "law_enforcer",
		max_range = 850,
		notice_delay_mul = 0.1,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 6,
		uncover_range = 350,
		verification_interval = 1
	}
	self.settings.custom_gangster_docks_idle = {
		filter = "gangster",
		max_range = 10000,
		notice_requires_FOV = true,
		reaction = "REACT_CURIOUS",
		release_delay = 6,
		verification_interval = 1
	}
	self.settings.custom_enemy_civ_scared = {
		filter = "civilians_enemies",
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 2,
		verification_interval = 5,
		duration = {
			2,
			4
		}
	}
	self.settings.custom_boat_gangster = {
		filter = "gangster",
		max_range = 4000,
		notice_requires_FOV = false,
		reaction = "REACT_COMBAT",
		release_delay = 2,
		verification_interval = 1
	}
	self.settings.custom_law_cbt = {
		filter = "law_enforcer",
		notice_clbk = "clbk_attention_notice_sneak",
		notice_requires_FOV = true,
		reaction = "REACT_COMBAT",
		release_delay = 1,
		uncover_range = 350,
		verification_interval = 1
	}
	self.settings.custom_airport_window = {
		filter = "all_enemy",
		max_range = 1500,
		notice_delay_mul = 0.2,
		notice_requires_FOV = true,
		reaction = "REACT_CURIOUS",
		release_delay = 6,
		uncover_range = 100,
		verification_interval = 1.5,
		duration = {
			3,
			6
		}
	}
	self.settings.custom_look_at = {
		filter = "all_enemy",
		max_range = 15000,
		notice_delay_mul = 0.2,
		notice_requires_FOV = false,
		reaction = "REACT_IDLE",
		release_delay = 3,
		verification_interval = 1
	}
	self.settings.custom_look_at_FOV = {
		filter = "all_enemy",
		max_range = 1500,
		notice_delay_mul = 0.2,
		notice_requires_FOV = true,
		reaction = "REACT_CURIOUS",
		release_delay = 6,
		verification_interval = 1.5,
		duration = {
			3,
			6
		}
	}
	self.settings.custom_server_room = {
		filter = "all_enemy",
		max_range = 350,
		notice_delay_mul = 0.2,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 6,
		uncover_range = 100,
		verification_interval = 1.5,
		duration = {
			3,
			6
		}
	}
end

function AttentionTweakData:_init_drill()
	self.settings.drill_civ_ene_ntl = {
		filter = "civilians_enemies",
		max_range = 2300,
		notice_requires_FOV = false,
		reaction = "REACT_SCARED",
		release_delay = 1,
		suspicion_range = 1100,
		uncover_range = 200,
		verification_interval = 0.4
	}
	self.settings.drill_silent_civ_ene_ntl = {
		filter = "civilians_enemies",
		max_range = 2200,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 1,
		suspicion_range = 1000,
		uncover_range = 200,
		verification_interval = 0.4
	}
end

function AttentionTweakData:_init_sentry_gun()
	self.settings.sentry_gun_enemy_cbt = {
		filter = "combatant",
		reaction = "REACT_COMBAT",
		relation = "foe",
		release_delay = 1,
		uncover_range = 300,
		verification_interval = 1.5
	}
	self.settings.sentry_gun_enemy_cbt_hacked = {
		filter = "combatant",
		reaction = "REACT_COMBAT",
		relation = "foe",
		release_delay = 1,
		uncover_range = 300,
		verification_interval = 1.5,
		weight_mul = 0.2
	}
end

function AttentionTweakData:_init_prop()
	self.settings.prop_carry_bag = {
		filter = "law_enforcer",
		max_range = 1800,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 1,
		suspicion_range = 800,
		uncover_range = 200,
		verification_interval = 0.4
	}
	self.settings.prop_carry_bodybag = {
		filter = "civilians_enemies",
		max_range = 1900,
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 1,
		suspicion_range = 800,
		uncover_range = 200,
		verification_interval = 0.4
	}
	self.settings.prop_civ_ene_ntl = {
		filter = "civilians_enemies",
		notice_requires_FOV = true,
		reaction = "REACT_AIM",
		release_delay = 1,
		uncover_range = 500,
		verification_interval = 0.4
	}
	self.settings.prop_ene_ntl_edaycrate = {
		filter = "all_enemy",
		max_range = 700,
		notice_requires_FOV = true,
		reaction = "REACT_AIM",
		release_delay = 1,
		uncover_range = 300,
		verification_interval = 0.4
	}
	self.settings.prop_ene_ntl = {
		filter = "all_enemy",
		notice_requires_FOV = true,
		reaction = "REACT_AIM",
		release_delay = 1,
		uncover_range = 500,
		verification_interval = 0.4
	}
	self.settings.broken_cam_ene_ntl = {
		filter = "law_enforcer",
		max_range = 1200,
		notice_requires_FOV = true,
		reaction = "REACT_AIM",
		release_delay = 1,
		suspicion_range = 1000,
		uncover_range = 100,
		verification_interval = 0.4
	}
	self.settings.prop_law_scary = {
		filter = "law_enforcer",
		notice_requires_FOV = true,
		reaction = "REACT_SCARED",
		release_delay = 1,
		uncover_range = 300,
		verification_interval = 0.4
	}
	self.settings.prop_state_civ_ene_ntl = {
		filter = "civilians_enemies",
		notice_requires_FOV = true,
		reaction = "REACT_CURIOUS",
		release_delay = 1,
		uncover_range = 200,
		verification_interval = 0.4
	}
	self.settings.no_staff_ene_ntl = {
		filter = "law_enforcer",
		max_range = 1200,
		notice_requires_FOV = true,
		reaction = "REACT_AIM",
		release_delay = 1,
		suspicion_range = 1000,
		uncover_range = 100,
		verification_interval = 0.4
	}
	self.settings.timelock_ene_ntl = {
		filter = "law_enforcer",
		max_range = 1200,
		notice_requires_FOV = true,
		reaction = "REACT_AIM",
		release_delay = 1,
		suspicion_range = 1000,
		uncover_range = 100,
		verification_interval = 0.4
	}
	self.settings.open_security_gate_ene_ntl = {
		filter = "law_enforcer",
		max_range = 1200,
		notice_requires_FOV = true,
		reaction = "REACT_AIM",
		release_delay = 1,
		suspicion_range = 1000,
		uncover_range = 100,
		verification_interval = 0.4
	}
	self.settings.open_vault_ene_ntl = {
		filter = "law_enforcer",
		max_range = 600,
		notice_requires_FOV = true,
		reaction = "REACT_AIM",
		release_delay = 1,
		suspicion_range = 500,
		uncover_range = 100,
		verification_interval = 0.4
	}
	self.settings.vehicle_enemy_cbt = {
		filter = "all",
		max_range = 20000,
		notice_interval = 1,
		notice_requires_FOV = true,
		reaction = "REACT_SHOOT",
		relation = "foe",
		release_delay = 1,
		uncover_range = 1200,
		verification_interval = 1.5,
		weight_mul = 0.4
	}
	self.settings.open_elevator_ene_ntl = {
		filter = "civilians_enemies",
		max_range = 1500,
		notice_requires_FOV = true,
		reaction = "REACT_AIM",
		release_delay = 1,
		suspicion_range = 1200,
		uncover_range = 800,
		verification_interval = 0.4
	}
end

function AttentionTweakData:get_attention_index(setting_name)
	for i_setting, test_setting_name in ipairs(self.indexes) do
		if setting_name == test_setting_name then
			return i_setting
		end
	end
end

function AttentionTweakData:get_attention_name(index)
	return self.indexes[index]
end

function AttentionTweakData:_post_init()
	for setting_name, setting in pairs(self.settings) do
		local i_insert = 1

		while self.indexes[i_insert] and setting_name >= self.indexes[i_insert] do
			i_insert = i_insert + 1
		end

		table.insert(self.indexes, i_insert, setting_name)
	end
end
