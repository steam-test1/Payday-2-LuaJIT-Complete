FlashGrenade = FlashGrenade or class(GrenadeBase)

function FlashGrenade:init(unit)
	self._init_timer = 1

	FlashGrenade.super.init(self, unit)
end

function FlashGrenade:_detonate()
	local units = World:find_units("sphere", self._unit:position(), 400, self._slotmask)

	for _, unit in ipairs(units) do
		local col_ray = {}

		col_ray.ray = (unit:position() - self._unit:position()):normalized()
		col_ray.position = self._unit:position()

		self:_give_flash_damage(col_ray, unit, 10)
	end

	self._unit:set_slot(0)
end

function FlashGrenade:_play_sound_and_effects()
	World:effect_manager():spawn({
		effect = Idstring("effects/particles/explosions/explosion_flash_grenade"),
		position = self._unit:position(),
		normal = self._unit:rotation():y()
	})
	self._unit:sound_source():post_event("trip_mine_explode")
end

function FlashGrenade:_give_flash_damage(col_ray, unit, damage)
	return
end
