local mvec3_set = mvector3.set
local mvec3_sub = mvector3.subtract
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_dis_sq = mvector3.distance_sq
local t_rem = table.remove
local t_ins = table.insert
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
EnemyManager = EnemyManager or class()
EnemyManager._nr_i_lod = {
	{
		2,
		2
	},
	{
		5,
		2
	},
	{
		10,
		5
	}
}

function EnemyManager:init()
	self._unit_clbk_key = "EnemyManager"
	self._timer = TimerManager:game()
	self._magazines = {}
	self._MAX_MAGAZINES = 30

	self:_init_enemy_data()

	self._shield_disposal_lifetime = 60
	self._MAX_NR_SHIELDS = 8
	self._MAX_NR_CORPSES = managers.user:get_setting("corpse_limit") or 8

	managers.user:add_setting_changed_callback("corpse_limit", callback(self, self, "corpse_limit_changed_clbk"))
end

function EnemyManager:update(t, dt)
	self._queued_task_executed = false

	self:_update_gfx_lod()
	self:_update_queued_tasks(t, dt)
end

function EnemyManager:corpse_limit()
	local limit = self._MAX_NR_CORPSES
	limit = managers.mutators:modify_value("EnemyManager:corpse_limit", limit)

	return limit
end

function EnemyManager:corpse_limit_changed_clbk(setting_name, old_limit, new_limit)
	self._MAX_NR_CORPSES = new_limit

	if not self:is_corpse_disposal_enabled() then
		return
	end

	local corpse_disposal_id = self._corpse_disposal_id

	if corpse_disposal_id then
		if self._enemy_data.nr_corpses <= self:corpse_limit() then
			self._corpse_disposal_id = nil

			self:unqueue_task(corpse_disposal_id)
		end
	elseif self:corpse_limit() < self._enemy_data.nr_corpses then
		corpse_disposal_id = "EnemyManager._upd_corpse_disposal"
		self._corpse_disposal_id = corpse_disposal_id

		self:queue_task(corpse_disposal_id, EnemyManager._upd_corpse_disposal, self, self._timer:time())
	end
end

function EnemyManager:shield_limit()
	return self._MAX_NR_SHIELDS
end

function EnemyManager:_update_gfx_lod()
	if self._gfx_lod_data.enabled and managers.navigation:is_data_ready() then
		local camera_rot = managers.viewport:get_current_camera_rotation()

		if camera_rot then
			local pl_tracker, cam_pos = nil
			local pl_fwd = camera_rot:y()
			local player = managers.player:player_unit()

			if player then
				pl_tracker = player:movement():nav_tracker()
				cam_pos = player:movement():m_head_pos()
			else
				pl_tracker = false
				cam_pos = managers.viewport:get_current_camera_position()
			end

			local entries = self._gfx_lod_data.entries
			local units = entries.units
			local states = entries.states
			local move_ext = entries.move_ext
			local trackers = entries.trackers
			local com = entries.com
			local chk_vis_func = pl_tracker and pl_tracker.check_visibility
			local unit_occluded = Unit.occluded
			local occ_skip_units = managers.occlusion._skip_occlusion
			local world_in_view_with_options = World.in_view_with_options

			for i, state in ipairs(states) do
				if not state and alive(units[i]) and (occ_skip_units[units[i]:key()] or (not pl_tracker or chk_vis_func(pl_tracker, trackers[i])) and not unit_occluded(units[i])) and world_in_view_with_options(World, com[i], 0, 110, 18000) then
					states[i] = 1

					units[i]:base():set_visibility_state(1)
				end
			end

			if #states > 0 then
				local anim_lod = managers.user:get_setting("video_animation_lod")
				local nr_lod_1 = self._nr_i_lod[anim_lod][1]
				local nr_lod_2 = self._nr_i_lod[anim_lod][2]
				local nr_lod_total = nr_lod_1 + nr_lod_2
				local imp_i_list = self._gfx_lod_data.prio_i
				local imp_wgt_list = self._gfx_lod_data.prio_weights
				local nr_entries = #states
				local i = self._gfx_lod_data.next_chk_prio_i

				if nr_entries < i then
					i = 1
				end

				local start_i = i

				repeat
					if states[i] and alive(units[i]) then
						if not occ_skip_units[units[i]:key()] and (pl_tracker and not chk_vis_func(pl_tracker, trackers[i]) or unit_occluded(units[i])) then
							states[i] = false

							units[i]:base():set_visibility_state(false)
							self:_remove_i_from_lod_prio(i, anim_lod)

							self._gfx_lod_data.next_chk_prio_i = i + 1

							break
						elseif not world_in_view_with_options(World, com[i], 0, 120, 18000) then
							states[i] = false

							units[i]:base():set_visibility_state(false)
							self:_remove_i_from_lod_prio(i, anim_lod)

							self._gfx_lod_data.next_chk_prio_i = i + 1

							break
						else
							local my_wgt = mvec3_dir(tmp_vec1, cam_pos, com[i])
							local dot = mvec3_dot(tmp_vec1, pl_fwd)
							local previous_prio = nil

							for prio, i_entry in ipairs(imp_i_list) do
								if i == i_entry then
									previous_prio = prio

									break
								end
							end

							my_wgt = my_wgt * my_wgt * (1 - dot)
							local i_wgt = #imp_wgt_list

							while i_wgt > 0 do
								if previous_prio ~= i_wgt and imp_wgt_list[i_wgt] <= my_wgt then
									break
								end

								i_wgt = i_wgt - 1
							end

							if not previous_prio or i_wgt <= previous_prio then
								i_wgt = i_wgt + 1
							end

							if i_wgt ~= previous_prio then
								if previous_prio then
									t_rem(imp_i_list, previous_prio)
									t_rem(imp_wgt_list, previous_prio)

									if previous_prio <= nr_lod_1 and nr_lod_1 < i_wgt and nr_lod_1 <= #imp_i_list then
										local promote_i = imp_i_list[nr_lod_1]
										states[promote_i] = 1

										units[promote_i]:base():set_visibility_state(1)
									elseif nr_lod_1 < previous_prio and i_wgt <= nr_lod_1 then
										local denote_i = imp_i_list[nr_lod_1]
										states[denote_i] = 2

										units[denote_i]:base():set_visibility_state(2)
									end
								elseif i_wgt <= nr_lod_total and #imp_i_list == nr_lod_total then
									local kick_i = imp_i_list[nr_lod_total]
									states[kick_i] = 3

									units[kick_i]:base():set_visibility_state(3)
									t_rem(imp_wgt_list)
									t_rem(imp_i_list)
								end

								local lod_stage = nil

								if i_wgt <= nr_lod_total then
									t_ins(imp_wgt_list, i_wgt, my_wgt)
									t_ins(imp_i_list, i_wgt, i)

									lod_stage = i_wgt <= nr_lod_1 and 1 or 2
								else
									lod_stage = 3

									self:_remove_i_from_lod_prio(i, anim_lod)
								end

								if states[i] ~= lod_stage then
									states[i] = lod_stage

									units[i]:base():set_visibility_state(lod_stage)
								end
							end

							self._gfx_lod_data.next_chk_prio_i = i + 1

							break
						end
					end

					if i == nr_entries then
						i = 1
					else
						i = i + 1
					end
				until i == start_i
			end
		end
	end
