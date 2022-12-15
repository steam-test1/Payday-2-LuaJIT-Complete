MutatorPiggyBank = MutatorPiggyBank or class(BaseMutator)
MutatorPiggyBank._type = "MutatorPiggyBank"
MutatorPiggyBank.name_id = "mutator_piggybank"
MutatorPiggyBank.desc_id = "mutator_piggybank_desc"
MutatorPiggyBank.package = "packages/pda9_piggybank"
MutatorPiggyBank.bag_unit = "units/pd2_dlc_pda9/props/pda9_pickup_feed_bag/pda9_pickup_feed_bag"
MutatorPiggyBank.announcer_unit = "units/pd2_dlc_pda9/characters/almir/almir"
MutatorPiggyBank.pig_units = {
	"units/pd2_dlc_pda9/props/pda9_piggybank/pda9_prop_piggybank_level_1",
	"units/pd2_dlc_pda9/props/pda9_piggybank/pda9_prop_piggybank_level_2",
	"units/pd2_dlc_pda9/props/pda9_piggybank/pda9_prop_piggybank_level_3",
	"units/pd2_dlc_pda9/props/pda9_piggybank/pda9_prop_piggybank_level_4"
}
MutatorPiggyBank.sequre_zone_units = {
	"units/pd2_dlc_pda9/props/pda9_circle_marker/pda9_prop_circle_marker_stage_0",
	"units/pd2_dlc_pda9/props/pda9_circle_marker/pda9_prop_circle_marker_stage_1",
	"units/pd2_dlc_pda9/props/pda9_circle_marker/pda9_prop_circle_marker_stage_2",
	"units/pd2_dlc_pda9/props/pda9_circle_marker/pda9_prop_circle_marker_stage_3"
}
MutatorPiggyBank.bag_expire_custom_params = {
	sound_event = "PD9A_BagDespawn",
	effect = "effects/payday2/particles/explosions/burnpuff",
	camera_shake_mul = 0
}
MutatorPiggyBank.briefing_dialog = "Play_alm_pda9_brf"
MutatorPiggyBank.briefing_event = "Play_alm_pda9_cbf"
MutatorPiggyBank.disables_achievements = false
MutatorPiggyBank.categories = {
	"event"
}
local mvec1 = Vector3()
local mvec2 = Vector3()
local mrot1 = Rotation()
local mrot2 = Rotation()

function MutatorPiggyBank:register_values(mutator_manager)
end

function MutatorPiggyBank:setup(mutator_manager)
	print("MutatorPiggyBank:setup")

	self._tweakdata = tweak_data.mutators.piggybank
	self._feed_drop_count = 0
	self._pig_fed_count = 0
	self._pig_level = 1
	self._current_pig_level_tweak = self._tweakdata.pig_levels[self._pig_level]
	self._exploded_pig_level = false
	self._piggybank_units = {}
	self._sequre_zone_units = {}
	local spawn_data = self._tweakdata.level_coordinates[Global.level_data.level_id]
	self._position = spawn_data and spawn_data.position or Vector3()
	self._rotation = spawn_data and spawn_data.rotation or Rotation()
	self._pig_feed_slotmask = World:make_slot_mask(14)
	self._pig_feed_check_t = 0
	self._sound_source = SoundDevice:create_source("MutatorPiggyBank")

	self._sound_source:set_position(self._position)
end

