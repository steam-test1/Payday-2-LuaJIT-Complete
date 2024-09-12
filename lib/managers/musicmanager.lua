MusicManager = MusicManager or class(CoreMusicManager)

function MusicManager:init()
	MusicManager.super.init(self)
	self:post_event("music_uno_fade_reset")
end

function MusicManager:init_globals(...)
	MusicManager.super.init_globals(self, ...)

	Global.music_manager.track_attachment = {}
	Global.music_manager.custom_playlist = {}
	Global.music_manager.custom_menu_playlist = {}
	Global.music_manager.custom_ghost_playlist = {}
	Global.music_manager.unlocked_tracks = {}
	Global.music_manager.loadout_selection = "heist"
	Global.music_manager.loadout_selection_ghost = "heist"

	self:_set_default_values()
end

function MusicManager:on_steam_overlay_open()
	if game_state_machine:current_state_name() == "menu_main" then
		self:clbk_game_has_music_control(false)
	end
end

function MusicManager:on_steam_overlay_close()
	if SystemInfo:platform() ~= Idstring("X360") then
		self:clbk_game_has_music_control(true)
	end
end

function MusicManager:stop()
	MusicManager.super.stop(self)

	Global.music_manager.current_music_ext = nil
end

function MusicManager:on_mission_end()
	self:post_event("music_uno_fade_reset")
end

function MusicManager:track_listen_start(event, track)
	if self._current_track == track and self._current_event == event then
		return
	end

	self._skip_play = true

	Global.music_manager.source:stop()

	if track then
		Global.music_manager.source:set_switch("music_randomizer", track)
	end

	Global.music_manager.source:post_event(event)

	self._current_track = track
	self._current_event = event
end

function MusicManager:track_listen_stop()
	if self._current_event then
		Global.music_manager.source:post_event("stop_all_music")

		if Global.music_manager.current_event then
			Global.music_manager.source:post_event(Global.music_manager.current_event)
		end
	end

	if self._current_track and Global.music_manager.current_track then
		Global.music_manager.source:set_switch("music_randomizer", Global.music_manager.current_track)
	end

	self._current_event = nil
	self._current_track = nil
	self._skip_play = nil
end

function MusicManager:playlist()
	return Global.music_manager.custom_playlist
end

function MusicManager:playlist_add(track)
	table.insert(Global.music_manager.custom_playlist, track)
end

function MusicManager:playlist_remove(track)
	for index, track_name in pairs(Global.music_manager.custom_playlist) do
		if track == track_name then
			table.remove(Global.music_manager.custom_playlist, index)

			break
		end
	end
end

function MusicManager:playlist_clear()
	Global.music_manager.custom_playlist = {}
end

function MusicManager:playlist_contains(track)
	return table.contains(Global.music_manager.custom_playlist, track)
end

function MusicManager:playlist_menu()
	return Global.music_manager.custom_menu_playlist
end

function MusicManager:playlist_menu_add(track)
	table.insert(Global.music_manager.custom_menu_playlist, track)
end

function MusicManager:playlist_menu_remove(track)
	for index, track_name in pairs(Global.music_manager.custom_menu_playlist) do
		if track == track_name then
			table.remove(Global.music_manager.custom_menu_playlist, index)

			break
		end
	end
end

function MusicManager:playlist_menu_clear()
	Global.music_manager.custom_menu_playlist = {}
end

function MusicManager:playlist_menu_contains(track)
	return table.contains(Global.music_manager.custom_menu_playlist, track)
end

function MusicManager:track_attachment(name)
	return Global.music_manager.track_attachment[name]
end

function MusicManager:track_attachment_add(name, track)
	Global.music_manager.track_attachment[name] = track
end

function MusicManager:track_attachment_clear()
	Global.music_manager.track_attachment = {}
end

function MusicManager:unlock_track(name)
	Global.music_manager.unlocked_tracks[name] = true
end

function MusicManager:track_unlocked(name)
	return Global.music_manager.unlocked_tracks[name]
end

function MusicManager:playlist_ghost()
	return Global.music_manager.custom_ghost_playlist
end

function MusicManager:playlist_ghost_add(track)
	table.insert(Global.music_manager.custom_ghost_playlist, track)
end

function MusicManager:playlist_ghost_remove(track)
	for index, track_name in pairs(Global.music_manager.custom_ghost_playlist) do
		if track == track_name then
			table.remove(Global.music_manager.custom_ghost_playlist, index)

			break
		end
	end
