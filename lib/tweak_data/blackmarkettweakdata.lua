BlackMarketTweakData = BlackMarketTweakData or class()

require("lib/tweak_data/blackmarket/ColorsTweakData")
require("lib/tweak_data/blackmarket/MaterialsTweakData")
require("lib/tweak_data/blackmarket/TexturesTweakData")
require("lib/tweak_data/blackmarket/MasksTweakData")
require("lib/tweak_data/blackmarket/ProjectilesTweakData")
require("lib/tweak_data/blackmarket/MeleeWeaponsTweakData")
require("lib/tweak_data/blackmarket/WeaponSkinsTweakData")
require("lib/tweak_data/blackmarket/PlayerStyleTweakData")
require("lib/tweak_data/blackmarket/GlovesTweakData")

local is_nextgen_console = IS_PS4 or IS_XB1

function BlackMarketTweakData:init(tweak_data)
	self:_init_colors(tweak_data)
	self:_init_materials(tweak_data)
	self:_init_textures(tweak_data)
	self:_init_masks(tweak_data)
	self:_init_characters(tweak_data)
	self:_init_cash()
	self:_init_xp()
	self:_init_armors()
	self:_init_deployables(tweak_data)
	self:_init_bullets(tweak_data)
	self:_init_projectiles(tweak_data)
	self:_init_melee_weapons(tweak_data)
	self:_init_weapon_skins(tweak_data)
	self:_init_player_styles(tweak_data)
	self:_init_gloves(tweak_data)
	self:_init_weapon_mods(tweak_data)
end

function BlackMarketTweakData:_get_character_groups()
	local characters_female = {
		"female_1",
		"sydney",
		"joy",
		"ecp_female"
	}
	local characters_female_big = {
		"bonnie",
		"ecp_male"
	}
	local characters_male = {
		"dallas",
		"wolf",
		"hoxton",
		"chains",
		"jowi",
		"old_hoxton",
		"dragan",
		"jacket",
		"sokol",
		"dragon",
		"bodhi",
		"jimmy",
		"chico",
		"myh"
	}
	local characters_male_big = {
		"wild",
		"max"
	}

	return characters_female, characters_female_big, characters_male, characters_male_big
end

function BlackMarketTweakData:print_missing_strings(skip_print_id)
	return
end

function BlackMarketTweakData:_add_desc_from_name_macro(tweak_data)
	for id, data in pairs(tweak_data) do
		if data.name_id and not data.desc_id then
			data.desc_id = tostring(data.name_id) .. "_desc"
		end

		if not data.name_id then
			-- Nothing
		end
	end
end

function BlackMarketTweakData:_init_weapon_mods(tweak_data)
	if self.weapon_skins then
		tweak_data.weapon.factory:create_bonuses(tweak_data, self.weapon_skins)
	end

	self.weapon_charms = tweak_data.weapon.factory:create_charms(tweak_data)
	self.weapon_mods = {}

	local steelsight_parts = {}

	for id, data in pairs(tweak_data.weapon.factory.parts) do
		if is_nextgen_console then
			data.is_a_unlockable = nil
		end

		self.weapon_mods[id] = {
			max_in_inventory = data.is_a_unlockable and 1 or 2,
			pc = data.pc,
			pcs = data.pcs,
			dlc = data.dlc,
			dlcs = data.dlcs,
			unlock_dlc = data.unlock_dlc,
			name_id = data.name_id,
			desc_id = data.desc_id,
			infamous = data.infamous,
			value = data.stats and data.stats.value or 1,
			weight = data.weight,
			texture_bundle_folder = data.texture_bundle_folder,
			is_a_unlockable = data.is_a_unlockable,
			unatainable = data.unatainable,
			inaccessible = data.inaccessible,
			sort_number = data.sort_number
		}

		if data.steelsight_parent then
			steelsight_parts[id] = data.steelsight_parent
		end
	end

	self:_add_desc_from_name_macro(self.weapon_mods)

	for id, data in pairs(self.weapon_skins) do
		for part_id, parent_id in pairs(steelsight_parts) do
			if data.parts and data.parts[parent_id] then
				data.parts[part_id] = data.parts[parent_id]
			end
		end

		if data.types and data.types.sight and not data.types.sight_swap then
			data.types.sight_swap = data.types.sight
		end
	end

	local template_color_skin = self.weapon_color_templates.color_skin

	if template_color_skin and template_color_skin.types.sight and not template_color_skin.types.sight_swap then
		template_color_skin.types.sight_swap = template_color_skin.types.sight
	end

	for weapon_id, data in pairs(template_color_skin.weapons) do
		for part_id, parent_id in pairs(steelsight_parts) do
			if data.parts and data.parts[parent_id] then
				data.parts[part_id] = data.parts[parent_id]
			end
		end

		if data.types and data.types.sight and not data.types.sight_swap then
			data.types.sight_swap = data.types.sight
		end
	end
