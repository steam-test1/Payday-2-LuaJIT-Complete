MutatorPiggyRevenge = MutatorPiggyRevenge or class(BaseMutator)
MutatorPiggyRevenge._type = "MutatorPiggyRevenge"
MutatorPiggyRevenge.name_id = "mutator_piggyrevenge"
MutatorPiggyRevenge.desc_id = "mutator_piggyrevenge_desc"
MutatorPiggyRevenge.package = "packages/pda10_piggyrevenge"
MutatorPiggyRevenge.bag_unit = "units/pd2_dlc_pda9/props/pda9_pickup_feed_bag/pda9_pickup_feed_bag"
MutatorPiggyRevenge.announcer_unit = "units/pd2_dlc_pda9/characters/almir/almir"
MutatorPiggyRevenge.pig_units = {
	"units/pd2_dlc_pda9/props/pda9_piggybank/pda9_prop_piggybank_level_1",
	"units/pd2_dlc_pda9/props/pda9_piggybank/pda9_prop_piggybank_level_2",
	"units/pd2_dlc_pda9/props/pda9_piggybank/pda9_prop_piggybank_level_3",
	"units/pd2_dlc_pda9/props/pda9_piggybank/pda9_prop_piggybank_level_4"
}
MutatorPiggyRevenge.secure_zone_units = {
	"units/pd2_dlc_pda9/props/pda9_circle_marker/pda9_prop_circle_marker_stage_0",
	"units/pd2_dlc_pda9/props/pda9_circle_marker/pda9_prop_circle_marker_stage_1",
	"units/pd2_dlc_pda9/props/pda9_circle_marker/pda9_prop_circle_marker_stage_2",
	"units/pd2_dlc_pda9/props/pda9_circle_marker/pda9_prop_circle_marker_stage_3"
}
MutatorPiggyRevenge.bag_expire_custom_params = {
	sound_event = "PD9A_BagDespawn",
	effect = "effects/payday2/particles/explosions/burnpuff",
	camera_shake_mul = 0
}
MutatorPiggyRevenge.AOE_TRAIL_EFFECT = Idstring("effects/payday2/particles/weapons/trail_adam")
MutatorPiggyRevenge.briefing_dialog = "Play_alm_pda9_brf"
MutatorPiggyRevenge.briefing_event = "Play_alm_pda9_cbf"
MutatorPiggyRevenge.track_overrides = {
	lobby = "its_clown_time"
}
MutatorPiggyRevenge.disables_achievements = false
MutatorPiggyRevenge.categories = {
	"event"
}
local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
local mrot1 = Rotation()
local mrot2 = Rotation()
local idstr_trail = Idstring("trail")
local idstr_simulator_length = Idstring("simulator_length")
local idstr_size = Idstring("size")

function MutatorPiggyRevenge:register_values(mutator_manager)
end

function MutatorPiggyRevenge:next_interupt_stage(interupt)
	return nil
end

function MutatorPiggyRevenge:setup(mutator_manager)
	print("MutatorPiggyRevenge:setup")

	self._tweakdata = tweak_data.mutators.piggyrevenge
	self._feed_drop_count = 0
	self._pig_fed_count = 0
	self._pig_level = 1
	self._current_pig_level_tweak = self._tweakdata.pig_levels[self._pig_level]
	self._exploded_pig_level = false
	self._buff_pool = deep_clone(self._tweakdata.buff_pool)
	self._active_buffs = self._active_buffs or {}
	self._piggybank_units = {}
	self._secure_zone_units = {}
	self._boss_spawn_que = {}
	self._boss_count = 0
	self._boss_bag_fountains = {}
	local spawn_data = self._tweakdata.level_coordinates[Global.level_data.level_id]
	self._position = spawn_data and spawn_data.position or Vector3()
	self._rotation = spawn_data and spawn_data.rotation or Rotation()
	self._pig_feed_slotmask = World:make_slot_mask(14)
	self._pig_feed_check_t = 0

	if not self._aoe_trail_length then
		self._aoe_trail_length = World:effect_manager():get_initial_simulator_var_vector2(self.AOE_TRAIL_EFFECT, idstr_trail, idstr_simulator_length, idstr_size)
	end

	self._sound_source = SoundDevice:create_source("MutatorPiggyRevenge")

	self._sound_source:set_position(self._position)
