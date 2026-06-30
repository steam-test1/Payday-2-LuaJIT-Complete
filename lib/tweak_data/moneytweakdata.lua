MoneyTweakData = MoneyTweakData or class()

function MoneyTweakData._create_value_table(min, max, table_size, round, curve)
	local t = {}

	for i = 1, table_size do
		local v = math.lerp(min, max, math.pow((i - 1) / (table_size - 1), curve and curve or 1))

		if v > 999 then
			v = v * 0.001
			v = round and math.ceil(v) or v
			v = v * 1000
		elseif v > 99 then
			v = v * 0.01
			v = round and math.ceil(v) or v
			v = v * 100
		elseif v > 9 then
			v = v * 0.1
			v = round and math.ceil(v) or v
			v = v * 10
		else
			v = round and math.ceil(v) or v
		end

		table.insert(t, v)
	end

	return t
end

function MoneyTweakData:init(tweak_data)
	local difficulty = Global.game_settings and Global.game_settings.difficulty or "normal"
	local difficulty_index = tweak_data:difficulty_to_index(difficulty)

	self.biggest_score = 4000000
	self.biggest_cashout = 800000
	self.offshore_rate = self.biggest_cashout / self.biggest_score
	self.alive_players_max = 1.1
	self.cashout_without_player_alive = self.biggest_cashout / self.alive_players_max
	self.cut_difficulty = 4
	self.max_mission_bags = 6
	self.cut_lootbag_bonus = self.cashout_without_player_alive * 0.3
	self.cut_lootbag_bonus = self.cut_lootbag_bonus / self.max_mission_bags / self.cut_difficulty
	self.max_days = 3
	self.cut_stage_complete = self.cashout_without_player_alive * 0.55
	self.cut_stage_complete = self.cut_stage_complete / self.cut_difficulty * 0.7
	self.cut_job_complete = self.cashout_without_player_alive * 0.15
	self.cut_job_complete = self.cut_job_complete / self.cut_difficulty
	self.bag_values = {}
	self.bag_values.default = 100
	self.bag_values.money = 1500
	self.bag_values.gold = 2875
	self.bag_values.diamonds = 1000
	self.bag_values.coke = 2000
	self.bag_values.coke_pure = 3000
	self.bag_values.meth = 13000
	self.bag_values.meth_half = 6500
	self.bag_values.weapon = 3000
	self.bag_values.weapons = 3000
	self.bag_values.painting = 3000
	self.bag_values.samurai_suit = 5000
	self.bag_values.artifact_statue = 5000
	self.bag_values.mus_artifact_bag = 1000
	self.bag_values.circuit = 1000
	self.bag_values.shells = 2100
	self.bag_values.turret = 10000
	self.bag_values.sandwich = 10000
	self.bag_values.cro_loot = 10000
	self.bag_values.hope_diamond = 30000
	self.bag_values.evidence_bag = 3000
	self.bag_values.vehicle_falcogini = 4000
	self.bag_values.warhead = 4600
	self.bag_values.unknown = 5000
	self.bag_values.safe = 4600
	self.bag_values.prototype = 10000
	self.bag_values.faberge_egg = 3000
	self.bag_values.treasure = 3200
	self.bag_values.counterfeit_money = 1100
	self.bag_values.box_unknown = 10000
	self.bag_values.black_tablet = 10000
	self.bag_values.masterpiece_painting = 10000
	self.bag_values.master_server = 10000
	self.bag_values.lost_artifact = 10000
	self.bag_values.present = 2049
	self.bag_values.mad_master_server_value_1 = 5000
	self.bag_values.mad_master_server_value_2 = 10000
	self.bag_values.mad_master_server_value_3 = 15000
	self.bag_values.mad_master_server_value_4 = 20000
	self.bag_values.weapon_glock = 2000
	self.bag_values.weapon_scar = 2000
	self.bag_values.drk_bomb_part = 9000
	self.bag_values.drone_control_helmet = 20000
	self.bag_values.toothbrush = 18000
	self.bag_values.cloaker_gold = 2000
	self.bag_values.cloaker_money = 1750
	self.bag_values.cloaker_cocaine = 1500
	self.bag_values.diamond_necklace = 2875
	self.bag_values.vr_headset = 2875
	self.bag_values.women_shoes = 2875
	self.bag_values.expensive_vine = 2875
	self.bag_values.ordinary_wine = 2875
	self.bag_values.robot_toy = 2875
	self.bag_values.rubies = 1500
	self.bag_values.red_diamond = 10000
	self.bag_values.old_wine = 2000
	self.bag_value_multiplier = self._create_value_table(self.cut_lootbag_bonus / 5 / self.offshore_rate / self.bag_values.default, self.cut_lootbag_bonus / self.offshore_rate / self.bag_values.default, 7, true, 0.85)
	self.stage_completion = self._create_value_table(self.cut_stage_complete / 7 / self.offshore_rate, self.cut_stage_complete / self.offshore_rate, 7, true, 1)
	self.job_completion = self._create_value_table(self.cut_job_complete / 7 / self.offshore_rate, self.cut_job_complete / self.offshore_rate, 7, true, 1)
	self.flat_stage_completion = math.round(10000 / self.offshore_rate)
	self.flat_job_completion = 0
	self.level_limit = {}
	self.level_limit.low_cap_level = -1
	self.level_limit.low_cap_multiplier = 0.75
	self.level_limit.pc_difference_multipliers = {
		1,
		0.9,
		0.8,
		0.7,
		0.6,
		0.5,
		0.4,
		0.3,
		0.2,
		0.1
	}
	self.stage_failed_multiplier = 0.1
	self.difficulty_multiplier = {
		4,
		9,
		12,
		20,
		35,
		40,
		45
	}
	self.difficulty_multiplier_payout = {
		1,
		2,
		5,
		10,
		11,
		13,
		14
	}
	self.small_loot_difficulty_multiplier = self._create_value_table(0, 0, 6, false, 1)
	self.alive_humans_multiplier = self._create_value_table(1, self.alive_players_max, tweak_data.max_players, false, 1)
	self.alive_humans_multiplier[0] = 1
	self.limited_bonus_multiplier = 1
	self.sell_weapon_multiplier = 0.25
	self.sell_mask_multiplier = 0.25
	self.killing_civilian_deduction = self._create_value_table(2000, 50000, 10, true, 2)
	self.buy_premium_multiplier = {
		easy = 0,
		easy_wish = 0,
		hard = 0,
		normal = 0,
		overkill = 0,
		overkill_145 = 0,
		overkill_290 = 0,
		sm_wish = 0
	}
	self.buy_premium_static_fee = {
		easy = 0,
		easy_wish = 0,
		hard = 0,
		normal = 0,
		overkill = 0,
		overkill_145 = 0,
		overkill_290 = 0,
		sm_wish = 0
	}
	self.global_value_multipliers = {}
	self.global_value_multipliers.normal = 1
	self.global_value_multipliers.superior = 1
	self.global_value_multipliers.exceptional = 1
	self.global_value_multipliers.infamous = 5
	self.global_value_multipliers.infamy = 0
	self.global_value_multipliers.preorder = 1
	self.global_value_multipliers.overkill = 0.01
	self.global_value_multipliers.pd2_clan = 1
	self.global_value_multipliers.halloween = 1
	self.global_value_multipliers.xmas = 1
	self.global_value_multipliers.armored_transport = 1.2
	self.global_value_multipliers.big_bank = 0.8
	self.global_value_multipliers.gage_pack = 1.4
	self.global_value_multipliers.gage_pack_lmg = 1.8
	self.global_value_multipliers.gage_pack_jobs = 0
	self.global_value_multipliers.gage_pack_snp = 0.8
	self.global_value_multipliers.gage_pack_shotgun = 1
	self.global_value_multipliers.gage_pack_assault = 1
	self.global_value_multipliers.gage_pack_historical = 1
	self.global_value_multipliers.xmas_soundtrack = 1
	self.global_value_multipliers.sweettooth = 1
	self.global_value_multipliers.legendary = 1
	self.global_value_multipliers.poetry_soundtrack = 0
	self.global_value_multipliers.twitch_pack = 0
	self.global_value_multipliers.humble_pack2 = 0
	self.global_value_multipliers.humble_pack3 = 0
	self.global_value_multipliers.humble_pack4 = 0
	self.global_value_multipliers.e3_s15a = 0
	self.global_value_multipliers.e3_s15b = 0
	self.global_value_multipliers.e3_s15c = 0
	self.global_value_multipliers.e3_s15d = 0
	self.global_value_multipliers.hl_miami = 1
	self.global_value_multipliers.hlm_game = 1
	self.global_value_multipliers.alienware_alpha = 1
	self.global_value_multipliers.alienware_alpha_promo = 1
	self.global_value_multipliers.character_pack_clover = 1
	self.global_value_multipliers.hope_diamond = 1
	self.global_value_multipliers.goty_weapon_bundle_2014 = 1
	self.global_value_multipliers.goty_heist_bundle_2014 = 1
	self.global_value_multipliers.goty_dlc_bundle_2014 = 1
	self.global_value_multipliers.character_pack_dragan = 1
	self.global_value_multipliers.the_bomb = 1
	self.global_value_multipliers.bbq = 1
	self.global_value_multipliers.akm4_pack = 1
	self.global_value_multipliers.overkill_pack = 1
	self.global_value_multipliers.complete_overkill_pack = 1
	self.global_value_multipliers.hlm2 = 1
	self.global_value_multipliers.hlm2_deluxe = 1
	self.global_value_multipliers.butch_pack_free = 1
	self.global_value_multipliers.speedrunners = 1
	self.global_value_multipliers.west = 1
	self.global_value_multipliers.arena = 1
	self.global_value_multipliers.character_pack_sokol = 1
	self.global_value_multipliers.kenaz = 1
	self.global_value_multipliers.turtles = 1
	self.global_value_multipliers.bobblehead = 1
	self.global_value_multipliers.dragon = 1
	self.global_value_multipliers.pdcon_2015 = 1
	self.global_value_multipliers.pdcon_2016 = 1
	self.global_value_multipliers.steel = 1
	self.global_value_multipliers.berry = 1
	self.global_value_multipliers.peta = 1
	self.global_value_multipliers.pal = 1
	self.global_value_multipliers.coco = 1
	self.global_value_multipliers.dbd_clan = 1
	self.global_value_multipliers.dbd_deluxe = 1
	self.global_value_multipliers.solus_clan = 1
	self.global_value_multipliers.wild = 1
	self.global_value_multipliers.born = 1
	self.global_value_multipliers.sparkle = 0
	self.global_value_multipliers.rota = 1
	self.global_value_multipliers.pim = 1
	self.global_value_multipliers.tango = 1
	self.global_value_multipliers.friend = 1
	self.global_value_multipliers.chico = 1
	self.global_value_multipliers.rvd = 1
	self.global_value_multipliers.swm_bundle = 1
	self.global_value_multipliers.spa = 1
	self.global_value_multipliers.sha = 1
	self.global_value_multipliers.grv = 1
	self.global_value_multipliers.amp = 1
	self.global_value_multipliers.mp2 = 1
	self.global_value_multipliers.ant = 1
	self.global_value_multipliers.ant_free = 1
	self.global_value_multipliers.pn2 = 0
	self.global_value_multipliers.max = 1
	self.global_value_multipliers.dgm = 1
	self.global_value_multipliers.joy = 1
	self.global_value_multipliers.raidww2_clan = 1
	self.global_value_multipliers.fdm = 0
	self.global_value_multipliers.eng = 1
	self.global_value_multipliers.pbm = 0
	self.global_value_bonus_multiplier = {}
	self.global_value_bonus_multiplier.normal = 0
	self.global_value_bonus_multiplier.superior = 0.1
	self.global_value_bonus_multiplier.exceptional = 0.2
	self.global_value_bonus_multiplier.infamous = 1
	self.global_value_bonus_multiplier.infamy = 1
	self.global_value_bonus_multiplier.preorder = 0
	self.global_value_bonus_multiplier.overkill = 20
	self.global_value_bonus_multiplier.pd2_clan = 0
	self.global_value_bonus_multiplier.halloween = 0
	self.global_value_bonus_multiplier.xmas = 0
	self.global_value_bonus_multiplier.armored_transport = 0.5
	self.global_value_bonus_multiplier.big_bank = 0.4
	self.global_value_bonus_multiplier.gage_pack = 0.5
	self.global_value_bonus_multiplier.gage_pack_lmg = 0.5
	self.global_value_bonus_multiplier.gage_pack_jobs = 0
	self.global_value_bonus_multiplier.gage_pack_snp = 0.2
	self.global_value_bonus_multiplier.gage_pack_shotgun = 0.2
	self.global_value_bonus_multiplier.gage_pack_assault = 0.2
	self.global_value_bonus_multiplier.gage_pack_historical = 0.2
	self.global_value_bonus_multiplier.xmas_soundtrack = 0
	self.global_value_bonus_multiplier.sweettooth = 0
	self.global_value_bonus_multiplier.legendary = 0
	self.global_value_bonus_multiplier.poetry_soundtrack = 0
	self.global_value_bonus_multiplier.twitch_pack = 0
	self.global_value_bonus_multiplier.humble_pack2 = 0
	self.global_value_bonus_multiplier.humble_pack3 = 0
	self.global_value_bonus_multiplier.humble_pack4 = 0
	self.global_value_bonus_multiplier.e3_s15a = 0
	self.global_value_bonus_multiplier.e3_s15b = 0
	self.global_value_bonus_multiplier.e3_s15c = 0
	self.global_value_bonus_multiplier.e3_s15d = 0
	self.global_value_bonus_multiplier.hl_miami = 0.2
	self.global_value_bonus_multiplier.hlm_game = 0.2
	self.global_value_bonus_multiplier.alienware_alpha = 0.2
	self.global_value_bonus_multiplier.alienware_alpha_promo = 0.2
	self.global_value_bonus_multiplier.character_pack_clover = 0.2
	self.global_value_bonus_multiplier.hope_diamond = 0.2
	self.global_value_bonus_multiplier.goty_weapon_bundle_2014 = 0.2
	self.global_value_bonus_multiplier.goty_heist_bundle_2014 = 0.2
	self.global_value_bonus_multiplier.goty_dlc_bundle_2014 = 0.2
	self.global_value_bonus_multiplier.character_pack_dragan = 0.2
	self.global_value_bonus_multiplier.the_bomb = 0.2
	self.global_value_bonus_multiplier.bbq = 0.2
	self.global_value_bonus_multiplier.akm4_pack = 0.2
	self.global_value_bonus_multiplier.overkill_pack = 0.2
	self.global_value_bonus_multiplier.complete_overkill_pack = 0.3
	self.global_value_bonus_multiplier.hlm2 = 0.2
	self.global_value_bonus_multiplier.hlm2_deluxe = 0.5
	self.global_value_bonus_multiplier.butch_pack_free = 0.2
	self.global_value_bonus_multiplier.speedrunners = 0
	self.global_value_bonus_multiplier.west = 0.2
	self.global_value_bonus_multiplier.arena = 0.2
	self.global_value_bonus_multiplier.character_pack_sokol = 0.2
	self.global_value_bonus_multiplier.kenaz = 0.2
	self.global_value_bonus_multiplier.turtles = 0.2
	self.global_value_bonus_multiplier.bobblehead = 0.2
	self.global_value_bonus_multiplier.dragon = 0.2
	self.global_value_bonus_multiplier.pdcon_2015 = 0.2
	self.global_value_bonus_multiplier.pdcon_2016 = 0.2
	self.global_value_bonus_multiplier.steel = 0.2
	self.global_value_bonus_multiplier.berry = 0.2
	self.global_value_bonus_multiplier.peta = 0.2
	self.global_value_bonus_multiplier.pal = 0.2
	self.global_value_bonus_multiplier.coco = 0.2
	self.global_value_bonus_multiplier.dbd_clan = 0
	self.global_value_bonus_multiplier.dbd_deluxe = 0.5
	self.global_value_bonus_multiplier.solus_clan = 0
	self.global_value_bonus_multiplier.wild = 0.2
	self.global_value_bonus_multiplier.born = 0.2
	self.global_value_bonus_multiplier.sparkle = 0
	self.global_value_bonus_multiplier.rota = 1
	self.global_value_bonus_multiplier.pim = 1
	self.global_value_bonus_multiplier.tango = 1
	self.global_value_bonus_multiplier.friend = 1
	self.global_value_bonus_multiplier.chico = 1
	self.global_value_bonus_multiplier.swm_bundle = 1
	self.global_value_bonus_multiplier.spa = 1
	self.global_value_bonus_multiplier.sha = 1
	self.global_value_bonus_multiplier.grv = 1
	self.global_value_bonus_multiplier.amp = 1
	self.global_value_bonus_multiplier.mp2 = 1
	self.global_value_bonus_multiplier.ant = 1
	self.global_value_bonus_multiplier.ant_free = 1
	self.global_value_bonus_multiplier.pn2 = 0
	self.global_value_bonus_multiplier.max = 1
	self.global_value_bonus_multiplier.dgm = 1
	self.global_value_bonus_multiplier.joy = 1
	self.global_value_bonus_multiplier.raidww2_clan = 1
	self.global_value_bonus_multiplier.fdm = 1
	self.global_value_bonus_multiplier.eng = 1
	self.global_value_bonus_multiplier.pbm = 1

	local smallest_cashout = (self.stage_completion[1] + self.job_completion[1]) * self.offshore_rate
	local biggest_mask_cost = self.biggest_cashout * 40
	local biggest_mask_cost_deinfamous = math.round(biggest_mask_cost / self.global_value_multipliers.infamous)
	local biggest_mask_part_cost = math.round(smallest_cashout * 20)
	local smallest_mask_part_cost = math.round(smallest_cashout * 1.9)
	local biggest_weapon_cost = math.round(self.biggest_cashout * 1.15)
	local smallest_weapon_cost = math.round(smallest_cashout * 3)
	local biggest_weapon_mod_cost = math.round(self.biggest_cashout * 0.1)
	local smallest_weapon_mod_cost = math.round(smallest_cashout * 0.6)

	self.weapon_cost = self._create_value_table(smallest_weapon_cost, biggest_weapon_cost, 40, true, 1.1)
	self.modify_weapon_cost = self._create_value_table(smallest_weapon_mod_cost, biggest_weapon_mod_cost, 10, true, 1.2)
	self.remove_weapon_mod_cost_multiplier = self._create_value_table(1, 1, 10, true, 1)
	self.masks = {}
	self.masks.mask_value = self._create_value_table(smallest_mask_part_cost, smallest_mask_part_cost * 2, 10, true, 2)
	self.masks.material_value = self._create_value_table(smallest_mask_part_cost * 0.5, biggest_mask_part_cost, 10, true, 1.2)
	self.masks.pattern_value = self._create_value_table(smallest_mask_part_cost * 0.4, biggest_mask_part_cost, 10, true, 1.1)
	self.masks.color_value = self._create_value_table(smallest_mask_part_cost * 0.3, biggest_mask_part_cost, 10, true, 1)

	local function millions(value)
		return value * 1000000
	end

	self.skill_switch_cost = {
		{
			spending = 0,
			offshore = millions(0)
		},
		{
			spending = 0,
			offshore = millions(0)
		},
		{
			spending = 0,
			offshore = millions(0)
		},
		{
			spending = 0,
			offshore = millions(1)
		},
		{
			spending = 0,
			offshore = millions(10)
		},
		{
			spending = 0,
			offshore = millions(10)
		},
		{
			spending = 0,
			offshore = millions(10)
		},
		{
			spending = 0,
			offshore = millions(20)
		},
		{
			spending = 0,
			offshore = millions(20)
		},
		{
			spending = 0,
			offshore = millions(20)
		},
		{
			spending = 0,
			offshore = millions(25)
		},
		{
			spending = 0,
			offshore = millions(25)
		},
		{
			spending = 0,
			offshore = millions(25)
		},
		{
			spending = 0,
			offshore = millions(25)
		},
		{
			spending = 0,
			offshore = millions(25)
		},
		{
			spending = 0,
			offshore = millions(30)
		},
		{
			spending = 0,
			offshore = millions(30)
		},
		{
			spending = 0,
			offshore = millions(30)
		},
		{
			spending = 0,
			offshore = millions(30)
		},
		{
			spending = 0,
			offshore = millions(30)
		},
		{
			spending = 0,
			offshore = millions(35)
		},
		{
			spending = 0,
			offshore = millions(35)
		},
		{
			spending = 0,
			offshore = millions(35)
		},
		{
			spending = 0,
			offshore = millions(35)
		},
		{
			spending = 0,
			offshore = millions(35)
		},
		{
			spending = 0,
			offshore = millions(40)
		},
		{
			spending = 0,
			offshore = millions(40)
		},
		{
			spending = 0,
			offshore = millions(40)
		},
		{
			spending = 0,
			offshore = millions(40)
		},
		{
			spending = 0,
			offshore = millions(40)
		}
	}
	self.old_skill_switch_cost = {
		{
			offshore = 0,
			spending = 0
		},
		{
			offshore = 0,
			spending = 0
		},
		{
			offshore = 1000000,
			spending = 0
		},
		{
			offshore = 10000000,
			spending = 0
		},
		{
			offshore = 25000000,
			spending = 0
		},
		{
			offshore = 25000000,
			spending = 0
		},
		{
			offshore = 25000000,
			spending = 0
		},
		{
			offshore = 25000000,
			spending = 0
		},
		{
			offshore = 25000000,
			spending = 0
		},
		{
			offshore = 30000000,
			spending = 0
		},
		{
			offshore = 30000000,
			spending = 0
		},
		{
			offshore = 30000000,
			spending = 0
		},
		{
			offshore = 30000000,
			spending = 0
		},
		{
			offshore = 30000000,
			spending = 0
		},
		{
			offshore = 20000000,
			spending = 0
		}
	}
	self.mission_asset_cost_by_pc = self._create_value_table(1, 1, 10, true, 1)
	self.mission_asset_cost_multiplier_by_pc = {
		0,
		0,
		0,
		0,
		0,
		0,
		1
	}
	self.mission_asset_cost_multiplier_by_risk = {
		0.5,
		1,
		2,
		4,
		6,
		8,
		10
	}
	self.mission_asset_cost_small = self._create_value_table(2500, 15000, 10, true, 1)
	self.mission_asset_cost_medium = self._create_value_table(10000, 45000, 10, true, 1)
	self.mission_asset_cost_large = self._create_value_table(55000, 400000, 10, true, 1)
	self.preplaning_asset_cost_multiplier_by_risk = {
		1,
		2,
		5,
		10,
		13,
		13,
		13
	}
	self.preplaning_asset_cost_thermite = 15000
	self.preplaning_asset_cost_escapebig = 10000
	self.preplaning_asset_cost_spycam = 1000
	self.preplaning_asset_cost_delay10 = 1000
	self.preplaning_asset_cost_delay20 = 1000
	self.preplaning_asset_cost_delay30 = 2000
	self.preplaning_asset_cost_timelock60 = 2000
	self.preplaning_asset_cost_cake = 3000
	self.preplaning_asset_cost_extracameras = 500
	self.preplaning_asset_cost_accesscameras = 1000
	self.preplaning_asset_cost_drillparts = 3000
	self.preplaning_asset_cost_deaddropbag = 1600
	self.preplaning_asset_cost_unlocked_door = 1000
	self.preplaning_asset_cost_unlocked_window = 1000
	self.preplaning_asset_cost_zipline = 2000
	self.preplaning_asset_cost_highlight_keybox = 1000
	self.preplaning_asset_cost_keycard = 2000
	self.preplaning_asset_cost_disable_alarm_button = 2000
	self.preplaning_asset_cost_safe_escape = 2000
	self.preplaning_asset_cost_sniper_spot = 2000
	self.preplaning_asset_cost_framing_frame_1_truck = 1000
	self.preplaning_asset_cost_framing_frame_1_entry_point = 1000
	self.preplaning_asset_cost_bag_shortcut = 2000
	self.preplaning_asset_cost_bag_zipline = 2000
	self.preplaning_asset_cost_loot_drop_off = 3000
	self.preplaning_asset_cost_thermal_paste = 3000
	self.preplaning_asset_cost_branchbank_vault_key = 3000
	self.preplaning_mia_cost_sniper = 3000
	self.preplaning_mia_cost_delayed_police = 2000
	self.preplaning_mia_cost_reduce_mobsters = 2000
	self.preplaning_asset_cost_glass_cutter = 1000
	self.preplaning_thebomb_cost_spotter = 4000
	self.preplaning_thebomb_cost_crowbar = 1000
	self.preplaning_thebomb_cost_ladder = 1000
	self.preplaning_thebomb_cost_hacker = 3000
	self.preplaning_thebomb_cost_manifest = 2000
	self.preplaning_thebomb_cost_pilot = 3000
	self.preplaning_thebomb_cost_escape_mid = 6000
	self.preplaning_thebomb_cost_escape_close = 10000
	self.preplaning_thebomb_cost_demolition = 500
	self.preplaning_asset_cost_roof_access = 2000
	self.preplaning_asset_cost_upper_floor_access = 1000
	self.preplaning_asset_cost_crowbar_single = 1000
	self.preplaning_asset_cost_mex_keys = 2000
	self.preplanning_asset_cost_bex_car_pull = 2000
	self.preplanning_asset_cost_bex_drunk_mariachi = 2000
	self.preplanning_asset_cost_bex_garbage_truck = 2000
	self.preplanning_asset_cost_bex_zipline = 2000
	self.preplanning_asset_cost_pex_parked_car = 2000
	self.preplanning_asset_cost_pex_spiked_churro = 2000
	self.preplanning_asset_cost_pex_camera_access = 2000
	self.preplanning_asset_cost_pex_open_window = 2000
	self.preplanning_asset_cost_fex_stealth_entry_with_boat = 2000
	self.preplanning_asset_cost_fex_loud_escape_with_heli = 2000
	self.preplanning_asset_cost_fex_stealth_semi_open_garage_door = 2000
	self.preplanning_asset_cost_kenaz_zeppelin_escape = 0
	self.preplanning_asset_cost_kenaz_van_escape = 0
	self.preplanning_asset_cost_kenaz_loud_entry_with_c4 = 0
	self.preplanning_asset_cost_kenaz_wrecking_ball_escape = 0
	self.preplanning_asset_cost_kenaz_drill_better_plasma_cutter = 0
	self.preplanning_asset_cost_kenaz_drill_improved_cooling_system = 0
	self.preplanning_asset_cost_kenaz_drill_engine_optimization = 0
	self.preplanning_asset_cost_kenaz_drill_engine_additional_power = 0
	self.preplanning_asset_cost_kenaz_drill_extra_battery = 0
	self.preplanning_asset_cost_kenaz_drill_water_level_indicator = 0
	self.preplanning_asset_cost_kenaz_drill_timer_addon = 0
	self.preplanning_asset_cost_kenaz_drill_toolbox = 0
	self.preplanning_asset_cost_kenaz_drill_medkit = 0
	self.preplanning_asset_cost_kenaz_drill_ammobox = 0
	self.preplanning_asset_cost_kenaz_ace_pilot = 0
	self.preplanning_asset_cost_kenaz_faster_blimp = 0
	self.preplanning_asset_cost_kenaz_rig_slotmachine = 0
	self.preplanning_asset_cost_kenaz_sabotage_skylight_barrier = 0
	self.preplanning_asset_cost_kenaz_customer_data_USB = 0
	self.preplanning_asset_cost_kenaz_unlocked_cages = 0
	self.preplanning_asset_cost_kenaz_unlocked_doors = 0
	self.preplanning_asset_cost_kenaz_guitar_case_position = 0
	self.preplanning_asset_cost_kenaz_disable_metal_detectors = 0
	self.preplanning_asset_cost_kenaz_celebrity_visit = 0
	self.preplanning_asset_cost_kenaz_vault_gate_key = 0
	self.preplanning_asset_cost_chas_tram = 5000
	self.small_loot = {}

	if difficulty_index <= 2 then
		self.small_loot.money_bundle = 1000
		self.small_loot.money_bundle_value = 10000
		self.small_loot.ring_band = 1954
		self.small_loot.diamondheist_vault_bust = 900
		self.small_loot.diamondheist_vault_diamond = 1150
		self.small_loot.diamondheist_big_diamond = 1150
		self.small_loot.mus_small_artifact = 700
		self.small_loot.value_gold = 3000
		self.small_loot.gen_atm = 23000
		self.small_loot.special_deposit_box = 3500
		self.small_loot.slot_machine_payout = 25000
		self.small_loot.vault_loot_chest = 570
		self.small_loot.vault_loot_diamond_chest = 610
		self.small_loot.vault_loot_banknotes = 500
		self.small_loot.vault_loot_silver = 540
		self.small_loot.vault_loot_diamond_collection = 650
		self.small_loot.vault_loot_trophy = 690
		self.small_loot.money_wrap_single_bundle_vscaled = 385
		self.small_loot.spawn_bucket_of_money = 20000
		self.small_loot.vault_loot_gold = 2500
		self.small_loot.vault_loot_cash = 1200
		self.small_loot.vault_loot_coins = 800
		self.small_loot.vault_loot_ring = 300
		self.small_loot.vault_loot_jewels = 600
		self.small_loot.vault_loot_macka = 1
		self.small_loot.federali_medal = 769
	elseif difficulty_index == 3 then
		self.small_loot.money_bundle = 1000
		self.small_loot.money_bundle_value = 10000
		self.small_loot.ring_band = 1954
		self.small_loot.diamondheist_vault_bust = 1800
		self.small_loot.diamondheist_vault_diamond = 2300
		self.small_loot.diamondheist_big_diamond = 2300
		self.small_loot.mus_small_artifact = 1450
		self.small_loot.value_gold = 3000
		self.small_loot.gen_atm = 46000
		self.small_loot.special_deposit_box = 3500
		self.small_loot.slot_machine_payout = 50000
		self.small_loot.vault_loot_chest = 1150
		self.small_loot.vault_loot_diamond_chest = 1250
		self.small_loot.vault_loot_banknotes = 1000
		self.small_loot.vault_loot_silver = 1100
		self.small_loot.vault_loot_diamond_collection = 1300
		self.small_loot.vault_loot_trophy = 1400
		self.small_loot.money_wrap_single_bundle_vscaled = 775
		self.small_loot.spawn_bucket_of_money = 40000
		self.small_loot.vault_loot_gold = 5000
		self.small_loot.vault_loot_cash = 2500
		self.small_loot.vault_loot_coins = 1500
		self.small_loot.vault_loot_ring = 750
		self.small_loot.vault_loot_jewels = 1200
		self.small_loot.vault_loot_macka = 1
		self.small_loot.federali_medal = 1538
	elseif difficulty_index == 4 then
		self.small_loot.money_bundle = 1000
		self.small_loot.money_bundle_value = 10000
		self.small_loot.ring_band = 1954
		self.small_loot.diamondheist_vault_bust = 4500
		self.small_loot.diamondheist_vault_diamond = 5750
		self.small_loot.diamondheist_big_diamond = 5750
		self.small_loot.mus_small_artifact = 3600
		self.small_loot.value_gold = 3000
		self.small_loot.gen_atm = 115000
		self.small_loot.special_deposit_box = 3500
		self.small_loot.slot_machine_payout = 125000
		self.small_loot.vault_loot_chest = 2900
		self.small_loot.vault_loot_diamond_chest = 3100
		self.small_loot.vault_loot_banknotes = 2500
		self.small_loot.vault_loot_silver = 2700
		self.small_loot.vault_loot_diamond_collection = 3300
		self.small_loot.vault_loot_trophy = 3500
		self.small_loot.money_wrap_single_bundle_vscaled = 1950
		self.small_loot.spawn_bucket_of_money = 100000
		self.small_loot.vault_loot_gold = 11500
		self.small_loot.vault_loot_cash = 5775
		self.small_loot.vault_loot_coins = 4000
		self.small_loot.vault_loot_ring = 1750
		self.small_loot.vault_loot_jewels = 3000
		self.small_loot.vault_loot_macka = 1
		self.small_loot.federali_medal = 3838
	elseif difficulty_index == 5 then
		self.small_loot.money_bundle = 1000
		self.small_loot.money_bundle_value = 10000
		self.small_loot.ring_band = 1954
		self.small_loot.diamondheist_vault_bust = 9000
		self.small_loot.diamondheist_vault_diamond = 11500
		self.small_loot.diamondheist_big_diamond = 11500
		self.small_loot.mus_small_artifact = 7000
		self.small_loot.value_gold = 3000
		self.small_loot.gen_atm = 230000
		self.small_loot.special_deposit_box = 3500
		self.small_loot.slot_machine_payout = 250000
		self.small_loot.vault_loot_chest = 5800
		self.small_loot.vault_loot_diamond_chest = 6200
		self.small_loot.vault_loot_banknotes = 5000
		self.small_loot.vault_loot_silver = 5400
		self.small_loot.vault_loot_diamond_collection = 6500
		self.small_loot.vault_loot_trophy = 6900
		self.small_loot.money_wrap_single_bundle_vscaled = 3800
		self.small_loot.spawn_bucket_of_money = 200000
		self.small_loot.vault_loot_gold = 23000
		self.small_loot.vault_loot_cash = 11500
		self.small_loot.vault_loot_coins = 8000
		self.small_loot.vault_loot_ring = 3500
		self.small_loot.vault_loot_jewels = 5775
		self.small_loot.vault_loot_macka = 1
		self.small_loot.federali_medal = 7692
	elseif difficulty_index == 6 then
		self.small_loot.money_bundle = 1000
		self.small_loot.money_bundle_value = 10000
		self.small_loot.ring_band = 1954
		self.small_loot.diamondheist_vault_bust = 12000
		self.small_loot.diamondheist_vault_diamond = 15000
		self.small_loot.diamondheist_big_diamond = 15000
		self.small_loot.mus_small_artifact = 9500
		self.small_loot.value_gold = 3000
		self.small_loot.gen_atm = 300000
		self.small_loot.special_deposit_box = 3500
		self.small_loot.slot_machine_payout = 325000
		self.small_loot.vault_loot_chest = 7500
		self.small_loot.vault_loot_diamond_chest = 8000
		self.small_loot.vault_loot_banknotes = 6500
		self.small_loot.vault_loot_silver = 7000
		self.small_loot.vault_loot_diamond_collection = 8500
		self.small_loot.vault_loot_trophy = 9000
		self.small_loot.money_wrap_single_bundle_vscaled = 5000
		self.small_loot.spawn_bucket_of_money = 260000
		self.small_loot.vault_loot_gold = 30000
		self.small_loot.vault_loot_cash = 15000
		self.small_loot.vault_loot_coins = 10500
		self.small_loot.vault_loot_ring = 4500
		self.small_loot.vault_loot_jewels = 7500
		self.small_loot.vault_loot_macka = 1
		self.small_loot.federali_medal = 11000
	elseif difficulty_index == 7 then
		self.small_loot.money_bundle = 1000
		self.small_loot.money_bundle_value = 10000
		self.small_loot.ring_band = 1954
		self.small_loot.diamondheist_vault_bust = 12000
		self.small_loot.diamondheist_vault_diamond = 15000
		self.small_loot.diamondheist_big_diamond = 15000
		self.small_loot.mus_small_artifact = 9500
		self.small_loot.value_gold = 3000
		self.small_loot.gen_atm = 300000
		self.small_loot.special_deposit_box = 3500
		self.small_loot.slot_machine_payout = 325000
		self.small_loot.vault_loot_chest = 7500
		self.small_loot.vault_loot_diamond_chest = 8000
		self.small_loot.vault_loot_banknotes = 6500
		self.small_loot.vault_loot_silver = 7000
		self.small_loot.vault_loot_diamond_collection = 8500
		self.small_loot.vault_loot_trophy = 9000
		self.small_loot.money_wrap_single_bundle_vscaled = 5000
		self.small_loot.spawn_bucket_of_money = 260000
		self.small_loot.vault_loot_gold = 30000
		self.small_loot.vault_loot_cash = 15000
		self.small_loot.vault_loot_coins = 10500
		self.small_loot.vault_loot_ring = 4500
		self.small_loot.vault_loot_jewels = 7500
		self.small_loot.vault_loot_macka = 1
		self.small_loot.federali_medal = 11000
	else
		self.small_loot.money_bundle = 1000
		self.small_loot.money_bundle_value = 10000
		self.small_loot.ring_band = 1954
		self.small_loot.diamondheist_vault_bust = 12000
		self.small_loot.diamondheist_vault_diamond = 15000
		self.small_loot.diamondheist_big_diamond = 15000
		self.small_loot.mus_small_artifact = 9500
		self.small_loot.value_gold = 3000
		self.small_loot.gen_atm = 300000
		self.small_loot.special_deposit_box = 3500
		self.small_loot.slot_machine_payout = 325000
		self.small_loot.vault_loot_chest = 7500
		self.small_loot.vault_loot_diamond_chest = 8000
		self.small_loot.vault_loot_banknotes = 6500
		self.small_loot.vault_loot_silver = 7000
		self.small_loot.vault_loot_diamond_collection = 8500
		self.small_loot.vault_loot_trophy = 9000
		self.small_loot.money_wrap_single_bundle_vscaled = 5000
		self.small_loot.spawn_bucket_of_money = 260000
		self.small_loot.vault_loot_gold = 30000
		self.small_loot.vault_loot_cash = 15000
		self.small_loot.vault_loot_coins = 10500
		self.small_loot.vault_loot_ring = 4500
		self.small_loot.vault_loot_jewels = 7500
		self.small_loot.vault_loot_macka = 1
		self.small_loot.federali_medal = 11000
	end

	self.max_small_loot_value = 20000000
	self.skilltree = {}
	self.skilltree.respec = {}
	self.skilltree.respec.base_cost = 200
	self.skilltree.respec.profile_cost_increaser_multiplier = {
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
	self.skilltree.respec.tier_cost = {}
	self.skilltree.respec.tier_cost[1] = 1500
	self.skilltree.respec.tier_cost[2] = 2000
	self.skilltree.respec.tier_cost[3] = 10000
	self.skilltree.respec.tier_cost[4] = 40000
	self.skilltree.respec.tier_cost[5] = 100000
	self.skilltree.respec.tier_cost[6] = 400000
	self.skilltree.respec.base_point_cost = 500
	self.skilltree.respec.point_tier_cost = self._create_value_table(4000, self.biggest_cashout * 0.18, 6, true, 1.1)
	self.skilltree.respec.respec_refund_multiplier = 0.6
	self.skilltree.respec.point_cost = 0
	self.skilltree.respec.point_multiplier_cost = 1

	local loot_drop_value = 10000

	self.loot_drop_cash = {}
	self.loot_drop_cash.cash10 = loot_drop_value * 2
	self.loot_drop_cash.cash20 = loot_drop_value * 4
	self.loot_drop_cash.cash30 = loot_drop_value * 6
	self.loot_drop_cash.cash40 = loot_drop_value * 8
	self.loot_drop_cash.cash50 = loot_drop_value * 9
	self.loot_drop_cash.cash60 = loot_drop_value * 10
	self.loot_drop_cash.cash70 = loot_drop_value * 11
	self.loot_drop_cash.cash80 = loot_drop_value * 12
	self.loot_drop_cash.cash90 = loot_drop_value * 13
	self.loot_drop_cash.cash100 = loot_drop_value * 14
	self.loot_drop_cash.cash_preorder = self.biggest_cashout / 10

	if IS_XB1 then
		self.loot_drop_cash.xone_bonus = 5000000
	end

	self.unlock_new_mask_slot_value = self.biggest_cashout
	self.unlock_new_weapon_slot_value = self.biggest_cashout
	self.moneythrower = {}
	self.moneythrower.max_kills_per_session = 100
	self.moneythrower.kill_to_offshore_multiplier = 1000
	self.bag_values.garden_gnome = 9.99
	self.bag_values.ranc_weapon = 3000
	self.bag_values.turret_part = 6000
	self.bag_values.corp_papers = 2500
	self.bag_values.corp_prototype = 3000
end
