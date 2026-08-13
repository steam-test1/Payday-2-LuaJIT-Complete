require("lib/managers/menu/ExtendedPanel")

GUIObjectWrapper = GUIObjectWrapper or class(ExtendedPanel)

function GUIObjectWrapper:init(gui_obj)
	self._gui_obj = gui_obj

	GUIObjectWrapper.super.init(self, gui_obj, {
		use_given = true
	})
end
