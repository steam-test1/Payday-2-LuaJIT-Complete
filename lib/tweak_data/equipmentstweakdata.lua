EquipmentsTweakData = EquipmentsTweakData or class()

function EquipmentsTweakData:init()
	self.sentry_id_strings = {
		Idstring("units/payday2/equipment/gen_equipment_sentry/gen_equipment_sentry"),
		Idstring("units/payday2/equipment/gen_equipment_sentry/gen_equipment_sentry_silent")
	}
	self.trip_mine = {
		deploy_time = 2,
		description_id = "des_trip_mine",
		dummy_unit = "units/payday2/equipment/gen_equipment_tripmine/gen_equipment_tripmine_dummy",
		icon = "equipment_trip_mine",
		text_id = "debug_trip_mine",
		use_function_name = "use_trip_mine",
		visual_object = "g_toolbag",
		quantity = {
			3,
			3
		},
		upgrade_deploy_time_multiplier = {
			category = "player",
			upgrade = "trip_mine_deploy_time_multiplier"
		},
		upgrade_name = {
			"trip_mine",
			"shape_charge"
		}
	}
	self.ammo_bag = {
		deploy_time = 2,
		description_id = "des_ammo_bag",
		dummy_unit = "units/payday2/equipment/gen_equipment_ammobag/gen_equipment_ammobag_dummy_unit",
		icon = "equipment_ammo_bag",
		text_id = "debug_ammo_bag",
		use_function_name = "use_ammo_bag",
		visual_object = "g_ammobag",
		quantity = {
			1
		}
	}
	self.doctor_bag = {
		deploy_time = 2,
		description_id = "des_doctor_bag",
		dummy_unit = "units/payday2/equipment/gen_equipment_medicbag/gen_equipment_medicbag_dummy_unit",
		icon = "equipment_doctor_bag",
		text_id = "debug_doctor_bag",
		use_function_name = "use_doctor_bag",
		visual_object = "g_medicbag",
		quantity = {
			1
		},
		upgrade_deploy_time_multiplier = {
			category = "first_aid_kit",
			upgrade = "deploy_time_multiplier"
		}
	}
	self.flash_grenade = {
		action_timer = 2,
		icon = "equipment_ammo_bag",
		use_function_name = "use_flash_grenade"
	}
	self.smoke_grenade = {
		action_timer = 2,
		icon = "equipment_ammo_bag",
		use_function_name = "use_smoke_grenade"
	}
	self.frag_grenade = {
		action_timer = 2,
		icon = "equipment_ammo_bag",
		use_function_name = "use_frag_grenade"
	}
	self.sentry_gun = {
		ammo_cost = 0.7,
		deploy_time = 1,
		description_id = "des_sentry_gun",
		dummy_unit = "units/payday2/equipment/gen_equipment_sentry/gen_equipment_sentry_dummy",
		icon = "equipment_sentry",
		min_ammo_cost = 0.8,
		text_id = "debug_sentry_gun",
		unit = 1,
		use_function_name = "use_sentry_gun",
		visual_object = "g_sentrybag",
		quantity = {
			1
		},
		upgrade_deploy_time_multiplier = {
			category = "player",
			upgrade = "sentry_gun_deploy_time_multiplier"
		}
	}
	self.sentry_gun_silent = {
		ammo_cost = 0.46,
		deploy_time = 1,
		description_id = "des_sentry_gun",
		dummy_unit = "units/payday2/equipment/gen_equipment_sentry/gen_equipment_sentry_dummy",
		icon = "equipment_sentry_silent",
		min_ammo_cost = 0.33,
		text_id = "debug_sentry_gun",
		unit = 2,
		use_function_name = "use_sentry_gun",
		visual_object = "g_sentrybag",
		quantity = {
			1
		},
		upgrade_deploy_time_multiplier = {
			category = "player",
			upgrade = "sentry_gun_deploy_time_multiplier"
		},
		upgrade_name = {
			"sentry_gun"
		}
	}
	self.ecm_jammer = {
		deploy_time = 2,
		description_id = "des_ecm_jammer",
		dummy_unit = "units/payday2/equipment/gen_equipment_jammer/gen_equipment_jammer_dummy",
		icon = "equipment_ecm_jammer",
		text_id = "debug_equipment_ecm_jammer",
		use_function_name = "use_ecm_jammer",
		visual_object = "g_toolbag",
		quantity = {
			1
		}
	}
	self.armor_kit = {
		action_timer = 2,
		deploy_time = 2,
		deploying_text_id = "hud_equipment_equipping_armor_kit",
		description_id = "des_armor_kit",
		dropin_penalty_function_name = "use_armor_kit_dropin_penalty",
		icon = "equipment_armor_kit",
		limit_movement = true,
		on_use_callback = "on_use_armor_bag",
		sound_done = "bar_armor_finished",
		sound_interupt = "bar_armor_cancel",
		sound_start = "bar_armor",
		text_id = "debug_equipment_armor_kit",
		use_function_name = "use_armor_kit",
		visual_object = "g_armorbag",
		quantity = {
			1
		}
	}
	self.first_aid_kit = {
		deploy_time = 1,
		description_id = "des_first_aid_kit",
		dummy_unit = "units/pd2_dlc_old_hoxton/equipment/gen_equipment_first_aid_kit/gen_equipment_first_aid_kit_dummy",
		icon = "equipment_first_aid_kit",
		text_id = "debug_equipment_first_aid_kit",
		use_function_name = "use_first_aid_kit",
		visual_object = "g_firstaidbag",
		quantity = {
			4
		},
		upgrade_deploy_time_multiplier = {
			category = "first_aid_kit",
			upgrade = "deploy_time_multiplier"
		}
	}
	self.bodybags_bag = {
		deploy_time = 2,
		description_id = "des_bodybags_bag",
		dummy_unit = "units/payday2/equipment/gen_equipment_bodybags_bag/gen_equipment_bodybags_bag_dummy",
		icon = "equipment_bodybags_bag",
		text_id = "debug_equipment_bodybags_bag",
		use_function_name = "use_bodybags_bag",
		visual_object = "g_bodybagsbag",
		quantity = {
			1
		},
		upgrade_deploy_time_multiplier = {
			category = "player",
			upgrade = "bodybags_bag_deploy_time_multiplier"
		}
	}
	self.grenade_crate = {
		deploy_time = 2,
		description_id = "des_ammo_bag",
		dummy_unit = "units/pd2_dlc_mxm/equipment/gen_equipment_grenade_crate/gen_equipment_grenade_crate_dummy",
		icon = "equipment_grenade_crate",
		text_id = "debug_equipment_grenade_crate",
		use_function_name = "use_grenade_crate",
		visual_style = "throwables_bag",
		quantity = {
			1
		}
	}
	self.spy_camera = {
		access_channel = "spy_cameras",
		deploy_time = 0.5,
		description_id = "des_ammo_bag",
		dummy_unit = "units/pd2_dlc_esp/equipment/esp_equipment_spy_camera/esp_equipment_spy_camera_dummy",
		icon = "equipment_spy_camera",
		pitch_limit = 12,
		text_id = "bm_equipment_spy_camera",
		use_function_name = "use_spy_camera",
		visual_object = "g_toolbag",
		yaw_limit = 14,
		quantity = {
			2
		},
		deploy_check_settings = {
			block_ray_tolerance = 20,
			block_ray_type = "bag",
			radius = 12
		}
	}
	self.specials = {}
	self.specials.cable_tie = {
		icon = "equipment_cable_ties",
		max_quantity = 10,
		quantity = 2,
		text_id = "debug_equipment_cable_tie",
		extra_quantity = {
			category = "extra_cable_tie",
			equipped_upgrade = "extra_cable_tie",
			upgrade = "quantity"
		}
	}
	self.specials.extra_cable_tie = {
		description_id = "des_extra_cable_tie",
		icon = "equipment_extra_cable_ties",
		text_id = "debug_equipment_extra_cable_tie"
	}
	self.specials.body_armor = {
		description_id = "des_body_armor",
		icon = "equipment_armor",
		text_id = "debug_body_armor"
	}
	self.specials.thick_skin = {
		description_id = "des_thick_skin",
		icon = "equipment_thick_skin",
		text_id = "debug_thick_skin"
	}
	self.specials.bleed_out_increase = {
		description_id = "des_bleed_out_increase",
		icon = "equipment_bleed_out",
		text_id = "debug_equipment_bleed_out"
	}
	self.specials.intimidation = {
		description_id = "des_intimidation",
		icon = "interaction_intimidate",
		text_id = "debug_equipment_initimidation"
	}
	self.specials.extra_start_out_ammo = {
		description_id = "des_extra_start_out_ammo",
		icon = "equipment_extra_start_out_ammo",
		text_id = "debug_equipment_extra_start_out_ammo"
	}
	self.specials.toolset = {
		description_id = "des_toolset",
		icon = "equipment_mill_tool",
		text_id = "debug_toolset"
	}
	self.specials.bank_manager_key = {
		action_message = "bank_manager_key_obtained",
		icon = "equipment_bank_manager_key",
		sync_possession = true,
		text_id = "hud_int_equipment_pickup_keycard",
		transfer_quantity = 4
	}
	self.specials.president_key = {
		action_message = "bank_manager_key_obtained",
		icon = "equipment_bank_manager_key",
		sync_possession = true,
		text_id = "hud_int_equipment_pickup_presidential_keycard",
		transfer_quantity = 4
	}
	self.specials.mayan_gold_bar = {
		action_message = "mayan_gold",
		icon = "equipment_mayan_gold",
		sync_possession = true,
		text_id = "hud_int_equipment_mayan_gold_bar",
		transfer_quantity = 4
	}
	self.specials.help_keycard = {
		action_message = "bank_manager_key_obtained",
		avoid_tranfer = true,
		icon = "equipment_bank_manager_key",
		sync_possession = true,
		text_id = "hud_int_equipment_pickup_keycard"
	}
	self.specials.c_keys = {
		icon = "equipment_generic_key",
		sync_possession = true,
		text_id = "hud_int_equipment_c_keys"
	}
	self.specials.keychain = {
		icon = "equipment_key_chain",
		sync_possession = true,
		text_id = "hud_int_equipment_pickup_keychain"
	}
	self.specials.chavez_key = {
		action_message = "chavez_key_obtained",
		icon = "equipment_chavez_key",
		sync_possession = true,
		text_id = "hud_int_equipment_chavez_keys"
	}
	self.specials.drill = {
		action_message = "drill_obtained",
		icon = "equipment_drill",
		sync_possession = true,
		text_id = "debug_equipment_drill"
	}
	self.specials.lance = {
		icon = "equipment_drill",
		sync_possession = true,
		text_id = "hud_equipment_lance"
	}
	self.specials.lance_part = {
		icon = "equipment_drillfix",
		sync_possession = true,
		text_id = "hud_equipment_lance_part",
		transfer_quantity = 4
	}
	self.specials.glass_cutter = {
		icon = "equipment_cutter",
		sync_possession = true,
		text_id = "debug_equipment_glass_cutter"
	}
	self.specials.saw = {
		icon = "pd2_generic_saw",
		sync_possession = true,
		text_id = "hud_equipment_saw"
	}
	self.specials.saw_blade = {
		icon = "equipment_saw",
		sync_possession = true,
		text_id = "hud_equipment_saw_blade"
	}
	self.specials.money_bag = {
		icon = "equipment_money_bag",
		text_id = "debug_equipment_money_bag"
	}
	self.specials.server = {
		icon = "equipment_stash_server",
		sync_possession = true,
		text_id = "debug_equipment_stash_server"
	}
	self.specials.planks = {
		icon = "equipment_planks",
		sync_possession = true,
		text_id = "debug_equipment_stash_planks",
		transfer_quantity = 4
	}
	self.specials.boards = {
		icon = "equipment_planks",
		sync_possession = true,
		text_id = "hud_equipment_boards",
		transfer_quantity = 4
	}
	self.specials.gold_bag_equip = {
		icon = "equipment_gold",
		sync_possession = true,
		text_id = "debug_equipment_gold_bag"
	}
	self.specials.thermite = {
		action_message = "thermite_obtained",
		icon = "equipment_thermite",
		sync_possession = true,
		text_id = "hud_equipment_thermite"
	}
	self.specials.thermite_paste = {
		icon = "equipment_thermite",
		sync_possession = true,
		text_id = "hud_equipment_thermite_paste",
		transfer_quantity = 4
	}
	self.specials.gas = {
		action_message = "gas_obtained",
		icon = "equipment_gasoline",
		sync_possession = true,
		text_id = "debug_equipment_gas",
		transfer_quantity = 4
	}
	self.specials.c4 = {
		action_message = "c4_obtained",
		icon = "pd2_c4",
		quantity = 4,
		sync_possession = true,
		text_id = "hud_equipment_pickup_c4",
		transfer_quantity = 8
	}
	self.specials.c4_x3 = {
		action_message = "c4_obtained",
		icon = "pd2_c4",
		quantity = 3,
		sync_possession = true,
		text_id = "hud_equipment_pickup_c4",
		transfer_quantity = 8
	}
	self.specials.c4_x10 = {
		action_message = "c4_obtained",
		icon = "pd2_c4",
		max_quantity = 10,
		quantity = 10,
		sync_possession = true,
		text_id = "hud_equipment_pickup_c4",
		transfer_quantity = 10
	}
	self.specials.c4_stackable = {
		action_message = "c4_obtained",
		icon = "pd2_c4",
		max_quantity = 10,
		quantity = 1,
		sync_possession = true,
		text_id = "hud_equipment_pickup_c4",
		transfer_quantity = 10
	}
	self.specials.chas_keychain_forklift = {
		icon = "equipment_chavez_key",
		sync_possession = true,
		text_id = "hud_action_pickup_keychain_forklift",
		transfer_quantity = 1
	}
	self.specials.organs = {
		action_message = "organs_obtained",
		icon = "equipment_thermite",
		text_id = "debug_equipment_organs"
	}
	self.specials.crowbar = {
		icon = "equipment_crowbar",
		sync_possession = true,
		text_id = "debug_equipment_crowbar"
	}
	self.specials.crowbar_stack = {
		icon = "equipment_crowbar",
		sync_possession = true,
		text_id = "debug_equipment_crowbar",
		transfer_quantity = 4
	}
	self.specials.fire_extinguisher = {
		icon = "equipment_fire_extinguisher",
		sync_possession = true,
		text_id = "hud_int_equipment_fire_extinguisher"
	}
	self.specials.blood_sample = {
		icon = "equipment_bloodvial",
		sync_possession = true,
		text_id = "debug_equipment_blood_sample"
	}
	self.specials.acid = {
		icon = "equipment_muriatic_acid",
		sync_possession = true,
		text_id = "hud_int_equipment_acid",
		transfer_quantity = 4
	}
	self.specials.blood_sample_verified = {
		icon = "equipment_bloodvialok",
		sync_possession = true,
		text_id = "debug_equipment_blood_sample_valid"
	}
	self.specials.caustic_soda = {
		icon = "equipment_caustic_soda",
		sync_possession = true,
		text_id = "hud_int_equipment_caustic_soda",
		transfer_quantity = 4
	}
	self.specials.hydrogen_chloride = {
		icon = "equipment_hydrogen_chloride",
		sync_possession = true,
		text_id = "hud_int_equipment_hydrogen_chloride",
		transfer_quantity = 4
	}
	self.specials.gold = {
		icon = "equipment_gold",
		player_rule = "no_run",
		text_id = "debug_equipment_gold"
	}
	self.specials.circle_cutter = {
		icon = "equipment_glasscutter",
		max_quantity = 3,
		quantity = 1,
		sync_possession = true,
		text_id = "hud_equipment_circle_cutter",
		transfer_quantity = 4
	}

	local barcodes = {
		"barcode_downtown",
		"barcode_brickell",
		"barcode_edgewater",
		"barcode_isles_beach",
		"barcode_opa_locka"
	}

	self.specials.barcode_downtown = {
		avoid_tranfer = true,
		icon = "equipment_barcode",
		sync_possession = true,
		text_id = "hud_int_equipment_barcode_downtown",
		shares_pickup_with = barcodes
	}
	self.specials.barcode_brickell = {
		avoid_tranfer = true,
		icon = "equipment_barcode",
		sync_possession = true,
		text_id = "hud_int_equipment_barcode_brickell",
		shares_pickup_with = barcodes
	}
	self.specials.barcode_edgewater = {
		avoid_tranfer = true,
		icon = "equipment_barcode",
		sync_possession = true,
		text_id = "hud_int_equipment_barcode_edgewater",
		shares_pickup_with = barcodes
	}
	self.specials.barcode_isles_beach = {
		avoid_tranfer = true,
		icon = "equipment_barcode",
		sync_possession = true,
		text_id = "hud_int_equipment_barcode_isles_beach",
		shares_pickup_with = barcodes
	}
	self.specials.barcode_opa_locka = {
		avoid_tranfer = true,
		icon = "equipment_barcode",
		sync_possession = true,
		text_id = "hud_int_equipment_barcode_opa_locka",
		shares_pickup_with = barcodes
	}
	self.specials.evidence = {
		icon = "equipment_evidence",
		sync_possession = true,
		text_id = "hud_equipment_evidence"
	}
	self.specials.harddrive = {
		icon = "equipment_harddrive",
		sync_possession = true,
		text_id = "hud_equipment_harddrive"
	}
	self.specials.files = {
		icon = "equipment_files",
		sync_possession = true,
		text_id = "hud_equipment_files"
	}
	self.specials.ticket = {
		icon = "equipment_ticket",
		sync_possession = true,
		text_id = "hud_equipment_take_ticket"
	}
	self.specials.bridge = {
		icon = "equipment_planks",
		sync_possession = true,
		text_id = "hud_equipment_take_bridge"
	}
	self.specials.mus_glas_cutter = {
		icon = "equipment_glasscutter",
		sync_possession = true,
		text_id = "hud_equipment_mus_glass_cutter"
	}
	self.specials.c4_x1 = {
		action_message = "c4_obtained",
		icon = "pd2_c4",
		quantity = 1,
		sync_possession = true,
		text_id = "hud_equipment_pickup_c4"
	}
	self.specials.chainsaw = {
		icon = "equipment_chainsaw",
		sync_possession = true,
		text_id = "hud_equipment_chainsaw"
	}
	self.specials.manifest = {
		icon = "equipment_manifest",
		sync_possession = true,
		text_id = "hud_equipment_manifest"
	}
	self.specials.bottle = {
		icon = "equipment_bottle",
		sync_possession = true,
		text_id = "hud_equipment_bottle"
	}
	self.specials.hotel_room_key = {
		icon = "equipment_bank_manager_key",
		sync_possession = true,
		text_id = "hud_equipment_hotel_room_keycard"
	}
	self.specials.blueprints = {
		icon = "equipment_files",
		sync_possession = true,
		text_id = "hud_equipment_blueprints"
	}
	self.specials.cas_usb_key = {
		icon = "equipment_usb_no_data",
		sync_possession = true,
		text_id = "hud_equipment_usb_key"
	}
	self.specials.cas_data_usb_key = {
		icon = "equipment_usb_with_data",
		sync_possession = true,
		text_id = "hud_equipment_data_usb_key"
	}
	self.specials.cas_sleeping_gas = {
		icon = "equipment_sleeping_gas",
		sync_possession = true,
		text_id = "hud_equipment_sleeping_gas"
	}
	self.specials.cas_bfd_tool = {
		icon = "equipment_bfd_tool",
		sync_possession = true,
		text_id = "hud_equipment_bfd_tool",
		transfer_quantity = 4
	}
	self.specials.cas_elevator_key = {
		icon = "equipment_elevator_key",
		sync_possession = true,
		text_id = "hud_equipment_elevator_key"
	}
	self.specials.cas_winch_hook = {
		icon = "equipment_winch_hook",
		sync_possession = true,
		text_id = "hud_equipment_winch_hook"
	}
	self.specials.printer_ink = {
		icon = "equipment_printer_ink",
		sync_possession = true,
		text_id = "hud_int_equipment_printer_ink",
		transfer_quantity = 4
	}
	self.specials.plates = {
		icon = "equipment_plates",
		sync_possession = true,
		text_id = "hud_int_equipment_plates"
	}
	self.specials.paper_roll = {
		icon = "equipment_paper_roll",
		sync_possession = true,
		text_id = "hud_int_equipment_paper_roll",
		transfer_quantity = 4
	}
	self.specials.chrome_skull = {
		icon = "equipment_chrome_mask",
		sync_possession = true,
		text_id = "hud_equipment_chrome_skull"
	}
	self.specials.soda = {
		icon = "equipment_soda",
		sync_possession = true,
		text_id = "hud_equipment_soda"
	}
	self.specials.tool = {
		icon = "equipment_born_tool",
		sync_possession = true,
		text_id = "hud_equipment_tool"
	}
	self.specials.blow_torch = {
		icon = "equipment_blow_torch",
		sync_possession = true,
		text_id = "hud_int_equipment_blow_torch"
	}
	self.max_amount = {
		ammo_bag = 2,
		asset_ammo_bag = 4,
		asset_bodybags_bag = 3,
		asset_doctor_bag = 3,
		asset_grenade_crate = 3,
		asset_sentry_gun = 4,
		bodybags_bag = 2,
		doctor_bag = 2,
		ecm_jammer = 2,
		first_aid_kit = 14,
		grenade_crate = 1,
		grenades = 4,
		sentry_gun = -1,
		spy_camera = -1,
		trip_mine = 25
	}
	self.class_name_to_deployable_id = {
		AmmoBagBase = "ammo_bag",
		BodyBagsBagBase = "bodybags_bag",
		DoctorBagBase = "doctor_bag",
		FirstAidKitBase = "first_aid_kit",
		GrenadeCrateDeployableBase = "grenade_crate",
		SpyCameraDeployableBase = "spy_camera"
	}
	self.specials.hand = {
		icon = "equipment_hand",
		sync_possession = true,
		text_id = "hud_int_equipment_hand"
	}
	self.specials.briefcase = {
		icon = "equipment_briefcase",
		sync_possession = true,
		text_id = "hud_int_equipment_briefcase"
	}
	self.specials.scubagear_tank_and_flippers = {
		icon = "equipment_chrome_mask",
		sync_possession = true,
		text_id = "hud_equipment_scubagear_tank_and_flippers"
	}
	self.specials.scubagear_vest = {
		icon = "equipment_soda",
		sync_possession = true,
		text_id = "hud_equipment_scubagear_vest"
	}
	self.specials.briefcase_diamond = {
		icon = "equipment_briefcase",
		sync_possession = true,
		text_id = "hud_int_equipment_briefcase_diamond"
	}
	self.specials.liquid_nitrogen = {
		icon = "equipment_liquid_nitrogen_canister",
		sync_possession = true,
		text_id = "hud_int_equipment_liquid_nitrogen",
		transfer_quantity = 4
	}
	self.specials.medallion = {
		icon = "equipment_medallion",
		sync_possession = true,
		text_id = "hud_int_equipment_medallion",
		transfer_quantity = 1
	}
	self.specials.chimichanga = {
		icon = "equipment_chimichanga",
		sync_possession = true,
		text_id = "hud_int_equipment_chimichanga",
		transfer_quantity = 4
	}
	self.specials.stapler = {
		icon = "equipment_stapler",
		sync_possession = true,
		text_id = "hud_int_equipment_stapler",
		transfer_quantity = 4
	}
	self.specials.compound_a = {
		icon = "equipment_compounda",
		sync_possession = false,
		text_id = "hud_int_equipment_compound_a"
	}
	self.specials.compound_b = {
		icon = "equipment_compoundb",
		sync_possession = false,
		text_id = "hud_int_equipment_compound_b"
	}
	self.specials.compound_c = {
		icon = "equipment_compoundc",
		sync_possession = false,
		text_id = "hud_int_equipment_compound_c"
	}
	self.specials.compound_d = {
		icon = "equipment_compoundd",
		sync_possession = false,
		text_id = "hud_int_equipment_compound_d"
	}
	self.specials.concoction = {
		action_message = "thermite_obtained",
		icon = "equipment_thermite",
		sync_possession = true,
		text_id = "hud_int_equipment_concoction"
	}
	self.specials.briefcase = {
		icon = "equipment_briefcase",
		sync_possession = true,
		text_id = "hud_briefcase"
	}
	self.specials.equipment_blueprint = {
		icon = "equipment_blueprint",
		sync_possession = true,
		text_id = "hud_equipment_blueprints"
	}
	self.specials.fingerprint = {
		icon = "equipment_tape_fingerprint",
		sync_possession = true,
		text_id = "hud_fingerprint"
	}
	self.specials.tape = {
		icon = "equipment_tape",
		sync_possession = true,
		text_id = "hud_equipment_take_tape"
	}
	self.specials.police_uniform = {
		icon = "equipment_policebadge",
		sync_possession = true,
		text_id = "hud_police_uniform"
	}
	self.specials.wanker_keys = {
		icon = "equipment_generic_key",
		sync_possession = true,
		text_id = "hud_int_equipment_c_keys"
	}
	self.specials.pex_cutter = {
		icon = "equipment_boltcutter",
		sync_possession = true,
		text_id = "debug_equipment_pex_cutter"
	}
	self.specials.flammable_liquid = {
		icon = "equipment_flammable",
		sync_possession = true,
		text_id = "hud_equipment_flammable_liquid"
	}
	self.specials.pex_unloaded_card = {
		icon = "equipment_rfid_tag_02",
		sync_possession = true,
		text_id = "hud_equipment_unloaded_card"
	}
	self.specials.pex_loaded_card = {
		icon = "equipment_rfid_tag_01",
		sync_possession = true,
		text_id = "hud_equipment_loaded_card"
	}
	self.specials.pex_loaded_card_lvl_2 = {
		icon = "equipment_rfid_tag_01",
		sync_possession = true,
		text_id = "hud_equipment_loaded_card_lvl_2"
	}
	self.specials.globe = {
		icon = "equipment_globe",
		sync_possession = true,
		text_id = "hud_equipment_globe"
	}
	self.specials.fertilizer = {
		icon = "equipment_fertilizer",
		sync_possession = true,
		text_id = "hud_equipment_fertilizer"
	}
	self.specials.alarm_clock = {
		icon = "equipment_timer",
		sync_possession = true,
		text_id = "hud_equipment_alarm_clock"
	}
	self.specials.scythe = {
		icon = "equipment_scythe",
		sync_possession = true,
		text_id = "hud_equipment_scythe"
	}
	self.specials.wire = {
		icon = "equipment_electrical",
		sync_possession = true,
		text_id = "hud_equipment_wire"
	}
	self.specials.diesel = {
		action_message = "diesel_obtained",
		icon = "equipment_gasoline",
		sync_possession = true,
		text_id = "hud_equipment_diesel",
		transfer_quantity = 4
	}
	self.specials.laxative = {
		icon = "equipment_cleaning_product",
		sync_possession = true,
		text_id = "hud_equipment_laxative"
	}
	self.specials.adrenaline = {
		icon = "equipment_syringe",
		sync_possession = true,
		text_id = "hud_equipment_adrenaline"
	}
	self.specials.documents = {
		icon = "equipment_documents",
		sync_possession = true,
		text_id = "hud_equipment_documents"
	}
	self.specials.notepad = {
		icon = "equipment_notepad",
		sync_possession = true,
		text_id = "hud_equipment_notepad"
	}
	self.specials.defibrillator_paddles = {
		icon = "equipment_defibrillator",
		sync_possession = true,
		text_id = "hud_equipment_defibrillator_paddles"
	}
	self.specials.gas_canister = {
		icon = "equipment_gas_canister",
		sync_possession = true,
		text_id = "hud_equipment_gas_canister"
	}
	self.specials.business_card = {
		icon = "equipment_businesscard",
		sync_possession = true,
		text_id = "hud_equipment_business_card"
	}
	self.specials.car_jack = {
		icon = "equipment_car_jack",
		sync_possession = true,
		text_id = "hud_equipment_car_jack"
	}
	self.specials.cargo_strap = {
		icon = "equipment_cargo_strap",
		sync_possession = true,
		text_id = "hud_equipment_cargo_strap"
	}
	self.specials.audio_device = {
		icon = "equipment_audio_device",
		max_quantity = 2,
		quantity = 2,
		sync_possession = true,
		text_id = "hud_equipment_audio_device",
		transfer_quantity = 2
	}
	self.specials.laptop = {
		icon = "equipment_laptop",
		sync_possession = true,
		text_id = "hud_equipment_laptop"
	}
	self.specials.stock = {
		icon = "equipment_stock",
		sync_possession = true,
		text_id = "hud_equipment_stock"
	}
	self.specials.barrel = {
		icon = "equipment_barrel",
		sync_possession = true,
		text_id = "hud_equipment_barrel"
	}
	self.specials.receiver = {
		icon = "equipment_receiver",
		sync_possession = true,
		text_id = "hud_equipment_receiver"
	}
	self.specials.ranc_acid = {
		icon = "equipment_acid",
		sync_possession = true,
		text_id = "hud_equipment_acid"
	}
	self.specials.ranc_sheriff_star = {
		avoid_tranfer = true,
		icon = "equipment_sheriff_star",
		sync_possession = true,
		text_id = "hud_equipment_sheriff_star"
	}
	self.specials.ranc_hammer = {
		icon = "equipment_hammer",
		sync_possession = true,
		text_id = "hud_equipment_hammer"
	}
	self.specials.ranc_silver_ingot = {
		icon = "equipment_silver_ingot",
		sync_possession = true,
		text_id = "hud_equipment_silver_ingot"
	}
	self.specials.ranc_mould = {
		icon = "equipment_mould",
		sync_possession = true,
		text_id = "hud_equipment_mould"
	}
	self.specials.trai_usb_key = {
		avoid_tranfer = true,
		icon = "equipment_usb_with_data",
		sync_possession = true,
		text_id = "hud_equipment_usb_key"
	}
	self.specials.trai_container_key = {
		icon = "equipment_generic_key",
		sync_possession = true,
		text_id = "hud_trai_equipment_key"
	}
	self.specials.corp_key_fob = {
		icon = "equipment_businesscard",
		sync_possession = true,
		text_id = "hud_carry_corp_key_fob"
	}
	self.specials.corp_achi_blueprint = {
		avoid_tranfer = true,
		icon = "equipment_documents",
		sync_possession = true,
		text_id = "hud_carry_corp_achi_blueprint"
	}
	self.specials.lrm_keycard = {
		icon = "equipment_rfid_tag_01",
		max_quantity = 2,
		quantity = 1,
		sync_possession = true,
		text_id = "hud_int_equipment_pickup_lrm_keycard",
		transfer_quantity = 2
	}
	self.specials.deep_oil_sample = {
		action_message = "deep_oil_sample",
		icon = "equipment_oil_sample",
		max_quantity = 1,
		quantity = 1,
		sync_possession = true,
		text_id = "hud_equipment_int_deep_oil_sample",
		transfer_quantity = 1
	}
end
