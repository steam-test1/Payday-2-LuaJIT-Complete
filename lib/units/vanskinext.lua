VanSkinExt = VanSkinExt or class()

function VanSkinExt:init(unit)
	self._unit = unit

	unit:set_extension_update_enabled(Idstring("van_skin"), false)
	self:apply_skin()
end

function VanSkinExt:apply_skin(skin_id)
	skin_id = skin_id or managers.blackmarket:equipped_van_skin() or tweak_data.van.default_skin_id

	if Network:is_server() and self._unit:damage() and skin_id then
		local van_data = tweak_data.van.skins[skin_id]

		if not van_data then
			return
		end

		if van_data.dlc and not managers.dlc:is_dlc_unlocked(van_data.dlc) then
			skin_id = tweak_data.van.default_skin_id
			van_data = tweak_data.van.skins[skin_id]
		end

		if self._unit:damage():has_sequence(van_data.sequence_name) then
			self._unit:damage():run_sequence_simple(van_data.sequence_name)
		end
	end
end
