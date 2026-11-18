local IDS_TEXT = Idstring("Text")
local IDS_TIMER_GUI = Idstring("timer_gui")
local IDS_TIMER_GUI_GUI = Idstring("guis/timer_gui")

TimerGui = TimerGui or class()
TimerGui.themes = {}
TimerGui.themes.default = {}
TimerGui.themes.default.hide_background = false
TimerGui.themes.default.timer_color = tweak_data.hud.prime_color
TimerGui.themes.default.working_text_color = TimerGui.themes.default.timer_color
TimerGui.themes.default.time_header_text_color = TimerGui.themes.default.timer_color
TimerGui.themes.default.time_text_color = TimerGui.themes.default.timer_color
TimerGui.themes.old = {}
TimerGui.themes.old.hide_background = true
TimerGui.themes.old.timer_color = Color(0.3, 0.5, 0.3)
TimerGui.themes.old.timer_background_color = Color(0.2, 0.1, 0.2, 0.1)
TimerGui.themes.old.working_text_color = TimerGui.themes.old.timer_color
TimerGui.themes.old.time_header_text_color = TimerGui.themes.old.timer_color
TimerGui.themes.old.time_text_color = TimerGui.themes.old.timer_color
TimerGui.themes.old.bg_rect_color = Color.black
TimerGui.themes.old.bg_rect_blend_mode = "mul"
TimerGui.themes.old.jammed = {}
TimerGui.themes.old.jammed.bg_rect = Color(0.1, 0, 0)
TimerGui.themes.old.jammed.bg_rect_blend_mode = "mul"
TimerGui.themes.old.upgrade_color_0 = Color(0, 0, 0)
TimerGui.themes.old.upgrade_color_1 = Color(0.3, 0.6, 0.3)
TimerGui.themes.old.upgrade_color_2 = Color(0.8, 1, 0.8)
TimerGui.themes.blue = {}
TimerGui.themes.blue.hide_background = true
TimerGui.themes.blue.timer_color = Color(0.4, 0.6, 0.8)
TimerGui.themes.blue.working_text_color = TimerGui.themes.blue.timer_color
TimerGui.themes.blue.time_header_text_color = TimerGui.themes.blue.timer_color
TimerGui.themes.blue.time_text_color = TimerGui.themes.blue.timer_color
TimerGui.themes.blue.bg_rect_color = Color(0.4, 0, 0, 0)
TimerGui.themes.blue.jammed = {}
TimerGui.themes.blue.jammed.bg_rect = Color(0.1, 0, 0)
TimerGui.themes.blue.upgrade_color_0 = Color(0, 0, 0)
TimerGui.themes.blue.upgrade_color_1 = Color(0.2, 0.3, 0.4)
TimerGui.themes.blue.upgrade_color_2 = TimerGui.themes.blue.timer_color
TimerGui.themes.custom_background = {}
TimerGui.themes.custom_background.hide_background = true
TimerGui.themes.custom_background.timer_color = Color(0.8, 0.8, 0.8)
TimerGui.themes.custom_background.working_text_color = TimerGui.themes.custom_background.timer_color
TimerGui.themes.custom_background.time_header_text_color = TimerGui.themes.custom_background.timer_color
TimerGui.themes.custom_background.time_text_color = TimerGui.themes.custom_background.timer_color
TimerGui.themes.custom_background.bg_rect_color = Color(0, 0, 0, 0)
TimerGui.themes.custom_background.jammed = {}
TimerGui.themes.custom_background.jammed.bg_rect = Color(0.1, 0, 0)
TimerGui.themes.custom_background.upgrade_color_0 = Color(0, 0, 0)
TimerGui.themes.custom_background.upgrade_color_1 = Color(0.2, 0.3, 0.4)
TimerGui.themes.custom_background.upgrade_color_2 = TimerGui.themes.custom_background.timer_color
TimerGui.themes.bry_control_display = {}
TimerGui.themes.bry_control_display.hide_background = true
TimerGui.themes.bry_control_display.timer_color = Color(1, 0.956, 0.494)
TimerGui.themes.bry_control_display.working_text_color = TimerGui.themes.bry_control_display.timer_color
TimerGui.themes.bry_control_display.time_header_text_color = TimerGui.themes.bry_control_display.timer_color
TimerGui.themes.bry_control_display.time_text_color = TimerGui.themes.bry_control_display.timer_color
TimerGui.themes.bry_control_display.jammed = {}
TimerGui.themes.bry_control_display.jammed.bg_rect = Color(0.1, 0, 0)
TimerGui.themes.bry_control_display.upgrade_color_0 = Color(0, 0, 0)
TimerGui.themes.bry_control_display.upgrade_color_1 = Color(0.2, 0.3, 0.4)
TimerGui.themes.bry_control_display.upgrade_color_2 = TimerGui.themes.bry_control_display.timer_color
TimerGui.themes.vit_control_display = {}
TimerGui.themes.vit_control_display.hide_background = true
TimerGui.themes.vit_control_display.timer_color = Color(0, 1, 0.7)
TimerGui.themes.vit_control_display.working_text_color = TimerGui.themes.vit_control_display.timer_color
TimerGui.themes.vit_control_display.time_header_text_color = TimerGui.themes.vit_control_display.timer_color
TimerGui.themes.vit_control_display.time_text_color = TimerGui.themes.vit_control_display.timer_color
TimerGui.themes.vit_control_display.jammed = {}
TimerGui.themes.vit_control_display.jammed.bg_rect = Color(0.1, 0, 0)
TimerGui.themes.vit_control_display.upgrade_color_0 = Color(0, 0, 0)
TimerGui.themes.vit_control_display.upgrade_color_1 = Color(0.2, 0.3, 0.4)
TimerGui.themes.vit_control_display.upgrade_color_2 = TimerGui.themes.vit_control_display.timer_color
TimerGui.themes.mex_hack_display = {}
TimerGui.themes.mex_hack_display.hide_background = true
TimerGui.themes.mex_hack_display.timer_color = Color(0.9, 0.9, 0.9)
TimerGui.themes.mex_hack_display.working_text_color = TimerGui.themes.mex_hack_display.timer_color
TimerGui.themes.mex_hack_display.time_header_text_color = TimerGui.themes.mex_hack_display.timer_color
TimerGui.themes.mex_hack_display.time_header_text_font_size = 0
TimerGui.themes.mex_hack_display.time_text_color = TimerGui.themes.mex_hack_display.timer_color
TimerGui.themes.mex_hack_display.time_text_font_size = 100
TimerGui.themes.mex_hack_display.jammed = {}
TimerGui.themes.mex_hack_display.jammed.bg_rect = Color(0.1, 0, 0)
TimerGui.themes.mex_hack_display.upgrade_color_0 = Color(0, 0, 0)
TimerGui.themes.mex_hack_display.upgrade_color_1 = Color(0.2, 0.3, 0.4)
TimerGui.themes.mex_hack_display.upgrade_color_2 = TimerGui.themes.mex_hack_display.timer_color
TimerGui.themes.mex_hack_display.working_text_font_size = 0
TimerGui.themes.mex_hack_display.timer_lenght = 0
TimerGui.themes.lxy_control_display = {}
TimerGui.themes.lxy_control_display.hide_background = true
TimerGui.themes.lxy_control_display.jammed = {}
TimerGui.themes.lxy_control_display.jammed.bg_rect = Color(0.1, 0, 0, 0)
TimerGui.themes.lxy_control_display.upgrade_color_0 = Color(0, 0, 0)
TimerGui.themes.lxy_control_display.upgrade_color_1 = Color(0.2, 0.3, 0.4)
TimerGui.themes.lxy_control_display.upgrade_color_2 = TimerGui.themes.lxy_control_display.timer_color
TimerGui.themes.lxy_control_display.timer_color = Color(0.5, 1, 0.3, 0.3)
TimerGui.themes.lxy_control_display.working_text_font = Idstring("fonts/font_eurostile_ext")
TimerGui.themes.lxy_control_display.working_text_font_size = 120
TimerGui.themes.lxy_control_display.working_text_color = Color(0.75, 1, 0.3, 0.3)
TimerGui.themes.lxy_control_display.time_header_text_font = Idstring("fonts/font_eurostile_ext")
TimerGui.themes.lxy_control_display.time_header_text_font_size = 50
TimerGui.themes.lxy_control_display.time_header_text_color = Color(0.75, 1, 0.3, 0.3)
TimerGui.themes.lxy_control_display.time_text_font = Idstring("fonts/font_eurostile_ext")
TimerGui.themes.lxy_control_display.time_text_font_size = 90
TimerGui.themes.lxy_control_display.time_text_color = Color(0.75, 1, 0.3, 0.3)
TimerGui.themes.sand_control_display = {}
TimerGui.themes.sand_control_display.hide_background = true
TimerGui.themes.sand_control_display.timer_color = Color(0, 1, 0.7)
TimerGui.themes.sand_control_display.working_text_color = TimerGui.themes.sand_control_display.timer_color
TimerGui.themes.sand_control_display.time_header_text_color = TimerGui.themes.sand_control_display.timer_color
TimerGui.themes.sand_control_display.time_text_color = TimerGui.themes.sand_control_display.timer_color
TimerGui.themes.sand_control_display.jammed = {}
TimerGui.themes.sand_control_display.jammed.bg_rect = Color(0.1, 0, 0)
TimerGui.themes.sand_control_display.upgrade_color_0 = Color(0, 0, 0)
TimerGui.themes.sand_control_display.upgrade_color_1 = Color(0.2, 0.3, 0.4)
TimerGui.themes.sand_control_display.upgrade_color_2 = TimerGui.themes.sand_control_display.timer_color
TimerGui.themes.sand_control_display.time_header_text_font = Idstring("fonts/font_eurostile_ext")
TimerGui.themes.sand_control_display.time_header_text_font_size = 34
TimerGui.themes.sand_control_display.time_header_text_color = Color(0.75, 0.2, 1, 0.3)
TimerGui.themes.sand_control_display.working_text_font = Idstring("fonts/font_eurostile_ext")
TimerGui.themes.sand_control_display.working_text_font_size = 74
TimerGui.themes.sand_control_display.working_text_color = Color(0.75, 0.2, 1, 0.3)
TimerGui.themes.sand_control_display.time_text_font = Idstring("fonts/font_eurostile_ext")
TimerGui.themes.sand_control_display.time_text_font_size = 44
TimerGui.themes.sand_control_display.time_text_color = Color(0.75, 0.2, 1, 0.3)
TimerGui.themes.auc_hack_display = deep_clone(TimerGui.themes.lxy_control_display)
TimerGui.themes.auc_hack_display.timer_color = Color(0, 0.8, 0.3)
TimerGui.themes.auc_hack_display.working_text_color = TimerGui.themes.auc_hack_display.timer_color
TimerGui.themes.auc_hack_display.time_header_text_color = TimerGui.themes.auc_hack_display.timer_color
TimerGui.themes.auc_hack_display.time_text_color = TimerGui.themes.auc_hack_display.timer_color
TimerGui.upgrade_colors = {}
TimerGui.upgrade_colors.upgrade_color_0 = tweak_data.screen_colors.item_stage_3
TimerGui.upgrade_colors.upgrade_color_1 = tweak_data.screen_colors.text
TimerGui.upgrade_colors.upgrade_color_2 = tweak_data.hud.prime_color
TimerGui.EVENT_IDS = {}
TimerGui.EVENT_IDS.jammed = 1
TimerGui.EVENT_IDS.unjammed = 2
TimerGui._piggy_buff_mul = TimerGui._piggy_buff_mul or nil

