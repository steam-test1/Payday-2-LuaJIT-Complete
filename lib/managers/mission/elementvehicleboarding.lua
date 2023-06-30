core:import("CoreMissionScriptElement")

ElementVehicleBoarding = ElementVehicleBoarding or class(CoreMissionScriptElement.MissionScriptElement)

function ElementVehicleBoarding:init(...)
	ElementVehicleBoarding.super.init(self, ...)
end

function ElementVehicleBoarding:get_vehicle()
	if Global.running_simulation then
		return managers.editor:unit_with_id(self._values.vehicle)
	else
		return managers.worlddefinition:get_unit(self._values.vehicle)
	end
end

function ElementVehicleBoarding:get_teleport_element_by_seat(seat)
	local point_index = nil

	for seat_index, seat_name in ipairs(self._values.seats_order) do
		if seat == seat_name then
			point_index = seat_index

			break
		end
	end

	local point_id = self._values.teleport_points and self._values.teleport_points[point_index]

	if not point_id then
		if self._values.teleport_points and next(self._values.teleport_points) then
			Application:error("[ElementVehicleBoarding:get_teleport_element_by_seat_index] No teleport point found for seat " .. tostring(seat) .. " in element '" .. tostring(self._editor_name) .. "'. Printing teleport_points table: ", inspect(self._values.teleport_points))
		end

		return
	end

	local teleport_element = self:get_mission_element(point_id)

	if not teleport_element then
		Application:error("[ElementVehicleBoarding:get_teleport_element_by_seat_index] No teleport element found with ID " .. tostring(point_id) .. " in element '" .. tostring(self._editor_name) .. "'.")

		return
	end

	return teleport_element
end

function ElementVehicleBoarding:client_on_executed(...)
	self:on_executed(...)
end

function ElementVehicleBoarding:on_executed(...)
	if not self._values.enabled then
		return
	end

	local operation_func = self["operation_" .. tostring(self._values.operation)]

	if operation_func then
		operation_func(self, ...)
	else
		Application:error("[ElementVehicleBoarding:on_executed] Operation '" .. tostring(self._values.operation) .. "' not found.")
	end

	ElementVehicleBoarding.super.on_executed(self, ...)
end

function ElementVehicleBoarding:operation_embark()
	if not Network:is_server() then
		return
	end

	local vehicle = self:get_vehicle()

	if not vehicle then
		Application:stack_dump_error("[ElementVehicleBoarding:operation_embark] Unable to retrieve wanted vehicle unit!")

		return
	end

	local vehicle_ext = vehicle:vehicle_driving()

	if not vehicle_ext then
		Application:error("[ElementVehicleBoarding:operation_embark] Vehicle unit has no 'vehicle_driving' extension.", vehicle)

		return
	end

	local ordered_seats = {}
	local team_ai = {}
	local players = {}

	for i = #self._values.seats_order, 1, -1 do
		local seat_name = self._values.seats_order[i]

		table.insert(ordered_seats, vehicle_ext:get_seat_by_name(seat_name))
	end

	table.sort(ordered_seats, function (a, b)
		return a.driving and not b.driving
	end)

	local function player_cmp(a, b)
		return a.peer_id < b.peer_id
	end

	for _, heister in pairs(managers.criminals:characters()) do
		if heister.taken then
			if heister.data.ai then
				table.insert(team_ai, heister)
			else
				table.insert_sorted(players, heister, player_cmp)
			end
		end
	end

	local seat_index = 1

	for _, heister in ipairs(players) do
		if alive(heister.unit) then
			for i = seat_index, #ordered_seats do
				local seat = ordered_seats[i]
				seat_index = i + 1

				if (not alive(seat.occupant) or seat.occupant:brain()) and managers.player:server_enter_vehicle(vehicle, heister.peer_id, heister.unit, seat.name) then
					break
				end
			end
		end
	end

	for _, heister in ipairs(team_ai) do
		if alive(heister.unit) then
			for i = seat_index, #ordered_seats do
				local seat = ordered_seats[i]
				seat_index = seat_index + 1

				if not alive(seat.occupant) then
					local movement_ext = heister.unit:movement()
					local brain_ext = heister.unit:brain()
					local damage_ext = heister.unit:character_damage()

					vehicle_ext:_create_seat_SO(seat, true)

					local so_data = seat.drive_SO_data
					so_data.unit = heister.unit
					so_data.ride_objective.action.align_sync = true

					damage_ext:revive_instant()
					brain_ext:set_objective(so_data.ride_objective)
					managers.network:session():send_to_peers_synched("sync_ai_vehicle_action", "enter", vehicle, seat.name, heister.unit)

					movement_ext.vehicle_unit = vehicle
					movement_ext.vehicle_seat = seat

					movement_ext:set_position(seat.object:position())
					movement_ext:set_rotation(seat.object:rotation())
					movement_ext:action_request(so_data.ride_objective.action)

					break
				end
			end
		end
	end
end

function ElementVehicleBoarding:operation_disembark()
	local player = managers.player:player_unit()
	local movement_ext = player and player:movement()

	if not movement_ext or movement_ext:current_state_name() ~= "driving" then
		return
	end

	local should_leave = false
	local seat = nil

	if not self._values.vehicle then
		should_leave = true
	else
		local cur_vehicle_data = managers.player:get_vehicle()
		seat = cur_vehicle_data and cur_vehicle_data.seat

		if cur_vehicle_data and cur_vehicle_data.vehicle_unit == self:get_vehicle() then
			should_leave = true
		else
			Application:error("[ElementVehicleBoarding:operation_disembark] Local player couldn't find current vehicle?", tostring(self._values.vehicle), self:get_vehicle(), inspect(cur_vehicle_data))
		end
	end

	if not should_leave then
		return
	end

	local exit_data = nil
	local teleport_point_element = seat and self:get_teleport_element_by_seat(seat)

	if teleport_point_element then
		exit_data = teleport_point_element:values()
	end

	movement_ext:current_state():cb_leave(exit_data)
end

function ElementVehicleBoarding:save(data)
	data.enabled = self._values.enabled
end

function ElementVehicleBoarding:load(data)
	self:set_enabled(data.enabled)
end
