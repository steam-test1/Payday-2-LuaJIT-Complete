local function make_fine_text(text)
	local x, y, w, h = text:text_rect()

	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

local function filter_hide_unavailable_items(item)
	local dlc = tweak_data:get_raw_value("skilltree", "specializations", item.specialization_id, "dlc")

	if dlc and not managers.dlc:is_dlc_unlocked(dlc) and tweak_data:get_raw_value("lootdrop", "global_values", dlc, "hide_unavailable") then
		return false
	end

	return true
end

local MOUSEOVER_COLOR = tweak_data.screen_colors.button_stage_2
local BUTTON_COLOR = tweak_data.screen_colors.button_stage_3
local S_FONT = tweak_data.menu.pd2_small_font
local S_FONT_SIZE = tweak_data.menu.pd2_small_font_size
local M_FONT = tweak_data.menu.pd2_medium_font
local M_FONT_SIZE = tweak_data.menu.pd2_medium_font_size
SpecializationGuiNew = SpecializationGuiNew or class()

function SpecializationGuiNew:init(ws, fullscreen_ws, node)
	managers.menu:active_menu().renderer.ws:hide()

	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._node = node
	self._init_layer = self._ws:panel():layer()
	self._selected_item = nil
	self._hover_spec_item = nil
	self._active_page = nil
	self._active_tree = nil
	self._prerequisites_links = {}

	managers.features:announce_feature("perk_deck")

	local menu_components_data = node:parameters().menu_component_data or {}
	local add_skilltree = not menu_components_data.hide_skilltree
	local add_specialization = not menu_components_data.hide_specialization

	self:_setup()
	self:set_layer(5)
end

