core:import("CoreWorldDefinition")

WorldDefinition = WorldDefinition or class(CoreWorldDefinition.WorldDefinition)

function WorldDefinition:init(...)
	WorldDefinition.super.init(self, ...)

	self._synced_unit_interactions = {}
end

function WorldDefinition:_project_assign_unit_data(unit, data)
	if Network:is_server() and unit:id() == -1 and unit:interaction() and unit:interaction().save then
		local unit_id = unit:unit_data().unit_id
		self._synced_unit_interactions[unit_id] = unit
	end
end

function WorldDefinition:get_cover_data()
	local path = self:world_dir() .. "cover_data"

	if not DB:has("cover_data", path) then
		return false
	end

	return self:_serialize_to_script("cover_data", path)
end

function WorldDefinition:sync_save(data)
	local state = {}

	for unit_id, unit in pairs(self._synced_unit_interactions) do
		if alive(unit) then
			state[unit_id] = {}

			unit:interaction():save(state[unit_id])
		end
	end

	data.WorldDefinition = state
end

function WorldDefinition:sync_load(data)
	local state = data.WorldDefinition

	if state then
		local unit = nil

		for unit_id, unit_state in pairs(state) do
			unit = self:get_unit_on_load(unit_id, function (unit)
				unit:interaction():load(unit_state)
			end)

			if unit then
				unit:interaction():load(unit_state)
			end
		end
	end
end

CoreClass.override_class(CoreWorldDefinition.WorldDefinition, WorldDefinition)
