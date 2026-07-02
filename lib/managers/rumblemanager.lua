core:module("RumbleManager")
core:import("CoreRumbleManager")
core:import("CoreClass")

RumbleManager = RumbleManager or class(CoreRumbleManager.RumbleManager)

function RumbleManager:init()
	RumbleManager.super.init(self)
	_G.tweak_data:add_reload_callback(self, callback(self, self, "setup_preset_rumbles"))
	self:setup_preset_rumbles()
end

function RumbleManager:setup_preset_rumbles()
	self:add_preset_rumbles("weapon_fire", {
		cumulative = false,
		engine = "both",
		peak = 0.5,
		release = 0.05,
		sustain = 0.1
	})
	self:add_preset_rumbles("land", {
		cumulative = false,
		engine = "both",
		peak = 0.5,
		release = 0.1,
		sustain = 0.1
	})
	self:add_preset_rumbles("hard_land", {
		cumulative = false,
		engine = "both",
		peak = 1,
		release = 0.1,
		sustain = 0.3
	})
	self:add_preset_rumbles("electrified", {
		cumulative = false,
		engine = "both",
		peak = 0.5,
		release = 0.05
	})
	self:add_preset_rumbles("electric_shock", {
		cumulative = true,
		engine = "both",
		peak = 1,
		release = 0.1,
		sustain = 0.2
	})
	self:add_preset_rumbles("incapacitated_shock", {
		cumulative = true,
		engine = "both",
		peak = 0.75,
		release = 0.1,
		sustain = 0.2
	})
	self:add_preset_rumbles("damage_bullet", {
		cumulative = true,
		engine = "both",
		peak = 1,
		release = 0,
		sustain = 0.2
	})
	self:add_preset_rumbles("bullet_whizby", {
		cumulative = true,
		engine = "both",
		peak = 1,
		release = 0,
		sustain = 0.075
	})
	self:add_preset_rumbles("melee_hit", {
		cumulative = true,
		engine = "both",
		peak = 1,
		release = 0,
		sustain = 0.15
	})
	self:add_preset_rumbles("mission_triggered", {
		attack = 0.1,
		cumulative = true,
		engine = "both",
		peak = 1,
		release = 2.1,
		sustain = 0.3
	})
	self:add_preset_rumbles("reloaded", {
		attack = 0.05,
		cumulative = true,
		engine = "both",
		peak = 0.7,
		release = 0.1,
		sustain = 0.1
	})
end

CoreClass.override_class(CoreRumbleManager.RumbleManager, RumbleManager)