end

function MusicManager:playlist_ghost_clear()
	Global.music_manager.custom_ghost_playlist = {}
end

function MusicManager:playlist_ghost_contains(track)
	return table.contains(Global.music_manager.custom_ghost_playlist, track)
end

function MusicManager:check_music_ext_ghost()
	local music, start_switch = tweak_data.levels:get_music_event_ext_ghost()
	Global.music_manager.current_music_ext = music

	if music then
		self:post_event(music)
		self:post_event(start_switch)
	end
end

function MusicManager:music_ext_listen_start(music_ext)
	if self._current_music_ext == music_ext then
		return
	end

	self._skip_play = true

	Global.music_manager.source:stop()
	Global.music_manager.source:post_event(music_ext)
	Global.music_manager.source:post_event("suspense_4")

	self._current_music_ext = music_ext
end

function MusicManager:music_ext_listen_stop()
	if self._current_music_ext then
		Global.music_manager.source:post_event("stop_all_music")
	end

	self._current_music_ext = nil
	self._skip_play = nil
end

function MusicManager:stop_listen_all()
	if self._current_music_ext or self._current_event then
		Global.music_manager.source:post_event("stop_all_music")
	end

	if self._current_music_ext and Global.music_manager.current_music_ext then
		Global.music_manager.source:post_event(Global.music_manager.current_music_ext)
	end

	if self._current_event and Global.music_manager.current_event then
		Global.music_manager.source:post_event(Global.music_manager.current_event)
	end

	if self._current_track and Global.music_manager.current_track then
		Global.music_manager.source:set_switch("music_randomizer", Global.music_manager.current_track)
	end

	self._current_music_ext = nil
	self._current_event = nil
	self._current_track = nil
	self._skip_play = nil
end

function MusicManager:jukebox_ghost_specific()
	if managers.job:interupt_stage() then
		return "heist"
	end

	local job_data = Global.job_manager.current_job

	if job_data then
		local job_tweak = tweak_data.narrative:job_data(job_data.job_id)

		if job_tweak then
			local track_data = job_tweak.name_id .. (job_data.stages > 1 and job_data.current_stage or "")

			return self:track_attachment(track_data) or "heist"
		end
	end

	if managers.crime_spree:is_active() then
		local narrative_data, day, variant = managers.crime_spree:get_narrative_tweak_data_for_mission_level(managers.crime_spree:current_mission())

		if narrative_data then
			local track_data = narrative_data.name_id .. ((narrative_data.stages or 1) > 1 and tostring(day) or "")

			return self:track_attachment(track_data) or "heist"
		end
	end

	return "heist"
end

function MusicManager:_verify_tracks()
	self:_heist_sah_track_fix()

	local track_name = nil
	local tracks_locked = self:get_tracks_locked()

	for i = #Global.music_manager.custom_playlist, 1, -1 do
		track_name = Global.music_manager.custom_playlist[i]

		if tracks_locked[track_name] then
			table.remove(Global.music_manager.custom_playlist, i)
		end
	end

	for i = #Global.music_manager.custom_menu_playlist, 1, -1 do
		track_name = Global.music_manager.custom_menu_playlist[i]

		if tracks_locked[track_name] then
			table.remove(Global.music_manager.custom_menu_playlist, i)
		end
	end

	for i = #Global.music_manager.custom_ghost_playlist, 1, -1 do
		track_name = Global.music_manager.custom_ghost_playlist[i]

		if tracks_locked[track_name] then
			table.remove(Global.music_manager.custom_ghost_playlist, i)
		end
	end

	for name, track_name in pairs(Global.music_manager.track_attachment) do
		if tracks_locked[track_name] then
			Global.music_manager.track_attachment[name] = "all"
		end
	end
end

function MusicManager:_heist_sah_track_fix()
	for _, data in ipairs(tweak_data.music.track_ghost_list) do
		if Global.music_manager.track_attachment.heist_sah == data.track then
			Global.music_manager.track_attachment.heist_sah = "track_61"

			return
		end
	end
end

function MusicManager:save_settings(data)
	local state = {
		custom_playlist = Global.music_manager.custom_playlist,
		custom_menu_playlist = Global.music_manager.custom_menu_playlist,
		custom_ghost_playlist = Global.music_manager.custom_ghost_playlist,
		track_attachment = Global.music_manager.track_attachment,
		unlocked_tracks = Global.music_manager.unlocked_tracks
	}
	data.MusicManager = state
