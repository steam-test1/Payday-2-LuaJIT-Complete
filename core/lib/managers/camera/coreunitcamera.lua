core:module("CoreUnitCamera")
core:import("CoreClass")
core:import("CoreEvent")

UnitCamera = UnitCamera or CoreClass.class()

function UnitCamera:init(unit)
	self._unit = unit
	self._active_count = 0
end

function UnitCamera:destroy()
	return
end

function UnitCamera:create_layers()
	return
end

function UnitCamera:activate()
	local is_deactivated = self._active_count == 0

	self._active_count = self._active_count + 1

	if is_deactivated then
		self:on_activate(true)
	end
end

function UnitCamera:deactivate()
	assert(self._active_count > 0)

	self._active_count = self._active_count - 1

	local should_deactivate = self._active_count == 0

	if should_deactivate then
		self:on_activate(false)
	end

	return should_deactivate
end

function UnitCamera:on_activate(active)
	return
end

function UnitCamera:is_active()
	return self._active_count > 0
end

function UnitCamera:apply_camera(camera_manager)
	return
end