function TimerGui.set_piggy_buff_mul(mul)
	TimerGui._piggy_buff_mul = mul or 1
end

function TimerGui:init(unit)
	self._unit = unit
	self._is_server = Network:is_server()

	if self._piggy_buff_mul == nil then
		TimerGui._piggy_buff_mul = 1

		if managers.mutators:is_mutator_active(MutatorPiggyRevenge) then
			local mutator = managers.mutators:get_mutator(MutatorPiggyRevenge)

			if mutator and mutator.drill_speed_multiplier then
				TimerGui._piggy_buff_mul = mutator:drill_speed_multiplier() or 1
			end
		end
	end

	self._visible = true
	self._powered = true
	self._jam_times = 3
	self._jammed = false
	self._can_jam = false
	self._show_seconds = self._show_seconds ~= false

	if self._show_seconds then
		self._show_seconds_text = " " .. managers.localization:text("prop_timer_gui_seconds")
	else
		self._show_seconds_text = ""
	end

	self._gui_start = self._gui_start or "prop_timer_gui_start"
	self._gui_working = self._gui_working or "prop_timer_gui_working"
	self._gui_malfunction = self._gui_malfunction or "prop_timer_gui_malfunction"
	self._gui_done = self._gui_done or "prop_timer_gui_done"
	self._cull_distance = self._cull_distance or 5000
	self._size_multiplier = self._size_multiplier or 1
	self._gui_object = self._gui_object or "gui_name"
	self._seq_timer_done = self._seq_timer_done or "timer_done"
	self._seq_set_is_jammed = self._seq_set_is_jammed or "set_is_jammed"
	self._seq_jammed_trigger = self._seq_jammed_trigger or "jammed_trigger"
	self._seq_resumed_trigger = self._seq_resumed_trigger or "resumed_trigger"
	self._new_gui = World:newgui()

	self:add_workspace(self._unit:get_object(Idstring(self._gui_object)))
	self:setup()
	self._unit:set_extension_update_enabled(IDS_TIMER_GUI, false)

	self._update_enabled = false
