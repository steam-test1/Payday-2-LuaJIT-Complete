local function GLOBAL(key, value)
	core:_add_to_pristine_and_global(key, value)
end

local function GLOBAL_PLATFORM(key, platform)
	local value = PLATFORM == Idstring(platform)

	GLOBAL(key, value)
end

if not __globals_declared then
	GLOBAL("IDS_UNIT", Idstring("unit"))
	GLOBAL("IDS_MATERIAL", Idstring("material"))
	GLOBAL("IDS_MATERIAL_CONFIG", Idstring("material_config"))
	GLOBAL("IDS_EMPTY", Idstring(""))
	GLOBAL("PLATFORM", SystemInfo:platform())
	GLOBAL_PLATFORM("IS_WIN32", "WIN32")
	GLOBAL_PLATFORM("IS_XB1", "XB1")
	GLOBAL_PLATFORM("IS_PS4", "PS4")
	GLOBAL("IS_PC", IS_WIN32)
	GLOBAL("IS_CONSOLE", IS_PS4 or IS_XB1)
	GLOBAL("DISTRIBUTION", Distribution:type())
	GLOBAL("IS_STEAM", DISTRIBUTION == Idstring("STEAM"))
	GLOBAL("IS_EPIC", DISTRIBUTION == Idstring("EPIC"))
	GLOBAL("DISTRIBUTION_MM", DistributionMatchmaking:type())
	GLOBAL("IS_STEAM_MM", DISTRIBUTION_MM == Idstring("STEAM"))
	GLOBAL("IS_EPIC_MM", DISTRIBUTION_MM == Idstring("EPIC"))

	__globals_declared = true
end
