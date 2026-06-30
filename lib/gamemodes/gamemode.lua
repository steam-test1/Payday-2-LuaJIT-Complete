Gamemode = Gamemode or class()
Gamemode.id = "gamemode"
Gamemode._NAME = "Base Gamemode"
Gamemode.MAP = {}
Gamemode.STATES = {
	bootup = "bootup",
	disconnected = "disconnected",
	editor = "editor",
	empty = "empty",
	gameoverscreen = "gameoverscreen",
	ingame_access_camera = "ingame_access_camera",
	ingame_arrested = "ingame_arrested",
	ingame_bleed_out = "ingame_bleed_out",
	ingame_civilian = "ingame_civilian",
	ingame_clean = "ingame_clean",
	ingame_driving = "ingame_driving",
	ingame_electrified = "ingame_electrified",
	ingame_fatal = "ingame_fatal",
	ingame_freefall = "ingame_freefall",
	ingame_incapacitated = "ingame_incapacitated",
	ingame_lobby_menu = "ingame_lobby_menu",
	ingame_mask_off = "ingame_mask_off",
	ingame_parachuting = "ingame_parachuting",
	ingame_standard = "ingame_standard",
	ingame_waiting_for_players = "ingame_waiting_for_players",
	ingame_waiting_for_respawn = "ingame_waiting_for_respawn",
	ingame_waiting_for_spawn_allowed = "ingame_waiting_for_spawn_allowed",
	kicked = "kicked",
	menu_main = "menu_main",
	menu_titlescreen = "menu_titlescreen",
	server_left = "server_left",
	victoryscreen = "victoryscreen",
	world_camera = "world_camera"
}

function Gamemode.register(id, class)
	Gamemode.MAP[id] = class
end

function Gamemode:get_state(state_name)
	if self.STATES[state_name] then
		return self.STATES[state_name]
	else
		error(string.format("Invalid state '%s' in gamemode %s", tostring(state_name), self._NAME))
	end
end

function Gamemode:setup_gsm(gsm, empty, setup_boot, setup_title)
	error("Gamemode:setup_gsm not implemented for " .. self._NAME)
end
