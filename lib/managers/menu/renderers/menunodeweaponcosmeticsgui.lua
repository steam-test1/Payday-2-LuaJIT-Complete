MenuNodeSkinEditorGui = MenuNodeSkinEditorGui or class(MenuNodeGui)

function MenuNodeSkinEditorGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 1
	parameters.to_upper = true

	MenuNodeSkinEditorGui.super.init(self, node, layer, parameters)
end

function MenuNodeSkinEditorGui:mouse_pressed(button, x, y)
	if button == Idstring("1") then
		local row_item = self._highlighted_item and self:row_item(self._highlighted_item)

		if row_item and row_item.gui_panel and row_item.gui_panel:inside(x, y) then
			local key = self._highlighted_item:parameters().key or self._highlighted_item:name()
			local vector = self._highlighted_item:parameters().vector

			if key == "pattern_tweak" then
				self._highlighted_item:set_value(vector == 2 and 0 or 1)
			elseif key == "pattern_pos" then
				self._highlighted_item:set_value(0)
			elseif key == "wear_and_tear" then
				self._highlighted_item:set_value(1)
			elseif key == "uv_scale" then
				self._highlighted_item:set_value(19)
			elseif key == "uv_offset_rot" then
				self._highlighted_item:set_value(0)
			elseif key == "cubemap_pattern_control" then
				self._highlighted_item:set_value(0)
			else
				return
			end

			MenuCallbackHandler:weapon_skin_changed(self._highlighted_item)
		end
	end
end