function SpecializationGuiNew:_setup()
	if alive(self._panel) then
		self._ws:panel():remove(self._panel)
	end

	local scaled_size = managers.gui_data:scaled_size()
	self._panel = self._ws:panel():panel({
		valign = "center",
		visible = true,
		layer = self._init_layer
	})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()

	WalletGuiObject.set_wallet(self._panel)

	local title_text = self._panel:text({
		vertical = "top",
		name = "title_text",
		align = "left",
		text = utf8.to_upper(managers.localization:text("menu_specialization")),
		h = tweak_data.menu.pd2_large_font_size,
		font_size = tweak_data.menu.pd2_large_font_size,
		font = tweak_data.menu.pd2_large_font,
		color = tweak_data.screen_colors.text
	})
	local bg_text = self._fullscreen_panel:text({
		name = "bg_text",
		vertical = "top",
		h = 90,
		alpha = 0.4,
		align = "left",
		blend_mode = "add",
		layer = 1,
		text = utf8.to_upper(managers.localization:text("menu_specialization")),
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = tweak_data.menu.pd2_massive_font,
		color = tweak_data.screen_colors.button_stage_3
	})
	local x, y = managers.gui_data:safe_to_full_16_9(title_text:world_x(), title_text:world_center_y())

	bg_text:set_world_left(x)
	bg_text:set_world_center_y(y)
	bg_text:move(-13, 9)
	MenuBackdropGUI.animate_bg_text(self, bg_text)

	if managers.menu:is_pc_controller() then
		self._panel:text({
			vertical = "bottom",
			name = "back_button",
			align = "right",
			blend_mode = "add",
			text = utf8.to_upper(managers.localization:text("menu_back")),
			h = tweak_data.menu.pd2_large_font_size,
			font_size = tweak_data.menu.pd2_large_font_size,
			font = tweak_data.menu.pd2_large_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		self:make_fine_text(self._panel:child("back_button"))
		self._panel:child("back_button"):set_right(self._panel:w())
		self._panel:child("back_button"):set_bottom(self._panel:h())

		local bg_back = self._fullscreen_panel:text({
			name = "back_button",
			vertical = "bottom",
			h = 90,
			align = "right",
			alpha = 0.4,
			blend_mode = "add",
			layer = 1,
			text = utf8.to_upper(managers.localization:text("menu_back")),
			font_size = tweak_data.menu.pd2_massive_font_size,
			font = tweak_data.menu.pd2_massive_font,
			color = tweak_data.screen_colors.button_stage_3
		})
		local x, y = managers.gui_data:safe_to_full_16_9(self._panel:child("back_button"):world_right(), self._panel:child("back_button"):world_center_y())

		bg_back:set_world_right(x)
		bg_back:set_world_center_y(y)
		bg_back:move(13, -9)
		MenuBackdropGUI.animate_bg_text(self, bg_back)
	end

	local black_rect = self._fullscreen_panel:rect({
		layer = 1,
		color = Color(0.4, 0, 0, 0)
	})
	local blur = self._fullscreen_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		w = self._fullscreen_ws:panel():w(),
		h = self._fullscreen_ws:panel():h()
	})

	local function func(o)
		over(0.6, function (p)
			o:set_alpha(p)
		end)
	end

	blur:animate(func)

	local points_text = self._panel:text({
		word_wrap = false,
		name = "points_text",
		vertical = "top",
		wrap = false,
		align = "left",
		layer = 1,
		text = utf8.to_upper(managers.localization:text("menu_st_available_spec_points", {
			points = managers.money:add_decimal_marks_to_string(tostring(managers.skilltree:specialization_points()))
		})),
		font = tweak_data.menu.pd2_small_font,
		font_size = tweak_data.menu.pd2_small_font_size,
		color = tweak_data.screen_colors.text
	})

	make_fine_text(points_text)
	points_text:set_right(810)
	points_text:set_bottom(self._panel:h())

	self._safe_panel = self._panel:panel({
		y = title_text:bottom() + 5,
		h = self._panel:h() - tweak_data.menu.pd2_large_font_size - 5 - (title_text:bottom() + 5)
	})
	self._tab_panel = self._safe_panel:panel({
		y = 0,
		name = "tab_panel",
		visible = true,
		w = 810,
		h = M_FONT_SIZE + 10
	})
	self._specialization_panel = self._safe_panel:panel({
		name = "skill_tree_panel",
		visible = true,
		w = 750,
		y = M_FONT_SIZE + 10 - 2,
		h = self._safe_panel:h() - (M_FONT_SIZE + 10) + 2
	})
	self._details_panel = self._safe_panel:panel({
		x = self._specialization_panel:right() + 0,
		y = self._specialization_panel:y(),
		w = self._safe_panel:w() - self._specialization_panel:right(),
		h = self._specialization_panel:h()
	})
	self._scroll_list = ScrollItemList:new(self._specialization_panel, {
		scrollbar_padding = 10,
		padding = 0
	}, {
		padding = 10
	})

	self._scroll_list:add_lines_and_static_down_indicator(15)
	self._scroll_list:set_selected_callback(callback(self, self, "update_detail_panels"))

	self._scroll_horizontal_index = 0
	local bg_colors = {
		Color.red,
		Color.green,
		Color.yellow
	}

	for asd, dsa in ipairs(tweak_data.skilltree.specializations) do
		local color = bg_colors[(asd - 1) % #bg_colors + 1]

		self._scroll_list:add_item(SpecializationListItem:new(self._scroll_list:canvas(), {}, {
			spec_data = dsa,
			spec_id = asd
		}, color))
	end

	self._scroll_list:filter_items(filter_hide_unavailable_items)

	local current_specialization = managers.skilltree:get_specialization_value("current_specialization")
	local list_items = self._scroll_list:items()
	local select_index = 1

	for index, item in ipairs(list_items) do
		if item.specialization_id == current_specialization then
			select_index = index

			break
		end
	end

	local select_item = list_items[select_index]

	self._scroll_list:select_item(select_item)
	self._scroll_list:scroll_to_show(select_item)
	self._scroll_list:set_input_focus(true)
	self._scroll_list:selected_item():set_horizontal_index(0)

	self._category_tab_items = {}
	local x_position = 0

	for index, data in ipairs(tweak_data.skilltree.specialization_category) do
		local category_item = SpecializationCategoryTabItem:new(self._tab_panel, {
			x = x_position + 5
		}, {
			text_name_id = data.name_id,
			callback = callback(self, self, "on_tab_item_pressed", {
				index = index,
				category = data.category
			})
		})
		x_position = category_item:bounds().right

		table.insert(self._category_tab_items, category_item)
	end

	self._category_tab_items[1]:selected_changed(true)

	local infos = {}

	if not managers.menu:is_pc_controller() then
		table.insert(infos, {
			loc_id = "menu_legend_back"
		})
		table.insert(infos, {
			loc_id = "menu_legend_select"
		})
		table.insert(infos, {
			loc_id = "menu_legend_preview_move"
		})
		table.insert(infos, {
			loc_id = "menu_specialization_key_but_deck",
			key = "menu_respec_tree_all"
		})
		table.insert(infos, {
			loc_id = "menu_specialization_key_favorite",
			key = "menu_respec_tree"
		})
	else
		table.insert(infos, {
			loc_id = "menu_specialization_key_favorite",
			key = "menu_respec_tree"
		})
		table.insert(infos, {
			loc_id = "menu_specialization_key_but_deck",
			key = "menu_respec_tree_all"
		})
	end

	self._buttons_info_panel = self._safe_panel:panel({
		w = 810,
		h = M_FONT_SIZE
	})

	self._buttons_info_panel:set_x(self._safe_panel:w() - self._buttons_info_panel:w())

	local x_pos = self._buttons_info_panel:w()

	for _, text in ipairs(infos) do
		local key_string = text.key and utf8.to_upper(managers.localization:btn_macro(text.key)) .. " " or ""
		local loc_string = managers.localization:to_upper_text(text.loc_id)
		local new_text = self._buttons_info_panel:text({
			text = key_string .. loc_string,
			font = S_FONT,
			font_size = S_FONT_SIZE
		})

		make_fine_text(new_text)
		new_text:set_x(x_pos - new_text:w() - 10)

		x_pos = x_pos - new_text:w() - 10
	end
end

function SpecializationGuiNew:on_tab_item_pressed(data)
	for i, item in ipairs(self._category_tab_items) do
		if i == data.index then
			item:selected_changed(true)
		else
			item:selected_changed(false)
		end
	end

	local sort_func = nil

	if data.category == "all" then
		function sort_func(item)
			return filter_hide_unavailable_items(item)
		end
	elseif data.category == "favorites" then
		function sort_func(item)
			return filter_hide_unavailable_items(item) and item:is_favorited()
		end
	else
		function sort_func(item)
			if not filter_hide_unavailable_items(item) then
				return false
			end

			if type(item.specialization_data.category) == "table" then
				for _, category in pairs(item.specialization_data.category) do
					if category == data.category then
						return true
					end
				end
			else
				return item.specialization_data.category == data.category
			end
		end
	end

	local current_selected_item = self._scroll_list:selected_item()

	self._scroll_list:filter_items(sort_func, nil, true)

	local filtered_items = self._scroll_list:items()
	local selected_item = filtered_items[1]

	if table.contains(filtered_items, current_selected_item) then
		selected_item = current_selected_item
	end

	if selected_item then
		self._scroll_list:select_item(selected_item, nil, true)
		self._scroll_list:scroll_to_show(selected_item)
	end
end

function SpecializationGuiNew:update_detail_panels(item)
	self._details_panel:clear()
	BoxGuiObject:new(self._details_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})

	if #self._scroll_list:items() <= 0 then
		return
	end

	local selected_item = self._scroll_list:selected_item()

	selected_item:set_horizontal_index(self._scroll_horizontal_index)
	self._details_panel:rect({
		alpha = 0.5,
		layer = 0,
		color = Color.black
	})

	local y_pos = 0
	local margin = 10
	local title_text = self._details_panel:text({
		name = "details_title",
		layer = 1,
		text = managers.localization:text(selected_item.specialization_data.name_id),
		font = M_FONT,
		font_size = S_FONT_SIZE
	})

	make_fine_text(title_text)
	title_text:set_center_x(self._details_panel:w() / 2)
	title_text:set_y(y_pos + margin)

	y_pos = title_text:bottom()
	local specialization_descs_tweak = tweak_data.upgrades.specialization_descs[selected_item.specialization_id]
	local text_params = {
		text = "",
		wrap = true,
		word_wrap = true,
		layer = 1,
		x = margin,
		w = self._details_panel:w() - margin * 2,
		font = M_FONT,
		font_size = S_FONT_SIZE
	}
	local is_dlc_locked = selected_item:is_dlc_locked()

	if is_dlc_locked then
		local dlc = tweak_data:get_raw_value("skilltree", "specializations", selected_item.specialization_id, "dlc")

		if dlc and not managers.dlc:is_dlc_unlocked(dlc) then
			local unlock_id = tweak_data:get_raw_value("lootdrop", "global_values", dlc, "unlock_id") or "bm_menu_dlc_locked"

			if tweak_data:get_raw_value("lootdrop", "global_values", dlc, "hide_unavailable") then
				unlock_id = "bm_menu_dlc_locked"
			end

			text_params.text = managers.localization:to_upper_text(unlock_id)
			text_params.color = tweak_data.screen_colors.important_1
			local lock_text = self._details_panel:text(text_params)

			ExtendedPanel.make_fine_text(lock_text)
			lock_text:set_y(y_pos + margin)

			y_pos = lock_text:bottom()
			text_params.color = Color.white
		end
	end

	if self._scroll_horizontal_index == 0 then
		local desc_string = managers.localization:text(selected_item.specialization_data.desc_id)
		desc_string = desc_string:gsub("\n\n", "\n")
		local desc_text = self._details_panel:text({
			name = "details_desc",
			wrap = true,
			word_wrap = true,
			layer = 1,
			x = margin,
			w = self._details_panel:w() - margin * 2,
			text = desc_string,
			font = M_FONT,
			font_size = S_FONT_SIZE
		})

		ExtendedPanel.make_fine_text(desc_text)
		desc_text:set_y(y_pos + margin)

		y_pos = desc_text:bottom()
		local current_tier = managers.skilltree:get_specialization_value(selected_item.specialization_id, "tiers", "current_tier")

		for index, spec_data in ipairs(selected_item.specialization_data) do
			if index % 2 ~= 0 then
				local specialization_description = specialization_descs_tweak and specialization_descs_tweak[index] or {}
				local multi_choice_specialization_descs = {}
				local choice_data = nil

				if spec_data.multi_choice then
					local choice_index = managers.skilltree:get_specialization_value(selected_item.specialization_id, "choices", index)

					if choice_index and choice_index > 0 then
						multi_choice_specialization_descs = tweak_data:get_raw_value("upgrades", "multi_choice_specialization_descs", selected_item.specialization_id, index, choice_index) or {}
						choice_data = spec_data.multi_choice[choice_index]
					end
				end

				local locked = current_tier < index
				local macroes = {
					BTN_ABILITY = managers.localization:btn_macro("throw_grenade"),
					CLONED_CARD = managers.localization:text("menu_deck_multichoice_no_choice")
				}

				for i, d in pairs(specialization_description) do
					macroes[i] = d
				end

				local choice_macroes = {
					BTN_ABILITY = managers.localization:btn_macro("throw_grenade"),
					CLONED_CARD = choice_data and choice_data.name_id and managers.localization:text(choice_data.name_id) or managers.localization:text("menu_deck_multichoice_no_choice")
				}

				for i, d in pairs(multi_choice_specialization_descs) do
					choice_macroes[i] = d
				end

				local desc_string = ""
				local has_desc = false

				if not choice_data or not choice_data.skip_tier_desc and not choice_data.skip_tier_name then
					desc_string = desc_string .. ((spec_data.short_id or spec_data.desc_id) and managers.localization:text(spec_data.short_id or spec_data.desc_id, macroes) or "") .. " "
					has_desc = true
				end

				if choice_data and (choice_data.short_id or choice_data.desc_id) and not is_dlc_locked then
					desc_string = desc_string .. managers.localization:text(choice_data.short_id or choice_data.desc_id, choice_macroes)
					has_desc = true
				end

				text_params.text = has_desc and managers.localization:text("menu_specialization_tier") .. " " .. index .. ": " .. desc_string or ""
				text_params.text = text_params.text:gsub("\n\n", " ")
				text_params.text = text_params.text:gsub("\n", " ")
				text_params.alpha = locked and 0.75 or 1
				local ability_text = self._details_panel:text(text_params)

				managers.menu_component:add_colors_to_text_object(ability_text, tweak_data.screen_colors.resource)
				ExtendedPanel.make_fine_text(ability_text)
				ability_text:set_y(y_pos + margin)

				y_pos = ability_text:bottom()
			end
		end
	else
		local spec_data = selected_item.specialization_data[self._scroll_horizontal_index]
		local specialization_description = specialization_descs_tweak and specialization_descs_tweak[self._scroll_horizontal_index] or {}
		local multi_choice_specialization_descs = {}
		local choice_data = nil

		if spec_data.multi_choice then
			local choice_index = managers.skilltree:get_specialization_value(selected_item.specialization_id, "choices", self._scroll_horizontal_index)

			if choice_index and choice_index > 0 then
				multi_choice_specialization_descs = tweak_data:get_raw_value("upgrades", "multi_choice_specialization_descs", selected_item.specialization_id, self._scroll_horizontal_index, choice_index) or {}
				choice_data = spec_data.multi_choice[choice_index]
			end
		end

		local macroes = {
			BTN_ABILITY = managers.localization:btn_macro("throw_grenade")
		}

		for i, d in pairs(specialization_description) do
			macroes[i] = d
		end

		local choice_macroes = {
			BTN_ABILITY = managers.localization:btn_macro("throw_grenade")
		}

		for i, d in pairs(multi_choice_specialization_descs) do
			choice_macroes[i] = d
		end

		local text_string = ""
		local name_id = spec_data.name_id
		local desc_id = spec_data.desc_id
		text_string = text_string .. string.format("%s:\n%s", managers.localization:text(name_id), managers.localization:text(desc_id, macroes))

		if choice_data and not is_dlc_locked then
			local choice_string = ""
			local choice_name_id = choice_data.name_id
			local choice_desc_id = choice_data.desc_id

			if choice_name_id then
				choice_string = choice_string .. string.format("%s:\n%s", managers.localization:text(choice_name_id), managers.localization:text(choice_desc_id, choice_macroes))
			else
				choice_string = choice_string .. string.format("%s", managers.localization:text(choice_desc_id, choice_macroes))
			end

			if choice_data.shorten_desc then
				choice_string = choice_string:gsub("\n\n", "\n")
			end

			if choice_data.skip_tier_desc then
				text_string = choice_string
			elseif choice_data.skip_tier_name then
				text_string = choice_string .. "\n\n" .. managers.localization:text(desc_id, macroes)
			else
				text_string = text_string .. "\n\n" .. choice_string
			end
		end

		if _G.IS_VR or managers.user:get_setting("show_vr_descs") then
			local vr_desc_data = tweak_data:get_raw_value("vr", "specialization_descs_addons", selected_item.specialization_id, self._scroll_horizontal_index)

			if vr_desc_data then
				local vr_string = managers.localization:text("menu_vr_skill_addon") .. " " .. managers.localization:text(vr_desc_data.desc_id, vr_desc_data.macros)
				text_string = text_string .. string.format("\n\n%s", vr_string)
			end
		end

		text_params.text = text_string
		local ability_text = self._details_panel:text(text_params)

		managers.menu_component:add_colors_to_text_object(ability_text, tweak_data.screen_colors.resource)
		ExtendedPanel.make_fine_text(ability_text)
		ability_text:set_y(y_pos + margin)

		y_pos = ability_text:bottom()
	end