end

function MutatorPiggyRevenge:on_game_started(mutator_manager)
	print("MutatorPiggyRevenge:on_game_started")

	local piggy_unit_index = self._current_pig_level_tweak.piggy_unit_index
	self._announcer_unit = World:spawn_unit(Idstring(MutatorPiggyRevenge.announcer_unit), self._position + Vector3(0, 0, 100), self._rotation)

	for index, unit_name in ipairs(MutatorPiggyRevenge.pig_units) do
		local unit = World:spawn_unit(Idstring(unit_name), self._position, self._rotation)

		unit:set_enabled(false)
		unit:damage():add_trigger_callback("remove_piggybank_clbk", callback(self, self, "_remove_piggybank_clbk", unit))
		unit:damage():add_trigger_callback("explode_piggybank_clbk", callback(self, self, "_explode_piggybank_clbk", unit))
		table.insert(self._piggybank_units, unit)
	end

	for index, unit_name in ipairs(MutatorPiggyRevenge.secure_zone_units) do
		local unit = World:spawn_unit(Idstring(unit_name), self._position, self._rotation)

		unit:set_enabled(false)
		table.insert(self._secure_zone_units, unit)
	end

	self._boss_count = 0

	if Network:is_server() then
		self._boss_spawn_que = {}
		self._boss_bag_fountains = {}
	end

	self:_setup_navigation()
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

