CopActionReload = CopActionReload or class()

function CopActionReload:init(action_desc, common_data)
	self._unit = common_data.unit
	self._ext_movement = common_data.ext_movement
	self._ext_anim = common_data.ext_anim
	self._ext_inventory = common_data.ext_inventory
	self._body_part = action_desc.body_part
	self._common_data = common_data
	self._machine = common_data.machine
	local weapon_unit = self._ext_inventory:equipped_unit()

	if not weapon_unit then
		return false
	end

	self._reload_speed = self._ext_movement:get_reload_speed_multiplier()
	local loop_time = self._ext_movement:get_looped_reload_time()

	if loop_time then
		self._looped_expire_t = TimerManager:game():time() + loop_time
	end

	if self._ext_anim.reload or self:_play_reload() then
		return true
	else
		cat_print("george", "[CopActionReload:init] failed in", self._machine:segment_state(Idstring("upper_body")))
	end
end

function CopActionReload:on_inventory_event(event)
	self._expired = true

	if self._ext_anim.reload then
		self._ext_movement:play_redirect("up_idle")
	end
end

function CopActionReload:type()
	return "reload"
end

function CopActionReload:update(t)
	if not self._ext_anim.reload then
		self._expired = true
	else
		if self._looped_expire_t and self._looped_expire_t < t then
			self._looped_expire_t = nil
			local redir_res = self._ext_movement:play_redirect("reload_looped_exit")

			if redir_res and self._reload_speed then
				self._machine:set_speed(redir_res, self._reload_speed)
			end
		end

		if self._ext_anim.base_need_upd then
			self._ext_movement:upd_m_head_pos()
		end
	end
end

function CopActionReload:_play_reload(t)
	local redir_res = self._ext_movement:play_redirect(self._looped_expire_time and "reload_looped_start" or "reload")

	if not redir_res then
		cat_print("george", "[CopActionReload:_play_reload] reload redirect failed in", self._machine:segment_state(Idstring("upper_body")))

		return
	end

	if self._reload_speed and not self._looped_expire_time then
		self._machine:set_speed(redir_res, self._reload_speed)
	end

	if Network:is_server() then
		managers.network:session():send_to_peers("reload_weapon_cop", self._unit)
	end

	return redir_res
end

function CopActionReload:_play_bleedout_reload()
	local redir_res = self._ext_movement:play_redirect("reload")

	if not redir_res then
		cat_print("george", "[CopActionReload:_play_reload] reload redirect failed in", self._machine:segment_state(Idstring("base")))

		return
	end

	if self._reload_speed then
		self._machine:set_speed(redir_res, self._reload_speed)
	end

	if Network:is_server() then
		managers.network:session():send_to_peers("reload_weapon_cop", self._unit)
	end

	return redir_res
end

function CopActionReload:on_looped_reload_looping()
	if self._looped_expire_time then
		self._looped_expire_t = TimerManager:game():time() + self._looped_expire_time
	end
end

function CopActionReload:body_part()
	return self._body_part
end

function CopActionReload:expired()
	return self._expired
end

function CopActionReload:need_upd()
	return true
end