end

function TimerGui:set_show_seconds_text(show)
	self._show_seconds = show and true or false

	if self._show_seconds then
		self._show_seconds_text = " " .. managers.localization:text("prop_timer_gui_seconds")
	else
		self._show_seconds_text = ""
	end
end

function TimerGui:set_can_jam(can_jam)
	self._can_jam = can_jam
end

function TimerGui:set_jam_times(amount)
	if not self._can_jam then
		Application:error("[TimerGui] set_jam_times() - this device cannot jam, use another one.", self._unit)

		return
	end

	if amount == 0 then
		Application:error("[TimerGui] set_jam_times() - amount of jam times cannot be set below 1", self._unit)

		return
	end

	self._jam_times = amount
end

function TimerGui:set_override_timer(override_timer)
	self._override_timer = override_timer
end

function TimerGui:add_workspace(gui_object)
	self._ws = self._new_gui:create_object_workspace(0, 0, gui_object, Vector3(0, 0, 0))
	self._gui = self._ws:panel():gui(IDS_TIMER_GUI_GUI)
	self._gui_script = self._gui:script()
end

function TimerGui:get_upgrade_icon_color(upgrade_color)
	if not self.THEME then
		return TimerGui.upgrade_colors[upgrade_color]
	end

	local theme = TimerGui.themes[self.THEME]

	return theme and theme[upgrade_color] or TimerGui.upgrade_colors[upgrade_color]