function MutatorPiggyBank:on_game_started(mutator_manager)
	print("MutatorPiggyBank:on_game_started")

	local piggy_unit_index = self._current_pig_level_tweak.piggy_unit_index
	self._announcer_unit = World:spawn_unit(Idstring(MutatorPiggyBank.announcer_unit), self._position + Vector3(0, 0, 100), self._rotation)

	for index, unit_name in ipairs(MutatorPiggyBank.pig_units) do
		local unit = World:spawn_unit(Idstring(unit_name), self._position, self._rotation)

		unit:set_enabled(false)
		unit:damage():add_trigger_callback("remove_piggybank_clbk", callback(self, self, "_remove_piggybank_clbk", unit))
		unit:damage():add_trigger_callback("explode_piggybank_clbk", callback(self, self, "_explode_piggybank_clbk", unit))
		table.insert(self._piggybank_units, unit)
	end

	for index, unit_name in ipairs(MutatorPiggyBank.sequre_zone_units) do
		local unit = World:spawn_unit(Idstring(unit_name), self._position, self._rotation)

		unit:set_enabled(false)
		table.insert(self._sequre_zone_units, unit)
	end

	if Network:is_server() then
		if managers.navigation:is_data_ready() then
			self._nav_tracker = managers.navigation:create_nav_tracker(self._position)
			self._pos_reservation = {
				radius = 350,
				position = self._position
			}

			managers.navigation:add_pos_reservation(self._pos_reservation)
			managers.navigation:add_obstacle(self._piggybank_units[#self._piggybank_units], Idstring("c_sphere_01"))
		else
			Application:error("[MutatorPiggyBank:on_game_started] Spawned piggybank units with incomplete navigation data.")
		end
	end

	self:show_next_piggybank()
	self._sound_source:post_event("PD9A_Idle")

	self._reminder_t = 60
	self._reminder_dialog = "Play_alm_pda9_02"
	self._dialog_count_trigger = {
		headshot = {
			sync_index = 1,
			count = 400,
			dialog = "Play_alm_pda9_18"
		},
		moneyshot = {
			sync_index = 2,
			count = 400,
			dialog = "Play_alm_pda9_19"
		},
		bag_spawn_1 = {
			sync_index = 3,
			count = 1,
			dialog = "Play_alm_pda9_03"
		},
		bag_spawn_10 = {
			sync_index = 4,
			count = 10,
			dialog = "Play_alm_pda9_04"
		}
	}
end

function MutatorPiggyBank:progress_dialog_count(trigger_id, amount)
	local data = self._dialog_count_trigger[trigger_id]

	if data and data.count then
		data.count = data.count - amount

		if data.count <= 0 then
			managers.network:session():send_to_peers_synched("sync_piggybank_dialog", data.sync_index)
			self:announcer_say(data.dialog)

			data.count = false
		end
	end
end

function MutatorPiggyBank:sync_piggybank_dialog(sync_index)
	for id, data in pairs(self._dialog_count_trigger) do
		if data.count and data.sync_index == sync_index then
			self:announcer_say(data.dialog)

			data.count = false

			break
		end
	end
end

function MutatorPiggyBank:get_intro_event(default_intro_event)
	return "Play_alm_pda9_01"
end

function MutatorPiggyBank:get_outro_event(default_outro_event)
	if self._exploded_pig_level then
		return {
			string.format("Play_alm_pda9_end_pig_0%d", self._exploded_pig_level - 1),
			string.format("Play_alm_pda9_end_bag_0%d", self._exploded_pig_level - 1)
		}
	end

	return default_outro_event
end

function MutatorPiggyBank:sync_save(mutator_manager, save_data)
	local my_save_data = {}
	save_data.piggybank_mutator = my_save_data
	my_save_data.pig_level = self._pig_level
	my_save_data.exploded_pig_level = self._exploded_pig_level
	my_save_data.reminder_t = self._reminder_t
	my_save_data.reminder_dialog = self._reminder_dialog
	my_save_data.pig_fed_count = self._pig_fed_count
end

function MutatorPiggyBank:sync_load(mutator_manager, load_data)
	local my_load_data = load_data.piggybank_mutator
	self._pig_level = my_load_data.pig_level
	local old_piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]

	old_piggybank_unit:set_enabled(false)

	local old_sequre_zone_unit = self._sequre_zone_units[self._current_pig_level_tweak.sequre_zone_index]

	if old_sequre_zone_unit then
		old_sequre_zone_unit:set_enabled(false)
	end

	self._current_pig_level_tweak = self._tweakdata.pig_levels[self._pig_level]

	if my_load_data.exploded_pig_level then
		self._sound_source:post_event("PD9A_Idle_STOP")
	else
		self:show_next_piggybank()
	end

	self._reminder_t = my_load_data.reminder_t
	self._reminder_dialog = my_load_data.reminder_dialog
	self._pig_fed_count = my_load_data.pig_fed_count
end

function MutatorPiggyBank:server_feed_piggybank(bag_unit)
	print("MutatorPiggyBank:server_feed_piggybank", bag_unit)

	self._pig_fed_count = self._pig_fed_count + 1
	local next_pig_level = self._tweakdata.pig_levels[self._pig_level + 1]
	local reached_next_level = next_pig_level and next_pig_level.bag_requirement <= self._pig_fed_count

	managers.network:session():send_to_peers_synched("sync_feed_piggybank", bag_unit, reached_next_level)
	self:sync_feed_piggybank(bag_unit, reached_next_level)
	Telemetry:on_player_game_event_action(Telemetry.event_actions.piggybank_fed, {})
end

function MutatorPiggyBank:sync_feed_piggybank(bag_unit, reached_next_level)
	print("MutatorPiggyBank:sync_feed_piggybank", bag_unit, reached_next_level)

	if not Network:is_server() then
		self._pig_fed_count = self._pig_fed_count + 1
	end

	local current_piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]

	if reached_next_level then
		self:increase_pig_level()
	end

	self:on_pig_fed(bag_unit, current_piggybank_unit)
