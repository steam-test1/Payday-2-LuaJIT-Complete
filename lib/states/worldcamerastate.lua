require("lib/states/GameState")

WorldCameraState = WorldCameraState or class(GameState)

function WorldCameraState:init(game_state_machine)
	GameState.init(self, "world_camera", game_state_machine)
end

function WorldCameraState:at_enter()
	return
end

function WorldCameraState:at_exit()
	return
end
