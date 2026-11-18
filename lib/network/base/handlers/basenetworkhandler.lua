BaseNetworkHandler = BaseNetworkHandler or class()
BaseNetworkHandler._gamestate_filter = deep_clone(GameStateFilters)

function BaseNetworkHandler._verify_in_session()
	local session = managers.network:session()

	session = session and true or false

	return session
end

function BaseNetworkHandler._verify_in_server_session()
	local session = managers.network:session()

	session = session and session:is_host()

	return session
end

function BaseNetworkHandler._verify_in_client_session()
	local session = managers.network:session()

	session = session and session:is_client()

	return session
end

function BaseNetworkHandler._verify_sender(rpc)
	local peer
	local session = managers.network:session()

	if session then
		if rpc:protocol_at_index(0) == "STEAM" then
			peer = session:peer_by_user_id(rpc:ip_at_index(0))
		else
			peer = session:peer_by_ip(rpc:ip_at_index(0))
		end

		if peer then
			return peer
		end
	end

	return nil
end

function BaseNetworkHandler._verify_character_and_sender(unit, rpc)
	local peer = BaseNetworkHandler._verify_sender(rpc)
	local valid_character = BaseNetworkHandler._verify_character(unit)
	local result = peer and valid_character and true or false

	return result
end

function BaseNetworkHandler._verify_character(unit)
	if not alive(unit) then
		return false
	end

	local char_dmg_ext = unit:character_damage()

	if not char_dmg_ext then
		return false
	end

	local is_character_alive = not char_dmg_ext.dead or not char_dmg_ext:dead()

	return is_character_alive
end

function BaseNetworkHandler._verify_gamestate(acceptable_gamestates)
	if game_state_machine:verify_game_state(acceptable_gamestates) then
		return true
	end

	return false
end

function BaseNetworkHandler._get_unit_extension_safe(unit, ext_name, peer)
	if not table.contains(unit:extensions(), ext_name) then
		if unit[ext_name] then
			Application:error("[BaseNetworkHandler] _get_unit_extension_safe() - potentially malicious rpc received. \"" .. ext_name .. "\" is a unit function, not an extension. Peer:", peer)
		else
			Application:error("[BaseNetworkHandler] _get_unit_extension_safe() - no \"" .. ext_name .. "\" extension on unit. Unit:", unit)
		end

		return nil
	end

	local extension = unit[ext_name](unit)

	if not extension then
		return nil
	end

	return extension
end

function BaseNetworkHandler:_chk_flush_unit_too_early_packets(unit)
	if self._flushing_unit_too_early_packets or not alive(unit) then
		return
	end

	local unit_id = unit:id()

	if unit_id == -1 then
		return
	end

	local unit_rpcs = self._unit_too_early_queue and self._unit_too_early_queue[unit_id] or nil

	if not unit_rpcs then
		return
	end

	self._flushing_unit_too_early_packets = true

	for _, rpc_info in ipairs(unit_rpcs) do
		rpc_info.params[rpc_info.unit_param_index] = unit

		self[rpc_info.fun_name](self, unpack(rpc_info.params))
	end

	self._unit_too_early_queue[unit_id] = nil

	if not next(self._unit_too_early_queue) then
		self._unit_too_early_queue = nil
	end

	self._flushing_unit_too_early_packets = nil
end

function BaseNetworkHandler:_chk_unit_too_early(unit, unit_id_str, fun_name, unit_param_index, ...)
	if self._flushing_unit_too_early_packets or alive(unit) then
		return false
	end

	if not self._unit_too_early_queue then
		self._unit_too_early_queue = {}
	end

	local data = {
		unit_param_index = unit_param_index,
		fun_name = fun_name,
		params = {
			...
		}
	}
	local unit_id = tonumber(unit_id_str)

	self._unit_too_early_queue[unit_id] = self._unit_too_early_queue[unit_id] or {}

	table.insert(self._unit_too_early_queue[unit_id], data)

	return true
end
