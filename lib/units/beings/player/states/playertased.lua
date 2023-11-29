PlayerTased = PlayerTased or class(PlayerStandard)
PlayerTased._update_movement = PlayerBleedOut._update_movement

function PlayerTased:init(...)
	PlayerTased.super.init(self, ...)

	self._single_shot_autofire = nil
	local pm = managers.player
	self._resist_tase = pm:has_category_upgrade("player", "resist_firing_tased")
	self._non_lethal_tase_time_mul = pm:upgrade_value("player", "electrocution_resistance_multiplier", 1)
	self._escape_tase_t = pm:has_category_upgrade("player", "escape_taser") and pm:upgrade_value("player", "escape_taser", 2)
	self._taser_malfunction_data = pm:has_category_upgrade("player", "taser_malfunction") and pm:upgrade_value("player", "taser_malfunction")
end

function PlayerTased:enter(state_data, enter_data)
	PlayerTased.super.enter(self, state_data, enter_data)

	local projectile_entry = managers.blackmarket:equipped_projectile()

	if tweak_data.blackmarket.projectiles[projectile_entry].is_a_grenade then
		self:_interupt_action_throw_grenade()
	else
		self:_interupt_action_throw_projectile()
	end

	self:_interupt_action_reload()
	self:_interupt_action_steelsight()

	local t = managers.player:player_timer():time()

	self:_interupt_action_melee(t)
	self:_interupt_action_ladder(t)
	self:_interupt_action_charging_weapon(t)
	self:_start_action_tased(managers.player:player_timer():time(), state_data.non_lethal_electrocution)

	local non_lethal = state_data.non_lethal_electrocution

	if non_lethal then
		state_data.non_lethal_electrocution = nil
		local recover_time = TimerManager:game():time() + tweak_data.player.damage.TASED_TIME * self._non_lethal_tase_time_mul * (state_data.electrocution_duration_multiplier or 1)
		state_data.electrocution_duration_multiplier = nil
		self._recover_delayed_clbk = "PlayerTased_recover_delayed_clbk"

		managers.enemy:add_delayed_clbk(self._recover_delayed_clbk, callback(self, self, "clbk_exit_to_std"), recover_time)
	else
		self._fatal_delayed_clbk = "PlayerTased_fatal_delayed_clbk"
		local tased_time = tweak_data.player.damage.TASED_TIME
		tased_time = managers.modifiers:modify_value("PlayerTased:TasedTime", tased_time)

		managers.enemy:add_delayed_clbk(self._fatal_delayed_clbk, callback(self, self, "clbk_exit_to_fatal"), TimerManager:game():time() + tased_time)

		if Network:is_server() then
			self:_register_revive_SO()
		end
	end

	self._countering_tase = nil
	self._next_shock = 0.5
	self._taser_value = 1
	self._num_shocks = 0

	managers.groupai:state():on_criminal_disabled(self._unit, "electrified")

	if not non_lethal then
		self._equipped_unit:base():on_reload()
	end

	self._rumble_electrified = managers.rumble:play("electrified")
	self.tased = true
	self._state_data = state_data

	CopDamage.register_listener("on_criminal_tased", {
		"on_criminal_tased"
	}, callback(self, self, "_on_tased_event"))
end

function PlayerTased:_enter(enter_data)
	self._unit:base():set_slot(self._unit, 2)
	self._unit:camera():camera_unit():base():set_target_tilt(0)
	self._ext_movement:set_attention_settings({
		"pl_friend_combatant_cbt",
		"pl_friend_non_combatant_cbt",
		"pl_foe_combatant_cbt_stand",
		"pl_foe_non_combatant_cbt_stand"
	})

	if Network:is_server() and self._ext_movement:nav_tracker() then
		managers.groupai:state():on_player_weapons_hot()
	end
end

