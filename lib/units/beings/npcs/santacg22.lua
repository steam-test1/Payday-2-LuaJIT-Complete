require("lib/units/civilians/CivilianBase")
require("lib/units/civilians/CivilianBrain")
require("lib/units/civilians/HuskCivilianBase")

SantaBase = SantaBase or class(CivilianBase)

function SantaBase:post_init()
	self._ext_movement = self._unit:movement()
	self._ext_anim = self._unit:anim_data()

	self:set_anim_lod(1)

	self._lod_stage = 1
	local spawn_state = nil

	if self._spawn_state then
		if self._spawn_state ~= "" then
			spawn_state = self._spawn_state
		end
	else
		spawn_state = "civilian/spawn/loop"
	end

	if spawn_state then
		self._ext_movement:play_state(spawn_state)
	end

	self._unit:anim_data().idle_full_blend = true

	self._ext_movement:post_init()
	self._unit:brain():post_init()
end

HuskSantaBase = HuskSantaBase or class(HuskCivilianBase)
HuskSantaBase.post_init = SantaBase.post_init
SantaBrain = SantaBrain or class(CivilianBrain)

function SantaBrain:post_init()
	self._logics = CopBrain._logic_variants[self._unit:base()._tweak_table]

	self:_reset_logic_data()
	self:_setup_attention_handler()
	self:set_attention_settings(nil)

	if not self._current_logic then
		self:set_init_logic("idle")
	end

	self:set_active(false)
end
