require("lib/managers/menu/ExtendedUiElemets")

local padding = 10
local massive_font = tweak_data.menu.pd2_massive_font
local large_font = tweak_data.menu.pd2_large_font
local medium_font = tweak_data.menu.pd2_medium_font
local small_font = tweak_data.menu.pd2_small_font
local massive_font_size = tweak_data.menu.pd2_massive_font_size
local large_font_size = tweak_data.menu.pd2_large_font_size
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local small_font_size = tweak_data.menu.pd2_small_font_size
local done_icon = "guis/textures/menu_singletick"
local reward_icon = "guis/textures/pd2/icon_reward"
local active_mission_icon = "guis/textures/scrollarrow"
StoryMissionsGui = StoryMissionsGui or class(ExtendedPanel)

function StoryMissionsGui:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._init_layer = self._ws:panel():layer()
	self._node = node

	if not Network:multiplayer() and managers.network:session() and managers.network:session():local_peer():id() == 1 then
		managers.network:stop_network(true)
	end

	StoryMissionsGui.super.init(self, self._ws:panel())

	self._fullscreen_panel = ExtendedPanel:new(self._fullscreen_ws:panel())

	self._fullscreen_panel:rect({
		alpha = 0.4,
		layer = -1,
		color = Color.black
	})

	local y = large_font_size + padding * 2
	self._main_panel = ExtendedPanel:new(self, {
		input = true,
		x = padding,
		y = y,
		w = self:w() - padding * 2,
		h = self:h() - y - massive_font_size
	})

	if not managers.menu:is_pc_controller() then
		self._legends = TextLegendsBar:new(self, {
			font = medium_font,
			font_size = medium_font_size
		})

		self._legends:add_items({
			"menu_legend_back",
			"menu_legend_scroll",
			{
				id = "select",
				enabled = false,
				text = managers.localization:to_upper_text("menu_legend_claim_reward", {
					BTN_Y = managers.localization:key_to_btn_text("a", true)
				})
			},
			{
				enabled = false,
				text_id = "menu_legend_sm_start_mission",
				id = "start_mission",
				binding = "continue",
				func = callback(self, self, "_start_mission_general")
			},
			{
				enabled = false,
				text_id = "menu_legend_sm_toggle_online",
				id = "toggle_online",
				binding = "menu_toggle_legends",
				func = callback(self, self, "_toggle_online")
			},
			{
				enabled = false,
				text_id = "menu_legend_sm_skip_mission",
				id = "skip_mission",
				binding = "next_page",
				func = callback(self, self, "_skip_mission_dialog")
			}
		})
		self._legends:add_item({
			enabled = false,
			binding = "next_page",
			text = managers.localization:to_upper_text("menu_legend_next_story_mission", {
				BTN = managers.localization:key_to_btn_text("right_shoulder", true)
			}),
			func = callback(self, self, "_navigate_story", 1)
		}, "next_mission", true)
		self._legends:add_item({
			enabled = false,
			binding = "previous_page",
			text = managers.localization:to_upper_text("menu_legend_previous_story_mission", {
				BTN = managers.localization:key_to_btn_text("left_shoulder", true)
			}),
			func = callback(self, self, "_navigate_story", -1)
		}, "previous_mission", true)
		self._legends:set_rightbottom(self:w(), self:h())
	end

	self._side_scroll = ScrollableList:new(self._main_panel, {
		padding = 5,
		input = true,
		w = self._main_panel:w() * 0.25
	})

	BoxGuiObject:new(ExtendedPanel:new(self._side_scroll, {
		layer = 100
	}), {
		sides = {
			1,
			1,
			2,
			2
		}
	})

	self._info_scroll = ScrollableList:new(self._main_panel, {
		padding = 5,
		input = true,
		x = self._side_scroll:right() + padding,
		w = self._main_panel:w() - self._side_scroll:w() - padding
	}, {
		padding_y = 10
	})

	BoxGuiObject:new(ExtendedPanel:new(self._info_scroll, {
		layer = 100
	}), {
		sides = {
			1,
			1,
			2,
			2
		}
	})

	self._toggle_panel = CompositeButton:new(self, {}, {
		input = true,
		w = self._side_scroll:w()
	})

	self._toggle_panel:set_world_top(self._side_scroll:world_bottom() + 5)
	self._toggle_panel:set_world_left(self._side_scroll:world_left())

	self._toggle_button = ToggleButton:new(self._toggle_panel, {
		initial_state = not Global.game_settings.single_player
	}, {}, callback(self, self, "_toggle_online"))

	self._toggle_panel:register_child(self._toggle_button)

	local toggle_text = TextButton:new(self._toggle_panel, {
		text = managers.localization:text("menu_sm_play_online"),
		font_size = small_font_size,
		font = small_font
	})

	self._toggle_panel:register_child(toggle_text)
	self._toggle_panel:set_h(math.max(self._toggle_button:h(), toggle_text:h()))
	self._toggle_button:set_center_y(self._toggle_panel:h() / 2 - 1)
	self._toggle_button:set_right(self._toggle_panel:w())
	toggle_text:set_center_y(self._toggle_panel:h() / 2)
	toggle_text:set_left(5)
	self._toggle_panel:set_enabled(not Network:multiplayer())
	self:_change_legend("toggle_online", not Network:multiplayer())
	self:_add_title()
	self:_add_back_button()
	self:_update()
