GenericDialogMenuNodeGui = GenericDialogMenuNodeGui or class(MenuNodeGui)
GenericDialogMenuNodeGui.FADE_IN_DURATION = 0.2
GenericDialogMenuNodeGui.FADE_OUT_DURATION = 0.2
GenericDialogMenuNodeGui.hybrid_menu_enabled = false

function GenericDialogMenuNodeGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 1
	parameters.to_upper = true
	parameters.hide_bg = false
	parameters._align_line_proportions = 0.5
	self.static_y = node:parameters().static_y
	self._node = node
	self._create_params = node:parameters().create_params[1]
	self._on_close_clbk = self._create_params and self._create_params.on_close or function()
		return
	end
	self._input_components_set = {}

	if self.hybrid_menu_enabled then
		self._hybrid_menu = HybridMenuHandler:new(self, node)

		self:add_input_component(self._hybrid_menu)
	end

	self:_early_setup()
	GenericDialogMenuNodeGui.super.init(self, node, layer, parameters)

	self._fullscreen_panel = managers.menu_component:fullscreen_ws():panel():panel({
		layer = 50
	})

	if not parameters.no_blur then
		self._blur_sheet = BlurSheet:new(self._fullscreen_panel, {
			alpha = 0,
			blur = 0.9,
			name = "bg_blur",
			color = Color.black:with_alpha(0.3)
		})
	end

	self.item_panel:set_alpha(0)

	self._fade_start_t = TimerManager:wall():time()

	self.item_panel:animate(callback(self, self, "animate_show"))
	self:_setup()
	self:_setup_size()
end

function GenericDialogMenuNodeGui:set_alpha(alpha)
	self.item_panel:set_alpha(alpha)

	if alive(self._blur_sheet) then
		self._blur_sheet:set_alpha(alpha)
	end

	if alive(self.box_panel) then
		self.box_panel:set_alpha(alpha)
	end
end

function GenericDialogMenuNodeGui:animate_show()
	local t = 0

	while t <= self.FADE_IN_DURATION do
		t = t + coroutine.yield()

		self:set_alpha(math.lerp(0, 1, t / self.FADE_IN_DURATION))
	end
end

function GenericDialogMenuNodeGui:animate_hide(clbk)
	local t = 0

	while t <= self.FADE_OUT_DURATION do
		t = t + coroutine.yield()

		self:set_alpha(math.lerp(1, 0, t / self.FADE_IN_DURATION))
	end

	clbk()
end

function GenericDialogMenuNodeGui:add_input_component(component)
	self._input_components_set[component] = true

	if component.__input_parents then
		component.__input_parents[self] = true
	end
end

function GenericDialogMenuNodeGui:remove_input_component(component, dont_change_input_parents)
	self._input_components_set[component] = nil

	if not dont_change_input_parents then
		component.__input_parents[self] = nil
	end
end

function GenericDialogMenuNodeGui:_early_setup()
	return
end

function GenericDialogMenuNodeGui:_setup()
	return
end

function GenericDialogMenuNodeGui:_setup_item_panel(safe_rect, res)
	GenericDialogMenuNodeGui.super._setup_item_panel(self, safe_rect, res)

	local max_layer = 10000
	local min_layer = 0
	local child_layer = 0

	for _, child in ipairs(self.item_panel:children()) do
		child:set_halign("right")

		child_layer = child:layer()

		if child_layer > 0 then
			min_layer = math.min(min_layer, child_layer)
		end

		max_layer = math.max(max_layer, child_layer)
	end

	self.item_panel:set_w(safe_rect.width * (1 - self._align_line_proportions))
	self.item_panel:set_center(self.item_panel:parent():w() / 2, self.item_panel:parent():h() / 2)

	local static_y = self.static_y and safe_rect.height * self.static_y

	if static_y and static_y < self.item_panel:y() then
		self.item_panel:set_y(static_y)
	end

	self.item_panel:set_position(math.round(self.item_panel:x()), math.round(self.item_panel:y()))
	ExtendedPanel.round_gui_object(self.item_panel)

	if alive(self.box_panel) then
		self.item_panel:parent():remove(self.box_panel)

		self.box_panel = nil
	end

	self.box_panel = self.item_panel:parent():panel()

	self.box_panel:set_x(self.item_panel:x())
	self.box_panel:set_w(self.item_panel:w())

	if self.item_panel:h() > self._align_data.panel:h() then
		self.box_panel:set_y(0)
		self.box_panel:set_h(self.item_panel:parent():h())
	else
		self.box_panel:set_y(self.item_panel:top())
		self.box_panel:set_h(self.item_panel:h())
	end

	self.box_panel:grow(20, 20)
	self.box_panel:move(-10, -10)
	self.box_panel:set_layer(51)

	self.boxgui = BoxGuiObject:new(self.box_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})

	self.boxgui:set_clipping(false)
	self.boxgui:set_layer(1000)
	self.box_panel:rect({
		layer = 10,
		rotation = 360,
		color = tweak_data.screen_colors.dark_bg
	})
	self._align_data.panel:set_left(self.box_panel:left())
	self._list_arrows.up:set_world_left(self._align_data.panel:world_left())
	self._list_arrows.up:set_world_top(self._align_data.panel:world_top() - 10)
	self._list_arrows.up:set_width(self.box_panel:width())
	self._list_arrows.up:set_rotation(360)
	self._list_arrows.up:set_layer(1050)
	self._list_arrows.down:set_world_left(self._align_data.panel:world_left())
	self._list_arrows.down:set_world_bottom(self._align_data.panel:world_bottom() + 10)
	self._list_arrows.down:set_width(self.box_panel:width())
	self._list_arrows.down:set_rotation(360)
	self._list_arrows.down:set_layer(1050)
	self:_set_topic_position()
