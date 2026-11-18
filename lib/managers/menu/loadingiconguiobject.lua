LoadingIconGuiObject = LoadingIconGuiObject or class()

function LoadingIconGuiObject:init(panel, visible)
	self._icon = panel:bitmap({
		name = "loading_icon",
		texture = "guis/textures/icon_loading",
		visible = visible or false
	})

	self._icon:set_center(panel:w() / 2, panel:h() / 2)
end

function LoadingIconGuiObject:show()
	self._icon:animate(function(o)
		local dt

		while true do
			dt = coroutine.yield()

			o:rotate(dt * 180)
		end
	end)
	self._icon:show()
end

function LoadingIconGuiObject:hide()
	self._icon:stop()
	self._icon:hide()
end