end

function StoryMissionsGui:close()
	if managers.briefing:event_playing() then
		managers.briefing:stop_event()
	end

	if alive(self._fullscreen_panel) then
		self._fullscreen_panel:remove_self()
	end

	self:remove_self()
end

function StoryMissionsGui:_add_title()
	self._title = self:text({
		name = "title",
		vertical = "top",
		align = "left",
		blend_mode = "add",
		layer = 10,
		x = padding,
		y = padding,
		font_size = large_font_size,
		font = large_font,
		h = large_font_size,
		color = tweak_data.screen_colors.title,
		text = managers.localization:to_upper_text("menu_story_missions")
	})
end

function StoryMissionsGui:_add_back_button()
	if not managers.menu:is_pc_controller() then
		return
	end

	local back_button = TextButton:new(self, {
		blend = "add",
		text_id = "menu_back",
		font = large_font,
		font_size = large_font_size
	}, function ()
		managers.menu:force_back()
	end)

	back_button:set_right(self:w() - 10)
	back_button:set_bottom(self:h() - 10)

	self._back_button = back_button
	local bg_back = self._fullscreen_panel:text({
		name = "back_button",
		vertical = "bottom",
		h = 90,
		align = "right",
		alpha = 0.5,
		blend_mode = "add",
		layer = 1,
		text = utf8.to_upper(managers.localization:text("menu_back")),
		font_size = tweak_data.menu.pd2_massive_font_size,
		font = tweak_data.menu.pd2_massive_font,
		color = tweak_data.screen_colors.button_stage_3
	})
	local x, y = managers.gui_data:safe_to_full_16_9(self._back_button:world_right(), self._back_button:world_center_y())

	bg_back:set_world_right(x)
	bg_back:set_world_center_y(y)
	bg_back:move(13, -9)
end

function StoryMissionsGui:_change_legend(id, state)
	if self._legends then
		self._legends:set_item_enabled(id, state)
	end
end

function StoryMissionsGui:_navigate_story(offset)
	if managers.story:current_mission().order < self._shown_mission.order + offset then
		return
	end

	local sought_mission = nil

	repeat
		sought_mission = managers.story:get_mission_at(self._shown_mission.order + offset)
		offset = offset + offset
	until sought_mission and (not sought_mission.is_header or not sought_mission)

	if not sought_mission then
		return
	end

	self:_update(sought_mission)
end

function StoryMissionsGui:_update(mission)
	if mission and type(mission) == "string" then
		mission = managers.story:get_mission(mission)
	end

	mission = mission or managers.story:current_mission()
	self._shown_mission = mission

	self:_update_side(mission)
	self:_update_info(mission)
	self:round_main_panel()
	managers.menu_component:post_event("menu_enter")
end

