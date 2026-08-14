core:import("CoreEvent")

SavefileManager = SavefileManager or class()
SavefileManager.MIN_SLOT = 0
SavefileManager.MAX_SLOT = 2
SavefileManager.SETTING_SLOT = 0
SavefileManager.AUTO_SAVE_SLOT = 1
SavefileManager.PROGRESS_SLOT = 2
SavefileManager.BACKUP_SLOT = 3

if IS_PC then
	SavefileManager.MAX_SLOT = 99
	SavefileManager.SETTING_SLOT = 0
	SavefileManager.AUTO_SAVE_SLOT = 1
	SavefileManager.PROGRESS_SLOT = 98
	SavefileManager.BACKUP_SLOT = 98

	if _G.IS_VR then
		SavefileManager.SETTING_SLOT = 12
	end
end

SavefileManager.VR_BETA_PROGRESS_SLOT = 96
SavefileManager.MAX_PROFILE_SAVE_INTERVAL = 300

if IS_PS4 then
	SavefileManager.RESERVED_BYTES = 204800
end

SavefileManager.IDLE_TASK_TYPE = 1
SavefileManager.LOAD_TASK_TYPE = 2
SavefileManager.SAVE_TASK_TYPE = 3
SavefileManager.REMOVE_TASK_TYPE = 4
SavefileManager.CHECK_SPACE_REQUIRED_TASK_TYPE = 5
SavefileManager.ENUMERATE_SLOTS_TASK_TYPE = 6
SavefileManager.TASK_TYPE_LOADING_TYPE_LOOKUP = {
	[SavefileManager.LOAD_TASK_TYPE] = true,
	[SavefileManager.ENUMERATE_SLOTS_TASK_TYPE] = true
}
SavefileManager.DEBUG_TASK_TYPE_NAME_LIST = {
	"Idle",
	"Loading",
	"Saving",
	"Removing",
	"CheckingSpaceRequired",
	"EnumeratingSlots"
}
SavefileManager.TASK_TYPES_GUI_LOOKUP = {
	[SavefileManager.SAVE_TASK_TYPE] = {
		check_time = 3,
		text_id = "savefile_saving"
	},
	[SavefileManager.REMOVE_TASK_TYPE] = {
		check_time = 3,
		text_id = "savefile_removing"
	}
}

if IS_PS4 then
	SavefileManager.TASK_TYPES_GUI_LOOKUP[SavefileManager.LOAD_TASK_TYPE] = {
		check_time = 0,
		text_id = "savefile_loading"
	}
end

SavefileManager.VERSION = 5

if IS_PS4 then
	SavefileManager.VERSION_NAME = "01.00"
	SavefileManager.LOWEST_COMPATIBLE_VERSION = SavefileManager.VERSION_NAME
elseif IS_XB1 then
	SavefileManager.VERSION_NAME = "1.0.0.0"
	SavefileManager.LOWEST_COMPATIBLE_VERSION = SavefileManager.VERSION_NAME
else
	SavefileManager.VERSION_NAME = "1.8"
	SavefileManager.LOWEST_COMPATIBLE_VERSION = "1.7"
end

SavefileManager.SAVE_SYSTEM = "steam_cloud"
SavefileManager.SAVE_SYSTEM_LOCAL = "local_hdd"

function SavefileManager:init()
	self._timer = TimerManager:wall()
	self._active_changed_callback_handler = CoreEvent.CallbackEventHandler:new()
	self._save_begin_callback_handler = CoreEvent.CallbackEventHandler:new()
	self._save_done_callback_handler = CoreEvent.CallbackEventHandler:new()
	self._load_begin_callback_handler = CoreEvent.CallbackEventHandler:new()
	self._load_done_callback_handler = CoreEvent.CallbackEventHandler:new()
	self._load_sequence_done_callback_handler = CoreEvent.CallbackEventHandler:new()
	self._current_task_type = self.IDLE_TASK_TYPE

	if not Global.savefile_manager then
		Global.savefile_manager = {
			current_game_cache_slot = nil,
			safe_profile_save_time = nil,
			setting_changed = nil,
			meta_data_list = {}
		}
	end

	self._workspace = managers.gui_data:create_saferect_workspace()
	self._gui = self._workspace:panel():gui(Idstring("guis/savefile_manager"))
	self._gui_script = self._gui:script()

	self._workspace:hide()

	self._resolution_changed_callback_id = managers.viewport:add_resolution_changed_func(callback(self, self, "resolution_changed"))
	self._queued_tasks = {}
	self._savegame_hdd_space_required = false
	self._save_slots_to_load = {}

	SaveGameManager:set_max_nr_slots(self.MAX_SLOT - self.MIN_SLOT + 1)
end

function SavefileManager:resolution_changed()
	managers.gui_data:layout_workspace(self._workspace)
end

function SavefileManager:destroy()
	if self._workspace then
		managers.gui_data:destroy_workspace(self._workspace)

		self._workspace = nil
		self._gui = nil
		self._gui_script = nil
	end
end

function SavefileManager:active_user_changed()
	if managers.user.STORE_SETTINGS_ON_PROFILE then
		self:_clean_meta_data_list(true)

		local is_signed_in = managers.user:is_signed_in(nil)

		if is_signed_in then
			self:load_settings()
		end
	end
end

function SavefileManager:_get_userid_internal()
	return Steam:userid()
end

function SavefileManager:_check_task_save_system(task_data, save_system)
	if IS_STEAM then
		task_data.save_system = save_system or self.SAVE_SYSTEM
	elseif IS_EPIC then
		task_data.save_system = self.SAVE_SYSTEM_LOCAL
	end
end