end

function MusicManager:load_settings(data)
	local state = data.MusicManager

	if state then
		Global.music_manager.custom_playlist = state.custom_playlist or {}
		Global.music_manager.custom_menu_playlist = state.custom_menu_playlist or {}
		Global.music_manager.custom_ghost_playlist = state.custom_ghost_playlist or {}
		Global.music_manager.track_attachment = state.track_attachment or {}
		Global.music_manager.unlocked_tracks = state.unlocked_tracks or {}

		self:_verify_tracks()
		self:_set_default_values()
	end

	if managers.network and SystemInfo:distribution() == Idstring("STEAM") and not self._added_overlay_listeners then
		managers.network.account:add_overlay_listener("steam_music_manager_open", {
			"overlay_open"
		}, callback(self, self, "on_steam_overlay_open"))
		managers.network.account:add_overlay_listener("steam_music_manager_close", {
			"overlay_close"
		}, callback(self, self, "on_steam_overlay_close"))

		self._added_overlay_listeners = true
	end
end

function MusicManager:save_profile(data)
	local state = {
		loadout_selection = Global.music_manager.loadout_selection,
		loadout_selection_ghost = Global.music_manager.loadout_selection_ghost
	}
	data.MusicManager = state
end

function MusicManager:load_profile(data)
	local state = data.MusicManager

	if state then
		Global.music_manager.loadout_selection = state.loadout_selection
		Global.music_manager.loadout_selection_ghost = state.loadout_selection_ghost
	end
end

function MusicManager:save(data)
	MusicManager.super.save(self, data)

	local state = data.CoreMusicManager or {}

	if game_state_machine:current_state_name() ~= "ingame_waiting_for_players" then
		state.music_ext = Global.music_manager.current_music_ext
	end

	data.CoreMusicManager = state
end

function MusicManager:load(data)
	local state = data.CoreMusicManager

	if state.music_ext then
		self:post_event(state.music_ext)
	end

	MusicManager.super.load(self, data)
end

function MusicManager:current_track_string()
	local level_data = Global.level_data.level_id and tweak_data.levels[Global.level_data.level_id]
	local music_style = tweak_data.levels:get_music_style_from_level_data(level_data)

	if music_style == "heist" then
		if Global.music_manager.current_track then
			return managers.localization:to_upper_text("menu_jukebox_" .. Global.music_manager.current_track)
		end
	elseif music_style == "ghost" then
		if Global.music_manager.current_music_ext then
			return managers.localization:to_upper_text("menu_jukebox_screen_" .. Global.music_manager.current_music_ext)
		end
	elseif Global.level_data.level_id then
		return managers.localization:to_upper_text("menu_jukebox_track_" .. Global.level_data.level_id)
	end

	return ""
end

function MusicManager:jukebox_random_all()
	local switches = {}
	local track_list, track_locked = self:jukebox_music_tracks()

	for _, track_name in ipairs(track_list) do
		if not track_locked[track_name] then
			table.insert(switches, track_name)
		end
	end

	return switches
end

function MusicManager:jukebox_random_all_menu()
	local switches = {}
	local track_list, track_locked = self:jukebox_menu_tracks()

	for _, track_name in ipairs(track_list) do
		if not track_locked[track_name] then
			table.insert(switches, track_name)
		end
	end

	return switches
end

function MusicManager:jukebox_random_all_ghost()
	local switches = {}
	local track_list, track_locked = self:jukebox_ghost_tracks()

	for _, track_name in ipairs(track_list) do
		if not track_locked[track_name] then
			table.insert(switches, track_name)
		end
	end

	return switches
end

function MusicManager:jukebox_set_defaults()
	self:playlist_clear()

	local tracks_list, tracks_locked = self:jukebox_music_tracks()

	for _, track_name in pairs(tracks_list) do
		if not tracks_locked[track_name] then
			self:playlist_add(track_name)
		end
	end

	self:playlist_menu_clear()

	local tracks_list, tracks_locked = self:jukebox_menu_tracks()

	for _, track_name in pairs(tracks_list) do
		if not tracks_locked[track_name] then
			self:playlist_menu_add(track_name)
		end
	end

	self:playlist_ghost_clear()

	local tracks_list, tracks_locked = self:jukebox_ghost_tracks()

	for _, track_name in pairs(tracks_list) do
		if not tracks_locked[track_name] then
			self:playlist_ghost_add(track_name)
		end
	end

	self:track_attachment_clear()

	local defaults = self:jukebox_default_tracks()

	for name, track in pairs(defaults) do
		self:track_attachment_add(name, track)
	end
