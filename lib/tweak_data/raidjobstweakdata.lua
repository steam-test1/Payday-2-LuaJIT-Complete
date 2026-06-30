RaidJobsTweakData = RaidJobsTweakData or class()

function RaidJobsTweakData:init(tweak_data)
	self.challenges = {}

	self:_init_weapon_challenges(tweak_data)
	self:_init_mask_challenges(tweak_data)
end

function RaidJobsTweakData:_init_weapon_challenges(tweak_data)
	table.insert(self.challenges, {
		desc_id = "menu_aru_job_1_desc",
		id = "aru_1",
		name_id = "menu_aru_job_1",
		reward_id = "menu_aru_job_1_reward",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("aru_1", 10, {
				desc_id = "menu_aru_job_1_obj_desc",
				name_id = "menu_aru_job_1_obj"
			})
		},
		rewards = {
			{
				item_entry = "breech",
				type_items = "weapon"
			},
			{
				"safehouse_coins",
				tweak_data.safehouse.rewards.challenge
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_aru_job_2_desc",
		id = "aru_2",
		name_id = "menu_aru_job_2",
		reward_id = "menu_aru_job_2_reward",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("aru_2", 50, {
				desc_id = "menu_aru_job_2_obj_desc",
				name_id = "menu_aru_job_2_obj"
			})
		},
		rewards = {
			{
				item_entry = "erma",
				type_items = "weapon"
			},
			{
				"safehouse_coins",
				tweak_data.safehouse.rewards.challenge
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_aru_job_3_desc",
		id = "aru_3",
		name_id = "menu_aru_job_3",
		reward_id = "menu_aru_job_3_reward",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("aru_3", 100, {
				desc_id = "menu_aru_job_3_obj_desc",
				name_id = "menu_aru_job_3_obj"
			})
		},
		rewards = {
			{
				item_entry = "ching",
				type_items = "weapon"
			},
			{
				"safehouse_coins",
				tweak_data.safehouse.rewards.challenge
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_aru_job_4_desc",
		id = "aru_4",
		name_id = "menu_aru_job_4",
		reward_id = "menu_aru_job_4_reward",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("aru_4", 200, {
				desc_id = "menu_aru_job_4_obj_desc",
				name_id = "menu_aru_job_4_obj"
			})
		},
		rewards = {
			{
				"safehouse_coins",
				tweak_data.safehouse.rewards.challenge
			}
		}
	})
end

function RaidJobsTweakData:_init_mask_challenges(tweak_data)
	table.insert(self.challenges, {
		desc_id = "menu_jfr_job_1_desc",
		id = "jfr_1",
		name_id = "menu_jfr_job_1",
		reward_id = "menu_jfr_job_1_reward",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("jfr_1", 1, {
				desc_id = "menu_jfr_job_1_case_desc",
				name_id = "menu_jfr_job_1_case"
			})
		},
		rewards = {
			{
				item_entry = "jfr_03",
				type_items = "masks"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_jfr_job_2_desc",
		id = "jfr_2",
		name_id = "menu_jfr_job_2",
		reward_id = "menu_jfr_job_2_reward",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("jfr_2", 1, {
				desc_id = "menu_jfr_job_2_kills_desc",
				name_id = "menu_jfr_job_2_kills"
			})
		},
		rewards = {
			{
				item_entry = "jfr_02",
				type_items = "masks"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_jfr_job_3_desc",
		id = "jfr_3",
		name_id = "menu_jfr_job_3",
		reward_id = "menu_jfr_job_3_reward",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("jfr_3", 1, {
				desc_id = "menu_jfr_job_3_wine_desc",
				name_id = "menu_jfr_job_3_wine"
			})
		},
		rewards = {
			{
				item_entry = "jfr_01",
				type_items = "masks"
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_jfr_job_4_desc",
		id = "jfr_4",
		name_id = "menu_jfr_job_4",
		reward_id = "menu_jfr_job_4_reward",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("jfr_4", 5, {
				desc_id = "menu_jfr_job_4_deposit_desc",
				name_id = "menu_jfr_job_4_deposit"
			})
		},
		rewards = {
			{
				item_entry = "jfr_04",
				type_items = "masks"
			}
		}
	})
end