function SavefileManager:storage_changed()
	local storage_device_selected = managers.user:is_storage_selected(nil)

	if not managers.user.STORE_SETTINGS_ON_PROFILE then
		self:_clean_meta_data_list(true)
	end

	self:_clean_meta_data_list(false)

	if not storage_device_selected then
		Application:error("[SavefileManager] storage_changed() - unable to load meta data, no storage deviced selected. Signed in: " .. tostring(managers.user:is_signed_in(nil)))

		return
	end

	self._loading_sequence = true
	self._save_slots_to_load = {
		all = true
	}

	if self._backup_data == nil and IS_PC then
		self:load_progress(self.SAVE_SYSTEM_LOCAL)
	end

	if self._vr_progress_data == nil then
		self:load_vr_beta_progress()
	end

	local task_data = {
		queued_in_save_manager = true,
		task_type = self.ENUMERATE_SLOTS_TASK_TYPE,
		user_index = managers.user:get_platform_id(),
		first_slot = self.MIN_SLOT,
		last_slot = self.MAX_SLOT
	}

	if IS_PC then
		task_data.save_system = self.SAVE_SYSTEM
	end

	self:_check_task_save_system(task_data, task_data.save_system)
	self:_on_task_queued(task_data)
	SaveGameManager:iterate_savegame_slots(task_data, callback(self, self, "clbk_result_iterate_savegame_slots"))
end

function SavefileManager:check_space_required()
	local task_data = {
		queued_in_save_manager = true,
		task_type = self.CHECK_SPACE_REQUIRED_TASK_TYPE,
		user_index = managers.user:get_platform_id(),
		first_slot = self.MIN_SLOT,
		last_slot = self.MAX_SLOT
	}

	self:_on_task_queued(task_data)
	SaveGameManager:iterate_savegame_slots(task_data, callback(self, self, "clbk_result_space_required"))
end

function SavefileManager:setting_changed()
	self:_set_setting_changed(true)
end

function SavefileManager:save_game(slot, cache_only)
	self:_save(slot, cache_only)
end

function SavefileManager:save_setting(is_user_initiated_action)
	if self:_is_saving_setting_allowed(is_user_initiated_action) then
		self:_save(self.SETTING_SLOT, false)
	end
end

function SavefileManager:save_progress(save_system)
	if self:_is_saving_progress_allowed() then
		self:_save(self.PROGRESS_SLOT, nil, save_system)

		Global.savefile_manager.backup_save_enabled = IS_PC
	end
end

function SavefileManager:load_progress(save_system)
	self:_load(self.PROGRESS_SLOT, nil, save_system)
end

function SavefileManager:load_game(slot, cache_only)
	self:_load(slot, cache_only)
end

function SavefileManager:load_settings()
	self:_load(self.SETTING_SLOT)
end

function SavefileManager:current_game_cache_slot()
	return Global.savefile_manager.current_game_cache_slot
end

function SavefileManager:update(t, dt)
	self:update_gui_visibility()

	if self._loading_sequence and not next(self._save_slots_to_load) and not self:_is_loading() then
		self:_on_load_sequence_complete()
	end
end

function SavefileManager:_is_loading()
	for _, task_data in ipairs(self._queued_tasks) do
		if self.TASK_TYPE_LOADING_TYPE_LOOKUP[task_data.task_type] then
			return true
		end
	end
end

function SavefileManager:_on_load_sequence_complete()
	self._loading_sequence = nil

	self._load_sequence_done_callback_handler:dispatch()
end

function SavefileManager:is_in_loading_sequence()
	return self._loading_sequence
end

function SavefileManager:break_loading_sequence()
	self._try_again = nil
	self._loading_sequence = nil
	self._save_slots_to_load = {}

	for i, task_data in ipairs(self._queued_tasks) do
		SaveGameManager:abort(task_data)
	end

	self._queued_tasks = {}

	managers.system_menu:close("savefile_try_again")
	managers.system_menu:close("savefile_new_safefile")
end

function SavefileManager:paused_update(t, dt)
	self:update_gui_visibility()
end

function SavefileManager:update_current_task_type()
	local current_task_data = self._queued_tasks[1]

	self:_set_current_task_type(current_task_data and current_task_data.task_type or self.IDLE_TASK_TYPE)
end

function SavefileManager:update_gui_visibility()
	if self._hide_gui_time and self._timer:time() >= self._hide_gui_time then
		self._workspace:hide()
		self._gui_script:set_text("")

		self._hide_gui_time = nil
	end
end

function SavefileManager:debug_get_task_name(task_type)
	return self.DEBUG_TASK_TYPE_NAME_LIST[task_type] or "Invalid"
end

function SavefileManager:is_active()
	return next(self._queued_tasks) and true or false
end

function SavefileManager:get_save_info_list(include_empty_slot)
	local data_list = {}
	local save_info_list = {}

	for slot, meta_data in pairs(Global.savefile_manager.meta_data_list) do
		if meta_data.is_synched_text and (not include_empty_slot or slot ~= self.AUTO_SAVE_SLOT) and slot ~= self.SETTING_SLOT and slot ~= self.PROGRESS_SLOT then
			table.insert(data_list, {
				slot = slot,
				text = meta_data.text,
				sort_list = meta_data.sort_list
			})
		end
	end

	local function sort_func(data1, data2)
		return self:_compare_sort_list(data1.sort_list, data2.sort_list) < 0
	end

	table.sort(data_list, sort_func)

	for _, data in ipairs(data_list) do
		table.insert(save_info_list, SavefileInfo:new(data.slot, data.text))
	end

	if include_empty_slot then
		for empty_slot = 0, self.MAX_SLOT do
			local meta_data = Global.savefile_manager.meta_data_list[empty_slot]

			if empty_slot ~= self.SETTING_SLOT and empty_slot ~= self.PROGRESS_SLOT and empty_slot ~= self.AUTO_SAVE_SLOT and (not meta_data or not meta_data.is_synched_text) then
				local save_info = SavefileInfo:new(empty_slot, managers.localization:text("savefile_empty"))

				table.insert(save_info_list, 1, save_info)

				break
			end
		end
	end

	return save_info_list