end

function TimerGui:_set_theme(theme_name)
	local theme = TimerGui.themes[theme_name]

	if not theme then
		return
	end

	self._gui_script.drill_screen_background:set_visible(not theme.hide_background)

	if theme.timer_lenght then
		self._timer_lenght = theme.timer_lenght

		self._gui_script.timer_background:set_w(theme.timer_lenght)
	end

	if theme.timer_color then
		self._gui_script.timer:set_color(theme.timer_color)
	end

	if theme.timer_background_color then
		self._gui_script.timer_background:set_color(theme.timer_background_color)
	end

	if theme.working_text_color then
		self._gui_script.working_text:set_color(theme.working_text_color)
	end

	if theme.working_text_font then
		self._gui_script.working_text:set_font(theme.working_text_font)
	end

	if theme.working_text_font_size then
		self._gui_script.working_text:set_font_size(theme.working_text_font_size)
	end

	if theme.time_header_text_color then
		self._gui_script.time_header_text:set_color(theme.time_header_text_color)
	end

	if theme.time_header_text_font then
		self._gui_script.time_header_text:set_font(theme.time_header_text_font)
	end

	if theme.time_header_text_font_size then
		self._gui_script.time_header_text:set_font_size(theme.time_header_text_font_size)
	end

	if theme.time_text_color then
		self._gui_script.time_text:set_color(theme.time_text_color)
	end

	if theme.time_text_font then
		self._gui_script.time_text:set_font(theme.time_text_font)
	end

	if theme.time_text_font_size then
		self._gui_script.time_text:set_font_size(theme.time_text_font_size)
	end

	self._gui_script.bg_rect:set_visible(theme.bg_rect_color and true or false)

	if theme.bg_rect_color then
		self._gui_script.bg_rect:set_color(theme.bg_rect_color)
	end

	if theme.bg_rect_blend_mode then
		self._gui_script.bg_rect:set_blend_mode(theme.bg_rect_blend_mode)
	end

	if theme.bg_rect_render_template then
		self._gui_script.bg_rect:set_render_template(theme.bg_rect_render_template)
	end

	self:_set_original_colors()
end

function TimerGui:_set_original_colors()
	self._original_colors = {}

	for _, child in ipairs(self._gui_script.panel:children()) do
		self._original_colors[child:key()] = child:color()
	end
end

