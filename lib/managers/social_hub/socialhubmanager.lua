SocialHubManager = SocialHubManager or class()
SocialHubManager.save_version = 1
SocialHubManager._invite_cache = {}
local IDS_STEAM = Idstring("STEAM")
local IDS_EPIC = Idstring("EPIC")
local INVITE_TIMEOUT = 30

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
	self._account_types = {
		IDS_EPIC = "EPIC",
		IDS_STEAM = "STEAM"
	}

	self:cleanup_blocked_list()

	if SystemInfo:matchmaking() == Idstring("MM_EPIC") and EpicSocialHub then
		print("[SocialHubManager:init] Subscribing to EpicSocialHub lobby invites...")
		EpicSocialHub:subscribe_to_lobby_invites(callback(self, self, "on_invite_recieved"), callback(self, self, "on_invite_accepted"))
	end
end

function SocialHubManager:save(cache)
	print("[SocialHubManager:save] version:", self.save_version)

	local clean_cached_users = deep_clone(self._global.cached_users)

	for _, data in pairs(clean_cached_users) do
		if data.account_type then
			data.account_type = self._account_types[data.account_type] or nil
		end
	end

	local save_data = {
		version = self.save_version,
		friends = self._global.friend_users,
		blocked = self._global.blocked_users,
		cached = clean_cached_users
	}
	cache.socialhub = save_data
end

function SocialHubManager:load(cache, version)
	print("[SocialHubManager:load] version:", version)

	local state = cache.socialhub or {}

	if not Global.socialhub then
		Global.socialhub = {}
	end

	self._global = Global.socialhub
	self._global.friend_users = state.friends or {}
	self._global.blocked_users = state.blocked or {}
	self._global.cached_users = state.cached or {}

	for _, data in pairs(self._global.cached_users) do
		if data.account_type then
			data.account_type = Idstring(data.account_type)
		end
	end

	SocialHubFriends:sync_friends(self._global.friend_users)
	SocialHubFriends:sync_blocked(self._global.blocked_users)
	self:cleanup_blocked_list()
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
			account_type = IDS_STEAM
		})
		table.insert(self._platform_users, item:id())
	end

	self:cleanup_blocked_list()

	if callback then
		callback()
	end
end

function SocialHubManager:fetch_epic_friends(gui_callback)
	EpicSocialHub:get_epic_friends(callback(self, self, "epic_friends_id_callback", gui_callback))
end

function SocialHubManager:epic_friends_id_callback(gui_callback, success, users)
	print("[SocialHubManager] epic_friends_id_callback", inspect(success), inspect(users))

	if success then
		EpicMM:query_users(users, callback(self, self, "epic_friends_data_callback", gui_callback))
	else
		gui_callback()
	end
end

function SocialHubManager:epic_friends_data_callback(gui_callback, success, users)
	print("[SocialHubManager] epic_friends_data_callback", inspect(success), inspect(users))

	self._platform_users = {}

	if success then
		for index, item in pairs(users or {}) do
			self:add_cached_user(index, {
				display_name = item.display_name,
				id = index,
				account_id = item.account_id,
				account_type = IDS_EPIC
			})
			table.insert(self._platform_users, index)
		end
	end

	self:cleanup_blocked_list()

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
	local user_name = display_name
	local user_data = managers.socialhub:get_user(user_id)
	user_name = user_name or user_data and user_data.name or managers.localization:text("menu_socialhub_notification_unknown")

	managers.menu_component:push_socialhub_notification("lobby_invite", user_name)
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

function SocialHubManager:is_user_platform_friend(id, check_account)
	if check_account and SystemInfo:distribution() == IDS_STEAM then
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
	local str_id = tostring(id)
	self._global.cached_users[str_id] = {
		name = data.display_name,
		id = str_id,
		account_id = data.account_id,
		platform = data.account_type,
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

function SocialHubManager:cleanup_blocked_list(user_id)
	for index, blocked_id in ipairs(self._global.blocked_users) do
		if self:is_user_friend(blocked_id) or self:is_user_platform_friend(blocked_id) then
			self:remove_user_blocked(blocked_id)
		end
	end
end

function SocialHubManager:get_actions_for_user(callback_object, callback_function, user_id)
	if not self:user_exists(user_id) or user_id == managers.network.matchmake:userid() then
		return false
	end

	local actions = {}
	local user_data = self:get_user(user_id)
	local is_blocked = self:is_user_blocked(user_id)

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

	local is_platform_friend = self:is_user_platform_friend(user_id, true)

	if not is_platform_friend then
		local is_friend = self:is_user_friend(user_id)

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

function SocialHubManager:update_pending_lobby(lobby_id, lobby_parameters)
	if self._global.pending_lobbies[lobby_id] then
		self._global.pending_lobbies[lobby_id] = lobby_parameters
	end
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
				user_id = user_id,
				time = INVITE_TIMEOUT
			})
			user:invite(lobby_id)
		end
	else
		table.insert(self._invited_users, {
			user_id = user_id,
			time = INVITE_TIMEOUT
		})
		EpicSocialHub:invite_user_to_lobby(user_id, lobby_id)
	end
end

function SocialHubManager:is_user_invited(user_id)
	for _, item in ipairs(self._invited_users) do
		if item.user_id == user_id then
			return true
		end
	end

	return false
end