end

function BlackMarketTweakData:_init_characters(tweak_data)
	self.characters = {}
	self.characters.locked = {}
	self.characters.locked.fps_unit = "units/payday2/characters/fps_mover/fps_mover"
	self.characters.locked.npc_unit = "units/payday2/characters/npc_criminals_suit_1/npc_criminals_suit_1"
	self.characters.locked.menu_unit = "units/payday2/characters/npc_criminals_suit_1/npc_criminals_suit_1_menu"
	self.characters.locked.sequence = "var_material_01"
	self.characters.locked.name_id = "bm_character_locked"
	self.characters.locked.dallas = {
		installed = true,
		sequence = "var_mtr_dallas",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_dallas",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_dallas"
		}
	}
	self.characters.locked.wolf = {
		installed = true,
		sequence = "var_mtr_wolf",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_wolf",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_wolf"
		}
	}
	self.characters.locked.hoxton = {
		installed = true,
		sequence = "var_mtr_hoxton",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_hoxton",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_hoxton"
		}
	}
	self.characters.locked.chains = {
		installed = true,
		sequence = "var_mtr_chains",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_chains",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_chains"
		}
	}
	self.characters.locked.jowi = {
		dlc = "john_wick_character",
		global_value = "pd2_clan",
		sequence = "var_mtr_john_wick",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_john_wick",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_john_wick"
		}
	}
	self.characters.locked.old_hoxton = {
		dlc = "freed_old_hoxton",
		sequence = "var_mtr_old_hoxton",
		locks = {
			achievement = "bulldog_1",
			dlc = "pd2_clan"
		},
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_old_hoxton",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_old_hoxton"
		}
	}
	self.characters.locked.dragan = {
		dlc = "character_pack_dragan",
		sequence = "var_mtr_dragan",
		texture_bundle_folder = "character_pack_dragan",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_dragan",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_dragan"
		}
	}
	self.characters.locked.jacket = {
		dlc = "hlm2_deluxe",
		sequence = "var_mtr_jacket",
		texture_bundle_folder = "hlm2",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_jacket",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_jacket"
		}
	}
	self.characters.locked.sokol = {
		dlc = "character_pack_sokol",
		mask_off_sequence = "mask_off_sokol",
		mask_on_sequence = "mask_on_sokol",
		sequence = "var_mtr_sokol",
		texture_bundle_folder = "character_pack_sokol",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_sokol",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_sokol"
		}
	}
	self.characters.locked.dragon = {
		dlc = "dragon",
		sequence = "var_mtr_jiro",
		texture_bundle_folder = "dragon",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_jiro",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_jiro"
		}
	}
	self.characters.locked.bodhi = {
		dlc = "rvd",
		sequence = "var_mtr_bodhi",
		texture_bundle_folder = "rip",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_bodhi",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_bodhi"
		}
	}
	self.characters.locked.jimmy = {
		dlc = "coco",
		mask_off_sequence = "mask_off_jimmy",
		mask_on_sequence = "mask_on_jimmy",
		sequence = "var_mtr_jimmy",
		texture_bundle_folder = "coco",
		material_config = {
			fps = "units/payday2/characters/fps_criminals_suit_1/mtr_jimmy",
			npc = "units/payday2/characters/npc_criminals_suit_1/mtr_jimmy"
		}
	}
	self.characters.female_1 = {}
	self.characters.female_1.fps_unit = "units/payday2/characters/fps_mover/fps_female_1_mover"
	self.characters.female_1.npc_unit = "units/payday2/characters/npc_criminal_female_1/npc_criminal_female_1"
	self.characters.female_1.menu_unit = "units/payday2/characters/npc_criminal_female_1/npc_criminal_female_1_menu"
	self.characters.female_1.material_config = {
		fps = "units/payday2/characters/fps_criminals_suit_1/mtr_fem1",
		npc = "units/payday2/characters/npc_criminal_female_1/mtr_fem1"
	}
	self.characters.female_1.texture_bundle_folder = "character_pack_clover"
	self.characters.female_1.sequence = "var_mtr_fem1"
	self.characters.female_1.mask_on_sequence = "mask_on"
	self.characters.female_1.mask_off_sequence = "mask_off"
	self.characters.female_1.dlc = "character_pack_clover"
	self.characters.bonnie = {}
	self.characters.bonnie.fps_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/fps_bonnie_mover"
	self.characters.bonnie.npc_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/npc_criminal_bonnie"
	self.characters.bonnie.menu_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/npc_criminal_bonnie_menu"
	self.characters.bonnie.material_config = {
		fps = "units/payday2/characters/fps_criminals_suit_1/mtr_bonnie",
		npc = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/mtr_bonnie"
	}
	self.characters.bonnie.texture_bundle_folder = "character_pack_bonnie"
	self.characters.bonnie.sequence = "var_mtr_bonnie"
	self.characters.bonnie.mask_on_sequence = "bonnie_mask_on"
	self.characters.bonnie.mask_off_sequence = "bonnie_mask_off"
	self.characters.bonnie.dlc = "pd2_clan"
	self.characters.ai_hoxton = {}
	self.characters.ai_hoxton.npc_unit = "units/payday2/characters/npc_criminals_suit_1/hoxton/npc_criminal_suit_hoxton"
	self.characters.ai_hoxton.sequence = "var_mtr_hoxton"
	self.characters.ai_chains = {}
	self.characters.ai_chains.npc_unit = "units/payday2/characters/npc_criminals_suit_1/chains/npc_criminal_suit_chains"
	self.characters.ai_chains.sequence = "var_mtr_chains"
	self.characters.ai_dallas = {}
	self.characters.ai_dallas.npc_unit = "units/payday2/characters/npc_criminals_suit_1/dallas/npc_criminal_suit_dallas"
	self.characters.ai_dallas.sequence = "var_mtr_dallas"
	self.characters.ai_wolf = {}
	self.characters.ai_wolf.npc_unit = "units/payday2/characters/npc_criminals_suit_1/wolf/npc_criminal_suit_wolf"
	self.characters.ai_wolf.sequence = "var_mtr_wolf"
	self.characters.ai_jowi = {}
	self.characters.ai_jowi.npc_unit = "units/payday2/characters/npc_criminals_suit_1/jowi/npc_criminal_suit_jowi"
	self.characters.ai_jowi.sequence = "var_mtr_john_wick"
	self.characters.ai_old_hoxton = {}
	self.characters.ai_old_hoxton.npc_unit = "units/payday2/characters/npc_criminals_suit_1/old_hoxton/npc_criminal_suit_old_hoxton"
	self.characters.ai_old_hoxton.sequence = "var_mtr_old_hoxton"
	self.characters.ai_female_1 = {}
	self.characters.ai_female_1.npc_unit = "units/payday2/characters/npc_criminal_female_1/fem1/npc_criminal_female_fem1"
	self.characters.ai_female_1.sequence = "var_mtr_fem1"
	self.characters.ai_female_1.mask_on_sequence = "mask_on"
	self.characters.ai_female_1.mask_off_sequence = "mask_off"
	self.characters.ai_dragan = {}
	self.characters.ai_dragan.npc_unit = "units/payday2/characters/npc_criminals_suit_1/dragan/npc_criminal_suit_dragan"
	self.characters.ai_dragan.sequence = "var_mtr_dragan"
	self.characters.ai_jacket = {}
	self.characters.ai_jacket.npc_unit = "units/payday2/characters/npc_criminals_suit_1/jacket/npc_criminal_suit_jacket"
	self.characters.ai_jacket.sequence = "var_mtr_jacket"
	self.characters.ai_bonnie = {}
	self.characters.ai_bonnie.npc_unit = "units/pd2_dlc_bonnie/characters/npc_criminal_bonnie/fem1/npc_criminal_female_bonnie_1"
	self.characters.ai_bonnie.sequence = "var_mtr_bonnie"
	self.characters.ai_bonnie.mask_on_sequence = "bonnie_mask_on"
	self.characters.ai_bonnie.mask_off_sequence = "bonnie_mask_off"
	self.characters.ai_sokol = {}
	self.characters.ai_sokol.npc_unit = "units/payday2/characters/npc_criminals_suit_1/sokol/npc_criminal_suit_sokol"
	self.characters.ai_sokol.sequence = "var_mtr_sokol"
	self.characters.ai_sokol.mask_on_sequence = "mask_on_sokol"
	self.characters.ai_sokol.mask_off_sequence = "mask_off_sokol"
	self.characters.ai_dragon = {}
	self.characters.ai_dragon.npc_unit = "units/payday2/characters/npc_criminals_suit_1/dragon/npc_criminal_suit_dragon"
	self.characters.ai_dragon.sequence = "var_mtr_jiro"
	self.characters.ai_bodhi = {}
	self.characters.ai_bodhi.npc_unit = "units/payday2/characters/npc_criminals_suit_1/bodhi/npc_criminal_suit_bodhi"
	self.characters.ai_bodhi.sequence = "var_mtr_bodhi"
	self.characters.ai_jimmy = {}
	self.characters.ai_jimmy.npc_unit = "units/payday2/characters/npc_criminals_suit_1/jimmy/npc_criminal_suit_jimmy"
	self.characters.ai_jimmy.sequence = "var_mtr_jimmy"
	self.characters.sydney = {}
	self.characters.sydney.fps_unit = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/fps_sydney_mover"
	self.characters.sydney.npc_unit = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/npc_criminal_sydney"
	self.characters.sydney.menu_unit = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/npc_criminal_sydney_menu"
	self.characters.sydney.material_config = {
		fps = "units/pd2_dlc_opera/characters/fps_criminals_fem_3/mtr_sydney",
		npc = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/mtr_criminal_sydney"
	}
	self.characters.sydney.texture_bundle_folder = "opera"
	self.characters.sydney.sequence = "var_mtr_sydney"
	self.characters.sydney.mask_on_sequence = "mask_on"
	self.characters.sydney.mask_off_sequence = "mask_off"
	self.characters.sydney.dlc = "opera"
	self.characters.ai_sydney = {}
	self.characters.ai_sydney.npc_unit = "units/pd2_dlc_opera/characters/npc_criminals_fem_3/fem3/npc_criminal_female_3"
	self.characters.ai_sydney.sequence = "var_mtr_sydney"
	self.characters.ai_sydney.mask_on_sequence = "mask_on"
	self.characters.ai_sydney.mask_off_sequence = "mask_off"
	self.characters.wild = {}
	self.characters.wild.fps_unit = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/fps_wild_mover"
	self.characters.wild.npc_unit = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/npc_criminal_wild_1"
	self.characters.wild.menu_unit = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/npc_criminal_wild_1_menu"
	self.characters.wild.material_config = {
		fps = "units/pd2_dlc_wild/characters/fps_criminals_wild_1/mtr_wild",
		npc = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/mtr_criminal_wild_1"
	}
	self.characters.wild.texture_bundle_folder = "wild"
	self.characters.wild.sequence = "var_mtr_wild"
	self.characters.wild.dlc = "wild"
	self.characters.ai_wild = {}
	self.characters.ai_wild.npc_unit = "units/pd2_dlc_wild/characters/npc_criminals_wild_1/wild_1/npc_criminal_wild_1"
	self.characters.ai_wild.sequence = "var_mtr_wild"
	self.characters.chico = {}
	self.characters.chico.fps_unit = "units/pd2_dlc_chico/characters/npc_criminals_terry/fps_terry_mover"
	self.characters.chico.npc_unit = "units/pd2_dlc_chico/characters/npc_criminals_terry/npc_criminal_terry"
	self.characters.chico.menu_unit = "units/pd2_dlc_chico/characters/npc_criminals_terry/npc_criminal_terry_menu"
	self.characters.chico.material_config = {
		fps = "units/pd2_dlc_chico/characters/fps_criminals_terry/mtr_terry",
		npc = "units/pd2_dlc_chico/characters/npc_criminals_terry/mtr_criminal_terry"
	}
	self.characters.chico.texture_bundle_folder = "chico"
	self.characters.chico.sequence = "var_mtr_terry"
	self.characters.chico.dlc = "chico"
	self.characters.ai_chico = {}
	self.characters.ai_chico.npc_unit = "units/pd2_dlc_chico/characters/npc_criminals_terry/terry/npc_criminal_terry"
	self.characters.ai_chico.sequence = "var_mtr_terry"
	self.characters.max = {}
	self.characters.max.fps_unit = "units/pd2_dlc_max/characters/npc_criminals_max/fps_max_mover"
	self.characters.max.npc_unit = "units/pd2_dlc_max/characters/npc_criminals_max/npc_criminal_max"
	self.characters.max.menu_unit = "units/pd2_dlc_max/characters/npc_criminals_max/npc_criminal_max_menu"
	self.characters.max.texture_bundle_folder = "max"
	self.characters.max.sequence = "var_mtr_max"
	self.characters.max.face_mask_on_sequence = "face_mask_on"
	self.characters.max.face_mask_off_sequence = "face_mask_off"
	self.characters.max.material_config = {
		{
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_shirt_01"
		},
		{
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_shirt_02"
		},
		{
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_shirt_03"
		},
		{
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_shirt_04"
		},
		{
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_shirt_05"
		},
		{
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_shirt_06"
		},
		{
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max"
		},
		{
			chance = 200,
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_taco"
		},
		{
			chance = 50,
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_snakeskin"
		},
		{
			chance = 50,
			fps = "units/pd2_dlc_max/characters/fps_criminals_max/mtr_max",
			npc = "units/pd2_dlc_max/characters/npc_criminals_max/mtr_criminal_max_pink"
		}
	}
	self.characters.ai_max = {}
	self.characters.ai_max.npc_unit = "units/pd2_dlc_max/characters/npc_criminals_max/max/npc_criminal_max"
	self.characters.ai_max.sequence = "var_mtr_max"
	self.characters.ai_max.face_mask_on_sequence = "face_mask_on"
	self.characters.ai_max.face_mask_off_sequence = "face_mask_off"
	self.characters.joy = {}
	self.characters.joy.fps_unit = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/fps_joy_mover"
	self.characters.joy.npc_unit = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/npc_criminal_joy_1"
	self.characters.joy.menu_unit = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/npc_criminal_joy_1_menu"
	self.characters.joy.material_config = {
		fps = "units/pd2_dlc_joy/characters/fps_criminals_joy_1/mtr_joy",
		npc = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/mtr_criminal_joy_1"
	}
	self.characters.joy.texture_bundle_folder = "joy"
	self.characters.joy.sequence = "var_mtr_joy"
	self.characters.joy.mask_on_sequence = "mask_on_joy"
	self.characters.joy.mask_off_sequence = "mask_off_joy"
	self.characters.ai_joy = {}
	self.characters.ai_joy.npc_unit = "units/pd2_dlc_joy/characters/npc_criminals_joy_1/joy_1/npc_criminal_joy_1"
	self.characters.ai_joy.sequence = "var_mtr_joy"
	self.characters.ai_joy.mask_on_sequence = "mask_on_joy"
	self.characters.ai_joy.mask_off_sequence = "mask_off_joy"
	self.characters.myh = {}
	self.characters.myh.fps_unit = "units/pd2_dlc_myh/characters/npc_criminals_myh/fps_myh_mover"
	self.characters.myh.npc_unit = "units/pd2_dlc_myh/characters/npc_criminals_myh/npc_criminal_myh"
	self.characters.myh.menu_unit = "units/pd2_dlc_myh/characters/npc_criminals_myh/npc_criminal_myh_menu"
	self.characters.myh.material_config = {
		fps = "units/pd2_dlc_myh/characters/fps_criminals_myh/mtr_myh",
		npc = "units/pd2_dlc_myh/characters/npc_criminals_myh/mtr_criminal_myh"
	}
	self.characters.myh.texture_bundle_folder = "myh"
	self.characters.myh.sequence = "var_mtr_myh"
	self.characters.ai_myh = {}
	self.characters.ai_myh.npc_unit = "units/pd2_dlc_myh/characters/npc_criminals_myh/myh/npc_criminal_myh"
	self.characters.ai_myh.sequence = "var_mtr_myh"
	self.characters.ecp_female = {}
	self.characters.ecp_female.fps_unit = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_female/fps_ecp_female_mover"
	self.characters.ecp_female.npc_unit = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_female/npc_criminal_ecp_female"
	self.characters.ecp_female.menu_unit = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_female/npc_criminal_ecp_female_menu"
	self.characters.ecp_female.material_config = {
		fps = "units/pd2_dlc_ecp/characters/fps_criminals_ecp_female/mtr_ecp_female",
		npc = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_female/mtr_criminal_ecp_female"
	}
	self.characters.ecp_female.texture_bundle_folder = "ecp"
	self.characters.ecp_female.sequence = "var_mtr_ecp_female"
	self.characters.ecp_female.mask_on_sequence = "mask_on_ecp_female"
	self.characters.ecp_female.mask_off_sequence = "mask_off_ecp_female"
	self.characters.ecp_female.dlc = "ecp"
	self.characters.ecp_male = {}
	self.characters.ecp_male.fps_unit = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_male/fps_ecp_male_mover"
	self.characters.ecp_male.npc_unit = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_male/npc_criminal_ecp_male"
	self.characters.ecp_male.menu_unit = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_male/npc_criminal_ecp_male_menu"
	self.characters.ecp_male.material_config = {
		fps = "units/pd2_dlc_ecp/characters/fps_criminals_ecp_male/mtr_ecp_male",
		npc = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_male/mtr_criminal_ecp_male"
	}
	self.characters.ecp_male.texture_bundle_folder = "ecp"
	self.characters.ecp_male.sequence = "var_mtr_ecp_male"
	self.characters.ecp_male.mask_on_sequence = "mask_on_ecp_male"
	self.characters.ecp_male.mask_off_sequence = "mask_off_ecp_male"
	self.characters.ecp_male.dlc = "ecp"
	self.characters.ai_ecp_female = {}
	self.characters.ai_ecp_female.npc_unit = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_female/ecp_female/npc_criminal_ecp_female"
	self.characters.ai_ecp_female.sequence = "var_mtr_ecp_female"
	self.characters.ai_ecp_female.mask_on_sequence = "mask_on_ecp_female"
	self.characters.ai_ecp_female.mask_off_sequence = "mask_off_ecp_female"
	self.characters.ai_ecp_male = {}
	self.characters.ai_ecp_male.npc_unit = "units/pd2_dlc_ecp/characters/npc_criminals_ecp_male/ecp_male/npc_criminal_ecp_male"
	self.characters.ai_ecp_male.sequence = "var_mtr_ecp_male"
	self.characters.ai_ecp_male.mask_on_sequence = "mask_on_ecp_male"
	self.characters.ai_ecp_male.mask_off_sequence = "mask_off_ecp_male"

	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.characters) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end

	for _, data in pairs(self.characters.locked) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end
