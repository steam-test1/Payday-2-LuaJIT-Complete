local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_dir = mvector3.direction
local mvec3_dot = mvector3.dot
local mvec3_dis = mvector3.distance
local mvec3_dis_sq = mvector3.distance_sq
local mvec3_lerp = mvector3.lerp
local mvec3_norm = mvector3.normalize
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_len_sq = mvector3.length_sq
local mvec3_cpy = mvector3.copy
local mvec3_set_length = mvector3.set_length
local mvec3_step = mvector3.step
local mvec3_rotate_with = mvector3.rotate_with
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
local temp_vec3 = Vector3()
local math_lerp = math.lerp
local math_random = math.random
local math_up = math.UP
local math_abs = math.abs
local math_clamp = math.clamp
local math_min = math.min
local math_max = math.max
local math_sign = math.sign
local mvec3_cpy = mvector3.copy
local mvec3_not_equal = mvector3.not_equal
local math_abs = math.abs
local AI_REACT_IDLE = AIAttentionObject.REACT_IDLE
local AI_REACT_SCARED = AIAttentionObject.REACT_SCARED
local AI_REACT_AIM = AIAttentionObject.REACT_AIM
local AI_REACT_SHOOT = AIAttentionObject.REACT_SHOOT
local AI_REACT_COMBAT = AIAttentionObject.REACT_COMBAT
local AI_REACT_SPECIAL_ATTACK = AIAttentionObject.REACT_SPECIAL_ATTACK
BossLogicAttack = BossLogicAttack or class(CopLogicAttack)

function BossLogicAttack.enter(data, new_logic_name, enter_params)
	CopLogicBase.enter(data, new_logic_name, enter_params)

	local brain_ext = data.brain

	brain_ext:cancel_all_pathing_searches()

	local unit = data.unit
	local char_tweak = data.char_tweak
	local old_internal_data = data.internal_data
	local new_internal_data = {}
	data.internal_data = new_internal_data
	new_internal_data.unit = unit
	new_internal_data.detection = char_tweak.detection.combat

	if old_internal_data then
		new_internal_data.turning = old_internal_data.turning
		new_internal_data.firing = old_internal_data.firing
		new_internal_data.shooting = old_internal_data.shooting
		new_internal_data.attention_unit = old_internal_data.attention_unit
	end

	if data.cool then
		unit:movement():set_cool(false)

		if new_internal_data ~= data.internal_data then
			return
		end
	end

	if not new_internal_data.shooting then
		local new_stance = nil
		local allowed_stances = char_tweak.allowed_stances

		if not allowed_stances or allowed_stances.hos then
			new_stance = "hos"
		elseif allowed_stances.cbt then
			new_stance = "cbt"
		end

		if new_stance then
			data.unit:movement():set_stance(new_stance)

			if new_internal_data ~= data.internal_data then
				return
			end
		end
	end

	local equipped_weap = unit:inventory():equipped_unit()

	if equipped_weap then
		local weap_usage = equipped_weap:base():weapon_tweak_data().usage
		new_internal_data.weapon_range = weap_usage and char_tweak.weapon[weap_usage].range
	end

	local objective = data.objective
	new_internal_data.attitude = objective and objective.attitude or "avoid"
	local key_str = tostring(data.key)
	local detection_task_key = "BossLogicAttack._upd_enemy_detection" .. key_str
	new_internal_data.detection_task_key = detection_task_key

	CopLogicBase.queue_task(new_internal_data, detection_task_key, BossLogicAttack._upd_enemy_detection, data, data.t, true)
	CopLogicIdle._chk_has_old_action(data, new_internal_data)

	if objective and (objective.action_duration or objective.action_timeout_t and data.t < objective.action_timeout_t) then
		new_internal_data.action_timeout_clbk_id = "CopLogicIdle_action_timeout" .. key_str
		local action_timeout_t = objective.action_timeout_t or data.t + objective.action_duration
		objective.action_timeout_t = action_timeout_t

		CopLogicBase.add_delayed_clbk(new_internal_data, new_internal_data.action_timeout_clbk_id, callback(CopLogicIdle, CopLogicIdle, "clbk_action_timeout", data), action_timeout_t)
	end

	brain_ext:set_attention_settings({
		cbt = true
	})
	brain_ext:set_update_enabled_state(true)

	if data.char_tweak.throwable then
		new_internal_data.last_seen_throwable_pos = Vector3()
	end
end

