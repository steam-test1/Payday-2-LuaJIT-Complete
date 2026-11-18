SmokeScreenGrenade = SmokeScreenGrenade or class(FragGrenade)

function SmokeScreenGrenade:_setup_server_data(...)
	SmokeScreenGrenade.super._setup_server_data(self, ...)

	if self._timer then
		self._timer = math.max(self._timer, 0.1)
	end
end

function SmokeScreenGrenade:set_thrower_unit(unit, ...)
	SmokeScreenGrenade.super.set_thrower_unit(self, unit, ...)

	local thrower_unit = alive(self._thrower_unit) and self._thrower_unit or nil
	local base_ext = thrower_unit and thrower_unit:base() or nil

	if base_ext and not base_ext.is_local_player and base_ext.upgrade_value then
		self._has_dodge_bonus = base_ext:upgrade_value("player", "sicario_multiplier")
	end

	if Network:is_server() then
		local thrower_access

		if thrower_unit then
			local mov_ext = thrower_unit:movement()

			thrower_access = mov_ext and mov_ext.SO_access and mov_ext:SO_access()

			if not thrower_access then
				local brain_ext = thrower_access:brain()

				thrower_access = brain_ext and brain_ext:SO_access()
			end
		end

		self._alert_filter = thrower_access or managers.groupai:state():get_unit_type_filter("combatant")
	end
end

function SmokeScreenGrenade:_detonate(tag, unit, body, other_unit, other_body, position, normal, collision_velocity, velocity, other_velocity, new_velocity, direction, damage, ...)
	if self._detonated then
		return
	end

	self._detonated = true

	local pos = self._unit:position()
	local normal = math.UP
	local range = self._range
	local server = Network:is_server()

	if server then
		managers.network:send_to_peers_synched("sync_unit_event_id_16", self._unit, "base", GrenadeBase.EVENT_IDS.detonate)
	end

	self._unit:body("static_body"):set_enabled(false)
	managers.player:spawn_smoke_screen(pos, normal, self._unit, self._has_dodge_bonus)

	if server then
		local alert_unit = self._thrower_unit

		if not alive(alert_unit) then
			alert_unit = self._unit
		end

		managers.groupai:state():propagate_alert({
			"aggression",
			pos,
			range,
			self._alert_filter,
			alert_unit
		})
	end
end

function SmokeScreenGrenade:bullet_hit()
	return
end

function SmokeScreenGrenade:_detonate_on_client()
	self:_detonate()
end

function SmokeScreenGrenade:update(unit, t, dt)
	if self._timer then
		self._timer = self._timer - dt

		if self._timer <= 0 and mvector3.length(self._unit:body("static_body"):velocity()) < 1 then
			self._timer = nil

			self:_detonate()
		end
	end

	ProjectileBase.update(self, unit, t, dt)
end