function MutatorPiggyRevenge:_setup_navigation()
	if Network:is_server() then
		if managers.navigation:is_data_ready() then
			self._nav_tracker = managers.navigation:create_nav_tracker(self._position)
			self._pos_reservation = {
				radius = 500,
				position = self._position
			}

			managers.navigation:add_pos_reservation(self._pos_reservation)
			managers.navigation:add_obstacle(self._piggybank_units[#self._piggybank_units], Idstring("c_sphere_01"))
		else
			self._retry_setup_navigation = true
		end
	end
end

function MutatorPiggyRevenge:progress_dialog_count(trigger_id, amount)
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

function MutatorPiggyRevenge:sync_piggybank_dialog(sync_index)
	for id, data in pairs(self._dialog_count_trigger) do
		if data.count and data.sync_index == sync_index then
			self:announcer_say(data.dialog)

			data.count = false

			break
		end
	end
end

function MutatorPiggyRevenge:get_intro_event(default_intro_event)
	return "Play_alm_pda9_01"
end

function MutatorPiggyRevenge:get_outro_event(default_outro_event)
	if self._exploded_pig_level then
		return {
			string.format("Play_alm_pda9_end_pig_0%d", self._exploded_pig_level - 1),
			string.format("Play_alm_pda9_end_bag_0%d", self._exploded_pig_level - 1)
		}
	end

	return default_outro_event
end

function MutatorPiggyRevenge:sync_save(mutator_manager, save_data)
	local my_save_data = {}
	save_data.piggyrevenge_mutator = my_save_data
	my_save_data.pig_level = self._pig_level
	my_save_data.exploded_pig_level = self._exploded_pig_level
	my_save_data.reminder_t = self._reminder_t
	my_save_data.reminder_dialog = self._reminder_dialog
	my_save_data.pig_fed_count = self._pig_fed_count
	my_save_data.active_buffs = self._active_buffs
	my_save_data.boss_count = self._boss_count
end

function MutatorPiggyRevenge:sync_load(mutator_manager, load_data)
	local my_load_data = load_data.piggyrevenge_mutator
	self._pig_level = my_load_data.pig_level
	local old_piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]

	old_piggybank_unit:set_enabled(false)

	local old_secure_zone_unit = self._secure_zone_units[self._current_pig_level_tweak.secure_zone_index]

	if old_secure_zone_unit then
		old_secure_zone_unit:set_enabled(false)
	end

	self._current_pig_level_tweak = self._tweakdata.pig_levels[self._pig_level]

	if my_load_data.exploded_pig_level then
		self._exploded_pig_level = 1

		self._sound_source:post_event("PD9A_Idle_STOP")
	else
		self:show_next_piggybank()
	end

	self._reminder_t = my_load_data.reminder_t
	self._reminder_dialog = my_load_data.reminder_dialog
	self._pig_fed_count = my_load_data.pig_fed_count
	self._active_buffs = my_load_data.active_buffs or {}
	self._boss_count = my_load_data.boss_count or 0

	for _, buff_id in ipairs(self._active_buffs) do
		local buff_td = self._tweakdata.buffs[buff_id]
		local func = buff_td and self["activate_" .. buff_td.func_name .. "_buff"]

		if func then
			func(self, buff_td)
		end
	end

	if self._boss_count > 0 then
		managers.hud:add_buff({
			buff_id = "piggydozer_spawn",
			name_id = "hud_buff_piggydozer_warning",
			time_left = -1,
			icon_texture = "guis/textures/pd2/hud_icon_assaultbox",
			negative = -1,
			color = tweak_data.screen_colors.important_1,
			icon_texture_rect = {
				0,
				0,
				32,
				32
			}
		})
	end
end

function MutatorPiggyRevenge:server_feed_piggybank(bag_unit)
	print("MutatorPiggyRevenge:server_feed_piggybank", bag_unit)

	self._pig_fed_count = self._pig_fed_count + 1
	local next_pig_level = self._tweakdata.pig_levels[self._pig_level + 1]
	local reached_next_level = next_pig_level and next_pig_level.bag_requirement <= self._pig_fed_count
	local last_carried_player = alive(bag_unit) and bag_unit:carry_data() and bag_unit:carry_data():latest_peer_id() or nil

	managers.network:session():send_to_peers_synched("sync_feed_piggybank", bag_unit, reached_next_level, last_carried_player)
	self:sync_feed_piggybank(bag_unit, reached_next_level, last_carried_player)
end

function MutatorPiggyRevenge:sync_feed_piggybank(bag_unit, reached_next_level, last_carried_player)
	print("MutatorPiggyRevenge:sync_feed_piggybank", bag_unit, reached_next_level)

	if not Network:is_server() then
		self._pig_fed_count = self._pig_fed_count + 1
	end

	local current_piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]

	if reached_next_level then
		self:increase_pig_level()
	end

	self:on_pig_fed(bag_unit, current_piggybank_unit)

	if last_carried_player and last_carried_player == managers.network:session():local_peer():id() then
		managers.event_jobs:award("pda10_bags_objective")
	elseif Network:is_server() then
		-- Nothing
	end
end

function MutatorPiggyRevenge:on_pig_fed(bag_unit, current_piggybank_unit)
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

function MutatorPiggyRevenge:increase_pig_level()
	print("MutatorPiggyRevenge:increase_pig_level", self._pig_level)

	local old_piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]
	local sequence = self._current_pig_level_tweak.sequences and self._current_pig_level_tweak.sequences.grow

	self:safe_run_sequence(old_piggybank_unit, sequence)

	local old_secure_zone_unit = self._secure_zone_units[self._current_pig_level_tweak.secure_zone_index]

	if old_secure_zone_unit then
		old_secure_zone_unit:set_enabled(false)
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

	self:activate_categories_buff(self._current_pig_level_tweak.buff_pool)
	self:spawn_piggydozer()
	managers.hud:show_stage_transition(self._pig_level - 1, string.format("%.0f", self._tweakdata.pig_levels[self._pig_level + 1] and 0 or 100))
end