function StoryMissionsGui:_update_side(current)
	local current_scroll_amount = -self._side_scroll:canvas():y()

	self._side_scroll:clear()

	local canvas = self._side_scroll:canvas()
	local placer = canvas:placer()
	local font_size = tweak_data.menu.pd2_small_font_size
	local tab_size = 20
	local active_mission = managers.story:current_mission()
	local shown_mission_item = nil

	self:_change_legend("next_mission", current.order < active_mission.order)
	self:_change_legend("previous_mission", current.order > 1)
	self._toggle_button:set_state(not Global.game_settings.single_player)

	for i, mission in ipairs(managers.story:missions_in_order()) do
		if i <= active_mission.order then
			local color = tweak_data.menu.default_disabled_text_color
			local color_highlight = tweak_data.menu.default_font_row_item_color
			local icon = done_icon
			local icon_rotation = 0

			if i == current.order then
				color = tweak_data.screen_colors.button_stage_3
				color_highlight = tweak_data.screen_colors.button_stage_2
			end

			if i == active_mission.order then
				icon = active_mission_icon
				icon_rotation = -90
			end

			local item = nil

			if mission.is_header then
				item = placer:add_row(StoryActGuiSidebarItem:new(canvas, {
					indent = 0,
					text = managers.localization:to_upper_text(mission.name_id),
					color = color,
					color_highlight = color_highlight
				}))
			else
				item = placer:add_row(StoryMissionsGuiSidebarItem:new(canvas, {
					indent = 25,
					text = managers.localization:to_upper_text(mission.name_id),
					icon = icon,
					icon_rotation = icon_rotation,
					color = color,
					color_highlight = color_highlight,
					callback = callback(self, self, "_update", mission)
				}))
			end

			if mission == self._shown_mission then
				shown_mission_item = item
			end
		end
	end

	self._side_scroll:scroll_item():scroll_to(current_scroll_amount)
	self._side_scroll:scroll_to_show(shown_mission_item)
end