function TimerGui:setup()
	self._gui_script.working_text:set_render_template(IDS_TEXT)
	self._gui_script.time_header_text:set_render_template(IDS_TEXT)
	self._gui_script.time_text:set_render_template(IDS_TEXT)
	self._gui_script.drill_screen_background:set_size(self._gui_script.drill_screen_background:parent():size())

	local timer_parent = self._gui_script.timer:parent()

	self._gui_script.timer:set_h(120 * self._size_multiplier)
	self._gui_script.timer:set_w(timer_parent:w() - timer_parent:w() / 5)
	self._gui_script.timer:set_center_x(timer_parent:w() * 0.5)
	self._gui_script.timer:set_center_y(timer_parent:h() * 0.5 + 45 * self._size_multiplier)
	self._gui_script.timer:set_y(math.round(self._gui_script.timer:y()))

	self._timer_lenght = self._gui_script.timer:w()

	local background_size = 20 * self._size_multiplier

	self._gui_script.timer_background:set_h(self._gui_script.timer:h() + background_size)
	self._gui_script.timer_background:set_w(self._gui_script.timer:w() + background_size)
	self._gui_script.timer_background:set_center(self._gui_script.timer:center())
	self._gui_script.timer:set_w(0)

	local working_text_parent = self._gui_script.working_text:parent()

	self._gui_script.working_text:set_center_x(working_text_parent:w() / 2)
	self._gui_script.working_text:set_center_y(working_text_parent:h() / 2.75)
	self._gui_script.working_text:set_font_size(110 * self._size_multiplier)
	self._gui_script.working_text:set_text(managers.localization:text(self._gui_start))
	self._gui_script.working_text:set_visible(true)

	local working_text_h = working_text_parent:h()
	local working_text_half_w = working_text_parent:w() / 2

	self._gui_script.time_header_text:set_font_size(80 * self._size_multiplier)
	self._gui_script.time_header_text:set_visible(false)
	self._gui_script.time_header_text:set_center_x(working_text_half_w)
	self._gui_script.time_header_text:set_center_y(working_text_h / 1.325)
	self._gui_script.time_text:set_font_size(110 * self._size_multiplier)
	self._gui_script.time_text:set_visible(false)
	self._gui_script.time_text:set_center_x(working_text_half_w)
	self._gui_script.time_text:set_center_y(working_text_h / 1.125)

	if self.THEME then
		self:_set_theme(self.THEME)
	end

	self._original_colors = {}

	self._gui_script.panel:set_alpha(1)

	for _, child in ipairs(self._gui_script.panel:children()) do
		self._original_colors[child:key()] = child:color()
	end

	self._gui_script.panel:set_alpha(0.8)
end

function TimerGui:reset(stop)
	self._started = false

	if stop then
		self:_set_done()
		self:post_event(self._done_event)
	end

	if not self._start_tweak_data then
		return
	end

	local int_ext = self._unit:interaction()

	if int_ext then
		int_ext:set_tweak_data(self._start_tweak_data)
		int_ext:set_active(not stop)
	end
end

function TimerGui:stop_and_reset()
	self:reset(true)
end

function TimerGui:_start(timer, current_timer)
	self._started = true
	self._done = false
	self._timer = timer or 5
	self._current_timer = current_timer or self._timer
	self._time_left = self._current_timer * self:get_timer_multiplier()

	self._gui_script.timer:set_w(self._timer_lenght * (1 - self._current_timer / self._timer))
	self._gui_script.working_text:set_text(managers.localization:text(self._gui_working))
	self._unit:set_extension_update_enabled(IDS_TIMER_GUI, true)

	self._update_enabled = true

	self:post_event(self._start_event)
	self._gui_script.time_header_text:set_visible(true)
	self._gui_script.time_text:set_visible(true)
	self._gui_script.time_text:set_text(math.floor(self._time_left) .. self._show_seconds_text)

	local base_ext = self._unit:base()

	if base_ext then
		base_ext:start()
	else
		Application:error("[TimerGui] _start() - missing a base extension on the unit.", self._unit)
	end

	if self._is_server then
		self:_set_jamming_values()
	end
end

function TimerGui:_set_jamming_values()
	if not self._can_jam then
		return
	end

	self._jamming_intervals = {}

	local jammed_times = math.random(self._jam_times)
	local interval = self._timer / jammed_times

	for i = 1, jammed_times do
		local start = interval / 2

		self._jamming_intervals[i] = start + math.rand(start / 1.25)
	end

	self:get_next_jamming_interval()
end