function BossLogicAttack.exit(data, new_logic_name, enter_params)
	CopLogicBase.exit(data, new_logic_name, enter_params)

	local brain_ext = data.brain
	local my_data = data.internal_data

	BossLogicAttack._cancel_chase_attempt(data, my_data)
	brain_ext:cancel_all_pathing_searches()
	CopLogicBase.cancel_queued_tasks(my_data)
	CopLogicBase.cancel_delayed_clbks(my_data)
	brain_ext:rem_pos_rsrv("path")
	brain_ext:set_update_enabled_state(true)
end

function BossLogicAttack.update(data)
	local t = data.t
	local unit = data.unit
	local my_data = data.internal_data

	if my_data.has_old_action then
		CopLogicAttack._upd_stop_old_action(data, my_data)

		if my_data.has_old_action then
			if not my_data.update_queue_id then
				data.brain:set_update_enabled_state(false)

				my_data.update_queue_id = "BossLogicAttack.queued_update" .. tostring(data.key)

				BossLogicAttack.queue_update(data, my_data)
			end

			return
		end
	end

	if CopLogicAttack._chk_exit_non_walkable_area(data) or CopLogicIdle._chk_relocate(data) then
		return
	end

	if data.is_converted then
		local objective = data.objective

		if not objective or objective.type == "free" then
			local failed_path_t = data.path_fail_t

			if not failed_path_t or data.t - failed_path_t > 6 then
				managers.groupai:state():on_criminal_jobless(unit)

				if my_data ~= data.internal_data then
					return
				end
			end
		end
	end

	local cur_att_obj = data.attention_obj

	if not cur_att_obj or cur_att_obj.reaction < AI_REACT_AIM then
		BossLogicAttack._upd_enemy_detection(data, true)

		if my_data ~= data.internal_data then
			return
		end

		cur_att_obj = data.attention_obj
	end

	BossLogicAttack._process_pathing_results(data, my_data)

	if cur_att_obj and AI_REACT_COMBAT <= cur_att_obj.reaction then
		BossLogicAttack._upd_combat_movement(data, my_data)
	else
		BossLogicAttack._cancel_chase_attempt(data, my_data)
	end

	if not data.logic.action_taken then
		BossLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
	end

	if not my_data.update_queue_id then
		data.brain:set_update_enabled_state(false)

		my_data.update_queue_id = "BossLogicAttack.queued_update" .. tostring(data.key)

		BossLogicAttack.queue_update(data, my_data)
	end
end

function BossLogicAttack._upd_enemy_detection(data, is_synchronous)
	managers.groupai:state():on_unit_detection_updated(data.unit)

	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local min_reaction = AI_REACT_AIM
	local delay = CopLogicBase._upd_attention_obj_detection(data, min_reaction, nil)
	local new_attention, new_prio_slot, new_reaction = BossLogicAttack._get_priority_attention(data, data.detected_attention_objects, nil)
	local old_att_obj = data.attention_obj

	CopLogicBase._set_attention_obj(data, new_attention, new_reaction)
	data.logic._chk_exit_attack_logic(data, new_reaction)

	if my_data ~= data.internal_data then
		return
	end

	if not new_attention and old_att_obj then
		BossLogicAttack._cancel_chase_attempt(data, my_data)

		my_data.att_chase_chk = nil
	end

	CopLogicBase._chk_call_the_police(data)

	if my_data ~= data.internal_data then
		return
	end

	BossLogicAttack._upd_aim(data, my_data)

	if not is_synchronous then
		CopLogicBase.queue_task(my_data, my_data.detection_task_key, BossLogicAttack._upd_enemy_detection, data, data.t + delay, true)
	end

	CopLogicBase._report_detections(data.detected_attention_objects)
end

