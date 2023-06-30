VehicleBoardingElement = VehicleBoardingElement or class(MissionElement)
VehicleBoardingElement.SAVE_UNIT_POSITION = false
VehicleBoardingElement.SAVE_UNIT_ROTATION = false

function VehicleBoardingElement:init(unit)
	VehicleBoardingElement.super.init(self, unit)

	self._hed.vehicle = nil
	self._hed.operation = "embark"
	self._hed.teleport_points = {}

	table.insert(self._save_values, "vehicle")
	table.insert(self._save_values, "operation")
	table.insert(self._save_values, "seats_order")
	table.insert(self._save_values, "teleport_points")
end

function VehicleBoardingElement:update_editing()
end

function VehicleBoardingElement:add_element()
	local ray = managers.editor:unit_by_raycast({
		mask = managers.slot:get_mask("vehicles")
	})

	if ray and ray.unit then
		local element_data = ray.unit:mission_element_data()
		local is_vehicle = ray.unit:vehicle_driving() ~= nil

		if not is_vehicle then
			return
		end

		local id = ray.unit:unit_data().unit_id

		if is_vehicle then
			if self._hed.vehicle == id then
				self:set_vehicle(nil)
			else
				self:set_vehicle(ray.unit)
			end
		end

		return
	end

	if not self._hed.seats_order then
		return
	end

	local ray = managers.editor:unit_by_raycast({
		ray_type = "editor",
		mask = 10
	})

	if ray and ray.unit and string.find(ray.unit:name():s(), "point_teleport_player", 1, true) then
		local id = ray.unit:unit_data().unit_id
		local seat_id = table.get_key(self._hed.teleport_points, id)
		local select_index = self._teleport_points_list:selected_index()

		if seat_id then
			self._hed.teleport_points[seat_id] = nil
		else
			seat_id = select_index + 1
			select_index = seat_id

			if seat_id and seat_id > 0 then
				self._hed.teleport_points[seat_id] = id
			end
		end

		if select_index and select_index >= #self._hed.seats_order then
			select_index = 0
		end

		self:_update_gui()
		self._teleport_points_list:select_index(select_index)
	end
end

function VehicleBoardingElement:add_triggers(vc)
	vc:add_trigger(Idstring("lmb"), callback(self, self, "add_element"))
end

function VehicleBoardingElement:set_vehicle(vehicle_unit)
	if self._vehicle_unit == vehicle_unit then
		return
	end

	self._vehicle_unit = vehicle_unit
	self._hed.vehicle = vehicle_unit and vehicle_unit:unit_data().unit_id
	self._hed.seats_order = nil

	self:_update_gui()
end

function VehicleBoardingElement:vehicle_unit()
	if not self._vehicle_unit or self._vehicle_unit:unit_data().unit_id ~= self._hed.vehicle then
		self._vehicle_unit = managers.editor:unit_with_id(self._hed.vehicle)
	end

	return self._vehicle_unit
end

function VehicleBoardingElement:draw_links(t, dt, selected_unit, all_units)
	VehicleBoardingElement.super.draw_links(self, t, dt, selected_unit)

	local vehicle_unit = self._hed.vehicle and self:vehicle_unit()

	if vehicle_unit then
		local draw = not selected_unit or vehicle_unit == selected_unit or self._unit == selected_unit

		if draw then
			self:_draw_link({
				g = 0.75,
				b = 0,
				r = 0,
				from_unit = self._unit,
				to_unit = vehicle_unit
			})
		end

		for seat_id, point_id in pairs(self._hed.teleport_points) do
			local teleport_unit = managers.editor:unit_with_id(point_id)
			local draw = teleport_unit and (not selected_unit or teleport_unit == selected_unit or self._unit == selected_unit)

			if draw then
				self:_draw_link({
					g = 0.15,
					b = 0.75,
					r = 0,
					from_unit = self._unit,
					to_unit = teleport_unit
				})

				local seat_name = self._hed.seats_order and self._hed.seats_order[seat_id]

				if seat_name then
					local exit_object = vehicle_unit:get_object(Idstring(VehicleDrivingExt.EXIT_PREFIX .. seat_name))

					if exit_object then
						Application:draw_arrow(exit_object:position(), teleport_unit:position(), 0, 0.45, 0.45, 0.11)
					end
				end
			end
		end
	end
end

function VehicleBoardingElement:_update_gui()
	local vehicle_unit = self:vehicle_unit()
	local seats_interface_enabled = not not vehicle_unit

	self._seats_list:set_enabled(seats_interface_enabled)
	self._move_up_button:set_enabled(seats_interface_enabled)
	self._move_down_button:set_enabled(seats_interface_enabled)
	self:_populate_seats_list()
end

function VehicleBoardingElement:_populate_seats_list()
	self._seats_list:clear()

	local vehicle = self:vehicle_unit()

	if not vehicle then
		return
	end

	if not self._hed.seats_order then
		self._hed.seats_order = {}

		for seat_name, _ in pairs(vehicle:vehicle_driving()._seats) do
			table.insert(self._hed.seats_order, seat_name)
		end
	end

	for i, seat_name in ipairs(self._hed.seats_order) do
		self._seats_list:append(seat_name)
	end

	self:_populate_teleport_points_list()
end

function VehicleBoardingElement:_move_up_clicked(button, event)
	self:_move_seat_in_direction("up")
end

function VehicleBoardingElement:_move_down_clicked(button, event)
	self:_move_seat_in_direction("down")
end