function TimerGui:get_next_jamming_interval()
	if not self._jamming_intervals or not next(self._jamming_intervals) then
		self._current_jam_timer = nil
		self._jamming_intervals = nil

		return
	end

	self._current_jam_timer = table.remove(self._jamming_intervals, 1)
end

function TimerGui:set_timer_multiplier(multiplier)
	self._timer_multiplier = multiplier
end

function TimerGui:get_timer_multiplier()
	local timer_multiplier = self._timer_multiplier or 1

	timer_multiplier = timer_multiplier * self._piggy_buff_mul

	return math.max(timer_multiplier, 0.01)
end

function TimerGui:set_skill(skill)
	if self._skill == nil or skill > self._skill then
		self._skill = skill
	end
end

function TimerGui:set_background_icons(background_icons)
	local panel = self._gui_script.panel
	local background_icons_panel = panel:child("background_icons_panel") or panel:panel({
		name = "background_icons_panel"
	})

	background_icons_panel:rect({
		layer = 3,
		color = Color.green
	})

	for _, child in ipairs(background_icons_panel:children()) do
		self._original_colors[child:key()] = nil
	end

	background_icons_panel:clear()

	local alpha = panel:alpha()

	panel:set_alpha(1)

	self._original_colors = self._original_colors or {}

	for i, icon_data in ipairs(background_icons) do
		local icon = background_icons_panel:bitmap(icon_data)

		self._original_colors[icon:key()] = icon_data.color or icon:color()
	end

	panel:set_alpha(alpha)
end

function TimerGui:start(timer)
	timer = self._override_timer or timer

	if not self._started then
		self:_start(timer)

		if self._is_server then
			managers.network:send_to_peers_synched("start_timer_gui", self._unit, timer)
		end
	end

	if not self._powered then
		self:set_powered(true)
	end

	if self._jammed then
		self:set_jammed(false)
	end
end

function TimerGui:sync_start(timer)
	self:_start(timer)
end

function TimerGui:update(unit, t, dt)
	if self._jammed then
		local alpha = 0.5 + (math.sin(t * 750) + 1) / 4

		self._gui_script.drill_screen_background:set_color(self._gui_script.drill_screen_background:color():with_alpha(alpha))
		self._gui_script.bg_rect:set_color(self._gui_script.bg_rect:color():with_alpha(alpha))

		return
	end

	if not self._powered then
		return
	end

	local dt_mod = self:get_timer_multiplier()
	local timer_dt = dt / dt_mod

	if self._current_jam_timer then
		self._current_jam_timer = self._current_jam_timer - timer_dt

		if self._current_jam_timer <= 0 then
			self:set_jammed(true)
			self:get_next_jamming_interval()

			return
		end
	end

	self._current_timer = math.max(0, self._current_timer - timer_dt)
	self._time_left = self._current_timer * dt_mod

	self._gui_script.time_text:set_text(math.floor(self._time_left) .. self._show_seconds_text)

	local progress_bar_pct = 1 - self._current_timer / self._timer

	self._gui_script.timer:set_w(self._timer_lenght * progress_bar_pct)

	if self._current_timer == 0 then
		self._unit:set_extension_update_enabled(IDS_TIMER_GUI, false)

		self._update_enabled = false

		self:done()
	else
		self._gui_script.working_text:set_color(self._gui_script.working_text:color():with_alpha(0.5 + (math.sin(t * 750) + 1) / 4))
	end
end

function TimerGui:set_visible(visible)
	self._visible = visible

	self._gui:set_visible(visible)
end

function TimerGui:is_visible()
	return self._visible
end

function TimerGui:sync_net_event(event_id)
	if event_id == TimerGui.EVENT_IDS.jammed then
		self:_set_jammed(true)
	elseif event_id == TimerGui.EVENT_IDS.unjammed then
		self:_set_jammed(false)
	end
end

function TimerGui:set_jammed(jammed)
	if self._is_server then
		local event_id = jammed and TimerGui.EVENT_IDS.jammed or TimerGui.EVENT_IDS.unjammed

		managers.network:send_to_peers_synched("sync_unit_event_id_16", self._unit, "timer_gui", event_id)
	end

	self:_set_jammed(jammed)
end

