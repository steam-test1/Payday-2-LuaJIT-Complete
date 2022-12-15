PreplanningHelper = PreplanningHelper or class()

function PreplanningHelper:init()
end

function PreplanningHelper:show_ews()
	if not self._main_frame then
		self:create_ews()
	end
end

function PreplanningHelper:create_ews()
	self:close_ews()

	self._main_frame = EWS:Frame("Preplanning helper", Vector3(250, 0, 0), Vector3(420, 400, 0), "FRAME_FLOAT_ON_PARENT,DEFAULT_FRAME_STYLE,FULL_REPAINT_ON_RESIZE", Global.frame)

	self._main_frame:set_icon(CoreEws.image_path("world_editor/icon_creator_16x16.png"))

	local main_box = EWS:BoxSizer("HORIZONTAL")
	self._main_panel = EWS:Panel(self._main_frame, "", "FULL_REPAINT_ON_RESIZE")
	self._outText = EWS:TextCtrl(self._main_panel, "Select a unit", "", "NO_BORDER,TE_RICH,TE_MULTILINE,TE_READONLY")
	local btn_sizer = EWS:StaticBoxSizer(self._main_panel, "HORIZONTAL", "")
	local setupCam_btn = EWS:Button(self._main_panel, "Setup Camera", "", "BU_EXACTFIT,NO_BORDER")

	btn_sizer:add(setupCam_btn, 0, 5, "RIGHT,TOP,BOTTOM")
	setupCam_btn:connect("EVT_COMMAND_BUTTON_CLICKED", callback(self, self, "setup_camera"), false)

	local main_panel_sizer = EWS:BoxSizer("VERTICAL")

	main_panel_sizer:add(self._outText, 1, 2, "ALIGN_CENTER_VERTICAL,RIGHT,EXPAND")
	main_panel_sizer:add(btn_sizer, 0, 0, "EXPAND")
	self._main_panel:set_sizer(main_panel_sizer)
	main_box:add(self._main_panel, 1, 0, "EXPAND")
	self._main_frame:connect("", "EVT_CLOSE_WINDOW", callback(self, self, "close_ews"), "")
	self._main_frame:set_sizer(main_box)
	self._main_frame:set_visible(true)
end

function PreplanningHelper:close_ews()
	if self._main_frame then
		self._main_frame:destroy()

		self._main_frame = nil
	end
end

function PreplanningHelper:deleted_unit(unit)
	self._unit = nil

	self._outText:set_value("Select a preplanning unit")
end

function PreplanningHelper:on_selected_unit(unit)
	if unit == nil then
		self._unit = nil

		self._outText:set_value("Select a preplanning unit")

		return
	end

	local ud = unit:unit_data()

	if ud.only_exists_in_editor == true then
		local me = unit:mission_element()

		if me ~= nil then
			local hed = me._hed
			self._unit = unit
			self._pos = self._unit:position()
			self._width = hed.width
			self._depth = hed.depth
			self._height = hed.height
			local x1 = self._pos.x - self._width / 2
			local x2 = self._pos.x + self._width / 2
			local y1 = self._pos.y - self._depth / 2
			local y2 = self._pos.y + self._depth / 2
			local out = "x1 = " .. x1 .. ",\n"
			out = out .. "y1 = " .. y1 .. ",\n"
			out = out .. "x2 = " .. x2 .. ",\n"
			out = out .. "y2 = " .. y2 .. ",\n"

			if self._depth ~= self._width then
				out = out .. "WARNING : BOX IS NOT SQUARE !!!"
			end

			self._outText:set_value(out)
		else
			self._unit = nil

			self._outText:set_value("Select a preplanning unit")
		end
	else
		self._unit = nil

		self._outText:set_value("Select a preplanning unit")
	end
end

function PreplanningHelper:setup_camera()
	if self._unit == nil then
		self._outText:set_value("Select a preplanning unit")

		return
	end

	local me = self._unit:mission_element()
	local hed = me._hed
	self._pos = self._unit:position()
	self._width = hed.width
	self._depth = hed.depth
	self._height = hed.height
	local x1 = self._pos.x - self._width / 2
	local x2 = self._pos.x + self._width / 2
	local y1 = self._pos.y - self._depth / 2
	local y2 = self._pos.y + self._depth / 2
	local out = "x1 = " .. x1 .. ",\n"
	out = out .. "y1 = " .. y1 .. ",\n"
	out = out .. "x2 = " .. x2 .. ",\n"
	out = out .. "y2 = " .. y2 .. ",\n"

	if self._depth ~= self._width then
		out = out .. "WARNING : BOX IS NOT SQUARE !!!"
	end

	self._outText:set_value(out)

	local camera_position = self._pos

	mvector3.add(camera_position, Vector3(0, 0, self._height / 2 + 100))

	local res = Application:screen_resolution()
	local ratioX = self._width / (res.x * 0.9)
	local ratioY = self._depth / (res.y * 0.9)

	managers.editor:set_camera(camera_position, Rotation(0, -90, 0))

	managers.editor._orthographic = true
	managers.editor._camera_controller._mul = math.max(ratioX, ratioY)

	managers.editor._camera_controller:toggle_orthographic(true)
	managers.editor:set_camera(camera_position, Rotation(math.DOWN, Vector3(0, 1, 0)))
end
