require("lib/managers/menu/renderers/MenuNodeBaseGui")

MenuNodeMultiProfileSwitchGui = MenuNodeMultiProfileSwitchGui or class(MenuNodeBaseGui)
MenuNodeMultiProfileSwitchGui.MENU_WIDTH = 430
MenuNodeMultiProfileSwitchGui.PROFILE_WIDTH = 300
MenuNodeMultiProfileSwitchGui.PROFILE_HEIGHT = 610
MenuNodeMultiProfileSwitchGui.PADDING = 10
MenuNodeMultiProfileSwitchGui.WIDTH = MenuNodeMultiProfileSwitchGui.MENU_WIDTH + MenuNodeMultiProfileSwitchGui.PROFILE_WIDTH + MenuNodeMultiProfileSwitchGui.PADDING
MenuNodeMultiProfileSwitchGui.HEIGHT = 652
MenuNodeMultiProfileSwitchGui.PREVIEW_BOX_SIZE = 135
MenuNodeMultiProfileSwitchGui.PREVIEW_BOX_PADDING = 6
MenuNodeMultiProfileSwitchGui.PERK_DECK_X = 0.7
local IDS_1 = Idstring("1")

function MenuNodeMultiProfileSwitchGui:init(node, layer, parameters)
	parameters.font = tweak_data.menu.pd2_small_font
	parameters.font_size = tweak_data.menu.pd2_small_font_size
	parameters.legends_font = tweak_data.menu.pd2_medium_font
	parameters.legends_font_size = tweak_data.menu.pd2_medium_font_size
	parameters.align = "left"
	parameters.row_item_blend_mode = "add"
	parameters.row_item_color = tweak_data.screen_colors.button_stage_3
	parameters.row_item_hightlight_color = tweak_data.screen_colors.button_stage_2
	parameters.marker_alpha = 1
	parameters.to_upper = true
	parameters._align_line_proportions = 0.64
	self.static_y = node:parameters().static_y

	MenuNodeMultiProfileSwitchGui.super.init(self, node, layer, parameters)
end

function MenuNodeMultiProfileSwitchGui:_setup_panels(node)
	MenuNodeMultiProfileSwitchGui.super._setup_panels(self, node)

	local fullscreen_ws = managers.menu_component:fullscreen_ws()
	self._fullscreen_panel = fullscreen_ws:panel():panel({
		layer = 50
	})

	self._fullscreen_panel:rect({
		name = "bg",
		alpha = 0.4,
		color = Color.black
	})
	self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "blur",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		w = self._fullscreen_panel:w(),
		h = self._fullscreen_panel:h()
	})
end

function MenuNodeMultiProfileSwitchGui:setup()
	MenuNodeMultiProfileSwitchGui.super.setup(self)
	managers.menu_component:disable_inventory_gui()
	managers.menu_component:hide_mission_briefing_gui()
	managers.menu_component:post_event("menu_enter")
end

function MenuNodeMultiProfileSwitchGui:_setup_item_panel_parent(safe_rect, shape)
	local x = safe_rect.x + safe_rect.width / 2 - self.WIDTH / 2 + self.PADDING
	local y = safe_rect.y + safe_rect.height / 2 - self.HEIGHT / 2
	shape = shape or {}
	shape.x = shape.x or x
	shape.y = shape.y or y
	shape.w = shape.w or self.MENU_WIDTH
	shape.h = shape.h or self.HEIGHT

	MenuNodeMultiProfileSwitchGui.super._setup_item_panel_parent(self, safe_rect, shape)
end

function MenuNodeMultiProfileSwitchGui:_setup_item_panel(safe_rect, res)
	MenuNodeMultiProfileSwitchGui.super._setup_item_panel(self, safe_rect, res)
	self.item_panel:set_w(self.MENU_WIDTH)
	self.item_panel:set_center(self._item_panel_parent:w() / 2, self._item_panel_parent:h() / 2)

	for _, child in ipairs(self.item_panel:children()) do
		child:set_halign("left")
	end

	local static_y = self.static_y and safe_rect.height * self.static_y

	if static_y and static_y < self.item_panel:y() then
		self.item_panel:set_y(static_y)
	end

	self.rec_round_object(self.item_panel)
	self.item_panel:set_position(self.item_panel:x(), self.item_panel:y())

	if alive(self.box_panel) then
		self._item_panel_parent:remove(self.box_panel)

		self.box_panel = nil
	end

	self.box_panel = self._item_panel_parent:panel({
		name = "box_panel",
		layer = 51,
		x = -self.PADDING,
		y = -self.PADDING,
		w = self.WIDTH + self.PADDING * 2,
		h = self.HEIGHT + self.PADDING * 2
	})
	self.boxgui = BoxGuiObject:new(self.box_panel, {
		layer = 1000,
		sides = {
			1,
			1,
			1,
			1
		}
	})

	self.boxgui:set_clipping(false)
	self.box_panel:rect({
		rotation = 360,
		color = tweak_data.screen_colors.dark_bg
	})

	if self._back_row_item and alive(self._back_row_item.gui_text) then
		self._back_row_item.gui_text:set_w(self.PROFILE_WIDTH)
		self._back_row_item.gui_text:set_world_right(math.round(self.box_panel:world_right() - self.PADDING))
		self._back_row_item.gui_text:set_world_bottom(math.round(self.box_panel:world_bottom() - self.PADDING))
	end

	self._align_data.panel:set_left(self.item_panel:left())
	self._list_arrows.up:set_world_left(self._align_data.panel:world_left())
	self._list_arrows.up:set_world_top(self._align_data.panel:world_top())
	self._list_arrows.up:set_width(self.MENU_WIDTH)
	self._list_arrows.up:set_rotation(360)
	self._list_arrows.up:set_layer(1050)
	self._list_arrows.down:set_world_left(self._align_data.panel:world_left())
	self._list_arrows.down:set_world_bottom(self._align_data.panel:world_bottom())
	self._list_arrows.down:set_width(self.MENU_WIDTH)
	self._list_arrows.down:set_rotation(360)
	self._list_arrows.down:set_layer(1050)
	self:_set_topic_position()
	self:_layout_legends()
	self:_layout_preview()
