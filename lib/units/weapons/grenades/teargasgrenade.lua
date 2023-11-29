TearGasGrenade = TearGasGrenade or class()

function TearGasGrenade:init(unit)
	self._unit = unit
	self.radius = 0
	self.duration = 0
	self.damage = 0
	self._has_played_VO = false

	unit:set_extension_update_enabled(Idstring("base"), false)
end

function TearGasGrenade:set_properties(props)
	if self._unit:id() ~= -1 and Network:is_server() then
		local sync_diameter = 0

		if props.radius then
			sync_diameter = props.radius * 0.01
			sync_diameter = math.round(sync_diameter * sync_diameter * 100)
			self.radius = sync_diameter * 0.01 * 0.5 * 100
		else
			self.radius = 0
		end

		local sync_damage = props.damage and math.round(props.damage * 100) or 0
		self.damage = sync_damage * 0.01
		local sync_duration = props.duration and math.round(props.duration * 10) or 0
		self.duration = sync_duration * 0.1

		managers.network:session():send_to_peers_synched("sync_tear_gas_grenade_properties", self._unit, sync_diameter, sync_damage, sync_duration)
	else
		self.radius = props.radius or 0
		self.duration = props.duration or 0
		self.damage = props.damage or 0
	end
end

function TearGasGrenade:update(unit, t, dt)
	if self._damage_t and self._damage_t < t then
		self._damage_t = self._damage_t + 1
		local player = managers.player:player_unit()

		if player then
			local radius_sq = self.radius * self.radius
			local in_range = player and mvector3.distance_sq(player:position(), self._unit:position()) <= radius_sq

			if in_range then
				player:character_damage():damage_killzone({
					variant = "killzone",
					damage = self.damage,
					col_ray = {
						ray = math.UP
					}
				})

				if not self._has_played_VO then
					PlayerStandard.say_line(player:sound(), "g42x_any")

					self._has_played_VO = true
				end
			end
		end
	end

	if self._remove_t and self._remove_t < t then
		self._remove_t = nil
		self._damage_t = nil

		self:_handle_hiding_and_destroying()
	end
end

function TearGasGrenade:detonate()
	if self._detonated then
		return
	end

	self._detonated = true
	local now = TimerManager:game():time()
	self._remove_t = now + self.duration
	self._damage_t = now + 1

	self._unit:sound_source():post_event("grenade_gas_explode")

	local position = self._unit:position()

	World:effect_manager():spawn({
		effect = Idstring("effects/particles/explosions/explosion_smoke_grenade"),
		position = position,
		normal = self._unit:rotation():y()
	})

	local parent = self._unit:orientation_object()
	self._smoke_effect = World:effect_manager():spawn({
		effect = Idstring("effects/payday2/environment/cs_gas_damage_area"),
		parent = parent
	})
	self._set_blurzone = true
	local blurzone_radius = self.radius * 1.3

	managers.environment_controller:set_blurzone(self._unit:key(), 1, position, blurzone_radius, 0, true)

	if self._unit:id() ~= -1 and Network:is_server() then
		managers.network:session():send_to_peers("sync_tear_gas_grenade_detonate", self._unit)
	end

	self._unit:set_extension_update_enabled(Idstring("base"), true)
end

function TearGasGrenade:_remove_effects()
	if self._set_blurzone then
		self._set_blurzone = nil

		managers.environment_controller:set_blurzone(self._unit:key(), 0)
	end

	if self._smoke_effect then
		World:effect_manager():fade_kill(self._smoke_effect)

		self._smoke_effect = nil
	end
end

function TearGasGrenade:_handle_hiding_and_destroying()
	self:_remove_effects()
	self._unit:set_extension_update_enabled(Idstring("base"), false)
	self._unit:set_enabled(false)

	if Network:is_server() or self._unit:id() == -1 then
		self._unit:set_slot(0)
	end
end

function TearGasGrenade:save(data)
	local my_save_data = {}

	if self._unit:in_slot(0) then
		my_save_data.hide = true
	elseif self._detonated or self._remove_t or self.radius ~= 0 or self.damage ~= 0 or self.duration ~= 0 then
		local t = TimerManager:game():time()
		my_save_data.detonated = self._detonated and true or nil
		my_save_data.radius = self.radius ~= 0 and self.radius or nil
		my_save_data.damage = self.damage ~= 0 and self.damage or nil
		my_save_data.duration = self.duration ~= 0 and self.duration or nil
		my_save_data.cur_duration = self._remove_t and self._remove_t - t or nil
		my_save_data.cur_interval = self._detonated and self._damage_t and self._damage_t - t or nil
	end

	if next(my_save_data) then
		data.TearGasGrenade = my_save_data
	end
end

function TearGasGrenade:load(data)
	local state = data.TearGasGrenade

	if state then
		if state.hide then
			self:_handle_hiding_and_destroying()
		else
			local props = {
				radius = state.radius,
				damage = state.damage,
				duration = state.duration
			}

			self:set_properties(props)

			local enable_upd = nil

			if state.detonated then
				enable_upd = true

				self:detonate()

				if state.cur_interval then
					self._damage_t = TimerManager:game():time() + state.cur_interval
				end
			elseif state.cur_duration then
				self._detonated = true
				enable_upd = true
				self._remove_t = TimerManager:game():time() + state.cur_duration
			end

			if enable_upd then
				self._unit:set_extension_update_enabled(Idstring("base"), true)
			end
		end
	end
end

function TearGasGrenade:destroy()
	self:_remove_effects()
end
