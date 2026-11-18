ModWorkshopInstalledModsPage = ModWorkshopInstalledModsPage or class(ModWorkshopBaseModsPage)

function ModWorkshopInstalledModsPage:_setup()
	self:filter_mods(true)
end

function ModWorkshopInstalledModsPage:search_mods(keep_page)
	if keep_page ~= true then
		self._page = 1
	end

	self._mods_grid:clear()
	self._loading:show()

	self._current_mod_ids = {}

	for i = (self._page - 1) * self.MODS_LIMIT + 1, self._page * self.MODS_LIMIT do
		table.insert(self._current_mod_ids, self._filtered_mods[i])
	end

	if #self._current_mod_ids == 0 then
		self:_on_mods_loaded("success", {
			page_count = 1,
			total = 0,
			data = {}
		})

		return
	end

	local res = ModWorkshop:get_mods({
		mod_ids = self._current_mod_ids,
		limit = self.MODS_LIMIT,
		blocked_tags = self.BLOCKED_TAGS
	}, callback(self, self, "_on_mods_loaded"), function(res, mod_id, texture)
		if res == "success" and self._mod_items[mod_id] then
			self._mod_items[mod_id]:set_thumbnail(texture)
		end
	end)

	if not res then
		self:_on_mods_error()
	end
end

function ModWorkshopInstalledModsPage:_on_mods_loaded(res, data)
	if not self._panel or not alive(self._panel) then
		return
	end

	self._mods_grid:clear()
	self._loading:hide()

	local mod_id_to_mod = {}

	if res == "success" then
		for _, mod in pairs(data.data) do
			mod_id_to_mod[mod.id] = mod
		end
	end

	local canvas = self._mods_grid:canvas()

	self._mod_items = {}

	for _, mod_id in pairs(self._current_mod_ids) do
		local mod = mod_id_to_mod[mod_id]

		if not mod then
			local install = self:get_mod_installation(mod_id)

			mod = {
				id = mod_id,
				name = install.name
			}
		end

		local item = self._mods_grid:add_item(ModWorkshopModItem:new(canvas, mod, self), true)

		self._mod_items[mod.id] = item
	end

	self._pagination_holder:set_index(self._page, true)
end

function ModWorkshopInstalledModsPage:get_mod_installation(mod_id)
	for _, mod in pairs(self._installed_mods) do
		if mod.id == mod_id then
			return mod
		end
	end
end

function ModWorkshopInstalledModsPage:_on_mods_error(res)
	return
end

function ModWorkshopInstalledModsPage:on_mod_installed(mod_id)
	ModWorkshopInstalledModsPage.super.on_mod_installed(self, mod_id)
	self:filter_mods()
end

function ModWorkshopInstalledModsPage:on_mod_removed(mod_id)
	ModWorkshopInstalledModsPage.super.on_mod_removed(self, mod_id)
	self:filter_mods()

	if #self._current_mod_ids == 0 then
		self:on_selected_mod()
	end
end

function ModWorkshopInstalledModsPage:filter_mods(no_search)
	self._filtered_mods = {}

	local query = self._searchbox.text:text():lower()

	self._installed_mods = managers.modworkshop:installed_mods()

	for _, install in pairs(self._installed_mods) do
		if query == "" or install.name:lower():find(query) then
			table.insert(self._filtered_mods, install.id)
		end
	end

	local page_count = math.max(math.ceil(#self._installed_mods / self.MODS_LIMIT), 1)

	self._pagination_holder:set_options(table.collect(table.range(1, page_count), function(val)
		return {
			text = val .. " / " .. page_count,
			value = val
		}
	end))

	if not no_search then
		self:search_mods()
	end
end

function ModWorkshopInstalledModsPage:_searchbox_disconnect_callback()
	self:filter_mods()
end
