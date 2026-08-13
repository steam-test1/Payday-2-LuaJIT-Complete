CustomSafehouseTweakData = CustomSafehouseTweakData or class()

function CustomSafehouseTweakData:init(tweak_data)
	self.prices = {}
	self.prices.rooms = {
		0,
		12,
		24
	}
	self.prices.weapon_mod = 6
	self.prices.event_weapon_mod = 18
	self.prices.crew_boost = 2
	self.prices.crew_ability = 6
	self.rewards = {}
	self.rewards.initial = self.prices.rooms[2] * 1
	self.rewards.challenge = 6
	self.rewards.daily_complete = 6
	self.rewards.raid = 6
	self.rewards.experience_ratio = 1000000
	self.level_limit = 25

	self:_init_heisters(tweak_data)
	self:_init_safehouse_contractors(tweak_data)
	self:_init_safehouse_rooms(tweak_data)
	self:_init_trophies(tweak_data)
	self:_init_dailies(tweak_data)
	self:_init_map(tweak_data)
	self:_init_uno()

	self.daily_redirects = {
		daily_sewers = "daily_helicopter",
		daily_tapes = "daily_spacetime"
	}
end

function CustomSafehouseTweakData:_init_heisters(tweak_data)
	self.heisters = {}
	self.heisters.base = {}
	self.heisters.base.idle_line_dist = 500
	self.heisters.base.idle_line_time = {
		15,
		20
	}
	self.heisters.base.answer_lines = {
		{
			priority = 0,
			sound_event = "Play_{voice}_answering"
		}
	}
	self.heisters.base.idle_lines = {
		{
			priority = 0,
			sound_event = "Play_{voice}_idle"
		}
	}
	self.heisters.dallas = clone(self.heisters.base)
	self.heisters.dallas.character_material = "var_mtr_dallas"
	self.heisters.dallas.voice = self:get_voice(tweak_data, "russian")
	self.heisters.chains = clone(self.heisters.base)
	self.heisters.chains.character_material = "var_mtr_chains"
	self.heisters.chains.voice = self:get_voice(tweak_data, "spanish")
	self.heisters.hoxton = clone(self.heisters.base)
	self.heisters.hoxton.character_material = "var_mtr_hoxton"
	self.heisters.hoxton.voice = self:get_voice(tweak_data, "american")
	self.heisters.hoxton.answer_lines = {
		{
			priority = 0,
			sound_event = "Play_{voice}_answering"
		},
		{
			priority = 10,
			sound_event = "Play_{voice}_answering_longfellow",
			requirements = {
				tiers = {
					3
				},
				trophies = {
					"trophy_longfellow"
				}
			}
		}
	}
	self.heisters.wolf = clone(self.heisters.base)
	self.heisters.wolf.character_material = "var_mtr_wolf"
	self.heisters.wolf.voice = self:get_voice(tweak_data, "german")
	self.heisters.jowi = clone(self.heisters.base)
	self.heisters.jowi.character_material = "var_mtr_john_wick"
	self.heisters.jowi.voice = self:get_voice(tweak_data, "jowi")
	self.heisters.old_hoxton = clone(self.heisters.base)
	self.heisters.old_hoxton.character_material = "var_mtr_old_hoxton"
	self.heisters.old_hoxton.voice = self:get_voice(tweak_data, "old_hoxton")
	self.heisters.clover = clone(self.heisters.base)
	self.heisters.clover.character_material = "var_mtr_fem1"
	self.heisters.clover.voice = self:get_voice(tweak_data, "female_1")
	self.heisters.dragan = clone(self.heisters.base)
	self.heisters.dragan.character_material = "var_mtr_dragan"
	self.heisters.dragan.voice = self:get_voice(tweak_data, "dragan")
	self.heisters.dragan.anim_lines = {
		{
			anim_value = "talking_on_phone",
			line_type = "idle",
			sound_event = "Play_{voice}_idle_phone"
		}
	}
	self.heisters.dragan.anim_blocks = {
		{
			anim_value = "talking_on_phone",
			block = "answering"
		}
	}
	self.heisters.dragan.idle_limit = 1
	self.heisters.jacket = clone(self.heisters.base)
	self.heisters.jacket.character_material = "var_mtr_jacket"
	self.heisters.jacket.voice = self:get_voice(tweak_data, "jacket")
	self.heisters.bonnie = clone(self.heisters.base)
	self.heisters.bonnie.character_material = "var_mtr_bonnie"
	self.heisters.bonnie.voice = self:get_voice(tweak_data, "bonnie")
	self.heisters.sokol = clone(self.heisters.base)
	self.heisters.sokol.character_material = "var_mtr_sokol"
	self.heisters.sokol.voice = self:get_voice(tweak_data, "sokol")
	self.heisters.dragon = clone(self.heisters.base)
	self.heisters.dragon.character_material = "var_mtr_jiro"
	self.heisters.dragon.voice = self:get_voice(tweak_data, "dragon")
	self.heisters.dragon.answer_lines = {
		{
			priority = 0,
			sound_event = "Play_{voice}_answering"
		},
		{
			priority = 100,
			sound_event = "Play_{voice}_answering_glace",
			requirements = {
				trophies = {
					"trophy_glace_completion"
				}
			}
		}
	}
	self.heisters.dragon.idle_lines = {
		{
			priority = 0,
			sound_event = "Play_{voice}_idle"
		},
		{
			priority = 100,
			sound_event = "Play_{voice}_idle_glace",
			requirements = {
				trophies = {
					"trophy_glace_completion"
				}
			}
		}
	}
	self.heisters.bodhi = clone(self.heisters.base)
	self.heisters.bodhi.character_material = "var_mtr_bodhi"
	self.heisters.bodhi.voice = self:get_voice(tweak_data, "bodhi")
	self.heisters.jimmy = clone(self.heisters.base)
	self.heisters.jimmy.character_material = "var_mtr_jimmy"
	self.heisters.jimmy.voice = self:get_voice(tweak_data, "jimmy")
	self.heisters.sydney = clone(self.heisters.base)
	self.heisters.sydney.character_material = "var_mtr_sydney"
	self.heisters.sydney.voice = self:get_voice(tweak_data, "sydney")
	self.heisters.wild = clone(self.heisters.base)
	self.heisters.wild.character_material = "var_mtr_wild"
	self.heisters.wild.voice = self:get_voice(tweak_data, "wild")
	self.heisters.terry = clone(self.heisters.base)
	self.heisters.terry.character_material = "var_mtr_terry"
	self.heisters.terry.voice = self:get_voice(tweak_data, "chico")
	self.heisters.max = clone(self.heisters.base)
	self.heisters.max.character_material = "var_mtr_max"
	self.heisters.max.voice = self:get_voice(tweak_data, "max")
	self.heisters.joy = clone(self.heisters.base)
	self.heisters.joy.character_material = "var_mtr_joy"
	self.heisters.joy.voice = self:get_voice(tweak_data, "joy")
	self.heisters.myh = clone(self.heisters.base)
	self.heisters.myh.character_material = "var_mtr_myh"
	self.heisters.myh.voice = self:get_voice(tweak_data, "myh")
	self.heisters.ecp_female = clone(self.heisters.base)
	self.heisters.ecp_female.character_material = "var_mtr_ecp_female"
	self.heisters.ecp_female.voice = self:get_voice(tweak_data, "ecp_female")
	self.heisters.ecp_male = clone(self.heisters.base)
	self.heisters.ecp_male.character_material = "var_mtr_ecp_male"
	self.heisters.ecp_male.voice = self:get_voice(tweak_data, "ecp_male")
	self.heisters.butler = clone(self.heisters.base)
	self.heisters.butler.character_material = ""
	self.heisters.vlad = clone(self.heisters.base)
	self.heisters.vlad.voice = "rb1"
	self.heisters.vlad.idle_offset = 20
