ModifierLessConcealment = ModifierLessConcealment or class(BaseModifier)
ModifierLessConcealment._type = "ModifierLessConcealment"
ModifierLessConcealment.name_id = "none"
ModifierLessConcealment.desc_id = "menu_cs_modifier_concealment"
ModifierLessConcealment.default_value = "conceal"
ModifierLessConcealment.total_localization = "menu_cs_modifier_total_generic_value"
ModifierLessConcealment.stealth = true

function ModifierLessConcealment:init(...)
	ModifierLessConcealment.super.init(self, ...)

	self._checked_weapons_hot = false
end

function ModifierLessConcealment:modify_value(id, value)
	if not managers.groupai then
		return value
	end

	local enemy_weapons_hot = managers.groupai:state():enemy_weapons_hot()

	if not self._checked_weapons_hot then
		self._checked_weapons_hot = true

		if not enemy_weapons_hot and not self._weapons_hot_listener_id then
			self._weapons_hot_listener_id = "ModifierLessConcealment"

			managers.groupai:state():add_listener(self._weapons_hot_listener_id, {
				"enemy_weapons_hot"
			}, callback(self, self, "clbk_enemy_weapons_hot"))
		end
	end

	if id == "BlackMarketManager:GetConcealment" and not enemy_weapons_hot then
		return value + self:value()
	end

	return value
end

function ModifierLessConcealment:clbk_enemy_weapons_hot(...)
	managers.groupai:state():remove_listener(self._weapons_hot_listener_id)

	self._weapons_hot_listener_id = nil

	managers.player:update_cached_detection_risk()

	for _, peer in pairs(managers.network:session():all_peers()) do
		peer:update_concealment()
	end
end
