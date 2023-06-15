local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local tiny_font = tweak_data.menu.pd2_tiny_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size
local tiny_font_size = tweak_data.menu.pd2_tiny_font_size
LobbyCodeMenuComponent = LobbyCodeMenuComponent or class()

function LobbyCodeMenuComponent:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._panel = self._ws:panel():panel({
		w = 500,
		layer = 100,
		h = 100,
		y = 80
	})
	Global.lobby_code = Global.lobby_code or {}

	if managers.network.matchmake.lobby_handler then
		self._id_code = managers.network.matchmake.lobby_handler:id()

		self:create_hub_panel()

		local initial_state = nil

		if Global.lobby_code.state ~= nil then
			initial_state = Global.lobby_code.state
		else
			initial_state = not managers.user:get_setting("toggle_socialhub_hide_code")
		end

		self:set_code_hidden(initial_state)
	end
end

function LobbyCodeMenuComponent:close()
	self._ws:panel():remove(self._panel)
end

function LobbyCodeMenuComponent:create_hub_panel()
	local panel_w = 0
	local panel_h = 0
	self._lobby_id_text = self._panel:text({
		y = 5,
		name = "lobby_id_text",
		layer = 101,
		font = medium_font,
		font_size = medium_font_size,
		text = managers.localization:to_upper_text("menu_lobby_code") .. ": #",
		h = medium_font_size
	})

	ExtendedPanel.make_fine_text(self._lobby_id_text)

	self._id_text = self._panel:text({
		name = "title",
		align = "center",
		y = 5,
		layer = 101,
		font = medium_font,
		font_size = medium_font_size,
		text = self._id_code,
		x = self._lobby_id_text:right(),
		h = medium_font_size,
		color = Color(1, 0.5, 0.5, 0.5)
	})
	self._code_hidden_text = self._panel:text({
		name = "title",
		align = "center",
		y = 5,
		layer = 106,
		font = medium_font,
		font_size = medium_font_size,
		text = managers.localization:text("menu_lobby_code_hidden"),
		x = self._lobby_id_text:right(),
		h = medium_font_size,
		color = Color(1, 0.5, 0.5, 0.5)
	})
	local _, _, id_width, id_height = self._id_text:text_rect()
	local _, _, hidden_width, hidden_height = self._code_hidden_text:text_rect()
	local code_width = math.max(id_width, hidden_width)
	local code_height = math.max(id_height, hidden_height)

	self._id_text:set_size(code_width, code_height)
	self._code_hidden_text:set_size(code_width, code_height)

	self._code_hider = self._panel:rect({
		visible = false,
		alpha = 0.5,
		layer = 105,
		x = self._id_text:x(),
		y = self._id_text:y(),
		w = self._id_text:w(),
		h = self._id_text:h(),
		color = Color.black
	})
	self._button_panel = self._panel:panel({
		w = 32,
		h = 32,
		layer = 101
	})

	self._button_panel:set_x(self._id_text:right() + 5)
	self._button_panel:set_center_y(self._id_text:center_y())

	self._copy_icon = self._button_panel:bitmap({
		texture = "guis/dlcs/shub/textures/copy_icon",
		layer = 101,
		w = self._button_panel:w(),
		h = self._button_panel:h()
	})

	if not managers.menu:is_pc_controller() then
		self._copy_button_prompt = self._button_panel:text({
			name = "copy_button_prompt",
			layer = 101,
			font = medium_font,
			font_size = medium_font_size,
			x = self._copy_icon:right() + 2,
			text = utf8.to_upper(managers.localization:btn_macro("menu_unlocked_achievement"))
		})

		ExtendedPanel.make_fine_text(self._copy_button_prompt)
		self._copy_button_prompt:set_center_y(self._button_panel:center_y())
		self._button_panel:set_w(self._copy_button_prompt:right())
	end

	self._lower_panel = self._panel:panel({
		halign = "grow",
		name = "lower_panel",
		layer = 101,
		y = self._id_text:bottom() + 2,
		h = medium_font_size
	})
	self._hide_code_text = self._lower_panel:text({
		name = "hide_code_text",
		layer = 101,
		font = medium_font,
		font_size = medium_font_size,
		text = managers.localization:to_upper_text("menu_lobby_code_hide"),
		color = tweak_data.screen_colors.button_stage_3
	})

	ExtendedPanel.make_fine_text(self._hide_code_text)

	self._copied_alpha_timer = 0
	self._copied_code_text = self._panel:text({
		name = "copied_code_text",
		y = 32,
		layer = 101,
		font = small_font,
		font_size = small_font_size,
		text = managers.localization:text("menu_lobby_code_copied"),
		alpha = self._copied_alpha_timer
	})

	ExtendedPanel.make_fine_text(self._copied_code_text)
	self._copied_code_text:set_center_x(self._copy_icon:world_center_x())

	for _, child in ipairs(self._panel:children()) do
		if child:name() ~= "lower_panel" then
			panel_w = math.max(panel_w, child:right())
		end

		panel_h = math.max(panel_h, child:bottom())
	end

	self._panel:set_size(panel_w, panel_h)
