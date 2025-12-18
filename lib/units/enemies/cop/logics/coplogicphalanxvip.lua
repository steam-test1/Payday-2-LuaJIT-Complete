local tmp_vec1 = Vector3()
CopLogicPhalanxVip = class(CopLogicBase)
CopLogicPhalanxVip.on_alert = CopLogicIdle.on_alert
CopLogicPhalanxVip.on_new_objective = CopLogicIdle.on_new_objective
CopLogicPhalanxVip._upd_aim = CopLogicAttack._upd_aim
CopLogicPhalanxVip._chk_reaction_to_attention_object = CopLogicAttack._chk_reaction_to_attention_object
CopLogicPhalanxVip.on_intimidated = CopLogicIdle.on_intimidated
CopLogicPhalanxVip._surrender = CopLogicIdle._surrender
CopLogicPhalanxVip.on_criminal_neutralized = CopLogicIdle.on_criminal_neutralized
CopLogicPhalanxVip._chk_request_action_turn_to_look_pos = CopLogicIdle._chk_request_action_turn_to_look_pos
CopLogicPhalanxVip._get_all_paths = CopLogicIdle._get_all_paths
CopLogicPhalanxVip._set_verified_paths = CopLogicIdle._set_verified_paths
CopLogicPhalanxVip._chk_turn_needed = CopLogicIdle._chk_turn_needed
CopLogicPhalanxVip._turn_by_spin = CopLogicIdle._turn_by_spin
CopLogicPhalanxVip._upd_stance_and_pose = CopLogicIdle._upd_stance_and_pose
CopLogicPhalanxVip._perform_objective_action = CopLogicIdle._perform_objective_action
CopLogicPhalanxVip._upd_stop_old_action = CopLogicIdle._upd_stop_old_action
CopLogicPhalanxVip._chk_has_old_action = CopLogicIdle._chk_has_old_action
CopLogicPhalanxVip._start_idle_action_from_act = CopLogicIdle._start_idle_action_from_act
CopLogicPhalanxVip.allowed_transitional_actions = {
	{
		"idle",
		"hurt",
		"dodge"
	},
	{
		"idle",
		"turn"
	},
	{
		"idle",
		"reload"
	},
	{
		"hurt",
		"stand",
		"crouch"
	}
}

function CopLogicPhalanxVip.enter(data, new_logic_name, enter_params)
	CopLogicBase.enter(data, new_logic_name, enter_params)

	local my_data = {
		unit = data.unit
	}
	local is_cool = data.unit:movement():cool()
	my_data.detection = data.char_tweak.detection.combat
	local old_internal_data = data.internal_data

	if old_internal_data then
		my_data.turning = old_internal_data.turning

		if old_internal_data.firing then
			data.unit:movement():set_allow_fire(false)
		end

		if old_internal_data.shooting then
			data.unit:brain():action_request({
				body_part = 3,
				type = "idle"
			})
		end

		local lower_body_action = data.unit:movement()._active_actions[2]
		my_data.advancing = lower_body_action and lower_body_action:type() == "walk" and lower_body_action
	end

	data.internal_data = my_data
	local key_str = tostring(data.unit:key())
	my_data.detection_task_key = "CopLogicPhalanxVip.update" .. key_str

	CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicPhalanxVip.queued_update, data, data.t)

	local objective = data.objective

	CopLogicPhalanxVip._chk_has_old_action(data, my_data)

	if is_cool then
		data.unit:brain():set_attention_settings({
			peaceful = true
		})
	else
		data.unit:brain():set_attention_settings({
			cbt = true
		})
	end

	my_data.weapon_range = data.char_tweak.weapon[data.unit:inventory():equipped_unit():base():weapon_tweak_data().usage].range

	CopLogicPhalanxVip.calc_initial_phalanx_pos(data.m_pos, objective)
	data.unit:brain():set_update_enabled_state(false)
	CopLogicPhalanxVip._perform_objective_action(data, my_data, objective)
	managers.groupai:state():phalanx_damage_reduction_enable()
	CopLogicPhalanxVip._set_final_health_limit(data)
	data.unit:sound():say("cpw_a05", true, true)
end

function CopLogicPhalanxVip.exit(data, new_logic_name, enter_params)
	CopLogicBase.exit(data, new_logic_name, enter_params)

	local my_data = data.internal_data

	data.unit:brain():cancel_all_pathing_searches()
	managers.groupai:state():phalanx_damage_reduction_disable()
	managers.groupai:state():force_end_assault_phase()
	CopLogicBase.cancel_queued_tasks(my_data)
	CopLogicBase.cancel_delayed_clbks(my_data)
	data.brain:rem_pos_rsrv("path")

	for achievement_id, achievement_data in pairs(tweak_data.achievement.enemy_kill_achievements) do
		if achievement_data.is_vip then
			local all_pass, mutators_pass = nil
			mutators_pass = managers.mutators:check_achievements(achievement_data)
			all_pass = mutators_pass

			if all_pass then
				managers.achievment:_award_achievement(achievement_data, achievement_id)

				if Network:is_server() then
					managers.network:session():send_to_peers("sync_phalanx_vip_achievement_unlocked", achievement_id)
				end
			end
		end
	end
end

