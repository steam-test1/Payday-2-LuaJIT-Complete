NetworkVoiceChatDisabled = NetworkVoiceChatDisabled or class()

function NetworkVoiceChatDisabled:init(quiet)
	self._quiet = quiet or false

	if self._quiet then
		cat_print("lobby", "Voice is quiet.")
	else
		cat_print("lobby", "Voice is disabled.")
	end
end

function NetworkVoiceChatDisabled:check_status_information()
	return
end

function NetworkVoiceChatDisabled:open()
	return
end

function NetworkVoiceChatDisabled:set_volume(volume)
	return
end

function NetworkVoiceChatDisabled:voice_type()
	if self._quiet == true then
		return "voice_quiet"
	else
		return "voice_disabled"
	end
end

function NetworkVoiceChatDisabled:set_drop_in(data)
	return
end

function NetworkVoiceChatDisabled:pause()
	return
end

function NetworkVoiceChatDisabled:resume()
	return
end

function NetworkVoiceChatDisabled:init_voice()
	return
end

function NetworkVoiceChatDisabled:destroy_voice()
	return
end

function NetworkVoiceChatDisabled:num_peers()
	return true
end

function NetworkVoiceChatDisabled:open_session(roomid)
	return
end

function NetworkVoiceChatDisabled:close_session()
	return
end

function NetworkVoiceChatDisabled:open_channel_to(player_info, context)
	return
end

function NetworkVoiceChatDisabled:close_channel_to(player_info)
	return
end

function NetworkVoiceChatDisabled:lost_peer(peer)
	return
end

function NetworkVoiceChatDisabled:close_all()
	return
end

function NetworkVoiceChatDisabled:set_team(team)
	return
end

function NetworkVoiceChatDisabled:peer_team(xuid, team, rpc)
	return
end

function NetworkVoiceChatDisabled:enabled()
	return
end

function NetworkVoiceChatDisabled:set_recording()
	return
end

function NetworkVoiceChatDisabled:on_member_added()
	return
end

function NetworkVoiceChatDisabled:on_member_removed()
	return
end

function NetworkVoiceChatDisabled:is_muted()
	return
end

function NetworkVoiceChatDisabled:_open_close_peers()
	return
end

function NetworkVoiceChatDisabled:mute_player(mute, peer)
	return
end

function NetworkVoiceChatDisabled:update()
	return
end

function NetworkVoiceChatDisabled:_load_globals()
	return
end

function NetworkVoiceChatDisabled:_save_globals(disable_voice)
	return
end

function NetworkVoiceChatDisabled:_display_warning()
	if self._quiet == false and self:_have_displayed_warning() == true then
		managers.menu:show_err_no_chat_parental_control()
	end
end

function NetworkVoiceChatDisabled:_have_displayed_warning()
	if Global.psn_parental_voice and Global.psn_parental_voice == true then
		return false
	end

	Global.psn_parental_voice = true

	return true
end

function NetworkVoiceChatDisabled:clear_team()
	return
end

function NetworkVoiceChatDisabled:psn_session_destroyed()
	if Global.psn and Global.psn.voice then
		Global.psn.voice.restart = nil
	end
end
