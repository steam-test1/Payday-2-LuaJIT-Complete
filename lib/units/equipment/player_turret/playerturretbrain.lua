PlayerTurretBrain = PlayerTurretBrain or class()
PlayerTurretBrain._create_attention_setting_from_descriptor = PlayerMovement._create_attention_setting_from_descriptor

function PlayerTurretBrain:init(unit)
	self._unit = unit

	self._unit:base():post_init()
	self._unit:set_extension_update_enabled(Idstring("brain"), false)
end

function PlayerTurretBrain:post_init()
	self._ext_movement = self._unit:movement()
	self._ext_weapon = self._unit:base()

	self:switch_off()
end

function PlayerTurretBrain:switch_on()
	if self._active then
		return false
	end

	if self._unit:damage():has_sequence("laser_activate") then
		self._unit:damage():run_sequence_simple("laser_activate")
	end

	self._unit:set_slot(25)
	self._ext_movement:switch_on()
	self._ext_weapon:switch_on()

	self._active = true

	return true
end

function PlayerTurretBrain:switch_off()
	if self._unit:damage():has_sequence("laser_deactivate") then
		self._unit:damage():run_sequence_simple("laser_deactivate")
	end

	self._unit:set_slot(26)
	self._ext_movement:switch_off()
	self._ext_weapon:switch_off()

	self._active = false

	return true
end

function PlayerTurretBrain:is_active()
	return self._active
end

function PlayerTurretBrain:save(save_data)
	local my_save_data = {}
	save_data.brain = my_save_data
	my_save_data.is_active = self._active
end

function PlayerTurretBrain:load(save_data)
	if not save_data or not save_data.brain then
		return
	end

	local my_save_data = save_data.brain

	if my_save_data.is_active then
		self:switch_on()
	end
end

function PlayerTurretBrain:pre_destroy()
	self:switch_off()
end
