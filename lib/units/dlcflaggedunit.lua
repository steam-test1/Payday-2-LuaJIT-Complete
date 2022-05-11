DLCFlaggedUnit = DLCFlaggedUnit or class()

function DLCFlaggedUnit:init(unit, update_enabled)
	self._unit = unit

	unit:set_extension_update_enabled(Idstring("flagged_unit"), false)
end