function CopLogicPhalanxVip.queued_update(data)
	local my_data = data.internal_data
	local delay = data.logic._upd_enemy_detection(data)

	if data.internal_data ~= my_data then
		CopLogicBase._report_detections(data.detected_attention_objects)

		return
	end

	local objective = data.objective

	if my_data.has_old_action then
		CopLogicPhalanxVip._upd_stop_old_action(data, my_data, objective)
		CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicPhalanxVip.queued_update, data, data.t + delay, data.important and true)

		return
	end

	if data.team.id == "criminal1" and (not data.objective or data.objective.type == "free") and (not data.path_fail_t or data.t - data.path_fail_t > 6) then
		managers.groupai:state():on_criminal_jobless(data.unit)

		if my_data ~= data.internal_data then
			return
		end
	end

	CopLogicPhalanxVip._perform_objective_action(data, my_data, objective)
	CopLogicPhalanxVip._upd_stance_and_pose(data, my_data, objective)

	if data.internal_data ~= my_data then
		CopLogicBase._report_detections(data.detected_attention_objects)

		return
	end

	delay = data.important and 0 or delay or 0.3

	CopLogicBase.queue_task(my_data, my_data.detection_task_key, CopLogicPhalanxVip.queued_update, data, data.t + delay, data.important and true)
end

function CopLogicPhalanxVip.damage_clbk(data, damage_info)
	CopLogicIdle.damage_clbk(data, damage_info)
	CopLogicPhalanxVip._chk_should_breakup(data)
end

function CopLogicPhalanxVip.chk_should_turn(data, my_data)
	return not my_data.turning and not my_data.has_old_action and not data.unit:movement():chk_action_forbidden("walk") and not my_data.moving_to_cover and not my_data.walking_to_cover_shoot_pos and not my_data.surprised
end

function CopLogicPhalanxVip.register_in_group_ai(unit)
	managers.groupai:state():register_phalanx_vip(unit)
end

function CopLogicPhalanxVip._set_final_health_limit(data)
	data.unit:character_damage():host_set_final_lower_health_percentage_limit()
end

function CopLogicPhalanxVip._chk_should_breakup(data)
	local flee_health_ratio = tweak_data.group_ai.phalanx.vip.health_ratio_flee
	local vip_health_ratio = data.unit:character_damage():health_ratio()

	if vip_health_ratio <= flee_health_ratio then
		CopLogicPhalanxVip.breakup(nil)
	end
end

function CopLogicPhalanxVip.breakup(remote_call)
	local group_ai_state = managers.groupai:state()
	local phalanx_vip = group_ai_state:phalanx_vip()

	if phalanx_vip then
		if alive(phalanx_vip) then
			local brain = phalanx_vip:brain()

			if brain and brain:objective() then
				brain:set_objective(nil)
			end

			if phalanx_vip:sound() then
				phalanx_vip:sound():say("cpw_a04", true, true)
			end

			group_ai_state:unit_leave_group(phalanx_vip, false)
			CopLogicPhalanxVip.do_vip_flee(phalanx_vip)
		end

		group_ai_state:unregister_phalanx_vip()
	end

	if not remote_call then
		CopLogicPhalanxMinion.breakup(true)
	end
end

function CopLogicPhalanxVip.do_vip_flee(unit)
	if not alive(unit) then
		return
	end

	local group_ai_state = managers.groupai:state()
	local nav_seg = unit:movement():nav_tracker():nav_segment()
	local flee_pos = group_ai_state:flee_point(nav_seg)

	if flee_pos then
		local flee_nav_seg = managers.navigation:get_nav_seg_from_pos(flee_pos)

		unit:brain():set_objective({
			forced = true,
			attitude = "avoid",
			type = "flee",
			pos = flee_pos,
			nav_seg = flee_nav_seg
		})
	end
end

function CopLogicPhalanxVip._upd_enemy_detection(data)
	managers.groupai:state():on_unit_detection_updated(data.unit)

	data.t = TimerManager:game():time()
	local my_data = data.internal_data
	local delay = CopLogicBase._upd_attention_obj_detection(data, nil, nil)
	local new_attention, new_prio_slot, new_reaction = CopLogicIdle._get_priority_attention(data, data.detected_attention_objects)

	CopLogicBase._set_attention_obj(data, new_attention, new_reaction)
	data.logic._upd_aim(data, my_data)

	if new_reaction and AIAttentionObject.REACT_SHOOT <= new_reaction then
		my_data.last_violent_attention = new_attention
	end

	return delay
end

function CopLogicPhalanxVip.action_complete_clbk(data, action)
	local action_type = action:type()

	if action_type == "turn" then
		data.internal_data.turning = nil
	elseif action_type == "act" then
		local my_data = data.internal_data

		if my_data.action_started == action then
			if action:expired() then
				if not my_data.action_timeout_clbk_id then
					data.objective_complete_clbk(data.unit, data.objective)
				end
			elseif not my_data.action_expired then
				data.objective_failed_clbk(data.unit, data.objective)
			end
		end
	end
end

function CopLogicPhalanxVip.is_available_for_assignment(data, objective)
	return false
end

function CopLogicPhalanxVip.calc_initial_phalanx_pos(own_pos, objective)
	return managers.groupai:state()._phalanx_center_pos
end

function CopLogicPhalanxVip.on_criminal_neutralized(data, criminal_key)
	local my_data = data.internal_data

	if my_data.last_violent_attention and my_data.last_violent_attention.u_key == criminal_key then
		data.unit:sound():say("cpw_a02", true, true)
	end
end

function CopLogicPhalanxVip.on_area_safety(data, nav_seg, safe, event)
	CopLogicBase.on_area_safety(data, nav_seg, safe, event)

	local my_data = data.internal_data

	if not safe and not data.internal_data._vip_shouted_contact and not data.unit:sound():speaking(TimerManager:game():time()) then
		data.unit:sound():say("cpw_a01", true, true)

		my_data._vip_shouted_contact = true
	end
end