function VehicleBoardingElement:_move_seat_in_direction(direction)
	local seat_index = self._seats_list:selected_index() + 1
	local swap_index = nil

	if direction == "up" then
		swap_index = seat_index - 1

		if seat_index <= 1 then
			return
		end
	elseif direction == "down" then
		swap_index = seat_index + 1

		if seat_index > #self._hed.seats_order - 1 then
			return
		end
	end

	local temp = self._hed.seats_order[swap_index]
	self._hed.seats_order[swap_index] = self._hed.seats_order[seat_index]
	self._hed.seats_order[seat_index] = temp

	self:_populate_seats_list()
	self._seats_list:select_index(swap_index - 1)
end

function VehicleBoardingElement:_populate_teleport_points_list()
	self._teleport_points_list:clear()

	if not self._hed.seats_order then
		return
	end

	local first_empty_slot = nil

	for seat_id = 1, #self._hed.seats_order do
		local point_id = self._hed.teleport_points[seat_id]
		local name_id = ""

		if point_id then
			local unit = managers.editor:unit_with_id(point_id)
			name_id = unit and unit:unit_data() and unit:unit_data().name_id or point_id
		else
			first_empty_slot = first_empty_slot or seat_id
		end

		local s = string.format("%s (%s)", tostring(name_id), tostring(self._hed.seats_order[seat_id]))

		self._teleport_points_list:append(s)
	end

	if first_empty_slot then
		self._teleport_points_list:select_index(first_empty_slot - 1)
	end
end

function VehicleBoardingElement:_teleport_remove_clicked(button, event)
	local seat_id = self._teleport_points_list:selected_index() + 1
	self._hed.teleport_points[seat_id] = nil

	self:_populate_teleport_points_list()
	self._teleport_points_list:select_index(seat_id - 1)
end

function VehicleBoardingElement:_teleport_move_up_clicked(button, event)
	self:_move_teleport_in_direction("up")
end

function VehicleBoardingElement:_teleport_move_down_clicked(button, event)
	self:_move_teleport_in_direction("down")
end

function VehicleBoardingElement:_select_teleport_doubleclicked(...)
	local seat_id = self._teleport_points_list:selected_index() + 1
	local point_id = self._hed.teleport_points[seat_id]
	local unit = managers.editor:unit_with_id(point_id)

	if unit then
		managers.editor:select_unit(unit)
	end
end

function VehicleBoardingElement:_move_teleport_in_direction(direction)
	if not self._hed.seats_order then
		return
	end

	local seat_id = self._teleport_points_list:selected_index() + 1
	local swap_index = nil

	if direction == "up" then
		swap_index = seat_id - 1

		if seat_id <= 1 then
			return
		end
	elseif direction == "down" then
		swap_index = seat_id + 1

		if seat_id > #self._hed.seats_order - 1 then
			return
		end
	end

	local temp = self._hed.teleport_points[swap_index]
	self._hed.teleport_points[swap_index] = self._hed.teleport_points[seat_id]
	self._hed.teleport_points[seat_id] = temp

	self:_populate_teleport_points_list()
	self._teleport_points_list:select_index(swap_index - 1)
end

function VehicleBoardingElement:_build_panel(panel, panel_sizer)
	self:_create_panel()

	panel = panel or self._panel
	panel_sizer = panel_sizer or self._panel_sizer
	local names = nil

	self:_build_value_combobox(panel, panel_sizer, "operation", {
		"embark",
		"disembark"
	}, "Specify wether heisters will enter or exit the vehicle")

	local seats_label = EWS:StaticText(panel, "")

	seats_label:set_label("Seat priority:")
	panel_sizer:add(seats_label, 0, 0, "EXPAND")

	self._seats_list = EWS:ListBox(panel, "", "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB")

	panel_sizer:add(self._seats_list, 0, 0, "EXPAND")

	self._move_up_button = EWS:Button(panel, "Move Up")

	self._move_up_button:connect("EVT_COMMAND_BUTTON_CLICKED", callback(self, self, "_move_up_clicked"), nil)
	panel_sizer:add(self._move_up_button, 0, 0, "EXPAND")

	self._move_down_button = EWS:Button(panel, "Move Down")

	self._move_down_button:connect("EVT_COMMAND_BUTTON_CLICKED", callback(self, self, "_move_down_clicked"), nil)
	panel_sizer:add(self._move_down_button, 0, 0, "EXPAND")

	local teleport_points_label = EWS:StaticText(panel, "")

	teleport_points_label:set_label("Optional disembark teleport points (instead of using vehicle exit positions):")
	panel_sizer:add(teleport_points_label, 0, 0, "EXPAND")

	self._teleport_points_list = EWS:ListBox(panel, "", "LB_SINGLE,LB_HSCROLL,LB_NEEDED_SB")

	self._teleport_points_list:connect("EVT_COMMAND_LISTBOX_DOUBLECLICKED", callback(self, self, "_select_teleport_doubleclicked"), nil)
	panel_sizer:add(self._teleport_points_list, 0, 0, "EXPAND")

	self._teleport_move_up_button = EWS:Button(panel, "Move Up")

	self._teleport_move_up_button:connect("EVT_COMMAND_BUTTON_CLICKED", callback(self, self, "_teleport_move_up_clicked"), nil)
	panel_sizer:add(self._teleport_move_up_button, 0, 0, "EXPAND")

	self._teleport_move_down_button = EWS:Button(panel, "Move Down")

	self._teleport_move_down_button:connect("EVT_COMMAND_BUTTON_CLICKED", callback(self, self, "_teleport_move_down_clicked"), nil)
	panel_sizer:add(self._teleport_move_down_button, 0, 0, "EXPAND")

	self._teleport_remove_button = EWS:Button(panel, "Remove")

	self._teleport_remove_button:connect("EVT_COMMAND_BUTTON_CLICKED", callback(self, self, "_teleport_remove_clicked"), nil)
	panel_sizer:add(self._teleport_remove_button, 0, 0, "EXPAND")
	self:_update_gui()
end
