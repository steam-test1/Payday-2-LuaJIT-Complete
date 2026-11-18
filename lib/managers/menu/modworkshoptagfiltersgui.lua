require("lib/managers/menu/MenuInitiatorBase")

local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size

ModWorkshopTagFiltersGui = ModWorkshopTagFiltersGui or class(GenericDialogMenuNodeGui)

function ModWorkshopTagFiltersGui:_early_setup()
	local n = MenuInitiatorBase:new()

	n:create_divider(self._node, "filter_tags_title", self._create_params.title or "menu_mws_filter_tags")
	n:create_divider(self._node, "list_divider", nil, 360)
end

function ModWorkshopTagFiltersGui:_setup()
	self._list = ScrollItemList:new(self.item_panel, {
		bar_minimum_size = 16,
		h = 340,
		halign = "right",
		input_focus = true,
		layer = 100,
		scrollbar_padding = 10,
		y = 32
	}, {
		border_x = 8,
		border_y = 4
	})

	self:add_input_component(self._list)
	self._list:add_lines_and_static_down_indicator()

	self._chosen_tags = self._create_params.chosen_tags or {}

	for i, tag in pairs(self._create_params.data.tags) do
		local tag_panel = CompositeButton:new(self._list:canvas(), {}, {
			w = self._list:w() - 42
		})

		self._list:add_input_component(tag_panel)

		local toggle = ToggleButton:new(tag_panel, {
			input = true,
			initial_state = table.contains(self._chosen_tags, tag.id)
		}, {
			input = true
		}, function(toggle)
			local toggled = table.contains(self._chosen_tags, tag.id)

			if toggled then
				table.delete(self._chosen_tags, tag.id)
			else
				table.insert(self._chosen_tags, tag.id)
			end

			toggle:set_state(not toggled)
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
		self._list:add_item(tag_panel)
	end
end

function ModWorkshopTagFiltersGui:close_return_values()
	return self._chosen_tags
end