end

function BlackMarketTweakData:_init_cash()
	self.cash = {}
	self.cash.cash10 = {}
	self.cash.cash10.name_id = "bm_csh_cash10"
	self.cash.cash10.value_id = "cash10"
	self.cash.cash10.multiplier = 1
	self.cash.cash10.pcs = {
		10,
		40
	}
	self.cash.cash20 = {}
	self.cash.cash20.name_id = "bm_csh_cash20"
	self.cash.cash20.value_id = "cash20"
	self.cash.cash20.multiplier = 1
	self.cash.cash20.pcs = {
		20,
		40
	}
	self.cash.cash30 = {}
	self.cash.cash30.name_id = "bm_csh_cash30"
	self.cash.cash30.multiplier = 1
	self.cash.cash30.value_id = "cash30"
	self.cash.cash30.pcs = {
		30,
		40
	}
	self.cash.cash40 = {}
	self.cash.cash40.name_id = "bm_csh_cash40"
	self.cash.cash40.multiplier = 1
	self.cash.cash40.value_id = "cash40"
	self.cash.cash40.pcs = {
		20,
		30,
		40
	}
	self.cash.cash50 = {}
	self.cash.cash50.name_id = "bm_csh_cash50"
	self.cash.cash50.multiplier = 1
	self.cash.cash50.value_id = "cash50"
	self.cash.cash50.pcs = {
		30,
		40,
		50
	}
	self.cash.cash60 = {}
	self.cash.cash60.name_id = "bm_csh_cash60"
	self.cash.cash60.value_id = "cash60"
	self.cash.cash60.multiplier = 1
	self.cash.cash60.pcs = {
		40,
		50,
		60
	}
	self.cash.cash70 = {}
	self.cash.cash70.name_id = "bm_csh_cash70"
	self.cash.cash70.value_id = "cash70"
	self.cash.cash70.multiplier = 1
	self.cash.cash70.pcs = {
		50,
		60,
		70
	}
	self.cash.cash80 = {}
	self.cash.cash80.name_id = "bm_csh_cash80"
	self.cash.cash80.value_id = "cash80"
	self.cash.cash80.multiplier = 1
	self.cash.cash80.pcs = {
		60,
		70,
		80
	}
	self.cash.cash90 = {}
	self.cash.cash90.name_id = "bm_csh_cash90"
	self.cash.cash90.value_id = "cash90"
	self.cash.cash90.multiplier = 1
	self.cash.cash90.pcs = {
		70,
		80,
		90
	}
	self.cash.cash100 = {}
	self.cash.cash100.name_id = "bm_csh_cash100"
	self.cash.cash100.value_id = "cash100"
	self.cash.cash100.multiplier = 1
	self.cash.cash100.pcs = {
		80,
		90,
		100
	}
	self.cash.cash_preorder = {}
	self.cash.cash_preorder.name_id = "bm_csh_cash_preorder"
	self.cash.cash_preorder.value_id = "cash_preorder"
	self.cash.cash_preorder.multiplier = 1.2
	self.cash.cash_preorder.dlc = "preorder"

	if is_nextgen_console then
		self.cash.xone_bonus = {}
		self.cash.xone_bonus.name_id = "bm_csh_cash_xone"
		self.cash.xone_bonus.value_id = "xone_bonus"
		self.cash.xone_bonus.multiplier = 1
	end
