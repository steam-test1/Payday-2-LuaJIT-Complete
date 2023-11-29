MutatorCG22 = MutatorCG22 or class(BaseMutator)
MutatorCG22._type = "MutatorCG22"
MutatorCG22.name_id = "mutator_CG22"
MutatorCG22.desc_id = "mutator_CG22_desc"
MutatorCG22.package = "packages/event_cg22"
MutatorCG22.disables_achievements = false
MutatorCG22.categories = {
	"event"
}
MutatorCG22.tree = "units/pd2_dlc_cg22/props/cg22_prop_int_xmas_tree/cg22_prop_int_xmas_tree"
MutatorCG22.sled = "units/pd2_dlc_cg22/props/cg22_prop_sled/cg22_prop_sled"
MutatorCG22.shredder = "units/pd2_dlc_cg22/props/cg22_prop_shredder/cg22_prop_shredder"
MutatorCG22.snowman = "units/pd2_dlc_cg22/characters/ene_snowman_boss/ene_snowman_boss"
MutatorCG22.secure_zone = "units/pd2_dlc_pda9/props/pda9_circle_marker/pda9_prop_circle_marker_stage_0"
MutatorCG22.santa = "units/pd2_dlc_cg22/characters/civ_male_pilot_cg22/civ_male_pilot_cg22"
MutatorCG22.announcer_unit = "units/pd2_dlc_pda9/characters/almir/almir"
MutatorCG22.bags = {
	"units/pd2_dlc_cg22/pickups/cg22_pku_bag/cg22_pku_bag",
	"units/pd2_dlc_cg22/pickups/cg22_pku_bag/cg22_pku_bag_green",
	"units/pd2_dlc_cg22/pickups/cg22_pku_bag/cg22_pku_bag_yellow"
}
MutatorCG22.bag_carry_ids = {
	"cg22_bag",
	"cg22_bag_green",
	"cg22_bag_yellow"
}
MutatorCG22.bag_spawn_sequences = {
	"spawn_money_present_pos_1",
	"spawn_money_present_pos_2",
	"spawn_money_present_pos_3",
	"spawn_xp_present_pos_1",
	"spawn_xp_present_pos_2",
	"spawn_xp_present_pos_3",
	"spawn_continental_present_pos_1",
	"spawn_continental_present_pos_2",
	"spawn_continental_present_pos_3"
}
MutatorCG22.briefing_dialog = "Play_alm_xmas22_brf"
MutatorCG22.briefing_event = "Play_alm_xmas22_cbf"
local mvec1 = Vector3()
local mvec2 = Vector3()
local mrot1 = Rotation()
local mrot2 = Rotation()

function MutatorCG22:register_values(mutator_manager)
end

function MutatorCG22:next_interupt_stage(interupt)
	return nil
end

function MutatorCG22:setup(mutator_manager)
	print("MutatorCG22:setup")

	self._tweakdata = tweak_data.mutators.cg22
	local spawn_data = tweak_data.mutators:get_cg22_tree_coordinates()[Global.level_data.level_id]
	self._position = spawn_data and spawn_data.position or Vector3()
	self._rotation = spawn_data and spawn_data.rotation or Rotation()
	local sled_data = tweak_data.mutators:get_cg22_sled_coordinates()[Global.level_data.level_id]
	self._sled_position = sled_data and sled_data.position + Vector3(0, 0, 10) or self._position + Vector3(600, 0, 0)
	self._sled_rotation = sled_data and Rotation(sled_data.rotation:yaw() + 180, sled_data.rotation:pitch(), sled_data.rotation:roll()) or Rotation()
	local shredder_data = tweak_data.mutators:get_cg22_shredder_offsets()[Global.level_data.level_id]
	self._shredder_position = self._position + (shredder_data and shredder_data.position or self._tweakdata.shredder_generic_offset)
	local look_rot = Rotation:look_at(self._shredder_position, self._position, Vector3(0, 0, 1))
	self._shredder_rotation = Rotation(look_rot:yaw() - 90, 0, 0)
	self._shredder_direction = Vector3(math.cos(self._shredder_rotation:yaw()), math.sin(self._shredder_rotation:yaw()), 0)
	self._sled_sound_source = SoundDevice:create_source("CG22Sled")

	self._sled_sound_source:set_position(self._sled_position)

	self._shredder_sound_source = SoundDevice:create_source("CG22Shredder")

	self._shredder_sound_source:set_position(self._shredder_position)

	self._sled_bag_check_t = 0
	self._shredder_bag_check_t = 0
	self._tree_area_check_t = 0
	self._bag_slotmask = World:make_slot_mask(14)
	self._player_slotmask = World:make_slot_mask(2, 3, 4, 5)
	self._event_started = false
	self._tree_shake_timer = false
