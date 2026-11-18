local IDS_BASE = Idstring("base")
local IDS_UNIT_DATA = Idstring("unit_data")

ScriptUnitData = ScriptUnitData or class()

function ScriptUnitData:init(unit)
	unit:set_extension_update_enabled(IDS_UNIT_DATA, false)
end

function ScriptUnitData:pre_destroy(unit)
	self._destroying = true

	if self._destroy_listener_holder then
		self._destroy_listener_holder:call(unit)
	end
end

function ScriptUnitData:destroy(unit)
	if self._destroying then
		return
	end

	if self._destroy_listener_holder then
		self._destroy_listener_holder:call(unit)
	end
end

function ScriptUnitData:add_destroy_listener(key, clbk)
	if self._destroying then
		Application:error("[MenuScriptUnitData] add_destroy_listener() - attempted to add a destroy listener when unit is being destroyed!", self._unit, key, clbk)

		return
	end

	self._destroy_listener_holder = self._destroy_listener_holder or ListenerHolder:new()

	self._destroy_listener_holder:add(key, clbk)
end

function ScriptUnitData:remove_destroy_listener(key)
	if not self._destroy_listener_holder then
		return
	end

	self._destroy_listener_holder:remove(key)

	if self._destroy_listener_holder:is_empty() then
		self._destroy_listener_holder = nil
	end
end

UnitBase = UnitBase or class()

function UnitBase:init(unit, update_enabled)
	self._unit = unit

	if not update_enabled then
		unit:set_extension_update_enabled(IDS_BASE, false)
	end
end

function UnitBase:pre_destroy(unit)
	self._destroying = true

	if self._destroy_listener_holder then
		self._destroy_listener_holder:call(unit)
	end
end

function UnitBase:destroy(unit)
	if self._destroying then
		return
	end

	if self._destroy_listener_holder then
		self._destroy_listener_holder:call(unit)
	end
end

function UnitBase:add_destroy_listener(key, clbk)
	if self._destroying then
		Application:error("[MenuUnitBase] add_destroy_listener() - attempted to add a destroy listener when unit is being destroyed!", self._unit, key, clbk)

		return
	end

	self._destroy_listener_holder = self._destroy_listener_holder or ListenerHolder:new()

	self._destroy_listener_holder:add(key, clbk)
end

function UnitBase:remove_destroy_listener(key)
	if not self._destroy_listener_holder then
		return
	end

	self._destroy_listener_holder:remove(key)

	if self._destroy_listener_holder:is_empty() then
		self._destroy_listener_holder = nil
	end
end
