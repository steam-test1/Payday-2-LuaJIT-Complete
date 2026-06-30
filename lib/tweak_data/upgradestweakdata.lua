UpgradesTweakData = UpgradesTweakData or class()

function UpgradesTweakData:_init_pd2_values()
	self:_init_value_tables()

	self.values.rep_upgrades = {}
	self.values.rep_upgrades.classes = {
		"rep_upgrade"
	}
	self.values.rep_upgrades.values = {
		2
	}
	self.values.player.body_armor = {}
	self.values.player.body_armor.armor = {
		0,
		3,
		4,
		5,
		7,
		9,
		15
	}
	self.values.player.body_armor.movement = {
		1.05,
		1.025,
		1,
		0.95,
		0.75,
		0.65,
		0.575
	}
	self.values.player.body_armor.concealment = {
		30,
		26,
		23,
		21,
		18,
		12,
		1
	}
	self.values.player.body_armor.dodge = {
		0.05,
		-0.05,
		-0.1,
		-0.15,
		-0.2,
		-0.25,
		-0.55
	}
	self.values.player.body_armor.damage_shake = {
		1,
		0.96,
		0.92,
		0.85,
		0.8,
		0.7,
		0.5
	}
	self.values.player.body_armor.stamina = {
		1.025,
		1,
		0.95,
		0.9,
		0.85,
		0.8,
		0.7
	}

	if _G.IS_VR then
		self.values.player.body_armor.armor = {
			0,
			3,
			4,
			5,
			7,
			9,
			15
		}
		self.values.player.body_armor.dodge = {
			0.05,
			-0.05,
			-0.1,
			-0.15,
			-0.2,
			-0.25,
			-0.55
		}
	end

	self.values.player.body_armor.skill_ammo_mul = {
		1,
		1.02,
		1.04,
		1.06,
		1.8,
		1.1,
		1.12
	}
	self.values.player.ballistic_vest_concealment = {
		4
	}
	self.values.player.body_armor.skill_max_health_store = {
		14,
		13.5,
		12.5,
		12,
		10.5,
		9.5,
		4
	}
	self.values.player.body_armor.skill_kill_change_regenerate_speed = {
		14,
		13.5,
		12.5,
		12,
		10.5,
		9.5,
		4
	}
	self.values.player.special_enemy_highlight = {
		true
	}
	self.values.player.hostage_trade = {
		true
	}
	self.values.player.sec_camera_highlight = {
		true
	}
	self.values.player.sec_camera_highlight_mask_off = {
		true
	}
	self.values.player.special_enemy_highlight_mask_off = {
		true
	}
	self.values.player.super_syndrome = {
		1
	}
	self.values.player.stability_increase_bonus_1 = {
		2
	}
	self.values.player.stability_increase_bonus_2 = {
		4
	}
	self.values.player.not_moving_accuracy_increase = {
		4
	}
	self.values.player.hip_fire_accuracy_inc = {
		3
	}
	self.values.player.melee_damage_stacking = {
		{
			max_multiplier = 16,
			melee_multiplier = 1
		}
	}
	self.ammo_bag_base = 4
	self.ecm_jammer_base_battery_life = 20
	self.ecm_jammer_base_low_battery_life = 8
	self.ecm_jammer_base_range = 2500
	self.ecm_feedback_min_duration = 15
	self.ecm_feedback_max_duration = 20
	self.ecm_feedback_interval = 1.5
	self.sentry_gun_base_ammo = 100
	self.sentry_gun_base_armor = 10
	self.doctor_bag_base = 2
	self.first_aid_kit = {}
	self.first_aid_kit.revived_damage_reduction = {
		{
			0.7,
			5
		},
		{
			0.2,
			5
		}
	}
	self.grenade_crate_base = 3
	self.max_grenade_amount = 3
	self.bodybag_crate_base = 3
	self.enemy_hurt_alert_radius_whisper = 1
	self.enemy_hurt_alert_radius = 400
	self.drill_alert_radius = 2500
	self.taser_malfunction_min = 5
	self.taser_malfunction_max = 30
	self.counter_taser_damage = 0.5
	self.morale_boost_speed_bonus = 1.2
	self.morale_boost_suppression_resistance = 1
	self.morale_boost_time = 10
	self.morale_boost_reload_speed_bonus = 1.2
	self.morale_boost_base_cooldown = 3.5
	self.max_weapon_dmg_mul_stacks = 4
	self.max_melee_weapon_dmg_mul_stacks = 1
	self.hostage_near_player_radius = 1000
	self.hostage_near_player_check_t = 0.5
	self.hostage_near_player_multiplier = 1.25
	self.hostage_max_num = {
		damage_dampener = 1,
		health = 4,
		health_regen = 1,
		stamina = 4
	}
	self.on_headshot_dealt_cooldown = 2
	self.on_killshot_cooldown = 1
	self.on_damage_dealt_cooldown = 2
	self.close_combat_distance = 1800
	self.killshot_close_panic_range = 900
	self.berserker_movement_speed_multiplier = 0.4
	self.weapon_cost_multiplier = {}
	self.weapon_cost_multiplier.akimbo = 1.4
	self.weapon_movement_penalty = {}
	self.weapon_movement_penalty.lmg = 1
	self.weapon_movement_penalty.minigun = 1
	self.explosive_bullet = {}
	self.explosive_bullet.curve_pow = 0.5
	self.explosive_bullet.player_dmg_mul = 0.0885
	self.explosive_bullet.range = 200
	self.explosive_bullet.feedback_range = self.explosive_bullet.range
	self.explosive_bullet.camera_shake_max_mul = 2
	self.values.player.crime_net_deal = {
		0.9,
		0.8
	}
	self.values.player.corpse_alarm_pager_bluff = {
		true
	}
	self.values.player.marked_enemy_extra_damage = {
		true
	}
	self.values.player.marked_enemy_damage_mul = 1.15
	self.values.player.marked_distance_mul = {
		20
	}
	self.values.cable_tie.interact_speed_multiplier = {
		0.25
	}
	self.values.cable_tie.quantity_1 = {
		4
	}
	self.values.cable_tie.can_cable_tie_doors = {
		true
	}
	self.values.temporary.combat_medic_damage_multiplier = {
		{
			1.25,
			10
		},
		{
			1.25,
			15
		}
	}
	self.values.player.revive_health_boost = {
		1
	}
	self.revive_health_multiplier = {
		1.3
	}
	self.values.temporary.revived_damage_resist = {
		{
			0.7,
			10
		}
	}
	self.values.temporary.increased_movement_speed = {
		{
			1.3,
			10
		}
	}
	self.values.temporary.swap_weapon_faster = {
		{
			2,
			10
		}
	}
	self.values.temporary.reload_weapon_faster = {
		{
			2,
			10
		}
	}
	self.values.player.melee_kill_increase_reload_speed = {
		{
			1.5,
			10
		}
	}
	self.values.player.civ_harmless_bullets = {
		true
	}
	self.values.player.civ_harmless_melee = {
		true
	}
	self.values.player.civ_calming_alerts = {
		true
	}
	self.values.player.civ_intimidation_mul = {
		1.5
	}
	self.values.team.pistol.recoil_multiplier = {
		0.75
	}
	self.values.team.akimbo.recoil_multiplier = self.values.team.pistol.recoil_multiplier
	self.values.team.weapon.recoil_multiplier = {
		0.5
	}
	self.values.team.pistol.suppression_recoil_multiplier = self.values.team.pistol.recoil_multiplier
	self.values.team.akimbo.suppression_recoil_multiplier = self.values.team.akimbo.recoil_multiplier
	self.values.team.weapon.suppression_recoil_multiplier = self.values.team.weapon.recoil_multiplier
	self.values.weapon.enter_steelsight_speed_multiplier = {
		2
	}
	self.values.player.assets_cost_multiplier = {
		0.5
	}
	self.values.player.additional_assets = {
		true
	}
	self.values.player.stamina_multiplier = {
		2
	}
	self.values.team.stamina.multiplier = {
		1.5
	}
	self.values.team.damage = {}
	self.values.team.damage.hostage_absorption = {
		0.05
	}
	self.values.team.damage.hostage_absorption_limit = 8
	self.values.player.intimidate_enemies = {
		true
	}
	self.values.player.intimidate_range_mul = {
		1.5
	}
	self.values.player.intimidate_aura = {
		1000
	}
	self.values.player.civilian_reviver = {
		true
	}
	self.values.player.civilian_gives_ammo = {
		true
	}
	self.values.player.buy_cost_multiplier = {
		0.9,
		0.7
	}
	self.values.player.sell_cost_multiplier = {
		1.25
	}
	self.values.player.armor_carry_bonus = {
		1.01
	}
	self.values.doctor_bag.quantity = {
		1
	}
	self.values.doctor_bag.amount_increase = {
		2
	}
	self.values.player.convert_enemies = {
		true
	}
	self.values.player.convert_enemies_max_minions = {
		1,
		2
	}
	self.values.player.convert_enemies_health_multiplier = {
		0.45
	}
	self.values.player.convert_enemies_damage_multiplier = {
		0.65,
		1
	}
	self.values.player.xp_multiplier = {
		1.15
	}
	self.values.team.xp.multiplier = {
		1.3
	}
	self.values.pistol.reload_speed_multiplier = {
		1.5
	}
	self.values.akimbo.reload_speed_multiplier = self.values.pistol.reload_speed_multiplier
	self.values.pistol.damage_addend = {
		0.5,
		1.5
	}
	self.values.pistol.damage_multiplier = {
		1.5
	}
	self.values.pistol.magazine_capacity_inc = {
		5
	}
	self.values.pistol.stacked_accuracy_bonus = {
		{
			accuracy_bonus = 0.9,
			max_stacks = 4,
			max_time = 10
		}
	}
	self.values.pistol.stacking_hit_damage_multiplier = {
		{
			damage_bonus = 2.2,
			max_stacks = 1,
			max_time = 2
		},
		{
			damage_bonus = 2.2,
			max_stacks = 1,
			max_time = 4
		}
	}
	self.values.assault_rifle.reload_speed_multiplier = {
		1.15
	}
	self.values.assault_rifle.move_spread_multiplier = {
		0.5
	}
	self.values.player.messiah_revive_from_bleed_out = {
		1
	}
	self.values.player.recharge_messiah = {
		1
	}
	self.values.pistol.spread_multiplier = {
		0.9
	}
	self.values.akimbo.spread_multiplier = self.values.pistol.spread_multiplier
	self.values.pistol.swap_speed_multiplier = {
		1.5
	}
	self.values.pistol.fire_rate_multiplier = {
		1.5
	}
	self.values.player.revive_interaction_speed_multiplier = {
		0.5
	}
	self.values.cooldown.long_dis_revive = {
		{
			1,
			20
		}
	}
	self.values.doctor_bag.interaction_speed_multiplier = {
		0.8
	}
	self.values.team.stamina.passive_multiplier = {
		1.5,
		1.3
	}
	self.values.player.passive_intimidate_range_mul = {
		1.25
	}
	self.values.team.health.passive_multiplier = {
		1.1
	}
	self.values.player.passive_convert_enemies_damage_multiplier = {
		1.15
	}
	self.values.player.convert_enemies_interaction_speed_multiplier = {
		0.35
	}
	self.values.player.empowered_intimidation_mul = {
		3
	}
	self.values.player.passive_assets_cost_multiplier = {
		0.5
	}
	self.values.player.escape_taser = {
		2
	}
	self.values.player.suppression_multiplier = {
		1.75
	}
	self.values.carry.movement_speed_multiplier = {
		1.5
	}
	self.values.carry.throw_distance_multiplier = {
		1.5
	}
	self.values.player.no_ammo_cost = {
		true,
		true
	}
	self.values.player.non_special_melee_multiplier = {
		2
	}
	self.values.player.melee_damage_multiplier = {
		2
	}

	if _G.IS_VR then
		self.values.player.non_special_melee_multiplier = {
			2
		}
		self.values.player.melee_damage_multiplier = {
			2
		}
	end

	self.values.player.primary_weapon_when_downed = {
		true
	}
	self.values.player.armor_regen_timer_multiplier = {
		0.85
	}
	self.values.temporary.dmg_multiplier_outnumbered = {
		{
			1.15,
			7
		}
	}
	self.values.temporary.dmg_dampener_outnumbered = {
		{
			0.9,
			7
		}
	}
	self.values.player.extra_ammo_multiplier = {
		1.25
	}
	self.values.player.pick_up_ammo_multiplier = {
		1.35,
		1.75
	}
	self.values.player.regain_throwable_from_ammo = {
		{
			chance = 0.05,
			chance_inc = 0.01
		}
	}
	self.values.player.damage_shake_multiplier = {
		0.5
	}
	self.values.player.bleed_out_health_multiplier = {
		1.5
	}
	self.values.shotgun.recoil_multiplier = {
		0.75
	}
	self.values.shotgun.damage_multiplier = {
		1.05,
		1.15
	}
	self.values.ammo_bag.quantity = {
		1
	}
	self.values.ammo_bag.ammo_increase = {
		2
	}
	self.values.shotgun.reload_speed_multiplier = {
		1.15,
		1.5
	}
	self.values.shotgun.enter_steelsight_speed_multiplier = {
		2.25
	}
	self.values.saw.extra_ammo_multiplier = {
		1.5
	}
	self.values.player.flashbang_multiplier = {
		0.25,
		0.25
	}
	self.values.shotgun.hip_fire_spread_multiplier = {
		0.8
	}
	self.values.pistol.hip_fire_spread_multiplier = {
		0.8
	}
	self.values.assault_rifle.hip_fire_spread_multiplier = {
		0.8
	}
	self.values.smg.hip_fire_spread_multiplier = {
		0.8
	}
	self.values.smg.zoom_increase = {
		2
	}
	self.values.saw.hip_fire_spread_multiplier = {
		0.8
	}
	self.values.player.saw_speed_multiplier = {
		0.95,
		0.65
	}
	self.values.saw.lock_damage_multiplier = {
		1.2,
		1.4
	}
	self.values.saw.enemy_slicer = {
		1
	}
	self.values.player.melee_damage_health_ratio_multiplier = {
		2.5
	}
	self.values.player.damage_health_ratio_multiplier = {
		1
	}
	self.player_damage_health_ratio_threshold = 0.5
	self.values.player.shield_knock = {
		true
	}
	self.values.player.shield_knock_bullet = {
		chance = 0.8,
		max_damage = 200
	}
	self.values.temporary.overkill_damage_multiplier = {
		{
			1.75,
			20
		}
	}
	self.values.player.overkill_all_weapons = {
		true
	}
	self.values.temporary.unseen_strike = {
		{
			1.35,
			6
		},
		{
			1.35,
			18
		}
	}
	self.values.player.passive_suppression_multiplier = {
		1.1,
		1.2
	}
	self.values.player.passive_health_multiplier = {
		1.1,
		1.2,
		1.4,
		1.8,
		2
	}
	self.values.weapon.passive_damage_multiplier = {
		1.05
	}
	self.values.weapon.knock_down = {
		0.05,
		0.2
	}
	self.values.weapon.automatic_head_shot_add = {
		0.3,
		0.9
	}
	self.values.assault_rifle.enter_steelsight_speed_multiplier = {
		2
	}
	self.values.assault_rifle.zoom_increase = {
		2
	}
	self.values.player.crafting_weapon_multiplier = {
		0.9
	}
	self.values.player.crafting_mask_multiplier = {
		0.9
	}
	self.values.trip_mine.can_switch_on_off = {
		true
	}
	self.values.player.drill_speed_multiplier = {
		0.85,
		0.7
	}
	self.values.player.drill_melee_hit_restart_chance = {
		true
	}
	self.values.player.drill_restart_chance = {
		true
	}
	self.values.player.trip_mine_deploy_time_multiplier = {
		0.8,
		0.6
	}
	self.values.trip_mine.sensor_toggle = {
		true
	}
	self.values.trip_mine.fire_trap = {
		{
			0,
			1
		},
		{
			10,
			1.5
		}
	}
	self.values.player.drill_fix_interaction_speed_multiplier = {
		0.75
	}
	self.values.player.drill_autorepair_1 = {
		0.1
	}
	self.values.player.drill_autorepair_2 = {
		0.2
	}
	self.values.player.sentry_gun_deploy_time_multiplier = {
		0.5
	}
	self.values.sentry_gun.armor_multiplier = {
		2.5
	}
	self.values.weapon.single_spread_multiplier = {
		0.8
	}
	self.values.assault_rifle.recoil_multiplier = {
		0.75
	}
	self.sharpshooter_categories = {
		"assault_rifle",
		"smg",
		"snp"
	}
	self.values.player.taser_malfunction = {
		{
			chance_to_trigger = 0.3,
			interval = 1
		}
	}
	self.values.player.taser_self_shock = {
		true
	}
	self.values.sentry_gun.spread_multiplier = {
		2
	}
	self.values.sentry_gun.rot_speed_multiplier = {
		2
	}
	self.values.player.interacting_damage_multiplier = {
		0.5
	}
	self.values.player.steelsight_when_downed = {
		true
	}
	self.values.player.drill_alert_rad = {
		900
	}
	self.values.player.silent_drill = {
		true
	}
	self.values.sentry_gun.extra_ammo_multiplier = {
		2
	}
	self.values.sentry_gun.shield = {
		true
	}
	self.values.trip_mine.explosion_size_multiplier_1 = {
		1.3
	}
	self.values.trip_mine.explosion_size_multiplier_2 = {
		1.7
	}
	self.values.player.trip_mine_shaped_charge = {
		true
	}
	self.values.sentry_gun.quantity = {
		1,
		3
	}
	self.values.sentry_gun.damage_multiplier = {
		2.5
	}
	self.values.weapon.clip_ammo_increase = {
		5,
		15
	}
	self.values.player.armor_multiplier = {
		1.3
	}
	self.values.team.armor.regen_time_multiplier = {
		0.75
	}
	self.values.player.passive_crafting_weapon_multiplier = {
		0.99,
		0.96,
		0.91
	}
	self.values.player.passive_crafting_mask_multiplier = {
		0.99,
		0.96,
		0.91
	}
	self.values.weapon.passive_recoil_multiplier = {
		0.95,
		0.9
	}
	self.values.weapon.passive_headshot_damage_multiplier = {
		1.25
	}
	self.values.player.passive_armor_multiplier = {
		1.1,
		1.25
	}
	self.values.team.armor.passive_regen_time_multiplier = {
		0.9
	}
	self.values.player.small_loot_multiplier = {
		1.3
	}
	self.values.player.stamina_regen_timer_multiplier = {
		0.75
	}
	self.values.player.stamina_regen_multiplier = {
		1.25
	}
	self.values.player.run_dodge_chance = {
		0.1
	}
	self.values.player.run_speed_multiplier = {
		1.25
	}
	self.values.player.fall_damage_multiplier = {
		0.25
	}
	self.values.player.fall_health_damage_multiplier = {
		0
	}
	self.values.player.respawn_time_multiplier = {
		0.5
	}
	self.values.weapon.special_damage_taken_multiplier = {
		1.05
	}
	self.values.player.buy_bodybags_asset = {
		true
	}
	self.values.player.corpse_dispose = {
		true
	}
	self.values.player.corpse_dispose_amount = {
		1,
		2
	}
	self.values.carry.interact_speed_multiplier = {
		0.75,
		0.25
	}
	self.values.player.suspicion_multiplier = {
		0.75
	}
	self.values.player.camouflage_bonus = {
		0.85,
		0.65
	}
	self.values.temporary.damage_speed_multiplier = {
		{
			1.3,
			5
		}
	}
	self.values.player.team_damage_speed_multiplier_send = {
		true
	}
	self.values.temporary.team_damage_speed_multiplier_received = {
		{
			1.3,
			5
		}
	}
	self.values.player.walk_speed_multiplier = {
		1.25
	}
	self.values.player.crouch_speed_multiplier = {
		1.1,
		1.2
	}
	self.values.player.silent_kill = {
		25
	}
	self.values.player.melee_knockdown_mul = {
		1.5
	}
	self.values.player.damage_dampener = {
		0.95
	}
	self.values.player.melee_damage_dampener = {
		0.5
	}
	self.values.smg.reload_speed_multiplier = {
		1.15
	}
	self.values.smg.fire_rate_multiplier = {
		1.2
	}
	self.values.player.additional_lives = {
		1,
		3
	}
	self.values.player.cheat_death_chance = {
		0.15,
		0.45
	}
	self.values.ecm_jammer.can_activate_feedback = {
		true
	}
	self.values.ecm_jammer.feedback_duration_boost = {
		1.25
	}
	self.values.ecm_jammer.interaction_speed_multiplier = {
		0
	}
	self.values.weapon.silencer_damage_multiplier = {
		1.15,
		1.3
	}
	self.values.weapon.armor_piercing_chance_silencer = {
		0.2,
		0.4
	}
	self.values.ecm_jammer.duration_multiplier = {
		true
	}
	self.values.ecm_jammer.duration_multiplier_2 = {
		true
	}
	self.values.ecm_jammer.can_open_sec_doors = {
		true
	}
	self.values.player.pick_lock_easy = {
		true
	}
	self.values.player.pick_lock_easy_speed_multiplier = {
		0.5
	}
	self.values.player.pick_lock_hard = {
		true
	}
	self.values.weapon.silencer_recoil_multiplier = {
		0.5
	}
	self.values.weapon.silencer_spread_multiplier = {
		0.5
	}
	self.values.weapon.silencer_enter_steelsight_speed_multiplier = {
		2
	}
	self.values.player.loot_drop_multiplier = {
		1.5,
		3
	}
	self.values.ecm_jammer.quantity = {
		1,
		3
	}
	self.values.ecm_jammer.feedback_duration_boost_2 = {
		1.25
	}
	self.values.ecm_jammer.affects_pagers = {
		true
	}
	self.values.player.can_strafe_run = {
		true
	}
	self.values.player.can_free_run = {
		true
	}
	self.values.ecm_jammer.affects_cameras = {
		true
	}
	self.values.player.passive_dodge_chance = {
		0.15,
		0.3,
		0.45
	}
	self.values.weapon.passive_swap_speed_multiplier = {
		1.8,
		2
	}
	self.values.player.passive_concealment_modifier = {
		1
	}
	self.values.player.passive_armor_movement_penalty_multiplier = {
		0.75
	}
	self.values.player.passive_loot_drop_multiplier = {
		1.1
	}
	self.values.player.automatic_mag_increase = {
		15
	}
	self.values.weapon.armor_piercing_chance = {
		0.25
	}
	self.values.lmg.recoil_multiplier = {
		0.75
	}
	self.values.lmg.enter_steelsight_speed_multiplier = {
		2
	}
	self.values.lmg.reload_speed_multiplier = {
		1.25
	}
	self.values.lmg.move_spread_multiplier = {
		0.5
	}
	self.values.lmg.hip_fire_spread_multiplier = {
		0.8
	}
	self.values.lmg.hip_fire_damage_multiplier = {
		1.2
	}
	self.values.lmg.zoom_increase = {
		2
	}
	self.values.snp.recoil_multiplier = {
		0.75
	}
	self.values.snp.enter_steelsight_speed_multiplier = {
		2
	}
	self.values.snp.reload_speed_multiplier = {
		1.15
	}
	self.values.snp.move_spread_multiplier = {
		0.5
	}
	self.values.snp.hip_fire_spread_multiplier = {
		0.8
	}
	self.values.snp.hip_fire_damage_multiplier = {
		1.2
	}
	self.values.snp.zoom_increase = {
		2
	}
	self.values.player.silencer_concealment_increase = {
		1
	}
	self.values.player.silencer_concealment_penalty_decrease = {
		2
	}
	self.values.player.run_and_shoot = {
		true
	}
	self.values.player.run_and_reload = {
		true
	}
	self.values.player.morale_boost = {
		true
	}
	self.values.player.electrocution_resistance_multiplier = {
		0.25
	}
	self.values.player.single_shot_accuracy_inc = {
		0.8
	}
	self.values.player.deploy_interact_faster = {
		0.5
	}
	self.values.player.second_deployable = {
		true
	}
	self.values.player.armor_depleted_stagger_shot = {
		0,
		6
	}
	self.values.player.revived_health_regain = {
		1.4
	}
	self.values.player.head_shot_ammo_return = {
		{
			ammo = 1,
			headshots = 3,
			time = 6
		},
		{
			ammo = 1,
			headshots = 2,
			time = 6
		}
	}
	self.values.player.concealment_modifier = {
		5,
		10,
		15
	}
	self.values.sentry_gun.armor_multiplier2 = {
		1.25
	}
	self.values.sentry_gun.cost_reduction = {
		2,
		3
	}
	self.values.sentry_gun.less_noisy = {
		true
	}
	self.values.sentry_gun.ap_bullets = {
		true
	}
	self.values.sentry_gun.fire_rate_reduction = {
		4
	}
	self.values.saw.armor_piercing_chance = {
		1
	}
	self.values.saw.swap_speed_multiplier = {
		1.8
	}
	self.values.saw.reload_speed_multiplier = {
		1.5
	}
	self.values.saw.ignore_shields = {
		true
	}
	self.values.saw.panic_when_kill = {
		{
			amount = 200,
			area = 1000,
			chance = 0.5
		}
	}
	self.values.team.health.hostage_multiplier = {
		1.06
	}
	self.values.team.stamina.hostage_multiplier = {
		1.12
	}
	self.values.player.minion_master_speed_multiplier = {
		1.1
	}
	self.values.player.minion_master_health_multiplier = {
		1.3
	}
	self.values.player.mark_enemy_time_multiplier = {
		2
	}
	self.values.player.critical_hit_chance = {
		0.25,
		0.5
	}
	self.values.player.melee_kill_snatch_pager_chance = {
		0.25
	}
	self.values.player.detection_risk_add_crit_chance = {
		{
			0.03,
			3,
			"below",
			35,
			0.3
		},
		{
			0.03,
			1,
			"below",
			35,
			0.3
		}
	}
	self.values.player.detection_risk_add_dodge_chance = {
		{
			0.01,
			3,
			"below",
			35,
			0.1
		},
		{
			0.01,
			1,
			"below",
			35,
			0.1
		}
	}
	self.values.player.detection_risk_damage_multiplier = {
		{
			0.05,
			7,
			"above",
			40
		}
	}
	self.values.player.unseen_increased_crit_chance = {
		{
			crit_chance = 1.35,
			max_duration = 6,
			min_time = 4
		},
		{
			crit_chance = 1.35,
			max_duration = 18,
			min_time = 4
		}
	}
	self.values.shotgun.steelsight_accuracy_inc = {
		0.6
	}
	self.values.shotgun.steelsight_range_inc = {
		1.5
	}
	self.values.shotgun.hip_run_and_shoot = {
		true
	}
	self.values.shotgun.hip_rate_of_fire = {
		1.35
	}
	self.values.shotgun.magazine_capacity_inc = {
		15
	}
	self.values.player.overkill_health_to_damage_multiplier = {
		0.66
	}
	self.values.player.tased_recover_multiplier = {
		0.5
	}
	self.values.player.secured_bags_speed_multiplier = {
		1.02
	}
	self.values.temporary.no_ammo_cost_buff = {
		{
			true,
			60
		}
	}
	self.values.player.secured_bags_money_multiplier = {
		1.02
	}
	self.values.pistol.stacking_hit_expire_t = {
		6,
		20
	}
	self.values.pistol.zoom_increase = {
		2
	}
	self.values.carry.movement_penalty_nullifier = {
		true
	}
	self.values.temporary.berserker_damage_multiplier = {
		{
			1,
			3
		},
		{
			1,
			6
		}
	}
	self.values.player.berserker_no_ammo_cost = {
		true
	}
	self.values.player.hostage_health_regen_addend = {
		0.015,
		0.045
	}
	self.values.player.carry_sentry_and_trip = {
		true
	}
	self.values.player.tier_armor_multiplier = {
		1.05,
		1.1,
		1.2,
		1.3,
		1.15,
		1.35
	}
	self.values.player.double_drop = {
		6
	}
	self.values.player.increased_pickup_area = {
		1.5
	}
	self.values.player.weapon_accuracy_increase = {
		2
	}
	self.values.player.weapon_movement_stability = {
		0.8
	}
	self.values.shotgun.hip_fire_damage_multiplier = {
		1.2
	}
	self.values.pistol.hip_fire_damage_multiplier = {
		1.2
	}
	self.values.assault_rifle.hip_fire_damage_multiplier = {
		1.2
	}
	self.values.smg.hip_fire_damage_multiplier = {
		1.2
	}
	self.values.saw.hip_fire_damage_multiplier = {
		1.2
	}
	self.values.shotgun.consume_no_ammo_chance = {
		0.01,
		0.03
	}
	self.values.player.add_armor_stat_skill_ammo_mul = {
		true
	}
	self.values.saw.melee_knockdown_mul = {
		1.75
	}
	self.values.shotgun.melee_knockdown_mul = {
		1.75
	}
	self.values.player.assets_cost_multiplier_b = {
		0.5
	}
	self.values.player.premium_contract_cost_multiplier = {
		0.5
	}
	self.values.player.morale_boost_cooldown_multiplier = {
		0.5
	}
	self.values.player.level_interaction_timer_multiplier = {
		{
			0.01,
			10
		}
	}
	self.values.team.player.clients_buy_assets = {
		true
	}
	self.values.player.steelsight_normal_movement_speed = {
		true
	}
	self.values.team.weapon.move_spread_multiplier = {
		1.1
	}
	self.values.team.player.civ_intimidation_mul = {
		1.15
	}
	self.values.sentry_gun.can_revive = {
		true
	}
	self.values.sentry_gun.can_reload = {
		true
	}
	self.sentry_gun_reload_ratio = 1
	self.values.weapon.modded_damage_multiplier = {
		1.1
	}
	self.values.weapon.modded_spread_multiplier = {
		0.9
	}
	self.values.weapon.modded_recoil_multiplier = {
		0.9
	}
	self.values.sentry_gun.armor_piercing_chance = {
		0.15
	}
	self.values.sentry_gun.armor_piercing_chance_2 = {
		0.05
	}
	self.values.weapon.armor_piercing_chance_2 = {
		0.05
	}
	self.values.player.resist_firing_tased = {
		true
	}
	self.values.player.crouch_dodge_chance = {
		0.05,
		0.15
	}
	self.values.player.climb_speed_multiplier = {
		1.2,
		1.75
	}
	self.values.player.ap_bullets = {
		true
	}
	self.values.team.xp.stealth_multiplier = {
		1.5
	}
	self.values.team.cash.stealth_money_multiplier = {
		1.5
	}
	self.values.team.cash.stealth_bags_multiplier = {
		1.5
	}
	self.values.player.tape_loop_duration = {
		10,
		20
	}
	self.values.player.tape_loop_interact_distance_mul = {
		1.4
	}
	self.values.player.buy_spotter_asset = {
		true
	}
	self.values.player.close_to_hostage_boost = {
		true
	}
	self.values.trip_mine.sensor_highlight = {
		true
	}
	self.values.player.on_zipline_dodge_chance = {
		0.15
	}
	self.values.player.movement_speed_multiplier = {
		1.1
	}
	self.values.player.level_2_armor_addend = {
		2
	}
	self.values.player.level_3_armor_addend = {
		2
	}
	self.values.player.level_4_armor_addend = {
		2
	}
	self.values.player.level_2_dodge_addend = {
		0.05,
		0.15,
		0.25
	}
	self.values.player.level_3_dodge_addend = {
		0.05,
		0.15,
		0.25
	}
	self.values.player.level_4_dodge_addend = {
		0.05,
		0.15,
		0.25
	}
	self.values.player.damage_shake_addend = {
		1
	}
	self.values.player.melee_concealment_modifier = {
		2
	}
	self.values.player.melee_sharp_damage_multiplier = {
		3
	}
	self.values.team.armor.multiplier = {
		1.05
	}
	self.values.player.armor_regen_timer_multiplier_passive = {
		0.9
	}
	self.values.player.armor_regen_timer_multiplier_tier = {
		0.9
	}
	self.values.player.armor_regen_time_mul = {
		0.85
	}
	self.values.player.camouflage_multiplier = {
		0.85
	}
	self.values.player.uncover_multiplier = {
		1.15
	}
	self.values.player.passive_xp_multiplier = {
		1.45
	}
	self.values.player.pick_up_ammo_multiplier_2 = {
		1.3
	}
	self.values.team.damage_dampener.team_damage_reduction = {
		0.92
	}
	self.values.team.damage_dampener.hostage_multiplier = {
		0.92
	}
	self.values.player.level_2_armor_multiplier = {
		1.2,
		1.4,
		1.65
	}
	self.values.player.level_3_armor_multiplier = {
		1.2,
		1.4,
		1.65
	}
	self.values.player.level_4_armor_multiplier = {
		1.2,
		1.4,
		1.65
	}
	self.values.player.passive_health_regen = {
		0.03
	}
	self.values.player.healing_reduction = {
		0.25,
		1
	}
	self.values.player.health_damage_reduction = {
		0.9,
		0.75
	}
	self.values.player.max_health_reduction = {
		0.3
	}
	self.values.cable_tie.quantity_2 = {
		4
	}
	self.ecm_feedback_retrigger_interval = 240
	self.ecm_feedback_retrigger_chance = 1
	self.values.player.revive_damage_reduction_level = {
		1,
		2
	}
	self.values.ecm_jammer.can_retrigger = {
		true
	}
	self.values.player.panic_suppression = {
		true
	}
	self.values.akimbo.extra_ammo_multiplier = {
		1.5,
		2
	}
	self.values.akimbo.damage_multiplier = {
		1.5,
		3
	}
	self.values.akimbo.recoil_multiplier = {
		2.5,
		2,
		1.5
	}
	self.values.akimbo.passive_recoil_multiplier = {
		2.5,
		2
	}
	self.values.akimbo.clip_ammo_increase = self.values.weapon.clip_ammo_increase
	self.values.player.perk_armor_regen_timer_multiplier = {
		0.95,
		0.85,
		0.75,
		0.65,
		0.55
	}
	self.values.player.perk_armor_loss_multiplier = {
		0.95,
		0.9,
		0.85,
		0.8
	}
	self.values.player.headshot_regen_armor_bonus = {
		0.5,
		2.5
	}
	self.values.bodybags_bag.quantity = {
		1
	}
	self.values.first_aid_kit.quantity = {
		7,
		10
	}
	self.values.first_aid_kit.deploy_time_multiplier = {
		0.5
	}
	self.values.first_aid_kit.damage_reduction_upgrade = {
		true
	}
	self.values.first_aid_kit.downs_restore_chance = {
		0.1
	}
	self.values.first_aid_kit.first_aid_kit_auto_recovery = {
		500
	}
	self.values.temporary.first_aid_damage_reduction = {
		{
			0.9,
			120
		}
	}
	self.values.player.extra_corpse_dispose_amount = {
		1
	}
	self.values.player.standstill_omniscience = {
		true
	}
	self.values.player.mask_off_pickup = {
		true
	}
	self.values.player.cleaner_cost_multiplier = {
		0.25
	}
	self.values.player.counter_strike_melee = {
		true
	}
	self.values.player.counter_strike_spooc = {
		true
	}
	self.values.temporary.passive_revive_damage_reduction = {
		{
			0.7,
			5
		},
		{
			0.2,
			5
		}
	}
	self.values.temporary.revive_damage_reduction = {
		{
			0.7,
			5
		}
	}
	self.values.player.revive_damage_reduction = {
		0.7
	}
	self.values.player.passive_convert_enemies_health_multiplier = {
		0.55,
		0.01
	}
	self.values.player.automatic_faster_reload = {
		{
			max_reload_increase = 2,
			min_bullets = 20,
			min_reload_increase = 1.4,
			penalty = 0.98,
			target_enemies = 2
		}
	}
	self.values.player.run_and_shoot = {
		true
	}
	self.values.player.armor_regen_timer_stand_still_multiplier = {
		0.8
	}
	self.values.player.tier_dodge_chance = {
		0.2,
		0.25,
		0.3
	}
	self.values.player.stand_still_crouch_camouflage_bonus = {
		0.9,
		0.85,
		0.8
	}
	self.values.player.corpse_dispose_speed_multiplier = {
		0.8
	}
	self.values.player.pick_lock_speed_multiplier = {
		0.8
	}
	self.values.player.alarm_pager_speed_multiplier = {
		0.9
	}
	self.values.temporary.melee_life_leech = {
		{
			0.2,
			10
		}
	}
	self.values.temporary.dmg_dampener_outnumbered_strong = {
		{
			0.88,
			7
		}
	}
	self.values.temporary.dmg_dampener_close_contact = {
		{
			0.92,
			7
		},
		{
			0.84,
			7
		},
		{
			0.76,
			7
		}
	}
	self.values.melee.stacking_hit_damage_multiplier = {
		10,
		10
	}
	self.values.melee.stacking_hit_expire_t = {
		7
	}
	self.values.player.melee_kill_life_leech = {
		0.1
	}
	self.values.player.killshot_regen_armor_bonus = {
		3
	}
	self.values.player.killshot_close_regen_armor_bonus = {
		3
	}
	self.values.player.killshot_close_panic_chance = {
		0.75
	}
	self.loose_ammo_restore_health_values = {
		{
			0,
			4
		},
		{
			4,
			8
		},
		{
			8,
			12
		},
		base = 8,
		cd = 3,
		multiplier = 0.2
	}
	self.values.player.marked_inc_dmg_distance = {
		{
			1000,
			1.5
		}
	}
	self.loose_ammo_give_team_ratio = 0.5
	self.loose_ammo_give_team_health_ratio = 0.5
	self.values.temporary.loose_ammo_restore_health = {}

	for i, data in ipairs(self.loose_ammo_restore_health_values) do
		local base = self.loose_ammo_restore_health_values.base

		table.insert(self.values.temporary.loose_ammo_restore_health, {
			{
				base + data[1],
				base + data[2]
			},
			self.loose_ammo_restore_health_values.cd
		})
	end

	self.values.temporary.loose_ammo_give_team = {
		{
			true,
			5
		}
	}
	self.values.player.loose_ammo_restore_health_give_team = {
		true
	}
	self.values.temporary.single_shot_fast_reload = {
		{
			2,
			4
		}
	}
	self.values.player.gain_life_per_players = {
		0.2
	}
	self.damage_to_hot_data = {
		max_stacks = false,
		stacking_cooldown = 1.5,
		tick_time = 0.3,
		total_ticks = 10,
		works_with_armor_kit = true,
		armors_allowed = {
			"level_1",
			"level_2"
		},
		add_stack_sources = {
			bullet = true,
			civilian = false,
			explosion = true,
			fire = true,
			melee = true,
			poison = true,
			projectile = true,
			swat_van = true,
			taser_tased = true
		}
	}
	self.values.player.damage_to_hot = {
		0.1,
		0.2,
		0.3,
		0.4
	}
	self.values.player.damage_to_hot_extra_ticks = {
		4
	}
	self.values.player.armor_piercing_chance = {
		0.1,
		0.3
	}
	self.values.player.armor_regen_damage_health_ratio_multiplier = {
		0.2,
		0.4,
		0.6
	}
	self.values.player.movement_speed_damage_health_ratio_multiplier = {
		0.2
	}
	self.values.player.armor_regen_damage_health_ratio_threshold_multiplier = {
		2
	}
	self.values.player.movement_speed_damage_health_ratio_threshold_multiplier = {
		2
	}
	self.values.player.armor_grinding = {
		{
			{
				1,
				2
			},
			{
				1.5,
				3
			},
			{
				2,
				4
			},
			{
				2.5,
				5
			},
			{
				3.5,
				6
			},
			{
				4.5,
				7
			},
			{
				8.5,
				10
			}
		}
	}
	self.values.player.health_decrease = {
		0.5
	}
	self.values.player.armor_increase = {
		1,
		1.1,
		1.2
	}
	self.values.player.damage_to_armor = {
		{
			{
				3,
				1.5
			},
			{
				3,
				1.5
			},
			{
				3,
				1.5
			},
			{
				3,
				1.5
			},
			{
				3,
				1.5
			},
			{
				3,
				1.5
			},
			{
				3,
				1.5
			}
		}
	}
	self.values.assault_rifle.move_spread_index_addend = {
		2
	}
	self.values.snp.move_spread_index_addend = {
		2
	}
	self.values.smg.move_spread_index_addend = {
		2
	}
	self.values.pistol.spread_index_addend = {
		2
	}
	self.values.shotgun.hip_fire_spread_index_addend = {
		1
	}
	self.values.weapon.hip_fire_spread_index_addend = {
		1
	}
	self.values.weapon.single_spread_index_addend = {
		2
	}
	self.values.weapon.silencer_spread_index_addend = {
		3
	}
	self.values.team.pistol.recoil_index_addend = {
		1
	}
	self.values.team.weapon.recoil_index_addend = {
		2
	}
	self.values.team.pistol.suppression_recoil_index_addend = self.values.team.pistol.recoil_index_addend
	self.values.team.weapon.suppression_recoil_index_addend = self.values.team.weapon.recoil_index_addend
	self.values.shotgun.recoil_index_addend = {
		2
	}
	self.values.assault_rifle.recoil_index_addend = {
		2
	}
	self.values.weapon.silencer_recoil_index_addend = {
		2
	}
	self.values.lmg.recoil_index_addend = {
		1
	}
	self.values.snp.recoil_index_addend = {
		2
	}
	self.values.akimbo.recoil_index_addend = {
		-9,
		-7,
		-5,
		-3,
		-1
	}
	self.values.weapon.steelsight_highlight_specials = {
		true
	}
	self.armor_health_store_kill_amount = 1
	self.kill_change_regenerate_speed_percentage = false
	self.values.player.armor_health_store_amount = {
		0.4,
		0.8,
		1.2
	}
	self.values.player.armor_max_health_store_multiplier = {
		1.5
	}
	self.values.player.kill_change_regenerate_speed = {
		1.4
	}
	self.values.temporary.armor_break_invulnerable = {
		{
			2,
			15
		}
	}
	self.values.temporary.armor_break_invulnerable[2] = {
		2,
		45
	}
	self.values.player.passive_always_regen_armor = {
		1.5
	}
	self.values.player.passive_damage_reduction = {
		0.5
	}
	self.cocaine_stacks_convert_levels = {
		30,
		25
	}
	self.cocaine_stacks_dmg_absorption_value = 0.1
	self.cocaine_stacks_tick_rounding = 4
	self.cocaine_stacks_tick_t = self.cocaine_stacks_tick_rounding
	self.max_cocaine_stacks_per_tick = 240
	self.max_total_cocaine_stacks = 600
	self.cocaine_stacks_decay_t = self.cocaine_stacks_tick_rounding * 2
	self.cocaine_stacks_decay_amount_per_tick = 80
	self.cocaine_stacks_decay_percentage_per_tick = 0.6
	self.values.player.cocaine_stacking = {
		1
	}
	self.values.player.sync_cocaine_stacks = {
		true
	}
	self.values.player.cocaine_stacks_decay_multiplier = {
		0.5
	}
	self.values.player.sync_cocaine_upgrade_level = {
		2
	}
	self.values.player.cocaine_stack_absorption_multiplier = {
		2
	}
	self.wild_trigger_time = 4
	self.wild_max_triggers_per_time = 4
	self.values.player.wild_health_amount = {
		0.5
	}
	self.values.player.wild_armor_amount = {
		0.5
	}
	self.values.player.less_health_wild_armor = {
		{
			0.1,
			0.1
		}
	}
	self.values.player.less_health_wild_cooldown = {
		{
			0.1,
			0.1
		}
	}
	self.values.player.less_armor_wild_health = {
		{
			0.1,
			0.1
		}
	}
	self.values.player.less_armor_wild_cooldown = {
		{
			0.1,
			0.1
		}
	}
	self.values.temporary.chico_injector = {
		{
			0.75,
			6
		}
	}
	self.values.player.chico_armor_multiplier = {
		1.15,
		1.2,
		1.25
	}
	self.values.player.chico_preferred_target = {
		true
	}
	self.values.player.chico_injector_low_health_multiplier = {
		{
			0.5,
			0.25
		}
	}
	self.values.player.chico_injector_health_to_speed = {
		{
			5,
			1
		}
	}
	self.values.player.pocket_ecm_jammer_base = {
		{
			affects_cameras = true,
			affects_pagers = true,
			cooldown_drain = 6,
			duration = 6,
			feedback_interval = 1,
			feedback_range = 2500
		}
	}
	self.values.player.pocket_ecm_heal_on_kill = {
		2
	}
	self.values.team.pocket_ecm_heal_on_kill = {
		1
	}
	self.values.temporary.pocket_ecm_kill_dodge = {
		{
			0.2,
			30,
			1
		}
	}
	self.values.player.dodge_shot_gain = {
		{
			0.2,
			4
		}
	}
	self.values.player.dodge_replenish_armor = {
		true
	}
	self.values.player.smoke_screen_ally_dodge_bonus = {
		0.1
	}
	self.values.player.sicario_multiplier = {
		2
	}
	self.values.player.tag_team_base = {
		{
			distance = 18,
			duration = 12,
			kill_extension = 1.3,
			kill_health_gain = 1.5,
			radius = 0.6,
			tagged_health_gain_ratio = 0.5
		}
	}
	self.values.player.tag_team_cooldown_drain = {
		{
			owner = 2,
			tagged = 0
		},
		{
			owner = 2,
			tagged = 2
		}
	}
	self.values.player.tag_team_damage_absorption = {
		{
			kill_gain = 0.2,
			max = 2
		}
	}
	self.values.player.armor_to_health_conversion = {
		100
	}
	self.values.player.damage_control_passive = {
		{
			75,
			9
		}
	}
	self.values.player.damage_control_auto_shrug = {
		4
	}
	self.values.player.damage_control_cooldown_drain = {
		{
			0,
			1
		},
		{
			35,
			2
		}
	}
	self.values.player.damage_control_healing = {
		50
	}
	self.copr_specialization_tree_id = 22
	self.copr_teammate_heal_count_multipliers = {
		1,
		0.75,
		0.5,
		0.25
	}
	self.copr_ability_cooldown = 40
	self.copr_risen_cooldown_add = 30
	self.copr_high_damage_multiplier = {
		20,
		2
	}
	self.values.temporary.copr_ability = {
		{
			true,
			6
		},
		{
			true,
			10
		}
	}
	self.values.player.copr_static_damage_ratio = {
		0.2,
		0.1
	}
	self.values.player.copr_kill_life_leech = {
		2,
		2
	}
	self.values.player.copr_activate_bonus_health_ratio = {
		0.4
	}
	self.values.player.copr_out_of_health_move_slow = {
		0.2
	}
	self.values.player.copr_speed_up_on_kill = {
		1
	}
	self.values.player.copr_teammate_heal = {
		0.05,
		0.1
	}
	self.values.player.activate_ability_downed = {
		true
	}

	local health_boost = 0.2
	local armor_boost = 0.05
	local dodge_boost = 0.05
	local crouch_speed_multiplier = 0.1
	local carry_speed_multiplier = 0.1

	self.values.player.mrwi_health_multiplier = {
		1 + health_boost * 1,
		1 + health_boost * 2,
		1 + health_boost * 3,
		1 + health_boost * 4
	}
	self.values.player.mrwi_armor_multiplier = {
		1 + armor_boost * 1,
		1 + armor_boost * 2,
		1 + armor_boost * 3,
		1 + armor_boost * 4
	}
	self.values.player.mrwi_dodge_chance = {
		dodge_boost * 1,
		dodge_boost * 2,
		dodge_boost * 3,
		dodge_boost * 4
	}
	self.values.player.mrwi_crouch_speed_multiplier = {
		1 + crouch_speed_multiplier * 1,
		1 + crouch_speed_multiplier * 2,
		1 + crouch_speed_multiplier * 3,
		1 + crouch_speed_multiplier * 4
	}
	self.values.player.mrwi_carry_speed_multiplier = {
		1 + carry_speed_multiplier * 1,
		1 + carry_speed_multiplier * 2,
		1 + carry_speed_multiplier * 3,
		1 + carry_speed_multiplier * 4
	}

	local auto_reload_kills = 10

	self.values.player.primary_reload_secondary = {
		auto_reload_kills
	}
	self.values.player.secondary_reload_primary = {
		auto_reload_kills
	}

	local auto_reload_swap_duration = 3

	self.values.weapon.primary_reload_swap_secondary = {
		auto_reload_swap_duration
	}
	self.values.weapon.secondary_reload_swap_primary = {
		auto_reload_swap_duration
	}
	self.values.weapon.mrwi_swap_speed_multiplier = {
		2.6
	}
	self.values.player.dodge_ricochet_bullets = {
		{
			1,
			0
		}
	}
	self.values.player.headshot_regen_health_bonus = {
		1
	}
	self.values.temporary.mrwi_health_invulnerable = {
		{
			0.5,
			2,
			15
		}
	}
	self.values.player.warp_health = {
		{
			0,
			0.3,
			5,
			5
		},
		{
			0,
			0.6,
			5,
			5
		},
		{
			0,
			0.9,
			5,
			5
		},
		{
			0,
			1.2,
			5,
			5
		},
		{
			0,
			1.5,
			5,
			5
		}
	}
	self.values.player.warp_armor = {
		{
			0.2,
			0.6,
			3,
			3
		},
		{
			0.4,
			1,
			3,
			3
		},
		{
			0.6,
			1.4,
			3,
			3
		},
		{
			0.8,
			1.8,
			3,
			3
		},
		{
			1,
			2.2,
			3,
			3
		}
	}
	self.values.player.warp_dodge = {
		{
			0.01,
			0.06,
			3
		},
		{
			0.01,
			0.07,
			3
		},
		{
			0.01,
			0.08,
			3
		},
		{
			0.01,
			0.09,
			3
		},
		{
			0.01,
			0.1,
			3
		}
	}
	self.values.player.warp_armor_lite = {
		{
			0.1,
			0.3,
			3,
			5
		},
		{
			0.2,
			0.5,
			3,
			5
		},
		{
			0.3,
			0.7,
			3,
			5
		},
		{
			0.4,
			0.9,
			3,
			5
		},
		{
			0.5,
			1.1,
			3,
			5
		}
	}
	self.values.player.stamina_ammo_refill_single = {
		{
			25,
			0.01
		}
	}
	self.values.player.stamina_ammo_refill_auto = {
		{
			40,
			0.05
		}
	}
	self.values.player.post_warp_suppression = {
		{
			800,
			1,
			3
		}
	}
	self.values.player.post_warp_reload_speed = {
		{
			0.2,
			0.5
		}
	}
	self.values.player.run_dodge_chance_vr = {
		{
			1,
			5
		}
	}
	self.values.snp.graze_damage = {
		{
			damage_factor = 0.2,
			damage_factor_headshot = 0.2,
			radius = 100
		},
		{
			damage_factor = 0.2,
			damage_factor_headshot = 1,
			radius = 100
		}
	}
	self.values.team.crew_add_health = {
		6
	}
	self.values.team.crew_add_armor = {
		3
	}
	self.values.team.crew_add_dodge = {
		0.05
	}
	self.values.team.crew_add_concealment = {
		3
	}
	self.values.team.crew_add_stamina = {
		50
	}
	self.values.team.crew_reduce_speed_penalty = {
		0.5
	}
	self.values.team.crew_faster_reload = {
		1.5
	}
	self.values.team.crew_faster_swap = {
		1.5
	}
	self.values.team.crew_throwable_regen = {
		35
	}
	self.values.team.crew_health_regen = {
		0.5
	}
	self.values.team.crew_active = {
		1,
		2,
		3
	}
	self.values.team.crew_inspire = {
		{
			360,
			240,
			120
		}
	}
	self.values.team.crew_scavenge = {
		{
			0.2,
			0.4,
			0.6
		}
	}
	self.values.team.crew_interact = {
		{
			0.75,
			0.5,
			0.25
		}
	}
	self.values.team.crew_ai_ap_ammo = {
		true
	}
	self.values.team.crew_ai_cable_ties = {
		{
			2,
			3,
			4
		}
	}
	self.values.team.crew_ai_flashbang = {
		{
			360,
			240,
			120
		}
	}
	self.values.team.crew_ai_counter_strike = {
		{
			360,
			240,
			120
		}
	}
	self.values.team.crew_ai_counter_tase = {
		{
			180,
			120,
			60
		}
	}

	local editable_crew_descrition = {
		crew_healthy = {
			"60"
		},
		crew_sturdy = {
			"30"
		},
		crew_evasive = {
			"5"
		},
		crew_quiet = {
			"3"
		},
		crew_motivated = {
			"50",
			"50%"
		},
		crew_eager = {
			"50%",
			"50%"
		},
		crew_generous = {
			"35"
		},
		crew_regen = {
			"5",
			"5"
		},
		crew_inspire = {
			"6",
			"2"
		},
		crew_scavenge = {
			"20%",
			"+20%"
		},
		crew_interact = {
			"25%",
			"+25%"
		},
		crew_ai_cable_ties = {
			"+2",
			"+1"
		},
		crew_ai_flashbang = {
			"6",
			"2"
		},
		crew_ai_counter_strike = {
			"6",
			"2"
		},
		crew_ai_counter_tase = {
			"3",
			"1"
		}
	}

	self.crew_descs = {}

	for id, desc in pairs(editable_crew_descrition) do
		self.crew_descs[id] = {}

		for i, value in ipairs(desc) do
			self.crew_descs[id]["value" .. i] = value
		end
	end

	local editable_skill_descs = {
		ammo_2x = {
			{
				"2"
			},
			{
				"50%"
			}
		},
		ammo_reservoir = {
			{
				"5"
			},
			{
				"10",
				"15"
			}
		},
		assassin = {
			{
				"25%",
				"10%"
			},
			{
				"95%"
			}
		},
		bandoliers = {
			{
				"25%"
			},
			{
				"175%",
				"75%",
				"5%",
				"1%"
			}
		},
		black_marketeer = {
			{
				"1.5%",
				"5"
			},
			{
				"4.5%",
				"5"
			}
		},
		blast_radius = {
			{
				"70%"
			},
			{}
		},
		cable_guy = {
			{
				"75%",
				"50%"
			},
			{
				"4",
				"2"
			}
		},
		carbon_blade = {
			{
				"20%",
				"80%"
			},
			{
				"50%",
				"20%",
				"10"
			}
		},
		cat_burglar = {
			{
				"75%"
			},
			{
				"50%"
			}
		},
		chameleon = {
			{
				"25%",
				"10",
				"3.5"
			},
			{
				"15%",
				"75%"
			}
		},
		cleaner = {
			{
				"5%",
				"3",
				"1",
				"1",
				"2"
			},
			{
				"1",
				"2"
			}
		},
		combat_medic = {
			{
				"30%",
				"5"
			},
			{
				"30%"
			}
		},
		control_freak = {
			{
				"10%",
				"40%",
				"45%"
			},
			{
				"20%",
				"40%",
				"30%",
				"54%"
			}
		},
		discipline = {
			{
				"50%"
			},
			{}
		},
		dominator = {
			{},
			{
				"50%"
			}
		},
		drill_expert = {
			{
				"15%"
			},
			{
				"15%"
			}
		},
		ecm_2x = {
			{
				"2"
			},
			{
				"25%",
				"25%"
			}
		},
		ecm_booster = {
			{
				"25%"
			},
			{}
		},
		ecm_feedback = {
			{
				"50%-100%",
				"25",
				"1.5",
				"15-20"
			},
			{
				"25%",
				"100%",
				"4"
			}
		},
		enforcer = {
			{
				"400%"
			},
			{}
		},
		equilibrium = {
			{
				"4",
				"50%",
				"33%"
			},
			{
				"100%",
				"8"
			}
		},
		fast_learner = {
			{
				"10%",
				"5",
				"30%"
			},
			{
				"20%",
				"50%"
			}
		},
		from_the_hip = {
			{
				"4"
			},
			{
				"4"
			}
		},
		ghost = {
			{
				"1",
				"20"
			},
			{}
		},
		good_luck_charm = {
			{
				"10",
				"1"
			},
			{
				"10"
			}
		},
		gun_fighter = {
			{
				"50%",
				"5"
			},
			{
				"15",
				"10"
			}
		},
		hardware_expert = {
			{
				"25%",
				"20%"
			},
			{
				"30%",
				"50%",
				"10%"
			}
		},
		single_shot_ammo_return = {
			{
				"20%",
				"100cm"
			},
			{
				"100%",
				"20%"
			}
		},
		inside_man = {
			{
				"50%"
			},
			{}
		},
		inspire = {
			{
				"100%",
				"20%",
				"10"
			},
			{
				"100%",
				"20",
				"9"
			}
		},
		insulation = {
			{
				"30%"
			},
			{
				"50%",
				"2"
			}
		},
		iron_man = {
			{
				"50%",
				"25%"
			},
			{
				"25%",
				"100%"
			}
		},
		joker = {
			{},
			{
				"55%",
				"35%",
				"65%"
			}
		},
		juggernaut = {
			{
				"30%"
			},
			{}
		},
		kilmer = {
			{
				"25%"
			},
			{
				"8"
			}
		},
		leadership = {
			{
				"4"
			},
			{
				"8"
			}
		},
		mag_plus = {
			{
				"5"
			},
			{
				"10"
			}
		},
		magic_touch = {
			{
				"25%"
			},
			{
				"25%"
			}
		},
		martial_arts = {
			{
				"50%"
			},
			{
				"50%"
			}
		},
		master_craftsman = {
			{
				"30%"
			},
			{
				"15%"
			}
		},
		mastermind = {
			{
				"2"
			},
			{}
		},
		medic_2x = {
			{
				"2"
			},
			{
				"2"
			}
		},
		nine_lives = {
			{
				"1",
				"50%"
			},
			{
				"35%",
				"1"
			}
		},
		oppressor = {
			{
				"25%",
				"15%"
			},
			{
				"50%",
				"75%"
			}
		},
		overkill = {
			{
				"75%",
				"20"
			},
			{
				"80%"
			}
		},
		pack_mule = {
			{
				"50%"
			},
			{
				"50%",
				"10",
				"1%"
			}
		},
		messiah = {
			{
				"1"
			},
			{
				"2"
			}
		},
		portable_saw = {
			{},
			{
				"1",
				"40%"
			}
		},
		rifleman = {
			{
				"100%"
			},
			{
				"25%",
				"16"
			}
		},
		scavenger = {
			{
				"30%",
				"5"
			},
			{
				"20%",
				"30%"
			}
		},
		sentry_2_0 = {
			{},
			{}
		},
		sentry_gun = {
			{},
			{
				"150%"
			}
		},
		sentry_gun_2x = {
			{
				"2"
			},
			{
				"300%"
			}
		},
		sentry_targeting_package = {
			{
				"100%"
			},
			{
				"150%",
				"50%"
			}
		},
		shades = {
			{
				"25%"
			},
			{
				"50%"
			}
		},
		shaped_charge = {
			{
				"3"
			},
			{}
		},
		sharpshooter = {
			{
				"4",
				"8"
			},
			{
				"8",
				"20%"
			}
		},
		shotgun_cqb = {
			{
				"50%",
				"15%"
			},
			{
				"35%",
				"125%",
				"12"
			}
		},
		shotgun_impact = {
			{
				"8",
				"5%"
			},
			{
				"15%",
				"10%"
			}
		},
		show_of_force = {
			{
				"50%"
			},
			{
				"15%",
				"20"
			}
		},
		silence = {
			{},
			{}
		},
		silence_expert = {
			{
				"8",
				"100%"
			},
			{
				"8",
				"20%",
				"12"
			}
		},
		silent_drilling = {
			{
				"65%"
			},
			{}
		},
		smg_master = {
			{
				"35%"
			},
			{
				"20%"
			}
		},
		smg_training = {
			{},
			{}
		},
		sprinter = {
			{
				"25%",
				"25%"
			},
			{
				"10%",
				"10%",
				"15%"
			}
		},
		steroids = {
			{
				"100%"
			},
			{
				"100%"
			}
		},
		stockholm_syndrome = {
			{
				"50%"
			},
			{
				"1"
			}
		},
		tactician = {
			{
				"15%"
			},
			{}
		},
		target_mark = {
			{},
			{}
		},
		technician = {
			{
				"2"
			},
			{}
		},
		tough_guy = {
			{
				"50%"
			},
			{
				"25%"
			}
		},
		transporter = {
			{
				"25%"
			},
			{
				"50%"
			}
		},
		triathlete = {
			{
				"100%",
				"4",
				"75%"
			},
			{
				"0.5",
				"8"
			}
		},
		trip_mine_expert = {
			{
				"30%"
			},
			{
				"50%"
			}
		},
		trip_miner = {
			{
				"1"
			},
			{
				"20%"
			}
		},
		underdog = {
			{
				"18",
				"15%",
				"7"
			},
			{
				"18",
				"10%",
				"7"
			}
		},
		wolverine = {
			{
				"25%",
				"250%",
				"50%"
			},
			{
				"25%",
				"100%",
				"50%"
			}
		},
		stable_shot = {
			{
				"8"
			},
			{
				"16"
			}
		},
		hitman = {
			{
				"15%"
			},
			{
				"50%",
				"10",
				"100%"
			}
		},
		speedy_reload = {
			{
				"15%"
			},
			{
				"100%",
				"4"
			}
		},
		spotter_teamwork = {
			{
				"3",
				"6",
				"1"
			},
			{
				"2",
				"1"
			}
		},
		far_away = {
			{
				"40%"
			},
			{
				"50%"
			}
		},
		close_by = {
			{},
			{
				"35%",
				"15"
			}
		},
		scavenging = {
			{
				"50%"
			},
			{
				"6"
			}
		},
		dire_need = {
			{},
			{
				"6"
			}
		},
		unseen_strike = {
			{
				"4",
				"35%",
				"6"
			},
			{
				"18"
			}
		},
		dance_instructor = {
			{
				"5"
			},
			{
				"50%"
			}
		},
		akimbo_skill = {
			{
				"8"
			},
			{
				"8",
				"50%"
			}
		},
		running_from_death = {
			{
				"100%",
				"10"
			},
			{
				"30%",
				"10"
			}
		},
		up_you_go = {
			{
				"30%",
				"10"
			},
			{
				"40%"
			}
		},
		feign_death = {
			{
				"15%"
			},
			{
				"30%"
			}
		},
		bloodthirst = {
			{
				"100%",
				"1600%"
			},
			{
				"50%",
				"10"
			}
		},
		frenzy = {
			{
				"30%",
				"10%",
				"75%"
			},
			{
				"25%",
				"0%"
			}
		},
		defense_up = {
			{
				"5%"
			},
			{}
		},
		eco_sentry = {
			{
				"5%"
			},
			{
				"150%"
			}
		},
		engineering = {
			{},
			{
				"75%",
				"250%"
			}
		},
		jack_of_all_trades = {
			{
				"100%"
			},
			{
				"50%"
			}
		},
		tower_defense = {
			{
				"1"
			},
			{
				"2"
			}
		},
		steady_grip = {
			{
				"8"
			},
			{
				"16"
			}
		},
		heavy_impact = {
			{
				"5%"
			},
			{
				"20%"
			}
		},
		fire_control = {
			{
				"12"
			},
			{
				"20%"
			}
		},
		shock_and_awe = {
			{},
			{
				"2",
				"100%",
				"1%",
				"20",
				"40%"
			}
		},
		fast_fire = {
			{
				"15"
			},
			{}
		},
		body_expertise = {
			{
				"30%"
			},
			{
				"90%"
			}
		},
		kick_starter = {
			{
				"20%"
			},
			{
				"1",
				"50%"
			}
		},
		expert_handling = {
			{
				"10%",
				"10",
				"4"
			},
			{
				"1",
				"50%"
			}
		},
		optic_illusions = {
			{
				"35%"
			},
			{
				"1",
				"2"
			}
		},
		more_fire_power = {
			{
				"1",
				"4"
			},
			{
				"2",
				"7"
			}
		},
		fire_trap = {
			{
				"10",
				"4"
			},
			{
				"10",
				"50%"
			}
		},
		combat_engineering = {
			{
				"30%"
			},
			{
				"50%"
			}
		},
		hoxton = {
			{
				"4"
			},
			{}
		},
		freedom_call = {
			{
				"20%"
			},
			{
				"15%"
			}
		},
		hidden_blade = {
			{
				"2"
			},
			{
				"95%"
			}
		},
		tea_time = {
			{
				"50%"
			},
			{
				"10%",
				"120"
			}
		},
		awareness = {
			{
				"10%",
				"20%"
			},
			{
				"75%"
			}
		},
		alpha_dog = {
			{
				"5%"
			},
			{
				"10%"
			}
		},
		tea_cookies = {
			{
				"3",
				"7"
			},
			{
				"7",
				"5",
				"3",
				"20"
			}
		},
		cell_mates = {
			{
				"10%"
			},
			{
				"25%"
			}
		},
		thug_life = {
			{
				"1"
			},
			{
				"75%"
			}
		},
		thick_skin = {
			{
				"10",
				"2"
			},
			{
				"20",
				"4"
			}
		},
		backstab = {
			{
				"3%",
				"3",
				"35",
				"30%"
			},
			{
				"3%",
				"1",
				"35",
				"30%"
			}
		},
		drop_soap = {
			{},
			{}
		},
		second_chances = {
			{
				"1",
				"25"
			},
			{
				"2",
				"100%"
			}
		},
		trigger_happy = {
			{
				"10%",
				"2",
				"1",
				"120%"
			},
			{
				"8",
				"4"
			}
		},
		perseverance = {
			{
				"0",
				"3",
				"60%"
			},
			{
				"3"
			}
		},
		jail_workout = {
			{
				"3.5",
				"10",
				"25%"
			},
			{
				"30%"
			}
		},
		akimbo = {
			{
				"-16",
				"8"
			},
			{
				"-8",
				"150%",
				"8",
				"50%"
			}
		},
		jail_diet = {
			{
				"1%",
				"3",
				"35",
				"10%"
			},
			{
				"1%",
				"1",
				"35",
				"10%"
			}
		},
		prison_wife = {
			{
				"15",
				"2",
				"5"
			},
			{
				"30",
				"2",
				"20"
			}
		},
		mastermind_tier1 = {
			{
				"20%"
			}
		},
		mastermind_tier2 = {
			{
				"15%"
			}
		},
		mastermind_tier3 = {
			{
				"25%"
			}
		},
		mastermind_tier4 = {
			{
				"10%"
			}
		},
		mastermind_tier5 = {
			{
				"65%"
			}
		},
		mastermind_tier6 = {
			{
				"200%",
				"50%"
			}
		},
		enforcer_tier1 = {
			{
				"10%"
			}
		},
		enforcer_tier2 = {
			{
				"10%"
			}
		},
		enforcer_tier3 = {
			{
				"10%"
			}
		},
		enforcer_tier4 = {
			{
				"10%"
			}
		},
		enforcer_tier5 = {
			{
				"5%"
			}
		},
		enforcer_tier6 = {
			{
				"30%"
			}
		},
		technician_tier1 = {
			{
				"1%"
			}
		},
		technician_tier2 = {
			{
				"5%"
			}
		},
		technician_tier3 = {
			{
				"3%"
			}
		},
		technician_tier4 = {
			{
				"25%"
			}
		},
		technician_tier5 = {
			{
				"5%"
			}
		},
		technician_tier6 = {
			{
				"5%",
				"10%",
				"10%"
			}
		},
		ghost_tier1 = {
			{
				"5%"
			}
		},
		ghost_tier2 = {
			{
				"20%"
			}
		},
		ghost_tier3 = {
			{
				"10%"
			}
		},
		ghost_tier4 = {
			{
				"+5",
				"25%"
			}
		},
		ghost_tier5 = {
			{
				"80%"
			}
		},
		ghost_tier6 = {
			{
				"10%",
				"15%"
			}
		},
		hoxton_tier1 = {
			{}
		},
		hoxton_tier2 = {
			{}
		},
		hoxton_tier3 = {
			{}
		},
		hoxton_tier4 = {
			{}
		},
		hoxton_tier5 = {
			{}
		},
		hoxton_tier6 = {
			{}
		}
	}

	if _G.IS_VR then
		editable_skill_descs.steroids = {
			{
				"100%"
			},
			{
				"100%"
			}
		}
	end

	self.skill_descs = {}

	for skill_id, skill_desc in pairs(editable_skill_descs) do
		self.skill_descs[skill_id] = {}

		for index, skill_version in ipairs(skill_desc) do
			local version = index == 1 and "multibasic" or "multipro"

			self.skill_descs[skill_id][index] = #skill_version

			for i, desc in ipairs(skill_version) do
				self.skill_descs[skill_id][version .. (i == 1 and "" or tostring(i))] = desc
			end
		end
	end

	local editable_skill_btns = {
		jack_of_all_trades = {
			BTN_CHANGE_EQ = function()
				return managers.localization:btn_macro("change_equipment") or managers.localization:get_default_macro("BTN_CHANGE_EQ")
			end
		}
	}

	self.skill_btns = {}

	for skill_id, skill_btns in pairs(editable_skill_btns) do
		self.skill_btns[skill_id] = {}

		for i, desc in pairs(skill_btns) do
			self.skill_btns[skill_id][tostring(i)] = desc
		end
	end

	local editable_specialization_lootdrop_drop_multiplier = "10%"
	local editable_specialization_template = {
		{},
		{
			"25%"
		},
		{},
		{
			"+1",
			"15%",
			"45%"
		},
		{},
		{
			"135%"
		},
		{},
		{
			"5%",
			"20%"
		},
		{
			editable_specialization_lootdrop_drop_multiplier
		}
	}
	local editable_multi_choice_specialization_descs = {}
	local editable_specialization_descs = {
		{
			{
				"10%",
				"8%",
				"50%"
			},
			{
				"25%"
			},
			{
				"50%",
				"25%",
				"6%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"20%"
			},
			{
				"135%"
			},
			{
				"10%",
				"5%"
			},
			{
				"5%",
				"20%"
			},
			{
				"6%",
				"12%",
				"4",
				"8%",
				"10%"
			}
		},
		{
			{
				"10%"
			},
			{
				"25%"
			},
			{
				"15%",
				"10%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"20%"
			},
			{
				"135%"
			},
			{},
			{
				"5%",
				"20%"
			},
			{
				"60%",
				"3%",
				"5",
				"10%"
			}
		},
		{
			{
				"10%"
			},
			{
				"25%"
			},
			{
				"10%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%"
			},
			{
				"135%"
			},
			{
				"10%",
				"2",
				"15"
			},
			{
				"5%",
				"20%"
			},
			{
				"5%",
				"10%",
				"10%"
			}
		},
		{
			{
				"15%"
			},
			{
				"25%"
			},
			{
				"15%",
				"45%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"15%",
				"135%"
			},
			{
				"135%"
			},
			{
				"15%"
			},
			{
				"5%",
				"20%"
			},
			{
				"25%",
				"80%",
				"10%"
			}
		},
		{
			{
				"5%"
			},
			{
				"25%"
			},
			{
				"10%",
				"5%",
				"-24",
				"50%",
				"-16"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"5%"
			},
			{
				"135%"
			},
			{
				"10%",
				"5%"
			},
			{
				"5%",
				"20%"
			},
			{
				"10%",
				"5%",
				"-16",
				"125%",
				"10%",
				"1.5"
			}
		},
		{
			{
				"15%"
			},
			{
				"25%"
			},
			{
				"5%",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"20%"
			},
			{
				"135%"
			},
			{
				"10%",
				"25%"
			},
			{
				"5%",
				"20%"
			},
			{
				"10%",
				"10%"
			}
		},
		{
			{
				"20%"
			},
			{
				"25%"
			},
			{
				"10%",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"5%",
				"5%",
				"20%"
			},
			{
				"135%"
			},
			{
				"5%",
				"5%",
				"10%"
			},
			{
				"5%",
				"20%"
			},
			{
				"20%",
				"10%"
			}
		},
		{
			{
				"12%",
				"1",
				"10"
			},
			{
				"25%"
			},
			{
				"8%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"8%",
				"10%",
				"7",
				"4"
			},
			{
				"135%"
			},
			{
				"8%"
			},
			{
				"5%",
				"20%"
			},
			{
				"20%",
				"10",
				"10%"
			}
		},
		{
			{
				"12%",
				"1",
				"10"
			},
			{
				"25%"
			},
			{
				"30",
				"1",
				"10%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"1",
				"8%"
			},
			{
				"135%"
			},
			{
				"30",
				"1",
				"10%"
			},
			{
				"5%",
				"20%"
			},
			{
				"75%",
				"1",
				"10%"
			}
		},
		{
			{
				"16",
				"24",
				"3",
				"20%"
			},
			{
				"25%"
			},
			{
				"50%",
				"5",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"50%",
				"20%"
			},
			{
				"135%"
			},
			{
				"8"
			},
			{
				"5%",
				"20%"
			},
			{
				"8",
				"10%"
			}
		},
		{
			{
				"1",
				"0.3",
				"3",
				"1.5"
			},
			{
				"25%"
			},
			{
				"2",
				"0.3",
				"3",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"3",
				"0.3",
				"3",
				"10%"
			},
			{
				"135%"
			},
			{
				"4",
				"0.3",
				"3",
				"20%"
			},
			{
				"5%",
				"20%"
			},
			{
				"4",
				"0.3",
				"4.2",
				"20%",
				"10%"
			}
		},
		{
			{
				"25%",
				"20%"
			},
			{
				"25%"
			},
			{
				"25%",
				"20%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"25%",
				"20%"
			},
			{
				"135%"
			},
			{
				"25%",
				"20%"
			},
			{
				"5%",
				"20%"
			},
			{
				"50%",
				"25%",
				"10%"
			}
		},
		{
			{
				"4",
				"1"
			},
			{
				"25%"
			},
			{
				"4",
				"10%",
				"10%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"50%",
				"10%",
				"10%"
			},
			{
				"135%"
			},
			{
				"4",
				"20%",
				"10%"
			},
			{
				"5%",
				"20%"
			},
			{
				"20%",
				"10%"
			}
		},
		{
			{
				"100%",
				"240",
				"4",
				"600",
				"1",
				"30",
				"60% + 80",
				"8"
			},
			{
				"25%"
			},
			{},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"60% + 40",
				"8"
			},
			{
				"135%"
			},
			{
				"1",
				"25"
			},
			{
				"5%",
				"20%"
			},
			{
				"100%",
				"10%"
			}
		},
		{
			{
				"2",
				"15"
			},
			{
				"25%"
			},
			{
				"50%",
				"100%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"50%",
				"110%"
			},
			{
				"135%"
			},
			{
				"50%",
				"120%"
			},
			{
				"5%",
				"20%"
			},
			{
				"10",
				"1.5",
				"10%"
			}
		},
		{
			{
				"5",
				"5",
				"4",
				"4"
			},
			{
				"25%"
			},
			{
				"10%",
				"1"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%",
				"4",
				"0.1"
			},
			{
				"135%"
			},
			{
				"10%",
				"1"
			},
			{
				"5%",
				"20%"
			},
			{
				"10%",
				"4",
				"0.1",
				"10%"
			}
		},
		{
			{
				"75%",
				"6",
				"30"
			},
			{
				"25%"
			},
			{
				"10%"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"10%"
			},
			{
				"135%"
			},
			{
				"20%",
				"50%",
				"25%"
			},
			{
				"5%",
				"20%"
			},
			{
				"40%",
				"100%",
				"5",
				"1",
				"10%"
			}
		},
		{
			{
				"10",
				"50%",
				"60",
				"50%",
				"1"
			},
			{
				"25%"
			},
			{
				"20%",
				"4"
			},
			{
				"+1",
				"15%",
				"45%"
			},
			{
				"15%"
			},
			{
				"135%"
			},
			{},
			{
				"5%",
				"20%"
			},
			{
				"100%",
				"10%",
				"10%"
			}
		}
	}
	local delayed_percentage = self.values.player.damage_control_passive[1][1]
	local tick_percentage = self.values.player.damage_control_passive[1][2] * 0.01 * delayed_percentage
	local damage_duration = math.ceil(delayed_percentage / tick_percentage)
	local auto_shrug_time = self.values.player.damage_control_auto_shrug[1]
	local health_threshold = self.values.player.damage_control_cooldown_drain[2][1]
	local cooldown_drain_1 = self.values.player.damage_control_cooldown_drain[1][2]
	local cooldown_drain_2 = self.values.player.damage_control_cooldown_drain[2][2]
	local heal_percentage = self.values.player.damage_control_healing[1]

	table.insert(editable_specialization_descs, {
		{
			tostring(delayed_percentage) .. "%",
			damage_duration,
			"10"
		},
		{
			"25%"
		},
		{},
		{
			"+1",
			"15%",
			"45%"
		},
		{
			auto_shrug_time
		},
		{
			"135%"
		},
		{
			tostring(health_threshold) .. "%",
			cooldown_drain_2,
			cooldown_drain_1
		},
		{
			"5%",
			"20%"
		},
		{
			tostring(heal_percentage) .. "%",
			"10%"
		}
	})

	local distance = self.values.player.tag_team_base[1].distance
	local heal_amount = self.values.player.tag_team_base[1].kill_health_gain * 10
	local heal_amount_tagged = heal_amount * self.values.player.tag_team_base[1].tagged_health_gain_ratio
	local kill_extension = self.values.player.tag_team_base[1].kill_extension
	local duration = self.values.player.tag_team_base[1].duration
	local cooldown = 60
	local cooldown_drain_owner = self.values.player.tag_team_cooldown_drain[1].owner
	local cooldown_drain_tagged = self.values.player.tag_team_cooldown_drain[2].tagged
	local health_bonus_1 = (self.values.player.passive_health_multiplier[2] - 1) * 100
	local health_bonus_2 = (self.values.player.passive_health_multiplier[3] - 1) * 100 - health_bonus_1
	local kill_absorption = self.values.player.tag_team_damage_absorption[1].kill_gain * 10
	local kill_absorption_max = self.values.player.tag_team_damage_absorption[1].max * 10

	table.insert(editable_specialization_descs, {
		{
			distance,
			heal_amount,
			heal_amount_tagged,
			kill_extension,
			duration,
			cooldown
		},
		{
			"25%"
		},
		{
			health_bonus_1 .. "%"
		},
		{
			"+1",
			"15%",
			"45%"
		},
		{
			kill_absorption,
			kill_absorption_max
		},
		{
			"135%"
		},
		{
			health_bonus_2 .. "%"
		},
		{
			"5%",
			"20%"
		},
		{
			cooldown_drain_tagged,
			"10%"
		}
	})

	local duration = self.values.player.pocket_ecm_jammer_base[1].duration
	local charges = 2
	local cooldown = 100
	local cooldown_drain = self.values.player.pocket_ecm_jammer_base[1].cooldown_drain
	local health_bonus = (self.values.player.passive_health_multiplier[2] - 1) * 100
	local kill_health_gain = self.values.player.pocket_ecm_heal_on_kill[1] * 10
	local kill_health_gain_team = self.values.team.pocket_ecm_heal_on_kill[1] * 10
	local kill_dodge_bonus_count = 1
	local kill_dodge_bonus = 20
	local kill_dodge_bonus_duration = 30

	table.insert(editable_specialization_descs, {
		{
			duration,
			charges,
			cooldown,
			cooldown_drain
		},
		{
			"25%"
		},
		{
			health_bonus .. "%"
		},
		{
			"+1",
			"15%",
			"45%"
		},
		{
			kill_health_gain,
			"15%"
		},
		{
			"135%"
		},
		{
			kill_dodge_bonus_count,
			kill_dodge_bonus,
			kill_dodge_bonus_duration
		},
		{
			"5%",
			"20%"
		},
		{
			kill_health_gain_team,
			"15%",
			"10%"
		}
	})

	local activation_health_restore = self.values.player.copr_activate_bonus_health_ratio[1] * 100
	local ability_cooldown = self.copr_ability_cooldown
	local duration_1 = self.values.temporary.copr_ability[1][2]
	local duration_2 = self.values.temporary.copr_ability[2][2]
	local out_of_health_movement_slow = (1 - self.values.player.copr_out_of_health_move_slow[1]) * 100
	local speed_up_on_kill = self.values.player.copr_speed_up_on_kill[1]
	local teammate_heal_1 = self.values.player.copr_teammate_heal[1] * 100
	local teammate_heal_2 = self.values.player.copr_teammate_heal[2] * 100
	local static_damage_1 = self.values.player.copr_static_damage_ratio[1] * 100
	local static_damage_2 = self.values.player.copr_static_damage_ratio[2] * 100
	local health_bonus_1 = (self.values.player.passive_health_multiplier[2] - 1) * 100
	local health_bonus_2 = (self.values.player.passive_health_multiplier[3] - 1) * 100 - health_bonus_1
	local health_bonus_3 = (self.values.player.passive_health_multiplier[4] - 1) * 100 - health_bonus_2
	local kill_life_leech_1 = self.values.player.copr_kill_life_leech[1]
	local copr_specialization = deep_clone(editable_specialization_template)

	copr_specialization[1] = {
		tostring(activation_health_restore) .. "%",
		tostring(static_damage_1) .. "%",
		tostring(kill_life_leech_1),
		tostring(teammate_heal_1) .. "%",
		tostring(duration_1),
		tostring(ability_cooldown)
	}
	copr_specialization[3] = {
		tostring(health_bonus_1) .. "%",
		tostring(out_of_health_movement_slow) .. "%"
	}
	copr_specialization[5] = {
		tostring(duration_2),
		tostring(speed_up_on_kill),
		tostring(teammate_heal_2) .. "%"
	}
	copr_specialization[7] = {
		tostring(health_bonus_2) .. "%"
	}
	copr_specialization[9] = {
		tostring(static_damage_2) .. "%",
		tostring(health_bonus_3) .. "%"
	}

	table.insert(copr_specialization[9], editable_specialization_lootdrop_drop_multiplier)
	table.insert(editable_specialization_descs, copr_specialization)

	do
		local health_boost = (self.values.player.mrwi_health_multiplier[1] - 1) * 100
		local armor_boost = (self.values.player.mrwi_armor_multiplier[1] - 1) * 100
		local dodge_boost = self.values.player.mrwi_dodge_chance[1] * 100
		local crouch_and_carry_boost = (self.values.player.mrwi_crouch_speed_multiplier[1] - 1) * 100
		local mrwi_boost = {
			{
				tostring(health_boost) .. "%"
			},
			{
				tostring(armor_boost) .. "%"
			},
			{
				tostring(dodge_boost) .. "%"
			},
			{
				tostring(crouch_and_carry_boost) .. "%"
			}
		}
		local primary_reload_secondary_kills = self.values.player.primary_reload_secondary[1]
		local headshot_regen_health_bonus = self.values.player.headshot_regen_health_bonus[1] * 10
		local on_headshot_dealt_cooldown = self.on_headshot_dealt_cooldown
		local weapon_swap_speed = (self.values.weapon.mrwi_swap_speed_multiplier[1] - 1) * 200
		local weapon_swap_speed_duration = self.values.weapon.primary_reload_swap_secondary[1]
		local mrwi_health_invulnerable = self.values.temporary.mrwi_health_invulnerable[1]
		local invulnerable_threshold = mrwi_health_invulnerable[1] * 100
		local invulnerable_duration = mrwi_health_invulnerable[2]
		local invulnerable_cooldown = mrwi_health_invulnerable[3]
		local multi_choice_specialization_desc = {}

		multi_choice_specialization_desc[1] = mrwi_boost
		multi_choice_specialization_desc[3] = mrwi_boost
		multi_choice_specialization_desc[5] = mrwi_boost
		multi_choice_specialization_desc[7] = mrwi_boost
		multi_choice_specialization_desc[9] = {}

		local deck9_options = UpgradesTweakData.mrwi_deck9_options()

		for _, options in pairs(deck9_options) do
			local data

			if options.tree and options.tier then
				data = clone(editable_specialization_descs[options.tree][options.tier])
			else
				data = {}
			end

			for i, text in pairs(options.custom_editable_descs or {}) do
				data[i] = text
			end

			table.insert(multi_choice_specialization_desc[9], data)
		end

		local specialization_descs = deep_clone(editable_specialization_template)

		specialization_descs[1] = {
			tostring(primary_reload_secondary_kills),
			tostring(weapon_swap_speed_duration)
		}
		specialization_descs[3] = {
			tostring(headshot_regen_health_bonus),
			tostring(on_headshot_dealt_cooldown)
		}
		specialization_descs[5] = {}
		specialization_descs[7] = {
			tostring(invulnerable_threshold) .. "%",
			tostring(invulnerable_duration),
			tostring(invulnerable_cooldown)
		}

		table.insert(specialization_descs[9], editable_specialization_lootdrop_drop_multiplier)
		table.insert(editable_specialization_descs, specialization_descs)

		editable_multi_choice_specialization_descs[#editable_specialization_descs] = multi_choice_specialization_desc
	end

	self.specialization_descs = {}

	for tree, data in pairs(editable_specialization_descs) do
		self.specialization_descs[tree] = {}

		for tier, tier_data in ipairs(data) do
			self.specialization_descs[tree][tier] = {}

			for i, desc in ipairs(tier_data) do
				self.specialization_descs[tree][tier]["multiperk" .. (i == 1 and "" or tostring(i))] = desc
			end
		end
	end

	self.multi_choice_specialization_descs = {}

	for tree, data in pairs(editable_multi_choice_specialization_descs) do
		self.multi_choice_specialization_descs[tree] = {}

		for tier, tier_data in pairs(data) do
			self.multi_choice_specialization_descs[tree][tier] = {}

			for choice_index, choice_data in pairs(tier_data) do
				self.multi_choice_specialization_descs[tree][tier][choice_index] = {}

				for i, desc in pairs(choice_data) do
					self.multi_choice_specialization_descs[tree][tier][choice_index]["multiperk" .. (i == 1 and "" or tostring(i))] = desc
				end
			end
		end
	end
end

function UpgradesTweakData:init(tweak_data)
	self.level_tree = {}
	self.level_tree[0] = {
		upgrades = {
			"frag",
			"dynamite",
			"molotov",
			"wpn_dallas_mask",
			"msr",
			"corgi",
			"clean",
			"aziz"
		}
	}
	self.level_tree[1] = {
		name_id = "body_armor",
		upgrades = {
			"body_armor2",
			"ak74",
			"frag_com",
			"nin",
			"concussion",
			"fir_com",
			"dada_com"
		}
	}
	self.level_tree[2] = {
		name_id = "weapons",
		upgrades = {
			"colt_1911",
			"mac10",
			"hajk",
			"spoon",
			"x_hajk",
			"x_mac10"
		}
	}
	self.level_tree[3] = {
		name_id = "weapons",
		upgrades = {
			"spatula",
			"fork",
			"boot"
		}
	}
	self.level_tree[4] = {
		name_id = "weapons",
		upgrades = {
			"new_m4",
			"shovel"
		}
	}
	self.level_tree[6] = {
		name_id = "weapons",
		upgrades = {
			"new_raging_bull",
			"b92fs",
			"x_rage",
			"m1911",
			"vityaz"
		}
	}
	self.level_tree[7] = {
		name_id = "body_armor",
		upgrades = {
			"body_armor1",
			"moneybundle"
		}
	}
	self.level_tree[8] = {
		name_id = "weapons",
		upgrades = {
			"r870",
			"aug",
			"fight"
		}
	}
	self.level_tree[10] = {
		name_id = "lvl_10",
		upgrades = {
			"rep_upgrade1",
			"cutters",
			"shawn"
		}
	}
	self.level_tree[12] = {
		name_id = "body_armor3",
		upgrades = {
			"body_armor3",
			"cobray",
			"boxcutter",
			"x_cobray",
			"m590",
			"maxim9",
			"groza"
		}
	}
	self.level_tree[13] = {
		name_id = "weapons",
		upgrades = {
			"new_mp5",
			"serbu",
			"microphone",
			"selfie",
			"sko12"
		}
	}
	self.level_tree[14] = {
		name_id = "weapons",
		upgrades = {
			"bayonet",
			"m1928",
			"sparrow",
			"gator",
			"pl14",
			"x_m1928",
			"x_sparrow",
			"x_pl14"
		}
	}
	self.level_tree[15] = {
		name_id = "weapons",
		upgrades = {
			"benelli",
			"plainsrider",
			"sub2000",
			"road",
			"legacy",
			"x_legacy",
			"fmg9",
			"flun"
		}
	}
	self.level_tree[16] = {
		name_id = "weapons",
		upgrades = {
			"akm",
			"g36",
			"hunter",
			"iceaxe",
			"zeus",
			"flint",
			"oxide",
			"sword"
		}
	}
	self.level_tree[17] = {
		name_id = "weapons",
		upgrades = {
			"akm_gold",
			"baton",
			"slot_lever",
			"frankish",
			"ecp",
			"chac",
			"pm9",
			"x_pm9"
		}
	}
	self.level_tree[18] = {
		name_id = "weapons",
		upgrades = {
			"baseballbat",
			"scorpion",
			"oldbaton",
			"hockey",
			"meter",
			"hauteur",
			"shock",
			"fear",
			"x_scorpion"
		}
	}
	self.level_tree[19] = {
		name_id = "weapons",
		upgrades = {
			"olympic",
			"mp9",
			"baka",
			"pugio",
			"ballistic",
			"x_baka",
			"x_olympic",
			"x_mp9",
			"maxim9",
			"scout",
			"korth"
		}
	}
	self.level_tree[20] = {
		name_id = "lvl_20",
		upgrades = {
			"rep_upgrade2",
			"schakal",
			"agave",
			"happy",
			"shepheard",
			"x_shepheard",
			"slap",
			"x_schakal"
		}
	}
	self.level_tree[21] = {
		name_id = "body_armor4",
		upgrades = {
			"body_armor4",
			"kampfmesser",
			"buck",
			"tecci",
			"wing"
		}
	}
	self.level_tree[22] = {
		name_id = "community_item",
		upgrades = {
			"g22c",
			"ksg",
			"branding_iron",
			"detector",
			"croupier_rake"
		}
	}
	self.level_tree[23] = {
		name_id = "weapons",
		upgrades = {
			"bullseye",
			"c96",
			"par",
			"m37",
			"rota",
			"x_rota",
			"x_c96",
			"cs",
			"brick",
			"ostry",
			"r700",
			"laser_watch"
		}
	}
	self.level_tree[24] = {
		name_id = "weapons",
		upgrades = {
			"model24",
			"l85a2",
			"scalper",
			"switchblade",
			"x_m1911",
			"x_vityaz",
			"x_maxim9",
			"type54",
			"x_type54",
			"x_sko12"
		}
	}
	self.level_tree[25] = {
		name_id = "weapons",
		upgrades = {
			"boxing_gloves",
			"meat_cleaver",
			"wpn_prj_four",
			"sr2",
			"grip",
			"push",
			"breech",
			"ching",
			"erma",
			"x_breech",
			"x_erma",
			"sap",
			"funder_strike",
			"bonk",
			"bonk2"
		}
	}
	self.level_tree[26] = {
		name_id = "weapons",
		upgrades = {
			"new_m14",
			"saiga",
			"sandsteel",
			"packrat",
			"lemming",
			"rsh12",
			"chinchilla",
			"x_chinchilla",
			"model3",
			"sbl",
			"m1897",
			"x_model3"
		}
	}
	self.level_tree[27] = {
		name_id = "weapons",
		upgrades = {
			"famas",
			"g26",
			"twins",
			"pitchfork",
			"shrew",
			"x_shrew",
			"basset",
			"x_basset"
		}
	}
	self.level_tree[28] = {
		name_id = "weapons",
		upgrades = {
			"hs2000",
			"vhs",
			"bowie",
			"micstand",
			"x_hs2000",
			"qbu88",
			"contender",
			"awp"
		}
	}
	self.level_tree[29] = {
		name_id = "weapons",
		upgrades = {
			"akmsu",
			"glock_18c",
			"asval",
			"long",
			"x_g18c",
			"x_beer",
			"beer",
			"x_czech",
			"czech",
			"x_stech",
			"stech",
			"supernova"
		}
	}
	self.level_tree[30] = {
		name_id = "lvl_30",
		upgrades = {
			"rep_upgrade3",
			"shuno",
			"holt",
			"x_holt",
			"x_korth",
			"welrod",
			"pmm",
			"x_pmm",
			"speen",
			"dart"
		}
	}
	self.level_tree[31] = {
		name_id = "body_armor5",
		upgrades = {
			"body_armor5",
			"chef",
			"peacemaker",
			"wpn_prj_ace"
		}
	}
	self.level_tree[32] = {
		name_id = "weapons",
		upgrades = {
			"x46",
			"tec9",
			"tiger",
			"model70",
			"x_tec9"
		}
	}
	self.level_tree[33] = {
		name_id = "weapons",
		upgrades = {
			"ak5",
			"striker",
			"wa2000",
			"beardy",
			"catch",
			"elastic",
			"m60"
		}
	}
	self.level_tree[34] = {
		name_id = "weapons",
		upgrades = {
			"galil",
			"cleaver",
			"mateba",
			"taser",
			"desertfox",
			"wpn_prj_target",
			"tti",
			"victor",
			"ultima",
			"x_2006m"
		}
	}
	self.level_tree[35] = {
		name_id = "weapons",
		upgrades = {
			"r93",
			"judge",
			"mining_pick",
			"wing",
			"x_judge"
		}
	}
	self.level_tree[36] = {
		name_id = "weapons",
		upgrades = {
			"p90",
			"deagle",
			"winchester1874",
			"x_p90"
		}
	}
	self.level_tree[37] = {
		name_id = "weapons",
		upgrades = {
			"shillelagh",
			"hammer",
			"stick"
		}
	}
	self.level_tree[38] = {
		name_id = "weapons",
		upgrades = {
			"m134",
			"rpg7",
			"arblast",
			"scoutknife",
			"komodo",
			"hk51b"
		}
	}
	self.level_tree[39] = {
		name_id = "weapons",
		upgrades = {
			"m16",
			"huntsman",
			"polymer",
			"china",
			"x_polymer"
		}
	}
	self.level_tree[40] = {
		name_id = "lvl_40",
		upgrades = {
			"rep_upgrade4",
			"shak12"
		}
	}
	self.level_tree[41] = {
		name_id = "weapons",
		upgrades = {
			"gerber",
			"fairbair",
			"wpn_prj_jav",
			"wpn_prj_hur",
			"contraband",
			"ray"
		}
	}
	self.level_tree[42] = {
		name_id = "weapons",
		upgrades = {
			"fal",
			"tomahawk",
			"coal",
			"x_coal",
			"kacchainsaw"
		}
	}
	self.level_tree[43] = {
		name_id = "weapons",
		upgrades = {
			"b682",
			"m32",
			"morning",
			"coach"
		}
	}
	self.level_tree[44] = {
		name_id = "weapons",
		upgrades = {
			"flamethrower_mk2",
			"poker"
		}
	}
	self.level_tree[45] = {
		name_id = "weapons",
		upgrades = {
			"m249",
			"barbedwire"
		}
	}
	self.level_tree[46] = {
		name_id = "weapons",
		upgrades = {
			"gre_m79",
			"great",
			"siltstone"
		}
	}
	self.level_tree[47] = {
		name_id = "weapons",
		upgrades = {
			"freedom",
			"whiskey",
			"arbiter",
			"ms3gl",
			"system"
		}
	}
	self.level_tree[48] = {
		name_id = "weapons",
		upgrades = {
			"dingdong",
			"tenderizer",
			"hailstorm",
			"hcar"
		}
	}
	self.level_tree[50] = {
		name_id = "lvl_50",
		upgrades = {
			"rep_upgrade5",
			"tkb"
		}
	}
	self.level_tree[51] = {
		name_id = "weapons",
		upgrades = {
			"machete",
			"sterling",
			"x_sterling"
		}
	}
	self.level_tree[52] = {
		name_id = "weapons",
		upgrades = {
			"g3",
			"aa12"
		}
	}
	self.level_tree[54] = {
		name_id = "weapons",
		upgrades = {
			"becker",
			"mosin",
			"cqc"
		}
	}
	self.level_tree[55] = {
		name_id = "weapons",
		upgrades = {
			"uzi",
			"x_uzi"
		}
	}
	self.level_tree[60] = {
		name_id = "lvl_60",
		upgrades = {
			"rep_upgrade6"
		}
	}
	self.level_tree[61] = {
		name_id = "weapons",
		upgrades = {
			"rambo"
		}
	}
	self.level_tree[65] = {
		name_id = "weapons",
		upgrades = {
			"m95"
		}
	}
	self.level_tree[70] = {
		name_id = "lvl_70",
		upgrades = {
			"rep_upgrade7"
		}
	}
	self.level_tree[71] = {
		name_id = "weapons",
		upgrades = {
			"fireaxe",
			"mg42"
		}
	}
	self.level_tree[75] = {
		name_id = "weapons",
		upgrades = {
			"hk21"
		}
	}
	self.level_tree[80] = {
		name_id = "lvl_80",
		upgrades = {
			"rep_upgrade8"
		}
	}
	self.level_tree[90] = {
		name_id = "lvl_90",
		upgrades = {
			"rep_upgrade9"
		}
	}
	self.level_tree[100] = {
		name_id = "lvl_100",
		upgrades = {
			"rep_upgrade10"
		}
	}

	self:_init_pd2_values()
	self:_init_values()

	self.steps = {}
	self.values.player = self.values.player or {}
	self.values.player.thick_skin = {
		2,
		4,
		6,
		8,
		10
	}
	self.values.player.primary_weapon_when_carrying = {
		true
	}
	self.values.player.health_multiplier = {
		1.1
	}
	self.values.player.dye_pack_chance_multiplier = {
		0.5
	}
	self.values.player.dye_pack_cash_loss_multiplier = {
		0.4
	}
	self.values.player.toolset = {
		0.95,
		0.9,
		0.85,
		0.8
	}
	self.values.player.uncover_progress_mul = {
		0.5
	}
	self.values.player.uncover_progress_decay_mul = {
		1.5
	}
	self.values.player.suppressed_multiplier = {
		0.5
	}
	self.values.player.intimidate_specials = {
		true
	}
	self.values.player.intimidation_multiplier = {
		1.5
	}
	self.steps.player = {}
	self.steps.player.thick_skin = {
		nil,
		8,
		18,
		27,
		39
	}
	self.steps.player.extra_ammo_multiplier = {
		nil,
		7,
		16,
		24,
		38
	}
	self.steps.player.toolset = {
		nil,
		7,
		16,
		38
	}
	self.values.trip_mine = self.values.trip_mine or {}
	self.values.trip_mine.quantity = {
		4,
		11
	}
	self.values.trip_mine.damage_multiplier = {
		1.5
	}
	self.values.shape_charge = self.values.shape_charge or {}
	self.values.shape_charge.quantity = {
		1,
		3
	}
	self.values.trip_mine.quantity_increase = {
		2
	}
	self.values.trip_mine.explode_timer_delay = {
		2
	}
	self.steps.trip_mine = {}
	self.steps.trip_mine.quantity = {
		14,
		22,
		29,
		36,
		42,
		47
	}
	self.steps.trip_mine.damage_multiplier = {
		6,
		32
	}
	self.values.ammo_bag = self.values.ammo_bag or {}
	self.steps.ammo_bag = {}
	self.steps.ammo_bag.ammo_increase = {
		10,
		19,
		30
	}
	self.values.ecm_jammer = self.values.ecm_jammer or {}
	self.values.first_aid_kit = self.values.first_aid_kit or {}
	self.values.sentry_gun = self.values.sentry_gun or {}
	self.steps.sentry_gun = {}
	self.values.doctor_bag = self.values.doctor_bag or {}
	self.steps.doctor_bag = {}
	self.steps.doctor_bag.amount_increase = {
		11,
		19,
		33
	}
	self.values.extra_cable_tie = {}
	self.values.extra_cable_tie.quantity = {
		1,
		2,
		3,
		4
	}
	self.steps.extra_cable_tie = {}
	self.steps.extra_cable_tie.quantity = {
		nil,
		12,
		23,
		33
	}
	self.values.striker = {}
	self.values.striker.reload_speed_multiplier = {
		1.15
	}
	self.definitions = {}

	self:_player_definitions()
	self:_trip_mine_definitions()
	self:_ecm_jammer_definitions()
	self:_ammo_bag_definitions()
	self:_doctor_bag_definitions()
	self:_cable_tie_definitions()
	self:_sentry_gun_definitions()
	self:_armor_kit_definitions()
	self:_first_aid_kit_definitions()
	self:_bodybags_bag_definitions()
	self:_grenade_crate_definitions()
	self:_spy_camera_definitions()
	self:_rep_definitions()
	self:_jowi_definitions()
	self:_x_1911_definitions()
	self:_x_b92fs_definitions()
	self:_x_deagle_definitions()
	self:_g26_definitions()
	self:_akimbo_definitions()
	self:_kabartanto_definitions()
	self:_toothbrush_definitions()
	self:_chef_definitions()
	self:_mrwi_definitions()
	self:_olympic_definitions()
	self:_amcar_definitions()
	self:_m16_definitions()
	self:_new_m4_definitions()
	self:_glock_18c_definitions()
	self:_saiga_definitions()
	self:_akmsu_definitions()
	self:_ak74_definitions()
	self:_akm_definitions()
	self:_akm_gold_definitions()
	self:_ak5_definitions()
	self:_aug_definitions()
	self:_g36_definitions()
	self:_p90_definitions()
	self:_new_m14_definitions()
	self:_mp9_definitions()
	self:_deagle_definitions()
	self:_new_mp5_definitions()
	self:_colt_1911_definitions()
	self:_mac10_definitions()
	self:_glock_17_definitions()
	self:_b92fs_definitions()
	self:_huntsman_definitions()
	self:_r870_definitions()
	self:_serbu_definitions()
	self:_new_raging_bull_definitions()
	self:_korth_weapon_definitions()
	self:_sko12_weapon_definitions()
	self:_x_korth_weapon_definitions()
	self:_saw_definitions()
	self:_usp_definitions()
	self:_g22c_definitions()
	self:_judge_definitions()
	self:_m45_definitions()
	self:_s552_definitions()
	self:_ppk_definitions()
	self:_mp7_definitions()
	self:_scar_definitions()
	self:_p226_definitions()
	self:_hk21_definitions()
	self:_hk51b_definitions()
	self:_tkb_definitions()
	self:_contender_definitions()
	self:_hcar_definitions()
	self:_m249_definitions()
	self:_rpk_definitions()
	self:_awp_definitions()
	self:_supernova_definitions()
	self:_kacchainsaw_weapon_definitions()
	self:_m95_definitions()
	self:_msr_definitions()
	self:_r93_definitions()
	self:_fal_definitions()
	self:_benelli_definitions()
	self:_striker_definitions()
	self:_ksg_definitions()
	self:_scorpion_definitions()
	self:_tec9_definitions()
	self:_uzi_definitions()
	self:_gre_m79_definitions()
	self:_g3_definitions()
	self:_galil_definitions()
	self:_famas_definitions()
	self:_spas12_definitions()
	self:_mg42_definitions()
	self:_c96_definitions()
	self:_sterling_definitions()
	self:_mosin_definitions()
	self:_bessy_definitions()
	self:_m1928_definitions()
	self:_l85a2_definitions()
	self:_vhs_definitions()
	self:_hs2000_definitions()
	self:_m134_weapon_definitions()
	self:_rpg7_weapon_definitions()
	self:_cobray_definitions()
	self:_b682_weapon_definitions()
	self:_x_g22c_definitions()
	self:_x_g17_definitions()
	self:_x_usp_definitions()
	self:_weapon_definitions()
	self:_pistol_definitions()
	self:_assault_rifle_definitions()
	self:_smg_definitions()
	self:_shotgun_definitions()
	self:_lmg_definitions()
	self:_snp_definitions()
	self:_flamethrower_mk2_definitions()
	self:_m32_definitions()
	self:_aa12_definitions()
	self:_bbq_weapon_definitions()
	self:_peacemaker_definitions()
	self:_winchester1874_definitions()
	self:_plainsrider_definitions()
	self:_mateba_definitions()
	self:_asval_definitions()
	self:_sub2000_definitions()
	self:_wa2000_definitions()
	self:_polymer_definitions()
	self:_hunter_definitions()
	self:_baka_definitions()
	self:_arblast_weapon_definitions()
	self:_frankish_weapon_definitions()
	self:_long_weapon_definitions()
	self:_par_weapon_definitions()
	self:_sparrow_weapon_definitions()
	self:_model70_weapon_definitions()
	self:_scout_weapon_definitions()
	self:_m37_weapon_definitions()
	self:_china_weapon_definitions()
	self:_sr2_weapon_definitions()
	self:_x_sr2_weapon_definitions()
	self:_pl14_weapon_definitions()
	self:_x_mp5_weapon_definitions()
	self:_x_akmsu_weapon_definitions()
	self:_tecci_weapon_definitions()
	self:_hajk_weapon_definitions()
	self:_boot_weapon_definitions()
	self:_packrat_weapon_definitions()
	self:_schakal_weapon_definitions()
	self:_desertfox_weapon_definitions()
	self:_x_packrat_weapon_definitions()
	self:_rota_weapon_definitions()
	self:_arbiter_weapon_definitions()
	self:_ms3gl_weapon_definitions()
	self:_contraband_weapon_definitions()
	self:_ray_weapon_definitions()
	self:_tti_weapon_definitions()
	self:_victor_weapon_definitions()
	self:_siltstone_weapon_definitions()
	self:_flint_weapon_definitions()
	self:_coal_weapon_definitions()
	self:_lemming_weapon_definitions()
	self:_rsh12_weapon_definitions()
	self:_type54_weapon_definitions()
	self:_x_type54_weapon_definitions()
	self:_chinchilla_weapon_definitions()
	self:_x_chinchilla_weapon_definitions()
	self:_sbl_weapon_definitions()
	self:_m1897_weapon_definitions()
	self:_model3_weapon_definitions()
	self:_x_model3_weapon_definitions()
	self:_shepheard_weapon_definitions()
	self:_x_shepheard_weapon_definitions()
	self:_m590_weapon_definitions()
	self:_vityaz_weapon_definitions()
	self:_x_vityaz_weapon_definitions()
	self:_m1911_weapon_definitions()
	self:_x_m1911_weapon_definitions()
	self:_ultima_weapon_definitions()
	self:_fmg9_weapon_definitions()
	self:_maxim9_weapon_definitions()
	self:_x_maxim9_weapon_definitions()
	self:_groza_weapon_definitions()
	self:_pm9_weapon_definitions()
	self:_x_pm9_weapon_definitions()
	self:_qbu88_weapon_definitions()
	self:_hailstorm_weapon_definitions()
	self:_x_sko12_weapon_definitions()
	self:_shak12_weapon_definitions()
	self:_breech_weapon_definitions()
	self:_ching_weapon_definitions()
	self:_erma_weapon_definitions()
	self:_ecp_weapon_definitions()
	self:_shrew_weapon_definitions()
	self:_x_shrew_weapon_definitions()
	self:_basset_weapon_definitions()
	self:_x_basset_weapon_definitions()
	self:_corgi_weapon_definitions()
	self:_slap_weapon_definitions()
	self:_x_coal_weapon_definitions()
	self:_x_baka_weapon_definitions()
	self:_x_cobray_weapon_definitions()
	self:_x_erma_weapon_definitions()
	self:_x_hajk_weapon_definitions()
	self:_x_m45_weapon_definitions()
	self:_x_m1928_weapon_definitions()
	self:_x_mac10_weapon_definitions()
	self:_x_mp7_weapon_definitions()
	self:_x_mp9_weapon_definitions()
	self:_x_olympic_weapon_definitions()
	self:_x_p90_weapon_definitions()
	self:_x_polymer_weapon_definitions()
	self:_x_schakal_weapon_definitions()
	self:_x_scorpion_weapon_definitions()
	self:_x_sterling_weapon_definitions()
	self:_x_tec9_weapon_definitions()
	self:_x_uzi_weapon_definitions()
	self:_x_2006m_weapon_definitions()
	self:_x_breech_weapon_definitions()
	self:_x_c96_weapon_definitions()
	self:_x_g18c_weapon_definitions()
	self:_x_hs2000_weapon_definitions()
	self:_x_p226_weapon_definitions()
	self:_x_pl14_weapon_definitions()
	self:_x_ppk_weapon_definitions()
	self:_x_rage_weapon_definitions()
	self:_x_sparrow_weapon_definitions()
	self:_x_judge_weapon_definitions()
	self:_x_rota_weapon_definitions()
	self:_shuno_weapon_definitions()
	self:_system_weapon_definitions()
	self:_money_weapon_definitions()
	self:_komodo_weapon_definitions()
	self:_elastic_weapon_definitions()
	self:_legacy_weapon_definitions()
	self:_x_legacy_weapon_definitions()
	self:_coach_weapon_definitions()
	self:_beer_weapon_definitions()
	self:_x_beer_weapon_definitions()
	self:_czech_weapon_definitions()
	self:_x_czech_weapon_definitions()
	self:_stech_weapon_definitions()
	self:_x_stech_weapon_definitions()
	self:_holt_weapon_definitions()
	self:_x_holt_weapon_definitions()
	self:_m60_weapon_definitions()
	self:_r700_weapon_definitions()
	self:_welrod_weapon_definitions()
	self:_pmm_weapon_definitions()
	self:_speen_weapon_definitions()
	self:_dart_weapon_definitions()
	self:_flun_weapon_definitions()
	self:_melee_weapon_definitions()
	self:_grenades_definitions()
	self:_carry_definitions()
	self:_team_definitions()
	self:_temporary_definitions()
	self:_cooldown_definitions()
	self:_shape_charge_definitions()

	self.definitions.lucky_charm = {
		category = "what_is_this",
		name_id = "menu_lucky_charm"
	}
	self.levels = {}

	for name, upgrade in pairs(self.definitions) do
		local unlock_lvl = upgrade.unlock_lvl or 1

		self.levels[unlock_lvl] = self.levels[unlock_lvl] or {}

		if upgrade.prio and upgrade.prio == "high" then
			table.insert(self.levels[unlock_lvl], 1, name)
		else
			table.insert(self.levels[unlock_lvl], name)
		end
	end

	self.progress = {
		{},
		{},
		{},
		{}
	}

	for name, upgrade in pairs(self.definitions) do
		if upgrade.tree then
			if upgrade.step then
				if self.progress[upgrade.tree][upgrade.step] then
					Application:error("upgrade collision", upgrade.tree, upgrade.step, self.progress[upgrade.tree][upgrade.step], name)
				end

				self.progress[upgrade.tree][upgrade.step] = name
			else
				print(name, upgrade.tree, "is in no step")
			end
		end
	end

	self.progress[1][49] = "mr_nice_guy"
	self.progress[2][49] = "mr_nice_guy"
	self.progress[3][49] = "mr_nice_guy"
	self.progress[4][49] = "mr_nice_guy"

	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.definitions) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end
end

function UpgradesTweakData:_init_value_tables()
	self.values = {}
	self.values.player = {}
	self.values.carry = {}
	self.values.trip_mine = {}
	self.values.ammo_bag = {}
	self.values.ecm_jammer = {}
	self.values.sentry_gun = {}
	self.values.doctor_bag = {}
	self.values.cable_tie = {}
	self.values.bodybags_bag = {}
	self.values.first_aid_kit = {}
	self.values.grenade_crate = {}
	self.values.weapon = {}
	self.values.pistol = {}
	self.values.assault_rifle = {}
	self.values.smg = {}
	self.values.shotgun = {}
	self.values.saw = {}
	self.values.lmg = {}
	self.values.snp = {}
	self.values.akimbo = {}
	self.values.minigun = {}
	self.values.melee = {}
	self.values.temporary = {}
	self.values.cooldown = {}
	self.values.team = {}
	self.values.team.player = {}
	self.values.team.weapon = {}
	self.values.team.pistol = {}
	self.values.team.akimbo = {}
	self.values.team.xp = {}
	self.values.team.armor = {}
	self.values.team.stamina = {}
	self.values.team.health = {}
	self.values.team.cash = {}
	self.values.team.damage_dampener = {}
end

function UpgradesTweakData:_init_values()
	self.values.weapon = self.values.weapon or {}
	self.values.weapon.reload_speed_multiplier = {
		1
	}
	self.values.weapon.damage_multiplier = {
		1
	}
	self.values.weapon.swap_speed_multiplier = {
		1.8
	}
	self.values.weapon.passive_reload_speed_multiplier = {
		1.1
	}
	self.values.weapon.auto_spread_multiplier = {
		1
	}
	self.values.weapon.spread_multiplier = {
		0.9
	}
	self.values.weapon.fire_rate_multiplier = {
		2
	}
	self.values.pistol = self.values.pistol or {}
	self.values.pistol.exit_run_speed_multiplier = {
		1.25
	}
	self.values.assault_rifle = self.values.assault_rifle or {}
	self.values.smg = self.values.smg or {}
	self.values.shotgun = self.values.shotgun or {}
	self.values.carry = self.values.carry or {}
	self.values.carry.catch_interaction_speed = {
		0.6,
		0.1
	}
	self.values.carry.carry_bag_count = {
		2
	}
	self.values.cable_tie = self.values.cable_tie or {}
	self.values.cable_tie.quantity_unlimited = {
		true
	}
	self.values.temporary = self.values.temporary or {}
	self.values.temporary.combat_medic_enter_steelsight_speed_multiplier = {
		{
			1.2,
			15
		}
	}
	self.values.temporary.pistol_revive_from_bleed_out = {
		{
			true,
			1
		}
	}
	self.values.temporary.revive_health_boost = {
		{
			true,
			10
		}
	}
	self.values.cooldown = self.values.cooldown or {}
	self.values.team = self.values.team or {}
	self.values.team.player = self.values.team.player or {}
	self.values.team.pistol = self.values.team.pistol or {}
	self.values.team.weapon = self.values.team.weapon or {}
	self.values.team.xp = self.values.team.xp or {}
	self.values.team.armor = self.values.team.armor or {}
	self.values.team.stamina = self.values.team.stamina or {}
	self.values.saw = self.values.saw or {}
	self.values.saw.recoil_multiplier = {
		0.75
	}
	self.values.saw.fire_rate_multiplier = {
		1.25,
		1.5
	}
end

function UpgradesTweakData:_player_definitions()
	self.definitions.body_armor1 = {
		armor_id = "level_2",
		category = "armor",
		name_id = "bm_armor_level_2"
	}
	self.definitions.body_armor2 = {
		armor_id = "level_3",
		category = "armor",
		name_id = "bm_armor_level_3"
	}
	self.definitions.body_armor3 = {
		armor_id = "level_4",
		category = "armor",
		name_id = "bm_armor_level_4"
	}
	self.definitions.body_armor4 = {
		armor_id = "level_5",
		category = "armor",
		name_id = "bm_armor_level_5"
	}
	self.definitions.body_armor5 = {
		armor_id = "level_6",
		category = "armor",
		name_id = "bm_armor_level_6"
	}
	self.definitions.body_armor6 = {
		armor_id = "level_7",
		category = "armor",
		name_id = "bm_armor_level_7"
	}
	self.definitions.thick_skin = {
		category = "equipment",
		description_text_id = "thick_skin",
		equipment_id = "thick_skin",
		icon = "equipment_armor",
		image = "upgrades_thugskin",
		image_slice = "upgrades_thugskin_slice",
		name_id = "debug_upgrade_thick_skin1",
		slot = 2,
		step = 2,
		subtitle_id = "debug_upgrade_thick_skin1",
		title_id = "debug_upgrade_player_upgrade",
		tree = 2,
		unlock_lvl = 0,
		aquire = {
			upgrade = "thick_skin1"
		}
	}

	for i, _ in ipairs(self.values.player.thick_skin) do
		local depends_on = i - 1 > 0 and "thick_skin" .. i - 1
		local unlock_lvl = 3
		local prio = i == 1 and "high"

		self.definitions["thick_skin" .. i] = {
			category = "feature",
			description_text_id = "thick_skin",
			icon = "equipment_thick_skin",
			image = "upgrades_thugskin",
			image_slice = "upgrades_thugskin_slice",
			title_id = "debug_upgrade_player_upgrade",
			tree = 2,
			step = self.steps.player.thick_skin[i],
			subtitle_id = "debug_upgrade_thick_skin" .. i,
			name_id = "debug_upgrade_thick_skin" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "player",
				upgrade = "thick_skin",
				value = i
			}
		}
	end

	self.definitions.extra_start_out_ammo = {
		category = "equipment",
		description_text_id = "extra_ammo_multiplier",
		equipment_id = "extra_start_out_ammo",
		icon = "equipment_extra_start_out_ammo",
		image = "upgrades_extrastartammo",
		image_slice = "upgrades_extrastartammo_slice",
		name_id = "debug_upgrade_extra_start_out_ammo1",
		prio = "high",
		slot = 2,
		step = 2,
		subtitle_id = "debug_upgrade_extra_start_out_ammo1",
		title_id = "debug_upgrade_player_upgrade",
		tree = 3,
		unlock_lvl = 13,
		aquire = {
			upgrade = "extra_ammo_multiplier1"
		}
	}

	for i, _ in ipairs(self.values.player.extra_ammo_multiplier) do
		local depends_on = i - 1 > 0 and "extra_ammo_multiplier" .. i - 1
		local unlock_lvl = 14
		local prio = i == 1 and "high"

		self.definitions["extra_ammo_multiplier" .. i] = {
			category = "feature",
			description_text_id = "extra_ammo_multiplier",
			icon = "equipment_extra_start_out_ammo",
			image = "upgrades_extrastartammo",
			image_slice = "upgrades_extrastartammo_slice",
			title_id = "debug_upgrade_player_upgrade",
			tree = 3,
			step = self.steps.player.extra_ammo_multiplier[i],
			name_id = "debug_upgrade_extra_start_out_ammo" .. i,
			subtitle_id = "debug_upgrade_extra_start_out_ammo" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "player",
				upgrade = "extra_ammo_multiplier",
				value = i
			}
		}
	end

	self.definitions.player_add_armor_stat_skill_ammo_mul = {
		category = "feature",
		name_id = "menu_player_add_armor_stat_skill_ammo_mul",
		upgrade = {
			category = "player",
			upgrade = "add_armor_stat_skill_ammo_mul",
			value = 1
		}
	}
	self.definitions.player_overkill_health_to_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_overkill_health_to_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "overkill_health_to_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_detection_risk_add_crit_chance_1 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_crit_chance",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_crit_chance",
			value = 1
		}
	}
	self.definitions.player_detection_risk_add_crit_chance_2 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_crit_chance",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_crit_chance",
			value = 2
		}
	}
	self.definitions.player_detection_risk_add_dodge_chance_1 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_detection_risk_add_dodge_chance_2 = {
		category = "feature",
		name_id = "menu_player_detection_risk_add_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_add_dodge_chance",
			value = 2
		}
	}
	self.definitions.player_detection_risk_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_detection_risk_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "detection_risk_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_kill_snatch_pager_chance = {
		category = "feature",
		name_id = "menu_player_melee_kill_snatch_pager_chance",
		upgrade = {
			category = "player",
			upgrade = "melee_kill_snatch_pager_chance",
			value = 1
		}
	}
	self.definitions.player_critical_hit_chance_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_critical_hit_chance",
		upgrade = {
			category = "player",
			upgrade = "critical_hit_chance",
			value = 1
		}
	}
	self.definitions.player_critical_hit_chance_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_critical_hit_chance",
		upgrade = {
			category = "player",
			upgrade = "critical_hit_chance",
			value = 1
		}
	}
	self.definitions.player_unseen_increased_crit_chance_1 = {
		category = "feature",
		name_id = "menu_player_unseen_increased_crit_chance",
		upgrade = {
			category = "player",
			upgrade = "unseen_increased_crit_chance",
			value = 1
		}
	}
	self.definitions.player_unseen_increased_crit_chance_2 = {
		category = "feature",
		name_id = "menu_player_unseen_increased_crit_chance",
		upgrade = {
			category = "player",
			upgrade = "unseen_increased_crit_chance",
			value = 2
		}
	}
	self.definitions.player_unseen_temp_increased_crit_chance_1 = {
		category = "temporary",
		name_id = "menu_player_unseen_increased_crit_chance",
		upgrade = {
			category = "temporary",
			upgrade = "unseen_strike",
			value = 1
		}
	}
	self.definitions.player_unseen_temp_increased_crit_chance_2 = {
		category = "temporary",
		name_id = "menu_player_unseen_increased_crit_chance",
		upgrade = {
			category = "temporary",
			upgrade = "unseen_strike",
			value = 2
		}
	}
	self.definitions.player_mark_enemy_time_multiplier = {
		category = "feature",
		name_id = "menu_player_mark_enemy_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "mark_enemy_time_multiplier",
			value = 1
		}
	}
	self.definitions.player_minion_master_health_multiplier = {
		category = "feature",
		name_id = "menu_player_minion_master_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "minion_master_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_minion_master_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_minion_master_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "minion_master_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_flashbang_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_flashbang_multiplier",
		upgrade = {
			category = "player",
			upgrade = "flashbang_multiplier",
			value = 1
		}
	}
	self.definitions.player_flashbang_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_flashbang_multiplier",
		upgrade = {
			category = "player",
			upgrade = "flashbang_multiplier",
			value = 2
		}
	}
	self.definitions.player_revive_damage_reduction_1 = {
		category = "feature",
		name_id = "menu_player_revive_damage_reduction",
		upgrade = {
			category = "player",
			upgrade = "revive_damage_reduction",
			value = 1
		}
	}
	self.definitions.player_revive_damage_reduction_level_1 = {
		category = "feature",
		name_id = "menu_player_revive_damage_reduction_level",
		upgrade = {
			category = "player",
			upgrade = "revive_damage_reduction_level",
			value = 1
		}
	}
	self.definitions.player_revive_damage_reduction_level_2 = {
		category = "feature",
		name_id = "menu_player_revive_damage_reduction_level",
		upgrade = {
			category = "player",
			upgrade = "revive_damage_reduction_level",
			value = 2
		}
	}
	self.definitions.player_passive_damage_reduction_1 = {
		category = "feature",
		name_id = "menu_player_damage_reduction",
		upgrade = {
			category = "player",
			upgrade = "passive_damage_reduction",
			value = 1
		}
	}
	self.definitions.player_passive_health_multiplier_4 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 4
		}
	}
	self.definitions.player_passive_health_multiplier_5 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 5
		}
	}
	self.definitions.player_tier_armor_multiplier_4 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 4
		}
	}
	self.definitions.player_tier_armor_multiplier_5 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 5
		}
	}
	self.definitions.player_tier_armor_multiplier_6 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 6
		}
	}
	self.definitions.player_pick_up_ammo_multiplier = {
		category = "feature",
		name_id = "menu_player_pick_up_ammo_multiplier",
		upgrade = {
			category = "player",
			upgrade = "pick_up_ammo_multiplier",
			value = 1
		}
	}
	self.definitions.player_pick_up_ammo_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_pick_up_ammo_multiplier_2",
		upgrade = {
			category = "player",
			upgrade = "pick_up_ammo_multiplier",
			value = 2
		}
	}
	self.definitions.player_regain_throwable_from_ammo_1 = {
		category = "feature",
		name_id = "menu_player_regain_throwable_from_ammo",
		upgrade = {
			category = "player",
			upgrade = "regain_throwable_from_ammo",
			value = 1
		}
	}
	self.definitions.player_panic_suppression = {
		category = "feature",
		name_id = "menu_player_panic_suppression",
		upgrade = {
			category = "player",
			upgrade = "panic_suppression",
			value = 1
		}
	}
	self.definitions.player_armor_regen_timer_multiplier_passive = {
		category = "feature",
		name_id = "menu_player_armor_regen_timer_multiplier_passive",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_timer_multiplier_passive",
			value = 1
		}
	}
	self.definitions.player_armor_regen_time_mul_1 = {
		category = "feature",
		name_id = "menu_player_armor_regen_time_mul",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_time_mul",
			value = 1
		}
	}
	self.definitions.player_revived_damage_resist_1 = {
		category = "temporary",
		name_id = "menu_player_revived_damage_resist",
		upgrade = {
			category = "temporary",
			upgrade = "revived_damage_resist",
			value = 1
		}
	}
	self.definitions.player_temp_swap_weapon_faster_1 = {
		category = "temporary",
		name_id = "menu_player_temp_swap_weapon_faster",
		upgrade = {
			category = "temporary",
			upgrade = "swap_weapon_faster",
			value = 1
		}
	}
	self.definitions.player_temp_reload_weapon_faster_1 = {
		category = "temporary",
		name_id = "menu_player_temp_reload_weapon_faster",
		upgrade = {
			category = "temporary",
			upgrade = "reload_weapon_faster",
			value = 1
		}
	}
	self.definitions.player_temp_increased_movement_speed_1 = {
		category = "temporary",
		name_id = "menu_player_temp_increased_movement_speed",
		upgrade = {
			category = "temporary",
			upgrade = "increased_movement_speed",
			value = 1
		}
	}
	self.definitions.player_hostage_health_regen_addend_1 = {
		category = "temporary",
		name_id = "menu_player_hostage_health_regen_addend",
		upgrade = {
			category = "player",
			upgrade = "hostage_health_regen_addend",
			value = 1
		}
	}
	self.definitions.player_hostage_health_regen_addend_2 = {
		category = "temporary",
		name_id = "menu_player_hostage_health_regen_addend",
		upgrade = {
			category = "player",
			upgrade = "hostage_health_regen_addend",
			value = 2
		}
	}
	self.definitions.player_passive_dodge_chance_3 = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "passive_dodge_chance",
			value = 3
		}
	}
	self.definitions.player_passive_dodge_chance_4 = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "passive_dodge_chance",
			value = 4
		}
	}
	self.definitions.player_passive_always_regen_armor_1 = {
		category = "feature",
		name_id = "player_always_regen_armor",
		upgrade = {
			category = "player",
			upgrade = "passive_always_regen_armor",
			value = 1
		}
	}
	self.definitions.team_passive_armor_multiplier = {
		category = "team",
		name_id = "menu_team_passive_armor_multiplier",
		upgrade = {
			category = "armor",
			upgrade = "multiplier",
			value = 1
		}
	}
	self.definitions.player_camouflage_multiplier = {
		category = "feature",
		name_id = "menu_player_camouflage_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "camouflage_multiplier",
			value = 1
		}
	}
	self.definitions.player_uncover_multiplier = {
		category = "feature",
		name_id = "menu_player_uncover_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "uncover_multiplier",
			value = 1
		}
	}
	self.definitions.player_primary_weapon_when_downed = {
		category = "feature",
		name_id = "menu_player_primary_weapon_when_downed",
		upgrade = {
			category = "player",
			upgrade = "primary_weapon_when_downed",
			value = 1
		}
	}
	self.definitions.player_primary_weapon_when_carrying = {
		category = "feature",
		name_id = "menu_player_primary_weapon_when_carrying",
		upgrade = {
			category = "player",
			upgrade = "primary_weapon_when_carrying",
			value = 1
		}
	}
	self.definitions.player_messiah_revive_from_bleed_out_1 = {
		category = "feature",
		name_id = "menu_player_pistol_revive_from_bleed_out",
		upgrade = {
			category = "player",
			upgrade = "messiah_revive_from_bleed_out",
			value = 1
		}
	}
	self.definitions.player_recharge_messiah_1 = {
		category = "feature",
		name_id = "menu_player_recharge_pistol_messiah",
		upgrade = {
			category = "player",
			upgrade = "recharge_messiah",
			value = 1
		}
	}
	self.definitions.player_can_strafe_run = {
		category = "feature",
		name_id = "menu_player_can_strafe_run",
		upgrade = {
			category = "player",
			upgrade = "can_strafe_run",
			value = 1
		}
	}
	self.definitions.player_can_free_run = {
		category = "feature",
		name_id = "menu_player_can_free_run",
		upgrade = {
			category = "player",
			upgrade = "can_free_run",
			value = 1
		}
	}
	self.definitions.player_damage_shake_multiplier = {
		category = "feature",
		name_id = "menu_player_damage_shake_multiplier",
		upgrade = {
			category = "player",
			upgrade = "damage_shake_multiplier",
			value = 1
		}
	}
	self.definitions.player_health_multiplier = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "health_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_health_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_health_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 2
		}
	}
	self.definitions.player_passive_health_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_health_multiplier",
			value = 3
		}
	}
	self.definitions.player_bleed_out_health_multiplier = {
		category = "feature",
		name_id = "menu_player_bleed_out_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "bleed_out_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_revive_interaction_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_revive_interaction_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "revive_interaction_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_shield_knock = {
		category = "feature",
		name_id = "menu_player_shield_knock",
		upgrade = {
			category = "player",
			upgrade = "shield_knock",
			value = 1
		}
	}
	self.definitions.player_steelsight_when_downed = {
		category = "feature",
		name_id = "menu_player_steelsight_when_downed",
		upgrade = {
			category = "player",
			upgrade = "steelsight_when_downed",
			value = 1
		}
	}
	self.definitions.player_double_drop_1 = {
		category = "feature",
		name_id = "menu_player_double_drop",
		upgrade = {
			category = "player",
			upgrade = "double_drop",
			value = 1
		}
	}
	self.definitions.player_increased_pickup_area_1 = {
		category = "feature",
		name_id = "menu_player_increased_pickup_area",
		upgrade = {
			category = "player",
			upgrade = "increased_pickup_area",
			value = 1
		}
	}
	self.definitions.player_armor_multiplier = {
		category = "feature",
		name_id = "menu_player_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_tier_armor_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_1",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_tier_armor_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_2",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 2
		}
	}
	self.definitions.player_tier_armor_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_tier_armor_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "tier_armor_multiplier",
			value = 3
		}
	}
	self.definitions.single_shot_accuracy_inc_1 = {
		category = "feature",
		name_id = "menu_single_shot_accuracy_inc",
		upgrade = {
			category = "player",
			upgrade = "single_shot_accuracy_inc",
			value = 1
		}
	}
	self.definitions.head_shot_ammo_return_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_head_shot_ammo_return_1",
		upgrade = {
			category = "player",
			upgrade = "head_shot_ammo_return",
			value = 1
		}
	}
	self.definitions.head_shot_ammo_return_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_head_shot_ammo_return_2",
		upgrade = {
			category = "player",
			upgrade = "head_shot_ammo_return",
			value = 2
		}
	}
	self.definitions.player_passive_convert_enemies_health_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_convert_enemies_health_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "passive_convert_enemies_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_convert_enemies_health_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_convert_enemies_health_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "passive_convert_enemies_health_multiplier",
			value = 2
		}
	}
	self.definitions.player_counter_strike_melee = {
		category = "feature",
		name_id = "menu_player_counter_strike_melee",
		upgrade = {
			category = "player",
			upgrade = "counter_strike_melee",
			value = 1
		}
	}
	self.definitions.player_counter_strike_spooc = {
		category = "feature",
		name_id = "menu_player_counter_strike_spooc",
		upgrade = {
			category = "player",
			upgrade = "counter_strike_spooc",
			value = 1
		}
	}
	self.definitions.player_extra_corpse_dispose_amount = {
		category = "feature",
		name_id = "menu_player_extra_corpse_dispose_amount",
		upgrade = {
			category = "player",
			upgrade = "extra_corpse_dispose_amount",
			value = 1
		}
	}
	self.definitions.player_armor_regen_timer_multiplier_tier = {
		category = "feature",
		name_id = "menu_player_armor_regen_timer_multiplier_tier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_timer_multiplier_tier",
			value = 1
		}
	}
	self.definitions.player_standstill_omniscience = {
		category = "feature",
		name_id = "menu_player_standstill_omniscience",
		upgrade = {
			category = "player",
			upgrade = "standstill_omniscience",
			value = 1
		}
	}
	self.definitions.player_mask_off_pickup = {
		category = "feature",
		name_id = "menu_player_mask_off_pickup",
		upgrade = {
			category = "player",
			upgrade = "mask_off_pickup",
			value = 1
		}
	}
	self.definitions.player_cleaner_cost_multiplier = {
		category = "feature",
		name_id = "menu_player_cleaner_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "cleaner_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_2_armor_addend = {
		category = "feature",
		name_id = "menu_player_level_2_armor_addend",
		upgrade = {
			category = "player",
			upgrade = "level_2_armor_addend",
			value = 1
		}
	}
	self.definitions.player_level_3_armor_addend = {
		category = "feature",
		name_id = "menu_player_level_3_armor_addend",
		upgrade = {
			category = "player",
			upgrade = "level_3_armor_addend",
			value = 1
		}
	}
	self.definitions.player_level_4_armor_addend = {
		category = "feature",
		name_id = "menu_player_level_4_armor_addend",
		upgrade = {
			category = "player",
			upgrade = "level_4_armor_addend",
			value = 1
		}
	}
	self.definitions.player_level_2_dodge_addend_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_2_dodge_addend",
			value = 1
		}
	}
	self.definitions.player_level_3_dodge_addend_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_3_dodge_addend",
			value = 1
		}
	}
	self.definitions.player_level_4_dodge_addend_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_4_dodge_addend",
			value = 1
		}
	}
	self.definitions.player_level_2_dodge_addend_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_2_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_3_dodge_addend_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_3_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_4_dodge_addend_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_4_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_2_dodge_addend_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_2_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_3_dodge_addend_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_3_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_level_4_dodge_addend_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_dodge_addend",
		upgrade = {
			category = "player",
			upgrade = "level_4_dodge_addend",
			value = 2
		}
	}
	self.definitions.player_damage_shake_addend = {
		category = "feature",
		name_id = "menu_player_damage_shake_addend",
		upgrade = {
			category = "player",
			upgrade = "damage_shake_addend",
			value = 1
		}
	}
	self.definitions.player_level_2_armor_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_2_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_3_armor_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_3_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_4_armor_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_4_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_2_armor_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_2_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_3_armor_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_3_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_4_armor_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_4_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_2_armor_multiplier_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_2_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_2_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_3_armor_multiplier_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_3_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_3_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_level_4_armor_multiplier_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_level_4_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_4_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_tier_dodge_chance_1 = {
		category = "feature",
		name_id = "menu_player_tier_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "tier_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_tier_dodge_chance_2 = {
		category = "feature",
		name_id = "menu_player_tier_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "tier_dodge_chance",
			value = 2
		}
	}
	self.definitions.player_tier_dodge_chance_3 = {
		category = "feature",
		name_id = "menu_player_tier_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "tier_dodge_chance",
			value = 3
		}
	}
	self.definitions.player_stand_still_crouch_camouflage_bonus_1 = {
		category = "feature",
		name_id = "menu_player_stand_still_crouch_camouflage_bonus",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "stand_still_crouch_camouflage_bonus",
			value = 1
		}
	}
	self.definitions.player_stand_still_crouch_camouflage_bonus_2 = {
		category = "feature",
		name_id = "menu_player_stand_still_crouch_camouflage_bonus",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "stand_still_crouch_camouflage_bonus",
			value = 2
		}
	}
	self.definitions.player_stand_still_crouch_camouflage_bonus_3 = {
		category = "feature",
		name_id = "menu_player_stand_still_crouch_camouflage_bonus",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "stand_still_crouch_camouflage_bonus",
			value = 3
		}
	}
	self.definitions.player_pick_lock_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_pick_lock_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_corpse_dispose_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_corpse_dispose_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "corpse_dispose_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_alarm_pager_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_alarm_pager_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "alarm_pager_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_life_leech = {
		category = "temporary",
		name_id = "menu_player_melee_life_leech",
		upgrade = {
			category = "temporary",
			upgrade = "melee_life_leech",
			value = 1
		}
	}
	self.definitions.player_damage_dampener_outnumbered_strong = {
		category = "temporary",
		name_id = "menu_player_dmg_dampener_outnumbered_strong",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_outnumbered_strong",
			value = 1
		}
	}
	self.definitions.player_melee_kill_life_leech = {
		category = "feature",
		name_id = "menu_player_melee_kill_life_leech",
		upgrade = {
			category = "player",
			upgrade = "melee_kill_life_leech",
			value = 1
		}
	}
	self.definitions.player_killshot_regen_armor_bonus = {
		category = "feature",
		name_id = "menu_player_killshot_regen_armor_bonus",
		upgrade = {
			category = "player",
			upgrade = "killshot_regen_armor_bonus",
			value = 1
		}
	}
	self.definitions.player_killshot_close_regen_armor_bonus = {
		category = "feature",
		name_id = "menu_player_killshot_close_regen_armor_bonus",
		upgrade = {
			category = "player",
			upgrade = "killshot_close_regen_armor_bonus",
			value = 1
		}
	}
	self.definitions.player_killshot_close_panic_chance = {
		category = "feature",
		name_id = "menu_player_killshot_close_panic_chance",
		upgrade = {
			category = "player",
			upgrade = "killshot_close_panic_chance",
			value = 1
		}
	}
	self.definitions.player_damage_dampener_close_contact_1 = {
		category = "temporary",
		name_id = "menu_player_dmg_dampener_close_contact",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_close_contact",
			value = 1
		}
	}
	self.definitions.player_damage_dampener_close_contact_2 = {
		category = "temporary",
		name_id = "menu_player_dmg_dampener_close_contact",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_close_contact",
			value = 2
		}
	}
	self.definitions.player_damage_dampener_close_contact_3 = {
		category = "temporary",
		name_id = "menu_player_dmg_dampener_close_contact",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_close_contact",
			value = 3
		}
	}
	self.definitions.temporary_single_shot_fast_reload_1 = {
		category = "temporary",
		name_id = "menu_temporary_single_shot_fast_reload",
		upgrade = {
			category = "temporary",
			upgrade = "single_shot_fast_reload",
			value = 1
		}
	}
	self.definitions.temporary_revive_damage_reduction_1 = {
		category = "temporary",
		name_id = "menu_temporary_revive_damage_reduction",
		upgrade = {
			category = "temporary",
			upgrade = "revive_damage_reduction",
			value = 1
		}
	}
	self.definitions.melee_stacking_hit_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_melee_stacking_hit_damage_multiplier",
		upgrade = {
			category = "melee",
			upgrade = "stacking_hit_damage_multiplier",
			value = 1
		}
	}
	self.definitions.melee_stacking_hit_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_melee_stacking_hit_damage_multiplier",
		upgrade = {
			category = "melee",
			upgrade = "stacking_hit_damage_multiplier",
			value = 2
		}
	}
	self.definitions.melee_stacking_hit_expire_t = {
		category = "feature",
		name_id = "menu_melee_stacking_hit_expire_t",
		upgrade = {
			category = "melee",
			upgrade = "stacking_hit_expire_t",
			value = 1
		}
	}
	self.definitions.player_armor_health_store_amount_1 = {
		category = "feature",
		name_id = "menu_player_armor_health_store_amount",
		upgrade = {
			category = "player",
			upgrade = "armor_health_store_amount",
			value = 1
		}
	}
	self.definitions.player_armor_health_store_amount_2 = {
		category = "feature",
		name_id = "menu_player_armor_health_store_amount",
		upgrade = {
			category = "player",
			upgrade = "armor_health_store_amount",
			value = 2
		}
	}
	self.definitions.player_armor_health_store_amount_3 = {
		category = "feature",
		name_id = "menu_player_armor_health_store_amount",
		upgrade = {
			category = "player",
			upgrade = "armor_health_store_amount",
			value = 3
		}
	}
	self.definitions.player_armor_max_health_store_multiplier = {
		category = "feature",
		name_id = "menu_player_armor_max_health_store_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_max_health_store_multiplier",
			value = 1
		}
	}
	self.definitions.player_kill_change_regenerate_speed = {
		category = "feature",
		name_id = "menu_player_kill_change_regenerate_speed",
		upgrade = {
			category = "player",
			upgrade = "kill_change_regenerate_speed",
			value = 1
		}
	}
	self.definitions.player_armor_grinding_1 = {
		category = "feature",
		name_id = "menu_player_armor_grinding",
		upgrade = {
			category = "player",
			upgrade = "armor_grinding",
			value = 1
		}
	}
	self.definitions.player_armor_increase_1 = {
		category = "feature",
		name_id = "menu_player_health_to_armor_conversion",
		upgrade = {
			category = "player",
			upgrade = "armor_increase",
			value = 1
		}
	}
	self.definitions.player_armor_increase_2 = {
		category = "feature",
		name_id = "menu_player_health_to_armor_conversion",
		upgrade = {
			category = "player",
			upgrade = "armor_increase",
			value = 2
		}
	}
	self.definitions.player_armor_increase_3 = {
		category = "feature",
		name_id = "menu_player_health_to_armor_conversion",
		upgrade = {
			category = "player",
			upgrade = "armor_increase",
			value = 3
		}
	}
	self.definitions.player_health_decrease_1 = {
		category = "feature",
		name_id = "menu_player_health_decrease",
		upgrade = {
			category = "player",
			upgrade = "health_decrease",
			value = 1
		}
	}
	self.definitions.player_damage_to_armor_1 = {
		category = "feature",
		name_id = "menu_player_damage_to_armor",
		upgrade = {
			category = "player",
			upgrade = "damage_to_armor",
			value = 1
		}
	}

	for i, value in ipairs(self.values.player.perk_armor_regen_timer_multiplier) do
		self.definitions["player_perk_armor_regen_timer_multiplier_" .. tostring(i)] = {
			category = "feature",
			name_id = "menu_player_perk_armor_regen_timer_multiplier",
			upgrade = {
				category = "player",
				upgrade = "perk_armor_regen_timer_multiplier",
				value = i
			}
		}
	end

	for i, value in ipairs(self.values.player.perk_armor_loss_multiplier) do
		self.definitions["player_perk_armor_loss_multiplier_" .. tostring(i)] = {
			category = "feature",
			name_id = "menu_player_perk_armor_loss_multiplier",
			upgrade = {
				category = "player",
				upgrade = "perk_armor_loss_multiplier",
				value = i
			}
		}
	end

	self.definitions.player_passive_armor_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_passive_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_armor_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_passive_armor_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_armor_multiplier",
			value = 2
		}
	}
	self.definitions.player_armor_regen_timer_multiplier = {
		category = "feature",
		name_id = "menu_player_armor_regen_timer_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_timer_multiplier",
			value = 1
		}
	}
	self.definitions.player_armor_regen_timer_stand_still_multiplier = {
		category = "feature",
		name_id = "menu_player_armor_regen_timer_stand_still_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_timer_stand_still_multiplier",
			value = 1
		}
	}
	self.definitions.player_temp_melee_kill_increase_reload_speed_1 = {
		category = "temporary",
		name_id = "menu_player_temp_melee_kill_increase_reload_speed",
		upgrade = {
			category = "player",
			upgrade = "melee_kill_increase_reload_speed",
			value = 1
		}
	}
	self.definitions.player_hostage_health_regen_addend = {
		category = "temporary",
		name_id = "menu_player_hostage_health_regen_addend",
		upgrade = {
			category = "player",
			upgrade = "hostage_health_regen_addend",
			value = 1
		}
	}
	self.definitions.player_passive_health_regen = {
		category = "temporary",
		name_id = "menu_player_passive_health_regen",
		upgrade = {
			category = "player",
			upgrade = "passive_health_regen",
			value = 1
		}
	}
	self.definitions.player_close_to_hostage_boost = {
		category = "temporary",
		name_id = "menu_player_close_to_hostage_boost",
		upgrade = {
			category = "player",
			upgrade = "close_to_hostage_boost",
			value = 1
		}
	}
	self.definitions.player_stamina_multiplier = {
		category = "feature",
		name_id = "menu_player_stamina_multiplier",
		upgrade = {
			category = "player",
			upgrade = "stamina_multiplier",
			value = 1
		}
	}
	self.definitions.player_stamina_regen_multiplier = {
		category = "feature",
		name_id = "menu_player_stamina_regen_multiplier",
		upgrade = {
			category = "player",
			upgrade = "stamina_regen_multiplier",
			value = 1
		}
	}
	self.definitions.player_stamina_regen_timer_multiplier = {
		category = "feature",
		name_id = "menu_player_stamina_regen_timer_multiplier",
		upgrade = {
			category = "player",
			upgrade = "stamina_regen_timer_multiplier",
			value = 1
		}
	}
	self.definitions.player_revived_health_regain_1 = {
		category = "feature",
		name_id = "menu_revived_health_regain",
		upgrade = {
			category = "player",
			upgrade = "revived_health_regain",
			value = 1
		}
	}
	self.definitions.player_run_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_run_speed_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "run_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_dodge_chance_1 = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "passive_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_passive_dodge_chance_2 = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "passive_dodge_chance",
			value = 2
		}
	}
	self.definitions.player_run_dodge_chance = {
		category = "feature",
		name_id = "menu_player_run_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "run_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_melee_damage_stacking_1 = {
		category = "feature",
		name_id = "menu_player_melee_damage_stacking",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_stacking",
			value = 1
		}
	}
	self.definitions.player_walk_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_walk_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "walk_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_crouch_speed_multiplier = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_crouch_speed_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "crouch_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_crouch_speed_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_crouch_speed_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "crouch_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_gain_life_per_players = {
		category = "feature",
		name_id = "menu_player_gain_life_per_players",
		upgrade = {
			category = "player",
			upgrade = "gain_life_per_players",
			value = 1
		}
	}
	self.definitions.player_fall_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_fall_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "fall_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_fall_health_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_fall_health_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "fall_health_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_interacting_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_interacting_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "interacting_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_damage_health_ratio_multiplier = {
		category = "feature",
		name_id = "menu_player_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "damage_health_ratio_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_damage_health_ratio_multiplier = {
		category = "feature",
		name_id = "menu_player_melee_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_health_ratio_multiplier",
			value = 1
		}
	}
	self.definitions.player_melee_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_melee_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_respawn_time_multiplier = {
		category = "feature",
		name_id = "menu_player_respawn_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "respawn_time_multiplier",
			value = 1
		}
	}
	self.definitions.passive_player_xp_multiplier = {
		category = "feature",
		name_id = "menu_player_xp_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_xp_multiplier",
			value = 1
		}
	}
	self.definitions.player_xp_multiplier = {
		category = "feature",
		name_id = "menu_player_xp_multiplier",
		upgrade = {
			category = "player",
			upgrade = "xp_multiplier",
			value = 1
		}
	}
	self.definitions.player_non_special_melee_multiplier = {
		category = "feature",
		name_id = "menu_player_non_special_melee_multiplier",
		upgrade = {
			category = "player",
			upgrade = "non_special_melee_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_suspicion_bonus = {
		category = "feature",
		name_id = "menu_player_passive_suspicion_bonus",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "passive_concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_concealment_bonus_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_suspicion_bonus",
		upgrade = {
			category = "player",
			upgrade = "concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_concealment_bonus_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_suspicion_bonus",
		upgrade = {
			category = "player",
			upgrade = "concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_concealment_bonus_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_passive_suspicion_bonus",
		upgrade = {
			category = "player",
			upgrade = "concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_melee_concealment_modifier = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_melee_concealment_modifier",
		upgrade = {
			category = "player",
			upgrade = "melee_concealment_modifier",
			value = 1
		}
	}
	self.definitions.player_melee_sharp_damage_multiplier = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_melee_sharp_damage_multiplier",
		upgrade = {
			category = "player",
			upgrade = "melee_sharp_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_suspicion_bonus = {
		category = "feature",
		name_id = "menu_player_suspicion_bonus",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "suspicion_multiplier",
			value = 1
		}
	}
	self.definitions.player_loose_ammo_restore_health_give_team = {
		category = "temporary",
		name_id = "menu_player_loose_ammo_restore_health_give_team",
		upgrade = {
			category = "player",
			upgrade = "loose_ammo_restore_health_give_team",
			value = 1
		}
	}
	self.definitions.player_uncover_progress_mul = {
		category = "feature",
		name_id = "player_uncover_progress_mul",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "uncover_progress_mul",
			value = 1
		}
	}
	self.definitions.player_uncover_progress_decay_mul = {
		category = "feature",
		name_id = "menu_player_uncover_progress_decay_mul",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "uncover_progress_decay_mul",
			value = 1
		}
	}
	self.definitions.player_camouflage_bonus_1 = {
		category = "feature",
		name_id = "menu_player_camouflage_bonus",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "camouflage_bonus",
			value = 1
		}
	}
	self.definitions.player_camouflage_bonus_2 = {
		category = "feature",
		name_id = "menu_player_camouflage_bonus",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "camouflage_bonus",
			value = 2
		}
	}
	self.definitions.temporary_damage_speed_multiplier = {
		category = "temporary",
		name_id = "menu_temporary_damage_speed_1",
		upgrade = {
			category = "temporary",
			upgrade = "damage_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_team_damage_speed_multiplier_send = {
		category = "feature",
		name_id = "menu_temporary_damage_speed_2",
		upgrade = {
			category = "player",
			upgrade = "team_damage_speed_multiplier_send",
			value = 1
		}
	}
	self.definitions.temporary_team_damage_speed_multiplier_received = {
		category = "temporary",
		name_id = "menu_temporary_team_damage_speed",
		upgrade = {
			category = "temporary",
			upgrade = "team_damage_speed_multiplier_received",
			value = 1
		}
	}
	self.definitions.player_suppressed_bonus = {
		category = "feature",
		name_id = "menu_player_suppressed_bonus",
		upgrade = {
			category = "player",
			upgrade = "suppressed_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_suppression_bonus_1 = {
		category = "feature",
		name_id = "menu_player_suppression_bonus",
		upgrade = {
			category = "player",
			upgrade = "passive_suppression_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_suppression_bonus_2 = {
		category = "feature",
		name_id = "menu_player_suppression_bonus",
		upgrade = {
			category = "player",
			upgrade = "passive_suppression_multiplier",
			value = 2
		}
	}
	self.definitions.player_suppression_bonus = {
		category = "feature",
		name_id = "menu_player_suppression_bonus",
		upgrade = {
			category = "player",
			upgrade = "suppression_multiplier",
			value = 1
		}
	}
	self.definitions.player_civilian_reviver = {
		category = "feature",
		name_id = "menu_player_civilian_reviver",
		upgrade = {
			category = "player",
			upgrade = "civilian_reviver",
			value = 1
		}
	}
	self.definitions.player_overkill_damage_multiplier = {
		category = "temporary",
		name_id = "menu_player_overkill_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "overkill_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_overkill_all_weapons = {
		category = "feature",
		name_id = "menu_player_overkill_all_weapons",
		upgrade = {
			category = "player",
			upgrade = "overkill_all_weapons",
			value = 1
		}
	}
	self.definitions.player_berserker_no_ammo_cost = {
		category = "feature",
		name_id = "menu_player_berserker_no_ammo_cost",
		upgrade = {
			category = "player",
			upgrade = "berserker_no_ammo_cost",
			value = 1
		}
	}
	self.definitions.player_damage_multiplier_outnumbered = {
		category = "temporary",
		name_id = "menu_player_dmg_mul_outnumbered",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_multiplier_outnumbered",
			value = 1
		}
	}
	self.definitions.player_damage_dampener_outnumbered = {
		category = "temporary",
		name_id = "menu_player_dmg_damp_outnumbered",
		upgrade = {
			category = "temporary",
			upgrade = "dmg_dampener_outnumbered",
			value = 1
		}
	}
	self.definitions.player_corpse_alarm_pager_bluff = {
		category = "feature",
		name_id = "menu_player_pager_dis",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "corpse_alarm_pager_bluff",
			value = 1
		}
	}
	self.definitions.player_buy_bodybags_asset = {
		category = "feature",
		name_id = "menu_player_buy_bodybags_asset",
		upgrade = {
			category = "player",
			upgrade = "buy_bodybags_asset",
			value = 1
		}
	}
	self.definitions.player_corpse_dispose = {
		category = "feature",
		name_id = "menu_player_corpse_disp",
		upgrade = {
			category = "player",
			upgrade = "corpse_dispose",
			value = 1
		}
	}
	self.definitions.player_corpse_dispose_amount_1 = {
		category = "feature",
		name_id = "menu_player_corpse_disp_amount_1",
		upgrade = {
			category = "player",
			upgrade = "corpse_dispose_amount",
			value = 1
		}
	}
	self.definitions.player_corpse_dispose_amount_2 = {
		category = "feature",
		name_id = "menu_player_corpse_disp_amount_2",
		upgrade = {
			category = "player",
			upgrade = "corpse_dispose_amount",
			value = 2
		}
	}
	self.definitions.player_taser_malfunction = {
		category = "feature",
		name_id = "menu_player_taser_malf",
		upgrade = {
			category = "player",
			upgrade = "taser_malfunction",
			value = 1
		}
	}
	self.definitions.player_taser_self_shock = {
		category = "feature",
		name_id = "menu_player_taser_shock",
		upgrade = {
			category = "player",
			upgrade = "taser_self_shock",
			value = 1
		}
	}
	self.definitions.player_electrocution_resistance = {
		category = "feature",
		name_id = "menu_player_electrocution_resistance",
		upgrade = {
			category = "player",
			upgrade = "electrocution_resistance_multiplier",
			value = 1
		}
	}
	self.definitions.player_tased_recover_multiplier = {
		category = "feature",
		name_id = "menu_player_tased_recover_multiplier",
		upgrade = {
			category = "player",
			upgrade = "tased_recover_multiplier",
			value = 1
		}
	}
	self.definitions.player_secured_bags_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_secured_bags_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "secured_bags_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_secured_bags_money_multiplier = {
		category = "feature",
		name_id = "menu_secured_bags_money_multiplier",
		upgrade = {
			category = "player",
			upgrade = "secured_bags_money_multiplier",
			value = 1
		}
	}
	self.definitions.player_silent_kill = {
		category = "feature",
		name_id = "menu_player_silent_kill",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "silent_kill",
			value = 1
		}
	}
	self.definitions.player_armor_carry_bonus_1 = {
		category = "feature",
		name_id = "menu_player_armor_carry_bonus",
		upgrade = {
			category = "player",
			upgrade = "armor_carry_bonus",
			value = 1
		}
	}
	self.definitions.player_run_and_shoot_1 = {
		category = "feature",
		name_id = "menu_run_and_shoot",
		upgrade = {
			category = "player",
			upgrade = "run_and_shoot",
			value = 1
		}
	}
	self.definitions.player_automatic_faster_reload_1 = {
		category = "feature",
		name_id = "menu_automatic_faster_reload",
		upgrade = {
			category = "player",
			upgrade = "automatic_faster_reload",
			value = 1
		}
	}
	self.definitions.player_melee_knockdown_mul = {
		category = "feature",
		name_id = "menu_player_melee_knockdown_mul",
		upgrade = {
			category = "player",
			upgrade = "melee_knockdown_mul",
			value = 1
		}
	}
	self.definitions.player_suppression_mul_1 = {
		category = "feature",
		name_id = "menu_player_suppression_mul_2",
		upgrade = {
			category = "player",
			upgrade = "suppression_multiplier",
			value = 1
		}
	}
	self.definitions.player_damage_dampener = {
		category = "feature",
		name_id = "menu_player_damage_dampener",
		upgrade = {
			category = "player",
			upgrade = "damage_dampener",
			value = 1
		}
	}
	self.definitions.player_melee_damage_dampener = {
		category = "feature",
		name_id = "menu_player_melee_damage_dampener",
		upgrade = {
			category = "player",
			upgrade = "melee_damage_dampener",
			value = 1
		}
	}
	self.definitions.player_marked_enemy_extra_damage = {
		category = "feature",
		name_id = "menu_player_marked_enemy_extra_damage",
		upgrade = {
			category = "player",
			upgrade = "marked_enemy_extra_damage",
			value = 1
		}
	}
	self.definitions.player_marked_distance_mul = {
		category = "feature",
		name_id = "menu_player_marked_distance_mul",
		upgrade = {
			category = "player",
			upgrade = "marked_distance_mul",
			value = 1
		}
	}
	self.definitions.player_civ_intimidation_mul = {
		category = "feature",
		name_id = "menu_player_civ_intimidation_mul",
		upgrade = {
			category = "player",
			upgrade = "civ_intimidation_mul",
			value = 1
		}
	}
	self.definitions.player_civ_harmless_bullets = {
		category = "feature",
		name_id = "menu_player_civ_harmless_bullets",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "civ_harmless_bullets",
			value = 1
		}
	}
	self.definitions.player_civ_harmless_melee = {
		category = "feature",
		name_id = "menu_player_civ_harmless_melee",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "civ_harmless_melee",
			value = 1
		}
	}
	self.definitions.player_civ_calming_alerts = {
		category = "feature",
		name_id = "menu_player_civ_calming_alerts",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "civ_calming_alerts",
			value = 1
		}
	}
	self.definitions.player_special_enemy_highlight = {
		category = "feature",
		name_id = "menu_player_special_enemy_highlight",
		upgrade = {
			category = "player",
			upgrade = "special_enemy_highlight",
			value = 1
		}
	}
	self.definitions.player_drill_alert = {
		category = "feature",
		name_id = "menu_player_drill_alert",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "drill_alert_rad",
			value = 1
		}
	}
	self.definitions.player_silent_drill = {
		category = "feature",
		name_id = "menu_player_silent_drill",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "silent_drill",
			value = 1
		}
	}
	self.definitions.player_drill_speed_multiplier1 = {
		category = "feature",
		name_id = "menu_player_drill_speed_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "drill_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_drill_speed_multiplier2 = {
		category = "feature",
		name_id = "menu_player_drill_speed_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "drill_speed_multiplier",
			value = 2
		}
	}
	self.definitions.player_drill_melee_hit_restart_chance_1 = {
		category = "feature",
		name_id = "menu_player_drill_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "drill_melee_hit_restart_chance",
			value = 1
		}
	}
	self.definitions.player_saw_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_saw_speed_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "saw_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_saw_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_saw_speed_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "saw_speed_multiplier",
			value = 2
		}
	}
	self.definitions.player_drill_fix_interaction_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_drill_fix_interaction_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "drill_fix_interaction_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_dye_pack_chance_multiplier = {
		category = "feature",
		name_id = "menu_player_dye_pack_chance_multiplier",
		upgrade = {
			category = "player",
			upgrade = "dye_pack_chance_multiplier",
			value = 1
		}
	}
	self.definitions.player_dye_pack_cash_loss_multiplier = {
		category = "feature",
		name_id = "menu_player_dye_pack_cash_loss_multiplier",
		upgrade = {
			category = "player",
			upgrade = "dye_pack_cash_loss_multiplier",
			value = 1
		}
	}
	self.definitions.player_cheat_death_chance_1 = {
		category = "feature",
		name_id = "menu_player_cheat_death_chance",
		upgrade = {
			category = "player",
			upgrade = "cheat_death_chance",
			value = 1
		}
	}
	self.definitions.player_cheat_death_chance_2 = {
		category = "feature",
		name_id = "menu_player_cheat_death_chance",
		upgrade = {
			category = "player",
			upgrade = "cheat_death_chance",
			value = 2
		}
	}
	self.definitions.player_additional_lives_1 = {
		category = "feature",
		name_id = "menu_player_additional_lives_1",
		upgrade = {
			category = "player",
			upgrade = "additional_lives",
			value = 1
		}
	}
	self.definitions.player_additional_lives_2 = {
		category = "feature",
		name_id = "menu_player_additional_lives_2",
		upgrade = {
			category = "player",
			upgrade = "additional_lives",
			value = 2
		}
	}
	self.definitions.player_trip_mine_shaped_charge = {
		category = "feature",
		name_id = "menu_player_trip_mine_shaped_charge",
		upgrade = {
			category = "player",
			upgrade = "trip_mine_shaped_charge",
			value = 1
		}
	}
	self.definitions.player_small_loot_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_small_loot_multiplier",
		upgrade = {
			category = "player",
			upgrade = "small_loot_multiplier",
			value = 1
		}
	}
	self.definitions.player_intimidate_enemies = {
		category = "feature",
		name_id = "menu_player_intimidate_enemies",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "intimidate_enemies",
			value = 1
		}
	}
	self.definitions.player_intimidate_specials = {
		category = "feature",
		name_id = "menu_player_intimidate_specials",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "intimidate_specials",
			value = 1
		}
	}
	self.definitions.player_passive_empowered_intimidation = {
		category = "feature",
		name_id = "menu_player_passive_empowered_intimidation",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "empowered_intimidation_mul",
			value = 1
		}
	}
	self.definitions.player_intimidation_multiplier = {
		category = "feature",
		name_id = "menu_player_intimidation_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "intimidation_multiplier",
			value = 1
		}
	}
	self.definitions.player_sentry_gun_deploy_time_multiplier = {
		category = "feature",
		name_id = "menu_player_sentry_gun_deploy_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "sentry_gun_deploy_time_multiplier",
			value = 1
		}
	}
	self.definitions.player_trip_mine_deploy_time_multiplier = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_trip_mine_deploy_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "trip_mine_deploy_time_multiplier",
			value = 1
		}
	}
	self.definitions.player_trip_mine_deploy_time_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_trip_mine_deploy_time_multiplier",
		upgrade = {
			category = "player",
			upgrade = "trip_mine_deploy_time_multiplier",
			value = 1
		}
	}
	self.definitions.player_convert_enemies = {
		category = "feature",
		name_id = "menu_player_convert_enemies",
		upgrade = {
			category = "player",
			upgrade = "convert_enemies",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_max_minions_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_convert_enemies_max_minions",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "convert_enemies_max_minions",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_max_minions_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_convert_enemies_max_minions",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "convert_enemies_max_minions",
			value = 2
		}
	}
	self.definitions.player_super_syndrome_1 = {
		category = "feature",
		name_id = "menu_player_super_syndrome",
		upgrade = {
			category = "player",
			upgrade = "super_syndrome",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_interaction_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_convert_enemies_interaction_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "convert_enemies_interaction_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_health_multiplier = {
		category = "feature",
		name_id = "menu_player_convert_enemies_health_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "convert_enemies_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_convert_enemies_damage_multiplier_1",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "convert_enemies_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_convert_enemies_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_convert_enemies_damage_multiplier_2",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "convert_enemies_damage_multiplier",
			value = 2
		}
	}
	self.definitions.player_passive_convert_enemies_damage_multiplier = {
		category = "feature",
		name_id = "menu_player_passive_convert_enemies_damage_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "passive_convert_enemies_damage_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_intimidate_range_mul = {
		category = "feature",
		name_id = "menu_player_intimidate_range_mul",
		upgrade = {
			category = "player",
			upgrade = "passive_intimidate_range_mul",
			value = 1
		}
	}
	self.definitions.deploy_interact_faster_1 = {
		category = "feature",
		name_id = "menu_deploy_interact_faster",
		upgrade = {
			category = "player",
			upgrade = "deploy_interact_faster",
			value = 1
		}
	}
	self.definitions.second_deployable_1 = {
		category = "feature",
		name_id = "menu_second_deployable",
		upgrade = {
			category = "player",
			upgrade = "second_deployable",
			value = 1
		}
	}
	self.definitions.player_intimidate_range_mul = {
		category = "feature",
		name_id = "menu_player_intimidate_range_mul",
		upgrade = {
			category = "player",
			upgrade = "intimidate_range_mul",
			value = 1
		}
	}
	self.definitions.player_intimidate_aura = {
		category = "feature",
		name_id = "menu_player_intimidate_aura",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "intimidate_aura",
			value = 1
		}
	}
	self.definitions.player_civilian_gives_ammo = {
		category = "feature",
		name_id = "menu_player_civilian_gives_ammo",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "civilian_gives_ammo",
			value = 1
		}
	}
	self.definitions.player_drill_autorepair_1 = {
		category = "feature",
		name_id = "menu_player_drill_autorepair",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "drill_autorepair_1",
			value = 1
		}
	}
	self.definitions.player_drill_autorepair_2 = {
		category = "feature",
		name_id = "menu_player_drill_autorepair",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "drill_autorepair_2",
			value = 1
		}
	}
	self.definitions.player_hostage_trade = {
		category = "feature",
		name_id = "menu_player_hostage_trade",
		upgrade = {
			category = "player",
			upgrade = "hostage_trade",
			value = 1
		}
	}
	self.definitions.player_sec_camera_highlight = {
		category = "feature",
		name_id = "menu_player_sec_camera_highlight",
		upgrade = {
			category = "player",
			upgrade = "sec_camera_highlight",
			value = 1
		}
	}
	self.definitions.player_sec_camera_highlight_mask_off = {
		category = "feature",
		name_id = "menu_player_sec_camera_highlight_mask_off",
		upgrade = {
			category = "player",
			upgrade = "sec_camera_highlight_mask_off",
			value = 1
		}
	}
	self.definitions.player_special_enemy_highlight_mask_off = {
		category = "feature",
		name_id = "menu_player_special_enemy_highlight_mask_off",
		upgrade = {
			category = "player",
			upgrade = "special_enemy_highlight_mask_off",
			value = 1
		}
	}
	self.definitions.player_morale_boost = {
		category = "feature",
		name_id = "menu_player_morale_boost",
		upgrade = {
			category = "player",
			upgrade = "morale_boost",
			value = 1
		}
	}
	self.definitions.player_ap_bullets_1 = {
		category = "feature",
		name_id = "menu_player_ap_bullets_1",
		upgrade = {
			category = "player",
			upgrade = "ap_bullets",
			value = 1
		}
	}
	self.definitions.player_morale_boost_cooldown_multiplier = {
		category = "feature",
		name_id = "menu_player_morale_boost_cooldown_multiplier",
		upgrade = {
			category = "player",
			upgrade = "morale_boost_cooldown_multiplier",
			value = 1
		}
	}
	self.definitions.player_long_dis_revive_2 = {
		category = "feature",
		name_id = "menu_player_long_dis_revive",
		upgrade = {
			category = "player",
			upgrade = "long_dis_revive",
			value = 2
		}
	}
	self.definitions.player_healing_reduction_1 = {
		category = "feature",
		name_id = "menu_player_healing_reduction",
		upgrade = {
			category = "player",
			upgrade = "healing_reduction",
			value = 1
		}
	}
	self.definitions.player_healing_reduction_2 = {
		category = "feature",
		name_id = "menu_player_healing_reduction",
		upgrade = {
			category = "player",
			upgrade = "healing_reduction",
			value = 2
		}
	}
	self.definitions.player_health_damage_reduction_1 = {
		category = "feature",
		name_id = "menu_player_health_damage_reduction",
		upgrade = {
			category = "player",
			upgrade = "health_damage_reduction",
			value = 1
		}
	}
	self.definitions.player_health_damage_reduction_2 = {
		category = "feature",
		name_id = "menu_player_health_damage_reduction",
		upgrade = {
			category = "player",
			upgrade = "health_damage_reduction",
			value = 2
		}
	}
	self.definitions.player_max_health_reduction_1 = {
		category = "feature",
		name_id = "menu_player_max_health_reduction",
		upgrade = {
			category = "player",
			upgrade = "max_health_reduction",
			value = 1
		}
	}
	self.definitions.player_pick_lock_easy = {
		category = "feature",
		name_id = "menu_player_pick_lock_easy",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_easy",
			value = 1
		}
	}
	self.definitions.player_pick_lock_hard = {
		category = "feature",
		name_id = "menu_player_pick_lock_hard",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_hard",
			value = 1
		}
	}
	self.definitions.player_pick_lock_easy_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_pick_lock_easy_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "pick_lock_easy_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_loot_drop_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_loot_drop_multiplier",
		upgrade = {
			category = "player",
			upgrade = "loot_drop_multiplier",
			value = 1
		}
	}
	self.definitions.player_loot_drop_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_loot_drop_multiplier",
		upgrade = {
			category = "player",
			upgrade = "loot_drop_multiplier",
			value = 2
		}
	}
	self.definitions.player_passive_loot_drop_multiplier = {
		category = "feature",
		name_id = "menu_player_passive_loot_drop_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_loot_drop_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_armor_piercing_chance = {
		category = "feature",
		name_id = "menu_weapon_passive_armor_piercing_chance",
		upgrade = {
			category = "weapon",
			upgrade = "armor_piercing_chance",
			value = 1
		}
	}
	self.definitions.weapon_armor_piercing_chance_2 = {
		category = "feature",
		name_id = "menu_weapon_armor_piercing_chance_2",
		upgrade = {
			category = "weapon",
			upgrade = "armor_piercing_chance_2",
			value = 1
		}
	}
	self.definitions.weapon_silencer_armor_piercing_chance_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_weapon_silencer_armor_piercing_chance",
		upgrade = {
			category = "weapon",
			upgrade = "armor_piercing_chance_silencer",
			value = 1
		}
	}
	self.definitions.weapon_silencer_armor_piercing_chance_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_weapon_silencer_armor_piercing_chance",
		upgrade = {
			category = "weapon",
			upgrade = "armor_piercing_chance_silencer",
			value = 1
		}
	}
	self.definitions.weapon_automatic_head_shot_add_1 = {
		category = "feature",
		name_id = "menu_weapon_automatic_head_shot_add",
		upgrade = {
			category = "weapon",
			upgrade = "automatic_head_shot_add",
			value = 1
		}
	}
	self.definitions.weapon_automatic_head_shot_add_2 = {
		category = "feature",
		name_id = "menu_weapon_automatic_head_shot_add",
		upgrade = {
			category = "weapon",
			upgrade = "automatic_head_shot_add",
			value = 2
		}
	}
	self.definitions.player_passive_armor_movement_penalty_multiplier = {
		category = "feature",
		name_id = "menu_passive_armor_movement_penalty_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_armor_movement_penalty_multiplier",
			value = 1
		}
	}
	self.definitions.player_buy_cost_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_buy_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "buy_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_buy_cost_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_buy_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "buy_cost_multiplier",
			value = 2
		}
	}
	self.definitions.player_crime_net_deal = {
		category = "feature",
		name_id = "menu_player_crime_net_deal",
		upgrade = {
			category = "player",
			upgrade = "crime_net_deal",
			value = 1
		}
	}
	self.definitions.player_crime_net_deal_2 = {
		category = "feature",
		name_id = "menu_player_crime_net_deal",
		upgrade = {
			category = "player",
			upgrade = "crime_net_deal",
			value = 2
		}
	}
	self.definitions.player_sell_cost_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_sell_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "sell_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_crafting_weapon_multiplier = {
		category = "feature",
		name_id = "menu_player_crafting_weapon_multiplier",
		upgrade = {
			category = "player",
			upgrade = "crafting_weapon_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_crafting_weapon_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_crafting_weapon_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_weapon_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_crafting_weapon_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_crafting_weapon_multiplier_2",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_weapon_multiplier",
			value = 2
		}
	}
	self.definitions.player_passive_crafting_weapon_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_crafting_weapon_multiplier_3",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_weapon_multiplier",
			value = 3
		}
	}
	self.definitions.player_crafting_mask_multiplier = {
		category = "feature",
		name_id = "menu_player_crafting_mask_multiplier",
		upgrade = {
			category = "player",
			upgrade = "crafting_mask_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_crafting_mask_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_crafting_mask_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_mask_multiplier",
			value = 1
		}
	}
	self.definitions.player_passive_crafting_mask_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_crafting_mask_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_mask_multiplier",
			value = 2
		}
	}
	self.definitions.player_passive_crafting_mask_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_crafting_mask_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_crafting_mask_multiplier",
			value = 3
		}
	}
	self.definitions.player_additional_assets = {
		category = "feature",
		name_id = "menu_player_additional_assets",
		upgrade = {
			category = "player",
			upgrade = "additional_assets",
			value = 1
		}
	}
	self.definitions.player_assets_cost_multiplier = {
		category = "feature",
		name_id = "menu_player_assets_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "assets_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_assets_cost_multiplier_b = {
		category = "feature",
		name_id = "menu_player_assets_cost_multiplier_b",
		upgrade = {
			category = "player",
			upgrade = "assets_cost_multiplier_b",
			value = 1
		}
	}
	self.definitions.player_premium_contract_cost_multiplier = {
		category = "feature",
		name_id = "menu_player_premium_contract_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "premium_contract_cost_multiplier",
			value = 1
		}
	}
	self.definitions.passive_player_assets_cost_multiplier = {
		category = "feature",
		name_id = "menu_passive_player_assets_cost_multiplier",
		upgrade = {
			category = "player",
			upgrade = "passive_assets_cost_multiplier",
			value = 1
		}
	}
	self.definitions.player_revive_health_boost = {
		category = "feature",
		name_id = "menu_player_revive_health_boost",
		upgrade = {
			category = "player",
			upgrade = "revive_health_boost",
			value = 1
		}
	}
	self.definitions.player_run_and_shoot = {
		category = "feature",
		name_id = "menu_player_run_and_shoot",
		upgrade = {
			category = "player",
			upgrade = "run_and_shoot",
			value = 1
		}
	}
	self.definitions.player_carry_sentry_and_trip = {
		category = "feature",
		name_id = "menu_player_carry_sentry_and_trip",
		upgrade = {
			category = "player",
			upgrade = "carry_sentry_and_trip",
			value = 1
		}
	}
	self.definitions.player_run_and_reload = {
		category = "feature",
		name_id = "menu_player_run_and_reload",
		upgrade = {
			category = "player",
			upgrade = "run_and_reload",
			value = 1
		}
	}
	self.definitions.player_armor_depleted_stagger_shot_1 = {
		category = "feature",
		name_id = "menu_player_armor_depleted_stagger_shot",
		upgrade = {
			category = "player",
			upgrade = "armor_depleted_stagger_shot",
			value = 1
		}
	}
	self.definitions.player_armor_depleted_stagger_shot_2 = {
		category = "feature",
		name_id = "menu_player_armor_depleted_stagger_shot",
		upgrade = {
			category = "player",
			upgrade = "armor_depleted_stagger_shot",
			value = 2
		}
	}
	self.definitions.player_level_interaction_timer_multiplier = {
		category = "feature",
		name_id = "menu_player_level_interaction_timer_multiplier",
		upgrade = {
			category = "player",
			upgrade = "level_interaction_timer_multiplier",
			value = 1
		}
	}
	self.definitions.player_steelsight_normal_movement_speed = {
		category = "feature",
		name_id = "menu_player_steelsight_normal_movement_speed",
		upgrade = {
			category = "player",
			upgrade = "steelsight_normal_movement_speed",
			value = 1
		}
	}
	self.definitions.player_headshot_regen_armor_bonus_1 = {
		category = "feature",
		name_id = "menu_player_headshot_regen_armor_bonus",
		upgrade = {
			category = "player",
			upgrade = "headshot_regen_armor_bonus",
			value = 1
		}
	}
	self.definitions.player_headshot_regen_armor_bonus_2 = {
		category = "feature",
		name_id = "menu_player_headshot_regen_armor_bonus",
		upgrade = {
			category = "player",
			upgrade = "headshot_regen_armor_bonus",
			value = 2
		}
	}
	self.definitions.player_resist_firing_tased = {
		category = "feature",
		name_id = "menu_player_resist_firing_tased",
		upgrade = {
			category = "player",
			upgrade = "resist_firing_tased",
			value = 1
		}
	}
	self.definitions.player_crouch_dodge_chance_1 = {
		category = "feature",
		name_id = "menu_player_crouch_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "crouch_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_crouch_dodge_chance_2 = {
		category = "feature",
		name_id = "menu_player_crouch_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "crouch_dodge_chance",
			value = 2
		}
	}
	self.definitions.player_on_zipline_dodge_chance = {
		category = "feature",
		name_id = "menu_player_on_zipline_dodge_chance",
		upgrade = {
			category = "player",
			upgrade = "on_zipline_dodge_chance",
			value = 1
		}
	}
	self.definitions.player_movement_speed_multiplier = {
		category = "feature",
		name_id = "menu_player_movement_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "movement_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_knock_down_1 = {
		category = "feature",
		name_id = "menu_weapon_knock_down",
		upgrade = {
			category = "weapon",
			upgrade = "knock_down",
			value = 1
		}
	}
	self.definitions.weapon_knock_down_2 = {
		category = "feature",
		name_id = "menu_weapon_knock_down",
		upgrade = {
			category = "weapon",
			upgrade = "knock_down",
			value = 2
		}
	}
	self.definitions.player_climb_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_climb_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "climb_speed_multiplier",
			value = 1
		}
	}
	self.definitions.player_climb_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_climb_speed_multiplier",
		upgrade = {
			category = "player",
			upgrade = "climb_speed_multiplier",
			value = 2
		}
	}
	self.definitions.player_silencer_concealment_increase_1 = {
		category = "feature",
		name_id = "menu_player_silencer_concealment_increase",
		upgrade = {
			category = "player",
			upgrade = "silencer_concealment_increase",
			value = 1
		}
	}
	self.definitions.player_silencer_concealment_penalty_decrease_1 = {
		category = "feature",
		name_id = "menu_player_silencer_concealment_penalty_decrease",
		upgrade = {
			category = "player",
			upgrade = "silencer_concealment_penalty_decrease",
			value = 1
		}
	}
	self.definitions.player_tape_loop_duration_1 = {
		category = "feature",
		name_id = "menu_player_tape_loop_duration",
		upgrade = {
			category = "player",
			upgrade = "tape_loop_duration",
			value = 1
		}
	}
	self.definitions.player_tape_loop_duration_2 = {
		category = "feature",
		name_id = "menu_player_tape_loop_duration",
		upgrade = {
			category = "player",
			upgrade = "tape_loop_duration",
			value = 2
		}
	}
	self.definitions.player_tape_loop_interact_distance_mul_1 = {
		category = "feature",
		name_id = "menu_player_tape_loop_interact_distance_mul",
		upgrade = {
			category = "player",
			upgrade = "tape_loop_interact_distance_mul",
			value = 1
		}
	}
	self.definitions.player_buy_spotter_asset = {
		category = "feature",
		name_id = "menu_player_buy_spotter_asset",
		upgrade = {
			category = "player",
			upgrade = "buy_spotter_asset",
			value = 1
		}
	}
	self.definitions.player_ballistic_vest_concealment_1 = {
		category = "feature",
		name_id = "menu_player_ballistic_vest_concealment",
		upgrade = {
			category = "player",
			upgrade = "ballistic_vest_concealment",
			value = 1
		}
	}
	self.definitions.player_damage_to_hot_1 = {
		category = "feature",
		name_id = "menu_player_damage_to_hot",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot",
			value = 1
		}
	}
	self.definitions.player_damage_to_hot_2 = {
		category = "feature",
		name_id = "menu_player_damage_to_hot",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot",
			value = 2
		}
	}
	self.definitions.player_damage_to_hot_3 = {
		category = "feature",
		name_id = "menu_player_damage_to_hot",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot",
			value = 3
		}
	}
	self.definitions.player_damage_to_hot_4 = {
		category = "feature",
		name_id = "menu_player_damage_to_hot",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot",
			value = 4
		}
	}
	self.definitions.player_damage_to_hot_extra_ticks = {
		category = "feature",
		name_id = "menu_player_damage_to_hot_extra_ticks",
		upgrade = {
			category = "player",
			upgrade = "damage_to_hot_extra_ticks",
			value = 1
		}
	}
	self.definitions.player_armor_piercing_chance_1 = {
		category = "feature",
		name_id = "menu_player_armor_piercing_chance",
		upgrade = {
			category = "player",
			upgrade = "armor_piercing_chance",
			value = 1
		}
	}
	self.definitions.player_armor_piercing_chance_2 = {
		category = "feature",
		name_id = "menu_player_armor_piercing_chance",
		upgrade = {
			category = "player",
			upgrade = "armor_piercing_chance",
			value = 2
		}
	}
	self.definitions.player_marked_inc_dmg_distance_1 = {
		category = "feature",
		name_id = "menu_player_armor_piercing_chance",
		upgrade = {
			category = "player",
			upgrade = "marked_inc_dmg_distance",
			value = 1
		}
	}
	self.definitions.player_armor_regen_damage_health_ratio_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_armor_regen_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_damage_health_ratio_multiplier",
			value = 1
		}
	}
	self.definitions.player_armor_regen_damage_health_ratio_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_armor_regen_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_damage_health_ratio_multiplier",
			value = 2
		}
	}
	self.definitions.player_armor_regen_damage_health_ratio_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_armor_regen_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_damage_health_ratio_multiplier",
			value = 3
		}
	}
	self.definitions.player_movement_speed_damage_health_ratio_multiplier = {
		category = "feature",
		name_id = "menu_player_movement_speed_damage_health_ratio_multiplier",
		upgrade = {
			category = "player",
			upgrade = "movement_speed_damage_health_ratio_multiplier",
			value = 1
		}
	}
	self.definitions.player_armor_regen_damage_health_ratio_threshold_multiplier = {
		category = "feature",
		name_id = "menu_player_armor_regen_damage_health_ratio_threshold_multiplier",
		upgrade = {
			category = "player",
			upgrade = "armor_regen_damage_health_ratio_threshold_multiplier",
			value = 1
		}
	}
	self.definitions.player_movement_speed_damage_health_ratio_threshold_multiplier = {
		category = "feature",
		name_id = "menu_player_movement_speed_damage_health_ratio_threshold_multiplier",
		upgrade = {
			category = "player",
			upgrade = "movement_speed_damage_health_ratio_threshold_multiplier",
			value = 1
		}
	}
	self.definitions.player_stability_increase_bonus_1 = {
		category = "feature",
		name_id = "menu_player_stability_increase_bonus",
		upgrade = {
			category = "player",
			upgrade = "stability_increase_bonus_1",
			value = 1
		}
	}
	self.definitions.player_stability_increase_bonus_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_player_stability_increase_bonus",
		upgrade = {
			category = "player",
			upgrade = "stability_increase_bonus_2",
			value = 1
		}
	}
	self.definitions.player_weapon_accuracy_increase_1 = {
		category = "feature",
		name_id = "menu_player_weapon_accuracy_increase",
		upgrade = {
			category = "player",
			upgrade = "weapon_accuracy_increase",
			value = 1
		}
	}
	self.definitions.player_weapon_movement_stability_1 = {
		category = "feature",
		name_id = "menu_player_weapon_movement_stability",
		upgrade = {
			category = "player",
			upgrade = "weapon_movement_stability",
			value = 1
		}
	}
	self.definitions.player_hip_fire_accuracy_inc_1 = {
		category = "feature",
		name_id = "menu_player_hip_fire_accuracy_inc",
		upgrade = {
			category = "player",
			upgrade = "hip_fire_accuracy_inc",
			value = 1
		}
	}
	self.definitions.player_automatic_mag_increase_1 = {
		category = "feature",
		name_id = "menu_automatic_mag_increase",
		upgrade = {
			category = "player",
			upgrade = "automatic_mag_increase",
			value = 1
		}
	}
	self.definitions.player_escape_taser_1 = {
		category = "feature",
		name_id = "menu_escape_taser",
		upgrade = {
			category = "player",
			upgrade = "escape_taser",
			value = 1
		}
	}
	self.definitions.player_not_moving_accuracy_increase_bonus_1 = {
		category = "feature",
		name_id = "menu_player_stability_increase_bonus",
		upgrade = {
			category = "player",
			upgrade = "not_moving_accuracy_increase",
			value = 1
		}
	}
	self.definitions.player_cocaine_stacking_1 = {
		category = "feature",
		name_id = "menu_player_cocaine_stacking_1",
		upgrade = {
			category = "player",
			upgrade = "cocaine_stacking",
			value = 1
		}
	}
	self.definitions.player_sync_cocaine_stacks = {
		category = "feature",
		name_id = "menu_player_sync_cocaine_stacks",
		upgrade = {
			category = "player",
			upgrade = "sync_cocaine_stacks",
			value = 1
		}
	}
	self.definitions.player_cocaine_stacks_decay_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_cocaine_stacks_decay_multiplier_1",
		upgrade = {
			category = "player",
			upgrade = "cocaine_stacks_decay_multiplier",
			value = 1
		}
	}
	self.definitions.player_sync_cocaine_upgrade_level_1 = {
		category = "feature",
		name_id = "menu_player_sync_cocaine_upgrade_level_1",
		upgrade = {
			category = "player",
			upgrade = "sync_cocaine_upgrade_level",
			value = 1
		}
	}
	self.definitions.player_cocaine_stack_absorption_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_cocaine_stack_absorption_multiplier_1",
		upgrade = {
			category = "player",
			upgrade = "cocaine_stack_absorption_multiplier",
			value = 1
		}
	}
	self.definitions.player_wild_health_amount_1 = {
		category = "feature",
		name_id = "menu_player_wild_health_amount_1",
		upgrade = {
			category = "player",
			upgrade = "wild_health_amount",
			value = 1
		}
	}
	self.definitions.player_wild_armor_amount_1 = {
		category = "feature",
		name_id = "menu_player_wild_armor_amount_1",
		upgrade = {
			category = "player",
			upgrade = "wild_armor_amount",
			value = 1
		}
	}
	self.definitions.player_less_health_wild_armor_1 = {
		category = "feature",
		name_id = "menu_player_less_health_wild_armor_1",
		upgrade = {
			category = "player",
			upgrade = "less_health_wild_armor",
			value = 1
		}
	}
	self.definitions.player_less_health_wild_cooldown_1 = {
		category = "feature",
		name_id = "menu_player_less_health_wild_cooldown_1",
		upgrade = {
			category = "player",
			upgrade = "less_health_wild_cooldown",
			value = 1
		}
	}
	self.definitions.player_less_armor_wild_health_1 = {
		category = "feature",
		name_id = "menu_player_less_armor_wild_health_1",
		upgrade = {
			category = "player",
			upgrade = "less_armor_wild_health",
			value = 1
		}
	}
	self.definitions.player_less_armor_wild_cooldown_1 = {
		category = "feature",
		name_id = "menu_player_less_armor_wild_cooldown_1",
		upgrade = {
			category = "player",
			upgrade = "less_armor_wild_cooldown",
			value = 1
		}
	}
	self.definitions.temporary_chico_injector_1 = {
		category = "temporary",
		name_id = "menu_temporary_chico_injector_1",
		upgrade = {
			category = "temporary",
			synced = true,
			upgrade = "chico_injector",
			value = 1
		}
	}
	self.definitions.player_chico_armor_multiplier_1 = {
		category = "feature",
		name_id = "menu_player_chico_armor_multiplier_1",
		upgrade = {
			category = "player",
			upgrade = "chico_armor_multiplier",
			value = 1
		}
	}
	self.definitions.player_chico_armor_multiplier_2 = {
		category = "feature",
		name_id = "menu_player_chico_armor_multiplier_1",
		upgrade = {
			category = "player",
			upgrade = "chico_armor_multiplier",
			value = 2
		}
	}
	self.definitions.player_chico_armor_multiplier_3 = {
		category = "feature",
		name_id = "menu_player_chico_armor_multiplier_1",
		upgrade = {
			category = "player",
			upgrade = "chico_armor_multiplier",
			value = 3
		}
	}
	self.definitions.player_chico_preferred_target = {
		category = "feature",
		name_id = "menu_player_chico_preferred_target",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "chico_preferred_target",
			value = 1
		}
	}
	self.definitions.player_chico_injector_low_health_multiplier = {
		category = "feature",
		name_id = "menu_player_chico_injector_low_health_multiplier",
		upgrade = {
			category = "player",
			upgrade = "chico_injector_low_health_multiplier",
			value = 1
		}
	}
	self.definitions.player_chico_injector_health_to_speed = {
		category = "feature",
		name_id = "menu_player_chico_injector_health_to_speed",
		upgrade = {
			category = "player",
			upgrade = "chico_injector_health_to_speed",
			value = 1
		}
	}
	self.definitions.player_dodge_shot_gain = {
		category = "feature",
		name_id = "menu_player_dodge_shot_gain",
		upgrade = {
			category = "player",
			upgrade = "dodge_shot_gain",
			value = 1
		}
	}
	self.definitions.player_dodge_replenish_armor = {
		category = "feature",
		name_id = "menu_player_dodge_replenish_armor",
		upgrade = {
			category = "player",
			upgrade = "dodge_replenish_armor",
			value = 1
		}
	}
	self.definitions.player_smoke_screen_ally_dodge_bonus = {
		category = "feature",
		name_id = "menu_player_smoke_screen_ally_dodge_bonus",
		upgrade = {
			category = "player",
			upgrade = "smoke_screen_ally_dodge_bonus",
			value = 1
		}
	}
	self.definitions.player_sicario_multiplier = {
		category = "feature",
		name_id = "menu_player_sicario_multiplier",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "sicario_multiplier",
			value = 1
		}
	}
	self.definitions.player_pocket_ecm_jammer_base = {
		category = "feature",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "pocket_ecm_jammer_base",
			value = 1
		}
	}
	self.definitions.player_pocket_ecm_kill_dodge_1 = {
		category = "temporary",
		name_id = "menu_player_pocket_ecm_kill_dodge_1",
		upgrade = {
			category = "temporary",
			upgrade = "pocket_ecm_kill_dodge",
			value = 1
		}
	}
	self.definitions.player_pocket_ecm_heal_on_kill_1 = {
		category = "feature",
		name_id = "menu_player_pocket_ecm_heal_on_kill_1",
		upgrade = {
			category = "player",
			upgrade = "pocket_ecm_heal_on_kill",
			value = 1
		}
	}
	self.definitions.team_pocket_ecm_heal_on_kill_1 = {
		category = "feature",
		name_id = "menu_team_pocket_ecm_heal_on_kill_1",
		upgrade = {
			category = "team",
			synced = true,
			upgrade = "pocket_ecm_heal_on_kill",
			value = 1
		}
	}
	self.definitions.player_tag_team_base = {
		category = "feature",
		upgrade = {
			category = "player",
			synced = true,
			upgrade = "tag_team_base",
			value = 1
		}
	}
	self.definitions.player_tag_team_damage_absorption = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "tag_team_damage_absorption",
			value = 1
		}
	}
	self.definitions.player_tag_team_cooldown_drain_1 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "tag_team_cooldown_drain",
			value = 1
		}
	}
	self.definitions.player_tag_team_cooldown_drain_2 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "tag_team_cooldown_drain",
			value = 2
		}
	}
	self.definitions.player_armor_to_health_conversion = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "armor_to_health_conversion",
			value = 1
		}
	}
	self.definitions.player_damage_control_passive = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "damage_control_passive",
			value = 1
		}
	}
	self.definitions.player_damage_control_auto_shrug = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "damage_control_auto_shrug",
			value = 1
		}
	}
	self.definitions.player_damage_control_cooldown_drain_1 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "damage_control_cooldown_drain",
			value = 1
		}
	}
	self.definitions.player_damage_control_cooldown_drain_2 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "damage_control_cooldown_drain",
			value = 2
		}
	}
	self.definitions.player_damage_control_healing = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "damage_control_healing",
			value = 1
		}
	}
	self.definitions.player_warp_health_1 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_health",
			value = 1
		}
	}
	self.definitions.player_warp_health_2 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_health",
			value = 2
		}
	}
	self.definitions.player_warp_health_3 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_health",
			value = 3
		}
	}
	self.definitions.player_warp_health_4 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_health",
			value = 4
		}
	}
	self.definitions.player_warp_health_5 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_health",
			value = 5
		}
	}
	self.definitions.player_warp_armor_1 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor",
			value = 1
		}
	}
	self.definitions.player_warp_armor_2 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor",
			value = 2
		}
	}
	self.definitions.player_warp_armor_3 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor",
			value = 3
		}
	}
	self.definitions.player_warp_armor_4 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor",
			value = 4
		}
	}
	self.definitions.player_warp_armor_5 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor",
			value = 5
		}
	}
	self.definitions.player_warp_dodge_1 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_dodge",
			value = 1
		}
	}
	self.definitions.player_warp_dodge_2 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_dodge",
			value = 2
		}
	}
	self.definitions.player_warp_dodge_3 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_dodge",
			value = 3
		}
	}
	self.definitions.player_warp_dodge_4 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_dodge",
			value = 4
		}
	}
	self.definitions.player_warp_dodge_5 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_dodge",
			value = 5
		}
	}
	self.definitions.player_warp_armor_lite_1 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor_lite",
			value = 1
		}
	}
	self.definitions.player_warp_armor_lite_2 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor_lite",
			value = 2
		}
	}
	self.definitions.player_warp_armor_lite_3 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor_lite",
			value = 3
		}
	}
	self.definitions.player_warp_armor_lite_4 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor_lite",
			value = 4
		}
	}
	self.definitions.player_warp_armor_lite_5 = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "warp_armor_lite",
			value = 5
		}
	}
	self.definitions.player_stamina_ammo_refill_single = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "stamina_ammo_refill_single",
			value = 1
		}
	}
	self.definitions.player_stamina_ammo_refill_auto = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "stamina_ammo_refill_auto",
			value = 1
		}
	}
	self.definitions.player_post_warp_suppression = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "post_warp_suppression",
			value = 1
		}
	}
	self.definitions.player_post_warp_reload_speed = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "post_warp_reload_speed",
			value = 1
		}
	}
	self.definitions.player_run_dodge_chance_vr = {
		category = "feature",
		upgrade = {
			category = "player",
			upgrade = "run_dodge_chance_vr",
			value = 1
		}
	}
	self.definitions.temporary_copr_ability_1 = {
		category = "temporary",
		name_id = "menu_temporary_copr_ability_1",
		upgrade = {
			category = "temporary",
			synced = true,
			upgrade = "copr_ability",
			value = 1
		}
	}
	self.definitions.temporary_copr_ability_2 = {
		category = "temporary",
		name_id = "menu_temporary_copr_ability_2",
		upgrade = {
			category = "temporary",
			synced = true,
			upgrade = "copr_ability",
			value = 2
		}
	}
	self.definitions.player_copr_teammate_heal_1 = {
		category = "feature",
		name_id = "menu_player_copr_teammate_heal",
		upgrade = {
			category = "player",
			upgrade = "copr_teammate_heal",
			value = 1
		}
	}
	self.definitions.player_copr_teammate_heal_2 = {
		category = "feature",
		name_id = "menu_player_copr_teammate_heal",
		upgrade = {
			category = "player",
			upgrade = "copr_teammate_heal",
			value = 2
		}
	}
	self.definitions.player_activate_ability_downed = {
		category = "feature",
		name_id = "menu_player_activate_ability_downed",
		upgrade = {
			category = "player",
			upgrade = "activate_ability_downed",
			value = 1
		}
	}
	self.definitions.player_copr_activate_bonus_health_ratio_1 = {
		category = "feature",
		name_id = "menu_player_copr_activate_bonus_health_ratio_1",
		upgrade = {
			category = "player",
			upgrade = "copr_activate_bonus_health_ratio",
			value = 1
		}
	}
	self.definitions.player_copr_out_of_health_move_slow_1 = {
		category = "feature",
		name_id = "menu_player_copr_out_of_health_move_slow_1",
		upgrade = {
			category = "player",
			upgrade = "copr_out_of_health_move_slow",
			value = 1
		}
	}
	self.definitions.player_copr_speed_up_on_kill_1 = {
		category = "feature",
		name_id = "menu_player_copr_speed_up_on_kill_1",
		upgrade = {
			category = "player",
			upgrade = "copr_speed_up_on_kill",
			value = 1
		}
	}
	self.definitions.player_copr_static_damage_ratio_1 = {
		category = "feature",
		name_id = "menu_player_copr_static_damage_ratio",
		upgrade = {
			category = "player",
			upgrade = "copr_static_damage_ratio",
			value = 1
		}
	}
	self.definitions.player_copr_static_damage_ratio_2 = {
		category = "feature",
		name_id = "menu_player_copr_static_damage_ratio",
		upgrade = {
			category = "player",
			upgrade = "copr_static_damage_ratio",
			value = 2
		}
	}
	self.definitions.player_copr_kill_life_leech_1 = {
		category = "feature",
		name_id = "menu_player_copr_kill_life_leech",
		upgrade = {
			category = "player",
			upgrade = "copr_kill_life_leech",
			value = 1
		}
	}
	self.definitions.player_copr_kill_life_leech_2 = {
		category = "feature",
		name_id = "menu_player_copr_kill_life_leech",
		upgrade = {
			category = "player",
			upgrade = "copr_kill_life_leech",
			value = 2
		}
	}
	self.definitions.toolset = {
		category = "equipment",
		description_text_id = "toolset",
		equipment_id = "toolset",
		icon = "equipment_toolset",
		image = "upgrades_toolset",
		image_slice = "upgrades_toolset_slice",
		name_id = "debug_upgrade_toolset1",
		slot = 2,
		step = 1,
		subtitle_id = "debug_upgrade_toolset1",
		title_id = "debug_upgrade_player_upgrade",
		tree = 4,
		unlock_lvl = 0,
		aquire = {
			upgrade = "toolset1"
		}
	}

	for i, _ in ipairs(self.values.player.toolset) do
		local depends_on = i - 1 > 0 and "toolset" .. i - 1
		local unlock_lvl = 3
		local prio = i == 1 and "high"

		self.definitions["toolset" .. i] = {
			category = "feature",
			description_text_id = "toolset",
			icon = "equipment_toolset",
			image = "upgrades_toolset",
			image_slice = "upgrades_toolset_slice",
			title_id = "debug_upgrade_player_upgrade",
			tree = 4,
			step = self.steps.player.toolset[i],
			subtitle_id = "debug_upgrade_toolset" .. i,
			name_id = "debug_upgrade_toolset" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "player",
				upgrade = "toolset",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_trip_mine_definitions()
	self.definitions.trip_mine = {
		category = "equipment",
		description_text_id = "trip_mine",
		equipment_id = "trip_mine",
		icon = "equipment_trip_mine",
		image = "upgrades_tripmines",
		image_slice = "upgrades_tripmines_slice",
		name_id = "debug_trip_mine",
		prio = "high",
		slot = 1,
		step = 4,
		subtitle_id = "debug_trip_mine",
		title_id = "debug_upgrade_new_equipment",
		tree = 2,
		unlock_lvl = 0
	}
	self.definitions.trip_mine_can_switch_on_off = {
		category = "feature",
		name_id = "menu_trip_mine_can_switch_on_off",
		upgrade = {
			category = "trip_mine",
			upgrade = "can_switch_on_off",
			value = 1
		}
	}
	self.definitions.trip_mine_sensor_toggle = {
		category = "feature",
		name_id = "menu_trip_mine_sensor_toggle",
		upgrade = {
			category = "trip_mine",
			upgrade = "sensor_toggle",
			value = 1
		}
	}
	self.definitions.trip_mine_sensor_highlight = {
		category = "feature",
		name_id = "menu_trip_mine_sensor_toggle",
		upgrade = {
			category = "trip_mine",
			upgrade = "sensor_highlight",
			value = 1
		}
	}
	self.definitions.trip_mine_quantity_increase_1 = {
		category = "feature",
		name_id = "menu_trip_mine_quantity_increase_1",
		upgrade = {
			category = "trip_mine",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.trip_mine_quantity_increase_2 = {
		category = "feature",
		name_id = "menu_trip_mine_quantity_increase_1",
		upgrade = {
			category = "trip_mine",
			upgrade = "quantity",
			value = 2
		}
	}
	self.definitions.trip_mine_explosion_size_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_trip_mine_explosion_size_multiplier",
		upgrade = {
			category = "trip_mine",
			upgrade = "explosion_size_multiplier_1",
			value = 1
		}
	}
	self.definitions.trip_mine_explosion_size_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_trip_mine_explosion_size_multiplier",
		upgrade = {
			category = "trip_mine",
			upgrade = "explosion_size_multiplier_2",
			value = 1
		}
	}
	self.definitions.trip_mine_explode_timer_delay = {
		category = "feature",
		incremental = true,
		name_id = "menu_trip_mine_explode_timer_delay",
		upgrade = {
			category = "trip_mine",
			upgrade = "explode_timer_delay",
			value = 1
		}
	}
	self.definitions.trip_mine_fire_trap_1 = {
		category = "feature",
		name_id = "menu_trip_mine_fire_trap",
		upgrade = {
			category = "trip_mine",
			upgrade = "fire_trap",
			value = 1
		}
	}
	self.definitions.trip_mine_fire_trap_2 = {
		category = "feature",
		name_id = "menu_trip_mine_fire_trap",
		upgrade = {
			category = "trip_mine",
			upgrade = "fire_trap",
			value = 2
		}
	}
	self.definitions.shape_charge_quantity_increase_1 = {
		category = "feature",
		name_id = "menu_shape_charge_quantity_increase",
		upgrade = {
			category = "shape_charge",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.shape_charge_quantity_increase_2 = {
		category = "feature",
		name_id = "menu_shape_charge_quantity_increase",
		upgrade = {
			category = "shape_charge",
			upgrade = "quantity",
			value = 2
		}
	}
	self.definitions.trip_mine_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_trip_mine_damage_multiplier",
		upgrade = {
			category = "trip_mine",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
end

function UpgradesTweakData:_ecm_jammer_definitions()
	self.definitions.ecm_jammer = {
		category = "equipment",
		equipment_id = "ecm_jammer",
		name_id = "menu_equipment_ecm_jammer",
		slot = 1
	}
	self.definitions.ecm_jammer_can_activate_feedback = {
		category = "feature",
		name_id = "menu_ecm_jammer_can_activate_feedback",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "can_activate_feedback",
			value = 1
		}
	}
	self.definitions.ecm_jammer_can_open_sec_doors = {
		category = "feature",
		name_id = "menu_ecm_jammer_can_open_sec_doors",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "can_open_sec_doors",
			value = 1
		}
	}
	self.definitions.ecm_jammer_quantity_increase_1 = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_quantity_1",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.ecm_jammer_quantity_increase_2 = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_quantity_2",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "quantity",
			value = 2
		}
	}
	self.definitions.ecm_jammer_duration_multiplier = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_duration_multiplier",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "duration_multiplier",
			value = 1
		}
	}
	self.definitions.ecm_jammer_duration_multiplier_2 = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_duration_multiplier",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "duration_multiplier_2",
			value = 1
		}
	}
	self.definitions.ecm_jammer_affects_cameras = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_affects_cameras",
		upgrade = {
			category = "ecm_jammer",
			synced = true,
			upgrade = "affects_cameras",
			value = 1
		}
	}
	self.definitions.ecm_jammer_affects_pagers = {
		category = "equipment_upgrade",
		name_id = "",
		upgrade = {
			category = "ecm_jammer",
			synced = true,
			upgrade = "affects_pagers",
			value = 1
		}
	}
	self.definitions.ecm_jammer_feedback_duration_boost = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_feedback_duration_boost",
		upgrade = {
			category = "ecm_jammer",
			synced = true,
			upgrade = "feedback_duration_boost",
			value = 1
		}
	}
	self.definitions.ecm_jammer_feedback_duration_boost_2 = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_feedback_duration_boost_2",
		upgrade = {
			category = "ecm_jammer",
			synced = true,
			upgrade = "feedback_duration_boost_2",
			value = 1
		}
	}
	self.definitions.ecm_jammer_interaction_speed_multiplier = {
		category = "equipment_upgrade",
		name_id = "menu_ecm_jammer_interaction_speed_multiplier",
		upgrade = {
			category = "ecm_jammer",
			upgrade = "interaction_speed_multiplier",
			value = 1
		}
	}
	self.definitions.ecm_jammer_can_retrigger = {
		category = "feature",
		name_id = "menu_ecm_jammer_can_retrigger",
		upgrade = {
			category = "ecm_jammer",
			synced = true,
			upgrade = "can_retrigger",
			value = 1
		}
	}
end

function UpgradesTweakData:_ammo_bag_definitions()
	self.definitions.ammo_bag = {
		category = "equipment",
		description_text_id = "ammo_bag",
		equipment_id = "ammo_bag",
		icon = "equipment_ammo_bag",
		image = "upgrades_ammobag",
		image_slice = "upgrades_ammobag_slice",
		name_id = "debug_ammo_bag",
		prio = "high",
		slot = 1,
		step = 2,
		subtitle_id = "debug_ammo_bag",
		title_id = "debug_upgrade_new_equipment",
		tree = 1,
		unlock_lvl = 0
	}

	for i, _ in ipairs(self.values.ammo_bag.ammo_increase) do
		local depends_on = i - 1 > 0 and "ammo_bag_ammo_increase" .. i - 1 or "ammo_bag"
		local unlock_lvl = 11
		local prio = i == 1 and "high"

		self.definitions["ammo_bag_ammo_increase" .. i] = {
			category = "equipment_upgrade",
			description_text_id = "ammo_bag_increase",
			icon = "equipment_ammo_bag",
			image = "upgrades_ammobag",
			image_slice = "upgrades_ammobag_slice",
			title_id = "debug_ammo_bag",
			tree = 1,
			step = self.steps.ammo_bag.ammo_increase[i],
			name_id = "debug_upgrade_ammo_bag_ammo_increase" .. i,
			subtitle_id = "debug_upgrade_amount_increase" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ammo_bag",
				upgrade = "ammo_increase",
				value = i
			}
		}
	end

	self.definitions.ammo_bag_quantity = {
		category = "equipment_upgrade",
		name_id = "menu_ammo_bag_quantity",
		upgrade = {
			category = "ammo_bag",
			upgrade = "quantity",
			value = 1
		}
	}
end

function UpgradesTweakData:_doctor_bag_definitions()
	self.definitions.doctor_bag = {
		category = "equipment",
		description_text_id = "doctor_bag",
		equipment_id = "doctor_bag",
		icon = "equipment_doctor_bag",
		image = "upgrades_doctorbag",
		image_slice = "upgrades_doctorbag_slice",
		name_id = "debug_doctor_bag",
		prio = "high",
		slot = 1,
		step = 5,
		subtitle_id = "debug_doctor_bag",
		title_id = "debug_upgrade_new_equipment",
		tree = 3,
		unlock_lvl = 2
	}

	for i, _ in ipairs(self.values.doctor_bag.amount_increase) do
		local depends_on = i - 1 > 0 and "doctor_bag_amount_increase" .. i - 1 or "doctor_bag"
		local unlock_lvl = 3
		local prio = i == 1 and "high"

		self.definitions["doctor_bag_amount_increase" .. i] = {
			category = "equipment_upgrade",
			description_text_id = "doctor_bag_increase",
			icon = "equipment_doctor_bag",
			image = "upgrades_doctorbag",
			image_slice = "upgrades_doctorbag_slice",
			title_id = "debug_doctor_bag",
			tree = 3,
			step = self.steps.doctor_bag.amount_increase[i],
			name_id = "debug_upgrade_doctor_bag_amount_increase" .. i,
			subtitle_id = "debug_upgrade_amount_increase" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "doctor_bag",
				upgrade = "amount_increase",
				value = i
			}
		}
	end

	self.definitions.doctor_bag_quantity = {
		category = "equipment_upgrade",
		name_id = "menu_doctor_bag_quantity",
		upgrade = {
			category = "doctor_bag",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.passive_doctor_bag_interaction_speed_multiplier = {
		category = "feature",
		name_id = "menu_passive_doctor_bag_interaction_speed_multiplier",
		upgrade = {
			category = "doctor_bag",
			upgrade = "interaction_speed_multiplier",
			value = 1
		}
	}
end

function UpgradesTweakData:_cable_tie_definitions()
	self.definitions.cable_tie = {
		category = "equipment",
		equipment_id = "cable_tie",
		icon = "equipment_cable_ties",
		image = "upgrades_extracableties",
		image_slice = "upgrades_extracableties_slice",
		name_id = "debug_equipment_cable_tie",
		prio = "high",
		title_id = "debug_equipment_cable_tie",
		unlock_lvl = 0
	}
	self.definitions.extra_cable_tie = {
		category = "equipment",
		description_text_id = "extra_cable_tie",
		equipment_id = "extra_cable_tie",
		icon = "equipment_extra_cable_ties",
		image = "upgrades_extracableties",
		image_slice = "upgrades_extracableties_slice",
		name_id = "debug_upgrade_extra_cable_tie_quantity1",
		prio = "high",
		slot = 2,
		step = 4,
		subtitle_id = "debug_upgrade_amount_increase1",
		title_id = "debug_equipment_cable_tie",
		tree = 1,
		unlock_lvl = 3,
		aquire = {
			upgrade = "extra_cable_tie_quantity1"
		}
	}

	for i, _ in ipairs(self.values.extra_cable_tie.quantity) do
		local depends_on = i - 1 > 0 and "extra_cable_tie_quantity" .. i - 1 or "extra_cable_tie"
		local unlock_lvl = 4
		local prio = i == 1 and "high"

		self.definitions["extra_cable_tie_quantity" .. i] = {
			category = "equipment_upgrade",
			description_text_id = "extra_cable_tie",
			icon = "equipment_extra_cable_ties",
			image = "upgrades_extracableties",
			image_slice = "upgrades_extracableties_slice",
			title_id = "debug_equipment_cable_tie",
			tree = 1,
			step = self.steps.extra_cable_tie.quantity[i],
			name_id = "debug_upgrade_extra_cable_tie_quantity" .. i,
			subtitle_id = "debug_upgrade_amount_increase" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "extra_cable_tie",
				upgrade = "quantity",
				value = i
			}
		}
	end

	self.definitions.cable_tie_quantity = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_quantity",
		upgrade = {
			category = "cable_tie",
			upgrade = "quantity_1",
			value = 1
		}
	}
	self.definitions.cable_tie_quantity_2 = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_quantity_2",
		upgrade = {
			category = "cable_tie",
			upgrade = "quantity_2",
			value = 1
		}
	}
	self.definitions.cable_tie_interact_speed_multiplier = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_interact_speed_multiplier",
		upgrade = {
			category = "cable_tie",
			upgrade = "interact_speed_multiplier",
			value = 1
		}
	}
	self.definitions.cable_tie_can_cable_tie_doors = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_can_cable_tie_doors",
		upgrade = {
			category = "cable_tie",
			upgrade = "can_cable_tie_doors",
			value = 1
		}
	}
	self.definitions.cable_tie_quantity_unlimited = {
		category = "equipment_upgrade",
		name_id = "menu_cable_tie_quantity_unlimited",
		upgrade = {
			category = "cable_tie",
			upgrade = "quantity_unlimited",
			value = 1
		}
	}
end

function UpgradesTweakData:_armor_kit_definitions()
	self.definitions.armor_kit = {
		category = "equipment",
		equipment_id = "armor_kit",
		name_id = "menu_equipment_armor_kit",
		slot = 1
	}
end

function UpgradesTweakData:_sentry_gun_definitions()
	self.definitions.sentry_gun = {
		category = "equipment",
		description_text_id = "sentry_gun",
		equipment_id = "sentry_gun",
		icon = "equipment_sentry",
		image = "upgrades_sentry",
		image_slice = "upgrades_sentry_slice",
		name_id = "debug_sentry_gun",
		prio = "high",
		slot = 1,
		step = 5,
		subtitle_id = "debug_sentry_gun",
		title_id = "debug_upgrade_new_equipment",
		tree = 4,
		unlock_lvl = 0
	}
	self.definitions.sentry_gun_silent = {
		category = "equipment",
		description_text_id = "sentry_gun",
		equipment_id = "sentry_gun_silent",
		icon = "equipment_sentry",
		image = "upgrades_sentry",
		image_slice = "upgrades_sentry_slice",
		name_id = "debug_silent_sentry_gun",
		prio = "high",
		slot = 1,
		step = 6,
		subtitle_id = "debug_sentry_gun",
		title_id = "debug_upgrade_new_equipment",
		tree = 4,
		unlock_lvl = 0
	}
	self.definitions.sentry_gun_quantity_1 = {
		category = "feature",
		name_id = "menu_sentry_gun_quantity_increase",
		upgrade = {
			category = "sentry_gun",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.sentry_gun_quantity_2 = {
		category = "feature",
		name_id = "menu_sentry_gun_quantity_increase",
		upgrade = {
			category = "sentry_gun",
			upgrade = "quantity",
			value = 2
		}
	}
	self.definitions.sentry_gun_damage_multiplier = {
		category = "feature",
		name_id = "menu_sentry_gun_damage_multiplier",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_extra_ammo_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_sentry_gun_extra_ammo_multiplier",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "extra_ammo_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_extra_ammo_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_sentry_gun_extra_ammo_multiplier",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "extra_ammo_multiplier",
			value = 2
		}
	}
	self.definitions.sentry_gun_armor_multiplier = {
		category = "feature",
		name_id = "menu_sentry_gun_armor_multiplier",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "armor_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_armor_multiplier2 = {
		category = "feature",
		name_id = "menu_sentry_gun_armor_multiplier",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "armor_multiplier2",
			value = 1
		}
	}
	self.definitions.sentry_gun_spread_multiplier = {
		category = "feature",
		name_id = "menu_sentry_gun_spread_multiplier",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "spread_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_rot_speed_multiplier = {
		category = "feature",
		name_id = "menu_sentry_gun_rot_speed_multiplier",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "rot_speed_multiplier",
			value = 1
		}
	}
	self.definitions.sentry_gun_shield = {
		category = "feature",
		name_id = "menu_sentry_gun_shield",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "shield",
			value = 1
		}
	}
	self.definitions.sentry_gun_can_revive = {
		category = "feature",
		name_id = "menu_sentry_gun_can_revive",
		upgrade = {
			category = "sentry_gun",
			upgrade = "can_revive",
			value = 1
		}
	}
	self.definitions.sentry_gun_can_reload = {
		category = "feature",
		name_id = "menu_sentry_gun_can_reload",
		upgrade = {
			category = "sentry_gun",
			upgrade = "can_reload",
			value = 1
		}
	}
	self.definitions.sentry_gun_armor_piercing_chance = {
		category = "feature",
		name_id = "menu_sentry_gun_armor_piercing_chance",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "armor_piercing_chance",
			value = 1
		}
	}
	self.definitions.sentry_gun_armor_piercing_chance_2 = {
		category = "feature",
		name_id = "menu_sentry_gun_armor_piercing_chance_2",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "armor_piercing_chance_2",
			value = 1
		}
	}
	self.definitions.sentry_gun_cost_reduction_1 = {
		category = "feature",
		name_id = "menu_sentry_gun_cost_reduction",
		upgrade = {
			category = "sentry_gun",
			upgrade = "cost_reduction",
			value = 1
		}
	}
	self.definitions.sentry_gun_cost_reduction_2 = {
		category = "feature",
		name_id = "menu_sentry_gun_cost_reduction",
		upgrade = {
			category = "sentry_gun",
			upgrade = "cost_reduction",
			value = 2
		}
	}
	self.definitions.sentry_gun_less_noisy = {
		category = "feature",
		name_id = "menu_sentry_gun_less_noisy",
		upgrade = {
			category = "sentry_gun",
			upgrade = "less_noisy",
			value = 1
		}
	}
	self.definitions.sentry_gun_fire_rate_reduction_1 = {
		category = "feature",
		name_id = "menu_sentry_gun_fire_rate_reduction",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "fire_rate_reduction",
			value = 1
		}
	}
	self.definitions.sentry_gun_ap_bullets = {
		category = "feature",
		name_id = "menu_sentry_gun_ap_bullets",
		upgrade = {
			category = "sentry_gun",
			synced = true,
			upgrade = "ap_bullets",
			value = 1
		}
	}
end

function UpgradesTweakData:_rep_definitions()
	local rep_upgrades = self.values.rep_upgrades

	for index, rep_class in ipairs(rep_upgrades.classes) do
		for i = 1, 10 do
			self.definitions[rep_class .. i] = {
				category = "rep_upgrade",
				value = rep_upgrades.values[index]
			}
		end
	end
end

function UpgradesTweakData:_c45_definitions()
	self.definitions.c45 = {
		category = "weapon",
		description_text_id = "des_c45",
		icon = "c45",
		image = "upgrades_45",
		image_slice = "upgrades_45_slice",
		name_id = "debug_c45",
		prio = "high",
		step = 13,
		subtitle_id = "debug_c45_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 1,
		unlock_lvl = 30,
		unit_name = Idstring("units/weapons/c45/c45")
	}

	for i, _ in ipairs(self.values.c45.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "c45_mag" .. i - 1 or "c45"
		local unlock_lvl = 31
		local prio = i == 1 and "high"

		self.definitions["c45_mag" .. i] = {
			category = "feature",
			description_text_id = "clip_ammo_increase",
			icon = "c45",
			image = "upgrades_45",
			image_slice = "upgrades_45_slice",
			title_id = "debug_c45_short",
			tree = 1,
			step = self.steps.c45.clip_ammo_increase[i],
			name_id = "debug_upgrade_c45_mag" .. i,
			subtitle_id = "debug_upgrade_mag" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "c45",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.c45.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "c45_recoil" .. i - 1 or "c45"
		local unlock_lvl = 31
		local prio = i == 1 and "high"

		self.definitions["c45_recoil" .. i] = {
			category = "feature",
			description_text_id = "recoil_multiplier",
			icon = "c45",
			image = "upgrades_45",
			image_slice = "upgrades_45_slice",
			title_id = "debug_c45_short",
			tree = 1,
			step = self.steps.c45.recoil_multiplier[i],
			name_id = "debug_upgrade_c45_recoil" .. i,
			subtitle_id = "debug_upgrade_recoil" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "c45",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.c45.damage_multiplier) do
		local depends_on = i - 1 > 0 and "c45_damage" .. i - 1 or "c45"
		local unlock_lvl = 31
		local prio = i == 1 and "high"

		self.definitions["c45_damage" .. i] = {
			category = "feature",
			description_text_id = "damage_multiplier",
			icon = "c45",
			image = "upgrades_45",
			image_slice = "upgrades_45_slice",
			title_id = "debug_c45_short",
			tree = 1,
			step = self.steps.c45.damage_multiplier[i],
			name_id = "debug_upgrade_c45_damage" .. i,
			subtitle_id = "debug_upgrade_damage" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "c45",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_beretta92_definitions()
	self.definitions.beretta92 = {
		category = "weapon",
		description_text_id = "des_beretta92",
		icon = "beretta92",
		image = "upgrades_m9sd",
		image_slice = "upgrades_m9sd_slice",
		name_id = "debug_beretta92",
		prio = "high",
		subtitle_id = "debug_beretta92_short",
		title_id = "debug_upgrade_new_weapon",
		unlock_lvl = 0,
		weapon_id = "beretta92",
		unit_name = Idstring("units/weapons/beretta92/beretta92")
	}

	for i, _ in ipairs(self.values.beretta92.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "beretta_mag" .. i - 1 or "beretta92"
		local unlock_lvl = 2
		local prio = i == 1 and "high"

		self.definitions["beretta_mag" .. i] = {
			category = "feature",
			description_text_id = "clip_ammo_increase",
			icon = "beretta92",
			image = "upgrades_m9sd",
			image_slice = "upgrades_m9sd_slice",
			title_id = "debug_beretta92_short",
			tree = 1,
			step = self.steps.beretta92.clip_ammo_increase[i],
			name_id = "debug_upgrade_beretta_mag" .. i,
			subtitle_id = "debug_upgrade_mag" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "beretta92",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.beretta92.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "beretta_recoil" .. i - 1 or "beretta92"
		local unlock_lvl = 2
		local prio = i == 1 and "high"

		self.definitions["beretta_recoil" .. i] = {
			category = "feature",
			description_text_id = "recoil_multiplier",
			icon = "beretta92",
			image = "upgrades_m9sd",
			image_slice = "upgrades_m9sd_slice",
			title_id = "debug_beretta92_short",
			tree = 2,
			step = self.steps.beretta92.recoil_multiplier[i],
			name_id = "debug_upgrade_beretta_recoil" .. i,
			subtitle_id = "debug_upgrade_recoil" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "beretta92",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.beretta92.spread_multiplier) do
		local depends_on = i - 1 > 0 and "beretta_spread" .. i - 1 or "beretta92"
		local unlock_lvl = 2
		local prio = i == 1 and "high"

		self.definitions["beretta_spread" .. i] = {
			category = "feature",
			description_text_id = "spread_multiplier",
			icon = "beretta92",
			image = "upgrades_m9sd",
			image_slice = "upgrades_m9sd_slice",
			title_id = "debug_beretta92_short",
			tree = 3,
			step = self.steps.beretta92.spread_multiplier[i],
			name_id = "debug_upgrade_beretta_spread" .. i,
			subtitle_id = "debug_upgrade_spread" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "beretta92",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_raging_bull_definitions()
	self.definitions.raging_bull = {
		category = "weapon",
		description_text_id = "des_raging_bull",
		icon = "raging_bull",
		image = "upgrades_ragingbull",
		image_slice = "upgrades_ragingbull_slice",
		name_id = "debug_raging_bull",
		prio = "high",
		step = 6,
		subtitle_id = "debug_raging_bull_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 3,
		unlock_lvl = 60,
		weapon_id = "raging_bull",
		unit_name = Idstring("units/weapons/raging_bull/raging_bull")
	}

	for i, _ in ipairs(self.values.raging_bull.spread_multiplier) do
		local depends_on = i - 1 > 0 and "raging_bull_spread" .. i - 1
		local unlock_lvl = 61
		local prio = i == 1 and "high"

		self.definitions["raging_bull_spread" .. i] = {
			category = "feature",
			description_text_id = "spread_multiplier",
			icon = "raging_bull",
			image = "upgrades_ragingbull",
			image_slice = "upgrades_ragingbull_slice",
			title_id = "debug_raging_bull_short",
			tree = 3,
			step = self.steps.raging_bull.spread_multiplier[i],
			name_id = "debug_upgrade_raging_bull_spread" .. i,
			subtitle_id = "debug_upgrade_spread" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "raging_bull",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.raging_bull.reload_speed_multiplier) do
		local depends_on = i - 1 > 0 and "raging_bull_reload_speed" .. i - 1 or "raging_bull"
		local unlock_lvl = 61
		local prio = i == 1 and "high"

		self.definitions["raging_bull_reload_speed" .. i] = {
			category = "feature",
			description_text_id = "reload_speed_multiplier",
			icon = "raging_bull",
			image = "upgrades_ragingbull",
			image_slice = "upgrades_ragingbull_slice",
			title_id = "debug_raging_bull_short",
			tree = 3,
			step = self.steps.raging_bull.reload_speed_multiplier[i],
			name_id = "debug_upgrade_raging_bull_reload_speed" .. i,
			subtitle_id = "debug_upgrade_reload_speed" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "raging_bull",
				upgrade = "reload_speed_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.raging_bull.damage_multiplier) do
		local depends_on = i - 1 > 0 and "raging_bull_damage" .. i - 1 or "raging_bull"
		local unlock_lvl = 61
		local prio = i == 1 and "high"

		self.definitions["raging_bull_damage" .. i] = {
			category = "feature",
			description_text_id = "damage_multiplier",
			icon = "raging_bull",
			image = "upgrades_ragingbull",
			image_slice = "upgrades_ragingbull_slice",
			title_id = "debug_raging_bull_short",
			tree = 3,
			step = self.steps.raging_bull.damage_multiplier[i],
			name_id = "debug_upgrade_raging_bull_damage" .. i,
			subtitle_id = "debug_upgrade_damage" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "raging_bull",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_olympic_definitions()
	self.definitions.olympic = {
		category = "weapon",
		factory_id = "wpn_fps_smg_olympic",
		weapon_id = "olympic"
	}
	self.definitions.olympic_primary = {
		category = "weapon",
		factory_id = "wpn_fps_smg_olympic_primary",
		weapon_id = "olympic_primary"
	}
end

function UpgradesTweakData:_amcar_definitions()
	self.definitions.amcar = {
		category = "weapon",
		factory_id = "wpn_fps_ass_amcar",
		free = true,
		weapon_id = "amcar"
	}
end

function UpgradesTweakData:_m16_definitions()
	self.definitions.m16 = {
		category = "weapon",
		factory_id = "wpn_fps_ass_m16",
		weapon_id = "m16"
	}
end

function UpgradesTweakData:_new_m4_definitions()
	self.definitions.new_m4 = {
		category = "weapon",
		factory_id = "wpn_fps_ass_m4",
		weapon_id = "new_m4"
	}
	self.definitions.m4_secondary = {
		category = "weapon",
		factory_id = "wpn_fps_ass_m4_secondary",
		weapon_id = "m4_secondary"
	}
end

function UpgradesTweakData:_sko12_weapon_definitions()
	self.definitions.sko12 = {
		category = "weapon",
		dlc = "pxp2",
		factory_id = "wpn_fps_sho_sko12",
		weapon_id = "sko12"
	}
end

function UpgradesTweakData:_glock_18c_definitions()
	self.definitions.glock_18c = {
		category = "weapon",
		factory_id = "wpn_fps_pis_g18c",
		weapon_id = "glock_18c"
	}
	self.definitions.glock_18c_primary = {
		category = "weapon",
		factory_id = "wpn_fps_pis_g18c_primary",
		weapon_id = "glock_18c_primary"
	}
end

function UpgradesTweakData:_saiga_definitions()
	self.definitions.saiga = {
		category = "weapon",
		factory_id = "wpn_fps_shot_saiga",
		weapon_id = "saiga"
	}
end

function UpgradesTweakData:_akmsu_definitions()
	self.definitions.akmsu = {
		category = "weapon",
		factory_id = "wpn_fps_smg_akmsu",
		weapon_id = "akmsu"
	}
	self.definitions.akmsu_primary = {
		category = "weapon",
		factory_id = "wpn_fps_smg_akmsu_primary",
		weapon_id = "akmsu_primary"
	}
end

function UpgradesTweakData:_ak74_definitions()
	self.definitions.ak74 = {
		category = "weapon",
		factory_id = "wpn_fps_ass_74",
		weapon_id = "ak74"
	}
	self.definitions.ak74_secondary = {
		category = "weapon",
		factory_id = "wpn_fps_ass_74_secondary",
		weapon_id = "ak74_secondary"
	}
end

function UpgradesTweakData:_akm_definitions()
	self.definitions.akm = {
		category = "weapon",
		factory_id = "wpn_fps_ass_akm",
		weapon_id = "akm"
	}
end

function UpgradesTweakData:_akm_gold_definitions()
	self.definitions.akm_gold = {
		category = "weapon",
		dlc = "pd2_clan",
		factory_id = "wpn_fps_ass_akm_gold",
		weapon_id = "akm_gold"
	}
end

function UpgradesTweakData:_ak5_definitions()
	self.definitions.ak5 = {
		category = "weapon",
		factory_id = "wpn_fps_ass_ak5",
		weapon_id = "ak5"
	}
end

function UpgradesTweakData:_aug_definitions()
	self.definitions.aug = {
		category = "weapon",
		factory_id = "wpn_fps_ass_aug",
		weapon_id = "aug"
	}
	self.definitions.aug_secondary = {
		category = "weapon",
		factory_id = "wpn_fps_ass_aug_secondary",
		weapon_id = "aug_secondary"
	}
end

function UpgradesTweakData:_g36_definitions()
	self.definitions.g36 = {
		category = "weapon",
		factory_id = "wpn_fps_ass_g36",
		weapon_id = "g36"
	}
end

function UpgradesTweakData:_p90_definitions()
	self.definitions.p90 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_p90",
		weapon_id = "p90"
	}
end

function UpgradesTweakData:_new_m14_definitions()
	self.definitions.new_m14 = {
		category = "weapon",
		factory_id = "wpn_fps_ass_m14",
		weapon_id = "new_m14"
	}
end

function UpgradesTweakData:_mp9_definitions()
	self.definitions.mp9 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_mp9",
		weapon_id = "mp9"
	}
end

function UpgradesTweakData:_deagle_definitions()
	self.definitions.deagle = {
		category = "weapon",
		factory_id = "wpn_fps_pis_deagle",
		weapon_id = "deagle"
	}
	self.definitions.deagle_primary = {
		category = "weapon",
		factory_id = "wpn_fps_pis_deagle_primary",
		weapon_id = "deagle_primary"
	}
end

function UpgradesTweakData:_new_mp5_definitions()
	self.definitions.new_mp5 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_mp5",
		weapon_id = "new_mp5"
	}
end

function UpgradesTweakData:_colt_1911_definitions()
	self.definitions.colt_1911 = {
		category = "weapon",
		factory_id = "wpn_fps_pis_1911",
		weapon_id = "colt_1911"
	}
	self.definitions.colt_1911_primary = {
		category = "weapon",
		factory_id = "wpn_fps_pis_1911_primary",
		weapon_id = "colt_1911_primary"
	}
end

function UpgradesTweakData:_mac10_definitions()
	self.definitions.mac10 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_mac10",
		weapon_id = "mac10"
	}
end

function UpgradesTweakData:_glock_17_definitions()
	self.definitions.glock_17 = {
		category = "weapon",
		factory_id = "wpn_fps_pis_g17",
		free = true,
		weapon_id = "glock_17"
	}
end

function UpgradesTweakData:_b92fs_definitions()
	self.definitions.b92fs = {
		category = "weapon",
		factory_id = "wpn_fps_pis_beretta",
		weapon_id = "b92fs"
	}
	self.definitions.b92fs_primary = {
		category = "weapon",
		factory_id = "wpn_fps_pis_beretta_primary",
		weapon_id = "b92fs_primary"
	}
end

function UpgradesTweakData:_huntsman_definitions()
	self.definitions.huntsman = {
		category = "weapon",
		factory_id = "wpn_fps_shot_huntsman",
		weapon_id = "huntsman"
	}
end

function UpgradesTweakData:_r870_definitions()
	self.definitions.r870 = {
		category = "weapon",
		factory_id = "wpn_fps_shot_r870",
		weapon_id = "r870"
	}
end

function UpgradesTweakData:_serbu_definitions()
	self.definitions.serbu = {
		category = "weapon",
		factory_id = "wpn_fps_shot_serbu",
		weapon_id = "serbu"
	}
end

function UpgradesTweakData:_new_raging_bull_definitions()
	self.definitions.new_raging_bull = {
		category = "weapon",
		factory_id = "wpn_fps_pis_rage",
		weapon_id = "new_raging_bull"
	}
	self.definitions.raging_bull_primary = {
		category = "weapon",
		factory_id = "wpn_fps_pis_rage_primary",
		weapon_id = "raging_bull_primary"
	}
end

function UpgradesTweakData:_saw_definitions()
	self.definitions.saw = {
		category = "weapon",
		factory_id = "wpn_fps_saw",
		weapon_id = "saw"
	}
	self.definitions.saw_secondary = {
		category = "weapon",
		factory_id = "wpn_fps_saw_secondary",
		weapon_id = "saw_secondary"
	}
	self.definitions.saw_extra_ammo_multiplier = {
		category = "feature",
		name_id = "menu_saw_extra_ammo_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "extra_ammo_multiplier",
			value = 1
		}
	}
	self.definitions.saw_enemy_slicer = {
		category = "feature",
		name_id = "menu_saw_enemy_slicer",
		upgrade = {
			category = "saw",
			upgrade = "enemy_slicer",
			value = 1
		}
	}
	self.definitions.saw_recoil_multiplier = {
		category = "feature",
		name_id = "menu_saw_recoil_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.saw_fire_rate_multiplier_1 = {
		category = "feature",
		name_id = "menu_saw_fire_rate_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.saw_fire_rate_multiplier_2 = {
		category = "feature",
		name_id = "menu_saw_fire_rate_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "fire_rate_multiplier",
			value = 2
		}
	}
	self.definitions.saw_lock_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_lock_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "lock_damage_multiplier",
			value = 1
		}
	}
	self.definitions.saw_lock_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_lock_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "lock_damage_multiplier",
			value = 2
		}
	}
	self.definitions.saw_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_saw_hip_fire_spread_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.saw_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_saw_hip_fire_damage_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.saw_armor_piercing_chance = {
		category = "feature",
		name_id = "menu_saw_armor_piercing_chance",
		upgrade = {
			category = "saw",
			upgrade = "armor_piercing_chance",
			value = 1
		}
	}
	self.definitions.saw_swap_speed_multiplier = {
		category = "feature",
		name_id = "menu_saw_swap_speed_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.saw_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_saw_reload_speed_multiplier",
		upgrade = {
			category = "saw",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.saw_melee_knockdown_mul = {
		category = "feature",
		name_id = "menu_saw_melee_knockdown_mul",
		upgrade = {
			category = "saw",
			upgrade = "melee_knockdown_mul",
			value = 1
		}
	}
	self.definitions.saw_ignore_shields_1 = {
		category = "feature",
		name_id = "menu_saw_ignore_shields",
		upgrade = {
			category = "saw",
			upgrade = "ignore_shields",
			value = 1
		}
	}
	self.definitions.saw_panic_when_kill_1 = {
		category = "feature",
		name_id = "menu_saw_panic_when_kill",
		upgrade = {
			category = "saw",
			upgrade = "panic_when_kill",
			value = 1
		}
	}
end

function UpgradesTweakData:_usp_definitions()
	self.definitions.usp = {
		category = "weapon",
		dlc = "pd2_clan",
		factory_id = "wpn_fps_pis_usp",
		weapon_id = "usp"
	}
end

function UpgradesTweakData:_g22c_definitions()
	self.definitions.g22c = {
		category = "weapon",
		dlc = "pd2_clan",
		factory_id = "wpn_fps_pis_g22c",
		weapon_id = "g22c"
	}
end

function UpgradesTweakData:_judge_definitions()
	self.definitions.judge = {
		category = "weapon",
		dlc = "pd2_clan",
		factory_id = "wpn_fps_pis_judge",
		weapon_id = "judge"
	}
end

function UpgradesTweakData:_m45_definitions()
	self.definitions.m45 = {
		category = "weapon",
		dlc = "armored_transport",
		factory_id = "wpn_fps_smg_m45",
		weapon_id = "m45"
	}
end

function UpgradesTweakData:_s552_definitions()
	self.definitions.s552 = {
		category = "weapon",
		dlc = "armored_transport",
		factory_id = "wpn_fps_ass_s552",
		weapon_id = "s552"
	}
	self.definitions.s552_secondary = {
		category = "weapon",
		dlc = "armored_transport",
		factory_id = "wpn_fps_ass_s552_secondary",
		weapon_id = "s552_secondary"
	}
end

function UpgradesTweakData:_ppk_definitions()
	self.definitions.ppk = {
		category = "weapon",
		dlc = "armored_transport",
		factory_id = "wpn_fps_pis_ppk",
		weapon_id = "ppk"
	}
end

function UpgradesTweakData:_mp7_definitions()
	self.definitions.mp7 = {
		category = "weapon",
		dlc = "gage_pack",
		factory_id = "wpn_fps_smg_mp7",
		weapon_id = "mp7"
	}
end

function UpgradesTweakData:_scar_definitions()
	self.definitions.scar = {
		category = "weapon",
		dlc = "gage_pack",
		factory_id = "wpn_fps_ass_scar",
		weapon_id = "scar"
	}
end

function UpgradesTweakData:_p226_definitions()
	self.definitions.p226 = {
		category = "weapon",
		dlc = "gage_pack",
		factory_id = "wpn_fps_pis_p226",
		weapon_id = "p226"
	}
end

function UpgradesTweakData:_hk21_definitions()
	self.definitions.hk21 = {
		category = "weapon",
		dlc = "gage_pack_lmg",
		factory_id = "wpn_fps_lmg_hk21",
		weapon_id = "hk21"
	}
end

function UpgradesTweakData:_hk51b_definitions()
	self.definitions.hk51b = {
		category = "weapon",
		dlc = "pxp1",
		factory_id = "wpn_fps_lmg_hk51b",
		weapon_id = "hk51b"
	}
end

function UpgradesTweakData:_tkb_definitions()
	self.definitions.tkb = {
		category = "weapon",
		dlc = "pxp3",
		factory_id = "wpn_fps_ass_tkb",
		weapon_id = "tkb"
	}
end

function UpgradesTweakData:_contender_definitions()
	self.definitions.contender = {
		category = "weapon",
		dlc = "pxp3",
		factory_id = "wpn_fps_snp_contender",
		weapon_id = "contender"
	}
end

function UpgradesTweakData:_hcar_definitions()
	self.definitions.hcar = {
		category = "weapon",
		dlc = "pxp3",
		factory_id = "wpn_fps_lmg_hcar",
		weapon_id = "hcar"
	}
end

function UpgradesTweakData:_m249_definitions()
	self.definitions.m249 = {
		category = "weapon",
		dlc = "gage_pack_lmg",
		factory_id = "wpn_fps_lmg_m249",
		weapon_id = "m249"
	}
end

function UpgradesTweakData:_rpk_definitions()
	self.definitions.rpk = {
		category = "weapon",
		dlc = "gage_pack_lmg",
		factory_id = "wpn_fps_lmg_rpk",
		weapon_id = "rpk"
	}
end

function UpgradesTweakData:_m95_definitions()
	self.definitions.m95 = {
		category = "weapon",
		dlc = "gage_pack_snp",
		factory_id = "wpn_fps_snp_m95",
		weapon_id = "m95"
	}
end

function UpgradesTweakData:_msr_definitions()
	self.definitions.msr = {
		category = "weapon",
		dlc = "gage_pack_snp",
		factory_id = "wpn_fps_snp_msr",
		weapon_id = "msr"
	}
end

function UpgradesTweakData:_awp_definitions()
	self.definitions.awp = {
		category = "weapon",
		dlc = "pxp4",
		factory_id = "wpn_fps_snp_awp",
		weapon_id = "awp"
	}
end

function UpgradesTweakData:_supernova_definitions()
	self.definitions.supernova = {
		category = "weapon",
		dlc = "pxp4",
		factory_id = "wpn_fps_sho_supernova",
		weapon_id = "supernova"
	}
end

function UpgradesTweakData:_kacchainsaw_weapon_definitions()
	self.definitions.kacchainsaw = {
		category = "weapon",
		dlc = "pxp4",
		factory_id = "wpn_fps_lmg_kacchainsaw",
		weapon_id = "kacchainsaw"
	}
	self.definitions.kacchainsaw_flamethrower = {
		category = "weapon",
		dlc = "pxp4",
		factory_id = "wpn_fps_lmg_kacchainsaw_flamethrower",
		weapon_id = "kacchainsaw_flamethrower"
	}
end

function UpgradesTweakData:_r93_definitions()
	self.definitions.r93 = {
		category = "weapon",
		dlc = "gage_pack_snp",
		factory_id = "wpn_fps_snp_r93",
		weapon_id = "r93"
	}
end

function UpgradesTweakData:_fal_definitions()
	self.definitions.fal = {
		category = "weapon",
		dlc = "big_bank",
		factory_id = "wpn_fps_ass_fal",
		weapon_id = "fal"
	}
end

function UpgradesTweakData:_benelli_definitions()
	self.definitions.benelli = {
		category = "weapon",
		dlc = "gage_pack_shotgun",
		factory_id = "wpn_fps_sho_ben",
		weapon_id = "benelli"
	}
end

function UpgradesTweakData:_striker_definitions()
	self.definitions.striker = {
		category = "weapon",
		dlc = "gage_pack_shotgun",
		factory_id = "wpn_fps_sho_striker",
		weapon_id = "striker"
	}
	self.definitions.striker_reload_speed_default = {
		category = "feature",
		name_id = "menu_reload_speed_multiplierr",
		upgrade = {
			category = "striker",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
end

function UpgradesTweakData:_ksg_definitions()
	self.definitions.ksg = {
		category = "weapon",
		dlc = "gage_pack_shotgun",
		factory_id = "wpn_fps_sho_ksg",
		weapon_id = "ksg"
	}
end

function UpgradesTweakData:_scorpion_definitions()
	self.definitions.scorpion = {
		category = "weapon",
		dlc = "hl_miami",
		factory_id = "wpn_fps_smg_scorpion",
		weapon_id = "scorpion"
	}
end

function UpgradesTweakData:_tec9_definitions()
	self.definitions.tec9 = {
		category = "weapon",
		dlc = "hl_miami",
		factory_id = "wpn_fps_smg_tec9",
		weapon_id = "tec9"
	}
end

function UpgradesTweakData:_uzi_definitions()
	self.definitions.uzi = {
		category = "weapon",
		dlc = "hl_miami",
		factory_id = "wpn_fps_smg_uzi",
		weapon_id = "uzi"
	}
end

function UpgradesTweakData:_gre_m79_definitions()
	self.definitions.gre_m79 = {
		category = "weapon",
		dlc = "gage_pack_assault",
		factory_id = "wpn_fps_gre_m79",
		weapon_id = "gre_m79"
	}
end

function UpgradesTweakData:_g3_definitions()
	self.definitions.g3 = {
		category = "weapon",
		dlc = "gage_pack_assault",
		factory_id = "wpn_fps_ass_g3",
		weapon_id = "g3"
	}
end

function UpgradesTweakData:_galil_definitions()
	self.definitions.galil = {
		category = "weapon",
		dlc = "gage_pack_assault",
		factory_id = "wpn_fps_ass_galil",
		weapon_id = "galil"
	}
end

function UpgradesTweakData:_famas_definitions()
	self.definitions.famas = {
		category = "weapon",
		dlc = "gage_pack_assault",
		factory_id = "wpn_fps_ass_famas",
		weapon_id = "famas"
	}
end

function UpgradesTweakData:_spas12_definitions()
	self.definitions.spas12 = {
		category = "weapon",
		dlc = "pd2_clan",
		factory_id = "wpn_fps_sho_spas12",
		weapon_id = "spas12"
	}
end

function UpgradesTweakData:_mg42_definitions()
	self.definitions.mg42 = {
		category = "weapon",
		dlc = "gage_pack_historical",
		factory_id = "wpn_fps_lmg_mg42",
		weapon_id = "mg42"
	}
end

function UpgradesTweakData:_c96_definitions()
	self.definitions.c96 = {
		category = "weapon",
		dlc = "gage_pack_historical",
		factory_id = "wpn_fps_pis_c96",
		weapon_id = "c96"
	}
end

function UpgradesTweakData:_sterling_definitions()
	self.definitions.sterling = {
		category = "weapon",
		dlc = "gage_pack_historical",
		factory_id = "wpn_fps_smg_sterling",
		weapon_id = "sterling"
	}
end

function UpgradesTweakData:_mosin_definitions()
	self.definitions.mosin = {
		category = "weapon",
		dlc = "gage_pack_historical",
		factory_id = "wpn_fps_snp_mosin",
		weapon_id = "mosin"
	}
end

function UpgradesTweakData:_bessy_definitions()
	self.definitions.bessy = {
		category = "weapon",
		dlc = "pda10_bessy",
		factory_id = "wpn_fps_spec_bessy",
		weapon_id = "bessy"
	}
end

function UpgradesTweakData:_m1928_definitions()
	self.definitions.m1928 = {
		category = "weapon",
		dlc = "pd2_clan",
		factory_id = "wpn_fps_smg_thompson",
		weapon_id = "m1928"
	}
end

function UpgradesTweakData:_l85a2_definitions()
	self.definitions.l85a2 = {
		category = "weapon",
		dlc = "character_pack_clover",
		factory_id = "wpn_fps_ass_l85a2",
		weapon_id = "l85a2"
	}
end

function UpgradesTweakData:_vhs_definitions()
	self.definitions.vhs = {
		category = "weapon",
		dlc = "character_pack_dragan",
		factory_id = "wpn_fps_ass_vhs",
		weapon_id = "vhs"
	}
end

function UpgradesTweakData:_hs2000_definitions()
	self.definitions.hs2000 = {
		category = "weapon",
		dlc = "the_bomb",
		factory_id = "wpn_fps_pis_hs2000",
		weapon_id = "hs2000"
	}
end

function UpgradesTweakData:_m134_weapon_definitions()
	self.definitions.m134 = {
		category = "weapon",
		dlc = "overkill_pack",
		factory_id = "wpn_fps_lmg_m134",
		weapon_id = "m134"
	}
end

function UpgradesTweakData:_rpg7_weapon_definitions()
	self.definitions.rpg7 = {
		category = "weapon",
		dlc = "overkill_pack",
		factory_id = "wpn_fps_rpg7",
		weapon_id = "rpg7"
	}
end

function UpgradesTweakData:_cobray_definitions()
	self.definitions.cobray = {
		category = "weapon",
		dlc = "hlm2_deluxe",
		factory_id = "wpn_fps_smg_cobray",
		weapon_id = "cobray"
	}
end

function UpgradesTweakData:_b682_weapon_definitions()
	self.definitions.b682 = {
		category = "weapon",
		dlc = "pd2_clan",
		factory_id = "wpn_fps_shot_b682",
		weapon_id = "b682"
	}
end

function UpgradesTweakData:_melee_weapon_definitions()
	self.definitions.weapon = {
		category = "melee_weapon"
	}
	self.definitions.fists = {
		category = "melee_weapon"
	}
	self.definitions.kabar = {
		category = "melee_weapon",
		dlc = "gage_pack_lmg"
	}
	self.definitions.rambo = {
		category = "melee_weapon",
		dlc = "gage_pack_lmg"
	}
	self.definitions.gerber = {
		category = "melee_weapon",
		dlc = "gage_pack_lmg"
	}
	self.definitions.kampfmesser = {
		category = "melee_weapon",
		dlc = "gage_pack_lmg"
	}
	self.definitions.brass_knuckles = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.tomahawk = {
		category = "melee_weapon",
		dlc = "gage_pack_shotgun"
	}
	self.definitions.baton = {
		category = "melee_weapon",
		dlc = "gage_pack_shotgun"
	}
	self.definitions.shovel = {
		category = "melee_weapon",
		dlc = "gage_pack_shotgun"
	}
	self.definitions.becker = {
		category = "melee_weapon",
		dlc = "gage_pack_shotgun"
	}
	self.definitions.moneybundle = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.barbedwire = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.x46 = {
		category = "melee_weapon",
		dlc = "gage_pack_assault"
	}
	self.definitions.dingdong = {
		category = "melee_weapon",
		dlc = "gage_pack_assault"
	}
	self.definitions.spoon = {
		category = "melee_weapon",
		dlc = "apfo"
	}
	self.definitions.spoon_gold = {
		category = "melee_weapon",
		dlc = "apfo"
	}
	self.definitions.bayonet = {
		category = "melee_weapon",
		dlc = "gage_pack_assault"
	}
	self.definitions.bullseye = {
		category = "melee_weapon",
		dlc = "gage_pack_assault"
	}
	self.definitions.baseballbat = {
		category = "melee_weapon",
		dlc = "hl_miami"
	}
	self.definitions.cleaver = {
		category = "melee_weapon",
		dlc = "hl_miami"
	}
	self.definitions.fireaxe = {
		category = "melee_weapon",
		dlc = "hl_miami"
	}
	self.definitions.machete = {
		category = "melee_weapon",
		dlc = "hl_miami"
	}
	self.definitions.briefcase = {
		category = "melee_weapon",
		dlc = "hlm_game"
	}
	self.definitions.fairbair = {
		category = "melee_weapon",
		dlc = "gage_pack_historical"
	}
	self.definitions.freedom = {
		category = "melee_weapon",
		dlc = "gage_pack_historical"
	}
	self.definitions.model24 = {
		category = "melee_weapon",
		dlc = "gage_pack_historical"
	}
	self.definitions.swagger = {
		category = "melee_weapon",
		dlc = "gage_pack_historical"
	}
	self.definitions.alien_maul = {
		category = "melee_weapon",
		dlc = "alienware_alpha_promo"
	}
	self.definitions.piggy_hammer = {
		category = "melee_weapon",
		dlc = "pda10_piggy_hammer"
	}
	self.definitions.shillelagh = {
		category = "melee_weapon",
		dlc = "character_pack_clover"
	}
	self.definitions.boxing_gloves = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.meat_cleaver = {
		category = "melee_weapon",
		dlc = "character_pack_dragan"
	}
	self.definitions.hammer = {
		category = "melee_weapon",
		dlc = "hlm2_deluxe"
	}
	self.definitions.whiskey = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
	self.definitions.scalper = {
		category = "melee_weapon",
		dlc = "west"
	}
	self.definitions.mining_pick = {
		category = "melee_weapon",
		dlc = "west"
	}
	self.definitions.branding_iron = {
		category = "melee_weapon",
		dlc = "west"
	}
	self.definitions.bowie = {
		category = "melee_weapon",
		dlc = "west"
	}
	self.definitions.microphone = {
		category = "melee_weapon",
		dlc = "arena"
	}
	self.definitions.detector = {
		category = "melee_weapon",
		dlc = "arena"
	}
	self.definitions.micstand = {
		category = "melee_weapon",
		dlc = "arena"
	}
	self.definitions.oldbaton = {
		category = "melee_weapon",
		dlc = "arena"
	}
	self.definitions.switchblade = {
		category = "melee_weapon",
		dlc = "kenaz"
	}
	self.definitions.taser = {
		category = "melee_weapon",
		dlc = "kenaz"
	}
	self.definitions.slot_lever = {
		category = "melee_weapon",
		dlc = "kenaz"
	}
	self.definitions.croupier_rake = {
		category = "melee_weapon",
		dlc = "kenaz"
	}
	self.definitions.hockey = {
		category = "melee_weapon",
		dlc = "character_pack_sokol"
	}
	self.definitions.twins = {
		category = "melee_weapon",
		dlc = "turtles"
	}
	self.definitions.cqc = {
		category = "melee_weapon",
		dlc = "turtles"
	}
	self.definitions.tiger = {
		category = "melee_weapon",
		dlc = "turtles"
	}
	self.definitions.fight = {
		category = "melee_weapon",
		dlc = "turtles"
	}
	self.definitions.sandsteel = {
		category = "melee_weapon",
		dlc = "dragon"
	}
	self.definitions.great = {
		category = "melee_weapon",
		dlc = "steel"
	}
	self.definitions.beardy = {
		category = "melee_weapon",
		dlc = "steel"
	}
	self.definitions.buck = {
		category = "melee_weapon",
		dlc = "steel"
	}
	self.definitions.morning = {
		category = "melee_weapon",
		dlc = "steel"
	}
	self.definitions.cutters = {
		category = "melee_weapon"
	}
	self.definitions.boxcutter = {
		category = "melee_weapon",
		dlc = "rvd"
	}
	self.definitions.selfie = {
		category = "melee_weapon",
		dlc = "berry"
	}
	self.definitions.gator = {
		category = "melee_weapon",
		dlc = "berry"
	}
	self.definitions.pugio = {
		category = "melee_weapon",
		dlc = "berry"
	}
	self.definitions.iceaxe = {
		category = "melee_weapon",
		dlc = "berry"
	}
	self.definitions.shawn = {
		category = "melee_weapon",
		dlc = "peta"
	}
	self.definitions.stick = {
		category = "melee_weapon",
		dlc = "peta"
	}
	self.definitions.pitchfork = {
		category = "melee_weapon",
		dlc = "peta"
	}
	self.definitions.scoutknife = {
		category = "melee_weapon",
		dlc = "peta"
	}
	self.definitions.nin = {
		category = "melee_weapon",
		dlc = "pal"
	}
	self.definitions.ballistic = {
		category = "melee_weapon",
		dlc = "coco"
	}
	self.definitions.zeus = {
		category = "melee_weapon",
		dlc = "mad"
	}
	self.definitions.wing = {
		category = "melee_weapon",
		dlc = "opera"
	}
	self.definitions.road = {
		category = "melee_weapon",
		dlc = "wild"
	}
	self.definitions.cs = {
		category = "melee_weapon",
		dlc = "chico"
	}
	self.definitions.brick = {
		category = "melee_weapon",
		dlc = "friend"
	}
	self.definitions.ostry = {
		category = "melee_weapon",
		dlc = "sha"
	}
	self.definitions.catch = {
		category = "melee_weapon",
		dlc = "spa"
	}
	self.definitions.oxide = {
		category = "melee_weapon",
		dlc = "grv"
	}
	self.definitions.sword = {
		category = "melee_weapon",
		dlc = "pn2"
	}
	self.definitions.agave = {
		category = "melee_weapon"
	}
	self.definitions.happy = {
		category = "melee_weapon"
	}
	self.definitions.push = {
		category = "melee_weapon"
	}
	self.definitions.grip = {
		category = "melee_weapon",
		dlc = "raidww2_clan"
	}
	self.definitions.sap = {
		category = "melee_weapon"
	}
	self.definitions.clean = {
		category = "melee_weapon",
		dlc = "rvd"
	}
	self.definitions.meter = {
		category = "melee_weapon",
		dlc = "ecp"
	}
	self.definitions.aziz = {
		category = "melee_weapon",
		dlc = "flm"
	}
	self.definitions.hauteur = {
		category = "melee_weapon"
	}
	self.definitions.shock = {
		category = "melee_weapon"
	}
	self.definitions.fear = {
		category = "melee_weapon"
	}
	self.definitions.chac = {
		category = "melee_weapon",
		dlc = "bex"
	}
	self.definitions.funder_strike = {
		category = "melee_weapon"
	}
	self.definitions.bonk = {
		category = "melee_weapon"
	}
	self.definitions.bonk2 = {
		category = "melee_weapon"
	}
end

function UpgradesTweakData:_grenades_definitions()
	self.definitions.molotov = {
		category = "grenade",
		dlc = "bbq"
	}
	self.definitions.frag = {
		category = "grenade",
		dlc = "gage_pack"
	}
	self.definitions.dynamite = {
		category = "grenade",
		dlc = "west"
	}
	self.definitions.wpn_prj_four = {
		category = "grenade",
		dlc = "turtles"
	}
	self.definitions.wpn_prj_ace = {
		category = "grenade",
		dlc = "pd2_clan"
	}
	self.definitions.wpn_prj_jav = {
		category = "grenade",
		dlc = "steel"
	}
	self.definitions.wpn_prj_hur = {
		category = "grenade",
		dlc = "born"
	}
	self.definitions.wpn_prj_target = {
		category = "grenade",
		dlc = "pim"
	}
	self.definitions.frag_com = {
		category = "grenade",
		dlc = "pd2_clan"
	}
	self.definitions.concussion = {
		category = "grenade"
	}
	self.definitions.chico_injector = {
		category = "grenade",
		dlc = "chico_or_mrwi_deck"
	}
	self.definitions.fir_com = {
		category = "grenade",
		dlc = "pd2_clan"
	}
	self.definitions.smoke_screen_grenade = {
		category = "grenade"
	}
	self.definitions.dada_com = {
		category = "grenade",
		dlc = "pd2_clan"
	}
	self.definitions.pocket_ecm_jammer = {
		category = "grenade"
	}
	self.definitions.tag_team = {
		category = "grenade",
		dlc = "ecp_or_mrwi_deck"
	}
	self.definitions.damage_control = {
		category = "grenade"
	}
	self.definitions.wpn_dallas_mask = {
		category = "grenade"
	}
	self.definitions.wpn_gre_electric = {
		category = "grenade",
		dlc = "sawp_grenade"
	}
	self.definitions.copr_ability = {
		category = "grenade",
		dlc = "copr"
	}
	self.definitions.xmas_snowball = {
		category = "grenade",
		dlc = "xmas_snowball"
	}
	self.definitions.poison_gas_grenade = {
		category = "grenade"
	}
	self.definitions.sticky_grenade = {
		category = "grenade",
		dlc = "mxm"
	}
	self.definitions.laser_watch = {
		category = "grenade",
		dlc = "esp"
	}
end

function UpgradesTweakData:_weapon_definitions()
	self.definitions.weapon_steelsight_highlight_specials = {
		category = "feature",
		name_id = "menu_weapon_steelsight_highlight_specials",
		upgrade = {
			category = "weapon",
			upgrade = "steelsight_highlight_specials",
			value = 1
		}
	}
	self.definitions.assault_rifle_move_spread_index_addend = {
		category = "feature",
		name_id = "menu_assault_rifle_move_spread_index_addend",
		upgrade = {
			category = "assault_rifle",
			upgrade = "move_spread_index_addend",
			value = 1
		}
	}
	self.definitions.snp_move_spread_index_addend = {
		category = "feature",
		name_id = "menu_snp_move_spread_index_addend",
		upgrade = {
			category = "snp",
			upgrade = "move_spread_index_addend",
			value = 1
		}
	}
	self.definitions.smg_move_spread_index_addend = {
		category = "feature",
		name_id = "menu_snp_move_spread_index_addend",
		upgrade = {
			category = "smg",
			upgrade = "move_spread_index_addend",
			value = 1
		}
	}
	self.definitions.weapon_silencer_spread_index_addend = {
		category = "feature",
		name_id = "menu_weapon_silencer_spread_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_spread_index_addend",
			value = 1
		}
	}
	self.definitions.pistol_spread_index_addend = {
		category = "feature",
		name_id = "menu_pistol_spread_index_addend",
		upgrade = {
			category = "pistol",
			upgrade = "spread_index_addend",
			value = 1
		}
	}
	self.definitions.shotgun_hip_fire_spread_index_addend = {
		category = "feature",
		name_id = "menu_shotgun_hip_fire_spread_index_addend",
		upgrade = {
			category = "shotgun",
			upgrade = "hip_fire_spread_index_addend",
			value = 1
		}
	}
	self.definitions.shotgun_hip_run_and_shoot_1 = {
		category = "feature",
		name_id = "menu_shotgun_hip_run_and_shoot",
		upgrade = {
			category = "shotgun",
			upgrade = "hip_run_and_shoot",
			value = 1
		}
	}
	self.definitions.shotgun_hip_rate_of_fire_1 = {
		category = "feature",
		name_id = "menu_shotgun_hip_run_and_shoot",
		upgrade = {
			category = "shotgun",
			upgrade = "hip_rate_of_fire",
			value = 1
		}
	}
	self.definitions.shotgun_magazine_capacity_inc_1 = {
		category = "feature",
		name_id = "menu_shotgun_magazine_capacity_inc",
		upgrade = {
			category = "shotgun",
			upgrade = "magazine_capacity_inc",
			value = 1
		}
	}
	self.definitions.shotgun_steelsight_accuracy_inc_1 = {
		category = "feature",
		name_id = "menu_shotgun_steelsight_accuracy_inc",
		upgrade = {
			category = "shotgun",
			upgrade = "steelsight_accuracy_inc",
			value = 1
		}
	}
	self.definitions.shotgun_steelsight_range_inc_1 = {
		category = "feature",
		name_id = "menu_shotgun_steelsight_range_inc",
		upgrade = {
			category = "shotgun",
			upgrade = "steelsight_range_inc",
			value = 1
		}
	}
	self.definitions.weapon_hip_fire_spread_index_addend = {
		category = "feature",
		name_id = "menu_weapon_hip_fire_spread_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "hip_fire_spread_index_addend",
			value = 1
		}
	}
	self.definitions.weapon_single_spread_index_addend = {
		category = "feature",
		name_id = "menu_weapon_single_spread_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "single_spread_index_addend",
			value = 1
		}
	}
	self.definitions.shotgun_recoil_index_addend = {
		category = "feature",
		name_id = "menu_shotgun_recoil_index_addend",
		upgrade = {
			category = "shotgun",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.assault_rifle_recoil_index_addend = {
		category = "feature",
		name_id = "menu_assault_rifle_recoil_index_addend",
		upgrade = {
			category = "assault_rifle",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.lmg_recoil_index_addend = {
		category = "feature",
		name_id = "menu_lmg_recoil_index_addend",
		upgrade = {
			category = "lmg",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.snp_recoil_index_addend = {
		category = "feature",
		name_id = "menu_snp_recoil_index_addend",
		upgrade = {
			category = "snp",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.akimbo_recoil_index_addend_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_akimbo_recoil_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.akimbo_recoil_index_addend_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_akimbo_recoil_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_index_addend",
			value = 2
		}
	}
	self.definitions.akimbo_recoil_index_addend_3 = {
		category = "feature",
		incremental = true,
		name_id = "menu_akimbo_recoil_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_index_addend",
			value = 3
		}
	}
	self.definitions.akimbo_recoil_index_addend_4 = {
		category = "feature",
		incremental = true,
		name_id = "menu_akimbo_recoil_index_addend",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_index_addend",
			value = 4
		}
	}
	self.definitions.weapon_silencer_recoil_index_addend = {
		category = "feature",
		name_id = "menu_weapon_silencer_recoil_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_recoil_index_addend",
			value = 1
		}
	}
	self.definitions.weapon_modded_damage_multiplier = {
		category = "feature",
		name_id = "menu_modded_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "modded_damage_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_modded_spread_multiplier = {
		category = "feature",
		name_id = "menu_modded_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "modded_spread_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_modded_recoil_multiplier = {
		category = "feature",
		name_id = "menu_modded_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "modded_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_clip_ammo_increase_1 = {
		category = "feature",
		name_id = "menu_weapon_clip_ammo_increase_1",
		upgrade = {
			category = "weapon",
			upgrade = "clip_ammo_increase",
			value = 1
		}
	}
	self.definitions.weapon_clip_ammo_increase_2 = {
		category = "feature",
		name_id = "menu_weapon_clip_ammo_increase_2",
		upgrade = {
			category = "weapon",
			upgrade = "clip_ammo_increase",
			value = 2
		}
	}
	self.definitions.weapon_passive_swap_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_weapon_swap_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_swap_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_weapon_swap_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_swap_speed_multiplier",
			value = 2
		}
	}
	self.definitions.weapon_swap_speed_multiplier = {
		category = "feature",
		name_id = "menu_weapon_swap_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_single_spread_multiplier = {
		category = "feature",
		name_id = "menu_weapon_single_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "single_spread_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_silencer_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_weapon_silencer_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_silencer_spread_multiplier = {
		category = "feature",
		name_id = "menu_silencer_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_spread_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_weapon_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_silencer_recoil_multiplier = {
		category = "feature",
		name_id = "menu_silencer_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "silencer_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_weapon_reload_speed",
		upgrade = {
			category = "weapon",
			upgrade = "passive_reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_recoil_multiplier_1 = {
		category = "feature",
		name_id = "menu_weapon_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_recoil_multiplier_2 = {
		category = "feature",
		name_id = "menu_weapon_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_recoil_multiplier",
			value = 2
		}
	}
	self.definitions.weapon_passive_headshot_damage_multiplier = {
		category = "feature",
		name_id = "menu_weapon_headshot_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_headshot_damage_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_passive_damage_multiplier = {
		category = "feature",
		name_id = "menu_weapon_passive_damage_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "passive_damage_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_special_damage_taken_multiplier = {
		category = "feature",
		name_id = "menu_weapon_special_damage_taken_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "special_damage_taken_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_spread_multiplier = {
		category = "feature",
		name_id = "menu_weapon_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "spread_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_fire_rate_multiplier = {
		category = "feature",
		name_id = "menu_weapon_fire_rate_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.snp_graze_damage_1 = {
		category = "feature",
		name_id = "menu_snp_graze_damage",
		upgrade = {
			category = "snp",
			upgrade = "graze_damage",
			value = 1
		}
	}
	self.definitions.snp_graze_damage_2 = {
		category = "feature",
		name_id = "menu_snp_graze_damage",
		upgrade = {
			category = "snp",
			upgrade = "graze_damage",
			value = 2
		}
	}
end

function UpgradesTweakData:_pistol_definitions()
	self.definitions.pistol_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_pistol_reload_speed",
		upgrade = {
			category = "pistol",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_damage_multiplier = {
		category = "feature",
		name_id = "menu_pistol_damage_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_spread_multiplier = {
		category = "feature",
		name_id = "menu_pistol_spread_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "spread_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_fire_rate_multiplier = {
		category = "feature",
		name_id = "menu_pistol_fire_rate_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_stacked_accuracy_bonus_1 = {
		category = "feature",
		name_id = "menu_pistol_stacked_accuracy_bonus",
		upgrade = {
			category = "pistol",
			upgrade = "stacked_accuracy_bonus",
			value = 1
		}
	}
	self.definitions.pistol_stacking_hit_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_pistol_stacking_hit_damage_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "stacking_hit_damage_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_stacking_hit_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_pistol_stacking_hit_damage_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "stacking_hit_damage_multiplier",
			value = 2
		}
	}
	self.definitions.pistol_exit_run_speed_multiplier = {
		category = "feature",
		name_id = "menu_exit_run_speed_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "exit_run_speed_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_pistol_hip_fire_spread_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_pistol_hip_fire_damage_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_swap_speed_multiplier = {
		category = "feature",
		name_id = "menu_pistol_swap_speed_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.pistol_stacking_hit_expire_t_1 = {
		category = "feature",
		name_id = "menu_pistol_stacking_hit_expire_t",
		upgrade = {
			category = "pistol",
			upgrade = "stacking_hit_expire_t",
			value = 1
		}
	}
	self.definitions.pistol_stacking_hit_expire_t_2 = {
		category = "feature",
		name_id = "menu_pistol_stacking_hit_expire_t",
		upgrade = {
			category = "pistol",
			upgrade = "stacking_hit_expire_t",
			value = 2
		}
	}
	self.definitions.pistol_damage_addend_1 = {
		category = "feature",
		name_id = "menu_pistol_damage_addend",
		upgrade = {
			category = "pistol",
			upgrade = "damage_addend",
			value = 1
		}
	}
	self.definitions.pistol_damage_addend_2 = {
		category = "feature",
		name_id = "menu_pistol_damage_addend",
		upgrade = {
			category = "pistol",
			upgrade = "damage_addend",
			value = 2
		}
	}
	self.definitions.pistol_magazine_capacity_inc_1 = {
		category = "feature",
		name_id = "menu_pistol_magazine_capacity_inc",
		upgrade = {
			category = "pistol",
			upgrade = "magazine_capacity_inc",
			value = 1
		}
	}
	self.definitions.pistol_zoom_increase = {
		category = "feature",
		name_id = "menu_pistol_zoom_increase",
		upgrade = {
			category = "pistol",
			upgrade = "zoom_increase",
			value = 1
		}
	}
end

function UpgradesTweakData:_assault_rifle_definitions()
	self.definitions.assault_rifle_recoil_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_recoil_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_reload_speed_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_move_spread_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_move_spread_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "move_spread_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_hip_fire_spread_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_assault_rifle_hip_fire_damage_multiplier",
		upgrade = {
			category = "assault_rifle",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.assault_rifle_zoom_increase = {
		category = "feature",
		name_id = "menu_assault_rifle_zoom_increase",
		upgrade = {
			category = "assault_rifle",
			upgrade = "zoom_increase",
			value = 1
		}
	}
end

function UpgradesTweakData:_lmg_definitions()
	self.definitions.lmg_recoil_multiplier = {
		category = "feature",
		name_id = "menu_lmg_recoil_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_lmg_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_lmg_reload_speed_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_move_spread_multiplier = {
		category = "feature",
		name_id = "menu_lmg_move_spread_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "move_spread_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_lmg_hip_fire_spread_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_lmg_hip_fire_damage_multiplier",
		upgrade = {
			category = "lmg",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.lmg_zoom_increase = {
		category = "feature",
		name_id = "menu_lmg_zoom_increase",
		upgrade = {
			category = "lmg",
			upgrade = "zoom_increase",
			value = 1
		}
	}
end

function UpgradesTweakData:_snp_definitions()
	self.definitions.snp_recoil_multiplier = {
		category = "feature",
		name_id = "menu_snp_recoil_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.snp_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_snp_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.snp_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_snp_reload_speed_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.snp_move_spread_multiplier = {
		category = "feature",
		name_id = "menu_snp_move_spread_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "move_spread_multiplier",
			value = 1
		}
	}
	self.definitions.snp_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_snp_hip_fire_spread_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.snp_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_snp_hip_fire_damage_multiplier",
		upgrade = {
			category = "snp",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.snp_zoom_increase = {
		category = "feature",
		name_id = "menu_snp_zoom_increase",
		upgrade = {
			category = "snp",
			upgrade = "zoom_increase",
			value = 1
		}
	}
end

function UpgradesTweakData:_smg_definitions()
	self.definitions.smg_reload_speed_multiplier = {
		category = "feature",
		name_id = "menu_reload_speed_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.smg_recoil_multiplier = {
		category = "feature",
		name_id = "menu_smg_recoil_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.smg_fire_rate_multiplier = {
		category = "feature",
		name_id = "menu_smg_fire_rate_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "fire_rate_multiplier",
			value = 1
		}
	}
	self.definitions.smg_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_smg_hip_fire_spread_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.smg_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_smg_hip_fire_damage_multiplier",
		upgrade = {
			category = "smg",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.smg_zoom_increase = {
		category = "feature",
		name_id = "menu_snp_zoom_increase",
		upgrade = {
			category = "smg",
			upgrade = "zoom_increase",
			value = 1
		}
	}
end

function UpgradesTweakData:_shotgun_definitions()
	self.definitions.shotgun_recoil_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_recoil_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_damage_multiplier_1 = {
		category = "feature",
		name_id = "menu_shotgun_damage_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_damage_multiplier_2 = {
		category = "feature",
		name_id = "menu_shotgun_damage_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "damage_multiplier",
			value = 2
		}
	}
	self.definitions.shotgun_reload_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_shotgun_reload_speed_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "reload_speed_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_reload_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_shotgun_reload_speed_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "reload_speed_multiplier",
			value = 2
		}
	}
	self.definitions.shotgun_enter_steelsight_speed_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_hip_fire_spread_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_hip_fire_spread_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "hip_fire_spread_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_hip_fire_damage_multiplier = {
		category = "feature",
		name_id = "menu_shotgun_hip_fire_damage_multiplier",
		upgrade = {
			category = "shotgun",
			upgrade = "hip_fire_damage_multiplier",
			value = 1
		}
	}
	self.definitions.shotgun_consume_no_ammo_chance_1 = {
		category = "feature",
		name_id = "menu_shotgun_consume_no_ammo_chance",
		upgrade = {
			category = "shotgun",
			upgrade = "consume_no_ammo_chance",
			value = 1
		}
	}
	self.definitions.shotgun_consume_no_ammo_chance_2 = {
		category = "feature",
		name_id = "menu_shotgun_consume_no_ammo_chance",
		upgrade = {
			category = "shotgun",
			upgrade = "consume_no_ammo_chance",
			value = 2
		}
	}
	self.definitions.shotgun_melee_knockdown_mul = {
		category = "feature",
		name_id = "menu_shotgun_melee_knockdown_mul",
		upgrade = {
			category = "shotgun",
			upgrade = "melee_knockdown_mul",
			value = 1
		}
	}
end

function UpgradesTweakData:_carry_definitions()
	self.definitions.carry_movement_penalty_nullifier = {
		category = "feature",
		name_id = "menu_carry_movement_penalty_nullifier",
		upgrade = {
			category = "carry",
			upgrade = "movement_penalty_nullifier",
			value = 1
		}
	}
	self.definitions.carry_movement_speed_multiplier = {
		category = "feature",
		name_id = "menu_carry_movement_speed_multiplier",
		upgrade = {
			category = "carry",
			upgrade = "movement_speed_multiplier",
			value = 1
		}
	}
	self.definitions.carry_throw_distance_multiplier = {
		category = "feature",
		name_id = "menu_carry_throw_distance_multiplier",
		upgrade = {
			category = "carry",
			upgrade = "throw_distance_multiplier",
			value = 1
		}
	}
	self.definitions.carry_interact_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_carry_interact_speed_multiplierr",
		upgrade = {
			category = "carry",
			upgrade = "interact_speed_multiplier",
			value = 1
		}
	}
	self.definitions.carry_catch_interaction_speed_1 = {
		category = "feature",
		name_id = "menu_carry_catch_interaction_speed",
		upgrade = {
			category = "carry",
			upgrade = "catch_interaction_speed",
			value = 1
		}
	}
	self.definitions.carry_interact_speed_multiplier_2 = {
		category = "feature",
		name_id = "menu_carry_interact_speed_multiplierr",
		upgrade = {
			category = "carry",
			upgrade = "interact_speed_multiplier",
			value = 2
		}
	}
	self.definitions.carry_catch_interaction_speed_2 = {
		category = "feature",
		name_id = "menu_carry_catch_interaction_speed",
		upgrade = {
			category = "carry",
			upgrade = "catch_interaction_speed",
			value = 2
		}
	}
	self.definitions.carry_bag_count_1 = {
		category = "feature",
		name_id = "menu_carry_catch_interaction_speed",
		upgrade = {
			category = "carry",
			upgrade = "carry_bag_count",
			value = 1
		}
	}
end

function UpgradesTweakData:_team_definitions()
	self.definitions.team_pistol_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_pistol_recoil_index_addend",
		upgrade = {
			category = "pistol",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_weapon_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_weapon_recoil_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_pistol_suppression_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_pistol_suppression_recoil_index_addend",
		upgrade = {
			category = "pistol",
			upgrade = "suppression_recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_weapon_suppression_recoil_index_addend = {
		category = "team",
		name_id = "menu_team_weapon_suppression_recoil_index_addend",
		upgrade = {
			category = "weapon",
			upgrade = "suppression_recoil_index_addend",
			value = 1
		}
	}
	self.definitions.team_pistol_suppression_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_pistol_suppression_recoil_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "suppression_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_akimbo_suppression_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_akimbo_suppression_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "suppression_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_pistol_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_pistol_recoil_multiplier",
		upgrade = {
			category = "pistol",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_akimbo_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_akimbo_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_weapon_suppression_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_weapon_suppression_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "suppression_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_weapon_recoil_multiplier = {
		category = "team",
		name_id = "menu_team_weapon_recoil_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.team_xp_multiplier = {
		category = "team",
		name_id = "menu_team_xp_multiplier",
		upgrade = {
			category = "xp",
			upgrade = "multiplier",
			value = 1
		}
	}
	self.definitions.team_armor_regen_time_multiplier = {
		category = "team",
		name_id = "menu_team_armor_regen_time_multiplier",
		upgrade = {
			category = "armor",
			upgrade = "regen_time_multiplier",
			value = 1
		}
	}
	self.definitions.team_passive_armor_regen_time_multiplier = {
		category = "team",
		name_id = "menu_team_armor_regen_time_multiplier",
		upgrade = {
			category = "armor",
			upgrade = "passive_regen_time_multiplier",
			value = 1
		}
	}
	self.definitions.team_stamina_multiplier = {
		category = "team",
		name_id = "menu_team_stamina_multiplier",
		upgrade = {
			category = "stamina",
			upgrade = "multiplier",
			value = 1
		}
	}
	self.definitions.team_damage_hostage_absorption = {
		category = "team",
		name_id = "menu_team_damage_hostage_absorption",
		upgrade = {
			category = "damage",
			upgrade = "hostage_absorption",
			value = 1
		}
	}
	self.definitions.team_passive_stamina_multiplier_1 = {
		category = "team",
		name_id = "menu_team_stamina_multiplier",
		upgrade = {
			category = "stamina",
			upgrade = "passive_multiplier",
			value = 1
		}
	}
	self.definitions.team_passive_stamina_multiplier_2 = {
		category = "team",
		name_id = "menu_team_stamina_multiplier",
		upgrade = {
			category = "stamina",
			upgrade = "passive_multiplier",
			value = 2
		}
	}
	self.definitions.team_passive_health_multiplier = {
		category = "team",
		name_id = "menu_team_health_multiplier",
		upgrade = {
			category = "health",
			upgrade = "passive_multiplier",
			value = 1
		}
	}
	self.definitions.team_hostage_health_multiplier = {
		category = "team",
		name_id = "menu_team_hostage_health_multiplier",
		upgrade = {
			category = "health",
			upgrade = "hostage_multiplier",
			value = 1
		}
	}
	self.definitions.team_hostage_stamina_multiplier = {
		category = "team",
		name_id = "menu_team_hostage_stamina_multiplier",
		upgrade = {
			category = "stamina",
			upgrade = "hostage_multiplier",
			value = 1
		}
	}
	self.definitions.team_clients_buy_assets = {
		category = "team",
		name_id = "menu_team_clients_buy_assets",
		upgrade = {
			category = "player",
			upgrade = "clients_buy_assets",
			value = 1
		}
	}
	self.definitions.team_move_spread_multiplier = {
		category = "team",
		name_id = "menu_team_move_spread_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "move_spread_multiplier",
			value = 1
		}
	}
	self.definitions.team_civ_intimidation_mul = {
		category = "team",
		name_id = "menu_team_civ_intimidation_mul",
		upgrade = {
			category = "player",
			upgrade = "civ_intimidation_mul",
			value = 1
		}
	}
	self.definitions.team_xp_stealth_multiplier = {
		category = "team",
		name_id = "menu_team_xp_stealth_multiplier",
		upgrade = {
			category = "xp",
			upgrade = "stealth_multiplier",
			value = 1
		}
	}
	self.definitions.team_cash_stealth_multiplier = {
		category = "team",
		name_id = "menu_team_cash_stealth_multiplier",
		upgrade = {
			category = "cash",
			upgrade = "stealth_money_multiplier",
			value = 1
		}
	}
	self.definitions.team_bags_stealth_multiplier = {
		category = "team",
		name_id = "menu_team_bags_stealth_multiplier",
		upgrade = {
			category = "cash",
			upgrade = "stealth_bags_multiplier",
			value = 1
		}
	}
	self.definitions.team_hostage_damage_dampener_multiplier = {
		category = "team",
		name_id = "menu_team_hostage_damage_dampener_multiplier",
		upgrade = {
			category = "damage_dampener",
			upgrade = "hostage_multiplier",
			value = 1
		}
	}
	self.definitions.team_damage_reduction_1 = {
		category = "team",
		name_id = "menu_team_hostage_damage_dampener_multiplier",
		upgrade = {
			category = "damage_dampener",
			upgrade = "team_damage_reduction",
			value = 1
		}
	}

	self:_crew_definitions()
end

function UpgradesTweakData:_crew_definitions()
	self.crew_skill_definitions = self.crew_skill_definitions or {}
	self.crew_ability_definitions = self.crew_ability_definitions or {}
	self.crew_skill_definitions.crew_healthy = {
		icon = "skill_1",
		name_id = "menu_crew_healthy",
		upgrades = {
			{
				category = "team",
				upgrade = "crew_add_health",
				value = 1
			}
		}
	}
	self.crew_skill_definitions.crew_sturdy = {
		icon = "skill_2",
		name_id = "menu_crew_sturdy",
		upgrades = {
			{
				category = "team",
				upgrade = "crew_add_armor",
				value = 1
			}
		}
	}
	self.crew_skill_definitions.crew_evasive = {
		icon = "skill_3",
		name_id = "menu_crew_evasive",
		upgrades = {
			{
				category = "team",
				upgrade = "crew_add_dodge",
				value = 1
			}
		}
	}
	self.crew_skill_definitions.crew_regen = {
		icon = "skill_5",
		name_id = "menu_crew_regen",
		upgrades = {
			{
				category = "team",
				upgrade = "crew_health_regen",
				value = 1
			}
		}
	}
	self.crew_skill_definitions.crew_motivated = {
		icon = "skill_4",
		name_id = "menu_crew_motivated",
		upgrades = {
			{
				category = "team",
				upgrade = "crew_add_stamina",
				value = 1
			},
			{
				category = "team",
				upgrade = "crew_reduce_speed_penalty",
				value = 1
			}
		}
	}
	self.crew_skill_definitions.crew_eager = {
		icon = "skill_8",
		name_id = "menu_crew_eager",
		upgrades = {
			{
				category = "team",
				upgrade = "crew_faster_swap",
				value = 1
			},
			{
				category = "team",
				upgrade = "crew_faster_reload",
				value = 1
			}
		}
	}
	self.crew_skill_definitions.crew_quiet = {
		icon = "skill_6",
		name_id = "menu_crew_quiet",
		upgrades = {
			{
				category = "team",
				upgrade = "crew_add_concealment",
				value = 1
			}
		}
	}
	self.crew_skill_definitions.crew_generous = {
		icon = "skill_7",
		name_id = "menu_crew_generous",
		upgrades = {
			{
				category = "team",
				upgrade = "crew_throwable_regen",
				value = 1
			}
		}
	}
	self.crew_ability_definitions.crew_inspire = {
		icon = "ability_1",
		name_id = "menu_crew_inspire"
	}
	self.crew_ability_definitions.crew_scavenge = {
		icon = "ability_2",
		name_id = "menu_crew_scavenge"
	}
	self.crew_ability_definitions.crew_interact = {
		icon = "ability_3",
		name_id = "menu_crew_interact"
	}
	self.crew_ability_definitions.crew_ai_ap_ammo = {
		icon = "ability_4",
		name_id = "menu_crew_ai_ap_ammo"
	}
	self.crew_ability_definitions.crew_ai_cable_ties = {
		icon = "ability_5",
		name_id = "menu_crew_ai_cable_ties"
	}
	self.crew_ability_definitions.crew_ai_flashbang = {
		icon = "ability_6",
		name_id = "menu_crew_ai_flashbang"
	}
	self.crew_ability_definitions.crew_ai_counter_strike = {
		icon = "ability_7",
		name_id = "menu_crew_ai_counter_strike"
	}
	self.crew_ability_definitions.crew_ai_counter_tase = {
		icon = "ability_8",
		name_id = "menu_crew_ai_counter_tase"
	}
end

function UpgradesTweakData:_temporary_definitions()
	self.definitions.temporary_armor_break_invulnerable_1 = {
		category = "temporary",
		name_id = "menu_player_health_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "armor_break_invulnerable",
			value = 1
		}
	}
	self.definitions.temporary_combat_medic_damage_multiplier1 = {
		category = "temporary",
		incremental = true,
		name_id = "menu_temporary_combat_medic_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "combat_medic_damage_multiplier",
			value = 1
		}
	}
	self.definitions.temporary_combat_medic_damage_multiplier2 = {
		category = "temporary",
		incremental = true,
		name_id = "menu_temporary_combat_medic_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "combat_medic_damage_multiplier",
			value = 2
		}
	}
	self.definitions.temporary_combat_medic_enter_steelsight_speed_multiplier = {
		category = "temporary",
		name_id = "menu_temporary_combat_medic_enter_steelsight_speed_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "combat_medic_enter_steelsight_speed_multiplier",
			value = 1
		}
	}
	self.definitions.temporary_revive_health_boost = {
		category = "temporary",
		name_id = "menu_temporary_revive_health_boost",
		upgrade = {
			category = "temporary",
			upgrade = "revive_health_boost",
			value = 1
		}
	}
	self.definitions.temporary_berserker_damage_multiplier_1 = {
		category = "temporary",
		name_id = "menu_temporary_berserker_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "berserker_damage_multiplier",
			value = 1
		}
	}
	self.definitions.temporary_berserker_damage_multiplier_2 = {
		category = "temporary",
		name_id = "menu_temporary_berserker_damage_multiplier",
		upgrade = {
			category = "temporary",
			upgrade = "berserker_damage_multiplier",
			value = 2
		}
	}
	self.definitions.temporary_no_ammo_cost_buff = {
		category = "temporary",
		name_id = "menu_temporary_no_ammo_cost_buff",
		upgrade = {
			category = "temporary",
			upgrade = "no_ammo_cost_buff",
			value = 1
		}
	}
	self.definitions.temporary_no_ammo_cost_1 = {
		category = "temporary",
		name_id = "menu_temporary_no_ammo_cost_1",
		upgrade = {
			category = "player",
			upgrade = "no_ammo_cost",
			value = 1
		}
	}
	self.definitions.temporary_no_ammo_cost_2 = {
		category = "temporary",
		name_id = "menu_temporary_no_ammo_cost_2",
		upgrade = {
			category = "player",
			upgrade = "no_ammo_cost",
			value = 2
		}
	}
	self.definitions.temporary_first_aid_damage_reduction = {
		category = "temporary",
		name_id = "menu_temporary_first_aid_damage_reduction",
		upgrade = {
			category = "temporary",
			upgrade = "first_aid_damage_reduction",
			value = 1
		}
	}
	self.definitions.temporary_passive_revive_damage_reduction_1 = {
		category = "feature",
		name_id = "menu_passive_revive_damage_reduction_1",
		upgrade = {
			category = "temporary",
			upgrade = "passive_revive_damage_reduction_1",
			value = 1
		}
	}
	self.definitions.temporary_passive_revive_damage_reduction_2 = {
		category = "feature",
		name_id = "menu_passive_revive_damage_reduction",
		upgrade = {
			category = "temporary",
			upgrade = "passive_revive_damage_reduction",
			value = 2
		}
	}
	self.definitions.temporary_loose_ammo_restore_health_1 = {
		category = "temporary",
		name_id = "menu_temporary_loose_ammo_restore_health",
		upgrade = {
			category = "temporary",
			upgrade = "loose_ammo_restore_health",
			value = 1
		}
	}
	self.definitions.temporary_loose_ammo_restore_health_2 = {
		category = "temporary",
		name_id = "menu_temporary_loose_ammo_restore_health",
		upgrade = {
			category = "temporary",
			upgrade = "loose_ammo_restore_health",
			value = 2
		}
	}
	self.definitions.temporary_loose_ammo_restore_health_3 = {
		category = "temporary",
		name_id = "menu_temporary_loose_ammo_restore_health",
		upgrade = {
			category = "temporary",
			upgrade = "loose_ammo_restore_health",
			value = 3
		}
	}
	self.definitions.temporary_loose_ammo_give_team = {
		category = "temporary",
		name_id = "menu_temporary_loose_ammo_give_team",
		upgrade = {
			category = "temporary",
			upgrade = "loose_ammo_give_team",
			value = 1
		}
	}
end

function UpgradesTweakData:_mrwi_definitions()
	for i = 1, 4 do
		self.definitions["mrwi_health_multiplier_" .. tostring(i)] = {
			category = "feature",
			incremental = true,
			name_id = "menu_mrwi_health_multiplier",
			upgrade = {
				category = "player",
				upgrade = "mrwi_health_multiplier",
				value = 1
			}
		}
		self.definitions["mrwi_armor_multiplier_" .. tostring(i)] = {
			category = "feature",
			incremental = true,
			name_id = "menu_mrwi_armor_multiplier",
			upgrade = {
				category = "player",
				upgrade = "mrwi_armor_multiplier",
				value = 1
			}
		}
		self.definitions["mrwi_dodge_chance_" .. tostring(i)] = {
			category = "feature",
			incremental = true,
			name_id = "menu_mrwi_dodge_chance",
			upgrade = {
				category = "player",
				upgrade = "mrwi_dodge_chance",
				value = 1
			}
		}
		self.definitions["mrwi_crouch_speed_multiplier_" .. tostring(i)] = {
			category = "feature",
			incremental = true,
			name_id = "menu_mrwi_crouch_speed_multiplier",
			upgrade = {
				category = "player",
				upgrade = "mrwi_crouch_speed_multiplier",
				value = 1
			}
		}
		self.definitions["mrwi_carry_speed_multiplier_" .. tostring(i)] = {
			category = "feature",
			incremental = true,
			name_id = "menu_mrwi_carry_speed_multiplier",
			upgrade = {
				category = "player",
				upgrade = "mrwi_carry_speed_multiplier",
				value = 1
			}
		}
	end

	self.definitions.player_primary_reload_secondary_1 = {
		category = "feature",
		name_id = "menu_player_primary_reload_secondary",
		upgrade = {
			category = "player",
			upgrade = "primary_reload_secondary",
			value = 1
		}
	}
	self.definitions.player_secondary_reload_primary_1 = {
		category = "feature",
		name_id = "menu_player_secondary_reload_primary",
		upgrade = {
			category = "player",
			upgrade = "secondary_reload_primary",
			value = 1
		}
	}
	self.definitions.weapon_mrwi_swap_speed_multiplier_1 = {
		category = "feature",
		name_id = "menu_weapon_mrwi_swap_speed_multiplier",
		upgrade = {
			category = "weapon",
			upgrade = "mrwi_swap_speed_multiplier",
			value = 1
		}
	}
	self.definitions.weapon_mrwi_primary_reload_swap_secondary_1 = {
		category = "feature",
		name_id = "weapon_mrwi_primary_reload_swap_secondary",
		upgrade = {
			category = "weapon",
			upgrade = "primary_reload_swap_secondary",
			value = 1
		}
	}
	self.definitions.weapon_mrwi_secondary_reload_swap_primary_1 = {
		category = "feature",
		name_id = "weapon_mrwi_secondary_reload_swap_primary",
		upgrade = {
			category = "weapon",
			upgrade = "secondary_reload_swap_primary",
			value = 1
		}
	}
	self.definitions.player_headshot_regen_health_bonus_1 = {
		category = "feature",
		name_id = "menu_player_headshot_regen_health_bonus",
		upgrade = {
			category = "player",
			upgrade = "headshot_regen_health_bonus",
			value = 1
		}
	}
	self.definitions.player_dodge_ricochet_bullets = {
		category = "feature",
		name_id = "menu_player_dodge_ricochet_bullets",
		upgrade = {
			category = "player",
			upgrade = "dodge_ricochet_bullets",
			value = 1
		}
	}
	self.definitions.player_dodge_ricochet_bullets = {
		category = "feature",
		name_id = "menu_player_dodge_ricochet_bullets",
		upgrade = {
			category = "player",
			upgrade = "dodge_ricochet_bullets",
			value = 1
		}
	}
	self.definitions.temporary_mrwi_health_invulnerable_1 = {
		category = "temporary",
		name_id = "menu_temporary_mrwi_health_invulnerable",
		upgrade = {
			category = "temporary",
			upgrade = "mrwi_health_invulnerable",
			value = 1
		}
	}
	self.definitions.temporary_armor_break_invulnerable_2 = {
		category = "temporary",
		name_id = "menu_temporary_armor_break_invulnerable",
		upgrade = {
			category = "temporary",
			upgrade = "armor_break_invulnerable",
			value = 2
		}
	}
end

function UpgradesTweakData.mrwi_deck9_options()
	local deck9_options = {
		{
			tier = 1,
			tree = 1
		},
		{
			tier = 7,
			tree = 2
		},
		{
			desc_id = "menu_deck23_9_3_desc",
			short_id = "menu_deck23_9_3_short",
			tier = 1,
			tree = 3,
			upgrades = {
				"player_tier_armor_multiplier_3",
				"player_armor_regen_timer_multiplier_passive"
			},
			custom_editable_descs = {
				[1] = "20%",
				[2] = "10%"
			}
		},
		{
			tier = 3,
			tree = 4
		},
		{
			tier = 3,
			tree = 5,
			upgrades = {
				"player_perk_armor_regen_timer_multiplier_1"
			},
			custom_editable_descs = {
				[1] = "15%"
			}
		},
		{
			tier = 3,
			tree = 6
		},
		{
			desc_id = "menu_deck23_9_7_desc",
			name_id = "menu_deck7_7",
			short_id = "menu_deck23_9_7_short",
			custom_editable_descs = {
				"20%",
				"20%",
				"10%"
			},
			icon_xy = {
				1,
				4
			},
			upgrades = {
				"player_tier_dodge_chance_1",
				"player_stand_still_crouch_camouflage_bonus_1",
				"player_stand_still_crouch_camouflage_bonus_2",
				"player_stand_still_crouch_camouflage_bonus_3",
				"player_alarm_pager_speed_multiplier"
			}
		},
		{
			desc_id = "menu_deck8_1_desc",
			tier = 7,
			tree = 8,
			upgrades = {
				"player_damage_dampener_close_contact_1",
				"player_damage_dampener_close_contact_2"
			},
			custom_editable_descs = {
				[1] = "24%"
			}
		},
		{
			tier = 3,
			tree = 9
		},
		{
			tier = 1,
			tree = 10
		},
		{
			desc_id = "menu_deck23_9_11_desc",
			short_id = "menu_deck23_9_11_short",
			tier = 3,
			tree = 11,
			upgrades = {
				"player_damage_to_hot_1"
			},
			custom_editable_descs = {
				"2",
				"0.3",
				"3",
				"1.5",
				"20%"
			}
		},
		{
			tier = 3,
			tree = 12
		},
		{
			desc_id = "menu_deck23_9_13_desc",
			short_id = "menu_deck23_9_13_short",
			tier = 3,
			tree = 13,
			upgrades = {
				"player_armor_health_store_amount_1"
			},
			custom_editable_descs = {
				"8",
				"1",
				"10%"
			}
		},
		{
			desc_id = "menu_deck23_9_14_desc",
			short_id = "menu_deck23_9_14_short",
			tier = 3,
			tree = 14,
			upgrades = {
				"player_cocaine_stacking_1"
			},
			custom_editable_descs = {
				"100%",
				"240",
				"4",
				"600",
				"1",
				"30",
				"60% + 80",
				"8"
			}
		},
		{
			tier = 1,
			tree = 15,
			upgrades = {
				"temporary_armor_break_invulnerable_2"
			},
			custom_editable_descs = {
				[2] = "45"
			}
		},
		{
			tier = 1,
			tree = 16
		},
		{
			tier = 1,
			tree = 17
		},
		{
			tier = 1,
			tree = 18
		},
		{
			tier = 1,
			tree = 19
		},
		{
			tier = 1,
			tree = 20
		},
		{
			tier = 1,
			tree = 21
		},
		{
			shorten_desc = true,
			tier = 1,
			tree = 22
		}
	}

	return deck9_options
end

function UpgradesTweakData:_cooldown_definitions()
	self.definitions.cooldown_long_dis_revive = {
		category = "cooldown",
		name_id = "menu_cooldown_long_dis_revive",
		upgrade = {
			category = "cooldown",
			upgrade = "long_dis_revive",
			value = 1
		}
	}
end

function UpgradesTweakData:_shape_charge_definitions()
	self.definitions.shape_charge = {
		category = "equipment",
		equipment_id = "shape_charge",
		name_id = "menu_shape_charge"
	}
end

function UpgradesTweakData:_m4_definitions()
	self.definitions.m4 = {
		category = "weapon",
		description_text_id = "des_m4",
		icon = "m4",
		image = "upgrades_m4",
		image_slice = "upgrades_m4_slice",
		name_id = "debug_m4_rifle",
		prio = "high",
		title_id = "debug_m4_rifle_short",
		unlock_lvl = 0,
		weapon_id = "m4",
		unit_name = Idstring("units/weapons/m4_rifle/m4_rifle")
	}

	for i, _ in ipairs(self.values.m4.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "m4_mag" .. i - 1 or "m4"
		local unlock_lvl = 3
		local prio = i == 1 and "high"

		self.definitions["m4_mag" .. i] = {
			category = "feature",
			description_text_id = "clip_ammo_increase",
			icon = "m4",
			image = "upgrades_m4",
			image_slice = "upgrades_m4_slice",
			title_id = "debug_m4_rifle_short",
			tree = 3,
			step = self.steps.m4.clip_ammo_increase[i],
			name_id = "debug_upgrade_m4_mag" .. i,
			subtitle_id = "debug_upgrade_mag" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m4",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.m4.spread_multiplier) do
		local depends_on = i - 1 > 0 and "m4_spread" .. i - 1 or "m4"
		local unlock_lvl = 4
		local prio = i == 1 and "high"

		self.definitions["m4_spread" .. i] = {
			category = "feature",
			description_text_id = "spread_multiplier",
			icon = "m4",
			image = "upgrades_m4",
			image_slice = "upgrades_m4_slice",
			title_id = "debug_m4_rifle_short",
			tree = 2,
			step = self.steps.m4.spread_multiplier[i],
			name_id = "debug_upgrade_m4_spread" .. i,
			subtitle_id = "debug_upgrade_spread" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m4",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.m4.damage_multiplier) do
		local depends_on = i - 1 > 0 and "m4_damage" .. i - 1 or "m4"
		local unlock_lvl = 5
		local prio = i == 1 and "high"

		self.definitions["m4_damage" .. i] = {
			category = "feature",
			description_text_id = "damage_multiplier",
			icon = "m4",
			image = "upgrades_m4",
			image_slice = "upgrades_m4_slice",
			title_id = "debug_m4_rifle_short",
			tree = 1,
			step = self.steps.m4.damage_multiplier[i],
			name_id = "debug_upgrade_m4_damage" .. i,
			subtitle_id = "debug_upgrade_damage" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m4",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_m14_definitions()
	self.definitions.m14 = {
		category = "weapon",
		description_text_id = "des_m14",
		icon = "m14",
		image = "upgrades_m14",
		image_slice = "upgrades_m14_slice",
		name_id = "debug_m14",
		prio = "high",
		step = 17,
		subtitle_id = "debug_m14_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 2,
		unlock_lvl = 101,
		weapon_id = "m14",
		unit_name = Idstring("units/weapons/m14/m14")
	}

	for i, _ in ipairs(self.values.m14.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "m14_mag" .. i - 1 or "m14"
		local unlock_lvl = 102
		local prio = i == 1 and "high"

		self.definitions["m14_mag" .. i] = {
			category = "feature",
			description_text_id = "clip_ammo_increase",
			icon = "m14",
			image = "upgrades_m14",
			image_slice = "upgrades_m14_slice",
			title_id = "debug_m14_short",
			tree = 2,
			step = self.steps.m14.clip_ammo_increase[i],
			name_id = "debug_upgrade_m14_mag" .. i,
			subtitle_id = "debug_upgrade_mag" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m14",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.m14.spread_multiplier) do
		local depends_on = i - 1 > 0 and "m14_spread" .. i - 1 or "m14"
		local unlock_lvl = 102
		local prio = i == 1 and "high"

		self.definitions["m14_spread" .. i] = {
			category = "feature",
			description_text_id = "spread_multiplier",
			icon = "m14",
			image = "upgrades_m14",
			image_slice = "upgrades_m14_slice",
			title_id = "debug_m14_short",
			tree = 2,
			step = self.steps.m14.spread_multiplier[i],
			name_id = "debug_upgrade_m14_spread" .. i,
			subtitle_id = "debug_upgrade_spread" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m14",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.m14.damage_multiplier) do
		local depends_on = i - 1 > 0 and "m14_damage" .. i - 1 or "m14"
		local unlock_lvl = 102
		local prio = i == 1 and "high"

		self.definitions["m14_damage" .. i] = {
			category = "feature",
			description_text_id = "damage_multiplier",
			icon = "m14",
			image = "upgrades_m14",
			image_slice = "upgrades_m14_slice",
			title_id = "debug_m14_short",
			tree = 2,
			step = self.steps.m14.damage_multiplier[i],
			name_id = "debug_upgrade_m14_damage" .. i,
			subtitle_id = "debug_upgrade_damage" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m14",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.m14.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "m14_recoil" .. i - 1 or "m14"
		local unlock_lvl = 102
		local prio = i == 1 and "high"

		self.definitions["m14_recoil" .. i] = {
			category = "feature",
			description_text_id = "recoil_multiplier",
			icon = "m14",
			image = "upgrades_m14",
			image_slice = "upgrades_m14_slice",
			title_id = "debug_m14_short",
			tree = 2,
			step = self.steps.m14.recoil_multiplier[i],
			name_id = "debug_upgrade_m14_recoil" .. i,
			subtitle_id = "debug_upgrade_recoil" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m14",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_mp5_definitions()
	self.definitions.mp5 = {
		category = "weapon",
		description_text_id = "des_mp5",
		icon = "mp5",
		image = "upgrades_mp5",
		image_slice = "upgrades_mp5_slice",
		name_id = "debug_mp5",
		prio = "high",
		step = 21,
		subtitle_id = "debug_mp5_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 3,
		unlock_lvl = 6,
		weapon_id = "mp5",
		unit_name = Idstring("units/weapons/mp5/mp5")
	}

	for i, _ in ipairs(self.values.mp5.spread_multiplier) do
		local depends_on = i - 1 > 0 and "mp5_spread" .. i - 1 or "mp5"
		local unlock_lvl = 7
		local prio = i == 1 and "high"

		self.definitions["mp5_spread" .. i] = {
			category = "feature",
			description_text_id = "spread_multiplier",
			icon = "mp5",
			image = "upgrades_mp5",
			image_slice = "upgrades_mp5_slice",
			title_id = "debug_mp5_short",
			tree = 3,
			step = self.steps.mp5.spread_multiplier[i],
			name_id = "debug_upgrade_mp5_spread" .. i,
			subtitle_id = "debug_upgrade_spread" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mp5",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.mp5.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "mp5_recoil" .. i - 1 or "mp5"
		local unlock_lvl = 8
		local prio = i == 1 and "high"

		self.definitions["mp5_recoil" .. i] = {
			category = "feature",
			description_text_id = "recoil_multiplier",
			icon = "mp5",
			image = "upgrades_mp5",
			image_slice = "upgrades_mp5_slice",
			title_id = "debug_mp5_short",
			tree = 3,
			step = self.steps.mp5.recoil_multiplier[i],
			name_id = "debug_upgrade_mp5_recoil" .. i,
			subtitle_id = "debug_upgrade_recoil" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mp5",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.mp5.reload_speed_multiplier) do
		local depends_on = i - 1 > 0 and "mp5_reload_speed" .. i - 1 or "mp5"
		local unlock_lvl = 9
		local prio = i == 1 and "high"

		self.definitions["mp5_reload_speed" .. i] = {
			category = "feature",
			description_text_id = "reload_speed_multiplier",
			icon = "mp5",
			image = "upgrades_mp5",
			image_slice = "upgrades_mp5_slice",
			title_id = "debug_mp5_short",
			tree = 3,
			step = self.steps.mp5.reload_speed_multiplier[i],
			name_id = "debug_upgrade_mp5_reload_speed" .. i,
			subtitle_id = "debug_upgrade_reload_speed" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mp5",
				upgrade = "reload_speed_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.mp5.enter_steelsight_speed_multiplier) do
		local depends_on = i - 1 > 0 and "mp5_enter_steelsight_speed" .. i - 1 or "mp5"
		local unlock_lvl = 10
		local prio = i == 1 and "high"

		self.definitions["mp5_enter_steelsight_speed" .. i] = {
			category = "feature",
			description_text_id = "enter_steelsight_speed_multiplier",
			icon = "mp5",
			image = "upgrades_mp5",
			image_slice = "upgrades_mp5_slice",
			title_id = "debug_mp5_short",
			tree = 3,
			step = self.steps.mp5.enter_steelsight_speed_multiplier[i],
			name_id = "debug_upgrade_mp5_enter_steelsight_speed" .. i,
			subtitle_id = "debug_upgrade_enter_steelsight_speed" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mp5",
				upgrade = "enter_steelsight_speed_multiplier",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_mac11_definitions()
	self.definitions.mac11 = {
		category = "weapon",
		description_text_id = "des_mac11",
		icon = "mac11",
		image = "upgrades_mac10",
		image_slice = "upgrades_mac10_slice",
		name_id = "debug_mac11",
		prio = "high",
		step = 5,
		subtitle_id = "debug_mac11_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 1,
		unlock_lvl = 81,
		weapon_id = "mac11",
		unit_name = Idstring("units/weapons/mac11/mac11")
	}

	for i, _ in ipairs(self.values.mac11.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "mac11_recoil" .. i - 1 or "mac11"
		local unlock_lvl = 82
		local prio = i == 1 and "high"

		self.definitions["mac11_recoil" .. i] = {
			category = "feature",
			description_text_id = "recoil_multiplier",
			icon = "mac11",
			image = "upgrades_mac10",
			image_slice = "upgrades_mac10_slice",
			title_id = "debug_mac11_short",
			tree = 1,
			step = self.steps.mac11.recoil_multiplier[i],
			name_id = "debug_upgrade_mac11_recoil" .. i,
			subtitle_id = "debug_upgrade_recoil" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mac11",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.mac11.enter_steelsight_speed_multiplier) do
		local depends_on = i - 1 > 0 and "mac11_enter_steelsight_speed" .. i - 1 or "mac11"
		local unlock_lvl = 82
		local prio = i == 1 and "high"

		self.definitions["mac11_enter_steelsight_speed" .. i] = {
			category = "feature",
			description_text_id = "enter_steelsight_speed_multiplier",
			icon = "mac11",
			image = "upgrades_mac10",
			image_slice = "upgrades_mac10_slice",
			title_id = "debug_mac11_short",
			tree = 1,
			step = self.steps.mac11.enter_steelsight_speed_multiplier[i],
			name_id = "debug_upgrade_mac11_enter_steelsight_speed" .. i,
			subtitle_id = "debug_upgrade_enter_steelsight_speed" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mac11",
				upgrade = "enter_steelsight_speed_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.mac11.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "mac11_mag" .. i - 1 or "mac11"
		local unlock_lvl = 82
		local prio = i == 1 and "high"

		self.definitions["mac11_mag" .. i] = {
			category = "feature",
			description_text_id = "clip_ammo_increase",
			icon = "mac11",
			image = "upgrades_mac10",
			image_slice = "upgrades_mac10_slice",
			title_id = "debug_mac11_short",
			tree = 1,
			step = self.steps.mac11.clip_ammo_increase[i],
			name_id = "debug_upgrade_mac11_mag" .. i,
			subtitle_id = "debug_upgrade_mag" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mac11",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_remington_definitions()
	self.definitions.r870_shotgun = {
		category = "weapon",
		description_text_id = "des_r870_shotgun",
		icon = "r870_shotgun",
		image = "upgrades_remington",
		image_slice = "upgrades_remington_slice",
		name_id = "debug_r870_shotgun",
		prio = "high",
		step = 13,
		subtitle_id = "debug_r870_shotgun_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 3,
		unlock_lvl = 1,
		weapon_id = "r870_shotgun",
		unit_name = Idstring("units/weapons/r870_shotgun/r870_shotgun")
	}

	for i, _ in ipairs(self.values.r870_shotgun.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "remington_mag" .. i - 1 or "r870_shotgun"
		local unlock_lvl = 2
		local prio = i == 1 and "high"

		self.definitions["remington_mag" .. i] = {
			category = "feature",
			description_text_id = "clip_ammo_increase",
			icon = "r870_shotgun",
			image = "upgrades_remington",
			image_slice = "upgrades_remington_slice",
			title_id = "debug_r870_shotgun_short",
			tree = 3,
			step = self.steps.r870_shotgun.clip_ammo_increase[i],
			name_id = "debug_upgrade_remington_mag" .. i,
			subtitle_id = "debug_upgrade_mag" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "r870_shotgun",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.r870_shotgun.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "remington_recoil" .. i - 1 or "r870_shotgun"
		local unlock_lvl = 3
		local prio = i == 1 and "high"

		self.definitions["remington_recoil" .. i] = {
			category = "feature",
			description_text_id = "recoil_multiplier",
			icon = "r870_shotgun",
			image = "upgrades_remington",
			image_slice = "upgrades_remington_slice",
			title_id = "debug_r870_shotgun_short",
			tree = 3,
			step = self.steps.r870_shotgun.recoil_multiplier[i],
			name_id = "debug_upgrade_remington_recoil" .. i,
			subtitle_id = "debug_upgrade_recoil" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "r870_shotgun",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.r870_shotgun.damage_multiplier) do
		local depends_on = i - 1 > 0 and "remington_damage" .. i - 1 or "r870_shotgun"
		local unlock_lvl = 4
		local prio = i == 1 and "high"

		self.definitions["remington_damage" .. i] = {
			category = "feature",
			description_text_id = "damage_multiplier",
			icon = "r870_shotgun",
			image = "upgrades_remington",
			image_slice = "upgrades_remington_slice",
			title_id = "debug_r870_shotgun_short",
			tree = 3,
			step = self.steps.r870_shotgun.damage_multiplier[i],
			name_id = "debug_upgrade_remington_damage" .. i,
			subtitle_id = "debug_upgrade_damage" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "r870_shotgun",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_mossberg_definitions()
	self.definitions.mossberg = {
		category = "weapon",
		description_text_id = "des_mossberg",
		icon = "mossberg",
		image = "upgrades_mossberg",
		image_slice = "upgrades_mossberg_slice",
		name_id = "debug_mossberg",
		prio = "high",
		step = 7,
		subtitle_id = "debug_mossberg_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 2,
		unlock_lvl = 120,
		weapon_id = "mossberg",
		unit_name = Idstring("units/weapons/mossberg/mossberg")
	}

	for i, _ in ipairs(self.values.mossberg.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "mossberg_mag" .. i - 1 or "mossberg"
		local unlock_lvl = 121
		local prio = i == 1 and "high"

		self.definitions["mossberg_mag" .. i] = {
			category = "feature",
			description_text_id = "clip_ammo_increase",
			icon = "mossberg",
			image = "upgrades_mossberg",
			image_slice = "upgrades_mossberg_slice",
			title_id = "debug_mossberg_short",
			tree = 2,
			step = self.steps.mossberg.clip_ammo_increase[i],
			name_id = "debug_upgrade_mossberg_mag" .. i,
			subtitle_id = "debug_upgrade_mag" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mossberg",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.mossberg.reload_speed_multiplier) do
		local depends_on = i - 1 > 0 and "mossberg_reload_speed" .. i - 1 or "mossberg"
		local unlock_lvl = 121
		local prio = i == 1 and "high"

		self.definitions["mossberg_reload_speed" .. i] = {
			category = "feature",
			description_text_id = "reload_speed_multiplier",
			icon = "mossberg",
			image = "upgrades_mossberg",
			image_slice = "upgrades_mossberg_slice",
			title_id = "debug_mossberg_short",
			tree = 2,
			step = self.steps.mossberg.reload_speed_multiplier[i],
			name_id = "debug_upgrade_mossberg_reload_speed" .. i,
			subtitle_id = "debug_upgrade_reload_speed" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mossberg",
				upgrade = "reload_speed_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.mossberg.fire_rate_multiplier) do
		local depends_on = i - 1 > 0 and "mossberg_fire_rate_multiplier" .. i - 1 or "mossberg"
		local unlock_lvl = 121
		local prio = i == 1 and "high"

		self.definitions["mossberg_fire_rate_multiplier" .. i] = {
			category = "feature",
			description_text_id = "fire_rate_multiplier",
			icon = "mossberg",
			image = "upgrades_mossberg",
			image_slice = "upgrades_mossberg_slice",
			title_id = "debug_mossberg_short",
			tree = 2,
			step = self.steps.mossberg.fire_rate_multiplier[i],
			name_id = "debug_upgrade_mossberg_fire_rate" .. i,
			subtitle_id = "debug_upgrade_fire_rate" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mossberg",
				upgrade = "fire_rate_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.mossberg.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "mossberg_recoil_multiplier" .. i - 1 or "mossberg"
		local unlock_lvl = 121
		local prio = i == 1 and "high"

		self.definitions["mossberg_recoil_multiplier" .. i] = {
			category = "feature",
			description_text_id = "recoil_multiplier",
			icon = "mossberg",
			image = "upgrades_mossberg",
			image_slice = "upgrades_mossberg_slice",
			title_id = "debug_mossberg_short",
			tree = 2,
			step = self.steps.mossberg.recoil_multiplier[i],
			name_id = "debug_upgrade_mossberg_recoil_multiplier" .. i,
			subtitle_id = "debug_upgrade_recoil" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "mossberg",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_ak47_definitions()
	self.definitions.ak47 = {
		category = "weapon",
		description_text_id = "des_ak47",
		icon = "ak",
		image = "upgrades_ak",
		image_slice = "upgrades_ak_slice",
		name_id = "debug_ak47",
		prio = "high",
		step = 9,
		subtitle_id = "debug_ak47_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 4,
		unlock_lvl = 0,
		weapon_id = "ak47",
		unit_name = Idstring("units/weapons/ak47/ak")
	}

	for i, _ in ipairs(self.values.ak47.damage_multiplier) do
		local depends_on = i - 1 > 0 and "ak47_damage" .. i - 1 or "ak47"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["ak47_damage" .. i] = {
			category = "feature",
			description_text_id = "damage_multiplier",
			icon = "ak",
			image = "upgrades_ak",
			image_slice = "upgrades_ak_slice",
			title_id = "debug_ak47_short",
			tree = 4,
			step = self.steps.ak47.damage_multiplier[i],
			name_id = "debug_upgrade_ak47_damage" .. i,
			subtitle_id = "debug_upgrade_damage" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ak47",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.ak47.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "ak47_recoil" .. i - 1 or "ak47"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["ak47_recoil" .. i] = {
			category = "feature",
			description_text_id = "recoil_multiplier",
			icon = "ak",
			image = "upgrades_ak",
			image_slice = "upgrades_ak_slice",
			title_id = "debug_ak47_short",
			tree = 4,
			step = self.steps.ak47.recoil_multiplier[i],
			name_id = "debug_upgrade_ak47_recoil" .. i,
			subtitle_id = "debug_upgrade_recoil" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ak47",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.ak47.spread_multiplier) do
		local depends_on = i - 1 > 0 and "ak47_spread" .. i - 1 or "ak47"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["ak47_spread" .. i] = {
			category = "feature",
			description_text_id = "spread_multiplier",
			icon = "ak",
			image = "upgrades_ak",
			image_slice = "upgrades_ak_slice",
			title_id = "debug_ak47_short",
			tree = 4,
			step = self.steps.ak47.spread_multiplier[i],
			name_id = "debug_upgrade_ak47_spread" .. i,
			subtitle_id = "debug_upgrade_spread" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ak47",
				upgrade = "spread_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.ak47.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "ak47_mag" .. i - 1 or "ak47"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["ak47_mag" .. i] = {
			category = "feature",
			description_text_id = "clip_ammo_increase",
			icon = "ak",
			image = "upgrades_ak",
			image_slice = "upgrades_ak_slice",
			title_id = "debug_ak47_short",
			tree = 4,
			step = self.steps.ak47.clip_ammo_increase[i],
			name_id = "debug_upgrade_ak47_mag" .. i,
			subtitle_id = "debug_upgrade_mag" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "ak47",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_glock_definitions()
	self.definitions.glock = {
		category = "weapon",
		description_text_id = "des_glock",
		icon = "glock",
		image = "upgrades_glock",
		image_slice = "upgrades_glock_slice",
		name_id = "debug_glock",
		prio = "high",
		step = 2,
		subtitle_id = "debug_glock_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 4,
		unlock_lvl = 0,
		weapon_id = "glock",
		unit_name = Idstring("units/weapons/glock/glock")
	}

	for i, _ in ipairs(self.values.glock.damage_multiplier) do
		local depends_on = i - 1 > 0 and "glock_damage" .. i - 1 or "glock"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["glock_damage" .. i] = {
			category = "feature",
			description_text_id = "damage_multiplier",
			icon = "glock",
			image = "upgrades_glock",
			image_slice = "upgrades_glock_slice",
			title_id = "debug_glock_short",
			tree = 4,
			step = self.steps.glock.damage_multiplier[i],
			name_id = "debug_upgrade_glock_damage" .. i,
			subtitle_id = "debug_upgrade_damage" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "glock",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.glock.recoil_multiplier) do
		local depends_on = i - 1 > 0 and "glock_recoil" .. i - 1 or "glock"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["glock_recoil" .. i] = {
			category = "feature",
			description_text_id = "recoil_multiplier",
			icon = "glock",
			image = "upgrades_glock",
			image_slice = "upgrades_glock_slice",
			title_id = "debug_glock_short",
			tree = 4,
			step = self.steps.glock.recoil_multiplier[i],
			name_id = "debug_upgrade_glock_recoil" .. i,
			subtitle_id = "debug_upgrade_recoil" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "glock",
				upgrade = "recoil_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.glock.clip_ammo_increase) do
		local depends_on = i - 1 > 0 and "glock_mag" .. i - 1 or "glock"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["glock_mag" .. i] = {
			category = "feature",
			description_text_id = "clip_ammo_increase",
			icon = "glock",
			image = "upgrades_glock",
			image_slice = "upgrades_glock_slice",
			title_id = "debug_glock_short",
			tree = 4,
			step = self.steps.glock.clip_ammo_increase[i],
			name_id = "debug_upgrade_glock_mag" .. i,
			subtitle_id = "debug_upgrade_mag" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "glock",
				upgrade = "clip_ammo_increase",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.glock.reload_speed_multiplier) do
		local depends_on = i - 1 > 0 and "glock_reload_speed" .. i - 1 or "glock"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["glock_reload_speed" .. i] = {
			category = "feature",
			description_text_id = "reload_speed_multiplier",
			icon = "glock",
			image = "upgrades_glock",
			image_slice = "upgrades_glock_slice",
			title_id = "debug_glock_short",
			tree = 4,
			step = self.steps.glock.reload_speed_multiplier[i],
			name_id = "debug_upgrade_glock_reload_speed" .. i,
			subtitle_id = "debug_upgrade_reload_speed" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "glock",
				upgrade = "reload_speed_multiplier",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_m79_definitions()
	self.definitions.m79 = {
		category = "weapon",
		description_text_id = "des_m79",
		icon = "m79",
		image = "upgrades_grenade",
		image_slice = "upgrades_grenade_slice",
		name_id = "debug_m79",
		prio = "high",
		step = 21,
		subtitle_id = "debug_m79_short",
		title_id = "debug_upgrade_new_weapon",
		tree = 4,
		unlock_lvl = 0,
		weapon_id = "m79",
		unit_name = Idstring("units/weapons/m79/m79")
	}

	for i, _ in ipairs(self.values.m79.damage_multiplier) do
		local depends_on = i - 1 > 0 and "m79_damage" .. i - 1 or "m79"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["m79_damage" .. i] = {
			category = "feature",
			description_text_id = "damage_multiplier",
			icon = "m79",
			image = "upgrades_grenade",
			image_slice = "upgrades_grenade_slice",
			title_id = "debug_m79_short",
			tree = 4,
			step = self.steps.m79.damage_multiplier[i],
			name_id = "debug_upgrade_m79_damage" .. i,
			subtitle_id = "debug_upgrade_damage" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m79",
				upgrade = "damage_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.m79.explosion_range_multiplier) do
		local depends_on = i - 1 > 0 and "m79_expl_range" .. i - 1 or "m79"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["m79_expl_range" .. i] = {
			category = "feature",
			description_text_id = "explosion_range_multiplier",
			icon = "m79",
			image = "upgrades_grenade",
			image_slice = "upgrades_grenade_slice",
			title_id = "debug_m79_short",
			tree = 4,
			step = self.steps.m79.explosion_range_multiplier[i],
			name_id = "debug_upgrade_m79_expl_range" .. i,
			subtitle_id = "debug_upgrade_expl_range" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m79",
				upgrade = "explosion_range_multiplier",
				value = i
			}
		}
	end

	for i, _ in ipairs(self.values.m79.clip_amount_increase) do
		local depends_on = i - 1 > 0 and "m79_clip_num" .. i - 1 or "m79"
		local unlock_lvl = 141
		local prio = i == 1 and "high"

		self.definitions["m79_clip_num" .. i] = {
			category = "feature",
			description_text_id = "clip_amount_increase",
			icon = "m79",
			image = "upgrades_grenade",
			image_slice = "upgrades_grenade_slice",
			title_id = "debug_m79_short",
			tree = 4,
			step = self.steps.m79.clip_amount_increase[i],
			name_id = "debug_upgrade_m79_clip_num" .. i,
			subtitle_id = "debug_upgrade_clip_num" .. i,
			depends_on = depends_on,
			unlock_lvl = unlock_lvl,
			prio = prio,
			upgrade = {
				category = "m79",
				upgrade = "clip_amount_increase",
				value = i
			}
		}
	end
end

function UpgradesTweakData:_akimbo_definitions()
	self.definitions.akimbo_damage_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_akimbo_damage_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_damage_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_akimbo_damage_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "damage_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_extra_ammo_multiplier_1 = {
		category = "feature",
		incremental = true,
		name_id = "menu_akimbo_extra_ammo_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "extra_ammo_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_extra_ammo_multiplier_2 = {
		category = "feature",
		incremental = true,
		name_id = "menu_akimbo_extra_ammo_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "extra_ammo_multiplier",
			value = 2
		}
	}
	self.definitions.akimbo_recoil_multiplier_1 = {
		category = "feature",
		name_id = "menu_akimbo_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_recoil_multiplier_2 = {
		category = "feature",
		name_id = "menu_akimbo_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_multiplier",
			value = 2
		}
	}
	self.definitions.akimbo_recoil_multiplier_3 = {
		category = "feature",
		name_id = "menu_akimbo_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "recoil_multiplier",
			value = 3
		}
	}
	self.definitions.akimbo_passive_recoil_multiplier_1 = {
		category = "feature",
		name_id = "menu_akimbo_passive_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "passive_recoil_multiplier",
			value = 1
		}
	}
	self.definitions.akimbo_passive_recoil_multiplier_2 = {
		category = "feature",
		name_id = "menu_akimbo_passive_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "passive_recoil_multiplier",
			value = 2
		}
	}
	self.definitions.akimbo_passive_recoil_multiplier_3 = {
		category = "feature",
		name_id = "menu_akimbo_passive_recoil_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "passive_recoil_multiplier",
			value = 3
		}
	}
	self.definitions.akimbo_spread_multiplier = {
		category = "feature",
		name_id = "menu_pistol_spread_multiplier",
		upgrade = {
			category = "akimbo",
			upgrade = "spread_multiplier",
			value = 1
		}
	}
end

function UpgradesTweakData:_first_aid_kit_definitions()
	self.definitions.first_aid_kit = {
		category = "equipment",
		equipment_id = "first_aid_kit",
		name_id = "menu_equipment_first_aid_kit",
		slot = 1
	}
	self.definitions.first_aid_kit_quantity_increase_1 = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_quantity_1",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.first_aid_kit_quantity_increase_2 = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_quantity_2",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "quantity",
			value = 1
		}
	}
	self.definitions.first_aid_kit_deploy_time_multiplier = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_deploy_time_multiplier",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "deploy_time_multiplier",
			value = 1
		}
	}
	self.definitions.first_aid_kit_damage_reduction_upgrade = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_damage_reduction_upgrade",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "damage_reduction_upgrade",
			value = 1
		}
	}
	self.definitions.first_aid_kit_downs_restore_chance = {
		category = "equipment_upgrade",
		incremental = true,
		name_id = "menu_first_aid_kit_downs_restore_chance",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "downs_restore_chance",
			value = 1
		}
	}
	self.definitions.first_aid_kit_auto_recovery_1 = {
		category = "equipment_upgrade",
		name_id = "menu_first_aid_kit_downs_restore_chance",
		upgrade = {
			category = "first_aid_kit",
			upgrade = "first_aid_kit_auto_recovery",
			value = 1
		}
	}
end

function UpgradesTweakData:_bodybags_bag_definitions()
	self.definitions.bodybags_bag = {
		category = "equipment",
		equipment_id = "bodybags_bag",
		name_id = "menu_equipment_bodybags_bag",
		slot = 1
	}
	self.definitions.bodybags_bag_quantity = {
		category = "equipment_upgrade",
		name_id = "menu_bodybags_bag_quantity",
		upgrade = {
			category = "bodybags_bag",
			upgrade = "quantity",
			value = 1
		}
	}
end

function UpgradesTweakData:_grenade_crate_definitions()
	self.definitions.grenade_crate = {
		category = "equipment",
		dlc = "mxm",
		equipment_id = "grenade_crate",
		name_id = "menu_equipment_grenade_crate",
		slot = 1
	}
end

function UpgradesTweakData:_spy_camera_definitions()
	self.definitions.spy_camera = {
		category = "equipment",
		dlc = "esp",
		equipment_id = "spy_camera",
		name_id = "menu_equipment_spy_camera",
		slot = 1
	}
end

function UpgradesTweakData:_jowi_definitions()
	self.definitions.jowi = {
		category = "weapon",
		factory_id = "wpn_fps_jowi",
		weapon_id = "jowi"
	}
end

function UpgradesTweakData:_x_1911_definitions()
	self.definitions.x_1911 = {
		category = "weapon",
		factory_id = "wpn_fps_x_1911",
		weapon_id = "x_1911"
	}
end

function UpgradesTweakData:_x_b92fs_definitions()
	self.definitions.x_b92fs = {
		category = "weapon",
		factory_id = "wpn_fps_x_b92fs",
		weapon_id = "x_b92fs"
	}
end

function UpgradesTweakData:_x_deagle_definitions()
	self.definitions.x_deagle = {
		category = "weapon",
		factory_id = "wpn_fps_x_deagle",
		weapon_id = "x_deagle"
	}
end

function UpgradesTweakData:_g26_definitions()
	self.definitions.g26 = {
		category = "weapon",
		dlc = "john_wick_character",
		factory_id = "wpn_fps_pis_g26",
		weapon_id = "g26"
	}
end

function UpgradesTweakData:_kabartanto_definitions()
	self.definitions.kabartanto = {
		category = "melee_weapon",
		dlc = "john_wick_character"
	}
end

function UpgradesTweakData:_toothbrush_definitions()
	self.definitions.toothbrush = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
end

function UpgradesTweakData:_chef_definitions()
	self.definitions.chef = {
		category = "melee_weapon",
		dlc = "pd2_clan"
	}
end

function UpgradesTweakData:_x_g22c_definitions()
	self.definitions.x_g22c = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_g22c",
		weapon_id = "x_g22c"
	}
end

function UpgradesTweakData:_x_g17_definitions()
	self.definitions.x_g17 = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_g17",
		weapon_id = "x_g17"
	}
end

function UpgradesTweakData:_x_usp_definitions()
	self.definitions.x_usp = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_usp",
		weapon_id = "x_usp"
	}
end

function UpgradesTweakData:_flamethrower_mk2_definitions()
	self.definitions.flamethrower_mk2 = {
		category = "weapon",
		dlc = "bbq",
		factory_id = "wpn_fps_fla_mk2",
		weapon_id = "flamethrower_mk2"
	}
end

function UpgradesTweakData:_m32_definitions()
	self.definitions.m32 = {
		category = "weapon",
		dlc = "bbq",
		factory_id = "wpn_fps_gre_m32",
		weapon_id = "m32"
	}
end

function UpgradesTweakData:_aa12_definitions()
	self.definitions.aa12 = {
		category = "weapon",
		dlc = "bbq",
		factory_id = "wpn_fps_sho_aa12",
		weapon_id = "aa12"
	}
end

function UpgradesTweakData:_bbq_weapon_definitions()
	self.definitions.fork = {
		category = "melee_weapon",
		dlc = "bbq"
	}
	self.definitions.spatula = {
		category = "melee_weapon",
		dlc = "bbq"
	}
	self.definitions.poker = {
		category = "melee_weapon",
		dlc = "bbq"
	}
	self.definitions.tenderizer = {
		category = "melee_weapon",
		dlc = "bbq"
	}
	self.flame_bullet = {}
	self.flame_bullet.push_units = false
	self.flame_bullet.show_blood_hits = false
end

function UpgradesTweakData:_peacemaker_definitions()
	self.definitions.peacemaker = {
		category = "weapon",
		dlc = "west",
		factory_id = "wpn_fps_pis_peacemaker",
		weapon_id = "peacemaker"
	}
end

function UpgradesTweakData:_winchester1874_definitions()
	self.definitions.winchester1874 = {
		category = "weapon",
		dlc = "west",
		factory_id = "wpn_fps_snp_winchester",
		weapon_id = "winchester1874"
	}
end

function UpgradesTweakData:_plainsrider_definitions()
	self.definitions.plainsrider = {
		category = "weapon",
		dlc = "west",
		factory_id = "wpn_fps_bow_plainsrider",
		weapon_id = "plainsrider"
	}
end

function UpgradesTweakData:_mateba_definitions()
	self.definitions.mateba = {
		category = "weapon",
		dlc = "arena",
		factory_id = "wpn_fps_pis_2006m",
		weapon_id = "mateba"
	}
end

function UpgradesTweakData:_asval_definitions()
	self.definitions.asval = {
		category = "weapon",
		dlc = "character_pack_sokol",
		factory_id = "wpn_fps_ass_asval",
		weapon_id = "asval"
	}
end

function UpgradesTweakData:_sub2000_definitions()
	self.definitions.sub2000 = {
		category = "weapon",
		dlc = "kenaz",
		factory_id = "wpn_fps_ass_sub2000",
		weapon_id = "sub2000"
	}
end

function UpgradesTweakData:_wa2000_definitions()
	self.definitions.wa2000 = {
		category = "weapon",
		dlc = "turtles",
		factory_id = "wpn_fps_snp_wa2000",
		weapon_id = "wa2000"
	}
end

function UpgradesTweakData:_polymer_definitions()
	self.definitions.polymer = {
		category = "weapon",
		dlc = "turtles",
		factory_id = "wpn_fps_smg_polymer",
		weapon_id = "polymer"
	}
end

function UpgradesTweakData:_hunter_definitions()
	self.definitions.hunter = {
		category = "weapon",
		dlc = "turtles",
		factory_id = "wpn_fps_bow_hunter",
		weapon_id = "hunter"
	}
end

function UpgradesTweakData:_baka_definitions()
	self.definitions.baka = {
		category = "weapon",
		dlc = "dragon",
		factory_id = "wpn_fps_smg_baka",
		weapon_id = "baka"
	}
end

function UpgradesTweakData:_arblast_weapon_definitions()
	self.definitions.arblast = {
		category = "weapon",
		dlc = "steel",
		factory_id = "wpn_fps_bow_arblast",
		weapon_id = "arblast"
	}
end

function UpgradesTweakData:_frankish_weapon_definitions()
	self.definitions.frankish = {
		category = "weapon",
		dlc = "steel",
		factory_id = "wpn_fps_bow_frankish",
		weapon_id = "frankish"
	}
end

function UpgradesTweakData:_long_weapon_definitions()
	self.definitions.long = {
		category = "weapon",
		dlc = "steel",
		factory_id = "wpn_fps_bow_long",
		weapon_id = "long"
	}
end

function UpgradesTweakData:_par_weapon_definitions()
	self.definitions.par = {
		category = "weapon",
		factory_id = "wpn_fps_lmg_par",
		weapon_id = "par"
	}
end

function UpgradesTweakData:_sparrow_weapon_definitions()
	self.definitions.sparrow = {
		category = "weapon",
		dlc = "berry",
		factory_id = "wpn_fps_pis_sparrow",
		weapon_id = "sparrow"
	}
end

function UpgradesTweakData:_model70_weapon_definitions()
	self.definitions.model70 = {
		category = "weapon",
		dlc = "rvd",
		factory_id = "wpn_fps_snp_model70",
		weapon_id = "model70"
	}
end

function UpgradesTweakData:_scout_weapon_definitions()
	self.definitions.scout = {
		category = "weapon",
		dlc = "pxp1",
		factory_id = "wpn_fps_snp_scout",
		weapon_id = "scout"
	}
end

function UpgradesTweakData:_m37_weapon_definitions()
	self.definitions.m37 = {
		category = "weapon",
		dlc = "peta",
		factory_id = "wpn_fps_shot_m37",
		weapon_id = "m37"
	}
end

function UpgradesTweakData:_china_weapon_definitions()
	self.definitions.china = {
		category = "weapon",
		dlc = "pal",
		factory_id = "wpn_fps_gre_china",
		weapon_id = "china"
	}
end

function UpgradesTweakData:_sr2_weapon_definitions()
	self.definitions.sr2 = {
		category = "weapon",
		dlc = "coco",
		factory_id = "wpn_fps_smg_sr2",
		weapon_id = "sr2"
	}
end

function UpgradesTweakData:_x_sr2_weapon_definitions()
	self.definitions.x_sr2 = {
		category = "weapon",
		dlc = "coco",
		factory_id = "wpn_fps_smg_x_sr2",
		weapon_id = "x_sr2"
	}
end

function UpgradesTweakData:_pl14_weapon_definitions()
	self.definitions.pl14 = {
		category = "weapon",
		dlc = "mad",
		factory_id = "wpn_fps_pis_pl14",
		weapon_id = "pl14"
	}
end

function UpgradesTweakData:_x_mp5_weapon_definitions()
	self.definitions.x_mp5 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_mp5",
		weapon_id = "x_mp5"
	}
end

function UpgradesTweakData:_x_akmsu_weapon_definitions()
	self.definitions.x_akmsu = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_akmsu",
		weapon_id = "x_akmsu"
	}
end

function UpgradesTweakData:_tecci_weapon_definitions()
	self.definitions.tecci = {
		category = "weapon",
		dlc = "opera",
		factory_id = "wpn_fps_ass_tecci",
		weapon_id = "tecci"
	}
end

function UpgradesTweakData:_hajk_weapon_definitions()
	self.definitions.hajk = {
		category = "weapon",
		dlc = "born",
		factory_id = "wpn_fps_smg_hajk",
		weapon_id = "hajk"
	}
end

function UpgradesTweakData:_boot_weapon_definitions()
	self.definitions.boot = {
		category = "weapon",
		dlc = "wild",
		factory_id = "wpn_fps_sho_boot",
		weapon_id = "boot"
	}
end

function UpgradesTweakData:_packrat_weapon_definitions()
	self.definitions.packrat = {
		category = "weapon",
		dlc = "pim",
		factory_id = "wpn_fps_pis_packrat",
		weapon_id = "packrat"
	}
end

function UpgradesTweakData:_schakal_weapon_definitions()
	self.definitions.schakal = {
		category = "weapon",
		dlc = "pim",
		factory_id = "wpn_fps_smg_schakal",
		weapon_id = "schakal"
	}
end

function UpgradesTweakData:_desertfox_weapon_definitions()
	self.definitions.desertfox = {
		category = "weapon",
		dlc = "pim",
		factory_id = "wpn_fps_snp_desertfox",
		weapon_id = "desertfox"
	}
end

function UpgradesTweakData:_x_packrat_weapon_definitions()
	self.definitions.x_packrat = {
		category = "weapon",
		dlc = "pim",
		factory_id = "wpn_fps_x_packrat",
		weapon_id = "x_packrat"
	}
end

function UpgradesTweakData:_rota_weapon_definitions()
	self.definitions.rota = {
		category = "weapon",
		dlc = "rota",
		factory_id = "wpn_fps_sho_rota",
		weapon_id = "rota"
	}
end

function UpgradesTweakData:_arbiter_weapon_definitions()
	self.definitions.arbiter = {
		category = "weapon",
		dlc = "tango",
		factory_id = "wpn_fps_gre_arbiter",
		weapon_id = "arbiter"
	}
end

function UpgradesTweakData:_ms3gl_weapon_definitions()
	self.definitions.ms3gl = {
		category = "weapon",
		dlc = "pxp1",
		factory_id = "wpn_fps_gre_ms3gl",
		weapon_id = "ms3gl"
	}
end

function UpgradesTweakData:_contraband_weapon_definitions()
	self.definitions.contraband = {
		category = "weapon",
		dlc = "chico",
		factory_id = "wpn_fps_ass_contraband",
		weapon_id = "contraband"
	}
	self.definitions.contraband_m203 = {
		category = "weapon",
		dlc = "chico",
		factory_id = "wpn_fps_ass_contraband_gl_m203",
		weapon_id = "contraband_m203"
	}
end

function UpgradesTweakData:_ray_weapon_definitions()
	self.definitions.ray = {
		category = "weapon",
		dlc = "friend",
		factory_id = "wpn_fps_gre_ray",
		weapon_id = "ray"
	}
end

function UpgradesTweakData:_tti_weapon_definitions()
	self.definitions.tti = {
		category = "weapon",
		dlc = "spa",
		factory_id = "wpn_fps_snp_tti",
		weapon_id = "tti"
	}
end

function UpgradesTweakData:_victor_weapon_definitions()
	self.definitions.victor = {
		category = "weapon",
		dlc = "savi",
		factory_id = "wpn_fps_snp_victor",
		weapon_id = "victor"
	}
end

function UpgradesTweakData:_siltstone_weapon_definitions()
	self.definitions.siltstone = {
		category = "weapon",
		dlc = "grv",
		factory_id = "wpn_fps_snp_siltstone",
		weapon_id = "siltstone"
	}
end

function UpgradesTweakData:_flint_weapon_definitions()
	self.definitions.flint = {
		category = "weapon",
		dlc = "grv",
		factory_id = "wpn_fps_ass_flint",
		weapon_id = "flint"
	}
end

function UpgradesTweakData:_coal_weapon_definitions()
	self.definitions.coal = {
		category = "weapon",
		dlc = "grv",
		factory_id = "wpn_fps_smg_coal",
		weapon_id = "coal"
	}
end

function UpgradesTweakData:_lemming_weapon_definitions()
	self.definitions.lemming = {
		category = "weapon",
		dlc = "pd2_clan",
		factory_id = "wpn_fps_pis_lemming",
		weapon_id = "lemming"
	}
end

function UpgradesTweakData:_rsh12_weapon_definitions()
	self.definitions.rsh12 = {
		category = "weapon",
		dlc = "tawp",
		factory_id = "wpn_fps_pis_rsh12",
		weapon_id = "rsh12"
	}
end

function UpgradesTweakData:_type54_weapon_definitions()
	self.definitions.type54 = {
		category = "weapon",
		dlc = "tawp",
		factory_id = "wpn_fps_pis_type54",
		weapon_id = "type54"
	}
	self.definitions.type54_underbarrel = {
		category = "weapon",
		dlc = "tawp",
		factory_id = "wpn_fps_pis_type54_underbarrel",
		weapon_id = "type54_underbarrel"
	}
end

function UpgradesTweakData:_x_type54_weapon_definitions()
	self.definitions.x_type54 = {
		category = "weapon",
		dlc = "tawp",
		factory_id = "wpn_fps_pis_x_type54",
		weapon_id = "x_type54"
	}
	self.definitions.x_type54_underbarrel = {
		category = "weapon",
		dlc = "tawp",
		factory_id = "wpn_fps_pis_x_type54_underbarrel",
		weapon_id = "x_type54_underbarrel"
	}
end

function UpgradesTweakData:_chinchilla_weapon_definitions()
	self.definitions.chinchilla = {
		category = "weapon",
		dlc = "max",
		factory_id = "wpn_fps_pis_chinchilla",
		weapon_id = "chinchilla"
	}
end

function UpgradesTweakData:_x_chinchilla_weapon_definitions()
	self.definitions.x_chinchilla = {
		category = "weapon",
		dlc = "max",
		factory_id = "wpn_fps_pis_x_chinchilla",
		weapon_id = "x_chinchilla"
	}
end

function UpgradesTweakData:_m590_weapon_definitions()
	self.definitions.m590 = {
		category = "weapon",
		dlc = "fawp",
		factory_id = "wpn_fps_sho_m590",
		weapon_id = "m590"
	}
end

function UpgradesTweakData:_vityaz_weapon_definitions()
	self.definitions.vityaz = {
		category = "weapon",
		dlc = "fawp",
		factory_id = "wpn_fps_smg_vityaz",
		weapon_id = "vityaz"
	}
end

function UpgradesTweakData:_x_vityaz_weapon_definitions()
	self.definitions.x_vityaz = {
		category = "weapon",
		dlc = "fawp",
		factory_id = "wpn_fps_smg_x_vityaz",
		weapon_id = "x_vityaz"
	}
end

function UpgradesTweakData:_m1911_weapon_definitions()
	self.definitions.m1911 = {
		category = "weapon",
		dlc = "fawp",
		factory_id = "wpn_fps_pis_m1911",
		weapon_id = "m1911"
	}
end

function UpgradesTweakData:_x_m1911_weapon_definitions()
	self.definitions.x_m1911 = {
		category = "weapon",
		dlc = "fawp",
		factory_id = "wpn_fps_pis_x_m1911",
		weapon_id = "x_m1911"
	}
end

function UpgradesTweakData:_ultima_weapon_definitions()
	self.definitions.ultima = {
		category = "weapon",
		dlc = "lawp",
		factory_id = "wpn_fps_sho_ultima",
		weapon_id = "ultima"
	}
end

function UpgradesTweakData:_fmg9_weapon_definitions()
	self.definitions.fmg9 = {
		category = "weapon",
		dlc = "lawp",
		factory_id = "wpn_fps_smg_fmg9",
		weapon_id = "fmg9"
	}
end

function UpgradesTweakData:_maxim9_weapon_definitions()
	self.definitions.maxim9 = {
		category = "weapon",
		dlc = "lawp",
		factory_id = "wpn_fps_pis_maxim9",
		weapon_id = "maxim9"
	}
end

function UpgradesTweakData:_x_maxim9_weapon_definitions()
	self.definitions.x_maxim9 = {
		category = "weapon",
		dlc = "lawp",
		factory_id = "wpn_fps_pis_x_maxim9",
		weapon_id = "x_maxim9"
	}
end

function UpgradesTweakData:_groza_weapon_definitions()
	self.definitions.groza = {
		category = "weapon",
		dlc = "sawp",
		factory_id = "wpn_fps_ass_groza",
		weapon_id = "groza"
	}
	self.definitions.groza_underbarrel = {
		category = "weapon",
		dlc = "sawp",
		factory_id = "wpn_fps_ass_groza_gl_gp253",
		weapon_id = "groza_underbarrel"
	}
end

function UpgradesTweakData:_pm9_weapon_definitions()
	self.definitions.pm9 = {
		category = "weapon",
		dlc = "sawp",
		factory_id = "wpn_fps_smg_pm9",
		weapon_id = "pm9"
	}
end

function UpgradesTweakData:_x_pm9_weapon_definitions()
	self.definitions.x_pm9 = {
		category = "weapon",
		dlc = "sawp",
		factory_id = "wpn_fps_smg_x_pm9",
		weapon_id = "x_pm9"
	}
end

function UpgradesTweakData:_qbu88_weapon_definitions()
	self.definitions.qbu88 = {
		category = "weapon",
		dlc = "sawp",
		factory_id = "wpn_fps_snp_qbu88",
		weapon_id = "qbu88"
	}
end

function UpgradesTweakData:_shak12_weapon_definitions()
	self.definitions.shak12 = {
		category = "weapon",
		dlc = "tawp",
		factory_id = "wpn_fps_ass_shak12",
		weapon_id = "shak12"
	}
end

function UpgradesTweakData:_hailstorm_weapon_definitions()
	self.definitions.hailstorm = {
		category = "weapon",
		dlc = "pxp2",
		factory_id = "wpn_fps_hailstorm",
		weapon_id = "hailstorm"
	}
end

function UpgradesTweakData:_korth_weapon_definitions()
	self.definitions.korth = {
		category = "weapon",
		dlc = "pxp2",
		factory_id = "wpn_fps_pis_korth",
		weapon_id = "korth"
	}
end

function UpgradesTweakData:_x_korth_weapon_definitions()
	self.definitions.x_korth = {
		category = "weapon",
		dlc = "pxp2",
		factory_id = "wpn_fps_pis_x_korth",
		weapon_id = "x_korth"
	}
end

function UpgradesTweakData:_x_sko12_weapon_definitions()
	self.definitions.x_sko12 = {
		category = "weapon",
		dlc = "pxp2",
		factory_id = "wpn_fps_sho_x_sko12",
		weapon_id = "x_sko12"
	}
end

function UpgradesTweakData:_sbl_weapon_definitions()
	self.definitions.sbl = {
		category = "weapon",
		dlc = "mxw",
		factory_id = "wpn_fps_snp_sbl",
		weapon_id = "sbl"
	}
end

function UpgradesTweakData:_m1897_weapon_definitions()
	self.definitions.m1897 = {
		category = "weapon",
		dlc = "mxw",
		factory_id = "wpn_fps_shot_m1897",
		weapon_id = "m1897"
	}
end

function UpgradesTweakData:_model3_weapon_definitions()
	self.definitions.model3 = {
		category = "weapon",
		dlc = "mxw",
		factory_id = "wpn_fps_pis_model3",
		weapon_id = "model3"
	}
end

function UpgradesTweakData:_x_model3_weapon_definitions()
	self.definitions.x_model3 = {
		category = "weapon",
		dlc = "mxw",
		factory_id = "wpn_fps_pis_x_model3",
		weapon_id = "x_model3"
	}
end

function UpgradesTweakData:_shepheard_weapon_definitions()
	self.definitions.shepheard = {
		category = "weapon",
		factory_id = "wpn_fps_smg_shepheard",
		weapon_id = "shepheard"
	}
end

function UpgradesTweakData:_x_shepheard_weapon_definitions()
	self.definitions.x_shepheard = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_shepheard",
		weapon_id = "x_shepheard"
	}
end

function UpgradesTweakData:_breech_weapon_definitions()
	self.definitions.breech = {
		category = "weapon",
		factory_id = "wpn_fps_pis_breech",
		weapon_id = "breech"
	}
end

function UpgradesTweakData:_ching_weapon_definitions()
	self.definitions.ching = {
		category = "weapon",
		factory_id = "wpn_fps_ass_ching",
		weapon_id = "ching"
	}
end

function UpgradesTweakData:_erma_weapon_definitions()
	self.definitions.erma = {
		category = "weapon",
		factory_id = "wpn_fps_smg_erma",
		weapon_id = "erma"
	}
end

function UpgradesTweakData:_ecp_weapon_definitions()
	self.definitions.ecp = {
		category = "weapon",
		dlc = "ecp",
		factory_id = "wpn_fps_bow_ecp",
		weapon_id = "ecp"
	}
end

function UpgradesTweakData:_shrew_weapon_definitions()
	self.definitions.shrew = {
		category = "weapon",
		factory_id = "wpn_fps_pis_shrew",
		weapon_id = "shrew"
	}
end

function UpgradesTweakData:_x_shrew_weapon_definitions()
	self.definitions.x_shrew = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_shrew",
		weapon_id = "x_shrew"
	}
end

function UpgradesTweakData:_basset_weapon_definitions()
	self.definitions.basset = {
		category = "weapon",
		factory_id = "wpn_fps_sho_basset",
		weapon_id = "basset"
	}
end

function UpgradesTweakData:_x_basset_weapon_definitions()
	self.definitions.x_basset = {
		category = "weapon",
		factory_id = "wpn_fps_sho_x_basset",
		weapon_id = "x_basset"
	}
end

function UpgradesTweakData:_corgi_weapon_definitions()
	self.definitions.corgi = {
		category = "weapon",
		dlc = "rvd",
		factory_id = "wpn_fps_ass_corgi",
		weapon_id = "corgi"
	}
end

function UpgradesTweakData:_slap_weapon_definitions()
	self.definitions.slap = {
		category = "weapon",
		factory_id = "wpn_fps_gre_slap",
		weapon_id = "slap"
	}
end

function UpgradesTweakData:_x_coal_weapon_definitions()
	self.definitions.x_coal = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_coal",
		weapon_id = "x_coal"
	}
end

function UpgradesTweakData:_x_baka_weapon_definitions()
	self.definitions.x_baka = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_baka",
		weapon_id = "x_baka"
	}
end

function UpgradesTweakData:_x_cobray_weapon_definitions()
	self.definitions.x_cobray = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_cobray",
		weapon_id = "x_cobray"
	}
end

function UpgradesTweakData:_x_erma_weapon_definitions()
	self.definitions.x_erma = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_erma",
		weapon_id = "x_erma"
	}
end

function UpgradesTweakData:_x_hajk_weapon_definitions()
	self.definitions.x_hajk = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_hajk",
		weapon_id = "x_hajk"
	}
end

function UpgradesTweakData:_x_m45_weapon_definitions()
	self.definitions.x_m45 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_m45",
		weapon_id = "x_m45"
	}
end

function UpgradesTweakData:_x_m1928_weapon_definitions()
	self.definitions.x_m1928 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_m1928",
		weapon_id = "x_m1928"
	}
end

function UpgradesTweakData:_x_mac10_weapon_definitions()
	self.definitions.x_mac10 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_mac10",
		weapon_id = "x_mac10"
	}
end

function UpgradesTweakData:_x_mp7_weapon_definitions()
	self.definitions.x_mp7 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_mp7",
		weapon_id = "x_mp7"
	}
end

function UpgradesTweakData:_x_mp9_weapon_definitions()
	self.definitions.x_mp9 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_mp9",
		weapon_id = "x_mp9"
	}
end

function UpgradesTweakData:_x_olympic_weapon_definitions()
	self.definitions.x_olympic = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_olympic",
		weapon_id = "x_olympic"
	}
end

function UpgradesTweakData:_x_p90_weapon_definitions()
	self.definitions.x_p90 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_p90",
		weapon_id = "x_p90"
	}
end

function UpgradesTweakData:_x_polymer_weapon_definitions()
	self.definitions.x_polymer = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_polymer",
		weapon_id = "x_polymer"
	}
end

function UpgradesTweakData:_x_schakal_weapon_definitions()
	self.definitions.x_schakal = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_schakal",
		weapon_id = "x_schakal"
	}
end

function UpgradesTweakData:_x_scorpion_weapon_definitions()
	self.definitions.x_scorpion = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_scorpion",
		weapon_id = "x_scorpion"
	}
end

function UpgradesTweakData:_x_sterling_weapon_definitions()
	self.definitions.x_sterling = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_sterling",
		weapon_id = "x_sterling"
	}
end

function UpgradesTweakData:_x_tec9_weapon_definitions()
	self.definitions.x_tec9 = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_tec9",
		weapon_id = "x_tec9"
	}
end

function UpgradesTweakData:_x_uzi_weapon_definitions()
	self.definitions.x_uzi = {
		category = "weapon",
		factory_id = "wpn_fps_smg_x_uzi",
		weapon_id = "x_uzi"
	}
end

function UpgradesTweakData:_x_2006m_weapon_definitions()
	self.definitions.x_2006m = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_2006m",
		weapon_id = "x_2006m"
	}
end

function UpgradesTweakData:_x_breech_weapon_definitions()
	self.definitions.x_breech = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_breech",
		weapon_id = "x_breech"
	}
end

function UpgradesTweakData:_x_c96_weapon_definitions()
	self.definitions.x_c96 = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_c96",
		weapon_id = "x_c96"
	}
end

function UpgradesTweakData:_x_g18c_weapon_definitions()
	self.definitions.x_g18c = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_g18c",
		weapon_id = "x_g18c"
	}
end

function UpgradesTweakData:_x_hs2000_weapon_definitions()
	self.definitions.x_hs2000 = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_hs2000",
		weapon_id = "x_hs2000"
	}
end

function UpgradesTweakData:_x_lemming_weapon_definitions()
	self.definitions.x_lemming = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_lemming",
		weapon_id = "x_lemming"
	}
end

function UpgradesTweakData:_x_p226_weapon_definitions()
	self.definitions.x_p226 = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_p226",
		weapon_id = "x_p226"
	}
end

function UpgradesTweakData:_x_peacemaker_weapon_definitions()
	self.definitions.x_peacemaker = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_peacemaker",
		weapon_id = "x_peacemaker"
	}
end

function UpgradesTweakData:_x_pl14_weapon_definitions()
	self.definitions.x_pl14 = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_pl14",
		weapon_id = "x_pl14"
	}
end

function UpgradesTweakData:_x_ppk_weapon_definitions()
	self.definitions.x_ppk = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_ppk",
		weapon_id = "x_ppk"
	}
end

function UpgradesTweakData:_x_rage_weapon_definitions()
	self.definitions.x_rage = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_rage",
		weapon_id = "x_rage"
	}
end

function UpgradesTweakData:_x_sparrow_weapon_definitions()
	self.definitions.x_sparrow = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_sparrow",
		weapon_id = "x_sparrow"
	}
end

function UpgradesTweakData:_x_judge_weapon_definitions()
	self.definitions.x_judge = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_judge",
		weapon_id = "x_judge"
	}
end

function UpgradesTweakData:_x_rota_weapon_definitions()
	self.definitions.x_rota = {
		category = "weapon",
		factory_id = "wpn_fps_sho_x_rota",
		weapon_id = "x_rota"
	}
end

function UpgradesTweakData:_shuno_weapon_definitions()
	self.definitions.shuno = {
		category = "weapon",
		dlc = "dmg",
		factory_id = "wpn_fps_lmg_shuno",
		weapon_id = "shuno"
	}
end

function UpgradesTweakData:_system_weapon_definitions()
	self.definitions.system = {
		category = "weapon",
		factory_id = "wpn_fps_fla_system",
		weapon_id = "system"
	}
end

function UpgradesTweakData:_money_weapon_definitions()
	self.definitions.money = {
		category = "weapon",
		dlc = "pda8_wpn_money",
		factory_id = "wpn_fps_fla_money",
		weapon_id = "money"
	}
end

function UpgradesTweakData:_komodo_weapon_definitions()
	self.definitions.komodo = {
		category = "weapon",
		factory_id = "wpn_fps_ass_komodo",
		weapon_id = "komodo"
	}
end

function UpgradesTweakData:_elastic_weapon_definitions()
	self.definitions.elastic = {
		category = "weapon",
		factory_id = "wpn_fps_bow_elastic",
		weapon_id = "elastic"
	}
end

function UpgradesTweakData:_legacy_weapon_definitions()
	self.definitions.legacy = {
		category = "weapon",
		factory_id = "wpn_fps_pis_legacy",
		weapon_id = "legacy"
	}
end

function UpgradesTweakData:_x_legacy_weapon_definitions()
	self.definitions.x_legacy = {
		category = "weapon",
		factory_id = "wpn_fps_pis_x_legacy",
		weapon_id = "x_legacy"
	}
end

function UpgradesTweakData:_coach_weapon_definitions()
	self.definitions.coach = {
		category = "weapon",
		factory_id = "wpn_fps_sho_coach",
		weapon_id = "coach"
	}
end

function UpgradesTweakData:_beer_weapon_definitions()
	self.definitions.beer = {
		category = "weapon",
		dlc = "afp",
		factory_id = "wpn_fps_pis_beer",
		weapon_id = "beer"
	}
end

function UpgradesTweakData:_x_beer_weapon_definitions()
	self.definitions.x_beer = {
		category = "weapon",
		dlc = "afp",
		factory_id = "wpn_fps_pis_x_beer",
		weapon_id = "x_beer"
	}
end

function UpgradesTweakData:_czech_weapon_definitions()
	self.definitions.czech = {
		category = "weapon",
		dlc = "afp",
		factory_id = "wpn_fps_pis_czech",
		weapon_id = "czech"
	}
end

function UpgradesTweakData:_x_czech_weapon_definitions()
	self.definitions.x_czech = {
		category = "weapon",
		dlc = "afp",
		factory_id = "wpn_fps_pis_x_czech",
		weapon_id = "x_czech"
	}
end

function UpgradesTweakData:_stech_weapon_definitions()
	self.definitions.stech = {
		category = "weapon",
		dlc = "afp",
		factory_id = "wpn_fps_pis_stech",
		weapon_id = "stech"
	}
end

function UpgradesTweakData:_x_stech_weapon_definitions()
	self.definitions.x_stech = {
		category = "weapon",
		dlc = "afp",
		factory_id = "wpn_fps_pis_x_stech",
		weapon_id = "x_stech"
	}
end

function UpgradesTweakData:_holt_weapon_definitions()
	self.definitions.holt = {
		category = "weapon",
		dlc = "atw",
		factory_id = "wpn_fps_pis_holt",
		weapon_id = "holt"
	}
end

function UpgradesTweakData:_x_holt_weapon_definitions()
	self.definitions.x_holt = {
		category = "weapon",
		dlc = "atw",
		factory_id = "wpn_fps_pis_x_holt",
		weapon_id = "x_holt"
	}
end

function UpgradesTweakData:_m60_weapon_definitions()
	self.definitions.m60 = {
		category = "weapon",
		dlc = "atw",
		factory_id = "wpn_fps_lmg_m60",
		weapon_id = "m60"
	}
end

function UpgradesTweakData:_r700_weapon_definitions()
	self.definitions.r700 = {
		category = "weapon",
		dlc = "atw",
		factory_id = "wpn_fps_snp_r700",
		weapon_id = "r700"
	}
end

function UpgradesTweakData:_welrod_weapon_definitions()
	self.definitions.welrod = {
		category = "weapon",
		factory_id = "wpn_fps_pis_welrod",
		weapon_id = "welrod"
	}
end

function UpgradesTweakData:_pmm_weapon_definitions()
	self.definitions.pmm = {
		category = "weapon",
		dlc = "esp",
		factory_id = "wpn_fps_pis_pmm",
		weapon_id = "pmm"
	}
	self.definitions.x_pmm = {
		category = "weapon",
		dlc = "esp",
		factory_id = "wpn_fps_pis_x_pmm",
		weapon_id = "x_pmm"
	}
end

function UpgradesTweakData:_speen_weapon_definitions()
	self.definitions.speen = {
		category = "weapon",
		dlc = "esp",
		factory_id = "wpn_fps_smg_speen",
		weapon_id = "speen"
	}
end

function UpgradesTweakData:_dart_weapon_definitions()
	self.definitions.dart = {
		category = "weapon",
		dlc = "esp",
		factory_id = "wpn_fps_spe_dart",
		weapon_id = "dart"
	}
end

function UpgradesTweakData:_flun_weapon_definitions()
	self.definitions.flun = {
		category = "weapon",
		factory_id = "wpn_fps_spe_flun",
		weapon_id = "flun"
	}
end
