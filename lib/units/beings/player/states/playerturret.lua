PlayerTurret = PlayerTurret or class(PlayerStandard)
PlayerTurret.camera_spin_limit = nil
PlayerTurret.camera_pitch_limit = 25
local tmp_vec1 = Vector3()
local tmp_rot1 = Rotation()

function PlayerTurret:init(unit)
	PlayerTurret.super.init(self, unit)
end

function PlayerTurret:enter(state_data, enter_data)
	PlayerTurret.super.enter(self, state_data, enter_data)
	managers.hud:set_ammo_amount(1, 0, 0, 0, 0)
	managers.hud:set_ammo_amount(2, self._turret_unit:base():ammo_info())
	managers.hud:set_weapon_selected_by_inventory_index(2)
	self._unit:kill_mover()
end

function PlayerTurret:_enter(enter_data)
	self._turret_unit = managers.player:get_local_player_turret()
	local tweak_data = self._turret_unit:base():weapon_tweak_data()
	local speed_multiplier = 1

	if self._state_data.ducking then
		self._state_data.ducking = false
	end

	self._move_dir = nil
	self._normal_move_dir = nil
	self._moving = false

	self:_postion_player_on_turret()
	PlayerTurret.super.start_deploying_bipod(self, 1)

	self._headbob = 0
	self._target_headbob = 0

	self._ext_camera:set_shaker_parameter("headbob", "amplitude", 0)
	self._unit:sound_source():post_event("wp_steady_in")

	local res = self._ext_camera:play_redirect(self:get_animation("unequip"), 5)

	self._equipped_unit:base():tweak_data_anim_stop("equip")
	self._equipped_unit:base():tweak_data_anim_play("unequip", 5)
	self:_stance_entered()

	if _G.IS_VR then
		managers.hud:belt():set_visible(false)
		self._unit:hand():set_belt_active(false)

		local hand = managers.vr:get_setting("default_weapon_hand")
		local aim_hand = hand == "right" and PlayerHand.RIGHT or PlayerHand.LEFT
		local off_hand = aim_hand == PlayerHand.RIGHT and PlayerHand.LEFT or PlayerHand.RIGHT

		self._unit:hand():_set_hand_state(off_hand, "idle")

		self._primary_hand = aim_hand
	end
end

function PlayerTurret:exit(state_data, new_state_name)
	local exit_data = PlayerTurret.super.exit(self, state_data or self._state_data, new_state_name)
	local turret_unit = self._turret_unit
	local peer_id = managers.network:session():local_peer():id()

	if Network:is_server() then
		managers.player:server_player_turret_action(PlayerTurretBase.INTERACT_EXIT, turret_unit, peer_id, self._unit)
	else
		managers.network:session():send_to_host("sync_request_player_turret_action", PlayerTurretBase.INTERACT_EXIT, turret_unit)
		managers.player:sync_exit_player_turret(peer_id, self._unit)
	end

	self:_postion_player_exiting_turret()
	self:_check_stop_shooting()
	self:_play_equip_animation()
	self:set_animation_state("standard")
	managers.hud:set_weapon_selected_by_inventory_index(self._ext_inventory:equipped_selection())

	for index, weapon in pairs(self._ext_inventory:available_selections()) do
		managers.hud:set_ammo_amount(index, weapon.unit:base():ammo_info())
	end

	self._unit:sound_source():post_event("wp_steady_out")
	self._ext_camera:camera_unit():base():remove_limits()
	self:_activate_mover(PlayerStandard.MOVER_STAND)

	self._state_data.previous_state = "player_turret"

	if _G.IS_VR then
		self._unit:hand():_change_hand_to_default(PlayerHand.RIGHT)
		self._unit:hand():_change_hand_to_default(PlayerHand.LEFT)
		self._unit:hand():set_belt_active(true)
		managers.hud:belt():set_visible(true)
	end

	return exit_data
end

function PlayerTurret:_postion_player_on_turret()
	local attach_local_pos = self._turret_unit:base():get_attach_point_local_pos(false)
	local spin, pitch = self._turret_unit:movement():get_spin_pitch()
	local new_player_position = tmp_vec1
	local turret_rotation = tmp_rot1

	mrotation.set_yaw_pitch_roll(turret_rotation, spin, 0, 0)
	mrotation.multiply(turret_rotation, self._turret_unit:rotation())
	mvector3.set(new_player_position, attach_local_pos)
	mvector3.rotate_with(new_player_position, turret_rotation)
	mvector3.add(new_player_position, self._turret_unit:position())
	self._unit:set_position(new_player_position)
	self._ext_movement:set_m_pos(self._unit:position())

	local attach_point_obj = self._turret_unit:base():get_attach_point_obj(false)
	local rot = (attach_point_obj or self._turret_unit):rotation()
	local pos = (attach_point_obj or self._turret_unit):position()

	self._ext_camera:set_rotation(rot)
	self._ext_camera:set_position(pos)

	local camera_base = self._ext_camera:camera_unit():base()

	camera_base:set_spin(spin + rot:y():to_polar().spin)
	camera_base:set_pitch(pitch)
	camera_base:set_limits(self.camera_spin_limit, self.camera_pitch_limit)

	camera_base._limits.pitch.mid = 0
