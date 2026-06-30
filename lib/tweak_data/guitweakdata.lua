GuiTweakData = GuiTweakData or class()

function GuiTweakData:init(tweak_data)
	local is_win_32 = SystemInfo:platform() == Idstring("WIN32")
	local is_nextgen = SystemInfo:platform() == Idstring("PS4") or SystemInfo:platform() == Idstring("XB1")
	local soundtrack = {
		date_id = "menu_content_soundtrack_date",
		desc_id = "menu_content_soundtrack_desc",
		id = "soundtrack",
		image = "guis/textures/pd2/content_updates/soundtrack",
		name_id = "menu_content_soundtrack",
		store = 254260
	}
	local diamond_store = {
		date_id = "menu_content_diamond_store_date",
		desc_id = "menu_content_diamond_store_desc",
		id = "diamond_store",
		image = "guis/textures/pd2/content_updates/diamond_store",
		name_id = "menu_content_diamond_store",
		store = 274160
	}
	local birthday = {
		date_id = "menu_content_birthday_date",
		desc_id = "menu_content_birthday_desc",
		id = "birthday",
		image = "guis/textures/pd2/content_updates/birthday",
		name_id = "menu_content_birthday",
		webpage = "https://www.paydaythegame.com/static/payday2/birthday/"
	}
	local halloween = {
		date_id = "menu_content_halloween_date",
		desc_id = "menu_content_halloween_desc",
		id = "halloween",
		image = "guis/textures/pd2/content_updates/halloween",
		name_id = "menu_content_halloween",
		webpage = "https://www.paydaythegame.com/static/payday2/helltopay/"
	}
	local armored_transport = {
		date_id = "menu_content_armored_transport_date",
		desc_id = "menu_content_armored_transport_desc",
		id = "armored_transport",
		image = "guis/textures/pd2/content_updates/armored_transport",
		name_id = "menu_content_armored_transport",
		store = 264610
	}
	local gage_pack = {
		date_id = "menu_content_gage_pack_date",
		desc_id = "menu_content_gage_pack_desc",
		id = "gage_pack",
		image = "guis/textures/pd2/content_updates/gage_pack",
		name_id = "menu_content_gage_pack",
		store = 267380
	}
	local charliesierra = {
		date_id = "menu_content_charliesierra_date",
		desc_id = "menu_content_charliesierra_desc",
		id = "charliesierra",
		image = "guis/textures/pd2/content_updates/charliesierra",
		name_id = "menu_content_charliesierra",
		store = 271110
	}
	local christmas = {
		date_id = "menu_content_christmas_date",
		desc_id = "menu_content_christmas_desc",
		id = "christmas",
		image = "guis/textures/pd2/content_updates/christmas",
		name_id = "menu_content_christmas",
		store = 267381
	}
	local infamy = {
		date_id = "menu_content_infamy_date",
		desc_id = "menu_content_infamy_desc",
		id = "infamy",
		image = "guis/textures/pd2/content_updates/infamy_introduction",
		name_id = "menu_content_infamy",
		store = 274161
	}
	local gage_pack_lmg = {
		date_id = "menu_content_gage_pack_lmg_date",
		desc_id = "menu_content_gage_pack_lmg_desc",
		id = "gage_pack_lmg",
		image = "guis/textures/pd2/content_updates/gage_pack_lmg",
		name_id = "menu_content_gage_pack_lmg",
		store = 275590
	}
	local deathwish = {
		date_id = "menu_content_deathwish_date",
		desc_id = "menu_content_deathwish_desc",
		id = "deathwish",
		image = "guis/textures/pd2/content_updates/deathwish",
		name_id = "menu_content_deathwish",
		store = 284430
	}
	local election_day = {
		date_id = "menu_content_election_day_date",
		desc_id = "menu_content_election_day_desc",
		id = "election_day",
		image = "guis/textures/pd2/content_updates/election_day",
		name_id = "menu_content_election_day",
		store = 288900
	}
	local gage_pack_jobs = {
		date_id = "menu_content_gage_pack_jobs_date",
		desc_id = "menu_content_gage_pack_jobs_desc",
		id = "gage_pack_jobs",
		image = "guis/textures/pd2/content_updates/gage_pack_jobs",
		name_id = "menu_content_gage_pack_jobs",
		store = 259381
	}
	local gage_pack_snp = {
		date_id = "menu_content_gage_pack_snp_date",
		desc_id = "menu_content_gage_pack_snp_desc",
		id = "gage_pack_snp",
		image = "guis/textures/pd2/content_updates/gage_pack_snp",
		name_id = "menu_content_gage_pack_snp",
		store = 259380
	}
	local kosugi = {
		date_id = "menu_content_kosugi_date",
		desc_id = "menu_content_kosugi_desc",
		id = "kosugi",
		image = "guis/textures/pd2/content_updates/kosugi",
		name_id = "menu_content_kosugi",
		store = 267382
	}
	local big_bank = {
		date_id = "menu_content_big_bank_date",
		desc_id = "menu_content_big_bank_desc",
		id = "big_bank",
		image = "guis/dlcs/big_bank/textures/pd2/content_updates/big_bank",
		name_id = "menu_content_big_bank",
		store = 306690
	}
	local gage_pack_shotgun = {
		date_id = "menu_content_gage_pack_shotgun_date",
		desc_id = "menu_content_gage_pack_shotgun_desc",
		id = "gage_pack_shotgun",
		image = "guis/dlcs/gage_pack_shotgun/textures/pd2/content_updates/gage_pack_shotgun",
		name_id = "menu_content_gage_pack_shotgun",
		store = 311050
	}
	local gage_pack_assault = {
		date_id = "menu_content_gage_pack_assault_date",
		desc_id = "menu_content_gage_pack_assault_desc",
		id = "gage_pack_assault",
		image = "guis/dlcs/gage_pack_assault/textures/pd2/content_updates/gage_pack_assault",
		name_id = "menu_content_gage_pack_assault",
		store = 320030
	}
	local jukebox = {
		date_id = "menu_content_jukebox_date",
		desc_id = "menu_content_jukebox_desc",
		id = "jukebox",
		image = "guis/textures/pd2/content_updates/jukebox",
		name_id = "menu_content_jukebox",
		webpage = "https://www.paydaythegame.com/static/payday2/bigfatmusicupdate/"
	}
	local hl_miami = {
		date_id = "menu_content_hl_miami_date",
		desc_id = "menu_content_hl_miami_desc",
		id = "hl_miami",
		image = "guis/dlcs/hl_miami/textures/pd2/content_updates/hl_miami",
		name_id = "menu_content_hl_miami",
		store = 323500
	}
	local crimefest = {
		date_id = "menu_content_crimefest_date",
		desc_id = "menu_content_crimefest_desc",
		id = "crimefest",
		image = "guis/textures/pd2/content_updates/crimefest",
		name_id = "menu_content_crimefest",
		webpage = "https://www.paydaythegame.com/static/payday2/crimefest/mrated.html"
	}
	local jowi = {
		date_id = "menu_content_jowi_date",
		desc_id = "menu_content_jowi_desc",
		id = "jowi",
		image = "guis/textures/pd2/content_updates/jowi",
		name_id = "menu_content_jowi",
		store = 330010
	}
	local hoxton_char = {
		date_id = "menu_content_hoxton_char_date",
		desc_id = "menu_content_hoxton_char_desc",
		id = "hoxton_char",
		image = "guis/textures/pd2/content_updates/hoxton_char",
		name_id = "menu_content_hoxton_char",
		store = 330490
	}
	local hoxton_job = {
		date_id = "menu_content_hoxton_job_date",
		desc_id = "menu_content_hoxton_job_desc",
		id = "hoxton_job",
		image = "guis/textures/pd2/content_updates/hoxton_job",
		name_id = "menu_content_hoxton_job",
		store = 330491
	}
	local halloween_2014 = {
		date_id = "menu_content_halloween_2014_date",
		desc_id = "menu_content_halloween_2014_desc",
		id = "halloween_2014",
		image = "guis/textures/pd2/content_updates/halloween_2014",
		name_id = "menu_content_halloween_2014",
		webpage = "https://www.paydaythegame.com/static/payday2/halloween/"
	}
	local gage_pack_historical = {
		date_id = "menu_content_gage_pack_historical_date",
		desc_id = "menu_content_gage_pack_historical_desc",
		id = "gage_pack_historical",
		image = "guis/dlcs/gage_pack_historical/textures/pd2/content_updates/gage_pack_historical",
		name_id = "menu_content_gage_pack_historical",
		store = 331900
	}
	local christmas_2014 = {
		date_id = "menu_content_christmas_2014_date",
		desc_id = "menu_content_christmas_2014_desc",
		id = "christmas_2014",
		image = "guis/dlcs/pines/textures/pd2/content_updates/christmas_2014",
		name_id = "menu_content_christmas_2014",
		webpage = "https://www.paydaythegame.com/payday2/updates/whitechristmas/"
	}
	local character_pack_clover = {
		date_id = "menu_content_character_pack_clover_date",
		desc_id = "menu_content_character_pack_clover_desc",
		id = "character_pack_clover",
		image = "guis/dlcs/character_pack_clover/textures/pd2/content_updates/character_pack_clover",
		name_id = "menu_content_character_pack_clover",
		store = 337661
	}
	local hope_diamond = {
		date_id = "menu_content_hope_diamond_date",
		desc_id = "menu_content_hope_diamond_desc",
		id = "hope_diamond",
		image = "guis/dlcs/character_pack_clover/textures/pd2/content_updates/hope_diamond",
		name_id = "menu_content_hope_diamond",
		store = 337660
	}
	local hw_boxing = {
		date_id = "menu_content_hw_boxing_date",
		desc_id = "menu_content_hw_boxing_desc",
		id = "hw_boxing",
		image = "guis/dlcs/pd2_hw_boxing/textures/pd2/content_updates/hw_boxing",
		name_id = "menu_content_hw_boxing",
		webpage = "https://www.paydaythegame.com/payday2/updates/happynewyear/"
	}
	local character_pack_dragan = {
		date_id = "menu_content_character_pack_dragan_date",
		desc_id = "menu_content_character_pack_dragan_desc",
		id = "character_pack_dragan",
		image = "guis/dlcs/character_pack_dragan/textures/pd2/content_updates/dragan",
		name_id = "menu_content_character_pack_dragan",
		store = 344140
	}
	local the_bomb = {
		date_id = "menu_content_the_bomb_date",
		desc_id = "menu_content_the_bomb_desc",
		id = "the_bomb",
		image = "guis/dlcs/the_bomb/textures/pd2/content_updates/the_bomb",
		name_id = "menu_content_the_bomb",
		store = 339480
	}
	local akm4_pack = {
		date_id = "menu_content_akm4_pack_date",
		desc_id = "menu_content_akm4_pack_desc",
		id = "akm4_pack",
		image = "guis/dlcs/dlc_akm4/textures/pd2/content_updates/akm4_pack",
		name_id = "menu_content_akm4_pack",
		store = 351890
	}
	local infamy_2_0 = {
		date_id = "menu_content_infamy_2_0_date",
		desc_id = "menu_content_infamy_2_0_desc",
		id = "infamy_2_0",
		image = "guis/dlcs/infamous/textures/pd2/content_updates/infamy_2_0",
		name_id = "menu_content_infamy_2_0",
		webpage = "https://www.paydaythegame.com/payday2/updates/infamy2/"
	}
	local overkill_pack = {
		date_id = "menu_content_overkill_pack_date",
		desc_id = "menu_content_overkill_pack_desc",
		id = "overkill_pack",
		image = "guis/dlcs/dlc_pack_overkill/textures/pd2/content_updates/overkill_pack",
		name_id = "menu_content_overkill_pack",
		store = 348090
	}
	local complete_overkill_pack = {
		date_id = "menu_content_complete_overkill_pack_date",
		desc_id = "menu_content_complete_overkill_pack_desc",
		id = "complete_overkill_pack",
		image = "guis/dlcs/dlc_pack_overkill/textures/pd2/content_updates/complete_overkill_pack",
		name_id = "menu_content_complete_overkill_pack",
		webpage = "https://www.paydaythegame.com/payday2/updates/thehypetrain/"
	}
	local hlm2 = {
		date_id = "menu_content_hlm2_date",
		desc_id = "menu_content_hlm2_desc",
		id = "hlm2",
		image = "guis/dlcs/hlm2/textures/pd2/content_updates/hlm2",
		name_id = "menu_content_hlm2",
		store = 274170
	}
	local hlm2_deluxe = {
		date_id = "menu_content_hlm2_deluxe_date",
		desc_id = "menu_content_hlm2_deluxe_desc",
		id = "hlm2_deluxe",
		image = "guis/dlcs/hlm2/textures/pd2/content_updates/hlm2_deluxe",
		name_id = "menu_content_hlm2_deluxe",
		store = 274170
	}
	local bbq = {
		date_id = "menu_content_bbq_date",
		desc_id = "menu_content_bbq_desc",
		id = "bbq",
		image = "guis/textures/pd2/content_updates/bbq",
		name_id = "menu_content_bbq",
		store = 337661,
		webpage = "https://www.paydaythegame.com/payday2/updates/bbq/"
	}
	local springbreak = {
		date_id = "menu_content_springbreak_date",
		desc_id = "menu_content_springbreak_desc",
		id = "springbreak",
		image = "guis/textures/pd2/content_updates/springbreak",
		name_id = "menu_content_springbreak",
		webpage = "https://www.paydaythegame.com/payday2/updates/springbreak/"
	}
	local bbq = {
		date_id = "menu_content_bbq_date",
		desc_id = "menu_content_bbq_desc",
		id = "bbq",
		image = "guis/dlcs/bbq/textures/pd2/content_updates/bbq",
		name_id = "menu_content_bbq",
		store = 358150
	}
	local fpsanimation = {
		date_id = "menu_content_fpsanimation_date",
		desc_id = "menu_content_fpsanimation_desc",
		id = "fpsanimation",
		image = "guis/textures/pd2/content_updates/fpsanimation",
		name_id = "menu_content_fpsanimation",
		webpage = "https://www.paydaythegame.com/payday2/updates/animations-update/"
	}
	local springcleaning = {
		date_id = "menu_content_springcleaning_date",
		desc_id = "menu_content_springcleaning_desc",
		id = "springcleaning",
		image = "guis/textures/pd2/content_updates/springcleaning",
		name_id = "menu_content_springcleaning",
		webpage = "https://steamcommunity.com/games/218620/announcements/detail/177107167839449807"
	}
	local west = {
		date_id = "menu_content_west_date",
		desc_id = "menu_content_west_desc",
		id = "west",
		image = "guis/dlcs/west/textures/pd2/content_updates/west",
		name_id = "menu_content_west",
		store = 349830
	}
	local bsides = {
		date_id = "menu_content_bsides_date",
		desc_id = "menu_content_bsides_desc",
		id = "bsides",
		image = "guis/textures/pd2/content_updates/bsides",
		name_id = "menu_content_bsides",
		store = 368870
	}
	local shoutout = {
		date_id = "menu_content_shoutout_date",
		desc_id = "menu_content_shoutout_desc",
		id = "shoutout",
		image = "guis/textures/pd2/content_updates/shoutout",
		name_id = "menu_content_shoutout",
		webpage = "https://www.paydaythegame.com/payday2/updates/meltdown/"
	}
	local arena = {
		date_id = "menu_content_arena_date",
		desc_id = "menu_content_arena_desc",
		id = "arena",
		image = "guis/dlcs/dlc_arena/textures/pd2/content_updates/arena",
		name_id = "menu_content_arena",
		store = 366660
	}
	local character_pack_sokol = {
		date_id = "menu_content_character_pack_sokol_date",
		desc_id = "menu_content_character_pack_sokol_desc",
		id = "character_pack_sokol",
		image = "guis/dlcs/character_pack_sokol/textures/pd2/content_updates/sokol",
		name_id = "menu_content_character_pack_sokol",
		store = 374301
	}
	local kenaz = {
		date_id = "menu_content_kenaz_date",
		desc_id = "menu_content_kenaz_desc",
		id = "kenaz",
		image = "guis/dlcs/kenaz/textures/pd2/content_updates/kenaz",
		name_id = "menu_content_kenaz",
		store = 374300
	}
	local turtles = {
		date_id = "menu_content_turtles_date",
		desc_id = "menu_content_turtles_desc",
		id = "turtles",
		image = "guis/dlcs/turtles/textures/pd2/content_updates/turtles",
		name_id = "menu_content_turtles",
		store = 384021
	}
	local dragon = {
		date_id = "menu_content_dragon_date",
		desc_id = "menu_content_dragon_desc",
		id = "dragon",
		image = "guis/dlcs/dragon/textures/pd2/content_updates/dragon",
		name_id = "menu_content_dragon",
		store = 384020
	}
	local steel = {
		date_id = "menu_content_steel_date",
		desc_id = "menu_content_steel_desc",
		id = "steel",
		image = "guis/dlcs/steel/textures/pd2/content_updates/steel",
		name_id = "menu_content_steel",
		store = 401650
	}
	local gordon = {
		date_id = "menu_content_gordon_date",
		desc_id = "menu_content_gordon_desc",
		id = "gordon",
		image = "guis/dlcs/gordon/textures/pd2/content_updates/gordon",
		name_id = "menu_content_gordon",
		webpage = "https://www.paydaythegame.com/payday2/updates/fbifiles/"
	}
	local rip = {
		date_id = "menu_content_rip_date",
		desc_id = "menu_content_rip_desc",
		id = "rip",
		image = "guis/dlcs/rip/textures/pd2/content_updates/rip",
		name_id = "menu_content_rip",
		webpage = "https://www.paydaythegame.com/payday2/updates/pointbreak/"
	}
	local berry = {
		date_id = "menu_content_berry_date",
		desc_id = "menu_content_berry_desc",
		id = "berry",
		image = "guis/dlcs/berry/textures/pd2/content_updates/berry",
		name_id = "menu_content_berry",
		store = 422400
	}
	local cane = {
		date_id = "menu_content_cane_date",
		desc_id = "menu_content_cane_desc",
		id = "cane",
		image = "guis/textures/pd2/content_updates/xmas2015",
		name_id = "menu_content_cane",
		webpage = "https://www.paydaythegame.com/payday2/updates/christmas2015/"
	}
	local peta = {
		date_id = "menu_content_peta_date",
		desc_id = "menu_content_peta_desc",
		id = "peta",
		image = "guis/dlcs/peta/textures/pd2/content_updates/peta",
		name_id = "menu_content_peta",
		store = 433730
	}
	local pal = {
		date_id = "menu_content_pal_date",
		desc_id = "menu_content_pal_desc",
		id = "pal",
		image = "guis/dlcs/lupus/textures/pd2/content_updates/lupus",
		name_id = "menu_content_pal",
		store = 441600
	}
	local coco = {
		date_id = "menu_content_coco_date",
		desc_id = "menu_content_coco_desc",
		id = "coco",
		image = "guis/dlcs/coco/textures/pd2/content_updates/coco",
		name_id = "menu_content_coco",
		webpage = "https://www.paydaythegame.com/payday2/updates/hardcorehenry/"
	}
	local mad = {
		date_id = "menu_content_mad_date",
		desc_id = "menu_content_mad_desc",
		id = "mad",
		image = "guis/dlcs/mad/textures/pd2/content_updates/mad",
		name_id = "menu_content_mad",
		webpage = "https://www.paydaythegame.com/payday2/updates/hardcorehenry/"
	}
	local opera = {
		date_id = "menu_content_opera_date",
		desc_id = "menu_content_opera_desc",
		id = "opera",
		image = "guis/dlcs/opera/textures/pd2/content_updates/opera",
		name_id = "menu_content_opera",
		store = 468410
	}
	local update100 = {
		date_id = "menu_content_update100_date",
		desc_id = "menu_content_update100_desc",
		id = "update100",
		image = "guis/textures/pd2/content_updates/update100",
		name_id = "menu_content_update100",
		webpage = "https://www.paydaythegame.com/payday2/updates/update100/"
	}
	local tutorial = {
		date_id = "menu_content_tutorial_date",
		desc_id = "menu_content_tutorial_desc",
		id = "tutorial",
		image = "guis/textures/pd2/content_updates/tutorial",
		name_id = "menu_content_tutorial",
		webpage = "https://steamcommunity.com/app/218620/allnews/"
	}
	local wild = {
		date_id = "menu_content_wild_date",
		desc_id = "menu_content_wild_desc",
		id = "wild",
		image = "guis/dlcs/wild/textures/pd2/content_updates/wild",
		name_id = "menu_content_wild",
		store = 450660
	}
	local born = {
		date_id = "menu_content_born_date",
		desc_id = "menu_content_born_desc",
		id = "born",
		image = "guis/dlcs/born/textures/pd2/content_updates/born",
		name_id = "menu_content_born",
		store = 487210
	}
	local pim = {
		date_id = "menu_content_pim_date",
		desc_id = "menu_content_pim_desc",
		id = "pim",
		image = "guis/dlcs/pim/textures/pd2/content_updates/pim",
		name_id = "menu_content_pim",
		store = 545100
	}
	local tango = {
		date_id = "menu_content_tango_date",
		desc_id = "menu_content_tango_desc",
		id = "tango",
		image = "guis/dlcs/tango/textures/pd2/content_updates/tango",
		name_id = "menu_content_tango",
		store = 487210
	}

	self.content_updates = {
		choice_id = "menu_content_updates_previous",
		num_items = 6,
		title_id = "menu_content_updates"
	}
	self.store_page = "https://store.steampowered.com/app/218620"

	if SystemInfo:platform() == Idstring("WIN32") then
		self.content_updates.item_list = {
			soundtrack,
			diamond_store,
			birthday,
			halloween,
			armored_transport,
			gage_pack,
			charliesierra,
			christmas,
			infamy,
			gage_pack_lmg,
			deathwish,
			election_day,
			gage_pack_jobs,
			gage_pack_snp,
			kosugi,
			big_bank,
			gage_pack_shotgun,
			gage_pack_assault,
			jukebox,
			hl_miami,
			crimefest,
			jowi,
			hoxton_char,
			hoxton_job,
			halloween_2014,
			gage_pack_historical,
			christmas_2014,
			hope_diamond,
			character_pack_clover,
			hw_boxing,
			the_bomb,
			character_pack_dragan,
			akm4_pack,
			infamy_2_0,
			overkill_pack,
			complete_overkill_pack,
			hlm2,
			hlm2_deluxe,
			springbreak,
			bbq,
			west,
			springcleaning,
			bsides,
			shoutout,
			arena,
			kenaz,
			character_pack_sokol,
			turtles,
			dragon,
			steel,
			gordon,
			berry,
			rip,
			cane,
			peta,
			pal,
			coco,
			mad,
			opera,
			update100,
			tutorial,
			wild,
			born,
			pim,
			tango
		}
	elseif SystemInfo:platform() == Idstring("PS3") then
		self.content_updates.item_list = {
			armored_transport,
			gage_pack,
			gage_pack_lmg
		}
	elseif SystemInfo:platform() == Idstring("PS4") then
		self.content_updates.item_list = {
			armored_transport
		}
	elseif SystemInfo:platform() == Idstring("XB1") then
		self.content_updates.item_list = {
			armored_transport
		}
	elseif SystemInfo:platform() == Idstring("X360") then
		self.content_updates.item_list = {}
	end

	self.fav_videos = {
		db_url = "https://www.paydaythegame.com/static/payday2/birthday/",
		num_items = 3,
		title_id = "menu_fav_videos",
		button = {
			text_id = "menu_fav_video_homepage",
			url = "https://www.paydaythegame.com/static/payday2/birthday/"
		},
		item_list = {
			{
				id = "fav3",
				image = "guis/textures/pd2/fav_video3",
				use_db = true
			},
			{
				id = "fav2",
				image = "guis/textures/pd2/fav_video2",
				use_db = true
			},
			{
				id = "fav1",
				image = "guis/textures/pd2/fav_video1",
				use_db = true
			}
		}
	}
	self.masks_sort_order = {
		"aviator",
		"plague",
		"welder",
		"smoker",
		"ghost",
		"skullhard",
		"skullveryhard",
		"skulloverkill",
		"skulloverkillplus"
	}
	self.blackscreen_risk_textures = {
		easy_wish = "guis/textures/pd2/risklevel_deathwish_easywish_blackscreen",
		overkill_290 = "guis/textures/pd2/risklevel_deathwish_blackscreen",
		sm_wish = "guis/textures/pd2/risklevel_deathwish_sm_blackscreen"
	}
	self.suspicion_to_visibility = {}
	self.suspicion_to_visibility[1] = {}
	self.suspicion_to_visibility[1].name_id = "bm_menu_concealment_low"
	self.suspicion_to_visibility[1].max_index = 9
	self.suspicion_to_visibility[2] = {}
	self.suspicion_to_visibility[2].name_id = "bm_menu_concealment_medium"
	self.suspicion_to_visibility[2].max_index = 20
	self.suspicion_to_visibility[3] = {}
	self.suspicion_to_visibility[3].name_id = "bm_menu_concealment_high"
	self.suspicion_to_visibility[3].max_index = 30
	self.mouse_pointer = {}
	self.mouse_pointer.controller = {}
	self.mouse_pointer.controller.acceleration_speed = 4
	self.mouse_pointer.controller.max_acceleration = 3
	self.mouse_pointer.controller.mouse_pointer_speed = 125

	local min_amount_masks = 320

	self.MASK_ROWS_PER_PAGE = 4
	self.MASK_COLUMNS_PER_PAGE = 4
	self.MAX_MASK_PAGES = math.ceil(min_amount_masks / (self.MASK_ROWS_PER_PAGE * self.MASK_COLUMNS_PER_PAGE))
	self.MAX_MASK_SLOTS = self.MAX_MASK_PAGES * self.MASK_ROWS_PER_PAGE * self.MASK_COLUMNS_PER_PAGE

	local min_amount_weapons = 320

	self.WEAPON_ROWS_PER_PAGE = 4
	self.WEAPON_COLUMNS_PER_PAGE = 4
	self.MAX_WEAPON_PAGES = math.ceil(min_amount_weapons / (self.WEAPON_ROWS_PER_PAGE * self.WEAPON_COLUMNS_PER_PAGE))
	self.MAX_WEAPON_SLOTS = self.MAX_WEAPON_PAGES * self.WEAPON_ROWS_PER_PAGE * self.WEAPON_COLUMNS_PER_PAGE
	self.fbi_files_webpage = "https://fbi.paydaythegame.com/"
	self.crimefest_challenges_webpage = "https://www.paydaythegame.com/payday2/updates/roadtocrimefest/"
	self.sbz_account_webpage = "https://www.paydaythegame.com/account/register/"
	self.privacy_webpage = "https://pd2.link/PrivacyPolicy"
	self.license_webpage = "https://pd2.link/TermsOfService"
	self.crime_net = {}
	self.crime_net.controller = {}
	self.crime_net.controller.snap_distance = 50
	self.crime_net.controller.snap_speed = 5
	self.crime_net.job_vars = {}
	self.crime_net.job_vars.max_active_jobs = 10
	self.crime_net.job_vars.active_job_time = 25
	self.crime_net.job_vars.new_job_min_time = 1.5
	self.crime_net.job_vars.new_job_max_time = 3.5
	self.crime_net.job_vars.refresh_servers_time = SystemInfo:platform() == Idstring("PS4") and 10 or 5
	self.crime_net.job_vars.total_active_jobs = 40
	self.crime_net.job_vars.max_active_server_jobs = 100
	self.crime_net.debug_options = {}
	self.crime_net.debug_options.regions = false
	self.crime_net.debug_options.mass_spawn = false
	self.crime_net.debug_options.mass_spawn_limit = 100
	self.crime_net.debug_options.mass_spawn_timer = 0.04
	self.rename_max_letters = 20
	self.rename_skill_set_max_letters = 15
	self.mod_preview_min_fov = -19
	self.mod_preview_max_fov = 3
	self.stats_present_multiplier = 10
	self.armor_damage_shake_base = 1.1
	self.buy_weapon_category_aliases = {
		bow = "wpn_special",
		crossbow = "wpn_special",
		dartgun = "wpn_special",
		flamethrower = "wpn_special",
		grenade_launcher = "wpn_special",
		minigun = "wpn_special",
		saw = "wpn_special"
	}
	self.buy_weapon_categories = {}
	self.buy_weapon_categories.primaries = {
		{
			"assault_rifle"
		},
		{
			"shotgun"
		},
		{
			"lmg"
		},
		{
			"snp"
		},
		{
			"akimbo",
			"pistol"
		},
		{
			"akimbo",
			"smg"
		},
		{
			"akimbo",
			"shotgun"
		},
		{
			"wpn_special"
		}
	}
	self.buy_weapon_categories.secondaries = {
		{
			"pistol"
		},
		{
			"smg"
		},
		{
			"wpn_special"
		},
		{
			"shotgun"
		},
		{
			"snp"
		}
	}
	self.LONGEST_CHAR_NAME = "JOHN WICK"
	self.crime_net.regions = {
		{
			text = {
				title_id = "cn_menu_georgetown_title",
				x = 348,
				y = 310
			},
			{
				-10,
				270,
				293,
				252,
				271,
				337,
				341,
				372,
				372,
				475,
				475,
				491,
				491,
				504,
				503,
				524,
				536,
				536,
				542,
				542,
				555,
				555,
				598,
				598,
				638,
				638,
				657,
				688,
				686,
				691,
				701,
				698,
				687,
				650,
				634,
				602,
				609,
				580,
				576,
				576,
				567,
				559,
				558,
				542,
				543,
				512,
				512,
				503,
				381,
				377,
				348,
				315,
				315,
				290,
				290,
				259,
				259,
				237,
				237,
				261,
				261,
				257,
				224,
				221,
				187,
				182,
				163,
				163,
				147,
				147,
				133,
				133,
				102,
				102,
				-10
			},
			{
				-10,
				-10,
				28,
				73,
				122,
				123,
				132,
				141,
				145,
				172,
				216,
				215,
				180,
				179,
				229,
				228,
				244,
				253,
				253,
				248,
				247,
				241,
				241,
				219,
				219,
				209,
				208,
				234,
				241,
				242,
				262,
				270,
				277,
				276,
				279,
				296,
				300,
				362,
				361,
				408,
				416,
				417,
				430,
				430,
				477,
				477,
				514,
				523,
				523,
				514,
				514,
				501,
				493,
				484,
				469,
				469,
				465,
				465,
				439,
				440,
				434,
				430,
				429,
				433,
				433,
				438,
				438,
				423,
				423,
				435,
				435,
				423,
				423,
				412,
				412
			},
			closed = true
		},
		{
			{
				340,
				350,
				350,
				373,
				373,
				368,
				368,
				358,
				358,
				351,
				351,
				340
			},
			{
				103,
				103,
				106,
				106,
				116,
				116,
				123,
				123,
				116,
				116,
				122,
				121
			},
			closed = true
		},
		{
			{
				564,
				576,
				576,
				564
			},
			{
				189,
				189,
				208,
				208
			},
			closed = true
		},
		{
			{
				147,
				168,
				164,
				144
			},
			{
				444,
				451,
				463,
				457
			},
			closed = true
		},
		{
			{
				168,
				185,
				181,
				166
			},
			{
				463,
				468,
				478,
				473
			},
			closed = true
		},
		{
			{
				371,
				417,
				417,
				414,
				371
			},
			{
				534,
				534,
				554,
				557,
				538
			},
			closed = true
		},
		{
			{
				422,
				509,
				509,
				500,
				500,
				477,
				477,
				466,
				457,
				457,
				447,
				422
			},
			{
				534,
				534,
				548,
				559,
				585,
				585,
				575,
				581,
				581,
				573,
				573,
				557
			},
			closed = true
		},
		{
			text = {
				title_id = "cn_menu_westend_title",
				x = 789,
				y = 418
			},
			{
				519,
				530,
				517,
				528,
				522,
				540,
				538,
				544,
				549,
				561,
				565,
				571,
				566,
				574,
				579,
				609,
				613,
				630,
				628,
				644,
				641,
				662,
				665,
				703,
				696,
				721,
				721,
				756,
				756,
				767,
				767,
				736,
				709,
				701,
				651,
				651,
				640,
				623,
				634,
				608,
				591,
				581,
				599,
				599,
				551,
				541,
				598,
				598,
				640,
				735,
				735,
				751,
				760,
				766,
				771,
				831,
				831,
				882,
				882,
				922,
				922,
				976,
				976,
				1031,
				1036,
				1019,
				1020,
				994,
				1063,
				1063,
				1068,
				1098,
				1104,
				1113,
				1123,
				1132,
				1175,
				1175,
				1184,
				1184,
				1171,
				1171,
				1161,
				1161,
				1169,
				1169,
				1185,
				1185,
				1168,
				1168,
				1175,
				1175,
				1193,
				1193,
				1175,
				1175,
				1170,
				1170,
				1190,
				1190,
				1171,
				1171
			},
			{
				-10,
				13,
				23,
				34,
				42,
				57,
				61,
				68,
				63,
				75,
				69,
				74,
				79,
				87,
				82,
				113,
				110,
				128,
				131,
				144,
				148,
				169,
				165,
				199,
				207,
				226,
				239,
				258,
				276,
				284,
				305,
				341,
				340,
				331,
				331,
				343,
				338,
				364,
				369,
				428,
				428,
				452,
				460,
				514,
				514,
				540,
				540,
				586,
				636,
				636,
				552,
				549,
				545,
				539,
				529,
				529,
				533,
				533,
				530,
				530,
				537,
				537,
				530,
				530,
				521,
				483,
				480,
				416,
				382,
				345,
				340,
				353,
				348,
				346,
				346,
				350,
				328,
				297,
				297,
				269,
				269,
				247,
				247,
				222,
				222,
				182,
				182,
				170,
				170,
				116,
				116,
				111,
				111,
				85,
				85,
				68,
				68,
				60,
				60,
				31,
				31,
				-10
			},
			closed = true
		},
		{
			text = {
				title_id = "cn_menu_foggy_bottom_title",
				x = 858,
				y = 704
			},
			{
				1031,
				1052,
				1039,
				1039,
				1045,
				1045,
				1039,
				1039,
				1000,
				990,
				972,
				972,
				927,
				908,
				901,
				882,
				882,
				722,
				693,
				693,
				686,
				685,
				676,
				676,
				688,
				693,
				730,
				730,
				679,
				670,
				664,
				664,
				667,
				667,
				673,
				669,
				674,
				652,
				652
			},
			{
				530,
				574,
				575,
				616,
				616,
				667,
				667,
				893,
				893,
				883,
				883,
				855,
				855,
				842,
				853,
				853,
				906,
				906,
				874,
				816,
				816,
				804,
				804,
				785,
				785,
				774,
				774,
				759,
				759,
				754,
				745,
				734,
				726,
				691,
				686,
				683,
				677,
				657,
				636
			},
			closed = false
		},
		{
			{
				512,
				529,
				516,
				519,
				513,
				495,
				498,
				501,
				504,
				500
			},
			{
				597,
				616,
				627,
				630,
				634,
				609,
				607,
				611,
				609,
				604
			},
			closed = true
		},
		{
			{
				559,
				569,
				571,
				639,
				631,
				647,
				616,
				616,
				610,
				610,
				601,
				598,
				589,
				580,
				569,
				561,
				557,
				557,
				584,
				584,
				580,
				591,
				589,
				580,
				570,
				564,
				568,
				563,
				558,
				561,
				552,
				546,
				550,
				549
			},
			{
				601,
				611,
				609,
				666,
				679,
				692,
				732,
				792,
				792,
				814,
				814,
				822,
				831,
				833,
				831,
				825,
				815,
				721,
				721,
				710,
				706,
				697,
				688,
				686,
				693,
				683,
				676,
				658,
				650,
				646,
				619,
				614,
				610,
				608
			},
			closed = true
		},
		{
			text = {
				title_id = "cn_menu_shaw_title",
				x = 1426,
				y = 310
			},
			{
				2047,
				1972,
				1879,
				1879,
				1735,
				1677,
				1677,
				1683,
				1625,
				1619,
				1624,
				1620,
				1641,
				1641,
				1572,
				1571,
				1558,
				1558,
				1547,
				1547,
				1523,
				1523,
				1462,
				1462,
				1450,
				1450,
				1422,
				1402,
				1402,
				1356,
				1356,
				1316,
				1316,
				1308,
				1308,
				1279,
				1279,
				1245,
				1245,
				1200,
				1200,
				1039
			},
			{
				278,
				311,
				311,
				352,
				416,
				416,
				429,
				440,
				468,
				461,
				458,
				451,
				442,
				420,
				420,
				470,
				470,
				467,
				467,
				469,
				469,
				518,
				518,
				532,
				532,
				547,
				560,
				560,
				570,
				569,
				591,
				610,
				604,
				604,
				614,
				628,
				614,
				614,
				644,
				665,
				608,
				608
			},
			closed = false
		},
		{
			text = {
				title_id = "cn_menu_downtown_title",
				x = 1469,
				y = 720
			},
			{
				1200,
				1206,
				1206,
				1201,
				1201,
				1251,
				1251,
				1201,
				1201,
				1205,
				1254,
				1254,
				1285,
				1285,
				1308,
				1308,
				1372,
				1372,
				1388,
				1388,
				1411,
				1411,
				1462,
				1462,
				1523,
				1523,
				1538,
				1538,
				1528,
				1527,
				1709,
				1709,
				1760,
				1880,
				1880,
				2047
			},
			{
				665,
				669,
				688,
				688,
				741,
				760,
				787,
				787,
				898,
				902,
				902,
				896,
				896,
				902,
				902,
				896,
				896,
				903,
				903,
				896,
				896,
				898,
				898,
				889,
				889,
				901,
				901,
				920,
				920,
				953,
				953,
				902,
				902,
				798,
				609,
				609
			},
			closed = false
		}
	}
	self.crime_net.map_start_positions = {
		{
			max_level = 10,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 20,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 30,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 40,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 50,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 60,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 70,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 80,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 90,
			x = 1080,
			y = 512,
			zoom = 4
		},
		{
			max_level = 100,
			x = 1080,
			y = 512,
			zoom = 4
		}
	}
	self.crime_net.special_contracts = {
		{
			desc_id = "menu_cn_gage_assignment_desc",
			dlc = "gage_pack_jobs",
			icon = "guis/textures/pd2/crimenet_marker_gage",
			id = "gage_assignment",
			menu_node = "crimenet_gage_assignment",
			name_id = "menu_cn_gage_assignment",
			x = 425,
			y = 910
		},
		{
			desc_id = "menu_cn_contact_info_desc",
			icon = "guis/textures/pd2/crimenet_marker_codex",
			id = "contact_info",
			menu_node = "crimenet_contact_info",
			name_id = "menu_cn_contact_info",
			x = 912,
			y = 905
		},
		{
			desc_id = "menu_cn_casino_desc",
			icon = "guis/textures/pd2/crimenet_casino",
			id = "casino",
			menu_node = "crimenet_contract_casino",
			name_id = "menu_cn_casino",
			pulse = false,
			unlock = "unlock_level",
			x = 385,
			y = 775,
			pulse_color = Color(204, 255, 209, 32) / 255
		},
		{
			desc_id = "menu_cn_premium_buy_desc",
			icon = "guis/textures/pd2/crimenet_marker_buy",
			id = "premium_buy",
			menu_node = "contract_broker",
			name_id = "menu_cn_premium_buy",
			x = 420,
			y = 846
		},
		{
			desc_id = "menu_cn_short_desc",
			icon = "guis/textures/pd2/crimenet_tutorial",
			id = "short",
			menu_node = "crimenet_contract_short",
			name_id = "menu_cn_short",
			pulse = true,
			pulse_level = 10,
			x = 332,
			y = 626,
			pulse_color = Color(204, 255, 209, 32) / 255
		},
		{
			desc_id = "menu_mutators_help",
			icon = "guis/textures/pd2/crimenet_marker_mutators",
			id = "mutators",
			menu_node = "mutators",
			name_id = "menu_mutators",
			pulse = true,
			pulse_level = 10,
			x = 675,
			y = 910,
			pulse_color = Color(255, 255, 0, 255) / 255,
			mutators_color = Color(255, 255, 0, 255) / 255
		},
		{
			desc_id = "cn_crime_spree_help_start",
			icon = "guis/textures/pd2/crimenet_marker_crimespree",
			id = "crime_spree",
			menu_node = "crimenet_crime_spree_contract_host",
			mp_only = true,
			name_id = "cn_crime_spree",
			no_session_only = true,
			pulse = true,
			pulse_level = 10,
			x = 675,
			y = 810,
			pulse_color = Color(255, 255, 255, 0) / 255
		},
		{
			desc_id = "cn_crime_spree_help_start",
			icon = "guis/textures/pd2/crimenet_marker_crimespree",
			id = "crime_spree",
			menu_node = "crimenet_crime_spree_contract_singleplayer",
			name_id = "cn_crime_spree",
			pulse = true,
			pulse_level = 10,
			sp_only = true,
			x = 675,
			y = 810,
			pulse_color = Color(255, 255, 255, 0) / 255
		}
	}

	if SystemInfo:platform() == Idstring("WIN32") then
		table.insert(self.crime_net.special_contracts, {
			desc_id = "menu_cn_challenge_desc",
			icon = "guis/textures/pd2/crimenet_challenge",
			id = "challenge",
			menu_node = "crimenet_contract_challenge",
			name_id = "menu_cn_challenge",
			x = 362,
			y = 696
		})
	end

	self.crime_net.sidebar = {
		{
			callback = "clbk_toggle_sidebar",
			icon = "sidebar_expand",
			name_id = "menu_cn_shortcuts",
			show_name_while_collapsed = false
		},
		{
			btn_macro = "menu_toggle_filters",
			callback = "clbk_crimenet_filters",
			icon = "sidebar_filters",
			name_id = "menu_cn_filters_sidebar",
			visible_callback = "clbk_visible_multiplayer"
		},
		{
			callback = "clbk_search_lobby_code",
			icon = "sidebar_lobby_search",
			id = "search_lobby_code",
			name_id = "menu_cn_search_lobby_code",
			visible_callback = "clbk_visible_multiplayer_epic_mm"
		},
		{
			item_class = "CrimeNetSidebarSeparator"
		},
		{
			callback = "clbk_the_basics",
			icon = "sidebar_basics",
			item_class = "CrimeNetSidebarTutorialHeistsItem",
			name_id = "menu_cn_short",
			visible_callback = "clbk_visible_not_in_lobby"
		},
		{
			callback = "clbk_open_quickplay",
			icon = "sidebar_quickplay",
			name_id = "menu_cn_quickplay",
			visible_callback = "clbk_visible_multiplayer"
		},
		{
			callback = "clbk_safehouse",
			icon = "sidebar_safehouse",
			id = "safehouse",
			item_class = "CrimeNetSidebarSafehouseItem",
			name_id = "menu_cn_chill"
		},
		{
			callback = "clbk_contract_broker",
			icon = "sidebar_broker",
			name_id = "menu_cn_premium_buy"
		},
		{
			item_class = "CrimeNetSidebarSeparator"
		},
		{
			callback = "clbk_side_jobs",
			icon = "sidebar_side_jobs",
			name_id = "menu_cn_side_jobs"
		},
		{
			callback = "clbk_gage_courier",
			icon = "sidebar_gage",
			name_id = "menu_cn_gage_assignment"
		},
		{
			callback = "clbk_offshore_payday",
			icon = "sidebar_casino",
			name_id = "menu_cn_casino"
		},
		{
			callback = "clbk_contact_database",
			icon = "sidebar_codex",
			name_id = "menu_cn_contact_info"
		},
		{
			item_class = "CrimeNetSidebarSeparator"
		},
		{
			callback = "clbk_mutators",
			icon = "sidebar_mutators",
			id = "mutators",
			item_class = "CrimeNetSidebarMutatorsItem",
			name_id = "menu_mutators"
		},
		{
			callback = "clbk_crime_spree",
			icon = "sidebar_crimespree",
			id = "crime_spree",
			item_class = "CrimeNetSidebarCrimeSpreeItem",
			name_id = "cn_crime_spree",
			visible_callback = "clbk_visible_crime_spree"
		},
		{
			callback = "clbk_skirmish",
			icon = "sidebar_skirmish",
			id = "skirmish",
			item_class = "CrimeNetSidebarSkirmishItem",
			name_id = "menu_cn_skirmish",
			visible_callback = "clbk_visible_skirmish"
		},
		{
			item_class = "CrimeNetSidebarSeparator",
			name_id = "menu_cn_leakedrecording_separator"
		},
		{
			callback = "clbk_leakedrecording",
			icon = "sidebar_leakedrecording",
			id = "leakedrecording",
			item_class = "CrimeNetSidebarLeakedRecordingItem",
			name_id = "menu_cn_leakedrecording",
			visible_callback = "clbk_visible_leakedrecording"
		}
	}
	self.crime_net.codex = {
		{
			{
				{
					desc_id = "heist_contact_bain_description",
					post_event = "pln_contact_bain",
					video = "bain"
				},
				id = "bain",
				name_id = "heist_contact_bain"
			},
			{
				{
					desc_id = "heist_contact_vlad_description",
					post_event = "vld_quote_set_a",
					videos = {
						"vlad1",
						"vlad2",
						"vlad3"
					}
				},
				id = "vlad",
				name_id = "heist_contact_vlad"
			},
			{
				{
					desc_id = "heist_contact_hector_description",
					post_event = "hct_quote_set_a",
					videos = {
						"hector1",
						"hector2",
						"hector3"
					}
				},
				id = "hector",
				name_id = "heist_contact_hector"
			},
			{
				{
					desc_id = "heist_contact_the_elephant_description",
					post_event = "elp_quote_set_a",
					videos = {
						"the_elephant1",
						"the_elephant2",
						"the_elephant3"
					}
				},
				id = "the_elephant",
				name_id = "heist_contact_the_elephant"
			},
			{
				{
					desc_id = "heist_contact_gage_description",
					post_event = "pln_contact_gage",
					videos = {
						"gage1",
						"gage2",
						"gage3"
					}
				},
				id = "gage",
				name_id = "heist_contact_gage"
			},
			{
				{
					desc_id = "heist_contact_the_dentist_description",
					post_event = "dentist_quote_set_a",
					videos = {
						"the_dentist1",
						"the_dentist2",
						"the_dentist3",
						"the_dentist4",
						"the_dentist5",
						"the_dentist6"
					}
				},
				id = "the_dentist",
				name_id = "heist_contact_the_dentist"
			},
			{
				{
					desc_id = "heist_contact_the_butcher_description",
					post_event = "butcher_quote_set_a",
					videos = {
						"the_butcher1",
						"the_butcher2",
						"the_butcher3"
					}
				},
				id = "the_butcher",
				name_id = "heist_contact_the_butcher"
			},
			{
				{
					desc_id = "heist_contact_locke_description",
					post_event = "loc_quote_set_a",
					videos = {
						"locke1"
					}
				},
				id = "locke",
				name_id = "heist_contact_locke"
			},
			{
				{
					desc_id = "menu_jimmy_desc_codex",
					post_event = "pln_contact_jimmy",
					videos = {
						"jimmy1"
					}
				},
				dlc = "coco",
				id = "jimmy_contact",
				name_id = "menu_jimmy"
			},
			{
				{
					desc_id = "menu_continental_desc_codex",
					post_event = "continental_quote_set_a",
					videos = {
						"continental1"
					}
				},
				dlc = "spa",
				id = "continental_contact",
				name_id = "menu_continental"
			},
			{
				{
					desc_id = "heist_contact_jiufeng_description",
					post_event = "jfe_quote_set_a",
					videos = {
						"jiufeng1"
					}
				},
				id = "jiufeng",
				name_id = "heist_contact_jiufeng"
			},
			{
				{
					desc_id = "heist_contact_shayu_description",
					post_event = "sha_quote_set_a",
					videos = {
						"shayu1"
					}
				},
				id = "shayu",
				name_id = "heist_contact_shayu"
			},
			{
				{
					desc_id = "heist_contact_mcshay_description",
					post_event = "gemma_quote_set_a",
					videos = {
						"mcshay1"
					}
				},
				id = "mcshay",
				name_id = "heist_contact_mcshay"
			},
			{
				{
					desc_id = "heist_contact_blaine_description",
					post_event = "keegan_quote_set_a",
					videos = {
						"blaine1"
					}
				},
				id = "blaine",
				name_id = "heist_contact_blaine"
			},
			id = "contacts",
			name_id = "menu_contacts"
		},
		{
			{
				{
					desc_id = "russian_desc_codex",
					post_event = "pln_contact_dallas",
					videos = {
						"dallas1",
						"dallas2",
						"dallas3"
					}
				},
				id = "dallas",
				name_id = "menu_russian"
			},
			{
				{
					desc_id = "german_desc_codex",
					post_event = "pln_contact_wolf",
					videos = {
						"wolf1",
						"wolf2"
					}
				},
				id = "wolf",
				name_id = "menu_german"
			},
			{
				{
					desc_id = "spanish_desc_codex",
					post_event = "pln_contact_chains",
					videos = {
						"chains1",
						"chains2",
						"chains3"
					}
				},
				id = "chains",
				name_id = "menu_spanish"
			},
			{
				{
					desc_id = "old_hoxton_desc_codex",
					post_event = "pln_contact_hoxton",
					videos = {
						"old_hoxton1",
						"old_hoxton2"
					}
				},
				id = "old_hoxton",
				name_id = "menu_old_hoxton"
			},
			{
				{
					desc_id = "jowi_desc_codex",
					post_event = "pln_contact_wick",
					videos = {
						"jowi1",
						"jowi2",
						"jowi3",
						"jowi4"
					}
				},
				dlc = "john_wick_character",
				id = "jowi",
				name_id = "menu_jowi"
			},
			{
				{
					desc_id = "american_desc_codex",
					post_event = "pln_contact_houston",
					videos = {
						"hoxton1",
						"hoxton2",
						"hoxton3"
					}
				},
				{
					desc_id = "houston_desc_codex",
					post_event = "pln_contact_houston",
					videos = {
						"hoxton1",
						"hoxton2",
						"hoxton3"
					}
				},
				id = "hoxton",
				name_id = "menu_american"
			},
			{
				{
					desc_id = "menu_clover_desc_codex",
					post_event = "pln_contact_clover",
					videos = {
						"clover1",
						"clover2"
					}
				},
				id = "clover",
				name_id = "menu_clover"
			},
			{
				{
					desc_id = "menu_dragan_desc_codex",
					post_event = "pln_contact_dragan",
					videos = {
						"dragan1",
						"dragan2",
						"dragan3"
					}
				},
				id = "dragan",
				name_id = "menu_dragan"
			},
			{
				{
					desc_id = "menu_jacket_desc_codex",
					post_event = "pln_contact_jacket",
					videos = {
						"jacket1",
						"jacket2"
					}
				},
				id = "jacket",
				name_id = "menu_jacket"
			},
			{
				{
					desc_id = "menu_bonnie_desc_codex",
					post_event = "pln_contact_bonnie",
					videos = {
						"bonnie1"
					}
				},
				id = "bonnie",
				name_id = "menu_bonnie"
			},
			{
				{
					desc_id = "menu_sokol_desc_codex",
					post_event = "pln_contact_sokol",
					videos = {
						"sokol1"
					}
				},
				id = "sokol",
				name_id = "menu_sokol"
			},
			{
				{
					desc_id = "menu_dragon_desc_codex",
					post_event = "pln_contact_jiro",
					videos = {
						"dragon1"
					}
				},
				id = "dragon",
				name_id = "menu_dragon"
			},
			{
				{
					desc_id = "menu_bodhi_desc_codex",
					post_event = "pln_contact_bodhi",
					videos = {
						"bodhi1"
					}
				},
				dlc = "rvd",
				id = "bodhi",
				name_id = "menu_bodhi"
			},
			{
				{
					desc_id = "menu_jimmy_desc_codex",
					post_event = "pln_contact_jimmy",
					videos = {
						"jimmy1"
					}
				},
				dlc = "coco",
				id = "jimmy",
				name_id = "menu_jimmy"
			},
			{
				{
					desc_id = "menu_sydney_desc_codex",
					post_event = "pln_contact_sydney",
					videos = {
						"sydney1"
					}
				},
				id = "sydney",
				name_id = "menu_sydney"
			},
			{
				{
					desc_id = "menu_wild_desc_codex",
					post_event = "pln_contact_rust",
					videos = {
						"wild1"
					}
				},
				id = "wild",
				name_id = "menu_wild"
			},
			{
				{
					desc_id = "menu_chico_desc_codex",
					post_event = "pln_contact_tony",
					videos = {
						"chico1"
					}
				},
				dlc = "chico",
				id = "chico",
				name_id = "menu_chico"
			},
			{
				{
					desc_id = "menu_max_desc_codex",
					post_event = "pln_contact_sangres",
					videos = {
						"max1"
					}
				},
				id = "max",
				name_id = "menu_max"
			},
			{
				{
					desc_id = "menu_joy_desc_codex",
					post_event = "pln_contact_joy",
					videos = {
						"joy1"
					}
				},
				id = "joy",
				name_id = "menu_joy"
			},
			{
				{
					desc_id = "menu_myh_desc_codex",
					post_event = "pln_contact_duke",
					videos = {
						"myh1"
					}
				},
				id = "myh",
				name_id = "menu_myh"
			},
			{
				{
					desc_id = "menu_ecp_desc_codex",
					post_event = "pln_contact_ecp",
					videos = {
						"ecp1"
					}
				},
				id = "ecp",
				name_id = "menu_ecp"
			},
			id = "playable_characters",
			name_id = "menu_playable_characters"
		}
	}

	local padding = 10
	local panel_width = 900
	local panel_height = 600
	local text_width = 500
	local contact_width = panel_width - text_width - 3 * padding

	self.crime_net.contract_gui = {
		width = panel_width,
		height = panel_height,
		padding = padding,
		text_width = text_width,
		contact_width = contact_width
	}
	self.crime_net.locations = {}

	if not Application:production_build() or SystemInfo:platform() ~= Idstring("WIN32") then
		self.crime_net.locations = {
			{
				{
					weight = 100,
					dots = {
						{
							1601,
							425
						},
						{
							1025,
							835
						},
						{
							444,
							567
						},
						{
							1221,
							685
						},
						{
							1603,
							555
						},
						{
							1401,
							620
						},
						{
							1581,
							685
						},
						{
							1306,
							750
						},
						{
							1486,
							815
						},
						{
							1666,
							750
						},
						{
							1450,
							880
						},
						{
							1041,
							620
						},
						{
							730,
							880
						},
						{
							883,
							555
						},
						{
							861,
							685
						},
						{
							766,
							815
						},
						{
							946,
							750
						},
						{
							1480,
							165
						},
						{
							1304,
							295
						},
						{
							1484,
							230
						},
						{
							1664,
							295
						},
						{
							1241,
							425
						},
						{
							1421,
							360
						},
						{
							1063,
							490
						},
						{
							1243,
							555
						},
						{
							1423,
							490
						},
						{
							1120,
							165
						},
						{
							1124,
							230
						},
						{
							760,
							165
						},
						{
							764,
							230
						},
						{
							944,
							295
						},
						{
							701,
							360
						},
						{
							681,
							620
						},
						{
							881,
							425
						},
						{
							703,
							490
						},
						{
							400,
							165
						},
						{
							404,
							230
						},
						{
							584,
							295
						},
						{
							343,
							490
						},
						{
							224,
							295
						},
						{
							341,
							360
						},
						{
							521,
							425
						},
						{
							586,
							750
						}
					}
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain",
						"the_dentist",
						"the_butcher"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			}
		}
	else
		self.crime_net.locations = {
			{
				{
					{
						558,
						558,
						566,
						579,
						591,
						600,
						608,
						607,
						614,
						616
					},
					{
						722,
						812,
						824,
						832,
						827,
						811,
						810,
						788,
						790,
						722
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						610,
						644,
						555,
						591,
						593,
						582,
						585
					},
					{
						733,
						691,
						620,
						685,
						699,
						705,
						724
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						567,
						570,
						589,
						559,
						563,
						571
					},
					{
						683,
						690,
						684,
						623,
						652,
						678
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						627,
						636,
						568,
						556,
						549
					},
					{
						684,
						665,
						610,
						604,
						614
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						498,
						505,
						505,
						513,
						527,
						517,
						514
					},
					{
						611,
						611,
						602,
						598,
						615,
						624,
						632
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						372,
						416,
						416
					},
					{
						535,
						557,
						533
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						149,
						145,
						164,
						167
					},
					{
						446,
						455,
						462,
						452
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						168,
						167,
						182,
						184
					},
					{
						465,
						472,
						477,
						469
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						424,
						506,
						508,
						467,
						423
					},
					{
						535,
						536,
						549,
						581,
						556
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						479,
						499,
						498,
						471
					},
					{
						583,
						583,
						535,
						534
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						212,
						558,
						554,
						203
					},
					{
						432,
						430,
						248,
						251
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal"
					}
				}
			},
			{
				{
					{
						240,
						543,
						542,
						241
					},
					{
						440,
						442,
						477,
						464
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal"
					}
				}
			},
			{
				{
					{
						260,
						291,
						289,
						315,
						315,
						346,
						511,
						511
					},
					{
						432,
						472,
						483,
						493,
						500,
						514,
						514,
						407
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						376,
						382,
						502,
						511,
						511,
						542,
						542,
						510
					},
					{
						510,
						522,
						519,
						512,
						473,
						441,
						420,
						421
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						554,
						567,
						577,
						574,
						609,
						556,
						522
					},
					{
						416,
						416,
						407,
						360,
						302,
						247,
						291
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						598,
						630,
						690,
						701,
						679,
						659,
						639,
						639,
						596
					},
					{
						298,
						276,
						275,
						266,
						229,
						210,
						211,
						219,
						219
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						536,
						524,
						505,
						504,
						491,
						491,
						472,
						470
					},
					{
						253,
						232,
						229,
						180,
						180,
						215,
						215,
						261
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						205,
						202,
						339,
						373,
						474,
						472
					},
					{
						251,
						123,
						125,
						147,
						173,
						267
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						564,
						563,
						576,
						576
					},
					{
						190,
						206,
						207,
						191
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						341,
						349,
						358,
						372,
						373,
						369,
						367,
						359,
						358,
						349,
						349,
						340
					},
					{
						103,
						105,
						108,
						107,
						115,
						115,
						122,
						121,
						116,
						115,
						121,
						120
					},
					weight = 1
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						553,
						628,
						628,
						555
					},
					{
						243,
						245,
						282,
						326
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						148,
						166,
						164,
						185,
						189,
						224,
						225,
						135
					},
					{
						422,
						423,
						436,
						436,
						432,
						432,
						123,
						125
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						553,
						544,
						774,
						832,
						879,
						925,
						977,
						988,
						1036,
						874,
						735,
						599,
						598
					},
					{
						514,
						538,
						527,
						528,
						533,
						527,
						534,
						527,
						529,
						161,
						342,
						458,
						515
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						585,
						602,
						598,
						641,
						734,
						732,
						760,
						772,
						609,
						591
					},
					{
						452,
						462,
						584,
						637,
						635,
						552,
						544,
						527,
						429,
						429
					},
					weight = 50
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						740,
						708,
						702,
						652,
						650,
						640,
						625,
						635,
						602,
						743
					},
					{
						343,
						343,
						333,
						333,
						344,
						339,
						363,
						368,
						443,
						437
					},
					weight = 25
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						983,
						1059,
						1059,
						656,
						707,
						755,
						833
					},
					{
						423,
						384,
						162,
						162,
						199,
						258,
						393
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1058,
						1094,
						1112,
						1133,
						1174,
						1172,
						1183,
						1183,
						1170,
						1170,
						1049
					},
					{
						337,
						349,
						345,
						349,
						328,
						296,
						296,
						269,
						268,
						248,
						248
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1053,
						1168,
						1149,
						1004,
						872
					},
					{
						162,
						166,
						340,
						341,
						162
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						997,
						1071,
						1201,
						1886,
						1879,
						1197,
						1206
					},
					{
						418,
						609,
						608,
						253,
						105,
						110,
						325
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1045,
						1115,
						1127,
						1110,
						1092,
						1072,
						1066,
						1058,
						1041
					},
					{
						604,
						607,
						354,
						351,
						358,
						347,
						352,
						578,
						576
					},
					weight = 50
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1204,
						1239,
						1239,
						1280,
						1280,
						1305,
						1307,
						1200
					},
					{
						658,
						642,
						606,
						612,
						624,
						613,
						536,
						590
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1306,
						1318,
						1352,
						1354,
						1399,
						1401,
						1284
					},
					{
						602,
						606,
						589,
						565,
						568,
						487,
						539
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1399,
						1426,
						1446,
						1447,
						1460,
						1460,
						1522,
						1521,
						1376
					},
					{
						559,
						556,
						545,
						529,
						527,
						513,
						516,
						423,
						481
					},
					weight = 25
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1521,
						1569,
						1571,
						1510
					},
					{
						466,
						465,
						394,
						411
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1625,
						1625,
						1678,
						1676,
						1643,
						1642
					},
					{
						455,
						465,
						441,
						416,
						418,
						445
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1563,
						1733,
						1877,
						1878
					},
					{
						417,
						414,
						349,
						239
					},
					weight = 50
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1125,
						1181,
						1177,
						1187,
						1188,
						1238,
						1239
					},
					{
						358,
						328,
						300,
						298,
						266,
						267,
						361
					},
					weight = 25
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1162,
						1162,
						1172,
						1170,
						1212,
						1211,
						1170,
						1171
					},
					{
						225,
						246,
						247,
						267,
						269,
						181,
						183,
						223
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1185,
						1186,
						1171,
						1170,
						1178,
						1218,
						1216
					},
					{
						184,
						168,
						168,
						120,
						112,
						111,
						189
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						772,
						1033,
						1036,
						972,
						736,
						733,
						763
					},
					{
						529,
						537,
						895,
						854,
						814,
						550,
						547
					},
					weight = 200
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						743,
						696,
						675,
						696,
						692,
						723,
						882,
						881,
						917,
						917
					},
					{
						780,
						776,
						792,
						817,
						873,
						906,
						903,
						854,
						835,
						791
					},
					weight = 50
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						653,
						655,
						676,
						668,
						667,
						665,
						678,
						750,
						747
					},
					{
						639,
						659,
						676,
						693,
						735,
						744,
						758,
						760,
						636
					},
					weight = 25
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						916,
						928,
						973,
						972,
						990,
						999,
						1036,
						1035,
						904
					},
					{
						846,
						853,
						854,
						882,
						882,
						892,
						892,
						831,
						829
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1033,
						1044,
						1042,
						1038,
						1039,
						1050,
						1033,
						1000,
						1004
					},
					{
						667,
						667,
						615,
						615,
						574,
						573,
						536,
						539,
						683
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1872,
						1879,
						1763,
						1199,
						1250,
						1240
					},
					{
						359,
						790,
						900,
						879,
						788,
						647
					},
					weight = 500
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1201,
						1256,
						1277,
						1247,
						1244,
						1201,
						1209,
						1202
					},
					{
						739,
						763,
						613,
						614,
						644,
						665,
						675,
						689
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1259,
						1200,
						1203,
						1253,
						1265
					},
					{
						789,
						788,
						901,
						901,
						825
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1256,
						1283,
						1287,
						1307,
						1308,
						1374,
						1375,
						1391,
						1388,
						1460,
						1457,
						1254
					},
					{
						893,
						894,
						903,
						901,
						894,
						894,
						901,
						902,
						896,
						895,
						854,
						854
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1522,
						1524,
						1542,
						1540,
						1529,
						1528,
						1707,
						1706,
						1520
					},
					{
						891,
						898,
						901,
						920,
						921,
						950,
						951,
						874,
						872
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1575,
						1637,
						1638,
						1620,
						1625,
						1525,
						1523,
						1559,
						1575
					},
					{
						422,
						422,
						438,
						449,
						488,
						528,
						468,
						468,
						473
					},
					weight = 10
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1533,
						1462,
						1464,
						1453,
						1450,
						1530
					},
					{
						519,
						519,
						530,
						533,
						557,
						554
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1357,
						1355,
						1463,
						1463,
						1403,
						1402
					},
					{
						572,
						609,
						609,
						556,
						561,
						574
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			},
			{
				{
					{
						1676,
						1680,
						1753,
						1751
					},
					{
						417,
						461,
						464,
						415
					},
					weight = 5
				},
				filters = {
					regions = {
						"street",
						"dock",
						"professional"
					},
					contacts = {
						"vlad",
						"the_elephant",
						"hector",
						"bain"
					},
					difficulties = {
						"normal",
						"hard",
						"overkill",
						"overkill_145",
						"easy_wish",
						"overkill_290",
						"sm_wish"
					}
				}
			}
		}

		self:_create_location_bounding_boxes()
		self:_create_location_spawning_dots()
		print("Generating new spawn points for crimenet")
	end

	local wts = {}

	wts.color_indexes = {
		{
			color = "red"
		},
		{
			color = "blue",
			dlc = "gage_pack_jobs"
		},
		{
			color = "green",
			dlc = "gage_pack_jobs"
		},
		{
			color = "yellow",
			dlc = "gage_pack_jobs"
		}
	}

	local dlc_1_folder = "units/pd2_dlc1/weapons/wpn_effects_textures/"
	local butch_folder = "units/pd2_dlc_butcher_mods/weapons/wpn_effects_textures/"

	wts.types = {}
	wts.types.sight = {
		{
			name_id = "menu_reticle_1_s",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_s_1_il"
		},
		{
			name_id = "menu_reticle_1_m",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_m_1_il"
		},
		{
			name_id = "menu_reticle_1_l",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_l_1_il"
		},
		{
			name_id = "menu_reticle_2",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_2_il"
		},
		{
			name_id = "menu_reticle_3",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_3_il"
		},
		{
			name_id = "menu_reticle_4",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_4_il"
		},
		{
			dlc = "gage_pack_jobs",
			name_id = "menu_reticle_5",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_5_il"
		},
		{
			dlc = "gage_pack_jobs",
			name_id = "menu_reticle_6",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_6_il"
		},
		{
			dlc = "gage_pack_jobs",
			name_id = "menu_reticle_7",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_7_il"
		},
		{
			dlc = "gage_pack_jobs",
			name_id = "menu_reticle_8",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_8_il"
		},
		{
			dlc = "gage_pack_jobs",
			name_id = "menu_reticle_9",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_9_il"
		},
		{
			dlc = "gage_pack_jobs",
			name_id = "menu_reticle_10",
			texture_path = dlc_1_folder .. "wpn_sight_reticle_10_il"
		},
		{
			name_id = "menu_reticle_11",
			texture_path = butch_folder .. "wpn_sight_reticle_11_il"
		},
		{
			name_id = "menu_reticle_12",
			texture_path = butch_folder .. "wpn_sight_reticle_12_il"
		},
		{
			name_id = "menu_reticle_13",
			texture_path = butch_folder .. "wpn_sight_reticle_13_il"
		},
		{
			name_id = "menu_reticle_14",
			texture_path = butch_folder .. "wpn_sight_reticle_14_il"
		},
		{
			name_id = "menu_reticle_15",
			texture_path = butch_folder .. "wpn_sight_reticle_15_il"
		},
		{
			name_id = "menu_reticle_16",
			texture_path = butch_folder .. "wpn_sight_reticle_16_il"
		},
		{
			name_id = "menu_reticle_17",
			texture_path = butch_folder .. "wpn_sight_reticle_17_il"
		},
		{
			name_id = "menu_reticle_18",
			texture_path = butch_folder .. "wpn_sight_reticle_18_il"
		},
		{
			name_id = "menu_reticle_19",
			texture_path = butch_folder .. "wpn_sight_reticle_19_il"
		},
		{
			name_id = "menu_reticle_20",
			texture_path = butch_folder .. "wpn_sight_reticle_20_il"
		},
		{
			name_id = "menu_reticle_21",
			texture_path = butch_folder .. "wpn_sight_reticle_21_il"
		},
		{
			name_id = "menu_reticle_22",
			texture_path = butch_folder .. "wpn_sight_reticle_22_il"
		},
		{
			name_id = "menu_reticle_23",
			texture_path = butch_folder .. "wpn_sight_reticle_23_il"
		},
		suffix = "_il"
	}
	wts.types.gadget = wts.types.sight
	wts.types.sight_swap = wts.types.sight
	wts.types.second_sight = wts.types.sight
	self.weapon_texture_switches = wts
	self.default_part_texture_switch = "1 3"
	self.part_texture_switches = {
		wpn_fps_upg_o_45rds = "1 3",
		wpn_fps_upg_o_45rds_v2 = "1 3"
	}
	self.tradable_inventory_sort_list = {
		"aquired",
		"alphabetic",
		"quality",
		"rarity",
		"category",
		"bonus"
	}
	self.leakedrecordings = {}
	self.leakedrecordings.missions = {
		{
			briefing_track = "Play_loc_secr_01",
			coming_soon = false,
			heist = "kosugi",
			job_value = "LRON",
			poster_icon = "guis/dlcs/lron/textures/pd2/crimenet/badforbusiness",
			recording_track = "Play_spe_bfb_01",
			poster_rect = {
				0,
				14,
				256,
				484
			}
		},
		{
			briefing_track = "Play_loc_secr_02",
			coming_soon = false,
			heist = "mex",
			job_value = "LRTW",
			poster_icon = "guis/dlcs/lrtw/textures/pd2/crimenet/cellmates",
			recording_track = "Play_spe_clm_01",
			poster_rect = {
				0,
				14,
				256,
				484
			}
		},
		{
			briefing_track = "Play_loc_secr_03",
			coming_soon = false,
			heist = "dah",
			job_value = "LRTH",
			poster_icon = "guis/dlcs/lrth/textures/pd2/crimenet/garnets",
			recording_track = "Play_spe_grt_01",
			poster_rect = {
				0,
				14,
				256,
				484
			}
		},
		{
			briefing_track = "Play_loc_secr_04",
			coming_soon = false,
			heist = "hox",
			job_value = "LRFO",
			poster_icon = "guis/dlcs/lrfo/textures/pd2/crimenet/enemies",
			recording_track = "Play_spe_ets_01",
			poster_rect = {
				0,
				14,
				256,
				484
			}
		}
	}
	self.new_heists = {
		limit = 5
	}

	table.insert(self.new_heists, {
		epic_url = "https://pd2.link/EspionageWeaponPackE",
		name_id = "menu_nh_esp_dlc",
		texture_path = "guis/dlcs/esp/textures/pd2/new_heists/esp_dlc_banner",
		url = "https://pd2.link/EspionageWeaponPackS"
	})

	local distribution_id = SystemInfo:distribution()

	if distribution_id == Idstring("STEAM") then
		table.insert(self.new_heists, {
			epic_url = "",
			name_id = "menu_nh_acsbzbanner_sub",
			texture_path = "guis/dlcs/acsbzbanners/textures/pd2/new_heists/subscription_banner",
			url = "https://store.steampowered.com/app/3847540/"
		})
	end

	table.insert(self.new_heists, {
		epic_url = "https://pd2.link/XM25Merch",
		name_id = "menu_nh_xm25_01",
		texture_path = "guis/dlcs/xm25/textures/pd2/new_heists/xm25_01",
		url = "https://pd2.link/XM25Merch"
	})
	table.insert(self.new_heists, {
		epic_url = "https://pd2.link/XM25TeddyMoo",
		name_id = "menu_nh_xm25_02",
		texture_path = "guis/dlcs/xm25/textures/pd2/new_heists/xm25_02",
		url = "https://pd2.link/XM25TeddyMoo"
	})
	table.insert(self.new_heists, {
		epic_url = "https://t.paydaythegame.com/c/wcxnzh",
		name_id = "menu_nh_pda10_04",
		texture_path = "guis/dlcs/pda10/textures/pd2/new_heists/pda10_04",
		url = "https://t.paydaythegame.com/c/oedttw"
	})
	table.insert(self.new_heists, {
		epic_url = "https://t.paydaythegame.com/c/mntnol",
		name_id = "menu_nh_dgs_02",
		texture_path = "guis/dlcs/dgs/textures/pd2/new_heists/dgs_02",
		url = "https://t.paydaythegame.com/c/gsyil8"
	})
	table.insert(self.new_heists, {
		epic_url = "https://t.paydaythegame.com/c/20jyqr",
		name_id = "menu_nh_pda10_03",
		texture_path = "guis/dlcs/pda10/textures/pd2/new_heists/pda10_03",
		url = "https://t.paydaythegame.com/c/20jyqr"
	})
	table.insert(self.new_heists, {
		epic_url = "https://t.paydaythegame.com/c/exuz4t",
		name_id = "menu_nh_dgs",
		texture_path = "guis/dlcs/dgs/textures/pd2/new_heists/dgs",
		url = "https://t.paydaythegame.com/c/exuz4t"
	})
	table.insert(self.new_heists, {
		epic_url = "https://pd2.link/CrudeAwakeningNebulaSL",
		name_id = "menu_nh_pxp4_02",
		texture_path = "guis/dlcs/pxp4/textures/pd2/new_heists/pxp4_02",
		url = "https://pd2.link/CrudeAwakeningNebulaSL"
	})
	table.insert(self.new_heists, {
		epic_url = "https://t.paydaythegame.com/c/vqiyyn",
		name_id = "menu_nh_pda10_01",
		texture_path = "guis/dlcs/pda10/textures/pd2/new_heists/pda10_01",
		url = "https://t.paydaythegame.com/c/vqiyyn"
	})
	table.insert(self.new_heists, {
		epic_url = "https://t.paydaythegame.com/c/f4yt3i",
		name_id = "menu_nh_pda10_02",
		texture_path = "guis/dlcs/pda10/textures/pd2/new_heists/pda10_02",
		url = "https://t.paydaythegame.com/c/f4yt3i"
	})
	table.insert(self.new_heists, {
		epic_url = "https://pd2.link/CrudeAwakeningHeistSLE",
		name_id = "menu_nh_deep_01",
		texture_path = "guis/dlcs/deep/textures/pd2/new_heists/deep_01",
		url = "https://pd2.link/CrudeAwakeningHeistSLS"
	})
	table.insert(self.new_heists, {
		epic_url = "https://pd2.link/CrudeAwakeningBundleSLE",
		name_id = "menu_nh_txt4_01",
		texture_path = "guis/dlcs/txt4/textures/pd2/new_heists/txt4_01",
		url = "https://pd2.link/CrudeAwakeningBundleSLS"
	})
	table.insert(self.new_heists, {
		epic_url = "https://pd2.link/McShayWeaponPack4SLE",
		name_id = "menu_nh_pxp4",
		texture_path = "guis/dlcs/pxp4/textures/pd2/new_heists/pxp4",
		url = "https://pd2.link/McShayWeaponPack4SLS"
	})
	table.insert(self.new_heists, {
		epic_url = "https://pd2.link/LawlessTailorPackSLE",
		name_id = "menu_nh_txt4_02",
		texture_path = "guis/dlcs/txt4/textures/pd2/new_heists/txt4_02",
		url = "_https://pd2.link/LawlessTailorPackSLS"
	})
	table.insert(self.new_heists, {
		epic_url = "https://pd2.link/HostileTakeoverBundleSLE",
		name_id = "menu_nh_txt3_02",
		texture_path = "guis/dlcs/txt3/textures/pd2/new_heists/txt3_02",
		url = "https://pd2.link/HostileTakeoverBundleSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_corp_01",
		texture_path = "guis/dlcs/corp/textures/pd2/new_heists/corp_02",
		url = "https://pd2.link/HostileTakeoverHeistSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_pxp3",
		texture_path = "guis/dlcs/pxp3/textures/pd2/new_heists/pxp3",
		url = "https://pd2.link/McShayWeaponPack3SLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_corp",
		texture_path = "guis/dlcs/corp/textures/pd2/new_heists/corp_01",
		url = "https://pd2.link/HostileTakeoverDropsSL"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_txt3_01",
		texture_path = "guis/dlcs/txt3/textures/pd2/new_heists/txt3_01",
		url = "https://pd2.link/StreetSmartTailorPackSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_mxm_01",
		texture_path = "guis/dlcs/mxm/textures/pd2/new_heists/mxm_01",
		url = "https://pd2.link/McShayModPackSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_trai_02",
		texture_path = "guis/dlcs/trai/textures/pd2/new_heists/trai_02",
		url = "https://pd2.link/LostInTransitBundleSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_xm22_01",
		texture_path = "guis/dlcs/xm22/textures/pd2/new_heists/xm22_01",
		url = "https://pd2.link/Holiday2022SLW"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_trai_01",
		texture_path = "guis/dlcs/trai/textures/pd2/new_heists/trai_01",
		url = "https://pd2.link/LostInTransitHeistSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_a11th_01",
		texture_path = "guis/dlcs/a11th/textures/pd2/new_heists/a11th_01",
		url = "https://pd2.link/PAYDAY11SLP2"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_trai_03",
		texture_path = "guis/dlcs/trai/textures/pd2/new_heists/trai_03",
		url = "https://pd2.link/LostInTransitDropsSL"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_h22_01",
		texture_path = "guis/dlcs/h22/textures/pd2/new_heists/h22_01",
		url = "https://pd2.link/Halloween22SLA"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_pxp2_01",
		texture_path = "guis/dlcs/pxp2/textures/pd2/new_heists/pxp2_01",
		url = "https://pd2.link/McShayWeaponPack2SLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_tma1_01",
		texture_path = "guis/dlcs/tma1/textures/pd2/new_heists/tma1_01",
		url = "https://pd2.link/TijuanaMusicPackSL"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_pda9_01",
		texture_path = "guis/dlcs/pda9/textures/pd2/new_heists/pda9_01",
		url = "https://pd2.link/PD2NinthSLW"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_txt2_02",
		texture_path = "guis/dlcs/txt2/textures/pd2/new_heists/txt2_02",
		url = "https://pd2.link/LostInTransitBundleSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_txt2_01",
		texture_path = "guis/dlcs/txt2/textures/pd2/new_heists/txt2_01",
		url = "https://pd2.link/HighOctaneTailorPackSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_sbzacc_01",
		texture_path = "guis/dlcs/txt2/textures/pd2/new_heists/sbzacc_01",
		url = "https://sbz.link/account"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_txt1_02",
		texture_path = "guis/dlcs/txt1/textures/pd2/new_heists/txt1_02",
		url = "https://pd2.link/MidlandBundleSLS"
	})
	table.insert(self.new_heists, {
		append_steam_id = "?playerid=",
		name_id = "menu_nh_ranc_01",
		texture_path = "guis/dlcs/ranc/textures/pd2/new_heists/ranc_01",
		url = "https://pd2.link/MidlandRanchSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_ranc_02",
		texture_path = "guis/dlcs/ranc/textures/pd2/new_heists/ranc_02",
		url = "https://pd2.link/Drops"
	})
	table.insert(self.new_heists, {
		append_steam_id = "?playerid=",
		name_id = "menu_nh_pxp1_02",
		texture_path = "guis/dlcs/in40/textures/pd2/new_heists/in40_02",
		url = "https://pd3.link/ShapePD3"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_in33_02",
		texture_path = "guis/dlcs/in33/textures/pd2/new_heists/in33_02",
		url = "https://pd2.link/Infamy33SLW3"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_pent_01",
		texture_path = "guis/dlcs/pent/textures/pd2/new_heists/pent_01",
		url = "https://pd2.link/MountainMasterSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_gdtp_01",
		texture_path = "guis/dlcs/gdtp/textures/pd2/new_heists/gdtp_01",
		url = "https://pd2.link/MountainMasterSLS2"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_lawp_01",
		texture_path = "guis/dlcs/lawp/textures/pd2/new_heists/lawp_01",
		url = "https://pd2.link/SmugglerPack4SLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_ja22_02",
		texture_path = "guis/dlcs/ja22/textures/pd2/new_heists/ja22_02",
		url = "https://pd2.link/BCBundleSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_snow_01",
		texture_path = "guis/dlcs/snow/textures/pd2/new_heists/snow_01",
		url = "https://pd2.link/Xmas2021SLS2"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_xm21_01",
		texture_path = "guis/dlcs/xm21/textures/pd2/new_heists/xm21_01",
		url = "https://pd2.link/Xmas2021SLA"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_in33_01",
		texture_path = "guis/dlcs/in33/textures/pd2/new_heists/in33_01",
		url = "https://pd2.link/Infamy33SLW"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_trik_01",
		texture_path = "guis/dlcs/trik/textures/pd2/new_heists/trik_01",
		url = "https://pd2.link/PD2HW21SLW"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_a10th_01",
		texture_path = "guis/dlcs/a10th/textures/pd2/new_heists/a10th_01",
		url = "https://pd2.link/PAYDAY10SLW"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_chca_01",
		texture_path = "guis/dlcs/chca/textures/pd2/new_heists/chca_01",
		url = "https://pd2.link/BlackCatSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_cctp_01",
		texture_path = "guis/dlcs/cctp/textures/pd2/new_heists/cctp_01",
		url = "https://pd2.link/BlackCatSLS2"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_tawp",
		texture_path = "guis/dlcs/tawp/textures/pd2/new_heists/tawp",
		url = "https://pd2.link/SmugglerPack3SLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_ivs",
		texture_path = "guis/dlcs/ivs/textures/pd2/new_heists/ivs",
		url = "https://pd2.link/PD2Upd210SLA"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_sand_bundle",
		texture_path = "guis/dlcs/sand/textures/pd2/new_heists/sand_bundle",
		url = "https://pd2.link/UKPBundleSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_sand",
		texture_path = "guis/textures/pd2/new_heists/sand",
		url = "https://pd2.link/UkrainianPrisonerSLS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_sdtp",
		texture_path = "guis/textures/pd2/new_heists/sdtp",
		url = "https://pd2.link/UkrainianPrisonerSLS2"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_sawp",
		texture_path = "guis/textures/pd2/new_heists/sawp",
		url = "https://pd2.link/SmugglerPack2SLW"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_srtr",
		texture_path = "guis/dlcs/srtr/textures/pd2/new_heists/srtr",
		url = "https://pd2.link/SR3PD2SLA"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_in32",
		texture_path = "guis/textures/pd2/new_heists/in32",
		url = "https://pd2.link/in32Slider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_apfo",
		texture_path = "guis/textures/pd2/new_heists/apfo",
		url = "https://pd2.link/Ap21AnnSlider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_chas",
		texture_path = "guis/textures/pd2/new_heists/chas",
		url = "https://pd2.link/CGDPWebS"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_faco",
		texture_path = "guis/textures/pd2/new_heists/faco",
		url = "https://pd2.link/JFSPSliderW"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_silkroad_collection",
		texture_path = "guis/textures/pd2/new_heists/silkroad_collection",
		url = "https://pd2.link/JFSPSlider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_in31",
		texture_path = "guis/textures/pd2/new_heists/in31",
		url = "https://pd2.link/JFSPSliderT"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_ja21",
		texture_path = "guis/dlcs/ja21/textures/pd2/new_heists/ja21",
		url = "https://pd2.link/pd2bidenmask"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_inf",
		texture_path = "guis/textures/pd2/new_heists/inf",
		url = "https://pd2.link/FEXUpdateSlider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_xm20",
		texture_path = "guis/textures/pd2/new_heists/xm20",
		url = "https://pd2.link/xmas2020"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_fex_bundle",
		texture_path = "guis/textures/pd2/new_heists/fex_bundle",
		url = "https://pd2.link/FEXBundleSlider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_legacy",
		texture_path = "guis/textures/pd2/new_heists/legacy",
		url = "https://pd2.link/ingameLegacy"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_anv",
		texture_path = "guis/textures/pd2/new_heists/anv",
		url = "https://pd2.link/7thAnniversary"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_pex_bundle",
		texture_path = "guis/textures/pd2/new_heists/pex_bundle",
		url = "https://pd2.link/pexbundleslider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_pex",
		texture_path = "guis/textures/pd2/new_heists/pex",
		url = "https://pd2.link/pexheistslider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_atw",
		texture_path = "guis/textures/pd2/new_heists/atw",
		url = "https://pd2.link/pexwpslider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_wcc",
		texture_path = "guis/textures/pd2/new_heists/wcc",
		url = "https://pd2.link/pexwcp2slider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_u1993",
		texture_path = "guis/textures/pd2/new_heists/u1993",
		url = "https://pd2.link/april2020"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_bex",
		texture_path = "guis/textures/pd2/new_heists/bex",
		url = "https://pd2.link/bexheistslider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_tailor_pack_2",
		texture_path = "guis/textures/pd2/new_heists/tailor_pack_2",
		url = "https://pd2.link/bextp2slider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_weapon_pack",
		texture_path = "guis/textures/pd2/new_heists/weapon_pack",
		url = "https://pd2.link/bexwpslider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_weapon_color_pack",
		texture_path = "guis/textures/pd2/new_heists/weapon_color_pack",
		url = "https://pd2.link/bexwcp1slider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_bex_dlc_bundle",
		texture_path = "guis/textures/pd2/new_heists/bex_dlc_bundle",
		url = "https://pd2.link/bexbundleslider"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_combo",
		texture_path = "guis/textures/pd2/new_heists/combo",
		url = "https://pd2.link/ingameBCBundle"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_xmn_2019",
		texture_path = "guis/textures/pd2/new_heists/xmn_2019",
		url = "https://store.steampowered.com/app/218620/PAYDAY_2/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_mex",
		texture_path = "guis/textures/pd2/new_heists/mex",
		url = "https://pd2.link/ingameBorderCrossing"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_trd",
		texture_path = "guis/textures/pd2/new_heists/trd",
		url = "https://pd2.link/ingameTailorPack"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_mwm",
		texture_path = "guis/textures/pd2/new_heists/mwm",
		url = "https://pd2.link/ingameCartelOptics"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_theme",
		texture_path = "guis/textures/pd2/new_heists/theme",
		url = "https://pd2.link/themedbundle"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_crimefest_2018",
		texture_path = "guis/textures/pd2/new_heists/crimefest_2018",
		url = "https://www.paydaythegame.com/payday2/updates/breakingnews/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_icebreaker",
		texture_path = "guis/textures/pd2/new_heists/icebreaker",
		url = "https://www.paydaythegame.com/payday2/updates/icebreaker/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_sft",
		texture_path = "guis/textures/pd2/new_heists/menu_nh_sft",
		url = "https://steamcommunity.com/games/218620/announcements/detail/2885003081979937951"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_euu",
		texture_path = "guis/textures/pd2/new_heists/euu",
		url = "https://steamcommunity.com/games/218620/announcements/detail/1698303218390483331"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_cat",
		texture_path = "guis/textures/pd2/new_heists/cat",
		url = "https://www.paydaythegame.com/payday2/updates/communitysafe7/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_sb_2018_thesecretisreallyreal",
		texture_path = "guis/textures/pd2/new_heists/sb_2018_thesecretisreallyreal",
		url = "https://www.paydaythegame.com/archive/thesecretisreallyreal/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_pd2vr_launch",
		texture_path = "guis/textures/pd2/new_heists/pd2vr_launch",
		url = "https://steamcommunity.com/games/218620/announcements/detail/1669019670888919416"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_sb_2018_sale",
		texture_path = "guis/textures/pd2/new_heists/sb_2018_sale",
		url = "https://store.steampowered.com/app/218620/PAYDAY_2/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_ggez",
		texture_path = "guis/textures/pd2/new_heists/difficultyandsniper_update",
		url = "https://steamcommunity.com/games/218620/announcements/detail/1666767238319907275"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_css",
		texture_path = "guis/textures/pd2/new_heists/css",
		url = "https://steamcommunity.com/games/218620/announcements/detail/1671268301110805355"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_ami",
		texture_path = "guis/textures/pd2/new_heists/ami",
		url = "https://steamcommunity.com/games/218620/announcements/detail/1664512272293565206"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_fgl",
		texture_path = "guis/textures/pd2/new_heists/fgl",
		url = "https://steamcommunity.com/games/218620/announcements/detail/2784778964087853978"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_brooklynbank_heist",
		texture_path = "guis/textures/pd2/new_heists/brooklynbank_heist",
		url = "https://www.paydaythegame.com/payday2/updates/brookyn-bank-heist/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_reservoirdogs_heist",
		texture_path = "guis/textures/pd2/new_heists/reservoirdogs_heist",
		url = "https://www.paydaythegame.com/payday2/updates/reservoirdogs/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_h3h3_characters",
		texture_path = "guis/textures/pd2/new_heists/h3h3_characters",
		url = "https://www.paydaythegame.com/payday2/updates/h3h3/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_locke_and_load_ultimate_discount",
		texture_path = "guis/textures/pd2/new_heists/locke_and_load_discount",
		url = "https://store.steampowered.com/bundle/3756/PAYDAY_2_Ultimate_Edition/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_halloween_2017_heist",
		texture_path = "guis/textures/pd2/new_heists/halloween_2017_heist",
		url = "https://steamcommunity.com/games/218620/announcements/detail/1453961083959105742"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_cas",
		texture_path = "guis/textures/pd2/new_heists/community_armor_safe",
		url = "https://www.paydaythegame.com/payday2/updates/communityarmorsafe/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_locke_and_load_event",
		texture_path = "guis/textures/pd2/new_heists/locke_and_load_event",
		url = "https://www.paydaythegame.com/payday2/updates/lockeandload/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_locke_and_load_f2p",
		texture_path = "guis/textures/pd2/new_heists/locke_and_load_f2p",
		url = "https://store.steampowered.com/app/218620/PAYDAY_2/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_enter_the_gungeon_collab",
		texture_path = "guis/textures/pd2/new_heists/enter_the_gungeon_collab",
		url = "https://steamcommunity.com/games/218620/announcements/detail/1462966036244751362"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_community_safe_5",
		texture_path = "guis/textures/pd2/new_heists/community_safe_5",
		url = "https://www.paydaythegame.com/payday2/updates/communitysafe5/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_aldstone_room",
		texture_path = "guis/textures/pd2/new_heists/aldstone_room",
		url = "https://www.paydaythegame.com/payday2/updates/aldstonesheritage/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_golden_chains",
		texture_path = "guis/textures/pd2/new_heists/golden_chains",
		url = "https://steamcommunity.com/games/218620/announcements/detail/1444947199697735668"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_community_safe_4",
		texture_path = "guis/textures/pd2/new_heists/community_safe_4",
		url = "https://www.paydaythegame.com/payday2/updates/communitysafe4/"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_crime_spree_update",
		texture_path = "guis/textures/pd2/new_heists/crime_spree_update",
		url = "https://store.steampowered.com/news/?appids=218620"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_dsync_beta_is_live",
		texture_path = "guis/textures/pd2/new_heists/desync_beta_is_live",
		url = "https://steamcommunity.com/games/218620/announcements/detail/1342486185513464930"
	})
	table.insert(self.new_heists, {
		name_id = "menu_nh_russian_national_day",
		texture_path = "guis/textures/pd2/new_heists/russian_national_day",
		url = "https://store.steampowered.com/news/app/218620"
	})
