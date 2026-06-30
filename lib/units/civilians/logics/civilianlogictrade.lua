CivilianLogicTrade = class(CopLogicTrade)

function CivilianLogicTrade._chk_request_action_walk_to_flee_pos(data, my_data, end_rot)
	local new_action_data = {}

	new_action_data.type = "walk"
	new_action_data.nav_path = my_data.flee_path
	new_action_data.variant = "run"
	new_action_data.body_part = 2
	my_data.walking_to_flee_pos = data.unit:brain():action_request(new_action_data)
	my_data.flee_path = nil
end