end

function SpecializationGuiNew:_get_item_spec_id_from_index(index)
	local items = self._scroll_list:items()
	local spec_id = index and items[index] and items[index].specialization_id

	return spec_id
end

function SpecializationGuiNew:_set_current_specialization(index)
	local specialization_id = self:_get_item_spec_id_from_index(index)

	if not specialization_id then
		return
	end

	managers.skilltree:set_current_specialization(specialization_id)
	self:_refresh_scroll()
	managers.menu_component:post_event("menu_enter")
end

function SpecializationGuiNew:_refresh_scroll()
	local current_specialization = managers.skilltree:get_specialization_value("current_specialization")

	for index, item in ipairs(self._scroll_list:all_items()) do
		if item.specialization_id == current_specialization then
			item:set_equipped(true)
		else
			item:set_equipped(false)
		end
	end
end

function SpecializationGuiNew:dialog_unlock_specialization_card(index, horizontal_index)
	local specialization_id = self:_get_item_spec_id_from_index(index)

	if not specialization_id then
		return
	end

	local current_tier = managers.skilltree:get_specialization_value(specialization_id, "tiers", "current_tier")

	if current_tier >= 9 then
		return
	end

	local cost = managers.skilltree:get_specialization_value(specialization_id, "tiers", "next_tier_data", "points") - managers.skilltree:get_specialization_value(specialization_id, "tiers", "next_tier_data", "current_points")
	local total_cost = cost

	for i = current_tier + 2, horizontal_index do
		total_cost = total_cost + tweak_data.skilltree.specializations[specialization_id][i].cost
	end

	if total_cost <= managers.skilltree:get_specialization_value("points") then
		local dialog_data = {
			title = managers.localization:text("st_menu_max_perk_dialog_title"),
			text = managers.localization:text("menu_new_perk_dialog_text", {
				max_tier = 9,
				point_cost = total_cost,
				perk_tier = horizontal_index
			}),
			focus_button = 2,
			button_list = {
				{
					text = managers.localization:text("dialog_yes"),
					callback_func = callback(self, self, "unlock_specialization_card", {
						total_cost,
						index,
						horizontal_index
					})
				},
				{
					cancel_button = true,
					text = managers.localization:text("dialog_no")
				}
			}
		}

		managers.system_menu:show(dialog_data)
	else
		self._scroll_list:items()[index]:on_fail_unlocked(horizontal_index)
	end
