MedicActionHeal = MedicActionHeal or class()

function MedicActionHeal:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_movement = common_data.ext_movement
	self._ext_inventory = common_data.ext_inventory
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._machine = common_data.machine
	self._action_desc = action_desc

	if not self._ext_movement:play_redirect("heal", action_desc.start_anim_time) then
		return false
	end

	CopActionAct._create_blocks_table(self, action_desc.blocks)
	self._ext_movement:enable_update()

	return true
end

function MedicActionHeal:update(t)
	if not self._ext_anim.healing then
		self._expired = true
	end
end

function MedicActionHeal:type()
	return "heal"
end

function MedicActionHeal:expired()
	return self._expired
end

function MedicActionHeal:chk_block(action_type, t)
	if action_type == "death" then
		return false
	end

	return CopActionAct.chk_block(self, action_type, t)
end

function MedicActionHeal:body_part()
	return self._body_part
end

function MedicActionHeal:need_upd()
	return true
end

function MedicActionHeal:save(save_data)
	if self._ext_anim.heal then
		for k, v in pairs(self._action_desc) do
			save_data[k] = v
		end

		save_data.start_anim_time = self._machine:segment_real_time(Idstring("upper_body"))
	end
end

function MedicActionHeal.check_achievements()
	local total_healed = (managers.job:get_memory("medic_heal_total", true) or 0) + 1

	managers.job:set_memory("medic_heal_total", total_healed, true)

	local all_pass, total_pass = nil

	for achievement, achievement_data in pairs(tweak_data.achievement.medic_heal_achievements or {}) do
		total_pass = not achievement_data.total

		if achievement_data.total then
			total_pass = achievement_data.total <= total_healed
		end

		all_pass = total_pass

		if all_pass then
			managers.achievment:award_data(achievement_data)
		end
	end
end
