HUDAccessCamera = HUDAccessCamera or class()

local old_buttons = not _G.IS_VR

function HUDAccessCamera:init(hud, full_hud)
	self._hud_panel = hud.panel
	self._full_hud_panel = full_hud.panel

	self._hud_panel:clear()
	self._full_hud_panel:clear()

	self._markers = {}

	local legend_rect_bg = self._hud_panel:rect({
		h = 32,
		name = "legend_rect_bg",
		valign = "bottom",
		x = self._hud_panel:w() / 4,
		y = hud.panel:h() - 64,
		w = self._hud_panel:w() / 2,
		color = Color.black
	})
	local legend_prev = self._hud_panel:text({
		align = "left",
		font_size = 28,
		layer = 1,
		name = "legend_prev",
		text_id = "hud_prev_camera",
		valign = "bottom",
		vertical = "bottom",
		word_wrap = false,
		wrap = false,
		y = -32,
		x = legend_rect_bg:x() + 10,
		font = tweak_data.hud.medium_font
	})
	local legend_next = self._hud_panel:text({
		align = "right",
		font_size = 28,
		layer = 1,
		name = "legend_next",
		text = "[MOUSE 1]>",
		valign = "bottom",
		vertical = "bottom",
		word_wrap = false,
		wrap = false,
		y = -32,
		x = legend_rect_bg:right() - 10,
		font = tweak_data.hud.medium_font
	})

	legend_next:set_right(legend_rect_bg:right() - 10)

	local legend_exit = self._hud_panel:text({
		align = "center",
		font_size = 28,
		layer = 1,
		name = "legend_exit",
		text = "EXIT[SPACE]",
		valign = "bottom",
		vertical = "bottom",
		word_wrap = false,
		wrap = false,
		y = -32,
		font = tweak_data.hud.medium_font
	})

	legend_exit:set_center_x(legend_rect_bg:center_x())
	self._hud_panel:text({
		align = "left",
		font_size = 32,
		layer = 1,
		name = "camera_name",
		text = "",
		valign = "bottom",
		vertical = "bottom",
		word_wrap = false,
		wrap = false,
		x = 10,
		font = tweak_data.hud.medium_font
	})
	self._hud_panel:text({
		align = "right",
		font_size = 32,
		layer = 1,
		name = "date",
		text = "",
		valign = "bottom",
		vertical = "bottom",
		word_wrap = false,
		wrap = false,
		x = -10,
		font = tweak_data.hud.medium_font
	})
	self._hud_panel:rect({
		h = 32,
		name = "rect_bg",
		valign = "bottom",
		y = hud.panel:h() - 32,
		color = Color.black
	})
	self._hud_panel:rect({
		h = 32,
		name = "destroyed_rect_bg",
		visible = false,
		color = Color.black
	})
	self._hud_panel:text({
		align = "left",
		font_size = 32,
		layer = 1,
		name = "destroyed_text",
		text = "FEED LOST",
		vertical = "top",
		visible = false,
		word_wrap = false,
		wrap = false,
		x = 10,
		font = tweak_data.hud.medium_font
	})
	self._full_hud_panel:rect({
		layer = -1,
		name = "destroyed_rect",
		valign = "scale",
		visible = false,
		color = Color(0.5, 0.5, 0.5)
	})

	local size = self._full_hud_panel:w() + 50

	self._full_hud_panel:bitmap({
		halign = "scale",
		layer = 3,
		name = "noise",
		texture = "core/textures/noise",
		valign = "scale",
		wrap_mode = "wrap",
		w = size,
		h = size,
		texture_rect = {
			0,
			0,
			size,
			size
		},
		color = Color.black:with_alpha(0.2)
	})
	self._full_hud_panel:bitmap({
		halign = "scale",
		layer = 3,
		name = "noise2",
		texture = "core/textures/noise",
		valign = "scale",
		wrap_mode = "wrap",
		w = size,
		h = size,
		texture_rect = {
			0,
			0,
			size,
			size
		},
		color = Color.black:with_alpha(0.2)
	})
	self._full_hud_panel:rect({
		blend_mode = "add",
		halign = "scale",
		name = "tint",
		valign = "scale",
		w = size,
		h = size,
		color = Color.transparent
	})
