HudIconsTweakData = HudIconsTweakData or class()

function HudIconsTweakData:init()
	self.scroll_up = {
		texture = "guis/textures/scroll_items",
		texture_rect = {
			0,
			0,
			15,
			18
		}
	}
	self.scroll_dn = {
		texture = "guis/textures/scroll_items",
		texture_rect = {
			15,
			0,
			15,
			18
		}
	}
	self.scrollbar_arrow = {
		texture = "guis/textures/pd2/scrollbar_arrows",
		texture_rect = {
			1,
			1,
			9,
			10
		}
	}
	self.scrollbar = {
		texture = "guis/textures/scroll_items",
		texture_rect = {
			30,
			0,
			15,
			32
		}
	}
	self.icon_buy = {
		texture = "guis/textures/scroll_items",
		texture_rect = {
			45,
			16,
			16,
			16
		}
	}
	self.icon_repair = {
		texture = "guis/textures/scroll_items",
		texture_rect = {
			45,
			0,
			16,
			16
		}
	}
	self.icon_addon = {
		texture = "guis/textures/scroll_items",
		texture_rect = {
			45,
			16,
			16,
			16
		}
	}
	self.icon_equipped = {
		texture = "guis/textures/scroll_items",
		texture_rect = {
			45,
			32,
			16,
			16
		}
	}
	self.icon_locked = {
		texture = "guis/textures/scroll_items",
		texture_rect = {
			0,
			16,
			16,
			16
		}
	}
	self.icon_circlebg = {
		texture = "guis/textures/scroll_items",
		texture_rect = {
			45,
			48,
			16,
			16
		}
	}
	self.icon_circlefill0 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			0,
			0,
			1,
			1
		}
	}
	self.icon_circlefill1 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			0,
			0,
			16,
			16
		}
	}
	self.icon_circlefill2 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			16,
			0,
			16,
			16
		}
	}
	self.icon_circlefill3 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			32,
			0,
			16,
			16
		}
	}
	self.icon_circlefill4 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			48,
			0,
			16,
			16
		}
	}
	self.icon_circlefill5 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			0,
			16,
			16,
			16
		}
	}
	self.icon_circlefill6 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			16,
			16,
			16,
			16
		}
	}
	self.icon_circlefill7 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			32,
			16,
			16,
			16
		}
	}
	self.icon_circlefill8 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			48,
			16,
			16,
			16
		}
	}
	self.icon_circlefill9 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			0,
			32,
			16,
			16
		}
	}
	self.icon_circlefill10 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			16,
			32,
			16,
			16
		}
	}
	self.icon_circlefill11 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			32,
			32,
			16,
			16
		}
	}
	self.icon_circlefill12 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			48,
			32,
			16,
			16
		}
	}
	self.icon_circlefill13 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			0,
			48,
			16,
			16
		}
	}
	self.icon_circlefill14 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			16,
			48,
			16,
			16
		}
	}
	self.icon_circlefill15 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			32,
			48,
			16,
			16
		}
	}
	self.icon_circlefill16 = {
		texture = "guis/textures/circlefill",
		texture_rect = {
			48,
			48,
			16,
			16
		}
	}
	self.fallback = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			480,
			0,
			32,
			32
		}
	}
	self.develop = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			0,
			192,
			48,
			48
		}
	}
	self.locked = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			192,
			144,
			48,
			48
		}
	}
	self.firemode_single = {
		texture = "guis/textures/pd2/hud_fireselector",
		texture_rect = {
			2,
			0,
			8,
			18
		}
	}
	self.firemode_auto = {
		texture = "guis/textures/pd2/hud_fireselector",
		texture_rect = {
			12,
			0,
			8,
			18
		}
	}
	self.firemode_single_locked = {
		texture = "guis/textures/pd2/hud_fireselector",
		texture_rect = {
			22,
			0,
			8,
			18
		}
	}
	self.firemode_auto_locked = {
		texture = "guis/textures/pd2/hud_fireselector",
		texture_rect = {
			32,
			0,
			8,
			18
		}
	}
	self.loading = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			464,
			96,
			32,
			32
		}
	}
	self.beretta92 = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			0,
			0,
			48,
			48
		}
	}
	self.m4 = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			48,
			0,
			48,
			48
		}
	}
	self.r870_shotgun = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			96,
			0,
			48,
			48
		}
	}
	self.mp5 = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			144,
			0,
			48,
			48
		}
	}
	self.c45 = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			192,
			0,
			48,
			48
		}
	}
	self.raging_bull = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			240,
			0,
			48,
			48
		}
	}
	self.mossberg = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			288,
			0,
			48,
			48
		}
	}
	self.hk21 = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			384,
			0,
			48,
			48
		}
	}
	self.m14 = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			336,
			0,
			48,
			48
		}
	}
	self.mac11 = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			432,
			0,
			48,
			48
		}
	}
	self.glock = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			368,
			288,
			48,
			48
		}
	}
	self.ak = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			416,
			288,
			48,
			48
		}
	}
	self.m79 = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			464,
			288,
			48,
			48
		}
	}
	self.pd2_lootdrop = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.pd2_escape = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			32,
			0,
			32,
			32
		}
	}
	self.pd2_talk = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			64,
			0,
			32,
			32
		}
	}
	self.pd2_kill = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			96,
			0,
			32,
			32
		}
	}
	self.pd2_drill = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			128,
			0,
			32,
			32
		}
	}
	self.pd2_generic_look = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			160,
			0,
			32,
			32
		}
	}
	self.pd2_phone = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			192,
			0,
			32,
			32
		}
	}
	self.pd2_c4 = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			224,
			0,
			32,
			32
		}
	}
	self.pd2_generic_saw = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			192,
			64,
			32,
			32
		}
	}
	self.pd2_chainsaw = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			224,
			64,
			32,
			32
		}
	}
	self.pd2_power = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			0,
			32,
			32,
			32
		}
	}
	self.pd2_door = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			32,
			32,
			32,
			32
		}
	}
	self.pd2_computer = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			64,
			32,
			32,
			32
		}
	}
	self.pd2_wirecutter = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			96,
			32,
			32,
			32
		}
	}
	self.pd2_fire = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			128,
			32,
			32,
			32
		}
	}
	self.pd2_loot = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			160,
			32,
			32,
			32
		}
	}
	self.pd2_methlab = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			192,
			32,
			32,
			32
		}
	}
	self.pd2_generic_interact = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			224,
			32,
			32,
			32
		}
	}
	self.pd2_goto = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			0,
			64,
			32,
			32
		}
	}
	self.pd2_ladder = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			32,
			64,
			32,
			32
		}
	}
	self.pd2_fix = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			64,
			64,
			32,
			32
		}
	}
	self.pd2_question = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			96,
			64,
			32,
			32
		}
	}
	self.pd2_defend = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			160,
			64,
			32,
			32
		}
	}
	self.wp_arrow = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			0,
			96,
			32,
			15
		}
	}
	self.pd2_car = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			32,
			96,
			32,
			32
		}
	}
	self.pd2_melee = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			64,
			96,
			32,
			32
		}
	}
	self.pd2_water_tap = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			96,
			96,
			32,
			32
		}
	}
	self.pd2_bodybag = {
		texture = "guis/textures/pd2/pd2_waypoints",
		texture_rect = {
			128,
			96,
			32,
			32
		}
	}
	self.wp_vial = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			240,
			310,
			32,
			32
		}
	}
	self.wp_standard = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			432,
			64,
			32,
			32
		}
	}
	self.wp_revive = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			464,
			64,
			32,
			32
		}
	}
	self.wp_rescue = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			464,
			96,
			32,
			32
		}
	}
	self.wp_trade = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			432,
			96,
			32,
			32
		}
	}
	self.wp_powersupply = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			70,
			242,
			32,
			32
		}
	}
	self.wp_watersupply = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			104,
			242,
			32,
			32
		}
	}
	self.wp_drill = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			2,
			242,
			32,
			32
		}
	}
	self.wp_hack = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			2,
			276,
			32,
			32
		}
	}
	self.wp_talk = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			36,
			276,
			32,
			32
		}
	}
	self.wp_c4 = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			36,
			242,
			32,
			32
		}
	}
	self.wp_crowbar = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			70,
			276,
			32,
			32
		}
	}
	self.wp_planks = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			104,
			276,
			32,
			32
		}
	}
	self.wp_door = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			2,
			310,
			32,
			32
		}
	}
	self.wp_saw = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			36,
			310,
			32,
			32
		}
	}
	self.wp_bag = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			70,
			310,
			32,
			32
		}
	}
	self.wp_exit = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			104,
			310,
			32,
			32
		}
	}
	self.wp_can = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			2,
			344,
			32,
			32
		}
	}
	self.wp_target = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			36,
			344,
			32,
			32
		}
	}
	self.wp_key = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			70,
			344,
			32,
			32
		}
	}
	self.wp_winch = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			104,
			344,
			32,
			32
		}
	}
	self.wp_escort = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			138,
			344,
			32,
			32
		}
	}
	self.wp_powerbutton = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			172,
			344,
			32,
			32
		}
	}
	self.wp_server = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			206,
			344,
			32,
			32
		},
		texture_rect = {
			206,
			344,
			32,
			32
		}
	}
	self.wp_powercord = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			240,
			344,
			32,
			32
		}
	}
	self.wp_phone = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			480,
			144,
			32,
			32
		}
	}
	self.wp_scrubs = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			480,
			177,
			32,
			32
		}
	}
	self.wp_sentry = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			480,
			210,
			32,
			32
		}
	}
	self.wp_suspicious = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			480,
			243,
			32,
			32
		}
	}
	self.wp_detected = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			479,
			433,
			32,
			32
		}
	}
	self.wp_calling_in = {
		texture = "guis/textures/pd2/hud_stealth_alarm01",
		texture_rect = {
			0,
			0,
			64,
			32
		}
	}
	self.wp_calling_in_hazard = {
		texture = "guis/textures/pd2/hud_stealth_alarm02",
		texture_rect = {
			0,
			0,
			64,
			32
		}
	}
	self.equipment_trip_mine = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			0,
			96,
			48,
			48
		}
	}
	self.equipment_ammo_bag = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			48,
			96,
			48,
			48
		}
	}
	self.equipment_doctor_bag = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			96,
			96,
			48,
			48
		}
	}
	self.equipment_ecm_jammer = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			272,
			288,
			48,
			48
		}
	}
	self.equipment_money_bag = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			144,
			96,
			48,
			48
		}
	}
	self.equipment_bank_manager_key = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			288,
			144,
			48,
			48
		}
	}
	self.equipment_chavez_key = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			192,
			96,
			48,
			48
		}
	}
	self.equipment_drill = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			240,
			96,
			48,
			48
		}
	}
	self.equipment_ejection_seat = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			384,
			144,
			48,
			48
		}
	}
	self.equipment_saw = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			336,
			144,
			48,
			48
		}
	}
	self.equipment_cutter = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			384,
			192,
			48,
			48
		}
	}
	self.equipment_hack_ipad = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			432,
			192,
			48,
			48
		}
	}
	self.equipment_gold = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			384,
			240,
			48,
			48
		}
	}
	self.equipment_thermite = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			288,
			96,
			48,
			48
		}
	}
	self.equipment_c4 = {
		texture = "guis/textures/pd2/pickups",
		texture_rect = {
			336,
			96,
			48,
			48
		}
	}
	self.equipment_cable_ties = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			384,
			96,
			48,
			48
		}
	}
	self.equipment_bleed_out = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			96,
			144,
			48,
			48
		}
	}
	self.equipment_planks = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			144,
			288,
			48,
			48
		}
	}
	self.equipment_sentry = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			320,
			288,
			48,
			48
		}
	}
	self.equipment_stash_server = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			224,
			32,
			32
		}
	}
	self.equipment_vialOK = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			336,
			48,
			48,
			48
		}
	}
	self.equipment_vial = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			416,
			336,
			48,
			48
		}
	}
	self.equipment_ticket = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			64,
			96,
			32,
			32
		}
	}
	self.equipment_files = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			96,
			32,
			32
		}
	}
	self.equipment_harddrive = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			128,
			32,
			32
		}
	}
	self.equipment_evidence = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			32,
			128,
			32,
			32
		}
	}
	self.equipment_chainsaw = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			128,
			32,
			32
		}
	}
	self.equipment_manifest = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			160,
			32,
			32
		}
	}
	self.equipment_fire_extinguisher = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			32,
			160,
			32,
			32
		}
	}
	self.equipment_winch_hook = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			64,
			160,
			32,
			32
		}
	}
	self.equipment_bottle = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			160,
			32,
			32
		}
	}
	self.equipment_sleeping_gas = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			192,
			32,
			32
		}
	}
	self.equipment_usb_with_data = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			32,
			192,
			32,
			32
		}
	}
	self.equipment_usb_no_data = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			64,
			192,
			32,
			32
		}
	}
	self.equipment_empty_cooling_bottle = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			160,
			32,
			32
		}
	}
	self.equipment_cooling_bottle = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			128,
			32,
			32
		}
	}
	self.equipment_bfd_tool = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	self.equipment_elevator_key = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			32,
			64,
			32,
			32
		}
	}
	self.equipment_blow_torch = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			192,
			32,
			32
		}
	}
	self.equipment_printer_ink = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			0,
			224,
			32,
			32
		}
	}
	self.equipment_plates = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			32,
			224,
			32,
			32
		}
	}
	self.equipment_paper_roll = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			64,
			224,
			32,
			32
		}
	}
	self.equipment_hand = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			128,
			0,
			32,
			32
		}
	}
	self.equipment_briefcase = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			224,
			32,
			32
		}
	}
	self.equipment_soda = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			128,
			64,
			32,
			32
		}
	}
	self.equipment_chrome_mask = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			128,
			32,
			32,
			32
		}
	}
	self.equipment_born_tool = {
		texture = "guis/textures/pd2/hud_pickups",
		texture_rect = {
			96,
			64,
			32,
			32
		}
	}
	self.interaction_free = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			48,
			192,
			48,
			48
		}
	}
	self.interaction_trade = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			432,
			144,
			48,
			48
		}
	}
	self.interaction_intimidate = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			96,
			192,
			48,
			48
		}
	}
	self.interaction_money_wrap = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			144,
			191,
			48,
			48
		}
	}
	self.interaction_christmas_present = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			144,
			240,
			48,
			48
		}
	}
	self.interaction_powerbox = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			192,
			288,
			48,
			48
		}
	}
	self.interaction_gold = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			384,
			240,
			48,
			48
		}
	}
	self.interaction_open_door = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			96,
			192,
			48,
			48
		}
	}
	self.interaction_diamond = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			432,
			240,
			48,
			48
		}
	}
	self.interaction_powercord = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			272,
			336,
			48,
			48
		}
	}
	self.interaction_help = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			192,
			192,
			48,
			48
		}
	}
	self.interaction_answerphone = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			368,
			336,
			48,
			48
		}
	}
	self.interaction_patientfile = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			320,
			336,
			48,
			48
		}
	}
	self.interaction_wirecutter = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			464,
			336,
			48,
			48
		}
	}
	self.interaction_elevator = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			464,
			384,
			48,
			48
		}
	}
	self.interaction_sentrygun = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			320,
			288,
			48,
			48
		}
	}
	self.interaction_keyboard = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			368,
			384,
			48,
			48
		}
	}
	self.laptop_objective = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			240,
			144,
			48,
			48
		}
	}
	self.interaction_bar = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			1,
			393,
			358,
			20
		}
	}
	self.interaction_bar_background = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			0,
			414,
			360,
			22
		}
	}
	self.mugshot_health_background = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			240,
			240,
			12,
			48
		}
	}
	self.mugshot_health_armor = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			252,
			240,
			12,
			48
		}
	}
	self.mugshot_health_health = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			264,
			240,
			12,
			48
		}
	}
	self.mugshot_talk = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			240,
			288,
			16,
			16
		}
	}
	self.mugshot_in_custody = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			192,
			464,
			48,
			48
		}
	}
	self.mugshot_downed = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			240,
			464,
			48,
			48
		}
	}
	self.mugshot_cuffed = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			288,
			464,
			48,
			48
		}
	}
	self.mugshot_electrified = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			336,
			464,
			48,
			48
		}
	}
	self.control_marker = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			352,
			288,
			16,
			48
		}
	}
	self.control_left = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			304,
			288,
			48,
			48
		}
	}
	self.control_right = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			256,
			288,
			48,
			48
		}
	}
	self.assault = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			276,
			192,
			108,
			96
		}
	}
	self.ps3buttonhighlight = {
		texture = "guis/textures/hud_icons",
		texture_rect = {
			240,
			192,
			32,
			32
		}
	}
	self.jukebox_playing_icon = {
		texture = "guis/textures/pd2/jukebox_playing",
		texture_rect = {
			0,
			0,
			16,
			16
		}
	}
	self.downcard_overkill_deck = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			0,
			0,
			128,
			180
		}
	}
	self.upcard_mask = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			128,
			0,
			128,
			180
		}
	}
	self.upcard_material = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			128,
			180,
			128,
			180
		}
	}
	self.upcard_color = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			256,
			180,
			128,
			180
		}
	}
	self.upcard_pattern = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			384,
			180,
			128,
			180
		}
	}
	self.upcard_weapon = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			256,
			0,
			128,
			180
		}
	}
	self.upcard_cash = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			384,
			0,
			128,
			180
		}
	}
	self.upcard_xp = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			0,
			180,
			128,
			180
		}
	}
	self.upcard_safe = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			512,
			0,
			128,
			180
		}
	}
	self.upcard_drill = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			512,
			180,
			128,
			180
		}
	}
	self.upcard_weapon_bonus = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			640,
			0,
			128,
			180
		}
	}
	self.upcard_random = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			640,
			180,
			128,
			180
		}
	}
	self.upcard_coins = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			768,
			0,
			128,
			180
		}
	}
	self.upcard_cosmetic = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			768,
			180,
			128,
			180
		}
	}
	self.ace_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			102,
			0,
			102,
			142
		}
	}
	self.two_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			204,
			0,
			102,
			142
		}
	}
	self.three_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			306,
			0,
			102,
			142
		}
	}
	self.four_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			408,
			0,
			102,
			142
		}
	}
	self.five_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			0,
			142,
			102,
			142
		}
	}
	self.six_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			102,
			142,
			102,
			142
		}
	}
	self.seven_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			204,
			142,
			102,
			142
		}
	}
	self.eight_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			306,
			142,
			102,
			142
		}
	}
	self.nine_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			408,
			142,
			102,
			142
		}
	}
	self.joker_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			0,
			284,
			102,
			142
		}
	}
	self.one_of_spade = {
		texture = "guis/textures/pd2/lootscreen/loot_cards",
		texture_rect = {
			102,
			284,
			102,
			142
		}
	}
	self.infamy_icon = {
		texture = "guis/textures/pd2/infamous_symbol",
		texture_rect = {
			0,
			4,
			16,
			16
		}
	}
	self.ai_stopped = {
		texture = "guis/textures/pd2/stophand_symbol",
		texture_rect = {
			0,
			0,
			16,
			32
		}
	}
	self.unit_heal = {
		texture = "guis/textures/unit_heal",
		texture_rect = {
			0,
			0,
			32,
			32
		}
	}
	local crime_spree_atlas_size = 128
	self.crime_spree_health = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_damage = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_cloaker_smoke = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_shield_reflect = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 3,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_more_medics = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_more_dozers = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_no_hurt = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_medic_speed = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 3,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_heavies = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_dozer_explosion = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_dozer_lmg = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_pager = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 3,
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_civs_killed = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size * 3,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_concealment = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/modifiers_atlas",
		texture_rect = {
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size * 3,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_assault_extender = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_cloaker_arrest = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_cloaker_tear_gas = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_dozer_medic = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_dozer_minigun = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 3,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_dozer_rage = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_heavy_sniper = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 3,
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_medic_adrenaline = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 3,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_medic_deathwish = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_medic_rage = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_shield_phalanx = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size * 0,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	self.crime_spree_taser_overcharge = {
		texture = "guis/dlcs/drm/textures/pd2/crime_spree/modifiers_atlas_2",
		texture_rect = {
			crime_spree_atlas_size * 2,
			crime_spree_atlas_size * 1,
			crime_spree_atlas_size,
			crime_spree_atlas_size
		}
	}
	local csm_w = 280
	local csm_h = 140
	self.csm_biker_1 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 0,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_biker_2 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 1,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_carshop = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 2,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_branchbank = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 3,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_shadow_raid = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 4,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_crossroads = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 5,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_downtown = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 6,
			csm_h * 0,
			csm_w,
			csm_h
		}
	}
	self.csm_park = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 0,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_overpass = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 1,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_harbor = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 2,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_murky = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 3,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_prison = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 4,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_fs_1 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 5,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_fs_2 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 6,
			csm_h * 1,
			csm_w,
			csm_h
		}
	}
	self.csm_santas_workshop = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 0,
			csm_h * 2,
			csm_w,
			csm_h
		}
	}
	self.csm_hoxvenge = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 1,
			csm_h * 2,
			csm_w,
			csm_h
		}
	}
	self.csm_election_1 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 2,
			csm_h * 2,
			csm_w,
			csm_h
		}
	}
	self.csm_election_2 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 3,
			csm_h * 2,
			csm_w,
			csm_h
		}
	}
	self.csm_election_3 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 4,
			csm_h * 2,
			csm_w,
			csm_h
		}
	}
	self.csm_bigoil_1 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 5,
			csm_h * 2,
			csm_w,
			csm_h
		}
	}
	self.csm_bigoil_2 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 6,
			csm_h * 2,
			csm_w,
			csm_h
		}
	}
	self.csm_framing_3 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 0,
			csm_h * 3,
			csm_w,
			csm_h
		}
	}
	self.csm_train_forest = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 1,
			csm_h * 3,
			csm_w,
			csm_h
		}
	}
	self.csm_yacht = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 2,
			csm_h * 3,
			csm_w,
			csm_h
		}
	}
	self.csm_counterfeit = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 3,
			csm_h * 3,
			csm_w,
			csm_h
		}
	}
	self.csm_undercover = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 4,
			csm_h * 3,
			csm_w,
			csm_h
		}
	}
	self.csm_panic_room = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 5,
			csm_h * 3,
			csm_w,
			csm_h
		}
	}
	self.csm_watchdogs_1 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 6,
			csm_h * 3,
			csm_w,
			csm_h
		}
	}
	self.csm_docks = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 0,
			csm_h * 4,
			csm_w,
			csm_h
		}
	}
	self.csm_white_xmas = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 1,
			csm_h * 4,
			csm_w,
			csm_h
		}
	}
	self.csm_aftershock = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 2,
			csm_h * 4,
			csm_w,
			csm_h
		}
	}
	self.csm_stealing_xmas = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 3,
			csm_h * 4,
			csm_w,
			csm_h
		}
	}
	self.csm_friend = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 4,
			csm_h * 4,
			csm_w,
			csm_h
		}
	}
	self.csm_brooklyn = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 5,
			csm_h * 4,
			csm_w,
			csm_h
		}
	}
	self.csm_rats_1 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 6,
			csm_h * 4,
			csm_w,
			csm_h
		}
	}
	self.csm_fwb = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 0,
			csm_h * 5,
			csm_w,
			csm_h
		}
	}
	self.csm_slaughterhouse = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 1,
			csm_h * 5,
			csm_w,
			csm_h
		}
	}
	self.csm_big = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 2,
			csm_h * 5,
			csm_w,
			csm_h
		}
	}
	self.csm_miami_1 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 3,
			csm_h * 5,
			csm_w,
			csm_h
		}
	}
	self.csm_miami_2 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 4,
			csm_h * 5,
			csm_w,
			csm_h
		}
	}
	self.csm_hoxout_1 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 5,
			csm_h * 5,
			csm_w,
			csm_h
		}
	}
	self.csm_hoxout_2 = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 6,
			csm_h * 5,
			csm_w,
			csm_h
		}
	}
	self.csm_diamond = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 0,
			csm_h * 6,
			csm_w,
			csm_h
		}
	}
	self.csm_mountain = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 1,
			csm_h * 6,
			csm_w,
			csm_h
		}
	}
	self.csm_go = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 2,
			csm_h * 6,
			csm_w,
			csm_h
		}
	}
	self.csm_sky = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 3,
			csm_h * 6,
			csm_w,
			csm_h
		}
	}
	self.csm_labrats = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 4,
			csm_h * 6,
			csm_w,
			csm_h
		}
	}
	self.csm_run = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 5,
			csm_h * 6,
			csm_w,
			csm_h
		}
	}
	self.csm_glace = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/missions_atlas",
		texture_rect = {
			csm_w * 6,
			csm_h * 6,
			csm_w,
			csm_h
		}
	}
	local csb_size = 128
	self.csb_reload = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 0,
			csb_size * 0,
			csb_size,
			csb_size
		}
	}
	self.csb_stamina = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 1,
			csb_size * 0,
			csb_size,
			csb_size
		}
	}
	self.csb_ammo = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 2,
			csb_size * 0,
			csb_size,
			csb_size
		}
	}
	self.csb_lifesteal = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 3,
			csb_size * 0,
			csb_size,
			csb_size
		}
	}
	self.csb_armor = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 4,
			csb_size * 0,
			csb_size,
			csb_size
		}
	}
	self.csb_absorb = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 5,
			csb_size * 0,
			csb_size,
			csb_size
		}
	}
	self.csb_health = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 6,
			csb_size * 0,
			csb_size,
			csb_size
		}
	}
	self.csb_switch = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 7,
			csb_size * 0,
			csb_size,
			csb_size
		}
	}
	self.csb_lives = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 0,
			csb_size * 1,
			csb_size,
			csb_size
		}
	}
	self.csb_throwables = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 1,
			csb_size * 1,
			csb_size,
			csb_size
		}
	}
	self.csb_deployables = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 2,
			csb_size * 1,
			csb_size,
			csb_size
		}
	}
	self.csb_panic = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 3,
			csb_size * 1,
			csb_size,
			csb_size
		}
	}
	self.csb_melee = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 4,
			csb_size * 1,
			csb_size,
			csb_size
		}
	}
	self.csb_explosion = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 5,
			csb_size * 1,
			csb_size,
			csb_size
		}
	}
	self.csb_pagers = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 6,
			csb_size * 1,
			csb_size,
			csb_size
		}
	}
	self.csb_bodybags = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 7,
			csb_size * 1,
			csb_size,
			csb_size
		}
	}
	self.csb_crouch = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 0,
			csb_size * 2,
			csb_size,
			csb_size
		}
	}
	self.csb_locks = {
		texture = "guis/dlcs/cee/textures/pd2/crime_spree/boosts_atlas",
		texture_rect = {
			csb_size * 1,
			csb_size * 2,
			csb_size,
			csb_size
		}
	}

	self:create_grid_atlas("guis/dlcs/mom/textures/pd2/ai_abilities", 512, 512, 128, 128)

	self.ability_1 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_abilities")
	self.ability_2 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_abilities")
	self.ability_3 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_abilities")
	self.ability_4 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_abilities")

	self:create_grid_atlas("guis/dlcs/mom/textures/pd2/ai_skills", 512, 512, 128, 128)

	self.skill_1 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_skills")
	self.skill_2 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_skills")
	self.skill_3 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_skills")
	self.skill_4 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_skills")
	self.skill_5 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_skills")
	self.skill_6 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_skills")
	self.skill_7 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_skills")
	self.skill_8 = self:create_next_icon("guis/dlcs/mom/textures/pd2/ai_skills")
	local sidebar_atlas = "guis/dlcs/new/textures/pd2/crimenet/crimenet_sidebar_icons"

	self:create_grid_atlas(sidebar_atlas, 256, 256, 64, 64)

	self.sidebar_mutators = self:create_next_icon(sidebar_atlas)
	self.sidebar_codex = self:create_next_icon(sidebar_atlas)
	self.sidebar_broker = self:create_next_icon(sidebar_atlas)
	self.sidebar_gage = self:create_next_icon(sidebar_atlas)
	self.sidebar_expand = self:create_next_icon(sidebar_atlas)
	self.sidebar_casino = self:create_next_icon(sidebar_atlas)
	self.sidebar_safehouse = self:create_next_icon(sidebar_atlas)
	self.sidebar_basics = self:create_next_icon(sidebar_atlas)
	self.sidebar_crimespree = self:create_next_icon(sidebar_atlas)
	self.sidebar_filters = self:create_next_icon(sidebar_atlas)
	self.sidebar_question = self:create_next_icon(sidebar_atlas)