end

function MenuNodeMultiProfileSwitchGui:_create_legends(node)
	local safe_rect_pixels = self:_scaled_size()

	if alive(self._legends_panel) then
		self.ws:panel():remove(self._legends_panel)
	end

	self._legends_panel = self.ws:panel():panel({
		name = "legend_panel",
		layer = 100,
		x = safe_rect_pixels.x,
		y = safe_rect_pixels.y,
		w = safe_rect_pixels.width,
		h = safe_rect_pixels.height
	})

	if managers.menu:is_pc_controller() then
		self._legends = {}
		local panel = self._legends_panel:panel({
			visible = false,
			name = "select"
		})
		local icon = panel:bitmap({
			texture = "guis/textures/pd2/mouse_buttons",
			name = "icon",
			h = 18,
			blend_mode = "add",
			w = 13,
			texture_rect = {
				1,
				1,
				17,
				23
			}
		})
		local text = panel:text({
			name = "text",
			blend_mode = "add",
			text = managers.localization:to_upper_text("menu_mouse_select"),
			font = tweak_data.menu.pd2_tiny_font,
			font_size = tweak_data.menu.pd2_tiny_font_size,
			color = tweak_data.screen_colors.text
		})

		self.make_fine_text(text)
		text:set_left(icon:right() + 2)
		text:set_center_y(icon:center_y())
		panel:set_w(text:right())
		panel:set_h(text:bottom())

		self._legends.select = panel
		local panel = self._legends_panel:panel({
			visible = false,
			name = "move"
		})
		local icon = panel:bitmap({
			texture = "guis/textures/pd2/mouse_buttons",
			name = "icon",
			h = 18,
			blend_mode = "add",
			w = 13,
			texture_rect = {
				18,
				1,
				17,
				23
			}
		})
		local text = panel:text({
			name = "text",
			blend_mode = "add",
			text = managers.localization:to_upper_text("menu_mouse_start_move"),
			font = tweak_data.menu.pd2_tiny_font,
			font_size = tweak_data.menu.pd2_tiny_font_size,
			color = tweak_data.screen_colors.text
		})

		self.make_fine_text(text)
		text:set_left(icon:right() + 2)
		text:set_center_y(icon:center_y())
		panel:set_w(text:right())
		panel:set_h(text:bottom())

		self._legends.move = panel
	else
		local text = self._legends_panel:text({
			blend_mode = "add",
			name = "text",
			layer = 100,
			align = "right",
			text = "TEXT",
			halign = "grow",
			valign = "grow",
			font = tweak_data.menu.pd2_tiny_font,
			font_size = tweak_data.menu.pd2_tiny_font_size,
			color = tweak_data.screen_colors.text
		})
	end
end

function MenuNodeMultiProfileSwitchGui:_layout_legends(...)
	self._legends_panel:set_size(self.WIDTH, self.HEIGHT)

	if alive(self.box_panel) then
		self._legends_panel:set_world_top(self.box_panel:world_top() + self.PADDING)
		self._legends_panel:set_world_left(self.box_panel:world_left() + self.PADDING)
	end
end

function MenuNodeMultiProfileSwitchGui:_update_legends(row_item)
	local show_move = row_item.name and not row_item.item:parameters().previous_node
	local show_select = not self._moving_profile

	if managers.menu:is_pc_controller() then
		local x = self._legends_panel:w()
		local padding = 10

		if alive(self._legends.move) then
			local move_text_id = self._moving_profile and "menu_mouse_end_move" or "menu_mouse_start_move"
			local text_item = self._legends.move:child("text")

			text_item:set_text(managers.localization:to_upper_text(move_text_id))
			self.make_fine_text(text_item)
			self._legends.move:set_w(text_item:right())
			self._legends.move:set_visible(show_move)
			self._legends.move:set_right(x)

			if show_move then
				x = self._legends.move:left() - padding or x
			end
		end

		if alive(self._legends.select) then
			self._legends.select:set_visible(show_select)
			self._legends.select:set_right(x)
		end
	else
		local legends = {}

		if show_select then
			table.insert(legends, "menu_legend_select")
		end

		if show_move then
			local move_text_id = self._moving_profile and "menu_legend_end_move" or "menu_legend_start_move"

			table.insert(legends, move_text_id)
		end

		local legend_text = ""

		for i, legend in ipairs(legends) do
			local spacing = i > 1 and "  |  " or ""
			local legend = managers.localization:to_upper_text(legend, {
				BTN_UPDATE = managers.localization:btn_macro("menu_update"),
				BTN_BACK = managers.localization:btn_macro("back")
			})
			legend_text = legend_text .. spacing .. legend
		end

		self._legends_panel:child("text"):set_text(legend_text)
	end
end

