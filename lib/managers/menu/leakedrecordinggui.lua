LeakedRecordingGui = LeakedRecordingGui or class(MenuGuiComponentGeneric)
local MOUSEOVER_COLOR = tweak_data.screen_colors.button_stage_2
local BUTTON_COLOR = tweak_data.screen_colors.button_stage_3
local S_FONT = tweak_data.menu.pd2_small_font
local S_FONT_SIZE = tweak_data.menu.pd2_small_font_size
local M_FONT = tweak_data.menu.pd2_medium_font
local M_FONT_SIZE = tweak_data.menu.pd2_medium_font_size
local L_FONT = tweak_data.menu.pd2_large_font
local L_FONT_SIZE = tweak_data.menu.pd2_large_font_size
local POSTER_SIZE = {
	w = 256,
	h = 484
}
local POSTER_AMOUNT = 4

function LeakedRecordingGui:init(ws, fullscreen_ws)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._panel = self._ws:panel():panel()
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()

	managers.menu_component:disable_crimenet()

	self._missions_td = tweak_data.gui.leakedrecordings.missions
	self._focused_poster = nil
	self._animating_posters = {}

	self:create_back_button()
	LeakedRecordingGui.create_background(self._fullscreen_panel)
	self:show_poster_box()
end

function LeakedRecordingGui:close()
	self._ws:panel():remove(self._panel)
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
	managers.menu_component:enable_crimenet()
end

function LeakedRecordingGui.create_background(parent_panel)
	return parent_panel:rect({
		name = "lobby_bg",
		alpha = 0.4,
		layer = 99,
		color = Color.black
	})
end

function LeakedRecordingGui.create_window_panel(parent_panel, data)
	data = data or {}
	local window_panel = parent_panel:panel({
		name = "window",
		layer = 100,
		x = data.x or 0,
		y = data.y or 0,
		w = data.w or POSTER_SIZE.w * POSTER_AMOUNT + (POSTER_AMOUNT + 1) * 5,
		h = data.h or POSTER_SIZE.h + 10
	})

	if not data.x then
		window_panel:set_center_x(parent_panel:w() / 2)
	end

	if not data.y then
		window_panel:set_center_y(parent_panel:h() / 2)
	end

	window_panel:rect({
		name = "lobby_bg",
		alpha = 0.6,
		layer = 0,
		color = Color.black
	})
	BoxGuiObject:new(window_panel, {
		sides = {
			1,
			1,
			1,
			1
		}
	})

	return window_panel
end

function LeakedRecordingGui:create_back_button()
	if managers.menu:is_pc_controller() then
		local back_button = self._panel:text({
			vertical = "bottom",
			name = "back_button",
			align = "right",
			blend_mode = "add",
			text = utf8.to_upper(managers.localization:text("menu_back")),
			h = tweak_data.menu.pd2_large_font_size,
			font_size = tweak_data.menu.pd2_large_font_size,
			font = tweak_data.menu.pd2_large_font,
			color = BUTTON_COLOR
		})
		local _, _, w, h = back_button:text_rect()

		back_button:set_size(w, h)
		back_button:set_position(math.round(back_button:x()), math.round(back_button:y()))
		back_button:set_right(self._panel:w() - 10)
		back_button:set_bottom(self._panel:h() - 10)
		back_button:set_layer(101)

		local bg_back = self._fullscreen_panel:text({
			name = "TitleTextBg",
			vertical = "bottom",
			h = 90,
			align = "right",
			alpha = 0.4,
			blend_mode = "add",
			layer = 1,
			text = back_button:text(),
			font_size = tweak_data.menu.pd2_massive_font_size,
			font = tweak_data.menu.pd2_massive_font,
			color = BUTTON_COLOR
		})
		local x, y = managers.gui_data:safe_to_full_16_9(back_button:world_right(), back_button:world_center_y())

		bg_back:set_world_right(x)
		bg_back:set_world_center_y(y)
		bg_back:move(13, -9)
		bg_back:set_layer(101)
		MenuBackdropGUI.animate_bg_text(self, bg_back)
	end
end

