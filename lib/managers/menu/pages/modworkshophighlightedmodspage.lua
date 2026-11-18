local large_font = tweak_data.menu.pd2_large_font
local large_font_size = tweak_data.menu.pd2_large_font_size
local massive_font = tweak_data.menu.pd2_massive_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size

ModWorkshopHighlightedModsPage = ModWorkshopHighlightedModsPage or class(ModWorkshopBaseModsPage)

function ModWorkshopHighlightedModsPage:search_mods(keep_page)
	if keep_page ~= true then
		self._page = 1
	end

	self._mods_grid:clear()
	self._loading:show()

	local res = ModWorkshop:get_mods({
		highlighted_only = true,
		page = self._page,
		limit = self.MODS_LIMIT,
		query = self._searchbox.text:text(),
		mod_types = self.MOD_TYPES,
		blocked_tags = self.BLOCKED_TAGS
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

function ModWorkshopHighlightedModsPage:_on_mods_loaded(res, data)
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