end

function MutatorCG22:on_game_started(mutator_manager)
	print("MutatorCG22:on_game_started")

	self._bags_collected = {
		shredded = {
			cg22_bag_green = 0,
			cg22_bag_yellow = 0,
			cg22_bag = 0
		},
		sledded = {
			cg22_bag_green = 0,
			cg22_bag_yellow = 0,
			cg22_bag = 0
		}
	}
	self._enemy_buffs = {
		cg22_bag_green = 0,
		cg22_bag_yellow = 0,
		cg22_bag = 0
	}
	self._temp_buffs = {
		ammo_types = {}
	}
	self._last_temp_buffs = {}
	self._perma_buffs = {
		bag_speed_amount = 0
	}
	self._next_player_buff = {
		cg22_bag_green = 1,
		cg22_bag_yellow = 1,
		cg22_bag = 1
	}
	self._announcer_unit = World:spawn_unit(Idstring(MutatorCG22.announcer_unit), self._position + Vector3(0, 0, 100), self._rotation)

	if Network:is_server() then
		self._bag_que = {}
		self._bag_pool = deep_clone(self._tweakdata.default_bag_pool)
		self._next_spawn_pos = -1
		self._snowman_spawn_threshold = self._tweakdata.snowman_spawn_per_bag or 9
		self._snowman_spawn_que = {}
		self._voice_line_amount_triggers = deep_clone(self._tweakdata.voice_line_amount_triggers)
		self._voice_line_timers = deep_clone(self._tweakdata.voice_line_timers)
		self._has_played_seek_tree_vo = false
		self._has_played_spawn_present_vo = false
		self._has_played_first_pickup = false

		for index, item in pairs(self._voice_line_amount_triggers) do
			if item.initial and item.trigger_amount then
				item.trigger_amount = 1
			end
		end

		for index, item in pairs(self._voice_line_timers) do
			item.timer = false
		end

		self._voice_line_timers.reminder_tree.timer = self._tweakdata.voice_line_timers.reminder_tree.timer

		self:spawn_network_units()
	end

	self._zone_1 = World:spawn_unit(Idstring(MutatorCG22.secure_zone), self._sled_position + Vector3(0, 0, -10), self._sled_rotation)

	self._zone_1:set_enabled(false)

	self._zone_2 = World:spawn_unit(Idstring(MutatorCG22.secure_zone), self._shredder_position + self._shredder_direction * 100, self._shredder_rotation)

	self._zone_2:set_enabled(false)
end

function MutatorCG22:set_AI_enabled(state)
	print("MutatorCG22:set_AI_enabled", state)

	if state then
		self:spawn_network_units()
	else
		self:remove_network_units()
	end
end

function MutatorCG22:spawn_network_units()
	if Network:is_server() and not self._sync_listener_key then
		self._tree = World:spawn_unit(Idstring(MutatorCG22.tree), self._position, self._rotation)
		self._sled = World:spawn_unit(Idstring(MutatorCG22.sled), self._sled_position, self._sled_rotation)
		local direction = Vector3(math.cos(self._sled_rotation:yaw()), math.sin(self._sled_rotation:yaw()), 0)
		local santa_rotation = Rotation(self._sled:rotation():yaw() + 180, self._sled:rotation():pitch(), self._sled:rotation():roll())
		self._santa = World:spawn_unit(Idstring(MutatorCG22.santa), self._sled:position() + Vector3(math.cos(self._sled:rotation():yaw() + 90) * -115, math.sin(self._sled:rotation():yaw() + 90) * -115, 0) + Vector3(0, 0, 30), santa_rotation)

		self._santa:movement():set_team(managers.groupai:state():team_data("cg22"))
		self._santa:movement():play_redirect("cm_so_pilot_drunk_idle")

		self._shredder = World:spawn_unit(Idstring(MutatorCG22.shredder), self._shredder_position, self._shredder_rotation)
		self._tree:damage().external_spawn_unit_callback = self.damage_on_present_spawned

		self._tree:damage():add_trigger_callback("interact_tree_clbk", callback(self, self, "_on_tree_interacted", self._tree))

		if managers.navigation:is_data_ready() then
			managers.navigation:add_pos_reservation({
				radius = 350,
				position = self._position
			})
			managers.navigation:add_obstacle(self._tree, Idstring("c_convex_01"))
			managers.navigation:add_pos_reservation({
				radius = 350,
				position = self._sled_position,
				rotation = self._sled_rotation
			})
			managers.navigation:add_obstacle(self._sled, Idstring("c_box_10"))
			managers.navigation:add_pos_reservation({
				radius = 350,
				position = self._shredder_position
			})
			managers.navigation:add_obstacle(self._shredder, Idstring("c_box_01"))
		else
			Application:error("[MutatorCG22:on_game_started] Incomplete navigation data.")
		end

		self._sync_listener_key = "MutatorCG22"

		managers.network:add_event_listener(self._sync_listener_key, "session_peer_sync_complete", callback(self, self, "on_peer_sync_complete"))
		managers.network:session():send_to_peers_synched("sync_cg22_spawned_units", self._tree, self._sled, self._shredder, self._santa)
		print("MutatorCG22:peers", inspect(managers.network:session()._peers))
	end