end

function MutatorPiggyBank:on_pig_fed(bag_unit, current_piggybank_unit)
	if alive(current_piggybank_unit) then
		local obj = current_piggybank_unit:get_object(Idstring("coin_slot"))
		local pos = mvec1

		obj:m_position(pos)
		managers.explosion:player_feedback(pos, nil, nil, {
			camera_shake_mul = 4,
			feedback_range = 1000
		})

		pos = obj:to_local(pos)

		World:effect_manager():spawn({
			effect = Idstring("effects/payday2/environment/9th_bag_explosion"),
			position = pos,
			normal = math.UP,
			parent = obj
		})
		self._sound_source:post_event("PDA9_BagIn")
	end

	if alive(bag_unit) then
		if Network:is_server() or bag_unit:id() == -1 then
			bag_unit:set_slot(0)
		else
			bag_unit:set_enabled(false)
		end
	end
end

function MutatorPiggyBank:increase_pig_level()
	print("MutatorPiggyBank:increase_pig_level", self._pig_level)

	local old_piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]
	local sequence = self._current_pig_level_tweak.sequences and self._current_pig_level_tweak.sequences.grow

	self:safe_run_sequence(old_piggybank_unit, sequence)

	local old_sequre_zone_unit = self._sequre_zone_units[self._current_pig_level_tweak.sequre_zone_index]

	if old_sequre_zone_unit then
		old_sequre_zone_unit:set_enabled(false)
	end

	self._pig_level = math.min(self._pig_level + 1, #self._tweakdata.pig_levels)

	if not Global.game_settings.single_player and Network:is_server() then
		MenuCallbackHandler:update_matchmake_attributes()
	end

	self._current_pig_level_tweak = self._tweakdata.pig_levels[self._pig_level]

	self:show_next_piggybank()

	if self._current_pig_level_tweak.dialogs.show then
		self:announcer_say(self._current_pig_level_tweak.dialogs.show)
	end

	if self._pig_level == #self._tweakdata.pig_levels then
		self._reminder_t = 60
		self._reminder_dialog = "Play_alm_pda9_11"
	else
		self._reminder_t = nil
	end
end

function MutatorPiggyBank:show_next_piggybank()
	print("MutatorPiggyBank:show_next_piggybank")

	local piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]
	local sequence = self._current_pig_level_tweak.sequences and self._current_pig_level_tweak.sequences.show

	piggybank_unit:set_enabled(true)
	self:safe_run_sequence(piggybank_unit, sequence)

	local sequre_zone_unit = self._sequre_zone_units[self._current_pig_level_tweak.sequre_zone_index]

	if sequre_zone_unit then
		sequre_zone_unit:set_enabled(true)
	end
end

