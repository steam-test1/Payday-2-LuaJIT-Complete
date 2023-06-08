SocialHubManager = SocialHubManager or class()
SideJobEventManager.save_version = 1
SocialHubManager._invite_cache = {}

function SocialHubManager:init()
	if not Global.socialhub then
		Global.socialhub = {}
	end

	self._global = Global.socialhub
	self._global.friend_users = self._global.friend_users or {}
	self._global.blocked_users = self._global.blocked_users or {}
	self._global.cached_users = self._global.cached_users or {}
	self._global.pending_lobbies = self._global.pending_lobbies or {}

	SocialHubFriends:sync_friends(self._global.friend_users)
	SocialHubFriends:sync_blocked(self._global.blocked_users)

	self._platform_users = {}
	self._invited_users = {}

	if SystemInfo:matchmaking() == Idstring("MM_EPIC") and EpicSocialHub then
		EpicSocialHub:subscribe_to_lobby_invites(callback(self, self, "on_invite_recieved"), callback(self, self, "on_invite_accepted"))
	end
end

function SocialHubManager:save(cache)
	local save_data = {
		version = self.save_version,
		friends = self._global.friend_users,
		blocked = self._global.blocked_users,
		cached = self._global.cached_users
	}
	cache.socialhub = save_data
end

function SocialHubManager:load(cache, version)
	local state = cache.socialhub or {}

	if not Global.socialhub then
		Global.socialhub = {}
	end

	self._global = Global.socialhub
	self._global.friend_users = state.friends or {}
	self._global.blocked_users = state.blocked or {}
	self._global.cached_users = state.cached or {}

	SocialHubFriends:sync_friends(self._global.friend_users)
	SocialHubFriends:sync_blocked(self._global.blocked_users)
end

function SocialHubManager:update(t, dt)
	for index, item in ipairs(self._invited_users) do
		item.time = item.time - dt

		if item.time < 0 then
			table.remove(self._invited_users, index)
		end
	end
end

function SocialHubManager:fetch_steam_friends(callback)
	self._platform_users = {}

	for index, item in ipairs(Steam:logged_on() and Steam:friends() or {}) do
		self:add_cached_user(item:id(), {
			display_name = item:name(),
			id = item:id(),
			lobby = item:lobby(),
			rich_presence = item:rich_presence(),
			state = item:state(),
			account_type = Idstring("STEAM")
		})
		table.insert(self._platform_users, item:id())
	end

	if callback then
		callback()
	end
end

function SocialHubManager:fetch_epic_friends(gui_callback)
	EpicSocialHub:get_epic_friends(callback(self, self, "epic_friends_id_callback", gui_callback))
end

function SocialHubManager:epic_friends_id_callback(gui_callback, success, users)
	print("epic_friends_id_callback", inspect(success), inspect(users))

	if success then
		EpicMM:query_users(users, callback(self, self, "epic_friends_data_callback", gui_callback))
	else
		gui_callback()
	end
end

function SocialHubManager:epic_friends_data_callback(gui_callback, success, users)
	print("epic_friends_data_callback", inspect(success), inspect(users))

	if success then
		self._platform_users = {}

		for index, item in pairs(users or {}) do
			self:add_cached_user(index, {
				display_name = item.display_name,
				id = index,
				account_id = item.account_id,
				account_type = Idstring("EPIC")
			})
			table.insert(self._platform_users, index)
		end
	end

	if gui_callback then
		gui_callback()
	end
end

function SocialHubManager:fetch_users(caller_callback)
	if EpicMM then
		self._callback = caller_callback
		local fetch_users = table.list_add(self._global.friend_users, self._global.blocked_users)

		EpicMM:query_users(fetch_users, callback(self, self, "on_users_fetched"))
	else
		caller_callback()
	end
end

function SocialHubManager:on_users_fetched(s, accounts)
	if s then
		for index, item in pairs(accounts) do
			self:add_cached_user(index, {
				display_name = item.display_name,
				id = index,
				account_id = item.account_id,
				account_type = item.account_type
			})
		end
	end

	if self._callback then
		self._callback()
	end
end

function SocialHubManager:on_invite_accepted(invite_id, accepted)
	if accepted then
		local lobby_id = self._invite_cache[invite_id]

		if not lobby_id then
			print("[Social Hub] No lobby associated with invite id : ", invite_id)

			return
		end

		EpicSocialHub:join_lobby(lobby_id)
	end
end

function SocialHubManager:on_invite_recieved(invite_id, lobby_id, user_id, display_name, platform)
	if self:is_user_blocked(user_id) or managers.user:get_setting("socialhub_invite") == "off" or managers.user:get_setting("socialhub_invite") == "friends" and not self:is_user_friend(user_id) then
		return
	end

	self._invite_cache[invite_id] = lobby_id
	local user_data = managers.socialhub:get_user(user_id)

	managers.menu_component:push_socialhub_notification("lobby_invite", display_name or user_data and user_data.name or managers.localization:text("menu_socialhub_notification_unknown"))
	EpicSocialHub:get_lobby_info(lobby_id, callback(self, self, "on_search_lobby_fetched"))
end

function SocialHubManager:on_search_lobby_fetched(first, second, third)
	if not first or not second then
		return
	end

	third.LOBBYID = first
	self._global.pending_lobbies[first] = third

	managers.menu_component:social_hub_gui_reset_tab_by_name("invite")
end