function PlayerTased:exit(state_data, enter_data)
	PlayerTased.super.exit(self, state_data, enter_data)

	if self._fatal_delayed_clbk then
		managers.enemy:remove_delayed_clbk(self._fatal_delayed_clbk)

		self._fatal_delayed_clbk = nil
	end

	if self._recover_delayed_clbk then
		managers.enemy:remove_delayed_clbk(self._recover_delayed_clbk)

		self._recover_delayed_clbk = nil
	end

	if Network:is_server() and self._SO_id then
		managers.groupai:state():remove_special_objective(self._SO_id)
	end

	managers.environment_controller:set_taser_value(1)
	self._camera_unit:base():break_recoil()
	managers.rumble:stop(self._rumble_electrified)
	self._unit:camera():play_redirect(Idstring("idle"))

	self._tase_ended = nil
	self._countering_tase = nil
	self._counter_taser_unit = nil
	self._num_shocks = nil
	self.tased = false
	self._state_data.non_lethal_electrocution = nil

	if self._escape_tase_t then
		managers.hud:remove_interact()
	end

	managers.player:unregister_message(Message.SendTaserMalfunction, "taser_malfunction")
	managers.player:unregister_message(Message.EscapeTase, "escape_tase")
	CopDamage.unregister_listener("on_criminal_tased")
end

function PlayerTased:interaction_blocked()
	return true
end

function PlayerTased:update(t, dt)
	PlayerTased.super.update(self, t, dt)
end

function PlayerTased:_update_check_actions(t, dt)
	local input = self:_get_input(t, dt)

	self:_check_action_shock(t, input)

	self._taser_value = math.step(self._taser_value, 0.8, dt / 4)

	managers.environment_controller:set_taser_value(self._taser_value)

	local shooting = self:_check_action_primary_attack(t, input)

	if shooting then
		self._camera_unit:base():recoil_kick(-5, 5, -5, 5)
	end

	if self._unequip_weapon_expire_t and self._unequip_weapon_expire_t <= t then
		self._unequip_weapon_expire_t = nil

		self:_start_action_equip_weapon(t)
	end

	if self._equip_weapon_expire_t and self._equip_weapon_expire_t <= t then
		self._equip_weapon_expire_t = nil
	end

	if input.btn_stats_screen_press then
		self._unit:base():set_stats_screen_visible(true)
	elseif input.btn_stats_screen_release then
		self._unit:base():set_stats_screen_visible(false)
	end

	self:_update_foley(t, input)

	local new_action = nil

	self:_check_action_interact(t, input)

	local new_action = nil
end

function PlayerTased:_check_action_shock(t, input)
	self._next_shock = self._next_shock or 0.5

	if self._next_shock < t then
		self._num_shocks = self._num_shocks or 0
		self._num_shocks = self._num_shocks + 1
		self._next_shock = t + 0.25 + math.rand(1)

		self._unit:camera():play_shaker("player_taser_shock", 1, 10)
		self._unit:camera():camera_unit():base():set_target_tilt((math.random(2) == 1 and -1 or 1) * math.random(10))

		self._taser_value = math.max((self._taser_value or 1) - 0.25, 0)

		self._unit:sound():play("tasered_shock")
		managers.rumble:play("electric_shock")

		if not self._countering_tase then
			self._camera_unit:base():start_shooting()

			self._recoil_t = t + 0.5

			if not self._resist_tase then
				input.btn_primary_attack_state = true
				input.btn_primary_attack_press = true
			end

			self._camera_unit:base():recoil_kick(-5, 5, -5, 5)
			self._unit:camera():play_redirect(self:get_animation("tased_boost"))
		end
	elseif self._recoil_t then
		if not self._resist_tase then
			input.btn_primary_attack_state = true
		end

		if self._recoil_t < t then
			self._recoil_t = nil

			self._camera_unit:base():stop_shooting()
		end
	end
end

