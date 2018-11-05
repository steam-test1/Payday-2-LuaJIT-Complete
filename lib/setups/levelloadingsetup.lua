require("core/lib/setups/CoreLoadingSetup")
require("lib/utils/LevelLoadingScreenGuiScript")
require("lib/managers/menu/MenuBackdropGUI")
require("core/lib/managers/CoreGuiDataManager")
require("core/lib/utils/CoreMath")
require("core/lib/utils/CoreEvent")

function fake_inspect(val)
	if val == nil or type(val) ~= "table" then
		return tostring(val)
	end

	local rtn = "

	for k, v in pairs(val) do
		rtn = rtn .. "| " .. tostring(k) .. " = " .. tostring(v) .. "\n"
	end

	rtn = rtn .. "

	return rtn
end

LevelLoadingSetup = LevelLoadingSetup or class(CoreLoadingSetup)

function LevelLoadingSetup:init()
	self._camera = Scene:create_camera()

	LoadingViewport:set_camera(self._camera)
	print("LevelLoadingSetup:init")
	print(fake_inspect(arg.load_level_data))

	self._gui_wrapper = LevelLoadingScreenGuiScript:new(Scene:gui(), arg.res, -1, arg.layer)
end

function LevelLoadingSetup:update(t, dt)
	self._gui_wrapper:update(-1, t, dt)
end

function LevelLoadingSetup:destroy()
	LevelLoadingSetup.super.destroy(self)
	Scene:delete_camera(self._camera)
end
setup = setup or LevelLoadingSetup:new()

setup:make_entrypoint()

