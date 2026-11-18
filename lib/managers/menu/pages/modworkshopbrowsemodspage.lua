local large_font = tweak_data.menu.pd2_large_font
local large_font_size = tweak_data.menu.pd2_large_font_size
local massive_font = tweak_data.menu.pd2_massive_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size

ModWorkshopBrowseModsPage = ModWorkshopBrowseModsPage or class(ModWorkshopBaseModsPage)

function ModWorkshopBrowseModsPage:_setup()
	self._chosen_tags = {}
	self._chosen_blocked_tags = {}
	self._sort_order = "bumped_at"
end

function ModWorkshopBrowseModsPage:open_category_filter_dialog()
	if self._searchbox:input_focus() then
		return
	end

	self._showing_dialog = true

	managers.menu:open_node("mws_filters_dialog_menu", {
		{
			category = self._category,
			sort_order = self._sort_order,
			tags = clone(self._chosen_tags),
			blocked_tags = clone(self._chosen_blocked_tags),
			data = {
				tags = managers.modworkshop:tags(),
				categories = managers.modworkshop:categories()
			},
			on_close = function(data)
				self._showing_dialog = false

				local changed = self._category ~= data.category or self._sort_order ~= data.sort_order or not table.equals(self._chosen_tags, data.tags) or not table.equals(self._chosen_blocked_tags, data.blocked_tags)

				self._category = data.category
				self._chosen_tags = data.tags
				self._sort_order = data.sort_order
				self._chosen_blocked_tags = data.blocked_tags

				if changed then
					self:search_mods()
				end
			end
		}
	})
end

function ModWorkshopBrowseModsPage:_create_right_side()
	self._filters_top = self._right_side_placer:add_bottom(GrowPanel:new(self._info_panel, {
		input = true,
		name = "filters_panel",
		padding = 8,
		fixed_w = self._info_panel:w()
	}))

	local placer = self._filters_top:placer()

	placer:add_row(TextButton:new(self._filters_top, {
		binding = "menu_toggle_filters",
		font_size = 24,
		input = true,
		text_id = "menu_achievements_filter_btn",
		font = large_font
	}, callback(self, self, "open_category_filter_dialog")))
	BoxGuiObject:new(self._filters_top, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
	ModWorkshopBrowseModsPage.super._create_right_side(self)
end

function ModWorkshopBrowseModsPage:details_h()
	return self._info_panel:h() - self._filters_top:h() - self._buttons:h() - 8
end

function ModWorkshopBrowseModsPage:search_mods(keep_page)
	if keep_page ~= true then
		self._page = 1
	end

	self._mods_grid:clear()
	self._loading:show()

	local blocked_tags = table.list_add(self.BLOCKED_TAGS, self._chosen_blocked_tags)
	local res = ModWorkshop:get_mods({
		page = self._page,
		limit = self.MODS_LIMIT,
		sort = self._sort_order,
		query = self._searchbox.text:text(),
		category_id = tonumber(self._category),
		tags = self._chosen_tags,
		blocked_tags = blocked_tags,
		mod_types = self.MOD_TYPES
	}, callback(self, self, "_on_mods_loaded"), function(res, mod_id, texture)
		if res == "success" and self._mod_items[mod_id] then
			local mod_item = self._mod_items[mod_id]

			if texture then
				mod_item:data().texture = texture
			end

			mod_item:set_thumbnail(texture)
		end
	end)

	if not res then
		self:_on_mods_error()
	end
end

function ModWorkshopBrowseModsPage:_on_mods_loaded(res, data)
	if not self._panel or not alive(self._panel) then
		return
	end

	self._mods_grid:clear()
	self._loading:hide()

	if res ~= "success" then
		self:_on_mods_error()

		return
	end

	local canvas = self._mods_grid:canvas()

	self._mod_items = {}

	for _, mod in pairs(data.data) do
		local item = self._mods_grid:add_item(ModWorkshopModItem:new(canvas, mod, self), true)

		self._mod_items[mod.id] = item
	end

	self._pagination_holder:set_options(table.collect(table.range(1, data.page_count), function(val)
		return {
			text = val .. " / " .. data.page_count,
			value = val
		}
	end))
	self._pagination_holder:set_index(self._page, true)
end

function ModWorkshopBrowseModsPage:_on_mods_error()
	return
end