function BossLogicAttack._upd_combat_movement(data, my_data)
	if BossLogicAttack.no_movement then
		return
	end

	local t = data.t
	local focus_enemy = data.attention_obj
	local enemy_visible = focus_enemy.verified
	local action_taken = data.logic.action_taken(data, my_data)
	local chase = nil

	if not action_taken then
		if not my_data.chase_path_failed_t or t - my_data.chase_path_failed_t > 1 then
			if my_data.chase_path then
				local enemy_dis = enemy_visible and focus_enemy.dis or focus_enemy.verified_dis
				local run_dist = enemy_visible and 800 or 400
				local speed = enemy_dis < run_dist and "walk" or "run"

				BossLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, speed)
			elseif not my_data.chase_path_search_id and focus_enemy.nav_tracker then
				my_data.chase_pos = nil
				local chase_pos = focus_enemy.nav_tracker:field_position()
				local pos_on_wall = CopLogicTravel._get_pos_on_wall(chase_pos, 300, nil, nil)

				if mvec3_not_equal(chase_pos, pos_on_wall) then
					my_data.chase_pos = pos_on_wall
				end

				if my_data.chase_pos then
					local my_pos = data.unit:movement():nav_tracker():field_position()
					local unobstructed_line = nil

					if math_abs(my_pos.z - my_data.chase_pos.z) < 40 then
						local ray_params = {
							allow_entry = false,
							pos_from = my_pos,
							pos_to = my_data.chase_pos
						}

						if not managers.navigation:raycast(ray_params) then
							unobstructed_line = true
						end
					end

					if unobstructed_line then
						my_data.chase_path = {
							mvec3_cpy(my_pos),
							my_data.chase_pos
						}
						local enemy_dis = enemy_visible and focus_enemy.dis or focus_enemy.verified_dis
						local run_dist = enemy_visible and 800 or 400
						local speed = enemy_dis < run_dist and "walk" or "run"

						BossLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, speed)
					else
						my_data.chase_path_search_id = tostring(data.unit:key()) .. "chase"
						my_data.pathing_to_chase_pos = true

						data.brain:add_pos_rsrv("path", {
							radius = 60,
							position = mvec3_cpy(my_data.chase_pos)
						})
						data.brain:search_for_path(my_data.chase_path_search_id, my_data.chase_pos)
					end
				else
					my_data.chase_path_failed_t = t
				end
			end
		end
	elseif my_data.walking_to_chase_pos and not my_data.use_flank_pos_when_chasing then
		local current_haste = my_data.advancing and my_data.advancing:haste()

		if current_haste then
			local enemy_dis = enemy_visible and focus_enemy.dis or focus_enemy.verified_dis
			local run_dist = enemy_visible and 700 or 300
			local change_speed = nil

			if current_haste == "run" then
				if enemy_dis < run_dist then
					change_speed = "walk"
				else
					change_speed = false
				end
			else
				change_speed = run_dist <= enemy_dis and "run"
			end

			if change_speed then
				local my_pos = data.unit:movement():nav_tracker():field_position()
				local moving_to_pos = my_data.walking_to_chase_pos:get_walk_to_pos()
				local unobstructed_line = nil

				if math_abs(my_pos.z - moving_to_pos.z) < 40 then
					local ray_params = {
						allow_entry = false,
						pos_from = my_pos,
						pos_to = moving_to_pos
					}

					if not managers.navigation:raycast(ray_params) then
						unobstructed_line = true
					end
				end

				if unobstructed_line then
					moving_to_pos = mvec3_cpy(moving_to_pos)

					BossLogicAttack._cancel_chase_attempt(data, my_data)

					my_data.chase_path = {
						mvec3_cpy(my_pos),
						moving_to_pos
					}

					BossLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, change_speed)
				end
			end
		end
	end
end

