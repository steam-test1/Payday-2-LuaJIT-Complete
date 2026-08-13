CoreMaterialEditorRemote = CoreMaterialEditorRemote or class()
CoreMaterialEditorRemote.PORT = 11332
CoreMaterialEditorRemote.TEMP_PATH = "core/temp/"

function CoreMaterialEditorRemote:init()
	Network:bind(self.PORT, self)
end

function CoreMaterialEditorRemote:reload_shader_libs()
	Application:update_filesystem_index(self.TEMP_PATH .. "temp_rt.xml")
	Application:load_render_templates(self.TEMP_PATH .. "temp_rt.xml")

	if IS_WIN32 then
		if SystemInfo:renderer() == "DX10" then
			Application:update_filesystem_index(self.TEMP_PATH .. "temp_lib_win32dx10.diesel")
			Application:load_shader_config(self.TEMP_PATH .. "temp_lib_win32dx10")
		else
			Application:update_filesystem_index(self.TEMP_PATH .. "temp_lib_win32dx9.diesel")
			Application:load_shader_config(self.TEMP_PATH .. "temp_lib_win32dx9")
		end
	end
end
