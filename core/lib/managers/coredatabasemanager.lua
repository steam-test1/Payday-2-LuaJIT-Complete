core:module("CoreDatabaseManager")
core:import("CoreEngineAccess")
core:import("CoreApp")
core:import("CoreString")

DatabaseManager = DatabaseManager or class()
DatabaseManager.IDS_INDEX = Idstring("index")
DatabaseManager.IDS_TYPES = Idstring("indices/lookups/editor_types")

function DatabaseManager:list_unit_types()
	if self.__unit_types == nil then
		self:list_units_of_type("")

		self.__unit_types = {}

		for _, type in ipairs(self.__units_by_type) do
			self.__unit_types[type._meta] = true
		end
	end

	return self.__unit_types
end

function DatabaseManager:list_units_of_type(type)
	if self.__units_by_type == nil then
		self.__units_by_type = PackageManager:editor_load_script_data(self.IDS_INDEX, self.IDS_TYPES)
	end

	return self.__units_by_type[type] or {}
end

function DatabaseManager:list_entries_of_type(type, pattern)
	return self:list_entries_in_index(self:_type_index(type), pattern)
end

function DatabaseManager:list_entries_in_index(index, pattern)
	local entries = self:_entries_in_index(index)

	return pattern and table.find_all_values(entries, function(e)
		return string.find(e, pattern:s()) ~= nil
	end) or entries
end

function DatabaseManager:recompile(...)
	local files = {}

	for _, v in pairs({
		...
	}) do
		table.insert(files, self:entry_relative_path(v))
	end

	Application:data_compile({
		verbose = false,
		build_profile = Application:build_profile_path(),
		source_files = files
	})
	DB:reload()
	self:clear_all_cached_indices()
end

function DatabaseManager:clear_cached_index(index)
	if self.__entries then
		self.__entries[index] = nil
	end

	if index == self:_type_index("unit") then
		self.__unit_types = nil
		self.__units_by_type = nil
	end
end

function DatabaseManager:clear_all_cached_indices()
	self.__entries = nil
	self.__unit_types = nil
	self.__units_by_type = nil
end

function DatabaseManager:root_path()
	local path = Application:project_path()

	path = Application:nice_path(path, true)

	local f

	function f(s)
		local str, i = string.gsub(s, "\\[%w_%.%s]+\\%.%.", "")

		return i > 0 and f(str) or str
	end

	return f(path)
end

function DatabaseManager:base_path()
	return self:root_path() .. "assets\\"
end

function DatabaseManager:is_valid_database_path(path)
	return string.begins(Application:nice_path(path, true):lower(), Application:nice_path(self:base_path(), true):lower())
end

function DatabaseManager:entry_name(path)
	return string.match(self:entry_path(path), "([^/]*)$")
end

function DatabaseManager:entry_type(path)
	if not string.find(path, "%.") then
		return nil
	end

	return string.match(path, "([^.]*)$")
end

function DatabaseManager:entry_path(path)
	path = string.match(string.gsub(path, ".*assets[/\\]", ""), "([^.]*)")
	path = string.gsub(path, "[/\\]+", "/")

	return path
end

function DatabaseManager:entry_path_with_properties(path)
	path = string.gsub(path, ".*assets[/\\]", "")
	path = string.gsub(path, "%.%w-$", "")
	path = string.gsub(path, "[/\\]+", "/")

	return path
end

function DatabaseManager:entry_relative_path(path)
	path = string.gsub(path, ".*assets[/\\]", "")
	path = string.gsub(path, "[/\\]+", "/")

	return path
end

function DatabaseManager:entry_expanded_path(type, entry_path, prop)
	local properties = prop or ""
	local path = string.gsub(self:base_path() .. entry_path .. properties .. "." .. type, "/", "\\")

	return path
end

function DatabaseManager:entry_expanded_directory(entry_path)
	local path = string.gsub(self:base_path() .. entry_path, "/", "\\")

	return path
end

function DatabaseManager:load_node_dialog(parent, file_pattern, start_path)
	local path = self:open_file_dialog(parent, file_pattern, start_path)
	local node = path and self:load_node(path)

	return node, path
end

function DatabaseManager:open_file_dialog(parent, file_pattern, start_path)
	local path = start_path or self:base_path()
	local pattern = file_pattern or "*.*"
	local file_dialog = EWS:FileDialog(parent, "Choose file", path, "", pattern, "OPEN,FILE_MUST_EXIST")

	if file_dialog:show_modal() then
		return file_dialog:get_path(), file_dialog:get_directory()
	end
end

function DatabaseManager:save_file_dialog(parent, new, file_pattern, start_path, save_outside_project)
	local pattern = file_pattern or "*.*"
	local path = start_path or self:base_path()
	local name, new_file = "", ""

	if start_path then
		name = self:entry_name(start_path)
	end

	if new then
		new_file = "new file "
	end

	local save_dialog = EWS:FileDialog(parent, "Save " .. new_file .. "as..", path, name, file_pattern, "SAVE")

	if save_dialog:show_modal() then
		local new_path = save_dialog:get_path()

		if save_outside_project or self:is_valid_database_path(new_path) then
			return new_path, save_dialog:get_directory()
		else
			EWS:MessageDialog(parent, "Invalid path. Cannot save outside of the project.", "Error", "OK,ICON_ERROR"):show_modal()
		end
	end

	return nil, nil
end

function DatabaseManager:load_node(path)
	if self:has(path) then
		local file = SystemFS:open(path, "r")
		local content = file:read()

		file:close()

		return Node.from_xml(content)
	end

	return nil
end

function DatabaseManager:save_node(node, path)
	local file = assert(SystemFS:open(path, "w"))

	file:write(node:to_xml())
	file:close()
end

function DatabaseManager:delete(path)
	return SystemFS:delete_file(path)
end

function DatabaseManager:has(path)
	return SystemFS:exists(path)
end

function DatabaseManager:_entries_in_index(index)
	local result = self.__entries and self.__entries[index]

	if result == nil then
		result = self:_parse_entries_in_index(index)
		self.__entries = self.__entries or {}
		self.__entries[index] = result
	end

	return result
end

function DatabaseManager:_type_index(type)
	return string.format("indices/types/%s", type:s())
end

function DatabaseManager:_parse_entries_in_index(index)
	if not DB:has("index", index) then
		return {}
	end

	local file = PackageManager:editor_load_script_data(self.IDS_INDEX, Idstring(index))

	return file
end
