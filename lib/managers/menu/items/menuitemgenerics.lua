local is_win32 = IS_PC
local NOT_WIN_32 = not is_win32
local medium_font = tweak_data.menu.pd2_medium_font
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font = tweak_data.menu.pd2_small_font
local small_font_size = tweak_data.menu.pd2_small_font_size

MenuGuiItem = MenuGuiItem or class()

function MenuGuiItem:init()
	self._selected = false
	self._input_components_set = {}
end

function MenuGuiItem:refresh()
	return
end

function MenuGuiItem:inside()
	return
end

function MenuGuiItem:is_selected()
	return self._selected
end

function MenuGuiItem:set_selected(selected, play_sound)
	if self._selected ~= selected then
		self._selected = selected

		self:refresh()

		if self._selected and play_sound ~= false then
			managers.menu_component:post_event("highlight")
		end
	end
end

function MenuGuiItem:is_active()
	return self._active
end

function MenuGuiItem:set_active(active, play_sound)
	if self._active ~= active then
		self._active = active

		self:refresh()
	end
end

function MenuGuiItem:trigger()
	managers.menu_component:post_event("menu_enter")
	self:refresh()
end

function MenuGuiItem:flash()
	return
end

function MenuGuiItem:allow_input()
	return self._active
end

function MenuGuiItem:add_input_component(component)
	self._input_components_set[component] = true

	if component.__input_parents then
		component.__input_parents[self] = true
	end
end

function MenuGuiItem:remove_input_component(component, dont_change_input_parents)
	self._input_components_set[component] = nil

	if not dont_change_input_parents then
		component.__input_parents[self] = nil
	end
end

function MenuGuiItem:clear_input_components()
	self._input_components_set = {}
end

function MenuGuiItem:mouse_clicked(o, button, x, y)
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_clicked", o, button, x, y)
end

function MenuGuiItem:mouse_pressed(button, x, y)
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_pressed", button, x, y)
end

function MenuGuiItem:mouse_released(button, x, y)
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_released", button, x, y)
end

function MenuGuiItem:mouse_moved(o, x, y)
	if not self:allow_input() then
		return
	end

	local hover, cursor_type

	for v, _ in pairs(self._input_components_set) do
		if v.mouse_moved and v:allow_input() then
			local res, t = v:mouse_moved(o, x, y)

			if res then
				hover = res
				cursor_type = t
			end
		end
	end

	return hover, cursor_type
end

function MenuGuiItem:mouse_wheel_up(x, y)
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_wheel_up", x, y)
end

function MenuGuiItem:mouse_wheel_down(x, y)
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "mouse_wheel_down", x, y)
end

function MenuGuiItem:move_up()
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "move_up")
end

function MenuGuiItem:move_down()
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "move_down")
end

function MenuGuiItem:move_left()
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "move_left")
end

function MenuGuiItem:move_right()
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "move_right")
end

function MenuGuiItem:confirm_pressed()
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "confirm_pressed")
end

function MenuGuiItem:special_btn_pressed(button)
	if not self:allow_input() then
		return
	end

	return ExtendedPanel.call_return_b_on_all_exists(self._input_components_set, "special_btn_pressed", button)
end

MenuGuiTabItem = MenuGuiTabItem or class(MenuGuiItem)
MenuGuiTabItem.FONT = medium_font
MenuGuiTabItem.FONT_SIZE = medium_font_size
MenuGuiTabItem.PAGE_PADDING = 15
MenuGuiTabItem.TEXT_PADDING_W = 15
MenuGuiTabItem.TEXT_PADDING_H = 10

function MenuGuiTabItem:init(index, title_id, page_item, gui, tab_x, tab_panel)
	MenuGuiTabItem.super.init(self)

	self._index = index
	self._name_id = title_id
	self._active = false
	self._selected = false
	self._gui = gui
	self._page_item = page_item

	local page_panel = tab_panel:panel({
		name = "Page" .. string.capitalize(tostring(title_id)),
		x = tab_x
	})
	local page_text = page_panel:text({
		align = "center",
		layer = 1,
		name = "PageText",
		vertical = "center",
		text = managers.localization:to_upper_text(title_id),
		font = self.FONT,
		font_size = self.FONT_SIZE,
		color = Color.black
	})
	local _, _, tw, th = page_text:text_rect()

	page_panel:set_size(tw + self.TEXT_PADDING_W, th + self.TEXT_PADDING_H)
	page_text:set_size(page_panel:size())

	local page_tab_bg = page_panel:bitmap({
		name = "PageTabBG",
		texture = "guis/textures/pd2/shared_tab_box",
		w = page_panel:w(),
		h = page_panel:h(),
		color = tweak_data.screen_colors.text
	})

	self._page_panel = page_panel

	self:refresh()
end

function MenuGuiTabItem:index()
	return self._index
end

function MenuGuiTabItem:page()
	return self._page_item
end

function MenuGuiTabItem:prev_page_position()
	return self._page_panel:left() - self.PAGE_PADDING
end

function MenuGuiTabItem:next_page_position()
	return self._page_panel:right() + self.PAGE_PADDING
end

function MenuGuiTabItem:set_active(active)
	self._active = active

	self:refresh()
end

function MenuGuiTabItem:is_active()
	return self._active
end

function MenuGuiTabItem:inside(x, y)
	return self._page_panel:inside(x, y)
end