end

function CustomSafehouseTweakData:get_voice(tweak_data, character_name)
	for i, data in ipairs(tweak_data.criminals.characters) do
		if data.name == character_name then
			return data.static_data.voice
		end
	end
end

function CustomSafehouseTweakData:_init_safehouse_contractors(tweak_data)
	local heister_weighting = 98 / #tweak_data.criminals.character_names
	local butler_weighting = 2

	self.contractors = {}

	table.insert(self.contractors, {
		character = "russian",
		character_name = "dallas",
		image_name = "dallas",
		name_id = "menu_russian",
		weighting = heister_weighting,
		dailies = {
			"daily_classics",
			"daily_discord"
		}
	})
	table.insert(self.contractors, {
		character = "spanish",
		character_name = "chains",
		image_name = "chains",
		name_id = "menu_spanish",
		weighting = heister_weighting,
		dailies = {
			"daily_grenades",
			"daily_phobia"
		}
	})
	table.insert(self.contractors, {
		character = "german",
		character_name = "wolf",
		image_name = "wolf",
		name_id = "menu_german",
		weighting = heister_weighting,
		dailies = {
			"daily_fwtd",
			"daily_gears"
		}
	})
	table.insert(self.contractors, {
		character = "american",
		character_name = "houston",
		image_name = "houston",
		name_id = "menu_american",
		weighting = heister_weighting,
		dailies = {
			"daily_mortage",
			"daily_art"
		}
	})
	table.insert(self.contractors, {
		character = "old_hoxton",
		image_name = "hoxton",
		name_id = "menu_old_hoxton",
		weighting = heister_weighting,
		dailies = {
			"daily_spacetime",
			"daily_tapes"
		}
	})
	table.insert(self.contractors, {
		character = "jowi",
		image_name = "john",
		name_id = "menu_jowi",
		weighting = heister_weighting,
		dailies = {
			"daily_akimbo",
			"daily_professional"
		}
	})
	table.insert(self.contractors, {
		character = "female_1",
		character_name = "clover",
		image_name = "clover",
		name_id = "menu_clover",
		weighting = heister_weighting,
		dailies = {
			"daily_toast",
			"daily_heirloom"
		}
	})
	table.insert(self.contractors, {
		character = "dragan",
		image_name = "dragan",
		name_id = "menu_dragan",
		weighting = heister_weighting,
		dailies = {
			"daily_sewers",
			"daily_helicopter"
		}
	})
	table.insert(self.contractors, {
		character = "jacket",
		image_name = "jacket",
		name_id = "menu_jacket",
		weighting = heister_weighting,
		dailies = {
			"daily_night_out",
			"daily_secret_identity"
		}
	})
	table.insert(self.contractors, {
		character = "sokol",
		image_name = "sokol",
		name_id = "menu_sokol",
		weighting = heister_weighting,
		dailies = {
			"daily_rush",
			"daily_naked"
		}
	})
	table.insert(self.contractors, {
		character = "bonnie",
		image_name = "bonnie",
		name_id = "menu_bonnie",
		weighting = heister_weighting,
		dailies = {
			"daily_lodsofemone",
			"daily_hangover"
		}
	})
	table.insert(self.contractors, {
		character = "dragon",
		image_name = "jiro",
		name_id = "menu_dragon",
		weighting = heister_weighting,
		dailies = {
			"daily_honorable",
			"daily_ninja"
		}
	})
	table.insert(self.contractors, {
		character = "bodhi",
		image_name = "bodhi",
		name_id = "menu_bodhi",
		weighting = heister_weighting,
		dailies = {
			"daily_cake",
			"daily_my_bodhi_is_ready"
		}
	})
	table.insert(self.contractors, {
		character = "jimmy",
		image_name = "jimmy",
		name_id = "menu_jimmy",
		weighting = heister_weighting,
		dailies = {
			"daily_tasty",
			"daily_candy"
		}
	})
	table.insert(self.contractors, {
		character = "sydney",
		image_name = "sydney",
		name_id = "menu_sydney",
		weighting = heister_weighting,
		dailies = {
			"daily_dosh",
			"daily_snake"
		}
	})
	table.insert(self.contractors, {
		character = "wild",
		image_name = "rust",
		name_id = "menu_wild",
		weighting = heister_weighting,
		dailies = {
			"daily_coke_run",
			"daily_whats_stealth"
		}
	})
	table.insert(self.contractors, {
		character = "terry",
		image_name = "terry",
		name_id = "menu_terry",
		weighting = 0,
		dailies = {}
	})
	table.insert(self.contractors, {
		character = "butler",
		name_id = "menu_butler",
		weighting = butler_weighting,
		dailies = {}
	})
end