function MenuNodeMultiProfileSwitchGui:_layout_preview()
	local ws_panel = self.ws:panel()
	local box_padding = self.PREVIEW_BOX_PADDING
	self._preview_boxes = {}

	if alive(self._back_legend) then
		ws_panel:remove(self._back_legend)
	end

	if not managers.menu:is_pc_controller() then
		self._back_legend = ws_panel:text({
			name = "back_legend",
			vertical = "bottom",
			align = "right",
			blend_mode = "add",
			layer = 100,
			x = self._legends_panel:x(),
			y = self._legends_panel:y(),
			w = self.WIDTH,
			h = self.HEIGHT,
			text = managers.localization:text("menu_legend_back"),
			font = tweak_data.menu.pd2_small_font,
			font_size = tweak_data.menu.pd2_small_font_size,
			color = tweak_data.screen_colors.text
		})
	end

	if alive(self._preview_panel) then
		ws_panel:remove(self._preview_panel)
	end

	self._preview_panel = ws_panel:panel({
		name = "preview_panel",
		layer = 54,
		x = self.item_panel:world_right() + self.PADDING,
		w = self.PROFILE_WIDTH,
		h = self.PROFILE_HEIGHT
	})

	self._preview_panel:set_world_top(self._item_panel_parent:world_top() + tweak_data.menu.pd2_small_font_size + box_padding)

	self._profile_title = self._preview_panel:text({
		text = "Profile",
		name = "profile_title",
		blend_mode = "add",
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text
	})

	self.make_fine_text(self._profile_title)
	self._profile_title:set_right(self._preview_panel:w())

	local skils_panel = self._preview_panel:panel({
		name = "skills_panel",
		y = self._profile_title:bottom(),
		w = self._preview_panel:w(),
		h = self.PREVIEW_BOX_SIZE + box_padding
	})

	BoxGuiObject:new(skils_panel, {
		sides = {
			1,
			1,
			2,
			2
		}
	})
	skils_panel:rect({
		alpha = 0.5,
		color = tweak_data.screen_colors.dark_bg
	})
	self:_create_skills_box(skils_panel)

	local weapons_panel = self._preview_panel:panel({
		name = "weapons_panel",
		y = skils_panel:bottom() + box_padding,
		w = self.PREVIEW_BOX_SIZE + box_padding * 2,
		h = 3 * self.PREVIEW_BOX_SIZE + box_padding * 2 + box_padding * 2
	})

	BoxGuiObject:new(weapons_panel, {
		sides = {
			1,
			1,
			2,
			2
		}
	})
	weapons_panel:rect({
		alpha = 0.5,
		color = tweak_data.screen_colors.dark_bg
	})

	local primary_box = self:_create_preview_box(weapons_panel, {
		weapon = true,
		name = "primary",
		perks = true,
		y = box_padding
	})
	local secondary_box = self:_create_preview_box(weapons_panel, {
		weapon = true,
		name = "secondary",
		perks = true,
		y = primary_box.panel:bottom() + box_padding
	})
	local melee_box = self:_create_preview_box(weapons_panel, {
		name = "melee",
		perks = true,
		y = secondary_box.panel:bottom() + box_padding
	})
	local gear_panel = self._preview_panel:panel({
		x = weapons_panel:right() + box_padding,
		y = skils_panel:bottom() + box_padding,
		w = self.PREVIEW_BOX_SIZE + box_padding * 2,
		h = 3 * self.PREVIEW_BOX_SIZE + box_padding * 2 + box_padding * 2
	})

	gear_panel:rect({
		alpha = 0.5,
		color = tweak_data.screen_colors.dark_bg
	})
	BoxGuiObject:new(gear_panel, {
		sides = {
			1,
			1,
			2,
			2
		}
	})

	local armor_box = self:_create_preview_box(gear_panel, {
		secondary = true,
		name = "armor",
		y = box_padding
	})
	local deployable_box = self:_create_preview_box(gear_panel, {
		icon_scale = 0.92,
		name = "deployable",
		secondary = true,
		y = armor_box.panel:bottom() + box_padding
	})
	local throwable_box = self:_create_preview_box(gear_panel, {
		name = "throwable",
		y = deployable_box.panel:bottom() + box_padding
	})
end

function MenuNodeMultiProfileSwitchGui:_create_menu_item(row_item)
	MenuNodeMultiProfileSwitchGui.super._create_menu_item(self, row_item)

	if row_item.type == "divider" and row_item.name == "divider_title" then
		-- Nothing
	elseif row_item.type ~= "divider" and row_item.name ~= "back" then
		local perk_text = ""
		local perk_data = nil

		if row_item.name == managers.multi_profile:current_profile_index() then
			local skillset = managers.skilltree:get_selected_skill_switch()
			local switch_data = Global.skilltree_manager.skill_switches[skillset]

			if switch_data then
				local perk_deck = managers.skilltree:digest_value(switch_data.specialization, false, 0)
				perk_data = tweak_data.skilltree.specializations[perk_deck]
			end
		else
			local profile = managers.multi_profile:profile(row_item.name)
			perk_data = tweak_data.skilltree.specializations[profile and profile.perk_deck]
		end

		if perk_data then
			perk_text = managers.localization:to_upper_text(perk_data.name_id)
		end

		row_item.perk_deck_gui = row_item.gui_panel:parent():text({
			name = "perk_text",
			alpha = 1,
			blend_mode = "add",
			layer = 52,
			text = perk_text,
			font = self.small_font,
			font_size = self.small_font_size
		})

		row_item.perk_deck_gui:set_shape(row_item.gui_panel:shape())
		row_item.perk_deck_gui:grow(-row_item.perk_deck_gui:w() * self.PERK_DECK_X, 0)
	end
end

