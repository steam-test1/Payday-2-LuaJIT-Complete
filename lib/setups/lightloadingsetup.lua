require("core/lib/setups/CoreLoadingSetup")
require("lib/utils/LightLoadingScreenGuiScript")

LightLoadingSetup = LightLoadingSetup or class(CoreLoadingSetup)

function LightLoadingSetup:init()
	self._camera = Scene:create_camera()

	LoadingViewport:set_camera(self._camera)

	self._gui_wrapper = LightLoadingScreenGuiScript:new(Scene:gui(), arg.res, -1, arg.layer, arg.is_win32)
end

function LightLoadingSetup:update(t, dt)
	self._gui_wrapper:update(-1, dt)
end

function LightLoadingSetup:destroy()
	LightLoadingSetup.super.destroy(self)
	Scene:delete_camera(self._camera)
end
setup = setup or LightLoadingSetup:new()

setup:make_entrypoint()

