LevelsTweakData = LevelsTweakData or class()
LevelsTweakData.LevelType = {}
LevelsTweakData.LevelType.America = "america"
LevelsTweakData.LevelType.Russia = "russia"
LevelsTweakData.LevelType.Zombie = "zombie"
LevelsTweakData.LevelType.Murkywater = "murkywater"
LevelsTweakData.LevelType.Federales = "federales"

function LevelsTweakData:init()
	local america = LevelsTweakData.LevelType.America
	local russia = LevelsTweakData.LevelType.Russia
	local zombie = LevelsTweakData.LevelType.Zombie
	local murkywater = LevelsTweakData.LevelType.Murkywater
	local federales = LevelsTweakData.LevelType.Federales

	self.ai_groups = {}
	self.ai_groups.default = america
	self.ai_groups.america = america
	self.ai_groups.russia = russia
	self.ai_groups.zombie = zombie
	self.ai_groups.murkywater = murkywater
	self.ai_groups.federales = federales
	self.framing_frame_1 = {}
	self.framing_frame_1.name_id = "heist_framing_frame_1_hl"
	self.framing_frame_1.briefing_id = "heist_framing_frame_1_briefing"
	self.framing_frame_1.briefing_dialog = "Play_pln_framing_stage1_brief"
	self.framing_frame_1.world_name = "narratives/e_framing_frame/stage_1"
	self.framing_frame_1.intro_event = "Play_pln_framing_stage1_intro_a"
	self.framing_frame_1.outro_event = {
		"Play_pln_framing_stage1_end_a",
		"Play_pln_framing_stage1_end_b"
	}
	self.framing_frame_1.music = "heist"
	self.framing_frame_1.package = {
		"packages/narr_framing_1"
	}
	self.framing_frame_1.cube = "cube_apply_heist_bank"
	self.framing_frame_1.ghost_bonus = 0.075
	self.framing_frame_1.max_bags = 13
	self.framing_frame_1.ai_group_type = america
	self.framing_frame_1.load_screen = "guis/dlcs/pic/textures/loading/job_framingframe_01"
	self.framing_frame_2 = {}
	self.framing_frame_2.name_id = "heist_framing_frame_2_hl"
	self.framing_frame_2.briefing_id = "heist_framing_frame_2_briefing"
	self.framing_frame_2.briefing_dialog = "Play_pln_framing_stage2_brief"
	self.framing_frame_2.world_name = "narratives/e_framing_frame/stage_2"
	self.framing_frame_2.intro_event = "Play_pln_framing_stage2_intro_a"
	self.framing_frame_2.outro_event = {
		"Play_pln_framing_stage2_end_a",
		"Play_pln_framing_stage2_end_b"
	}
	self.framing_frame_2.music = "heist"
	self.framing_frame_2.package = {
		"packages/narr_framing_2"
	}
	self.framing_frame_2.cube = "cube_apply_heist_bank"
	self.framing_frame_2.ghost_bonus = 0.025
	self.framing_frame_2.max_bags = 13
	self.framing_frame_2.repossess_bags = true
	self.framing_frame_2.ai_group_type = america
	self.framing_frame_2.load_screen = "guis/dlcs/pic/textures/loading/job_frame02"
	self.framing_frame_3 = {}
	self.framing_frame_3.name_id = "heist_framing_frame_3_hl"
	self.framing_frame_3.briefing_id = "heist_framing_frame_3_briefing"
	self.framing_frame_3.briefing_dialog = "Play_pln_framing_stage3_brief"
	self.framing_frame_3.world_name = "narratives/e_framing_frame/stage_3"
	self.framing_frame_3.intro_event = "Play_pln_framing_stage3_intro"
	self.framing_frame_3.outro_event = {
		"Play_pln_framing_stage3_end_a",
		"Play_pln_framing_stage3_end_b",
		"Play_pln_framing_stage3_end_c"
	}
	self.framing_frame_3.music = "heist"
	self.framing_frame_3.package = "packages/narr_framing_3"
	self.framing_frame_3.cube = "cube_apply_heist_bank"
	self.framing_frame_3.ghost_bonus = 0.15
	self.framing_frame_3.max_bags = 21
	self.framing_frame_3.ai_group_type = america
	self.framing_frame_3.load_screen = "guis/dlcs/pic/textures/loading/job_framingframe_03"
	self.election_day_1 = {}
	self.election_day_1.name_id = "heist_election_day_1_hl"
	self.election_day_1.briefing_id = "eday1_brief"
	self.election_day_1.briefing_dialog = "Play_pln_ed1_brf"
	self.election_day_1.world_name = "narratives/e_election_day/stage_1"
	self.election_day_1.intro_event = "Play_pln_ed1_intro_a"
	self.election_day_1.outro_event = {
		"Play_pln_ed1_end_a",
		"Play_pln_ed1_end_b",
		"Play_pln_ed1_end_c"
	}
	self.election_day_1.music = "heist"
	self.election_day_1.package = {
		"packages/narr_election1"
	}
	self.election_day_1.cube = "cube_apply_heist_bank"
	self.election_day_1.ghost_bonus = 0.05
	self.election_day_1.max_bags = 0
	self.election_day_1.ai_group_type = america
	self.election_day_1.load_screen = "guis/dlcs/pic/textures/loading/job_electionday_01"
	self.election_day_2 = {}
	self.election_day_2.name_id = "heist_election_day_2_hl"
	self.election_day_2.briefing_id = "eday2_brief"
	self.election_day_2.briefing_dialog = "Play_pln_ed2_brf"
	self.election_day_2.world_name = "narratives/e_election_day/stage_2"
	self.election_day_2.intro_event = "Play_pln_ed2_intro_a"
	self.election_day_2.outro_event = {
		"Play_pln_ed2_end_a",
		"Play_pln_ed2_end_b"
	}
	self.election_day_2.music = "heist"
	self.election_day_2.package = {
		"packages/narr_election2"
	}
	self.election_day_2.cube = "cube_apply_heist_bank"
	self.election_day_2.ghost_bonus = 0.15
	self.election_day_2.max_bags = 21
	self.election_day_2.ai_group_type = america
	self.election_day_2.load_screen = "guis/dlcs/pic/textures/loading/job_electionday_02"
	self.election_day_3 = {}
	self.election_day_3.name_id = "heist_election_day_3_hl"
	self.election_day_3.briefing_id = "eday3_brief_skip1"
	self.election_day_3.briefing_dialog = "Play_pln_ed3_brf_b"
	self.election_day_3.world_name = "narratives/e_election_day/stage_3"
	self.election_day_3.intro_event = "Play_pln_ed3_intro_a"
	self.election_day_3.outro_event = "Play_pln_ed3_end_a"
	self.election_day_3.music = "heist"
	self.election_day_3.package = "packages/narr_election3"
	self.election_day_3.cube = "cube_apply_heist_bank"
	self.election_day_3.max_bags = 16
	self.election_day_3.ai_group_type = america
	self.election_day_3.load_screen = "guis/dlcs/pic/textures/loading/job_electionday_03"
	self.election_day_3_skip1 = deep_clone(self.election_day_3)
	self.election_day_3_skip1.briefing_id = "eday3_brief_skip1"
	self.election_day_3_skip1.briefing_dialog = "Play_pln_ed3_brf_b"
	self.election_day_3_skip2 = deep_clone(self.election_day_3)
	self.election_day_3_skip2.briefing_id = "eday3_brief_skip2"
	self.election_day_3_skip2.briefing_dialog = "Play_pln_ed3_brf_c"
	self.alex_1 = {}
	self.alex_1.name_id = "heist_alex_1_hl"
	self.alex_1.briefing_id = "heist_alex_1_briefing"
	self.alex_1.briefing_dialog = "Play_pln_rat_stage1_brief"
	self.alex_1.world_name = "narratives/h_alex_must_die/stage_1"
	self.alex_1.intro_event = "Play_pln_rat_stage1_intro_a"
	self.alex_1.outro_event = {
		"Play_pln_rat_stage1_end_a",
		"Play_pln_rat_stage1_end_b",
		"Play_pln_rat_stage1_end_c"
	}
	self.alex_1.music = "heist"
	self.alex_1.package = "packages/narr_alex1"
	self.alex_1.cube = "cube_apply_heist_bank"
	self.alex_1.max_bags = 11
	self.alex_1.ai_group_type = america
	self.alex_1.load_screen = "guis/dlcs/pic/textures/loading/job_rats01"
	self.alex_2 = {}
	self.alex_2.name_id = "heist_alex_2_hl"
	self.alex_2.briefing_id = "heist_alex_2_briefing"
	self.alex_2.briefing_dialog = "Play_pln_rat_stage2_brief"
	self.alex_2.world_name = "narratives/h_alex_must_die/stage_2"
	self.alex_2.intro_event = "Play_pln_rat_stage2_intro_a"
	self.alex_2.outro_event = {
		"Play_pln_rat_stage2_end_a",
		"Play_pln_rat_stage2_end_b",
		"Play_pln_rat_stage2_end_c",
		"Play_pln_rat_stage2_end_d",
		"Play_pln_rat_stage2_end_e"
	}
	self.alex_2.music = "heist"
	self.alex_2.package = "packages/narr_alex2"
	self.alex_2.cube = "cube_apply_heist_bank"
	self.alex_2.max_bags = 19
	self.alex_2.repossess_bags = true
	self.alex_2.ai_group_type = america
	self.alex_2.load_screen = "guis/dlcs/pic/textures/loading/job_rats02"
	self.alex_3 = {}
	self.alex_3.name_id = "heist_alex_3_hl"
	self.alex_3.briefing_id = "heist_alex_3_briefing"
	self.alex_3.briefing_dialog = "Play_pln_rat_stage3_brief"
	self.alex_3.world_name = "narratives/h_alex_must_die/stage_3"
	self.alex_3.intro_event = "Play_pln_rat_stage3_intro_a"
	self.alex_3.outro_event = {
		"Play_pln_rat_stage3_end_a",
		"Play_pln_rat_stage3_end_b",
		"Play_pln_rat_stage3_end_c"
	}
	self.alex_3.music = "heist"
	self.alex_3.package = "packages/narr_alex3"
	self.alex_3.cube = "cube_apply_heist_bank"
	self.alex_3.max_bags = 34
	self.alex_3.ai_group_type = america
	self.alex_3.load_screen = "guis/dlcs/pic/textures/loading/job_rats03"
	self.watchdogs_1 = {}
	self.watchdogs_1.name_id = "heist_watchdogs_1_hl"
	self.watchdogs_1.briefing_id = "heist_watchdogs_1_briefing"
	self.watchdogs_1.briefing_dialog = "Play_pln_watchdogs_new_stage1_brief"
	self.watchdogs_1.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_watchdogs_1")
	self.watchdogs_1.world_name = "narratives/h_watchdogs/stage_1"
	self.watchdogs_1.intro_event = "Play_pln_watchdogs_new_stage1_intro_a"
	self.watchdogs_1.outro_event = {
		"Play_pln_watchdogs_new_stage1_end_a",
		"Play_pln_watchdogs_new_stage1_end_b"
	}
	self.watchdogs_1.music = "heist"
	self.watchdogs_1.package = {
		"packages/narr_watchdogs1"
	}
	self.watchdogs_1.cube = "cube_apply_heist_bank"
	self.watchdogs_1.max_bags = 16
	self.watchdogs_1.ai_group_type = america
	self.watchdogs_1.load_screen = "guis/dlcs/pic/textures/loading/job_watchdogs_01"
	self.watchdogs_1_night = deep_clone(self.watchdogs_1)
	self.watchdogs_1_night.env_params = {
		environment = "environments/pd2_env_night/pd2_env_night"
	}
	self.watchdogs_1_night.package = {
		"packages/narr_watchdogs1_night"
	}
	self.watchdogs_2 = {}
	self.watchdogs_2.name_id = "heist_watchdogs_2_hl"
	self.watchdogs_2.briefing_id = "heist_watchdogs_2_briefing"
	self.watchdogs_2.briefing_dialog = "Play_pln_watchdogs_new_stage2_brief"
	self.watchdogs_2.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_watchdogs_2")
	self.watchdogs_2.world_name = "narratives/h_watchdogs/stage_2"
	self.watchdogs_2.intro_event = {
		"Play_pln_watchdogs_new_stage2_intro_a",
		"Play_pln_watchdogs_new_stage2_intro_b"
	}
	self.watchdogs_2.outro_event = {
		"Play_pln_watchdogs_new_stage2_end_a",
		"Play_pln_watchdogs_new_stage2_end_b"
	}
	self.watchdogs_2.music = "heist"
	self.watchdogs_2.package = {
		"packages/narr_watchdogs2"
	}
	self.watchdogs_2.cube = "cube_apply_heist_bank"
	self.watchdogs_2.max_bags = 16
	self.watchdogs_2.repossess_bags = true
	self.watchdogs_2.ai_group_type = america
	self.watchdogs_2.load_screen = "guis/dlcs/pic/textures/loading/job_watchdogs_02"
	self.watchdogs_2_day = deep_clone(self.watchdogs_2)
	self.watchdogs_2_day.env_params = {
		environment = "environments/pd2_env_wd2_evening/pd2_env_wd2_evening"
	}
	self.watchdogs_2_day.package = {
		"packages/narr_watchdogs2_day"
	}
	self.firestarter_1 = {}
	self.firestarter_1.name_id = "heist_firestarter_1_hl"
	self.firestarter_1.briefing_id = "heist_firestarter_1_briefing"
	self.firestarter_1.briefing_dialog = "Play_pln_firestarter_stage1_brief"
	self.firestarter_1.world_name = "narratives/h_firestarter/stage_1"
	self.firestarter_1.intro_event = "Play_pln_firestarter_stage1_intro_a"
	self.firestarter_1.outro_event = {
		"Play_pln_firestarter_stage1_end_a",
		"Play_pln_firestarter_stage1_end_b"
	}
	self.firestarter_1.music = "heist"
	self.firestarter_1.package = "packages/narr_firestarter1"
	self.firestarter_1.cube = "cube_apply_heist_bank"
	self.firestarter_1.ghost_bonus = 0.1
	self.firestarter_1.max_bags = 16
	self.firestarter_1.ai_group_type = america
	self.firestarter_1.load_screen = "guis/dlcs/pic/textures/loading/job_firestarter_01"
	self.firestarter_2 = {}
	self.firestarter_2.name_id = "heist_firestarter_2_hl"
	self.firestarter_2.briefing_id = "heist_firestarter_2_briefing"
	self.firestarter_2.briefing_dialog = "Play_pln_firestarter_stage2_brief"
	self.firestarter_2.world_name = "narratives/h_firestarter/stage_2"
	self.firestarter_2.intro_event = "Play_pln_firestarter_stage2_intro_a"
	self.firestarter_2.outro_event = {
		"Play_pln_firestarter_stage2_end_a",
		"Play_pln_firestarter_stage2_end_b"
	}
	self.firestarter_2.music = "heist"
	self.firestarter_2.package = "packages/narr_firestarter2"
	self.firestarter_2.cube = "cube_apply_heist_bank"
	self.firestarter_2.ghost_bonus = 0.15
	self.firestarter_2.max_bags = 34
	self.firestarter_2.ai_group_type = america
	self.firestarter_2.load_screen = "guis/dlcs/pic/textures/loading/job_firestarter_02"
	self.firestarter_3 = {}
	self.firestarter_3.name_id = "heist_firestarter_3_hl"
	self.firestarter_3.briefing_id = "heist_firestarter_3_briefing"
	self.firestarter_3.briefing_dialog = "Play_pln_firestarter_stage3_brief"
	self.firestarter_3.world_name = "narratives/h_firestarter/stage_3"
	self.firestarter_3.intro_event = "Play_pln_firestarter_stage3_intro_a"
	self.firestarter_3.outro_event = {
		"Play_pln_firestarter_stage3_end_a",
		"Play_pln_firestarter_stage3_end_b"
	}
	self.firestarter_3.music = "heist"
	self.firestarter_3.package = "packages/narr_firestarter3"
	self.firestarter_3.cube = "cube_apply_heist_bank"
	self.firestarter_3.mission_data = {
		{
			mission = "default"
		}
	}
	self.firestarter_3.ghost_bonus = 0.05
	self.firestarter_3.max_bags = 54
	self.firestarter_3.ai_group_type = america
	self.firestarter_3.load_screen = "guis/dlcs/pic/textures/loading/job_branchbank"
	self.welcome_to_the_jungle_1 = {}
	self.welcome_to_the_jungle_1.name_id = "heist_welcome_to_the_jungle_1_hl"
	self.welcome_to_the_jungle_1.briefing_id = "heist_welcome_to_the_jungle_1_briefing"
	self.welcome_to_the_jungle_1.briefing_dialog = "Play_pln_bigoil_stage1_brief"
	self.welcome_to_the_jungle_1.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_welcome_to_the_jungle_1")
	self.welcome_to_the_jungle_1.world_name = "narratives/e_welcome_to_the_jungle/stage_1"
	self.welcome_to_the_jungle_1.intro_event = "Play_pln_bigoil_stage1_intro_a"
	self.welcome_to_the_jungle_1.outro_event = {
		"Play_pln_bigoil_stage1_end_a",
		"Play_pln_bigoil_stage1_end_b"
	}
	self.welcome_to_the_jungle_1.music = "heist"
	self.welcome_to_the_jungle_1.package = {
		"packages/narr_jungle1"
	}
	self.welcome_to_the_jungle_1.cube = "cube_apply_heist_bank"
	self.welcome_to_the_jungle_1.ghost_bonus = 0.15
	self.welcome_to_the_jungle_1.max_bags = 14
	self.welcome_to_the_jungle_1.ai_group_type = america
	self.welcome_to_the_jungle_1.sniper_laser_distance = 15000
	self.welcome_to_the_jungle_1.load_screen = "guis/dlcs/pic/textures/loading/job_bigoil_01"
	self.welcome_to_the_jungle_1_night = deep_clone(self.welcome_to_the_jungle_1)
	self.welcome_to_the_jungle_1_night.env_params = {
		environment = "environments/pd2_env_night/pd2_env_night"
	}
	self.welcome_to_the_jungle_1_night.package = {
		"packages/narr_jungle1_night"
	}
	self.welcome_to_the_jungle_2 = {}
	self.welcome_to_the_jungle_2.name_id = "heist_welcome_to_the_jungle_2_hl"
	self.welcome_to_the_jungle_2.briefing_id = "heist_welcome_to_the_jungle_2_briefing"
	self.welcome_to_the_jungle_2.briefing_dialog = "Play_pln_bigoil_stage2_brief"
	self.welcome_to_the_jungle_2.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_welcome_to_the_jungle_2")
	self.welcome_to_the_jungle_2.world_name = "narratives/e_welcome_to_the_jungle/stage_2"
	self.welcome_to_the_jungle_2.intro_event = "Play_pln_bigoil_stage2_intro_a"
	self.welcome_to_the_jungle_2.outro_event = {
		"Play_pln_bigoil_stage2_end_a",
		"Play_pln_bigoil_stage2_end_b"
	}
	self.welcome_to_the_jungle_2.music = "heist"
	self.welcome_to_the_jungle_2.package = {
		"packages/narr_jungle2"
	}
	self.welcome_to_the_jungle_2.cube = "cube_apply_heist_bank"
	self.welcome_to_the_jungle_2.max_bags = 15
	self.welcome_to_the_jungle_2.ai_group_type = america
	self.welcome_to_the_jungle_2.load_screen = "guis/dlcs/pic/textures/loading/job_bigoil_02"
	self.ukrainian_job = {}
	self.ukrainian_job.name_id = "heist_ukrainian_job_hl"
	self.ukrainian_job.briefing_id = "heist_ukrainian_job_briefing"
	self.ukrainian_job.briefing_dialog = "Play_pln_ukranian_stage1_brief"
	self.ukrainian_job.briefing_assets_gui = Idstring("guis/mission_briefing/preload_stage_quick_diamond")
	self.ukrainian_job.world_name = "narratives/vlad/ukrainian_job"
	self.ukrainian_job.intro_event = "Play_pln_ukranian_stage1_intro_a"
	self.ukrainian_job.outro_event = {
		"Play_pln_ukranian_stage1_end_a",
		"Play_pln_ukranian_stage1_end_b",
		"Play_pln_ukranian_stage1_end_c"
	}
	self.ukrainian_job.music = "heist"
	self.ukrainian_job.package = {
		"packages/ukrainian_job"
	}
	self.ukrainian_job.cube = "cube_apply_heist_bank"
	self.ukrainian_job.group_ai_preset = "small_urban"
	self.ukrainian_job.ghost_bonus = 0.05
	self.ukrainian_job.max_bags = 16
	self.ukrainian_job.ai_group_type = america
	self.four_stores = {}
	self.four_stores.name_id = "heist_four_stores_hl"
	self.four_stores.briefing_id = "heist_four_stores_briefing"
	self.four_stores.briefing_dialog = "Play_pln_fourstores_stage1_brief"
	self.four_stores.world_name = "narratives/vlad/four_stores"
	self.four_stores.intro_event = "Play_pln_fourstores_stage1_intro_a"
	self.four_stores.outro_event = {
		"Play_pln_fourstores_stage1_end_a",
		"Play_pln_fourstores_stage1_end_b"
	}
	self.four_stores.music = "heist"
	self.four_stores.package = "packages/vlad_four_stores"
	self.four_stores.cube = "cube_apply_heist_bank"
	self.four_stores.ghost_bonus = 0.05
	self.four_stores.max_bags = 5
	self.four_stores.ai_group_type = america
	self.jewelry_store = {}
	self.jewelry_store.name_id = "heist_jewelry_store_hl"
	self.jewelry_store.briefing_id = "heist_jewelry_store_briefing"
	self.jewelry_store.briefing_dialog = "pln_jewelrystore_stage1_brf_speak"
	self.jewelry_store.world_name = "narratives/vlad/jewelry_store"
	self.jewelry_store.intro_event = {
		"pln_jewelrystore_stage1_intro_01",
		"pln_jewelrystore_stage1_intro_02",
		"pln_jewelrystore_stage1_intro_03",
		"pln_jewelrystore_stage1_intro_04",
		"pln_jewelrystore_stage1_intro_05",
		"pln_jewelrystore_stage1_intro_06"
	}
	self.jewelry_store.outro_event = "pln_jewelerystore_stage1_end"
	self.jewelry_store.music = "heist"
	self.jewelry_store.package = "packages/ukrainian_job"
	self.jewelry_store.cube = "cube_apply_heist_bank"
	self.jewelry_store.ghost_bonus = 0.05
	self.jewelry_store.max_bags = 16
	self.jewelry_store.ai_group_type = america
	self.mallcrasher = {}
	self.mallcrasher.name_id = "heist_mallcrasher_hl"
	self.mallcrasher.briefing_id = "heist_mallcrasher_briefing"
	self.mallcrasher.briefing_dialog = "Play_pln_mallcrasch_stage1_brief"
	self.mallcrasher.world_name = "narratives/vlad/mallcrasher"
	self.mallcrasher.intro_event = "Play_pln_mallcrasch_stage1_intro_a"
	self.mallcrasher.outro_event = {
		"Play_pln_mallcrasch_stage1_end_a",
		"Play_pln_mallcrasch_stage1_end_b"
	}
	self.mallcrasher.music = "heist"
	self.mallcrasher.package = "packages/vlad_mallcrasher"
	self.mallcrasher.cube = "cube_apply_heist_bank"
	self.mallcrasher.max_bags = 12
	self.mallcrasher.ai_group_type = america
	self.nightclub = {}
	self.nightclub.name_id = "heist_nightclub_hl"
	self.nightclub.briefing_id = "heist_nightclub_briefing"
	self.nightclub.briefing_dialog = "Play_pln_nightclub_stage1_brief"
	self.nightclub.world_name = "narratives/vlad/nightclub"
	self.nightclub.intro_event = "Play_pln_nightclub_stage1_intro_a"
	self.nightclub.outro_event = {
		"Play_pln_nightclub_stage1_end_a",
		"Play_pln_nightclub_stage1_end_b"
	}
	self.nightclub.music = "heist"
	self.nightclub.package = "packages/vlad_nightclub"
	self.nightclub.cube = "cube_apply_heist_bank"
	self.nightclub.ghost_bonus = 0.1
	self.nightclub.max_bags = 28
	self.nightclub.ai_group_type = america
	self.branchbank = {}
	self.branchbank.name_id = "heist_branchbank_hl"
	self.branchbank.briefing_id = "heist_branchbank_briefing"
	self.branchbank.briefing_dialog = "Play_pln_branchbank_random_stage1_brief"
	self.branchbank.world_name = "narratives/h_firestarter/stage_3"
	self.branchbank.intro_event = {
		"Play_pln_branchbank_random_a_intro_a",
		"Play_pln_branchbank_gold_a_intro_a",
		"Play_pln_branchbank_depositbox_a_intro_a",
		"Play_pln_branchbank_cash_stage1_intro_a"
	}
	self.branchbank.outro_event = "Play_pln_branchbank_stage1_end"
	self.branchbank.ghost_bonus = 0.1
	self.branchbank.max_bags = 24
	self.branchbank.ai_group_type = america
	self.branchbank.music = "heist"
	self.branchbank.package = "packages/narr_firestarter3"
	self.branchbank.cube = "cube_apply_heist_bank"
	self.branchbank.mission_data = {
		{
			mission = "standalone"
		}
	}
	self.escape_cafe_day = {}
	self.escape_cafe_day.name_id = "heist_escape_cafe_hl"
	self.escape_cafe_day.briefing_id = "heist_escape_cafe_briefing"
	self.escape_cafe_day.briefing_dialog = "nothing"
	self.escape_cafe_day.world_name = "narratives/escapes/escape_cafe_day"
	self.escape_cafe_day.intro_event = "Play_dr1_a01"
	self.escape_cafe_day.outro_event = "nothing"
	self.escape_cafe_day.music = "heist"
	self.escape_cafe_day.package = "packages/escape_cafe"
	self.escape_cafe_day.cube = "cube_apply_heist_bank"
	self.escape_cafe_day.ai_group_type = america
	self.escape_cafe_day.repossess_bags = true
	self.escape_cafe_day.load_screen = "guis/dlcs/pic/textures/loading/escape_cafe"
	self.escape_park_day = {}
	self.escape_park_day.name_id = "heist_escape_park_hl"
	self.escape_park_day.briefing_id = "heist_escape_park_briefing"
	self.escape_park_day.briefing_dialog = "nothing"
	self.escape_park_day.world_name = "narratives/escapes/escape_park_day"
	self.escape_park_day.intro_event = "Play_dr1_a01"
	self.escape_park_day.outro_event = "nothing"
	self.escape_park_day.music = "heist"
	self.escape_park_day.package = "packages/escape_park"
	self.escape_park_day.cube = "cube_apply_heist_bank"
	self.escape_park_day.repossess_bags = true
	self.escape_park_day.load_screen = "guis/dlcs/pic/textures/loading/escape_park"
	self.escape_cafe = {}
	self.escape_cafe.name_id = "heist_escape_cafe_hl"
	self.escape_cafe.briefing_id = "heist_escape_cafe_briefing"
	self.escape_cafe.briefing_dialog = "nothing"
	self.escape_cafe.world_name = "narratives/escapes/escape_cafe"
	self.escape_cafe.intro_event = "Play_dr1_a01"
	self.escape_cafe.outro_event = "nothing"
	self.escape_cafe.music = "heist"
	self.escape_cafe.package = "packages/escape_cafe"
	self.escape_cafe.cube = "cube_apply_heist_bank"
	self.escape_cafe.ai_group_type = america
	self.escape_cafe.repossess_bags = true
	self.escape_cafe.load_screen = "guis/dlcs/pic/textures/loading/escape_cafe"
	self.escape_park = {}
	self.escape_park.name_id = "heist_escape_park_hl"
	self.escape_park.briefing_id = "heist_escape_park_briefing"
	self.escape_park.briefing_dialog = "nothing"
	self.escape_park.world_name = "narratives/escapes/escape_park"
	self.escape_park.intro_event = "Play_dr1_a01"
	self.escape_park.outro_event = "nothing"
	self.escape_park.music = "heist"
	self.escape_park.package = "packages/escape_park"
	self.escape_park.cube = "cube_apply_heist_bank"
	self.escape_park.ai_group_type = america
	self.escape_park.repossess_bags = true
	self.escape_park.load_screen = "guis/dlcs/pic/textures/loading/escape_park"
	self.escape_street = {}
	self.escape_street.name_id = "heist_escape_street_hl"
	self.escape_street.briefing_id = "heist_escape_street_briefing"
	self.escape_street.briefing_dialog = "nothing"
	self.escape_street.world_name = "narratives/escapes/escape_street"
	self.escape_street.intro_event = "Play_dr1_a01"
	self.escape_street.outro_event = "nothing"
	self.escape_street.music = "heist"
	self.escape_street.package = "packages/escape_street"
	self.escape_street.cube = "cube_apply_heist_bank"
	self.escape_street.ai_group_type = america
	self.escape_street.repossess_bags = true
	self.escape_street.load_screen = "guis/dlcs/pic/textures/loading/escape_street"
	self.escape_overpass = {}
	self.escape_overpass.name_id = "heist_escape_overpass_hl"
	self.escape_overpass.briefing_id = "heist_escape_overpass_briefing"
	self.escape_overpass.briefing_dialog = "nothing"
	self.escape_overpass.world_name = "narratives/escapes/escape_overpass"
	self.escape_overpass.intro_event = "Play_dr1_a01"
	self.escape_overpass.outro_event = "nothing"
	self.escape_overpass.music = "heist"
	self.escape_overpass.package = "packages/escape_overpass"
	self.escape_overpass.cube = "cube_apply_heist_bank"
	self.escape_overpass.ai_group_type = america
	self.escape_overpass.repossess_bags = true
	self.escape_overpass.load_screen = "guis/dlcs/pic/textures/loading/escape_overpass"
	self.escape_overpass_night = deep_clone(self.escape_overpass)
	self.escape_garage = {}
	self.escape_garage.name_id = "heist_escape_garage_hl"
	self.escape_garage.briefing_id = "heist_escape_garage_briefing"
	self.escape_garage.briefing_dialog = "nothing"
	self.escape_garage.world_name = "narratives/escapes/escape_garage"
	self.escape_garage.intro_event = "Play_dr1_a01"
	self.escape_garage.outro_event = "nothing"
	self.escape_garage.music = "heist"
	self.escape_garage.package = "packages/escape_garage"
	self.escape_garage.cube = "cube_apply_heist_bank"
	self.escape_garage.ai_group_type = america
	self.escape_garage.repossess_bags = true
	self.escape_garage.load_screen = "guis/dlcs/pic/textures/loading/escape_garage"
	self.driving_escapes_industry_day = {}
	self.driving_escapes_industry_day.name_id = "heist_driving_escapes_industry_hl"
	self.driving_escapes_industry_day.briefing_id = "heist_driving_escapes_industry_briefing"
	self.driving_escapes_industry_day.ignore_statistics = true
	self.driving_escapes_industry_day.briefing_dialog = "nothing"
	self.driving_escapes_industry_day.world_name = "wip/driving_escapes_industry"
	self.driving_escapes_industry_day.intro_event = "Play_dr1_a01"
	self.driving_escapes_industry_day.outro_event = "nothing"
	self.driving_escapes_industry_day.music = "heist"
	self.driving_escapes_industry_day.package = "packages/escape_2_industry"
	self.driving_escapes_industry_day.cube = "cube_apply_heist_bank"
	self.driving_escapes_industry_day.ai_group_type = america
	self.driving_escapes_city_day = {}
	self.driving_escapes_city_day.name_id = "heist_driving_escapes_city_hl"
	self.driving_escapes_city_day.briefing_id = "heist_driving_escapes_city_briefing"
	self.driving_escapes_city_day.ignore_statistics = true
	self.driving_escapes_city_day.briefing_dialog = "nothing"
	self.driving_escapes_city_day.world_name = "wip/driving_escapes_city"
	self.driving_escapes_city_day.intro_event = "Play_dr1_a01"
	self.driving_escapes_city_day.outro_event = "nothing"
	self.driving_escapes_city_day.music = "heist"
	self.driving_escapes_city_day.package = "packages/escape_2_city"
	self.driving_escapes_city_day.cube = "cube_apply_heist_bank"
	self.driving_escapes_city_day.ai_group_type = america
	self.safehouse = {}
	self.safehouse.name_id = "heist_safehouse_hl"
	self.safehouse.briefing_id = "heist_safehouse_briefing"
	self.safehouse.briefing_dialog = "Play_pln_sh_intro"
	self.safehouse.world_name = "narratives/safehouse"
	self.safehouse.intro_event = "nothing"
	self.safehouse.outro_event = "nothing"
	self.safehouse.music = "heist"
	self.safehouse.package = "packages/safehouse"
	self.safehouse.cube = "cube_apply_heist_bank"
	self.safehouse.team_ai_off = true
	self.safehouse.ai_group_type = america
	self.crojob2 = {}
	self.crojob2.name_id = "heist_crojob2_hl"
	self.crojob2.briefing_id = "heist_crojob2_briefing"
	self.crojob2.briefing_dialog = "Play_pln_cr2_brf_01"
	self.crojob2.world_name = "narratives/butcher/thebomb/stage_2"
	self.crojob2.intro_event = "Play_pln_cr2_intro_01"
	self.crojob2.outro_event = {
		"butcher_cr1_debrief_01",
		"butcher_cr1_debrief_02"
	}
	self.crojob2.music = "heist"
	self.crojob2.package = {
		"packages/dlcs/the_bomb/crojob_stage_2"
	}
	self.crojob2.cube = "cube_apply_heist_bank"
	self.crojob2.ghost_bonus = 0.15
	self.crojob2.max_bags = 21
	self.crojob2.ai_group_type = america
	self.crojob2.sniper_laser_distance = 20000
	self.crojob3 = {}
	self.crojob3.name_id = "heist_crojob3_hl"
	self.crojob3.briefing_id = "heist_crojob3_briefing"
	self.crojob3.briefing_dialog = "Play_pln_cr3_brf_01"
	self.crojob3.world_name = "narratives/butcher/thebomb/stage_3"
	self.crojob3.intro_event = "Play_pln_cr3_intro_01"
	self.crojob3.outro_event = "lol"
	self.crojob3.music = "heist"
	self.crojob3.package = {
		"packages/dlcs/the_bomb/crojob_stage_3"
	}
	self.crojob3.cube = "cube_apply_heist_bank"
	self.crojob3.max_bags = 16
	self.crojob3.ai_group_type = america
	self.crojob3.sniper_laser_distance = 30000
	self.crojob3_night = deep_clone(self.crojob3)
	self.crojob3_night.env_params = {
		environment = "environments/pd2_env_cro_night/pd2_env_cro_night"
	}
	self.crojob3_night.package = {
		"packages/dlcs/the_bomb/crojob_stage_3_night"
	}
	self.arm_cro = {}
	self.arm_cro.name_id = "heist_arm_cro_hl"
	self.arm_cro.briefing_id = "heist_arm_cro_briefing"
	self.arm_cro.briefing_dialog = "Play_pln_at1_brf_01"
	self.arm_cro.world_name = "narratives/armadillo/arm_cro"
	self.arm_cro.intro_event = "Play_pln_at1_intro_02"
	self.arm_cro.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_cro.music = "heist"
	self.arm_cro.package = "packages/narr_arm_cro"
	self.arm_cro.cube = "cube_apply_heist_bank"
	self.arm_cro.max_bags = 22
	self.arm_cro.ai_group_type = america
	self.arm_und = {}
	self.arm_und.name_id = "heist_arm_und_hl"
	self.arm_und.briefing_id = "heist_arm_und_briefing"
	self.arm_und.briefing_dialog = "Play_pln_at1_brf_05"
	self.arm_und.world_name = "narratives/armadillo/arm_und"
	self.arm_und.intro_event = "Play_pln_at1_intro_06"
	self.arm_und.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_und.music = "heist"
	self.arm_und.package = "packages/narr_arm_und"
	self.arm_und.cube = "cube_apply_heist_bank"
	self.arm_und.max_bags = 22
	self.arm_und.ai_group_type = america
	self.arm_hcm = {}
	self.arm_hcm.name_id = "heist_arm_hcm_hl"
	self.arm_hcm.briefing_id = "heist_arm_hcm_briefing"
	self.arm_hcm.briefing_dialog = "Play_pln_at1_brf_02"
	self.arm_hcm.world_name = "narratives/armadillo/arm_hcm"
	self.arm_hcm.intro_event = "Play_pln_at1_intro_03"
	self.arm_hcm.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_hcm.music = "heist"
	self.arm_hcm.package = "packages/narr_arm_hcm"
	self.arm_hcm.cube = "cube_apply_heist_bank"
	self.arm_hcm.max_bags = 22
	self.arm_hcm.ai_group_type = america
	self.arm_par = {}
	self.arm_par.name_id = "heist_arm_par_hl"
	self.arm_par.briefing_id = "heist_arm_par_briefing"
	self.arm_par.briefing_dialog = "Play_pln_at1_brf_04"
	self.arm_par.world_name = "narratives/armadillo/arm_par"
	self.arm_par.intro_event = "Play_pln_at1_intro_05"
	self.arm_par.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_par.music = "heist"
	self.arm_par.package = "packages/narr_arm_par"
	self.arm_par.cube = "cube_apply_heist_bank"
	self.arm_par.max_bags = 22
	self.arm_par.ai_group_type = america
	self.arm_fac = {}
	self.arm_fac.name_id = "heist_arm_fac_hl"
	self.arm_fac.briefing_id = "heist_arm_fac_briefing"
	self.arm_fac.briefing_dialog = "Play_pln_at1_brf_03"
	self.arm_fac.world_name = "narratives/armadillo/arm_fac"
	self.arm_fac.intro_event = "Play_pln_at1_intro_04"
	self.arm_fac.outro_event = {
		"Play_pln_at1_end_01",
		"Play_pln_at1_end_02",
		"Play_pln_at1_end_03",
		"Play_pln_at1_end_01b",
		"Play_pln_at1_end_02b",
		"Play_pln_at1_end_03b"
	}
	self.arm_fac.music = "heist"
	self.arm_fac.package = "packages/narr_arm_fac"
	self.arm_fac.cube = "cube_apply_heist_bank"
	self.arm_fac.max_bags = 22
	self.arm_fac.ai_group_type = america
	self.arm_for = {}
	self.arm_for.name_id = "heist_arm_for_hl"
	self.arm_for.briefing_id = "heist_arm_for_briefing"
	self.arm_for.briefing_dialog = "Play_pln_tr1_brf_01"
	self.arm_for.world_name = "narratives/armadillo/arm_for"
	self.arm_for.intro_event = "Play_pln_tr1_intro_01"
	self.arm_for.outro_event = {
		"Play_pln_tr1_end_01",
		"Play_pln_tr1_end_02"
	}
	self.arm_for.music = "heist"
	self.arm_for.package = "packages/narr_arm_for"
	self.arm_for.cube = "cube_apply_heist_bank"
	self.arm_for.bonus_escape = true
	self.arm_for.max_bags = 30
	self.arm_for.ghost_bonus = 0.1
	self.arm_for.ai_group_type = america
	self.arm_for.sniper_laser_distance = 20000
	self.family = {}
	self.family.name_id = "heist_family_hl"
	self.family.briefing_id = "heist_family_briefing"
	self.family.briefing_dialog = "pln_fj1_brf_01"
	self.family.world_name = "narratives/bain/diamond_store"
	self.family.intro_event = "Play_pln_fj1_intro_01"
	self.family.outro_event = {
		"Play_pln_fj1_end_01",
		"Play_pln_fj1_end_02"
	}
	self.family.music = "heist"
	self.family.package = "packages/narr_family"
	self.family.cube = "cube_apply_heist_bank"
	self.family.ghost_bonus = 0.05
	self.family.max_bags = 24
	self.family.sniper_laser_distance = 13000
	self.family.ai_group_type = america
	self.family.load_screen = "guis/dlcs/pic/textures/loading/job_diamondstore"
	self.big = {}
	self.big.name_id = "heist_big_hl"
	self.big.briefing_id = "heist_big_briefing"
	self.big.briefing_dialog = "Play_pln_bb1_brf_01"
	self.big.world_name = "narratives/bain/big"
	self.big.intro_event = "Play_pln_bb1_intro_01"
	self.big.outro_event = {
		"Play_pln_bb1_end_01",
		"Play_pln_bb1_end_02",
		"Play_pln_bb1_end_03",
		"Play_pln_bb1_end_04"
	}
	self.big.music = "big_bank"
	self.big.package = "packages/narr_big"
	self.big.cube = "cube_apply_heist_bank"
	self.big.ghost_bonus = 0.15
	self.big.max_bags = 28
	self.big.sniper_laser_distance = 20000
	self.big.ai_group_type = america
	self.roberts = {}
	self.roberts.name_id = "heist_roberts_hl"
	self.roberts.briefing_id = "heist_roberts_briefing"
	self.roberts.briefing_dialog = "Play_pln_cs1_brf"
	self.roberts.world_name = "narratives/bain/roberts"
	self.roberts.intro_event = "Play_pln_cs1_intro_01"
	self.roberts.outro_event = {
		"Play_pln_cs1_end_01",
		"Play_pln_cs1_end_02",
		"Play_pln_cs1_end_03"
	}
	self.roberts.music = "heist"
	self.roberts.package = "packages/narr_roberts"
	self.roberts.cube = "cube_apply_heist_bank"
	self.roberts.ghost_bonus = 0.1
	self.roberts.max_bags = 14
	self.roberts.sniper_laser_distance = 20000
	self.roberts.ai_group_type = america
	self.mia_1 = {}
	self.mia_1.name_id = "heist_mia_1_hl"
	self.mia_1.briefing_id = "heist_mia_1_briefing"
	self.mia_1.briefing_dialog = "Play_pln_hm1_brf_01"
	self.mia_1.world_name = "narratives/dentist/mia/stage1"
	self.mia_1.intro_event = "Play_pln_hm1_intro_01"
	self.mia_1.outro_event = "Play_pln_hm1_end_01"
	self.mia_1.music = "heist"
	self.mia_1.package = "packages/narr_mia_1"
	self.mia_1.cube = "cube_apply_heist_bank"
	self.mia_1.max_bags = 20
	self.mia_1.ai_group_type = america
	self.mia_2 = {}
	self.mia_2.name_id = "heist_mia_2_hl"
	self.mia_2.briefing_id = "heist_mia_2_briefing"
	self.mia_2.briefing_dialog = "Play_pln_hm2_brf_01"
	self.mia_2.world_name = "narratives/dentist/mia/stage2"
	self.mia_2.intro_event = "Play_pln_hm2_intro_01"
	self.mia_2.outro_event = {
		"dentist_hm1_debrief"
	}
	self.mia_2.music = "heist"
	self.mia_2.package = "packages/narr_mia_2"
	self.mia_2.cube = "cube_apply_heist_bank"
	self.mia_2.max_bags = 35
	self.mia_2.ai_group_type = america
	self.mia_2.load_screen = "guis/dlcs/pic/textures/loading/job_hlm_02"
	self.mia_2.teams = {
		criminal1 = {
			foes = {
				law1 = true,
				mobster1 = true,
				mobster_boss = true
			},
			friends = {
				converted_enemy = true
			}
		},
		law1 = {
			foes = {
				converted_enemy = true,
				criminal1 = true,
				hacked_turret = true,
				mobster1 = true
			},
			friends = {}
		},
		mobster1 = {
			foes = {
				converted_enemy = true,
				criminal1 = true,
				hacked_turret = true,
				law1 = true
			},
			friends = {
				mobster_boss = true
			}
		},
		mobster_boss = {
			foes = {
				converted_enemy = true,
				criminal1 = true,
				hacked_turret = true
			},
			friends = {
				mobster1 = true
			}
		},
		converted_enemy = {
			foes = {
				law1 = true,
				mobster1 = true,
				mobster_boss = true
			},
			friends = {
				criminal1 = true
			}
		},
		neutral1 = {
			foes = {},
			friends = {}
		},
		hacked_turret = {
			foes = {
				law1 = true,
				mobster1 = true,
				mobster_boss = true
			},
			friends = {}
		}
	}
	self.mia2_new = {}
	self.mia2_new.name_id = "heist_mia2_new_hl"
	self.mia2_new.briefing_id = "heist_mia_2_briefing"
	self.mia2_new.briefing_dialog = "Play_pln_hm2_brf_01"
	self.mia2_new.world_name = "narratives/dentist/mia/stage2"
	self.mia2_new.intro_event = "Play_pln_hm2_intro_01"
	self.mia2_new.outro_event = {
		"Play_gus_hm1_debrief_01",
		"Play_gus_hm1_debrief_01"
	}
	self.mia2_new.music = "heist"
	self.mia2_new.package = "packages/narr_mia_2"
	self.mia2_new.cube = "cube_apply_heist_bank"
	self.mia2_new.teams = self.mia_2.teams
	self.mia2_new.ai_group_type = america
	self.kosugi = {}
	self.kosugi.name_id = "heist_kosugi_hl"
	self.kosugi.briefing_id = "heist_kosugi_briefing"
	self.kosugi.briefing_dialog = "Play_pln_ko1_brf_01"
	self.kosugi.world_name = "narratives/bain/shadow_raid"
	self.kosugi.intro_event = "Play_pln_ko1_intro_01"
	self.kosugi.outro_event = {
		"Play_pln_ko1_end_01"
	}
	self.kosugi.music = "ghost"
	self.kosugi.music_ext_start = "suspense_1"
	self.kosugi.package = "packages/kosugi"
	self.kosugi.cube = "cube_apply_heist_bank"
	self.kosugi.ghost_bonus = 0.05
	self.kosugi.ghost_required = true
	self.kosugi.max_bags = 30
	self.kosugi.ai_group_type = america
	self.gallery = deep_clone(self.framing_frame_1)
	self.gallery.name_id = "heist_gallery_hl"
	self.gallery.briefing_id = "heist_gallery_briefing"
	self.gallery.intro_event = "Play_pln_art_intro"
	self.gallery.outro_event = {
		"Play_pln_art_end"
	}
	self.gallery.briefing_dialog = "Play_pln_art_brf"
	self.gallery.load_screen = "guis/dlcs/pic/textures/loading/job_gallery"
	self.hox_1 = {}
	self.hox_1.name_id = "heist_hox_1_hl"
	self.hox_1.briefing_id = "heist_hox_1_briefing"
	self.hox_1.briefing_dialog = "Play_pln_hb1_brf_01"
	self.hox_1.world_name = "narratives/dentist/hox/stage_1"
	self.hox_1.intro_event = "Play_pln_hb1_intro_01"
	self.hox_1.outro_event = {
		"Play_pln_hb1_end_01"
	}
	self.hox_1.music = "heist"
	self.hox_1.package = "packages/narr_hox_1"
	self.hox_1.cube = "cube_apply_heist_bank"
	self.hox_1.block_AIs = {
		old_hoxton = true
	}
	self.hox_1.ai_group_type = america
	self.hox_2 = {}
	self.hox_2.name_id = "heist_hox_2_hl"
	self.hox_2.briefing_id = "heist_hox_2_briefing"
	self.hox_2.briefing_dialog = "Play_rb5_hb2_brf_01"
	self.hox_2.world_name = "narratives/dentist/hox/stage_2"
	self.hox_2.intro_event = "Play_rb5_hb2_intro_01"
	self.hox_2.outro_event = {
		"Play_rb5_hb2_end_01"
	}
	self.hox_2.music = "heist"
	self.hox_2.package = "packages/narr_hox_2"
	self.hox_2.cube = "cube_apply_heist_bank"
	self.hox_2.block_AIs = {
		old_hoxton = true
	}
	self.hox_2.ai_group_type = america
	self.hox_2.load_screen = "guis/dlcs/pic/textures/loading/job_breakout_02"
	self.pines = {}
	self.pines.name_id = "heist_pines_hl"
	self.pines.briefing_id = "heist_pines_briefing"
	self.pines.briefing_dialog = "Play_pln_cp1_brf_01"
	self.pines.world_name = "narratives/vlad/pines"
	self.pines.intro_event = "Play_pln_cp1_intro_01"
	self.pines.outro_event = "Play_vld_cp1_end"
	self.pines.music = "heist"
	self.pines.package = "packages/narr_pines"
	self.pines.cube = "cube_apply_heist_bank"
	self.pines.max_bags = 1200
	self.pines.ai_group_type = america
	self.pines.is_christmas_heist = true
	self.mus = {}
	self.mus.name_id = "heist_mus_hl"
	self.mus.briefing_id = "heist_mus_briefing"
	self.mus.briefing_dialog = "Play_pln_hd1_brf_01"
	self.mus.world_name = "narratives/dentist/mus"
	self.mus.intro_event = "Play_pln_hd1_intro_01"
	self.mus.outro_event = {
		"dentist_hd1_debrief_01",
		"dentist_hd1_debrief_02"
	}
	self.mus.music = "heist"
	self.mus.package = "packages/narr_mus"
	self.mus.cube = "cube_apply_heist_bank"
	self.mus.max_bags = 30
	self.mus.ghost_bonus = 0.15
	self.mus.ai_group_type = america
	self.cage = {}
	self.cage.name_id = "heist_cage_hl"
	self.cage.briefing_id = "heist_cage_briefing"
	self.cage.briefing_dialog = "Play_pln_ch1_brf_01"
	self.cage.world_name = "narratives/bain/cage"
	self.cage.intro_event = "Play_pln_ch1_intro_01"
	self.cage.outro_event = "Play_pln_ch1_end_01"
	self.cage.music = "heist"
	self.cage.package = "packages/narr_cage"
	self.cage.cube = "cube_apply_heist_bank"
	self.cage.max_bags = 6
	self.cage.ghost_bonus = 0.1
	self.cage.ghost_required_visual = true
	self.cage.ai_group_type = america
	self.hox_3 = {}
	self.hox_3.name_id = "heist_hox_3_hl"
	self.hox_3.briefing_id = "heist_hox_3_briefing"
	self.hox_3.briefing_dialog = "Play_pln_hb3_brf_01"
	self.hox_3.world_name = "narratives/bain/revenge"
	self.hox_3.intro_event = "Play_pln_hb3_01"
	self.hox_3.outro_event = "lol"
	self.hox_3.music = "heist"
	self.hox_3.package = "packages/narr_hox_3"
	self.hox_3.cube = "cube_apply_heist_bank"
	self.hox_3.max_bags = 10
	self.hox_3.ghost_bonus = 0.1
	self.hox_3.ai_group_type = america
	self.rat = {}
	self.rat.name_id = "heist_rat_hl"
	self.rat.briefing_id = "heist_rat_briefing"
	self.rat.briefing_dialog = "Play_pln_rt1b_brf_01"
	self.rat.world_name = "narratives/bain/rat"
	self.rat.intro_event = "Play_pln_rt1b_intro_01"
	self.rat.outro_event = {
		"Play_pln_rt1b_end_01",
		"Play_pln_rt1b_end_02",
		"Play_pln_rt1b_end_03",
		"Play_pln_rt1b_end_04"
	}
	self.rat.music = "heist"
	self.rat.package = "packages/narr_alex1"
	self.rat.cube = "cube_apply_heist_bank"
	self.rat.max_bags = 1200
	self.rat.ai_group_type = america
	self.shoutout_raid = {}
	self.shoutout_raid.name_id = "heist_shoutout_raid_hl"
	self.shoutout_raid.briefing_id = "heist_shoutout_raid_briefing"
	self.shoutout_raid.briefing_dialog = "Play_pln_ko1b_brf_01"
	self.shoutout_raid.world_name = "narratives/vlad/shout"
	self.shoutout_raid.intro_event = "Play_pln_ko1b_intro_01"
	self.shoutout_raid.outro_event = "Play_vld_ko1b_end_01"
	self.shoutout_raid.music = "heist"
	self.shoutout_raid.package = "packages/vlad_shout"
	self.shoutout_raid.cube = "cube_apply_heist_bank"
	self.shoutout_raid.max_bags = 20
	self.shoutout_raid.ai_group_type = america
	self.shoutout_raid.sniper_laser_distance = 20000
	self.arena = {}
	self.arena.name_id = "heist_arena_hl"
	self.arena.briefing_id = "heist_arena_briefing"
	self.arena.briefing_dialog = "Play_pln_al1_brf_01"
	self.arena.world_name = "narratives/bain/arena"
	self.arena.intro_event = "Play_pln_al1_intro_01"
	self.arena.outro_event = {
		"Play_pln_al1_54",
		"Play_pln_al1_55"
	}
	self.arena.music = "no_music"
	self.arena.death_track = "track_01"
	self.arena.death_event = "music_heist_assault"
	self.arena.package = "packages/narr_arena"
	self.arena.cube = "cube_apply_heist_bank"
	self.arena.max_bags = 25
	self.arena.ghost_bonus = 0.1
	self.arena.ai_group_type = america
	self.arena.load_screen = "guis/dlcs/pic/textures/loading/job_alesso"
	self.kenaz = {}
	self.kenaz.name_id = "heist_kenaz_hl"
	self.kenaz.briefing_id = "heist_kenaz_briefing"
	self.kenaz.briefing_dialog = "Play_pln_ca1_brf_01"
	self.kenaz.world_name = "narratives/dentist/cas"
	self.kenaz.intro_event = {
		"Play_pln_ca1_intro_01",
		"Play_pln_ca1_intro_02"
	}
	self.kenaz.outro_event = {
		"dentist_ca1_debrief_01",
		"dentist_ca1_debrief_02"
	}
	self.kenaz.music = "heist"
	self.kenaz.package = {
		"packages/kenaz"
	}
	self.kenaz.cube = "cube_apply_heist_bank"
	self.kenaz.ghost_bonus = 0.1
	self.kenaz.max_bags = 40
	self.kenaz.ai_group_type = america
	self.jolly = {}
	self.jolly.name_id = "heist_jolly_hl"
	self.jolly.briefing_id = "heist_jolly_briefing"
	self.jolly.briefing_dialog = "Play_pln_as1_brf_01"
	self.jolly.world_name = "narratives/vlad/jolly"
	self.jolly.intro_event = "Play_plt_as1_intro_01"
	self.jolly.outro_event = {
		"vld_as1_17",
		"vld_as1_17"
	}
	self.jolly.music = "heist"
	self.jolly.package = "packages/jolly"
	self.jolly.cube = "cube_apply_heist_bank"
	self.jolly.max_bags = 15
	self.jolly.ai_group_type = america
	self.red2 = {}
	self.red2.name_id = "heist_red2_hl"
	self.red2.briefing_id = "heist_red2_briefing"
	self.red2.briefing_dialog = "Play_pln_fwb_brf_01"
	self.red2.world_name = "narratives/classics/red2"
	self.red2.intro_event = "Play_pln_fwb_intro_01"
	self.red2.outro_event = {
		"Play_pln_fwb_34",
		"Play_pln_fwb_65"
	}
	self.red2.music = "heist"
	self.red2.package = {
		"packages/narr_red2"
	}
	self.red2.cube = "cube_apply_heist_bank"
	self.red2.max_bags = 84
	self.red2.ghost_bonus = 0.15
	self.red2.ai_group_type = america
	self.dinner = {}
	self.dinner.name_id = "heist_dinner_hl"
	self.dinner.briefing_id = "heist_dinner_briefing"
	self.dinner.briefing_dialog = "Play_pln_dn1_brf_01"
	self.dinner.world_name = "narratives/classics/dinner"
	self.dinner.intro_event = "Play_pln_dn1_intro_01"
	self.dinner.outro_event = {
		"Play_pln_dn1_31"
	}
	self.dinner.music = "heist"
	self.dinner.package = {
		"packages/narr_dinner"
	}
	self.dinner.cube = "cube_apply_heist_bank"
	self.dinner.max_bags = 20
	self.dinner.ai_group_type = america
	self.dinner.player_style = "slaughterhouse"
	self.pbr = {}
	self.pbr.name_id = "heist_pbr_hl"
	self.pbr.briefing_id = "heist_pbr_briefing"
	self.pbr.briefing_dialog = "Play_pln_jr1_brf_01"
	self.pbr.world_name = "narratives/pbr/berry"
	self.pbr.intro_event = "Play_mer_jr1_intro_01"
	self.pbr.outro_event = "Play_pln_jr1_09"
	self.pbr.music = "heist"
	self.pbr.package = {
		"packages/narr_jerry1"
	}
	self.pbr.cube = "cube_apply_heist_bank"
	self.pbr.max_bags = 20
	self.pbr.ai_group_type = murkywater
	self.pbr2 = {}
	self.pbr2.name_id = "heist_pbr2_hl"
	self.pbr2.briefing_id = "heist_pbr2_briefing"
	self.pbr2.briefing_dialog = "Play_pln_jr2_brf_01"
	self.pbr2.world_name = "narratives/pbr/jerry"
	self.pbr2.intro_event = "Play_pln_jr2_intro_01"
	self.pbr2.outro_event = "Play_loc_jr2_44"
	self.pbr2.music = "heist"
	self.pbr2.package = {
		"packages/narr_jerry2"
	}
	self.pbr2.cube = "cube_apply_heist_bank"
	self.pbr2.max_bags = 20
	self.pbr2.ai_group_type = america
	self.cane = {}
	self.cane.name_id = "heist_cane_hl"
	self.cane.briefing_id = "heist_cane_briefing"
	self.cane.briefing_dialog = "Play_pln_can_brf_01"
	self.cane.world_name = "narratives/vlad/cane"
	self.cane.intro_event = "Play_pln_can_intro_01"
	self.cane.outro_event = "Play_vld_can_11"
	self.cane.package = "packages/cane"
	self.cane.cube = "cube_apply_heist_bank"
	self.cane.max_bags = 3600
	self.cane.ai_group_type = america
	self.cane.is_christmas_heist = true
	self.nail = {}
	self.nail.name_id = "heist_nail_hl"
	self.nail.briefing_id = "heist_nail_briefing"
	self.nail.briefing_dialog = "Play_pln_nai_brf_01"
	self.nail.world_name = "narratives/bain/nail"
	self.nail.intro_event = "Play_pln_nai_intro_01"
	self.nail.outro_event = {
		"Play_pln_nai_17",
		"Play_pln_nai_18",
		"Play_pln_nai_19",
		"Play_pln_nai_20"
	}
	self.nail.music = "heist"
	self.nail.package = {
		"packages/job_nail"
	}
	self.nail.cube = "cube_apply_heist_bank"
	self.nail.max_bags = 1000
	self.nail.ai_group_type = america
	self.nail.no_police_calling = true
	self.peta = {}
	self.peta.name_id = "heist_peta_hl"
	self.peta.briefing_id = "heist_peta_briefing"
	self.peta.briefing_dialog = "Play_pln_pt1_brf"
	self.peta.world_name = "narratives/vlad/peta/stage1"
	self.peta.intro_event = "Play_vld_pt1_intro"
	self.peta.outro_event = "Play_vld_pt1_07"
	self.peta.music = "heist"
	self.peta.package = "packages/narr_peta"
	self.peta.cube = "cube_apply_heist_bank"
	self.peta.ai_group_type = america
	self.peta.sniper_laser_distance = 20000
	self.peta.load_screen = "guis/dlcs/pic/textures/loading/job_goatsim_01"
	self.peta2 = {}
	self.peta2.name_id = "heist_peta2_hl"
	self.peta2.briefing_id = "heist_peta2_briefing"
	self.peta2.briefing_dialog = "Play_pln_pt2_brf"
	self.peta2.world_name = "narratives/vlad/peta/stage2"
	self.peta2.intro_event = "Play_brs_pt2_intro"
	self.peta2.outro_event = "Play_vld_pt2_04"
	self.peta2.music = "heist"
	self.peta2.package = "packages/narr_peta2"
	self.peta2.cube = "cube_apply_heist_bank"
	self.peta2.ai_group_type = america
	self.peta2.sniper_laser_distance = 20000
	self.peta2.repossess_bags = true
	self.peta2.load_screen = "guis/dlcs/pic/textures/loading/job_goatsim_02"
	self.pal = {}
	self.pal.name_id = "heist_pal_hl"
	self.pal.briefing_id = "heist_pal_briefing"
	self.pal.briefing_dialog = "Play_pln_pal_brf"
	self.pal.world_name = "narratives/classics/pal"
	self.pal.intro_event = "Play_pln_pal_intro"
	self.pal.outro_event = "Play_pln_pal_81"
	self.pal.music = "heist"
	self.pal.package = {
		"packages/narr_pal"
	}
	self.pal.cube = "cube_apply_heist_bank"
	self.pal.max_bags = 1200
	self.pal.player_style = "poolrepair"
	self.man = {}
	self.man.name_id = "heist_man_hl"
	self.man.briefing_id = "heist_man_briefing"
	self.man.briefing_dialog = "Play_pln_man_brf"
	self.man.world_name = "narratives/classics/man"
	self.man.intro_event = "Play_pln_man_intro"
	self.man.outro_event = "Play_pln_man_81"
	self.man.music = "heist"
	self.man.package = "packages/narr_man"
	self.man.cube = "cube_apply_heist_bank"
	self.man.max_bags = 10
	self.man.no_police_calling = true
	self.dark = {}
	self.dark.name_id = "heist_dark_hl"
	self.dark.briefing_id = "heist_dark_briefing"
	self.dark.briefing_dialog = "Play_pln_drk_brf"
	self.dark.world_name = "narratives/elephant/dark"
	self.dark.intro_event = "Play_pln_drk_intro_01"
	self.dark.outro_event = {
		"Play_rb14_drk_outro_01",
		"Play_rb14_drk_outro_02"
	}
	self.dark.music = "ghost"
	self.dark.music_ext_start = "suspense_1"
	self.dark.package = "packages/job_dark"
	self.dark.cube = "cube_apply_heist_bank"
	self.dark.max_bags = 20
	self.dark.ghost_bonus = 0.15
	self.dark.ghost_required = true
	self.mad = {}
	self.mad.name_id = "heist_mad_hl"
	self.mad.briefing_id = "heist_mad_briefing"
	self.mad.briefing_dialog = "Play_pln_mad_brf_01"
	self.mad.world_name = "narratives/elephant/mad"
	self.mad.intro_event = "Play_plt_mad_intro_01"
	self.mad.outro_event = "Play_rb14_mad_outro_01"
	self.mad.music = "heist"
	self.mad.package = "packages/lvl_mad"
	self.mad.cube = "cube_apply_heist_bank"
	self.mad.ai_group_type = russia
	self.mad.sniper_laser_distance = 15000
	self.mad.prevent_carry_disposal = table.list_to_set({
		"person"
	})
	self.biker_train = {}
	self.biker_train.name_id = "heist_biker_train_hl"
	self.biker_train.briefing_id = "heist_biker_train_briefing"
	self.biker_train.world_name = "wip/biker_train_test"
	self.biker_train.intro_event = "Play_pln_jr2_intro_01"
	self.biker_train.outro_event = {
		"Play_loc_jr2_44"
	}
	self.biker_train.music = "heist"
	self.biker_train.cube = "cube_apply_heist_bank"
	self.born = {}
	self.born.name_id = "heist_born_hl"
	self.born.briefing_id = "heist_born_briefing"
	self.born.briefing_dialog = "Play_elp_brn_brf_01"
	self.born.world_name = "narratives/elephant/born"
	self.born.intro_event = "Play_bkl_brn_intro"
	self.born.outro_event = "Play_elp_brn_01"
	self.born.intro_cues = {
		"intro_firestarter_301",
		"intro_firestarter_302",
		"intro_firestarter_303",
		"intro_firestarter_304"
	}
	self.born.music = "heist"
	self.born.package = "packages/narr_born_1"
	self.born.cube = "cube_apply_heist_bank"
	self.born.max_bags = 10
	self.chew = {}
	self.chew.name_id = "heist_chew_hl"
	self.chew.briefing_id = "heist_chew_briefing"
	self.chew.briefing_dialog = "Play_elp_chw_brf_01"
	self.chew.world_name = "narratives/elephant/chew"
	self.chew.intro_event = "Play_plt_chw_intro"
	self.chew.outro_event = "Play_elp_chw_01"
	self.chew.music = "heist"
	self.chew.package = "packages/lvl_chew"
	self.chew.cube = "cube_apply_heist_bank"
	self.chew.load_screen = "guis/dlcs/pic/textures/loading/job_chew"
	self.short1_stage1 = {}
	self.short1_stage1.name_id = "heist_short1_stage1_hl"
	self.short1_stage1.briefing_id = "heist_short1_stage1_briefing"
	self.short1_stage1.briefing_dialog = "Play_pln_sh11_brf_01"
	self.short1_stage1.world_name = "narratives/short1/stage1"
	self.short1_stage1.intro_event = "Play_pln_sh11_intro_01"
	self.short1_stage1.outro_event = "Play_pln_sh11_30"
	self.short1_stage1.music = "heist"
	self.short1_stage1.package = "packages/job_short1_stage1"
	self.short1_stage1.cube = "cube_apply_heist_bank"
	self.short1_stage1.force_equipment = {
		armor = "level_1",
		body_bags = 1,
		character = "russian",
		deployable = "none",
		melee = "none",
		primary = "wpn_fps_ass_amcar",
		secondary = "wpn_fps_pis_g17",
		throwable = "none",
		primary_mods = {
			"wpn_fps_upg_ns_ass_smg_small"
		},
		secondary_mods = {
			"wpn_fps_upg_ns_pis_medium"
		}
	}
	self.short1_stage1.disable_mutators = true
	self.short1_stage1.load_screen = "guis/dlcs/pic/textures/loading/job_basics_stealth1"
	self.short1_stage2 = {}
	self.short1_stage2.name_id = "heist_short1_stage2_hl"
	self.short1_stage2.briefing_id = "heist_short1_stage2_briefing"
	self.short1_stage2.briefing_dialog = "Play_pln_sh12_brf_01"
	self.short1_stage2.world_name = "narratives/short1/stage2"
	self.short1_stage2.intro_event = "Play_pln_sh12_intro_01"
	self.short1_stage2.outro_event = "Play_pln_sh12_30"
	self.short1_stage2.music = "heist"
	self.short1_stage2.package = "packages/job_short1_stage2"
	self.short1_stage2.cube = "cube_apply_heist_bank"
	self.short1_stage2.force_equipment = {
		armor = "level_1",
		character = "russian",
		deployable = "ecm_jammer",
		melee = "none",
		primary = "wpn_fps_ass_amcar",
		secondary = "wpn_fps_pis_g17",
		throwable = "none",
		primary_mods = {
			"wpn_fps_upg_ns_ass_smg_small"
		},
		secondary_mods = {
			"wpn_fps_upg_ns_pis_medium"
		}
	}
	self.short1_stage2.disable_mutators = true
	self.short1_stage2.load_screen = "guis/dlcs/pic/textures/loading/job_basics_stealth2"
	self.short2_stage1 = {}
	self.short2_stage1.name_id = "heist_short2_stage1_hl"
	self.short2_stage1.briefing_id = "heist_short2_stage1_briefing"
	self.short2_stage1.briefing_dialog = "Play_pln_sh21_brf_01"
	self.short2_stage1.world_name = "narratives/short2/stage1"
	self.short2_stage1.intro_event = "Play_pln_sh21_intro_01"
	self.short2_stage1.outro_event = "Play_rb4_sh21_06"
	self.short2_stage1.music = "heist"
	self.short2_stage1.package = "packages/job_short2_stage1"
	self.short2_stage1.cube = "cube_apply_heist_bank"
	self.short2_stage1.force_equipment = {
		armor = "level_4",
		character = "russian",
		deployable = "none",
		melee = "none",
		primary = "wpn_fps_ass_amcar",
		secondary = "wpn_fps_pis_g17",
		throwable = "none"
	}
	self.short2_stage1.disable_mutators = true
	self.short2_stage1.load_screen = "guis/dlcs/pic/textures/loading/job_basics_loud1"
	self.short2_stage2b = {}
	self.short2_stage2b.name_id = "heist_short2_stage2b_hl"
	self.short2_stage2b.briefing_id = "heist_short2_stage2b_briefing"
	self.short2_stage2b.briefing_dialog = "Play_pln_sh22_brf_01"
	self.short2_stage2b.world_name = "narratives/short2/stage2"
	self.short2_stage2b.intro_event = "Play_dr1_a01"
	self.short2_stage2b.outro_event = "Play_rb4_sh22_05"
	self.short2_stage2b.music = "heist"
	self.short2_stage2b.package = "packages/job_short2_stage2b"
	self.short2_stage2b.cube = "cube_apply_heist_bank"
	self.short2_stage2b.force_equipment = {
		armor = "level_4",
		character = "russian",
		deployable = "doctor_bag",
		melee = "none",
		primary = "wpn_fps_ass_amcar",
		secondary = "wpn_fps_pis_g17",
		throwable = "none"
	}
	self.short2_stage2b.disable_mutators = true
	self.short2_stage2b.load_screen = "guis/dlcs/pic/textures/loading/job_basics_loud2"
	self.chill = {}
	self.chill.name_id = "heist_chill_hl"
	self.chill.briefing_id = "heist_chill_hl_briefing"
	self.chill.briefing_dialog = "Play_rb5_sfh_brf"
	self.chill.world_name = "narratives/chill"
	self.chill.intro_event = "Play_pln_bb1_intro_01"
	self.chill.outro_event = {
		"Play_pln_bb1_end_01",
		"Play_pln_bb1_end_02"
	}
	self.chill.package = "packages/narr_chill"
	self.chill.cube = "cube_apply_heist_bank"
	self.chill.max_bags = 28
	self.chill.team_ai_off = true
	self.chill.on_enter_clbks = {
		function()
			managers.mission:call_global_event(Message.OnEnterSafeHouse)
		end
	}
	self.chill.hud = {
		no_hostages = true,
		no_timer = true
	}
	self.chill.is_safehouse = true
	self.chill.disable_mutators = true
	self.chill.no_police_calling = true
	self.chill_combat = {}
	self.chill_combat.name_id = "heist_chill_combat_hl"
	self.chill_combat.briefing_id = "heist_chill_combat_hl_briefing"
	self.chill_combat.briefing_dialog = "Play_pln_sfr_brf"
	self.chill_combat.world_name = "narratives/chill"
	self.chill_combat.intro_event = "Play_pln_sfr_intro"
	self.chill_combat.outro_event = "Play_pln_sfr_end"
	self.chill_combat.package = "packages/narr_chill"
	self.chill_combat.cube = "cube_apply_heist_bank"
	self.chill.ghost_bonus = 0.15
	self.chill_combat.max_bags = 28
	self.chill_combat.team_ai_off = false
	self.chill_combat.group_ai_state = "safehouse"
	self.chill_combat.ai_group_type = america
	self.chill_combat.wave_count = 3
	self.chill_combat.disable_mutators = true
	self.friend = {}
	self.friend.name_id = "heist_friend_hl"
	self.friend.briefing_id = "heist_friend_hl_briefing"
	self.friend.briefing_dialog = "Play_pln_fri_brf_01"
	self.friend.world_name = "narratives/butcher/friend"
	self.friend.intro_event = "Play_pln_fri_intro"
	self.friend.outro_event = {
		"Play_btc_fri_end_a",
		"Play_btc_fri_end_b"
	}
	self.friend.package = "packages/lvl_friend"
	self.friend.cube = "cube_apply_heist_bank"
	self.friend.ghost_bonus = 0.15
	self.friend.max_bags = 28
	self.friend.ai_group_type = america
	self.flat = {}
	self.flat.name_id = "heist_flat_hl"
	self.flat.briefing_id = "heist_flat_hl_briefing"
	self.flat.briefing_dialog = "Play_pln_flt_brf_01"
	self.flat.world_name = "narratives/classics/flat"
	self.flat.intro_event = "Play_pln_flt_intro_01"
	self.flat.outro_event = "Play_pln_flt_50"
	self.flat.package = "packages/narr_flat"
	self.flat.cube = "cube_apply_heist_bank"
	self.flat.max_bags = 11
	self.flat.music_overrides = {
		track_47_gen = "track_47_flat"
	}
	self.flat.ai_group_type = america
	self.help = {}
	self.help.name_id = "heist_help_hl"
	self.help.briefing_id = "heist_help_hl_briefing"
	self.help.briefing_dialog = "Play_big_clk_hlp_brf"
	self.help.world_name = "narratives/bain/help"
	self.help.intro_event = "Play_big_clk_hlp_intro"
	self.help.outro_event = "Play_big_clk_hlp_end"
	self.help.failure_event = "Play_big_clk_hlp_fal"
	self.help.package = "packages/lvl_help"
	self.help.cube = "cube_apply_heist_bank"
	self.help.ghost_bonus = nil
	self.help.max_bags = 9999
	self.help.ai_group_type = america
	self.moon = {}
	self.moon.name_id = "heist_moon_hl"
	self.moon.briefing_id = "heist_moon_hl_briefing"
	self.moon.briefing_dialog = "Play_pln_moon_brf"
	self.moon.world_name = "narratives/vlad/moon"
	self.moon.intro_event = "Play_vld_moon_intro"
	self.moon.outro_event = "Play_vld_moon_end"
	self.moon.package = "packages/lvl_moon"
	self.moon.cube = "cube_apply_heist_bank"
	self.moon.ghost_bonus = nil
	self.moon.max_bags = 12
	self.moon.ai_group_type = america
	self.moon.is_christmas_heist = true
	self.spa = {}
	self.spa.name_id = "heist_spa_hl"
	self.spa.briefing_id = "heist_spa_hl_briefing"
	self.spa.briefing_dialog = "Play_rb6_spa_brf_01"
	self.spa.world_name = "narratives/continental/spa"
	self.spa.intro_event = "Play_pln_spa_intro"
	self.spa.outro_event = "Play_cha_spa_end"
	self.spa.package = "packages/job_spa"
	self.spa.cube = "cube_apply_heist_bank"
	self.spa.ghost_bonus = nil
	self.spa.max_bags = 9999
	self.spa.ai_group_type = america
	self.fish = {}
	self.fish.name_id = "heist_fish_hl"
	self.fish.briefing_id = "heist_fish_hl_briefing"
	self.fish.briefing_dialog = "Play_pln_fish_brf"
	self.fish.world_name = "narratives/continental/fish"
	self.fish.intro_event = "Play_pln_fish_intro"
	self.fish.outro_event = "Play_pln_fish_end"
	self.fish.failure_music = "Play_fish_jazz_game_over"
	self.fish.music = "ghost"
	self.fish.music_ext_start = "suspense_1"
	self.fish.package = "packages/lvl_fish"
	self.fish.cube = "cube_apply_heist_bank"
	self.fish.ghost_bonus = 0.1
	self.fish.ghost_required = true
	self.fish.max_bags = 9999
	self.fish.ai_group_type = america
	self.haunted = {}
	self.haunted.name_id = "heist_haunted_hl"
	self.haunted.briefing_id = "heist_haunted_briefing"
	self.haunted.world_name = "narratives/haunted_safehouse"
	self.haunted.intro_event = "Play_hw13_intro"
	self.haunted.outro_event = {
		"lol",
		"lolo"
	}
	self.haunted.music = "heist"
	self.haunted.package = "packages/narr_haunted"
	self.haunted.cube = "cube_apply_heist_bank"
	self.haunted.max_bags = 4
	self.run = {}
	self.run.name_id = "heist_run_hl"
	self.run.briefing_id = "heist_run_briefing"
	self.run.briefing_dialog = "Play_pln_run_brf"
	self.run.world_name = "narratives/classics/run"
	self.run.intro_event = "Play_pln_run_intro"
	self.run.outro_event = "Play_loc_run_end"
	self.run.music = "heist"
	self.run.package = "packages/narr_run"
	self.run.cube = "cube_apply_heist_bank"
	self.glace = {}
	self.glace.name_id = "heist_glace_hl"
	self.glace.briefing_id = "heist_glace_briefing"
	self.glace.briefing_dialog = "Play_pln_glace_brf"
	self.glace.world_name = "narratives/classics/glace"
	self.glace.intro_event = "Play_pln_glace_intro"
	self.glace.outro_event = "Play_pln_glace_end"
	self.glace.music = "heist"
	self.glace.package = "packages/narr_glace"
	self.glace.cube = "cube_apply_heist_bank"
	self.glace.environment_effects = {
		"rain",
		"raindrop_screen",
		"lightning"
	}
	self.glace.equipment = {
		"saw"
	}
	self.glace.player_style = "raincoat"
	self.glace.no_police_calling = true
	self.glace.on_enter_clbks = {
		function()
			if Network:is_server() then
				managers.groupai:state():on_police_weapons_hot(managers.groupai:state().analyse_giveaway("empty"))
			end
		end
	}
	self.dah = {}
	self.dah.name_id = "heist_dah_hl"
	self.dah.briefing_id = "heist_dah_briefing"
	self.dah.package = "packages/lvl_dah"
	self.dah.briefing_dialog = "Play_pln_dah_brf"
	self.dah.world_name = "narratives/classics/dah"
	self.dah.intro_event = "Play_pln_dah_intro"
	self.dah.outro_event = {
		"Play_pln_dah_end_stealth",
		"Play_pln_dah_end_loud"
	}
	self.dah.music = "heist"
	self.dah.cube = "cube_apply_heist_bank"
	self.dah.max_bags = 20
	self.dah.ghost_bonus = 0.1
	self.dah.ai_group_type = america
	self.dah.player_style = "sneak_suit"
	self.dah.load_screen = "guis/dlcs/pic/textures/loading/job_diamond_heist_df"
	self.rvd1 = {}
	self.rvd1.name_id = "heist_rvd1_hl"
	self.rvd1.briefing_id = "heist_rvd1_briefing"
	self.rvd1.briefing_dialog = "Play_loc_rvd_brf"
	self.rvd1.world_name = "narratives/bain/rvd/stage1"
	self.rvd1.intro_event = "Play_loc_rvd_intro"
	self.rvd1.outro_event = "Play_loc_rvd_end"
	self.rvd1.music = "heist"
	self.rvd1.package = "packages/job_rvd"
	self.rvd1.cube = "cube_apply_heist_bank"
	self.rvd1.max_bags = 10
	self.rvd1.ai_group_type = america
	self.rvd1.narrator = "locke"
	self.rvd1.load_screen = "guis/dlcs/rvd/textures/loading/job_rvd_01_df"
	self.rvd2 = {}
	self.rvd2.name_id = "heist_rvd2_hl"
	self.rvd2.briefing_id = "heist_rvd2_briefing"
	self.rvd2.briefing_dialog = "Play_pln_rvd_brf"
	self.rvd2.world_name = "narratives/bain/rvd/stage2"
	self.rvd2.intro_event = "Play_pln_rvd_02"
	self.rvd2.outro_event = "Play_pln_rvd_end"
	self.rvd2.music = "heist"
	self.rvd2.package = "packages/job_rvd2"
	self.rvd2.cube = "cube_apply_heist_bank"
	self.rvd2.ai_group_type = america
	self.rvd2.sniper_laser_distance = 20000
	self.rvd2.max_bags = 30
	self.rvd2.load_screen = "guis/dlcs/rvd/textures/loading/job_rvd_02_df"
	self.hvh = {}
	self.hvh.name_id = "heist_hvh_hl"
	self.hvh.briefing_id = "heist_hvh_briefing"
	self.hvh.package = "packages/narr_hvh"
	self.hvh.briefing_dialog = "Play_hvh_brf_01"
	self.hvh.world_name = "narratives/bain/hvh"
	self.hvh.intro_event = "Play_hvh_intro_01"
	self.hvh.outro_event = {
		"lol",
		"lolo"
	}
	self.hvh.music = "heist"
	self.hvh.cube = "cube_apply_heist_bank"
	self.hvh.max_bags = 80
	self.hvh.ai_group_type = zombie
	self.hvh.ai_marshal_spawns_disabled = true
	self.hvh.load_screen = "guis/dlcs/pic/textures/loading/job_halloween2017"
	self.wwh = {}
	self.wwh.name_id = "heist_wwh_hl"
	self.wwh.briefing_id = "heist_wwh_briefing"
	self.wwh.package = "packages/lvl_wwh"
	self.wwh.briefing_dialog = "Play_pln_wwh_brf"
	self.wwh.world_name = "narratives/locke/wwh"
	self.wwh.intro_event = "Play_loc_wwh_intro"
	self.wwh.outro_event = "Play_pln_wwh_end"
	self.wwh.music = "heist"
	self.wwh.cube = "cube_apply_heist_bank"
	self.wwh.environment_effects = {
		"snow"
	}
	self.wwh.player_style = "winter_suit"
	self.wwh.max_bags = 12
	self.wwh.ai_group_type = america
	self.wwh.sniper_laser_distance = 15000
	self.wwh.drop_pickups_to_ground = true
	self.brb = {}
	self.brb.name_id = "heist_brb_hl"
	self.brb.briefing_id = "heist_brb_briefing"
	self.brb.briefing_dialog = "Play_loc_brb_brf"
	self.brb.world_name = "narratives/locke/brb"
	self.brb.intro_event = "Play_loc_brb_intro"
	self.brb.outro_event = "Play_loc_brb_end"
	self.brb.music = "heist"
	self.brb.package = "packages/lvl_brb"
	self.brb.cube = "cube_apply_heist_bank"
	self.brb.max_bags = 26
	self.brb.narrator = "locke"
	self.brb.sniper_laser_distance = 15000
	self.brb.load_screen = "guis/dlcs/brb/textures/loading/job_brb_df"
	self.tag = {}
	self.tag.name_id = "heist_tag_hl"
	self.tag.briefing_id = "heist_tag_briefing"
	self.tag.package = "packages/job_tag"
	self.tag.briefing_dialog = "Play_loc_tag_brf"
	self.tag.world_name = "narratives/locke/tag"
	self.tag.intro_event = "Play_loc_tag_intro"
	self.tag.outro_event = "Play_loc_tag_end"
	self.tag.music = "ghost"
	self.tag.cube = "cube_apply_heist_bank"
	self.tag.music_ext_start = "suspense_1"
	self.tag.max_bags = 20
	self.tag.ghost_bonus = 0.1
	self.tag.ai_group_type = america
	self.tag.narrator = "locke"
	self.tag.ghost_required = true
	self.tag.load_screen = "guis/dlcs/tag/textures/loading/job_tag_df"
	self.des = {}
	self.des.name_id = "heist_des_hl"
	self.des.briefing_id = "heist_des_briefing"
	self.des.package = "packages/job_des"
	self.des.briefing_dialog = "Play_loc_des_brf"
	self.des.world_name = "narratives/locke/des"
	self.des.intro_event = "Play_loc_des_intro"
	self.des.outro_event = "Play_loc_des_end"
	self.des.music = "heist"
	self.des.cube = "cube_apply_heist_bank"
	self.des.max_bags = 20
	self.des.ai_group_type = murkywater
	self.des.narrator = "locke"
	self.des.load_screen = "guis/dlcs/des/textures/loading/job_des_df"
	self.nmh = {}
	self.nmh.name_id = "heist_nmh_hl"
	self.nmh.briefing_id = "heist_nmh_briefing"
	self.nmh.package = "packages/dlcs/nmh/job_nmh"
	self.nmh.briefing_dialog = "Play_pln_nmh_brf"
	self.nmh.world_name = "narratives/classics/nmh"
	self.nmh.intro_event = "Play_pln_nmh_intro"
	self.nmh.outro_event = "Play_pln_nmh_end_win"
	self.nmh.cube = "cube_apply_heist_bank"
	self.nmh.failure_event = "Play_pln_nmh_end_fail"
	self.nmh.max_bags = 0
	self.nmh.ghost_bonus = 0.1
	self.nmh.ai_group_type = america
	self.nmh.narrator = "bain"
	self.nmh.load_screen = "guis/dlcs/nmh/textures/loading/job_nmh_df"
	self.sah = {}
	self.sah.name_id = "heist_sah_hl"
	self.sah.briefing_id = "heist_sah_briefing"
	self.sah.package = "packages/dlcs/sah/job_sah"
	self.sah.briefing_dialog = "Play_loc_sah_brf"
	self.sah.world_name = "narratives/locke/sah"
	self.sah.intro_event = "Play_loc_sah_intro"
	self.sah.outro_event = {
		"Play_loc_sah_end_stealth",
		"Play_loc_sah_end_loud"
	}
	self.sah.cube = "cube_apply_heist_bank"
	self.sah.music = "heist"
	self.sah.music_ext = "music_tag"
	self.sah.music_ext_start = "suspense_1"
	self.sah.max_bags = 40
	self.sah.ghost_bonus = 0.1
	self.sah.ai_group_type = america
	self.sah.narrator = "locke"
	self.sah.player_style = "tux"
	self.bph = {}
	self.bph.name_id = "heist_bph_hl"
	self.bph.briefing_id = "heist_bph_briefing"
	self.bph.package = "packages/dlcs/bph/job_bph"
	self.bph.briefing_dialog = "Play_loc_bph_brf"
	self.bph.world_name = "narratives/locke/bph"
	self.bph.intro_event = "Play_loc_bph_intro"
	self.bph.outro_event = "Play_loc_bph_end_win"
	self.bph.failure_event = "Play_loc_bph_end_fail"
	self.bph.music = "heist"
	self.bph.cube = "cube_apply_heist_bank"
	self.bph.max_bags = 20
	self.bph.ai_group_type = murkywater
	self.bph.player_style = "sneak_suit"
	self.bph.narrator = "locke"
	self.bph.load_screen = "guis/dlcs/bph/textures/loading/job_bph_df"
	self.skm_mus = {}
	self.skm_mus.name_id = "heist_skm_mus_h1"
	self.skm_mus.briefing_id = "heist_skm_mus_briefing"
	self.skm_mus.package = "packages/dlcs/skm/job_skm"
	self.skm_mus.briefing_dialog = "Play_loc_skm_brf"
	self.skm_mus.world_name = "narratives/skm/skm_mus"
	self.skm_mus.intro_event = "Play_loc_skm_intro"
	self.skm_mus.outro_event = {
		"Play_loc_skm_end_win",
		"Play_loc_skm_end_fail"
	}
	self.skm_mus.cube = "cube_apply_heist_bank"
	self.skm_mus.music = "heist"
	self.skm_mus.ai_group_type = america
	self.skm_mus.group_ai_state = "skirmish"
	self.skm_mus.wave_count = 9
	self.skm_mus.narrator = "locke"
	self.skm_red2 = {}
	self.skm_red2.name_id = "heist_skm_red2_h1"
	self.skm_red2.briefing_id = "heist_skm_red2_briefing"
	self.skm_red2.briefing_dialog = "Play_loc_skm_brf"
	self.skm_red2.world_name = "narratives/skm/skm_red2"
	self.skm_red2.intro_event = "Play_loc_skm_intro"
	self.skm_red2.outro_event = {
		"Play_loc_skm_end_win",
		"Play_loc_skm_end_fail"
	}
	self.skm_red2.music = "heist"
	self.skm_red2.package = "packages/dlcs/skm/job_skm"
	self.skm_red2.cube = "cube_apply_heist_bank"
	self.skm_red2.ai_group_type = america
	self.skm_red2.group_ai_state = "skirmish"
	self.skm_red2.wave_count = 9
	self.skm_red2.narrator = "locke"
	self.skm_run = {}
	self.skm_run.name_id = "heist_skm_run_h1"
	self.skm_run.briefing_id = "heist_skm_run_briefing"
	self.skm_run.briefing_dialog = "Play_loc_skm_brf"
	self.skm_run.world_name = "narratives/skm/skm_run"
	self.skm_run.intro_event = "Play_loc_skm_intro"
	self.skm_run.outro_event = {
		"Play_loc_skm_end_win",
		"Play_loc_skm_end_fail"
	}
	self.skm_run.music = "heist"
	self.skm_run.package = "packages/dlcs/skm/job_skm"
	self.skm_run.cube = "cube_apply_heist_bank"
	self.skm_run.ai_group_type = america
	self.skm_run.group_ai_state = "skirmish"
	self.skm_run.wave_count = 9
	self.skm_run.narrator = "locke"
	self.skm_watchdogs_stage2 = {}
	self.skm_watchdogs_stage2.name_id = "heist_skm_watchdogs_stage2_h1"
	self.skm_watchdogs_stage2.briefing_id = "heist_skm_watchdogs_stage2_briefing"
	self.skm_watchdogs_stage2.briefing_dialog = "Play_loc_skm_brf"
	self.skm_watchdogs_stage2.world_name = "narratives/skm/skm_watchdogs_stage2"
	self.skm_watchdogs_stage2.intro_event = "Play_loc_skm_intro"
	self.skm_watchdogs_stage2.outro_event = {
		"Play_loc_skm_end_win",
		"Play_loc_skm_end_fail"
	}
	self.skm_watchdogs_stage2.music = "heist"
	self.skm_watchdogs_stage2.package = "packages/dlcs/skm/job_skm"
	self.skm_watchdogs_stage2.cube = "cube_apply_heist_bank"
	self.skm_watchdogs_stage2.ai_group_type = america
	self.skm_watchdogs_stage2.group_ai_state = "skirmish"
	self.skm_watchdogs_stage2.wave_count = 9
	self.skm_watchdogs_stage2.narrator = "locke"
	self.skm_cas = {}
	self.skm_cas.name_id = "heist_skm_cas_h1"
	self.skm_cas.briefing_id = "heist_skm_cas_briefing"
	self.skm_cas.briefing_dialog = "Play_loc_skm_brf"
	self.skm_cas.world_name = "narratives/skm/skm_cas"
	self.skm_cas.intro_event = "Play_loc_skm_intro"
	self.skm_cas.outro_event = {
		"Play_loc_skm_end_win",
		"Play_loc_skm_end_fail"
	}
	self.skm_cas.music = "heist"
	self.skm_cas.package = "packages/dlcs/skm/job_skm"
	self.skm_cas.cube = "cube_apply_heist_bank"
	self.skm_cas.ai_group_type = america
	self.skm_cas.group_ai_state = "skirmish"
	self.skm_cas.wave_count = 9
	self.skm_cas.narrator = "locke"
	self.skm_big2 = {}
	self.skm_big2.name_id = "heist_skm_big2_h1"
	self.skm_big2.briefing_id = "heist_skm_big2_briefing"
	self.skm_big2.briefing_dialog = "Play_loc_skm_brf"
	self.skm_big2.world_name = "narratives/skm/skm_big2"
	self.skm_big2.intro_event = "Play_loc_skm_intro"
	self.skm_big2.outro_event = {
		"Play_loc_skm_end_win",
		"Play_loc_skm_end_fail"
	}
	self.skm_big2.music = "heist"
	self.skm_big2.package = "packages/dlcs/skm/job_skm"
	self.skm_big2.cube = "cube_apply_heist_bank"
	self.skm_big2.ai_group_type = america
	self.skm_big2.group_ai_state = "skirmish"
	self.skm_big2.wave_count = 9
	self.skm_big2.narrator = "locke"
	self.skm_mallcrasher = {}
	self.skm_mallcrasher.name_id = "heist_skm_mallcrasher_h1"
	self.skm_mallcrasher.briefing_id = "heist_skm_mallcrasher_briefing"
	self.skm_mallcrasher.briefing_dialog = "Play_loc_skm_brf"
	self.skm_mallcrasher.world_name = "narratives/skm/skm_mallcrasher"
	self.skm_mallcrasher.intro_event = "Play_loc_skm_intro"
	self.skm_mallcrasher.outro_event = {
		"Play_loc_skm_end_win",
		"Play_loc_skm_end_fail"
	}
	self.skm_mallcrasher.music = "heist"
	self.skm_mallcrasher.package = "packages/dlcs/skm/job_skm"
	self.skm_mallcrasher.cube = "cube_apply_heist_bank"
	self.skm_mallcrasher.ai_group_type = america
	self.skm_mallcrasher.group_ai_state = "skirmish"
	self.skm_mallcrasher.wave_count = 9
	self.skm_mallcrasher.narrator = "locke"
	self.skm_arena = {}
	self.skm_arena.name_id = "heist_skm_arena_h1"
	self.skm_arena.briefing_id = "heist_skm_arena_briefing"
	self.skm_arena.briefing_dialog = "Play_loc_skm_brf"
	self.skm_arena.world_name = "narratives/skm/skm_arena"
	self.skm_arena.intro_event = "Play_loc_skm_intro"
	self.skm_arena.outro_event = {
		"Play_loc_skm_end_win",
		"Play_loc_skm_end_fail"
	}
	self.skm_arena.music = "heist"
	self.skm_arena.package = "packages/dlcs/skm/job_skm"
	self.skm_arena.cube = "cube_apply_heist_bank"
	self.skm_arena.ai_group_type = america
	self.skm_arena.group_ai_state = "skirmish"
	self.skm_arena.wave_count = 9
	self.skm_arena.narrator = "locke"
	self.skm_bex = {}
	self.skm_bex.name_id = "heist_skm_bex_h1"
	self.skm_bex.briefing_id = "heist_skm_bex_briefing"
	self.skm_bex.briefing_dialog = "Play_loc_skm_brf"
	self.skm_bex.world_name = "narratives/skm/skm_bex"
	self.skm_bex.intro_event = "Play_loc_skm_intro"
	self.skm_bex.outro_event = {
		"Play_loc_skm_end_win",
		"Play_loc_skm_end_fail"
	}
	self.skm_bex.music = "heist"
	self.skm_bex.package = "packages/dlcs/skm/job_bex_skm"
	self.skm_bex.cube = "cube_apply_heist_bank"
	self.skm_bex.ai_group_type = federales
	self.skm_bex.group_ai_state = "skirmish"
	self.skm_bex.wave_count = 9
	self.skm_bex.narrator = "locke"
	self.vit = {}
	self.vit.name_id = "heist_vit_hl"
	self.vit.briefing_id = "heist_vit_briefing"
	self.vit.package = "packages/dlcs/vit/job_vit"
	self.vit.briefing_dialog = "Play_loc_vit_brf"
	self.vit.world_name = "narratives/locke/vit"
	self.vit.intro_event = "Play_loc_vit_intro"
	self.vit.outro_event = {
		"Play_loc_vit_end_win",
		"Play_pln_uno_end_win"
	}
	self.vit.failure_event = "Play_loc_vit_end_fail"
	self.vit.music = "heist"
	self.vit.cube = "cube_apply_heist_bank"
	self.vit.max_bags = 20
	self.vit.ghost_bonus = 0.1
	self.vit.ai_group_type = murkywater
	self.vit.narrator = "locke"
	self.vit.player_style = "murky_suit"
	self.vit.load_screen = "guis/dlcs/vit/textures/loading/job_vit_df"
	self.mex = {}
	self.mex.name_id = "heist_mex_hl"
	self.mex.briefing_id = "heist_mex_briefing"
	self.mex.package = "packages/job_mex"
	self.mex.briefing_dialog = "Play_loc_mex_brf_01"
	self.mex.world_name = "narratives/locke/mex"
	self.mex.intro_event = "Play_loc_med_intro"
	self.mex.outro_event = {
		"Play_loc_mex_end_stealth_01",
		"Play_loc_mex_end_loud_01"
	}
	self.mex.music = "heist"
	self.mex.cube = "cube_apply_heist_bank"
	self.mex.max_bags = 100
	self.mex.ghost_bonus = 0.15
	self.mex.ai_group_type = murkywater
	self.mex.narrator = "locke"
	self.mex.load_screen = "guis/dlcs/mex/textures/loading/job_mex_df"
	self.mex_cooking = {}
	self.mex_cooking.name_id = "heist_mex_cooking_hl"
	self.mex_cooking.briefing_id = "heist_mex_cooking_briefing"
	self.mex_cooking.package = "packages/job_mex2"
	self.mex_cooking.briefing_dialog = "Play_loc_mex_cook_brf_01"
	self.mex_cooking.world_name = "narratives/locke/mex"
	self.mex_cooking.intro_event = "Play_loc_mex_cook_intro"
	self.mex_cooking.outro_event = {
		"Play_loc_count_gen_13",
		"Play_loc_count_gen_14",
		"Play_loc_count_gen_15",
		"Play_loc_count_gen_16"
	}
	self.mex_cooking.music = "heist"
	self.mex_cooking.cube = "cube_apply_heist_bank"
	self.mex_cooking.max_bags = 100
	self.mex_cooking.ai_group_type = murkywater
	self.mex_cooking.narrator = "locke"
	self.mex_cooking.load_screen = "guis/dlcs/mex/textures/loading/job_mex_cooking_df"
	self.bex = {}
	self.bex.name_id = "heist_bex_hl"
	self.bex.briefing_id = "heist_bex_briefing"
	self.bex.briefing_dialog = "Play_loc_bex_brf"
	self.bex.world_name = "narratives/vlad/bex"
	self.bex.intro_event = "Play_loc_bex_intro"
	self.bex.outro_event = {
		"Play_loc_bex_end"
	}
	self.bex.music = "heist"
	self.bex.package = "packages/job_bex"
	self.bex.cube = "cube_apply_heist_bank"
	self.bex.ai_group_type = federales
	self.bex.narrator = "locke"
	self.bex.ghost_bonus = 0.15
	self.bex.sniper_laser_distance = 15000
	self.bex.load_screen = "guis/dlcs/bex/textures/loading/job_bex_01_df"
	self.pex = {}
	self.pex.name_id = "heist_pex_hl"
	self.pex.briefing_id = "heist_pex_briefing"
	self.pex.briefing_dialog = "Play_loc_pex_brf"
	self.pex.world_name = "narratives/locke/pex"
	self.pex.intro_event = "Play_loc_pex_intro"
	self.pex.outro_event = {
		loud = "Play_loc_pex_end_loud",
		stealth = "Play_loc_pex_end_stealth"
	}
	self.pex.music = "heist"
	self.pex.package = "packages/job_pex"
	self.pex.cube = "cube_apply_heist_bank"
	self.pex.ai_group_type = federales
	self.pex.narrator = "locke"
	self.pex.ghost_bonus = 0.15
	self.pex.load_screen = "guis/dlcs/pex/textures/loading/job_pex_01_df"
	self.pex.teams = {
		criminal1 = {
			foes = {
				law1 = true,
				mobster1 = true
			},
			friends = {
				converted_enemy = true,
				escort = true
			}
		},
		law1 = {
			foes = {
				converted_enemy = true,
				criminal1 = true,
				hacked_turret = true,
				mobster1 = true
			},
			friends = {}
		},
		mobster1 = {
			foes = {
				converted_enemy = true,
				criminal1 = true,
				hacked_turret = true,
				law1 = true
			},
			friends = {}
		},
		converted_enemy = {
			foes = {
				law1 = true,
				mobster1 = true
			},
			friends = {
				criminal1 = true,
				escort = true
			}
		},
		neutral1 = {
			foes = {},
			friends = {}
		},
		hacked_turret = {
			foes = {
				law1 = true,
				mobster1 = true
			},
			friends = {}
		},
		escort = {
			foes = {},
			friends = {
				converted_enemy = true,
				criminal1 = true
			}
		}
	}
	self.fex = {}
	self.fex.name_id = "heist_fex_hl"
	self.fex.briefing_id = "heist_fex_briefing"
	self.fex.briefing_dialog = "Play_loc_fex_brf"
	self.fex.world_name = "narratives/vlad/fex"
	self.fex.intro_event = "Play_loc_fex_intro"
	self.fex.outro_event = {
		loud = "Play_vld_fex_end",
		stealth = "Play_vld_fex_end"
	}
	self.fex.music = "heist"
	self.fex.package = "packages/job_fex"
	self.fex.cube = "cube_apply_heist_bank"
	self.fex.ai_group_type = federales
	self.fex.narrator = "locke"
	self.fex.ghost_bonus = 0.15
	self.fex.load_screen = "guis/dlcs/fex/textures/loading/job_fex_01_df"
	self.fex.teams = deep_clone(self.pex.teams)
	self.chas = {}
	self.chas.name_id = "heist_chas_hl"
	self.chas.briefing_id = "heist_chas_briefing"
	self.chas.briefing_dialog = "Play_loc_chas_brf"
	self.chas.world_name = "narratives/jiu/chas"
	self.chas.intro_event = "Play_loc_chas_intro"
	self.chas.outro_event = {
		loud = "Play_loc_chas_end",
		stealth = "Play_loc_chas_end"
	}
	self.chas.music = "heist"
	self.chas.package = "packages/job_chas"
	self.chas.cube = "cube_apply_heist_bank"
	self.chas.ai_group_type = america
	self.chas.narrator = "locke"
	self.chas.ghost_bonus = 0.15
	self.chas.load_screen = "guis/dlcs/chas/textures/loading/job_chas_01_df"
	self.chas.teams = deep_clone(self.fex.teams)
	self.sand = {}
	self.sand.name_id = "heist_sand_hl"
	self.sand.briefing_id = "heist_sand_briefing"
	self.sand.briefing_dialog = "Play_loc_sand_brf"
	self.sand.world_name = "narratives/jiu/sand"
	self.sand.intro_event = "Play_loc_sand_intro"
	self.sand.outro_event = {
		loud = "Play_loc_sand_end_loud",
		stealth = "Play_loc_sand_end_stealth"
	}
	self.sand.music = "heist"
	self.sand.package = "packages/job_sand"
	self.sand.cube = "cube_apply_heist_bank"
	self.sand.ai_group_type = america
	self.sand.narrator = "locke"
	self.sand.ghost_bonus = 0.15
	self.sand.load_screen = "guis/dlcs/sand/textures/loading/job_sand_01_df"
	self.sand.teams = deep_clone(self.chas.teams)
	self.chca = {}
	self.chca.name_id = "heist_chca_hl"
	self.chca.briefing_id = "heist_chca_briefing"
	self.chca.briefing_dialog = "Play_loc_chca_brf"
	self.chca.world_name = "narratives/vlad/chca"
	self.chca.intro_event = {
		"Play_loc_chca_intro_stealth",
		"Play_loc_chca_intro_loud"
	}
	self.chca.outro_event = {
		loud = "Play_loc_chca_end_loud",
		stealth = "Play_loc_chca_end_stealth"
	}
	self.chca.music = "heist"
	self.chca.package = "packages/job_chca"
	self.chca.cube = "cube_apply_heist_bank"
	self.chca.ai_group_type = america
	self.chca.narrator = "locke"
	self.chca.ghost_bonus = 0.15
	self.chca.load_screen = "guis/dlcs/chca/textures/loading/job_chca_01_df"
	self.chca.teams = deep_clone(self.sand.teams)
	self.pent = {}
	self.pent.name_id = "heist_pent_hl"
	self.pent.briefing_id = "heist_pent_briefing"
	self.pent.briefing_dialog = "Play_loc_pent_brf"
	self.pent.world_name = "narratives/shayu/pent"
	self.pent.intro_event = "Play_loc_pent_intro"
	self.pent.outro_event = {
		loud = "Play_loc_pent_end_loud",
		stealth = "Play_loc_pent_end_stealth"
	}
	self.pent.music = "heist"
	self.pent.package = "packages/job_pent"
	self.pent.cube = "cube_apply_heist_bank"
	self.pent.ai_group_type = america
	self.pent.narrator = "locke"
	self.pent.ghost_bonus = 0.15
	self.pent.load_screen = "guis/dlcs/pent/textures/loading/job_pent_01_df"
	self.pent.teams = deep_clone(self.chca.teams)
	self.ranc = {}
	self.ranc.name_id = "heist_ranc_hl"
	self.ranc.briefing_id = "heist_ranc_briefing"
	self.ranc.briefing_dialog = "Play_loc_ranc_brf"
	self.ranc.world_name = "narratives/mcshay/ranc"
	self.ranc.intro_event = "Play_loc_ranc_intro"
	self.ranc.outro_event = {
		loud = "Play_loc_ranc_end_loud",
		stealth = "Play_loc_ranc_end_stealth"
	}
	self.ranc.music = "heist"
	self.ranc.package = "packages/job_ranc"
	self.ranc.cube = "cube_apply_heist_bank"
	self.ranc.ai_group_type = america
	self.ranc.ai_marshal_spawns_fast = true
	self.ranc.narrator = "locke"
	self.ranc.ghost_bonus = 0.15
	self.ranc.load_screen = "guis/dlcs/ranc/textures/loading/job_ranc_01_df"
	self.ranc.teams = deep_clone(self.pent.teams)
	self.trai = {}
	self.trai.name_id = "heist_trai_hl"
	self.trai.briefing_id = "heist_trai_briefing"
	self.trai.briefing_dialog = "Play_loc_trai_brf"
	self.trai.world_name = "narratives/mcshay/trai"
	self.trai.intro_event = "Play_loc_trai_intro"
	self.trai.outro_event = {
		loud = "Play_loc_trai_end_loud",
		stealth = "Play_loc_trai_end_stealth"
	}
	self.trai.music = "heist"
	self.trai.package = "packages/job_trai"
	self.trai.cube = "cube_apply_heist_bank"
	self.trai.ai_group_type = america
	self.trai.sniper_laser_distance = 15000
	self.trai.ai_marshal_spawns_fast = true
	self.trai.narrator = "locke"
	self.trai.ghost_bonus = 0.15
	self.trai.max_bags = 35
	self.trai.load_screen = "guis/dlcs/trai/textures/loading/job_trai_01_df"
	self.trai.equipment = {
		{
			id = "ranc_sheriff_star",
			job_value = {
				key = "star_ranc",
				save = true,
				value = 1
			}
		}
	}
	self.trai.teams = deep_clone(self.ranc.teams)
	self.corp = {}
	self.corp.name_id = "heist_corp_hl"
	self.corp.briefing_id = "heist_corp_briefing"
	self.corp.briefing_dialog = "Play_loc_corp_brf"
	self.corp.world_name = "narratives/blaine/corp"
	self.corp.intro_event = "Play_loc_corp_intro"
	self.corp.outro_event = {
		loud = "Play_loc_corp_end_loud",
		stealth = "Play_loc_corp_end_stealth"
	}
	self.corp.music = "heist"
	self.corp.package = "packages/job_corp"
	self.corp.cube = "cube_apply_heist_bank"
	self.corp.ai_group_type = america
	self.corp.ai_marshal_spawns_fast = true
	self.corp.narrator = "locke"
	self.corp.ghost_bonus = 0.15
	self.corp.max_bags = 25
	self.corp.load_screen = "guis/dlcs/corp/textures/loading/job_corp_01_df"
	self.corp.equipment = {
		{
			id = "trai_usb_key",
			job_value = {
				key = "usb_train",
				save = true,
				value = 1
			}
		}
	}
	self.corp.teams = deep_clone(self.trai.teams)
	self.deep = {}
	self.deep.name_id = "heist_deep_hl"
	self.deep.briefing_id = "heist_deep_briefing"
	self.deep.briefing_dialog = "Play_loc_deep_brf"
	self.deep.world_name = "narratives/blaine/deep"
	self.deep.intro_event = "Play_loc_deep_intro"
	self.deep.outro_event = {
		loud = "Play_loc_deep_end_loud",
		stealth = "Play_loc_deep_end_stealth"
	}
	self.deep.failure_music = {
		"oil_rig_explosion_end_screen"
	}
	self.deep.failure_event = {}
	self.deep.music = "heist"
	self.deep.package = "packages/job_deep"
	self.deep.cube = "cube_apply_heist_bank"
	self.deep.ai_group_type = america
	self.deep.ai_marshal_spawns_fast = true
	self.deep.ai_unit_group_overrides = {
		marshal_shield = {
			america = {
				Idstring("units/pd2_dlc_usm2/characters/ene_male_marshal_shield_2/ene_male_marshal_shield_2")
			}
		},
		marshal_marksman = {
			america = {
				Idstring("units/pd2_dlc_usm1/characters/ene_male_marshal_marksman_2/ene_male_marshal_marksman_2")
			}
		}
	}
	self.deep.narrator = "locke"
	self.deep.ghost_bonus = 0.15
	self.deep.load_screen = "guis/dlcs/deep/textures/loading/job_deep_01_df"
	self.deep.equipment = {
		{
			id = "corp_achi_blueprint",
			job_value = {
				key = "blueprint_corp",
				save = true,
				value = 1
			}
		}
	}
	self.deep.teams = deep_clone(self.corp.teams)
	self._level_index = {
		"welcome_to_the_jungle_1",
		"welcome_to_the_jungle_1_night",
		"welcome_to_the_jungle_2",
		"framing_frame_1",
		"framing_frame_2",
		"framing_frame_3",
		"election_day_1",
		"election_day_2",
		"election_day_3",
		"election_day_3_skip1",
		"election_day_3_skip2",
		"watchdogs_1",
		"watchdogs_2",
		"watchdogs_1_night",
		"watchdogs_2_day",
		"alex_1",
		"alex_2",
		"alex_3",
		"firestarter_1",
		"firestarter_2",
		"firestarter_3",
		"ukrainian_job",
		"jewelry_store",
		"four_stores",
		"mallcrasher",
		"nightclub",
		"branchbank",
		"escape_cafe",
		"escape_park",
		"escape_cafe_day",
		"escape_park_day",
		"escape_street",
		"escape_overpass",
		"escape_garage",
		"escape_overpass_night",
		"safehouse",
		"arm_fac",
		"arm_par",
		"arm_hcm",
		"arm_cro",
		"arm_und",
		"arm_for",
		"family",
		"big",
		"mia_1",
		"mia_2",
		"mia2_new",
		"kosugi",
		"gallery",
		"hox_1",
		"hox_2",
		"pines",
		"cage",
		"hox_3",
		"mus",
		"crojob2",
		"crojob3",
		"crojob3_night",
		"rat",
		"shoutout_raid",
		"arena",
		"kenaz",
		"driving_escapes_industry_day",
		"driving_escapes_city_day",
		"jolly",
		"cane",
		"red2",
		"dinner",
		"pbr",
		"pbr2",
		"peta",
		"peta2",
		"pal",
		"nail",
		"man",
		"dark",
		"mad",
		"short1_stage1",
		"short1_stage2",
		"short2_stage1",
		"short2_stage2b",
		"born",
		"chew",
		"chill",
		"chill_combat",
		"friend",
		"flat",
		"help",
		"haunted",
		"moon",
		"spa",
		"fish",
		"run",
		"glace",
		"dah",
		"rvd1",
		"rvd2",
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

	table.insert(self._level_index, "roberts")

	self.escape_levels = {
		"escape_cafe",
		"escape_park",
		"escape_street",
		"escape_overpass",
		"escape_garage",
		"escape_overpass_night",
		"escape_cafe_day",
		"escape_park_day",
		"election_day_3",
		"arm_for",
		"escape_hell",
		"blueharvest_3",
		"driving_escapes_industry_day",
		"driving_escapes_city_day"
	}
end

function LevelsTweakData:get_level_index()
	return self._level_index
end

function LevelsTweakData:get_world_name_from_index(index)
	if not self._level_index[index] then
		return
	end

	return self[self._level_index[index]].world_name
end

function LevelsTweakData:get_level_name_from_index(index)
	return self._level_index[index]
end

function LevelsTweakData:get_index_from_world_name(world_name)
	for index, entry_name in ipairs(self._level_index) do
		if world_name == self[entry_name].world_name then
			return index
		end
	end
end

function LevelsTweakData:get_index_from_level_id(level_id)
	for index, entry_name in ipairs(self._level_index) do
		if entry_name == level_id then
			return index
		end
	end
end

function LevelsTweakData:requires_dlc(level_id)
	return self[level_id].dlc
end

function LevelsTweakData:requires_dlc_by_index(index)
	return self[self._level_index[index]].dlc
end

function LevelsTweakData:get_level_name_from_world_name(world_name)
	for _, entry_name in ipairs(self._level_index) do
		if world_name == self[entry_name].world_name then
			return entry_name
		end
	end
end

function LevelsTweakData:get_localized_level_name_from_world_name(world_name)
	for _, entry_name in ipairs(self._level_index) do
		if world_name == self[entry_name].world_name then
			return managers.localization:text(self[entry_name].name_id)
		end
	end
end

function LevelsTweakData:get_localized_level_name_from_level_id(level_id)
	for _, entry_name in ipairs(self._level_index) do
		if level_id == entry_name then
			return managers.localization:text(self[entry_name].name_id)
		end
	end
end

function LevelsTweakData:get_music_style(level_id)
	return self:get_music_style_from_level_data(tweak_data.levels[level_id])
end

function LevelsTweakData:get_music_style_from_level_data(level_data)
	local music_id = level_data and level_data.music or "default"

	if music_id == "no_music" then
		return "no_music"
	end

	if music_id == "ghost" then
		return level_data.music_ext_start and "ghost" or "no_ghost"
	end

	return "heist"
end

function LevelsTweakData:get_music_switches()
	if not Global.level_data then
		return nil
	end

	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]

	if self:get_music_style_from_level_data(level_data) ~= "heist" then
		return nil
	end

	local switches = {}

	if not Global.music_manager.loadout_selection then
		switches = managers.music:jukebox_random_all()
	elseif Global.music_manager.loadout_selection == "global" then
		switches = deep_clone(managers.music:playlist())
	elseif Global.music_manager.loadout_selection == "heist" then
		local track = managers.music:jukebox_heist_specific()

		if track == "all" then
			switches = managers.music:jukebox_random_all()
		elseif track == "playlist" then
			switches = deep_clone(managers.music:playlist())
		else
			table.insert(switches, track)
		end
	elseif Global.music_manager.loadout_selection == "server" then
		if Network:is_server() then
			switches = managers.music:jukebox_random_all()
		else
			table.insert(switches, Global.music_manager.synced_track)
		end
	else
		table.insert(switches, Global.music_manager.loadout_selection)
	end

	if #switches == 0 then
		Application:error("[LevelsTweakData:get_music_switches] Failed to find a track. JOB_ID = " .. (Global.job_manager.current_job and Global.job_manager.current_job.job_id or "[Missing]") .. ", SELECTION = " .. Global.music_manager.loadout_selection)
	end

	local overrides = level_data and level_data.music_overrides

	if overrides then
		for i, track in ipairs(switches) do
			local override = overrides[switches[i]]

			if override then
				print("[LevelsTweakData:get_music_switches] override track ", switches[i], "->", override)

				switches[i] = override
			end
		end
	end

	return switches
