local _max_priority = 100000
local __max_priority = _max_priority - 1

local function _increase_priority(sound_event, inc, max)
	sound_event.priority = math.min(sound_event.priority * inc, max)
end

local priorities = {
	achievement = 100,
	crimespree = 25,
	days_in_row = 30,
	heist_result = 5,
	new_level = 20,
	new_skin = 40,
	new_weapon = 10,
	room_upgrade = 50,
	this_visit = 5,
	visitor = 1
}

ButlerMirroringManager = ButlerMirroringManager or class()

function ButlerMirroringManager:init()
	self:_setup()
end

function ButlerMirroringManager:_setup()
	if not Global.butler_mirroring then
		Global.butler_mirroring = {}
		Global.butler_mirroring._queue = {}
		Global.butler_mirroring._first_load = true
	end

	self._global = Global.butler_mirroring

	managers.mission:add_global_event_listener("butler_mirroring_heist_complete", {
		Message.OnHeistComplete
	}, callback(self, self, "_on_heist_complete"))
	managers.mission:add_global_event_listener("butler_mirroring_achievement", {
		Message.OnAchievement
	}, callback(self, self, "_on_achievement"))
	managers.mission:add_global_event_listener("butler_mirroring_weapon_bought", {
		Message.OnWeaponBought
	}, callback(self, self, "_on_weapon_bought"))
	managers.mission:add_global_event_listener("butler_mirroring_safe_house_upgrade", {
		Message.OnSafeHouseUpgrade
	}, callback(self, self, "_on_safe_house_upgrade"))
	managers.mission:add_global_event_listener("butler_mirroring_enter_safehouse", {
		Message.OnEnterSafeHouse
	}, callback(self, self, "_on_enter_safe_house"))
	managers.mission:add_global_event_listener("butler_mirroring_on_mission_end", {
		Message.OnMissionEnd
	}, callback(self, self, "_on_mission_end"))
	managers.mission:add_global_event_listener("butler_mirroring_safe_opened", {
		Message.OnSafeOpened
	}, callback(self, self, "_on_safe_opened"))
	managers.mission:add_global_event_listener("butler_mirroring_days_in_row", {
		Message.OnDaysInRow
	}, callback(self, self, "_on_days_in_row"))
	managers.mission:add_global_event_listener("butler_mirroring_better_crimespree", {
		Message.OnHighestCrimeSpree
	}, callback(self, self, "_on_new_crimespree_record"))
end

function ButlerMirroringManager:has_sound_event()
	return not table.empty(self._global._queue)
end

function ButlerMirroringManager:get_sound_event()
	local priority, choosen

	for k, v in pairs(self._global._queue) do
		if not priority or priority < v.priority then
			priority = v.priority
			choosen = {
				{
					k,
					v
				}
			}
		elseif v.priority == priority then
			table.insert(choosen, {
				k,
				v
			})
		end
	end

	if not choosen then
		return
	end

	local c_type, c_table = unpack(table.random(choosen))

	for k, v in pairs(self._global._queue) do
		if k == c_type or not v.important then
			self._global._queue[k] = nil
		end
	end

	if not c_table or not c_table.sound_events then
		return
	end

	local sound_event = table.random(c_table.sound_events)

	print("[Debug]", sound_event, c_table.debug)

	return sound_event, c_table.debug
end

function ButlerMirroringManager:load(data, version)
	if data.butler_mirroring then
		self._global._has_entered_safehouse = data.butler_mirroring._has_entered_safehouse
		self._global._queue = deep_clone(data.butler_mirroring._queue)

		for k, v in pairs(self._global._queue) do
			v.sound_events = v.sound_events or v.snd_events

			if self._global._first_load and v.forgettable then
				self._global._queue[k] = nil
			end
		end

		self._global._first_load = nil
	end
end

function ButlerMirroringManager:save(data)
	local save_data = deep_clone(self._global)

	data.butler_mirroring = save_data
end

function ButlerMirroringManager:_set_queue(q_type, event_data, inc_if_identical, max_prio)
	local existing = self._global._queue[q_type]

	if existing and table.equals(existing.sound_events, event_data.sound_events) then
		if inc_if_identical then
			_increase_priority(existing, inc_if_identical, max_prio or __max_priority)
		end
	elseif not existing or existing.priority <= event_data.priority then
		self._global._queue[q_type] = event_data
	end
