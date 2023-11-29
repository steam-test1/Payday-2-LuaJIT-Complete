_OcclusionManager = _OcclusionManager or class()

function _OcclusionManager:init()
	self._model_ids = Idstring("model")
	self._skip_occlusion = {}
end

function _OcclusionManager:skip_units()
	return self._skip_occlusion
end

function _OcclusionManager:is_occluded(unit)
	if self._skip_occlusion[unit:key()] then
		return false
	end

	return unit:occluded()
end

function _OcclusionManager:remove_occlusion(unit)
	local u_key = unit:key()

	if self._skip_occlusion[u_key] then
		self._skip_occlusion[u_key] = self._skip_occlusion[u_key] + 1
	else
		self._skip_occlusion[u_key] = 1

		if alive(unit) then
			local objects = unit:get_objects_by_type(self._model_ids)

			for _, obj in pairs(objects) do
				obj:set_skip_occlusion(true)
			end
		end
	end
end

function _OcclusionManager:add_occlusion(unit)
	local u_key = unit:key()

	if self._skip_occlusion[u_key] then
		self._skip_occlusion[u_key] = self._skip_occlusion[u_key] - 1

		if self._skip_occlusion[u_key] > 0 then
			return
		else
			self._skip_occlusion[u_key] = nil
		end
	end

	if alive(unit) then
		local objects = unit:get_objects_by_type(self._model_ids)

		for _, obj in pairs(objects) do
			obj:set_skip_occlusion(false)
		end
	end
end