end

function SpecializationGuiNew:unlock_specialization_card(params)
	local cost, index, horizontal_index = unpack(params)
	local specialization_id = self:_get_item_spec_id_from_index(index)

	if not specialization_id then
		return
	end

	managers.skilltree:spend_specialization_points(cost, specialization_id)

	for _, item in ipairs(self._scroll_list:items()) do
		item:refresh()
	end

	self._scroll_list:items()[index]:on_card_unlocked(horizontal_index)
	self._panel:child("points_text"):set_text(managers.localization:text("menu_st_available_spec_points", {
		points = managers.money:add_decimal_marks_to_string(tostring(managers.skilltree:specialization_points()))
	}))
	managers.menu_component:post_event("menu_skill_investment")
	self:update_detail_panels()
end

function SpecializationGuiNew:toggle_favorite(index)
	local specialization_id = self:_get_item_spec_id_from_index(index)

	if not specialization_id then
		return
	end

	local state = not managers.skilltree:get_specialization_favorite(specialization_id)

	self._scroll_list:items()[index]:set_favorite_button_state(state)
	managers.skilltree:set_specialization_favorite(specialization_id, state)
	managers.menu_component:post_event(state and "selection_next" or "selection_previous")
end

function SpecializationGuiNew:show_dlc_store(index)
	local specialization_id = self:_get_item_spec_id_from_index(index)

	if not specialization_id then
		return
	end

	local dlc = tweak_data:get_raw_value("skilltree", "specializations", specialization_id, "dlc")

	if not tweak_data:get_raw_value("lootdrop", "global_values", dlc, "no_store") then
		MenuCallbackHandler:open_dlc_store_page(dlc, "skilltree")
	end
end

function SpecializationGuiNew:is_specialization_dlc_locked(index)
	local specialization_id = self:_get_item_spec_id_from_index(index)

	if not specialization_id then
		return
	end

	local dlc = tweak_data:get_raw_value("skilltree", "specializations", specialization_id, "dlc")

	return dlc and not managers.dlc:is_dlc_unlocked(dlc)
end

function SpecializationGuiNew:update(t, dt)
end

function SpecializationGuiNew:input_focus()
	if managers.menu_scene and managers.menu_scene:input_focus() then
		return false
	end

	return 2
end

function SpecializationGuiNew:move_up()
	self._scroll_list:move_up()
end

function SpecializationGuiNew:move_down()
	self._scroll_list:move_down()
end

function SpecializationGuiNew:move_left()
	self._scroll_horizontal_index = math.clamp(self._scroll_horizontal_index - 1, 0, 9)
	local selected_item = self._scroll_list:selected_item()

	if selected_item then
		selected_item:set_horizontal_index(self._scroll_horizontal_index)
		self:update_detail_panels()
		managers.menu_component:post_event("highlight")
	end
end

function SpecializationGuiNew:move_right()
	self._scroll_horizontal_index = math.clamp(self._scroll_horizontal_index + 1, 0, 9)
	local selected_item = self._scroll_list:selected_item()

	if selected_item then
		selected_item:set_horizontal_index(self._scroll_horizontal_index)
		self:update_detail_panels()
		managers.menu_component:post_event("highlight")
	end
end

function SpecializationGuiNew:confirm_pressed()
	local selected_index = self._scroll_list:selected_index()

	if not selected_index then
		return
	end

	if self:is_specialization_dlc_locked(selected_index) then
		self:show_dlc_store(selected_index)

		return
	end

	if self._scroll_horizontal_index <= 0 then
		self:_set_current_specialization(selected_index)
	elseif self._scroll_horizontal_index <= 9 then
		local selected_item = self._scroll_list:selected_item()

		if selected_item:can_purchase_card(self._scroll_horizontal_index) then
			self:dialog_unlock_specialization_card(selected_index, self._scroll_horizontal_index)
		elseif selected_item:has_multi_choice(self._scroll_horizontal_index) then
			selected_item:switch_multi_choice(self._scroll_horizontal_index, 1)
			self:update_detail_panels()
		end
	end
end