end

function ButlerMirroringManager:_set_and_combine_queue(q_type, event_data)
	local existing = self._global._queue[q_type]

	if existing and existing.priority == event_data.priority then
		table.insert(self._global._queue[q_type].sound_events, unpack(event_data.sound_events))
	elseif not existing or existing.priority < event_data.priority then
		self._global._queue[q_type] = event_data
	end
end

function ButlerMirroringManager:_on_heist_complete(level_id, difficulty_id)
	local sound_event
	local heist_difficulties = {
		{
			{
				"overkill_290",
				"sm_wish"
			},
			"d"
		},
		{
			{
				"normal",
				"hard",
				"overkill",
				"overkill_145",
				"easy_wish",
				"overkill_290",
				"sm_wish"
			},
			"n"
		}
	}
	local heist_events = {
		alex = "rat",
		arena = "ah",
		arm_cro = "at",
		arm_fac = "at",
		arm_for = "th",
		arm_hcm = "at",
		arm_par = "at",
		arm_und = "at",
		big = "bb",
		born = "bkr",
		branchbank_cash = "bh",
		branchbank_deposit = "bh",
		branchbank_gold_prof = "bh",
		branchbank_prof = "bh",
		cage = "cs",
		cane = "sw",
		chill_combat = "sfh",
		crojob1 = "bd",
		crojob2 = "bf",
		dark = "ms",
		dinner = "slh",
		election_day = "ed",
		family = "ds",
		firestarter = "fs",
		flat = "pr",
		four_stores = "fos",
		framing_frame = "ff",
		gallery = "ag",
		haunted = "sfn",
		hox = "hb",
		hox_3 = "hr",
		jewelry_store = "js",
		jolly = "as",
		kenaz = "gg",
		kosugi = "sr",
		mad = "bp",
		mallcrasher = "mc",
		man = "uc",
		mia = "hm",
		mus = "td",
		nail = "lr",
		nightclub = "nc",
		pal = "cf",
		pbr = "btm",
		pbr2 = "bos",
		peta = "gs",
		pines = "wx",
		rat = "co",
		red2 = "fwb",
		roberts = "gb",
		shoutout_raid = "md",
		ukrainian_job_prof = "uj",
		watchdogs = "wd",
		watchdogs_night = "wd",
		watchdogs_wrapper = "wd",
		welcome_to_the_jungle_prof = "bo"
	}
	local level_event_id = heist_events[level_id]

	if level_event_id then
		local difficulty_event_id

		for _, diff_data in ipairs(heist_difficulties) do
			if table.contains(diff_data[1], difficulty_id) then
				difficulty_event_id = diff_data[2]

				break
			end
		end

		difficulty_event_id = difficulty_event_id or "n"
		sound_event = "Play_btl_hcr_" .. level_event_id .. difficulty_event_id .. "_01"

		print("[ButlerMirroringManager] queued sound event for heist: ", level_id, sound_event)
	else
		print("[ButlerMirroringManager] no sound_event for heist: ", level_id)
	end

	local generic_lines = {
		bain = "Play_btl_contract_bain_sin",
		locke = "Play_btl_contract_locke_sin",
		the_butcher = "Play_btl_contract_butcher_sin",
		the_continental = "Play_btl_contract_continental_sin",
		the_dentist = "Play_btl_contract_dentist_sin",
		the_elephant = "Play_btl_contract_elephant_sin",
		vlad = "Play_btl_contract_vlad_sin"
	}

	if not sound_event then
		local job = tweak_data.narrative.jobs[level_id]

		if job and job.contact then
			sound_event = generic_lines[job.contact]
		end
	end

	if sound_event then
		self:_set_queue("Message.OnHeistComplete", {
			debug = "On heist complete VO",
			forgettable = true,
			sound_events = {
				sound_event
			},
			priority = priorities.heist_result + 0.5
		}, 1.1, 99)
	elseif managers.statistics:session_hit_accuracy() > 80 then
		self:_set_queue("heist_result", {
			debug = "On won a heist VO",
			forgettable = true,
			sound_events = {
				"Play_btl_acc_80"
			},
			priority = priorities.heist_result + 0.5
		})
	else
		self:_set_queue("heist_result", {
			debug = "On won a heist VO",
			forgettable = true,
			sound_events = {
				"Play_btl_lvl_won_gen"
			},
			priority = priorities.heist_result
		})
	end
