AssetsTweakData = AssetsTweakData or class()

function AssetsTweakData:init(tweak_data)
	self:_init_empty_asset(tweak_data)
	self:_init_assets(tweak_data)
	self:_init_risk_assets(tweak_data)
	self:_init_safehouse_assets(tweak_data)
	self:_init_gage_assets(tweak_data)
end

function AssetsTweakData:_init_empty_asset(tweak_data)
	self.none = {}
	self.none.name_id = nil
	self.none.unlock_desc_id = nil
	self.none.texture = nil
	self.none.stages = nil
	self.none.exclude_stages = nil
	self.none.require_to_unlock = nil
	self.none.visible_if_locked = nil
	self.none.no_mystery = nil
	self.none.saved_job_lock = nil
	self.none.job_lock = nil
	self.none.money_lock = nil
	self.none.upgrade_lock = nil
	self.none.achievment_lock = nil
	self.none.dlc_lock = nil
	self.none.server_lock = nil
	self.none.set_saved_job_value = nil
	self.none.set_job_value = nil
	self.none.award_achievement = nil
	self.none.progress_stat = nil
end

function AssetsTweakData:_init_safehouse_assets(tweak_data)
	return
end

function AssetsTweakData:_init_risk_assets(tweak_data)
	self.risk_pd = {}
	self.risk_pd.name_id = "menu_asset_risklevel_0"
	self.risk_pd.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_0"
	self.risk_pd.stages = "all"
	self.risk_pd.exclude_stages = {
		"safehouse",
		"chill",
		"crojob1",
		"haunted",
		"cage",
		"kosugi",
		"dark",
		"mad",
		"fish"
	}
	self.risk_pd.risk_lock = 0
	self.risk_swat = {}
	self.risk_swat.name_id = "menu_asset_risklevel_1"
	self.risk_swat.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_1"
	self.risk_swat.stages = "all"
	self.risk_swat.exclude_stages = {
		"safehouse",
		"chill",
		"crojob1",
		"haunted",
		"cage",
		"kosugi",
		"dark",
		"mad",
		"fish"
	}
	self.risk_swat.risk_lock = 1
	self.risk_fbi = {}
	self.risk_fbi.name_id = "menu_asset_risklevel_2"
	self.risk_fbi.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_2"
	self.risk_fbi.stages = "all"
	self.risk_fbi.exclude_stages = {
		"safehouse",
		"chill",
		"crojob1",
		"haunted",
		"cage",
		"kosugi",
		"dark",
		"mad",
		"fish"
	}
	self.risk_fbi.risk_lock = 2
	self.risk_death_squad = {}
	self.risk_death_squad.name_id = "menu_asset_risklevel_3"
	self.risk_death_squad.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_3"
	self.risk_death_squad.stages = "all"
	self.risk_death_squad.exclude_stages = {
		"safehouse",
		"chill",
		"crojob1",
		"haunted",
		"cage",
		"kosugi",
		"dark",
		"mad",
		"fish"
	}
	self.risk_death_squad.risk_lock = 3
	self.risk_easy_wish = {}
	self.risk_easy_wish.name_id = "menu_asset_risklevel_4"
	self.risk_easy_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_4"
	self.risk_easy_wish.stages = "all"
	self.risk_easy_wish.exclude_stages = {
		"safehouse",
		"chill",
		"crojob1",
		"haunted",
		"cage",
		"kosugi",
		"dark",
		"mad",
		"fish"
	}
	self.risk_easy_wish.risk_lock = 4
	self.risk_death_wish = {}
	self.risk_death_wish.name_id = "menu_asset_risklevel_5"
	self.risk_death_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_5"
	self.risk_death_wish.stages = "all"
	self.risk_death_wish.exclude_stages = {
		"safehouse",
		"chill",
		"crojob1",
		"haunted",
		"cage",
		"kosugi",
		"dark",
		"mad",
		"fish"
	}
	self.risk_death_wish.risk_lock = 5
	self.risk_sm_wish = {}
	self.risk_sm_wish.name_id = "menu_asset_risklevel_6"
	self.risk_sm_wish.texture = "guis/textures/pd2/mission_briefing/assets/assets_risklevel_6"
	self.risk_sm_wish.stages = "all"
	self.risk_sm_wish.exclude_stages = {
		"safehouse",
		"chill",
		"crojob1",
		"haunted",
		"cage",
		"kosugi",
		"dark",
		"mad",
		"fish"
	}
	self.risk_sm_wish.risk_lock = 6
end

function AssetsTweakData:_init_gage_assets(tweak_data)
	self.gage_assignment = {}
	self.gage_assignment.name_id = "menu_asset_gage_assignment"
	self.gage_assignment.texture = "guis/dlcs/gage_pack_jobs/textures/pd2/mission_briefing/assets/gage_assignment"
	self.gage_assignment.stages = "all"
	self.gage_assignment.exclude_stages = {
		"safehouse",
		"chill",
		"chill_combat",
		"haunted",
		"crojob1",
		"short1_stage1",
		"short1_stage2",
		"short2_stage1",
		"short2_stage2b"
	}
end

