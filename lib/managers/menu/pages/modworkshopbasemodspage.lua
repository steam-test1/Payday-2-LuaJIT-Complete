local large_font = tweak_data.menu.pd2_large_font
local large_font_size = tweak_data.menu.pd2_large_font_size
local massive_font = tweak_data.menu.pd2_massive_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size

ModWorkshopBaseModsPage = ModWorkshopBaseModsPage or class(MenuGuiTabPage)
ModWorkshopBaseModsPage.PAGINATION_BUTTONS = 7
ModWorkshopBaseModsPage.MOD_TYPES = {
	"mod_overrides"
}
ModWorkshopBaseModsPage.BLOCKED_TAGS = {
	56,
	4,
	46,
	50,
	11,
	34
}
ModWorkshopBaseModsPage.BLOCKED_CATEGORIES = {
	[4] = true,
	[448] = true,
	[462] = true,
	[470] = true,
	[502] = true,
	[528] = true,
	[544] = true,
	[688] = true,
	[774] = true,
	[775] = true
}
ModWorkshopBaseModsPage.MODS_LIMIT = 30
ModWorkshopBaseModsPage.COLS = 3

function ModWorkshopBaseModsPage:init(page_id, page_panel, fullscreen_panel, gui)
	ModWorkshopBaseModsPage.super.init(self, page_id, page_panel, fullscreen_panel, gui)

	self._mod_items = {}
	self._page = 1

	self:_create_mod_list()
	self:_create_right_side_placer()
	self:_create_right_side()
	self:_setup()
	self:search_mods()
end

function ModWorkshopBaseModsPage:_setup()
	self:_create_mod_list()
	self:_create_right_side_placer()
	self:_create_right_side()
end

function ModWorkshopBaseModsPage:close()
	self:remove_self()

	if alive(self._blur_ws) then
		self._blur:parent():remove(self._blur)
		managers.gui_data:destroy_workspace(self._blur_ws)

		self._blur_ws = nil
	end
end

function ModWorkshopBaseModsPage:_create_mod_list()
	self._mods_grid = GridScrollItemList:new(self._panel, {
		bar_minimum_size = 16,
		click_selection = true,
		input = true,
		input_focus = true,
		padding = 0,
		scroll_speed = 75,
		scrollbar_padding = 4,
		on_selected_callback = callback(self, self, "on_selected_mod")
	}, {
		border_y = 4,
		cols = self.COLS
	})
	self._loading = LoadingIconGuiObject:new(self._panel)
end

function ModWorkshopBaseModsPage:_create_right_side_placer()
	self._right_side_placer = MemoPlacer:new(self._info_panel, {
		padding_y = 4
	})
end

function ModWorkshopBaseModsPage:_create_right_side()
	self._mod_details = self._right_side_placer:add_bottom(ModWorkshopModDetailsGui:new(self._info_panel))
	self._buttons = self._right_side_placer:add_bottom(ListGrowPanel:new(self._info_panel, {
		border_y = 8,
		input = true,
		name = "buttons_panel",
		padding_x = 8,
		fixed_w = self._info_panel:w()
	}))

	local function action_button(name, func)
		self["_" .. name .. "_btn"] = self._buttons:add_item(TextCompositeButton:new(self._buttons, {
			text = managers.localization:to_upper_text("menu_mws_" .. name),
			trigger_func = func
		}, {
			visible = false,
			w = self._buttons:row_w()
		}))
	end

	action_button("install", callback(self, self, "install_current_mod"))
	action_button("abort_installation", callback(self, self, "abort_installation_current_mod"))
	action_button("uninstall", callback(self, self, "uninstall_current_mod"))
	action_button("visit_mod_page", callback(self, self, "visit_current_mod_page"))

	self._pagination_holder = MultichoiceGuiObject:new(self._page_panel:parent(), {
		use_change_profile_controls = true,
		options = {
			{
				text = "1 / 1",
				value = 1
			}
		},
		on_change = function(index)
			self._page = index

			self:search_mods(true)
		end
	}, {
		input = false,
		visible = false,
		y = 48
	})

	self._pagination_holder:set_world_righttop(self._panel:world_right(), self._panel:world_bottom() + 2)

	self._searchbox = SearchBoxGuiObject:new(self._page_panel:parent(), self._ws, "", {
		h = 26,
		visible = false
	})

	self:add_input_component(self._searchbox)
	self._searchbox:register_disconnect_callback(callback(self, self, "_searchbox_disconnect_callback"))
	self._searchbox.panel:set_world_righttop(self._pagination_holder:world_x() - 4, self._pagination_holder:world_y())
	self:add_input_component(self._pagination_holder)
end

function ModWorkshopBaseModsPage:set_active(active, play_sound)
	ModWorkshopBaseModsPage.super.set_active(self, active, play_sound)
	self._pagination_holder:set_visible(active)
	self._searchbox.panel:set_visible(active and managers.menu:is_pc_controller())
end

function ModWorkshopBaseModsPage:_searchbox_disconnect_callback()
	self:search_mods()
end

function ModWorkshopBaseModsPage:search_mods(keep_page)
	return
end

function ModWorkshopBaseModsPage:_on_mods_loaded(res, data)
	return
end

function ModWorkshopBaseModsPage:_on_mods_error()
	return