end

function MusicManager:jukebox_heist_specific()
	if managers.job:interupt_stage() then
		return self:track_attachment("escape") or "all"
	end

	local job_data = Global.job_manager.current_job

	if job_data then
		local job_tweak = tweak_data.narrative:job_data(job_data.job_id)

		if job_tweak then
			local track_data = job_tweak.name_id .. (job_data.stages > 1 and job_data.current_stage or "")

			return self:track_attachment(track_data) or "all"
		end
	end

	if managers.crime_spree:is_active() then
		local narrative_data, day, variant = managers.crime_spree:get_narrative_tweak_data_for_mission_level(managers.crime_spree:current_mission())

		if narrative_data then
			local track_data = narrative_data.name_id .. ((narrative_data.stages or 1) > 1 and tostring(day) or "")

			return self:track_attachment(track_data) or "all"
		end
	end

	return "all"
end

function MusicManager:_set_default_values()
	if #Global.music_manager.custom_playlist == 0 then
		local tracks_list, tracks_locked = self:jukebox_music_tracks()

		for _, track_name in pairs(tracks_list) do
			if not tracks_locked[track_name] then
				table.insert(Global.music_manager.custom_playlist, track_name)
			end
		end
	end

	if #Global.music_manager.custom_menu_playlist == 0 then
		local tracks_list, tracks_locked = self:jukebox_menu_tracks()

		for _, track_name in pairs(tracks_list) do
			if not tracks_locked[track_name] then
				table.insert(Global.music_manager.custom_menu_playlist, track_name)
			end
		end
	end

	if #Global.music_manager.custom_ghost_playlist == 0 then
		local tracks_list, tracks_locked = self:jukebox_ghost_tracks()

		for _, track_name in pairs(tracks_list) do
			if not tracks_locked[track_name] then
				table.insert(Global.music_manager.custom_ghost_playlist, track_name)
			end
		end
	end

	local default_tracks = self:jukebox_default_tracks()

	for name, track in pairs(default_tracks) do
		if not Global.music_manager.track_attachment[name] then
			Global.music_manager.track_attachment[name] = track
		end
	end
end