end

function ButlerMirroringManager:_on_achievement(id)
	local l = {
		death_29 = "Play_btl_ach_11",
		death_30 = "Play_btl_ach_14",
		deer_7 = "Play_btl_ach_04",
		farm_6 = "Play_btl_ach_01",
		frog_1 = "Play_btl_ach_10",
		gage2_10 = "Play_btl_ach_07",
		gage2_8 = "Play_btl_ach_06",
		gage3_9 = "Play_btl_ach_05",
		gage_8 = "Play_btl_ach_02",
		gorilla_1 = "Play_btl_ach_03",
		halloween_nightmare_5 = "Play_btl_ach_12",
		ignominy_10 = "Play_btl_inf_lvl_10",
		ignominy_100 = "Play_btl_inf_lvl_100",
		ignominy_25 = "Play_btl_inf_lvl_25",
		ignominy_50 = "Play_btl_inf_lvl_50",
		ignominy_75 = "Play_btl_inf_lvl_75",
		kosugi_4 = "Play_btl_ach_09",
		short_fuse = "Play_btl_ach_13",
		sinus_1 = "Play_btl_ach_15",
		the_wire = "Play_btl_ach_08",
		trk_b_0 = "Play_btl_contract_bain_all",
		trk_c_0 = "Play_btl_contract_continental_all",
		trk_cb_0 = "Play_btl_contract_butcher_all",
		trk_d_0 = "Play_btl_contract_dentist_all",
		trk_e_0 = "Play_btl_contract_elephant_all",
		trk_h_0 = "Play_btl_contract_hector_all",
		trk_l_0 = "Play_btl_contract_locke_all",
		trk_v_0 = "Play_btl_contract_vlad_all"
	}
	local remark_at = {
		"Play_btl_ach_steam_01",
		[10] = "Play_btl_ach_total_10",
		[50] = "Play_btl_ach_total_50",
		[100] = "Play_btl_ach_total_100",
		[200] = "Play_btl_ach_total_200",
		[300] = "Play_btl_ach_total_300",
		[400] = "Play_btl_ach_total_400",
		[500] = "Play_btl_ach_total_500",
		[600] = "Play_btl_ach_total_600",
		[700] = "Play_btl_ach_total_700",
		[800] = "Play_btl_ach_total_800",
		[900] = "Play_btl_ach_total_900",
		[1000] = "Play_btl_ach_total_1000"
	}
	local sound_event = l[id]

	if sound_event then
		self:_set_queue("Message.OnAchievement", {
			debug = "On achievement VO",
			forgettable = true,
			sound_events = {
				sound_event
			},
			priority = priorities.achievement + 0.1
		})
	else
		local total = managers.achievment:total_amount()
		local unlocked = managers.achievment:total_unlocked()
		local at_remark = remark_at[unlocked]

		if total == unlocked then
			self:_set_queue("Message.OnAchievement", {
				debug = "On all achievements VO",
				important = true,
				sound_events = {
					"Play_btl_ach_total_all"
				},
				priority = priorities.achievement + 0.9
			})
		elseif at_remark then
			self:_set_queue("Message.OnAchievement", {
				debug = "On num achievements VO",
				sound_events = {
					at_remark
				},
				priority = priorities.achievement + 0.2
			})
		else
			self:_set_queue("Message.OnAchievement", {
				debug = "On generic achievement VO",
				forgettable = true,
				sound_events = {
					"Play_btl_ach_new_01"
				},
				priority = priorities.achievement
			})
		end
	end
end

function ButlerMirroringManager:_on_level_up()
	if math.random() > 0.4 then
		self:_set_queue("Message.OnLevelUp", {
			debug = "On level up VO",
			sound_events = {
				"Play_btl_lvl"
			},
			priority = priorities.new_level
		}, 1.1, 99)
	end
end

function ButlerMirroringManager:_on_weapon_bought()
	if math.random() > 0.4 then
		self:_set_queue("Message.OnWeaponBought", {
			debug = "On weapon bought VO",
			sound_events = {
				"Play_btl_wpn_new"
			},
			priority = priorities.new_weapon
		}, 1.1, 99)
	end
end

