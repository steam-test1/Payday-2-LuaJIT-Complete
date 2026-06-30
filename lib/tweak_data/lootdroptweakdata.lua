LootDropTweakData = LootDropTweakData or class()

require("lib/tweak_data/GeneratedLootDropTweakData")

function LootDropTweakData:init(tweak_data)
	self:_init_card_types()

	self.PC_STEP = 10
	self.no_drop = {}
	self.no_drop.BASE = 35
	self.no_drop.HUMAN_STEP_MODIFIER = 10
	self.level_limit = 1
	self.risk_pc_multiplier = {
		0,
		0,
		0,
		0,
		0,
		0,
		0
	}
	self.risk_infamous_multiplier = {
		1,
		2,
		3,
		5,
		7,
		9,
		11
	}
	self.PC_CHANCE = {}
	self.PC_CHANCE[1] = 0.7
	self.PC_CHANCE[2] = 0.7
	self.PC_CHANCE[3] = 0.7
	self.PC_CHANCE[4] = 0.7
	self.PC_CHANCE[5] = 0.9
	self.PC_CHANCE[6] = 0.91
	self.PC_CHANCE[7] = 0.92
	self.PC_CHANCE[8] = 0.93
	self.PC_CHANCE[9] = 0.94
	self.PC_CHANCE[10] = 0.95
	self.STARS = {}
	self.STARS[1] = {
		pcs = {
			10,
			10
		}
	}
	self.STARS[2] = {
		pcs = {
			20,
			20
		}
	}
	self.STARS[3] = {
		pcs = {
			30,
			30
		}
	}
	self.STARS[4] = {
		pcs = {
			40,
			40
		}
	}
	self.STARS[5] = {
		pcs = {
			40,
			40
		}
	}
	self.STARS[6] = {
		pcs = {
			40,
			40
		}
	}
	self.STARS[7] = {
		pcs = {
			40,
			40
		}
	}
	self.STARS[8] = {
		pcs = {
			40,
			40
		}
	}
	self.STARS[9] = {
		pcs = {
			40,
			40
		}
	}
	self.STARS[10] = {
		pcs = {
			40,
			40
		}
	}
	self.STARS_CURVES = {
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1,
		1
	}
	self.WEIGHTED_TYPE_CHANCE = {}

	do
		local min = 10
		local max = 100
		local range = {
			cash = {
				20,
				5
			},
			weapon_mods = {
				50,
				45
			},
			textures = {
				7,
				12
			},
			masks = {
				10,
				15
			},
			xp = {
				8,
				0
			},
			materials = {
				9,
				14
			}
		}

		for i = min, max, 10 do
			local i_max = i / max
			local cash = math.lerp(range.cash[1], range.cash[2], i_max)
			local weapon_mods = math.lerp(range.weapon_mods[1], range.weapon_mods[2], i_max)
			local textures = math.lerp(range.textures[1], range.textures[2], i_max)
			local materials = math.lerp(range.materials[1], range.materials[2], i_max)
			local masks = math.lerp(range.masks[1], range.masks[2], i_max)
			local xp = math.lerp(range.xp[1], range.xp[2], i_max)

			self.WEIGHTED_TYPE_CHANCE[i] = {
				cash = cash,
				weapon_mods = weapon_mods,
				textures = textures,
				materials = materials,
				masks = masks,
				xp = xp
			}
		end
	end

	self.DEFAULT_WEIGHT = 1
	self.got_item_weight_mod = 0.5
	self.type_weight_mod_funcs = {}

	function self.type_weight_mod_funcs.weapon_mods(global_value, category, id)
		local weapons = managers.weapon_factory:get_weapons_uses_part(id) or {}
		local primaries = managers.blackmarket:get_crafted_category("primaries") or {}
		local secondaries = managers.blackmarket:get_crafted_category("secondaries") or {}
		local crafted_weapons = {}

		for _, weapon in pairs(primaries) do
			table.insert(crafted_weapons, weapon.factory_id)
		end

		for _, weapon in pairs(secondaries) do
			table.insert(crafted_weapons, weapon.factory_id)
		end

		crafted_weapons = table.list_union(crafted_weapons)

		for _, factory_id in pairs(weapons) do
			if table.contains(crafted_weapons, factory_id) then
				return 2
			end
		end

		return 1
	end

	function self.type_weight_mod_funcs.masks(global_value, category, id)
		local mask_inventory = managers.blackmarket:get_inventory_category("masks") or {}

		for _, data in pairs(mask_inventory) do
			if global_value == data.global_value and id == data.id then
				return 0.5
			end
		end

		return 1
	end

	local dlc_color = Color(255, 255, 212, 0) / 255
	local community_color = Color(255, 59, 174, 254) / 255
	local event_color = Color(255, 255, 145, 0) / 255

	self.global_value_category = {}
	self.global_value_category.normal = {}
	self.global_value_category.normal.name_id = "bm_global_value_normal"
	self.global_value_category.normal.sort_number = 0
	self.global_value_category.dlc = {}
	self.global_value_category.dlc.name_id = "bm_menu_dlc"
	self.global_value_category.dlc.sort_number = 10
	self.global_value_category.global_event = {}
	self.global_value_category.global_event.name_id = "bm_menu_global_event"
	self.global_value_category.global_event.sort_number = 20
	self.global_value_category.infamous = {}
	self.global_value_category.infamous.name_id = "bm_global_value_infamous"
	self.global_value_category.infamous.sort_number = 30
	self.global_value_category.collaboration = {}
	self.global_value_category.collaboration.name_id = "bm_global_value_collaboration"
	self.global_value_category.collaboration.sort_number = 25
	self.global_value_category.collectable = {}
	self.global_value_category.collectable.name_id = "bm_global_value_collectable"
	self.global_value_category.collectable.sort_number = 0
	self.global_values = {}
	self.global_values.normal = {}
	self.global_values.normal.name_id = "bm_global_value_normal"
	self.global_values.normal.color = Color.white
	self.global_values.normal.dlc = false
	self.global_values.normal.chance = 0.84
	self.global_values.normal.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "normal")
	self.global_values.normal.durability_multiplier = 1
	self.global_values.normal.drops = true
	self.global_values.normal.track = false
	self.global_values.normal.sort_number = 0
	self.global_values.normal.category = "normal"
	self.global_values.superior = {}
	self.global_values.superior.name_id = "bm_global_value_superior"
	self.global_values.superior.color = Color.blue
	self.global_values.superior.dlc = false
	self.global_values.superior.chance = 0.1
	self.global_values.superior.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "superior")
	self.global_values.superior.durability_multiplier = 1.5
	self.global_values.superior.drops = false
	self.global_values.superior.track = false
	self.global_values.superior.sort_number = 25
	self.global_values.superior.category = nil
	self.global_values.exceptional = {}
	self.global_values.exceptional.name_id = "bm_global_value_exceptional"
	self.global_values.exceptional.color = Color.yellow
	self.global_values.exceptional.dlc = false
	self.global_values.exceptional.chance = 0.05
	self.global_values.exceptional.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "exceptional")
	self.global_values.exceptional.durability_multiplier = 2.25
	self.global_values.exceptional.drops = false
	self.global_values.exceptional.track = false
	self.global_values.exceptional.sort_number = 26
	self.global_values.exceptional.category = nil
	self.global_values.infamous = {}
	self.global_values.infamous.name_id = "bm_global_value_infamous"
	self.global_values.infamous.desc_id = "menu_l_global_value_infamous"
	self.global_values.infamous.color = Color(1, 0.1, 1)
	self.global_values.infamous.dlc = false
	self.global_values.infamous.chance = 0.05
	self.global_values.infamous.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "infamous")
	self.global_values.infamous.durability_multiplier = 3
	self.global_values.infamous.drops = true
	self.global_values.infamous.track = false
	self.global_values.infamous.sort_number = 30
	self.global_values.infamous.category = "infamous"
	self.global_values.infamy = {}
	self.global_values.infamy.name_id = "bm_global_value_infamous"
	self.global_values.infamy.desc_id = "menu_l_global_value_infamous"
	self.global_values.infamy.color = Color(1, 0.1, 1)
	self.global_values.infamy.dlc = false
	self.global_values.infamy.chance = 0.05
	self.global_values.infamy.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "infamous")
	self.global_values.infamy.durability_multiplier = 3
	self.global_values.infamy.drops = false
	self.global_values.infamy.track = false
	self.global_values.infamy.sort_number = 35
	self.global_values.infamy.hide_unavailable = true
	self.global_values.infamy.category = "infamous"
	self.global_values.preorder = {}
	self.global_values.preorder.name_id = "bm_global_value_preorder"
	self.global_values.preorder.desc_id = "menu_l_global_value_preorder"
	self.global_values.preorder.color = dlc_color
	self.global_values.preorder.dlc = true
	self.global_values.preorder.chance = 1
	self.global_values.preorder.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "preorder")
	self.global_values.preorder.durability_multiplier = 1
	self.global_values.preorder.drops = false
	self.global_values.preorder.track = true
	self.global_values.preorder.sort_number = -10
	self.global_values.preorder.hide_unavailable = true
	self.global_values.preorder.category = "dlc"
	self.global_values.pd2_clan = {}
	self.global_values.pd2_clan.name_id = "bm_global_value_pd2_clan"
	self.global_values.pd2_clan.desc_id = "menu_l_global_value_pd2_clan"
	self.global_values.pd2_clan.unlock_id = "bm_global_value_pd2_clan_unlock"
	self.global_values.pd2_clan.color = community_color
	self.global_values.pd2_clan.dlc = true
	self.global_values.pd2_clan.chance = 1
	self.global_values.pd2_clan.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pd2_clan")
	self.global_values.pd2_clan.durability_multiplier = 1
	self.global_values.pd2_clan.drops = true
	self.global_values.pd2_clan.track = true
	self.global_values.pd2_clan.sort_number = -100
	self.global_values.pd2_clan.unique_lock_icon = "guis/textures/pd2/lock_community"
	self.global_values.pd2_clan.unique_lock_color = Color(255, 59, 174, 254) / 255
	self.global_values.poetry_soundtrack = {}
	self.global_values.poetry_soundtrack.name_id = "bm_global_value_poetry_soundtrack"
	self.global_values.poetry_soundtrack.desc_id = "menu_l_global_value_poetry_soundtrack"
	self.global_values.poetry_soundtrack.unlock_id = "bm_global_value_poetry_soundtrack_unlock"
	self.global_values.poetry_soundtrack.color = dlc_color
	self.global_values.poetry_soundtrack.dlc = true
	self.global_values.poetry_soundtrack.chance = 1
	self.global_values.poetry_soundtrack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "poetry_sountrack")
	self.global_values.poetry_soundtrack.durability_multiplier = 1
	self.global_values.poetry_soundtrack.drops = true
	self.global_values.poetry_soundtrack.track = true
	self.global_values.poetry_soundtrack.sort_number = 40
	self.global_values.poetry_soundtrack.hide_unavailable = false
	self.global_values.poetry_soundtrack.category = "dlc"
	self.global_values.halloween = {}
	self.global_values.halloween.name_id = "bm_global_value_halloween"
	self.global_values.halloween.desc_id = "menu_l_global_value_halloween"
	self.global_values.halloween.color = event_color
	self.global_values.halloween.dlc = false
	self.global_values.halloween.chance = 1
	self.global_values.halloween.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "halloween")
	self.global_values.halloween.durability_multiplier = 1
	self.global_values.halloween.drops = true
	self.global_values.halloween.track = true
	self.global_values.halloween.sort_number = 50
	self.global_values.halloween.hide_unavailable = true
	self.global_values.halloween.category = "global_event"
	self.global_values.xmas = {}
	self.global_values.xmas.name_id = "bm_global_value_xmas"
	self.global_values.xmas.desc_id = "menu_l_global_value_xmas"
	self.global_values.xmas.color = Color(255, 247, 86, 105) / 255
	self.global_values.xmas.dlc = false
	self.global_values.xmas.chance = 1
	self.global_values.xmas.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "xmas")
	self.global_values.xmas.durability_multiplier = 1
	self.global_values.xmas.drops = true
	self.global_values.xmas.track = true
	self.global_values.xmas.sort_number = 60
	self.global_values.xmas.hide_unavailable = true
	self.global_values.xmas.category = "global_event"
	self.global_values.twitch_pack = {}
	self.global_values.twitch_pack.name_id = "bm_global_value_twitch_pack"
	self.global_values.twitch_pack.desc_id = "menu_l_global_value_twitch_pack"
	self.global_values.twitch_pack.unlock_id = "bm_global_value_twitch_pack_unlock"
	self.global_values.twitch_pack.color = event_color
	self.global_values.twitch_pack.dlc = true
	self.global_values.twitch_pack.chance = 1
	self.global_values.twitch_pack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "twitch_pack")
	self.global_values.twitch_pack.durability_multiplier = 1
	self.global_values.twitch_pack.drops = true
	self.global_values.twitch_pack.track = true
	self.global_values.twitch_pack.sort_number = 70
	self.global_values.twitch_pack.hide_unavailable = true
	self.global_values.twitch_pack.category = "global_event"
	self.global_values.humble_pack2 = {}
	self.global_values.humble_pack2.name_id = "bm_global_value_humble_pack2"
	self.global_values.humble_pack2.desc_id = "menu_l_global_value_humble_pack2"
	self.global_values.humble_pack2.unlock_id = "bm_global_value_humble_pack2_unlock"
	self.global_values.humble_pack2.color = event_color
	self.global_values.humble_pack2.dlc = true
	self.global_values.humble_pack2.chance = 1
	self.global_values.humble_pack2.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "humble_pack2")
	self.global_values.humble_pack2.durability_multiplier = 1
	self.global_values.humble_pack2.drops = true
	self.global_values.humble_pack2.track = true
	self.global_values.humble_pack2.sort_number = 71
	self.global_values.humble_pack2.hide_unavailable = true
	self.global_values.humble_pack2.category = "global_event"
	self.global_values.alienware_alpha = {}
	self.global_values.alienware_alpha.name_id = "bm_global_value_alienware_alpha"
	self.global_values.alienware_alpha.desc_id = "menu_l_global_value_alienware_alpha"
	self.global_values.alienware_alpha.unlock_id = "bm_global_value_alienware_alpha_unlock"
	self.global_values.alienware_alpha.color = event_color
	self.global_values.alienware_alpha.dlc = true
	self.global_values.alienware_alpha.chance = 1
	self.global_values.alienware_alpha.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "alienware_alpha")
	self.global_values.alienware_alpha.durability_multiplier = 1
	self.global_values.alienware_alpha.drops = true
	self.global_values.alienware_alpha.track = true
	self.global_values.alienware_alpha.sort_number = 72
	self.global_values.alienware_alpha.hide_unavailable = true
	self.global_values.alienware_alpha.category = "global_event"
	self.global_values.alienware_alpha_promo = {}
	self.global_values.alienware_alpha_promo.name_id = "bm_global_value_alienware_alpha_promo"
	self.global_values.alienware_alpha_promo.desc_id = "menu_l_global_value_alienware_alpha_promo"
	self.global_values.alienware_alpha_promo.unlock_id = "bm_global_value_alienware_alpha_promo_unlock"
	self.global_values.alienware_alpha_promo.color = event_color
	self.global_values.alienware_alpha_promo.dlc = true
	self.global_values.alienware_alpha_promo.chance = 1
	self.global_values.alienware_alpha_promo.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "alienware_alpha_promo")
	self.global_values.alienware_alpha_promo.durability_multiplier = 1
	self.global_values.alienware_alpha_promo.drops = true
	self.global_values.alienware_alpha_promo.track = true
	self.global_values.alienware_alpha_promo.sort_number = 73
	self.global_values.alienware_alpha_promo.hide_unavailable = true
	self.global_values.alienware_alpha_promo.category = "global_event"
	self.global_values.humble_pack3 = {}
	self.global_values.humble_pack3.name_id = "bm_global_value_humble_pack3"
	self.global_values.humble_pack3.desc_id = "menu_l_global_value_humble_pack3"
	self.global_values.humble_pack3.unlock_id = "bm_global_value_humble_pack3_unlock"
	self.global_values.humble_pack3.color = event_color
	self.global_values.humble_pack3.dlc = true
	self.global_values.humble_pack3.chance = 1
	self.global_values.humble_pack3.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "humble_pack3")
	self.global_values.humble_pack3.durability_multiplier = 1
	self.global_values.humble_pack3.drops = true
	self.global_values.humble_pack3.track = true
	self.global_values.humble_pack3.sort_number = 74
	self.global_values.humble_pack3.hide_unavailable = true
	self.global_values.humble_pack3.category = "global_event"
	self.global_values.humble_pack4 = {}
	self.global_values.humble_pack4.name_id = "bm_global_value_humble_pack4"
	self.global_values.humble_pack4.desc_id = "menu_l_global_value_humble_pack4"
	self.global_values.humble_pack4.unlock_id = "bm_global_value_humble_pack4_unlock"
	self.global_values.humble_pack4.color = event_color
	self.global_values.humble_pack4.dlc = true
	self.global_values.humble_pack4.chance = 1
	self.global_values.humble_pack4.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "humble_pack4")
	self.global_values.humble_pack4.durability_multiplier = 1
	self.global_values.humble_pack4.drops = true
	self.global_values.humble_pack4.track = true
	self.global_values.humble_pack4.sort_number = 75
	self.global_values.humble_pack4.hide_unavailable = true
	self.global_values.humble_pack4.category = "global_event"
	self.global_values.e3_s15a = {}
	self.global_values.e3_s15a.name_id = "bm_global_value_e3_s15a"
	self.global_values.e3_s15a.desc_id = "menu_l_global_value_e3_s15a"
	self.global_values.e3_s15a.unlock_id = "bm_global_value_e3_s15a_unlock"
	self.global_values.e3_s15a.color = event_color
	self.global_values.e3_s15a.dlc = true
	self.global_values.e3_s15a.chance = 1
	self.global_values.e3_s15a.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "e3_s15a")
	self.global_values.e3_s15a.durability_multiplier = 1
	self.global_values.e3_s15a.drops = true
	self.global_values.e3_s15a.track = true
	self.global_values.e3_s15a.sort_number = 76
	self.global_values.e3_s15a.hide_unavailable = true
	self.global_values.e3_s15a.category = "global_event"
	self.global_values.e3_s15b = {}
	self.global_values.e3_s15b.name_id = "bm_global_value_e3_s15b"
	self.global_values.e3_s15b.desc_id = "menu_l_global_value_e3_s15b"
	self.global_values.e3_s15b.unlock_id = "bm_global_value_e3_s15b_unlock"
	self.global_values.e3_s15b.color = event_color
	self.global_values.e3_s15b.dlc = true
	self.global_values.e3_s15b.chance = 1
	self.global_values.e3_s15b.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "e3_s15b")
	self.global_values.e3_s15b.durability_multiplier = 1
	self.global_values.e3_s15b.drops = true
	self.global_values.e3_s15b.track = true
	self.global_values.e3_s15b.sort_number = 77
	self.global_values.e3_s15b.hide_unavailable = true
	self.global_values.e3_s15b.category = "global_event"
	self.global_values.e3_s15c = {}
	self.global_values.e3_s15c.name_id = "bm_global_value_e3_s15c"
	self.global_values.e3_s15c.desc_id = "menu_l_global_value_e3_s15c"
	self.global_values.e3_s15c.unlock_id = "bm_global_value_e3_s15c_unlock"
	self.global_values.e3_s15c.color = event_color
	self.global_values.e3_s15c.dlc = true
	self.global_values.e3_s15c.chance = 1
	self.global_values.e3_s15c.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "e3_s15c")
	self.global_values.e3_s15c.durability_multiplier = 1
	self.global_values.e3_s15c.drops = true
	self.global_values.e3_s15c.track = true
	self.global_values.e3_s15c.sort_number = 78
	self.global_values.e3_s15c.hide_unavailable = true
	self.global_values.e3_s15c.category = "global_event"
	self.global_values.e3_s15d = {}
	self.global_values.e3_s15d.name_id = "bm_global_value_e3_s15d"
	self.global_values.e3_s15d.desc_id = "menu_l_global_value_e3_s15d"
	self.global_values.e3_s15d.unlock_id = "bm_global_value_e3_s15d_unlock"
	self.global_values.e3_s15d.color = event_color
	self.global_values.e3_s15d.dlc = true
	self.global_values.e3_s15d.chance = 1
	self.global_values.e3_s15d.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "e3_s15d")
	self.global_values.e3_s15d.durability_multiplier = 1
	self.global_values.e3_s15d.drops = true
	self.global_values.e3_s15d.track = true
	self.global_values.e3_s15d.sort_number = 79
	self.global_values.e3_s15d.hide_unavailable = true
	self.global_values.e3_s15d.category = "global_event"
	self.global_values.bobblehead = {}
	self.global_values.bobblehead.name_id = "bm_global_value_bobblehead"
	self.global_values.bobblehead.desc_id = "menu_l_global_value_bobblehead"
	self.global_values.bobblehead.unlock_id = "bm_global_value_bobblehead_unlock"
	self.global_values.bobblehead.color = event_color
	self.global_values.bobblehead.dlc = true
	self.global_values.bobblehead.chance = 1
	self.global_values.bobblehead.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "bobblehead")
	self.global_values.bobblehead.durability_multiplier = 1
	self.global_values.bobblehead.drops = true
	self.global_values.bobblehead.track = true
	self.global_values.bobblehead.sort_number = 80
	self.global_values.bobblehead.hide_unavailable = true
	self.global_values.bobblehead.category = "global_event"
	self.global_values.pdcon_2015 = {}
	self.global_values.pdcon_2015.name_id = "bm_global_value_pdcon_2015"
	self.global_values.pdcon_2015.desc_id = "menu_l_global_value_pdcon_2015"
	self.global_values.pdcon_2015.unlock_id = "bm_global_value_pdcon_2015_unlock"
	self.global_values.pdcon_2015.color = event_color
	self.global_values.pdcon_2015.dlc = true
	self.global_values.pdcon_2015.chance = 1
	self.global_values.pdcon_2015.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pdcon_2015")
	self.global_values.pdcon_2015.durability_multiplier = 1
	self.global_values.pdcon_2015.drops = true
	self.global_values.pdcon_2015.track = true
	self.global_values.pdcon_2015.sort_number = 81
	self.global_values.pdcon_2015.hide_unavailable = true
	self.global_values.pdcon_2015.category = "global_event"
	self.global_values.pdcon_2016 = {}
	self.global_values.pdcon_2016.name_id = "bm_global_value_pdcon_2016"
	self.global_values.pdcon_2016.desc_id = "menu_l_global_value_pdcon_2016"
	self.global_values.pdcon_2016.unlock_id = "bm_global_value_pdcon_2016_unlock"
	self.global_values.pdcon_2016.color = event_color
	self.global_values.pdcon_2016.dlc = true
	self.global_values.pdcon_2016.chance = 1
	self.global_values.pdcon_2016.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pdcon_2016")
	self.global_values.pdcon_2016.durability_multiplier = 1
	self.global_values.pdcon_2016.drops = true
	self.global_values.pdcon_2016.track = true
	self.global_values.pdcon_2016.sort_number = 83
	self.global_values.pdcon_2016.hide_unavailable = true
	self.global_values.pdcon_2016.category = "global_event"
	self.global_values.jigg = {}
	self.global_values.jigg.name_id = "bm_global_value_jigg"
	self.global_values.jigg.desc_id = "menu_l_global_value_jigg"
	self.global_values.jigg.unlock_id = "bm_global_value_jigg_unlock"
	self.global_values.jigg.color = event_color
	self.global_values.jigg.dlc = true
	self.global_values.jigg.category = "global_event"
	self.global_values.jigg.chance = 1
	self.global_values.jigg.value_multiplier = 1
	self.global_values.jigg.durability_multiplier = 1
	self.global_values.jigg.drops = true
	self.global_values.jigg.track = true
	self.global_values.jigg.sort_number = 82
	self.global_values.jigg.hide_unavailable = true
	self.global_values.xmas_soundtrack = {}
	self.global_values.xmas_soundtrack.name_id = "bm_global_value_xmas_soundtrack"
	self.global_values.xmas_soundtrack.desc_id = "menu_l_global_value_xmas_soundtrack"
	self.global_values.xmas_soundtrack.unlock_id = "bm_global_value_xmas_soundtrack_unlock"
	self.global_values.xmas_soundtrack.color = dlc_color
	self.global_values.xmas_soundtrack.dlc = true
	self.global_values.xmas_soundtrack.chance = 1
	self.global_values.xmas_soundtrack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "xmas_soundtrack")
	self.global_values.xmas_soundtrack.durability_multiplier = 1
	self.global_values.xmas_soundtrack.drops = true
	self.global_values.xmas_soundtrack.track = true
	self.global_values.xmas_soundtrack.sort_number = 60
	self.global_values.xmas_soundtrack.hide_unavailable = false
	self.global_values.xmas_soundtrack.category = "dlc"
	self.global_values.armored_transport = {}
	self.global_values.armored_transport.name_id = "bm_global_value_armored_transport"
	self.global_values.armored_transport.desc_id = "menu_l_global_value_armored_transport"
	self.global_values.armored_transport.unlock_id = "bm_global_value_armored_transport_unlock"
	self.global_values.armored_transport.color = dlc_color
	self.global_values.armored_transport.dlc = true
	self.global_values.armored_transport.chance = 1
	self.global_values.armored_transport.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "armored_transport")
	self.global_values.armored_transport.durability_multiplier = 1
	self.global_values.armored_transport.drops = true
	self.global_values.armored_transport.track = true
	self.global_values.armored_transport.sort_number = 70
	self.global_values.armored_transport.category = "dlc"
	self.global_values.gage_pack = {}
	self.global_values.gage_pack.name_id = "bm_global_value_gage_pack"
	self.global_values.gage_pack.desc_id = "menu_l_global_value_gage_pack"
	self.global_values.gage_pack.unlock_id = "bm_global_value_gage_pack_unlock"
	self.global_values.gage_pack.color = dlc_color
	self.global_values.gage_pack.dlc = true
	self.global_values.gage_pack.chance = 1
	self.global_values.gage_pack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack")
	self.global_values.gage_pack.durability_multiplier = 1
	self.global_values.gage_pack.drops = true
	self.global_values.gage_pack.track = true
	self.global_values.gage_pack.sort_number = 80
	self.global_values.gage_pack.category = "dlc"
	self.global_values.gage_pack_lmg = {}
	self.global_values.gage_pack_lmg.name_id = "bm_global_value_gage_pack_lmg"
	self.global_values.gage_pack_lmg.desc_id = "menu_l_global_value_gage_pack_lmg"
	self.global_values.gage_pack_lmg.unlock_id = "bm_global_value_gage_pack_lmg_unlock"
	self.global_values.gage_pack_lmg.color = dlc_color
	self.global_values.gage_pack_lmg.dlc = true
	self.global_values.gage_pack_lmg.chance = 1
	self.global_values.gage_pack_lmg.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_lmg")
	self.global_values.gage_pack_lmg.durability_multiplier = 1
	self.global_values.gage_pack_lmg.drops = true
	self.global_values.gage_pack_lmg.track = true
	self.global_values.gage_pack_lmg.sort_number = 81
	self.global_values.gage_pack_lmg.category = "dlc"
	self.global_values.gage_pack_jobs = {}
	self.global_values.gage_pack_jobs.name_id = "bm_global_value_gage_pack_jobs"
	self.global_values.gage_pack_jobs.desc_id = "menu_l_global_value_gage_pack_jobs"
	self.global_values.gage_pack_jobs.unlock_id = "bm_global_value_gage_pack_jobs_unlock"
	self.global_values.gage_pack_jobs.color = dlc_color
	self.global_values.gage_pack_jobs.dlc = true
	self.global_values.gage_pack_jobs.chance = 1
	self.global_values.gage_pack_jobs.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_jobs")
	self.global_values.gage_pack_jobs.durability_multiplier = 1
	self.global_values.gage_pack_jobs.drops = true
	self.global_values.gage_pack_jobs.track = true
	self.global_values.gage_pack_jobs.sort_number = 82
	self.global_values.gage_pack_jobs.category = "dlc"
	self.global_values.gage_pack_snp = {}
	self.global_values.gage_pack_snp.name_id = "bm_global_value_gage_pack_snp"
	self.global_values.gage_pack_snp.desc_id = "menu_l_global_value_gage_pack_snp"
	self.global_values.gage_pack_snp.unlock_id = "bm_global_value_gage_pack_snp_unlock"
	self.global_values.gage_pack_snp.color = dlc_color
	self.global_values.gage_pack_snp.dlc = true
	self.global_values.gage_pack_snp.chance = 1
	self.global_values.gage_pack_snp.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_snp")
	self.global_values.gage_pack_snp.durability_multiplier = 1
	self.global_values.gage_pack_snp.drops = true
	self.global_values.gage_pack_snp.track = true
	self.global_values.gage_pack_snp.sort_number = 83
	self.global_values.gage_pack_snp.category = "dlc"
	self.global_values.big_bank = {}
	self.global_values.big_bank.name_id = "bm_global_value_big_bank_snp"
	self.global_values.big_bank.desc_id = "menu_l_global_value_big_bank_snp"
	self.global_values.big_bank.unlock_id = "bm_global_value_big_bank_snp_unlock"
	self.global_values.big_bank.color = dlc_color
	self.global_values.big_bank.dlc = true
	self.global_values.big_bank.chance = 1
	self.global_values.big_bank.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "big_bank")
	self.global_values.big_bank.durability_multiplier = 1
	self.global_values.big_bank.drops = true
	self.global_values.big_bank.track = true
	self.global_values.big_bank.sort_number = 84
	self.global_values.big_bank.category = "dlc"
	self.global_values.gage_pack_shotgun = {}
	self.global_values.gage_pack_shotgun.name_id = "bm_global_value_gage_pack_shotgun"
	self.global_values.gage_pack_shotgun.desc_id = "menu_l_global_value_gage_pack_shotgun"
	self.global_values.gage_pack_shotgun.unlock_id = "bm_global_value_gage_pack_shotgun_unlock"
	self.global_values.gage_pack_shotgun.color = dlc_color
	self.global_values.gage_pack_shotgun.dlc = true
	self.global_values.gage_pack_shotgun.chance = 1
	self.global_values.gage_pack_shotgun.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_shotgun")
	self.global_values.gage_pack_shotgun.durability_multiplier = 1
	self.global_values.gage_pack_shotgun.drops = true
	self.global_values.gage_pack_shotgun.track = true
	self.global_values.gage_pack_shotgun.sort_number = 85
	self.global_values.gage_pack_shotgun.category = "dlc"
	self.global_values.gage_pack_assault = {}
	self.global_values.gage_pack_assault.name_id = "bm_global_value_gage_pack_assault"
	self.global_values.gage_pack_assault.desc_id = "menu_l_global_value_gage_pack_assault"
	self.global_values.gage_pack_assault.unlock_id = "bm_global_value_gage_pack_assault_unlock"
	self.global_values.gage_pack_assault.color = dlc_color
	self.global_values.gage_pack_assault.dlc = true
	self.global_values.gage_pack_assault.chance = 1
	self.global_values.gage_pack_assault.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_assault")
	self.global_values.gage_pack_assault.durability_multiplier = 1
	self.global_values.gage_pack_assault.drops = true
	self.global_values.gage_pack_assault.track = true
	self.global_values.gage_pack_assault.sort_number = 86
	self.global_values.gage_pack_assault.category = "dlc"
	self.global_values.hl_miami = {}
	self.global_values.hl_miami.name_id = "bm_global_value_hl_miami"
	self.global_values.hl_miami.desc_id = "menu_l_global_value_hl_miami"
	self.global_values.hl_miami.unlock_id = "bm_global_value_hl_miami_unlock"
	self.global_values.hl_miami.color = dlc_color
	self.global_values.hl_miami.dlc = true
	self.global_values.hl_miami.chance = 1
	self.global_values.hl_miami.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hl_miami")
	self.global_values.hl_miami.durability_multiplier = 1
	self.global_values.hl_miami.drops = true
	self.global_values.hl_miami.track = true
	self.global_values.hl_miami.sort_number = 87
	self.global_values.hl_miami.category = "dlc"
	self.global_values.hlm_game = {}
	self.global_values.hlm_game.name_id = "bm_global_value_hlm_game"
	self.global_values.hlm_game.desc_id = "menu_l_global_value_hlm_game"
	self.global_values.hlm_game.unlock_id = "bm_global_value_hlm_game_unlock"
	self.global_values.hlm_game.color = dlc_color
	self.global_values.hlm_game.dlc = true
	self.global_values.hlm_game.chance = 1
	self.global_values.hlm_game.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hlm_game")
	self.global_values.hlm_game.durability_multiplier = 1
	self.global_values.hlm_game.drops = true
	self.global_values.hlm_game.track = true
	self.global_values.hlm_game.sort_number = 88
	self.global_values.hlm_game.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.hlm_game.hide_unavailable = SystemInfo:distribution() == Idstring("EPIC") and true or false
	self.global_values.hlm_game.category = "collaboration"
	self.global_values.hlm2 = {}
	self.global_values.hlm2.name_id = "bm_global_value_hlm2"
	self.global_values.hlm2.desc_id = "menu_l_global_value_hlm2"
	self.global_values.hlm2.unlock_id = "bm_global_value_hlm2_unlock"
	self.global_values.hlm2.color = dlc_color
	self.global_values.hlm2.dlc = true
	self.global_values.hlm2.chance = 1
	self.global_values.hlm2.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hlm2")
	self.global_values.hlm2.durability_multiplier = 1
	self.global_values.hlm2.drops = true
	self.global_values.hlm2.track = true
	self.global_values.hlm2.sort_number = 89
	self.global_values.hlm2.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.hlm2.hide_unavailable = SystemInfo:distribution() == Idstring("EPIC") and true or false
	self.global_values.hlm2.category = "collaboration"
	self.global_values.hlm2_deluxe = {}
	self.global_values.hlm2_deluxe.name_id = "bm_global_value_hlm2_deluxe"
	self.global_values.hlm2_deluxe.desc_id = "menu_l_global_value_hlm2_deluxe"
	self.global_values.hlm2_deluxe.unlock_id = "bm_global_value_hlm2_deluxe_unlock"
	self.global_values.hlm2_deluxe.color = dlc_color
	self.global_values.hlm2_deluxe.dlc = true
	self.global_values.hlm2_deluxe.chance = 1
	self.global_values.hlm2_deluxe.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hlm2_deluxe")
	self.global_values.hlm2_deluxe.durability_multiplier = 1
	self.global_values.hlm2_deluxe.drops = true
	self.global_values.hlm2_deluxe.track = true
	self.global_values.hlm2_deluxe.sort_number = 90
	self.global_values.hlm2_deluxe.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.hlm2_deluxe.hide_unavailable = SystemInfo:distribution() == Idstring("EPIC") and true or false
	self.global_values.hlm2_deluxe.category = "collaboration"
	self.global_values.speedrunners = {}
	self.global_values.speedrunners.name_id = "bm_global_value_speedrunners"
	self.global_values.speedrunners.desc_id = "menu_l_global_value_speedrunners"
	self.global_values.speedrunners.unlock_id = "bm_global_value_speedrunners_unlock"
	self.global_values.speedrunners.color = dlc_color
	self.global_values.speedrunners.dlc = true
	self.global_values.speedrunners.chance = 1
	self.global_values.speedrunners.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "speedrunners")
	self.global_values.speedrunners.durability_multiplier = 1
	self.global_values.speedrunners.drops = true
	self.global_values.speedrunners.track = true
	self.global_values.speedrunners.sort_number = 91
	self.global_values.speedrunners.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.speedrunners.category = "collaboration"
	self.global_values.gage_pack_historical = {}
	self.global_values.gage_pack_historical.name_id = "bm_global_value_gage_pack_historical"
	self.global_values.gage_pack_historical.desc_id = "menu_l_global_value_gage_pack_historical"
	self.global_values.gage_pack_historical.unlock_id = "bm_global_value_gage_pack_historical_unlock"
	self.global_values.gage_pack_historical.color = dlc_color
	self.global_values.gage_pack_historical.dlc = true
	self.global_values.gage_pack_historical.chance = 1
	self.global_values.gage_pack_historical.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "gage_pack_historical")
	self.global_values.gage_pack_historical.durability_multiplier = 1
	self.global_values.gage_pack_historical.drops = true
	self.global_values.gage_pack_historical.track = true
	self.global_values.gage_pack_historical.sort_number = 89
	self.global_values.gage_pack_historical.category = "dlc"
	self.global_values.character_pack_clover = {}
	self.global_values.character_pack_clover.name_id = "bm_global_value_character_pack_clover"
	self.global_values.character_pack_clover.desc_id = "menu_l_global_value_character_pack_clover"
	self.global_values.character_pack_clover.unlock_id = "bm_global_value_character_pack_clover_unlock"
	self.global_values.character_pack_clover.color = dlc_color
	self.global_values.character_pack_clover.dlc = true
	self.global_values.character_pack_clover.chance = 1
	self.global_values.character_pack_clover.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "character_pack_clover")
	self.global_values.character_pack_clover.durability_multiplier = 1
	self.global_values.character_pack_clover.drops = true
	self.global_values.character_pack_clover.track = true
	self.global_values.character_pack_clover.sort_number = 90
	self.global_values.character_pack_clover.category = "dlc"
	self.global_values.hope_diamond = {}
	self.global_values.hope_diamond.name_id = "bm_global_value_hope_diamond"
	self.global_values.hope_diamond.desc_id = "menu_l_global_value_hope_diamond"
	self.global_values.hope_diamond.unlock_id = "bm_global_value_hope_diamond_unlock"
	self.global_values.hope_diamond.color = dlc_color
	self.global_values.hope_diamond.dlc = true
	self.global_values.hope_diamond.chance = 1
	self.global_values.hope_diamond.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "hope_diamond")
	self.global_values.hope_diamond.durability_multiplier = 1
	self.global_values.hope_diamond.drops = true
	self.global_values.hope_diamond.track = true
	self.global_values.hope_diamond.sort_number = 91
	self.global_values.hope_diamond.category = "dlc"
	self.global_values.goty_weapon_bundle_2014 = {}
	self.global_values.goty_weapon_bundle_2014.name_id = "bm_global_value_goty_weapon_bundle_2014"
	self.global_values.goty_weapon_bundle_2014.desc_id = "menu_l_global_value_goty_weapon_bundle_2014"
	self.global_values.goty_weapon_bundle_2014.unlock_id = "bm_global_value_goty_weapon_bundle_2014_unlock"
	self.global_values.goty_weapon_bundle_2014.color = dlc_color
	self.global_values.goty_weapon_bundle_2014.dlc = true
	self.global_values.goty_weapon_bundle_2014.chance = 1
	self.global_values.goty_weapon_bundle_2014.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "goty_weapon_bundle_2014")
	self.global_values.goty_weapon_bundle_2014.durability_multiplier = 1
	self.global_values.goty_weapon_bundle_2014.drops = true
	self.global_values.goty_weapon_bundle_2014.track = true
	self.global_values.goty_weapon_bundle_2014.sort_number = 92
	self.global_values.goty_weapon_bundle_2014.category = "dlc"
	self.global_values.goty_heist_bundle_2014 = {}
	self.global_values.goty_heist_bundle_2014.name_id = "bm_global_value_goty_heist_bundle_2014"
	self.global_values.goty_heist_bundle_2014.desc_id = "menu_l_global_value_goty_heist_bundle_2014"
	self.global_values.goty_heist_bundle_2014.unlock_id = "bm_global_value_goty_heist_bundle_2014_unlock"
	self.global_values.goty_heist_bundle_2014.color = dlc_color
	self.global_values.goty_heist_bundle_2014.dlc = true
	self.global_values.goty_heist_bundle_2014.chance = 1
	self.global_values.goty_heist_bundle_2014.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "goty_heist_bundle_2014")
	self.global_values.goty_heist_bundle_2014.durability_multiplier = 1
	self.global_values.goty_heist_bundle_2014.drops = true
	self.global_values.goty_heist_bundle_2014.track = true
	self.global_values.goty_heist_bundle_2014.sort_number = 93
	self.global_values.goty_heist_bundle_2014.category = "dlc"
	self.global_values.goty_dlc_bundle_2014 = {}
	self.global_values.goty_dlc_bundle_2014.name_id = "bm_global_value_goty_dlc_bundle_2014"
	self.global_values.goty_dlc_bundle_2014.desc_id = "menu_l_global_value_goty_dlc_bundle_2014"
	self.global_values.goty_dlc_bundle_2014.unlock_id = "bm_global_value_goty_dlc_bundle_2014_unlock"
	self.global_values.goty_dlc_bundle_2014.color = dlc_color
	self.global_values.goty_dlc_bundle_2014.dlc = true
	self.global_values.goty_dlc_bundle_2014.chance = 1
	self.global_values.goty_dlc_bundle_2014.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "goty_dlc_bundle_2014")
	self.global_values.goty_dlc_bundle_2014.durability_multiplier = 1
	self.global_values.goty_dlc_bundle_2014.drops = true
	self.global_values.goty_dlc_bundle_2014.track = true
	self.global_values.goty_dlc_bundle_2014.sort_number = 94
	self.global_values.goty_dlc_bundle_2014.category = "dlc"
	self.global_values.character_pack_dragan = {}
	self.global_values.character_pack_dragan.name_id = "bm_global_value_character_pack_dragan"
	self.global_values.character_pack_dragan.desc_id = "menu_l_global_value_character_pack_dragan"
	self.global_values.character_pack_dragan.unlock_id = "bm_global_value_character_pack_dragan_unlock"
	self.global_values.character_pack_dragan.color = dlc_color
	self.global_values.character_pack_dragan.dlc = true
	self.global_values.character_pack_dragan.chance = 1
	self.global_values.character_pack_dragan.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "character_pack_dragan")
	self.global_values.character_pack_dragan.durability_multiplier = 1
	self.global_values.character_pack_dragan.drops = true
	self.global_values.character_pack_dragan.track = true
	self.global_values.character_pack_dragan.sort_number = 95
	self.global_values.character_pack_dragan.category = "dlc"
	self.global_values.the_bomb = {}
	self.global_values.the_bomb.name_id = "bm_global_value_the_bomb"
	self.global_values.the_bomb.desc_id = "menu_l_global_value_the_bomb"
	self.global_values.the_bomb.unlock_id = "bm_global_value_the_bomb_unlock"
	self.global_values.the_bomb.color = dlc_color
	self.global_values.the_bomb.dlc = true
	self.global_values.the_bomb.chance = 1
	self.global_values.the_bomb.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "the_bomb")
	self.global_values.the_bomb.durability_multiplier = 1
	self.global_values.the_bomb.drops = true
	self.global_values.the_bomb.track = true
	self.global_values.the_bomb.sort_number = 96
	self.global_values.the_bomb.category = "dlc"
	self.global_values.akm4_pack = {}
	self.global_values.akm4_pack.name_id = "bm_global_value_akm4_pack"
	self.global_values.akm4_pack.desc_id = "menu_l_global_value_akm4_pack"
	self.global_values.akm4_pack.unlock_id = "bm_global_value_akm4_pack_unlock"
	self.global_values.akm4_pack.color = dlc_color
	self.global_values.akm4_pack.dlc = true
	self.global_values.akm4_pack.chance = 1
	self.global_values.akm4_pack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "akm4_pack")
	self.global_values.akm4_pack.durability_multiplier = 1
	self.global_values.akm4_pack.drops = true
	self.global_values.akm4_pack.track = true
	self.global_values.akm4_pack.sort_number = 97
	self.global_values.akm4_pack.category = "dlc"
	self.global_values.overkill_pack = {}
	self.global_values.overkill_pack.name_id = "bm_global_value_overkill_pack"
	self.global_values.overkill_pack.desc_id = "menu_l_global_value_overkill_pack"
	self.global_values.overkill_pack.unlock_id = "bm_global_value_overkill_pack_unlock"
	self.global_values.overkill_pack.color = dlc_color
	self.global_values.overkill_pack.dlc = true
	self.global_values.overkill_pack.chance = 1
	self.global_values.overkill_pack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "overkill_pack")
	self.global_values.overkill_pack.durability_multiplier = 1
	self.global_values.overkill_pack.drops = true
	self.global_values.overkill_pack.track = true
	self.global_values.overkill_pack.sort_number = 98
	self.global_values.overkill_pack.category = "dlc"
	self.global_values.complete_overkill_pack = {}
	self.global_values.complete_overkill_pack.name_id = "bm_global_value_complete_overkill_pack"
	self.global_values.complete_overkill_pack.desc_id = "menu_l_global_value_complete_overkill_pack"
	self.global_values.complete_overkill_pack.unlock_id = "bm_global_value_complete_overkill_pack_unlock"
	self.global_values.complete_overkill_pack.color = dlc_color
	self.global_values.complete_overkill_pack.dlc = true
	self.global_values.complete_overkill_pack.chance = 1
	self.global_values.complete_overkill_pack.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "complete_overkill_pack")
	self.global_values.complete_overkill_pack.durability_multiplier = 1
	self.global_values.complete_overkill_pack.drops = true
	self.global_values.complete_overkill_pack.track = true
	self.global_values.complete_overkill_pack.sort_number = 99
	self.global_values.complete_overkill_pack.category = "dlc"
	self.global_values.butch_pack_free = {}
	self.global_values.butch_pack_free.name_id = "bm_global_value_butch_pack_free"
	self.global_values.butch_pack_free.desc_id = "menu_l_global_value_butch_pack_free"
	self.global_values.butch_pack_free.color = dlc_color
	self.global_values.butch_pack_free.dlc = true
	self.global_values.butch_pack_free.chance = 1
	self.global_values.butch_pack_free.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "butch_pack_free")
	self.global_values.butch_pack_free.durability_multiplier = 1
	self.global_values.butch_pack_free.drops = true
	self.global_values.butch_pack_free.track = true
	self.global_values.butch_pack_free.sort_number = 100
	self.global_values.butch_pack_free.category = "dlc"
	self.global_values.bbq = {}
	self.global_values.bbq.name_id = "bm_global_value_bbq"
	self.global_values.bbq.desc_id = "menu_l_global_value_bbq"
	self.global_values.bbq.unlock_id = "bm_global_value_bbq_unlock"
	self.global_values.bbq.color = dlc_color
	self.global_values.bbq.dlc = true
	self.global_values.bbq.chance = 1
	self.global_values.bbq.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "bbq")
	self.global_values.bbq.durability_multiplier = 1
	self.global_values.bbq.drops = true
	self.global_values.bbq.track = true
	self.global_values.bbq.sort_number = 101
	self.global_values.bbq.category = "dlc"
	self.global_values.west = {}
	self.global_values.west.name_id = "bm_global_value_west"
	self.global_values.west.desc_id = "menu_l_global_value_west"
	self.global_values.west.unlock_id = "bm_global_value_west_unlock"
	self.global_values.west.color = dlc_color
	self.global_values.west.dlc = true
	self.global_values.west.chance = 1
	self.global_values.west.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "west")
	self.global_values.west.durability_multiplier = 1
	self.global_values.west.drops = true
	self.global_values.west.track = true
	self.global_values.west.sort_number = 102
	self.global_values.west.category = "dlc"
	self.global_values.arena = {}
	self.global_values.arena.name_id = "bm_global_value_arena"
	self.global_values.arena.desc_id = "menu_l_global_value_arena"
	self.global_values.arena.unlock_id = "bm_global_value_arena_unlock"
	self.global_values.arena.color = dlc_color
	self.global_values.arena.dlc = true
	self.global_values.arena.chance = 1
	self.global_values.arena.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "arena")
	self.global_values.arena.durability_multiplier = 1
	self.global_values.arena.drops = true
	self.global_values.arena.track = true
	self.global_values.arena.sort_number = 103
	self.global_values.arena.category = "dlc"
	self.global_values.character_pack_sokol = {}
	self.global_values.character_pack_sokol.name_id = "bm_global_value_character_pack_sokol"
	self.global_values.character_pack_sokol.desc_id = "menu_l_global_value_character_pack_sokol"
	self.global_values.character_pack_sokol.unlock_id = "bm_global_value_character_pack_sokol_unlock"
	self.global_values.character_pack_sokol.color = dlc_color
	self.global_values.character_pack_sokol.dlc = true
	self.global_values.character_pack_sokol.chance = 1
	self.global_values.character_pack_sokol.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "character_pack_sokol")
	self.global_values.character_pack_sokol.durability_multiplier = 1
	self.global_values.character_pack_sokol.drops = true
	self.global_values.character_pack_sokol.track = true
	self.global_values.character_pack_sokol.sort_number = 104
	self.global_values.character_pack_sokol.category = "dlc"
	self.global_values.kenaz = {}
	self.global_values.kenaz.name_id = "bm_global_value_kenaz"
	self.global_values.kenaz.desc_id = "menu_l_global_value_kenaz"
	self.global_values.kenaz.unlock_id = "bm_global_value_kenaz_unlock"
	self.global_values.kenaz.color = dlc_color
	self.global_values.kenaz.dlc = true
	self.global_values.kenaz.chance = 1
	self.global_values.kenaz.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "kenaz")
	self.global_values.kenaz.durability_multiplier = 1
	self.global_values.kenaz.drops = true
	self.global_values.kenaz.track = true
	self.global_values.kenaz.sort_number = 105
	self.global_values.kenaz.category = "dlc"
	self.global_values.turtles = {}
	self.global_values.turtles.name_id = "bm_global_value_turtles"
	self.global_values.turtles.desc_id = "menu_l_global_value_turtles"
	self.global_values.turtles.unlock_id = "bm_global_value_turtles_unlock"
	self.global_values.turtles.color = dlc_color
	self.global_values.turtles.dlc = true
	self.global_values.turtles.chance = 1
	self.global_values.turtles.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "turtles")
	self.global_values.turtles.durability_multiplier = 1
	self.global_values.turtles.drops = true
	self.global_values.turtles.track = true
	self.global_values.turtles.sort_number = 106
	self.global_values.turtles.category = "dlc"
	self.global_values.dragon = {}
	self.global_values.dragon.name_id = "bm_global_value_dragon"
	self.global_values.dragon.desc_id = "menu_l_global_value_dragon"
	self.global_values.dragon.unlock_id = "bm_global_value_dragon_unlock"
	self.global_values.dragon.color = dlc_color
	self.global_values.dragon.dlc = true
	self.global_values.dragon.chance = 1
	self.global_values.dragon.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "dragon")
	self.global_values.dragon.durability_multiplier = 1
	self.global_values.dragon.drops = true
	self.global_values.dragon.track = true
	self.global_values.dragon.sort_number = 107
	self.global_values.dragon.category = "dlc"
	self.global_values.steel = {}
	self.global_values.steel.name_id = "bm_global_value_steel"
	self.global_values.steel.desc_id = "menu_l_global_value_steel"
	self.global_values.steel.unlock_id = "bm_global_value_steel_unlock"
	self.global_values.steel.color = dlc_color
	self.global_values.steel.dlc = true
	self.global_values.steel.chance = 1
	self.global_values.steel.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "steel")
	self.global_values.steel.durability_multiplier = 1
	self.global_values.steel.drops = true
	self.global_values.steel.track = true
	self.global_values.steel.sort_number = 108
	self.global_values.steel.category = "dlc"
	self.global_values.berry = {}
	self.global_values.berry.name_id = "bm_global_value_berry"
	self.global_values.berry.desc_id = "menu_l_global_value_berry"
	self.global_values.berry.unlock_id = "bm_global_value_berry_unlock"
	self.global_values.berry.color = dlc_color
	self.global_values.berry.dlc = true
	self.global_values.berry.chance = 1
	self.global_values.berry.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "berry")
	self.global_values.berry.durability_multiplier = 1
	self.global_values.berry.hide_unavailable = true
	self.global_values.berry.drops = true
	self.global_values.berry.track = true
	self.global_values.berry.sort_number = 109
	self.global_values.berry.category = "dlc"
	self.global_values.peta = {}
	self.global_values.peta.name_id = "bm_global_value_peta"
	self.global_values.peta.desc_id = "menu_l_global_value_peta"
	self.global_values.peta.unlock_id = "bm_global_value_peta_unlock"
	self.global_values.peta.color = dlc_color
	self.global_values.peta.dlc = true
	self.global_values.peta.chance = 1
	self.global_values.peta.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "peta")
	self.global_values.peta.durability_multiplier = 1
	self.global_values.peta.drops = true
	self.global_values.peta.track = true
	self.global_values.peta.sort_number = 110
	self.global_values.peta.category = "dlc"
	self.global_values.pal = {}
	self.global_values.pal.name_id = "bm_global_value_pal"
	self.global_values.pal.desc_id = "menu_l_global_value_pal"
	self.global_values.pal.unlock_id = "bm_global_value_pal_unlock"
	self.global_values.pal.color = dlc_color
	self.global_values.pal.dlc = true
	self.global_values.pal.chance = 1
	self.global_values.pal.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pal")
	self.global_values.pal.durability_multiplier = 1
	self.global_values.pal.drops = true
	self.global_values.pal.track = true
	self.global_values.pal.sort_number = 111
	self.global_values.pal.category = "dlc"
	self.global_values.coco = {}
	self.global_values.coco.unlock_id = "bm_global_value_coco_unlock"
	self.global_values.coco.name_id = "bm_global_value_coco"
	self.global_values.coco.desc_id = "menu_l_global_value_coco"
	self.global_values.coco.color = dlc_color
	self.global_values.coco.dlc = true
	self.global_values.coco.category = "dlc"
	self.global_values.coco.chance = 1
	self.global_values.coco.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "coco")
	self.global_values.coco.durability_multiplier = 1
	self.global_values.coco.hide_unavailable = "coco"
	self.global_values.coco.unique_lock_color = Color(255, 255, 51, 51) / 255
	self.global_values.coco.drops = true
	self.global_values.coco.track = true
	self.global_values.coco.sort_number = 113
	self.global_values.mad = {}
	self.global_values.mad.name_id = "bm_global_value_mad"
	self.global_values.mad.desc_id = "menu_l_global_value_mad"
	self.global_values.mad.unlock_id = "bm_global_value_mad_unlock"
	self.global_values.mad.color = dlc_color
	self.global_values.mad.dlc = true
	self.global_values.mad.chance = 1
	self.global_values.mad.value_multiplier = 1
	self.global_values.mad.durability_multiplier = 1
	self.global_values.mad.hide_unavailable = "mad"
	self.global_values.mad.unique_lock_color = Color(255, 255, 51, 51) / 255
	self.global_values.mad.drops = true
	self.global_values.mad.track = true
	self.global_values.mad.sort_number = 114
	self.global_values.mad.category = "dlc"
	self.global_values.pim = {}
	self.global_values.pim.name_id = "bm_global_value_pim"
	self.global_values.pim.desc_id = "menu_l_global_value_pim"
	self.global_values.pim.unlock_id = "bm_global_value_pim_unlock"
	self.global_values.pim.color = dlc_color
	self.global_values.pim.dlc = true
	self.global_values.pim.chance = 1
	self.global_values.pim.value_multiplier = 1
	self.global_values.pim.durability_multiplier = 1
	self.global_values.pim.hide_unavailable = true
	self.global_values.pim.drops = true
	self.global_values.pim.track = true
	self.global_values.pim.sort_number = 115
	self.global_values.pim.category = "dlc"
	self.global_values.opera = {}
	self.global_values.opera.name_id = "bm_global_value_opera"
	self.global_values.opera.desc_id = "menu_l_global_value_opera"
	self.global_values.opera.unlock_id = "bm_global_value_opera_unlock"
	self.global_values.opera.color = dlc_color
	self.global_values.opera.dlc = true
	self.global_values.opera.chance = 1
	self.global_values.opera.value_multiplier = 1
	self.global_values.opera.durability_multiplier = 1
	self.global_values.opera.drops = true
	self.global_values.opera.track = true
	self.global_values.opera.sort_number = 116
	self.global_values.opera.category = "dlc"
	self.global_values.dbd_clan = {}
	self.global_values.dbd_clan.name_id = "bm_global_value_dbd_clan"
	self.global_values.dbd_clan.desc_id = "menu_l_global_value_dbd_clan"
	self.global_values.dbd_clan.color = community_color
	self.global_values.dbd_clan.chance = 1
	self.global_values.dbd_clan.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "dbd_clan")
	self.global_values.dbd_clan.durability_multiplier = 1
	self.global_values.dbd_clan.drops = true
	self.global_values.dbd_clan.track = true
	self.global_values.dbd_clan.sort_number = -100
	self.global_values.dbd_clan.unique_lock_icon = "guis/textures/pd2/lock_community"
	self.global_values.dbd_clan.sort_number = 2
	self.global_values.dbd_clan.dlc = true
	self.global_values.dbd_clan.unlock_id = "bm_global_value_dbd_clan_unlock"
	self.global_values.dbd_clan.category = "pd2_clan"
	self.global_values.dbd_deluxe = {}
	self.global_values.dbd_deluxe.name_id = "bm_global_value_dbd_deluxe"
	self.global_values.dbd_deluxe.desc_id = "menu_l_global_value_dbd_deluxe"
	self.global_values.dbd_deluxe.unlock_id = "bm_global_value_dbd_deluxe_unlock"
	self.global_values.dbd_deluxe.color = dlc_color
	self.global_values.dbd_deluxe.dlc = true
	self.global_values.dbd_deluxe.chance = 1
	self.global_values.dbd_deluxe.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "dbd_deluxe")
	self.global_values.dbd_deluxe.durability_multiplier = 1
	self.global_values.dbd_deluxe.drops = true
	self.global_values.dbd_deluxe.track = true
	self.global_values.dbd_deluxe.sort_number = 90
	self.global_values.dbd_deluxe.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.dbd_deluxe.category = "collaboration"
	self.global_values.wild = {}
	self.global_values.wild.name_id = "bm_global_value_wild"
	self.global_values.wild.desc_id = "menu_l_global_value_wild"
	self.global_values.wild.unlock_id = "bm_global_value_wild_unlock"
	self.global_values.wild.color = dlc_color
	self.global_values.wild.dlc = true
	self.global_values.wild.chance = 1
	self.global_values.wild.value_multiplier = 1
	self.global_values.wild.durability_multiplier = 1
	self.global_values.wild.drops = true
	self.global_values.wild.track = true
	self.global_values.wild.sort_number = 117
	self.global_values.wild.category = "dlc"
	self.global_values.born = {}
	self.global_values.born.name_id = "bm_global_value_born"
	self.global_values.born.desc_id = "menu_l_global_value_born"
	self.global_values.born.unlock_id = "bm_global_value_born_unlock"
	self.global_values.born.color = dlc_color
	self.global_values.born.dlc = true
	self.global_values.born.chance = 1
	self.global_values.born.value_multiplier = 1
	self.global_values.born.durability_multiplier = 1
	self.global_values.born.drops = true
	self.global_values.born.track = true
	self.global_values.born.sort_number = 118
	self.global_values.born.category = "dlc"
	self.global_values.solus_clan = {}
	self.global_values.solus_clan.name_id = "bm_global_value_solus_clan"
	self.global_values.solus_clan.desc_id = "menu_l_global_value_solus_clan"
	self.global_values.solus_clan.color = community_color
	self.global_values.solus_clan.chance = 1
	self.global_values.solus_clan.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "solus_clan")
	self.global_values.solus_clan.durability_multiplier = 1
	self.global_values.solus_clan.drops = true
	self.global_values.solus_clan.track = true
	self.global_values.solus_clan.sort_number = -100
	self.global_values.solus_clan.unique_lock_icon = "guis/textures/pd2/lock_community"
	self.global_values.solus_clan.sort_number = 2
	self.global_values.solus_clan.dlc = true
	self.global_values.solus_clan.unlock_id = "bm_global_value_solus_clan_unlock"
	self.global_values.solus_clan.category = "pd2_clan"
	self.global_values.legendary = {}
	self.global_values.legendary.name_id = "bm_global_value_legendary"
	self.global_values.legendary.desc_id = "menu_l_global_value_legendary"
	self.global_values.legendary.color = Color(255, 0, 255, 212) / 255
	self.global_values.legendary.dlc = false
	self.global_values.legendary.chance = 1
	self.global_values.legendary.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "legendary")
	self.global_values.legendary.durability_multiplier = 1
	self.global_values.legendary.drops = false
	self.global_values.legendary.track = false
	self.global_values.legendary.sort_number = 201
	self.global_values.legendary.category = nil
	self.global_values.sparkle = {}
	self.global_values.sparkle.name_id = "bm_global_value_sparkle"
	self.global_values.sparkle.desc_id = "menu_l_global_value_sparkle"
	self.global_values.sparkle.color = event_color
	self.global_values.sparkle.chance = 1
	self.global_values.sparkle.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "sparkle")
	self.global_values.sparkle.durability_multiplier = 1
	self.global_values.sparkle.drops = true
	self.global_values.sparkle.track = true
	self.global_values.sparkle.sort_number = 71
	self.global_values.sparkle.hide_unavailable = true
	self.global_values.sparkle.unlock_id = "bm_global_value_sparkle_unlock"
	self.global_values.sparkle.dlc = true
	self.global_values.sparkle.category = "global_event"
	self.global_values.rota = {}
	self.global_values.rota.name_id = "bm_global_value_rota"
	self.global_values.rota.desc_id = "menu_l_global_value_rota"
	self.global_values.rota.unlock_id = "bm_global_value_rota_unlock"
	self.global_values.rota.color = dlc_color
	self.global_values.rota.dlc = true
	self.global_values.rota.chance = 1
	self.global_values.rota.value_multiplier = 1
	self.global_values.rota.durability_multiplier = 1
	self.global_values.rota.drops = true
	self.global_values.rota.track = true
	self.global_values.rota.sort_number = 115
	self.global_values.rota.category = "dlc"
	self.global_values.tango = {}
	self.global_values.tango.name_id = "bm_global_value_tango"
	self.global_values.tango.desc_id = "menu_l_global_value_tango"
	self.global_values.tango.unlock_id = "bm_global_value_tango_unlock"
	self.global_values.tango.color = dlc_color
	self.global_values.tango.dlc = true
	self.global_values.tango.chance = 1
	self.global_values.tango.value_multiplier = 1
	self.global_values.tango.durability_multiplier = 1
	self.global_values.tango.drops = true
	self.global_values.tango.track = true
	self.global_values.tango.sort_number = 116
	self.global_values.tango.category = "dlc"
	self.global_values.chico = {}
	self.global_values.chico.name_id = "bm_global_value_chico"
	self.global_values.chico.desc_id = "menu_l_global_value_chico"
	self.global_values.chico.unlock_id = "bm_global_value_chico_unlock"
	self.global_values.chico.color = dlc_color
	self.global_values.chico.dlc = true
	self.global_values.chico.chance = 1
	self.global_values.chico.value_multiplier = 1
	self.global_values.chico.durability_multiplier = 1
	self.global_values.chico.hide_unavailable = true
	self.global_values.chico.drops = true
	self.global_values.chico.track = true
	self.global_values.chico.sort_number = 300
	self.global_values.chico.category = "dlc"
	self.global_values.friend = {}
	self.global_values.friend.name_id = "bm_global_value_friend"
	self.global_values.friend.desc_id = "menu_l_global_value_friend"
	self.global_values.friend.unlock_id = "bm_global_value_friend_unlock"
	self.global_values.friend.color = dlc_color
	self.global_values.friend.dlc = true
	self.global_values.friend.chance = 1
	self.global_values.friend.value_multiplier = 1
	self.global_values.friend.durability_multiplier = 1
	self.global_values.friend.hide_unavailable = "friend"
	self.global_values.friend.drops = true
	self.global_values.friend.track = true
	self.global_values.friend.sort_number = 301
	self.global_values.friend.category = "dlc"
	self.global_values.rvd = {}
	self.global_values.rvd.name_id = "bm_global_value_rvd"
	self.global_values.rvd.desc_id = "menu_l_global_value_rvd"
	self.global_values.rvd.color = dlc_color
	self.global_values.rvd.unique_lock_color = Color(255, 255, 51, 51) / 255
	self.global_values.rvd.chance = 1
	self.global_values.rvd.value_multiplier = 1
	self.global_values.rvd.durability_multiplier = 1
	self.global_values.rvd.hide_unavailable = true
	self.global_values.rvd.drops = true
	self.global_values.rvd.track = true
	self.global_values.rvd.sort_number = 301
	self.global_values.rvd.dlc = true
	self.global_values.rvd.category = "collaboration"
	self.global_values.rvd.unlock_id = "bm_menu_dlc_locked"
	self.global_values.john_wick_character = {}
	self.global_values.john_wick_character.name_id = "bm_global_value_rvd"
	self.global_values.john_wick_character.desc_id = "menu_l_global_value_rvd"
	self.global_values.john_wick_character.color = community_color
	self.global_values.john_wick_character.chance = 1
	self.global_values.john_wick_character.value_multiplier = 1
	self.global_values.john_wick_character.durability_multiplier = 1
	self.global_values.john_wick_character.hide_unavailable = "john_wick_character"
	self.global_values.john_wick_character.drops = true
	self.global_values.john_wick_character.track = true
	self.global_values.john_wick_character.sort_number = 301
	self.global_values.john_wick_character.dlc = true
	self.global_values.john_wick_character.category = "collaboration"
	self.global_values.john_wick_character.unlock_id = "bm_menu_dlc_locked"
	self.global_values.swm = {}
	self.global_values.swm.name_id = "bm_global_value_swm"
	self.global_values.swm.desc_id = "menu_l_global_value_swm"
	self.global_values.swm.color = event_color
	self.global_values.swm.chance = 1
	self.global_values.swm.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "swm_bundle")
	self.global_values.swm.durability_multiplier = 1
	self.global_values.swm.drops = true
	self.global_values.swm.track = true
	self.global_values.swm.sort_number = 301
	self.global_values.swm.hide_unavailable = true
	self.global_values.swm.dlc = true
	self.global_values.swm.unlock_id = "bm_global_value_swm_unlock"
	self.global_values.swm.category = "global_event"
	self.global_values.sha = {}
	self.global_values.sha.name_id = "bm_global_value_sha"
	self.global_values.sha.desc_id = "menu_l_global_value_sha"
	self.global_values.sha.chance = 1
	self.global_values.sha.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "sha")
	self.global_values.sha.durability_multiplier = 1
	self.global_values.sha.drops = true
	self.global_values.sha.track = true
	self.global_values.sha.sort_number = 302
	self.global_values.sha.hide_unavailable = true
	self.global_values.sha.unlock_id = "bm_global_value_sha_unlock"
	self.global_values.sha.color = dlc_color
	self.global_values.sha.category = "collaboration"
	self.global_values.sha.dlc = true
	self.global_values.spa = {}
	self.global_values.spa.name_id = "bm_global_value_spa"
	self.global_values.spa.desc_id = "menu_l_global_value_spa"
	self.global_values.spa.unlock_id = "bm_global_value_spa_unlock"
	self.global_values.spa.color = dlc_color
	self.global_values.spa.dlc = true
	self.global_values.spa.chance = 1
	self.global_values.spa.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "spa")
	self.global_values.spa.durability_multiplier = 1
	self.global_values.spa.hide_unavailable = true
	self.global_values.spa.drops = true
	self.global_values.spa.track = true
	self.global_values.spa.sort_number = 302
	self.global_values.spa.category = "dlc"
	self.global_values.grv = {}
	self.global_values.grv.name_id = "bm_global_value_grv"
	self.global_values.grv.desc_id = "menu_l_global_value_grv"
	self.global_values.grv.unlock_id = "bm_global_value_grv_unlock"
	self.global_values.grv.color = dlc_color
	self.global_values.grv.dlc = true
	self.global_values.grv.chance = 1
	self.global_values.grv.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "grv")
	self.global_values.grv.durability_multiplier = 1
	self.global_values.grv.drops = true
	self.global_values.grv.track = true
	self.global_values.grv.sort_number = 303
	self.global_values.grv.category = "dlc"
	self.global_values.amp = {}
	self.global_values.amp.name_id = "bm_global_value_amp"
	self.global_values.amp.desc_id = "menu_l_global_value_amp"
	self.global_values.amp.unlock_id = "bm_global_value_amp_unlock"
	self.global_values.amp.color = dlc_color
	self.global_values.amp.dlc = true
	self.global_values.amp.chance = 1
	self.global_values.amp.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "amp")
	self.global_values.amp.durability_multiplier = 1
	self.global_values.amp.drops = true
	self.global_values.amp.track = true
	self.global_values.amp.sort_number = 304
	self.global_values.amp.category = "dlc"
	self.global_values.mp2 = {}
	self.global_values.mp2.name_id = "bm_global_value_mp2"
	self.global_values.mp2.desc_id = "menu_l_global_value_mp2"
	self.global_values.mp2.unlock_id = "bm_global_value_mp2_unlock"
	self.global_values.mp2.color = dlc_color
	self.global_values.mp2.dlc = true
	self.global_values.mp2.chance = 1
	self.global_values.mp2.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "mp2")
	self.global_values.mp2.durability_multiplier = 1
	self.global_values.mp2.drops = true
	self.global_values.mp2.track = true
	self.global_values.mp2.sort_number = 305
	self.global_values.mp2.category = "dlc"
	self.global_values.ant = {}
	self.global_values.ant.name_id = "bm_global_value_ant"
	self.global_values.ant.desc_id = "menu_l_global_value_ant"
	self.global_values.ant.chance = 1
	self.global_values.ant.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "ant")
	self.global_values.ant.durability_multiplier = 1
	self.global_values.ant.drops = true
	self.global_values.ant.track = true
	self.global_values.ant.sort_number = 305
	self.global_values.ant.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.ant.unlock_id = "bm_global_value_ant_unlock"
	self.global_values.ant.dlc = true
	self.global_values.ant.color = dlc_color
	self.global_values.ant.category = "collaboration"
	self.global_values.ant_free = {}
	self.global_values.ant_free.name_id = "bm_global_value_ant"
	self.global_values.ant_free.desc_id = "menu_l_global_value_ant"
	self.global_values.ant_free.chance = 1
	self.global_values.ant_free.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "ant_free")
	self.global_values.ant_free.durability_multiplier = 1
	self.global_values.ant_free.drops = true
	self.global_values.ant_free.track = true
	self.global_values.ant_free.sort_number = 305
	self.global_values.ant_free.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.ant_free.unlock_id = "bm_global_value_ant_free_unlock"
	self.global_values.ant_free.dlc = true
	self.global_values.ant_free.color = dlc_color
	self.global_values.ant_free.category = "collaboration"
	self.global_values.eng = {}
	self.global_values.eng.name_id = "bm_global_value_eng"
	self.global_values.eng.desc_id = "menu_l_global_value_eng"
	self.global_values.eng.dlc = true
	self.global_values.eng.category = "collaboration"
	self.global_values.eng.chance = 1
	self.global_values.eng.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "eng")
	self.global_values.eng.durability_multiplier = 1
	self.global_values.eng.drops = true
	self.global_values.eng.track = true
	self.global_values.eng.sort_number = 306
	self.global_values.eng.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.eng.unlock_id = "bm_global_value_eng_unlock"
	self.global_values.eng.color = dlc_color
	self.global_values.pn2 = {}
	self.global_values.pn2.name_id = "bm_global_value_pn2"
	self.global_values.pn2.desc_id = "menu_l_global_value_pn2"
	self.global_values.pn2.unlock_id = "bm_global_value_pn2_unlock"
	self.global_values.pn2.color = event_color
	self.global_values.pn2.dlc = true
	self.global_values.pn2.chance = 1
	self.global_values.pn2.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pn2")
	self.global_values.pn2.durability_multiplier = 1
	self.global_values.pn2.drops = true
	self.global_values.pn2.track = true
	self.global_values.pn2.sort_number = 306
	self.global_values.pn2.hide_unavailable = true
	self.global_values.pn2.category = "global_event"
	self.global_values.max = {}
	self.global_values.max.name_id = "bm_global_value_max"
	self.global_values.max.desc_id = "menu_l_global_value_max"
	self.global_values.max.unlock_id = "bm_global_value_max_unlock"
	self.global_values.max.color = dlc_color
	self.global_values.max.dlc = true
	self.global_values.max.chance = 1
	self.global_values.max.value_multiplier = 1
	self.global_values.max.durability_multiplier = 1
	self.global_values.max.drops = true
	self.global_values.max.track = true
	self.global_values.max.sort_number = 300
	self.global_values.max.category = "dlc"
	self.global_values.dgm = {}
	self.global_values.dgm.name_id = "bm_global_value_dgm"
	self.global_values.dgm.desc_id = "menu_l_global_value_dgm"
	self.global_values.dgm.color = dlc_color
	self.global_values.dgm.chance = 1
	self.global_values.dgm.value_multiplier = 1
	self.global_values.dgm.durability_multiplier = 1
	self.global_values.dgm.drops = true
	self.global_values.dgm.track = true
	self.global_values.dgm.sort_number = 301
	self.global_values.dgm.unlock_id = "bm_global_value_dgm_unlock"
	self.global_values.dgm.dlc = true
	self.global_values.dgm.category = "dlc"
	self.global_values.joy = {}
	self.global_values.joy.name_id = "bm_global_value_joy"
	self.global_values.joy.desc_id = "menu_l_global_value_joy"
	self.global_values.joy.color = dlc_color
	self.global_values.joy.chance = 1
	self.global_values.joy.value_multiplier = 1
	self.global_values.joy.durability_multiplier = 1
	self.global_values.joy.drops = true
	self.global_values.joy.track = true
	self.global_values.joy.sort_number = 300
	self.global_values.joy.dlc = true
	self.global_values.joy.category = "dlc"
	self.global_values.joy.unlock_id = "bm_global_value_joy_unlock"
	self.global_values.raidww2_clan = {}
	self.global_values.raidww2_clan.name_id = "bm_global_value_raidww2_clan"
	self.global_values.raidww2_clan.desc_id = "menu_l_global_value_raidww2_clan"
	self.global_values.raidww2_clan.unlock_id = "bm_global_value_raidww2_clan_unlock"
	self.global_values.raidww2_clan.color = community_color
	self.global_values.raidww2_clan.dlc = true
	self.global_values.raidww2_clan.chance = 1
	self.global_values.raidww2_clan.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pd2_clan")
	self.global_values.raidww2_clan.durability_multiplier = 1
	self.global_values.raidww2_clan.drops = true
	self.global_values.raidww2_clan.track = true
	self.global_values.raidww2_clan.sort_number = -100
	self.global_values.raidww2_clan.unique_lock_icon = "guis/textures/pd2/lock_community"
	self.global_values.fdm = {}
	self.global_values.fdm.name_id = "bm_global_value_fdm"
	self.global_values.fdm.desc_id = "menu_l_global_value_fdm"
	self.global_values.fdm.color = event_color
	self.global_values.fdm.chance = 1
	self.global_values.fdm.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "fdm")
	self.global_values.fdm.durability_multiplier = 1
	self.global_values.fdm.drops = true
	self.global_values.fdm.track = true
	self.global_values.fdm.sort_number = 86
	self.global_values.fdm.hide_unavailable = true
	self.global_values.fdm.dlc = true
	self.global_values.fdm.unlock_id = "bm_global_value_fdm_unlock"
	self.global_values.fdm.category = "global_event"
	self.global_values.ecp = {}
	self.global_values.ecp.name_id = "bm_global_value_ecp"
	self.global_values.ecp.desc_id = "menu_l_global_value_ecp"
	self.global_values.ecp.unlock_id = "bm_global_value_ecp_unlock"
	self.global_values.ecp.color = dlc_color
	self.global_values.ecp.dlc = true
	self.global_values.ecp.chance = 1
	self.global_values.ecp.value_multiplier = 1
	self.global_values.ecp.durability_multiplier = 1
	self.global_values.ecp.drops = true
	self.global_values.ecp.track = true
	self.global_values.ecp.sort_number = 300
	self.global_values.ecp.category = "dlc"
	self.global_values.cmo = {}
	self.global_values.cmo.name_id = "bm_global_value_cmo"
	self.global_values.cmo.desc_id = "menu_l_global_value_cmo"
	self.global_values.cmo.color = dlc_color
	self.global_values.cmo.chance = 1
	self.global_values.cmo.value_multiplier = 1
	self.global_values.cmo.durability_multiplier = 1
	self.global_values.cmo.drops = true
	self.global_values.cmo.track = true
	self.global_values.cmo.sort_number = 300
	self.global_values.cmo.unlock_id = "bm_global_value_cmo_unlock"
	self.global_values.cmo.dlc = true
	self.global_values.cmt = {}
	self.global_values.cmt.name_id = "bm_global_value_cmt"
	self.global_values.cmt.desc_id = "menu_l_global_value_cmt"
	self.global_values.cmt.unlock_id = "bm_global_value_cmt_unlock"
	self.global_values.cmt.color = dlc_color
	self.global_values.cmt.dlc = true
	self.global_values.cmt.chance = 1
	self.global_values.cmt.value_multiplier = 1
	self.global_values.cmt.durability_multiplier = 1
	self.global_values.cmt.drops = true
	self.global_values.cmt.track = true
	self.global_values.cmt.sort_number = 300
	self.global_values.cmt.category = "normal"
	self.global_values.pbm = {}
	self.global_values.pbm.name_id = "bm_global_value_pbm"
	self.global_values.pbm.desc_id = "menu_l_global_value_pbm"
	self.global_values.pbm.color = event_color
	self.global_values.pbm.chance = 1
	self.global_values.pbm.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "pbm")
	self.global_values.pbm.durability_multiplier = 1
	self.global_values.pbm.drops = true
	self.global_values.pbm.track = true
	self.global_values.pbm.sort_number = 87
	self.global_values.pbm.hide_unavailable = true
	self.global_values.pbm.unlock_id = "bm_global_value_pbm_unlock"
	self.global_values.pbm.dlc = true
	self.global_values.pbm.category = "global_event"
	self.global_values.dnm = {}
	self.global_values.dnm.name_id = "bm_global_value_dnm"
	self.global_values.dnm.desc_id = "menu_l_global_value_dnm"
	self.global_values.dnm.color = dlc_color
	self.global_values.dnm.chance = 1
	self.global_values.dnm.value_multiplier = 1
	self.global_values.dnm.durability_multiplier = 1
	self.global_values.dnm.drops = true
	self.global_values.dnm.track = true
	self.global_values.dnm.sort_number = 300
	self.global_values.dnm.unlock_id = "bm_global_value_dnm_unlock"
	self.global_values.dnm.dlc = true
	self.global_values.dnm.category = "dlc"
	self.global_values.myh = {}
	self.global_values.myh.name_id = "bm_global_value_myh"
	self.global_values.myh.desc_id = "menu_l_global_value_myh"
	self.global_values.myh.unlock_id = "bm_global_value_myh_unlock"
	self.global_values.myh.color = dlc_color
	self.global_values.myh.dlc = true
	self.global_values.myh.free = true
	self.global_values.myh.chance = 1
	self.global_values.myh.value_multiplier = 1
	self.global_values.myh.durability_multiplier = 1
	self.global_values.myh.drops = true
	self.global_values.myh.track = true
	self.global_values.myh.sort_number = 300
	self.global_values.myh.category = "dlc"
	self.global_values.fgl = {}
	self.global_values.fgl.name_id = "bm_global_value_fgl"
	self.global_values.fgl.desc_id = "menu_l_global_value_fgl"
	self.global_values.fgl.unlock_id = "bm_global_value_fgl_unlock"
	self.global_values.fgl.color = dlc_color
	self.global_values.fgl.dlc = true
	self.global_values.fgl.free = true
	self.global_values.fgl.chance = 1
	self.global_values.fgl.value_multiplier = 1
	self.global_values.fgl.durability_multiplier = 1
	self.global_values.fgl.drops = true
	self.global_values.fgl.track = true
	self.global_values.fgl.sort_number = 300
	self.global_values.fgl.category = "dlc"
	self.global_values.osa = {}
	self.global_values.osa.name_id = "bm_global_value_osa"
	self.global_values.osa.desc_id = "menu_l_global_value_osa"
	self.global_values.osa.unlock_id = "bm_global_value_osa_unlock"
	self.global_values.osa.color = dlc_color
	self.global_values.osa.dlc = true
	self.global_values.osa.free = true
	self.global_values.osa.chance = 1
	self.global_values.osa.value_multiplier = 1
	self.global_values.osa.durability_multiplier = 1
	self.global_values.osa.drops = true
	self.global_values.osa.track = true
	self.global_values.osa.sort_number = 300
	self.global_values.osa.category = "dlc"
	self.global_values.dmg = {}
	self.global_values.dmg.name_id = "bm_global_value_dmg"
	self.global_values.dmg.desc_id = "menu_l_global_value_dmg"
	self.global_values.dmg.unlock_id = "bm_global_value_dmg_unlock"
	self.global_values.dmg.color = dlc_color
	self.global_values.dmg.dlc = true
	self.global_values.dmg.free = true
	self.global_values.dmg.chance = 1
	self.global_values.dmg.value_multiplier = 1
	self.global_values.dmg.durability_multiplier = 1
	self.global_values.dmg.drops = true
	self.global_values.dmg.track = true
	self.global_values.dmg.sort_number = 300
	self.global_values.dmg.category = "dlc"
	self.global_values.ghm = {}
	self.global_values.ghm.name_id = "bm_global_value_ghm"
	self.global_values.ghm.desc_id = "menu_l_global_value_ghm"
	self.global_values.ghm.unlock_id = "bm_global_value_ghm_unlock"
	self.global_values.ghm.color = dlc_color
	self.global_values.ghm.dlc = true
	self.global_values.ghm.free = true
	self.global_values.ghm.chance = 1
	self.global_values.ghm.value_multiplier = 1
	self.global_values.ghm.durability_multiplier = 1
	self.global_values.ghm.drops = true
	self.global_values.ghm.track = true
	self.global_values.ghm.sort_number = 300
	self.global_values.ghm.category = "dlc"
	self.global_values.ztm = {}
	self.global_values.ztm.name_id = "bm_global_value_ztm"
	self.global_values.ztm.desc_id = "menu_l_global_value_ztm"
	self.global_values.ztm.unlock_id = "bm_global_value_ztm_unlock"
	self.global_values.ztm.color = dlc_color
	self.global_values.ztm.dlc = true
	self.global_values.ztm.hide_unavailable = true
	self.global_values.ztm.chance = 1
	self.global_values.ztm.value_multiplier = 1
	self.global_values.ztm.durability_multiplier = 1
	self.global_values.ztm.drops = true
	self.global_values.ztm.track = true
	self.global_values.ztm.sort_number = 300
	self.global_values.ztm.category = "dlc"
	self.global_values.dlc_achievement = {}
	self.global_values.dlc_achievement.name_id = "bm_global_value_normal"
	self.global_values.dlc_achievement.desc_id = "menu_l_global_value_normal"
	self.global_values.dlc_achievement.unlock_id = "bm_global_value_normal_unlock"
	self.global_values.dlc_achievement.color = dlc_color
	self.global_values.dlc_achievement.dlc = false
	self.global_values.dlc_achievement.chance = 1
	self.global_values.dlc_achievement.value_multiplier = 1
	self.global_values.dlc_achievement.durability_multiplier = 1
	self.global_values.dlc_achievement.drops = false
	self.global_values.dlc_achievement.track = true
	self.global_values.dlc_achievement.sort_number = 300
	self.global_values.dlc_achievement.category = "dlc"
	self.global_values.sawp_grenade = {}
	self.global_values.sawp_grenade.name_id = "bm_global_value_sawp"
	self.global_values.sawp_grenade.desc_id = "menu_l_global_value_sawp"
	self.global_values.sawp_grenade.unlock_id = "bm_wpn_gre_electric_unlock"
	self.global_values.sawp_grenade.color = tweak_data.screen_colors.dlc_color
	self.global_values.sawp_grenade.dlc = false
	self.global_values.sawp_grenade.free = false
	self.global_values.sawp_grenade.hide_unavailable = false
	self.global_values.sawp_grenade.chance = 1
	self.global_values.sawp_grenade.value_multiplier = 1
	self.global_values.sawp_grenade.durability_multiplier = 1
	self.global_values.sawp_grenade.drops = true
	self.global_values.sawp_grenade.track = true
	self.global_values.sawp_grenade.sort_number = 508
	self.global_values.sawp_grenade.category = "dlc"
	self.global_values.pda8_wpn_money = {}
	self.global_values.pda8_wpn_money.name_id = "bm_global_value_pda8"
	self.global_values.pda8_wpn_money.desc_id = "menu_l_global_value_pda8"
	self.global_values.pda8_wpn_money.unlock_id = "bm_wpn_money_event_ended"
	self.global_values.pda8_wpn_money.unavailable_id = "bm_wpn_money_event_ended"
	self.global_values.pda8_wpn_money.color = tweak_data.screen_colors.event_color
	self.global_values.pda8_wpn_money.dlc = true
	self.global_values.pda8_wpn_money.free = false
	self.global_values.pda8_wpn_money.hide_unavailable = true
	self.global_values.pda8_wpn_money.chance = 1
	self.global_values.pda8_wpn_money.value_multiplier = 1
	self.global_values.pda8_wpn_money.durability_multiplier = 1
	self.global_values.pda8_wpn_money.drops = false
	self.global_values.pda8_wpn_money.track = true
	self.global_values.pda8_wpn_money.sort_number = 510
	self.global_values.pda8_wpn_money.category = "global_event"
	self.global_values.pda10_bessy = {}
	self.global_values.pda10_bessy.name_id = "bm_global_value_pda10"
	self.global_values.pda10_bessy.desc_id = "menu_l_global_value_pda10"
	self.global_values.pda10_bessy.unlock_id = "bm_wpn_money_event_ended"
	self.global_values.pda10_bessy.unavailable_id = "bm_wpn_money_event_ended"
	self.global_values.pda10_bessy.color = tweak_data.screen_colors.event_color
	self.global_values.pda10_bessy.dlc = true
	self.global_values.pda10_bessy.free = false
	self.global_values.pda10_bessy.hide_unavailable = true
	self.global_values.pda10_bessy.chance = 1
	self.global_values.pda10_bessy.value_multiplier = 1
	self.global_values.pda10_bessy.durability_multiplier = 1
	self.global_values.pda10_bessy.drops = false
	self.global_values.pda10_bessy.track = true
	self.global_values.pda10_bessy.sort_number = 510
	self.global_values.pda10_bessy.category = "global_event"
	self.global_values.pda10_piggy_hammer = {}
	self.global_values.pda10_piggy_hammer.name_id = "bm_global_value_pda10"
	self.global_values.pda10_piggy_hammer.desc_id = "menu_l_global_value_pda10"
	self.global_values.pda10_piggy_hammer.unlock_id = "bm_wpn_money_event_ended"
	self.global_values.pda10_piggy_hammer.unavailable_id = "bm_wpn_money_event_ended"
	self.global_values.pda10_piggy_hammer.color = tweak_data.screen_colors.event_color
	self.global_values.pda10_piggy_hammer.dlc = true
	self.global_values.pda10_piggy_hammer.free = false
	self.global_values.pda10_piggy_hammer.hide_unavailable = true
	self.global_values.pda10_piggy_hammer.chance = 1
	self.global_values.pda10_piggy_hammer.value_multiplier = 1
	self.global_values.pda10_piggy_hammer.durability_multiplier = 1
	self.global_values.pda10_piggy_hammer.drops = false
	self.global_values.pda10_piggy_hammer.track = true
	self.global_values.pda10_piggy_hammer.sort_number = 510
	self.global_values.pda10_piggy_hammer.category = "global_event"
	self.global_values.xmas_snowball = {}
	self.global_values.xmas_snowball.name_id = "bm_global_value_xmas_snowball"
	self.global_values.xmas_snowball.desc_id = "menu_l_global_value_xm21"
	self.global_values.xmas_snowball.unlock_id = "bm_wpn_money_event_ended"
	self.global_values.xmas_snowball.unavailable_id = "bm_wpn_money_event_ended"
	self.global_values.xmas_snowball.color = tweak_data.screen_colors.event_color
	self.global_values.xmas_snowball.dlc = true
	self.global_values.xmas_snowball.free = false
	self.global_values.xmas_snowball.hide_unavailable = true
	self.global_values.xmas_snowball.chance = 1
	self.global_values.xmas_snowball.value_multiplier = 1
	self.global_values.xmas_snowball.durability_multiplier = 1
	self.global_values.xmas_snowball.drops = false
	self.global_values.xmas_snowball.track = true
	self.global_values.xmas_snowball.sort_number = 510
	self.global_values.xmas_snowball.category = "global_event"
	self.global_values.mrwi_deck = {}
	self.global_values.mrwi_deck.name_id = "bm_global_value_mrwi"
	self.global_values.mrwi_deck.desc_id = "menu_l_global_value_mrwi"
	self.global_values.mrwi_deck.unlock_id = "bm_global_value_mrwi_unlock"
	self.global_values.mrwi_deck.color = tweak_data.screen_colors.event_color
	self.global_values.mrwi_deck.dlc = true
	self.global_values.mrwi_deck.free = false
	self.global_values.mrwi_deck.chance = 1
	self.global_values.mrwi_deck.value_multiplier = 1
	self.global_values.mrwi_deck.durability_multiplier = 1
	self.global_values.mrwi_deck.drops = false
	self.global_values.mrwi_deck.track = true
	self.global_values.mrwi_deck.sort_number = 512
	self.global_values.mrwi_deck.category = "global_event"
	self.global_values.mrwi_deck.no_store = true
	self.global_values.victor_mods_pack_1 = {}
	self.global_values.victor_mods_pack_1.name_id = "bm_global_value_xm22"
	self.global_values.victor_mods_pack_1.desc_id = "menu_l_global_value_xm22"
	self.global_values.victor_mods_pack_1.unlock_id = "bm_menu_locked_cg22_2"
	self.global_values.victor_mods_pack_1.color = tweak_data.screen_colors.event_color
	self.global_values.victor_mods_pack_1.dlc = true
	self.global_values.victor_mods_pack_1.free = false
	self.global_values.victor_mods_pack_1.chance = 1
	self.global_values.victor_mods_pack_1.value_multiplier = 1
	self.global_values.victor_mods_pack_1.durability_multiplier = 1
	self.global_values.victor_mods_pack_1.drops = false
	self.global_values.victor_mods_pack_1.track = true
	self.global_values.victor_mods_pack_1.sort_number = 514
	self.global_values.victor_mods_pack_1.category = "global_event"
	self.global_values.victor_mods_pack_1.unique_lock_icon = "guis/textures/pd2/lock_achievement"
	self.global_values.victor_mods_pack_2 = deep_clone(self.global_values.victor_mods_pack_1)
	self.global_values.victor_mods_pack_2.unlock_id = "bm_menu_locked_cg22_3"
	self.global_values.victor_mods_pack_2.sort_number = 516

	if SystemInfo:platform() == Idstring("PS3") then
		self.global_values.sweettooth = {}
		self.global_values.sweettooth.name_id = "bm_global_value_sweettooth"
		self.global_values.sweettooth.desc_id = "menu_l_global_value_sweettooth"
		self.global_values.sweettooth.unlock_id = "bm_global_value_sweettooth_unlock"
		self.global_values.sweettooth.color = community_color
		self.global_values.sweettooth.dlc = true
		self.global_values.sweettooth.chance = 1
		self.global_values.sweettooth.value_multiplier = tweak_data:get_value("money_manager", "global_value_multipliers", "sweettooth")
		self.global_values.sweettooth.durability_multiplier = 1
		self.global_values.sweettooth.drops = true
		self.global_values.sweettooth.track = true
		self.global_values.sweettooth.sort_number = 200
		self.global_values.sweettooth.category = nil
	end

	self.global_value_list_index = {
		"normal",
		"infamous",
		"preorder",
		"pd2_clan",
		"halloween",
		"xmas",
		"armored_transport",
		"gage_pack",
		"gage_pack_lmg",
		"gage_pack_jobs",
		"gage_pack_snp",
		"poetry_soundtrack",
		"big_bank",
		"gage_pack_shotgun",
		"gage_pack_assault",
		"hl_miami",
		"hlm_game",
		"gage_pack_historical",
		"character_pack_clover",
		"character_pack_dragan",
		"hlm2_deluxe",
		"butch_pack_free",
		"bbq",
		"west",
		"arena",
		"character_pack_sokol",
		"kenaz",
		"turtles",
		"dragon",
		"steel",
		"berry",
		"peta",
		"pal",
		"coco",
		"mad",
		"dbd_clan",
		"dbd_deluxe",
		"pim",
		"opera",
		"solus_clan",
		"wild",
		"born",
		"sparkle",
		"rota",
		"tango",
		"chico",
		"friend",
		"rvd",
		"swm",
		"spa",
		"sha",
		"grv",
		"amp",
		"mp2",
		"mom",
		"ant",
		"ant_free",
		"pn2",
		"max",
		"dgm",
		"joy",
		"fdm",
		"ecp",
		"cmo",
		"cmt",
		"pbm",
		"eng",
		"fgl",
		"ghm"
	}

	self:init_generated(tweak_data)

	self.global_values.srtr.unique_lock_icon = "guis/textures/pd2/blackmarket/money_lock"
	self.global_values.sbzac2.unique_lock_icon = "guis/textures/pd2/lock_community"
	self.global_values.sbzac2.unique_lock_color = Color(255, 59, 174, 254) / 255
	self.global_values.sbzac_elegantteeth = self.global_values.sbzac2
	self.global_values.sbzac_wpn_fps_upg_charm_skullz = self.global_values.sbzac2
	self.global_values.sbzac_elegantscarf = self.global_values.sbzac2
	self.global_values.sbzac_color_sbzac2_01 = self.global_values.sbzac2
	self.global_values.rat_oilbaron = self.global_values.rat
	self.global_values.rat_ranchdiesel = self.global_values.rat
	self.global_values.rat_mocow = self.global_values.rat
	self.global_values.prim.unique_lock_icon = "guis/textures/pd2/lock_community"
	self.global_values.prim.unique_lock_color = Color(255, 59, 174, 254) / 255
	self.global_values.prim_darkmat = self.global_values.prim
	self.global_values.prim_primtime = self.global_values.prim
	self.global_values.prim_newhorizon = self.global_values.prim
	self.global_values.a11th.unique_lock_icon = "guis/textures/pd2/lock_community"
	self.global_values.a11th_homburg = self.global_values.a11th
	self.global_values.a11th_homburg_grey = self.global_values.a11th
	self.global_values.a11th_corl = self.global_values.a11th
	self.global_values.a11th_stinger = self.global_values.a11th
	self.global_values.trt_railwork = self.global_values.trt
	self.global_values.trt_railhat = self.global_values.trt
	self.global_values.trt_railroad = self.global_values.trt
	self.global_values.h22_deadman = self.global_values.h22
	self.global_values.h22_nightwalker = self.global_values.h22
	self.global_values.h22_tasslefringe = self.global_values.h22
	self.global_values.h22_bloodysnarl = self.global_values.h22
	self.global_values.h22_ghostly = self.global_values.h22
	self.global_values.h22_tornrags = self.global_values.h22
	self.global_values.h22_banshee = self.global_values.h22
	self.global_values.h22_darkprince = self.global_values.h22
	self.global_values.h22_devilclaws = self.global_values.h22
	self.global_values.h22_devilhorn = self.global_values.h22
	self.global_values.cot_smilecigar = self.global_values.cot
	self.global_values.cot_sleekygent = self.global_values.cot
	self.global_values.cot_beigedriver = self.global_values.cot
	self.global_values.dot_roclown_suit = self.global_values.dot
	self.global_values.dot_roclogrip_glv = self.global_values.dot
	self.global_values.dot_roclown_msk = self.global_values.dot
	self.global_values.chico_or_mrwi_deck = self.global_values.chico
	self.global_values.chico_or_mrwi_deck.name_id = "bm_global_value_rvd"
	self.global_values.chico_or_mrwi_deck.desc_id = "menu_l_global_value_rvd"
	self.global_values.chico_or_mrwi_deck.unlock_id = "bm_global_value_rvd_unlock"
	self.global_values.ecp_or_mrwi_deck = self.global_values.ecp

	self:_create_global_value_list_map()
end

function LootDropTweakData:_init_card_types()
	self.type_to_card_fallback = "upcard_random"
	self.type_to_card = {
		armor_skins = "upcard_cosmetic",
		cash = "upcard_cash",
		masks = "upcard_mask",
		materials = "upcard_material",
		textures = "upcard_pattern",
		weapon_bonus = "upcard_weapon_bonus",
		weapon_mods = "upcard_weapon",
		weapon_skins = "upcard_cosmetic",
		xp = "upcard_xp"
	}
	self.card_to_drop = {
		cash = 3,
		masks = 1,
		materials = 5,
		textures = 6,
		weapon_mods = 2,
		xp = 4
	}
	self.card_fakes = {
		"masks",
		"weapon_mods",
		"cash",
		"xp",
		"materials",
		"textures",
		"weapon_bonus"
	}
end

function LootDropTweakData:_create_global_value_list_map()
	self.global_value_list_map = {}

	for i, d in ipairs(self.global_value_list_index) do
		self.global_value_list_map[d] = i
	end
end