function TimerGui:_set_jammed(jammed)
	self._jammed = jammed

	if self._jammed then
		local dmg_ext = self._unit:damage()

		if dmg_ext then
			if dmg_ext:has_sequence(self._seq_set_is_jammed) then
				dmg_ext:run_sequence_simple(self._seq_set_is_jammed)
			end

			if dmg_ext:has_sequence(self._seq_jammed_trigger) then
				dmg_ext:run_sequence_simple(self._seq_jammed_trigger)
			end
		end

		for _, child in ipairs(self._gui_script.panel:children()) do
			local theme = TimerGui.themes[self.THEME]

			if child.children then
				for _, grandchild in ipairs(child:children()) do
					local color = self._original_colors[grandchild:key()]
					local c = Color(color.a, 1, 0, 0)

					grandchild:set_color(c)
				end
			else
				local color = self._original_colors[child:key()]
				local jammed_color = theme and theme.jammed and theme.jammed[child:name()] or Color.red
				local c = jammed_color:with_alpha(color.a)

				child:set_color(c)

				local blend_mode = theme and theme.jammed and theme.jammed[child:name() .. "_blend_mode"]

				if blend_mode then
					child:set_blend_mode(blend_mode)
				end
			end
		end

		self._gui_script.working_text:set_text(managers.localization:text(self._gui_malfunction))
		self._gui_script.time_text:set_text(managers.localization:text("prop_timer_gui_error"))

		local int_ext = self._unit:interaction()

		if int_ext then
			if self._jammed_tweak_data then
				int_ext:set_tweak_data(self._jammed_tweak_data)
			end

			int_ext:set_active(true)
		end

		self:post_event(self._jam_event)
	else
		local dmg_ext = self._unit:damage()

		if dmg_ext and dmg_ext:has_sequence(self._seq_resumed_trigger) then
			dmg_ext:run_sequence_simple(self._seq_resumed_trigger)
		end

		for _, child in ipairs(self._gui_script.panel:children()) do
			if child.children then
				for _, grandchild in ipairs(child:children()) do
					grandchild:set_color(self._original_colors[grandchild:key()])
				end
			else
				child:set_color(self._original_colors[child:key()])
			end
		end

		self._gui_script.working_text:set_text(managers.localization:text(self._gui_working))
		self._gui_script.time_text:set_text(math.floor(self._time_left or self._current_timer) .. self._show_seconds_text)
		self._gui_script.drill_screen_background:set_color(self._gui_script.drill_screen_background:color():with_alpha(1))
		self:post_event(self._resume_event)

		local theme = TimerGui.themes[self.THEME]

		if theme and theme.bg_rect_blend_mode then
			self._gui_script.bg_rect:set_blend_mode(theme.bg_rect_blend_mode)
		end

		local int_ext = self._unit:interaction()

		if int_ext then
			int_ext:set_active(false)
		end
	end

	self._unit:base():set_jammed(jammed)

	local door_ext = self._unit:mission_door_device()

	if door_ext then
		door_ext:report_jammed_state(jammed)
	end
end

function TimerGui:set_powered(powered, enable_interaction)
	self:_set_powered(powered, enable_interaction)
end

function TimerGui:_set_powered(powered, enable_interaction)
	self._powered = powered

	if not self._powered then
		if self._started then
			self:post_event(self._power_off_event or self._jam_event)
		end

		for _, child in ipairs(self._gui_script.panel:children()) do
			if child.children then
				for _, grandchild in ipairs(child:children()) do
					local color = self._original_colors[grandchild:key()]
					local c = Color(color.a, 1, 0, 0)

					grandchild:set_color(c)
				end
			else
				local color = self._original_colors[child:key()]
				local c = Color(color.a, 1, 0, 0)

				child:set_color(c)
			end
		end

		if enable_interaction then
			local int_ext = self._unit:interaction()

			if int_ext then
				self._powered_interaction_enabled = enable_interaction

				if self._jammed_tweak_data then
					int_ext:set_tweak_data(self._jammed_tweak_data)
				end

				int_ext:set_active(true)
			end
		end
	else
		if self._started then
			self:post_event(self._resume_event)
		end

		for _, child in ipairs(self._gui_script.panel:children()) do
			if child.children then
				for _, grandchild in ipairs(child:children()) do
					grandchild:set_color(self._original_colors[grandchild:key()])
				end
			else
				child:set_color(self._original_colors[child:key()])
			end
		end

		if self._powered_interaction_enabled then
			self._powered_interaction_enabled = nil

			local door_ext = self._unit:mission_door_device()

			if door_ext then
				door_ext:report_resumed()
			end
		end
	end

	self._unit:base():set_powered(powered)
end