function StoryMissionsGui:_update_info(mission)
	self._info_scroll:clear()
	self:_change_legend("select", false)
	self:_change_legend("start_mission", false)

	self._select_btn = nil
	self._level_btns = {}
	self._selected_level_btn = nil

	if self._voice then
		managers.briefing:stop_event()
		self._voice.panel:remove_self()

		self._voice = nil
	end

	mission = mission or managers.story:current_mission()

	if not mission then
		return
	end

	local canvas = self._info_scroll:canvas()
	local placer = canvas:placer()
	local text_col = tweak_data.screen_colors.text

	if mission.completed and mission.rewarded and mission.last_mission then
		placer:add_row(canvas:fine_text({
			text_id = "menu_sm_all_done",
			font = medium_font,
			font_size = medium_font_size
		}))

		return
	end

	placer:add_row(canvas:fine_text({
		text = managers.localization:to_upper_text(mission.name_id),
		font = medium_font,
		font_size = medium_font_size,
		color = text_col
	}))
	placer:add_row(canvas:fine_text({
		wrap = true,
		word_wrap = true,
		text = managers.localization:text(mission.desc_id),
		font = small_font,
		font_size = small_font_size,
		color = text_col
	}))

	if mission.voice_line then
		self._voice = {}
		local h = small_font_size * 2 + 20
		local pad = 8
		self._voice.panel = ExtendedPanel:new(self, {
			w = 256,
			input = true,
			h = h
		})

		BoxGuiObject:new(self._voice.panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		self._voice.text = self._voice.panel:text({
			x = pad,
			y = pad,
			font = small_font,
			font_size = small_font_size,
			color = text_col,
			text = managers.localization:to_upper_text("menu_cn_message_playing")
		})
		self._voice.button = TextButton:new(self._voice.panel, {
			binding = "menu_toggle_ready",
			x = pad,
			font = small_font,
			font_size = small_font_size,
			text = managers.localization:to_upper_text("menu_stop_sound", {
				BTN_X = managers.localization:btn_macro("menu_toggle_ready")
			})
		}, callback(self, self, "toggle_voice_message", mission.voice_line))

		self._voice.button:set_bottom(self._voice.panel:h() - pad)
		self._voice.panel:set_world_right(self._info_scroll:world_right())
		self:toggle_voice_message(mission.voice_line)
	end

	placer:add_row(canvas:fine_text({
		text = managers.localization:to_upper_text("menu_challenge_objective_title"),
		font = small_font,
		font_size = small_font_size,
		color = tweak_data.screen_colors.challenge_title
	}))
	placer:add_row(canvas:fine_text({
		wrap = true,
		word_wrap = true,
		text = managers.localization:text(mission.objective_id),
		font = small_font,
		font_size = small_font_size,
		color = text_col
	}), nil, 0)

	local locked = false
	local can_skip_mission = false
	local levels = {}

	if not mission.hide_progress then
		placer:add_row(canvas:fine_text({
			text = managers.localization:to_upper_text("menu_unlock_progress"),
			font = small_font,
			font_size = small_font_size,
			color = tweak_data.screen_colors.challenge_title
		}))

		local num_objective_groups = #mission.objectives
		local obj_padd_x = num_objective_groups > 1 and 15 or nil
		local owned, global_value, gvalue_tweak = nil

		for i, objective_row in ipairs(mission.objectives) do
			for _, objective in ipairs(objective_row) do
				owned = not objective.dlc or managers.dlc:is_dlc_unlocked(objective.dlc)
				global_value = objective.dlc and managers.dlc:dlc_to_global_value(objective.dlc)
				gvalue_tweak = global_value and tweak_data.lootdrop.global_values[global_value]
				local text = placer:add_row(canvas:fine_text({
					wrap = true,
					word_wrap = true,
					text = managers.localization:text(objective.name_id),
					font = small_font,
					font_size = small_font_size,
					color = text_col
				}), obj_padd_x, 0)

				if not mission.completed then
					table.list_append(levels, objective.levels or {})
				end

				if (not mission.completed or objective.basic) and (not objective.completed or objective.basic) and objective.levels and (not objective.basic or not Network:is_server()) and not Network:is_client() and mission.completed == mission.rewarded then
					if not owned and managers.dlc:should_hide_unavailable(global_value, true) then
						placer:add_right(canvas:fine_text({
							text = managers.localization:to_upper_text("menu_sm_dlc_unavailable"),
							font = small_font,
							font_size = small_font_size,
							color = tweak_data.screen_colors.important_1
						}), 5)

						can_skip_mission = true
						locked = true
					elseif not owned and not Global.game_settings.single_player then
						placer:add_right(canvas:fine_text({
							text_id = "menu_sm_dlc_locked",
							font = small_font,
							font_size = small_font_size,
							color = tweak_data.screen_colors.important_1
						}), 5)

						locked = true
					else
						local btn = TextButton:new(canvas, {
							text_id = "menu_sm_start_level",
							font = small_font,
							font_size = small_font_size
						}, function ()
							managers.story:start_mission(mission, objective.progress_id)
						end)

						placer:add_right(btn, 10)
						table.insert(self._level_btns, btn)
						self:_change_legend("start_mission", true)

						if not self._selected_level_btn then
							self._selected_level_btn = btn

							if not managers.menu:is_pc_controller() then
								btn:_hover_changed(true)
							end
						end
					end
				end

				if objective.max_progress > 1 then
					local progress = placer:add_row(TextProgressBar:new(canvas, {
						h = small_font_size + 2,
						max = objective.max_progress,
						back_color = Color(0, 0, 0, 0),
						progress_color = tweak_data.screen_colors.challenge_completed_color:with_alpha(0.4)
					}, {
						font = small_font,
						font_size = small_font_size,
						color = text_col
					}, objective.progress), nil, 0)
					local box = BoxGuiObject:new(progress, {
						sides = {
							1,
							1,
							1,
							1
						}
					})
				elseif objective.completed or owned or not managers.dlc:should_hide_unavailable(global_value, true) then
					local texture = "guis/textures/menu_tickbox"
					local texture_rect = {
						objective.completed and 24 or 0,
						0,
						24,
						24
					}
					local checkbox = canvas:bitmap({
						texture = texture,
						texture_rect = texture_rect
					})

					checkbox:set_right(canvas:w())
					checkbox:set_top(text:top())
				end
			end

			if i < num_objective_groups then
				placer:add_row(canvas:fine_text({
					text_id = "menu_sm_objectives_or",
					font = small_font,
					font_size = small_font_size,
					color = tweak_data.screen_colors.challenge_title
				}), nil, 0)
			end
		end
	end

	if locked then
		placer:add_row(canvas:fine_text({
			wrap = true,
			word_wrap = true,
			text_id = can_skip_mission and "menu_sm_dlc_unavailable_help_text" or "menu_sm_dlc_locked_help_text",
			font = small_font,
			font_size = small_font_size,
			color = text_col
		}), nil, nil)
	end

	if self:_get_reward_string(mission) then
		local title = placer:add_row(canvas:fine_text({
			text = managers.localization:to_upper_text("menu_reward"),
			font = small_font,
			font_size = small_font_size,
			color = tweak_data.screen_colors.challenge_title
		}))
		local r_panel = GrowPanel:new(canvas, {
			input = true
		})
		local r_placer = r_panel:placer()
		local skipped_mission = managers.story:get_last_skipped_mission() == mission

		for i, reward in ipairs(mission.rewards) do
			local item = StoryMissionGuiRewardItem:new(r_panel, reward, nil, skipped_mission)

			if r_placer:current_right() + item:w() < canvas:w() * 0.5 then
				r_placer:add_right(item)
			else
				r_placer:add_row(item)
			end
		end

		BoxGuiObject:new(r_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})
		placer:add_row(r_panel, nil, 0)
		r_panel:set_right(canvas:w())

		local reward_text = canvas:fine_text({
			wrap = true,
			word_wrap = true,
			text_id = self:_get_reward_string(mission),
			font = small_font,
			font_size = small_font_size,
			keep_w = r_panel:left() - title:left()
		})

		reward_text:set_lefttop(title:left(), r_panel:top())
		placer:set_at_from(reward_text)
	end

	if mission.completed and not mission.rewarded then
		local item = placer:add_row(TextButton:new(canvas, {
			text_id = mission.last_mission and "menu_sm_claim_rewards" or "menu_sm_claim_rewards_goto_next",
			font = medium_font,
			font_size = medium_font_size
		}, function ()
			managers.story:claim_rewards(mission)
			managers.menu_component:post_event("menu_skill_investment")

			local dialog_data = {
				title = managers.localization:text("menu_sm_claim_rewards"),
				text = managers.localization:text(self:_get_reward_string(mission))
			}
			local ok_button = {
				text = managers.localization:text("dialog_ok"),
				callback_func = function ()
					self:_update()
				end
			}
			dialog_data.button_list = {
				ok_button
			}

			managers.system_menu:show(dialog_data)
		end))

		item:set_right(canvas:w())

		self._select_btn = item

		self:_change_legend("select", true)
	end

	if not mission.completed then
		can_skip_mission = can_skip_mission or table.contains(levels, managers.story:get_last_failed_heist())

		if can_skip_mission then
			local btn = TextButton:new(canvas, {
				text_id = "menu_skip_story",
				font = medium_font,
				font_size = medium_font_size
			}, callback(self, self, "_skip_mission_dialog"))

			placer:add_row(btn)
			btn:set_right(canvas:w())
			btn:set_y(btn:y() + 15)
		end

		self:_change_legend("skip_mission", can_skip_mission)
	end