function MenuNodeMultiProfileSwitchGui:_clear_gui()
	for _, row_item in ipairs(self.row_items) do
		if alive(row_item.perk_deck_gui) then
			row_item.gui_panel:parent():remove(row_item.perk_deck_gui)
		end
	end

	if alive(self._preview_panel) then
		self.item_panel:parent():remove(self._preview_panel)
	end

	MenuNodeMultiProfileSwitchGui.super._clear_gui(self)
end

function MenuNodeMultiProfileSwitchGui:_highlight_row_item(row_item, mouse_over)
	self._selected_item = row_item.name and not row_item.item:parameters().previous_node and row_item or nil

	MenuNodeMultiProfileSwitchGui.super._highlight_row_item(self, row_item, mouse_over)
	self:_update_legends(row_item)

	if alive(row_item.perk_deck_gui) then
		row_item.perk_deck_gui:set_color(row_item.color)
	end

	if self._selected_item and not self._moving_profile then
		local profile_index = self._selected_item.name
		local profile = managers.multi_profile:profile(profile_index)

		self:_update_profile_preview(profile_index, profile)
	end
end

function MenuNodeMultiProfileSwitchGui:_fade_row_item(row_item)
	MenuNodeMultiProfileSwitchGui.super._fade_row_item(self, row_item)

	if alive(row_item.perk_deck_gui) then
		row_item.perk_deck_gui:set_color(row_item.color)
	end
end

function MenuNodeMultiProfileSwitchGui:_set_item_positions()
	MenuNodeMultiProfileSwitchGui.super._set_item_positions(self)

	for _, row_item in ipairs(self.row_items) do
		if alive(row_item.perk_deck_gui) then
			row_item.perk_deck_gui:set_x(self.item_panel:w() * self.PERK_DECK_X)
			row_item.perk_deck_gui:set_y(row_item.gui_panel:y())
		end
	end
end

function MenuNodeMultiProfileSwitchGui:reload_item(item)
	MenuNodeMultiProfileSwitchGui.super.reload_item(self, item)

	local row_item = self:row_item(item)

	if row_item and alive(row_item.gui_panel) then
		row_item.gui_panel:set_halign("right")
		row_item.gui_panel:set_right(self.item_panel:w())

		if alive(row_item.perk_deck_gui) then
			row_item.perk_deck_gui:set_x(self.item_panel:w() * self.PERK_DECK_X)
			row_item.perk_deck_gui:set_y(row_item.gui_panel:y())
		end
	end
end

function MenuNodeMultiProfileSwitchGui:_reload_item(item)
	MenuNodeMultiProfileSwitchGui.super._reload_item(self, item)

	local row_item = self:row_item(item)

	if alive(row_item.perk_deck_gui) then
		row_item.perk_deck_gui:set_color(row_item.color)
	end
end

function MenuNodeMultiProfileSwitchGui:gui_node_custom(row_item)
	row_item.gui_panel = self._item_panel_parent:panel({
		w = 3,
		h = 3,
		layer = self.layers.items
	})
	row_item.gui_pd2_panel = self.ws:panel():panel({
		layer = self.layers.items
	})
	row_item.gui_text = row_item.gui_pd2_panel:text({
		vertical = "bottom",
		align = "right",
		blend_mode = "add",
		text = utf8.to_upper(row_item.text),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.button_stage_3
	})

	self.make_fine_text(row_item.gui_text)

	self._back_row_item = row_item
end

function MenuNodeMultiProfileSwitchGui:_align_marker(row_item)
	MenuNodeMultiProfileSwitchGui.super._align_marker(self, row_item)

	if self.marker_color then
		self._marker_data.gradient:set_color(row_item.item:enabled() and self.marker_color or self.marker_disabled_color or row_item.disabled_color)
	end

	if row_item.item:parameters().previous_node then
		self._marker_data.marker:set_w(self.PROFILE_WIDTH)
		self._marker_data.gradient:set_w(self._marker_data.marker:w())
		self._marker_data.marker:set_world_right(row_item.gui_text:world_right())
		self._marker_data.marker:set_world_center_y(row_item.gui_text:center_y())

		return
	end

	self._marker_data.marker:set_world_right(self.item_panel:world_right())
end

function MenuNodeMultiProfileSwitchGui:_create_preview_box(parent, params)
	if not params then
		return
	end

	local name = params.name
	local x = params.x or 0
	local y = params.y or 0
	local w = params.w or self.PREVIEW_BOX_SIZE
	local h = params.h or self.PREVIEW_BOX_SIZE
	local padding = params.padding or self.PREVIEW_BOX_PADDING
	local layer = params.layer or 5

	if not name or self._preview_boxes[name] then
		return
	end

	local preview_panel = parent:panel({
		name = name,
		x = x,
		y = y,
		w = w,
		h = h,
		layer = layer
	})

	preview_panel:set_center_x(parent:w() / 2)

	local item_text = preview_panel:text({
		text = "TEXT",
		name = "text",
		blend_mode = "add",
		layer = 2,
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text
	})

	self.make_fine_text(item_text)

	local icon_panel_w = preview_panel:w()
	local icon_panel_h = preview_panel:h() - item_text:h()

	if params.icon_scale then
		icon_panel_w = icon_panel_w * params.icon_scale
		icon_panel_h = icon_panel_h * params.icon_scale
	end

	local icon_panel = preview_panel:panel({
		w = icon_panel_w,
		h = icon_panel_h
	})

	icon_panel:set_center(preview_panel:w() / 2, preview_panel:h() / 2 + item_text:h() / 2)

	local item_icon = icon_panel:bitmap({
		texture = "guis/textures/pd2/endscreen/what_is_this",
		name = "icon",
		layer = 1
	})

	item_icon:set_center(icon_panel:w() / 2, icon_panel:h() / 2)

	local box = {
		name = name,
		padding = padding,
		panel = preview_panel,
		text = item_text,
		icon_panel = icon_panel,
		icon = item_icon
	}

	if params.secondary then
		box.dual_icon = icon_panel:bitmap({
			texture = "guis/textures/pd2/endscreen/what_is_this",
			name = "dual_icon",
			visible = false,
			layer = 1
		})
	elseif params.weapon then
		box.background = icon_panel:bitmap({
			texture = "guis/textures/pd2/endscreen/what_is_this",
			name = "background",
			blend_mode = "add"
		})
	end

	if params.perks then
		box.perks_panel = icon_panel:panel({
			name = "perks_panel",
			w = icon_panel_w,
			h = icon_panel_h
		})
	end

	self._preview_boxes[name] = box

	return box