function MutatorPiggyRevenge:show_next_piggybank()
	print("MutatorPiggyRevenge:show_next_piggybank")

	local piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]
	local sequence = self._current_pig_level_tweak.sequences and self._current_pig_level_tweak.sequences.show

	piggybank_unit:set_enabled(true)
	self:safe_run_sequence(piggybank_unit, sequence)

	local secure_zone_unit = self._secure_zone_units[self._current_pig_level_tweak.secure_zone_index]

	if secure_zone_unit then
		secure_zone_unit:set_enabled(true)
	end
end

function MutatorPiggyRevenge:update(t, dt)
	managers.hud:update_mutator_hud(t, dt)

	if self._exploded_pig_level then
		return
	end

	if not game_state_machine:verify_game_state(GameStateFilters.any_ingame_playing) then
		return
	end

	if self._retry_setup_navigation then
		self._retry_setup_navigation = nil

		self:_setup_navigation()
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
			local progress_range = self._tweakdata.progress_range or 1000
			local show_progress = false
			local hand_id, hand_unit = nil

			if _G.IS_VR then
				local hand_ids = player_unit:hand():interaction_ids()

				if current_player_state._interact_hand and not table.contains(hand_ids, current_player_state._interact_hand) then
					table.insert(hand_ids, current_player_state._interact_hand)
				end

				for _, id in ipairs(hand_ids) do
					hand_unit = player_unit:hand():hand_unit(id)

					if hand_unit then
						local fwd_ray = hand_unit:raycast("ray", hand_unit:position(), hand_unit:position() + hand_unit:rotation():y() * progress_range, "slot_mask", 1)

						if fwd_ray and table.contains(self._piggybank_units, fwd_ray.unit) then
							show_progress = true
							hand_id = id

							break
						end
					end
				end
			end

			if not show_progress then
				local fwd_ray = current_player_state and current_player_state.get_fwd_ray and current_player_state:get_fwd_ray()

				if fwd_ray and table.contains(self._piggybank_units, fwd_ray.unit) then
					show_progress = fwd_ray.distance < progress_range
				end
			end

			if show_progress then
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

			if text_string then
				managers.hud:show_interact({
					text = text_string,
					icon = text_icon
				})

				if _G.IS_VR then
					managers.hud:link_watch_prompt(hand_unit, hand_id)
					managers.hud:watch_prompt_panel():show()
				end
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

	if Network:is_server() then
		local spawn_que = self._boss_spawn_que[1]

		if spawn_que then
			spawn_que.t = spawn_que.t - dt

			if spawn_que.t <= 0 then
				local spawn_success = managers.groupai:state():spawn_piggydozer()

				if not spawn_success then
					spawn_que.t = 5
				else
					table.remove(self._boss_spawn_que, 1)
					self:_server_on_boss_spawned()
				end
			end
		end

		for i = #self._boss_bag_fountains, 1, -1 do
			local fountain = self._boss_bag_fountains[i]
			fountain.next_spawn_t = fountain.next_spawn_t - dt

			if fountain.next_spawn_t <= 0 then
				local dir = mvec1

				mvector3.set(dir, math.UP)
				mvector3.spread(dir, math.random(8, 38))

				local rot = Rotation()

				mrotation.set_look_at(rot, dir, math.UP)
				self:server_spawn_bag(fountain.pos, rot, math.random(400, 600))

				fountain.spawned_amount = fountain.spawned_amount + 1

				if fountain.spawned_amount == fountain.bag_spawn_amount then
					self._boss_bag_fountains[i] = nil
				else
					fountain.next_spawn_t = 0.7 * math.pow(0.96, fountain.spawned_amount)
				end
			end
		end

		local piggybank_unit = self._piggybank_units[self._current_pig_level_tweak.piggy_unit_index]

		if alive(piggybank_unit) then
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
end

function MutatorPiggyRevenge:main_category()
	return "event"
end

function MutatorPiggyRevenge:get_exploded_pig_level()
	return self._exploded_pig_level
end

function MutatorPiggyRevenge:can_spawn_bag()
	if managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
		return not self._exploded_pig_level and self._pig_level < #self._tweakdata.pig_levels
	end

	return false
end

