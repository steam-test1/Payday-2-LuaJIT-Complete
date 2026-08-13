MultichoiceGuiObject = MultichoiceGuiObject or class(ExtendedPanel)

local small_font = tweak_data.menu.pd2_small_font
local small_font_size = tweak_data.menu.pd2_small_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local normal_color = tweak_data.screen_colors.button_stage_3
local hover_color = tweak_data.screen_colors.button_stage_2

function MultichoiceGuiObject:init(parent, params, panel_config)
	panel_config = panel_config or {}

	if panel_config.input == nil then
		panel_config.input = true
	end

	MultichoiceGuiObject.super.init(self, parent, panel_config)

	params = params or {}
	params.options = params.options or {}

	self:set_size(0, 0)

	local placer = ResizingPlacer:new(self, {
		padding = 10
	})

	self._items = {}
	self._on_change = params.on_change

	local current_index = 1
	local max_w = 200

	for i, option in pairs(params.options) do
		local t = self:fine_text({
			align = "center",
			text = params.localize ~= false and managers.localization:to_upper_text(option.text_id) or option.text_id,
			font = small_font,
			font_size = small_font_size,
			color = hover_color
		})

		table.insert(self._items, {
			item = t,
			value = option.value,
			index = i
		})

		max_w = math.max(max_w, t:w())

		if option.value == params.value then
			current_index = #self._items
		end
	end

	for _, t in pairs(self._items) do
		t.item:set_w(max_w)
		t.item:set_visible(false)
	end

	self:set_current(self._items[current_index], true)

	local current = self._current.item

	if not managers.menu:is_pc_controller() then
		placer:add_right(IconButton:new(self, {
			binding = "previous_page",
			size = 32,
			texture = "guis/textures/menu_arrows",
			normal_color = normal_color,
			hover_color = hover_color,
			texture_rect = {
				0,
				0,
				24,
				24
			}
		}, callback(self, self, "_prev")), 20)
		placer:add_right(self:fine_text({
			text = managers.localization:btn_macro("previous_page", true),
			font = small_font,
			font_size = small_font_size,
			color = Color.white
		}), 0)
		placer:add_right_center(current)
		placer:add_right(self:fine_text({
			text = managers.localization:btn_macro("next_page", true),
			font = small_font,
			font_size = medium_font_size,
			color = Color.white
		}))
		placer:add_right(IconButton:new(self, {
			binding = "next_page",
			rotation = 180,
			size = 32,
			texture = "guis/textures/menu_arrows",
			normal_color = normal_color,
			hover_color = hover_color,
			texture_rect = {
				0,
				0,
				24,
				24
			}
		}, callback(self, self, "_next")), 0)
	else
		placer:add_right(IconButton:new(self, {
			rotation = 360,
			size = 32,
			texture = "guis/textures/menu_arrows",
			normal_color = normal_color,
			hover_color = hover_color,
			texture_rect = {
				0,
				0,
				24,
				24
			}
		}, callback(self, self, "_prev")))
		placer:add_right_center(current)
		placer:add_right(IconButton:new(self, {
			rotation = 180,
			size = 32,
			texture = "guis/textures/menu_arrows",
			normal_color = normal_color,
			hover_color = hover_color,
			texture_rect = {
				0,
				0,
				24,
				24
			}
		}, callback(self, self, "_next")))
	end

	for _, t in pairs(self._items) do
		t.item:set_position(current:position())
	end

	self._bg = self:rect({
		layer = -1,
		color = Color.black:with_alpha(0.25)
	})

	BoxGuiObject:new(self, {
		sides = {
			1,
			1,
			1,
			1
		}
	})
end

function MultichoiceGuiObject:mouse_moved(...)
	local hit, icon = MultichoiceGuiObject.super.mouse_moved(self, ...)

	self._bg:set_color(hit and hover_color:with_alpha(0.2) or Color.black:with_alpha(0.25))

	return hit, icon
end

function MultichoiceGuiObject:get_current()
	return self._current
end

function MultichoiceGuiObject:set_current(item, no_callback)
	if self._current then
		self._current.item:set_visible(false)
	end

	self._current = item

	if self._current then
		self._current.item:set_visible(true)

		if not no_callback then
			self._on_change(item)
		end
	end
end

function MultichoiceGuiObject:_next()
	local i = (self._current and self._current.index or 1) + 1

	if i > #self._items then
		i = 1
	end

	self:set_current(self._items[i])
end

function MultichoiceGuiObject:_prev()
	local i = (self._current and self._current.index or 1) - 1

	if i <= 0 then
		i = #self._items
	end

	self:set_current(self._items[i])
end

function MultichoiceGuiObject:refresh()
	local current_id = Global.achievements_filters.sort_order

	for _, t in pairs(self._items) do
		if t.value == current_id then
			self:set_current(t)
		end
	end
end