end
local atlas_data = nil

function HudIconsTweakData:create_grid_atlas(image_name, tex_w, tex_h, grid_w, grid_h)
	atlas_data = atlas_data or {}
	atlas_data[image_name] = {
		y = 0,
		x = 0,
		tex_w = tex_w,
		tex_h = tex_h,
		grid_w = grid_w,
		grid_h = grid_h
	}
end

function HudIconsTweakData:create_next_icon(image_name)
	local data = atlas_data[image_name]

	assert(data, "No atlas definition found. Use create_grid_atlas(or potentially some other create atlas function) first!")
	assert(data.y < data.tex_h, "Atlas already full!")

	local rtn = {
		texture = image_name,
		texture_rect = {
			data.x,
			data.y,
			data.grid_w,
			data.grid_h
		}
	}
	data.x = data.x + data.grid_w

	if data.tex_w <= data.x then
		data.x = 0
		data.y = data.y + data.grid_h
	end

	return rtn
end

function HudIconsTweakData:get_icon_data(icon_id, default_rect)
	local icon_data = self[icon_id]
	local icon = icon_data and icon_data.texture or icon_id
	local texture_rect = icon_data and icon_data.texture_rect or default_rect or {
		0,
		0,
		48,
		48
	}

	return icon, texture_rect
end

function HudIconsTweakData:get_icon_or(icon_id, ...)
	local icon_data = self[icon_id]

	if not icon_data then
		return ...
	end

	return icon_data.texture, icon_data.texture_rect
end

function HudIconsTweakData:get_texture(texture_path)
	local icon_data = self[texture]

	if not icon_data then
		return texture_path
	end

	return icon_data.texture, icon_data.texture_rect
end