end

function BlackMarketTweakData:_init_xp()
	self.xp = {}
	self.xp.xp10 = {}
	self.xp.xp10.name_id = "bm_exp_xp10"
	self.xp.xp10.value_id = "xp10"
	self.xp.xp10.multiplier = 1
	self.xp.xp10.pcs = {
		10,
		40
	}
	self.xp.xp15 = {}
	self.xp.xp15.name_id = "bm_exp_xp15"
	self.xp.xp15.value_id = "xp15"
	self.xp.xp15.multiplier = 1
	self.xp.xp15.pcs = {
		20,
		40
	}
	self.xp.xp20 = {}
	self.xp.xp20.name_id = "bm_exp_xp20"
	self.xp.xp20.value_id = "xp20"
	self.xp.xp20.multiplier = 1
	self.xp.xp20.pcs = {
		20,
		40
	}
	self.xp.xp30 = {}
	self.xp.xp30.name_id = "bm_exp_xp30"
	self.xp.xp30.multiplier = 1
	self.xp.xp30.value_id = "xp30"
	self.xp.xp30.pcs = {
		30,
		40
	}
	self.xp.xp40 = {}
	self.xp.xp40.name_id = "bm_exp_xp40"
	self.xp.xp40.multiplier = 1
	self.xp.xp40.value_id = "xp40"
	self.xp.xp40.pcs = {
		20,
		30,
		40
	}
	self.xp.xp50 = {}
	self.xp.xp50.name_id = "bm_exp_xp50"
	self.xp.xp50.multiplier = 1
	self.xp.xp50.value_id = "xp50"
	self.xp.xp50.pcs = {
		30,
		40,
		50
	}
	self.xp.xp60 = {}
	self.xp.xp60.name_id = "bm_exp_xp60"
	self.xp.xp60.value_id = "xp60"
	self.xp.xp60.multiplier = 1
	self.xp.xp60.pcs = {
		40,
		50,
		60
	}
	self.xp.xp70 = {}
	self.xp.xp70.name_id = "bm_exp_xp70"
	self.xp.xp70.value_id = "xp70"
	self.xp.xp70.multiplier = 1
	self.xp.xp70.pcs = {
		50,
		60,
		70
	}
	self.xp.xp80 = {}
	self.xp.xp80.name_id = "bm_exp_xp80"
	self.xp.xp80.value_id = "xp80"
	self.xp.xp80.multiplier = 1
	self.xp.xp80.pcs = {
		60,
		70,
		80
	}
	self.xp.xp90 = {}
	self.xp.xp90.name_id = "bm_exp_xp90"
	self.xp.xp90.value_id = "xp90"
	self.xp.xp90.multiplier = 1
	self.xp.xp90.pcs = {
		70,
		80,
		90
	}
	self.xp.xp100 = {}
	self.xp.xp100.name_id = "bm_exp_xp100"
	self.xp.xp100.value_id = "xp100"
	self.xp.xp100.multiplier = 1
	self.xp.xp100.pcs = {
		80,
		90,
		100
	}
	self.xp.xp_pda9_1 = {}
	self.xp.xp_pda9_1.name_id = "bm_exp_xp_pda9_1"
	self.xp.xp_pda9_1.value_id = "xp_pda9_1"
	self.xp.xp_pda9_1.multiplier = 1
	self.xp.xp_pda9_1.pcs = {}
	self.xp.xp_pda9_2 = {}
	self.xp.xp_pda9_2.name_id = "bm_exp_xp_pda9_2"
	self.xp.xp_pda9_2.value_id = "xp_pda9_2"
	self.xp.xp_pda9_2.multiplier = 1
	self.xp.xp_pda9_2.pcs = {}