end

function SavefileManager:add_active_changed_callback(callback_func)
	self._active_changed_callback_handler:add(callback_func)
end

function SavefileManager:remove_active_changed_callback(callback_func)
	self._active_changed_callback_handler:remove(callback_func)
end

function SavefileManager:add_save_begin_callback(callback_func)
	self._save_begin_callback_handler:add(callback_func)
end

function SavefileManager:remove_save_begin_callback(callback_func)
	self._save_begin_callback_handler:remove(callback_func)
end

function SavefileManager:add_save_done_callback(callback_func)
	self._save_done_callback_handler:add(callback_func)
end

function SavefileManager:remove_save_done_callback(callback_func)
	self._save_done_callback_handler:remove(callback_func)
end

function SavefileManager:add_load_begin_callback(callback_func)
	self._load_begin_callback_handler:add(callback_func)
end

function SavefileManager:remove_load_begin_callback(callback_func)
	self._load_begin_callback_handler:remove(callback_func)
end

function SavefileManager:add_load_done_callback(callback_func)
	self._load_done_callback_handler:add(callback_func)
end

function SavefileManager:remove_load_done_callback(callback_func)
	self._load_done_callback_handler:remove(callback_func)
end

function SavefileManager:add_load_sequence_done_callback_handler(callback_func)
	self._load_sequence_done_callback_handler:add(callback_func)
end

function SavefileManager:remove_load_sequence_done_callback_handler(callback_func)
	self._load_sequence_done_callback_handler:remove(callback_func)
end

function SavefileManager:_clean_meta_data_list(is_setting_slot)
	if is_setting_slot then
		Global.savefile_manager.meta_data_list[self.SETTING_SLOT] = nil
	else
		local empty_list

		for slot in pairs(Global.savefile_manager.meta_data_list) do
			if slot ~= self.SETTING_SLOT then
				empty_list = true

				break
			end
		end

		if empty_list then
			local setting_meta_data = Global.savefile_manager.meta_data_list[self.SETTING_SLOT]

			Global.savefile_manager.meta_data_list = {}
			Global.savefile_manager.meta_data_list[self.SETTING_SLOT] = setting_meta_data
		end
	end
end

function SavefileManager:_save(slot, cache_only, save_system)
	local is_setting_slot = slot == self.SETTING_SLOT
	local is_progress_slot = slot == self.PROGRESS_SLOT

	self._save_begin_callback_handler:dispatch(slot, is_setting_slot, cache_only)
	self:_save_cache(slot)

	if cache_only then
		self:_save_done(slot, cache_only, nil, nil, true)

		return
	end

	if is_setting_slot then
		self:_set_setting_changed(false)
	end

	if is_setting_slot and managers.user.STORE_SETTINGS_ON_PROFILE then
		Global.savefile_manager.safe_profile_save_time = self._timer:time() + self.MAX_PROFILE_SAVE_INTERVAL

		local task_data = {
			queued_in_save_manager = false,
			task_type = self.SAVE_TASK_TYPE,
			first_slot = slot
		}

		self:_on_task_queued(task_data)
		managers.user:save_setting_map(callback(self, self, "clbk_result_save_platform_setting", task_data))
	else
		local meta_data = self:_meta_data(slot)
		local task_data = {
			date_format = "%c",
			max_queue_size = 1,
			queued_in_save_manager = true,
			first_slot = slot,
			task_type = self.SAVE_TASK_TYPE,
			user_index = managers.user:get_platform_id()
		}

		task_data.subtitle = managers.localization:text(is_setting_slot and "savefile_setting" or "savefile_progress", {
			VERSION = self.LOWEST_COMPATIBLE_VERSION
		})
		task_data.details = managers.localization:text(is_setting_slot and "savefile_setting_description" or "savefile_progress_description")
		task_data.data = {
			meta_data.cache
		}

		self:_check_task_save_system(task_data, save_system)
		self:_on_task_queued(task_data)
		SaveGameManager:save(task_data, callback(self, self, "clbk_result_save"))
	end
end

function SavefileManager:_save_cache(slot)
	local is_setting_slot = slot == self.SETTING_SLOT

	if is_setting_slot then
		self:_set_cache(slot, nil)
	else
		local old_slot = Global.savefile_manager.current_game_cache_slot

		if old_slot then
			self:_set_cache(old_slot, nil)
		end

		self:_set_current_game_cache_slot(slot)
	end

	local cache = {
		version = self.VERSION,
		version_name = self.VERSION_NAME
	}

	if is_setting_slot then
		managers.user:save(cache)
		managers.music:save_settings(cache)

		if _G.IS_VR then
			managers.vr:save(cache)
		end
	else
		managers.player:save(cache)
		managers.experience:save(cache)
		managers.upgrades:save(cache)
		managers.money:save(cache)
		managers.statistics:save(cache)
		managers.skilltree:save(cache)
		managers.blackmarket:save(cache)
		managers.mission:save_job_values(cache)
		managers.job:save(cache)
		managers.dlc:save(cache)
		managers.infamy:save(cache)
		managers.features:save(cache)
		managers.gage_assignment:save(cache)
		managers.music:save_profile(cache)
		managers.challenge:save(cache)
		managers.multi_profile:save(cache)
		managers.ban_list:save(cache)
		managers.crimenet:save(cache)
		managers.custom_safehouse:save(cache)
		managers.butler_mirroring:save(cache)
		managers.mutators:save(cache)
		managers.tango:save(cache)
		managers.crime_spree:save(cache)
		managers.achievment:save(cache)
		managers.story:save(cache)
		managers.promo_unlocks:save(cache)
		managers.generic_side_jobs:save(cache)
		managers.event_jobs:save(cache)
		managers.skirmish:save(cache)
		managers.socialhub:save(cache)
	end

	if IS_STEAM then
		cache.user_id = self:_get_userid_internal()
	end

	self:_set_cache(slot, cache)
	self:_set_synched_cache(slot, false)

	return cache
