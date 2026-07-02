HUDDriving = HUDDriving or class()

function HUDDriving:init(hud, full_hud)
	self._hud_panel = hud.panel
	self._full_hud_panel = full_hud.panel

	self._hud_panel:clear()
	self._full_hud_panel:clear()

	self._markers = {}

	local y_pos = -90
	local legend_rect_bg = self._hud_panel:rect({
		h = 32,
		layer = 0,
		name = "legend_rect_bg",
		valign = "bottom",
		x = 150,
		color = Color.black,
		w = self._hud_panel:w() - 300,
		y = hud.panel:h() - 120
	})

	self._hud_panel:text({
		align = "center",
		font_size = 28,
		layer = 1,
		name = "value_speed",
		text = "100 kmph",
		valign = "bottom",
		vertical = "bottom",
		word_wrap = false,
		wrap = false,
		x = 0,
		y = y_pos,
		font = tweak_data.hud.medium_font,
		color = Color.white
	})
	self._hud_panel:text({
		align = "left",
		font_size = 28,
		layer = 1,
		name = "value_RPM",
		text = "7200",
		valign = "bottom",
		vertical = "bottom",
		word_wrap = false,
		wrap = false,
		x = legend_rect_bg:x() + 10,
		y = y_pos,
		font = tweak_data.hud.medium_font,
		color = Color.white
	})
	self._hud_panel:text({
		align = "right",
		font_size = 28,
		layer = 1,
		name = "value_gear",
		text = "N",
		valign = "bottom",
		vertical = "bottom",
		word_wrap = false,
		wrap = false,
		x = -170,
		y = y_pos,
		font = tweak_data.hud.medium_font,
		color = Color.white
	})
end

function HUDDriving:start()
	self._active = true
end

function HUDDriving:stop()
	self._active = false
end

function HUDDriving:set_vehicle_state(speed, rpm, gear)
	self._hud_panel:child("value_speed"):set_text(string.format("%d", speed) .. " km/h")
	self._hud_panel:child("value_RPM"):set_text(rpm .. " rpm")
	self._hud_panel:child("value_gear"):set_text(gear)
end