function MutatorPiggyRevenge:on_enemy_killed(dead_unit, attack_data)
	local attacker_unit = attack_data.attacker_unit
	local weapon_unit = attack_data.weapon_unit

	if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
		attacker_unit = attacker_unit:base():thrower_unit()
		weapon_unit = attack_data.attacker_unit
	end

	local character_data = managers.criminals:has_character_by_unit(attacker_unit) and managers.criminals:character_data_by_unit(attacker_unit)
	local is_boss_kill = dead_unit:base():has_tag("eventboss")
	local is_sniper_kill = dead_unit:base():has_tag("sniper")
	local is_player_character = not character_data or not character_data.ai
	local weapon_id = alive(weapon_unit) and weapon_unit:base().name_id or attack_data.name_id or attack_data.weapon_id or false
	local feed_amount = is_player_character and (self._tweakdata.weapon_kill_points[weapon_id] or attack_data.headshot and self._tweakdata.headshot_kill_points or self._tweakdata.normal_kill_points) or 1

	if is_player_character then
		if attack_data.headshot then
			self:progress_dialog_count("headshot", 1)
		end

		if weapon_id == "money" or weapon_id == "money_crew" then
			self:progress_dialog_count("moneyshot", 1)
		end
	end

	if is_boss_kill then
		local selector = WeightedSelector:new()

		for _, data in ipairs(self._tweakdata.piggydozer_bag_drops) do
			selector:add(data.bags, data.weight)
		end

		local bag_spawn_amount = selector:select()
		local pos = dead_unit:position()
		local new_fountain = {
			next_spawn_t = 0.5,
			spawned_amount = 0,
			bag_spawn_amount = bag_spawn_amount,
			pos = pos
		}

		table.insert(self._boss_bag_fountains, new_fountain)
	else
		self._feed_drop_count = self._feed_drop_count + feed_amount

		if is_player_character and not is_sniper_kill and self._tweakdata.drop_count <= self._feed_drop_count then
			self._feed_drop_count = 0

			self:server_spawn_bag(dead_unit:position(), Rotation(), 200)
		end
	end
end

function MutatorPiggyRevenge:server_spawn_bag(wanted_pos, wanted_rot, push_force)
	if Network:is_server() and self:can_spawn_bag() then
		local pos = mvec1

		mvector3.set(pos, math.UP)
		mvector3.multiply(pos, 10)
		mvector3.add(pos, wanted_pos)

		local rot = mrot1

		mrotation.set_zero(rot)
		mrotation.multiply(rot, wanted_rot)

		local unit = World:spawn_unit(Idstring(MutatorPiggyRevenge.bag_unit), pos, rot)
		unit:carry_data().EXPIRE_CUSTOM_PARAMS = MutatorPiggyRevenge.bag_expire_custom_params

		if push_force then
			local dir = mvec2

			mvector3.set(dir, math.UP)
			mvector3.spread(dir, math.random(12, 53))

			local gravity_dir = mvec3
			local distance = mvector3.direction(gravity_dir, pos, self._position)
			local gravity_power = math.map_range_clamped(distance, 100, 2000, 0.2 * (self._pig_level - 1), 0)

			mvector3.lerp(dir, dir, gravity_dir, gravity_power)
			mvector3.normalize(dir)

			push_force = push_force + 200 * gravity_power

			unit:push(unit:mass(), dir * push_force)
		end

		self:progress_dialog_count("bag_spawn_1", 1)
		self:progress_dialog_count("bag_spawn_10", 1)
		self._sound_source:post_event("PD9A_BagSpawn")
	end
end

function MutatorPiggyRevenge:sync_explode_piggybank()
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

	local secure_zone_unit = self._secure_zone_units[self._current_pig_level_tweak.secure_zone_index]

	if secure_zone_unit then
		secure_zone_unit:set_enabled(false)
	end

	if self._current_pig_level_tweak.dialogs.explode then
		self:announcer_say(self._current_pig_level_tweak.dialogs.explode)
	end

	self._sound_source:post_event("PD9A_Idle_STOP")
	Telemetry:send_on_game_event_piggyrevenge_exploded({
		progress = self._pig_fed_count,
		stage = self._exploded_pig_level
	})
