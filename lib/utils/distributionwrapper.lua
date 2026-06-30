Steam = Steam or {}
Steam.SMALL_AVATAR = 0
Steam.MEDIUM_AVATAR = 1
Steam.LARGE_AVATAR = 2

local function shadow_class_instance_function(object, bad_name, new_name)
	if object and getmetatable(object) then
		getmetatable(object)[bad_name] = getmetatable(object)[new_name]
	end
end

function Steam:init()
	return
end

function Steam:update()
	return
end

function Steam:logged_on()
	return Distribution:logged_on()
end

function Steam:username(user_id)
	if user_id then
		return Distribution:user_from_id(user_id):username()
	end

	return Distribution:local_user():username()
end

function Steam:userid()
	return Distribution:local_user_id()
end

function Steam:is_local_account(user_id)
	return Distribution:user_from_id(user_id) == Distribution:local_user()
end

function Steam:user(user_id)
	return Distribution:user_from_id(user_id)
end

function Steam:friends()
	return Distribution:friends()
end

function Steam:coplay_friends()
	return Distribution:recently_played_with_friends()
end

function Steam:friend_avatar(size, user_id, callback)
	if size == Steam.SMALL_AVATAR then
		size = Distribution.ProfilePictureSize_Small
	elseif size == Steam.MEDIUM_AVATAR then
		size = Distribution.ProfilePictureSize_Medium
	elseif size == Steam.LARGE_AVATAR then
		size = Distribution.ProfilePictureSize_Large
	else
		return
	end

	local function wrapped_callback(texture, status, distribution_texture_handle)
		callback(texture)
	end

	return Distribution:request_user_profile_picture(size, user_id, wrapped_callback)
end

function Steam:create_ticket(intended_verifier)
	return DistributionMatchmaking:create_secure_ticket_for_peer(intended_verifier)
end

function Steam:destroy_ticket(user_id)
	return DistributionMatchmaking:destroy_secure_ticket_for_peer(user_id)
end

function Steam:begin_ticket_session(user_id, ticket, callback)
	return DistributionMatchmaking:begin_secure_ticket_session_for_peer(user_id, ticket, callback)
end

function Steam:end_ticket_session(user_id)
	return DistributionMatchmaking:end_secure_ticket_session_for_peer(user_id)
end

function Steam:change_ticket_callback(user_id, new_callback)
	return
end

function Steam:bind_steam_ticket_validate_callback()
	return
end

function Steam:create_lobby(callback, max_members, type)
	return DistributionMatchmaking:create_lobby(callback, max_members, type)
end

function Steam:join_lobby(lobby_id, callback)
	return DistributionMatchmaking:join_lobby(lobby_id, callback)
end

function Steam:set_played_with(user_id)
	return Distribution:set_played_with(user_id)
end

function Steam:lobby(lobby_id)
	Application:error("Steam:lobby( lobby_id ) called, DistributionMatchmaking unfortunately had to implement a breaking change to this interface, please call DistributionMatchmaking:lobby_from_id( lobby_id, from_server_browser, function(lobby, result, intended_lobby_id) ) instead!")

	return nil
end

function Steam:is_product_owned(app_id)
	return Distribution:is_product_owned(app_id)
end

function Steam:is_product_installed(app_id)
	return Distribution:is_product_installed(app_id)
end

function Steam:is_app_installed(app_id)
	return Distribution:is_app_installed(app_id)
end

function Steam:is_user_product_owned(user_id, app_id)
	return DistributionMatchmaking:does_peer_own_product(user_id, app_id)
end

function Steam:is_user_in_source(user, group)
	return true
end

function Steam:install_dlc()
	return
end

function Steam:uninstall_dlc()
	return
end

function Steam:inventory_load(callback)
	return Distribution:inventory():load_inventory_items(callback)
end

function Steam:inventory_reward(callback, def_id)
	return Distribution:inventory():reward_item_drop(def_id, callback)
end

function Steam:inventory_reward_promo(def_id, callback)
	return Distribution:inventory():reward_item_promo(def_id, callback)
end

function Steam:inventory_reward_open(instance_id, def_id, callback)
	return Distribution:inventory():exchange_items({
		instance_id
	}, def_id, callback)
end

function Steam:inventory_reward_unlock(safe_instance_id, drill_instance_id, generator_def_id, callback)
	return Distribution:inventory():exchange_items({
		safe_instance_id,
		drill_instance_id
	}, generator_def_id, callback)
end

function Steam:inventory_signature_create(instance_ids, callback)
	callback(false, "")
end

function Steam:inventory_signature_verify(steam_id, outfit, callback)
	callback(false, {})
