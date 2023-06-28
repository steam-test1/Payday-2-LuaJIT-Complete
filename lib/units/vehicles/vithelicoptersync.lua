VitHelicopterSync = VitHelicopterSync or class()

function VitHelicopterSync:init(unit)
	self._unit = unit

	unit:set_extension_update_enabled(Idstring("helicopter_sync"), false)

	if Network:is_server() then
		local driving_ext = unit:vehicle_driving()

		if not driving_ext then
			Application:error("[VitHelicopterSync:init] No 'vehicle_driving' extension found. Make sure that the 'helicopter_sync' extension is defined after a 'vehicle_driving' one in the unit file.", self._unit)
		end

		driving_ext.on_exit_vehicle = callback(self, self, "on_exit_vehicle")
	end
end

function VitHelicopterSync:on_landing_done()
	local player = managers.player:player_unit()
	local movement_ext = player and player:movement()

	if movement_ext and movement_ext:current_state_name() == "driving" then
		local cur_vehicle_data = managers.player:get_vehicle()

		if cur_vehicle_data and cur_vehicle_data.vehicle_unit == self._unit then
			movement_ext:current_state():cb_leave()
		else
			Application:error("[VitHelicopterSync:on_landing_done] Local player couldn't find current vehicle?", self._unit, inspect(cur_vehicle_data))
		end
	end
end

function VitHelicopterSync:on_exit_vehicle(player)
	local is_empty = self._unit:vehicle_driving():num_players_inside() == 0

	if is_empty then
		self._unit:damage():run_sequence_simple("event_vehicle_empty")
	end
end

function VitHelicopterSync:save(data)
end

function VitHelicopterSync:load(data)
	managers.worlddefinition:use_me(self._unit)
end