function SpecializationGuiNew:special_btn_pressed(button)
	local selected_index = self._scroll_list:selected_index()

	if not selected_index then
		return
	end

	if self:is_specialization_dlc_locked(selected_index) then
		self:show_dlc_store(selected_index)

		return
	end

	if button == Idstring("menu_respec_tree") then
		self:toggle_favorite(selected_index)
	elseif button == Idstring("menu_respec_tree_all") then
		self:dialog_unlock_specialization_card(selected_index, 9)
	end
end

function SpecializationGuiNew:mouse_pressed(button, x, y)
	self._scroll_list:mouse_pressed(button, x, y)

	if button == Idstring("0") then
		if self._panel:child("back_button"):inside(x, y) then
			managers.menu:back()

			return
		end

		if self._scroll_list:inside(x, y) then
			for index, item in ipairs(self._scroll_list:items()) do
				if item:inside(x, y) then
					local success, reason = item:pressed(x, y)

					if success then
						if reason == "Equip Deck" then
							self:_set_current_specialization(index)
						elseif reason == "Purchase Perk" then
							if item:can_purchase_card(self._scroll_horizontal_index) then
								self:dialog_unlock_specialization_card(index, self._scroll_horizontal_index)
							elseif item:has_multi_choice(self._scroll_horizontal_index) then
								item:switch_multi_choice(self._scroll_horizontal_index, 1)
								self:update_detail_panels()
							end
						elseif reason == "Favorite" then
							self:toggle_favorite(index)
						elseif reason == "Locked" then
							self:show_dlc_store(index)
						end
					end

					return
				end
			end
		end

		for index, item in ipairs(self._category_tab_items) do
			if item:inside(x, y) then
				item:pressed()
			end
		end
	elseif button == Idstring("1") and self._scroll_list:inside(x, y) then
		for index, item in ipairs(self._scroll_list:items()) do
			if item:inside(x, y) then
				local success, reason = item:pressed(x, y)

				if success and reason == "Purchase Perk" and not item:can_purchase_card(self._scroll_horizontal_index) and item:has_multi_choice(self._scroll_horizontal_index) then
					item:switch_multi_choice(self._scroll_horizontal_index, -1)
					self:update_detail_panels()
				end
			end
		end
	end

	if button == Idstring("mouse wheel down") and self._scroll_list:inside(x, y) then
		self._scroll_list:perform_scroll(-60)
	elseif button == Idstring("mouse wheel up") and self._scroll_list:inside(x, y) then
		self._scroll_list:perform_scroll(60)
	end

	if self._tab_panel:inside(x, y) then
		if button == Idstring("mouse wheel down") then
			self:next_page()
		elseif button == Idstring("mouse wheel up") then
			self:previous_page()
		end
	end
end

function SpecializationGuiNew:mouse_clicked(o, button, x, y)
end

function SpecializationGuiNew:mouse_double_click(o, button, x, y)
end

function SpecializationGuiNew:mouse_released(button, x, y)
	self._scroll_list:mouse_released(button, x, y)
end

function SpecializationGuiNew:mouse_moved(o, x, y)
	local used = false
	local pointer = "arrow"

	if self._scroll_list:scroll_item():grabbed_scroll_bar() then
		return self._scroll_list:scroll_item():mouse_moved(o, x, y)
	end

	local back_button = self._panel:child("back_button")

	if not used and back_button:inside(x, y) then
		used = true
		pointer = "link"

		if not self._back_highlight then
			self._back_highlight = true

			back_button:set_color(MOUSEOVER_COLOR)
			managers.menu_component:post_event("highlight")
		end
	elseif self._back_highlight then
		self._back_highlight = false

		back_button:set_color(BUTTON_COLOR)
	end

	if self._scroll_list:inside(x, y) and self._scroll_list:input_focus() then
		for _, item in ipairs(self._scroll_list:items()) do
			local horizontal_index = item:hovered_index(x, y)

			if horizontal_index >= 0 and self._scroll_horizontal_index ~= horizontal_index then
				self._scroll_horizontal_index = horizontal_index

				item:set_horizontal_index(horizontal_index)
				self:update_detail_panels()
				managers.menu_component:post_event("highlight")
			end

			if horizontal_index >= 0 then
				local hover_favorite = item._favorite_button:inside(x, y)
				local can_purchase = item:can_purchase_card(horizontal_index)
				local can_equip = item._left_side:inside(x, y) and not hover_favorite and managers.skilltree:get_specialization_value("current_specialization") ~= item.specialization_id
				local is_pressable = hover_favorite or can_purchase or can_equip
				local has_multi_choice = item:is_purchased(horizontal_index) and item:has_multi_choice(horizontal_index)
				is_pressable = is_pressable or has_multi_choice

				if is_pressable then
					pointer = "link"
					used = true
				end
			end
		end

		local hover, cursor = self._scroll_list:mouse_moved("", x, y)

		if not used then
			used = hover
			pointer = cursor
		end
	end

	for index, item in ipairs(self._category_tab_items) do
		if item:inside(x, y) then
			item:hovered(true)

			if not item:get_active_state() then
				pointer = "link"
				used = true
			end
		else
			item:hovered(false)
		end
	end

	return used, pointer
end

function SpecializationGuiNew:next_page()
	local active_index = -1

	for index, item in ipairs(self._category_tab_items) do
		if item:get_active_state() then
			active_index = index + 1

			break
		end
	end

	active_index = (active_index - 1) % #self._category_tab_items + 1

	self._category_tab_items[active_index]:pressed()

	if self._scroll_list:scroll_item():grabbed_scroll_bar() then
		self._scroll_list:scroll_item():release_scroll_bar()
	end
end

function SpecializationGuiNew:previous_page()
	local active_index = -1

	for index, item in ipairs(self._category_tab_items) do
		if item:get_active_state() then
			active_index = index - 1

			break
		end
	end

	active_index = (active_index - 1) % #self._category_tab_items + 1

	self._category_tab_items[active_index]:pressed()

	if self._scroll_list:scroll_item():grabbed_scroll_bar() then
		self._scroll_list:scroll_item():release_scroll_bar()
	end
end

function SpecializationGuiNew:close()
	managers.menu:active_menu().renderer.ws:show()

	if alive(self._disabled_panel) then
		self._fullscreen_ws:panel():remove(self._disabled_panel)

		self._disabled_panel = nil
	end

	WalletGuiObject.close_wallet(self._panel)
	self._ws:panel():remove(self._panel)
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
end

function SpecializationGuiNew:enable()
	self._enabled = true

	if alive(self._disabled_panel) then
		self._fullscreen_ws:panel():remove(self._disabled_panel)

		self._disabled_panel = nil
	end
end

