require("lib/tweak_data/WeaponTweakData")
require("lib/tweak_data/EquipmentsTweakData")
require("lib/tweak_data/CharacterTweakData")
require("lib/tweak_data/PlayerTweakData")
require("lib/tweak_data/StatisticsTweakData")
require("lib/tweak_data/LevelsTweakData")
require("lib/tweak_data/GroupAITweakData")
require("lib/tweak_data/DramaTweakData")
require("lib/tweak_data/UpgradesTweakData")
require("lib/tweak_data/UpgradesVisualTweakData")
require("lib/tweak_data/HudIconsTweakData")
require("lib/tweak_data/TipsTweakData")
require("lib/tweak_data/BlackMarketTweakData")
require("lib/tweak_data/CarryTweakData")
require("lib/tweak_data/MissionDoorTweakData")
require("lib/tweak_data/AttentionTweakData")
require("lib/tweak_data/NarrativeTweakData")
require("lib/tweak_data/SkillTreeTweakData")
require("lib/tweak_data/TimeSpeedEffectTweakData")
require("lib/tweak_data/SoundTweakData")
require("lib/tweak_data/LootDropTweakData")
require("lib/tweak_data/GuiTweakData")
require("lib/tweak_data/MoneyTweakData")
require("lib/tweak_data/AssetsTweakData")
require("lib/tweak_data/DLCTweakData")
require("lib/tweak_data/InfamyNewTweakData")
require("lib/tweak_data/GageAssignmentTweakData")
require("lib/tweak_data/PrePlanningTweakData")
require("lib/tweak_data/InteractionTweakData")
require("lib/tweak_data/VehicleTweakData")
require("lib/tweak_data/EconomyTweakData")
require("lib/tweak_data/VanSkinsTweakData")
require("lib/tweak_data/EnvEffectTweakData")
require("lib/tweak_data/AchievementsTweakData")
require("lib/tweak_data/CustomSafehouseTweakData")
require("lib/tweak_data/TangoTweakData")
require("lib/tweak_data/SubtitleTweakData")
require("lib/tweak_data/InputTweakData")
require("lib/tweak_data/ArmorSkinsTweakData")
require("lib/tweak_data/CrimeSpreeTweakData")
require("lib/tweak_data/FireTweakData")
require("lib/tweak_data/DOTTweakData")
require("lib/tweak_data/NetworkTweakData")
require("lib/tweak_data/AnimationTweakData")
require("lib/tweak_data/StoryMissionsTweakData")
require("lib/tweak_data/PromotionalMenusTweakData")
require("lib/tweak_data/PromoUnlocksTweakData")
require("lib/tweak_data/RaidJobsTweakData")
require("lib/tweak_data/EventJobsTweakData")
require("lib/tweak_data/MutatorTweakData")
require("lib/tweak_data/TweakDataVR")
require("lib/tweak_data/SkirmishTweakData")

TweakData = TweakData or class()

function TweakData:_init_wip_tweak_data()
	return
end

function TweakData:_init_wip_blackmarket(tweak_data)
	return
end

function TweakData:_init_wip_levels()
	return
end

function TweakData:_init_wip_narrative()
	return
end

function TweakData:_init_wip_assets(tweak_data)
	return
end

function TweakData:_init_wip_weapon_factory(tweak_data)
	return
end

function TweakData:_init_wip_skilltree()
	return
end

function TweakData:_init_wip_upgrades()
	return
end

function TweakData:_init_wip_economy()
	return
end

require("lib/tweak_data/TweakDataPD2")

TweakData.RELOAD = true

function TweakData:digest_tweak_data()
	Application:debug("TweakData: Digesting tweak_data. <('O'<)")

	self.digested_tables = {
		"money_manager",
		"experience_manager",
		"casino"
	}

	for i, digest_me in ipairs(self.digested_tables) do
		self:digest_recursive(self[digest_me])
	end
end

function TweakData:digest_recursive(key, parent)
	local value = parent and parent[key] or key

	if type(value) == "table" then
		for index, data in pairs(value) do
			self:digest_recursive(index, value)
		end
	elseif type(value) == "number" then
		parent[key] = Application:digest_value(value, true)
	end
end

function TweakData:get_value(...)
	local arg = {
		...
	}
	local value = self

	for _, v in ipairs(arg) do
		if not value[v] then
			return false
		end

		value = value[v]
	end

	if type(value) == "string" then
		return Application:digest_value(value, false)
	elseif type(value) == "table" then
		Application:debug("TweakData:get_value() value was a table, is this correct? returning false!", inspect(arg), inspect(value))

		return false
	end

	return value
end

function TweakData:get_raw_value(...)
	local arg = {
		...
	}
	local value = self
	local v

	for i = 1, #arg do
		v = arg[i]

		if not value[v] then
			return nil, v, i
		end

		value = value[v]
	end

	return value
end

function TweakData:get_mutatable_value(id, ...)
	local value = self:get_raw_value(...)

	managers.mutators:modify_tweak_data(id, value)

	return value
end

function TweakData:set_mode()
	if not Global.game_settings then
		return
	end

	if Global.game_settings.single_player then
		self:_set_singleplayer()
	else
		self:_set_multiplayer()
	end
end

function TweakData:_set_singleplayer()
	self.player:_set_singleplayer()
end

function TweakData:_set_multiplayer()
	self.player:_set_multiplayer()
end

function TweakData:set_difficulty()
	if not Global.game_settings then
		return
	end

	if Global.game_settings.difficulty == "easy" then
		self:_set_easy()
	elseif Global.game_settings.difficulty == "normal" then
		self:_set_normal()
	elseif Global.game_settings.difficulty == "overkill" then
		self:_set_overkill()
	elseif Global.game_settings.difficulty == "overkill_145" then
		self:_set_overkill_145()
	elseif Global.game_settings.difficulty == "easy_wish" then
		self:_set_easy_wish()
	elseif Global.game_settings.difficulty == "overkill_290" then
		self:_set_overkill_290()
	elseif Global.game_settings.difficulty == "sm_wish" then
		self:_set_sm_wish()
	else
		self:_set_hard()
	end
end

function TweakData:_set_easy()
	self.player:_set_easy()
	self.character:_set_easy()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_easy()

	self.experience_manager.civilians_killed = 15
	self.difficulty_name_id = self.difficulty_name_ids.easy
	self.experience_manager.total_level_objectives = 1000
	self.experience_manager.total_criminals_finished = 25
	self.experience_manager.total_objectives_finished = 750
end

function TweakData:_set_normal()
	self.player:_set_normal()
	self.character:_set_normal()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_normal()

	self.experience_manager.civilians_killed = 35
	self.difficulty_name_id = self.difficulty_name_ids.normal
	self.experience_manager.total_level_objectives = 2000
	self.experience_manager.total_criminals_finished = 50
	self.experience_manager.total_objectives_finished = 1000
end

function TweakData:_set_hard()
	self.player:_set_hard()
	self.character:_set_hard()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_hard()

	self.experience_manager.civilians_killed = 75
	self.difficulty_name_id = self.difficulty_name_ids.hard
	self.experience_manager.total_level_objectives = 2500
	self.experience_manager.total_criminals_finished = 150
	self.experience_manager.total_objectives_finished = 1500
end

function TweakData:_set_overkill()
	self.player:_set_overkill()
	self.character:_set_overkill()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_overkill()

	self.experience_manager.civilians_killed = 150
	self.difficulty_name_id = self.difficulty_name_ids.overkill
	self.experience_manager.total_level_objectives = 5000
	self.experience_manager.total_criminals_finished = 500
	self.experience_manager.total_objectives_finished = 3000
end

function TweakData:_set_overkill_145()
	self.player:_set_overkill_145()
	self.character:_set_overkill_145()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_overkill_145()

	self.experience_manager.civilians_killed = 550
	self.difficulty_name_id = self.difficulty_name_ids.overkill_145
	self.experience_manager.total_level_objectives = 5000
	self.experience_manager.total_criminals_finished = 2000
	self.experience_manager.total_objectives_finished = 3000
end

function TweakData:_set_easy_wish()
	self.player:_set_easy_wish()
	self.character:_set_easy_wish()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_easy_wish()

	self.experience_manager.civilians_killed = 10000
	self.difficulty_name_id = self.difficulty_name_ids.easy_wish
	self.experience_manager.total_level_objectives = 5000
	self.experience_manager.total_criminals_finished = 2000
	self.experience_manager.total_objectives_finished = 3000
end

function TweakData:_set_overkill_290()
	self.player:_set_overkill_290()
	self.character:_set_overkill_290()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_overkill_290()

	self.experience_manager.civilians_killed = 10000
	self.difficulty_name_id = self.difficulty_name_ids.overkill_290
	self.experience_manager.total_level_objectives = 5000
	self.experience_manager.total_criminals_finished = 2000
	self.experience_manager.total_objectives_finished = 3000
end

function TweakData:_set_sm_wish()
	self.player:_set_sm_wish()
	self.character:_set_sm_wish()
	self.money_manager:init(self)
	self.group_ai:init(self)
	self.weapon:_set_sm_wish()

	self.experience_manager.civilians_killed = 10000
	self.difficulty_name_id = self.difficulty_name_ids.sm_wish
	self.experience_manager.total_level_objectives = 5000
	self.experience_manager.total_criminals_finished = 2000
	self.experience_manager.total_objectives_finished = 3000
end

function TweakData:difficulty_to_index(difficulty)
	return table.index_of(self.difficulties, difficulty)
end

function TweakData:index_to_difficulty(index)
	return self.difficulties[index]
end

function TweakData:permission_to_index(permission)
	return table.index_of(self.permissions, permission)
end

function TweakData:index_to_permission(index)
	return self.permissions[index]
end

function TweakData:server_state_to_index(state)
	return table.index_of(self.server_states, state)
end

function TweakData:index_to_server_state(index)
	return self.server_states[index]
end

function TweakData:menu_sync_state_to_index(state)
	if not state then
		return false
	end

	for i, menu_sync in ipairs(self.menu_sync_states) do
		if menu_sync == state then
			return i
		end
	end
end

function TweakData:index_to_menu_sync_state(index)
	return self.menu_sync_states[index]
end

