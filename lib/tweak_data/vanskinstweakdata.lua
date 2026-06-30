VanSkinsTweakData = VanSkinsTweakData or class()

function VanSkinsTweakData:init(tweak_data)
	self.skins = {}
	self.default_skin_id = "default"
	self.skins.default = {}
	self.skins.default.dlc = nil
	self.skins.default.sequence_name = "mat_normal"
	self.skins.overkill = {}
	self.skins.overkill.dlc = "overkill_pack"
	self.skins.overkill.sequence_name = "mat_overkill"
	self.skins.brown = {}
	self.skins.brown.dlc = nil
	self.skins.brown.sequence_name = "mat_chill_brown"
	self.skins.green = {}
	self.skins.green.dlc = nil
	self.skins.green.sequence_name = "mat_chill_green"
	self.skins.grey = {}
	self.skins.grey.dlc = nil
	self.skins.grey.sequence_name = "mat_chill_grey"
	self.skins.red = {}
	self.skins.red.dlc = nil
	self.skins.red.sequence_name = "mat_chill_red"
	self.skins.white = {}
	self.skins.white.dlc = nil
	self.skins.white.sequence_name = "mat_chill_white"
	self.skins.yellow = {}
	self.skins.yellow.dlc = nil
	self.skins.yellow.sequence_name = "mat_chill_yellow"
	self.skins.icecream = {}
	self.skins.icecream.dlc = nil
	self.skins.icecream.sequence_name = "mat_chill_icecream"
	self.skins.spooky = {}
	self.skins.spooky.dlc = nil
	self.skins.spooky.sequence_name = "mat_chill_halloween"
end