function SpecializationGuiNew:disable()
	self._enabled = false

	if alive(self._disabled_panel) then
		self._fullscreen_ws:panel():remove(self._disabled_panel)

		self._disabled_panel = nil
	end

	self._disabled_panel = self._fullscreen_ws:panel():panel({
		layer = 50
	})

	self._disabled_panel:rect({
		name = "bg",
		alpha = 0.4,
		color = Color.black
	})
	self._disabled_panel:bitmap({
		texture = "guis/textures/test_blur_df",
		name = "blur",
		render_template = "VertexColorTexturedBlur3D",
		layer = -1,
		w = self._disabled_panel:w(),
		h = self._disabled_panel:h()
	})
end

function SpecializationGuiNew:set_layer(layer)
	self._panel:set_layer(self._init_layer + layer)
end

function SpecializationGuiNew:make_fine_text(text)
	local x, y, w, h = text:text_rect()

	text:set_size(w, h)
	text:set_position(math.round(text:x()), math.round(text:y()))
end

SpecializationListItem = SpecializationListItem or class(ListItem)

function SpecializationListItem:init(parent, panel_data, info_data)
	self.card_base_h_size = 64

	SpecializationListItem.super.init(self, parent, {
		input = false,
		h = self.card_base_h_size + 10,
		w = parent:w() - 20
	})

	self._content_panel = self._panel:panel(panel_data)

	self._content_panel:set_alpha(0.5)
	self._content_panel:rect({
		alpha = 0.7,
		layer = 0,
		color = Color("ff0B0E14")
	})

	self.specialization_data = info_data.spec_data or tweak_data.skilltree.specializations[1]
	self.specialization_id = info_data.spec_id
	self._max_horizontal_index = 9
	self._card_panels = {}
	self._is_equipped = false
	local has_multi_choice_lookup = {}

	for index, item in ipairs(self.specialization_data) do
		if item.multi_choice then
			has_multi_choice_lookup[index] = true
		end
	end

	if next(has_multi_choice_lookup) then
		self._has_multi_choice_lookup = has_multi_choice_lookup
	end

	self:setup()
end

