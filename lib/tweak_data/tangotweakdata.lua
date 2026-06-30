TangoTweakData = TangoTweakData or class()

function TangoTweakData:init(tweak_data)
	self.arbiter_data = {
		factory_id = "wpn_fps_gre_arbiter",
		weapon_id = "arbiter"
	}
	self.challenges = {}

	table.insert(self.challenges, {
		desc_id = "menu_tango_1_desc",
		id = "tango_1",
		name_id = "menu_tango_1",
		reward_type = "tango",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("tango_1_key_1", 1, {
				desc_id = "menu_tango_1_key_1_desc",
				name_id = "menu_tango_key_1"
			}),
			tweak_data.safehouse:_progress("tango_1_key_2", 1, {
				desc_id = "menu_tango_1_key_2_desc",
				name_id = "menu_tango_key_2"
			}),
			tweak_data.safehouse:_progress("tango_1_case", 1, {
				desc_id = "menu_tango_1_case_desc",
				name_id = "menu_tango_case"
			})
		},
		rewards = {
			{
				item_entry = "tng_bandana",
				type_items = "masks"
			},
			{
				item_entry = "army_deep_green",
				type_items = "materials"
			},
			{
				item_entry = "facepaint",
				type_items = "textures"
			},
			{
				tango_weapon_part = true
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_tango_2_desc",
		id = "tango_2",
		name_id = "menu_tango_2",
		reward_type = "tango",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("tango_2_key_1", 1, {
				desc_id = "menu_tango_2_key_1_desc",
				name_id = "menu_tango_key_1"
			}),
			tweak_data.safehouse:_progress("tango_2_key_2", 1, {
				desc_id = "menu_tango_2_key_2_desc",
				name_id = "menu_tango_key_2"
			}),
			tweak_data.safehouse:_progress("tango_2_case", 1, {
				desc_id = "menu_tango_2_case_desc",
				name_id = "menu_tango_case"
			})
		},
		rewards = {
			{
				item_entry = "tng_cloaker",
				type_items = "masks"
			},
			{
				item_entry = "ranger_black",
				type_items = "materials"
			},
			{
				item_entry = "sight",
				type_items = "textures"
			},
			{
				tango_weapon_part = true
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_tango_3_desc",
		id = "tango_3",
		name_id = "menu_tango_3",
		reward_type = "tango",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("tango_3_key_1", 1, {
				desc_id = "menu_tango_3_key_1_desc",
				name_id = "menu_tango_key_1"
			}),
			tweak_data.safehouse:_progress("tango_3_key_2", 1, {
				desc_id = "menu_tango_3_key_2_desc",
				name_id = "menu_tango_key_2"
			}),
			tweak_data.safehouse:_progress("tango_3_case", 1, {
				desc_id = "menu_tango_3_case_desc",
				name_id = "menu_tango_case"
			})
		},
		rewards = {
			{
				item_entry = "tng_zeal_swat_mask",
				type_items = "masks"
			},
			{
				item_entry = "digital_camo",
				type_items = "materials"
			},
			{
				item_entry = "bullets",
				type_items = "textures"
			},
			{
				tango_weapon_part = true
			}
		}
	})
	table.insert(self.challenges, {
		desc_id = "menu_tango_4_desc",
		id = "tango_4",
		name_id = "menu_tango_4",
		reward_type = "tango",
		show_progress = true,
		objectives = {
			tweak_data.safehouse:_progress("tango_4_key_1", 1, {
				desc_id = "menu_tango_4_key_1_desc",
				name_id = "menu_tango_key_1"
			}),
			tweak_data.safehouse:_progress("tango_4_key_2", 1, {
				desc_id = "menu_tango_4_key_2_desc",
				name_id = "menu_tango_key_2"
			}),
			tweak_data.safehouse:_progress("tango_4_case", 1, {
				desc_id = "menu_tango_4_case_desc",
				name_id = "menu_tango_case"
			})
		},
		rewards = {
			{
				item_entry = "tng_cap",
				type_items = "masks"
			},
			{
				item_entry = "midnight_camo",
				type_items = "materials"
			},
			{
				item_entry = "stripes",
				type_items = "textures"
			},
			{
				tango_weapon_part = true
			}
		}
	})
end
