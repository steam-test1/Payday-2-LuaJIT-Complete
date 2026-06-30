GameStateFilters = {
	any_ingame = {
		ingame_access_camera = true,
		ingame_arrested = true,
		ingame_bleed_out = true,
		ingame_civilian = true,
		ingame_clean = true,
		ingame_driving = true,
		ingame_electrified = true,
		ingame_fatal = true,
		ingame_freefall = true,
		ingame_incapacitated = true,
		ingame_mask_off = true,
		ingame_parachuting = true,
		ingame_standard = true,
		ingame_waiting_for_players = true,
		ingame_waiting_for_respawn = true,
		ingame_waiting_for_spawn_allowed = true
	},
	any_ingame_playing = {
		ingame_access_camera = true,
		ingame_arrested = true,
		ingame_bleed_out = true,
		ingame_civilian = true,
		ingame_clean = true,
		ingame_driving = true,
		ingame_electrified = true,
		ingame_fatal = true,
		ingame_freefall = true,
		ingame_incapacitated = true,
		ingame_mask_off = true,
		ingame_parachuting = true,
		ingame_standard = true,
		ingame_waiting_for_respawn = true,
		ingame_waiting_for_spawn_allowed = true
	},
	downed = {
		ingame_bleed_out = true,
		ingame_fatal = true,
		ingame_incapacitated = true
	},
	need_revive = {
		ingame_arrested = true,
		ingame_bleed_out = true,
		ingame_fatal = true,
		ingame_incapacitated = true
	},
	arrested = {
		ingame_arrested = true
	},
	game_over = {
		gameoverscreen = true
	},
	any_end_game = {
		gameoverscreen = true,
		victoryscreen = true
	},
	waiting_for_players = {
		ingame_waiting_for_players = true
	},
	waiting_for_respawn = {
		ingame_waiting_for_respawn = true
	},
	waiting_for_spawn_allowed = {
		ingame_waiting_for_spawn_allowed = true
	},
	menu = {
		menu_main = true
	},
	player_slot = {
		ingame_lobby_menu = true,
		ingame_waiting_for_players = true,
		menu_main = true
	},
	lobby = {
		ingame_lobby_menu = true,
		menu_main = true
	}
}
