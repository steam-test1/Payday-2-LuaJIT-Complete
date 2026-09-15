RevolvingShotgunBase = RevolvingShotgunBase or class(ShotgunBase)

function RevolvingShotgunBase:init(...)
	RevolvingShotgunBase.super.init(self, ...)

	self._shell_state = true
end

function RevolvingShotgunBase:fire(...)
	local ray_res = RevolvingShotgunBase.super.fire(self, ...)

	if ray_res then
		self._shell_state = true
	end

	return ray_res
end

function RevolvingShotgunBase:start_reload(...)
	RevolvingShotgunBase.super.start_reload(self, ...)

	self._shell_state = false

	self:check_bullet_objects()
end

function RevolvingShotgunBase:on_reload_stop(...)
	RevolvingShotgunBase.super.on_reload_stop(self, ...)

	if self:clip_full() then
		self._shell_state = true
	end

	if self._assembly_complete then
		self:tweak_data_anim_play("equip")
	end
end

function RevolvingShotgunBase:replenish(...)
	self._shell_state = true

	RevolvingShotgunBase.super.replenish(self, ...)

	if self._assembly_complete then
		self:tweak_data_anim_play("equip")
	end
end

function RevolvingShotgunBase:clip_not_empty()
	self:check_bullet_objects()

	return self._shell_state
end

function RevolvingShotgunBase:_update_bullet_objects(ammo_func)
	if self._bullet_objects then
		for i, objects in pairs(self._bullet_objects) do
			for _, object in ipairs(objects) do
				if object[1] then
					object[1]:set_visibility(self._shell_state)
				end
			end
		end
	end
end
