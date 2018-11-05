
function DLCTweakData:init_generated()
	self.flm_bundle = {
		free = true,
		content = {}
	}
	self.flm_bundle.content.loot_global_value = "flm"
	self.flm_bundle.content.loot_drops = {{
		type_items = "masks",
		item_entry = "flm",
		amount = 1
	}}
	self.tjp_bundle = {
		dlc = "has_tjp",
		content = {}
	}
	self.tjp_bundle.content.loot_global_value = "tjp"
	self.tjp_bundle.content.loot_drops = {}
	self.toon_bundle = {
		free = true,
		content = {}
	}
	self.toon_bundle.content.loot_global_value = "toon"
	self.toon_bundle.content.loot_drops = {
		{
			type_items = "masks",
			item_entry = "toon_01",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "toon_02",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "toon_03",
			amount = 1
		},
		{
			type_items = "masks",
			item_entry = "toon_04",
			amount = 1
		}
	}
end