end

function LevelsTweakData:get_music_event(stage)
	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]

	if self:get_music_style_from_level_data(level_data) ~= "heist" then
		return nil
	end

	local music_id = level_data and level_data.music or "default"

	return tweak_data.music[music_id][stage]
end

function LevelsTweakData:get_music_event_ext()
	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	local music = level_data and level_data.music_ext
	local music_start = level_data and level_data.music_ext_start

	return music, music_start
end

function LevelsTweakData:get_music_event_ext_ghost()
	if not Global.level_data then
		return nil, nil
	end

	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]

	if self:get_music_style_from_level_data(level_data) ~= "ghost" then
		return nil, nil
	end

	local ghost_music_exts = {}

	if not Global.music_manager.loadout_selection_ghost or Global.music_manager.loadout_selection_ghost == "heist" then
		local track = managers.music:jukebox_ghost_specific()

		if track == "all" then
			ghost_music_exts = managers.music:jukebox_random_all_ghost()
		elseif track == "playlist" then
			ghost_music_exts = deep_clone(managers.music:playlist_ghost())
		else
			table.insert(ghost_music_exts, track)
		end
	elseif Global.music_manager.loadout_selection_ghost == "global" then
		ghost_music_exts = deep_clone(managers.music:playlist_ghost())
	elseif Global.music_manager.loadout_selection_ghost == "all" then
		ghost_music_exts = managers.music:jukebox_random_all_ghost()
	elseif Global.music_manager.loadout_selection_ghost == "server" then
		if Network:is_server() then
			ghost_music_exts = managers.music:jukebox_random_all_ghost()
		else
			table.insert(ghost_music_exts, Global.music_manager.synced_music_ext)
		end
	else
		table.insert(ghost_music_exts, Global.music_manager.loadout_selection_ghost)
	end

	if #ghost_music_exts == 0 then
		Application:error("[LevelsTweakData:get_music_ext_ghost] Failed to find a track. JOB_ID = " .. (Global.job_manager.current_job and Global.job_manager.current_job.job_id or "[Missing]") .. ", SELECTION = " .. Global.music_manager.loadout_selection_ghost)
		table.insert(ghost_music_exts, level_data.music_ext)
	end

	local overrides = level_data and level_data.music_overrides

	if overrides then
		for i, track in ipairs(ghost_music_exts) do
			local override = overrides[ghost_music_exts[i]]

			if override then
				print("[LevelsTweakData:get_music_event_ext_ghost] override music ", ghost_music_exts[i], "->", override)

				ghost_music_exts[i] = override
			end
		end
	end

	return table.random(ghost_music_exts), level_data.music_ext_start