end

function Steam:inventory_split_item(instance_id, callback)
	return Distribution:inventory():split_item_stack(instance_id, "", 1, callback)
end

function Steam:inventory_alter_stacks(source_instance_id, destination_instance_id, quantity, callback)
	return Distribution:inventory():split_item_stack(source_instance_id, destination_instance_id, quantity, callback)
end

function Steam:inventory_remove(instance_id)
	return
end

function Steam:set_rich_presence(key, value)
	Distribution:set_rich_presence(key, value)
end

function Steam:clear_rich_presence()
	Distribution:clear_rich_presence()
end

function Steam:set_connect_string(connect_string)
	Distribution:set_connect_string(connect_string)
end

function Steam:get_connect_string()
	return Distribution:connect_string()
end

function Steam:check_migration_status()
	return
end

function Steam:copy_file()
	return
end

function Steam:delete_cloud_file()
	return
end

function Steam:delete_cloud_linux()
	return
end

function Steam:delete_cloud_windows()
	return
end

function Steam:display_cloud_files()
	return
end

function Steam:gamepad_text_listener(callback)
	return
end

function Steam:overlay_set_position(position)
	return
end

function Steam:show_gamepad_text_input(input_mode, input_line_mode, description, char_max, existing_text)
	return
end

function Steam:usa_viewer(user_id)
	return
end

function Steam:request_listener(join_request_callback, server_join_request_callback)
	Distribution:set_join_callbacks(join_request_callback, server_join_request_callback)
end

function Steam:error_listener(disconnected_callback, ipc_fail_callback, connect_fail_callback)
	Distribution:set_error_callbacks(disconnected_callback)
end

function Steam:overlay_listener(open_overlay_callback, close_overlay_callback)
	Distribution:set_overlay_callbacks(open_overlay_callback, close_overlay_callback)
end

function Steam:set_playing(state)
	return
end

function Steam:overlay_open()
	return Distribution:overlay_open()
end

function Steam:overlay_enabled()
	return Distribution:overlay_available()
end

function Steam:overlay_activate(type, destination, extra_flags)
	if type == "invite" then
		type = "game"
		destination = "LobbyInvite"
	end

	return Distribution:open_overlay(type, destination, extra_flags)
end

function Steam:current_language()
	return Distribution:language()
end

function Steam:available_languages()
	return Distribution:available_languages()
end

function Steam:is_low_violence()
	return false
end

function Steam:ugc_handler()
	return getmetatable(Distribution).ugc and Distribution:ugc()
end

function Steam:sa_handler()
	local achievements = Distribution:achievements()

	shadow_class_instance_function(achievements, "set_achievement", "grant_achievement")
	shadow_class_instance_function(achievements, "clear_achievement", "remove_achievement")
	shadow_class_instance_function(achievements, "clear_achievement", "remove_achievement")
	shadow_class_instance_function(achievements, "friends_achievements_cache", "start_using_friends_achievements_cache")
	shadow_class_instance_function(achievements, "friends_achievements_clear", "stop_using_friends_achievements_cache")
	shadow_class_instance_function(achievements, "refresh_global_stats_cb", "refresh_global_stats_callback")

	getmetatable(achievements).initialized = function(self)
		return true
	end

	return achievements
end

function Steam:lb_handler()
	return Distribution:leaderboard()
end

function Steam:client_running()
	return true
end

function Steam:steam_texture(handle)
	return Distribution:distribution_texture(handle)
end

function Steam:clear_image_cache()
	Distribution:clear_distribution_texture_cache()
end

function Steam:voip_handler()
	return DistributionMatchmaking:voice_chat()
end

function Steam:server_time()
	return Distribution:server_time()
end

function Steam:http_request(url, callback, headers)
	local function new_callback(error_code, status_code, response_body)
		if status_code >= 200 and status_code <= 206 then
			callback(true, response_body)
		else
			callback(false)
		end
	end

	Distribution:make_http_request("GET", url, new_callback, headers)
end

function Steam:http_request_post(url, callback, content_type, body, body_size, headers)
	Distribution:make_http_request("POST", url, callback, headers, content_type, body, body_size)
end

function Steam:http_request_put(url, callback, content_type, body, body_size, headers)
	Distribution:make_http_request("PUT", url, callback, headers, content_type, body, body_size)
end

function LobbyBrowser(on_match_callback, on_update_callback)
	return DistributionMatchmaking:create_lobby_browser(on_match_callback, on_update_callback)
end

function __classes.SystemInfo:matchmaking_protocol()
	return DistributionMatchmaking:network_protocol()
end
