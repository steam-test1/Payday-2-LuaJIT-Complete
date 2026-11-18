require("lib/managers/menu/GenericDialogMenuNodeGui")
require("lib/managers/menu/extended_ui/MultichoiceGuiObject")
require("lib/managers/menu/ModWorkshopFiltersGui")
require("lib/managers/menu/items/ModWorkshopModItem")
require("lib/managers/menu/ModWorkshopModDetailsGui")
require("lib/managers/menu/pages/ModWorkshopBaseModsPage")
require("lib/managers/menu/pages/ModWorkshopHighlightedModsPage")
require("lib/managers/menu/pages/ModWorkshopBrowseModsPage")
require("lib/managers/menu/pages/ModWorkshopInstalledModsPage")
require("lib/managers/menu/LoadingIconGuiObject")
require("lib/managers/menu/HybridMenuHandler")

ModWorkshopMenuGui = ModWorkshopMenuGui or class(MenuGuiComponentGeneric)

function ModWorkshopMenuGui:_setup(is_start_page)
	ModWorkshopMenuGui.super._setup(self, is_start_page, {
		topic_id = "menu_mws_title"
	})
end

function ModWorkshopMenuGui:close(...)
	ModWorkshopMenuGui.super.close(self, ...)
	ModWorkshop:clear_image_cache()
	ModWorkshop:abort_callbacks()
end

function ModWorkshopMenuGui:populate_tabs_data(tabs_data)
	table.insert(tabs_data, {
		name_id = "menu_mws_highlighted",
		page_class = "ModWorkshopHighlightedModsPage"
	})
	table.insert(tabs_data, {
		name_id = "menu_mws_browser",
		page_class = "ModWorkshopBrowseModsPage"
	})
	table.insert(tabs_data, {
		name_id = "menu_mws_mods",
		page_class = "ModWorkshopInstalledModsPage"
	})
end