end

function MutatorCG22:remove_network_units()
	self:network_delete_unit(self._sled)
	self:network_delete_unit(self._tree)
	self:network_delete_unit(self._shredder)
	self:network_delete_unit(self._santa)

	self._sled = nil
	self._tree = nil
	self._shredder = nil
	self._santa = nil

	if Network:is_server() and self._sync_listener_key then
		managers.network:remove_event_listener(self._sync_listener_key)

		self._sync_listener_key = nil
	end
end

function MutatorCG22:network_delete_unit(unit)
	if alive(unit) then
		if unit:id() ~= -1 then
			detach_unit_from_network(unit)
		end

		World:delete_unit(unit)
	end
end

function MutatorCG22:on_peer_sync_complete(peer)
	peer:send_queued_sync("sync_cg22_spawned_units", self._tree, self._sled, self._shredder, self._santa)
end

function MutatorCG22:client_sync_spawned_units(tree_unit, sled_unit, shredder_unit, santa_unit)
	self._tree = tree_unit
	self._sled = sled_unit
	self._shredder = shredder_unit
	self._santa = santa_unit
end

function MutatorCG22:sync_save(mutator_manager, save_data)
	local my_save_data = {}
	save_data.cg22_mutator = my_save_data
	my_save_data.bags_collected = self._bags_collected
	my_save_data.tree_unit = self._tree
	my_save_data.sled_unit = self._sled
	my_save_data.shredder_unit = self._shredder
	my_save_data.next_buffs = self._next_player_buff
	my_save_data.zone_1_state = self._zone_1:enabled()
	my_save_data.zone_2_state = self._zone_2:enabled()
end

function MutatorCG22:sync_load(mutator_manager, load_data)
	local my_load_data = load_data.cg22_mutator
	self._bags_collected = my_load_data.bags_collected
	self._next_player_buff = my_load_data.next_buffs

	if alive(self._zone_1) and alive(self._zone_2) then
		self._zone_1:set_enabled(my_load_data.zone_1_state)
		self._zone_2:set_enabled(my_load_data.zone_2_state)
	end
end