end

function EnemyManager:_remove_i_from_lod_prio(i, anim_lod)
	anim_lod = anim_lod or managers.user:get_setting("video_animation_lod")
	local nr_i_lod1 = self._nr_i_lod[anim_lod][1]

	for prio, i_entry in ipairs(self._gfx_lod_data.prio_i) do
		if i == i_entry then
			table.remove(self._gfx_lod_data.prio_i, prio)
			table.remove(self._gfx_lod_data.prio_weights, prio)

			if prio <= nr_i_lod1 and nr_i_lod1 < #self._gfx_lod_data.prio_i then
				local promoted_i_entry = self._gfx_lod_data.prio_i[prio]
				self._gfx_lod_data.entries.states[promoted_i_entry] = 1

				self._gfx_lod_data.entries.units[promoted_i_entry]:base():set_visibility_state(1)
			end

			return
		end
	end
end

function EnemyManager:_create_unit_gfx_lod_data(unit)
	local lod_entries = self._gfx_lod_data.entries

	table.insert(lod_entries.units, unit)
	table.insert(lod_entries.states, 1)
	table.insert(lod_entries.move_ext, unit:movement())
	table.insert(lod_entries.trackers, unit:movement():nav_tracker())
	table.insert(lod_entries.com, unit:movement():m_com())
end

function EnemyManager:_destroy_unit_gfx_lod_data(u_key)
	local lod_entries = self._gfx_lod_data.entries

	for i, unit in ipairs(lod_entries.units) do
		if u_key == unit:key() then
			if not lod_entries.states[i] then
				unit:base():set_visibility_state(1)
			end

			local nr_entries = #lod_entries.units

			self:_remove_i_from_lod_prio(i)

			for prio, i_entry in ipairs(self._gfx_lod_data.prio_i) do
				if i_entry == nr_entries then
					self._gfx_lod_data.prio_i[prio] = i

					break
				end
			end

			lod_entries.units[i] = lod_entries.units[nr_entries]

			table.remove(lod_entries.units)

			lod_entries.states[i] = lod_entries.states[nr_entries]

			table.remove(lod_entries.states)

			lod_entries.move_ext[i] = lod_entries.move_ext[nr_entries]

			table.remove(lod_entries.move_ext)

			lod_entries.trackers[i] = lod_entries.trackers[nr_entries]

			table.remove(lod_entries.trackers)

			lod_entries.com[i] = lod_entries.com[nr_entries]

			table.remove(lod_entries.com)

			break
		end
	end
end

function EnemyManager:set_gfx_lod_enabled(state)
	if state then
		self._gfx_lod_data.enabled = state
	elseif self._gfx_lod_data.enabled then
		self._gfx_lod_data.enabled = state
		local entries = self._gfx_lod_data.entries
		local units = entries.units
		local states = entries.states

		for i, state in ipairs(states) do
			states[i] = 1

			units[i]:base():set_visibility_state(1)
		end
	end
end

function EnemyManager:chk_any_unit_in_slotmask_visible(slotmask, cam_pos, cam_nav_tracker)
	if self._gfx_lod_data.enabled and managers.navigation:is_data_ready() then
		local camera_rot = managers.viewport:get_current_camera_rotation()
		local entries = self._gfx_lod_data.entries
		local units = entries.units
		local states = entries.states
		local trackers = entries.trackers
		local move_exts = entries.move_ext
		local com = entries.com
		local chk_vis_func = cam_nav_tracker and cam_nav_tracker.check_visibility
		local unit_occluded = Unit.occluded
		local occ_skip_units = managers.occlusion._skip_occlusion
		local vis_slotmask = managers.slot:get_mask("AI_visibility")

		for i, state in ipairs(states) do
			local unit = units[i]

			if unit:in_slot(slotmask) and (occ_skip_units[unit:key()] or (not cam_nav_tracker or chk_vis_func(cam_nav_tracker, trackers[i])) and not unit_occluded(unit)) then
				local distance = mvec3_dir(tmp_vec1, cam_pos, com[i])

				if distance < 300 then
					return true
				elseif distance < 2000 then
					local u_m_head_pos = move_exts[i]:m_head_pos()
					local ray = World:raycast("ray", cam_pos, u_m_head_pos, "slot_mask", vis_slotmask, "report")

					if not ray then
						return true
					else
						ray = World:raycast("ray", cam_pos, com[i], "slot_mask", vis_slotmask, "report")

						if not ray then
							return true
						end
					end
				end
			end
		end
	end
end

