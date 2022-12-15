WeaponFiremodeGui = WeaponFiremodeGui or class()
WeaponFiremodeGui.COLORS = {
	black = Color(0, 0, 0),
	white = Color(1, 1, 1),
	grey = Color(0.8, 0.8, 0.8),
	red = Color(0.8, 0, 0),
	green = Color(0, 0.8, 0),
	blue = Color(0, 0, 0.8),
	yellow = Color(0.8, 0.8, 0),
	orange = Color(0.8, 0.4, 0),
	light_red = Color(0.8, 0.4, 0.4),
	light_blue = Color(0.4, 0.6, 0.8),
	light_green = Color(0.6, 0.8, 0.4),
	light_yellow = Color(0.8, 0.8, 0.4),
	light_orange = Color(0.8, 0.6, 0.4),
	purple = Color(0.8, 0, 0.8)
}
WeaponFiremodeGui._EXTENSION_NAME = "digital_gui"
local mvector_tl = Vector3()
local mvector_tr = Vector3()
local mvector_bl = Vector3()
local mvector_br = Vector3()

function WeaponFiremodeGui:init(unit)
	self._unit = unit
	self._visible = true
	self.WIDTH = self.WIDTH or 640
	self.HEIGHT = self.HEIGHT or 360
	self.FONT = self.FONT or "fonts/font_digital"
	self.FONT_SIZE = self.FONT_SIZE or 80
	self.FIRE_MODE_COLOR_TYPES = {
		auto = self.AUTO_COLOR_TYPE or "light_blue",
		volley = self.VOLLEY_COLOR_TYPE or "green"
	}
	self.FIRE_MODE_COLORS = {
		auto = WeaponFiremodeGui.COLORS[self.FIRE_MODE_COLOR_TYPES.auto],
		volley = WeaponFiremodeGui.COLORS[self.FIRE_MODE_COLOR_TYPES.volley]
	}
	self.BG_COLOR_TYPE = self.BG_COLOR_TYPE

	if self.BG_COLOR_TYPE then
		self.BG_COLOR = WeaponFiremodeGui.COLORS[self.BG_COLOR_TYPE]
	end

	self._volley_data = {
		charge_start_t = 0,
		charge_max_t = 0,
		num_bars = self.VOLLEY_CHARGE_BARS or 5
	}
	self._firemode = nil
	self._firemode_panel = nil
	self._gui_object = self._gui_object or "gui_object"
	self._new_gui = World:gui()

	self:add_workspace(self._unit:get_object(Idstring(self._gui_object)))
	self:setup()
	self._unit:set_extension_update_enabled(Idstring(self._EXTENSION_NAME), false)
end

function WeaponFiremodeGui:add_workspace(gui_object)
	self._ws = self._new_gui:create_object_workspace(self.WIDTH, self.HEIGHT, gui_object, Vector3(0, 0, 0))
	self._panel = self._ws:panel()
end

function WeaponFiremodeGui:setup()
	self._panel:clear()

	self._firemode_panel = nil

	if self.BG_COLOR then
		self._bg_rect = self._panel:rect({
			layer = -1,
			color = self.BG_COLOR
		})
	end

	local font = self.FONT
	local font_size = self.FONT_SIZE
	self._auto_fire_panel = self._panel:panel({
		visible = false,
		name = "auto_fire"
	})

	self._auto_fire_panel:text({
		text = "000",
		name = "ammo",
		vertical = "center",
		align = "center",
		layer = 0,
		font = font,
		font_size = font_size,
		color = self.FIRE_MODE_COLORS.auto
	})

	local padding = 4
	local half_padding = padding * 0.5
	self._volley_fire_panel = self._panel:panel({
		visible = false,
		name = "volley_fire"
	})

	self._volley_fire_panel:text({
		vertical = "center",
		name = "ammo",
		align = "center",
		text = "000",
		layer = 0,
		w = self._volley_fire_panel:w() * 0.5,
		font = font,
		font_size = font_size,
		color = self.FIRE_MODE_COLORS.volley
	})

	self._volley_charge_panel = self._volley_fire_panel:panel({
		name = "charge_panel",
		w = self._volley_fire_panel:w() * 0.5 - padding * 2,
		h = self._volley_fire_panel:h() - padding * 2,
		x = self._volley_fire_panel:w() * 0.5,
		y = padding
	})
	self._volley_charge_bars = {}
	local width = (self._volley_charge_panel:width() - (self._volley_data.num_bars - 1) * half_padding - 2 * padding) / self._volley_data.num_bars
	local height = self._volley_charge_panel:height() - padding * 2
	local volley_charge_box_gui = BoxGuiObject:new(self._volley_charge_panel, {
		color = self.FIRE_MODE_COLORS.volley,
		sides = {
			2,
			2,
			2,
			2
		}
	})

	for i = 1, self._volley_data.num_bars do
		local gui_obj = self._volley_charge_panel:bitmap({
			texture = "guis/textures/pd2/shared_lines",
			visible = false,
			color = self.FIRE_MODE_COLORS.volley,
			width = width,
			height = height,
			x = padding + (i - 1) * (width + half_padding),
			y = padding
		})
		local x = math.random(1, 255)
		local y = math.random(0, math.round(gui_obj:texture_height() / 2 - 1)) * 2
		local w = width
		local h = height

		gui_obj:set_halign("left")
		gui_obj:set_valign("scale")
		mvector3.set_static(mvector_tl, x, y + w, 0)
		mvector3.set_static(mvector_tr, x, y, 0)
		mvector3.set_static(mvector_bl, x + h, y + w, 0)
		mvector3.set_static(mvector_br, x + h, y, 0)
		gui_obj:set_texture_coordinates(mvector_tl, mvector_tr, mvector_bl, mvector_br)
		table.insert(self._volley_charge_bars, gui_obj)
	end

	if self.RENDER_TEMPLATE then
		local render_template_ids = Idstring(self.RENDER_TEMPLATE)

		self._auto_fire_panel:child("ammo"):set_render_template(render_template_ids)
		self._volley_fire_panel:child("ammo"):set_render_template(render_template_ids)
		volley_charge_box_gui:set_render_template(self.RENDER_TEMPLATE)

		for _, gui_obj in ipairs(self._volley_charge_bars) do
			gui_obj:set_render_template(render_template_ids)
		end
	end

	if self.BLEND_MODE then
		self._auto_fire_panel:child("ammo"):set_blend_mode(self.BLEND_MODE)
		self._volley_fire_panel:child("ammo"):set_blend_mode(self.BLEND_MODE)
		volley_charge_box_gui:set_blend_mode(self.BLEND_MODE)

		for _, gui_obj in ipairs(self._volley_charge_bars) do
			gui_obj:set_blend_mode(self.BLEND_MODE)
		end
	end

	if self._firemode then
		self:set_firemode(self._firemode)
	end