end

function SavefileManager:_save_done(slot, cache_only, task_data, slot_data, success)
	if not success then
		self:_set_cache(slot, nil)
	end

	if not cache_only then
		self:_set_corrupt(slot, not success)
	end

	self:_set_synched_cache(slot, success and not cache_only)

	local is_setting_slot = slot == self.SETTING_SLOT

	if is_setting_slot and not success then
		self:_set_setting_changed(true)
	end

	self._save_done_callback_handler:dispatch(slot, success, is_setting_slot, cache_only)

	if not success then
		local dialog_data = {}

		dialog_data.title = managers.localization:text("dialog_error_title")

		local ok_button = {}

		ok_button.text = managers.localization:text("dialog_ok")
		dialog_data.button_list = {
			ok_button
		}
		dialog_data.text = managers.localization:text("dialog_fail_save_game_corrupt")

		if IS_PS4 then
			managers.system_menu:ps4_add_init_show(dialog_data)
		else
			managers.system_menu:show(dialog_data)
		end
	end
end

function SavefileManager:clbk_result_load_vr_beta_progress(task_data, result_data)
	if not self:_on_task_completed(task_data) then
		return
	end

	if type_name(result_data) ~= "table" then
		Application:error("[SavefileManager] clbk_result_load_vr_beta_progress() - result_data isn't a table as expected:", inspect(result_data))

		return
	end

	local slot_data = result_data[self.VR_BETA_PROGRESS_SLOT]

	if not slot_data then
		return
	end

	self._vr_progress_data = false

	if slot_data.status ~= "OK" then
		if slot_data.status ~= "FILE_NOT_FOUND" then
			Application:error("[SavefileManager] clbk_result_load_vr_beta_progress() - error status:", inspect(slot_data))
		end

		return
	end

	local cache = slot_data.data
	local version = cache.version or 0
	local version_name = cache.version_name
	local user_id = self:_get_userid_internal()

	if IS_STEAM and cache.user_id ~= user_id then
		-- Nothing
	elseif version <= self.VERSION then
		self._vr_progress_data = {
			save_data = slot_data
		}
	else
		local str = "Wrong version. \"" .. tostring(version) .. "\". Must be equal or lower than \"" .. tostring(self.VERSION) .. "\""

		Application:error("[SavefileManager] clbk_result_load_vr_beta_progress() - " .. str)
	end
end

function SavefileManager:load_vr_beta_progress(slot, save_system)
	local task_data = {
		queued_in_save_manager = true,
		task_type = self.LOAD_TASK_TYPE,
		first_slot = slot or self.VR_BETA_PROGRESS_SLOT,
		user_index = managers.user:get_platform_id()
	}

	self:_check_task_save_system(task_data, save_system)

	local load_callback_obj = callback(self, self, "clbk_result_load_vr_beta_progress")

	self:_on_task_queued(task_data)
	SaveGameManager:load(task_data, load_callback_obj)
end

function SavefileManager:_save_data_to_slot(target_slot, data, clbk, save_system)
	local task_data = {
		date_format = "%c",
		max_queue_size = 1,
		queued_in_save_manager = true,
		first_slot = target_slot,
		task_type = self.SAVE_TASK_TYPE,
		user_index = managers.user:get_platform_id()
	}

	task_data.subtitle = managers.localization:text("savefile_progress", {
		VERSION = self.LOWEST_COMPATIBLE_VERSION
	})
	task_data.details = managers.localization:text("savefile_progress_description")
	task_data.data = {
		data
	}

	self:_check_task_save_system(task_data, save_system)

	local function save_callback_obj(task_data, result_data)
		if not self:_on_task_completed(task_data) then
			clbk(false)

			return
		end

		if type_name(result_data) == "table" then
			local slot_data = result_data[target_slot]

			if slot_data then
				if slot_data.status == "OK" then
					clbk(true)

					return
				else
					Application:error("[SavefileManager] _save_data_to_slot() save_callback_obj() - error status:", inspect(slot_data))
				end
			end
		else
			Application:error("[SavefileManager] _save_data_to_slot() save_callback_obj() - result_data isn't a table as expected:", inspect(result_data))
		end

		clbk(false)
	end

	self:_on_task_queued(task_data)
	SaveGameManager:save(task_data, save_callback_obj)
end

function SavefileManager:clbk_result_load_copy_slot(src_slot, target_slot, task_data, result_data, clbk)
	if not self:_on_task_completed(task_data) then
		clbk(false)

		return
	end

	if type_name(result_data) == "table" then
		local slot_data = result_data[src_slot]

		if slot_data then
			if slot_data.status == "OK" then
				self:_save_data_to_slot(target_slot, slot_data.data, clbk)

				return
			else
				Application:error("[SavefileManager] clbk_result_load_copy_slot() - error status:", inspect(slot_data))
			end
		end
	else
		Application:error("[SavefileManager] clbk_result_load_copy_slot() - result_data isn't a table as expected:", inspect(result_data))
	end

	clbk(false)
end

