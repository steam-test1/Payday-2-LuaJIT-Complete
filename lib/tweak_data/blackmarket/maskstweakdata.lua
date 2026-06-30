local is_nextgen_console = IS_PS4 or IS_XB1
local allow_halloween_lootdrop = is_nextgen_console

allow_halloween_lootdrop = true

function BlackMarketTweakData:_init_masks(tweak_data)
	self.masks = {}
	self.masks.character_locked = {}
	self.masks.character_locked.name_id = "bm_msk_character_locked"
	self.masks.character_locked.inaccessible = true
	self.masks.character_locked.dallas = "dallas"
	self.masks.character_locked.wolf = "wolf"
	self.masks.character_locked.hoxton = "hoxton"
	self.masks.character_locked.chains = "chains"
	self.masks.character_locked.jowi = "jw_shades"
	self.masks.character_locked.old_hoxton = "old_hoxton"
	self.masks.character_locked.female_1 = "msk_grizel"
	self.masks.character_locked.dragan = "dragan"
	self.masks.character_locked.jacket = "richard_returns"
	self.masks.character_locked.bonnie = "bonnie"
	self.masks.character_locked.sokol = "sokol"
	self.masks.character_locked.dragon = "jiro"
	self.masks.character_locked.bodhi = "bodhi"
	self.masks.character_locked.jimmy = "jimmy_duct"
	self.masks.character_locked.sydney = "sydney"
	self.masks.character_locked.wild = "rust"
	self.masks.character_locked.chico = "chc_terry"
	self.masks.character_locked.max = "max"
	self.masks.character_locked.joy = "joy"
	self.masks.character_locked.myh = "myh"
	self.masks.character_locked.ecp_male = "ecp_male"
	self.masks.character_locked.ecp_female = "ecp_female"
	self.masks.skull = {}
	self.masks.skull.unit = "units/payday2/masks/msk_skull/msk_skull"
	self.masks.skull.name_id = "bm_msk_skull"
	self.masks.skull.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.skull.dlc = "preorder"
	self.masks.skull.value = 1
	self.masks.wolf_clean = {}
	self.masks.wolf_clean.unit = "units/payday2/masks/msk_wolf_clean/msk_wolf_clean"
	self.masks.wolf_clean.name_id = "bm_msk_wolf_clean"
	self.masks.wolf_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.wolf_clean.infamous = true
	self.masks.wolf_clean.value = 9
	self.masks.wolf_clean.qlvl = 0
	self.masks.hoxton_clean = {}
	self.masks.hoxton_clean.unit = "units/payday2/masks/msk_hoxton_clean/msk_hoxton_clean"
	self.masks.hoxton_clean.name_id = "bm_msk_hoxton_clean"
	self.masks.hoxton_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hoxton_clean.infamous = true
	self.masks.hoxton_clean.value = 9
	self.masks.hoxton_clean.qlvl = 0
	self.masks.dallas_clean = {}
	self.masks.dallas_clean.unit = "units/payday2/masks/msk_dallas_clean/msk_dallas_clean"
	self.masks.dallas_clean.name_id = "bm_msk_dallas_clean"
	self.masks.dallas_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dallas_clean.infamous = true
	self.masks.dallas_clean.value = 10
	self.masks.dallas_clean.qlvl = 0
	self.masks.dallas_clean.offsets = {
		jacket = {
			Vector3(0, 0, 0.554498),
			Rotation(0, 0, -0)
		},
		joy = {
			Vector3(0, 0, 0.554498),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.chains_clean = {}
	self.masks.chains_clean.unit = "units/payday2/masks/msk_chains_clean/msk_chains_clean"
	self.masks.chains_clean.name_id = "bm_msk_chains_clean"
	self.masks.chains_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.chains_clean.infamous = true
	self.masks.chains_clean.value = 9
	self.masks.chains_clean.qlvl = 0
	self.masks.dallas = {}
	self.masks.dallas.unit = "units/payday2/masks/msk_dallas/msk_dallas"
	self.masks.dallas.name_id = "bm_msk_dallas"
	self.masks.dallas.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dallas.infamous = true
	self.masks.dallas.value = 7
	self.masks.dallas.offsets = {
		jacket = {
			Vector3(0, 0, 0.554498),
			Rotation(0, 0, -0)
		},
		joy = {
			Vector3(0, 0, 0.554498),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.hoxton = {}
	self.masks.hoxton.unit = "units/payday2/masks/msk_hoxton/msk_hoxton"
	self.masks.hoxton.name_id = "bm_msk_hoxton"
	self.masks.hoxton.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hoxton.infamous = true
	self.masks.hoxton.value = 7
	self.masks.chains = {}
	self.masks.chains.unit = "units/payday2/masks/msk_chains/msk_chains"
	self.masks.chains.name_id = "bm_msk_chains"
	self.masks.chains.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.chains.infamous = true
	self.masks.chains.value = 7
	self.masks.old_hoxton = {}
	self.masks.old_hoxton.unit = "units/pd2_dlc_old_hoxton/masks/old_hoxton/msk_old_hoxton"
	self.masks.old_hoxton.name_id = "bm_msk_old_hoxton"
	self.masks.old_hoxton.pcs = {}
	self.masks.old_hoxton.value = 0
	self.masks.old_hoxton.global_value = "infamous"
	self.masks.wolf = {}
	self.masks.wolf.unit = "units/payday2/masks/msk_wolf/msk_wolf"
	self.masks.wolf.name_id = "bm_msk_wolf"
	self.masks.wolf.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.wolf.infamous = true
	self.masks.wolf.value = 7
	self.masks.dragan = {}
	self.masks.dragan.unit = "units/pd2_dlc_dragan/masks/dragan/msk_dragan"
	self.masks.dragan.name_id = "bm_msk_dragan"
	self.masks.dragan.pcs = {}
	self.masks.dragan.value = 0
	self.masks.dragan.texture_bundle_folder = "character_pack_dragan"
	self.masks.dragan.dlc = "character_pack_dragan"
	self.masks.dragan_begins = {}
	self.masks.dragan_begins.unit = "units/pd2_dlc_dragan/masks/dragan_begins/msk_dragan_begins"
	self.masks.dragan_begins.name_id = "bm_msk_dragan_begins"
	self.masks.dragan_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dragan_begins.value = 0
	self.masks.dragan_begins.texture_bundle_folder = "character_pack_dragan"
	self.masks.dragan_begins.dlc = "character_pack_dragan"
	self.masks.bonnie = {}
	self.masks.bonnie.unit = "units/pd2_dlc_bonnie/masks/bonnie/msk_bonnie"
	self.masks.bonnie.name_id = "bm_msk_bonnie"
	self.masks.bonnie.pcs = {}
	self.masks.bonnie.value = 0
	self.masks.bonnie.global_value = "infamous"
	self.masks.bonnie.texture_bundle_folder = "character_pack_bonnie"
	self.masks.bonnie_begins = {}
	self.masks.bonnie_begins.unit = "units/pd2_dlc_bonnie/masks/bonnie_begins/msk_bonnie_begins"
	self.masks.bonnie_begins.name_id = "bm_msk_bonnie_begins"
	self.masks.bonnie_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bonnie_begins.value = 0
	self.masks.bonnie_begins.global_value = "infamous"
	self.masks.bonnie_begins.texture_bundle_folder = "character_pack_bonnie"
	self.masks.cthulhu = {}
	self.masks.cthulhu.unit = "units/payday2/masks/msk_cthulhu/msk_cthulhu"
	self.masks.cthulhu.name_id = "bm_msk_cthulhu"
	self.masks.cthulhu.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.cthulhu.infamous = true
	self.masks.cthulhu.value = 8
	self.masks.cthulhu.qlvl = 0
	self.masks.grin = {}
	self.masks.grin.unit = "units/payday2/masks/msk_grin/msk_grin"
	self.masks.grin.name_id = "bm_msk_grin"
	self.masks.grin.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.grin.infamous = true
	self.masks.grin.value = 8
	self.masks.grin.qlvl = 0
	self.masks.anonymous = {}
	self.masks.anonymous.unit = "units/payday2/masks/msk_anonymous/msk_anonymous"
	self.masks.anonymous.name_id = "bm_msk_anonymous"
	self.masks.anonymous.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.anonymous.infamous = true
	self.masks.anonymous.value = 6
	self.masks.anonymous.qlvl = 0
	self.masks.dillinger_death_mask = {}
	self.masks.dillinger_death_mask.unit = "units/payday2/masks/msk_dillinger_death_mask/msk_dillinger_death_mask"
	self.masks.dillinger_death_mask.name_id = "bm_msk_dillinger_death_mask"
	self.masks.dillinger_death_mask.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dillinger_death_mask.infamous = true
	self.masks.dillinger_death_mask.value = 9
	self.masks.dillinger_death_mask.qlvl = 0
	self.masks.alienware = {}
	self.masks.alienware.unit = "units/payday2/masks/msk_alienware/msk_alienware"
	self.masks.alienware.name_id = "bm_msk_alienware"
	self.masks.alienware.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.alienware.value = 3
	self.masks.greek_tragedy = {}
	self.masks.greek_tragedy.unit = "units/payday2/masks/msk_greek_tragedy/msk_greek_tragedy"
	self.masks.greek_tragedy.name_id = "bm_msk_greek_tragedy"
	self.masks.greek_tragedy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.greek_tragedy.value = 7
	self.masks.greek_tragedy.qlvl = 0
	self.masks.jaw = {}
	self.masks.jaw.unit = "units/payday2/masks/msk_jaw/msk_jaw"
	self.masks.jaw.name_id = "bm_msk_jaw"
	self.masks.jaw.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.jaw.value = 4
	self.masks.hockey = {}
	self.masks.hockey.unit = "units/payday2/masks/msk_hockey_a/msk_hockey_a_mask"
	self.masks.hockey.name_id = "bm_msk_hockey"
	self.masks.hockey.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hockey.value = 5
	self.masks.troll = {}
	self.masks.troll.unit = "units/payday2/masks/msk_troll/msk_troll"
	self.masks.troll.name_id = "bm_msk_troll"
	self.masks.troll.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.troll.value = 3
	self.masks.troll.offsets = {
		joy = {
			Vector3(0, 0, 0.554498),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.gagball = {}
	self.masks.gagball.unit = "units/payday2/masks/msk_gagball/msk_gagball"
	self.masks.gagball.name_id = "bm_msk_gagball"
	self.masks.gagball.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gagball.value = 4
	self.masks.tounge = {}
	self.masks.tounge.unit = "units/payday2/masks/msk_tounge/msk_tounge"
	self.masks.tounge.name_id = "bm_msk_tounge"
	self.masks.tounge.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.tounge.value = 2
	self.masks.zipper = {}
	self.masks.zipper.unit = "units/payday2/masks/msk_zipper/msk_zipper"
	self.masks.zipper.name_id = "bm_msk_zipper"
	self.masks.zipper.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.zipper.value = 5
	self.masks.biglips = {}
	self.masks.biglips.unit = "units/payday2/masks/msk_biglips/msk_biglips"
	self.masks.biglips.name_id = "bm_msk_biglips"
	self.masks.biglips.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.biglips.value = 3
	self.masks.clowncry = {}
	self.masks.clowncry.unit = "units/payday2/masks/msk_clowncry/msk_clowncry"
	self.masks.clowncry.name_id = "bm_msk_clowncry"
	self.masks.clowncry.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.clowncry.value = 4
	self.masks.mr_sinister = {}
	self.masks.mr_sinister.unit = "units/payday2/masks/msk_mr_sinister/msk_mr_sinister"
	self.masks.mr_sinister.name_id = "bm_msk_mr_sinister"
	self.masks.mr_sinister.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.mr_sinister.value = 5
	self.masks.clown_56 = {}
	self.masks.clown_56.unit = "units/payday2/masks/msk_clown_56/msk_clown_56"
	self.masks.clown_56.name_id = "bm_msk_clown_56"
	self.masks.clown_56.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.clown_56.value = 3
	self.masks.dripper = {}
	self.masks.dripper.unit = "units/payday2/masks/msk_dripper/msk_dripper"
	self.masks.dripper.name_id = "bm_msk_dripper"
	self.masks.dripper.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dripper.value = 8
	self.masks.dripper.qlvl = 0
	self.masks.buha = {}
	self.masks.buha.unit = "units/payday2/masks/msk_buha/msk_buha"
	self.masks.buha.name_id = "bm_msk_buha"
	self.masks.buha.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.buha.value = 5
	self.masks.shogun = {}
	self.masks.shogun.unit = "units/payday2/masks/msk_shogun/msk_shogun"
	self.masks.shogun.name_id = "bm_msk_shogun"
	self.masks.shogun.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.shogun.value = 6
	self.masks.oni = {}
	self.masks.oni.unit = "units/payday2/masks/msk_oni/msk_oni"
	self.masks.oni.name_id = "bm_msk_oni"
	self.masks.oni.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.oni.value = 4
	self.masks.oni.offsets = {
		jacket = {
			Vector3(0, 0.673745, 0.316006),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.monkeybiss = {}
	self.masks.monkeybiss.unit = "units/payday2/masks/msk_monkeybiss/msk_monkeybiss"
	self.masks.monkeybiss.name_id = "bm_msk_monkeybiss"
	self.masks.monkeybiss.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.monkeybiss.value = 5
	self.masks.babyrhino = {}
	self.masks.babyrhino.unit = "units/payday2/masks/msk_babyrhino/msk_babyrhino"
	self.masks.babyrhino.name_id = "bm_msk_babyrhino"
	self.masks.babyrhino.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.babyrhino.value = 3
	self.masks.hog = {}
	self.masks.hog.unit = "units/payday2/masks/msk_hog/msk_hog"
	self.masks.hog.name_id = "bm_msk_hog"
	self.masks.hog.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.hog.value = 3
	self.masks.hog.qlvl = 0
	self.masks.outlandish_a = {}
	self.masks.outlandish_a.unit = "units/payday2/masks/msk_outlandish_a/msk_outlandish_a"
	self.masks.outlandish_a.name_id = "bm_msk_outlandish_a"
	self.masks.outlandish_a.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.outlandish_a.value = 2
	self.masks.outlandish_b = {}
	self.masks.outlandish_b.unit = "units/payday2/masks/msk_outlandish_b/msk_outlandish_b"
	self.masks.outlandish_b.name_id = "bm_msk_outlandish_b"
	self.masks.outlandish_b.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.outlandish_b.value = 3
	self.masks.outlandish_c = {}
	self.masks.outlandish_c.unit = "units/payday2/masks/msk_outlandish_c/msk_outlandish_c"
	self.masks.outlandish_c.name_id = "bm_msk_outlandish_c"
	self.masks.outlandish_c.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.outlandish_c.value = 4
	self.masks.bullet = {}
	self.masks.bullet.unit = "units/payday2/masks/msk_bullet/msk_bullet"
	self.masks.bullet.name_id = "bm_msk_bullet"
	self.masks.bullet.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bullet.value = 3
	self.masks.shrunken = {}
	self.masks.shrunken.unit = "units/payday2/masks/msk_shrunken/msk_shrunken"
	self.masks.shrunken.name_id = "bm_msk_shrunken"
	self.masks.shrunken.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.shrunken.value = 3
	self.masks.brainiack = {}
	self.masks.brainiack.unit = "units/payday2/masks/msk_brainiack/msk_brainiack"
	self.masks.brainiack.name_id = "bm_msk_brainiack"
	self.masks.brainiack.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.brainiack.value = 6
	self.masks.zombie = {}
	self.masks.zombie.unit = "units/payday2/masks/msk_zombie/msk_zombie"
	self.masks.zombie.name_id = "bm_msk_zombie"
	self.masks.zombie.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.zombie.value = 3
	self.masks.scarecrow = {}
	self.masks.scarecrow.unit = "units/payday2/masks/msk_scarecrow/msk_scarecrow"
	self.masks.scarecrow.name_id = "bm_msk_scarecrow"
	self.masks.scarecrow.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.scarecrow.value = 7
	self.masks.scarecrow.qlvl = 0
	self.masks.mummy = {}
	self.masks.mummy.unit = "units/payday2/masks/msk_mummy/msk_mummy"
	self.masks.mummy.name_id = "bm_msk_mummy"
	self.masks.mummy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.mummy.value = 3
	self.masks.vampire = {}
	self.masks.vampire.unit = "units/payday2/masks/msk_vampire/msk_vampire"
	self.masks.vampire.name_id = "bm_msk_vampire"
	self.masks.vampire.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.vampire.value = 2
	self.masks.day_of_the_dead = {}
	self.masks.day_of_the_dead.unit = "units/payday2/masks/msk_day_of_the_dead/msk_day_of_the_dead"
	self.masks.day_of_the_dead.name_id = "bm_msk_day_of_the_dead"
	self.masks.day_of_the_dead.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.day_of_the_dead.value = 3
	self.masks.day_of_the_dead.qlvl = 0
	self.masks.dawn_of_the_dead = {}
	self.masks.dawn_of_the_dead.unit = "units/payday2/masks/msk_dawn_of_the_dead/msk_dawn_of_the_dead"
	self.masks.dawn_of_the_dead.name_id = "bm_msk_dawn_of_the_dead"
	self.masks.dawn_of_the_dead.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.dawn_of_the_dead.value = 2
	self.masks.demon = {}
	self.masks.demon.unit = "units/payday2/masks/msk_demon/msk_demon"
	self.masks.demon.name_id = "bm_msk_demon"
	self.masks.demon.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.demon.value = 10
	self.masks.demon.qlvl = 0
	self.masks.stonekisses = {}
	self.masks.stonekisses.unit = "units/payday2/masks/msk_stonekisses/msk_stonekisses"
	self.masks.stonekisses.name_id = "bm_msk_stonekisses"
	self.masks.stonekisses.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.stonekisses.value = 4
	self.masks.demonictender = {}
	self.masks.demonictender.unit = "units/payday2/masks/msk_demonictender/msk_demonictender"
	self.masks.demonictender.name_id = "bm_msk_demonictender"
	self.masks.demonictender.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.demonictender.value = 3
	self.masks.kawaii = {}
	self.masks.kawaii.unit = "units/payday2/masks/msk_kawaii/msk_kawaii"
	self.masks.kawaii.name_id = "bm_msk_kawaii"
	self.masks.kawaii.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.kawaii.value = 3
	self.masks.irondoom = {}
	self.masks.irondoom.unit = "units/payday2/masks/msk_irondoom/msk_irondoom"
	self.masks.irondoom.name_id = "bm_msk_irondoom"
	self.masks.irondoom.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.irondoom.value = 3
	self.masks.rubber_male = {}
	self.masks.rubber_male.unit = "units/payday2/masks/msk_rubber_male/msk_rubber_male"
	self.masks.rubber_male.name_id = "bm_msk_rubber_male"
	self.masks.rubber_male.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rubber_male.value = 3
	self.masks.rubber_female = {}
	self.masks.rubber_female.unit = "units/payday2/masks/msk_rubber_female/msk_rubber_female"
	self.masks.rubber_female.name_id = "bm_msk_rubber_female"
	self.masks.rubber_female.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rubber_female.value = 3
	self.masks.pumpkin_king = {}
	self.masks.pumpkin_king.unit = "units/payday2/masks/msk_pumpkin_king/msk_pumpkin_king"
	self.masks.pumpkin_king.name_id = "bm_msk_pumpkin_king"

	if allow_halloween_lootdrop then
		self.masks.pumpkin_king.pcs = {
			10,
			20,
			30,
			40
		}
		self.masks.pumpkin_king.weight = 25
		self.masks.pumpkin_king.got_item_weight_mod = 0.02
	else
		self.masks.pumpkin_king.pcs = nil
		self.masks.pumpkin_king.weight = 1000
		self.masks.pumpkin_king.got_item_weight_mod = 0.001
	end

	self.masks.pumpkin_king.global_value = "halloween"
	self.masks.pumpkin_king.value = 0
	self.masks.pumpkin_king.qlvl = 0
	self.masks.pumpkin_king.sort_number = 1
	self.masks.witch = {}
	self.masks.witch.unit = "units/payday2/masks/msk_witch/msk_witch"
	self.masks.witch.name_id = "bm_msk_witch"

	if allow_halloween_lootdrop then
		self.masks.witch.pcs = {
			10,
			20,
			30,
			40
		}
		self.masks.witch.weight = 25
		self.masks.witch.got_item_weight_mod = 0.02
	else
		self.masks.witch.pcs = nil
		self.masks.witch.weight = 1000
		self.masks.witch.got_item_weight_mod = 0.001
	end

	self.masks.witch.global_value = "halloween"
	self.masks.witch.value = 0
	self.masks.witch.qlvl = 0
	self.masks.witch.sort_number = 1
	self.masks.venomorph = {}
	self.masks.venomorph.unit = "units/payday2/masks/msk_venomorph/msk_venomorph"
	self.masks.venomorph.name_id = "bm_msk_venomorph"

	if allow_halloween_lootdrop then
		self.masks.venomorph.pcs = {
			10,
			20,
			30,
			40
		}
		self.masks.venomorph.weight = 25
		self.masks.venomorph.got_item_weight_mod = 0.02
	else
		self.masks.venomorph.pcs = nil
		self.masks.venomorph.weight = 1000
		self.masks.venomorph.got_item_weight_mod = 0.001
	end

	self.masks.venomorph.global_value = "halloween"
	self.masks.venomorph.value = 0
	self.masks.venomorph.qlvl = 0
	self.masks.venomorph.sort_number = 1
	self.masks.frank = {}
	self.masks.frank.unit = "units/payday2/masks/msk_frank/msk_frank"
	self.masks.frank.name_id = "bm_msk_frank"

	if allow_halloween_lootdrop then
		self.masks.frank.pcs = {
			10,
			20,
			30,
			40
		}
		self.masks.frank.weight = 25
		self.masks.frank.got_item_weight_mod = 0.02
	else
		self.masks.frank.pcs = nil
		self.masks.frank.weight = 1000
		self.masks.frank.got_item_weight_mod = 0.001
	end

	self.masks.frank.global_value = "halloween"
	self.masks.frank.value = 0
	self.masks.frank.qlvl = 0
	self.masks.frank.sort_number = 1
	self.masks.brazil_baby = {}
	self.masks.brazil_baby.unit = "units/payday2/masks/msk_brazil_baby/msk_brazil_baby"
	self.masks.brazil_baby.name_id = "bm_msk_brazil_baby"
	self.masks.brazil_baby.global_value = "halloween"
	self.masks.brazil_baby.value = 0
	self.masks.brazil_baby.qlvl = 0
	self.masks.brazil_baby.sort_number = 2
	self.masks.baby_angry = {}
	self.masks.baby_angry.unit = "units/payday2/masks/msk_baby_angry/msk_baby_angry"
	self.masks.baby_angry.name_id = "bm_msk_baby_angry"
	self.masks.baby_angry.global_value = "halloween"
	self.masks.baby_angry.value = 0
	self.masks.baby_angry.qlvl = 0
	self.masks.baby_angry.sort_number = 2
	self.masks.baby_cry = {}
	self.masks.baby_cry.unit = "units/payday2/masks/msk_baby_cry/msk_baby_cry"
	self.masks.baby_cry.name_id = "bm_msk_baby_cry"
	self.masks.baby_cry.global_value = "halloween"
	self.masks.baby_cry.value = 0
	self.masks.baby_cry.qlvl = 0
	self.masks.baby_cry.sort_number = 2
	self.masks.baby_happy = {}
	self.masks.baby_happy.unit = "units/payday2/masks/msk_baby_happy/msk_baby_happy"
	self.masks.baby_happy.name_id = "bm_msk_baby_happy"
	self.masks.baby_happy.global_value = "halloween"
	self.masks.baby_happy.value = 0
	self.masks.baby_happy.qlvl = 0
	self.masks.baby_happy.sort_number = 2
	self.masks.the_one_below = {}
	self.masks.the_one_below.unit = "units/pd2_humble_halloween/masks/the_one_below/msk_the_one_below"
	self.masks.the_one_below.name_id = "bm_msk_onebelow"
	self.masks.the_one_below.pcs = {}
	self.masks.the_one_below.dlc = "humble_pack2"
	self.masks.the_one_below.value = 0
	self.masks.the_one_below.sort_number = 4
	self.masks.lycan = {}
	self.masks.lycan.unit = "units/pd2_humble_halloween/masks/lycan/msk_lycan"
	self.masks.lycan.name_id = "bm_msk_lycanwulf"
	self.masks.lycan.pcs = {}
	self.masks.lycan.dlc = "humble_pack2"
	self.masks.lycan.value = 0
	self.masks.lycan.sort_number = 4
	self.masks.krampus = {}
	self.masks.krampus.unit = "units/pd2_dlc_pines/masks/krampus/msk_krampus"
	self.masks.krampus.name_id = "bm_msk_krampus"
	self.masks.krampus.pcs = {}
	self.masks.krampus.value = 0
	self.masks.krampus.sort_number = 1
	self.masks.krampus.texture_bundle_folder = "pines"
	self.masks.mrs_claus = {}
	self.masks.mrs_claus.unit = "units/pd2_dlc_pines/masks/mrs_claus/msk_mrs_claus"
	self.masks.mrs_claus.name_id = "bm_msk_mrs_claus"
	self.masks.mrs_claus.pcs = {}
	self.masks.mrs_claus.value = 0
	self.masks.mrs_claus.sort_number = 1
	self.masks.mrs_claus.texture_bundle_folder = "pines"
	self.masks.strinch = {}
	self.masks.strinch.unit = "units/pd2_dlc_pines/masks/strinch/msk_the_strinch"
	self.masks.strinch.name_id = "bm_msk_the_strinch"
	self.masks.strinch.pcs = {}
	self.masks.strinch.type = "helmet"
	self.masks.strinch.value = 0
	self.masks.strinch.sort_number = 1
	self.masks.strinch.texture_bundle_folder = "pines"
	self.masks.almirs_beard = {}
	self.masks.almirs_beard.unit = "units/pd2_dlc_pines/masks/almirs_beard/msk_almirs_beard"
	self.masks.almirs_beard.name_id = "bm_msk_almirs_beard"
	self.masks.almirs_beard.pcs = {}
	self.masks.almirs_beard.type = "beard"
	self.masks.almirs_beard.skip_mask_on_sequence = true
	self.masks.almirs_beard.value = 0
	self.masks.almirs_beard.sort_number = 1
	self.masks.almirs_beard.texture_bundle_folder = "pines"
	self.masks.robo_santa = {}
	self.masks.robo_santa.unit = "units/pd2_dlc_pines/masks/robo_santa/msk_robo_santa"
	self.masks.robo_santa.name_id = "bm_msk_robo_santa"
	self.masks.robo_santa.pcs = {}
	self.masks.robo_santa.value = 0
	self.masks.robo_santa.sort_number = 1
	self.masks.robo_santa.texture_bundle_folder = "pines"
	self.masks.heat = {}
	self.masks.heat.unit = "units/pd2_dlc1/masks/msk_hockey_b/msk_hockey_b"
	self.masks.heat.name_id = "bm_msk_heat"
	self.masks.heat.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.heat.value = 6
	self.masks.heat.dlc = "pd2_clan"
	self.masks.heat.sort_number = 2
	self.masks.bear = {}
	self.masks.bear.unit = "units/payday2/masks/msk_bear/msk_bear"
	self.masks.bear.name_id = "bm_msk_bear"
	self.masks.bear.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bear.value = 3
	self.masks.bear.qlvl = 0
	self.masks.bear.dlc = "pd2_clan"
	self.masks.bear.sort_number = 1
	self.masks.clinton = {}
	self.masks.clinton.unit = "units/pd2_dlc1/masks/msk_clinton/msk_clinton"
	self.masks.clinton.name_id = "bm_msk_clinton"
	self.masks.clinton.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.clinton.value = 6
	self.masks.clinton.dlc = "armored_transport"
	self.masks.clinton.texture_bundle_folder = "dlc1"
	self.masks.bush = {}
	self.masks.bush.unit = "units/pd2_dlc1/masks/msk_bush/msk_bush"
	self.masks.bush.name_id = "bm_msk_bush"
	self.masks.bush.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.bush.value = 6
	self.masks.bush.dlc = "armored_transport"
	self.masks.bush.texture_bundle_folder = "dlc1"
	self.masks.obama = {}
	self.masks.obama.unit = "units/pd2_dlc1/masks/msk_obama/msk_obama"
	self.masks.obama.name_id = "bm_msk_obama"
	self.masks.obama.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.obama.value = 6
	self.masks.obama.dlc = "armored_transport"
	self.masks.obama.texture_bundle_folder = "dlc1"
	self.masks.nixon = {}
	self.masks.nixon.unit = "units/pd2_dlc1/masks/msk_nixon/msk_nixon"
	self.masks.nixon.name_id = "bm_msk_nixon"
	self.masks.nixon.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.nixon.value = 6
	self.masks.nixon.dlc = "armored_transport"
	self.masks.nixon.texture_bundle_folder = "dlc1"
	self.masks.goat = {}
	self.masks.goat.unit = "units/pd2_dlc_dec5/masks/msk_goat/msk_goat"
	self.masks.goat.name_id = "bm_msk_goat"
	self.masks.goat.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.goat.value = 4
	self.masks.goat.texture_bundle_folder = "gage_pack"
	self.masks.goat.dlc = "gage_pack"
	self.masks.panda = {}
	self.masks.panda.unit = "units/pd2_dlc_dec5/masks/msk_panda/msk_panda"
	self.masks.panda.name_id = "bm_msk_panda"
	self.masks.panda.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.panda.value = 4
	self.masks.panda.texture_bundle_folder = "gage_pack"
	self.masks.panda.dlc = "gage_pack"
	self.masks.pitbull = {}
	self.masks.pitbull.unit = "units/pd2_dlc_dec5/masks/msk_pitbull/msk_pitbull"
	self.masks.pitbull.name_id = "bm_msk_pitbull"
	self.masks.pitbull.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.pitbull.value = 4
	self.masks.pitbull.texture_bundle_folder = "gage_pack"
	self.masks.pitbull.dlc = "gage_pack"
	self.masks.eagle = {}
	self.masks.eagle.unit = "units/pd2_dlc_dec5/masks/msk_eagle/msk_eagle"
	self.masks.eagle.name_id = "bm_msk_eagle"
	self.masks.eagle.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.eagle.value = 4
	self.masks.eagle.qlvl = 0
	self.masks.eagle.texture_bundle_folder = "gage_pack"
	self.masks.eagle.dlc = "gage_pack"
	self.masks.santa_happy = {}
	self.masks.santa_happy.unit = "units/pd2_dlc2/masks/msk_santa_happy/msk_santa_happy"
	self.masks.santa_happy.name_id = "bm_msk_santa_happy"
	self.masks.santa_happy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_happy.value = 4
	self.masks.santa_happy.dlc = "pd2_clan"
	self.masks.santa_happy.sort_number = 3
	self.masks.santa_mad = {}
	self.masks.santa_mad.unit = "units/pd2_dlc_xmas/masks/msk_santa_mad/msk_santa_mad"
	self.masks.santa_mad.name_id = "bm_msk_santa_mad"
	self.masks.santa_mad.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_mad.value = 4
	self.masks.santa_mad.dlc = "xmas_soundtrack"
	self.masks.santa_drunk = {}
	self.masks.santa_drunk.unit = "units/pd2_dlc_xmas/masks/msk_santa_drunk/msk_santa_drunk"
	self.masks.santa_drunk.name_id = "bm_msk_santa_drunk"
	self.masks.santa_drunk.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_drunk.value = 4
	self.masks.santa_drunk.dlc = "xmas_soundtrack"
	self.masks.santa_surprise = {}
	self.masks.santa_surprise.unit = "units/pd2_dlc_xmas/masks/msk_santa_suprise/msk_santa_suprise"
	self.masks.santa_surprise.name_id = "bm_msk_santa_surprise"
	self.masks.santa_surprise.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.santa_surprise.value = 4
	self.masks.santa_surprise.dlc = "xmas_soundtrack"
	self.masks.aviator = {}
	self.masks.aviator.unit = "units/pd2_dlc_infamy/masks/msk_aviator/msk_aviator"
	self.masks.aviator.name_id = "bm_msk_aviator"
	self.masks.aviator.pcs = {}
	self.masks.aviator.value = 0
	self.masks.aviator.type = "glasses"
	self.masks.aviator.skip_mask_on_sequence = true
	self.masks.aviator.global_value = "infamy"
	self.masks.aviator.texture_bundle_folder = "infamous"
	self.masks.aviator.infamy_lock = "infamy_root"
	self.masks.aviator.offsets = {
		joy = {
			Vector3(0.077513, 1.62772, -1.71118),
			Rotation(0, 5.70954, 0)
		}
	}
	self.masks.ghost = {}
	self.masks.ghost.unit = "units/pd2_dlc_infamy/masks/msk_ghost/msk_ghost"
	self.masks.ghost.name_id = "bm_msk_ghost"
	self.masks.ghost.pcs = {}
	self.masks.ghost.value = 0
	self.masks.ghost.global_value = "infamy"
	self.masks.ghost.texture_bundle_folder = "infamous"
	self.masks.ghost.type = "helmet"
	self.masks.ghost.infamy_lock = "infamy_ghost"
	self.masks.welder = {}
	self.masks.welder.unit = "units/pd2_dlc_infamy/masks/msk_welder/msk_welder"
	self.masks.welder.name_id = "bm_msk_welder"
	self.masks.welder.pcs = {}
	self.masks.welder.value = 0
	self.masks.welder.global_value = "infamy"
	self.masks.welder.texture_bundle_folder = "infamous"
	self.masks.welder.infamy_lock = "infamy_enforcer"
	self.masks.plague = {}
	self.masks.plague.unit = "units/pd2_dlc_infamy/masks/msk_plague/msk_plague"
	self.masks.plague.name_id = "bm_msk_plague"
	self.masks.plague.pcs = {}
	self.masks.plague.value = 0
	self.masks.plague.global_value = "infamy"
	self.masks.plague.texture_bundle_folder = "infamous"
	self.masks.plague.infamy_lock = "infamy_mastermind"
	self.masks.smoker = {}
	self.masks.smoker.unit = "units/pd2_dlc_infamy/masks/msk_smoker/msk_smoker"
	self.masks.smoker.name_id = "bm_msk_smoker"
	self.masks.smoker.pcs = {}
	self.masks.smoker.value = 0
	self.masks.smoker.global_value = "infamy"
	self.masks.smoker.texture_bundle_folder = "infamous"
	self.masks.smoker.infamy_lock = "infamy_technician"
	self.masks.smoker.offsets = {
		jacket = {
			Vector3(0, 0.792991, 0.077513),
			Rotation(0, 0.558094, 0)
		}
	}
	self.masks.cloth_commander = {}
	self.masks.cloth_commander.unit = "units/pd2_dlc_gage_lmg/masks/cloth_commander/msk_cloth_commander"
	self.masks.cloth_commander.name_id = "bm_msk_cloth_commander"
	self.masks.cloth_commander.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.cloth_commander.value = 4
	self.masks.cloth_commander.qlvl = 0
	self.masks.cloth_commander.dlc = "gage_pack_lmg"
	self.masks.cloth_commander.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_blade = {}
	self.masks.gage_blade.unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_blade/msk_gage_blade"
	self.masks.gage_blade.name_id = "bm_msk_gage_blade"
	self.masks.gage_blade.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gage_blade.value = 4
	self.masks.gage_blade.qlvl = 0
	self.masks.gage_blade.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_blade.dlc = "gage_pack_lmg"
	self.masks.gage_rambo = {}
	self.masks.gage_rambo.unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_rambo/msk_gage_rambo"
	self.masks.gage_rambo.name_id = "bm_msk_rambo"
	self.masks.gage_rambo.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gage_rambo.value = 4
	self.masks.gage_rambo.qlvl = 0
	self.masks.gage_rambo.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_rambo.dlc = "gage_pack_lmg"
	self.masks.gage_deltaforce = {}
	self.masks.gage_deltaforce.unit = "units/pd2_dlc_gage_lmg/masks/msk_gage_deltaforce/msk_gage_deltaforce"
	self.masks.gage_deltaforce.name_id = "bm_msk_deltaforce"
	self.masks.gage_deltaforce.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.gage_deltaforce.value = 4
	self.masks.gage_deltaforce.qlvl = 0
	self.masks.gage_deltaforce.texture_bundle_folder = "gage_pack_lmg"
	self.masks.gage_deltaforce.dlc = "gage_pack_lmg"
	self.masks.robberfly = {}
	self.masks.robberfly.unit = "units/pd2_dlc_gage_snp/masks/msk_robberfly/msk_robberfly"
	self.masks.robberfly.name_id = "bm_msk_robberfly"
	self.masks.robberfly.pcs = {}
	self.masks.robberfly.value = 0
	self.masks.robberfly.qlvl = 0
	self.masks.robberfly.texture_bundle_folder = "gage_pack_snp"
	self.masks.robberfly.dlc = "gage_pack_snp"
	self.masks.spider = {}
	self.masks.spider.unit = "units/pd2_dlc_gage_snp/masks/msk_spider/msk_spider"
	self.masks.spider.name_id = "bm_msk_spider"
	self.masks.spider.pcs = {}
	self.masks.spider.value = 0
	self.masks.spider.qlvl = 0
	self.masks.spider.texture_bundle_folder = "gage_pack_snp"
	self.masks.spider.dlc = "gage_pack_snp"
	self.masks.mantis = {}
	self.masks.mantis.unit = "units/pd2_dlc_gage_snp/masks/msk_mantis/msk_mantis"
	self.masks.mantis.name_id = "bm_msk_mantis"
	self.masks.mantis.pcs = {}
	self.masks.mantis.value = 0
	self.masks.mantis.qlvl = 0
	self.masks.mantis.texture_bundle_folder = "gage_pack_snp"
	self.masks.mantis.dlc = "gage_pack_snp"
	self.masks.wasp = {}
	self.masks.wasp.unit = "units/pd2_dlc_gage_snp/masks/msk_wasp/msk_wasp"
	self.masks.wasp.name_id = "bm_msk_wasp"
	self.masks.wasp.pcs = {}
	self.masks.wasp.value = 0
	self.masks.wasp.qlvl = 0
	self.masks.wasp.texture_bundle_folder = "gage_pack_snp"
	self.masks.wasp.dlc = "gage_pack_snp"
	self.masks.skullhard = {}
	self.masks.skullhard.unit = "units/payday2/masks/msk_skullhard/msk_skullhard"
	self.masks.skullhard.name_id = "bm_msk_skullhard"
	self.masks.skullhard.pcs = {}
	self.masks.skullhard.value = 0
	self.masks.skullhard.qlvl = 0
	self.masks.skullhard.infamous = true
	self.masks.skullhard.sort_number = 30
	self.masks.skullveryhard = {}
	self.masks.skullveryhard.unit = "units/payday2/masks/msk_skullveryhard/msk_skullveryhard"
	self.masks.skullveryhard.name_id = "bm_msk_skullveryhard"
	self.masks.skullveryhard.pcs = {}
	self.masks.skullveryhard.value = 0
	self.masks.skullveryhard.qlvl = 0
	self.masks.skullveryhard.infamous = true
	self.masks.skullveryhard.sort_number = 31
	self.masks.skulloverkill = {}
	self.masks.skulloverkill.unit = "units/payday2/masks/msk_skulloverkill/msk_skulloverkill"
	self.masks.skulloverkill.name_id = "bm_msk_skulloverkill"
	self.masks.skulloverkill.pcs = {}
	self.masks.skulloverkill.value = 0
	self.masks.skulloverkill.qlvl = 0
	self.masks.skulloverkill.infamous = true
	self.masks.skulloverkill.sort_number = 32
	self.masks.gitgud_e_wish = {}
	self.masks.gitgud_e_wish.unit = "units/pd2_dlc_gitgud/masks/e_wish/msk_gitgud_e_wish"
	self.masks.gitgud_e_wish.name_id = "bm_e_wish"
	self.masks.gitgud_e_wish.pcs = {}
	self.masks.gitgud_e_wish.value = 0
	self.masks.gitgud_e_wish.qlvl = 0
	self.masks.gitgud_e_wish.infamous = true
	self.masks.gitgud_e_wish.texture_bundle_folder = "gitgud"
	self.masks.gitgud_e_wish.sort_number = 33
	self.masks.skulloverkillplus = {}
	self.masks.skulloverkillplus.unit = "units/payday2/masks/msk_skulloverkillplus/msk_skulloverkillplus"
	self.masks.skulloverkillplus.name_id = "bm_msk_skulloverkillplus"
	self.masks.skulloverkillplus.pcs = {}
	self.masks.skulloverkillplus.value = 0
	self.masks.skulloverkillplus.qlvl = 0
	self.masks.skulloverkillplus.infamous = true
	self.masks.skulloverkillplus.sort_number = 34
	self.masks.gitgud_sm_wish = {}
	self.masks.gitgud_sm_wish.unit = "units/pd2_dlc_gitgud/masks/sm_wish/msk_gitgud_sm_wish"
	self.masks.gitgud_sm_wish.name_id = "bm_sm_wish"
	self.masks.gitgud_sm_wish.pcs = {}
	self.masks.gitgud_sm_wish.value = 0
	self.masks.gitgud_sm_wish.qlvl = 0
	self.masks.gitgud_sm_wish.infamous = true
	self.masks.gitgud_sm_wish.texture_bundle_folder = "gitgud"
	self.masks.gitgud_sm_wish.sort_number = 35
	self.masks.metalhead = {}
	self.masks.metalhead.unit = "units/pd2_poetry_winners/masks/veggie/msk_metalhead"
	self.masks.metalhead.name_id = "bm_msk_metalhead"
	self.masks.metalhead.pcs = {}
	self.masks.metalhead.value = 0
	self.masks.metalhead.dlc = "poetry_soundtrack"
	self.masks.metalhead.global_value = "poetry_soundtrack"
	self.masks.tcn = {}
	self.masks.tcn.unit = "units/pd2_poetry_winners/masks/tcn/msk_tcn"
	self.masks.tcn.name_id = "bm_msk_tcn"
	self.masks.tcn.pcs = {}
	self.masks.tcn.value = 0
	self.masks.tcn.dlc = "poetry_soundtrack"
	self.masks.tcn.global_value = "poetry_soundtrack"
	self.masks.surprise = {}
	self.masks.surprise.unit = "units/pd2_poetry_winners/masks/shaegro/msk_surprise"
	self.masks.surprise.name_id = "bm_msk_surprise"
	self.masks.surprise.pcs = {}
	self.masks.surprise.value = 0
	self.masks.surprise.dlc = "poetry_soundtrack"
	self.masks.surprise.global_value = "poetry_soundtrack"
	self.masks.optimist_prime = {}
	self.masks.optimist_prime.unit = "units/pd2_poetry_winners/masks/optimist_prime/msk_optimist_prime"
	self.masks.optimist_prime.name_id = "bm_msk_optimist_prime"
	self.masks.optimist_prime.pcs = {}
	self.masks.optimist_prime.value = 0
	self.masks.optimist_prime.dlc = "poetry_soundtrack"
	self.masks.optimist_prime.global_value = "poetry_soundtrack"
	self.masks.samurai = {}
	self.masks.samurai.unit = "units/payday2/masks/msk_samurai/msk_samurai"
	self.masks.samurai.name_id = "bm_msk_samurai"
	self.masks.samurai.pcs = {}
	self.masks.samurai.value = 0
	self.masks.samurai.qlvl = 0
	self.masks.samurai.infamous = true
	self.masks.twitch_orc = {}
	self.masks.twitch_orc.unit = "units/pd2_twitch_pack/masks/msk_twitch_orc/msk_twitch_orc"
	self.masks.twitch_orc.name_id = "bm_msk_twitch_orc"
	self.masks.twitch_orc.pcs = {}
	self.masks.twitch_orc.value = 0
	self.masks.twitch_orc.qlvl = 0
	self.masks.twitch_orc.texture_bundle_folder = "twitch_pack"
	self.masks.twitch_orc.dlc = "twitch_pack"
	self.masks.twitch_orc.sort_number = 3
	self.masks.ancient = {}
	self.masks.ancient.unit = "units/pd2_twitch_pack/masks/msk_ancient/msk_ancient"
	self.masks.ancient.name_id = "bm_msk_ancient"
	self.masks.ancient.pcs = {}
	self.masks.ancient.value = 0
	self.masks.ancient.qlvl = 0
	self.masks.ancient.texture_bundle_folder = "twitch_pack"
	self.masks.ancient.dlc = "twitch_pack"
	self.masks.ancient.sort_number = 3
	self.masks.unicorn = {}
	self.masks.unicorn.unit = "units/payday2/masks/msk_unicorn/msk_unicorn"
	self.masks.unicorn.name_id = "bm_msk_unicorn"
	self.masks.unicorn.pcs = {}
	self.masks.unicorn.value = 0
	self.masks.unicorn.dlc = "pd2_clan"
	self.masks.unicorn.sort_number = 4
	self.masks.franklin = {}
	self.masks.franklin.unit = "units/pd2_dlc_big/masks/msk_franklin/msk_franklin"
	self.masks.franklin.name_id = "bm_msk_franklin"
	self.masks.franklin.pcs = {}
	self.masks.franklin.value = 0
	self.masks.franklin.qlvl = 0
	self.masks.franklin.dlc = "big_bank"
	self.masks.franklin.texture_bundle_folder = "big_bank"
	self.masks.lincoln = {}
	self.masks.lincoln.unit = "units/pd2_dlc_big/masks/msk_lincoln/msk_lincoln"
	self.masks.lincoln.name_id = "bm_msk_lincoln"
	self.masks.lincoln.pcs = {}
	self.masks.lincoln.value = 0
	self.masks.lincoln.qlvl = 0
	self.masks.lincoln.dlc = "big_bank"
	self.masks.lincoln.texture_bundle_folder = "big_bank"
	self.masks.grant = {}
	self.masks.grant.unit = "units/pd2_dlc_big/masks/msk_grant/msk_grant"
	self.masks.grant.name_id = "bm_msk_grant"
	self.masks.grant.pcs = {}
	self.masks.grant.value = 0
	self.masks.grant.qlvl = 0
	self.masks.grant.dlc = "big_bank"
	self.masks.grant.texture_bundle_folder = "big_bank"
	self.masks.washington = {}
	self.masks.washington.unit = "units/pd2_dlc_big/masks/msk_washington/msk_washington"
	self.masks.washington.name_id = "bm_msk_washington"
	self.masks.washington.pcs = {}
	self.masks.washington.value = 0
	self.masks.washington.qlvl = 0
	self.masks.washington.dlc = "big_bank"
	self.masks.washington.texture_bundle_folder = "big_bank"
	self.masks.silverback = {}
	self.masks.silverback.unit = "units/pd2_dlc_gage_shot/masks/silverback/msk_silverback"
	self.masks.silverback.name_id = "bm_msk_silverback"
	self.masks.silverback.pcs = {}
	self.masks.silverback.value = 0
	self.masks.silverback.dlc = "gage_pack_shotgun"
	self.masks.silverback.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.mandril = {}
	self.masks.mandril.unit = "units/pd2_dlc_gage_shot/masks/mandrill/msk_mandril"
	self.masks.mandril.name_id = "bm_msk_mandril"
	self.masks.mandril.pcs = {}
	self.masks.mandril.value = 0
	self.masks.mandril.dlc = "gage_pack_shotgun"
	self.masks.mandril.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.skullmonkey = {}
	self.masks.skullmonkey.unit = "units/pd2_dlc_gage_shot/masks/skullmonkey/msk_skullmonkey"
	self.masks.skullmonkey.name_id = "bm_msk_skullmonkey"
	self.masks.skullmonkey.pcs = {}
	self.masks.skullmonkey.value = 0
	self.masks.skullmonkey.dlc = "gage_pack_shotgun"
	self.masks.skullmonkey.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.orangutang = {}
	self.masks.orangutang.unit = "units/pd2_dlc_gage_shot/masks/orangutang/msk_orangutang"
	self.masks.orangutang.name_id = "bm_msk_orangutang"
	self.masks.orangutang.pcs = {}
	self.masks.orangutang.value = 0
	self.masks.orangutang.dlc = "gage_pack_shotgun"
	self.masks.orangutang.texture_bundle_folder = "gage_pack_shotgun"
	self.masks.galax = {}
	self.masks.galax.unit = "units/pd2_dlc_gage_assault/masks/msk_galax/msk_galax"
	self.masks.galax.name_id = "bm_msk_galax"
	self.masks.galax.pcs = {}
	self.masks.galax.value = 0
	self.masks.galax.dlc = "gage_pack_assault"
	self.masks.galax.texture_bundle_folder = "gage_pack_assault"
	self.masks.crowgoblin = {}
	self.masks.crowgoblin.unit = "units/pd2_dlc_gage_assault/masks/msk_crowgoblin/msk_crowgoblin"
	self.masks.crowgoblin.name_id = "bm_msk_crowgoblin"
	self.masks.crowgoblin.pcs = {}
	self.masks.crowgoblin.value = 0
	self.masks.crowgoblin.dlc = "gage_pack_assault"
	self.masks.crowgoblin.texture_bundle_folder = "gage_pack_assault"
	self.masks.evil = {}
	self.masks.evil.unit = "units/pd2_dlc_gage_assault/masks/msk_evil/msk_evil"
	self.masks.evil.name_id = "bm_msk_evil"
	self.masks.evil.pcs = {}
	self.masks.evil.value = 0
	self.masks.evil.dlc = "gage_pack_assault"
	self.masks.evil.texture_bundle_folder = "gage_pack_assault"
	self.masks.volt = {}
	self.masks.volt.unit = "units/pd2_dlc_gage_assault/masks/msk_volt/msk_volt"
	self.masks.volt.name_id = "bm_msk_volt"
	self.masks.volt.pcs = {}
	self.masks.volt.value = 0
	self.masks.volt.dlc = "gage_pack_assault"
	self.masks.volt.texture_bundle_folder = "gage_pack_assault"
	self.masks.white_wolf = {}
	self.masks.white_wolf.unit = "units/pd2_dlc_miami/masks/msk_white_wolf/msk_white_wolf"
	self.masks.white_wolf.name_id = "bm_msk_white_wolf"
	self.masks.white_wolf.pcs = {}
	self.masks.white_wolf.value = 0
	self.masks.white_wolf.dlc = "hl_miami"
	self.masks.white_wolf.texture_bundle_folder = "hl_miami"
	self.masks.owl = {}
	self.masks.owl.unit = "units/pd2_dlc_miami/masks/msk_owl/msk_owl"
	self.masks.owl.name_id = "bm_msk_owl"
	self.masks.owl.pcs = {}
	self.masks.owl.value = 0
	self.masks.owl.dlc = "hl_miami"
	self.masks.owl.texture_bundle_folder = "hl_miami"
	self.masks.rabbit = {}
	self.masks.rabbit.unit = "units/pd2_dlc_miami/masks/msk_rabbit/msk_rabbit"
	self.masks.rabbit.name_id = "bm_msk_rabbit"
	self.masks.rabbit.pcs = {}
	self.masks.rabbit.value = 0
	self.masks.rabbit.dlc = "hl_miami"
	self.masks.rabbit.texture_bundle_folder = "hl_miami"
	self.masks.pig = {}
	self.masks.pig.unit = "units/pd2_dlc_miami/masks/msk_pig/msk_pig"
	self.masks.pig.name_id = "bm_msk_pig"
	self.masks.pig.pcs = {}
	self.masks.pig.value = 0
	self.masks.pig.dlc = "hl_miami"
	self.masks.pig.texture_bundle_folder = "hl_miami"
	self.masks.panther = {}
	self.masks.panther.unit = "units/pd2_dlc_miami/masks/msk_panther/msk_panther"
	self.masks.panther.name_id = "bm_msk_panther"
	self.masks.panther.pcs = {}
	self.masks.panther.value = 0
	self.masks.panther.dlc = "hlm_game"
	self.masks.panther.texture_bundle_folder = "hl_miami"
	self.masks.rooster = {}
	self.masks.rooster.unit = "units/pd2_dlc_miami/masks/msk_rooster/msk_rooster"
	self.masks.rooster.name_id = "bm_msk_rooster"
	self.masks.rooster.pcs = {}
	self.masks.rooster.value = 0
	self.masks.rooster.dlc = "hlm_game"
	self.masks.rooster.texture_bundle_folder = "hl_miami"
	self.masks.horse = {}
	self.masks.horse.unit = "units/pd2_dlc_miami/masks/msk_horse/msk_horse"
	self.masks.horse.name_id = "bm_msk_horse"
	self.masks.horse.pcs = {}
	self.masks.horse.value = 0
	self.masks.horse.dlc = "hlm_game"
	self.masks.horse.texture_bundle_folder = "hl_miami"
	self.masks.tiger = {}
	self.masks.tiger.unit = "units/pd2_dlc_miami/masks/msk_tiger/msk_tiger"
	self.masks.tiger.name_id = "bm_msk_tiger"
	self.masks.tiger.pcs = {}
	self.masks.tiger.value = 0
	self.masks.tiger.dlc = "hlm_game"
	self.masks.tiger.texture_bundle_folder = "hl_miami"
	self.masks.combusto = {}
	self.masks.combusto.unit = "units/pd2_crimefest_2014/oct19/masks/combusto/msk_combusto"
	self.masks.combusto.name_id = "bm_msk_combusto"
	self.masks.combusto.pcs = {}
	self.masks.combusto.dlc = "pd2_clan"
	self.masks.combusto.value = 0
	self.masks.combusto.sort_number = 5
	self.masks.spackle = {}
	self.masks.spackle.unit = "units/pd2_crimefest_2014/oct19/masks/spackle/msk_spackle"
	self.masks.spackle.name_id = "bm_msk_spackle"
	self.masks.spackle.pcs = {}
	self.masks.spackle.dlc = "pd2_clan"
	self.masks.spackle.value = 0
	self.masks.spackle.sort_number = 5
	self.masks.jw_shades = {}
	self.masks.jw_shades.unit = "units/pd2_crimefest_2014/oct22/masks/jw_shades/msk_jw_shades"
	self.masks.jw_shades.name_id = "bm_msk_jw_shades"
	self.masks.jw_shades.pcs = {}
	self.masks.jw_shades.value = 0
	self.masks.jw_shades.type = "glasses"
	self.masks.jw_shades.skip_mask_on_sequence = true
	self.masks.jw_shades.global_value = "infamous"
	self.masks.jw_shades.dlc = "john_wick_character"
	self.masks.jw_shades.unlock_dlc = "pd2_clan"
	self.masks.stoneface = {}
	self.masks.stoneface.unit = "units/pd2_crimefest_2014/oct22/masks/stoneface/msk_stoneface"
	self.masks.stoneface.name_id = "bm_msk_stoneface"
	self.masks.stoneface.pcs = {}
	self.masks.stoneface.value = 0
	self.masks.stoneface.type = "glasses"
	self.masks.stoneface.skip_mask_on_sequence = true
	self.masks.stoneface.sort_number = 7
	self.masks.stoneface.global_value = "pd2_clan"
	self.masks.stoneface.dlc = "john_wick_character"
	self.masks.stoneface.unlock_dlc = "pd2_clan"
	self.masks.wayfarer = {}
	self.masks.wayfarer.unit = "units/pd2_crimefest_2014/oct22/masks/wayfarer/msk_wayfarer"
	self.masks.wayfarer.name_id = "bm_msk_wayfarer"
	self.masks.wayfarer.pcs = {}
	self.masks.wayfarer.value = 0
	self.masks.wayfarer.type = "glasses"
	self.masks.wayfarer.skip_mask_on_sequence = true
	self.masks.wayfarer.sort_number = 7
	self.masks.wayfarer.global_value = "pd2_clan"
	self.masks.wayfarer.dlc = "john_wick_character"
	self.masks.wayfarer.unlock_dlc = "pd2_clan"
	self.masks.smiley = {}
	self.masks.smiley.unit = "units/pd2_crimefest_2014/oct23/masks/smiley/msk_smiley"
	self.masks.smiley.name_id = "bm_msk_smiley"
	self.masks.smiley.pcs = {}
	self.masks.smiley.dlc = "pd2_clan"
	self.masks.smiley.value = 0
	self.masks.smiley.sort_number = 6
	self.masks.gumbo = {}
	self.masks.gumbo.unit = "units/pd2_crimefest_2014/oct23/masks/gumbo/msk_gumbo"
	self.masks.gumbo.name_id = "bm_msk_gumbo"
	self.masks.gumbo.pcs = {}
	self.masks.gumbo.dlc = "pd2_clan"
	self.masks.gumbo.value = 0
	self.masks.gumbo.sort_number = 6
	self.masks.crazy_lion = {}
	self.masks.crazy_lion.unit = "units/pd2_crimefest_2014/oct26/masks/msk_crazy_lion/crazy_lion_mask"
	self.masks.crazy_lion.name_id = "bm_msk_crazy_lion"
	self.masks.crazy_lion.pcs = {}
	self.masks.crazy_lion.dlc = "pd2_clan"
	self.masks.crazy_lion.value = 0
	self.masks.crazy_lion.sort_number = 8
	self.masks.churchill = {}
	self.masks.churchill.unit = "units/pd2_dlc_gage_historical/masks/churchill/msk_churchill"
	self.masks.churchill.name_id = "bm_msk_churchill"
	self.masks.churchill.pcs = {}
	self.masks.churchill.value = 0
	self.masks.churchill.dlc = "gage_pack_historical"
	self.masks.churchill.texture_bundle_folder = "gage_pack_historical"
	self.masks.red_hurricane = {}
	self.masks.red_hurricane.unit = "units/pd2_dlc_gage_historical/masks/red_hurricane/msk_red_hurricane"
	self.masks.red_hurricane.name_id = "bm_msk_red_hurricane"
	self.masks.red_hurricane.pcs = {}
	self.masks.red_hurricane.value = 0
	self.masks.red_hurricane.dlc = "gage_pack_historical"
	self.masks.red_hurricane.texture_bundle_folder = "gage_pack_historical"
	self.masks.patton = {}
	self.masks.patton.unit = "units/pd2_dlc_gage_historical/masks/patton/msk_patton"
	self.masks.patton.name_id = "bm_msk_patton"
	self.masks.patton.pcs = {}
	self.masks.patton.value = 0
	self.masks.patton.dlc = "gage_pack_historical"
	self.masks.patton.texture_bundle_folder = "gage_pack_historical"
	self.masks.de_gaulle = {}
	self.masks.de_gaulle.unit = "units/pd2_dlc_gage_historical/masks/de_gaulle/msk_de_gaulle"
	self.masks.de_gaulle.name_id = "bm_msk_de_gaulle"
	self.masks.de_gaulle.pcs = {}
	self.masks.de_gaulle.value = 0
	self.masks.de_gaulle.dlc = "gage_pack_historical"
	self.masks.de_gaulle.texture_bundle_folder = "gage_pack_historical"
	self.masks.msk_grizel = {}
	self.masks.msk_grizel.unit = "units/pd2_dlc_clover/masks/msk_grizel/msk_grizel"
	self.masks.msk_grizel.name_id = "bm_msk_msk_grizel"
	self.masks.msk_grizel.pcs = {}
	self.masks.msk_grizel.value = 0
	self.masks.msk_grizel.dlc = "character_pack_clover"
	self.masks.msk_grizel.texture_bundle_folder = "character_pack_clover"
	self.masks.grizel_clean = {}
	self.masks.grizel_clean.unit = "units/pd2_dlc_clover/masks/msk_clover_begins/msk_clover_begins"
	self.masks.grizel_clean.name_id = "bm_msk_grizel_clean"
	self.masks.grizel_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.grizel_clean.value = 0
	self.masks.grizel_clean.dlc = "character_pack_clover"
	self.masks.grizel_clean.texture_bundle_folder = "character_pack_clover"
	self.masks.medusa = {}
	self.masks.medusa.unit = "units/pd2_indiana/masks/medusa/msk_medusa"
	self.masks.medusa.name_id = "bm_msk_medusa"
	self.masks.medusa.pcs = {}
	self.masks.medusa.value = 0
	self.masks.medusa.dlc = "hope_diamond"
	self.masks.medusa.texture_bundle_folder = "character_pack_clover"
	self.masks.anubis = {}
	self.masks.anubis.unit = "units/pd2_indiana/masks/anubis/msk_anubis"
	self.masks.anubis.name_id = "bm_msk_anubis"
	self.masks.anubis.type = "helmet"
	self.masks.anubis.pcs = {}
	self.masks.anubis.value = 0
	self.masks.anubis.dlc = "hope_diamond"
	self.masks.anubis.texture_bundle_folder = "character_pack_clover"
	self.masks.pazuzu = {}
	self.masks.pazuzu.unit = "units/pd2_indiana/masks/pazuzu/msk_pazuzu"
	self.masks.pazuzu.name_id = "bm_msk_pazuzu"
	self.masks.pazuzu.pcs = {}
	self.masks.pazuzu.value = 0
	self.masks.pazuzu.dlc = "hope_diamond"
	self.masks.pazuzu.texture_bundle_folder = "character_pack_clover"
	self.masks.cursed_crown = {}
	self.masks.cursed_crown.unit = "units/pd2_indiana/masks/msk_cursed_crown/msk_cursed_crown"
	self.masks.cursed_crown.name_id = "bm_msk_cursed_crown"
	self.masks.cursed_crown.pcs = {}
	self.masks.cursed_crown.value = 0
	self.masks.cursed_crown.dlc = "hope_diamond"
	self.masks.cursed_crown.texture_bundle_folder = "character_pack_clover"
	self.masks.butcher = {}
	self.masks.butcher.unit = "units/pd2_dlc_dragan/masks/butcher/msk_butcher"
	self.masks.butcher.name_id = "bm_msk_butcher"
	self.masks.butcher.pcs = {}
	self.masks.butcher.value = 0
	self.masks.butcher.dlc = "the_bomb"
	self.masks.butcher.texture_bundle_folder = "the_bomb"
	self.masks.doctor = {}
	self.masks.doctor.unit = "units/pd2_dlc_cro/masks/msk_doctor/msk_doctor"
	self.masks.doctor.name_id = "bm_msk_doctor"
	self.masks.doctor.pcs = {}
	self.masks.doctor.value = 0
	self.masks.doctor.dlc = "the_bomb"
	self.masks.doctor.type = "helmet"
	self.masks.doctor.texture_bundle_folder = "the_bomb"
	self.masks.doctor.skip_mask_on_sequence = true
	self.masks.tech_lion = {}
	self.masks.tech_lion.unit = "units/pd2_dlc_cro/masks/msk_tech_lion/msk_tech_lion"
	self.masks.tech_lion.name_id = "bm_msk_tech_lion"
	self.masks.tech_lion.pcs = {}
	self.masks.tech_lion.value = 0
	self.masks.tech_lion.dlc = "the_bomb"
	self.masks.tech_lion.texture_bundle_folder = "the_bomb"
	self.masks.lady_butcher = {}
	self.masks.lady_butcher.unit = "units/pd2_dlc_cro/masks/msk_butcher/msk_butcher"
	self.masks.lady_butcher.name_id = "bm_msk_lady_butcher"
	self.masks.lady_butcher.pcs = {}
	self.masks.lady_butcher.value = 0
	self.masks.lady_butcher.dlc = "the_bomb"
	self.masks.lady_butcher.texture_bundle_folder = "the_bomb"
	self.masks.nun_town = {}
	self.masks.nun_town.unit = "units/pd2_dlc_goty/masks/nun_town/msk_nun_town"
	self.masks.nun_town.name_id = "bm_msk_nun_town"
	self.masks.nun_town.pcs = {}
	self.masks.nun_town.value = 0
	self.masks.nun_town.dlc = "goty_heist_bundle_2014"
	self.masks.nun_town.dlc_list = {
		"armored_transport",
		"big_bank",
		"hl_miami",
		"hope_diamond"
	}
	self.masks.nun_town.texture_bundle_folder = "pd2_goty"
	self.masks.robo_arnold = {}
	self.masks.robo_arnold.unit = "units/pd2_dlc_goty/masks/robo_arnold/msk_robo_arnold"
	self.masks.robo_arnold.name_id = "bm_msk_robo_arnold"
	self.masks.robo_arnold.pcs = {}
	self.masks.robo_arnold.value = 0
	self.masks.robo_arnold.dlc = "goty_weapon_bundle_2014"
	self.masks.robo_arnold.dlc_list = {
		"gage_pack",
		"gage_pack_lmg",
		"gage_pack_jobs",
		"gage_pack_snp",
		"gage_pack_shotgun",
		"gage_pack_assault",
		"gage_pack_historical"
	}
	self.masks.robo_arnold.texture_bundle_folder = "pd2_goty"
	self.masks.arch_nemesis = {}
	self.masks.arch_nemesis.unit = "units/pd2_dlc_goty/masks/arch_nemesis/msk_arch_nemesis"
	self.masks.arch_nemesis.name_id = "bm_msk_arch_nemesis"
	self.masks.arch_nemesis.pcs = {}
	self.masks.arch_nemesis.value = 0
	self.masks.arch_nemesis.type = "helmet"
	self.masks.arch_nemesis.default_blueprint = {
		materials = "deep_bronze",
		textures = "no_color_full_material"
	}
	self.masks.arch_nemesis.dlc = "goty_dlc_bundle_2014"
	self.masks.arch_nemesis.dlc_list = {
		"character_pack_clover",
		"armored_transport",
		"big_bank",
		"hl_miami",
		"hope_diamond",
		"gage_pack",
		"gage_pack_lmg",
		"gage_pack_jobs",
		"gage_pack_snp",
		"gage_pack_shotgun",
		"gage_pack_assault",
		"gage_pack_historical"
	}
	self.masks.arch_nemesis.texture_bundle_folder = "pd2_goty"
	self.masks.carnotaurus = {}
	self.masks.carnotaurus.unit = "units/pd2_dlc_akm4_modpack/masks/carnotaurus/msk_carnotaurus"
	self.masks.carnotaurus.name_id = "bm_msk_carnotaurus"
	self.masks.carnotaurus.pcs = {}
	self.masks.carnotaurus.value = 0
	self.masks.carnotaurus.texture_bundle_folder = "dlc_akm4"
	self.masks.carnotaurus.dlc = "akm4_pack"
	self.masks.triceratops = {}
	self.masks.triceratops.unit = "units/pd2_dlc_akm4_modpack/masks/triceratops/msk_triceratops"
	self.masks.triceratops.name_id = "bm_msk_triceratops"
	self.masks.triceratops.pcs = {}
	self.masks.triceratops.value = 0
	self.masks.triceratops.texture_bundle_folder = "dlc_akm4"
	self.masks.triceratops.dlc = "akm4_pack"
	self.masks.pachy = {}
	self.masks.pachy.unit = "units/pd2_dlc_akm4_modpack/masks/pachy/msk_pachy"
	self.masks.pachy.name_id = "bm_msk_pachy"
	self.masks.pachy.pcs = {}
	self.masks.pachy.value = 0
	self.masks.pachy.texture_bundle_folder = "dlc_akm4"
	self.masks.pachy.dlc = "akm4_pack"
	self.masks.velociraptor = {}
	self.masks.velociraptor.unit = "units/pd2_dlc_akm4_modpack/masks/velociraptor/msk_velociraptor"
	self.masks.velociraptor.name_id = "bm_msk_velociraptor"
	self.masks.velociraptor.pcs = {}
	self.masks.velociraptor.value = 0
	self.masks.velociraptor.texture_bundle_folder = "dlc_akm4"
	self.masks.velociraptor.dlc = "akm4_pack"
	self.masks.champion_dallas = {}
	self.masks.champion_dallas.unit = "units/pd2_hw_boxing/masks/champion_dallas/msk_champion_dallas"
	self.masks.champion_dallas.name_id = "bm_msk_champion_dallas"
	self.masks.champion_dallas.pcs = {}
	self.masks.champion_dallas.value = 0
	self.masks.champion_dallas.dlc = nil
	self.masks.champion_dallas.texture_bundle_folder = "pd2_hw_boxing"
	self.masks.champion_dallas.sort_number = 10
	self.masks.area51 = {}
	self.masks.area51.unit = "units/pd2_dlc_alienware/masks/area51/msk_area51"
	self.masks.area51.name_id = "bm_msk_area51"
	self.masks.area51.texture_bundle_folder = "alienware_alpha"
	self.masks.area51.pcs = {}
	self.masks.area51.value = 0
	self.masks.area51.dlc = "alienware_alpha"
	self.masks.area51.type = "helmet"
	self.masks.area51.sort_number = 5
	self.masks.alien_helmet = {}
	self.masks.alien_helmet.unit = "units/pd2_dlc_alienware/masks/alien_helmet/msk_alien_helmet"
	self.masks.alien_helmet.name_id = "bm_msk_alien_helmet"
	self.masks.alien_helmet.texture_bundle_folder = "alienware_alpha"
	self.masks.alien_helmet.pcs = {}
	self.masks.alien_helmet.value = 0
	self.masks.alien_helmet.dlc = "alienware_alpha"
	self.masks.alien_helmet.type = "helmet"
	self.masks.alien_helmet.default_blueprint = {
		materials = "gunmetal",
		textures = "no_color_full_material"
	}
	self.masks.alien_helmet.sort_number = 5
	self.masks.infamy_lurker = {}
	self.masks.infamy_lurker.unit = "units/pd2_dlc_infamy/masks/msk_infamy_lurker/msk_infamy_lurker"
	self.masks.infamy_lurker.name_id = "bm_msk_infamy_lurker"
	self.masks.infamy_lurker.global_value = "infamy"
	self.masks.infamy_lurker.texture_bundle_folder = "infamous"
	self.masks.infamy_lurker.pcs = {}
	self.masks.infamy_lurker.value = 0
	self.masks.infamy_lurker.infamy_lock = "infamy_maskpack_lurker"
	self.masks.infamy_hood = {}
	self.masks.infamy_hood.unit = "units/pd2_dlc_infamy/masks/msk_infamy_hood/msk_infamy_hood"
	self.masks.infamy_hood.name_id = "bm_msk_infamy_hood"
	self.masks.infamy_hood.global_value = "infamy"
	self.masks.infamy_hood.texture_bundle_folder = "infamous"
	self.masks.infamy_hood.pcs = {}
	self.masks.infamy_hood.value = 0
	self.masks.infamy_hood.type = "helmet"
	self.masks.infamy_hood.infamy_lock = "infamy_maskpack_hood"
	self.masks.ranger = {}
	self.masks.ranger.unit = "units/pd2_dlc_infamy/masks/ranger/msk_ranger"
	self.masks.ranger.name_id = "bm_msk_ranger"
	self.masks.ranger.global_value = "infamy"
	self.masks.ranger.texture_bundle_folder = "infamous"
	self.masks.ranger.pcs = {}
	self.masks.ranger.value = 0
	self.masks.ranger.type = "helmet"
	self.masks.ranger.infamy_lock = "infamy_maskpack_ranger"
	self.masks.punk = {}
	self.masks.punk.unit = "units/pd2_dlc_infamy/masks/punk/msk_punk"
	self.masks.punk.name_id = "bm_msk_punk"
	self.masks.punk.global_value = "infamy"
	self.masks.punk.texture_bundle_folder = "infamous"
	self.masks.punk.pcs = {}
	self.masks.punk.value = 0
	self.masks.punk.infamy_lock = "infamy_maskpack_punk"
	self.masks.daft = {}
	self.masks.daft.unit = "units/pd2_dlc_infamy/masks/daft/msk_daft"
	self.masks.daft.name_id = "bm_msk_daft"
	self.masks.daft.global_value = "infamy"
	self.masks.daft.texture_bundle_folder = "infamous"
	self.masks.daft.pcs = {}
	self.masks.daft.value = 0
	self.masks.daft.infamy_lock = "infamy_maskpack_daft"
	self.masks.pain = {}
	self.masks.pain.unit = "units/pd2_dlc_infamy/masks/pain/msk_pain"
	self.masks.pain.name_id = "bm_msk_pain"
	self.masks.pain.global_value = "infamy"
	self.masks.pain.texture_bundle_folder = "infamous"
	self.masks.pain.pcs = {}
	self.masks.pain.value = 0
	self.masks.pain.type = "helmet"
	self.masks.pain.skip_mask_on_sequence = true
	self.masks.pain.infamy_lock = "infamy_maskpack_pain"
	self.masks.destroyer = {}
	self.masks.destroyer.unit = "units/pd2_dlc_infamy/masks/destroyer/msk_destroyer"
	self.masks.destroyer.name_id = "bm_msk_destroyer"
	self.masks.destroyer.global_value = "infamy"
	self.masks.destroyer.texture_bundle_folder = "infamous"
	self.masks.destroyer.pcs = {}
	self.masks.destroyer.value = 0
	self.masks.destroyer.infamy_lock = "infamy_maskpack_destroyer"
	self.masks.balaclava_chains = {}
	self.masks.balaclava_chains.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_chains/msk_balaclava_chains"
	self.masks.balaclava_chains.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_chains.type = "helmet"
	self.masks.balaclava_chains.inaccessible = true
	self.masks.balaclava_wolf = {}
	self.masks.balaclava_wolf.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_wolf/msk_balaclava_wolf"
	self.masks.balaclava_wolf.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_wolf.type = "helmet"
	self.masks.balaclava_wolf.inaccessible = true
	self.masks.balaclava_clover = {}
	self.masks.balaclava_clover.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_clover/msk_balaclava_clover"
	self.masks.balaclava_clover.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_clover.type = "helmet"
	self.masks.balaclava_clover.inaccessible = true
	self.masks.balaclava_dallas = {}
	self.masks.balaclava_dallas.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_dallas/msk_balaclava_dallas"
	self.masks.balaclava_dallas.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_dallas.type = "helmet"
	self.masks.balaclava_dallas.inaccessible = true
	self.masks.balaclava_dallas.offsets = {
		myh = {
			Vector3(0, -0.16098, -0.399472),
			Rotation(-0.30048, 2.27524, -0.30048)
		},
		ecp_female = {
			Vector3(0, -0.399472, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.balaclava_dragan = {}
	self.masks.balaclava_dragan.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_dragan/msk_balaclava_dragan"
	self.masks.balaclava_dragan.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_dragan.type = "helmet"
	self.masks.balaclava_dragan.inaccessible = true
	self.masks.balaclava_hoxton = {}
	self.masks.balaclava_hoxton.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_hoxton/msk_balaclava_hoxton"
	self.masks.balaclava_hoxton.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_hoxton.type = "helmet"
	self.masks.balaclava_hoxton.inaccessible = true
	self.masks.balaclava_john_wick = {}
	self.masks.balaclava_john_wick.unit = "units/pd2_dlc_infamy/masks/msk_balaclava_john_wick/msk_balaclava_john_wick"
	self.masks.balaclava_john_wick.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_john_wick.type = "helmet"
	self.masks.balaclava_john_wick.inaccessible = true
	self.masks.balaclava_sokol = {}
	self.masks.balaclava_sokol.unit = "units/pd2_dlc_character_sokol/masks/msk_balaclava_sokol/msk_balaclava_sokol"
	self.masks.balaclava_sokol.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_sokol.type = "helmet"
	self.masks.balaclava_sokol.inaccessible = true
	self.masks.balaclava_wild = {}
	self.masks.balaclava_wild.unit = "units/pd2_dlc_wild/masks/msk_balaclava_wild/msk_balaclava_wild"
	self.masks.balaclava_wild.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_wild.type = "helmet"
	self.masks.balaclava_wild.inaccessible = true
	self.masks.balaclava_chico = {}
	self.masks.balaclava_chico.unit = "units/pd2_dlc_chico/masks/msk_balaclava_chico/msk_balaclava_chico"
	self.masks.balaclava_chico.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_chico.type = "helmet"
	self.masks.balaclava_chico.inaccessible = true
	self.masks.balaclava_max = {}
	self.masks.balaclava_max.unit = "units/pd2_dlc_max/masks/msk_balaclava_max/msk_balaclava_max"
	self.masks.balaclava_max.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_max.type = "helmet"
	self.masks.balaclava_max.inaccessible = true
	self.masks.balaclava_ecp_male = {}
	self.masks.balaclava_ecp_male.unit = "units/pd2_dlc_ecp/masks/msk_balaclava_ecp_male/msk_balaclava_ecp_male"
	self.masks.balaclava_ecp_male.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_ecp_male.type = "helmet"
	self.masks.balaclava_ecp_male.inaccessible = true
	self.masks.balaclava_ecp_male.offsets = {}
	self.masks.balaclava_joy = {}
	self.masks.balaclava_joy.unit = "units/pd2_dlc_joy/masks/msk_balaclava_joy/msk_balaclava_joy"
	self.masks.balaclava_joy.name_id = "bm_msk_cheat_error"
	self.masks.balaclava_joy.type = "helmet"
	self.masks.balaclava_joy.inaccessible = true
	self.masks.balaclava_joy.offsets = {
		joy = {
			Vector3(-0.16098, -0.280226, 0.316006),
			Rotation(-0, -0, 3.13382)
		}
	}
	self.masks.balaclava = {}
	self.masks.balaclava.name_id = "bm_msk_balaclava"
	self.masks.balaclava.global_value = "infamy"
	self.masks.balaclava.value = 0
	self.masks.balaclava.pcs = {}
	self.masks.balaclava.type = "helmet"
	self.masks.balaclava.texture_bundle_folder = "infamous"
	self.masks.balaclava.infamy_lock = "infamy_maskpack_balaclava"
	self.masks.balaclava.characters = {
		bodhi = "balaclava_dallas",
		bonnie = "balaclava_dallas",
		chains = "balaclava_chains",
		chico = "balaclava_chico",
		dallas = "balaclava_dallas",
		dragan = "balaclava_dragan",
		dragon = "balaclava_dallas",
		ecp_female = "balaclava_dallas",
		ecp_male = "balaclava_ecp_male",
		female_1 = "balaclava_clover",
		hoxton = "balaclava_dragan",
		jacket = "balaclava_wolf",
		jimmy = "balaclava_dallas",
		jowi = "balaclava_john_wick",
		joy = "balaclava_joy",
		max = "balaclava_dallas",
		myh = "balaclava_dallas",
		old_hoxton = "balaclava_hoxton",
		sokol = "balaclava_sokol",
		sydney = "balaclava_sokol",
		wild = "balaclava_wild",
		wolf = "balaclava_wolf"
	}
	self.masks.the_overkill_mask = {}
	self.masks.the_overkill_mask.unit = "units/pd2_dlc_overkill_pack/masks/msk_the_overkill_mask/msk_the_overkill_mask"
	self.masks.the_overkill_mask.name_id = "bm_msk_the_overkill_mask"
	self.masks.the_overkill_mask.pcs = {}
	self.masks.the_overkill_mask.value = 0
	self.masks.the_overkill_mask.dlc = "overkill_pack"
	self.masks.the_overkill_mask.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.the_overkill_mask.type = "glasses"
	self.masks.dallas_glow = {}
	self.masks.dallas_glow.unit = "units/pd2_dlc_cop/masks/msk_dallas_glow/msk_dallas_glow"
	self.masks.dallas_glow.name_id = "bm_msk_dallas_glow"
	self.masks.dallas_glow.dlc = "complete_overkill_pack"
	self.masks.dallas_glow.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.dallas_glow.value = 0
	self.masks.wolf_glow = {}
	self.masks.wolf_glow.unit = "units/pd2_dlc_cop/masks/msk_wolf_glow/msk_wolf_glow"
	self.masks.wolf_glow.name_id = "bm_msk_wolf_glow"
	self.masks.wolf_glow.dlc = "complete_overkill_pack"
	self.masks.wolf_glow.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.wolf_glow.value = 0
	self.masks.hoxton_glow = {}
	self.masks.hoxton_glow.unit = "units/pd2_dlc_cop/masks/msk_hoxton_glow/msk_hoxton_glow"
	self.masks.hoxton_glow.name_id = "bm_msk_hoxton_glow"
	self.masks.hoxton_glow.dlc = "complete_overkill_pack"
	self.masks.hoxton_glow.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.hoxton_glow.value = 0
	self.masks.chains_glow = {}
	self.masks.chains_glow.unit = "units/pd2_dlc_cop/masks/msk_chains_glow/msk_chains_glow"
	self.masks.chains_glow.name_id = "bm_msk_chains_glow"
	self.masks.chains_glow.dlc = "complete_overkill_pack"
	self.masks.chains_glow.texture_bundle_folder = "dlc_pack_overkill"
	self.masks.chains_glow.value = 0
	self.masks.jake = {}
	self.masks.jake.unit = "units/pd2_dlc_hotline2/masks/jake/msk_jake"
	self.masks.jake.name_id = "bm_msk_jake"
	self.masks.jake.pcs = {}
	self.masks.jake.texture_bundle_folder = "hlm2"
	self.masks.jake.dlc = "hlm2"
	self.masks.jake.value = 0
	self.masks.richter = {}
	self.masks.richter.unit = "units/pd2_dlc_hotline2/masks/richter/msk_richter"
	self.masks.richter.name_id = "bm_msk_richter"
	self.masks.richter.pcs = {}
	self.masks.richter.texture_bundle_folder = "hlm2"
	self.masks.richter.dlc = "hlm2"
	self.masks.richter.value = 0
	self.masks.biker = {}
	self.masks.biker.unit = "units/pd2_dlc_hotline2/masks/biker/msk_biker"
	self.masks.biker.name_id = "bm_msk_biker"
	self.masks.biker.pcs = {}
	self.masks.biker.texture_bundle_folder = "hlm2"
	self.masks.biker.dlc = "hlm2"
	self.masks.biker.value = 0
	self.masks.biker.type = "helmet"
	self.masks.alex = {}
	self.masks.alex.unit = "units/pd2_dlc_hotline2/masks/alex/msk_alex"
	self.masks.alex.name_id = "bm_msk_alex"
	self.masks.alex.pcs = {}
	self.masks.alex.texture_bundle_folder = "hlm2"
	self.masks.alex.dlc = "hlm2"
	self.masks.alex.value = 0
	self.masks.corey = {}
	self.masks.corey.unit = "units/pd2_dlc_hotline2/masks/corey/msk_corey"
	self.masks.corey.name_id = "bm_msk_corey"
	self.masks.corey.pcs = {}
	self.masks.corey.texture_bundle_folder = "hlm2"
	self.masks.corey.dlc = "hlm2"
	self.masks.corey.value = 0
	self.masks.tonys_revenge = {}
	self.masks.tonys_revenge.unit = "units/pd2_dlc_hotline2/masks/tonys_revenge/msk_tonys_revenge"
	self.masks.tonys_revenge.name_id = "bm_msk_tonys_revenge"
	self.masks.tonys_revenge.pcs = {}
	self.masks.tonys_revenge.texture_bundle_folder = "hlm2"
	self.masks.tonys_revenge.dlc = "hlm2"
	self.masks.tonys_revenge.value = 0
	self.masks.richard_returns = {}
	self.masks.richard_returns.unit = "units/pd2_dlc_hotline2/masks/richard_returns/msk_richard_returns"
	self.masks.richard_returns.name_id = "bm_msk_richard_returns"
	self.masks.richard_returns.pcs = {}
	self.masks.richard_returns.texture_bundle_folder = "hlm2"
	self.masks.richard_returns.dlc = "hlm2_deluxe"
	self.masks.richard_returns.value = 0
	self.masks.richard_returns.type = "helmet"
	self.masks.richard_begins = {}
	self.masks.richard_begins.unit = "units/pd2_dlc_hotline2/masks/richard_begins/msk_richard_begins"
	self.masks.richard_begins.name_id = "bm_msk_richard_begins"
	self.masks.richard_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.richard_begins.texture_bundle_folder = "hlm2"
	self.masks.richard_begins.dlc = "hlm2_deluxe"
	self.masks.richard_begins.value = 0
	self.masks.richard_begins.type = "helmet"
	self.masks.mega_richard_returns = {
		dlc = "hlm2_deluxe",
		name_id = "bm_msk_mega_richard_returns",
		texture_bundle_folder = "hlm2",
		type = "helmet",
		unit = "units/pd2_dlc_hotline2/masks/mega_richard_returns/msk_mega_richard_returns",
		value = 0,
		pcs = {}
	}
	self.masks.simpson = {}
	self.masks.simpson.unit = "units/pd2_dlc_cage/masks/simpson/msk_simpson"
	self.masks.simpson.name_id = "bm_msk_simpson"
	self.masks.simpson.pcs = {}
	self.masks.simpson.type = "helmet"
	self.masks.simpson.value = 0
	self.masks.hothead = {}
	self.masks.hothead.unit = "units/pd2_speedrunners/masks/hothead/msk_hothead"
	self.masks.hothead.name_id = "bm_msk_hothead"
	self.masks.hothead.pcs = {}
	self.masks.hothead.texture_bundle_folder = "speedrunners"
	self.masks.hothead.dlc = "speedrunners"
	self.masks.hothead.value = 0
	self.masks.falcon = {}
	self.masks.falcon.unit = "units/pd2_speedrunners/masks/falcon/msk_falcon"
	self.masks.falcon.name_id = "bm_msk_falcon"
	self.masks.falcon.pcs = {}
	self.masks.falcon.type = "helmet"
	self.masks.falcon.texture_bundle_folder = "speedrunners"
	self.masks.falcon.dlc = "speedrunners"
	self.masks.falcon.value = 0
	self.masks.unic = {}
	self.masks.unic.unit = "units/pd2_speedrunners/masks/unic/msk_unic"
	self.masks.unic.name_id = "bm_msk_unic"
	self.masks.unic.pcs = {}
	self.masks.unic.type = "helmet"
	self.masks.unic.texture_bundle_folder = "speedrunners"
	self.masks.unic.dlc = "speedrunners"
	self.masks.unic.value = 0
	self.masks.speedrunner = {}
	self.masks.speedrunner.unit = "units/pd2_speedrunners/masks/speedrunner/msk_speedrunner"
	self.masks.speedrunner.name_id = "bm_msk_speedrunner"
	self.masks.speedrunner.pcs = {}
	self.masks.speedrunner.type = "helmet"
	self.masks.speedrunner.texture_bundle_folder = "speedrunners"
	self.masks.speedrunner.dlc = "speedrunners"
	self.masks.speedrunner.value = 0
	self.masks.hectors_helmet = {}
	self.masks.hectors_helmet.unit = "units/pd2_mcmansion/masks/msk_hectors_helmet/msk_hectors_helmet"
	self.masks.hectors_helmet.name_id = "bm_msk_hectors_helmet"
	self.masks.hectors_helmet.type = "helmet"
	self.masks.hectors_helmet.infamous = true
	self.masks.hectors_helmet.pcs = {}
	self.masks.hectors_helmet.value = 0
	self.masks.hectors_helmet.texture_bundle_folder = "hoxton_revenge"
	self.masks.old_hoxton_begins = {}
	self.masks.old_hoxton_begins.unit = "units/pd2_mcmansion/masks/old_hoxton_begins/msk_old_hoxton_begins"
	self.masks.old_hoxton_begins.name_id = "bm_msk_old_hoxton_begins"
	self.masks.old_hoxton_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.old_hoxton_begins.global_value = "infamous"
	self.masks.old_hoxton_begins.value = 0
	self.masks.old_hoxton_begins.texture_bundle_folder = "hoxton_revenge"
	self.masks.firedemon = {}
	self.masks.firedemon.unit = "units/pd2_dlc_bbq/masks/msk_firedemon/msk_firedemon"
	self.masks.firedemon.name_id = "bm_msk_firedemon"
	self.masks.firedemon.pcs = {}
	self.masks.firedemon.value = 0
	self.masks.firedemon.dlc = "bbq"
	self.masks.firedemon.texture_bundle_folder = "bbq"
	self.masks.gasmask = {}
	self.masks.gasmask.unit = "units/pd2_dlc_bbq/masks/msk_gasmask/msk_gasmask"
	self.masks.gasmask.name_id = "bm_msk_gasmask"
	self.masks.gasmask.pcs = {}
	self.masks.gasmask.value = 0
	self.masks.gasmask.dlc = "bbq"
	self.masks.gasmask.texture_bundle_folder = "bbq"
	self.masks.firemask = {}
	self.masks.firemask.unit = "units/pd2_dlc_bbq/masks/msk_firemask/msk_firemask"
	self.masks.firemask.name_id = "bm_msk_firemask"
	self.masks.firemask.pcs = {}
	self.masks.firemask.value = 0
	self.masks.firemask.dlc = "bbq"
	self.masks.firemask.texture_bundle_folder = "bbq"
	self.masks.chef_hat = {}
	self.masks.chef_hat.unit = "units/pd2_dlc_bbq/masks/msk_chef_hat/msk_chef_hat"
	self.masks.chef_hat.name_id = "bm_msk_chef_hat"
	self.masks.chef_hat.pcs = {}
	self.masks.chef_hat.value = 0
	self.masks.chef_hat.dlc = "bbq"
	self.masks.chef_hat.texture_bundle_folder = "bbq"
	self.masks.chef_hat.type = "helmet"
	self.masks.bandit = {}
	self.masks.bandit.unit = "units/pd2_dlc_west/masks/msk_bandit/msk_bandit"
	self.masks.bandit.name_id = "bm_msk_bandit"
	self.masks.bandit.pcs = {}
	self.masks.bandit.dlc = "west"
	self.masks.bandit.texture_bundle_folder = "west"
	self.masks.bandit.value = 0
	self.masks.bandit.type = "helmet"
	self.masks.bullskull = {}
	self.masks.bullskull.unit = "units/pd2_dlc_west/masks/msk_bullskull/msk_bullskull"
	self.masks.bullskull.name_id = "bm_msk_bullskull"
	self.masks.bullskull.pcs = {}
	self.masks.bullskull.dlc = "west"
	self.masks.bullskull.texture_bundle_folder = "west"
	self.masks.bullskull.value = 0
	self.masks.kangee = {}
	self.masks.kangee.unit = "units/pd2_dlc_west/masks/msk_kangee/msk_kangee"
	self.masks.kangee.name_id = "bm_msk_kangee"
	self.masks.kangee.pcs = {}
	self.masks.kangee.dlc = "west"
	self.masks.kangee.texture_bundle_folder = "west"
	self.masks.kangee.value = 0
	self.masks.lone = {}
	self.masks.lone.unit = "units/pd2_dlc_west/masks/msk_lone/msk_lone"
	self.masks.lone.name_id = "bm_msk_lone"
	self.masks.lone.pcs = {}
	self.masks.lone.dlc = "west"
	self.masks.lone.texture_bundle_folder = "west"
	self.masks.lone.value = 0
	self.masks.lone.type = "helmet"
	self.masks.lone.skip_mask_on_sequence = true
	self.masks.lone.offsets = {
		joy = {
			Vector3(0.196759, -0.399472, -0.637965),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.grendel = {}
	self.masks.grendel.unit = "units/pd2_dlc_shoutout_raid/masks/grendel/msk_grendel"
	self.masks.grendel.name_id = "bm_msk_grendel"
	self.masks.grendel.pcs = {}
	self.masks.grendel.value = 0
	self.masks.grendel.global_value = "infamous"
	self.masks.concert_male = {}
	self.masks.concert_male.unit = "units/pd2_dlc_arena/masks/concert_male/msk_concert_male"
	self.masks.concert_male.name_id = "bm_msk_concert_male"
	self.masks.concert_male.pcs = {}
	self.masks.concert_male.value = 0
	self.masks.concert_male.dlc = "arena"
	self.masks.concert_male.texture_bundle_folder = "dlc_arena"
	self.masks.concert_female = {}
	self.masks.concert_female.unit = "units/pd2_dlc_arena/masks/concert_female/msk_concert_female"
	self.masks.concert_female.name_id = "bm_msk_concert_female"
	self.masks.concert_female.pcs = {}
	self.masks.concert_female.value = 0
	self.masks.concert_female.dlc = "arena"
	self.masks.concert_female.texture_bundle_folder = "dlc_arena"
	self.masks.boombox = {}
	self.masks.boombox.unit = "units/pd2_dlc_arena/masks/boombox/msk_boombox"
	self.masks.boombox.name_id = "bm_msk_boombox"
	self.masks.boombox.pcs = {}
	self.masks.boombox.value = 0
	self.masks.boombox.dlc = "arena"
	self.masks.boombox.texture_bundle_folder = "dlc_arena"
	self.masks.cantus = {}
	self.masks.cantus.unit = "units/pd2_dlc_arena/masks/cantus/msk_cantus"
	self.masks.cantus.name_id = "bm_msk_cantus"
	self.masks.cantus.pcs = {}
	self.masks.cantus.value = 0
	self.masks.cantus.dlc = "arena"
	self.masks.cantus.texture_bundle_folder = "dlc_arena"
	self.masks.titan = {}
	self.masks.titan.unit = "units/pd2_dlc_humble_summer15/masks/titan/msk_titan"
	self.masks.titan.name_id = "bm_msk_titan"
	self.masks.titan.pcs = {}
	self.masks.titan.value = 0
	self.masks.titan.dlc = "humble_pack3"
	self.masks.titan.texture_bundle_folder = "humble_summer_2015"
	self.masks.titan.sort_number = 6
	self.masks.pokachu = {}
	self.masks.pokachu.unit = "units/pd2_dlc_humble_summer15/masks/pokachu/msk_pokachu"
	self.masks.pokachu.name_id = "bm_msk_pokachu"
	self.masks.pokachu.pcs = {}
	self.masks.pokachu.value = 0
	self.masks.pokachu.dlc = "humble_pack3"
	self.masks.pokachu.texture_bundle_folder = "humble_summer_2015"
	self.masks.pokachu.sort_number = 6
	self.masks.moon = {}
	self.masks.moon.unit = "units/pd2_dlc_humble_summer15/masks/moon/msk_moon"
	self.masks.moon.name_id = "bm_msk_moon"
	self.masks.moon.pcs = {}
	self.masks.moon.value = 0
	self.masks.moon.dlc = "humble_pack4"
	self.masks.moon.texture_bundle_folder = "humble_summer_2015"
	self.masks.moon.sort_number = 7
	self.masks.borsuk = {}
	self.masks.borsuk.unit = "units/pd2_dlc_humble_summer15/masks/borsuk/msk_borsuk"
	self.masks.borsuk.name_id = "bm_msk_borsuk"
	self.masks.borsuk.pcs = {}
	self.masks.borsuk.value = 0
	self.masks.borsuk.dlc = "humble_pack4"
	self.masks.borsuk.texture_bundle_folder = "humble_summer_2015"
	self.masks.borsuk.sort_number = 7
	self.masks.card_jack = {}
	self.masks.card_jack.unit = "units/pd2_dlc_playingcards/masks/msk_card_jack/msk_card_jack"
	self.masks.card_jack.name_id = "bm_msk_card_jack"
	self.masks.card_jack.pcs = {}
	self.masks.card_jack.dlc = "e3_s15a"
	self.masks.card_jack.texture_bundle_folder = "humble_summer_2015"
	self.masks.card_jack.value = 0
	self.masks.card_jack.sort_number = 8
	self.masks.card_queen = {}
	self.masks.card_queen.unit = "units/pd2_dlc_playingcards/masks/msk_card_queen/msk_card_queen"
	self.masks.card_queen.name_id = "bm_msk_card_queen"
	self.masks.card_queen.pcs = {}
	self.masks.card_queen.dlc = "e3_s15b"
	self.masks.card_queen.texture_bundle_folder = "humble_summer_2015"
	self.masks.card_queen.value = 0
	self.masks.card_queen.sort_number = 8
	self.masks.card_king = {}
	self.masks.card_king.unit = "units/pd2_dlc_playingcards/masks/msk_card_king/msk_card_king"
	self.masks.card_king.name_id = "bm_msk_card_king"
	self.masks.card_king.pcs = {}
	self.masks.card_king.dlc = "e3_s15c"
	self.masks.card_king.texture_bundle_folder = "humble_summer_2015"
	self.masks.card_king.value = 0
	self.masks.card_king.sort_number = 8
	self.masks.card_joker = {}
	self.masks.card_joker.unit = "units/pd2_dlc_playingcards/masks/msk_card_joker/msk_card_joker"
	self.masks.card_joker.name_id = "bm_msk_card_joker"
	self.masks.card_joker.pcs = {}
	self.masks.card_joker.dlc = "e3_s15d"
	self.masks.card_joker.texture_bundle_folder = "humble_summer_2015"
	self.masks.card_joker.value = 0
	self.masks.card_joker.sort_number = 8
	self.masks.king_of_jesters = {}
	self.masks.king_of_jesters.unit = "units/pd2_dlc_paydaycon2015/masks/king_of_jesters/msk_king_of_jesters"
	self.masks.king_of_jesters.name_id = "bm_msk_king_of_jesters"
	self.masks.king_of_jesters.pcs = {}
	self.masks.king_of_jesters.dlc = "pdcon_2015"
	self.masks.king_of_jesters.value = 0
	self.masks.king_of_jesters.sort_number = 9
	self.masks.sokol = {}
	self.masks.sokol.unit = "units/pd2_dlc_character_sokol/masks/sokol/msk_sokol"
	self.masks.sokol.name_id = "bm_msk_sokol"
	self.masks.sokol.pcs = {}
	self.masks.sokol.value = 0
	self.masks.sokol.texture_bundle_folder = "character_pack_sokol"
	self.masks.sokol.dlc = "character_pack_sokol"
	self.masks.sokol_begins = {}
	self.masks.sokol_begins.unit = "units/pd2_dlc_character_sokol/masks/sokol_begins/msk_sokol_begins"
	self.masks.sokol_begins.name_id = "bm_msk_sokol_begins"
	self.masks.sokol_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.sokol_begins.value = 0
	self.masks.sokol_begins.texture_bundle_folder = "character_pack_sokol"
	self.masks.sokol_begins.dlc = "character_pack_sokol"
	self.masks.jiro = {}
	self.masks.jiro.unit = "units/pd2_dlc_dragon/masks/jiro/msk_jiro"
	self.masks.jiro.name_id = "bm_msk_jiro"
	self.masks.jiro.pcs = {}
	self.masks.jiro.value = 0
	self.masks.jiro.texture_bundle_folder = "dragon"
	self.masks.jiro.dlc = "dragon"
	self.masks.jiro_begins = {}
	self.masks.jiro_begins.unit = "units/pd2_dlc_dragon/masks/jiro_begins/msk_jiro_begins"
	self.masks.jiro_begins.name_id = "bm_msk_jiro_begins"
	self.masks.jiro_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.jiro_begins.value = 0
	self.masks.jiro_begins.texture_bundle_folder = "dragon"
	self.masks.jiro_begins.dlc = "dragon"
	self.masks.croupier_hat = {}
	self.masks.croupier_hat.unit = "units/pd2_dlc_casino/masks/msk_croupier_hat/msk_croupier_hat"
	self.masks.croupier_hat.name_id = "bm_msk_croupier_hat"
	self.masks.croupier_hat.pcs = {}
	self.masks.croupier_hat.value = 0
	self.masks.croupier_hat.dlc = "kenaz"
	self.masks.croupier_hat.texture_bundle_folder = "kenaz"
	self.masks.croupier_hat.type = "glasses"
	self.masks.croupier_hat.offsets = {
		joy = {
			Vector3(0, -0.518719, 0.912237),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.gladiator_helmet = {}
	self.masks.gladiator_helmet.unit = "units/pd2_dlc_casino/masks/msk_gladiator/msk_gladiator"
	self.masks.gladiator_helmet.name_id = "bm_msk_gladiator_helmet"
	self.masks.gladiator_helmet.pcs = {}
	self.masks.gladiator_helmet.value = 0
	self.masks.gladiator_helmet.dlc = "kenaz"
	self.masks.gladiator_helmet.texture_bundle_folder = "kenaz"
	self.masks.gladiator_helmet.type = "helmet"
	self.masks.the_king_mask = {}
	self.masks.the_king_mask.unit = "units/pd2_dlc_casino/masks/msk_the_king/msk_the_king"
	self.masks.the_king_mask.name_id = "bm_msk_the_king_mask"
	self.masks.the_king_mask.pcs = {}
	self.masks.the_king_mask.value = 0
	self.masks.the_king_mask.dlc = "kenaz"
	self.masks.the_king_mask.texture_bundle_folder = "kenaz"
	self.masks.the_king_mask.type = "helmet"
	self.masks.sports_utility_mask = {}
	self.masks.sports_utility_mask.unit = "units/pd2_dlc_casino/masks/msk_sports_utility/msk_sports_utility"
	self.masks.sports_utility_mask.name_id = "bm_msk_sports_utility_mask"
	self.masks.sports_utility_mask.pcs = {}
	self.masks.sports_utility_mask.value = 0
	self.masks.sports_utility_mask.dlc = "kenaz"
	self.masks.sports_utility_mask.texture_bundle_folder = "kenaz"
	self.masks.starvr = {}
	self.masks.starvr.unit = "units/pd2_dlc_humble_summer15/masks/starvr/msk_starvr"
	self.masks.starvr.name_id = "bm_msk_starvr"
	self.masks.starvr.pcs = {}
	self.masks.starvr.value = 0
	self.masks.starvr.infamous = true
	self.masks.starvr.texture_bundle_folder = "humble_summer_2015"
	self.masks.starvr.type = "helmet"
	self.masks.slicer = {}
	self.masks.slicer.unit = "units/pd2_dlc_turtles/masks/slicer/msk_slicer"
	self.masks.slicer.name_id = "bm_msk_slicer"
	self.masks.slicer.pcs = {}
	self.masks.slicer.value = 0
	self.masks.slicer.texture_bundle_folder = "turtles"
	self.masks.slicer.dlc = "turtles"
	self.masks.kage = {}
	self.masks.kage.unit = "units/pd2_dlc_turtles/masks/kage/msk_kage"
	self.masks.kage.name_id = "bm_msk_kage"
	self.masks.kage.pcs = {}
	self.masks.kage.value = 0
	self.masks.kage.texture_bundle_folder = "turtles"
	self.masks.kage.dlc = "turtles"
	self.masks.ninja_hood = {}
	self.masks.ninja_hood.unit = "units/pd2_dlc_turtles/masks/ninja_hood/msk_ninja_hood"
	self.masks.ninja_hood.name_id = "bm_msk_ninja_hood"
	self.masks.ninja_hood.pcs = {}
	self.masks.ninja_hood.value = 0
	self.masks.ninja_hood.type = "helmet"
	self.masks.ninja_hood.texture_bundle_folder = "turtles"
	self.masks.ninja_hood.dlc = "turtles"
	self.masks.shirai = {}
	self.masks.shirai.unit = "units/pd2_dlc_turtles/masks/shirai/msk_shirai"
	self.masks.shirai.name_id = "bm_msk_shirai"
	self.masks.shirai.pcs = {}
	self.masks.shirai.value = 0
	self.masks.shirai.type = "helmet"
	self.masks.shirai.skip_mask_on_sequence = true
	self.masks.shirai.texture_bundle_folder = "turtles"
	self.masks.shirai.dlc = "turtles"
	self.masks.bobblehead_dozer = {}
	self.masks.bobblehead_dozer.unit = "units/pd2_merchandise/masks/msk_bobblehead_dozer/msk_bobblehead_dozer"
	self.masks.bobblehead_dozer.name_id = "bm_msk_bobblehead_dozer"
	self.masks.bobblehead_dozer.pcs = {}
	self.masks.bobblehead_dozer.value = 0
	self.masks.bobblehead_dozer.texture_bundle_folder = "merchandise"
	self.masks.bobblehead_dozer.dlc = "bobblehead"
	self.masks.bobblehead_dozer.type = "helmet"
	self.masks.bobblehead_dozer.sort_number = 9
	self.masks.mason_knight_veteran = {}
	self.masks.mason_knight_veteran.unit = "units/pd2_dlc_steel/masks/mason_knight_veteran/msk_mason_knight_veteran"
	self.masks.mason_knight_veteran.name_id = "bm_msk_mason_knight_veteran"
	self.masks.mason_knight_veteran.pcs = {}
	self.masks.mason_knight_veteran.value = 0
	self.masks.mason_knight_veteran.dlc = "steel"
	self.masks.mason_knight_veteran.texture_bundle_folder = "steel"
	self.masks.mason_knight_veteran.type = "helmet"
	self.masks.agatha_knight = {}
	self.masks.agatha_knight.unit = "units/pd2_dlc_steel/masks/agatha_knight/msk_agatha_knight"
	self.masks.agatha_knight.name_id = "bm_msk_agatha_knight"
	self.masks.agatha_knight.pcs = {}
	self.masks.agatha_knight.value = 0
	self.masks.agatha_knight.dlc = "steel"
	self.masks.agatha_knight.texture_bundle_folder = "steel"
	self.masks.agatha_knight.type = "helmet"
	self.masks.agatha_vanguard_veteran = {}
	self.masks.agatha_vanguard_veteran.unit = "units/pd2_dlc_steel/masks/agatha_vanguard_veteran/msk_agatha_vanguard_veteran"
	self.masks.agatha_vanguard_veteran.name_id = "bm_msk_agatha_vanguard_veteran"
	self.masks.agatha_vanguard_veteran.pcs = {}
	self.masks.agatha_vanguard_veteran.value = 0
	self.masks.agatha_vanguard_veteran.dlc = "steel"
	self.masks.agatha_vanguard_veteran.texture_bundle_folder = "steel"
	self.masks.agatha_vanguard_veteran.type = "helmet"
	self.masks.mason_vanguard_veteran = {}
	self.masks.mason_vanguard_veteran.unit = "units/pd2_dlc_steel/masks/mason_vanguard_veteran/msk_mason_vanguard_veteran"
	self.masks.mason_vanguard_veteran.name_id = "bm_msk_mason_vanguard_veteran"
	self.masks.mason_vanguard_veteran.pcs = {}
	self.masks.mason_vanguard_veteran.value = 0
	self.masks.mason_vanguard_veteran.dlc = "steel"
	self.masks.mason_vanguard_veteran.texture_bundle_folder = "steel"
	self.masks.mason_vanguard_veteran.type = "helmet"
	self.masks.rus_hat = {}
	self.masks.rus_hat.unit = "units/pd2_crimefest_2015/update_2/masks/rus_hat/msk_rus_hat"
	self.masks.rus_hat.name_id = "bm_msk_rus_hat"
	self.masks.rus_hat.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rus_hat.sort_number = 8
	self.masks.rus_hat.value = 0
	self.masks.rus_hat.type = "helmet"
	self.masks.sputnik = {}
	self.masks.sputnik.unit = "units/pd2_crimefest_2015/update_2/masks/sputnik/msk_sputnik"
	self.masks.sputnik.name_id = "bm_msk_sputnik"
	self.masks.sputnik.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.sputnik.sort_number = 8
	self.masks.sputnik.value = 0
	self.masks.sputnik.type = "helmet"
	self.masks.tiara = {}
	self.masks.tiara.unit = "units/pd2_crimefest_2015/update_2/masks/tiara/msk_tiara"
	self.masks.tiara.name_id = "bm_msk_tiara"
	self.masks.tiara.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.tiara.sort_number = 8
	self.masks.tiara.value = 0
	self.masks.tiara.type = "tiara"
	self.masks.tiara.skip_mask_on_sequence = true
	self.masks.tiara.offsets = {
		joy = {
			Vector3(2.93943, 2.46244, -4.45385),
			Rotation(16.871, 22.0224, 0.558107)
		},
		sydney = {
			Vector3(0, -1.71118, 5.08586),
			Rotation(0, -20.9063, 0)
		}
	}
	self.masks.baba_yaga = {}
	self.masks.baba_yaga.unit = "units/pd2_crimefest_2015/update_2/masks/baba_yaga/msk_baba_yaga"
	self.masks.baba_yaga.name_id = "bm_msk_baba_yaga"
	self.masks.baba_yaga.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.baba_yaga.sort_number = 8
	self.masks.baba_yaga.value = 0
	self.masks.vlad_armor = {}
	self.masks.vlad_armor.unit = "units/pd2_crimefest_2015/update_2/masks/vlad_armor/msk_vlad_armor"
	self.masks.vlad_armor.name_id = "bm_msk_vlad_armor"
	self.masks.vlad_armor.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.vlad_armor.value = 0
	self.masks.vlad_armor.sort_number = 8
	self.masks.vlad_armor.type = "helmet"
	self.masks.lcv = {}
	self.masks.lcv.unit = "units/pd2_dlc_rave/masks/msk_lcv"
	self.masks.lcv.name_id = "bm_msk_lcv"
	self.masks.lcv.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.lcv.value = 0
	self.masks.lcv.sort_number = 9
	self.masks.lcv.texture_bundle_folder = "rave"
	self.masks.pirate_skull = {}
	self.masks.pirate_skull.unit = "units/pd2_crimefest_2015/update_8/masks/pirate_skull/msk_pirate_skull"
	self.masks.pirate_skull.name_id = "bm_msk_pirate_skull"
	self.masks.pirate_skull.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.pirate_skull.value = 0
	self.masks.pirate_skull.sort_number = 10
	self.masks.pirate_skull.type = "helmet"
	self.masks.fatboy = {}
	self.masks.fatboy.unit = "units/pd2_crimefest_2015/update_8/masks/msk_fatboy/msk_fatboy"
	self.masks.fatboy.name_id = "bm_msk_fatboy"
	self.masks.fatboy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.fatboy.value = 0
	self.masks.fatboy.sort_number = 10
	self.masks.oliver = {}
	self.masks.oliver.unit = "units/pd2_crimefest_2015/update_8/masks/oliver/msk_oliver"
	self.masks.oliver.name_id = "bm_msk_oliver"
	self.masks.oliver.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.oliver.value = 0
	self.masks.oliver.sort_number = 10
	self.masks.oliver.default_blueprint = {
		materials = "deep_bronze",
		textures = "no_color_full_material"
	}
	self.masks.eggian = {}
	self.masks.eggian.unit = "units/pd2_crimefest_2015/update_8/masks/eggian/msk_eggian"
	self.masks.eggian.name_id = "bm_msk_eggian"
	self.masks.eggian.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.eggian.value = 0
	self.masks.eggian.sort_number = 10
	self.masks.groucho_glasses = {}
	self.masks.groucho_glasses.unit = "units/pd2_crimefest_2015/update_9/masks/msk_groucho_glasses/msk_groucho_glasses"
	self.masks.groucho_glasses.name_id = "bm_msk_groucho"
	self.masks.groucho_glasses.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.groucho_glasses.value = 0
	self.masks.groucho_glasses.type = "glasses"
	self.masks.groucho_glasses.sort_number = 11
	self.masks.groucho_glasses.skip_mask_on_sequence = true
	self.masks.glasses_tinted_love = {}
	self.masks.glasses_tinted_love.unit = "units/pd2_crimefest_2015/update_9/masks/msk_tinted_love/msk_glasses_tinted_love"
	self.masks.glasses_tinted_love.name_id = "bm_msk_tinted_love"
	self.masks.glasses_tinted_love.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.glasses_tinted_love.value = 0
	self.masks.glasses_tinted_love.type = "glasses"
	self.masks.glasses_tinted_love.sort_number = 11
	self.masks.glasses_tinted_love.skip_mask_on_sequence = true
	self.masks.baitface = {}
	self.masks.baitface.unit = "units/pd2_crimefest_2015/update_10/masks/baitface/msk_baitface"
	self.masks.baitface.name_id = "bm_msk_baitface"
	self.masks.baitface.pcs = {}
	self.masks.baitface.value = 0
	self.masks.baitface.sort_number = 12
	self.masks.nomegusta = {}
	self.masks.nomegusta.unit = "units/pd2_crimefest_2015/update_10/masks/nomegusta/msk_nomegusta"
	self.masks.nomegusta.name_id = "bm_msk_nomegusta"
	self.masks.nomegusta.pcs = {}
	self.masks.nomegusta.value = 0
	self.masks.nomegusta.sort_number = 12
	self.masks.rageface = {}
	self.masks.rageface.unit = "units/pd2_crimefest_2015/update_10/masks/rageface/msk_rageface"
	self.masks.rageface.name_id = "bm_msk_rageface"
	self.masks.rageface.pcs = {}
	self.masks.rageface.value = 0
	self.masks.rageface.sort_number = 12
	self.masks.dawg = {}
	self.masks.dawg.unit = "units/pd2_crimefest_2015/update_10/masks/msk_dawg/msk_dawg"
	self.masks.dawg.name_id = "bm_msk_dawg"
	self.masks.dawg.pcs = {}
	self.masks.dawg.value = 0
	self.masks.dawg.sort_number = 12
	self.masks.invader = {}
	self.masks.invader.unit = "units/pd2_dlc_nails/masks/invader/msk_invader"
	self.masks.invader.name_id = "bm_msk_invader"
	self.masks.invader.global_value = "halloween"
	self.masks.invader.texture_bundle_folder = "nails"
	self.masks.invader.sort_number = 3
	self.masks.invader.value = 0
	self.masks.satan = {}
	self.masks.satan.unit = "units/pd2_dlc_nails/masks/satan/msk_satan"
	self.masks.satan.name_id = "bm_msk_satan"
	self.masks.satan.global_value = "halloween"
	self.masks.satan.texture_bundle_folder = "nails"
	self.masks.satan.sort_number = 3
	self.masks.satan.value = 0
	self.masks.tormentor = {}
	self.masks.tormentor.unit = "units/pd2_dlc_tormentor_mask/masks/tormentor/msk_tormentor"
	self.masks.tormentor.name_id = "bm_msk_tormentor"
	self.masks.tormentor.pcs = {}
	self.masks.tormentor.value = 0
	self.masks.tormentor.sort_number = 12
	self.masks.bodhi = {}
	self.masks.bodhi.unit = "units/pd2_dlc_rip/masks/bodhi/msk_bodhi"
	self.masks.bodhi.name_id = "bm_msk_bodhi"
	self.masks.bodhi.pcs = {}
	self.masks.bodhi.value = 0
	self.masks.bodhi.global_value = "infamous"
	self.masks.bodhi.texture_bundle_folder = "rip"
	self.masks.bodhi.dlc = "rvd"
	self.masks.bodhi_begins = {}
	self.masks.bodhi_begins.unit = "units/pd2_dlc_rip/masks/bodhi_begins/msk_bodhi_begins"
	self.masks.bodhi_begins.name_id = "bm_msk_bodhi_begins"
	self.masks.bodhi_begins.pcs = {}
	self.masks.bodhi_begins.value = 0
	self.masks.bodhi_begins.global_value = "infamous"
	self.masks.bodhi_begins.texture_bundle_folder = "rip"
	self.masks.bodhi_begins.dlc = "rvd"
	self.masks.water_spirit = {}
	self.masks.water_spirit.unit = "units/pd2_dlc_jerry/masks/msk_water_spirit/msk_water_spirit"
	self.masks.water_spirit.name_id = "bm_msk_water_spirit"
	self.masks.water_spirit.pcs = {}
	self.masks.water_spirit.value = 0
	self.masks.water_spirit.dlc = "berry"
	self.masks.water_spirit.texture_bundle_folder = "berry"
	self.masks.tane = {}
	self.masks.tane.unit = "units/pd2_dlc_jerry/masks/tane/msk_tane"
	self.masks.tane.name_id = "bm_msk_tane"
	self.masks.tane.pcs = {}
	self.masks.tane.value = 0
	self.masks.tane.dlc = "berry"
	self.masks.tane.texture_bundle_folder = "berry"
	self.masks.oro = {}
	self.masks.oro.unit = "units/pd2_dlc_jerry/masks/oro/msk_oro"
	self.masks.oro.name_id = "bm_msk_oro"
	self.masks.oro.pcs = {}
	self.masks.oro.value = 0
	self.masks.oro.dlc = "berry"
	self.masks.oro.texture_bundle_folder = "berry"
	self.masks.maui = {}
	self.masks.maui.unit = "units/pd2_dlc_jerry/masks/maui/msk_maui"
	self.masks.maui.name_id = "bm_msk_maui"
	self.masks.maui.pcs = {}
	self.masks.maui.value = 0
	self.masks.maui.dlc = "berry"
	self.masks.maui.texture_bundle_folder = "berry"
	self.masks.rudeolph = {}
	self.masks.rudeolph.unit = "units/pd2_dlc_cane/masks/rudeolph/msk_rudeolph"
	self.masks.rudeolph.name_id = "bm_msk_rudeolph"
	self.masks.rudeolph.type = "tiara"
	self.masks.rudeolph.pcs = {}
	self.masks.rudeolph.value = 0
	self.masks.rudeolph.sort_number = 13
	self.masks.greedy_the_elf = {}
	self.masks.greedy_the_elf.unit = "units/pd2_dlc_cane/masks/greedy_the_elf/msk_greedy_the_elf"
	self.masks.greedy_the_elf.name_id = "bm_msk_greedy_the_elf"
	self.masks.greedy_the_elf.type = "hat"
	self.masks.greedy_the_elf.pcs = {}
	self.masks.greedy_the_elf.value = 0
	self.masks.greedy_the_elf.sort_number = 13
	self.masks.tall_goat = {}
	self.masks.tall_goat.unit = "units/pd2_dlc_peta/masks/mask_tall_goat/msk_tall_goat"
	self.masks.tall_goat.name_id = "bm_msk_tall_goat"
	self.masks.tall_goat.pcs = {}
	self.masks.tall_goat.value = 0
	self.masks.tall_goat.sort_number = 14
	self.masks.tall_goat.dlc = "peta"
	self.masks.tall_goat.texture_bundle_folder = "peta"
	self.masks.goat_goat = {}
	self.masks.goat_goat.unit = "units/pd2_dlc_peta/masks/mask_goat/msk_goat_goat"
	self.masks.goat_goat.name_id = "bm_msk_goat_goat"
	self.masks.goat_goat.pcs = {}
	self.masks.goat_goat.value = 0
	self.masks.goat_goat.sort_number = 14
	self.masks.goat_goat.dlc = "peta"
	self.masks.goat_goat.texture_bundle_folder = "peta"
	self.masks.wet_goat = {}
	self.masks.wet_goat.unit = "units/pd2_dlc_peta/masks/mask_wet_goat/msk_wet_goat"
	self.masks.wet_goat.name_id = "bm_msk_slimy_goat"
	self.masks.wet_goat.pcs = {}
	self.masks.wet_goat.value = 0
	self.masks.wet_goat.sort_number = 14
	self.masks.wet_goat.dlc = "peta"
	self.masks.wet_goat.texture_bundle_folder = "peta"
	self.masks.fancy_goat = {}
	self.masks.fancy_goat.unit = "units/pd2_dlc_peta/masks/mask_fancy_goat/msk_fancy_goat"
	self.masks.fancy_goat.name_id = "bm_msk_fancy_goat"
	self.masks.fancy_goat.pcs = {}
	self.masks.fancy_goat.value = 0
	self.masks.fancy_goat.sort_number = 14
	self.masks.fancy_goat.dlc = "peta"
	self.masks.fancy_goat.texture_bundle_folder = "peta"
	self.masks.devourer = {}
	self.masks.devourer.unit = "units/pd2_dlc_dbd_community/masks/devourer/msk_devourer"
	self.masks.devourer.name_id = "bm_msk_devourer"
	self.masks.devourer.pcs = {}
	self.masks.devourer.value = 0
	self.masks.devourer.dlc = "dbd_clan"
	self.masks.devourer.texture_bundle_folder = "daylight"
	self.masks.unborn = {}
	self.masks.unborn.unit = "units/pd2_dlc_dbd_community/masks/unborn/msk_unborn"
	self.masks.unborn.name_id = "bm_msk_unborn"
	self.masks.unborn.pcs = {}
	self.masks.unborn.value = 0
	self.masks.unborn.dlc = "dbd_clan"
	self.masks.unborn.texture_bundle_folder = "daylight"
	self.masks.horned_king = {}
	self.masks.horned_king.unit = "units/pd2_dlc_lupus/masks/lupus_horned_king/msk_horned_king"
	self.masks.horned_king.name_id = "bm_msk_horned_king"
	self.masks.horned_king.type = "tiara"
	self.masks.horned_king.pcs = {}
	self.masks.horned_king.value = 0
	self.masks.horned_king.dlc = "pal"
	self.masks.horned_king.texture_bundle_folder = "lupus"
	self.masks.horned_king.sort_number = 15
	self.masks.horned_king.offsets = {
		joy = {
			Vector3(0, 1.15073, -0.518717),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.viking = {}
	self.masks.viking.unit = "units/pd2_dlc_lupus/masks/lupus_viking/msk_viking"
	self.masks.viking.name_id = "bm_msk_viking"
	self.masks.viking.pcs = {}
	self.masks.viking.value = 0
	self.masks.viking.dlc = "pal"
	self.masks.viking.texture_bundle_folder = "lupus"
	self.masks.viking.sort_number = 15
	self.masks.nutcracker = {}
	self.masks.nutcracker.unit = "units/pd2_dlc_lupus/masks/lupus_nutcracker/msk_nutcracker"
	self.masks.nutcracker.name_id = "bm_msk_nutcracker"
	self.masks.nutcracker.pcs = {}
	self.masks.nutcracker.value = 0
	self.masks.nutcracker.dlc = "pal"
	self.masks.nutcracker.texture_bundle_folder = "lupus"
	self.masks.nutcracker.sort_number = 15
	self.masks.divided = {}
	self.masks.divided.unit = "units/pd2_dlc_lupus/masks/lupus_divided/msk_divided"
	self.masks.divided.name_id = "bm_msk_divided"
	self.masks.divided.pcs = {}
	self.masks.divided.value = 0
	self.masks.divided.dlc = "pal"
	self.masks.divided.texture_bundle_folder = "lupus"
	self.masks.divided.sort_number = 15
	self.masks.megacthulhu = {}
	self.masks.megacthulhu.unit = "units/pd2_dlc_super/masks/megacthulu/msk_megacthulhu"
	self.masks.megacthulhu.name_id = "bm_msk_megacthulhu"
	self.masks.megacthulhu.dlc = "complete_overkill_pack"
	self.masks.megacthulhu.texture_bundle_folder = "super"
	self.masks.megacthulhu.value = 0
	self.masks.hunter = {}
	self.masks.hunter.unit = "units/pd2_dlc_super/masks/hunter/msk_hunter"
	self.masks.hunter.name_id = "bm_msk_hunter"
	self.masks.hunter.dlc = "complete_overkill_pack"
	self.masks.hunter.texture_bundle_folder = "super"
	self.masks.hunter.value = 0
	self.masks.cop_skull = {}
	self.masks.cop_skull.unit = "units/pd2_dlc_super/masks/cop_skull/msk_cop_skull"
	self.masks.cop_skull.name_id = "bm_cop_mega_skull"
	self.masks.cop_skull.dlc = "complete_overkill_pack"
	self.masks.cop_skull.texture_bundle_folder = "super"
	self.masks.cop_skull.value = 0
	self.masks.cop_plague_doctor = {}
	self.masks.cop_plague_doctor.unit = "units/pd2_dlc_super/masks/cop_plague_doctor/msk_cop_plague_doctor"
	self.masks.cop_plague_doctor.name_id = "bm_cop_plague_doctor"
	self.masks.cop_plague_doctor.dlc = "complete_overkill_pack"
	self.masks.cop_plague_doctor.texture_bundle_folder = "super"
	self.masks.cop_plague_doctor.value = 0
	self.masks.cop_kawaii = {}
	self.masks.cop_kawaii.unit = "units/pd2_dlc_super/masks/cop_kawaii/msk_cop_kawaii"
	self.masks.cop_kawaii.name_id = "bm_cop_kawaii"
	self.masks.cop_kawaii.dlc = "complete_overkill_pack"
	self.masks.cop_kawaii.texture_bundle_folder = "super"
	self.masks.cop_kawaii.value = 0
	self.masks.jimmy = {}
	self.masks.jimmy.unit = "units/pd2_dlc_coco/masks/jimmy/msk_jimmy"
	self.masks.jimmy.name_id = "bm_msk_jimmy"
	self.masks.jimmy.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.jimmy.value = 0
	self.masks.jimmy.dlc = "coco"
	self.masks.jimmy.global_value = "infamous"
	self.masks.jimmy.texture_bundle_folder = "coco"
	self.masks.jimmy.sort_number = 16
	self.masks.jimmy_duct = {}
	self.masks.jimmy_duct.unit = "units/pd2_dlc_coco/masks/jimmy_duct/msk_jimmy_duct"
	self.masks.jimmy_duct.name_id = "bm_msk_jimmy_duct"
	self.masks.jimmy_duct.pcs = {}
	self.masks.jimmy_duct.value = 0
	self.masks.jimmy_duct.dlc = "coco"
	self.masks.jimmy_duct.global_value = "infamous"
	self.masks.jimmy_duct.texture_bundle_folder = "coco"
	self.masks.jimmy_duct.sort_number = 16
	self.masks.half_mask = {}
	self.masks.half_mask.unit = "units/pd2_dlc_mad/masks/mad_halv_mask/msk_half_mask"
	self.masks.half_mask.name_id = "bm_msk_andromeda"
	self.masks.half_mask.pcs = {}
	self.masks.half_mask.value = 0
	self.masks.half_mask.type = "helmet"
	self.masks.half_mask.skip_mask_on_sequence = true
	self.masks.half_mask.texture_bundle_folder = "mad"
	self.masks.half_mask.sort_number = 17
	self.masks.visor = {}
	self.masks.visor.unit = "units/pd2_dlc_mad/masks/mad_helmet_mask/msk_visor"
	self.masks.visor.name_id = "bm_msk_visor"
	self.masks.visor.pcs = {}
	self.masks.visor.value = 0
	self.masks.visor.type = "helmet"
	self.masks.visor.texture_bundle_folder = "mad"
	self.masks.visor.sort_number = 17
	self.masks.mad_goggles = {}
	self.masks.mad_goggles.unit = "units/pd2_dlc_mad/masks/mad_goggles/msk_mad_goggles"
	self.masks.mad_goggles.name_id = "bm_msk_goggles"
	self.masks.mad_goggles.pcs = {}
	self.masks.mad_goggles.value = 0
	self.masks.mad_goggles.type = "helmet"
	self.masks.mad_goggles.texture_bundle_folder = "mad"
	self.masks.mad_goggles.sort_number = 17
	self.masks.mad_goggles.night_vision = {
		effect = "color_night_vision_blue",
		light = not _G.IS_VR and 0.3 or 0.1
	}
	self.masks.mad_mask = {}
	self.masks.mad_mask.unit = "units/pd2_dlc_mad/masks/mad_mask/msk_mad_mask"
	self.masks.mad_mask.name_id = "bm_msk_mad_mask"
	self.masks.mad_mask.pcs = {}
	self.masks.mad_mask.value = 0
	self.masks.mad_mask.texture_bundle_folder = "mad"
	self.masks.mad_mask.sort_number = 17
	self.masks.dbd_01 = {}
	self.masks.dbd_01.unit = "units/pd2_dlc_boo_1/masks/msk_dbd_01"
	self.masks.dbd_01.name_id = "bm_msk_dbd_01"
	self.masks.dbd_01.pcs = {}
	self.masks.dbd_01.value = 0
	self.masks.dbd_01.type = "helmet"
	self.masks.dbd_01.texture_bundle_folder = "boo_1"
	self.masks.dbd_01.dlc = "dbd_clan"
	self.masks.dbd_01.sort_number = 18
	self.masks.dbd_02 = {}
	self.masks.dbd_02.unit = "units/pd2_dlc_boo_2/masks/msk_dbd_02"
	self.masks.dbd_02.name_id = "bm_msk_dbd_02"
	self.masks.dbd_02.pcs = {}
	self.masks.dbd_02.value = 0
	self.masks.dbd_02.texture_bundle_folder = "boo_2"
	self.masks.dbd_02.dlc = "dbd_deluxe"
	self.masks.dbd_02.sort_number = 18
	self.masks.dbd_03 = {}
	self.masks.dbd_03.unit = "units/pd2_dlc_boo_3/masks/msk_dbd_03"
	self.masks.dbd_03.name_id = "bm_msk_dbd_03"
	self.masks.dbd_03.pcs = {}
	self.masks.dbd_03.value = 0
	self.masks.dbd_03.texture_bundle_folder = "boo_3"
	self.masks.dbd_03.dlc = "dbd_deluxe"
	self.masks.dbd_03.sort_number = 18
	self.masks.dbd_04 = {}
	self.masks.dbd_04.unit = "units/pd2_dlc_boo/masks/dbd_04/msk_boo_dbd_04"
	self.masks.dbd_04.name_id = "bm_msk_dbd_00"
	self.masks.dbd_04.pcs = {}
	self.masks.dbd_04.value = 0
	self.masks.dbd_04.texture_bundle_folder = "boo"
	self.masks.dbd_04.dlc = "dbd_clan"
	self.masks.dbd_04.sort_number = 18
	self.masks.dbd_slasher = {}
	self.masks.dbd_slasher.unit = "units/pd2_dlc_boo_4/masks/msk_dbd_slasher"
	self.masks.dbd_slasher.name_id = "bm_msk_dbd_04"
	self.masks.dbd_slasher.pcs = {}
	self.masks.dbd_slasher.value = 0
	self.masks.dbd_slasher.type = "helmet"
	self.masks.dbd_slasher.texture_bundle_folder = "boo_4"
	self.masks.dbd_slasher.dlc = "dbd_clan"
	self.masks.dbd_slasher.sort_number = 18
	self.masks.sydney = {}
	self.masks.sydney.unit = "units/pd2_dlc_opera/masks/sydney/msk_sydney"
	self.masks.sydney.name_id = "bm_msk_sydney"
	self.masks.sydney.pcs = {}
	self.masks.sydney.value = 0
	self.masks.sydney.dlc = "opera"
	self.masks.sydney.texture_bundle_folder = "opera"
	self.masks.sydney.sort_number = 19
	self.masks.sydney_begins = {}
	self.masks.sydney_begins.unit = "units/pd2_dlc_opera/masks/sydney_begins/msk_sydney_begins"
	self.masks.sydney_begins.name_id = "bm_msk_sydney_begins"
	self.masks.sydney_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.sydney_begins.value = 0
	self.masks.sydney_begins.dlc = "opera"
	self.masks.sydney_begins.texture_bundle_folder = "opera"
	self.masks.sydney_begins.sort_number = 19
	self.masks.jig_01 = {}
	self.masks.jig_01.unit = "units/pd2_dlc_jigg/masks/mask_jigg_01/msk_jig_01"
	self.masks.jig_01.name_id = "bm_msk_jig_01"
	self.masks.jig_01.value = 0
	self.masks.jig_01.texture_bundle_folder = "jigg"
	self.masks.jig_01.dlc = "jigg"
	self.masks.jig_01.sort_number = 20
	self.masks.jig_02 = {}
	self.masks.jig_02.unit = "units/pd2_dlc_jigg/masks/mask_jigg_02/msk_jig_02"
	self.masks.jig_02.name_id = "bm_msk_jig_02"
	self.masks.jig_02.value = 0
	self.masks.jig_02.texture_bundle_folder = "jigg"
	self.masks.jig_02.type = "helmet"
	self.masks.jig_02.dlc = "jigg"
	self.masks.jig_02.sort_number = 20
	self.masks.damned = {}
	self.masks.damned.unit = "units/pd2_dlc_jigg/masks/damned/msk_damned"
	self.masks.damned.name_id = "bm_msk_damned"
	self.masks.damned.value = 0
	self.masks.damned.texture_bundle_folder = "jigg"
	self.masks.damned.dlc = "jigg"
	self.masks.damned.sort_number = 20
	self.masks.born_biker_01 = {}
	self.masks.born_biker_01.unit = "units/pd2_dlc_born/masks/born_01/msk_born_biker_01"
	self.masks.born_biker_01.name_id = "bm_msk_biker_classic"
	self.masks.born_biker_01.pcs = {}
	self.masks.born_biker_01.value = 0
	self.masks.born_biker_01.type = "helmet"
	self.masks.born_biker_01.texture_bundle_folder = "born"
	self.masks.born_biker_01.sort_number = 21
	self.masks.born_biker_01.dlc = "born"
	self.masks.born_biker_02 = {}
	self.masks.born_biker_02.unit = "units/pd2_dlc_born/masks/born_02/msk_born_biker_02"
	self.masks.born_biker_02.name_id = "bm_msk_speed_demon"
	self.masks.born_biker_02.pcs = {}
	self.masks.born_biker_02.value = 0
	self.masks.born_biker_02.texture_bundle_folder = "born"
	self.masks.born_biker_02.sort_number = 21
	self.masks.born_biker_02.dlc = "born"
	self.masks.born_biker_03 = {}
	self.masks.born_biker_03.unit = "units/pd2_dlc_born/masks/born_03/msk_born_biker_03"
	self.masks.born_biker_03.name_id = "bm_msk_rage_demon"
	self.masks.born_biker_03.pcs = {}
	self.masks.born_biker_03.value = 0
	self.masks.born_biker_03.type = "helmet"
	self.masks.born_biker_03.texture_bundle_folder = "born"
	self.masks.born_biker_03.sort_number = 21
	self.masks.born_biker_03.dlc = "born"
	self.masks.born_biker_03.offsets = {
		joy = {
			Vector3(0, -0.637965, 0.435252),
			Rotation(-0.30048, -8.88622, -1.66753e-09)
		}
	}
	self.masks.brutal = {}
	self.masks.brutal.unit = "units/pd2_dlc_born/masks/brutal/msk_brutal"
	self.masks.brutal.name_id = "bm_msk_brutal"
	self.masks.brutal.pcs = {}
	self.masks.brutal.value = 0
	self.masks.brutal.texture_bundle_folder = "born"
	self.masks.brutal.sort_number = 21
	self.masks.brutal.dlc = "born"
	self.masks.rust = {}
	self.masks.rust.unit = "units/pd2_dlc_wild/masks/rust/msk_rust"
	self.masks.rust.name_id = "bm_msk_rust"
	self.masks.rust.pcs = {}
	self.masks.rust.value = 0
	self.masks.rust.texture_bundle_folder = "wild"
	self.masks.rust.sort_number = 22
	self.masks.rust.dlc = "wild"
	self.masks.rust_begins = {}
	self.masks.rust_begins.unit = "units/pd2_dlc_wild/masks/rust_begins/msk_rust_begins"
	self.masks.rust_begins.name_id = "bm_msk_rust_begins"
	self.masks.rust_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rust_begins.value = 0
	self.masks.rust_begins.texture_bundle_folder = "wild"
	self.masks.rust_begins.sort_number = 22
	self.masks.rust_begins.dlc = "wild"
	self.masks.fab_mega_grin = {}
	self.masks.fab_mega_grin.unit = "units/pd2_dlc_fab/masks/mega_grin/msk_fab_mega_grin"
	self.masks.fab_mega_grin.name_id = "bm_msk_mega_grin"
	self.masks.fab_mega_grin.value = 0
	self.masks.fab_mega_grin.texture_bundle_folder = "fab"
	self.masks.fab_mega_grin.dlc = "complete_overkill_pack"
	self.masks.fab_mega_doctor = {}
	self.masks.fab_mega_doctor.unit = "units/pd2_dlc_fab/masks/mega_doctor/msk_fab_mega_doctor"
	self.masks.fab_mega_doctor.name_id = "bm_msk_mega_doctor"
	self.masks.fab_mega_doctor.value = 0
	self.masks.fab_mega_doctor.texture_bundle_folder = "fab"
	self.masks.fab_mega_doctor.dlc = "complete_overkill_pack"
	self.masks.fab_mega_alien = {}
	self.masks.fab_mega_alien.unit = "units/pd2_dlc_fab/masks/mega_alien/msk_fab_mega_alien"
	self.masks.fab_mega_alien.name_id = "bm_msk_mega_alien"
	self.masks.fab_mega_alien.value = 0
	self.masks.fab_mega_alien.texture_bundle_folder = "fab"
	self.masks.fab_mega_alien.dlc = "complete_overkill_pack"
	self.masks.cop_mega_gage_blade = {}
	self.masks.cop_mega_gage_blade.unit = "units/pd2_dlc_fab/masks/cop_mega_gage_blade/msk_cop_mega_gage_blade"
	self.masks.cop_mega_gage_blade.name_id = "bm_msk_mega_blade"
	self.masks.cop_mega_gage_blade.value = 0
	self.masks.cop_mega_gage_blade.texture_bundle_folder = "fab"
	self.masks.cop_mega_gage_blade.dlc = "complete_overkill_pack"
	self.masks.fab_mega_mark = {}
	self.masks.fab_mega_mark.unit = "units/pd2_dlc_fab/masks/mega_bear/msk_fab_mega_mark"
	self.masks.fab_mega_mark.name_id = "bm_msk_mega_mark"
	self.masks.fab_mega_mark.value = 0
	self.masks.fab_mega_mark.texture_bundle_folder = "fab"
	self.masks.fab_mega_mark.dlc = "complete_overkill_pack"
	self.masks.solus = {}
	self.masks.solus.unit = "units/pd2_dlc_solus/masks/msk_solus"
	self.masks.solus.name_id = "bm_msk_solus"
	self.masks.solus.pcs = {}
	self.masks.solus.value = 0
	self.masks.solus.texture_bundle_folder = "solus"
	self.masks.solus.sort_number = 23
	self.masks.solus.global_value = "solus_clan"
	self.masks.solus.dlc = "solus_clan"
	self.masks.mig_death = {}
	self.masks.mig_death.unit = "units/pd2_dlc_migg/masks/migg_death/msk_mig_death"
	self.masks.mig_death.name_id = "bm_msk_death_rider"
	self.masks.mig_death.pcs = {}
	self.masks.mig_death.value = 0
	self.masks.mig_death.texture_bundle_folder = "migg"
	self.masks.mig_death.sort_number = 24
	self.masks.mig_death.dlc = "pd2_clan"
	self.masks.mig_war = {}
	self.masks.mig_war.unit = "units/pd2_dlc_migg/masks/migg_war/msk_mig_war"
	self.masks.mig_war.name_id = "bm_msk_war"
	self.masks.mig_war.pcs = {}
	self.masks.mig_war.value = 0
	self.masks.mig_war.type = "helmet"
	self.masks.mig_war.texture_bundle_folder = "migg"
	self.masks.mig_war.sort_number = 24
	self.masks.mig_war.dlc = "pd2_clan"
	self.masks.mig_conquest = {}
	self.masks.mig_conquest.unit = "units/pd2_dlc_migg/masks/migg_conquest/msk_mig_conquest"
	self.masks.mig_conquest.name_id = "bm_msk_conquest"
	self.masks.mig_conquest.pcs = {}
	self.masks.mig_conquest.value = 0
	self.masks.mig_conquest.texture_bundle_folder = "migg"
	self.masks.mig_conquest.sort_number = 24
	self.masks.mig_conquest.dlc = "pd2_clan"
	self.masks.mig_famine = {}
	self.masks.mig_famine.unit = "units/pd2_dlc_migg/masks/migg_famine/msk_mig_famine"
	self.masks.mig_famine.name_id = "bm_msk_famine"
	self.masks.mig_famine.pcs = {}
	self.masks.mig_famine.value = 0
	self.masks.mig_famine.texture_bundle_folder = "migg"
	self.masks.mig_famine.sort_number = 24
	self.masks.mig_famine.dlc = "pd2_clan"
	self.masks.fib_fox = {}
	self.masks.fib_fox.unit = "units/pd2_dlc_fibb/masks/fib_fox_mask/msk_fib_fox"
	self.masks.fib_fox.name_id = "bm_msk_fable_fox"
	self.masks.fib_fox.pcs = {}
	self.masks.fib_fox.value = 0
	self.masks.fib_fox.texture_bundle_folder = "fibb"
	self.masks.fib_fox.sort_number = 25
	self.masks.fib_fox.dlc = "pd2_clan"
	self.masks.fib_cat = {}
	self.masks.fib_cat.unit = "units/pd2_dlc_fibb/masks/fib_cat_mask/msk_fib_cat"
	self.masks.fib_cat.name_id = "bm_msk_fable_cat"
	self.masks.fib_cat.pcs = {}
	self.masks.fib_cat.value = 0
	self.masks.fib_cat.texture_bundle_folder = "fibb"
	self.masks.fib_cat.sort_number = 25
	self.masks.fib_cat.dlc = "pd2_clan"
	self.masks.fib_mouse = {}
	self.masks.fib_mouse.unit = "units/pd2_dlc_fibb/masks/fib_mouse_mask/msk_fib_mouse"
	self.masks.fib_mouse.name_id = "bm_msk_fable_mouse"
	self.masks.fib_mouse.pcs = {}
	self.masks.fib_mouse.value = 0
	self.masks.fib_mouse.texture_bundle_folder = "fibb"
	self.masks.fib_mouse.sort_number = 25
	self.masks.fib_mouse.dlc = "pd2_clan"
	self.masks.fib_hare = {}
	self.masks.fib_hare.unit = "units/pd2_dlc_fibb/masks/fib_hare_mask/msk_fib_hare"
	self.masks.fib_hare.name_id = "bm_msk_fable_hare"
	self.masks.fib_hare.pcs = {}
	self.masks.fib_hare.value = 0
	self.masks.fib_hare.texture_bundle_folder = "fibb"
	self.masks.fib_hare.sort_number = 25
	self.masks.fib_hare.dlc = "pd2_clan"
	self.masks.pim_dog = {}
	self.masks.pim_dog.unit = "units/pd2_dlc_pim/masks/pim_dog_mask/msk_pim_dog"
	self.masks.pim_dog.name_id = "bm_msk_pim_daisy"
	self.masks.pim_dog.pcs = {}
	self.masks.pim_dog.value = 0
	self.masks.pim_dog.texture_bundle_folder = "pim"
	self.masks.pim_dog.sort_number = 26
	self.masks.pim_dog.dlc = "pim"
	self.masks.pim_russian_ballistic = {}
	self.masks.pim_russian_ballistic.unit = "units/pd2_dlc_pim/masks/pim_russian_ballistic_mask/msk_pim_russian_ballistic"
	self.masks.pim_russian_ballistic.name_id = "bm_msk_pim_dirty_russian"
	self.masks.pim_russian_ballistic.pcs = {}
	self.masks.pim_russian_ballistic.value = 0
	self.masks.pim_russian_ballistic.texture_bundle_folder = "pim"
	self.masks.pim_russian_ballistic.sort_number = 26
	self.masks.pim_russian_ballistic.dlc = "pim"
	self.masks.pim_hotelier = {}
	self.masks.pim_hotelier.unit = "units/pd2_dlc_pim/masks/pim_hotelier_mask/msk_pim_hotelier"
	self.masks.pim_hotelier.name_id = "bm_msk_pim_hotelier"
	self.masks.pim_hotelier.pcs = {}
	self.masks.pim_hotelier.value = 0
	self.masks.pim_hotelier.texture_bundle_folder = "pim"
	self.masks.pim_hotelier.sort_number = 26
	self.masks.pim_hotelier.dlc = "pim"
	self.masks.pim_mustang = {}
	self.masks.pim_mustang.unit = "units/pd2_dlc_pim/masks/pim_mustang_mask/msk_pim_mustang"
	self.masks.pim_mustang.name_id = "bm_msk_pim_mustang"
	self.masks.pim_mustang.pcs = {}
	self.masks.pim_mustang.value = 0
	self.masks.pim_mustang.type = "helmet"
	self.masks.pim_mustang.texture_bundle_folder = "pim"
	self.masks.pim_mustang.sort_number = 26
	self.masks.pim_mustang.dlc = "pim"
	self.masks.nyck_cap = {}
	self.masks.nyck_cap.unit = "units/pd2_crimefest_2016/nyck/masks/nyck_cap_mask/msk_nck_cap"
	self.masks.nyck_cap.name_id = "bm_jar_head"
	self.masks.nyck_cap.pcs = {}
	self.masks.nyck_cap.value = 0
	self.masks.nyck_cap.type = "tiara"
	self.masks.nyck_cap.texture_bundle_folder = "nyck"
	self.masks.nyck_cap.sort_number = 27
	self.masks.nyck_ace = {}
	self.masks.nyck_ace.unit = "units/pd2_crimefest_2016/nyck/masks/nyck_ace_mask/msk_nck_ace"
	self.masks.nyck_ace.name_id = "bm_ace"
	self.masks.nyck_ace.pcs = {}
	self.masks.nyck_ace.value = 0
	self.masks.nyck_ace.type = "helmet"
	self.masks.nyck_ace.texture_bundle_folder = "nyck"
	self.masks.nyck_ace.sort_number = 27
	self.masks.nyck_beret = {}
	self.masks.nyck_beret.unit = "units/pd2_crimefest_2016/nyck/masks/nyck_beret_mask/msk_nck_beret"
	self.masks.nyck_beret.name_id = "bm_beret"
	self.masks.nyck_beret.pcs = {}
	self.masks.nyck_beret.value = 0
	self.masks.nyck_beret.type = "tiara"
	self.masks.nyck_beret.texture_bundle_folder = "nyck"
	self.masks.nyck_beret.sort_number = 27
	self.masks.nyck_beret.offsets = {
		joy = {
			Vector3(0.316008, 1.86621, 0.316008),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.nyck_pickle = {}
	self.masks.nyck_pickle.unit = "units/pd2_crimefest_2016/nyck/masks/nyck_pickle_mask/msk_nck_pickle"
	self.masks.nyck_pickle.name_id = "bm_mr_pickle"
	self.masks.nyck_pickle.pcs = {}
	self.masks.nyck_pickle.value = 0
	self.masks.nyck_pickle.texture_bundle_folder = "nyck"
	self.masks.nyck_pickle.sort_number = 27
	self.masks.spk_party = {}
	self.masks.spk_party.unit = "units/pd2_dlc_sparkle/masks/sparkle_party/msk_spk_party"
	self.masks.spk_party.name_id = "bm_sparkle_party"
	self.masks.spk_party.pcs = {}
	self.masks.spk_party.value = 0
	self.masks.spk_party.type = "tiara"
	self.masks.spk_party.texture_bundle_folder = "sparkle"
	self.masks.spk_party.skip_mask_on_sequence = true
	self.masks.spk_party.sort_number = 28
	self.masks.spk_party.dlc = "sparkle"
	self.masks.spk_party.offsets = {
		sydney = {
			Vector3(-0.876458, -3.14214, 7.23229),
			Rotation(0, -27.7748, 0)
		},
		dragon = {
			Vector3(-0.637965, -2.30741, 2.22395),
			Rotation(0, -8.02764, 0)
		},
		female_1 = {
			Vector3(-0.995704, -0.399472, 0.673745),
			Rotation(0, 0, -0)
		},
		hoxton = {
			Vector3(-0.995704, -1.83043, 0.316006),
			Rotation(0, 0, -0)
		},
		sokol = {
			Vector3(0.316006, -2.66515, 0),
			Rotation(0, 0, -0)
		},
		wolf = {
			Vector3(-0.637965, -2.42666, 2.46244),
			Rotation(0, -13.1791, 0)
		},
		bodhi = {
			Vector3(-0.876458, -1.59194, 1.50847),
			Rotation(0, -7.16907, 0)
		},
		jimmy = {
			Vector3(0, 0.792991, 0),
			Rotation(0, 0, -0)
		},
		jacket = {
			Vector3(-0.0417333, -0.995704, 0.196759),
			Rotation(0, 10.861, 0)
		},
		dallas = {
			Vector3(-1.11495, -1.11495, 0),
			Rotation(0, 2.27524, 0)
		},
		joy = {
			Vector3(0.196759, 0.554498, 0),
			Rotation(0, 0, -0)
		},
		bonnie = {
			Vector3(-1.47269, -1.71118, 4.60887),
			Rotation(0, -20.9063, 0)
		},
		chains = {
			Vector3(-0.637965, -1.35344, -2.42666),
			Rotation(0, 16.871, 0)
		},
		old_hoxton = {
			Vector3(-0.637965, -2.06892, 0),
			Rotation(0, 0, -0)
		},
		wild = {
			Vector3(-4.21536, -2.18817, 0.673745),
			Rotation(-14.0377, -9.74479, 15.1538)
		},
		ecp_female = {
			Vector3(-0.757211, -2.18817, 3.05867),
			Rotation(0, -15.7548, 0)
		},
		ecp_male = {
			Vector3(0, -1.83043, 1.03148),
			Rotation(0, 0, -0)
		},
		max = {
			Vector3(-0.637965, -1.59194, 0.435252),
			Rotation(0, -4.59335, 0)
		},
		chico = {
			Vector3(-0.399472, -3.26138, 4.48963),
			Rotation(0, -21.7648, 0)
		},
		myh = {
			Vector3(-0.876458, -2.18817, 0),
			Rotation(0, -2.01763, 0)
		},
		jowi = {
			Vector3(-0.399472, -1.71118, 1.38922),
			Rotation(0, 0, -0)
		},
		dragan = {
			Vector3(-0.399472, -2.18817, 2.70093),
			Rotation(0, -11.4619, 0)
		}
	}
	self.masks.gti_al_capone = {}
	self.masks.gti_al_capone.unit = "units/pd2_dlc_gotti/masks/al_capone/msk_gti_al_capone"
	self.masks.gti_al_capone.name_id = "bm_al_pacino"
	self.masks.gti_al_capone.pcs = {}
	self.masks.gti_al_capone.value = 0
	self.masks.gti_al_capone.texture_bundle_folder = "gotti"
	self.masks.gti_al_capone.sort_number = 29
	self.masks.gti_bugsy = {}
	self.masks.gti_bugsy.unit = "units/pd2_dlc_gotti/masks/bugsy/msk_gti_bugsy"
	self.masks.gti_bugsy.name_id = "bm_bugsy"
	self.masks.gti_bugsy.pcs = {}
	self.masks.gti_bugsy.value = 0
	self.masks.gti_bugsy.texture_bundle_folder = "gotti"
	self.masks.gti_bugsy.sort_number = 29
	self.masks.gti_madame_st_claire = {}
	self.masks.gti_madame_st_claire.unit = "units/pd2_dlc_gotti/masks/madame/msk_gti_madame_st_claire"
	self.masks.gti_madame_st_claire.name_id = "bm_madame_st_claire"
	self.masks.gti_madame_st_claire.pcs = {}
	self.masks.gti_madame_st_claire.value = 0
	self.masks.gti_madame_st_claire.texture_bundle_folder = "gotti"
	self.masks.gti_madame_st_claire.sort_number = 29
	self.masks.gti_lucky_luciano = {}
	self.masks.gti_lucky_luciano.unit = "units/pd2_dlc_gotti/masks/lucky_luciano/msk_gti_lucky_luciano"
	self.masks.gti_lucky_luciano.name_id = "bm_lucky_luciano"
	self.masks.gti_lucky_luciano.pcs = {}
	self.masks.gti_lucky_luciano.value = 0
	self.masks.gti_lucky_luciano.texture_bundle_folder = "gotti"
	self.masks.gti_lucky_luciano.sort_number = 29
	self.masks.urf_seal = {}
	self.masks.urf_seal.unit = "units/pd2_dlc_urf/masks/msk_urf_seal"
	self.masks.urf_seal.name_id = "bm_sad_seal"
	self.masks.urf_seal.pcs = {}
	self.masks.urf_seal.value = 0
	self.masks.urf_seal.texture_bundle_folder = "urf"
	self.masks.urf_seal.sort_number = 31
	self.masks.hwl_dallas_zombie = {}
	self.masks.hwl_dallas_zombie.unit = "units/pd2_dlc_howl/masks/dallas_zombie/msk_hwl_dallas_zombie"
	self.masks.hwl_dallas_zombie.name_id = "bm_dallas_rising"
	self.masks.hwl_dallas_zombie.pcs = {}
	self.masks.hwl_dallas_zombie.value = 0
	self.masks.hwl_dallas_zombie.texture_bundle_folder = "howl"
	self.masks.hwl_dallas_zombie.sort_number = 32
	self.masks.hwl_dallas_zombie.global_value = "halloween"
	self.masks.hwl_wolf_zombie = {}
	self.masks.hwl_wolf_zombie.unit = "units/pd2_dlc_howl/masks/wolf_zombie/msk_hwl_wolf_zombie"
	self.masks.hwl_wolf_zombie.name_id = "bm_wolf_rising"
	self.masks.hwl_wolf_zombie.pcs = {}
	self.masks.hwl_wolf_zombie.value = 0
	self.masks.hwl_wolf_zombie.texture_bundle_folder = "howl"
	self.masks.hwl_wolf_zombie.sort_number = 32
	self.masks.hwl_wolf_zombie.global_value = "halloween"
	self.masks.hwl_hoxton_zombie = {}
	self.masks.hwl_hoxton_zombie.unit = "units/pd2_dlc_howl/masks/hoxton_zombie/msk_hwl_hoxton_zombie"
	self.masks.hwl_hoxton_zombie.name_id = "bm_hoxton_rising"
	self.masks.hwl_hoxton_zombie.pcs = {}
	self.masks.hwl_hoxton_zombie.value = 0
	self.masks.hwl_hoxton_zombie.texture_bundle_folder = "howl"
	self.masks.hwl_hoxton_zombie.sort_number = 32
	self.masks.hwl_hoxton_zombie.global_value = "halloween"
	self.masks.howl_chains_zombie = {}
	self.masks.howl_chains_zombie.unit = "units/pd2_dlc_howl/masks/chains_zombie/msk_howl_chains_zombie"
	self.masks.howl_chains_zombie.name_id = "bm_chains_rising"
	self.masks.howl_chains_zombie.pcs = {}
	self.masks.howl_chains_zombie.value = 0
	self.masks.howl_chains_zombie.texture_bundle_folder = "howl"
	self.masks.howl_chains_zombie.sort_number = 32
	self.masks.howl_chains_zombie.global_value = "halloween"
	self.masks.pdc16_clover = {}
	self.masks.pdc16_clover.unit = "units/pd2_dlc_paydaycon2016/masks/msk_pdc16_clover"
	self.masks.pdc16_clover.name_id = "bm_mega_clover"
	self.masks.pdc16_clover.pcs = {}
	self.masks.pdc16_clover.value = 0
	self.masks.pdc16_clover.texture_bundle_folder = "pdc16"
	self.masks.pdc16_clover.sort_number = 33
	self.masks.pdc16_clover.global_value = "pdcon_2016"
	self.masks.pdc16_clover.dlc = "pdcon_2016"
	self.masks.win_donald = {}
	self.masks.win_donald.unit = "units/pd2_dlc_win/masks/msk_win_donald/msk_win_donald"
	self.masks.win_donald.name_id = "bm_donald"
	self.masks.win_donald.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.win_donald.value = 0
	self.masks.win_donald.texture_bundle_folder = "win"
	self.masks.win_donald.sort_number = 34
	self.masks.win_donald_mega = {}
	self.masks.win_donald_mega.unit = "units/pd2_dlc_win/masks/msk_win_donald_mega/msk_win_donald_mega"
	self.masks.win_donald_mega.name_id = "bm_donald_mega"
	self.masks.win_donald_mega.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.win_donald_mega.value = 0
	self.masks.win_donald_mega.texture_bundle_folder = "win"
	self.masks.win_donald_mega.sort_number = 34
	self.masks.tng_bandana = {}
	self.masks.tng_bandana.unit = "units/pd2_dlc_tng/masks/tng_bandana/msk_tng_bandana"
	self.masks.tng_bandana.name_id = "bm_bandana"
	self.masks.tng_bandana.pcs = {}
	self.masks.tng_bandana.value = 0
	self.masks.tng_bandana.type = "tiara"
	self.masks.tng_bandana.texture_bundle_folder = "tng"
	self.masks.tng_bandana.sort_number = 35
	self.masks.tng_bandana.skip_mask_on_sequence = true
	self.masks.tng_bandana.dlc = "tango"
	self.masks.tng_bandana.offsets = {
		joy = {
			Vector3(0.0775149, 0, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.tng_cloaker = {}
	self.masks.tng_cloaker.unit = "units/pd2_dlc_tng/masks/tng_cloaker/msk_tng_cloaker"
	self.masks.tng_cloaker.name_id = "bm_cloaker"
	self.masks.tng_cloaker.pcs = {}
	self.masks.tng_cloaker.value = 0
	self.masks.tng_cloaker.type = "helmet"
	self.masks.tng_cloaker.texture_bundle_folder = "tng"
	self.masks.tng_cloaker.sort_number = 35
	self.masks.tng_cloaker.dlc = "tango"
	self.masks.tng_cloaker.night_vision = {
		effect = "color_night_vision",
		light = not _G.IS_VR and 0.3 or 0.1
	}
	self.masks.tng_zeal_swat_mask = {}
	self.masks.tng_zeal_swat_mask.unit = "units/pd2_dlc_tng/masks/tng_zeal_swat_mask/msk_tng_zeal_swat_mask"
	self.masks.tng_zeal_swat_mask.name_id = "bm_zeal_mask"
	self.masks.tng_zeal_swat_mask.pcs = {}
	self.masks.tng_zeal_swat_mask.value = 0
	self.masks.tng_zeal_swat_mask.type = "helmet"
	self.masks.tng_zeal_swat_mask.texture_bundle_folder = "tng"
	self.masks.tng_zeal_swat_mask.sort_number = 35
	self.masks.tng_zeal_swat_mask.dlc = "tango"
	self.masks.tng_cap = {}
	self.masks.tng_cap.unit = "units/pd2_dlc_tng/masks/tng_cap/msk_tng_cap"
	self.masks.tng_cap.name_id = "bm_cap_n_beard"
	self.masks.tng_cap.pcs = {}
	self.masks.tng_cap.value = 0
	self.masks.tng_cap.type = "helmet"
	self.masks.tng_cap.texture_bundle_folder = "tng"
	self.masks.tng_cap.sort_number = 35
	self.masks.tng_cap.dlc = "tango"
	self.masks.tng_cap.offsets = {
		joy = {
			Vector3(0, -0.280226, 0.912237),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.moon_paycheck_dallas = {}
	self.masks.moon_paycheck_dallas.unit = "units/pd2_dlc_moon/masks/paycheck_dallas/msk_moon_paycheck_dallas"
	self.masks.moon_paycheck_dallas.name_id = "bm_paycheck_dallas"
	self.masks.moon_paycheck_dallas.pcs = {}
	self.masks.moon_paycheck_dallas.value = 0
	self.masks.moon_paycheck_dallas.texture_bundle_folder = "moon"
	self.masks.moon_paycheck_dallas.sort_number = 36
	self.masks.moon_paycheck_chains = {}
	self.masks.moon_paycheck_chains.unit = "units/pd2_dlc_moon/masks/paycheck_chains/msk_moon_paycheck_chains"
	self.masks.moon_paycheck_chains.name_id = "bm_paycheck_chains"
	self.masks.moon_paycheck_chains.pcs = {}
	self.masks.moon_paycheck_chains.value = 0
	self.masks.moon_paycheck_chains.texture_bundle_folder = "moon"
	self.masks.moon_paycheck_chains.sort_number = 36
	self.masks.sfm_01 = {}
	self.masks.sfm_01.unit = "units/pd2_dlc_friend/masks/sfm_01/msk_sfm_01"
	self.masks.sfm_01.name_id = "bm_sfm_01"
	self.masks.sfm_01.pcs = {}
	self.masks.sfm_01.value = 0
	self.masks.sfm_01.texture_bundle_folder = "friend"
	self.masks.sfm_01.sort_number = 37
	self.masks.sfm_01.dlc = "friend"
	self.masks.sfm_02 = {}
	self.masks.sfm_02.unit = "units/pd2_dlc_friend/masks/sfm_02/msk_sfm_02"
	self.masks.sfm_02.name_id = "bm_sfm_02"
	self.masks.sfm_02.pcs = {}
	self.masks.sfm_02.value = 0
	self.masks.sfm_02.texture_bundle_folder = "friend"
	self.masks.sfm_02.sort_number = 37
	self.masks.sfm_02.dlc = "friend"
	self.masks.sfm_03 = {}
	self.masks.sfm_03.unit = "units/pd2_dlc_friend/masks/sfm_03/msk_sfm_03"
	self.masks.sfm_03.name_id = "bm_sfm_03"
	self.masks.sfm_03.pcs = {}
	self.masks.sfm_03.value = 0
	self.masks.sfm_03.texture_bundle_folder = "friend"
	self.masks.sfm_03.type = "glasses"
	self.masks.sfm_03.skip_mask_on_sequence = true
	self.masks.sfm_03.sort_number = 37
	self.masks.sfm_03.dlc = "friend"
	self.masks.sfm_04 = {}
	self.masks.sfm_04.unit = "units/pd2_dlc_friend/masks/sfm_04/msk_sfm_04"
	self.masks.sfm_04.name_id = "bm_sfm_04"
	self.masks.sfm_04.pcs = {}
	self.masks.sfm_04.value = 0
	self.masks.sfm_04.texture_bundle_folder = "friend"
	self.masks.sfm_04.sort_number = 37
	self.masks.sfm_04.dlc = "friend"
	self.masks.chc_terry = {}
	self.masks.chc_terry.unit = "units/pd2_dlc_chico/masks/terry/msk_chc_terry"
	self.masks.chc_terry.name_id = "bm_msk_chico"
	self.masks.chc_terry.pcs = {}
	self.masks.chc_terry.value = 0
	self.masks.chc_terry.texture_bundle_folder = "chico"
	self.masks.chc_terry.sort_number = 38
	self.masks.chc_terry.dlc = "chico"
	self.masks.chc_terry_begins = {}
	self.masks.chc_terry_begins.unit = "units/pd2_dlc_chico/masks/terry_begins/msk_chc_terry_begins"
	self.masks.chc_terry_begins.name_id = "bm_msk_chico_begins"
	self.masks.chc_terry_begins.pcs = {}
	self.masks.chc_terry_begins.value = 0
	self.masks.chc_terry_begins.dlc = "chico"
	self.masks.chc_terry_begins.texture_bundle_folder = "chico"
	self.masks.chc_terry_begins.sort_number = 38
	self.masks.swm_sydney = {}
	self.masks.swm_sydney.unit = "units/pd2_dlc_swm/masks/msk_swm_sydney"
	self.masks.swm_sydney.name_id = "bm_msk_mega_sydney"
	self.masks.swm_sydney.pcs = {}
	self.masks.swm_sydney.value = 0
	self.masks.swm_sydney.texture_bundle_folder = "swm"
	self.masks.swm_sydney.sort_number = 39
	self.masks.swm_sydney.dlc = "swm"
	self.masks.swm_sydney.global_value = "swm"
	self.masks.sha_01 = {}
	self.masks.sha_01.unit = "units/pd2_dlc_sha/masks/sha_01/msk_sha_01"
	self.masks.sha_01.name_id = "bm_sha_01"
	self.masks.sha_01.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.sha_01.value = 0
	self.masks.sha_01.texture_bundle_folder = "sha"
	self.masks.sha_01.sort_number = 40
	self.masks.sha_01.dlc = "sha"
	self.masks.sha_01.global_value = "sha"
	self.masks.sha_02 = {}
	self.masks.sha_02.unit = "units/pd2_dlc_sha/masks/sha_02/msk_sha_02"
	self.masks.sha_02.name_id = "bm_sha_02"
	self.masks.sha_02.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.sha_02.value = 0
	self.masks.sha_02.texture_bundle_folder = "sha"
	self.masks.sha_02.sort_number = 40
	self.masks.sha_02.dlc = "sha"
	self.masks.sha_02.global_value = "sha"
	self.masks.sha_03 = {}
	self.masks.sha_03.unit = "units/pd2_dlc_sha/masks/sha_03/msk_sha_03"
	self.masks.sha_03.name_id = "bm_sha_03"
	self.masks.sha_03.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.sha_03.value = 0
	self.masks.sha_03.texture_bundle_folder = "sha"
	self.masks.sha_03.sort_number = 40
	self.masks.sha_03.dlc = "sha"
	self.masks.sha_03.global_value = "sha"
	self.masks.sha_04 = {}
	self.masks.sha_04.unit = "units/pd2_dlc_sha/masks/sha_04/msk_sha_04"
	self.masks.sha_04.name_id = "bm_sha_04"
	self.masks.sha_04.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.sha_04.value = 0
	self.masks.sha_04.texture_bundle_folder = "sha"
	self.masks.sha_04.sort_number = 40
	self.masks.sha_04.dlc = "sha"
	self.masks.sha_04.global_value = "sha"
	self.masks.spa_01 = {}
	self.masks.spa_01.unit = "units/pd2_dlc_spa/masks/spa_01/msk_spa_01"
	self.masks.spa_01.name_id = "bm_msk_spa_01"
	self.masks.spa_01.pcs = {}
	self.masks.spa_01.value = 0
	self.masks.spa_01.texture_bundle_folder = "spa"
	self.masks.spa_01.type = "helmet"
	self.masks.spa_01.sort_number = 41
	self.masks.spa_01.dlc = "spa"
	self.masks.spa_01.global_value = "spa"
	self.masks.spa_01.offsets = {
		joy = {
			Vector3(0, 1.38922, 0.316008),
			Rotation(0, -1.15904, 0)
		}
	}
	self.masks.spa_02 = {}
	self.masks.spa_02.unit = "units/pd2_dlc_spa/masks/spa_02/msk_spa_02"
	self.masks.spa_02.name_id = "bm_msk_spa_02"
	self.masks.spa_02.pcs = {}
	self.masks.spa_02.value = 0
	self.masks.spa_02.texture_bundle_folder = "spa"
	self.masks.spa_02.type = "helmet"
	self.masks.spa_02.sort_number = 41
	self.masks.spa_02.dlc = "spa"
	self.masks.spa_02.global_value = "spa"
	self.masks.spa_02.offsets = {
		jacket = {
			Vector3(0, -0.160978, -0.160978),
			Rotation(0, 0, -0)
		},
		dallas = {
			Vector3(0, -0.75721, -0.518717),
			Rotation(0, 0, -0)
		},
		joy = {
			Vector3(0, 0.196761, 0.0775149),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(-2.06892, -0.637963, 2.82018),
			Rotation(-10.6034, -14.0376, -1.06722e-07)
		},
		dragon = {
			Vector3(-0.160978, -0.399471, -0.280224),
			Rotation(0, 0, -0)
		},
		old_hoxton = {
			Vector3(0, -1.11495, -0.637963),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(-0.399471, 1.38922, -0.995702),
			Rotation(-0.300467, 5.70955, 1.41668)
		},
		hoxton = {
			Vector3(0, -0.995702, -0.0417315),
			Rotation(0, 0, -0)
		},
		sokol = {
			Vector3(0.0775149, -0.518717, -0.399471),
			Rotation(0, 0, -0)
		},
		chains = {
			Vector3(0, -0.876456, -0.518717),
			Rotation(0, 0, -0)
		},
		wolf = {
			Vector3(0, -0.637963, 0.196761),
			Rotation(0, 0, -0)
		},
		jowi = {
			Vector3(0, -1.2342, 0.0775149),
			Rotation(0, 0, -0)
		},
		chico = {
			Vector3(0.673747, -0.637963, -0.518717),
			Rotation(3.9924, 1.41668, 4.85098)
		},
		jimmy = {
			Vector3(0.0775149, 0.435254, -0.518717),
			Rotation(0, 0, -0)
		},
		bodhi = {
			Vector3(0, -0.518717, -0.399471),
			Rotation(0, 0, -0)
		},
		wild = {
			Vector3(0, -1.47269, -0.75721),
			Rotation(0, 0, -0)
		}
	}
	self.masks.spa_03 = {}
	self.masks.spa_03.unit = "units/pd2_dlc_spa/masks/spa_03/msk_spa_03"
	self.masks.spa_03.name_id = "bm_msk_spa_03"
	self.masks.spa_03.pcs = {}
	self.masks.spa_03.value = 0
	self.masks.spa_03.texture_bundle_folder = "spa"
	self.masks.spa_03.sort_number = 41
	self.masks.spa_03.dlc = "spa"
	self.masks.spa_03.global_value = "spa"
	self.masks.spa_04 = {}
	self.masks.spa_04.unit = "units/pd2_dlc_spa/masks/spa_04/msk_spa_04"
	self.masks.spa_04.name_id = "bm_msk_spa_04"
	self.masks.spa_04.pcs = {}
	self.masks.spa_04.value = 0
	self.masks.spa_04.texture_bundle_folder = "spa"
	self.masks.spa_04.sort_number = 41
	self.masks.spa_04.dlc = "spa"
	self.masks.spa_04.global_value = "spa"
	self.masks.yor = {}
	self.masks.yor.unit = "units/pd2_dlc_yor/masks/yor/msk_yor"
	self.masks.yor.name_id = "bm_msk_yor"
	self.masks.yor.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.yor.value = 0
	self.masks.yor.texture_bundle_folder = "yor"
	self.masks.yor.sort_number = 42
	self.masks.grv_01_bodhi = {}
	self.masks.grv_01_bodhi.unit = "units/pd2_dlc_grv/masks/grv_01/grv_01_bodhi/msk_grv_01_bodhi"
	self.masks.grv_01_bodhi.name_id = "bm_msk_cheat_error"
	self.masks.grv_01_bodhi.type = "helmet"
	self.masks.grv_01_bodhi.inaccessible = true
	self.masks.grv_01_bodhi.offsets = {
		dallas = {
			Vector3(0, -0.518717, 0.673747),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(-0.280224, -0.518717, 1.15073),
			Rotation(-0.300467, -0.300467, 0.558107)
		},
		dragon = {
			Vector3(-0.280224, 0.196761, 0.435254),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 0, 0.435254),
			Rotation(0, 2.27525, 0)
		},
		hoxton = {
			Vector3(0, -0.160978, 0.912239),
			Rotation(-0, -0, -0)
		},
		wild = {
			Vector3(0, -1.71118, 1.03149),
			Rotation(0, -6.31048, 0)
		},
		chains = {
			Vector3(-0.280224, -0.995702, 0.435254),
			Rotation(0, 0.558107, 0)
		},
		chico = {
			Vector3(-0.0417315, -0.518717, 0.912239),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, 0.196761, 0.0775149),
			Rotation(0, 3.9924, 0)
		},
		bodhi = {
			Vector3(0.196761, -0.280224, 0.5545),
			Rotation(-0, -0, -0)
		},
		dragan = {
			Vector3(0, -0.160978, 0.912239),
			Rotation(-0, -0, -0)
		},
		max = {
			Vector3(0, -0.160978, 0.912239),
			Rotation(-0, -0, -0)
		},
		joy = {
			Vector3(0, -0.16098, 1.26998),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.grv_01_bonnie = {}
	self.masks.grv_01_bonnie.unit = "units/pd2_dlc_grv/masks/grv_01/grv_01_bonnie/msk_grv_01_bonnie"
	self.masks.grv_01_bonnie.name_id = "bm_msk_cheat_error"
	self.masks.grv_01_bonnie.type = "helmet"
	self.masks.grv_01_bonnie.inaccessible = true
	self.masks.grv_01_bonnie.offsets = {
		jacket = {
			Vector3(0, 0, 0.196761),
			Rotation(-0, -0, -0)
		},
		wolf = {
			Vector3(0, -0.518717, 1.03149),
			Rotation(0, -1.15904, 0)
		},
		jowi = {
			Vector3(-0.160978, -0.160978, 0.792993),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(-0.0417315, 0.5545, -0.160978),
			Rotation(0, 2.27525, 0)
		},
		sokol = {
			Vector3(0, 0, 0.316008),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0.0775149, 0.673747, 0.435254),
			Rotation(-0, -0, -0)
		},
		myh = {
			Vector3(0, -0.637965, 0.196759),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.grv_01_ecp_male = {}
	self.masks.grv_01_ecp_male.unit = "units/pd2_dlc_ecp/masks/msk_grv_01_ecp_male/msk_grv_01_ecp_male"
	self.masks.grv_01_ecp_male.name_id = "bm_msk_cheat_error"
	self.masks.grv_01_ecp_male.type = "helmet"
	self.masks.grv_01_ecp_male.inaccessible = true
	self.masks.grv_01_ecp_male.offsets = {
		ecp_male = {
			Vector3(-0.280226, -2.90365, 1.74696),
			Rotation(-1.15905, -11.4619, 1.33402e-08)
		}
	}
	self.masks.grv_01_ecp_female = {}
	self.masks.grv_01_ecp_female.unit = "units/pd2_dlc_ecp/masks/msk_grv_01_ecp_female/msk_grv_01_ecp_female"
	self.masks.grv_01_ecp_female.name_id = "bm_msk_cheat_error"
	self.masks.grv_01_ecp_female.type = "helmet"
	self.masks.grv_01_ecp_female.inaccessible = true
	self.masks.grv_01_ecp_female.offsets = {
		ecp_female = {
			Vector3(0, -0.637965, 0.673745),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.grv_01 = {}
	self.masks.grv_01.name_id = "bm_msk_grv_01"
	self.masks.grv_01.value = 0
	self.masks.grv_01.pcs = {}
	self.masks.grv_01.type = "helmet"
	self.masks.grv_01.texture_bundle_folder = "grv"
	self.masks.grv_01.sort_number = 43
	self.masks.grv_01.dlc = "grv"
	self.masks.grv_01.global_value = "grv"
	self.masks.grv_01.characters = {
		bodhi = "grv_01_bodhi",
		bonnie = "grv_01_bonnie",
		chains = "grv_01_bodhi",
		chico = "grv_01_bodhi",
		dallas = "grv_01_bodhi",
		dragan = "grv_01_bodhi",
		dragon = "grv_01_bodhi",
		ecp_female = "grv_01_ecp_female",
		ecp_male = "grv_01_ecp_male",
		female_1 = "grv_01_bodhi",
		hoxton = "grv_01_bodhi",
		jacket = "grv_01_bonnie",
		jimmy = "grv_01_bonnie",
		jowi = "grv_01_bonnie",
		joy = "grv_01_bodhi",
		max = "grv_01_bodhi",
		myh = "grv_01_bonnie",
		old_hoxton = "grv_01_bodhi",
		sokol = "grv_01_bonnie",
		sydney = "grv_01_bodhi",
		wild = "grv_01_bodhi",
		wolf = "grv_01_bonnie"
	}
	self.masks.grv_02 = {}
	self.masks.grv_02.unit = "units/pd2_dlc_grv/masks/grv_02/msk_grv_02"
	self.masks.grv_02.name_id = "bm_msk_grv_02"
	self.masks.grv_02.pcs = {}
	self.masks.grv_02.value = 0
	self.masks.grv_02.texture_bundle_folder = "grv"
	self.masks.grv_02.sort_number = 43
	self.masks.grv_02.dlc = "grv"
	self.masks.grv_02.global_value = "grv"
	self.masks.grv_03 = {}
	self.masks.grv_03.unit = "units/pd2_dlc_grv/masks/grv_03/msk_grv_03"
	self.masks.grv_03.name_id = "bm_msk_grv_03"
	self.masks.grv_03.pcs = {}
	self.masks.grv_03.value = 0
	self.masks.grv_03.texture_bundle_folder = "grv"
	self.masks.grv_03.type = "tiara"
	self.masks.grv_03.skip_mask_on_sequence = true
	self.masks.grv_03.sort_number = 43
	self.masks.grv_03.dlc = "grv"
	self.masks.grv_03.global_value = "grv"
	self.masks.grv_04 = {}
	self.masks.grv_04.unit = "units/pd2_dlc_grv/masks/grv_04/msk_grv_04"
	self.masks.grv_04.name_id = "bm_msk_grv_04"
	self.masks.grv_04.pcs = {}
	self.masks.grv_04.value = 0
	self.masks.grv_04.type = "helmet"
	self.masks.grv_04.texture_bundle_folder = "grv"
	self.masks.grv_04.sort_number = 43
	self.masks.grv_04.dlc = "grv"
	self.masks.grv_04.offsets = {
		sydney = {
			Vector3(-0.0417333, -1.59194, 1.03148),
			Rotation(0, 0, -1.15905)
		},
		chains = {
			Vector3(0, -1.59194, 0.435252),
			Rotation(0, -3.73477, 0)
		},
		female_1 = {
			Vector3(0, -1.83043, 0.673745),
			Rotation(0, 0, -0)
		},
		hoxton = {
			Vector3(0, -2.30741, 1.38922),
			Rotation(0, -8.02764, 0)
		},
		wild = {
			Vector3(0, -1.83043, 0),
			Rotation(1.41667, -3.73477, -0)
		},
		wolf = {
			Vector3(0, -1.35344, 0.673745),
			Rotation(0, 0, -0)
		},
		bodhi = {
			Vector3(-0.399472, -2.42666, 0),
			Rotation(0, 0, -0)
		},
		jowi = {
			Vector3(0, -1.35344, 0),
			Rotation(0, 0, -0)
		},
		jacket = {
			Vector3(0, -1.35344, 0.077513),
			Rotation(0, 0, -0)
		},
		dallas = {
			Vector3(0, -1.71118, 0.554498),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, -1.94967, -0.995704),
			Rotation(0, 2.27524, 0)
		},
		bonnie = {
			Vector3(0.196759, -0.757211, 0.196759),
			Rotation(1.41667, -0.30048, -8.33763e-10)
		},
		sokol = {
			Vector3(0, -1.94967, 1.15073),
			Rotation(-3.3351e-09, -6.3105, -0.30048)
		},
		chico = {
			Vector3(0, -1.83043, 0.792991),
			Rotation(0, -3.73477, 0)
		},
		dragon = {
			Vector3(0, -0.995704, 1.15073),
			Rotation(0, -7.16907, 0)
		},
		jimmy = {
			Vector3(0.435252, -1.47269, 0),
			Rotation(2.27524, 2.08444e-09, -0.30048)
		},
		dragan = {
			Vector3(0, -1.35344, 0.554498),
			Rotation(0, 0, -0)
		}
	}
	self.masks.amp_01 = {}
	self.masks.amp_01.unit = "units/pd2_dlc_amp/masks/amp_01/msk_amp_01"
	self.masks.amp_01.name_id = "bm_msk_amp_01"
	self.masks.amp_01.pcs = {}
	self.masks.amp_01.value = 0
	self.masks.amp_01.texture_bundle_folder = "amp"
	self.masks.amp_01.sort_number = 43
	self.masks.amp_01.offsets = {
		joy = {
			Vector3(0, -1.2342, 1.15073),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.amp_02 = {}
	self.masks.amp_02.unit = "units/pd2_dlc_amp/masks/amp_02/msk_amp_02"
	self.masks.amp_02.name_id = "bm_msk_amp_02"
	self.masks.amp_02.pcs = {}
	self.masks.amp_02.value = 0
	self.masks.amp_02.texture_bundle_folder = "amp"
	self.masks.amp_02.sort_number = 43
	self.masks.amp_03 = {}
	self.masks.amp_03.unit = "units/pd2_dlc_amp/masks/amp_03/msk_amp_03"
	self.masks.amp_03.name_id = "bm_msk_amp_03"
	self.masks.amp_03.pcs = {}
	self.masks.amp_03.value = 0
	self.masks.amp_03.texture_bundle_folder = "amp"
	self.masks.amp_03.sort_number = 43
	self.masks.amp_04 = {}
	self.masks.amp_04.unit = "units/pd2_dlc_amp/masks/amp_04/msk_amp_04"
	self.masks.amp_04.name_id = "bm_msk_amp_04"
	self.masks.amp_04.pcs = {}
	self.masks.amp_04.value = 0
	self.masks.amp_04.texture_bundle_folder = "amp"
	self.masks.amp_04.sort_number = 43
	self.masks.mp2_01 = {}
	self.masks.mp2_01.unit = "units/pd2_dlc_mp2/masks/mp2_01/msk_mp2_01"
	self.masks.mp2_01.name_id = "bm_msk_mp2_01"
	self.masks.mp2_01.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.mp2_01.value = 0
	self.masks.mp2_01.texture_bundle_folder = "mp2"
	self.masks.mp2_01.sort_number = 44
	self.masks.mp2_01.offsets = {
		female_1 = {
			Vector3(0, 0.435252, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.mp2_02 = {}
	self.masks.mp2_02.unit = "units/pd2_dlc_mp2/masks/mp2_02/msk_mp2_02"
	self.masks.mp2_02.name_id = "bm_msk_mp2_02"
	self.masks.mp2_02.pcs = {}
	self.masks.mp2_02.value = 0
	self.masks.mp2_02.texture_bundle_folder = "mp2"
	self.masks.mp2_02.sort_number = 44
	self.masks.mp2_03 = {}
	self.masks.mp2_03.unit = "units/pd2_dlc_mp2/masks/mp2_03/msk_mp2_03"
	self.masks.mp2_03.name_id = "bm_msk_mp2_03"
	self.masks.mp2_03.pcs = {}
	self.masks.mp2_03.value = 0
	self.masks.mp2_03.texture_bundle_folder = "mp2"
	self.masks.mp2_03.sort_number = 44
	self.masks.mp2_04 = {}
	self.masks.mp2_04.unit = "units/pd2_dlc_mp2/masks/mp2_04/msk_mp2_04"
	self.masks.mp2_04.name_id = "bm_msk_mp2_04"
	self.masks.mp2_04.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.mp2_04.value = 0
	self.masks.mp2_04.texture_bundle_folder = "mp2"
	self.masks.mp2_04.sort_number = 44
	self.masks.mrm = {}
	self.masks.mrm.unit = "units/pd2_dlc_mrm/masks/msk_mrm"
	self.masks.mrm.name_id = "bm_msk_mrm"
	self.masks.mrm.pcs = {}
	self.masks.mrm.value = 0
	self.masks.mrm.texture_bundle_folder = "mrm"
	self.masks.mrm.sort_number = 45
	self.masks.mrm.infamous = true
	self.masks.bny_01_bonnie = {}
	self.masks.bny_01_bonnie.unit = "units/pd2_dlc_bny/masks/bny_01/msk_bny_01_bonnie"
	self.masks.bny_01_bonnie.name_id = "bm_msk_cheat_error"
	self.masks.bny_01_bonnie.type = "helmet"
	self.masks.bny_01_bonnie.inaccessible = true
	self.masks.bny_01_bonnie.offsets = {
		wolf = {
			Vector3(0, 3.41641, 0.435254),
			Rotation(0, -3.73476, 0)
		},
		sydney = {
			Vector3(0, 3.53566, 0.435254),
			Rotation(0, -4.59333, 0)
		},
		chico = {
			Vector3(0, 3.65491, -1.47269),
			Rotation(0.558107, -0.300467, -0.041893)
		},
		jimmy = {
			Vector3(0, 4.48963, -2.06892),
			Rotation(0, 2.27525, 0)
		},
		joy = {
			Vector3(0, 3.65491, 0.673747),
			Rotation(0, -9.74478, 0)
		},
		myh = {
			Vector3(0, 3.6549, 0.316006),
			Rotation(0, -13.1791, 0)
		},
		bonnie = {
			Vector3(0, 3.77415, 0),
			Rotation(0, -8.02763, 0)
		}
	}
	self.masks.bny_01_bodhi = {}
	self.masks.bny_01_bodhi.unit = "units/pd2_dlc_bny/masks/bny_01/msk_bny_01_bodhi"
	self.masks.bny_01_bodhi.name_id = "bm_msk_cheat_error"
	self.masks.bny_01_bodhi.type = "helmet"
	self.masks.bny_01_bodhi.inaccessible = true
	self.masks.bny_01_bodhi.offsets = {
		dragon = {
			Vector3(0, 3.8934, -0.637963),
			Rotation(0, -5.45191, 0)
		},
		hoxton = {
			Vector3(0, 3.41641, 0.435254),
			Rotation(0, -11.4619, 0)
		},
		wild = {
			Vector3(0, 3.77415, -0.518717),
			Rotation(0, -8.8862, 0)
		},
		sokol = {
			Vector3(0, 2.82018, 0.316008),
			Rotation(0, -4.59333, 0)
		},
		old_hoxton = {
			Vector3(0, 4.25114, -2.54591),
			Rotation(0, 8.28527, 0)
		},
		bodhi = {
			Vector3(0, 4.48963, -0.637963),
			Rotation(0, -4.59333, 0)
		},
		jowi = {
			Vector3(0, 4.13189, -1.59193),
			Rotation(0, 3.13383, 0)
		},
		chains = {
			Vector3(0, 3.41641, 1.03149),
			Rotation(0, -12.3205, 0)
		},
		dragan = {
			Vector3(0, 4.13189, -0.0417315),
			Rotation(0, -6.31048, 0)
		},
		max = {
			Vector3(0, 4.13189, -0.0417315),
			Rotation(0, -6.31048, 0)
		}
	}
	self.masks.bny_01_clover = {}
	self.masks.bny_01_clover.unit = "units/pd2_dlc_bny/masks/bny_01/msk_bny_01_clover"
	self.masks.bny_01_clover.name_id = "bm_msk_cheat_error"
	self.masks.bny_01_clover.type = "helmet"
	self.masks.bny_01_clover.inaccessible = true
	self.masks.bny_01_clover.offsets = {
		chico = {
			Vector3(0.00826851, 1.74696, -1.59193),
			Rotation(-0.300467, 5.70955, -0.300467)
		},
		dallas = {
			Vector3(0, 1.38922, 2.1047),
			Rotation(0, -16.6134, 0)
		},
		jacket = {
			Vector3(0, 1.03149, -1.2342),
			Rotation(0.0409595, 5.70955, -4.16882e-10)
		}
	}
	self.masks.bny_01_clover_b = {}
	self.masks.bny_01_clover_b.unit = "units/pd2_dlc_bny/masks/bny_01/msk_bny_01_clover_b"
	self.masks.bny_01_clover_b.name_id = "bm_msk_cheat_error"
	self.masks.bny_01_clover_b.type = "helmet"
	self.masks.bny_01_clover_b.inaccessible = true
	self.masks.bny_01_ecp_male = {}
	self.masks.bny_01_ecp_male.unit = "units/pd2_dlc_ecp/masks/msk_bny_01_ecp_male/msk_bny_01_ecp_male"
	self.masks.bny_01_ecp_male.name_id = "bm_msk_cheat_error"
	self.masks.bny_01_ecp_male.type = "helmet"
	self.masks.bny_01_ecp_male.inaccessible = true
	self.masks.bny_01_ecp_male.offsets = {
		ecp_male = {
			Vector3(0, 2.58169, -0.876458),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.bny_01_ecp_female = {}
	self.masks.bny_01_ecp_female.unit = "units/pd2_dlc_ecp/masks/msk_bny_01_ecp_female/msk_bny_01_ecp_female"
	self.masks.bny_01_ecp_female.name_id = "bm_msk_cheat_error"
	self.masks.bny_01_ecp_female.type = "helmet"
	self.masks.bny_01_ecp_female.inaccessible = true
	self.masks.bny_01_ecp_female.offsets = {
		ecp_female = {
			Vector3(0, 2.46244, 0.435252),
			Rotation(0, -3.73477, 0)
		}
	}
	self.masks.bny_01 = {}
	self.masks.bny_01.name_id = "bm_msk_bny_01"
	self.masks.bny_01.value = 0
	self.masks.bny_01.pcs = {}
	self.masks.bny_01.type = "helmet"
	self.masks.bny_01.texture_bundle_folder = "bny"
	self.masks.bny_01.sort_number = 46
	self.masks.bny_01.characters = {
		bodhi = "bny_01_bodhi",
		bonnie = "bny_01_bonnie",
		chains = "bny_01_bodhi",
		chico = "bny_01_bonnie",
		dallas = "bny_01_clover",
		dragan = "bny_01_bodhi",
		dragon = "bny_01_bodhi",
		ecp_female = "bny_01_ecp_female",
		ecp_male = "bny_01_ecp_male",
		female_1 = "bny_01_clover_b",
		hoxton = "bny_01_bodhi",
		jacket = "bny_01_clover",
		jimmy = "bny_01_bonnie",
		jowi = "bny_01_bodhi",
		joy = "bny_01_bonnie",
		max = "bny_01_bodhi",
		myh = "bny_01_bonnie",
		old_hoxton = "bny_01_bodhi",
		sokol = "bny_01_bodhi",
		sydney = "bny_01_bonnie",
		wild = "bny_01_bodhi",
		wolf = "bny_01_bonnie"
	}
	self.masks.bny_02_bonnie = {}
	self.masks.bny_02_bonnie.unit = "units/pd2_dlc_bny/masks/bny_02/msk_bny_02_bonnie"
	self.masks.bny_02_bonnie.name_id = "bm_msk_cheat_error"
	self.masks.bny_02_bonnie.type = "helmet"
	self.masks.bny_02_bonnie.inaccessible = true
	self.masks.bny_02_bonnie.offsets = {
		jacket = {
			Vector3(0, 2.22395, -0.518717),
			Rotation(-0.00046676, -8.8862, -3.25689e-12)
		},
		sydney = {
			Vector3(0, 2.3432, -0.0417315),
			Rotation(1.0422e-10, -6.31048, 0.030943)
		},
		dragon = {
			Vector3(0, 1.86621, -0.399471),
			Rotation(0, -9.74478, 0)
		},
		wild = {
			Vector3(0, 2.46244, 0.5545),
			Rotation(0, -14.8962, 0)
		},
		dragan = {
			Vector3(0, 1.86621, -0.0417315),
			Rotation(0, -8.02763, 0)
		},
		wolf = {
			Vector3(0, 1.98546, -0.637963),
			Rotation(0, -3.73476, 0)
		},
		sokol = {
			Vector3(0, 0.792993, -0.0417315),
			Rotation(0, -8.8862, 0)
		},
		chico = {
			Vector3(0, 1.74696, 0.5545),
			Rotation(0, -15.7548, 0)
		},
		jimmy = {
			Vector3(0, 2.82018, -0.876456),
			Rotation(-0.041893, -9.74478, 4.16882e-10)
		},
		jowi = {
			Vector3(0, 2.22395, -0.160978),
			Rotation(0, -8.02763, 0)
		},
		bonnie = {
			Vector3(0, 2.58169, -0.637963),
			Rotation(0, -5.45191, 0)
		},
		joy = {
			Vector3(0.0775149, 1.74696, 1.38922),
			Rotation(0, -17.4719, 0)
		},
		myh = {
			Vector3(0, 2.70093, -0.0417333),
			Rotation(0, -13.1791, 0.558094)
		},
		ecp_male = {
			Vector3(0, 1.62772, -1.35344),
			Rotation(-0.30048, -3.73477, -0)
		}
	}
	self.masks.bny_02_ecp_male = {}
	self.masks.bny_02_ecp_male.unit = "units/pd2_dlc_ecp/masks/msk_bny_02_ecp_male/msk_bny_02_ecp_male"
	self.masks.bny_02_ecp_male.name_id = "bm_msk_cheat_error"
	self.masks.bny_02_ecp_male.type = "helmet"
	self.masks.bny_02_ecp_male.inaccessible = true
	self.masks.bny_02_ecp_male.offsets = {
		ecp_male = {
			Vector3(0, 1.62772, -1.35344),
			Rotation(-0.30048, -3.73477, -0)
		}
	}
	self.masks.bny_02_bodhi = {}
	self.masks.bny_02_bodhi.unit = "units/pd2_dlc_bny/masks/bny_02/msk_bny_02_bodhi"
	self.masks.bny_02_bodhi.name_id = "bm_msk_cheat_error"
	self.masks.bny_02_bodhi.type = "helmet"
	self.masks.bny_02_bodhi.inaccessible = true
	self.masks.bny_02_bodhi.offsets = {
		dallas = {
			Vector3(0, 2.58169, -0.0417315),
			Rotation(-0.041893, -4.59334, 1.0422e-10)
		},
		chains = {
			Vector3(0, 2.3432, -0.637963),
			Rotation(0, -2.87619, 0)
		},
		hoxton = {
			Vector3(0, 2.3432, -0.995702),
			Rotation(-0, -0, -0)
		},
		bodhi = {
			Vector3(0, 1.98546, 0.792993),
			Rotation(-0.041893, -8.8862, -2.08441e-10)
		},
		old_hoxton = {
			Vector3(0, 2.1047, -1.83043),
			Rotation(0, 3.9924, 0)
		},
		max = {
			Vector3(0, 2.82018, -1.35344),
			Rotation(-0, -0, -0)
		},
		ecp_female = {
			Vector3(0, 2.46244, -0.518719),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.bny_02_clover = {}
	self.masks.bny_02_clover.unit = "units/pd2_dlc_bny/masks/bny_02/msk_bny_02_clover"
	self.masks.bny_02_clover.name_id = "bm_msk_cheat_error"
	self.masks.bny_02_clover.type = "helmet"
	self.masks.bny_02_clover.inaccessible = true
	self.masks.bny_02_clover.offsets = {
		female_1 = {
			Vector3(0, 0, 0),
			Rotation(0, -3.73476, 0)
		}
	}
	self.masks.bny_02 = {}
	self.masks.bny_02.name_id = "bm_msk_bny_02"
	self.masks.bny_02.value = 0
	self.masks.bny_02.pcs = {}
	self.masks.bny_02.type = "helmet"
	self.masks.bny_02.texture_bundle_folder = "bny"
	self.masks.bny_02.sort_number = 46
	self.masks.bny_02.characters = {
		bodhi = "bny_02_bodhi",
		bonnie = "bny_02_bonnie",
		chains = "bny_02_bodhi",
		chico = "bny_02_bonnie",
		dallas = "bny_02_bodhi",
		dragan = "bny_02_bonnie",
		dragon = "bny_02_bonnie",
		ecp_female = "bny_02_bodhi",
		ecp_male = "bny_02_ecp_male",
		female_1 = "bny_02_clover",
		hoxton = "bny_02_bodhi",
		jacket = "bny_02_bonnie",
		jimmy = "bny_02_bonnie",
		jowi = "bny_02_bonnie",
		joy = "bny_02_bonnie",
		max = "bny_02_bodhi",
		myh = "bny_02_bonnie",
		old_hoxton = "bny_02_bodhi",
		sokol = "bny_02_bonnie",
		sydney = "bny_02_bonnie",
		wild = "bny_02_bonnie",
		wolf = "bny_02_bonnie"
	}
	self.masks.bny_03_clover = {}
	self.masks.bny_03_clover.unit = "units/pd2_dlc_bny/masks/bny_03/msk_bny_03_clover"
	self.masks.bny_03_clover.name_id = "bm_msk_cheat_error"
	self.masks.bny_03_clover.type = "helmet"
	self.masks.bny_03_clover.inaccessible = true
	self.masks.bny_03_clover.offsets = {
		jacket = {
			Vector3(0, 2.1047, -2.18817),
			Rotation(0, 7.4267, 0)
		},
		dallas = {
			Vector3(0, 1.50847, -0.399471),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0.5545, 2.46244, -3.49988),
			Rotation(0, 11.7196, 0)
		}
	}
	self.masks.bny_03_bodhi = {}
	self.masks.bny_03_bodhi.unit = "units/pd2_dlc_bny/masks/bny_03/msk_bny_03_bodhi"
	self.masks.bny_03_bodhi.name_id = "bm_msk_cheat_error"
	self.masks.bny_03_bodhi.type = "helmet"
	self.masks.bny_03_bodhi.inaccessible = true
	self.masks.bny_03_bodhi.offsets = {
		max = {
			Vector3(0, 3.17792, 0.316008),
			Rotation(0, 0, -0)
		},
		joy = {
			Vector3(0, 4.13189, 0),
			Rotation(-0, -0, -0)
		},
		myh = {
			Vector3(0, 2.1047, -0.16098),
			Rotation(0, 3.99239, 0)
		},
		ecp_male = {
			Vector3(0, 2.58169, -0.399472),
			Rotation(-0, -0, -0)
		},
		ecp_female = {
			Vector3(0, 1.98545, 0.196759),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, 3.17792, 0.316008),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 3.65491, 1.86621),
			Rotation(0, -6.31048, 0)
		},
		chains = {
			Vector3(0, 1.62772, 1.15073),
			Rotation(0, -3.73476, 0)
		},
		hoxton = {
			Vector3(0, 1.50847, 1.98546),
			Rotation(0, -11.4619, 0)
		},
		jimmy = {
			Vector3(0, 3.8934, -0.876456),
			Rotation(0, 0, -0)
		},
		old_hoxton = {
			Vector3(0, 3.17792, -1.94967),
			Rotation(0, 7.4267, 0)
		},
		sokol = {
			Vector3(0, 2.1047, 0.912239),
			Rotation(0, -5.45191, 0)
		},
		bodhi = {
			Vector3(0, 1.74696, 1.15073),
			Rotation(0.0409595, -5.45191, 6.25322e-10)
		},
		wolf = {
			Vector3(0, 2.1047, 1.38922),
			Rotation(0, 0, -0)
		},
		wild = {
			Vector3(0, 2.46244, -0.160978),
			Rotation(0, 0, -0)
		},
		chico = {
			Vector3(0, 1.74696, 0.792993),
			Rotation(0, -2.87619, 0)
		},
		jowi = {
			Vector3(0, 2.70093, -0.876456),
			Rotation(0, 3.13383, 0)
		},
		dragon = {
			Vector3(0, 2.46244, 1.15073),
			Rotation(-0.0347619, -6.31048, -2.08441e-10)
		},
		dragan = {
			Vector3(0, 2.1047, 0.792993),
			Rotation(0, 0, -0)
		}
	}
	self.masks.bny_03 = {}
	self.masks.bny_03.name_id = "bm_msk_bny_03"
	self.masks.bny_03.value = 0
	self.masks.bny_03.pcs = {}
	self.masks.bny_03.type = "helmet"
	self.masks.bny_03.texture_bundle_folder = "bny"
	self.masks.bny_03.sort_number = 46
	self.masks.bny_03.characters = {
		bodhi = "bny_03_bodhi",
		bonnie = "bny_03_bodhi",
		chains = "bny_03_bodhi",
		chico = "bny_03_bodhi",
		dallas = "bny_03_clover",
		dragan = "bny_03_bodhi",
		dragon = "bny_03_bodhi",
		ecp_female = "bny_03_bodhi",
		ecp_male = "bny_03_bodhi",
		female_1 = "bny_03_clover",
		hoxton = "bny_03_bodhi",
		jacket = "bny_03_clover",
		jimmy = "bny_03_bodhi",
		jowi = "bny_03_bodhi",
		joy = "bny_03_bodhi",
		max = "bny_03_bodhi",
		myh = "bny_03_bodhi",
		old_hoxton = "bny_03_bodhi",
		sokol = "bny_03_bodhi",
		sydney = "bny_03_bodhi",
		wild = "bny_03_bodhi",
		wolf = "bny_03_bodhi"
	}
	self.masks.bny_04 = {}
	self.masks.bny_04.unit = "units/pd2_dlc_bny/masks/bny_04/msk_bny_04"
	self.masks.bny_04.name_id = "bm_msk_bny_04"
	self.masks.bny_04.pcs = {}
	self.masks.bny_04.value = 0
	self.masks.bny_04.texture_bundle_folder = "bny"
	self.masks.bny_04.sort_number = 46
	self.masks.bny_04.type = "helmet"
	self.masks.bny_04.offsets = {
		joy = {
			Vector3(0, 3.05867, 0.196761),
			Rotation(0, -5.45191, 0)
		},
		ecp_male = {
			Vector3(0.077513, -0.876458, -0.637965),
			Rotation(-2.00261e-08, 3.99239, 2.27524)
		},
		ecp_female = {
			Vector3(0.077513, -1.35344, 1.98545),
			Rotation(0, -4.59335, 0)
		}
	}
	self.masks.mdm = {}
	self.masks.mdm.unit = "units/pd2_dlc_mdm/masks/msk_mdm/msk_mdm"
	self.masks.mdm.name_id = "bm_msk_mdm"
	self.masks.mdm.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.mdm.value = 0
	self.masks.mdm.texture_bundle_folder = "mdm"
	self.masks.mdm.sort_number = 47
	self.masks.mdm.infamous = true
	self.masks.mdm.global_value = "infamous"
	self.masks.max = {}
	self.masks.max.unit = "units/pd2_dlc_max/masks/msk_max"
	self.masks.max.name_id = "bm_msk_max"
	self.masks.max.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.max.value = 0
	self.masks.max.texture_bundle_folder = "max"
	self.masks.max.sort_number = 48
	self.masks.max.infamous = true
	self.masks.max.global_value = "infamous"
	self.masks.max_begins = {}
	self.masks.max_begins.unit = "units/pd2_dlc_max/masks/msk_max_begins"
	self.masks.max_begins.name_id = "bm_msk_max_begins"
	self.masks.max_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.max_begins.value = 0
	self.masks.max_begins.texture_bundle_folder = "max"
	self.masks.max_begins.sort_number = 49
	self.masks.max_begins.infamous = true
	self.masks.max_begins.global_value = "infamous"
	self.masks.ant_01 = {}
	self.masks.ant_01.unit = "units/pd2_dlc_ant/masks/ant_01/msk_ant_01"
	self.masks.ant_01.name_id = "bm_msk_ant_01"
	self.masks.ant_01.pcs = {}
	self.masks.ant_01.value = 0
	self.masks.ant_01.texture_bundle_folder = "ant"
	self.masks.ant_01.sort_number = 49
	self.masks.ant_01.type = "helmet"
	self.masks.ant_01.dlc = "ant"
	self.masks.ant_01.global_value = "ant"
	self.masks.ant_02 = {}
	self.masks.ant_02.unit = "units/pd2_dlc_ant/masks/ant_02/msk_ant_02"
	self.masks.ant_02.name_id = "bm_msk_ant_02"
	self.masks.ant_02.pcs = {}
	self.masks.ant_02.value = 0
	self.masks.ant_02.texture_bundle_folder = "ant"
	self.masks.ant_02.sort_number = 49
	self.masks.ant_02.type = "helmet"
	self.masks.ant_02.dlc = "ant"
	self.masks.ant_02.global_value = "ant"
	self.masks.ant_03 = {}
	self.masks.ant_03.unit = "units/pd2_dlc_ant/masks/ant_03/msk_ant_03"
	self.masks.ant_03.name_id = "bm_msk_ant_03"
	self.masks.ant_03.pcs = {}
	self.masks.ant_03.value = 0
	self.masks.ant_03.texture_bundle_folder = "ant"
	self.masks.ant_03.sort_number = 49
	self.masks.ant_03.type = "helmet"
	self.masks.ant_03.dlc = "ant"
	self.masks.ant_03.global_value = "ant"
	self.masks.ant_04 = {}
	self.masks.ant_04.unit = "units/pd2_dlc_ant/masks/ant_04/msk_ant_04"
	self.masks.ant_04.name_id = "bm_msk_ant_04"
	self.masks.ant_04.pcs = {}
	self.masks.ant_04.value = 0
	self.masks.ant_04.texture_bundle_folder = "ant"
	self.masks.ant_04.sort_number = 49
	self.masks.ant_04.type = "helmet"
	self.masks.ant_04.dlc = "ant"
	self.masks.ant_04.global_value = "ant"
	self.masks.ant_05 = {}
	self.masks.ant_05.unit = "units/pd2_dlc_ant/masks/ant_05/msk_ant_05"
	self.masks.ant_05.name_id = "bm_msk_ant_05"
	self.masks.ant_05.pcs = {}
	self.masks.ant_05.value = 0
	self.masks.ant_05.texture_bundle_folder = "ant"
	self.masks.ant_05.sort_number = 50
	self.masks.ant_05.type = "helmet"
	self.masks.ant_05.dlc = "ant_free"
	self.masks.ant_05.global_value = "ant_free"
	self.masks.ant_06 = {}
	self.masks.ant_06.unit = "units/pd2_dlc_ant/masks/ant_06/msk_ant_06"
	self.masks.ant_06.name_id = "bm_msk_ant_06"
	self.masks.ant_06.pcs = {}
	self.masks.ant_06.value = 0
	self.masks.ant_06.texture_bundle_folder = "ant"
	self.masks.ant_06.sort_number = 49
	self.masks.ant_06.type = "helmet"
	self.masks.ant_06.dlc = "ant"
	self.masks.ant_06.global_value = "ant"
	self.masks.ant_07 = {}
	self.masks.ant_07.unit = "units/pd2_dlc_ant/masks/ant_07/msk_ant_07"
	self.masks.ant_07.name_id = "bm_msk_ant_07"
	self.masks.ant_07.pcs = {}
	self.masks.ant_07.value = 0
	self.masks.ant_07.texture_bundle_folder = "ant"
	self.masks.ant_07.sort_number = 50
	self.masks.ant_07.type = "helmet"
	self.masks.ant_07.dlc = "ant_free"
	self.masks.ant_07.global_value = "ant_free"
	self.masks.ant_08 = {}
	self.masks.ant_08.unit = "units/pd2_dlc_ant/masks/ant_08/msk_ant_08"
	self.masks.ant_08.name_id = "bm_msk_ant_08"
	self.masks.ant_08.pcs = {}
	self.masks.ant_08.value = 0
	self.masks.ant_08.texture_bundle_folder = "ant"
	self.masks.ant_08.sort_number = 49
	self.masks.ant_08.type = "helmet"
	self.masks.ant_08.dlc = "ant"
	self.masks.ant_08.global_value = "ant"
	self.masks.dgm = {}
	self.masks.dgm.unit = "units/pd2_dlc_dgm/masks/msk_dgm"
	self.masks.dgm.name_id = "bm_msk_dgm"
	self.masks.dgm.pcs = {}
	self.masks.dgm.value = 0
	self.masks.dgm.texture_bundle_folder = "dgm"
	self.masks.dgm.sort_number = 65
	self.masks.dgm.global_value = "pd2_clan"
	self.masks.eng_01 = {}
	self.masks.eng_01.unit = "units/pd2_dlc_eng/masks/eng_01/msk_eng_01"
	self.masks.eng_01.name_id = "bm_msk_eng_01"
	self.masks.eng_01.pcs = {}
	self.masks.eng_01.value = 0
	self.masks.eng_01.texture_bundle_folder = "eng"
	self.masks.eng_01.sort_number = 51
	self.masks.eng_01.type = "helmet"
	self.masks.eng_01.global_value = "eng"
	self.masks.eng_02 = {}
	self.masks.eng_02.unit = "units/pd2_dlc_eng/masks/eng_02/msk_eng_02"
	self.masks.eng_02.name_id = "bm_msk_eng_02"
	self.masks.eng_02.pcs = {}
	self.masks.eng_02.value = 0
	self.masks.eng_02.texture_bundle_folder = "eng"
	self.masks.eng_02.sort_number = 51
	self.masks.eng_02.type = "helmet"
	self.masks.eng_02.global_value = "eng"
	self.masks.eng_03 = {}
	self.masks.eng_03.unit = "units/pd2_dlc_eng/masks/eng_03/msk_eng_03"
	self.masks.eng_03.name_id = "bm_msk_eng_03"
	self.masks.eng_03.pcs = {}
	self.masks.eng_03.value = 0
	self.masks.eng_03.texture_bundle_folder = "eng"
	self.masks.eng_03.sort_number = 51
	self.masks.eng_03.type = "helmet"
	self.masks.eng_03.global_value = "eng"
	self.masks.eng_04 = {}
	self.masks.eng_04.unit = "units/pd2_dlc_eng/masks/eng_04/msk_eng_04"
	self.masks.eng_04.name_id = "bm_msk_eng_04"
	self.masks.eng_04.pcs = {}
	self.masks.eng_04.value = 0
	self.masks.eng_04.texture_bundle_folder = "eng"
	self.masks.eng_04.sort_number = 51
	self.masks.eng_04.type = "helmet"
	self.masks.eng_04.global_value = "eng"
	self.masks.eng_04.offsets = {
		sydney = {
			Vector3(0, 0.435252, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.wmp_01 = {}
	self.masks.wmp_01.unit = "units/pd2_dlc_wmp/masks/wmp_01/msk_wmp_01"
	self.masks.wmp_01.name_id = "bm_msk_wmp_01"
	self.masks.wmp_01.pcs = {}
	self.masks.wmp_01.value = 0
	self.masks.wmp_01.texture_bundle_folder = "wmp"
	self.masks.wmp_01.sort_number = 52
	self.masks.wmp_01.type = "helmet"
	self.masks.wmp_01.global_value = "pd2_clan"
	self.masks.wmp_01.offsets = {
		sydney = {
			Vector3(0, 0.435252, 0),
			Rotation(0, 2.27524, 0)
		}
	}
	self.masks.wmp_02 = {}
	self.masks.wmp_02.unit = "units/pd2_dlc_wmp/masks/wmp_02/msk_wmp_02"
	self.masks.wmp_02.name_id = "bm_msk_wmp_02"
	self.masks.wmp_02.pcs = {}
	self.masks.wmp_02.value = 0
	self.masks.wmp_02.texture_bundle_folder = "wmp"
	self.masks.wmp_02.sort_number = 52
	self.masks.wmp_02.type = "helmet"
	self.masks.wmp_02.global_value = "pd2_clan"
	self.masks.wmp_02.offsets = {
		wild = {
			Vector3(0, -1.11495, 0),
			Rotation(0, 0, -0)
		},
		wolf = {
			Vector3(0, -0.757211, 0),
			Rotation(0, 0, -0)
		},
		dragan = {
			Vector3(0, -0.637965, 0),
			Rotation(-0, -0, -0)
		},
		chains = {
			Vector3(0, -0.518719, 0),
			Rotation(0, 0, -0)
		},
		max = {
			Vector3(0, -0.637965, 0),
			Rotation(0, 0, -0)
		},
		jacket = {
			Vector3(0, -0.757211, 0),
			Rotation(0, 0, -0)
		},
		bonnie = {
			Vector3(0, -0.280226, 0),
			Rotation(0, 0, -0)
		}
	}
	self.masks.wmp_03 = {}
	self.masks.wmp_03.unit = "units/pd2_dlc_wmp/masks/wmp_03/msk_wmp_03"
	self.masks.wmp_03.name_id = "bm_msk_wmp_03"
	self.masks.wmp_03.pcs = {}
	self.masks.wmp_03.value = 0
	self.masks.wmp_03.texture_bundle_folder = "wmp"
	self.masks.wmp_03.sort_number = 52
	self.masks.wmp_03.type = "tiara"
	self.masks.wmp_03.global_value = "pd2_clan"
	self.masks.wmp_03.offsets = {
		jacket = {
			Vector3(0, 0.435252, 0),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 1.26998, 2.46244),
			Rotation(0, -9.74479, 0)
		},
		dragon = {
			Vector3(0, 0, 0.316006),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0.077513, 2.1047, 0.077513),
			Rotation(-0, -0, -0)
		},
		wild = {
			Vector3(0, 0.316006, 0),
			Rotation(-0, -0, -0)
		},
		sokol = {
			Vector3(0, 0.554498, 0.435252),
			Rotation(0, 0, -0)
		},
		bonnie = {
			Vector3(0, 1.26998, 0.316006),
			Rotation(0, 0, -0)
		},
		wolf = {
			Vector3(0, 0.077513, 0.554498),
			Rotation(0, 0, -0)
		},
		chico = {
			Vector3(0, 0.673745, 0.316006),
			Rotation(0, 0, -0)
		},
		bodhi = {
			Vector3(0, 0, 0.554498),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(0, 0.554498, 0),
			Rotation(0, 0, -0)
		},
		jowi = {
			Vector3(0, 0, 0.792991),
			Rotation(0, 0, -0)
		},
		dragan = {
			Vector3(0, 0.316006, 0.554498),
			Rotation(0, 0, -0)
		},
		joy = {
			Vector3(0.435254, 1.38922, 0.435254),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.wmp_04 = {}
	self.masks.wmp_04.unit = "units/pd2_dlc_wmp/masks/wmp_04/msk_wmp_04"
	self.masks.wmp_04.name_id = "bm_msk_wmp_04"
	self.masks.wmp_04.pcs = {}
	self.masks.wmp_04.value = 0
	self.masks.wmp_04.texture_bundle_folder = "wmp"
	self.masks.wmp_04.sort_number = 52
	self.masks.wmp_04.type = "helmet"
	self.masks.wmp_04.global_value = "pd2_clan"
	self.masks.gcm = {}
	self.masks.gcm.unit = "units/pd2_dlc_gcm/masks/msk_gcm"
	self.masks.gcm.name_id = "bm_msk_gcm"
	self.masks.gcm.pcs = {}
	self.masks.gcm.value = 0
	self.masks.gcm.texture_bundle_folder = "gcm"
	self.masks.gcm.sort_number = 65
	self.masks.gcm.global_value = "pd2_clan"
	self.masks.jfr_01 = {}
	self.masks.jfr_01.unit = "units/pd2_dlc_jfr/masks/jfr_01/msk_jfr_01"
	self.masks.jfr_01.name_id = "bm_msk_jfr_01"
	self.masks.jfr_01.pcs = {}
	self.masks.jfr_01.value = 0
	self.masks.jfr_01.texture_bundle_folder = "jfr"
	self.masks.jfr_01.sort_number = 54
	self.masks.jfr_01.type = "helmet"
	self.masks.jfr_01.offsets = {
		sydney = {
			Vector3(0, 1.26998, 0),
			Rotation(0, 3.13382, 0)
		}
	}
	self.masks.jfr_02 = {}
	self.masks.jfr_02.unit = "units/pd2_dlc_jfr/masks/jfr_02/msk_jfr_02"
	self.masks.jfr_02.name_id = "bm_msk_jfr_02"
	self.masks.jfr_02.pcs = {}
	self.masks.jfr_02.value = 0
	self.masks.jfr_02.texture_bundle_folder = "jfr"
	self.masks.jfr_02.sort_number = 54
	self.masks.jfr_02.type = "helmet"
	self.masks.jfr_02.offsets = {
		joy = {
			Vector3(0, 1.98546, 0.792993),
			Rotation(0, -9.74478, 0)
		},
		female_1 = {
			Vector3(0, 0.673745, -0.518719),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 1.03148, 0),
			Rotation(0, 0, -0)
		}
	}
	self.masks.jfr_03 = {}
	self.masks.jfr_03.unit = "units/pd2_dlc_jfr/masks/jfr_03/msk_jfr_03"
	self.masks.jfr_03.name_id = "bm_msk_jfr_03"
	self.masks.jfr_03.pcs = {}
	self.masks.jfr_03.value = 0
	self.masks.jfr_03.texture_bundle_folder = "jfr"
	self.masks.jfr_03.sort_number = 54
	self.masks.jfr_03.type = "helmet"
	self.masks.jfr_04 = {}
	self.masks.jfr_04.unit = "units/pd2_dlc_jfr/masks/jfr_04/msk_jfr_04"
	self.masks.jfr_04.name_id = "bm_msk_jfr_04"
	self.masks.jfr_04.pcs = {}
	self.masks.jfr_04.value = 0
	self.masks.jfr_04.texture_bundle_folder = "jfr"
	self.masks.jfr_04.sort_number = 54
	self.masks.jfr_04.type = "beard"
	self.masks.jfr_04.skip_mask_on_sequence = true
	self.masks.jfr_04.offsets = {
		sydney = {
			Vector3(0, -1.11495, 0.196759),
			Rotation(0, 0, -0)
		},
		chains = {
			Vector3(0, 0, -0.876458),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0, 0.435252, -0.995704),
			Rotation(0, 3.99239, 0)
		},
		hoxton = {
			Vector3(0, 0, -0.637965),
			Rotation(0, 0, -0)
		},
		sokol = {
			Vector3(-0.280226, 0.792991, -1.11495),
			Rotation(0, 6.56811, 0)
		},
		wolf = {
			Vector3(0, -0.757211, -0.16098),
			Rotation(0, 0, -0)
		},
		bodhi = {
			Vector3(0, 0, -0.757211),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(0, 1.98545, -1.11495),
			Rotation(0, 4.85096, 0)
		},
		jacket = {
			Vector3(0, -0.16098, 0.077513),
			Rotation(0, -2.01763, 0)
		},
		dallas = {
			Vector3(0, 0.077513, -0.399472),
			Rotation(0, 1.41667, 0)
		},
		old_hoxton = {
			Vector3(0, 2.70093, -2.7844),
			Rotation(0, 15.1538, 0)
		},
		dragan = {
			Vector3(0, -0.995704, -0.399472),
			Rotation(0, 0, -0)
		},
		max = {
			Vector3(0, 0.673745, -0.876458),
			Rotation(0, 4.85096, 0)
		},
		wild = {
			Vector3(0, 0, -1.2342),
			Rotation(0, 0, -0)
		},
		chico = {
			Vector3(0, -0.876458, -0.637965),
			Rotation(0, 0, -0)
		},
		jowi = {
			Vector3(0, -0.995704, -0.876458),
			Rotation(0, 0, -0)
		},
		dragon = {
			Vector3(0, 1.38922, -1.2342),
			Rotation(0, 5.70954, 0)
		},
		bonnie = {
			Vector3(0, 0, -0.518719),
			Rotation(0, 0.558094, 0)
		}
	}
	self.masks.joy = {}
	self.masks.joy.unit = "units/pd2_dlc_joy/masks/msk_joy"
	self.masks.joy.name_id = "bm_msk_joy"
	self.masks.joy.pcs = {}
	self.masks.joy.value = 0
	self.masks.joy.texture_bundle_folder = "joy"
	self.masks.joy.sort_number = 57
	self.masks.joy.infamous = true
	self.masks.joy.global_value = "infamous"
	self.masks.joy.offsets = {
		wild = {
			Vector3(0, -1.11495, 0),
			Rotation(-0, -0, -0)
		},
		chico = {
			Vector3(0, -1.47269, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.joy_begins = {}
	self.masks.joy_begins.unit = "units/pd2_dlc_joy/masks/msk_joy_begins"
	self.masks.joy_begins.name_id = "bm_msk_joy_begins"
	self.masks.joy_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.joy_begins.value = 0
	self.masks.joy_begins.texture_bundle_folder = "joy"
	self.masks.joy_begins.sort_number = 57
	self.masks.joy_begins.infamous = true
	self.masks.joy_begins.global_value = "infamous"
	self.masks.joy_begins.offsets = {
		wild = {
			Vector3(0, -0.876456, 0),
			Rotation(-0, -0, -0)
		},
		chico = {
			Vector3(0, -1.11495, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.mmj = {}
	self.masks.mmj.unit = "units/pd2_dlc_mmj/masks/msk_mmj"
	self.masks.mmj.name_id = "bm_msk_mmj"
	self.masks.mmj.pcs = {}
	self.masks.mmj.value = 0
	self.masks.mmj.texture_bundle_folder = "mmj"
	self.masks.mmj.sort_number = 55
	self.masks.mmj.type = "helmet"
	self.masks.mmj.offsets = {
		joy = {
			Vector3(-0.518717, 1.15073, -0.399471),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.fdm = {}
	self.masks.fdm.unit = "units/pd2_dlc_fdm/masks/msk_fdm"
	self.masks.fdm.name_id = "bm_msk_fdm"
	self.masks.fdm.pcs = {}
	self.masks.fdm.value = 0
	self.masks.fdm.texture_bundle_folder = "fdm"
	self.masks.fdm.sort_number = 55
	self.masks.fdm.type = "helmet"
	self.masks.fdm.dlc = "fdm"
	self.masks.fdm.global_value = "fdm"
	self.masks.fdm.offsets = {
		sydney = {
			Vector3(0.435254, -0.876456, 1.26998),
			Rotation(-0.300467, -1.68403e-09, -8.02763)
		},
		dragon = {
			Vector3(0.316008, -0.280224, 0),
			Rotation(0, 0, -11.4619)
		},
		female_1 = {
			Vector3(0.0775149, 0.196761, 0.673747),
			Rotation(2.5018e-09, -1.15904, -1.15904)
		},
		hoxton = {
			Vector3(0.5545, -1.35344, 0.5545),
			Rotation(-8.167e-08, -3.73476, -11.4619)
		},
		sokol = {
			Vector3(0.0775149, -0.160978, 0.196761),
			Rotation(0, 1.41668, 0)
		},
		wolf = {
			Vector3(0.0775149, -0.876456, 0.673747),
			Rotation(0, 0, -0)
		},
		bodhi = {
			Vector3(0, -1.11495, 0.5545),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(-0.280224, -0.399471, -0.0417315),
			Rotation(0, 0, -0)
		},
		max = {
			Vector3(0, -1.11495, 0.5545),
			Rotation(0, 0, -0)
		},
		dallas = {
			Vector3(0, -2.66515, 2.58169),
			Rotation(0, -11.4619, 0)
		},
		joy = {
			Vector3(0, 0.912239, 0.316008),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, -1.71118, 0),
			Rotation(-0, -0, 3.13383)
		},
		dragan = {
			Vector3(0, -0.995702, 0.792993),
			Rotation(0, -2.01761, 0)
		},
		jacket = {
			Vector3(0, -0.280224, -0.0417315),
			Rotation(0, 1.41668, -0.300467)
		},
		chico = {
			Vector3(0, -0.995702, 0.5545),
			Rotation(-5.0036e-09, 2.27525, -1.15904)
		},
		jowi = {
			Vector3(4.13189, -1.2342, 2.1047),
			Rotation(19.4467, -11.4619, -0)
		},
		chains = {
			Vector3(0.435254, -1.47269, -0.160978),
			Rotation(0, 0, -9.74478)
		},
		bonnie = {
			Vector3(-0.160978, -0.637963, 0.316008),
			Rotation(-0, -0, 5.70955)
		},
		ecp_female = {
			Vector3(0, -2.54591, 0.554498),
			Rotation(0, 1.41667, 0)
		},
		ecp_male = {
			Vector3(0, -1.47269, -0.757211),
			Rotation(0, 5.70954, 0)
		}
	}
	self.masks.ztm = {}
	self.masks.ztm.unit = "units/pd2_dlc_ztm/masks/msk_ztm"
	self.masks.ztm.name_id = "bm_msk_ztm"
	self.masks.ztm.pcs = {}
	self.masks.ztm.value = 0
	self.masks.ztm.texture_bundle_folder = "ztm"
	self.masks.ztm.sort_number = 55
	self.masks.ztm.dlc = "ztm"
	self.masks.ztm.global_value = "ztm"
	self.masks.cmo_01 = {}
	self.masks.cmo_01.unit = "units/pd2_dlc_cmo/masks/cmo_01/msk_cmo_01"
	self.masks.cmo_01.name_id = "bm_msk_cmo_01"
	self.masks.cmo_01.pcs = {}
	self.masks.cmo_01.value = 0
	self.masks.cmo_01.texture_bundle_folder = "cmo"
	self.masks.cmo_01.sort_number = 56
	self.masks.cmo_02 = {}
	self.masks.cmo_02.unit = "units/pd2_dlc_cmo/masks/cmo_02/msk_cmo_02"
	self.masks.cmo_02.name_id = "bm_msk_cmo_02"
	self.masks.cmo_02.pcs = {}
	self.masks.cmo_02.value = 0
	self.masks.cmo_02.texture_bundle_folder = "cmo"
	self.masks.cmo_02.sort_number = 56
	self.masks.cmo_03 = {}
	self.masks.cmo_03.unit = "units/pd2_dlc_cmo/masks/cmo_03/msk_cmo_03"
	self.masks.cmo_03.name_id = "bm_msk_cmo_03"
	self.masks.cmo_03.pcs = {}
	self.masks.cmo_03.value = 0
	self.masks.cmo_03.texture_bundle_folder = "cmo"
	self.masks.cmo_03.sort_number = 56
	self.masks.cmo_04 = {}
	self.masks.cmo_04.unit = "units/pd2_dlc_cmo/masks/cmo_04/msk_cmo_04"
	self.masks.cmo_04.name_id = "bm_msk_cmo_04"
	self.masks.cmo_04.pcs = {}
	self.masks.cmo_04.value = 0
	self.masks.cmo_04.texture_bundle_folder = "cmo"
	self.masks.cmo_04.sort_number = 56
	self.masks.dnm = {}
	self.masks.dnm.unit = "units/pd2_dlc_dnm/masks/msk_dnm"
	self.masks.dnm.name_id = "bm_msk_dnm"
	self.masks.dnm.pcs = {}
	self.masks.dnm.value = 0
	self.masks.dnm.qlvl = 0
	self.masks.dnm.infamous = true
	self.masks.dnm.sort_number = 29
	self.masks.dnm.texture_bundle_folder = "dnm"
	self.masks.pbm = {}
	self.masks.pbm.unit = "units/pd2_dlc_pbm/masks/msk_pbm"
	self.masks.pbm.name_id = "bm_msk_pbm"
	self.masks.pbm.pcs = {}
	self.masks.pbm.value = 0
	self.masks.pbm.texture_bundle_folder = "pbm"
	self.masks.pbm.sort_number = 57
	self.masks.pbm.type = "helmet"
	self.masks.pbm.dlc = "pbm"
	self.masks.pbm.global_value = "pbm"
	self.masks.kwm = {}
	self.masks.kwm.unit = "units/pd2_dlc_kwm/masks/msk_kwm"
	self.masks.kwm.name_id = "bm_msk_kwm"
	self.masks.kwm.pcs = {}
	self.masks.kwm.value = 0
	self.masks.kwm.texture_bundle_folder = "kwm"
	self.masks.kwm.sort_number = 58
	self.masks.kwm.type = "helmet"
	self.masks.myh = {}
	self.masks.myh.unit = "units/pd2_dlc_myh/masks/msk_myh"
	self.masks.myh.name_id = "bm_msk_myh"
	self.masks.myh.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.myh.value = 0
	self.masks.myh.texture_bundle_folder = "myh"
	self.masks.myh.sort_number = 55
	self.masks.myh.infamous = true
	self.masks.myh.global_value = "infamous"
	self.masks.myh_begins = {}
	self.masks.myh_begins.unit = "units/pd2_dlc_myh/masks/msk_myh_begins"
	self.masks.myh_begins.name_id = "bm_msk_myh_begins"
	self.masks.myh_begins.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.myh_begins.value = 0
	self.masks.myh_begins.texture_bundle_folder = "myh"
	self.masks.myh_begins.sort_number = 55
	self.masks.myh_begins.infamous = true
	self.masks.myh_begins.global_value = "infamous"
	self.masks.mmh = {}
	self.masks.mmh.unit = "units/pd2_dlc_mmh/masks/mmh_01/msk_mmh"
	self.masks.mmh.name_id = "bm_msk_mmh"
	self.masks.mmh.pcs = {}
	self.masks.mmh.value = 0
	self.masks.mmh.texture_bundle_folder = "mmh"
	self.masks.mmh.sort_number = 56
	self.masks.mmh.global_value = "mmh"
	self.masks.sds_01 = {}
	self.masks.sds_01.unit = "units/pd2_dlc_sds/masks/sds_01/msk_sds_01"
	self.masks.sds_01.name_id = "bm_msl_sds_01"
	self.masks.sds_01.pcs = {}
	self.masks.sds_01.value = 0
	self.masks.sds_01.texture_bundle_folder = "sds"
	self.masks.sds_01.sort_number = 59
	self.masks.sds_01.global_value = "halloween"
	self.masks.sds_02 = {}
	self.masks.sds_02.unit = "units/pd2_dlc_sds/masks/sds_02/msk_sds_02"
	self.masks.sds_02.name_id = "bm_msl_sds_02"
	self.masks.sds_02.pcs = {}
	self.masks.sds_02.value = 0
	self.masks.sds_02.texture_bundle_folder = "sds"
	self.masks.sds_02.sort_number = 59
	self.masks.sds_02.global_value = "halloween"
	self.masks.sds_03 = {}
	self.masks.sds_03.unit = "units/pd2_dlc_sds/masks/sds_03/msk_sds_03"
	self.masks.sds_03.name_id = "bm_msl_sds_03"
	self.masks.sds_03.pcs = {}
	self.masks.sds_03.value = 0
	self.masks.sds_03.texture_bundle_folder = "sds"
	self.masks.sds_03.sort_number = 59
	self.masks.sds_03.global_value = "halloween"
	self.masks.sds_04 = {}
	self.masks.sds_04.unit = "units/pd2_dlc_sds/masks/sds_04/msk_sds_04"
	self.masks.sds_04.name_id = "bm_msl_sds_04"
	self.masks.sds_04.pcs = {}
	self.masks.sds_04.value = 0
	self.masks.sds_04.texture_bundle_folder = "sds"
	self.masks.sds_04.sort_number = 59
	self.masks.sds_04.global_value = "halloween"
	self.masks.sds_05 = {}
	self.masks.sds_05.unit = "units/pd2_dlc_sds/masks/sds_05/msk_sds_05"
	self.masks.sds_05.name_id = "bm_msl_sds_05"
	self.masks.sds_05.pcs = {}
	self.masks.sds_05.value = 0
	self.masks.sds_05.texture_bundle_folder = "sds"
	self.masks.sds_05.sort_number = 59
	self.masks.sds_05.global_value = "halloween"
	self.masks.sds_06 = {}
	self.masks.sds_06.unit = "units/pd2_dlc_sds/masks/sds_06/msk_sds_06"
	self.masks.sds_06.name_id = "bm_msl_sds_06"
	self.masks.sds_06.pcs = {}
	self.masks.sds_06.value = 0
	self.masks.sds_06.texture_bundle_folder = "sds"
	self.masks.sds_06.sort_number = 59
	self.masks.sds_06.global_value = "halloween"
	self.masks.sds_07 = {}
	self.masks.sds_07.unit = "units/pd2_dlc_sds/masks/sds_07/msk_sds_07"
	self.masks.sds_07.name_id = "bm_msl_sds_07"
	self.masks.sds_07.pcs = {}
	self.masks.sds_07.value = 0
	self.masks.sds_07.texture_bundle_folder = "sds"
	self.masks.sds_07.sort_number = 59
	self.masks.sds_07.global_value = "halloween"
	self.masks.ecp_male = {}
	self.masks.ecp_male.unit = "units/pd2_dlc_ecp/masks/msk_ecp_male/msk_ecp_male"
	self.masks.ecp_male.name_id = "bm_msk_ecp_male"
	self.masks.ecp_male.pcs = {}
	self.masks.ecp_male.value = 0
	self.masks.ecp_male.texture_bundle_folder = "ecp"
	self.masks.ecp_male.sort_number = 60
	self.masks.ecp_male.type = "helmet"
	self.masks.ecp_male.global_value = "ecp"
	self.masks.ecp_female = {}
	self.masks.ecp_female.unit = "units/pd2_dlc_ecp/masks/msk_ecp_female/msk_ecp_female"
	self.masks.ecp_female.name_id = "bm_msk_ecp_female"
	self.masks.ecp_female.pcs = {}
	self.masks.ecp_female.value = 0
	self.masks.ecp_female.texture_bundle_folder = "ecp"
	self.masks.ecp_female.sort_number = 60
	self.masks.ecp_female.type = "helmet"
	self.masks.ecp_female.global_value = "ecp"
	self.masks.ecp_male.offsets = {
		wolf = {
			Vector3(0, 0, 0.792991),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0, 0.912237),
			Rotation(-0, -0, -0)
		},
		dragan = {
			Vector3(0, 0, 0.316006),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 0, 0.196759),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.ecp_female_begins = {}
	self.masks.ecp_female_begins.unit = "units/pd2_dlc_ecp/masks/msk_ecp_female_begins/msk_ecp_female_begins"
	self.masks.ecp_female_begins.name_id = "bm_msk_ecp_female_begins"
	self.masks.ecp_female_begins.pcs = {}
	self.masks.ecp_female_begins.value = 0
	self.masks.ecp_female_begins.texture_bundle_folder = "ecp"
	self.masks.ecp_female_begins.sort_number = 60
	self.masks.ecp_female_begins.global_value = "ecp"
	self.masks.ecp_male_begins = {}
	self.masks.ecp_male_begins.unit = "units/pd2_dlc_ecp/masks/msk_ecp_male_begins/msk_ecp_male_begins"
	self.masks.ecp_male_begins.name_id = "bm_msk_ecp_male_begins"
	self.masks.ecp_male_begins.pcs = {}
	self.masks.ecp_male_begins.value = 0
	self.masks.ecp_male_begins.texture_bundle_folder = "ecp"
	self.masks.ecp_male_begins.sort_number = 60
	self.masks.ecp_male_begins.global_value = "ecp"
	self.masks.rvd_01 = {}
	self.masks.rvd_01.unit = "units/pd2_dlc_rvd/masks/msk_rvd_01/msk_rvd_01"
	self.masks.rvd_01.name_id = "bm_msk_rvd_01"
	self.masks.rvd_01.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rvd_01.value = 0
	self.masks.rvd_01.texture_bundle_folder = "rvd"
	self.masks.rvd_01.sort_number = 61
	self.masks.rvd_01.type = "glasses"
	self.masks.rvd_01.skip_mask_on_sequence = true
	self.masks.rvd_01.global_value = "rvd"
	self.masks.rvd_01.dlc = "rvd"
	self.masks.rvd_01.offsets = {
		sydney = {
			Vector3(0, 4.01264, -1.94967),
			Rotation(0, 18.5881, 0)
		},
		dragon = {
			Vector3(0.196759, 4.48963, -1.2342),
			Rotation(0, 15.1538, 0)
		},
		female_1 = {
			Vector3(0, 3.6549, -1.11495),
			Rotation(0, 15.1538, 0)
		},
		hoxton = {
			Vector3(0, 3.6549, -1.94967),
			Rotation(0, 15.1538, 0)
		},
		sokol = {
			Vector3(0, 2.82018, -0.637965),
			Rotation(0, 10.0024, 0)
		},
		wolf = {
			Vector3(0, 3.53566, -0.280226),
			Rotation(0, 10.861, 0)
		},
		bodhi = {
			Vector3(-0.16098, 3.6549, -1.94967),
			Rotation(0, 16.0124, 0)
		},
		jimmy = {
			Vector3(0, 3.53566, -0.757211),
			Rotation(0, 10.0024, 0)
		},
		max = {
			Vector3(0, 4.13189, -2.66515),
			Rotation(0, 18.5881, 0)
		},
		dallas = {
			Vector3(0, 3.17792, -1.71118),
			Rotation(0, 14.2953, 0)
		},
		dragan = {
			Vector3(0, 3.05867, -1.59194),
			Rotation(0, 14.2953, 0)
		},
		wild = {
			Vector3(0, 3.17792, -1.47269),
			Rotation(0, 9.14383, 0)
		},
		old_hoxton = {
			Vector3(0, 3.6549, -2.54591),
			Rotation(0, 18.5881, 0)
		},
		chains = {
			Vector3(0, 3.6549, -1.11495),
			Rotation(0, 14.2953, 0)
		},
		ecp_female = {
			Vector3(0, 2.70093, -1.11495),
			Rotation(0, 10.861, 0)
		},
		ecp_male = {
			Vector3(0.077513, 3.17792, -1.2342),
			Rotation(0, 14.2953, 0)
		},
		jowi = {
			Vector3(0.077513, 3.29716, -1.59194),
			Rotation(0, 15.1538, 0)
		},
		chico = {
			Vector3(0, 4.13189, -2.90365),
			Rotation(0, 18.5881, 0)
		},
		myh = {
			Vector3(0, 3.6549, -2.7844),
			Rotation(0, 19.4467, 0)
		},
		jacket = {
			Vector3(0.077513, 4.01264, -1.59194),
			Rotation(0, 16.0124, 0)
		},
		bonnie = {
			Vector3(0, 3.8934, -1.2342),
			Rotation(0, 14.2953, 0)
		},
		joy = {
			Vector3(0, 4.37038, -2.06892),
			Rotation(0, 18.5881, 0)
		}
	}
	self.masks.rvd_02 = {}
	self.masks.rvd_02.unit = "units/pd2_dlc_rvd/masks/msk_rvd_02/msk_rvd_02"
	self.masks.rvd_02.name_id = "bm_msk_rvd_02"
	self.masks.rvd_02.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rvd_02.value = 0
	self.masks.rvd_02.texture_bundle_folder = "rvd"
	self.masks.rvd_02.type = "glasses"
	self.masks.rvd_02.skip_mask_on_sequence = true
	self.masks.rvd_02.sort_number = 60
	self.masks.rvd_02.global_value = "rvd"
	self.masks.rvd_02.dlc = "rvd"
	self.masks.rvd_02.offsets = {
		jacket = {
			Vector3(0, 1.03149, -1.11495),
			Rotation(0, 3.9924, 0)
		},
		dallas = {
			Vector3(0, 0.316008, -1.47269),
			Rotation(0, 3.9924, 0)
		},
		jowi = {
			Vector3(0, 0.673747, -1.59193),
			Rotation(0, 7.4267, 0)
		},
		max = {
			Vector3(0, 1.15073, -1.59193),
			Rotation(0, 4.85098, 0)
		},
		dragon = {
			Vector3(0, 0.435254, -0.399471),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, 0.435254, -1.83043),
			Rotation(0, 6.56812, 0)
		},
		chains = {
			Vector3(0.0775149, 0.792993, -1.11495),
			Rotation(-0.300467, 4.85098, 1.66753e-09)
		},
		chico = {
			Vector3(-0.0417315, 0.673747, -1.2342),
			Rotation(0, 3.13383, 0)
		},
		myh = {
			Vector3(0, 0.5545, -1.47269),
			Rotation(0, 5.70955, 0)
		},
		hoxton = {
			Vector3(0, 0.5545, -0.876456),
			Rotation(0, 3.13383, 0)
		},
		sokol = {
			Vector3(0, -0.637963, -0.0417315),
			Rotation(0, -2.01761, 0)
		},
		ecp_female = {
			Vector3(0, -0.518717, -0.876456),
			Rotation(-0, -0, -0)
		},
		ecp_male = {
			Vector3(0, 0.5545, -1.2342),
			Rotation(0, 7.4267, 0)
		},
		wild = {
			Vector3(0, 0.5545, -1.2342),
			Rotation(0, 3.9924, 0)
		},
		bodhi = {
			Vector3(0, 0.912239, -0.75721),
			Rotation(0, 5.70955, 0)
		},
		jimmy = {
			Vector3(0, 1.26998, -1.11495),
			Rotation(0, 4.85098, 0)
		},
		chains = {
			Vector3(0, 0.316008, -0.995702),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, 0.316008, 0.0775149),
			Rotation(0, -0.300467, 0)
		}
	}
	self.masks.rvd_03 = {}
	self.masks.rvd_03.unit = "units/pd2_dlc_rvd/masks/rvd_03/msk_rvd_03"
	self.masks.rvd_03.name_id = "bm_msk_rvd_03"
	self.masks.rvd_03.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.rvd_03.value = 0
	self.masks.rvd_03.texture_bundle_folder = "rvd"
	self.masks.rvd_03.sort_number = 61
	self.masks.rvd_03.type = "glasses"
	self.masks.rvd_03.skip_mask_on_sequence = true
	self.masks.rvd_03.global_value = "rvd"
	self.masks.rvd_03.dlc = "rvd"
	self.masks.rvd_03.offsets = {
		sydney = {
			Vector3(0.077513, 3.53566, -1.11495),
			Rotation(0, 13.4367, 0)
		},
		dragon = {
			Vector3(0.196759, 3.29716, -1.11495),
			Rotation(0, 10.861, 0)
		},
		female_1 = {
			Vector3(0, 2.34319, -0.995704),
			Rotation(0, 8.28526, 0)
		},
		hoxton = {
			Vector3(0, 3.29716, -1.83043),
			Rotation(0, 13.4367, 0)
		},
		sokol = {
			Vector3(0, 1.26998, 0.673745),
			Rotation(0, 0, -0)
		},
		wolf = {
			Vector3(0, 3.05867, -0.280226),
			Rotation(0, 10.0024, 0)
		},
		bodhi = {
			Vector3(0, 2.93943, -1.71118),
			Rotation(0, 11.7196, 0)
		},
		jowi = {
			Vector3(0, 3.05867, -1.94967),
			Rotation(0, 14.2953, -0.30048)
		},
		jacket = {
			Vector3(-0.0417333, 2.93943, -0.399472),
			Rotation(0, 6.56811, 0)
		},
		dallas = {
			Vector3(0, 2.70093, -1.35344),
			Rotation(0, 10.0024, 0)
		},
		bonnie = {
			Vector3(0, 2.70093, -0.518719),
			Rotation(0, 6.56811, 0)
		},
		chains = {
			Vector3(0, 3.41641, -1.83043),
			Rotation(0, 13.4367, 0)
		},
		old_hoxton = {
			Vector3(0, 2.58169, -1.71118),
			Rotation(0, 11.7196, 0)
		},
		wild = {
			Vector3(0, 2.34319, -0.399472),
			Rotation(0, 4.85096, 0)
		},
		ecp_female = {
			Vector3(0, 2.1047, -0.876458),
			Rotation(0, 5.70954, 0)
		},
		ecp_male = {
			Vector3(0, 3.29716, -1.2342),
			Rotation(0, 16.0124, 0)
		},
		max = {
			Vector3(0, 3.41641, -2.30741),
			Rotation(0, 15.1538, 0)
		},
		chico = {
			Vector3(0, 2.93943, -1.2342),
			Rotation(0, 11.7196, 0)
		},
		myh = {
			Vector3(0, 3.05867, -2.06892),
			Rotation(0, 15.1538, 0)
		},
		jimmy = {
			Vector3(0, 4.13189, -1.47269),
			Rotation(0, 12.5781, 0)
		},
		dragan = {
			Vector3(0, 2.46244, -0.876458),
			Rotation(0, 9.14383, 0)
		},
		joy = {
			Vector3(0, 3.29716, -0.637965),
			Rotation(0, 12.5781, 0)
		}
	}
	self.masks.ami_01 = {}
	self.masks.ami_01.unit = "units/pd2_dlc_ami/masks/ami_01/msk_ami_01"
	self.masks.ami_01.name_id = "bm_msk_ami_01"
	self.masks.ami_01.pcs = {}
	self.masks.ami_01.value = 0
	self.masks.ami_01.texture_bundle_folder = "ami"
	self.masks.ami_01.sort_number = 105
	self.masks.ami_01.global_value = "infamous"
	self.masks.ami_01.offsets = {
		joy = {
			Vector3(0, 0.077513, 0.912237),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0, 0.673745, 0),
			Rotation(-0, -0, -0)
		},
		bodhi = {
			Vector3(0, 0.196759, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.ami_02 = {}
	self.masks.ami_02.unit = "units/pd2_dlc_ami/masks/ami_02/msk_ami_02"
	self.masks.ami_02.name_id = "bm_msk_ami_02"
	self.masks.ami_02.pcs = {}
	self.masks.ami_02.value = 0
	self.masks.ami_02.texture_bundle_folder = "ami"
	self.masks.ami_02.sort_number = 100
	self.masks.ami_02.global_value = "infamous"
	self.masks.ami_03 = {}
	self.masks.ami_03.unit = "units/pd2_dlc_ami/masks/ami_03/msk_ami_03"
	self.masks.ami_03.name_id = "bm_msk_ami_03"
	self.masks.ami_03.pcs = {}
	self.masks.ami_03.value = 0
	self.masks.ami_03.texture_bundle_folder = "ami"
	self.masks.ami_03.sort_number = 101
	self.masks.ami_03.global_value = "infamous"
	self.masks.ami_04 = {}
	self.masks.ami_04.unit = "units/pd2_dlc_ami/masks/ami_04/msk_ami_04"
	self.masks.ami_04.name_id = "bm_msk_ami_04"
	self.masks.ami_04.pcs = {}
	self.masks.ami_04.value = 0
	self.masks.ami_04.type = "helmet"
	self.masks.ami_04.texture_bundle_folder = "ami"
	self.masks.ami_04.sort_number = 103
	self.masks.ami_04.global_value = "infamous"
	self.masks.ami_05 = {}
	self.masks.ami_05.unit = "units/pd2_dlc_ami/masks/ami_05/msk_ami_05"
	self.masks.ami_05.name_id = "bm_msk_ami_05"
	self.masks.ami_05.pcs = {}
	self.masks.ami_05.value = 0
	self.masks.ami_05.texture_bundle_folder = "ami"
	self.masks.ami_05.sort_number = 102
	self.masks.ami_05.global_value = "infamous"
	self.masks.ami_06 = {}
	self.masks.ami_06.unit = "units/pd2_dlc_ami/masks/ami_06/msk_ami_06"
	self.masks.ami_06.name_id = "bm_msk_ami_06"
	self.masks.ami_06.pcs = {}
	self.masks.ami_06.value = 0
	self.masks.ami_06.texture_bundle_folder = "ami"
	self.masks.ami_06.sort_number = 106
	self.masks.ami_06.global_value = "infamous"
	self.masks.cmt_01 = {}
	self.masks.cmt_01.unit = "units/pd2_dlc_cmt/masks/cmt_01/msk_cmt_01"
	self.masks.cmt_01.name_id = "bm_msk_cmt_01"
	self.masks.cmt_01.pcs = {}
	self.masks.cmt_01.value = 0
	self.masks.cmt_01.texture_bundle_folder = "cmt"
	self.masks.cmt_01.sort_number = 62
	self.masks.cmt_01.global_value = "cmt"
	self.masks.cmt_02 = {}
	self.masks.cmt_02.unit = "units/pd2_dlc_cmt/masks/cmt_02/msk_cmt_02"
	self.masks.cmt_02.name_id = "bm_msk_cmt_02"
	self.masks.cmt_02.pcs = {}
	self.masks.cmt_02.value = 0
	self.masks.cmt_02.texture_bundle_folder = "cmt"
	self.masks.cmt_02.sort_number = 62
	self.masks.cmt_02.global_value = "cmt"
	self.masks.cmt_03 = {}
	self.masks.cmt_03.unit = "units/pd2_dlc_cmt/masks/cmt_03/msk_cmt_03"
	self.masks.cmt_03.name_id = "bm_msk_cmt_03"
	self.masks.cmt_03.pcs = {}
	self.masks.cmt_03.value = 0
	self.masks.cmt_03.texture_bundle_folder = "cmt"
	self.masks.cmt_03.sort_number = 62
	self.masks.cmt_03.global_value = "cmt"
	self.masks.cmt_04 = {}
	self.masks.cmt_04.unit = "units/pd2_dlc_cmt/masks/cmt_04/msk_cmt_04"
	self.masks.cmt_04.name_id = "bm_msk_cmt_04"
	self.masks.cmt_04.pcs = {}
	self.masks.cmt_04.value = 0
	self.masks.cmt_04.texture_bundle_folder = "cmt"
	self.masks.cmt_04.sort_number = 62
	self.masks.cmt_04.global_value = "cmt"
	self.masks.sdm_01 = {}
	self.masks.sdm_01.unit = "units/pd2_dlc_sdm/masks/sdm_01/msk_sdm_01"
	self.masks.sdm_01.name_id = "bm_msk_sdm_01"
	self.masks.sdm_01.pcs = {}
	self.masks.sdm_01.value = 0
	self.masks.sdm_01.texture_bundle_folder = "sdm"
	self.masks.sdm_01.sort_number = 64
	self.masks.sdm_01.global_value = "sdm"
	self.masks.sdm_02 = {}
	self.masks.sdm_02.unit = "units/pd2_dlc_sdm/masks/sdm_02/msk_sdm_02"
	self.masks.sdm_02.name_id = "bm_msk_sdm_02"
	self.masks.sdm_02.pcs = {}
	self.masks.sdm_02.value = 0
	self.masks.sdm_02.texture_bundle_folder = "sdm"
	self.masks.sdm_02.sort_number = 64
	self.masks.sdm_02.global_value = "sdm"
	self.masks.sdm_03 = {}
	self.masks.sdm_03.unit = "units/pd2_dlc_sdm/masks/sdm_03/msk_sdm_03"
	self.masks.sdm_03.name_id = "bm_msk_sdm_03"
	self.masks.sdm_03.pcs = {}
	self.masks.sdm_03.value = 0
	self.masks.sdm_03.texture_bundle_folder = "sdm"
	self.masks.sdm_03.sort_number = 64
	self.masks.sdm_03.global_value = "sdm"
	self.masks.sdm_04 = {}
	self.masks.sdm_04.unit = "units/pd2_dlc_sdm/masks/sdm_04/msk_sdm_04"
	self.masks.sdm_04.name_id = "bm_msk_sdm_04"
	self.masks.sdm_04.pcs = {}
	self.masks.sdm_04.value = 0
	self.masks.sdm_04.texture_bundle_folder = "sdm"
	self.masks.sdm_04.sort_number = 64
	self.masks.sdm_04.global_value = "sdm"
	self.masks.gwm = {}
	self.masks.gwm.unit = "units/pd2_dlc_gwm/masks/gwm/msk_gwm"
	self.masks.gwm.name_id = "bm_msk_gwm"
	self.masks.gwm.pcs = {}
	self.masks.gwm.value = 0
	self.masks.gwm.texture_bundle_folder = "gwm"
	self.masks.gwm.sort_number = 65
	self.masks.gwm.global_value = "pd2_clan"
	self.masks.ggac_od_t2 = {}
	self.masks.ggac_od_t2.unit = "units/pd2_dlc_ggac/masks/ggac_od_t2/msk_ggac_od_t2"
	self.masks.ggac_od_t2.name_id = "bm_msk_ggac"
	self.masks.ggac_od_t2.pcs = {}
	self.masks.ggac_od_t2.value = 0
	self.masks.ggac_od_t2.qlvl = 0
	self.masks.ggac_od_t2.infamous = true
	self.masks.ggac_od_t2.texture_bundle_folder = "ggac"
	self.masks.ggac_od_t2.sort_number = 36
	self.masks.flm_01 = {}
	self.masks.flm_01.unit = "units/pd2_dlc_flm/masks/flm/msk_flm_01"
	self.masks.flm_01.name_id = "bm_msk_cheat_error"
	self.masks.flm_01.type = "helmet"
	self.masks.flm_01.inaccessible = true
	self.masks.flm_01.offsets = {
		dragon = {
			Vector3(0, 0.077513, 0.673745),
			Rotation(0, -5.45192, 0)
		},
		wolf = {
			Vector3(0, -0.757211, 1.38922),
			Rotation(0, -3.73477, 0)
		},
		old_hoxton = {
			Vector3(0, -0.757211, 0.077513),
			Rotation(0, -3.73477, 0)
		},
		chico = {
			Vector3(0, -0.757211, 1.50847),
			Rotation(0, -6.3105, 0)
		},
		jowi = {
			Vector3(0, -0.757211, 1.03148),
			Rotation(0, -1.15905, 0)
		},
		jimmy = {
			Vector3(0, 0.554498, 0.316006),
			Rotation(0, -0.30048, 0)
		},
		bonnie = {
			Vector3(0, -0.280226, 1.26998),
			Rotation(0, -2.8762, 0)
		}
	}
	self.masks.flm_clover = {}
	self.masks.flm_clover.unit = "units/pd2_dlc_flm/masks/flm/msk_flm_clover"
	self.masks.flm_clover.name_id = "bm_msk_cheat_error"
	self.masks.flm_clover.type = "helmet"
	self.masks.flm_clover.inaccessible = true
	self.masks.flm_jacket = {}
	self.masks.flm_jacket.unit = "units/pd2_dlc_flm/masks/flm/msk_flm_jacket"
	self.masks.flm_jacket.name_id = "bm_msk_cheat_error"
	self.masks.flm_jacket.type = "helmet"
	self.masks.flm_jacket.inaccessible = true
	self.masks.flm_jacket.offsets = {
		jacket = {
			Vector3(0, 0, 0),
			Rotation(0, -0.30048, 0)
		},
		joy = {
			Vector3(0, 0.673745, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.flm_sydney = {}
	self.masks.flm_sydney.unit = "units/pd2_dlc_flm/masks/flm/msk_flm_sydney"
	self.masks.flm_sydney.name_id = "bm_msk_cheat_error"
	self.masks.flm_sydney.type = "helmet"
	self.masks.flm_sydney.inaccessible = true
	self.masks.flm_sydney.offsets = {
		sydney = {
			Vector3(0, -0.0417333, 0.435252),
			Rotation(0, 0.558094, 0)
		}
	}
	self.masks.flm_sokol = {}
	self.masks.flm_sokol.unit = "units/pd2_dlc_flm/masks/flm/msk_flm_sokol"
	self.masks.flm_sokol.name_id = "bm_msk_cheat_error"
	self.masks.flm_sokol.type = "helmet"
	self.masks.flm_sokol.inaccessible = true
	self.masks.flm_ethan = {}
	self.masks.flm_ethan.unit = "units/pd2_dlc_flm/masks/flm/msk_flm_ethan"
	self.masks.flm_ethan.name_id = "bm_msk_cheat_error"
	self.masks.flm_ethan.type = "helmet"
	self.masks.flm_ethan.inaccessible = true
	self.masks.flm_ethan.offsets = {
		ecp_male = {
			Vector3(0, -3.02289, 1.38922),
			Rotation(0, -12.3205, 0)
		}
	}
	self.masks.flm = {}
	self.masks.flm.name_id = "bm_msk_flm"
	self.masks.flm.value = 0
	self.masks.flm.pcs = {}
	self.masks.flm.type = "helmet"
	self.masks.flm.texture_bundle_folder = "flm"
	self.masks.flm.sort_number = 68
	self.masks.flm.dlc = "flm"
	self.masks.flm.global_value = "flm"
	self.masks.flm.night_vision = {
		effect = "color_night_vision",
		light = not _G.IS_VR and 0.3 or 0.1
	}
	self.masks.flm.characters = {
		bodhi = "flm_01",
		bonnie = "flm_01",
		chains = "flm_01",
		chico = "flm_01",
		dallas = "flm_01",
		dragan = "flm_01",
		dragon = "flm_01",
		ecp_female = "flm_01",
		ecp_male = "flm_ethan",
		female_1 = "flm_clover",
		hoxton = "flm_01",
		jacket = "flm_jacket",
		jimmy = "flm_01",
		jowi = "flm_01",
		joy = "flm_jacket",
		max = "flm_01",
		myh = "flm_01",
		old_hoxton = "flm_01",
		sokol = "flm_sokol",
		sydney = "flm_sydney",
		wild = "flm_01",
		wolf = "flm_01"
	}
	self.masks.toon_01 = {}
	self.masks.toon_01.unit = "units/pd2_dlc_toon/masks/toon_01/msk_toon_01"
	self.masks.toon_01.name_id = "bm_msk_toon_01"
	self.masks.toon_01.pcs = {}
	self.masks.toon_01.value = 0
	self.masks.toon_01.texture_bundle_folder = "toon"
	self.masks.toon_01.sort_number = 69
	self.masks.toon_01.dlc = "toon"
	self.masks.toon_01.global_value = "toon"
	self.masks.toon_02 = {}
	self.masks.toon_02.unit = "units/pd2_dlc_toon/masks/toon_02/msk_toon_02"
	self.masks.toon_02.name_id = "bm_msk_toon_02"
	self.masks.toon_02.pcs = {}
	self.masks.toon_02.value = 0
	self.masks.toon_02.texture_bundle_folder = "toon"
	self.masks.toon_02.sort_number = 69
	self.masks.toon_02.dlc = "toon"
	self.masks.toon_02.global_value = "toon"
	self.masks.toon_03 = {}
	self.masks.toon_03.unit = "units/pd2_dlc_toon/masks/toon_03/msk_toon_03"
	self.masks.toon_03.name_id = "bm_msk_toon_03"
	self.masks.toon_03.pcs = {}
	self.masks.toon_03.value = 0
	self.masks.toon_03.texture_bundle_folder = "toon"
	self.masks.toon_03.sort_number = 69
	self.masks.toon_03.dlc = "toon"
	self.masks.toon_03.global_value = "toon"
	self.masks.toon_03.offsets = {
		wild = {
			Vector3(0, -0.399472, -0.280226),
			Rotation(0, 3.99239, 0)
		},
		sydney = {
			Vector3(0, -0.876458, -0.995704),
			Rotation(0, 9.14383, 0)
		}
	}
	self.masks.toon_04 = {}
	self.masks.toon_04.unit = "units/pd2_dlc_toon/masks/toon_04/msk_toon_04"
	self.masks.toon_04.name_id = "bm_msk_toon_04"
	self.masks.toon_04.pcs = {}
	self.masks.toon_04.value = 0
	self.masks.toon_04.texture_bundle_folder = "toon"
	self.masks.toon_04.sort_number = 69
	self.masks.toon_04.dlc = "toon"
	self.masks.toon_04.global_value = "toon"
	self.masks.ghx = {}
	self.masks.ghx.unit = "units/pd2_dlc_ghx/masks/msk_ghx_reborn/msk_ghx_reborn"
	self.masks.ghx.name_id = "bm_msk_ghx"
	self.masks.ghx.pcs = {}
	self.masks.ghx.value = 0
	self.masks.ghx.texture_bundle_folder = "ghx"
	self.masks.ghx.sort_number = 65
	self.masks.ghx.global_value = "pd2_clan"
	self.masks.ghx.offsets = {
		joy = {
			Vector3(-0.399472, 0.435252, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.ghm = {}
	self.masks.ghm.unit = "units/pd2_dlc_ghm/masks/msk_ghm/msk_ghm"
	self.masks.ghm.name_id = "bm_msk_ghm"
	self.masks.ghm.pcs = {}
	self.masks.ghm.value = 0
	self.masks.ghm.texture_bundle_folder = "ghm"
	self.masks.ghm.sort_number = 65
	self.masks.ghm.global_value = "pd2_clan"
	self.masks.tam = {}
	self.masks.tam.unit = "units/pd2_dlc_tam/masks/tam/msk_tam"
	self.masks.tam.name_id = "bm_msk_tam"
	self.masks.tam.pcs = {}
	self.masks.tam.value = 0
	self.masks.tam.texture_bundle_folder = "tam"
	self.masks.tam.sort_number = 107
	self.masks.tam.global_value = "tam"
	self.masks.skm_07 = {}
	self.masks.skm_07.global_value = "infamous"
	self.masks.skm_07.unit = "units/pd2_dlc_skm/masks/skm_07/msk_skm_07"
	self.masks.skm_07.name_id = "bm_msk_skm_07"
	self.masks.skm_07.pcs = {}
	self.masks.skm_07.value = 0
	self.masks.skm_07.type = "helmet"
	self.masks.skm_07.texture_bundle_folder = "skm"
	self.masks.skm_07.sort_number = 71
	self.masks.skm_08 = {}
	self.masks.skm_08.global_value = "infamous"
	self.masks.skm_08.unit = "units/pd2_dlc_skm/masks/skm_08/msk_skm_08"
	self.masks.skm_08.name_id = "bm_msk_skm_08"
	self.masks.skm_08.pcs = {}
	self.masks.skm_08.value = 0
	self.masks.skm_08.type = "helmet"
	self.masks.skm_08.texture_bundle_folder = "skm"
	self.masks.skm_08.sort_number = 71
	self.masks.skm_common_01 = {}
	self.masks.skm_common_01.unit = "units/pd2_dlc_skm/masks/skm_01/msk_skm_01"
	self.masks.skm_common_01.name_id = "bm_msk_cheat_error"
	self.masks.skm_common_01.pcs = {}
	self.masks.skm_common_01.value = 0
	self.masks.skm_common_01.texture_bundle_folder = "skm"
	self.masks.skm_common_01.sort_number = 71
	self.masks.skm_common_01.type = "helmet"
	self.masks.skm_common_01.inaccessible = true
	self.masks.skm_common_01.offsets = {
		sydney = {
			Vector3(0.554498, 3.29716, -0.399472),
			Rotation(0, 4.85096, 0)
		},
		chains = {
			Vector3(0, 0, 0.196759),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 3.17792, -1.11495),
			Rotation(0, 9.14383, 0)
		},
		hoxton = {
			Vector3(0.316006, 0, 0),
			Rotation(-0, -0, -0)
		},
		sokol = {
			Vector3(0.316006, 1.86621, 0.077513),
			Rotation(0, 3.99239, 0)
		},
		wolf = {
			Vector3(0.435252, 1.50847, 0.554498),
			Rotation(-0, -0, -0)
		},
		bodhi = {
			Vector3(0, 0.196759, 0.554498),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0.077513, 2.70093, -2.42666),
			Rotation(0, 11.7196, 0)
		},
		max = {
			Vector3(0.196759, 1.03148, 0),
			Rotation(-0, -0, -0)
		},
		dallas = {
			Vector3(0, -0.16098, 0),
			Rotation(-0, -0, -0)
		},
		joy = {
			Vector3(0.316006, 2.93943, -1.2342),
			Rotation(0, 6.56811, 0)
		},
		bonnie = {
			Vector3(0.316006, 1.98545, 0.792991),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, 0.316006, 0),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0.196759, -0.16098, 0.435252),
			Rotation(-0, -0, -0)
		},
		wild = {
			Vector3(0.316006, 0, 0),
			Rotation(-0, -0, -0)
		},
		ecp_male = {
			Vector3(0.316006, 1.98545, -1.47269),
			Rotation(0, 8.28526, 0)
		},
		jacket = {
			Vector3(0.316006, 1.26998, -0.0417333),
			Rotation(0, 3.13382, 0)
		},
		chico = {
			Vector3(0.554498, 1.15073, 0.792991),
			Rotation(-0, -0, -0)
		},
		myh = {
			Vector3(0.077513, 0.196759, 0.316006),
			Rotation(-0, -0, -0)
		},
		jowi = {
			Vector3(0.316006, 0.316006, 1.03148),
			Rotation(-0, -0, -0)
		},
		dragan = {
			Vector3(0.196759, 1.50847, -0.757211),
			Rotation(0, 6.56811, 0)
		}
	}
	self.masks.skm_hila_01 = {}
	self.masks.skm_hila_01.unit = "units/pd2_dlc_skm/masks/skm_01/msk_skm_hila_01"
	self.masks.skm_hila_01.name_id = "bm_msk_cheat_error"
	self.masks.skm_hila_01.type = "glasses"
	self.masks.skm_hila_01.skip_mask_on_sequence = true
	self.masks.skm_hila_01.inaccessible = true
	self.masks.skm_hila_01.offsets = {
		ecp_female = {
			Vector3(0, 0.196759, -1.47269),
			Rotation(0, 10.0024, 0)
		}
	}
	self.masks.skm_01 = {}
	self.masks.skm_01.global_value = "infamous"
	self.masks.skm_01.name_id = "bm_msk_skm_01"
	self.masks.skm_01.value = 0
	self.masks.skm_01.pcs = {}
	self.masks.skm_01.type = "helmet"
	self.masks.skm_01.texture_bundle_folder = "skm"
	self.masks.skm_01.sort_number = 71
	self.masks.skm_01.characters = {
		bodhi = "skm_common_01",
		bonnie = "skm_common_01",
		chains = "skm_common_01",
		chico = "skm_common_01",
		dallas = "skm_common_01",
		dragan = "skm_common_01",
		dragon = "skm_common_01",
		ecp_female = "skm_hila_01",
		ecp_male = "skm_common_01",
		female_1 = "skm_common_01",
		hoxton = "skm_common_01",
		jacket = "skm_common_01",
		jimmy = "skm_common_01",
		jowi = "skm_common_01",
		joy = "skm_common_01",
		max = "skm_common_01",
		myh = "skm_common_01",
		old_hoxton = "skm_common_01",
		sokol = "skm_common_01",
		sydney = "skm_common_01",
		wild = "skm_common_01",
		wolf = "skm_common_01"
	}
	self.masks.skm_02 = {}
	self.masks.skm_02.global_value = "infamous"
	self.masks.skm_02.unit = "units/pd2_dlc_skm/masks/skm_02/msk_skm_02"
	self.masks.skm_02.name_id = "bm_msk_skm_02"
	self.masks.skm_02.pcs = {}
	self.masks.skm_02.value = 0
	self.masks.skm_02.texture_bundle_folder = "skm"
	self.masks.skm_02.sort_number = 71
	self.masks.skm_02.type = "glasses"
	self.masks.skm_02.skip_mask_on_sequence = true
	self.masks.skm_02.offsets = {
		sydney = {
			Vector3(0, -0.399472, 0),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0, 5.20511, -2.30741),
			Rotation(0, 20.3053, 0)
		},
		hoxton = {
			Vector3(-0.16098, 0.196759, 0.077513),
			Rotation(-0, -0, -0)
		},
		wild = {
			Vector3(-0.280226, -0.16098, 0.435252),
			Rotation(-2.8762, 0, 0)
		},
		ecp_female = {
			Vector3(-0.0417333, -0.399472, 0),
			Rotation(-0, -0, -0)
		},
		ecp_male = {
			Vector3(-0.0417333, -0.399472, 0.196759),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, 2.46244, -0.399472),
			Rotation(0, 12.5781, 0)
		},
		chico = {
			Vector3(0, 4.01264, -1.94967),
			Rotation(0, 21.1639, 0)
		},
		jowi = {
			Vector3(0, 4.01264, -1.94967),
			Rotation(0, 21.1639, 0)
		},
		bonnie = {
			Vector3(0, 5.32435, -1.71118),
			Rotation(0, 20.3053, 0)
		},
		dragan = {
			Vector3(0, 3.41641, -1.35344),
			Rotation(0, 15.1538, 0)
		}
	}
	self.masks.skm_common_03 = {}
	self.masks.skm_common_03.global_value = "infamous"
	self.masks.skm_common_03.unit = "units/pd2_dlc_skm/masks/skm_03/msk_skm_03"
	self.masks.skm_common_03.name_id = "bm_msk_cheat_error"
	self.masks.skm_common_03.pcs = {}
	self.masks.skm_common_03.value = 0
	self.masks.skm_common_03.texture_bundle_folder = "skm"
	self.masks.skm_common_03.sort_number = 71
	self.masks.skm_common_03.type = "glasses"
	self.masks.skm_common_03.skip_mask_on_sequence = true
	self.masks.skm_common_03.inaccessible = true
	self.masks.skm_common_03.offsets = {
		sydney = {
			Vector3(0, -0.995704, 0),
			Rotation(0, 0, -0)
		},
		chains = {
			Vector3(0, -0.280226, 0),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0, -0.876458, -0.280226),
			Rotation(0, 0, -0)
		},
		hoxton = {
			Vector3(0, 0.554498, -1.83043),
			Rotation(0, 6.56811, 0)
		},
		sokol = {
			Vector3(0, -0.757211, -0.16098),
			Rotation(0, -2.01763, 0)
		},
		wolf = {
			Vector3(0, -0.399472, 0),
			Rotation(0, 0, -0)
		},
		jowi = {
			Vector3(0, -0.399472, 0),
			Rotation(0, 0, -0)
		},
		max = {
			Vector3(0, 0.077513, -1.47269),
			Rotation(3.33607e-09, 3.13382, 1.41667)
		},
		dallas = {
			Vector3(0, 0.196759, -1.47269),
			Rotation(0, 5.70954, 0)
		},
		joy = {
			Vector3(0, -0.876458, 0),
			Rotation(0, 0, -0)
		},
		old_hoxton = {
			Vector3(0, 0.077513, -1.59194),
			Rotation(0, 6.56811, 0)
		},
		ecp_female = {
			Vector3(0, -0.757211, -0.0417333),
			Rotation(0, 0, -0)
		},
		chico = {
			Vector3(0, -0.16098, -0.757211),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(0.077513, 0.554498, -0.399472),
			Rotation(0, 0, -0)
		},
		dragan = {
			Vector3(0, -0.280226, -1.2342),
			Rotation(0, 3.13382, 0)
		}
	}
	self.masks.skm_duke_03 = {}
	self.masks.skm_duke_03.unit = "units/pd2_dlc_skm/masks/skm_03/msk_skm_duke_03"
	self.masks.skm_duke_03.name_id = "bm_msk_cheat_error"
	self.masks.skm_duke_03.type = "glasses"
	self.masks.skm_duke_03.skip_mask_on_sequence = true
	self.masks.skm_duke_03.inaccessible = true
	self.masks.skm_ethan_03 = {}
	self.masks.skm_ethan_03.unit = "units/pd2_dlc_skm/masks/skm_03/msk_skm_ethan_03"
	self.masks.skm_ethan_03.name_id = "bm_msk_cheat_error"
	self.masks.skm_ethan_03.type = "glasses"
	self.masks.skm_ethan_03.skip_mask_on_sequence = true
	self.masks.skm_ethan_03.inaccessible = true
	self.masks.skm_jiro_03 = {}
	self.masks.skm_jiro_03.unit = "units/pd2_dlc_skm/masks/skm_03/msk_skm_jiro_03"
	self.masks.skm_jiro_03.name_id = "bm_msk_cheat_error"
	self.masks.skm_jiro_03.type = "glasses"
	self.masks.skm_jiro_03.skip_mask_on_sequence = true
	self.masks.skm_jiro_03.inaccessible = true
	self.masks.skm_rust_03 = {}
	self.masks.skm_rust_03.unit = "units/pd2_dlc_skm/masks/skm_03/msk_skm_rust_03"
	self.masks.skm_rust_03.name_id = "bm_msk_cheat_error"
	self.masks.skm_rust_03.type = "glasses"
	self.masks.skm_rust_03.skip_mask_on_sequence = true
	self.masks.skm_rust_03.inaccessible = true
	self.masks.skm_03 = {}
	self.masks.skm_03.global_value = "infamous"
	self.masks.skm_03.name_id = "bm_msk_skm_03"
	self.masks.skm_03.value = 0
	self.masks.skm_03.pcs = {}
	self.masks.skm_03.type = "glasses"
	self.masks.skm_03.skip_mask_on_sequence = true
	self.masks.skm_03.texture_bundle_folder = "skm"
	self.masks.skm_03.sort_number = 71
	self.masks.skm_03.characters = {
		bodhi = "skm_common_03",
		bonnie = "skm_common_03",
		chains = "skm_common_03",
		chico = "skm_common_03",
		dallas = "skm_common_03",
		dragan = "skm_common_03",
		dragon = "skm_jiro_03",
		ecp_female = "skm_common_03",
		ecp_male = "skm_ethan_03",
		female_1 = "skm_common_03",
		hoxton = "skm_common_03",
		jacket = "skm_common_03",
		jimmy = "skm_common_03",
		jowi = "skm_common_03",
		joy = "skm_common_03",
		max = "skm_common_03",
		myh = "skm_duke_03",
		old_hoxton = "skm_common_03",
		sokol = "skm_common_03",
		sydney = "skm_common_03",
		wild = "skm_rust_03",
		wolf = "skm_common_03"
	}
	self.masks.skm_04_common = {}
	self.masks.skm_04_common.unit = "units/pd2_dlc_skm/masks/skm_04/msk_skm_04"
	self.masks.skm_04_common.name_id = "bm_msk_cheat_error"
	self.masks.skm_04_common.type = "helmet"
	self.masks.skm_04_common.inaccessible = true
	self.masks.skm_04_common.offsets = {
		chains = {
			Vector3(0, 0.196759, -0.518719),
			Rotation(-0, -0, -0)
		},
		dallas = {
			Vector3(0, 0, -0.995704),
			Rotation(-0, -0, -0)
		},
		chains = {
			Vector3(0, 0.316006, -0.637965),
			Rotation(-0, -0, -0)
		},
		dragan = {
			Vector3(-0.280226, 1.38922, -0.876458),
			Rotation(0, 5.70954, 0)
		},
		ecp_female = {
			Vector3(0, -0.518719, -0.637965),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(-0.518719, 2.1047, -0.518719),
			Rotation(-2.01763, 4.85096, 1.41667)
		}
	}
	self.masks.skm_john_wick_04 = {}
	self.masks.skm_john_wick_04.unit = "units/pd2_dlc_skm/masks/skm_04/msk_skm_john_wick_04"
	self.masks.skm_john_wick_04.name_id = "bm_msk_cheat_error"
	self.masks.skm_john_wick_04.type = "helmet"
	self.masks.skm_john_wick_04.inaccessible = true
	self.masks.skm_jiro_04 = {}
	self.masks.skm_jiro_04.unit = "units/pd2_dlc_skm/masks/skm_04/msk_skm_jiro_04"
	self.masks.skm_jiro_04.name_id = "bm_msk_cheat_error"
	self.masks.skm_jiro_04.type = "helmet"
	self.masks.skm_jiro_04.inaccessible = true
	self.masks.skm_jiro_04.offsets = {
		dragon = {
			Vector3(0, 0.792991, -0.637965),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.skm_jimmy_04 = {}
	self.masks.skm_jimmy_04.unit = "units/pd2_dlc_skm/masks/skm_04/msk_skm_jimmy_04"
	self.masks.skm_jimmy_04.name_id = "bm_msk_cheat_error"
	self.masks.skm_jimmy_04.type = "helmet"
	self.masks.skm_jimmy_04.inaccessible = true
	self.masks.skm_jimmy_04.offsets = {
		sokol = {
			Vector3(0, 0, 0),
			Rotation(10.861, 0, 0)
		},
		female_1 = {
			Vector3(0, 0.673745, -0.637965),
			Rotation(0, 3.13382, 0)
		},
		sydney = {
			Vector3(0, 0.554498, 0.077513),
			Rotation(0, 3.13382, 0)
		}
	}
	self.masks.skm_hila_04 = {}
	self.masks.skm_hila_04.unit = "units/pd2_dlc_skm/masks/skm_04/msk_skm_hila_04"
	self.masks.skm_hila_04.name_id = "bm_msk_cheat_error"
	self.masks.skm_hila_04.type = "glasses"
	self.masks.skm_hila_04.skip_mask_on_sequence = true
	self.masks.skm_hila_04.inaccessible = true
	self.masks.skm_rust_04 = {}
	self.masks.skm_rust_04.unit = "units/pd2_dlc_skm/masks/skm_04/msk_skm_rust_04"
	self.masks.skm_rust_04.name_id = "bm_msk_cheat_error"
	self.masks.skm_rust_04.type = "helmet"
	self.masks.skm_rust_04.inaccessible = true
	self.masks.skm_rust_04.offsets = {
		max = {
			Vector3(0, 0, 0.316006),
			Rotation(-0, -0, -0)
		},
		myh = {
			Vector3(0, 0.196759, -0.280226),
			Rotation(-2.01763, 3.13382, -6.67011e-09)
		},
		ecp_male = {
			Vector3(0, 1.38922, -0.518719),
			Rotation(0.558094, 8.28526, -3.33505e-09)
		},
		old_hoxton = {
			Vector3(0, 1.15073, -0.757211),
			Rotation(0, 5.70954, 0)
		},
		sokol = {
			Vector3(0, -0.876458, 0.912237),
			Rotation(0, -4.59335, 0)
		},
		bodhi = {
			Vector3(0, 1.86621, -0.876458),
			Rotation(0, 8.28526, 0)
		}
	}
	self.masks.skm_04 = {}
	self.masks.skm_04.global_value = "infamous"
	self.masks.skm_04.name_id = "bm_msk_skm_04"
	self.masks.skm_04.value = 0
	self.masks.skm_04.pcs = {}
	self.masks.skm_04.type = "helmet"
	self.masks.skm_04.texture_bundle_folder = "skm"
	self.masks.skm_04.sort_number = 71
	self.masks.skm_04.characters = {
		bodhi = "skm_rust_04",
		bonnie = "skm_04_common",
		chains = "skm_04_common",
		chico = "skm_rust_04",
		dallas = "skm_jimmy_04",
		dragan = "skm_04_common",
		dragon = "skm_jiro_04",
		ecp_female = "skm_hila_04",
		ecp_male = "skm_rust_04",
		female_1 = "skm_jimmy_04",
		hoxton = "skm_jimmy_04",
		jacket = "skm_jimmy_04",
		jimmy = "skm_jimmy_04",
		jowi = "skm_john_wick_04",
		joy = "skm_jimmy_04",
		max = "skm_rust_04",
		myh = "skm_rust_04",
		old_hoxton = "skm_rust_04",
		sokol = "skm_rust_04",
		sydney = "skm_jimmy_04",
		wild = "skm_rust_04",
		wolf = "skm_jimmy_04"
	}
	self.masks.skm_05 = {}
	self.masks.skm_05.global_value = "infamous"
	self.masks.skm_05.unit = "units/pd2_dlc_skm/masks/skm_05/msk_skm_05"
	self.masks.skm_05.name_id = "bm_msk_skm_05"
	self.masks.skm_05.pcs = {}
	self.masks.skm_05.value = 0
	self.masks.skm_05.texture_bundle_folder = "skm"
	self.masks.skm_05.sort_number = 71
	self.masks.skm_06 = {}
	self.masks.skm_06.global_value = "infamous"
	self.masks.skm_06.unit = "units/pd2_dlc_skm/masks/skm_06/msk_skm_06"
	self.masks.skm_06.name_id = "bm_msk_skm_06"
	self.masks.skm_06.type = "helmet"
	self.masks.skm_06.pcs = {}
	self.masks.skm_06.value = 0
	self.masks.skm_06.texture_bundle_folder = "skm"
	self.masks.skm_06.sort_number = 71
	self.masks.smo_01 = {}
	self.masks.smo_01.unit = "units/pd2_dlc_smo/masks/smo_01/msk_smo_01"
	self.masks.smo_01.name_id = "bm_msk_smo_01"
	self.masks.smo_01.pcs = {}
	self.masks.smo_01.value = 0
	self.masks.smo_01.type = "helmet"
	self.masks.smo_01.global_value = "infamous"
	self.masks.smo_01.texture_bundle_folder = "smo"
	self.masks.smo_01.sort_number = 72
	self.masks.smo_common_02 = {}
	self.masks.smo_common_02.unit = "units/pd2_dlc_smo/masks/smo_02/msk_smo_02"
	self.masks.smo_common_02.name_id = "bm_msk_cheat_error"
	self.masks.smo_common_02.pcs = {}
	self.masks.smo_common_02.value = 0
	self.masks.smo_common_02.type = "helmet"
	self.masks.smo_common_02.inaccessible = true
	self.masks.smo_common_02.texture_bundle_folder = "smo"
	self.masks.smo_common_02.sort_number = 71
	self.masks.smo_common_02.offsets = {
		jacket = {
			Vector3(0, -0.0417333, -0.637965),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0, -0.518719),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0, 0, -0.16028),
			Rotation(-0, -0, -0)
		},
		wild = {
			Vector3(0, 0, -0.518719),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, 0, -0.16028),
			Rotation(-0, -0, -0)
		},
		max = {
			Vector3(0, 0.196759, 0),
			Rotation(-0, -0, -0)
		},
		chico = {
			Vector3(0, 0, -0.399472),
			Rotation(-0, -0, -0)
		},
		myh = {
			Vector3(0, 0, -0.518719),
			Rotation(-0, -0, -0)
		},
		bodhi = {
			Vector3(0, 0, -0.16028),
			Rotation(-0, -0, -0)
		},
		dragan = {
			Vector3(0, 0, -0.16028),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.smo_big_02 = {}
	self.masks.smo_big_02.unit = "units/pd2_dlc_smo/masks/smo_02/msk_smo_big_02"
	self.masks.smo_big_02.name_id = "bm_msk_cheat_error"
	self.masks.smo_big_02.type = "helmet"
	self.masks.smo_big_02.inaccessible = true
	self.masks.smo_big_02.offsets = {
		joy = {
			Vector3(0, 0, 0),
			Rotation(-0, -0, -0)
		},
		jowi = {
			Vector3(0, 0, 1.15073),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 0.316006, -0.0417333),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.smo_hila_02 = {}
	self.masks.smo_hila_02.unit = "units/pd2_dlc_smo/masks/smo_02/msk_smo_02"
	self.masks.smo_hila_02.name_id = "bm_msk_cheat_error"
	self.masks.smo_hila_02.type = "glasses"
	self.masks.smo_hila_02.skip_mask_on_sequence = true
	self.masks.smo_hila_02.inaccessible = true
	self.masks.smo_02 = {}
	self.masks.smo_02.name_id = "bm_msk_smo_02"
	self.masks.smo_02.value = 0
	self.masks.smo_02.pcs = {}
	self.masks.smo_02.type = "helmet"
	self.masks.smo_02.global_value = "infamous"
	self.masks.smo_02.texture_bundle_folder = "smo"
	self.masks.smo_02.sort_number = 71
	self.masks.smo_02.characters = {
		bodhi = "smo_common_02",
		bonnie = "smo_common_02",
		chains = "smo_common_02",
		chico = "smo_common_02",
		dallas = "smo_common_02",
		dragan = "smo_common_02",
		dragon = "smo_common_02",
		ecp_female = "smo_hila_02",
		ecp_male = "smo_big_02",
		female_1 = "smo_big_02",
		hoxton = "smo_common_02",
		jacket = "smo_common_02",
		jimmy = "smo_big_02",
		jowi = "smo_big_02",
		joy = "smo_big_02",
		max = "smo_common_02",
		myh = "smo_common_02",
		old_hoxton = "smo_big_02",
		sokol = "smo_big_02",
		sydney = "smo_common_02",
		wild = "smo_common_02",
		wolf = "smo_common_02"
	}
	self.masks.smo_03 = {}
	self.masks.smo_03.unit = "units/pd2_dlc_smo/masks/smo_03/msk_smo_03"
	self.masks.smo_03.name_id = "bm_msk_smo_03"
	self.masks.smo_03.pcs = {}
	self.masks.smo_03.value = 0
	self.masks.smo_03.type = "helmet"
	self.masks.smo_03.global_value = "infamous"
	self.masks.smo_03.texture_bundle_folder = "smo"
	self.masks.smo_03.sort_number = 72
	self.masks.smo_03.offsets = {
		ecp_male = {
			Vector3(-0.0417333, -0.280226, -1.83043),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.smo_04 = {}
	self.masks.smo_04.unit = "units/pd2_dlc_smo/masks/smo_04/msk_smo_04"
	self.masks.smo_04.name_id = "bm_msk_smo_04"
	self.masks.smo_04.pcs = {}
	self.masks.smo_04.value = 0
	self.masks.smo_04.type = "helmet"
	self.masks.smo_04.global_value = "infamous"
	self.masks.smo_04.texture_bundle_folder = "smo"
	self.masks.smo_04.sort_number = 72
	self.masks.smo_04.offsets = {
		sydney = {
			Vector3(0, -0.876458, 2.22395),
			Rotation(-0, -0, -0)
		},
		chains = {
			Vector3(0, -1.94967, 3.05867),
			Rotation(0, -8.02764, 0)
		},
		female_1 = {
			Vector3(0, -1.47269, 1.15073),
			Rotation(-0, -0, -0)
		},
		hoxton = {
			Vector3(0, -2.18817, 4.01264),
			Rotation(0, -11.4619, 0)
		},
		sokol = {
			Vector3(0, -2.54591, 1.62772),
			Rotation(-0, -0, -0)
		},
		wolf = {
			Vector3(0, -2.18817, 2.70093),
			Rotation(0, -4.59335, 0)
		},
		bodhi = {
			Vector3(0, -2.30741, 1.86621),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, -1.47269, 1.03148),
			Rotation(-0, -0, -0)
		},
		jacket = {
			Vector3(0, -1.94967, 1.38922),
			Rotation(-0, -0, -0)
		},
		dallas = {
			Vector3(0, -1.94967, 1.98545),
			Rotation(-0, -0, -0)
		},
		joy = {
			Vector3(0, -0.637965, 2.22395),
			Rotation(-0, -0, -0)
		},
		jowi = {
			Vector3(0, -2.06892, 2.70093),
			Rotation(-0, -0, -0)
		},
		max = {
			Vector3(0, -1.83043, 1.98545),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, -2.7844, 1.15073),
			Rotation(-0, -0, -0)
		},
		dragan = {
			Vector3(0, -1.83043, 1.38922),
			Rotation(-0, -0, -0)
		},
		ecp_female = {
			Vector3(0, -0.876458, 2.34319),
			Rotation(-0, -0, -0)
		},
		ecp_male = {
			Vector3(0, -1.47269, 1.62772),
			Rotation(-0, -0, -0)
		},
		wild = {
			Vector3(0, -1.94967, 1.62772),
			Rotation(-0, -0, -0)
		},
		chico = {
			Vector3(0, -1.59194, 2.1047),
			Rotation(-0, -0, -0)
		},
		myh = {
			Vector3(0, -3.49988, 1.26998),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0, -1.83043, 1.15073),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, -1.83043, 1.15073),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, -1.59194, 2.1047),
			Rotation(-0, -0, -0)
		},
		jacket = {
			Vector3(-0.399472, -3.97686, 2.46244),
			Rotation(-0.30048, -7.16907, -0)
		}
	}
	self.masks.smo_05 = {}
	self.masks.smo_05.unit = "units/pd2_dlc_smo/masks/smo_05/msk_smo_05"
	self.masks.smo_05.name_id = "bm_msk_smo_05"
	self.masks.smo_05.pcs = {}
	self.masks.smo_05.value = 0
	self.masks.smo_05.type = "helmet"
	self.masks.smo_05.global_value = "infamous"
	self.masks.smo_05.texture_bundle_folder = "smo"
	self.masks.smo_05.sort_number = 72
	self.masks.smo_06 = {}
	self.masks.smo_06.unit = "units/pd2_dlc_smo/masks/smo_06/msk_smo_06"
	self.masks.smo_06.name_id = "bm_msk_smo_06"
	self.masks.smo_06.pcs = {}
	self.masks.smo_06.value = 0
	self.masks.smo_06.global_value = "infamous"
	self.masks.smo_06.texture_bundle_folder = "smo"
	self.masks.smo_06.sort_number = 72
	self.masks.smo_07 = {}
	self.masks.smo_07.unit = "units/pd2_dlc_smo/masks/smo_07/msk_smo_07"
	self.masks.smo_07.name_id = "bm_msk_smo_07"
	self.masks.smo_07.pcs = {}
	self.masks.smo_07.value = 0
	self.masks.smo_07.type = "helmet"
	self.masks.smo_07.global_value = "infamous"
	self.masks.smo_07.texture_bundle_folder = "smo"
	self.masks.smo_07.sort_number = 72
	self.masks.smo_08 = {}
	self.masks.smo_08.unit = "units/pd2_dlc_smo/masks/smo_08/msk_smo_08"
	self.masks.smo_08.name_id = "bm_msk_smo_08"
	self.masks.smo_08.pcs = {}
	self.masks.smo_08.value = 0
	self.masks.smo_08.global_value = "infamous"
	self.masks.smo_08.texture_bundle_folder = "smo"
	self.masks.smo_08.sort_number = 72
	self.masks.smo_09 = {}
	self.masks.smo_09.unit = "units/pd2_dlc_smo/masks/smo_09/msk_smo_09"
	self.masks.smo_09.name_id = "bm_msk_smo_09"
	self.masks.smo_09.pcs = {}
	self.masks.smo_09.value = 0
	self.masks.smo_09.global_value = "infamous"
	self.masks.smo_09.texture_bundle_folder = "smo"
	self.masks.smo_09.sort_number = 72
	self.masks.smo_10 = {}
	self.masks.smo_10.unit = "units/pd2_dlc_smo/masks/smo_10/msk_smo_10"
	self.masks.smo_10.name_id = "bm_msk_smo_10"
	self.masks.smo_10.pcs = {}
	self.masks.smo_10.value = 0
	self.masks.smo_10.global_value = "infamous"
	self.masks.smo_10.type = "tiara"
	self.masks.smo_10.skip_mask_on_sequence = true
	self.masks.smo_10.texture_bundle_folder = "smo"
	self.masks.smo_10.sort_number = 72
	self.masks.smo_10.offsets = {
		max = {
			Vector3(0, 0.077513, -1.11495),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 1.26998, 3.53566),
			Rotation(0, -1.15905, 0)
		},
		joy = {
			Vector3(0, 1.98545, 0),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 1.50847, -1.35344),
			Rotation(0, -0.30048, 0)
		},
		bonnie = {
			Vector3(-0.399472, 0, 0),
			Rotation(0, 0, -0)
		},
		wild = {
			Vector3(-0.280226, -0.876458, 0),
			Rotation(0, 0, -0)
		},
		chains = {
			Vector3(-0.637965, 0, -0.16098),
			Rotation(0, 0, -0)
		},
		ecp_male = {
			Vector3(0, 0, -1.71118),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(0, 4.25114, 0),
			Rotation(0, 0, -0)
		},
		jacket = {
			Vector3(-0.518719, 0, -2.66515),
			Rotation(0, 15.1538, 0)
		},
		myh = {
			Vector3(-0.876458, -0.399472, 0.196759),
			Rotation(0, 0, -0)
		},
		dragon = {
			Vector3(0, 0.316006, -0.995704),
			Rotation(0, 10.0024, 0)
		},
		dragan = {
			Vector3(0, 0, 1.15073),
			Rotation(0, 0, -0)
		}
	}
	self.masks.smo_11 = {}
	self.masks.smo_11.unit = "units/pd2_dlc_smo/masks/smo_11/msk_smo_11"
	self.masks.smo_11.name_id = "bm_msk_smo_11"
	self.masks.smo_11.pcs = {}
	self.masks.smo_11.value = 0
	self.masks.smo_11.type = "helmet"
	self.masks.smo_11.global_value = "infamous"
	self.masks.smo_11.texture_bundle_folder = "smo"
	self.masks.smo_11.sort_number = 72
	self.masks.smo_12 = {}
	self.masks.smo_12.unit = "units/pd2_dlc_smo/masks/smo_12/msk_smo_12"
	self.masks.smo_12.name_id = "bm_msk_smo_12"
	self.masks.smo_12.pcs = {}
	self.masks.smo_12.value = 0
	self.masks.smo_12.global_value = "infamous"
	self.masks.smo_12.texture_bundle_folder = "smo"
	self.masks.smo_12.sort_number = 72
	self.masks.maw_01 = {}
	self.masks.maw_01.unit = "units/pd2_dlc_maw/masks/msk_maw_01"
	self.masks.maw_01.name_id = "bm_msk_maw_01"
	self.masks.maw_01.pcs = {}
	self.masks.maw_01.value = 0
	self.masks.maw_01.texture_bundle_folder = "maw"
	self.masks.maw_01.sort_number = 73
	self.masks.maw_01.global_value = "maw"
	self.masks.sms_01 = {}
	self.masks.sms_01.unit = "units/pd2_dlc_sms/masks/sms_01/msk_sms_01"
	self.masks.sms_01.name_id = "bm_msk_sms_01"
	self.masks.sms_01.value = 0
	self.masks.sms_01.global_value = "infamous"
	self.masks.sms_01.texture_bundle_folder = "sms"
	self.masks.sms_01.sort_number = 73
	self.masks.sms_02 = {}
	self.masks.sms_02.unit = "units/pd2_dlc_sms/masks/sms_02/msk_sms_02"
	self.masks.sms_02.name_id = "bm_msk_sms_02"
	self.masks.sms_02.value = 0
	self.masks.sms_02.global_value = "infamous"
	self.masks.sms_02.texture_bundle_folder = "sms"
	self.masks.sms_02.sort_number = 73
	self.masks.sms_03 = {}
	self.masks.sms_03.unit = "units/pd2_dlc_sms/masks/sms_03/msk_sms_03"
	self.masks.sms_03.name_id = "bm_msk_sms_03"
	self.masks.sms_03.value = 0
	self.masks.sms_03.global_value = "infamous"
	self.masks.sms_03.texture_bundle_folder = "sms"
	self.masks.sms_03.sort_number = 73
	self.masks.sms_04 = {}
	self.masks.sms_04.unit = "units/pd2_dlc_sms/masks/sms_04/msk_sms_04"
	self.masks.sms_04.name_id = "bm_msk_sms_04"
	self.masks.sms_04.value = 0
	self.masks.sms_04.global_value = "infamous"
	self.masks.sms_04.texture_bundle_folder = "sms"
	self.masks.sms_04.sort_number = 73
	self.masks.sms_05 = {}
	self.masks.sms_05.unit = "units/pd2_dlc_sms/masks/sms_05/msk_sms_05"
	self.masks.sms_05.name_id = "bm_msk_sms_05"
	self.masks.sms_05.value = 0
	self.masks.sms_05.global_value = "infamous"
	self.masks.sms_05.texture_bundle_folder = "sms"
	self.masks.sms_05.sort_number = 73
	self.masks.sms_06 = {}
	self.masks.sms_06.unit = "units/pd2_dlc_sms/masks/sms_06/msk_sms_06"
	self.masks.sms_06.name_id = "bm_msk_sms_06"
	self.masks.sms_06.value = 0
	self.masks.sms_06.global_value = "infamous"
	self.masks.sms_06.texture_bundle_folder = "sms"
	self.masks.sms_06.sort_number = 73
	self.masks.sms_06.offsets = {
		wild = {
			Vector3(0, -0.399472, 0),
			Rotation(-0, -0, -0)
		},
		joy = {
			Vector3(0, 0, 0.316006),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, -1.35344, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.sms_07 = {}
	self.masks.sms_07.unit = "units/pd2_dlc_sms/masks/sms_07/msk_sms_07"
	self.masks.sms_07.name_id = "bm_msk_sms_07"
	self.masks.sms_07.value = 0
	self.masks.sms_07.global_value = "infamous"
	self.masks.sms_07.texture_bundle_folder = "sms"
	self.masks.sms_07.sort_number = 73
	self.masks.sms_08 = {}
	self.masks.sms_08.unit = "units/pd2_dlc_sms/masks/sms_08/msk_sms_08"
	self.masks.sms_08.name_id = "bm_msk_sms_08"
	self.masks.sms_08.value = 0
	self.masks.sms_08.global_value = "infamous"
	self.masks.sms_08.texture_bundle_folder = "sms"
	self.masks.sms_08.sort_number = 73
	self.masks.scm_01 = {}
	self.masks.scm_01.unit = "units/pd2_dlc_scm/masks/scm_01/msk_scm_01"
	self.masks.scm_01.name_id = "bm_msk_scm_01"
	self.masks.scm_01.value = 0
	self.masks.scm_01.global_value = "infamous"
	self.masks.scm_01.texture_bundle_folder = "scm"
	self.masks.scm_01.sort_number = 75
	self.masks.scm_02 = {}
	self.masks.scm_02.unit = "units/pd2_dlc_scm/masks/scm_02/msk_scm_02"
	self.masks.scm_02.name_id = "bm_msk_scm_02"
	self.masks.scm_02.value = 0
	self.masks.scm_02.global_value = "infamous"
	self.masks.scm_02.texture_bundle_folder = "scm"
	self.masks.scm_02.sort_number = 75
	self.masks.roman = {}
	self.masks.roman.unit = "units/pd2_dlc_mex/masks/roman/msk_roman"
	self.masks.roman.name_id = "bm_msk_roman"
	self.masks.roman.pcs = {}
	self.masks.roman.value = 0
	self.masks.roman.sort_number = 13
	self.masks.roman.dlc = "dlc_achievement"
	self.masks.roman.global_value = "mex"
	self.masks.roman.texture_bundle_folder = "mex"
	self.masks.sombrero = {}
	self.masks.sombrero.unit = "units/pd2_dlc_bex/masks/msk_sombrero/msk_sombrero"
	self.masks.sombrero.name_id = "bm_msk_sombrero"
	self.masks.sombrero.pcs = {}
	self.masks.sombrero.value = 0
	self.masks.sombrero.type = "helmet"
	self.masks.sombrero.sort_number = 13
	self.masks.sombrero.dlc = "bex"
	self.masks.sombrero.global_value = "bex"
	self.masks.sombrero.texture_bundle_folder = "bex"
	self.masks.buluc = {}
	self.masks.buluc.unit = "units/pd2_dlc_fex/characters/msk_buluc/msk_buluc"
	self.masks.buluc.name_id = "bm_msk_buluc"
	self.masks.buluc.pcs = {}
	self.masks.buluc.value = 0
	self.masks.buluc.type = "helmet"
	self.masks.buluc.sort_number = 13
	self.masks.buluc.preview_oobb_object = "g_mask"
	self.masks.buluc.dlc = "dlc_achievement"
	self.masks.buluc.global_value = "fex"
	self.masks.buluc.texture_bundle_folder = "fex"
	self.masks.biden = {}
	self.masks.biden.unit = "units/pd2_dlc_ja21/masks/msk_ja21_biden/msk_ja21_biden"
	self.masks.biden.name_id = "bm_msk_ja21_biden"
	self.masks.biden.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.biden.value = 0
	self.masks.biden.global_value = "ja21"
	self.masks.biden.texture_bundle_folder = "ja21"
	self.masks.xm20_dog = {}
	self.masks.xm20_dog.unit = "units/pd2_dlc_xm20/masks/msk_xm20_dog/msk_xm20_dog"
	self.masks.xm20_dog.name_id = "bm_msk_xm20_dog"
	self.masks.xm20_dog.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.xm20_dog.value = 0
	self.masks.xm20_dog.global_value = "xm20"
	self.masks.xm20_dog.texture_bundle_folder = "xm20"
	self.masks.xm20_jaguar = {}
	self.masks.xm20_jaguar.unit = "units/pd2_dlc_xm20/masks/msk_xm20_jaguar/msk_xm20_jaguar"
	self.masks.xm20_jaguar.name_id = "bm_msk_xm20_jaguar"
	self.masks.xm20_jaguar.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.xm20_jaguar.value = 0
	self.masks.xm20_jaguar.global_value = "xm20"
	self.masks.xm20_jaguar.texture_bundle_folder = "xm20"
	self.masks.xm20_owl = {}
	self.masks.xm20_owl.unit = "units/pd2_dlc_xm20/masks/msk_xm20_owl/msk_xm20_owl"
	self.masks.xm20_owl.name_id = "bm_msk_xm20_owl"
	self.masks.xm20_owl.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.xm20_owl.value = 0
	self.masks.xm20_owl.global_value = "xm20"
	self.masks.xm20_owl.texture_bundle_folder = "xm20"
	self.masks.xm20_owl.offsets = {
		bonnie = {
			Vector3(0, 0, 0.554498),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.xm20_serpent = {}
	self.masks.xm20_serpent.unit = "units/pd2_dlc_xm20/masks/msk_xm20_serpent/msk_xm20_serpent"
	self.masks.xm20_serpent.name_id = "bm_msk_xm20_serpent"
	self.masks.xm20_serpent.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.xm20_serpent.value = 0
	self.masks.xm20_serpent.global_value = "xm20"
	self.masks.xm20_serpent.texture_bundle_folder = "xm20"
	self.masks.xm20_serpent.offsets = {
		wolf = {
			Vector3(0, 0, 0.316006),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.msq_01 = {}
	self.masks.msq_01.unit = "units/pd2_dlc_xm20/masks/msk_xm20_msq_01/msk_xm20_msq_01"
	self.masks.msq_01.name_id = "bm_msk_xm20_msq_01"
	self.masks.msq_01.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.msq_01.value = 0
	self.masks.msq_01.global_value = "xm20"
	self.masks.msq_01.texture_bundle_folder = "xm20"
	self.masks.msq_02 = {}
	self.masks.msq_02.unit = "units/pd2_dlc_xm20/masks/msk_xm20_msq_02/msk_xm20_msq_02"
	self.masks.msq_02.name_id = "bm_msk_xm20_msq_02"
	self.masks.msq_02.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.msq_02.value = 0
	self.masks.msq_02.global_value = "xm20"
	self.masks.msq_02.texture_bundle_folder = "xm20"
	self.masks.msq_03 = {}
	self.masks.msq_03.unit = "units/pd2_dlc_xm20/masks/msk_xm20_msq_03/msk_xm20_msq_03"
	self.masks.msq_03.name_id = "bm_msk_xm20_msq_03"
	self.masks.msq_03.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.msq_03.value = 0
	self.masks.msq_03.global_value = "xm20"
	self.masks.msq_03.texture_bundle_folder = "xm20"
	self.masks.msq_04 = {}
	self.masks.msq_04.unit = "units/pd2_dlc_xm20/masks/msk_xm20_msq_04/msk_xm20_msq_04"
	self.masks.msq_04.name_id = "bm_msk_xm20_msq_04"
	self.masks.msq_04.pcs = {
		10,
		20,
		30,
		40
	}
	self.masks.msq_04.value = 0
	self.masks.msq_04.global_value = "xm20"
	self.masks.msq_04.texture_bundle_folder = "xm20"
	self.masks.mega_max = {}
	self.masks.mega_max.unit = "units/pd2_dlc_xm20/masks/msk_xm20_mega_max/msk_xm20_mega_max"
	self.masks.mega_max.name_id = "bm_msk_xm20_mega_max"
	self.masks.mega_max.pcs = {}
	self.masks.mega_max.value = 0
	self.masks.mega_max.global_value = "infamous"
	self.masks.mega_max.texture_bundle_folder = "xm20"
	self.masks.cyberpunk = {}
	self.masks.cyberpunk.unit = "units/pd2_dlc_in31/characters/msk_cyberpunk/msk_cyberpunk"
	self.masks.cyberpunk.name_id = "bm_msk_in31_cyberpunk_max"
	self.masks.cyberpunk.pcs = {}
	self.masks.cyberpunk.value = 0
	self.masks.cyberpunk.type = "helmet"
	self.masks.cyberpunk.sort_number = 0
	self.masks.cyberpunk.preview_oobb_object = "g_helmet"
	self.masks.cyberpunk.global_value = "in31"
	self.masks.cyberpunk.texture_bundle_folder = "in31"
	self.masks.lastlaugh = {}
	self.masks.lastlaugh.unit = "units/pd2_dlc_in31/characters/msk_lastlaugh/msk_lastlaugh"
	self.masks.lastlaugh.name_id = "bm_msk_lastlaugh"
	self.masks.lastlaugh.pcs = {}
	self.masks.lastlaugh.value = 0
	self.masks.lastlaugh.global_value = "in31"
	self.masks.lastlaugh.texture_bundle_folder = "in31"
	self.masks.dragon01 = {}
	self.masks.dragon01.unit = "units/pd2_dlc_tstp/characters/tstp_msk_dragon01/msk_dragon01"
	self.masks.dragon01.name_id = "bm_msk_tstp_dragon01"
	self.masks.dragon01.pcs = {}
	self.masks.dragon01.value = 0
	self.masks.dragon01.dlc = "tstp"
	self.masks.dragon01.global_value = "tstp"
	self.masks.dragon01.texture_bundle_folder = "tstp"
	self.masks.dragon02 = {}
	self.masks.dragon02.unit = "units/pd2_dlc_tstp/characters/tstp_msk_dragon02/msk_dragon02"
	self.masks.dragon02.name_id = "bm_msk_tstp_dragon02"
	self.masks.dragon02.pcs = {}
	self.masks.dragon02.value = 0
	self.masks.dragon02.dlc = "tstp"
	self.masks.dragon02.global_value = "tstp"
	self.masks.dragon02.texture_bundle_folder = "tstp"
	self.masks.godess = {}
	self.masks.godess.unit = "units/pd2_dlc_tstp/characters/tstp_msk_godess/msk_godess"
	self.masks.godess.name_id = "bm_msk_tstp_godess"
	self.masks.godess.pcs = {}
	self.masks.godess.value = 0
	self.masks.godess.dlc = "tstp"
	self.masks.godess.global_value = "tstp"
	self.masks.godess.texture_bundle_folder = "tstp"
	self.masks.daemon = {}
	self.masks.daemon.unit = "units/pd2_dlc_tstp/characters/tstp_msk_daemon/msk_daemon"
	self.masks.daemon.name_id = "bm_msk_tstp_daemon"
	self.masks.daemon.pcs = {}
	self.masks.daemon.value = 0
	self.masks.daemon.dlc = "tstp"
	self.masks.daemon.global_value = "tstp"
	self.masks.daemon.texture_bundle_folder = "tstp"
	self.masks.daemon.offsets = {
		wolf = {
			Vector3(0, 0, 0.435252),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.goldenbrute = {}
	self.masks.goldenbrute.unit = "units/pd2_dlc_in32/masks/msk_goldenbrute/msk_goldenbrute"
	self.masks.goldenbrute.name_id = "bm_msk_in32_goldenbrute"
	self.masks.goldenbrute.pcs = {}
	self.masks.goldenbrute.value = 0
	self.masks.goldenbrute.type = "helmet"
	self.masks.goldenbrute.sort_number = 0
	self.masks.goldenbrute.preview_oobb_object = "g_mask"
	self.masks.goldenbrute.global_value = "in32"
	self.masks.goldenbrute.texture_bundle_folder = "in32"
	self.masks.ingoldnito = {}
	self.masks.ingoldnito.unit = "units/pd2_dlc_in32/masks/msk_ingoldnito/msk_ingoldnito"
	self.masks.ingoldnito.name_id = "bm_msk_in32_ingoldnito"
	self.masks.ingoldnito.pcs = {}
	self.masks.ingoldnito.value = 0
	self.masks.ingoldnito.dlc = "in32"
	self.masks.ingoldnito.global_value = "in32"
	self.masks.ingoldnito.texture_bundle_folder = "in32"
	self.masks.eighthgrin = {}
	self.masks.eighthgrin.unit = "units/pd2_dlc_pda8/masks/msk_eighthgrin/msk_eighthgrin"
	self.masks.eighthgrin.name_id = "bm_msk_eighthgrin"
	self.masks.eighthgrin.pcs = {}
	self.masks.eighthgrin.value = 0
	self.masks.eighthgrin.global_value = "pda8"
	self.masks.eighthgrin.texture_bundle_folder = "pda8"
	self.masks.jesterskulls = {}
	self.masks.jesterskulls.unit = "units/pd2_dlc_a10th/masks/msk_jesterskulls/msk_jesterskulls"
	self.masks.jesterskulls.name_id = "bm_msk_jesterskulls"
	self.masks.jesterskulls.pcs = {}
	self.masks.jesterskulls.value = 0
	self.masks.jesterskulls.global_value = "a10th"
	self.masks.jesterskulls.texture_bundle_folder = "a10th"
	self.masks.jesterskulls.hide_unavailable = true
	self.masks.elegantteeth = {}
	self.masks.elegantteeth.unit = "units/pd2_dlc_sbzac2/masks/msk_elegantteeth/msk_elegantteeth"
	self.masks.elegantteeth.name_id = "bm_msk_elegantteeth"
	self.masks.elegantteeth.pcs = {}
	self.masks.elegantteeth.value = 0
	self.masks.elegantteeth.dlc = "sbzac_elegantteeth"
	self.masks.elegantteeth.global_value = "sbzac_elegantteeth"
	self.masks.elegantteeth.texture_bundle_folder = "sbzac2"
	self.masks.leshy = {}
	self.masks.leshy.unit = "units/pd2_dlc_snow/masks/msk_leshy/msk_leshy"
	self.masks.leshy.name_id = "bm_msk_leshy"
	self.masks.leshy.pcs = {}
	self.masks.leshy.type = "helmet"
	self.masks.leshy.value = 0
	self.masks.leshy.global_value = "snow"
	self.masks.leshy.texture_bundle_folder = "snow"
	self.masks.iceskull = {}
	self.masks.iceskull.unit = "units/pd2_dlc_snow/masks/msk_iceskull/msk_iceskull"
	self.masks.iceskull.name_id = "bm_msk_iceskull"
	self.masks.iceskull.pcs = {}
	self.masks.iceskull.type = "helmet"
	self.masks.iceskull.value = 0
	self.masks.iceskull.global_value = "snow"
	self.masks.iceskull.texture_bundle_folder = "snow"
	self.masks.iceskull.offsets = {
		jimmy = {
			Vector3(0, 1.03148, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.icedeer = {}
	self.masks.icedeer.unit = "units/pd2_dlc_snow/masks/msk_icedeer/msk_icedeer"
	self.masks.icedeer.name_id = "bm_msk_icedeer"
	self.masks.icedeer.pcs = {}
	self.masks.icedeer.type = "helmet"
	self.masks.icedeer.value = 0
	self.masks.icedeer.global_value = "snow"
	self.masks.icedeer.texture_bundle_folder = "snow"
	self.masks.foxfurhat = {}
	self.masks.foxfurhat.unit = "units/pd2_dlc_snow/masks/msk_foxfurhat/msk_foxfurhat"
	self.masks.foxfurhat.name_id = "bm_msk_foxfurhat"
	self.masks.foxfurhat.pcs = {}
	self.masks.foxfurhat.type = "helmet"
	self.masks.foxfurhat.value = 0
	self.masks.foxfurhat.global_value = "snow"
	self.masks.foxfurhat.texture_bundle_folder = "snow"
	self.masks.boss = {}
	self.masks.boss.unit = "units/pd2_dlc_srtr/masks/msk_boss/msk_boss"
	self.masks.boss.name_id = "bm_msk_boss"
	self.masks.boss.pcs = {}
	self.masks.boss.value = 0
	self.masks.boss.dlc = "srtr"
	self.masks.boss.texture_bundle_folder = "srtr"
	self.masks.boss.sort_number = 61
	self.masks.boss.type = "glasses"
	self.masks.boss.skip_mask_on_sequence = true
	self.masks.boss.global_value = "srtr"
	self.masks.boss.offsets = {
		sydney = {
			Vector3(0, -0.399472, -0.16098),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0, 1.15, -0.16098),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, -0.399472, -0.16098),
			Rotation(-0, -0, -0)
		},
		hoxton = {
			Vector3(0, 0.792991, -0.16098),
			Rotation(-0, -0, -0)
		},
		sokol = {
			Vector3(0, -0.399472, -0.16098),
			Rotation(-0, -0, -0)
		},
		wolf = {
			Vector3(0, -0.399472, -0.16098),
			Rotation(-0, -0, -0)
		},
		bodhi = {
			Vector3(0, 1.15073, -0.757211),
			Rotation(0, 3.13382, 0)
		},
		jimmy = {
			Vector3(0, 1.262472, -0.16098),
			Rotation(-0, 2.275, -0)
		},
		max = {
			Vector3(0, 0.673745, -0.637965),
			Rotation(0, 2.27524, 0)
		},
		dallas = {
			Vector3(0, 0.673745, -0.637965),
			Rotation(0, 3.13382, 0)
		},
		dragan = {
			Vector3(0, 0.792991, -0.280226),
			Rotation(0, 2.27524, 0)
		},
		wild = {
			Vector3(0, 0.196472, -0.16098),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, 0.316006, -0.637965),
			Rotation(0, 2.27524, 0)
		},
		chains = {
			Vector3(0, 0.792991, -0.16098),
			Rotation(-0, -0, -0)
		},
		ecp_female = {
			Vector3(0, -0.399472, -0.16098),
			Rotation(-0, -0, -0)
		},
		ecp_male = {
			Vector3(0, 0.316006, -0.637965),
			Rotation(0, 3.99239, 0)
		},
		jowi = {
			Vector3(0, 0.792991, -0.876458),
			Rotation(0, 3.99239, 0)
		},
		chico = {
			Vector3(0, 0.792991, -0.637965),
			Rotation(0, 3.13382, 0)
		},
		myh = {
			Vector3(0, 0.912237, -1.59194),
			Rotation(0, 6.56811, 0)
		},
		jacket = {
			Vector3(0, 0.912237, -0.16098),
			Rotation(0, 3.99239, 0)
		},
		bonnie = {
			Vector3(0, 0.5545, -0.16098),
			Rotation(-0, -0, -0)
		},
		joy = {
			Vector3(0, 0.554498, -0.637965),
			Rotation(0, 2.27524, 0)
		}
	}
	self.masks.blacktortoise = {}
	self.masks.blacktortoise.unit = "units/pd2_dlc_sdtp/masks/msk_blacktortoise/msk_blacktortoise"
	self.masks.blacktortoise.name_id = "bm_msk_sdtp_blacktortoise"
	self.masks.blacktortoise.pcs = {}
	self.masks.blacktortoise.value = 0
	self.masks.blacktortoise.type = "helmet"
	self.masks.blacktortoise.sort_number = 0
	self.masks.blacktortoise.preview_oobb_object = "g_mask"
	self.masks.blacktortoise.global_value = "sdtp"
	self.masks.blacktortoise.texture_bundle_folder = "sdtp"
	self.masks.blacktortoise.skip_mask_on_sequence = true
	self.masks.vermilionbird = {}
	self.masks.vermilionbird.unit = "units/pd2_dlc_sdtp/masks/msk_vermilionbird/msk_vermilionbird"
	self.masks.vermilionbird.name_id = "bm_msk_sdtp_vermilionbird"
	self.masks.vermilionbird.pcs = {}
	self.masks.vermilionbird.value = 0
	self.masks.vermilionbird.type = "helmet"
	self.masks.vermilionbird.sort_number = 0
	self.masks.vermilionbird.preview_oobb_object = "g_mask"
	self.masks.vermilionbird.global_value = "sdtp"
	self.masks.vermilionbird.texture_bundle_folder = "sdtp"
	self.masks.vermilionbird.skip_mask_on_sequence = true
	self.masks.azuredragon = {}
	self.masks.azuredragon.unit = "units/pd2_dlc_sdtp/masks/msk_azuredragon/msk_azuredragon"
	self.masks.azuredragon.name_id = "bm_msk_sdtp_azuredragon"
	self.masks.azuredragon.pcs = {}
	self.masks.azuredragon.value = 0
	self.masks.azuredragon.type = "helmet"
	self.masks.azuredragon.sort_number = 0
	self.masks.azuredragon.preview_oobb_object = "g_mask"
	self.masks.azuredragon.global_value = "sdtp"
	self.masks.azuredragon.texture_bundle_folder = "sdtp"
	self.masks.azuredragon.skip_mask_on_sequence = true
	self.masks.whitetiger = {}
	self.masks.whitetiger.unit = "units/pd2_dlc_sdtp/masks/msk_whitetiger/msk_whitetiger"
	self.masks.whitetiger.name_id = "bm_msk_sdtp_whitetiger"
	self.masks.whitetiger.pcs = {}
	self.masks.whitetiger.value = 0
	self.masks.whitetiger.type = "helmet"
	self.masks.whitetiger.sort_number = 0
	self.masks.whitetiger.preview_oobb_object = "g_mask"
	self.masks.whitetiger.global_value = "sdtp"
	self.masks.whitetiger.texture_bundle_folder = "sdtp"
	self.masks.whitetiger.skip_mask_on_sequence = true
	self.masks.whitetiger.offsets = {
		wild = {
			Vector3(0, 0, 0.673745),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.mnk = {}
	self.masks.mnk.unit = "units/pd2_dlc_cctp/masks/msk_mnk/msk_mnk"
	self.masks.mnk.name_id = "bm_msk_cctp_mnk"
	self.masks.mnk.pcs = {}
	self.masks.mnk.value = 0
	self.masks.mnk.type = "helmet"
	self.masks.mnk.sort_number = 0
	self.masks.mnk.preview_oobb_object = "g_mask"
	self.masks.mnk.global_value = "cctp"
	self.masks.mnk.texture_bundle_folder = "cctp"
	self.masks.mnt = {}
	self.masks.mnt.unit = "units/pd2_dlc_cctp/masks/msk_mnt/msk_mnt"
	self.masks.mnt.name_id = "bm_msk_cctp_mnt"
	self.masks.mnt.pcs = {}
	self.masks.mnt.value = 0
	self.masks.mnt.sort_number = 0
	self.masks.mnt.preview_oobb_object = "g_mask"
	self.masks.mnt.global_value = "cctp"
	self.masks.mnt.texture_bundle_folder = "cctp"
	self.masks.tgr = {}
	self.masks.tgr.unit = "units/pd2_dlc_cctp/masks/msk_tgr/msk_tgr"
	self.masks.tgr.name_id = "bm_msk_cctp_tgr"
	self.masks.tgr.pcs = {}
	self.masks.tgr.value = 0
	self.masks.tgr.sort_number = 0
	self.masks.tgr.preview_oobb_object = "g_mask"
	self.masks.tgr.global_value = "cctp"
	self.masks.tgr.texture_bundle_folder = "cctp"
	self.masks.vpr = {}
	self.masks.vpr.unit = "units/pd2_dlc_cctp/masks/msk_vpr/msk_vpr"
	self.masks.vpr.name_id = "bm_msk_cctp_vpr"
	self.masks.vpr.pcs = {}
	self.masks.vpr.value = 0
	self.masks.vpr.sort_number = 0
	self.masks.vpr.preview_oobb_object = "g_mask"
	self.masks.vpr.global_value = "cctp"
	self.masks.vpr.texture_bundle_folder = "cctp"
	self.masks.overkillpunk = {}
	self.masks.overkillpunk.unit = "units/pd2_dlc_in33/masks/msk_overkillpunk/msk_in33_overkillpunk"
	self.masks.overkillpunk.name_id = "bm_msk_in33_overkillpunk"
	self.masks.overkillpunk.pcs = {}
	self.masks.overkillpunk.value = 0
	self.masks.overkillpunk.sort_number = 0
	self.masks.overkillpunk.preview_oobb_object = "g_mask"
	self.masks.overkillpunk.global_value = "in33"
	self.masks.overkillpunk.texture_bundle_folder = "in33"
	self.masks.tophatske = {}
	self.masks.tophatske.unit = "units/pd2_dlc_trik/masks/msk_tophatske/msk_tophatske"
	self.masks.tophatske.name_id = "bm_msk_trik_tophatske"
	self.masks.tophatske.pcs = {}
	self.masks.tophatske.value = 0
	self.masks.tophatske.type = "helmet"
	self.masks.tophatske.sort_number = 0
	self.masks.tophatske.preview_oobb_object = "g_mask"
	self.masks.tophatske.global_value = "trik"
	self.masks.tophatske.texture_bundle_folder = "trik"
	self.masks.tophatskered = {}
	self.masks.tophatskered.unit = "units/pd2_dlc_trik/masks/msk_tophatskered/msk_tophatskered"
	self.masks.tophatskered.name_id = "bm_msk_trik_tophatskered"
	self.masks.tophatskered.pcs = {}
	self.masks.tophatskered.value = 0
	self.masks.tophatskered.type = "helmet"
	self.masks.tophatskered.sort_number = 0
	self.masks.tophatskered.preview_oobb_object = "g_mask"
	self.masks.tophatskered.global_value = "trik"
	self.masks.tophatskered.texture_bundle_folder = "trik"
	self.masks.tophatskeblue = {}
	self.masks.tophatskeblue.unit = "units/pd2_dlc_trik/masks/msk_tophatskeblue/msk_tophatskeblue"
	self.masks.tophatskeblue.name_id = "bm_msk_trik_tophatskeblue"
	self.masks.tophatskeblue.pcs = {}
	self.masks.tophatskeblue.value = 0
	self.masks.tophatskeblue.type = "helmet"
	self.masks.tophatskeblue.sort_number = 0
	self.masks.tophatskeblue.preview_oobb_object = "g_mask"
	self.masks.tophatskeblue.global_value = "trik"
	self.masks.tophatskeblue.texture_bundle_folder = "trik"
	self.masks.trol = {}
	self.masks.trol.unit = "units/pd2_dlc_mts/masks/msk_trol/msk_trol"
	self.masks.trol.name_id = "bm_msk_mts_trol"
	self.masks.trol.pcs = {}
	self.masks.trol.value = 0
	self.masks.trol.sort_number = 0
	self.masks.trol.preview_oobb_object = "g_mask"
	self.masks.trol.dlc = "mts"
	self.masks.trol.texture_bundle_folder = "mts"
	self.masks.hockeynermark = {}
	self.masks.hockeynermark.unit = "units/pd2_dlc_fcmsk/masks/msk_hockeynermark/msk_hockeynermark"
	self.masks.hockeynermark.name_id = "bm_msk_hockeynermark"
	self.masks.hockeynermark.pcs = {}
	self.masks.hockeynermark.value = 0
	self.masks.hockeynermark.type = "helmet"
	self.masks.hockeynermark.sort_number = 0
	self.masks.hockeynermark.preview_oobb_object = "g_mask"
	self.masks.hockeynermark.dlc = "fcmsk"
	self.masks.hockeynermark.texture_bundle_folder = "fcmsk"
	self.masks.yufuhelmet = {}
	self.masks.yufuhelmet.unit = "units/pd2_dlc_pent/characters/msk_yufuhelmet/msk_yufuhelmet"
	self.masks.yufuhelmet.name_id = "bm_msk_yufuhelmet"
	self.masks.yufuhelmet.pcs = {}
	self.masks.yufuhelmet.value = 0
	self.masks.yufuhelmet.type = "helmet"
	self.masks.yufuhelmet.dlc = "dlc_achievement"
	self.masks.yufuhelmet.sort_number = 13
	self.masks.yufuhelmet.preview_oobb_object = "g_mask"
	self.masks.yufuhelmet.global_value = "pent"
	self.masks.yufuhelmet.texture_bundle_folder = "pent"
	self.masks.yufuhelmet.offsets = {
		sokol = {
			Vector3(0, -0.280226, 0),
			Rotation(-0, -0, -0)
		},
		wolf = {
			Vector3(0, 0.435252, 0),
			Rotation(-0, -0, -0)
		},
		ecp_male = {
			Vector3(0, -0.637965, 0),
			Rotation(-0, -0, -0)
		},
		chains = {
			Vector3(0, 0.435252, 0),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 1.03148, 0),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0, 0.912237, 0),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, 0.792991, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.biker_helmet_red_led = {}
	self.masks.biker_helmet_red_led.unit = "units/pd2_dlc_gdtp/masks/msk_biker_helmet_red_led/msk_biker_helmet_red_led"
	self.masks.biker_helmet_red_led.name_id = "bm_msk_biker_helmet_red_led"
	self.masks.biker_helmet_red_led.pcs = {}
	self.masks.biker_helmet_red_led.value = 0
	self.masks.biker_helmet_red_led.type = "helmet"
	self.masks.biker_helmet_red_led.sort_number = 0
	self.masks.biker_helmet_red_led.preview_oobb_object = "g_mask"
	self.masks.biker_helmet_red_led.dlc = "gdtp"
	self.masks.biker_helmet_red_led.texture_bundle_folder = "gdtp"
	self.masks.biker_helmet_yellow_led = {}
	self.masks.biker_helmet_yellow_led.unit = "units/pd2_dlc_gdtp/masks/msk_biker_helmet_yellow_led/msk_biker_helmet_yellow_led"
	self.masks.biker_helmet_yellow_led.name_id = "bm_msk_biker_helmet_yellow_led"
	self.masks.biker_helmet_yellow_led.pcs = {}
	self.masks.biker_helmet_yellow_led.value = 0
	self.masks.biker_helmet_yellow_led.type = "helmet"
	self.masks.biker_helmet_yellow_led.sort_number = 0
	self.masks.biker_helmet_yellow_led.preview_oobb_object = "g_mask"
	self.masks.biker_helmet_yellow_led.dlc = "gdtp"
	self.masks.biker_helmet_yellow_led.texture_bundle_folder = "gdtp"
	self.masks.boss_gold = {}
	self.masks.boss_gold.unit = "units/pd2_dlc_gdtp/masks/msk_boss_gold/msk_boss_gold"
	self.masks.boss_gold.name_id = "bm_msk_boss_gold"
	self.masks.boss_gold.pcs = {}
	self.masks.boss_gold.value = 0
	self.masks.boss_gold.type = "helmet"
	self.masks.boss_gold.sort_number = 0
	self.masks.boss_gold.preview_oobb_object = "g_mask"
	self.masks.boss_gold.dlc = "gdtp"
	self.masks.boss_gold.texture_bundle_folder = "gdtp"
	self.masks.boss_gold.offsets = {
		joy = {
			Vector3(0, 0, 0.988833),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 0.907507, 0),
			Rotation(-0, -0, -0)
		},
		jacket = {
			Vector3(0, 0.418832, 0.0921568),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0, 0.0943694),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.boss_silver = {}
	self.masks.boss_silver.unit = "units/pd2_dlc_gdtp/masks/msk_boss_silver/msk_boss_silver"
	self.masks.boss_silver.name_id = "bm_msk_boss_silver"
	self.masks.boss_silver.pcs = {}
	self.masks.boss_silver.value = 0
	self.masks.boss_silver.type = "helmet"
	self.masks.boss_silver.sort_number = 0
	self.masks.boss_silver.preview_oobb_object = "g_mask"
	self.masks.boss_silver.dlc = "gdtp"
	self.masks.boss_silver.texture_bundle_folder = "gdtp"
	self.masks.saloonshade = {}
	self.masks.saloonshade.unit = "units/pd2_dlc_txt1/masks/msk_saloonshade/msk_saloonshade"
	self.masks.saloonshade.name_id = "bm_msk_saloonshade"
	self.masks.saloonshade.pcs = {}
	self.masks.saloonshade.value = 0
	self.masks.saloonshade.type = "cowboyhat"
	self.masks.saloonshade.sort_number = 0
	self.masks.saloonshade.preview_oobb_object = "g_mask"
	self.masks.saloonshade.dlc = "txt1"
	self.masks.saloonshade.texture_bundle_folder = "txt1"
	self.masks.saloonshade.offsets = {
		ecp_male = {
			Vector3(0.196759, -0.518719, -0.399472),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 0.316006, 0),
			Rotation(0, 0, -0)
		},
		joy = {
			Vector3(0, 0, -0.518719),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(-0.280226, 0.435252, -1.11495),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0, 0.912237, -0.280226),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.saloonstar = {}
	self.masks.saloonstar.unit = "units/pd2_dlc_txt1/masks/msk_saloonstar/msk_saloonstar"
	self.masks.saloonstar.name_id = "bm_msk_saloonstar"
	self.masks.saloonstar.pcs = {}
	self.masks.saloonstar.value = 0
	self.masks.saloonstar.type = "cowboyhat"
	self.masks.saloonstar.sort_number = 0
	self.masks.saloonstar.preview_oobb_object = "g_mask"
	self.masks.saloonstar.dlc = "txt1"
	self.masks.saloonstar.texture_bundle_folder = "txt1"
	self.masks.saloonstar.offsets = {
		ecp_male = {
			Vector3(0.196759, -0.518719, -0.399472),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 0.316006, 0),
			Rotation(0, 0, -0)
		},
		joy = {
			Vector3(0, 0, -0.518719),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(-0.280226, 0.435252, -1.11495),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0, 0.912237, -0.280226),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.saloonlightlea = {}
	self.masks.saloonlightlea.unit = "units/pd2_dlc_txt1/masks/msk_saloonlightlea/msk_saloonlightlea"
	self.masks.saloonlightlea.name_id = "bm_msk_saloonlightlea"
	self.masks.saloonlightlea.pcs = {}
	self.masks.saloonlightlea.value = 0
	self.masks.saloonlightlea.type = "cowboyhat"
	self.masks.saloonlightlea.sort_number = 0
	self.masks.saloonlightlea.preview_oobb_object = "g_mask"
	self.masks.saloonlightlea.dlc = "txt1"
	self.masks.saloonlightlea.texture_bundle_folder = "txt1"
	self.masks.saloonlightlea.offsets = {
		ecp_male = {
			Vector3(0.196759, -0.518719, -0.399472),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 0.316006, 0),
			Rotation(0, 0, -0)
		},
		joy = {
			Vector3(0, 0, -0.518719),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(-0.280226, 0.435252, -1.11495),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0, 0.912237, -0.280226),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.saloondarklea = {}
	self.masks.saloondarklea.unit = "units/pd2_dlc_txt1/masks/msk_saloondarklea/msk_saloondarklea"
	self.masks.saloondarklea.name_id = "bm_msk_saloondarklea"
	self.masks.saloondarklea.pcs = {}
	self.masks.saloondarklea.value = 0
	self.masks.saloondarklea.type = "cowboyhat"
	self.masks.saloondarklea.sort_number = 0
	self.masks.saloondarklea.preview_oobb_object = "g_mask"
	self.masks.saloondarklea.dlc = "txt1"
	self.masks.saloondarklea.texture_bundle_folder = "txt1"
	self.masks.saloondarklea.offsets = {
		ecp_male = {
			Vector3(0.196759, -0.518719, -0.399472),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 0.316006, 0),
			Rotation(0, 0, -0)
		},
		joy = {
			Vector3(0, 0, -0.518719),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(-0.280226, 0.435252, -1.11495),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0, 0.912237, -0.280226),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.ranchcap_emblem = {}
	self.masks.ranchcap_emblem.unit = "units/pd2_dlc_txt1/masks/msk_ranchcap_emblem/msk_ranchcap_emblem"
	self.masks.ranchcap_emblem.name_id = "bm_msk_ranchcap_emblem"
	self.masks.ranchcap_emblem.pcs = {}
	self.masks.ranchcap_emblem.value = 0
	self.masks.ranchcap_emblem.type = "cowboyhat"
	self.masks.ranchcap_emblem.sort_number = 0
	self.masks.ranchcap_emblem.preview_oobb_object = "g_mask"
	self.masks.ranchcap_emblem.dlc = "txt1"
	self.masks.ranchcap_emblem.texture_bundle_folder = "txt1"
	self.masks.ranchcap_emblem.offsets = {
		jimmy = {
			Vector3(-0.16098, 0.316006, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.ranchcap_plain = {}
	self.masks.ranchcap_plain.unit = "units/pd2_dlc_txt1/masks/msk_ranchcap_plain/msk_ranchcap_plain"
	self.masks.ranchcap_plain.name_id = "bm_msk_ranchcap_plain"
	self.masks.ranchcap_plain.pcs = {}
	self.masks.ranchcap_plain.value = 0
	self.masks.ranchcap_plain.type = "cowboyhat"
	self.masks.ranchcap_plain.sort_number = 0
	self.masks.ranchcap_plain.preview_oobb_object = "g_mask"
	self.masks.ranchcap_plain.dlc = "txt1"
	self.masks.ranchcap_plain.texture_bundle_folder = "txt1"
	self.masks.ranchcap_plain.offsets = {
		jimmy = {
			Vector3(-0.16098, 0.316006, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.ranchcap_texas = {}
	self.masks.ranchcap_texas.unit = "units/pd2_dlc_txt1/masks/msk_ranchcap_texas/msk_ranchcap_texas"
	self.masks.ranchcap_texas.name_id = "bm_msk_ranchcap_texas"
	self.masks.ranchcap_texas.pcs = {}
	self.masks.ranchcap_texas.value = 0
	self.masks.ranchcap_texas.type = "cowboyhat"
	self.masks.ranchcap_texas.sort_number = 0
	self.masks.ranchcap_texas.preview_oobb_object = "g_mask"
	self.masks.ranchcap_texas.dlc = "txt1"
	self.masks.ranchcap_texas.texture_bundle_folder = "txt1"
	self.masks.ranchcap_texas.offsets = {
		jimmy = {
			Vector3(-0.16098, 0.316006, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.oilbaron = {}
	self.masks.oilbaron.unit = "units/pd2_dlc_rat/masks/msk_oilbaron/msk_oilbaron"
	self.masks.oilbaron.name_id = "bm_msk_oilbaron"
	self.masks.oilbaron.pcs = {}
	self.masks.oilbaron.value = 0
	self.masks.oilbaron.sort_number = 0
	self.masks.oilbaron.preview_oobb_object = "g_mask"
	self.masks.oilbaron.dlc = "rat_oilbaron"
	self.masks.oilbaron.texture_bundle_folder = "rat"
	self.masks.primtime = {}
	self.masks.primtime.unit = "units/pd2_dlc_prim/masks/msk_primtime/msk_primtime"
	self.masks.primtime.name_id = "bm_msk_primtime"
	self.masks.primtime.pcs = {}
	self.masks.primtime.value = 0
	self.masks.primtime.sort_number = 0
	self.masks.primtime.preview_oobb_object = "g_mask"
	self.masks.primtime.dlc = "prim_primtime"
	self.masks.primtime.texture_bundle_folder = "prim"
	self.masks.chrodome = {}
	self.masks.chrodome.unit = "units/pd2_dlc_txt2/masks/msk_chrodome/msk_chrodome"
	self.masks.chrodome.name_id = "bm_msk_chrodome"
	self.masks.chrodome.pcs = {}
	self.masks.chrodome.value = 0
	self.masks.chrodome.type = "helmet"
	self.masks.chrodome.sort_number = 0
	self.masks.chrodome.preview_oobb_object = "g_mask"
	self.masks.chrodome.dlc = "txt2"
	self.masks.chrodome.texture_bundle_folder = "txt2"
	self.masks.chrodome.offsets = {
		max = {
			Vector3(0, -1.94967, 0),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 0, 0.673745),
			Rotation(0, 0, -0)
		},
		chains = {
			Vector3(0, -0.876458, 0.673745),
			Rotation(0, 0, -0)
		},
		old_hoxton = {
			Vector3(0, 1.26998, -0.518719),
			Rotation(-0.30048, 6.56811, -1.66753e-09)
		},
		wild = {
			Vector3(0, -1.47269, 0.673745),
			Rotation(0, 0, -0)
		},
		wolf = {
			Vector3(0, -1.11495, 0.912237),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(0, 0.792991, 0),
			Rotation(0, 2.27524, 0)
		},
		ecp_male = {
			Vector3(0, -0.757211, 0),
			Rotation(-0, -0, -0)
		},
		myh = {
			Vector3(0, -0.995704, 0.554498),
			Rotation(0, 0, -0)
		}
	}
	self.masks.daredev = {}
	self.masks.daredev.unit = "units/pd2_dlc_txt2/masks/msk_daredev/msk_daredev"
	self.masks.daredev.name_id = "bm_msk_daredev"
	self.masks.daredev.pcs = {}
	self.masks.daredev.value = 0
	self.masks.daredev.type = "helmet"
	self.masks.daredev.sort_number = 0
	self.masks.daredev.preview_oobb_object = "g_mask"
	self.masks.daredev.dlc = "txt2"
	self.masks.daredev.texture_bundle_folder = "txt2"
	self.masks.daredev.offsets = {
		jimmy = {
			Vector3(0, 1.74696, -0.637965),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0.792991, -0.399472),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.funguy_default = {}
	self.masks.funguy_default.unit = "units/pd2_dlc_txt2/masks/msk_funguy/msk_funguy"
	self.masks.funguy_default.name_id = "bm_msk_cheat_error"
	self.masks.funguy_default.type = "helmet"
	self.masks.funguy_default.inaccessible = true
	self.masks.funguy_hair = {}
	self.masks.funguy_hair.unit = "units/pd2_dlc_txt2/masks/msk_funguy/msk_funguy_hair"
	self.masks.funguy_hair.name_id = "bm_msk_cheat_error"
	self.masks.funguy_hair.type = "helmet"
	self.masks.funguy_hair.inaccessible = true
	self.masks.funguy = {}
	self.masks.funguy.unit = "units/pd2_dlc_txt2/masks/msk_funguy/msk_funguy"
	self.masks.funguy.name_id = "bm_msk_funguy"
	self.masks.funguy.pcs = {}
	self.masks.funguy.value = 0
	self.masks.funguy.type = "helmet"
	self.masks.funguy.sort_number = 0
	self.masks.funguy.preview_oobb_object = "g_mask"
	self.masks.funguy.dlc = "txt2"
	self.masks.funguy.texture_bundle_folder = "txt2"
	self.masks.funguy.characters = {
		bodhi = "funguy_default",
		bonnie = "funguy_default",
		chains = "funguy_default",
		chico = "funguy_default",
		dallas = "funguy_default",
		dragan = "funguy_default",
		dragon = "funguy_default",
		ecp_female = "funguy_default",
		ecp_male = "funguy_default",
		female_1 = "funguy_hair",
		hoxton = "funguy_default",
		jacket = "funguy_default",
		jimmy = "funguy_hair",
		jowi = "funguy_default",
		joy = "funguy_default",
		max = "funguy_default",
		myh = "funguy_default",
		old_hoxton = "funguy_hair",
		sokol = "funguy_default",
		sydney = "funguy_default",
		wild = "funguy_default",
		wolf = "funguy_default"
	}
	self.masks.funguy.offsets = {
		wolf = {
			Vector3(0, 0, 0.673745),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0, -0.0417333),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0, 0, 0.316006),
			Rotation(-0, -0, -0)
		},
		ecp_male = {
			Vector3(0, -0.518719, -0.16098),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, -0.637965, 0),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, 0.077513, -0.0417333),
			Rotation(-0, -0, -0)
		},
		ecp_male = {
			Vector3(0, -0.876458, 0.077513),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.speedfreak = {}
	self.masks.speedfreak.unit = "units/pd2_dlc_txt2/masks/msk_speedfreak/msk_speedfreak"
	self.masks.speedfreak.name_id = "bm_msk_speedfreak"
	self.masks.speedfreak.pcs = {}
	self.masks.speedfreak.value = 0
	self.masks.speedfreak.type = "helmet"
	self.masks.speedfreak.sort_number = 0
	self.masks.speedfreak.preview_oobb_object = "g_mask"
	self.masks.speedfreak.dlc = "txt2"
	self.masks.speedfreak.texture_bundle_folder = "txt2"
	self.masks.speedfreak.offsets = {
		wild = {
			Vector3(0, -1.2342, 1.15073),
			Rotation(-0, -0, -0)
		},
		myh = {
			Vector3(0, 0, 0.673745),
			Rotation(-0, -0, -0)
		},
		wolf = {
			Vector3(0, 0, 0.912237),
			Rotation(-0, -0, -0)
		},
		ecp_male = {
			Vector3(0, -1.2342, 0.912237),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.threap_default = {}
	self.masks.threap_default.unit = "units/pd2_dlc_txt2/masks/msk_threap/msk_threap"
	self.masks.threap_default.name_id = "bm_msk_cheat_error"
	self.masks.threap_default.type = "helmet"
	self.masks.threap_default.inaccessible = true
	self.masks.threap_default.offsets = {
		ecp_male = {
			Vector3(0, -1.71118, 1.38922),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0, 0.673745),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.threap_hair = {}
	self.masks.threap_hair.unit = "units/pd2_dlc_txt2/masks/msk_threap/msk_threap_hair"
	self.masks.threap_hair.name_id = "bm_msk_cheat_error"
	self.masks.threap_hair.type = "helmet"
	self.masks.threap_hair.inaccessible = true
	self.masks.threap_hair.offsets = {
		jimmy = {
			Vector3(0, 0.673745, 0.554498),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, 0.554498, -0.876458),
			Rotation(0, 7.42668, 0)
		}
	}
	self.masks.threap = {}
	self.masks.threap.unit = "units/pd2_dlc_txt2/masks/msk_threap/msk_threap"
	self.masks.threap.name_id = "bm_msk_threap"
	self.masks.threap.pcs = {}
	self.masks.threap.value = 0
	self.masks.threap.type = "helmet"
	self.masks.threap.sort_number = 0
	self.masks.threap.preview_oobb_object = "g_mask"
	self.masks.threap.dlc = "txt2"
	self.masks.threap.texture_bundle_folder = "txt2"
	self.masks.threap.characters = {
		bodhi = "threap_default",
		bonnie = "threap_default",
		chains = "threap_default",
		chico = "threap_default",
		dallas = "threap_default",
		dragan = "threap_default",
		dragon = "threap_default",
		ecp_female = "threap_default",
		ecp_male = "threap_default",
		female_1 = "threap_hair",
		hoxton = "threap_default",
		jacket = "threap_default",
		jimmy = "threap_hair",
		jowi = "threap_hair",
		joy = "threap_default",
		max = "threap_default",
		myh = "threap_default",
		old_hoxton = "threap_hair",
		sokol = "threap_default",
		sydney = "threap_default",
		wild = "threap_default",
		wolf = "threap_default"
	}
	self.masks.waytexas = {}
	self.masks.waytexas.unit = "units/pd2_dlc_txt2/masks/msk_waytexas/msk_waytexas"
	self.masks.waytexas.name_id = "bm_msk_waytexase"
	self.masks.waytexas.pcs = {}
	self.masks.waytexas.value = 0
	self.masks.waytexas.type = "helmet"
	self.masks.waytexas.sort_number = 0
	self.masks.waytexas.preview_oobb_object = "g_mask"
	self.masks.waytexas.dlc = "txt2"
	self.masks.waytexas.texture_bundle_folder = "txt2"
	self.masks.waytexas.offsets = {
		joy = {
			Vector3(0, 0.673745, 0.435252),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0.673745, 0.673745),
			Rotation(-0, -0, -0)
		},
		chains = {
			Vector3(0, 0.077513, -0.399472),
			Rotation(-0, -0, -0)
		},
		jowi = {
			Vector3(0, 0.554498, 0.554498),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 0.792991, 0.077513),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 0.792991, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.skulldia = {}
	self.masks.skulldia.unit = "units/pd2_dlc_pda9/masks/msk_skulldia/msk_skulldia"
	self.masks.skulldia.name_id = "bm_msk_skulldia"
	self.masks.skulldia.pcs = {}
	self.masks.skulldia.value = 0
	self.masks.skulldia.sort_number = 0
	self.masks.skulldia.preview_oobb_object = "g_mask"
	self.masks.skulldia.dlc = "pda9"
	self.masks.skulldia.texture_bundle_folder = "pda9"
	self.masks.megaskulldia = {}
	self.masks.megaskulldia.unit = "units/pd2_dlc_pda9/masks/msk_megaskulldia/msk_megaskulldia"
	self.masks.megaskulldia.name_id = "bm_msk_megaskulldia"
	self.masks.megaskulldia.pcs = {}
	self.masks.megaskulldia.value = 0
	self.masks.megaskulldia.sort_number = 0
	self.masks.megaskulldia.preview_oobb_object = "g_mask"
	self.masks.megaskulldia.dlc = "pda9"
	self.masks.megaskulldia.texture_bundle_folder = "pda9"
	self.masks.dodhat = {}
	self.masks.dodhat.unit = "units/pd2_dlc_tma1/masks/msk_dodhat/msk_dodhat"
	self.masks.dodhat.name_id = "bm_msk_dodhat"
	self.masks.dodhat.pcs = {}
	self.masks.dodhat.value = 0
	self.masks.dodhat.type = "helmet"
	self.masks.dodhat.sort_number = 0
	self.masks.dodhat.preview_oobb_object = "g_mask"
	self.masks.dodhat.dlc = "tma1"
	self.masks.dodhat.texture_bundle_folder = "tma1"
	self.masks.dodhat.offsets = {
		jimmy = {
			Vector3(0, 0, 0.316006),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.railhat_default = {}
	self.masks.railhat_default.unit = "units/pd2_dlc_trt/masks/msk_railhat/msk_railhat"
	self.masks.railhat_default.name_id = "bm_msk_cheat_error"
	self.masks.railhat_default.type = "helmet"
	self.masks.railhat_default.inaccessible = true
	self.masks.railhat_default.offsets = {
		jacket = {
			Vector3(0, 0, 0.435252),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 0, 1.03148),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0, 0, 0.912237),
			Rotation(0, 0, -0)
		},
		hoxton = {
			Vector3(0, 0, 0.435252),
			Rotation(-0, -0, -0)
		},
		max = {
			Vector3(0, 0.316006, 0.316006),
			Rotation(-0, -0, -0)
		},
		wolf = {
			Vector3(0, 0, 0.554498),
			Rotation(0, 0, -0)
		},
		bonnie = {
			Vector3(0, 0, 0.554498),
			Rotation(0, 0, -0)
		},
		bodhi = {
			Vector3(0, 0, 0.196759),
			Rotation(0, 0, -0)
		},
		jowi = {
			Vector3(0, 0, 0.316006),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(0, 0, 0.435252),
			Rotation(0, 0, -0)
		},
		dragan = {
			Vector3(0, 0, 0.554498),
			Rotation(0, 0, -0)
		}
	}
	self.masks.railhat_hair = {}
	self.masks.railhat_hair.unit = "units/pd2_dlc_trt/masks/msk_railhat/msk_railhat_hair"
	self.masks.railhat_hair.name_id = "bm_msk_cheat_error"
	self.masks.railhat_hair.type = "helmet"
	self.masks.railhat_hair.inaccessible = true
	self.masks.railhat_hair.offsets = {
		sokol = {
			Vector3(0, -0.518719, 0.196759),
			Rotation(0, 0, -0)
		},
		myh = {
			Vector3(0, 0, -0.280226),
			Rotation(0, 0, -0)
		},
		chico = {
			Vector3(0, 0, -0.757211),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 0.435252, 0),
			Rotation(-0, -0, -0)
		},
		dragan = {
			Vector3(0, -0.280226, -0.518719),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.railhat_clover = {}
	self.masks.railhat_clover.unit = "units/pd2_dlc_trt/masks/msk_railhat/msk_railhat_clover"
	self.masks.railhat_clover.name_id = "bm_msk_cheat_error"
	self.masks.railhat_clover.type = "helmet"
	self.masks.railhat_clover.inaccessible = true
	self.masks.railhat = {}
	self.masks.railhat.unit = "units/pd2_dlc_trt/masks/msk_railhat/msk_railhat"
	self.masks.railhat.name_id = "bm_msk_railhat"
	self.masks.railhat.pcs = {}
	self.masks.railhat.value = 0
	self.masks.railhat.type = "helmet"
	self.masks.railhat.sort_number = 0
	self.masks.railhat.preview_oobb_object = "g_mask"
	self.masks.railhat.dlc = "trt_railhat"
	self.masks.railhat.texture_bundle_folder = "trt"
	self.masks.railhat.characters = {
		bodhi = "railhat_default",
		bonnie = "railhat_default",
		chains = "railhat_default",
		chico = "railhat_hair",
		dallas = "railhat_default",
		dragan = "railhat_hair",
		dragon = "railhat_default",
		ecp_female = "railhat_default",
		ecp_male = "railhat_default",
		female_1 = "railhat_clover",
		hoxton = "railhat_default",
		jacket = "railhat_default",
		jimmy = "railhat_hair",
		jowi = "railhat_default",
		joy = "railhat_hair",
		max = "railhat_default",
		myh = "railhat_hair",
		old_hoxton = "railhat_default",
		sokol = "railhat_hair",
		sydney = "railhat_hair",
		wild = "railhat_default",
		wolf = "railhat_default"
	}
	self.masks.homburg_default = {}
	self.masks.homburg_default.unit = "units/pd2_dlc_a11th/masks/msk_homburg/msk_homburg"
	self.masks.homburg_default.name_id = "bm_msk_cheat_error"
	self.masks.homburg_default.type = "cowboyhat"
	self.masks.homburg_default.inaccessible = true
	self.masks.homburg_default.offsets = {
		max = {
			Vector3(0.196759, 0, 0),
			Rotation(-0, -0, -0)
		},
		chico = {
			Vector3(0.316006, 0, 0),
			Rotation(-0, -0, -0)
		},
		bodhi = {
			Vector3(0.316006, 0, 0),
			Rotation(-0, -0, -0)
		},
		hoxton = {
			Vector3(0.077513, 0, 0),
			Rotation(-0, -0, -0)
		},
		chains = {
			Vector3(0.196759, 0.196759, 0),
			Rotation(-0, -0, -0)
		},
		jowi = {
			Vector3(0.316006, 0, 0.435252),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 0, -0.0417333),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0.077513, 0, 0),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, 0, 0.196759),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.homburg_big = {}
	self.masks.homburg_big.unit = "units/pd2_dlc_a11th/masks/msk_homburg/msk_homburg_big"
	self.masks.homburg_big.name_id = "bm_msk_cheat_error"
	self.masks.homburg_big.type = "cowboyhat"
	self.masks.homburg_big.inaccessible = true
	self.masks.homburg_big.offsets = {
		ecp_male = {
			Vector3(0.316006, -1.11495, 0),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0.316006, 0, -0.518719),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0.673745, -0.0417333),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.homburg = {}
	self.masks.homburg.unit = "units/pd2_dlc_a11th/masks/msk_homburg/msk_homburg"
	self.masks.homburg.name_id = "bm_msk_homburg"
	self.masks.homburg.pcs = {}
	self.masks.homburg.value = 0
	self.masks.homburg.sort_number = 0
	self.masks.homburg.type = "cowboyhat"
	self.masks.homburg.preview_oobb_object = "g_mask"
	self.masks.homburg.dlc = "a11th_homburg"
	self.masks.homburg.texture_bundle_folder = "a11th"
	self.masks.homburg.characters = {
		bodhi = "homburg_default",
		bonnie = "homburg_default",
		chains = "homburg_default",
		chico = "homburg_big",
		dallas = "homburg_default",
		dragan = "homburg_big",
		dragon = "homburg_default",
		ecp_female = "homburg_default",
		ecp_male = "homburg_big",
		female_1 = "homburg_big",
		hoxton = "homburg_default",
		jacket = "homburg_big",
		jimmy = "homburg_big",
		jowi = "homburg_big",
		joy = "homburg_big",
		max = "homburg_default",
		myh = "homburg_big",
		old_hoxton = "homburg_default",
		sokol = "homburg_big",
		sydney = "homburg_big",
		wild = "homburg_default",
		wolf = "homburg_default"
	}
	self.masks.homburg_grey_default = {}
	self.masks.homburg_grey_default.unit = "units/pd2_dlc_a11th/masks/msk_homburg_grey/msk_homburg_grey"
	self.masks.homburg_grey_default.name_id = "bm_msk_cheat_error"
	self.masks.homburg_grey_default.type = "cowboyhat"
	self.masks.homburg_grey_default.inaccessible = true
	self.masks.homburg_grey_default.offsets = {
		max = {
			Vector3(0.196759, 0, 0),
			Rotation(-0, -0, -0)
		},
		chico = {
			Vector3(0.316006, 0, 0),
			Rotation(-0, -0, -0)
		},
		bodhi = {
			Vector3(0.316006, 0, 0),
			Rotation(-0, -0, -0)
		},
		hoxton = {
			Vector3(0.077513, 0, 0),
			Rotation(-0, -0, -0)
		},
		chains = {
			Vector3(0.196759, 0.196759, 0),
			Rotation(-0, -0, -0)
		},
		jowi = {
			Vector3(0.316006, 0, 0.435252),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 0, -0.0417333),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0.077513, 0, 0),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, 0, 0.196759),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.homburg_grey_big = {}
	self.masks.homburg_grey_big.unit = "units/pd2_dlc_a11th/masks/msk_homburg_grey/msk_homburg_grey_big"
	self.masks.homburg_grey_big.name_id = "bm_msk_cheat_error"
	self.masks.homburg_grey_big.type = "cowboyhat"
	self.masks.homburg_grey_big.inaccessible = true
	self.masks.homburg_grey_big.offsets = {
		ecp_male = {
			Vector3(0.316006, -1.11495, 0),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0.316006, 0, -0.518719),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0.673745, -0.0417333),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.homburg_grey = {}
	self.masks.homburg_grey.unit = "units/pd2_dlc_a11th/masks/msk_homburg_grey/msk_homburg_grey"
	self.masks.homburg_grey.name_id = "bm_msk_homburg_grey"
	self.masks.homburg_grey.pcs = {}
	self.masks.homburg_grey.value = 0
	self.masks.homburg_grey.sort_number = 0
	self.masks.homburg_grey.type = "cowboyhat"
	self.masks.homburg_grey.preview_oobb_object = "g_mask"
	self.masks.homburg_grey.dlc = "a11th_homburg_grey"
	self.masks.homburg_grey.texture_bundle_folder = "a11th"
	self.masks.homburg_grey.characters = {
		bodhi = "homburg_grey_default",
		bonnie = "homburg_grey_default",
		chains = "homburg_grey_default",
		chico = "homburg_grey_big",
		dallas = "homburg_grey_default",
		dragan = "homburg_grey_big",
		dragon = "homburg_grey_default",
		ecp_female = "homburg_grey_default",
		ecp_male = "homburg_grey_big",
		female_1 = "homburg_grey_big",
		hoxton = "homburg_grey_default",
		jacket = "homburg_grey_big",
		jimmy = "homburg_grey_big",
		jowi = "homburg_grey_big",
		joy = "homburg_grey_big",
		max = "homburg_grey_default",
		myh = "homburg_grey_big",
		old_hoxton = "homburg_grey_default",
		sokol = "homburg_grey_big",
		sydney = "homburg_grey_big",
		wild = "homburg_grey_default",
		wolf = "homburg_grey_default"
	}
	self.masks.banshee = {}
	self.masks.banshee.unit = "units/pd2_dlc_h22/masks/msk_banshee/msk_banshee"
	self.masks.banshee.name_id = "bm_msk_banshee"
	self.masks.banshee.pcs = {}
	self.masks.banshee.value = 0
	self.masks.banshee.type = "helmet"
	self.masks.banshee.sort_number = 0
	self.masks.banshee.preview_oobb_object = "g_mask"
	self.masks.banshee.use_face_mask_on_sequence = true
	self.masks.banshee.dlc = "h22_banshee"
	self.masks.banshee.texture_bundle_folder = "h22"
	self.masks.bloodysnarl = {}
	self.masks.bloodysnarl.unit = "units/pd2_dlc_h22/masks/msk_bloodysnarl/msk_bloodysnarl"
	self.masks.bloodysnarl.name_id = "bm_msk_bloodysnarl"
	self.masks.bloodysnarl.pcs = {}
	self.masks.bloodysnarl.type = "helmet"
	self.masks.bloodysnarl.value = 0
	self.masks.bloodysnarl.sort_number = 1
	self.masks.bloodysnarl.preview_oobb_object = "g_mask"
	self.masks.bloodysnarl.dlc = "h22_bloodysnarl"
	self.masks.bloodysnarl.texture_bundle_folder = "h22"
	self.masks.devilhorn = {}
	self.masks.devilhorn.unit = "units/pd2_dlc_h22/masks/msk_devilhorn/msk_devilhorn"
	self.masks.devilhorn.name_id = "bm_msk_devilhorn"
	self.masks.devilhorn.pcs = {}
	self.masks.devilhorn.value = 0
	self.masks.devilhorn.sort_number = 2
	self.masks.devilhorn.preview_oobb_object = "g_mask"
	self.masks.devilhorn.dlc = "h22_devilhorn"
	self.masks.devilhorn.texture_bundle_folder = "h22"
	self.masks.deadman_lears = {}
	self.masks.deadman_lears.unit = "units/pd2_dlc_h22/masks/msk_deadman/msk_deadman_lears"
	self.masks.deadman_lears.name_id = "bm_msk_cheat_error"
	self.masks.deadman_lears.skip_mask_on_sequence = true
	self.masks.deadman_lears.type = "glasses"
	self.masks.deadman_lears.inaccessible = true
	self.masks.deadman_lears.offsets = {
		sokol = {
			Vector3(0, -0.876458, 0),
			Rotation(0, 0, -0)
		},
		wolf = {
			Vector3(0, -0.399472, -0.280226),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.deadman_default = {}
	self.masks.deadman_default.unit = "units/pd2_dlc_h22/masks/msk_deadman/msk_deadman"
	self.masks.deadman_default.name_id = "bm_msk_cheat_error"
	self.masks.deadman_default.skip_mask_on_sequence = true
	self.masks.deadman_default.type = "glasses"
	self.masks.deadman_default.inaccessible = true
	self.masks.deadman_ethan = {}
	self.masks.deadman_ethan.unit = "units/pd2_dlc_h22/masks/msk_deadman/msk_deadman_ethan"
	self.masks.deadman_ethan.name_id = "bm_msk_cheat_error"
	self.masks.deadman_ethan.skip_mask_on_sequence = true
	self.masks.deadman_ethan.type = "glasses"
	self.masks.deadman_ethan.inaccessible = true
	self.masks.deadman_bonnie = {}
	self.masks.deadman_bonnie.unit = "units/pd2_dlc_h22/masks/msk_deadman/msk_deadman_bonnie"
	self.masks.deadman_bonnie.name_id = "bm_msk_cheat_error"
	self.masks.deadman_bonnie.skip_mask_on_sequence = true
	self.masks.deadman_bonnie.type = "glasses"
	self.masks.deadman_bonnie.inaccessible = true
	self.masks.deadman_bonnie.offsets = {
		bonnie = {
			Vector3(0, 0, 0.554498),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.deadman_short = {}
	self.masks.deadman_short.unit = "units/pd2_dlc_h22/masks/msk_deadman/msk_deadman_short"
	self.masks.deadman_short.name_id = "bm_msk_cheat_error"
	self.masks.deadman_short.skip_mask_on_sequence = true
	self.masks.deadman_short.type = "glasses"
	self.masks.deadman_short.inaccessible = true
	self.masks.deadman_short.offsets = {
		wild = {
			Vector3(-0.16098, -0.518719, 0.554498),
			Rotation(-0, -0, -0)
		},
		dallas = {
			Vector3(0, -0.280226, 0),
			Rotation(-0, -0, -0)
		},
		hoxton = {
			Vector3(0, -0.280226, 0.673745),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, 0, 0.554498),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.deadman = {}
	self.masks.deadman.unit = "units/pd2_dlc_h22/masks/msk_deadman/msk_deadman"
	self.masks.deadman.name_id = "bm_msk_uno_01"
	self.masks.deadman.pcs = {}
	self.masks.deadman.value = 0
	self.masks.deadman.sort_number = 3
	self.masks.deadman.skip_mask_on_sequence = true
	self.masks.deadman.type = "glasses"
	self.masks.deadman.dlc = "h22_deadman"
	self.masks.deadman.texture_bundle_folder = "h22"
	self.masks.deadman.characters = {
		bodhi = "deadman_default",
		bonnie = "deadman_bonnie",
		chains = "deadman_short",
		chico = "deadman_default",
		dallas = "deadman_short",
		dragan = "deadman_default",
		dragon = "deadman_short",
		ecp_female = "deadman_lears",
		ecp_male = "deadman_ethan",
		female_1 = "deadman_default",
		hoxton = "deadman_short",
		jacket = "deadman_default",
		jimmy = "deadman_default",
		jowi = "deadman_default",
		joy = "deadman_default",
		max = "deadman_short",
		myh = "deadman_short",
		old_hoxton = "deadman_default",
		sokol = "deadman_lears",
		sydney = "deadman_lears",
		wild = "deadman_short",
		wolf = "deadman_lears"
	}
	self.masks.bandcap_dark_default = {}
	self.masks.bandcap_dark_default.unit = "units/pd2_dlc_txt3/masks/msk_bandcap_dark/msk_bandcap_dark"
	self.masks.bandcap_dark_default.name_id = "bm_msk_cheat_error"
	self.masks.bandcap_dark_default.type = "cowboyhat"
	self.masks.bandcap_dark_default.inaccessible = true
	self.masks.bandcap_dark_default.offsets = {
		dragon = {
			Vector3(0, 0, 0.673745),
			Rotation(-0, -0, -0)
		},
		jacket = {
			Vector3(0, 0.196759, 0.196759),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.bandcap_dark_hair = {}
	self.masks.bandcap_dark_hair.unit = "units/pd2_dlc_txt3/masks/msk_bandcap_dark/msk_bandcap_dark_hair"
	self.masks.bandcap_dark_hair.name_id = "bm_msk_cheat_error"
	self.masks.bandcap_dark_hair.type = "cowboyhat"
	self.masks.bandcap_dark_hair.inaccessible = true
	self.masks.bandcap_dark_hair.offsets = {
		jimmy = {
			Vector3(0, 0.554498, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.bandcap_dark = {}
	self.masks.bandcap_dark.unit = "units/pd2_dlc_txt3/masks/msk_bandcap_dark/msk_bandcap_dark"
	self.masks.bandcap_dark.name_id = "bm_msk_bandcap_dark"
	self.masks.bandcap_dark.pcs = {}
	self.masks.bandcap_dark.value = 0
	self.masks.bandcap_dark.type = "cowboyhat"
	self.masks.bandcap_dark.sort_number = 0
	self.masks.bandcap_dark.preview_oobb_object = "g_mask"
	self.masks.bandcap_dark.dlc = "txt3"
	self.masks.bandcap_dark.texture_bundle_folder = "txt3"
	self.masks.bandcap_dark.characters = {
		bodhi = "bandcap_dark_default",
		bonnie = "bandcap_dark_default",
		chains = "bandcap_dark_default",
		chico = "bandcap_dark_default",
		dallas = "bandcap_dark_default",
		dragan = "bandcap_dark_default",
		dragon = "bandcap_dark_default",
		ecp_female = "bandcap_dark_default",
		ecp_male = "bandcap_dark_default",
		female_1 = "bandcap_dark_hair",
		hoxton = "bandcap_dark_default",
		jacket = "bandcap_dark_default",
		jimmy = "bandcap_dark_hair",
		jowi = "bandcap_dark_default",
		joy = "bandcap_dark_default",
		max = "bandcap_dark_default",
		myh = "bandcap_dark_default",
		old_hoxton = "bandcap_dark_default",
		sokol = "bandcap_dark_default",
		sydney = "bandcap_dark_hair",
		wild = "bandcap_dark_default",
		wolf = "bandcap_dark_default"
	}
	self.masks.flapcapban_default = {}
	self.masks.flapcapban_default.unit = "units/pd2_dlc_txt3/masks/msk_flapcapban/msk_flapcapban"
	self.masks.flapcapban_default.name_id = "bm_msk_cheat_error"
	self.masks.flapcapban_default.type = "cowboyhat"
	self.masks.flapcapban_default.inaccessible = true
	self.masks.flapcapban_default.offsets = {
		dragon = {
			Vector3(0, 0, 0.673745),
			Rotation(-0, -0, -0)
		},
		jacket = {
			Vector3(0, 0, 1.03148),
			Rotation(-0, -0, -0)
		},
		bonnie = {
			Vector3(0, 0, 0.673745),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.flapcapban_hair = {}
	self.masks.flapcapban_hair.unit = "units/pd2_dlc_txt3/masks/msk_flapcapban/msk_flapcapban_hair"
	self.masks.flapcapban_hair.name_id = "bm_msk_cheat_error"
	self.masks.flapcapban_hair.type = "cowboyhat"
	self.masks.flapcapban_hair.inaccessible = true
	self.masks.flapcapban = {}
	self.masks.flapcapban.unit = "units/pd2_dlc_txt3/masks/msk_flapcapban/msk_flapcapban"
	self.masks.flapcapban.name_id = "bm_msk_flapcapban"
	self.masks.flapcapban.pcs = {}
	self.masks.flapcapban.value = 0
	self.masks.flapcapban.type = "cowboyhat"
	self.masks.flapcapban.sort_number = 0
	self.masks.flapcapban.preview_oobb_object = "g_mask"
	self.masks.flapcapban.dlc = "txt3"
	self.masks.flapcapban.texture_bundle_folder = "txt3"
	self.masks.flapcapban.characters = {
		bodhi = "flapcapban_default",
		bonnie = "flapcapban_default",
		chains = "flapcapban_default",
		chico = "flapcapban_default",
		dallas = "flapcapban_default",
		dragan = "flapcapban_default",
		dragon = "flapcapban_default",
		ecp_female = "flapcapban_default",
		ecp_male = "flapcapban_default",
		female_1 = "flapcapban_hair",
		hoxton = "flapcapban_default",
		jacket = "flapcapban_default",
		jimmy = "flapcapban_hair",
		jowi = "flapcapban_default",
		joy = "flapcapban_default",
		max = "flapcapban_default",
		myh = "flapcapban_default",
		old_hoxton = "flapcapban_default",
		sokol = "flapcapban_default",
		sydney = "flapcapban_hair",
		wild = "flapcapban_default",
		wolf = "flapcapban_default"
	}
	self.masks.gentgla_brown_default = {}
	self.masks.gentgla_brown_default.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_brown/msk_gentgla_brown"
	self.masks.gentgla_brown_default.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_brown_default.type = "glasses"
	self.masks.gentgla_brown_default.inaccessible = true
	self.masks.gentgla_brown_default.offsets = {
		myh = {
			Vector3(0, 0, -0.637965),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, -0.637965, -0.518719),
			Rotation(0, 0, -0)
		},
		jowi = {
			Vector3(0, -0.637965, 0),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(0, 0.435252, -0.637965),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0, -0.757211, -0.16098),
			Rotation(0, 0, -0)
		},
		dragan = {
			Vector3(0, -0.637965, -0.399472),
			Rotation(0, 0, -0)
		}
	}
	self.masks.gentgla_brown_short = {}
	self.masks.gentgla_brown_short.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_brown/msk_gentgla_brown_short"
	self.masks.gentgla_brown_short.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_brown_short.type = "glasses"
	self.masks.gentgla_brown_short.inaccessible = true
	self.masks.gentgla_brown_lears = {}
	self.masks.gentgla_brown_lears.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_brown/msk_gentgla_brown_lears"
	self.masks.gentgla_brown_lears.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_brown_lears.type = "glasses"
	self.masks.gentgla_brown_lears.inaccessible = true
	self.masks.gentgla_brown_lears.offsets = {
		sokol = {
			Vector3(0, -1.2342, 0),
			Rotation(0, 0, -0)
		},
		ecp_female = {
			Vector3(0, -0.637965, 0),
			Rotation(0, 0, -0)
		},
		wolf = {
			Vector3(0, 0, 0.554498),
			Rotation(0, 0, -0)
		},
		sydney = {
			Vector3(0, 0, 0.435252),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.gentgla_brown_bonnie = {}
	self.masks.gentgla_brown_bonnie.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_brown/msk_gentgla_brown_bonnie"
	self.masks.gentgla_brown_bonnie.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_brown_bonnie.type = "helmet"
	self.masks.gentgla_brown_bonnie.inaccessible = true
	self.masks.gentgla_brown_ethan = {}
	self.masks.gentgla_brown_ethan.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_brown/msk_gentgla_brown_ethan"
	self.masks.gentgla_brown_ethan.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_brown_ethan.type = "helmet"
	self.masks.gentgla_brown_ethan.inaccessible = true
	self.masks.gentgla_brown_ethan.offsets = {
		max = {
			Vector3(0, 0.673745, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.gentgla_brown = {}
	self.masks.gentgla_brown.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_brown/msk_gentgla_brown"
	self.masks.gentgla_brown.name_id = "bm_msk_gentgla_brown"
	self.masks.gentgla_brown.pcs = {}
	self.masks.gentgla_brown.value = 0
	self.masks.gentgla_brown.type = "helmet"
	self.masks.gentgla_brown.sort_number = 0
	self.masks.gentgla_brown.preview_oobb_object = "g_mask"
	self.masks.gentgla_brown.dlc = "txt3"
	self.masks.gentgla_brown.texture_bundle_folder = "txt3"
	self.masks.gentgla_brown.characters = {
		bodhi = "gentgla_brown_short",
		bonnie = "gentgla_brown_bonnie",
		chains = "gentgla_brown_short",
		chico = "gentgla_brown_default",
		dallas = "gentgla_brown_short",
		dragan = "gentgla_brown_default",
		dragon = "gentgla_brown_short",
		ecp_female = "gentgla_brown_lears",
		ecp_male = "gentgla_brown_ethan",
		female_1 = "gentgla_brown_default",
		hoxton = "gentgla_brown_short",
		jacket = "gentgla_brown_short",
		jimmy = "gentgla_brown_default",
		jowi = "gentgla_brown_default",
		joy = "gentgla_brown_default",
		max = "gentgla_brown_ethan",
		myh = "gentgla_brown_default",
		old_hoxton = "gentgla_brown_default",
		sokol = "gentgla_brown_lears",
		sydney = "gentgla_brown_lears",
		wild = "gentgla_brown_short",
		wolf = "gentgla_brown_lears"
	}
	self.masks.gentgla_dark_default = {}
	self.masks.gentgla_dark_default.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_dark/msk_gentgla_dark"
	self.masks.gentgla_dark_default.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_dark_default.type = "helmet"
	self.masks.gentgla_dark_default.inaccessible = true
	self.masks.gentgla_dark_default.offsets = {
		myh = {
			Vector3(0, 0, -0.637965),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, -0.637965, -0.518719),
			Rotation(0, 0, -0)
		},
		jowi = {
			Vector3(0, -0.637965, 0),
			Rotation(0, 0, -0)
		},
		jimmy = {
			Vector3(0, 0.435252, -0.637965),
			Rotation(0, 0, -0)
		},
		female_1 = {
			Vector3(0, -0.757211, -0.16098),
			Rotation(0, 0, -0)
		},
		dragan = {
			Vector3(0, -0.637965, -0.399472),
			Rotation(0, 0, -0)
		}
	}
	self.masks.gentgla_dark_short = {}
	self.masks.gentgla_dark_short.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_dark/msk_gentgla_dark_short"
	self.masks.gentgla_dark_short.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_dark_short.type = "helmet"
	self.masks.gentgla_dark_short.inaccessible = true
	self.masks.gentgla_dark_lears = {}
	self.masks.gentgla_dark_lears.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_dark/msk_gentgla_dark_lears"
	self.masks.gentgla_dark_lears.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_dark_lears.type = "helmet"
	self.masks.gentgla_dark_lears.inaccessible = true
	self.masks.gentgla_dark_lears.offsets = {
		ecp_female = {
			Vector3(0, -0.637965, 0),
			Rotation(0, 0, -0)
		},
		wolf = {
			Vector3(0, 0, 0.554498),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, -0.280226, 0.554498),
			Rotation(0, 0, -0)
		}
	}
	self.masks.gentgla_dark_bonnie = {}
	self.masks.gentgla_dark_bonnie.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_dark/msk_gentgla_dark_bonnie"
	self.masks.gentgla_dark_bonnie.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_dark_bonnie.type = "helmet"
	self.masks.gentgla_dark_bonnie.inaccessible = true
	self.masks.gentgla_dark_ethan = {}
	self.masks.gentgla_dark_ethan.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_dark/msk_gentgla_dark_ethan"
	self.masks.gentgla_dark_ethan.name_id = "bm_msk_cheat_error"
	self.masks.gentgla_dark_ethan.type = "helmet"
	self.masks.gentgla_dark_ethan.inaccessible = true
	self.masks.gentgla_dark_ethan.offsets = {
		max = {
			Vector3(0, 0.673745, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.gentgla_dark = {}
	self.masks.gentgla_dark.unit = "units/pd2_dlc_txt3/masks/msk_gentgla_dark/msk_gentgla_dark"
	self.masks.gentgla_dark.name_id = "bm_msk_gentgla_dark"
	self.masks.gentgla_dark.pcs = {}
	self.masks.gentgla_dark.value = 0
	self.masks.gentgla_dark.type = "helmet"
	self.masks.gentgla_dark.sort_number = 0
	self.masks.gentgla_dark.preview_oobb_object = "g_mask"
	self.masks.gentgla_dark.dlc = "txt3"
	self.masks.gentgla_dark.texture_bundle_folder = "txt3"
	self.masks.gentgla_dark.characters = {
		bodhi = "gentgla_dark_short",
		bonnie = "gentgla_dark_bonnie",
		chains = "gentgla_dark_short",
		chico = "gentgla_dark_default",
		dallas = "gentgla_dark_short",
		dragan = "gentgla_dark_default",
		dragon = "gentgla_dark_short",
		ecp_female = "gentgla_dark_lears",
		ecp_male = "gentgla_dark_ethan",
		female_1 = "gentgla_dark_default",
		hoxton = "gentgla_dark_short",
		jacket = "gentgla_dark_short",
		jimmy = "gentgla_dark_default",
		jowi = "gentgla_dark_default",
		joy = "gentgla_dark_default",
		max = "gentgla_dark_ethan",
		myh = "gentgla_dark_default",
		old_hoxton = "gentgla_dark_default",
		sokol = "gentgla_dark_lears",
		sydney = "gentgla_dark_lears",
		wild = "gentgla_dark_short",
		wolf = "gentgla_dark_lears"
	}
	self.masks.hatgla_dark_default = {}
	self.masks.hatgla_dark_default.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_dark/msk_hatgla_dark"
	self.masks.hatgla_dark_default.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_dark_default.type = "glasses"
	self.masks.hatgla_dark_default.inaccessible = true
	self.masks.hatgla_dark_default.offsets = {
		chico = {
			Vector3(0, 0.912237, 0),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 1.38922, 0),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, 0.435252, 0.435252),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.hatgla_dark_ethan = {}
	self.masks.hatgla_dark_ethan.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_dark/msk_hatgla_dark_ethan"
	self.masks.hatgla_dark_ethan.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_dark_ethan.type = "glasses"
	self.masks.hatgla_dark_ethan.inaccessible = true
	self.masks.hatgla_dark_short = {}
	self.masks.hatgla_dark_short.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_dark/msk_hatgla_dark_short"
	self.masks.hatgla_dark_short.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_dark_short.type = "glasses"
	self.masks.hatgla_dark_short.inaccessible = true
	self.masks.hatgla_dark_short.offsets = {
		chains = {
			Vector3(0, 0, -0.637965),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0, 0.316006, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.hatgla_dark_bonnie = {}
	self.masks.hatgla_dark_bonnie.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_dark/msk_hatgla_dark_bonnie"
	self.masks.hatgla_dark_bonnie.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_dark_bonnie.type = "helmet"
	self.masks.hatgla_dark_bonnie.inaccessible = true
	self.masks.hatgla_dark_lears = {}
	self.masks.hatgla_dark_lears.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_dark/msk_hatgla_dark_lears"
	self.masks.hatgla_dark_lears.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_dark_lears.type = "helmet"
	self.masks.hatgla_dark_lears.inaccessible = true
	self.masks.hatgla_dark_lears.offsets = {
		sokol = {
			Vector3(0, -1.2342, 1.03148),
			Rotation(-0, -0, -0)
		},
		ecp_female = {
			Vector3(0, -0.637965, 0.316006),
			Rotation(-0, -0, -0)
		},
		wolf = {
			Vector3(0, -0.399472, 0.912237),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.hatgla_dark = {}
	self.masks.hatgla_dark.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_dark/msk_hatgla_dark"
	self.masks.hatgla_dark.name_id = "bm_msk_hatgla_dark"
	self.masks.hatgla_dark.pcs = {}
	self.masks.hatgla_dark.value = 0
	self.masks.hatgla_dark.type = "helmet"
	self.masks.hatgla_dark.sort_number = 0
	self.masks.hatgla_dark.preview_oobb_object = "g_mask"
	self.masks.hatgla_dark.dlc = "txt3"
	self.masks.hatgla_dark.texture_bundle_folder = "txt3"
	self.masks.hatgla_dark.characters = {
		bodhi = "hatgla_dark_short",
		bonnie = "hatgla_dark_bonnie",
		chains = "hatgla_dark_short",
		chico = "hatgla_dark_default",
		dallas = "hatgla_dark_short",
		dragan = "hatgla_dark_default",
		dragon = "hatgla_dark_short",
		ecp_female = "hatgla_dark_lears",
		ecp_male = "hatgla_dark_ethan",
		female_1 = "hatgla_dark_lears",
		hoxton = "hatgla_dark_short",
		jacket = "hatgla_dark_short",
		jimmy = "hatgla_dark_default",
		jowi = "hatgla_dark_default",
		joy = "hatgla_dark_default",
		max = "hatgla_dark_short",
		myh = "hatgla_dark_short",
		old_hoxton = "hatgla_dark_default",
		sokol = "hatgla_dark_lears",
		sydney = "hatgla_dark_default",
		wild = "hatgla_dark_short",
		wolf = "hatgla_dark_lears"
	}
	self.masks.hatgla_green_default = {}
	self.masks.hatgla_green_default.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_green/msk_hatgla_green"
	self.masks.hatgla_green_default.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_green_default.type = "helmet"
	self.masks.hatgla_green_default.inaccessible = true
	self.masks.hatgla_green_default.offsets = {
		joy = {
			Vector3(0, -0.518719, -0.399472),
			Rotation(-0, -0, -0)
		},
		sydney = {
			Vector3(0, -0.518719, 0),
			Rotation(-0, -0, -0)
		},
		chico = {
			Vector3(0, -0.280226, -0.995704),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 0.077513, 0),
			Rotation(-0, -0, -0)
		},
		jowi = {
			Vector3(0, -0.757211, -0.280226),
			Rotation(-0, -0, -0)
		},
		old_hoxton = {
			Vector3(0, -0.637965, -0.637965),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.hatgla_green_ethan = {}
	self.masks.hatgla_green_ethan.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_green/msk_hatgla_green_ethan"
	self.masks.hatgla_green_ethan.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_green_ethan.type = "helmet"
	self.masks.hatgla_green_ethan.inaccessible = true
	self.masks.hatgla_green_short = {}
	self.masks.hatgla_green_short.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_green/msk_hatgla_green_short"
	self.masks.hatgla_green_short.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_green_short.type = "helmet"
	self.masks.hatgla_green_short.inaccessible = true
	self.masks.hatgla_green_short.offsets = {
		chains = {
			Vector3(0, 0, -0.637965),
			Rotation(-0, -0, -0)
		},
		dragon = {
			Vector3(0, 0.316006, 0),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.hatgla_green_bonnie = {}
	self.masks.hatgla_green_bonnie.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_green/msk_hatgla_green_bonnie"
	self.masks.hatgla_green_bonnie.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_green_bonnie.type = "helmet"
	self.masks.hatgla_green_bonnie.inaccessible = true
	self.masks.hatgla_green_lears = {}
	self.masks.hatgla_green_lears.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_green/msk_hatgla_green_lears"
	self.masks.hatgla_green_lears.name_id = "bm_msk_cheat_error"
	self.masks.hatgla_green_lears.type = "helmet"
	self.masks.hatgla_green_lears.inaccessible = true
	self.masks.hatgla_green_lears.offsets = {
		sokol = {
			Vector3(0, -1.2342, 1.03148),
			Rotation(-0, -0, -0)
		},
		ecp_female = {
			Vector3(0, -0.637965, 0.316006),
			Rotation(-0, -0, -0)
		},
		wolf = {
			Vector3(0, -0.399472, 0.912237),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.hatgla_green = {}
	self.masks.hatgla_green.unit = "units/pd2_dlc_txt3/masks/msk_hatgla_green/msk_hatgla_green"
	self.masks.hatgla_green.name_id = "bm_msk_hatgla_green"
	self.masks.hatgla_green.pcs = {}
	self.masks.hatgla_green.value = 0
	self.masks.hatgla_green.type = "helmet"
	self.masks.hatgla_green.sort_number = 0
	self.masks.hatgla_green.preview_oobb_object = "g_mask"
	self.masks.hatgla_green.dlc = "txt3"
	self.masks.hatgla_green.texture_bundle_folder = "txt3"
	self.masks.hatgla_green.characters = {
		bodhi = "hatgla_green_short",
		bonnie = "hatgla_green_bonnie",
		chains = "hatgla_green_short",
		chico = "hatgla_green_default",
		dallas = "hatgla_green_short",
		dragan = "hatgla_green_default",
		dragon = "hatgla_green_short",
		ecp_female = "hatgla_green_lears",
		ecp_male = "hatgla_green_ethan",
		female_1 = "hatgla_green_lears",
		hoxton = "hatgla_green_short",
		jacket = "hatgla_green_short",
		jimmy = "hatgla_green_default",
		jowi = "hatgla_green_default",
		joy = "hatgla_green_default",
		max = "hatgla_green_short",
		myh = "hatgla_green_short",
		old_hoxton = "hatgla_green_default",
		sokol = "hatgla_green_lears",
		sydney = "hatgla_green_default",
		wild = "hatgla_green_short",
		wolf = "hatgla_green_lears"
	}
	self.masks.elfhat = {}
	self.masks.elfhat.unit = "units/pd2_dlc_xm22/masks/msk_elfhat/msk_elfhat"
	self.masks.elfhat.name_id = "bm_msk_elfhat"
	self.masks.elfhat.pcs = {}
	self.masks.elfhat.value = 0
	self.masks.elfhat.type = "helmet"
	self.masks.elfhat.sort_number = 0
	self.masks.elfhat.preview_oobb_object = "g_mask"
	self.masks.elfhat.dlc = "xm22"
	self.masks.elfhat.texture_bundle_folder = "xm22"
	self.masks.elfhat_red = {}
	self.masks.elfhat_red.unit = "units/pd2_dlc_xm22/masks/msk_elfhat_red/msk_elfhat_red"
	self.masks.elfhat_red.name_id = "bm_msk_elfhat_red"
	self.masks.elfhat_red.pcs = {}
	self.masks.elfhat_red.value = 0
	self.masks.elfhat_red.type = "helmet"
	self.masks.elfhat_red.sort_number = 0
	self.masks.elfhat_red.preview_oobb_object = "g_mask"
	self.masks.elfhat_red.dlc = "xm22"
	self.masks.elfhat_red.texture_bundle_folder = "xm22"
	self.masks.elfhat_yellow = {}
	self.masks.elfhat_yellow.unit = "units/pd2_dlc_xm22/masks/msk_elfhat_yellow/msk_elfhat_yellow"
	self.masks.elfhat_yellow.name_id = "bm_msk_elfhat_yellow"
	self.masks.elfhat_yellow.pcs = {}
	self.masks.elfhat_yellow.value = 0
	self.masks.elfhat_yellow.type = "helmet"
	self.masks.elfhat_yellow.sort_number = 0
	self.masks.elfhat_yellow.preview_oobb_object = "g_mask"
	self.masks.elfhat_yellow.dlc = "xm22"
	self.masks.elfhat_yellow.texture_bundle_folder = "xm22"
	self.masks.elfhat_violet = {}
	self.masks.elfhat_violet.unit = "units/pd2_dlc_xm22/masks/msk_elfhat_violet/msk_elfhat_violet"
	self.masks.elfhat_violet.name_id = "bm_msk_elfhat_violet"
	self.masks.elfhat_violet.pcs = {}
	self.masks.elfhat_violet.value = 0
	self.masks.elfhat_violet.type = "helmet"
	self.masks.elfhat_violet.sort_number = 0
	self.masks.elfhat_violet.preview_oobb_object = "g_mask"
	self.masks.elfhat_violet.dlc = "xm22"
	self.masks.elfhat_violet.texture_bundle_folder = "xm22"
	self.masks.smilecigar = {}
	self.masks.smilecigar.unit = "units/pd2_dlc_cot/masks/msk_smilecigar/msk_smilecigar"
	self.masks.smilecigar.name_id = "bm_msk_smilecigar"
	self.masks.smilecigar.pcs = {}
	self.masks.smilecigar.value = 0
	self.masks.smilecigar.sort_number = 2
	self.masks.smilecigar.preview_oobb_object = "g_mask"
	self.masks.smilecigar.dlc = "cot_smilecigar"
	self.masks.smilecigar.texture_bundle_folder = "cot"
	self.masks.bthekidmask = {}
	self.masks.bthekidmask.unit = "units/pd2_dlc_txt4/masks/msk_bthekidmask/msk_bthekidmask"
	self.masks.bthekidmask.name_id = "bm_msk_bthekidmask"
	self.masks.bthekidmask.pcs = {}
	self.masks.bthekidmask.value = 0
	self.masks.bthekidmask.type = "cowboyhat"
	self.masks.bthekidmask.sort_number = 2
	self.masks.bthekidmask.preview_oobb_object = "g_mask"
	self.masks.bthekidmask.dlc = "txt4"
	self.masks.bthekidmask.texture_bundle_folder = "txt4"
	self.masks.bthekidmask.offsets = {
		sydney = {
			Vector3(0, 0, 0.435252),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.cassidymask = {}
	self.masks.cassidymask.unit = "units/pd2_dlc_txt4/masks/msk_cassidymask/msk_cassidymask"
	self.masks.cassidymask.name_id = "bm_msk_cassidymask"
	self.masks.cassidymask.pcs = {}
	self.masks.cassidymask.value = 0
	self.masks.cassidymask.type = "cowboyhat"
	self.masks.cassidymask.sort_number = 2
	self.masks.cassidymask.preview_oobb_object = "g_mask"
	self.masks.cassidymask.dlc = "txt4"
	self.masks.cassidymask.texture_bundle_folder = "txt4"
	self.masks.jessjamesmask = {}
	self.masks.jessjamesmask.unit = "units/pd2_dlc_txt4/masks/msk_jessjamesmask/msk_jessjamesmask"
	self.masks.jessjamesmask.name_id = "bm_msk_jessjamesmask"
	self.masks.jessjamesmask.pcs = {}
	self.masks.jessjamesmask.value = 0
	self.masks.jessjamesmask.type = "cowboyhat"
	self.masks.jessjamesmask.sort_number = 2
	self.masks.jessjamesmask.preview_oobb_object = "g_mask"
	self.masks.jessjamesmask.dlc = "txt4"
	self.masks.jessjamesmask.texture_bundle_folder = "txt4"
	self.masks.sambassmask = {}
	self.masks.sambassmask.unit = "units/pd2_dlc_txt4/masks/msk_sambassmask/msk_sambassmask"
	self.masks.sambassmask.name_id = "bm_msk_sambassmask"
	self.masks.sambassmask.pcs = {}
	self.masks.sambassmask.value = 0
	self.masks.sambassmask.type = "cowboyhat"
	self.masks.sambassmask.sort_number = 2
	self.masks.sambassmask.preview_oobb_object = "g_mask"
	self.masks.sambassmask.dlc = "txt4"
	self.masks.sambassmask.texture_bundle_folder = "txt4"
	self.masks.sambassmask.offsets = {
		jimmy = {
			Vector3(0, 0, -0.518719),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.gabhelm = {}
	self.masks.gabhelm.unit = "units/pd2_dlc_deep/characters/msk_gabhelm/msk_gabhelm"
	self.masks.gabhelm.name_id = "bm_msk_gabhelm"
	self.masks.gabhelm.pcs = {}
	self.masks.gabhelm.value = 0
	self.masks.gabhelm.type = "helmet"
	self.masks.gabhelm.sort_number = 0
	self.masks.gabhelm.preview_oobb_object = "g_mask"
	self.masks.gabhelm.texture_bundle_folder = "deep"
	self.masks.gabhelm.dlc = "dlc_achievement"
	self.masks.gabhelm.global_value = "deep"
	self.masks.bossflagmask = {}
	self.masks.bossflagmask.unit = "units/pd2_dlc_deep/characters/msk_bossflagmask/msk_bossflagmask"
	self.masks.bossflagmask.name_id = "bm_msk_bossflagmask"
	self.masks.bossflagmask.pcs = {}
	self.masks.bossflagmask.value = 0
	self.masks.bossflagmask.type = "cowboyhat"
	self.masks.bossflagmask.sort_number = 0
	self.masks.bossflagmask.preview_oobb_object = "g_mask"
	self.masks.bossflagmask.texture_bundle_folder = "deep"
	self.masks.bossflagmask.dlc = "dlc_achievement"
	self.masks.bossflagmask.global_value = "deep"
	self.masks.roclown = {}
	self.masks.roclown.unit = "units/pd2_dlc_dot/masks/msk_roclown/msk_roclown"
	self.masks.roclown.name_id = "bm_msk_roclown"
	self.masks.roclown.pcs = {}
	self.masks.roclown.value = 0
	self.masks.roclown.type = "helmet"
	self.masks.roclown.sort_number = 0
	self.masks.roclown.preview_oobb_object = "g_mask"
	self.masks.roclown.dlc = "dot_roclown_msk"
	self.masks.roclown.texture_bundle_folder = "dot"
	self.masks.teddymoo = {}
	self.masks.teddymoo.unit = "units/pd2_dlc_pda10/masks/msk_teddymoo/msk_teddymoo"
	self.masks.teddymoo.name_id = "bm_msk_teddymoo"
	self.masks.teddymoo.pcs = {}
	self.masks.teddymoo.value = 0
	self.masks.teddymoo.sort_number = 0
	self.masks.teddymoo.preview_oobb_object = "g_mask"
	self.masks.teddymoo.dlc = "pda10"
	self.masks.teddymoo.texture_bundle_folder = "pda10"
	self.masks.guldgris = {}
	self.masks.guldgris.unit = "units/pd2_dlc_pda10/masks/msk_guldgris/msk_guldgris"
	self.masks.guldgris.name_id = "bm_msk_guldgris"
	self.masks.guldgris.pcs = {}
	self.masks.guldgris.value = 0
	self.masks.guldgris.sort_number = 0
	self.masks.guldgris.preview_oobb_object = "g_mask"
	self.masks.guldgris.dlc = "pda10"
	self.masks.guldgris.texture_bundle_folder = "pda10"
	self.masks.splitcrim = {}
	self.masks.splitcrim.unit = "units/pd2_dlc_pda10/masks/msk_splitcrim/msk_splitcrim"
	self.masks.splitcrim.name_id = "bm_msk_splitcrim"
	self.masks.splitcrim.pcs = {}
	self.masks.splitcrim.value = 0
	self.masks.splitcrim.sort_number = 0
	self.masks.splitcrim.preview_oobb_object = "g_mask"
	self.masks.splitcrim.dlc = "pda10"
	self.masks.splitcrim.texture_bundle_folder = "pda10"
	self.masks.zoothat_black = {}
	self.masks.zoothat_black.unit = "units/pd2_dlc_pda10/masks/msk_zoothat_black/msk_zoothat_black"
	self.masks.zoothat_black.name_id = "bm_msk_zoothat_black"
	self.masks.zoothat_black.pcs = {}
	self.masks.zoothat_black.value = 0
	self.masks.zoothat_black.type = "cowboyhat"
	self.masks.zoothat_black.sort_number = 0
	self.masks.zoothat_black.preview_oobb_object = "g_mask"
	self.masks.zoothat_black.dlc = "pda10"
	self.masks.zoothat_black.texture_bundle_folder = "pda10"
	self.masks.zoothat_black.offsets = {
		joy = {
			Vector3(0, 0, -0.995704),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 0, -0.995704),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 1.15073, -0.995704),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.zoothat_yellow = {}
	self.masks.zoothat_yellow.unit = "units/pd2_dlc_pda10/masks/msk_zoothat_yellow/msk_zoothat_yellow"
	self.masks.zoothat_yellow.name_id = "bm_msk_zoothat_yellow"
	self.masks.zoothat_yellow.pcs = {}
	self.masks.zoothat_yellow.value = 0
	self.masks.zoothat_yellow.type = "cowboyhat"
	self.masks.zoothat_yellow.sort_number = 0
	self.masks.zoothat_yellow.preview_oobb_object = "g_mask"
	self.masks.zoothat_yellow.dlc = "pda10"
	self.masks.zoothat_yellow.texture_bundle_folder = "pda10"
	self.masks.zoothat_yellow.offsets = {
		joy = {
			Vector3(0, 0, -0.995704),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 0, -0.995704),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 1.15073, -0.995704),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.zoothat_red = {}
	self.masks.zoothat_red.unit = "units/pd2_dlc_pda10/masks/msk_zoothat_red/msk_zoothat_red"
	self.masks.zoothat_red.name_id = "bm_msk_zoothat_red"
	self.masks.zoothat_red.pcs = {}
	self.masks.zoothat_red.value = 0
	self.masks.zoothat_red.type = "cowboyhat"
	self.masks.zoothat_red.sort_number = 0
	self.masks.zoothat_red.preview_oobb_object = "g_mask"
	self.masks.zoothat_red.dlc = "pda10"
	self.masks.zoothat_red.texture_bundle_folder = "pda10"
	self.masks.zoothat_red.offsets = {
		joy = {
			Vector3(0, 0, -0.995704),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 0, -0.995704),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 1.15073, -0.995704),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.zoothat_blue = {}
	self.masks.zoothat_blue.unit = "units/pd2_dlc_pda10/masks/msk_zoothat_blue/msk_zoothat_blue"
	self.masks.zoothat_blue.name_id = "bm_msk_zoothat_blue"
	self.masks.zoothat_blue.pcs = {}
	self.masks.zoothat_blue.value = 0
	self.masks.zoothat_blue.type = "cowboyhat"
	self.masks.zoothat_blue.sort_number = 0
	self.masks.zoothat_blue.preview_oobb_object = "g_mask"
	self.masks.zoothat_blue.dlc = "pda10"
	self.masks.zoothat_blue.texture_bundle_folder = "pda10"
	self.masks.zoothat_blue.offsets = {
		joy = {
			Vector3(0, 0, -0.995704),
			Rotation(-0, -0, -0)
		},
		jimmy = {
			Vector3(0, 0, -0.995704),
			Rotation(-0, -0, -0)
		},
		female_1 = {
			Vector3(0, 1.15073, -0.995704),
			Rotation(-0, -0, -0)
		}
	}
	self.masks.hackmask = {}
	self.masks.hackmask.unit = "units/pd2_dlc_lrfo/masks/msk_hackmask/msk_hackmask"
	self.masks.hackmask.name_id = "bm_msk_hackmask"
	self.masks.hackmask.pcs = {}
	self.masks.hackmask.value = 0
	self.masks.hackmask.sort_number = 0
	self.masks.hackmask.preview_oobb_object = "g_mask"
	self.masks.hackmask.dlc = "lrfo"
	self.masks.hackmask.texture_bundle_folder = "lrfo"
	self.masks.hackmask.offsets = {
		wolf = {
			Vector3(0, -0.280226, 0.554498),
			Rotation(-0, -0, -0)
		},
		wild = {
			Vector3(0, -0.399472, 0.077513),
			Rotation(-0, -0, -0)
		}
	}

	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.masks) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end

	self:_add_desc_from_name_macro(self.masks)
end