function MusicManager:jukebox_menu_track(name)
	if managers.user:get_setting("event_music") then
		local event_tracks = tweak_data.music.event_track_overrides

		if event_tracks and event_tracks[name] then
			return event_tracks[name]
		end
	end

	local track = self:track_attachment(name)

	if track == "all" then
		local track_list = self:jukebox_random_all_menu()

		return track_list[math.random(#track_list)]
	elseif track == "playlist" then
		local track_list = managers.music:playlist_menu()

		return track_list[math.random(#track_list)]
	else
		return track
	end
end

function MusicManager:jukebox_ghost_track(name)
	local track = self:track_attachment(name)

	if track == "all" then
		local track_list = self:jukebox_random_all_ghost()

		return track_list[math.random(#track_list)]
	elseif track == "playlist" then
		local track_list = managers.music:playlist_ghost()

		return track_list[math.random(#track_list)]
	else
		return track
	end
end

function MusicManager:jukebox_default_tracks()
	local default_options = {
		heist_friend = "all",
		heist_fex = "track_71",
		heist_dinner = "track_35",
		heist_election_day2 = "track_05",
		heist_arm_fac = "all",
		heist_trai = "track_78",
		heist_born2 = "all",
		heist_welcome_to_the_jungle2 = "track_06",
		heist_mia2 = "all",
		heist_mia1 = "all",
		heist_crojob2 = "all",
		escape = "track_16",
		heist_nightclub = "track_05",
		heist_arm_hcm = "all",
		heist_framing_frame1 = "track_05",
		heist_moon = "track_49",
		heist_dah = "track_55",
		heist_framing_frame2 = "track_08",
		heist_roberts = "track_10",
		heist_mex = "track_65",
		heist_man = "all",
		heist_cane = "track_39",
		heist_mus = "all",
		heist_flat = "track_47_gen",
		heist_help = "track_48",
		heist_election_day1 = "track_04",
		heist_arm_for = "all",
		loadout = "loadout_music",
		heist_rat = "track_08",
		heist_family = "track_04",
		heist_arm_und = "all",
		heist_mex_cooking = "track_65",
		heist_glace = "track_53",
		heist_wwh = "track_54",
		heist_jewelry_store = "track_01",
		heist_watchdogs1 = "track_02",
		heist_born1 = "all",
		heist_rvd1 = "track_57",
		heist_rvd2 = "track_58",
		heist_des = "track_60",
		heist_pines = "track_23",
		mainmenu = "menu_music",
		credits = "criminals_ambition",
		heist_run = "track_52",
		heist_crojob1 = "all",
		heist_bph = "track_62_lcv",
		heist_nmh = "track_63",
		heist_vit = "track_64_lcv",
		heist_welcome_to_the_jungle1 = "track_04",
		heist_sah = "track_61",
		heist_firestarter3 = "track_02",
		heist_spa = "all",
		heist_bex = "track_68",
		heist_alex1 = "track_08",
		heist_pex = "track_69",
		heist_kenaz_full = "all",
		heist_framing_frame3 = "track_03",
		heist_alex3 = "track_02",
		heist_nail = "track_36",
		heist_chas = "track_72",
		heistfinish = "music_loot_drop",
		heist_sand = "track_73",
		heist_gallery = "track_05",
		heist_pent = "track_75",
		heist_mallcrasher = "track_03",
		heist_cage = "track_26",
		heist_hox_3 = "track_27",
		heist_alex2 = "track_07",
		heist_ranc = "track_76",
		heistlost = "resultscreen_lose",
		heist_haunted = "track_22",
		heist_mad = "track_44",
		heist_corp = "track_79",
		heist_deep = "track_80",
		heist_dark = "music_dark",
		heist_fish = "music_fish",
		heist_branchbank = "track_03",
		heist_hvh = "track_56",
		heist_red2 = "track_31",
		heist_shoutout_raid = "track_28",
		heist_hox1 = "track_20",
		heist_brb = "track_59",
		heist_arm_cro = "all",
		heist_chca = "track_74",
		heist_tag = "music_tag",
		heist_pbr = "all",
		heist_big = "all",
		heist_peta2 = "all",
		heist_hox2 = "track_21",
		heist_branchbank_deposit = "track_01",
		heist_peta1 = "all",
		heist_arm_par = "all",
		heist_four_stores = "track_01",
		heist_pbr2 = "all",
		heist_jolly = "track_30",
		heist_ukrainian_job = "track_07",
		heist_watchdogs2 = "track_06",
		heist_branchbank_cash = "track_07",
		heistresult = "resultscreen_win",
		heist_firestarter1 = "track_08",
		heist_branchbank_gold = "track_04",
		heist_firestarter2 = "track_06",
		heist_kosugi = "kosugi_music",
		heist_pal = "all"
	}

	if managers.dlc:has_dlc_or_soundtrack_or_cce("armored_transport") then
		default_options.heist_arm_cro = "track_09"
		default_options.heist_arm_hcm = "track_09"
		default_options.heist_arm_fac = "track_09"
		default_options.heist_arm_par = "track_09"
		default_options.heist_arm_for = "track_09"
		default_options.heist_arm_und = "track_09"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("big_bank") then
		default_options.heist_big = "track_14"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("hl_miami") then
		default_options.heist_mia1 = "track_18"
		default_options.heist_mia2 = "track_19"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("hope_diamond") then
		default_options.heist_mus = "track_24"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("the_bomb") then
		default_options.heist_crojob1 = "track_25"
		default_options.heist_crojob2 = "track_25"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("kenaz") then
		default_options.heist_kenaz_full = "track_29"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("berry") then
		default_options.heist_pbr = "track_37"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("berry") then
		default_options.heist_pbr2 = "track_38"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("peta") then
		default_options.heist_peta1 = "track_40"
		default_options.heist_peta2 = "track_41"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("pal") then
		default_options.heist_man = "track_43"
		default_options.heist_pal = "track_42"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("born") then
		default_options.heist_born1 = "track_45"
		default_options.heist_born2 = "track_46"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("friend") then
		default_options.heist_friend = "track_50"
	end

	if managers.dlc:has_dlc_or_soundtrack_or_cce("spa") then
		default_options.heist_spa = "track_51"
	end

	return default_options
end

function MusicManager:get_lock_data()
	if not managers.dlc or not managers.experience then
		return {}
	end

	if managers.dlc.has_catalog_ownerships and not managers.dlc:has_catalog_ownerships() then
		return {}
	end

	self._lock_data = self._lock_data or {
		alesso = managers.dlc:is_dlc_unlocked("arena"),
		armored = managers.dlc:has_dlc_or_soundtrack_or_cce("armored_transport"),
		assault = managers.dlc:has_dlc_or_soundtrack_or_cce("gage_pack_assault"),
		bigbank = managers.dlc:has_dlc_or_soundtrack_or_cce("big_bank"),
		bsides = managers.dlc:is_dlc_unlocked("bsides_soundtrack"),
		diamond = managers.dlc:has_dlc_or_soundtrack_or_cce("hope_diamond"),
		kenaz = managers.dlc:has_dlc_or_soundtrack_or_cce("kenaz"),
		miami = managers.dlc:has_dlc_or_soundtrack_or_cce("hl_miami"),
		payday = managers.dlc:is_dlc_unlocked("pdth_soundtrack"),
		soundtrack = managers.dlc:has_soundtrack_or_cce(),
		thebomb = managers.dlc:has_dlc_or_soundtrack_or_cce("the_bomb"),
		xmas = managers.dlc:is_dlc_unlocked("xmas_soundtrack"),
		berry = managers.dlc:is_dlc_unlocked("berry"),
		peta = managers.dlc:has_dlc_or_soundtrack_or_cce("peta"),
		pal = managers.dlc:has_dlc_or_soundtrack_or_cce("pal"),
		born = managers.dlc:has_dlc_or_soundtrack_or_cce("born"),
		born_wild = managers.dlc:has_dlc_or_soundtrack_or_cce("born") or managers.dlc:is_dlc_unlocked("wild"),
		friend = managers.dlc:is_dlc_unlocked("friend"),
		spa = managers.dlc:is_dlc_unlocked("spa"),
		fish = managers.dlc:is_dlc_unlocked("spa"),
		rvd = managers.dlc:is_dlc_unlocked("rvd"),
		tma1 = managers.dlc:is_dlc_unlocked("tma1"),
		mad = managers.dlc:is_dlc_unlocked("mad")
	}
	self._lock_data.infamy = managers.experience:current_rank() > 0
	self._lock_data.deathwish = managers.experience:current_rank() > 0 or tweak_data.difficulty_level_locks[tweak_data:difficulty_to_index("overkill_290")] <= managers.experience:current_level()

	return self._lock_data
end

function MusicManager:get_tracks_locked()
	local tracks_locked = {}

	local function add_locked(track_list)
		local _, locked = self:_jukebox_get_tracks(track_list)

		table.map_append(tracks_locked, locked)
	end

	add_locked(tweak_data.music.track_list)
	add_locked(tweak_data.music.track_menu_list)
	add_locked(tweak_data.music.track_ghost_list)

	return tracks_locked
end

function MusicManager:_jukebox_get_tracks(track_list)
	local lock_data = self:get_lock_data()
	local tracks = {}
	local tracks_locked = {}
	local is_locked, is_hidden = nil

	for _, data in ipairs(track_list) do
		is_locked = data.lock and not lock_data[data.lock] or false
		is_hidden = is_locked and data.hide_unavailable or false

		if not is_hidden then
			table.insert(tracks, data.track)
		end

		if is_locked then
			tracks_locked[data.track] = data.lock
		end
	end

	return tracks, tracks_locked
end

function MusicManager:jukebox_music_tracks()
	local lock_data = self:get_lock_data()

	for _, data in ipairs(tweak_data.music.track_list) do
		if not self:track_unlocked(data.track) and data.lock and lock_data[data.lock] then
			self:unlock_track(data.track)
			self:playlist_add(data.track)
		end
	end

	return self:_jukebox_get_tracks(tweak_data.music.track_list)
end

function MusicManager:jukebox_menu_tracks()
	return self:_jukebox_get_tracks(tweak_data.music.track_menu_list)
end

function MusicManager:jukebox_ghost_tracks()
	return self:_jukebox_get_tracks(tweak_data.music.track_ghost_list)
end

function MusicManager:music_tracks()
	return tweak_data.music.soundbank_list
end
