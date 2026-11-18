require("lib/managers/menu/MenuInitiatorBase")

local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size

ModWorkshopFiltersGui = ModWorkshopFiltersGui or class(GenericDialogMenuNodeGui)
ModWorkshopFiltersGui.hybrid_menu_enabled = true
ModWorkshopFiltersGui.SORTING_OPTIONS = {
	"bumped_at",
	"published_at",
	"likes",
	"score",
	"weekly_score",
	"downloads",
	"views",
	"daily_score",
	"name"
}

function ModWorkshopFiltersGui:_early_setup()
	self._sort_order = self._create_params.sort_order
	self._cats = self._create_params.data.categories
	self._tags = self._create_params.tags
	self._blocked_tags = self._create_params.blocked_tags

	local n = MenuInitiatorBase:new()
	local sorting_options = {}

	for _, v in pairs(ModWorkshopFiltersGui.SORTING_OPTIONS) do
		table.insert(sorting_options, {
			_meta = "option",
			text_id = "menu_mws_sort_order_" .. v,
			value = v
		})
	end

	local mc = n:create_multichoice(self._node, sorting_options, {
		callback = "update_mws_sorting",
		enabled = true,
		name = "menu_mws_filters_sort_order",
		text_id = "menu_achievements_sort_order",
		value = self._sort_order
	}, 1)

	self._hybrid_menu:add_item(mc)
	n:create_divider(self._node, "custom_gui_divider", nil, 380)
end

function MenuCallbackHandler:update_mws_sorting(item)
	local node_gui = managers.menu:active_menu().renderer:active_node_gui()

	node_gui._sort_order = item:value()
end

function ModWorkshopFiltersGui:_setup()
	self._item_list = ScrollItemList:new(self.item_panel, {
		halign = "right",
		layer = 100,
		name = "item_list",
		y = 20
	}, {
		fixed_h = 400,
		fixed_w = self.item_panel:w()
	})

	self:add_input_component(self._item_list)

	self._categories_collapsible = self._item_list:add_item(CollapsibleListItem:new(self._item_list:canvas(), {
		canvas_h = 300,
		name = "categories",
		open = true,
		text = "",
		press_callback = function()
			for _, item in pairs(self._item_list:all_items()) do
				item:set_open(false)
			end
		end
	}))

	self._hybrid_menu:add_item(self._categories_collapsible)

	self._cat_list = ScrollItemList:new(self._categories_collapsible:canvas(), {
		allow_deselect = true,
		bar_minimum_size = 16,
		click_selection = true,
		input = true,
		scrollbar_padding = 10
	}, {
		border_x = 8,
		border_y = 2
	})

	self._cat_list:add_lines_and_static_down_indicator()
	self:make_category_tree(0, 0)

	self._tags_collapsible = self:make_tags_selection(self._tags or {})
	self._blocked_tags_collapsible = self:make_tags_selection(self._blocked_tags or {})

	for _, item in pairs(self._cat_list:all_items()) do
		if item.id == self._create_params.category then
			item:set_open(true, true)
			self._cat_list:select_item(item, true)

			break
		end
	end

	self:refresh_selectors()
end

function ModWorkshopFiltersGui:tags_str(t)
	if #t == 0 then
		return managers.localization:text("menu_crew_none")
	end

	local all_tags = table.value_as_key(self._create_params.data.tags, "id")
	local new_t = {}

	for _, id in pairs(t) do
		local tag = all_tags[id]

		if #new_t == 4 then
			table.insert(new_t, "...")

			break
		else
			table.insert(new_t, tag.name)
		end
	end

	return table.concat(new_t, ", ")
end

function ModWorkshopFiltersGui:refresh_selectors()
	local loc = managers.localization
	local none = managers.localization:text("menu_crew_none")
	local selected_cat = table.find_value(self._create_params.data.categories, function(cat)
		return cat.id == self._category
	end)

	self._categories_collapsible:set_text(loc:to_upper_text("menu_mws_filter_category", {
		CATEGORY = selected_cat and selected_cat.name or none
	}))
	self._tags_collapsible:set_text(loc:to_upper_text("menu_mws_filter_tags", {
		TAGS = self:tags_str(self._tags)
	}))
	self._blocked_tags_collapsible:set_text(loc:to_upper_text("menu_mws_filter_blocked_tags", {
		TAGS = self:tags_str(self._blocked_tags)
	}))
end