end

function MenuNodeMultiProfileSwitchGui:_create_skills_box(parent)
	local padding = self.PREVIEW_BOX_PADDING
	local inner_panel = parent:panel({
		name = "inner_panel",
		layer = 5,
		x = padding * 2,
		y = padding * 2,
		w = parent:w() - padding * 4,
		h = parent:h() - padding * 4
	})
	local skillset_panel = inner_panel:panel({
		name = "skillset_panel",
		w = inner_panel:w() * 0.6,
		h = inner_panel:h() / 2
	})
	local skillset_box = BoxGuiObject:new(skillset_panel, {
		sides = {
			0,
			2,
			0,
			2
		}
	})

	skillset_box:set_color(tweak_data.screen_colors.achievement_grey)

	local skillset_text = skillset_panel:text({
		text = "My Cool Skill Build",
		name = "text",
		blend_mode = "add",
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = tweak_data.screen_colors.text
	})

	self.make_fine_text(skillset_text)

	local skill_points_text = skillset_panel:text({
		text = "100 POINTS AVAILABLE",
		name = "skill_points_text",
		blend_mode = "add",
		y = skillset_text:bottom() + padding,
		font = tweak_data.menu.pd2_tiny_font,
		font_size = tweak_data.menu.pd2_tiny_font_size,
		color = tweak_data.screen_colors.achievement_grey
	})

	self.make_fine_text(skill_points_text)

	local perk_panel = inner_panel:panel({
		name = "perkdeck_panel",
		y = skillset_panel:bottom(),
		w = skillset_panel:w(),
		h = skillset_panel:h()
	})
	local perkdeck_box = BoxGuiObject:new(perk_panel, {
		sides = {
			0,
			2,
			0,
			0
		}
	})

	perkdeck_box:set_color(tweak_data.screen_colors.achievement_grey)

	local perk_icon = perk_panel:bitmap({
		name = "perk_icon",
		texture = "guis/textures/pd2/inv_skillcards_icons",
		w = perk_panel:h() - padding,
		h = perk_panel:h() - padding
	})

	perk_icon:set_center_y(perk_panel:h() / 2)

	local perk_text = perk_panel:text({
		text = "Generic Perk",
		name = "text",
		blend_mode = "add",
		x = perk_icon:right() + padding,
		y = padding,
		font = tweak_data.menu.pd2_medium_font,
		font_size = tweak_data.menu.pd2_medium_font_size,
		color = tweak_data.screen_colors.text
	})

	self.make_fine_text(perk_text)

	self._preview_boxes.perk_deck = {
		panel = perk_panel,
		text = perk_text,
		icon = perk_icon
	}
	local skillpoints_panel = inner_panel:panel({
		name = "skillpoints_panel",
		w = inner_panel:w() - skillset_panel:w(),
		h = inner_panel:h()
	})

	skillpoints_panel:set_right(inner_panel:w())

	local skilltrees = {}
	local previous_icon = nil

	for index in ipairs(tweak_data.skilltree.skill_pages_order) do
		local tree_icon = skillpoints_panel:bitmap({
			texture = "guis/textures/pd2/inv_skillcards_icons",
			name = "icon_" .. index,
			x = padding,
			y = padding / 2,
			texture_rect = {
				(index - 1) * 24,
				0,
				22,
				31
			}
		})

		tree_icon:set_size(tree_icon:w() * 0.56, tree_icon:h() * 0.56)

		if previous_icon then
			tree_icon:set_y(previous_icon:bottom() + padding)
		end

		local text_panel = skillpoints_panel:panel({
			name = "text_panel",
			x = tree_icon:right() + padding,
			y = tree_icon:y(),
			w = skillpoints_panel:w() - (tree_icon:right() + padding * 2),
			h = tree_icon:h()
		})
		local segment_w = text_panel:w() / 3

		for i = 1, 3 do
			local tree_text = text_panel:text({
				text = "00",
				align = "center",
				blend_mode = "add",
				layer = 2,
				name = "text_" .. index,
				font = tweak_data.menu.pd2_small_font,
				font_size = tweak_data.menu.pd2_small_font_size,
				color = tweak_data.screen_colors.text
			})

			self.make_fine_text(tree_text)
			tree_text:set_x(segment_w * (i - 1))
			tree_text:set_center_y(text_panel:h() / 2)
			tree_text:set_w(segment_w)
			table.insert(skilltrees, tree_text)
		end

		previous_icon = tree_icon
	end

	self._preview_boxes.skillset = {
		text = skillset_text,
		points_text = skill_points_text,
		skilltrees = skilltrees
	}
end

