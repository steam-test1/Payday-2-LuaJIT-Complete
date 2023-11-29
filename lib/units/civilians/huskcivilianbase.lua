local ids_lod = Idstring("lod")
local ids_lod1 = Idstring("lod1")
local ids_ik_aim = Idstring("ik_aim")
HuskCivilianBase = HuskCivilianBase or class(HuskCopBase)

function HuskCivilianBase:post_init()
	self._ext_movement = self._unit:movement()
	self._ext_anim = self._unit:anim_data()

	self._unit:brain():post_init()
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

	self._ext_anim.idle_full_blend = true

	self._ext_movement:post_init()
	managers.enemy:register_civilian(self._unit)
	self:enable_leg_arm_hitbox()
end

function HuskCivilianBase:default_weapon_name()
end

function HuskCivilianBase:sync_net_event(event_id)
	if event_id == 1 then
		managers.groupai:state():on_hostage_follow(managers.player:player_unit(), self._unit, true)
	elseif event_id == 2 then
		managers.groupai:state():on_hostage_follow(nil, self._unit, true)
	elseif event_id == 3 then
		managers.groupai:state():on_hostage_follow(managers.player:player_unit(), self._unit, false)
	elseif event_id == 4 then
		managers.groupai:state():on_hostage_follow(nil, self._unit, false)
	end
end

HuskCivilianBaseResetSpawnPos = HuskCivilianBaseResetSpawnPos or class(HuskCivilianBase)

function HuskCivilianBaseResetSpawnPos:init(unit)
	local spawn_position = unit:position()
	self._reset_spawn_pos_clbk_id = "HuskResetSpawnPos" .. tostring(unit:key())

	managers.enemy:add_delayed_clbk(self._reset_spawn_pos_clbk_id, function ()
		if alive(unit) then
			unit:movement():set_position(spawn_position)
		end

		self._reset_spawn_pos_clbk_id = nil
	end, TimerManager:game():time() + 1)
	HuskCivilianBaseResetSpawnPos.super.init(self, unit)
end

function HuskCivilianBaseResetSpawnPos:load(...)
	HuskCivilianBaseResetSpawnPos.super.load(self, ...)

	if self._reset_spawn_pos_clbk_id then
		managers.enemy:remove_delayed_clbk(self._reset_spawn_pos_clbk_id, true)

		self._reset_spawn_pos_clbk_id = nil
	end
end

function HuskCivilianBaseResetSpawnPos:pre_destroy(...)
	HuskCivilianBaseResetSpawnPos.super.pre_destroy(self, ...)

	if self._reset_spawn_pos_clbk_id then
		managers.enemy:remove_delayed_clbk(self._reset_spawn_pos_clbk_id, true)

		self._reset_spawn_pos_clbk_id = nil
	end
end