end

function BlackMarketTweakData:_init_armors()
	self.armors = {}
	self.armors.level_1 = {}
	self.armors.level_1.name_id = "bm_armor_level_1"
	self.armors.level_1.sequence = "var_model_01"
	self.armors.level_1.upgrade_level = 1
	self.armors.level_2 = {}
	self.armors.level_2.name_id = "bm_armor_level_2"
	self.armors.level_2.sequence = "var_model_02"
	self.armors.level_2.upgrade_level = 2
	self.armors.level_3 = {}
	self.armors.level_3.name_id = "bm_armor_level_3"
	self.armors.level_3.sequence = "var_model_03"
	self.armors.level_3.upgrade_level = 3
	self.armors.level_4 = {}
	self.armors.level_4.name_id = "bm_armor_level_4"
	self.armors.level_4.sequence = "var_model_04"
	self.armors.level_4.upgrade_level = 4
	self.armors.level_5 = {}
	self.armors.level_5.name_id = "bm_armor_level_5"
	self.armors.level_5.sequence = "var_model_05"
	self.armors.level_5.upgrade_level = 5
	self.armors.level_6 = {}
	self.armors.level_6.name_id = "bm_armor_level_6"
	self.armors.level_6.sequence = "var_model_06"
	self.armors.level_6.upgrade_level = 6
	self.armors.level_7 = {}
	self.armors.level_7.name_id = "bm_armor_level_7"
	self.armors.level_7.sequence = "var_model_07"
	self.armors.level_7.upgrade_level = 7

	self:_add_desc_from_name_macro(self.armors)