function MutatorPiggyBank:update(t, dt)
	if self._exploded_pig_level then
		return
	end

	if not game_state_machine:verify_game_state(GameStateFilters.any_ingame_playing) then
		return
	end

	if self._pig_level > 1 then
		local player_unit = managers.player:local_player()
		local current_state = managers.player:current_state()
		local invalid_states = {
			"mask_off",
			"clean",
			"civilian"
		}

		if alive(player_unit) and not managers.interaction:active_unit() and not table.contains(invalid_states, current_state) then
			local text_string, text_icon = nil
			local current_player_state = managers.player:get_current_state()
			local fwd_ray = current_player_state and current_player_state.get_fwd_ray and current_player_state:get_fwd_ray()

			if fwd_ray and table.contains(self._piggybank_units, fwd_ray.unit) then
				local progress_range = self._tweakdata.progress_range or 1000

				if fwd_ray.distance < progress_range then
					local next_pig_level_tweak = self._tweakdata.pig_levels[self._pig_level + 1]

					if next_pig_level_tweak then
						local macros = {
							PIGGY_PROGRESS = "",
							PIGGY_LEVEL = tostring(self._pig_level - 1)
						}
						local current_count = self._pig_fed_count - self._current_pig_level_tweak.bag_requirement
						local next_count = next_pig_level_tweak.bag_requirement - self._current_pig_level_tweak.bag_requirement
						local percentage = current_count / next_count * 100

						if next_count > 100 then
							macros.PIGGY_PROGRESS = string.format("%.2f", percentage)
						else
							macros.PIGGY_PROGRESS = string.format("%.0f", percentage)
						end

						text_string = managers.localization:text("hud_pda9_show_progress", macros)
					end
				end
			end

			if text_string then
				managers.hud:show_interact({
					text = text_string,
					icon = text_icon
				})
			else
				managers.hud:remove_interact()
			end
		end
	end

	if self._reminder_t then
		self._reminder_t = self._reminder_t - dt

		if self._reminder_t <= 0 then
			self._reminder_t = nil

			self:announcer_say(self._reminder_dialog)
		end
	end

	local piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]

	if Network:is_server() and alive(piggybank_unit) then
		self._pig_feed_check_t = self._pig_feed_check_t - dt

		if self._pig_feed_check_t < 0 then
			self._pig_feed_check_t = self._pig_feed_check_t + 0.1
			local pos = mvec1

			piggybank_unit:get_object(Idstring("c_sphere_01")):m_position(pos)

			local slotmask = self._pig_feed_slotmask
			local range = self._current_pig_level_tweak.range or 350
			local units = World:find_units_quick("sphere", pos, range, slotmask)

			for _, found_unit in pairs(units) do
				if found_unit:carry_data() and found_unit:carry_data():carry_id() == "pda9_feed" then
					self:server_feed_piggybank(found_unit)
				end
			end
		end
	end
end

function MutatorPiggyBank:main_category()
	return "event"
end

function MutatorPiggyBank:get_exploded_pig_level()
	return self._exploded_pig_level
end

function MutatorPiggyBank:can_spawn_bag()
	if managers.mutators:is_mutator_active(MutatorPiggyBank) then
		return not self._exploded_pig_level and self._pig_level < #self._tweakdata.pig_levels
	end

	return false
end

function MutatorPiggyBank:on_enemy_killed(dead_unit, attack_data)
	local attacker_unit = attack_data.attacker_unit
	local weapon_unit = attack_data.weapon_unit

	if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
		attacker_unit = attacker_unit:base():thrower_unit()
		weapon_unit = attack_data.attacker_unit
	end

	local character_data = managers.criminals:has_character_by_unit(attacker_unit) and managers.criminals:character_data_by_unit(attacker_unit)
	local is_player_character = character_data and not character_data.ai
	local weapon_id = alive(weapon_unit) and weapon_unit:base().name_id
	local feed_amount = (attack_data.headshot or weapon_id == "money") and self._tweakdata.special_kill_points or self._tweakdata.normal_kill_points

	if attack_data.headshot then
		self:progress_dialog_count("headshot", 1)
	end

	if weapon_id == "money" then
		self:progress_dialog_count("moneyshot", 1)
	end

	self._feed_drop_count = self._feed_drop_count + feed_amount

	if is_player_character and self._tweakdata.drop_count <= self._feed_drop_count then
		self._feed_drop_count = 0
		local pos = mvec1

		dead_unit:m_position(pos)
		mvector3.set_z(pos, mvector3.z(pos) + 3)

		local rot = mrot1

		mrotation.set_zero(rot)

		local unit = World:spawn_unit(Idstring(MutatorPiggyBank.bag_unit), pos, rot)
		unit:carry_data().EXPIRE_CUSTOM_PARAMS = MutatorPiggyBank.bag_expire_custom_params

		self:progress_dialog_count("bag_spawn_1", 1)
		self:progress_dialog_count("bag_spawn_10", 1)
		self._sound_source:post_event("PD9A_BagSpawn")
	end
