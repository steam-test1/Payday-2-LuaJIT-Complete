PlayerParachutingVR = PlayerParachuting or Application:error("PlayerParachutingVR needs PlayerParachuting!")
local __enter = PlayerParachuting.enter

function PlayerParachutingVR:enter(...)
	__enter(self, ...)
	self._camera_unit:base():set_hmd_tracking(false)
	managers.menu:open_menu("zipline")
end
local __exit = PlayerParachuting.exit

function PlayerParachutingVR:exit(...)
	__exit(self, ...)
	managers.menu:close_menu("zipline")
	self._camera_unit:base():set_hmd_tracking(true)
end

function PlayerParachutingVR:_update_variables(t, dt)
	self._current_height = self._ext_movement:hmd_position().z
end
local __update_movement = PlayerParachuting._update_movement

function PlayerParachutingVR:_update_movement(t, dt)
	__update_movement(self, t, dt)
	self._unit:movement():set_ghost_position(self._unit:position())
end