end

function StoryMissionsGui:_get_reward_string(mission)
	return managers.story:get_last_skipped_mission() == mission and mission.reward_id .. "_halved" or mission.reward_id
end

function StoryMissionsGui:_skip_mission(mission)
	managers.statistics:_increment_menu("story_menu_skip", 1)
	managers.statistics:publish_menu_stats_to_steam()
	managers.story:skip_mission(mission)
	self:_update(mission)
end

function StoryMissionsGui:toggle_voice_message(message)
	if not self._voice then
		return
	end

	if managers.briefing:event_playing() then
		managers.briefing:stop_event()
		self._voice.text:set_text(managers.localization:to_upper_text("menu_cn_message_stopped"))
		self._voice.button:set_text(managers.localization:to_upper_text("menu_play_sound", {
			BTN_X = managers.localization:btn_macro("menu_toggle_ready")
		}))
	elseif message then
		managers.briefing:post_event(message, {
			show_subtitle = false,
			listener = {
				end_of_event = true,
				duration = true,
				clbk = callback(self, self, "sound_event_callback")
			}
		})
		self._voice.text:set_text(managers.localization:to_upper_text("menu_cn_message_playing"))
		self._voice.button:set_text(managers.localization:to_upper_text("menu_stop_sound", {
			BTN_X = managers.localization:btn_macro("menu_toggle_ready")
		}))
	end
end

function StoryMissionsGui:sound_event_callback(event_type, duration)
	if not self._voice or not alive(self._voice.text) then
		return
	end

	if event_type == "end_of_event" then
		self._voice.text:set_text(managers.localization:to_upper_text("menu_cn_message_stopped"))
		self._voice.button:set_text(managers.localization:to_upper_text("menu_play_sound", {
			BTN_X = managers.localization:btn_macro("menu_toggle_ready")
		}))
	end
end