function AssetsTweakData:_init_assets(tweak_data)
	self.safe_escape = {}
	self.safe_escape.name_id = "menu_asset_safe_escape"
	self.safe_escape.texture = "guis/textures/pd2/mission_briefing/assets/generic_assets/generic_escape"
	self.safe_escape.stages = {
		"framing_frame_2",
		"ukrainian_job",
		"jewelry_store",
		"four_stores",
		"nightclub",
		"arm_fac",
		"arm_par",
		"arm_hcm",
		"arm_bri",
		"arm_cro",
		"arm_und",
		"family"
	}
	self.safe_escape.visible_if_locked = true
	self.safe_escape.unlock_desc_id = "menu_asset_safe_escape_desc"
	self.safe_escape.no_mystery = true
	self.safe_escape.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)
	self.safe_escape.upgrade_lock = {
		category = "player",
		upgrade = "additional_assets"
	}
	self.bodybags_bag = {}
	self.bodybags_bag.name_id = "menu_asset_bodybags_bag"
	self.bodybags_bag.texture = "guis/textures/pd2/mission_briefing/assets/generic_assets/bodybags_bag"
	self.bodybags_bag.stages = {
		"welcome_to_the_jungle_1",
		"welcome_to_the_jungle_1_night",
		"welcome_to_the_jungle_2",
		"election_day_1",
		"election_day_2",
		"firestarter_1",
		"firestarter_2",
		"ukrainian_job",
		"jewelry_store",
		"four_stores",
		"nightclub",
		"arm_for",
		"family",
		"roberts",
		"cage",
		"hox_3",
		"arena",
		"red2",
		"dark",
		"friend",
		"fish",
		"dah",
		"tag",
		"sah",
		"vit"
	}
	self.bodybags_bag.visible_if_locked = true
	self.bodybags_bag.unlock_desc_id = "menu_asset_bodybags_bag_desc"
	self.bodybags_bag.no_mystery = true
	self.bodybags_bag.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 4)
	self.bodybags_bag.upgrade_lock = {
		category = "player",
		upgrade = "buy_bodybags_asset"
	}
	self.spotter = {}
	self.spotter.name_id = "menu_asset_spotter"
	self.spotter.texture = "guis/textures/pd2/mission_briefing/assets/generic_assets/spotter"
	self.spotter.stages = {
		"election_day_1",
		"election_day_2",
		"firestarter_2"
	}
	self.spotter.visible_if_locked = true
	self.spotter.unlock_desc_id = "menu_asset_spotter_desc"
	self.spotter.no_mystery = true
	self.spotter.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 8)
	self.spotter.upgrade_lock = {
		category = "player",
		upgrade = "buy_spotter_asset"
	}
	self.grenade_crate = {}
	self.grenade_crate.name_id = "menu_asset_grenade_crate"
	self.grenade_crate.texture = "guis/dlcs/gage_pack/textures/pd2/mission_briefing/assets/grenade_crate"
	self.grenade_crate.stages = {
		"watchdogs_1",
		"watchdogs_1_night",
		"watchdogs_2",
		"watchdogs_2_day",
		"welcome_to_the_jungle_1",
		"welcome_to_the_jungle_1_night",
		"welcome_to_the_jungle_2",
		"alex_1",
		"ratatouille",
		"firestarter_1",
		"firestarter_2",
		"arm_for",
		"roberts",
		"election_day_1",
		"election_day_3",
		"election_day_3_skip1",
		"election_day_3_skip2",
		"rat",
		"hox_3",
		"arena",
		"jolly",
		"red2",
		"pbr2",
		"nail",
		"dinner",
		"cane",
		"peta",
		"peta2",
		"man",
		"pal",
		"mad",
		"born",
		"chew",
		"flat",
		"help",
		"moon",
		"friend",
		"spa",
		"glace",
		"run",
		"rvd1",
		"rvd2",
		"dah",
		"wwh",
		"hvh",
		"brb",
		"des",
		"sah",
		"bph",
		"vit",
		"nmh",
		"mex_cooking"
	}
	self.grenade_crate.visible_if_locked = true
	self.grenade_crate.unlock_desc_id = "menu_asset_grenade_crate_desc"
	self.grenade_crate.no_mystery = true
	self.grenade_crate.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 1)
	self.grenade_crate.dlc_lock = "gage_pack"
	self.grenade_crate.server_lock = true
	self.grenade_crate.progress_stat = "gage_10_stats"
	self.ammo_bag = {}
	self.ammo_bag.name_id = "menu_asset_ammo"
	self.ammo_bag.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset01"
	self.ammo_bag.stages = {
		"roberts",
		"election_day_1",
		"election_day_2",
		"election_day_3",
		"election_day_3_skip1",
		"election_day_3_skip2",
		"arm_for",
		"rat",
		"hox_3",
		"shoutout_raid",
		"arena",
		"jolly",
		"red2",
		"pbr2",
		"nail",
		"dinner",
		"cane",
		"peta",
		"peta2",
		"man",
		"pal",
		"mad",
		"born",
		"chew",
		"flat",
		"help",
		"moon",
		"friend",
		"spa",
		"glace",
		"run",
		"rvd1",
		"rvd2",
		"dah",
		"wwh",
		"hvh",
		"brb",
		"des",
		"sah",
		"bph",
		"vit",
		"nmh",
		"mex_cooking"
	}
	self.ammo_bag.visible_if_locked = true
	self.ammo_bag.unlock_desc_id = "menu_asset_ammo_desc"
	self.ammo_bag.no_mystery = true
	self.ammo_bag.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.health_bag = {}
	self.health_bag.name_id = "menu_asset_health"
	self.health_bag.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset02"
	self.health_bag.stages = {
		"roberts",
		"election_day_1",
		"election_day_2",
		"election_day_3",
		"election_day_3_skip1",
		"election_day_3_skip2",
		"arm_for",
		"rat",
		"hox_3",
		"shoutout_raid",
		"arena",
		"jolly",
		"red2",
		"pbr2",
		"nail",
		"dinner",
		"cane",
		"peta",
		"peta2",
		"man",
		"pal",
		"mad",
		"born",
		"chew",
		"flat",
		"help",
		"moon",
		"friend",
		"spa",
		"glace",
		"run",
		"rvd1",
		"rvd2",
		"dah",
		"wwh",
		"hvh",
		"brb",
		"des",
		"sah",
		"bph",
		"vit",
		"nmh",
		"mex_cooking"
	}
	self.health_bag.visible_if_locked = true
	self.health_bag.unlock_desc_id = "menu_asset_health_desc"
	self.health_bag.no_mystery = true
	self.health_bag.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.camera_access = {}
	self.camera_access.name_id = "menu_asset_cam"
	self.camera_access.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset03"
	self.camera_access.stages = {
		"example_level",
		"friend"
	}
	self.camera_access.visible_if_locked = true
	self.camera_access.unlock_desc_id = "menu_asset_cam_desc"
	self.camera_access.no_mystery = true
	self.camera_access.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 7)
	self.sniper_spot_jewelery = {}
	self.sniper_spot_jewelery.name_id = "menu_asset_sniper_spot"
	self.sniper_spot_jewelery.texture = "guis/textures/pd2/mission_briefing/assets/jewelery_store/sniper_spot_jewelery"
	self.sniper_spot_jewelery.stages = {
		"jewelry_store",
		"ukrainian_job"
	}
	self.sniper_spot_jewelery.visible_if_locked = true
	self.sniper_spot_jewelery.unlock_desc_id = "menu_asset_sniper_spot_desc"
	self.sniper_spot_jewelery.no_mystery = true
	self.sniper_spot_jewelery.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 4)
	self.sniper_spot_jewelery.dlc_lock = "gage_pack_snp"
	self.sniper_spot_jewelery.server_lock = true
	self.sniper_spot_election1 = {}
	self.sniper_spot_election1.name_id = "menu_asset_sniper_spot"
	self.sniper_spot_election1.texture = "guis/textures/pd2/mission_briefing/assets/election_day/day1/sniper_spot_election1"
	self.sniper_spot_election1.stages = {
		"election_day_1"
	}
	self.sniper_spot_election1.visible_if_locked = true
	self.sniper_spot_election1.unlock_desc_id = "menu_asset_sniper_spot_desc"
	self.sniper_spot_election1.no_mystery = true
	self.sniper_spot_election1.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 4)
	self.sniper_spot_election1.dlc_lock = "gage_pack_snp"
	self.sniper_spot_election1.server_lock = true
	self.sniper_spot_election2 = {}
	self.sniper_spot_election2.name_id = "menu_asset_sniper_spot"
	self.sniper_spot_election2.texture = "guis/textures/pd2/mission_briefing/assets/election_day/day2/sniper_spot_election2"
	self.sniper_spot_election2.stages = {
		"election_day_2"
	}
	self.sniper_spot_election2.visible_if_locked = true
	self.sniper_spot_election2.unlock_desc_id = "menu_asset_sniper_spot_desc"
	self.sniper_spot_election2.no_mystery = true
	self.sniper_spot_election2.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 4)
	self.sniper_spot_election2.dlc_lock = "gage_pack_snp"
	self.sniper_spot_election2.server_lock = true
	self.sniper_spot_rats1 = {}
	self.sniper_spot_rats1.name_id = "menu_asset_sniper_spot"
	self.sniper_spot_rats1.texture = "guis/textures/pd2/mission_briefing/assets/rat/day1/sniper_spot_rats1"
	self.sniper_spot_rats1.stages = {
		"alex_1",
		"ratatouille",
		"rat"
	}
	self.sniper_spot_rats1.visible_if_locked = true
	self.sniper_spot_rats1.unlock_desc_id = "menu_asset_sniper_spot_desc"
	self.sniper_spot_rats1.no_mystery = true
	self.sniper_spot_rats1.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 4)
	self.sniper_spot_rats1.dlc_lock = "gage_pack_snp"
	self.sniper_spot_rats1.server_lock = true
	self.sniper_spot_rats3 = {}
	self.sniper_spot_rats3.name_id = "menu_asset_sniper_spot"
	self.sniper_spot_rats3.texture = "guis/textures/pd2/mission_briefing/assets/rat/day3/sniper_spot_rats3"
	self.sniper_spot_rats3.stages = {
		"alex_3"
	}
	self.sniper_spot_rats3.visible_if_locked = true
	self.sniper_spot_rats3.unlock_desc_id = "menu_asset_sniper_spot_desc"
	self.sniper_spot_rats3.no_mystery = true
	self.sniper_spot_rats3.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 4)
	self.sniper_spot_rats3.dlc_lock = "gage_pack_snp"
	self.sniper_spot_rats3.server_lock = true
	self.sniper_spot_firestarter1 = {}
	self.sniper_spot_firestarter1.name_id = "menu_asset_sniper_spot"
	self.sniper_spot_firestarter1.texture = "guis/textures/pd2/mission_briefing/assets/firestarter/day1/sniper_spot_firestarter1"
	self.sniper_spot_firestarter1.stages = {
		"firestarter_1"
	}
	self.sniper_spot_firestarter1.visible_if_locked = true
	self.sniper_spot_firestarter1.unlock_desc_id = "menu_asset_sniper_spot_desc"
	self.sniper_spot_firestarter1.no_mystery = true
	self.sniper_spot_firestarter1.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 4)
	self.sniper_spot_firestarter1.dlc_lock = "gage_pack_snp"
	self.sniper_spot_firestarter1.server_lock = true
	self.ukrainian_job_tiara = {}
	self.ukrainian_job_tiara.name_id = "menu_asset_test_jewelry_store_tiara"
	self.ukrainian_job_tiara.texture = "guis/textures/pd2/mission_briefing/assets/ukranian_job/asset01"
	self.ukrainian_job_tiara.stages = {
		"ukrainian_job"
	}
	self.ukrainian_job_tiara.no_mystery = true
	self.ukrainian_job_front = {}
	self.ukrainian_job_front.name_id = "menu_asset_test_jewelry_store_front"
	self.ukrainian_job_front.texture = "guis/textures/pd2/mission_briefing/assets/ukranian_job/asset02"
	self.ukrainian_job_front.stages = {
		"ukrainian_job"
	}
	self.ukrainian_job_cam = {}
	self.ukrainian_job_cam.name_id = "menu_asset_cam"
	self.ukrainian_job_cam.texture = "guis/textures/pd2/mission_briefing/assets/ukranian_job/asset07"
	self.ukrainian_job_cam.stages = {
		"ukrainian_job"
	}
	self.ukrainian_job_cam.visible_if_locked = true
	self.ukrainian_job_cam.unlock_desc_id = "menu_asset_cam_desc"
	self.ukrainian_job_cam.no_mystery = true
	self.ukrainian_job_cam.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 6)
	self.ukrainian_job_metal_detector = {}
	self.ukrainian_job_metal_detector.name_id = "menu_asset_test_jewelry_store_blueprint"
	self.ukrainian_job_metal_detector.texture = "guis/textures/pd2/mission_briefing/assets/ukranian_job/asset05"
	self.ukrainian_job_metal_detector.stages = {
		"ukrainian_job"
	}
	self.ukrainian_job_shutter = {}
	self.ukrainian_job_shutter.name_id = "menu_asset_test_jewelry_store_code"
	self.ukrainian_job_shutter.unlock_desc_id = "menu_asset_ukrainian_job_shutter_desc"
	self.ukrainian_job_shutter.texture = "guis/textures/pd2/mission_briefing/assets/ukranian_job/asset06"
	self.ukrainian_job_shutter.stages = {
		"ukrainian_job"
	}
	self.ukrainian_job_shutter.no_mystery = true
	self.ukrainian_job_shutter.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.security_safe_05x05 = {}
	self.security_safe_05x05.name_id = "menu_asset_test_jewelry_store_safe"
	self.security_safe_05x05.texture = "guis/textures/pd2/mission_briefing/assets/ukranian_job/asset04"
	self.security_safe_05x05.stages = {
		"ukrainian_job"
	}
	self.welcome_to_the_jungle_keycard = {}
	self.welcome_to_the_jungle_keycard.name_id = "menu_asset_welcome_to_the_jungle_keycard"
	self.welcome_to_the_jungle_keycard.unlock_desc_id = "menu_asset_welcome_to_the_jungle_keycard_desc"
	self.welcome_to_the_jungle_keycard.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset07"
	self.welcome_to_the_jungle_keycard.stages = {
		"welcome_to_the_jungle_2"
	}
	self.welcome_to_the_jungle_keycard.job_lock = "keycard"
	self.welcome_to_the_jungle_shuttercode = {}
	self.welcome_to_the_jungle_shuttercode.name_id = "menu_asset_welcome_to_the_jungle_shuttercode"
	self.welcome_to_the_jungle_shuttercode.unlock_desc_id = "menu_asset_welcome_to_the_jungle_shuttercode_desc"
	self.welcome_to_the_jungle_shuttercode.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset02"
	self.welcome_to_the_jungle_shuttercode.stages = {
		"welcome_to_the_jungle_2"
	}
	self.welcome_to_the_jungle_shuttercode.job_lock = "shuttercode"
	self.welcome_to_the_jungle_plane_keys = {}
	self.welcome_to_the_jungle_plane_keys.name_id = "menu_asset_welcome_to_the_jungle_plane_keys"
	self.welcome_to_the_jungle_plane_keys.unlock_desc_id = "menu_asset_welcome_to_the_jungle_plane_keys_desc"
	self.welcome_to_the_jungle_plane_keys.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset05"
	self.welcome_to_the_jungle_plane_keys.stages = {
		"welcome_to_the_jungle_2"
	}
	self.welcome_to_the_jungle_plane_keys.job_lock = "planekeys"
	self.welcome_to_the_jungle_blueprints = {}
	self.welcome_to_the_jungle_blueprints.name_id = "menu_asset_welcome_to_the_jungle_blueprints"
	self.welcome_to_the_jungle_blueprints.unlock_desc_id = "menu_asset_welcome_to_the_jungle_blueprints_desc"
	self.welcome_to_the_jungle_blueprints.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset09"
	self.welcome_to_the_jungle_blueprints.stages = {
		"welcome_to_the_jungle_2"
	}
	self.welcome_to_the_jungle_blueprints.job_lock = "blueprints"
	self.welcome_to_the_jungle_fusion = {}
	self.welcome_to_the_jungle_fusion.name_id = "menu_asset_welcome_to_the_jungle_fusion"
	self.welcome_to_the_jungle_fusion.unlock_desc_id = "menu_asset_welcome_to_the_jungle_fusion_desc"
	self.welcome_to_the_jungle_fusion.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset08"
	self.welcome_to_the_jungle_fusion.stages = {
		"welcome_to_the_jungle_2"
	}
	self.welcome_to_the_jungle_fusion.job_lock = "fusion"
	self.welcome_to_the_jungle_guards = {}
	self.welcome_to_the_jungle_guards.name_id = "menu_asset_welcome_to_the_jungle_guards"
	self.welcome_to_the_jungle_guards.unlock_desc_id = "menu_asset_welcome_to_the_jungle_guards_desc"
	self.welcome_to_the_jungle_guards.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset06"
	self.welcome_to_the_jungle_guards.stages = {
		"welcome_to_the_jungle_2"
	}
	self.welcome_to_the_jungle_guards.job_lock = "guards"
	self.welcome_to_the_jungle_rossy = {}
	self.welcome_to_the_jungle_rossy.name_id = "menu_asset_welcome_to_the_jungle_rossy"
	self.welcome_to_the_jungle_rossy.unlock_desc_id = "menu_asset_welcome_to_the_jungle_rossy_desc"
	self.welcome_to_the_jungle_rossy.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset04"
	self.welcome_to_the_jungle_rossy.stages = {
		"welcome_to_the_jungle_2"
	}
	self.welcome_to_the_jungle_rossy.job_lock = "rossy"
	self.watchdogs_1_ammo = {}
	self.watchdogs_1_ammo.name_id = "menu_asset_ammo"
	self.watchdogs_1_ammo.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset01"
	self.watchdogs_1_ammo.stages = {
		"watchdogs_1",
		"watchdogs_1_night"
	}
	self.watchdogs_1_ammo.visible_if_locked = true
	self.watchdogs_1_ammo.unlock_desc_id = "menu_asset_ammo_desc"
	self.watchdogs_1_ammo.no_mystery = true
	self.watchdogs_1_ammo.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.watchdogs_1_health = {}
	self.watchdogs_1_health.name_id = "menu_asset_health"
	self.watchdogs_1_health.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset02"
	self.watchdogs_1_health.stages = {
		"watchdogs_1",
		"watchdogs_1_night"
	}
	self.watchdogs_1_health.visible_if_locked = true
	self.watchdogs_1_health.unlock_desc_id = "menu_asset_health_desc"
	self.watchdogs_1_health.no_mystery = true
	self.watchdogs_1_health.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.watchdogs_1_escape_car = {}
	self.watchdogs_1_escape_car.name_id = "menu_asset_watchdogs_escape"
	self.watchdogs_1_escape_car.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/escapecar"
	self.watchdogs_1_escape_car.stages = {
		"watchdogs_1",
		"watchdogs_1_night"
	}
	self.watchdogs_1_escape_car.visible_if_locked = true
	self.watchdogs_1_escape_car.unlock_desc_id = "menu_asset_watchdogs_escape_desc"
	self.watchdogs_1_escape_car.no_mystery = true
	self.watchdogs_1_escape_car.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 7)
	self.watchdogs_2_ammo = {}
	self.watchdogs_2_ammo.name_id = "menu_asset_ammo"
	self.watchdogs_2_ammo.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day2/assets_watchdogs2_ammo"
	self.watchdogs_2_ammo.stages = {
		"watchdogs_2",
		"watchdogs_2_day"
	}
	self.watchdogs_2_ammo.visible_if_locked = true
	self.watchdogs_2_ammo.unlock_desc_id = "menu_asset_ammo_desc"
	self.watchdogs_2_ammo.no_mystery = true
	self.watchdogs_2_ammo.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.watchdogs_2_health = {}
	self.watchdogs_2_health.name_id = "menu_asset_health"
	self.watchdogs_2_health.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day2/assets_watchdogs2_medic"
	self.watchdogs_2_health.stages = {
		"watchdogs_2",
		"watchdogs_2_day"
	}
	self.watchdogs_2_health.visible_if_locked = true
	self.watchdogs_2_health.unlock_desc_id = "menu_asset_health_desc"
	self.watchdogs_2_health.no_mystery = true
	self.watchdogs_2_health.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.watchdogs_2_sniper = {}
	self.watchdogs_2_sniper.name_id = "menu_asset_sniper"
	self.watchdogs_2_sniper.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day2/assets_watchdogs_sniper"
	self.watchdogs_2_sniper.stages = {
		"watchdogs_2",
		"watchdogs_2_day"
	}
	self.watchdogs_2_sniper.visible_if_locked = true
	self.watchdogs_2_sniper.unlock_desc_id = "menu_asset_sniper_desc"
	self.watchdogs_2_sniper.no_mystery = true
	self.watchdogs_2_sniper.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 6)
	self.firestarter_1_ammo = {}
	self.firestarter_1_ammo.name_id = "menu_asset_ammo"
	self.firestarter_1_ammo.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset01"
	self.firestarter_1_ammo.stages = {
		"firestarter_1"
	}
	self.firestarter_1_ammo.visible_if_locked = true
	self.firestarter_1_ammo.unlock_desc_id = "menu_asset_ammo_desc"
	self.firestarter_1_ammo.no_mystery = true
	self.firestarter_1_ammo.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.firestarter_1_health = {}
	self.firestarter_1_health.name_id = "menu_asset_health"
	self.firestarter_1_health.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset02"
	self.firestarter_1_health.stages = {
		"firestarter_1"
	}
	self.firestarter_1_health.visible_if_locked = true
	self.firestarter_1_health.unlock_desc_id = "menu_asset_health_desc"
	self.firestarter_1_health.no_mystery = true
	self.firestarter_1_health.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.firestarter_2_cam = {}
	self.firestarter_2_cam.name_id = "menu_asset_cam"
	self.firestarter_2_cam.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset03"
	self.firestarter_2_cam.stages = {
		"firestarter_2"
	}
	self.firestarter_2_cam.visible_if_locked = true
	self.firestarter_2_cam.unlock_desc_id = "menu_asset_cam_desc"
	self.firestarter_2_cam.no_mystery = true
	self.firestarter_2_cam.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 7)
	self.firestarter_3_insiderinfo = {}
	self.firestarter_3_insiderinfo.name_id = "menu_asset_branchbank_insiderinfo"
	self.firestarter_3_insiderinfo.texture = "guis/textures/pd2/mission_briefing/assets/bank/assets_bank_insiderinfo"
	self.firestarter_3_insiderinfo.stages = {
		"firestarter_3"
	}
	self.firestarter_3_insiderinfo.visible_if_locked = true
	self.firestarter_3_insiderinfo.unlock_desc_id = "menu_asset_branchbank_insiderinfo_desc"
	self.firestarter_3_insiderinfo.no_mystery = true
	self.firestarter_3_insiderinfo.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.firestarter_3_map_basic = {}
	self.firestarter_3_map_basic.name_id = "menu_asset_branchbank_blueprint"
	self.firestarter_3_map_basic.texture = "guis/textures/pd2/mission_briefing/assets/bank/assets_bank_blueprint"
	self.firestarter_3_map_basic.stages = {
		"firestarter_3"
	}
	self.firestarter_3_map_basic.visible_if_locked = true
	self.firestarter_3_map_basic.unlock_desc_id = "menu_asset_branchbank_blueprint_unlock_desc"
	self.firestarter_3_map_basic.no_mystery = true
	self.framing_frame_2_sniper = {}
	self.framing_frame_2_sniper.name_id = "menu_asset_sniper"
	self.framing_frame_2_sniper.texture = "guis/textures/pd2/mission_briefing/assets/framing_frame/day2/asset01"
	self.framing_frame_2_sniper.stages = {
		"framing_frame_2",
		"born"
	}
	self.framing_frame_2_sniper.visible_if_locked = true
	self.framing_frame_2_sniper.unlock_desc_id = "menu_asset_sniper_desc"
	self.framing_frame_2_sniper.no_mystery = true
	self.framing_frame_2_sniper.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 6)
	self.election_day_1_keycard = {}
	self.election_day_1_keycard.name_id = "menu_asset_election1_keycard"
	self.election_day_1_keycard.texture = "guis/textures/pd2/mission_briefing/assets/election_day/day1/assets_election_day_1_keycard"
	self.election_day_1_keycard.stages = {
		"election_day_1"
	}
	self.election_day_1_keycard.visible_if_locked = true
	self.election_day_1_keycard.unlock_desc_id = "menu_asset_election1_keycard_desc"
	self.election_day_1_keycard.no_mystery = true
	self.election_day_1_keycard.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 4)
	self.election_day_2_ladder = {}
	self.election_day_2_ladder.name_id = "menu_asset_election2_ladder"
	self.election_day_2_ladder.texture = "guis/textures/pd2/mission_briefing/assets/election_day/day2/assets_election_day_2_ladder"
	self.election_day_2_ladder.stages = {
		"election_day_2"
	}
	self.election_day_2_ladder.visible_if_locked = true
	self.election_day_2_ladder.unlock_desc_id = "menu_asset_election2_ladder_desc"
	self.election_day_2_ladder.no_mystery = true
	self.election_day_2_ladder.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.election_day_2_keycard = {}
	self.election_day_2_keycard.name_id = "menu_asset_election2_keycard"
	self.election_day_2_keycard.texture = "guis/textures/pd2/mission_briefing/assets/election_day/day2/assets_election_day_2_keycard"
	self.election_day_2_keycard.stages = {
		"election_day_2"
	}
	self.election_day_2_keycard.visible_if_locked = true
	self.election_day_2_keycard.unlock_desc_id = "menu_asset_election2_keycard_desc"
	self.election_day_2_keycard.no_mystery = true
	self.election_day_2_keycard.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 5)
	self.jungle_1_bikers = {}
	self.jungle_1_bikers.name_id = "menu_asset_big_oil_1_bikers"
	self.jungle_1_bikers.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day1/big_oil_1_biker_gang"
	self.jungle_1_bikers.stages = {
		"welcome_to_the_jungle_1",
		"welcome_to_the_jungle_1_night"
	}
	self.jungle_1_bikers.visible_if_locked = true
	self.jungle_1_bikers.unlock_desc_id = "menu_asset_big_oil_1_bikers_desc"
	self.jungle_1_bikers.no_mystery = true
	self.jungle_2_gas = {}
	self.jungle_2_gas.name_id = "menu_asset_jungle_2_gas"
	self.jungle_2_gas.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset01"
	self.jungle_2_gas.stages = {
		"welcome_to_the_jungle_2"
	}
	self.jungle_2_gas.visible_if_locked = true
	self.jungle_2_gas.unlock_desc_id = "menu_asset_jungle_2_gas_desc"
	self.jungle_2_gas.no_mystery = true
	self.jungle_2_gas.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.jungle_2_cam = {}
	self.jungle_2_cam.name_id = "menu_asset_cam"
	self.jungle_2_cam.texture = "guis/textures/pd2/mission_briefing/assets/big_oil/day2/asset03"
	self.jungle_2_cam.stages = {
		"welcome_to_the_jungle_2"
	}
	self.jungle_2_cam.visible_if_locked = true
	self.jungle_2_cam.unlock_desc_id = "menu_asset_cam_desc"
	self.jungle_2_cam.no_mystery = true
	self.jungle_2_cam.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.jungle_2_ammo = {}
	self.jungle_2_ammo.name_id = "menu_asset_jungle_2_ammo"
	self.jungle_2_ammo.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset01"
	self.jungle_2_ammo.stages = {
		"welcome_to_the_jungle_2"
	}
	self.jungle_2_ammo.visible_if_locked = true
	self.jungle_2_ammo.unlock_desc_id = "menu_asset_jungle_2_ammo_desc"
	self.jungle_2_ammo.no_mystery = true
	self.jungle_2_ammo.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.rat_1_ammo = {}
	self.rat_1_ammo.name_id = "menu_asset_ammo"
	self.rat_1_ammo.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset01"
	self.rat_1_ammo.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset01"
	self.rat_1_ammo.stages = {
		"alex_1",
		"ratatouille"
	}
	self.rat_1_ammo.visible_if_locked = true
	self.rat_1_ammo.unlock_desc_id = "menu_asset_ammo_desc"
	self.rat_1_ammo.no_mystery = true
	self.rat_1_ammo.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.rat_1_health = {}
	self.rat_1_health.name_id = "menu_asset_health"
	self.rat_1_health.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset02"
	self.rat_1_health.stages = {
		"alex_1",
		"ratatouille"
	}
	self.rat_1_health.visible_if_locked = true
	self.rat_1_health.unlock_desc_id = "menu_asset_health_desc"
	self.rat_1_health.no_mystery = true
	self.rat_1_health.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.rat_1_lights = {}
	self.rat_1_lights.name_id = "menu_asset_lights"
	self.rat_1_lights.texture = "guis/textures/pd2/mission_briefing/assets/rat/day1/asset01"
	self.rat_1_lights.stages = {
		"alex_1",
		"ratatouille",
		"rat"
	}
	self.rat_1_lights.visible_if_locked = true
	self.rat_1_lights.unlock_desc_id = "menu_asset_lights_desc"
	self.rat_1_lights.no_mystery = true
	self.rat_1_lights.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.rat_3_pilot = {}
	self.rat_3_pilot.name_id = "menu_asset_pilot"
	self.rat_3_pilot.texture = "guis/textures/pd2/mission_briefing/assets/rat/day3/asset01"
	self.rat_3_pilot.stages = {
		"alex_3"
	}
	self.rat_3_pilot.visible_if_locked = true
	self.rat_3_pilot.unlock_desc_id = "menu_asset_pilot_desc"
	self.rat_3_pilot.no_mystery = true
	self.rat_3_pilot.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.mallcrasher_ammo = {}
	self.mallcrasher_ammo.name_id = "menu_asset_ammo"
	self.mallcrasher_ammo.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset01"
	self.mallcrasher_ammo.stages = {
		"mallcrasher"
	}
	self.mallcrasher_ammo.visible_if_locked = true
	self.mallcrasher_ammo.unlock_desc_id = "menu_asset_ammo_desc"
	self.mallcrasher_ammo.no_mystery = true
	self.mallcrasher_ammo.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.mallcrasher_health = {}
	self.mallcrasher_health.name_id = "menu_asset_health"
	self.mallcrasher_health.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset02"
	self.mallcrasher_health.stages = {
		"mallcrasher"
	}
	self.mallcrasher_health.visible_if_locked = true
	self.mallcrasher_health.unlock_desc_id = "menu_asset_health_desc"
	self.mallcrasher_health.no_mystery = true
	self.mallcrasher_health.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.mallcrasher_gascan_south = {}
	self.mallcrasher_gascan_south.name_id = "menu_asset_mallcrasher_gascan_south"
	self.mallcrasher_gascan_south.texture = "guis/textures/pd2/mission_briefing/assets/mallcrasher/asset01"
	self.mallcrasher_gascan_south.stages = {
		"mallcrasher"
	}
	self.mallcrasher_gascan_south.visible_if_locked = true
	self.mallcrasher_gascan_south.unlock_desc_id = "menu_asset_mallcrasher_gascan_south_desc"
	self.mallcrasher_gascan_south.no_mystery = true
	self.mallcrasher_gascan_south.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.mallcrasher_gascan_north = {}
	self.mallcrasher_gascan_north.name_id = "menu_asset_mallcrasher_gascan_north"
	self.mallcrasher_gascan_north.texture = "guis/textures/pd2/mission_briefing/assets/mallcrasher/asset02"
	self.mallcrasher_gascan_north.stages = {
		"mallcrasher"
	}
	self.mallcrasher_gascan_north.visible_if_locked = true
	self.mallcrasher_gascan_north.unlock_desc_id = "menu_asset_mallcrasher_gascan_north_desc"
	self.mallcrasher_gascan_north.no_mystery = true
	self.mallcrasher_gascan_north.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.nightclub_ammo = {}
	self.nightclub_ammo.name_id = "menu_asset_ammo"
	self.nightclub_ammo.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset01"
	self.nightclub_ammo.stages = {
		"nightclub"
	}
	self.nightclub_ammo.visible_if_locked = true
	self.nightclub_ammo.unlock_desc_id = "menu_asset_ammo_desc"
	self.nightclub_ammo.no_mystery = true
	self.nightclub_ammo.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.nightclub_health = {}
	self.nightclub_health.name_id = "menu_asset_health"
	self.nightclub_health.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset02"
	self.nightclub_health.stages = {
		"nightclub"
	}
	self.nightclub_health.visible_if_locked = true
	self.nightclub_health.unlock_desc_id = "menu_asset_health_desc"
	self.nightclub_health.no_mystery = true
	self.nightclub_health.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.nightclub_fire1 = {}
	self.nightclub_fire1.name_id = "menu_asset_nightclub_fire1"
	self.nightclub_fire1.texture = "guis/textures/pd2/mission_briefing/assets/nightclub/asset04"
	self.nightclub_fire1.stages = {
		"nightclub"
	}
	self.nightclub_fire1.visible_if_locked = true
	self.nightclub_fire1.unlock_desc_id = "menu_asset_nightclub_fire1_desc"
	self.nightclub_fire1.no_mystery = true
	self.nightclub_fire1.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.nightclub_fire2 = {}
	self.nightclub_fire2.name_id = "menu_asset_nightclub_fire2"
	self.nightclub_fire2.texture = "guis/textures/pd2/mission_briefing/assets/nightclub/asset03"
	self.nightclub_fire2.stages = {
		"nightclub"
	}
	self.nightclub_fire2.visible_if_locked = true
	self.nightclub_fire2.unlock_desc_id = "menu_asset_nightclub_fire2_desc"
	self.nightclub_fire2.no_mystery = true
	self.nightclub_fire2.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.nightclub_badmusic = {}
	self.nightclub_badmusic.name_id = "menu_asset_nightclub_badmusic"
	self.nightclub_badmusic.texture = "guis/textures/pd2/mission_briefing/assets/nightclub/asset02"
	self.nightclub_badmusic.stages = {
		"nightclub"
	}
	self.nightclub_badmusic.visible_if_locked = true
	self.nightclub_badmusic.unlock_desc_id = "menu_asset_nightclub_badmusic_desc"
	self.nightclub_badmusic.no_mystery = true
	self.nightclub_badmusic.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.nightclub_lootpickup = {}
	self.nightclub_lootpickup.name_id = "menu_asset_nightclub_lootpickup"
	self.nightclub_lootpickup.texture = "guis/textures/pd2/mission_briefing/assets/nightclub/asset01"
	self.nightclub_lootpickup.stages = {
		"nightclub"
	}
	self.nightclub_lootpickup.visible_if_locked = true
	self.nightclub_lootpickup.unlock_desc_id = "menu_asset_nightclub_lootpickup_desc"
	self.nightclub_lootpickup.no_mystery = true
	self.nightclub_lootpickup.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 5)
	self.four_stores_overview = {}
	self.four_stores_overview.name_id = "menu_asset_four_stores_overview"
	self.four_stores_overview.texture = "guis/textures/pd2/mission_briefing/assets/four_stores/asset01"
	self.four_stores_overview.stages = {
		"four_stores"
	}
	self.arm_for_info = {}
	self.arm_for_info.name_id = "menu_asset_arm_info"
	self.arm_for_info.texture = "guis/dlcs/dlc1/textures/pd2/mission_briefing/assets/train_01"
	self.arm_for_info.stages = {
		"arm_for"
	}
	self.arm_for_ammo = {}
	self.arm_for_ammo.name_id = "menu_asset_ammo"
	self.arm_for_ammo.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset01"
	self.arm_for_ammo.stages = {
		"arm_cro",
		"arm_und",
		"arm_par",
		"arm_fac",
		"arm_hcm"
	}
	self.arm_for_ammo.visible_if_locked = true
	self.arm_for_ammo.unlock_desc_id = "menu_asset_ammo_desc"
	self.arm_for_ammo.no_mystery = true
	self.arm_for_ammo.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.arm_for_health = {}
	self.arm_for_health.name_id = "menu_asset_health"
	self.arm_for_health.texture = "guis/textures/pd2/mission_briefing/assets/watch_dogs/day1/asset02"
	self.arm_for_health.stages = {
		"arm_cro",
		"arm_und",
		"arm_par",
		"arm_fac",
		"arm_hcm"
	}
	self.arm_for_health.visible_if_locked = true
	self.arm_for_health.unlock_desc_id = "menu_asset_health_desc"
	self.arm_for_health.no_mystery = true
	self.arm_for_health.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.arm_cro_info = {}
	self.arm_cro_info.name_id = "menu_asset_arm_location"
	self.arm_cro_info.texture = "guis/dlcs/dlc1/textures/pd2/mission_briefing/assets/arm/crossroads"
	self.arm_cro_info.stages = {
		"arm_cro"
	}
	self.arm_fac_info = {}
	self.arm_fac_info.name_id = "menu_asset_arm_location"
	self.arm_fac_info.texture = "guis/dlcs/dlc1/textures/pd2/mission_briefing/assets/arm/harbor"
	self.arm_fac_info.stages = {
		"arm_fac"
	}
	self.arm_par_info = {}
	self.arm_par_info.name_id = "menu_asset_arm_location"
	self.arm_par_info.texture = "guis/dlcs/dlc1/textures/pd2/mission_briefing/assets/arm/park"
	self.arm_par_info.stages = {
		"arm_par"
	}
	self.arm_hcm_info = {}
	self.arm_hcm_info.name_id = "menu_asset_arm_location"
	self.arm_hcm_info.texture = "guis/dlcs/dlc1/textures/pd2/mission_briefing/assets/arm/downtown"
	self.arm_hcm_info.stages = {
		"arm_hcm"
	}
	self.arm_und_info = {}
	self.arm_und_info.name_id = "menu_asset_arm_location"
	self.arm_und_info.texture = "guis/dlcs/dlc1/textures/pd2/mission_briefing/assets/arm/underpass"
	self.arm_und_info.stages = {
		"arm_und"
	}
	self.roberts_pilot = {}
	self.roberts_pilot.name_id = "menu_asset_roberts_pilot"
	self.roberts_pilot.texture = "guis/textures/pd2/mission_briefing/assets/roberts/asset_pilot_amateur"
	self.roberts_pilot.stages = {
		"roberts"
	}
	self.roberts_pilot.visible_if_locked = true
	self.roberts_pilot.unlock_desc_id = "menu_asset_roberts_pilot_desc"
	self.roberts_pilot.no_mystery = true
	self.roberts_pilot.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 10)
	self.roberts_plan_a = {}
	self.roberts_plan_a.name_id = "menu_asset_roberts_plan_a"
	self.roberts_plan_a.texture = "guis/textures/pd2/mission_briefing/assets/roberts/asset_plan_a"
	self.roberts_plan_a.stages = {
		"roberts"
	}
	self.roberts_plan_a.visible_if_locked = true
	self.roberts_plan_a.no_mystery = true
	self.roberts_plan_b = {}
	self.roberts_plan_b.name_id = "menu_asset_roberts_plan_b"
	self.roberts_plan_b.texture = "guis/textures/pd2/mission_briefing/assets/roberts/asset_plan_b"
	self.roberts_plan_b.stages = {
		"roberts"
	}
	self.roberts_plan_b.visible_if_locked = true
	self.roberts_plan_b.no_mystery = true
	self.hox_1 = {}
	self.hox_1.name_id = "heist_hox_1_asset_armoredcar"
	self.hox_1.texture = "guis/textures/pd2/mission_briefing/assets/hoxtonbreakout/assets_hox01_armoredcar"
	self.hox_1.stages = {
		"hox_1"
	}
	self.hox_1.visible_if_locked = true
	self.hox_1.no_mystery = true
	self.hox_2 = {}
	self.hox_2.name_id = "heist_hox_2_asset_hooverbuilding"
	self.hox_2.texture = "guis/textures/pd2/mission_briefing/assets/hoxtonbreakout/assets_hox02_bldg"
	self.hox_2.stages = {
		"hox_2"
	}
	self.hox_2.visible_if_locked = true
	self.hox_2.no_mystery = true
	self.crojob1_plan = {}
	self.crojob1_plan.name_id = "menu_asset_arm_info"
	self.crojob1_plan.texture = "guis/textures/pd2/mission_briefing/assets/bcrojob/stage_1/assets_crojob_insiderinfo_bomb"
	self.crojob1_plan.stages = {
		"crojob1"
	}
	self.crojob1_plan.visible_if_locked = true
	self.crojob1_plan.no_mystery = true
	self.crojob2_plan_a = {}
	self.crojob2_plan_a.name_id = "menu_asset_roberts_plan_a"
	self.crojob2_plan_a.texture = "guis/textures/pd2/mission_briefing/assets/crojob/stage_2/assets_crojob_insiderinfo_stealth"
	self.crojob2_plan_a.stages = {
		"crojob2"
	}
	self.crojob2_plan_a.visible_if_locked = true
	self.crojob2_plan_a.no_mystery = true
	self.crojob2_plan_b = {}
	self.crojob2_plan_b.name_id = "menu_asset_roberts_plan_b"
	self.crojob2_plan_b.texture = "guis/textures/pd2/mission_briefing/assets/crojob/stage_2/assets_crojob_insiderinfo_loud"
	self.crojob2_plan_b.stages = {
		"crojob2"
	}
	self.crojob2_plan_b.visible_if_locked = true
	self.crojob2_plan_b.no_mystery = true
	self.crojob3_plan = {}
	self.crojob3_plan.name_id = "menu_asset_roberts_plan_a"
	self.crojob3_plan.texture = "guis/textures/pd2/mission_briefing/assets/crojob/stage_3/assets_crojob_insiderinfo"
	self.crojob3_plan.stages = {
		"crojob3",
		"crojob3_night"
	}
	self.crojob3_plan.visible_if_locked = true
	self.crojob3_plan.no_mystery = true
	self.dumpsters = {}
	self.dumpsters.name_id = "menu_asset_dumpsters"
	self.dumpsters.texture = "guis/textures/pd2/mission_briefing/assets/carshop/asset_carshop_dumpster"
	self.dumpsters.stages = {
		"cage"
	}
	self.dumpsters.visible_if_locked = true
	self.dumpsters.unlock_desc_id = "menu_asset_dumpsters_desc"
	self.dumpsters.no_mystery = true
	self.dumpsters.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 8)
	self.hox_3_alarm = {}
	self.hox_3_alarm.name_id = "heist_hox_3_alarm"
	self.hox_3_alarm.texture = "guis/textures/pd2/mission_briefing/assets/hox3/asset_hox3_alertbox"
	self.hox_3_alarm.stages = {
		"hox_3"
	}
	self.hox_3_alarm.visible_if_locked = true
	self.hox_3_alarm.no_mystery = true
	self.extra_cutter = {}
	self.extra_cutter.name_id = "menu_asset_extra_cutter"
	self.extra_cutter.texture = "guis/dlcs/dlc_arena/textures/pd2/mission_briefing/assets/asset_arena_metal_cutter"
	self.extra_cutter.stages = {
		"arena"
	}
	self.extra_cutter.visible_if_locked = true
	self.extra_cutter.server_lock = true
	self.extra_cutter.no_mystery = true
	self.extra_cutter.unlock_desc_id = "menu_asset_extra_cutter_desc"
	self.extra_cutter.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 3)
	self.planks = {}
	self.planks.name_id = "menu_asset_planks"
	self.planks.texture = "guis/dlcs/peta/textures/pd2/mission_briefing/assets/asset_barn_planks"
	self.planks.stages = {
		"peta2"
	}
	self.planks.visible_if_locked = true
	self.planks.unlock_desc_id = "menu_asset_planks_desc"
	self.planks.no_mystery = true
	self.planks.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 8)
	self.mad_briefcase = {}
	self.mad_briefcase.name_id = "menu_asset_mad_briefcase"
	self.mad_briefcase.texture = "guis/dlcs/mad/textures/pd2/mission_briefing/assets/mad_briefcase"
	self.mad_briefcase.stages = {
		"mad"
	}
	self.mad_russian_merc_cameras = {}
	self.mad_russian_merc_cameras.name_id = "menu_asset_mad_russian_merc"
	self.mad_russian_merc_cameras.texture = "guis/dlcs/mad/textures/pd2/mission_briefing/assets/mad_russian_merc"
	self.mad_russian_merc_cameras.stages = {
		"mad"
	}
	self.dark_emp = {}
	self.dark_emp.name_id = "menu_asset_dark_emp"
	self.dark_emp.texture = "guis/dlcs/mad/textures/pd2/mission_briefing/assets/dark_emp"
	self.dark_emp.stages = {
		"dark"
	}
	self.dark_drone = {}
	self.dark_drone.name_id = "menu_asset_dark_drone"
	self.dark_drone.texture = "guis/dlcs/mad/textures/pd2/mission_briefing/assets/dark_drone"
	self.dark_drone.stages = {
		"dark"
	}
	self.dark_additional_cameras = {}
	self.dark_additional_cameras.name_id = "menu_asset_dark_additional_cameras"
	self.dark_additional_cameras.texture = "guis/dlcs/mad/textures/pd2/mission_briefing/assets/dark_additional_cameras"
	self.dark_additional_cameras.stages = {
		"dark"
	}
	self.dark_additional_cameras.visible_if_locked = true
	self.dark_additional_cameras.unlock_desc_id = "menu_asset_dark_additional_cameras_desc"
	self.dark_additional_cameras.no_mystery = true
	self.dark_additional_cameras.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 8)
	self.sniper_spot_born = {}
	self.sniper_spot_born.name_id = "menu_asset_sniper_spot_born"
	self.sniper_spot_born.texture = "guis/dlcs/born/textures/pd2/mission_briefing/assets/assets_born_snipernest"
	self.sniper_spot_born.stages = {
		"born"
	}
	self.sniper_spot_born.visible_if_locked = true
	self.sniper_spot_born.unlock_desc_id = "menu_asset_sniper_spot_born_desc"
	self.sniper_spot_born.no_mystery = true
	self.sniper_spot_born.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 7)
	self.flat_chavez = {}
	self.flat_chavez.name_id = "menu_asset_flat_chavez"
	self.flat_chavez.texture = "guis/dlcs/flat/textures/pd2/mission_briefing/assets/flat_chavez"
	self.flat_chavez.stages = {
		"flat"
	}
	self.flat_panic_room_blueprint = {}
	self.flat_panic_room_blueprint.name_id = "menu_asset_flat_panic_room_blueprint"
	self.flat_panic_room_blueprint.texture = "guis/dlcs/flat/textures/pd2/mission_briefing/assets/flat_panic_room_blueprint"
	self.flat_panic_room_blueprint.stages = {
		"flat"
	}
	self.flat_recon_photos = {}
	self.flat_recon_photos.name_id = "menu_asset_recon_photos"
	self.flat_recon_photos.texture = "guis/dlcs/help/textures/pd2/mission_briefing/assets/recon_photos"
	self.flat_recon_photos.stages = {
		"help"
	}
	self.moon_security_camera = {}
	self.moon_security_camera.name_id = "menu_asset_moon_security_camera"
	self.moon_security_camera.texture = "guis/dlcs/moon/textures/pd2/mission_briefing/assets/moon_security_camera"
	self.moon_security_camera.stages = {
		"moon"
	}
	self.moon_mall_pamflet = {}
	self.moon_mall_pamflet.name_id = "menu_asset_moon_mall_pamflet"
	self.moon_mall_pamflet.texture = "guis/dlcs/moon/textures/pd2/mission_briefing/assets/moon_mall_pamflet"
	self.moon_mall_pamflet.stages = {
		"moon"
	}
	self.recon_intel = {}
	self.recon_intel.name_id = "menu_asset_recon_intel"
	self.recon_intel.texture = "guis/dlcs/friend/textures/pd2/mission_briefing/assets/recon_intel"
	self.recon_intel.stages = {
		"friend"
	}
	self.recon_intel.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 1)
	self.recon_intel.no_mystery = true
	self.rope_ladder = {}
	self.rope_ladder.name_id = "menu_asset_rope_ladder"
	self.rope_ladder.unlock_desc_id = "menu_asset_rope_ladder_desc"
	self.rope_ladder.texture = "guis/dlcs/friend/textures/pd2/mission_briefing/assets/rope_ladder"
	self.rope_ladder.stages = {
		"friend"
	}
	self.rope_ladder.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 2)
	self.rope_ladder.no_mystery = true
	self.potential_location = {}
	self.potential_location.name_id = "menu_asset_potential_location"
	self.potential_location.texture = "guis/dlcs/fish/textures/pd2/mission_briefing/assets/potential_location"
	self.potential_location.stages = {
		"fish"
	}
	self.potential_location.no_mystery = true
	self.colored_tags = {}
	self.colored_tags.name_id = "menu_asset_colored_tags"
	self.colored_tags.texture = "guis/dlcs/fish/textures/pd2/mission_briefing/assets/colored_tags"
	self.colored_tags.stages = {
		"fish"
	}
	self.colored_tags.no_mystery = true
	self.laptop = {}
	self.laptop.name_id = "menu_asset_laptop"
	self.laptop.texture = "guis/dlcs/fish/textures/pd2/mission_briefing/assets/laptop"
	self.laptop.stages = {
		"fish"
	}
	self.laptop.no_mystery = true
	self.charon = {}
	self.charon.name_id = "menu_asset_charon"
	self.charon.texture = "guis/dlcs/spa/textures/pd2/mission_briefing/assets/charon"
	self.charon.stages = {
		"spa"
	}
	self.charon.no_mystery = true
	self.location = {}
	self.location.name_id = "menu_asset_location"
	self.location.texture = "guis/dlcs/run/textures/pd2/mission_briefing/assets/location"
	self.location.stages = {
		"run"
	}
	self.location.no_mystery = true
	self.prison_transport_trucks = {}
	self.prison_transport_trucks.name_id = "menu_asset_prison_transport_trucks"
	self.prison_transport_trucks.texture = "guis/dlcs/glace/textures/pd2/mission_briefing/assets/prison_transport_trucks"
	self.prison_transport_trucks.stages = {
		"glace"
	}
	self.prison_transport_trucks.no_mystery = true
	self.asset_sah_ladder = {}
	self.asset_sah_ladder.name_id = "menu_asset_sah_ladder"
	self.asset_sah_ladder.texture = "guis/dlcs/sah/textures/pd2/mission_briefing/assets/asset_sah_ladder_df"
	self.asset_sah_ladder.stages = {
		"sah"
	}
	self.asset_sah_ladder.visible_if_locked = true
	self.asset_sah_ladder.unlock_desc_id = "menu_asset_sah_ladder_desc"
	self.asset_sah_ladder.no_mystery = true
	self.asset_sah_ladder.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_small", 3)
	self.sah_cutter = {}
	self.sah_cutter.name_id = "menu_asset_sah_cutter"
	self.sah_cutter.texture = "guis/dlcs/dlc_arena/textures/pd2/mission_briefing/assets/asset_arena_metal_cutter"
	self.sah_cutter.stages = {
		"sah"
	}
	self.sah_cutter.visible_if_locked = true
	self.sah_cutter.no_mystery = true
	self.sah_cutter.unlock_desc_id = "menu_asset_sah_cutter_desc"
	self.sah_cutter.money_lock = tweak_data:get_value("money_manager", "mission_asset_cost_medium", 3)