PlayerTased._primary_action_funcs = deep_clone(PlayerTased.super._primary_action_funcs)
PlayerTased._primary_action_funcs.start_fire = {
	default = function (self, t, input, params, weap_unit, weap_base)
		weap_base:start_shooting()
		self._camera_unit:base():start_shooting()

		if not self._state_data.in_steelsight or not weap_base:tweak_data_anim_play("fire_steelsight", weap_base:fire_rate_multiplier()) then
			weap_base:tweak_data_anim_play("fire", weap_base:fire_rate_multiplier())
		end

		return true
	end
}
PlayerTased._primary_action_funcs.sync_blank = {
	default = function (self, t, input, params, weap_unit, weap_base, impact)
		self._ext_network:send("shot_blank", impact, 0)

		return true
	end
}
PlayerTased._primary_action_get_value = deep_clone(PlayerTased.super._primary_action_get_value)

function PlayerTased._primary_action_get_value.fired:single(t, input, params, weap_unit, weap_base, start_shooting, fire_on_release, ...)
	local result, trigger_pressed = nil

	if start_shooting then
		trigger_pressed = input.btn_primary_attack_press

		if not trigger_pressed then
			trigger_pressed = self._primary_attack_input_cache and self._primary_attack_input_cache < weap_base:weapon_fire_rate() / weap_base:fire_rate_multiplier()

			if trigger_pressed then
				self._primary_attack_input_cache = nil
			end
		end
	end

	if trigger_pressed then
		result = weap_base:trigger_pressed(self._ext_camera:position(), self._ext_camera:forward(), ...)

		if fire_on_release then
			if weap_base.set_tased_shot then
				weap_base:set_tased_shot(true)
			end

			result = weap_base:trigger_released(self._ext_camera:position(), self._ext_camera:forward(), ...)

			if weap_base.set_tased_shot then
				weap_base:set_tased_shot(false)
			end
		end
	end

	return result
end

function PlayerTased._primary_action_get_value.chk_start_fire:single(t, input, params, weap_unit, weap_base)
	if input.btn_primary_attack_press then
		return true
	end

	return self._primary_attack_input_cache and self._primary_attack_input_cache < weap_base:weapon_fire_rate() / weap_base:fire_rate_multiplier()
end

PlayerTased._primary_action_get_value.check_stop_shooting_volley = {
	volley = function (self, t, input, params, weap_unit, weap_base)
		weap_base:stop_shooting()
		self._camera_unit:base():stop_shooting()

		return false
	end
}

function PlayerTased:_chk_action_stop_shooting(new_action)
	if not new_action and self._shooting then
		self._equipped_unit:base():stop_shooting()
		self._camera_unit:base():stop_shooting()
	end

	self._shooting = new_action
end

function PlayerTased:_check_action_primary_attack(t, input)
	local params = {
		no_shake = true,
		no_rumble = true,
		no_reload = true,
		no_running = true,
		no_steelsight = true,
		no_recharge_clbk = true,
		no_recoil_anim_redirect = true,
		no_start_fire_on_release = true,
		no_check_stop_shooting_early = true
	}

	if self._num_shocks > 1 then
		local weap_base = self._equipped_unit and self._equipped_unit:base()
		params.block_fire = weap_base and weap_base.can_refire_while_tased and not weap_base:can_refire_while_tased()
	end

	params.action_wanted = (input.btn_primary_attack_state or self:is_shooting_count() or self:_is_charging_weapon()) and true or false
	params.action_forbidden = (self:chk_action_forbidden("primary_attack") or self:_is_reloading() or self:_changing_weapon() or self._melee_expire_t or self._use_item_expire_t or self:_interacting() or self._countering_tase) and true or false

	return PlayerTased.super._check_action_primary_attack(self, t, input, params)
end

function PlayerTased:_start_action_charging_weapon(t)
	PlayerTased.super._start_action_charging_weapon(self, t, true)
end

function PlayerTased:_end_action_charging_weapon(t)
	PlayerTased.super._end_action_charging_weapon(self, t, true)
end

function PlayerTased:_check_action_interact(t, input)
	if input.btn_interact_press and (not self._intimidate_t or tweak_data.player.movement_state.interaction_delay < t - self._intimidate_t) and not self._countering_tase then
		if _G.IS_VR then
			self._interact_hand = input.btn_interact_left_press and PlayerHand.LEFT or PlayerHand.RIGHT
		end

		self._intimidate_t = t

		self:call_teammate(nil, t, true, true)
	end