function LeakedRecordingGui:show_poster_box()
	if not self._poster_panel then
		self:create_poster_box()
	end

	self._poster_panel:show()
end

function LeakedRecordingGui:create_poster_box()
	self._poster_panel = LeakedRecordingGui.create_window_panel(self._panel)
	local panel_text = self._panel:text({
		name = "panel_title",
		layer = 100,
		text = managers.localization:text("menu_lr_poster_title"),
		font = L_FONT,
		font_size = L_FONT_SIZE
	})

	ExtendedPanel.make_fine_text(panel_text)
	panel_text:set_position(self._poster_panel:x(), self._poster_panel:y() - L_FONT_SIZE)

	self._poster_panels = {}
	self.poster_amount = 4
	local window_margin = 5
	local panel_spacing = 5
	local window_safe_size = {
		x = self._poster_panel:x() + window_margin,
		y = self._poster_panel:y() + window_margin,
		w = self._poster_panel:w() - window_margin * 2,
		h = self._poster_panel:h() - window_margin * 2
	}
	self._poster_size = {
		w = POSTER_SIZE.w,
		h = POSTER_SIZE.h
	}

	for i = 1, self.poster_amount do
		local poster_panel = self._panel:panel({
			layer = 101,
			x = self._poster_panel:x() + window_margin + (self._poster_size.w + panel_spacing) * (i - 1),
			y = self._poster_panel:y() + window_margin,
			w = self._poster_size.w,
			h = self._poster_size.h
		})
		local poster_image = poster_panel:bitmap({
			name = "image",
			texture = self._missions_td[i].poster_icon,
			texture_rect = self._missions_td[i].poster_rect,
			w = poster_panel:w(),
			h = poster_panel:h()
		})

		if self._missions_td[i].coming_soon then
			-- Nothing
		end

		table.insert(self._poster_panels, poster_panel)
	end
end

function LeakedRecordingGui:enter_mission_menu(index)
	managers.menu_component:post_event("menu_enter")
	managers.menu:open_node("crimenet_leakedrecording_mission", {
		{
			mission_id = index
		}
	})
end

function LeakedRecordingGui:update(t, dt)
end

function LeakedRecordingGui:mouse_pressed(button, x, y)
	for index, item in ipairs(self._poster_panels) do
		if item:inside(x, y) and button == Idstring("0") and not self._missions_td[index].coming_soon then
			self:enter_mission_menu(index)
		end
	end
end

function LeakedRecordingGui:confirm_pressed()
	if self._focused_poster then
		self:enter_mission_menu(table.index_of(self._poster_panels, self._focused_poster))
	end
end

function LeakedRecordingGui:special_btn_pressed(button)
end

function LeakedRecordingGui:set_focused_poster(new_focus)
	if new_focus ~= self._focused_poster then
		local old_focus = self._focused_poster

		if alive(old_focus) and self._original_focus_pos then
			old_focus:stop()
			old_focus:animate(function ()
				local t = 0
				local dt = 0
				local speed = 2
				local target_pos = {
					x = self._original_focus_pos.x - self._poster_size.w / 2,
					y = self._original_focus_pos.y - self._poster_size.h / 2
				}

				while t < 1 do
					dt = coroutine.yield()
					t = math.min(t + dt * speed, 1)

					old_focus:set_position(math.lerp(old_focus:x(), target_pos.x, t), math.lerp(old_focus:y(), target_pos.y, t))
					old_focus:set_size(math.lerp(old_focus:w(), self._poster_size.w, t), math.lerp(old_focus:h(), self._poster_size.h, t))
					old_focus:child("image"):set_size(old_focus:size())
				end

				old_focus:set_layer(104)
			end)

			self._original_focus_pos = nil
		end

		self._focused_poster = new_focus

		if new_focus then
			new_focus:set_layer(105)
			managers.menu_component:post_event("highlight")

			self._original_focus_pos = {
				x = new_focus:center_x(),
				y = new_focus:center_y()
			}
			local new_size = {
				w = self._poster_size.w * 1.1,
				h = self._poster_size.h * 1.1
			}
			local old_pos = {
				x = new_focus:center_x() - self._poster_size.w / 2,
				y = new_focus:center_y() - self._poster_size.h / 2
			}
			local new_pos = {
				x = new_focus:center_x() - new_size.w / 2,
				y = new_focus:center_y() - new_size.h / 2
			}

			new_focus:stop()
			new_focus:animate(function (direction)
				local t = 0
				local dt = 0
				local speed = 2
				local temp_size = nil

				while t < 1 do
					dt = coroutine.yield()
					t = math.min(t + dt * speed, 1)

					new_focus:set_position(math.lerp(new_focus:x(), new_pos.x, t), math.lerp(new_focus:y(), new_pos.y, t))
					new_focus:set_size(math.lerp(new_focus:w(), new_size.w, t), math.lerp(new_focus:h(), new_size.h, t))
					new_focus:child("image"):set_size(new_focus:size())
				end
			end)
		end
	end
