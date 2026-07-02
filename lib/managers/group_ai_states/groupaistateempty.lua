GroupAIStateEmpty = GroupAIStateEmpty or class(GroupAIStateBase)

function GroupAIStateEmpty:assign_enemy_to_group_ai(unit)
	return
end

function GroupAIStateEmpty:on_enemy_tied(u_key)
	return
end

function GroupAIStateEmpty:on_enemy_untied(u_key)
	return
end

function GroupAIStateEmpty:on_civilian_tied(u_key)
	return
end

function GroupAIStateEmpty:can_hostage_flee()
	return
end

function GroupAIStateEmpty:add_to_surrendered(unit, update)
	return
end

function GroupAIStateEmpty:remove_from_surrendered(unit)
	return
end

function GroupAIStateEmpty:flee_point(start_nav_seg)
	return
end

function GroupAIStateEmpty:on_security_camera_spawned()
	return
end

function GroupAIStateEmpty:on_security_camera_broken()
	return
end

function GroupAIStateEmpty:on_security_camera_destroyed()
	return
end

function GroupAIStateEmpty:on_nav_segment_state_change(changed_seg, state)
	return
end

function GroupAIStateEmpty:set_area_min_police_force(id, force, pos)
	return
end

function GroupAIStateEmpty:set_wave_mode(flag)
	return
end

function GroupAIStateEmpty:add_preferred_spawn_points(id, spawn_points)
	return
end

function GroupAIStateEmpty:remove_preferred_spawn_points(id)
	return
end

function GroupAIStateEmpty:register_criminal(unit)
	return
end

function GroupAIStateEmpty:unregister_criminal(unit)
	return
end

function GroupAIStateEmpty:on_defend_travel_end(unit, objective)
	return
end

function GroupAIStateEmpty:is_area_safe()
	return true
end

function GroupAIStateEmpty:is_nav_seg_safe()
	return true
end

function GroupAIStateEmpty:set_mission_fwd_vector(direction)
	return
end

function GroupAIStateEmpty:set_drama_build_period(period)
	return
end

function GroupAIStateEmpty:add_special_objective(id, objective_data)
	return
end

function GroupAIStateEmpty:remove_special_objective(id)
	return
end

function GroupAIStateEmpty:save(save_data)
	return
end

function GroupAIStateEmpty:load(load_data)
	return
end

function GroupAIStateEmpty:on_cop_jobless(unit)
	return
end

function GroupAIStateEmpty:spawn_one_teamAI(unit)
	return
end

function GroupAIStateEmpty:remove_one_teamAI(unit)
	return
end

function GroupAIStateEmpty:fill_criminal_team_with_AI(unit)
	return
end

function GroupAIStateEmpty:set_importance_weight(cop_unit, dis_report)
	return
end

function GroupAIStateEmpty:on_criminal_recovered(criminal_unit)
	return
end

function GroupAIStateEmpty:on_criminal_disabled(unit)
	return
end

function GroupAIStateEmpty:on_criminal_neutralized(unit)
	return
end

function GroupAIStateEmpty:is_detection_persistent()
	return
end

function GroupAIStateEmpty:on_nav_link_unregistered()
	return
end

function GroupAIStateEmpty:save()
	return
end

function GroupAIStateEmpty:load()
	return
end