function BossLogicAttack._get_priority_attention(data, attention_objects, reaction_func)
	reaction_func = reaction_func or CopLogicIdle._chk_reaction_to_attention_object
	local best_target, best_target_priority_slot, best_target_priority, best_target_reaction = nil
	local forced_attention_data = managers.groupai:state():force_attention_data(data.unit)

	if forced_attention_data then
		if data.attention_obj and data.attention_obj.unit == forced_attention_data.unit then
			return data.attention_obj, 1, AI_REACT_SHOOT
		end

		local forced_attention_object = managers.groupai:state():get_AI_attention_object_by_unit(forced_attention_data.unit)

		if forced_attention_object then
			for u_key, attention_info in pairs(forced_attention_object) do
				if forced_attention_data.ignore_vis_blockers then
					local vis_ray = World:raycast("ray", data.unit:movement():m_head_pos(), attention_info.handler:get_detection_m_pos(), "slot_mask", data.visibility_slotmask, "ray_type", "ai_vision")

					if not vis_ray or vis_ray.unit:key() == u_key or not vis_ray.unit:visible() then
						best_target = CopLogicBase._create_detected_attention_object_data(data.t, data.unit, u_key, attention_info, attention_info.handler:get_attention(data.SO_access), true)
						best_target.verified = true
					end
				else
					best_target = CopLogicBase._create_detected_attention_object_data(data.t, data.unit, u_key, attention_info, attention_info.handler:get_attention(data.SO_access), true)
				end
			end
		else
			Application:error("[CopLogicIdle._get_priority_attention] No attention object available for unit", inspect(forced_attention_data))
		end

		if best_target then
			return best_target, 1, AI_REACT_SHOOT
		end
	end

	local att_unit, reaction, distance, crim_record, reaction_too_mild = nil
	local near_threshold = data.internal_data.weapon_range.optimal
	local too_close_threshold = data.internal_data.weapon_range.close
	local analyse_giveaway_func = managers.groupai:state().analyse_giveaway

	for u_key, attention_data in pairs(attention_objects) do
		att_unit = attention_data.unit

		if not attention_data.identified then
			-- Nothing
		elseif attention_data.pause_expire_t then
			if attention_data.pause_expire_t < data.t then
				if not attention_data.settings.attract_chance or math.random() < attention_data.settings.attract_chance then
					attention_data.pause_expire_t = nil
				else
					attention_data.pause_expire_t = data.t + math.lerp(attention_data.settings.pause[1], attention_data.settings.pause[2], math.random())
				end
			end
		elseif attention_data.stare_expire_t and attention_data.stare_expire_t < data.t then
			if attention_data.settings.pause then
				attention_data.stare_expire_t = nil
				attention_data.pause_expire_t = data.t + math.lerp(attention_data.settings.pause[1], attention_data.settings.pause[2], math.random())
			end
		else
			distance = attention_data.dis
			reaction = reaction_func(data, attention_data, not CopLogicAttack._can_move(data))

			if data.cool and AI_REACT_SCARED <= reaction then
				data.unit:movement():set_cool(false, analyse_giveaway_func(data.unit:base()._tweak_table, att_unit))
			end

			if not reaction or best_target_reaction and reaction < best_target_reaction then
				reaction_too_mild = true
			elseif distance < 150 and reaction == AI_REACT_IDLE then
				reaction_too_mild = true
			end

			if not reaction_too_mild then
				local aimed_at = CopLogicIdle.chk_am_i_aimed_at(data, attention_data, attention_data.aimed_at and 0.95 or 0.985)
				attention_data.aimed_at = aimed_at
				local alert_dt = attention_data.alert_t and data.t - attention_data.alert_t or 10000
				local dmg_dt = attention_data.dmg_t and data.t - attention_data.dmg_t or 10000
				crim_record = attention_data.criminal_record
				local status = crim_record and crim_record.status
				local nr_enemies = crim_record and crim_record.engaged_force
				local old_enemy = false

				if data.attention_obj and data.attention_obj.u_key == u_key and data.t - attention_data.acquire_t < 1.5 then
					old_enemy = true
				end

				local weight_mul = attention_data.settings.weight_mul

				if attention_data.is_local_player then
					if not att_unit:movement():current_state()._moving and att_unit:movement():current_state():ducking() then
						weight_mul = (weight_mul or 1) * managers.player:upgrade_value("player", "stand_still_crouch_camouflage_bonus", 1)
					end

					if managers.player:has_activate_temporary_upgrade("temporary", "chico_injector") and managers.player:upgrade_value("player", "chico_preferred_target", false) then
						weight_mul = (weight_mul or 1) * 1000
					end

					if _G.IS_VR and tweak_data.vr.long_range_damage_reduction_distance[1] < distance then
						local mul = math.clamp(distance / tweak_data.vr.long_range_damage_reduction_distance[2] / 2, 0, 1) + 1
						weight_mul = (weight_mul or 1) * mul
					end
				elseif att_unit:base() and att_unit:base().upgrade_value then
					if att_unit:movement() and not att_unit:movement()._move_data and att_unit:movement()._pose_code and att_unit:movement()._pose_code == 2 then
						weight_mul = (weight_mul or 1) * (att_unit:base():upgrade_value("player", "stand_still_crouch_camouflage_bonus") or 1)
					end

					if att_unit:base().has_activate_temporary_upgrade and att_unit:base():has_activate_temporary_upgrade("temporary", "chico_injector") and att_unit:base():upgrade_value("player", "chico_preferred_target") then
						weight_mul = (weight_mul or 1) * 1000
					end

					if att_unit:movement().is_vr and att_unit:movement():is_vr() and tweak_data.vr.long_range_damage_reduction_distance[1] < distance then
						local mul = math.clamp(distance / tweak_data.vr.long_range_damage_reduction_distance[2] / 2, 0, 1) + 1
						weight_mul = (weight_mul or 1) * mul
					end
				end

				if old_enemy then
					weight_mul = (weight_mul or 1) * 1.5
				end

				if attention_data.is_human_player then
					weight_mul = (weight_mul or 1) * 1.25
				end

				if weight_mul and weight_mul ~= 1 then
					weight_mul = 1 / weight_mul
					alert_dt = alert_dt and alert_dt * weight_mul
					dmg_dt = dmg_dt and dmg_dt * weight_mul
					distance = distance * weight_mul
				end

				local visible = attention_data.verified
				local has_alerted = alert_dt < 3.5
				local has_damaged = dmg_dt < 5
				local target_priority = distance
				local is_sentry = attention_data.is_deployable
				local target_priority_slot = crim_record and not is_sentry and 3 or 7

				if visible or data.logic._keep_player_focus_t and attention_data.is_human_player and attention_data.verified_t and data.t - attention_data.verified_t < data.logic._keep_player_focus_t then
					if attention_data.is_human_player then
						if data.logic._keep_player_focus_t then
							target_priority = target_priority * (visible and 0.5 or 0.75)
						end

						target_priority_slot = target_priority_slot - 2
					end

					if distance < 500 then
						target_priority_slot = target_priority_slot - 2
					elseif distance < 1000 then
						target_priority_slot = target_priority_slot - 1
					end

					if dmg_dt < 5 then
						target_priority_slot = target_priority_slot - 2
					elseif alert_dt < 3.5 then
						target_priority_slot = target_priority_slot - 1
					end

					if old_enemy and crim_record and not is_sentry then
						target_priority_slot = target_priority_slot - 3
					end

					if target_priority_slot < 1 then
						target_priority_slot = 1

						if 1 then
							-- Nothing
						end
					end
				elseif not status then
					target_priority_slot = 7
				end

				if reaction < AI_REACT_COMBAT then
					local modifier = AI_REACT_COMBAT - reaction

					if modifier < 0 then
						modifier = 0
					end

					target_priority_slot = 10 + target_priority_slot + modifier
				end

				if target_priority_slot ~= 0 then
					local best = false

					if not best_target then
						best = true
					elseif target_priority_slot < best_target_priority_slot then
						best = true
					elseif target_priority_slot == best_target_priority_slot and target_priority < best_target_priority then
						best = true
					end

					if best then
						best_target = attention_data
						best_target_reaction = reaction
						best_target_priority_slot = target_priority_slot
						best_target_priority = target_priority
					end
				end
			end
		end
	end

	return best_target, best_target_priority_slot, best_target_reaction
