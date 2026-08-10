core:module("PlatformManager")
core:import("CoreEvent")

local empty_vector = Vector3()
local tmp_vector = Vector3()

PlatformManager = PlatformManager or class()
PlatformManager.PLATFORM_CLASS_MAP = {}

function PlatformManager:new(...)
	return (self.PLATFORM_CLASS_MAP[Idstring("WIN32"):key()] or GenericPlatformManager):new(...)
end

GenericPlatformManager = GenericPlatformManager or class()

function GenericPlatformManager:init()
	self._event_queue_list = {}
	self._event_callback_handler_map = {}
	self._current_presence = "Idle"
	self._current_rich_presence = "Idle"
end

function GenericPlatformManager:event(event_type, ...)
	table.insert(self._event_queue_list, {
		event_type = event_type,
		param_list = {
			...
		}
	})
end

function GenericPlatformManager:destroy_context()
	return
end

function GenericPlatformManager:add_event_callback(event_type, callback_func)
	self._event_callback_handler_map[event_type] = self._event_callback_handler_map[event_type] or CoreEvent.CallbackEventHandler:new()

	self._event_callback_handler_map[event_type]:add(callback_func)
end

function GenericPlatformManager:remove_event_callback(event_type, callback_func)
	assert(event_type and self._event_callback_handler_map[event_type], "Tried to remove non-existing callback on event type \"" .. tostring(event_type) .. "\".")
	self._event_callback_handler_map[event_type]:remove(callback_func)

	if not next(self._event_callback_handler_map[event_type]) then
		self._event_callback_handler_map[event_type] = nil
	end
end

function GenericPlatformManager:update(t, dt)
	if next(self._event_queue_list) then
		for _, event in ipairs(self._event_queue_list) do
			local callback_handler = self._event_callback_handler_map[event.event_type]

			if callback_handler then
				callback_handler:dispatch(unpack(event.param_list))
			end
		end

		self._event_queue_list = {}
	end
end

function GenericPlatformManager:paused_update(t, dt)
	self:update(t, dt)
end

function GenericPlatformManager:set_presence(name)
	self._current_presence = name
end

function GenericPlatformManager:presence()
	return self._current_presence
end

function GenericPlatformManager:set_rich_presence(Key, value)
	return
end

function GenericPlatformManager:set_rich_presence_state(name)
	self._current_rich_presence = name
end

function GenericPlatformManager:refresh_rich_presence_state()
	self:set_rich_presence_state(self._current_rich_presence)
end

function GenericPlatformManager:rich_presence_state()
	return self._current_rich_presence
end

function GenericPlatformManager:translate_path(path)
	return string.gsub(path, "/+([~/]*)", "\\%1")
end

function GenericPlatformManager:set_playing(is_playing)
	Global.game_settings.is_playing = is_playing
end

function GenericPlatformManager:set_progress(progress)
	return
end

function GenericPlatformManager:set_feedback_color(color)
	return
end

WinPlatformManager = WinPlatformManager or class(GenericPlatformManager)
PlatformManager.PLATFORM_CLASS_MAP[_G.Idstring("WIN32"):key()] = WinPlatformManager

local is_steam = IS_STEAM
local is_epic = IS_EPIC
local is_mm_eos = IS_EPIC_MM

function WinPlatformManager:set_rich_presence(key, value)
	if is_steam then
		Steam:set_rich_presence(key, value)
	elseif is_epic then
		-- Nothing
	end
end