function TimerGui:done()
	self:_set_done()

	local dmg_ext = self._unit:damage()

	if dmg_ext and dmg_ext:has_sequence(self._seq_timer_done) then
		dmg_ext:run_sequence_simple(self._seq_timer_done)
	end

	self:post_event(self._done_event)

	local door_ext = self._unit:mission_door_device()

	if door_ext then
		door_ext:report_completed()
	end
end

function TimerGui:is_playing_done_event()
	return self._is_playing_done_event and true or false
end

function TimerGui:add_listener_to_done_event(clbk)
	self._done_event_listeners = self._done_event_listeners or {}

	table.insert(self._done_event_listeners, clbk)
end

function TimerGui:on_done_event_ended(event_instance, sound_source, event_type)
	if not self._is_playing_done_event then
		return
	end

	self._is_playing_done_event = nil

	if event_type ~= "end_of_event" or not alive(self._unit) then
		return
	end

	if self._done_event_listeners then
		local listeners = self._done_event_listeners

		self._done_event_listeners = nil

		for _, clbk in ipairs(listeners) do
			clbk(self._unit)
		end
	end
end

function TimerGui:_set_done()
	if self._done then
		return
	end

	self._done = true

	self._gui_script.timer:set_w(self._timer_lenght)
	self._gui_script.working_text:set_color(self._gui_script.working_text:color():with_alpha(1))
	self._gui_script.working_text:set_text(managers.localization:text(self._gui_done))
	self._gui_script.time_header_text:set_visible(false)
	self._gui_script.time_text:set_visible(false)
	self._unit:base():done()
end

function TimerGui:update_sound_event()
	if self._done or not self._started or self._jammed or not self._powered then
		return
	end

	self:post_event(self._resume_event)
end

function TimerGui:hide()
	self._ws:hide()
end

function TimerGui:show()
	self._ws:show()
end

function TimerGui:lock_gui()
	self._ws:set_cull_distance(self._cull_distance)
	self._ws:set_frozen(true)
end

function TimerGui:destroy()
	if alive(self._new_gui) and alive(self._ws) then
		self._new_gui:destroy_workspace(self._ws)
	end

	self._ws = nil
	self._new_gui = nil
	self._gui = nil
	self._gui_script = nil
end

function TimerGui:save(data)
	local state = {}

	state.started = self._started
	state.update_enabled = self._update_enabled
	state.timer = self._timer
	state.current_timer = self._current_timer
	state.jammed = self._jammed
	state.powered = self._powered
	state.powered_interaction_enabled = self._powered_interaction_enabled
	state.done = self._done
	state.visible = self._visible
	state.timer_multiplier = self._timer_multiplier
	state.skill = self._skill
	data.TimerGui = state
end

function TimerGui:load(data)
	local state = data.TimerGui

	self:set_skill(state.skill or 1)

	if state.done then
		self:_set_done()
	else
		if state.started and state.update_enabled then
			self:_start(state.timer, state.current_timer)
		else
			self._timer = state.timer
			self._current_timer = state.current_timer
		end

		if state.update_enabled then
			if state.jammed then
				self:_set_jammed(state.jammed)
			end

			if not state.powered then
				self:_set_powered(state.powered, state.powered_interaction_enabled)
			end

			if not state.jammed then
				local int_ext = self._unit:interaction()

				if int_ext and int_ext.check_for_upgrade then
					int_ext:check_for_upgrade()
				end
			end
		end
	end

	self:set_visible(state.visible)
	self:set_timer_multiplier(state.timer_multiplier or 1)
	self._unit:set_extension_update_enabled(IDS_TIMER_GUI, state.update_enabled and true or false)
end

function TimerGui:post_event(event)
	if not event then
		return
	end

	local sound_event = event

	if event == self._start_event or event == self._resume_event or event == self._done_event then
		if self._skill == 3 then
			sound_event = sound_event .. "_aced"
		elseif self._skill == 2 then
			sound_event = sound_event .. "_basic"
		end
	end

	if event == self._done_event then
		self._is_playing_done_event = true

		local clbk = callback(self, self, "on_done_event_ended")
		local event_instance = self._unit:sound_source():post_event(sound_event, clbk, nil, "end_of_event")

		if not event_instance then
			self._is_playing_done_event = nil

			Application:error("[TimerGui] post_event() - couldn't play done event with name:", sound_event)
		end
	else
		self._unit:sound_source():post_event(sound_event)
	end
end

DrillTimerGui = DrillTimerGui or class(TimerGui)