end

function ModWorkshopBaseModsPage:update()
	if not self._mods_grid:selected_item() and #self._mods_grid:items() > 0 then
		self._mods_grid:select_index(1)
	end
end

function ModWorkshopBaseModsPage:input_focus()
	return self:allow_input()
end

function ModWorkshopBaseModsPage:confirm_pressed()
	if self._mods_grid:selected_item() and self._mods_grid:selected_item()._item then
		-- Nothing
	end
end

function ModWorkshopBaseModsPage:allow_input()
	return not self._showing_dialog
end

function ModWorkshopBaseModsPage:on_mod_download_progress(mod_id, now, total, can_cancel)
	local item = self._mod_items[mod_id]

	if item then
		item:on_mod_download_progress(now, total, can_cancel)
	end

	if self._mod and mod_id == self._mod:id() then
		self:update_right_side()
	end
end

function ModWorkshopBaseModsPage:on_mod_installed(mod_id)
	local item = self._mod_items[mod_id]

	if item then
		item:reload()
		item:on_mod_download_progress(0, 1)
	end

	if self._mod and mod_id == self._mod:id() then
		self:update_right_side()
	end
end

function ModWorkshopBaseModsPage:on_mod_removed(mod_id)
	local item = self._mod_items[mod_id]

	if item then
		item:reload()
	end

	if self._mod and mod_id == self._mod:id() then
		self:update_right_side()
	end
end

function ModWorkshopBaseModsPage:on_mod_download_fail(mod_id)
	local item = self._mod_items[mod_id]

	if item then
		item:reload()
		item:on_mod_download_progress(0, 1)
	end

	if self._mod and mod_id == self._mod:id() then
		self:update_right_side()
	end
end

function ModWorkshopBaseModsPage:on_mod_abort_download(mod_id)
	local item = self._mod_items[mod_id]

	if item then
		item:reload()
		item:on_mod_download_progress(0, 1)
	end

	if self._mod and mod_id == self._mod:id() then
		self:update_right_side()
	end
end

function ModWorkshopBaseModsPage:on_selected_mod(mod)
	self._mod = mod

	self:update_right_side()
end

function ModWorkshopBaseModsPage:update_right_side()
	local mod = self._mod
	local download_state = mod and managers.modworkshop:get_download_state(mod:id()) or nil

	self._install_btn:set_enabled(download_state == ModWorkshopManager.DOWNLOAD_NONE)
	self._uninstall_btn:set_enabled(true)
	self._abort_installation_btn:hide()
	self._install_btn:hide()
	self._uninstall_btn:hide()
	self._visit_mod_page_btn:hide()

	if mod then
		if mod:is_installed() then
			self._uninstall_btn:show()
		elseif download_state == ModWorkshopManager.DOWNLOAD_NONE then
			self._install_btn:show()
		elseif download_state == ModWorkshopManager.DOWNLOAD_DOWNLOADING or download_state == ModWorkshopManager.DOWNLOAD_QUEUED then
			self._abort_installation_btn:show()
		end

		self._visit_mod_page_btn:show()
	end

	local buttons_h = self._buttons:h()

	self._buttons:place_items_in_order()
	self._mod_details:set_mod(mod and mod:data() or nil, self:details_h())
	self._right_side_placer:place_items_in_order()

	if not self._buttons_box_gui or buttons_h ~= self._buttons:h() then
		if self._buttons_box_gui then
			self._buttons_box_gui:close()
		end

		self._buttons_box_gui = BoxGuiObject:new(self._buttons, {
			halign = "left",
			valign = "top",
			sides = {
				1,
				1,
				1,
				1
			}
		})
	end
end

function ModWorkshopBaseModsPage:details_h()
	return self._info_panel:h() - self._buttons:h() - 8
end

function ModWorkshopBaseModsPage:install_current_mod()
	managers.modworkshop:queue_download_mod(self._mod:id())
	self:update_right_side()
end

function ModWorkshopBaseModsPage:abort_installation_current_mod()
	managers.modworkshop:abort_download()
end

function ModWorkshopBaseModsPage:uninstall_current_mod()
	local loc = managers.localization

	self._uninstall_btn:set_enabled(false)
	managers.system_menu:show({
		title = loc:text("dialog_warning_title"),
		text = loc:text("menu_mws_delete_warn"),
		button_list = {
			{
				text = managers.localization:text("dialog_yes"),
				callback_func = callback(self, self, "do_uninstall_current_mod")
			},
			{
				cancel_button = true,
				text = managers.localization:text("dialog_no"),
				callback_func = function()
					self._uninstall_btn:set_enabled(true)
				end
			}
		}
	})
end

function ModWorkshopBaseModsPage:do_uninstall_current_mod()
	local loc = managers.localization

	if not managers.modworkshop:remove_mod(self._mod:id()) then
		managers.system_menu:show({
			title = loc:text("dialog_error_title"),
			text = loc:text("menu_mws_uninstall_fail_generic"),
			button_list = {
				{
					cancel_button = true,
					text = loc:text("dialog_ok")
				}
			}
		})
	end

	self:update_right_side()
end

function ModWorkshopBaseModsPage:check_current_mod_updates()
	return
end

function ModWorkshopBaseModsPage:visit_current_mod_page()
	self._mod:visit_page()
end