end

function LeakedRecordingGui:mouse_moved(button, x, y)
	local back_button = self._panel:child("back_button")

	if back_button and back_button:inside(x, y) then
		if not self._back_highlight then
			self._back_highlight = true

			back_button:set_color(MOUSEOVER_COLOR)
			managers.menu_component:post_event("highlight")
		end

		return true, "link"
	elseif self._back_highlight then
		self._back_highlight = false

		back_button:set_color(BUTTON_COLOR)
	end

	local poster_hover = false

	for index, item in ipairs(self._poster_panels) do
		if not self._missions_td[index].coming_soon and item:inside(x, y) then
			poster_hover = item

			if item == self._focused_poster then
				break
			end
		end
	end

	if poster_hover then
		self:set_focused_poster(poster_hover)

		return true, "link"
	else
		self:set_focused_poster(nil)
	end
end

LeakedRecordingMissionGuiInitiator = LeakedRecordingMissionGuiInitiator or class()

function LeakedRecordingMissionGuiInitiator:modify_node(original_node, data)
	local node = deep_clone(original_node)
	node:parameters().menu_component_data = data

	return node
end

LeakedRecordingMissionGui = LeakedRecordingMissionGui or class(MenuGuiComponentGeneric)

function LeakedRecordingMissionGui:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._panel = self._ws:panel():panel()
	self._fullscreen_panel = self._fullscreen_ws:panel():panel()

	LeakedRecordingGui.create_back_button(self)

	local node_data = node:parameters().menu_component_data or {}
	self._mission_id = node_data.mission_id or 1
	self._mission = tweak_data.gui.leakedrecordings.missions[self._mission_id]
	self._cleared = managers.mission:get_saved_job_value(self._mission.job_value) or false
	self._sound_source = SoundDevice:create_source("LeakedRecording")

	if self._mission.briefing_track then
		self._sound_source:post_event(self._mission.briefing_track)
	end

	LeakedRecordingGui.create_background(self._fullscreen_panel)
	self:show_mission_box()
end

function LeakedRecordingMissionGui:close()
	self._ws:panel():remove(self._panel)
	self._fullscreen_ws:panel():remove(self._fullscreen_panel)
	self._sound_source:stop()
	managers.menu_component:enable_crimenet()
end

function LeakedRecordingMissionGui:show_mission_box()
	if not self._mission_panel then
		self:create_mission_box()
	end

	self._mission_panel:show()
end