function StoryMissionsGui:update()
	if not managers.menu:is_pc_controller() and self:allow_input() and (not managers.system_menu or not managers.system_menu:is_active() or not not managers.system_menu:is_closing()) then
		local axis_x, axis_y = managers.menu_component:get_right_controller_axis()

		if axis_y ~= 0 then
			self._side_scroll:perform_scroll(axis_y)
			self._info_scroll:perform_scroll(axis_y)
		end

		local menu_input = managers.menu:active_menu().input
		local up = menu_input:menu_up_input_bool()
		local down = menu_input:menu_down_input_bool()

		if up or down then
			self:_change_selected_level(up and 1 or -1)
		else
			self:_enable_selected_level_btns()
		end
	end
end

function StoryMissionsGui:_change_selected_level(axis)
	if self._change_level_btn_disabled then
		return
	end

	if self._level_btns and self._selected_level_btn then
		local index = table.get_vector_index(self._level_btns, self._selected_level_btn) - 1

		if not index then
			return
		end

		if axis < 0 then
			index = index - 1
		else
			index = index + 1
		end

		index = index % #self._level_btns + 1

		self._selected_level_btn:_hover_changed(false)

		self._selected_level_btn = self._level_btns[index]

		self._selected_level_btn:_hover_changed(true)

		self._change_level_btn_disabled = true
	end
end

function StoryMissionsGui:_enable_selected_level_btns()
	self._change_level_btn_disabled = nil
end

function StoryMissionsGui:confirm_pressed()
	if alive(self._select_btn) then
		self._select_btn:_trigger()
	end
end

function StoryMissionsGui:_start_mission_general()
	if self._selected_level_btn then
		self._selected_level_btn:_trigger()

		return
	end

	managers.story:start_current()
end

function StoryMissionsGui:_toggle_online()
	managers.menu_component:post_event("menu_enter")

	Global.game_settings.single_player = not Global.game_settings.single_player

	self:_update()
end

function StoryMissionsGui:_skip_mission_dialog()
	local dialog_data = {
		title = managers.localization:text("menu_skip_story_title"),
		text = managers.localization:text("menu_skip_story_desc")
	}
	local yes_button = {
		text = managers.localization:text("dialog_yes"),
		callback_func = callback(self, self, "_skip_mission", managers.story:current_mission())
	}
	local no_button = {
		cancel_button = true,
		text = managers.localization:text("dialog_no")
	}
	dialog_data.focus_button = 2
	dialog_data.button_list = {
		yes_button,
		no_button
	}

	managers.system_menu:show(dialog_data)
end

function StoryMissionsGui:input_focus()
	return alive(self._panel) and self._panel:visible() and 1
end

StoryMissionsGuiSidebarItem = StoryMissionsGuiSidebarItem or class(BaseButton)

function StoryMissionsGuiSidebarItem:init(panel, parameters)
	StoryMissionsGuiSidebarItem.super.init(self, panel)

	local font = tweak_data.menu.pd2_small_font
	local font_size = tweak_data.menu.pd2_small_font_size
	local tab_size = 20
	self._color = parameters.color
	self._color_highlight = parameters.color_highlight
	self._text = self:fine_text({
		text = parameters.text or "",
		font = font,
		font_size = font_size,
		x = tab_size + parameters.indent,
		w = self:w(),
		h = font_size
	})
	self._icon = self:bitmap({
		y = 2,
		x = parameters.indent,
		texture = parameters.icon,
		rotation = parameters.icon_rotation
	})

	self._icon:set_visible(parameters.icon)

	self._trigger = parameters.callback

	self:set_h(self._text:bottom())
	self:set_color(self._color)
end

function StoryMissionsGuiSidebarItem:set_text(text)
	self._text:set_text(text)
end

function StoryMissionsGuiSidebarItem:set_icon(icon)
	if icon then
		self._icon:set_visible(true)
		self._icon:set_image(icon)
	else
		self._icon:set_visible(false)
	end
end

function StoryMissionsGuiSidebarItem:set_color(color)
	self._text:set_color(color)
	self._icon:set_color(color)
end

function StoryMissionsGuiSidebarItem:_hover_changed(hover)
	self:set_color(hover and self._color_highlight or self._color)

	if hover then
		managers.menu_component:post_event("highlight")
	end
end

StoryActGuiSidebarItem = StoryActGuiSidebarItem or class(BaseButton)

function StoryActGuiSidebarItem:init(panel, parameters)
	StoryActGuiSidebarItem.super.init(self, panel)

	local font = tweak_data.menu.pd2_small_font
	local font_size = tweak_data.menu.pd2_small_font_size
	self._text = self:fine_text({
		text = parameters.text or "",
		font = font,
		font_size = font_size,
		x = parameters.indent,
		w = self:w(),
		h = font_size,
		color = parameters.color
	})

	self:set_h(self._text:bottom())