function SavefileManager:_copy_slot(src_slot, target_slot, clbk, save_system)
	local task_data = {
		queued_in_save_manager = true,
		task_type = self.LOAD_TASK_TYPE,
		first_slot = src_slot,
		user_index = managers.user:get_platform_id()
	}

	self:_check_task_save_system(task_data, save_system)

	clbk = clbk or function()
		return
	end

	local function load_callback_obj(td, rd)
		self:clbk_result_load_copy_slot(src_slot, target_slot, td, rd, clbk)
	end

	self:_on_task_queued(task_data)
	SaveGameManager:load(task_data, load_callback_obj)
end

function SavefileManager:_load(slot, cache_only, save_system)
	local is_setting_slot = slot == self.SETTING_SLOT

	if not is_setting_slot then
		self:_set_current_game_cache_slot(slot)
	end

	self._load_begin_callback_handler:dispatch(slot, is_setting_slot, cache_only)

	local meta_data = self:_meta_data(slot)

	if cache_only or meta_data.is_synched_cache and meta_data.cache then
		self:_load_done(slot, cache_only, nil, nil)
	else
		if is_setting_slot then
			self:_set_cache(slot, nil)
		else
			self:_set_cache(Global.savefile_manager.current_game_cache_slot, nil)
		end

		local task_data = {
			queued_in_save_manager = true,
			task_type = self.LOAD_TASK_TYPE,
			first_slot = slot,
			user_index = managers.user:get_platform_id()
		}

		if is_setting_slot and managers.user.STORE_SETTINGS_ON_PROFILE then
			task_data.queued_in_save_manager = false

			self:_on_task_queued(task_data)
			managers.user:load_platform_setting_map(callback(self, self, "clbk_result_load_platform_setting_map", task_data))
		else
			self:_check_task_save_system(task_data, save_system)

			local clbk_name

			if IS_EPIC then
				clbk_name = save_system == self.SAVE_SYSTEM_LOCAL and "clbk_result_load_backup" or "clbk_result_load"
			else
				clbk_name = task_data.save_system == self.SAVE_SYSTEM_LOCAL and "clbk_result_load_backup" or "clbk_result_load"
			end

			local load_callback_obj = callback(self, self, clbk_name)

			self:_on_task_queued(task_data)
			SaveGameManager:load(task_data, load_callback_obj)
		end
	end
end

function SavefileManager:_on_task_queued(task_data)
	if task_data.max_queue_size then
		local nr_tasks_found = 0
		local i_task = 1

		while i_task <= #self._queued_tasks do
			local test_task_data = self._queued_tasks[i_task]

			if test_task_data.task_type == task_data.task_type and test_task_data.save_system == task_data.save_system then
				nr_tasks_found = nr_tasks_found + 1

				if nr_tasks_found >= task_data.max_queue_size then
					table.remove(self._queued_tasks, i_task)
					SaveGameManager:abort(test_task_data)
				else
					i_task = i_task + 1
				end
			else
				i_task = i_task + 1
			end
		end
	end

	table.insert(self._queued_tasks, task_data)
	self:update_current_task_type()
end

function SavefileManager:_on_task_completed(task_data)
	for i, test_task_data in ipairs(self._queued_tasks) do
		if task_data == test_task_data then
			table.remove(self._queued_tasks, i)
			self:update_current_task_type()

			return true
		end
	end

	return false
end

function SavefileManager:_load_done(slot, cache_only, wrong_user, wrong_version)
	local is_setting_slot = slot == self.SETTING_SLOT
	local is_progress_slot = slot == self.PROGRESS_SLOT
	local meta_data = self:_meta_data(slot)
	local success = meta_data.cache ~= nil

	if not cache_only then
		self:_set_corrupt(slot, not success)
		self:_set_synched_cache(slot, success)
	end

	if self._backup_data and is_progress_slot then
		local meta_data = self:_meta_data(slot)
		local cache = meta_data.cache

		if cache and managers.experience:chk_ask_use_backup(cache, self._backup_data.save_data.data) then
			self:_ask_load_backup("low_progress", true, {
				cache_only,
				wrong_user
			})

			return
		end
	end

	if self._vr_progress_data and is_progress_slot then
		local meta_data = self:_meta_data(slot)
		local cache = meta_data.cache

		if cache and managers.experience:chk_ask_use_backup(cache, self._vr_progress_data.save_data.data) then
			self:_ask_load_vr_progress(true, {
				cache_only,
				wrong_user
			})

			return
		end
	end

	local req_version = self:_load_cache(slot)

	success = req_version == nil and success or false

	self._load_done_callback_handler:dispatch(slot, success, is_setting_slot, cache_only)

	if not success and wrong_user then
		if not self._queued_wrong_user then
			self._queued_wrong_user = true

			managers.menu:show_savefile_wrong_user()
		end

		self._save_slots_to_load[slot] = nil
	elseif not success then
		self._try_again = self._try_again or {}

		local dialog_data = {}

		dialog_data.title = managers.localization:text("dialog_error_title")

		local ok_button = {}

		ok_button.text = managers.localization:text("dialog_ok")
		dialog_data.button_list = {
			ok_button
		}

		local error_type_str = req_version == nil and "corrupt" or "wrong_version"

		if is_setting_slot or is_progress_slot then
			local error_msg = is_setting_slot and "dialog_fail_load_setting_" or is_progress_slot and "dialog_fail_load_progress_"

			error_msg = error_msg .. error_type_str

			if not self._try_again[slot] then
				local yes_button = {}

				yes_button.text = managers.localization:text("dialog_yes")

				local no_button = {}

				no_button.text = managers.localization:text("dialog_no")
				dialog_data.button_list = {
					yes_button,
					no_button
				}
				dialog_data.id = "savefile_try_again"
				dialog_data.text = managers.localization:text(error_msg .. "_retry", {
					VERSION = req_version
				})

				if is_setting_slot then
					function yes_button.callback_func()
						self:load_settings()
					end
				elseif is_progress_slot then
					function yes_button.callback_func()
						self:load_progress()
					end
				end

				function no_button.callback_func()
					if is_progress_slot and self._backup_data then
						self:_ask_load_backup("progress_" .. error_type_str, false)

						return
					else
						local rem_dialog_data = {}

						rem_dialog_data.title = managers.localization:text("dialog_error_title")
						rem_dialog_data.text = managers.localization:text(error_msg, {
							VERSION = req_version
						})

						local ok_button = {}

						ok_button.text = managers.localization:text("dialog_ok")

						function ok_button.callback_func()
							self:_remove(slot)
						end

						rem_dialog_data.button_list = {
							ok_button
						}

						managers.system_menu:show(rem_dialog_data)
					end
				end

				self._try_again[slot] = true
			elseif is_progress_slot and self._backup_data then
				self:_ask_load_backup("progress_" .. error_type_str, false)

				return
			else
				dialog_data.text = managers.localization:text(error_msg, {
					VERSION = req_version
				})
				dialog_data.id = "savefile_new_safefile"

				function ok_button.callback_func()
					self:_remove(slot)
				end
			end

			managers.system_menu:show(dialog_data)
		else
			dialog_data.text = managers.localization:text("dialog_fail_load_game_corrupt")

			managers.system_menu:add_init_show(dialog_data)
		end
	elseif wrong_user then
		Global.savefile_manager.progress_wrong_user = true
		self._save_slots_to_load[slot] = nil

		if not self._queued_wrong_user then
			self._queued_wrong_user = true

			local dialog_data = {}

			dialog_data.title = managers.localization:text("dialog_information_title")
			dialog_data.text = managers.localization:text("dialog_load_wrong_user")
			dialog_data.id = "wrong_user"

			local ok_button = {}

			ok_button.text = managers.localization:text("dialog_ok")
			dialog_data.button_list = {
				ok_button
			}

			managers.system_menu:add_init_show(dialog_data)
		end
	else
		self._save_slots_to_load[slot] = nil
	end
