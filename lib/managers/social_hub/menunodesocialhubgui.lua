require("lib/managers/menu/renderers/MenuNodeBaseGui")
require("lib/managers/menu/MenuInitiatorBase")
require("lib/managers/menu/ExtendedUiElemets")
require("lib/managers/social_hub/SocialHubPanels")
require("lib/managers/social_hub/SocialHubTabs")

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
MenuSocialHubInitiator = MenuSocialHubInitiator or class(MenuInitiatorBase)

function MenuSocialHubInitiator:modify_node(original_node, node_data)
	return original_node
end

function MenuSocialHubInitiator:refresh_node(original_node)
	return original_node
end

MenuNodeSocialHubGui = MenuNodeSocialHubGui or class(MenuNodeBaseGui)

function MenuNodeSocialHubGui:init(node, layer, parameters)
	MenuNodeSocialHubGui.super.init(self, node, layer, parameters)
end

SocialHubGui = SocialHubGui or class(MenuGuiComponentGeneric)

function SocialHubGui:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._panel = self._ws:panel():panel({
		layer = 100
	})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()

	if SystemInfo:distribution() == Idstring("STEAM") then
		managers.socialhub:fetch_steam_friends(callback(self, self, "update_setup_pre_progress", "platform_friends"))
	elseif SystemInfo:distribution() == Idstring("EPIC") then
		managers.socialhub:fetch_epic_friends(callback(self, self, "update_setup_pre_progress", "platform_friends"))
	end

	managers.socialhub:fetch_users(callback(self, self, "update_setup_pre_progress", "friends"))
end

function SocialHubGui:update_setup_pre_progress(progress_id)
	if self._initialized == true or not self:socialhub_valid() then
		return
	end

	if progress_id == "platform_friends" then
		self._platform_friends_loaded = true
	elseif progress_id == "friends" then
		self._friends_loaded = true
	end

	if not self._initialized and self._platform_friends_loaded and self._friends_loaded then
		self:setup()
	end
end

function SocialHubGui:setup()
	self._initialized = true
	self._categories_runtime = {
		{
			name_id = "socialhub_tab_friends",
			components = {}
		},
		{
			name_id = "socialhub_tab_invites",
			components = {}
		},
		{
			name_id = "socialhub_tab_blocked",
			components = {}
		}
	}
	self._main_panel = self._panel:panel({
		w = 650,
		h = 550,
		layer = 100
	})

	self._main_panel:set_center_x(self._panel:center_x())
	self._main_panel:set_center_y(self._panel:center_y())
	self._main_panel:rect({
		alpha = 0.5,
		color = Color.black,
		w = self._main_panel:w() - 30,
		y = medium_font_size,
		h = self._main_panel:h() - medium_font_size
	})

	self._tab_panel = self._main_panel:panel({
		h = 50
	})
	self._content_panel_list = {}
	local friend_panel = self._main_panel:panel({
		y = 50,
		visible = false,
		h = self._main_panel:h() - 50
	})

	table.insert(self._content_panel_list, friend_panel)

	local invite_panel = self._main_panel:panel({
		y = 50,
		visible = false,
		h = self._main_panel:h() - 50
	})

	table.insert(self._content_panel_list, invite_panel)

	local blocked_panel = self._main_panel:panel({
		y = 50,
		visible = false,
		h = self._main_panel:h() - 50
	})

	table.insert(self._content_panel_list, blocked_panel)
	self:create_tab_panel()

	local friend_tab = SocialHubFriendTab:new(friend_panel)
	self._categories_runtime[1].tab = friend_tab
	local invite_tab = SocialHubInviteTab:new(invite_panel, self._ws)
	self._categories_runtime[2].tab = invite_tab
	local blocked_tab = SocialHubBlockedTab:new(blocked_panel)
	self._categories_runtime[3].tab = blocked_tab

	friend_panel:set_visible(true)

	self._active_panel = 1
end

function SocialHubGui:close()
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
	self._ws:panel():remove(self._panel)
end

function SocialHubGui:socialhub_valid()
	return alive(self._panel)
end

function SocialHubGui:create_tab_panel()
	local x_position = 0

	for index, data in ipairs(self._categories_runtime) do
		local tab_item = TabItem:new(self._tab_panel, {
			layer = 100,
			x = x_position + 5
		}, {
			name_id = data.name_id,
			callback = callback(self, self, "on_tab_item_pressed", index)
		})
		x_position = tab_item:bounds().right
		self._categories_runtime[index].tab_item = tab_item
	end

	self._categories_runtime[1].tab_item:selected_changed(true)
end