end

function AssetsTweakData:_init_debug_assets(tweak_data)
	self.debug_1 = {}
	self.debug_1.name_id = "debug_1"
	self.debug_1.texture = "guis/textures/pd2/blackmarket/icons/armors/level_1"
	self.debug_1.money_lock = 10
	self.debug_1.stages = {
		"safehouse"
	}
	self.debug_1.visible_if_locked = true
	self.debug_2 = {}
	self.debug_2.name_id = "debug_2"
	self.debug_2.texture = "guis/textures/pd2/blackmarket/icons/armors/level_2"
	self.debug_2.stages = {
		"safehouse"
	}
	self.debug_2.money_lock = 20000
	self.debug_3 = {}
	self.debug_3.name_id = "debug_3"
	self.debug_3.texture = "guis/textures/pd2/blackmarket/icons/armors/level_3"
	self.debug_3.stages = {
		"safehouse"
	}
	self.debug_3.money_lock = 30
	self.debug_3.visible_if_locked = false
	self.debug_4 = {}
	self.debug_4.name_id = "debug_4"
	self.debug_4.texture = "guis/textures/pd2/blackmarket/icons/armors/level_4"
	self.debug_4.stages = {
		"safehouse"
	}
	self.debug_4.money_lock = 4000000
	self.debug_4.visible_if_locked = true
	self.debug_5 = {}
	self.debug_5.name_id = "debug_5"
	self.debug_5.texture = "guis/textures/pd2/blackmarket/icons/armors/level_5"
	self.debug_5.stages = {
		"safehouse"
	}
	self.debug_5.money_lock = 50
	self.debug_6 = {}
	self.debug_6.name_id = "debug_6"
	self.debug_6.texture = "guis/textures/pd2/blackmarket/icons/armors/level_6"
	self.debug_6.stages = {
		"safehouse"
	}
	self.debug_6.money_lock = 60000000
	self.debug_6.visible_if_locked = true
	self.debug_7 = {}
	self.debug_7.name_id = "debug_7"
	self.debug_7.texture = "guis/textures/pd2/blackmarket/icons/armors/level_7"
	self.debug_7.stages = {
		"safehouse"
	}
	self.debug_7.money_lock = 700
	self.debug_7.visible_if_locked = true
end

function AssetsTweakData:debug_assets()
	local levels = {}

	for i, level_id in ipairs(tweak_data.levels:get_level_index()) do
		levels[level_id] = 0
	end

	local function f(id)
		if id == "all" then
			for i, d in pairs(levels) do
				levels[i] = levels[i] + 1
			end
		else
			levels[id] = levels[id] + 1
		end
	end

	for id, asset in pairs(self) do
		if id ~= "none" then
			local stages = asset.stages

			if not stages or type(stages) == "string" then
				f(stages)
			else
				for _, lid in ipairs(stages) do
					f(lid)
				end
			end
		end
	end

	local asset_levels = {}

	for i, d in pairs(levels) do
		if d > 0 then
			asset_levels[i] = d
		end
	end

	print(inspect(asset_levels))
end