function EnemyManager:_init_enemy_data()
	local enemy_data = {}
	self._enemy_data = enemy_data
	enemy_data.unit_data = {}
	enemy_data.nr_units = 0
	enemy_data.nr_active_units = 0
	enemy_data.nr_inactive_units = 0
	enemy_data.inactive_units = {}
	enemy_data.max_nr_active_units = 20
	enemy_data.corpses = {}
	enemy_data.nr_corpses = 0
	enemy_data.shields = {}
	enemy_data.nr_shields = 0
	self._fast_shield_disposal = false
	self._civilian_data = {
		unit_data = {}
	}
	local tick_rate = tweak_data.group_ai.ai_tick_rate
	self._tick_rate = tick_rate
	self._queue_buffer = tick_rate
	self._queued_tasks = {}
	self._queued_task_executed = false
	self._delayed_clbks = {}
	local gfx_lod_data = {}
	self._gfx_lod_data = gfx_lod_data
	gfx_lod_data.enabled = true
	gfx_lod_data.prio_i = {}
	gfx_lod_data.prio_weights = {}
	gfx_lod_data.next_chk_prio_i = 1
	local lod_entries = {}
	gfx_lod_data.entries = lod_entries
	lod_entries.units = {}
	lod_entries.states = {}
	lod_entries.move_ext = {}
	lod_entries.trackers = {}
	lod_entries.com = {}
	self._corpses_to_detach = {}
	self._corpse_disposal_enabled = 0
	self._medic_units = {}
end

function EnemyManager:all_enemies()
	return self._enemy_data.unit_data
end

function EnemyManager:is_enemy(unit)
	return self._enemy_data.unit_data[unit:key()] and true or false
end

function EnemyManager:all_civilians()
	return self._civilian_data.unit_data
end

function EnemyManager:is_civilian(unit)
	return self._civilian_data.unit_data[unit:key()] and true or false
end

function EnemyManager:queue_task(id, task_clbk, data, execute_t, verification_clbk, asap)
	local task_data = {
		clbk = task_clbk,
		id = id,
		data = data,
		t = execute_t,
		v_cb = verification_clbk,
		asap = asap
	}

	table.insert(self._queued_tasks, task_data)

	if not execute_t and #self._queued_tasks <= 1 and not self._queued_task_executed then
		self:_execute_queued_task(1)
	end
end

function EnemyManager:update_queue_task(id, task_clbk, data, execute_t, verification_clbk, asap)
	local task_data, _ = table.find_value(self._queued_tasks, function (td)
		return td.id == id
	end)

	if task_data then
		task_data.clbk = task_clbk or task_data.clbk
		task_data.data = data or task_data.data
		task_data.t = execute_t or task_data.t
		task_data.v_cb = verification_clbk or task_data.v_cb
		task_data.asap = asap or task_data.asap
	end
end

function EnemyManager:unqueue_task(id)
	local tasks = self._queued_tasks
	local i = #tasks

	while i > 0 do
		if tasks[i].id == id then
			table.remove(tasks, i)

			return
		end

		i = i - 1
	end

	debug_pause("[EnemyManager:unqueue_task] task", id, "was not queued!!!")
end

function EnemyManager:unqueue_task_debug(id)
	if not id then
		Application:stack_dump()
	end

	local tasks = self._queued_tasks
	local i = #tasks
	local removed = nil

	while i > 0 do
		if tasks[i].id == id then
			if removed then
				debug_pause("DOUBLE TASK AT ", i, id)
			else
				table.remove(tasks, i)

				removed = true
			end
		end

		i = i - 1
	end

	if not removed then
		debug_pause("[EnemyManager:unqueue_task] task", id, "was not queued!!!")
	end
end

function EnemyManager:has_task(id)
	local tasks = self._queued_tasks
	local i = #tasks
	local count = 0

	while i > 0 do
		if tasks[i].id == id then
			count = count + 1
		end

		i = i - 1
	end

	return count > 0 and count
end

function EnemyManager:_execute_queued_task(i)
	local task = table.remove(self._queued_tasks, i)
	self._queued_task_executed = true

	if task.v_cb then
		task.v_cb(task.id)
	end

	task.clbk(task.data)
end