end

function MutatorPiggyRevenge:_remove_piggybank_clbk(piggybank_unit)
	piggybank_unit:interaction():set_active(false)
	piggybank_unit:set_enabled(false)
end

function MutatorPiggyRevenge:_explode_piggybank_clbk()
	managers.network:session():send_to_peers_synched("sync_explode_piggybank")
	self:sync_explode_piggybank()
end

function MutatorPiggyRevenge:activate_buff(buff_id, sync_if_host)
	local buff_td = self._tweakdata.buffs[buff_id]

	if not buff_td then
		print("[MutatorPiggyRevenge] activate_buff(). Unable to find tweakdata from ID:", buff_id)

		return
	end

	print("[MutatorPiggyRevenge] activate_buff()", buff_td.func_name)

	local func = self["activate_" .. buff_td.func_name .. "_buff"]

	if func then
		func(self, buff_td)
		managers.environment_controller:set_buff_effect(0.5)
		managers.hud:post_event("stinger_10th_ability_on")
		managers.event_jobs:award("pda10_buff_objective")
		self:announcer_say(buff_td.vo_line)

		if Network:is_server() and sync_if_host then
			managers.network:session():send_to_peers_synched("sync_gain_buff", buff_id)
		end

		self._active_buffs = self._active_buffs or {}

		table.insert(self._active_buffs, buff_id)
	else
		print("[MutatorPiggyRevenge] Missing func", buff_name)
	end
end

function MutatorPiggyRevenge:is_buff_active(buff_id)
	self._active_buffs = self._active_buffs or {}

	return table.contains(self._active_buffs, buff_id)
end

