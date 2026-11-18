NetworkBaseExtension = NetworkBaseExtension or class()

function NetworkBaseExtension:init(unit)
	self._unit = unit
end

function NetworkBaseExtension:send(func, ...)
	managers.network:send_to_peers_synched(func, self._unit, ...)
end

function NetworkBaseExtension:send_to_host(func, ...)
	managers.network:send_to_host(func, self._unit, ...)
end

function NetworkBaseExtension:send_to_unit(params)
	local peer = managers.network:get_peer_by_unit_safe(self._unit)

	if peer then
		managers.network:send_to_peer(peer, unpack(params))
	end
end

function NetworkBaseExtension:peer()
	return managers.network:get_peer_by_unit_safe(self._unit)
end
