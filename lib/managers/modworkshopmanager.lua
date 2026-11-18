ModWorkshopManager = ModWorkshopManager or class()
ModWorkshopManager._downloads_queue = {}
ModWorkshopManager.DOWNLOAD_NONE = 1
ModWorkshopManager.DOWNLOAD_QUEUED = 2
ModWorkshopManager.DOWNLOAD_DOWNLOADING = 3
ModWorkshopManager.DOWNLOAD_INSTALLING = 4

function ModWorkshopManager:init()
	ModWorkshop:init("3zXzXRNR91osKci8RoRQYkinyi7969kv")
	self:reload_installed_mods_map()

	self._categories = {}
	self._tags = {}

	ModWorkshop:get_tags(function(res, tags)
		if res ~= "success" then
			return
		end

		self._tags = tags
	end)
	ModWorkshop:get_categories(function(res, categories)
		if res ~= "success" then
			return
		end

		self._categories = categories
	end)
end

function ModWorkshopManager:destroy()
	ModWorkshop:shutdown()
end

function ModWorkshopManager:get_menu_component()
	if managers.menu_component then
		for _, comp in pairs(managers.menu_component._alive_components) do
			if comp.id == "modworkshop_menu" then
				return comp.component
			end
		end
	end
end

function ModWorkshopManager:run_on_menu_component(event, ...)
	local menu_component = self:get_menu_component()

	if menu_component then
		for _, tab in pairs(menu_component._tabs) do
			local page = tab.page

			if page[event] then
				page[event](page, ...)
			end
		end
	end
end

function ModWorkshopManager:installed_mods()
	return self._installed_mods_map
end

function ModWorkshopManager:tags()
	return self._tags
end

function ModWorkshopManager:categories()
	return self._categories
end

function ModWorkshopManager:reload_installed_mods_map()
	self._installed_mods_map = {}

	for _, mod in pairs(ModWorkshop:installed_mods()) do
		self._installed_mods_map[mod.id] = mod
	end
end

function ModWorkshopManager:is_mod_installed(mod_id)
	return self._installed_mods_map[mod_id] ~= nil
end

function ModWorkshopManager:get_mod_install(mod_id)
	return self._installed_mods_map[mod_id]
end

function ModWorkshopManager:remove_mod(mod_id)
	if ModWorkshop:remove_mod(mod_id) then
		self:reload_installed_mods_map()
		self:run_on_menu_component("on_mod_removed", mod_id)

		if not self._downloading then
			DB:reload_override_mods()
		end

		return true
	end

	return false
end

function ModWorkshopManager:queue_download_mod(mod_id)
	if self:get_download_state(mod_id) == self.DOWNLOAD_NONE then
		table.insert(self._downloads_queue, mod_id)
		self:_check_start_download()
	end
end

function ModWorkshopManager:_check_start_download()
	if self._downloading or #self._downloads_queue == 0 then
		return
	end

	local loc = managers.localization
	local last_id = table.remove(self._downloads_queue, 1)

	self._downloading = {
		can_cancel = true,
		mod_id = last_id
	}

	local res = ModWorkshop:download_mod(last_id, function(now, total)
		self._downloading.can_cancel = total - now > 0.01

		self:run_on_menu_component("on_mod_download_progress", last_id, now, total, self._downloading.can_cancel)
	end, function(res, mod_install)
		if res ~= "success" then
			self:_on_mod_install_fail(last_id, res)

			return
		end

		managers.system_menu:show({
			title = loc:text("dialog_success_title"),
			text = loc:text("menu_mws_install_success", {
				MOD = mod_install.name
			}),
			button_list = {
				{
					cancel_button = true,
					text = loc:text("dialog_ok")
				}
			}
		})
		self:reload_installed_mods_map()
		self:run_on_menu_component("on_mod_installed", last_id, res, mod_install)

		self._downloading = nil

		self:_check_start_download()

		if not self._downloading and #self._downloads_queue == 0 then
			DB:reload_override_mods()
		end
	end)

	if not res then
		self:_on_mod_install_fail(last_id, res)
	end
end

function ModWorkshopManager:get_download_state(mod_id)
	if self._downloading and self._downloading.mod_id == mod_id then
		return self._downloading.can_cancel and self.DOWNLOAD_DOWNLOADING or self.DOWNLOAD_INSTALLING
	end

	for _, queued_mod_id in pairs(self._downloads_queue) do
		if queued_mod_id == mod_id then
			return self.DOWNLOAD_QUEUED
		end
	end

	return self.DOWNLOAD_NONE
end

function ModWorkshopManager:abort_download()
	if self._downloading then
		local mod_id = self._downloading.mod_id

		ModWorkshop:abort_download()

		self._downloading = nil

		self:_check_start_download()
		self:run_on_menu_component("on_mod_abort_download", mod_id)
	end
end

function ModWorkshopManager:_on_mod_install_fail(mod_id, res)
	local loc = managers.localization

	self._downloading = nil

	self:_check_start_download()
	self:run_on_menu_component("on_mod_download_fail", mod_id, res)
	managers.system_menu:show({
		title = loc:text("dialog_error_title"),
		text = loc:text("menu_mws_install_fail_generic"),
		button_list = {
			{
				cancel_button = true,
				text = loc:text("dialog_ok")
			}
		}
	})
end