end

function PlayerTurret:_postion_player_exiting_turret()
	if not alive(self._turret_unit) then
		return
	end

	local attach_local_pos = self._turret_unit:base():get_attach_point_local_pos(true)
	local spin, pitch = self._turret_unit:movement():get_spin_pitch()
	local new_player_position = tmp_vec1
	local turret_rotation = tmp_rot1

	mrotation.set_yaw_pitch_roll(turret_rotation, spin, 0, 0)
	mrotation.multiply(turret_rotation, self._turret_unit:rotation())
	mvector3.set(new_player_position, attach_local_pos)
	mvector3.rotate_with(new_player_position, turret_rotation)
	mvector3.add(new_player_position, self._turret_unit:position())
	self._unit:set_position(new_player_position)
	self._ext_movement:set_m_pos(self._unit:position())
end

function PlayerTurret:push(vel)
end

function PlayerTurret:unmount_turret()
	managers.player:set_player_state("standard")
end

function PlayerTurret:get_movement_state()
	return "crouching"
end

function PlayerTurret:_stance_entered(unequipped)
	local stance_standard = tweak_data.player.stances.default.player_turret or tweak_data.player.stances.default.standard
	local head_stance = self._state_data.ducking and tweak_data.player.stances.default.crouched.head or stance_standard.head
	local stance_id = nil
	local stance_mod = {
		translation = Vector3(0, 0, 0)
	}

	if not unequipped then
		stance_id = self._equipped_unit:base():get_stance_id()

		if self._state_data.in_steelsight and self._equipped_unit:base().stance_mod then
			stance_mod = self._equipped_unit:base():stance_mod() or stance_mod
		end
	end

	local stances = tweak_data.player.stances[stance_id] or tweak_data.player.stances.default
	local misc_attribs = stances.standard
	local duration = tweak_data.player.TRANSITION_DURATION
	local duration_multiplier = 1
	local new_fov = self:get_zoom_fov(misc_attribs)

	self._camera_unit:base():clbk_stance_entered(misc_attribs.shoulders, head_stance, misc_attribs.vel_overshot, new_fov, misc_attribs.shakers, stance_mod, duration_multiplier, 0.1)
	managers.menu:set_mouse_sensitivity(self:in_steelsight())
end

function PlayerTurret:update(t, dt)
	if not alive(self._turret_unit) then
		self:unmount_turret()

		return
	end

	self:_calculate_standard_variables(t, dt)
	self:_update_ground_ray()
	self:_update_fwd_ray()

	local turret_look_dir = self._cam_fwd

	if _G.IS_VR then
		local hand_unit = self._unit:hand():hand_unit(self._primary_hand)

		if hand_unit then
			turret_look_dir = hand_unit:rotation():y()
		end
	end

	self._turret_unit:movement():set_look_dir(turret_look_dir)

	local attach_local_pos = self._turret_unit:base():get_attach_point_local_pos(false)
	local spin, pitch = self._turret_unit:movement():get_spin_pitch()
	local new_player_position = tmp_vec1
	local turret_rotation = tmp_rot1

	mrotation.set_yaw_pitch_roll(turret_rotation, spin, 0, 0)
	mrotation.multiply(turret_rotation, self._turret_unit:rotation())
	mvector3.set(new_player_position, attach_local_pos)
	mvector3.rotate_with(new_player_position, turret_rotation)
	mvector3.add(new_player_position, self._turret_unit:position())
	self._unit:set_position(new_player_position)
	self._ext_movement:set_m_pos(self._unit:position())
	self:_update_check_actions(t, dt)
	PlayerMovementState.update(self, t, dt)
end

function PlayerTurret:_update_check_actions(t, dt)
	local input = self:_get_input(t, dt)

	self:_determine_move_direction()
	self:_update_interaction_timers(t)
	self:_update_throw_projectile_timers(t, input)
	self:_update_reload_timers(t, dt, input)
	self:_update_melee_timers(t, input)
	self:_update_equip_weapon_timers(t, input)
	self:_update_running_timers(t)
	self:_update_zipline_timers(t, dt)

	if input.btn_stats_screen_press then
		self._unit:base():set_stats_screen_visible(true)
	elseif input.btn_stats_screen_release then
		self._unit:base():set_stats_screen_visible(false)
	end

	local new_action = false
	new_action = new_action or self:_check_action_unmount_turret(t, input)
	new_action = new_action or self:_check_action_reload(t, input)
	new_action = new_action or self:_check_action_primary_attack(t, input)

	self:_check_action_steelsight(t, input)
	self:_check_action_night_vision(t, input)
	self:_find_pickups(t)
end

function PlayerTurret:interaction_blocked()
	return true
end

function PlayerTurret:_turret_unmount_action_forbidden()
	return self._unit:base():stats_screen_visible() or self:_changing_weapon() or self:_interacting() or self:_is_deploying_bipod() or self._use_item_expire_t
end