end

function MutatorPiggyBank:sync_explode_piggybank()
	if self._exploded_pig_level then
		return
	end

	self._exploded_pig_level = self._pig_level
	self._reminder_t = nil

	if Network:is_server() then
		if self._nav_tracker then
			managers.navigation:destroy_nav_tracker(self._nav_tracker)

			self._nav_tracker = nil
		end

		if self._pos_reservation then
			managers.navigation:unreserve_pos(self._pos_reservation)

			self._pos_reservation = nil
		end

		managers.navigation:remove_obstacle(self._piggybank_units[#self._piggybank_units], Idstring("c_sphere_01"))
	end

	local piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]
	local sequence = self._current_pig_level_tweak.sequences and self._current_pig_level_tweak.sequences.explode

	self:safe_run_sequence(piggybank_unit, sequence)

	local sequre_zone_unit = self._sequre_zone_units[self._current_pig_level_tweak.sequre_zone_index]

	if sequre_zone_unit then
		sequre_zone_unit:set_enabled(false)
	end

	if self._current_pig_level_tweak.dialogs.explode then
		self:announcer_say(self._current_pig_level_tweak.dialogs.explode)
	end
end

function MutatorPiggyBank:_remove_piggybank_clbk(piggybank_unit)
	piggybank_unit:interaction():set_active(false)
	piggybank_unit:set_enabled(false)
end

function MutatorPiggyBank:_explode_piggybank_clbk()
	managers.network:session():send_to_peers_synched("sync_explode_piggybank")
	self:sync_explode_piggybank()
end

function MutatorPiggyBank:safe_run_sequence(unit, sequence)
	if alive(unit) and unit:damage() and unit:damage():has_sequence(sequence) then
		unit:damage():run_sequence_simple(sequence)
	end
end

function MutatorPiggyBank:announcer_say(dialog)
	managers.dialog:queue_dialog(dialog, {
		on_unit = self._announcer_unit
	})
end

function MutatorPiggyBank:check_heist_end_achievements(heist_success)
	if not heist_success or not self._exploded_pig_level then
		return
	end

	local overkill_and_above = table.contains({
		"overkill_145",
		"easy_wish",
		"overkill_290",
		"sm_wish"
	}, Global.game_settings.difficulty)

	if self._pig_fed_count >= 10 then
		managers.event_jobs:award("pda9_collective_1_" .. (managers.job:has_active_job() and managers.job:current_job_id() or ""))
	end

	if self._pig_fed_count >= 20 then
		managers.event_jobs:award("pda9_collective_2_" .. (managers.job:has_active_job() and managers.job:current_job_id() or ""))
	end

	if self._exploded_pig_level > 1 then
		managers.event_jobs:award("pda9_piggy_stage_1")
	end

	if self._exploded_pig_level > 2 then
		managers.event_jobs:award("pda9_piggy_stage_2")

		if overkill_and_above then
			managers.event_jobs:award("pda9_collective_3_" .. (managers.job:has_active_job() and managers.job:current_job_id() or ""))
		end
	end

	if self._exploded_pig_level > 3 and overkill_and_above and overkill_and_above then
		managers.event_jobs:award("pda9_collective_4_" .. (managers.job:has_active_job() and managers.job:current_job_id() or ""))
	end

	if self._exploded_pig_level > 4 then
		-- Nothing
	end

	if self._exploded_pig_level > 5 then
		-- Nothing
	end
end