function ModWorkshopFiltersGui:make_tags_selection(selected_tags)
	local tags_collapsible = self._item_list:add_item(CollapsibleListItem:new(self._item_list:canvas(), {
		canvas_h = 300,
		text = "",
		press_callback = function()
			for _, item in pairs(self._item_list:all_items()) do
				item:set_open(false)
			end
		end
	}))

	self._hybrid_menu:add_item(tags_collapsible)

	local list = ScrollItemList:new(tags_collapsible:canvas(), {
		bar_minimum_size = 16,
		h = 300,
		input = true,
		scrollbar_padding = 10
	}, {
		border_x = 8,
		border_y = 2
	})

	list:add_lines_and_static_down_indicator()

	for _, tag in pairs(self._create_params.data.tags) do
		if not table.contains(ModWorkshopBaseModsPage.BLOCKED_TAGS, tonumber(tag.id)) then
			local tag_panel = CompositeButton:new(list:canvas(), {}, {
				w = list:w() - 42
			})

			self._hybrid_menu:add_item(tag_panel)
			list:add_input_component(tag_panel)

			local toggle = ToggleButton:new(tag_panel, {
				input = true,
				initial_state = table.contains(selected_tags, tag.id)
			}, {
				input = true
			}, function(toggle)
				local toggled = table.contains(selected_tags, tag.id)

				if toggled then
					table.delete(selected_tags, tag.id)
				else
					table.insert(selected_tags, tag.id)
				end

				toggle:set_state(not toggled)
				self:refresh_selectors()
			end)
			local toggle_text = TextButton:new(tag_panel, {
				text = tag.name,
				font_size = small_font_size,
				font = small_font
			})

			toggle_text:set_center_y(toggle:center_y())
			toggle:set_right(tag_panel:w())
			tag_panel:set_h(toggle_text:h())
			tag_panel:register_child(toggle)
			tag_panel:register_child(toggle_text)
			list:add_item(tag_panel)
		end
	end

	return tags_collapsible
end

function ModWorkshopFiltersGui:make_category_tree(category_id, depth, parent_tree_item)
	local i = 0

	for _, cat in pairs(self._cats) do
		if tonumber(cat.parent_id) == category_id and not ModWorkshopBaseModsPage.BLOCKED_CATEGORIES[tonumber(cat.id)] then
			i = i + 1

			local padding = 8 + depth * 24
			local cat_button = TreeItem:new(self._cat_list:canvas(), {
				h = 20,
				open = depth == 0,
				text = cat.name,
				trigger_func = function()
					if self._category ~= cat.id then
						self._category = cat.id
					else
						self._category = nil
					end

					self:refresh_selectors()
				end
			})

			self._hybrid_menu:add_item(cat_button)

			cat_button.parent_tree_item = parent_tree_item
			cat_button.open = false
			cat_button.depth = depth
			cat_button.id = cat.id

			self._cat_list:canvas():placer():set_start(padding, i == 1 and 0 or 16)
			self._cat_list:add_item(cat_button)

			local num_children = self:make_category_tree(tonumber(cat.id), depth + 1, cat_button)

			cat_button.num_children = num_children

			if num_children ~= 0 then
				cat_button:set_open_state(false)
			end
		end
	end

	return i
end

function ModWorkshopFiltersGui:close_return_values()
	return {
		category = self._category,
		tags = self._tags,
		sort_order = self._sort_order,
		blocked_tags = self._blocked_tags
	}
end

TreeItem = TreeItem or class(ListItem)

function TreeItem:init(parent, config)
	config = config or {}
	self.open = config.open or false
	config.visible = self.open

	TreeItem.super.init(self, parent, config)

	self._select_panel = self:rect({
		layer = -1,
		visible = false,
		x = 16,
		color = tweak_data.screen_colors.button_stage_3
	})
	self._hover_panel = self._select_panel
	self.num_children = 0
	self._open_state = TextButton:new(self, {
		text = " "
	}, callback(self, self, "toggle_open_state"), {
		input = false
	})
	self._text = TextButton:new(self, {
		text = config.text
	}, config.trigger_func, {
		fixed_size = true,
		input = false,
		x = 16
	})
	self._normal_color = config.normal_color or config.color or tweak_data.screen_colors.button_stage_3
	self._hover_color = config.hover_color or config.color or tweak_data.screen_colors.button_stage_2
end

function TreeItem:set_open_state(state)
	if state == nil then
		self._open_state:set_text(" ")
	else
		self._open_state:set_text(state and "-" or "+")
	end
end

function TreeItem:_selected_changed(state)
	TreeItem.super._selected_changed(self, state)
	self._text._text:set_color(state and self._hover_color or self._normal_color)
	self._text:_trigger()
end

function TreeItem:_hovered_changed(state)
	TreeItem.super._selected_changed(self, state)
	self._text._text:set_color((state or self._selected) and self._hover_color or self._normal_color)
end

function TreeItem:mouse_moved(o, x, y)
	self._open_state._text:set_color(self._open_state:inside(x, y) and self._hover_color or self._normal_color)
end

function TreeItem:mouse_pressed(b, x, y)
	if b == Idstring("0") and self:inside(x, y) then
		self:_trigger()
	end
end

function TreeItem:_trigger()
	local x, y = managers.mouse_pointer:modified_mouse_pos()

	if self._open_state:inside(x, y) then
		self:toggle_open_state()
	end
end

function TreeItem:set_open(state, open_parent)
	if open_parent and self.parent_tree_item and not self.parent_tree_item.open then
		self.parent_tree_item:set_open(true, true)
	end

	self.open = state

	if self.num_children == 0 then
		return
	end

	self._open_state:set_text(self.open and "- " or "+")
	self._parent:filter_items(function(item)
		return not item.parent_tree_item or item.parent_tree_item.open
	end, nil, true)

	for _, item in pairs(self._parent:all_items()) do
		item:set_x(8 + item.depth * 24)
	end
end

function TreeItem:toggle_open_state()
	self:set_open(not self.open)
end

function TreeItem:special_btn_pressed(button)
	if button == Idstring("menu_toggle_legends") and (self._selected or self._hover) then
		self:toggle_open_state()
	end

	TreeItem.super.special_btn_pressed(self, button)
end
