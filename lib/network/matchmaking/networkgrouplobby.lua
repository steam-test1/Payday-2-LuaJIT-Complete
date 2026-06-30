NetworkGroupLobby = NetworkGroupLobby or class()

function NetworkGroupLobby:init()
	return
end

function NetworkGroupLobby:_server_timed_out(rpc)
	return
end

function NetworkGroupLobby:is_invite_changing_control()
	return self._invite_changing_control
end