end

function PlayerTased:call_teammate(line, t, no_gesture, skip_alert)
	local voice_type, plural, prime_target = self:_get_unit_intimidation_action(true, false, false, true, false)
	local interact_type, queue_name = nil

	if voice_type == "stop_cop" or voice_type == "mark_cop" then
		local prime_target_tweak = tweak_data.character[prime_target.unit:base()._tweak_table]
		local shout_sound = prime_target_tweak.priority_shout

		if managers.groupai:state():whisper_mode() then
			shout_sound = prime_target_tweak.silent_priority_shout or shout_sound
		end

		if shout_sound then
			interact_type = "cmd_point"
			queue_name = "s07x_sin"

			if self._highlight_special_mul then
				local contour_ext = prime_target.unit:contour()

				if contour_ext then
					contour_ext:add(managers.player:get_contour_for_marked_enemy(), true, self._highlight_special_mul)
				end
			end
		end
	end

	if interact_type then
		self:_do_action_intimidate(t, not no_gesture and interact_type or nil, queue_name, skip_alert)
	end
end

function PlayerTased:_start_action_tased(t, non_lethal)
	self:_interupt_action_running(t)
	self:_stance_entered()
	self:_update_crosshair_offset()
	self._unit:camera():play_redirect(self:get_animation("tased"))
	managers.hint:show_hint(non_lethal and "hint_been_electrocuted" or "hint_been_tasered")
end

function PlayerTased:_start_action_counter_tase(t, prime_target)
	self._countering_tase = true
	self._counter_taser_unit = prime_target.unit

	self._unit:camera():play_redirect(self:get_animation("tased_counter"))
end

function PlayerTased:_register_revive_SO()
	if self._SO_id or not managers.navigation:is_data_ready() then
		return
	end

	local objective = {
		scan = true,
		destroy_clbk_key = false,
		type = "follow",
		called = true,
		follow_unit = self._unit,
		nav_seg = self._unit:movement():nav_tracker():nav_segment()
	}
	local so_descriptor = {
		interval = 6,
		chance_inc = 0,
		search_dis_sq = 25000000,
		base_chance = 1,
		usage_amount = 1,
		AI_group = "friendlies",
		objective = objective,
		search_pos = self._unit:position()
	}
	local so_id = "PlayerTased_assistance"
	self._SO_id = so_id

	managers.groupai:state():add_special_objective(so_id, so_descriptor)
end

function PlayerTased:clbk_exit_to_fatal()
	self._fatal_delayed_clbk = nil

	managers.player:set_player_state("incapacitated")
end

function PlayerTased:clbk_exit_to_std()
	self._recover_delayed_clbk = nil

	Application:debug("PlayerTased:clbk_exit_to_std(), game_state_machine:last_queued_state_name()", game_state_machine:last_queued_state_name())

	local current_state_name = managers.player:current_state()

	if current_state_name == "tased" and managers.network:session() then
		managers.player:set_player_state("standard")
	end
end

function PlayerTased:on_tase_ended()
	self._tase_ended = true

	if self._fatal_delayed_clbk then
		managers.enemy:remove_delayed_clbk(self._fatal_delayed_clbk)

		self._fatal_delayed_clbk = nil
	end

	local current_state_name = managers.player:current_state()

	if not self._recover_delayed_clbk and current_state_name == "tased" and managers.network:session() then
		self._recover_delayed_clbk = "PlayerTased_recover_delayed_clbk"

		managers.enemy:add_delayed_clbk(self._recover_delayed_clbk, callback(self, self, "clbk_exit_to_std"), TimerManager:game():time() + tweak_data.player.damage.TASED_RECOVER_TIME)
	end

	self._taser_unit = nil
end