end

function SavefileManager:_remove(slot, save_system)
	local task_data = {
		queued_in_save_manager = true,
		first_slot = slot,
		task_type = self.REMOVE_TASK_TYPE,
		user_index = managers.user:get_platform_id()
	}

	self:_check_task_save_system(task_data, save_system)

	self._save_slots_to_load[slot] = nil

	self:_on_task_queued(task_data)
	SaveGameManager:remove(task_data, callback(self, self, "clbk_result_remove"))
end

function SavefileManager:_load_cache(slot)
	local meta_data = self:_meta_data(slot)
	local cache = meta_data.cache
	local is_setting_slot = slot == self.SETTING_SLOT

	if not is_setting_slot then
		self:_set_current_game_cache_slot(slot)
	end

	if not cache then
		Application:error("[SavefileManager] _load_cache() - unable to load save file from slot \"" .. tostring(slot) .. "\"")
		Application:stack_dump()

		return
	end

	local version = cache.version or 0
	local version_name = cache.version_name

	if version > self.VERSION then
		return version_name
	end

	if is_setting_slot then
		managers.user:load(cache, version)
		managers.music:load_settings(cache, version)

		if _G.IS_VR then
			managers.vr:load(cache, version)
		end

		self:_set_setting_changed(false)
	else
		managers.blackmarket:load(cache, version)
		managers.upgrades:load(cache, version)
		managers.experience:load(cache, version)
		managers.player:load(cache, version)
		managers.money:load(cache, version)
		managers.statistics:load(cache, version)
		managers.event_jobs:load(cache, version)
		managers.skilltree:load(cache, version)
		managers.mission:load_job_values(cache, version)
		managers.job:load(cache, version)
		managers.dlc:load(cache, version)
		managers.infamy:load(cache, version)
		managers.features:load(cache, version)
		managers.gage_assignment:load(cache, version)
		managers.music:load_profile(cache, version)
		managers.challenge:load(cache, version)
		managers.multi_profile:load(cache, version)
		managers.ban_list:load(cache, version)
		managers.crimenet:load(cache, version)
		managers.custom_safehouse:load(cache, version)
		managers.butler_mirroring:load(cache, version)
		managers.mutators:load(cache, version)
		managers.tango:load(cache, version)
		managers.crime_spree:load(cache, version)
		managers.achievment:load(cache, version)
		managers.story:load(cache, version)
		managers.promo_unlocks:load(cache, version)
		managers.generic_side_jobs:load(cache, version)
		managers.skirmish:load(cache, version)
		managers.socialhub:load(cache, version)
	end
end

function SavefileManager:_meta_data(slot)
	local meta_data = Global.savefile_manager.meta_data_list[slot]

	if not meta_data then
		meta_data = {
			cache = nil,
			is_corrupt = false,
			is_synched_cache = false,
			is_synched_text = false,
			text = nil,
			slot = slot
		}
		Global.savefile_manager.meta_data_list[slot] = meta_data
	end

	return meta_data
end