function TweakData:init()
	self.max_players = 4
	self.difficulties = {
		"easy",
		"normal",
		"hard",
		"overkill",
		"overkill_145",
		"easy_wish",
		"overkill_290",
		"sm_wish"
	}
	self.difficulty_level_locks = {
		0,
		0,
		0,
		0,
		0,
		0,
		80,
		80
	}
	self.difficulty_name_ids = {}
	self.difficulty_name_ids.easy = "menu_difficulty_easy"
	self.difficulty_name_ids.normal = "menu_difficulty_normal"
	self.difficulty_name_ids.hard = "menu_difficulty_hard"
	self.difficulty_name_ids.overkill = "menu_difficulty_very_hard"
	self.difficulty_name_ids.overkill_145 = "menu_difficulty_overkill"
	self.difficulty_name_ids.easy_wish = "menu_difficulty_easy_wish"
	self.difficulty_name_ids.overkill_290 = "menu_difficulty_apocalypse"
	self.difficulty_name_ids.sm_wish = "menu_difficulty_sm_wish"
	self.permissions = {
		"public",
		"friends_only",
		"private",
		"invisible"
	}
	self.server_states = {
		"in_lobby",
		"loading",
		"briefing",
		"in_game"
	}
	self.menu_sync_states = {
		"crimenet",
		"skilltree",
		"options",
		"lobby",
		"blackmarket",
		"blackmarket_weapon",
		"blackmarket_mask",
		"payday",
		"custom_safehouse"
	}
	self.criminals = {}
	self.criminals.characters = {
		{
			name = "russian",
			order = 1,
			static_data = {
				ai_character_id = "ai_dallas",
				ai_mask_id = "dallas",
				ssuffix = "a",
				voice = "rb4"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "german",
			order = 2,
			static_data = {
				ai_character_id = "ai_wolf",
				ai_mask_id = "wolf",
				ssuffix = "c",
				voice = "rb3"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "spanish",
			order = 3,
			static_data = {
				ai_character_id = "ai_chains",
				ai_mask_id = "chains",
				ssuffix = "b",
				voice = "rb1"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "american",
			order = 4,
			static_data = {
				ai_character_id = "ai_hoxton",
				ai_mask_id = "hoxton",
				ssuffix = "l",
				voice = "rb2"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "jowi",
			order = 5,
			static_data = {
				ai_character_id = "ai_jowi",
				ai_mask_id = "jw_shades",
				ssuffix = "m",
				voice = "rb6"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "old_hoxton",
			order = 6,
			static_data = {
				ai_character_id = "ai_old_hoxton",
				ai_mask_id = "old_hoxton",
				ssuffix = "d",
				voice = "rb5"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "female_1",
			order = 7,
			static_data = {
				ai_character_id = "ai_female_1",
				ai_mask_id = "msk_grizel",
				ssuffix = "n",
				voice = "rb7"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "dragan",
			order = 8,
			static_data = {
				ai_character_id = "ai_dragan",
				ai_mask_id = "dragan",
				ssuffix = "o",
				voice = "rb8"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "jacket",
			order = 9,
			static_data = {
				ai_character_id = "ai_jacket",
				ai_mask_id = "richard_returns",
				ssuffix = "p",
				voice = "rb9"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "bonnie",
			order = 10,
			static_data = {
				ai_character_id = "ai_bonnie",
				ai_mask_id = "bonnie",
				ssuffix = "q",
				voice = "rb10"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "sokol",
			order = 11,
			static_data = {
				ai_character_id = "ai_sokol",
				ai_mask_id = "sokol",
				ssuffix = "r",
				voice = "rb11"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "dragon",
			order = 12,
			static_data = {
				ai_character_id = "ai_dragon",
				ai_mask_id = "jiro",
				ssuffix = "s",
				voice = "rb12"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "bodhi",
			order = 13,
			static_data = {
				ai_character_id = "ai_bodhi",
				ai_mask_id = "bodhi",
				ssuffix = "t",
				voice = "rb13"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "jimmy",
			order = 14,
			static_data = {
				ai_character_id = "ai_jimmy",
				ai_mask_id = "jimmy_duct",
				ssuffix = "u",
				voice = "rb14"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "sydney",
			order = 15,
			static_data = {
				ai_character_id = "ai_sydney",
				ai_mask_id = "sydney",
				ssuffix = "v",
				voice = "rb15"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "wild",
			order = 16,
			static_data = {
				ai_character_id = "ai_wild",
				ai_mask_id = "rust",
				ssuffix = "w",
				voice = "rb16"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "chico",
			order = 17,
			static_data = {
				ai_character_id = "ai_chico",
				ai_mask_id = "chc_terry",
				ssuffix = "x",
				voice = "rb17"
			},
			body_g_object = Idstring("g_body_terry")
		},
		{
			name = "max",
			order = 18,
			static_data = {
				ai_character_id = "ai_max",
				ai_mask_id = "max",
				ssuffix = "y",
				voice = "rb18"
			},
			body_g_object = Idstring("g_body_max")
		},
		{
			name = "joy",
			order = 19,
			static_data = {
				ai_character_id = "ai_joy",
				ai_mask_id = "joy",
				ssuffix = "z",
				voice = "rb19"
			},
			body_g_object = Idstring("g_body")
		},
		{
			name = "myh",
			order = 20,
			static_data = {
				ai_character_id = "ai_myh",
				ai_mask_id = "myh",
				ssuffix = "ac",
				voice = "rb22"
			},
			body_g_object = Idstring("g_body_myh")
		},
		{
			name = "ecp_male",
			order = 21,
			static_data = {
				ai_character_id = "ai_ecp_male",
				ai_mask_id = "ecp_male",
				ssuffix = "aa",
				voice = "rb20"
			},
			body_g_object = Idstring("g_body_ecp_male")
		},
		{
			name = "ecp_female",
			order = 22,
			static_data = {
				ai_character_id = "ai_ecp_female",
				ai_mask_id = "ecp_female",
				ssuffix = "ab",
				voice = "rb21"
			},
			body_g_object = Idstring("g_body_ecp_female")
		}
	}
	self.criminals.character_names = {}

	table.sort(self.criminals.characters, function(a, b)
		return a.order < b.order
	end)

	for _, character in ipairs(self.criminals.characters) do
		table.insert(self.criminals.character_names, character.name)
	end

	self:init_screen_colors()
	self:init_accessibility_colors()

	self.hud_icons = HudIconsTweakData:new()
	self.weapon = WeaponTweakData:new(self)
	self.weapon_akimbo_mappings = self.weapon:get_akimbo_mappings()
	self.weapon_npc_mappings = self.weapon:get_npc_mappings()
	self.weapons_by_category = {}

	for weapon, data in pairs(self.weapon) do
		if data.autohit then
			for _, cat in ipairs(data.categories or {}) do
				self.weapons_by_category[cat] = self.weapons_by_category[cat] or {}

				table.insert(self.weapons_by_category[cat], weapon)
			end
		end
	end

	for cat, data in pairs(self.weapons_by_category) do
		table.sort(data)
	end

	do
		local weapon_tweak_meta = {
			__index = function(table, key)
				if key == "category" then
					local categories = rawget(table, "categories")

					return categories and categories[1]
				elseif key == "sub_category" then
					local categories = rawget(table, "categories")

					return categories and categories[2]
				end
			end
		}

		for key, table in pairs(self.weapon) do
			if not getmetatable(table) then
				table.category = nil
				table.sub_category = nil

				setmetatable(table, weapon_tweak_meta)
			end
		end
	end

	self.equipments = EquipmentsTweakData:new()
	self.player = PlayerTweakData:new()
	self.levels = LevelsTweakData:new()

	self._init_wip_levels(self.levels)

	self.character = CharacterTweakData:new(self)
	self.statistics = StatisticsTweakData:new()
	self.narrative = NarrativeTweakData:new(self)

	self._init_wip_narrative(self.narrative)

	self.group_ai = GroupAITweakData:new(self)
	self.drama = DramaTweakData:new()
	self.upgrades = UpgradesTweakData:new(self)

	self._init_wip_upgrades(self.upgrades)

	self.skilltree = SkillTreeTweakData:new()

	self._init_wip_skilltree(self.skilltree)

	self.upgrades.visual = UpgradesVisualTweakData:new()
	self.tips = TipsTweakData:new()
	self.money_manager = MoneyTweakData:new(self)
	self.blackmarket = BlackMarketTweakData:new(self)

	self._init_wip_blackmarket(self.blackmarket, self)

	self.carry = CarryTweakData:new(self)
	self.mission_door = MissionDoorTweakData:new()
	self.attention = AttentionTweakData:new()
	self.timespeed = TimeSpeedEffectTweakData:new()
	self.sound = SoundTweakData:new()
	self.lootdrop = LootDropTweakData:new(self)
	self.gui = GuiTweakData:new(self)
	self.assets = AssetsTweakData:new(self)

	self._init_wip_assets(self.assets, self)

	self.dlc = DLCTweakData:new(self)
	self.infamy = InfamyTweakData:new(self)
	self.gage_assignment = GageAssignmentTweakData:new(self)
	self.preplanning = PrePlanningTweakData:new(self)
	self.safehouse = CustomSafehouseTweakData:new(self)
	self.interaction = InteractionTweakData:new(self)
	self.vehicle = VehicleTweakData:new(self)
	self.economy = EconomyTweakData:new(self)

	self._init_wip_economy(self.economy, self)

	self.achievement = AchievementsTweakData:new(self)
	self.van = VanSkinsTweakData:new(self)
	self.env_effect = EnvEffectTweakData:new()
	self.tango = TangoTweakData:new(self)
	self.subtitles = SubtitleTweakData:new(self)
	self.input = InputTweakData:new(self)
	self.crime_spree = CrimeSpreeTweakData:new(self)
	self.fire = FireTweakData:new(self)
	self.dot = DOTTweakData:new(self)
	self.network = NetworkTweakData:new(self)
	self.animation = AnimationTweakData:new(self)
	self.story = StoryMissionsTweakData:new(self)
	self.promo_unlocks = PromoUnlocksTweakData:new(self)
	self.raid_jobs = RaidJobsTweakData:new(self)
	self.mutators = MutatorTweakData:new(self)
	self.event_jobs = EventJobsTweakData:new(self)

	self.blackmarket:build_player_style_list(self)
	self.blackmarket:build_glove_list(self)

	self.ai_carry = {}
	self.ai_carry.throw_distance = 500
	self.ai_carry.throw_force = 100
	self.ai_carry.revive_distance_autopickup = 300
	self.ai_carry.death_distance_teleport = 300
	self.custom_colors = {}
	self.custom_colors.defaults = {}
	self.custom_colors.defaults.flashlight = Color(1, 1, 1)
	self.custom_colors.defaults.laser = Color(0, 0.4, 0)
	self.custom_colors.defaults.laser_alpha = 0.5
	self.EFFECT_QUALITY = 0.5

	self:set_scale()
	self:_init_pd2()

	self.menu_themes = {
		old = {
			background = "guis/textures/menu/old_theme/background",
			bg_assault = "guis/textures/menu/old_theme/bg_assault",
			bg_chains = "guis/textures/menu/old_theme/bg_chains",
			bg_challenge = "guis/textures/menu/old_theme/bg_challenge",
			bg_creategame = "guis/textures/menu/old_theme/bg_creategame",
			bg_dallas = "guis/textures/menu/old_theme/bg_dallas",
			bg_dlc = "guis/textures/menu/old_theme/bg_dlc",
			bg_hoxton = "guis/textures/menu/old_theme/bg_hoxton",
			bg_lobby_fullteam = "guis/textures/menu/old_theme/bg_lobby_fullteam",
			bg_options = "guis/textures/menu/old_theme/bg_options",
			bg_setupgame = "guis/textures/menu/old_theme/bg_setupgame",
			bg_sharpshooter = "guis/textures/menu/old_theme/bg_sharpshooter",
			bg_startscreen = "guis/textures/menu/old_theme/bg_startscreen",
			bg_stats = "guis/textures/menu/old_theme/bg_stats",
			bg_support = "guis/textures/menu/old_theme/bg_support",
			bg_technician = "guis/textures/menu/old_theme/bg_technician",
			bg_upgrades = "guis/textures/menu/old_theme/bg_upgrades",
			bg_wolf = "guis/textures/menu/old_theme/bg_wolf"
		},
		fire = {
			background = "guis/textures/menu/fire_theme/background",
			bg_assault = "guis/textures/menu/fire_theme/bg_assault",
			bg_chains = "guis/textures/menu/fire_theme/bg_chains",
			bg_challenge = "guis/textures/menu/fire_theme/bg_challenge",
			bg_creategame = "guis/textures/menu/fire_theme/bg_creategame",
			bg_dallas = "guis/textures/menu/fire_theme/bg_dallas",
			bg_dlc = "guis/textures/menu/fire_theme/bg_dlc",
			bg_hoxton = "guis/textures/menu/fire_theme/bg_hoxton",
			bg_lobby_fullteam = "guis/textures/menu/fire_theme/bg_lobby_fullteam",
			bg_options = "guis/textures/menu/fire_theme/bg_options",
			bg_setupgame = "guis/textures/menu/fire_theme/bg_setupgame",
			bg_sharpshooter = "guis/textures/menu/fire_theme/bg_sharpshooter",
			bg_startscreen = "guis/textures/menu/fire_theme/bg_startscreen",
			bg_stats = "guis/textures/menu/fire_theme/bg_stats",
			bg_support = "guis/textures/menu/fire_theme/bg_support",
			bg_technician = "guis/textures/menu/fire_theme/bg_technician",
			bg_upgrades = "guis/textures/menu/fire_theme/bg_upgrades",
			bg_wolf = "guis/textures/menu/fire_theme/bg_wolf"
		},
		zombie = {
			background = "guis/textures/menu/zombie_theme/background",
			bg_assault = "guis/textures/menu/zombie_theme/bg_assault",
			bg_chains = "guis/textures/menu/zombie_theme/bg_chains",
			bg_challenge = "guis/textures/menu/zombie_theme/bg_challenge",
			bg_creategame = "guis/textures/menu/zombie_theme/bg_creategame",
			bg_dallas = "guis/textures/menu/zombie_theme/bg_dallas",
			bg_dlc = "guis/textures/menu/fire_theme/bg_dlc",
			bg_hoxton = "guis/textures/menu/zombie_theme/bg_hoxton",
			bg_lobby_fullteam = "guis/textures/menu/zombie_theme/bg_lobby_fullteam",
			bg_options = "guis/textures/menu/zombie_theme/bg_options",
			bg_setupgame = "guis/textures/menu/zombie_theme/bg_setupgame",
			bg_sharpshooter = "guis/textures/menu/zombie_theme/bg_sharpshooter",
			bg_startscreen = "guis/textures/menu/zombie_theme/bg_startscreen",
			bg_stats = "guis/textures/menu/zombie_theme/bg_stats",
			bg_support = "guis/textures/menu/zombie_theme/bg_support",
			bg_technician = "guis/textures/menu/zombie_theme/bg_technician",
			bg_upgrades = "guis/textures/menu/zombie_theme/bg_upgrades",
			bg_wolf = "guis/textures/menu/zombie_theme/bg_wolf"
		}
	}
	self.states = {}
	self.states.title = {}
	self.states.title.ATTRACT_VIDEO_DELAY = 90
	self.menu = {}
	self.menu.BRIGHTNESS_CHANGE = 0.05
	self.menu.MIN_BRIGHTNESS = 0.5
	self.menu.MAX_BRIGHTNESS = 1.5
	self.menu.MUSIC_CHANGE = 5
	self.menu.MIN_MUSIC_VOLUME = 0
	self.menu.MAX_MUSIC_VOLUME = 100
	self.menu.SFX_CHANGE = 5
	self.menu.MIN_SFX_VOLUME = 0
	self.menu.MAX_SFX_VOLUME = 100
	self.menu.VOICE_CHANGE = 0.05
	self.menu.MIN_VOICE_VOLUME = 0
	self.menu.MAX_VOICE_VOLUME = 1

	self:set_menu_scale()

	local green = Vector3(194, 252, 151) / 255
	local blue = Vector3(120, 183, 204) / 255
	local brown = Vector3(178, 104, 89) / 255
	local orange = Vector3(204, 161, 102) / 255
	local team_ai = Vector3(0.2, 0.8, 1)

	self.peer_vector_colors = {
		green,
		blue,
		brown,
		orange,
		team_ai
	}
	self.peer_colors = {
		"mrgreen",
		"mrblue",
		"mrbrown",
		"mrorange",
		"mrai"
	}
	self.system_chat_color = Color(255, 255, 212, 0) / 255
	self.chat_colors = {
		Color(self.peer_vector_colors[1]:unpack()),
		Color(self.peer_vector_colors[2]:unpack()),
		Color(self.peer_vector_colors[3]:unpack()),
		Color(self.peer_vector_colors[4]:unpack()),
		Color(self.peer_vector_colors[5]:unpack())
	}
	self.preplanning_peer_colors = {
		Color("ff82991e"),
		Color("ff0055ff"),
		Color("ffff7800"),
		Color("ffffff00")
	}

	self:_setup_access_cameras()

	self.dialog = {}
	self.dialog.WIDTH = 400
	self.dialog.HEIGHT = 300
	self.dialog.PADDING = 30
	self.dialog.BUTTON_PADDING = 5
	self.dialog.BUTTON_SPACING = 10
	self.dialog.FONT = self.menu.default_font
	self.dialog.BG_COLOR = self.menu.default_menu_background_color
	self.dialog.TITLE_TEXT_COLOR = Color(1, 1, 1, 1)
	self.dialog.TEXT_COLOR = self.menu.default_font_row_item_color
	self.dialog.BUTTON_BG_COLOR = Color(0, 0.5, 0.5, 0.5)
	self.dialog.BUTTON_TEXT_COLOR = self.menu.default_font_row_item_color
	self.dialog.SELECTED_BUTTON_BG_COLOR = self.menu.default_font_row_item_color
	self.dialog.SELECTED_BUTTON_TEXT_COLOR = self.menu.default_hightlight_row_item_color
	self.dialog.TITLE_SIZE = self.menu.topic_font_size
	self.dialog.TEXT_SIZE = self.menu.dialog_text_font_size
	self.dialog.BUTTON_SIZE = self.menu.dialog_title_font_size
	self.dialog.TITLE_TEXT_SPACING = 20
	self.dialog.BUTTON_TEXT_SPACING = 3
	self.dialog.DEFAULT_PRIORITY = 1
	self.dialog.MINIMUM_DURATION = 2
	self.dialog.DURATION_PER_CHAR = 0.07
	self.hud = {}

	self:set_hud_values()

	self.gui = self.gui or {}
	self.gui.BOOT_SCREEN_LAYER = 1
	self.gui.TITLE_SCREEN_LAYER = 1
	self.gui.MENU_LAYER = 200
	self.gui.MENU_COMPONENT_LAYER = 300
	self.gui.ATTRACT_SCREEN_LAYER = 400
	self.gui.LOADING_SCREEN_LAYER = 1000
	self.gui.CRIMENET_CHAT_LAYER = 1000
	self.gui.DIALOG_LAYER = 1100
	self.gui.MOUSE_LAYER = 1200
	self.gui.SAVEFILE_LAYER = 1400
	self.color_grading = {
		{
			text_id = "menu_color_off",
			value = "color_payday"
		},
		{
			text_id = "menu_color_default"
		},
		{
			text_id = "menu_color_heat",
			value = "color_heat"
		},
		{
			text_id = "menu_color_nice",
			value = "color_nice"
		},
		{
			text_id = "menu_color_bhd",
			value = "color_bhd"
		},
		{
			text_id = "menu_color_xgen",
			value = "color_xgen"
		},
		{
			text_id = "menu_color_xxxgen",
			value = "color_xxxgen"
		},
		{
			text_id = "menu_color_matrix_classic",
			value = "color_matrix_classic"
		},
		{
			text_id = "menu_color_sin_classic",
			value = "color_sin_classic"
		},
		{
			text_id = "menu_color_sepia",
			value = "color_sepia"
		},
		{
			text_id = "menu_color_sunsetstrip",
			value = "color_sunsetstrip"
		},
		{
			text_id = "menu_color_colorful",
			value = "color_colorful"
		},
		{
			text_id = "menu_color_madplanet",
			value = "color_madplanet"
		}
	}
	self.overlay_effects = {}
	self.overlay_effects.spectator = {
		blend_mode = "normal",
		fade_in = 3,
		fade_out = 2,
		play_paused = true,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main()
	}
	self.overlay_effects.level_fade_in = {
		blend_mode = "normal",
		fade_in = 0,
		fade_out = 3,
		play_paused = true,
		sustain = 1,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:game()
	}
	self.overlay_effects.fade_in = {
		blend_mode = "normal",
		fade_in = 0,
		fade_out = 3,
		play_paused = true,
		sustain = 0,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main()
	}
	self.overlay_effects.fade_out = {
		blend_mode = "normal",
		fade_in = 3,
		fade_out = 0,
		play_paused = true,
		sustain = 30,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main()
	}
	self.overlay_effects.fade_out_permanent = {
		blend_mode = "normal",
		fade_in = 1,
		fade_out = 0,
		play_paused = true,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main()
	}
	self.overlay_effects.fade_out_in = {
		blend_mode = "normal",
		fade_in = 1,
		fade_out = 1,
		play_paused = true,
		sustain = 1,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main()
	}
	self.overlay_effects.white_fade_in = {
		blend_mode = "add",
		fade_in = 0,
		fade_out = 3,
		play_paused = true,
		sustain = 0,
		color = Color(1, 1, 1, 1),
		timer = TimerManager:main()
	}
	self.overlay_effects.white_fade_out = {
		blend_mode = "add",
		fade_in = 3,
		fade_out = 0,
		play_paused = true,
		sustain = 30,
		color = Color(1, 1, 1, 1),
		timer = TimerManager:main()
	}
	self.overlay_effects.white_fade_out_permanent = {
		blend_mode = "add",
		fade_in = 1,
		fade_out = 0,
		play_paused = true,
		color = Color(1, 1, 1, 1),
		timer = TimerManager:main()
	}
	self.overlay_effects.white_fade_out_in = {
		blend_mode = "add",
		fade_in = 1,
		fade_out = 1,
		play_paused = true,
		sustain = 1,
		color = Color(1, 1, 1, 1),
		timer = TimerManager:main()
	}
	self.overlay_effects.element_fade_in = {
		blend_mode = "normal",
		fade_in = 0,
		fade_out = 3,
		play_paused = true,
		sustain = 0,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main()
	}
	self.overlay_effects.element_fade_out = {
		blend_mode = "normal",
		fade_in = 3,
		fade_out = 0,
		play_paused = true,
		sustain = 0,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main()
	}

	local d_color = Color(0.75, 1, 1, 1)
	local d_sustain = 0.1
	local d_fade_out = 0.9

	self.overlay_effects.damage = {
		blend_mode = "add",
		fade_in = 0,
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color
	}
	self.overlay_effects.damage_left = {
		blend_mode = "add",
		fade_in = 0,
		orientation = "horizontal",
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			0,
			d_color,
			0.1,
			d_color,
			0.15,
			Color():with_alpha(0),
			1,
			Color():with_alpha(0)
		}
	}
	self.overlay_effects.damage_right = {
		blend_mode = "add",
		fade_in = 0,
		orientation = "horizontal",
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			1,
			d_color,
			0.9,
			d_color,
			0.85,
			Color():with_alpha(0),
			0,
			Color():with_alpha(0)
		}
	}
	self.overlay_effects.damage_up = {
		blend_mode = "add",
		fade_in = 0,
		orientation = "vertical",
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			0,
			d_color,
			0.1,
			d_color,
			0.15,
			Color():with_alpha(0),
			1,
			Color():with_alpha(0)
		}
	}
	self.overlay_effects.damage_down = {
		blend_mode = "add",
		fade_in = 0,
		orientation = "vertical",
		sustain = d_sustain,
		fade_out = d_fade_out,
		color = d_color,
		gradient_points = {
			1,
			d_color,
			0.9,
			d_color,
			0.85,
			Color():with_alpha(0),
			0,
			Color():with_alpha(0)
		}
	}
	self.overlay_effects.maingun_zoomed = {
		blend_mode = "add",
		fade_in = 0,
		fade_out = 0.4,
		sustain = 0,
		color = Color(0.1, 1, 1, 1)
	}
	self.overlay_effects.fade_out_e3_demo = {
		blend_mode = "normal",
		fade_in = 3,
		fade_out = 0,
		font = "fonts/font_large_mf",
		font_size = 44,
		play_paused = true,
		sustain = 30,
		text = "Great job, gang!\n\nYou've reached the end of our E3 demo.\nPlay the full version soon to get your full PAYDAY!",
		text_blend_mode = "add",
		text_to_upper = true,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main(),
		text_color = Color(255, 255, 204, 0) / 255
	}
	self.overlay_effects.fade_out_mex = {
		blend_mode = "normal",
		fade_in = 1,
		fade_out = 1,
		font = "fonts/font_large_mf",
		font_size = 44,
		localize = true,
		sustain = 4,
		text = "heist_mex_transition",
		text_blend_mode = "add",
		text_to_upper = true,
		color = Color(1, 0, 0, 0),
		timer = TimerManager:main(),
		text_color = Color(255, 255, 153, 0) / 255
	}
	self.overlay_effects.fade_out_e3_video = {
		blend_mode = "normal",
		fade_in = 0,
		fade_out = 0,
		sustain = 0,
		color = Color(1, 0, 0, 0)
	}
	self.materials = {}
	self.materials[Idstring("concrete"):key()] = "concrete"
	self.materials[Idstring("ceramic"):key()] = "ceramic"
	self.materials[Idstring("marble"):key()] = "marble"
	self.materials[Idstring("flesh"):key()] = "flesh"
	self.materials[Idstring("parket"):key()] = "parket"
	self.materials[Idstring("sheet_metal"):key()] = "sheet_metal"
	self.materials[Idstring("iron"):key()] = "iron"
	self.materials[Idstring("wood"):key()] = "wood"
	self.materials[Idstring("gravel"):key()] = "gravel"
	self.materials[Idstring("cloth"):key()] = "cloth"
	self.materials[Idstring("cloth_no_decal"):key()] = "cloth"
	self.materials[Idstring("cloth_stuffed"):key()] = "cloth_stuffed"
	self.materials[Idstring("dirt"):key()] = "dirt"
	self.materials[Idstring("grass"):key()] = "grass"
	self.materials[Idstring("carpet"):key()] = "carpet"
	self.materials[Idstring("metal"):key()] = "metal"
	self.materials[Idstring("glass_breakable"):key()] = "glass_breakable"
	self.materials[Idstring("glass_unbreakable"):key()] = "glass_unbreakable"
	self.materials[Idstring("glass_no_decal"):key()] = "glass_unbreakable"
	self.materials[Idstring("rubber"):key()] = "rubber"
	self.materials[Idstring("plastic"):key()] = "plastic"
	self.materials[Idstring("asphalt"):key()] = "asphalt"
	self.materials[Idstring("foliage"):key()] = "foliage"
	self.materials[Idstring("stone"):key()] = "stone"
	self.materials[Idstring("sand"):key()] = "sand"
	self.materials[Idstring("thin_layer"):key()] = "thin_layer"
	self.materials[Idstring("no_decal"):key()] = "silent_material"
	self.materials[Idstring("plaster"):key()] = "plaster"
	self.materials[Idstring("no_material"):key()] = "no_material"
	self.materials[Idstring("paper"):key()] = "paper"
	self.materials[Idstring("metal_hollow"):key()] = "metal_hollow"
	self.materials[Idstring("metal_chassis"):key()] = "metal_chassis"
	self.materials[Idstring("metal_catwalk"):key()] = "metal_catwalk"
	self.materials[Idstring("hardwood"):key()] = "hardwood"
	self.materials[Idstring("fence"):key()] = "fence"
	self.materials[Idstring("steel"):key()] = "steel"
	self.materials[Idstring("steel_no_decal"):key()] = "steel"
	self.materials[Idstring("tile"):key()] = "tile"
	self.materials[Idstring("water_deep"):key()] = "water_deep"
	self.materials[Idstring("water_puddle"):key()] = "water_puddle"
	self.materials[Idstring("water_shallow"):key()] = "water_puddle"
	self.materials[Idstring("shield"):key()] = "shield"
	self.materials[Idstring("heavy_swat_steel_no_decal"):key()] = "shield"
	self.materials[Idstring("snow"):key()] = "snow"
	self.materials[Idstring("ice"):key()] = "ice_thick"
	self.materials[Idstring("aim_debug"):key()] = "aim_debug"
	self.materials[Idstring("flesh_devil"):key()] = "flesh"
	self.screen = {}
	self.screen.fadein_delay = 1
	self.experience_manager = {}
	self.experience_manager.values = {}
	self.experience_manager.values.size02 = 0
	self.experience_manager.values.size03 = 10
	self.experience_manager.values.size04 = 15
	self.experience_manager.values.size06 = 25
	self.experience_manager.values.size08 = 40
	self.experience_manager.values.size10 = 80
	self.experience_manager.values.size12 = 100
	self.experience_manager.values.size14 = 150
	self.experience_manager.values.size16 = 250
	self.experience_manager.values.size18 = 500
	self.experience_manager.values.size20 = 1000
	self.experience_manager.loot_drop_value = {}
	self.experience_manager.loot_drop_value.xp10 = 2000
	self.experience_manager.loot_drop_value.xp15 = 3000
	self.experience_manager.loot_drop_value.xp20 = 4000
	self.experience_manager.loot_drop_value.xp30 = 7000
	self.experience_manager.loot_drop_value.xp40 = 10000
	self.experience_manager.loot_drop_value.xp50 = 12000
	self.experience_manager.loot_drop_value.xp60 = 15000
	self.experience_manager.loot_drop_value.xp70 = 20000
	self.experience_manager.loot_drop_value.xp80 = 24000
	self.experience_manager.loot_drop_value.xp90 = 28000
	self.experience_manager.loot_drop_value.xp100 = 32000
	self.experience_manager.loot_drop_value.xp_pda9_1 = 250000
	self.experience_manager.loot_drop_value.xp_pda9_2 = 3000000
	self.experience_manager.stage_completion = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.experience_manager.job_completion = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.experience_manager.stage_failed_multiplier = 0.01
	self.experience_manager.in_custody_multiplier = 0.7
	self.experience_manager.pro_job_multiplier = 1.2
	self.experience_manager.difficulty_multiplier = {
		2,
		5,
		10,
		11.5,
		13,
		14
	}
	self.experience_manager.alive_humans_multiplier = {
		[0] = 1,
		1,
		1.1,
		1.2,
		1.3
	}
	self.experience_manager.limited_bonus_multiplier = 1
	self.experience_manager.limited_xmas_bonus_multiplier = 1.15
	self.experience_manager.level_limit = {}
	self.experience_manager.level_limit.low_cap_level = -1
	self.experience_manager.level_limit.low_cap_multiplier = 0.75
	self.experience_manager.level_limit.pc_difference_multipliers = {
		0.9,
		0.8,
		0.7,
		0.6,
		0.5,
		0.4,
		0.3,
		0.2,
		0.1,
		0.01
	}
	self.experience_manager.civilians_killed = 0
	self.experience_manager.day_multiplier = {
		1,
		1,
		1,
		4,
		5,
		6,
		7
	}
	self.experience_manager.pro_day_multiplier = {
		1,
		1,
		1,
		5.5,
		7,
		8.5,
		10
	}
	self.experience_manager.total_level_objectives = 500
	self.experience_manager.total_criminals_finished = 50
	self.experience_manager.total_objectives_finished = 500

	local multiplier = 1

	self.experience_manager.levels = {}
	self.experience_manager.levels[1] = {
		points = 900 * multiplier
	}
	self.experience_manager.levels[2] = {
		points = 1250 * multiplier
	}
	self.experience_manager.levels[3] = {
		points = 1550 * multiplier
	}
	self.experience_manager.levels[4] = {
		points = 1850 * multiplier
	}
	self.experience_manager.levels[5] = {
		points = 2200 * multiplier
	}
	self.experience_manager.levels[6] = {
		points = 2600 * multiplier
	}
	self.experience_manager.levels[7] = {
		points = 3000 * multiplier
	}
	self.experience_manager.levels[8] = {
		points = 3500 * multiplier
	}
	self.experience_manager.levels[9] = {
		points = 4000 * multiplier
	}

	local exp_step_start = 10
	local exp_step_end = 100
	local exp_step = 1 / (exp_step_end - exp_step_start)
	local exp_step_last_points = 4600
	local exp_step_curve = 3

	for i = exp_step_start, exp_step_end do
		self.experience_manager.levels[i] = {
			points = math.round((1000000 - exp_step_last_points) * math.pow(exp_step * (i - exp_step_start), exp_step_curve) + exp_step_last_points) * multiplier
		}
	end

	local exp_step_start = 5
	local exp_step_end = 193
	local exp_step = 1 / (exp_step_end - exp_step_start)

	for i = 146, exp_step_end do
		self.experience_manager.levels[i] = {
			points = math.round(22000 * (exp_step * (i - exp_step_start)) - 6000) * multiplier
		}
	end

	self.experience_manager.prestige_xp_max = 30000000
	self.pickups = {}
	self.pickups.ammo = {
		unit = Idstring("units/pickups/ammo/ammo_pickup")
	}
	self.pickups.bank_manager_key = {
		unit = Idstring("units/pickups/pickup_bank_manager_key/pickup_bank_manager_key")
	}
	self.pickups.chavez_key = {
		unit = Idstring("units/pickups/pickup_chavez_key/pickup_chavez_key")
	}
	self.pickups.gen_fbi_usb_stick = {
		unit = Idstring("units/pd2_dlc_friend/props/sfm_fbi_usb_stick/sfm_fbi_usb_stick")
	}
	self.pickups.sfm_fbi_usb_stick = {
		unit = Idstring("units/pd2_dlc_friend/props/sfm_fbi_usb_stick/sfm_fbi_usb_stick")
	}
	self.pickups.drill = {
		unit = Idstring("units/pickups/pickup_drill/pickup_drill")
	}
	self.pickups.keycard = {
		unit = Idstring("units/payday2/pickups/gen_pku_keycard/gen_pku_keycard")
	}
	self.pickups.keycard_outlined = {
		unit = Idstring("units/pd2_dlc_red/pickups/gen_pku_keycard_outlined/gen_pku_keycard_outlined")
	}
	self.pickups.keycard_standard_outlined = {
		unit = Idstring("units/payday2/pickups/gen_pku_keycard_standard_outline/gen_pku_keycard_standard_outline")
	}
	self.pickups.hotel_room_key = {
		unit = Idstring("units/pd2_dlc_casino/props/cas_prop_keycard/cas_prop_keycard")
	}
	self.pickups.pku_rambo = {
		unit = Idstring("units/pd2_dlc_jolly/pickups/gen_pku_rambo/gen_pku_rambo")
	}
	self.pickups.keycard_outlined_waypoint = {
		unit = Idstring("units/pd2_dlc_red/pickups/gen_pku_keycard_outlined_waypoint/gen_pku_keycard_outlined_waypoint")
	}
	self.pickups.keychain = {
		unit = Idstring("units/pd2_dlc_chas/pickups/chas_pku_keychain/chas_pku_keychain")
	}
	self.pickups.hand = {
		unit = Idstring("units/pd2_dlc_chca/pickups/chca_pku_hand/chca_pku_hand")
	}
	self.pickups.corp_access_tag = {
		unit = Idstring("units/pd2_dlc_corp/pickups/corp_pku_security_fob/corp_pku_security_fob")
	}
	self.danger_zones = {
		0.6,
		0.5,
		0.35,
		0.1
	}
	self.contour = {}
	self.contour.character = {}
	self.contour.character.standard_color = Vector3(0.1, 1, 0.5)
	self.contour.character.friendly_color = Vector3(0.2, 0.8, 1)
	self.contour.character.friendly_minion_color = Vector3(0.1, 0.4, 1)
	self.contour.character.downed_color = Vector3(1, 0.5, 0)
	self.contour.character.dead_color = Vector3(1, 0.1, 0.1)
	self.contour.character.dangerous_color = Vector3(0.6, 0.2, 0.2)
	self.contour.character.more_dangerous_color = Vector3(1, 0.1, 0.1)
	self.contour.character.standard_opacity = 0
	self.contour.character.heal_color = Vector3(0, 1, 0)
	self.contour.character.tmp_invulnerable_color = Vector3(0.8, 0.3, 0)
	self.contour.character.vulnerable_color = Vector3(0.6, 0.2, 0.2)
	self.contour.character_interactable = {}
	self.contour.character_interactable.standard_color = Vector3(1, 0.5, 0)
	self.contour.character_interactable.selected_color = Vector3(1, 1, 1)
	self.contour.interactable = {}
	self.contour.interactable.standard_color = Vector3(1, 0.5, 0)
	self.contour.interactable.selected_color = Vector3(1, 1, 1)
	self.contour.contour_off = {}
	self.contour.contour_off.standard_color = Vector3(0, 0, 0)
	self.contour.contour_off.selected_color = Vector3(0, 0, 0)
	self.contour.contour_off.standard_opacity = 0
	self.contour.deployable = {}
	self.contour.deployable.standard_color = Vector3(0.1, 1, 0.5)
	self.contour.deployable.selected_color = Vector3(1, 1, 1)
	self.contour.deployable.active_color = Vector3(0.1, 0.4, 1)
	self.contour.deployable.interact_color = Vector3(0.1, 1, 0.1)
	self.contour.deployable.disabled_color = Vector3(1, 0.1, 0.1)
	self.contour.upgradable = {}
	self.contour.upgradable.standard_color = Vector3(0.1, 0.5, 1)
	self.contour.upgradable.selected_color = Vector3(1, 1, 1)
	self.contour.pickup = {}
	self.contour.pickup.standard_color = Vector3(0.1, 1, 0.5)
	self.contour.pickup.selected_color = Vector3(1, 1, 1)
	self.contour.pickup.standard_opacity = 1
	self.contour.interactable_icon = {}
	self.contour.interactable_icon.standard_color = Vector3(0, 0, 0)
	self.contour.interactable_icon.selected_color = Vector3(0, 1, 0)
	self.contour.interactable_icon.standard_opacity = 0
	self.contour.interactable_look_at = {}
	self.contour.interactable_look_at.standard_color = Vector3(0, 0, 0)
	self.contour.interactable_look_at.selected_color = Vector3(1, 1, 1)
	self.music = {}
	self.music.hit = {}
	self.music.hit.intro = "music_hit_setup"
	self.music.hit.anticipation = "music_hit_anticipation"
	self.music.hit.assault = "music_hit_assault"
	self.music.hit.fake_assault = "music_hit_assault"
	self.music.hit.control = "music_hit_control"
	self.music.stress = {}
	self.music.stress.intro = "music_stress_setup"
	self.music.stress.anticipation = "music_stress_anticipation"
	self.music.stress.assault = "music_stress_assault"
	self.music.stress.fake_assault = "music_stress_assault"
	self.music.stress.control = "music_stress_control"
	self.music.stealth = {}
	self.music.stealth.intro = "music_stealth_setup"
	self.music.stealth.anticipation = "music_stealth_anticipation"
	self.music.stealth.assault = "music_stealth_assault"
	self.music.stealth.fake_assault = "music_stealth_assault"
	self.music.stealth.control = "music_stealth_control"
	self.music.heist = {}
	self.music.heist.intro = "music_heist_setup"
	self.music.heist.anticipation = "music_heist_anticipation"
	self.music.heist.assault = "music_heist_assault"
	self.music.heist.fake_assault = "music_heist_assault"
	self.music.heist.control = "music_heist_control"
	self.music.big_bank = {}
	self.music.big_bank.intro = "music_heist_setup"
	self.music.big_bank.anticipation = "music_heist_anticipation"
	self.music.big_bank.assault = "music_heist_assault"
	self.music.big_bank.fake_assault = "music_heist_assault"
	self.music.big_bank.control = "music_heist_control"
	self.music.default = deep_clone(self.music.heist)
	self.music.track_list = {
		{
			track = "track_01"
		},
		{
			track = "track_02"
		},
		{
			track = "track_03"
		},
		{
			track = "track_04"
		},
		{
			track = "track_05"
		},
		{
			track = "track_06"
		},
		{
			track = "track_07"
		},
		{
			track = "track_08"
		},
		{
			lock = "armored",
			track = "track_09"
		},
		{
			track = "track_10"
		},
		{
			lock = "infamy",
			track = "track_11"
		},
		{
			lock = "deathwish",
			track = "track_12"
		},
		{
			track = "track_13"
		},
		{
			lock = "bigbank",
			track = "track_14"
		},
		{
			track = "track_15"
		},
		{
			track = "track_16"
		},
		{
			lock = "assault",
			track = "track_17"
		},
		{
			lock = "miami",
			track = "track_18"
		},
		{
			lock = "miami",
			track = "track_19"
		},
		{
			track = "track_20"
		},
		{
			track = "track_21"
		},
		{
			track = "track_22"
		},
		{
			track = "track_23"
		},
		{
			lock = "diamond",
			track = "track_24"
		},
		{
			lock = "thebomb",
			track = "track_25"
		},
		{
			track = "track_26"
		},
		{
			track = "track_27"
		},
		{
			track = "track_28"
		},
		{
			lock = "kenaz",
			track = "track_29"
		},
		{
			track = "track_30"
		},
		{
			track = "track_31"
		},
		{
			track = "track_35"
		},
		{
			track = "track_36"
		},
		{
			hide_unavailable = true,
			lock = "berry",
			track = "track_37"
		},
		{
			hide_unavailable = true,
			lock = "berry",
			track = "track_38"
		},
		{
			track = "track_39"
		},
		{
			lock = "peta",
			track = "track_40"
		},
		{
			lock = "peta",
			track = "track_41"
		},
		{
			lock = "pal",
			track = "track_42"
		},
		{
			lock = "pal",
			track = "track_43"
		},
		{
			hide_unavailable = true,
			lock = "mad",
			track = "track_44"
		},
		{
			lock = "born",
			track = "track_45"
		},
		{
			lock = "born",
			track = "track_46"
		},
		{
			track = "track_47_gen"
		},
		{
			track = "track_48"
		},
		{
			track = "track_49"
		},
		{
			hide_unavailable = true,
			lock = "friend",
			track = "track_50"
		},
		{
			hide_unavailable = true,
			lock = "spa",
			track = "track_51"
		},
		{
			track = "track_52"
		},
		{
			track = "track_53"
		},
		{
			track = "track_54"
		},
		{
			track = "track_55"
		},
		{
			track = "track_56"
		},
		{
			hide_unavailable = true,
			lock = "rvd",
			track = "track_57"
		},
		{
			hide_unavailable = true,
			lock = "rvd",
			track = "track_58"
		},
		{
			track = "track_59"
		},
		{
			track = "track_60"
		},
		{
			track = "track_61"
		},
		{
			track = "track_62_lcv"
		},
		{
			track = "track_63"
		},
		{
			track = "track_64_lcv"
		},
		{
			track = "track_32_lcv"
		},
		{
			track = "track_33_lcv"
		},
		{
			track = "track_34_lcv"
		},
		{
			track = "track_65"
		},
		{
			track = "track_66"
		},
		{
			track = "track_67"
		},
		{
			track = "track_68"
		},
		{
			track = "track_69"
		},
		{
			track = "track_70"
		},
		{
			track = "track_71"
		},
		{
			track = "track_72"
		},
		{
			track = "track_73"
		},
		{
			track = "track_74"
		},
		{
			track = "track_75"
		},
		{
			track = "track_76"
		},
		{
			track = "track_77"
		},
		{
			track = "track_78"
		},
		{
			track = "track_79"
		},
		{
			track = "track_80"
		},
		{
			lock = "payday",
			track = "track_pth_01"
		},
		{
			lock = "payday",
			track = "track_pth_02"
		},
		{
			lock = "payday",
			track = "track_pth_03"
		},
		{
			lock = "payday",
			track = "track_pth_04"
		},
		{
			lock = "payday",
			track = "track_pth_05"
		},
		{
			lock = "payday",
			track = "track_pth_06"
		},
		{
			lock = "payday",
			track = "track_pth_07"
		},
		{
			lock = "payday",
			track = "track_pth_08"
		},
		{
			lock = "payday",
			track = "track_pth_09"
		}
	}
	self.music.track_ghost_list = {
		{
			track = "kosugi_music"
		},
		{
			hide_unavailable = true,
			lock = "mad",
			track = "music_dark"
		},
		{
			hide_unavailable = true,
			lock = "fish",
			track = "music_fish"
		},
		{
			track = "music_tag"
		},
		{
			track = "music_xmn"
		}
	}
	self.music.track_menu_list = {
		{
			track = "menu_music"
		},
		{
			track = "loadout_music"
		},
		{
			track = "music_loot_drop"
		},
		{
			track = "resultscreen_win"
		},
		{
			track = "resultscreen_lose"
		},
		{
			track = "preplanning_music"
		},
		{
			track = "preplanning_music_old"
		},
		{
			track = "lets_go_shopping_menu"
		},
		{
			track = "this_is_our_time"
		},
		{
			track = "criminals_ambition"
		},
		{
			lock = "soundtrack",
			track = "criminals_ambition_instrumental"
		},
		{
			lock = "soundtrack",
			track = "release_trailer_track"
		},
		{
			lock = "soundtrack",
			track = "ode_all_avidita"
		},
		{
			lock = "soundtrack",
			track = "ode_all_avidita_instrumental"
		},
		{
			lock = "soundtrack",
			track = "drifting"
		},
		{
			lock = "soundtrack",
			track = "im_a_wild_one"
		},
		{
			track = "the_flames_of_love"
		},
		{
			lock = "alesso",
			track = "alesso_payday"
		},
		{
			hide_unavailable = true,
			lock = "locked",
			track = "pb_do_you_wanna"
		},
		{
			hide_unavailable = true,
			lock = "locked",
			track = "pb_i_need_your_love"
		},
		{
			hide_unavailable = true,
			lock = "locked",
			track = "pb_still_breathing"
		},
		{
			hide_unavailable = true,
			lock = "locked",
			track = "pb_take_me_down"
		},
		{
			hide_unavailable = true,
			lock = "locked",
			track = "biting_elbows_bad_motherfucker"
		},
		{
			hide_unavailable = true,
			lock = "locked",
			track = "biting_elbows_for_the_kill"
		},
		{
			lock = "born_wild",
			track = "half_passed_wicked"
		},
		{
			lock = "bsides",
			track = "bsides_04_double_lmgs"
		},
		{
			lock = "bsides",
			track = "bsides_11_meat_and_machine_guns"
		},
		{
			lock = "bsides",
			track = "bsides_05_rule_britannia"
		},
		{
			lock = "bsides",
			track = "bsides_07_an_unexpected_call"
		},
		{
			lock = "bsides",
			track = "bsides_13_infamy_2_0"
		},
		{
			lock = "bsides",
			track = "bsides_12_the_enforcer"
		},
		{
			lock = "bsides",
			track = "bsides_03_showdown"
		},
		{
			lock = "bsides",
			track = "bsides_15_duel"
		},
		{
			lock = "bsides",
			track = "bsides_02_swat_attack"
		},
		{
			lock = "bsides",
			track = "bsides_08_this_is_goodbye"
		},
		{
			lock = "bsides",
			track = "bsides_10_zagrebacka"
		},
		{
			lock = "bsides",
			track = "bsides_16_pilgrim"
		},
		{
			lock = "bsides",
			track = "bsides_14_collide"
		},
		{
			lock = "bsides",
			track = "bsides_01_enter_the_hallway"
		},
		{
			lock = "bsides",
			track = "bsides_06_hur_jag_trivs"
		},
		{
			lock = "payday",
			track = "pth_i_will_give_you_my_all"
		},
		{
			lock = "payday",
			track = "pth_breaking_news"
		},
		{
			lock = "payday",
			track = "pth_breaking_news_instrumental"
		},
		{
			lock = "payday",
			track = "pth_criminal_intent"
		},
		{
			lock = "payday",
			track = "pth_busted"
		},
		{
			lock = "payday",
			track = "pth_busted_instrumental"
		},
		{
			lock = "payday",
			track = "pth_see_you_at_the_safe_house"
		},
		{
			lock = "payday",
			track = "pth_preparations"
		},
		{
			lock = "xmas",
			track = "xmas13_a_merry_payday_christmas"
		},
		{
			lock = "xmas",
			track = "xmas13_a_heist_not_attempted_before"
		},
		{
			lock = "xmas",
			track = "xmas13_if_it_has_to_be_christmas"
		},
		{
			lock = "xmas",
			track = "xmas13_ive_been_a_bad_boy"
		},
		{
			lock = "xmas",
			track = "xmas13_christmas_in_prison"
		},
		{
			lock = "xmas",
			track = "xmas13_deck_the_safe_house"
		},
		{
			lock = "xmas",
			track = "xmas13_if_it_has_to_be_christmas_american_version"
		},
		{
			lock = "xmas",
			track = "xmas13_a_merry_payday_christmas_instrumental"
		},
		{
			lock = "xmas",
			track = "xmas13_a_heist_not_attempted_before_instrumental"
		},
		{
			lock = "xmas",
			track = "xmas13_if_it_has_to_be_christmas_instrumental"
		},
		{
			lock = "xmas",
			track = "xmas13_ive_been_a_bad_boy_instrumental"
		},
		{
			lock = "xmas",
			track = "xmas13_christmas_in_prison_instrumental"
		},
		{
			lock = "xmas",
			track = "xmas13_deck_the_safe_house_instrumental"
		},
		{
			track = "its_payday"
		},
		{
			track = "music_tag"
		},
		{
			track = "ojos_de_diamante"
		},
		{
			track = "ojos_de_esmeralda"
		},
		{
			track = "today_is_payday_too"
		},
		{
			lock = "tma1",
			track = "jokes_on_them"
		},
		{
			lock = "tma1",
			track = "ojos_de_diamante_new"
		},
		{
			lock = "tma1",
			track = "ojos_de_esmeralda_new"
		},
		{
			lock = "tma1",
			track = "silk_road"
		},
		{
			lock = "tma1",
			track = "its_clown_time"
		}
	}
	self.music.soundbank_list = {
		"soundbanks/music",
		"soundbanks/music_alesso"
	}
	self.music.event_track_overrides = {}
	self.blame = {}
	self.blame.default = "hint_blame_missing"
	self.blame.empty = nil
	self.blame.cam_criminal = "hint_cam_criminal"
	self.blame.cam_dead_body = "hint_cam_dead_body"
	self.blame.cam_hostage = "hint_cam_hostage"
	self.blame.cam_distress = "hint_cam_distress"
	self.blame.cam_body_bag = "hint_body_bag"
	self.blame.cam_gunfire = "hint_gunfire"
	self.blame.cam_drill = "hint_cam_drill"
	self.blame.cam_saw = "hint_cam_saw"
	self.blame.cam_sentry_gun = "hint_sentry_gun"
	self.blame.cam_trip_mine = "hint_trip_mine"
	self.blame.cam_ecm_jammer = "hint_ecm_jammer"
	self.blame.cam_c4 = "hint_c4"
	self.blame.cam_computer = "hint_computer"
	self.blame.cam_glass = "hint_glass"
	self.blame.cam_broken_cam = "hint_cam_broken_cam"
	self.blame.cam_vault = "hint_vault"
	self.blame.cam_fire = "hint_fire"
	self.blame.cam_voting = "hint_voting"
	self.blame.cam_breaking_entering = "hint_breaking_entering"
	self.blame.civ_criminal = "hint_civ_criminal"
	self.blame.civ_dead_body = "hint_civ_dead_body"
	self.blame.civ_hostage = "hint_civ_hostage"
	self.blame.civ_distress = "hint_civ_distress"
	self.blame.civ_body_bag = "hint_civ_body_bag"
	self.blame.civ_gunfire = "hint_civ_gunfire"
	self.blame.civ_drill = "hint_civ_drill"
	self.blame.civ_saw = "hint_civ_saw"
	self.blame.civ_sentry_gun = "hint_civ_sentry_gun"
	self.blame.civ_trip_mine = "hint_civ_trip_mine"
	self.blame.civ_ecm_jammer = "hint_civ_ecm_jammer"
	self.blame.civ_c4 = "hint_civ_c4"
	self.blame.civ_computer = "hint_civ_computer"
	self.blame.civ_glass = "hint_civ_glass"
	self.blame.civ_broken_cam = "hint_civ_broken_cam"
	self.blame.civ_vault = "hint_civ_vault"
	self.blame.civ_fire = "hint_civ_fire"
	self.blame.civ_voting = "hint_civ_voting"
	self.blame.civ_breaking_entering = "hint_civ_breaking_entering"
	self.blame.cop_criminal = "hint_cop_criminal"
	self.blame.cop_dead_body = "hint_cop_dead_body"
	self.blame.cop_hostage = "hint_cop_hostage"
	self.blame.cop_distress = "hint_cop_distress"
	self.blame.cop_body_bag = "hint_cop_body_bag"
	self.blame.cop_gunfire = "hint_cop_gunfire"
	self.blame.cop_drill = "hint_cop_drill"
	self.blame.cop_saw = "hint_cop_saw"
	self.blame.cop_sentry_gun = "hint_cop_sentry_gun"
	self.blame.cop_trip_mine = "hint_cop_trip_mine"
	self.blame.cop_ecm_jammer = "hint_cop_ecm_jammer"
	self.blame.cop_c4 = "hint_cop_c4"
	self.blame.cop_computer = "hint_cop_computer"
	self.blame.cop_glass = "hint_cop_glass"
	self.blame.cop_broken_cam = "hint_cop_broken_cam"
	self.blame.cop_vault = "hint_cop_vault"
	self.blame.cop_fire = "hint_cop_fire"
	self.blame.cop_voting = "hint_cop_voting"
	self.blame.cop_breaking_entering = "hint_cop_breaking_entering"
	self.blame.sys_explosion = "hint_alert_explosion"
	self.blame.civ_explosion = "hint_alert_explosion"
	self.blame.cop_explosion = "hint_alert_explosion"
	self.blame.gan_explosion = "hint_alert_explosion"
	self.blame.cam_explosion = "hint_alert_explosion"
	self.blame.sys_blackmailer = "hint_blame_blackmailer"
	self.blame.sys_gensec = "hint_blame_gensec"
	self.blame.sys_police_alerted = "hint_blame_police_alerted"
	self.blame.sys_csgo_gunfire = "hint_blame_csgo_gunfire"
	self.blame.met_criminal = "hint_met_criminal"
	self.blame.mot_criminal = "hint_mot_criminal"
	self.blame.gls_alarm = "hint_alarm_glass"
	self.blame.alarm_pager_bluff_failed = "hint_alarm_pager_bluff_failed"
	self.blame.alarm_pager_not_answered = "hint_alarm_pager_not_answered"
	self.blame.alarm_pager_hang_up = "hint_alarm_pager_hang_up"
	self.blame.civ_too_many_killed = "hint_civ_too_many_killed"
	self.blame.civ_alarm = "hint_alarm_civ"
	self.blame.cop_alarm = "hint_alarm_cop"
	self.blame.gan_alarm = "hint_alarm_cop"
	self.blame.cam_crate_open = "hint_cam_crate_open"
	self.blame.civ_crate_open = "hint_civ_crate_open"
	self.blame.cop_crate_open = "hint_cop_crate_open"
	self.blame.gan_crate_open = "hint_cop_crate_open"
	self.casino = {}
	self.casino.unlock_level = 10
	self.casino.entrance_level = {
		14,
		28,
		40,
		45,
		55,
		65,
		75
	}
	self.casino.entrance_fee = {
		500000,
		500000,
		500000,
		750000,
		1000000,
		1250000,
		1500000
	}
	self.casino.prefer_cost = 500000
	self.casino.prefer_chance = 0.1
	self.casino.secure_card_cost = {
		1000000,
		3300000,
		6500000
	}
	self.casino.secure_card_level = {
		10,
		40,
		60
	}
	self.casino.infamous_cost = 3000000
	self.casino.infamous_chance = 3
	self.weapon_disable_crit_for_damage = {
		frag = {
			explosion = false,
			fire = false
		},
		dada_com = {
			explosion = false,
			fire = false
		},
		fir_com = {
			explosion = false,
			fire = false
		},
		launcher_frag = {
			explosion = false,
			fire = false
		},
		launcher_rocket = {
			explosion = false,
			fire = false
		},
		rocket_ray_frag = {
			explosion = false,
			fire = false
		},
		environment_fire = {
			fire = false
		},
		dynamite = {
			fire = false
		},
		sticky_grenade = {
			explosion = false
		},
		wpn_gre_electric = {
			explosion = false,
			tase = false
		},
		poison_gas_grenade = {
			explosion = false
		},
		launcher_frag_arbiter = {
			explosion = false,
			fire = false
		},
		launcher_m203 = {
			explosion = false,
			fire = false
		},
		launcher_frag_china = {
			explosion = false,
			fire = false
		},
		launcher_electric = {
			explosion = false,
			tase = false
		},
		launcher_electric_m32 = {
			explosion = false,
			tase = false
		},
		launcher_electric_china = {
			explosion = false,
			tase = false
		},
		launcher_electric_slap = {
			explosion = false,
			tase = false
		},
		launcher_electric_arbiter = {
			explosion = false,
			tase = false
		},
		launcher_poison = {
			explosion = false
		},
		launcher_poison_ms3gl_conversion = {
			explosion = false
		},
		launcher_poison_gre_m79 = {
			explosion = false
		},
		launcher_poison_m32 = {
			explosion = false
		},
		launcher_poison_groza = {
			explosion = false
		},
		launcher_poison_china = {
			explosion = false
		},
		launcher_poison_arbiter = {
			explosion = false
		},
		launcher_poison_slap = {
			explosion = false
		},
		launcher_poison_contraband = {
			explosion = false
		},
		launcher_frag_ms3gl = {
			explosion = false,
			fire = false
		},
		launcher_incendiary_ms3gl = {
			explosion = false,
			fire = false
		},
		launcher_electric_ms3gl = {
			explosion = false,
			tase = false
		},
		underbarrel_electric = {
			explosion = false,
			tase = false
		},
		underbarrel_electric_groza = {
			explosion = false,
			tase = false
		},
		underbarrel_m203_groza = {
			explosion = false,
			tase = false
		}
	}
	self.projectiles = {}
	self.projectiles.frag = {}
	self.projectiles.frag.damage = 160
	self.projectiles.frag.curve_pow = 0.1
	self.projectiles.frag.player_damage = 10
	self.projectiles.frag.range = 500
	self.projectiles.frag.name_id = "bm_grenade_frag"
	self.projectiles.launcher_frag = {}
	self.projectiles.launcher_frag.damage = 130
	self.projectiles.launcher_frag.launch_speed = 1250
	self.projectiles.launcher_frag.curve_pow = 0.1
	self.projectiles.launcher_frag.player_damage = 8
	self.projectiles.launcher_frag.range = 350
	self.projectiles.launcher_frag.init_timer = 2.5
	self.projectiles.launcher_frag.mass_look_up_modifier = 1
	self.projectiles.launcher_frag.sound_event = "gl_explode"
	self.projectiles.launcher_frag.name_id = "bm_launcher_frag"
	self.projectiles.launcher_rocket = {}
	self.projectiles.launcher_rocket.damage = 1250
	self.projectiles.launcher_rocket.launch_speed = 2500
	self.projectiles.launcher_rocket.curve_pow = 0.1
	self.projectiles.launcher_rocket.player_damage = 40
	self.projectiles.launcher_rocket.range = 500
	self.projectiles.launcher_rocket.init_timer = 2.5
	self.projectiles.launcher_rocket.mass_look_up_modifier = 1
	self.projectiles.launcher_rocket.sound_event = "rpg_explode"
	self.projectiles.launcher_rocket.name_id = "bm_launcher_rocket"
	self.projectiles.molotov = {}
	self.projectiles.molotov.damage = 3
	self.projectiles.molotov.player_damage = 1
	self.projectiles.molotov.dot_data_name = "proj_molotov"
	self.projectiles.molotov.range = 350
	self.projectiles.molotov.burn_duration = 15
	self.projectiles.molotov.burn_tick_period = 0.5
	self.projectiles.molotov.sound_event = "molotov_impact"
	self.projectiles.molotov.sound_event_impact_duration = 0
	self.projectiles.molotov.name_id = "bm_grenade_molotov"
	self.projectiles.molotov.alert_radius = 1500
	self.projectiles.molotov.fire_alert_radius = 1500
	self.projectiles.cs_grenade_quick = {}
	self.projectiles.cs_grenade_quick.radius = 300
	self.projectiles.cs_grenade_quick.radius_blurzone_multiplier = 1.3
	self.projectiles.cs_grenade_quick.damage_tick_period = 0.25
	self.projectiles.cs_grenade_quick.damage_per_tick = 0.75
	self.projectiles.launcher_incendiary = {}
	self.projectiles.launcher_incendiary.damage = 10
	self.projectiles.launcher_incendiary.launch_speed = 1250
	self.projectiles.launcher_incendiary.curve_pow = 0.1
	self.projectiles.launcher_incendiary.player_damage = 2
	self.projectiles.launcher_incendiary.dot_data_name = "proj_launcher_incendiary"
	self.projectiles.launcher_incendiary.range = 350
	self.projectiles.launcher_incendiary.init_timer = 2.5
	self.projectiles.launcher_incendiary.mass_look_up_modifier = 1
	self.projectiles.launcher_incendiary.sound_event = "gl_explode"
	self.projectiles.launcher_incendiary.sound_event_impact_duration = 1
	self.projectiles.launcher_incendiary.effect_name = "effects/payday2/particles/explosions/grenade_incendiary_explosion"
	self.projectiles.launcher_incendiary.name_id = "bm_launcher_incendiary"
	self.projectiles.launcher_incendiary.burn_duration = 6
	self.projectiles.launcher_incendiary.burn_tick_period = 0.5
	self.projectiles.launcher_frag_m32 = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_frag_m32.damage = 130
	self.projectiles.launcher_incendiary_m32 = deep_clone(self.projectiles.launcher_incendiary)
	self.projectiles.launcher_frag_china = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_frag_china.damage = 100
	self.projectiles.launcher_incendiary_china = deep_clone(self.projectiles.launcher_incendiary)
	self.projectiles.launcher_frag_arbiter = {}
	self.projectiles.launcher_frag_arbiter.damage = 48
	self.projectiles.launcher_frag_arbiter.launch_speed = 7000
	self.projectiles.launcher_frag_arbiter.curve_pow = 0.1
	self.projectiles.launcher_frag_arbiter.player_damage = 8
	self.projectiles.launcher_frag_arbiter.range = 350
	self.projectiles.launcher_frag_arbiter.init_timer = 2.5
	self.projectiles.launcher_frag_arbiter.mass_look_up_modifier = 1
	self.projectiles.launcher_frag_arbiter.sound_event = "gl_explode"
	self.projectiles.launcher_frag_arbiter.name_id = "bm_launcher_frag"
	self.projectiles.launcher_incendiary_arbiter = {}
	self.projectiles.launcher_incendiary_arbiter.damage = 10
	self.projectiles.launcher_incendiary_arbiter.launch_speed = 7000
	self.projectiles.launcher_incendiary_arbiter.curve_pow = 0.1
	self.projectiles.launcher_incendiary_arbiter.player_damage = 2
	self.projectiles.launcher_incendiary_arbiter.dot_data_name = "proj_launcher_incendiary_arbiter"
	self.projectiles.launcher_incendiary_arbiter.range = 350
	self.projectiles.launcher_incendiary_arbiter.init_timer = 2.5
	self.projectiles.launcher_incendiary_arbiter.mass_look_up_modifier = 1
	self.projectiles.launcher_incendiary_arbiter.sound_event = "gl_explode"
	self.projectiles.launcher_incendiary_arbiter.sound_event_impact_duration = 1
	self.projectiles.launcher_incendiary_arbiter.effect_name = "effects/payday2/particles/explosions/grenade_incendiary_explosion"
	self.projectiles.launcher_incendiary_arbiter.name_id = "bm_launcher_incendiary"
	self.projectiles.launcher_incendiary_arbiter.burn_duration = 3
	self.projectiles.launcher_incendiary_arbiter.burn_tick_period = 0.5
	self.projectiles.launcher_frag_slap = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_incendiary_slap = deep_clone(self.projectiles.launcher_incendiary)
	self.projectiles.fir_com = {}
	self.projectiles.fir_com.damage = 3
	self.projectiles.fir_com.curve_pow = 0.1
	self.projectiles.fir_com.player_damage = 3
	self.projectiles.fir_com.dot_data_name = "proj_fire_com"
	self.projectiles.fir_com.range = 500
	self.projectiles.fir_com.name_id = "bm_grenade_fir_com"
	self.projectiles.fir_com.sound_event = "white_explosion"
	self.projectiles.fir_com.effect_name = "effects/payday2/particles/explosions/grenade_incendiary_explosion"
	self.projectiles.rocket_frag = {}
	self.projectiles.rocket_frag.launch_speed = 2500
	self.projectiles.rocket_frag.adjust_z = 0
	self.projectiles.rocket_frag.push_at_body_index = 0
	self.projectiles.west_arrow = {}
	self.projectiles.west_arrow.damage = 100
	self.projectiles.west_arrow.launch_speed = 2000
	self.projectiles.west_arrow.adjust_z = 0
	self.projectiles.west_arrow.mass_look_up_modifier = 1
	self.projectiles.west_arrow.name_id = "bm_west_arrow"
	self.projectiles.west_arrow.push_at_body_index = 0
	self.projectiles.west_arrow_exp = deep_clone(self.projectiles.west_arrow)
	self.projectiles.west_arrow_exp.damage = 75
	self.projectiles.west_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
	self.projectiles.west_arrow_exp.remove_on_impact = true
	self.projectiles.dynamite = {}
	self.projectiles.dynamite.damage = 160
	self.projectiles.dynamite.curve_pow = 0.1
	self.projectiles.dynamite.player_damage = 10
	self.projectiles.dynamite.range = 500
	self.projectiles.dynamite.name_id = "bm_grenade_frag"
	self.projectiles.dynamite.effect_name = "effects/payday2/particles/explosions/dynamite_explosion"
	self.projectiles.bow_poison_arrow = deep_clone(self.projectiles.west_arrow)
	self.projectiles.bow_poison_arrow.damage = 6.6
	self.projectiles.bow_poison_arrow.bullet_class = "PoisonBulletBase"
	self.projectiles.crossbow_arrow = {}
	self.projectiles.crossbow_arrow.damage = 35
	self.projectiles.crossbow_arrow.launch_speed = 2000
	self.projectiles.crossbow_arrow.adjust_z = 0
	self.projectiles.crossbow_arrow.mass_look_up_modifier = 1
	self.projectiles.crossbow_arrow.push_at_body_index = 0
	self.projectiles.crossbow_poison_arrow = deep_clone(self.projectiles.crossbow_arrow)
	self.projectiles.crossbow_poison_arrow.damage = 10
	self.projectiles.crossbow_poison_arrow.bullet_class = "PoisonBulletBase"
	self.projectiles.crossbow_arrow_exp = deep_clone(self.projectiles.crossbow_arrow)
	self.projectiles.crossbow_arrow_exp.damage = 45
	self.projectiles.crossbow_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
	self.projectiles.crossbow_arrow_exp.remove_on_impact = true
	self.projectiles.wpn_prj_four = {}
	self.projectiles.wpn_prj_four.damage = 10
	self.projectiles.wpn_prj_four.launch_speed = 1500
	self.projectiles.wpn_prj_four.adjust_z = 0
	self.projectiles.wpn_prj_four.mass_look_up_modifier = 1
	self.projectiles.wpn_prj_four.name_id = "bm_prj_four"
	self.projectiles.wpn_prj_four.push_at_body_index = 0
	self.projectiles.wpn_prj_four.dot_data_name = "proj_four"
	self.projectiles.wpn_prj_four.bullet_class = "ProjectilesPoisonBulletBase"
	self.projectiles.wpn_prj_four.sounds = {}
	self.projectiles.wpn_prj_four.sounds.flyby = "throwing_star_flyby"
	self.projectiles.wpn_prj_four.sounds.flyby_stop = "throwing_star_flyby_stop"
	self.projectiles.wpn_prj_four.sounds.impact = "throwables_impact_gen"
	self.projectiles.wpn_prj_ace = {}
	self.projectiles.wpn_prj_ace.damage = 4
	self.projectiles.wpn_prj_ace.launch_speed = 1500
	self.projectiles.wpn_prj_ace.adjust_z = 0
	self.projectiles.wpn_prj_ace.mass_look_up_modifier = 1
	self.projectiles.wpn_prj_ace.name_id = "bm_prj_ace"
	self.projectiles.wpn_prj_ace.push_at_body_index = 0
	self.projectiles.wpn_prj_ace.sounds = {}
	self.projectiles.wpn_prj_ace.sounds.flyby = "throwing_star_flyby"
	self.projectiles.wpn_prj_ace.sounds.flyby_stop = "throwing_star_flyby_stop"
	self.projectiles.wpn_prj_ace.sounds.impact = "throwables_impact_gen"
	self.projectiles.wpn_prj_jav = {}
	self.projectiles.wpn_prj_jav.damage = 325
	self.projectiles.wpn_prj_jav.launch_speed = 1500
	self.projectiles.wpn_prj_jav.adjust_z = 30
	self.projectiles.wpn_prj_jav.mass_look_up_modifier = 1
	self.projectiles.wpn_prj_jav.name_id = "bm_prj_jav"
	self.projectiles.wpn_prj_jav.push_at_body_index = 0
	self.projectiles.wpn_prj_jav.sounds = {}
	self.projectiles.wpn_prj_jav.sounds.flyby = "jav_flyby"
	self.projectiles.wpn_prj_jav.sounds.flyby_stop = "jav_flyby_stop"
	self.projectiles.wpn_prj_jav.sounds.impact = "jav_impact_gen"
	self.projectiles.arblast_arrow = {}
	self.projectiles.arblast_arrow.damage = 200
	self.projectiles.arblast_arrow.launch_speed = 3500
	self.projectiles.arblast_arrow.adjust_z = 0
	self.projectiles.arblast_arrow.mass_look_up_modifier = 1
	self.projectiles.arblast_arrow.push_at_body_index = 0
	self.projectiles.arblast_poison_arrow = deep_clone(self.projectiles.arblast_arrow)
	self.projectiles.arblast_poison_arrow.damage = 30
	self.projectiles.arblast_poison_arrow.bullet_class = "PoisonBulletBase"
	self.projectiles.arblast_arrow_exp = deep_clone(self.projectiles.arblast_arrow)
	self.projectiles.arblast_arrow_exp.damage = 140
	self.projectiles.arblast_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
	self.projectiles.arblast_arrow_exp.remove_on_impact = true
	self.projectiles.frankish_arrow = {}
	self.projectiles.frankish_arrow.damage = 75
	self.projectiles.frankish_arrow.launch_speed = 2500
	self.projectiles.frankish_arrow.adjust_z = 0
	self.projectiles.frankish_arrow.mass_look_up_modifier = 1
	self.projectiles.frankish_arrow.push_at_body_index = 0
	self.projectiles.frankish_poison_arrow = deep_clone(self.projectiles.frankish_arrow)
	self.projectiles.frankish_poison_arrow.damage = 10
	self.projectiles.frankish_poison_arrow.bullet_class = "PoisonBulletBase"
	self.projectiles.frankish_arrow_exp = deep_clone(self.projectiles.frankish_arrow)
	self.projectiles.frankish_arrow_exp.damage = 70
	self.projectiles.frankish_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
	self.projectiles.frankish_arrow_exp.remove_on_impact = true
	self.projectiles.long_arrow = {}
	self.projectiles.long_arrow.damage = 200
	self.projectiles.long_arrow.launch_speed = 3500
	self.projectiles.long_arrow.adjust_z = -30
	self.projectiles.long_arrow.mass_look_up_modifier = 1
	self.projectiles.long_arrow.push_at_body_index = 0
	self.projectiles.long_poison_arrow = deep_clone(self.projectiles.long_arrow)
	self.projectiles.long_poison_arrow.damage = 30
	self.projectiles.long_poison_arrow.bullet_class = "PoisonBulletBase"
	self.projectiles.long_arrow_exp = deep_clone(self.projectiles.long_arrow)
	self.projectiles.long_arrow_exp.damage = 140
	self.projectiles.long_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
	self.projectiles.long_arrow_exp.remove_on_impact = true
	self.projectiles.wpn_prj_hur = {}
	self.projectiles.wpn_prj_hur.damage = 110
	self.projectiles.wpn_prj_hur.launch_speed = 1000
	self.projectiles.wpn_prj_hur.adjust_z = 120
	self.projectiles.wpn_prj_hur.mass_look_up_modifier = 1
	self.projectiles.wpn_prj_hur.name_id = "bm_prj_hur"
	self.projectiles.wpn_prj_hur.push_at_body_index = "dynamic_body_spinn"
	self.projectiles.wpn_prj_hur.sounds = {}
	self.projectiles.wpn_prj_hur.sounds.flyby = "hur_flyby"
	self.projectiles.wpn_prj_hur.sounds.flyby_stop = "hur_flyby_stop"
	self.projectiles.wpn_prj_hur.sounds.impact = "hur_impact_gen"
	self.projectiles.wpn_prj_target = {}
	self.projectiles.wpn_prj_target.damage = 110
	self.projectiles.wpn_prj_target.launch_speed = 1000
	self.projectiles.wpn_prj_target.adjust_z = 120
	self.projectiles.wpn_prj_target.mass_look_up_modifier = 1
	self.projectiles.wpn_prj_target.name_id = "bm_prj_target"
	self.projectiles.wpn_prj_target.push_at_body_index = "dynamic_body_spinn"
	self.projectiles.wpn_prj_target.sounds = {}
	self.projectiles.wpn_prj_target.sounds.flyby = "target_flyby"
	self.projectiles.wpn_prj_target.sounds.flyby_stop = "target_flyby_stop"
	self.projectiles.wpn_prj_target.sounds.impact = "target_impact_gen"
	self.projectiles.frag_com = {}
	self.projectiles.frag_com.damage = 60
	self.projectiles.frag_com.curve_pow = 0.1
	self.projectiles.frag_com.range = 1000
	self.projectiles.frag_com.name_id = "bm_grenade_frag_com"
	self.projectiles.concussion = {}
	self.projectiles.concussion.damage = 0
	self.projectiles.concussion.curve_pow = 0.1
	self.projectiles.concussion.range = 1500
	self.projectiles.concussion.name_id = "bm_concussion"
	self.projectiles.concussion.sound_event = "concussion_explosion"
	self.projectiles.concussion.duration = {
		additional = 10,
		min = 4
	}
	self.projectiles.launcher_m203 = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_m203.projectile_trail = true
	self.projectiles.rocket_ray_frag = deep_clone(self.projectiles.launcher_rocket)
	self.projectiles.rocket_ray_frag.damage = 390
	self.projectiles.rocket_ray_frag.projectile_trail = true
	self.projectiles.rocket_ray_frag.adjust_z = 0
	self.projectiles.rocket_ray_frag.push_at_body_index = 0
	self.projectiles.smoke_screen_grenade = {}
	self.projectiles.smoke_screen_grenade.damage = 0
	self.projectiles.smoke_screen_grenade.curve_pow = 0.1
	self.projectiles.smoke_screen_grenade.range = 1500
	self.projectiles.smoke_screen_grenade.name_id = "bm_smoke_screen_grenade"
	self.projectiles.smoke_screen_grenade.duration = 10
	self.projectiles.smoke_screen_grenade.dodge_chance = 0.5
	self.projectiles.smoke_screen_grenade.init_timer = 0
	self.projectiles.smoke_screen_grenade.accuracy_roll_chance = 0.5
	self.projectiles.smoke_screen_grenade.accuracy_fail_spread = {
		5,
		10
	}
	self.projectiles.dada_com = {}
	self.projectiles.dada_com.damage = 160
	self.projectiles.dada_com.curve_pow = 0.1
	self.projectiles.dada_com.range = 500
	self.projectiles.dada_com.name_id = "bm_grenade_dada_com"
	self.projectiles.dada_com.sound_event = "mtl_explosion"
	self.projectiles.ecp_arrow = {}
	self.projectiles.ecp_arrow.damage = 70
	self.projectiles.ecp_arrow.launch_speed = 3500
	self.projectiles.ecp_arrow.adjust_z = 0
	self.projectiles.ecp_arrow.mass_look_up_modifier = 1
	self.projectiles.ecp_arrow.push_at_body_index = 0
	self.projectiles.ecp_arrow_poison = deep_clone(self.projectiles.ecp_arrow)
	self.projectiles.ecp_arrow_poison.damage = 10
	self.projectiles.ecp_arrow_poison.bullet_class = "PoisonBulletBase"
	self.projectiles.ecp_arrow_exp = deep_clone(self.projectiles.ecp_arrow)
	self.projectiles.ecp_arrow_exp.damage = 55
	self.projectiles.ecp_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
	self.projectiles.ecp_arrow_exp.remove_on_impact = true
	self.projectiles.elastic_arrow = {}
	self.projectiles.elastic_arrow.damage = 200
	self.projectiles.elastic_arrow.launch_speed = 3500
	self.projectiles.elastic_arrow.adjust_z = -130
	self.projectiles.elastic_arrow.mass_look_up_modifier = 1
	self.projectiles.elastic_arrow.push_at_body_index = 0
	self.projectiles.elastic_arrow_poison = deep_clone(self.projectiles.elastic_arrow)
	self.projectiles.elastic_arrow_poison.damage = 30
	self.projectiles.elastic_arrow_poison.bullet_class = "PoisonBulletBase"
	self.projectiles.elastic_arrow_exp = deep_clone(self.projectiles.elastic_arrow)
	self.projectiles.elastic_arrow_exp.damage = 140
	self.projectiles.elastic_arrow_exp.bullet_class = "InstantExplosiveBulletBase"
	self.projectiles.elastic_arrow_exp.remove_on_impact = true
	self.projectiles.wpn_gre_electric = {}
	self.projectiles.wpn_gre_electric.damage = 60
	self.projectiles.wpn_gre_electric.curve_pow = 3.5
	self.projectiles.wpn_gre_electric.range = 1000
	self.projectiles.wpn_gre_electric.name_id = "bm_electric_grenade"
	self.projectiles.wpn_gre_electric.sound_event = "grenade_electric_explode"
	self.projectiles.launcher_electric = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_electric.launch_speed = 1250
	self.projectiles.launcher_electric.projectile_trail = true
	self.projectiles.launcher_electric.damage = 80
	self.projectiles.launcher_electric.player_damage = 0
	self.projectiles.launcher_electric.curve_pow = 2.5
	self.projectiles.launcher_electric.range = 800
	self.projectiles.launcher_electric.sound_event = "gl_electric_explode"
	self.projectiles.launcher_electric_m32 = deep_clone(self.projectiles.launcher_electric)
	self.projectiles.launcher_electric_m32.damage = 90
	self.projectiles.launcher_electric_m32.sound_event = "gl_electric_explode"
	self.projectiles.launcher_electric_china = deep_clone(self.projectiles.launcher_electric)
	self.projectiles.launcher_electric_china.damage = 56
	self.projectiles.launcher_electric_china.sound_event = "gl_electric_explode"
	self.projectiles.launcher_electric_slap = deep_clone(self.projectiles.launcher_electric)
	self.projectiles.launcher_electric_slap.damage = 90
	self.projectiles.launcher_electric_slap.sound_event = "gl_electric_explode"
	self.projectiles.launcher_electric_arbiter = deep_clone(self.projectiles.launcher_electric)
	self.projectiles.launcher_electric_arbiter.launch_speed = 7000
	self.projectiles.launcher_electric_arbiter.damage = 30
	self.projectiles.launcher_electric_arbiter.sound_event = "gl_electric_explode"
	self.projectiles.underbarrel_electric = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.underbarrel_electric.launch_speed = 1250
	self.projectiles.underbarrel_electric.projectile_trail = true
	self.projectiles.underbarrel_electric.damage = 80
	self.projectiles.underbarrel_electric.player_damage = 0
	self.projectiles.underbarrel_electric.curve_pow = 2.5
	self.projectiles.underbarrel_electric.range = 800
	self.projectiles.underbarrel_electric.sound_event = "gl_electric_explode"
	self.projectiles.underbarrel_electric_groza = deep_clone(self.projectiles.underbarrel_electric)
	self.projectiles.underbarrel_electric_groza.sound_event = "gl_electric_explode"
	self.projectiles.underbarrel_m203_groza = deep_clone(self.projectiles.launcher_m203)
	self.projectiles.xmas_snowball = {}
	self.projectiles.xmas_snowball.damage = 28
	self.projectiles.xmas_snowball.curve_pow = 0.1
	self.projectiles.xmas_snowball.player_damage = 1
	self.projectiles.xmas_snowball.range = 100
	self.projectiles.xmas_snowball.name_id = "bm_grenade_xmas_snowball"
	self.projectiles.xmas_snowball.launch_speed = 1000
	self.projectiles.xmas_snowball.adjust_z = 0
	self.projectiles.xmas_snowball.mass_look_up_modifier = 1
	self.projectiles.xmas_snowball.push_at_body_index = 0
	self.projectiles.xmas_snowball.bullet_class = "InstantSnowballBase"
	self.projectiles.xmas_snowball.remove_on_impact = true
	self.projectiles.xmas_snowball.sound_event = "no_sound"
	self.projectiles.xmas_snowball.sounds = {}
	self.projectiles.xmas_snowball.sounds.flyby = "jav_flyby"
	self.projectiles.xmas_snowball.sounds.flyby_stop = "jav_flyby_stop"
	self.projectiles.xmas_snowball.sounds.impact = "snow_impact_gen"
	self.projectiles.xmas_snowball.effect_name = "effects/payday2/particles/impacts/snowball_impact"
	self.projectiles.xmas_snowball.idstr_decal = Idstring("snow_explosion_std")
	self.projectiles.xmas_snowball.idstr_effect = IDS_EMPTY
	self.projectiles.xmas_snowball.alert_radius = 0
	self.projectiles.poison_gas_grenade = {}
	self.projectiles.poison_gas_grenade.damage = 100
	self.projectiles.poison_gas_grenade.player_damage = 0
	self.projectiles.poison_gas_grenade.curve_pow = 0.1
	self.projectiles.poison_gas_grenade.range = 200
	self.projectiles.poison_gas_grenade.name_id = "bm_poison_gas_grenade"
	self.projectiles.poison_gas_grenade.poison_gas_range = 800
	self.projectiles.poison_gas_grenade.poison_gas_duration = 20
	self.projectiles.poison_gas_grenade.poison_gas_fade_time = 2
	self.projectiles.poison_gas_grenade.poison_gas_tick_time = 0.3
	self.projectiles.poison_gas_grenade.poison_gas_dot_data_name = "proj_gas_grenade_cloud"
	self.projectiles.launcher_poison = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_poison.launch_speed = 1250
	self.projectiles.launcher_poison.projectile_trail = true
	self.projectiles.launcher_poison.damage = 36
	self.projectiles.launcher_poison.player_damage = 0
	self.projectiles.launcher_poison.curve_pow = 2.5
	self.projectiles.launcher_poison.range = 300
	self.projectiles.launcher_poison.sound_event = "gl_electric_explode"
	self.projectiles.launcher_poison.poison_gas_range = 600
	self.projectiles.launcher_poison.poison_gas_duration = 15
	self.projectiles.launcher_poison.poison_gas_fade_time = 2
	self.projectiles.launcher_poison.poison_gas_tick_time = 0.3
	self.projectiles.launcher_poison.poison_gas_dot_data_name = "proj_launcher_cloud"
	self.projectiles.launcher_poison.poison_gas_effect = "effects/particles/explosions/poison_gas"
	self.projectiles.launcher_poison_ms3gl_conversion = deep_clone(self.projectiles.launcher_poison)
	self.projectiles.launcher_poison_ms3gl_conversion.damage = 48
	self.projectiles.launcher_poison_ms3gl_conversion.poison_gas_range = 800
	self.projectiles.launcher_poison_gre_m79 = deep_clone(self.projectiles.launcher_poison)
	self.projectiles.launcher_poison_gre_m79.damage = 120
	self.projectiles.launcher_poison_gre_m79.range = 600
	self.projectiles.launcher_poison_m32 = deep_clone(self.projectiles.launcher_poison)
	self.projectiles.launcher_poison_m32.damage = 120
	self.projectiles.launcher_poison_m32.range = 600
	self.projectiles.launcher_poison_groza = deep_clone(self.projectiles.launcher_poison)
	self.projectiles.launcher_poison_groza.damage = 86
	self.projectiles.launcher_poison_china = deep_clone(self.projectiles.launcher_poison)
	self.projectiles.launcher_poison_china.damage = 86
	self.projectiles.launcher_poison_arbiter = deep_clone(self.projectiles.launcher_poison)
	self.projectiles.launcher_poison_arbiter.damage = 38
	self.projectiles.launcher_poison_arbiter.range = 300
	self.projectiles.launcher_poison_arbiter.launch_speed = 7000
	self.projectiles.launcher_poison_arbiter.curve_pow = 0.1
	self.projectiles.launcher_poison_arbiter.poison_gas_range = 400
	self.projectiles.launcher_poison_arbiter.poison_gas_dot_data_name = "proj_launcher_arbiter_cloud"
	self.projectiles.launcher_poison_slap = deep_clone(self.projectiles.launcher_poison)
	self.projectiles.launcher_poison_slap.damage = 120
	self.projectiles.launcher_poison_slap.range = 600
	self.projectiles.launcher_poison_contraband = deep_clone(self.projectiles.launcher_poison)
	self.projectiles.launcher_poison_contraband.damage = 86
	self.projectiles.launcher_frag_ms3gl = deep_clone(self.projectiles.launcher_frag)
	self.projectiles.launcher_frag_ms3gl.damage = 36
	self.projectiles.launcher_incendiary_ms3gl = deep_clone(self.projectiles.launcher_incendiary)
	self.projectiles.launcher_incendiary_ms3gl.damage = 1
	self.projectiles.launcher_electric_ms3gl = deep_clone(self.projectiles.launcher_electric)
	self.projectiles.launcher_electric_ms3gl.damage = 14
	self.projectiles.launcher_electric_ms3gl.sound_event = "gl_electric_explode"
	self.projectiles.sticky_grenade = {}
	self.projectiles.sticky_grenade.damage = 120
	self.projectiles.sticky_grenade.curve_pow = 0.1
	self.projectiles.sticky_grenade.player_damage = 10
	self.projectiles.sticky_grenade.range = 500
	self.projectiles.sticky_grenade.launch_speed = 500
	self.projectiles.sticky_grenade.in_air_timer = 10
	self.projectiles.sticky_grenade.detonate_timer = 2.5
	self.projectiles.sticky_grenade.sweep_radius = 25
	self.projectiles.sticky_grenade.name_id = "bm_sticky_grenade"
	self.projectiles.sticky_grenade.sounds = {}
	self.projectiles.sticky_grenade.sounds.impact = "grenade_sticky_impact"
	self.projectiles.sticky_grenade.warning_data = {
		play_when_attached = true,
		beep_speeds = {
			0.1,
			0.025
		},
		sound_data = {
			event_name = "grenade_sticky_beep",
			event_stop_name = "grenade_sticky_beep_stop"
		},
		light_data = {
			beep_fade_speed = 4,
			beep_mul = 0.3,
			falloff_exp = 0.5,
			link_to_unit = true,
			range = 300,
			specular_mul = 0.5,
			type_str = "omni|specular",
			color = Vector3(0, 0, 255)
		}
	}
	self.projectiles.dart_poison = {
		adjust_z = -100,
		bullet_class = "PoisonBulletBase",
		damage = 30,
		launch_speed = 2500,
		mass_look_up_modifier = 1.25,
		projectile_trail = true,
		push_at_body_index = 0
	}
	self.projectiles.dart_daze = deep_clone(self.projectiles.dart_poison)
	self.projectiles.dart_daze.damage = 1.2
	self.projectiles.dart_daze.bullet_class = "DazingInstantBulletBase"
	self.projectiles.dart_revive = deep_clone(self.projectiles.dart_poison)
	self.projectiles.dart_revive.damage = 0
	self.projectiles.dart_revive.sweep_radius = 72
	self.projectiles.dart_revive.bullet_class = "ReviveInstantBulletBase"
	self.projectiles.laser_watch = {
		damage = 12,
		name_id = "bm_prj_laser_watch",
		range = 68
	}
	self.projectiles.flun_flare = {
		adjust_z = 0,
		airdrop_unit = "units/pd2_dlc_unk/weapons/wpn_prj_flun_flare_airdrop/wpn_prj_flun_flare_airdrop",
		alert_radius = 5000,
		curve_pow = 0.1,
		damage = 3,
		dot_data_name = "proj_fire_com",
		effect_name = "effects/payday2/particles/explosions/flare_incendiary_explosion_with_flare",
		impact_effect_name = "effects/payday2/particles/explosions/flare_incendiary_explosion",
		launch_speed = 75,
		name_id = "bm_grenade_flun_flare",
		player_damage = 5,
		range = 350,
		sound_event = "white_explosion",
		sounds = {
			flyby = "flare_flyby",
			flyby_stop = "flare_flyby_stop"
		}
	}
	self.voting = {}
	self.voting.timeout = 30
	self.voting.cooldown = 50
	self.voting.restart_delay = 5
	self.tase_data = {}
	self.tase_data.light = {}
	self.tase_data.heavy = {
		duration = 3
	}
	self.quickplay = {}
	self.quickplay.default_level_diff = {
		15,
		15
	}
	self.quickplay.max_level_diff = {
		40,
		40
	}
	self.quickplay.stealth_levels = {}
	self.quickplay.stealth_levels.dark = true
	self.quickplay.stealth_levels.kosugi = true
	self.quickplay.stealth_levels.cage = true
	self.quickplay.stealth_levels.fish = true
	self.quickplay.stealth_levels.tag = true
	self.team_ai = {}
	self.team_ai.stop_action = {}
	self.team_ai.stop_action.delay = 0.8
	self.team_ai.stop_action.distance = 3000
	self.team_ai.stop_action.teleport_distance = 5000
	self.medic = {}
	self.medic.radius = 400
	self.medic.cooldown = 3
	self.spotlights = {}
	self.spotlights.helicopter_1 = {
		tracking_speed = 1.2,
		objects = {
			"g_light_cone",
			"g_spotlight",
			"align_spotlight_effect",
			"ls_spotlight"
		},
		wiggle = {
			ang = {
				2,
				6
			},
			speed = {
				50,
				80
			}
		},
		neutral_direction = Vector3(0, 1, -0.7),
		targetting = {
			body = "a_body",
			search_t = 3,
			slot = 12,
			max_distance = math.pow(4000, 2)
		}
	}
	self.player_turrets = {}
	self.player_turrets.ranc_heavy_machine_gun = {
		assemble_point = "assemble",
		disassemble_into_inactive = true,
		disassemble_point = "disassemble",
		enter_point = "enter",
		interact_assemble = "ranc_hold_assemble_turret",
		interact_deactivate = "ranc_hold_disassemble_turret",
		interact_disassemble = "ranc_hold_disassemble_turret",
		interact_enter = "ranc_hold_enter_turret",
		bullet_objects = {
			amount = 12,
			prefix = "g_bullet_",
			extra_objects = {
				{
					ammo = 170,
					object = "g_bullets_box_1"
				},
				{
					ammo = 140,
					object = "g_bullets_box_2"
				},
				{
					ammo = 110,
					object = "g_bullets_box_3"
				},
				{
					ammo = 80,
					object = "g_bullets_box_4"
				},
				{
					ammo = 50,
					object = "g_bullets_box_5"
				},
				{
					ammo = 20,
					object = "g_bullets_box_6"
				}
			}
		}
	}
	self.promos = PromotionalMenusTweakData:new(self)
	self.vr = TweakDataVR:new(self)

	self:_init_wip_tweak_data()
	self:set_difficulty()

	self.skirmish = SkirmishTweakData:new(self)

	self:set_mode()

	local perpetual_event_func = PerpetualEventManager.get_tweak_func()

	if perpetual_event_func then
		perpetual_event_func(self)
	end

	self:digest_tweak_data()
end

function TweakData:load_movie_list()
	self.movies = {
		{
			duration = "02:15",
			file = "movies/the_end",
			title = "Somewhere in Mexico",
			type = "movie_theater_type_cinematic"
		}
	}

	local has_all_movies = MenuCallbackHandler:has_all_movies()

	if has_all_movies then
		table.insert(self.movies, {
			duration = "07:32",
			file = "movies/offshore1",
			title = "Offshore Payday",
			type = "movie_theater_type_cinematic"
		})
		table.insert(self.movies, {
			duration = "05:20",
			file = "movies/offshore2",
			title = "Rumors and Stories",
			type = "movie_theater_type_cinematic"
		})
	end
end

function TweakData:init_screen_colors()
	self.screen_colors = {}
	self.screen_colors.text = Color(255, 255, 255, 255) / 255
	self.screen_colors.resource = Color(255, 77, 198, 255) / 255
	self.screen_colors.important_1 = Color(255, 255, 51, 51) / 255
	self.screen_colors.important_2 = Color(125, 255, 51, 51) / 255
	self.screen_colors.item_stage_1 = Color(255, 255, 255, 255) / 255
	self.screen_colors.item_stage_2 = Color(255, 89, 115, 128) / 255
	self.screen_colors.item_stage_3 = Color(255, 23, 33, 38) / 255
	self.screen_colors.button_stage_1 = Color(255, 0, 0, 0) / 255
	self.screen_colors.button_stage_2 = Color(255, 77, 198, 255) / 255
	self.screen_colors.button_stage_3 = Color(127, 0, 170, 255) / 255
	self.screen_colors.crimenet_lines = Color(255, 127, 157, 182) / 255
	self.screen_colors.risk = Color(255, 255, 204, 0) / 255
	self.screen_colors.friend_color = Color(255, 41, 204, 122) / 255
	self.screen_colors.regular_color = Color(255, 41, 150, 240) / 255
	self.screen_colors.pro_color = Color(255, 255, 51, 51) / 255
	self.screen_colors.dlc_color = Color(255, 255, 212, 0) / 255
	self.screen_colors.skill_color = Color(255, 77, 198, 255) / 255
	self.screen_colors.ghost_color = Color("4ca6ff")
	self.screen_colors.extra_bonus_color = Color(255, 255, 255, 255) / 255
	self.screen_colors.community_color = Color(255, 59, 174, 254) / 255
	self.screen_colors.challenge_completed_color = Color(255, 255, 168, 0) / 255
	self.screen_colors.stat_maxed = Color("FF00FF")
	self.screen_colors.competitive_color = Color(255, 41, 204, 122) / 255
	self.screen_colors.event_color = Color(255, 255, 145, 0) / 255
	self.screen_colors.infamous_color = Color(1, 0.1, 1)
	self.screen_colors.infamy_color = Color("C864C8")
	self.screen_colors.mutators_color = Color(255, 211, 133, 255) / 255
	self.screen_colors.mutators_color_text = Color(255, 211, 133, 255) / 255
	self.screen_colors.crime_spree_risk = Color(255, 255, 255, 0) / 255
	self.screen_colors.achievement_grey = Color(255, 145, 145, 145) / 255
	self.screen_colors.skirmish_color = Color(255, 255, 85, 30) / 255
	self.screen_colors.dlc_buy_color = Color(255, 255, 168, 0) / 255
	self.screen_colors.heat_cold_color = Color(255, 255, 51, 51) / 255
	self.screen_colors.heat_warm_color = Color("ff7f00")
	self.screen_colors.heat_standard_color = Color(255, 255, 255, 255) / 255
	self.screen_colors.heat_color = self.screen_colors.heat_standard_color
	self.screen_colors.one_down = Color(255, 250, 30, 0) / 255
	self.screen_colors.challenge_title = Color(255, 255, 168, 0) / 255
	self.screen_colors.stats_positive = Color(255, 191, 221, 125) / 255
	self.screen_colors.stats_negative = Color(255, 254, 93, 99) / 255
	self.screen_colors.stats_mods = Color(255, 229, 229, 76) / 255
	self.screen_colors.dark_bg = Color(0.65, 0, 0, 0)

	if Global.test_new_colors then
		local r, g, b = Color.purple:unpack()

		for i, d in pairs(self.screen_colors) do
			self.screen_colors[i].r = r
			self.screen_colors[i].g = g
			self.screen_colors[i].b = b
		end
	end

	if Global.old_colors_purple then
		self.screen_color_white = Color.purple
		self.screen_color_red = Color.purple
		self.screen_color_green = Color.purple
		self.screen_color_grey = Color.purple
		self.screen_color_light_grey = Color.purple
		self.screen_color_blue = Color.purple
		self.screen_color_blue_selected = Color.purple
		self.screen_color_blue_highlighted = Color.purple
		self.screen_color_blue_noselected = Color.purple
		self.screen_color_yellow = Color.purple
		self.screen_color_yellow_selected = Color.purple
		self.screen_color_yellow_noselected = Color.purple
	else
		self.screen_color_white = Color(1, 1, 1)
		self.screen_color_red = Color(0.7137254901960784, 0.24705882352941178, 0.21176470588235294)
		self.screen_color_green = Color(0.12549019607843137, 1, 0.5176470588235295)
		self.screen_color_grey = Color(0.39215686274509803, 0.39215686274509803, 0.39215686274509803)
		self.screen_color_light_grey = Color(0.7843137254901961, 0.7843137254901961, 0.7843137254901961)
		self.screen_color_blue = Color(0.30196078431372547, 0.7764705882352941, 1)
		self.screen_color_blue_selected = Color(0.30196078431372547, 0.7764705882352941, 1)
		self.screen_color_blue_highlighted = self.screen_color_blue_selected:with_alpha(0.75)
		self.screen_color_blue_noselected = self.screen_color_blue_selected:with_alpha(0.5)
		self.screen_color_yellow = Color(0.8627450980392157, 0.6745098039215687, 0.17647058823529413)
		self.screen_color_yellow_selected = Color(1, 0.8, 0)
		self.screen_color_yellow_noselected = Color(0.7333333333333333, 0.42745098039215684, 0.0784313725490196)
	end
end

function TweakData:init_accessibility_colors()
	self.accessibility_colors = {}
	self.accessibility_colors.dot = {}
	self.accessibility_colors.dot.white = Color.white
	self.accessibility_colors.dot.yellow = Color(255, 255, 201, 7) / 255
	self.accessibility_colors.dot.blue = Color(255, 77, 198, 255) / 255
	self.accessibility_colors.dot.green = Color.green
	self.accessibility_colors.screenflash = {}
	self.accessibility_colors.screenflash.flashbang = {}
	self.accessibility_colors.screenflash.hit_flash = {}
	self.accessibility_colors.screenflash.blurzone = {}
	self.accessibility_colors.screenflash.flashbang.default = Color.white
	self.accessibility_colors.screenflash.flashbang.black = Color.black
	self.accessibility_colors.screenflash.flashbang.gray = Color(0.39215686274509803, 0.39215686274509803, 0.39215686274509803)
	self.accessibility_colors.screenflash.flashbang.gray_light = Color(0.7843137254901961, 0.7843137254901961, 0.7843137254901961)
	self.accessibility_colors.screenflash.flashbang.gray_dark = Color(0.19607843137254902, 0.19607843137254902, 0.19607843137254902)
	self.accessibility_colors.screenflash.hit_flash.off = false
	self.accessibility_colors.screenflash.hit_flash.default = Color(255, 255, 201, 7) / 255
	self.accessibility_colors.screenflash.hit_flash.black = Color.black
	self.accessibility_colors.screenflash.hit_flash.gray = Color(0.39215686274509803, 0.39215686274509803, 0.39215686274509803)
	self.accessibility_colors.screenflash.hit_flash.gray_light = Color(0.7843137254901961, 0.7843137254901961, 0.7843137254901961)
	self.accessibility_colors.screenflash.hit_flash.gray_dark = Color(0.19607843137254902, 0.19607843137254902, 0.19607843137254902)
	self.accessibility_colors.screenflash.blurzone.default = Color(255, 255, 201, 7) / 255
	self.accessibility_colors.screenflash.blurzone.black = Color.black
	self.accessibility_colors.screenflash.blurzone.gray = Color(0.39215686274509803, 0.39215686274509803, 0.39215686274509803)
	self.accessibility_colors.screenflash.blurzone.gray_light = Color(0.7843137254901961, 0.7843137254901961, 0.7843137254901961)
	self.accessibility_colors.screenflash.blurzone.gray_dark = Color(0.19607843137254902, 0.19607843137254902, 0.19607843137254902)
end

function TweakData:free_dlc_list()
	local free_dlcs = {}

	return free_dlcs
end

function TweakData:_execute_reload_clbks()
	if self._reload_clbks then
		for key, clbk_data in pairs(self._reload_clbks) do
			if clbk_data.func then
				clbk_data.func(clbk_data.clbk_object)
			end
		end
	end
end

function TweakData:add_reload_callback(object, func)
	self._reload_clbks = self._reload_clbks or {}

	table.insert(self._reload_clbks, {
		clbk_object = object,
		func = func
	})
end

function TweakData:remove_reload_callback(object)
	if self._reload_clbks then
		for i, k in ipairs(self._reload_clbks) do
			if k.clbk_object == object then
				table.remove(self._reload_clbks, i)

				return
			end
		end
	end
end

function TweakData:set_scale()
	local lang_key = SystemInfo:language():key()
	local lang_mods = {
		[Idstring("german"):key()] = {
			kit_desc_large = 0.9,
			large = 0.9,
			level_up_text_kern = -1.5,
			menu_logo_multiplier = 0.9,
			objectives_text_kern = -1,
			sd_large = 0.9,
			sd_menu_border_multiplier = 0.9,
			sd_small = 0.9,
			sd_w_interact_multiplier = 1.55,
			small = 1,
			stats_upgrade_kern = -1,
			w_interact_multiplier = 1.65
		}
	}

	lang_mods[Idstring("french"):key()] = {
		kit_desc_large = 0.9,
		large = 0.9,
		level_up_text_kern = -1.5,
		objectives_text_kern = -0.8,
		sd_large = 0.9,
		sd_level_up_font_multiplier = 0.9,
		sd_small = 0.95,
		sd_w_interact_multiplier = 1.3,
		small = 1,
		stats_upgrade_kern = -1,
		subtitle_multiplier = 0.85,
		victory_screen_kern = -0.5,
		w_interact_multiplier = 1.4
	}
	lang_mods[Idstring("italian"):key()] = {
		kit_desc_large = 0.9,
		large = 1,
		objectives_text_kern = -0.8,
		sd_large = 1,
		sd_small = 1,
		sd_w_interact_multiplier = 1.5,
		small = 1,
		w_interact_multiplier = 1.35
	}
	lang_mods[Idstring("spanish"):key()] = {
		kit_desc_large = 0.9,
		large = 1,
		level_up_text_kern = -1.5,
		menu_logo_multiplier = 0.9,
		objectives_desc_text_kern = 0,
		objectives_text_kern = -0.8,
		sd_large = 1,
		sd_level_up_font_multiplier = 0.9,
		sd_menu_border_multiplier = 0.85,
		sd_small = 0.9,
		sd_w_interact_multiplier = 1.5,
		server_list_font_multiplier = 0.9,
		small = 1,
		stats_upgrade_kern = -1,
		upgrade_menu_kern = -1.25,
		victory_title_multiplier = 0.9,
		w_interact_multiplier = 1.6
	}

	local lang_l_mod = lang_mods[lang_key] and lang_mods[lang_key].large or 1
	local lang_s_mod = lang_mods[lang_key] and lang_mods[lang_key].small or 1
	local lang_lsd_mod = lang_mods[lang_key] and lang_mods[lang_key].sd_large or 1
	local lang_ssd_mod = lang_mods[lang_key] and lang_mods[lang_key].sd_large or 1
	local sd_menu_border_multiplier = lang_mods[lang_key] and lang_mods[lang_key].sd_menu_border_multiplier or 1
	local stats_upgrade_kern = lang_mods[lang_key] and lang_mods[lang_key].stats_upgrade_kern or 0
	local level_up_text_kern = lang_mods[lang_key] and lang_mods[lang_key].level_up_text_kern or 0
	local victory_screen_kern = lang_mods[lang_key] and lang_mods[lang_key].victory_screen_kern
	local upgrade_menu_kern = lang_mods[lang_key] and lang_mods[lang_key].upgrade_menu_kern
	local mugshot_name_kern = lang_mods[lang_key] and lang_mods[lang_key].mugshot_name_kern
	local menu_logo_multiplier = lang_mods[lang_key] and lang_mods[lang_key].menu_logo_multiplier or 1
	local objectives_text_kern = lang_mods[lang_key] and lang_mods[lang_key].objectives_text_kern
	local objectives_desc_text_kern = lang_mods[lang_key] and lang_mods[lang_key].objectives_desc_text_kern
	local kit_desc_large = lang_mods[lang_key] and lang_mods[lang_key].kit_desc_large or 1
	local sd_level_up_font_multiplier = lang_mods[lang_key] and lang_mods[lang_key].sd_level_up_font_multiplier or 1
	local sd_w_interact_multiplier = lang_mods[lang_key] and lang_mods[lang_key].sd_w_interact_multiplier or 1
	local w_interact_multiplier = lang_mods[lang_key] and lang_mods[lang_key].w_interact_multiplier or 1
	local server_list_font_multiplier = lang_mods[lang_key] and lang_mods[lang_key].server_list_font_multiplier or 1
	local victory_title_multiplier = lang_mods[lang_key] and lang_mods[lang_key].victory_title_multiplier
	local subtitle_multiplier = lang_mods[lang_key] and lang_mods[lang_key].subtitle_multiplier or 1
	local res = RenderSettings.resolution

	self.sd_scale = {}
	self.sd_scale.is_sd = true
	self.sd_scale.title_image_multiplier = 0.6
	self.sd_scale.menu_logo_multiplier = 0.575 * menu_logo_multiplier
	self.sd_scale.menu_border_multiplier = 0.6 * sd_menu_border_multiplier
	self.sd_scale.default_font_multiplier = 0.6 * lang_lsd_mod
	self.sd_scale.small_font_multiplier = 0.8 * lang_ssd_mod
	self.sd_scale.lobby_info_font_size_scale_multiplier = 0.65
	self.sd_scale.lobby_name_font_size_scale_multiplier = 0.6
	self.sd_scale.server_list_font_size_multiplier = 0.55
	self.sd_scale.multichoice_arrow_multiplier = 0.7
	self.sd_scale.align_line_padding_multiplier = 0.4
	self.sd_scale.menu_arrow_padding_multiplier = 0.5
	self.sd_scale.briefing_text_h_multiplier = 0.5
	self.sd_scale.experience_bar_multiplier = 0.825
	self.sd_scale.hud_equipment_icon_multiplier = 0.65
	self.sd_scale.hud_default_font_multiplier = 0.7
	self.sd_scale.hud_ammo_clip_multiplier = 0.75
	self.sd_scale.hud_ammo_clip_large_multiplier = 0.5
	self.sd_scale.hud_health_multiplier = 0.75
	self.sd_scale.hud_mugshot_multiplier = 0.75
	self.sd_scale.hud_assault_image_multiplier = 0.5
	self.sd_scale.hud_crosshair_offset_multiplier = 0.75
	self.sd_scale.hud_objectives_pad_multiplier = 0.65
	self.sd_scale.experience_upgrade_multiplier = 0.75
	self.sd_scale.level_up_multiplier = 0.7
	self.sd_scale.next_upgrade_font_multiplier = 0.75
	self.sd_scale.level_up_font_multiplier = 0.51 * sd_level_up_font_multiplier
	self.sd_scale.present_multiplier = 0.75
	self.sd_scale.lobby_info_offset_multiplier = 0.7
	self.sd_scale.info_padding_multiplier = 0.4
	self.sd_scale.loading_challenge_bar_scale = 0.8
	self.sd_scale.kit_menu_bar_scale = 0.65
	self.sd_scale.kit_menu_description_h_scale = 1.22
	self.sd_scale.button_layout_multiplier = 0.7
	self.sd_scale.subtitle_pos_multiplier = 0.7
	self.sd_scale.subtitle_font_multiplier = 0.65
	self.sd_scale.subtitle_lang_multiplier = subtitle_multiplier
	self.sd_scale.default_font_kern = 0
	self.sd_scale.stats_upgrade_kern = stats_upgrade_kern or 0
	self.sd_scale.level_up_text_kern = level_up_text_kern or 0
	self.sd_scale.victory_screen_kern = victory_screen_kern or -0.5
	self.sd_scale.upgrade_menu_kern = upgrade_menu_kern or 0
	self.sd_scale.mugshot_name_kern = mugshot_name_kern or -1
	self.sd_scale.objectives_text_kern = objectives_text_kern or 0
	self.sd_scale.objectives_desc_text_kern = objectives_desc_text_kern or 0
	self.sd_scale.kit_description_multiplier = 0.8 * lang_ssd_mod
	self.sd_scale.chat_multiplier = 0.68
	self.sd_scale.chat_menu_h_multiplier = 0.34
	self.sd_scale.w_interact_multiplier = 0.8 * sd_w_interact_multiplier
	self.sd_scale.victory_title_multiplier = victory_title_multiplier and victory_title_multiplier * 0.95 or 1
	self.scale = {}
	self.scale.is_sd = false
	self.scale.title_image_multiplier = 1
	self.scale.menu_logo_multiplier = 1
	self.scale.menu_border_multiplier = 1
	self.scale.default_font_multiplier = 1 * lang_l_mod
	self.scale.small_font_multiplier = 1 * lang_s_mod
	self.scale.lobby_info_font_size_scale_multiplier = 1 * lang_l_mod
	self.scale.lobby_name_font_size_scale_multiplier = 1 * lang_l_mod
	self.scale.server_list_font_size_multiplier = 1 * lang_l_mod * server_list_font_multiplier
	self.scale.multichoice_arrow_multiplier = 1
	self.scale.align_line_padding_multiplier = 1
	self.scale.menu_arrow_padding_multiplier = 1
	self.scale.briefing_text_h_multiplier = 1 * lang_s_mod
	self.scale.experience_bar_multiplier = 1
	self.scale.hud_equipment_icon_multiplier = 1
	self.scale.hud_default_font_multiplier = 1 * lang_l_mod
	self.scale.hud_ammo_clip_multiplier = 1
	self.scale.hud_health_multiplier = 1
	self.scale.hud_mugshot_multiplier = 1
	self.scale.hud_assault_image_multiplier = 1
	self.scale.hud_crosshair_offset_multiplier = 1
	self.scale.hud_objectives_pad_multiplier = 1
	self.scale.experience_upgrade_multiplier = 1
	self.scale.level_up_multiplier = 1
	self.scale.next_upgrade_font_multiplier = 1 * lang_l_mod
	self.scale.level_up_font_multiplier = 1 * lang_l_mod
	self.scale.present_multiplier = 1
	self.scale.lobby_info_offset_multiplier = 1
	self.scale.info_padding_multiplier = 1
	self.scale.loading_challenge_bar_scale = 1
	self.scale.kit_menu_bar_scale = 1
	self.scale.kit_menu_description_h_scale = 1
	self.scale.button_layout_multiplier = 1
	self.scale.subtitle_pos_multiplier = 1
	self.scale.subtitle_font_multiplier = 1 * lang_l_mod
	self.scale.subtitle_lang_multiplier = subtitle_multiplier
	self.scale.default_font_kern = 0
	self.scale.stats_upgrade_kern = stats_upgrade_kern or 0
	self.scale.level_up_text_kern = 0
	self.scale.victory_screen_kern = victory_screen_kern or 0
	self.scale.upgrade_menu_kern = 0
	self.scale.mugshot_name_kern = 0
	self.scale.objectives_text_kern = objectives_text_kern or 0
	self.scale.objectives_desc_text_kern = objectives_desc_text_kern or 0
	self.scale.kit_description_multiplier = 1 * kit_desc_large
	self.scale.chat_multiplier = 1
	self.scale.chat_menu_h_multiplier = 1
	self.scale.w_interact_multiplier = 1 * w_interact_multiplier
	self.scale.victory_title_multiplier = victory_title_multiplier or 1
end

function TweakData:set_menu_scale()
	local lang_mods_def = {
		[Idstring("german"):key()] = {
			challenges_font_size = 1,
			mission_end_font_size = 1,
			topic_font_size = 0.8,
			upgrades_font_size = 1
		},
		[Idstring("french"):key()] = {
			challenges_font_size = 1,
			mission_end_font_size = 1,
			topic_font_size = 1,
			upgrades_font_size = 1
		},
		[Idstring("italian"):key()] = {
			challenges_font_size = 1,
			mission_end_font_size = 0.95,
			topic_font_size = 1,
			upgrades_font_size = 1
		},
		[Idstring("spanish"):key()] = {
			challenges_font_size = 0.95,
			mission_end_font_size = 1,
			topic_font_size = 0.95,
			upgrades_font_size = 1
		}
	}
	local lang_mods = lang_mods_def[SystemInfo:language():key()] or {
		challenges_font_size = 1,
		mission_end_font_size = 1,
		topic_font_size = 1,
		upgrades_font_size = 1
	}
	local scale_multiplier = self.scale.default_font_multiplier
	local small_scale_multiplier = self.scale.small_font_multiplier

	self.menu.default_font = "fonts/font_medium_shadow_mf"
	self.menu.default_font_no_outline = "fonts/font_medium_noshadow_mf"
	self.menu.default_font_id = Idstring(self.menu.default_font)
	self.menu.default_font_no_outline_id = Idstring(self.menu.default_font_no_outline)
	self.menu.small_font = "fonts/font_small_shadow_mf"
	self.menu.small_font_size = 14 * small_scale_multiplier
	self.menu.small_font_noshadow = "fonts/font_small_noshadow_mf"
	self.menu.medium_font = "fonts/font_medium_shadow_mf"
	self.menu.medium_font_no_outline = "fonts/font_medium_noshadow_mf"
	self.menu.meidum_font_size = 24 * scale_multiplier
	self.menu.eroded_font = "fonts/font_eroded"
	self.menu.eroded_font_size = 80
	self.menu.pd2_massive_font = "fonts/font_large_mf"
	self.menu.pd2_massive_font_id = Idstring(self.menu.pd2_massive_font)
	self.menu.pd2_massive_font_size = 80
	self.menu.pd2_large_font = "fonts/font_large_mf"
	self.menu.pd2_large_font_id = Idstring(self.menu.pd2_large_font)
	self.menu.pd2_large_font_size = 44
	self.menu.pd2_medium_font = "fonts/font_medium_mf"
	self.menu.pd2_medium_font_id = Idstring(self.menu.pd2_medium_font)
	self.menu.pd2_medium_font_size = 24
	self.menu.pd2_small_font = "fonts/font_small_mf"
	self.menu.pd2_small_font_id = Idstring(self.menu.pd2_small_font)
	self.menu.pd2_small_font_size = 20
	self.menu.pd2_tiny_font = "fonts/font_small_mf"
	self.menu.pd2_tiny_font_id = Idstring(self.menu.pd2_tiny_font)
	self.menu.pd2_tiny_font_size = 16
	self.menu.uno_vessel_font = "fonts/font_vessel"
	self.menu.uno_vessel_font_id = Idstring(self.menu.uno_vessel_font)
	self.menu.uno_vessel_font_size = 20
	self.menu.uno_vessel_ext_font = "fonts/font_vessel_ext"
	self.menu.uno_vessel_ext_font_id = Idstring(self.menu.uno_vessel_ext_font)
	self.menu.uno_vessel_ext_font_size = 20
	self.menu.default_font_size = 24 * scale_multiplier
	self.menu.default_font_row_item_color = Color.white
	self.menu.default_hightlight_row_item_color = Color(1, 0, 0, 0)
	self.menu.default_menu_background_color = Color(1, 0.3254901960784314, 0.37254901960784315, 0.396078431372549)
	self.menu.highlight_background_color_left = Color(1, 1, 0.6588235294117647, 0)
	self.menu.highlight_background_color_right = Color(1, 1, 0.6588235294117647, 0)
	self.menu.default_changeable_text_color = Color(255, 77, 198, 255) / 255
	self.menu.default_disabled_text_color = Color(1, 0.5, 0.5, 0.5)
	self.menu.arrow_available = Color(1, 1, 0.6588235294117647, 0)
	self.menu.arrow_unavailable = Color(1, 0.5, 0.5, 0.5)
	self.menu.arrow_unavailable = Color(1, 0.5, 0.5, 0.5)
	self.menu.upgrade_locked_color = Color(0.75, 0, 0)
	self.menu.upgrade_not_aquired_color = Color(0.5, 0.5, 0.5)
	self.menu.awarded_challenge_color = self.menu.default_font_row_item_color
	self.menu.dialog_title_font_size = 28 * self.scale.small_font_multiplier
	self.menu.dialog_text_font_size = 24 * self.scale.small_font_multiplier
	self.menu.info_padding = 10 * self.scale.info_padding_multiplier
	self.menu.topic_font_size = 32 * scale_multiplier * lang_mods.topic_font_size
	self.menu.main_menu_background_color = Color(1, 0, 0, 0)
	self.menu.kit_default_font_size = 24 * scale_multiplier
	self.menu.stats_font_size = 24 * scale_multiplier
	self.menu.customize_controller_size = 21 * scale_multiplier
	self.menu.server_list_font_size = 22 * self.scale.server_list_font_size_multiplier
	self.menu.challenges_font_size = 24 * scale_multiplier * lang_mods.challenges_font_size
	self.menu.upgrades_font_size = 24 * scale_multiplier * lang_mods.upgrades_font_size
	self.menu.multichoice_font_size = 24 * scale_multiplier
	self.menu.mission_end_font_size = 20 * scale_multiplier * lang_mods.mission_end_font_size
	self.menu.sd_mission_end_font_size = 14 * small_scale_multiplier * lang_mods.mission_end_font_size
	self.menu.lobby_info_font_size = 22 * self.scale.lobby_info_font_size_scale_multiplier
	self.menu.lobby_name_font_size = 22 * self.scale.lobby_name_font_size_scale_multiplier
	self.menu.loading_challenge_progress_font_size = 22 * small_scale_multiplier
	self.menu.loading_challenge_name_font_size = 22 * small_scale_multiplier
	self.menu.upper_saferect_border = 64 * self.scale.menu_border_multiplier
	self.menu.border_pad = 8 * self.scale.menu_border_multiplier
	self.menu.kit_description_font_size = 14 * self.scale.kit_description_multiplier
	self.load_level = {}
	self.load_level.briefing_text = {
		h = 192 * self.scale.briefing_text_h_multiplier
	}
	self.load_level.upper_saferect_border = self.menu.upper_saferect_border
	self.load_level.border_pad = self.menu.border_pad
	self.load_level.stonecold_small_logo = "guis/textures/game_small_logo"
end

function TweakData:set_hud_values()
	local lang_mods_def = {
		[Idstring("german"):key()] = {
			active_objective_title_font_size = 0.9,
			hint_font_size = 0.9,
			location_font_size = 1,
			next_player_font_size = 0.85,
			present_mid_text_font_size = 0.8,
			stats_challenges_font_size = 0.7
		},
		[Idstring("french"):key()] = {
			active_objective_title_font_size = 1,
			hint_font_size = 0.825,
			location_font_size = 1,
			next_player_font_size = 0.85,
			present_mid_text_font_size = 1,
			stats_challenges_font_size = 1
		},
		[Idstring("italian"):key()] = {
			active_objective_title_font_size = 1,
			hint_font_size = 1,
			location_font_size = 1,
			next_player_font_size = 0.85,
			present_mid_text_font_size = 1,
			stats_challenges_font_size = 1
		},
		[Idstring("spanish"):key()] = {
			active_objective_title_font_size = 1,
			hint_font_size = 1,
			location_font_size = 0.7,
			next_player_font_size = 0.85,
			present_mid_text_font_size = 1,
			stats_challenges_font_size = 1
		}
	}
	local lang_mods = lang_mods_def[SystemInfo:language():key()] or {
		active_objective_title_font_size = 1,
		hint_font_size = 1,
		location_font_size = 1,
		next_player_font_size = 1,
		present_mid_text_font_size = 1,
		stats_challenges_font_size = 1
	}

	self.hud.medium_font = "fonts/font_medium_mf"
	self.hud.medium_font_noshadow = "fonts/font_medium_mf"
	self.hud.small_font = "fonts/font_small_mf"
	self.hud.small_font_size = 14 * self.scale.small_font_multiplier
	self.hud.location_font_size = 28 * self.scale.hud_default_font_multiplier * lang_mods.location_font_size
	self.hud.assault_title_font_size = 30 * self.scale.hud_default_font_multiplier
	self.hud.default_font_size = 32 * self.scale.hud_default_font_multiplier
	self.hud.present_mid_text_font_size = 32 * self.scale.hud_default_font_multiplier * lang_mods.present_mid_text_font_size
	self.hud.timer_font_size = 40 * self.scale.hud_default_font_multiplier
	self.hud.medium_deafult_font_size = 28 * self.scale.hud_default_font_multiplier
	self.hud.ammo_font_size = 30 * self.scale.hud_default_font_multiplier
	self.hud.weapon_ammo_font_size = 24 * self.scale.hud_default_font_multiplier
	self.hud.name_label_font_size = 24 * self.scale.hud_default_font_multiplier
	self.hud.small_name_label_font_size = 17 * self.scale.hud_default_font_multiplier
	self.hud.equipment_font_size = 24 * self.scale.hud_default_font_multiplier
	self.hud.hint_font_size = 28 * self.scale.hud_default_font_multiplier * lang_mods.hint_font_size
	self.hud.active_objective_title_font_size = 24 * self.scale.hud_default_font_multiplier * lang_mods.active_objective_title_font_size
	self.hud.completed_objective_title_font_size = 20 * self.scale.hud_default_font_multiplier
	self.hud.upgrade_awarded_font_size = 26 * self.scale.hud_default_font_multiplier
	self.hud.next_upgrade_font_size = 14 * self.scale.next_upgrade_font_multiplier
	self.hud.level_up_font_size = 32 * self.scale.level_up_font_multiplier
	self.hud.stats_challenges_font_size = 32 * self.scale.hud_default_font_multiplier * lang_mods.stats_challenges_font_size
	self.hud.chatinput_size = 22 * self.scale.hud_default_font_multiplier
	self.hud.chatoutput_size = 14 * self.scale.small_font_multiplier
	self.hud.prime_color = Color(1, 1, 0.6588235294117647, 0)
	self.hud.suspicion_color = Color(1, 0, 0.4666666666666667, 0.6980392156862745)
	self.hud.detected_color = Color(1, 1, 0.2, 0)
	self.hud.revive_colors = {}
	self.hud.revive_colors[1] = Color(255, 223, 15, 15) / 255
	self.hud.revive_colors[2] = Color(255, 98, 35, 35) / 255
	self.hud.revive_colors[3] = Color(255, 91, 87, 87) / 255
	self.hud.revive_colors[4] = Color(255, 91, 87, 87) / 255
end

function TweakData:_setup_access_cameras()
	self.camera_channels = {
		alpha = true,
		bravo = true,
		charlie = true,
		delta = true,
		default = {
			change_event = "camera_monitor_change",
			enter_event = "camera_monitor_engage",
			id = "default",
			leave_event = "camera_monitor_leave",
			leave_on_hurt = true
		},
		spy_cameras = {
			camera_near_range = 1,
			id = "spy_cameras",
			leave_on_hurt = false
		}
	}
	self.camera_themes = {
		default = {
			noise2_texture = "core/textures/noise",
			noise_texture = "core/textures/noise",
			noise_color = Color.black:with_alpha(0.2),
			noise2_color = Color.black:with_alpha(0.2),
			tint_color = Color.transparent
		},
		spy_camera = {
			noise2_texture = "guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_effect",
			noise_texture = "guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_effect",
			noise_color = Color.black,
			noise2_color = Color.black:with_alpha(0.5),
			tint_color = self.chat_colors[#self.chat_colors]
		}
	}

	for i = 1, #self.chat_colors - 1 do
		local theme_id = "spy_camera_peer_" .. i

		self.camera_themes[theme_id] = clone(self.camera_themes.spy_camera)
		self.camera_themes[theme_id].tint_color = self.chat_colors[i]:with_alpha(0.2)
	end
end

function TweakData:resolution_changed()
	self:set_scale()
	self:set_menu_scale()
	self:set_hud_values()
end

if (not tweak_data or tweak_data.RELOAD) and managers.dlc then
	local reload = tweak_data and tweak_data.RELOAD
	local reload_clbks = tweak_data and tweak_data._reload_clbks

	tweak_data = TweakData:new()
	tweak_data._reload_clbks = reload_clbks

	if reload then
		tweak_data:_execute_reload_clbks()
	end
end

function TweakData:get_controller_help_coords()
	if managers.controller:get_default_wrapper_type() == "pc" or managers.controller:get_default_wrapper_type() == "steam" then
		return false
	end

	local coords = {
		normal = {},
		vehicle = {}
	}

	if IS_PS4 then
		coords.normal.left_thumb = {
			align = "right",
			id = "menu_button_sprint",
			vertical = "top",
			x = 199,
			y = 255
		}
		coords.normal.left = {
			align = "right",
			id = "menu_button_move",
			vertical = "top",
			x = 199,
			y = 280
		}
		coords.normal.right_thumb = {
			align = "left",
			id = "menu_button_melee",
			vertical = "top",
			x = 313,
			y = 255
		}
		coords.normal.right = {
			align = "left",
			id = "menu_button_look",
			vertical = "top",
			x = 313,
			y = 280
		}
		coords.normal.triangle = {
			align = "left",
			id = "menu_button_switch_weapon",
			x = 511,
			y = 104
		}
		coords.normal.circle = {
			align = "left",
			id = "menu_button_crouch",
			x = 511,
			y = 128
		}
		coords.normal.cross = {
			align = "left",
			id = "menu_button_jump",
			x = 511,
			y = 153
		}
		coords.normal.square = {
			align = "left",
			id = "menu_button_reload",
			x = 511,
			y = 181
		}
		coords.normal.r1_trigger = {
			align = "left",
			id = "menu_button_fire_weapon",
			x = 511,
			y = 10
		}
		coords.normal.r2_trigger = {
			align = "left",
			id = "menu_button_shout_and_stop",
			x = 511,
			y = 55
		}
		coords.normal.l1_trigger = {
			align = "right",
			id = "menu_button_aim_down_sight",
			x = 0,
			y = 10
		}
		coords.normal.l2_trigger = {
			align = "right",
			id = "menu_button_deploy",
			x = 0,
			y = 55
		}
		coords.normal.start = {
			align = "right",
			id = "menu_button_ingame_menu",
			vertical = "bottom",
			x = 219,
			y = 0
		}
		coords.normal.back = {
			align = "left",
			id = "menu_button_stats_screen",
			vertical = "bottom",
			x = 328,
			y = 0
		}
		coords.normal.d_left = {
			align = "right",
			id = "menu_button_throw_grenade",
			vertical = "center",
			x = 0,
			y = 128
		}
		coords.normal.d_down = {
			align = "right",
			id = "menu_button_weapon_gadget_bipod",
			vertical = "center",
			x = 0,
			y = 153
		}
		coords.normal.d_right = {
			align = "right",
			id = "menu_button_weapon_firemode",
			vertical = "center",
			x = 0,
			y = 181
		}
		coords.vehicle.left_thumb = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "top",
			x = 199,
			y = 255
		}
		coords.vehicle.left = {
			align = "right",
			id = "menu_button_steering",
			vertical = "top",
			x = 199,
			y = 280
		}
		coords.vehicle.right_thumb = {
			align = "left",
			id = "menu_button_vehicle_rear_camera",
			vertical = "top",
			x = 313,
			y = 255
		}
		coords.vehicle.right = {
			align = "left",
			id = "menu_button_unassigned",
			vertical = "top",
			x = 313,
			y = 280
		}
		coords.vehicle.triangle = {
			align = "left",
			id = "menu_button_unassigned",
			x = 511,
			y = 104
		}
		coords.vehicle.circle = {
			align = "left",
			id = "menu_button_vehicle_shooting_stance",
			x = 511,
			y = 128
		}
		coords.vehicle.cross = {
			align = "left",
			id = "menu_button_handbrake",
			x = 511,
			y = 153
		}
		coords.vehicle.square = {
			align = "left",
			id = "menu_button_vehicle_change_camera",
			x = 511,
			y = 181
		}
		coords.vehicle.r1_trigger = {
			align = "left",
			id = "menu_button_accelerate",
			x = 511,
			y = 10
		}
		coords.vehicle.r2_trigger = {
			align = "left",
			id = "menu_button_vehicle_exit",
			x = 511,
			y = 55
		}
		coords.vehicle.l1_trigger = {
			align = "right",
			id = "menu_button_brake",
			x = 0,
			y = 10
		}
		coords.vehicle.l2_trigger = {
			align = "right",
			id = "menu_button_unassigned",
			x = 0,
			y = 55
		}
		coords.vehicle.start = {
			align = "right",
			id = "menu_button_ingame_menu",
			vertical = "bottom",
			x = 219,
			y = 0
		}
		coords.vehicle.back = {
			align = "left",
			id = "menu_button_stats_screen",
			vertical = "bottom",
			x = 328,
			y = 0
		}
		coords.vehicle.d_left = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "center",
			x = 0,
			y = 128
		}
		coords.vehicle.d_down = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "center",
			x = 0,
			y = 153
		}
		coords.vehicle.d_right = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "center",
			x = 0,
			y = 181
		}
	elseif IS_XB1 then
		coords.normal.left_thumb = {
			align = "right",
			id = "menu_button_sprint",
			vertical = "bottom",
			x = 0,
			y = 78
		}
		coords.normal.left = {
			align = "right",
			id = "menu_button_move",
			vertical = "top",
			x = 0,
			y = 78
		}
		coords.normal.right_thumb = {
			align = "center",
			id = "menu_button_melee",
			vertical = "top",
			x = 302,
			y = 276
		}
		coords.normal.right = {
			align = "center",
			id = "menu_button_look",
			vertical = "top",
			x = 302,
			y = 301
		}
		coords.normal.y = {
			align = "left",
			id = "menu_button_switch_weapon",
			x = 512,
			y = 57
		}
		coords.normal.x = {
			align = "left",
			id = "menu_button_reload",
			x = 512,
			y = 140
		}
		coords.normal.b = {
			align = "left",
			id = "menu_button_crouch",
			x = 512,
			y = 85
		}
		coords.normal.a = {
			align = "left",
			id = "menu_button_jump",
			x = 512,
			y = 113
		}
		coords.normal.right_shoulder = {
			align = "center",
			id = "menu_button_shout_and_stop",
			x = 390,
			y = -10
		}
		coords.normal.right_trigger = {
			align = "left",
			id = "menu_button_fire_weapon",
			x = 512,
			y = 18
		}
		coords.normal.left_shoulder = {
			align = "right",
			id = "menu_button_deploy",
			x = 180,
			y = -10
		}
		coords.normal.left_trigger = {
			align = "right",
			id = "menu_button_aim_down_sight",
			x = 0,
			y = 18
		}
		coords.normal.start = {
			align = "left",
			id = "menu_button_ingame_menu",
			vertical = "bottom",
			x = 288,
			y = -25
		}
		coords.normal.back = {
			align = "right",
			id = "menu_button_stats_screen",
			vertical = "bottom",
			x = 235,
			y = -25
		}
		coords.normal.d_down = {
			align = "right",
			id = "menu_button_weapon_gadget_bipod",
			vertical = "center",
			x = 0,
			y = 193
		}
		coords.normal.d_left = {
			align = "right",
			id = "menu_button_throw_grenade",
			vertical = "center",
			x = 0,
			y = 158
		}
		coords.normal.d_right = {
			align = "right",
			id = "menu_button_weapon_firemode",
			vertical = "center",
			x = 270,
			y = 266
		}
		coords.vehicle.left_thumb = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "bottom",
			x = 0,
			y = 78
		}
		coords.vehicle.left = {
			align = "right",
			id = "menu_button_steering",
			vertical = "top",
			x = 0,
			y = 78
		}
		coords.vehicle.right_thumb = {
			align = "center",
			id = "menu_button_vehicle_rear_camera",
			vertical = "top",
			x = 302,
			y = 276
		}
		coords.vehicle.right = {
			align = "center",
			id = "menu_button_unassigned",
			vertical = "top",
			x = 302,
			y = 301
		}
		coords.vehicle.y = {
			align = "left",
			id = "menu_button_unassigned",
			x = 512,
			y = 57
		}
		coords.vehicle.x = {
			align = "left",
			id = "menu_button_vehicle_change_camera",
			x = 512,
			y = 140
		}
		coords.vehicle.b = {
			align = "left",
			id = "menu_button_vehicle_shooting_stance",
			x = 512,
			y = 85
		}
		coords.vehicle.a = {
			align = "left",
			id = "menu_button_handbrake",
			x = 512,
			y = 113
		}
		coords.vehicle.right_shoulder = {
			align = "center",
			id = "menu_button_vehicle_exit",
			x = 390,
			y = -10
		}
		coords.vehicle.right_trigger = {
			align = "left",
			id = "menu_button_accelerate",
			x = 512,
			y = 18
		}
		coords.vehicle.left_shoulder = {
			align = "right",
			id = "menu_button_unassigned",
			x = 180,
			y = -10
		}
		coords.vehicle.left_trigger = {
			align = "right",
			id = "menu_button_brake",
			x = 0,
			y = 18
		}
		coords.vehicle.start = {
			align = "left",
			id = "menu_button_ingame_menu",
			vertical = "bottom",
			x = 288,
			y = -25
		}
		coords.vehicle.back = {
			align = "right",
			id = "menu_button_stats_screen",
			vertical = "bottom",
			x = 235,
			y = -25
		}
		coords.vehicle.d_down = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "center",
			x = 0,
			y = 193
		}
		coords.vehicle.d_left = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "center",
			x = 0,
			y = 158
		}
		coords.vehicle.d_right = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "center",
			x = 270,
			y = 266
		}
	else
		coords.normal.left_thumb = {
			align = "right",
			id = "menu_button_sprint",
			vertical = "bottom",
			x = 0,
			y = 138
		}
		coords.normal.left = {
			align = "right",
			id = "menu_button_move",
			vertical = "top",
			x = 0,
			y = 138
		}
		coords.normal.right_thumb = {
			align = "left",
			id = "menu_button_melee",
			vertical = "top",
			x = 302,
			y = 256
		}
		coords.normal.right = {
			align = "left",
			id = "menu_button_look",
			vertical = "top",
			x = 302,
			y = 281
		}
		coords.normal.y = {
			align = "left",
			id = "menu_button_switch_weapon",
			x = 512,
			y = 97
		}
		coords.normal.x = {
			align = "left",
			id = "menu_button_reload",
			x = 512,
			y = 180
		}
		coords.normal.b = {
			align = "left",
			id = "menu_button_crouch",
			x = 512,
			y = 125
		}
		coords.normal.a = {
			align = "left",
			id = "menu_button_jump",
			x = 512,
			y = 153
		}
		coords.normal.right_shoulder = {
			align = "left",
			id = "menu_button_shout_and_stop",
			x = 512,
			y = 49
		}
		coords.normal.right_trigger = {
			align = "left",
			id = "menu_button_fire_weapon",
			x = 512,
			y = 19
		}
		coords.normal.left_shoulder = {
			align = "right",
			id = "menu_button_deploy",
			x = 0,
			y = 49
		}
		coords.normal.left_trigger = {
			align = "right",
			id = "menu_button_aim_down_sight",
			x = 0,
			y = 19
		}
		coords.normal.start = {
			align = "left",
			id = "menu_button_ingame_menu",
			vertical = "bottom",
			x = 288,
			y = 0
		}
		coords.normal.back = {
			align = "right",
			id = "menu_button_stats_screen",
			vertical = "bottom",
			x = 223,
			y = 0
		}
		coords.normal.d_down = {
			align = "right",
			id = "menu_button_weapon_gadget_bipod",
			vertical = "center",
			x = 0,
			y = 243
		}
		coords.normal.d_left = {
			align = "right",
			id = "menu_button_throw_grenade",
			vertical = "center",
			x = 0,
			y = 208
		}
		coords.normal.d_right = {
			align = "right",
			id = "menu_button_weapon_firemode",
			vertical = "top",
			x = 226,
			y = 256
		}

		if IS_PC then
			coords.normal.d_up = {
				align = "right",
				id = "menu_button_push_to_talk",
				vertical = "center",
				x = 0,
				y = 174
			}
		end

		coords.vehicle.left_thumb = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "bottom",
			x = 0,
			y = 138
		}
		coords.vehicle.left = {
			align = "right",
			id = "menu_button_steering",
			vertical = "top",
			x = 0,
			y = 138
		}
		coords.vehicle.right_thumb = {
			align = "left",
			id = "menu_button_vehicle_rear_camera",
			vertical = "top",
			x = 302,
			y = 256
		}
		coords.vehicle.right = {
			align = "left",
			id = "menu_button_unassigned",
			vertical = "top",
			x = 302,
			y = 281
		}
		coords.vehicle.y = {
			align = "left",
			id = "menu_button_unassigned",
			x = 512,
			y = 97
		}
		coords.vehicle.x = {
			align = "left",
			id = "menu_button_vehicle_change_camera",
			x = 512,
			y = 180
		}
		coords.vehicle.b = {
			align = "left",
			id = "menu_button_vehicle_shooting_stance",
			x = 512,
			y = 125
		}
		coords.vehicle.a = {
			align = "left",
			id = "menu_button_handbrake",
			x = 512,
			y = 153
		}
		coords.vehicle.right_shoulder = {
			align = "left",
			id = "menu_button_vehicle_exit",
			x = 512,
			y = 49
		}
		coords.vehicle.right_trigger = {
			align = "left",
			id = "menu_button_accelerate",
			x = 512,
			y = 19
		}
		coords.vehicle.left_shoulder = {
			align = "right",
			id = "menu_button_unassigned",
			x = 0,
			y = 49
		}
		coords.vehicle.left_trigger = {
			align = "right",
			id = "menu_button_brake",
			x = 0,
			y = 19
		}
		coords.vehicle.start = {
			align = "left",
			id = "menu_button_ingame_menu",
			vertical = "bottom",
			x = 288,
			y = 0
		}
		coords.vehicle.back = {
			align = "right",
			id = "menu_button_stats_screen",
			vertical = "bottom",
			x = 223,
			y = 0
		}
		coords.vehicle.d_down = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "center",
			x = 0,
			y = 243
		}
		coords.vehicle.d_left = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "center",
			x = 0,
			y = 208
		}
		coords.vehicle.d_right = {
			align = "right",
			id = "menu_button_unassigned",
			vertical = "top",
			x = 226,
			y = 256
		}

		if IS_PC then
			coords.vehicle.d_up = {
				align = "right",
				id = "menu_button_unassigned",
				vertical = "center",
				x = 0,
				y = 174
			}
		end
	end

	if managers.user and managers.user:get_setting("southpaw") then
		local tmp = coords.normal.left.id

		coords.normal.left.id = coords.normal.right.id
		coords.normal.right.id = tmp
	end

	return coords
end
