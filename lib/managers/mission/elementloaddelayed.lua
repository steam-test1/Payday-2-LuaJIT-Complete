core:import("CoreMissionScriptElement")

ElementLoadDelayed = ElementLoadDelayed or class(CoreMissionScriptElement.MissionScriptElement)

function ElementLoadDelayed:init(...)
	ElementLoadDelayed.super.init(self, ...)
end

function ElementLoadDelayed:client_on_executed(...)
	self:on_executed(...)
end

function ElementLoadDelayed:on_executed(instigator)
	if not self._values.enabled then
		return
	end

	if not Application:editor() then
		self:_create_units()
	end

	ElementLoadDelayed.super.on_executed(self, instigator)
end

function ElementLoadDelayed:_create_units()
	if self._created_units then
		Application:stack_dump_error("[ElementLoadDelayed:_create_units] Attempted to spawn units again!", self._id, self._editor_name)

		return
	end

	self._created_units = true

	self._mission_script:add_save_state_cb(self._id)
	managers.worlddefinition:create_delayed_unit(self._values.unit_ids)
end

function ElementLoadDelayed:save(data)
	data.enabled = self._values.enabled
	data.created_units = self._created_units
end

function ElementLoadDelayed:load(data)
	self:set_enabled(data.enabled)

	if data.created_units then
		self:_create_units()
	end
end