function MenuNodeMultiProfileSwitchGui:_update_preview_box(box, params)
	if not box then
		return
	end

	params = params or {}
	local text = params.text or managers.localization:to_upper_text("menu_loadout_empty")
	local text_color = params.text_color or tweak_data.screen_colors.text
	local texture = params.texture or "guis/textures/pd2/add_icon"
	local texture_rect = params.texture_rect or {}
	local dual_texture = params.dual_texture
	local dual_texture_rect = params.dual_texture_rect or {}
	local bg_texture = params.bg_texture
	local bg_texture_rect = params.bg_texture_rect or {}
	local perks = params.perks
	local text_item = box.text
	local icon_item = box.icon
	local dual_icon_item = box.dual_icon
	local bg_item = box.background
	local perks_panel = box.perks_panel
	local font_size = tweak_data.menu.pd2_small_font_size

	text_item:stop()
	text_item:set_x(0)
	text_item:set_text(text)
	text_item:set_font_size(font_size)
	text_item:set_color(text_color)
	text_item:show()
	self.make_fine_text(text_item)

	local max_width = box.panel:w() - box.padding * 2
	local current_width = text_item:w()

	if max_width < current_width then
		local scale = max_width / current_width

		if scale > 0.5 then
			text_item:set_font_size(font_size * scale)
			self.make_fine_text(text_item)
		else
			text_item:animate(callback(self, self, "_animate_scroll_text"))
		end
	end

	if texture and DB:has(Idstring("texture"), texture) then
		local item_parent = icon_item:parent()
		local panel_width = item_parent:w()
		local panel_height = item_parent:h()

		if dual_texture then
			panel_width = panel_width / 2
		end

		icon_item:set_image(texture, unpack(texture_rect))

		local texture_width = texture_rect and texture_rect[3] or icon_item:texture_width()
		local texture_height = texture_rect and texture_rect[4] or icon_item:texture_height()
		local aspect = panel_width / panel_height
		local sw = math.max(texture_width, texture_height * aspect)
		local sh = math.max(texture_height, texture_width / aspect)
		local dw = texture_width / sw
		local dh = texture_height / sh

		icon_item:set_size(math.round(dw * panel_width), math.round(dh * panel_height))
		icon_item:set_center(panel_width / 2, panel_height / 2)
		icon_item:show()
	else
		icon_item:hide()
	end

	if dual_icon_item then
		if dual_texture and DB:has(Idstring("texture"), dual_texture) then
			local item_parent = dual_icon_item:parent()
			local panel_width = item_parent:width() / 2
			local panel_height = item_parent:height()

			dual_icon_item:set_image(dual_texture, unpack(dual_texture_rect))

			local texture_width = texture_rect and texture_rect[3] or dual_icon_item:texture_width()
			local texture_height = texture_rect and texture_rect[4] or dual_icon_item:texture_height()
			local aspect = panel_width / panel_height
			local sw = math.max(texture_width, texture_height * aspect)
			local sh = math.max(texture_height, texture_width / aspect)
			local dw = texture_width / sw
			local dh = texture_height / sh

			dual_icon_item:set_size(math.round(dw * panel_width), math.round(dh * panel_height))
			dual_icon_item:set_center(panel_width + panel_width / 2, panel_height / 2)
			dual_icon_item:show()
		else
			dual_icon_item:hide()
		end
	end

	if bg_item then
		if bg_texture and DB:has(Idstring("texture"), bg_texture) then
			local item_parent = bg_item:parent()
			local panel_width = item_parent:width()
			local panel_height = item_parent:height()

			bg_item:set_image(bg_texture, unpack(bg_texture_rect))

			local texture_width = bg_item:texture_width()
			local texture_height = bg_item:texture_height()
			local aspect = texture_width / texture_height
			local scale = 1.1764705882352942

			if texture_width == 0 or texture_height == 0 then
				Application:error("[ProfileSwitchBoxItem] BG Texture size error!:", "width", texture_width, "height", texture_height)

				texture_width = 1
				texture_height = 1
			end

			local sw = math.min(panel_width, panel_height * aspect)
			local sh = math.min(panel_height, panel_width / aspect)

			bg_item:set_size(math.round(sw * scale), math.round(sh * scale))
			bg_item:set_center(panel_width / 2, panel_height / 2)
			bg_item:show()
		else
			bg_item:hide()
		end
	end

	if perks_panel then
		perks_panel:clear()

		if perks and #perks > 0 then
			local perk_index = 0

			for _, perk_texture in ipairs(perks) do
				if DB:has(Idstring("texture"), perk_texture) then
					local perk_object = perks_panel:bitmap({
						w = 16,
						h = 16,
						alpha = 0.8,
						layer = 2,
						texture = perk_texture
					})

					perk_object:set_rightbottom(math.round(perks_panel:right() - perk_index * 16), math.round(perks_panel:bottom() - 5))

					perk_index = perk_index + 1
				end
			end
		end
	end
end

function MenuNodeMultiProfileSwitchGui:_animate_scroll_text(text)
	local w = text:parent():w()
	local speed = 60
	local fade_t = 0.28

	text:set_x(0)

	while true do
		wait(2)

		while w < text:right() do
			local dt = coroutine.yield()

			text:move(-speed * dt, 0)
		end

		wait(1)
		over(fade_t, function (p)
			text:set_alpha(1 - p)
		end)
		text:set_x(0)
		over(fade_t, function (p)
			text:set_alpha(p)
		end)
	end
end

