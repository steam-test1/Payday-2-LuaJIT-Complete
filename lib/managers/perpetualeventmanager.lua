local json = require("lib/utils/accelbyte/json")
PerpetualEventManager = PerpetualEventManager or class()

function PerpetualEventManager:init()
	self:_setup()
end

function PerpetualEventManager:init_finalize()
	if SystemInfo:matchmaking() == Idstring("MM_STEAM") and not Global.perpetual_manager.event_fetched then
		self:fetch_event()
	end

	if self:is_event_ready() then
		self:apply_event()
	end
end

function PerpetualEventManager:_setup()
	if not Global.perpetual_manager then
		Global.perpetual_manager = {
			active_event = false,
			event_fetched = false,
			packages_ready = false,
			tweak_data_func_name = false,
			loaded_packages = {}
		}

		self:_setup_events()
	end

	self._event_applied = false
	self._global = Global.perpetual_manager
end

function PerpetualEventManager:_setup_events()
	local events = {}
	Global.perpetual_manager.events = events
	events.anniversary = {
		has_gamemode_event = true,
		mutator_name = "MutatorPiggyRevenge",
		xp_bonuses = {
			bonus_piggyrevenge = {
				color = tweak_data.screen_colors.event_color,
				title = managers.localization:to_upper_text("menu_piggybank_exp_bonus")
			}
		},
		upgrades = {
			"money",
			"bessy",
			"piggy_hammer"
		},
		menu_scene = {
			presents = true,
			confetti = true,
			money_effect = false
		},
		packages = {
			"packages/pevent_anniversary"
		},
		date = {
			start = {
				day = 13,
				month = 8
			},
			stop = {
				day = 20,
				month = 8
			}
		}
	}
	events.winter_snow = {
		menu_scene = {
			xmas_snow = true,
			money_effect = false
		},
		packages = {
			"packages/pevent_winter_snow"
		},
		date = {
			start = {
				day = 1,
				month = 12
			},
			stop = {
				day = 31,
				month = 1
			}
		},
		tweak_data_func_name = "tweak_christmas_heists",
		upgrades = {
			"xmas_snowball"
		}
	}
	events.xmas_snow = {
		menu_scene = {
			xmas_snow = true,
			xmas_tree = true,
			money_effect = false
		},
		packages = {
			"packages/pevent_xmas_snow"
		},
		date = {
			start = {
				day = 23,
				month = 12
			},
			stop = {
				day = 12,
				month = 1
			}
		},
		santa_hats = true,
		holiday_tactics = "BTN_XMAS",
		tweak_data_func_name = "tweak_xmas",
		upgrades = {
			"xmas_snowball"
		}
	}
	events.xmas_gifts = {
		menu_scene = {
			presents = true,
			xmas_tree = true,
			money_effect = false
		},
		packages = {
			"packages/pevent_xmas_gifts"
		},
		date = {
			start = {
				day = 24,
				month = 12
			},
			stop = {
				day = 25,
				month = 12
			}
		},
		santa_hats = true,
		holiday_tactics = "BTN_XMAS",
		tweak_data_func_name = "tweak_xmas",
		upgrades = {
			"xmas_snowball"
		}
	}

	for event_name, event_data in pairs(events) do
		if not event_data.date then
			event_data.date = {
				start = {
					day = 1,
					month = 1
				},
				stop = {
					day = 31,
					month = 12
				}
			}
		elseif not event_data.date.start then
			event_data.date.start = {
				day = 1,
				month = 1
			}
		elseif not event_data.date.stop then
			event_data.date.stop = {
				day = 31,
				month = 12
			}
		end
	end
end

function PerpetualEventManager:is_event_ready()
	return self._global.event_fetched and self._global.packages_ready
end

function PerpetualEventManager:get_active_event()
	return self._global.events[self._global.active_event] or false
end

function PerpetualEventManager:_is_date_in_range(target_month, target_day, start_month, start_day, stop_month, stop_day)
	if start_month < stop_month or start_month == stop_month and start_day <= stop_day then
		return (start_month < target_month or target_month == start_month and start_day <= target_day) and (target_month < stop_month or target_month == stop_month and target_day <= stop_day)
	else
		return start_month < target_month or target_month == start_month and start_day <= target_day or target_month < stop_month or target_month == stop_month and target_day <= stop_day
	end
end