function LeakedRecordingMissionGui:create_mission_box()
	self._mission_panel = LeakedRecordingGui.create_window_panel(self._panel, {
		w = 700,
		x = 0,
		h = POSTER_SIZE.h
	})
	local texture_size = {
		w = 4096,
		h = 2048
	}

	self._fullscreen_panel:bitmap({
		texture = "guis/dlcs/lrm/textures/pd2/crimenet/recorder_df",
		layer = 99,
		x = 0,
		texture_rect = {
			0,
			0,
			texture_size.w,
			texture_size.h
		},
		w = self._fullscreen_panel:h() * texture_size.w / texture_size.h,
		h = self._fullscreen_panel:h()
	})
	self._fullscreen_panel:bitmap({
		texture = "guis/dlcs/lrm/textures/pd2/crimenet/tape",
		layer = 101,
		h = 144.26391601563,
		y = 187,
		w = 94.543701171875,
		x = 853,
		texture_rect = {
			0,
			0,
			251,
			383
		},
		visible = self._cleared
	})

	local poster_panel = self._mission_panel:panel({
		x = 0,
		y = 0,
		w = POSTER_SIZE.w,
		h = POSTER_SIZE.h
	})

	poster_panel:bitmap({
		texture = self._mission.poster_icon,
		texture_rect = self._mission.poster_rect,
		w = poster_panel:w(),
		h = poster_panel:h()
	})

	local right_x = 266
	local placer_y = 10
	local title = self._mission_panel:text({
		name = "title",
		w = 400,
		layer = 1,
		text = managers.localization:text("menu_lr_mission_title_" .. self._mission_id),
		font = M_FONT,
		font_size = M_FONT_SIZE,
		x = right_x,
		y = placer_y,
		h = L_FONT_SIZE
	})

	ExtendedPanel.make_fine_text(title)

	placer_y = placer_y + title:h()
	local description = self._mission_panel:text({
		name = "description",
		h = 200,
		wrap = true,
		w = 400,
		layer = 1,
		text = managers.localization:text("menu_lr_mission_description_" .. self._mission_id),
		font = S_FONT,
		font_size = S_FONT_SIZE,
		x = right_x,
		y = title:bottom()
	})

	ExtendedPanel.make_fine_text(description)

	placer_y = placer_y + description:h() + M_FONT_SIZE
	local title_text = managers.localization:text("menu_challenge_objective_title")

	if self._cleared then
		title_text = title_text .. " " .. managers.localization:text("menu_lr_mission_completed")
	end

	local objective_title = self._mission_panel:text({
		name = "objective_title",
		w = 400,
		text = title_text,
		font = M_FONT,
		font_size = M_FONT_SIZE,
		x = right_x,
		y = placer_y,
		h = M_FONT_SIZE
	})
	placer_y = placer_y + objective_title:h()
	local objective_text = self._mission_panel:text({
		name = "objective_text",
		w = 400,
		wrap = true,
		text_id = "menu_lr_mission_objective_" .. self._mission_id,
		font = S_FONT,
		font_size = S_FONT_SIZE,
		x = right_x,
		y = placer_y,
		h = S_FONT_SIZE
	})

	ExtendedPanel.make_fine_text(objective_text)

	placer_y = placer_y + objective_text:h()
	local start_button = self._mission_panel:panel({
		name = "start_button",
		w = 400,
		x = right_x,
		y = placer_y,
		h = S_FONT_SIZE
	})
	self.start_text = start_button:text({
		name = "start_text",
		text_id = "menu_sm_start_level",
		valign = "grow",
		font = S_FONT,
		font_size = S_FONT_SIZE,
		color = BUTTON_COLOR
	})

	self.start_text:set_visible(managers.menu:is_pc_controller())

	local job_data = tweak_data.narrative:job_data(self._mission.heist)
	local job_dlc = job_data.dlc

	if self._cleared then
		self.start_text:set_text(managers.localization:text("menu_lr_gadget_play"))
	elseif job_dlc and not managers.dlc:is_dlc_unlocked(job_dlc) and not Global.game_settings.single_player then
		local dlc_locked_text = managers.localization:text("menu_sm_dlc_locked")
		local dlc_locked_help = managers.localization:text("menu_sm_dlc_locked_help_text")

		self.start_text:set_text(dlc_locked_text .. "\n\n" .. dlc_locked_help)
		self.start_text:set_color(tweak_data.screen_colors.important_1)
		self.start_text:set_selection(utf8.len(dlc_locked_text), utf8.len(self.start_text:text()))
		self.start_text:set_selection_color(tweak_data.screen_colors.important_2)
		self.start_text:set_wrap(true)
		self.start_text:set_word_wrap(true)

		self._dlc_locked = true
	end

	local _, _, w, h = self.start_text:text_rect()

	start_button:set_size(w, h)

	placer_y = placer_y + start_button:h()
	self._cog_is_rotating = false
	self._cog_rotation = 0
	self._cogwheels = {}
	local cogwheel = self._fullscreen_panel:bitmap({
		texture = "guis/dlcs/lrm/textures/pd2/crimenet/cog",
		layer = 101,
		h = 25,
		y = 203,
		w = 25,
		visible = true,
		x = 888,
		texture_rect = {
			0,
			0,
			128,
			128
		}
	})

	table.insert(self._cogwheels, cogwheel)

	cogwheel = self._fullscreen_panel:bitmap({
		texture = "guis/dlcs/lrm/textures/pd2/crimenet/cog",
		layer = 101,
		h = 25,
		y = 290,
		w = 25,
		visible = true,
		x = 888,
		texture_rect = {
			0,
			0,
			128,
			128
		}
	})

	table.insert(self._cogwheels, cogwheel)

	if not managers.menu:is_pc_controller() then
		local legends = {}

		table.insert(legends, {
			loc_id = "menu_legend_back"
		})

		if self._cleared then
			table.insert(legends, {
				loc_id = "menu_lr_legend_start_playback"
			})
		else
			table.insert(legends, {
				loc_id = "menu_lr_legend_start_mission"
			})
		end

		self._buttons_info_panel = self._panel:panel({
			101,
			w = 810,
			layer = 102,
			h = M_FONT_SIZE
		})

		self._buttons_info_panel:set_x(self._panel:w() - self._buttons_info_panel:w())
		self:update_legend(legends)
	end

	local briefing_button = self._mission_panel:panel({
		visible = false,
		name = "briefing_button",
		w = 100,
		x = right_x,
		y = placer_y,
		h = S_FONT_SIZE
	})
	local briefing_text = briefing_button:text({
		name = "briefing_text",
		valign = "grow",
		text = managers.localization:text("menu_lr_transcript_header"),
		font = S_FONT,
		font_size = S_FONT_SIZE,
		color = BUTTON_COLOR
	})

	ExtendedPanel.make_fine_text(briefing_text)

	local _, _, w, h = briefing_text:text_rect()

	briefing_button:set_size(w, h)
