local large_font = tweak_data.menu.pd2_large_font
local title_font_size = 16
local font_size = 14

ModWorkshopModItem = ModWorkshopModItem or class(ListItem)
ModWorkshopModItem.SELECT_COLOR = Color.white
ModWorkshopModItem.NORMAL_COLOR = Color.white
ModWorkshopModItem.SECONDARY_COLOR = Color(0.82, 0.82, 0.82)
ModWorkshopModItem.PADDING = 4

local function get_timezone()
	local now = os.time()

	return os.difftime(now, os.time(os.date("!*t", now)))
end

local epoch = get_timezone()

local function parse_json_date(json_date)
	local year, month, day, hour, minute, seconds, offsetsign, offsethour, offsetmin = json_date:match("(%d+)%-(%d+)%-(%d+)%a(%d+)%:(%d+)%:([%d%.]+)([Z%+%- ])(%d?%d?)%:?(%d?%d?)")
	local timestamp = os.time({
		year = year,
		month = month,
		day = day,
		hour = hour,
		min = minute,
		sec = math.floor(seconds)
	}) + epoch
	local offset = 0

	if offsetsign ~= "Z" then
		offset = tonumber(offsethour) * 60 + tonumber(offsetmin)

		if offsetsign == "-" then
			offset = -offset
		end
	end

	return timestamp - offset * 60
end

local function short_stat(n)
	n = tonumber(n)

	if n < 1000 then
		return tostring(n)
	elseif n < 10000000 then
		return math.round(n / 1000, 1) .. "K"
	else
		return math.round(n / 10000000, 1) .. "M"
	end
end

function ModWorkshopModItem:init(parent, mod, owner, install_data)
	local row_w = parent:row_w() / owner.COLS
	local row_h = row_w

	ModWorkshopModItem.super.init(self, parent, {
		input = true,
		w = row_w,
		h = row_h
	})

	self._parent = parent
	self._owner = owner
	self._data = mod
	self._id = mod.id
	self._texts = {}

	local content_w = self._panel:w() - self.PADDING * 3

	self._content_panel = GrowPanel:new(self, {
		input = true,
		x = self.PADDING,
		y = self.PADDING,
		fixed_w = content_w,
		padding = self.PADDING
	})
	self._placer = self._content_panel:placer()
	self._thumb_holder = self._content_panel:panel({
		name = "thumb_holder",
		w = content_w,
		h = content_w / 2
	})
	self._thumb = self._thumb_holder:bitmap({
		name = "thumb",
		texture = "guis/textures/pd2/mws/no_preview",
		w = self._thumb_holder:w(),
		h = self._thumb_holder:h(),
		color = Color.white
	})

	self._placer:add_row(self._thumb_holder)

	self._title = self:_create_text(self._content_panel, {
		name = "name",
		text = mod.name,
		font_size = title_font_size
	})
	self._owner_text = self:_create_text(self._content_panel, {
		name = "owner",
		text = mod.user_name
	})
	self._cat_text = self:_create_text(self._content_panel, {
		name = "category",
		text = mod.category_name,
		color = self.SECONDARY_COLOR
	})
	self._tags_holder = GrowPanel:new(self._content_panel, {
		border = 0,
		padding = 2
	})

	local tags_placer = self._tags_holder:placer()
	local lim = 4

	if mod.tags then
		for i, tag in pairs(mod.tags) do
			if i < lim then
				local tag_panel = ExtendedPanel:new(self._tags_holder)
				local text = tag_panel:fine_text({
					x = 3,
					y = 3,
					color = Color.black,
					text = tag.name:upper(),
					font = tweak_data.menu.pd2_large_font,
					font_size = font_size
				})

				tag_panel:set_size(text:w() + 4, text:h() + 4)
				tag_panel:bitmap({
					layer = -1,
					texture = "guis/textures/pd2/shared_tab_box"
				})

				if content_w >= tags_placer:most().right + tag_panel:w() + 8 then
					tags_placer:add_right(tag_panel)
				else
					tags_placer:set_at(0)
					tags_placer:add_bottom(tag_panel)
				end
			end
		end
	end

	self._placer:add_row(self._tags_holder)

	self._bottom_panel = GrowPanel:new(self, {
		input = true,
		x = self.PADDING,
		y = self.PADDING,
		fixed_w = content_w,
		padding = self.PADDING
	})

	local bottom_placer = self._bottom_panel:placer()

	self._stats_holder = ExtendedPanel:new(self._bottom_panel, {
		border = 0,
		h = 12,
		w = content_w
	})

	local stats_placer = UiPlacer:new(content_w - 8, 0, 0)
	local stats = {
		{
			name = "views",
			rect = {
				0,
				64,
				64,
				64
			},
			value = mod.views
		},
		{
			name = "downloads",
			rect = {
				0,
				0,
				64,
				64
			},
			value = mod.downloads
		},
		{
			name = "likes",
			rect = {
				64,
				0,
				64,
				64
			},
			value = mod.likes
		}
	}

	for _, stat in pairs(stats) do
		if stat.value then
			local text = stats_placer:add_left(self._stats_holder:fine_text({
				name = stat.name .. "_text",
				text = short_stat(stat.value),
				font = large_font,
				font_size = font_size,
				color = self.SECONDARY_COLOR
			}))

			stats_placer:add_left(self._stats_holder:bitmap({
				h = 12,
				texture = "guis/textures/pd2/mws/mod_icons",
				w = 12,
				name = stat.name .. "_icon",
				texture_rect = stat.rect,
				color = self.SECONDARY_COLOR
			}))
		end
	end

	if mod.bumped_at then
		self._stats_holder:fine_text({
			name = "date",
			text = os.date("%x, %H:%M", install_data and install_data.installed_at or parse_json_date(mod.bumped_at)),
			font = large_font,
			font_size = font_size,
			color = self.SECONDARY_COLOR
		})
	end

	self._progress_line = self._bottom_panel:rect({
		h = 2,
		name = "progress",
		w = 0,
		color = tweak_data.screen_colors.button_stage_3
	})

	bottom_placer:add_row(self._stats_holder)
	bottom_placer:add_row(self._progress_line)
	self._bottom_panel:set_bottom(self._panel:h() - self.PADDING)

	self._box_gui = BoxGuiObject:new(self._panel, {
		sides = {
			2,
			2,
			2,
			2
		}
	})

	self._box_gui:set_visible(false)
	self:_selected_changed(false)

	if mod.texture then
		self:set_thumbnail(mod.texture)
	end