end

function BlackMarketTweakData:_init_deployables(tweak_data)
	self.deployables = {}
	self.deployables.doctor_bag = {}
	self.deployables.doctor_bag.name_id = "bm_equipment_doctor_bag"
	self.deployables.ammo_bag = {}
	self.deployables.ammo_bag.name_id = "bm_equipment_ammo_bag"
	self.deployables.ecm_jammer = {}
	self.deployables.ecm_jammer.name_id = "bm_equipment_ecm_jammer"
	self.deployables.sentry_gun = {}
	self.deployables.sentry_gun.name_id = "bm_equipment_sentry_gun"
	self.deployables.sentry_gun_silent = {}
	self.deployables.sentry_gun_silent.name_id = "bm_equipment_sentry_gun_silent"
	self.deployables.trip_mine = {}
	self.deployables.trip_mine.name_id = "bm_equipment_trip_mine"
	self.deployables.armor_kit = {}
	self.deployables.armor_kit.name_id = "bm_equipment_armor_kit"
	self.deployables.first_aid_kit = {}
	self.deployables.first_aid_kit.name_id = "bm_equipment_first_aid_kit"
	self.deployables.bodybags_bag = {}
	self.deployables.bodybags_bag.name_id = "bm_equipment_bodybags_bag"
	self.deployables.grenade_crate = {}
	self.deployables.grenade_crate.name_id = "bm_equipment_grenade_crate"
	self.deployables.grenade_crate.dlc = "mxm"
	self.deployables.grenade_crate.texture_bundle_folder = "mxm"
	self.deployables.spy_camera = {
		dlc = "esp",
		name_id = "bm_equipment_spy_camera",
		texture_bundle_folder = "esp"
	}

	self:_add_desc_from_name_macro(self.deployables)