end

function LeakedRecordingMissionGui:update_legend(legends)
	self._buttons_info_panel:clear()

	local x_pos = self._buttons_info_panel:w()

	for _, text in ipairs(legends) do
		local key_string = text.key and utf8.to_upper(managers.localization:btn_macro(text.key)) .. " " or ""
		local loc_string = managers.localization:to_upper_text(text.loc_id)
		local new_text = self._buttons_info_panel:text({
			text = key_string .. loc_string,
			font = S_FONT,
			font_size = S_FONT_SIZE
		})

		ExtendedPanel.make_fine_text(new_text)
		new_text:set_x(x_pos - new_text:w() - 10)

		x_pos = x_pos - new_text:w() - 10
	end
end

function LeakedRecordingMissionGui:get_state()
	return true
end

function LeakedRecordingMissionGui:start_mission()
	local job_data = tweak_data.narrative:job_data(self._mission.heist)
	local data = {
		customize_difficulty = true,
		difficulty = "normal",
		difficulty_id = tweak_data:difficulty_to_index("normal"),
		job_id = self._mission.heist,
		contract_visuals = job_data and job_data.contract_visuals
	}

	managers.menu_component:post_event("menu_enter")
	managers.menu:open_node(Global.game_settings.single_player and "crimenet_contract_singleplayer" or "crimenet_contract_host", {
		data
	})
end

function LeakedRecordingMissionGui:play_recording()
	Telemetry:send_on_leakedrecording_played({
		recording_id = self._mission.job_value
	})
	managers.mission:set_saved_job_value(self._mission.job_value .. "_played", true)
	self._sound_source:stop()
	self._sound_source:post_event(self._mission.recording_track, self.sound_callback, self, "end_of_event")

	self._cog_is_rotating = true
	self._cog_rotation = 0

	if not managers.menu:is_pc_controller() then
		local legends = {}

		table.insert(legends, {
			loc_id = "menu_legend_back"
		})
		table.insert(legends, {
			loc_id = "menu_lr_legend_stop_playback"
		})
		table.insert(legends, {
			loc_id = "menu_lr_legend_open_transcript"
		})
		self:update_legend(legends)
	else
		self.start_text:set_text(managers.localization:text("menu_lr_gadget_stop"))

		local briefing_button = self._mission_panel:child("briefing_button")

		if briefing_button then
			briefing_button:set_visible(true)
		end
	end
