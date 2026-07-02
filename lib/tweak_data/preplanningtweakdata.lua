PrePlanningTweakData = PrePlanningTweakData or class()

function PrePlanningTweakData:get_custom_texture_rect(num)
	if not num then
		return
	end

	local x = math.floor(num / 10) - 1
	local y = num % 10 - 1

	return {
		x * 48,
		y * 48,
		48,
		48
	}
end

function PrePlanningTweakData:get_category_texture_rect(num)
	if not num then
		return
	end

	local x = math.floor(num / 10) - 1
	local y = num % 10 - 1

	return {
		x * 64,
		y * 64,
		64,
		64
	}
end

function PrePlanningTweakData:get_type_texture_rect(num)
	if not num then
		return
	end

	local x = math.floor(num / 10) - 1
	local y = num % 10 - 1

	return {
		x * 48,
		y * 48,
		48,
		48
	}
end

function PrePlanningTweakData:init(tweak_data)
	self:_create_locations(tweak_data)

	self.plans = {}
	self.plans.escape_plan = {}
	self.plans.escape_plan.category = "escape_plan"
	self.plans.vault_plan = {}
	self.plans.vault_plan.category = "vault_plan"
	self.plans.plan_of_action = {}
	self.plans.plan_of_action.category = "plan_of_action"
	self.plans.entry_plan = {}
	self.plans.entry_plan.category = "entry_plan"
	self.plans.entry_plan_generic = {}
	self.plans.entry_plan_generic.category = "entry_plan_generic"
	self.gui = {}
	self.gui.custom_icons_path = "guis/dlcs/deep/textures/pd2/pre_planning/preplan_icon_types"
	self.gui.type_icons_path = "guis/dlcs/deep/textures/pd2/pre_planning/preplan_icon_types"
	self.gui.category_icons_path = "guis/dlcs/deep/textures/pd2/pre_planning/preplan_icon_frames"
	self.gui.category_icons_bg = 42
	self.gui.MAX_DRAW_POINTS = 1000
	self.categories = {}
	self.categories.default = {}
	self.categories.default.name_id = "menu_pp_cat_default"
	self.categories.default.desc_id = "menu_pp_cat_default_desc"
	self.categories.default.icon = 32
	self.categories.default.prio = 0
	self.categories.dead_drop = {}
	self.categories.dead_drop.name_id = "menu_pp_cat_dead_drop"
	self.categories.dead_drop.desc_id = "menu_pp_cat_dead_drop_desc"
	self.categories.dead_drop.icon = 22
	self.categories.dead_drop.prio = 5
	self.categories.mission_equipment = {}
	self.categories.mission_equipment.name_id = "menu_pp_cat_mission_equipment"
	self.categories.mission_equipment.desc_id = "menu_pp_cat_mission_equipment_desc"
	self.categories.mission_equipment.icon = 11
	self.categories.mission_equipment.prio = 0
	self.categories.insider_help = {}
	self.categories.insider_help.name_id = "menu_pp_cat_insider_help"
	self.categories.insider_help.desc_id = "menu_pp_cat_insider_help_desc"
	self.categories.insider_help.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.categories.insider_help.icon = 21
	self.categories.insider_help.prio = 2
	self.categories.data_hacking = {}
	self.categories.data_hacking.name_id = "menu_pp_cat_data_hacking"
	self.categories.data_hacking.desc_id = "menu_pp_cat_data_hacking_desc"
	self.categories.data_hacking.icon = 31
	self.categories.data_hacking.prio = 3
	self.categories.hired_help = {}
	self.categories.hired_help.name_id = "menu_pp_cat_hired_help"
	self.categories.hired_help.desc_id = "menu_pp_cat_hired_help_desc"
	self.categories.hired_help.icon = 41
	self.categories.hired_help.prio = 1
	self.categories.surveillance = {}
	self.categories.surveillance.name_id = "menu_pp_cat_surveillance"
	self.categories.surveillance.desc_id = "menu_pp_cat_surveillance_desc"
	self.categories.surveillance.icon = 41
	self.categories.surveillance.prio = 4
	self.categories.vault_plan = {}
	self.categories.vault_plan.name_id = "menu_pp_cat_vault_plan"
	self.categories.vault_plan.desc_id = "menu_pp_cat_vault_plan_desc"
	self.categories.vault_plan.plan = "vault_plan"
	self.categories.vault_plan.icon = 11
	self.categories.vault_plan.prio = 2
	self.categories.escape_plan = {}
	self.categories.escape_plan.name_id = "menu_pp_cat_escape_plan"
	self.categories.escape_plan.desc_id = "menu_pp_cat_escape_plan_desc"
	self.categories.escape_plan.plan = "escape_plan"
	self.categories.escape_plan.icon = 12
	self.categories.escape_plan.total = 1
	self.categories.escape_plan.prio = 1
	self.categories.plan_of_action = {}
	self.categories.plan_of_action.name_id = "menu_pp_cat_plan_of_action"
	self.categories.plan_of_action.desc_id = "menu_pp_cat_plan_of_action_desc"
	self.categories.plan_of_action.plan = "plan_of_action"
	self.categories.plan_of_action.icon = 12
	self.categories.plan_of_action.total = 1
	self.categories.plan_of_action.prio = 1
	self.categories.entry_plan_generic = {}
	self.categories.entry_plan_generic.name_id = "menu_pp_cat_entry_plan_generic"
	self.categories.entry_plan_generic.desc_id = "menu_pp_cat_entry_plan_generic_desc"
	self.categories.entry_plan_generic.plan = "entry_plan_generic"
	self.categories.entry_plan_generic.icon = 12
	self.categories.entry_plan_generic.total = 1
	self.categories.entry_plan_generic.prio = 1
	self.categories.entry_plan = {}
	self.categories.entry_plan.name_id = "menu_pp_cat_entry_plan"
	self.categories.entry_plan.desc_id = "menu_pp_cat_entry_plan_desc"
	self.categories.entry_plan.plan = "entry_plan"
	self.categories.entry_plan.icon = 12
	self.categories.entry_plan.total = 1
	self.categories.entry_plan.prio = 1
	self.categories.BFD_upgrades = {}
	self.categories.BFD_upgrades.name_id = "menu_pp_cat_BFD_upgrades"
	self.categories.BFD_upgrades.desc_id = "menu_pp_cat_BFD_upgrades_desc"
	self.categories.BFD_upgrades.icon = 12
	self.categories.BFD_upgrades.prio = 1
	self.categories.BFD_attachments = {}
	self.categories.BFD_attachments.name_id = "menu_pp_cat_BFD_attachments"
	self.categories.BFD_attachments.desc_id = "menu_pp_cat_BFD_attachments_desc"
	self.categories.BFD_attachments.icon = 12
	self.categories.BFD_attachments.prio = 1
	self.types = {}
	self.types.ammo_bag = {}
	self.types.ammo_bag.name_id = "menu_pp_asset_ammo"
	self.types.ammo_bag.desc_id = "menu_pp_asset_ammo_desc"
	self.types.ammo_bag.deployable_id = "ammo_bag"
	self.types.ammo_bag.icon = 52
	self.types.ammo_bag.category = "dead_drop"
	self.types.ammo_bag.total = 2
	self.types.ammo_bag.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.ammo_bag.budget_cost = 2
	self.types.ammo_bag.post_event = "preplan_05"
	self.types.ammo_bag.prio = 5
	self.types.health_bag = {}
	self.types.health_bag.name_id = "menu_pp_asset_health"
	self.types.health_bag.desc_id = "menu_pp_asset_health_desc"
	self.types.health_bag.deployable_id = "doctor_bag"
	self.types.health_bag.icon = 31
	self.types.health_bag.category = "dead_drop"
	self.types.health_bag.total = 2
	self.types.health_bag.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.health_bag.budget_cost = 2
	self.types.health_bag.post_event = "preplan_06"
	self.types.health_bag.prio = 6
	self.types.bodybags_bag = {}
	self.types.bodybags_bag.name_id = "menu_pp_asset_bodybags_bag"
	self.types.bodybags_bag.desc_id = "menu_pp_asset_bodybags_bag_desc"
	self.types.bodybags_bag.deployable_id = "bodybags_bag"
	self.types.bodybags_bag.icon = 13
	self.types.bodybags_bag.category = "dead_drop"
	self.types.bodybags_bag.upgrade_lock = {
		category = "player",
		upgrade = "buy_bodybags_asset"
	}
	self.types.bodybags_bag.total = 2
	self.types.bodybags_bag.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.bodybags_bag.budget_cost = 2
	self.types.bodybags_bag.post_event = "preplan_15"
	self.types.bodybags_bag.prio = 3
	self.types.grenade_crate = {}
	self.types.grenade_crate.name_id = "menu_pp_asset_grenade_crate"
	self.types.grenade_crate.desc_id = "menu_pp_asset_grenade_crate_desc"
	self.types.grenade_crate.deployable_id = "grenade_crate"
	self.types.grenade_crate.icon = 21
	self.types.grenade_crate.category = "dead_drop"
	self.types.grenade_crate.dlc_lock = "gage_pack"
	self.types.grenade_crate.total = 2
	self.types.grenade_crate.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.grenade_crate.budget_cost = 2
	self.types.grenade_crate.post_event = "preplan_15"
	self.types.grenade_crate.prio = 4
	self.types.grenade_crate.progress_stat = "gage_10_stats"
	self.types.car = {}
	self.types.car.name_id = "menu_asset_car"
	self.types.car.total = 1
	self.types.drill_parts = {}
	self.types.drill_parts.name_id = "menu_pp_asset_drill_parts"
	self.types.drill_parts.desc_id = "menu_pp_asset_drill_parts_desc"
	self.types.drill_parts.category = "dead_drop"
	self.types.drill_parts.icon = 12
	self.types.drill_parts.total = 1
	self.types.drill_parts.post_event = "preplan_16"
	self.types.drill_parts.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_drillparts")
	self.types.drill_parts.budget_cost = 3
	self.types.drill_parts.prio = 2
	self.types.zipline = {}
	self.types.zipline.name_id = "menu_pp_asset_zipline"
	self.types.zipline.desc_id = "menu_pp_asset_zipline_desc"
	self.types.zipline.category = "mission_equipment"
	self.types.zipline.icon = 23
	self.types.zipline.total = 1
	self.types.zipline.post_event = "preplan_07"
	self.types.zipline.prio = 1
	self.types.zipline.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_zipline")
	self.types.zipline.budget_cost = 2
	self.types.zipline_generic = deep_clone(self.types.zipline)
	self.types.zipline_generic.desc_id = "menu_pp_asset_zipline_generic_desc"
	self.types.unlocked_door = {}
	self.types.unlocked_door.name_id = "menu_pp_asset_unlocked_door"
	self.types.unlocked_door.desc_id = "menu_pp_asset_unlocked_door_desc"
	self.types.unlocked_door.category = "mission_equipment"
	self.types.unlocked_door.icon = 41
	self.types.unlocked_door.total = 1
	self.types.unlocked_door.post_event = "preplan_07"
	self.types.unlocked_door.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_door")
	self.types.unlocked_door.budget_cost = 1
	self.types.unlocked_door.prio = 2
	self.types.unlocked_window = {}
	self.types.unlocked_window.name_id = "menu_pp_asset_unlocked_window"
	self.types.unlocked_window.desc_id = "menu_pp_asset_unlocked_window_desc"
	self.types.unlocked_window.category = "mission_equipment"
	self.types.unlocked_window.icon = 41
	self.types.unlocked_window.total = 5
	self.types.unlocked_window.post_event = "preplan_07"
	self.types.unlocked_window.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_window")
	self.types.unlocked_window.budget_cost = 1
	self.types.unlocked_window.prio = 2
	self.types.highlight_keybox = {}
	self.types.highlight_keybox.name_id = "menu_pp_asset_highlight_keybox"
	self.types.highlight_keybox.desc_id = "menu_pp_asset_highlight_keybox_desc"
	self.types.highlight_keybox.category = "mission_equipment"
	self.types.highlight_keybox.icon = 43
	self.types.highlight_keybox.total = 1
	self.types.highlight_keybox.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_highlight_keybox")
	self.types.highlight_keybox.budget_cost = 2
	self.types.highlight_keybox.post_event = "preplan_16"
	self.types.highlight_keybox.prio = 2
	self.types.ladder = {}
	self.types.ladder.name_id = "menu_pp_asset_ladder"
	self.types.ladder.category = "mission_equipment"
	self.types.ladder.total = 1
	self.types.ladder.post_event = "preplan_07"
	self.types.ladder.prio = 2
	self.types.disable_camera = {}
	self.types.disable_camera.name_id = "menu_pp_asset_disable_camera"
	self.types.disable_camera.category = "surveillance"
	self.types.disable_camera.total = 1
	self.types.disable_camera.post_event = "preplan_08"
	self.types.disable_camera.prio = 2
	self.types.disable_metal_detector = {}
	self.types.disable_metal_detector.name_id = "menu_pp_asset_disable_metal_detector"
	self.types.disable_metal_detector.category = "insider_help"
	self.types.disable_metal_detector.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.disable_metal_detector.total = 1
	self.types.disable_metal_detector.post_event = "preplan_10"
	self.types.disable_metal_detector.prio = 3
	self.types.disable_guards_cake = {}
	self.types.disable_guards_cake.name_id = "menu_pp_asset_disable_guards_cake"
	self.types.disable_guards_cake.desc_id = "menu_pp_asset_disable_guards_cake_desc"
	self.types.disable_guards_cake.category = "insider_help"
	self.types.disable_guards_cake.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.disable_guards_cake.icon = 25
	self.types.disable_guards_cake.total = 1
	self.types.disable_guards_cake.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_cake")
	self.types.disable_guards_cake.budget_cost = 3
	self.types.disable_guards_cake.post_event = "preplan_09"
	self.types.disable_guards_cake.prio = 1
	self.types.extra_cameras = {}
	self.types.extra_cameras.name_id = "menu_pp_asset_extra_cameras"
	self.types.extra_cameras.desc_id = "menu_pp_asset_extra_cameras_desc"
	self.types.extra_cameras.category = "surveillance"
	self.types.extra_cameras.look_angle = {
		angle = 80,
		length = 0.3,
		color = Color(192, 255, 170, 0) / 255
	}
	self.types.extra_cameras.icon = 11
	self.types.extra_cameras.total = 9
	self.types.extra_cameras.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_extracameras")
	self.types.extra_cameras.budget_cost = 1
	self.types.extra_cameras.post_event = "preplan_16"
	self.types.extra_cameras.prio = 2
	self.types.keycard = {}
	self.types.keycard.name_id = "menu_pp_asset_keycard"
	self.types.keycard.desc_id = "menu_pp_asset_keycard_desc"
	self.types.keycard.category = "insider_help"
	self.types.keycard.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.keycard.icon = 53
	self.types.keycard.total = 1
	self.types.keycard.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_keycard")
	self.types.keycard.budget_cost = 2
	self.types.keycard.post_event = "preplan_16"
	self.types.keycard.prio = 2
	self.types.camera_access = {}
	self.types.camera_access.name_id = "menu_pp_camera_access"
	self.types.camera_access.desc_id = "menu_pp_camera_access_desc"
	self.types.camera_access.category = "surveillance"
	self.types.camera_access.icon = 24
	self.types.camera_access.total = 1
	self.types.camera_access.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_accesscameras")
	self.types.camera_access.budget_cost = 2
	self.types.camera_access.post_event = "preplan_16"
	self.types.camera_access.prio = 8
	self.types.delay_police_10 = {}
	self.types.delay_police_10.name_id = "menu_pp_asset_delay_police_10"
	self.types.delay_police_10.desc_id = "menu_pp_asset_delay_police_10_desc"
	self.types.delay_police_10.delay_weapons_hot_t = 10
	self.types.delay_police_10.icon = 42
	self.types.delay_police_10.category = "data_hacking"
	self.types.delay_police_10.total = 1
	self.types.delay_police_10.post_event = "preplan_04"
	self.types.delay_police_10.prio = 7
	self.types.delay_police_10_no_pos = deep_clone(self.types.delay_police_10)
	self.types.delay_police_10_no_pos.budget_cost = 1
	self.types.delay_police_10_no_pos.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_delay10")
	self.types.delay_police_10_no_pos.pos_not_important = true
	self.types.delay_police_20 = {}
	self.types.delay_police_20.name_id = "menu_pp_asset_delay_police_20"
	self.types.delay_police_20.desc_id = "menu_pp_asset_delay_police_20_desc"
	self.types.delay_police_20.delay_weapons_hot_t = 20
	self.types.delay_police_20.icon = 42
	self.types.delay_police_20.category = "data_hacking"
	self.types.delay_police_20.total = 1
	self.types.delay_police_20.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_delay20")
	self.types.delay_police_20.budget_cost = 1
	self.types.delay_police_20.post_event = "preplan_04"
	self.types.delay_police_20.prio = 6
	self.types.delay_police_30 = {}
	self.types.delay_police_30.name_id = "menu_pp_asset_delay_police_30"
	self.types.delay_police_30.desc_id = "menu_pp_asset_delay_police_30_desc"
	self.types.delay_police_30.delay_weapons_hot_t = 30
	self.types.delay_police_30.icon = 42
	self.types.delay_police_30.category = "data_hacking"
	self.types.delay_police_30.total = 1
	self.types.delay_police_30.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_delay30")
	self.types.delay_police_30.budget_cost = 2
	self.types.delay_police_30.post_event = "preplan_10"
	self.types.delay_police_30.prio = 5
	self.types.delay_police_30_no_pos = deep_clone(self.types.delay_police_30)
	self.types.delay_police_30_no_pos.pos_not_important = true
	self.types.delay_police_60 = {}
	self.types.delay_police_60.name_id = "menu_pp_asset_delay_police_60"
	self.types.delay_police_60.desc_id = "menu_pp_asset_delay_police_60_desc"
	self.types.delay_police_60.delay_weapons_hot_t = 60
	self.types.delay_police_60.icon = 42
	self.types.delay_police_60.category = "data_hacking"
	self.types.delay_police_60.total = 1
	self.types.delay_police_60.budget_cost = 4
	self.types.delay_police_60.post_event = "preplan_04"
	self.types.delay_police_60.prio = 4
	self.types.reduce_timelock_60 = {}
	self.types.reduce_timelock_60.name_id = "menu_pp_asset_reduce_timelock_60"
	self.types.reduce_timelock_60.desc_id = "menu_pp_asset_reduce_timelock_60_desc"
	self.types.reduce_timelock_60.reduce_timelock_t = 60
	self.types.reduce_timelock_60.icon = 15
	self.types.reduce_timelock_60.category = "data_hacking"
	self.types.reduce_timelock_60.total = 1
	self.types.reduce_timelock_60.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_timelock60")
	self.types.reduce_timelock_60.budget_cost = 2
	self.types.reduce_timelock_60.post_event = "preplan_10"
	self.types.reduce_timelock_60.prio = 3
	self.types.reduce_timelock_120 = {}
	self.types.reduce_timelock_120.name_id = "menu_pp_asset_reduce_timelock_120"
	self.types.reduce_timelock_120.desc_id = "menu_pp_asset_reduce_timelock_120_desc"
	self.types.reduce_timelock_120.reduce_timelock_t = 120
	self.types.reduce_timelock_120.icon = 15
	self.types.reduce_timelock_120.category = "data_hacking"
	self.types.reduce_timelock_120.total = 1
	self.types.reduce_timelock_120.budget_cost = 4
	self.types.reduce_timelock_120.post_event = "preplan_10"
	self.types.reduce_timelock_120.prio = 2
	self.types.reduce_timelock_240 = {}
	self.types.reduce_timelock_240.name_id = "menu_pp_asset_reduce_timelock_240"
	self.types.reduce_timelock_240.desc_id = "menu_pp_asset_reduce_timelock_240_desc"
	self.types.reduce_timelock_240.reduce_timelock_t = 240
	self.types.reduce_timelock_240.icon = 15
	self.types.reduce_timelock_240.category = "data_hacking"
	self.types.reduce_timelock_240.total = 1
	self.types.reduce_timelock_240.budget_cost = 6
	self.types.reduce_timelock_240.post_event = "preplan_10"
	self.types.reduce_timelock_240.prio = 1
	self.types.spycam = {}
	self.types.spycam.name_id = "menu_asset_spycam"
	self.types.spycam.desc_id = "menu_asset_spycam_desc"
	self.types.spycam.category = "surveillance"
	self.types.spycam.upgrade_lock = {
		category = "player",
		upgrade = "buy_spotter_asset"
	}
	self.types.spycam.look_angle = {
		angle = 80,
		length = 0.5,
		color = Color(192, 255, 51, 51) / 255
	}
	self.types.spycam.icon = 35
	self.types.spycam.total = 3
	self.types.spycam.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_spycam")
	self.types.spycam.budget_cost = 2
	self.types.spycam.post_event = "preplan_14"
	self.types.spycam.prio = 3
	self.types.spotter = {}
	self.types.spotter.name_id = "menu_asset_spotter"
	self.types.spotter.category = "hired_help"
	self.types.spotter.upgrade_lock = {
		category = "player",
		upgrade = "buy_spotter_asset"
	}
	self.types.spotter.look_angle = {
		angle = 80,
		length = 0.5,
		color = Color(192, 255, 51, 51) / 255
	}
	self.types.spotter.icon = 33
	self.types.spotter.total = 1
	self.types.spotter.budget_cost = 2
	self.types.spotter.post_event = "preplan_13"
	self.types.spotter.prio = 4
	self.types.spotter_des = deep_clone(self.types.spotter)
	self.types.spotter_des.budget_cost = 3
	self.types.spotter_des.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_spotter")
	self.types.spotter_des.desc_id = "menu_pp_asset_spotter_desc"
	self.types.sniper = {}
	self.types.sniper.name_id = "menu_pp_asset_sniper"
	self.types.sniper.desc_id = "menu_pp_asset_sniper_desc"
	self.types.sniper.category = "hired_help"
	self.types.sniper.icon = 55
	self.types.sniper.total = 1
	self.types.sniper.post_event = "preplan_13"
	self.types.sniper.prio = 1
	self.types.sniper.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_sniper")
	self.types.sniper.budget_cost = 1
	self.types.delayed_police = {}
	self.types.delayed_police.name_id = "menu_pp_asset_delayed_police"
	self.types.delayed_police.desc_id = "menu_pp_asset_delayed_police_desc"
	self.types.delayed_police.category = "hired_help"
	self.types.delayed_police.icon = 15
	self.types.delayed_police.total = 1
	self.types.delayed_police.post_event = "preplan_13"
	self.types.delayed_police.prio = 1
	self.types.delayed_police.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_delayed_police")
	self.types.delayed_police.budget_cost = 1
	self.types.reduce_mobsters = {}
	self.types.reduce_mobsters.name_id = "menu_pp_asset_reduce_mobsters"
	self.types.reduce_mobsters.desc_id = "menu_pp_asset_reduce_mobsters_desc"
	self.types.reduce_mobsters.category = "hired_help"
	self.types.reduce_mobsters.icon = 61
	self.types.reduce_mobsters.total = 1
	self.types.reduce_mobsters.post_event = "preplan_13"
	self.types.reduce_mobsters.prio = 1
	self.types.reduce_mobsters.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_reduce_mobsters")
	self.types.reduce_mobsters.budget_cost = 1
	self.types.escape_van_loud = {}
	self.types.escape_van_loud.name_id = "menu_pp_escape_van_loud"
	self.types.escape_van_loud.desc_id = "menu_pp_escape_van_loud_desc"
	self.types.escape_van_loud.plan = "escape_plan"
	self.types.escape_van_loud.pos_not_important = false
	self.types.escape_van_loud.category = "escape_plan"
	self.types.escape_van_loud.total = 1
	self.types.escape_van_loud.cost = 0
	self.types.escape_van_loud.budget_cost = 0
	self.types.escape_van_loud.post_event = "preplan_17"
	self.types.escape_van_loud.prio = 6
	self.types.escape_bus_loud = {}
	self.types.escape_bus_loud.name_id = "menu_pp_escape_bus_loud"
	self.types.escape_bus_loud.desc_id = "menu_pp_escape_bus_loud_desc"
	self.types.escape_bus_loud.plan = "escape_plan"
	self.types.escape_bus_loud.pos_not_important = false
	self.types.escape_bus_loud.category = "escape_plan"
	self.types.escape_bus_loud.icon = 54
	self.types.escape_bus_loud.total = 1
	self.types.escape_bus_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.escape_bus_loud.budget_cost = 6
	self.types.escape_bus_loud.post_event = "preplan_17"
	self.types.escape_bus_loud.prio = 1
	self.types.escape_c4_loud = {}
	self.types.escape_c4_loud.name_id = "menu_pp_escape_c4_loud"
	self.types.escape_c4_loud.desc_id = "menu_pp_escape_c4_loud_desc"
	self.types.escape_c4_loud.plan = "escape_plan"
	self.types.escape_c4_loud.pos_not_important = false
	self.types.escape_c4_loud.category = "escape_plan"
	self.types.escape_c4_loud.icon = 54
	self.types.escape_c4_loud.total = 1
	self.types.escape_c4_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.escape_c4_loud.budget_cost = 3
	self.types.escape_c4_loud.post_event = "preplan_17"
	self.types.escape_c4_loud.prio = 2
	self.types.escape_elevator_loud = {}
	self.types.escape_elevator_loud.name_id = "menu_pp_escape_elevator_loud"
	self.types.escape_elevator_loud.desc_id = "menu_pp_escape_elevator_loud_desc"
	self.types.escape_elevator_loud.plan = "escape_plan"
	self.types.escape_elevator_loud.pos_not_important = false
	self.types.escape_elevator_loud.category = "escape_plan"
	self.types.escape_elevator_loud.icon = 54
	self.types.escape_elevator_loud.total = 1
	self.types.escape_elevator_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.escape_elevator_loud.budget_cost = 3
	self.types.escape_elevator_loud.post_event = "preplan_17"
	self.types.escape_elevator_loud.prio = 3
	self.types.escape_zipline_loud = {}
	self.types.escape_zipline_loud.name_id = "menu_pp_escape_zipline_loud"
	self.types.escape_zipline_loud.desc_id = "menu_pp_escape_zipline_loud_desc"
	self.types.escape_zipline_loud.plan = "escape_plan"
	self.types.escape_zipline_loud.pos_not_important = false
	self.types.escape_zipline_loud.category = "escape_plan"
	self.types.escape_zipline_loud.icon = 54
	self.types.escape_zipline_loud.total = 1
	self.types.escape_zipline_loud.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_zipline")
	self.types.escape_zipline_loud.budget_cost = 3
	self.types.escape_zipline_loud.post_event = "preplan_17"
	self.types.escape_zipline_loud.prio = 2
	self.types.escape_helicopter_loud = {}
	self.types.escape_helicopter_loud.name_id = "menu_pp_escape_helicopter_loud"
	self.types.escape_helicopter_loud.desc_id = "menu_pp_escape_helicopter_loud_desc"
	self.types.escape_helicopter_loud.plan = "escape_plan"
	self.types.escape_helicopter_loud.pos_not_important = false
	self.types.escape_helicopter_loud.category = "escape_plan"
	self.types.escape_helicopter_loud.icon = 54
	self.types.escape_helicopter_loud.total = 1
	self.types.escape_helicopter_loud.cost = 0
	self.types.escape_helicopter_loud.budget_cost = 0
	self.types.escape_helicopter_loud.post_event = "preplan_17"
	self.types.escape_helicopter_loud.prio = 3
	self.types.escape_aliens_loud = {}
	self.types.escape_aliens_loud.name_id = "menu_pp_escape_aliens_loud"
	self.types.escape_aliens_loud.desc_id = "menu_pp_escape_aliens_loud_desc"
	self.types.escape_aliens_loud.plan = "escape_plan"
	self.types.escape_aliens_loud.pos_not_important = false
	self.types.escape_aliens_loud.deployable_id = "ammo_bag"
	self.types.escape_aliens_loud.category = "escape_plan"
	self.types.escape_aliens_loud.total = 1
	self.types.escape_aliens_loud.cost = tweak_data:get_value("money_manager", "mission_asset_cost_large", 10)
	self.types.escape_aliens_loud.budget_cost = 10
	self.types.escape_aliens_loud.post_event = "preplan_17"
	self.types.escape_aliens_loud.prio = 99
	self.types.vault_drill = {}
	self.types.vault_drill.name_id = "menu_pp_vault_drill"
	self.types.vault_drill.plan = "vault_plan"
	self.types.vault_drill.pos_not_important = false
	self.types.vault_drill.category = "vault_plan"
	self.types.vault_drill.total = 1
	self.types.vault_drill.cost = 0
	self.types.vault_drill.budget_cost = 0
	self.types.vault_drill.post_event = "preplan_17"
	self.types.vault_drill.prio = 2
	self.types.vault_drill.prio = 5
	self.types.vault_c4 = {}
	self.types.vault_c4.name_id = "menu_pp_vault_c4"
	self.types.vault_c4.plan = "vault_plan"
	self.types.vault_c4.pos_not_important = false
	self.types.vault_c4.category = "vault_plan"
	self.types.vault_c4.total = 1
	self.types.vault_c4.cost = tweak_data:get_value("money_manager", "mission_asset_cost_large", 1)
	self.types.vault_c4.budget_cost = 4
	self.types.vault_c4.post_event = "preplan_17"
	self.types.vault_c4.prio = 2
	self.types.vault_lance = {}
	self.types.vault_lance.name_id = "menu_pp_vault_lance"
	self.types.vault_lance.plan = "vault_plan"
	self.types.vault_lance.pos_not_important = false
	self.types.vault_lance.category = "vault_plan"
	self.types.vault_lance.icon = 12
	self.types.vault_lance.total = 1
	self.types.vault_lance.cost = 0
	self.types.vault_lance.budget_cost = 0
	self.types.vault_lance.post_event = "preplan_17"
	self.types.vault_lance.prio = 5
	self.types.vault_big_drill = {}
	self.types.vault_big_drill.name_id = "menu_pp_vault_big_drill"
	self.types.vault_big_drill.desc_id = "menu_pp_vault_big_drill_desc"
	self.types.vault_big_drill.plan = "vault_plan"
	self.types.vault_big_drill.pos_not_important = false
	self.types.vault_big_drill.category = "vault_plan"
	self.types.vault_big_drill.icon = 12
	self.types.vault_big_drill.total = 1
	self.types.vault_big_drill.cost = 0
	self.types.vault_big_drill.budget_cost = 0
	self.types.vault_big_drill.post_event = "preplan_17"
	self.types.vault_big_drill.prio = 5
	self.types.vault_thermite = {}
	self.types.vault_thermite.name_id = "menu_pp_vault_thermite"
	self.types.vault_thermite.desc_id = "menu_pp_vault_thermite_desc"
	self.types.vault_thermite.plan = "vault_plan"
	self.types.vault_thermite.pos_not_important = false
	self.types.vault_thermite.category = "vault_plan"
	self.types.vault_thermite.icon = 51
	self.types.vault_thermite.total = 1
	self.types.vault_thermite.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_thermite")
	self.types.vault_thermite.budget_cost = 5
	self.types.vault_thermite.post_event = "preplan_02"
	self.types.vault_thermite.prio = 1
	self.types.vault_singularity = {}
	self.types.vault_singularity.name_id = "menu_pp_vault_singularity"
	self.types.vault_singularity.plan = "vault_plan"
	self.types.vault_singularity.pos_not_important = false
	self.types.vault_singularity.category = "vault_plan"
	self.types.vault_singularity.total = 1
	self.types.vault_singularity.cost = tweak_data:get_value("money_manager", "mission_asset_cost_large", 10)
	self.types.vault_singularity.budget_cost = 10
	self.types.vault_singularity.post_event = "preplan_17"
	self.types.vault_singularity.prio = 99
	self.types.disable_alarm_button = {}
	self.types.disable_alarm_button.name_id = "menu_pp_asset_disable_alarm_button"
	self.types.disable_alarm_button.desc_id = "menu_pp_asset_disable_alarm_button_desc"
	self.types.disable_alarm_button.category = "data_hacking"
	self.types.disable_alarm_button.icon = 42
	self.types.disable_alarm_button.total = 1
	self.types.disable_alarm_button.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_disable_alarm_button")
	self.types.disable_alarm_button.budget_cost = 3
	self.types.disable_alarm_button.post_event = "preplan_16"
	self.types.disable_alarm_button.prio = 1
	self.types.safe_escape = {}
	self.types.safe_escape.name_id = "menu_pp_asset_safe_escape"
	self.types.safe_escape.desc_id = "menu_pp_asset_safe_escape_desc"
	self.types.safe_escape.category = "insider_help"
	self.types.safe_escape.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.safe_escape.icon = 54
	self.types.safe_escape.total = 1
	self.types.safe_escape.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_safe_escape")
	self.types.safe_escape.budget_cost = 3
	self.types.safe_escape.post_event = "preplan_16"
	self.types.safe_escape.prio = 1
	self.types.sniper_spot = {}
	self.types.sniper_spot.name_id = "menu_pp_asset_sniper_spot"
	self.types.sniper_spot.desc_id = "menu_pp_asset_sniper_spot_desc"
	self.types.sniper_spot.category = "hired_help"
	self.types.sniper_spot.icon = 55
	self.types.sniper_spot.total = 1
	self.types.sniper_spot.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_sniper_spot")
	self.types.sniper_spot.budget_cost = 3
	self.types.sniper_spot.post_event = "preplan_16"
	self.types.sniper_spot.prio = 1
	self.types.bag_shortcut = {}
	self.types.bag_shortcut.name_id = "menu_pp_asset_bag_shortcut"
	self.types.bag_shortcut.desc_id = "menu_pp_asset_bag_shortcut_desc"
	self.types.bag_shortcut.category = "mission_equipment"
	self.types.bag_shortcut.icon = 34
	self.types.bag_shortcut.total = 1
	self.types.bag_shortcut.post_event = "preplan_16"
	self.types.bag_shortcut.prio = 1
	self.types.bag_shortcut.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_bag_shortcut")
	self.types.bag_shortcut.budget_cost = 2
	self.types.bag_zipline = {}
	self.types.bag_zipline.name_id = "menu_pp_asset_bag_zipline"
	self.types.bag_zipline.desc_id = "menu_pp_asset_bag_zipline_desc"
	self.types.bag_zipline.category = "mission_equipment"
	self.types.bag_zipline.icon = 34
	self.types.bag_zipline.total = 1
	self.types.bag_zipline.post_event = "preplan_16"
	self.types.bag_zipline.prio = 1
	self.types.bag_zipline.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_bag_zipline")
	self.types.bag_zipline.budget_cost = 2
	self.types.bag_zipline_stealth_only = {}
	self.types.bag_zipline_stealth_only.name_id = "menu_pp_asset_bag_zipline_stealth_only"
	self.types.bag_zipline_stealth_only.desc_id = "menu_pp_asset_bag_zipline_stealth_only_desc"
	self.types.bag_zipline_stealth_only.category = "mission_equipment"
	self.types.bag_zipline_stealth_only.icon = 34
	self.types.bag_zipline_stealth_only.total = 1
	self.types.bag_zipline_stealth_only.post_event = "preplan_16"
	self.types.bag_zipline_stealth_only.prio = 1
	self.types.bag_zipline_stealth_only.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_bag_zipline")
	self.types.bag_zipline_stealth_only.budget_cost = 2
	self.types.loot_drop_off = {}
	self.types.loot_drop_off.name_id = "menu_pp_asset_loot_drop_off"
	self.types.loot_drop_off.desc_id = "menu_pp_asset_loot_drop_off_desc"
	self.types.loot_drop_off.category = "hired_help"
	self.types.loot_drop_off.icon = 34
	self.types.loot_drop_off.total = 1
	self.types.loot_drop_off.post_event = "preplan_16"
	self.types.loot_drop_off.prio = 1
	self.types.loot_drop_off.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_loot_drop_off")
	self.types.loot_drop_off.budget_cost = 2
	self.types.loot_drop_off_stealth_only = {}
	self.types.loot_drop_off_stealth_only.name_id = "menu_pp_asset_loot_drop_off_stealth_only"
	self.types.loot_drop_off_stealth_only.desc_id = "menu_pp_asset_loot_drop_off_stealth_only_desc"
	self.types.loot_drop_off_stealth_only.category = "hired_help"
	self.types.loot_drop_off_stealth_only.icon = 34
	self.types.loot_drop_off_stealth_only.total = 1
	self.types.loot_drop_off_stealth_only.post_event = "preplan_16"
	self.types.loot_drop_off_stealth_only.prio = 1
	self.types.loot_drop_off_stealth_only.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_loot_drop_off")
	self.types.loot_drop_off_stealth_only.budget_cost = 2
	self.types.loot_drop_off_generic = deep_clone(self.types.loot_drop_off)
	self.types.loot_drop_off_generic.desc_id = "menu_pp_asset_loot_drop_off_generic_desc"
	self.types.thermal_paste = {}
	self.types.thermal_paste.name_id = "menu_pp_asset_thermal_paste"
	self.types.thermal_paste.desc_id = "menu_pp_asset_thermal_paste_desc"
	self.types.thermal_paste.category = "dead_drop"
	self.types.thermal_paste.icon = 51
	self.types.thermal_paste.total = 1
	self.types.thermal_paste.post_event = "preplan_16"
	self.types.thermal_paste.prio = 1
	self.types.thermal_paste.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_thermal_paste")
	self.types.thermal_paste.budget_cost = 3
	self.types.thermal_paste.spawn_unit = "units/payday2/equipment/gen_equipment_thermal_paste_crate/gen_equipment_thermal_paste_crate"
	self.types.framing_frame_1_truck = {}
	self.types.framing_frame_1_truck.name_id = "menu_pp_asset_framing_frame_1_truck"
	self.types.framing_frame_1_truck.desc_id = "menu_pp_asset_framing_frame_1_truck_desc"
	self.types.framing_frame_1_truck.category = "mission_equipment"
	self.types.framing_frame_1_truck.icon = 63
	self.types.framing_frame_1_truck.total = 1
	self.types.framing_frame_1_truck.post_event = "preplan_07"
	self.types.framing_frame_1_truck.prio = 1
	self.types.framing_frame_1_truck.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_framing_frame_1_truck")
	self.types.framing_frame_1_truck.budget_cost = 2
	self.types.framing_frame_1_entry_point = {}
	self.types.framing_frame_1_entry_point.name_id = "menu_pp_asset_framing_frame_1_entry_point"
	self.types.framing_frame_1_entry_point.desc_id = "menu_pp_asset_framing_frame_1_entry_point_desc"
	self.types.framing_frame_1_entry_point.category = "mission_equipment"
	self.types.framing_frame_1_entry_point.icon = 41
	self.types.framing_frame_1_entry_point.total = 1
	self.types.framing_frame_1_entry_point.post_event = "preplan_07"
	self.types.framing_frame_1_entry_point.prio = 1
	self.types.framing_frame_1_entry_point.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_framing_frame_1_entry_point")
	self.types.framing_frame_1_entry_point.budget_cost = 2
	self.types.branchbank_lance = {}
	self.types.branchbank_lance.name_id = "menu_pp_branchbank_lance"
	self.types.branchbank_lance.desc_id = "menu_pp_branchbank_lance_desc"
	self.types.branchbank_lance.plan = "vault_plan"
	self.types.branchbank_lance.pos_not_important = false
	self.types.branchbank_lance.category = "vault_plan"
	self.types.branchbank_lance.icon = 12
	self.types.branchbank_lance.total = 1
	self.types.branchbank_lance.cost = 0
	self.types.branchbank_lance.budget_cost = 0
	self.types.branchbank_lance.post_event = "preplan_17"
	self.types.branchbank_lance.prio = 5
	self.types.branchbank_vault_key = {}
	self.types.branchbank_vault_key.name_id = "menu_pp_asset_branchbank_vault_key"
	self.types.branchbank_vault_key.desc_id = "menu_pp_asset_branchbank_vault_key_desc"
	self.types.branchbank_vault_key.category = "mission_equipment"
	self.types.branchbank_vault_key.icon = 43
	self.types.branchbank_vault_key.total = 1
	self.types.branchbank_vault_key.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_branchbank_vault_key")
	self.types.branchbank_vault_key.budget_cost = 3
	self.types.branchbank_vault_key.post_event = "preplan_16"
	self.types.branchbank_vault_key.prio = 2
	self.types.crojob_stealth = {}
	self.types.crojob_stealth.name_id = "menu_pp_crojob_stealth"
	self.types.crojob_stealth.desc_id = "menu_pp_crojob_stealth_desc"
	self.types.crojob_stealth.plan = "plan_of_action"
	self.types.crojob_stealth.pos_not_important = true
	self.types.crojob_stealth.category = "plan_of_action"
	self.types.crojob_stealth.icon = 54
	self.types.crojob_stealth.total = 0
	self.types.crojob_stealth.cost = 0
	self.types.crojob_stealth.budget_cost = 0
	self.types.crojob_stealth.post_event = ""
	self.types.crojob_stealth.prio = 3
	self.types.crojob_loud = {}
	self.types.crojob_loud.name_id = "menu_pp_crojob_loud"
	self.types.crojob_loud.desc_id = "menu_pp_crojob_loud_desc"
	self.types.crojob_loud.plan = "plan_of_action"
	self.types.crojob_loud.pos_not_important = true
	self.types.crojob_loud.category = "plan_of_action"
	self.types.crojob_loud.icon = 54
	self.types.crojob_loud.total = 0
	self.types.crojob_loud.cost = 0
	self.types.crojob_loud.budget_cost = 0
	self.types.crojob_loud.post_event = ""
	self.types.crojob_loud.prio = 3
	self.types.crojob2_escape_van = {}
	self.types.crojob2_escape_van.name_id = "menu_pp_crojob2_escape_van"
	self.types.crojob2_escape_van.desc_id = "menu_pp_crojob2_escape_van_desc"
	self.types.crojob2_escape_van.plan = "escape_plan"
	self.types.crojob2_escape_van.pos_not_important = false
	self.types.crojob2_escape_van.category = "escape_plan"
	self.types.crojob2_escape_van.icon = 54
	self.types.crojob2_escape_van.total = 1
	self.types.crojob2_escape_van.cost = 0
	self.types.crojob2_escape_van.budget_cost = 0
	self.types.crojob2_escape_van.post_event = "preplan_12"
	self.types.crojob2_escape_van.prio = 3
	self.types.crojob2_escape_helicopter = {}
	self.types.crojob2_escape_helicopter.name_id = "menu_pp_crojob2_escape_helicopter"
	self.types.crojob2_escape_helicopter.desc_id = "menu_pp_crojob2_escape_helicopter_desc"
	self.types.crojob2_escape_helicopter.plan = "escape_plan"
	self.types.crojob2_escape_helicopter.pos_not_important = false
	self.types.crojob2_escape_helicopter.category = "escape_plan"
	self.types.crojob2_escape_helicopter.icon = 54
	self.types.crojob2_escape_helicopter.total = 1
	self.types.crojob2_escape_helicopter.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_escape_mid")
	self.types.crojob2_escape_helicopter.budget_cost = 4
	self.types.crojob2_escape_helicopter.post_event = "preplan_17"
	self.types.crojob2_escape_helicopter.prio = 3
	self.types.crojob2_escape_boat = {}
	self.types.crojob2_escape_boat.name_id = "menu_pp_crojob2_escape_boat"
	self.types.crojob2_escape_boat.desc_id = "menu_pp_crojob2_escape_boat_desc"
	self.types.crojob2_escape_boat.plan = "escape_plan"
	self.types.crojob2_escape_boat.pos_not_important = false
	self.types.crojob2_escape_boat.category = "escape_plan"
	self.types.crojob2_escape_boat.icon = 54
	self.types.crojob2_escape_boat.total = 1
	self.types.crojob2_escape_boat.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_escape_close")
	self.types.crojob2_escape_boat.budget_cost = 8
	self.types.crojob2_escape_boat.post_event = "preplan_13"
	self.types.crojob2_escape_boat.prio = 3
	self.types.crojob2_better_hacker = {}
	self.types.crojob2_better_hacker.name_id = "menu_pp_asset_crojob2_better_hacker"
	self.types.crojob2_better_hacker.desc_id = "menu_pp_asset_crojob2_better_hacker_desc"
	self.types.crojob2_better_hacker.icon = 15
	self.types.crojob2_better_hacker.pos_not_important = true
	self.types.crojob2_better_hacker.category = "hired_help"
	self.types.crojob2_better_hacker.total = 1
	self.types.crojob2_better_hacker.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_hacker")
	self.types.crojob2_better_hacker.budget_cost = 3
	self.types.crojob2_better_hacker.post_event = "preplan_10"
	self.types.crojob2_better_hacker.prio = 3
	self.types.crojob2_better_pilot = {}
	self.types.crojob2_better_pilot.name_id = "menu_pp_asset_crojob2_better_pilot"
	self.types.crojob2_better_pilot.desc_id = "menu_pp_asset_crojob2_better_pilot_desc"
	self.types.crojob2_better_pilot.icon = 73
	self.types.crojob2_better_pilot.pos_not_important = true
	self.types.crojob2_better_pilot.category = "hired_help"
	self.types.crojob2_better_pilot.total = 1
	self.types.crojob2_better_pilot.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_pilot")
	self.types.crojob2_better_pilot.budget_cost = 3
	self.types.crojob2_better_pilot.post_event = "preplan_17"
	self.types.crojob2_better_pilot.prio = 3
	self.types.crojob2_manifest = {}
	self.types.crojob2_manifest.name_id = "menu_pp_asset_crojob2_manifest"
	self.types.crojob2_manifest.desc_id = "menu_pp_asset_crojob2_manifest_desc"
	self.types.crojob2_manifest.icon = 71
	self.types.crojob2_manifest.pos_not_important = true
	self.types.crojob2_manifest.category = "mission_equipment"
	self.types.crojob2_manifest.total = 1
	self.types.crojob2_manifest.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_manifest")
	self.types.crojob2_manifest.budget_cost = 2
	self.types.crojob2_manifest.post_event = "preplan_14"
	self.types.crojob2_manifest.prio = 3
	self.types.crojob3_escape_boat = {}
	self.types.crojob3_escape_boat.name_id = "menu_pp_crojob3_escape_boat"
	self.types.crojob3_escape_boat.desc_id = "menu_pp_crojob3_escape_boat_desc"
	self.types.crojob3_escape_boat.plan = "escape_plan"
	self.types.crojob3_escape_boat.pos_not_important = false
	self.types.crojob3_escape_boat.category = "escape_plan"
	self.types.crojob3_escape_boat.icon = 54
	self.types.crojob3_escape_boat.total = 1
	self.types.crojob3_escape_boat.cost = 0
	self.types.crojob3_escape_boat.budget_cost = 0
	self.types.crojob3_escape_boat.post_event = "preplan_16"
	self.types.crojob3_escape_boat.prio = 3
	self.types.crojob3_escape_plane = {}
	self.types.crojob3_escape_plane.name_id = "menu_pp_crojob3_escape_plane"
	self.types.crojob3_escape_plane.desc_id = "menu_pp_crojob3_escape_plane_desc"
	self.types.crojob3_escape_plane.plan = "escape_plan"
	self.types.crojob3_escape_plane.pos_not_important = false
	self.types.crojob3_escape_plane.category = "escape_plan"
	self.types.crojob3_escape_plane.icon = 54
	self.types.crojob3_escape_plane.total = 1
	self.types.crojob3_escape_plane.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_escape_mid")
	self.types.crojob3_escape_plane.budget_cost = 4
	self.types.crojob3_escape_plane.post_event = "preplan_13"
	self.types.crojob3_escape_plane.prio = 3
	self.types.crojob3_escape_helicopter = {}
	self.types.crojob3_escape_helicopter.name_id = "menu_pp_crojob3_escape_helicopter"
	self.types.crojob3_escape_helicopter.desc_id = "menu_pp_crojob3_escape_helicopter_desc"
	self.types.crojob3_escape_helicopter.plan = "escape_plan"
	self.types.crojob3_escape_helicopter.pos_not_important = false
	self.types.crojob3_escape_helicopter.category = "escape_plan"
	self.types.crojob3_escape_helicopter.icon = 54
	self.types.crojob3_escape_helicopter.total = 1
	self.types.crojob3_escape_helicopter.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_escape_close")
	self.types.crojob3_escape_helicopter.budget_cost = 8
	self.types.crojob3_escape_helicopter.post_event = "preplan_14"
	self.types.crojob3_escape_helicopter.prio = 3
	self.types.crojob3_demolition_expert = {}
	self.types.crojob3_demolition_expert.name_id = "menu_pp_asset_crojob3_demolition_expert"
	self.types.crojob3_demolition_expert.desc_id = "menu_pp_asset_crojob3_demolition_expert_desc"
	self.types.crojob3_demolition_expert.pos_not_important = false
	self.types.crojob3_demolition_expert.icon = 65
	self.types.crojob3_demolition_expert.category = "hired_help"
	self.types.crojob3_demolition_expert.total = 3
	self.types.crojob3_demolition_expert.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_demolition")
	self.types.crojob3_demolition_expert.budget_cost = 1
	self.types.crojob3_demolition_expert.post_event = "preplan_14"
	self.types.crojob3_demolition_expert.prio = 3
	self.types.crojob3_better_pilot = {}
	self.types.crojob3_better_pilot.name_id = "menu_pp_asset_crojob3_better_pilot"
	self.types.crojob3_better_pilot.desc_id = "menu_pp_asset_crojob3_better_pilot_desc"
	self.types.crojob3_better_pilot.pos_not_important = true
	self.types.crojob3_better_pilot.icon = 73
	self.types.crojob3_better_pilot.category = "hired_help"
	self.types.crojob3_better_pilot.total = 1
	self.types.crojob3_better_pilot.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_pilot")
	self.types.crojob3_better_pilot.budget_cost = 4
	self.types.crojob3_better_pilot.post_event = "preplan_17"
	self.types.crojob3_better_pilot.prio = 3
	self.types.crojob3_sniper = {}
	self.types.crojob3_sniper.name_id = "menu_pp_asset_sniper"
	self.types.crojob3_sniper.desc_id = "menu_pp_asset_sniper_desc"
	self.types.crojob3_sniper.pos_not_important = false
	self.types.crojob3_sniper.icon = 55
	self.types.crojob3_sniper.category = "hired_help"
	self.types.crojob3_sniper.total = 1
	self.types.crojob3_sniper.cost = tweak_data:get_value("money_manager", "preplaning_mia_cost_sniper")
	self.types.crojob3_sniper.budget_cost = 4
	self.types.crojob3_sniper.post_event = "preplan_13"
	self.types.crojob3_sniper.prio = 3
	self.types.crojob3_ladder = {}
	self.types.crojob3_ladder.name_id = "menu_pp_asset_crojob3_ladder"
	self.types.crojob3_ladder.desc_id = "menu_pp_asset_crojob3_ladder_desc"
	self.types.crojob3_ladder.pos_not_important = false
	self.types.crojob3_ladder.icon = 63
	self.types.crojob3_ladder.category = "mission_equipment"
	self.types.crojob3_ladder.total = 1
	self.types.crojob3_ladder.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_ladder")
	self.types.crojob3_ladder.budget_cost = 1
	self.types.crojob3_ladder.post_event = "preplan_15"
	self.types.crojob3_ladder.prio = 5
	self.types.crojob3_crowbar = {}
	self.types.crojob3_crowbar.name_id = "menu_pp_asset_crojob3_crowbar"
	self.types.crojob3_crowbar.desc_id = "menu_pp_asset_crojob3_crowbar_desc"
	self.types.crojob3_crowbar.pos_not_important = false
	self.types.crojob3_crowbar.icon = 72
	self.types.crojob3_crowbar.category = "mission_equipment"
	self.types.crojob3_crowbar.total = 1
	self.types.crojob3_crowbar.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_crowbar")
	self.types.crojob3_crowbar.budget_cost = 1
	self.types.crojob3_crowbar.post_event = "preplan_15"
	self.types.crojob3_crowbar.prio = 5
	self.types.glass_cutter = {}
	self.types.glass_cutter.name_id = "menu_pp_asset_glass_cutter"
	self.types.glass_cutter.desc_id = "menu_pp_asset_glass_cutter_desc"
	self.types.glass_cutter.category = "mission_equipment"
	self.types.glass_cutter.icon = 64
	self.types.glass_cutter.total = 1
	self.types.glass_cutter.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_glass_cutter")
	self.types.glass_cutter.budget_cost = 1
	self.types.glass_cutter.post_event = "preplan_16"
	self.types.glass_cutter.prio = 2
	self.types.kenaz_silent_entry = {}
	self.types.kenaz_silent_entry.name_id = "menu_pp_asset_kenaz_silent_entry"
	self.types.kenaz_silent_entry.desc_id = "menu_pp_asset_kenaz_silent_entry_desc"
	self.types.kenaz_silent_entry.plan = "entry_plan"
	self.types.kenaz_silent_entry.pos_not_important = false
	self.types.kenaz_silent_entry.category = "entry_plan"
	self.types.kenaz_silent_entry.icon = 94
	self.types.kenaz_silent_entry.cost = 0
	self.types.kenaz_silent_entry.budget_cost = 0
	self.types.kenaz_silent_entry.post_event = ""
	self.types.kenaz_silent_entry.prio = 3
	self.types.kenaz_loud_entry = {}
	self.types.kenaz_loud_entry.name_id = "menu_pp_asset_kenaz_loud_entry"
	self.types.kenaz_loud_entry.desc_id = "menu_pp_asset_kenaz_loud_entry_desc"
	self.types.kenaz_loud_entry.plan = "entry_plan"
	self.types.kenaz_loud_entry.pos_not_important = false
	self.types.kenaz_loud_entry.category = "entry_plan"
	self.types.kenaz_loud_entry.icon = 95
	self.types.kenaz_loud_entry.cost = 0
	self.types.kenaz_loud_entry.budget_cost = 0
	self.types.kenaz_loud_entry.post_event = ""
	self.types.kenaz_loud_entry.prio = 3
	self.types.kenaz_loud_entry_with_c4 = {}
	self.types.kenaz_loud_entry_with_c4.name_id = "menu_pp_asset_kenaz_loud_entry_with_c4"
	self.types.kenaz_loud_entry_with_c4.desc_id = "menu_pp_asset_kenaz_loud_entry_with_c4_desc"
	self.types.kenaz_loud_entry_with_c4.plan = "entry_plan"
	self.types.kenaz_loud_entry_with_c4.pos_not_important = false
	self.types.kenaz_loud_entry_with_c4.category = "entry_plan"
	self.types.kenaz_loud_entry_with_c4.icon = 95
	self.types.kenaz_loud_entry_with_c4.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_loud_entry_with_c4")
	self.types.kenaz_loud_entry_with_c4.budget_cost = 6
	self.types.kenaz_loud_entry_with_c4.post_event = ""
	self.types.kenaz_loud_entry_with_c4.prio = 3
	self.types.kenaz_limo_escape = {}
	self.types.kenaz_limo_escape.name_id = "menu_pp_asset_kenaz_limo_escape"
	self.types.kenaz_limo_escape.desc_id = "menu_pp_asset_kenaz_limo_escape_desc"
	self.types.kenaz_limo_escape.plan = "escape_plan"
	self.types.kenaz_limo_escape.pos_not_important = false
	self.types.kenaz_limo_escape.category = "escape_plan"
	self.types.kenaz_limo_escape.icon = 54
	self.types.kenaz_limo_escape.total = 1
	self.types.kenaz_limo_escape.cost = 0
	self.types.kenaz_limo_escape.budget_cost = 0
	self.types.kenaz_limo_escape.post_event = "preplan_12"
	self.types.kenaz_limo_escape.prio = 3
	self.types.kenaz_zeppelin_escape = {}
	self.types.kenaz_zeppelin_escape.name_id = "menu_pp_asset_kenaz_zeppelin_escape"
	self.types.kenaz_zeppelin_escape.desc_id = "menu_pp_asset_kenaz_zeppelin_escape_desc"
	self.types.kenaz_zeppelin_escape.plan = "escape_plan"
	self.types.kenaz_zeppelin_escape.pos_not_important = false
	self.types.kenaz_zeppelin_escape.category = "escape_plan"
	self.types.kenaz_zeppelin_escape.icon = 54
	self.types.kenaz_zeppelin_escape.total = 1
	self.types.kenaz_zeppelin_escape.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_zeppelin_escape")
	self.types.kenaz_zeppelin_escape.budget_cost = 4
	self.types.kenaz_zeppelin_escape.post_event = "preplan_12"
	self.types.kenaz_zeppelin_escape.prio = 3
	self.types.kenaz_van_escape = {}
	self.types.kenaz_van_escape.name_id = "menu_pp_asset_kenaz_van_escape"
	self.types.kenaz_van_escape.desc_id = "menu_pp_asset_kenaz_van_escape_desc"
	self.types.kenaz_van_escape.plan = "escape_plan"
	self.types.kenaz_van_escape.pos_not_important = false
	self.types.kenaz_van_escape.category = "escape_plan"
	self.types.kenaz_van_escape.icon = 54
	self.types.kenaz_van_escape.total = 1
	self.types.kenaz_van_escape.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_van_escape")
	self.types.kenaz_van_escape.budget_cost = 8
	self.types.kenaz_van_escape.post_event = "preplan_12"
	self.types.kenaz_van_escape.prio = 3
	self.types.kenaz_wrecking_ball_escape = {}
	self.types.kenaz_wrecking_ball_escape.name_id = "menu_pp_asset_kenaz_wrecking_ball_escape"
	self.types.kenaz_wrecking_ball_escape.desc_id = "menu_pp_asset_kenaz_wrecking_ball_escape_desc"
	self.types.kenaz_wrecking_ball_escape.plan = "escape_plan"
	self.types.kenaz_wrecking_ball_escape.pos_not_important = false
	self.types.kenaz_wrecking_ball_escape.category = "escape_plan"
	self.types.kenaz_wrecking_ball_escape.icon = 54
	self.types.kenaz_wrecking_ball_escape.total = 1
	self.types.kenaz_wrecking_ball_escape.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_wrecking_ball_escape")
	self.types.kenaz_wrecking_ball_escape.budget_cost = 10
	self.types.kenaz_wrecking_ball_escape.post_event = "preplan_12"
	self.types.kenaz_wrecking_ball_escape.prio = 3
	self.types.sentry_gun = {}
	self.types.sentry_gun.name_id = "menu_pp_asset_sentry_gun"
	self.types.sentry_gun.desc_id = "menu_pp_asset_sentry_gun_desc"
	self.types.sentry_gun.icon = 75
	self.types.sentry_gun.category = "dead_drop"
	self.types.sentry_gun.total = 2
	self.types.sentry_gun.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.sentry_gun.budget_cost = 1
	self.types.sentry_gun.post_event = ""
	self.types.sentry_gun.prio = 5
	self.types.kenaz_drill_better_plasma_cutter = {}
	self.types.kenaz_drill_better_plasma_cutter.name_id = "menu_pp_asset_kenaz_drill_better_plasma_cutter"
	self.types.kenaz_drill_better_plasma_cutter.desc_id = "menu_pp_asset_kenaz_drill_better_plasma_cutter_desc"
	self.types.kenaz_drill_better_plasma_cutter.pos_not_important = false
	self.types.kenaz_drill_better_plasma_cutter.category = "BFD_upgrades"
	self.types.kenaz_drill_better_plasma_cutter.icon = 64
	self.types.kenaz_drill_better_plasma_cutter.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_better_plasma_cutter")
	self.types.kenaz_drill_better_plasma_cutter.budget_cost = 2
	self.types.kenaz_drill_better_plasma_cutter.post_event = ""
	self.types.kenaz_drill_better_plasma_cutter.prio = 3
	self.types.kenaz_drill_improved_cooling_system = {}
	self.types.kenaz_drill_improved_cooling_system.name_id = "menu_pp_asset_kenaz_drill_improved_cooling_system"
	self.types.kenaz_drill_improved_cooling_system.desc_id = "menu_pp_asset_kenaz_drill_improved_cooling_system_desc"
	self.types.kenaz_drill_improved_cooling_system.pos_not_important = false
	self.types.kenaz_drill_improved_cooling_system.category = "BFD_upgrades"
	self.types.kenaz_drill_improved_cooling_system.icon = 92
	self.types.kenaz_drill_improved_cooling_system.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_improved_cooling_system")
	self.types.kenaz_drill_improved_cooling_system.budget_cost = 3
	self.types.kenaz_drill_improved_cooling_system.post_event = ""
	self.types.kenaz_drill_improved_cooling_system.prio = 3
	self.types.kenaz_drill_engine_optimization = {}
	self.types.kenaz_drill_engine_optimization.name_id = "menu_pp_asset_kenaz_drill_engine_optimization"
	self.types.kenaz_drill_engine_optimization.desc_id = "menu_pp_asset_kenaz_drill_engine_optimization_desc"
	self.types.kenaz_drill_engine_optimization.pos_not_important = false
	self.types.kenaz_drill_engine_optimization.category = "BFD_upgrades"
	self.types.kenaz_drill_engine_optimization.icon = 15
	self.types.kenaz_drill_engine_optimization.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_engine_optimization")
	self.types.kenaz_drill_engine_optimization.budget_cost = 2
	self.types.kenaz_drill_engine_optimization.post_event = ""
	self.types.kenaz_drill_engine_optimization.prio = 3
	self.types.kenaz_drill_engine_additional_power = {}
	self.types.kenaz_drill_engine_additional_power.name_id = "menu_pp_asset_kenaz_drill_engine_additional_power"
	self.types.kenaz_drill_engine_additional_power.desc_id = "menu_pp_asset_kenaz_drill_engine_additional_power_desc"
	self.types.kenaz_drill_engine_additional_power.pos_not_important = false
	self.types.kenaz_drill_engine_additional_power.category = "BFD_upgrades"
	self.types.kenaz_drill_engine_additional_power.icon = 44
	self.types.kenaz_drill_engine_additional_power.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_engine_additional_power")
	self.types.kenaz_drill_engine_additional_power.budget_cost = 3
	self.types.kenaz_drill_engine_additional_power.post_event = ""
	self.types.kenaz_drill_engine_additional_power.prio = 3
	self.types.kenaz_drill_sentry = {}
	self.types.kenaz_drill_sentry.name_id = "menu_pp_asset_kenaz_drill_sentry"
	self.types.kenaz_drill_sentry.desc_id = "menu_pp_asset_kenaz_drill_sentry_desc"
	self.types.kenaz_drill_sentry.pos_not_important = false
	self.types.kenaz_drill_sentry.category = "BFD_attachments"
	self.types.kenaz_drill_sentry.icon = 75
	self.types.kenaz_drill_sentry.total = 2
	self.types.kenaz_drill_sentry.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.kenaz_drill_sentry.budget_cost = 1
	self.types.kenaz_drill_sentry.post_event = ""
	self.types.kenaz_drill_sentry.prio = 3
	self.types.kenaz_drill_extra_battery = {}
	self.types.kenaz_drill_extra_battery.name_id = "menu_pp_asset_kenaz_drill_extra_battery"
	self.types.kenaz_drill_extra_battery.desc_id = "menu_pp_asset_kenaz_drill_extra_battery_desc"
	self.types.kenaz_drill_extra_battery.pos_not_important = false
	self.types.kenaz_drill_extra_battery.category = "BFD_attachments"
	self.types.kenaz_drill_extra_battery.icon = 44
	self.types.kenaz_drill_extra_battery.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_extra_battery")
	self.types.kenaz_drill_extra_battery.budget_cost = 3
	self.types.kenaz_drill_extra_battery.post_event = ""
	self.types.kenaz_drill_extra_battery.prio = 3
	self.types.kenaz_drill_water_level_indicator = {}
	self.types.kenaz_drill_water_level_indicator.name_id = "menu_pp_asset_kenaz_drill_water_level_indicator"
	self.types.kenaz_drill_water_level_indicator.desc_id = "menu_pp_asset_kenaz_drill_water_level_indicator_desc"
	self.types.kenaz_drill_water_level_indicator.pos_not_important = false
	self.types.kenaz_drill_water_level_indicator.category = "BFD_attachments"
	self.types.kenaz_drill_water_level_indicator.icon = 92
	self.types.kenaz_drill_water_level_indicator.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_water_level_indicator")
	self.types.kenaz_drill_water_level_indicator.budget_cost = 1
	self.types.kenaz_drill_water_level_indicator.post_event = ""
	self.types.kenaz_drill_water_level_indicator.prio = 3
	self.types.kenaz_drill_timer_addon = {}
	self.types.kenaz_drill_timer_addon.name_id = "menu_pp_asset_kenaz_drill_timer_addon"
	self.types.kenaz_drill_timer_addon.desc_id = "menu_pp_asset_kenaz_drill_timer_addon_desc"
	self.types.kenaz_drill_timer_addon.pos_not_important = false
	self.types.kenaz_drill_timer_addon.category = "BFD_attachments"
	self.types.kenaz_drill_timer_addon.icon = 15
	self.types.kenaz_drill_timer_addon.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_timer_addon")
	self.types.kenaz_drill_timer_addon.budget_cost = 1
	self.types.kenaz_drill_timer_addon.post_event = ""
	self.types.kenaz_drill_timer_addon.prio = 3
	self.types.kenaz_drill_toolbox = {}
	self.types.kenaz_drill_toolbox.name_id = "menu_pp_asset_kenaz_drill_toolbox"
	self.types.kenaz_drill_toolbox.desc_id = "menu_pp_asset_kenaz_drill_toolbox_desc"
	self.types.kenaz_drill_toolbox.pos_not_important = false
	self.types.kenaz_drill_toolbox.category = "BFD_attachments"
	self.types.kenaz_drill_toolbox.icon = 93
	self.types.kenaz_drill_toolbox.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_toolbox")
	self.types.kenaz_drill_toolbox.budget_cost = 1
	self.types.kenaz_drill_toolbox.post_event = ""
	self.types.kenaz_drill_toolbox.prio = 3
	self.types.kenaz_drill_medkit = {}
	self.types.kenaz_drill_medkit.name_id = "menu_pp_asset_kenaz_drill_medkit"
	self.types.kenaz_drill_medkit.desc_id = "menu_pp_asset_kenaz_drill_medkit_desc"
	self.types.kenaz_drill_medkit.pos_not_important = false
	self.types.kenaz_drill_medkit.category = "BFD_attachments"
	self.types.kenaz_drill_medkit.icon = 31
	self.types.kenaz_drill_medkit.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_medkit")
	self.types.kenaz_drill_medkit.budget_cost = 2
	self.types.kenaz_drill_medkit.post_event = ""
	self.types.kenaz_drill_medkit.prio = 3
	self.types.kenaz_drill_ammobox = {}
	self.types.kenaz_drill_ammobox.name_id = "menu_pp_asset_kenaz_drill_ammobox"
	self.types.kenaz_drill_ammobox.desc_id = "menu_pp_asset_kenaz_drill_ammobox_desc"
	self.types.kenaz_drill_ammobox.pos_not_important = false
	self.types.kenaz_drill_ammobox.category = "BFD_attachments"
	self.types.kenaz_drill_ammobox.icon = 52
	self.types.kenaz_drill_ammobox.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_drill_ammobox")
	self.types.kenaz_drill_ammobox.budget_cost = 2
	self.types.kenaz_drill_ammobox.post_event = ""
	self.types.kenaz_drill_ammobox.prio = 3
	self.types.kenaz_ace_pilot = {}
	self.types.kenaz_ace_pilot.name_id = "menu_pp_asset_kenaz_ace_pilot"
	self.types.kenaz_ace_pilot.desc_id = "menu_pp_asset_kenaz_ace_pilot_desc"
	self.types.kenaz_ace_pilot.pos_not_important = true
	self.types.kenaz_ace_pilot.category = "hired_help"
	self.types.kenaz_ace_pilot.icon = 73
	self.types.kenaz_ace_pilot.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_ace_pilot")
	self.types.kenaz_ace_pilot.budget_cost = 1
	self.types.kenaz_ace_pilot.post_event = ""
	self.types.kenaz_ace_pilot.prio = 3
	self.types.kenaz_faster_blimp = {}
	self.types.kenaz_faster_blimp.name_id = "menu_pp_asset_kenaz_faster_blimp"
	self.types.kenaz_faster_blimp.desc_id = "menu_pp_asset_kenaz_faster_blimp_desc"
	self.types.kenaz_faster_blimp.pos_not_important = true
	self.types.kenaz_faster_blimp.category = "hired_help"
	self.types.kenaz_faster_blimp.icon = 74
	self.types.kenaz_faster_blimp.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_faster_blimp")
	self.types.kenaz_faster_blimp.budget_cost = 2
	self.types.kenaz_faster_blimp.post_event = ""
	self.types.kenaz_faster_blimp.prio = 3
	self.types.kenaz_rig_slotmachine = {}
	self.types.kenaz_rig_slotmachine.name_id = "menu_pp_asset_kenaz_rig_slotmachine"
	self.types.kenaz_rig_slotmachine.desc_id = "menu_pp_asset_kenaz_rig_slotmachine_desc"
	self.types.kenaz_rig_slotmachine.pos_not_important = true
	self.types.kenaz_rig_slotmachine.category = "data_hacking"
	self.types.kenaz_rig_slotmachine.icon = 45
	self.types.kenaz_rig_slotmachine.total = 1
	self.types.kenaz_rig_slotmachine.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_rig_slotmachine")
	self.types.kenaz_rig_slotmachine.budget_cost = 4
	self.types.kenaz_rig_slotmachine.post_event = ""
	self.types.kenaz_rig_slotmachine.prio = 3
	self.types.kenaz_sabotage_skylight_barrier = {}
	self.types.kenaz_sabotage_skylight_barrier.name_id = "menu_pp_asset_kenaz_sabotage_skylight_barrier"
	self.types.kenaz_sabotage_skylight_barrier.desc_id = "menu_pp_asset_kenaz_sabotage_skylight_barrier_desc"
	self.types.kenaz_sabotage_skylight_barrier.pos_not_important = false
	self.types.kenaz_sabotage_skylight_barrier.category = "data_hacking"
	self.types.kenaz_sabotage_skylight_barrier.icon = 42
	self.types.kenaz_sabotage_skylight_barrier.total = 1
	self.types.kenaz_sabotage_skylight_barrier.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_sabotage_skylight_barrier")
	self.types.kenaz_sabotage_skylight_barrier.budget_cost = 3
	self.types.kenaz_sabotage_skylight_barrier.post_event = ""
	self.types.kenaz_sabotage_skylight_barrier.prio = 3
	self.types.kenaz_customer_data_USB = {}
	self.types.kenaz_customer_data_USB.name_id = "menu_pp_asset_kenaz_customer_data_USB"
	self.types.kenaz_customer_data_USB.desc_id = "menu_pp_asset_kenaz_customer_data_USB_desc"
	self.types.kenaz_customer_data_USB.pos_not_important = true
	self.types.kenaz_customer_data_USB.category = "mission_equipment"
	self.types.kenaz_customer_data_USB.icon = 85
	self.types.kenaz_customer_data_USB.total = 1
	self.types.kenaz_customer_data_USB.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_customer_data_USB")
	self.types.kenaz_customer_data_USB.budget_cost = 3
	self.types.kenaz_customer_data_USB.post_event = ""
	self.types.kenaz_customer_data_USB.prio = 3
	self.types.kenaz_unlocked_cages = {}
	self.types.kenaz_unlocked_cages.name_id = "menu_pp_asset_kenaz_unlocked_cages"
	self.types.kenaz_unlocked_cages.desc_id = "menu_pp_asset_kenaz_unlocked_cages_desc"
	self.types.kenaz_unlocked_cages.pos_not_important = false
	self.types.kenaz_unlocked_cages.category = "insider_help"
	self.types.kenaz_unlocked_cages.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.kenaz_unlocked_cages.icon = 41
	self.types.kenaz_unlocked_cages.total = 1
	self.types.kenaz_unlocked_cages.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_unlocked_cages")
	self.types.kenaz_unlocked_cages.budget_cost = 3
	self.types.kenaz_unlocked_cages.post_event = ""
	self.types.kenaz_unlocked_cages.prio = 3
	self.types.kenaz_unlocked_doors = {}
	self.types.kenaz_unlocked_doors.name_id = "menu_pp_asset_kenaz_unlocked_doors"
	self.types.kenaz_unlocked_doors.desc_id = "menu_pp_asset_kenaz_unlocked_doors_desc"
	self.types.kenaz_unlocked_doors.pos_not_important = false
	self.types.kenaz_unlocked_doors.category = "insider_help"
	self.types.kenaz_unlocked_doors.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.kenaz_unlocked_doors.icon = 41
	self.types.kenaz_unlocked_doors.total = 1
	self.types.kenaz_unlocked_doors.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_unlocked_doors")
	self.types.kenaz_unlocked_doors.budget_cost = 2
	self.types.kenaz_unlocked_doors.post_event = ""
	self.types.kenaz_unlocked_doors.prio = 3
	self.types.kenaz_guitar_case_position = {}
	self.types.kenaz_guitar_case_position.name_id = "menu_pp_asset_kenaz_guitar_case_position"
	self.types.kenaz_guitar_case_position.desc_id = "menu_pp_asset_kenaz_guitar_case_position_desc"
	self.types.kenaz_guitar_case_position.pos_not_important = false
	self.types.kenaz_guitar_case_position.category = "insider_help"
	self.types.kenaz_guitar_case_position.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.kenaz_guitar_case_position.icon = 83
	self.types.kenaz_guitar_case_position.total = 1
	self.types.kenaz_guitar_case_position.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_guitar_case_position")
	self.types.kenaz_guitar_case_position.budget_cost = 1
	self.types.kenaz_guitar_case_position.post_event = ""
	self.types.kenaz_guitar_case_position.prio = 3
	self.types.kenaz_disable_metal_detectors = {}
	self.types.kenaz_disable_metal_detectors.name_id = "menu_pp_asset_kenaz_disable_metal_detectors"
	self.types.kenaz_disable_metal_detectors.desc_id = "menu_pp_asset_kenaz_disable_metal_detectors_desc"
	self.types.kenaz_disable_metal_detectors.pos_not_important = true
	self.types.kenaz_disable_metal_detectors.category = "insider_help"
	self.types.kenaz_disable_metal_detectors.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.kenaz_disable_metal_detectors.icon = 42
	self.types.kenaz_disable_metal_detectors.total = 1
	self.types.kenaz_disable_metal_detectors.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_disable_metal_detectors")
	self.types.kenaz_disable_metal_detectors.budget_cost = 1
	self.types.kenaz_disable_metal_detectors.post_event = ""
	self.types.kenaz_disable_metal_detectors.prio = 3
	self.types.kenaz_celebrity_visit = {}
	self.types.kenaz_celebrity_visit.name_id = "menu_pp_asset_kenaz_celebrity_visit"
	self.types.kenaz_celebrity_visit.desc_id = "menu_pp_asset_kenaz_celebrity_visit_desc"
	self.types.kenaz_celebrity_visit.pos_not_important = false
	self.types.kenaz_celebrity_visit.category = "hired_help"
	self.types.kenaz_celebrity_visit.icon = 91
	self.types.kenaz_celebrity_visit.total = 1
	self.types.kenaz_celebrity_visit.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_celebrity_visit")
	self.types.kenaz_celebrity_visit.budget_cost = 2
	self.types.kenaz_celebrity_visit.post_event = ""
	self.types.kenaz_celebrity_visit.prio = 3
	self.types.kenaz_vault_gate_key = {}
	self.types.kenaz_vault_gate_key.name_id = "menu_pp_asset_kenaz_vault_gate_key"
	self.types.kenaz_vault_gate_key.desc_id = "menu_pp_asset_kenaz_vault_gate_key_desc"
	self.types.kenaz_vault_gate_key.pos_not_important = true
	self.types.kenaz_vault_gate_key.category = "mission_equipment"
	self.types.kenaz_vault_gate_key.icon = 43
	self.types.kenaz_vault_gate_key.total = 1
	self.types.kenaz_vault_gate_key.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_vault_gate_key")
	self.types.kenaz_vault_gate_key.budget_cost = 2
	self.types.kenaz_vault_gate_key.post_event = ""
	self.types.kenaz_vault_gate_key.prio = 3
	self.types.mex_keys = {}
	self.types.mex_keys.name_id = "menu_pp_asset_mex_keys"
	self.types.mex_keys.desc_id = "menu_pp_asset_mex_keys_desc"
	self.types.mex_keys.category = "mission_equipment"
	self.types.mex_keys.icon = 43
	self.types.mex_keys.total = 1
	self.types.mex_keys.post_event = "preplan_16"
	self.types.mex_keys.prio = 1
	self.types.mex_keys.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_mex_keys")
	self.types.mex_keys.budget_cost = 3
	self.types.roof_access = {}
	self.types.roof_access.name_id = "menu_pp_asset_roof_access"
	self.types.roof_access.desc_id = "menu_pp_asset_roof_access_desc"
	self.types.roof_access.category = "mission_equipment"
	self.types.roof_access.icon = 63
	self.types.roof_access.total = 2
	self.types.roof_access.post_event = "preplan_16"
	self.types.roof_access.prio = 1
	self.types.roof_access.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_roof_access")
	self.types.roof_access.budget_cost = 3
	self.types.upper_floor_access = {}
	self.types.upper_floor_access.name_id = "menu_pp_asset_upper_floor_access"
	self.types.upper_floor_access.desc_id = "menu_pp_asset_upper_floor_access_desc"
	self.types.upper_floor_access.category = "mission_equipment"
	self.types.upper_floor_access.icon = 63
	self.types.upper_floor_access.total = 1
	self.types.upper_floor_access.post_event = "preplan_16"
	self.types.upper_floor_access.prio = 1
	self.types.upper_floor_access.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_upper_floor_access")
	self.types.upper_floor_access.budget_cost = 2
	self.types.crowbar_single = {}
	self.types.crowbar_single.name_id = "menu_pp_asset_crowbar_single"
	self.types.crowbar_single.desc_id = "menu_pp_asset_crowbar_single_desc"
	self.types.crowbar_single.category = "mission_equipment"
	self.types.crowbar_single.icon = 72
	self.types.crowbar_single.total = 1
	self.types.crowbar_single.post_event = "preplan_16"
	self.types.crowbar_single.prio = 1
	self.types.crowbar_single.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_crowbar_single")
	self.types.crowbar_single.budget_cost = 1
	self.types.bex_car_pull = {}
	self.types.bex_car_pull.name_id = "menu_pp_asset_bex_car_pull"
	self.types.bex_car_pull.desc_id = "menu_pp_asset_bex_car_pull_desc"
	self.types.bex_car_pull.category = "hired_help"
	self.types.bex_car_pull.icon = 103
	self.types.bex_car_pull.total = 1
	self.types.bex_car_pull.post_event = "preplan_16"
	self.types.bex_car_pull.prio = 1
	self.types.bex_car_pull.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_bex_car_pull")
	self.types.bex_car_pull.budget_cost = 6
	self.types.bex_drunk_mariachi = {}
	self.types.bex_drunk_mariachi.name_id = "menu_pp_asset_bex_drunk_mariachi"
	self.types.bex_drunk_mariachi.desc_id = "menu_pp_asset_bex_drunk_mariachi_desc"
	self.types.bex_drunk_mariachi.category = "hired_help"
	self.types.bex_drunk_mariachi.icon = 101
	self.types.bex_drunk_mariachi.total = 1
	self.types.bex_drunk_mariachi.post_event = "preplan_16"
	self.types.bex_drunk_mariachi.prio = 3
	self.types.bex_drunk_mariachi.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_bex_drunk_mariachi")
	self.types.bex_drunk_mariachi.budget_cost = 3
	self.types.bex_garbage_truck = {}
	self.types.bex_garbage_truck.name_id = "menu_pp_asset_bex_garbage_truck"
	self.types.bex_garbage_truck.desc_id = "menu_pp_asset_bex_garbage_truck_desc"
	self.types.bex_garbage_truck.category = "hired_help"
	self.types.bex_garbage_truck.icon = 102
	self.types.bex_garbage_truck.total = 1
	self.types.bex_garbage_truck.post_event = "preplan_16"
	self.types.bex_garbage_truck.prio = 3
	self.types.bex_garbage_truck.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_bex_garbage_truck")
	self.types.bex_garbage_truck.budget_cost = 3
	self.types.bex_zipline = {}
	self.types.bex_zipline.name_id = "menu_pp_asset_bex_zipline"
	self.types.bex_zipline.desc_id = "menu_pp_asset_bex_zipline_desc"
	self.types.bex_zipline.category = "hired_help"
	self.types.bex_zipline.icon = 95
	self.types.bex_zipline.total = 1
	self.types.bex_zipline.post_event = "preplan_16"
	self.types.bex_zipline.prio = 3
	self.types.bex_zipline.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_bex_zipline")
	self.types.bex_zipline.budget_cost = 3
	self.types.pex_parked_car = {}
	self.types.pex_parked_car.name_id = "menu_pp_asset_pex_parked_car"
	self.types.pex_parked_car.desc_id = "menu_pp_asset_pex_parked_car_desc"
	self.types.pex_parked_car.category = "hired_help"
	self.types.pex_parked_car.icon = 104
	self.types.pex_parked_car.total = 1
	self.types.pex_parked_car.post_event = "preplan_16"
	self.types.pex_parked_car.prio = 3
	self.types.pex_parked_car.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_parked_car")
	self.types.pex_parked_car.budget_cost = 3
	self.types.pex_spiked_churro = {}
	self.types.pex_spiked_churro.name_id = "menu_pp_asset_pex_spiked_churro"
	self.types.pex_spiked_churro.desc_id = "menu_pp_asset_pex_spiked_churro_desc"
	self.types.pex_spiked_churro.category = "hired_help"
	self.types.pex_spiked_churro.icon = 105
	self.types.pex_spiked_churro.total = 1
	self.types.pex_spiked_churro.post_event = "preplan_16"
	self.types.pex_spiked_churro.prio = 3
	self.types.pex_spiked_churro.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_spiked_churro")
	self.types.pex_spiked_churro.budget_cost = 3
	self.types.pex_camera_access = {}
	self.types.pex_camera_access.name_id = "menu_pp_asset_pex_camera_access"
	self.types.pex_camera_access.desc_id = "menu_pp_asset_pex_camera_access_desc"
	self.types.pex_camera_access.category = "hired_help"
	self.types.pex_camera_access.icon = 24
	self.types.pex_camera_access.total = 1
	self.types.pex_camera_access.post_event = "preplan_16"
	self.types.pex_camera_access.prio = 3
	self.types.pex_camera_access.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_camera_access")
	self.types.pex_camera_access.budget_cost = 3
	self.types.pex_open_window = {}
	self.types.pex_open_window.name_id = "menu_pp_asset_pex_open_window"
	self.types.pex_open_window.desc_id = "menu_pp_asset_pex_open_window_desc"
	self.types.pex_open_window.category = "hired_help"
	self.types.pex_open_window.icon = 111
	self.types.pex_open_window.total = 1
	self.types.pex_open_window.post_event = "preplan_16"
	self.types.pex_open_window.prio = 3
	self.types.pex_open_window.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_open_window")
	self.types.pex_open_window.budget_cost = 3
	self.types.fex_stealth_entry_with_thermite = {}
	self.types.fex_stealth_entry_with_thermite.name_id = "menu_pp_asset_fex_stealth_entry_with_thermite"
	self.types.fex_stealth_entry_with_thermite.desc_id = "menu_pp_asset_fex_stealth_entry_with_thermite_desc"
	self.types.fex_stealth_entry_with_thermite.plan = "entry_plan_generic"
	self.types.fex_stealth_entry_with_thermite.pos_not_important = false
	self.types.fex_stealth_entry_with_thermite.category = "entry_plan_generic"
	self.types.fex_stealth_entry_with_thermite.icon = 95
	self.types.fex_stealth_entry_with_thermite.total = 1
	self.types.fex_stealth_entry_with_thermite.cost = 0
	self.types.fex_stealth_entry_with_thermite.budget_cost = 0
	self.types.fex_stealth_entry_with_thermite.post_event = "preplan_07"
	self.types.fex_stealth_entry_with_thermite.prio = 3
	self.types.fex_stealth_entry_with_boat = {}
	self.types.fex_stealth_entry_with_boat.name_id = "menu_pp_asset_fex_stealth_entry_with_boat"
	self.types.fex_stealth_entry_with_boat.desc_id = "menu_pp_asset_fex_stealth_entry_with_boat_desc"
	self.types.fex_stealth_entry_with_boat.plan = "entry_plan_generic"
	self.types.fex_stealth_entry_with_boat.pos_not_important = false
	self.types.fex_stealth_entry_with_boat.category = "entry_plan_generic"
	self.types.fex_stealth_entry_with_boat.icon = 95
	self.types.fex_stealth_entry_with_boat.total = 1
	self.types.fex_stealth_entry_with_boat.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_fex_stealth_entry_with_boat")
	self.types.fex_stealth_entry_with_boat.budget_cost = 6
	self.types.fex_stealth_entry_with_boat.post_event = "preplan_07"
	self.types.fex_stealth_entry_with_boat.prio = 3
	self.types.fex_loud_escape_with_car = {}
	self.types.fex_loud_escape_with_car.name_id = "menu_pp_asset_fex_loud_escape_with_car"
	self.types.fex_loud_escape_with_car.desc_id = "menu_pp_asset_fex_loud_escape_with_car_desc"
	self.types.fex_loud_escape_with_car.plan = "escape_plan"
	self.types.fex_loud_escape_with_car.pos_not_important = false
	self.types.fex_loud_escape_with_car.category = "escape_plan"
	self.types.fex_loud_escape_with_car.icon = 54
	self.types.fex_loud_escape_with_car.total = 1
	self.types.fex_loud_escape_with_car.cost = 0
	self.types.fex_loud_escape_with_car.budget_cost = 0
	self.types.fex_loud_escape_with_car.post_event = "preplan_16"
	self.types.fex_loud_escape_with_car.prio = 3
	self.types.fex_loud_escape_with_heli = {}
	self.types.fex_loud_escape_with_heli.name_id = "menu_pp_asset_fex_loud_escape_with_heli"
	self.types.fex_loud_escape_with_heli.desc_id = "menu_pp_asset_fex_loud_escape_with_heli_desc"
	self.types.fex_loud_escape_with_heli.plan = "escape_plan"
	self.types.fex_loud_escape_with_heli.pos_not_important = false
	self.types.fex_loud_escape_with_heli.category = "escape_plan"
	self.types.fex_loud_escape_with_heli.icon = 54
	self.types.fex_loud_escape_with_heli.total = 1
	self.types.fex_loud_escape_with_heli.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_fex_loud_escape_with_heli")
	self.types.fex_loud_escape_with_heli.budget_cost = 6
	self.types.fex_loud_escape_with_heli.post_event = "preplan_16"
	self.types.fex_loud_escape_with_heli.prio = 3
	self.types.fex_stealth_semi_open_garage_door = {}
	self.types.fex_stealth_semi_open_garage_door.name_id = "menu_pp_asset_fex_stealth_semi_open_garage_door"
	self.types.fex_stealth_semi_open_garage_door.desc_id = "menu_pp_asset_fex_stealth_semi_open_garage_door_desc"
	self.types.fex_stealth_semi_open_garage_door.plan = "insider_help"
	self.types.fex_stealth_semi_open_garage_door.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.fex_stealth_semi_open_garage_door.pos_not_important = false
	self.types.fex_stealth_semi_open_garage_door.category = "insider_help"
	self.types.fex_stealth_semi_open_garage_door.icon = 111
	self.types.fex_stealth_semi_open_garage_door.total = 1
	self.types.fex_stealth_semi_open_garage_door.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_fex_stealth_semi_open_garage_door")
	self.types.fex_stealth_semi_open_garage_door.budget_cost = 2
	self.types.fex_stealth_semi_open_garage_door.post_event = "preplan_16"
	self.types.fex_stealth_semi_open_garage_door.prio = 1
	self.types.chas_tram = {}
	self.types.chas_tram.name_id = "menu_pp_chas_tram"
	self.types.chas_tram.desc_id = "menu_pp_chas_tram_desc"
	self.types.chas_tram.category = "hired_help"
	self.types.chas_tram.icon = 103
	self.types.chas_tram.total = 1
	self.types.chas_tram.post_event = "preplan_16"
	self.types.chas_tram.prio = 1
	self.types.chas_tram.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_chas_tram")
	self.types.chas_tram.budget_cost = 6
	self.types.chas_garbage_truck = {}
	self.types.chas_garbage_truck.name_id = "menu_pp_asset_chas_garbage_truck"
	self.types.chas_garbage_truck.desc_id = "menu_pp_asset_chas_garbage_truck_desc"
	self.types.chas_garbage_truck.category = "hired_help"
	self.types.chas_garbage_truck.icon = 102
	self.types.chas_garbage_truck.total = 1
	self.types.chas_garbage_truck.post_event = "preplan_16"
	self.types.chas_garbage_truck.prio = 3
	self.types.chas_garbage_truck.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_bex_garbage_truck")
	self.types.chas_garbage_truck.budget_cost = 3
	self.types.chas_open_window = {}
	self.types.chas_open_window.name_id = "menu_pp_asset_chas_open_window"
	self.types.chas_open_window.desc_id = "menu_pp_asset_chas_open_window_desc"
	self.types.chas_open_window.category = "hired_help"
	self.types.chas_open_window.icon = 111
	self.types.chas_open_window.total = 1
	self.types.chas_open_window.post_event = "preplan_16"
	self.types.chas_open_window.prio = 3
	self.types.chas_open_window.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_open_window")
	self.types.chas_open_window.budget_cost = 2
	self.types.sand_broken_wall = {}
	self.types.sand_broken_wall.name_id = "menu_pp_asset_sand_broken_wall"
	self.types.sand_broken_wall.desc_id = "menu_pp_asset_sand_broken_wall_desc"
	self.types.sand_broken_wall.category = "hired_help"
	self.types.sand_broken_wall.icon = 112
	self.types.sand_broken_wall.total = 1
	self.types.sand_broken_wall.post_event = "preplan_16"
	self.types.sand_broken_wall.prio = 1
	self.types.sand_broken_wall.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_chas_tram")
	self.types.sand_broken_wall.budget_cost = 1
	self.types.sand_less_camera_drones = {}
	self.types.sand_less_camera_drones.name_id = "menu_pp_asset_sand_less_camera_drones"
	self.types.sand_less_camera_drones.desc_id = "menu_pp_asset_sand_less_camera_drones_desc"
	self.types.sand_less_camera_drones.category = "hired_help"
	self.types.sand_less_camera_drones.icon = 114
	self.types.sand_less_camera_drones.total = 1
	self.types.sand_less_camera_drones.post_event = "preplan_16"
	self.types.sand_less_camera_drones.prio = 3
	self.types.sand_less_camera_drones.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_bex_garbage_truck")
	self.types.sand_less_camera_drones.budget_cost = 3
	self.types.sand_ladder_bridge = {}
	self.types.sand_ladder_bridge.name_id = "menu_pp_asset_sand_ladder_bridge"
	self.types.sand_ladder_bridge.desc_id = "menu_pp_asset_sand_ladder_bridge_desc"
	self.types.sand_ladder_bridge.category = "hired_help"
	self.types.sand_ladder_bridge.icon = 63
	self.types.sand_ladder_bridge.total = 1
	self.types.sand_ladder_bridge.post_event = "preplan_16"
	self.types.sand_ladder_bridge.prio = 3
	self.types.sand_ladder_bridge.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_bex_garbage_truck")
	self.types.sand_ladder_bridge.budget_cost = 2
	self.types.sand_extra_dumpsters = {}
	self.types.sand_extra_dumpsters.name_id = "menu_pp_asset_sand_extra_dumpsters"
	self.types.sand_extra_dumpsters.desc_id = "menu_pp_asset_sand_extra_dumpsters_desc"
	self.types.sand_extra_dumpsters.category = "hired_help"
	self.types.sand_extra_dumpsters.icon = 113
	self.types.sand_extra_dumpsters.total = 1
	self.types.sand_extra_dumpsters.post_event = "preplan_16"
	self.types.sand_extra_dumpsters.prio = 3
	self.types.sand_extra_dumpsters.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_open_window")
	self.types.sand_extra_dumpsters.budget_cost = 2
	self.types.chca_entry_as_guest = {}
	self.types.chca_entry_as_guest.name_id = "menu_pp_asset_chca_entry_as_guest"
	self.types.chca_entry_as_guest.desc_id = "menu_pp_asset_chca_entry_as_guest_desc"
	self.types.chca_entry_as_guest.plan = "entry_plan_generic"
	self.types.chca_entry_as_guest.pos_not_important = false
	self.types.chca_entry_as_guest.category = "entry_plan_generic"
	self.types.chca_entry_as_guest.icon = 95
	self.types.chca_entry_as_guest.total = 1
	self.types.chca_entry_as_guest.cost = 0
	self.types.chca_entry_as_guest.budget_cost = 0
	self.types.chca_entry_as_guest.post_event = "preplan_07"
	self.types.chca_entry_as_guest.prio = 3
	self.types.chca_entry_as_crew = {}
	self.types.chca_entry_as_crew.name_id = "menu_pp_asset_chca_entry_as_crew"
	self.types.chca_entry_as_crew.desc_id = "menu_pp_asset_chca_entry_as_crew_desc"
	self.types.chca_entry_as_crew.plan = "entry_plan_generic"
	self.types.chca_entry_as_crew.pos_not_important = false
	self.types.chca_entry_as_crew.category = "entry_plan_generic"
	self.types.chca_entry_as_crew.icon = 95
	self.types.chca_entry_as_crew.total = 1
	self.types.chca_entry_as_crew.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_fex_stealth_entry_with_boat")
	self.types.chca_entry_as_crew.budget_cost = 4
	self.types.chca_entry_as_crew.post_event = "preplan_07"
	self.types.chca_entry_as_crew.prio = 3
	self.types.chca_entry_helicopter = {}
	self.types.chca_entry_helicopter.name_id = "menu_pp_asset_chca_entry_helicopter"
	self.types.chca_entry_helicopter.desc_id = "menu_pp_asset_chca_entry_helicopter_desc"
	self.types.chca_entry_helicopter.plan = "entry_plan_generic"
	self.types.chca_entry_helicopter.pos_not_important = false
	self.types.chca_entry_helicopter.category = "entry_plan_generic"
	self.types.chca_entry_helicopter.icon = 95
	self.types.chca_entry_helicopter.total = 1
	self.types.chca_entry_helicopter.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_fex_stealth_entry_with_boat")
	self.types.chca_entry_helicopter.budget_cost = 4
	self.types.chca_entry_helicopter.post_event = "preplan_07"
	self.types.chca_entry_helicopter.prio = 3
	self.types.chca_unlocked_doors = {}
	self.types.chca_unlocked_doors.name_id = "menu_pp_asset_chca_unlocked_doors"
	self.types.chca_unlocked_doors.desc_id = "menu_pp_asset_chca_unlocked_doors_desc"
	self.types.chca_unlocked_doors.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.chca_unlocked_doors.pos_not_important = false
	self.types.chca_unlocked_doors.category = "insider_help"
	self.types.chca_unlocked_doors.icon = 41
	self.types.chca_unlocked_doors.total = 1
	self.types.chca_unlocked_doors.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_door")
	self.types.chca_unlocked_doors.budget_cost = 2
	self.types.chca_unlocked_doors.post_event = ""
	self.types.chca_unlocked_doors.prio = 3
	self.types.chca_spiked_drink = {}
	self.types.chca_spiked_drink.name_id = "menu_pp_asset_chca_spiked_drink"
	self.types.chca_spiked_drink.desc_id = "menu_pp_asset_chca_spiked_drink_desc"
	self.types.chca_spiked_drink.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.chca_spiked_drink.category = "insider_help"
	self.types.chca_spiked_drink.icon = 82
	self.types.chca_spiked_drink.total = 1
	self.types.chca_spiked_drink.post_event = "preplan_16"
	self.types.chca_spiked_drink.prio = 3
	self.types.chca_spiked_drink.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_spiked_churro")
	self.types.chca_spiked_drink.budget_cost = 2
	self.types.chca_keycard = {}
	self.types.chca_keycard.name_id = "menu_pp_asset_chca_keycard"
	self.types.chca_keycard.desc_id = "menu_pp_asset_chca_keycard_desc"
	self.types.chca_keycard.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.chca_keycard.pos_not_important = false
	self.types.chca_keycard.category = "insider_help"
	self.types.chca_keycard.icon = 53
	self.types.chca_keycard.total = 1
	self.types.chca_keycard.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_door")
	self.types.chca_keycard.budget_cost = 2
	self.types.chca_keycard.post_event = ""
	self.types.chca_keycard.prio = 3
	self.types.pent_parked_car = {}
	self.types.pent_parked_car.name_id = "menu_pp_asset_pent_van_hint"
	self.types.pent_parked_car.desc_id = "menu_pp_asset_pent_van_hint_desc"
	self.types.pent_parked_car.category = "insider_help"
	self.types.pent_parked_car.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.pent_parked_car.pos_not_important = false
	self.types.pent_parked_car.icon = 115
	self.types.pent_parked_car.total = 1
	self.types.pent_parked_car.post_event = "preplan_16"
	self.types.pent_parked_car.prio = 3
	self.types.pent_parked_car.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_parked_car")
	self.types.pent_parked_car.budget_cost = 2
	self.types.pent_thermite = {}
	self.types.pent_thermite.name_id = "menu_pp_pent_thermite"
	self.types.pent_thermite.desc_id = "menu_pp_pent_thermite_desc"
	self.types.pent_thermite.pos_not_important = false
	self.types.pent_thermite.category = "mission_equipment"
	self.types.pent_thermite.icon = 51
	self.types.pent_thermite.total = 1
	self.types.pent_thermite.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_thermite")
	self.types.pent_thermite.budget_cost = 6
	self.types.pent_thermite.post_event = "preplan_02"
	self.types.pent_thermite.prio = 2
	self.types.pent_carkeys = {}
	self.types.pent_carkeys.name_id = "menu_pp_asset_pent_carkeys"
	self.types.pent_carkeys.desc_id = "menu_pp_asset_pent_carkeys_desc"
	self.types.pent_carkeys.category = "mission_equipment"
	self.types.pent_carkeys.pos_not_important = false
	self.types.pent_carkeys.icon = 43
	self.types.pent_carkeys.total = 1
	self.types.pent_carkeys.post_event = "preplan_16"
	self.types.pent_carkeys.prio = 1
	self.types.pent_carkeys.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_mex_keys")
	self.types.pent_carkeys.budget_cost = 4
	self.types.pent_unlocked_door = {}
	self.types.pent_unlocked_door.name_id = "menu_pp_asset_pent_unlocked_door"
	self.types.pent_unlocked_door.desc_id = "menu_pp_asset_pent_unlocked_door_desc"
	self.types.pent_unlocked_door.category = "insider_help"
	self.types.pent_unlocked_door.pos_not_important = false
	self.types.pent_unlocked_door.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.pent_unlocked_door.icon = 41
	self.types.pent_unlocked_door.total = 4
	self.types.pent_unlocked_door.post_event = "preplan_07"
	self.types.pent_unlocked_door.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_door")
	self.types.pent_unlocked_door.budget_cost = 1
	self.types.pent_unlocked_door.prio = 3
	self.types.pent_marked_bookcase = {}
	self.types.pent_marked_bookcase.name_id = "menu_pp_asset_pent_marked_bookcase"
	self.types.pent_marked_bookcase.desc_id = "menu_pp_asset_pent_marked_bookcase_desc"
	self.types.pent_marked_bookcase.pos_not_important = true
	self.types.pent_marked_bookcase.category = "insider_help"
	self.types.pent_marked_bookcase.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.pent_marked_bookcase.icon = 121
	self.types.pent_marked_bookcase.total = 1
	self.types.pent_marked_bookcase.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_guitar_case_position")
	self.types.pent_marked_bookcase.budget_cost = 2
	self.types.pent_marked_bookcase.post_event = ""
	self.types.pent_marked_bookcase.prio = 3
	self.types.pent_lower_hacktime = {}
	self.types.pent_lower_hacktime.name_id = "menu_pp_asset_pent_lower_hacktime"
	self.types.pent_lower_hacktime.desc_id = "menu_pp_asset_pent_lower_hacktime_desc"
	self.types.pent_lower_hacktime.icon = 15
	self.types.pent_lower_hacktime.pos_not_important = true
	self.types.pent_lower_hacktime.category = "data_hacking"
	self.types.pent_lower_hacktime.total = 1
	self.types.pent_lower_hacktime.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_hacker")
	self.types.pent_lower_hacktime.budget_cost = 3
	self.types.pent_lower_hacktime.post_event = "preplan_10"
	self.types.pent_lower_hacktime.prio = 3
	self.types.ranc_plane_loot_secure = {}
	self.types.ranc_plane_loot_secure.name_id = "menu_pp_asset_ranc_plane_loot_secure"
	self.types.ranc_plane_loot_secure.desc_id = "menu_pp_asset_ranc_plane_loot_secure_desc"
	self.types.ranc_plane_loot_secure.category = "hired_help"
	self.types.ranc_plane_loot_secure.icon = 122
	self.types.ranc_plane_loot_secure.total = 1
	self.types.ranc_plane_loot_secure.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_pilot")
	self.types.ranc_plane_loot_secure.budget_cost = 6
	self.types.ranc_plane_loot_secure.post_event = ""
	self.types.ranc_plane_loot_secure.prio = 3
	self.types.ranc_marked_crate = {}
	self.types.ranc_marked_crate.name_id = "menu_pp_asset_ranc_marked_crate"
	self.types.ranc_marked_crate.desc_id = "menu_pp_asset_ranc_marked_crate_desc"
	self.types.ranc_marked_crate.pos_not_important = true
	self.types.ranc_marked_crate.category = "hired_help"
	self.types.ranc_marked_crate.icon = 123
	self.types.ranc_marked_crate.total = 1
	self.types.ranc_marked_crate.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_parked_car")
	self.types.ranc_marked_crate.budget_cost = 3
	self.types.ranc_marked_crate.post_event = ""
	self.types.ranc_marked_crate.prio = 3
	self.types.ranc_extra_weapon_parts = {}
	self.types.ranc_extra_weapon_parts.name_id = "menu_pp_asset_ranc_extra_weapon_parts"
	self.types.ranc_extra_weapon_parts.desc_id = "menu_pp_asset_ranc_extra_weapon_parts_desc"
	self.types.ranc_extra_weapon_parts.pos_not_important = true
	self.types.ranc_extra_weapon_parts.category = "hired_help"
	self.types.ranc_extra_weapon_parts.icon = 124
	self.types.ranc_extra_weapon_parts.total = 1
	self.types.ranc_extra_weapon_parts.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_drillparts")
	self.types.ranc_extra_weapon_parts.budget_cost = 4
	self.types.ranc_extra_weapon_parts.post_event = ""
	self.types.ranc_extra_weapon_parts.prio = 3
	self.types.ranc_ace_driver = {}
	self.types.ranc_ace_driver.name_id = "menu_pp_asset_ranc_ace_driver"
	self.types.ranc_ace_driver.desc_id = "menu_pp_asset_ranc_ace_driver_desc"
	self.types.ranc_ace_driver.pos_not_important = true
	self.types.ranc_ace_driver.category = "hired_help"
	self.types.ranc_ace_driver.icon = 121
	self.types.ranc_ace_driver.total = 1
	self.types.ranc_ace_driver.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_kenaz_guitar_case_position")
	self.types.ranc_ace_driver.budget_cost = 2
	self.types.ranc_ace_driver.post_event = ""
	self.types.ranc_ace_driver.prio = 3
	self.types.ranc_reduce_countermeasure = {}
	self.types.ranc_reduce_countermeasure.name_id = "menu_pp_asset_ranc_reduce_countermeasure"
	self.types.ranc_reduce_countermeasure.desc_id = "menu_pp_asset_ranc_reduce_countermeasure_desc"
	self.types.ranc_reduce_countermeasure.pos_not_important = true
	self.types.ranc_reduce_countermeasure.category = "hired_help"
	self.types.ranc_reduce_countermeasure.icon = 125
	self.types.ranc_reduce_countermeasure.total = 1
	self.types.ranc_reduce_countermeasure.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_hacker")
	self.types.ranc_reduce_countermeasure.budget_cost = 2
	self.types.ranc_reduce_countermeasure.post_event = ""
	self.types.ranc_reduce_countermeasure.prio = 3
	self.types.trai_lower_hacktime = {}
	self.types.trai_lower_hacktime.name_id = "menu_pp_asset_trai_lower_hacktime"
	self.types.trai_lower_hacktime.desc_id = "menu_pp_asset_trai_lower_hacktime_desc"
	self.types.trai_lower_hacktime.icon = 15
	self.types.trai_lower_hacktime.pos_not_important = true
	self.types.trai_lower_hacktime.category = "data_hacking"
	self.types.trai_lower_hacktime.total = 1
	self.types.trai_lower_hacktime.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_hacker")
	self.types.trai_lower_hacktime.budget_cost = 3
	self.types.trai_lower_hacktime.post_event = "preplan_10"
	self.types.trai_lower_hacktime.prio = 3
	self.types.trai_extra_blowtorch = {}
	self.types.trai_extra_blowtorch.name_id = "menu_pp_asset_trai_extra_blowtorch"
	self.types.trai_extra_blowtorch.desc_id = "menu_pp_asset_trai_extra_blowtorch_desc"
	self.types.trai_extra_blowtorch.pos_not_important = true
	self.types.trai_extra_blowtorch.category = "hired_help"
	self.types.trai_extra_blowtorch.icon = 131
	self.types.trai_extra_blowtorch.total = 1
	self.types.trai_extra_blowtorch.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_deaddropbag")
	self.types.trai_extra_blowtorch.budget_cost = 2
	self.types.trai_extra_blowtorch.post_event = ""
	self.types.trai_extra_blowtorch.prio = 3
	self.types.trai_extra_turret_parts = {}
	self.types.trai_extra_turret_parts.name_id = "menu_pp_asset_trai_extra_turret_parts"
	self.types.trai_extra_turret_parts.desc_id = "menu_pp_asset_trai_extra_turret_parts_desc"
	self.types.trai_extra_turret_parts.pos_not_important = true
	self.types.trai_extra_turret_parts.category = "hired_help"
	self.types.trai_extra_turret_parts.icon = 75
	self.types.trai_extra_turret_parts.total = 1
	self.types.trai_extra_turret_parts.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_drillparts")
	self.types.trai_extra_turret_parts.budget_cost = 3
	self.types.trai_extra_turret_parts.post_event = ""
	self.types.trai_extra_turret_parts.prio = 3
	self.types.trai_ladder = {}
	self.types.trai_ladder.name_id = "menu_pp_asset_trai_ladder"
	self.types.trai_ladder.desc_id = "menu_pp_asset_trai_ladder_desc"
	self.types.trai_ladder.category = "hired_help"
	self.types.trai_ladder.icon = 63
	self.types.trai_ladder.total = 1
	self.types.trai_ladder.post_event = "preplan_16"
	self.types.trai_ladder.prio = 3
	self.types.trai_ladder.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_bex_garbage_truck")
	self.types.trai_ladder.budget_cost = 2
	self.types.corp_entry_main = {}
	self.types.corp_entry_main.name_id = "menu_pp_asset_corp_entry_main"
	self.types.corp_entry_main.desc_id = "menu_pp_asset_corp_entry_main_desc"
	self.types.corp_entry_main.plan = "entry_plan_generic"
	self.types.corp_entry_main.pos_not_important = false
	self.types.corp_entry_main.category = "entry_plan_generic"
	self.types.corp_entry_main.icon = 95
	self.types.corp_entry_main.total = 1
	self.types.corp_entry_main.cost = 0
	self.types.corp_entry_main.budget_cost = 0
	self.types.corp_entry_main.post_event = "preplan_07"
	self.types.corp_entry_main.prio = 3
	self.types.corp_entry_parking = {}
	self.types.corp_entry_parking.name_id = "menu_pp_asset_corp_entry_parking"
	self.types.corp_entry_parking.desc_id = "menu_pp_asset_corp_entry_parking_desc"
	self.types.corp_entry_parking.plan = "entry_plan_generic"
	self.types.corp_entry_parking.pos_not_important = false
	self.types.corp_entry_parking.category = "entry_plan_generic"
	self.types.corp_entry_parking.icon = 95
	self.types.corp_entry_parking.total = 1
	self.types.corp_entry_parking.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.corp_entry_parking.budget_cost = 3
	self.types.corp_entry_parking.post_event = "preplan_07"
	self.types.corp_entry_parking.prio = 3
	self.types.corp_escape_parking_north = {}
	self.types.corp_escape_parking_north.name_id = "menu_pp_asset_corp_escape_parking_north"
	self.types.corp_escape_parking_north.desc_id = "menu_pp_asset_corp_escape_parking_north_desc"
	self.types.corp_escape_parking_north.plan = "escape_plan"
	self.types.corp_escape_parking_north.pos_not_important = false
	self.types.corp_escape_parking_north.category = "escape_plan"
	self.types.corp_escape_parking_north.icon = 54
	self.types.corp_escape_parking_north.total = 1
	self.types.corp_escape_parking_north.cost = 0
	self.types.corp_escape_parking_north.budget_cost = 0
	self.types.corp_escape_parking_north.post_event = "preplan_17"
	self.types.corp_escape_parking_north.prio = 3
	self.types.corp_escape_parking_south = {}
	self.types.corp_escape_parking_south.name_id = "menu_pp_asset_corp_escape_parking_south"
	self.types.corp_escape_parking_south.desc_id = "menu_pp_asset_corp_escape_parking_south_desc"
	self.types.corp_escape_parking_south.plan = "escape_plan"
	self.types.corp_escape_parking_south.pos_not_important = false
	self.types.corp_escape_parking_south.category = "escape_plan"
	self.types.corp_escape_parking_south.icon = 54
	self.types.corp_escape_parking_south.total = 1
	self.types.corp_escape_parking_south.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.corp_escape_parking_south.budget_cost = 3
	self.types.corp_escape_parking_south.post_event = "preplan_17"
	self.types.corp_escape_parking_south.prio = 3
	self.types.corp_helicopter_west = {}
	self.types.corp_helicopter_west.name_id = "menu_pp_asset_corp_helicopter_west"
	self.types.corp_helicopter_west.desc_id = "menu_pp_asset_corp_helicopter_west_desc"
	self.types.corp_helicopter_west.plan = "plan_of_action"
	self.types.corp_helicopter_west.pos_not_important = false
	self.types.corp_helicopter_west.category = "plan_of_action"
	self.types.corp_helicopter_west.icon = 73
	self.types.corp_helicopter_west.total = 1
	self.types.corp_helicopter_west.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_escapebig")
	self.types.corp_helicopter_west.budget_cost = 3
	self.types.corp_helicopter_west.post_event = "preplan_17"
	self.types.corp_helicopter_west.prio = 3
	self.types.corp_helicopter_east = {}
	self.types.corp_helicopter_east.name_id = "menu_pp_asset_corp_helicopter_east"
	self.types.corp_helicopter_east.desc_id = "menu_pp_asset_corp_helicopter_east_desc"
	self.types.corp_helicopter_east.plan = "plan_of_action"
	self.types.corp_helicopter_east.pos_not_important = false
	self.types.corp_helicopter_east.category = "plan_of_action"
	self.types.corp_helicopter_east.icon = 73
	self.types.corp_helicopter_east.total = 1
	self.types.corp_helicopter_east.cost = 0
	self.types.corp_helicopter_east.budget_cost = 0
	self.types.corp_helicopter_east.post_event = "preplan_17"
	self.types.corp_helicopter_east.prio = 3
	self.types.corp_wine_delivery = {}
	self.types.corp_wine_delivery.name_id = "menu_pp_asset_corp_wine_delivery"
	self.types.corp_wine_delivery.desc_id = "menu_pp_asset_corp_wine_delivery_desc"
	self.types.corp_wine_delivery.pos_not_important = true
	self.types.corp_wine_delivery.category = "hired_help"
	self.types.corp_wine_delivery.icon = 82
	self.types.corp_wine_delivery.total = 1
	self.types.corp_wine_delivery.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_drillparts")
	self.types.corp_wine_delivery.budget_cost = 2
	self.types.corp_wine_delivery.post_event = ""
	self.types.corp_wine_delivery.prio = 3
	self.types.corp_zipline_north = {}
	self.types.corp_zipline_north.name_id = "menu_pp_asset_corp_zipline_north"
	self.types.corp_zipline_north.desc_id = "menu_pp_asset_corp_zipline_north_desc"
	self.types.corp_zipline_north.category = "mission_equipment"
	self.types.corp_zipline_north.pos_not_important = false
	self.types.corp_zipline_north.icon = 62
	self.types.corp_zipline_north.total = 1
	self.types.corp_zipline_north.post_event = "preplan_07"
	self.types.corp_zipline_north.prio = 3
	self.types.corp_zipline_north.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_zipline")
	self.types.corp_zipline_north.budget_cost = 2
	self.types.corp_zipline_south = {}
	self.types.corp_zipline_south.name_id = "menu_pp_asset_corp_zipline_south"
	self.types.corp_zipline_south.desc_id = "menu_pp_asset_corp_zipline_south_desc"
	self.types.corp_zipline_south.category = "mission_equipment"
	self.types.corp_zipline_south.pos_not_important = false
	self.types.corp_zipline_south.icon = 62
	self.types.corp_zipline_south.total = 1
	self.types.corp_zipline_south.post_event = "preplan_07"
	self.types.corp_zipline_south.prio = 3
	self.types.corp_zipline_south.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_zipline")
	self.types.corp_zipline_south.budget_cost = 2
	self.types.corp_equipment_drop = {}
	self.types.corp_equipment_drop.name_id = "menu_pp_asset_corp_equipment_drop"
	self.types.corp_equipment_drop.desc_id = "menu_pp_asset_corp_equipment_drop_desc"
	self.types.corp_equipment_drop.category = "mission_equipment"
	self.types.corp_equipment_drop.pos_not_important = false
	self.types.corp_equipment_drop.icon = 132
	self.types.corp_equipment_drop.total = 1
	self.types.corp_equipment_drop.post_event = "preplan_07"
	self.types.corp_equipment_drop.prio = 3
	self.types.corp_equipment_drop.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_bag_shortcut")
	self.types.corp_equipment_drop.budget_cost = 2
	self.types.corp_open_office_door = {}
	self.types.corp_open_office_door.name_id = "menu_pp_asset_corp_open_door"
	self.types.corp_open_office_door.desc_id = "menu_pp_asset_corp_open_door_desc"
	self.types.corp_open_office_door.category = "hired_help"
	self.types.corp_open_office_door.icon = 41
	self.types.corp_open_office_door.total = 1
	self.types.corp_open_office_door.post_event = "preplan_16"
	self.types.corp_open_office_door.prio = 3
	self.types.corp_open_office_door.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_open_window")
	self.types.corp_open_office_door.budget_cost = 2
	self.types.corp_lower_hacktime = {}
	self.types.corp_lower_hacktime.name_id = "menu_pp_asset_corp_lower_hacktime"
	self.types.corp_lower_hacktime.desc_id = "menu_pp_asset_corp_lower_hacktime_desc"
	self.types.corp_lower_hacktime.icon = 15
	self.types.corp_lower_hacktime.pos_not_important = true
	self.types.corp_lower_hacktime.category = "data_hacking"
	self.types.corp_lower_hacktime.total = 1
	self.types.corp_lower_hacktime.cost = tweak_data:get_value("money_manager", "preplaning_thebomb_cost_hacker")
	self.types.corp_lower_hacktime.budget_cost = 4
	self.types.corp_lower_hacktime.post_event = ""
	self.types.corp_lower_hacktime.prio = 3
	self.types.deep_select_bridge = {}
	self.types.deep_select_bridge.name_id = "menu_pp_asset_deep_select_bridge"
	self.types.deep_select_bridge.desc_id = "menu_pp_asset_deep_select_bridge_desc"
	self.types.deep_select_bridge.plan = "entry_plan_generic"
	self.types.deep_select_bridge.pos_not_important = false
	self.types.deep_select_bridge.category = "mission_equipment"
	self.types.deep_select_bridge.icon = 23
	self.types.deep_select_bridge.total = 1
	self.types.deep_select_bridge.cost = 0
	self.types.deep_select_bridge.budget_cost = 0
	self.types.deep_select_bridge.post_event = "preplan_07"
	self.types.deep_select_bridge.prio = 3
	self.types.deep_door_sabbotage = {}
	self.types.deep_door_sabbotage.name_id = "menu_pp_asset_door_sabbotage"
	self.types.deep_door_sabbotage.desc_id = "menu_pp_asset_door_sabbotage_desc"
	self.types.deep_door_sabbotage.category = "data_hacking"
	self.types.deep_door_sabbotage.pos_not_important = true
	self.types.deep_door_sabbotage.icon = 45
	self.types.deep_door_sabbotage.total = 1
	self.types.deep_door_sabbotage.post_event = "preplan_16"
	self.types.deep_door_sabbotage.prio = 3
	self.types.deep_door_sabbotage.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_open_window")
	self.types.deep_door_sabbotage.budget_cost = 2
	self.types.deep_extra_boss_loot = {}
	self.types.deep_extra_boss_loot.name_id = "menu_pp_asset_deep_extra_boss_loot"
	self.types.deep_extra_boss_loot.desc_id = "menu_pp_asset_deep_extra_boss_loot_desc"
	self.types.deep_extra_boss_loot.pos_not_important = false
	self.types.deep_extra_boss_loot.category = "insider_help"
	self.types.deep_extra_boss_loot.icon = 123
	self.types.deep_extra_boss_loot.total = 1
	self.types.deep_extra_boss_loot.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_drillparts")
	self.types.deep_extra_boss_loot.budget_cost = 4
	self.types.deep_extra_boss_loot.post_event = ""
	self.types.deep_extra_boss_loot.prio = 3
	self.types.deep_keycard_holder = {}
	self.types.deep_keycard_holder.name_id = "menu_pp_asset_deep_keycard_holder"
	self.types.deep_keycard_holder.desc_id = "menu_pp_asset_deep_keycard_holder_desc"
	self.types.deep_keycard_holder.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.types.deep_keycard_holder.pos_not_important = true
	self.types.deep_keycard_holder.category = "insider_help"
	self.types.deep_keycard_holder.icon = 53
	self.types.deep_keycard_holder.total = 1
	self.types.deep_keycard_holder.cost = tweak_data:get_value("money_manager", "preplaning_asset_cost_unlocked_door")
	self.types.deep_keycard_holder.budget_cost = 2
	self.types.deep_keycard_holder.post_event = ""
	self.types.deep_keycard_holder.prio = 3
	self.types.deep_parachute_entrance = {}
	self.types.deep_parachute_entrance.name_id = "menu_pp_asset_deep_parachute_entrance"
	self.types.deep_parachute_entrance.desc_id = "menu_pp_asset_deep_parachute_entrance_desc"
	self.types.deep_parachute_entrance.plan = "entry_plan_generic"
	self.types.deep_parachute_entrance.pos_not_important = false
	self.types.deep_parachute_entrance.category = "entry_plan_generic"
	self.types.deep_parachute_entrance.icon = 133
	self.types.deep_parachute_entrance.total = 1
	self.types.deep_parachute_entrance.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_fex_stealth_entry_with_boat")
	self.types.deep_parachute_entrance.budget_cost = 4
	self.types.deep_parachute_entrance.post_event = "preplan_07"
	self.types.deep_parachute_entrance.prio = 3
	self.types.deep_boat_entrance = {}
	self.types.deep_boat_entrance.name_id = "menu_pp_asset_deep_boat_entrance"
	self.types.deep_boat_entrance.desc_id = "menu_pp_asset_deep_boat_entrance_desc"
	self.types.deep_boat_entrance.plan = "entry_plan_generic"
	self.types.deep_boat_entrance.pos_not_important = false
	self.types.deep_boat_entrance.category = "entry_plan_generic"
	self.types.deep_boat_entrance.icon = 134
	self.types.deep_boat_entrance.total = 1
	self.types.deep_boat_entrance.cost = 0
	self.types.deep_boat_entrance.budget_cost = 0
	self.types.deep_boat_entrance.post_event = "preplan_07"
	self.types.deep_boat_entrance.prio = 3
	self.types.deep_uninterruptable_gen_loud = {}
	self.types.deep_uninterruptable_gen_loud.name_id = "menu_pp_asset_deep_uninterruptable_gen_loud"
	self.types.deep_uninterruptable_gen_loud.desc_id = "menu_pp_asset_deep_uninterruptable_gen_loud_desc"
	self.types.deep_uninterruptable_gen_loud.plan = "entry_plan_generic"
	self.types.deep_uninterruptable_gen_loud.pos_not_important = false
	self.types.deep_uninterruptable_gen_loud.category = "insider_help"
	self.types.deep_uninterruptable_gen_loud.icon = 93
	self.types.deep_uninterruptable_gen_loud.total = 1
	self.types.deep_uninterruptable_gen_loud.cost = tweak_data:get_value("money_manager", "preplanning_asset_cost_pex_open_window")
	self.types.deep_uninterruptable_gen_loud.budget_cost = 4
	self.types.deep_uninterruptable_gen_loud.post_event = "preplan_07"
	self.types.deep_uninterruptable_gen_loud.prio = 3
