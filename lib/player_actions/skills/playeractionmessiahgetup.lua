PlayerAction.MessiahGetUp = {}
PlayerAction.MessiahGetUp.Priority = 1

PlayerAction.MessiahGetUp.Function = function (player_manager)
	managers.hint:show_hint("skill_messiah_get_up")

	local controller = player_manager:player_unit():base():controller()
	local co = coroutine.running()

	while player_manager:current_state() == "bleed_out" do
		if controller:get_input_pressed("jump") then
			player_manager:use_messiah_charge()
			player_manager:send_message(Message.RevivePlayer, nil, nil)

			break
		end

		coroutine.yield(co)
	end
end