function PerpetualEventManager:fetch_event()
	if self._global.event_fetched then
		return
	end

	local login_time = managers.network.matchmake:login_time()
	local login_date = string.split(os.date("%m %d", login_time), " ")
	self._global.event_fetched = true

	self:_set_active_event_by_date(tonumber(login_date[1]), tonumber(login_date[2]))
end

function PerpetualEventManager:_set_active_event_by_date(target_month, target_day)
	local active_event = false
	local target_time = target_month * 100 + target_day
	local active_event_time_diff, event_time_diff, start_month, start_day, stop_month, stop_day = nil

	for event_name, event_data in pairs(self._global.events) do
		start_month = event_data.date.start.month
		start_day = event_data.date.start.day
		stop_month = event_data.date.stop.month
		stop_day = event_data.date.stop.day

		if self:_is_date_in_range(target_month, target_day, start_month, start_day, stop_month, stop_day) then
			event_time_diff = target_time - (start_month * 100 + start_day)

			if target_month < start_month then
				event_time_diff = event_time_diff + 1200
			end

			if not active_event or event_time_diff < active_event_time_diff then
				active_event_time_diff = event_time_diff
				active_event = event_name
			end
		end
	end

	self:_set_active_event(active_event)
end

function PerpetualEventManager:_set_active_event(active_event)
	if self._global.active_event then
		local active_event = self:get_active_event()
		local upgrades = active_event and active_event.upgrades or {}

		for _, upgrade in ipairs(upgrades) do
			managers.upgrades:unaquire(upgrade, "PerpetualEventManager")
		end

		if self._event_applied and managers.menu_scene then
			managers.menu_scene:remove_event_units()
		end
	end

	self._global.active_event = active_event
	local wanted_packages = {}

	if self._global.active_event then
		local active_event = self:get_active_event()
		local upgrades = active_event and active_event.upgrades or {}

		for _, upgrade in ipairs(upgrades) do
			managers.upgrades:aquire(upgrade, false, "PerpetualEventManager")
		end

		self._global.packages_ready = false
		wanted_packages = active_event and active_event.packages or {}
	end

	if self._global.loaded_packages then
		for package, loaded in pairs(self._global.loaded_packages) do
			if not table.contains(wanted_packages, package) then
				PackageManager:unload(package)
			end
		end
	end

	self._global.loaded_packages = {}

	for _, package in ipairs(wanted_packages) do
		self._global.loaded_packages[package] = PackageManager:loaded(package)
	end

	for package, loaded in pairs(self._global.loaded_packages) do
		if not loaded then
			PackageManager:load(package)

			self._global.loaded_packages[package] = true
		end
	end

	self._global.packages_ready = true

	if self._event_applied then
		self:apply_event()
	end
end

function PerpetualEventManager:apply_event()
	if managers.menu_scene then
		managers.menu_scene:setup_event_units()
	end

	local active_event = self:get_active_event()
	self._global.tweak_data_func_name = active_event and active_event.tweak_data_func_name or false
	local tweak_data_func = PerpetualEventManager.get_tweak_func()

	if tweak_data_func then
		tweak_data_func(tweak_data)
	end

	self._event_applied = true
end

function PerpetualEventManager:get_event_levels()
	local active_event = self:get_active_event()

	return active_event and active_event.event_levels
end

function PerpetualEventManager:get_menu_scene()
	local active_event = self:get_active_event()

	return active_event and active_event.menu_scene
end

function PerpetualEventManager:get_holiday_tactics()
	local active_event = self:get_active_event()

	return active_event and active_event.holiday_tactics
end

function PerpetualEventManager:has_event_gamemode()
	local active_event = self:get_active_event()

	return active_event and active_event.has_gamemode_event or false
end

function PerpetualEventManager:has_event_santa_hats()
	local active_event = self:get_active_event()

	return active_event and active_event.santa_hats or false
end

function PerpetualEventManager:has_event_upgrade(upgrade)
	local active_event = self:get_active_event()

	return active_event and active_event.upgrades and table.contains(active_event.upgrades, upgrade) or false
end

function PerpetualEventManager:play_single_player()
	managers.crimenet:set_sidebar_exclude_filter({
		"menu_event_a10th_info"
	})
end

function PerpetualEventManager:play_online_game()
	managers.crimenet:set_sidebar_exclude_filter({
		"menu_event_a10th_info"
	})
end