end

function BossLogicAttack._upd_aim(data, my_data)
	local shoot, aim, expected_pos = nil
	local focus = data.attention_obj
	local reaction = focus and focus.reaction

	if focus then
		local focus_visible = focus.verified

		if AI_REACT_AIM <= reaction then
			if focus_visible or focus.nearly_visible then
				local weapon_range = my_data.weapon_range
				local walk_action = my_data.advancing
				local running = walk_action and not walk_action:stopping() and walk_action:haste() == "run"

				if reaction < AI_REACT_SHOOT then
					aim = true

					if running and math.lerp(weapon_range.close, weapon_range.optimal, 0) < focus.dis then
						local walk_to_pos = data.unit:movement():get_walk_to_pos()

						if walk_to_pos then
							mvec3_dir(temp_vec1, data.m_pos, walk_to_pos)
							mvec3_dir(temp_vec2, data.m_pos, focus.m_pos)
							mvec3_set_z(temp_vec1, 0)
							mvec3_set_z(temp_vec2, 0)

							if mvec3_dot(temp_vec1, temp_vec2) < 0.6 then
								aim = nil
							end
						end
					end
				else
					local firing_range = running and weapon_range.close or weapon_range.far
					local last_sup_t = data.unit:character_damage():last_suppression_t()

					if last_sup_t then
						local sup_t_ver = 7

						if running then
							sup_t_ver = sup_t_ver * 0.3
						end

						if not focus_visible then
							local vis_ray_data = focus.vis_ray

							if vis_ray_data and firing_range < vis_ray_data.distance then
								sup_t_ver = sup_t_ver * 0.5
							else
								sup_t_ver = sup_t_ver * 0.2
							end
						end

						shoot = sup_t_ver > data.t - last_sup_t
					end

					if not shoot and focus_visible then
						if focus.verified_dis < firing_range then
							shoot = true
						elseif focus.criminal_record and focus.criminal_record.assault_t and data.t - focus.criminal_record.assault_t < 2 then
							shoot = true
						end
					end

					if not shoot and my_data.attitude == "engage" then
						if focus_visible then
							if reaction == AI_REACT_SHOOT then
								shoot = true
							end
						elseif my_data.firing then
							local time_since_verification = focus.verified_t and data.t - focus.verified_t

							if time_since_verification and time_since_verification < 3.5 then
								shoot = true
							end
						end
					end

					aim = aim or shoot or focus.verified_dis < firing_range
				end
			else
				local time_since_verification = focus.verified_t
				local walk_action = my_data.advancing
				local running = walk_action and not walk_action:stopping() and walk_action:haste() == "run"

				if time_since_verification then
					time_since_verification = data.t - time_since_verification

					if running then
						local dis_lerp = math_clamp((focus.verified_dis - 500) / 600, 0, 1)
						aim = time_since_verification < math_lerp(5, 1, dis_lerp)
					elseif time_since_verification < 5 then
						aim = true
					end

					if aim and my_data.shooting and AI_REACT_SHOOT <= reaction then
						if running then
							local look_pos = focus.last_verified_pos or focus.verified_pos
							local same_height = math_abs(look_pos.z - data.m_pos.z) < 250

							if same_height and time_since_verification < 2 then
								shoot = true
							end
						elseif time_since_verification < 3 then
							shoot = true
						end
					end
				end

				if not shoot and (not focus.last_verified_pos or time_since_verification and time_since_verification > 5) then
					expected_pos = CopLogicAttack._get_expected_attention_position(data, my_data)

					if expected_pos then
						if running then
							local watch_dir = temp_vec1

							mvec3_set(watch_dir, expected_pos)
							mvec3_sub(watch_dir, data.m_pos)
							mvec3_set_z(watch_dir, 0)

							local watch_pos_dis = mvec3_norm(watch_dir)
							local walk_to_pos = data.unit:movement():get_walk_to_pos()
							local walk_vec = temp_vec2

							mvec3_set(walk_vec, walk_to_pos)
							mvec3_sub(walk_vec, data.m_pos)
							mvec3_set_z(walk_vec, 0)
							mvec3_norm(walk_vec)

							local watch_walk_dot = mvec3_dot(watch_dir, walk_vec)

							if watch_pos_dis < 500 or watch_pos_dis < 1000 and watch_walk_dot > 0.85 then
								aim = true
							end
						else
							aim = true
						end
					end
				end
			end
		end

		if not aim and data.char_tweak.always_face_enemy and AI_REACT_COMBAT <= reaction and (expected_pos or focus.last_verified_pos) then
			aim = true
		end

		BossLogicAttack._chk_use_throwable(data, my_data, focus, expected_pos)

		if data.logic.chk_should_turn(data, my_data) then
			local focus_pos = nil
			focus_pos = (focus_visible or focus.nearly_visible) and focus.m_pos or expected_pos or focus.last_verified_pos or focus.verified_pos

			CopLogicAttack._chk_request_action_turn_to_enemy(data, my_data, data.m_pos, focus_pos)
		end
	end

	if aim or shoot then
		if focus.verified or focus.nearly_visible then
			if my_data.attention_unit ~= focus.u_key then
				CopLogicBase._set_attention(data, focus)

				my_data.attention_unit = focus.u_key
			end
		else
			local look_pos = expected_pos or focus.last_verified_pos or focus.verified_pos

			if my_data.attention_unit ~= look_pos then
				CopLogicBase._set_attention_on_pos(data, mvec3_cpy(look_pos))

				my_data.attention_unit = mvec3_cpy(look_pos)
			end
		end

		if not my_data.shooting and not my_data.spooc_attack and not data.unit:anim_data().reload and not data.unit:movement():chk_action_forbidden("action") then
			local shoot_action = {
				body_part = 3,
				type = "shoot"
			}

			if data.brain:action_request(shoot_action) then
				my_data.shooting = true
			end
		end
	else
		if my_data.shooting and not data.unit:anim_data().reload then
			local new_action = {
				body_part = 3,
				type = "idle"
			}

			data.brain:action_request(new_action)
		end

		if my_data.attention_unit then
			CopLogicBase._reset_attention(data)

			my_data.attention_unit = nil
		end
	end

	CopLogicAttack.aim_allow_fire(shoot, aim, data, my_data)