function CustomSafehouseTweakData:_init_safehouse_rooms(tweak_data)
	self.rooms = {}

	table.insert(self.rooms, {
		help_id = "menu_cs_help_dallas",
		name_id = "menu_russian",
		room_id = "russian",
		tier_max = 3,
		title_id = "menu_cs_title_dallas",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_dallas_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_dallas_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_dallas_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_chains",
		name_id = "menu_spanish",
		room_id = "spanish",
		tier_max = 3,
		title_id = "menu_cs_title_chains",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_chains_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_chains_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_chains_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_wolf",
		name_id = "menu_german",
		room_id = "german",
		tier_max = 3,
		title_id = "menu_cs_title_wolf",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_wolf_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_wolf_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_wolf_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_houston",
		name_id = "menu_american",
		room_id = "american",
		tier_max = 3,
		title_id = "menu_cs_title_houston",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_houston_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_houston_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_houston_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_hoxton",
		name_id = "menu_old_hoxton",
		room_id = "old_hoxton",
		tier_max = 3,
		title_id = "menu_cs_title_hoxton",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_hoxton_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_hoxton_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_hoxton_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_jowi",
		name_id = "menu_cs_shooting_range",
		room_id = "jowi",
		tier_max = 3,
		title_id = "menu_cs_title_jowi",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_wick_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_wick_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_wick_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_clover",
		name_id = "menu_clover",
		room_id = "clover",
		tier_max = 3,
		title_id = "menu_cs_title_clover",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_clover_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_clover_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_clover_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_dragan",
		name_id = "menu_dragan",
		room_id = "dragan",
		tier_max = 3,
		title_id = "menu_cs_title_dragan",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_dragan_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_dragan_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_dragan_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_jacket",
		name_id = "menu_jacket",
		room_id = "jacket",
		tier_max = 3,
		title_id = "menu_cs_title_jacket",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_jacket_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_jacket_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_jacket_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_sokol",
		name_id = "menu_sokol",
		room_id = "sokol",
		tier_max = 3,
		title_id = "menu_cs_title_sokol",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_sokol_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_sokol_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_sokol_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_bonnie",
		name_id = "menu_bonnie",
		room_id = "bonnie",
		tier_max = 3,
		title_id = "menu_cs_title_bonnie",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_bonnie_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_bonnie_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_bonnie_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_dragon",
		name_id = "menu_dragon",
		room_id = "dragon",
		tier_max = 3,
		title_id = "menu_cs_title_dragon",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_jiro_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_jiro_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_jiro_lvl3"
		}
	})
	table.insert(self.rooms, {
		dlc = "rvd",
		help_id = "menu_cs_help_bodhi",
		name_id = "menu_bodhi",
		room_id = "bodhi",
		tier_max = 3,
		title_id = "menu_cs_title_bodhi",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_bodhi_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_bodhi_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_bodhi_lvl3"
		}
	})
	table.insert(self.rooms, {
		dlc = "mad",
		help_id = "menu_cs_help_jimmy",
		name_id = "menu_jimmy",
		room_id = "jimmy",
		tier_max = 3,
		title_id = "menu_cs_title_jimmy",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_jimmy_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_jimmy_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_jimmy_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_sydney",
		name_id = "menu_sydney",
		room_id = "sydney",
		tier_max = 3,
		title_id = "menu_cs_title_sydney",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_sydney_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_sydney_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_sydney_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_rust",
		name_id = "menu_wild",
		room_id = "wild",
		tier_max = 3,
		title_id = "menu_cs_title_rust",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_rust_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_rust_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_rust_lvl3"
		}
	})
	table.insert(self.rooms, {
		dlc = "chico",
		help_id = "menu_cs_help_terry",
		name_id = "menu_terry",
		room_id = "terry",
		tier_max = 3,
		title_id = "menu_cs_title_terry",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_scarface_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_scarface_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_scarface_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_max",
		name_id = "menu_max",
		room_id = "max",
		tier_max = 3,
		title_id = "menu_cs_title_max",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_max_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_max_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_max_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_joy",
		name_id = "menu_joy",
		room_id = "joy",
		tier_max = 3,
		title_id = "menu_cs_title_joy",
		images = {
			"guis/dlcs/joy/textures/pd2/rooms/safehouse_room_preview_joy_lvl1",
			"guis/dlcs/joy/textures/pd2/rooms/safehouse_room_preview_joy_lvl2",
			"guis/dlcs/joy/textures/pd2/rooms/safehouse_room_preview_joy_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_myh",
		name_id = "menu_myh",
		room_id = "myh",
		tier_max = 3,
		title_id = "menu_cs_title_myh",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_duke_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_duke_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_duke_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_ecp",
		name_id = "menu_ecp",
		room_id = "ecp",
		tier_max = 3,
		title_id = "menu_cs_title_ecp",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_ecp_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_ecp_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_ecp_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_vault",
		name_id = "menu_cs_vault",
		room_id = "vault",
		tier_max = 3,
		title_id = "menu_cs_title_vault",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_vault_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_vault_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_vault_lvl3"
		}
	})
	table.insert(self.rooms, {
		help_id = "menu_cs_help_common_room",
		name_id = "menu_cs_common_room",
		room_id = "livingroom",
		tier_max = 3,
		title_id = "menu_cs_title_common_room",
		images = {
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_common_rooms_lvl1",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_common_rooms_lvl2",
			"guis/dlcs/chill/textures/pd2/rooms/safehouse_room_preview_common_rooms_lvl3"
		}
	})
end

function CustomSafehouseTweakData:_create_objective(data)
	local save_values = {
		"achievement_id",
		"progress_id",
		"completed",
		"progress"
	}

	if data.save_values then
		for idx, value in ipairs(data.save_values) do
			table.insert(save_values, value)
		end
	end

	local obj = {
		completed = false,
		displayed = true,
		progress = 0,
		achievement_id = data.achievement_id,
		name_id = data.name_id,
		desc_id = data.desc_id,
		progress_id = data.progress_id,
		max_progress = data.progress_id and data.max_progress or 1,
		verify = data.verify,
		save_values = save_values
	}

	return obj
end

function CustomSafehouseTweakData:_achievement(achievement_id, data)
	data = data or {}
	data.achievement_id = achievement_id

	return self:_create_objective(data)
end

function CustomSafehouseTweakData:_progress(progress_id, max_progress, data)
	data = data or {}
	data.progress_id = progress_id
	data.max_progress = max_progress or 1

	return self:_create_objective(data)
end