end

function ModWorkshopModItem:set_thumbnail(texture)
	if not alive(self._thumb_holder) then
		return
	end

	if alive(self._thumb) then
		self._thumb_holder:remove(self._thumb)
	end

	self._thumb = self._thumb_holder:bitmap({
		name = "thumb",
		texture = texture or "guis/textures/pd2/mws/no_preview",
		w = not texture and self._thumb_holder:w() or nil,
		h = not texture and self._thumb_holder:h() or nil,
		color = Color.white
	})

	local container_w, container_h = self._thumb_holder:size()
	local img_w, img_h = self._thumb:size()
	local best_scale = math.max(container_h / img_h, container_w / img_w)

	self._thumb:set_size(best_scale * img_w, best_scale * img_h)
	self._thumb:set_world_center(self._thumb_holder:world_center())
end

function ModWorkshopModItem:is_installed()
	return managers.modworkshop:is_mod_installed(self._data.id)
end

function ModWorkshopModItem:_create_text(parent, params, placement)
	params.text = utf8.to_upper(params.text)

	local text = parent:text(table.set_defaults(params, {
		word_wrap = true,
		wrap = true,
		font = large_font,
		font_size = font_size,
		color = self.NORMAL_COLOR,
		w = parent:row_w()
	}))

	ExtendedPanel.limit_text_rows(text, 2, nil, true)

	if not placement then
		self._placer:add_row(text)
	elseif placement == "bottom" then
		self._placer:add_bottom(text)
	end

	table.insert(self._texts, text)

	return text
end

function ModWorkshopModItem:reload()
	return
end

function ModWorkshopModItem:_selected_changed(state)
	self._box_gui:set_visible(state)
end

function ModWorkshopModItem:mouse_moved(o, x, y)
	local hover, cursor = ModWorkshopModItem.super.mouse_moved(self, o, x, y)

	if hover then
		return true, cursor
	elseif self._panel:inside(x, y) then
		return true, "link"
	end
end

function ModWorkshopModItem:mouse_clicked(o, button, x, y)
	return ModWorkshopModItem.super.mouse_clicked(self, o, button, x, y)
end

function ModWorkshopModItem:visit_page()
	managers.network.account:overlay_activate("url", "https://modworkshop.net/mod/" .. self._data.id)
end

function ModWorkshopModItem:id()
	return self._data.id
end

function ModWorkshopModItem:data()
	return self._data
end

function ModWorkshopModItem:on_mod_download_progress(now, total)
	self._progress_line:set_w(self._progress_line:parent():w() * (now / total))
end