end

function HUDAccessCamera:start()
	local prev = "hud_prev_camera"
	local next = "hud_next_camera"

	self._hud_panel:child("legend_prev"):set_text(utf8.to_upper(managers.localization:text(prev, {
		BTN_PRIMARY = managers.localization:btn_macro(old_buttons and "primary_attack" or "suvcam_next")
	})))
	self._hud_panel:child("legend_next"):set_text(utf8.to_upper(managers.localization:text(next, {
		BTN_SECONDARY = managers.localization:btn_macro(old_buttons and "secondary_attack" or "suvcam_prev")
	})))
	self._hud_panel:child("legend_exit"):set_text(utf8.to_upper(managers.localization:text("hud_exit_camera", {
		BTN_JUMP = managers.localization:btn_macro(old_buttons and "jump" or "suvcam_exit")
	})))

	self._active = true

	self._hud_panel:animate(callback(self, self, "_animate_date"))
end

function HUDAccessCamera:stop()
	self._active = false
end

function HUDAccessCamera:set_destroyed(destroyed, no_feed)
	self._full_hud_panel:child("destroyed_rect"):set_visible(destroyed)
	self._full_hud_panel:child("tint"):set_visible(not destroyed)
	self._hud_panel:child("destroyed_rect_bg"):set_visible(destroyed)
	self._hud_panel:child("destroyed_text"):set_text(managers.localization:text(no_feed and "hud_access_camera_no_feed" or "hud_access_camera_feed_lost"))
	self._hud_panel:child("destroyed_text"):set_visible(destroyed)
end

function HUDAccessCamera:set_camera_name(name)
	self._hud_panel:child("camera_name"):set_text(utf8.to_upper(name))
end

function HUDAccessCamera:set_camera_theme(theme)
	local theme_data = tweak_data.camera_themes[theme] or tweak_data.camera_themes.default

	if not theme_data then
		return
	end

	if self._theme == theme then
		return
	end

	self._theme = theme

	local size = self._full_hud_panel:w() + 50
	local tint = self._full_hud_panel:child("tint")
	local noise = self._full_hud_panel:child("noise")
	local noise2 = self._full_hud_panel:child("noise2")

	noise:set_image(theme_data.noise_texture, 0, 0, size, size)
	noise:set_color(theme_data.noise_color)
	noise2:set_image(theme_data.noise2_texture, 0, 0, size, size)
	noise2:set_color(theme_data.noise2_color)
	tint:set_color(theme_data.tint_color)
end

function HUDAccessCamera:damage_taken()
	local tint = self._full_hud_panel:child("tint")

	tint:stop()
	tint:animate(callback(self, self, "_animate_damage_taken"))
end

function HUDAccessCamera:_animate_damage_taken(o)
	local total_t = 0.16
	local t = (1 - o:alpha()) * total_t
	local multiplier = 0.5

	while t < total_t do
		local dt = coroutine.yield()

		t = t + dt

		local progress = 1 - t / total_t

		o:set_alpha(progress * multiplier + 1)
	end

	o:set_alpha(1)
end

function HUDAccessCamera:set_date(date)
	self._hud_panel:child("date"):set_text(date)
end

function HUDAccessCamera:_animate_date()
	while self._active do
		local dt = coroutine.yield()

		self:set_date(Application:date("%Y-%m-%d %H:%M:%S"))
		self._full_hud_panel:child("noise"):set_x(-math.random(50))
		self._full_hud_panel:child("noise"):set_y(-math.random(50))
	end
end

function HUDAccessCamera:draw_marker(i, pos)
	self._markers = self._markers or {}

	if not self._markers[i] then
		self._markers[i] = self._full_hud_panel:bitmap({
			layer = -2,
			texture = "guis/textures/access_camera_marker",
			color = Color.white,
			x = pos.x,
			y = pos.y
		})
	end

	self._markers[i]:set_center(pos.x, pos.y)
end

function HUDAccessCamera:max_markers(amount)
	while amount < #self._markers do
		local obj = table.remove(self._markers, amount + 1)

		self._full_hud_panel:remove(obj)
	end
end