end

function BossLogicAttack._chk_use_throwable(data, my_data, focus)
	local throwable = data.char_tweak.throwable

	if not throwable then
		return
	end

	if not focus.criminal_record or focus.is_deployable then
		return
	end

	local target_visible = focus.verified

	if target_visible then
		mvec3_set(my_data.last_seen_throwable_pos, focus.m_head_pos)

		return
	end

	if not focus.last_verified_pos then
		return
	end

	if data.used_throwable_t and data.t < data.used_throwable_t then
		return
	end

	local time_since_verification = focus.verified_t

	if not time_since_verification then
		return
	end

	time_since_verification = data.t - time_since_verification

	if time_since_verification < 2 or time_since_verification > 5 then
		return
	end

	local mov_ext = data.unit:movement()

	if mov_ext:chk_action_forbidden("action") then
		return
	end

	local head_pos = mov_ext:m_head_pos()
	local throw_dis = focus.verified_dis

	if throw_dis < 400 then
		mvector3.set_zero(my_data.last_seen_throwable_pos)

		return
	end

	if throw_dis > 2000 then
		return
	end

	local throw_from = head_pos + mov_ext:m_head_rot():y() * 50
	local last_seen_pos = my_data.last_seen_throwable_pos
	local slotmask = managers.slot:get_mask("world_geometry")
	local obstructed = data.unit:raycast("ray", throw_from, last_seen_pos, "sphere_cast_radius", 15, "slot_mask", slotmask, "report")

	if obstructed then
		return
	end

	local throw_dir = Vector3()

	mvec3_lerp(throw_dir, throw_from, last_seen_pos, 0.3)
	mvec3_sub(throw_dir, throw_from)

	local dis_lerp = math_clamp((throw_dis - 1000) / 1000, 0, 1)
	local compensation = math_lerp(0, 300, dis_lerp)

	mvec3_set_z(throw_dir, throw_dir.z + compensation)
	mvec3_norm(throw_dir)

	data.used_throwable_t = data.t + 15

	if mov_ext:play_redirect("throw_grenade") then
		managers.network:session():send_to_peers_synched("play_distance_interact_redirect", data.unit, "throw_grenade")
	end

	ProjectileBase.throw_projectile_npc(throwable, throw_from, throw_dir, data.unit)
