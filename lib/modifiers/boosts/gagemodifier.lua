GageModifier = GageModifier or class(BaseModifier)
GageModifier._type = "GageModifier"
GageModifier.name_id = "none"
GageModifier.desc_id = "none"
GageModifier.default_value = nil

function GageModifier:init(modifier_tweak)
	self.name_id = modifier_tweak.name_id
	self.desc_id = modifier_tweak.unlock_desc_id
	self._data = modifier_tweak.data
end

function GageModifier:is_active()
	for _, mod in ipairs(managers.crime_spree:active_gage_assets()) do
		if mod._type == self._type then
			return true
		end
	end

	return false
end