function EnemyManager:_update_queued_tasks(t, dt)
	local i_asap_task, asp_task_t = nil
	self._queue_buffer = self._queue_buffer + dt
	local tick_rate = self._tick_rate

	if tick_rate <= self._queue_buffer then
		for i_task, task_data in ipairs(self._queued_tasks) do
			if not task_data.t or task_data.t < t then
				self:_execute_queued_task(i_task)

				self._queue_buffer = self._queue_buffer - tick_rate

				if self._queue_buffer <= 0 then
					break
				end
			elseif task_data.asap and (not asp_task_t or task_data.t < asp_task_t) then
				i_asap_task = i_task
				asp_task_t = task_data.t
			end
		end
	end

	if #self._queued_tasks == 0 then
		self._queue_buffer = 0
	else
		self._queue_buffer = math.min(self._queue_buffer, tick_rate * #self._queued_tasks)
	end

	if i_asap_task and not self._queued_task_executed then
		self:_execute_queued_task(i_asap_task)
	end

	local all_clbks = self._delayed_clbks

	if all_clbks[1] and all_clbks[1][2] < t then
		local clbk = table.remove(all_clbks, 1)[3]

		clbk()
	end
end

function EnemyManager:add_delayed_clbk(id, clbk, execute_t)
	if not clbk then
		debug_pause("[EnemyManager:add_delayed_clbk] Empty callback object!!!")
	end

	local clbk_data = {
		id,
		execute_t,
		clbk
	}
	local all_clbks = self._delayed_clbks
	local i = #all_clbks

	while i > 0 and execute_t < all_clbks[i][2] do
		i = i - 1
	end

	table.insert(all_clbks, i + 1, clbk_data)
end

function EnemyManager:is_clbk_registered(id)
	if self._delayed_clbks then
		for i, clbk_data in ipairs(self._delayed_clbks) do
			if clbk_data[1] == id then
				return true
			end
		end
	end

	return false
end

function EnemyManager:get_delayed_clbk_exec_t(id)
	if self._delayed_clbks then
		for i, clbk_data in ipairs(self._delayed_clbks) do
			if clbk_data[1] == id then
				return clbk_data[2]
			end
		end
	end

	return nil
end

function EnemyManager:remove_delayed_clbk(id, no_pause)
	local all_clbks = self._delayed_clbks

	for i, clbk_data in ipairs(all_clbks) do
		if clbk_data[1] == id then
			table.remove(all_clbks, i)

			return
		end
	end

	if not no_pause then
		debug_pause("[EnemyManager:remove_delayed_clbk] id", id, "was not scheduled!!!")
	end
end

function EnemyManager:reschedule_delayed_clbk(id, execute_t)
	local all_clbks = self._delayed_clbks
	local clbk_data = nil

	for i, clbk_d in ipairs(all_clbks) do
		if clbk_d[1] == id then
			clbk_data = table.remove(all_clbks, i)

			break
		end
	end

	if clbk_data then
		clbk_data[2] = execute_t
		local i = #all_clbks

		while i > 0 and execute_t < all_clbks[i][2] do
			i = i - 1
		end

		table.insert(all_clbks, i + 1, clbk_data)

		return
	end

	debug_pause("[EnemyManager:reschedule_delayed_clbk] id", id, "was not scheduled!!!")
end

function EnemyManager:force_delayed_clbk(id)
	local all_clbks = self._delayed_clbks

	for i, clbk_data in ipairs(all_clbks) do
		if clbk_data[1] == id then
			local clbk = table.remove(all_clbks, 1)[3]

			clbk()

			return
		end
	end

	debug_pause("[EnemyManager:force_delayed_clbk] id", id, "was not scheduled!!!")
end

function EnemyManager:queued_tasks_by_callback()
	local t = self._timer:time()
	local categorised_queued_tasks = {}
	local congestion = 0

	for i_task, task_data in ipairs(self._queued_tasks) do
		if categorised_queued_tasks[task_data.clbk] then
			categorised_queued_tasks[task_data.clbk].amount = categorised_queued_tasks[task_data.clbk].amount + 1
		else
			categorised_queued_tasks[task_data.clbk] = {
				amount = 1,
				key = task_data.id
			}
		end

		if not task_data.t or task_data.t < t then
			congestion = congestion + 1
		end
	end

	print("congestion", congestion)

	for clbk, data in pairs(categorised_queued_tasks) do
		print(data.key, data.amount)
	end
end

function EnemyManager:register_enemy(enemy)
	if self._destroyed then
		debug_pause("[EnemyManager:register_enemy] enemy manager is destroyed")
	end

	local char_tweak = tweak_data.character[enemy:base()._tweak_table]
	local u_data = {
		importance = 0,
		unit = enemy,
		m_pos = enemy:movement():m_pos(),
		tracker = enemy:movement():nav_tracker(),
		char_tweak = char_tweak,
		so_access = managers.navigation:convert_access_flag(char_tweak.access)
	}
	self._enemy_data.unit_data[enemy:key()] = u_data

	enemy:base():add_destroy_listener(self._unit_clbk_key, callback(self, self, "on_enemy_destroyed"))

	if enemy:base().add_tweak_data_changed_listener then
		enemy:base():add_tweak_data_changed_listener("EnemyManagerTweakDataChange" .. tostring(enemy:key()), callback(self, self, "_clbk_unit_tweak_data_changed", enemy:key()))
	end

	self:on_enemy_registered(enemy)
end

function EnemyManager:on_enemy_died(dead_unit, damage_info)
	if self._destroyed then
		debug_pause("[EnemyManager:on_enemy_died] enemy manager is destroyed", dead_unit)
	end

	local u_key = dead_unit:key()
	local enemy_data = self._enemy_data
	local enemy_u_data = enemy_data.unit_data
	local u_data = enemy_u_data[u_key] or {
		unit = dead_unit
	}

	self:on_enemy_unregistered(dead_unit)

	enemy_u_data[u_key] = nil
	local should_be_disposed_of = true

	if should_be_disposed_of then
		enemy_data.nr_corpses = enemy_data.nr_corpses + 1
	else
		u_data.no_dispose = true
	end

	local t = self._timer:time()
	u_data.death_t = t
	u_data.u_id = dead_unit:id()
	enemy_data.corpses[u_key] = u_data

	managers.mission:call_global_event("enemy_killed")

	if should_be_disposed_of then
		if self:is_corpse_disposal_enabled() then
			detach_unit_from_network(dead_unit)
			self:chk_queue_disposal(t)
		else
			self:_store_for_disposal_detach(u_key, dead_unit)
		end
	end

	self:_destroy_unit_gfx_lod_data(u_key)
	managers.hud:remove_waypoint("wp_hostage_trade" .. tostring(dead_unit:key()))

	if Network:is_server() and managers.mutators:is_mutator_active(MutatorPiggyBank) and not dead_unit:base():has_tag("sniper") then
		local piggybank_mutator = managers.mutators:get_mutator(MutatorPiggyBank)

		if piggybank_mutator:can_spawn_bag() then
			piggybank_mutator:on_enemy_killed(dead_unit, damage_info)
		end
	end

	if managers.mutators:is_mutator_active(MutatorCG22) and dead_unit:base():has_tag("snowman") then
		local cg22_mutator = managers.mutators:get_mutator(MutatorCG22)

		cg22_mutator:on_snowman_killed(dead_unit, damage_info)
	end

	if managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
		local piggyrevenge_mutator = managers.mutators:get_mutator(MutatorPiggyRevenge)

		if Network:is_server() and piggyrevenge_mutator:can_spawn_bag() then
			piggyrevenge_mutator:on_enemy_killed(dead_unit, damage_info)
		end

		if dead_unit:base():has_tag("eventboss") then
			piggyrevenge_mutator:on_boss_killed(dead_unit, damage_info)
		end
	end
end

function EnemyManager:on_enemy_destroyed(enemy)
	local u_key = enemy:key()
	local enemy_data = self._enemy_data
	local enemy_u_data = enemy_data.unit_data

	if enemy_u_data[u_key] then
		self:on_enemy_unregistered(enemy)

		enemy_u_data[u_key] = nil

		self:_destroy_unit_gfx_lod_data(u_key)
	else
		local corpses = enemy_data.corpses
		local corpse_data = corpses[u_key]

		if corpse_data then
			corpses[u_key] = nil
			local corpses_to_detach = self._corpses_to_detach

			if corpses_to_detach[u_key] then
				corpses_to_detach[u_key] = nil
			end

			if not corpse_data.no_dispose then
				local nr_corpses = enemy_data.nr_corpses - 1
				enemy_data.nr_corpses = nr_corpses
				local corpse_disposal_id = self._corpse_disposal_id

				if corpse_disposal_id and nr_corpses <= self:corpse_limit() then
					self._corpse_disposal_id = nil

					self:unqueue_task(corpse_disposal_id)
				end
			end
		end
	end
end

function EnemyManager:on_enemy_registered(unit)
	self._enemy_data.nr_units = self._enemy_data.nr_units + 1

	self:_create_unit_gfx_lod_data(unit, true)
	managers.groupai:state():on_enemy_registered(unit)
end

function EnemyManager:on_enemy_unregistered(unit)
	self._enemy_data.nr_units = self._enemy_data.nr_units - 1

	managers.groupai:state():on_enemy_unregistered(unit)
end

function EnemyManager:is_shield_registered(shield_unit)
	return self._enemy_data.shields[shield_unit:key()] and true or false
end

function EnemyManager:register_shield(shield_unit)
	local unit_data_ext = shield_unit:unit_data()

	if unit_data_ext then
		unit_data_ext:add_destroy_listener(self._unit_clbk_key, callback(self, self, "unregister_shield"))
	else
		Application:error("[EnemyManager:register_shield] unit_data extension not found on shield unit ", shield_unit)
	end

	local t = self._timer:time()
	local enemy_data = self._enemy_data
	enemy_data.shields[shield_unit:key()] = {
		unit = shield_unit,
		death_t = t
	}
	local nr_shields = enemy_data.nr_shields + 1
	enemy_data.nr_shields = nr_shields
	local shield_disposal_id = self._shield_disposal_id

	if not shield_disposal_id then
		shield_disposal_id = "EnemyManager._upd_shield_disposal"
		self._shield_disposal_id = shield_disposal_id

		if self:shield_limit() < nr_shields then
			self._fast_shield_disposal = true

			self:queue_task(shield_disposal_id, EnemyManager._upd_shield_disposal_fast, self, t)
		else
			self:queue_task(shield_disposal_id, EnemyManager._upd_shield_disposal, self, t + self._shield_disposal_lifetime)
		end
	elseif not self._fast_shield_disposal and self:shield_limit() < nr_shields then
		self._fast_shield_disposal = true

		self:update_queue_task(shield_disposal_id, EnemyManager._upd_shield_disposal_fast, nil, t, nil, nil)
	end
end

function EnemyManager:unregister_shield(shield_unit)
	local u_key = shield_unit:key()
	local enemy_data = self._enemy_data
	local shields = enemy_data.shields

	if not shields[u_key] then
		return
	end

	shields[u_key] = nil
	local nr_shields = enemy_data.nr_shields - 1
	enemy_data.nr_shields = nr_shields
	local shield_disposal_id = self._shield_disposal_id

	if not shield_disposal_id then
		return
	end

	if nr_shields == 0 then
		self._shield_disposal_id = nil
		self._fast_shield_disposal = false

		self:unqueue_task(shield_disposal_id)
	elseif self._fast_shield_disposal and nr_shields <= self:shield_limit() then
		self._fast_shield_disposal = false
		local delay = nil

		for u_key, u_data in pairs(shields) do
			local death_t = u_data.death_t

			if not delay or death_t < delay then
				delay = death_t
			end
		end

		delay = delay + self._shield_disposal_lifetime

		self:update_queue_task(shield_disposal_id, EnemyManager._upd_shield_disposal, nil, delay, nil, nil)
	end
end

function EnemyManager:register_civilian(unit)
	unit:base():add_destroy_listener(self._unit_clbk_key, callback(self, self, "on_civilian_destroyed"))

	if unit:base().add_tweak_data_changed_listener then
		unit:base():add_tweak_data_changed_listener("EnemyManagerTweakDataChange" .. tostring(unit:key()), callback(self, self, "_clbk_unit_tweak_data_changed", unit:key()))
	end

	self:_create_unit_gfx_lod_data(unit, true)

	local char_tweak = tweak_data.character[unit:base()._tweak_table]
	self._civilian_data.unit_data[unit:key()] = {
		is_civilian = true,
		unit = unit,
		m_pos = unit:movement():m_pos(),
		tracker = unit:movement():nav_tracker(),
		char_tweak = char_tweak,
		so_access = managers.navigation:convert_access_flag(char_tweak.access)
	}
end

function EnemyManager:on_civilian_died(dead_unit, damage_info)
	local u_key = dead_unit:key()
	local enemy_data = self._enemy_data
	local civ_u_data = self._civilian_data.unit_data
	local u_data = civ_u_data[u_key]

	managers.groupai:state():on_civilian_unregistered(dead_unit)

	civ_u_data[u_key] = nil

	if Network:is_server() and damage_info.attacker_unit and not dead_unit:base().enemy and not dead_unit:base():char_tweak().no_civ_penalty then
		managers.groupai:state():hostage_killed(damage_info.attacker_unit)
	end

	local should_be_disposed_of = true

	if should_be_disposed_of then
		enemy_data.nr_corpses = enemy_data.nr_corpses + 1
	else
		u_data.no_dispose = true
	end

	local t = self._timer:time()
	u_data.death_t = t
	u_data.u_id = dead_unit:id()
	enemy_data.corpses[u_key] = u_data

	managers.mission:call_global_event("civilian_killed")

	if should_be_disposed_of then
		if self:is_corpse_disposal_enabled() then
			detach_unit_from_network(dead_unit)
			self:chk_queue_disposal(t)
		else
			self:_store_for_disposal_detach(u_key, dead_unit)
		end
	end

	self:_destroy_unit_gfx_lod_data(u_key)
	managers.hud:remove_waypoint("wp_hostage_trade" .. tostring(dead_unit:key()))
end

function EnemyManager:on_civilian_destroyed(civilian)
	local u_key = civilian:key()
	local civ_u_data = self._civilian_data.unit_data

	if civ_u_data[u_key] then
		managers.groupai:state():on_civilian_unregistered(civilian)

		civ_u_data[u_key] = nil

		self:_destroy_unit_gfx_lod_data(u_key)
	else
		local enemy_data = self._enemy_data
		local corpses = enemy_data.corpses
		local corpse_data = corpses[u_key]

		if corpse_data then
			corpses[u_key] = nil
			local corpses_to_detach = self._corpses_to_detach

			if corpses_to_detach[u_key] then
				corpses_to_detach[u_key] = nil
			end

			if not corpse_data.no_dispose then
				local nr_corpses = enemy_data.nr_corpses - 1
				enemy_data.nr_corpses = nr_corpses
				local corpse_disposal_id = self._corpse_disposal_id

				if corpse_disposal_id and nr_corpses <= self:corpse_limit() then
					self._corpse_disposal_id = nil

					self:unqueue_task(corpse_disposal_id)
				end
			end
		end
	end
end

function EnemyManager:on_criminal_registered(unit)
	self:_create_unit_gfx_lod_data(unit, false)
end

function EnemyManager:on_criminal_unregistered(u_key)
	self:_destroy_unit_gfx_lod_data(u_key)
end

function EnemyManager:_store_for_disposal_detach(u_key, unit)
	self._corpses_to_detach[u_key] = unit
end

function EnemyManager:_chk_detach_stored_units()
	local units = self._corpses_to_detach

	if not next(units) then
		return
	end

	local detach_f = detach_unit_from_network

	for u_key, unit in pairs(units) do
		detach_f(unit)
	end

	self._corpses_to_detach = {}
end

function EnemyManager:enable_disposal_on_corpse(unit)
	local u_key = unit:key()
	local enemy_data = self._enemy_data
	local corpse_data = enemy_data.corpses[u_key]

	if not corpse_data then
		debug_pause("[EnemyManager:enable_disposal_on_corpse] ERROR - no corpse data found", unit)

		return
	elseif not corpse_data.no_dispose then
		debug_pause("[EnemyManager:enable_disposal_on_corpse] ERROR - corpse wasn't previously exempted from being disposed of", unit)

		return
	end

	corpse_data.no_dispose = nil
	enemy_data.nr_corpses = enemy_data.nr_corpses + 1

	if self:is_corpse_disposal_enabled() then
		detach_unit_from_network(unit)
		self:chk_queue_disposal(self._timer:time())
	else
		self:_store_for_disposal_detach(u_key, unit)
	end
end

function EnemyManager:_upd_corpse_disposal()
	self._corpse_disposal_id = nil
	local enemy_data = self._enemy_data
	local player = managers.player:player_unit()
	local cam_pos, cam_fwd = nil

	if player then
		cam_pos = player:movement():m_head_pos()
		cam_fwd = player:camera():forward()
	elseif managers.viewport:get_current_camera() then
		cam_pos = managers.viewport:get_current_camera_position()
		cam_fwd = managers.viewport:get_current_camera_rotation():y()
	end

	local corpses = enemy_data.corpses
	local nr_corpses = enemy_data.nr_corpses
	local disposals_needed = nr_corpses - self:corpse_limit()
	local to_dispose = {}
	local nr_found = 0

	if cam_pos then
		local min_dis = 90000
		local dot_chk = 0
		local dir_vec = tmp_vec1

		for u_key, u_data in pairs(corpses) do
			if not u_data.no_dispose then
				local u_pos = u_data.m_pos

				if min_dis < mvec3_dis_sq(cam_pos, u_pos) then
					mvec3_dir(dir_vec, cam_pos, u_pos)

					if mvec3_dot(cam_fwd, dir_vec) < dot_chk then
						to_dispose[u_key] = true
						nr_found = nr_found + 1

						if nr_found == disposals_needed then
							break
						end
					end
				end
			end
		end
	end

	disposals_needed = disposals_needed - nr_found

	if disposals_needed > 0 then
		local oldest_corpses = {}

		for u_key, u_data in pairs(corpses) do
			if not u_data.no_dispose and not to_dispose[u_key] then
				local death_t = u_data.death_t

				for i = disposals_needed, 1, -1 do
					local old_corpse = oldest_corpses[i]

					if not old_corpse then
						old_corpse = {
							t = death_t,
							key = u_key
						}
						oldest_corpses[#oldest_corpses + 1] = old_corpse

						break
					elseif death_t < old_corpse.t then
						old_corpse.t = death_t
						old_corpse.key = u_key

						break
					end
				end
			end
		end

		for i = 1, disposals_needed do
			to_dispose[oldest_corpses[i].key] = true
		end

		nr_found = nr_found + disposals_needed
	end

	local is_server = Network:is_server()

	for u_key, _ in pairs(to_dispose) do
		local unit = corpses[u_key].unit
		corpses[u_key] = nil

		if is_server or unit:id() == -1 then
			unit:base():set_slot(unit, 0)
		else
			unit:set_enabled(false)
		end
	end

	enemy_data.nr_corpses = nr_corpses - nr_found
end

function EnemyManager:_upd_shield_disposal_fast()
	self._fast_shield_disposal = false

	self:_upd_shield_disposal()
end

function EnemyManager:_upd_shield_disposal()
	local t = self._timer:time()
	local enemy_data = self._enemy_data
	local nr_shields = enemy_data.nr_shields
	local disposals_needed = nr_shields - self:shield_limit()
	local shields = enemy_data.shields
	local player = managers.player:player_unit()
	local cam_pos, cam_fwd = nil

	if player then
		cam_pos = player:movement():m_head_pos()
		cam_fwd = player:camera():forward()
	elseif managers.viewport:get_current_camera() then
		cam_pos = managers.viewport:get_current_camera_position()
		cam_fwd = managers.viewport:get_current_camera_rotation():y()
	end

	local to_dispose = {}
	local nr_found = 0
	local disposal_life_t = self._shield_disposal_lifetime

	for u_key, u_data in pairs(shields) do
		if t > u_data.death_t + disposal_life_t then
			to_dispose[u_key] = true
			nr_found = nr_found + 1
		end
	end

	if nr_found < disposals_needed then
		if cam_pos then
			local min_dis = 90000
			local dot_chk = 0
			local dir_vec = tmp_vec1
			local u_pos = tmp_vec2

			for u_key, u_data in pairs(shields) do
				if not to_dispose[u_key] then
					local unit = u_data.unit

					unit:m_position(u_pos)

					if min_dis < mvec3_dis_sq(cam_pos, u_pos) then
						mvec3_dir(dir_vec, cam_pos, u_pos)

						if mvec3_dot(cam_fwd, dir_vec) < dot_chk then
							to_dispose[u_key] = true
							nr_found = nr_found + 1

							if nr_found == disposals_needed then
								break
							end
						end
					end
				end
			end
		end

		disposals_needed = disposals_needed - nr_found

		if disposals_needed > 0 then
			local oldest_shields = {}

			for u_key, u_data in pairs(shields) do
				if not to_dispose[u_key] then
					local death_t = u_data.death_t

					for i = disposals_needed, 1, -1 do
						local old_shield = oldest_shields[i]

						if not old_shield then
							old_shield = {
								t = death_t,
								key = u_key
							}
							oldest_shields[#oldest_shields + 1] = old_shield

							break
						elseif death_t < old_shield.t then
							old_shield.t = death_t
							old_shield.key = u_key

							break
						end
					end
				end
			end

			for i = 1, disposals_needed do
				to_dispose[oldest_shields[i].key] = true
			end

			nr_found = nr_found + disposals_needed
		end
	end

	local is_server = Network:is_server()

	for u_key, _ in pairs(to_dispose) do
		local unit = shields[u_key].unit
		shields[u_key] = nil

		if is_server or unit:id() == -1 then
			unit:set_slot(0)
		else
			unit:set_enabled(false)
		end
	end

	nr_shields = nr_shields - nr_found
	enemy_data.nr_shields = nr_shields

	if nr_shields > 0 then
		local delay = nil

		for u_key, u_data in pairs(shields) do
			local death_t = u_data.death_t

			if not delay or death_t < delay then
				delay = death_t
			end
		end

		delay = delay + disposal_life_t

		self:queue_task(self._shield_disposal_id, EnemyManager._upd_shield_disposal, self, delay)
	else
		self._shield_disposal_id = nil
	end
end

function EnemyManager:set_corpse_disposal_enabled(state)
	local was_enabled = self:is_corpse_disposal_enabled()
	local state_modifier = state and 1 or -1
	self._corpse_disposal_enabled = self._corpse_disposal_enabled + state_modifier
	local is_now_enabled = self:is_corpse_disposal_enabled()

	if was_enabled and not is_now_enabled then
		local corpse_disposal_id = self._corpse_disposal_id

		if corpse_disposal_id then
			self._corpse_disposal_id = nil

			self:unqueue_task(corpse_disposal_id)
		end
	elseif not was_enabled and is_now_enabled then
		self:_chk_detach_stored_units()
		self:chk_queue_disposal(self._timer:time())
	end
end

function EnemyManager:is_corpse_disposal_enabled()
	return self._corpse_disposal_enabled > 0 and true
end

function EnemyManager:chk_queue_disposal(t)
	local corpse_disposal_id = self._corpse_disposal_id

	if corpse_disposal_id then
		return
	end

	if self:corpse_limit() < self._enemy_data.nr_corpses then
		corpse_disposal_id = "EnemyManager._upd_corpse_disposal"
		self._corpse_disposal_id = corpse_disposal_id

		self:queue_task(corpse_disposal_id, EnemyManager._upd_corpse_disposal, self, t)
	end
end

function EnemyManager:on_simulation_ended()
end

function EnemyManager:on_simulation_started()
	self._destroyed = nil
end

function EnemyManager:get_my_hostages(id)
	local civilians = self:all_civilians()
	local all_hostages = managers.groupai:state():all_hostages()
	local all_enemies = self:all_enemies()
	local list = {}

	for _, h_key in ipairs(all_hostages) do
		local civ = civilians[h_key]
		local hostage = civ or all_enemies[h_key]

		if hostage and hostage.unit and hostage.unit:brain() and hostage.unit:brain()._logic_data and hostage.unit:brain()._logic_data.internal_data and id == hostage.unit:brain()._logic_data.internal_data.aggressor_id then
			table.insert(list, hostage)
		end
	end

	return list
end

function EnemyManager:dispose_all_corpses()
	self._destroyed = true
	local detach_f = detach_unit_from_network

	for key, corpse_data in pairs(self._enemy_data.corpses) do
		if alive(corpse_data.unit) then
			if corpse_data.unit:id() ~= -1 then
				detach_f(corpse_data.unit)
			end

			World:delete_unit(corpse_data.unit)
		end
	end

	if next(self._enemy_data.corpses) then
		debug_pause("[EnemyManager:dispose_all_corpses] there are still corpses in enemy manager\n", inspect(self._enemy_data.corpses))
	end
end

function EnemyManager:save(data)
	local my_data = nil

	if not managers.groupai:state():enemy_weapons_hot() then
		my_data = my_data or {}

		for u_key, u_data in pairs(self._enemy_data.corpses) do
			if u_data.unit:id() < 0 then
				my_data.corpses = my_data.corpses or {}
				local corpse_data = {
					u_data.u_id,
					u_data.unit:movement():m_pos(),
					u_data.is_civilian and true or false,
					u_data.unit:interaction():active() and true or false,
					u_data.unit:interaction().tweak_data,
					u_data.unit:contour():is_flashing()
				}

				table.insert(my_data.corpses, corpse_data)
			end
		end
	end

	data.enemy_manager = my_data
end

function EnemyManager:load(data)
	local my_data = data.enemy_manager

	if not my_data then
		return
	end

	if my_data.corpses then
		local civ_spawn_state = Idstring("civilian_death_dummy")
		local ene_spawn_state = Idstring("enemy_death_dummy")
		local civ_corpse_u_name = Idstring("units/payday2/characters/civ_male_dummy_corpse/civ_male_dummy_corpse")
		local ene_corpse_u_name = Idstring("units/payday2/characters/ene_dummy_corpse/ene_dummy_corpse")

		for _, corpse_data in pairs(my_data.corpses) do
			local u_id = corpse_data[1]
			local spawn_pos = corpse_data[2]
			local is_civilian = corpse_data[3]
			local interaction_active = corpse_data[4]
			local interaction_tweak_data = corpse_data[5]
			local contour_flashing = corpse_data[6]
			local grnd_ray = World:raycast("ray", spawn_pos + Vector3(0, 0, 50), spawn_pos - Vector3(0, 0, 100), "slot_mask", managers.slot:get_mask("AI_graph_obstacle_check"), "ray_type", "walk")

			if grnd_ray then
				spawn_pos = grnd_ray.position or spawn_pos
			end

			local corpse = World:spawn_unit(is_civilian and civ_corpse_u_name or ene_corpse_u_name, spawn_pos, Rotation(math.random() * 360, 0, 0))

			if corpse then
				corpse:play_state(is_civilian and civ_spawn_state or ene_spawn_state)
				corpse:interaction():set_tweak_data(interaction_tweak_data)
				corpse:interaction():set_active(interaction_active)

				if contour_flashing then
					corpse:interaction():set_outline_flash_state(contour_flashing, nil)
				end

				local mover_blocker_body = corpse:body("mover_blocker")

				if mover_blocker_body then
					mover_blocker_body:set_enabled(false)
				end

				corpse:base():add_destroy_listener("EnemyManager_corpse_dummy" .. tostring(corpse:key()), callback(self, self, is_civilian and "on_civilian_destroyed" or "on_enemy_destroyed"))

				self._enemy_data.corpses[corpse:key()] = {
					death_t = 0,
					unit = corpse,
					u_id = u_id,
					m_pos = corpse:position()
				}
				self._enemy_data.nr_corpses = self._enemy_data.nr_corpses + 1
			end
		end
	end
end

function EnemyManager:get_corpse_unit_data_from_key(u_key)
	return self._enemy_data.corpses[u_key]
end

function EnemyManager:get_corpse_unit_data_from_id(u_id)
	for u_key, u_data in pairs(self._enemy_data.corpses) do
		if u_id == u_data.u_id then
			return u_data
		end
	end
end

function EnemyManager:remove_corpse_by_id(u_id)
	for u_key, u_data in pairs(self._enemy_data.corpses) do
		if u_id == u_data.u_id then
			u_data.unit:set_slot(0)

			break
		end
	end
end

function EnemyManager:register_medic(medic_unit)
	self._medic_units[medic_unit:key()] = medic_unit
end

function EnemyManager:unregister_medic(medic_unit)
	self._medic_units[medic_unit:key()] = nil
end

function EnemyManager:is_unit_registered_as_medic(test_unit)
	return self._medic_units[test_unit:key()] and true or false
end

function EnemyManager:get_nearby_medic(requesting_unit)
	local valid_medics = {}
	local request_u_key = requesting_unit:key()

	for u_key, medic in pairs(self._medic_units) do
		if u_key ~= request_u_key and medic:character_damage():is_available_for_healing(requesting_unit) then
			valid_medics[u_key] = medic
		end
	end

	local closest_medic = nil

	if next(valid_medics) then
		local request_pos = tmp_vec1
		local medic_pos = tmp_vec2

		requesting_unit:m_position(request_pos)

		local dis_sq, closest_dis_sq = nil

		for u_key, medic in pairs(valid_medics) do
			medic:m_position(medic_pos)

			dis_sq = mvec3_dis_sq(request_pos, medic_pos)

			if dis_sq <= medic:character_damage():get_healing_radius_sq() and (not closest_dis_sq or dis_sq < closest_dis_sq) then
				closest_medic = medic
				closest_dis_sq = dis_sq
			end
		end
	end

	return closest_medic
end

function EnemyManager:find_nearby_affiliated_medics(requesting_unit)
	local valid_medics = {}
	local medics_in_range = {}
	local request_u_key = requesting_unit:key()

	for u_key, medic in pairs(self._medic_units) do
		if u_key ~= request_u_key and medic:character_damage():verify_heal_requesting_unit(requesting_unit) then
			valid_medics[u_key] = medic
		end
	end

	if next(valid_medics) then
		local request_pos = tmp_vec1
		local medic_pos = tmp_vec2

		requesting_unit:m_position(request_pos)

		for u_key, medic in pairs(valid_medics) do
			medic:m_position(medic_pos)

			if mvec3_dis_sq(request_pos, medic_pos) <= medic:character_damage():get_healing_radius_sq() then
				medics_in_range[u_key] = medic
			end
		end
	end

	return medics_in_range
end

function EnemyManager:add_magazine(mag_unit, col_unit)
	if alive(mag_unit) then
		local body_ray_type = Idstring("body")
		local ids_ray_pass = Idstring("pass")
		local ids_ray_block = Idstring("block")
		local ids_ray_ignore = Idstring("ignore")
		local get_body_f = mag_unit.body
		local nr_bodies = mag_unit:num_bodies()

		for i = 0, nr_bodies - 1 do
			local body = get_body_f(mag_unit, i)
			local ray_mode = body:ray_mode()

			if ray_mode == ids_ray_block or ray_mode == ids_ray_pass then
				body:set_ray_mode(ids_ray_ignore)
			end

			if body:has_ray_type(body_ray_type) then
				body:remove_ray_type(body_ray_type)
			end
		end
	end

	if alive(col_unit) and col_unit:slot() == 1 then
		col_unit:set_slot(11)
	end

	local all_mags = self._magazines
	local new_nr_mags = #all_mags + 1
	all_mags[new_nr_mags] = {
		mag_unit,
		col_unit
	}
	local disposals_needed = new_nr_mags - self._MAX_MAGAZINES

	if disposals_needed > 0 then
		self:cleanup_magazines(disposals_needed)
	end
end

function EnemyManager:cleanup_magazines(remove_to_i)
	local all_mags = self._magazines
	local nr_mags = #all_mags
	remove_to_i = remove_to_i or nr_mags

	for i = 1, remove_to_i do
		local units = all_mags[i]

		for idx = 1, #units do
			local unit = units[idx]

			if alive(unit) then
				unit:set_slot(0)
			end
		end
	end

	local new_mags_table = {}

	for i = remove_to_i + 1, nr_mags do
		new_mags_table[#new_mags_table + 1] = all_mags[i]
	end

	self._magazines = new_mags_table
end

function EnemyManager:_clbk_unit_tweak_data_changed(u_key, old_tweak_data, new_tweak_data)
	local u_data = self._enemy_data.unit_data[u_key] or self._civilian_data.unit_data[u_key] or self._enemy_data.corpses[u_key]

	if not u_data then
		return
	end

	u_data.char_tweak = new_tweak_data

	if old_tweak_data.access ~= new_tweak_data.access then
		u_data.so_access = managers.navigation:convert_access_flag(new_tweak_data.access)
	end
end