end

function BossLogicAttack.queued_update(data)
	local my_data = data.internal_data
	data.t = TimerManager:game():time()

	BossLogicAttack.update(data)

	if my_data ~= data.internal_data then
		return
	end

	BossLogicAttack.queue_update(data, data.internal_data)
end

function BossLogicAttack._process_pathing_results(data, my_data)
	if data.pathing_results then
		local pathing_results = data.pathing_results
		data.pathing_results = nil
		local path = pathing_results[my_data.chase_path_search_id]

		if path then
			if path ~= "failed" then
				my_data.chase_path = path
			else
				print("[BossLogicAttack._process_pathing_results] chase path failed")

				my_data.chase_path_failed_t = data.t
			end

			my_data.pathing_to_chase_pos = nil
			my_data.chase_path_search_id = nil
		end
	end
end

function BossLogicAttack._cancel_chase_attempt(data, my_data)
	my_data.chase_path = nil

	if my_data.walking_to_chase_pos then
		local new_action = {
			body_part = 2,
			type = "idle"
		}

		data.unit:brain():action_request(new_action)
	elseif my_data.pathing_to_chase_pos then
		data.brain:rem_pos_rsrv("path")

		if data.active_searches[my_data.chase_path_search_id] then
			managers.navigation:cancel_pathing_search(my_data.chase_path_search_id)

			data.active_searches[my_data.chase_path_search_id] = nil
		elseif data.pathing_results then
			data.pathing_results[my_data.chase_path_search_id] = nil
		end

		my_data.chase_path_search_id = nil
		my_data.pathing_to_chase_pos = nil

		data.unit:brain():cancel_all_pathing_searches()
	elseif my_data.chase_pos then
		my_data.chase_pos = nil
	end
end