end

function LevelsTweakData:get_default_team_ID(type)
	local lvl_tweak = self[Global.level_data.level_id]

	if lvl_tweak and lvl_tweak.default_teams and lvl_tweak.default_teams[type] then
		if lvl_tweak.teams[lvl_tweak.default_teams[type]] then
			return lvl_tweak.default_teams[type]
		else
			debug_pause("[LevelsTweakData:get_default_player_team_ID] Team not defined ", lvl_tweak.default_teams[type], "in", Global.level_data.level_id)
		end
	end

	if type == "player" then
		return "criminal1"
	elseif type == "combatant" then
		return "law1"
	elseif type == "non_combatant" then
		return "neutral1"
	else
		return "mobster1"
	end
end

function LevelsTweakData:get_team_setup()
	local lvl_tweak

	if Application:editor() and managers.editor then
		lvl_tweak = self[managers.editor:layer("Level Settings"):get_setting("simulation_level_id")]
	else
		lvl_tweak = Global.level_data and Global.level_data.level_id and self[Global.level_data.level_id]
	end

	local teams = lvl_tweak and lvl_tweak.teams

	if teams then
		teams = deep_clone(teams)
	else
		teams = {
			criminal1 = {
				foes = {
					law1 = true,
					mobster1 = true
				},
				friends = {
					converted_enemy = true
				}
			},
			law1 = {
				foes = {
					converted_enemy = true,
					criminal1 = true,
					hacked_turret = true,
					mobster1 = true
				},
				friends = {}
			},
			mobster1 = {
				foes = {
					converted_enemy = true,
					criminal1 = true,
					hacked_turret = true,
					law1 = true
				},
				friends = {}
			},
			converted_enemy = {
				foes = {
					law1 = true,
					mobster1 = true
				},
				friends = {
					criminal1 = true
				}
			},
			neutral1 = {
				foes = {},
				friends = {}
			},
			hacked_turret = {
				foes = {
					law1 = true,
					mobster1 = true
				},
				friends = {}
			}
		}

		for id, team in pairs(teams) do
			team.id = id
		end
	end

	return teams
