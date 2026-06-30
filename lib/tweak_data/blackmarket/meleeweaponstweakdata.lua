function BlackMarketTweakData:_init_melee_weapons(tweak_data)
	self.melee_weapons = {}
	self.melee_weapons.weapon = {}
	self.melee_weapons.weapon.name_id = "bm_melee_weapon"
	self.melee_weapons.weapon.type = "weapon"
	self.melee_weapons.weapon.unit = nil
	self.melee_weapons.weapon.animation = nil
	self.melee_weapons.weapon.instant = true
	self.melee_weapons.weapon.free = true
	self.melee_weapons.weapon.stats = {}
	self.melee_weapons.weapon.stats.min_damage = 3
	self.melee_weapons.weapon.stats.max_damage = 3
	self.melee_weapons.weapon.stats.min_damage_effect = 1
	self.melee_weapons.weapon.stats.max_damage_effect = 1
	self.melee_weapons.weapon.stats.charge_time = 0
	self.melee_weapons.weapon.stats.range = 150
	self.melee_weapons.weapon.stats.weapon_type = "blunt"
	self.melee_weapons.weapon.expire_t = 0.6
	self.melee_weapons.weapon.repeat_expire_t = 0.6
	self.melee_weapons.weapon.sounds = {}
	self.melee_weapons.weapon.sounds.hit_body = "melee_hit_body"
	self.melee_weapons.weapon.sounds.hit_gen = "melee_hit_gen"
	self.melee_weapons.fists = {}
	self.melee_weapons.fists.name_id = "bm_melee_fists"
	self.melee_weapons.fists.type = "fists"
	self.melee_weapons.fists.unit = nil
	self.melee_weapons.fists.animation = nil
	self.melee_weapons.fists.free = true
	self.melee_weapons.fists.stats = {}
	self.melee_weapons.fists.stats.min_damage = 3
	self.melee_weapons.fists.stats.max_damage = 5.5
	self.melee_weapons.fists.stats.min_damage_effect = 3
	self.melee_weapons.fists.stats.max_damage_effect = 2
	self.melee_weapons.fists.stats.charge_time = 1
	self.melee_weapons.fists.stats.range = 150
	self.melee_weapons.fists.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.fists.stats.weapon_type = "blunt"
	self.melee_weapons.fists.anim_global_param = "melee_fist"
	self.melee_weapons.fists.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.fists.expire_t = 1
	self.melee_weapons.fists.repeat_expire_t = 0.55
	self.melee_weapons.fists.melee_damage_delay = 0.2
	self.melee_weapons.fists.melee_charge_shaker = "player_melee_charge_fist"
	self.melee_weapons.fists.sounds = {}
	self.melee_weapons.fists.sounds.equip = "fist_equip"
	self.melee_weapons.fists.sounds.hit_air = "fist_hit_air"
	self.melee_weapons.fists.sounds.hit_gen = "fist_hit_gen"
	self.melee_weapons.fists.sounds.hit_body = "fist_hit_body"
	self.melee_weapons.fists.sounds.charge = "fist_charge"
	self.melee_weapons.fists.stats.concealment = 30
	self.melee_weapons.kabar = {}
	self.melee_weapons.kabar.name_id = "bm_melee_kabar"
	self.melee_weapons.kabar.type = "knife"
	self.melee_weapons.kabar.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_kabar/wpn_fps_mel_kabar"
	self.melee_weapons.kabar.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_kabar/wpn_third_mel_kabar"
	self.melee_weapons.kabar.animation = nil
	self.melee_weapons.kabar.dlc = "gage_pack_lmg"
	self.melee_weapons.kabar.texture_bundle_folder = "gage_pack_lmg"
	self.melee_weapons.kabar.stats = {}
	self.melee_weapons.kabar.stats.min_damage = 3
	self.melee_weapons.kabar.stats.max_damage = 8
	self.melee_weapons.kabar.stats.min_damage_effect = 1
	self.melee_weapons.kabar.stats.max_damage_effect = 1
	self.melee_weapons.kabar.stats.charge_time = 2
	self.melee_weapons.kabar.stats.range = 185
	self.melee_weapons.kabar.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.kabar.stats.weapon_type = "sharp"
	self.melee_weapons.kabar.anim_global_param = "melee_knife"
	self.melee_weapons.kabar.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.kabar.repeat_expire_t = 0.6
	self.melee_weapons.kabar.expire_t = 1.2
	self.melee_weapons.kabar.melee_damage_delay = 0.1
	self.melee_weapons.kabar.sounds = {}
	self.melee_weapons.kabar.sounds.equip = "knife_equip"
	self.melee_weapons.kabar.sounds.hit_air = "knife_hit_air"
	self.melee_weapons.kabar.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.kabar.sounds.hit_body = "knife_hit_body"
	self.melee_weapons.kabar.sounds.charge = "knife_charge"
	self.melee_weapons.kabar.stats.concealment = 30
	self.melee_weapons.rambo = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.rambo.name_id = "bm_melee_rambo"
	self.melee_weapons.rambo.type = "knife"
	self.melee_weapons.rambo.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_rambo/wpn_fps_mel_rambo"
	self.melee_weapons.rambo.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_rambo/wpn_third_mel_rambo"
	self.melee_weapons.rambo.stats.min_damage = 3
	self.melee_weapons.rambo.stats.max_damage = 8
	self.melee_weapons.rambo.stats.min_damage_effect = 1
	self.melee_weapons.rambo.stats.max_damage_effect = 1
	self.melee_weapons.rambo.anim_global_param = "melee_knife2"
	self.melee_weapons.rambo.repeat_expire_t = 0.5
	self.melee_weapons.rambo.expire_t = 1
	self.melee_weapons.rambo.stats.charge_time = 2
	self.melee_weapons.rambo.stats.range = 200
	self.melee_weapons.rambo.stats.concealment = 30
	self.melee_weapons.gerber = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.gerber.name_id = "bm_melee_gerber"
	self.melee_weapons.gerber.type = "knife"
	self.melee_weapons.gerber.anim_global_param = "melee_knife2"
	self.melee_weapons.gerber.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_dmf/wpn_fps_mel_dmf"
	self.melee_weapons.gerber.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_dmf/wpn_third_mel_dmf"
	self.melee_weapons.gerber.anim_global_param = "melee_knife2"
	self.melee_weapons.gerber.repeat_expire_t = 0.5
	self.melee_weapons.gerber.expire_t = 1
	self.melee_weapons.gerber.stats.min_damage = 3
	self.melee_weapons.gerber.stats.max_damage = 8
	self.melee_weapons.gerber.stats.min_damage_effect = 1
	self.melee_weapons.gerber.stats.max_damage_effect = 1
	self.melee_weapons.gerber.stats.charge_time = 2
	self.melee_weapons.gerber.stats.range = 160
	self.melee_weapons.gerber.stats.concealment = 29
	self.melee_weapons.kampfmesser = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.kampfmesser.name_id = "bm_melee_kampfmesser"
	self.melee_weapons.kampfmesser.type = "knife"
	self.melee_weapons.kampfmesser.unit = "units/pd2_dlc_gage_lmg/weapons/wpn_fps_mel_km2000/wpn_fps_mel_km2000"
	self.melee_weapons.kampfmesser.third_unit = "units/pd2_dlc_gage_lmg/weapons/wpn_third_mel_km2000/wpn_third_mel_km2000"
	self.melee_weapons.kampfmesser.stats.min_damage = 3
	self.melee_weapons.kampfmesser.stats.max_damage = 8
	self.melee_weapons.kampfmesser.stats.min_damage_effect = 1
	self.melee_weapons.kampfmesser.stats.max_damage_effect = 1
	self.melee_weapons.kampfmesser.stats.charge_time = 2
	self.melee_weapons.kampfmesser.stats.range = 185
	self.melee_weapons.kampfmesser.stats.concealment = 30
	self.melee_weapons.brass_knuckles = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.brass_knuckles.name_id = "bm_melee_brass_knuckles"
	self.melee_weapons.brass_knuckles.free = nil
	self.melee_weapons.brass_knuckles.type = "fists"
	self.melee_weapons.brass_knuckles.dlc = "pd2_clan"
	self.melee_weapons.brass_knuckles.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.brass_knuckles.unit = "units/payday2/weapons/wpn_fps_mel_brassknuckle/wpn_fps_mel_brassknuckle"
	self.melee_weapons.brass_knuckles.third_unit = "units/payday2/weapons/wpn_fps_mel_brassknuckle/wpn_third_mel_brassknuckle"
	self.melee_weapons.brass_knuckles.stats.min_damage = 3
	self.melee_weapons.brass_knuckles.stats.max_damage = 5.5
	self.melee_weapons.brass_knuckles.stats.min_damage_effect = 3
	self.melee_weapons.brass_knuckles.stats.max_damage_effect = 2
	self.melee_weapons.brass_knuckles.stats.charge_time = 2
	self.melee_weapons.brass_knuckles.stats.range = 150
	self.melee_weapons.brass_knuckles.sounds.hit_gen = "knuckles_hit_gen"
	self.melee_weapons.brass_knuckles.sounds.hit_body = "knuckles_hit_body"
	self.melee_weapons.brass_knuckles.stats.concealment = 30
	self.melee_weapons.tomahawk = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.tomahawk.name_id = "bm_melee_tomahawk"
	self.melee_weapons.tomahawk.dlc = "gage_pack_shotgun"
	self.melee_weapons.tomahawk.texture_bundle_folder = "gage_pack_shotgun"
	self.melee_weapons.tomahawk.anim_global_param = "melee_axe"
	self.melee_weapons.tomahawk.type = "axe"
	self.melee_weapons.tomahawk.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.tomahawk.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_tomahawk/wpn_fps_mel_tomahawk"
	self.melee_weapons.tomahawk.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_tomahawk/wpn_third_mel_tomahawk"
	self.melee_weapons.tomahawk.stats.weapon_type = "sharp"
	self.melee_weapons.tomahawk.stats.min_damage = 3
	self.melee_weapons.tomahawk.stats.max_damage = 8
	self.melee_weapons.tomahawk.stats.min_damage_effect = 1
	self.melee_weapons.tomahawk.stats.max_damage_effect = 1
	self.melee_weapons.tomahawk.stats.charge_time = 2
	self.melee_weapons.tomahawk.stats.range = 225
	self.melee_weapons.tomahawk.expire_t = 0.6
	self.melee_weapons.tomahawk.repeat_expire_t = 0.8
	self.melee_weapons.tomahawk.attack_allowed_expire_t = 0.1
	self.melee_weapons.tomahawk.sounds = {}
	self.melee_weapons.tomahawk.sounds.equip = "tomahawk_equip"
	self.melee_weapons.tomahawk.sounds.hit_air = "tomahawk_hit_air"
	self.melee_weapons.tomahawk.sounds.hit_gen = "tomahawk_hit_gen"
	self.melee_weapons.tomahawk.sounds.hit_body = "tomahawk_hit_body"
	self.melee_weapons.tomahawk.sounds.charge = "tomahawk_charge"
	self.melee_weapons.tomahawk.stats.concealment = 28
	self.melee_weapons.baton = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.baton.name_id = "bm_melee_baton"
	self.melee_weapons.baton.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_baton/wpn_fps_mel_baton"
	self.melee_weapons.baton.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_baton/wpn_third_mel_baton"
	self.melee_weapons.baton.stats.weapon_type = "blunt"
	self.melee_weapons.baton.stats.min_damage = 3
	self.melee_weapons.baton.stats.max_damage = 9
	self.melee_weapons.baton.stats.min_damage_effect = 5
	self.melee_weapons.baton.stats.max_damage_effect = 3
	self.melee_weapons.baton.stats.charge_time = 3
	self.melee_weapons.baton.stats.range = 250
	self.melee_weapons.baton.stats.weapon_type = "blunt"
	self.melee_weapons.baton.sounds = {}
	self.melee_weapons.baton.sounds.equip = "baton_equip"
	self.melee_weapons.baton.sounds.hit_air = "baton_hit_air"
	self.melee_weapons.baton.sounds.hit_gen = "baton_hit_gen"
	self.melee_weapons.baton.sounds.hit_body = "baton_hit_body"
	self.melee_weapons.baton.sounds.charge = "baton_charge"
	self.melee_weapons.baton.stats.concealment = 30
	self.melee_weapons.shovel = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.shovel.name_id = "bm_melee_shovel"
	self.melee_weapons.shovel.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_combat/wpn_fps_mel_combat"
	self.melee_weapons.shovel.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_combat/wpn_third_mel_combat"
	self.melee_weapons.shovel.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.shovel.stats.weapon_type = "blunt"
	self.melee_weapons.shovel.stats.min_damage = 2
	self.melee_weapons.shovel.stats.max_damage = 4
	self.melee_weapons.shovel.stats.min_damage_effect = 10
	self.melee_weapons.shovel.stats.max_damage_effect = 10
	self.melee_weapons.shovel.stats.charge_time = 3
	self.melee_weapons.shovel.stats.range = 250
	self.melee_weapons.shovel.stats.weapon_type = "blunt"
	self.melee_weapons.shovel.sounds = {}
	self.melee_weapons.shovel.sounds.equip = "shovel_equip"
	self.melee_weapons.shovel.sounds.hit_air = "shovel_hit_air"
	self.melee_weapons.shovel.sounds.hit_gen = "shovel_hit_gen"
	self.melee_weapons.shovel.sounds.hit_body = "shovel_hit_body"
	self.melee_weapons.shovel.sounds.charge = "shovel_charge"
	self.melee_weapons.shovel.stats.concealment = 27
	self.melee_weapons.becker = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.becker.name_id = "bm_melee_becker"
	self.melee_weapons.becker.unit = "units/pd2_dlc_gage_shot/weapons/wpn_fps_mel_tac/wpn_fps_mel_tac"
	self.melee_weapons.becker.third_unit = "units/pd2_dlc_gage_shot/weapons/wpn_third_mel_tac/wpn_third_mel_tac"
	self.melee_weapons.becker.stats.min_damage = 3
	self.melee_weapons.becker.stats.max_damage = 8
	self.melee_weapons.becker.stats.min_damage_effect = 1
	self.melee_weapons.becker.stats.max_damage_effect = 1
	self.melee_weapons.becker.stats.charge_time = 2
	self.melee_weapons.becker.stats.range = 200
	self.melee_weapons.becker.repeat_expire_t = 0.6
	self.melee_weapons.becker.sounds = {}
	self.melee_weapons.becker.sounds.equip = "becker_equip"
	self.melee_weapons.becker.sounds.hit_air = "becker_hit_air"
	self.melee_weapons.becker.sounds.hit_gen = "becker_hit_gen"
	self.melee_weapons.becker.sounds.hit_body = "becker_hit_body"
	self.melee_weapons.becker.sounds.charge = "knife_charge"
	self.melee_weapons.becker.stats.concealment = 27
	self.melee_weapons.moneybundle = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.moneybundle.name_id = "bm_melee_moneybundle"
	self.melee_weapons.moneybundle.dlc = "pd2_clan"
	self.melee_weapons.moneybundle.texture_bundle_folder = "pd2_million"
	self.melee_weapons.moneybundle.free = nil
	self.melee_weapons.moneybundle.anim_global_param = "melee_axe"
	self.melee_weapons.moneybundle.type = "axe"
	self.melee_weapons.moneybundle.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.moneybundle.unit = "units/pd2_million/weapons/wpn_fps_mel_moneybundle/wpn_fps_mel_moneybundle"
	self.melee_weapons.moneybundle.third_unit = "units/pd2_million/weapons/wpn_third_mel_moneybundle/wpn_third_mel_moneybundle"
	self.melee_weapons.moneybundle.stats.weapon_type = "blunt"
	self.melee_weapons.moneybundle.stats.min_damage = 3
	self.melee_weapons.moneybundle.stats.max_damage = 5.5
	self.melee_weapons.moneybundle.stats.min_damage_effect = 3
	self.melee_weapons.moneybundle.stats.max_damage_effect = 2
	self.melee_weapons.moneybundle.stats.charge_time = 2
	self.melee_weapons.moneybundle.stats.range = 150
	self.melee_weapons.moneybundle.stats.weapon_type = "blunt"
	self.melee_weapons.moneybundle.sounds = {}
	self.melee_weapons.moneybundle.repeat_expire_t = 0.5
	self.melee_weapons.moneybundle.sounds.equip = "cash_equip"
	self.melee_weapons.moneybundle.sounds.hit_air = "cash_hit_air"
	self.melee_weapons.moneybundle.sounds.hit_gen = "cash_hit_gen"
	self.melee_weapons.moneybundle.sounds.hit_body = "cash_hit_body"
	self.melee_weapons.moneybundle.sounds.charge = "cash_charge"
	self.melee_weapons.moneybundle.stats.concealment = 30
	self.melee_weapons.barbedwire = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.barbedwire.name_id = "bm_melee_baseballbat"
	self.melee_weapons.barbedwire.dlc = "pd2_clan"
	self.melee_weapons.barbedwire.texture_bundle_folder = "washington_reveal"
	self.melee_weapons.barbedwire.free = nil
	self.melee_weapons.barbedwire.anim_global_param = "melee_baseballbat"
	self.melee_weapons.barbedwire.type = "axe"
	self.melee_weapons.barbedwire.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.barbedwire.unit = "units/pd2_washington_reveal/weapons/wpn_fps_mel_barbedwire/wpn_fps_mel_barbedwire"
	self.melee_weapons.barbedwire.third_unit = "units/pd2_washington_reveal/weapons/wpn_fps_mel_barbedwire/wpn_third_mel_barbedwire"
	self.melee_weapons.barbedwire.stats.weapon_type = "blunt"
	self.melee_weapons.barbedwire.stats.min_damage = 3
	self.melee_weapons.barbedwire.stats.max_damage = 9
	self.melee_weapons.barbedwire.stats.min_damage_effect = 5
	self.melee_weapons.barbedwire.stats.max_damage_effect = 3
	self.melee_weapons.barbedwire.stats.charge_time = 3
	self.melee_weapons.barbedwire.stats.range = 275
	self.melee_weapons.barbedwire.stats.weapon_type = "blunt"
	self.melee_weapons.barbedwire.sounds = {}
	self.melee_weapons.barbedwire.repeat_expire_t = 1
	self.melee_weapons.barbedwire.expire_t = 1.2
	self.melee_weapons.barbedwire.sounds.equip = "bat_equip"
	self.melee_weapons.barbedwire.sounds.hit_air = "bat_hit_air"
	self.melee_weapons.barbedwire.sounds.hit_gen = "bat_hit_gen"
	self.melee_weapons.barbedwire.sounds.hit_body = "bat_hit_body"
	self.melee_weapons.barbedwire.sounds.charge = "bat_charge"
	self.melee_weapons.barbedwire.melee_damage_delay = 0.2
	self.melee_weapons.barbedwire.stats.concealment = 27
	self.melee_weapons.x46 = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.x46.name_id = "bm_melee_x46"
	self.melee_weapons.x46.type = "knife"
	self.melee_weapons.x46.dlc = "gage_pack_assault"
	self.melee_weapons.x46.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.x46.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.x46.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_x46/wpn_fps_mel_x46"
	self.melee_weapons.x46.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_x46/wpn_third_mel_x46"
	self.melee_weapons.x46.stats.min_damage = 3
	self.melee_weapons.x46.stats.max_damage = 8
	self.melee_weapons.x46.stats.min_damage_effect = 1
	self.melee_weapons.x46.stats.max_damage_effect = 1
	self.melee_weapons.x46.stats.charge_time = 2
	self.melee_weapons.x46.stats.range = 185
	self.melee_weapons.x46.stats.concealment = 30
	self.melee_weapons.dingdong = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.dingdong.name_id = "bm_melee_dingdong"
	self.melee_weapons.dingdong.anim_global_param = "melee_baseballbat"
	self.melee_weapons.dingdong.type = "axe"
	self.melee_weapons.dingdong.dlc = "gage_pack_assault"
	self.melee_weapons.dingdong.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.dingdong.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.dingdong.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_dingdong/wpn_fps_mel_dingdong"
	self.melee_weapons.dingdong.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_dingdong/wpn_third_mel_dingdong"
	self.melee_weapons.dingdong.stats.weapon_type = "blunt"
	self.melee_weapons.dingdong.stats.min_damage = 2
	self.melee_weapons.dingdong.stats.max_damage = 4
	self.melee_weapons.dingdong.stats.min_damage_effect = 10
	self.melee_weapons.dingdong.stats.max_damage_effect = 10
	self.melee_weapons.dingdong.stats.charge_time = 3
	self.melee_weapons.dingdong.stats.range = 275
	self.melee_weapons.dingdong.stats.weapon_type = "blunt"
	self.melee_weapons.dingdong.sounds = {}
	self.melee_weapons.dingdong.repeat_expire_t = 1
	self.melee_weapons.dingdong.expire_t = 1.2
	self.melee_weapons.dingdong.sounds.equip = "ding_dong_equip"
	self.melee_weapons.dingdong.sounds.hit_air = "ding_dong_hit_air"
	self.melee_weapons.dingdong.sounds.hit_gen = "ding_dong_hit_gen"
	self.melee_weapons.dingdong.sounds.hit_body = "ding_dong_hit_body"
	self.melee_weapons.dingdong.sounds.charge = "knife_charge"
	self.melee_weapons.dingdong.melee_damage_delay = 0.2
	self.melee_weapons.dingdong.stats.concealment = 26
	self.melee_weapons.spoon = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.spoon.name_id = "bm_melee_spoon"
	self.melee_weapons.spoon.anim_global_param = "melee_baseballbat"
	self.melee_weapons.spoon.type = "axe"
	self.melee_weapons.spoon.dlc = "apfo"
	self.melee_weapons.spoon.texture_bundle_folder = "apfo"
	self.melee_weapons.spoon.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.spoon.unit = "units/pd2_dlc_apfo/weapons/wpn_fps_mel_spoon/wpn_fps_mel_spoon"
	self.melee_weapons.spoon.third_unit = "units/pd2_dlc_apfo/weapons/wpn_fps_mel_spoon/wpn_third_mel_spoon"
	self.melee_weapons.spoon.stats.weapon_type = "blunt"
	self.melee_weapons.spoon.stats.min_damage = 4
	self.melee_weapons.spoon.stats.max_damage = 25
	self.melee_weapons.spoon.stats.min_damage_effect = 1
	self.melee_weapons.spoon.stats.max_damage_effect = 1
	self.melee_weapons.spoon.stats.charge_time = 2
	self.melee_weapons.spoon.stats.range = 275
	self.melee_weapons.spoon.stats.weapon_type = "blunt"
	self.melee_weapons.spoon.sounds = {}
	self.melee_weapons.spoon.repeat_expire_t = 1
	self.melee_weapons.spoon.expire_t = 1.2
	self.melee_weapons.spoon.sounds.equip = "spoon_equip"
	self.melee_weapons.spoon.sounds.hit_air = "spoon_hit_air"
	self.melee_weapons.spoon.sounds.hit_gen = "spoon_hit_gen"
	self.melee_weapons.spoon.sounds.hit_body = "spoon_hit_body"
	self.melee_weapons.spoon.sounds.charge = "spoon_charge"
	self.melee_weapons.spoon.melee_damage_delay = 0.2
	self.melee_weapons.spoon.stats.concealment = 26
	self.melee_weapons.spoon_gold = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.spoon_gold.name_id = "bm_melee_spoon_gold"
	self.melee_weapons.spoon_gold.anim_global_param = "melee_baseballbat"
	self.melee_weapons.spoon_gold.type = "axe"
	self.melee_weapons.spoon_gold.dlc = "apfo"
	self.melee_weapons.spoon_gold.locks = {
		achievement = "gsu_01",
		achievement_lock_id = "bm_menu_locked_spoon_gold"
	}
	self.melee_weapons.spoon_gold.texture_bundle_folder = "apfo"
	self.melee_weapons.spoon_gold.dot_data_name = "melee_spoon_gold"
	self.melee_weapons.spoon_gold.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.spoon_gold.unit = "units/pd2_dlc_apfo/weapons/wpn_fps_mel_spoon/wpn_fps_mel_spoon_gold"
	self.melee_weapons.spoon_gold.third_unit = "units/pd2_dlc_apfo/weapons/wpn_fps_mel_spoon/wpn_third_mel_spoon_gold"
	self.melee_weapons.spoon_gold.stats.weapon_type = "blunt"
	self.melee_weapons.spoon_gold.stats.min_damage = 7
	self.melee_weapons.spoon_gold.stats.max_damage = 45
	self.melee_weapons.spoon_gold.stats.min_damage_effect = 1
	self.melee_weapons.spoon_gold.stats.max_damage_effect = 1
	self.melee_weapons.spoon_gold.stats.charge_time = 2
	self.melee_weapons.spoon_gold.stats.range = 275
	self.melee_weapons.spoon_gold.stats.weapon_type = "blunt"
	self.melee_weapons.spoon_gold.sounds = {}
	self.melee_weapons.spoon_gold.repeat_expire_t = 1
	self.melee_weapons.spoon_gold.expire_t = 1.2
	self.melee_weapons.spoon_gold.sounds.equip = "spoon_equip"
	self.melee_weapons.spoon_gold.sounds.hit_air = "spoon_hit_air"
	self.melee_weapons.spoon_gold.sounds.hit_gen = "spoon_hit_gen"
	self.melee_weapons.spoon_gold.sounds.hit_body = "spoon_hit_body"
	self.melee_weapons.spoon_gold.sounds.charge = "spoon_charge"
	self.melee_weapons.spoon_gold.melee_damage_delay = 0.2
	self.melee_weapons.spoon_gold.stats.concealment = 27
	self.melee_weapons.bayonet = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.bayonet.name_id = "bm_melee_bayonet"
	self.melee_weapons.bayonet.type = "knife"
	self.melee_weapons.bayonet.dlc = "gage_pack_assault"
	self.melee_weapons.bayonet.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.bayonet.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.bayonet.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bayonet/wpn_fps_mel_bayonet"
	self.melee_weapons.bayonet.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bayonet/wpn_third_mel_bayonet"
	self.melee_weapons.bayonet.anim_global_param = "melee_knife2"
	self.melee_weapons.bayonet.repeat_expire_t = 0.5
	self.melee_weapons.bayonet.expire_t = 1
	self.melee_weapons.bayonet.stats.min_damage = 2
	self.melee_weapons.bayonet.stats.max_damage = 8
	self.melee_weapons.bayonet.stats.min_damage_effect = 1
	self.melee_weapons.bayonet.stats.max_damage_effect = 0.445
	self.melee_weapons.bayonet.stats.charge_time = 1.5
	self.melee_weapons.bayonet.stats.range = 185
	self.melee_weapons.bayonet.stats.concealment = 30
	self.melee_weapons.bullseye = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.bullseye.name_id = "bm_melee_bullseye"
	self.melee_weapons.bullseye.anim_global_param = "melee_axe"
	self.melee_weapons.bullseye.type = "axe"
	self.melee_weapons.bullseye.dlc = "gage_pack_assault"
	self.melee_weapons.bullseye.texture_bundle_folder = "gage_pack_assault"
	self.melee_weapons.bullseye.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.bullseye.unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bullseye/wpn_fps_mel_bullseye"
	self.melee_weapons.bullseye.third_unit = "units/pd2_dlc_gage_assault/weapons/wpn_fps_mel_bullseye/wpn_third_mel_bullseye"
	self.melee_weapons.bullseye.sounds = {}
	self.melee_weapons.bullseye.sounds.equip = "bullseye_equip"
	self.melee_weapons.bullseye.sounds.hit_air = "bullseye_hit_air"
	self.melee_weapons.bullseye.sounds.hit_gen = "bullseye_hit_gen"
	self.melee_weapons.bullseye.sounds.hit_body = "bullseye_hit_body"
	self.melee_weapons.bullseye.sounds.charge = "bullseye_charge"
	self.melee_weapons.bullseye.stats.min_damage = 3
	self.melee_weapons.bullseye.stats.max_damage = 8
	self.melee_weapons.bullseye.stats.min_damage_effect = 1
	self.melee_weapons.bullseye.stats.max_damage_effect = 1
	self.melee_weapons.bullseye.stats.charge_time = 2
	self.melee_weapons.bullseye.stats.range = 185
	self.melee_weapons.bullseye.stats.concealment = 29
	self.melee_weapons.baseballbat = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.baseballbat.name_id = "bm_melee_bat"
	self.melee_weapons.baseballbat.anim_global_param = "melee_baseballbat_miami"
	self.melee_weapons.baseballbat.dlc = "hl_miami"
	self.melee_weapons.baseballbat.texture_bundle_folder = "hl_miami"
	self.melee_weapons.baseballbat.type = "axe"
	self.melee_weapons.baseballbat.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.baseballbat.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_baseballbat/wpn_fps_mel_baseballbat"
	self.melee_weapons.baseballbat.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_baseballbat/wpn_third_mel_baseballbat"
	self.melee_weapons.baseballbat.sounds = {}
	self.melee_weapons.baseballbat.sounds.equip = "bat_equip"
	self.melee_weapons.baseballbat.sounds.hit_air = "bat_hit_air"
	self.melee_weapons.baseballbat.sounds.hit_gen = "baseballbat_hit_gen"
	self.melee_weapons.baseballbat.sounds.hit_body = "baseballbat_hit_body"
	self.melee_weapons.baseballbat.sounds.charge = "bat_charge"
	self.melee_weapons.baseballbat.stats.min_damage = 3
	self.melee_weapons.baseballbat.stats.max_damage = 9
	self.melee_weapons.baseballbat.stats.min_damage_effect = 5
	self.melee_weapons.baseballbat.stats.max_damage_effect = 3
	self.melee_weapons.baseballbat.stats.charge_time = 3
	self.melee_weapons.baseballbat.stats.range = 250
	self.melee_weapons.baseballbat.stats.concealment = 27
	self.melee_weapons.baseballbat.repeat_expire_t = 0.9
	self.melee_weapons.baseballbat.expire_t = 1.2
	self.melee_weapons.baseballbat.melee_damage_delay = 0.2
	self.melee_weapons.cleaver = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.cleaver.name_id = "bm_melee_cleaver"
	self.melee_weapons.cleaver.anim_global_param = "melee_cleaver"
	self.melee_weapons.cleaver.dlc = "hl_miami"
	self.melee_weapons.cleaver.texture_bundle_folder = "hl_miami"
	self.melee_weapons.cleaver.type = "axe"
	self.melee_weapons.cleaver.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.cleaver.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_cleaver/wpn_fps_mel_cleaver"
	self.melee_weapons.cleaver.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_cleaver/wpn_third_mel_cleaver"
	self.melee_weapons.cleaver.sounds = {}
	self.melee_weapons.cleaver.sounds.equip = "cleaver_equip"
	self.melee_weapons.cleaver.sounds.hit_air = "cleaver_hit_air"
	self.melee_weapons.cleaver.sounds.hit_gen = "cleaver_hit_gen"
	self.melee_weapons.cleaver.sounds.hit_body = "cleaver_hit_body"
	self.melee_weapons.cleaver.sounds.charge = "cleaver_charge"
	self.melee_weapons.cleaver.stats.min_damage = 3
	self.melee_weapons.cleaver.stats.max_damage = 8
	self.melee_weapons.cleaver.stats.min_damage_effect = 1
	self.melee_weapons.cleaver.stats.max_damage_effect = 1
	self.melee_weapons.cleaver.stats.charge_time = 2
	self.melee_weapons.cleaver.stats.range = 185
	self.melee_weapons.cleaver.stats.concealment = 29
	self.melee_weapons.fireaxe = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.fireaxe.name_id = "bm_melee_fireaxe"
	self.melee_weapons.fireaxe.anim_global_param = "melee_fireaxe"
	self.melee_weapons.fireaxe.dlc = "hl_miami"
	self.melee_weapons.fireaxe.texture_bundle_folder = "hl_miami"
	self.melee_weapons.fireaxe.type = "axe"
	self.melee_weapons.fireaxe.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.fireaxe.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_fireaxe/wpn_fps_mel_fireaxe"
	self.melee_weapons.fireaxe.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_fireaxe/wpn_third_mel_fireaxe"
	self.melee_weapons.fireaxe.sounds = {}
	self.melee_weapons.fireaxe.sounds.equip = "fire_axe_equip"
	self.melee_weapons.fireaxe.sounds.hit_air = "fire_axe_hit_air"
	self.melee_weapons.fireaxe.sounds.hit_gen = "fire_axe_hit_gen"
	self.melee_weapons.fireaxe.sounds.hit_body = "fire_axe_hit_body"
	self.melee_weapons.fireaxe.sounds.charge = "knife_charge"
	self.melee_weapons.fireaxe.stats.min_damage = 7
	self.melee_weapons.fireaxe.stats.max_damage = 45
	self.melee_weapons.fireaxe.stats.min_damage_effect = 1
	self.melee_weapons.fireaxe.stats.max_damage_effect = 1
	self.melee_weapons.fireaxe.stats.charge_time = 4
	self.melee_weapons.fireaxe.stats.range = 275
	self.melee_weapons.fireaxe.stats.concealment = 27
	self.melee_weapons.fireaxe.repeat_expire_t = 1.6
	self.melee_weapons.fireaxe.expire_t = 1.8
	self.melee_weapons.fireaxe.melee_damage_delay = 0.6
	self.melee_weapons.machete = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.machete.name_id = "bm_melee_machete"
	self.melee_weapons.machete.anim_global_param = "melee_machete"
	self.melee_weapons.machete.dlc = "hl_miami"
	self.melee_weapons.machete.texture_bundle_folder = "hl_miami"
	self.melee_weapons.machete.type = "axe"
	self.melee_weapons.machete.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.machete.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_machete/wpn_fps_mel_machete"
	self.melee_weapons.machete.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_machete/wpn_third_mel_machete"
	self.melee_weapons.machete.sounds = {}
	self.melee_weapons.machete.sounds.equip = "machete_equip"
	self.melee_weapons.machete.sounds.hit_air = "machete_hit_air"
	self.melee_weapons.machete.sounds.hit_gen = "machete_hit_gen"
	self.melee_weapons.machete.sounds.hit_body = "machete_hit_body"
	self.melee_weapons.machete.sounds.charge = "machete_charge"
	self.melee_weapons.machete.stats.min_damage = 3
	self.melee_weapons.machete.stats.max_damage = 8
	self.melee_weapons.machete.stats.min_damage_effect = 1
	self.melee_weapons.machete.stats.max_damage_effect = 1
	self.melee_weapons.machete.stats.charge_time = 2
	self.melee_weapons.machete.stats.range = 225
	self.melee_weapons.machete.expire_t = 0.6
	self.melee_weapons.machete.repeat_expire_t = 0.8
	self.melee_weapons.machete.stats.concealment = 29
	self.melee_weapons.briefcase = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.briefcase.name_id = "bm_melee_briefcase"
	self.melee_weapons.briefcase.anim_global_param = "melee_briefcase"
	self.melee_weapons.briefcase.dlc = "hlm_game"
	self.melee_weapons.briefcase.texture_bundle_folder = "hl_miami"
	self.melee_weapons.briefcase.type = "axe"
	self.melee_weapons.briefcase.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.briefcase.unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_briefcase/wpn_fps_mel_briefcase"
	self.melee_weapons.briefcase.third_unit = "units/pd2_dlc_miami/weapons/wpn_fps_mel_briefcase/wpn_third_mel_briefcase"
	self.melee_weapons.briefcase.sounds = {}
	self.melee_weapons.briefcase.sounds.equip = "suitcase_equip"
	self.melee_weapons.briefcase.sounds.hit_air = "suitcase_hit_air"
	self.melee_weapons.briefcase.sounds.hit_gen = "suitcase_hit_gen"
	self.melee_weapons.briefcase.sounds.hit_body = "suitcase_hit_body"
	self.melee_weapons.briefcase.sounds.charge = "suitcase_charge"
	self.melee_weapons.briefcase.stats.min_damage = 3
	self.melee_weapons.briefcase.stats.max_damage = 5.5
	self.melee_weapons.briefcase.stats.min_damage_effect = 3
	self.melee_weapons.briefcase.stats.max_damage_effect = 2
	self.melee_weapons.briefcase.stats.charge_time = 2
	self.melee_weapons.briefcase.stats.range = 185
	self.melee_weapons.briefcase.stats.concealment = 30
	self.melee_weapons.briefcase.repeat_expire_t = 1
	self.melee_weapons.briefcase.expire_t = 1.2
	self.melee_weapons.briefcase.melee_damage_delay = 0.2
	self.melee_weapons.kabartanto = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.kabartanto.name_id = "bm_melee_kabar_tanto"
	self.melee_weapons.kabartanto.dlc = "john_wick_character"
	self.melee_weapons.kabartanto.texture_bundle_folder = nil
	self.melee_weapons.kabartanto.type = "knife"
	self.melee_weapons.kabartanto.unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_mel_kabar_tanto/wpn_fps_mel_kabar_tanto"
	self.melee_weapons.kabartanto.third_unit = "units/pd2_crimefest_2014/oct22/weapons/wpn_fps_mel_kabar_tanto/wpn_third_mel_kabar_tanto"
	self.melee_weapons.kabartanto.stats.min_damage = 2
	self.melee_weapons.kabartanto.stats.max_damage = 8
	self.melee_weapons.kabartanto.stats.min_damage_effect = 1
	self.melee_weapons.kabartanto.stats.max_damage_effect = 1
	self.melee_weapons.kabartanto.stats.charge_time = 2
	self.melee_weapons.kabartanto.stats.range = 185
	self.melee_weapons.kabartanto.stats.concealment = 30
	self.melee_weapons.toothbrush = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.toothbrush.name_id = "bm_melee_toothbrush"
	self.melee_weapons.toothbrush.dlc = "pd2_clan"
	self.melee_weapons.toothbrush.locks = {
		achievement = "bulldog_1",
		dlc = "pd2_clan"
	}
	self.melee_weapons.toothbrush.texture_bundle_folder = nil
	self.melee_weapons.toothbrush.free = nil
	self.melee_weapons.toothbrush.anim_global_param = "melee_stab"
	self.melee_weapons.toothbrush.type = "knife"
	self.melee_weapons.toothbrush.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.toothbrush.unit = "units/pd2_crimefest_2014/oct27/weapons/wpn_fps_mel_toothbrush_shiv/wpn_fps_mel_toothbrush_shiv"
	self.melee_weapons.toothbrush.third_unit = "units/pd2_crimefest_2014/oct27/weapons/wpn_fps_mel_toothbrush_shiv/wpn_third_mel_toothbrush_shiv"
	self.melee_weapons.toothbrush.stats.weapon_type = "sharp"
	self.melee_weapons.toothbrush.stats.min_damage = 3
	self.melee_weapons.toothbrush.stats.max_damage = 8
	self.melee_weapons.toothbrush.stats.min_damage_effect = 1
	self.melee_weapons.toothbrush.stats.max_damage_effect = 1
	self.melee_weapons.toothbrush.stats.charge_time = 2
	self.melee_weapons.toothbrush.stats.range = 150
	self.melee_weapons.toothbrush.sounds = {}
	self.melee_weapons.toothbrush.sounds.equip = "toothbrush_equip"
	self.melee_weapons.toothbrush.sounds.hit_air = "toothbrush_hit_air"
	self.melee_weapons.toothbrush.sounds.hit_gen = "toothbrush_hit_gen"
	self.melee_weapons.toothbrush.sounds.hit_body = "toothbrush_hit_body"
	self.melee_weapons.toothbrush.sounds.charge = "toothbrush_charge"
	self.melee_weapons.toothbrush.repeat_expire_t = 0.3
	self.melee_weapons.toothbrush.stats.concealment = 30
	self.melee_weapons.chef = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.chef.name_id = "bm_melee_chef"
	self.melee_weapons.chef.dlc = "pd2_clan"
	self.melee_weapons.chef.texture_bundle_folder = nil
	self.melee_weapons.chef.free = nil
	self.melee_weapons.chef.anim_global_param = "melee_psycho"
	self.melee_weapons.chef.type = "knife"
	self.melee_weapons.chef.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.chef.unit = "units/pd2_halloween/weapons/wpn_fps_mel_chef/wpn_fps_mel_chef"
	self.melee_weapons.chef.third_unit = "units/pd2_halloween/weapons/wpn_fps_mel_chef/wpn_third_mel_chef"
	self.melee_weapons.chef.stats.weapon_type = "sharp"
	self.melee_weapons.chef.stats.min_damage = 3
	self.melee_weapons.chef.stats.max_damage = 8
	self.melee_weapons.chef.stats.min_damage_effect = 1
	self.melee_weapons.chef.stats.max_damage_effect = 1
	self.melee_weapons.chef.stats.charge_time = 2
	self.melee_weapons.chef.stats.range = 150
	self.melee_weapons.chef.sounds = {}
	self.melee_weapons.chef.sounds.equip = "tomahawk_equip"
	self.melee_weapons.chef.sounds.hit_air = "tomahawk_hit_air"
	self.melee_weapons.chef.sounds.hit_gen = "tomahawk_hit_gen"
	self.melee_weapons.chef.sounds.hit_body = "tomahawk_hit_body"
	self.melee_weapons.chef.sounds.charge = "halloween_charge"
	self.melee_weapons.chef.repeat_expire_t = 0.36
	self.melee_weapons.chef.stats.concealment = 29
	self.melee_weapons.fairbair = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.fairbair.name_id = "bm_melee_fairbair"
	self.melee_weapons.fairbair.dlc = "gage_pack_historical"
	self.melee_weapons.fairbair.texture_bundle_folder = "gage_pack_historical"
	self.melee_weapons.fairbair.free = nil
	self.melee_weapons.fairbair.anim_global_param = "melee_stab"
	self.melee_weapons.fairbair.type = "knife"
	self.melee_weapons.fairbair.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.fairbair.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_fairbair/wpn_fps_mel_fairbair"
	self.melee_weapons.fairbair.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_fairbair/wpn_third_mel_fairbair"
	self.melee_weapons.fairbair.stats.weapon_type = "sharp"
	self.melee_weapons.fairbair.stats.min_damage = 3
	self.melee_weapons.fairbair.stats.max_damage = 8
	self.melee_weapons.fairbair.stats.min_damage_effect = 1
	self.melee_weapons.fairbair.stats.max_damage_effect = 1
	self.melee_weapons.fairbair.stats.charge_time = 2
	self.melee_weapons.fairbair.stats.range = 175
	self.melee_weapons.fairbair.sounds = {}
	self.melee_weapons.fairbair.sounds.equip = "knife_equip"
	self.melee_weapons.fairbair.sounds.hit_air = "fairbairn_hit_air"
	self.melee_weapons.fairbair.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.fairbair.sounds.hit_body = "fairbairn_hit_body"
	self.melee_weapons.fairbair.sounds.charge = "knife_charge"
	self.melee_weapons.fairbair.repeat_expire_t = 0.3
	self.melee_weapons.fairbair.stats.concealment = 30
	self.melee_weapons.freedom = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.freedom.name_id = "bm_melee_freedom"
	self.melee_weapons.freedom.dlc = "gage_pack_historical"
	self.melee_weapons.freedom.texture_bundle_folder = "gage_pack_historical"
	self.melee_weapons.freedom.free = nil
	self.melee_weapons.freedom.anim_global_param = "melee_freedom"
	self.melee_weapons.freedom.type = "flag"
	self.melee_weapons.freedom.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.freedom.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_freedom/wpn_fps_mel_freedom"
	self.melee_weapons.freedom.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_mel_freedom/wpn_third_mel_freedom"
	self.melee_weapons.freedom.stats.weapon_type = "sharp"
	self.melee_weapons.freedom.stats.min_damage = 7
	self.melee_weapons.freedom.stats.max_damage = 45
	self.melee_weapons.freedom.stats.min_damage_effect = 1
	self.melee_weapons.freedom.stats.max_damage_effect = 1
	self.melee_weapons.freedom.stats.charge_time = 3
	self.melee_weapons.freedom.stats.range = 275
	self.melee_weapons.freedom.sounds = {}
	self.melee_weapons.freedom.sounds.equip = "freedom_equip"
	self.melee_weapons.freedom.sounds.hit_air = "freedom_hit_air"
	self.melee_weapons.freedom.sounds.hit_gen = "freedom_hit_gen"
	self.melee_weapons.freedom.sounds.hit_body = "freedom_hit_body"
	self.melee_weapons.freedom.sounds.charge = "freedom_charge"
	self.melee_weapons.freedom.repeat_expire_t = 0.9
	self.melee_weapons.freedom.expire_t = 1.3
	self.melee_weapons.freedom.stats.concealment = 27
	self.melee_weapons.freedom.melee_damage_delay = 0.35
	self.melee_weapons.model24 = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.model24.name_id = "bm_melee_model24"
	self.melee_weapons.model24.dlc = "gage_pack_historical"
	self.melee_weapons.model24.texture_bundle_folder = "gage_pack_historical"
	self.melee_weapons.model24.free = nil
	self.melee_weapons.model24.anim_global_param = "melee_axe"
	self.melee_weapons.model24.type = "knife"
	self.melee_weapons.model24.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.model24.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_model24/wpn_fps_mel_model24"
	self.melee_weapons.model24.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_model24/wpn_third_mel_model24"
	self.melee_weapons.model24.stats.weapon_type = "sharp"
	self.melee_weapons.model24.stats.min_damage = 3
	self.melee_weapons.model24.stats.max_damage = 9
	self.melee_weapons.model24.stats.min_damage_effect = 5
	self.melee_weapons.model24.stats.max_damage_effect = 3
	self.melee_weapons.model24.stats.charge_time = 3
	self.melee_weapons.model24.stats.range = 185
	self.melee_weapons.model24.sounds = {}
	self.melee_weapons.model24.sounds.equip = "grenade_equip"
	self.melee_weapons.model24.sounds.hit_air = "grenade_hit_air"
	self.melee_weapons.model24.sounds.hit_gen = "grenade_hit_gen"
	self.melee_weapons.model24.sounds.hit_body = "grenade_hit_body"
	self.melee_weapons.model24.sounds.charge = "bat_charge"
	self.melee_weapons.model24.repeat_expire_t = 0.8
	self.melee_weapons.model24.stats.concealment = 28
	self.melee_weapons.swagger = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.swagger.name_id = "bm_melee_swagger"
	self.melee_weapons.swagger.dlc = "gage_pack_historical"
	self.melee_weapons.swagger.texture_bundle_folder = "gage_pack_historical"
	self.melee_weapons.swagger.free = nil
	self.melee_weapons.swagger.anim_global_param = "melee_axe"
	self.melee_weapons.swagger.type = "knife"
	self.melee_weapons.swagger.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.swagger.unit = "units/pd2_dlc_gage_historical/weapons/wpn_fps_mel_swagger/wpn_fps_mel_swagger"
	self.melee_weapons.swagger.third_unit = "units/pd2_dlc_gage_historical/weapons/wpn_third_mel_swagger/wpn_third_mel_swagger"
	self.melee_weapons.swagger.stats.weapon_type = "sharp"
	self.melee_weapons.swagger.stats.min_damage = 3
	self.melee_weapons.swagger.stats.max_damage = 9
	self.melee_weapons.swagger.stats.min_damage_effect = 5
	self.melee_weapons.swagger.stats.max_damage_effect = 3
	self.melee_weapons.swagger.stats.charge_time = 3
	self.melee_weapons.swagger.stats.range = 225
	self.melee_weapons.swagger.sounds = {}
	self.melee_weapons.swagger.sounds.equip = "grenade_equip"
	self.melee_weapons.swagger.sounds.hit_air = "grenade_hit_air"
	self.melee_weapons.swagger.sounds.hit_gen = "swagger_hit_gen"
	self.melee_weapons.swagger.sounds.hit_body = "swagger_hit_body"
	self.melee_weapons.swagger.sounds.charge = "bat_charge"
	self.melee_weapons.swagger.repeat_expire_t = 0.8
	self.melee_weapons.swagger.stats.concealment = 28
	self.melee_weapons.alien_maul = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.alien_maul.name_id = "bm_melee_alien_maul"
	self.melee_weapons.alien_maul.anim_global_param = "melee_baseballbat"
	self.melee_weapons.alien_maul.type = "axe"
	self.melee_weapons.alien_maul.texture_bundle_folder = "alienware_alpha"
	self.melee_weapons.alien_maul.dlc = "alienware_alpha_promo"
	self.melee_weapons.alien_maul.free = nil
	self.melee_weapons.alien_maul.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.alien_maul.unit = "units/pd2_dlc_alienware/weapons/wpn_fps_mel_maul/wpn_fps_mel_maul"
	self.melee_weapons.alien_maul.third_unit = "units/pd2_dlc_alienware/weapons/wpn_fps_mel_maul/wpn_third_mel_maul"
	self.melee_weapons.alien_maul.stats.weapon_type = "blunt"
	self.melee_weapons.alien_maul.stats.min_damage = 2
	self.melee_weapons.alien_maul.stats.max_damage = 4
	self.melee_weapons.alien_maul.stats.min_damage_effect = 10
	self.melee_weapons.alien_maul.stats.max_damage_effect = 10
	self.melee_weapons.alien_maul.stats.charge_time = 3
	self.melee_weapons.alien_maul.stats.range = 275
	self.melee_weapons.alien_maul.stats.weapon_type = "blunt"
	self.melee_weapons.alien_maul.sounds = {}
	self.melee_weapons.alien_maul.repeat_expire_t = 1
	self.melee_weapons.alien_maul.expire_t = 1.2
	self.melee_weapons.alien_maul.sounds.equip = "alpha_equip"
	self.melee_weapons.alien_maul.sounds.hit_air = "alpha_hit_air"
	self.melee_weapons.alien_maul.sounds.hit_gen = "alpha_hit_gen"
	self.melee_weapons.alien_maul.sounds.hit_body = "alpha_hit_body"
	self.melee_weapons.alien_maul.sounds.charge = "alpha_charge"
	self.melee_weapons.alien_maul.melee_damage_delay = 0.2
	self.melee_weapons.alien_maul.stats.concealment = 26
	self.melee_weapons.piggy_hammer = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.piggy_hammer.name_id = "bm_melee_piggy_hammer"
	self.melee_weapons.piggy_hammer.info_id = "bm_melee_piggy_hammer_info"
	self.melee_weapons.piggy_hammer.anim_global_param = "melee_baseballbat"
	self.melee_weapons.piggy_hammer.type = "axe"
	self.melee_weapons.piggy_hammer.texture_bundle_folder = "pda10"
	self.melee_weapons.piggy_hammer.dlc = "pda10_piggy_hammer"
	self.melee_weapons.piggy_hammer.locks = {
		func = "has_unlocked_piggy_hammer"
	}
	self.melee_weapons.piggy_hammer.free = nil
	self.melee_weapons.piggy_hammer.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.piggy_hammer.unit = "units/pd2_dlc_pda10/weapons/wpn_fps_mel_piggy_hammer_pts/wpn_fps_mel_piggy_hammer"
	self.melee_weapons.piggy_hammer.third_unit = "units/pd2_dlc_pda10/weapons/wpn_fps_mel_piggy_hammer_pts/wpn_third_mel_piggy_hammer"
	self.melee_weapons.piggy_hammer.stats.weapon_type = "blunt"
	self.melee_weapons.piggy_hammer.stats.min_damage = 2
	self.melee_weapons.piggy_hammer.stats.max_damage = 4
	self.melee_weapons.piggy_hammer.stats.min_damage_effect = 10
	self.melee_weapons.piggy_hammer.stats.max_damage_effect = 10
	self.melee_weapons.piggy_hammer.stats.special_damage_multiplier = 1.5
	self.melee_weapons.piggy_hammer.stats.charge_time = 3
	self.melee_weapons.piggy_hammer.stats.range = 275
	self.melee_weapons.piggy_hammer.stats.weapon_type = "blunt"
	self.melee_weapons.piggy_hammer.sounds = {}
	self.melee_weapons.piggy_hammer.repeat_expire_t = 0.9
	self.melee_weapons.piggy_hammer.expire_t = 1.2
	self.melee_weapons.piggy_hammer.sounds.equip = "piggy_equip"
	self.melee_weapons.piggy_hammer.sounds.hit_air = "piggy_hit_air"
	self.melee_weapons.piggy_hammer.sounds.hit_gen = "piggy_hit_gen"
	self.melee_weapons.piggy_hammer.sounds.hit_body = "piggy_hit_body"
	self.melee_weapons.piggy_hammer.sounds.charge = "piggy_charge"
	self.melee_weapons.piggy_hammer.melee_damage_delay = 0.2
	self.melee_weapons.piggy_hammer.stats.concealment = 26
	self.melee_weapons.piggy_hammer.anims = {
		charge = {
			anim = "Idle",
			loop = true
		}
	}
	self.melee_weapons.piggy_hammer.menu_scene_anim = "Idle"
	self.melee_weapons.piggy_hammer.menu_scene_params = {
		loop = true
	}
	self.melee_weapons.piggy_hammer.random_special_effects = {
		{
			weight = 45,
			tase_data = {
				tase_strength = "light"
			}
		},
		{
			dot_data_name = "melee_piggy_hammer",
			weight = 40
		},
		{
			instant_kill = true,
			weight = 15
		}
	}
	self.melee_weapons.shillelagh = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.shillelagh.name_id = "bm_melee_shillelagh"
	self.melee_weapons.shillelagh.dlc = "character_pack_clover"
	self.melee_weapons.shillelagh.texture_bundle_folder = "character_pack_clover"
	self.melee_weapons.shillelagh.free = nil
	self.melee_weapons.shillelagh.anim_global_param = "melee_axe"
	self.melee_weapons.shillelagh.type = "axe"
	self.melee_weapons.shillelagh.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.shillelagh.unit = "units/pd2_dlc_clover/weapons/wpn_fps_mel_shillelagh/wpn_fps_mel_shillelagh"
	self.melee_weapons.shillelagh.third_unit = "units/pd2_dlc_clover/weapons/wpn_fps_mel_shillelagh/wpn_third_mel_shillelagh"
	self.melee_weapons.shillelagh.stats.weapon_type = "sharp"
	self.melee_weapons.shillelagh.stats.min_damage = 3
	self.melee_weapons.shillelagh.stats.max_damage = 9
	self.melee_weapons.shillelagh.stats.min_damage_effect = 5
	self.melee_weapons.shillelagh.stats.max_damage_effect = 3
	self.melee_weapons.shillelagh.stats.charge_time = 3
	self.melee_weapons.shillelagh.stats.range = 185
	self.melee_weapons.shillelagh.sounds = {}
	self.melee_weapons.shillelagh.sounds.equip = "shillelagh_equip"
	self.melee_weapons.shillelagh.sounds.hit_air = "baton_hit_air"
	self.melee_weapons.shillelagh.sounds.hit_gen = "shillelagh_hit_gen"
	self.melee_weapons.shillelagh.sounds.hit_body = "shillelagh_hit_body"
	self.melee_weapons.shillelagh.sounds.charge = "baton_charge"
	self.melee_weapons.shillelagh.repeat_expire_t = 0.8
	self.melee_weapons.shillelagh.stats.concealment = 27
	self.melee_weapons.boxing_gloves = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.boxing_gloves.name_id = "bm_melee_boxing_gloves"
	self.melee_weapons.boxing_gloves.free = nil
	self.melee_weapons.boxing_gloves.type = "fists"
	self.melee_weapons.boxing_gloves.dlc = "pd2_clan"
	self.melee_weapons.boxing_gloves.texture_bundle_folder = "pd2_hw_boxing"
	self.melee_weapons.boxing_gloves.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.boxing_gloves.graphic_objects = {
		a_weapon_left = "g_glove_2",
		a_weapon_right = "g_glove_1"
	}
	self.melee_weapons.boxing_gloves.unit = "units/pd2_hw_boxing/weapons/wpn_fps_mel_boxing_gloves/wpn_fps_mel_boxing_gloves"
	self.melee_weapons.boxing_gloves.third_unit = "units/pd2_hw_boxing/weapons/wpn_fps_mel_boxing_gloves/wpn_third_mel_boxing_gloves"
	self.melee_weapons.boxing_gloves.menu_scene_anim = "menu"
	self.melee_weapons.boxing_gloves.menu_scene_params = {
		loop = false,
		start_time = -1
	}
	self.melee_weapons.boxing_gloves.anim_global_param = "melee_boxing"
	self.melee_weapons.boxing_gloves.stats.min_damage = 3
	self.melee_weapons.boxing_gloves.stats.max_damage = 5.5
	self.melee_weapons.boxing_gloves.stats.min_damage_effect = 3
	self.melee_weapons.boxing_gloves.stats.max_damage_effect = 2
	self.melee_weapons.boxing_gloves.stats.charge_time = 2
	self.melee_weapons.boxing_gloves.stats.range = 150
	self.melee_weapons.boxing_gloves.sounds.hit_gen = "boxing_hit_gen"
	self.melee_weapons.boxing_gloves.sounds.hit_body = "boxing_hit_body"
	self.melee_weapons.boxing_gloves.sounds.equip = "boxing_equip"
	self.melee_weapons.boxing_gloves.sounds.hit_air = "fist_hit_air"
	self.melee_weapons.boxing_gloves.sounds.charge = "boxing_charge"
	self.melee_weapons.boxing_gloves.stats.concealment = 30
	self.melee_weapons.meat_cleaver = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.meat_cleaver.name_id = "bm_melee_meat_cleaver"
	self.melee_weapons.meat_cleaver.anim_global_param = "melee_axe"
	self.melee_weapons.meat_cleaver.dlc = "character_pack_dragan"
	self.melee_weapons.meat_cleaver.texture_bundle_folder = "character_pack_dragan"
	self.melee_weapons.meat_cleaver.type = "axe"
	self.melee_weapons.meat_cleaver.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.meat_cleaver.unit = "units/pd2_dlc_dragan/weapons/wpn_fps_mel_meat_cleaver/wpn_fps_mel_meat_cleaver"
	self.melee_weapons.meat_cleaver.third_unit = "units/pd2_dlc_dragan/weapons/wpn_fps_mel_meat_cleaver/wpn_third_mel_meat_cleaver"
	self.melee_weapons.meat_cleaver.sounds = {}
	self.melee_weapons.meat_cleaver.sounds.equip = "cleaver_equip"
	self.melee_weapons.meat_cleaver.sounds.hit_air = "cleaver_hit_air"
	self.melee_weapons.meat_cleaver.sounds.hit_gen = "cleaver_hit_gen"
	self.melee_weapons.meat_cleaver.sounds.hit_body = "cleaver_hit_body"
	self.melee_weapons.meat_cleaver.sounds.charge = "cleaver_charge"
	self.melee_weapons.meat_cleaver.stats.min_damage = 3
	self.melee_weapons.meat_cleaver.stats.max_damage = 8
	self.melee_weapons.meat_cleaver.stats.min_damage_effect = 1
	self.melee_weapons.meat_cleaver.stats.max_damage_effect = 1
	self.melee_weapons.meat_cleaver.stats.charge_time = 2
	self.melee_weapons.meat_cleaver.stats.range = 195
	self.melee_weapons.meat_cleaver.stats.concealment = 28
	self.melee_weapons.hammer = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.hammer.name_id = "bm_melee_hammer"
	self.melee_weapons.hammer.dlc = "hlm2_deluxe"
	self.melee_weapons.hammer.texture_bundle_folder = "hlm2"
	self.melee_weapons.hammer.free = nil
	self.melee_weapons.hammer.anim_global_param = "melee_axe"
	self.melee_weapons.hammer.type = "axe"
	self.melee_weapons.hammer.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.hammer.unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_mel_hammer/wpn_fps_mel_hammer"
	self.melee_weapons.hammer.third_unit = "units/pd2_dlc_hotline2/weapons/wpn_fps_mel_hammer/wpn_third_mel_hammer"
	self.melee_weapons.hammer.stats.weapon_type = "blunt"
	self.melee_weapons.hammer.stats.min_damage = 2
	self.melee_weapons.hammer.stats.max_damage = 4
	self.melee_weapons.hammer.stats.min_damage_effect = 10
	self.melee_weapons.hammer.stats.max_damage_effect = 10
	self.melee_weapons.hammer.stats.charge_time = 3
	self.melee_weapons.hammer.stats.range = 185
	self.melee_weapons.hammer.sounds = {}
	self.melee_weapons.hammer.sounds.equip = "hammer_equip"
	self.melee_weapons.hammer.sounds.hit_air = "hammer_hit_air"
	self.melee_weapons.hammer.sounds.hit_gen = "hammer_hit_gen"
	self.melee_weapons.hammer.sounds.hit_body = "hammer_hit_body"
	self.melee_weapons.hammer.sounds.charge = "hammer_charge"
	self.melee_weapons.hammer.repeat_expire_t = 0.8
	self.melee_weapons.hammer.stats.concealment = 28
	self.melee_weapons.whiskey = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.whiskey.name_id = "bm_melee_whiskey"
	self.melee_weapons.whiskey.dlc = "pd2_clan"
	self.melee_weapons.whiskey.texture_bundle_folder = "character_pack_bonnie"
	self.melee_weapons.whiskey.free = nil
	self.melee_weapons.whiskey.anim_global_param = "melee_axe"
	self.melee_weapons.whiskey.type = "axe"
	self.melee_weapons.whiskey.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.whiskey.unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_mel_whiskey/wpn_fps_mel_whiskey"
	self.melee_weapons.whiskey.third_unit = "units/pd2_dlc_bonnie/weapons/wpn_fps_mel_whiskey/wpn_third_mel_whiskey"
	self.melee_weapons.whiskey.stats.weapon_type = "blunt"
	self.melee_weapons.whiskey.stats.min_damage = 3
	self.melee_weapons.whiskey.stats.max_damage = 5.5
	self.melee_weapons.whiskey.stats.min_damage_effect = 3
	self.melee_weapons.whiskey.stats.max_damage_effect = 2
	self.melee_weapons.whiskey.stats.charge_time = 2
	self.melee_weapons.whiskey.stats.range = 185
	self.melee_weapons.whiskey.menu_scene_anim = "menu"
	self.melee_weapons.whiskey.menu_scene_params = {
		loop = false,
		start_time = -1
	}
	self.melee_weapons.whiskey.sounds = {}
	self.melee_weapons.whiskey.sounds.equip = "whiskey_equip"
	self.melee_weapons.whiskey.sounds.hit_air = "whiskey_hit_air"
	self.melee_weapons.whiskey.sounds.hit_gen = "whiskey_hit_gen"
	self.melee_weapons.whiskey.sounds.hit_body = "whiskey_hit_body"
	self.melee_weapons.whiskey.sounds.charge = "whiskey_charge"
	self.melee_weapons.whiskey.repeat_expire_t = 0.8
	self.melee_weapons.whiskey.stats.concealment = 30
	self.melee_weapons.fork = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.fork.name_id = "bm_melee_fork"
	self.melee_weapons.fork.dlc = "bbq"
	self.melee_weapons.fork.texture_bundle_folder = "bbq"
	self.melee_weapons.fork.anim_global_param = "melee_stab"
	self.melee_weapons.fork.type = "axe"
	self.melee_weapons.fork.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.fork.unit = "units/pd2_dlc_bbq/weapons/fork/wpn_fps_mel_fork"
	self.melee_weapons.fork.third_unit = "units/pd2_dlc_bbq/weapons/fork/wpn_third_mel_fork"
	self.melee_weapons.fork.stats.weapon_type = "sharp"
	self.melee_weapons.fork.stats.min_damage = 3
	self.melee_weapons.fork.stats.max_damage = 8
	self.melee_weapons.fork.stats.min_damage_effect = 1
	self.melee_weapons.fork.stats.max_damage_effect = 1
	self.melee_weapons.fork.stats.charge_time = 2
	self.melee_weapons.fork.stats.range = 185
	self.melee_weapons.fork.sounds = {}
	self.melee_weapons.fork.sounds.equip = "bbq_fork_equip"
	self.melee_weapons.fork.sounds.hit_air = "bbq_fork_hit_air"
	self.melee_weapons.fork.sounds.hit_gen = "bbq_fork_hit_gen"
	self.melee_weapons.fork.sounds.hit_body = "bbq_fork_hit_body"
	self.melee_weapons.fork.sounds.charge = "bbq_fork_charge"
	self.melee_weapons.fork.repeat_expire_t = 0.3
	self.melee_weapons.fork.stats.concealment = 28
	self.melee_weapons.poker = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.poker.name_id = "bm_melee_poker"
	self.melee_weapons.poker.dlc = "bbq"
	self.melee_weapons.poker.texture_bundle_folder = "bbq"
	self.melee_weapons.poker.anim_global_param = "melee_blunt"
	self.melee_weapons.poker.type = "axe"
	self.melee_weapons.poker.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.poker.unit = "units/pd2_dlc_bbq/weapons/poker/wpn_fps_mel_poker"
	self.melee_weapons.poker.third_unit = "units/pd2_dlc_bbq/weapons/poker/wpn_third_mel_poker"
	self.melee_weapons.poker.stats.weapon_type = "blunt"
	self.melee_weapons.poker.stats.min_damage = 3
	self.melee_weapons.poker.stats.max_damage = 9
	self.melee_weapons.poker.stats.min_damage_effect = 5
	self.melee_weapons.poker.stats.max_damage_effect = 3
	self.melee_weapons.poker.stats.charge_time = 3
	self.melee_weapons.poker.stats.range = 185
	self.melee_weapons.poker.sounds = {}
	self.melee_weapons.poker.sounds.equip = "bbq_poker_equip"
	self.melee_weapons.poker.sounds.hit_air = "bbq_poker_hit_air"
	self.melee_weapons.poker.sounds.hit_gen = "bbq_poker_hit_gen"
	self.melee_weapons.poker.sounds.hit_body = "bbq_poker_hit_body"
	self.melee_weapons.poker.sounds.charge = "bbq_poker_charge"
	self.melee_weapons.poker.repeat_expire_t = 0.8
	self.melee_weapons.poker.stats.concealment = 28
	self.melee_weapons.spatula = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.spatula.name_id = "bm_melee_spatula"
	self.melee_weapons.spatula.dlc = "bbq"
	self.melee_weapons.spatula.texture_bundle_folder = "bbq"
	self.melee_weapons.spatula.anim_global_param = "melee_axe"
	self.melee_weapons.spatula.type = "axe"
	self.melee_weapons.spatula.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.spatula.unit = "units/pd2_dlc_bbq/weapons/spatula/wpn_fps_mel_spatula"
	self.melee_weapons.spatula.third_unit = "units/pd2_dlc_bbq/weapons/spatula/wpn_third_mel_spatula"
	self.melee_weapons.spatula.stats.weapon_type = "blunt"
	self.melee_weapons.spatula.stats.min_damage = 3
	self.melee_weapons.spatula.stats.max_damage = 5.5
	self.melee_weapons.spatula.stats.min_damage_effect = 3
	self.melee_weapons.spatula.stats.max_damage_effect = 2
	self.melee_weapons.spatula.stats.charge_time = 2
	self.melee_weapons.spatula.stats.range = 185
	self.melee_weapons.spatula.sounds = {}
	self.melee_weapons.spatula.sounds.equip = "bbq_spatula_equip"
	self.melee_weapons.spatula.sounds.hit_air = "bbq_spatula_hit_air"
	self.melee_weapons.spatula.sounds.hit_gen = "bbq_spatula_hit_gen"
	self.melee_weapons.spatula.sounds.hit_body = "bbq_spatula_hit_body"
	self.melee_weapons.spatula.sounds.charge = "bbq_spatula_charge"
	self.melee_weapons.spatula.repeat_expire_t = 0.8
	self.melee_weapons.spatula.stats.concealment = 29
	self.melee_weapons.tenderizer = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.tenderizer.name_id = "bm_melee_tenderizer"
	self.melee_weapons.tenderizer.dlc = "bbq"
	self.melee_weapons.tenderizer.texture_bundle_folder = "bbq"
	self.melee_weapons.tenderizer.anim_global_param = "melee_axe"
	self.melee_weapons.tenderizer.type = "axe"
	self.melee_weapons.tenderizer.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.tenderizer.unit = "units/pd2_dlc_bbq/weapons/wpn_mel_tenderizer/wpn_fps_mel_tenderizer"
	self.melee_weapons.tenderizer.third_unit = "units/pd2_dlc_bbq/weapons/wpn_mel_tenderizer/wpn_third_mel_tenderizer"
	self.melee_weapons.tenderizer.stats.weapon_type = "blunt"
	self.melee_weapons.tenderizer.stats.min_damage = 2
	self.melee_weapons.tenderizer.stats.max_damage = 4
	self.melee_weapons.tenderizer.stats.min_damage_effect = 10
	self.melee_weapons.tenderizer.stats.max_damage_effect = 10
	self.melee_weapons.tenderizer.stats.charge_time = 3
	self.melee_weapons.tenderizer.stats.range = 185
	self.melee_weapons.tenderizer.sounds = {}
	self.melee_weapons.tenderizer.sounds.equip = "bbq_tenderizer_equip"
	self.melee_weapons.tenderizer.sounds.hit_air = "bbq_tenderizer_hit_air"
	self.melee_weapons.tenderizer.sounds.hit_gen = "bbq_tenderizer_hit_gen"
	self.melee_weapons.tenderizer.sounds.hit_body = "bbq_tenderizer_hit_body"
	self.melee_weapons.tenderizer.sounds.charge = "bbq_tenderizer_charge"
	self.melee_weapons.tenderizer.repeat_expire_t = 0.8
	self.melee_weapons.tenderizer.stats.concealment = 28
	self.melee_weapons.scalper = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.scalper.name_id = "bm_melee_scalper"
	self.melee_weapons.scalper.dlc = "west"
	self.melee_weapons.scalper.texture_bundle_folder = "west"
	self.melee_weapons.scalper.anim_global_param = "melee_axe"
	self.melee_weapons.scalper.type = "axe"
	self.melee_weapons.scalper.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.scalper.unit = "units/pd2_dlc_west/weapons/wpn_fps_mel_scalper/wpn_fps_mel_scalper"
	self.melee_weapons.scalper.third_unit = "units/pd2_dlc_west/weapons/wpn_third_mel_scalper/wpn_third_mel_scalper"
	self.melee_weapons.scalper.stats.weapon_type = "sharp"
	self.melee_weapons.scalper.stats.min_damage = 3
	self.melee_weapons.scalper.stats.max_damage = 8
	self.melee_weapons.scalper.stats.min_damage_effect = 1
	self.melee_weapons.scalper.stats.max_damage_effect = 1
	self.melee_weapons.scalper.stats.charge_time = 2
	self.melee_weapons.scalper.stats.range = 200
	self.melee_weapons.scalper.expire_t = 0.6
	self.melee_weapons.scalper.repeat_expire_t = 0.8
	self.melee_weapons.scalper.attack_allowed_expire_t = 0.1
	self.melee_weapons.scalper.sounds = {}
	self.melee_weapons.scalper.sounds.equip = "tomahawk_equip"
	self.melee_weapons.scalper.sounds.hit_air = "tomahawk_hit_air"
	self.melee_weapons.scalper.sounds.hit_gen = "tomahawk_hit_gen"
	self.melee_weapons.scalper.sounds.hit_body = "tomahawk_hit_body"
	self.melee_weapons.scalper.sounds.charge = "tomahawk_charge"
	self.melee_weapons.scalper.stats.concealment = 28
	self.melee_weapons.mining_pick = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.mining_pick.name_id = "bm_melee_mining_pick"
	self.melee_weapons.mining_pick.dlc = "west"
	self.melee_weapons.mining_pick.texture_bundle_folder = "west"
	self.melee_weapons.mining_pick.anim_global_param = "melee_pickaxe"
	self.melee_weapons.mining_pick.type = "axe"
	self.melee_weapons.mining_pick.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.mining_pick.unit = "units/pd2_dlc_west/weapons/wpn_fps_mel_miningpick/wpn_fps_mel_miningpick"
	self.melee_weapons.mining_pick.third_unit = "units/pd2_dlc_west/weapons/wpn_third_mel_miningpick/wpn_third_mel_miningpick"
	self.melee_weapons.mining_pick.stats.weapon_type = "sharp"
	self.melee_weapons.mining_pick.stats.min_damage = 7
	self.melee_weapons.mining_pick.stats.max_damage = 45
	self.melee_weapons.mining_pick.stats.min_damage_effect = 1
	self.melee_weapons.mining_pick.stats.max_damage_effect = 1
	self.melee_weapons.mining_pick.stats.charge_time = 4
	self.melee_weapons.mining_pick.stats.range = 225
	self.melee_weapons.mining_pick.expire_t = 1.1
	self.melee_weapons.mining_pick.repeat_expire_t = 0.8
	self.melee_weapons.mining_pick.attack_allowed_expire_t = 0.1
	self.melee_weapons.mining_pick.sounds = {}
	self.melee_weapons.mining_pick.sounds.equip = "mining_pick_equip"
	self.melee_weapons.mining_pick.sounds.hit_air = "mining_pick_hit_air"
	self.melee_weapons.mining_pick.sounds.hit_gen = "mining_pick_hit_gen"
	self.melee_weapons.mining_pick.sounds.hit_body = "mining_pick_hit_body"
	self.melee_weapons.mining_pick.sounds.charge = "mining_pick_charge"
	self.melee_weapons.mining_pick.stats.concealment = 27
	self.melee_weapons.branding_iron = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.branding_iron.name_id = "bm_melee_branding_iron"
	self.melee_weapons.branding_iron.dlc = "west"
	self.melee_weapons.branding_iron.texture_bundle_folder = "west"
	self.melee_weapons.branding_iron.anim_global_param = "melee_axe"
	self.melee_weapons.branding_iron.type = "axe"
	self.melee_weapons.branding_iron.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.branding_iron.unit = "units/pd2_dlc_west/weapons/wpn_fps_mel_branding/wpn_fps_mel_branding"
	self.melee_weapons.branding_iron.third_unit = "units/pd2_dlc_west/weapons/wpn_third_mel_branding/wpn_third_mel_branding"
	self.melee_weapons.branding_iron.stats.weapon_type = "sharp"
	self.melee_weapons.branding_iron.stats.min_damage = 3
	self.melee_weapons.branding_iron.stats.max_damage = 9
	self.melee_weapons.branding_iron.stats.min_damage_effect = 5
	self.melee_weapons.branding_iron.stats.max_damage_effect = 3
	self.melee_weapons.branding_iron.stats.charge_time = 3
	self.melee_weapons.branding_iron.stats.range = 225
	self.melee_weapons.branding_iron.expire_t = 1.1
	self.melee_weapons.branding_iron.repeat_expire_t = 0.8
	self.melee_weapons.branding_iron.attack_allowed_expire_t = 0.1
	self.melee_weapons.branding_iron.sounds = {}
	self.melee_weapons.branding_iron.sounds.equip = "branding_iron_equip"
	self.melee_weapons.branding_iron.sounds.hit_air = "branding_iron_hit_air"
	self.melee_weapons.branding_iron.sounds.hit_gen = "branding_iron_hit_gen"
	self.melee_weapons.branding_iron.sounds.hit_body = "branding_iron_hit_body"
	self.melee_weapons.branding_iron.sounds.charge = "branding_iron_charge"
	self.melee_weapons.branding_iron.stats.concealment = 27
	self.melee_weapons.bowie = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.bowie.name_id = "bm_melee_bowie"
	self.melee_weapons.bowie.dlc = "west"
	self.melee_weapons.bowie.texture_bundle_folder = "west"
	self.melee_weapons.bowie.anim_global_param = "melee_knife"
	self.melee_weapons.bowie.type = "knife"
	self.melee_weapons.bowie.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.bowie.unit = "units/pd2_dlc_west/weapons/wpn_fps_mel_bowie/wpn_fps_mel_bowie"
	self.melee_weapons.bowie.third_unit = "units/pd2_dlc_west/weapons/wpn_third_mel_bowie/wpn_third_mel_bowie"
	self.melee_weapons.bowie.stats.weapon_type = "sharp"
	self.melee_weapons.bowie.stats.min_damage = 3
	self.melee_weapons.bowie.stats.max_damage = 8
	self.melee_weapons.bowie.stats.min_damage_effect = 1
	self.melee_weapons.bowie.stats.max_damage_effect = 1
	self.melee_weapons.bowie.stats.charge_time = 2
	self.melee_weapons.bowie.stats.range = 225
	self.melee_weapons.bowie.expire_t = 1.1
	self.melee_weapons.bowie.repeat_expire_t = 0.8
	self.melee_weapons.bowie.attack_allowed_expire_t = 0.1
	self.melee_weapons.bowie.menu_scene_anim = "menu"
	self.melee_weapons.bowie.menu_scene_params = {
		loop = false,
		start_time = -1
	}
	self.melee_weapons.bowie.sounds = {}
	self.melee_weapons.bowie.sounds.equip = "knife_equip"
	self.melee_weapons.bowie.sounds.hit_air = "knife_hit_air"
	self.melee_weapons.bowie.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.bowie.sounds.hit_body = "knife_hit_body"
	self.melee_weapons.bowie.sounds.charge = "knife_charge"
	self.melee_weapons.bowie.stats.concealment = 30
	self.melee_weapons.microphone = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.microphone.name_id = "bm_melee_microphone"
	self.melee_weapons.microphone.dlc = "arena"
	self.melee_weapons.microphone.texture_bundle_folder = "dlc_arena"
	self.melee_weapons.microphone.anim_global_param = "melee_axe"
	self.melee_weapons.microphone.type = "axe"
	self.melee_weapons.microphone.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.microphone.unit = "units/pd2_dlc_arena/weapons/wpn_fps_mel_microphone/wpn_fps_mel_microphone"
	self.melee_weapons.microphone.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_mel_microphone/wpn_third_mel_microphone"
	self.melee_weapons.microphone.stats.weapon_type = "sharp"
	self.melee_weapons.microphone.stats.min_damage = 3
	self.melee_weapons.microphone.stats.max_damage = 5.5
	self.melee_weapons.microphone.stats.min_damage_effect = 3
	self.melee_weapons.microphone.stats.max_damage_effect = 2
	self.melee_weapons.microphone.stats.charge_time = 2
	self.melee_weapons.microphone.stats.range = 150
	self.melee_weapons.microphone.expire_t = 1.1
	self.melee_weapons.microphone.repeat_expire_t = 0.8
	self.melee_weapons.microphone.attack_allowed_expire_t = 0.1
	self.melee_weapons.microphone.sounds = {}
	self.melee_weapons.microphone.sounds.equip = "microphone_equip"
	self.melee_weapons.microphone.sounds.hit_air = "microphone_hit_air"
	self.melee_weapons.microphone.sounds.hit_gen = "microphone_hit_gen"
	self.melee_weapons.microphone.sounds.hit_body = "microphone_hit_body"
	self.melee_weapons.microphone.sounds.charge = "microphone_charge"
	self.melee_weapons.microphone.stats.concealment = 30
	self.melee_weapons.detector = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.detector.name_id = "bm_melee_detector"
	self.melee_weapons.detector.dlc = "arena"
	self.melee_weapons.detector.texture_bundle_folder = "dlc_arena"
	self.melee_weapons.detector.anim_global_param = "melee_axe"
	self.melee_weapons.detector.type = "axe"
	self.melee_weapons.detector.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.detector.unit = "units/pd2_dlc_arena/weapons/wpn_fps_mel_detector/wpn_fps_mel_detector"
	self.melee_weapons.detector.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_mel_detector/wpn_third_mel_detector"
	self.melee_weapons.detector.stats.weapon_type = "sharp"
	self.melee_weapons.detector.stats.min_damage = 3
	self.melee_weapons.detector.stats.max_damage = 5.5
	self.melee_weapons.detector.stats.min_damage_effect = 3
	self.melee_weapons.detector.stats.max_damage_effect = 2
	self.melee_weapons.detector.stats.charge_time = 2
	self.melee_weapons.detector.stats.range = 225
	self.melee_weapons.detector.expire_t = 1.1
	self.melee_weapons.detector.repeat_expire_t = 0.8
	self.melee_weapons.detector.attack_allowed_expire_t = 0.1
	self.melee_weapons.detector.sounds = {}
	self.melee_weapons.detector.sounds.equip = "metal_detector_equip"
	self.melee_weapons.detector.sounds.hit_air = "metal_detector_hit_air"
	self.melee_weapons.detector.sounds.hit_gen = "metal_detector_hit_gen"
	self.melee_weapons.detector.sounds.hit_body = "metal_detector_hit_body"
	self.melee_weapons.detector.sounds.charge = "metal_detector_charge"
	self.melee_weapons.detector.stats.concealment = 29
	self.melee_weapons.micstand = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.micstand.name_id = "bm_melee_micstand"
	self.melee_weapons.micstand.dlc = "arena"
	self.melee_weapons.micstand.texture_bundle_folder = "dlc_arena"
	self.melee_weapons.micstand.anim_global_param = "melee_axe"
	self.melee_weapons.micstand.type = "axe"
	self.melee_weapons.micstand.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.micstand.unit = "units/pd2_dlc_arena/weapons/wpn_fps_mel_micstand/wpn_fps_mel_micstand"
	self.melee_weapons.micstand.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_mel_micstand/wpn_third_mel_micstand"
	self.melee_weapons.micstand.stats.weapon_type = "sharp"
	self.melee_weapons.micstand.stats.min_damage = 3
	self.melee_weapons.micstand.stats.max_damage = 9
	self.melee_weapons.micstand.stats.min_damage_effect = 5
	self.melee_weapons.micstand.stats.max_damage_effect = 3
	self.melee_weapons.micstand.stats.charge_time = 3
	self.melee_weapons.micstand.stats.range = 250
	self.melee_weapons.micstand.expire_t = 0.8
	self.melee_weapons.micstand.repeat_expire_t = 0.8
	self.melee_weapons.micstand.attack_allowed_expire_t = 0.1
	self.melee_weapons.micstand.sounds = {}
	self.melee_weapons.micstand.sounds.equip = "mic_stand_equip"
	self.melee_weapons.micstand.sounds.hit_air = "mic_stand_hit_air"
	self.melee_weapons.micstand.sounds.hit_gen = "mic_stand_hit_gen"
	self.melee_weapons.micstand.sounds.hit_body = "mic_stand_hit_body"
	self.melee_weapons.micstand.sounds.charge = "mic_stand_charge"
	self.melee_weapons.micstand.stats.concealment = 27
	self.melee_weapons.oldbaton = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.oldbaton.name_id = "bm_melee_oldbaton"
	self.melee_weapons.oldbaton.dlc = "arena"
	self.melee_weapons.oldbaton.texture_bundle_folder = "dlc_arena"
	self.melee_weapons.oldbaton.anim_global_param = "melee_axe"
	self.melee_weapons.oldbaton.type = "axe"
	self.melee_weapons.oldbaton.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.oldbaton.unit = "units/pd2_dlc_arena/weapons/wpn_fps_mel_oldbaton/wpn_fps_mel_oldbaton"
	self.melee_weapons.oldbaton.third_unit = "units/pd2_dlc_arena/weapons/wpn_third_mel_oldbaton/wpn_third_mel_oldbaton"
	self.melee_weapons.oldbaton.stats.weapon_type = "sharp"
	self.melee_weapons.oldbaton.stats.min_damage = 3
	self.melee_weapons.oldbaton.stats.max_damage = 9
	self.melee_weapons.oldbaton.stats.min_damage_effect = 5
	self.melee_weapons.oldbaton.stats.max_damage_effect = 3
	self.melee_weapons.oldbaton.stats.charge_time = 3
	self.melee_weapons.oldbaton.stats.range = 250
	self.melee_weapons.oldbaton.expire_t = 1.1
	self.melee_weapons.oldbaton.repeat_expire_t = 0.8
	self.melee_weapons.oldbaton.attack_allowed_expire_t = 0.1
	self.melee_weapons.oldbaton.sounds = {}
	self.melee_weapons.oldbaton.sounds.equip = "copbaton_equip"
	self.melee_weapons.oldbaton.sounds.hit_air = "copbaton_hit_air"
	self.melee_weapons.oldbaton.sounds.hit_gen = "copbaton_hit_gen"
	self.melee_weapons.oldbaton.sounds.hit_body = "copbaton_hit_body"
	self.melee_weapons.oldbaton.sounds.charge = "copbaton_charge"
	self.melee_weapons.oldbaton.stats.concealment = 28
	self.melee_weapons.hockey = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.hockey.name_id = "bm_melee_hockey"
	self.melee_weapons.hockey.dlc = "character_pack_sokol"
	self.melee_weapons.hockey.texture_bundle_folder = "character_pack_sokol"
	self.melee_weapons.hockey.anim_global_param = "melee_axe"
	self.melee_weapons.hockey.type = "axe"
	self.melee_weapons.hockey.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.hockey.unit = "units/pd2_dlc_character_sokol/weapons/wpn_fps_mel_hockey/wpn_fps_mel_hockey"
	self.melee_weapons.hockey.third_unit = "units/pd2_dlc_character_sokol/weapons/wpn_third_mel_hockey/wpn_third_mel_hockey"
	self.melee_weapons.hockey.stats.weapon_type = "sharp"
	self.melee_weapons.hockey.stats.min_damage = 3
	self.melee_weapons.hockey.stats.max_damage = 9
	self.melee_weapons.hockey.stats.min_damage_effect = 5
	self.melee_weapons.hockey.stats.max_damage_effect = 3
	self.melee_weapons.hockey.stats.charge_time = 3
	self.melee_weapons.hockey.stats.range = 250
	self.melee_weapons.hockey.expire_t = 0.8
	self.melee_weapons.hockey.repeat_expire_t = 0.8
	self.melee_weapons.hockey.attack_allowed_expire_t = 0.1
	self.melee_weapons.hockey.sounds = {}
	self.melee_weapons.hockey.sounds.equip = "bat_equip"
	self.melee_weapons.hockey.sounds.hit_air = "bat_hit_air"
	self.melee_weapons.hockey.sounds.hit_gen = "hockeystick_hit_gen"
	self.melee_weapons.hockey.sounds.hit_body = "hockeystick_hit_body"
	self.melee_weapons.hockey.sounds.charge = "bat_charge"
	self.melee_weapons.hockey.stats.concealment = 27
	self.melee_weapons.switchblade = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.switchblade.name_id = "bm_melee_switchblade"
	self.melee_weapons.switchblade.anim_global_param = "melee_stab"
	self.melee_weapons.switchblade.dlc = "kenaz"
	self.melee_weapons.switchblade.texture_bundle_folder = "kenaz"
	self.melee_weapons.switchblade.type = "knife"
	self.melee_weapons.switchblade.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.switchblade.unit = "units/pd2_dlc_casino/weapons/wpn_fps_mel_switchblade/wpn_fps_mel_switchblade"
	self.melee_weapons.switchblade.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_mel_switchblade/wpn_third_mel_switchblade"
	self.melee_weapons.switchblade.sounds = {}
	self.melee_weapons.switchblade.sounds.equip = "toothbrush_equip"
	self.melee_weapons.switchblade.sounds.hit_air = "toothbrush_hit_air"
	self.melee_weapons.switchblade.sounds.hit_gen = "toothbrush_hit_gen"
	self.melee_weapons.switchblade.sounds.hit_body = "toothbrush_hit_body"
	self.melee_weapons.switchblade.sounds.charge = "toothbrush_charge"
	self.melee_weapons.switchblade.stats.min_damage = 3
	self.melee_weapons.switchblade.stats.max_damage = 8
	self.melee_weapons.switchblade.stats.min_damage_effect = 1
	self.melee_weapons.switchblade.stats.max_damage_effect = 1
	self.melee_weapons.switchblade.stats.charge_time = 2
	self.melee_weapons.switchblade.stats.range = 175
	self.melee_weapons.switchblade.stats.concealment = 30
	self.melee_weapons.switchblade.repeat_expire_t = 0.3
	self.melee_weapons.switchblade.expire_t = 1
	self.melee_weapons.switchblade.melee_damage_delay = 0.1
	self.melee_weapons.taser = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.taser.name_id = "bm_melee_taser"
	self.melee_weapons.taser.info_id = "bm_melee_taser_info"
	self.melee_weapons.taser.anim_global_param = "melee_taser"
	self.melee_weapons.taser.dlc = "kenaz"
	self.melee_weapons.taser.texture_bundle_folder = "kenaz"
	self.melee_weapons.taser.type = "knife"
	self.melee_weapons.taser.tase_data = {
		tase_strength = "light"
	}
	self.melee_weapons.taser.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.taser.unit = "units/pd2_dlc_casino/weapons/wpn_fps_mel_taser/wpn_fps_mel_taser"
	self.melee_weapons.taser.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_mel_taser/wpn_third_mel_taser"
	self.melee_weapons.taser.sounds = {}
	self.melee_weapons.taser.sounds.equip = "buzzer_detector_equip"
	self.melee_weapons.taser.sounds.hit_air = "buzzer_detector_hit_air"
	self.melee_weapons.taser.sounds.hit_gen = "buzzer_detector_hit_gen"
	self.melee_weapons.taser.sounds.hit_body = "buzzer_detector_hit_body"
	self.melee_weapons.taser.sounds.charge = "buzzer_charge"
	self.melee_weapons.taser.stats.min_damage = 2
	self.melee_weapons.taser.stats.max_damage = 2
	self.melee_weapons.taser.stats.min_damage_effect = 1
	self.melee_weapons.taser.stats.max_damage_effect = 1
	self.melee_weapons.taser.stats.charge_time = 3.5
	self.melee_weapons.taser.stats.range = 200
	self.melee_weapons.taser.stats.concealment = 30
	self.melee_weapons.taser.expire_t = 1
	self.melee_weapons.taser.repeat_expire_t = 0.7
	self.melee_weapons.taser.melee_damage_delay = 0.1
	self.melee_weapons.slot_lever = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.slot_lever.name_id = "bm_melee_slot_lever"
	self.melee_weapons.slot_lever.anim_global_param = "melee_axe"
	self.melee_weapons.slot_lever.dlc = "kenaz"
	self.melee_weapons.slot_lever.texture_bundle_folder = "kenaz"
	self.melee_weapons.slot_lever.type = "knife"
	self.melee_weapons.slot_lever.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.slot_lever.unit = "units/pd2_dlc_casino/weapons/wpn_fps_mel_slot_lever/wpn_fps_mel_slot_lever"
	self.melee_weapons.slot_lever.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_mel_slot_lever/wpn_third_mel_slot_lever"
	self.melee_weapons.slot_lever.sounds = {}
	self.melee_weapons.slot_lever.sounds.equip = "slot_lever_equip"
	self.melee_weapons.slot_lever.sounds.hit_air = "slot_lever_hit_air"
	self.melee_weapons.slot_lever.sounds.hit_gen = "slot_lever_hit_gen"
	self.melee_weapons.slot_lever.sounds.hit_body = "slot_lever_hit_body"
	self.melee_weapons.slot_lever.sounds.charge = "slot_lever_charge"
	self.melee_weapons.slot_lever.stats.min_damage = 3
	self.melee_weapons.slot_lever.stats.max_damage = 9
	self.melee_weapons.slot_lever.stats.min_damage_effect = 5
	self.melee_weapons.slot_lever.stats.max_damage_effect = 3
	self.melee_weapons.slot_lever.stats.charge_time = 2
	self.melee_weapons.slot_lever.stats.range = 225
	self.melee_weapons.slot_lever.stats.concealment = 28
	self.melee_weapons.slot_lever.expire_t = 0.6
	self.melee_weapons.slot_lever.repeat_expire_t = 0.7
	self.melee_weapons.slot_lever.melee_damage_delay = 0.1
	self.melee_weapons.croupier_rake = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.croupier_rake.name_id = "bm_melee_croupier_rake"
	self.melee_weapons.croupier_rake.anim_global_param = "melee_axe"
	self.melee_weapons.croupier_rake.dlc = "kenaz"
	self.melee_weapons.croupier_rake.texture_bundle_folder = "kenaz"
	self.melee_weapons.croupier_rake.type = "knife"
	self.melee_weapons.croupier_rake.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.croupier_rake.unit = "units/pd2_dlc_casino/weapons/wpn_fps_mel_croupier_rake/wpn_fps_mel_croupier_rake"
	self.melee_weapons.croupier_rake.third_unit = "units/pd2_dlc_casino/weapons/wpn_third_mel_croupier_rake/wpn_third_mel_croupier_rake"
	self.melee_weapons.croupier_rake.sounds = {}
	self.melee_weapons.croupier_rake.sounds.equip = "croupier_stick_equip"
	self.melee_weapons.croupier_rake.sounds.hit_air = "croupier_stick_hit_air"
	self.melee_weapons.croupier_rake.sounds.hit_gen = "croupier_stick_hit_gen"
	self.melee_weapons.croupier_rake.sounds.hit_body = "croupier_stick_hit_body"
	self.melee_weapons.croupier_rake.sounds.charge = "croupier_stick_charge"
	self.melee_weapons.croupier_rake.stats.min_damage = 3
	self.melee_weapons.croupier_rake.stats.max_damage = 9
	self.melee_weapons.croupier_rake.stats.min_damage_effect = 5
	self.melee_weapons.croupier_rake.stats.max_damage_effect = 3
	self.melee_weapons.croupier_rake.stats.charge_time = 3
	self.melee_weapons.croupier_rake.stats.range = 250
	self.melee_weapons.croupier_rake.stats.concealment = 28
	self.melee_weapons.croupier_rake.expire_t = 0.6
	self.melee_weapons.croupier_rake.repeat_expire_t = 0.7
	self.melee_weapons.croupier_rake.melee_damage_delay = 0.1
	self.melee_weapons.fight = {}
	self.melee_weapons.fight.name_id = "bm_melee_fight"
	self.melee_weapons.fight.type = "fists"
	self.melee_weapons.fight.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_fight/wpn_fps_mel_fight"
	self.melee_weapons.fight.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_fight/wpn_fps_mel_fight"
	self.melee_weapons.fight.no_inventory_preview = true
	self.melee_weapons.fight.free = nil
	self.melee_weapons.fight.dlc = "turtles"
	self.melee_weapons.fight.texture_bundle_folder = "turtles"
	self.melee_weapons.fight.stats = {}
	self.melee_weapons.fight.stats.min_damage = 3
	self.melee_weapons.fight.stats.max_damage = 5.5
	self.melee_weapons.fight.stats.min_damage_effect = 3
	self.melee_weapons.fight.stats.max_damage_effect = 2
	self.melee_weapons.fight.stats.charge_time = 2
	self.melee_weapons.fight.stats.range = 150
	self.melee_weapons.fight.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.fight.stats.weapon_type = "blunt"
	self.melee_weapons.fight.anim_global_param = "melee_fight"
	self.melee_weapons.fight.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4",
		"var5"
	}
	self.melee_weapons.fight.expire_t = 1.1
	self.melee_weapons.fight.repeat_expire_t = 0.55
	self.melee_weapons.fight.melee_damage_delay = 0.1
	self.melee_weapons.fight.melee_charge_shaker = "player_melee_charge_fist"
	self.melee_weapons.fight.sounds = {}
	self.melee_weapons.fight.sounds.equip = "fight_equip"
	self.melee_weapons.fight.sounds.hit_air = "fight_hit_air"
	self.melee_weapons.fight.sounds.hit_gen = "fight_hit_gen"
	self.melee_weapons.fight.sounds.hit_body = "fight_hit_body"
	self.melee_weapons.fight.sounds.charge = "fight_charge"
	self.melee_weapons.fight.stats.concealment = 30
	self.melee_weapons.tiger = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.tiger.name_id = "bm_melee_tiger"
	self.melee_weapons.tiger.free = nil
	self.melee_weapons.tiger.type = "fists"
	self.melee_weapons.tiger.dlc = "turtles"
	self.melee_weapons.tiger.texture_bundle_folder = "turtles"
	self.melee_weapons.tiger.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.tiger.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_tiger/wpn_fps_mel_tiger"
	self.melee_weapons.tiger.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_tiger/wpn_third_mel_tiger"
	self.melee_weapons.tiger.anim_global_param = "melee_fist"
	self.melee_weapons.tiger.stats.min_damage = 3
	self.melee_weapons.tiger.stats.max_damage = 8
	self.melee_weapons.tiger.stats.min_damage_effect = 1
	self.melee_weapons.tiger.stats.max_damage_effect = 1
	self.melee_weapons.tiger.stats.charge_time = 2
	self.melee_weapons.tiger.stats.range = 150
	self.melee_weapons.tiger.melee_damage_delay = 0.1
	self.melee_weapons.tiger.sounds.equip = "tiger_equip"
	self.melee_weapons.tiger.sounds.hit_air = "tiger_hit_air"
	self.melee_weapons.tiger.sounds.hit_gen = "tiger_hit_gen"
	self.melee_weapons.tiger.sounds.hit_body = "tiger_hit_body"
	self.melee_weapons.tiger.sounds.charge = "tiger_charge"
	self.melee_weapons.tiger.stats.concealment = 28
	self.melee_weapons.cqc = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.cqc.name_id = "bm_melee_cqc"
	self.melee_weapons.cqc.info_id = "bm_melee_cqc_info"
	self.melee_weapons.cqc.dlc = "turtles"
	self.melee_weapons.cqc.texture_bundle_folder = "turtles"
	self.melee_weapons.cqc.free = nil
	self.melee_weapons.cqc.anim_global_param = "melee_stab"
	self.melee_weapons.cqc.type = "knife"
	self.melee_weapons.cqc.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.cqc.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_cqc/wpn_fps_mel_cqc"
	self.melee_weapons.cqc.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_cqc/wpn_third_mel_cqc"
	self.melee_weapons.cqc.dot_data_name = "melee_cqc"
	self.melee_weapons.cqc.stats.weapon_type = "sharp"
	self.melee_weapons.cqc.stats.min_damage = 3
	self.melee_weapons.cqc.stats.max_damage = 8
	self.melee_weapons.cqc.stats.min_damage_effect = 1
	self.melee_weapons.cqc.stats.max_damage_effect = 1
	self.melee_weapons.cqc.stats.charge_time = 2
	self.melee_weapons.cqc.stats.range = 150
	self.melee_weapons.cqc.sounds = {}
	self.melee_weapons.cqc.sounds.equip = "cqc_equip"
	self.melee_weapons.cqc.sounds.hit_air = "cqc_hit_air"
	self.melee_weapons.cqc.sounds.hit_gen = "cqc_hit_gen"
	self.melee_weapons.cqc.sounds.hit_body = "cqc_hit_body"
	self.melee_weapons.cqc.sounds.charge = "cqc_charge"
	self.melee_weapons.cqc.repeat_expire_t = 0.3
	self.melee_weapons.cqc.stats.concealment = 30
	self.melee_weapons.twins = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.twins.name_id = "bm_melee_twins"
	self.melee_weapons.twins.dlc = "turtles"
	self.melee_weapons.twins.texture_bundle_folder = "turtles"
	self.melee_weapons.twins.free = nil
	self.melee_weapons.twins.anim_global_param = "melee_twins"
	self.melee_weapons.twins.type = "knife"
	self.melee_weapons.twins.align_objects = {
		"a_weapon_right",
		"a_weapon_left"
	}
	self.melee_weapons.twins.unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_twin/wpn_fps_mel_twin"
	self.melee_weapons.twins.third_unit = "units/pd2_dlc_turtles/weapons/wpn_fps_mel_twin/wpn_third_mel_twin"
	self.melee_weapons.twins.stats.weapon_type = "sharp"
	self.melee_weapons.twins.stats.min_damage = 3
	self.melee_weapons.twins.stats.max_damage = 8
	self.melee_weapons.twins.stats.min_damage_effect = 1
	self.melee_weapons.twins.stats.max_damage_effect = 1
	self.melee_weapons.twins.stats.charge_time = 2
	self.melee_weapons.twins.stats.range = 200
	self.melee_weapons.twins.sounds = {}
	self.melee_weapons.twins.sounds.equip = "twin_equip"
	self.melee_weapons.twins.sounds.hit_air = "twin_hit_air"
	self.melee_weapons.twins.sounds.hit_gen = "twin_hit_gen"
	self.melee_weapons.twins.sounds.hit_body = "twin_hit_body"
	self.melee_weapons.twins.sounds.charge = "twin_charge"
	self.melee_weapons.twins.repeat_expire_t = 0.6
	self.melee_weapons.twins.stats.concealment = 29
	self.melee_weapons.sandsteel = {}
	self.melee_weapons.sandsteel.name_id = "bm_melee_sandsteel"
	self.melee_weapons.sandsteel.animation = nil
	self.melee_weapons.sandsteel.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.sandsteel.anim_global_param = "melee_sandsteel"
	self.melee_weapons.sandsteel.dlc = "dragon"
	self.melee_weapons.sandsteel.texture_bundle_folder = "dragon"
	self.melee_weapons.sandsteel.type = "axe"
	self.melee_weapons.sandsteel.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.sandsteel.unit = "units/pd2_dlc_dragon/weapons/wpn_fps_mel_sandsteel/wpn_fps_mel_sandsteel"
	self.melee_weapons.sandsteel.third_unit = "units/pd2_dlc_dragon/weapons/wpn_fps_mel_sandsteel/wpn_third_mel_sandsteel"
	self.melee_weapons.sandsteel.sounds = {}
	self.melee_weapons.sandsteel.sounds.equip = "sandsteel_equip"
	self.melee_weapons.sandsteel.sounds.hit_air = "sandsteel_hit_air"
	self.melee_weapons.sandsteel.sounds.hit_gen = "sandsteel_hit_gen"
	self.melee_weapons.sandsteel.sounds.hit_body = "sandsteel_hit_body"
	self.melee_weapons.sandsteel.sounds.charge = "sandsteel_charge"
	self.melee_weapons.sandsteel.stats = {}
	self.melee_weapons.sandsteel.stats.weapon_type = "sharp"
	self.melee_weapons.sandsteel.stats.min_damage = 7
	self.melee_weapons.sandsteel.stats.max_damage = 45
	self.melee_weapons.sandsteel.stats.min_damage_effect = 1
	self.melee_weapons.sandsteel.stats.max_damage_effect = 1
	self.melee_weapons.sandsteel.stats.charge_time = 4
	self.melee_weapons.sandsteel.stats.range = 275
	self.melee_weapons.sandsteel.stats.concealment = 27
	self.melee_weapons.sandsteel.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.sandsteel.repeat_expire_t = 0.5
	self.melee_weapons.sandsteel.expire_t = 1
	self.melee_weapons.sandsteel.melee_damage_delay = 0.1
	self.melee_weapons.great = {}
	self.melee_weapons.great.name_id = "bm_melee_great"
	self.melee_weapons.great.animation = nil
	self.melee_weapons.great.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.great.anim_global_param = "melee_great"
	self.melee_weapons.great.dlc = "steel"
	self.melee_weapons.great.texture_bundle_folder = "steel"
	self.melee_weapons.great.type = "sword"
	self.melee_weapons.great.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.great.unit = "units/pd2_dlc_steel/weapons/wpn_fps_mel_great/wpn_fps_mel_great"
	self.melee_weapons.great.third_unit = "units/pd2_dlc_steel/weapons/wpn_fps_mel_great/wpn_third_mel_great"
	self.melee_weapons.great.sounds = {}
	self.melee_weapons.great.sounds.equip = "great_equip"
	self.melee_weapons.great.sounds.hit_air = "great_hit_air"
	self.melee_weapons.great.sounds.hit_gen = "great_hit_gen"
	self.melee_weapons.great.sounds.hit_body = "great_hit_body"
	self.melee_weapons.great.sounds.charge = "great_charge"
	self.melee_weapons.great.stats = {}
	self.melee_weapons.great.stats.weapon_type = "sharp"
	self.melee_weapons.great.stats.min_damage = 7
	self.melee_weapons.great.stats.max_damage = 45
	self.melee_weapons.great.stats.min_damage_effect = 1
	self.melee_weapons.great.stats.max_damage_effect = 1
	self.melee_weapons.great.stats.charge_time = 4
	self.melee_weapons.great.stats.range = 275
	self.melee_weapons.great.stats.concealment = 27
	self.melee_weapons.great.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.great.repeat_expire_t = 1.1
	self.melee_weapons.great.expire_t = 1.5
	self.melee_weapons.great.melee_damage_delay = 0.6
	self.melee_weapons.beardy = {}
	self.melee_weapons.beardy.name_id = "bm_melee_beardy"
	self.melee_weapons.beardy.animation = nil
	self.melee_weapons.beardy.anim_attack_vars = {
		"var1",
		"var2",
		"var3"
	}
	self.melee_weapons.beardy.anim_global_param = "melee_beardy"
	self.melee_weapons.beardy.dlc = "steel"
	self.melee_weapons.beardy.texture_bundle_folder = "steel"
	self.melee_weapons.beardy.type = "axe"
	self.melee_weapons.beardy.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.beardy.unit = "units/pd2_dlc_steel/weapons/wpn_fps_mel_beardy/wpn_fps_mel_beardy"
	self.melee_weapons.beardy.third_unit = "units/pd2_dlc_steel/weapons/wpn_fps_mel_beardy/wpn_third_mel_beardy"
	self.melee_weapons.beardy.sounds = {}
	self.melee_weapons.beardy.sounds.equip = "beardy_equip"
	self.melee_weapons.beardy.sounds.hit_air = "beardy_hit_air"
	self.melee_weapons.beardy.sounds.hit_gen = "beardy_hit_gen"
	self.melee_weapons.beardy.sounds.hit_body = "beardy_hit_body"
	self.melee_weapons.beardy.sounds.charge = "beardy_charge"
	self.melee_weapons.beardy.stats = {}
	self.melee_weapons.beardy.stats.weapon_type = "sharp"
	self.melee_weapons.beardy.stats.min_damage = 7
	self.melee_weapons.beardy.stats.max_damage = 45
	self.melee_weapons.beardy.stats.min_damage_effect = 1
	self.melee_weapons.beardy.stats.max_damage_effect = 1
	self.melee_weapons.beardy.stats.charge_time = 4
	self.melee_weapons.beardy.stats.range = 250
	self.melee_weapons.beardy.stats.concealment = 26
	self.melee_weapons.beardy.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.beardy.repeat_expire_t = 1.1
	self.melee_weapons.beardy.expire_t = 1.5
	self.melee_weapons.beardy.melee_damage_delay = 0.6
	self.melee_weapons.buck = {}
	self.melee_weapons.buck.name_id = "bm_melee_buck"
	self.melee_weapons.buck.animation = nil
	self.melee_weapons.buck.anim_attack_vars = {
		"var1",
		"var2"
	}
	self.melee_weapons.buck.anim_global_param = "melee_buck"
	self.melee_weapons.buck.dlc = "steel"
	self.melee_weapons.buck.texture_bundle_folder = "steel"
	self.melee_weapons.buck.type = "axe"
	self.melee_weapons.buck.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.buck.unit = "units/pd2_dlc_steel/weapons/wpn_fps_mel_buck/wpn_fps_mel_buck"
	self.melee_weapons.buck.third_unit = "units/pd2_dlc_steel/weapons/wpn_fps_mel_buck/wpn_third_mel_buck"
	self.melee_weapons.buck.sounds = {}
	self.melee_weapons.buck.sounds.equip = "buck_equip"
	self.melee_weapons.buck.sounds.hit_air = "buck_hit_air"
	self.melee_weapons.buck.sounds.hit_gen = "buck_hit_gen"
	self.melee_weapons.buck.sounds.hit_body = "buck_hit_body"
	self.melee_weapons.buck.sounds.charge = "buck_charge"
	self.melee_weapons.buck.stats = {}
	self.melee_weapons.buck.stats.weapon_type = "sharp"
	self.melee_weapons.buck.stats.min_damage = 3
	self.melee_weapons.buck.stats.max_damage = 5.5
	self.melee_weapons.buck.stats.min_damage_effect = 3
	self.melee_weapons.buck.stats.max_damage_effect = 2
	self.melee_weapons.buck.stats.charge_time = 2
	self.melee_weapons.buck.stats.range = 175
	self.melee_weapons.buck.stats.concealment = 28
	self.melee_weapons.buck.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.buck.repeat_expire_t = 0.9
	self.melee_weapons.buck.expire_t = 1.4
	self.melee_weapons.buck.melee_damage_delay = 0.4
	self.melee_weapons.morning = {}
	self.melee_weapons.morning.name_id = "bm_melee_morning"
	self.melee_weapons.morning.animation = nil
	self.melee_weapons.morning.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.morning.anim_global_param = "melee_axe"
	self.melee_weapons.morning.dlc = "steel"
	self.melee_weapons.morning.texture_bundle_folder = "steel"
	self.melee_weapons.morning.type = "axe"
	self.melee_weapons.morning.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.morning.unit = "units/pd2_dlc_steel/weapons/wpn_fps_mel_morning/wpn_fps_mel_morning"
	self.melee_weapons.morning.third_unit = "units/pd2_dlc_steel/weapons/wpn_fps_mel_morning/wpn_third_mel_morning"
	self.melee_weapons.morning.sounds = {}
	self.melee_weapons.morning.sounds.equip = "morning_equip"
	self.melee_weapons.morning.sounds.hit_air = "morning_hit_air"
	self.melee_weapons.morning.sounds.hit_gen = "morning_hit_gen"
	self.melee_weapons.morning.sounds.hit_body = "morning_hit_body"
	self.melee_weapons.morning.sounds.charge = "morning_charge"
	self.melee_weapons.morning.stats = {}
	self.melee_weapons.morning.stats.weapon_type = "sharp"
	self.melee_weapons.morning.stats.min_damage = 2
	self.melee_weapons.morning.stats.max_damage = 4
	self.melee_weapons.morning.stats.min_damage_effect = 10
	self.melee_weapons.morning.stats.max_damage_effect = 10
	self.melee_weapons.morning.stats.charge_time = 3
	self.melee_weapons.morning.stats.range = 225
	self.melee_weapons.morning.stats.concealment = 26
	self.melee_weapons.morning.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.morning.repeat_expire_t = 0.5
	self.melee_weapons.morning.expire_t = 1.1
	self.melee_weapons.morning.melee_damage_delay = 0.1
	self.melee_weapons.cutters = {}
	self.melee_weapons.cutters.name_id = "bm_melee_boltcutter"
	self.melee_weapons.cutters.animation = nil
	self.melee_weapons.cutters.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.cutters.anim_global_param = "melee_cutters"
	self.melee_weapons.cutters.texture_bundle_folder = "nails"
	self.melee_weapons.cutters.free = nil
	self.melee_weapons.cutters.type = "axe"
	self.melee_weapons.cutters.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.cutters.unit = "units/pd2_dlc_nails/weapons/wpn_fps_mel_cutters/wpn_fps_mel_cutters"
	self.melee_weapons.cutters.third_unit = "units/pd2_dlc_nails/weapons/wpn_fps_mel_cutters/wpn_third_mel_cutters"
	self.melee_weapons.cutters.sounds = {}
	self.melee_weapons.cutters.sounds.equip = "mining_pick_equip"
	self.melee_weapons.cutters.sounds.hit_air = "mining_pick_hit_air"
	self.melee_weapons.cutters.sounds.hit_gen = "cutters_hit_gen"
	self.melee_weapons.cutters.sounds.hit_body = "cutters_hit_body"
	self.melee_weapons.cutters.sounds.charge = "mining_pick_charge"
	self.melee_weapons.cutters.stats = {}
	self.melee_weapons.cutters.stats.weapon_type = "blunt"
	self.melee_weapons.cutters.stats.min_damage = 3
	self.melee_weapons.cutters.stats.max_damage = 9
	self.melee_weapons.cutters.stats.min_damage_effect = 5
	self.melee_weapons.cutters.stats.max_damage_effect = 3
	self.melee_weapons.cutters.stats.charge_time = 3
	self.melee_weapons.cutters.stats.range = 275
	self.melee_weapons.cutters.stats.concealment = 27
	self.melee_weapons.cutters.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.cutters.repeat_expire_t = 0.8
	self.melee_weapons.cutters.expire_t = 1.2
	self.melee_weapons.cutters.melee_damage_delay = 0.3
	self.melee_weapons.boxcutter = {}
	self.melee_weapons.boxcutter.name_id = "bm_melee_boxcutter"
	self.melee_weapons.boxcutter.animation = nil
	self.melee_weapons.boxcutter.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.boxcutter.anim_global_param = "melee_boxcutter"
	self.melee_weapons.boxcutter.texture_bundle_folder = "rip"
	self.melee_weapons.boxcutter.dlc = "rvd"
	self.melee_weapons.boxcutter.free = nil
	self.melee_weapons.boxcutter.type = "knife"
	self.melee_weapons.boxcutter.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.boxcutter.unit = "units/pd2_dlc_rip/weapons/wpn_fps_mel_boxcutter/wpn_fps_mel_boxcutter"
	self.melee_weapons.boxcutter.third_unit = "units/pd2_dlc_rip/weapons/wpn_fps_mel_boxcutter/wpn_third_mel_boxcutter"
	self.melee_weapons.boxcutter.sounds = {}
	self.melee_weapons.boxcutter.sounds.equip = "boxcutter_equip"
	self.melee_weapons.boxcutter.sounds.hit_air = "boxcutter_hit_air"
	self.melee_weapons.boxcutter.sounds.hit_gen = "boxcutter_hit_gen"
	self.melee_weapons.boxcutter.sounds.hit_body = "boxcutter_hit_body"
	self.melee_weapons.boxcutter.sounds.charge = "boxcutter_charge"
	self.melee_weapons.boxcutter.stats = {}
	self.melee_weapons.boxcutter.stats.weapon_type = "sharp"
	self.melee_weapons.boxcutter.stats.min_damage = 3
	self.melee_weapons.boxcutter.stats.max_damage = 8
	self.melee_weapons.boxcutter.stats.min_damage_effect = 1
	self.melee_weapons.boxcutter.stats.max_damage_effect = 1
	self.melee_weapons.boxcutter.stats.charge_time = 2
	self.melee_weapons.boxcutter.stats.range = 185
	self.melee_weapons.boxcutter.stats.concealment = 30
	self.melee_weapons.boxcutter.repeat_expire_t = 0.8
	self.melee_weapons.boxcutter.expire_t = 0.5
	self.melee_weapons.boxcutter.melee_damage_delay = 0.16
	self.melee_weapons.selfie = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.selfie.name_id = "bm_melee_selfie"
	self.melee_weapons.selfie.unit = "units/pd2_dlc_berry/weapons/wpn_fps_mel_selfie/wpn_fps_mel_selfie"
	self.melee_weapons.selfie.third_unit = "units/pd2_dlc_berry/weapons/wpn_fps_mel_selfie/wpn_third_mel_selfie"
	self.melee_weapons.selfie.stats.weapon_type = "blunt"
	self.melee_weapons.selfie.dlc = "berry"
	self.melee_weapons.selfie.texture_bundle_folder = "berry"
	self.melee_weapons.selfie.sounds = {}
	self.melee_weapons.selfie.sounds.equip = "selfie_equip"
	self.melee_weapons.selfie.sounds.hit_air = "baton_hit_air"
	self.melee_weapons.selfie.sounds.hit_gen = "selfie_hit_gen"
	self.melee_weapons.selfie.sounds.hit_body = "selfie_hit_body"
	self.melee_weapons.selfie.sounds.charge = "baton_charge"
	self.melee_weapons.selfie.stats.min_damage = 3
	self.melee_weapons.selfie.stats.max_damage = 9
	self.melee_weapons.selfie.stats.min_damage_effect = 5
	self.melee_weapons.selfie.stats.max_damage_effect = 3
	self.melee_weapons.selfie.stats.charge_time = 3
	self.melee_weapons.selfie.stats.range = 250
	self.melee_weapons.selfie.stats.concealment = 30
	self.melee_weapons.selfie.expire_t = 0.6
	self.melee_weapons.iceaxe = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.iceaxe.name_id = "bm_melee_topaz"
	self.melee_weapons.iceaxe.unit = "units/pd2_dlc_berry/weapons/rp_wpn_fps_mel_topaz2000/wpn_fps_mel_topaz2000"
	self.melee_weapons.iceaxe.third_unit = "units/pd2_dlc_berry/weapons/rp_wpn_third_mel_topaz2000/wpn_third_mel_topaz2000"
	self.melee_weapons.iceaxe.stats.weapon_type = "sharp"
	self.melee_weapons.iceaxe.dlc = "berry"
	self.melee_weapons.iceaxe.texture_bundle_folder = "berry"
	self.melee_weapons.iceaxe.sounds = {}
	self.melee_weapons.iceaxe.sounds.equip = "mining_pick_equip"
	self.melee_weapons.iceaxe.sounds.hit_air = "mining_pick_hit_air"
	self.melee_weapons.iceaxe.sounds.hit_gen = "mining_pick_hit_gen"
	self.melee_weapons.iceaxe.sounds.hit_body = "mining_pick_hit_body"
	self.melee_weapons.iceaxe.sounds.charge = "mining_pick_charge"
	self.melee_weapons.iceaxe.stats.min_damage = 7
	self.melee_weapons.iceaxe.stats.max_damage = 45
	self.melee_weapons.iceaxe.stats.min_damage_effect = 1
	self.melee_weapons.iceaxe.stats.max_damage_effect = 1
	self.melee_weapons.iceaxe.stats.charge_time = 4
	self.melee_weapons.iceaxe.stats.range = 250
	self.melee_weapons.iceaxe.stats.concealment = 30
	self.melee_weapons.iceaxe.expire_t = 0.6
	self.melee_weapons.gator = deep_clone(self.melee_weapons.machete)
	self.melee_weapons.gator.name_id = "bm_melee_gator"
	self.melee_weapons.gator.unit = "units/pd2_dlc_berry/weapons/wpn_fps_mel_gator/wpn_fps_mel_gator"
	self.melee_weapons.gator.third_unit = "units/pd2_dlc_berry/weapons/wpn_third_mel_gator/wpn_third_mel_gator"
	self.melee_weapons.gator.dlc = "berry"
	self.melee_weapons.gator.texture_bundle_folder = "berry"
	self.melee_weapons.gator.sounds = {}
	self.melee_weapons.gator.sounds.equip = "machete_equip"
	self.melee_weapons.gator.sounds.hit_air = "machete_hit_air"
	self.melee_weapons.gator.sounds.hit_gen = "machete_hit_gen"
	self.melee_weapons.gator.sounds.hit_body = "machete_hit_body"
	self.melee_weapons.gator.sounds.charge = "machete_charge"
	self.melee_weapons.gator.stats.min_damage = 3
	self.melee_weapons.gator.stats.max_damage = 8
	self.melee_weapons.gator.stats.min_damage_effect = 1
	self.melee_weapons.gator.stats.max_damage_effect = 1
	self.melee_weapons.gator.stats.charge_time = 2
	self.melee_weapons.gator.stats.range = 225
	self.melee_weapons.gator.expire_t = 0.6
	self.melee_weapons.gator.repeat_expire_t = 0.8
	self.melee_weapons.gator.stats.concealment = 29
	self.melee_weapons.pugio = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.pugio.name_id = "bm_melee_pugio"
	self.melee_weapons.pugio.anim_global_param = "melee_stab"
	self.melee_weapons.pugio.dlc = "berry"
	self.melee_weapons.pugio.texture_bundle_folder = "berry"
	self.melee_weapons.pugio.type = "knife"
	self.melee_weapons.pugio.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.pugio.unit = "units/pd2_dlc_berry/weapons/wpn_fps_mel_pugio/wpn_fps_mel_pugio"
	self.melee_weapons.pugio.third_unit = "units/pd2_dlc_berry/weapons/wpn_fps_mel_pugio/wpn_third_mel_pugio"
	self.melee_weapons.pugio.sounds = {}
	self.melee_weapons.pugio.sounds.equip = "cqc_equip"
	self.melee_weapons.pugio.sounds.hit_air = "cqc_hit_air"
	self.melee_weapons.pugio.sounds.hit_gen = "cqc_hit_gen"
	self.melee_weapons.pugio.sounds.hit_body = "cqc_hit_body"
	self.melee_weapons.pugio.sounds.charge = "cqc_charge"
	self.melee_weapons.pugio.stats.min_damage = 3
	self.melee_weapons.pugio.stats.max_damage = 8
	self.melee_weapons.pugio.stats.min_damage_effect = 1
	self.melee_weapons.pugio.stats.max_damage_effect = 1
	self.melee_weapons.pugio.stats.charge_time = 2
	self.melee_weapons.pugio.stats.range = 175
	self.melee_weapons.pugio.stats.concealment = 29
	self.melee_weapons.pugio.repeat_expire_t = 0.3
	self.melee_weapons.pugio.expire_t = 1
	self.melee_weapons.pugio.melee_damage_delay = 0.1
	self.melee_weapons.shawn = {}
	self.melee_weapons.shawn.name_id = "bm_melee_shawn"
	self.melee_weapons.shawn.animation = nil
	self.melee_weapons.shawn.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.shawn.anim_global_param = "melee_psycho"
	self.melee_weapons.shawn.dlc = "peta"
	self.melee_weapons.shawn.texture_bundle_folder = "peta"
	self.melee_weapons.shawn.type = "knife"
	self.melee_weapons.shawn.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.shawn.unit = "units/pd2_dlc_peta/weapons/wpn_fps_mel_shawn/wpn_fps_mel_shawn"
	self.melee_weapons.shawn.third_unit = "units/pd2_dlc_peta/weapons/wpn_fps_mel_shawn/wpn_third_mel_shawn"
	self.melee_weapons.shawn.sounds = {}
	self.melee_weapons.shawn.sounds.equip = "scis_equip"
	self.melee_weapons.shawn.sounds.hit_air = "scis_hit_air"
	self.melee_weapons.shawn.sounds.hit_gen = "scis_hit_gen"
	self.melee_weapons.shawn.sounds.hit_body = "scis_hit_body"
	self.melee_weapons.shawn.sounds.charge = "scis_charge"
	self.melee_weapons.shawn.stats = {}
	self.melee_weapons.shawn.stats.weapon_type = "sharp"
	self.melee_weapons.shawn.stats.min_damage = 3
	self.melee_weapons.shawn.stats.max_damage = 8
	self.melee_weapons.shawn.stats.min_damage_effect = 1
	self.melee_weapons.shawn.stats.max_damage_effect = 1
	self.melee_weapons.shawn.stats.charge_time = 2
	self.melee_weapons.shawn.stats.range = 150
	self.melee_weapons.shawn.stats.concealment = 29
	self.melee_weapons.shawn.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.shawn.repeat_expire_t = 0.36
	self.melee_weapons.shawn.expire_t = 1.8
	self.melee_weapons.stick = {}
	self.melee_weapons.stick.name_id = "bm_melee_stick"
	self.melee_weapons.stick.animation = nil
	self.melee_weapons.stick.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.stick.anim_global_param = "melee_baseballbat"
	self.melee_weapons.stick.dlc = "peta"
	self.melee_weapons.stick.texture_bundle_folder = "peta"
	self.melee_weapons.stick.type = "blunt"
	self.melee_weapons.stick.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.stick.unit = "units/pd2_dlc_peta/weapons/wpn_fps_mel_stick/wpn_fps_mel_stick"
	self.melee_weapons.stick.third_unit = "units/pd2_dlc_peta/weapons/wpn_fps_mel_stick/wpn_third_mel_stick"
	self.melee_weapons.stick.sounds = {}
	self.melee_weapons.stick.sounds.equip = "stick_equip"
	self.melee_weapons.stick.sounds.hit_air = "stick_hit_air"
	self.melee_weapons.stick.sounds.hit_gen = "stick_hit_gen"
	self.melee_weapons.stick.sounds.hit_body = "stick_hit_body"
	self.melee_weapons.stick.sounds.charge = "stick_charge"
	self.melee_weapons.stick.stats = {}
	self.melee_weapons.stick.stats.weapon_type = "blunt"
	self.melee_weapons.stick.stats.min_damage = 3
	self.melee_weapons.stick.stats.max_damage = 9
	self.melee_weapons.stick.stats.min_damage_effect = 5
	self.melee_weapons.stick.stats.max_damage_effect = 3
	self.melee_weapons.stick.stats.charge_time = 3
	self.melee_weapons.stick.stats.range = 225
	self.melee_weapons.stick.stats.concealment = 27
	self.melee_weapons.stick.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.stick.repeat_expire_t = 0.8
	self.melee_weapons.stick.expire_t = 1.8
	self.melee_weapons.stick.melee_damage_delay = 0.2
	self.melee_weapons.pitchfork = {}
	self.melee_weapons.pitchfork.name_id = "bm_melee_pitchfork"
	self.melee_weapons.pitchfork.animation = nil
	self.melee_weapons.pitchfork.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.pitchfork.anim_global_param = "melee_pitchfork"
	self.melee_weapons.pitchfork.dlc = "peta"
	self.melee_weapons.pitchfork.texture_bundle_folder = "peta"
	self.melee_weapons.pitchfork.type = "flag"
	self.melee_weapons.pitchfork.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.pitchfork.unit = "units/pd2_dlc_peta/weapons/wpn_fps_mel_fork/wpn_fps_mel_pitchfork"
	self.melee_weapons.pitchfork.third_unit = "units/pd2_dlc_peta/weapons/wpn_fps_mel_fork/wpn_third_mel_pitchfork"
	self.melee_weapons.pitchfork.sounds = {}
	self.melee_weapons.pitchfork.sounds.equip = "pitchfork_equip"
	self.melee_weapons.pitchfork.sounds.hit_air = "pitchfork_hit_air"
	self.melee_weapons.pitchfork.sounds.hit_gen = "pitchfork_hit_gen"
	self.melee_weapons.pitchfork.sounds.hit_body = "pitchfork_hit_body"
	self.melee_weapons.pitchfork.sounds.charge = "pitchfork_charge"
	self.melee_weapons.pitchfork.stats = {}
	self.melee_weapons.pitchfork.stats.weapon_type = "sharp"
	self.melee_weapons.pitchfork.stats.min_damage = 7
	self.melee_weapons.pitchfork.stats.max_damage = 45
	self.melee_weapons.pitchfork.stats.min_damage_effect = 1
	self.melee_weapons.pitchfork.stats.max_damage_effect = 1
	self.melee_weapons.pitchfork.stats.charge_time = 4
	self.melee_weapons.pitchfork.stats.range = 225
	self.melee_weapons.pitchfork.stats.concealment = 27
	self.melee_weapons.pitchfork.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.pitchfork.repeat_expire_t = 0.8
	self.melee_weapons.pitchfork.expire_t = 1.8
	self.melee_weapons.pitchfork.melee_damage_delay = 0.3
	self.melee_weapons.scoutknife = {}
	self.melee_weapons.scoutknife.name_id = "bm_melee_scoutknife"
	self.melee_weapons.scoutknife.animation = nil
	self.melee_weapons.scoutknife.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.scoutknife.anim_global_param = "melee_knife"
	self.melee_weapons.scoutknife.dlc = "peta"
	self.melee_weapons.scoutknife.texture_bundle_folder = "peta"
	self.melee_weapons.scoutknife.type = "knife"
	self.melee_weapons.scoutknife.align_objects = {
		"a_weapon_left"
	}
	self.melee_weapons.scoutknife.unit = "units/pd2_dlc_peta/weapons/wpn_fps_mel_scoutknife/wpn_fps_mel_scoutknife"
	self.melee_weapons.scoutknife.third_unit = "units/pd2_dlc_peta/weapons/wpn_third_mel_scoutknife/wpn_third_mel_scoutknife"
	self.melee_weapons.scoutknife.sounds = {}
	self.melee_weapons.scoutknife.sounds.equip = "knife_equip"
	self.melee_weapons.scoutknife.sounds.hit_air = "knife_hit_air"
	self.melee_weapons.scoutknife.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.scoutknife.sounds.hit_body = "knife_hit_body"
	self.melee_weapons.scoutknife.sounds.charge = "knife_charge"
	self.melee_weapons.scoutknife.stats = {}
	self.melee_weapons.scoutknife.stats.weapon_type = "sharp"
	self.melee_weapons.scoutknife.stats.min_damage = 3
	self.melee_weapons.scoutknife.stats.max_damage = 8
	self.melee_weapons.scoutknife.stats.min_damage_effect = 1
	self.melee_weapons.scoutknife.stats.max_damage_effect = 1
	self.melee_weapons.scoutknife.stats.charge_time = 2
	self.melee_weapons.scoutknife.stats.range = 150
	self.melee_weapons.scoutknife.stats.concealment = 29
	self.melee_weapons.scoutknife.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.scoutknife.repeat_expire_t = 0.36
	self.melee_weapons.scoutknife.expire_t = 1.2
	self.melee_weapons.nin = {}
	self.melee_weapons.nin.name_id = "bm_melee_nin"
	self.melee_weapons.nin.animation = nil
	self.melee_weapons.nin.hit_pre_calculation = true
	self.melee_weapons.nin.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.nin.anim_global_param = "melee_nin"
	self.melee_weapons.nin.dlc = "pal"
	self.melee_weapons.nin.texture_bundle_folder = "lupus"
	self.melee_weapons.nin.type = "knife"
	self.melee_weapons.nin.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.nin.unit = "units/pd2_dlc_lupus/weapons/wpn_fps_mel_nin/wpn_fps_mel_nin"
	self.melee_weapons.nin.third_unit = "units/pd2_dlc_lupus/weapons/wpn_fps_mel_nin/wpn_third_mel_nin"
	self.melee_weapons.nin.sounds = {}
	self.melee_weapons.nin.sounds.equip = "nin_equip"
	self.melee_weapons.nin.sounds.hit_air = "nin_hit_air"
	self.melee_weapons.nin.sounds.hit_gen = "nin_hit_gen"
	self.melee_weapons.nin.sounds.hit_body = "nin_hit_body"
	self.melee_weapons.nin.sounds.charge = "nin_charge"
	self.melee_weapons.nin.stats = {}
	self.melee_weapons.nin.stats.weapon_type = "sharp"
	self.melee_weapons.nin.stats.min_damage = 7
	self.melee_weapons.nin.stats.max_damage = 45
	self.melee_weapons.nin.stats.min_damage_effect = 1
	self.melee_weapons.nin.stats.max_damage_effect = 1
	self.melee_weapons.nin.stats.charge_time = 4
	self.melee_weapons.nin.stats.range = 185
	self.melee_weapons.nin.stats.concealment = 27
	self.melee_weapons.nin.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.nin.repeat_expire_t = 0.65
	self.melee_weapons.nin.expire_t = 1.2
	self.melee_weapons.nin.melee_damage_delay = 0.1
	self.melee_weapons.ballistic = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.ballistic.name_id = "bm_melee_ballistic"
	self.melee_weapons.ballistic.dlc = "coco"
	self.melee_weapons.ballistic.texture_bundle_folder = "coco"
	self.melee_weapons.ballistic.free = nil
	self.melee_weapons.ballistic.anim_global_param = "melee_ballistic"
	self.melee_weapons.ballistic.type = "knife"
	self.melee_weapons.ballistic.align_objects = {
		"a_weapon_right",
		"a_weapon_left"
	}
	self.melee_weapons.ballistic.unit = "units/pd2_dlc_coco/weapons/wpn_fps_mel_ballistic/wpn_fps_mel_ballistic"
	self.melee_weapons.ballistic.third_unit = "units/pd2_dlc_coco/weapons/wpn_fps_mel_ballistic/wpn_third_mel_ballistic"
	self.melee_weapons.ballistic.stats.weapon_type = "sharp"
	self.melee_weapons.ballistic.stats.min_damage = 3
	self.melee_weapons.ballistic.stats.max_damage = 8
	self.melee_weapons.ballistic.stats.min_damage_effect = 1
	self.melee_weapons.ballistic.stats.max_damage_effect = 1
	self.melee_weapons.ballistic.stats.charge_time = 2
	self.melee_weapons.ballistic.stats.range = 200
	self.melee_weapons.ballistic.sounds = {}
	self.melee_weapons.ballistic.sounds.equip = "twin_equip"
	self.melee_weapons.ballistic.sounds.hit_air = "twin_hit_air"
	self.melee_weapons.ballistic.sounds.hit_gen = "twin_hit_gen"
	self.melee_weapons.ballistic.sounds.hit_body = "twin_hit_body"
	self.melee_weapons.ballistic.sounds.charge = "twin_charge"
	self.melee_weapons.ballistic.repeat_expire_t = 0.6
	self.melee_weapons.ballistic.stats.concealment = 29
	self.melee_weapons.zeus = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.zeus.name_id = "bm_melee_zeus"
	self.melee_weapons.zeus.info_id = "bm_melee_zeus_info"
	self.melee_weapons.zeus.type = "fists"
	self.melee_weapons.zeus.tase_data = {
		tase_strength = "light"
	}
	self.melee_weapons.zeus.texture_bundle_folder = "mad"
	self.melee_weapons.zeus.dlc = "mad"
	self.melee_weapons.zeus.free = nil
	self.melee_weapons.zeus.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.zeus.unit = "units/pd2_dlc_mad/weapons/wpn_fps_mel_zeus/wpn_fps_mel_zeus"
	self.melee_weapons.zeus.third_unit = "units/pd2_dlc_mad/weapons/wpn_fps_mel_zeus/wpn_third_mel_zeus"
	self.melee_weapons.zeus.stats.min_damage = 2
	self.melee_weapons.zeus.stats.max_damage = 2
	self.melee_weapons.zeus.stats.min_damage_effect = 1
	self.melee_weapons.zeus.stats.max_damage_effect = 1
	self.melee_weapons.zeus.stats.charge_time = 2
	self.melee_weapons.zeus.stats.range = 200
	self.melee_weapons.zeus.sounds.equip = "zeus_equip"
	self.melee_weapons.zeus.sounds.hit_air = "zeus_hit_air"
	self.melee_weapons.zeus.sounds.hit_gen = "zeus_hit_gen"
	self.melee_weapons.zeus.sounds.hit_body = "zeus_hit_body"
	self.melee_weapons.zeus.sounds.charge = "zeus_charge"
	self.melee_weapons.zeus.stats.concealment = 30
	self.melee_weapons.wing = {}
	self.melee_weapons.wing.name_id = "bm_melee_wing"
	self.melee_weapons.wing.animation = nil
	self.melee_weapons.wing.hit_pre_calculation = true
	self.melee_weapons.wing.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.wing.anim_global_param = "melee_wing"
	self.melee_weapons.wing.dlc = "opera"
	self.melee_weapons.wing.texture_bundle_folder = "opera"
	self.melee_weapons.wing.type = "knife"
	self.melee_weapons.wing.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.wing.unit = "units/pd2_dlc_opera/weapons/wpn_fps_mel_wing/wpn_fps_mel_wing"
	self.melee_weapons.wing.third_unit = "units/pd2_dlc_opera/weapons/wpn_fps_mel_wing/wpn_third_mel_wing"
	self.melee_weapons.wing.sounds = {}
	self.melee_weapons.wing.sounds.equip = "wing_equip"
	self.melee_weapons.wing.sounds.hit_air = {
		"wing_hit_air",
		"wing_hit_air",
		"wing_hit_air",
		"wing_hit_air"
	}
	self.melee_weapons.wing.sounds.hit_gen = {
		"wing_hit_gen",
		"wing_hit_gen",
		"wing_hit_gen",
		"wing_hit_gen"
	}
	self.melee_weapons.wing.sounds.hit_body = {
		"wing_hit_body",
		"wing_hit_body",
		"wing_hit_body",
		"wing_hit_body"
	}
	self.melee_weapons.wing.sounds.charge = "wing_charge"
	self.melee_weapons.wing.melee_charge_shaker = "player_melee_charge_wing"
	self.melee_weapons.wing.stats = {}
	self.melee_weapons.wing.stats.weapon_type = "sharp"
	self.melee_weapons.wing.stats.min_damage = 3
	self.melee_weapons.wing.stats.max_damage = 8
	self.melee_weapons.wing.stats.min_damage_effect = 1
	self.melee_weapons.wing.stats.max_damage_effect = 1
	self.melee_weapons.wing.stats.charge_time = 2
	self.melee_weapons.wing.stats.range = 185
	self.melee_weapons.wing.stats.concealment = 30
	self.melee_weapons.wing.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.wing.repeat_expire_t = 0.85
	self.melee_weapons.wing.expire_t = 1.2
	self.melee_weapons.wing.melee_damage_delay = 0.1
	self.melee_weapons.wing.anims = {
		var1_attack = {
			anim = "var1"
		},
		var2_attack = {
			anim = "var2"
		},
		var3_attack = {
			anim = "var3"
		},
		var4_attack = {
			anim = "var4"
		},
		charge = {
			anim = "charge",
			loop = true
		}
	}
	self.melee_weapons.wing.anims.var1_attack_hit = self.melee_weapons.wing.anims.var1_attack
	self.melee_weapons.wing.anims.var2_attack_hit = self.melee_weapons.wing.anims.var2_attack
	self.melee_weapons.wing.anims.var3_attack_hit = self.melee_weapons.wing.anims.var3_attack
	self.melee_weapons.wing.anims.var4_attack_hit = self.melee_weapons.wing.anims.var4_attack
	self.melee_weapons.road = {}
	self.melee_weapons.road.name_id = "bm_melee_road"
	self.melee_weapons.road.animation = nil
	self.melee_weapons.road.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.road.anim_global_param = "melee_road"
	self.melee_weapons.road.dlc = "wild"
	self.melee_weapons.road.texture_bundle_folder = "wild"
	self.melee_weapons.road.type = "axe"
	self.melee_weapons.road.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.road.unit = "units/pd2_dlc_wild/weapons/wpn_fps_mel_road/wpn_fps_mel_road"
	self.melee_weapons.road.third_unit = "units/pd2_dlc_wild/weapons/wpn_fps_mel_road/wpn_third_mel_road"
	self.melee_weapons.road.sounds = {}
	self.melee_weapons.road.sounds.equip = "road_equip"
	self.melee_weapons.road.sounds.hit_air = "road_hit_air"
	self.melee_weapons.road.sounds.hit_gen = "road_hit_gen"
	self.melee_weapons.road.sounds.hit_body = "road_hit_body"
	self.melee_weapons.road.sounds.charge = "road_charge"
	self.melee_weapons.road.stats = {}
	self.melee_weapons.road.stats.weapon_type = "blunt"
	self.melee_weapons.road.stats.min_damage = 7
	self.melee_weapons.road.stats.max_damage = 45
	self.melee_weapons.road.stats.min_damage_effect = 1
	self.melee_weapons.road.stats.max_damage_effect = 1
	self.melee_weapons.road.stats.charge_time = 4
	self.melee_weapons.road.stats.range = 185
	self.melee_weapons.road.stats.concealment = 29
	self.melee_weapons.road.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.road.repeat_expire_t = 2
	self.melee_weapons.road.expire_t = 1.2
	self.melee_weapons.road.melee_damage_delay = 0.4
	self.melee_weapons.road.anims = {
		var1_attack = {
			anim = "var1"
		},
		var2_attack = {
			anim = "var2"
		},
		var3_attack = {
			anim = "var1"
		},
		var4_attack = {
			anim = "var2"
		},
		charge = {
			anim = "charge",
			loop = true
		}
	}
	self.melee_weapons.cs = {}
	self.melee_weapons.cs.name_id = "bm_melee_cs"
	self.melee_weapons.cs.animation = nil
	self.melee_weapons.cs.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.cs.anim_global_param = "melee_cs"
	self.melee_weapons.cs.dlc = "chico"
	self.melee_weapons.cs.texture_bundle_folder = "chico"
	self.melee_weapons.cs.type = "blunt"
	self.melee_weapons.cs.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.cs.unit = "units/pd2_dlc_chico/weapons/wpn_fps_mel_cs/wpn_fps_mel_cs"
	self.melee_weapons.cs.third_unit = "units/pd2_dlc_chico/weapons/wpn_fps_mel_cs/wpn_third_mel_cs"
	self.melee_weapons.cs.sounds = {}
	self.melee_weapons.cs.sounds.equip = "cs_equip"
	self.melee_weapons.cs.sounds.hit_air = "cs_hit_air"
	self.melee_weapons.cs.sounds.hit_gen = "cs_hit_gen"
	self.melee_weapons.cs.sounds.hit_body = "cs_hit_body"
	self.melee_weapons.cs.sounds.charge = "cs_charge"
	self.melee_weapons.cs.stats = {}
	self.melee_weapons.cs.stats.weapon_type = "blunt"
	self.melee_weapons.cs.stats.min_damage = 7
	self.melee_weapons.cs.stats.max_damage = 45
	self.melee_weapons.cs.stats.min_damage_effect = 1
	self.melee_weapons.cs.stats.max_damage_effect = 1
	self.melee_weapons.cs.stats.charge_time = 4
	self.melee_weapons.cs.stats.range = 185
	self.melee_weapons.cs.stats.concealment = 25
	self.melee_weapons.cs.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.cs.repeat_expire_t = 2
	self.melee_weapons.cs.expire_t = 1.2
	self.melee_weapons.cs.melee_damage_delay = 0.35
	self.melee_weapons.brick = {}
	self.melee_weapons.brick.name_id = "bm_melee_brick"
	self.melee_weapons.brick.animation = nil
	self.melee_weapons.brick.anim_attack_vars = {
		"var1",
		"var2",
		"var1",
		"var2"
	}
	self.melee_weapons.brick.anim_global_param = "melee_brick"
	self.melee_weapons.brick.dlc = "friend"
	self.melee_weapons.brick.texture_bundle_folder = "friend"
	self.melee_weapons.brick.type = "blunt"
	self.melee_weapons.brick.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.brick.unit = "units/pd2_dlc_friend/weapons/wpn_fps_mel_brick/wpn_fps_mel_brick"
	self.melee_weapons.brick.third_unit = "units/pd2_dlc_friend/weapons/wpn_fps_mel_brick/wpn_third_mel_brick"
	self.melee_weapons.brick.sounds = {}
	self.melee_weapons.brick.sounds.equip = "brick_equip"
	self.melee_weapons.brick.sounds.hit_air = "brick_hit_air"
	self.melee_weapons.brick.sounds.hit_gen = "brick_hit_gen"
	self.melee_weapons.brick.sounds.hit_body = "brick_hit_body"
	self.melee_weapons.brick.sounds.charge = "brick_charge"
	self.melee_weapons.brick.stats = {}
	self.melee_weapons.brick.stats.weapon_type = "blunt"
	self.melee_weapons.brick.stats.min_damage = 3
	self.melee_weapons.brick.stats.max_damage = 8
	self.melee_weapons.brick.stats.min_damage_effect = 1
	self.melee_weapons.brick.stats.max_damage_effect = 1
	self.melee_weapons.brick.stats.charge_time = 2
	self.melee_weapons.brick.stats.range = 185
	self.melee_weapons.brick.stats.concealment = 30
	self.melee_weapons.brick.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.brick.repeat_expire_t = 2
	self.melee_weapons.brick.expire_t = 1.2
	self.melee_weapons.brick.melee_damage_delay = 0.06
	self.melee_weapons.ostry = {}
	self.melee_weapons.ostry.name_id = "bm_melee_ostry"
	self.melee_weapons.ostry.animation = nil
	self.melee_weapons.ostry.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var2"
	}
	self.melee_weapons.ostry.anim_global_param = "melee_ostry"
	self.melee_weapons.ostry.free = true
	self.melee_weapons.ostry.dlc = "sha"
	self.melee_weapons.ostry.texture_bundle_folder = "pd2_clan"
	self.melee_weapons.ostry.type = "knife"
	self.melee_weapons.ostry.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.ostry.unit = "units/pd2_dlc_sha/weapons/wpn_fps_mel_ostry/wpn_fps_mel_ostry"
	self.melee_weapons.ostry.third_unit = "units/pd2_dlc_sha/weapons/wpn_fps_mel_ostry/wpn_third_mel_ostry"
	self.melee_weapons.ostry.sounds = {}
	self.melee_weapons.ostry.sounds.equip = "ostry_equip"
	self.melee_weapons.ostry.sounds.hit_air = "ostry_hit_air"
	self.melee_weapons.ostry.sounds.hit_gen = "ostry_hit_gen"
	self.melee_weapons.ostry.sounds.hit_body = "ostry_hit_body"
	self.melee_weapons.ostry.sounds.charge = "ostry_charge"
	self.melee_weapons.ostry.stats = {}
	self.melee_weapons.ostry.stats.weapon_type = "sharp"
	self.melee_weapons.ostry.stats.min_damage = 3
	self.melee_weapons.ostry.stats.max_damage = 8
	self.melee_weapons.ostry.stats.min_damage_effect = 1
	self.melee_weapons.ostry.stats.max_damage_effect = 1
	self.melee_weapons.ostry.stats.charge_time = 2
	self.melee_weapons.ostry.stats.range = 200
	self.melee_weapons.ostry.stats.concealment = 28
	self.melee_weapons.ostry.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.ostry.repeat_expire_t = 0.4
	self.melee_weapons.ostry.expire_t = 0.6
	self.melee_weapons.ostry.melee_damage_delay = 0.11
	self.melee_weapons.ostry.menu_scene_anim = "menu"
	self.melee_weapons.ostry.menu_scene_params = {
		loop = false,
		start_time = -1
	}
	self.melee_weapons.catch = {}
	self.melee_weapons.catch.name_id = "bm_melee_catch"
	self.melee_weapons.catch.animation = nil
	self.melee_weapons.catch.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var2"
	}
	self.melee_weapons.catch.anim_global_param = "melee_catch"
	self.melee_weapons.catch.dlc = "spa"
	self.melee_weapons.catch.texture_bundle_folder = "spa"
	self.melee_weapons.catch.type = "knife"
	self.melee_weapons.catch.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.catch.unit = "units/pd2_dlc_spa/weapons/wpn_fps_mel_catch/wpn_fps_mel_catch"
	self.melee_weapons.catch.third_unit = "units/pd2_dlc_spa/weapons/wpn_fps_mel_catch/wpn_third_mel_catch"
	self.melee_weapons.catch.sounds = {}
	self.melee_weapons.catch.sounds.equip = "catch_equip"
	self.melee_weapons.catch.sounds.hit_air = "catch_hit_air"
	self.melee_weapons.catch.sounds.hit_gen = "catch_hit_gen"
	self.melee_weapons.catch.sounds.hit_body = "catch_hit_body"
	self.melee_weapons.catch.sounds.charge = "catch_charge"
	self.melee_weapons.catch.stats = {}
	self.melee_weapons.catch.stats.weapon_type = "sharp"
	self.melee_weapons.catch.stats.min_damage = 3
	self.melee_weapons.catch.stats.max_damage = 8
	self.melee_weapons.catch.stats.min_damage_effect = 1
	self.melee_weapons.catch.stats.max_damage_effect = 1
	self.melee_weapons.catch.stats.charge_time = 2
	self.melee_weapons.catch.stats.range = 200
	self.melee_weapons.catch.stats.concealment = 28
	self.melee_weapons.catch.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.catch.repeat_expire_t = 0.4
	self.melee_weapons.catch.expire_t = 0.6
	self.melee_weapons.catch.melee_damage_delay = 0.11
	self.melee_weapons.oxide = deep_clone(self.melee_weapons.machete)
	self.melee_weapons.oxide.name_id = "bm_melee_oxide"
	self.melee_weapons.oxide.unit = "units/pd2_dlc_grv/weapons/wpn_fps_mel_oxide/wpn_fps_mel_oxide"
	self.melee_weapons.oxide.third_unit = "units/pd2_dlc_grv/weapons/wpn_fps_mel_oxide/wpn_third_mel_oxide"
	self.melee_weapons.oxide.dlc = "grv"
	self.melee_weapons.oxide.texture_bundle_folder = "grv"
	self.melee_weapons.oxide.sounds = {}
	self.melee_weapons.oxide.sounds.equip = "oxide_equip"
	self.melee_weapons.oxide.sounds.hit_air = "oxide_hit_air"
	self.melee_weapons.oxide.sounds.hit_gen = "oxide_hit_gen"
	self.melee_weapons.oxide.sounds.hit_body = "oxide_hit_body"
	self.melee_weapons.oxide.sounds.charge = "machete_charge"
	self.melee_weapons.oxide.stats.min_damage = 7
	self.melee_weapons.oxide.stats.max_damage = 45
	self.melee_weapons.oxide.stats.min_damage_effect = 1
	self.melee_weapons.oxide.stats.max_damage_effect = 1
	self.melee_weapons.oxide.stats.charge_time = 4
	self.melee_weapons.oxide.stats.range = 225
	self.melee_weapons.oxide.expire_t = 0.6
	self.melee_weapons.oxide.repeat_expire_t = 0.8
	self.melee_weapons.oxide.stats.concealment = 29
	self.melee_weapons.sword = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.sword.name_id = "bm_melee_sword"
	self.melee_weapons.sword.dlc = "pn2"
	self.melee_weapons.sword.texture_bundle_folder = "pn2"
	self.melee_weapons.sword.anim_global_param = "melee_stab"
	self.melee_weapons.sword.type = "knife"
	self.melee_weapons.sword.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.sword.unit = "units/pd2_dlc_pn2/weapons/wpn_fps_mel_sword/wpn_fps_mel_sword"
	self.melee_weapons.sword.third_unit = "units/pd2_dlc_pn2/weapons/wpn_fps_mel_sword/wpn_third_mel_sword"
	self.melee_weapons.sword.stats.weapon_type = "sharp"
	self.melee_weapons.sword.stats.min_damage = 3
	self.melee_weapons.sword.stats.max_damage = 8
	self.melee_weapons.sword.stats.min_damage_effect = 1
	self.melee_weapons.sword.stats.max_damage_effect = 1
	self.melee_weapons.sword.stats.charge_time = 2
	self.melee_weapons.sword.stats.range = 150
	self.melee_weapons.sword.sounds = {}
	self.melee_weapons.sword.sounds.equip = "sword_equip"
	self.melee_weapons.sword.sounds.hit_air = "sword_hit_air"
	self.melee_weapons.sword.sounds.hit_gen = "sword_hit_gen"
	self.melee_weapons.sword.sounds.hit_body = "sword_hit_body"
	self.melee_weapons.sword.sounds.charge = "toothbrush_charge"
	self.melee_weapons.sword.repeat_expire_t = 0.3
	self.melee_weapons.sword.stats.concealment = 30
	self.melee_weapons.agave = deep_clone(self.melee_weapons.machete)
	self.melee_weapons.agave.animation = nil
	self.melee_weapons.agave.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.agave.anim_global_param = "melee_agave"
	self.melee_weapons.agave.name_id = "bm_melee_agave"
	self.melee_weapons.agave.type = "knife"
	self.melee_weapons.agave.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.agave.unit = "units/pd2_dlc_max/weapons/wpn_fps_mel_agave/wpn_fps_mel_agave"
	self.melee_weapons.agave.third_unit = "units/pd2_dlc_max/weapons/wpn_fps_mel_agave/wpn_third_mel_agave"
	self.melee_weapons.agave.dlc = nil
	self.melee_weapons.agave.texture_bundle_folder = "max"
	self.melee_weapons.agave.sounds = {}
	self.melee_weapons.agave.sounds.equip = "agave_equip"
	self.melee_weapons.agave.sounds.hit_air = "agave_hit_air"
	self.melee_weapons.agave.sounds.hit_gen = "agave_hit_gen"
	self.melee_weapons.agave.sounds.hit_body = "agave_hit_body"
	self.melee_weapons.agave.sounds.charge = "knife_charge"
	self.melee_weapons.agave.stats.min_damage = 7
	self.melee_weapons.agave.stats.max_damage = 45
	self.melee_weapons.agave.stats.min_damage_effect = 1
	self.melee_weapons.agave.stats.max_damage_effect = 1
	self.melee_weapons.agave.melee_damage_delay = 0.1
	self.melee_weapons.agave.stats.charge_time = 4
	self.melee_weapons.agave.stats.range = 225
	self.melee_weapons.agave.expire_t = 0.6
	self.melee_weapons.agave.repeat_expire_t = 0.8
	self.melee_weapons.agave.stats.concealment = 29
	self.melee_weapons.happy = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.happy.name_id = "bm_melee_happy"
	self.melee_weapons.happy.type = "blunt"
	self.melee_weapons.happy.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.happy.unit = "units/pd2_dlc_joy/weapons/wpn_fps_mel_happy/wpn_fps_mel_happy"
	self.melee_weapons.happy.third_unit = "units/pd2_dlc_joy/weapons/wpn_fps_mel_happy/wpn_third_mel_happy"
	self.melee_weapons.happy.animation = nil
	self.melee_weapons.happy.anim_global_param = "melee_happy"
	self.melee_weapons.happy.dlc = "joy"
	self.melee_weapons.happy.texture_bundle_folder = "joy"
	self.melee_weapons.happy.stats = {}
	self.melee_weapons.happy.stats.min_damage = 3
	self.melee_weapons.happy.stats.max_damage = 9
	self.melee_weapons.happy.stats.min_damage_effect = 5
	self.melee_weapons.happy.stats.max_damage_effect = 3
	self.melee_weapons.happy.stats.charge_time = 3
	self.melee_weapons.happy.stats.range = 250
	self.melee_weapons.happy.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.happy.stats.weapon_type = "blunt"
	self.melee_weapons.happy.anim_attack_vars = {
		"var1"
	}
	self.melee_weapons.happy.repeat_expire_t = 0.6
	self.melee_weapons.happy.expire_t = 0.7
	self.melee_weapons.happy.melee_damage_delay = 0.1
	self.melee_weapons.happy.sounds = {}
	self.melee_weapons.happy.sounds.equip = "baton_equip_02"
	self.melee_weapons.happy.sounds.hit_air = "baton_hit_air"
	self.melee_weapons.happy.sounds.hit_gen = "baton_hit_gen"
	self.melee_weapons.happy.sounds.hit_body = "baton_hit_body"
	self.melee_weapons.happy.sounds.charge = "baton_charge"
	self.melee_weapons.happy.stats.concealment = 30
	self.melee_weapons.happy.anims = {
		var1_attack = {
			anim = "var1"
		},
		charge = {
			anim = "charge"
		}
	}
	self.melee_weapons.push = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.push.name_id = "bm_melee_push"
	self.melee_weapons.push.free = nil
	self.melee_weapons.push.type = "fists"
	self.melee_weapons.push.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.push.unit = "units/pd2_dlc_old/weapons/wpn_fps_mel_push/wpn_fps_mel_push"
	self.melee_weapons.push.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_mel_push/wpn_third_mel_push"
	self.melee_weapons.push.stats.min_damage = 3
	self.melee_weapons.push.stats.max_damage = 8
	self.melee_weapons.push.stats.min_damage_effect = 1
	self.melee_weapons.push.stats.max_damage_effect = 1
	self.melee_weapons.push.stats.charge_time = 2
	self.melee_weapons.push.stats.range = 150
	self.melee_weapons.push.sounds.equip = "bbq_fork_equip"
	self.melee_weapons.push.sounds.hit_air = "bbq_fork_hit_air"
	self.melee_weapons.push.sounds.hit_gen = "bbq_fork_hit_gen"
	self.melee_weapons.push.sounds.hit_body = "bbq_fork_hit_body"
	self.melee_weapons.push.sounds.charge = "bbq_fork_charge"
	self.melee_weapons.push.stats.concealment = 30
	self.melee_weapons.push.texture_bundle_folder = "old"
	self.melee_weapons.push.graphic_objects = {
		a_weapon_left = "g_push_left",
		a_weapon_right = "g_push"
	}
	self.melee_weapons.push.menu_scene_anim = "menu"
	self.melee_weapons.push.menu_scene_params = {
		loop = false,
		start_time = -1
	}
	self.melee_weapons.push.locks = {
		func = "has_unlocked_push"
	}
	self.melee_weapons.grip = deep_clone(self.melee_weapons.fists)
	self.melee_weapons.grip.name_id = "bm_melee_grip"
	self.melee_weapons.grip.free = nil
	self.melee_weapons.grip.type = "fists"
	self.melee_weapons.grip.anim_global_param = "melee_grip"
	self.melee_weapons.grip.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.grip.repeat_expire_t = 0.6
	self.melee_weapons.grip.expire_t = 0.7
	self.melee_weapons.grip.melee_damage_delay = 0.1
	self.melee_weapons.grip.align_objects = {
		"a_weapon_left",
		"a_weapon_right"
	}
	self.melee_weapons.grip.unit = "units/pd2_dlc_old/weapons/wpn_fps_mel_grip/wpn_fps_mel_grip"
	self.melee_weapons.grip.third_unit = "units/pd2_dlc_old/weapons/wpn_fps_mel_grip/wpn_third_mel_grip"
	self.melee_weapons.grip.stats.min_damage = 3
	self.melee_weapons.grip.stats.max_damage = 8
	self.melee_weapons.grip.stats.min_damage_effect = 1
	self.melee_weapons.grip.stats.max_damage_effect = 1
	self.melee_weapons.grip.stats.charge_time = 2
	self.melee_weapons.grip.stats.range = 150
	self.melee_weapons.grip.sounds.equip = "knife_equip"
	self.melee_weapons.grip.sounds.hit_air = "knife_hit_air"
	self.melee_weapons.grip.sounds.hit_gen = "knife_hit_gen"
	self.melee_weapons.grip.sounds.hit_body = "knife_hit_body"
	self.melee_weapons.grip.sounds.charge = "knife_charge"
	self.melee_weapons.grip.stats.concealment = 30
	self.melee_weapons.grip.dlc = "raidww2_clan"
	self.melee_weapons.grip.locks = {
		dlc = "raidww2_clan"
	}
	self.melee_weapons.grip.texture_bundle_folder = "old"
	self.melee_weapons.grip.graphic_objects = {
		a_weapon_left = "g_grip_left",
		a_weapon_right = "g_grip"
	}
	self.melee_weapons.grip.menu_scene_anim = "menu"
	self.melee_weapons.grip.menu_scene_params = {
		loop = false,
		start_time = -1
	}
	self.melee_weapons.sap = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.sap.name_id = "bm_melee_sap"
	self.melee_weapons.sap.unit = "units/pd2_dlc_myh/weapons/wpn_fps_mel_sap/wpn_fps_mel_sap"
	self.melee_weapons.sap.third_unit = "units/pd2_dlc_myh/weapons/wpn_fps_mel_sap/wpn_third_mel_sap"
	self.melee_weapons.sap.stats.weapon_type = "blunt"
	self.melee_weapons.sap.stats.min_damage = 2
	self.melee_weapons.sap.stats.max_damage = 4
	self.melee_weapons.sap.stats.min_damage_effect = 10
	self.melee_weapons.sap.stats.max_damage_effect = 10
	self.melee_weapons.sap.stats.charge_time = 3
	self.melee_weapons.sap.stats.range = 200
	self.melee_weapons.sap.stats.weapon_type = "blunt"
	self.melee_weapons.sap.sounds = {}
	self.melee_weapons.sap.sounds.equip = "sap_equip"
	self.melee_weapons.sap.sounds.hit_air = "sap_hit_air"
	self.melee_weapons.sap.sounds.hit_gen = "sap_hit_gen"
	self.melee_weapons.sap.sounds.hit_body = "sap_hit_body"
	self.melee_weapons.sap.sounds.charge = "sap_charge"
	self.melee_weapons.sap.stats.concealment = 30
	self.melee_weapons.sap.dlc = nil
	self.melee_weapons.sap.texture_bundle_folder = "myh"
	self.melee_weapons.clean = {}
	self.melee_weapons.clean.name_id = "bm_melee_clean"
	self.melee_weapons.clean.animation = nil
	self.melee_weapons.clean.anim_attack_vars = {
		"var1",
		"var2"
	}
	self.melee_weapons.clean.anim_global_param = "melee_clean"
	self.melee_weapons.clean.dlc = "rvd"
	self.melee_weapons.clean.texture_bundle_folder = "rvd"
	self.melee_weapons.clean.type = "knife"
	self.melee_weapons.clean.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.clean.unit = "units/pd2_dlc_rvd/weapons/wpn_fps_mel_clean/wpn_fps_mel_clean"
	self.melee_weapons.clean.third_unit = "units/pd2_dlc_rvd/weapons/wpn_fps_mel_clean/wpn_third_mel_clean"
	self.melee_weapons.clean.sounds = {}
	self.melee_weapons.clean.sounds.equip = "clean_equip"
	self.melee_weapons.clean.sounds.hit_air = "clean_hit_air"
	self.melee_weapons.clean.sounds.hit_gen = "clean_hit_gen"
	self.melee_weapons.clean.sounds.hit_body = "clean_hit_body"
	self.melee_weapons.clean.sounds.charge = "clean_charge"
	self.melee_weapons.clean.stats = {}
	self.melee_weapons.clean.stats.weapon_type = "sharp"
	self.melee_weapons.clean.stats.min_damage = 3
	self.melee_weapons.clean.stats.max_damage = 8
	self.melee_weapons.clean.stats.min_damage_effect = 1
	self.melee_weapons.clean.stats.max_damage_effect = 1
	self.melee_weapons.clean.stats.charge_time = 2
	self.melee_weapons.clean.stats.range = 150
	self.melee_weapons.clean.stats.concealment = 29
	self.melee_weapons.clean.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.clean.repeat_expire_t = 0.36
	self.melee_weapons.clean.expire_t = 0.6
	self.melee_weapons.clean.melee_charge_shaker = "player_melee_charge_wing"
	self.melee_weapons.clean.menu_scene_anim = "menu"
	self.melee_weapons.clean.menu_scene_params = {
		loop = false,
		start_time = -1
	}
	self.melee_weapons.clean.anims = {
		var1_attack = {
			anim = "var1"
		},
		var2_attack = {
			anim = "var1"
		},
		charge = {
			anim = "charge",
			loop = false
		}
	}
	self.melee_weapons.meter = {}
	self.melee_weapons.meter.name_id = "bm_melee_meter"
	self.melee_weapons.meter.animation = nil
	self.melee_weapons.meter.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.meter.anim_global_param = "melee_great"
	self.melee_weapons.meter.dlc = "ecp"
	self.melee_weapons.meter.texture_bundle_folder = "ecp"
	self.melee_weapons.meter.type = "sword"
	self.melee_weapons.meter.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.meter.unit = "units/pd2_dlc_ecp/weapons/wpn_fps_mel_meter/wpn_fps_mel_meter"
	self.melee_weapons.meter.third_unit = "units/pd2_dlc_ecp/weapons/wpn_fps_mel_meter/wpn_third_mel_meter"
	self.melee_weapons.meter.sounds = {}
	self.melee_weapons.meter.sounds.equip = "meter_equip"
	self.melee_weapons.meter.sounds.hit_air = "meter_hit_air"
	self.melee_weapons.meter.sounds.hit_gen = "meter_hit_gen"
	self.melee_weapons.meter.sounds.hit_body = "meter_hit_body"
	self.melee_weapons.meter.sounds.charge = "meter_charge"
	self.melee_weapons.meter.stats = {}
	self.melee_weapons.meter.stats.weapon_type = "sharp"
	self.melee_weapons.meter.stats.min_damage = 7
	self.melee_weapons.meter.stats.max_damage = 45
	self.melee_weapons.meter.stats.min_damage_effect = 1
	self.melee_weapons.meter.stats.max_damage_effect = 1
	self.melee_weapons.meter.stats.charge_time = 4
	self.melee_weapons.meter.stats.range = 275
	self.melee_weapons.meter.stats.concealment = 27
	self.melee_weapons.meter.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.meter.repeat_expire_t = 1.1
	self.melee_weapons.meter.expire_t = 1.5
	self.melee_weapons.meter.melee_damage_delay = 0.6
	self.melee_weapons.aziz = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.aziz.name_id = "bm_melee_aziz"
	self.melee_weapons.aziz.dlc = "flm"
	self.melee_weapons.aziz.texture_bundle_folder = "flm"
	self.melee_weapons.aziz.anim_global_param = "melee_psycho"
	self.melee_weapons.aziz.type = "blunt"
	self.melee_weapons.aziz.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.aziz.unit = "units/pd2_dlc_flm/weapons/wpn_fps_mel_aziz/wpn_fps_mel_aziz"
	self.melee_weapons.aziz.third_unit = "units/pd2_dlc_flm/weapons/wpn_fps_mel_aziz/wpn_third_mel_aziz"
	self.melee_weapons.aziz.stats.weapon_type = "blunt"
	self.melee_weapons.aziz.stats.min_damage = 3
	self.melee_weapons.aziz.stats.max_damage = 8
	self.melee_weapons.aziz.stats.min_damage_effect = 1
	self.melee_weapons.aziz.stats.max_damage_effect = 1
	self.melee_weapons.aziz.stats.charge_time = 2
	self.melee_weapons.aziz.stats.range = 150
	self.melee_weapons.aziz.melee_charge_shaker = "player_melee_charge_wing"
	self.melee_weapons.aziz.sounds = {}
	self.melee_weapons.aziz.sounds.equip = "aziz_equip"
	self.melee_weapons.aziz.sounds.hit_air = "aziz_hit_air"
	self.melee_weapons.aziz.sounds.hit_gen = "aziz_hit_gen"
	self.melee_weapons.aziz.sounds.hit_body = "aziz_hit_body"
	self.melee_weapons.aziz.sounds.charge = "aziz_charge"
	self.melee_weapons.aziz.repeat_expire_t = 0.36
	self.melee_weapons.aziz.stats.concealment = 29
	self.melee_weapons.hauteur = {}
	self.melee_weapons.hauteur.name_id = "bm_melee_hauteur"
	self.melee_weapons.hauteur.animation = nil
	self.melee_weapons.hauteur.anim_attack_vars = {
		"var1"
	}
	self.melee_weapons.hauteur.anim_global_param = "melee_hauteur"
	self.melee_weapons.hauteur.texture_bundle_folder = "ktm"
	self.melee_weapons.hauteur.type = "knife"
	self.melee_weapons.hauteur.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.hauteur.unit = "units/pd2_dlc_ktm/weapons/wpn_fps_mel_hauteur/wpn_fps_mel_hauteur"
	self.melee_weapons.hauteur.third_unit = "units/pd2_dlc_ktm/weapons/wpn_fps_mel_hauteur/wpn_third_mel_hauteur"
	self.melee_weapons.hauteur.sounds = {}
	self.melee_weapons.hauteur.sounds.equip = "hauteur_equip"
	self.melee_weapons.hauteur.sounds.hit_air = "hauteur_hit_air"
	self.melee_weapons.hauteur.sounds.hit_gen = "hauteur_hit_gen"
	self.melee_weapons.hauteur.sounds.hit_body = "hauteur_hit_body"
	self.melee_weapons.hauteur.sounds.charge = "hauteur_charge"
	self.melee_weapons.hauteur.melee_charge_shaker = "player_melee_charge_wing"
	self.melee_weapons.hauteur.stats = {}
	self.melee_weapons.hauteur.stats.weapon_type = "sharp"
	self.melee_weapons.hauteur.stats.min_damage = 7
	self.melee_weapons.hauteur.stats.max_damage = 45
	self.melee_weapons.hauteur.stats.min_damage_effect = 1
	self.melee_weapons.hauteur.stats.max_damage_effect = 1
	self.melee_weapons.hauteur.stats.charge_time = 3.5
	self.melee_weapons.hauteur.stats.range = 150
	self.melee_weapons.hauteur.stats.concealment = 30
	self.melee_weapons.hauteur.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.hauteur.repeat_expire_t = 0.6
	self.melee_weapons.hauteur.expire_t = 1.1
	self.melee_weapons.hauteur.melee_damage_delay = 0.13
	self.melee_weapons.hauteur.menu_scene_anim = "menu"
	self.melee_weapons.hauteur.anims = {
		var1_attack = {
			anim = "var1"
		}
	}
	self.melee_weapons.shock = deep_clone(self.melee_weapons.kabar)
	self.melee_weapons.shock.name_id = "bm_melee_shock"
	self.melee_weapons.shock.dlc = nil
	self.melee_weapons.shock.locks = {
		achievement = "sah_11",
		achievement_lock_id = "bm_menu_locked_shock"
	}
	self.melee_weapons.shock.texture_bundle_folder = "apa"
	self.melee_weapons.shock.anim_global_param = "melee_axe"
	self.melee_weapons.shock.type = "blunt"
	self.melee_weapons.shock.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.shock.unit = "units/pd2_dlc_apa/weapons/wpn_fps_mel_shock/wpn_fps_mel_shock"
	self.melee_weapons.shock.third_unit = "units/pd2_dlc_apa/weapons/wpn_fps_mel_shock/wpn_third_mel_shock"
	self.melee_weapons.shock.stats.weapon_type = "blunt"
	self.melee_weapons.shock.stats.min_damage = 3
	self.melee_weapons.shock.stats.max_damage = 9
	self.melee_weapons.shock.stats.min_damage_effect = 5
	self.melee_weapons.shock.stats.max_damage_effect = 3
	self.melee_weapons.shock.stats.charge_time = 3
	self.melee_weapons.shock.stats.range = 185
	self.melee_weapons.shock.sounds = {}
	self.melee_weapons.shock.sounds.equip = "shock_equip"
	self.melee_weapons.shock.sounds.hit_air = "shock_hit_air"
	self.melee_weapons.shock.sounds.hit_gen = "shock_hit_gen"
	self.melee_weapons.shock.sounds.hit_body = "shock_hit_body"
	self.melee_weapons.shock.sounds.charge = "shock_charge"
	self.melee_weapons.shock.repeat_expire_t = 0.8
	self.melee_weapons.shock.stats.concealment = 28
	self.melee_weapons.fear = {}
	self.melee_weapons.fear.name_id = "bm_melee_fear"
	self.melee_weapons.fear.info_id = "bm_melee_fear_info"
	self.melee_weapons.fear.hit_pre_calculation = true
	self.melee_weapons.fear.anim_attack_vars = {
		"var1",
		"var2"
	}
	self.melee_weapons.fear.anim_global_param = "melee_fear"
	self.melee_weapons.fear.dlc = nil
	self.melee_weapons.fear.texture_bundle_folder = "ssm"
	self.melee_weapons.fear.type = "knife"
	self.melee_weapons.fear.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.fear.unit = "units/pd2_dlc_ssm/weapons/wpn_fps_mel_fear/wpn_fps_mel_fear"
	self.melee_weapons.fear.third_unit = "units/pd2_dlc_ssm/weapons/wpn_fps_mel_fear/wpn_third_mel_fear"
	self.melee_weapons.fear.sounds = {}
	self.melee_weapons.fear.sounds.equip = "cqc_equip"
	self.melee_weapons.fear.sounds.hit_air = "cqc_hit_air"
	self.melee_weapons.fear.sounds.hit_gen = "cqc_hit_gen"
	self.melee_weapons.fear.sounds.hit_body = "cqc_hit_body"
	self.melee_weapons.fear.sounds.charge = "cqc_charge"
	self.melee_weapons.fear.melee_charge_shaker = "player_melee_charge_wing"
	self.melee_weapons.fear.dot_data_name = "melee_fear"
	self.melee_weapons.fear.stats = {}
	self.melee_weapons.fear.stats.weapon_type = "sharp"
	self.melee_weapons.fear.stats.min_damage = 3
	self.melee_weapons.fear.stats.max_damage = 8
	self.melee_weapons.fear.stats.min_damage_effect = 1
	self.melee_weapons.fear.stats.max_damage_effect = 1
	self.melee_weapons.fear.stats.charge_time = 1.5
	self.melee_weapons.fear.stats.range = 150
	self.melee_weapons.fear.stats.concealment = 30
	self.melee_weapons.fear.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.fear.repeat_expire_t = 0.65
	self.melee_weapons.fear.expire_t = 1.2
	self.melee_weapons.fear.melee_damage_delay = 0.29
	self.melee_weapons.fear.anims = {
		var1_attack = {
			anim = "var1"
		},
		var2_attack = {
			anim = "var2"
		},
		charge = {
			anim = "charge",
			loop = false
		}
	}
	self.melee_weapons.fear.anims.var1_attack_hit = self.melee_weapons.fear.anims.var1_attack
	self.melee_weapons.fear.anims.var2_attack_hit = self.melee_weapons.fear.anims.var2_attack
	self.melee_weapons.chac = deep_clone(self.melee_weapons.tomahawk)
	self.melee_weapons.chac.name_id = "bm_melee_chac"
	self.melee_weapons.chac.info_id = "bm_melee_chac_info"
	self.melee_weapons.chac.type = "blunt"
	self.melee_weapons.chac.unit = "units/pd2_dlc_bex/weapons/wpn_fps_mel_chac/wpn_fps_mel_chac"
	self.melee_weapons.chac.third_unit = "units/pd2_dlc_bex/weapons/wpn_fps_mel_chac/wpn_third_mel_chac"
	self.melee_weapons.chac.stats.weapon_type = "blunt"
	self.melee_weapons.chac.anim_global_param = "melee_chac"
	self.melee_weapons.chac.anim_attack_vars = {
		"var1",
		"var2",
		"var3",
		"var4"
	}
	self.melee_weapons.chac.melee_charge_shaker = "player_melee_charge_wing"
	self.melee_weapons.chac.animation = nil
	self.melee_weapons.chac.dlc = "bex"
	self.melee_weapons.chac.hit_pre_calculation = true
	self.melee_weapons.chac.align_objects = {
		"a_weapon_right"
	}
	self.melee_weapons.chac.texture_bundle_folder = "bex"
	self.melee_weapons.chac.stats = {}
	self.melee_weapons.chac.stats.remove_weapon_movement_penalty = true
	self.melee_weapons.chac.stats.min_damage = 3
	self.melee_weapons.chac.stats.max_damage = 5.5
	self.melee_weapons.chac.stats.min_damage_effect = 3
	self.melee_weapons.chac.stats.max_damage_effect = 2
	self.melee_weapons.chac.stats.charge_time = 2
	self.melee_weapons.chac.stats.range = 150
	self.melee_weapons.chac.stats.weapon_type = "blunt"
	self.melee_weapons.chac.repeat_expire_t = 0.5
	self.melee_weapons.chac.expire_t = 1.2
	self.melee_weapons.chac.melee_damage_delay = 0.1
	self.melee_weapons.chac.sounds = {}
	self.melee_weapons.chac.sounds.equip = "chac_equip"
	self.melee_weapons.chac.sounds.hit_air = "chac_hit_air"
	self.melee_weapons.chac.sounds.hit_gen = "chac_hit_gen"
	self.melee_weapons.chac.sounds.hit_body = "chac_hit_body"
	self.melee_weapons.chac.sounds.charge = "chac_charge"
	self.melee_weapons.chac.stats.concealment = 30
	self.melee_weapons.chac.anims = {
		var1_attack = {
			anim = "var1"
		},
		var2_attack = {
			anim = "var2"
		},
		var3_attack = {
			anim = "var3"
		},
		var4_attack = {
			anim = "var4"
		},
		charge = {
			anim = "charge",
			loop = true
		}
	}

	local funder_strike_stats = {
		charge_time = 3.5,
		concealment = 30,
		max_damage = 2,
		max_damage_effect = 1,
		min_damage = 2,
		min_damage_effect = 1,
		range = 200,
		remove_weapon_movement_penalty = true,
		weapon_type = "blunt"
	}
	local funder_strike_sounds = {
		charge = "buzzer_charge",
		equip = "buzzer_detector_equip",
		hit_air = "buzzer_detector_hit_air",
		hit_body = "buzzer_detector_hit_body",
		hit_gen = "buzzer_detector_hit_gen"
	}
	local anim_start_no_loop = {
		anim = "menu",
		loop = false,
		start_time = 0.2
	}
	local anim_attack_snap_end = {
		anim = "menu",
		from = 1
	}

	self.melee_weapons.funder_strike = {
		anim_global_param = "melee_axe",
		expire_t = 0.7,
		info_id = "bm_melee_funder_strike_info",
		melee_damage_delay = 0.13333333333333333,
		menu_scene_anim = "menu",
		name_id = "bm_melee_funder_strike",
		repeat_expire_t = 0.7,
		texture_bundle_folder = "fun",
		third_unit = "units/pd2_dlc_fun/weapons/wpn_tps_mel_funder_strike/wpn_tps_mel_funder_strike",
		type = "blunt",
		unit = "units/pd2_dlc_fun/weapons/wpn_fps_mel_funder_strike/wpn_fps_mel_funder_strike",
		sounds = funder_strike_sounds,
		stats = funder_strike_stats,
		tase_data = {
			tase_strength = "light"
		},
		anim_attack_vars = {
			"var1",
			"var2",
			"var3",
			"var4"
		},
		anims = {
			charge = anim_start_no_loop,
			var1_attack = anim_attack_snap_end,
			var2_attack = anim_attack_snap_end,
			var3_attack = anim_attack_snap_end,
			var4_attack = anim_attack_snap_end
		},
		align_objects = {
			"a_weapon_right"
		},
		menu_scene_params = anim_attack_snap_end
	}
	self.melee_weapons.bonk = {
		anim_global_param = "melee_baseballbat",
		dlc = "unk",
		expire_t = 1,
		info_id = "bm_melee_bonk_info",
		melee_damage_delay = 0.2,
		name_id = "bm_melee_bonk",
		repeat_expire_t = 0.7,
		texture_bundle_folder = "unk",
		third_unit = "units/pd2_dlc_unk/weapons/wpn_fps_mel_bonk/wpn_tps_mel_bonk",
		type = "blunt",
		unit = "units/pd2_dlc_unk/weapons/wpn_fps_mel_bonk/wpn_fps_mel_bonk",
		stats = {
			charge_time = 3,
			concealment = 28,
			max_damage = 40,
			max_damage_effect = 1.125,
			min_damage = 7,
			min_damage_effect = 2.142,
			range = 175,
			remove_weapon_movement_penalty = true,
			weapon_type = "blunt"
		},
		sounds = {
			charge = "bonk_charge",
			equip = "bonk_equip",
			hit_air = "bonk_hit_air",
			hit_body = "bonk_hit_body",
			hit_gen = "bonk_hit_gen"
		},
		anim_attack_vars = {
			"var1",
			"var2",
			"var3",
			"var4"
		},
		align_objects = {
			"a_weapon_right"
		}
	}
	self.melee_weapons.bonk2 = deep_clone(self.melee_weapons.bonk)
	self.melee_weapons.bonk2.name_id = "bm_melee_bonk2"
	self.melee_weapons.bonk2.info_id = "bm_melee_bonk2_info"
	self.melee_weapons.bonk2.unit = "units/pd2_dlc_unk/weapons/wpn_fps_mel_bonk2/wpn_fps_mel_bonk2"
	self.melee_weapons.bonk2.third_unit = "units/pd2_dlc_unk/weapons/wpn_fps_mel_bonk2/wpn_tps_mel_bonk2"

	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.melee_weapons) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end

	self:_add_desc_from_name_macro(self.melee_weapons)
end
