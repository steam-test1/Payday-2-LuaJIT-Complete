NarrativeTweakData = NarrativeTweakData or class()

function NarrativeTweakData:init(tweak_data)
	self.STARS = {}
	self.STARS[1] = {
		jcs = {
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[2] = {
		jcs = {
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[3] = {
		jcs = {
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[4] = {
		jcs = {
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[5] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[6] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[7] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[8] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[9] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS[10] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS = {}
	self.INFAMY_STARS[1] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS[2] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS[3] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS[4] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS[5] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS[6] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS[7] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS[8] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS[9] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.INFAMY_STARS[10] = {
		jcs = {
			100,
			90,
			80,
			70,
			60,
			50,
			40,
			30,
			20,
			10
		}
	}
	self.STARS_CURVES = {
		1.6,
		1.5,
		1.5,
		1.5,
		1.5,
		1.5,
		1.5,
		1.4,
		1.3,
		1.2
	}
	self.JC_CHANCE = 0.01
	self.JC_PICKS = 35
	self.CONTRACT_COOLDOWN_TIME = 300
	self.HEAT_OTHER_JOBS_RATIO = 0.3
	self.ABSOLUTE_ZERO_JOBS_HEATS_OTHERS = false
	self.HEATED_MAX_XP_MUL = 1.15
	self.FREEZING_MAX_XP_MUL = 0.7
	self.DEFAULT_HEAT = {
		other_jobs = 5,
		this_job = -5
	}
	self.MAX_JOBS_IN_CONTAINERS = {
		6,
		18,
		24,
		false,
		12,
		4,
		1
	}
	self.DEFAULT_GHOST_BONUS = 0
	self.contacts = {}
	self.contacts.dallas = {}
	self.contacts.dallas.name_id = "heist_contact_dallas"
	self.contacts.dallas.description_id = "heist_contact_dallas_description"
	self.contacts.dallas.package = "packages/contact_dallas"
	self.contacts.dallas.assets_gui = Idstring("guis/mission_briefing/preload_contact_dallas")
	self.contacts.vlad = {}
	self.contacts.vlad.name_id = "heist_contact_vlad"
	self.contacts.vlad.description_id = "heist_contact_vlad_description"
	self.contacts.vlad.package = "packages/contact_vlad"
	self.contacts.vlad.assets_gui = Idstring("guis/mission_briefing/preload_contact_vlad")
	self.contacts.hector = {}
	self.contacts.hector.name_id = "heist_contact_hector"
	self.contacts.hector.description_id = "heist_contact_hector_description"
	self.contacts.hector.package = "packages/contact_hector"
	self.contacts.hector.assets_gui = Idstring("guis/mission_briefing/preload_contact_hector")
	self.contacts.the_elephant = {}
	self.contacts.the_elephant.name_id = "heist_contact_the_elephant"
	self.contacts.the_elephant.description_id = "heist_contact_the_elephant_description"
	self.contacts.the_elephant.package = "packages/contact_the_elephant"
	self.contacts.the_elephant.assets_gui = Idstring("guis/mission_briefing/preload_contact_the_elephant")
	self.contacts.bain = {}
	self.contacts.bain.name_id = "heist_contact_bain"
	self.contacts.bain.description_id = "heist_contact_bain_description"
	self.contacts.bain.package = "packages/contact_bain"
	self.contacts.bain.assets_gui = Idstring("guis/mission_briefing/preload_contact_bain")
	self.contacts.bain_no_variation = deep_clone(self.contacts.bain)
	self.contacts.bain_no_variation.assets_gui = Idstring("guis/mission_briefing/preload_contact_bain_no_variation")
	self.contacts.classic = {}
	self.contacts.classic.name_id = "heist_contact_classic"
	self.contacts.classic.description_id = "heist_contact_classic_description"
	self.contacts.classic.package = "packages/contact_bain"
	self.contacts.classic.assets_gui = Idstring("guis/mission_briefing/preload_contact_bain")
	self.contacts.the_dentist = {}
	self.contacts.the_dentist.name_id = "heist_contact_the_dentist"
	self.contacts.the_dentist.description_id = "heist_contact_the_dentist_description"
	self.contacts.the_dentist.package = "packages/contact_the_dentist"
	self.contacts.the_dentist.assets_gui = Idstring("guis/dlcs/big_bank/guis/preload_contact_the_dentist")
	self.contacts.the_butcher = {}
	self.contacts.the_butcher.name_id = "heist_contact_the_butcher"
	self.contacts.the_butcher.description_id = "heist_contact_the_butcher_description"
	self.contacts.the_butcher.package = "packages/contact_the_butcher"
	self.contacts.the_butcher.assets_gui = Idstring("guis/dlcs/the_bomb/guis/preload_contact_the_butcher")
	self.contacts.interupt = {}
	self.contacts.interupt.name_id = "heist_contact_interupt"
	self.contacts.interupt.description_id = "heist_contact_interupt_description"
	self.contacts.interupt.package = "packages/contact_interupt"
	self.contacts.interupt.assets_gui = Idstring("guis/mission_briefing/preload_contact_interupt")
	self.contacts.events = {}
	self.contacts.events.name_id = "heist_contact_events"
	self.contacts.events.description_id = "heist_contact_events_description"
	self.contacts.events.package = "packages/contact_bain"
	self.contacts.events.assets_gui = Idstring("guis/mission_briefing/preload_contact_bain")
	self.contacts.locke = {}
	self.contacts.locke.name_id = "heist_contact_locke"
	self.contacts.locke.description_id = "heist_contact_locke_description"
	self.contacts.locke.package = "packages/contact_locke"
	self.contacts.locke.assets_gui = Idstring("guis/dlcs/berry/guis/preload_contact_locke")
	self.contacts.jimmy = {}
	self.contacts.jimmy.name_id = "heist_contact_jimmy"
	self.contacts.jimmy.description_id = "heist_contact_jimmy_description"
	self.contacts.jimmy.package = "packages/contact_jimmy"
	self.contacts.jimmy.assets_gui = Idstring("guis/dlcs/mad/guis/preload_contact_jimmy")
	self.contacts.hoxton = {}
	self.contacts.hoxton.name_id = "heist_contact_hoxton"
	self.contacts.hoxton.description_id = "heist_contact_hoxton_description"
	self.contacts.hoxton.package = "packages/contact_hoxton"
	self.contacts.hoxton.assets_gui = Idstring("guis/mission_briefing/preload_contact_hoxton")
	self.contacts.hoxton.hidden = true
	self.contacts.hoxton.ignore_heat = true
	self.contacts.the_continental = {}
	self.contacts.the_continental.name_id = "heist_contact_continental"
	self.contacts.the_continental.description_id = "heist_contact_continental_description"
	self.contacts.the_continental.package = "packages/contact_continental"
	self.contacts.the_continental.assets_gui = Idstring("guis/mission_briefing/preload_contact_continental")
	self.contacts.jiufeng = {}
	self.contacts.jiufeng.name_id = "heist_contact_jiufeng"
	self.contacts.jiufeng.description_id = "heist_contact_jiufeng_description"
	self.contacts.jiufeng.package = "packages/contact_jiufeng"
	self.contacts.jiufeng.assets_gui = Idstring("guis/dlcs/chas/guis/preload_contact_jiufeng")
	self.contacts.shayu = {}
	self.contacts.shayu.name_id = "heist_contact_shayu"
	self.contacts.shayu.description_id = "heist_contact_shayu_description"
	self.contacts.shayu.package = "packages/contact_shayu"
	self.contacts.shayu.assets_gui = Idstring("guis/dlcs/pent/guis/preload_contact_shayu")
	self.contacts.mcshay = {}
	self.contacts.mcshay.name_id = "heist_contact_mcshay"
	self.contacts.mcshay.description_id = "heist_contact_mcshay_description"
	self.contacts.mcshay.package = "packages/contact_mcshay"
	self.contacts.mcshay.assets_gui = Idstring("guis/dlcs/ranc/guis/preload_contact_mcshay")
	self.contacts.blaine = {}
	self.contacts.blaine.name_id = "heist_contact_blaine"
	self.contacts.blaine.description_id = "heist_contact_blaine_description"
	self.contacts.blaine.package = "packages/contact_blaine"
	self.contacts.blaine.assets_gui = Idstring("guis/dlcs/corp/guis/preload_contact_blaine")
	self.contacts.skirmish = {}
	self.contacts.skirmish.name_id = "heist_contact_skirmish"
	self.contacts.skirmish.description_id = "heist_contact_bain_description"
	self.contacts.skirmish.package = "packages/contact_bain"
	self.contacts.skirmish.assets_gui = Idstring("guis/mission_briefing/preload_contact_bain")
	self.contacts.skirmish.hide_stream = true
	self.contacts.skirmish.hidden = true
	self.contacts.skirmish.ignore_heat = true
	self.jobs = {}
	self.stages = {}
	self.stages.firestarter_1 = {
		level_id = "firestarter_1",
		type = "d",
		type_id = "heist_type_hijack"
	}
	self.stages.firestarter_2 = {
		level_id = "firestarter_2",
		type = "d",
		type_id = "heist_type_stealth"
	}
	self.stages.firestarter_3 = {
		level_id = "firestarter_3",
		mission = "default",
		type = "d",
		type_id = "heist_type_knockover",
		mission_filter = {
			5
		}
	}
	self.jobs.firestarter = {}
	self.jobs.firestarter.name_id = "heist_firestarter"
	self.jobs.firestarter.briefing_id = "heist_firestarter_crimenet"
	self.jobs.firestarter.package = "packages/job_firestarter"
	self.jobs.firestarter.contact = "hector"
	self.jobs.firestarter.jc = 50
	self.jobs.firestarter.chain = {
		self.stages.firestarter_1,
		self.stages.firestarter_2,
		self.stages.firestarter_3
	}
	self.jobs.firestarter.load_screen = "guis/dlcs/pic/textures/loading/job_firestarter_01"
	self.jobs.firestarter.briefing_event = "hct_firestarter_brf"
	self.jobs.firestarter.debrief_event = "hct_firestarter_debrief"
	self.jobs.firestarter.crimenet_callouts = {
		"hct_firestarter_cnc_01"
	}
	self.jobs.firestarter.crimenet_videos = {
		"cn_fires1",
		"cn_fires2",
		"cn_fires3"
	}
	self.jobs.firestarter.payout = {
		70000,
		95000,
		125000,
		200000,
		250000,
		250000,
		250000
	}
	self.jobs.firestarter.contract_cost = {
		39000,
		78000,
		195000,
		390000,
		500000,
		500000,
		500000
	}
	self.jobs.firestarter.experience_mul = {
		1.2,
		1.2,
		1.2,
		1.2,
		1.2
	}
	self.jobs.firestarter.contract_visuals = {}
	self.jobs.firestarter.contract_visuals.min_mission_xp = {
		30000,
		30000,
		30000,
		30000,
		30000,
		30000,
		30000
	}
	self.jobs.firestarter.contract_visuals.max_mission_xp = {
		44000,
		44000,
		44000,
		44000,
		44000,
		44000,
		44000
	}
	self.stages.alex_1 = {
		level_id = "alex_1",
		type = "d",
		type_id = "heist_type_survive"
	}
	self.stages.alex_2 = {
		level_id = "alex_2",
		type = "d",
		type_id = "heist_type_survive"
	}
	self.stages.alex_3 = {
		level_id = "alex_3",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.alex = {}
	self.jobs.alex.name_id = "heist_alex"
	self.jobs.alex.briefing_id = "heist_alex_crimenet"
	self.jobs.alex.package = "packages/job_rats"
	self.jobs.alex.contact = "hector"
	self.jobs.alex.jc = 40
	self.jobs.alex.chain = {
		self.stages.alex_1,
		self.stages.alex_2,
		self.stages.alex_3
	}
	self.jobs.alex.briefing_event = "hct_rats_brf_speak"
	self.jobs.alex.debrief_event = "hct_rats_debrief"
	self.jobs.alex.crimenet_callouts = {
		"hct_rats_cnc_01"
	}
	self.jobs.alex.crimenet_videos = {
		"cn_rat1",
		"cn_rat2",
		"cn_rat3"
	}
	self.jobs.alex.experience_mul = {
		1,
		1,
		1,
		1,
		1.5
	}
	self.jobs.alex.payout = {
		10000,
		15000,
		20000,
		30000,
		50000,
		50000,
		50000
	}
	self.jobs.alex.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.alex.contract_visuals = {}
	self.jobs.alex.contract_visuals.min_mission_xp = {
		24000,
		24000,
		24000,
		24000,
		24000,
		24000,
		24000
	}
	self.jobs.alex.contract_visuals.max_mission_xp = {
		96000,
		96000,
		96000,
		96000,
		96000,
		96000,
		96000
	}
	self.stages.welcome_to_the_jungle_1_d = {
		level_id = "welcome_to_the_jungle_1",
		type = "e",
		type_id = "heist_type_assault",
		world_setting = "day",
		mission_filter = {
			1
		}
	}
	self.stages.welcome_to_the_jungle_1_n = {
		level_id = "welcome_to_the_jungle_1_night",
		type = "e",
		type_id = "heist_type_assault",
		world_setting = "night",
		mission_filter = {
			1
		}
	}
	self.stages.welcome_to_the_jungle_2 = {
		level_id = "welcome_to_the_jungle_2",
		type = "e",
		type_id = "heist_type_stealth",
		mission_filter = {
			1
		}
	}
	self.jobs.welcome_to_the_jungle_wrapper = {}
	self.jobs.welcome_to_the_jungle_wrapper.name_id = "heist_welcome_to_the_jungle"
	self.jobs.welcome_to_the_jungle_wrapper.briefing_id = "heist_welcome_to_the_jungle_crimenet"
	self.jobs.welcome_to_the_jungle_wrapper.contact = "the_elephant"
	self.jobs.welcome_to_the_jungle_wrapper.jc = 50
	self.jobs.welcome_to_the_jungle_wrapper.chain = {
		{}
	}
	self.jobs.welcome_to_the_jungle_wrapper.job_wrapper = {
		"welcome_to_the_jungle",
		"welcome_to_the_jungle_night"
	}
	self.jobs.welcome_to_the_jungle_wrapper.briefing_event = "elp_bigoil_brf"
	self.jobs.welcome_to_the_jungle_wrapper.debrief_event = "elp_bigoil_debrief"
	self.jobs.welcome_to_the_jungle_wrapper.crimenet_callouts = {
		"elp_bigoil_cnc_01"
	}
	self.jobs.welcome_to_the_jungle_wrapper.crimenet_videos = {
		"cn_bigoil1",
		"cn_bigoil2",
		"cn_bigoil3"
	}
	self.jobs.welcome_to_the_jungle_wrapper.payout = {
		200000,
		275000,
		400000,
		500000,
		800000,
		800000,
		800000
	}
	self.jobs.welcome_to_the_jungle_wrapper.contract_cost = {
		20000,
		36000,
		50000,
		90000,
		150000,
		150000,
		150000
	}
	self.jobs.welcome_to_the_jungle_wrapper.contract_visuals = {}
	self.jobs.welcome_to_the_jungle_wrapper.contract_visuals.min_mission_xp = {
		33000,
		33000,
		33000,
		33000,
		33000,
		33000,
		33000
	}
	self.jobs.welcome_to_the_jungle_wrapper.contract_visuals.max_mission_xp = {
		37500,
		37500,
		37500,
		37500,
		37500,
		37500,
		37500
	}
	self.jobs.welcome_to_the_jungle_wrapper_prof = deep_clone(self.jobs.welcome_to_the_jungle_wrapper)
	self.jobs.welcome_to_the_jungle_wrapper_prof.job_wrapper = {
		"welcome_to_the_jungle_prof",
		"welcome_to_the_jungle_night_prof"
	}
	self.jobs.welcome_to_the_jungle_wrapper_prof.jc = 70
	self.jobs.welcome_to_the_jungle_wrapper_prof.region = "professional"
	self.jobs.welcome_to_the_jungle_wrapper_prof.payout = {
		250000,
		300000,
		450000,
		550000,
		850000,
		850000,
		850000
	}
	self.jobs.welcome_to_the_jungle_wrapper_prof.contract_cost = {
		54000,
		108000,
		270000,
		540000,
		700000,
		700000,
		700000
	}
	self.jobs.welcome_to_the_jungle = {}
	self.jobs.welcome_to_the_jungle.job_wrapper = nil
	self.jobs.welcome_to_the_jungle.package = "packages/job_bigoil"
	self.jobs.welcome_to_the_jungle.chain = {
		self.stages.welcome_to_the_jungle_1_d,
		self.stages.welcome_to_the_jungle_2
	}
	self.jobs.welcome_to_the_jungle.load_screen = "guis/dlcs/pic/textures/loading/job_bigoil_01"
	self.jobs.welcome_to_the_jungle_prof = deep_clone(self.jobs.welcome_to_the_jungle)
	self.jobs.welcome_to_the_jungle_night = deep_clone(self.jobs.welcome_to_the_jungle)
	self.jobs.welcome_to_the_jungle_night.chain = {
		self.stages.welcome_to_the_jungle_1_n,
		self.stages.welcome_to_the_jungle_2
	}
	self.jobs.welcome_to_the_jungle_night_prof = deep_clone(self.jobs.welcome_to_the_jungle_night)
	self.stages.framing_frame_1 = {
		level_id = "framing_frame_1",
		type = "e",
		type_id = "heist_type_knockover",
		mission_filter = {
			1
		}
	}
	self.stages.framing_frame_2 = {
		level_id = "framing_frame_2",
		type = "e",
		type_id = "heist_type_trade",
		mission_filter = {
			1
		}
	}
	self.stages.framing_frame_3 = {
		level_id = "framing_frame_3",
		type = "e",
		type_id = "heist_type_stealth",
		mission_filter = {
			1
		}
	}
	self.jobs.framing_frame = {}
	self.jobs.framing_frame.name_id = "heist_framing_frame"
	self.jobs.framing_frame.briefing_id = "heist_framing_frame_crimenet"
	self.jobs.framing_frame.package = "packages/job_framing_frame"
	self.jobs.framing_frame.contact = "the_elephant"
	self.jobs.framing_frame.jc = 50
	self.jobs.framing_frame.chain = {
		self.stages.framing_frame_1,
		self.stages.framing_frame_2,
		self.stages.framing_frame_3
	}
	self.jobs.framing_frame.load_screen = "guis/dlcs/pic/textures/loading/job_framingframe_01"
	self.jobs.framing_frame.briefing_event = "elp_framing_brf"
	self.jobs.framing_frame.debrief_event = "elp_framing_debrief"
	self.jobs.framing_frame.crimenet_callouts = {
		"elp_framing_cmc_01"
	}
	self.jobs.framing_frame.crimenet_videos = {
		"cn_framingframe1",
		"cn_framingframe2",
		"cn_framingframe3"
	}
	self.jobs.framing_frame.payout = {
		60000,
		120000,
		300000,
		600000,
		800000,
		800000,
		800000
	}
	self.jobs.framing_frame.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000,
		400000,
		400000
	}
	self.jobs.framing_frame.contract_visuals = {}
	self.jobs.framing_frame.contract_visuals.min_mission_xp = {
		18500,
		20000,
		20000,
		20000,
		20000,
		20000,
		20000
	}
	self.jobs.framing_frame.contract_visuals.max_mission_xp = {
		42000,
		42000,
		42000,
		42000,
		42000,
		42000,
		42000
	}
	self.stages.watchdogs_1_d = {
		level_id = "watchdogs_1",
		type = "d",
		type_id = "heist_type_survive",
		world_setting = "day"
	}
	self.stages.watchdogs_1_n = {
		level_id = "watchdogs_1_night",
		type = "d",
		type_id = "heist_type_survive",
		world_setting = "night"
	}
	self.stages.watchdogs_2_d = {
		level_id = "watchdogs_2_day",
		type = "d",
		type_id = "heist_type_survive",
		world_setting = "day"
	}
	self.stages.watchdogs_2_n = {
		level_id = "watchdogs_2",
		type = "d",
		type_id = "heist_type_survive",
		world_setting = "night"
	}
	self.jobs.watchdogs_wrapper = {}
	self.jobs.watchdogs_wrapper.name_id = "heist_watchdogs"
	self.jobs.watchdogs_wrapper.briefing_id = "heist_watchdogs_crimenet"
	self.jobs.watchdogs_wrapper.contact = "hector"
	self.jobs.watchdogs_wrapper.region = "dock"
	self.jobs.watchdogs_wrapper.jc = 50
	self.jobs.watchdogs_wrapper.chain = {
		{}
	}
	self.jobs.watchdogs_wrapper.job_wrapper = {
		"watchdogs",
		"watchdogs_night"
	}
	self.jobs.watchdogs_wrapper.briefing_event = "hct_watchdogs_brf_speak"
	self.jobs.watchdogs_wrapper.debrief_event = "hct_watchdogs_debrief"
	self.jobs.watchdogs_wrapper.crimenet_callouts = {
		"hct_watchdogs_cnc_01"
	}
	self.jobs.watchdogs_wrapper.crimenet_videos = {
		"cn_watchdog1",
		"cn_watchdog2",
		"cn_watchdog3"
	}
	self.jobs.watchdogs_wrapper.payout = {
		60000,
		74000,
		125000,
		185000,
		260000,
		260000,
		260000
	}
	self.jobs.watchdogs_wrapper.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000,
		400000,
		400000
	}
	self.jobs.watchdogs_wrapper.contract_visuals = {}
	self.jobs.watchdogs_wrapper.contract_visuals.min_mission_xp = {
		24000,
		24000,
		24000,
		24000,
		24000,
		24000,
		24000
	}
	self.jobs.watchdogs_wrapper.contract_visuals.max_mission_xp = {
		40000,
		40000,
		40000,
		40000,
		40000,
		40000,
		40000
	}
	self.jobs.watchdogs = {}
	self.jobs.watchdogs.package = "packages/job_watchdogs"
	self.jobs.watchdogs.chain = {
		self.stages.watchdogs_1_d,
		self.stages.watchdogs_2_n
	}
	self.jobs.watchdogs.load_screen = "guis/dlcs/pic/textures/loading/job_watchdogs_01"
	self.jobs.watchdogs_night = deep_clone(self.jobs.watchdogs)
	self.jobs.watchdogs_night.chain = {
		self.stages.watchdogs_1_n,
		self.stages.watchdogs_2_d
	}
	self.jobs.watchdogs_night.load_screen = "guis/dlcs/pic/textures/loading/job_watchdogs_01"
	self.stages.nightclub = {
		level_id = "nightclub",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.nightclub = {}
	self.jobs.nightclub.name_id = "heist_nightclub"
	self.jobs.nightclub.briefing_id = "heist_nightclub_crimenet"
	self.jobs.nightclub.package = "packages/job_nightclub"
	self.jobs.nightclub.region = "street"
	self.jobs.nightclub.contact = "vlad"
	self.jobs.nightclub.jc = 30
	self.jobs.nightclub.chain = {
		self.stages.nightclub
	}
	self.jobs.nightclub.load_screen = "guis/dlcs/pic/textures/loading/job_nightclub"
	self.jobs.nightclub.briefing_event = "vld_nightclub_brf"
	self.jobs.nightclub.debrief_event = "vld_nightclub_debrief"
	self.jobs.nightclub.crimenet_callouts = {
		"vld_nightclub_cnc_01"
	}
	self.jobs.nightclub.crimenet_videos = {
		"cn_nightc1",
		"cn_nightc2",
		"cn_nightc3"
	}
	self.jobs.nightclub.payout = {
		20000,
		22500,
		40000,
		60000,
		80000,
		80000,
		80000
	}
	self.jobs.nightclub.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.nightclub.contract_visuals = {}
	self.jobs.nightclub.contract_visuals.min_mission_xp = {
		8000,
		8000,
		8000,
		8000,
		8000,
		8000,
		8000
	}
	self.jobs.nightclub.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.stages.ukrainian_job = {
		level_id = "ukrainian_job",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.ukrainian_job = {}
	self.jobs.ukrainian_job.name_id = "heist_ukrainian_job"
	self.jobs.ukrainian_job.briefing_id = "heist_ukrainian_job_crimenet"
	self.jobs.ukrainian_job.package = "packages/job_ukrainian"
	self.jobs.ukrainian_job.contact = "vlad"
	self.jobs.ukrainian_job.region = "street"
	self.jobs.ukrainian_job.jc = 20
	self.jobs.ukrainian_job.chain = {
		self.stages.ukrainian_job
	}
	self.jobs.ukrainian_job.load_screen = "guis/dlcs/pic/textures/loading/job_jewelry_store"
	self.jobs.ukrainian_job.briefing_event = "vld_ukranian_brf"
	self.jobs.ukrainian_job.debrief_event = "vld_ukranian_debrief"
	self.jobs.ukrainian_job.crimenet_callouts = {
		"vld_ukranian_cnc_01"
	}
	self.jobs.ukrainian_job.crimenet_videos = {
		"cn_ukr1",
		"cn_ukr2",
		"cn_ukr3"
	}
	self.jobs.ukrainian_job.payout = {
		20000,
		21000,
		23000,
		25000,
		30000,
		30000,
		30000
	}
	self.jobs.ukrainian_job.contract_visuals = {}
	self.jobs.ukrainian_job.contract_visuals.min_mission_xp = {
		4000,
		4000,
		4000,
		4000,
		4000,
		4000,
		4000
	}
	self.jobs.ukrainian_job.contract_visuals.max_mission_xp = {
		10000,
		10000,
		10000,
		10000,
		10000,
		10000,
		10000
	}
	self.jobs.ukrainian_job_prof = deep_clone(self.jobs.ukrainian_job)
	self.jobs.ukrainian_job_prof.jc = 20
	self.jobs.ukrainian_job_prof.region = "professional"
	self.jobs.ukrainian_job_prof.payout = {
		21000,
		24000,
		26000,
		30000,
		40000,
		40000,
		40000
	}
	self.jobs.ukrainian_job_prof.contract_cost = {
		8000,
		16000,
		40000,
		80000,
		100000,
		100000,
		100000
	}
	self.stages.jewelry_store = {
		level_id = "jewelry_store",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.jewelry_store = {}
	self.jobs.jewelry_store.name_id = "heist_jewelry_store"
	self.jobs.jewelry_store.briefing_id = "heist_jewelry_store_crimenet"
	self.jobs.jewelry_store.package = "packages/job_jewelry"
	self.jobs.jewelry_store.contact = "bain"
	self.jobs.jewelry_store.region = "street"
	self.jobs.jewelry_store.jc = 10
	self.jobs.jewelry_store.chain = {
		self.stages.jewelry_store
	}
	self.jobs.jewelry_store.load_screen = "guis/dlcs/pic/textures/loading/job_jewelry_store"
	self.jobs.jewelry_store.briefing_event = "pln_jewelerystore_stage1_brief"
	self.jobs.jewelry_store.debrief_event = nil
	self.jobs.jewelry_store.crimenet_callouts = {
		"pln_jewelrystore_stage1_cnc_01"
	}
	self.jobs.jewelry_store.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel3"
	}
	self.jobs.jewelry_store.experience_mul = {
		1,
		1,
		1,
		1,
		3
	}
	self.jobs.jewelry_store.payout = {
		6000,
		12000,
		30000,
		50000,
		60000,
		60000,
		60000
	}
	self.jobs.jewelry_store.contract_cost = {
		4000,
		8000,
		20000,
		40000,
		100000,
		100000,
		100000
	}
	self.jobs.jewelry_store.contract_visuals = {}
	self.jobs.jewelry_store.contract_visuals.min_mission_xp = {
		2000,
		2000,
		2000,
		2000,
		2000,
		2000,
		2000
	}
	self.jobs.jewelry_store.contract_visuals.max_mission_xp = {
		8000,
		8000,
		8000,
		8000,
		8000,
		8000,
		8000
	}
	self.stages.four_stores = {
		level_id = "four_stores",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.four_stores = {}
	self.jobs.four_stores.name_id = "heist_four_stores"
	self.jobs.four_stores.briefing_id = "heist_four_stores_crimenet"
	self.jobs.four_stores.package = "packages/job_four_stores"
	self.jobs.four_stores.contact = "vlad"
	self.jobs.four_stores.region = "street"
	self.jobs.four_stores.jc = 20
	self.jobs.four_stores.chain = {
		self.stages.four_stores
	}
	self.jobs.four_stores.load_screen = "guis/dlcs/pic/textures/loading/job_fourstores"
	self.jobs.four_stores.briefing_event = "vld_fourstores_brf"
	self.jobs.four_stores.debrief_event = "vld_fourstores_debrief"
	self.jobs.four_stores.crimenet_callouts = {
		"vld_fourstores_cnc_01"
	}
	self.jobs.four_stores.crimenet_videos = {
		"cn_fours1",
		"cn_fours2",
		"cn_fours3"
	}
	self.jobs.four_stores.payout = {
		9000,
		18000,
		45000,
		90000,
		120000,
		120000,
		120000
	}
	self.jobs.four_stores.contract_cost = {
		8000,
		16000,
		40000,
		80000,
		100000,
		100000,
		100000
	}
	self.jobs.four_stores.contract_visuals = {}
	self.jobs.four_stores.contract_visuals.min_mission_xp = 6000
	self.jobs.four_stores.contract_visuals.max_mission_xp = 6000
	self.stages.mallcrasher = {
		level_id = "mallcrasher",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.mallcrasher = {}
	self.jobs.mallcrasher.name_id = "heist_mallcrasher"
	self.jobs.mallcrasher.briefing_id = "heist_mallcrasher_crimenet"
	self.jobs.mallcrasher.package = "packages/job_mallcrasher"
	self.jobs.mallcrasher.contact = "vlad"
	self.jobs.mallcrasher.region = "street"
	self.jobs.mallcrasher.jc = 20
	self.jobs.mallcrasher.chain = {
		self.stages.mallcrasher
	}
	self.jobs.mallcrasher.load_screen = "guis/dlcs/pic/textures/loading/job_mallcrasher"
	self.jobs.mallcrasher.briefing_event = "vld_mallcrashers_brf"
	self.jobs.mallcrasher.debrief_event = "vld_mallcrashers_debrief"
	self.jobs.mallcrasher.crimenet_callouts = {
		"vld_mallcrashers_cnc_01"
	}
	self.jobs.mallcrasher.crimenet_videos = {
		"cn_mallcrash1",
		"cn_mallcrash2",
		"cn_mallcrash3"
	}
	self.jobs.mallcrasher.payout = {
		9000,
		18000,
		45000,
		90000,
		120000,
		120000,
		120000
	}
	self.jobs.mallcrasher.contract_cost = {
		8000,
		16000,
		40000,
		80000,
		100000,
		100000,
		100000
	}
	self.jobs.mallcrasher.contract_visuals = {}
	self.jobs.mallcrasher.contract_visuals.min_mission_xp = {
		6000,
		6000,
		6000,
		6000,
		6000,
		6000,
		6000
	}
	self.jobs.mallcrasher.contract_visuals.max_mission_xp = {
		6000,
		6000,
		6000,
		6000,
		6000,
		6000,
		6000
	}
	self.stages.branchbank_random = {
		level_id = "branchbank",
		mission = "standalone",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			4
		}
	}
	self.jobs.branchbank = {}
	self.jobs.branchbank.name_id = "heist_branchbank"
	self.jobs.branchbank.briefing_id = "heist_branchbank_crimenet"
	self.jobs.branchbank.package = "packages/job_branchbank_random"
	self.jobs.branchbank.contact = "bain"
	self.jobs.branchbank.region = "street"
	self.jobs.branchbank.jc = 30
	self.jobs.branchbank.chain = {
		self.stages.branchbank_random
	}
	self.jobs.branchbank.load_screen = "guis/dlcs/pic/textures/loading/job_branchbank"
	self.jobs.branchbank.briefing_event = "pln_branchbank_random_brf_speak"
	self.jobs.branchbank.debrief_event = nil
	self.jobs.branchbank.crimenet_callouts = {
		"pln_branchbank_random_cnc_01"
	}
	self.jobs.branchbank.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.branchbank.payout = {
		20000,
		30000,
		40000,
		70000,
		80000,
		80000,
		80000
	}
	self.jobs.branchbank.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.branchbank.contract_visuals = {}
	self.jobs.branchbank.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.branchbank.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.branchbank.variant_name = "heist_branchbank_hl_random"
	self.jobs.branchbank_prof = deep_clone(self.jobs.branchbank)
	self.jobs.branchbank_prof.jc = 30
	self.jobs.branchbank_prof.region = "professional"
	self.jobs.branchbank_prof.payout = {
		26000,
		40000,
		48000,
		70000,
		85000,
		85000,
		85000
	}
	self.jobs.branchbank_prof.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.stages.branchbank_deposit = {
		briefing_dialog = "Play_pln_branchbank_depositbox_stage1_brief",
		briefing_id = "heist_branchbank_deposit_briefing",
		level_id = "branchbank",
		mission = "standalone",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.branchbank_deposit = {}
	self.jobs.branchbank_deposit.name_id = "heist_branchbank_deposit"
	self.jobs.branchbank_deposit.briefing_id = "heist_branchbank_deposit_crimenet"
	self.jobs.branchbank_deposit.package = "packages/job_branchbank_deposit"
	self.jobs.branchbank_deposit.contact = "bain"
	self.jobs.branchbank_deposit.region = "street"
	self.jobs.branchbank_deposit.jc = 30
	self.jobs.branchbank_deposit.chain = {
		self.stages.branchbank_deposit
	}
	self.jobs.branchbank_deposit.load_screen = "guis/dlcs/pic/textures/loading/job_branchbank"
	self.jobs.branchbank_deposit.briefing_event = "pln_branchbank_depositbox_brf_speak"
	self.jobs.branchbank_deposit.debrief_event = nil
	self.jobs.branchbank_deposit.crimenet_callouts = {
		"pln_branchbank_deposit_cnc_01"
	}
	self.jobs.branchbank_deposit.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.branchbank_deposit.payout = {
		30000,
		35000,
		44000,
		68000,
		76000,
		76000,
		76000
	}
	self.jobs.branchbank_deposit.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.branchbank_deposit.contract_visuals = {}
	self.jobs.branchbank_deposit.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.branchbank_deposit.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.branchbank_deposit.variant_name = "heist_branchbank_hl_deposit"
	self.stages.branchbank_cash = {
		briefing_dialog = "Play_pln_branchbank_cash_stage1_brief",
		briefing_id = "heist_branchbank_cash_briefing",
		level_id = "branchbank",
		mission = "standalone",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			2
		}
	}
	self.jobs.branchbank_cash = {}
	self.jobs.branchbank_cash.name_id = "heist_branchbank_cash"
	self.jobs.branchbank_cash.briefing_id = "heist_branchbank_cash_crimenet"
	self.jobs.branchbank_cash.package = "packages/job_branchbank_cash"
	self.jobs.branchbank_cash.contact = "bain"
	self.jobs.branchbank_cash.region = "street"
	self.jobs.branchbank_cash.jc = 30
	self.jobs.branchbank_cash.chain = {
		self.stages.branchbank_cash
	}
	self.jobs.branchbank_cash.load_screen = "guis/dlcs/pic/textures/loading/job_branchbank"
	self.jobs.branchbank_cash.briefing_event = "pln_branchbank_cash_brf_speak"
	self.jobs.branchbank_cash.debrief_event = nil
	self.jobs.branchbank_cash.crimenet_callouts = {
		"pln_branchbank_cash_cnc_01"
	}
	self.jobs.branchbank_cash.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.branchbank_cash.payout = {
		10000,
		15000,
		40000,
		60000,
		75000,
		75000,
		75000
	}
	self.jobs.branchbank_cash.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.branchbank_cash.contract_visuals = {}
	self.jobs.branchbank_cash.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.branchbank_cash.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.branchbank_cash.variant_name = "heist_branchbank_hl_cash"
	self.stages.branchbank_gold = {
		briefing_dialog = "Play_pln_branchbank_gold_stage1_brief",
		briefing_id = "heist_branchbank_gold_briefing",
		level_id = "branchbank",
		mission = "standalone",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			3
		}
	}
	self.jobs.branchbank_gold = {}
	self.jobs.branchbank_gold.name_id = "heist_branchbank_gold"
	self.jobs.branchbank_gold.briefing_id = "heist_branchbank_gold_crimenet"
	self.jobs.branchbank_gold.package = "packages/job_branchbank_gold"
	self.jobs.branchbank_gold.contact = "bain"
	self.jobs.branchbank_gold.region = "street"
	self.jobs.branchbank_gold.jc = 30
	self.jobs.branchbank_gold.chain = {
		self.stages.branchbank_gold
	}
	self.jobs.branchbank_gold.load_screen = "guis/dlcs/pic/textures/loading/job_branchbank"
	self.jobs.branchbank_gold.briefing_event = "pln_branchbank_gold_brf_speak"
	self.jobs.branchbank_gold.debrief_event = nil
	self.jobs.branchbank_gold.crimenet_callouts = {
		"pln_branchbank_gold_cnc_01"
	}
	self.jobs.branchbank_gold.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.branchbank_gold.payout = {
		20000,
		25000,
		50000,
		75000,
		85000,
		85000,
		85000
	}
	self.jobs.branchbank_gold.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.branchbank_gold.contract_visuals = {}
	self.jobs.branchbank_gold.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.branchbank_gold.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.branchbank_gold.variant_name = "heist_branchbank_hl_gold"
	self.jobs.branchbank_gold_prof = deep_clone(self.jobs.branchbank_gold)
	self.jobs.branchbank_gold_prof.jc = 30
	self.jobs.branchbank_gold_prof.region = "professional"
	self.jobs.branchbank_gold_prof.payout = {
		26000,
		40000,
		54000,
		76000,
		90000,
		90000,
		90000
	}
	self.jobs.branchbank_gold_prof.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.stages.election_day_1 = {
		level_id = "election_day_1",
		type = "e",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.stages.election_day_2 = {
		level_id = "election_day_2",
		type = "e",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.stages.election_day_3 = {
		level_id = "election_day_3",
		type = "e",
		type_id = "heist_type_knockover",
		mission_filter = {
			1
		}
	}
	self.stages.election_day_3_skip1 = {
		level_id = "election_day_3_skip1",
		type = "e",
		type_id = "heist_type_knockover",
		mission_filter = {
			1
		}
	}
	self.stages.election_day_3_skip2 = {
		level_id = "election_day_3_skip2",
		type = "e",
		type_id = "heist_type_knockover",
		mission_filter = {
			1
		}
	}
	self.jobs.election_day = {}
	self.jobs.election_day.name_id = "heist_election_day"
	self.jobs.election_day.briefing_id = "heist_election_day_crimenet"
	self.jobs.election_day.package = "packages/job_election_day"
	self.jobs.election_day.contact = "the_elephant"
	self.jobs.election_day.jc = 40
	self.jobs.election_day.chain = {
		self.stages.election_day_1,
		{
			self.stages.election_day_2,
			self.stages.election_day_3,
			self.stages.election_day_3_skip1,
			self.stages.election_day_3_skip2
		}
	}
	self.jobs.election_day.load_screen = "guis/dlcs/pic/textures/loading/job_electionday_01"
	self.jobs.election_day.briefing_event = "elp_election_brf"
	self.jobs.election_day.debrief_event = "elp_election_debrief"
	self.jobs.election_day.crimenet_callouts = {
		"elp_election_cmc_01"
	}
	self.jobs.election_day.crimenet_videos = {
		"cn_elcday1",
		"cn_elcday2",
		"cn_elcday3"
	}
	self.jobs.election_day.payout = {
		20000,
		25000,
		40000,
		60000,
		90000,
		90000,
		90000
	}
	self.jobs.election_day.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.election_day.contract_visuals = {}
	self.jobs.election_day.contract_visuals.min_mission_xp = {
		10000,
		10000,
		10000,
		10000,
		10000,
		10000,
		10000
	}
	self.jobs.election_day.contract_visuals.max_mission_xp = {
		44000,
		44000,
		44000,
		44000,
		44000,
		44000,
		44000
	}
	self.stages.safehouse = {
		level_id = "safehouse",
		type = "d",
		type_id = "heist_type_assault",
		briefing_id = Global.mission_manager and Global.mission_manager.saved_job_values.playedSafeHouseBefore and "heist_safehouse_briefing_2" or nil
	}
	self.jobs.safehouse = {}
	self.jobs.safehouse.name_id = "heist_safehouse"
	self.jobs.safehouse.briefing_id = "heist_safehouse_crimenet"

	if IS_XB1 or IS_PS4 then
		self.jobs.safehouse.contact = "bain_no_variation"
	else
		self.jobs.safehouse.contact = "bain"
	end

	self.jobs.safehouse.jc = 5
	self.jobs.safehouse.chain = {
		self.stages.safehouse
	}
	self.jobs.safehouse.briefing_event = nil
	self.jobs.safehouse.debrief_event = nil
	self.jobs.safehouse.crimenet_callouts = {}
	self.jobs.arm_wrapper = {}
	self.jobs.arm_wrapper = {}
	self.jobs.arm_wrapper.name_id = "heist_arm_temp"
	self.jobs.arm_wrapper.briefing_id = "heist_arm_crimenet"
	self.jobs.arm_wrapper.contact = "bain"
	self.jobs.arm_wrapper.jc = 30
	self.jobs.arm_wrapper.chain = {
		{}
	}
	self.jobs.arm_wrapper.job_wrapper = {
		"arm_cro",
		"arm_und",
		"arm_hcm",
		"arm_par",
		"arm_fac"
	}
	self.jobs.arm_wrapper.briefing_event = "pln_at1_brf_01"
	self.jobs.arm_wrapper.crimenet_callouts = {
		"pln_at1_cnc_01"
	}
	self.jobs.arm_wrapper.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_wrapper.payout = {
		8500,
		11000,
		30000,
		32000,
		44000,
		44000,
		44000
	}
	self.jobs.arm_wrapper.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_wrapper.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.stages.arm_cro = {
		dlc = "armored_transport",
		level_id = "arm_cro",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			4
		}
	}
	self.jobs.arm_cro = {}
	self.jobs.arm_cro.name_id = "heist_arm_cro"
	self.jobs.arm_cro.briefing_id = "heist_arm_cro_crimenet"
	self.jobs.arm_cro.package = "packages/job_arm_cro"
	self.jobs.arm_cro.contact = "bain"
	self.jobs.arm_cro.region = "street"
	self.jobs.arm_cro.jc = 30
	self.jobs.arm_cro.chain = {
		self.stages.arm_cro
	}
	self.jobs.arm_cro.load_screen = "guis/dlcs/pic/textures/loading/job_crossroads"
	self.jobs.arm_cro.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_cro.debrief_event = nil
	self.jobs.arm_cro.crimenet_callouts = {
		"pln_at1_cnc_01_01"
	}
	self.jobs.arm_cro.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_cro.payout = {
		30500,
		34000,
		50000,
		62000,
		74000,
		74000,
		74000
	}
	self.jobs.arm_cro.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_cro.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.arm_cro.dlc = "armored_transport"
	self.jobs.arm_cro.spawn_chance_multiplier = 0.5
	self.jobs.arm_cro.contract_visuals = {}
	self.jobs.arm_cro.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.arm_cro.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.stages.arm_und = {
		dlc = "armored_transport",
		level_id = "arm_und",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			4
		}
	}
	self.jobs.arm_und = {}
	self.jobs.arm_und.name_id = "heist_arm_und"
	self.jobs.arm_und.briefing_id = "heist_arm_und_crimenet"
	self.jobs.arm_und.package = "packages/job_arm_und"
	self.jobs.arm_und.contact = "bain"
	self.jobs.arm_und.region = "street"
	self.jobs.arm_und.jc = 30
	self.jobs.arm_und.chain = {
		self.stages.arm_und
	}
	self.jobs.arm_und.load_screen = "guis/dlcs/pic/textures/loading/job_underpass"
	self.jobs.arm_und.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_und.debrief_event = nil
	self.jobs.arm_und.crimenet_callouts = {
		"pln_at1_cnc_05_01"
	}
	self.jobs.arm_und.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_und.payout = {
		27500,
		31000,
		48000,
		53000,
		66600,
		66600,
		66600
	}
	self.jobs.arm_und.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.arm_und.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_und.dlc = "armored_transport"
	self.jobs.arm_und.spawn_chance_multiplier = 0.5
	self.jobs.arm_und.contract_visuals = {}
	self.jobs.arm_und.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.arm_und.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.stages.arm_hcm = {
		dlc = "armored_transport",
		level_id = "arm_hcm",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			4
		}
	}
	self.jobs.arm_hcm = {}
	self.jobs.arm_hcm.name_id = "heist_arm_hcm"
	self.jobs.arm_hcm.briefing_id = "heist_arm_hcm_crimenet"
	self.jobs.arm_hcm.package = "packages/job_arm_hcm"
	self.jobs.arm_hcm.contact = "bain"
	self.jobs.arm_hcm.region = "street"
	self.jobs.arm_hcm.jc = 30
	self.jobs.arm_hcm.chain = {
		self.stages.arm_hcm
	}
	self.jobs.arm_hcm.load_screen = "guis/dlcs/pic/textures/loading/job_downtown"
	self.jobs.arm_hcm.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_hcm.debrief_event = nil
	self.jobs.arm_hcm.crimenet_callouts = {
		"pln_at1_cnc_02_01"
	}
	self.jobs.arm_hcm.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_hcm.payout = {
		26500,
		31000,
		50000,
		52000,
		64000,
		64000,
		64000
	}
	self.jobs.arm_hcm.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.arm_hcm.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_hcm.dlc = "armored_transport"
	self.jobs.arm_hcm.spawn_chance_multiplier = 0.5
	self.jobs.arm_hcm.contract_visuals = {}
	self.jobs.arm_hcm.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.arm_hcm.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.stages.arm_par = {
		dlc = "armored_transport",
		level_id = "arm_par",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			4
		}
	}
	self.jobs.arm_par = {}
	self.jobs.arm_par.name_id = "heist_arm_par"
	self.jobs.arm_par.briefing_id = "heist_arm_par_crimenet"
	self.jobs.arm_par.package = "packages/job_arm_par"
	self.jobs.arm_par.contact = "bain"
	self.jobs.arm_par.region = "street"
	self.jobs.arm_par.jc = 30
	self.jobs.arm_par.chain = {
		self.stages.arm_par
	}
	self.jobs.arm_par.load_screen = "guis/dlcs/pic/textures/loading/job_park"
	self.jobs.arm_par.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_par.debrief_event = nil
	self.jobs.arm_par.crimenet_callouts = {
		"pln_at1_cnc_04_01"
	}
	self.jobs.arm_par.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_par.payout = {
		28500,
		31000,
		40000,
		43000,
		56000,
		56000,
		56000
	}
	self.jobs.arm_par.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.arm_par.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_par.dlc = "armored_transport"
	self.jobs.arm_par.spawn_chance_multiplier = 0.5
	self.jobs.arm_par.contract_visuals = {}
	self.jobs.arm_par.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.arm_par.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.stages.arm_fac = {
		dlc = "armored_transport",
		level_id = "arm_fac",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			4
		}
	}
	self.jobs.arm_fac = {}
	self.jobs.arm_fac.name_id = "heist_arm_fac"
	self.jobs.arm_fac.briefing_id = "heist_arm_fac_crimenet"
	self.jobs.arm_fac.package = "packages/job_arm_fac"
	self.jobs.arm_fac.contact = "bain"
	self.jobs.arm_fac.region = "street"
	self.jobs.arm_fac.jc = 30
	self.jobs.arm_fac.chain = {
		self.stages.arm_fac
	}
	self.jobs.arm_fac.load_screen = "guis/dlcs/pic/textures/loading/job_harbor"
	self.jobs.arm_fac.briefing_event = "pln_at1_cbf_01"
	self.jobs.arm_fac.debrief_event = nil
	self.jobs.arm_fac.crimenet_callouts = {
		"pln_at1_cnc_03_01"
	}
	self.jobs.arm_fac.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.arm_fac.payout = {
		22500,
		29000,
		40000,
		42000,
		54000,
		54000,
		54000
	}
	self.jobs.arm_fac.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.arm_fac.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.arm_fac.dlc = "armored_transport"
	self.jobs.arm_fac.spawn_chance_multiplier = 0.5
	self.jobs.arm_fac.contract_visuals = {}
	self.jobs.arm_fac.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.arm_fac.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.stages.arm_for = {
		dlc = "armored_transport",
		level_id = "arm_for",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			4
		}
	}
	self.jobs.arm_for = {}
	self.jobs.arm_for.name_id = "heist_arm_for"
	self.jobs.arm_for.briefing_id = "heist_arm_for_crimenet"
	self.jobs.arm_for.contact = "bain"
	self.jobs.arm_for.region = "street"
	self.jobs.arm_for.jc = 70
	self.jobs.arm_for.package = "packages/job_arm_for"
	self.jobs.arm_for.chain = {
		self.stages.arm_for
	}
	self.jobs.arm_for.load_screen = "guis/dlcs/pic/textures/loading/job_trainheist"
	self.jobs.arm_for.briefing_event = "pln_tr1b_cbf_01"
	self.jobs.arm_for.debrief_event = nil
	self.jobs.arm_for.crimenet_callouts = {
		"pln_tr1b_cnc_01_01"
	}
	self.jobs.arm_for.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel1"
	}
	self.jobs.arm_for.payout = {
		26000,
		37000,
		81000,
		101000,
		202000,
		202000,
		202000
	}
	self.jobs.arm_for.experience_mul = {
		1,
		1,
		1,
		1.5,
		1.5
	}
	self.jobs.arm_for.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000,
		400000,
		400000
	}
	self.jobs.arm_for.dlc = "armored_transport"
	self.jobs.arm_for.contract_visuals = {}
	self.jobs.arm_for.contract_visuals.min_mission_xp = {
		20200,
		20200,
		20200,
		20200,
		20200,
		20200,
		20200
	}
	self.jobs.arm_for.contract_visuals.max_mission_xp = {
		36000,
		36000,
		36000,
		36000,
		36000,
		36000,
		36000
	}
	self.stages.rat = {
		level_id = "rat",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.rat = {}
	self.jobs.rat.name_id = "heist_rat"
	self.jobs.rat.briefing_id = "heist_rat_crimenet"
	self.jobs.rat.contact = "bain"
	self.jobs.rat.region = "street"
	self.jobs.rat.jc = 60
	self.jobs.rat.package = "packages/narr_rat"
	self.jobs.rat.chain = {
		self.stages.rat
	}
	self.jobs.rat.load_screen = "guis/dlcs/pic/textures/loading/job_cookoff"
	self.jobs.rat.briefing_event = "pln_rt1b_cbf_01"
	self.jobs.rat.debrief_event = {
		"Play_pln_rt1b_end_01",
		"Play_pln_rt1b_end_02",
		"Play_pln_rt1b_end_03",
		"Play_pln_rt1b_end_04"
	}
	self.jobs.rat.crimenet_callouts = {
		"pln_rt1b_cnc_01"
	}
	self.jobs.rat.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.rat.payout = {
		90000,
		135000,
		180000,
		310000,
		380000,
		380000,
		380000
	}
	self.jobs.rat.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000,
		600000,
		600000
	}
	self.jobs.rat.contract_visuals = {}
	self.jobs.rat.contract_visuals.min_mission_xp = {
		16000,
		16000,
		16000,
		16000,
		16000,
		16000,
		16000
	}
	self.jobs.rat.contract_visuals.max_mission_xp = {
		9600000,
		9600000,
		9600000,
		9600000,
		9600000,
		9600000,
		9600000
	}
	self.stages.family = {
		level_id = "family",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.family = {}
	self.jobs.family.name_id = "heist_family"
	self.jobs.family.briefing_id = "heist_family_crimenet"
	self.jobs.family.package = "packages/job_family"
	self.jobs.family.contact = "bain"
	self.jobs.family.region = "street"
	self.jobs.family.jc = 20
	self.jobs.family.chain = {
		self.stages.family
	}
	self.jobs.family.load_screen = "guis/dlcs/pic/textures/loading/job_diamondstore"
	self.jobs.family.briefing_event = "pln_fj1_cbf_01"
	self.jobs.family.debrief_event = nil
	self.jobs.family.crimenet_callouts = {
		"pln_fj1_cnc_01_01"
	}
	self.jobs.family.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel3"
	}
	self.jobs.family.payout = {
		6000,
		12000,
		30000,
		50000,
		60000,
		60000,
		60000
	}
	self.jobs.family.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.family.experience_mul = {
		1.5,
		1.5,
		1.5,
		1.5,
		1.5
	}
	self.jobs.family.contract_visuals = {}
	self.jobs.family.contract_visuals.min_mission_xp = {
		6000,
		6000,
		6000,
		6000,
		6000,
		6000,
		6000
	}
	self.jobs.family.contract_visuals.max_mission_xp = {
		20000,
		20000,
		20000,
		20000,
		20000,
		20000,
		20000
	}
	self.stages.big = {
		dlc = "big_bank",
		level_id = "big",
		type = "d",
		type_id = "heist_type_assault",
		world_setting = "day",
		mission_filter = {
			1
		}
	}
	self.jobs.big = {}
	self.jobs.big.name_id = "heist_big"
	self.jobs.big.briefing_id = "heist_big_crimenet"
	self.jobs.big.package = "packages/job_big"
	self.jobs.big.contact = "the_dentist"
	self.jobs.big.region = "street"
	self.jobs.big.jc = 60
	self.jobs.big.chain = {
		self.stages.big
	}
	self.jobs.big.load_screen = "guis/dlcs/pic/textures/loading/job_bigbank"
	self.jobs.big.briefing_event = "gus_bb1_cbf_01"
	self.jobs.big.debrief_event = "gus_bb1_debrief_01"
	self.jobs.big.crimenet_callouts = {
		"gus_bb1_cnc_01"
	}
	self.jobs.big.crimenet_videos = {
		"cn_big1",
		"cn_big2",
		"cn_big3"
	}
	self.jobs.big.payout = {
		90000,
		135000,
		180000,
		310000,
		380000,
		380000,
		380000
	}
	self.jobs.big.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000,
		600000,
		600000
	}
	self.jobs.big.dlc = "big_bank"
	self.jobs.big.contract_visuals = {}
	self.jobs.big.contract_visuals.min_mission_xp = {
		34000,
		34000,
		34000,
		34000,
		34000,
		34000,
		34000
	}
	self.jobs.big.contract_visuals.max_mission_xp = {
		45000,
		45000,
		45000,
		45000,
		45000,
		45000,
		45000
	}
	self.stages.roberts = {
		level_id = "roberts",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.roberts = {}
	self.jobs.roberts.name_id = "heist_roberts"
	self.jobs.roberts.briefing_id = "heist_roberts_crimenet"
	self.jobs.roberts.package = "packages/job_roberts"
	self.jobs.roberts.contact = "bain"
	self.jobs.roberts.region = "street"
	self.jobs.roberts.jc = 40
	self.jobs.roberts.chain = {
		self.stages.roberts
	}
	self.jobs.roberts.load_screen = "guis/dlcs/pic/textures/loading/job_go_bank"
	self.jobs.roberts.briefing_event = "pln_cs1_cbf_01"
	self.jobs.roberts.debrief_event = nil
	self.jobs.roberts.crimenet_callouts = {
		"pln_cs1_cnc_01"
	}
	self.jobs.roberts.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel3"
	}
	self.jobs.roberts.payout = {
		55000,
		110000,
		275000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.roberts.experience_mul = {
		1,
		1,
		1,
		1.2,
		1.2
	}
	self.jobs.roberts.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.roberts.contract_visuals = {}
	self.jobs.roberts.contract_visuals.min_mission_xp = {
		6500,
		6500,
		6500,
		6500,
		6500,
		6500,
		6500
	}
	self.jobs.roberts.contract_visuals.max_mission_xp = {
		22000,
		22000,
		22000,
		22000,
		22000,
		22000,
		22000
	}
	self.stages.kosugi = {
		level_id = "kosugi",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.kosugi = {}
	self.jobs.kosugi.name_id = "heist_kosugi"
	self.jobs.kosugi.briefing_id = "heist_kosugi_crimenet"
	self.jobs.kosugi.contact = "bain"
	self.jobs.kosugi.region = "street"
	self.jobs.kosugi.jc = 30
	self.jobs.kosugi.package = "packages/narr_kosugi"
	self.jobs.kosugi.chain = {
		self.stages.kosugi
	}
	self.jobs.kosugi.load_screen = "guis/dlcs/pic/textures/loading/job_shadow_raid"
	self.jobs.kosugi.briefing_event = "pln_ko1_cbf_01"
	self.jobs.kosugi.debrief_event = nil
	self.jobs.kosugi.crimenet_callouts = {
		"pln_ko1_cnc_01"
	}
	self.jobs.kosugi.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.kosugi.contract_cost = {
		0,
		0,
		0,
		100000,
		130000,
		130000,
		130000
	}
	self.jobs.kosugi.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.kosugi.payout = {
		10000,
		20000,
		30000,
		40000,
		80000,
		80000,
		80000
	}
	self.jobs.kosugi.experience_mul = {
		1,
		1,
		1,
		1.5,
		1.8
	}
	self.jobs.kosugi.contract_visuals = {}
	self.jobs.kosugi.contract_visuals.min_mission_xp = {
		5500,
		5500,
		5500,
		5500,
		5500,
		5500,
		5500
	}
	self.jobs.kosugi.contract_visuals.max_mission_xp = {
		22000,
		22000,
		22000,
		22000,
		22000,
		22000,
		22000
	}
	self.stages.mia_1 = {
		dlc = "hl_miami",
		level_id = "mia_1",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.stages.mia_2 = {
		dlc = "hl_miami",
		level_id = "mia_2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.mia = {}
	self.jobs.mia.name_id = "heist_mia"
	self.jobs.mia.briefing_id = "heist_mia_crimenet"
	self.jobs.mia.contact = "the_dentist"
	self.jobs.mia.region = "street"
	self.jobs.mia.jc = 60
	self.jobs.mia.package = "packages/narr_mia"
	self.jobs.mia.chain = {
		self.stages.mia_1,
		self.stages.mia_2
	}
	self.jobs.mia.load_screen = "guis/dlcs/pic/textures/loading/job_hlm_01"
	self.jobs.mia.briefing_event = "dentist_hm1_cnc_01"
	self.jobs.mia.debrief_event = "dentist_hm1_debrief_01_01"
	self.jobs.mia.crimenet_callouts = {
		"dentist_hm1_cnc_01"
	}
	self.jobs.mia.crimenet_videos = {
		"cn_hlm1",
		"cn_hlm2",
		"cn_hlm3",
		"cn_big1",
		"cn_big2",
		"cn_big3"
	}
	self.jobs.mia.dlc = "hl_miami"
	self.jobs.mia.payout = {
		37000,
		43000,
		60000,
		70000,
		80000,
		80000,
		80000
	}
	self.jobs.mia.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.mia.experience_mul = {
		1.4,
		1.4,
		1.4,
		1.4,
		1.4
	}
	self.jobs.mia.contract_visuals = {}
	self.jobs.mia.contract_visuals.min_mission_xp = {
		40000,
		40000,
		40000,
		40000,
		40000,
		40000,
		40000
	}
	self.jobs.mia.contract_visuals.max_mission_xp = {
		69000,
		69000,
		69000,
		69000,
		69000,
		69000,
		69000
	}
	self.stages.gallery = {
		dlc = "pd2_clan",
		level_id = "gallery",
		type = "e",
		type_id = "heist_type_knockover",
		mission_filter = {
			2
		}
	}
	self.jobs.gallery = {}
	self.jobs.gallery.name_id = "heist_gallery"
	self.jobs.gallery.briefing_id = "heist_gallery_crimenet"
	self.jobs.gallery.package = "packages/job_big"
	self.jobs.gallery.contact = "bain"
	self.jobs.gallery.region = "street"
	self.jobs.gallery.jc = 20
	self.jobs.gallery.chain = {
		self.stages.gallery
	}
	self.jobs.gallery.load_screen = "guis/dlcs/pic/textures/loading/job_gallery"
	self.jobs.gallery.briefing_event = "pln_art_cbf_01"
	self.jobs.gallery.debrief_event = nil
	self.jobs.gallery.crimenet_callouts = {
		"pln_art_cnc_01"
	}
	self.jobs.gallery.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.gallery.payout = {
		6000,
		12500,
		40000,
		60000,
		80000,
		80000,
		80000
	}
	self.jobs.gallery.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.gallery.dlc = "pd2_clan"
	self.jobs.gallery.contract_visuals = {}
	self.jobs.gallery.contract_visuals.min_mission_xp = {
		5000,
		5000,
		5000,
		5000,
		5000,
		5000,
		5000
	}
	self.jobs.gallery.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.stages.hox_1 = {
		dlc = "pd2_clan",
		level_id = "hox_1",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.stages.hox_2 = {
		dlc = "pd2_clan",
		level_id = "hox_2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.hox = {}
	self.jobs.hox.name_id = "heist_hox"
	self.jobs.hox.briefing_id = "heist_hox_crimenet"
	self.jobs.hox.contact = "the_dentist"
	self.jobs.hox.region = "street"
	self.jobs.hox.jc = 60
	self.jobs.hox.chain = {
		self.stages.hox_1,
		self.stages.hox_2
	}
	self.jobs.hox.load_screen = "guis/dlcs/pic/textures/loading/job_breakout_01"
	self.jobs.hox.briefing_event = "dentist_hb1_cbf_01"
	self.jobs.hox.debrief_event = nil
	self.jobs.hox.crimenet_callouts = {
		"dentist_hb1_cnc_01"
	}
	self.jobs.hox.crimenet_videos = {
		"cn_hox1",
		"cn_hox2",
		"cn_hox3",
		"cn_hox4",
		"cn_big1",
		"cn_big2",
		"cn_big3"
	}
	self.jobs.hox.payout = {
		250000,
		500000,
		1250000,
		2500000,
		3200000,
		3200000,
		3200000
	}
	self.jobs.hox.dlc = "pd2_clan"
	self.jobs.hox.experience_mul = {
		2.14,
		2.14,
		2.14,
		2.14,
		2.14
	}
	self.jobs.hox.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.hox.contract_visuals = {}
	self.jobs.hox.contract_visuals.min_mission_xp = {
		48800,
		48800,
		48800,
		48800,
		48800,
		48800,
		48800
	}
	self.jobs.hox.contract_visuals.max_mission_xp = {
		53400,
		53400,
		53400,
		53400,
		53400,
		53400,
		53400
	}
	self.stages.pines = {
		level_id = "pines",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.pines = {}
	self.jobs.pines.name_id = "heist_pines"
	self.jobs.pines.briefing_id = "heist_pines_crimenet"
	self.jobs.pines.package = "packages/job_pines"
	self.jobs.pines.contact = "vlad"
	self.jobs.pines.region = "street"
	self.jobs.pines.jc = 40
	self.jobs.pines.chain = {
		self.stages.pines
	}
	self.jobs.pines.load_screen = "guis/dlcs/pic/textures/loading/job_whitexmas"
	self.jobs.pines.briefing_event = "vld_cp1_cbf_01"
	self.jobs.pines.debrief_event = nil
	self.jobs.pines.crimenet_callouts = {
		"vld_cp1_cnc_01"
	}
	self.jobs.pines.crimenet_videos = {
		"cn_ukr1",
		"cn_ukr2",
		"cn_ukr3"
	}
	self.jobs.pines.payout = {
		8000,
		16000,
		40000,
		80000,
		100000,
		100000,
		100000
	}
	self.jobs.pines.experience_mul = {
		1,
		1,
		1,
		1,
		1
	}
	self.jobs.pines.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.pines.contract_visuals = {}
	self.jobs.pines.contract_visuals.min_mission_xp = {
		8000,
		8000,
		8000,
		8000,
		8000,
		8000,
		8000
	}
	self.jobs.pines.contract_visuals.max_mission_xp = {
		2408000,
		2408000,
		2408000,
		2408000,
		2408000,
		2408000,
		2408000
	}
	self.stages.mus = {
		dlc = "hope_diamond",
		level_id = "mus",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.mus = {}
	self.jobs.mus.name_id = "heist_mus"
	self.jobs.mus.briefing_id = "heist_mus_crimenet"
	self.jobs.mus.package = "packages/job_mus"
	self.jobs.mus.contact = "the_dentist"
	self.jobs.mus.region = "street"
	self.jobs.mus.jc = 50
	self.jobs.mus.chain = {
		self.stages.mus
	}
	self.jobs.mus.load_screen = "guis/dlcs/pic/textures/loading/job_diamond"
	self.jobs.mus.briefing_event = "dentist_hd1_cbf_01"
	self.jobs.mus.debrief_event = {
		"dentist_hd1_debrief_01",
		"dentist_hd1_debrief_02"
	}
	self.jobs.mus.crimenet_callouts = {
		"dentist_hd1_cnc_01_01"
	}
	self.jobs.mus.crimenet_videos = {
		"cn_hox1",
		"cn_hox2",
		"cn_hox3",
		"cn_hox4",
		"cn_big1",
		"cn_big2",
		"cn_big3"
	}
	self.jobs.mus.payout = {
		8000,
		16000,
		40000,
		80000,
		100000,
		100000,
		100000
	}
	self.jobs.mus.dlc = "hope_diamond"
	self.jobs.mus.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.mus.contract_visuals = {}
	self.jobs.mus.contract_visuals.min_mission_xp = {
		17000,
		17000,
		17000,
		17000,
		17000,
		17000,
		17000
	}
	self.jobs.mus.contract_visuals.max_mission_xp = {
		36000,
		36000,
		36000,
		36000,
		36000,
		36000,
		36000
	}
	self.stages.cage = {
		level_id = "cage",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.cage = {}
	self.jobs.cage.name_id = "heist_cage"
	self.jobs.cage.briefing_id = "heist_cage_crimenet"
	self.jobs.cage.package = "packages/narr_cage"
	self.jobs.cage.contact = "bain"
	self.jobs.cage.region = "street"
	self.jobs.cage.jc = 30
	self.jobs.cage.chain = {
		self.stages.cage
	}
	self.jobs.cage.load_screen = "guis/dlcs/pic/textures/loading/job_carshop"
	self.jobs.cage.briefing_event = "pln_ch1_cbf_01"
	self.jobs.cage.debrief_event = "pln_ch1_end_01"
	self.jobs.cage.crimenet_callouts = {
		"pln_ch1_cnc_01_01"
	}
	self.jobs.cage.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel3"
	}
	self.jobs.cage.payout = {
		20000,
		30000,
		40000,
		70000,
		80000,
		80000,
		80000
	}
	self.jobs.cage.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.cage.contract_visuals = {}
	self.jobs.cage.contract_visuals.min_mission_xp = {
		10000,
		10000,
		10000,
		10000,
		10000,
		10000,
		10000
	}
	self.jobs.cage.contract_visuals.max_mission_xp = {
		13000,
		13000,
		13000,
		13000,
		13000,
		13000,
		13000
	}
	self.stages.hox_3 = {
		level_id = "hox_3",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.hox_3 = {}
	self.jobs.hox_3.name_id = "heist_hox_3"
	self.jobs.hox_3.briefing_id = "heist_hox_3_crimenet"
	self.jobs.hox_3.package = "packages/job_hox"
	self.jobs.hox_3.contact = "the_dentist"
	self.jobs.hox_3.region = "street"
	self.jobs.hox_3.jc = 40
	self.jobs.hox_3.chain = {
		self.stages.hox_3
	}
	self.jobs.hox_3.load_screen = "guis/dlcs/pic/textures/loading/job_hoxtonrevenge"
	self.jobs.hox_3.briefing_event = "hoxton_hb3_cbf_01"
	self.jobs.hox_3.debrief_event = "hoxton_hb3_debrief_01"
	self.jobs.hox_3.crimenet_callouts = {
		"hoxton_hb3_cnc_01_01"
	}
	self.jobs.hox_3.crimenet_videos = {
		"cn_hox1",
		"cn_hox2",
		"cn_hox3",
		"cn_hox4",
		"cn_big1",
		"cn_big2",
		"cn_big3"
	}
	self.jobs.hox_3.payout = {
		8000,
		16000,
		40000,
		80000,
		100000,
		100000,
		100000
	}
	self.jobs.hox_3.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.hox_3.contract_visuals = {}
	self.jobs.hox_3.contract_visuals.min_mission_xp = {
		20000,
		20000,
		20000,
		20000,
		20000,
		20000,
		20000
	}
	self.jobs.hox_3.contract_visuals.max_mission_xp = {
		26000,
		26000,
		26000,
		26000,
		26000,
		26000,
		26000
	}
	self.stages.crojob1 = {
		dlc = "the_bomb",
		level_id = "crojob2",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.crojob1 = {}
	self.jobs.crojob1.name_id = "heist_crojob1"
	self.jobs.crojob1.briefing_id = "heist_crojob1_crimenet"
	self.jobs.crojob1.package = "packages/job_crojob"
	self.jobs.crojob1.contact = "the_butcher"
	self.jobs.crojob1.jc = 60
	self.jobs.crojob1.chain = {
		self.stages.crojob1
	}
	self.jobs.crojob1.load_screen = "guis/dlcs/pic/textures/loading/job_bomb_dockyard"
	self.jobs.crojob1.briefing_event = "butcher_cr1_cbf_02"
	self.jobs.crojob1.debrief_event = {
		"butcher_cr1_debrief_01",
		"butcher_cr1_debrief_02"
	}
	self.jobs.crojob1.crimenet_callouts = {
		"butcher_cr1_cnc_01"
	}
	self.jobs.crojob1.crimenet_videos = {
		"cn_cro1",
		"cn_cro2",
		"cn_cro3"
	}
	self.jobs.crojob1.payout = {
		8000,
		16000,
		40000,
		80000,
		100000,
		100000,
		100000
	}
	self.jobs.crojob1.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.crojob1.experience_mul = {
		1.1,
		1.1,
		1.1,
		1.1,
		1.1
	}
	self.jobs.crojob1.dlc = "the_bomb"
	self.jobs.crojob1.contract_visuals = {}
	self.jobs.crojob1.contract_visuals.min_mission_xp = {
		18000,
		18000,
		18000,
		18000,
		18000,
		18000,
		18000
	}
	self.jobs.crojob1.contract_visuals.max_mission_xp = {
		33500,
		33500,
		33500,
		33500,
		33500,
		33500,
		33500
	}
	self.jobs.crojob_wrapper = {}
	self.jobs.crojob_wrapper.name_id = "heist_crojob2"
	self.jobs.crojob_wrapper.briefing_id = "heist_crojob2_crimenet"
	self.jobs.crojob_wrapper.contact = "the_butcher"
	self.jobs.crojob_wrapper.jc = 60
	self.jobs.crojob_wrapper.chain = {
		{}
	}
	self.jobs.crojob_wrapper.job_wrapper = {
		"crojob2",
		"crojob2_night"
	}
	self.jobs.crojob_wrapper.wrapper_weights = {
		9,
		1
	}
	self.jobs.crojob_wrapper.briefing_event = "butcher_cr1_cbf_03"
	self.jobs.crojob_wrapper.debrief_event = "butcher_cr1_debrief_03"
	self.jobs.crojob_wrapper.crimenet_callouts = {
		"butcher_cr1_cnc_01"
	}
	self.jobs.crojob_wrapper.crimenet_videos = {
		"cn_cro1",
		"cn_cro1",
		"cn_cro1"
	}
	self.jobs.crojob_wrapper.payout = {
		8000,
		16000,
		40000,
		80000,
		100000,
		100000,
		100000
	}
	self.jobs.crojob_wrapper.experience_mul = {
		1.4,
		1.4,
		1.4,
		1.4,
		1.4
	}
	self.jobs.crojob_wrapper.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.crojob_wrapper.load_screen = "guis/dlcs/pic/textures/loading/job_bomb_forest"
	self.jobs.crojob_wrapper.contract_visuals = {}
	self.jobs.crojob_wrapper.contract_visuals.min_mission_xp = {
		34000,
		34000,
		34000,
		34000,
		34000,
		34000,
		34000
	}
	self.jobs.crojob_wrapper.contract_visuals.max_mission_xp = {
		41500,
		41500,
		41500,
		41500,
		41500,
		41500,
		41500
	}
	self.jobs.crojob_wrapper.dlc = "the_bomb"
	self.stages.crojob2_d = {
		dlc = "the_bomb",
		level_id = "crojob3",
		type = "d",
		type_id = "heist_type_survive",
		world_setting = "day"
	}
	self.stages.crojob2_n = {
		dlc = "the_bomb",
		level_id = "crojob3_night",
		type = "d",
		type_id = "heist_type_survive",
		world_setting = "night"
	}
	self.jobs.crojob2 = {}
	self.jobs.crojob2.package = "packages/job_crojob"
	self.jobs.crojob2.chain = {
		self.stages.crojob2_d
	}
	self.jobs.crojob2_night = deep_clone(self.jobs.crojob2)
	self.jobs.crojob2_night.chain = {
		self.stages.crojob2_n
	}
	self.stages.shoutout_raid = {
		level_id = "shoutout_raid",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.shoutout_raid = {}
	self.jobs.shoutout_raid.name_id = "heist_shoutout_raid"
	self.jobs.shoutout_raid.briefing_id = "heist_shoutout_raid_crimenet"
	self.jobs.shoutout_raid.package = "packages/narr_shoutout"
	self.jobs.shoutout_raid.contact = "vlad"
	self.jobs.shoutout_raid.region = "street"
	self.jobs.shoutout_raid.jc = 30
	self.jobs.shoutout_raid.chain = {
		self.stages.shoutout_raid
	}
	self.jobs.shoutout_raid.load_screen = "guis/dlcs/pic/textures/loading/job_meltdown"
	self.jobs.shoutout_raid.briefing_event = "vld_ko1b_cbf_01_01"
	self.jobs.shoutout_raid.debrief_event = nil
	self.jobs.shoutout_raid.crimenet_callouts = {
		"vld_ko1b_cnc_01_01"
	}
	self.jobs.shoutout_raid.crimenet_videos = {
		"cn_ukr1",
		"cn_ukr2",
		"cn_ukr3"
	}
	self.jobs.shoutout_raid.payout = {
		26000,
		37000,
		81000,
		101000,
		202000,
		202000,
		202000
	}
	self.jobs.shoutout_raid.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.shoutout_raid.contract_visuals = {}
	self.jobs.shoutout_raid.contract_visuals.min_mission_xp = {
		20000,
		20000,
		20000,
		20000,
		20000,
		20000,
		20000
	}
	self.jobs.shoutout_raid.contract_visuals.max_mission_xp = {
		34000,
		34000,
		34000,
		34000,
		34000,
		34000,
		34000
	}
	self.stages.arena = {
		dlc = "arena",
		level_id = "arena",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.arena = {}
	self.jobs.arena.name_id = "heist_arena"
	self.jobs.arena.briefing_id = "heist_arena_crimenet"
	self.jobs.arena.contact = "bain"
	self.jobs.arena.region = "street"
	self.jobs.arena.jc = 60
	self.jobs.arena.chain = {
		self.stages.arena
	}
	self.jobs.arena.load_screen = "guis/dlcs/pic/textures/loading/job_alesso"
	self.jobs.arena.briefing_event = "pln_al1_cbf_01_01"
	self.jobs.arena.debrief_event = nil
	self.jobs.arena.crimenet_callouts = {
		"pln_al1_cnc_01_01"
	}
	self.jobs.arena.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.arena.payout = {
		93000,
		186000,
		465000,
		930000,
		1209000,
		1209000,
		1209000
	}
	self.jobs.arena.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.arena.dlc = "arena"
	self.jobs.arena.contract_visuals = {}
	self.jobs.arena.contract_visuals.min_mission_xp = {
		19500,
		19500,
		19500,
		19500,
		19500,
		19500,
		19500
	}
	self.jobs.arena.contract_visuals.max_mission_xp = {
		51600,
		51600,
		51600,
		51600,
		51600,
		51600,
		51600
	}
	self.stages.kenaz = {
		dlc = "kenaz",
		level_id = "kenaz",
		type = "e",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.kenaz = {}
	self.jobs.kenaz.name_id = "heist_kenaz_full"
	self.jobs.kenaz.briefing_id = "heist_kenaz_crimenet"
	self.jobs.kenaz.package = "packages/job_kenaz"
	self.jobs.kenaz.contact = "the_dentist"
	self.jobs.kenaz.jc = 70
	self.jobs.kenaz.chain = {
		self.stages.kenaz
	}
	self.jobs.kenaz.load_screen = "guis/dlcs/pic/textures/loading/job_casino"
	self.jobs.kenaz.briefing_event = "dentist_ca1_cbf_01"
	self.jobs.kenaz.debrief_event = {
		"dentist_ca1_debrief_01",
		"dentist_ca1_debrief_02"
	}
	self.jobs.kenaz.intro_event = {
		"Play_pln_ca1_intro_01",
		"Play_pln_ca1_intro_02"
	}
	self.jobs.kenaz.crimenet_callouts = {
		"dentist_ca1_cnc_01_01"
	}
	self.jobs.kenaz.crimenet_videos = {
		"cn_big1",
		"cn_big1",
		"cn_big1"
	}
	self.jobs.kenaz.payout = {
		10000,
		20000,
		50000,
		100000,
		130000,
		130000,
		130000
	}
	self.jobs.kenaz.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.kenaz.dlc = "kenaz"
	self.jobs.kenaz.contract_visuals = {}
	self.jobs.kenaz.contract_visuals.min_mission_xp = {
		39250,
		39250,
		39250,
		39250,
		39250,
		39250,
		39250
	}
	self.jobs.kenaz.contract_visuals.max_mission_xp = {
		67500,
		67500,
		67500,
		67500,
		67500,
		67500,
		67500
	}
	self.stages.jolly = {
		level_id = "jolly",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.jolly = {}
	self.jobs.jolly.name_id = "heist_jolly"
	self.jobs.jolly.briefing_id = "heist_jolly_crimenet"
	self.jobs.jolly.package = "packages/jolly"
	self.jobs.jolly.contact = "vlad"
	self.jobs.jolly.region = "street"
	self.jobs.jolly.jc = 30
	self.jobs.jolly.chain = {
		self.stages.jolly
	}
	self.jobs.jolly.load_screen = "guis/dlcs/pic/textures/loading/job_aftershock"
	self.jobs.jolly.contract_visuals = {}
	self.jobs.jolly.contract_visuals.min_mission_xp = {
		30000,
		30000,
		30000,
		30000,
		30000,
		30000,
		30000
	}
	self.jobs.jolly.contract_visuals.max_mission_xp = {
		34000,
		34000,
		34000,
		34000,
		34000,
		34000,
		34000
	}
	self.jobs.jolly.briefing_event = "vld_as1_cbf_01"
	self.jobs.jolly.debrief_event = "vld_as1_17"
	self.jobs.jolly.crimenet_callouts = {
		"vld_as1_cnc_01"
	}
	self.jobs.jolly.crimenet_videos = {
		"cn_ukr1",
		"cn_ukr2",
		"cn_ukr3"
	}
	self.jobs.jolly.payout = {
		124000,
		248000,
		620000,
		1150000,
		1600000,
		1600000,
		1600000
	}
	self.jobs.jolly.contract_cost = {
		105000,
		150000,
		550000,
		1050000,
		1400000,
		1400000,
		1400000
	}
	self.stages.red2 = {
		level_id = "red2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.red2 = {}
	self.jobs.red2.name_id = "heist_red2"
	self.jobs.red2.briefing_id = "heist_red2_crimenet"
	self.jobs.red2.package = "packages/narr_red2"
	self.jobs.red2.contact = "classic"
	self.jobs.red2.region = "street"
	self.jobs.red2.jc = 60
	self.jobs.red2.chain = {
		self.stages.red2
	}
	self.jobs.red2.load_screen = "guis/dlcs/pic/textures/loading/job_fwb"
	self.jobs.red2.briefing_event = "pln_fwb_cbf_01"
	self.jobs.red2.debrief_event = "pln_fwb_34"
	self.jobs.red2.crimenet_callouts = {
		"pln_fwb_cnc_01",
		"pln_fwb_cnc_01",
		"pln_fwb_cnc_01"
	}
	self.jobs.red2.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.red2.payout = {
		100000,
		200000,
		500000,
		1000000,
		1300000,
		1300000,
		1300000
	}
	self.jobs.red2.contract_cost = {
		80000,
		150000,
		400000,
		850000,
		1000000,
		1000000,
		1000000
	}
	self.jobs.red2.contract_visuals = {}
	self.jobs.red2.contract_visuals.min_mission_xp = {
		17500,
		17500,
		17500,
		17500,
		17500,
		17500,
		17500
	}
	self.jobs.red2.contract_visuals.max_mission_xp = {
		34000,
		34000,
		34000,
		34000,
		34000,
		34000,
		34000
	}
	self.stages.dinner = {
		level_id = "dinner",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.dinner = {}
	self.jobs.dinner.name_id = "heist_dinner"
	self.jobs.dinner.briefing_id = "heist_dinner_crimenet"
	self.jobs.dinner.package = "packages/narr_dinner"
	self.jobs.dinner.contact = "classic"
	self.jobs.dinner.region = "street"
	self.jobs.dinner.jc = 30
	self.jobs.dinner.chain = {
		self.stages.dinner
	}
	self.jobs.dinner.load_screen = "guis/dlcs/pic/textures/loading/job_slaughterhouse"
	self.jobs.dinner.briefing_event = "pln_dn1_cbf_01"
	self.jobs.dinner.debrief_event = "pln_dn1_31"
	self.jobs.dinner.crimenet_callouts = {
		"pln_dn1_cnc_01"
	}
	self.jobs.dinner.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.dinner.payout = {
		120000,
		240000,
		600000,
		1100000,
		1500000,
		1500000,
		1500000
	}
	self.jobs.dinner.contract_cost = {
		80000,
		150000,
		400000,
		850000,
		1000000,
		1000000,
		1000000
	}
	self.jobs.dinner.contract_visuals = {}
	self.jobs.dinner.contract_visuals.min_mission_xp = {
		34000,
		34000,
		34000,
		34000,
		34000,
		34000,
		34000
	}
	self.jobs.dinner.contract_visuals.max_mission_xp = {
		40000,
		40000,
		40000,
		40000,
		40000,
		40000,
		40000
	}
	self.stages.pbr = {
		dlc = "berry",
		level_id = "pbr",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.pbr = {}
	self.jobs.pbr.name_id = "heist_pbr"
	self.jobs.pbr.briefing_id = "heist_pbr_crimenet"
	self.jobs.pbr.package = "packages/narr_jerry1"
	self.jobs.pbr.contact = "locke"
	self.jobs.pbr.region = "street"
	self.jobs.pbr.dlc = "berry"
	self.jobs.pbr.jc = 30
	self.jobs.pbr.chain = {
		self.stages.pbr
	}
	self.jobs.pbr.load_screen = "guis/dlcs/pic/textures/loading/job_beneath_the_mountain"
	self.jobs.pbr.briefing_event = "loc_jr1_cbf_01"
	self.jobs.pbr.debrief_event = nil
	self.jobs.pbr.crimenet_callouts = {
		"loc_jr1_cnc_01"
	}
	self.jobs.pbr.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.pbr.payout = {
		60000,
		74000,
		125000,
		185000,
		260000,
		260000,
		260000
	}
	self.jobs.pbr.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000,
		400000,
		400000
	}
	self.jobs.pbr.contract_visuals = {}
	self.jobs.pbr.contract_visuals.min_mission_xp = {
		22400,
		22400,
		22400,
		22400,
		22400,
		22400,
		22400
	}
	self.jobs.pbr.contract_visuals.max_mission_xp = {
		32000,
		32000,
		32000,
		32000,
		32000,
		32000,
		32000
	}
	self.stages.pbr2 = {
		dlc = "berry",
		level_id = "pbr2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.pbr2 = {}
	self.jobs.pbr2.name_id = "heist_pbr2"
	self.jobs.pbr2.briefing_id = "heist_pbr2_crimenet"
	self.jobs.pbr2.package = "packages/narr_jerry2"
	self.jobs.pbr2.contact = "locke"
	self.jobs.pbr2.region = "street"
	self.jobs.pbr2.dlc = "berry"
	self.jobs.pbr2.jc = 30
	self.jobs.pbr2.chain = {
		self.stages.pbr2
	}
	self.jobs.pbr2.load_screen = "guis/dlcs/pic/textures/loading/job_birth_of_sky"
	self.jobs.pbr2.briefing_event = "loc_jr2_cbf_01"
	self.jobs.pbr2.debrief_event = nil
	self.jobs.pbr2.crimenet_callouts = {
		"loc_jr2_cnc_01"
	}
	self.jobs.pbr2.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.pbr2.payout = {
		115000,
		230000,
		575000,
		1150000,
		1500000,
		1500000,
		1500000
	}
	self.jobs.pbr2.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000,
		400000,
		400000
	}
	self.jobs.pbr2.contract_visuals = {}
	self.jobs.pbr2.contract_visuals.min_mission_xp = {
		31100,
		31100,
		31100,
		31100,
		31100,
		31100,
		31100
	}
	self.jobs.pbr2.contract_visuals.max_mission_xp = {
		31100,
		31100,
		31100,
		31100,
		31100,
		31100,
		31100
	}
	self.stages.pal = {
		dlc = "pal",
		level_id = "pal",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.pal = {}
	self.jobs.pal.name_id = "heist_pal"
	self.jobs.pal.briefing_id = "heist_pal_crimenet"
	self.jobs.pal.package = "packages/job_pal"
	self.jobs.pal.contact = "classic"
	self.jobs.pal.region = "street"
	self.jobs.pal.dlc = "pal"
	self.jobs.pal.jc = 30
	self.jobs.pal.chain = {
		self.stages.pal
	}
	self.jobs.branchbank.contract_visuals.preview_image = {
		icon = "branchbank"
	}
	self.jobs.pal.load_screen = "guis/dlcs/pic/textures/loading/job_counterfeit"
	self.jobs.pal.briefing_event = "pln_pal_cbf_01"
	self.jobs.pal.debrief_event = nil
	self.jobs.pal.crimenet_callouts = {
		"pln_pal_cnc_01"
	}
	self.jobs.pal.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.pal.payout = {
		115000,
		230000,
		575000,
		1150000,
		1500000,
		1500000,
		1500000
	}
	self.jobs.pal.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000,
		400000,
		400000
	}
	self.jobs.pal.contract_visuals = {}
	self.jobs.pal.contract_visuals.min_mission_xp = {
		21000,
		21000,
		21000,
		21000,
		21000,
		21000,
		21000
	}
	self.jobs.pal.contract_visuals.max_mission_xp = {
		3621000,
		3621000,
		3621000,
		3621000,
		3621000,
		3621000,
		3621000
	}
	self.stages.cane = {
		level_id = "cane",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.cane = {}
	self.jobs.cane.name_id = "heist_cane"
	self.jobs.cane.briefing_id = "heist_cane_crimenet"
	self.jobs.cane.package = "packages/cane"
	self.jobs.cane.contact = "vlad"
	self.jobs.cane.region = "street"
	self.jobs.cane.jc = 10
	self.jobs.cane.chain = {
		self.stages.cane
	}
	self.jobs.cane.load_screen = "guis/dlcs/pic/textures/loading/job_santasworkshop"
	self.jobs.cane.briefing_event = "vld_can_cbf_01"
	self.jobs.cane.debrief_event = nil
	self.jobs.cane.crimenet_callouts = {
		"vld_can_cnc_01"
	}
	self.jobs.cane.crimenet_videos = {
		"cn_ukr1",
		"cn_ukr2",
		"cn_ukr3"
	}
	self.jobs.cane.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.cane.payout = {
		10000,
		20000,
		30000,
		40000,
		80000,
		80000,
		80000
	}
	self.jobs.cane.contract_visuals = {}
	self.jobs.cane.contract_visuals.min_mission_xp = {
		10900,
		10900,
		10900,
		10900,
		10900,
		10900,
		10900
	}
	self.jobs.cane.contract_visuals.max_mission_xp = {
		6218000,
		6218000,
		6218000,
		6218000,
		6218000,
		6218000,
		6218000
	}
	self.stages.nail = {
		level_id = "nail",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.nail = {}
	self.jobs.nail.name_id = "heist_nail"
	self.jobs.nail.briefing_id = "heist_nail_crimenet"
	self.jobs.nail.package = "packages/job_nail"
	self.jobs.nail.contact = "events"
	self.jobs.nail.region = "street"
	self.jobs.nail.jc = 30
	self.jobs.nail.chain = {
		self.stages.nail
	}
	self.jobs.nail.load_screen = "guis/dlcs/pic/textures/loading/job_labrats"
	self.jobs.nail.briefing_event = "pln_nai_cbf_01"
	self.jobs.nail.debrief_event = nil
	self.jobs.nail.crimenet_callouts = {
		"pln_nai_cnc_01"
	}
	self.jobs.nail.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel3"
	}
	self.jobs.nail.payout = {
		6000,
		12000,
		30000,
		50000,
		60000,
		60000,
		60000
	}
	self.jobs.nail.contract_cost = {
		4000,
		8000,
		20000,
		40000,
		100000,
		100000,
		100000
	}
	self.jobs.nail.is_halloween_level = true
	self.jobs.nail.contract_visuals = {}
	self.jobs.nail.contract_visuals.min_mission_xp = {
		20000,
		20000,
		20000,
		20000,
		20000,
		20000,
		20000
	}
	self.jobs.nail.contract_visuals.max_mission_xp = {
		3785000,
		3785000,
		3785000,
		3785000,
		3785000,
		3785000,
		3785000
	}
	self.stages.peta_1 = {
		dlc = "peta",
		level_id = "peta",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.stages.peta_2 = {
		dlc = "peta",
		level_id = "peta2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.peta = {}
	self.jobs.peta.name_id = "heist_peta"
	self.jobs.peta.briefing_id = "heist_peta_crimenet"
	self.jobs.peta.package = "packages/job_peta"
	self.jobs.peta.contact = "vlad"
	self.jobs.peta.region = "street"
	self.jobs.peta.dlc = "peta"
	self.jobs.peta.jc = 30
	self.jobs.peta.chain = {
		self.stages.peta_1,
		self.stages.peta_2
	}
	self.jobs.peta.briefing_event = "vld_pt1_cbf_01"
	self.jobs.peta.debrief_event = nil
	self.jobs.peta.crimenet_callouts = {
		"vld_pt1_cnc_01",
		"vld_pt1_cnc_01",
		"vld_pt1_cnc_01"
	}
	self.jobs.peta.crimenet_videos = {
		"cn_ukr1",
		"cn_ukr2",
		"cn_ukr3"
	}
	self.jobs.peta.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.peta.payout = {
		250000,
		500000,
		1250000,
		2500000,
		3200000,
		3200000,
		3200000
	}
	self.jobs.peta.contract_visuals = {}
	self.jobs.peta.contract_visuals.min_mission_xp = {
		38000,
		38000,
		38000,
		38000,
		38000,
		38000,
		38000
	}
	self.jobs.peta.contract_visuals.max_mission_xp = {
		122000,
		122000,
		122000,
		122000,
		122000,
		122000,
		122000
	}
	self.stages.man = {
		dlc = "pal",
		level_id = "man",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.man = {}
	self.jobs.man.name_id = "heist_man"
	self.jobs.man.briefing_id = "heist_man_crimenet"
	self.jobs.man.contact = "classic"
	self.jobs.man.region = "street"
	self.jobs.man.dlc = "pal"
	self.jobs.man.jc = 30
	self.jobs.man.chain = {
		self.stages.man
	}
	self.jobs.man.load_screen = "guis/dlcs/pic/textures/loading/job_undercover"
	self.jobs.man.briefing_event = "pln_man_cbf_01"
	self.jobs.man.debrief_event = nil
	self.jobs.man.crimenet_callouts = {
		"pln_man_cnc_01"
	}
	self.jobs.man.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.man.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.man.payout = {
		135000,
		275000,
		692307,
		1350000,
		1800000,
		1800000,
		1800000
	}
	self.jobs.man.contract_visuals = {}
	self.jobs.man.contract_visuals.min_mission_xp = {
		27500,
		27500,
		27500,
		27500,
		27500,
		27500,
		27500
	}
	self.jobs.man.contract_visuals.max_mission_xp = {
		28500,
		28500,
		28500,
		28500,
		28500,
		28500,
		28500
	}
	self.stages.dark = {
		dlc = "mad",
		level_id = "dark",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.dark = {}
	self.jobs.dark.name_id = "heist_dark"
	self.jobs.dark.briefing_id = "heist_dark_crimenet"
	self.jobs.dark.contact = "jimmy"
	self.jobs.dark.region = "street"
	self.jobs.dark.jc = 30
	self.jobs.dark.dlc = "mad"
	self.jobs.dark.chain = {
		self.stages.dark
	}
	self.jobs.dark.load_screen = "guis/dlcs/pic/textures/loading/job_murkystation"
	self.jobs.dark.briefing_event = "rb14_drk_cbf_01"
	self.jobs.dark.debrief_event = nil
	self.jobs.dark.crimenet_callouts = {
		"rb14_drk_cnc_01"
	}
	self.jobs.dark.crimenet_videos = {
		"cn_dark"
	}
	self.jobs.dark.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.dark.payout = {
		10000,
		20000,
		30000,
		40000,
		80000,
		80000,
		80000
	}
	self.jobs.dark.contract_visuals = {}
	self.jobs.dark.contract_visuals.min_mission_xp = {
		14000,
		14000,
		14000,
		14000,
		14000,
		14000,
		14000
	}
	self.jobs.dark.contract_visuals.max_mission_xp = {
		32000,
		32000,
		32000,
		32000,
		32000,
		32000,
		32000
	}
	self.stages.mad = {
		dlc = "mad",
		level_id = "mad",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.mad = {}
	self.jobs.mad.name_id = "heist_mad"
	self.jobs.mad.briefing_id = "heist_mad_crimenet"
	self.jobs.mad.contact = "jimmy"
	self.jobs.mad.region = "street"
	self.jobs.mad.jc = 30
	self.jobs.mad.dlc = "mad"
	self.jobs.mad.chain = {
		self.stages.mad
	}
	self.jobs.mad.load_screen = "guis/dlcs/pic/textures/loading/job_boilingpoint"
	self.jobs.mad.briefing_event = "rb14_mad_cbf_01"
	self.jobs.mad.debrief_event = nil
	self.jobs.mad.crimenet_callouts = {
		"rb14_mad_cnc_01"
	}
	self.jobs.mad.crimenet_videos = {
		"cn_mad"
	}
	self.jobs.mad.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.mad.payout = {
		135000,
		275000,
		692307,
		1350000,
		1800000,
		1800000,
		1800000
	}
	self.jobs.mad.contract_visuals = {}
	self.jobs.mad.contract_visuals.min_mission_xp = {
		31000,
		31000,
		31000,
		31000,
		31000,
		31000,
		31000
	}
	self.jobs.mad.contract_visuals.max_mission_xp = {
		46000,
		46000,
		46000,
		46000,
		46000,
		46000,
		46000
	}
	self.stages.born = {
		dlc = "born",
		level_id = "born",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.stages.chew = {
		dlc = "born",
		level_id = "chew",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.born = {}
	self.jobs.born.name_id = "heist_born"
	self.jobs.born.briefing_id = "heist_born_crimenet"
	self.jobs.born.contact = "the_elephant"
	self.jobs.born.region = "street"
	self.jobs.born.jc = 30
	self.jobs.born.dlc = "born"
	self.jobs.born.chain = {
		self.stages.born,
		self.stages.chew
	}
	self.jobs.born.load_screen = "guis/dlcs/pic/textures/loading/job_born"
	self.jobs.born.briefing_event = "elp_brn_cbf_01"
	self.jobs.born.debrief_event = nil
	self.jobs.born.crimenet_callouts = {
		"elp_brn_cnc_01"
	}
	self.jobs.born.crimenet_videos = {
		"cn_elcday1",
		"cn_elcday2",
		"cn_elcday3"
	}
	self.jobs.born.payout = {
		26000,
		37000,
		81000,
		101000,
		202000,
		202000,
		202000
	}
	self.jobs.born.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.born.payout = {
		135000,
		275000,
		692307,
		1350000,
		1800000,
		1800000,
		1800000
	}
	self.jobs.born.contract_visuals = {}
	self.jobs.born.contract_visuals.min_mission_xp = {
		10000,
		10000,
		10000,
		10000,
		10000,
		10000,
		10000
	}
	self.jobs.born.contract_visuals.max_mission_xp = {
		14000,
		14000,
		14000,
		14000,
		14000,
		14000,
		14000
	}
	self.stages.short_1_1 = {
		level_id = "short1_stage1",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.stages.short_1_2 = {
		level_id = "short1_stage2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.stages.short_2_1 = {
		level_id = "short2_stage1",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.stages.short_2_2 = {
		level_id = "short2_stage2b",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.short = {}
	self.jobs.short.name_id = "heist_short"
	self.jobs.short.briefing_id = "heist_short1_stage1_crimenet"
	self.jobs.short.contact = "bain"
	self.jobs.short.region = "street"
	self.jobs.short.jc = 10
	self.jobs.short.chain = {
		self.stages.short_1_1,
		self.stages.short_1_2,
		self.stages.short_2_1,
		self.stages.short_2_2
	}
	self.jobs.short.load_screen = "guis/dlcs/pic/textures/loading/job_branchbank"
	self.jobs.short.briefing_event = "pln_sh11_cbf_01"
	self.jobs.short.debrief_event = nil
	self.jobs.short.crimenet_callouts = {
		"pln_cs1_cnc_01",
		"pln_cs1_cnc_02",
		"pln_cs1_cnc_03"
	}
	self.jobs.short.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.short.payout = {
		52000,
		74000,
		162000,
		202000,
		404000,
		404000,
		404000
	}
	self.jobs.short1 = {}
	self.jobs.short1.name_id = "heist_short1"
	self.jobs.short1.briefing_id = "heist_short1_crimenet"
	self.jobs.short1.contact = "bain"
	self.jobs.short1.region = "street"
	self.jobs.short1.jc = 10
	self.jobs.short1.chain = {
		self.stages.short_1_1,
		self.stages.short_1_2
	}
	self.jobs.short1.load_screen = "guis/dlcs/pic/textures/loading/job_branchbank"
	self.jobs.short1.briefing_event = "pln_sh11_cbf_01"
	self.jobs.short1.debrief_event = nil
	self.jobs.short1.crimenet_callouts = {
		"pln_cs1_cnc_01",
		"pln_cs1_cnc_02",
		"pln_cs1_cnc_03"
	}
	self.jobs.short1.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.short1.payout = {
		26000,
		37000,
		81000,
		101000,
		202000,
		202000,
		202000
	}
	self.jobs.short2 = {}
	self.jobs.short2.name_id = "heist_short2"
	self.jobs.short2.briefing_id = "heist_short2_crimenet"
	self.jobs.short2.contact = "bain"
	self.jobs.short2.region = "street"
	self.jobs.short2.jc = 10
	self.jobs.short2.chain = {
		self.stages.short_2_1,
		self.stages.short_2_2
	}
	self.jobs.short2.load_screen = "guis/dlcs/pic/textures/loading/job_branchbank"
	self.jobs.short2.briefing_event = "pln_sh21_cbf_01"
	self.jobs.short2.debrief_event = nil
	self.jobs.short2.crimenet_callouts = {
		"pln_cs1_cnc_01",
		"pln_cs1_cnc_02",
		"pln_cs1_cnc_03"
	}
	self.jobs.short2.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.short2.payout = {
		26000,
		37000,
		81000,
		101000,
		202000,
		202000,
		202000
	}
	self.tutorials = {
		{
			job = "short2"
		},
		{
			job = "short1"
		}
	}
	self.stages.chill = {
		level_id = "chill",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.stages.chill_combat = {
		level_id = "chill_combat",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			2
		}
	}
	self.jobs.chill = {}
	self.jobs.chill.name_id = "heist_chill"
	self.jobs.chill.briefing_id = "heist_chill_crimenet"
	self.jobs.chill.contact = "hoxton"
	self.jobs.chill.region = "street"
	self.jobs.chill.jc = 30
	self.jobs.chill.chain = {
		self.stages.chill
	}
	self.jobs.chill.load_screen = "guis/dlcs/pic/textures/loading/job_safehouse_new"
	self.jobs.chill.briefing_event = "pln_sh21_cbf_01"
	self.jobs.chill.debrief_event = nil
	self.jobs.chill.crimenet_callouts = {
		"pln_cs1_cnc_01",
		"pln_cs1_cnc_02",
		"pln_cs1_cnc_03"
	}
	self.jobs.chill.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.chill.payout = {
		26000,
		37000,
		81000,
		101000,
		202000,
		202000,
		202000
	}

	local chill_combat_marker_dot_color = Color(1, 0, 0)
	local chill_combat_marker_dot_color_to = Color(0.2, 0, 0)

	self.jobs.chill_combat = {}
	self.jobs.chill_combat.name_id = "heist_chill_combat"
	self.jobs.chill_combat.briefing_id = "heist_chill_combat_crimenet"
	self.jobs.chill_combat.contact = "hoxton"
	self.jobs.chill_combat.region = "street"
	self.jobs.chill_combat.jc = 30
	self.jobs.chill_combat.chain = {
		self.stages.chill_combat
	}
	self.jobs.chill_combat.load_screen = "guis/dlcs/pic/textures/loading/job_safehouse_new"
	self.jobs.chill_combat.briefing_event = "pln_sfr_cbf_01"
	self.jobs.chill_combat.debrief_event = nil
	self.jobs.chill_combat.crimenet_callouts = {
		"pln_sfr_cnc_01_01"
	}
	self.jobs.chill_combat.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.chill_combat.payout = {
		26000,
		37000,
		81000,
		101000,
		180000,
		202000,
		220000
	}
	self.jobs.chill_combat.marker_dot_color = chill_combat_marker_dot_color
	self.jobs.chill_combat.color_lerp = {
		speed = 10,
		from = chill_combat_marker_dot_color,
		to = chill_combat_marker_dot_color_to
	}
	self.jobs.chill_combat.show_in_filters = true
	self.stages.friend = {
		dlc = "friend",
		level_id = "friend",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.friend = {}
	self.jobs.friend.name_id = "heist_friend"
	self.jobs.friend.briefing_id = "heist_friend_crimenet"
	self.jobs.friend.contact = "the_butcher"
	self.jobs.friend.region = "street"
	self.jobs.friend.jc = 30
	self.jobs.friend.dlc = "friend"
	self.jobs.friend.chain = {
		self.stages.friend
	}
	self.jobs.friend.load_screen = "guis/dlcs/pic/textures/loading/job_mansion"
	self.jobs.friend.briefing_event = "Play_butcher_fri_cbf_01"
	self.jobs.friend.debrief_event = {
		"Play_btc_fri_end_a",
		"Play_btc_fri_end_b"
	}
	self.jobs.friend.crimenet_callouts = {
		"Play_butcher_fri_cnc_01"
	}
	self.jobs.friend.crimenet_videos = {
		"cn_cro1",
		"cn_cro2",
		"cn_cro3"
	}
	self.jobs.friend.payout = {
		180000,
		270000,
		360000,
		620000,
		380000,
		380000,
		380000
	}
	self.jobs.friend.contract_cost = {
		47000,
		94000,
		235000,
		470000,
		600000,
		600000,
		600000
	}
	self.jobs.friend.contract_visuals = {}
	self.jobs.friend.contract_visuals.min_mission_xp = {
		17000,
		17000,
		17000,
		17000,
		17000,
		17000,
		17000
	}
	self.jobs.friend.contract_visuals.max_mission_xp = {
		35000,
		35000,
		35000,
		35000,
		35000,
		35000,
		35000
	}
	self.stages.moon = {
		level_id = "moon",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.moon = {}
	self.jobs.moon.name_id = "heist_moon"
	self.jobs.moon.briefing_id = "heist_moon_crimenet"
	self.jobs.moon.contact = "vlad"
	self.jobs.moon.region = "street"
	self.jobs.moon.jc = 30
	self.jobs.moon.chain = {
		self.stages.moon
	}
	self.jobs.moon.load_screen = "guis/dlcs/pic/textures/loading/job_stealing_xmas"
	self.jobs.moon.briefing_event = "vld_moon_cbf_01"
	self.jobs.moon.debrief_event = nil
	self.jobs.moon.crimenet_callouts = {
		"vld_moon_cnc_01"
	}
	self.jobs.moon.crimenet_videos = {
		"cn_ukr1",
		"cn_ukr2",
		"cn_ukr3"
	}
	self.jobs.moon.payout = {
		124000,
		248000,
		620000,
		1150000,
		1600000,
		1600000,
		1600000
	}
	self.jobs.moon.contract_cost = {
		105000,
		150000,
		550000,
		1050000,
		1400000,
		1400000,
		1400000
	}
	self.jobs.moon.contract_visuals = {}
	self.jobs.moon.contract_visuals.min_mission_xp = {
		8300,
		8300,
		8300,
		8300,
		8300,
		8300,
		8300
	}
	self.jobs.moon.contract_visuals.max_mission_xp = {
		17800,
		17800,
		17800,
		17800,
		17800,
		17800,
		17800
	}
	self.stages.spa = {
		dlc = "spa",
		level_id = "spa",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.spa = {}
	self.jobs.spa.name_id = "heist_spa"
	self.jobs.spa.briefing_id = "heist_spa_crimenet"
	self.jobs.spa.briefing_dialog = "Play_pln_bb1_brf_01"
	self.jobs.spa.contact = "the_continental"
	self.jobs.spa.dlc = "spa"
	self.jobs.spa.region = "street"
	self.jobs.spa.jc = 30
	self.jobs.spa.chain = {
		self.stages.spa
	}
	self.jobs.spa.load_screen = "guis/dlcs/pic/textures/loading/job_brooklyn1010"
	self.jobs.spa.briefing_event = "pln_spa_cbf_01"
	self.jobs.spa.debrief_event = nil
	self.jobs.spa.crimenet_callouts = {
		"pln_spa_cnc_01"
	}
	self.jobs.spa.crimenet_videos = {
		"contact_continental1"
	}
	self.jobs.spa.package = "packages/job_spa"
	self.jobs.spa.cube = "cube_apply_heist_bank"
	self.jobs.spa.ghost_bonus = 0.15
	self.jobs.spa.max_bags = 28
	self.jobs.spa.payout = {
		124000,
		248000,
		620000,
		1150000,
		1600000,
		1600000,
		1600000
	}
	self.jobs.spa.contract_cost = {
		105000,
		150000,
		550000,
		1050000,
		1400000,
		1400000,
		1400000
	}
	self.jobs.spa.contract_visuals = {}
	self.jobs.spa.contract_visuals.min_mission_xp = {
		26000,
		26000,
		26000,
		26000,
		26000,
		26000,
		26000
	}
	self.jobs.spa.contract_visuals.max_mission_xp = {
		30000,
		30000,
		30000,
		30000,
		30000,
		30000,
		30000
	}
	self.stages.fish = {
		dlc = "spa",
		level_id = "fish",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.fish = {}
	self.jobs.fish.name_id = "heist_fish"
	self.jobs.fish.briefing_id = "heist_fish_crimenet"
	self.jobs.fish.contact = "the_continental"
	self.jobs.fish.dlc = "spa"
	self.jobs.fish.region = "street"
	self.jobs.fish.jc = 30
	self.jobs.fish.chain = {
		self.stages.fish
	}
	self.jobs.fish.load_screen = "guis/dlcs/pic/textures/loading/job_yachtheist"
	self.jobs.fish.briefing_event = "cha_fish_cbf_01"
	self.jobs.fish.debrief_event = nil
	self.jobs.fish.crimenet_callouts = {
		"cha_fish_cnc_01"
	}
	self.jobs.fish.crimenet_videos = {
		"contact_continental1"
	}
	self.jobs.fish.payout = {
		70000,
		95000,
		125000,
		200000,
		250000,
		250000,
		250000
	}
	self.jobs.fish.contract_cost = {
		39000,
		78000,
		195000,
		390000,
		500000,
		500000,
		500000
	}
	self.jobs.fish.contract_visuals = {}
	self.jobs.fish.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.fish.contract_visuals.max_mission_xp = {
		15000,
		15000,
		15000,
		15000,
		15000,
		15000,
		15000
	}
	self.stages.flat = {
		level_id = "flat",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.flat = {}
	self.jobs.flat.name_id = "heist_flat"
	self.jobs.flat.briefing_id = "heist_flat_crimenet"
	self.jobs.flat.contact = "classic"
	self.jobs.flat.region = "street"
	self.jobs.flat.jc = 30
	self.jobs.flat.chain = {
		self.stages.flat
	}
	self.jobs.flat.load_screen = "guis/dlcs/pic/textures/loading/job_panicroom"
	self.jobs.flat.briefing_event = "pln_flt_cbf_01"
	self.jobs.flat.debrief_event = nil
	self.jobs.flat.crimenet_callouts = {
		"pln_flt_cnc_01"
	}
	self.jobs.flat.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.flat.payout = {
		118000,
		236000,
		826000,
		1180000,
		1357000,
		1534000,
		1652000
	}
	self.jobs.flat.contract_cost = {
		70000,
		150000,
		350307,
		700000,
		900000,
		900000,
		900000
	}
	self.jobs.flat.contract_visuals = {}
	self.jobs.flat.contract_visuals.min_mission_xp = {
		12000,
		25000,
		25000,
		25000,
		25000,
		25000,
		25000
	}
	self.jobs.flat.contract_visuals.max_mission_xp = {
		30500,
		30500,
		30500,
		30500,
		30500,
		30500,
		30500
	}
	self.stages.help = {
		level_id = "help",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.help = {}
	self.jobs.help.name_id = "heist_help"
	self.jobs.help.briefing_id = "heist_help_crimenet"
	self.jobs.help.contact = "events"
	self.jobs.help.region = "street"
	self.jobs.help.jc = 30
	self.jobs.help.chain = {
		self.stages.help
	}
	self.jobs.help.load_screen = "guis/dlcs/pic/textures/loading/job_prisonnightmare"
	self.jobs.help.briefing_event = "pln_hlp_cbf_01"
	self.jobs.help.debrief_event = nil
	self.jobs.help.crimenet_callouts = {
		"pln_hlp_cnc_01_01"
	}
	self.jobs.help.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.help.payout = {
		6000,
		12000,
		30000,
		50000,
		60000,
		60000,
		60000
	}
	self.jobs.help.contract_cost = {
		70000,
		150000,
		350307,
		700000,
		900000,
		900000,
		900000
	}
	self.jobs.help.objective_stinger = "hlp_stinger_objectivecomplete"
	self.jobs.help.is_halloween_level = true
	self.jobs.help.contract_visuals = {}
	self.jobs.help.contract_visuals.min_mission_xp = {
		14000,
		14000,
		14000,
		14000,
		14000,
		14000,
		14000
	}
	self.jobs.help.contract_visuals.max_mission_xp = {
		8507150,
		8507150,
		8507150,
		8507150,
		8507150,
		8507150,
		8507150
	}
	self.stages.run = {
		level_id = "run",
		type = "d",
		type_id = "heist_type_survive"
	}
	self.jobs.run = {}
	self.jobs.run.name_id = "heist_run"
	self.jobs.run.briefing_id = "heist_run_crimenet"
	self.jobs.run.package = "packages/narr_run"
	self.jobs.run.contact = "classic"
	self.jobs.run.region = "street"
	self.jobs.run.jc = 50
	self.jobs.run.chain = {
		self.stages.run
	}
	self.jobs.run.briefing_event = "Play_loc_run_cbf_01"
	self.jobs.run.debrief_event = nil
	self.jobs.run.crimenet_callouts = {
		"Play_loc_run_cnc_01"
	}
	self.jobs.run.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.run.payout = {
		110000,
		220000,
		550000,
		1100000,
		1265000,
		1430000,
		1540000
	}
	self.jobs.run.contract_cost = {
		70000,
		150000,
		350307,
		700000,
		900000,
		900000,
		900000
	}
	self.jobs.run.load_screen = "guis/dlcs/pic/textures/loading/job_heatstreet"
	self.jobs.run.contract_visuals = {}
	self.jobs.run.contract_visuals.min_mission_xp = {
		26000,
		26000,
		26000,
		26000,
		26000,
		26000,
		26000
	}
	self.jobs.run.contract_visuals.max_mission_xp = {
		26000,
		26000,
		26000,
		26000,
		260000,
		26000,
		26000
	}
	self.stages.glace = {
		level_id = "glace",
		type = "d",
		type_id = "heist_type_survive"
	}
	self.jobs.glace = {}
	self.jobs.glace.name_id = "heist_glace"
	self.jobs.glace.briefing_id = "heist_glace_crimenet"
	self.jobs.glace.package = "packages/job_rats"
	self.jobs.glace.contact = "classic"
	self.jobs.glace.jc = 50
	self.jobs.glace.chain = {
		self.stages.glace
	}
	self.jobs.glace.load_screen = "guis/dlcs/pic/textures/loading/job_greenbridge"
	self.jobs.glace.briefing_event = "Play_pln_glc_cbf_01"
	self.jobs.glace.debrief_event = nil
	self.jobs.glace.crimenet_callouts = {
		"Play_pln_glc_cnc_01"
	}
	self.jobs.glace.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.glace.payout = {
		115000,
		225000,
		555000,
		1150000,
		1266000,
		1435000,
		1545000
	}
	self.jobs.glace.contract_cost = {
		70000,
		150000,
		350307,
		700000,
		900000,
		900000,
		900000
	}
	self.jobs.glace.contract_visuals = {}
	self.jobs.glace.contract_visuals.min_mission_xp = {
		24000,
		24000,
		24000,
		24000,
		24000,
		24000,
		24000
	}
	self.jobs.glace.contract_visuals.max_mission_xp = {
		28000,
		28000,
		28000,
		28000,
		28000,
		28000,
		28000
	}
	self.stages.haunted = {
		level_id = "haunted",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.haunted = {}
	self.jobs.haunted.name_id = "heist_haunted"
	self.jobs.haunted.briefing_id = "heist_haunted_crimenet"
	self.jobs.haunted.contact = "events"
	self.jobs.haunted.region = "street"
	self.jobs.haunted.jc = 10
	self.jobs.haunted.chain = {
		self.stages.haunted
	}
	self.jobs.haunted.load_screen = "guis/dlcs/pic/textures/loading/old_safehouse_halloween_df"
	self.jobs.haunted.briefing_event = nil
	self.jobs.haunted.debrief_event = nil
	self.jobs.haunted.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.haunted.payout = {
		20000,
		30000,
		40000,
		70000,
		80000,
		90000,
		100000
	}
	self.jobs.haunted.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		240000,
		280000
	}
	self.jobs.haunted.is_halloween_level = true
	self.jobs.haunted.contract_visuals = {}
	self.jobs.haunted.contract_visuals.min_mission_xp = {
		10000,
		10000,
		10000,
		10000,
		10000,
		10000,
		10000
	}
	self.jobs.haunted.contract_visuals.max_mission_xp = {
		10000,
		10000,
		10000,
		10000,
		10000,
		10000,
		10000
	}
	self.stages.dah = {
		level_id = "dah",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.dah = {}
	self.jobs.dah.name_id = "heist_dah"
	self.jobs.dah.briefing_id = "heist_dah_crimenet"
	self.jobs.dah.contact = "classic"
	self.jobs.dah.region = "street"
	self.jobs.dah.jc = 30
	self.jobs.dah.chain = {
		self.stages.dah
	}
	self.jobs.dah.briefing_event = "Play_pln_dah_cbf_01"
	self.jobs.dah.debrief_event = nil
	self.jobs.dah.crimenet_callouts = {
		"Play_pln_dah_cnc_01"
	}
	self.jobs.dah.crimenet_videos = {
		"cn_branchbank1"
	}
	self.jobs.dah.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.dah.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.dah.contract_visuals = {}
	self.jobs.dah.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.dah.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.dah.contract_visuals.preview_image = {
		id = "dah"
	}
	self.jobs.dah.date_added = {
		2017,
		10,
		27
	}
	self.stages.rvd_1 = {
		dlc = "rvd",
		level_id = "rvd1",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.stages.rvd_2 = {
		dlc = "rvd",
		level_id = "rvd2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.rvd = {}
	self.jobs.rvd.name_id = "heist_rvd"
	self.jobs.rvd.briefing_id = "heist_rvd_crimenet"
	self.jobs.rvd.package = "packages/narr_rvd"
	self.jobs.rvd.contact = "bain"
	self.jobs.rvd.dlc = "rvd"
	self.jobs.rvd.region = "street"
	self.jobs.rvd.jc = 60
	self.jobs.rvd.chain = {
		self.stages.rvd_1,
		self.stages.rvd_2
	}
	self.jobs.rvd.briefing_event = "Play_pln_rvd_cbf_01"
	self.jobs.rvd.debrief_event = nil
	self.jobs.rvd.crimenet_callouts = {
		"Play_pln_rvd_cnc_01"
	}
	self.jobs.rvd.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.rvd.payout = {
		20000,
		30000,
		40000,
		70000,
		80000,
		80000,
		80000
	}
	self.jobs.rvd.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.rvd.contract_visuals = {}
	self.jobs.rvd.contract_visuals.min_mission_xp = {
		29500,
		29500,
		29500,
		29500,
		29500,
		29500,
		29500
	}
	self.jobs.rvd.contract_visuals.max_mission_xp = {
		47500,
		47500,
		47500,
		47500,
		47500,
		47500,
		47500
	}
	self.jobs.rvd.contract_visuals.preview_image = {
		folder = "rvd",
		id = "rvd"
	}
	self.jobs.rvd.date_added = {
		2017,
		12,
		14
	}
	self.stages.brb = {
		level_id = "brb",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.brb = {}
	self.jobs.brb.name_id = "heist_brb"
	self.jobs.brb.briefing_id = "heist_brb_crimenet"
	self.jobs.brb.contact = "locke"
	self.jobs.brb.region = "street"
	self.jobs.brb.jc = 10
	self.jobs.brb.chain = {
		self.stages.brb
	}
	self.jobs.brb.briefing_event = "Play_loc_brb_cbf_01"
	self.jobs.brb.debrief_event = nil
	self.jobs.brb.crimenet_callouts = {
		"Play_loc_brb_cnc_01"
	}
	self.jobs.brb.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.brb.payout = {
		8000,
		16000,
		40000,
		80000,
		100000,
		100000,
		100000
	}
	self.jobs.brb.contract_cost = {
		62000,
		124000,
		310000,
		620000,
		800000,
		800000,
		800000
	}
	self.jobs.brb.contract_visuals = {}
	self.jobs.brb.contract_visuals.min_mission_xp = {
		16400,
		16400,
		16400,
		16400,
		16400,
		16400,
		16400
	}
	self.jobs.brb.contract_visuals.max_mission_xp = {
		25600,
		25600,
		25600,
		25600,
		25600,
		25600,
		25600
	}
	self.jobs.brb.contract_visuals.preview_image = {
		folder = "brb",
		id = "brb"
	}
	self.jobs.brb.date_added = {
		2017,
		12,
		21
	}
	self.jobs.crime_spree = {}
	self.jobs.crime_spree.name_id = "heist_crime_spree"
	self.jobs.crime_spree.briefing_id = "heist_crime_spree_brief"
	self.jobs.crime_spree.contact = "hoxton"
	self.jobs.crime_spree.region = "street"
	self.jobs.crime_spree.jc = 0
	self.jobs.crime_spree.chain = {}
	self.jobs.crime_spree.briefing_event = nil
	self.jobs.crime_spree.debrief_event = nil
	self.jobs.crime_spree.crimenet_callouts = {}
	self.jobs.crime_spree.crimenet_videos = {
		"cn_branchbank1"
	}
	self.jobs.crime_spree.payout = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.jobs.crime_spree.experience_mul = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.jobs.crime_spree.contract_cost = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.jobs.crime_spree.contract_visuals = {}
	self.jobs.crime_spree.contract_visuals.min_mission_xp = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.jobs.crime_spree.contract_visuals.max_mission_xp = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.jobs.crime_spree.ignore_heat = true
	self.jobs.crime_spree.hidden = true
	self.stages.hvh = {
		level_id = "hvh",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.hvh = {}
	self.jobs.hvh.name_id = "heist_hvh"
	self.jobs.hvh.briefing_id = "heist_hvh_crimenet"
	self.jobs.hvh.package = "packages/narr_hvh"
	self.jobs.hvh.contact = "events"
	self.jobs.hvh.region = "street"
	self.jobs.hvh.jc = 30
	self.jobs.hvh.chain = {
		self.stages.hvh
	}
	self.jobs.hvh.briefing_event = "hvh_cbf_01"
	self.jobs.hvh.debrief_event = nil
	self.jobs.hvh.crimenet_callouts = {
		"hvh_cnc_01"
	}
	self.jobs.hvh.crimenet_videos = {
		"cn_jewel1",
		"cn_jewel2",
		"cn_jewel3"
	}
	self.jobs.hvh.payout = {
		20000,
		30000,
		40000,
		70000,
		80000,
		80000,
		80000
	}
	self.jobs.hvh.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.hvh.is_halloween_level = true
	self.jobs.hvh.contract_visuals = {}
	self.jobs.hvh.contract_visuals.min_mission_xp = {
		2000,
		2000,
		2000,
		2000,
		2000,
		2000,
		2000
	}
	self.jobs.hvh.contract_visuals.max_mission_xp = {
		60000,
		60000,
		60000,
		60000,
		60000,
		60000,
		60000
	}
	self.jobs.hvh.date_added = {
		2017,
		10,
		31
	}
	self.stages.wwh = {
		level_id = "wwh",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.wwh = {}
	self.jobs.wwh.name_id = "heist_wwh"
	self.jobs.wwh.briefing_id = "heist_wwh_crimenet"
	self.jobs.wwh.contact = "locke"
	self.jobs.wwh.region = "street"
	self.jobs.wwh.jc = 30
	self.jobs.wwh.chain = {
		self.stages.wwh
	}
	self.jobs.wwh.briefing_event = "Play_loc_wwh_cbf_01"
	self.jobs.wwh.debrief_event = nil
	self.jobs.wwh.crimenet_callouts = {
		"Play_loc_wwh_cnc_01"
	}
	self.jobs.wwh.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.wwh.payout = {
		60000,
		150000,
		300000,
		600000,
		750000,
		750000,
		750000
	}
	self.jobs.wwh.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.wwh.contract_visuals = {}
	self.jobs.wwh.contract_visuals.min_mission_xp = {
		14000,
		14000,
		14000,
		14000,
		14000,
		14000,
		14000
	}
	self.jobs.wwh.contract_visuals.max_mission_xp = {
		18000,
		18000,
		18000,
		18000,
		18000,
		18000,
		18000
	}
	self.jobs.wwh.contract_visuals.preview_image = {
		id = "lockeload"
	}
	self.jobs.wwh.load_screen = "guis/dlcs/pic/textures/loading/job_lockeload"
	self.jobs.wwh.date_added = {
		2017,
		10,
		23
	}
	self.jobs.arm_cro.contract_visuals.preview_image = {
		id = "armor_crossroads"
	}
	self.jobs.arm_fac.contract_visuals.preview_image = {
		id = "armor_harbor"
	}
	self.jobs.arm_for.contract_visuals.preview_image = {
		id = "armor_train"
	}
	self.jobs.arm_hcm.contract_visuals.preview_image = {
		id = "armor_downtown"
	}
	self.jobs.arm_par.contract_visuals.preview_image = {
		id = "armor_park"
	}
	self.jobs.arm_und.contract_visuals.preview_image = {
		id = "armor_underpass"
	}
	self.jobs.gallery.contract_visuals.preview_image = {
		id = "gallery"
	}
	self.jobs.cage.contract_visuals.preview_image = {
		id = "carshop"
	}
	self.jobs.branchbank_cash.contract_visuals.preview_image = {
		id = "branchbank"
	}
	self.jobs.branchbank_gold_prof.contract_visuals.preview_image = {
		id = "branchbank"
	}
	self.jobs.branchbank_prof.contract_visuals.preview_image = {
		id = "branchbank"
	}
	self.jobs.branchbank_deposit.contract_visuals.preview_image = {
		id = "branchbank"
	}
	self.jobs.rat.contract_visuals.preview_image = {
		id = "cook_off"
	}
	self.jobs.family.contract_visuals.preview_image = {
		id = "diamondstore"
	}
	self.jobs.arena.contract_visuals.preview_image = {
		id = "arena"
	}
	self.jobs.roberts.contract_visuals.preview_image = {
		id = "go_bank"
	}
	self.jobs.jewelry_store.contract_visuals.preview_image = {
		id = "jewelrystore"
	}
	self.jobs.kosugi.contract_visuals.preview_image = {
		id = "shadowraid"
	}
	self.jobs.pbr.contract_visuals.preview_image = {
		id = "beneath_the_mountain"
	}
	self.jobs.pbr2.contract_visuals.preview_image = {
		id = "birth_of_sky"
	}
	self.jobs.dark.contract_visuals.preview_image = {
		id = "murkystation"
	}
	self.jobs.mad.contract_visuals.preview_image = {
		id = "boilingpoint"
	}
	self.jobs.firestarter.contract_visuals.preview_image = {
		id = "firestarter_01"
	}
	self.jobs.alex.contract_visuals.preview_image = {
		id = "rats_01"
	}
	self.jobs.watchdogs_wrapper.contract_visuals.preview_image = {
		id = "watchdogs_01"
	}
	self.jobs.friend.contract_visuals.preview_image = {
		id = "mansion"
	}
	self.jobs.crojob1.contract_visuals.preview_image = {
		id = "bomb_dockyard"
	}
	self.jobs.crojob_wrapper.contract_visuals.preview_image = {
		id = "bomb_forest"
	}
	self.jobs.spa.contract_visuals.preview_image = {
		id = "brooklyn"
	}
	self.jobs.fish.contract_visuals.preview_image = {
		id = "yacht"
	}
	self.jobs.kenaz.contract_visuals.preview_image = {
		id = "casino"
	}
	self.jobs.mia.contract_visuals.preview_image = {
		id = "hotline_miami_01"
	}
	self.jobs.hox.contract_visuals.preview_image = {
		id = "hoxton_breakout_01"
	}
	self.jobs.hox_3.contract_visuals.preview_image = {
		id = "hoxton_revenge"
	}
	self.jobs.big.contract_visuals.preview_image = {
		id = "bigbank"
	}
	self.jobs.mus.contract_visuals.preview_image = {
		id = "museum"
	}
	self.jobs.born.contract_visuals.preview_image = {
		id = "biker_01"
	}
	self.jobs.welcome_to_the_jungle_wrapper_prof.contract_visuals.preview_image = {
		id = "bigoil_01"
	}
	self.jobs.election_day.contract_visuals.preview_image = {
		id = "electionday_02"
	}
	self.jobs.framing_frame.contract_visuals.preview_image = {
		id = "gallery"
	}
	self.jobs.jolly.contract_visuals.preview_image = {
		id = "aftershock"
	}
	self.jobs.cane.contract_visuals.preview_image = {
		id = "santas_workshop"
	}
	self.jobs.moon.contract_visuals.preview_image = {
		id = "stealing_xmas"
	}
	self.jobs.ukrainian_job_prof.contract_visuals.preview_image = {
		id = "jewelrystore"
	}
	self.jobs.pines.contract_visuals.preview_image = {
		id = "white_xmas"
	}
	self.jobs.peta.contract_visuals.preview_image = {
		id = "goatsim_01"
	}
	self.jobs.four_stores.contract_visuals.preview_image = {
		id = "fourstores"
	}
	self.jobs.mallcrasher.contract_visuals.preview_image = {
		id = "mallcrasher"
	}
	self.jobs.nightclub.contract_visuals.preview_image = {
		id = "nightclub"
	}
	self.jobs.shoutout_raid.contract_visuals.preview_image = {
		id = "meltdown"
	}
	self.jobs.nail.contract_visuals.preview_image = {
		id = "labrats"
	}
	self.jobs.help.contract_visuals.preview_image = {
		id = "prison_nightmare"
	}
	self.jobs.hvh.contract_visuals.preview_image = {
		id = "halloween2017"
	}
	self.jobs.red2.contract_visuals.preview_image = {
		id = "fwb"
	}
	self.jobs.glace.contract_visuals.preview_image = {
		id = "green_bridge"
	}
	self.jobs.run.contract_visuals.preview_image = {
		id = "heat_street"
	}
	self.jobs.flat.contract_visuals.preview_image = {
		id = "panicroom"
	}
	self.jobs.dinner.contract_visuals.preview_image = {
		id = "slaughterhouse"
	}
	self.jobs.pal.contract_visuals.preview_image = {
		id = "counterfeit"
	}
	self.jobs.man.contract_visuals.preview_image = {
		id = "undercover"
	}
	self.jobs.haunted.contract_visuals = {}
	self.jobs.haunted.contract_visuals.preview_image = {
		id = "safehouse_old"
	}
	self.stages.tag = {
		level_id = "tag",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.tag = {}
	self.jobs.tag.name_id = "heist_tag"
	self.jobs.tag.briefing_id = "heist_tag_crimenet"
	self.jobs.tag.contact = "locke"
	self.jobs.tag.region = "street"
	self.jobs.tag.jc = 30
	self.jobs.tag.chain = {
		self.stages.tag
	}
	self.jobs.tag.briefing_event = "Play_loc_tag_cbf_01"
	self.jobs.tag.debrief_event = nil
	self.jobs.tag.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.tag.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.tag.payout = {
		20000,
		30000,
		40000,
		70000,
		80000,
		80000,
		80000
	}
	self.jobs.tag.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.tag.contract_visuals = {}
	self.jobs.tag.contract_visuals.min_mission_xp = {
		11000,
		11000,
		11000,
		11000,
		11000,
		11000,
		11000
	}
	self.jobs.tag.contract_visuals.max_mission_xp = {
		23000,
		23000,
		23000,
		23000,
		23000,
		23000,
		23000
	}
	self.jobs.tag.contract_visuals.preview_image = {
		folder = "tag",
		id = "tag"
	}
	self.jobs.tag.date_added = {
		2018,
		4,
		23
	}
	self.stages.des = {
		level_id = "des",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.des = {}
	self.jobs.des.name_id = "heist_des"
	self.jobs.des.briefing_id = "heist_des_crimenet"
	self.jobs.des.contact = "locke"
	self.jobs.des.region = "street"
	self.jobs.des.jc = 30
	self.jobs.des.chain = {
		self.stages.des
	}
	self.jobs.des.briefing_event = "Play_rb22_des_cbf_01"
	self.jobs.des.debrief_event = nil
	self.jobs.des.crimenet_callouts = {
		"Play_loc_des_cnc_01"
	}
	self.jobs.des.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.des.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.des.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.des.contract_visuals = {}
	self.jobs.des.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.des.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.des.contract_visuals.preview_image = {
		folder = "des",
		id = "des"
	}
	self.jobs.des.date_added = {
		2018,
		4,
		29
	}
	self.stages.vit = {
		level_id = "vit",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.vit = {}
	self.jobs.vit.name_id = "heist_vit"
	self.jobs.vit.briefing_id = "heist_vit_crimenet"
	self.jobs.vit.contact = "locke"
	self.jobs.vit.region = "street"
	self.jobs.vit.jc = 30
	self.jobs.vit.chain = {
		self.stages.vit
	}
	self.jobs.vit.briefing_event = "Play_pln_vit_cbf_01"
	self.jobs.vit.debrief_event = nil
	self.jobs.vit.crimenet_callouts = {
		"Play_loc_vit_cnc_01"
	}
	self.jobs.vit.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.vit.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.vit.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.vit.contract_visuals = {}
	self.jobs.vit.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.vit.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.vit.contract_visuals.preview_image = {
		folder = "vit",
		id = "vit"
	}
	self.jobs.vit.date_added = {
		2018,
		11,
		1
	}
	self.stages.bph = {
		level_id = "bph",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.bph = {}
	self.jobs.bph.name_id = "heist_bph"
	self.jobs.bph.briefing_id = "heist_bph_crimenet"
	self.jobs.bph.contact = "locke"
	self.jobs.bph.region = "street"
	self.jobs.bph.jc = 30
	self.jobs.bph.chain = {
		self.stages.bph
	}
	self.jobs.bph.briefing_event = "Play_loc_bph_cbf_01"
	self.jobs.bph.debrief_event = nil
	self.jobs.bph.crimenet_callouts = {
		"Play_loc_bph_cnc_01"
	}
	self.jobs.bph.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.bph.payout = {
		60000,
		150000,
		300000,
		600000,
		750000,
		750000,
		750000
	}
	self.jobs.bph.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.bph.contract_visuals = {}
	self.jobs.bph.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.bph.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.bph.contract_visuals.preview_image = {
		folder = "bph",
		id = "bph"
	}
	self.jobs.bph.date_added = {
		2018,
		10,
		26
	}
	self.stages.mex = {
		dlc = "mex",
		level_id = "mex",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.stages.mex_cooking = {
		dlc = "mex",
		level_id = "mex_cooking",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			2
		}
	}
	self.jobs.mex = {}
	self.jobs.mex.name_id = "heist_mex"
	self.jobs.mex.briefing_id = "heist_mex_crimenet"
	self.jobs.mex.contact = "locke"
	self.jobs.mex.region = "street"
	self.jobs.mex.jc = 30
	self.jobs.mex.dlc = "mex"
	self.jobs.mex.chain = {
		self.stages.mex
	}
	self.jobs.mex.briefing_event = "Play_loc_mex_cbf_01"
	self.jobs.mex.debrief_event = nil
	self.jobs.mex.crimenet_callouts = {
		"Play_loc_mex_cnc_01"
	}
	self.jobs.mex.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.mex.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.mex.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.mex.contract_visuals = {}
	self.jobs.mex.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.mex.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.mex.contract_visuals.preview_image = {
		folder = "mex",
		id = "mex"
	}
	self.jobs.mex.date_added = {
		2019,
		11,
		7
	}
	self.jobs.mex_cooking = {}
	self.jobs.mex_cooking.name_id = "heist_mex_cooking"
	self.jobs.mex_cooking.briefing_id = "heist_mex_cooking_crimenet"
	self.jobs.mex_cooking.contact = "locke"
	self.jobs.mex_cooking.region = "street"
	self.jobs.mex_cooking.jc = 30
	self.jobs.mex_cooking.dlc = "mex"
	self.jobs.mex_cooking.chain = {
		self.stages.mex_cooking
	}
	self.jobs.mex_cooking.briefing_event = "Play_loc_mex_cook_cbf_01"
	self.jobs.mex_cooking.debrief_event = nil
	self.jobs.mex_cooking.crimenet_callouts = {
		"Play_loc_mex_cook_cnc_01"
	}
	self.jobs.mex_cooking.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.mex_cooking.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.mex_cooking.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.mex_cooking.contract_visuals = {}
	self.jobs.mex_cooking.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.mex_cooking.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.mex_cooking.contract_visuals.preview_image = {
		folder = "mex",
		id = "mex_cooking"
	}
	self.jobs.mex_cooking.date_added = {
		2019,
		11,
		7
	}
	self.stages.bex = {
		dlc = "bex",
		level_id = "bex",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.bex = {}
	self.jobs.bex.name_id = "heist_bex"
	self.jobs.bex.briefing_id = "heist_bex_crimenet"
	self.jobs.bex.contact = "vlad"
	self.jobs.bex.region = "street"
	self.jobs.bex.jc = 30
	self.jobs.bex.dlc = "bex"
	self.jobs.bex.chain = {
		self.stages.bex
	}
	self.jobs.bex.briefing_event = "Play_vld_bex_cbf_01"
	self.jobs.bex.debrief_event = nil
	self.jobs.bex.crimenet_callouts = {
		"Play_vld_bex_cnc_01"
	}
	self.jobs.bex.crimenet_videos = {
		"cn_ukr1",
		"cn_ukr2",
		"cn_ukr3"
	}
	self.jobs.bex.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.bex.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.bex.contract_visuals = {}
	self.jobs.bex.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.bex.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.bex.contract_visuals.preview_image = {
		folder = "bex",
		id = "bex"
	}
	self.jobs.bex.date_added = {
		2020,
		2,
		27
	}
	self.stages.pex = {
		dlc = "pex",
		level_id = "pex",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.pex = {}
	self.jobs.pex.name_id = "heist_pex"
	self.jobs.pex.briefing_id = "heist_pex_crimenet"
	self.jobs.pex.contact = "locke"
	self.jobs.pex.region = "street"
	self.jobs.pex.jc = 30
	self.jobs.pex.dlc = "pex"
	self.jobs.pex.chain = {
		self.stages.pex
	}
	self.jobs.pex.briefing_event = "Play_loc_pex_cbf_01"
	self.jobs.pex.debrief_event = nil
	self.jobs.pex.crimenet_callouts = {
		"Play_loc_pex_cnc_01"
	}
	self.jobs.pex.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.pex.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.pex.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.pex.contract_visuals = {}
	self.jobs.pex.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.pex.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.pex.contract_visuals.preview_image = {
		folder = "pex",
		id = "pex"
	}
	self.jobs.pex.date_added = {
		2020,
		6,
		24
	}
	self.stages.fex = {
		dlc = "fex",
		level_id = "fex",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.fex = {}
	self.jobs.fex.name_id = "heist_fex"
	self.jobs.fex.briefing_id = "heist_fex_crimenet"
	self.jobs.fex.contact = "vlad"
	self.jobs.fex.region = "street"
	self.jobs.fex.jc = 30
	self.jobs.fex.dlc = "fex"
	self.jobs.fex.chain = {
		self.stages.fex
	}
	self.jobs.fex.briefing_event = "Play_vld_fex_cbf_01"
	self.jobs.fex.debrief_event = nil
	self.jobs.fex.crimenet_callouts = {
		"Play_vld_fex_cnc_01"
	}
	self.jobs.fex.crimenet_videos = {
		"codex/vlad1"
	}
	self.jobs.fex.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.fex.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.fex.contract_visuals = {}
	self.jobs.fex.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.fex.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.fex.contract_visuals.preview_image = {
		folder = "fex",
		id = "fex"
	}
	self.jobs.fex.date_added = {
		2020,
		11,
		11
	}
	self.stages.chas = {
		dlc = "chas",
		level_id = "chas",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.chas = {}
	self.jobs.chas.name_id = "heist_chas"
	self.jobs.chas.briefing_id = "heist_chas_crimenet"
	self.jobs.chas.contact = "jiufeng"
	self.jobs.chas.region = "street"
	self.jobs.chas.jc = 30
	self.jobs.chas.dlc = "chas"
	self.jobs.chas.chain = {
		self.stages.chas
	}
	self.jobs.chas.briefing_event = "Play_jfe_chas_cbf_01"
	self.jobs.chas.debrief_event = nil
	self.jobs.chas.crimenet_callouts = {
		"Play_jfe_chas_cnc_01"
	}
	self.jobs.chas.crimenet_videos = {
		"codex/jiufeng1"
	}
	self.jobs.chas.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.chas.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.chas.contract_visuals = {}
	self.jobs.chas.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.chas.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.chas.contract_visuals.preview_image = {
		folder = "chas",
		id = "chas"
	}
	self.jobs.chas.date_added = {
		2021,
		3,
		17
	}
	self.stages.sand = {
		dlc = "sand",
		level_id = "sand",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.sand = {}
	self.jobs.sand.name_id = "heist_sand"
	self.jobs.sand.briefing_id = "heist_sand_crimenet"
	self.jobs.sand.contact = "jiufeng"
	self.jobs.sand.region = "street"
	self.jobs.sand.jc = 30
	self.jobs.sand.dlc = "sand"
	self.jobs.sand.chain = {
		self.stages.sand
	}
	self.jobs.sand.briefing_event = "Play_jfe_sand_cbf_01"
	self.jobs.sand.debrief_event = nil
	self.jobs.sand.crimenet_callouts = {
		"Play_jfe_sand_cnc_01"
	}
	self.jobs.sand.crimenet_videos = {
		"codex/vlad1"
	}
	self.jobs.sand.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.sand.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.sand.contract_visuals = {}
	self.jobs.sand.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.sand.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.sand.contract_visuals.preview_image = {
		folder = "sand",
		id = "sand"
	}
	self.jobs.sand.date_added = {
		2021,
		6,
		16
	}
	self.stages.chca = {
		dlc = "chca",
		level_id = "chca",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.chca = {}
	self.jobs.chca.name_id = "heist_chca"
	self.jobs.chca.briefing_id = "heist_chca_crimenet"
	self.jobs.chca.contact = "vlad"
	self.jobs.chca.region = "street"
	self.jobs.chca.jc = 30
	self.jobs.chca.dlc = "chca"
	self.jobs.chca.chain = {
		self.stages.chca
	}
	self.jobs.chca.briefing_event = "Play_vld_chca_cbf_01"
	self.jobs.chca.debrief_event = nil
	self.jobs.chca.crimenet_callouts = {
		"Play_vld_chca_cnc_01"
	}
	self.jobs.chca.crimenet_videos = {
		"codex/vlad1"
	}
	self.jobs.chca.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.chca.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.chca.contract_visuals = {}
	self.jobs.chca.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.chca.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.chca.contract_visuals.preview_image = {
		folder = "chca",
		id = "chca"
	}
	self.jobs.chca.date_added = {
		2021,
		10,
		13
	}
	self.stages.pent = {
		dlc = "pent",
		level_id = "pent",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.pent = {}
	self.jobs.pent.name_id = "heist_pent"
	self.jobs.pent.briefing_id = "heist_pent_crimenet"
	self.jobs.pent.contact = "shayu"
	self.jobs.pent.region = "street"
	self.jobs.pent.jc = 30
	self.jobs.pent.dlc = "pent"
	self.jobs.pent.chain = {
		self.stages.pent
	}
	self.jobs.pent.briefing_event = "Play_sha_pent_cbf_01"
	self.jobs.pent.debrief_event = nil
	self.jobs.pent.crimenet_callouts = {
		"Play_sha_pent_cnc_01"
	}
	self.jobs.pent.crimenet_videos = {
		"codex/shayu1"
	}
	self.jobs.pent.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.pent.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.pent.contract_visuals = {}
	self.jobs.pent.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.pent.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.pent.contract_visuals.preview_image = {
		folder = "pent",
		id = "pent"
	}
	self.jobs.pent.date_added = {
		2022,
		3,
		9
	}
	self.stages.ranc = {
		dlc = "ranc",
		level_id = "ranc",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.ranc = {}
	self.jobs.ranc.name_id = "heist_ranc"
	self.jobs.ranc.briefing_id = "heist_ranc_crimenet"
	self.jobs.ranc.contact = "mcshay"
	self.jobs.ranc.region = "street"
	self.jobs.ranc.jc = 30
	self.jobs.ranc.dlc = "ranc"
	self.jobs.ranc.chain = {
		self.stages.ranc
	}
	self.jobs.ranc.briefing_event = "Play_gem_ranc_cbf"
	self.jobs.ranc.debrief_event = nil
	self.jobs.ranc.crimenet_callouts = {
		"Play_gem_ranc_cnc"
	}
	self.jobs.ranc.crimenet_videos = {
		"codex/mcshay1"
	}
	self.jobs.ranc.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.ranc.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.ranc.contract_visuals = {}
	self.jobs.ranc.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.ranc.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.ranc.contract_visuals.preview_image = {
		folder = "ranc",
		id = "ranc"
	}
	self.jobs.ranc.date_added = {
		2022,
		6,
		21
	}
	self.stages.trai = {
		dlc = "trai",
		level_id = "trai",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.trai = {}
	self.jobs.trai.name_id = "heist_trai"
	self.jobs.trai.briefing_id = "heist_trai_crimenet"
	self.jobs.trai.contact = "mcshay"
	self.jobs.trai.region = "street"
	self.jobs.trai.jc = 30
	self.jobs.trai.dlc = "trai"
	self.jobs.trai.chain = {
		self.stages.trai
	}
	self.jobs.trai.briefing_event = "Play_gem_trai_cbf"
	self.jobs.trai.debrief_event = nil
	self.jobs.trai.crimenet_callouts = {
		"Play_gem_trai_cnc"
	}
	self.jobs.trai.crimenet_videos = {
		"codex/mcshay1"
	}
	self.jobs.trai.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.trai.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.trai.contract_visuals = {}
	self.jobs.trai.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.trai.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.trai.contract_visuals.preview_image = {
		folder = "trai",
		id = "trai"
	}
	self.jobs.trai.date_added = {
		2022,
		10,
		25
	}
	self.stages.corp = {
		dlc = "corp",
		level_id = "corp",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.corp = {}
	self.jobs.corp.name_id = "heist_corp"
	self.jobs.corp.briefing_id = "heist_corp_crimenet"
	self.jobs.corp.contact = "blaine"
	self.jobs.corp.region = "street"
	self.jobs.corp.jc = 30
	self.jobs.corp.dlc = "corp"
	self.jobs.corp.chain = {
		self.stages.corp
	}
	self.jobs.corp.briefing_event = "Play_kee_corp_cbf"
	self.jobs.corp.debrief_event = nil
	self.jobs.corp.crimenet_callouts = {
		"Play_kee_corp_cnc"
	}
	self.jobs.corp.crimenet_videos = {
		"codex/blaine1"
	}
	self.jobs.corp.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.corp.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.corp.contract_visuals = {}
	self.jobs.corp.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.corp.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.corp.contract_visuals.preview_image = {
		folder = "corp",
		id = "corp"
	}
	self.jobs.corp.date_added = {
		2023,
		2,
		22
	}
	self.stages.deep = {
		dlc = "deep",
		level_id = "deep",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.deep = {}
	self.jobs.deep.name_id = "heist_deep"
	self.jobs.deep.briefing_id = "heist_deep_crimenet"
	self.jobs.deep.contact = "blaine"
	self.jobs.deep.region = "street"
	self.jobs.deep.jc = 30
	self.jobs.deep.dlc = "deep"
	self.jobs.deep.chain = {
		self.stages.deep
	}
	self.jobs.deep.briefing_event = "Play_kee_deep_cbf"
	self.jobs.deep.debrief_event = nil
	self.jobs.deep.crimenet_callouts = {
		"Play_kee_deep_cnc"
	}
	self.jobs.deep.crimenet_videos = {
		"codex/blaine1"
	}
	self.jobs.deep.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.deep.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.deep.contract_visuals = {}
	self.jobs.deep.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.deep.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.deep.contract_visuals.preview_image = {
		folder = "deep",
		id = "deep"
	}
	self.jobs.deep.date_added = {
		2023,
		1,
		23
	}
	self.stages.bossp = {
		dlc = "deep",
		level_id = "boss",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.boss = {}
	self.jobs.boss.name_id = "heist_boss"
	self.jobs.boss.briefing_id = "heist_boss_crimenet"
	self.jobs.boss.contact = "blaine"
	self.jobs.boss.region = "street"
	self.jobs.boss.jc = 30
	self.jobs.boss.dlc = "deep"
	self.jobs.boss.chain = {
		self.stages.boss
	}
	self.jobs.boss.briefing_event = "Play_kee_deep_cbf"
	self.jobs.boss.debrief_event = nil
	self.jobs.boss.crimenet_callouts = {
		"Play_kee_deep_cnc"
	}
	self.jobs.boss.crimenet_videos = {
		"codex/blaine1"
	}
	self.jobs.boss.payout = {
		50000,
		125000,
		250000,
		550000,
		700000,
		700000,
		700000
	}
	self.jobs.boss.contract_cost = {
		24000,
		48000,
		120000,
		240000,
		300000,
		300000,
		300000
	}
	self.jobs.boss.contract_visuals = {}
	self.jobs.boss.contract_visuals.min_mission_xp = {
		14200,
		14200,
		14200,
		14200,
		14200,
		14200,
		14200
	}
	self.jobs.boss.contract_visuals.max_mission_xp = {
		23200,
		23200,
		23200,
		23200,
		23200,
		23200,
		23200
	}
	self.jobs.boss.contract_visuals.preview_image = {
		folder = "ranc",
		id = "ranc"
	}
	self.jobs.boss.date_added = {
		2023,
		1,
		23
	}
	self.stages.lbe_lobby_end = {
		level_id = "lbe_lobby_end",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			2
		}
	}
	self.jobs.lbe_lobby_end = {}
	self.jobs.lbe_lobby_end.name_id = "heist_lbe_lobby_end"
	self.jobs.lbe_lobby_end.briefing_id = "heist_lbe_lobby_end_crimenet"
	self.jobs.lbe_lobby_end.package = "packages/load_default"
	self.jobs.lbe_lobby_end.contact = "wip"
	self.jobs.lbe_lobby_end.region = "street"
	self.jobs.lbe_lobby_end.jc = 30
	self.jobs.lbe_lobby_end.chain = {
		self.stages.lbe_lobby_end
	}
	self.jobs.lbe_lobby_end.briefing_event = "pln_branchbank_cash_brf_speak"
	self.jobs.lbe_lobby_end.debrief_event = nil
	self.jobs.lbe_lobby_end.crimenet_callouts = {
		"pln_branchbank_cash_cnc_01"
	}
	self.jobs.lbe_lobby_end.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.lbe_lobby_end.payout = {
		10000,
		15000,
		40000,
		60000,
		75000,
		75000,
		75000
	}
	self.jobs.lbe_lobby_end.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.lbe_lobby_end.contract_visuals = {}
	self.jobs.lbe_lobby_end.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.lbe_lobby_end.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.stages.lbe_lobby = {
		level_id = "lbe_lobby",
		type = "d",
		type_id = "heist_type_assault",
		mission_filter = {
			1
		}
	}
	self.jobs.lbe_lobby = {}
	self.jobs.lbe_lobby.name_id = "heist_lbe_lobby"
	self.jobs.lbe_lobby.briefing_id = "heist_lbe_lobby_crimenet"
	self.jobs.lbe_lobby.package = "packages/load_default"
	self.jobs.lbe_lobby.contact = "wip"
	self.jobs.lbe_lobby.region = "street"
	self.jobs.lbe_lobby.jc = 30
	self.jobs.lbe_lobby.chain = {
		self.stages.lbe_lobby,
		self.stages.bbv,
		self.stages.lbe_lobby_end
	}
	self.jobs.lbe_lobby.briefing_event = "pln_branchbank_cash_brf_speak"
	self.jobs.lbe_lobby.debrief_event = nil
	self.jobs.lbe_lobby.crimenet_callouts = {
		"pln_branchbank_cash_cnc_01"
	}
	self.jobs.lbe_lobby.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank2",
		"cn_branchbank3"
	}
	self.jobs.lbe_lobby.payout = {
		10000,
		15000,
		40000,
		60000,
		75000,
		75000,
		75000
	}
	self.jobs.lbe_lobby.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.lbe_lobby.contract_visuals = {}
	self.jobs.lbe_lobby.contract_visuals.min_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.jobs.lbe_lobby.contract_visuals.max_mission_xp = {
		12000,
		12000,
		12000,
		12000,
		12000,
		12000,
		12000
	}
	self.stages.nmh = {
		dlc = "nmh_ipcontent",
		level_id = "nmh",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.nmh = {}
	self.jobs.nmh.name_id = "heist_nmh"
	self.jobs.nmh.briefing_id = "heist_nmh_crimenet"
	self.jobs.nmh.contact = "classic"
	self.jobs.nmh.region = "street"
	self.jobs.nmh.jc = 30
	self.jobs.nmh.chain = {
		self.stages.nmh
	}
	self.jobs.nmh.briefing_event = "Play_rb1_nmh_cbf_01"
	self.jobs.nmh.debrief_event = nil
	self.jobs.nmh.crimenet_callouts = {
		"Play_pln_nmh_cnc_01"
	}
	self.jobs.nmh.crimenet_videos = {
		"cn_branchbank1",
		"cn_branchbank3"
	}
	self.jobs.nmh.payout = {
		60000,
		74000,
		125000,
		185000,
		260000,
		260000,
		260000
	}
	self.jobs.nmh.contract_cost = {
		31000,
		62000,
		155000,
		310000,
		400000,
		400000,
		400000
	}
	self.jobs.nmh.contract_visuals = {}
	self.jobs.nmh.contract_visuals.min_mission_xp = {
		22400,
		22400,
		22400,
		22400,
		22400,
		22400,
		22400
	}
	self.jobs.nmh.contract_visuals.max_mission_xp = {
		32000,
		32000,
		32000,
		32000,
		32000,
		32000,
		32000
	}
	self.jobs.nmh.contract_visuals.preview_image = {
		folder = "nmh",
		id = "nmh"
	}
	self.jobs.nmh.date_added = {
		2018,
		10,
		30
	}
	self.stages.sah = {
		level_id = "sah",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.sah = {}
	self.jobs.sah.name_id = "heist_sah"
	self.jobs.sah.briefing_id = "heist_sah_crimenet"
	self.jobs.sah.contact = "locke"
	self.jobs.sah.region = "street"
	self.jobs.sah.jc = 30
	self.jobs.sah.chain = {
		self.stages.sah
	}
	self.jobs.sah.load_screen = "guis/dlcs/sah/textures/loading/job_sah_df"
	self.jobs.sah.briefing_event = "Play_rb22_sah_cbf_01"
	self.jobs.sah.debrief_event = nil
	self.jobs.sah.crimenet_callouts = {
		"Play_loc_sah_cnc_01"
	}
	self.jobs.sah.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.sah.payout = {
		100000,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.jobs.sah.contract_cost = {
		70000,
		150000,
		350307,
		700000,
		900000,
		900000,
		900000
	}
	self.jobs.sah.contract_visuals = {}
	self.jobs.sah.contract_visuals.min_mission_xp = {
		11000,
		11000,
		11000,
		11000,
		11000,
		11000,
		11000
	}
	self.jobs.sah.contract_visuals.max_mission_xp = {
		23000,
		23000,
		23000,
		23000,
		23000,
		23000,
		23000
	}
	self.jobs.sah.contract_visuals.preview_image = {
		folder = "sah",
		id = "sah"
	}
	self.jobs.sah.date_added = {
		2018,
		8,
		15
	}

	local skirmish_payout = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	local skirmish_exp = {
		max = 135900,
		min = 8000
	}

	self.stages.skm_mus = {
		level_id = "skm_mus",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.skm_mus = {}
	self.jobs.skm_mus.name_id = "heist_skm_mus"
	self.jobs.skm_mus.briefing_id = "heist_skm_mus_crimenet"
	self.jobs.skm_mus.contact = "skirmish"
	self.jobs.skm_mus.region = "street"
	self.jobs.skm_mus.jc = 50
	self.jobs.skm_mus.chain = {
		self.stages.skm_mus
	}
	self.jobs.skm_mus.briefing_event = "dentist_hd1_cbf_01"
	self.jobs.skm_mus.debrief_event = {
		"dentist_hd1_debrief_01",
		"dentist_hd1_debrief_02"
	}
	self.jobs.skm_mus.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.skm_mus.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.skm_mus.payout = skirmish_payout
	self.jobs.skm_mus.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.skm_mus.contract_visuals = {}
	self.jobs.skm_mus.contract_visuals.min_mission_xp = skirmish_exp.min
	self.jobs.skm_mus.contract_visuals.max_mission_xp = skirmish_exp.max
	self.jobs.skm_mus.contract_visuals.preview_image = {
		folder = "shl",
		id = "skm_mus"
	}
	self.jobs.skm_mus.contract_visuals.weekly_skirmish_image = "guis/textures/pd2/skirmish/menu_landing_mus"
	self.jobs.skm_mus.date_added = {
		2018,
		4,
		23
	}
	self.stages.skm_red2 = {
		level_id = "skm_red2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.skm_red2 = {}
	self.jobs.skm_red2.name_id = "heist_skm_red2"
	self.jobs.skm_red2.briefing_id = "heist_skm_red2_crimenet"
	self.jobs.skm_red2.contact = "skirmish"
	self.jobs.skm_red2.region = "street"
	self.jobs.skm_red2.jc = 60
	self.jobs.skm_red2.chain = {
		self.stages.skm_red2
	}
	self.jobs.skm_red2.briefing_event = "pln_fwb_cbf_01"
	self.jobs.skm_red2.debrief_event = "pln_fwb_34"
	self.jobs.skm_red2.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.skm_red2.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.skm_red2.payout = skirmish_payout
	self.jobs.skm_red2.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.skm_red2.contract_visuals = {}
	self.jobs.skm_red2.contract_visuals.min_mission_xp = skirmish_exp.min
	self.jobs.skm_red2.contract_visuals.max_mission_xp = skirmish_exp.max
	self.jobs.skm_red2.contract_visuals.preview_image = {
		folder = "shl",
		id = "skm_red2"
	}
	self.jobs.skm_red2.contract_visuals.weekly_skirmish_image = "guis/textures/pd2/skirmish/menu_landing_red2"
	self.jobs.skm_red2.date_added = {
		2018,
		4,
		23
	}
	self.stages.skm_run = {
		level_id = "skm_run",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.skm_run = {}
	self.jobs.skm_run.name_id = "heist_skm_run"
	self.jobs.skm_run.briefing_id = "heist_skm_run_crimenet"
	self.jobs.skm_run.contact = "skirmish"
	self.jobs.skm_run.region = "street"
	self.jobs.skm_run.jc = 60
	self.jobs.skm_run.chain = {
		self.stages.skm_run
	}
	self.jobs.skm_run.briefing_event = "pln_fwb_cbf_01"
	self.jobs.skm_run.debrief_event = "pln_fwb_34"
	self.jobs.skm_run.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.skm_run.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.skm_run.payout = skirmish_payout
	self.jobs.skm_run.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.skm_run.contract_visuals = {}
	self.jobs.skm_run.contract_visuals.min_mission_xp = skirmish_exp.min
	self.jobs.skm_run.contract_visuals.max_mission_xp = skirmish_exp.max
	self.jobs.skm_run.contract_visuals.preview_image = {
		folder = "shl",
		id = "skm_run"
	}
	self.jobs.skm_run.contract_visuals.weekly_skirmish_image = "guis/textures/pd2/skirmish/menu_landing_run"
	self.jobs.skm_run.date_added = {
		2018,
		4,
		23
	}
	self.stages.skm_watchdogs_stage2 = {
		level_id = "skm_watchdogs_stage2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.skm_watchdogs_stage2 = {}
	self.jobs.skm_watchdogs_stage2.name_id = "heist_skm_watchdogs_stage2"
	self.jobs.skm_watchdogs_stage2.briefing_id = "heist_skm_watchdogs_stage2_crimenet"
	self.jobs.skm_watchdogs_stage2.contact = "skirmish"
	self.jobs.skm_watchdogs_stage2.region = "street"
	self.jobs.skm_watchdogs_stage2.jc = 60
	self.jobs.skm_watchdogs_stage2.chain = {
		self.stages.skm_watchdogs_stage2
	}
	self.jobs.skm_watchdogs_stage2.briefing_event = "pln_fwb_cbf_01"
	self.jobs.skm_watchdogs_stage2.debrief_event = "pln_fwb_34"
	self.jobs.skm_watchdogs_stage2.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.skm_watchdogs_stage2.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.skm_watchdogs_stage2.payout = skirmish_payout
	self.jobs.skm_watchdogs_stage2.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.skm_watchdogs_stage2.contract_visuals = {}
	self.jobs.skm_watchdogs_stage2.contract_visuals.min_mission_xp = skirmish_exp.min
	self.jobs.skm_watchdogs_stage2.contract_visuals.max_mission_xp = skirmish_exp.max
	self.jobs.skm_watchdogs_stage2.contract_visuals.preview_image = {
		folder = "shl",
		id = "skm_watchdogs"
	}
	self.jobs.skm_watchdogs_stage2.contract_visuals.weekly_skirmish_image = "guis/textures/pd2/skirmish/menu_landing_watchdogs"
	self.jobs.skm_watchdogs_stage2.date_added = {
		2018,
		4,
		23
	}
	self.stages.skm_bex = {
		level_id = "skm_bex",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.skm_bex = {}
	self.jobs.skm_bex.name_id = "heist_skm_bex"
	self.jobs.skm_bex.briefing_id = "heist_skm_bex_crimenet"
	self.jobs.skm_bex.contact = "skirmish"
	self.jobs.skm_bex.region = "street"
	self.jobs.skm_bex.jc = 60
	self.jobs.skm_bex.chain = {
		self.stages.skm_bex
	}
	self.jobs.skm_bex.briefing_event = "pln_fwb_cbf_01"
	self.jobs.skm_bex.debrief_event = "pln_fwb_34"
	self.jobs.skm_bex.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.skm_bex.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.skm_bex.payout = skirmish_payout
	self.jobs.skm_bex.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.skm_bex.contract_visuals = {}
	self.jobs.skm_bex.contract_visuals.min_mission_xp = skirmish_exp.min
	self.jobs.skm_bex.contract_visuals.max_mission_xp = skirmish_exp.max
	self.jobs.skm_bex.contract_visuals.preview_image = {
		folder = "shl",
		id = "skm_bex"
	}
	self.jobs.skm_bex.date_added = {
		2020,
		4,
		28
	}
	self.stages.skm_cas = {
		level_id = "skm_cas",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.skm_cas = {}
	self.jobs.skm_cas.name_id = "heist_skm_cas"
	self.jobs.skm_cas.briefing_id = "heist_skm_cas_crimenet"
	self.jobs.skm_cas.contact = "skirmish"
	self.jobs.skm_cas.region = "street"
	self.jobs.skm_cas.jc = 60
	self.jobs.skm_cas.chain = {
		self.stages.skm_cas
	}
	self.jobs.skm_cas.briefing_event = "pln_fwb_cbf_01"
	self.jobs.skm_cas.debrief_event = "pln_fwb_34"
	self.jobs.skm_cas.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.skm_cas.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.skm_cas.payout = skirmish_payout
	self.jobs.skm_cas.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.skm_cas.contract_visuals = {}
	self.jobs.skm_cas.contract_visuals.min_mission_xp = skirmish_exp.min
	self.jobs.skm_cas.contract_visuals.max_mission_xp = skirmish_exp.max
	self.jobs.skm_cas.contract_visuals.preview_image = {
		folder = "shl",
		id = "skm_cas"
	}
	self.jobs.skm_cas.date_added = {
		2020,
		4,
		28
	}
	self.stages.skm_big2 = {
		level_id = "skm_big2",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.skm_big2 = {}
	self.jobs.skm_big2.name_id = "heist_skm_big2"
	self.jobs.skm_big2.briefing_id = "heist_skm_big2_crimenet"
	self.jobs.skm_big2.contact = "skirmish"
	self.jobs.skm_big2.region = "street"
	self.jobs.skm_big2.jc = 60
	self.jobs.skm_big2.chain = {
		self.stages.skm_big2
	}
	self.jobs.skm_big2.briefing_event = "pln_fwb_cbf_01"
	self.jobs.skm_big2.debrief_event = "pln_fwb_34"
	self.jobs.skm_big2.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.skm_big2.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.skm_big2.payout = skirmish_payout
	self.jobs.skm_big2.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.skm_big2.contract_visuals = {}
	self.jobs.skm_big2.contract_visuals.min_mission_xp = skirmish_exp.min
	self.jobs.skm_big2.contract_visuals.max_mission_xp = skirmish_exp.max
	self.jobs.skm_big2.contract_visuals.preview_image = {
		folder = "shl",
		id = "skm_big2"
	}
	self.jobs.skm_big2.date_added = {
		2020,
		4,
		28
	}
	self.stages.skm_mallcrasher = {
		level_id = "skm_mallcrasher",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.skm_mallcrasher = {}
	self.jobs.skm_mallcrasher.name_id = "heist_skm_mallcrasher"
	self.jobs.skm_mallcrasher.briefing_id = "heist_skm_mallcrasher_crimenet"
	self.jobs.skm_mallcrasher.contact = "skirmish"
	self.jobs.skm_mallcrasher.region = "street"
	self.jobs.skm_mallcrasher.jc = 60
	self.jobs.skm_mallcrasher.chain = {
		self.stages.skm_mallcrasher
	}
	self.jobs.skm_mallcrasher.briefing_event = "pln_fwb_cbf_01"
	self.jobs.skm_mallcrasher.debrief_event = "pln_fwb_34"
	self.jobs.skm_mallcrasher.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.skm_mallcrasher.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.skm_mallcrasher.payout = skirmish_payout
	self.jobs.skm_mallcrasher.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.skm_mallcrasher.contract_visuals = {}
	self.jobs.skm_mallcrasher.contract_visuals.min_mission_xp = skirmish_exp.min
	self.jobs.skm_mallcrasher.contract_visuals.max_mission_xp = skirmish_exp.max
	self.jobs.skm_mallcrasher.contract_visuals.preview_image = {
		folder = "shl",
		id = "skm_mallcrasher"
	}
	self.jobs.skm_mallcrasher.date_added = {
		2020,
		4,
		28
	}
	self.stages.skm_arena = {
		level_id = "skm_arena",
		type = "d",
		type_id = "heist_type_assault"
	}
	self.jobs.skm_arena = {}
	self.jobs.skm_arena.name_id = "heist_skm_arena"
	self.jobs.skm_arena.briefing_id = "heist_skm_arena_crimenet"
	self.jobs.skm_arena.contact = "skirmish"
	self.jobs.skm_arena.region = "street"
	self.jobs.skm_arena.jc = 60
	self.jobs.skm_arena.chain = {
		self.stages.skm_arena
	}
	self.jobs.skm_arena.briefing_event = "pln_fwb_cbf_01"
	self.jobs.skm_arena.debrief_event = "pln_fwb_34"
	self.jobs.skm_arena.crimenet_callouts = {
		"Play_loc_tag_cnc_01"
	}
	self.jobs.skm_arena.crimenet_videos = {
		"codex/locke1"
	}
	self.jobs.skm_arena.payout = skirmish_payout
	self.jobs.skm_arena.contract_cost = {
		16000,
		32000,
		80000,
		160000,
		200000,
		200000,
		200000
	}
	self.jobs.skm_arena.contract_visuals = {}
	self.jobs.skm_arena.contract_visuals.min_mission_xp = skirmish_exp.min
	self.jobs.skm_arena.contract_visuals.max_mission_xp = skirmish_exp.max
	self.jobs.skm_arena.contract_visuals.preview_image = {
		folder = "shl",
		id = "skm_arena"
	}
	self.jobs.skm_arena.date_added = {
		2020,
		4,
		28
	}
	self._jobs_index = {
		"jewelry_store",
		"four_stores",
		"nightclub",
		"mallcrasher",
		"ukrainian_job_prof",
		"branchbank_deposit",
		"branchbank_cash",
		"branchbank_prof",
		"branchbank_gold_prof",
		"firestarter",
		"alex",
		"watchdogs_wrapper",
		"watchdogs",
		"watchdogs_night",
		"framing_frame",
		"welcome_to_the_jungle_wrapper_prof",
		"welcome_to_the_jungle_prof",
		"welcome_to_the_jungle_night_prof",
		"family",
		"election_day",
		"kosugi",
		"arm_fac",
		"arm_par",
		"arm_hcm",
		"arm_und",
		"arm_cro",
		"arm_for",
		"big",
		"mia",
		"gallery",
		"hox",
		"hox_3",
		"pines",
		"cage",
		"mus",
		"crojob1",
		"crojob_wrapper",
		"crojob2",
		"crojob2_night",
		"rat",
		"shoutout_raid",
		"arena",
		"kenaz",
		"jolly",
		"red2",
		"dinner",
		"nail",
		"cane",
		"pbr",
		"pbr2",
		"peta",
		"pal",
		"man",
		"mad",
		"dark",
		"born",
		"chill",
		"chill_combat",
		"friend",
		"flat",
		"help",
		"haunted",
		"spa",
		"fish",
		"moon",
		"run",
		"glace",
		"dah",
		"rvd",
		"crime_spree",
		"hvh",
		"wwh",
		"brb",
		"tag",
		"des",
		"nmh",
		"sah",
		"skm_mus",
		"skm_red2",
		"skm_run",
		"skm_watchdogs_stage2",
		"skm_cas",
		"skm_big2",
		"skm_mallcrasher",
		"skm_arena",
		"skm_bex",
		"vit",
		"bph",
		"mex",
		"mex_cooking",
		"bex",
		"pex",
		"fex",
		"chas",
		"sand",
		"chca",
		"pent",
		"ranc",
		"trai",
		"corp",
		"deep"
	}
	self.forced_jobs = {
		arm_cro = true,
		arm_fac = true,
		arm_for = true,
		arm_hcm = true,
		arm_par = true,
		arm_und = true,
		branchbank_cash = true,
		branchbank_deposit = true,
		branchbank_gold_prof = true,
		branchbank_prof = true,
		brb = true,
		dark = true,
		dinner = true,
		election_day = true,
		family = true,
		firestarter = true,
		fish = true,
		flat = true,
		four_stores = true,
		friend = true,
		gallery = true,
		help = true,
		hox = true,
		hox_3 = true,
		jewelry_store = true,
		kosugi = true,
		mad = true,
		mallcrasher = true,
		man = true,
		mia = true,
		moon = true,
		nightclub = true,
		pal = true,
		pines = true,
		red2 = true,
		run = true,
		rvd = true,
		spa = true,
		ukrainian_job_prof = true,
		watchdogs_wrapper = true,
		welcome_to_the_jungle = true,
		welcome_to_the_jungle_night = true,
		welcome_to_the_jungle_night_prof = true,
		welcome_to_the_jungle_prof = true,
		welcome_to_the_jungle_wrapper = true,
		welcome_to_the_jungle_wrapper_prof = true,
		wwh = true
	}

	table.insert(self._jobs_index, "roberts")
	self:set_job_wrappers()

	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.jobs) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end
end

function NarrativeTweakData:set_job_wrappers()
	for _, job_id in ipairs(self._jobs_index) do
		local job_wrapper = self.jobs[job_id].job_wrapper

		if job_wrapper then
			for _, wrapped_job_id in ipairs(job_wrapper) do
				if self.jobs[wrapped_job_id].job_wrapper then
					Application:throw_exception("Can't wrap " .. tostring(wrapped_job_id) .. " into another wrapper.")
				elseif self.jobs[wrapped_job_id].wrapped_to_job then
					Application:throw_exception("The job " .. tostring(wrapped_job_id) .. " is already included in another wrapper (" .. tostring(self.jobs[wrapped_job_id].wrapped_to_job) .. ")")
				else
					self.jobs[wrapped_job_id].wrapped_to_job = job_id
				end
			end
		end
	end
end

function NarrativeTweakData:has_job_wrapper(job_id)
	return not not self.jobs[job_id] and not not self.jobs[job_id].job_wrapper
end

function NarrativeTweakData:is_wrapped_to_job(job_id)
	return not not self.jobs[job_id] and not not self.jobs[job_id].wrapped_to_job
end

function NarrativeTweakData:get_jobs_index()
	return self._jobs_index
end

function NarrativeTweakData:get_index_from_job_id(job_id)
	for index, entry_name in ipairs(self._jobs_index) do
		if entry_name == job_id then
			return index
		end
	end

	return 0
end

function NarrativeTweakData:get_job_name_from_index(index)
	return self._jobs_index[index]
end

function NarrativeTweakData:job_data(job_id, unique_to_job)
	if not job_id or not self.jobs[job_id] then
		return
	end

	if unique_to_job then
		return self.jobs[job_id]
	end

	if self.jobs[job_id].wrapped_to_job then
		return self.jobs[self.jobs[job_id].wrapped_to_job]
	end

	return self.jobs[job_id]
end

function NarrativeTweakData:job_chain(job_id)
	if not job_id or not self.jobs[job_id] then
		return {}
	end

	if self.jobs[job_id].job_wrapper then
		return self.jobs[self.jobs[job_id].job_wrapper[1]].chain or {}
	end

	return self.jobs[job_id].chain or {}
end

function NarrativeTweakData:create_job_name(job_id, skip_professional)
	local color_ranges = {}
	local job_tweak = self:job_data(job_id)
	local text_id = managers.localization:to_upper_text(job_tweak.name_id)

	if job_tweak.dlc and (not tweak_data.dlc[job_tweak.dlc] or not tweak_data.dlc[job_tweak.dlc].free) then
		local pro_text = "  "

		if job_tweak.dlc == "pd2_clan" then
			if IS_STEAM then
				pro_text = pro_text .. managers.localization:to_upper_text("cn_menu_community")
			end
		else
			pro_text = pro_text .. managers.localization:to_upper_text("cn_menu_dlc")
		end

		local s_len = utf8.len(text_id)

		text_id = text_id .. pro_text

		local e_len = utf8.len(text_id)

		table.insert(color_ranges, {
			start = s_len,
			stop = e_len,
			color = job_tweak.dlc == "pd2_clan" and tweak_data.screen_colors.community_color or tweak_data.screen_colors.dlc_color
		})
	end

	if not skip_professional and job_tweak.professional then
		local pro_text = "  " .. managers.localization:to_upper_text("cn_menu_pro_job")
		local s_len = utf8.len(text_id)

		text_id = text_id .. pro_text

		local e_len = utf8.len(text_id)

		table.insert(color_ranges, {
			start = s_len,
			stop = e_len,
			color = tweak_data.screen_colors.pro_color
		})
	end

	if job_tweak.competitive then
		local competitive_text = "  " .. managers.localization:to_upper_text("cn_menu_competitive_job")
		local s_len = utf8.len(text_id)

		text_id = text_id .. competitive_text

		local e_len = utf8.len(text_id)

		table.insert(color_ranges, {
			start = s_len,
			stop = e_len,
			color = tweak_data.screen_colors.competitive_color
		})
	end

	if job_tweak.contact == "skirmish" then
		local holdout_text = "  " .. managers.localization:to_upper_text("menu_cn_skirmish")
		local s_len = utf8.len(text_id)

		text_id = text_id .. holdout_text

		local e_len = utf8.len(text_id)

		table.insert(color_ranges, {
			start = s_len,
			stop = e_len,
			color = tweak_data.screen_colors.skirmish_color
		})
	end

	if job_tweak.contact == "escape" then
		local escape_text = "  " .. managers.localization:to_upper_text("hud_e_framing_frame_stage3_mission9_hl")
		local s_len = utf8.len(text_id)

		text_id = text_id .. escape_text

		local e_len = utf8.len(text_id)

		table.insert(color_ranges, {
			start = s_len,
			stop = e_len,
			color = tweak_data.screen_colors.pro_color
		})
	end

	return text_id, color_ranges
end

function NarrativeTweakData:test_contract_packages()
	for i, job_id in ipairs(self._jobs_index) do
		local package = self.jobs[job_id] and self.jobs[job_id].package

		if not package or not DB:has(Idstring("package"), package) then
			print("test_contract_packages", "1", job_id)
		end
	end

	for job_id, job in ipairs(self.jobs) do
		if job.package and not DB:has(Idstring("package"), job.package) then
			print("test_contract_packages", "2", job_id)
		end
	end
end

function NarrativeTweakData:get_jcs_from_stars(stars, infamy)
	if type(stars) ~= "number" then
		return {}
	end

	stars = math.clamp(stars, 1, 10)

	return (infamy and self.INFAMY_STARS[stars] or self.STARS[stars] or {}).jcs or {}
end

function NarrativeTweakData:is_job_locked(job_id)
	return false
end
