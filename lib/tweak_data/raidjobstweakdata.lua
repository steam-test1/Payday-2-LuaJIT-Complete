RaidJobsTweakData = RaidJobsTweakData or class()

function RaidJobsTweakData:init(tweak_data)
	self.challenges = {}

	self:_init_weapon_challenges(tweak_data)
end

function RaidJobsTweakData:_init_weapon_challenges(tweak_data)
	table.insert(self.challenges, {
		reward_id = "menu_aru_job_1_reward",
		name_id = "menu_aru_job_1",
		id = "aru_1",
		desc_id = "menu_aru_job_1_desc",
		show_progress = true,
		objectives = {tweak_data.safehouse:_progress("aru_1", 10, {
			name_id = "menu_aru_job_1_obj",
			desc_id = "menu_aru_job_1_obj_desc"
		})},
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
		reward_id = "menu_aru_job_2_reward",
		name_id = "menu_aru_job_2",
		id = "aru_2",
		desc_id = "menu_aru_job_2_desc",
		show_progress = true,
		objectives = {tweak_data.safehouse:_progress("aru_2", 50, {
			name_id = "menu_aru_job_2_obj",
			desc_id = "menu_aru_job_2_obj_desc"
		})},
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
		reward_id = "menu_aru_job_3_reward",
		name_id = "menu_aru_job_3",
		id = "aru_3",
		desc_id = "menu_aru_job_3_desc",
		show_progress = true,
		objectives = {tweak_data.safehouse:_progress("aru_3", 100, {
			name_id = "menu_aru_job_3_obj",
			desc_id = "menu_aru_job_3_obj_desc"
		})},
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
		reward_id = "menu_aru_job_4_reward",
		name_id = "menu_aru_job_4",
		id = "aru_4",
		desc_id = "menu_aru_job_4_desc",
		show_progress = true,
		objectives = {tweak_data.safehouse:_progress("aru_4", 200, {
			name_id = "menu_aru_job_4_obj",
			desc_id = "menu_aru_job_4_obj_desc"
		})},
		rewards = {{
			"safehouse_coins",
			tweak_data.safehouse.rewards.challenge
		}}
	})
end