function MutatorPiggyRevenge:activate_categories_buff(categories)
	if not Network:is_server() then
		return
	end

	for index, item in ipairs(categories or {}) do
		local availible_buffs = self._buff_pool[item]

		if availible_buffs then
			local index = math.random(#availible_buffs)
			local buff_id = availible_buffs[index]

			table.remove(availible_buffs, index)

			local buff_td = self._tweakdata.buffs[buff_id]

			self:activate_buff(buff_id, true)
		end
	end
end

function MutatorPiggyRevenge:add_buff_hud(buff_td)
	managers.hud:add_buff({
		time_left = -1,
		buff_id = buff_td.func_name,
		name_id = buff_td.hud_string_id,
		color = buff_td.color,
		icon_texture = tweak_data.mutators.piggyrevenge.buff_textures[buff_td.category_type].texture
	})
end

function MutatorPiggyRevenge:activate_drill_speed_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_bag_speed_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_bag_throw_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_ammo_modifier_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_critical_chance_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_ammo_free_chance_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_headshot_aoe_buff(buff_td)
	managers.player:register_message(Message.OnLethalHeadShot, "activate_headshot_aoe_buff", callback(self, self, "on_headshot_aoe"))
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_damage_reduction_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_auto_revive_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_faster_armor_regen_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:activate_downed_free_chance_buff(buff_td)
	self:add_buff_hud(buff_td)
end

function MutatorPiggyRevenge:get_bag_speed_increase_multiplier()
	return self:is_buff_active("bag_speed") and (self._tweakdata.buffs.bag_speed.speed_multiplier or 1) or 1
end

function MutatorPiggyRevenge:get_interaction_override()
	return self:is_buff_active("bag_speed") and (self._tweakdata.buffs.bag_speed.interaction_override or 1) or 1
end

function MutatorPiggyRevenge:get_bag_throw_multiplier(carry_id)
	return self:is_buff_active("bag_throw") and carry_id == "pda9_feed" and (self._tweakdata.buffs.bag_throw.throw_multiplier or 1) or 1
end

function MutatorPiggyRevenge:damage_reduction_multiplier()
	return self:is_buff_active("damage_reduction") and 1 - (self._tweakdata.buffs.damage_reduction.damage_reduction_multiplier or 0) or 1
end

function MutatorPiggyRevenge:additional_critical_chance()
	return self:is_buff_active("critical_chance") and self._tweakdata.buffs.critical_chance.additional_critical_chance or 0
end

function MutatorPiggyRevenge:armor_regen_timer_multiplier()
	return self:is_buff_active("faster_armor_regen") and self._tweakdata.buffs.faster_armor_regen.armor_regen_timer_multiplier or 1
end

function MutatorPiggyRevenge:drill_speed_multiplier()
	return self:is_buff_active("drill_speed") and self._tweakdata.buffs.drill_speed.drill_speed_multiplier or 1
end

function MutatorPiggyRevenge:auto_revive_timer()
	return self:is_buff_active("auto_revive") and self._tweakdata.buffs.auto_revive.revive_timer or nil
end

function MutatorPiggyRevenge:check_ignore_reduce_revive()
	return self:is_buff_active("downed_free_chance") and math.rand(1) <= self._tweakdata.buffs.downed_free_chance.chance_percentage or nil
end

function MutatorPiggyRevenge:check_modify_weapon(weapon_base)
	if self:is_buff_active("ammo_modifier") then
		local tweak_modifiers = self._tweakdata.buffs.ammo_modifier.weapon_modifiers or {}
		local selector = WeightedSelector:new()

		for _, data in ipairs(tweak_modifiers) do
			selector:add(data, data.weight)
		end

		local modifier = selector:select()

		weapon_base:override_bullet_class(modifier.bullet_class)
		weapon_base:override_shoot_through(modifier.shoot_through_wall, modifier.shoot_through_shield, modifier.shoot_through_enemy)
	end
end

function MutatorPiggyRevenge:get_free_ammo_chance()
	if not self:is_buff_active("ammo_free_chance") then
		return false
	end

	local chance = math.random()

	return chance < (self._tweakdata.buffs.ammo_free_chance.free_ammo_percentage or 1 or 1)
end

function MutatorPiggyRevenge:on_headshot_aoe(attack_data)
	if attack_data then
		local dead_unit = attack_data.col_ray and attack_data.col_ray.unit
		local dead_tweak_table = dead_unit and dead_unit:base() and dead_unit:base()._tweak_table

		if not dead_tweak_table then
			return
		end

		local attacker_unit = attack_data.attacker_unit
		local is_civilian = CopDamage.is_civilian(dead_tweak_table)
		local is_local_player = attacker_unit == managers.player:player_unit()

		if is_civilian or not is_local_player then
			return
		end

		local weapon_unit = attack_data.weapon_unit

		if attacker_unit and attacker_unit:base() and attacker_unit:base().thrower_unit then
			attacker_unit = attacker_unit:base():thrower_unit()
			weapon_unit = attack_data.attacker_unit
		end

		local weapon_id = alive(weapon_unit) and weapon_unit:base().name_id or attack_data.name_id or attack_data.weapon_id or false
		local from_pos = dead_unit and dead_unit:movement() and dead_unit:movement().m_head_pos and dead_unit:movement():m_head_pos() or attack_data.pos or dead_unit:position()
		local aoe_radius = self._tweakdata.buffs.headshot_aoe.radius
		local damage = (attack_data.damage or 1) * self._tweakdata.buffs.headshot_aoe.damage_multiplier
		local units_detected = World:find_units("sphere", from_pos, aoe_radius, managers.slot:get_mask("enemies"))
		local slotmask = managers.slot:get_mask("bullet_impact_targets_no_criminals") - 17

		for _, unit in ipairs(units_detected) do
			local hit_dmg_ext = unit:character_damage()

			if hit_dmg_ext and hit_dmg_ext.damage_simple then
				local aim_pos = unit:movement():m_head_pos()
				local col_ray = World:raycast("ray", from_pos, aim_pos, "slot_mask", slotmask, "ignore_unit", dead_unit)

				if col_ray and col_ray.unit == unit then
					hit_dmg_ext:damage_simple({
						variant = "bullet",
						damage = damage,
						attacker_unit = attacker_unit,
						weapon_unit = weapon_unit,
						pos = aim_pos,
						attack_dir = col_ray.ray
					})

					local distance = mvector3.distance(from_pos, aim_pos)

					managers.game_play_central:play_impact_flesh({
						col_ray = col_ray
					})
					managers.game_play_central:play_impact_sound_and_effects({
						col_ray = col_ray
					})

					local trail = World:effect_manager():spawn({
						effect = self.AOE_TRAIL_EFFECT,
						position = from_pos,
						normal = col_ray.ray
					})

					mvector3.set_y(self._aoe_trail_length, distance)
					World:effect_manager():set_simulator_var_vector2(trail, idstr_trail, idstr_simulator_length, idstr_size, self._aoe_trail_length)
				end
			end
		end
	end
end

function MutatorPiggyRevenge:spawn_piggydozer()
	if not Network:is_server() then
		return
	end

	table.insert(self._boss_spawn_que, {
		t = 5
	})
end

function MutatorPiggyRevenge:_server_on_boss_spawned()
	managers.network:session():send_to_peers_synched("sync_on_snowman_spawned")
	self:sync_on_snowman_spawned()
end

function MutatorPiggyRevenge:sync_on_snowman_spawned()
	self:announcer_say("Play_alm_pda9_20", false)

	self._boss_count = self._boss_count + 1

	if self._boss_count == 1 then
		managers.hud:add_buff({
			buff_id = "piggydozer_spawn",
			name_id = "hud_buff_piggydozer_warning",
			time_left = -1,
			icon_texture = "guis/textures/pd2/hud_icon_assaultbox",
			negative = -1,
			color = tweak_data.screen_colors.important_1,
			icon_texture_rect = {
				0,
				0,
				32,
				32
			}
		})
	end
end

function MutatorPiggyRevenge:on_boss_killed(dead_unit, damage_info)
	managers.event_jobs:award("pda10_dozer_objective")

	self._boss_count = self._boss_count - 1

	if self._boss_count == 0 then
		managers.hud:remove_buff("piggydozer_spawn")
	end

	if Network:is_server() then
		-- Nothing
	end
end

function MutatorPiggyRevenge:on_unit_start_interact(interaction_id, interaction_tweak_data)
	if interaction_tweak_data.mutator_sound_start and self._pig_level < 6 then
		self:announcer_say(interaction_tweak_data.mutator_sound_start)
	end
end

function MutatorPiggyRevenge:safe_run_sequence(unit, sequence)
	if alive(unit) and unit:damage() and unit:damage():has_sequence(sequence) then
		unit:damage():run_sequence_simple(sequence)
	end
end

function MutatorPiggyRevenge:announcer_say(dialog)
	managers.dialog:queue_dialog(dialog, {
		on_unit = self._announcer_unit,
		done_cbk = self.dialog_done_cbk
	})
end

function MutatorPiggyRevenge:dialog_done_cbk(reason)
	print("MutatorPiggyRevenge:dialog_done_cbk", reason)
end

function MutatorPiggyRevenge:got_mass_drop()
	return self:get_exploded_pig_level()
end

function MutatorPiggyRevenge:get_mass_drop_data()
	local pig_level = self:get_exploded_pig_level()

	if not pig_level then
		return nil
	end

	local rewards = self._tweakdata.pig_levels[pig_level].rewards

	if not rewards then
		return nil
	end

	local cash = nil

	if rewards.cash_multiplier then
		cash = managers.money:heist_spending() * (rewards.cash_multiplier - 1)
	end

	local data = {
		additional_lootdrops = rewards.additional_lootdrops or 0,
		coins = rewards.coins or 0,
		cash = cash
	}

	return data
end

function MutatorPiggyRevenge:check_heist_end_achievements(heist_success)
	if not heist_success or not self._exploded_pig_level then
		return
	end

	managers.event_jobs:award("pda10_heist_objective")
end