function CustomSafehouseTweakData:_init_trophies(tweak_data)
	self.trophies = {}

	table.insert(self.trophies, {
		desc_id = "trophy_falcogini_desc",
		id = "trophy_falcogini",
		image_id = "safehouse_trophies_preview_falcogini",
		name_id = "trophy_falcogini",
		objective_id = "trophy_falcogini_objective",
		objectives = {
			self:_progress("trophy_car_shop", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_dartboard_desc",
		id = "trophy_dartboard",
		image_id = "safehouse_trophies_preview_dartboard",
		name_id = "trophy_dartboard",
		objective_id = "trophy_dartboard_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_headshots", 500, {
				name_id = "trophy_dartboard_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_hockey_team_desc",
		id = "trophy_hockey_team",
		image_id = "safehouse_trophies_preview_hockey_team",
		name_id = "trophy_hockey_team",
		objective_id = "trophy_hockey_team_objective",
		objectives = {
			self:_achievement("the_first_line")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_escape_van_desc",
		id = "trophy_escape_van",
		image_id = "safehouse_trophies_preview_escape_van",
		name_id = "trophy_escape_van",
		objective_id = "trophy_escape_van_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_escapes", 10, {
				name_id = "trophy_escape_van_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_meth_cookbook_desc",
		id = "trophy_meth_cookbook",
		image_id = "safehouse_trophies_preview_meth_cookbook",
		name_id = "trophy_meth_cookbook",
		objective_id = "trophy_meth_cookbook_objective",
		objectives = {
			self:_achievement("voff_5")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_diamonds_desc",
		id = "trophy_diamonds",
		image_id = "safehouse_trophies_preview_diamonds",
		name_id = "trophy_diamonds",
		objective_id = "trophy_diamonds_objective",
		objectives = {
			self:_progress("trophy_diamond_store_heist", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_stealth_desc",
		id = "trophy_stealth",
		image_id = "safehouse_trophies_preview_stealth",
		name_id = "trophy_stealth",
		objective_id = "trophy_stealth_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_stealth", 15, {
				name_id = "trophy_stealth_progress",
				verify = "_verify_unique_heist",
				save_values = {
					"completed_heists"
				}
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_tiara_desc",
		id = "trophy_tiara",
		image_id = "safehouse_trophies_preview_tiara",
		name_id = "trophy_tiara",
		objective_id = "trophy_tiara_objective",
		objectives = {
			self:_progress("trophy_tiara", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_hobo_knife_desc",
		id = "trophy_hobo_knife",
		image_id = "safehouse_trophies_preview_hobo_knife",
		name_id = "trophy_hobo_knife",
		objective_id = "trophy_hobo_knife_objective",
		objectives = {
			self:_achievement("sinus_1")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_transports_desc",
		id = "trophy_transports",
		image_id = "safehouse_trophies_preview_transports",
		name_id = "trophy_transports",
		objective_id = "trophy_transports_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_transport_crossroads", 1, {
				name_id = "heist_arm_cro"
			}),
			self:_progress("trophy_transport_downtown", 1, {
				name_id = "heist_arm_hcm"
			}),
			self:_progress("trophy_transport_harbor", 1, {
				name_id = "heist_arm_fac"
			}),
			self:_progress("trophy_transport_park", 1, {
				name_id = "heist_arm_par"
			}),
			self:_progress("trophy_transport_underpass", 1, {
				name_id = "heist_arm_und"
			}),
			self:_progress("trophy_transport_train", 1, {
				name_id = "heist_arm_for"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_golden_grin_desc",
		id = "trophy_golden_grin",
		image_id = "safehouse_trophies_preview_golden_grin",
		name_id = "trophy_golden_grin",
		objective_id = "trophy_golden_grin_objective",
		objectives = {
			self:_progress("trophy_golden_grin", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_pacifier_desc",
		id = "trophy_pacifier",
		image_id = "safehouse_trophies_preview_pacifier",
		name_id = "trophy_pacifier",
		objective_id = "trophy_pacifier_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_basics_stealth", 1, {
				name_id = "heist_short1"
			}),
			self:_progress("trophy_basics_loud", 1, {
				name_id = "heist_short2"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_discoball_desc",
		id = "trophy_discoball",
		image_id = "safehouse_trophies_preview_discoball",
		name_id = "trophy_discoball",
		objective_id = "trophy_discoball_objective",
		objectives = {
			self:_progress("trophy_nightclub_dw", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_boxing_gloves_desc",
		id = "trophy_boxing_gloves",
		image_id = "safehouse_trophies_preview_boxing_gloves",
		name_id = "trophy_boxing_gloves",
		objective_id = "trophy_boxing_gloves_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_knockouts", 5, {
				name_id = "trophy_boxing_gloves_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_ring_desc",
		id = "trophy_ring",
		image_id = "safehouse_trophies_preview_ring",
		name_id = "trophy_ring",
		objective_id = "trophy_ring_objective",
		objectives = {
			self:_achievement("voff_4")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_dozer_helmet_desc",
		id = "trophy_dozer_helmet",
		image_id = "safehouse_trophies_preview_dozer_helmet",
		name_id = "trophy_dozer_helmet",
		objective_id = "trophy_dozer_helmet_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_special_kills", 100, {
				name_id = "trophy_dozer_helmet_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_goat_desc",
		id = "trophy_goat",
		image_id = "safehouse_trophies_preview_goat",
		name_id = "trophy_goat",
		objective_id = "trophy_goat_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_goats_extracted", 25, {
				name_id = "trophy_goat_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_tfturret_desc",
		id = "trophy_tfturret",
		image_id = "safehouse_trophies_preview_tfturret",
		name_id = "trophy_tfturret",
		objective_id = "trophy_tfturret_objective",
		objectives = {
			self:_progress("trophy_tfturret", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_train_bomb_desc",
		id = "trophy_train_bomb",
		image_id = "safehouse_trophies_preview_train_bomb",
		name_id = "trophy_train_bomb",
		objective_id = "trophy_train_bomb_objective",
		objectives = {
			self:_achievement("trophy_train_bomb")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_computer_desc",
		id = "trophy_computer",
		image_id = "safehouse_trophies_preview_computer",
		name_id = "trophy_computer",
		objective_id = "trophy_computer_objective",
		objectives = {
			self:_progress("trophy_ed_computer_full_hack", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_longfellow_desc",
		id = "trophy_longfellow",
		image_id = "safehouse_trophies_preview_longfellow",
		name_id = "trophy_longfellow",
		objective_id = "trophy_longfellow_objective",
		objectives = {
			self:_progress("trophy_shoutout", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_bank_heists_desc",
		id = "trophy_bank_heists",
		image_id = "safehouse_trophies_preview_bank_heists",
		name_id = "trophy_bank_heists",
		objective_id = "trophy_bank_heists_objective",
		objectives = {
			self:_progress("trophy_bank_heists", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_carshop_stealth_desc",
		id = "trophy_carshop_stealth",
		image_id = "safehouse_trophies_preview_carshop_stealth",
		name_id = "trophy_carshop_stealth",
		objective_id = "trophy_carshop_stealth_objective",
		objectives = {
			self:_progress("trophy_carshop_stealth", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_ace_desc",
		id = "trophy_ace",
		image_id = "safehouse_trophies_preview_ace",
		name_id = "trophy_ace",
		objective_id = "trophy_ace_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_ace", 100, {
				name_id = "trophy_ace_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_washington_desc",
		id = "trophy_washington",
		image_id = "safehouse_trophies_preview_hoxton_statue",
		name_id = "trophy_washington",
		objective_id = "trophy_washington_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_washington", 658893, {
				name_id = "trophy_ace_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_watchout_desc",
		id = "trophy_watchout",
		image_id = "safehouse_trophies_preview_watchout",
		name_id = "trophy_watchout",
		objective_id = "trophy_watchout_objective",
		objectives = {
			self:_progress("trophy_watchout", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_piggy_bank_desc",
		id = "trophy_piggy_bank",
		image_id = "safehouse_trophies_preview_piggy_bank",
		name_id = "trophy_piggy_bank",
		objective_id = "trophy_piggy_bank_objective",
		objectives = {
			self:_progress("trophy_piggy_bank", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_dance_desc",
		id = "trophy_dance",
		image_id = "safehouse_trophies_preview_dances",
		name_id = "trophy_dance",
		objective_id = "trophy_dance_objective",
		objectives = {
			self:_progress("trophy_dance", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_fbi_desc",
		id = "trophy_fbi",
		image_id = "safehouse_trophies_preview_fbi",
		name_id = "trophy_fbi",
		objective_id = "trophy_fbi_objective",
		objectives = {
			self:_progress("trophy_fbi", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_jfk_desc",
		id = "trophy_jfk",
		image_id = "safehouse_trophies_preview_jfk",
		name_id = "trophy_jfk",
		objective_id = "trophy_jfk_objective",
		objectives = {
			self:_progress("trophy_jfk", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_smg_desc",
		id = "trophy_smg",
		image_id = "safehouse_trophies_preview_smg",
		name_id = "trophy_smg",
		objective_id = "trophy_smg_objective",
		objectives = {
			self:_progress("trophy_smg", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_host_desc",
		id = "trophy_host",
		image_id = "safehouse_trophies_preview_host",
		name_id = "trophy_host",
		objective_id = "trophy_host_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_host", 10, {
				name_id = "trophy_host_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_framing_frame_desc",
		id = "trophy_framing_frame",
		image_id = "safehouse_trophies_preview_framing_frame",
		name_id = "trophy_framing_frame",
		objective_id = "trophy_framing_frame_objective",
		objectives = {
			self:_progress("trophy_framing_frame", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_sandwich_desc",
		id = "trophy_sandwich",
		image_id = "safehouse_trophies_preview_sandwich",
		name_id = "trophy_sandwich",
		objective_id = "trophy_sandwich_objective",
		objectives = {
			self:_progress("trophy_sandwich", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_planmaker_desc",
		id = "trophy_planmaker",
		image_id = "safehouse_trophies_preview_planmaker",
		name_id = "trophy_planmaker",
		objective_id = "trophy_planmaker_objective",
		objectives = {
			self:_progress("trophy_planmaker", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_bonfire_desc",
		id = "trophy_bonfire",
		image_id = "safehouse_trophies_preview_bonfire",
		name_id = "trophy_bonfire",
		objective_id = "trophy_bonfire_objective",
		secret = true,
		objectives = {
			self:_progress("trophy_bonfire", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_smwish_desc",
		id = "trophy_smwish",
		image_id = "safehouse_trophies_preview_dallas_statue",
		name_id = "trophy_smwish",
		objective_id = "trophy_smwish_objective",
		objectives = {
			self:_progress("trophy_smwish", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_medic_desc",
		id = "trophy_medic",
		image_id = "safehouse_trophies_preview_medic",
		name_id = "trophy_medic",
		objective_id = "trophy_medic_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_medic", 100, {
				name_id = "trophy_medic_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_courtesy_desc",
		id = "trophy_courtesy",
		image_id = "safehouse_trophies_preview_courtesy",
		name_id = "trophy_courtesy",
		objective_id = "trophy_courtesy_objective",
		objectives = {
			self:_progress("trophy_courtesy", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_evolution_desc",
		id = "trophy_evolution",
		image_id = "safehouse_trophies_preview_evolution",
		name_id = "trophy_evolution",
		objective_id = "trophy_evolution_objective",
		objectives = {
			self:_progress("trophy_evolution", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_flawless_desc",
		id = "trophy_flawless",
		image_id = "safehouse_trophies_preview_flawless",
		name_id = "trophy_flawless",
		objective_id = "trophy_flawless_objective",
		objectives = {
			self:_progress("trophy_flawless", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_defender_desc",
		id = "trophy_defender",
		image_id = "safehouse_trophies_preview_barbwire",
		name_id = "trophy_defender",
		objective_id = "trophy_defender_objective",
		objectives = {
			self:_progress("trophy_defender", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_tooth_desc",
		id = "trophy_tooth",
		image_id = "safehouse_trophies_preview_toothbrush",
		name_id = "trophy_tooth",
		objective_id = "trophy_tooth_objective",
		objectives = {
			self:_achievement("flat_3")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_spooky_desc",
		id = "trophy_spooky",
		image_id = "safehouse_trophies_preview_spooky",
		name_id = "trophy_spooky",
		objective_id = "trophy_spooky_objective",
		objectives = {
			self:_progress("trophy_spooky", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_flamingo_desc",
		id = "trophy_flamingo",
		image_id = "safehouse_trophies_preview_flamingo",
		name_id = "trophy_flamingo",
		objective_id = "trophy_flamingo_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_flamingo", 20, {
				name_id = "trophy_flamingo_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_coke_desc",
		id = "trophy_coke",
		image_id = "safehouse_trophies_preview_coke",
		name_id = "trophy_coke",
		objective_id = "trophy_coke_objective",
		show_progress = true,
		objectives = {
			self:_progress("trophy_coke", 24, {
				name_id = "trophy_coke_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_friendly_car_desc",
		id = "trophy_friendly_car",
		image_id = "safehouse_trophies_preview_tonys_car",
		name_id = "trophy_friendly_car",
		objective_id = "trophy_friendly_car_objective",
		objectives = {
			self:_progress("trophy_friendly_car", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_fish_trophy_desc",
		id = "trophy_fish_trophy",
		image_id = "safehouse_trophies_preview_yacht",
		name_id = "trophy_fish_trophy",
		objective_id = "trophy_fish_trophy_objective",
		objectives = {
			self:_progress("trophy_fish_trophy", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_run_matt_desc",
		gives_reward = false,
		hidden_in_list = true,
		id = "trophy_run_matt",
		image_id = "safehouse_trophies_preview_yacht",
		name_id = "trophy_run_matt",
		objective_id = "trophy_run_matt_objective",
		objectives = {
			self:_progress("trophy_run_matt", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_run_turtle_desc",
		id = "trophy_run_turtle",
		image_id = "safehouse_trophies_preview_turtle",
		name_id = "trophy_run_turtle",
		objective_id = "trophy_run_turtle_objective",
		objectives = {
			self:_progress("trophy_run_turtle", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_glace_cuffs_desc",
		id = "trophy_glace_cuffs",
		image_id = "safehouse_trophies_preview_glace_cuffs",
		name_id = "trophy_glace_cuffs",
		objective_id = "trophy_glace_cuffs_objective",
		objectives = {
			self:_progress("trophy_glace_cuffs", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_glace_completion_desc",
		gives_reward = false,
		hidden_in_list = true,
		id = "trophy_glace_completion",
		image_id = "safehouse_trophies_preview_yacht",
		name_id = "trophy_glace_completion",
		objective_id = "trophy_glace_completion_objective",
		objectives = {
			self:_progress("trophy_glace_completion", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_jfr_1_desc",
		gives_reward = false,
		id = "trophy_jfr_1",
		image_id = "safehouse_trophies_preview_hat",
		name_id = "trophy_jfr_1",
		objective_id = "trophy_jfr_1_completion_objective",
		objectives = {
			self:_progress("sidejob_jfr_1", 1),
			self:_progress("sidejob_jfr_2", 1),
			self:_progress("sidejob_jfr_3", 1),
			self:_progress("sidejob_jfr_4", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_aru_1_desc",
		gives_reward = false,
		id = "trophy_aru_1",
		image_id = "safehouse_trophies_preview_push_dagger",
		name_id = "trophy_aru_1",
		objective_id = "trophy_aru_1_completion_objective",
		objectives = {
			self:_progress("sidejob_aru_1", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_aru_2_desc",
		gives_reward = false,
		id = "trophy_aru_2",
		image_id = "safehouse_trophies_preview_luger",
		name_id = "trophy_aru_2",
		objective_id = "trophy_aru_2_completion_objective",
		objectives = {
			self:_progress("sidejob_aru_2", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_aru_3_desc",
		gives_reward = false,
		id = "trophy_aru_3",
		image_id = "safehouse_trophies_preview_mp40",
		name_id = "trophy_aru_3",
		objective_id = "trophy_aru_3_completion_objective",
		objectives = {
			self:_progress("sidejob_aru_3", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_aru_4_desc",
		gives_reward = false,
		id = "trophy_aru_4",
		image_id = "safehouse_trophies_preview_garand",
		name_id = "trophy_aru_4",
		objective_id = "trophy_aru_4_completion_objective",
		objectives = {
			self:_progress("sidejob_aru_4", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_eng_1_desc",
		id = "trophy_eng_1",
		image_id = "safehouse_trophies_preview_bullet",
		name_id = "trophy_eng_1",
		objective_id = "trophy_eng_1_completion_objective",
		show_progress = true,
		objectives = {
			self:_progress("eng_1_stats", 5, {
				name_id = "trophy_eng_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_eng_2_desc",
		id = "trophy_eng_2",
		image_id = "safehouse_trophies_preview_the_robot",
		name_id = "trophy_eng_2",
		objective_id = "trophy_eng_2_completion_objective",
		show_progress = true,
		objectives = {
			self:_progress("eng_2_stats", 5, {
				name_id = "trophy_eng_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_eng_3_desc",
		id = "trophy_eng_3",
		image_id = "safehouse_trophies_preview_the_marine",
		name_id = "trophy_eng_3",
		objective_id = "trophy_eng_3_completion_objective",
		show_progress = true,
		objectives = {
			self:_progress("eng_3_stats", 5, {
				name_id = "trophy_eng_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_eng_4_desc",
		id = "trophy_eng_4",
		image_id = "safehouse_trophies_preview_the_cultist",
		name_id = "trophy_eng_4",
		objective_id = "trophy_eng_4_completion_objective",
		show_progress = true,
		objectives = {
			self:_progress("eng_4_stats", 5, {
				name_id = "trophy_eng_progress"
			})
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_brb_1_desc",
		gives_reward = false,
		id = "trophy_brb_1",
		image_id = "safehouse_trophies_preview_medallion",
		name_id = "trophy_brb_1",
		objective_id = "trophy_brb_1_completion_objective",
		objectives = {
			self:_achievement("brb_4")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_box_1_desc",
		id = "trophy_box_1",
		image_id = "safehouse_trophies_preview_box1_healer",
		name_id = "trophy_box_1",
		objective_id = "trophy_box_1_completion_objective",
		objectives = {
			self:_achievement("trk_gg_0"),
			self:_achievement("des_1")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_box_2_desc",
		id = "trophy_box_2",
		image_id = "safehouse_trophies_preview_box2_elephant",
		name_id = "trophy_box_2",
		objective_id = "trophy_box_2_completion_objective",
		objectives = {
			self:_achievement("tag_1")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_box_3_desc",
		id = "trophy_box_3",
		image_id = "safehouse_trophies_preview_box3_scribe",
		name_id = "trophy_box_3",
		objective_id = "trophy_box_3_completion_objective",
		objectives = {
			self:_achievement("des_1")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_device_parts_desc",
		gives_reward = false,
		hidden_in_list = true,
		id = "trophy_device_parts",
		name_id = "trophy_device_parts",
		objective_id = "trophy_device_parts_completion_objective",
		objectives = {
			self:_progress("trophy_device_parts", 1)
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_black_plate_desc",
		id = "trophy_black_plate",
		image_id = "safehouse_trophies_preview_blackplate",
		name_id = "trophy_black_plate",
		objective_id = "trophy_black_plate_completion_objective",
		objectives = {
			self:_achievement("sah_1")
		}
	})
	table.insert(self.trophies, {
		gives_reward = false,
		hidden_in_list = true,
		id = "trophy_device_assembled",
		objectives = {
			self:_progress("trophy_device_assembled", 1)
		}
	})
	table.insert(self.trophies, {
		gives_reward = false,
		hidden_in_list = true,
		id = "trophy_device_opened",
		objectives = {
			self:_progress("trophy_device_opened", 1)
		}
	})
	table.insert(self.trophies, {
		gives_reward = false,
		hidden_in_list = true,
		id = "trophy_vlads_cupcake",
		objectives = {
			self:_achievement("trk_gg_0"),
			self:_achievement("trk_dm_0")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_bains_book_desc",
		id = "trophy_bains_book",
		image_id = "safehouse_trophies_preview_bains_book",
		name_id = "trophy_bains_book",
		objective_id = "trophy_bains_book_completion_objective",
		objectives = {
			self:_achievement("nmh_1")
		}
	})
	table.insert(self.trophies, {
		desc_id = "trophy_bex_desc",
		gives_reward = false,
		id = "trophy_bex",
		image_id = "safehouse_trophies_preview_bex",
		name_id = "trophy_bex",
		objective_id = "trophy_bex_objective",
		objectives = {
			self:_progress("trophy_bex", 1)
		}
	})
end

function CustomSafehouseTweakData:get_trophy_data(id)
	for idx, trophy in ipairs(self.trophies) do
		if trophy.id == id then
			return trophy
		end
	end

	return self:get_daily_data(id)
end

function CustomSafehouseTweakData:_verify_unique_heist(trophy_objective)
	trophy_objective.completed_heists = trophy_objective.completed_heists or {}

	local job_id = managers.job:current_job_id()

	if job_id and not table.contains(trophy_objective.completed_heists, job_id) then
		table.insert(trophy_objective.completed_heists, job_id)

		return true
	else
		return false
	end
end

function CustomSafehouseTweakData:_init_dailies(tweak_data)
	self.dailies = {}

	table.insert(self.dailies, {
		desc_id = "daily_classics_desc",
		id = "daily_classics",
		name_id = "daily_classics",
		objective_id = "daily_classics_objective",
		show_progress = true,
		objectives = {
			self:_progress("daily_classics", 2, {
				name_id = "daily_classics_progress",
				verify = "_verify_unique_heist",
				save_values = {
					"completed_heists"
				}
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_discord_desc",
		id = "daily_discord",
		name_id = "daily_discord",
		objective_id = "daily_discord_objective",
		show_progress = true,
		objectives = {
			self:_progress("daily_discord", 3, {
				name_id = "daily_discord_progress"
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_fwtd_desc",
		id = "daily_fwtd",
		name_id = "daily_fwtd",
		objective_id = "daily_fwtd_objective",
		objectives = {
			self:_progress("daily_fwtd", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_gears_desc",
		id = "daily_gears",
		name_id = "daily_gears",
		objective_id = "daily_gears_objective",
		objectives = {
			self:_progress("daily_gears", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_grenades_desc",
		id = "daily_grenades",
		name_id = "daily_grenades",
		objective_id = "daily_grenades_objective",
		show_progress = true,
		objectives = {
			self:_progress("daily_grenades", 25, {
				name_id = "daily_grenades_progress"
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_phobia_desc",
		id = "daily_phobia",
		name_id = "daily_phobia",
		objective_id = "daily_phobia_objective",
		objectives = {
			self:_progress("daily_phobia", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_mortage_desc",
		id = "daily_mortage",
		name_id = "daily_mortage",
		objective_id = "daily_mortage_objective",
		objectives = {
			self:_progress("daily_mortage", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_art_desc",
		id = "daily_art",
		name_id = "daily_art",
		objective_id = "daily_art_objective",
		objectives = {
			self:_progress("daily_art", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_akimbo_desc",
		id = "daily_akimbo",
		name_id = "daily_akimbo",
		objective_id = "daily_akimbo_objective",
		objectives = {
			self:_progress("daily_akimbo", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_professional_desc",
		id = "daily_professional",
		name_id = "daily_professional",
		objective_id = "daily_professional_objective",
		objectives = {
			self:_progress("daily_professional", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_spacetime_desc",
		id = "daily_spacetime",
		name_id = "daily_spacetime",
		objective_id = "daily_spacetime_objective",
		objectives = {
			self:_progress("daily_spacetime", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_tapes_desc",
		id = "daily_tapes",
		name_id = "daily_tapes",
		objective_id = "daily_tapes_objective",
		objectives = {
			self:_progress("daily_tapes", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_toast_desc",
		id = "daily_toast",
		name_id = "daily_toast",
		objective_id = "daily_toast_objective",
		objectives = {
			self:_progress("daily_toast", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_heirloom_desc",
		id = "daily_heirloom",
		name_id = "daily_heirloom",
		objective_id = "daily_heirloom_objective",
		objectives = {
			self:_progress("daily_heirloom", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_helicopter_desc",
		id = "daily_helicopter",
		name_id = "daily_helicopter",
		objective_id = "daily_helicopter_objective",
		objectives = {
			self:_progress("daily_helicopter", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_sewers_desc",
		id = "daily_sewers",
		name_id = "daily_sewers",
		objective_id = "daily_sewers_objective",
		objectives = {
			self:_progress("daily_sewers", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_night_out_desc",
		id = "daily_night_out",
		name_id = "daily_night_out",
		objective_id = "daily_night_out_objective",
		objectives = {
			self:_progress("daily_night_out", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_secret_identity_desc",
		id = "daily_secret_identity",
		name_id = "daily_secret_identity",
		objective_id = "daily_secret_identity_objective",
		objectives = {
			self:_progress("daily_secret_identity", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_lodsofemone_desc",
		id = "daily_lodsofemone",
		name_id = "daily_lodsofemone",
		objective_id = "daily_lodsofemone_objective",
		show_progress = true,
		objectives = {
			self:_progress("daily_lodsofemone", 20, {
				name_id = "daily_lodsofemone_progress"
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_hangover_desc",
		id = "daily_hangover",
		name_id = "daily_hangover",
		objective_id = "daily_hangover_objective",
		show_progress = true,
		objectives = {
			self:_progress("daily_hangover", 25, {
				name_id = "daily_hangover_progress"
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_rush_desc",
		id = "daily_rush",
		name_id = "daily_rush",
		objective_id = "daily_rush_objective",
		objectives = {
			self:_progress("daily_rush", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_naked_desc",
		id = "daily_naked",
		name_id = "daily_naked",
		objective_id = "daily_naked_objective",
		objectives = {
			self:_progress("daily_naked", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_honorable_desc",
		id = "daily_honorable",
		name_id = "daily_honorable",
		objective_id = "daily_honorable_objective",
		show_progress = true,
		objectives = {
			self:_progress("daily_honorable", 10, {
				name_id = "daily_honorable_progress"
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_ninja_desc",
		id = "daily_ninja",
		name_id = "daily_ninja",
		objective_id = "daily_ninja_objective",
		objectives = {
			self:_progress("daily_ninja", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_cake_desc",
		id = "daily_cake",
		name_id = "daily_cake",
		objective_id = "daily_cake_objective",
		objectives = {
			self:_progress("daily_cake", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_my_bodhi_is_ready_desc",
		id = "daily_my_bodhi_is_ready",
		name_id = "daily_my_bodhi_is_ready",
		objective_id = "daily_my_bodhi_is_ready_objective",
		show_progress = true,
		objectives = {
			self:_progress("corpse_dispose", 10, {
				name_id = "daily_my_bodhi_is_ready_progress"
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_tasty_desc",
		id = "daily_tasty",
		name_id = "daily_tasty",
		objective_id = "daily_tasty_objective",
		show_progress = true,
		objectives = {
			self:_progress("daily_tasty", 20, {
				name_id = "daily_tasty_progress"
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_candy_desc",
		id = "daily_candy",
		name_id = "daily_candy",
		objective_id = "daily_candy_objective",
		show_progress = true,
		objectives = {
			self:_progress("daily_candy", 10, {
				name_id = "daily_candy_progress"
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_dosh_desc",
		id = "daily_dosh",
		name_id = "daily_dosh",
		objective_id = "daily_dosh_objective",
		objectives = {
			self:_achievement("pal_2")
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_snake_desc",
		id = "daily_snake",
		name_id = "daily_snake",
		objective_id = "daily_snake_objective",
		show_progress = true,
		objectives = {
			self:_progress("gmod_5_stats", 10, {
				name_id = "daily_snake_progress"
			})
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_coke_run_desc",
		id = "daily_coke_run",
		name_id = "daily_coke_run",
		objective_id = "daily_coke_run_objective",
		objectives = {
			self:_progress("daily_coke_run", 1)
		}
	})
	table.insert(self.dailies, {
		desc_id = "daily_whats_stealth_desc",
		id = "daily_whats_stealth",
		name_id = "daily_whats_stealth",
		objective_id = "daily_whats_stealth_objective",
		objectives = {
			self:_progress("daily_whats_stealth", 1)
		}
	})
end

function CustomSafehouseTweakData:get_daily_data(id)
	for idx, daily in ipairs(self.dailies) do
		if daily.id == id then
			return daily
		end
	end
end

function CustomSafehouseTweakData:_init_map(tweak_data)
	self.map = {}
	self.map.size = 2000
	self.map.frame_texture = {
		"guis/dlcs/chill/textures/pd2/character_icon/safehouse_character_lvl_indicator1",
		"guis/dlcs/chill/textures/pd2/character_icon/safehouse_character_lvl_indicator2",
		"guis/dlcs/chill/textures/pd2/character_icon/safehouse_character_lvl_indicator3"
	}
	self.map.rooms = {}
	self.map.floors = {}

	table.insert(self.map.floors, {
		alpha_limit = 0.05,
		desc_id = "menu_cs_top_floor_desc",
		min_zoom = 1,
		name_id = "menu_cs_top_floor",
		start_zoom = 1.2,
		texture = "guis/dlcs/chill/textures/pd2/safehouse/chill_map_top_floor",
		shape = {
			0.4,
			0.22,
			0.88,
			0.56
		},
		controller_shape = {
			0.4,
			0.22,
			0.88,
			0.61
		},
		rooms = {
			"old_hoxton",
			"russian",
			"clover",
			"terry",
			"myh"
		}
	})
	table.insert(self.map.floors, {
		alpha_limit = 0.05,
		desc_id = "menu_cs_ground_floor_desc",
		min_zoom = 0.8,
		name_id = "menu_cs_ground_floor",
		start_zoom = 1,
		texture = "guis/dlcs/chill/textures/pd2/safehouse/chill_map_ground_floor",
		shape = {
			0.29,
			0.21,
			0.88,
			0.63
		},
		controller_shape = {
			0.29,
			0.16,
			0.93,
			0.73
		},
		rooms = {
			"bonnie",
			"dragon",
			"jimmy",
			"spanish",
			"american",
			"sydney",
			"wild",
			"livingroom",
			"max",
			"joy",
			"ecp"
		}
	})
	table.insert(self.map.floors, {
		alpha_limit = 0.03,
		desc_id = "menu_cs_basement_desc",
		min_zoom = 0.6,
		name_id = "menu_cs_basement",
		start_zoom = 0.8,
		texture = "guis/dlcs/chill/textures/pd2/safehouse/chill_map_basement",
		shape = {
			0.19,
			0.19,
			0.9,
			0.63
		},
		controller_shape = {
			0.14,
			0.09,
			1,
			0.78
		},
		rooms = {
			"dragan",
			"german",
			"sokol",
			"bodhi",
			"vault",
			"jacket",
			"jowi"
		}
	})

	self.map.rooms.dragan = {
		icon = "safehouse_character_icon_dragan",
		x = 1150,
		y = 730
	}
	self.map.rooms.german = {
		icon = "safehouse_character_icon_wolf",
		x = 1237,
		y = 1108
	}
	self.map.rooms.sokol = {
		icon = "safehouse_character_icon_sokol",
		x = 1260,
		y = 690
	}
	self.map.rooms.bodhi = {
		icon = "safehouse_character_icon_bodhi",
		x = 1300,
		y = 550
	}
	self.map.rooms.vault = {
		icon = "safehouse_character_icon_vault",
		x = 902,
		y = 653
	}
	self.map.rooms.jacket = {
		icon = "safehouse_character_icon_jacket",
		x = 1402,
		y = 660
	}
	self.map.rooms.jowi = {
		icon = "safehouse_character_icon_wick",
		x = 1045,
		y = 1108
	}
	self.map.rooms.bonnie = {
		icon = "safehouse_character_icon_bonnie",
		x = 1320,
		y = 815
	}
	self.map.rooms.dragon = {
		icon = "safehouse_character_icon_jiro",
		x = 1400,
		y = 803
	}
	self.map.rooms.jimmy = {
		icon = "safehouse_character_icon_jimmy",
		x = 1380,
		y = 910
	}
	self.map.rooms.spanish = {
		icon = "safehouse_character_icon_chains",
		x = 1205,
		y = 1108
	}
	self.map.rooms.american = {
		icon = "safehouse_character_icon_houston",
		x = 1160,
		y = 640
	}
	self.map.rooms.sydney = {
		icon = "safehouse_character_icon_sydney",
		x = 1240,
		y = 640
	}
	self.map.rooms.wild = {
		icon = "safehouse_character_icon_rust",
		x = 1240,
		y = 750
	}
	self.map.rooms.livingroom = {
		icon = "safehouse_character_icon_livingroom",
		x = 1170,
		y = 930
	}
	self.map.rooms.old_hoxton = {
		icon = "safehouse_character_icon_reborn",
		x = 1290,
		y = 850
	}
	self.map.rooms.russian = {
		icon = "safehouse_character_icon_dallas",
		x = 1353,
		y = 810
	}
	self.map.rooms.clover = {
		icon = "safehouse_character_icon_clover",
		x = 1350,
		y = 900
	}
	self.map.rooms.terry = {
		icon = "safehouse_character_icon_terry",
		path = "guis/dlcs/chico/textures/pd2/blackmarket/icons/safehouse_icons/",
		x = 1325,
		y = 700
	}
	self.map.rooms.max = {
		icon = "safehouse_character_icon_max",
		path = "guis/dlcs/max/textures/pd2/blackmarket/icons/safehouse_icons/",
		x = 1295,
		y = 1015
	}
	self.map.rooms.joy = {
		icon = "safehouse_character_icon_joy",
		path = "guis/dlcs/joy/textures/pd2/blackmarket/icons/safehouse_icons/",
		x = 1040,
		y = 780
	}
	self.map.rooms.myh = {
		icon = "safehouse_character_icon_myh",
		path = "guis/dlcs/myh/textures/pd2/blackmarket/icons/safehouse_icons/",
		x = 1155,
		y = 955
	}
	self.map.rooms.ecp = {
		icon = "safehouse_character_icon_ecp",
		path = "guis/dlcs/ecp/textures/pd2/blackmarket/icons/safehouse_icons/",
		x = 1140,
		y = 830
	}
end

function CustomSafehouseTweakData:_init_uno()
	self.uno_achievements_pool = {
		"armored_1",
		"armored_2",
		"bat_2",
		"berry_2",
		"bigbank_5",
		"bob_3",
		"born_5",
		"bph_11",
		"brb_8",
		"cac_13",
		"cac_26",
		"cac_9",
		"cane_2",
		"charliesierra_5",
		"cow_10",
		"cow_4",
		"dah_9",
		"dark_3",
		"diamonds_are_forever",
		"doctor_fantastic",
		"fish_5",
		"fort_4",
		"green_6",
		"halloween_2",
		"i_wasnt_even_there",
		"jerry_4",
		"kenaz_4",
		"kosugi_2",
		"lets_do_this",
		"live_2",
		"lord_of_war",
		"man_2",
		"melt_3",
		"moon_5",
		"nmh_10",
		"pal_2",
		"payback_2",
		"peta_3",
		"pig_2",
		"run_10",
		"rvd_11",
		"sah_10",
		"spa_5",
		"tag_10",
		"trk_af_3",
		"trk_fs_3",
		"trk_sh_3",
		"uno_1",
		"uno_2",
		"uno_3",
		"uno_4",
		"uno_5",
		"uno_6",
		"uno_7",
		"uno_8",
		"uno_9",
		"wwh_9"
	}
	self.uno_achievements_pool_ip = {
		berry = {
			"berry_2",
			"jerry_4"
		},
		mad = {
			"cac_13"
		},
		spa = {
			"fish_5",
			"spa_5"
		},
		rvd = {
			"rvd_11"
		}
	}
	self.uno_notes = "07729e9e9633c57e"
	self.uno_door_riddles = {
		"74650960625584b5",
		"fb5c57e8ac77053c",
		"7ace1515c20c617f",
		"14a99f4af0044252",
		"999dce46997b9b8b",
		"7e386d403e2af3b0",
		"7a8274cf00687c19",
		"4287ec39bce6ba9c",
		"2ea0f239dec3d4d2",
		"a52531d7c3a90a88",
		"b4381b950c7d4e0f",
		"c89511e5a2305e79",
		"2b77295d9511fa5f"
	}
end