end

function LeakedRecordingMissionGui:stop_recording()
	self._sound_source:stop()

	self._cog_is_rotating = false

	if not managers.menu:is_pc_controller() then
		local legends = {}

		table.insert(legends, {
			loc_id = "menu_legend_back"
		})
		table.insert(legends, {
			loc_id = "menu_lr_legend_start_playback"
		})
		self:update_legend(legends)
	else
		self.start_text:set_text(managers.localization:text("menu_lr_gadget_play"))

		local briefing_button = self._mission_panel:child("briefing_button")

		if briefing_button then
			briefing_button:set_visible(false)
		end
	end
end

function LeakedRecordingMissionGui:open_transcript()
	local dialog_data = {
		title = managers.localization:text("menu_lr_transcript_header") .. ": " .. managers.localization:text("menu_lr_mission_title_" .. self._mission_id),
		text = managers.localization:text("menu_lr_transcript_" .. self._mission_id)
	}
	local ok_button = {
		text = managers.localization:text("dialog_ok"),
		cancel_button = true
	}
	dialog_data.button_list = {
		ok_button
	}

	managers.system_menu:show(dialog_data)
end

function LeakedRecordingMissionGui:update(t, dt)
	if self._cog_is_rotating then
		self._cog_rotation = self._cog_rotation - dt * 40

		for index, cog in ipairs(self._cogwheels) do
			cog:set_rotation(self._cog_rotation)
		end
	end
end

function LeakedRecordingMissionGui:special_btn_pressed(button)
	if button == Idstring("menu_respec_tree") then
		self:open_transcript()
	end
end

function LeakedRecordingMissionGui:mouse_pressed(button, x, y)
	local start_button = self._mission_panel:child("start_button")

	if start_button:inside(x, y) and button == Idstring("0") then
		if self._cleared then
			if self._cog_is_rotating then
				self:stop_recording()
			else
				self:play_recording()
			end
		elseif not self._dlc_locked then
			self:start_mission()
		end
	end

	local briefing_button = self._mission_panel:child("briefing_button")

	if briefing_button and briefing_button:visible() and briefing_button:inside(x, y) and button == Idstring("0") then
		self:open_transcript()
	end
end

function LeakedRecordingMissionGui:mouse_moved(button, x, y)
	local back_button = self._panel:child("back_button")

	if back_button and back_button:inside(x, y) then
		if not self._back_highlight then
			self._back_highlight = true

			back_button:set_color(MOUSEOVER_COLOR)
			managers.menu_component:post_event("highlight")
		end

		return true, "link"
	elseif self._back_highlight then
		self._back_highlight = false

		back_button:set_color(BUTTON_COLOR)
	end

	if not self._dlc_locked then
		local start_button = self._mission_panel:child("start_button")

		if start_button:inside(x, y) then
			start_button:child("start_text"):set_color(MOUSEOVER_COLOR)

			return true, "link"
		else
			start_button:child("start_text"):set_color(BUTTON_COLOR)
		end
	end

	local briefing_button = self._mission_panel:child("briefing_button")

	if briefing_button and briefing_button:visible() then
		if briefing_button:inside(x, y) then
			briefing_button:child("briefing_text"):set_color(MOUSEOVER_COLOR)

			return true, "link"
		else
			briefing_button:child("briefing_text"):set_color(BUTTON_COLOR)
		end
	end
end

function LeakedRecordingMissionGui:confirm_pressed()
	if self._cleared then
		if self._cog_is_rotating then
			self:stop_recording()
		else
			self:play_recording()
		end
	elseif not self._dlc_locked then
		self:start_mission()
	end
end

function LeakedRecordingMissionGui:sound_callback(instance, event_type, gadget_gui)
	if event_type == "end_of_event" then
		gadget_gui._cog_is_rotating = false

		gadget_gui:stop_recording()
	end
end