end

function LevelsTweakData:get_default_team_IDs()
	local lvl_tweak

	if Application:editor() and managers.editor then
		lvl_tweak = self[managers.editor:layer("Level Settings"):get_setting("simulation_level_id")]
	else
		lvl_tweak = Global.level_data and Global.level_data.level_id and self[Global.level_data.level_id]
	end

	local default_team_IDs = lvl_tweak and lvl_tweak.default_teams

	default_team_IDs = default_team_IDs or {
		player = self:get_default_team_ID("player"),
		combatant = self:get_default_team_ID("combatant"),
		non_combatant = self:get_default_team_ID("non_combatant"),
		gangster = self:get_default_team_ID("gangster")
	}

	return default_team_IDs
end

function LevelsTweakData:get_team_names_indexed()
	local teams_index = self._teams_index

	if not teams_index then
		teams_index = {}

		local teams = self:get_team_setup()

		for team_id, team_data in pairs(teams) do
			table.insert(teams_index, team_id)
		end

		table.sort(teams_index)

		self._teams_index = teams_index
	end

	return teams_index
end

function LevelsTweakData:get_team_index(team_id)
	local teams_index = self:get_team_names_indexed()

	for index, test_team_id in ipairs(teams_index) do
		if team_id == test_team_id then
			return index
		end
	end
end

function LevelsTweakData:get_ai_group_type()
	local level_data = Global.level_data and Global.level_data.level_id and self[Global.level_data.level_id]

	if level_data then
		local ai_group_type = level_data.ai_group_type

		if ai_group_type then
			return ai_group_type
		end
	end

	return self.ai_groups.default
end

function LevelsTweakData:get_narrator_prefix(narrator)
	if not narrator then
		local level_data = Global.level_data and Global.level_data.level_id and self[Global.level_data.level_id]

		if level_data then
			narrator = level_data.narrator
		end
	end

	local narrator_codes = {
		bain = "ban",
		locke = "loc"
	}

	return narrator_codes[narrator] or "ban"
end

function LevelsTweakData:get_can_call_the_police()
	local level_data = Global.level_data and Global.level_data.level_id and self[Global.level_data.level_id]

	if level_data and level_data.no_police_calling then
		return false
	end

	return true
end

function LevelsTweakData:get_prevent_carry_disposal(carry_id)
	local level_data = Global.level_data and Global.level_data.level_id and self[Global.level_data.level_id]

	if level_data and level_data.prevent_carry_disposal and level_data.prevent_carry_disposal[carry_id] then
		return true
	end

	return false
end