function SocialHubManager:add_user_friend(id)
	table.insert(self._global.friend_users, id)
	SocialHubFriends:add_friend(id)
end

function SocialHubManager:remove_user_friend(id)
	local friend_index = table.index_of(self._global.friend_users, id)

	if friend_index ~= -1 then
		table.remove(self._global.friend_users, friend_index)
	end

	SocialHubFriends:remove_friend(id)
end

function SocialHubManager:remove_user_blocked(id)
	local blocked_index = table.index_of(self._global.blocked_users, id)

	if blocked_index ~= -1 then
		table.remove(self._global.blocked_users, blocked_index)
	end

	SocialHubFriends:remove_blocked(id)
end

function SocialHubManager:add_user_blocked(id)
	table.insert(self._global.blocked_users, id)
	SocialHubFriends:add_blocked(id)
end

function SocialHubManager:can_friend_user(id)
	return true
end

function SocialHubManager:can_remove_friend_user(id)
	return false
end

function SocialHubManager:can_block_user(id)
	return true
end

function SocialHubManager:can_invite_user(id)
	return false
end

function SocialHubManager:user_exists(id)
	id = tostring(id)

	return self._global.cached_users[id] and true or false
end

function SocialHubManager:get_user(id)
	id = tostring(id)

	return self._global.cached_users[id]
end

function SocialHubManager:is_user_platform_friend(id)
	if SystemInfo:distribution() == Idstring("STEAM") then
		local user = self:get_user(id)

		if user then
			id = user.account_id or id
		end
	end

	return table.contains(self._platform_users, id)
end

function SocialHubManager:is_user_friend(id)
	return table.contains(self._global.friend_users, id)
end

function SocialHubManager:is_user_blocked(id)
	return table.contains(self._global.blocked_users, id) or SocialHubFriends:is_blocked(id)
end

function SocialHubManager:add_cached_user(id, data)
	id = tostring(id)
	self._global.cached_users[id] = {
		name = data.display_name,
		id = id,
		account_id = data.account_id,
		platform = data.account_type,
		lobby = data.lobby,
		rich_presence = data.rich_presence,
		state = data.state
	}
end

function SocialHubManager:get_platform_friends()
	return self._platform_users
end

function SocialHubManager:get_number_of_platform_friends()
	return #self._platform_users
end

function SocialHubManager:get_cross_friends()
	return self._global.friend_users
end

function SocialHubManager:get_number_of_cross_friends()
	return #self._global.friend_users
end

function SocialHubManager:get_actions_for_user(callback_object, callback_function, user_id)
	if not self:user_exists(user_id) or user_id == managers.network.matchmake:userid() then
		return false
	end

	local user_data = self:get_user(user_id)
	local is_blocked = self:is_user_blocked(user_id)
	local is_friend = self:is_user_friend(user_id)
	local is_platform_friend = self:is_user_platform_friend(user_id)
	local actions = {}

	if managers.network.matchmake.lobby_handler and not is_blocked then
		if managers.socialhub:is_user_invited(user_id) then
			table.insert(actions, {
				action = "invite_sent",
				text = managers.localization:text("socialhub_user_action_invite_sent"),
				press_callback = callback(callback_object, callback_object, callback_function, "invite_sent")
			})
		else
			table.insert(actions, {
				action = "invite",
				text = managers.localization:text("socialhub_user_action_invite"),
				press_callback = callback(callback_object, callback_object, callback_function, "invite")
			})
		end
	end

	if not is_platform_friend then
		if is_friend then
			table.insert(actions, {
				action = "remove",
				text = managers.localization:text("socialhub_user_action_remove"),
				press_callback = callback(callback_object, callback_object, callback_function, "unfriend")
			})
		elseif is_blocked then
			table.insert(actions, {
				action = "unblock",
				text = managers.localization:text("socialhub_user_action_unblock"),
				press_callback = callback(callback_object, callback_object, callback_function, "unblock")
			})
		else
			table.insert(actions, {
				action = "add",
				text = managers.localization:text("socialhub_user_action_add"),
				press_callback = callback(callback_object, callback_object, callback_function, "friend")
			})
			table.insert(actions, {
				action = "block",
				text = managers.localization:text("socialhub_user_action_block"),
				press_callback = callback(callback_object, callback_object, callback_function, "block")
			})
		end
	end

	return actions
end

function SocialHubManager:get_blocked_users()
	return self._global.blocked_users
end

function SocialHubManager:remove_pending_lobby(lobby_id)
	self._global.pending_lobbies[lobby_id] = nil
end

function SocialHubManager:get_pending_lobbies()
	return self._global.pending_lobbies
end

function SocialHubManager:invite_user_to_lobby(user_id)
	if not managers.network.matchmake.lobby_handler then
		return
	end

	local lobby_id = managers.network.matchmake.lobby_handler:id()

	if not lobby_id then
		return
	end

	if self:is_user_platform_friend(user_id) then
		local user = managers.network.account:get_friend_user(user_id)

		if user then
			table.insert(self._invited_users, {
				time = 30,
				user_id = user_id
			})
			user:invite(lobby_id)
		end
	else
		table.insert(self._invited_users, {
			time = 30,
			user_id = user_id
		})
		EpicSocialHub:invite_user_to_lobby(user_id, lobby_id)
	end
end

function SocialHubManager:is_user_invited(user_id)
	for index, item in ipairs(self._invited_users) do
		if item.user_id == user_id then
			return true
		end
	end

	return false
end
