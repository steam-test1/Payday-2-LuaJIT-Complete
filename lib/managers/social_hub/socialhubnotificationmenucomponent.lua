local medium_font = tweak_data.menu.pd2_medium_font
local medium_font_size = tweak_data.menu.pd2_medium_font_size
local textparams = {
	text = "",
	layer = 1,
	x = 10 + medium_font_size * 2 + 25,
	font = medium_font,
	font_size = medium_font_size
}
local notification_actions = {
	friend_request = {
		icon_id = "guis/dlcs/shub/textures/new_friend_request_icon",
		text_id = "menu_socialhub_notification_friend"
	},
	lobby_invite = {
		icon_id = "guis/dlcs/shub/textures/invite_to_lobby_icon",
		text_id = "menu_socialhub_notification_lobby"
	}
}
SocialHubNotification = SocialHubNotification or class()

function SocialHubNotification:init(ws, fullscreen_ws, node)
	self._ws = ws
	self._fullscreen_ws = fullscreen_ws
	self._panel = self._ws:panel():panel({
		w = 500,
		layer = 500
	})
	self._fullscreen_panel = self._fullscreen_ws:panel():panel({
		w = 500,
		layer = 500
	})
	self._notifications = {}
end

function SocialHubNotification:push_notification(type, user, small_size)
	local notification_size = managers.user:get_setting("socialhub_notification")

	if notification_size == "off" then
		return
	end

	local notification_type = notification_actions[type]

	if not notification_type then
		return
	end

	managers.menu_component:post_event("shub_notification")

	local free_notification = nil

	for index, item in table.reverse_ipairs(self._notifications) do
		if not item.notification:visible() then
			free_notification = item
		end
	end

	if not free_notification then
		local h_size = medium_font_size * 2 + 25
		local notification_panel = self._fullscreen_panel:panel({
			x = -500,
			y = 50 + (h_size + 2) * #self._notifications,
			h = h_size
		})

		notification_panel:rect({
			alpha = 0.5,
			color = tweak_data.screen_colors.button_stage_3
		})
		notification_panel:bitmap({
			texture = "guis/textures/test_blur_df",
			render_template = "VertexColorTexturedBlur3D",
			layer = -1
		})
		BoxGuiObject:new(notification_panel, {
			sides = {
				1,
				1,
				1,
				1
			}
		})

		local action_icon = notification_panel:bitmap({
			texture = "guis/dlcs/shub/textures/epic_player_icon",
			y = 10,
			x = 10,
			layer = -1,
			w = notification_panel:h() - 20,
			h = notification_panel:h() - 20
		})
		local name_text = notification_panel:text(textparams)

		name_text:set_y(10)

		local action_text = notification_panel:text(textparams)

		action_text:set_y(medium_font_size + 10 + 5)

		free_notification = {
			notification = notification_panel,
			name_text = name_text,
			action_text = action_text,
			action_icon = action_icon
		}

		table.insert(self._notifications, free_notification)
	end

	free_notification.action_icon:set_image(notification_type.icon_id)

	if notification_size == "compact" then
		free_notification.name_text:set_visible(false)
		free_notification.action_text:set_visible(false)
		free_notification.notification:set_width(free_notification.action_icon:right() + 10)
	else
		free_notification.name_text:set_visible(true)
		free_notification.name_text:set_text(user)
		ExtendedPanel.make_fine_text(free_notification.name_text)
		free_notification.action_text:set_visible(true)
		free_notification.action_text:set_text(managers.localization:text(notification_type.text_id))
		ExtendedPanel.make_fine_text(free_notification.action_text)
		free_notification.notification:set_width(math.min(self._fullscreen_panel:w(), math.max(free_notification.action_text:right(), free_notification.name_text:right()) + 10))
	end

	free_notification.notification:set_x(-free_notification.notification:w())
	free_notification.notification:set_visible(true)
	free_notification.notification:animate(function (o)
		local t = 0
		local dt = 0
		local speed = 2
		local start = o:x()
		local goal = o:x() + o:w()

		while t <= 1 do
			dt = coroutine.yield()
			t = t + dt * speed

			if o then
				o:set_x(math.lerp(start, goal, math.min(t, 1)))
			end
		end

		t = 0

		while t <= 4 do
			dt = coroutine.yield()
			t = t + dt
		end

		t = 0

		while t <= 1 do
			dt = coroutine.yield()
			t = t + dt * speed

			if o then
				o:set_x(math.lerp(goal, start, math.min(t, 1)))
			end
		end

		if o then
			o:set_visible(false)
		end
	end)
end

function SocialHubNotification:close()
end