end

function WeaponFiremodeGui:update(unit, t, dt)
	if self._firemode == "volley" then
		local ratio = math.map_range(t, self._volley_data.charge_start_t, self._volley_data.charge_start_t + self._volley_data.charge_max_t, 0, 1)
		ratio = math.clamp(ratio, 0, 1)
		local bars_show = math.clamp(math.ceil(#self._volley_charge_bars * ratio), 1, #self._volley_charge_bars)

		self._volley_charge_bars[bars_show]:show()
	end
end

function WeaponFiremodeGui:set_firemode(firemode)
	self._firemode = firemode

	if self._firemode_panel then
		self._firemode_panel:hide()
	end

	if firemode then
		local firemode_panel_name = string.format("_%s_fire_panel", firemode)
		self._firemode_panel = self[firemode_panel_name]

		if self._firemode_panel then
			self._firemode_panel:show()

			local ammo_text = self._firemode_panel:child("ammo")

			if ammo_text and self._bg_rect then
				self._bg_rect:set_color(ammo_text:color())
			end
		end
	end

	self._unit:set_extension_update_enabled(Idstring(self._EXTENSION_NAME), false)
end

function WeaponFiremodeGui:set_ammo(ammo, color)
	if self._firemode_panel then
		local ammo_text = self._firemode_panel:child("ammo")

		if ammo_text then
			local ammo_string = string.format("%3d", ammo)

			ammo_text:set_text(ammo_string)

			color = color or self.FIRE_MODE_COLORS[self._firemode]

			if ammo_text:color() ~= color then
				self:set_color(color, self._firemode_panel)
			end

			if self._bg_rect then
				self._bg_rect:set_color(ammo_text:color())
			end
		end
	end
end

function WeaponFiremodeGui:set_color(color, rec_panel)
	self._color = color

	for i, d in pairs(rec_panel and rec_panel:children() or self._panel:children()) do
		if d.set_color then
			d:set_color(color)
		else
			self:set_color(color, d)
		end
	end
end

function WeaponFiremodeGui:start_volley_charge(charge_max_t)
	self._volley_data.charge_start_t = managers.player:player_timer():time()
	self._volley_data.charge_max_t = charge_max_t

	self._unit:set_extension_update_enabled(Idstring(self._EXTENSION_NAME), true)
end

function WeaponFiremodeGui:stop_volley_charge()
	for _, bar_obj in ipairs(self._volley_charge_bars) do
		bar_obj:hide()
	end

	self._unit:set_extension_update_enabled(Idstring(self._EXTENSION_NAME), false)
end

function WeaponFiremodeGui:set_visible(visible)
	self._visible = visible

	if visible then
		self._ws:show()
	else
		self._ws:hide()
	end
end

function WeaponFiremodeGui:lock_gui()
	self._ws:set_cull_distance(self._cull_distance)
	self._ws:set_frozen(true)
end

function WeaponFiremodeGui:destroy()
	if alive(self._new_gui) and alive(self._ws) then
		self._new_gui:destroy_workspace(self._ws)

		self._ws = nil
		self._new_gui = nil
	end
end

WeaponFiremodeGuiUpper = WeaponFiremodeGuiUpper or class(WeaponFiremodeGui)
WeaponFiremodeGuiUpper._EXTENSION_NAME = "digital_gui_upper"