end

local function set_defaults(target, source)
	target = target or {}

	for k, v in pairs(source) do
		if target[k] == nil then
			target[k] = v
		end
	end

	return target
end

StoryMissionGuiRewardItem = StoryMissionGuiRewardItem or class(ExtendedPanel)
StoryMissionGuiRewardItem.SIZE = 128

function StoryMissionGuiRewardItem:init(panel, reward_data, config, skipped_mission)
	config = set_defaults(config, {
		input = true,
		w = self.SIZE,
		h = self.SIZE
	})

	StoryMissionGuiRewardItem.super.init(self, panel, config)

	local texture_path, texture_rect, reward_string = nil
	local is_pattern = false
	local is_material = false
	local is_weapon = false

	if reward_data[1] == "safehouse_coins" then
		local amount = reward_data[2]

		if skipped_mission then
			amount = math.floor(amount / 2)
		end

		texture_path = "guis/dlcs/chill/textures/pd2/safehouse/continental_coins_drop"
		reward_string = managers.localization:text("menu_es_safehouse_reward_coins", {
			amount = managers.experience:cash_string(amount, "")
		})
	elseif reward_data.choose_weapon_reward then
		texture_path = "guis/textures/pd2/icon_modbox_df"
		reward_string = managers.localization:text("menu_challenge_choose_weapon_mod")
	elseif #reward_data > 0 then
		texture_path = reward_data.texture_path or "guis/textures/pd2/icon_reward"
		texture_rect = reward_data.texture_rect
		reward_string = reward_data.name_s or managers.localization:text(reward_data.name_id or "menu_challenge_choose_reward")
	elseif reward_data.item_entry then
		local id = reward_data.item_entry
		local category = reward_data.type_items
		local td = tweak_data:get_raw_value("blackmarket", category, id) or tweak_data:get_raw_value(category, id)

		if td then
			local guis_catalog = "guis/"
			local bundle_folder = td.texture_bundle_folder

			if bundle_folder then
				guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
			end

			if category == "textures" then
				texture_path = td.texture
				reward_string = managers.localization:text(td.name_id)
				is_pattern = true
			elseif category == "cash" then
				texture_path = "guis/textures/pd2/blackmarket/cash_drop"
				reward_string = managers.experience:cash_string(managers.money:get_loot_drop_cash_value(td.value_id))
			elseif category == "xp" then
				texture_path = "guis/textures/pd2/blackmarket/xp_drop"
				reward_string = managers.localization:text("menu_challenge_xp_drop")
			else
				if category == "weapon_mods" or category == "weapon_bonus" then
					category = "mods"
				end

				if category == "weapon" then
					category = "weapons"
					is_weapon = true
				end

				is_material = category == "materials"
				texture_path = guis_catalog .. "textures/pd2/blackmarket/icons/" .. category .. "/" .. id
				reward_string = managers.localization:text(td.name_id)
			end
		end
	elseif reward_data.tango_weapon_part then
		texture_path = "guis/dlcs/tng/textures/pd2/blackmarket/icons/side_job_rewards/gage_mod_rewards"
		reward_string = managers.localization:text("menu_tango_reward_weapon_part")
	end

	local scale = is_material and 0.7 or 0.8
	self._image = self:fit_bitmap({
		texture = texture_path,
		texture_rect = texture_rect
	}, scale * self:w(), scale * self:h())

	self._image:set_center_y(self:h() * 0.5)
	self._image:set_center_x(self:w() * 0.5)

	if is_pattern then
		self._image:set_render_template(Idstring("VertexColorTexturedPatterns"))
		self._image:set_blend_mode("normal")
	end

	self._text = self:fine_text({
		vertical = "bottom",
		blend_mode = "add",
		align = "left",
		visible = false,
		font_size = small_font_size,
		font = small_font,
		color = tweak_data.screen_colors.title,
		text = reward_string,
		w = self:w(),
		h = small_font_size * 2
	})

	self.scale_font_to_fit(self._text, self:w())
	self._text:set_bottom(self:h())
	self._text:set_x(self:w() * 0.5 - self._text:w() * 0.5)
end

function StoryMissionGuiRewardItem:mouse_moved(button, x, y)
	self._text:set_visible(self:inside(x, y))
end