function SavefileManager:_set_current_task_type(task_type)
	local old_task_type = self._current_task_type

	if old_task_type == task_type then
		return
	end

	self._current_task_type = task_type

	if task_type == self.IDLE_TASK_TYPE then
		self._active_changed_callback_handler:dispatch(false, task_type)
	elseif old_task_type == self.IDLE_TASK_TYPE then
		self._active_changed_callback_handler:dispatch(true, task_type)
	end

	local wall_time = self._timer:time()
	local show_gui_data = self.TASK_TYPES_GUI_LOOKUP[task_type]

	if show_gui_data and show_gui_data.text_id then
		local show = self._show_gui_time == nil and self._hide_gui_time == nil

		self._hide_gui_time = nil

		if show then
			self._workspace:show()
		end

		local old_check_t = self._show_gui_time_check
		local new_check_t = show_gui_data.check_time or 3

		self._show_gui_time_check = old_check_t and math.max(old_check_t, new_check_t) or new_check_t
		self._show_gui_time = wall_time

		self._gui_script:set_text(utf8.to_upper(managers.localization:text(show_gui_data.text_id)))

		if show then
			self._gui_script.indicator:animate(self._gui_script.saving)
		end
	elseif self._show_gui_time then
		if wall_time - self._show_gui_time > self._show_gui_time_check then
			self._hide_gui_time = wall_time
		else
			self._hide_gui_time = self._show_gui_time + self._show_gui_time_check
		end

		self._show_gui_time = nil
		self._show_gui_time_check = nil
	end
end

function SavefileManager:_set_current_game_cache_slot(current_game_cache_slot)
	local old_slot = Global.savefile_manager.current_game_cache_slot

	if old_slot == current_game_cache_slot then
		return
	end

	if old_slot then
		self:_set_cache(old_slot, nil)
	end

	Global.savefile_manager.current_game_cache_slot = current_game_cache_slot
end

function SavefileManager:_set_corrupt(slot, is_corrupt)
	local meta_data = self:_meta_data(slot)

	if not meta_data.is_corrupt ~= not is_corrupt then
		meta_data.is_corrupt = is_corrupt
	end
end

function SavefileManager:_set_synched_cache(slot, is_synched_cache)
	local meta_data = self:_meta_data(slot)

	if not meta_data.is_synched_cache ~= not is_synched_cache then
		meta_data.is_synched_cache = is_synched_cache
	end
end

function SavefileManager:_set_cache(slot, cache, force)
	local meta_data = self:_meta_data(slot)

	if meta_data.cache ~= cache then
		meta_data.cache = cache
	end
end

function SavefileManager:_set_setting_changed(setting_changed)
	if not Global.savefile_manager.setting_changed ~= not setting_changed then
		Global.savefile_manager.setting_changed = setting_changed
	end
end

function SavefileManager:_is_saving_progress_allowed()
	if not managers.user:is_signed_in(nil) then
		return false
	end

	if not managers.user:is_storage_selected(nil) then
		return false
	end

	if Global.savefile_manager.progress_wrong_user then
		return false
	end

	return true
end

function SavefileManager:_is_saving_setting_allowed(is_user_initiated_action)
	if not managers.user:is_signed_in(nil) then
		return false
	end

	if not Global.savefile_manager.setting_changed then
		return false
	elseif not is_user_initiated_action then
		local safe_time = Global.savefile_manager.safe_profile_save_time

		if safe_time then
			local wall_time = self._timer:time()

			if wall_time <= safe_time then
				return false
			else
				Global.savefile_manager.safe_profile_save_time = nil
			end
		end
	end

	return true
end

function SavefileManager:fetch_savegame_hdd_space_required()
	return self._savegame_hdd_space_required
end

function SavefileManager:_ask_load_vr_progress(has_progress, load_params)
	local dialog_data = {}

	dialog_data.title = managers.localization:text("dialog_error_title")

	local yes_button = {}

	yes_button.text = managers.localization:text("dialog_yes")

	local no_button = {}

	no_button.text = managers.localization:text("dialog_no")
	dialog_data.button_list = {
		yes_button,
		no_button
	}

	function yes_button.callback_func()
		self._save_slots_to_load[self.PROGRESS_SLOT] = nil

		self:_set_cache(self.PROGRESS_SLOT, self._vr_progress_data.save_data.data)

		self._vr_progress_data = nil

		self:_load_cache(self.PROGRESS_SLOT)
	end

	if has_progress then
		function no_button.callback_func()
			self._vr_progress_data = nil

			self:_load_done(self.PROGRESS_SLOT, unpack(load_params))
		end
	else
		function no_button.callback_func()
			self._vr_progress_data = nil
			self._save_slots_to_load[self.PROGRESS_SLOT] = nil
		end
	end

	dialog_data.text = managers.localization:text("dialog_ask_load_vr_beta_progress")

	managers.system_menu:show(dialog_data)
end

function SavefileManager:_ask_load_backup(reason, dialog_at_init, load_params)
	dialog_at_init = false

	local dialog_data = {}

	dialog_data.title = managers.localization:text("dialog_error_title")

	local yes_button = {}

	yes_button.text = managers.localization:text("dialog_yes")

	local no_button = {}

	no_button.text = managers.localization:text("dialog_no")
	dialog_data.button_list = {
		yes_button,
		no_button
	}

	function yes_button.callback_func()
		self._save_slots_to_load[self.PROGRESS_SLOT] = nil

		self:_set_cache(self.PROGRESS_SLOT, self._backup_data.save_data.data)

		self._backup_data = nil

		self:_load_cache(self.PROGRESS_SLOT)
	end

	function no_button.callback_func()
		self._backup_data = nil
		self._save_slots_to_load[self.PROGRESS_SLOT] = nil
	end

	if reason == "no_progress" or reason == "low_progress" then
		dialog_data.text = managers.localization:text("dialog_ask_load_progress_backup_low_lvl")

		if reason == "low_progress" then
			function no_button.callback_func()
				self._backup_data = nil

				self:_load_done(self.PROGRESS_SLOT, unpack(load_params))
			end
		end
	elseif reason == "progress_corrupt" or reason == "progress_wrong_version" then
		dialog_data.text = managers.localization:text("dialog_ask_load_progress_backup_" .. (reason == "progress_corrupt" and "corrupt" or "wrong_version"))

		function no_button.callback_func()
			self._backup_data = nil

			self:_remove(self.PROGRESS_SLOT)
		end
	end

	if dialog_at_init then
		managers.system_menu:add_init_show(dialog_data)
	else
		managers.system_menu:show(dialog_data)
	end