end

function GuiTweakData:_create_location_bounding_boxes()
	for _, location in ipairs(self.crime_net.locations) do
		local params = location[1]

		if params then
			local min_x, max_x, min_y, max_y

			for _, x in ipairs(params[1]) do
				min_x = not min_x and x or math.min(min_x, x)
				max_x = not max_x and x or math.max(max_x, x)
			end

			for _, y in ipairs(params[2]) do
				min_y = not min_y and y or math.min(min_y, y)
				max_y = not max_y and y or math.max(max_y, y)
			end

			params.bounding_box = {
				min_x,
				max_x,
				min_y,
				max_y
			}
		end
	end
end

function GuiTweakData:_create_location_spawning_dots()
	local map_w = 2048
	local map_h = 1024
	local border_w = 125
	local border_h = 50
	local start_y = 50
	local start_x = -50
	local step_x = 180
	local step_y = 130
	local random_x = 0
	local random_y = 0
	local random_step_x = step_x / 2
	local zig_y = step_y / 2
	local zig = true

	for y = border_h + start_y, map_h - 2 * border_h + start_y, step_y do
		for x = border_w + math.random(-random_step_x, random_step_x) + start_x, map_w - 2 * border_w + start_x, step_x do
			local found_point = false
			local rx = x + math.random(-random_x, random_x)
			local ry = y + math.random(-random_y, random_y) + (zig and zig_y or 0)

			for _, location_data in ipairs(self.crime_net.locations) do
				local location = location_data[1]
				local bounding_box = location.bounding_box

				location.dots = location.dots or {}

				if rx >= bounding_box[1] and rx <= bounding_box[2] and ry >= bounding_box[3] and ry <= bounding_box[4] then
					local vx = location[1]
					local vy = location[2]
					local j, c

					j = #vx

					for i = 1, #vx do
						if ry < vy[i] ~= (ry < vy[j]) and rx < (vx[j] - vx[i]) * (ry - vy[i]) / (vy[j] - vy[i]) + vx[i] then
							found_point = not found_point
						end

						j = i
					end

					if found_point then
						table.insert(location.dots, {
							rx,
							ry
						})

						break
					end
				end
			end

			zig = not zig
		end

		zig = not zig
	end

	local new_locations = {}

	new_locations[1] = {}
	new_locations[1].filters = self.crime_net.locations[1].filters
	new_locations[1][1] = {}
	new_locations[1][1].dots = {}
	new_locations[1][1].weight = 100

	for i = #self.crime_net.locations, 1, -1 do
		if self.crime_net.locations[i][1].dots then
			for _, dot in pairs(self.crime_net.locations[i][1].dots) do
				table.insert(new_locations[1][1].dots, dot)
			end
		end
	end

	self.crime_net.locations = new_locations