function PerpetualEventManager:play_event_game()
	local active_event = self:get_active_event()
	local active_mutator = active_event and active_event.mutator_name and CoreSerialize.string_to_classtable(active_event.mutator_name)

	if active_mutator then
		managers.mutators:set_enabled(managers.mutators:get_mutator(active_mutator), true)
	end
end

function PerpetualEventManager:on_enter_lobby()
	local track_override = managers.mutators:get_track_override("lobby")

	if track_override then
		managers.music:post_event(track_override)
	end
end

function PerpetualEventManager:add_event_xp_bonuses(bonuses_list, bonuses_params)
	local active_event = self:get_active_event()
	local xp_bonuses = active_event and active_event.xp_bonuses or {}
	local sorted_bonuses = table.map_keys(xp_bonuses)

	for _, bonus in ipairs(sorted_bonuses) do
		table.insert(bonuses_list, bonus)

		bonuses_params[bonus] = xp_bonuses[bonus]
	end
end

function PerpetualEventManager:setup_contract_broker_tabs(tabs, index)
	local holiday_tactics = self:get_holiday_tactics()

	if holiday_tactics then
		table.insert(tabs, index, {
			"menu_filter_tactic",
			"_setup_filter_gamemode_tactic"
		})
	end
end

function PerpetualEventManager:setup_contract_broker_filter_tactic(tactics, index)
	local holiday_tactics = self:get_holiday_tactics()

	if holiday_tactics then
		tactics[index] = {
			"menu_filter_tactic_holiday",
			{
				event_icon = managers.localization:get_default_macro(holiday_tactics)
			}
		}
	end
end

function PerpetualEventManager:perform_contract_filter_tactic(level_data)
	local holiday_tactics = self:get_holiday_tactics()

	if holiday_tactics == "BTN_XMAS" then
		return level_data.is_christmas_heist ~= nil
	end

	return false
end

function PerpetualEventManager:get_team_setup(teams)
	if managers.mutators:is_mutator_active(MutatorCG22) then
		local team_ids = {}

		for team_id, team_data in pairs(teams) do
			team_data.friends = team_data.friends or {}
			team_data.friends.cg22 = true

			table.insert(team_ids, team_id)
		end

		teams.cg22 = {
			foes = {},
			friends = {}
		}

		for _, team_id in ipairs(team_ids) do
			teams.cg22.friends[team_id] = true
		end
	end
end

function PerpetualEventManager.get_tweak_func()
	return Global.perpetual_manager and Global.perpetual_manager.tweak_data_func_name and PerpetualEventManager[Global.perpetual_manager.tweak_data_func_name] or false
end

function PerpetualEventManager.tweak_christmas_heists(tweak_data)
	tweak_data.levels.roberts.is_christmas_heist = true
	tweak_data.levels.hox_1.world_name = "narratives/dentist/hox/stage_1_xmn"
	tweak_data.levels.hox_1.load_screen = "guis/dlcs/xmn/textures/loading/job_hox_1_xmn_df"
	tweak_data.levels.hox_1.music_overrides = {
		track_20 = "track_66"
	}
	tweak_data.levels.hox_1.is_christmas_heist = true
	tweak_data.levels.hox_2.world_name = "narratives/dentist/hox/stage_2_xmn"
	tweak_data.levels.hox_2.load_screen = "guis/dlcs/xmn/textures/loading/job_hox_2_xmn_df"
	tweak_data.levels.hox_2.music_overrides = {
		track_21 = "track_67"
	}
	tweak_data.levels.hox_2.is_christmas_heist = true
	tweak_data.levels.brb.is_christmas_heist = true
	tweak_data.levels.tag.world_name = "narratives/locke/tag_xmn"
	tweak_data.levels.tag.music_overrides = {
		music_tag = "music_xmn"
	}
	tweak_data.levels.tag.load_screen = "guis/dlcs/xmn/textures/loading/job_tag_xmn_df"
	tweak_data.levels.tag.is_christmas_heist = true
	tweak_data.levels.fex.world_name = "narratives/vlad/fex_xmas"
	tweak_data.levels.fex.load_screen = "guis/dlcs/fex/textures/loading/job_fex_01_df"
	tweak_data.levels.fex.is_christmas_heist = true
end

function PerpetualEventManager.tweak_xmas(tweak_data)
	PerpetualEventManager.tweak_christmas_heists(tweak_data)

	tweak_data.music.event_track_overrides.mainmenu = "today_is_payday_too"
end