function MenuNodeMultiProfileSwitchGui:_update_profile_preview(profile_index, profile)
	profile = profile or {}
	local profile_name = utf8.to_upper(managers.multi_profile:profile_name(profile_index))

	self._profile_title:set_text(profile_name)
	self.make_fine_text(self._profile_title)
	self._profile_title:set_right(self._preview_panel:w())

	local is_current = profile == managers.multi_profile:current_profile()
	local primary = is_current and managers.blackmarket:equipped_weapon_slot("primaries") or profile.primary
	local secondary = is_current and managers.blackmarket:equipped_weapon_slot("secondaries") or profile.secondary
	local melee = is_current and managers.blackmarket:equipped_melee_weapon() or profile.melee
	local armor = is_current and managers.blackmarket:equipped_armor() or profile.armor
	local deployable = is_current and managers.blackmarket:equipped_deployable() or profile.deployable
	local deployable_2 = is_current and managers.blackmarket:equipped_deployable(2) or profile.deployable_secondary
	local throwable = is_current and managers.blackmarket:equipped_grenade() or profile.throwable
	local skillset = is_current and managers.skilltree:get_selected_skill_switch() or profile.skillset
	local perk_deck = not is_current and profile.perk_deck

	self:_update_weapon_preview("primary", primary, "primaries")
	self:_update_weapon_preview("secondary", secondary, "secondaries")
	self:_update_melee_preview(melee)
	self:_update_armor_preview(armor)
	self:_update_deployable_preview(deployable, deployable_2)
	self:_update_throwable_preview(throwable)
	self:_update_skills_preview(skillset, perk_deck)
end

function MenuNodeMultiProfileSwitchGui:_update_weapon_preview(box_id, weapon_slot, weapon_category)
	local preview_box = self._preview_boxes[box_id]

	if not preview_box then
		return
	end

	local weapon = managers.blackmarket:get_crafted_category_slot(weapon_category, weapon_slot)

	if not weapon then
		self:_update_preview_box(preview_box)

		return
	end

	local name = managers.blackmarket:get_weapon_name_by_category_slot(weapon_category, weapon_slot)
	local raw_name = managers.weapon_factory:get_weapon_name_by_factory_id(weapon.factory_id)
	local custom_name = managers.blackmarket:get_crafted_custom_name(weapon_category, weapon_slot, true)
	local weapon_name = custom_name or name or raw_name
	local weapon_perks = managers.blackmarket:get_perks_from_weapon_blueprint(weapon.factory_id, weapon.blueprint)
	local perk_icons = {}

	for perk in pairs(weapon_perks) do
		if perk ~= "bonus" then
			local perk_texture = "guis/textures/pd2/blackmarket/inv_mod_" .. perk

			table.insert(perk_icons, perk_texture)
		end
	end

	local icon, rarity = managers.blackmarket:get_weapon_icon_path(weapon.weapon_id, weapon.cosmetics)
	local cosmetic = weapon.locked_name and weapon.cosmetics and tweak_data.blackmarket.weapon_skins[weapon.cosmetics.id]
	local name_color = cosmetic and tweak_data.economy.rarities[cosmetic.rarity or "common"].color

	self:_update_preview_box(preview_box, {
		text = weapon_name,
		text_color = name_color,
		texture = icon,
		perks = perk_icons,
		bg_texture = rarity
	})
end

function MenuNodeMultiProfileSwitchGui:_update_melee_preview(melee_id)
	local preview_box = self._preview_boxes.melee

	if not preview_box then
		return
	end

	local melee_data = tweak_data.blackmarket.melee_weapons[melee_id]

	if not melee_data then
		self:_update_preview_box(preview_box)

		return
	end

	local name = managers.localization:text(melee_data.name_id)
	local icon = managers.blackmarket:get_melee_weapon_icon(melee_id)
	local perk_icons = managers.menu_component:create_melee_status_icon_list(melee_id)

	self:_update_preview_box(preview_box, {
		text = name,
		texture = icon,
		perks = perk_icons
	})
end

function MenuNodeMultiProfileSwitchGui:_update_armor_preview(armor_level)
	local preview_box = self._preview_boxes.armor

	if not preview_box then
		return
	end

	local armor_data = tweak_data.blackmarket.armors[armor_level]

	if not armor_data then
		self:_update_preview_box(preview_box)

		return
	end

	local name = managers.localization:text(armor_data.name_id)
	local icon = managers.blackmarket:get_armor_icon(armor_level)

	self:_update_preview_box(preview_box, {
		text = name,
		texture = icon
	})
end

function MenuNodeMultiProfileSwitchGui:_update_deployable_preview(primary_id, secondary_id)
	local preview_box = self._preview_boxes.deployable

	if not preview_box then
		return
	end

	local primary_data = tweak_data.blackmarket.deployables[primary_id]

	if not primary_data then
		self:_update_preview_box(preview_box)

		return
	end

	local name = managers.localization:text(primary_data.name_id)
	local icon = managers.blackmarket:get_deployable_icon(primary_id)
	local secondary_data = tweak_data.blackmarket.deployables[secondary_id]
	local secondary_icon = managers.blackmarket:get_deployable_icon(secondary_id)

	if secondary_data then
		local secondary_name = managers.localization:text(secondary_data.name_id)
		name = name .. " / " .. secondary_name
	end

	self:_update_preview_box(preview_box, {
		text = name,
		texture = icon,
		dual_texture = secondary_icon
	})
end

function MenuNodeMultiProfileSwitchGui:_update_throwable_preview(throwable_id)
	local preview_box = self._preview_boxes.throwable

	if not preview_box then
		return
	end

	local throwable_data = tweak_data.blackmarket.projectiles[throwable_id]

	if not throwable_data then
		self:_update_preview_box(preview_box)

		return
	end

	local name = managers.localization:text(throwable_data.name_id)
	local icon = managers.blackmarket:get_throwable_icon(throwable_id)

	self:_update_preview_box(preview_box, {
		text = name,
		texture = icon
	})
