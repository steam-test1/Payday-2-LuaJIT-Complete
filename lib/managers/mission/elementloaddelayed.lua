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
	self._created_units = true

	self._mission_script:add_save_state_cb(self._id)
	managers.worlddefinition:create_delayed_unit(self._values.unit_ids)
end

function ElementLoadDelayed:save(data)
	data.created_units = self._created_units
end

function ElementLoadDelayed:load(data)
	if data.created_units then
		self:_create_units()
	end
end