function ButlerMirroringManager:_on_safe_house_upgrade()
	self:_set_queue("Message.OnSafeHouseUpgrade", {
		debug = "on safehouse upgrade VO",
		sound_events = {
			"Play_btl_room_updated"
		},
		priority = priorities.room_upgrade
	}, 1.1, 99)
end

local function get_close_passed(t, val)
	local _, k = table.find_value(t, function(v)
		return v.at > val
	end)
	local item = k and t[k - 1]

	if item then
		if not item.close and item.at == val then
			return item.line
		elseif item.close and val >= item.at and val < item.at + item.close then
			return item.line
		end
	end
end

local function make_close(line, at, close)
	return {
		line = line,
		at = at,
		close = close
	}
end

function ButlerMirroringManager:_on_enter_safe_house()
	self._global._queue.this_visit = nil

	local visitor_lines = {
		vlad = "Play_btl_visit_vlad"
	}
	local found = World:find_units_quick("all", 16)
	local sound_event, any_visitor

	for k, v in pairs(found) do
		local visitor = v:base() and v:base().visitor

		sound_event = visitor_lines[visitor] or sound_event
		any_visitor = any_visitor or not not visitor
	end

	sound_event = sound_event or any_visitor and "Play_btl_visit_gen"

	if sound_event then
		self:_set_queue("this_visit", {
			debug = "on visitor VO",
			forgettable = true,
			sound_events = {
				sound_event
			},
			priority = priorities.this_visit
		})
	end

	if not sound_event and math.random() > 0.4 then
		local time_lines = {
			make_close("Play_btl_played_hours_100", 100, 15),
			make_close("Play_btl_played_hours_300", 300, 15),
			make_close("Play_btl_played_hours_500", 500, 20),
			make_close("Play_btl_played_hours_700", 700, 20),
			make_close("Play_btl_played_hours_1000", 1000, 50),
			make_close("Play_btl_played_hours_2000", 2000, 50),
			make_close("Play_btl_played_hours_3000", 3000, 75),
			make_close("Play_btl_played_hours_4000", 4000, 75),
			make_close("Play_btl_played_hours_5000", 5000, 100),
			make_close("Play_btl_played_hours_10000", 10000, 200)
		}

		sound_event = get_close_passed(time_lines, managers.statistics:get_play_time_hours())

		if sound_event then
			self:_set_queue("this_visit", {
				debug = "on time played VO",
				forgettable = true,
				sound_events = {
					sound_event
				},
				priority = priorities.this_visit
			})
		end
	end

	if not sound_event and math.random() > 0.4 then
		local alone_lines = {
			make_close("Play_btl_coop_no5", 5, 1),
			make_close("Play_btl_coop_no10", 10, 2),
			make_close("Play_btl_coop_no30", 30, 5)
		}

		sound_event = get_close_passed(alone_lines, managers.statistics:get_days_alone())

		if sound_event then
			self:_set_queue("this_visit", {
				debug = "on alone VO",
				forgettable = true,
				sound_events = {
					sound_event
				},
				priority = priorities.this_visit
			})
		end
	end
end

function ButlerMirroringManager:_on_mission_end(success)
	if not success then
		self:_set_queue("heist_result", {
			debug = "on job failed VO",
			forgettable = true,
			sound_events = {
				"Play_btl_lvl_fail_gen"
			},
			priority = priorities.heist_result
		})
	end
end

function ButlerMirroringManager:_on_safe_opened(item)
	if not item or item.category ~= "weapon_skins" then
		return
	end

	self:_set_queue("new_skin", {
		debug = "on skin gained VO",
		sound_events = {
			"Play_btl_wpn_skin"
		},
		priority = priorities.new_skin
	})
end

function ButlerMirroringManager:_on_days_in_row(days)
	local lines = {
		[3] = "Play_btl_played_days_3",
		[5] = "Play_btl_played_days_5",
		[10] = "Play_btl_played_days_10"
	}
	local line = lines[days]

	if line then
		self:_set_queue("days_in_row", {
			debug = "on days in row VO",
			sound_events = {
				line
			},
			priority = priorities.days_in_row
		})
	end
end

function ButlerMirroringManager:_on_new_crimespree_record(new_record)
	self:_set_queue("crimespree", {
		debug = "on crimespree record VO",
		forgettable = true,
		sound_events = {
			"Play_btl_crime_spree_record"
		},
		priority = priorities.crimespree
	})
end
