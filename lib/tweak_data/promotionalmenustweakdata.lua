PromotionalMenusTweakData = PromotionalMenusTweakData or class()

function PromotionalMenusTweakData:init(tweak_data)
	self.menus = {}
	self.themes = {}

	self:_init_raid(tweak_data)
end

function PromotionalMenusTweakData:_init_raid(tweak_data)
	self.menus.raid = {
		padding = 5,
		size = 0.8,
		layout = {
			x = 4,
			y = 6
		},
		buttons = {
			{
				callback = "launch_raid",
				type = "RaidPromotionalMenuButton",
				position = {
					1,
					1
				},
				size = {
					3,
					2
				},
				title = {
					font = "large",
					font_size = "large",
					name_id = "menu_raid_beta_play",
					color = Color(1, 0, 0, 0)
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/play_raid_header_df"
				}
			},
			{
				callback = "open_raid_preorder_menu",
				type = "RaidPromotionalMenuButton",
				position = {
					4,
					1
				},
				size = {
					1,
					2
				},
				title = {
					font = "medium",
					font_size = "medium",
					name_id = "menu_raid_preorder"
				},
				subtitle = {
					font = "small",
					font_size = "small",
					name_id = "menu_raid_preorder_desc",
					color = Color(1, 0, 0, 0)
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/preorder"
				}
			},
			{
				callback = "open_raid_weapons_menu",
				type = "RaidPromotionalMenuButton",
				position = {
					1,
					3
				},
				size = {
					2,
					2
				},
				title = {
					font = "medium",
					font_size = "medium",
					name_id = "menu_raid_beta_weapons"
				},
				subtitle = {
					font = "small",
					font_size = "small",
					name_id = "menu_raid_beta_weapons_desc"
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/pd2_weaponpack_df"
				}
			},
			{
				callback = "open_raid_trailer",
				type = "RaidPromotionalMenuButton",
				position = {
					3,
					3
				},
				size = {
					1,
					2
				},
				title = {
					font = "medium",
					font_size = "medium",
					name_id = "menu_raid_cinematic_trailer"
				},
				subtitle = {
					font = "small",
					font_size = "small",
					name_id = "menu_raid_cinematic_trailer_desc"
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/cinematic_trailer_df"
				},
				overlay = {
					h = 102.4,
					image = "guis/dlcs/aru/textures/pd2/play_button",
					w = 102.4,
					center = {
						0.5,
						0.35
					}
				}
			},
			{
				callback = "open_dev_diary_trailer",
				type = "RaidPromotionalMenuButton",
				position = {
					4,
					3
				},
				size = {
					1,
					2
				},
				title = {
					font = "medium",
					font_size = "medium",
					name_id = "menu_raid_dev_diary"
				},
				subtitle = {
					font = "small",
					font_size = "small",
					name_id = "menu_raid_dev_diary_desc"
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/dev_diary"
				},
				overlay = {
					h = 102.4,
					image = "guis/dlcs/aru/textures/pd2/play_button",
					w = 102.4,
					center = {
						0.5,
						0.35
					}
				}
			},
			{
				callback = "open_raid_gang",
				type = "RaidPromotionalMenuButton",
				position = {
					1,
					5
				},
				size = {
					2,
					1
				},
				title = {
					font = "medium",
					font_size = "medium",
					name_id = "menu_raid_meet_gang"
				},
				subtitle = {
					font = "small",
					font_size = "small",
					name_id = "menu_raid_meet_gang_desc"
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/meet_the_gang"
				}
			},
			{
				callback = "open_raid_feedback",
				type = "RaidPromotionalMenuButton",
				position = {
					1,
					6
				},
				size = {
					2,
					1
				},
				title = {
					font = "medium",
					font_size = "medium",
					name_id = "menu_raid_feedback"
				},
				subtitle = {
					font = "small",
					font_size = "small",
					name_id = "menu_raid_feedback_desc"
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/feedback"
				}
			},
			{
				callback = "open_gameplay_trailer",
				type = "RaidPromotionalMenuButton",
				position = {
					3,
					5
				},
				size = {
					1,
					2
				},
				title = {
					font = "medium",
					font_size = "medium",
					name_id = "menu_raid_gameplay_trailer"
				},
				subtitle = {
					font = "small",
					font_size = "small",
					name_id = "menu_raid_gameplay_trailer_desc"
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/gameplay_trailer"
				},
				overlay = {
					h = 102.4,
					image = "guis/dlcs/aru/textures/pd2/play_button",
					w = 102.4,
					center = {
						0.5,
						0.35
					}
				}
			},
			{
				callback = "open_raid_special_edition_menu",
				type = "RaidPromotionalMenuButton",
				position = {
					4,
					5
				},
				size = {
					1,
					1
				},
				title = {
					font = "medium",
					font_size = "medium",
					name_id = "menu_raid_special_edition"
				},
				subtitle = {
					font = "small",
					font_size = "small",
					name_id = "menu_raid_special_edition_desc"
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/special_edition"
				}
			},
			{
				callback = "open_raid_twitch",
				type = "RaidPromotionalMenuButton",
				position = {
					4,
					6
				},
				size = {
					1,
					1
				},
				title = {
					font = "medium",
					font_size = "medium",
					name_id = "menu_raid_twitch"
				},
				subtitle = {
					font = "small",
					font_size = "small",
					name_id = "menu_raid_twitch_desc"
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/twitch"
				},
				overlay = {
					h = 64,
					image = "guis/dlcs/aru/textures/pd2/twitch_overlay",
					w = 64,
					align = {
						"right",
						"top"
					}
				}
			}
		}
	}
	self.menus.raid_weapons = {
		size = 0.8,
		layout = {
			x = 12,
			y = 11
		},
		buttons = {
			{
				type = "PromotionalMenuSeperatorRaid",
				position = {
					1,
					1
				},
				size = {
					12,
					1
				},
				title = {
					align = "left",
					font = "medium",
					font_size = "medium",
					name_id = "bm_menu_primaries",
					vertical = "bottom"
				},
				background = {
					blend_mode = "normal",
					color = true
				}
			},
			{
				callback = "preview_ching",
				type = "RaidPromotionalMenuButton",
				position = {
					1,
					2
				},
				size = {
					12,
					3
				},
				title = {
					align = "left",
					font = "large",
					font_size = "large",
					name_id = "bm_w_ching",
					vertical = "bottom",
					color = Color(1, 1, 1, 1)
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/weapon_ching"
				}
			},
			{
				type = "PromotionalMenuSeperatorRaid",
				position = {
					1,
					5
				},
				size = {
					8,
					1
				},
				title = {
					align = "left",
					font = "medium",
					font_size = "medium",
					name_id = "bm_menu_secondaries",
					vertical = "bottom"
				},
				background = {
					blend_mode = "normal",
					color = true
				}
			},
			{
				callback = "preview_erma",
				type = "RaidPromotionalMenuButton",
				position = {
					1,
					6
				},
				size = {
					8,
					3
				},
				title = {
					align = "left",
					font = "medium",
					font_size = "medium",
					name_id = "bm_w_erma",
					vertical = "bottom",
					color = Color(1, 1, 1, 1)
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/weapon_erma"
				}
			},
			{
				callback = "preview_breech",
				type = "RaidPromotionalMenuButton",
				position = {
					1,
					9
				},
				size = {
					8,
					3
				},
				title = {
					align = "left",
					font = "medium",
					font_size = "medium",
					name_id = "bm_w_breech",
					vertical = "bottom",
					color = Color(1, 1, 1, 1)
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/weapon_breech"
				}
			},
			{
				type = "PromotionalMenuSeperatorRaid",
				position = {
					9,
					5
				},
				size = {
					4,
					1
				},
				title = {
					align = "left",
					font = "medium",
					font_size = "medium",
					name_id = "bm_menu_melee_weapons",
					vertical = "bottom"
				},
				background = {
					blend_mode = "normal",
					color = true
				}
			},
			{
				callback = "preview_push",
				type = "RaidPromotionalMenuButton",
				position = {
					9,
					6
				},
				size = {
					4,
					3
				},
				title = {
					align = "left",
					font = "medium",
					font_size = "medium",
					name_id = "bm_melee_push",
					vertical = "bottom",
					color = Color(1, 1, 1, 1)
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/weapon_push"
				}
			},
			{
				callback = "preview_grip",
				type = "RaidPromotionalMenuButton",
				position = {
					9,
					9
				},
				size = {
					4,
					3
				},
				title = {
					align = "left",
					font = "medium",
					font_size = "medium",
					name_id = "menu_community_item",
					vertical = "bottom",
					color = Color(255, 222, 74, 62) / 255
				},
				subtitle = {
					name_id = "bm_melee_grip",
					color = Color(1, 1, 1, 1),
					offset = {
						0,
						6
					}
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/weapon_grip"
				}
			}
		}
	}
	self.menus.raid_special = {
		size = 0.8,
		layout = {
			x = 1,
			y = 1
		},
		buttons = {
			{
				callback = "open_raid_special_edition",
				type = "RaidPromotionalMenuFloatingButton",
				position = {
					1,
					1
				},
				size = {
					1,
					1
				},
				floating_position = {
					400,
					270
				},
				floating_size = {
					128,
					128
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/preorder_now_button"
				}
			},
			{
				can_be_selected = false,
				type = "PromotionalMenuUnselectableButton",
				zoom_factor = 1,
				position = {
					1,
					1
				},
				size = {
					1,
					1
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/preorder_special_edition"
				}
			}
		}
	}
	self.menus.raid_preorder = {
		size = 0.8,
		layout = {
			x = 1,
			y = 1
		},
		buttons = {
			{
				can_be_selected = false,
				type = "PromotionalMenuUnselectableButton",
				zoom_factor = 1,
				position = {
					1,
					1
				},
				size = {
					1,
					1
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/raid_preorder"
				}
			},
			{
				callback = "open_raid_preorder",
				type = "RaidPromotionalMenuFloatingButton",
				position = {
					1,
					1
				},
				size = {
					1,
					1
				},
				floating_position = {
					260,
					350
				},
				floating_size = {
					256,
					64
				},
				background = {
					image = "guis/dlcs/aru/textures/pd2/raid_preorder_button"
				}
			}
		}
	}
	self.themes.payday = {
		selection_corners = Color.white,
		selection_outline = Color.white,
		background_unselected = Color(40, 0, 170, 255) / 255,
		background_selected = Color(80, 77, 198, 255) / 255,
		font = {
			small = tweak_data.menu.pd2_small_font,
			medium = tweak_data.menu.pd2_medium_font,
			large = tweak_data.menu.pd2_large_font,
			massive = tweak_data.menu.pd2_massive_font
		},
		font_size = {
			small = tweak_data.menu.pd2_small_font_size,
			medium = tweak_data.menu.pd2_medium_font_size,
			large = tweak_data.menu.pd2_large_font_size,
			massive = tweak_data.menu.pd2_massive_font_size
		}
	}
	self.themes.raid = {
		backgrounds = {
			{
				blend_mode = "normal",
				type = "video",
				video = "movies/raid_anim_bg",
				color = Color(1, 1, 1, 1)
			},
			{
				blend_mode = "add",
				h = 727.04,
				image = "guis/dlcs/aru/textures/pd2/main_bg_img",
				type = "image",
				w = 1454.08
			},
			{
				h = 204.8,
				image = "guis/dlcs/aru/textures/pd2/raid_logo",
				type = "image",
				w = 409.6,
				x = 140,
				y = 300
			},
			{
				h = 102.4,
				image = "guis/dlcs/aru/textures/pd2/beta_logo",
				type = "image",
				w = 409.6,
				x = 140,
				y = 480
			}
		},
		selection_corners = Color(255, 222, 74, 62) / 255,
		selection_outline = Color(255, 222, 74, 62) / 255,
		selection_outline_sides = {
			sides = {
				2,
				2,
				2,
				2
			}
		},
		background_unselected = Color(100, 43, 48, 55) / 255,
		background_selected = Color(200, 59, 64, 68) / 255,
		title = Color(255, 222, 74, 62) / 255,
		subtitle = Color(1, 1, 1, 1),
		font = {
			small = tweak_data.menu.pd2_small_font,
			medium = tweak_data.menu.pd2_medium_font,
			large = tweak_data.menu.pd2_large_font,
			massive = tweak_data.menu.pd2_massive_font
		},
		font_size = {
			small = tweak_data.menu.pd2_small_font_size * 0.7,
			medium = tweak_data.menu.pd2_medium_font_size * 0.7,
			large = tweak_data.menu.pd2_large_font_size,
			massive = tweak_data.menu.pd2_massive_font_size
		}
	}
end