function PlayerTurret:_check_action_unmount_turret(t, input)
	local move = self._controller:get_input_axis("move")
	local action_wanted = input.btn_interact_press or input.btn_jump_press or input.btn_run_state and move.y > 0.1 or input.btn_switch_weapon_press or input.btn_primary_choice or input.btn_use_item_press or input.btn_throw_grenade_press or input.btn_projectile_press

	if action_wanted then
		local action_forbidden = self:_turret_unmount_action_forbidden()

		if not action_forbidden then
			self:unmount_turret()

			self._running_wanted = input.btn_run_state

			return true
		end
	end

	return false
end

function PlayerTurret:_check_action_reload(t, dt)
end

function PlayerTurret:_check_action_steelsight(t, dt)
end

function PlayerTurret:_update_movement(t, dt)
end

function PlayerTurret:_start_action_jump(...)
end

function PlayerTurret:_perform_jump(jump_vec)
end

function PlayerTurret:_get_max_walk_speed(...)
end

function PlayerTurret:_get_walk_headbob(...)
	return 0
end

function PlayerTurret:_check_action_primary_attack(t, input)
	local new_action = nil
	local weap_base = self._turret_unit:base()
	local weapon_tweak_data = weap_base:weapon_tweak_data()

	if weap_base:clip_empty() then
		if input.btn_primary_attack_press then
			weap_base:dryfire()
		end

		self:_check_stop_shooting()

		return false
	end

	if input.btn_primary_attack_state and not self._shooting then
		if not weap_base:start_shooting_allowed() then
			self:_check_stop_shooting()

			return false
		end

		self:_check_start_shooting()
	end

	if input.btn_primary_attack_state then
		local suppression_ratio = self._ext_damage:effective_suppression_ratio()
		local spread_mul = math.lerp(1, tweak_data.player.suppression.spread_mul, suppression_ratio)
		local autohit_mul = math.lerp(1, tweak_data.player.suppression.autohit_chance_mul, suppression_ratio)
		local suppression_mul = managers.blackmarket:threat_multiplier()
		local dmg_mul = 1
		local primary_category = weapon_tweak_data.categories[1]

		if not weapon_tweak_data.ignore_damage_multipliers then
			dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "dmg_multiplier_outnumbered", 1)

			if managers.player:has_category_upgrade("player", "overkill_all_weapons") or weap_base:is_category("shotgun", "saw") then
				dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "overkill_damage_multiplier", 1)
			end

			local health_ratio = self._ext_damage:health_ratio()
			local damage_health_ratio = managers.player:get_damage_health_ratio(health_ratio, primary_category)

			if damage_health_ratio > 0 then
				local upgrade_name = weap_base:is_category("saw") and "melee_damage_health_ratio_multiplier" or "damage_health_ratio_multiplier"
				local damage_ratio = damage_health_ratio
				dmg_mul = dmg_mul * (1 + managers.player:upgrade_value("player", upgrade_name, 0) * damage_ratio)
			end

			dmg_mul = dmg_mul * managers.player:temporary_upgrade_value("temporary", "berserker_damage_multiplier", 1)
			dmg_mul = dmg_mul * managers.player:get_property("trigger_happy", 1)
		end

		local fired = weap_base:trigger_held(self:get_fire_weapon_position(), self:get_fire_weapon_direction(), dmg_mul, nil, spread_mul, autohit_mul, suppression_mul)
		new_action = true

		if fired then
			managers.rumble:play("weapon_fire")

			local shake_multiplier = weapon_tweak_data.shake and weapon_tweak_data.shake[self._state_data.in_steelsight and "fire_steelsight_multiplier" or "fire_multiplier"] or 1

			self._ext_camera:play_shaker("fire_weapon_rot", 1 * shake_multiplier)
			self._ext_camera:play_shaker("fire_weapon_kick", 1 * shake_multiplier, 1, 0.15)

			if weapon_tweak_data.kick then
				local recoil_multiplier = (weap_base:recoil() + weap_base:recoil_addend()) * weap_base:recoil_multiplier() * 10
				local up, down, left, right = unpack(weapon_tweak_data.kick[self._state_data.in_steelsight and "steelsight" or self._state_data.ducking and "crouching" or "standing"])

				self._camera_unit:base():recoil_kick(up * recoil_multiplier, down * recoil_multiplier, left * recoil_multiplier, right * recoil_multiplier)
			end

			managers.hud:set_ammo_amount(2, weap_base:ammo_info())
			self._turret_unit:network():send("shot_player_turret", not fired.hit_enemy)
			weap_base:tweak_data_anim_stop("unequip")
			weap_base:tweak_data_anim_stop("equip")
			weap_base:tweak_data_anim_play("fire", weap_base:fire_rate_multiplier())
		end
	end

	if not new_action then
		self:_check_stop_shooting()
	end

	return new_action
end

function PlayerTurret:_check_start_shooting()
	if not self._shooting then
		self._turret_unit:base():start_shooting()
		self._camera_unit:base():start_shooting()

		self._shooting = true

		return true
	end

	return false
end

function PlayerTurret:_check_stop_shooting()
	if self._shooting then
		self._turret_unit:base():stop_shooting()
		self._camera_unit:base():stop_shooting(0.1)

		self._shooting = false

		return true
	end

	return false
end