end

function GenericDialogMenuNodeGui:_setup_item_panel_parent(safe_rect, shape)
	shape = shape or {}
	shape.x = shape.x or safe_rect.x
	shape.y = shape.y or safe_rect.y + 0
	shape.w = shape.w or safe_rect.width
	shape.h = shape.h or safe_rect.height - 0

	GenericDialogMenuNodeGui.super._setup_item_panel_parent(self, safe_rect, shape)
end

function GenericDialogMenuNodeGui:reload_item(item)
	GenericDialogMenuNodeGui.super.reload_item(self, item)

	local row_item = self:row_item(item)

	if row_item and alive(row_item.gui_panel) then
		row_item.gui_panel:set_halign("right")
		row_item.gui_panel:set_right(self.item_panel:w())
	end
end

function GenericDialogMenuNodeGui:close()
	self.item_panel:animate(callback(self, self, "animate_hide", function()
		GenericDialogMenuNodeGui.super.close(self)
		self._fullscreen_panel:parent():remove(self._fullscreen_panel)

		self._fullscreen_panel = nil

		self._node:clean_items()
	end))
	self._on_close_clbk(self:close_return_values())
end

function GenericDialogMenuNodeGui:close_return_values()
	return
end

function GenericDialogMenuNodeGui:_extra_height()
	return 0
end

function GenericDialogMenuNodeGui:_item_panel_height()
	return GenericDialogMenuNodeGui.super._item_panel_height(self) + self:_extra_height()
end

function GenericDialogMenuNodeGui:mouse_moved(o, x, y)
	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_moved", o, x, y)
end

function GenericDialogMenuNodeGui:mouse_released(button, x, y)
	return ExtendedPanel.call_on_all_exists(self._input_components_set, "mouse_released", button, x, y)
end

function GenericDialogMenuNodeGui:mouse_clicked(button, x, y)
	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_clicked", nil, button, x, y)
end

function GenericDialogMenuNodeGui:mouse_double_click(button, x, y)
	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_double_click", nil, button, x, y)
end

function GenericDialogMenuNodeGui:move_up()
	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "move_up")
end

function GenericDialogMenuNodeGui:move_down()
	if self._hybrid_menu then
		self._hybrid_menu:move_down()

		return true
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "move_down")
end

function GenericDialogMenuNodeGui:move_left()
	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "move_left")
end

function GenericDialogMenuNodeGui:move_right()
	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "move_right")
end

function GenericDialogMenuNodeGui:confirm_pressed()
	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "confirm_pressed")
end

function GenericDialogMenuNodeGui:special_btn_pressed(button)
	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "special_btn_pressed", button)
end

function GenericDialogMenuNodeGui:mouse_pressed(button, x, y)
	if button == Idstring("mouse wheel down") then
		return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_wheel_down", x, y)
	elseif button == Idstring("mouse wheel up") then
		return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_wheel_up", x, y)
	else
		return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_pressed", button, x, y)
	end
end

function GenericDialogMenuNodeGui:_align_marker(row_item)
	self._marker_data.marker:show()
	GenericDialogMenuNodeGui.super._align_marker(self, row_item)

	if row_item.item:parameters().pd2_corner then
		self._marker_data.marker:set_world_right(row_item.gui_panel:world_right())

		return
	end

	self._marker_data.marker:set_world_right(self.item_panel:world_right())
end

function GenericDialogMenuNodeGui:input_focus()
	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "input_focus")
end
