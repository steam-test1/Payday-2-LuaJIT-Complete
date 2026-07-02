function TweakData:_init_pd2()
	print("TweakData:_init_pd2()")

	self.hud_players = {}
	self.hud_players.name_font = "fonts/font_small_mf"
	self.hud_players.name_size = 19
	self.hud_players.ammo_font = "fonts/font_large_mf"
	self.hud_players.ammo_size = 24
	self.hud_players.timer_font = "fonts/font_medium_shadow_mf"
	self.hud_players.timer_size = 30
	self.hud_players.timer_flash_size = 50
	self.hud_present = {}
	self.hud_present.title_font = "fonts/font_medium_mf"
	self.hud_present.title_size = 28
	self.hud_present.text_font = "fonts/font_medium_mf"
	self.hud_present.text_size = 28
	self.hud_mask_off = {}
	self.hud_mask_off.text_size = 28
	self.hud_mask_off.text_font = "fonts/font_medium_mf"
	self.hud_stats = {}
	self.hud_stats.objectives_font = "fonts/font_medium_mf"
	self.hud_stats.objective_desc_font = "fonts/font_medium_mf"
	self.hud_stats.objectives_title_size = 28
	self.hud_stats.objectives_size = 24
	self.hud_stats.loot_size = 24
	self.hud_stats.loot_title_size = 28
	self.hud_stats.day_description_size = 22
	self.hud_stats.potential_xp_color = Color(0, 0.6666666666666666, 1)
	self.hud_corner = {}
	self.hud_corner.assault_font = "fonts/font_medium_mf"
	self.hud_corner.assault_size = 24
	self.hud_corner.noreturn_size = 24
	self.hud_corner.numhostages_size = 24
	self.hud_downed = {}
	self.hud_downed.timer_message_size = 24
	self.hud_custody = {}
	self.hud_custody.custody_font = "fonts/font_medium_mf"
	self.hud_custody.custody_font_large = "fonts/font_large_mf"
	self.hud_custody.font_size = 28
	self.hud_custody.small_font_size = 24
	self.hud_color_blind_assist = {}
	self.hud_color_blind_assist.health = Color("FF7F00")
	self.hud_color_blind_assist.armor = Color("00AAFF")
	self.hud_icons.bag_icon = {
		texture = "guis/textures/pd2/hud_tabs",
		texture_rect = {
			2,
			34,
			20,
			17
		}
	}
	self.hud_icons.pd2_mask_1 = {
		texture = "guis/textures/pd2/masks",
		texture_rect = {
			0,
			0,
			64,
			64
		}
	}
	self.hud_icons.pd2_mask_2 = {
		texture = "guis/textures/pd2/masks",
		texture_rect = {
			64,
			0,
			64,
			64
		}
	}
	self.hud_icons.pd2_mask_3 = {
		texture = "guis/textures/pd2/masks",
		texture_rect = {
			64,
			64,
			64,
			64
		}
	}
	self.hud_icons.pd2_mask_4 = {
		texture = "guis/textures/pd2/masks",
		texture_rect = {
			0,
			64,
			64,
			64
		}
	}
	self.hud_icons.equipment_bg = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			64,
			32,
			32,
			32
		}
	}
	self.hud_icons.equipment_cable_ties = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.mugshot_swansong = {
		texture = "guis/textures/pd2/hud_swansong_icon",
		texture_rect = {
			0,
			0,
			64,
			64
		}
	}
	self.hud_icons.equipment_ammo_bag = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			0,
			32,
			32,
			32
		}
	}
	self.hud_icons.equipment_doctor_bag = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			96,
			0,
			32,
			32
		}
	}
	self.hud_icons.equipment_sentry = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			32,
			32,
			32,
			32
		}
	}
	self.hud_icons.equipment_sentry_silent = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			96,
			96,
			32,
			32
		}
	}
	self.hud_icons.equipment_trip_mine = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			64,
			0,
			32,
			32
		}
	}
	self.hud_icons.equipment_ecm_jammer = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			32,
			0,
			32,
			32
		}
	}
	self.hud_icons.equipment_armor_kit = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			32,
			64,
			32,
			32
		}
	}
	self.hud_icons.equipment_first_aid_kit = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			0,
			64,
			32,
			32
		}
	}
	self.hud_icons.equipment_bodybags_bag = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			96,
			32,
			32,
			32
		}
	}
	self.hud_icons.equipment_grenade_crate = {
		texture = "guis/dlcs/mxm/textures/pd2/ordnance_bag",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.equipment_spy_camera = {
		texture = "guis/dlcs/esp/textures/pd2/spy_camera",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.equipment_generic_key = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			32,
			64,
			32,
			32
		}
	}
	self.hud_icons.equipment_chavez_key = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			32,
			64,
			32,
			32
		}
	}
	self.hud_icons.equipment_bank_manager_key = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			32,
			0,
			32,
			32
		}
	}
	self.hud_icons.equipment_drill = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.equipment_drillfix = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			64,
			32,
			32
		}
	}
	self.hud_icons.equipment_thermite = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			64,
			64,
			32,
			32
		}
	}
	self.hud_icons.equipment_c4 = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			0,
			32,
			32
		}
	}
	self.hud_icons.equipment_saw = {
		texture = "guis/textures/pd2/mission_equipment",
		texture_rect = {
			42,
			84,
			42,
			42
		}
	}
	self.hud_icons.equipment_cutter = {
		texture = "guis/textures/pd2/mission_equipment",
		texture_rect = {
			42,
			84,
			42,
			42
		}
	}
	self.hud_icons.equipment_gasoline = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			64,
			0,
			32,
			32
		}
	}
	self.hud_icons.equipment_planks = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			32,
			32,
			32
		}
	}
	self.hud_icons.equipment_muriatic_acid = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			32,
			32,
			32,
			32
		}
	}
	self.hud_icons.equipment_hydrogen_chloride = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			64,
			32,
			32,
			32
		}
	}
	self.hud_icons.equipment_caustic_soda = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			32,
			32,
			32
		}
	}
	self.hud_icons.equipment_crowbar = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			64,
			32,
			32
		}
	}
	self.hud_icons.equipment_barcode = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			96,
			32,
			32
		}
	}
	self.hud_icons.equipment_glasscutter = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			64,
			128,
			32,
			32
		}
	}
	self.hud_icons.equipment_body_bag = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			96,
			32,
			32,
			32
		}
	}
	self.hud_icons.ak = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			0,
			0,
			64,
			64
		}
	}
	self.hud_icons.hk21 = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			64,
			64,
			64,
			64
		}
	}
	self.hud_icons.mac11 = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			64,
			0,
			64,
			64
		}
	}
	self.hud_icons.glock = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			0,
			64,
			64,
			64
		}
	}
	self.hud_icons.beretta92 = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			128,
			128,
			64,
			64
		}
	}
	self.hud_icons.m4 = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			128,
			0,
			64,
			64
		}
	}
	self.hud_icons.r870_shotgun = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			64,
			128,
			64,
			64
		}
	}
	self.hud_icons.mp5 = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			0,
			192,
			64,
			64
		}
	}
	self.hud_icons.c45 = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			192,
			0,
			64,
			64
		}
	}
	self.hud_icons.raging_bull = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			0,
			128,
			64,
			64
		}
	}
	self.hud_icons.mossberg = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			192,
			64,
			64,
			64
		}
	}
	self.hud_icons.m14 = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			192,
			128,
			64,
			64
		}
	}
	self.hud_icons.m79 = {
		texture = "guis/textures/pd2/weapons",
		texture_rect = {
			128,
			64,
			64,
			64
		}
	}
	self.hud_icons.risk_pd = {
		texture = "guis/textures/pd2/hud_difficultymarkers_2",
		texture_rect = {
			90,
			0,
			30,
			30
		}
	}
	self.hud_icons.risk_swat = {
		texture = "guis/textures/pd2/hud_difficultymarkers_2",
		texture_rect = {
			0,
			0,
			30,
			30
		}
	}
	self.hud_icons.risk_fbi = {
		texture = "guis/textures/pd2/hud_difficultymarkers_2",
		texture_rect = {
			30,
			0,
			30,
			30
		}
	}
	self.hud_icons.risk_death_squad = {
		texture = "guis/textures/pd2/hud_difficultymarkers_2",
		texture_rect = {
			60,
			0,
			30,
			30
		}
	}
	self.hud_icons.risk_easy_wish = {
		texture = "guis/textures/pd2/hud_difficultymarkers_2",
		texture_rect = {
			90,
			0,
			30,
			30
		}
	}
	self.hud_icons.risk_murder_squad = {
		texture = "guis/textures/pd2/hud_difficultymarkers_2",
		texture_rect = {
			0,
			32,
			30,
			30
		}
	}
	self.hud_icons.risk_sm_wish = {
		texture = "guis/textures/pd2/hud_difficultymarkers_2",
		texture_rect = {
			30,
			32,
			30,
			30
		}
	}
	self.hud_icons.frag_grenade = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			64,
			32,
			32,
			32
		}
	}
	self.hud_icons.molotov_grenade = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			64,
			64,
			32,
			32
		}
	}
	self.hud_icons.dynamite_grenade = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			96,
			64,
			32,
			32
		}
	}
	self.hud_icons.four_projectile = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			0,
			96,
			32,
			32
		}
	}
	self.hud_icons.ace_projectile = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			32,
			96,
			32,
			32
		}
	}
	self.hud_icons.jav_projectile = {
		texture = "guis/textures/pd2/equipment",
		texture_rect = {
			64,
			96,
			32,
			32
		}
	}
	self.hud_icons.throwing_axe = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.concussion_grenade = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			32,
			0,
			32,
			32
		}
	}
	self.hud_icons.hobby_knife = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			64,
			0,
			32,
			32
		}
	}
	self.hud_icons.chico_injector = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			96,
			0,
			32,
			32
		}
	}
	self.hud_icons.fir_grenade = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			0,
			32,
			32,
			32
		}
	}
	self.hud_icons.smoke_screen_grenade = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			32,
			32,
			32,
			32
		}
	}
	self.hud_icons.dada_com = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			96,
			32,
			32,
			32
		}
	}
	self.hud_icons.damage_control = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			0,
			64,
			32,
			32
		}
	}
	self.hud_icons.tag_team = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			32,
			64,
			32,
			32
		}
	}
	self.hud_icons.minions_converted = {
		texture = "guis/textures/pd2/skilltree/icons_atlas",
		texture_rect = {
			384,
			512,
			64,
			64
		}
	}
	self.hud_icons.pagers_used = {
		texture = "guis/textures/pd2/pagers_used",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.electric_grenade = {
		texture = "guis/dlcs/sawp/textures/pd2/equipment_sawp",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.copr_ability = {
		texture = "guis/dlcs/copr/textures/pd2/hud_copr_ability",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.poison_gas_grenade = {
		texture = "guis/dlcs/pxp1/textures/pd2/hud_poison_gas_grenade",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.sticky_grenade = {
		texture = "guis/dlcs/mxm/textures/pd2/sticky_grenade",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.hud_icons.none_icon = {
		texture = "guis/textures/pd2/equipment_02",
		texture_rect = {
			64,
			32,
			32,
			32
		}
	}
	self.hud_icons.laser_watch = {
		texture = "guis/dlcs/esp/textures/pd2/equipment",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}

	self:_setup_point_of_no_returns()
	self:_setup_scene_poses()
	self:_setup_scene_pose_items()
end

function TweakData:_setup_point_of_no_returns()
	self.point_of_no_returns = {}
	self.point_of_no_returns.noreturn = {}
	self.point_of_no_returns.noreturn.texture = "guis/textures/pd2/hud_icon_noreturnbox"
	self.point_of_no_returns.noreturn.texture_rect = {
		0,
		0,
		32,
		32
	}
	self.point_of_no_returns.noreturn.color = Color(1, 1, 0, 0)
	self.point_of_no_returns.noreturn.timer_flash_color = Color(1, 1, 0.8, 0.2)

	if _G.IS_VR then
		self.point_of_no_returns.noreturn.text_id = "hud_assault_point_no_return"
	else
		self.point_of_no_returns.noreturn.text_id = "hud_assault_point_no_return_in"
	end

	self.point_of_no_returns.rescue_vlad = {}
	self.point_of_no_returns.rescue_vlad.texture = "guis/textures/pd2/hud_icon_noreturnbox"
	self.point_of_no_returns.rescue_vlad.texture_rect = {
		0,
		0,
		32,
		32
	}
	self.point_of_no_returns.rescue_vlad.color = Color(1, 1, 0, 0)
	self.point_of_no_returns.rescue_vlad.timer_flash_color = Color(1, 1, 0.8, 0.2)
	self.point_of_no_returns.rescue_vlad.attention_color = Color(1, 1, 1, 1)
	self.point_of_no_returns.rescue_vlad.scale_box = true

	if _G.IS_VR then
		self.point_of_no_returns.rescue_vlad.text_id = "hud_assault_point_no_vlad"
	else
		self.point_of_no_returns.rescue_vlad.text_id = "hud_assault_point_no_vlad_in"
	end

	self.point_of_no_returns.go_loud = {}
	self.point_of_no_returns.go_loud.text_id = "hud_assault_pnr_goloud"
	self.point_of_no_returns.go_loud.texture = "guis/textures/pd2/hud_icon_noreturnbox"
	self.point_of_no_returns.go_loud.texture_rect = {
		0,
		0,
		32,
		32
	}
	self.point_of_no_returns.go_loud.color = Color(1, 1, 0, 0)
	self.point_of_no_returns.go_loud.timer_flash_color = Color(1, 1, 0.8, 0.2)
	self.point_of_no_returns.go_loud.attention_color = Color(1, 1, 1, 1)
	self.point_of_no_returns.go_loud.scale_box = true

	if _G.IS_VR then
		self.point_of_no_returns.go_loud.text_id = "hud_assault_pnr_goloud"
	else
		self.point_of_no_returns.go_loud.text_id = "hud_assault_pnr_goloud_in"
	end

	self.point_of_no_returns.destroy_pipeline = {}
	self.point_of_no_returns.destroy_pipeline.text_id = "hud_assault_pnr_destroy_pipeline"
	self.point_of_no_returns.destroy_pipeline.texture = "guis/textures/pd2/hud_icon_noreturnbox"
	self.point_of_no_returns.destroy_pipeline.texture_rect = {
		0,
		0,
		32,
		32
	}
	self.point_of_no_returns.destroy_pipeline.color = Color(1, 1, 0, 0)
	self.point_of_no_returns.destroy_pipeline.timer_flash_color = Color(1, 1, 0.8, 0.2)
	self.point_of_no_returns.destroy_pipeline.attention_color = Color(1, 1, 1, 1)
	self.point_of_no_returns.destroy_pipeline.scale_box = true

	if _G.IS_VR then
		self.point_of_no_returns.destroy_pipeline.text_id = "hud_assault_pnr_destroy_pipeline"
	else
		self.point_of_no_returns.destroy_pipeline.text_id = "hud_assault_pnr_destroy_pipeline_in"
	end

	self.point_of_no_returns.reposition_locomotive = {}
	self.point_of_no_returns.reposition_locomotive.text_id = "hud_assault_pnr_reposition_locomotive"
	self.point_of_no_returns.reposition_locomotive.texture = "guis/textures/pd2/hud_icon_noreturnbox"
	self.point_of_no_returns.reposition_locomotive.texture_rect = {
		0,
		0,
		32,
		32
	}
	self.point_of_no_returns.reposition_locomotive.color = Color(1, 1, 0, 0)
	self.point_of_no_returns.reposition_locomotive.timer_flash_color = Color(1, 1, 0.8, 0.2)
	self.point_of_no_returns.reposition_locomotive.attention_color = Color(1, 1, 1, 1)
	self.point_of_no_returns.reposition_locomotive.scale_box = true

	if _G.IS_VR then
		self.point_of_no_returns.reposition_locomotive.text_id = "hud_assault_pnr_reposition_locomotive"
	else
		self.point_of_no_returns.reposition_locomotive.text_id = "hud_assault_pnr_reposition_locomotive_in"
	end

	self.point_of_no_returns.oil_rig_will_explode = {}
	self.point_of_no_returns.oil_rig_will_explode.text_id = "hud_assault_pnr_oil_rig_will_explode"
	self.point_of_no_returns.oil_rig_will_explode.texture = "guis/textures/pd2/hud_icon_noreturnbox"
	self.point_of_no_returns.oil_rig_will_explode.texture_rect = {
		0,
		0,
		32,
		32
	}
	self.point_of_no_returns.oil_rig_will_explode.color = Color(1, 1, 0, 0)
	self.point_of_no_returns.oil_rig_will_explode.timer_flash_color = Color(1, 1, 0.8, 0.2)
	self.point_of_no_returns.oil_rig_will_explode.attention_color = Color(1, 1, 1, 1)
	self.point_of_no_returns.oil_rig_will_explode.scale_box = true

	if _G.IS_VR then
		self.point_of_no_returns.oil_rig_will_explode.text_id = "hud_assault_pnr_oil_rig_will_explode"
	else
		self.point_of_no_returns.oil_rig_will_explode.text_id = "hud_assault_pnr_oil_rig_will_explode_in"
	end
end

function TweakData:get_scene_pose_items(scene_pose)
	local items = self.scene_pose_items[scene_pose] or {
		"primary",
		"secondary"
	}

	return {
		a_weapon_right_front = items[1],
		a_weapon_left_front = items[2]
	}
end

function TweakData:get_scene_pose(scene, pose_category, ...)
	local poses
	local scene_poses = self.scene_poses[scene]

	if scene_poses then
		local possible_ids = {
			...
		}
		local i = 1

		while not poses and possible_ids[i] do
			poses = scene_poses[possible_ids[i]]
			i = i + 1
		end
	end

	poses = poses or scene_poses

	if type(poses[1]) ~= "string" then
		poses = poses[pose_category]
	end

	poses = poses or scene_poses.generic or self.scene_poses.generic

	local pose = poses[math.random(#poses)]
	local required_poses = poses.required_pose and table.list_copy(poses)

	return pose, required_poses
end

function TweakData:_setup_scene_pose_items()
	self.scene_pose_items = {}
	self.scene_pose_items.husk1 = {}
	self.scene_pose_items.husk2 = {}
	self.scene_pose_items.husk3 = {}
	self.scene_pose_items.husk4 = {}
	self.scene_pose_items.lobby_generic_idle4 = {}
	self.scene_pose_items.husk_minigun = {
		"primary"
	}
	self.scene_pose_items.lobby_generic_idle1 = {
		"primary"
	}
	self.scene_pose_items.lobby_generic_idle2 = {
		"primary"
	}
	self.scene_pose_items.lobby_generic_idle3 = {
		"primary"
	}
	self.scene_pose_items.husk_bow1 = {
		"primary"
	}
	self.scene_pose_items.husk_bow2 = {
		"primary"
	}
	self.scene_pose_items.husk_card1 = {
		nil,
		"infamy"
	}
	self.scene_pose_items.husk_card2 = {
		nil,
		"infamy"
	}
	self.scene_pose_items.husk_card3 = {
		nil,
		"infamy"
	}
	self.scene_pose_items.husk_card4 = {
		nil,
		"infamy"
	}
	self.scene_pose_items.husk_ray = {
		nil,
		"secondary"
	}
	self.scene_pose_items.husk_rifle4 = {
		"primary",
		"secondary"
	}
	self.scene_pose_items.husk_minigun_2 = {
		"primary"
	}
	self.scene_pose_items.husk_bessy = {
		"primary"
	}
	self.scene_pose_items.cvc_var1 = {}
	self.scene_pose_items.cvc_var2 = {}
	self.scene_pose_items.cvc_var3 = {}
	self.scene_pose_items.husk_akimbo1 = {
		"primary",
		"secondary"
	}
	self.scene_pose_items.husk_akimbo2 = {
		"primary",
		"secondary"
	}
	self.scene_pose_items.husk_akimbo_x54 = {
		"primary",
		"secondary"
	}
end

function TweakData:_setup_scene_poses()
	self.scene_poses = {}
	self.scene_poses.generic = {
		"husk_generic1",
		"husk_generic2",
		"husk_generic3",
		"husk_generic4"
	}
	self.scene_poses.template = {}
	self.scene_poses.template.generic = {
		"husk_generic1",
		"husk_generic2",
		"husk_generic3",
		"husk_generic4"
	}
	self.scene_poses.weapon = {}
	self.scene_poses.weapon.assault_rifle = {
		"husk_rifle1",
		"husk_rifle2"
	}
	self.scene_poses.weapon.pistol = {
		"husk_pistol1"
	}
	self.scene_poses.weapon.saw = {
		"husk_saw1"
	}
	self.scene_poses.weapon.shotgun = {
		primary = {
			"husk_shotgun1"
		}
	}
	self.scene_poses.weapon.snp = {
		"husk_bullpup"
	}
	self.scene_poses.weapon.lmg = {
		"husk_lmg"
	}
	self.scene_poses.weapon.bow = {
		"husk_bow1",
		"husk_bow2",
		required_pose = true
	}
	self.scene_poses.weapon.akimbo = {
		"husk_akimbo1",
		"husk_akimbo2"
	}
	self.scene_poses.weapon.infamous = {
		"husk_infamous1",
		"husk_infamous3",
		"husk_infamous4"
	}
	self.scene_poses.weapon.x_type54 = {
		"husk_akimbo_x54",
		required_pose = true
	}
	self.scene_poses.weapon.m95 = {
		"husk_m95"
	}
	self.scene_poses.weapon.r93 = {
		"husk_r93"
	}
	self.scene_poses.weapon.huntsman = {
		"husk_mosconi",
		"husk_bullpup"
	}
	self.scene_poses.weapon.gre_m79 = {
		"husk_mosconi"
	}
	self.scene_poses.weapon.ksg = {
		"husk_mosconi",
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.m249 = {
		"husk_m249"
	}
	self.scene_poses.weapon.m134 = {
		"husk_minigun",
		required_pose = true
	}
	self.scene_poses.weapon.famas = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.aug = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.wa2000 = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.l85a2 = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.vhs = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.flamethrower_mk2 = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.desertfox = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.corgi = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.komodo = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.x_basset = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.arbiter = {
		"husk_bullpup",
		required_pose = true
	}
	self.scene_poses.weapon.ray = {
		"husk_ray",
		required_pose = true
	}
	self.scene_poses.weapon.ultima = {
		"husk_generic1",
		required_pose = true
	}
	self.scene_poses.weapon.scout = {
		"husk_rifle4",
		required_pose = true
	}
	self.scene_poses.weapon.hk51b = {
		"husk_rifle3",
		required_pose = true
	}
	self.scene_poses.weapon.hailstorm = {
		"husk_rifle5",
		required_pose = true
	}
	self.scene_poses.weapon.sko12 = {
		"husk_rifle1",
		required_pose = true
	}
	self.scene_poses.weapon.hcar = {
		"husk_rifle1",
		required_pose = true
	}
	self.scene_poses.weapon.kacchainsaw = {
		"husk_minigun_2",
		required_pose = true
	}
	self.scene_poses.weapon.bessy = {
		"husk_bessy",
		required_pose = true
	}
	self.scene_poses.infamy = {}
	self.scene_poses.infamy.generic = {
		{
			"husk_card1"
		},
		{
			"husk_card2"
		},
		{
			"husk_card3"
		},
		{
			"husk_card4"
		},
		required_pose = true
	}
	self.scene_poses.armor = {}
	self.scene_poses.armor.generic = {
		"cvc_var1",
		"cvc_var2"
	}
	self.scene_poses.armor.level_1 = {
		"suit",
		"suit"
	}
	self.scene_poses.armor.level_2 = {
		"lbv",
		"lbv"
	}
	self.scene_poses.armor.level_3 = {
		"bv",
		"bv"
	}
	self.scene_poses.armor.level_4 = {
		"hbv",
		"hbv"
	}
	self.scene_poses.armor.level_5 = {
		"fj",
		"fj"
	}
	self.scene_poses.armor.level_6 = {
		"ctv",
		"ctv"
	}
	self.scene_poses.armor.level_7 = {
		"ictv",
		"ictv"
	}
	self.scene_poses.player_style = {}
	self.scene_poses.player_style.generic = {
		"suit_generic1",
		"suit_generic2",
		"suit_generic3",
		"suit_generic4",
		"suit_generic5",
		"suit_generic6",
		"suit_generic7"
	}
	self.scene_poses.player_style.sneak_suit = {
		"sneak",
		"sneak"
	}
	self.scene_poses.player_style.scrub = {
		"doctor",
		"doctor"
	}
	self.scene_poses.player_style.raincoat = {
		"rain",
		"rain"
	}
	self.scene_poses.player_style.murky_suit = {
		"military",
		"military"
	}
	self.scene_poses.player_style.tux = {
		"tuxedo",
		"tuxedo"
	}
	self.scene_poses.player_style.winter_suit = {
		"winter",
		"winter"
	}
	self.scene_poses.player_style.jumpsuit = {
		"jump",
		"jump"
	}
	self.scene_poses.player_style.clown = {
		"clown",
		"clown"
	}
	self.scene_poses.player_style.peacoat = {
		"peacoat",
		"peacoat"
	}
	self.scene_poses.player_style.miami = {
		"italian",
		"italian"
	}
	self.scene_poses.player_style.jail = {
		"standard_suit",
		"standard_suit"
	}
	self.scene_poses.player_style.poolrepair = {
		"pool",
		"pool"
	}
	self.scene_environments = {}
	self.scene_environments.standard = {
		angle = 0,
		color_grading = "color_matrix",
		environment = "environments/env_menu/env_menu"
	}
	self.scene_environments.safe = {
		angle = -135,
		color_grading = "color_off",
		environment = "environments/pd2_cash/env_cash_01"
	}
	self.scene_environments.crafting = {
		angle = -135,
		color_grading = "color_off",
		environment = "environments/pd2_cash/env_cash_02"
	}
end
