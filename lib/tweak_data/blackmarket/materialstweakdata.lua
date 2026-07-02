function BlackMarketTweakData:_init_materials(tweak_data)
	local C_HI = 0.8
	local C_MD = 0.4
	local C_LO = 0.2
	local C_NO = 0.05
	local color_generic_white = Color(C_HI, C_HI, C_HI)
	local color_generic_light = Color(C_MD, C_MD, C_MD)
	local color_generic_dark = Color(C_LO, C_LO, C_LO)
	local color_generic_black = Color(C_NO, C_NO, C_NO)
	local color_generic_red = Color(C_HI, C_NO, C_NO)
	local color_generic_red_white = Color(C_HI, C_MD, C_MD)
	local color_generic_red_light = Color(C_HI, C_LO, C_LO)
	local color_generic_red_dark = Color(C_MD, C_NO, C_NO)
	local color_generic_red_black = Color(C_LO, C_NO, C_NO)
	local color_generic_green = Color(C_NO, C_HI, C_NO)
	local color_generic_green_white = Color(C_MD, C_HI, C_MD)
	local color_generic_green_light = Color(C_LO, C_HI, C_LO)
	local color_generic_green_dark = Color(C_NO, C_MD, C_NO)
	local color_generic_green_black = Color(C_NO, C_LO, C_NO)
	local color_generic_blue = Color(C_NO, C_NO, C_HI)
	local color_generic_blue_white = Color(C_MD, C_MD, C_HI)
	local color_generic_blue_light = Color(C_LO, C_LO, C_HI)
	local color_generic_blue_dark = Color(C_NO, C_NO, C_MD)
	local color_generic_blue_black = Color(C_NO, C_NO, C_LO)

	self.materials = {}
	self.materials.strip_paint = {}
	self.materials.strip_paint.name_id = "bm_mtl_strip_paint"
	self.materials.strip_paint.texture = "units/payday2/matcaps/matcap_plastic_df"
	self.materials.strip_paint.material_amount = 2
	self.materials.strip_paint.value = 0
	self.materials.strip_paint.color = color_generic_white
	self.materials.strip_paint.texture_bundle_folder = "lic"
	self.materials.strip_paint.does_not_apply_color = true
	self.materials.strip_paint.unlimited = true
	self.materials.nothing = {}
	self.materials.nothing.name_id = "bm_mtl_nothing"
	self.materials.nothing.texture = "units/payday2/matcaps/matcap_plastic_df"
	self.materials.nothing.tintable_gui = "guis/dlcs/lic/textures/pd2/blackmarket/icons/materials/nothing"
	self.materials.nothing.material_amount = 2
	self.materials.nothing.value = 0
	self.materials.nothing.color = Color(0.25, 0.25, 0.25)
	self.materials.nothing.texture_bundle_folder = "lic"
	self.materials.nothing.unlimited = true
	self.materials.plastic = {}
	self.materials.plastic.name_id = "bm_mtl_plastic"
	self.materials.plastic.texture = "units/payday2/matcaps/matcap_plastic_df"
	self.materials.plastic.value = 0
	self.materials.plastic.color = color_generic_white
	self.materials.plastic.unlimited = true
	self.materials.titanium = {}
	self.materials.titanium.name_id = "bm_mtl_titanium"
	self.materials.titanium.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.titanium.texture = "units/payday2/matcaps/matcap_titanium_df"
	self.materials.titanium.infamous = true
	self.materials.titanium.value = 5
	self.materials.titanium.color = color_generic_light
	self.materials.mercury = {}
	self.materials.mercury.name_id = "bm_mtl_mercury"
	self.materials.mercury.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.mercury.texture = "units/payday2/matcaps/matcap_mercury_df"
	self.materials.mercury.value = 3
	self.materials.mercury.color = color_generic_light
	self.materials.oxide_bronze = {}
	self.materials.oxide_bronze.name_id = "bm_mtl_oxide_bronze"
	self.materials.oxide_bronze.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.oxide_bronze.texture = "units/payday2/matcaps/matcap_oxide_bronze_df"
	self.materials.oxide_bronze.value = 4
	self.materials.oxide_bronze.color = Color("615b4c")
	self.materials.deep_bronze = {}
	self.materials.deep_bronze.name_id = "bm_mtl_deep_bronze"
	self.materials.deep_bronze.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.deep_bronze.texture = "units/payday2/matcaps/matcap_deep_bronze_df"
	self.materials.deep_bronze.infamous = true
	self.materials.deep_bronze.value = 5
	self.materials.deep_bronze.color = Color("896138")
	self.materials.slime = {}
	self.materials.slime.name_id = "bm_mtl_slime"
	self.materials.slime.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.slime.texture = "units/payday2/matcaps/matcap_slime_df"
	self.materials.slime.infamous = true
	self.materials.slime.value = 2
	self.materials.slime.color = Color("5b9370")
	self.materials.gold_clean = {}
	self.materials.gold_clean.name_id = "bm_mtl_gold_clean"
	self.materials.gold_clean.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.gold_clean.texture = "units/payday2/matcaps/matcap_gold_clean_df"
	self.materials.gold_clean.infamous = true
	self.materials.gold_clean.value = 10
	self.materials.gold_clean.color = Color("ad8931")
	self.materials.concrete1 = {}
	self.materials.concrete1.name_id = "bm_mtl_concrete1"
	self.materials.concrete1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.concrete1.texture = "units/payday2/matcaps/matcap_concrete1_df"
	self.materials.concrete1.material_amount = 0
	self.materials.concrete1.value = 2
	self.materials.concrete1.color = Color("a6a3a0")
	self.materials.rock1 = {}
	self.materials.rock1.name_id = "bm_mtl_rock1"
	self.materials.rock1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rock1.texture = "units/payday2/matcaps/matcap_rock1_df"
	self.materials.rock1.material_amount = 0
	self.materials.rock1.value = 3
	self.materials.rock1.color = Color("80715c")
	self.materials.rock2 = {}
	self.materials.rock2.name_id = "bm_mtl_rock2"
	self.materials.rock2.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rock2.texture = "units/payday2/matcaps/matcap_rock2_df"
	self.materials.rock2.material_amount = 0
	self.materials.rock2.value = 2
	self.materials.rock2.color = Color("8a8a8e")
	self.materials.rock3 = {}
	self.materials.rock3.name_id = "bm_mtl_rock3"
	self.materials.rock3.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rock3.texture = "units/payday2/matcaps/matcap_rock3_df"
	self.materials.rock3.material_amount = 0
	self.materials.rock3.value = 2
	self.materials.rock3.color = Color("8e8b8b")
	self.materials.whiterock = {}
	self.materials.whiterock.name_id = "bm_mtl_whiterock"
	self.materials.whiterock.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.whiterock.texture = "units/payday2/matcaps/matcap_whiterock_df"
	self.materials.whiterock.material_amount = 0
	self.materials.whiterock.value = 3
	self.materials.whiterock.color = Color("9ca4bf")
	self.materials.metal1 = {}
	self.materials.metal1.name_id = "bm_mtl_metal1"
	self.materials.metal1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.metal1.texture = "units/payday2/matcaps/matcap_metal1_df"
	self.materials.metal1.material_amount = 0
	self.materials.metal1.value = 6
	self.materials.metal1.color = Color("757a78")
	self.materials.cracks1 = {}
	self.materials.cracks1.name_id = "bm_mtl_cracks1"
	self.materials.cracks1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.cracks1.texture = "units/payday2/matcaps/matcap_cracks1_df"
	self.materials.cracks1.material_amount = 0
	self.materials.cracks1.value = 2
	self.materials.cracks1.color = Color("82898b")
	self.materials.wicker1 = {}
	self.materials.wicker1.name_id = "bm_mtl_wicker1"
	self.materials.wicker1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.wicker1.texture = "units/payday2/matcaps/matcap_wicker1_df"
	self.materials.wicker1.material_amount = 0
	self.materials.wicker1.value = 3
	self.materials.wicker1.color = Color("c7a785")
	self.materials.scales = {}
	self.materials.scales.name_id = "bm_mtl_scales"
	self.materials.scales.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.scales.texture = "units/payday2/matcaps/matcap_scales_df"
	self.materials.scales.infamous = true
	self.materials.scales.material_amount = 0
	self.materials.scales.value = 7
	self.materials.scales.color = Color("d7e069")
	self.materials.oldbronze = {}
	self.materials.oldbronze.name_id = "bm_mtl_oldbronze"
	self.materials.oldbronze.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.oldbronze.texture = "units/payday2/matcaps/matcap_oldbronze_df"
	self.materials.oldbronze.material_amount = 0
	self.materials.oldbronze.infamous = true
	self.materials.oldbronze.value = 8
	self.materials.oldbronze.color = Color("7eb49b")
	self.materials.bark1 = {}
	self.materials.bark1.name_id = "bm_mtl_bark1"
	self.materials.bark1.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bark1.texture = "units/payday2/matcaps/matcap_bark1_df"
	self.materials.bark1.material_amount = 0
	self.materials.bark1.value = 4
	self.materials.bark1.color = Color("726c52")
	self.materials.bark2 = {}
	self.materials.bark2.name_id = "bm_mtl_bark2"
	self.materials.bark2.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bark2.texture = "units/payday2/matcaps/matcap_bark2_df"
	self.materials.bark2.material_amount = 0
	self.materials.bark2.value = 3
	self.materials.bark2.color = Color("a18042")
	self.materials.bark3 = {}
	self.materials.bark3.name_id = "bm_mtl_bark3"
	self.materials.bark3.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bark3.texture = "units/payday2/matcaps/matcap_bark3_df"
	self.materials.bark3.material_amount = 0
	self.materials.bark3.value = 2
	self.materials.bark3.color = Color("8d7b64")
	self.materials.carbon = {}
	self.materials.carbon.name_id = "bm_mtl_carbon"
	self.materials.carbon.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.carbon.texture = "units/payday2/matcaps/matcap_carbon_df"
	self.materials.carbon.material_amount = 0
	self.materials.carbon.value = 6
	self.materials.carbon.color = Color("595959")
	self.materials.leather = {}
	self.materials.leather.name_id = "bm_mtl_leather1"
	self.materials.leather.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.leather.texture = "units/payday2/matcaps/matcap_leather1_df"
	self.materials.leather.material_amount = 0
	self.materials.leather.value = 6
	self.materials.leather.color = Color("973b08")
	self.materials.bloodred = {}
	self.materials.bloodred.name_id = "bm_mtl_bloodred"
	self.materials.bloodred.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bloodred.texture = "units/payday2/matcaps/matcap_bloodred_df"
	self.materials.bloodred.value = 8
	self.materials.bloodred.color = Color("c33d3e")
	self.materials.waterblue = {}
	self.materials.waterblue.name_id = "bm_mtl_waterblue"
	self.materials.waterblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.waterblue.texture = "units/payday2/matcaps/matcap_waterblue_df"
	self.materials.waterblue.value = 4
	self.materials.waterblue.color = Color("98c7d4")
	self.materials.matteblack = {}
	self.materials.matteblack.name_id = "bm_mtl_matteblack"
	self.materials.matteblack.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.matteblack.texture = "units/payday2/matcaps/matcap_matteblack_df"
	self.materials.matteblack.value = 9
	self.materials.matteblack.color = Color("404040")
	self.materials.pianoblack = {}
	self.materials.pianoblack.name_id = "bm_mtl_pianoblack"
	self.materials.pianoblack.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.pianoblack.texture = "units/payday2/matcaps/matcap_pianoblack_df"
	self.materials.pianoblack.infamous = true
	self.materials.pianoblack.value = 10
	self.materials.pianoblack.color = Color("3f3f3f")
	self.materials.twoblue = {}
	self.materials.twoblue.name_id = "bm_mtl_twoblue"
	self.materials.twoblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.twoblue.texture = "units/payday2/matcaps/matcap_twoblue_df"
	self.materials.twoblue.value = 6
	self.materials.twoblue.color = Color("6772a1")
	self.materials.rainbow = {}
	self.materials.rainbow.name_id = "bm_mtl_rainbow"
	self.materials.rainbow.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.rainbow.texture = "units/payday2/matcaps/matcap_rainbow_df"
	self.materials.rainbow.infamous = true
	self.materials.rainbow.value = 3
	self.materials.rainbow.color = Color("7da683")
	self.materials.magma = {}
	self.materials.magma.name_id = "bm_mtl_magma"
	self.materials.magma.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.magma.texture = "units/payday2/matcaps/matcap_magma_df"
	self.materials.magma.value = 6
	self.materials.magma.color = Color("bd6407")
	self.materials.radioactive = {}
	self.materials.radioactive.name_id = "bm_mtl_radioactive"
	self.materials.radioactive.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.radioactive.texture = "units/payday2/matcaps/matcap_radioactive_df"
	self.materials.radioactive.infamous = true
	self.materials.radioactive.value = 7
	self.materials.radioactive.color = Color("5b6c22")
	self.materials.bismuth = {}
	self.materials.bismuth.name_id = "bm_mtl_bismuth"
	self.materials.bismuth.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.bismuth.texture = "units/payday2/matcaps/matcap_bismuth_df"
	self.materials.bismuth.value = 3
	self.materials.bismuth.color = Color("5974a6")
	self.materials.greygloss = {}
	self.materials.greygloss.name_id = "bm_mtl_greygloss"
	self.materials.greygloss.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.greygloss.texture = "units/payday2/matcaps/matcap_greygloss_df"
	self.materials.greygloss.value = 5
	self.materials.greygloss.color = Color("5c5b5c")
	self.materials.finewood = {}
	self.materials.finewood.name_id = "bm_mtl_finewood"
	self.materials.finewood.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.finewood.texture = "units/payday2/matcaps/matcap_finewood_df"
	self.materials.finewood.material_amount = 0
	self.materials.finewood.value = 8
	self.materials.finewood.color = Color("79311b")
	self.materials.skin = {}
	self.materials.skin.name_id = "bm_mtl_skin"
	self.materials.skin.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.skin.texture = "units/payday2/matcaps/matcap_skin_df"
	self.materials.skin.material_amount = 0
	self.materials.skin.value = 6
	self.materials.skin.color = Color("d4b3a2")
	self.materials.alligator = {}
	self.materials.alligator.name_id = "bm_mtl_alligator"
	self.materials.alligator.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.alligator.texture = "units/payday2/matcaps/matcap_alligator_df"
	self.materials.alligator.material_amount = 0
	self.materials.alligator.value = 6
	self.materials.alligator.color = Color("545639")
	self.materials.denim = {}
	self.materials.denim.name_id = "bm_mtl_denim"
	self.materials.denim.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.denim.texture = "units/payday2/matcaps/matcap_denim_df"
	self.materials.denim.material_amount = 0
	self.materials.denim.value = 2
	self.materials.denim.color = Color("6f829e")
	self.materials.candy = {}
	self.materials.candy.name_id = "bm_mtl_candy"
	self.materials.candy.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.candy.texture = "units/payday2/matcaps/matcap_candy_df"
	self.materials.candy.value = 5
	self.materials.candy.color = Color("c59ac2")
	self.materials.chrome_purple = {}
	self.materials.chrome_purple.name_id = "bm_mtl_chrome_purple"
	self.materials.chrome_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.chrome_purple.texture = "units/payday2/matcaps/matcap_chrome_purple_df"
	self.materials.chrome_purple.value = 5
	self.materials.chrome_purple.color = Color("6e3f9e")
	self.materials.hot_cold = {}
	self.materials.hot_cold.name_id = "bm_mtl_hot_cold"
	self.materials.hot_cold.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.hot_cold.texture = "units/payday2/matcaps/matcap_hot_cold_df"
	self.materials.hot_cold.value = 5
	self.materials.hot_cold.color = Color("888d98")
	self.materials.orchish = {}
	self.materials.orchish.name_id = "bm_mtl_orchish"
	self.materials.orchish.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.orchish.texture = "units/payday2/matcaps/matcap_orcish_df"
	self.materials.orchish.value = 5
	self.materials.orchish.color = Color("655b25")
	self.materials.cash = {}
	self.materials.cash.name_id = "bm_mtl_cash"
	self.materials.cash.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.cash.texture = "units/pd2_dlc1/matcaps/matcap_cash_df"
	self.materials.cash.material_amount = 0
	self.materials.cash.value = 5
	self.materials.cash.dlc = "armored_transport"
	self.materials.cash.color = Color("989a87")
	self.materials.jade = {}
	self.materials.jade.name_id = "bm_mtl_jade"
	self.materials.jade.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.jade.texture = "units/pd2_dlc1/matcaps/matcap_jade_df"
	self.materials.jade.value = 5
	self.materials.jade.dlc = "armored_transport"
	self.materials.jade.color = Color("4e8f5f")
	self.materials.redwhiteblue = {}
	self.materials.redwhiteblue.name_id = "bm_mtl_redwhiteblue"
	self.materials.redwhiteblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.redwhiteblue.texture = "units/pd2_dlc1/matcaps/matcap_redwhiteblue_df"
	self.materials.redwhiteblue.value = 5
	self.materials.redwhiteblue.dlc = "armored_transport"
	self.materials.redwhiteblue.color = Color("b2758d")
	self.materials.marble = {}
	self.materials.marble.name_id = "bm_mtl_marble"
	self.materials.marble.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.marble.texture = "units/pd2_dlc1/matcaps/matcap_marble_df"
	self.materials.marble.value = 5
	self.materials.marble.dlc = "armored_transport"
	self.materials.marble.color = Color("bcada6")
	self.materials.fur = {}
	self.materials.fur.name_id = "bm_mtl_fur"
	self.materials.fur.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.fur.texture = "units/pd2_dlc_dec5/matcaps/matcap_fur_df"
	self.materials.fur.material_amount = 0
	self.materials.fur.value = 5
	self.materials.fur.dlc = "gage_pack"
	self.materials.fur.color = Color("c39870")
	self.materials.galvanized = {}
	self.materials.galvanized.name_id = "bm_mtl_galvanized"
	self.materials.galvanized.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.galvanized.texture = "units/pd2_dlc_dec5/matcaps/matcap_galvanized_df"
	self.materials.galvanized.material_amount = 0
	self.materials.galvanized.value = 5
	self.materials.galvanized.dlc = "gage_pack"
	self.materials.galvanized.color = Color("959b8f")
	self.materials.heavymetal = {}
	self.materials.heavymetal.name_id = "bm_mtl_heavymetal"
	self.materials.heavymetal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.heavymetal.texture = "units/pd2_dlc_dec5/matcaps/matcap_heavymetal_df"
	self.materials.heavymetal.material_amount = 0
	self.materials.heavymetal.value = 5
	self.materials.heavymetal.dlc = "gage_pack"
	self.materials.heavymetal.color = Color("343537")
	self.materials.oilmetal = {}
	self.materials.oilmetal.name_id = "bm_mtl_oilmetal"
	self.materials.oilmetal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.oilmetal.texture = "units/pd2_dlc_dec5/matcaps/matcap_oilmetal_df"
	self.materials.oilmetal.value = 5
	self.materials.oilmetal.dlc = "gage_pack"
	self.materials.oilmetal.color = Color("7a7b85")
	self.materials.gunmetal = {}
	self.materials.gunmetal.name_id = "bm_mtl_gunmetal"
	self.materials.gunmetal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.gunmetal.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_gunmetal_df"
	self.materials.gunmetal.value = 5
	self.materials.gunmetal.dlc = "gage_pack_lmg"
	self.materials.gunmetal.color = Color("80807e")
	self.materials.mud = {}
	self.materials.mud.name_id = "bm_mtl_mud"
	self.materials.mud.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.mud.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_mud_df"
	self.materials.mud.material_amount = 0
	self.materials.mud.value = 5
	self.materials.mud.dlc = "gage_pack_lmg"
	self.materials.mud.color = Color("766345")
	self.materials.splinter = {}
	self.materials.splinter.name_id = "bm_mtl_splinter"
	self.materials.splinter.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.splinter.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_splinter_df"
	self.materials.splinter.material_amount = 0
	self.materials.splinter.value = 5
	self.materials.splinter.dlc = "gage_pack_lmg"
	self.materials.splinter.color = Color("777978")
	self.materials.erdl = {}
	self.materials.erdl.name_id = "bm_mtl_erdl"
	self.materials.erdl.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.erdl.texture = "units/pd2_dlc_gage_lmg/matcaps/matcap_erdl_df"
	self.materials.erdl.material_amount = 0
	self.materials.erdl.value = 5
	self.materials.erdl.dlc = "gage_pack_lmg"
	self.materials.erdl.color = Color("5e5b48")
	self.materials.arizona = {}
	self.materials.arizona.name_id = "bm_mtl_arizona"
	self.materials.arizona.pcs = {}
	self.materials.arizona.texture = "units/pd2_dlc_infamy/matcaps/matcap_arizona_df"
	self.materials.arizona.value = 0
	self.materials.arizona.global_value = "infamy"
	self.materials.arizona.infamy_lock = "infamy_maskpack_destroyer"
	self.materials.arizona.color = Color("927765")
	self.materials.baby = {}
	self.materials.baby.name_id = "bm_mtl_baby"
	self.materials.baby.pcs = {}
	self.materials.baby.texture = "units/pd2_dlc_infamy/matcaps/matcap_baby_df"
	self.materials.baby.value = 0
	self.materials.baby.global_value = "infamy"
	self.materials.baby.infamy_lock = "infamy_maskpack_lurker"
	self.materials.baby.color = Color("5f68a7")
	self.materials.alien_slime = {}
	self.materials.alien_slime.name_id = "bm_mtl_alien_slime"
	self.materials.alien_slime.pcs = {}
	self.materials.alien_slime.texture = "units/pd2_dlc_infamy/matcaps/matcap_alien_slime_df"
	self.materials.alien_slime.value = 0
	self.materials.alien_slime.global_value = "infamy"
	self.materials.alien_slime.infamy_lock = "infamy_maskpack_ranger"
	self.materials.alien_slime.color = Color("4f6a81")
	self.materials.eye = {}
	self.materials.eye.name_id = "bm_mtl_eye"
	self.materials.eye.pcs = {}
	self.materials.eye.texture = "units/pd2_dlc_infamy/matcaps/matcap_eye_df"
	self.materials.eye.value = 0
	self.materials.eye.global_value = "infamy"
	self.materials.eye.infamy_lock = "infamy_maskpack_balaclava"
	self.materials.eye.color = Color("85958c")
	self.materials.hades = {}
	self.materials.hades.name_id = "bm_mtl_hades"
	self.materials.hades.pcs = {}
	self.materials.hades.texture = "units/pd2_dlc_infamy/matcaps/matcap_hades_df"
	self.materials.hades.value = 0
	self.materials.hades.global_value = "infamy"
	self.materials.hades.infamy_lock = "infamy_maskpack_pain"
	self.materials.hades.color = Color("c45a4c")
	self.materials.punk = {}
	self.materials.punk.name_id = "bm_mtl_punk"
	self.materials.punk.pcs = {}
	self.materials.punk.texture = "units/pd2_dlc_infamy/matcaps/matcap_punk_df"
	self.materials.punk.value = 0
	self.materials.punk.global_value = "infamy"
	self.materials.punk.infamy_lock = "infamy_maskpack_punk"
	self.materials.punk.color = Color("5a76b0")
	self.materials.haze = {}
	self.materials.haze.name_id = "bm_mtl_haze"
	self.materials.haze.pcs = {}
	self.materials.haze.texture = "units/pd2_dlc_infamy/matcaps/matcap_haze_df"
	self.materials.haze.value = 0
	self.materials.haze.global_value = "infamy"
	self.materials.haze.infamy_lock = "infamy_maskpack_daft"
	self.materials.haze.color = Color("446770")
	self.materials.plastic_hood = {}
	self.materials.plastic_hood.name_id = "bm_mtl_plastic_hood"
	self.materials.plastic_hood.pcs = {}
	self.materials.plastic_hood.texture = "units/pd2_dlc_infamy/matcaps/matcap_plastic_hood_df"
	self.materials.plastic_hood.value = 0
	self.materials.plastic_hood.global_value = "infamy"
	self.materials.plastic_hood.infamy_lock = "infamy_maskpack_hood"
	self.materials.plastic_hood.color = Color("343434")
	self.materials.copper = {}
	self.materials.copper.name_id = "bm_mtl_copper"
	self.materials.copper.pcs = {}
	self.materials.copper.texture = "units/pd2_dlc_infamy/matcaps/matcap_copper_df"
	self.materials.copper.material_amount = 0
	self.materials.copper.value = 0
	self.materials.copper.global_value = "infamy"
	self.materials.copper.infamy_lock = "infamy_enforcer"
	self.materials.copper.color = Color("b77646")
	self.materials.dark_leather = {}
	self.materials.dark_leather.name_id = "bm_mtl_dark_leather"
	self.materials.dark_leather.pcs = {}
	self.materials.dark_leather.texture = "units/pd2_dlc_infamy/matcaps/matcap_dark_leather_df"
	self.materials.dark_leather.material_amount = 0
	self.materials.dark_leather.value = 0
	self.materials.dark_leather.global_value = "infamy"
	self.materials.dark_leather.infamy_lock = "infamy_mastermind"
	self.materials.dark_leather.color = Color("1d1d1d")
	self.materials.sinister = {}
	self.materials.sinister.name_id = "bm_mtl_sinister"
	self.materials.sinister.pcs = {}
	self.materials.sinister.texture = "units/pd2_dlc_infamy/matcaps/matcap_sinister_df"
	self.materials.sinister.value = 0
	self.materials.sinister.global_value = "infamy"
	self.materials.sinister.infamy_lock = "infamy_ghost"
	self.materials.sinister.color = Color("966768")
	self.materials.electric = {}
	self.materials.electric.name_id = "bm_mtl_electric"
	self.materials.electric.pcs = {}
	self.materials.electric.texture = "units/pd2_dlc_infamy/matcaps/matcap_electric_df"
	self.materials.electric.value = 0
	self.materials.electric.global_value = "infamy"
	self.materials.electric.infamy_lock = "infamy_technician"
	self.materials.electric.color = Color("506e9b")
	self.materials.bugshell = {}
	self.materials.bugshell.name_id = "bm_mtl_bugshell"
	self.materials.bugshell.pcs = {}
	self.materials.bugshell.texture = "units/pd2_dlc_gage_snp/materials/matcap_bugshell_df"
	self.materials.bugshell.material_amount = 0
	self.materials.bugshell.value = 0
	self.materials.bugshell.dlc = "gage_pack_snp"
	self.materials.bugshell.color = Color("59b473")
	self.materials.carapace = {}
	self.materials.carapace.name_id = "bm_mtl_carapace"
	self.materials.carapace.pcs = {}
	self.materials.carapace.texture = "units/pd2_dlc_gage_snp/materials/matcap_carapace_df"
	self.materials.carapace.value = 0
	self.materials.carapace.dlc = "gage_pack_snp"
	self.materials.carapace.color = Color("683f39")
	self.materials.hardshell = {}
	self.materials.hardshell.name_id = "bm_mtl_hardshell"
	self.materials.hardshell.pcs = {}
	self.materials.hardshell.texture = "units/pd2_dlc_gage_snp/materials/matcap_hardshell_df"
	self.materials.hardshell.material_amount = 0
	self.materials.hardshell.value = 0
	self.materials.hardshell.dlc = "gage_pack_snp"
	self.materials.hardshell.color = Color("967f82")
	self.materials.insectoid = {}
	self.materials.insectoid.name_id = "bm_mtl_insectoid"
	self.materials.insectoid.pcs = {}
	self.materials.insectoid.texture = "units/pd2_dlc_gage_snp/materials/matcap_insectoid_df"
	self.materials.insectoid.value = 0
	self.materials.insectoid.dlc = "gage_pack_snp"
	self.materials.insectoid.color = Color("817360")
	self.materials.blackmetal = {}
	self.materials.blackmetal.name_id = "bm_mtl_blackmetal"
	self.materials.blackmetal.pcs = {}
	self.materials.blackmetal.texture = "units/pd2_poetry_winners/materials/matcap_blackmetal_df"
	self.materials.blackmetal.material_amount = 0
	self.materials.blackmetal.value = 0
	self.materials.blackmetal.dlc = "poetry_soundtrack"
	self.materials.blackmetal.global_value = "poetry_soundtrack"
	self.materials.blackmetal.color = Color("535c5f")
	self.materials.carbongrid = {}
	self.materials.carbongrid.name_id = "bm_mtl_carbongrid"
	self.materials.carbongrid.pcs = {}
	self.materials.carbongrid.texture = "units/pd2_poetry_winners/materials/matcap_carbongrid_df"
	self.materials.carbongrid.material_amount = 0
	self.materials.carbongrid.value = 0
	self.materials.carbongrid.dlc = "poetry_soundtrack"
	self.materials.carbongrid.global_value = "poetry_soundtrack"
	self.materials.carbongrid.color = Color("929292")
	self.materials.cosmoline = {}
	self.materials.cosmoline.name_id = "bm_mtl_cosmoline"
	self.materials.cosmoline.pcs = {}
	self.materials.cosmoline.texture = "units/pd2_poetry_winners/materials/matcap_cosmoline_df"
	self.materials.cosmoline.value = 0
	self.materials.cosmoline.dlc = "poetry_soundtrack"
	self.materials.cosmoline.global_value = "poetry_soundtrack"
	self.materials.cosmoline.color = Color("55482c")
	self.materials.electronic = {}
	self.materials.electronic.name_id = "bm_mtl_electronic"
	self.materials.electronic.pcs = {}
	self.materials.electronic.texture = "units/pd2_poetry_winners/materials/matcap_electronic_df"
	self.materials.electronic.material_amount = 0
	self.materials.electronic.value = 0
	self.materials.electronic.dlc = "poetry_soundtrack"
	self.materials.electronic.global_value = "poetry_soundtrack"
	self.materials.electronic.color = Color("749280")
	self.materials.gemstone = {}
	self.materials.gemstone.name_id = "bm_mtl_gemstone"
	self.materials.gemstone.pcs = {}
	self.materials.gemstone.texture = "units/pd2_dlc_big/matcaps/matcap_gemstone_df"
	self.materials.gemstone.value = 0
	self.materials.gemstone.dlc = "big_bank"
	self.materials.gemstone.color = Color("a7474b")
	self.materials.old = {}
	self.materials.old.name_id = "bm_mtl_old"
	self.materials.old.pcs = {}
	self.materials.old.texture = "units/pd2_dlc_big/matcaps/matcap_old_df"
	self.materials.old.value = 0
	self.materials.old.dlc = "big_bank"
	self.materials.old.color = Color("615855")
	self.materials.clay = {}
	self.materials.clay.name_id = "bm_mtl_clay"
	self.materials.clay.pcs = {}
	self.materials.clay.texture = "units/pd2_dlc_big/matcaps/matcap_clay_df"
	self.materials.clay.material_amount = 0
	self.materials.clay.value = 0
	self.materials.clay.dlc = "big_bank"
	self.materials.clay.color = Color("bb6c45")
	self.materials.parchment = {}
	self.materials.parchment.name_id = "bm_mtl_parchment"
	self.materials.parchment.pcs = {}
	self.materials.parchment.texture = "units/pd2_dlc_big/matcaps/matcap_parchment_df"
	self.materials.parchment.material_amount = 0
	self.materials.parchment.value = 0
	self.materials.parchment.dlc = "big_bank"
	self.materials.parchment.color = Color("b5a897")
	self.materials.sparks = {}
	self.materials.sparks.name_id = "bm_mtl_sparks"
	self.materials.sparks.pcs = {}
	self.materials.sparks.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_sparks_df"
	self.materials.sparks.value = 0
	self.materials.sparks.dlc = "gage_pack_shotgun"
	self.materials.sparks.color = Color("8a7265")
	self.materials.explosive = {}
	self.materials.explosive.name_id = "bm_mtl_explosive"
	self.materials.explosive.pcs = {}
	self.materials.explosive.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_explosive_df"
	self.materials.explosive.value = 0
	self.materials.explosive.dlc = "gage_pack_shotgun"
	self.materials.explosive.color = Color("ba4528")
	self.materials.bananapeel = {}
	self.materials.bananapeel.name_id = "bm_mtl_bananapeel"
	self.materials.bananapeel.pcs = {}
	self.materials.bananapeel.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_bananapeel_df"
	self.materials.bananapeel.material_amount = 0
	self.materials.bananapeel.value = 0
	self.materials.bananapeel.dlc = "gage_pack_shotgun"
	self.materials.bananapeel.color = Color("bd9128")
	self.materials.leaf = {}
	self.materials.leaf.name_id = "bm_mtl_leaf"
	self.materials.leaf.pcs = {}
	self.materials.leaf.texture = "units/pd2_dlc_gage_shot/matcaps/matcap_leaf_df"
	self.materials.leaf.material_amount = 0
	self.materials.leaf.value = 0
	self.materials.leaf.dlc = "gage_pack_shotgun"
	self.materials.leaf.color = Color("4d7a01")
	self.materials.bone = {}
	self.materials.bone.name_id = "bm_mtl_bone"
	self.materials.bone.pcs = {}
	self.materials.bone.texture = "units/pd2_dlc_gage_assault/materials/matcap_bone_df"
	self.materials.bone.material_amount = 0
	self.materials.bone.value = 0
	self.materials.bone.dlc = "gage_pack_assault"
	self.materials.bone.color = Color("d9caad")
	self.materials.frost = {}
	self.materials.frost.name_id = "bm_mtl_frost"
	self.materials.frost.pcs = {}
	self.materials.frost.texture = "units/pd2_dlc_gage_assault/materials/matcap_frost_df"
	self.materials.frost.material_amount = 0
	self.materials.frost.value = 0
	self.materials.frost.dlc = "gage_pack_assault"
	self.materials.frost.color = Color("81a4b8")
	self.materials.evil = {}
	self.materials.evil.name_id = "bm_mtl_evil"
	self.materials.evil.pcs = {}
	self.materials.evil.texture = "units/pd2_dlc_gage_assault/materials/matcap_evil_df"
	self.materials.evil.value = 0
	self.materials.evil.dlc = "gage_pack_assault"
	self.materials.evil.color = Color("995c53")
	self.materials.void = {}
	self.materials.void.name_id = "bm_mtl_void"
	self.materials.void.pcs = {}
	self.materials.void.texture = "units/pd2_dlc_gage_assault/materials/matcap_void_df"
	self.materials.void.value = 0
	self.materials.void.dlc = "gage_pack_assault"
	self.materials.void.color = Color("4f60b2")
	self.materials.sunset = {}
	self.materials.sunset.name_id = "bm_mtl_sunset"
	self.materials.sunset.pcs = {}
	self.materials.sunset.texture = "units/pd2_dlc_miami/matcaps/matcap_sunset_df"
	self.materials.sunset.value = 0
	self.materials.sunset.dlc = "hl_miami"
	self.materials.sunset.color = Color("d1909c")
	self.materials.chromescape = {}
	self.materials.chromescape.name_id = "bm_mtl_chromescape"
	self.materials.chromescape.pcs = {}
	self.materials.chromescape.texture = "units/pd2_dlc_miami/matcaps/matcap_chromescape_df"
	self.materials.chromescape.value = 0
	self.materials.chromescape.dlc = "hl_miami"
	self.materials.chromescape.color = Color("858a92")
	self.materials.rubber = {}
	self.materials.rubber.name_id = "bm_mtl_rubber"
	self.materials.rubber.pcs = {}
	self.materials.rubber.texture = "units/pd2_dlc_miami/matcaps/matcap_rubber_df"
	self.materials.rubber.value = 0
	self.materials.rubber.dlc = "hl_miami"
	self.materials.rubber.color = Color("7f7c76")
	self.materials.error = {}
	self.materials.error.name_id = "bm_mtl_error"
	self.materials.error.pcs = {}
	self.materials.error.texture = "units/pd2_dlc_miami/matcaps/matcap_error_df"
	self.materials.error.material_amount = 0
	self.materials.error.value = 0
	self.materials.error.dlc = "hl_miami"
	self.materials.error.color = Color("8984a0")
	self.materials.rug = {}
	self.materials.rug.name_id = "bm_mtl_rug"
	self.materials.rug.pcs = {}
	self.materials.rug.texture = "units/pd2_dlc_miami/matcaps/matcap_rug_df"
	self.materials.rug.material_amount = 0
	self.materials.rug.value = 0
	self.materials.rug.dlc = "hlm_game"
	self.materials.rug.color = Color("babbb6")
	self.materials.cushion = {}
	self.materials.cushion.name_id = "bm_mtl_cushion"
	self.materials.cushion.pcs = {}
	self.materials.cushion.texture = "units/pd2_dlc_miami/matcaps/matcap_cushion_df"
	self.materials.cushion.material_amount = 0
	self.materials.cushion.value = 0
	self.materials.cushion.dlc = "hlm_game"
	self.materials.cushion.color = Color("ba7f76")
	self.materials.hatred = {}
	self.materials.hatred.name_id = "bm_mtl_hatred"
	self.materials.hatred.pcs = {}
	self.materials.hatred.texture = "units/pd2_dlc_miami/matcaps/matcap_hatred_df"
	self.materials.hatred.value = 0
	self.materials.hatred.dlc = "hlm_game"
	self.materials.hatred.color = Color("b15d47")
	self.materials.neon = {}
	self.materials.neon.name_id = "bm_mtl_neon"
	self.materials.neon.pcs = {}
	self.materials.neon.texture = "units/pd2_dlc_miami/matcaps/matcap_neon_df"
	self.materials.neon.value = 0
	self.materials.neon.dlc = "hlm_game"
	self.materials.neon.color = Color("b7a4d5")
	self.materials.armygreen = {}
	self.materials.armygreen.name_id = "bm_mtl_armygreen"
	self.materials.armygreen.pcs = {}
	self.materials.armygreen.texture = "units/pd2_dlc_gage_historical/materials/matcap_armygreen_df"
	self.materials.armygreen.material_amount = 0
	self.materials.armygreen.value = 0
	self.materials.armygreen.dlc = "gage_pack_historical"
	self.materials.armygreen.color = Color("6e693c")
	self.materials.gunsmoke = {}
	self.materials.gunsmoke.name_id = "bm_mtl_gunsmoke"
	self.materials.gunsmoke.pcs = {}
	self.materials.gunsmoke.texture = "units/pd2_dlc_gage_historical/materials/matcap_gunsmoke_df"
	self.materials.gunsmoke.value = 0
	self.materials.gunsmoke.dlc = "gage_pack_historical"
	self.materials.gunsmoke.color = Color("505c5c")
	self.materials.patriot = {}
	self.materials.patriot.name_id = "bm_mtl_patriot"
	self.materials.patriot.pcs = {}
	self.materials.patriot.texture = "units/pd2_dlc_gage_historical/materials/matcap_patriot_df"
	self.materials.patriot.material_amount = 0
	self.materials.patriot.value = 0
	self.materials.patriot.dlc = "gage_pack_historical"
	self.materials.patriot.color = Color("bb6666")
	self.materials.redsun = {}
	self.materials.redsun.name_id = "bm_mtl_redsun"
	self.materials.redsun.pcs = {}
	self.materials.redsun.texture = "units/pd2_dlc_gage_historical/materials/matcap_redsun_df"
	self.materials.redsun.value = 0
	self.materials.redsun.dlc = "gage_pack_historical"
	self.materials.redsun.color = Color("7f7c76")
	self.materials.diamond = {}
	self.materials.diamond.name_id = "bm_mtl_diamond"
	self.materials.diamond.pcs = {}
	self.materials.diamond.texture = "units/pd2_indiana/materials/matcap_diamond_df"
	self.materials.diamond.value = 0
	self.materials.diamond.dlc = "hope_diamond"
	self.materials.diamond.color = Color("7d8cac")
	self.materials.bandages = {}
	self.materials.bandages.name_id = "bm_mtl_bandages"
	self.materials.bandages.pcs = {}
	self.materials.bandages.texture = "units/pd2_indiana/materials/matcap_bandages_df"
	self.materials.bandages.material_amount = 0
	self.materials.bandages.value = 0
	self.materials.bandages.dlc = "hope_diamond"
	self.materials.bandages.color = Color("c5b48a")
	self.materials.rust = {}
	self.materials.rust.name_id = "bm_mtl_dark_rust"
	self.materials.rust.pcs = {}
	self.materials.rust.texture = "units/pd2_indiana/materials/matcap_rust_df"
	self.materials.rust.material_amount = 0
	self.materials.rust.value = 0
	self.materials.rust.dlc = "hope_diamond"
	self.materials.rust.color = Color("ae654e")
	self.materials.sand = {}
	self.materials.sand.name_id = "bm_mtl_dark_sand"
	self.materials.sand.pcs = {}
	self.materials.sand.texture = "units/pd2_indiana/materials/matcap_sand_df"
	self.materials.sand.material_amount = 0
	self.materials.sand.value = 0
	self.materials.sand.dlc = "hope_diamond"
	self.materials.sand.color = Color("bfa067")
	self.materials.meat = {}
	self.materials.meat.name_id = "bm_mtl_meat"
	self.materials.meat.pcs = {}
	self.materials.meat.texture = "units/pd2_dlc_cro/matcaps/matcaps_meat_df"
	self.materials.meat.material_amount = 0
	self.materials.meat.value = 0
	self.materials.meat.dlc = "the_bomb"
	self.materials.meat.texture_bundle_folder = "the_bomb"
	self.materials.meat.color = Color("cf564c")
	self.materials.plywood = {}
	self.materials.plywood.name_id = "bm_mtl_plywood"
	self.materials.plywood.pcs = {}
	self.materials.plywood.texture = "units/pd2_dlc_cro/matcaps/matcaps_plywood_df"
	self.materials.plywood.material_amount = 0
	self.materials.plywood.value = 0
	self.materials.plywood.dlc = "the_bomb"
	self.materials.plywood.texture_bundle_folder = "the_bomb"
	self.materials.plywood.color = Color("987554")
	self.materials.rhino_skin = {}
	self.materials.rhino_skin.name_id = "bm_mtl_rhino"
	self.materials.rhino_skin.pcs = {}
	self.materials.rhino_skin.texture = "units/pd2_dlc_cro/matcaps/matcaps_rhino_df"
	self.materials.rhino_skin.material_amount = 0
	self.materials.rhino_skin.value = 0
	self.materials.rhino_skin.dlc = "the_bomb"
	self.materials.rhino_skin.texture_bundle_folder = "the_bomb"
	self.materials.rhino_skin.color = Color("8c7962")
	self.materials.rock_marble = {}
	self.materials.rock_marble.name_id = "bm_mtl_rock_marble"
	self.materials.rock_marble.pcs = {}
	self.materials.rock_marble.texture = "units/pd2_dlc_cro/matcaps/matcaps_rock_marble_df"
	self.materials.rock_marble.material_amount = 0
	self.materials.rock_marble.value = 0
	self.materials.rock_marble.dlc = "the_bomb"
	self.materials.rock_marble.texture_bundle_folder = "the_bomb"
	self.materials.rock_marble.color = Color("626c60")
	self.materials.dawn = {}
	self.materials.dawn.name_id = "bm_mtl_dawn"
	self.materials.dawn.pcs = {}
	self.materials.dawn.texture = "units/pd2_dlc_akm4_modpack/materials/matcap_dawn_df"
	self.materials.dawn.value = 0
	self.materials.dawn.dlc = "akm4_pack"
	self.materials.dawn.texture_bundle_folder = "dlc_akm4"
	self.materials.dawn.color = Color("908283")
	self.materials.prehistoric = {}
	self.materials.prehistoric.name_id = "bm_mtl_prehistoric"
	self.materials.prehistoric.pcs = {}
	self.materials.prehistoric.texture = "units/pd2_dlc_akm4_modpack/materials/matcap_prehistoric_df"
	self.materials.prehistoric.value = 0
	self.materials.prehistoric.dlc = "akm4_pack"
	self.materials.prehistoric.texture_bundle_folder = "dlc_akm4"
	self.materials.prehistoric.color = Color("6b5635")
	self.materials.fossil = {}
	self.materials.fossil.name_id = "bm_mtl_fossil"
	self.materials.fossil.pcs = {}
	self.materials.fossil.texture = "units/pd2_dlc_akm4_modpack/materials/matcap_fossil_df"
	self.materials.fossil.material_amount = 0
	self.materials.fossil.value = 0
	self.materials.fossil.dlc = "akm4_pack"
	self.materials.fossil.texture_bundle_folder = "dlc_akm4"
	self.materials.fossil.color = Color("b2a48a")
	self.materials.feathers = {}
	self.materials.feathers.name_id = "bm_mtl_feathers"
	self.materials.feathers.pcs = {}
	self.materials.feathers.texture = "units/pd2_dlc_akm4_modpack/materials/matcap_feathers_df"
	self.materials.feathers.material_amount = 0
	self.materials.feathers.value = 0
	self.materials.feathers.dlc = "akm4_pack"
	self.materials.feathers.texture_bundle_folder = "dlc_akm4"
	self.materials.feathers.color = Color("817a6f")
	self.materials.candlelight = {}
	self.materials.candlelight.name_id = "bm_mtl_candlelight"
	self.materials.candlelight.pcs = {}
	self.materials.candlelight.texture = "units/pd2_dlc_bbq/materials/matcap_candlelight_df"
	self.materials.candlelight.value = 0
	self.materials.candlelight.dlc = "bbq"
	self.materials.candlelight.texture_bundle_folder = "bbq"
	self.materials.candlelight.color = Color("d4b5a6")
	self.materials.burn = {}
	self.materials.burn.name_id = "bm_mtl_burn"
	self.materials.burn.pcs = {}
	self.materials.burn.texture = "units/pd2_dlc_bbq/materials/matcap_burn_df"
	self.materials.burn.value = 0
	self.materials.burn.dlc = "bbq"
	self.materials.burn.texture_bundle_folder = "bbq"
	self.materials.burn.color = Color("a02e11")
	self.materials.toast = {}
	self.materials.toast.name_id = "bm_mtl_toast"
	self.materials.toast.pcs = {}
	self.materials.toast.texture = "units/pd2_dlc_bbq/materials/matcap_toast_df"
	self.materials.toast.value = 0
	self.materials.toast.material_amount = 0
	self.materials.toast.dlc = "bbq"
	self.materials.toast.texture_bundle_folder = "bbq"
	self.materials.toast.color = Color("6c3310")
	self.materials.coal = {}
	self.materials.coal.name_id = "bm_mtl_coal"
	self.materials.coal.pcs = {}
	self.materials.coal.texture = "units/pd2_dlc_bbq/materials/matcap_coal_df"
	self.materials.coal.value = 0
	self.materials.coal.material_amount = 0
	self.materials.coal.dlc = "bbq"
	self.materials.coal.texture_bundle_folder = "bbq"
	self.materials.coal.color = Color("4f2c20")
	self.materials.goldfever = {}
	self.materials.goldfever.name_id = "bm_mtl_goldfever"
	self.materials.goldfever.pcs = {}
	self.materials.goldfever.texture = "units/pd2_dlc_west/masks/materials/matcap_goldfever_df"
	self.materials.goldfever.dlc = "west"
	self.materials.goldfever.value = 0
	self.materials.goldfever.color = Color("4f4038")
	self.materials.westernsunset = {}
	self.materials.westernsunset.name_id = "bm_mtl_westernsunset"
	self.materials.westernsunset.pcs = {}
	self.materials.westernsunset.texture = "units/pd2_dlc_west/masks/materials/matcap_westernsunset_df"
	self.materials.westernsunset.dlc = "west"
	self.materials.westernsunset.value = 0
	self.materials.westernsunset.color = Color("a77163")
	self.materials.scorpion = {}
	self.materials.scorpion.name_id = "bm_mtl_scorpion"
	self.materials.scorpion.pcs = {}
	self.materials.scorpion.texture = "units/pd2_dlc_west/masks/materials/matcap_scorpion_df"
	self.materials.scorpion.dlc = "west"
	self.materials.scorpion.material_amount = 0
	self.materials.scorpion.value = 0
	self.materials.scorpion.color = Color("77726d")
	self.materials.cactus = {}
	self.materials.cactus.name_id = "bm_mtl_cactus"
	self.materials.cactus.pcs = {}
	self.materials.cactus.texture = "units/pd2_dlc_west/masks/materials/matcap_cactus_df"
	self.materials.cactus.dlc = "west"
	self.materials.cactus.material_amount = 0
	self.materials.cactus.value = 0
	self.materials.cactus.color = Color("898d61")
	self.materials.stained_glass = {}
	self.materials.stained_glass.name_id = "bm_mtl_stained_glass"
	self.materials.stained_glass.pcs = {}
	self.materials.stained_glass.texture = "units/pd2_dlc_arena/masks/materials/matcap_stained_glass_df"
	self.materials.stained_glass.dlc = "arena"
	self.materials.stained_glass.material_amount = 0
	self.materials.stained_glass.value = 0
	self.materials.stained_glass.color = Color("b39d50")
	self.materials.bionic = {}
	self.materials.bionic.name_id = "bm_mtl_bionic"
	self.materials.bionic.pcs = {}
	self.materials.bionic.texture = "units/pd2_dlc_arena/masks/materials/matcap_bionic_df"
	self.materials.bionic.dlc = "arena"
	self.materials.bionic.material_amount = 0
	self.materials.bionic.value = 0
	self.materials.bionic.color = Color("76beca")
	self.materials.enlightment = {}
	self.materials.enlightment.name_id = "bm_mtl_enlightment"
	self.materials.enlightment.pcs = {}
	self.materials.enlightment.texture = "units/pd2_dlc_arena/masks/materials/matcap_enlightment_df"
	self.materials.enlightment.dlc = "arena"
	self.materials.enlightment.value = 0
	self.materials.enlightment.color = Color("4e4e9f")
	self.materials.dimblue = {}
	self.materials.dimblue.name_id = "bm_mtl_dimblue"
	self.materials.dimblue.pcs = {}
	self.materials.dimblue.texture = "units/pd2_dlc_arena/masks/materials/matcap_dimblue_df"
	self.materials.dimblue.dlc = "arena"
	self.materials.dimblue.value = 0
	self.materials.dimblue.color = Color("3c586a")
	self.materials.carpet = {}
	self.materials.carpet.name_id = "bm_mtl_carpet"
	self.materials.carpet.pcs = {}
	self.materials.carpet.texture = "units/pd2_dlc_casino/matcaps/matcap_carpet_df"
	self.materials.carpet.material_amount = 0
	self.materials.carpet.value = 0
	self.materials.carpet.dlc = "kenaz"
	self.materials.carpet.texture_bundle_folder = "kenaz"
	self.materials.carpet.color = Color("417242")
	self.materials.casino = {}
	self.materials.casino.name_id = "bm_mtl_casino"
	self.materials.casino.pcs = {}
	self.materials.casino.texture = "units/pd2_dlc_casino/matcaps/matcap_casino_df"
	self.materials.casino.value = 0
	self.materials.casino.dlc = "kenaz"
	self.materials.casino.texture_bundle_folder = "kenaz"
	self.materials.casino.color = Color("ca7362")
	self.materials.plush = {}
	self.materials.plush.name_id = "bm_mtl_plush"
	self.materials.plush.pcs = {}
	self.materials.plush.texture = "units/pd2_dlc_casino/matcaps/matcap_plush_df"
	self.materials.plush.material_amount = 0
	self.materials.plush.value = 0
	self.materials.plush.dlc = "kenaz"
	self.materials.plush.texture_bundle_folder = "kenaz"
	self.materials.plush.color = Color("df5e5e")
	self.materials.stars = {}
	self.materials.stars.name_id = "bm_mtl_stars"
	self.materials.stars.pcs = {}
	self.materials.stars.texture = "units/pd2_dlc_casino/matcaps/matcap_stars_df"
	self.materials.stars.value = 0
	self.materials.stars.dlc = "kenaz"
	self.materials.stars.texture_bundle_folder = "kenaz"
	self.materials.stars.color = Color("968b74")
	self.materials.still_waters = {}
	self.materials.still_waters.name_id = "bm_mtl_still_waters"
	self.materials.still_waters.pcs = {}
	self.materials.still_waters.texture = "units/pd2_dlc_turtles/masks/materials/matcap_still_waters_df"
	self.materials.still_waters.value = 0
	self.materials.still_waters.dlc = "turtles"
	self.materials.still_waters.color = Color("7d8890")
	self.materials.sakura = {}
	self.materials.sakura.name_id = "bm_mtl_sakura"
	self.materials.sakura.pcs = {}
	self.materials.sakura.texture = "units/pd2_dlc_turtles/masks/materials/matcap_sakura_df"
	self.materials.sakura.value = 0
	self.materials.sakura.dlc = "turtles"
	self.materials.sakura.color = Color("7d8890")
	self.materials.bamboo = {}
	self.materials.bamboo.name_id = "bm_mtl_bamboo"
	self.materials.bamboo.pcs = {}
	self.materials.bamboo.texture = "units/pd2_dlc_turtles/masks/materials/matcap_bamboo_df"
	self.materials.bamboo.material_amount = 0
	self.materials.bamboo.value = 0
	self.materials.bamboo.dlc = "turtles"
	self.materials.bamboo.color = Color("4c6a2e")
	self.materials.origami = {}
	self.materials.origami.name_id = "bm_mtl_origami"
	self.materials.origami.pcs = {}
	self.materials.origami.texture = "units/pd2_dlc_turtles/masks/materials/matcap_origami_df"
	self.materials.origami.material_amount = 0
	self.materials.origami.value = 0
	self.materials.origami.dlc = "turtles"
	self.materials.origami.color = Color("87708f")
	self.materials.forged = {}
	self.materials.forged.name_id = "bm_mtl_forged"
	self.materials.forged.pcs = {}
	self.materials.forged.texture = "units/pd2_dlc_steel/masks/materials/matcap_forged_df"
	self.materials.forged.value = 0
	self.materials.forged.dlc = "steel"
	self.materials.forged.color = Color("8a827b")
	self.materials.blooded = {}
	self.materials.blooded.name_id = "bm_mtl_blooded"
	self.materials.blooded.pcs = {}
	self.materials.blooded.texture = "units/pd2_dlc_steel/masks/materials/matcap_blooded_df"
	self.materials.blooded.value = 0
	self.materials.blooded.dlc = "steel"
	self.materials.blooded.color = Color("89474c")
	self.materials.chain_armor = {}
	self.materials.chain_armor.name_id = "bm_mtl_chain_armor"
	self.materials.chain_armor.pcs = {}
	self.materials.chain_armor.texture = "units/pd2_dlc_steel/masks/materials/matcap_chain_armor_df"
	self.materials.chain_armor.material_amount = 0
	self.materials.chain_armor.value = 0
	self.materials.chain_armor.dlc = "steel"
	self.materials.chain_armor.color = Color("909ba6")
	self.materials.scale_armor = {}
	self.materials.scale_armor.name_id = "bm_mtl_scale_armor"
	self.materials.scale_armor.pcs = {}
	self.materials.scale_armor.texture = "units/pd2_dlc_steel/masks/materials/matcap_scale_armor_df"
	self.materials.scale_armor.material_amount = 0
	self.materials.scale_armor.value = 0
	self.materials.scale_armor.dlc = "steel"
	self.materials.scale_armor.color = Color("a7aeb3")
	self.materials.flow = {}
	self.materials.flow.name_id = "bm_mtl_flow"
	self.materials.flow.pcs = {}
	self.materials.flow.texture = "units/pd2_dlc_jerry/masks/materials/matcap_flow_df"
	self.materials.flow.dlc = "berry"
	self.materials.flow.material_amount = 0
	self.materials.flow.value = 0
	self.materials.flow.color = Color("a89774")
	self.materials.sancti = {}
	self.materials.sancti.name_id = "bm_mtl_sancti"
	self.materials.sancti.pcs = {}
	self.materials.sancti.texture = "units/pd2_dlc_jerry/masks/materials/matcap_sancti_df"
	self.materials.sancti.dlc = "berry"
	self.materials.sancti.value = 0
	self.materials.sancti.color = Color("909292")
	self.materials.glade = {}
	self.materials.glade.name_id = "bm_mtl_glade"
	self.materials.glade.pcs = {}
	self.materials.glade.texture = "units/pd2_dlc_jerry/masks/materials/matcap_glade_df"
	self.materials.glade.dlc = "berry"
	self.materials.glade.value = 0
	self.materials.glade.color = Color("a1814e")
	self.materials.wade = {}
	self.materials.wade.name_id = "bm_mtl_wade"
	self.materials.wade.pcs = {}
	self.materials.wade.texture = "units/pd2_dlc_jerry/masks/materials/matcap_wade_df"
	self.materials.wade.dlc = "berry"
	self.materials.wade.value = 0
	self.materials.wade.color = Color("5eacb5")
	self.materials.goateye = {}
	self.materials.goateye.name_id = "bm_mtl_goateye"
	self.materials.goateye.pcs = {}
	self.materials.goateye.texture = "units/pd2_dlc_peta/masks/materials/matcap_goateye_df"
	self.materials.goateye.value = 0
	self.materials.goateye.dlc = "peta"
	self.materials.goateye.color = Color("bd874c")
	self.materials.flamingoeye = {}
	self.materials.flamingoeye.name_id = "bm_mtl_flamingoeye"
	self.materials.flamingoeye.pcs = {}
	self.materials.flamingoeye.texture = "units/pd2_dlc_peta/masks/materials/matcap_flamingoeye_df"
	self.materials.flamingoeye.value = 0
	self.materials.flamingoeye.dlc = "peta"
	self.materials.flamingoeye.color = Color("aea0c1")
	self.materials.hay = {}
	self.materials.hay.name_id = "bm_mtl_hay"
	self.materials.hay.pcs = {}
	self.materials.hay.texture = "units/pd2_dlc_peta/masks/materials/matcap_hay_df"
	self.materials.hay.material_amount = 0
	self.materials.hay.value = 0
	self.materials.hay.dlc = "peta"
	self.materials.hay.color = Color("e8c370")
	self.materials.tongue = {}
	self.materials.tongue.name_id = "bm_mtl_tongue"
	self.materials.tongue.pcs = {}
	self.materials.tongue.texture = "units/pd2_dlc_peta/masks/materials/matcap_tongue_df"
	self.materials.tongue.material_amount = 0
	self.materials.tongue.value = 0
	self.materials.tongue.dlc = "peta"
	self.materials.tongue.color = Color("b07776")
	self.materials.day = {}
	self.materials.day.name_id = "bm_mtl_days"
	self.materials.day.pcs = {}
	self.materials.day.texture = "units/pd2_dlc_lupus/materials/matcap_days_df"
	self.materials.day.material_amount = 0
	self.materials.day.value = 0
	self.materials.day.dlc = "pal"
	self.materials.day.color = Color("a9aca0")
	self.materials.houndstooth = {}
	self.materials.houndstooth.name_id = "bm_mtl_houndstooth"
	self.materials.houndstooth.pcs = {}
	self.materials.houndstooth.texture = "units/pd2_dlc_lupus/materials/matcap_houndstooth_df"
	self.materials.houndstooth.material_amount = 0
	self.materials.houndstooth.value = 0
	self.materials.houndstooth.dlc = "pal"
	self.materials.houndstooth.color = Color("ababab")
	self.materials.redwhite = {}
	self.materials.redwhite.name_id = "bm_mtl_matcap_redwhite_df"
	self.materials.redwhite.pcs = {}
	self.materials.redwhite.texture = "units/pd2_dlc_lupus/materials/matcap_redwhite_df"
	self.materials.redwhite.value = 0
	self.materials.redwhite.dlc = "pal"
	self.materials.redwhite.color = Color("603a3c")
	self.materials.mushroom_cloud = {}
	self.materials.mushroom_cloud.name_id = "bm_mtl_matcap_mushroom_cloud_df"
	self.materials.mushroom_cloud.pcs = {}
	self.materials.mushroom_cloud.texture = "units/pd2_dlc_lupus/materials/matcap_mushroom_cloud_df"
	self.materials.mushroom_cloud.value = 0
	self.materials.mushroom_cloud.dlc = "pal"
	self.materials.mushroom_cloud.color = Color("8d9bb1")
	self.materials.nebula = {}
	self.materials.nebula.name_id = "bm_mtl_nebula"
	self.materials.nebula.pcs = {}
	self.materials.nebula.texture = "units/pd2_dlc_mad/masks/materials/matcap_nebula_df"
	self.materials.nebula.value = 0
	self.materials.nebula.color = Color("aea0c1")
	self.materials.planet = {}
	self.materials.planet.name_id = "bm_mtl_planet"
	self.materials.planet.pcs = {}
	self.materials.planet.texture = "units/pd2_dlc_mad/masks/materials/matcap_planet_df"
	self.materials.planet.value = 0
	self.materials.planet.color = Color("be9f87")
	self.materials.rusty = {}
	self.materials.rusty.name_id = "bm_mtl_rusty"
	self.materials.rusty.pcs = {}
	self.materials.rusty.texture = "units/pd2_dlc_mad/masks/materials/matcap_rusty_df"
	self.materials.rusty.material_amount = 0
	self.materials.rusty.value = 0
	self.materials.rusty.color = Color("a15d33")
	self.materials.spaceship = {}
	self.materials.spaceship.name_id = "bm_mtl_spaceship"
	self.materials.spaceship.pcs = {}
	self.materials.spaceship.texture = "units/pd2_dlc_mad/masks/materials/matcap_spaceship_df"
	self.materials.spaceship.material_amount = 0
	self.materials.spaceship.value = 0
	self.materials.spaceship.color = Color("3d3e3d")
	self.materials.chromey = {}
	self.materials.chromey.name_id = "bm_mtl_chromey"
	self.materials.chromey.pcs = {}
	self.materials.chromey.texture = "units/pd2_dlc_born/masks/materials/matcap_chrome_pastel_df"
	self.materials.chromey.value = 0
	self.materials.chromey.texture_bundle_folder = "born"
	self.materials.chromey.dlc = "born"
	self.materials.chromey.color = Color("87889b")
	self.materials.devil_eye = {}
	self.materials.devil_eye.name_id = "bm_mtl_devil_eye"
	self.materials.devil_eye.pcs = {}
	self.materials.devil_eye.texture = "units/pd2_dlc_born/masks/materials/matcap_devil_eye_df"
	self.materials.devil_eye.value = 0
	self.materials.devil_eye.texture_bundle_folder = "born"
	self.materials.devil_eye.dlc = "born"
	self.materials.devil_eye.color = Color("af7c71")
	self.materials.hotrod_red = {}
	self.materials.hotrod_red.name_id = "bm_mtl_hotrod_red"
	self.materials.hotrod_red.pcs = {}
	self.materials.hotrod_red.texture = "units/pd2_dlc_born/masks/materials/matcap_hotrod_red_df"
	self.materials.hotrod_red.value = 0
	self.materials.hotrod_red.texture_bundle_folder = "born"
	self.materials.hotrod_red.dlc = "born"
	self.materials.hotrod_red.color = Color("c67a7c")
	self.materials.shiny_and_chrome = {}
	self.materials.shiny_and_chrome.name_id = "bm_mtl_shiny_and_chrome"
	self.materials.shiny_and_chrome.pcs = {}
	self.materials.shiny_and_chrome.texture = "units/pd2_dlc_born/masks/materials/matcap_red_gold_df"
	self.materials.shiny_and_chrome.value = 0
	self.materials.shiny_and_chrome.texture_bundle_folder = "born"
	self.materials.shiny_and_chrome.dlc = "born"
	self.materials.shiny_and_chrome.color = Color("c29f4b")
	self.materials.club = {}
	self.materials.club.name_id = "bm_mtl_club"
	self.materials.club.pcs = {}
	self.materials.club.texture = "units/pd2_dlc_pim/masks/materials/matcap_club_df"
	self.materials.club.value = 0
	self.materials.club.dlc = "pim"
	self.materials.club.color = Color("795f9e")
	self.materials.mist = {}
	self.materials.mist.name_id = "bm_mtl_mist"
	self.materials.mist.pcs = {}
	self.materials.mist.texture = "units/pd2_dlc_pim/masks/materials/matcap_mist_df"
	self.materials.mist.value = 0
	self.materials.mist.dlc = "pim"
	self.materials.mist.color = Color("8a969a")
	self.materials.dog = {}
	self.materials.dog.material_amount = 0
	self.materials.dog.name_id = "bm_mtl_dog"
	self.materials.dog.pcs = {}
	self.materials.dog.texture = "units/pd2_dlc_pim/masks/materials/matcap_dog_df"
	self.materials.dog.value = 0
	self.materials.dog.dlc = "pim"
	self.materials.dog.color = Color("9d8260")
	self.materials.wheel = {}
	self.materials.wheel.material_amount = 0
	self.materials.wheel.name_id = "bm_mtl_wheel"
	self.materials.wheel.pcs = {}
	self.materials.wheel.texture = "units/pd2_dlc_pim/masks/materials/matcap_wheel_df"
	self.materials.wheel.value = 0
	self.materials.wheel.dlc = "pim"
	self.materials.wheel.color = Color("525156")
	self.materials.army_deep_green = {}
	self.materials.army_deep_green.name_id = "bm_mtl_army_deep_green"
	self.materials.army_deep_green.pcs = {}
	self.materials.army_deep_green.texture = "units/pd2_dlc_tng/masks/materials/matcap_army_deep_green_df"
	self.materials.army_deep_green.value = 0
	self.materials.army_deep_green.dlc = "tango"
	self.materials.army_deep_green.color = Color("374b36")
	self.materials.ranger_black = {}
	self.materials.ranger_black.name_id = "bm_mtl_ranger_black"
	self.materials.ranger_black.pcs = {}
	self.materials.ranger_black.texture = "units/pd2_dlc_tng/masks/materials/matcap_ranger_black_df"
	self.materials.ranger_black.value = 0
	self.materials.ranger_black.dlc = "tango"
	self.materials.ranger_black.color = Color("2b2d2d")
	self.materials.digital_camo = {}
	self.materials.digital_camo.name_id = "bm_mtl_digital_camo"
	self.materials.digital_camo.pcs = {}
	self.materials.digital_camo.texture = "units/pd2_dlc_tng/masks/materials/matcap_digital_camo_df"
	self.materials.digital_camo.value = 0
	self.materials.digital_camo.material_amount = 0
	self.materials.digital_camo.dlc = "tango"
	self.materials.digital_camo.color = Color("7e8288")
	self.materials.midnight_camo = {}
	self.materials.midnight_camo.name_id = "bm_mtl_midnight_camo"
	self.materials.midnight_camo.pcs = {}
	self.materials.midnight_camo.texture = "units/pd2_dlc_tng/masks/materials/matcap_midnight_camo_df"
	self.materials.midnight_camo.value = 0
	self.materials.midnight_camo.material_amount = 0
	self.materials.midnight_camo.dlc = "tango"
	self.materials.midnight_camo.color = Color("3b3c3c")
	self.materials.oxidized_copper = {}
	self.materials.oxidized_copper.name_id = "bm_mtl_oxidized_copper"
	self.materials.oxidized_copper.pcs = {}
	self.materials.oxidized_copper.texture = "units/pd2_dlc_friend/masks/materials/matcap_oxidized_copper_df"
	self.materials.oxidized_copper.value = 0
	self.materials.oxidized_copper.material_amount = 0
	self.materials.oxidized_copper.dlc = "friend"
	self.materials.oxidized_copper.color = Color("6a7155")
	self.materials.golden_hour = {}
	self.materials.golden_hour.name_id = "bm_mtl_golden_hour"
	self.materials.golden_hour.pcs = {}
	self.materials.golden_hour.texture = "units/pd2_dlc_friend/masks/materials/matcap_golden_hour_df"
	self.materials.golden_hour.value = 0
	self.materials.golden_hour.dlc = "friend"
	self.materials.golden_hour.color = Color("b48a38")
	self.materials.red_velvet = {}
	self.materials.red_velvet.name_id = "bm_mtl_red_velvet"
	self.materials.red_velvet.pcs = {}
	self.materials.red_velvet.texture = "units/pd2_dlc_friend/masks/materials/matcap_red_velvet_df"
	self.materials.red_velvet.value = 0
	self.materials.red_velvet.dlc = "friend"
	self.materials.red_velvet.color = Color("510602")
	self.materials.black_marble = {}
	self.materials.black_marble.name_id = "bm_mtl_black_marble"
	self.materials.black_marble.pcs = {}
	self.materials.black_marble.texture = "units/pd2_dlc_friend/masks/materials/matcap_black_marble_df"
	self.materials.black_marble.value = 0
	self.materials.black_marble.material_amount = 0
	self.materials.black_marble.dlc = "friend"
	self.materials.black_marble.color = Color("2c2c2c")
	self.materials.carbon_fiber_weave = {}
	self.materials.carbon_fiber_weave.name_id = "bm_mtl_carbon_fiber_weave"
	self.materials.carbon_fiber_weave.pcs = {}
	self.materials.carbon_fiber_weave.texture = "units/pd2_dlc_spa/masks/materials/matcap_carbon_fiber_weave_df"
	self.materials.carbon_fiber_weave.value = 0
	self.materials.carbon_fiber_weave.material_amount = 0
	self.materials.carbon_fiber_weave.dlc = "spa"
	self.materials.carbon_fiber_weave.color = Color("1a1a1a")
	self.materials.black_suede = {}
	self.materials.black_suede.name_id = "bm_mtl_black_suede"
	self.materials.black_suede.pcs = {}
	self.materials.black_suede.texture = "units/pd2_dlc_spa/masks/materials/matcap_black_suede_df"
	self.materials.black_suede.value = 0
	self.materials.black_suede.material_amount = 0
	self.materials.black_suede.dlc = "spa"
	self.materials.black_suede.color = Color("2e2e2e")
	self.materials.neon_blue = {}
	self.materials.neon_blue.name_id = "bm_mtl_neon_blue"
	self.materials.neon_blue.pcs = {}
	self.materials.neon_blue.texture = "units/pd2_dlc_spa/masks/materials/matcap_neon_blue_df"
	self.materials.neon_blue.value = 0
	self.materials.neon_blue.dlc = "spa"
	self.materials.neon_blue.color = Color("165c8d")
	self.materials.underground_neon = {}
	self.materials.underground_neon.name_id = "bm_mtl_underground_neon"
	self.materials.underground_neon.pcs = {}
	self.materials.underground_neon.texture = "units/pd2_dlc_spa/masks/materials/matcap_underground_neon_df"
	self.materials.underground_neon.value = 0
	self.materials.underground_neon.dlc = "spa"
	self.materials.underground_neon.color = Color("a63a2d")
	self.materials.russian_camouflage = {}
	self.materials.russian_camouflage.name_id = "bm_mtl_russian_camouflage"
	self.materials.russian_camouflage.pcs = {}
	self.materials.russian_camouflage.texture = "units/pd2_dlc_grv/masks/materials/matcap_russian_camouflage_df"
	self.materials.russian_camouflage.value = 0
	self.materials.russian_camouflage.material_amount = 0
	self.materials.russian_camouflage.dlc = "grv"
	self.materials.russian_camouflage.color = Color("746963")
	self.materials.ceramics_gzhel = {}
	self.materials.ceramics_gzhel.name_id = "bm_mtl_ceramics_gzhel"
	self.materials.ceramics_gzhel.pcs = {}
	self.materials.ceramics_gzhel.texture = "units/pd2_dlc_grv/masks/materials/matcap_ceramics_gzhel_df"
	self.materials.ceramics_gzhel.value = 0
	self.materials.ceramics_gzhel.material_amount = 0
	self.materials.ceramics_gzhel.dlc = "grv"
	self.materials.ceramics_gzhel.color = Color("a1a7b3")
	self.materials.propaganda_palette = {}
	self.materials.propaganda_palette.name_id = "bm_mtl_propaganda_palette"
	self.materials.propaganda_palette.pcs = {}
	self.materials.propaganda_palette.texture = "units/pd2_dlc_grv/masks/materials/matcap_propaganda_palette_df"
	self.materials.propaganda_palette.value = 0
	self.materials.propaganda_palette.dlc = "grv"
	self.materials.propaganda_palette.color = Color("a88e7a")
	self.materials.tricolor = {}
	self.materials.tricolor.name_id = "bm_mtl_tricolor"
	self.materials.tricolor.pcs = {}
	self.materials.tricolor.texture = "units/pd2_dlc_grv/masks/materials/matcap_tricolor_df"
	self.materials.tricolor.value = 0
	self.materials.tricolor.dlc = "grv"
	self.materials.tricolor.color = Color("9d8087")
	self.materials.solid_greyscale70 = {}
	self.materials.solid_greyscale70.name_id = "bm_mtl_matcap_solid_greyscale70"
	self.materials.solid_greyscale70.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_greyscale70.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_greyscale70_df"
	self.materials.solid_greyscale70.value = 1
	self.materials.solid_greyscale70.material_amount = 0
	self.materials.solid_greyscale70.texture_bundle_folder = "pmp"
	self.materials.solid_greyscale70.color = Color("ababab")
	self.materials.solid_greyscale50 = {}
	self.materials.solid_greyscale50.name_id = "bm_mtl_matcap_solid_grey50"
	self.materials.solid_greyscale50.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_greyscale50.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_greyscale50_df"
	self.materials.solid_greyscale50.value = 1
	self.materials.solid_greyscale50.material_amount = 0
	self.materials.solid_greyscale50.texture_bundle_folder = "pmp"
	self.materials.solid_greyscale50.color = Color("474747")
	self.materials.solid_greyscale10 = {}
	self.materials.solid_greyscale10.name_id = "bm_mtl_matcap_solid_greyscale10"
	self.materials.solid_greyscale10.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_greyscale10.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_greyscale10_df"
	self.materials.solid_greyscale10.value = 1
	self.materials.solid_greyscale10.material_amount = 0
	self.materials.solid_greyscale10.texture_bundle_folder = "pmp"
	self.materials.solid_greyscale10.color = Color("212121")
	self.materials.solid_green = {}
	self.materials.solid_green.name_id = "bm_mtl_matcap_solid_green"
	self.materials.solid_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_green.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_green_df"
	self.materials.solid_green.value = 1
	self.materials.solid_green.material_amount = 0
	self.materials.solid_green.texture_bundle_folder = "pmp"
	self.materials.solid_green.color = Color("4db14d")
	self.materials.solid_green_dark = {}
	self.materials.solid_green_dark.name_id = "bm_mtl_matcap_solid_green_dark"
	self.materials.solid_green_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_green_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_green_dark_df"
	self.materials.solid_green_dark.value = 1
	self.materials.solid_green_dark.material_amount = 0
	self.materials.solid_green_dark.texture_bundle_folder = "pmp"
	self.materials.solid_green_dark.color = Color("194b19")
	self.materials.solid_green_desaturated = {}
	self.materials.solid_green_desaturated.name_id = "bm_mtl_matcap_solid_green_desaturated"
	self.materials.solid_green_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_green_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_green_desaturated_df"
	self.materials.solid_green_desaturated.value = 1
	self.materials.solid_green_desaturated.material_amount = 0
	self.materials.solid_green_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_green_desaturated.color = Color("8b8b73")
	self.materials.solid_yellow = {}
	self.materials.solid_yellow.name_id = "bm_mtl_matcap_solid_yellow"
	self.materials.solid_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_yellow.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_yellow_df"
	self.materials.solid_yellow.value = 1
	self.materials.solid_yellow.material_amount = 0
	self.materials.solid_yellow.texture_bundle_folder = "pmp"
	self.materials.solid_yellow.color = Color("b0b14d")
	self.materials.solid_yellow_dark = {}
	self.materials.solid_yellow_dark.name_id = "bm_mtl_matcap_solid_yellow_dark"
	self.materials.solid_yellow_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_yellow_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_yellow_dark_df"
	self.materials.solid_yellow_dark.value = 1
	self.materials.solid_yellow_dark.material_amount = 0
	self.materials.solid_yellow_dark.texture_bundle_folder = "pmp"
	self.materials.solid_yellow_dark.color = Color("4b4b19")
	self.materials.solid_yellow_desaturated = {}
	self.materials.solid_yellow_desaturated.name_id = "bm_mtl_matcap_solid_yellow_desaturated"
	self.materials.solid_yellow_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_yellow_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_yellow_desaturated_df"
	self.materials.solid_yellow_desaturated.value = 1
	self.materials.solid_yellow_desaturated.material_amount = 0
	self.materials.solid_yellow_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_yellow_desaturated.color = Color("8b8b73")
	self.materials.solid_orange = {}
	self.materials.solid_orange.name_id = "bm_mtl_matcap_solid_orange"
	self.materials.solid_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_orange.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_orange_df"
	self.materials.solid_orange.value = 1
	self.materials.solid_orange.material_amount = 0
	self.materials.solid_orange.texture_bundle_folder = "pmp"
	self.materials.solid_orange.color = Color("b17e4d")
	self.materials.solid_orange_dark = {}
	self.materials.solid_orange_dark.name_id = "bm_mtl_matcap_solid_orange_dark"
	self.materials.solid_orange_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_orange_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_orange_dark_df"
	self.materials.solid_orange_dark.value = 1
	self.materials.solid_orange_dark.material_amount = 0
	self.materials.solid_orange_dark.texture_bundle_folder = "pmp"
	self.materials.solid_orange_dark.color = Color("4b3119")
	self.materials.solid_orange_desaturated = {}
	self.materials.solid_orange_desaturated.name_id = "bm_mtl_matcap_solid_orange_desaturated"
	self.materials.solid_orange_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_orange_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_orange_desaturated_df"
	self.materials.solid_orange_desaturated.value = 1
	self.materials.solid_orange_desaturated.material_amount = 0
	self.materials.solid_orange_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_orange_desaturated.color = Color("8b7f73")
	self.materials.solid_red = {}
	self.materials.solid_red.name_id = "bm_mtl_matcap_solid_red"
	self.materials.solid_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_red.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_red_df"
	self.materials.solid_red.value = 1
	self.materials.solid_red.material_amount = 0
	self.materials.solid_red.texture_bundle_folder = "pmp"
	self.materials.solid_red.color = Color("db2323")
	self.materials.solid_red_dark = {}
	self.materials.solid_red_dark.name_id = "bm_mtl_matcap_solid_red_dark"
	self.materials.solid_red_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_red_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_red_dark_df"
	self.materials.solid_red_dark.value = 1
	self.materials.solid_red_dark.material_amount = 0
	self.materials.solid_red_dark.texture_bundle_folder = "pmp"
	self.materials.solid_red_dark.color = Color("4c1919")
	self.materials.solid_red_desaturated = {}
	self.materials.solid_red_desaturated.name_id = "bm_mtl_matcap_solid_red_desaturated"
	self.materials.solid_red_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_red_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_red_desaturated_df"
	self.materials.solid_red_desaturated.value = 1
	self.materials.solid_red_desaturated.material_amount = 0
	self.materials.solid_red_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_red_desaturated.color = Color("8c7474")
	self.materials.solid_purple = {}
	self.materials.solid_purple.name_id = "bm_mtl_matcap_solid_purple"
	self.materials.solid_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_purple.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_purple_df"
	self.materials.solid_purple.value = 1
	self.materials.solid_purple.material_amount = 0
	self.materials.solid_purple.texture_bundle_folder = "pmp"
	self.materials.solid_purple.color = Color("8f4db1")
	self.materials.solid_purple_dark = {}
	self.materials.solid_purple_dark.name_id = "bm_mtl_matcap_solid_purple_dark"
	self.materials.solid_purple_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_purple_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_purple_dark_df"
	self.materials.solid_purple_dark.value = 1
	self.materials.solid_purple_dark.material_amount = 0
	self.materials.solid_purple_dark.texture_bundle_folder = "pmp"
	self.materials.solid_purple_dark.color = Color("3b194b")
	self.materials.solid_purple_desaturated = {}
	self.materials.solid_purple_desaturated.name_id = "bm_mtl_matcap_solid_purple_desaturated"
	self.materials.solid_purple_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_purple_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_purple_desaturated_df"
	self.materials.solid_purple_desaturated.value = 1
	self.materials.solid_purple_desaturated.material_amount = 0
	self.materials.solid_purple_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_purple_desaturated.color = Color("83738b")
	self.materials.solid_pink = {}
	self.materials.solid_pink.name_id = "bm_mtl_matcap_solid_pink"
	self.materials.solid_pink.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_pink.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_pink_df"
	self.materials.solid_pink.value = 1
	self.materials.solid_pink.material_amount = 0
	self.materials.solid_pink.texture_bundle_folder = "pmp"
	self.materials.solid_pink.color = Color("b14db0")
	self.materials.solid_pink_dark = {}
	self.materials.solid_pink_dark.name_id = "bm_mtl_matcap_solid_pink_dark"
	self.materials.solid_pink_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_pink_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_pink_dark_df"
	self.materials.solid_pink_dark.value = 1
	self.materials.solid_pink_dark.material_amount = 0
	self.materials.solid_pink_dark.texture_bundle_folder = "pmp"
	self.materials.solid_pink_dark.color = Color("4b194b")
	self.materials.solid_pink_desaturated = {}
	self.materials.solid_pink_desaturated.name_id = "bm_mtl_matcap_solid_pink_desaturated"
	self.materials.solid_pink_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_pink_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_pink_desaturated_df"
	self.materials.solid_pink_desaturated.value = 1
	self.materials.solid_pink_desaturated.material_amount = 0
	self.materials.solid_pink_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_pink_desaturated.color = Color("8b738b")
	self.materials.solid_blue = {}
	self.materials.solid_blue.name_id = "bm_mtl_matcap_solid_blue"
	self.materials.solid_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_blue.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_blue_df"
	self.materials.solid_blue.value = 1
	self.materials.solid_blue.material_amount = 0
	self.materials.solid_blue.texture_bundle_folder = "pmp"
	self.materials.solid_blue.color = Color("3a5cb3")
	self.materials.solid_blue_dark = {}
	self.materials.solid_blue_dark.name_id = "bm_mtl_matcap_solid_blue_dark"
	self.materials.solid_blue_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_blue_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_blue_dark_df"
	self.materials.solid_blue_dark.value = 1
	self.materials.solid_blue_dark.material_amount = 0
	self.materials.solid_blue_dark.texture_bundle_folder = "pmp"
	self.materials.solid_blue_dark.color = Color("19194b")
	self.materials.solid_blue_desaturated = {}
	self.materials.solid_blue_desaturated.name_id = "bm_mtl_matcap_solid_blue_desaturated"
	self.materials.solid_blue_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_blue_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_blue_desaturated_df"
	self.materials.solid_blue_desaturated.value = 1
	self.materials.solid_blue_desaturated.material_amount = 0
	self.materials.solid_blue_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_blue_desaturated.color = Color("73738b")
	self.materials.solid_paydayblue = {}
	self.materials.solid_paydayblue.name_id = "bm_mtl_matcap_solid_paydayblue"
	self.materials.solid_paydayblue.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_paydayblue.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_paydayblue_df"
	self.materials.solid_paydayblue.value = 1
	self.materials.solid_paydayblue.material_amount = 0
	self.materials.solid_paydayblue.texture_bundle_folder = "pmp"
	self.materials.solid_paydayblue.color = Color("4d8fb1")
	self.materials.solid_paydayblue_dark = {}
	self.materials.solid_paydayblue_dark.name_id = "bm_mtl_matcap_solid_paydayblue_dark"
	self.materials.solid_paydayblue_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_paydayblue_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_paydayblue_dark_df"
	self.materials.solid_paydayblue_dark.value = 1
	self.materials.solid_paydayblue_dark.material_amount = 0
	self.materials.solid_paydayblue_dark.texture_bundle_folder = "pmp"
	self.materials.solid_paydayblue_dark.color = Color("193b4b")
	self.materials.solid_paydayblue_desaturated = {}
	self.materials.solid_paydayblue_desaturated.name_id = "bm_mtl_matcap_solid_paydayblue_desaturated"
	self.materials.solid_paydayblue_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_paydayblue_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_paydayblue_desaturated_df"
	self.materials.solid_paydayblue_desaturated.value = 1
	self.materials.solid_paydayblue_desaturated.material_amount = 0
	self.materials.solid_paydayblue_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_paydayblue_desaturated.color = Color("73838b")
	self.materials.solid_teal = {}
	self.materials.solid_teal.name_id = "bm_mtl_matcap_solid_teal"
	self.materials.solid_teal.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_teal.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_teal_df"
	self.materials.solid_teal.value = 1
	self.materials.solid_teal.material_amount = 0
	self.materials.solid_teal.texture_bundle_folder = "pmp"
	self.materials.solid_teal.color = Color("194b4b")
	self.materials.solid_teal_dark = {}
	self.materials.solid_teal_dark.name_id = "bm_mtl_matcap_solid_teal_dark"
	self.materials.solid_teal_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_teal_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_teal_dark_df"
	self.materials.solid_teal_dark.value = 1
	self.materials.solid_teal_dark.material_amount = 0
	self.materials.solid_teal_dark.texture_bundle_folder = "pmp"
	self.materials.solid_teal_dark.color = Color("194b4b")
	self.materials.solid_teal_desaturated = {}
	self.materials.solid_teal_desaturated.name_id = "bm_mtl_matcap_solid_teal_desaturated"
	self.materials.solid_teal_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_teal_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_teal_desaturated_df"
	self.materials.solid_teal_desaturated.value = 1
	self.materials.solid_teal_desaturated.material_amount = 0
	self.materials.solid_teal_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_teal_desaturated.color = Color("738b8b")
	self.materials.solid_magenta = {}
	self.materials.solid_magenta.name_id = "bm_mtl_matcap_solid_magenta"
	self.materials.solid_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_magenta.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_magenta_df"
	self.materials.solid_magenta.value = 1
	self.materials.solid_magenta.material_amount = 0
	self.materials.solid_magenta.texture_bundle_folder = "pmp"
	self.materials.solid_magenta.color = Color("843951")
	self.materials.solid_magenta_dark = {}
	self.materials.solid_magenta_dark.name_id = "bm_mtl_matcap_solid_magenta_dark"
	self.materials.solid_magenta_dark.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_magenta_dark.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_magenta_dark_df"
	self.materials.solid_magenta_dark.value = 1
	self.materials.solid_magenta_dark.material_amount = 0
	self.materials.solid_magenta_dark.texture_bundle_folder = "pmp"
	self.materials.solid_magenta_dark.color = Color("391320")
	self.materials.solid_magenta_desaturated = {}
	self.materials.solid_magenta_desaturated.name_id = "bm_mtl_matcap_solid_magenta_desaturated"
	self.materials.solid_magenta_desaturated.pcs = {
		10,
		20,
		30,
		40
	}
	self.materials.solid_magenta_desaturated.texture = "units/pd2_dlc_pmp/masks/materials/matcap_solid_magenta_desaturated_df"
	self.materials.solid_magenta_desaturated.value = 1
	self.materials.solid_magenta_desaturated.material_amount = 0
	self.materials.solid_magenta_desaturated.texture_bundle_folder = "pmp"
	self.materials.solid_magenta_desaturated.color = Color("68565c")

	local tintable_gui_plastic = "guis/textures/pd2/blackmarket/icons/materials/plastic"

	self.materials.solid_flat_warm_yellow = {
		material_amount = 0,
		name_id = "bm_mclr_warm_yellow",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_warm_yellow_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.98039221763611, 0.61568629741669, 0.027450982481241),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_lime_green = {
		material_amount = 0,
		name_id = "bm_mclr_lime_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_lime_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 0.65098041296005, 0.31764706969261),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_purple = {
		material_amount = 0,
		name_id = "bm_mclr_purple",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_purple_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.60392159223557, 0.26666668057442, 0.86274516582489),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_light_brown = {
		material_amount = 0,
		name_id = "bm_mclr_light_brown",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_light_brown_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.80000007152557, 0.45098042488098, 0.13725490868092),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_sea_blue = {
		material_amount = 0,
		name_id = "bm_mclr_sea_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_sea_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.023529414087534, 0.21568629145622, 0.21960785984993),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_cyan = {
		material_amount = 0,
		name_id = "bm_mclr_cyan",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_cyan_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 1, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_coral_red = {
		material_amount = 0,
		name_id = "bm_mclr_coral_red",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_coral_red_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.83529418706894, 0.14117647707462, 0.20784315466881),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_bravo_blue = {
		material_amount = 0,
		name_id = "bm_mclr_bravo_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_bravo_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.82745105028152, 0.89019614458084, 0.95294123888016),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_twilight_lavender = {
		material_amount = 0,
		name_id = "bm_mclr_twilight_lavender",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_twilight_lavender_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.5137255191803, 0.26666668057442, 0.43529415130615),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_mindaro = {
		material_amount = 0,
		name_id = "bm_mclr_mindaro",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_mindaro_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.90588241815567, 1, 0.53725492954254),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_leaf_green = {
		material_amount = 0,
		name_id = "bm_mclr_leaf_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_leaf_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.4078431725502, 0.74901962280273, 0.21176472306252),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_may_green = {
		material_amount = 0,
		name_id = "bm_mclr_may_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_may_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.27843138575554, 0.55294120311737, 0.27843138575554),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_white = {
		material_amount = 0,
		name_id = "bm_mclr_white",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_white_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 1, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_tickle_pink = {
		material_amount = 0,
		name_id = "bm_mclr_tickle_pink",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_tickle_pink_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0.5137255191803, 0.70980393886566),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_orange = {
		material_amount = 0,
		name_id = "bm_mclr_orange",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_orange_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0.36862745881081, 0.05882353335619),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_blithe_blue = {
		material_amount = 0,
		name_id = "bm_mclr_blithe_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_blithe_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.56470590829849, 0.74901962280273, 0.74901962280273),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_guppie_green = {
		material_amount = 0,
		name_id = "bm_mclr_guppie_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_guppie_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 1, 0.48627454042435),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_congo_pink = {
		material_amount = 0,
		name_id = "bm_mclr_congo_pink",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_congo_pink_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0.53333336114883, 0.4588235616684),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_fern_green = {
		material_amount = 0,
		name_id = "bm_mclr_fern_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_fern_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.33333334326744, 0.49803924560547, 0.23529413342476),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_blood_red = {
		material_amount = 0,
		name_id = "bm_mclr_blood_red",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_blood_red_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.54117649793625, 0.066666670143604, 0.035294119268656),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_gray = {
		material_amount = 0,
		name_id = "bm_mclr_gray",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_gray_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.50196081399918, 0.50196081399918, 0.50196081399918),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_deep_aquamarine = {
		material_amount = 0,
		name_id = "bm_mclr_deep_aquamarine",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_deep_aquamarine_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.26274511218071, 0.54509806632996, 0.47450983524323),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_mud = {
		material_amount = 0,
		name_id = "bm_mclr_mud",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_mud_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.41176474094391, 0.33725491166115, 0.29411765933037),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_olive_green = {
		material_amount = 0,
		name_id = "bm_mclr_olive_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_olive_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.28235295414925, 0.35294118523598, 0.19607844948769),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_rifle_green = {
		material_amount = 0,
		name_id = "bm_mclr_rifle_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_rifle_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.27843138575554, 0.30196079611778, 0.24705883860588),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_green = {
		material_amount = 0,
		name_id = "bm_mclr_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 1, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_magenta = {
		material_amount = 0,
		name_id = "bm_mclr_magenta",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_magenta_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_red = {
		material_amount = 0,
		name_id = "bm_mclr_dark_red",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_red_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.43137258291245, 0.05882353335619, 0.086274512112141),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_turquoise = {
		material_amount = 0,
		name_id = "bm_mclr_turquoise",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_turquoise_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 0.81960791349411, 0.61568629741669),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_deep_green = {
		material_amount = 0,
		name_id = "bm_mclr_deep_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_deep_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.17254902422428, 0.20000001788139, 0.098039224743843),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_parisian_patina = {
		material_amount = 0,
		name_id = "bm_mclr_parisian_patina",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_parisian_patina_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.48627454042435, 0.64705884456635, 0.50980395078659),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_sand = {
		material_amount = 0,
		name_id = "bm_mclr_sand",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_sand_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.6745098233223, 0.55294120311737, 0.48235297203064),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_heliotrope = {
		material_amount = 0,
		name_id = "bm_mclr_heliotrope",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_heliotrope_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.89411771297455, 0.47450983524323, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_gray_blue = {
		material_amount = 0,
		name_id = "bm_mclr_gray_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_gray_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.047058828175068, 0.26666668057442, 0.32941177487373),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_sea_green = {
		material_amount = 0,
		name_id = "bm_mclr_sea_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_sea_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 1, 0.74901962280273),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_neon_red = {
		material_amount = 0,
		name_id = "bm_mclr_neon_red",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_neon_red_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0, 0.23529413342476),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_electric_indigo = {
		material_amount = 0,
		name_id = "bm_mclr_electric_indigo",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_electric_indigo_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.37647062540054, 0, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_chartreuse = {
		material_amount = 0,
		name_id = "bm_mclr_chartreuse",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_chartreuse_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.49803924560547, 1, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_toxic_green = {
		material_amount = 0,
		name_id = "bm_mclr_toxic_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_toxic_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.65490198135376, 0.97254908084869, 0.34117648005486),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_matte_purple = {
		material_amount = 0,
		name_id = "bm_mclr_matte_purple",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_matte_purple_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.41960787773132, 0.32941177487373, 0.56470590829849),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_maximum_purple = {
		material_amount = 0,
		name_id = "bm_mclr_maximum_purple",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_maximum_purple_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.4627451300621, 0.25098040699959, 0.51764708757401),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_french_sky_blue = {
		material_amount = 0,
		name_id = "bm_mclr_french_sky_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_french_sky_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.47843140363693, 0.61568629741669, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_shadow_yellow = {
		material_amount = 0,
		name_id = "bm_mclr_shadow_yellow",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_shadow_yellow_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.63529413938522, 0.63529413938522, 0.38039219379425),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_green = {
		material_amount = 0,
		name_id = "bm_mclr_dark_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.027450982481241, 0.23921570181847, 0.035294119268656),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_pink = {
		material_amount = 0,
		name_id = "bm_mclr_pink",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_pink_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0.47843140363693, 0.90196084976196),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_gray = {
		material_amount = 0,
		name_id = "bm_mclr_dark_gray",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_gray_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.25098040699959, 0.25098040699959, 0.25098040699959),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_branch_green = {
		material_amount = 0,
		name_id = "bm_mclr_branch_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_branch_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.3647058904171, 0.3647058904171, 0.19215688109398),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_brown = {
		material_amount = 0,
		name_id = "bm_mclr_brown",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_brown_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.50196081399918, 0.27450981736183, 0.050980396568775),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_slate_blue = {
		material_amount = 0,
		name_id = "bm_mclr_dark_slate_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_slate_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.28627452254295, 0.28627452254295, 0.57647061347961),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_coffee = {
		material_amount = 0,
		name_id = "bm_mclr_coffee",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_coffee_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.41960787773132, 0.32549020648003, 0.21568629145622),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_puce = {
		material_amount = 0,
		name_id = "bm_mclr_dark_puce",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_puce_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.31764706969261, 0.16862745583057, 0.22745099663734),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_light_gray = {
		material_amount = 0,
		name_id = "bm_mclr_light_gray",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_light_gray_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.74901962280273, 0.74901962280273, 0.74901962280273),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_haven = {
		material_amount = 0,
		name_id = "bm_mclr_haven",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_haven_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.64705884456635, 0.73333334922791, 0.56078433990479),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_cordovan = {
		material_amount = 0,
		name_id = "bm_mclr_cordovan",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_cordovan_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.51764708757401, 0.24705883860588, 0.27450981736183),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_aquamarine = {
		material_amount = 0,
		name_id = "bm_mclr_aquamarine",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_aquamarine_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.49019610881805, 1, 0.8705883026123),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_brandeis_blue = {
		material_amount = 0,
		name_id = "bm_mclr_brandeis_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_brandeis_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 0.46666669845581, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_black = {
		material_amount = 0,
		name_id = "bm_mclr_black",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_black_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.1, 0.1, 0.1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_scary_green = {
		material_amount = 0,
		name_id = "bm_mclr_scary_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_scary_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.36078432202339, 1, 0.4588235616684),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_skin_pink = {
		material_amount = 0,
		name_id = "bm_mclr_skin_pink",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_skin_pink_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.90196084976196, 0.57647061347961, 0.54901963472366),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_dark_purple = {
		material_amount = 0,
		name_id = "bm_mclr_dark_purple",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_dark_purple_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.41960787773132, 0, 0.29019609093666),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_yellow = {
		material_amount = 0,
		name_id = "bm_mclr_yellow",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_yellow_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 1, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_red = {
		material_amount = 0,
		name_id = "bm_mclr_red",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_red_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_blue_bell = {
		material_amount = 0,
		name_id = "bm_mclr_blue_bell",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_blue_bell_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.65882354974747, 0.61960786581039, 0.8156863451004),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_fashion_fuchsia = {
		material_amount = 0,
		name_id = "bm_mclr_fashion_fuchsia",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_fashion_fuchsia_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0, 0.69019609689713),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_matte_blue = {
		material_amount = 0,
		name_id = "bm_mclr_matte_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_matte_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.21960785984993, 0.38039219379425, 0.65882354974747),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_shadow_blue = {
		material_amount = 0,
		name_id = "bm_mclr_shadow_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_shadow_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.47450983524323, 0.54901963472366, 0.63529413938522),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_heat_wave = {
		material_amount = 0,
		name_id = "bm_mclr_heat_wave",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_heat_wave_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0.47450983524323, 0),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_coyote_brown = {
		material_amount = 0,
		name_id = "bm_mclr_coyote_brown",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_coyote_brown_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.47450983524323, 0.41176474094391, 0.23137256503105),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_mellow_green = {
		material_amount = 0,
		name_id = "bm_mclr_mellow_green",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_mellow_green_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.80392163991928, 0.80392163991928, 0.56078433990479),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_vivid_raspberry = {
		material_amount = 0,
		name_id = "bm_mclr_vivid_raspberry",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_vivid_raspberry_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0, 0.039215687662363),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_slate_blue = {
		material_amount = 0,
		name_id = "bm_mclr_slate_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_slate_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.49803924560547, 0.49803924560547, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_blue = {
		material_amount = 0,
		name_id = "bm_mclr_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 0, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_lavender = {
		material_amount = 0,
		name_id = "bm_mclr_lavender",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_lavender_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.68627452850342, 0.49411767721176, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_kilim_beige = {
		material_amount = 0,
		name_id = "bm_mclr_kilim_beige",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_kilim_beige_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.84705889225006, 0.7607843875885, 0.68235296010971),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_navy_blue = {
		material_amount = 0,
		name_id = "bm_mclr_navy_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_navy_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.15686275064945, 0.2039215862751, 0.33725491166115),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_baroness = {
		material_amount = 0,
		name_id = "bm_mclr_baroness",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_baroness_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.678431391716, 0.52549022436142, 0.6745098233223),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_russian_violet = {
		material_amount = 0,
		name_id = "bm_mclr_russian_violet",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_russian_violet_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.23529413342476, 0.14901961386204, 0.29803922772408),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_pastel_yellow = {
		material_amount = 0,
		name_id = "bm_mclr_pastel_yellow",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_pastel_yellow_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 1, 0.52156865596771),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_imperial_purple = {
		material_amount = 0,
		name_id = "bm_mclr_imperial_purple",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_imperial_purple_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.42352944612503, 0, 0.29019609093666),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_rosebay = {
		material_amount = 0,
		name_id = "bm_mclr_rosebay",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_rosebay_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.78823536634445, 0.58823531866074, 0.72549021244049),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_vivid_sky_blue = {
		material_amount = 0,
		name_id = "bm_mclr_vivid_sky_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_vivid_sky_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 0.77647066116333, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_vivid_orchid = {
		material_amount = 0,
		name_id = "bm_mclr_vivid_orchid",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_vivid_orchid_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.80000007152557, 0, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_vivid_blue = {
		material_amount = 0,
		name_id = "bm_mclr_vivid_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_vivid_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 0.26274511218071, 1),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_bone_white = {
		material_amount = 0,
		name_id = "bm_mclr_bone_white",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_bone_white_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0.93333339691162, 0.59215688705444),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_bright_yellow = {
		material_amount = 0,
		name_id = "bm_mclr_bright_yellow",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_bright_yellow_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(1, 0.8117647767067, 0.29803922772408),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_light_blue = {
		material_amount = 0,
		name_id = "bm_mclr_light_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_light_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.49411767721176, 0.77647066116333, 0.93333339691162),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_upsdell_red = {
		material_amount = 0,
		name_id = "bm_mclr_upsdell_red",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_upsdell_red_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0.65098041296005, 0.12156863510609, 0.17254902422428),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_cobalt_blue = {
		material_amount = 0,
		name_id = "bm_mclr_cobalt_blue",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_cobalt_blue_df",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color(0, 0.3647058904171, 0.78039222955704),
		tintable_gui = tintable_gui_plastic
	}
	self.materials.solid_flat_stg_orange = {
		material_amount = 0,
		name_id = "bm_mclr_stg_orange",
		texture = "units/pd2_dlc_lic/masks/materials/matcap_stg_orange_df",
		texture_bundle_folder = "lic",
		value = 1,
		pcs = {
			10,
			20,
			30,
			40
		},
		color = Color("fc4c02"),
		tintable_gui = tintable_gui_plastic
	}

	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.materials) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end
end