function MutatorCG22:update(t, dt)
	if not game_state_machine:verify_game_state(GameStateFilters.any_ingame_playing) then
		return
	end

	managers.hud:update_mutator_hud(t, dt)

	if Network:is_server() and self._tree_shake_timer then
		self._tree_shake_timer = self._tree_shake_timer - dt

		if self._tree_shake_timer <= 0 then
			self._tree_shake_timer = self._tweakdata.tree_shake_timer

			self:_spawn_present()
		end
	end

	if Network:is_server() then
		if alive(self._sled) then
			self._sled_bag_check_t = self._sled_bag_check_t - dt

			if self._sled_bag_check_t < 0 then
				self._sled_bag_check_t = self._sled_bag_check_t + 0.1
				local pos = mvec1

				self._sled:get_object(Idstring("c_box_10")):m_position(pos)

				local slotmask = self._bag_slotmask
				local range = 200
				local units = World:find_units_quick("sphere", pos, range, slotmask)

				for _, found_unit in pairs(units) do
					print(found_unit:name())

					if found_unit:carry_data() then
						local id = found_unit:carry_data():carry_id()

						if id == "cg22_bag" or id == "cg22_bag_green" or id == "cg22_bag_yellow" then
							self:_server_present_sledded(found_unit)
						end
					end
				end
			end
		end

		if alive(self._shredder) then
			self._shredder_bag_check_t = self._shredder_bag_check_t - dt

			if self._shredder_bag_check_t < 0 then
				self._shredder_bag_check_t = self._shredder_bag_check_t + 0.1
				local pos = mvec1

				self._shredder:get_object(Idstring("c_box_01")):m_position(pos)

				local slotmask = self._bag_slotmask
				local range = 200
				local units = World:find_units_quick("sphere", pos, range, slotmask)

				for _, found_unit in pairs(units) do
					if found_unit:carry_data() then
						local id = found_unit:carry_data():carry_id()

						if id == "cg22_bag" or id == "cg22_bag_green" or id == "cg22_bag_yellow" then
							self:_server_present_shredded(found_unit)
						end
					end
				end
			end
		end

		if not self._has_played_seek_tree_vo and alive(self._tree) then
			self._tree_area_check_t = self._tree_area_check_t - dt

			if self._tree_area_check_t < 0 then
				self._tree_area_check_t = self._tree_area_check_t + 0.1
				local pos = mvec1

				self._tree:get_object(Idstring("c_box_01")):m_position(pos)

				local slotmask = self._player_slotmask
				local range = self._tweakdata.vo_find_tree_range
				local units = World:find_units_quick("sphere", pos, range, slotmask)

				for _, found_unit in pairs(units) do
					if alive(found_unit) then
						self._has_played_seek_tree_vo = true

						self:announcer_say("Play_alm_xmas22_03", true)

						self._voice_line_timers.reminder_tree.timer = false
					end
				end
			end
		end

		if self._snowman_spawn_que[1] then
			self._snowman_spawn_que[1] = self._snowman_spawn_que[1] - dt

			if self._snowman_spawn_que[1] <= 0 then
				local spawn_success = managers.groupai:state():spawn_snowman_boss()

				if not spawn_success then
					self._snowman_spawn_que[1] = 5

					print("CG22: snowman spawn failed. Trying again in 5s")
				else
					table.remove(self._snowman_spawn_que, 1)
					self:_server_on_snowman_spawned()
					print("CG22: snowman spawn success!")
				end
			end
		end

		for index, item in pairs(self._voice_line_timers) do
			if item.timer then
				item.timer = item.timer - dt

				if item.timer <= 0 then
					item.timer = false

					self:announcer_say(item.voice_line_id, true)
				end
			end
		end
	end

	local player_unit = managers.player:local_player()

	if alive(player_unit) then
		local current_state = managers.player:current_state()
		local invalid_states = {
			"mask_off",
			"clean",
			"civilian"
		}
		local bag_id = managers.network:session() and managers.player:get_my_carry_data() and managers.player:get_my_carry_data().carry_id or ""

		if not managers.interaction:active_unit() and not table.contains(invalid_states, current_state) and (bag_id == "cg22_bag" or bag_id == "cg22_bag_green" or bag_id == "cg22_bag_yellow") then
			local text_string, text_icon = nil
			local current_player_state = managers.player:get_current_state()
			local fwd_ray = current_player_state and current_player_state.get_fwd_ray and current_player_state:get_fwd_ray()

			if fwd_ray and alive(fwd_ray.unit) and fwd_ray.unit:unit_data() and fwd_ray.unit:unit_data().is_a_shredder then
				local macros = {
					BUFF_STRING = ""
				}
				local progress_range = self._tweakdata.progress_range or 500
				local buff_td = self:get_next_buff_for_bag_id(bag_id)
				macros.BUFF_STRING = managers.localization:text(buff_td.hud_string_id)

				if fwd_ray.distance < progress_range then
					text_string = managers.localization:text("hud_cg22_show_buff", macros)
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

	if self._temp_buffs then
		for buff_id, buff_data in pairs(self._temp_buffs) do
			for sub_buff_id, sub_buff_data in pairs(buff_data) do
				sub_buff_data.timer = sub_buff_data.timer - dt

				if sub_buff_data.timer <= 0 then
					self._temp_buffs[buff_id][sub_buff_id] = nil
					local func = self["remove_" .. buff_id .. "_buff"]

					if func then
						func(self, buff_id, sub_buff_id)
					end
				end
			end
		end
	end
end

