
function DLCTweakData:init_generated()
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

