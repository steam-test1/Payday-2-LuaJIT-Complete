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
		padding = 8
	})

	self._options = params.options
	self._on_change = params.on_change
	self._text = self:fine_text({
		align = "center",
		text = "AAAAAAAAAAAAAAAAAAAAA",
		w = 200,
		font = small_font,
		font_size = small_font_size,
		color = hover_color
	})
	self._index = 1

	if params.value then
		self:set_value(params.value, true)
	else
		self:set_index(1, true)
	end

	if not managers.menu:is_pc_controller() then
		local left_btn = params.use_change_profile_controls and "menu_change_profile_left" or "previous_page"
		local right_btn = params.use_change_profile_controls and "menu_change_profile_right" or "next_page"

		placer:add_right(IconButton:new(self, {
			size = 32,
			texture = "guis/textures/menu_arrows",
			binding = left_btn,
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
			text = managers.localization:btn_macro(left_btn, true),
			font = small_font,
			font_size = small_font_size,
			color = Color.white
		}), 0)
		placer:add_right_center(self._text)
		placer:add_right(self:fine_text({
			text = managers.localization:btn_macro(right_btn, true),
			font = small_font,
			font_size = medium_font_size,
			color = Color.white
		}))
		placer:add_right(IconButton:new(self, {
			rotation = 180,
			size = 32,
			texture = "guis/textures/menu_arrows",
			binding = right_btn,
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
		placer:add_right_center(self._text)
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

function MultichoiceGuiObject:set_options(options)
	self._options = options

	if not self:set_value(self._value, true) then
		self:set_index(1, true)
	end
end

function MultichoiceGuiObject:mouse_moved(...)
	local hit, icon = MultichoiceGuiObject.super.mouse_moved(self, ...)

	self._bg:set_color(hit and hover_color:with_alpha(0.2) or Color.black:with_alpha(0.25))

	return hit, icon
end

function MultichoiceGuiObject:get_index()
	return self._index
end

function MultichoiceGuiObject:set_value(value, no_callback)
	for _, option in pairs(self._options) do
		if option.value == value then
			self:set_index(option, no_callback)

			return true
		end
	end

	return false
end

function MultichoiceGuiObject:set_index(index, no_callback)
	index = math.clamp(index, 1, #self._options)

	local option = self._options[index]

	self._text:set_text(option.text_id and managers.localization:to_upper_text(option.text_id) or option.text)

	self._index = index
	self._value = option.value

	if not no_callback then
		self._on_change(index, option)
	end
end

function MultichoiceGuiObject:_next()
	self:set_index(self._index + 1)
end

function MultichoiceGuiObject:_prev()
	self:set_index(self._index - 1)
end