end

function LobbyCodeMenuComponent:update(t, dt)
	if self._copied_alpha_timer and self._copied_alpha_timer > 0 then
		self._copied_alpha_timer = math.max(0, self._copied_alpha_timer - dt)

		if alive(self._copied_code_text) then
			self._copied_code_text:set_alpha(math.min(self._copied_alpha_timer, 1))
		end
	end
end

function LobbyCodeMenuComponent:set_header(header_string)
	if self._lobby_id_text then
		self._lobby_id_text:set_text(header_string)
	end
end

function LobbyCodeMenuComponent:set_code(code_string)
	if self._id_text then
		self._id_text:set_text(code_string)
	end
end

function LobbyCodeMenuComponent:set_code_hidden(hidden_state)
	Global.lobby_code.state = hidden_state

	self._code_hider:set_visible(hidden_state)
	self._id_text:set_visible(not hidden_state)
	self._code_hidden_text:set_visible(hidden_state)

	local key = ""

	if not managers.menu:is_pc_controller() then
		key = " " .. utf8.to_upper(managers.localization:btn_macro("menu_preview_item"))
	end

	self._hide_code_text:set_text(hidden_state and managers.localization:to_upper_text("menu_lobby_code_show") .. key or managers.localization:to_upper_text("menu_lobby_code_hide") .. key)
	ExtendedPanel.make_fine_text(self._hide_code_text)
	self._lower_panel:set_w(self._hide_code_text:right())
end

function LobbyCodeMenuComponent:copy_code()
	if managers.network.matchmake.lobby_handler then
		self._copied_alpha_timer = 2

		Application:set_clipboard(managers.network.matchmake.lobby_handler:id())
	end
end

function LobbyCodeMenuComponent:mouse_moved(x, y)
	if alive(self._button_panel) and self._button_panel:inside(x, y) then
		return true, "link"
	end

	if alive(self._lower_panel) then
		if self._lower_panel:inside(x, y) then
			self._hide_code_text:set_color(tweak_data.screen_colors.button_stage_2)

			return true, "link"
		else
			self._hide_code_text:set_color(tweak_data.screen_colors.button_stage_3)
		end
	end

	return false
end

function LobbyCodeMenuComponent:mouse_pressed(button, x, y)
	if alive(self._button_panel) and self._button_panel:inside(x, y) then
		self:copy_code()

		return true
	end

	if alive(self._lower_panel) and self._lower_panel:inside(x, y) then
		self:set_code_hidden(not self._code_hider:visible())

		return true
	end

	return false
end

function LobbyCodeMenuComponent:special_btn_pressed(button)
	if managers.menu:is_pc_controller() then
		return
	end

	if button == Idstring("menu_unlocked_achievement") then
		self:copy_code()
	elseif self._code_hider and button == Idstring("menu_preview_item") then
		self:set_code_hidden(not self._code_hider:visible())
	end
end

function LobbyCodeMenuComponent:panel()
	return self._panel
end