end

function GuiTweakData:create_narrative_locations(locations)
	return
end

function GuiTweakData:print_locations()
	return
end

function GuiTweakData:serializeTable(val, name, skipnewlines, depth)
	skipnewlines = skipnewlines or false
	depth = depth or 0

	local tmp = ""

	if name and type(name) == "string" then
		tmp = tmp .. name .. "="
	end

	if type(val) == "table" then
		tmp = tmp .. "{ " .. (depth == 0 and "\n" or "")

		local i = 1

		for k, v in pairs(val) do
			tmp = tmp .. self:serializeTable(v, k, skipnewlines, depth + 1)

			if depth > 0 and i < table.size(val) then
				tmp = tmp .. ", "
				i = i + 1
			else
				tmp = tmp .. " "
			end
		end

		tmp = tmp .. "}" .. (depth <= 1 and ", \n" or "")
	elseif type(val) == "number" then
		tmp = tmp .. tostring(val)
	elseif type(val) == "string" then
		tmp = tmp .. string.format("%q", val)
	elseif type(val) == "boolean" then
		tmp = tmp .. (val and "true" or "false")
	else
		tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
	end

	return tmp
end

function GuiTweakData:tradable_inventory_sort_func(index)
	if type(index) == "string" then
		index = self:tradable_inventory_sort_index(index)
	end

	if index == 1 then
		return function(x, y)
			return y < x
		end
	elseif index == 2 then
		local inventory_tradable = managers.blackmarket:get_inventory_tradable()
		local x_item, y_item, x_td, y_td, x_loc, y_loc
		local localization_cache = {}

		return function(x, y)
			x_item = inventory_tradable[x]
			y_item = inventory_tradable[y]
			x_td = (tweak_data.economy[x_item.category] or tweak_data.blackmarket[x_item.category])[x_item.entry]
			y_td = (tweak_data.economy[y_item.category] or tweak_data.blackmarket[y_item.category])[y_item.entry]

			if x_td.name_id ~= y_td.name_id then
				localization_cache[x_td.name_id] = localization_cache[x_td.name_id] or managers.localization:to_upper_text(x_td.name_id)
				localization_cache[y_td.name_id] = localization_cache[y_td.name_id] or managers.localization:to_upper_text(y_td.name_id)
				x_loc = localization_cache[x_td.name_id]
				y_loc = localization_cache[y_td.name_id]

				return x_loc < y_loc
			end

			return y < x
		end
	elseif index == 3 then
		local inventory_tradable = managers.blackmarket:get_inventory_tradable()
		local x_item, y_item, x_quality, y_quality

		return function(x, y)
			x_item = inventory_tradable[x]
			y_item = inventory_tradable[y]
			x_quality = tweak_data.economy.qualities[x_item.quality]
			y_quality = tweak_data.economy.qualities[y_item.quality]

			if not x_quality then
				return false
			end

			if not y_quality then
				return not x_quality
			end

			if x_quality.index ~= y_quality.index then
				return x_quality.index > y_quality.index
			end

			if x_item.entry ~= y_item.entry then
				return x_item.entry < y_item.entry
			end

			return y < x
		end
	elseif index == 4 then
		local inventory_tradable = managers.blackmarket:get_inventory_tradable()
		local x_item, y_item, x_td, y_td, x_rarity, y_rarity

		return function(x, y)
			x_item = inventory_tradable[x]
			y_item = inventory_tradable[y]
			x_td = (tweak_data.economy[x_item.category] or tweak_data.blackmarket[x_item.category])[x_item.entry]
			y_td = (tweak_data.economy[y_item.category] or tweak_data.blackmarket[y_item.category])[y_item.entry]
			x_rarity = tweak_data.economy.rarities[x_td.rarity or "common"]
			y_rarity = tweak_data.economy.rarities[y_td.rarity or "common"]

			if x_rarity.index ~= y_rarity.index then
				return x_rarity.index > y_rarity.index
			end

			if x_item.entry ~= y_item.entry then
				return x_item.entry < y_item.entry
			end

			return y < x
		end
	elseif index == 5 then
		local inventory_tradable = managers.blackmarket:get_inventory_tradable()
		local x_item, y_item

		return function(x, y)
			x_item = inventory_tradable[x]
			y_item = inventory_tradable[y]

			if x_item.category ~= y_item.category then
				return x_item.category < y_item.category
			end

			if x_item.entry ~= y_item.entry then
				return x_item.entry < y_item.entry
			end

			return y < x
		end
	elseif index == 6 then
		local inventory_tradable = managers.blackmarket:get_inventory_tradable()
		local x_item, y_item

		return function(x, y)
			x_item = inventory_tradable[x]
			y_item = inventory_tradable[y]

			if x_item.bonus ~= y_item.bonus then
				return x_item.bonus
			end

			if x_item.entry ~= y_item.entry then
				return x_item.entry < y_item.entry
			end

			return y < x
		end
	end

	return nil
end

function GuiTweakData:tradable_inventory_sort_name(index)
	return self.tradable_inventory_sort_list[index] or "none"
end

function GuiTweakData:tradable_inventory_sort_index(name)
	for index, n in ipairs(self.tradable_inventory_sort_list) do
		if n == name then
			return index
		end
	end

	return 0
end

function GuiTweakData:get_locked_sort_number(dlc, ...)
	local dlc_data = dlc and Global.dlc_manager.all_dlc_data[dlc]
	local is_dlc_locked = dlc and not managers.dlc:is_dlc_unlocked(dlc) or false
	local other_locks = {
		...
	}
	local dlc_sort_number = 2 + #other_locks

	if dlc_data and not dlc_data.external and is_dlc_locked then
		return dlc_data.source_id and 0 or dlc_data.app_id and dlc_sort_number or dlc_sort_number + 1
	elseif is_dlc_locked and not dlc_data then
		return dlc_sort_number
	end

	for sort_number_index, lock in ipairs(other_locks) do
		if lock then
			return 1 + sort_number_index
		end
	end

	return 1
end
