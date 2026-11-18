local large_font = tweak_data.menu.pd2_large_font
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local massive_font_size = tweak_data.menu.pd2_massive_font_size

ModWorkshopModDetailsGui = ModWorkshopModDetailsGui or class(ListGrowPanel)

function ModWorkshopModDetailsGui:init(parent, config)
	local w = parent:w()

	ModWorkshopModDetailsGui.super.init(self, parent, table.set_defaults(config, {
		border_y = 8,
		input = true,
		name = "mod_details",
		padding_x = 8,
		padding_y = 8,
		fixed_w = w
	}))

	local row_w = self:row_w()

	self._name = self:add_item(self:text({
		name = "name",
		text_wrap = true,
		wrap = true,
		w = row_w,
		font = large_font,
		font_size = medium_font_size
	}))
	self._short_desc = self:add_item(self:text({
		name = "short_desc",
		text_wrap = true,
		wrap = true,
		w = row_w,
		font = large_font,
		font_size = medium_font_size - 8
	}))
	self._thumb_holder = self:add_item(self:panel({
		name = "thumb_holder",
		w = row_w,
		h = row_w / 2
	}))
	self._thumb = self._thumb_holder:bitmap({
		name = "thumb",
		texture = "guis/textures/pd2/mws/no_preview",
		visible = false,
		w = self._thumb_holder:w(),
		h = self._thumb_holder:h(),
		color = Color.white
	})
	self._owner = self:add_item(self:text({
		name = "owner",
		w = row_w,
		font = large_font,
		font_size = medium_font_size - 8
	}))
end

function ModWorkshopModDetailsGui.make_fine_text(text, keep_w, keep_h)
	local x, y, w, h = text:text_rect()

	text:set_size(keep_w and text:w() or math.ceil(w), keep_h and text:h() or math.ceil(h))
	text:set_position(math.round(text:x()), math.round(text:y()))

	return text
end

function ModWorkshopModDetailsGui:set_mod(mod, fixed_h)
	self:set_visible(not not mod)

	if self._mod and mod and self._mod.id == mod.id then
		self:update_box_gui(fixed_h)

		return
	end

	self._mod = mod

	if not mod then
		return
	end

	local loc = managers.localization

	self._mod = mod

	self:set_thumbnail(mod.texture)
	ModWorkshop:get_mod(mod.id, function(res, mod)
		if res == "success" and mod.texture and self._mod and self._mod.id == mod.id then
			self:set_thumbnail(mod.texture)
		end
	end, function(res, mod_id, texture)
		if res == "success" and self._mod and self._mod.id == mod_id then
			self:set_thumbnail(texture)
		end
	end)

	if mod.name then
		self._name:set_text(mod.name:upper())
	end

	if mod.user_name then
		self._owner:set_text(loc:to_upper_text("menu_mws_uploaded_by", {
			USER = mod.user_name
		}))
	end

	if mod.short_desc then
		self._short_desc:set_text(mod.short_desc:upper())
		self._short_desc:show()
	else
		self._short_desc:hide()
	end

	self.make_fine_text(self._name, true)
	self.make_fine_text(self._short_desc, true)
	self.make_fine_text(self._owner, true)
	self:update_box_gui(fixed_h)
end

function ModWorkshopModDetailsGui:update_box_gui(fixed_h)
	local remake_box_gui = fixed_h ~= self._fixed_h

	self._fixed_h = fixed_h

	self:place_items_in_order()

	if remake_box_gui then
		if self._box_gui then
			self._box_gui:close()
		end

		self._box_gui = BoxGuiObject:new(self, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
	end
end

ModWorkshopModDetailsGui.set_thumbnail = ModWorkshopModItem.set_thumbnail
