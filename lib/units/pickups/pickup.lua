Pickup = Pickup or class()

function Pickup:init(unit)
	if not Network:is_server() and unit:slot() == 23 then
		unit:set_slot(20)
	end

	self._unit = unit
	self._active = true
end

function Pickup:sync_pickup()
	self:consume()
end

function Pickup:_pickup()
	Application:error("Pickup didn't have a _pickup() function!")
end

function Pickup:pickup(unit)
	if not self._active then
		return
	end

	return self:_pickup(unit)
end

function Pickup:consume()
	self:delete_unit()
end

function Pickup:set_active(active)
	self._active = active
end

function Pickup:delete_unit()
	local unit = self._unit

	if Network:is_server() or unit:id() == -1 then
		World:delete_unit(unit)
	else
		unit:set_visible(false)
		self:set_active(false)

		local int_ext = unit:interaction()

		if int_ext then
			int_ext:set_active(false)
		end

		unit:set_enabled(false)
	end
end

function Pickup:save(data)
	local state = {
		active = self._active
	}
	data.Pickup = state
end

function Pickup:load(data)
	local state = data.Pickup

	if state then
		self:set_active(state.active)
	end
end

function Pickup:sync_net_event(event, peer)
end

function Pickup:destroy(unit)
end