function BossLogicAttack.action_complete_clbk(data, action)
	local action_type = action:type()
	local my_data = data.internal_data

	if action_type == "walk" then
		my_data.advancing = nil

		if my_data.walking_to_chase_pos then
			my_data.walking_to_chase_pos = nil
		end

		if my_data.moving_out_of_the_way then
			my_data.moving_out_of_the_way = nil
		end

		TankCopLogicAttack._cancel_chase_attempt(data, my_data)
	elseif action_type == "shoot" then
		my_data.shooting = nil
	elseif action_type == "reload" or action_type == "heal" or action_type == "healed" then
		if action:expired() then
			BossLogicAttack._upd_aim(data, my_data)
		end
	elseif action_type == "act" then
		if my_data.gesture_arrest then
			my_data.gesture_arrest = nil
		elseif action:expired() then
			BossLogicAttack._upd_aim(data, my_data)
		end
	elseif action_type == "turn" then
		my_data.turning = nil
	elseif action_type == "hurt" then
		TankCopLogicAttack._cancel_chase_attempt(data, my_data)

		if action:expired() and action:hurt_type() ~= "death" then
			BossLogicAttack._upd_aim(data, my_data)
		end
	end
end

function BossLogicAttack.chk_should_turn(data, my_data)
	return not my_data.turning and not my_data.has_old_action and not my_data.advancing and not data.unit:movement():chk_action_forbidden("walk")
end

function BossLogicAttack.action_taken(data, my_data)
	return my_data.turning or my_data.has_old_action or my_data.advancing or data.unit:movement():chk_action_forbidden("walk")
end

function BossLogicAttack.queue_update(data, my_data)
	CopLogicBase.queue_task(my_data, my_data.update_queue_id, BossLogicAttack.queued_update, data, data.t + 0.2, true)
end

function BossLogicAttack._chk_request_action_walk_to_chase_pos(data, my_data, speed)
	if data.unit:movement():chk_action_forbidden("walk") then
		return
	end

	BossLogicAttack._correct_path_start_pos(data, my_data.chase_path)

	local new_action_data = {
		body_part = 2,
		type = "walk",
		nav_path = my_data.chase_path,
		variant = speed or "run"
	}
	my_data.chase_path = nil
	my_data.advancing = data.brain:action_request(new_action_data)

	if my_data.advancing then
		my_data.walking_to_chase_pos = my_data.advancing

		data.brain:rem_pos_rsrv("path")

		local cur_att_obj = data.attention_obj

		if cur_att_obj and cur_att_obj.criminal_record and not cur_att_obj.is_deployable then
			data.unit:sound():say(data.unit:sound().combat_str or "combat", true)
		end

		return true
	end
end

function BossLogicAttack._chk_start_action_move_out_of_the_way(data, my_data)
	local reservation = {
		radius = 30,
		position = data.m_pos,
		filter = data.pos_rsrv_id
	}

	if not managers.navigation:is_pos_free(reservation) then
		local to_pos = CopLogicTravel._get_pos_on_wall(data.m_pos, 500, nil, nil, data.pos_rsrv_id)

		if to_pos then
			local path = {
				mvec3_cpy(data.m_pos),
				to_pos
			}
			local new_action_data = {
				variant = "run",
				body_part = 2,
				type = "walk",
				nav_path = path
			}
			my_data.advancing = data.brain:action_request(new_action_data)

			if my_data.advancing then
				my_data.moving_out_of_the_way = my_data.advancing

				BossLogicAttack._cancel_chase_attempt(data, my_data)

				return true
			end
		end
	end
end

function BossLogicAttack.is_advancing(data)
	if data.pos_rsrv.move_dest then
		return data.pos_rsrv.move_dest.position
	end

	if data.internal_data.advancing then
		return data.internal_data.advancing:get_walk_to_pos()
	end

	if data.internal_data.moving_out_of_the_way then
		return data.internal_data.moving_out_of_the_way:get_walk_to_pos()
	end

	if data.internal_data.walking_to_chase_pos then
		return data.internal_data.walking_to_chase_pos:get_walk_to_pos()
	end
end

function BossLogicAttack._get_all_paths(data)
	return {
		chase_path = data.internal_data.chase_path
	}
end

function BossLogicAttack._set_verified_paths(data, verified_paths)
	data.internal_data.chase_path = verified_paths.chase_path
end

DeepBossLogicAttack = DeepBossLogicAttack or class(BossLogicAttack)
DeepBossLogicAttack._keep_player_focus_t = 10

function DeepBossLogicAttack.damage_clbk(data, damage_info)
	BossLogicAttack.damage_clbk(data, damage_info)

	if not data.unit:character_damage():dead() and data.unit:character_damage().health_ratio and data.unit:character_damage():health_ratio() < 0.4 then
		data.unit:sound():say(data.unit:sound().combat_str_alt or "combat_alt", true)
	end
end