function WinPlatformManager:set_rich_presence_state(name)
	self._current_rich_presence = name

	if not Global.game_settings.single_player then
		if name == "Idle" then
			if is_steam then
				self:set_rich_presence("status", "")
				self:set_rich_presence("steam_display", "")

				if is_mm_eos then
					self:set_rich_presence("connect", "")
				end
			end
		elseif managers.network.matchmake.lobby_handler then
			local rich_presence_allowed = true

			rich_presence_allowed = rich_presence_allowed and Global.game_settings.permission ~= "private"

			if not rich_presence_allowed then
				if is_steam then
					self:set_rich_presence("status", "")
					self:set_rich_presence("steam_display", "")

					if is_mm_eos then
						self:set_rich_presence("connect", "")
					end
				end

				return
			end

			local in_lobby = _G.game_state_machine:verify_game_state(_G.GameStateFilters.lobby)
			local is_multi_day = #(managers.job:current_job_chain_data() or {}) > 1
			local job_tweak = managers.job:current_job_data()
			local display_token
			local heist_token = job_tweak and job_tweak.name_id
			local difficulty
			local heist_day = is_multi_day and tostring(managers.job:current_stage())
			local peer_count = tostring(#managers.network:session():all_peers())
			local max_peers = tostring(_G.tweak_data.max_players)
			local lobby_id = managers.network.matchmake.lobby_handler:id()
			local crime_spree_rank

			if in_lobby and job_tweak then
				display_token = "#in_lobby_heist"
			elseif in_lobby then
				display_token = "#in_lobby"
			elseif job_tweak and is_multi_day then
				display_token = "#in_heist_multi_day"
			elseif job_tweak then
				display_token = "#in_heist_one_day"
			end

			if managers.job:has_active_job() then
				local difficulty_stars = managers.job:current_difficulty_stars()

				difficulty = tostring(difficulty_stars)
			end

			if not in_lobby and managers.crime_spree and managers.crime_spree:is_active() then
				local level_id = Global.game_settings.level_id
				local name_id = level_id and _G.tweak_data.levels[level_id] and _G.tweak_data.levels[level_id].name_id

				heist_token = name_id and name_id or heist_token
				display_token = display_token .. "_cs"
				crime_spree_rank = managers.experience:cash_string(managers.crime_spree:spree_level(), "")
				difficulty = nil
			end

			local rp_pairs = {
				day = heist_day or "",
				difficulty = difficulty or "",
				heist_token = heist_token or "",
				max_peers = max_peers,
				crime_spree_rank = crime_spree_rank or ""
			}

			if is_steam then
				rp_pairs.steam_display = display_token or ""
				rp_pairs.steam_player_group = lobby_id
				rp_pairs.steam_player_group_size = peer_count
				rp_pairs.status = self:_build_legacy_presence_string()

				if is_mm_eos and lobby_id and managers.network.account.connect_string then
					local connect_string = string.format("%s %s", managers.network.account.connect_string, lobby_id)

					self:set_rich_presence("connect", connect_string)
				end
			end

			for key, value in pairs(rp_pairs) do
				self:set_rich_presence(key, value)
			end
		end
	end

	self:set_rich_presence_discord(name)
end

function WinPlatformManager:_build_legacy_presence_string()
	local presence = ""
	local in_lobby = _G.game_state_machine and (_G.game_state_machine:current_state_name() == "ingame_lobby_menu" or _G.game_state_machine:current_state_name() == "menu_main")
	local job_data = managers.job:current_job_data()
	local job_name = job_data and managers.localization:text(job_data.name_id) or "no heist"

	if managers.crime_spree and managers.crime_spree:is_active() then
		local level_id = Global.game_settings.level_id
		local name_id = level_id and _G.tweak_data.levels[level_id] and _G.tweak_data.levels[level_id].name_id

		job_name = name_id and managers.localization:text(name_id) or job_name
	end

	if in_lobby then
		if job_data then
			presence = presence .. managers.localization:text("steam_rp_in_lobby_heist", {
				heist = job_name
			})
		else
			presence = presence .. managers.localization:text("steam_rp_in_lobby")
		end
	elseif job_data then
		if #(managers.job:current_job_chain_data() or {}) > 1 then
			presence = presence .. managers.localization:text("steam_rp_current_heist_multi_day", {
				heist = job_name,
				day = tostring(managers.job:current_stage())
			})
		else
			presence = presence .. managers.localization:text("steam_rp_current_heist_one_day", {
				heist = job_name
			})
		end
	end

	presence = presence .. "\n" .. managers.localization:text("steam_rp_current_players", {
		current = tostring(#managers.network:session():all_peers()),
		max = tostring(_G.tweak_data.max_players)
	})

	if managers.crime_spree and managers.crime_spree:is_active() then
		presence = presence .. "\n" .. managers.localization:text("steam_rp_current_spree", {
			level = managers.experience:cash_string(managers.crime_spree:spree_level(), "")
		})
	elseif managers.job:has_active_job() then
		local difficulty_stars = managers.job:current_difficulty_stars()
		local difficulty = _G.tweak_data.difficulties[managers.job:current_difficulty_stars() + 2] or 1

		presence = presence .. "\n" .. managers.localization:text("steam_rp_current_difficulty", {
			difficulty = managers.localization:to_upper_text(_G.tweak_data.difficulty_name_ids[difficulty])
		})
	end

	return presence
end

function WinPlatformManager:update_discord_party_size()
	if Global.game_settings.permission == "private" then
		return
	end

	local name = self._current_rich_presence

	if name == "MPLobby" or name == "MPPlaying" then
		Discord:set_party_size(managers.network:session():amount_of_players(), _G.tweak_data and _G.tweak_data.max_players or 4)
		print("[Discord] update_discord_party_size", managers.network:session():amount_of_players())
	else
		Discord:set_party_size(0, 0)
	end
end

function WinPlatformManager:update_discord_character()
	if Global.game_settings.permission == "private" then
		return
	end

	local character = _G.CriminalsManager.convert_old_to_new_character_workname(managers.blackmarket:get_preferred_character())
	local character_name = managers.localization:text("menu_" .. managers.blackmarket:get_preferred_character())
	local small_image = "c_" .. character

	Discord:set_small_image(small_image, character_name)
	print("[Discord] update_discord_character", small_image, character_name)
end

function WinPlatformManager:update_discord_heist()
	if Global.game_settings.permission == "private" then
		return
	end

	local name = self._current_rich_presence

	if name == "MPLobby" then
		local job_data = managers.job:current_job_data()
		local job_name = job_data and managers.localization:text(job_data.name_id) or "No Heist selected"
		local job_id = job_data and job_data.name_id or "no_briefheist"
		local job_difficulty = _G.tweak_data.difficulties[managers.job:current_difficulty_stars() + 2] or 1
		local job_difficulty_text = managers.localization:to_upper_text(_G.tweak_data.difficulty_name_ids[job_difficulty])

		if job_name == "No Heist selected" then
			job_difficulty_text = "-"
		end

		local day_string = ""

		if #(managers.job:current_job_chain_data() or {}) > 1 then
			day_string = managers.localization:text("discord_rp_day_string", {
				day = tostring(managers.job:current_stage())
			})
		end

		if managers.crime_spree and managers.crime_spree:is_active() then
			local level_id = Global.game_settings.level_id
			local name_id = level_id and _G.tweak_data.levels[level_id] and _G.tweak_data.levels[level_id].name_id

			job_name = name_id and managers.localization:text(name_id) or job_name
		end

		local large_image = job_id

		print("[Discord] update_discord_heist", job_name, large_image)
		Discord:set_status(managers.localization:text("discord_rp_lobby"), managers.localization:text("discord_rp_lobby_details", {
			heist = job_name,
			difficulty = job_difficulty_text,
			day = day_string
		}))
		Discord:set_large_image(large_image, job_name)
	end
end

function WinPlatformManager:set_rich_presence_discord(name)
	Discord:set_status("", "")
	Discord:set_start_time(0)
	Discord:set_large_image("cover", "PAYDAY 2")
	Discord:set_small_image("", "")
	Discord:set_party_size(0, 0)

	if Global.game_settings.permission == "private" then
		return
	end

	local character = _G.CriminalsManager.convert_old_to_new_character_workname(managers.blackmarket:get_preferred_character())
	local character_name = managers.localization:text("menu_" .. managers.blackmarket:get_preferred_character())
	local small_image = "c_" .. character

	Discord:set_small_image(small_image, character_name)

	local in_lobby = _G.game_state_machine and (_G.game_state_machine:current_state_name() == "ingame_lobby_menu" or _G.game_state_machine:current_state_name() == "menu_main")
	local job_data = managers.job:current_job_data()
	local job_name = job_data and managers.localization:text(job_data.name_id) or "No Heist selected"
	local job_id = job_data and job_data.name_id or "no_briefheist"
	local playing = self._current_presence == "Playing" or false
	local job_difficulty = _G.tweak_data.difficulties[managers.job:current_difficulty_stars() + 2] or 1
	local job_difficulty_text = managers.localization:to_upper_text(_G.tweak_data.difficulty_name_ids[job_difficulty])

	if job_name == "No Heist selected" then
		job_difficulty_text = "-"
	end

	local day_string = ""

	if #(managers.job:current_job_chain_data() or {}) > 1 then
		day_string = managers.localization:text("discord_rp_day_string", {
			day = tostring(managers.job:current_stage())
		})
	end

	if managers.crime_spree and managers.crime_spree:is_active() then
		local level_id = Global.game_settings.level_id
		local name_id = level_id and _G.tweak_data.levels[level_id] and _G.tweak_data.levels[level_id].name_id

		job_name = name_id and managers.localization:text(name_id) or job_name
	end

	local large_image = job_id

	print("[Discord] set_rich_presence", name, Application:time())
	print("[Discord] RP data 1/2", self._current_presence, in_lobby, job_name, job_id, day_string)
	print("[Discord] RP data 2/2", large_image, character, character_name, small_image)

	local max_players = _G.tweak_data and _G.tweak_data.max_players or 4

	if name == "MPLobby" then
		Discord:set_status(managers.localization:text("discord_rp_lobby"), managers.localization:text("discord_rp_lobby_details", {
			heist = job_name,
			difficulty = job_difficulty_text,
			day = day_string
		}))
		Discord:set_party_size(managers.network:session():amount_of_players(), max_players)
		Discord:set_start_time(0)
		Discord:set_large_image(large_image, job_name)
		Discord:set_small_image(small_image, character_name)
	elseif name == "SafeHousePlaying" then
		Discord:set_status(managers.localization:text("discord_rp_safehouse"), managers.localization:text("discord_rp_safehouse_details", {
			heist = job_name
		}))

		if playing then
			Discord:set_start_time_relative(0)
		end
	elseif name == "SPPlaying" then
		Discord:set_status(managers.localization:text("discord_rp_single_heist"), managers.localization:text("discord_rp_single_heist_details", {
			heist = job_name,
			difficulty = job_difficulty_text,
			day = day_string
		}))

		if playing then
			Discord:set_start_time_relative(0)
		end

		Discord:set_large_image(large_image, job_name)
		Discord:set_small_image(small_image, character_name)
	elseif name == "MPPlaying" then
		Discord:set_status(managers.localization:text("discord_rp_mp_heist"), managers.localization:text("discord_rp_mp_heist_details", {
			heist = job_name,
			difficulty = job_difficulty_text,
			day = day_string
		}))
		Discord:set_party_size(managers.network:session():amount_of_players(), max_players)

		if playing then
			Discord:set_start_time_relative(0)
		end

		Discord:set_large_image(large_image, job_name)
		Discord:set_small_image(small_image, character_name)
	elseif name == "SPEnd" then
		Discord:set_status(managers.localization:text("discord_rp_single_end"), managers.localization:text("discord_rp_single_end_details", {
			heist = job_name,
			day = day_string
		}))
		Discord:set_start_time(0)
		Discord:set_large_image(large_image, job_name)
		Discord:set_small_image(small_image, character_name)
	elseif name == "MPEnd" then
		Discord:set_status(managers.localization:text("discord_rp_mp_end"), managers.localization:text("discord_rp_mp_end_details", {
			heist = job_name,
			day = day_string
		}))
		Discord:set_start_time(0)
		Discord:set_large_image(large_image, job_name)
		Discord:set_small_image(small_image, character_name)
	end
end