end

function MenuNodeMultiProfileSwitchGui:_update_skills_preview(skill_switch, perk_deck)
	local preview_box = self._preview_boxes.skillset

	if not preview_box then
		return
	end

	local switch_data = Global.skilltree_manager.skill_switches[skill_switch]

	if not switch_data then
		return
	end

	local skill_name = managers.skilltree:get_skill_switch_name(skill_switch, true)

	preview_box.text:set_text(skill_name)
	self.make_fine_text(preview_box.text)

	local points_spent = managers.skilltree:points(switch_data)
	local distribution_id = points_spent > 0 and "menu_st_points_unspent_skill_switch" or "menu_st_points_all_spent_skill_switch"
	local distribution_text = managers.localization:to_upper_text(distribution_id, {
		points = string.format("%.3d", points_spent)
	})

	preview_box.points_text:set_text(distribution_text)
	self.make_fine_text(preview_box.points_text)

	local color = Color.white

	for tree in ipairs(tweak_data.skilltree.trees) do
		local text_item = preview_box.skilltrees[tree]
		local points = managers.skilltree:get_tree_progress_new(tree, switch_data)
		local points_formatted = string.format("%.2d", points)

		text_item:set_text(points_formatted)

		if points == 0 then
			text_item:set_color(color:with_alpha(0.5))
		else
			local range_len = utf8.len(points_formatted) - utf8.len(points)

			text_item:set_color(color)
			text_item:set_range_color(0, range_len, color:with_alpha(0.5))
		end
	end

	perk_deck = perk_deck or managers.skilltree:digest_value(switch_data.specialization, false, 0)

	self:_update_perk_deck_preview(perk_deck)
end

function MenuNodeMultiProfileSwitchGui:_update_perk_deck_preview(perk_deck)
	local preview_box = self._preview_boxes.perk_deck

	if not preview_box then
		return
	end

	local perk_data = tweak_data.skilltree.specializations[perk_deck]

	if not perk_data then
		return
	end

	local perk_name = managers.localization:text(perk_data.name_id)
	local texture_rect_x = 0
	local texture_rect_y = 0
	local guis_catalog = "guis/"
	local current_tier = managers.skilltree:get_specialization_value(perk_deck, "tiers", "current_tier")
	local max_tier = managers.skilltree:get_specialization_value(perk_deck, "tiers", "max_tier")
	local tier_data = perk_data[max_tier]

	if tier_data then
		texture_rect_x = tier_data.icon_xy and tier_data.icon_xy[1] or 0
		texture_rect_y = tier_data.icon_xy and tier_data.icon_xy[2] or 0

		if tier_data.texture_bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(tier_data.texture_bundle_folder) .. "/"
		end

		perk_name = perk_name .. "\n" .. tostring(current_tier) .. "/" .. tostring(max_tier)
	end

	local icon_atlas_texture = guis_catalog .. "textures/pd2/specialization/icons_atlas"

	preview_box.icon:set_image(icon_atlas_texture, texture_rect_x * 64, texture_rect_y * 64, 64, 64)
	preview_box.text:set_text(perk_name)
	self.make_fine_text(preview_box.text)
	preview_box.text:set_center_y(preview_box.panel:h() / 2)
end

function MenuNodeMultiProfileSwitchGui:is_moving_profile()
	return self._moving_profile
end

function MenuNodeMultiProfileSwitchGui:_start_profile_move()
	if self._moving_profile or not self._selected_item then
		return
	end

	self._selected_item.gui_panel:set_text(utf8.char(187) .. self._selected_item.gui_panel:text())

	self._moving_profile = true
	self._moving_old_index = self._selected_item.name

	self:_update_legends(self._selected_item)
	managers.menu_component:post_event("menu_enter")
end

function MenuNodeMultiProfileSwitchGui:_finish_profile_move()
	if not self._moving_profile or not self._selected_item then
		return
	end

	local new_index = self._selected_item.name

	if self._moving_old_index ~= new_index then
		managers.multi_profile:move_profile(self._moving_old_index, new_index)
		managers.menu_component:post_event("menu_enter")
	end

	self._moving_profile = nil
	self._moving_old_index = nil

	MenuCallbackHandler:refresh_node()
end

function MenuNodeMultiProfileSwitchGui:close()
	managers.menu_component:enable_inventory_gui()
	managers.menu_component:show_mission_briefing_gui()

	if alive(self._fullscreen_panel) then
		self._fullscreen_panel:parent():remove(self._fullscreen_panel)

		self._fullscreen_panel = nil
	end

	MenuNodeMultiProfileSwitchGui.super.close(self)
end

function MenuNodeMultiProfileSwitchGui:mouse_pressed(button, x, y)
	if self.item_panel:inside(x, y) and button == IDS_1 and self._selected_item and self._selected_item.name and not self._selected_item.item:parameters().previous_node then
		if self._moving_profile then
			self:_finish_profile_move()
		else
			self:_start_profile_move()
		end
	end
end

function MenuNodeMultiProfileSwitchGui:special_btn_pressed(button)
	if managers.menu:is_pc_controller() then
		return
	end

	if button == Idstring("menu_preview_item_alt") and self._selected_item and self._selected_item.name and not self._selected_item.item:parameters().previous_node then
		if self._moving_profile then
			self:_finish_profile_move()
		else
			self:_start_profile_move()
		end
	end
end