function PlayerTased:_on_tased_event(taser_unit, tased_unit)
	if self._unit == tased_unit then
		self._taser_unit = taser_unit

		if self._taser_malfunction_data then
			local function clbk()
				self:_on_malfunction_to_taser_event()
			end

			managers.player:register_message(Message.SendTaserMalfunction, "taser_malfunction", clbk)
			managers.player:add_coroutine("taser_malfunction", PlayerAction.TaserMalfunction, managers.player, self._taser_malfunction_data.interval, self._taser_malfunction_data.chance_to_trigger)
		end

		if self._escape_tase_t then
			local interact_string = managers.localization:text("hud_int_escape_taser", {
				BTN_INTERACT = managers.localization:btn_macro("interact", false)
			})

			managers.hud:show_interact({
				icon = "mugshot_electrified",
				text = interact_string
			})

			local target_time = self._escape_tase_t

			managers.player:add_coroutine("escape_tase", PlayerAction.EscapeTase, managers.player, managers.hud, TimerManager:game():time() + target_time)

			local function clbk()
				self:give_shock_to_taser_no_damage()
			end

			managers.player:register_message(Message.EscapeTase, "escape_tase", clbk)
		end
	end
end

function PlayerTased:give_shock_to_taser()
	if not alive(self._counter_taser_unit) then
		return
	end

	return

	self:_give_shock_to_taser(self._counter_taser_unit)
end

function PlayerTased:_give_shock_to_taser(taser_unit)
	return

	local action_data = {
		variant = "counter_tased",
		damage = taser_unit:character_damage()._HEALTH_INIT * (tweak_data.upgrades.counter_taser_damage or 0.2),
		damage_effect = taser_unit:character_damage()._HEALTH_INIT * 2,
		attacker_unit = self._unit,
		attack_dir = -taser_unit:movement()._action_common_data.fwd,
		col_ray = {
			position = mvector3.copy(taser_unit:movement():m_head_pos()),
			body = taser_unit:body("body")
		}
	}

	taser_unit:character_damage():damage_melee(action_data)
end

function PlayerTased:give_shock_to_taser_no_damage()
	local taser_unit = self._taser_unit
	local char_dmg_ext = alive(taser_unit) and taser_unit:character_damage()

	if not char_dmg_ext or not char_dmg_ext.force_hurt then
		return
	end

	local pos = mvector3.copy(taser_unit:movement():m_head_pos())
	local damage_info = {
		damage = 0,
		variant = "counter_tased",
		pos = pos,
		attack_dir = -taser_unit:movement()._action_common_data.fwd,
		col_ray = {
			unit = taser_unit,
			position = pos
		},
		result = {
			variant = "counter_tased",
			type = "counter_tased"
		}
	}

	char_dmg_ext:force_hurt(damage_info)

	local sound_ext = taser_unit:sound()

	if sound_ext then
		sound_ext:play("tase_counter_attack", nil, true)
	end
end

function PlayerTased:_on_malfunction_to_taser_event()
	local taser_unit = self._taser_unit
	local char_dmg_ext = alive(taser_unit) and taser_unit:character_damage()

	if not char_dmg_ext or not char_dmg_ext.force_hurt then
		return
	end

	local pos = mvector3.copy(taser_unit:movement():m_head_pos())
	local inv_ext = taser_unit:inventory()
	local weapon = inv_ext and inv_ext.equipped_unit and inv_ext:equipped_unit()
	local fire_obj = alive(weapon) and weapon:get_object(Idstring("fire"))

	if fire_obj then
		World:effect_manager():spawn({
			effect = Idstring("effects/payday2/particles/character/taser_stop"),
			parent = fire_obj
		})
	else
		World:effect_manager():spawn({
			effect = Idstring("effects/payday2/particles/character/taser_stop"),
			position = pos,
			normal = math.UP
		})
	end

	local damage_info = {
		damage = 0,
		variant = "knock_down",
		pos = pos,
		attack_dir = -taser_unit:movement()._action_common_data.fwd,
		col_ray = {
			unit = taser_unit,
			position = pos
		},
		result = {
			variant = "melee",
			type = "knock_down"
		}
	}

	char_dmg_ext:force_hurt(damage_info)
end