function SpecializationListItem:setup()
	local card_ratio = 0.6956521739130435
	local offset = 5

	self._content_panel:clear()
	self._content_panel:rect({
		name = "content_hightlight_panel",
		alpha = 0.6,
		layer = 1,
		color = Color.black
	})

	self._left_side = self._content_panel:panel({
		w = 180
	})
	local fav_icon_texture = "guis/textures/favorite_star"
	local fav_icon_texture_rect = {
		24,
		0,
		24,
		24
	}
	self._favorite_button_state = managers.skilltree:get_specialization_favorite(self.specialization_id)
	self._favorite_button = self._left_side:bitmap({
		layer = 3,
		h = 24,
		w = 24,
		texture = fav_icon_texture,
		texture_rect = fav_icon_texture_rect,
		color = BUTTON_COLOR,
		visible = self._favorite_button_state
	})

	self._favorite_button:set_lefttop(self._left_side:x() + 5, self._left_side:y() + 5)
	self:set_favorite_button_state(self._favorite_button_state)

	local title_panel = self._left_side:panel({
		name = "title_panel",
		x = offset
	})
	local title_text = title_panel:text({
		name = "title_text",
		vertical = "top",
		align = "center",
		halign = "grow",
		valign = "grow",
		y = 5,
		x = 5,
		layer = 8,
		color = self:is_dlc_locked() and tweak_data.screen_colors.important_1 or Color.white,
		text = managers.localization:to_upper_text(self.specialization_data.name_id),
		font = M_FONT,
		font_size = M_FONT_SIZE,
		w = title_panel:w() - 10,
		h = title_panel:h() - 10
	})
	local equipped_text = title_panel:text({
		name = "equipped",
		vertical = "bottom",
		align = "center",
		halign = "grow",
		valign = "grow",
		y = 5,
		x = 5,
		layer = 8,
		text = "(" .. managers.localization:to_upper_text("bm_menu_equipped") .. ")",
		x = offset,
		font = S_FONT,
		font_size = S_FONT_SIZE,
		w = title_panel:w() - 10,
		h = title_panel:h() - 10
	})
	local title_hightlight_panel = title_panel:panel({
		visible = false,
		name = "title_highlight",
		valign = "scale",
		halign = "scale",
		layer = 1
	})

	BoxGuiObject:new(title_hightlight_panel, {
		one_two_align = true,
		sides = {
			1,
			1,
			1,
			1
		}
	})
	self:set_equipped(managers.skilltree:get_specialization_value("current_specialization") == self.specialization_id)

	local card_size_x = self.card_base_h_size * card_ratio
	local card_size_y = self.card_base_h_size
	local card_offset = 5
	local current_tier = self:get_current_tier()
	self._center_side = self._content_panel:panel({
		x = self._left_side:w(),
		w = card_size_x * 9 + card_offset * 9 - offset,
		y = offset,
		h = self._content_panel:h() - offset * 2
	})

	for index, item in ipairs(self.specialization_data) do
		local guis_catalog = "guis/"

		if item.texture_bundle_folder then
			guis_catalog = guis_catalog .. "dlcs/" .. tostring(item.texture_bundle_folder) .. "/"
		end

		local card_texture = "guis/textures/pd2/specialization/perk_icon_card"
		local card_texture_rect = {
			0,
			0,
			64,
			92
		}
		local atlas_name = item.icon_atlas or "icons_atlas"
		local icon_atlas_texture = guis_catalog .. "textures/pd2/specialization/" .. atlas_name
		local texture_rect_x = item.icon_xy and item.icon_xy[1] or 0
		local texture_rect_y = item.icon_xy and item.icon_xy[2] or 0
		local icon_texture_rect = item.icon_texture_rect or {
			64,
			64,
			64,
			64
		}
		local locked = current_tier < index
		local next_in_line = current_tier + 1 == index and not self:is_dlc_locked()
		local card_panel = self._center_side:panel({
			y = 0,
			name = "card_" .. index,
			x = (card_size_x + card_offset) * (index - 1),
			w = card_size_x,
			h = card_size_y
		})

		card_panel:set_center_y(self._center_side:h() / 2)

		local card_background = card_panel:bitmap({
			name = "background",
			layer = 3,
			texture = card_texture,
			texture_rect = card_texture_rect,
			color = self:is_dlc_locked() and tweak_data.screen_colors.important_1 or locked and Color("ff36383B") or Color.white,
			alpha = (locked or self:is_dlc_locked()) and not next_in_line and 0.1 or 1,
			w = card_size_x,
			h = card_size_y
		})
		local perk_icon = card_panel:bitmap({
			name = "icon",
			texture = icon_atlas_texture,
			texture_rect = {
				texture_rect_x * icon_texture_rect[1],
				texture_rect_y * icon_texture_rect[2],
				icon_texture_rect[3],
				icon_texture_rect[4]
			},
			color = self:is_dlc_locked() and tweak_data.screen_colors.important_1 or locked and Color("ffe9ebec") or Color.white,
			blend_mode = (locked or self:is_dlc_locked()) and "add" or "sub",
			alpha = locked and 0.5 or 1,
			layer = locked and 4 or 5,
			w = card_size_x - 4,
			h = card_size_x - 4
		})

		perk_icon:set_center(card_panel:w() / 2, card_panel:h() / 2)

		local next_cost = 0
		local total_cost = 0

		if current_tier < 9 then
			next_cost = managers.skilltree:get_specialization_value(self.specialization_id, "tiers", "next_tier_data", "points") - managers.skilltree:get_specialization_value(self.specialization_id, "tiers", "next_tier_data", "current_points")
			total_cost = next_cost

			for i = current_tier + 2, index do
				total_cost = total_cost + tweak_data.skilltree.specializations[self.specialization_id][i].cost
			end
		end

		local points_text = card_panel:text({
			name = "points",
			layer = 6,
			text = tostring(total_cost),
			color = total_cost < managers.skilltree:get_specialization_value("points") and Color.white or tweak_data.screen_colors.important_1,
			x = offset,
			font = S_FONT,
			font_size = S_FONT_SIZE,
			visible = next_in_line
		})

		make_fine_text(points_text)
		points_text:set_bottom(card_panel:h())
		points_text:set_center_x(card_panel:w() / 2)

		local multi_choice_data = item.multi_choice

		if multi_choice_data then
			local choice_index = managers.skilltree:get_specialization_value(self.specialization_id, "choices", index) or 0
			multi_choice_data = multi_choice_data[choice_index] or nil

			if multi_choice_data then
				local atlas_name = multi_choice_data.icon_atlas or multi_choice_data.texture_bundle_folder and "icons_atlas"

				if atlas_name then
					local choice_guis_catalog = "guis/"

					if multi_choice_data.texture_bundle_folder then
						choice_guis_catalog = choice_guis_catalog .. "dlcs/" .. tostring(multi_choice_data.texture_bundle_folder) .. "/"
					end

					local choice_icon_atlas_texture = choice_guis_catalog .. "textures/pd2/specialization/" .. atlas_name
					local choice_texture_rect_x = multi_choice_data.icon_xy and multi_choice_data.icon_xy[1] or 0
					local choice_texture_rect_y = multi_choice_data.icon_xy and multi_choice_data.icon_xy[2] or 0
					local choice_icon_texture_rect = multi_choice_data.icon_texture_rect or {
						64,
						64,
						64,
						64
					}
					local choice_icon = card_panel:bitmap({
						name = "choice_icon",
						texture = choice_icon_atlas_texture,
						texture_rect = {
							choice_texture_rect_x * choice_icon_texture_rect[1],
							choice_texture_rect_y * choice_icon_texture_rect[2],
							choice_icon_texture_rect[3],
							choice_icon_texture_rect[4]
						},
						color = self:is_dlc_locked() and tweak_data.screen_colors.important_1 or locked and Color("ffe9ebec") or Color.white,
						blend_mode = (locked or self:is_dlc_locked()) and "add" or "sub",
						alpha = locked and 0.5 or 1,
						layer = locked and 4 or 5,
						w = card_size_x * 0.5,
						h = card_size_x * 0.5
					})

					choice_icon:set_bottom(card_panel:h() * 0.98)
					choice_icon:set_center_x(card_panel:w() / 2)
				end

				local choice_text = card_panel:text({
					name = "choice_text",
					vertical = "top",
					align = "right",
					text = string.format("%d/%d", choice_index, #item.multi_choice),
					color = self:is_dlc_locked() and tweak_data.screen_colors.important_1 or locked and Color("ffe9ebec") or Color.white,
					x = offset,
					font = S_FONT,
					font_size = S_FONT_SIZE * 0.9,
					blend_mode = (locked or self:is_dlc_locked()) and "add" or "sub",
					alpha = locked and 0.5 or 1,
					layer = locked and 5 or 6
				})

				make_fine_text(choice_text)
				choice_text:set_top(card_panel:h() / 20)
				choice_text:set_center_x(card_panel:w() / 2)
			end
		end

		local hightlight_panel = card_panel:panel({
			visible = false,
			name = "hightlight_panel",
			layer = 1
		})

		BoxGuiObject:new(hightlight_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		self._card_panels[index] = card_panel
	end
end

function SpecializationListItem:set_favorite_button_state(state)
	self._favorite_button_state = state

	self._favorite_button:set_image("guis/textures/favorite_star", state and 0 or 24, 0, 24, 24)
end

function SpecializationListItem:refresh()
	self:setup()
end

function SpecializationListItem:on_card_unlocked(horizontal_index)
	self:refresh()
	self:_selected_changed(true)
	self:set_horizontal_index(horizontal_index)

	local item = self._card_panels[horizontal_index]

	SimpleGUIEffectSpewer.infamous_up(item:child("icon"):center_x(), item:child("icon"):center_y(), item)
end

function SpecializationListItem:on_fail_unlocked(horizontal_index)
	if not self.anim_active then
		self.anim_active = true
		local item = self._card_panels[horizontal_index]:child("background")

		item:animate(function ()
			local t = 0
			local dt = 0
			local speed = 4
			local origin_color = item:color()

			while t <= 0.8 do
				dt = coroutine.yield()
				t = t + dt * speed

				item:set_color(math.lerp(origin_color, Color.red, t))
			end

			while t > 0 do
				dt = coroutine.yield()
				t = t - dt * speed

				item:set_color(math.lerp(origin_color, Color.red, t))
			end

			item:set_color(origin_color)

			self.anim_active = false
		end)
	end
end

function SpecializationListItem:_selected_changed(state)
	SpecializationListItem.super._selected_changed(self, state)
	self._content_panel:set_alpha(state and 1 or 0.5)
	self._content_panel:child("content_hightlight_panel"):set_alpha(state and 0.6 or 0.5)
	self._favorite_button:set_visible(state or self._favorite_button_state)

	if not state then
		for index, item in ipairs(self._card_panels) do
			item:child("hightlight_panel"):set_visible(false)
		end

		self._left_side:child("title_panel"):child("title_highlight"):set_visible(false)
	end
end

function SpecializationListItem:set_horizontal_index(new_index)
	local new_h_index = math.clamp(new_index, 0, self._max_horizontal_index)

	for index, item in ipairs(self._card_panels) do
		item:child("hightlight_panel"):set_visible(false)
	end

	if new_h_index > 0 then
		self._card_panels[new_h_index]:child("hightlight_panel"):set_visible(true)
		self._left_side:child("title_panel"):child("title_highlight"):set_visible(false)
	else
		self._left_side:child("title_panel"):child("title_highlight"):set_visible(true)
	end
end

function SpecializationListItem:set_equipped(state)
	local title_panel = self._left_side:child("title_panel")
	local title_text = title_panel:child("title_text")
	local equipped_text = title_panel:child("equipped")
	local _, _, ttw = title_text:text_rect()
	local _, _, etw = equipped_text:text_rect()

	title_panel:set_width(math.max(ttw, state and etw or 0) + 10)
	title_panel:set_center_x(self._left_side:w() / 2)
	title_panel:set_h(M_FONT_SIZE + (state and S_FONT_SIZE or 0) + 10)
	title_panel:set_center_y(self._left_side:h() / 2)
	equipped_text:set_visible(state)
end

function SpecializationListItem:hovered_index(x, y)
	local index = -1

	if self._panel:inside(x, y) then
		if self._left_side:inside(x, y) then
			if self._favorite_button:inside(x, y) then
				if not self._hover_favorite_button then
					self._hover_favorite_button = true

					self._favorite_button:set_color(MOUSEOVER_COLOR)
					managers.menu_component:post_event("highlight")
				end
			elseif self._hover_favorite_button then
				self._hover_favorite_button = false

				self._favorite_button:set_color(BUTTON_COLOR)

				self._hover_favorite_button = false
			end

			index = 0
		end

		if self._center_side:inside(x, y) then
			for asd, dsa in ipairs(self._card_panels) do
				if dsa:inside(x, y) then
					index = asd

					break
				end
			end
		end
	end

	return index
end

function SpecializationListItem:hovered(x, y)
end

function SpecializationListItem:pressed(x, y)
	if self._panel:inside(x, y) then
		local selected_item = ""

		if self:is_dlc_locked() then
			selected_item = "Locked"
		else
			if self._left_side:inside(x, y) then
				if self._favorite_button:inside(x, y) then
					selected_item = "Favorite"
				else
					selected_item = "Equip Deck"
				end
			end

			if self._center_side:inside(x, y) then
				for index, item in ipairs(self._card_panels) do
					if item:inside(x, y) then
						selected_item = "Purchase Perk"
					end
				end
			end
		end

		return true, selected_item
	end

	return false, ""
end

function SpecializationListItem:is_dlc_locked()
	local dlc = tweak_data:get_raw_value("skilltree", "specializations", self.specialization_id, "dlc")

	return dlc and not managers.dlc:is_dlc_unlocked(dlc)
end

function SpecializationListItem:is_favorited()
	return self._favorite_button_state
end

function SpecializationListItem:is_purchased(horizontal_index)
	local current_tier = self:get_current_tier()

	return horizontal_index <= current_tier
end

function SpecializationListItem:can_purchase_card(horizontal_index)
	local current_tier = self:get_current_tier()

	return horizontal_index == current_tier + 1
end

function SpecializationListItem:get_current_tier()
	return managers.skilltree:get_specialization_value(self.specialization_id, "tiers", "current_tier")
end

function SpecializationListItem:has_multi_choice(index)
	return self._has_multi_choice_lookup and self._has_multi_choice_lookup[index] or false
end

function SpecializationListItem:switch_multi_choice(tier_index, choice_mod)
	local spec_data = self.specialization_data[tier_index]

	if not spec_data or not spec_data.multi_choice or self:get_current_tier() < tier_index then
		return
	end

	local choice_index = managers.skilltree:get_specialization_value(self.specialization_id, "choices", tier_index) or 0
	choice_index = choice_index + choice_mod

	if not spec_data.multi_choice[choice_index] then
		if choice_index > 0 then
			choice_index = 1
		else
			choice_index = #spec_data.multi_choice
		end
	end

	managers.menu_component:post_event(choice_mod > 0 and "selection_next" or "selection_previous")
	managers.skilltree:set_specialization_choice(self.specialization_id, tier_index, choice_index)
	self:refresh()
	self:_selected_changed(true)
	managers.menu_component:post_event("highlight")
end

SpecializationCategoryTabItem = SpecializationCategoryTabItem or class()

function SpecializationCategoryTabItem:init(parent, panel_data, tab_data)
	self._on_pressed_callback = tab_data.callback
	self._active_state = tab_data.initial_state or false
	self._tab_panel = parent:panel(panel_data)
	self._tab_text = self._tab_panel:text({
		valign = "grow",
		vertical = "center",
		align = "center",
		halign = "grow",
		layer = 5,
		text = managers.localization:to_upper_text(tab_data.text_name_id),
		color = Color.black,
		font = M_FONT,
		font_size = M_FONT_SIZE
	})
	local _, _, tw, th = self._tab_text:text_rect()

	self._tab_panel:set_size(tw + 10, th + 10)

	self._tab_rect = self._tab_panel:bitmap({
		texture = "guis/textures/pd2/shared_tab_box",
		visible = true,
		layer = 3,
		color = tweak_data.screen_colors.text,
		w = self._tab_panel:w(),
		h = self._tab_panel:h()
	})

	self:selected_changed(false)
end

function SpecializationCategoryTabItem:selected_changed(state)
	self._active_state = state

	self._tab_rect:set_visible(state)
	self._tab_text:set_color(state and Color.black or BUTTON_COLOR)
end

function SpecializationCategoryTabItem:inside(x, y)
	return self._tab_panel:inside(x, y)
end

function SpecializationCategoryTabItem:hovered(state)
	if self._active_state then
		return
	end

	self._tab_text:set_color(state and MOUSEOVER_COLOR or BUTTON_COLOR)

	if self._hover_state ~= state then
		self._hover_state = state

		if state then
			managers.menu_component:post_event("highlight")
		end
	end
end

function SpecializationCategoryTabItem:get_active_state()
	return self._active_state
end

function SpecializationCategoryTabItem:pressed()
	if not self._active_state and self._on_pressed_callback then
		self._on_pressed_callback()
	end
end

function SpecializationCategoryTabItem:bounds()
	return {
		left = self._tab_panel:left(),
		right = self._tab_panel:right(),
		top = self._tab_panel:top(),
		bottom = self._tab_panel:bottom()
	}
end
