function BlackMarketTweakData:_init_colors(tweak_data)
	self.colors = {}

	local white = Color.white
	local black = Color.black
	local red = Color.red
	local green = Color.green
	local blue = Color.blue
	local yellow = Color.yellow
	local magenta = Color(255, 255, 0, 255) / 255
	local cyan = Color(255, 0, 255, 255) / 255
	local light_gray = Color(255, 191, 191, 191) / 255
	local gray = Color(255, 128, 128, 128) / 255
	local dark_gray = Color(255, 64, 64, 64) / 255
	local blood_red = Color(255, 138, 17, 9) / 255
	local orange = Color(255, 255, 94, 15) / 255
	local light_brown = Color(255, 204, 115, 35) / 255
	local bright_yellow = Color(255, 255, 207, 76) / 255
	local lime_green = Color(255, 0, 166, 81) / 255
	local purple = Color(255, 154, 68, 220) / 255
	local pink = Color(255, 255, 122, 230) / 255
	local brown = Color(255, 128, 70, 13) / 255
	local navy_blue = Color(255, 40, 52, 86) / 255
	local matte_blue = Color(255, 56, 97, 168) / 255
	local olive_green = Color(255, 72, 90, 50) / 255
	local gray_blue = Color(255, 12, 68, 84) / 255
	local light_blue = Color(255, 126, 198, 238) / 255
	local bone_white = Color(255, 255, 238, 151) / 255
	local turquoise = Color(255, 0, 209, 157) / 255
	local matte_purple = Color(255, 107, 84, 144) / 255
	local coral_red = Color(255, 213, 36, 53) / 255
	local leaf_green = Color(255, 104, 191, 54) / 255
	local dark_green = Color(255, 7, 61, 9) / 255
	local warm_yellow = Color(255, 250, 157, 7) / 255
	local dark_red = Color(255, 110, 15, 22) / 255
	local cobalt_blue = Color(255, 0, 93, 199) / 255
	local toxic_green = Color(255, 167, 248, 87) / 255
	local nothing = Color(0, 0, 0, 0) / 255
	local skin_pink = Color(255, 230, 147, 140) / 255
	local sea_blue = Color(255, 6, 55, 56) / 255
	local dark_purple = Color(255, 107, 0, 74) / 255
	local scary_green = Color(255, 92, 255, 117) / 255

	self.colors.white_solid = {}
	self.colors.white_solid.colors = {
		white,
		white
	}
	self.colors.white_solid.name_id = "bm_clr_white_solid"
	self.colors.white_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_solid.value = 7
	self.colors.black_solid = {}
	self.colors.black_solid.colors = {
		black,
		black
	}
	self.colors.black_solid.name_id = "bm_clr_black_solid"
	self.colors.black_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_solid.value = 10
	self.colors.red_solid = {}
	self.colors.red_solid.colors = {
		red,
		red
	}
	self.colors.red_solid.name_id = "bm_clr_red_solid"
	self.colors.red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_solid.value = 5
	self.colors.blue_solid = {}
	self.colors.blue_solid.colors = {
		blue,
		blue
	}
	self.colors.blue_solid.name_id = "bm_clr_blue_solid"
	self.colors.blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_solid.value = 8
	self.colors.green_solid = {}
	self.colors.green_solid.colors = {
		green,
		green
	}
	self.colors.green_solid.name_id = "bm_clr_green_solid"
	self.colors.green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_solid.value = 8
	self.colors.cyan_solid = {}
	self.colors.cyan_solid.colors = {
		cyan,
		cyan
	}
	self.colors.cyan_solid.name_id = "bm_clr_cyan_solid"
	self.colors.cyan_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_solid.value = 8
	self.colors.magenta_solid = {}
	self.colors.magenta_solid.colors = {
		magenta,
		magenta
	}
	self.colors.magenta_solid.name_id = "bm_clr_magenta_solid"
	self.colors.magenta_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_solid.value = 7
	self.colors.yellow_solid = {}
	self.colors.yellow_solid.colors = {
		yellow,
		yellow
	}
	self.colors.yellow_solid.name_id = "bm_clr_yellow_solid"
	self.colors.yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_solid.value = 6
	self.colors.light_gray_solid = {}
	self.colors.light_gray_solid.colors = {
		light_gray,
		light_gray
	}
	self.colors.light_gray_solid.name_id = "bm_clr_light_gray_solid"
	self.colors.light_gray_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_solid.value = 7
	self.colors.dark_gray_solid = {}
	self.colors.dark_gray_solid.colors = {
		dark_gray,
		dark_gray
	}
	self.colors.dark_gray_solid.name_id = "bm_clr_dark_gray_solid"
	self.colors.dark_gray_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_solid.value = 8
	self.colors.gray_solid = {}
	self.colors.gray_solid.colors = {
		gray,
		gray
	}
	self.colors.gray_solid.name_id = "bm_clr_gray_solid"
	self.colors.gray_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_solid.value = 6
	self.colors.pink_solid = {}
	self.colors.pink_solid.colors = {
		pink,
		pink
	}
	self.colors.pink_solid.name_id = "bm_clr_pink_solid"
	self.colors.pink_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_solid.value = 7
	self.colors.purple_solid = {}
	self.colors.purple_solid.colors = {
		purple,
		purple
	}
	self.colors.purple_solid.name_id = "bm_clr_purple_solid"
	self.colors.purple_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.purple_solid.value = 8
	self.colors.blood_red_solid = {}
	self.colors.blood_red_solid.colors = {
		blood_red,
		blood_red
	}
	self.colors.blood_red_solid.name_id = "bm_clr_blood_red_solid"
	self.colors.blood_red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blood_red_solid.value = 9
	self.colors.orange_solid = {}
	self.colors.orange_solid.colors = {
		orange,
		orange
	}
	self.colors.orange_solid.name_id = "bm_clr_orange_solid"
	self.colors.orange_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_solid.value = 8
	self.colors.light_brown_solid = {}
	self.colors.light_brown_solid.colors = {
		light_brown,
		light_brown
	}
	self.colors.light_brown_solid.name_id = "bm_clr_light_brown_solid"
	self.colors.light_brown_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_solid.value = 6
	self.colors.brown_solid = {}
	self.colors.brown_solid.colors = {
		brown,
		brown
	}
	self.colors.brown_solid.name_id = "bm_clr_brown_solid"
	self.colors.brown_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.brown_solid.value = 8
	self.colors.navy_blue_solid = {}
	self.colors.navy_blue_solid.colors = {
		navy_blue,
		navy_blue
	}
	self.colors.navy_blue_solid.name_id = "bm_clr_navy_blue_solid"
	self.colors.navy_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.navy_blue_solid.value = 7
	self.colors.light_blue_solid = {}
	self.colors.light_blue_solid.colors = {
		light_blue,
		light_blue
	}
	self.colors.light_blue_solid.name_id = "bm_clr_light_blue_solid"
	self.colors.light_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_solid.value = 5
	self.colors.leaf_green_solid = {}
	self.colors.leaf_green_solid.colors = {
		leaf_green,
		leaf_green
	}
	self.colors.leaf_green_solid.name_id = "bm_clr_leaf_green_solid"
	self.colors.leaf_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_solid.value = 8
	self.colors.warm_yellow_solid = {}
	self.colors.warm_yellow_solid.colors = {
		warm_yellow,
		warm_yellow
	}
	self.colors.warm_yellow_solid.name_id = "bm_clr_warm_yellow_solid"
	self.colors.warm_yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_solid.value = 6
	self.colors.dark_red_solid = {}
	self.colors.dark_red_solid.colors = {
		dark_red,
		dark_red
	}
	self.colors.dark_red_solid.name_id = "bm_clr_dark_red_solid"
	self.colors.dark_red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_solid.value = 5
	self.colors.dark_green_solid = {}
	self.colors.dark_green_solid.colors = {
		dark_green,
		dark_green
	}
	self.colors.dark_green_solid.name_id = "bm_clr_dark_green_solid"
	self.colors.dark_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_green_solid.value = 6
	self.colors.nothing = {}
	self.colors.nothing.colors = {
		nothing,
		nothing
	}
	self.colors.nothing.name_id = "bm_clr_nothing"
	self.colors.nothing.value = 0
	self.colors.black_white = {}
	self.colors.black_white.colors = {
		black,
		white
	}
	self.colors.black_white.name_id = "bm_clr_black_white"
	self.colors.black_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_white.value = 3
	self.colors.red_black = {}
	self.colors.red_black.colors = {
		red,
		black
	}
	self.colors.red_black.name_id = "bm_clr_red_black"
	self.colors.red_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_black.dlc = "preorder"
	self.colors.red_black.value = 1
	self.colors.yellow_blue = {}
	self.colors.yellow_blue.colors = {
		yellow,
		blue
	}
	self.colors.yellow_blue.name_id = "bm_clr_yellow_blue"
	self.colors.yellow_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_blue.value = 5
	self.colors.red_blue = {}
	self.colors.red_blue.colors = {
		red,
		blue
	}
	self.colors.red_blue.name_id = "bm_clr_red_blue"
	self.colors.red_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_blue.value = 2
	self.colors.light_gray_dark_gray = {}
	self.colors.light_gray_dark_gray.colors = {
		light_gray,
		dark_gray
	}
	self.colors.light_gray_dark_gray.name_id = "bm_clr_light_gray_dark_gray"
	self.colors.light_gray_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_dark_gray.value = 3
	self.colors.magenta_cyan = {}
	self.colors.magenta_cyan.colors = {
		magenta,
		cyan
	}
	self.colors.magenta_cyan.name_id = "bm_clr_magenta_cyan"
	self.colors.magenta_cyan.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_cyan.value = 4
	self.colors.green_red = {}
	self.colors.green_red.colors = {
		green,
		red
	}
	self.colors.green_red.name_id = "bm_clr_green_red"
	self.colors.green_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_red.value = 2
	self.colors.orange_blue = {}
	self.colors.orange_blue.colors = {
		orange,
		blue
	}
	self.colors.orange_blue.name_id = "bm_clr_orange_blue"
	self.colors.orange_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_blue.value = 3
	self.colors.green_olive_green = {}
	self.colors.green_olive_green.colors = {
		green,
		olive_green
	}
	self.colors.green_olive_green.name_id = "bm_clr_green_olive_green"
	self.colors.green_olive_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_olive_green.value = 4
	self.colors.yellow_orange = {}
	self.colors.yellow_orange.colors = {
		yellow,
		orange
	}
	self.colors.yellow_orange.name_id = "bm_clr_yellow_orange"
	self.colors.yellow_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_orange.value = 2
	self.colors.light_brown_matte_blue = {}
	self.colors.light_brown_matte_blue.colors = {
		light_brown,
		matte_blue
	}
	self.colors.light_brown_matte_blue.name_id = "bm_clr_light_brown_matte_blue"
	self.colors.light_brown_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_matte_blue.value = 3
	self.colors.turquoise_purple = {}
	self.colors.turquoise_purple.colors = {
		turquoise,
		purple
	}
	self.colors.turquoise_purple.name_id = "bm_clr_turquoise_purple"
	self.colors.turquoise_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_purple.value = 2
	self.colors.orange_gray_blue = {}
	self.colors.orange_gray_blue.colors = {
		orange,
		gray_blue
	}
	self.colors.orange_gray_blue.name_id = "bm_clr_orange_gray_blue"
	self.colors.orange_gray_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_gray_blue.value = 4
	self.colors.coral_red_matte_blue = {}
	self.colors.coral_red_matte_blue.colors = {
		coral_red,
		matte_blue
	}
	self.colors.coral_red_matte_blue.name_id = "bm_clr_coral_red_matte_blue"
	self.colors.coral_red_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_matte_blue.value = 3
	self.colors.toxic_green_dark_green = {}
	self.colors.toxic_green_dark_green.colors = {
		toxic_green,
		dark_green
	}
	self.colors.toxic_green_dark_green.name_id = "bm_clr_toxic_green_dark_green"
	self.colors.toxic_green_dark_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.toxic_green_dark_green.value = 4
	self.colors.warm_yellow_matte_purple = {}
	self.colors.warm_yellow_matte_purple.colors = {
		warm_yellow,
		matte_purple
	}
	self.colors.warm_yellow_matte_purple.name_id = "bm_clr_warm_yellow_matte_purple"
	self.colors.warm_yellow_matte_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_matte_purple.value = 3
	self.colors.bright_yellow_brown = {}
	self.colors.bright_yellow_brown.colors = {
		bright_yellow,
		brown
	}
	self.colors.bright_yellow_brown.name_id = "bm_clr_bright_yellow_brown"
	self.colors.bright_yellow_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_brown.value = 2
	self.colors.coral_red_lime_green = {}
	self.colors.coral_red_lime_green.colors = {
		coral_red,
		lime_green
	}
	self.colors.coral_red_lime_green.name_id = "bm_clr_coral_red_lime_green"
	self.colors.coral_red_lime_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_lime_green.value = 3
	self.colors.white_matte_blue = {}
	self.colors.white_matte_blue.colors = {
		white,
		matte_blue
	}
	self.colors.white_matte_blue.name_id = "bm_clr_white_matte_blue"
	self.colors.white_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_matte_blue.value = 4
	self.colors.red_dark_red = {}
	self.colors.red_dark_red.colors = {
		red,
		dark_red
	}
	self.colors.red_dark_red.name_id = "bm_clr_red_dark_red"
	self.colors.red_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_dark_red.value = 2
	self.colors.bone_white_magenta = {}
	self.colors.bone_white_magenta.colors = {
		bone_white,
		magenta
	}
	self.colors.bone_white_magenta.name_id = "bm_clr_bone_white_magenta"
	self.colors.bone_white_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_magenta.value = 3
	self.colors.cobalt_blue_navy_blue = {}
	self.colors.cobalt_blue_navy_blue.colors = {
		cobalt_blue,
		navy_blue
	}
	self.colors.cobalt_blue_navy_blue.name_id = "bm_clr_cobalt_blue_navy_blue"
	self.colors.cobalt_blue_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_navy_blue.value = 4
	self.colors.toxic_green_leaf_green = {}
	self.colors.toxic_green_leaf_green.colors = {
		toxic_green,
		leaf_green
	}
	self.colors.toxic_green_leaf_green.name_id = "bm_clr_toxic_green_leaf_green"
	self.colors.toxic_green_leaf_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.toxic_green_leaf_green.value = 2
	self.colors.light_brown_brown = {}
	self.colors.light_brown_brown.colors = {
		light_brown,
		brown
	}
	self.colors.light_brown_brown.name_id = "bm_clr_light_brown_brown"
	self.colors.light_brown_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_brown.value = 3
	self.colors.bright_yellow_turquoise = {}
	self.colors.bright_yellow_turquoise.colors = {
		bright_yellow,
		turquoise
	}
	self.colors.bright_yellow_turquoise.name_id = "bm_clr_bright_yellow_turquoise"
	self.colors.bright_yellow_turquoise.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_turquoise.value = 4
	self.colors.light_blue_gray_blue = {}
	self.colors.light_blue_gray_blue.colors = {
		light_blue,
		gray_blue
	}
	self.colors.light_blue_gray_blue.name_id = "bm_clr_light_blue_gray_blue"
	self.colors.light_blue_gray_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_gray_blue.value = 3
	self.colors.pink_matte_purple = {}
	self.colors.pink_matte_purple.colors = {
		pink,
		matte_purple
	}
	self.colors.pink_matte_purple.name_id = "bm_clr_pink_matte_purple"
	self.colors.pink_matte_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_matte_purple.value = 2
	self.colors.bone_white_purple = {}
	self.colors.bone_white_purple.colors = {
		bone_white,
		purple
	}
	self.colors.bone_white_purple.name_id = "bm_clr_bone_white_purple"
	self.colors.bone_white_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_purple.value = 4
	self.colors.light_blue_cobalt_blue = {}
	self.colors.light_blue_cobalt_blue.colors = {
		light_blue,
		cobalt_blue
	}
	self.colors.light_blue_cobalt_blue.name_id = "bm_clr_light_blue_cobalt_blue"
	self.colors.light_blue_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_cobalt_blue.value = 3
	self.colors.coral_red_gray_blue = {}
	self.colors.coral_red_gray_blue.colors = {
		coral_red,
		gray_blue
	}
	self.colors.coral_red_gray_blue.name_id = "bm_clr_coral_red_gray_blue"
	self.colors.coral_red_gray_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_gray_blue.value = 2
	self.colors.leaf_green_blood_red = {}
	self.colors.leaf_green_blood_red.colors = {
		leaf_green,
		blood_red
	}
	self.colors.leaf_green_blood_red.name_id = "bm_clr_leaf_green_blood_red"
	self.colors.leaf_green_blood_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_blood_red.value = 3
	self.colors.cobalt_blue_pink = {}
	self.colors.cobalt_blue_pink.colors = {
		cobalt_blue,
		pink
	}
	self.colors.cobalt_blue_pink.name_id = "bm_clr_cobalt_blue_pink"
	self.colors.cobalt_blue_pink.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_pink.value = 2
	self.colors.bright_yellow_olive_green = {}
	self.colors.bright_yellow_olive_green.colors = {
		bright_yellow,
		olive_green
	}
	self.colors.bright_yellow_olive_green.name_id = "bm_clr_bright_yellow_olive_green"
	self.colors.bright_yellow_olive_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_olive_green.value = 1
	self.colors.bone_white_light_blue = {}
	self.colors.bone_white_light_blue.colors = {
		bone_white,
		light_blue
	}
	self.colors.bone_white_light_blue.name_id = "bm_clr_bone_white_light_blue"
	self.colors.bone_white_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_light_blue.value = 1
	self.colors.coral_red_dark_red = {}
	self.colors.coral_red_dark_red.colors = {
		coral_red,
		dark_red
	}
	self.colors.coral_red_dark_red.name_id = "bm_clr_coral_red_dark_red"
	self.colors.coral_red_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_dark_red.value = 2
	self.colors.turquoise_pink = {}
	self.colors.turquoise_pink.colors = {
		turquoise,
		pink
	}
	self.colors.turquoise_pink.name_id = "bm_clr_turquoise_pink"
	self.colors.turquoise_pink.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_pink.value = 1
	self.colors.white_brown = {}
	self.colors.white_brown.colors = {
		white,
		brown
	}
	self.colors.white_brown.name_id = "bm_clr_white_brown"
	self.colors.white_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_brown.value = 1
	self.colors.blue_light_blue = {}
	self.colors.blue_light_blue.colors = {
		blue,
		light_blue
	}
	self.colors.blue_light_blue.name_id = "bm_clr_blue_light_blue"
	self.colors.blue_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_light_blue.value = 2
	self.colors.toxic_green_matte_purple = {}
	self.colors.toxic_green_matte_purple.colors = {
		toxic_green,
		matte_purple
	}
	self.colors.toxic_green_matte_purple.name_id = "bm_clr_toxic_green_matte_purple"
	self.colors.toxic_green_matte_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.toxic_green_matte_purple.value = 2
	self.colors.orange_matte_blue = {}
	self.colors.orange_matte_blue.colors = {
		orange,
		matte_blue
	}
	self.colors.orange_matte_blue.name_id = "bm_clr_orange_matte_blue"
	self.colors.orange_matte_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_matte_blue.value = 3
	self.colors.warm_yellow_navy_blue = {}
	self.colors.warm_yellow_navy_blue.colors = {
		warm_yellow,
		navy_blue
	}
	self.colors.warm_yellow_navy_blue.name_id = "bm_clr_warm_yellow_navy_blue"
	self.colors.warm_yellow_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_navy_blue.value = 3
	self.colors.bright_yellow_dark_gray = {}
	self.colors.bright_yellow_dark_gray.colors = {
		bright_yellow,
		dark_gray
	}
	self.colors.bright_yellow_dark_gray.name_id = "bm_clr_bright_yellow_dark_gray"
	self.colors.bright_yellow_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_dark_gray.value = 2
	self.colors.white_magenta = {}
	self.colors.white_magenta.colors = {
		white,
		magenta
	}
	self.colors.white_magenta.name_id = "bm_clr_white_magenta"
	self.colors.white_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_magenta.value = 4
	self.colors.cyan_purple = {}
	self.colors.cyan_purple.colors = {
		cyan,
		purple
	}
	self.colors.cyan_purple.name_id = "bm_clr_cyan_purple"
	self.colors.cyan_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_purple.value = 5
	self.colors.white_black = {}
	self.colors.white_black.colors = {
		white,
		black
	}
	self.colors.white_black.name_id = "bm_clr_white_black"
	self.colors.white_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_black.value = 3
	self.colors.light_gray_blood_red = {}
	self.colors.light_gray_blood_red.colors = {
		light_gray,
		blood_red
	}
	self.colors.light_gray_blood_red.name_id = "bm_clr_light_gray_blood_red"
	self.colors.light_gray_blood_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_blood_red.value = 6
	self.colors.blood_red_white = {}
	self.colors.blood_red_white.colors = {
		blood_red,
		white
	}
	self.colors.blood_red_white.name_id = "bm_clr_blood_red_white"
	self.colors.blood_red_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blood_red_white.value = 6
	self.colors.bone_white_navy_blue = {}
	self.colors.bone_white_navy_blue.colors = {
		bone_white,
		navy_blue
	}
	self.colors.bone_white_navy_blue.name_id = "bm_clr_bone_white_navy_blue"
	self.colors.bone_white_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bone_white_navy_blue.value = 5
	self.colors.warm_yellow_olive_green = {}
	self.colors.warm_yellow_olive_green.colors = {
		warm_yellow,
		olive_green
	}
	self.colors.warm_yellow_olive_green.name_id = "bm_clr_warm_yellow_olive_green"
	self.colors.warm_yellow_olive_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_olive_green.value = 4
	self.colors.cyan_orange = {}
	self.colors.cyan_orange.colors = {
		cyan,
		orange
	}
	self.colors.cyan_orange.name_id = "bm_clr_cyan_orange"
	self.colors.cyan_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_orange.value = 3
	self.colors.dark_gray_orange = {}
	self.colors.dark_gray_orange.colors = {
		dark_gray,
		orange
	}
	self.colors.dark_gray_orange.name_id = "bm_clr_dark_gray_orange"
	self.colors.dark_gray_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_orange.value = 2
	self.colors.light_brown_navy_blue = {}
	self.colors.light_brown_navy_blue.colors = {
		light_brown,
		navy_blue
	}
	self.colors.light_brown_navy_blue.name_id = "bm_clr_light_brown_navy_blue"
	self.colors.light_brown_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_navy_blue.value = 2
	self.colors.orange_purple = {}
	self.colors.orange_purple.colors = {
		orange,
		purple
	}
	self.colors.orange_purple.name_id = "bm_clr_orange_purple"
	self.colors.orange_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_purple.value = 2
	self.colors.light_blue_brown = {}
	self.colors.light_blue_brown.colors = {
		light_blue,
		brown
	}
	self.colors.light_blue_brown.name_id = "bm_clr_light_blue_brown"
	self.colors.light_blue_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_brown.value = 3
	self.colors.green_blood_red = {}
	self.colors.green_blood_red.colors = {
		green,
		blood_red
	}
	self.colors.green_blood_red.name_id = "bm_clr_green_blood_red"
	self.colors.green_blood_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.green_blood_red.value = 4
	self.colors.cyan_blue = {}
	self.colors.cyan_blue.colors = {
		cyan,
		blue
	}
	self.colors.cyan_blue.name_id = "bm_clr_cyan_blue"
	self.colors.cyan_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cyan_blue.value = 5
	self.colors.yellow_orange = {}
	self.colors.yellow_orange.colors = {
		yellow,
		orange
	}
	self.colors.yellow_orange.name_id = "bm_clr_yellow_orange"
	self.colors.yellow_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_orange.value = 6
	self.colors.light_gray_dark_gray = {}
	self.colors.light_gray_dark_gray.colors = {
		light_gray,
		dark_gray
	}
	self.colors.light_gray_dark_gray.name_id = "bm_clr_light_gray_dark_gray"
	self.colors.light_gray_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_gray_dark_gray.value = 2
	self.colors.gray_black = {}
	self.colors.gray_black.colors = {
		gray,
		black
	}
	self.colors.gray_black.name_id = "bm_clr_gray_black"
	self.colors.gray_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_black.value = 3
	self.colors.white_dark_gray = {}
	self.colors.white_dark_gray.colors = {
		white,
		dark_gray
	}
	self.colors.white_dark_gray.name_id = "bm_clr_white_dark_gray"
	self.colors.white_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_dark_gray.value = 6
	self.colors.white_brown = {}
	self.colors.white_brown.colors = {
		white,
		brown
	}
	self.colors.white_brown.name_id = "bm_clr_white_brown"
	self.colors.white_brown.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_brown.value = 3
	self.colors.white_navy_blue = {}
	self.colors.white_navy_blue.colors = {
		white,
		navy_blue
	}
	self.colors.white_navy_blue.name_id = "bm_clr_white_navy_blue"
	self.colors.white_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_navy_blue.value = 4
	self.colors.white_purple = {}
	self.colors.white_purple.colors = {
		white,
		purple
	}
	self.colors.white_purple.name_id = "bm_clr_white_purple"
	self.colors.white_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_purple.value = 2
	self.colors.black_coral_red = {}
	self.colors.black_coral_red.colors = {
		black,
		coral_red
	}
	self.colors.black_coral_red.name_id = "bm_clr_black_coral_red"
	self.colors.black_coral_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_coral_red.value = 3
	self.colors.black_orange = {}
	self.colors.black_orange.colors = {
		black,
		orange
	}
	self.colors.black_orange.name_id = "bm_clr_black_orange"
	self.colors.black_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_orange.value = 4
	self.colors.black_cobalt_blue = {}
	self.colors.black_cobalt_blue.colors = {
		black,
		cobalt_blue
	}
	self.colors.black_cobalt_blue.name_id = "bm_clr_black_cobalt_blue"
	self.colors.black_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_cobalt_blue.value = 2
	self.colors.black_leaf_green = {}
	self.colors.black_leaf_green.colors = {
		black,
		leaf_green
	}
	self.colors.black_leaf_green.name_id = "bm_clr_black_leaf_green"
	self.colors.black_leaf_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_leaf_green.value = 3
	self.colors.red_white = {}
	self.colors.red_white.colors = {
		red,
		white
	}
	self.colors.red_white.name_id = "bm_clr_red_white"
	self.colors.red_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_white.value = 4
	self.colors.leaf_green_white = {}
	self.colors.leaf_green_white.colors = {
		leaf_green,
		white
	}
	self.colors.leaf_green_white.name_id = "bm_clr_leaf_green_white"
	self.colors.leaf_green_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_white.value = 2
	self.colors.orange_white = {}
	self.colors.orange_white.colors = {
		orange,
		white
	}
	self.colors.orange_white.name_id = "bm_clr_orange_white"
	self.colors.orange_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_white.value = 3
	self.colors.cobalt_blue_white = {}
	self.colors.cobalt_blue_white.colors = {
		cobalt_blue,
		white
	}
	self.colors.cobalt_blue_white.name_id = "bm_clr_cobalt_blue_white"
	self.colors.cobalt_blue_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_white.value = 4
	self.colors.warm_yellow_white = {}
	self.colors.warm_yellow_white.colors = {
		warm_yellow,
		white
	}
	self.colors.warm_yellow_white.name_id = "bm_clr_warm_yellow_white"
	self.colors.warm_yellow_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_white.value = 3
	self.colors.black_bright_yellow = {}
	self.colors.black_bright_yellow.colors = {
		black,
		bright_yellow
	}
	self.colors.black_bright_yellow.name_id = "bm_clr_black_bright_yellow"
	self.colors.black_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_bright_yellow.value = 2
	self.colors.warm_yellow_bright_yellow = {}
	self.colors.warm_yellow_bright_yellow.colors = {
		warm_yellow,
		bright_yellow
	}
	self.colors.warm_yellow_bright_yellow.name_id = "bm_clr_warm_yellow_bright_yellow"
	self.colors.warm_yellow_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_bright_yellow.value = 3
	self.colors.black_magenta = {}
	self.colors.black_magenta.colors = {
		black,
		magenta
	}
	self.colors.black_magenta.name_id = "bm_clr_black_magenta"
	self.colors.black_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_magenta.value = 4
	self.colors.navy_blue_light_blue = {}
	self.colors.navy_blue_light_blue.colors = {
		navy_blue,
		light_blue
	}
	self.colors.navy_blue_light_blue.name_id = "bm_clr_navy_blue_light_blue"
	self.colors.navy_blue_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.navy_blue_light_blue.value = 2
	self.colors.dark_red_orange = {}
	self.colors.dark_red_orange.colors = {
		dark_red,
		orange
	}
	self.colors.dark_red_orange.name_id = "bm_clr_dark_red_orange"
	self.colors.dark_red_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_orange.value = 3
	self.colors.scary_green_solid = {}
	self.colors.scary_green_solid.colors = {
		scary_green,
		scary_green
	}
	self.colors.scary_green_solid.name_id = "bm_clr_scary_green"
	self.colors.scary_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.scary_green_solid.value = 5
	self.colors.dark_purple_solid = {}
	self.colors.dark_purple_solid.colors = {
		dark_purple,
		dark_purple
	}
	self.colors.dark_purple_solid.name_id = "bm_clr_dark_purple"
	self.colors.dark_purple_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_purple_solid.value = 5
	self.colors.sea_blue_solid = {}
	self.colors.sea_blue_solid.colors = {
		sea_blue,
		sea_blue
	}
	self.colors.sea_blue_solid.name_id = "bm_clr_sea_blue"
	self.colors.sea_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_blue_solid.value = 5
	self.colors.skin_pink_solid = {}
	self.colors.skin_pink_solid.colors = {
		skin_pink,
		skin_pink
	}
	self.colors.skin_pink_solid.name_id = "bm_clr_skin_pink"
	self.colors.skin_pink_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.skin_pink_solid.value = 5
	self.colors.black_red = {}
	self.colors.black_red.colors = {
		black,
		red
	}
	self.colors.black_red.name_id = "bm_clr_black_red"
	self.colors.black_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_red.value = 1
	self.colors.blue_yellow = {}
	self.colors.blue_yellow.colors = {
		blue,
		yellow
	}
	self.colors.blue_yellow.name_id = "bm_clr_blue_yellow"
	self.colors.blue_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_yellow.value = 5
	self.colors.blue_red = {}
	self.colors.blue_red.colors = {
		blue,
		red
	}
	self.colors.blue_red.name_id = "bm_clr_blue_red"
	self.colors.blue_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_red.value = 2
	self.colors.dark_grey_light_gray = {}
	self.colors.dark_grey_light_gray.colors = {
		dark_gray,
		light_gray
	}
	self.colors.dark_grey_light_gray.name_id = "bm_clr_dark_grey_light_gray"
	self.colors.dark_grey_light_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_grey_light_gray.value = 3
	self.colors.orange_yellow = {}
	self.colors.orange_yellow.colors = {
		orange,
		yellow
	}
	self.colors.orange_yellow.name_id = "bm_clr_orange_yellow"
	self.colors.orange_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_yellow.value = 6
	self.colors.black_gray = {}
	self.colors.black_gray.colors = {
		black,
		gray
	}
	self.colors.black_gray.name_id = "bm_clr_black_gray"
	self.colors.black_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_gray.value = 3
	self.colors.orange_black = {}
	self.colors.orange_black.colors = {
		orange,
		black
	}
	self.colors.orange_black.name_id = "bm_clr_orange_black"
	self.colors.orange_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_black.value = 4
	self.colors.white_red = {}
	self.colors.white_red.colors = {
		white,
		red
	}
	self.colors.white_red.name_id = "bm_clr_white_red"
	self.colors.white_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_red.value = 4
	self.colors.bright_yellow_black = {}
	self.colors.bright_yellow_black.colors = {
		bright_yellow,
		black
	}
	self.colors.bright_yellow_black.name_id = "bm_clr_bright_yellow_black"
	self.colors.bright_yellow_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_black.value = 2
	self.colors.scary_green_black = {}
	self.colors.scary_green_black.colors = {
		scary_green,
		black
	}
	self.colors.scary_green_black.name_id = "bm_clr_scary_green_black"
	self.colors.scary_green_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.scary_green_black.value = 3
	self.colors.skin_pink_black = {}
	self.colors.skin_pink_black.colors = {
		skin_pink,
		black
	}
	self.colors.skin_pink_black.name_id = "bm_clr_skin_pink_black"
	self.colors.skin_pink_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.skin_pink_black.value = 3
	self.colors.sea_blue_black = {}
	self.colors.sea_blue_black.colors = {
		sea_blue,
		black
	}
	self.colors.sea_blue_black.name_id = "bm_clr_sea_blue_black"
	self.colors.sea_blue_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_blue_black.value = 3
	self.colors.dark_purple_black = {}
	self.colors.dark_purple_black.colors = {
		dark_purple,
		black
	}
	self.colors.dark_purple_black.name_id = "bm_clr_dark_purple_black"
	self.colors.dark_purple_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_purple_black.value = 3
	self.colors.scary_green_white = {}
	self.colors.scary_green_white.colors = {
		scary_green,
		white
	}
	self.colors.scary_green_white.name_id = "bm_clr_scary_green_white"
	self.colors.scary_green_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.scary_green_white.value = 3
	self.colors.skin_pink_white = {}
	self.colors.skin_pink_white.colors = {
		skin_pink,
		white
	}
	self.colors.skin_pink_white.name_id = "bm_clr_skin_pink_white"
	self.colors.skin_pink_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.skin_pink_white.value = 3
	self.colors.sea_blue_white = {}
	self.colors.sea_blue_white.colors = {
		sea_blue,
		white
	}
	self.colors.sea_blue_white.name_id = "bm_clr_sea_blue_white"
	self.colors.sea_blue_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_blue_white.value = 3
	self.colors.dark_purple_white = {}
	self.colors.dark_purple_white.colors = {
		dark_purple,
		white
	}
	self.colors.dark_purple_white.name_id = "bm_clr_dark_purple_white"
	self.colors.dark_purple_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_purple_white.value = 3
	self.colors.scary_green_red = {}
	self.colors.scary_green_red.colors = {
		scary_green,
		red
	}
	self.colors.scary_green_red.name_id = "bm_clr_scary_green_red"
	self.colors.scary_green_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.scary_green_red.value = 3
	self.colors.skin_pink_red = {}
	self.colors.skin_pink_red.colors = {
		skin_pink,
		red
	}
	self.colors.skin_pink_red.name_id = "bm_clr_skin_pink_red"
	self.colors.skin_pink_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.skin_pink_red.value = 3
	self.colors.sea_blue_red = {}
	self.colors.sea_blue_red.colors = {
		sea_blue,
		red
	}
	self.colors.sea_blue_red.name_id = "bm_clr_sea_blue_red"
	self.colors.sea_blue_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_blue_red.value = 3
	self.colors.dark_purple_red = {}
	self.colors.dark_purple_red.colors = {
		dark_purple,
		red
	}
	self.colors.dark_purple_red.name_id = "bm_clr_dark_purple_red"
	self.colors.dark_purple_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_purple_red.value = 3
	self.colors.scary_green_green = {}
	self.colors.scary_green_green.colors = {
		scary_green,
		green
	}
	self.colors.scary_green_green.name_id = "bm_clr_scary_green_green"
	self.colors.scary_green_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.scary_green_green.value = 3
	self.colors.skin_pink_green = {}
	self.colors.skin_pink_green.colors = {
		skin_pink,
		green
	}
	self.colors.skin_pink_green.name_id = "bm_clr_skin_pink_green"
	self.colors.skin_pink_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.skin_pink_green.value = 3
	self.colors.sea_blue_green = {}
	self.colors.sea_blue_green.colors = {
		sea_blue,
		green
	}
	self.colors.sea_blue_green.name_id = "bm_clr_sea_blue_green"
	self.colors.sea_blue_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_blue_green.value = 3
	self.colors.dark_purple_green = {}
	self.colors.dark_purple_green.colors = {
		dark_purple,
		green
	}
	self.colors.dark_purple_green.name_id = "bm_clr_dark_purple_green"
	self.colors.dark_purple_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_purple_green.value = 3
	self.colors.scary_green_blue = {}
	self.colors.scary_green_blue.colors = {
		scary_green,
		blue
	}
	self.colors.scary_green_blue.name_id = "bm_clr_scary_green_blue"
	self.colors.scary_green_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.scary_green_blue.value = 3
	self.colors.skin_pink_blue = {}
	self.colors.skin_pink_blue.colors = {
		skin_pink,
		blue
	}
	self.colors.skin_pink_blue.name_id = "bm_clr_skin_pink_blue"
	self.colors.skin_pink_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.skin_pink_blue.value = 3
	self.colors.sea_blue_blue = {}
	self.colors.sea_blue_blue.colors = {
		sea_blue,
		blue
	}
	self.colors.sea_blue_blue.name_id = "bm_clr_sea_blue_blue"
	self.colors.sea_blue_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_blue_blue.value = 3
	self.colors.dark_purple_blue = {}
	self.colors.dark_purple_blue.colors = {
		dark_purple,
		blue
	}
	self.colors.dark_purple_blue.name_id = "bm_clr_dark_purple_blue"
	self.colors.dark_purple_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_purple_blue.value = 3
	self.colors.scary_green_yellow = {}
	self.colors.scary_green_yellow.colors = {
		scary_green,
		yellow
	}
	self.colors.scary_green_yellow.name_id = "bm_clr_scary_green_yellow"
	self.colors.scary_green_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.scary_green_yellow.value = 3
	self.colors.skin_pink_yellow = {}
	self.colors.skin_pink_yellow.colors = {
		skin_pink,
		yellow
	}
	self.colors.skin_pink_yellow.name_id = "bm_clr_skin_pink_yellow"
	self.colors.skin_pink_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.skin_pink_yellow.value = 3
	self.colors.sea_blue_yellow = {}
	self.colors.sea_blue_yellow.colors = {
		sea_blue,
		yellow
	}
	self.colors.sea_blue_yellow.name_id = "bm_clr_sea_blue_yellow"
	self.colors.sea_blue_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_blue_yellow.value = 3
	self.colors.dark_purple_yellow = {}
	self.colors.dark_purple_yellow.colors = {
		dark_purple,
		yellow
	}
	self.colors.dark_purple_yellow.name_id = "bm_clr_dark_purple_yellow"
	self.colors.dark_purple_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_purple_yellow.value = 3
	self.colors.scary_green_gray = {}
	self.colors.scary_green_gray.colors = {
		scary_green,
		gray
	}
	self.colors.scary_green_gray.name_id = "bm_clr_scary_green_gray"
	self.colors.scary_green_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.scary_green_gray.value = 3
	self.colors.skin_pink_gray = {}
	self.colors.skin_pink_gray.colors = {
		skin_pink,
		gray
	}
	self.colors.skin_pink_gray.name_id = "bm_clr_skin_pink_gray"
	self.colors.skin_pink_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.skin_pink_gray.value = 3
	self.colors.sea_blue_gray = {}
	self.colors.sea_blue_gray.colors = {
		sea_blue,
		gray
	}
	self.colors.sea_blue_gray.name_id = "bm_clr_sea_blue_gray"
	self.colors.sea_blue_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_blue_gray.value = 3
	self.colors.dark_purple_gray = {}
	self.colors.dark_purple_gray.colors = {
		dark_purple,
		gray
	}
	self.colors.dark_purple_gray.name_id = "bm_clr_dark_purple_gray"
	self.colors.dark_purple_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_purple_gray.value = 3
	self.colors.scary_green_orange = {}
	self.colors.scary_green_orange.colors = {
		scary_green,
		orange
	}
	self.colors.scary_green_orange.name_id = "bm_clr_scary_green_orange"
	self.colors.scary_green_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.scary_green_orange.value = 3
	self.colors.skin_pink_orange = {}
	self.colors.skin_pink_orange.colors = {
		skin_pink,
		orange
	}
	self.colors.skin_pink_orange.name_id = "bm_clr_skin_pink_orange"
	self.colors.skin_pink_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.skin_pink_orange.value = 3
	self.colors.sea_blue_orange = {}
	self.colors.sea_blue_orange.colors = {
		sea_blue,
		orange
	}
	self.colors.sea_blue_orange.name_id = "bm_clr_sea_blue_orange"
	self.colors.sea_blue_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_blue_orange.value = 3
	self.colors.dark_purple_orange = {}
	self.colors.dark_purple_orange.colors = {
		dark_purple,
		orange
	}
	self.colors.dark_purple_orange.name_id = "bm_clr_dark_purple_orange"
	self.colors.dark_purple_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_purple_orange.value = 3
	self.colors.red_gray = {}
	self.colors.red_gray.colors = {
		red,
		gray
	}
	self.colors.red_gray.name_id = "bm_clr_red_grey"
	self.colors.red_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_gray.value = 3
	self.colors.red_scary_green = {}
	self.colors.red_scary_green.colors = {
		red,
		scary_green
	}
	self.colors.red_scary_green.name_id = "bm_clr_red_scary_green"
	self.colors.red_scary_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_scary_green.value = 3
	self.colors.red_dark_gray = {}
	self.colors.red_dark_gray.colors = {
		red,
		dark_gray
	}
	self.colors.red_dark_gray.name_id = "bm_clr_red_dark_grey"
	self.colors.red_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_dark_gray.value = 3
	self.colors.red_orange = {}
	self.colors.red_orange.colors = {
		red,
		orange
	}
	self.colors.red_orange.name_id = "bm_clr_red_orange"
	self.colors.red_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.red_orange.value = 3
	self.colors.orange_gray = {}
	self.colors.orange_gray.colors = {
		orange,
		gray
	}
	self.colors.orange_gray.name_id = "bm_clr_orange_gray"
	self.colors.orange_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_gray.value = 3
	self.colors.orange_turquoise = {}
	self.colors.orange_turquoise.colors = {
		orange,
		turquoise
	}
	self.colors.orange_turquoise.name_id = "bm_clr_orange_turquoise"
	self.colors.orange_turquoise.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.orange_turquoise.value = 8
	self.colors.warm_yellow_light_blue = {}
	self.colors.warm_yellow_light_blue.colors = {
		warm_yellow,
		light_blue
	}
	self.colors.warm_yellow_light_blue.name_id = "bm_clr_warm_yellow_light_blue"
	self.colors.warm_yellow_light_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_light_blue.value = 3
	self.colors.warm_yellow_purple = {}
	self.colors.warm_yellow_purple.colors = {
		warm_yellow,
		purple
	}
	self.colors.warm_yellow_purple.name_id = "bm_clr_warm_yellow_purple"
	self.colors.warm_yellow_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_purple.value = 3
	self.colors.warm_yellow_solid = {}
	self.colors.warm_yellow_solid.colors = {
		warm_yellow,
		warm_yellow
	}
	self.colors.warm_yellow_solid.name_id = "bm_clr_warm_yellow_solid"
	self.colors.warm_yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_solid.value = 3
	self.colors.warm_yellow_dark_red = {}
	self.colors.warm_yellow_dark_red.colors = {
		warm_yellow,
		dark_red
	}
	self.colors.warm_yellow_dark_red.name_id = "bm_clr_warm_yellow_dark_red"
	self.colors.warm_yellow_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.warm_yellow_dark_red.value = 3
	self.colors.turquoise_black = {}
	self.colors.turquoise_black.colors = {
		turquoise,
		black
	}
	self.colors.turquoise_black.name_id = "bm_clr_turquoise_black"
	self.colors.turquoise_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_black.value = 2
	self.colors.turquoise_white = {}
	self.colors.turquoise_white.colors = {
		turquoise,
		white
	}
	self.colors.turquoise_white.name_id = "bm_clr_turquoise_white"
	self.colors.turquoise_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_white.value = 2
	self.colors.turquoise_warm_yellow = {}
	self.colors.turquoise_warm_yellow.colors = {
		turquoise,
		warm_yellow
	}
	self.colors.turquoise_warm_yellow.name_id = "bm_clr_turquoise_warm_yellow"
	self.colors.turquoise_warm_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_warm_yellow.value = 2
	self.colors.turquoise_solid = {}
	self.colors.turquoise_solid.colors = {
		turquoise,
		turquoise
	}
	self.colors.turquoise_solid.name_id = "bm_clr_turquoise_solid"
	self.colors.turquoise_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_solid.value = 2
	self.colors.turquoise_gray = {}
	self.colors.turquoise_gray.colors = {
		turquoise,
		gray
	}
	self.colors.turquoise_gray.name_id = "bm_clr_turquoise_gray"
	self.colors.turquoise_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_gray.value = 2
	self.colors.blue_white = {}
	self.colors.blue_white.colors = {
		blue,
		white
	}
	self.colors.blue_white.name_id = "bm_clr_blue_white"
	self.colors.blue_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_white.value = 2
	self.colors.blue_black = {}
	self.colors.blue_black.colors = {
		blue,
		black
	}
	self.colors.blue_black.name_id = "bm_clr_blue_black"
	self.colors.blue_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_black.value = 2
	self.colors.blue_navy_blue = {}
	self.colors.blue_navy_blue.colors = {
		blue,
		navy_blue
	}
	self.colors.blue_navy_blue.name_id = "bm_clr_blue_navy_blue"
	self.colors.blue_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_navy_blue.value = 2
	self.colors.blue_gray = {}
	self.colors.blue_gray.colors = {
		blue,
		gray
	}
	self.colors.blue_gray.name_id = "bm_clr_blue_gray"
	self.colors.blue_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_gray.value = 2
	self.colors.white_yellow = {}
	self.colors.white_yellow.colors = {
		white,
		yellow
	}
	self.colors.white_yellow.name_id = "bm_clr_white_yellow"
	self.colors.white_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_yellow.value = 3
	self.colors.white_orange = {}
	self.colors.white_orange.colors = {
		white,
		orange
	}
	self.colors.white_orange.name_id = "bm_clr_white_orange"
	self.colors.white_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_orange.value = 3
	self.colors.white_dark_red = {}
	self.colors.white_dark_red.colors = {
		white,
		dark_red
	}
	self.colors.white_dark_red.name_id = "bm_clr_white_dark_red"
	self.colors.white_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_dark_red.value = 3
	self.colors.white_cyan = {}
	self.colors.white_cyan.colors = {
		white,
		cyan
	}
	self.colors.white_cyan.name_id = "bm_clr_white_cyan"
	self.colors.white_cyan.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_cyan.value = 3
	self.colors.white_scary_green = {}
	self.colors.white_scary_green.colors = {
		white,
		scary_green
	}
	self.colors.white_scary_green.name_id = "bm_clr_white_scary_green"
	self.colors.white_scary_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.white_scary_green.value = 3
	self.colors.dark_gray_white = {}
	self.colors.dark_gray_white.colors = {
		dark_gray,
		white
	}
	self.colors.dark_gray_white.name_id = "bm_clr_dark_gray_white"
	self.colors.dark_gray_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_white.value = 3
	self.colors.dark_gray_black = {}
	self.colors.dark_gray_black.colors = {
		dark_gray,
		black
	}
	self.colors.dark_gray_black.name_id = "bm_clr_dark_gray_black"
	self.colors.dark_gray_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_black.value = 3
	self.colors.dark_gray_coral_red = {}
	self.colors.dark_gray_coral_red.colors = {
		dark_gray,
		coral_red
	}
	self.colors.dark_gray_coral_red.name_id = "bm_clr_dark_gray_coral_red"
	self.colors.dark_gray_coral_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_coral_red.value = 3
	self.colors.dark_gray_cobalt_blue = {}
	self.colors.dark_gray_cobalt_blue.colors = {
		dark_gray,
		cobalt_blue
	}
	self.colors.dark_gray_cobalt_blue.name_id = "bm_clr_dark_gray_cobalt_blue"
	self.colors.dark_gray_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_cobalt_blue.value = 3
	self.colors.dark_gray_turquoise = {}
	self.colors.dark_gray_turquoise.colors = {
		dark_gray,
		turquoise
	}
	self.colors.dark_gray_turquoise.name_id = "bm_clr_dark_gray_turquoise"
	self.colors.dark_gray_turquoise.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_turquoise.value = 3
	self.colors.dark_gray_green = {}
	self.colors.dark_gray_green.colors = {
		dark_gray,
		green
	}
	self.colors.dark_gray_green.name_id = "bm_clr_dark_gray_green"
	self.colors.dark_gray_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_green.value = 3
	self.colors.dark_gray_yellow = {}
	self.colors.dark_gray_yellow.colors = {
		dark_gray,
		yellow
	}
	self.colors.dark_gray_yellow.name_id = "bm_clr_dark_gray_yellow"
	self.colors.dark_gray_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_yellow.value = 3
	self.colors.dark_gray_magenta = {}
	self.colors.dark_gray_magenta.colors = {
		dark_gray,
		magenta
	}
	self.colors.dark_gray_magenta.name_id = "bm_clr_dark_gray_magenta"
	self.colors.dark_gray_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_magenta.value = 3
	self.colors.dark_gray_dark_red = {}
	self.colors.dark_gray_dark_red.colors = {
		dark_gray,
		dark_red
	}
	self.colors.dark_gray_dark_red.name_id = "bm_clr_dark_gray_dark_red"
	self.colors.dark_gray_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_dark_red.value = 3
	self.colors.dark_gray_purple = {}
	self.colors.dark_gray_purple.colors = {
		dark_gray,
		purple
	}
	self.colors.dark_gray_purple.name_id = "bm_clr_dark_gray_purple"
	self.colors.dark_gray_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_purple.value = 3
	self.colors.dark_gray_bright_yellow = {}
	self.colors.dark_gray_bright_yellow.colors = {
		dark_gray,
		bright_yellow
	}
	self.colors.dark_gray_bright_yellow.name_id = "bm_clr_dark_gray_bright_yellow"
	self.colors.dark_gray_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_gray_bright_yellow.value = 3
	self.colors.coral_red_white = {}
	self.colors.coral_red_white.colors = {
		coral_red,
		white
	}
	self.colors.coral_red_white.name_id = "bm_clr_coral_red_white"
	self.colors.coral_red_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_white.value = 3
	self.colors.coral_red_dark_gray = {}
	self.colors.coral_red_dark_gray.colors = {
		coral_red,
		dark_gray
	}
	self.colors.coral_red_dark_gray.name_id = "bm_clr_coral_red_dark_gray"
	self.colors.coral_red_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_dark_gray.value = 3
	self.colors.coral_red_black = {}
	self.colors.coral_red_black.colors = {
		coral_red,
		black
	}
	self.colors.coral_red_black.name_id = "bm_clr_coral_red_black"
	self.colors.coral_red_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_black.value = 3
	self.colors.coral_red_light_gray = {}
	self.colors.coral_red_light_gray.colors = {
		coral_red,
		light_gray
	}
	self.colors.coral_red_light_gray.name_id = "bm_clr_coral_red_light_gray"
	self.colors.coral_red_light_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_light_gray.value = 3
	self.colors.coral_red_solid = {}
	self.colors.coral_red_solid.colors = {
		coral_red,
		coral_red
	}
	self.colors.coral_red_solid.name_id = "bm_clr_coral_red_solid"
	self.colors.coral_red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coral_red_solid.value = 3
	self.colors.dark_red_red = {}
	self.colors.dark_red_red.colors = {
		dark_red,
		red
	}
	self.colors.dark_red_red.name_id = "bm_clr_dark_red_red"
	self.colors.dark_red_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_red.value = 3
	self.colors.dark_red_bright_yellow = {}
	self.colors.dark_red_bright_yellow.colors = {
		dark_red,
		bright_yellow
	}
	self.colors.dark_red_bright_yellow.name_id = "bm_clr_dark_red_bright_yellow"
	self.colors.dark_red_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_bright_yellow.value = 3
	self.colors.dark_red_black = {}
	self.colors.dark_red_black.colors = {
		dark_red,
		black
	}
	self.colors.dark_red_black.name_id = "bm_clr_dark_red_black"
	self.colors.dark_red_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_black.value = 3
	self.colors.dark_red_gray = {}
	self.colors.dark_red_gray.colors = {
		dark_red,
		gray
	}
	self.colors.dark_red_gray.name_id = "bm_clr_dark_gray"
	self.colors.dark_red_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_red_gray.value = 3
	self.colors.blood_red_toxic_green = {}
	self.colors.blood_red_toxic_green.colors = {
		blood_red,
		toxic_green
	}
	self.colors.blood_red_toxic_green.name_id = "bm_clr_blood_red_toxic_green"
	self.colors.blood_red_toxic_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blood_red_toxic_green.value = 3
	self.colors.blood_red_cobalt_blue = {}
	self.colors.blood_red_cobalt_blue.colors = {
		blood_red,
		cobalt_blue
	}
	self.colors.blood_red_cobalt_blue.name_id = "bm_clr_blood_red_cobalt_blue"
	self.colors.blood_red_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blood_red_cobalt_blue.value = 3
	self.colors.light_brown_black = {}
	self.colors.light_brown_black.colors = {
		light_brown,
		black
	}
	self.colors.light_brown_black.name_id = "bm_clr_light_brown_black"
	self.colors.light_brown_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_black.value = 3
	self.colors.light_brown_white = {}
	self.colors.light_brown_white.colors = {
		light_brown,
		white
	}
	self.colors.light_brown_white.name_id = "bm_clr_light_brown_white"
	self.colors.light_brown_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_white.value = 3
	self.colors.light_brown_gray = {}
	self.colors.light_brown_gray.colors = {
		light_brown,
		gray
	}
	self.colors.light_brown_gray.name_id = "bm_clr_light_brown_gray"
	self.colors.light_brown_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_brown_gray.value = 3
	self.colors.bright_yellow_solid = {}
	self.colors.bright_yellow_solid.colors = {
		bright_yellow,
		bright_yellow
	}
	self.colors.bright_yellow_solid.name_id = "bm_clr_bright_yellow_solid"
	self.colors.bright_yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_solid.value = 3
	self.colors.bright_yellow_dark_red = {}
	self.colors.bright_yellow_dark_red.colors = {
		bright_yellow,
		dark_red
	}
	self.colors.bright_yellow_dark_red.name_id = "bm_clr_bright_yellow_dark_red"
	self.colors.bright_yellow_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bright_yellow_dark_red.value = 3
	self.colors.turquoise_black = {}
	self.colors.turquoise_black.colors = {
		turquoise,
		black
	}
	self.colors.turquoise_black.name_id = "bm_clr_turquoise_black"
	self.colors.turquoise_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.turquoise_black.value = 2
	self.colors.purple_black = {}
	self.colors.purple_black.colors = {
		purple,
		black
	}
	self.colors.purple_black.name_id = "bm_clr_purple_black"
	self.colors.purple_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.purple_black.value = 2
	self.colors.purple_white = {}
	self.colors.purple_white.colors = {
		purple,
		white
	}
	self.colors.purple_white.name_id = "bm_clr_purple_white"
	self.colors.purple_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.purple_white.value = 2
	self.colors.purple_cyan = {}
	self.colors.purple_cyan.colors = {
		purple,
		cyan
	}
	self.colors.purple_cyan.name_id = "bm_clr_purple_cyan"
	self.colors.purple_cyan.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.purple_cyan.value = 2
	self.colors.black_cyan = {}
	self.colors.black_cyan.colors = {
		black,
		cyan
	}
	self.colors.black_cyan.name_id = "bm_clr_black_cyan"
	self.colors.black_cyan.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_cyan.value = 2
	self.colors.black_green = {}
	self.colors.black_green.colors = {
		black,
		green
	}
	self.colors.black_green.name_id = "bm_clr_black_green"
	self.colors.black_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_green.value = 2
	self.colors.black_yellow = {}
	self.colors.black_yellow.colors = {
		black,
		yellow
	}
	self.colors.black_yellow.name_id = "bm_clr_black_yellow"
	self.colors.black_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_yellow.value = 2
	self.colors.black_gray = {}
	self.colors.black_gray.colors = {
		black,
		gray
	}
	self.colors.black_gray.name_id = "bm_clr_black_gray"
	self.colors.black_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.black_gray.value = 2
	self.colors.yellow_black = {}
	self.colors.yellow_black.colors = {
		yellow,
		black
	}
	self.colors.yellow_black.name_id = "bm_clr_yellow_black"
	self.colors.yellow_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_black.value = 2
	self.colors.yellow_white = {}
	self.colors.yellow_white.colors = {
		yellow,
		white
	}
	self.colors.yellow_white.name_id = "bm_clr_yellow_white"
	self.colors.yellow_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_white.value = 2
	self.colors.yellow_gray = {}
	self.colors.yellow_gray.colors = {
		yellow,
		gray
	}
	self.colors.yellow_gray.name_id = "bm_clr_yellow_gray"
	self.colors.yellow_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_gray.value = 2
	self.colors.yellow_dark_gray = {}
	self.colors.yellow_dark_gray.colors = {
		yellow,
		dark_gray
	}
	self.colors.yellow_dark_gray.name_id = "bm_clr_yellow_dark_gray"
	self.colors.yellow_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_dark_gray.value = 2
	self.colors.yellow_red = {}
	self.colors.yellow_red.colors = {
		yellow,
		red
	}
	self.colors.yellow_red.name_id = "bm_clr_yellow_red"
	self.colors.yellow_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.yellow_red.value = 2
	self.colors.leaf_green_black = {}
	self.colors.leaf_green_black.colors = {
		leaf_green,
		black
	}
	self.colors.leaf_green_black.name_id = "bm_clr_leaf_green_black"
	self.colors.leaf_green_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_black.value = 2
	self.colors.leaf_green_dark_green = {}
	self.colors.leaf_green_dark_green.colors = {
		leaf_green,
		dark_green
	}
	self.colors.leaf_green_dark_green.name_id = "bm_clr_leaf_green_dark_green"
	self.colors.leaf_green_dark_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.leaf_green_dark_green.value = 2
	self.colors.dark_green_leaf_green = {}
	self.colors.dark_green_leaf_green.colors = {
		dark_green,
		leaf_green
	}
	self.colors.dark_green_leaf_green.name_id = "bm_clr_dark_green_leaf_green"
	self.colors.dark_green_leaf_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_green_leaf_green.value = 2
	self.colors.cobalt_blue_solid = {}
	self.colors.cobalt_blue_solid.colors = {
		cobalt_blue,
		cobalt_blue
	}
	self.colors.cobalt_blue_solid.name_id = "bm_clr_cobalt_blue_solid"
	self.colors.cobalt_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_solid.value = 4
	self.colors.cobalt_blue_warm_yellow = {}
	self.colors.cobalt_blue_warm_yellow.colors = {
		cobalt_blue,
		warm_yellow
	}
	self.colors.cobalt_blue_warm_yellow.name_id = "bm_clr_cobalt_blue_warm_yellow"
	self.colors.cobalt_blue_warm_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_warm_yellow.value = 4
	self.colors.cobalt_blue_gray = {}
	self.colors.cobalt_blue_gray.colors = {
		cobalt_blue,
		gray
	}
	self.colors.cobalt_blue_gray.name_id = "bm_clr_cobalt_blue_gray"
	self.colors.cobalt_blue_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_gray.value = 4
	self.colors.cobalt_blue_orange = {}
	self.colors.cobalt_blue_orange.colors = {
		cobalt_blue,
		orange
	}
	self.colors.cobalt_blue_orange.name_id = "bm_clr_cobalt_blue_orange"
	self.colors.cobalt_blue_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_orange.value = 4
	self.colors.cobalt_blue_black = {}
	self.colors.cobalt_blue_black.colors = {
		cobalt_blue,
		black
	}
	self.colors.cobalt_blue_black.name_id = "bm_clr_cobalt_blue_black"
	self.colors.cobalt_blue_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cobalt_blue_black.value = 4
	self.colors.magenta_black = {}
	self.colors.magenta_black.colors = {
		magenta,
		black
	}
	self.colors.magenta_black.name_id = "bm_clr_magenta_black"
	self.colors.magenta_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_black.value = 4
	self.colors.magenta_white = {}
	self.colors.magenta_white.colors = {
		magenta,
		white
	}
	self.colors.magenta_white.name_id = "bm_clr_magenta_white"
	self.colors.magenta_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_white.value = 4
	self.colors.magenta_yellow = {}
	self.colors.magenta_yellow.colors = {
		magenta,
		yellow
	}
	self.colors.magenta_yellow.name_id = "bm_clr_magenta_yellow"
	self.colors.magenta_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_yellow.value = 4
	self.colors.magenta_warm_yellow = {}
	self.colors.magenta_warm_yellow.colors = {
		magenta,
		warm_yellow
	}
	self.colors.magenta_warm_yellow.name_id = "bm_clr_magenta_warm_yellow"
	self.colors.magenta_warm_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_warm_yellow.value = 4
	self.colors.magenta_dark_gray = {}
	self.colors.magenta_dark_gray.colors = {
		magenta,
		dark_gray
	}
	self.colors.magenta_dark_gray.name_id = "bm_clr_magenta_dark_gray"
	self.colors.magenta_dark_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.magenta_dark_gray.value = 4
	self.colors.gray_white = {}
	self.colors.gray_white.colors = {
		gray,
		white
	}
	self.colors.gray_white.name_id = "bm_clr_gray_white"
	self.colors.gray_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_white.value = 4
	self.colors.gray_purple = {}
	self.colors.gray_purple.colors = {
		gray,
		purple
	}
	self.colors.gray_purple.name_id = "bm_clr_gray_purple"
	self.colors.gray_purple.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_purple.value = 4
	self.colors.gray_cobalt_blue = {}
	self.colors.gray_cobalt_blue.colors = {
		gray,
		cobalt_blue
	}
	self.colors.gray_cobalt_blue.name_id = "bm_clr_gray_cobalt_blue"
	self.colors.gray_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_cobalt_blue.value = 4
	self.colors.gray_turquoise = {}
	self.colors.gray_turquoise.colors = {
		gray,
		turquoise
	}
	self.colors.gray_turquoise.name_id = "bm_clr_gray_turquoise"
	self.colors.gray_turquoise.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_turquoise.value = 4
	self.colors.gray_green = {}
	self.colors.gray_green.colors = {
		gray,
		green
	}
	self.colors.gray_green.name_id = "bm_clr_gray_green"
	self.colors.gray_green.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_green.value = 4
	self.colors.gray_yellow = {}
	self.colors.gray_yellow.colors = {
		gray,
		yellow
	}
	self.colors.gray_yellow.name_id = "bm_clr_gray_yellow"
	self.colors.gray_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_yellow.value = 4
	self.colors.gray_magenta = {}
	self.colors.gray_magenta.colors = {
		gray,
		magenta
	}
	self.colors.gray_magenta.name_id = "bm_clr_gray_magenta"
	self.colors.gray_magenta.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_magenta.value = 4
	self.colors.gray_dark_red = {}
	self.colors.gray_dark_red.colors = {
		gray,
		dark_red
	}
	self.colors.gray_dark_red.name_id = "bm_clr_gray_dark_red"
	self.colors.gray_dark_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_dark_red.value = 4
	self.colors.gray_orange = {}
	self.colors.gray_orange.colors = {
		gray,
		orange
	}
	self.colors.gray_orange.name_id = "bm_clr_gray_orange"
	self.colors.gray_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_orange.value = 4
	self.colors.gray_red = {}
	self.colors.gray_red.colors = {
		gray,
		red
	}
	self.colors.gray_red.name_id = "bm_clr_gray_red"
	self.colors.gray_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_red.value = 4
	self.colors.gray_bright_yellow = {}
	self.colors.gray_bright_yellow.colors = {
		gray,
		bright_yellow
	}
	self.colors.gray_bright_yellow.name_id = "bm_clr_gray_bright_yellow"
	self.colors.gray_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.gray_bright_yellow.value = 4
	self.colors.light_blue_black = {}
	self.colors.light_blue_black.colors = {
		light_blue,
		black
	}
	self.colors.light_blue_black.name_id = "bm_clr_light_blue_black"
	self.colors.light_blue_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_black.value = 4
	self.colors.light_blue_white = {}
	self.colors.light_blue_white.colors = {
		light_blue,
		white
	}
	self.colors.light_blue_white.name_id = "bm_clr_light_blue_white"
	self.colors.light_blue_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_white.value = 4
	self.colors.light_blue_bright_yellow = {}
	self.colors.light_blue_bright_yellow.colors = {
		light_blue,
		bright_yellow
	}
	self.colors.light_blue_bright_yellow.name_id = "bm_clr_light_blue_bright_yellow"
	self.colors.light_blue_bright_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_bright_yellow.value = 4
	self.colors.light_blue_coral_red = {}
	self.colors.light_blue_coral_red.colors = {
		light_blue,
		coral_red
	}
	self.colors.light_blue_coral_red.name_id = "bm_clr_light_blue_coral_red"
	self.colors.light_blue_coral_red.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_coral_red.value = 4
	self.colors.light_blue_navy_blue = {}
	self.colors.light_blue_navy_blue.colors = {
		light_blue,
		navy_blue
	}
	self.colors.light_blue_navy_blue.name_id = "bm_clr_light_blue_navy_blue"
	self.colors.light_blue_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_navy_blue.value = 4
	self.colors.light_blue_orange = {}
	self.colors.light_blue_orange.colors = {
		light_blue,
		orange
	}
	self.colors.light_blue_orange.name_id = "bm_clr_light_blue_orange"
	self.colors.light_blue_orange.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.light_blue_orange.value = 4
	self.colors.pink_yellow = {}
	self.colors.pink_yellow.colors = {
		pink,
		yellow
	}
	self.colors.pink_yellow.name_id = "bm_clr_pink_yellow"
	self.colors.pink_yellow.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_yellow.value = 4
	self.colors.pink_cobalt_blue = {}
	self.colors.pink_cobalt_blue.colors = {
		pink,
		cobalt_blue
	}
	self.colors.pink_cobalt_blue.name_id = "bm_clr_pink_cobalt_blue"
	self.colors.pink_cobalt_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_cobalt_blue.value = 4
	self.colors.pink_black = {}
	self.colors.pink_black.colors = {
		pink,
		black
	}
	self.colors.pink_black.name_id = "bm_clr_pink_black"
	self.colors.pink_black.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_black.value = 4
	self.colors.pink_white = {}
	self.colors.pink_white.colors = {
		pink,
		white
	}
	self.colors.pink_white.name_id = "bm_clr_pink_white"
	self.colors.pink_white.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_white.value = 4
	self.colors.pink_navy_blue = {}
	self.colors.pink_navy_blue.colors = {
		pink,
		navy_blue
	}
	self.colors.pink_navy_blue.name_id = "bm_clr_pink_navy_blue"
	self.colors.pink_navy_blue.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_navy_blue.value = 4
	self.colors.pink_gray = {}
	self.colors.pink_gray.colors = {
		pink,
		gray
	}
	self.colors.pink_gray.name_id = "bm_clr_pink_gray"
	self.colors.pink_gray.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pink_gray.value = 4

	local neon_red = Color(255, 255, 0, 60) / 255
	local vivid_raspberry = Color(255, 255, 0, 10) / 255
	local fashion_fuchsia = Color(255, 255, 0, 176) / 255
	local vivid_orchid = Color(255, 204, 0, 255) / 255
	local electric_indigo = Color(255, 96, 0, 255) / 255
	local vivid_blue = Color(255, 0, 67, 255) / 255
	local brandeis_blue = Color(255, 0, 119, 255) / 255
	local vivid_sky_blue = Color(255, 0, 198, 255) / 255
	local aquamarine = Color(255, 125, 255, 222) / 255
	local sea_green = Color(255, 0, 255, 191) / 255
	local guppie_green = Color(255, 0, 255, 124) / 255
	local chartreuse = Color(255, 127, 255, 0) / 255
	local shadow_yellow = Color(162, 162, 97) / 255
	local rifle_green = Color(255, 71, 77, 63) / 255
	local congo_pink = Color(255, 255, 136, 117) / 255
	local coffee = Color(255, 107, 83, 55) / 255
	local heat_wave = Color(255, 255, 121, 0) / 255
	local tickle_pink = Color(255, 255, 131, 181) / 255
	local rosebay = Color(255, 201, 150, 185) / 255
	local heliotrope = Color(255, 228, 121, 255) / 255
	local lavender = Color(255, 175, 126, 255) / 255
	local slate_blue = Color(255, 127, 127, 255) / 255
	local french_sky_blue = Color(255, 122, 157, 255) / 255
	local blithe_blue = Color(255, 144, 191, 191) / 255
	local mindaro = Color(255, 231, 255, 137) / 255
	local pastel_yellow = Color(255, 255, 255, 133) / 255
	local mellow_green = Color(255, 205, 205, 143) / 255
	local kilim_beige = Color(255, 216, 194, 174) / 255
	local sand = Color(255, 172, 141, 123) / 255
	local mud = Color(255, 105, 86, 75) / 255
	local baroness = Color(255, 173, 134, 172) / 255
	local blue_bell = Color(255, 168, 158, 208) / 255
	local bravo_blue = Color(255, 211, 227, 243) / 255
	local shadow_blue = Color(255, 121, 140, 162) / 255
	local haven = Color(255, 165, 187, 143) / 255
	local parisian_patina = Color(255, 124, 165, 130) / 255
	local may_green = Color(255, 71, 141, 71) / 255
	local fern_green = Color(255, 85, 127, 60) / 255
	local branch_green = Color(255, 93, 93, 49) / 255
	local coyote_brown = Color(255, 121, 105, 59) / 255
	local deep_green = Color(255, 51, 44, 25) / 255
	local twilight_lavender = Color(255, 131, 68, 111) / 255
	local cordovan = Color(255, 132, 63, 70) / 255
	local maximum_purple = Color(255, 118, 64, 132) / 255
	local deep_aquamarine = Color(255, 67, 139, 121) / 255
	local upsdell_red = Color(255, 166, 31, 44) / 255
	local dark_puce = Color(255, 81, 43, 58) / 255
	local imperial_purple = Color(255, 108, 0, 74) / 255
	local russian_violet = Color(255, 60, 38, 76) / 255
	local dark_slate_blue = Color(255, 73, 73, 147) / 255

	self.colors.neon_red_solid = {}
	self.colors.neon_red_solid.colors = {
		neon_red,
		neon_red
	}
	self.colors.neon_red_solid.name_id = "bm_clr_neon_red_solid"
	self.colors.neon_red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.neon_red_solid.value = 4
	self.colors.vivid_raspberry_solid = {}
	self.colors.vivid_raspberry_solid.colors = {
		vivid_raspberry,
		vivid_raspberry
	}
	self.colors.vivid_raspberry_solid.name_id = "bm_clr_vivid_raspberry_solid"
	self.colors.vivid_raspberry_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.vivid_raspberry_solid.value = 4
	self.colors.fashion_fuchsia_solid = {}
	self.colors.fashion_fuchsia_solid.colors = {
		fashion_fuchsia,
		fashion_fuchsia
	}
	self.colors.fashion_fuchsia_solid.name_id = "bm_clr_fashion_fuchsia_solid"
	self.colors.fashion_fuchsia_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.fashion_fuchsia_solid.value = 4
	self.colors.vivid_orchid_solid = {}
	self.colors.vivid_orchid_solid.colors = {
		vivid_orchid,
		vivid_orchid
	}
	self.colors.vivid_orchid_solid.name_id = "bm_clr_vivid_orchid_solid"
	self.colors.vivid_orchid_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.vivid_orchid_solid.value = 4
	self.colors.electric_indigo_solid = {}
	self.colors.electric_indigo_solid.colors = {
		electric_indigo,
		electric_indigo
	}
	self.colors.electric_indigo_solid.name_id = "bm_clr_electric_indigo_solid"
	self.colors.electric_indigo_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.electric_indigo_solid.value = 4
	self.colors.vivid_blue_solid = {}
	self.colors.vivid_blue_solid.colors = {
		vivid_blue,
		vivid_blue
	}
	self.colors.vivid_blue_solid.name_id = "bm_clr_vivid_blue_solid"
	self.colors.vivid_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.vivid_blue_solid.value = 4
	self.colors.brandeis_blue_solid = {}
	self.colors.brandeis_blue_solid.colors = {
		brandeis_blue,
		brandeis_blue
	}
	self.colors.brandeis_blue_solid.name_id = "bm_clr_brandeis_blue_solid"
	self.colors.brandeis_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.brandeis_blue_solid.value = 4
	self.colors.vivid_sky_blue_solid = {}
	self.colors.vivid_sky_blue_solid.colors = {
		vivid_sky_blue,
		vivid_sky_blue
	}
	self.colors.vivid_sky_blue_solid.name_id = "bm_clr_vivid_sky_blue_solid"
	self.colors.vivid_sky_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.vivid_sky_blue_solid.value = 4
	self.colors.aquamarine_solid = {}
	self.colors.aquamarine_solid.colors = {
		aquamarine,
		aquamarine
	}
	self.colors.aquamarine_solid.name_id = "bm_clr_aquamarine_solid"
	self.colors.aquamarine_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.aquamarine_solid.value = 4
	self.colors.sea_green_solid = {}
	self.colors.sea_green_solid.colors = {
		sea_green,
		sea_green
	}
	self.colors.sea_green_solid.name_id = "bm_clr_sea_green_solid"
	self.colors.sea_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sea_green_solid.value = 4
	self.colors.guppie_green_solid = {}
	self.colors.guppie_green_solid.colors = {
		guppie_green,
		guppie_green
	}
	self.colors.guppie_green_solid.name_id = "bm_clr_guppie_green_solid"
	self.colors.guppie_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.guppie_green_solid.value = 4
	self.colors.chartreuse_solid = {}
	self.colors.chartreuse_solid.colors = {
		chartreuse,
		chartreuse
	}
	self.colors.chartreuse_solid.name_id = "bm_clr_chartreuse_solid"
	self.colors.chartreuse_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.chartreuse_solid.value = 4
	self.colors.shadow_yellow_solid = {}
	self.colors.shadow_yellow_solid.colors = {
		shadow_yellow,
		shadow_yellow
	}
	self.colors.shadow_yellow_solid.name_id = "bm_clr_shadow_yellow_solid"
	self.colors.shadow_yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.shadow_yellow_solid.value = 4
	self.colors.rifle_green_solid = {}
	self.colors.rifle_green_solid.colors = {
		rifle_green,
		rifle_green
	}
	self.colors.rifle_green_solid.name_id = "bm_clr_rifle_green_solid"
	self.colors.rifle_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.rifle_green_solid.value = 4
	self.colors.congo_pink_solid = {}
	self.colors.congo_pink_solid.colors = {
		congo_pink,
		congo_pink
	}
	self.colors.congo_pink_solid.name_id = "bm_clr_congo_pink_solid"
	self.colors.congo_pink_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.congo_pink_solid.value = 4
	self.colors.coffee_solid = {}
	self.colors.coffee_solid.colors = {
		coffee,
		coffee
	}
	self.colors.coffee_solid.name_id = "bm_clr_coffee_solid"
	self.colors.coffee_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coffee_solid.value = 4
	self.colors.heat_wave_solid = {}
	self.colors.heat_wave_solid.colors = {
		heat_wave,
		heat_wave
	}
	self.colors.heat_wave_solid.name_id = "bm_clr_heat_wave_solid"
	self.colors.heat_wave_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.heat_wave_solid.value = 4
	self.colors.tickle_pink_solid = {}
	self.colors.tickle_pink_solid.colors = {
		tickle_pink,
		tickle_pink
	}
	self.colors.tickle_pink_solid.name_id = "bm_clr_tickle_pink_solid"
	self.colors.tickle_pink_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.tickle_pink_solid.value = 4
	self.colors.rosebay_solid = {}
	self.colors.rosebay_solid.colors = {
		rosebay,
		rosebay
	}
	self.colors.rosebay_solid.name_id = "bm_clr_rosebay_solid"
	self.colors.rosebay_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.rosebay_solid.value = 4
	self.colors.heliotrope_solid = {}
	self.colors.heliotrope_solid.colors = {
		heliotrope,
		heliotrope
	}
	self.colors.heliotrope_solid.name_id = "bm_clr_heliotrope_solid"
	self.colors.heliotrope_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.heliotrope_solid.value = 4
	self.colors.lavender_solid = {}
	self.colors.lavender_solid.colors = {
		lavender,
		lavender
	}
	self.colors.lavender_solid.name_id = "bm_clr_lavender_solid"
	self.colors.lavender_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.lavender_solid.value = 4
	self.colors.slate_blue_solid = {}
	self.colors.slate_blue_solid.colors = {
		slate_blue,
		slate_blue
	}
	self.colors.slate_blue_solid.name_id = "bm_clr_slate_blue_solid"
	self.colors.slate_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.slate_blue_solid.value = 4
	self.colors.french_sky_blue_solid = {}
	self.colors.french_sky_blue_solid.colors = {
		french_sky_blue,
		french_sky_blue
	}
	self.colors.french_sky_blue_solid.name_id = "bm_clr_french_sky_blue_solid"
	self.colors.french_sky_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.french_sky_blue_solid.value = 4
	self.colors.blithe_blue_solid = {}
	self.colors.blithe_blue_solid.colors = {
		blithe_blue,
		blithe_blue
	}
	self.colors.blithe_blue_solid.name_id = "bm_clr_blithe_blue_solid"
	self.colors.blithe_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blithe_blue_solid.value = 4
	self.colors.mindaro_solid = {}
	self.colors.mindaro_solid.colors = {
		mindaro,
		mindaro
	}
	self.colors.mindaro_solid.name_id = "bm_clr_mindaro_solid"
	self.colors.mindaro_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.mindaro_solid.value = 4
	self.colors.pastel_yellow_solid = {}
	self.colors.pastel_yellow_solid.colors = {
		pastel_yellow,
		pastel_yellow
	}
	self.colors.pastel_yellow_solid.name_id = "bm_clr_pastel_yellow_solid"
	self.colors.pastel_yellow_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.pastel_yellow_solid.value = 4
	self.colors.mellow_green_solid = {}
	self.colors.mellow_green_solid.colors = {
		mellow_green,
		mellow_green
	}
	self.colors.mellow_green_solid.name_id = "bm_clr_mellow_green_solid"
	self.colors.mellow_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.mellow_green_solid.value = 4
	self.colors.kilim_beige_solid = {}
	self.colors.kilim_beige_solid.colors = {
		kilim_beige,
		kilim_beige
	}
	self.colors.kilim_beige_solid.name_id = "bm_clr_kilim_beige_solid"
	self.colors.kilim_beige_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.kilim_beige_solid.value = 4
	self.colors.sand_solid = {}
	self.colors.sand_solid.colors = {
		sand,
		sand
	}
	self.colors.sand_solid.name_id = "bm_clr_sand_solid"
	self.colors.sand_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.sand_solid.value = 4
	self.colors.mud_solid = {}
	self.colors.mud_solid.colors = {
		mud,
		mud
	}
	self.colors.mud_solid.name_id = "bm_clr_mud_solid"
	self.colors.mud_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.mud_solid.value = 4
	self.colors.baroness_solid = {}
	self.colors.baroness_solid.colors = {
		baroness,
		baroness
	}
	self.colors.baroness_solid.name_id = "bm_clr_baroness_solid"
	self.colors.baroness_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.baroness_solid.value = 4
	self.colors.blue_bell_solid = {}
	self.colors.blue_bell_solid.colors = {
		blue_bell,
		blue_bell
	}
	self.colors.blue_bell_solid.name_id = "bm_clr_blue_bell_solid"
	self.colors.blue_bell_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.blue_bell_solid.value = 4
	self.colors.bravo_blue_solid = {}
	self.colors.bravo_blue_solid.colors = {
		bravo_blue,
		bravo_blue
	}
	self.colors.bravo_blue_solid.name_id = "bm_clr_bravo_blue_solid"
	self.colors.bravo_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.bravo_blue_solid.value = 4
	self.colors.shadow_blue_solid = {}
	self.colors.shadow_blue_solid.colors = {
		shadow_blue,
		shadow_blue
	}
	self.colors.shadow_blue_solid.name_id = "bm_clr_shadow_blue_solid"
	self.colors.shadow_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.shadow_blue_solid.value = 4
	self.colors.haven_solid = {}
	self.colors.haven_solid.colors = {
		haven,
		haven
	}
	self.colors.haven_solid.name_id = "bm_clr_haven_solid"
	self.colors.haven_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.haven_solid.value = 4
	self.colors.parisian_patina_solid = {}
	self.colors.parisian_patina_solid.colors = {
		parisian_patina,
		parisian_patina
	}
	self.colors.parisian_patina_solid.name_id = "bm_clr_parisian_patina_solid"
	self.colors.parisian_patina_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.parisian_patina_solid.value = 4
	self.colors.may_green_solid = {}
	self.colors.may_green_solid.colors = {
		may_green,
		may_green
	}
	self.colors.may_green_solid.name_id = "bm_clr_may_green_solid"
	self.colors.may_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.may_green_solid.value = 4
	self.colors.fern_green_solid = {}
	self.colors.fern_green_solid.colors = {
		fern_green,
		fern_green
	}
	self.colors.fern_green_solid.name_id = "bm_clr_fern_green_solid"
	self.colors.fern_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.fern_green_solid.value = 4
	self.colors.branch_green_solid = {}
	self.colors.branch_green_solid.colors = {
		branch_green,
		branch_green
	}
	self.colors.branch_green_solid.name_id = "bm_clr_branch_green_solid"
	self.colors.branch_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.branch_green_solid.value = 4
	self.colors.coyote_brown_solid = {}
	self.colors.coyote_brown_solid.colors = {
		coyote_brown,
		coyote_brown
	}
	self.colors.coyote_brown_solid.name_id = "bm_clr_coyote_brown_solid"
	self.colors.coyote_brown_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.coyote_brown_solid.value = 4
	self.colors.deep_green_solid = {}
	self.colors.deep_green_solid.colors = {
		deep_green,
		deep_green
	}
	self.colors.deep_green_solid.name_id = "bm_clr_deep_green_solid"
	self.colors.deep_green_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.deep_green_solid.value = 4
	self.colors.twilight_lavender_solid = {}
	self.colors.twilight_lavender_solid.colors = {
		twilight_lavender,
		twilight_lavender
	}
	self.colors.twilight_lavender_solid.name_id = "bm_clr_twilight_lavender_solid"
	self.colors.twilight_lavender_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.twilight_lavender_solid.value = 4
	self.colors.cordovan_solid = {}
	self.colors.cordovan_solid.colors = {
		cordovan,
		cordovan
	}
	self.colors.cordovan_solid.name_id = "bm_clr_cordovan_solid"
	self.colors.cordovan_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.cordovan_solid.value = 4
	self.colors.maximum_purple_solid = {}
	self.colors.maximum_purple_solid.colors = {
		maximum_purple,
		maximum_purple
	}
	self.colors.maximum_purple_solid.name_id = "bm_clr_maximum_purple_solid"
	self.colors.maximum_purple_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.maximum_purple_solid.value = 4
	self.colors.deep_aquamarine_solid = {}
	self.colors.deep_aquamarine_solid.colors = {
		deep_aquamarine,
		deep_aquamarine
	}
	self.colors.deep_aquamarine_solid.name_id = "bm_clr_deep_aquamarine_solid"
	self.colors.deep_aquamarine_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.deep_aquamarine_solid.value = 4
	self.colors.upsdell_red_solid = {}
	self.colors.upsdell_red_solid.colors = {
		upsdell_red,
		upsdell_red
	}
	self.colors.upsdell_red_solid.name_id = "bm_clr_upsdell_red_solid"
	self.colors.upsdell_red_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.upsdell_red_solid.value = 4
	self.colors.dark_puce_solid = {}
	self.colors.dark_puce_solid.colors = {
		dark_puce,
		dark_puce
	}
	self.colors.dark_puce_solid.name_id = "bm_clr_dark_puce_solid"
	self.colors.dark_puce_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_puce_solid.value = 4
	self.colors.imperial_purple_solid = {}
	self.colors.imperial_purple_solid.colors = {
		imperial_purple,
		imperial_purple
	}
	self.colors.imperial_purple_solid.name_id = "bm_clr_imperial_purple_solid"
	self.colors.imperial_purple_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.imperial_purple_solid.value = 4
	self.colors.russian_violet_solid = {}
	self.colors.russian_violet_solid.colors = {
		russian_violet,
		russian_violet
	}
	self.colors.russian_violet_solid.name_id = "bm_clr_russian_violet_solid"
	self.colors.russian_violet_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.russian_violet_solid.value = 4
	self.colors.dark_slate_blue_solid = {}
	self.colors.dark_slate_blue_solid.colors = {
		dark_slate_blue,
		dark_slate_blue
	}
	self.colors.dark_slate_blue_solid.name_id = "bm_clr_dark_slate_blue_solid"
	self.colors.dark_slate_blue_solid.pcs = {
		10,
		20,
		30,
		40
	}
	self.colors.dark_slate_blue_solid.value = 4

	local free_dlcs = tweak_data:free_dlc_list()

	for _, data in pairs(self.colors) do
		if free_dlcs[data.dlc] then
			data.dlc = nil
		end
	end

	self.mask_colors = {}

	local old_colors = {
		white = white,
		black = black,
		red = red,
		green = green,
		blue = blue,
		yellow = yellow,
		magenta = magenta,
		cyan = cyan,
		light_gray = light_gray,
		gray = gray,
		dark_gray = dark_gray,
		blood_red = blood_red,
		orange = orange,
		light_brown = light_brown,
		bright_yellow = bright_yellow,
		lime_green = lime_green,
		purple = purple,
		pink = pink,
		brown = brown,
		navy_blue = navy_blue,
		matte_blue = matte_blue,
		olive_green = olive_green,
		gray_blue = gray_blue,
		light_blue = light_blue,
		bone_white = bone_white,
		turquoise = turquoise,
		matte_purple = matte_purple,
		coral_red = coral_red,
		leaf_green = leaf_green,
		dark_green = dark_green,
		warm_yellow = warm_yellow,
		dark_red = dark_red,
		cobalt_blue = cobalt_blue,
		toxic_green = toxic_green,
		skin_pink = skin_pink,
		sea_blue = sea_blue,
		dark_purple = dark_purple,
		scary_green = scary_green,
		neon_red = neon_red,
		vivid_raspberry = vivid_raspberry,
		fashion_fuchsia = fashion_fuchsia,
		vivid_orchid = vivid_orchid,
		electric_indigo = electric_indigo,
		vivid_blue = vivid_blue,
		brandeis_blue = brandeis_blue,
		vivid_sky_blue = vivid_sky_blue,
		aquamarine = aquamarine,
		sea_green = sea_green,
		guppie_green = guppie_green,
		chartreuse = chartreuse,
		shadow_yellow = shadow_yellow,
		rifle_green = rifle_green,
		congo_pink = congo_pink,
		coffee = coffee,
		heat_wave = heat_wave,
		tickle_pink = tickle_pink,
		rosebay = rosebay,
		heliotrope = heliotrope,
		lavender = lavender,
		slate_blue = slate_blue,
		french_sky_blue = french_sky_blue,
		blithe_blue = blithe_blue,
		mindaro = mindaro,
		pastel_yellow = pastel_yellow,
		mellow_green = mellow_green,
		kilim_beige = kilim_beige,
		sand = sand,
		mud = mud,
		baroness = baroness,
		blue_bell = blue_bell,
		bravo_blue = bravo_blue,
		shadow_blue = shadow_blue,
		haven = haven,
		parisian_patina = parisian_patina,
		may_green = may_green,
		fern_green = fern_green,
		branch_green = branch_green,
		coyote_brown = coyote_brown,
		deep_green = deep_green,
		twilight_lavender = twilight_lavender,
		cordovan = cordovan,
		maximum_purple = maximum_purple,
		deep_aquamarine = deep_aquamarine,
		upsdell_red = upsdell_red,
		dark_puce = dark_puce,
		imperial_purple = imperial_purple,
		russian_violet = russian_violet,
		dark_slate_blue = dark_slate_blue
	}
	local color_values = {}

	for _, data in pairs(self.colors) do
		data.color_ids = {}

		for _, color in ipairs(data.colors) do
			local key = table.get_key(old_colors, color)

			if key then
				color_values[key] = color_values[key] or {}

				table.insert(color_values[key], data.value)
			end

			table.insert(data.color_ids, key)
		end
	end

	self.colors.nothing.color_ids = {
		"nothing",
		"nothing"
	}

	local total

	for id, color in pairs(old_colors) do
		total = 0

		for _, value in ipairs(color_values[id]) do
			total = total + value
		end

		self.mask_colors[id] = {
			color = color,
			name_id = "bm_mclr_" .. tostring(id),
			value = math.floor(total / #color_values[id])
		}
	end

	self.mask_colors.nothing = {}
	self.mask_colors.nothing.color = nothing
	self.mask_colors.nothing.name_id = "bm_clr_nothing"
	self.mask_colors.nothing.value = 0

	for id, item in pairs(self.mask_colors) do
		if id ~= "nothing" then
			item.convert_to_material = item.convert_to_material or "solid_flat_" .. id
			item.inaccessible = true
			item.pcs = {}
			item.value = 0
		end
	end

	for id, item in pairs(self.colors) do
		if id ~= "nothing" then
			item.inaccessible = true
			item.pcs = {}
			item.value = 0
		end
	end
end