function MenuGuiTabItem:refresh()
	if alive(self._page_panel) then
		self._page_panel:child("PageText"):set_blend_mode(self._active and "normal" or "add")
		self._page_panel:child("PageText"):set_color(self._active and Color.black or self._selected and tweak_data.screen_colors.button_stage_2 or tweak_data.screen_colors.button_stage_3)
		self._page_panel:child("PageTabBG"):set_visible(self._active)
	end
end

MenuGuiSmallTabItem = MenuGuiSmallTabItem or class(MenuGuiTabItem)
MenuGuiSmallTabItem.FONT = small_font
MenuGuiSmallTabItem.FONT_SIZE = small_font_size
MenuGuiSmallTabItem.PAGE_PADDING = 8
MenuGuiSmallTabItem.TEXT_PADDING_W = 15
MenuGuiSmallTabItem.TEXT_PADDING_H = 4
MenuGuiTabPage = MenuGuiTabPage or class(MenuGuiItem)

function MenuGuiTabPage:init(page_id, page_panel, fullscreen_panel, gui)
	MenuGuiTabPage.super.init(self)

	self._gui = gui
	self._active = false
	self._selected = 0
	self._page_name = page_id
	self._panel = ExtendedPanel:new(page_panel)
	self._info_panel = ExtendedPanel:new(gui:info_panel())

	self:add_input_component(self._panel)
	self:add_input_component(self._info_panel)

	if gui.event_listener then
		self._event_listener = gui:event_listener()

		self._event_listener:add(page_id, {
			"refresh"
		}, callback(self, self, "refresh"))
	end

	self:refresh()
end

function MenuGuiTabPage:update(t, dt)
	return
end

function MenuGuiTabPage:event_listener()
	return self._event_listener
end

function MenuGuiTabPage:refresh()
	self:panel():set_visible(self._active)
	self:info_panel():set_visible(self._active)
end

function MenuGuiTabPage:set_active(active)
	self._active = active

	self:refresh()

	return active
end

function MenuGuiTabPage:on_notify(tree, msg)
	return
end

function MenuGuiTabPage:name()
	return self._page_name
end

function MenuGuiTabPage:panel()
	return self._panel
end

function MenuGuiTabPage:info_panel()
	return self._info_panel
end

function MenuGuiTabPage:stack_panels(padding, panels)
	for idx, panel in ipairs(panels) do
		panel:set_left(0)
		panel:set_top(idx > 1 and panels[idx - 1]:bottom() + padding or 0)
	end
end

function MenuGuiTabItem:allow_input()
	return true
end

function MenuGuiTabPage:special_btn_pressed(button)
	if not self:is_active() or not self:allow_input() then
		return
	end

	local btn = self._controllers_mapping and self._controllers_mapping[button:key()]

	if btn and btn._callback and (not self._button_press_delay or self._button_press_delay < TimerManager:main():time()) then
		managers.menu_component:post_event("menu_enter")
		btn._callback()

		self._button_press_delay = TimerManager:main():time() + 0.2

		return
	end

	return MenuGuiTabPage.super.special_btn_pressed(self, button)
end

function MenuGuiTabPage:get_legend()
	return {
		"move",
		"back"
	}
end

MenuGuiButtonItem = MenuGuiButtonItem or class(MenuGuiItem)

function MenuGuiButtonItem:init(panel, data, x, priority)
	MenuGuiButtonItem.super.init(self, panel, data)

	self._callback = data.callback

	local prefix = not managers.menu:is_pc_controller() and data.btn and managers.localization:get_default_macro(data.btn) or ""
	local up_font_size = NOT_WIN_32 and RenderSettings.resolution.y < 720 and data.btn == "BTN_STICK_R" and 2 or 0

	self._panel = panel:panel({
		x = x,
		y = x + (priority - 1) * small_font_size,
		w = panel:w() - x * 2,
		h = medium_font_size
	})
	self._btn_text = self._panel:text({
		blend_mode = "add",
		layer = 1,
		name = "text",
		text = "",
		x = 0,
		align = data.align or "right",
		w = self._panel:w(),
		font_size = small_font_size + up_font_size,
		font = small_font,
		color = tweak_data.screen_colors.button_stage_3
	})

	self:set_text(prefix .. managers.localization:text(data.name_id))

	self._select_rect = self._panel:rect({
		alpha = 0.3,
		blend_mode = "add",
		halign = "scale",
		name = "select_rect",
		valign = "scale",
		color = tweak_data.screen_colors.button_stage_3
	})

	self._select_rect:set_visible(false)

	if not managers.menu:is_pc_controller() then
		self._btn_text:set_color(tweak_data.screen_colors.text)
	end
end

function MenuGuiButtonItem:set_text(text)
	self._btn_text:set_text(utf8.to_upper(text))

	local _, _, w, h = self._btn_text:text_rect()

	self._panel:set_h(h)
	self._btn_text:set_h(h)
end

function MenuGuiButtonItem:inside(x, y)
	return self._panel:inside(x, y)
end

function MenuGuiButtonItem:show()
	self._select_rect:set_visible(true)
end

function MenuGuiButtonItem:hide()
	self._select_rect:set_visible(false)
end

function MenuGuiButtonItem:visible()
	return self._select_rect:visible()
end

function MenuGuiButtonItem:refresh()
	if self._selected then
		self:show()
	else
		self:hide()
	end
end

function MenuGuiButtonItem:trigger()
	MenuGuiButtonItem.super.trigger(self)
	self._callback()
end