function SocialHubGui:on_tab_item_pressed(index)
	if not self:socialhub_valid() then
		return
	end

	for i, item in ipairs(self._categories_runtime) do
		local tab_item = item.tab_item

		if i == index then
			tab_item:selected_changed(true)
			self._content_panel_list[i]:set_visible(true)
			item.tab:on_selected()
		else
			tab_item:selected_changed(false)
			self._content_panel_list[i]:set_visible(false)
		end
	end

	self._active_panel = index
end

function SocialHubGui:reset_tab_by_name(tab_name)
	local index = tab_name == "friend" and 1 or tab_name == "invite" and 2 or tab_name == "blocked" and 3 or -1

	if index >= 1 then
		self:reset_tab_by_index(index)
	end
end

function SocialHubGui:reset_tab_by_index(index)
	if self._initialized then
		self._categories_runtime[index].tab:reset_tab()
	end
end

function SocialHubGui:mouse_moved(o, x, y)
	local used = nil
	local pointer = "arrow"
	local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

	if not active_tab then
		return
	end

	if active_tab and active_tab.mouse_moved then
		local hover, cursor = active_tab:mouse_moved(o, x, y)
		used = hover or used
		pointer = cursor or pointer

		if used then
			return used, pointer
		end
	end

	for index, item in ipairs(self._categories_runtime) do
		local tab_item = item.tab_item

		if alive(tab_item) then
			if tab_item:inside(x, y) then
				tab_item:hovered(true)

				if not tab_item:get_active_state() then
					pointer = "link"
					used = true
				end
			else
				tab_item:hovered(false)
			end
		end
	end

	return used, pointer
end

function SocialHubGui:mouse_pressed(button, x, y)
	local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

	if not active_tab then
		return false
	end

	if active_tab and active_tab.mouse_pressed then
		active_tab:mouse_pressed(button, x, y)
	end

	for index, item in ipairs(self._categories_runtime) do
		local tab_item = item.tab_item

		if alive(tab_item) and tab_item:inside(x, y) and tab_item.pressed then
			tab_item:pressed()
		end
	end
end

function SocialHubGui:mouse_released(o, button, x, y)
	local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

	if not active_tab then
		return false
	end

	if active_tab and active_tab.mouse_released then
		active_tab:mouse_released(o, button, x, y)
	end
end

function SocialHubGui:special_btn_pressed(button)
	if button == Idstring("next_page") then
		self._active_panel = (self._active_panel + 1 - 1) % #self._categories_runtime + 1

		self:on_tab_item_pressed(self._active_panel)
	elseif button == Idstring("previous_page") then
		self._active_panel = (self._active_panel - 1 - 1) % #self._categories_runtime + 1

		self:on_tab_item_pressed(self._active_panel)
	else
		local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

		if not active_tab then
			return false
		end

		if active_tab and active_tab.special_btn_pressed then
			active_tab:special_btn_pressed(button)
		end
	end
end

function SocialHubGui:mouse_wheel_up(x, y)
	if self._tab_panel and self._tab_panel:inside(x, y) then
		self._active_panel = (self._active_panel - 1 - 1) % #self._categories_runtime + 1

		self:on_tab_item_pressed(self._active_panel)
	else
		local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

		if not active_tab then
			return false
		end

		if active_tab and active_tab.mouse_wheel_up then
			active_tab:mouse_wheel_up(x, y)
		end
	end
end

function SocialHubGui:mouse_wheel_down(x, y)
	if self._tab_panel and self._tab_panel:inside(x, y) then
		self._active_panel = (self._active_panel + 1 - 1) % #self._categories_runtime + 1

		self:on_tab_item_pressed(self._active_panel)
	else
		local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

		if not active_tab then
			return false
		end

		if active_tab and active_tab.mouse_wheel_down then
			active_tab:mouse_wheel_down(x, y)
		end
	end
end

function SocialHubGui:move_up()
	local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

	if not active_tab then
		return false
	end

	if active_tab and active_tab.move_up then
		active_tab:move_up()
	end
end

function SocialHubGui:move_down()
	local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

	if not active_tab then
		return false
	end

	if active_tab and active_tab.move_down then
		active_tab:move_down()
	end
end

function SocialHubGui:move_left()
	local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

	if not active_tab then
		return false
	end

	if active_tab and active_tab.move_left then
		active_tab:move_left()
	end
end

function SocialHubGui:move_right()
	local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

	if not active_tab then
		return false
	end

	if active_tab and active_tab.move_right then
		active_tab:move_right()
	end
end

function SocialHubGui:confirm_pressed()
	local active_tab = self._categories_runtime and self._categories_runtime[self._active_panel].tab or false

	if not active_tab then
		return false
	end

	if active_tab and active_tab.confirm_pressed then
		active_tab:confirm_pressed()
	end
end
