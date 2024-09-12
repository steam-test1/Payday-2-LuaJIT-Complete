DLCFlaggedUnit = DLCFlaggedUnit or class()

function DLCFlaggedUnit:init(unit, update_enabled)
	self._unit = unit

	unit:set_extension_update_enabled(Idstring("flagged_unit"), false)
end

IPContentExt = IPContentExt or class()

function IPContentExt:init(unit, update_enabled)
	self._unit = unit

	unit:set_extension_update_enabled(Idstring("ipcontent"), false)

	if not managers.dlc:is_dlc_unlocked(self.dlc) and managers.dlc:should_hide_unavailable(self.dlc) then
		print("[IPContentExt] Disabling unit:", self._unit)
		self._unit:set_visible(false)
		self._unit:set_enabled(false)

		local interaction = self._unit:interaction()

		if interaction then
			interaction:set_disabled(true)
			interaction:destroy()
		end
	end
end
