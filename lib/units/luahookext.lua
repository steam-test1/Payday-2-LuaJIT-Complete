require("lib/managers/AchievmentManager")

LuaHookExt = LuaHookExt or class()

function LuaHookExt:init(unit)
	self._unit = unit

	unit:set_extension_update_enabled(Idstring("lua_hook"), false)
end

function LuaHookExt:award(trophy_stat)
	managers.custom_safehouse:award(trophy_stat)
end