end

function PrePlanningTweakData:_create_locations(tweak_data)
	self.upgrade_locks = {
		"none",
		"additional_assets"
	}
	self.dlc_locks = {
		"none",
		"big_bank"
	}
	self.location_groups = {
		"a",
		"b",
		"c",
		"d",
		"e",
		"f"
	}
	self.locations = {}
	self.locations.big = {
		default_plans = {
			escape_plan = "escape_helicopter_loud",
			vault_plan = "vault_big_drill"
		},
		start_location = {
			group = "a",
			x = 1500,
			y = 1025,
			zoom = 1.5
		},
		{
			map_size = 1,
			map_x = -1.1,
			name_id = "menu_pp_big_loc_a",
			rotation = 90,
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_lobby",
			x1 = -250,
			x2 = 5750,
			y1 = -3000,
			y2 = 3000,
			map_y = -0 + 0.5,
			custom_points = {
				{
					icon = 45,
					post_event = "pln_pp_bb1_a",
					rotation = -90,
					text_id = "menu_pp_info_frontdoor",
					to_upper = true,
					x = 1500,
					y = 1025
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_c",
					rotation = -90,
					text_id = "menu_pp_info_backoffices",
					to_upper = true,
					x = 800,
					y = 480
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_l",
					rotation = -90,
					text_id = "menu_pp_info_garage",
					to_upper = true,
					x = 1300,
					y = 1690
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_n",
					rotation = -90,
					text_id = "menu_pp_info_mainhall",
					to_upper = true,
					x = 1000,
					y = 1025
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_o",
					rotation = -90,
					text_id = "menu_pp_info_entrypoint",
					to_upper = true,
					x = 1950,
					y = 350
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_d",
					rotation = -90,
					text_id = "menu_pp_info_timelock",
					to_upper = true,
					x = 90,
					y = 1024
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_i",
					rotation = -90,
					text_id = "menu_pp_info_securityroom",
					to_upper = true,
					x = 348,
					y = 590
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_i",
					rotation = -90,
					text_id = "menu_pp_info_securityroom",
					to_upper = true,
					x = 574,
					y = 1742
				}
			}
		},
		{
			map_size = 1,
			map_x = 0,
			map_y = 0.5,
			name_id = "menu_pp_big_loc_b",
			rotation = 90,
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_level_2",
			x1 = -250,
			x2 = 5750,
			y1 = -3000,
			y2 = 3000,
			custom_points = {
				{
					icon = 45,
					post_event = "pln_pp_bb1_k",
					rotation = -90,
					text_id = "menu_pp_info_mgroffices",
					to_upper = true,
					x = 190,
					y = 1700
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_c",
					rotation = -90,
					text_id = "menu_pp_info_backoffices",
					to_upper = true,
					x = 800,
					y = 480
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_d",
					rotation = -90,
					text_id = "menu_pp_info_timelock",
					to_upper = true,
					x = 90,
					y = 1024
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_b",
					rotation = -90,
					text_id = "menu_pp_info_ladder",
					to_upper = true,
					x = 870,
					y = 1625
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_i",
					rotation = -90,
					text_id = "menu_pp_info_securityroom",
					to_upper = true,
					x = 164,
					y = 1437
				}
			}
		},
		{
			map_size = 1,
			map_x = 1.1,
			name_id = "menu_pp_big_loc_c",
			rotation = 90,
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_roof",
			x1 = -250,
			x2 = 5750,
			y1 = -3000,
			y2 = 3000,
			map_y = -0 + 0.5,
			custom_points = {
				{
					icon = 45,
					post_event = "pln_pp_bb1_b",
					rotation = -90,
					text_id = "menu_pp_info_ladder",
					to_upper = true,
					x = 869,
					y = 1629
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_m",
					rotation = -90,
					text_id = "menu_pp_info_zipline",
					to_upper = true,
					x = 1356,
					y = 1164
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_h",
					rotation = -90,
					text_id = "menu_pp_info_roof",
					to_upper = true,
					x = 782,
					y = 1458
				}
			}
		},
		{
			map_size = 1,
			map_y = -0.6000000000000001,
			name_id = "menu_pp_big_loc_d",
			rotation = 90,
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_level_vault_2",
			x1 = -5771,
			x2 = 229,
			y1 = -3000,
			y2 = 3000,
			map_x = -0,
			custom_points = {
				{
					icon = 45,
					post_event = "pln_pp_bb1_g",
					rotation = -90,
					text_id = "menu_pp_info_vaultsecurity1",
					to_upper = true,
					x = 1152,
					y = 1298
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_g",
					rotation = -90,
					text_id = "menu_pp_info_vaultsecurity2",
					to_upper = true,
					x = 1152,
					y = 746
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_f",
					rotation = -90,
					text_id = "menu_pp_info_vault",
					to_upper = true,
					x = 465,
					y = 1365
				}
			}
		},
		{
			map_size = 1,
			map_x = -1.1,
			map_y = -0.6000000000000001,
			name_id = "menu_pp_big_loc_e",
			rotation = 90,
			texture = "guis/dlcs/big_bank/textures/pd2/pre_planning/big_level_vault",
			x1 = -5771,
			x2 = 229,
			y1 = -3000,
			y2 = 3000,
			custom_points = {
				{
					icon = 45,
					post_event = "pln_pp_bb1_e",
					rotation = -90,
					text_id = "menu_pp_info_moneycounting",
					to_upper = true,
					x = 1154,
					y = 1015
				},
				{
					icon = 45,
					post_event = "pln_pp_bb1_f",
					rotation = -90,
					text_id = "menu_pp_info_vault",
					to_upper = true,
					x = 465,
					y = 1365
				}
			}
		},
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_big",
		total_budget = 10
	}
	self.locations.mia_1 = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 1024,
			y = 512,
			zoom = 1
		},
		{
			map_height = 1,
			map_width = 2,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_mia_1_loc_a",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/hlm_01",
			x1 = -5524,
			x2 = 7476,
			y1 = -5358,
			y2 = 1142,
			custom_points = {}
		},
		{
			map_height = 0.5,
			map_width = 1,
			map_x = 1.05,
			map_y = -0.25,
			name_id = "menu_pp_mia_1_loc_b",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/hlm_02",
			x1 = -1018,
			x2 = 7782,
			y1 = -4672,
			y2 = -272,
			custom_points = {}
		},
		{
			map_height = 0.5,
			map_width = 1,
			map_x = 1.05,
			map_y = 0.25,
			name_id = "menu_pp_mia_1_loc_c",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/hlm_03",
			x1 = -1018,
			x2 = 7782,
			y1 = -4672,
			y2 = -272,
			custom_points = {}
		},
		grid_height_mul = 1.4,
		grid_width_mul = 0.5,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_hlm1",
		total_budget = 6
	}
	self.locations.mia_2 = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 290,
			y = 835,
			zoom = 1.25
		},
		{
			map_height = 1,
			map_width = 1,
			map_x = 0,
			map_y = 1,
			name_id = "menu_pp_mia_2_loc_a",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/hlm2_01",
			x1 = -3050,
			x2 = 3850,
			y1 = -3275,
			y2 = 3625,
			custom_points = {
				{
					icon = 45,
					post_event = "Play_pln_pp_hm2_01",
					rotation = 0,
					text_id = "menu_pp_info_the_box",
					to_upper = true,
					x = 290,
					y = 840
				},
				{
					icon = 45,
					post_event = "Play_pln_pp_hm2_04",
					rotation = 0,
					text_id = "menu_pp_info_bombstrapped",
					to_upper = true,
					x = 423,
					y = 507
				}
			}
		},
		{
			map_height = 1,
			map_width = 1,
			map_x = -1,
			map_y = 0,
			name_id = "menu_pp_mia_2_loc_b",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/hlm2_02",
			x1 = -3050,
			x2 = 3850,
			y1 = -3275,
			y2 = 3625,
			custom_points = {}
		},
		{
			map_height = 1,
			map_width = 1,
			map_x = 0,
			map_y = 0,
			name_id = "menu_pp_mia_2_loc_c",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/hlm2_03",
			x1 = -3050,
			x2 = 3850,
			y1 = -3275,
			y2 = 3625,
			custom_points = {}
		},
		{
			map_height = 1,
			map_width = 1,
			map_x = 1,
			map_y = 0,
			name_id = "menu_pp_mia_2_loc_d",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/hlm2_04",
			x1 = -3050,
			x2 = 3850,
			y1 = -3275,
			y2 = 3625,
			custom_points = {}
		},
		{
			map_height = 1,
			map_width = 1,
			map_x = 0,
			map_y = -1,
			name_id = "menu_pp_mia_2_loc_e",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/hlm2_05",
			x1 = -3050,
			x2 = 3850,
			y1 = -3275,
			y2 = 3625,
			custom_points = {
				{
					icon = 45,
					post_event = "Play_pln_pp_hm2_02",
					rotation = 0,
					text_id = "menu_pp_info_vault_comm",
					to_upper = true,
					x = 300,
					y = 143
				},
				{
					icon = 45,
					post_event = "Play_pln_pp_hm2_03",
					rotation = 0,
					text_id = "menu_pp_info_cocaine_mountain",
					to_upper = true,
					x = 546,
					y = 143
				}
			}
		},
		grid_height_mul = 0.5,
		grid_width_mul = 0.5,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_hlm2",
		total_budget = 6
	}
	self.locations.framing_frame_1 = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.6,
			map_y = 0,
			name_id = "menu_pp_framing_frame_1_loc_a",
			rotation = 90,
			texture = "guis/textures/pd2/pre_planning/framing_frame_1_1",
			x1 = -2750,
			x2 = 2750,
			y1 = -2750,
			y2 = 2750,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.6,
			map_y = 0,
			name_id = "menu_pp_framing_frame_1_loc_b",
			rotation = 90,
			texture = "guis/textures/pd2/pre_planning/framing_frame_1_2",
			x1 = -2700,
			x2 = 6300,
			y1 = -5300,
			y2 = 3700,
			custom_points = {}
		},
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_framingframe1",
		total_budget = 8
	}
	self.locations.gallery = deep_clone(self.locations.framing_frame_1)
	self.locations.branchbank = {
		default_plans = {
			vault_plan = "branchbank_lance"
		},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.6,
			map_y = 0,
			name_id = "menu_pp_branchbank_loc_a",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/branchbank_1",
			x1 = -3500,
			x2 = 500,
			y1 = -300,
			y2 = 3700,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.6,
			map_y = 0,
			name_id = "menu_pp_branchbank_loc_b",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/branchbank_2",
			x1 = -5500,
			x2 = 2500,
			y1 = -3200,
			y2 = 4800,
			custom_points = {}
		},
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_branchbank",
		total_budget = 8
	}
	self.locations.firestarter_3 = {
		default_plans = {
			vault_plan = "branchbank_lance"
		},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.6,
			map_y = 0,
			name_id = "menu_pp_branchbank_loc_a",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/branchbank_1",
			x1 = -3500,
			x2 = 500,
			y1 = -300,
			y2 = 3700,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.6,
			map_y = 0,
			name_id = "menu_pp_branchbank_loc_b",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/branchbank_2",
			x1 = -5500,
			x2 = 2500,
			y1 = -3200,
			y2 = 4800,
			custom_points = {}
		},
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_branchbank",
		total_budget = 8
	}
	self.locations.framing_frame_3 = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -1.1,
			map_y = 0,
			name_id = "menu_pp_framing_frame_3_loc_b",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/framing_frame_3_1",
			x1 = -6600,
			x2 = -1400,
			y1 = 600,
			y2 = 5800,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0,
			map_y = 0,
			name_id = "menu_pp_framing_frame_3_loc_a",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/framing_frame_3_2",
			x1 = -6600,
			x2 = -1400,
			y1 = 700,
			y2 = 5900,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 1.1,
			map_y = 0,
			name_id = "menu_pp_framing_frame_3_loc_c",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/framing_frame_3_3",
			x1 = -7325,
			x2 = -1325,
			y1 = 625,
			y2 = 6625,
			custom_points = {}
		},
		grid_height_mul = 1.5,
		grid_width_mul = 2.2,
		min_zoom = 0.7,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_framingframe3",
		total_budget = 8
	}
	self.locations.kosugi = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 2048,
			y = 1024,
			zoom = 0.8
		},
		{
			map_size = 2,
			map_x = -0.5999999999999999,
			map_y = -0.5999999999999999,
			name_id = "menu_pp_shadow_raid_loc_a",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/shadow_raid_1",
			x1 = -5650,
			x2 = 6850,
			y1 = -7850,
			y2 = 4650,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 1.1,
			map_y = -1.1,
			name_id = "menu_pp_shadow_raid_loc_b",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/shadow_raid_2",
			x1 = -3950,
			x2 = 1550,
			y1 = -6150,
			y2 = -650,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 1.1,
			map_y = 0,
			name_id = "menu_pp_shadow_raid_loc_c",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/shadow_raid_3",
			x1 = -3950,
			x2 = 1550,
			y1 = -6150,
			y2 = -650,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 1.1,
			map_y = 1.1,
			name_id = "menu_pp_shadow_raid_loc_d",
			rotation = 0,
			texture = "guis/textures/pd2/pre_planning/shadow_raid_4",
			x1 = -3950,
			x2 = 1550,
			y1 = -6150,
			y2 = -650,
			custom_points = {}
		},
		min_zoom = 0.4,
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_shadowraid",
		total_budget = 8
	}
	self.locations.mus = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 1024,
			y = 521,
			zoom = 1.5
		},
		{
			map_height = 2,
			map_width = 1,
			map_x = -1.05,
			map_y = 0,
			name_id = "menu_pp_mus_loc_a",
			rotation = -90,
			texture = "guis/textures/pd2/pre_planning/mus_1",
			x1 = -10000,
			x2 = 10000,
			y1 = -5000,
			y2 = 5000,
			custom_points = {}
		},
		{
			map_height = 2,
			map_width = 1,
			map_x = 0,
			map_y = 0,
			name_id = "menu_pp_mus_loc_b",
			rotation = -90,
			texture = "guis/textures/pd2/pre_planning/mus_2",
			x1 = -10000,
			x2 = 10000,
			y1 = -5000,
			y2 = 5000,
			custom_points = {}
		},
		{
			map_height = 2,
			map_width = 1,
			map_x = 1.05,
			map_y = 0,
			name_id = "menu_pp_mus_loc_c",
			rotation = -90,
			texture = "guis/textures/pd2/pre_planning/mus_3",
			x1 = -10000,
			x2 = 10000,
			y1 = -5000,
			y2 = 5000,
			custom_points = {}
		},
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_museum",
		total_budget = 10
	}
	self.locations.crojob2 = {
		default_plans = {
			escape_plan = "crojob2_escape_van"
		},
		start_location = {
			group = "a",
			x = 1024,
			y = 1024,
			zoom = 1.5
		},
		{
			map_size = 1,
			map_x = 0,
			map_y = 0,
			name_id = "menu_pp_crojob_stage_2_loc_a",
			rotation = 0,
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_2_a",
			x1 = -9500,
			x2 = 10500,
			y1 = -8500,
			y2 = 11500,
			custom_points = {
				{
					icon = 45,
					post_event = "Play_pln_cr2_14",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_ship",
					to_upper = true,
					x = 964,
					y = 1134
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_105",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_loading_dock_3B",
					to_upper = true,
					x = 454,
					y = 538
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_106",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_dock_gate",
					to_upper = true,
					x = 964,
					y = 770
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_107",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_control_room_right",
					to_upper = true,
					x = 1134,
					y = 768
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_108",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_control_room_left",
					to_upper = true,
					x = 798,
					y = 768
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_109",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_fence_gate",
					to_upper = true,
					x = 82,
					y = 702
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_110",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_locker_room",
					to_upper = true,
					x = 1524,
					y = 1508
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_111",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_office",
					to_upper = true,
					x = 1526,
					y = 1336
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_112",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_storage_room",
					to_upper = true,
					x = 348,
					y = 1122
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_113",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_ship_control_room_left",
					to_upper = true,
					x = 350,
					y = 1420
				},
				{
					icon = 45,
					post_event = "Play_pln_cr2_114",
					rotation = 0,
					text_id = "menu_pp_info_crojob2_ship_control_room_right",
					to_upper = true,
					x = 1424,
					y = 1118
				}
			}
		},
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_crojob_stealth",
		total_budget = 10
	}
	self.locations.crojob3 = {
		default_plans = {
			escape_plan = "crojob3_escape_boat"
		},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = 0,
			map_y = -0.5,
			name_id = "menu_pp_crojob_stage_3_loc_a",
			rotation = 0,
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_3_a",
			x1 = -50,
			x2 = 14950,
			y1 = -4225,
			y2 = 10775,
			custom_points = {
				{
					icon = 45,
					post_event = "Play_pln_cr3_48",
					rotation = 0,
					text_id = "menu_pp_info_crojob3_vault",
					to_upper = true,
					x = 512,
					y = 550
				},
				{
					icon = 45,
					post_event = "Play_pln_cr3_50",
					rotation = 0,
					text_id = "menu_pp_info_crojob3_water_pump",
					to_upper = true,
					x = 846,
					y = 584
				}
			}
		},
		{
			map_size = 1,
			map_x = 0,
			map_y = 0.5,
			name_id = "menu_pp_crojob_stage_3_loc_b",
			rotation = 0,
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_3_b",
			x1 = -50,
			x2 = 13250,
			y1 = -19225,
			y2 = -4225,
			custom_points = {
				{
					icon = 45,
					post_event = "Play_pln_cr3_49",
					rotation = 0,
					text_id = "menu_pp_info_crojob3_thermite",
					to_upper = true,
					x = 533,
					y = 566
				}
			}
		},
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_crojob_loud",
		total_budget = 10
	}
	self.locations.crojob3_night = {
		default_plans = {
			escape_plan = "crojob3_escape_boat"
		},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = 0,
			map_y = -0.5,
			name_id = "menu_pp_crojob_stage_3_loc_a",
			rotation = 0,
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_3_a",
			x1 = -50,
			x2 = 14950,
			y1 = -4225,
			y2 = 10775,
			custom_points = {
				{
					icon = 45,
					post_event = "Play_pln_cr3_48",
					rotation = 0,
					text_id = "menu_pp_info_crojob3_vault",
					to_upper = true,
					x = 512,
					y = 550
				},
				{
					icon = 45,
					post_event = "Play_pln_cr3_50",
					rotation = 0,
					text_id = "menu_pp_info_crojob3_water_pump",
					to_upper = true,
					x = 846,
					y = 584
				}
			}
		},
		{
			map_size = 1,
			map_x = 0,
			map_y = 0.5,
			name_id = "menu_pp_crojob_stage_3_loc_b",
			rotation = 0,
			texture = "guis/dlcs/the_bomb/textures/pd2/pre_planning/crojob_stage_3_b",
			x1 = -50,
			x2 = 13250,
			y1 = -19225,
			y2 = -4225,
			custom_points = {
				{
					icon = 45,
					post_event = "Play_pln_cr3_49",
					rotation = 0,
					text_id = "menu_pp_info_crojob3_thermite",
					to_upper = true,
					x = 533,
					y = 566
				}
			}
		},
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_crojob_loud",
		total_budget = 10
	}
	self.locations.kenaz = {
		default_plans = {
			entry_plan = "kenaz_silent_entry",
			escape_plan = "kenaz_limo_escape"
		},
		start_location = {
			group = "a",
			x = 1024,
			y = 1024,
			zoom = 1
		},
		{
			map_height = 2,
			map_width = 1,
			map_x = -1.1,
			map_y = 0,
			name_id = "menu_pp_kenaz_loc_a",
			rotation = 0,
			texture = "guis/dlcs/kenaz/textures/pd2/pre_planning/kenaz_loc_a_df",
			x1 = -6175,
			x2 = 4975,
			y1 = -14450,
			y2 = 7850
		},
		start_location = {
			group = "b",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_height = 2,
			map_width = 1,
			map_x = 0,
			map_y = 0,
			name_id = "menu_pp_kenaz_loc_b",
			rotation = 0,
			texture = "guis/dlcs/kenaz/textures/pd2/pre_planning/kenaz_loc_b_df",
			x1 = -6175,
			x2 = 5475,
			y1 = -14450,
			y2 = 8350,
			custom_points = {
				{
					icon = 45,
					post_event = "Play_pln_ca1_140",
					rotation = -90,
					text_id = "menu_pp_info_kenaz_reception",
					to_upper = true,
					x = 544,
					y = 1181
				},
				{
					icon = 45,
					post_event = "Play_pln_ca1_141",
					rotation = -90,
					text_id = "menu_pp_info_kenaz_lobby",
					to_upper = true,
					x = 546,
					y = 1223
				},
				{
					icon = 45,
					post_event = "Play_pln_ca1_142",
					rotation = -90,
					text_id = "menu_pp_info_kenaz_pool_area",
					to_upper = true,
					x = 229,
					y = 1020
				},
				{
					icon = 45,
					post_event = "Play_pln_ca1_143",
					rotation = -90,
					text_id = "menu_pp_info_kenaz_outside_lounge",
					to_upper = true,
					x = 812,
					y = 971
				},
				{
					icon = 45,
					post_event = "Play_pln_ca1_144",
					rotation = -90,
					text_id = "menu_pp_info_kenaz_gambling_hall",
					to_upper = true,
					x = 551,
					y = 924
				},
				{
					icon = 45,
					post_event = "Play_pln_ca1_146",
					rotation = -90,
					text_id = "menu_pp_info_kenaz_employees_only",
					to_upper = true,
					x = 550,
					y = 566
				},
				{
					icon = 45,
					post_event = "Play_pln_ca1_147",
					rotation = -90,
					text_id = "menu_pp_info_kenaz_security_center",
					to_upper = true,
					x = 546,
					y = 625
				}
			}
		},
		start_location = {
			group = "c",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_height = 1,
			map_width = 0.5,
			map_x = 0.85,
			map_y = -0.5,
			name_id = "menu_pp_kenaz_loc_c",
			rotation = 0,
			texture = "guis/dlcs/kenaz/textures/pd2/pre_planning/kenaz_loc_c_df",
			x1 = -200,
			x2 = 200,
			y1 = -400,
			y2 = 400
		},
		mission_briefing_texture = "guis/textures/pd2/pre_planning/mission_briefing_casino",
		total_budget = 15
	}
	self.locations.pbr = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 1024,
			y = 1024,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_berry_bpr_loc_a",
			rotation = 90,
			texture = "guis/dlcs/berry/textures/pd2/pre_planning/base_01",
			x1 = -15000,
			x2 = -5000,
			y1 = -7600,
			y2 = 2400,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.55,
			map_y = 0,
			name_id = "menu_pp_berry_bpr_loc_b",
			rotation = 0,
			texture = "guis/dlcs/berry/textures/pd2/pre_planning/base_02",
			x1 = -15100,
			x2 = -5100,
			y1 = -8000,
			y2 = 2000,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/berry/textures/pd2/pre_planning/mission_briefing_pbr",
		post_event_prefix = "loc",
		total_budget = 6
	}
	self.locations.mex = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 1024,
			y = 1024,
			zoom = 1.5
		},
		active_location_groups = {
			"a",
			"b"
		},
		{
			map_height = 1,
			map_size = 1,
			map_width = 1,
			map_x = -0.6,
			map_y = 1.1,
			name_id = "menu_pp_mex_loc_a",
			texture = "guis/dlcs/mex/textures/pd2/pre_planning/mex_01",
			x1 = -2450,
			x2 = 6750,
			y1 = -2750,
			y2 = 6450,
			rotation = -0,
			custom_points = {
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_entry",
					to_upper = true,
					x = 150,
					y = 1024
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_shack_north",
					to_upper = true,
					x = 875,
					y = 450
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_shack_south",
					to_upper = true,
					x = 975,
					y = 1700
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_tunnel_entrance_north",
					to_upper = true,
					x = 1212,
					y = 370
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_tunnel_entrance_east",
					to_upper = true,
					x = 1700,
					y = 970
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_tunnel_entrance_south",
					to_upper = true,
					x = 1750,
					y = 1650
				}
			}
		},
		{
			map_height = 1,
			map_size = 1,
			map_width = 1,
			map_x = -0.6,
			map_y = 0,
			name_id = "menu_pp_mex_loc_b",
			texture = "guis/dlcs/mex/textures/pd2/pre_planning/mex_02",
			x1 = -2450,
			x2 = 6750,
			y1 = -2750,
			y2 = 6450,
			rotation = -0,
			custom_points = {
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_briefing_room",
					to_upper = true,
					x = 1018,
					y = 990
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_secruity_room_a",
					to_upper = true,
					x = 860,
					y = 915
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_secruity_room_b",
					to_upper = true,
					x = 1290,
					y = 930
				}
			}
		},
		{
			map_height = 1,
			map_size = 1,
			map_width = 1,
			map_x = 0.6,
			map_y = 1.1,
			name_id = "menu_pp_mex_loc_c",
			texture = "guis/dlcs/mex/textures/pd2/pre_planning/mex_03",
			x1 = -3822,
			x2 = 8172,
			y1 = -15597,
			y2 = -3603,
			rotation = -0,
			custom_points = {
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_tunnel_exit_north",
					to_upper = true,
					x = 1420,
					y = 240
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_tunnel_exit_west",
					to_upper = true,
					x = 260,
					y = 1270
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_tunnel_exit_south",
					to_upper = true,
					x = 1820,
					y = 1630
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_hangar_a",
					to_upper = true,
					x = 1630,
					y = 830
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_hangar_b",
					to_upper = true,
					x = 1720,
					y = 1200
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_storage_06",
					to_upper = true,
					x = 610,
					y = 980
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_storage_05",
					to_upper = true,
					x = 610,
					y = 805
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_storage_04",
					to_upper = true,
					x = 610,
					y = 730
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_storage_01",
					to_upper = true,
					x = 710,
					y = 300
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_storage_02",
					to_upper = true,
					x = 800,
					y = 300
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_storage_03",
					to_upper = true,
					x = 880,
					y = 300
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_storage_07",
					to_upper = true,
					x = 590,
					y = 1720
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_storage_08",
					to_upper = true,
					x = 1210,
					y = 1480
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_storage_09",
					to_upper = true,
					x = 930,
					y = 1845
				}
			}
		},
		{
			map_height = 1,
			map_size = 1,
			map_width = 1,
			map_x = 0.6,
			map_y = 0,
			name_id = "menu_pp_mex_loc_d",
			texture = "guis/dlcs/mex/textures/pd2/pre_planning/mex_04",
			x1 = -3822,
			x2 = 8172,
			y1 = -15597,
			y2 = -3603,
			rotation = -0,
			custom_points = {
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_controlroom",
					to_upper = true,
					x = 580,
					y = 700
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_secruity_room_c",
					to_upper = true,
					x = 975,
					y = 575
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_secruity_room_d",
					to_upper = true,
					x = 550,
					y = 840
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_secruity_room_e",
					to_upper = true,
					x = 1070,
					y = 575
				}
			}
		},
		{
			map_height = 1,
			map_size = 1,
			map_width = 1,
			map_x = 0.6,
			map_y = -1.1,
			name_id = "menu_pp_mex_loc_e",
			texture = "guis/dlcs/mex/textures/pd2/pre_planning/mex_05",
			x1 = -3822,
			x2 = 8172,
			y1 = -15597,
			y2 = -3603,
			rotation = -0,
			custom_points = {
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_roof_entrance_a",
					to_upper = true,
					x = 950,
					y = 530
				},
				{
					icon = 45,
					rotation = 0,
					text_id = "menu_pp_info_mex_roof_entrance_b",
					to_upper = true,
					x = 800,
					y = 900
				}
			}
		},
		{
			map_height = 4,
			map_size = 1,
			map_width = 0.12,
			map_x = 0,
			map_y = -0.3,
			name_id = "menu_pp_mex_loc_boarder",
			skip_for_grid = true,
			texture = "guis/dlcs/mex/textures/pd2/pre_planning/mex_boarder_01",
			x1 = -10000,
			x2 = 10000,
			y1 = -5000,
			y2 = 5000,
			rotation = -0
		},
		grid_width_mul = 1,
		mission_briefing_texture = "guis/dlcs/mex/textures/pd2/pre_planning/mex_01",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.bex = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_bex_bpr_loc_a",
			rotation = 180,
			texture = "guis/dlcs/bex/textures/pd2/pre_planning/bex_01",
			x2 = 6000,
			y1 = -7000,
			y2 = 5000,
			x1 = -0 - 6000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.25,
			map_y = 0,
			name_id = "menu_pp_bex_bpr_loc_b",
			rotation = 180,
			texture = "guis/dlcs/bex/textures/pd2/pre_planning/bex_02",
			x2 = 6000,
			y1 = -7000,
			y2 = 5000,
			x1 = -0 - 6000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 1.05,
			map_y = 0,
			name_id = "menu_pp_bex_bpr_loc_c",
			rotation = 180,
			texture = "guis/dlcs/bex/textures/pd2/pre_planning/bex_03",
			x2 = 6000,
			y1 = -7000,
			y2 = 5000,
			x1 = -0 - 6000,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/bex/textures/pd2/pre_planning/bex_preview",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.pex = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -1.5,
			map_y = 0,
			name_id = "menu_pp_pex_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/pex/textures/pd2/pre_planning/pex_01",
			x2 = 5500,
			x1 = -0 - 5500,
			y1 = -0 - 5500,
			y2 = -0 + 5500,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = -0.4,
			map_y = 0,
			name_id = "menu_pp_pex_bpr_loc_b",
			rotation = 0,
			texture = "guis/dlcs/pex/textures/pd2/pre_planning/pex_02",
			x2 = 5500,
			x1 = -0 - 5500,
			y1 = -0 - 5500,
			y2 = -0 + 5500,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/pex/textures/pd2/pre_planning/pex_preview",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.fex = {
		default_plans = {
			entry_plan_generic = "fex_stealth_entry_with_thermite",
			escape_plan = "fex_loud_escape_with_car"
		},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_fex_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/fex/textures/pd2/pre_planning/fex_01",
			x2 = 6000,
			x1 = -0 - 6000,
			y1 = -0 - 6000,
			y2 = -0 + 6000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.55,
			map_y = 0,
			name_id = "menu_pp_fex_bpr_loc_b",
			rotation = 0,
			texture = "guis/dlcs/fex/textures/pd2/pre_planning/fex_02",
			x2 = 6000,
			x1 = -0 - 6000,
			y1 = -0 - 6000,
			y2 = -0 + 6000,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/fex/textures/pd2/pre_planning/fex_preview",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.chas = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_chas_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/chas/textures/pd2/pre_planning/chas_01",
			x1 = -9500,
			x2 = 3500,
			y1 = -4500,
			y2 = 8500,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.55,
			map_y = 0,
			name_id = "menu_pp_chas_bpr_loc_b",
			rotation = 0,
			texture = "guis/dlcs/chas/textures/pd2/pre_planning/chas_02",
			x1 = -9500,
			x2 = 3500,
			y1 = -4500,
			y2 = 8500,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/chas/textures/pd2/pre_planning/chas_preview",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.sand = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_sand_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/sand/textures/pd2/pre_planning/sand_01",
			x1 = -9300,
			x2 = 20700,
			y1 = -16300,
			y2 = 13700,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0.75,
			name_id = "menu_pp_sand_bpr_loc_b",
			rotation = 0,
			texture = "guis/dlcs/sand/textures/pd2/pre_planning/sand_02",
			x1 = -9300,
			x2 = 20700,
			y1 = -16300,
			y2 = 13700,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/sand/textures/pd2/pre_planning/sand_preview",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.chca = {
		default_plans = {
			entry_plan_generic = "chca_entry_as_guest"
		},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_chca_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/chca/textures/pd2/pre_planning/chca_01",
			x1 = -25000,
			x2 = 5000,
			y1 = -9000,
			y2 = 21000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0,
			map_y = 0,
			name_id = "menu_pp_chca_bpr_loc_b",
			rotation = 0,
			texture = "guis/dlcs/chca/textures/pd2/pre_planning/chca_02",
			x1 = -25000,
			x2 = 5000,
			y1 = -9000,
			y2 = 21000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.55,
			map_y = 0,
			name_id = "menu_pp_chca_bpr_loc_c",
			rotation = 0,
			texture = "guis/dlcs/chca/textures/pd2/pre_planning/chca_03",
			x1 = -25000,
			x2 = 5000,
			y1 = -9000,
			y2 = 21000,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/chca/textures/pd2/pre_planning/chca_preview",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.pent = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_pent_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/pent/textures/pd2/pre_planning/pent_03",
			y1 = -8000,
			y2 = 8000,
			x1 = -0 - 8000,
			x2 = -0 + 8000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.55,
			map_y = 0,
			name_id = "menu_pp_pent_bpr_loc_b",
			rotation = 0,
			texture = "guis/dlcs/pent/textures/pd2/pre_planning/pent_02",
			y1 = -8000,
			y2 = 8000,
			x1 = -0 - 8000,
			x2 = -0 + 8000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 1.65,
			map_y = 0,
			name_id = "menu_pp_pent_bpr_loc_c",
			rotation = 0,
			texture = "guis/dlcs/pent/textures/pd2/pre_planning/pent_01",
			y1 = -8000,
			y2 = 8000,
			x1 = -0 - 8000,
			x2 = -0 + 8000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 2.75,
			map_y = 0,
			name_id = "menu_pp_pent_bpr_loc_d",
			rotation = 0,
			texture = "guis/dlcs/pent/textures/pd2/pre_planning/pent_04",
			y1 = -8000,
			y2 = 8000,
			x1 = -0 - 8000,
			x2 = -0 + 8000,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/pent/textures/pd2/pre_planning/pent_preview",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.ranc = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -1.5,
			map_y = 0,
			name_id = "menu_pp_ranc_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/ranc/textures/pd2/pre_planning/ranc_01",
			x2 = 12000,
			x1 = -0 - 12000,
			y1 = -0 - 12000,
			y2 = -0 + 12000,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/ranc/textures/pd2/pre_planning/ranc_preview",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.trai = {
		default_plans = {},
		start_location = {
			group = "a",
			x = 1024,
			y = 1024,
			zoom = 0.8
		},
		{
			map_size = 1,
			map_x = 0,
			map_y = 0,
			name_id = "menu_pp_trai_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/trai/textures/pd2/pre_planning/trai_01",
			x1 = -11500,
			x2 = 4500,
			y1 = -3500,
			y2 = 12500,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/trai/textures/pd2/pre_planning/trai_01",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.corp = {
		default_plans = {
			entry_plan_generic = "corp_entry_main",
			escape_plan = "corp_escape_parking_north",
			plan_of_action = "corp_helicopter_east"
		},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_corp_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/corp/textures/pd2/pre_planning/corp_01",
			x1 = -10200,
			x2 = 11800,
			y1 = -11000,
			y2 = 11000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.55,
			map_y = 0,
			name_id = "menu_pp_corp_bpr_loc_b",
			rotation = 0,
			texture = "guis/dlcs/corp/textures/pd2/pre_planning/corp_02",
			x1 = -10200,
			x2 = 11800,
			y1 = -11000,
			y2 = 11000,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 1.65,
			map_y = 0,
			name_id = "menu_pp_corp_bpr_loc_c",
			rotation = 0,
			texture = "guis/dlcs/corp/textures/pd2/pre_planning/corp_03",
			x1 = -10200,
			x2 = 11800,
			y1 = -11000,
			y2 = 11000,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/corp/textures/pd2/pre_planning/corp_01",
		post_event_prefix = "loc",
		total_budget = 10
	}
	self.locations.deep = {
		default_plans = {
			entry_plan_generic = "deep_boat_entrance"
		},
		start_location = {
			group = "a",
			x = 512,
			y = 512,
			zoom = 1
		},
		{
			map_size = 1,
			map_x = -0.55,
			map_y = 0,
			name_id = "menu_pp_deep_bpr_loc_a",
			rotation = 0,
			texture = "guis/dlcs/deep/textures/pd2/pre_planning/deep_01",
			x1 = -7500,
			x2 = 7500,
			y1 = -7500,
			y2 = 7500,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 0.55,
			map_y = 0,
			name_id = "menu_pp_deep_bpr_loc_b",
			rotation = 0,
			texture = "guis/dlcs/deep/textures/pd2/pre_planning/deep_02",
			x1 = -7500,
			x2 = 7500,
			y1 = -7500,
			y2 = 7500,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 1.65,
			map_y = 0,
			name_id = "menu_pp_deep_bpr_loc_c",
			rotation = 0,
			texture = "guis/dlcs/deep/textures/pd2/pre_planning/deep_03",
			x1 = -7500,
			x2 = 7500,
			y1 = -7500,
			y2 = 7500,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 2.75,
			map_y = 0,
			name_id = "menu_pp_deep_bpr_loc_d",
			rotation = 0,
			texture = "guis/dlcs/deep/textures/pd2/pre_planning/deep_04",
			x1 = -7500,
			x2 = 7500,
			y1 = -7500,
			y2 = 7500,
			custom_points = {}
		},
		{
			map_size = 1,
			map_x = 3.85,
			map_y = 0,
			name_id = "menu_pp_deep_bpr_loc_e",
			rotation = 0,
			texture = "guis/dlcs/deep/textures/pd2/pre_planning/deep_05",
			x1 = -7500,
			x2 = 7500,
			y1 = -7500,
			y2 = 7500,
			custom_points = {}
		},
		mission_briefing_texture = "guis/dlcs/deep/textures/pd2/pre_planning/deep_01",
		post_event_prefix = "loc",
		total_budget = 10
	}
end

function PrePlanningTweakData:get_level_data(level_id)
	return self.locations[level_id] or {}
end