end

function SavefileManager:clbk_result_load_platform_setting_map(task_data, platform_setting_map)
	if not self:_on_task_completed(task_data) then
		return
	end

	local cache

	if platform_setting_map then
		cache = managers.user:get_setting_map()
	end

	self:_set_cache(self.SETTING_SLOT, cache)
	self:_load_done(self.SETTING_SLOT, false, nil, nil)
end

function SavefileManager:clbk_result_load(task_data, result_data)
	if not self:_on_task_completed(task_data) then
		return
	end

	if type_name(result_data) ~= "table" then
		Application:error("[SavefileManager] clbk_result_load() - result_data isn't a table as expected:", inspect(result_data))

		return
	end

	for slot, slot_data in pairs(result_data) do
		local status = slot_data.status
		local cache
		local wrong_user = status == "WRONG_USER"
		local wrong_version = status == "WRONG_VERSION"

		if status == "OK" or wrong_user then
			cache = slot_data.data
		elseif status == "FILE_NOT_FOUND" then
			cache = self:_save_cache(slot)
		end

		if cache and IS_PC and cache.version ~= self.VERSION then
			cache = nil
			wrong_version = true
		end

		local user_id = self:_get_userid_internal()

		if cache and IS_STEAM and cache.user_id ~= user_id then
			cache = nil
			wrong_user = true
		end

		self:_set_cache(slot, cache, nil)
		self:_load_done(slot, cache ~= nil, wrong_user, wrong_version)
	end
end

function SavefileManager:clbk_result_load_backup(task_data, result_data)
	if not self:_on_task_completed(task_data) then
		return
	end

	if type_name(result_data) ~= "table" then
		Application:error("[SavefileManager] clbk_result_load_backup() - result_data isn't a table as expected:", inspect(result_data))

		return
	end

	local slot_data = result_data[self.BACKUP_SLOT]

	if not slot_data then
		return
	end

	self._backup_data = false

	if slot_data.status ~= "OK" then
		Application:error("[SavefileManager] clbk_result_load_backup() - error status:", inspect(slot_data))

		return
	end

	local cache = slot_data.data

	if not cache then
		return
	end

	local version = cache.version or 0
	local version_name = cache.version_name
	local user_id = self:_get_userid_internal()

	if IS_STEAM and cache.user_id ~= user_id then
		-- Nothing
	elseif version <= self.VERSION then
		self._backup_data = {
			save_data = slot_data
		}
	else
		local str = "Wrong version. \"" .. tostring(version) .. "\". Must be equal or lower than \"" .. tostring(self.VERSION) .. "\""

		Application:error("[SavefileManager] clbk_result_load_backup() - " .. str)
	end
end

function SavefileManager:clbk_result_remove(task_data, result_data)
	if not self:_on_task_completed(task_data) then
		return
	end
end

function SavefileManager:clbk_result_iterate_savegame_slots(task_data, result_data)
	if not self:_on_task_completed(task_data) then
		return
	end

	self._save_slots_to_load = {}

	local found_progress_slot

	if type_name(result_data) == "table" then
		if result_data[self.SETTING_SLOT] then
			self._save_slots_to_load[self.SETTING_SLOT] = true

			self:load_settings()
		end

		if result_data[self.PROGRESS_SLOT] then
			self._save_slots_to_load[self.PROGRESS_SLOT] = true
			found_progress_slot = true

			self:load_progress()
		end
	else
		Application:error("[SavefileManager] clbk_result_iterate_savegame_slots() - result_data isn't a table as expected:", inspect(result_data))
	end

	if not found_progress_slot and self._backup_data then
		self._save_slots_to_load[self.PROGRESS_SLOT] = true

		self:_ask_load_backup("no_progress", true)
	end

	if not found_progress_slot and self._vr_progress_data then
		self._save_slots_to_load[self.PROGRESS_SLOT] = true

		self:_ask_load_vr_progress(false)
	end
end

function SavefileManager:clbk_result_save(task_data, result_data)
	if not self:_on_task_completed(task_data) then
		return
	end

	if type_name(result_data) ~= "table" then
		Application:error("[SavefileManager] clbk_result_save() - result_data isn't a table as expected:", inspect(result_data))

		return
	end

	for slot, slot_data in pairs(result_data) do
		local success = slot_data.status == "OK"

		self:_save_done(slot, false, task_data, slot_data, success)
	end
end

function SavefileManager:clbk_result_save_platform_setting(task_data, success)
	if not self:_on_task_completed(task_data) then
		return
	end

	self:_save_done(self.SETTING_SLOT, false, nil, nil, success)

	if not success then
		managers.menu:show_save_settings_failed()
		self:_set_setting_changed(false)
	end
end

function SavefileManager:clbk_result_space_required(task_data, result_data)
	if not self:_on_task_completed(task_data) then
		return
	end

	if type_name(result_data) ~= "table" then
		Application:error("[SavefileManager] clbk_result_space_required() - result_data isn't a table as expected:", inspect(result_data))

		return
	end

	if self.RESERVED_BYTES then
		self._savegame_hdd_space_required = (2 - table.size(result_data)) * self.RESERVED_BYTES / 1024
	end
end

SavefileInfo = SavefileInfo or class()

function SavefileInfo:init(slot, text)
	self._slot = slot
	self._text = text
end

function SavefileInfo:slot()
	return self._slot
end

function SavefileInfo:text()
	return self._text
end