end

function BlackMarketTweakData:get_mask_icon(mask_id, character)
	if character and mask_id == "character_locked" then
		local character_name = CriminalsManager.convert_old_to_new_character_workname(character)

		mask_id = tweak_data.blackmarket.masks.character_locked[character_name] or mask_id
	end

	local guis_catalog = "guis/"
	local bundle_folder = tweak_data.blackmarket.masks[mask_id] and tweak_data.blackmarket.masks[mask_id].texture_bundle_folder

	if bundle_folder then
		guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
	end

	return guis_catalog .. "textures/pd2/blackmarket/icons/masks/" .. tostring(mask_id)
end

function BlackMarketTweakData:get_mask_materials_icon(material_id)
	local td_bm_mats = tweak_data.blackmarket.materials[material_id]

	if not td_bm_mats then
		return "guis/dlcs/lic/textures/pd2/blackmarket/icons/materials/nothing", Color.white
	end

	local guis_catalog = "guis/"
	local bundle_folder = td_bm_mats.texture_bundle_folder

	if bundle_folder then
		guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
	end

	local gui_icon_color, gui_icon_path

	if td_bm_mats.tintable_gui then
		gui_icon_path = td_bm_mats.tintable_gui
		gui_icon_color = td_bm_mats.color
	else
		gui_icon_path = guis_catalog .. "textures/pd2/blackmarket/icons/materials/" .. material_id
	end

	if not DB:has(Idstring("texture"), gui_icon_path) then
		gui_icon_path = "guis/textures/pd2/blackmarket/icons/materials/plastic"
		gui_icon_color = td_bm_mats.color
	end

	return gui_icon_path, gui_icon_color
end

function BlackMarketTweakData:get_character_icon(character)
	local character_name = CriminalsManager.convert_old_to_new_character_workname(character)
	local guis_catalog = "guis/"
	local character_table = tweak_data.blackmarket.characters[character] or tweak_data.blackmarket.characters.locked[character_name]
	local bundle_folder = character_table and character_table.texture_bundle_folder

	if bundle_folder then
		guis_catalog = guis_catalog .. "dlcs/" .. tostring(bundle_folder) .. "/"
	end

	return guis_catalog .. "textures/pd2/blackmarket/icons/characters/" .. character_name
end
