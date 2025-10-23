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
CrimenetSearchLobbyCodeGui = CrimenetSearchLobbyCodeGui or class()

function CrimenetSearchLobbyCodeGui:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = ws
	self._panel = self._ws:panel():panel({
		layer = 50
	})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({
		layer = 50
	})
	self._main_panel = self._panel:panel({
		w = 650,
		h = 550,
		layer = 50
	})

	self._main_panel:set_center_x(self._panel:center_x())
	self._main_panel:set_center_y(self._panel:center_y())
	self._main_panel:rect({
		alpha = 0.75,
		color = Color.black
	})
	managers.menu_component:disable_crimenet()
	self:setup_panel()

	if managers.menu:is_pc_controller() then
		local back_button = self._panel:text({
			vertical = "bottom",
			name = "back_button",
			align = "right",
			blend_mode = "add",
			text = utf8.to_upper(managers.localization:text("menu_back")),
			h = tweak_data.menu.pd2_large_font_size,
			font_size = tweak_data.menu.pd2_large_font_size,
			font = tweak_data.menu.pd2_large_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		local _, _, w, h = back_button:text_rect()

		back_button:set_size(w, h)
		back_button:set_position(math.round(back_button:x()), math.round(back_button:y()))
		back_button:set_right(self._panel:w() - 10)
		back_button:set_bottom(self._panel:h() - 10)
		back_button:set_layer(101)

		local bg_back = self._fullscreen_panel:text({
			name = "TitleTextBg",
			vertical = "bottom",
			h = 90,
			align = "right",
			alpha = 0.4,
			blend_mode = "add",
			layer = 1,
			text = back_button:text(),
			font_size = tweak_data.menu.pd2_massive_font_size,
			font = tweak_data.menu.pd2_massive_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(back_button:world_right(), back_button:world_center_y())

		bg_back:set_world_right(x)
		bg_back:set_world_center_y(y)
		bg_back:move(13, -9)
		bg_back:set_layer(101)
		MenuBackdropGUI.animate_bg_text(self, bg_back)
	end
end

function CrimenetSearchLobbyCodeGui:close()
	self._ws:panel():remove(self._panel)
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
	managers.menu_component:enable_crimenet()
end

function CrimenetSearchLobbyCodeGui:searchbox_disconnect_callback(first, second, third)
	if string.len(first) == 32 then
		EpicSocialHub:get_lobby_info(first, callback(self, self, "on_search_lobby_fetched"))
	end
end

function CrimenetSearchLobbyCodeGui:on_search_lobby_fetched(first, second, third)
	if not first or not second then
		return
	end

	print("CrimenetSearchLobbyCodeGui:on_search_lobby_fetched", inspect(first), inspect(second), inspect(third))

	third.buttons = {
		{
			text = managers.localization:text("socialhub_lobby_action_join"),
			press_callback = callback(self, self, "on_user_lobby_pressed", "join")
		}
	}
	third.LOBBYID = first

	if self.search_item then
		self.scroll:remove_item(1)
		self.search_item:remove_self()

		self.search_item = nil
	end

	local owner_name = third.OWNER_NAME

	if owner_name and utf8.len(owner_name) <= NetworkManager.MAX_PEER_NAME_LENGTH then
		third.OWNER_NAME = managers.network:sanitize_peer_name(owner_name)
		self.search_item = SocialHubLobbyItem:new(self.scroll:canvas(), third)

		self.scroll:add_item(self.search_item, nil)
		self.scroll:place_items_in_order(nil, true, true)
		self.scroll:select_item(self.search_item)
	else
		Application:error("[CrimenetSearchLobbyCodeGui:on_search_lobby_fetched] found lobby failed filter checks")
	end
end

function CrimenetSearchLobbyCodeGui:on_user_lobby_pressed(first, second, third)
	print("CrimenetSearchLobbyCodeGui:on_user_lobby_pressed", inspect(first or "NO"), inspect(second or "NO"), inspect(third or "NO"))

	if not first or not second or managers.network.matchmake.lobby_handler and second == managers.network.matchmake.lobby_handler:id() then
		return
	end

	if first == "join" then
		EpicSocialHub:join_lobby(second)
	elseif first == "decline" then
		-- Nothing
	end
end

function CrimenetSearchLobbyCodeGui:setup_panel()
	self._searchbox = SearchBoxGuiObject:new(self._main_panel, self._ws, nil, {
		w = 292
	})

	self._searchbox:register_disconnect_callback(callback(self, self, "searchbox_disconnect_callback"))
	self._searchbox.panel:set_center_x(self._main_panel:w() / 2)
	self._searchbox.panel:set_y(15)

	self._paste_icon = self._main_panel:bitmap({
		texture = "guis/dlcs/shub/textures/paste_icon",
		y = 15,
		layer = 10,
		x = self._searchbox.panel:right() + 2,
		w = self._searchbox.panel:h(),
		h = self._searchbox.panel:h()
	})

	if not managers.menu:is_pc_controller() then
		self._paste_button_prompt = self._main_panel:text({
			name = "paste_button_prompt",
			layer = 1,
			font = tweak_data.menu.pd2_medium_font,
			font_size = tweak_data.menu.pd2_medium_font_size,
			text = utf8.to_upper(managers.localization:btn_macro("menu_respec_tree") .. " " .. managers.localization:text("menu_socialhub_controller_paste"))
		})

		ExtendedPanel.make_fine_text(self._paste_button_prompt)
		self._paste_button_prompt:set_x(self._searchbox.panel:x() - self._paste_button_prompt:w() - 2)
		self._paste_button_prompt:set_center_y(self._searchbox.panel:center_y())
	end

	self._scroll_panel = self._main_panel:panel({
		y = self._searchbox.panel:bottom() + 5
	})
	self.scroll = ScrollItemList:new(self._scroll_panel, {
		input_focus = true,
		scrollbar_padding = 0,
		padding = 0
	}, {
		layer = 100
	})
end

function CrimenetSearchLobbyCodeGui:mouse_moved(button, x, y)
	local back_button = self._panel:child("back_button")

	if back_button and back_button:inside(x, y) then
		if not self._back_highlight then
			self._back_highlight = true

			back_button:set_color(tweak_data.screen_colors.button_stage_2)
			managers.menu_component:post_event("highlight")
		end
	elseif self._back_highlight then
		self._back_highlight = false

		back_button:set_color(tweak_data.screen_colors.button_stage_3)
	end

	self.scroll:mouse_moved(button, x, y)

	if self._searchbox then
		local used, pointer = self._searchbox:mouse_moved(button, x, y)

		if used then
			return used, pointer
		end
	end
end

function CrimenetSearchLobbyCodeGui:mouse_pressed(button, x, y)
	local back_button = self._panel:child("back_button")

	if alive(back_button) and back_button:inside(x, y) and button == Idstring("0") then
		managers.menu:back()

		return
	end

	self.scroll:mouse_pressed(button, x, y)

	if self._searchbox and self._searchbox:mouse_pressed(button, x, y) then
		return
	end

	if self._paste_icon and self._paste_icon:inside(x, y) then
		self._searchbox:clear_text()
		self._searchbox:enter_text(nil, Application:get_clipboard())
		self:searchbox_disconnect_callback(Application:get_clipboard())
	end
end

function CrimenetSearchLobbyCodeGui:confirm_pressed()
	if self._searchbox:input_focus() then
		self._searchbox:disconnect_search_input()

		return
	end

	local item = self.scroll:selected_item()

	if item and item.confirm_pressed then
		item:confirm_pressed()
	end
end

function CrimenetSearchLobbyCodeGui:special_btn_pressed(button)
	if button == Idstring("menu_respec_tree") then
		self._searchbox:clear_text()
		self._searchbox:enter_text(nil, Application:get_clipboard())
		self:searchbox_disconnect_callback(Application:get_clipboard())
	end
end