function MutatorCG22:_on_tree_interacted()
	print("CG22_TreeInteracted!")

	self._tree_shake_timer = self._tweakdata.initial_tree_shake_timer

	if not managers.groupai:state():is_police_called() then
		managers.groupai:state():on_police_called()
	end

	local blue_buff = math.random(#self._tweakdata.buffs.cg22_bag)
	local green_buff = math.random(#self._tweakdata.buffs.cg22_bag_green)
	local yellow_buff = math.random(#self._tweakdata.buffs.cg22_bag_yellow)

	Telemetry:send_on_game_event_tree_interacted()
	self:sync_tree_interacted(blue_buff, green_buff, yellow_buff)
	managers.network:session():send_to_peers_synched("sync_tree_interacted", blue_buff, green_buff, yellow_buff)
end

function MutatorCG22:sync_tree_interacted(blue_buff, green_buff, yellow_buff)
	if alive(self._zone_1) and alive(self._zone_2) then
		self._zone_1:set_enabled(true)
		self._zone_2:set_enabled(true)
	end

	self._next_player_buff = {
		cg22_bag = blue_buff,
		cg22_bag_green = green_buff,
		cg22_bag_yellow = yellow_buff
	}
end

function MutatorCG22:_spawn_present()
	print("CG22__spawn_present!")

	local spawn_pos = nil

	for index = 1, 3 do
		if not alive(self._bag_que[index]) then
			spawn_pos = index
		end
	end

	if not spawn_pos then
		print("CG22__Stop SHAKING!")
		self:announcer_say("Play_alm_xmas22_11", true)

		return
	end

	local max_spawn = 0

	for index, item in pairs(self._bag_pool) do
		max_spawn = max_spawn + item.amount
	end

	local random_spawn_nr = math.random(max_spawn)
	local bag_spawn_item = nil

	for index, item in pairs(self._bag_pool) do
		if random_spawn_nr <= item.amount then
			item.amount = item.amount - 1
			bag_spawn_item = item

			break
		else
			random_spawn_nr = random_spawn_nr - item.amount
		end
	end

	if bag_spawn_item then
		local bag_spawn_string = bag_spawn_item.bag_type
		self._next_spawn_pos = spawn_pos
		local sequence = "spawn_" .. bag_spawn_string .. "_present_pos_" .. spawn_pos

		if max_spawn - 1 <= 0 then
			self._bag_pool = deep_clone(self._tweakdata.default_bag_pool)
		end

		self:sync_spawn_present(self._tree, sequence, self:get_int_from_carry_id(bag_spawn_item.bag_id))
		managers.network:session():send_to_peers_synched("sync_spawn_present", self._tree, sequence, self:get_int_from_carry_id(bag_spawn_item.bag_id))
	else
		print("CG22_Present_spawned: ERROR can't find bag item from bag pool", inspect(self._bag_pool))
	end
end

function MutatorCG22:sync_spawn_present(tree, sequence, bag_carry_int)
	local bag_carry_id = MutatorCG22.bag_carry_ids[bag_carry_int]

	self:safe_run_sequence(tree, sequence)

	if not self._has_played_spawn_present_vo then
		self._has_played_spawn_present_vo = true

		self:announcer_say("Play_alm_xmas22_04", false)
	end

	self._enemy_buffs[bag_carry_id] = self._enemy_buffs[bag_carry_id] + 1
end

function MutatorCG22:damage_on_present_spawned(unit, env)
	managers.mutators:get_mutator(MutatorCG22):server_present_spawned(unit, env)
end

function MutatorCG22:server_present_spawned(unit, env)
	print("Present Spawned!", unit, env)

	if self._next_spawn_pos > 0 then
		self._bag_que[self._next_spawn_pos] = unit
		self._next_spawn_pos = -1
	else
		print("MutatorCG22: self._next_spawn_pos WRONG")
	end
end

function MutatorCG22:_server_present_shredded(bag_unit)
	print("CG22_PresentShredded!", bag_unit:carry_data():latest_peer_id())

	local bag_carry_id = bag_unit:carry_data():carry_id()
	local bag_carry_int = self:get_int_from_carry_id(bag_carry_id)
	local next_buff_index = math.random(#self._tweakdata.buffs[bag_carry_id])
	local last_carry_id = bag_unit:carry_data():latest_peer_id()

	managers.network:session():send_to_peers_synched("sync_present_shredded", self._shredder, bag_carry_int, next_buff_index, last_carry_id)
	self:sync_present_shredded(self._shredder, bag_carry_int, next_buff_index, last_carry_id)

	local debuff_vo_trigger = self._voice_line_amount_triggers.spawn_present_enemy_buff

	if (self:get_total_collected_bags() + (debuff_vo_trigger.initial and 1 or 0)) % debuff_vo_trigger.trigger_amount ~= 0 then
		self:announcer_say("Play_alm_xmas22_07", true)
	end

	self:_server_on_present_collected(bag_unit)
end

function MutatorCG22:sync_present_shredded(shredder_unit, bag_carry_int, next_buff_index, last_carried_player)
	print("CG22_SYNCPresentShredded!")

	local bag_carry_id = MutatorCG22.bag_carry_ids[bag_carry_int]
	self._bags_collected.shredded[bag_carry_id] = self._bags_collected.shredded[bag_carry_id] + 1
	local buff_td = self:get_next_buff_for_bag_id(bag_carry_id)

	self:activate_buff(buff_td)

	self._next_player_buff[bag_carry_id] = next_buff_index

	self._shredder_sound_source:post_event("present_grinder_xmas")
	self:safe_run_sequence(shredder_unit, "explode_effect")
	managers.event_jobs:award("cg22_sacrifice_objective")

	if last_carried_player == managers.network:session():local_peer():id() then
		Telemetry:send_on_game_event_on_bag_collected({
			collection_type = "Shredder",
			bag_type = bag_carry_id
		})
	end
end

function MutatorCG22:_server_present_sledded(bag_unit)
	print("CG22_ServerPresentSledded!", bag_unit:carry_data():latest_peer_id())

	local bag_carry_id = bag_unit:carry_data():carry_id()

	managers.network:session():send_to_peers_synched("sync_present_sledded", self._sled, self:get_int_from_carry_id(bag_carry_id), bag_unit:carry_data():latest_peer_id())
	self:sync_present_sledded(self._sled, self:get_int_from_carry_id(bag_carry_id), bag_unit:carry_data():latest_peer_id())

	local debuff_vo_trigger = self._voice_line_amount_triggers.spawn_present_enemy_buff

	if (self:get_total_collected_bags() + (debuff_vo_trigger.initial and 1 or 0)) % debuff_vo_trigger.trigger_amount ~= 0 then
		self:announcer_say("Play_alm_xmas22_06", true)
	end

	if alive(self._santa) then
		self._santa:movement():play_redirect("cm_so_drunk_sit")
		managers.network:session():send_to_peers_synched("sync_santa_anim", self._santa, "cm_so_drunk_sit")
	end

	self:_server_on_present_collected(bag_unit)
end

function MutatorCG22:sync_present_sledded(sled_unit, bag_carry_int, last_carried_player)
	print("CG22_SyncPresentSledded!")

	local bag_carry_id = MutatorCG22.bag_carry_ids[bag_carry_int]
	self._bags_collected.sledded[bag_carry_id] = self._bags_collected.sledded[bag_carry_id] + 1

	managers.event_jobs:award("cg22_secure_objective")
	self._sled_sound_source:post_event("bag_xmas_secure")
	self:safe_run_sequence(sled_unit, "state_bag_secure_anim")

	if last_carried_player == managers.network:session():local_peer():id() then
		Telemetry:send_on_game_event_on_bag_collected({
			collection_type = "Sled",
			bag_type = bag_carry_id
		})
	end
end

function MutatorCG22:_server_on_snowman_spawned()
	managers.network:session():send_to_peers_synched("sync_on_snowman_spawned")
	self:sync_on_snowman_spawned()
end

function MutatorCG22:sync_on_snowman_spawned()
	managers.hud:add_buff({
		name_id = "hud_buff_snowman_warning",
		buff_id = "snowman_spawn",
		time_left = 5,
		color = Color.white
	})
	self:announcer_say("Play_alm_xmas22_09", false)
end

function MutatorCG22:_server_on_present_collected(bag_unit)
	self._snowman_spawn_threshold = self._snowman_spawn_threshold - 1

	if self._snowman_spawn_threshold <= 0 then
		self._snowman_spawn_threshold = self._tweakdata.snowman_spawn_per_bag

		table.insert(self._snowman_spawn_que, 5)
		print("CG22: Adding snowman to spawn que")
	end

	local amount = self._voice_line_amount_triggers.spawn_present_enemy_buff.trigger_amount - 1

	if amount <= 0 then
		amount = self._tweakdata.voice_line_amount_triggers.spawn_present_enemy_buff.trigger_amount

		self:announcer_say("Play_alm_xmas22_08", true)
	end

	self._voice_line_amount_triggers.spawn_present_enemy_buff.trigger_amount = amount

	if alive(bag_unit) then
		if Network:is_server() or bag_unit:id() == -1 then
			bag_unit:set_slot(0)
		else
			bag_unit:set_enabled(false)
		end
	end
end

function MutatorCG22:get_int_from_carry_id(carry_id)
	for index, item in ipairs(MutatorCG22.bag_carry_ids) do
		if item == carry_id then
			return index
		end
	end

	return -1
end

function MutatorCG22:get_collected_bags()
	return self._bags_collected
end

function MutatorCG22:get_enemy_blue_multiplier(bag_unit)
	local enemy_buffs = self._enemy_buffs
	local buffs_td = self._tweakdata.enemy_buff_values

	return 1 - math.min(enemy_buffs.cg22_bag * buffs_td.cg22_bag.scale, buffs_td.cg22_bag.max_multiplier)
end

function MutatorCG22:get_enemy_green_multiplier(bag_unit)
	local enemy_buffs = self._enemy_buffs
	local buffs_td = self._tweakdata.enemy_buff_values

	return math.min(1 + enemy_buffs.cg22_bag_green * buffs_td.cg22_bag_green.scale, buffs_td.cg22_bag_green.max_multiplier)
end

function MutatorCG22:get_enemy_yellow_multiplier(bag_unit)
	local enemy_buffs = self._enemy_buffs
	local buffs_td = self._tweakdata.enemy_buff_values

	return math.min(1 + enemy_buffs.cg22_bag_yellow * buffs_td.cg22_bag_yellow.scale, buffs_td.cg22_bag_yellow.max_multiplier)
end

function MutatorCG22:can_enemy_be_affected_by_buff(buff_name, enemy_unit)
	if not managers.enemy:is_enemy(enemy_unit) then
		return false
	end

	local exceptions = self._tweakdata.enemy_buff_exceptions[buff_name]

	if not exceptions then
		return true
	end

	if enemy_unit:base().char_tweak_name and exceptions[enemy_unit:base():char_tweak_name()] then
		return false
	end

	return true
end

function MutatorCG22:get_money_collected()
	return self._bags_collected.sledded.cg22_bag_green * self._tweakdata.bag_value.cg22_bag_green * (self._tweakdata.diff_reward_multiplier[Global.game_settings.difficulty] or 1) * (1 + self:get_total_sledded_bags() * self._tweakdata.bag_multiplier)
end

function MutatorCG22:get_xp_collected()
	return self._bags_collected.sledded.cg22_bag * self._tweakdata.bag_value.cg22_bag * (self._tweakdata.diff_reward_multiplier[Global.game_settings.difficulty] or 1) * (1 + self:get_total_sledded_bags() * self._tweakdata.bag_multiplier)
end

function MutatorCG22:get_coins_collected()
	return self._bags_collected.sledded.cg22_bag_yellow * self._tweakdata.bag_value.cg22_bag_yellow
end

function MutatorCG22:get_bag_speed_increase_multiplier()
	local buff_td = self._tweakdata.buffs.cg22_bag_yellow[1]

	return math.min(1 + self._perma_buffs.bag_speed_amount * buff_td.scale, buff_td.max_multiplier)
end

function MutatorCG22:get_active_temp_buff(buff_type_id)
	return self._temp_buffs and self._temp_buffs[buff_type_id] and next(self._temp_buffs[buff_type_id]) and self._temp_buffs[buff_type_id] or nil
end

function MutatorCG22:get_total_sledded_bags()
	return self._bags_collected.sledded.cg22_bag + self._bags_collected.sledded.cg22_bag_green + self._bags_collected.sledded.cg22_bag_yellow
end

function MutatorCG22:get_total_collected_bags()
	return self._bags_collected.sledded.cg22_bag + self._bags_collected.sledded.cg22_bag_green + self._bags_collected.sledded.cg22_bag_yellow + self._bags_collected.shredded.cg22_bag + self._bags_collected.shredded.cg22_bag_green + self._bags_collected.shredded.cg22_bag_yellow
end

function MutatorCG22:main_category()
	return "event"
end

function MutatorCG22:activate_buff(buff_td)
	print("[MutatorBirthday] activate_buff()", buff_td.func_name)

	local func = self["activate_" .. buff_td.func_name .. "_buff"]

	if func then
		func(self, buff_td)
		managers.environment_controller:set_buff_effect(0.5)
		managers.hud:post_event("stinger_10th_ability_on")
	else
		print("[MutatorCG22] Missing func", buff_name)
	end
end

function MutatorCG22:add_temp_buff(buff_id, sub_buff_id, buff_data)
	local buff_storage = self._temp_buffs and self._temp_buffs[buff_id]

	if not buff_storage then
		return
	end

	if buff_storage[sub_buff_id] then
		buff_storage[sub_buff_id].timer = buff_data.duration
	else
		buff_storage[sub_buff_id] = {
			timer = buff_data.duration
		}
	end

	self._last_temp_buffs[buff_id] = sub_buff_id
end

function MutatorCG22:get_last_temp_buff_by_id(buff_id)
	return self._last_temp_buffs and self._last_temp_buffs[buff_id]
end

function MutatorCG22:get_next_buff_for_bag_id(bag_id)
	return self._tweakdata.buffs[bag_id][self._next_player_buff[bag_id]]
end

function MutatorCG22:get_random_buff_no_repeat(buff_selection, last_buff)
	local buff_amount = #buff_selection

	if buff_amount < 2 then
		return buff_amount == 1 and buff_selection[1] or nil
	end

	local selected_buff = nil

	repeat
		selected_buff = buff_selection[math.random(buff_amount)]
	until selected_buff ~= last_buff

	return selected_buff
end

function MutatorCG22:activate_health_refresh_buff(buff_td)
	local unit = managers.player:player_unit()
	local unit_damage = alive(unit) and unit:character_damage() or nil

	if unit_damage then
		unit_damage:restore_health(buff_td.amount, true)
		managers.hud:add_buff({
			name_id = "buff_td.hud_string_id",
			buff_id = "recover_health",
			time_left = 2,
			color = buff_td.color
		})
	end
end

function MutatorCG22:activate_ammo_refresh_buff(buff_td)
	local unit = managers.player:player_unit()

	if alive(unit) then
		for id, weapon in pairs(unit:inventory():available_selections()) do
			if alive(weapon.unit) then
				weapon.unit:base():replenish()
				managers.hud:set_ammo_amount(id, weapon.unit:base():ammo_info())
				managers.hud:add_buff({
					buff_id = "ammo_refresh",
					time_left = 2,
					name_id = buff_td.hud_string_id,
					color = buff_td.color
				})
			end
		end
	end
end

function MutatorCG22:activate_bag_speed_increase_buff(buff_td)
	self._perma_buffs.bag_speed_amount = self._perma_buffs.bag_speed_amount + 1

	managers.hud:add_buff({
		buff_id = "bag_speed_increase",
		time_left = 2,
		name_id = buff_td.hud_string_id,
		color = buff_td.color
	})
end

function MutatorCG22:activate_ammo_types_buff(buff_td)
	local ammo_type = self:get_random_buff_no_repeat(buff_td.ammo_types, self:get_last_temp_buff_by_id("ammo_types"))

	if not ammo_type then
		return
	end

	self:add_temp_buff("ammo_types", ammo_type, buff_td)

	local unit = managers.player:player_unit()
	local unit_inventory = alive(unit) and unit:inventory() or nil

	if unit_inventory and unit_inventory.ammo_type_buff_add then
		unit_inventory:ammo_type_buff_add(ammo_type)
	end

	managers.hud:add_buff({
		buff_id = "ammo_types_" .. ammo_type,
		name_id = buff_td.hud_string_id .. "_" .. ammo_type,
		color = buff_td.color,
		time_left = buff_td.duration
	})
end

function MutatorCG22:remove_ammo_types_buff(buff_id, ammo_type)
	local unit = managers.player:player_unit()
	local unit_inventory = alive(unit) and unit:inventory() or nil

	if unit_inventory and unit_inventory.ammo_type_buff_remove then
		unit_inventory:ammo_type_buff_remove(ammo_type)
	end
end

function MutatorCG22:safe_run_sequence(unit, sequence)
	if alive(unit) and unit:damage() and unit:damage():has_sequence(sequence) then
		unit:damage():run_sequence_simple(sequence)
	end
end

function MutatorCG22:sync_santa_anim(unit, anim_id)
	if alive(unit) then
		unit:movement():play_redirect("cm_so_drunk_sit")
	end
end

function MutatorCG22:on_snowman_killed(unit, damage_info)
	managers.event_jobs:award("cg22_snowman_objective")

	if Network:is_server() then
		Telemetry:send_on_game_event_snoman_death({
			weapon_id = alive(damage_info.weapon_unit) and damage_info.weapon_unit:base().name_id or ""
		})
	end
end

function MutatorCG22:on_bag_pickup(carry_id)
	if not self._has_played_first_pickup and carry_id == "cg22_bag" or carry_id == "cg22_bag_green" or carry_id == "cg22_bag_yellow" then
		self._has_played_first_pickup = true
		local success = self:announcer_say("Play_alm_xmas22_05", false)
	end
end

function MutatorCG22:announcer_say(dialog, sync)
	local success = managers.dialog:queue_dialog(dialog, {
		on_unit = self._announcer_unit
	})

	if sync and Network:is_server() then
		managers.network:session():send_to_peers_synched("sync_cg22_dialog", dialog)
	end

	return success
end

function MutatorCG22:get_intro_event(default_intro_event)
	return "Play_alm_xmas22_01"
end

function MutatorCG22:get_outro_event(default_outro_event)
	return "Play_alm_xmas22_end_win"
end

function MutatorCG22:get_failure_event()
	return "Play_alm_xmas22_end_fail"
end

function MutatorCG22:check_heist_end_achievements(heist_success)
	if not heist_success then
		return
	end
end
