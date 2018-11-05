PlayerAction.UnseenStrike = {}
PlayerAction.UnseenStrike.Priority = 1

PlayerAction.UnseenStrike.Function = function (player_manager, min_time, max_duration, crit_chance)
	local co = coroutine.running()
	local current_time = Application:time()
	local target_time = Application:time() + min_time
	local can_activate = true

	local function on_damage_taken()
		target_time = Application:time() + min_time
		can_activate = true
	end

	player_manager:register_message(Message.OnPlayerDamage, co, on_damage_taken)

	while true do
		current_time = Application:time()

		if target_time <= current_time and can_activate then
			player_manager:add_coroutine(PlayerAction.UnseenStrikeStart, PlayerAction.UnseenStrikeStart, player_manager, max_duration, crit_chance)

			can_activate = false
		end

		coroutine.yield(co)
	end

	player_manager:unregister_message(Message.OnPlayerDamage, co)
end
PlayerAction.UnseenStrikeStart = {}
PlayerAction.UnseenStrikeStart.Priority = 1

PlayerAction.UnseenStrikeStart.Function = function (player_manager, max_duration, crit_chance)
	local co = coroutine.running()
	local quit = false
	local current_time = Application:time()
	local target_time = Application:time() + max_duration

	local function on_damage_taken()
		quit = true
	end

	player_manager:register_message(Message.OnPlayerDamage, co, on_damage_taken)
	player_manager:add_to_crit_mul(crit_chance - 1)

	while current_time <= target_time and not quit do
		current_time = Application:time()

		coroutine.yield(co)
	end

	player_manager:sub_from_crit_mul(crit_chance - 1)
	player_manager:unregister_message(Message.OnPlayerDamage, co)
end

