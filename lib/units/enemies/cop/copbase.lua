local ids_lod = Idstring("lod")
local ids_lod1 = Idstring("lod1")
local ids_ik_aim = Idstring("ik_aim")
CopBase = CopBase or class(UnitBase)
CopBase._anim_lods = {
	{
		2,
		500,
		100,
		5000
	},
	{
		2,
		0,
		100,
		1
	},
	{
		3,
		0,
		100,
		1
	}
}
CopBase._material_translation_map = {}
local character_path = ""
local char_map = tweak_data.character.character_map()

for _, data in pairs(char_map) do
	for _, character in ipairs(data.list) do
		character_path = data.path .. character .. "/" .. character
		CopBase._material_translation_map[tostring(Idstring(character_path):key())] = Idstring(character_path .. "_contour")
		CopBase._material_translation_map[tostring(Idstring(character_path .. "_contour"):key())] = Idstring(character_path)
	end
end

function CopBase:init(unit)
	UnitBase.init(self, unit, false)

	self._unit = unit
	self._char_tweak = tweak_data.character[self._tweak_table]

	self:_set_tags(self._char_tweak.tags)

	self._visibility_state = true
	self._foot_obj_map = {
		right = self._unit:get_object(Idstring("RightToeBase")),
		left = self._unit:get_object(Idstring("LeftToeBase"))
	}
	self._is_in_original_material = true
	self._buffs = {}
	self._original_tweak_table = self._tweak_table
	self._original_stats_name = self._stats_name
end

function CopBase:post_init()
	self._ext_movement = self._unit:movement()
	self._ext_anim = self._unit:anim_data()

	self:set_anim_lod(1)

	self._lod_stage = 1

	self._ext_movement:post_init(true)
	self._unit:brain():post_init()
	managers.enemy:register_enemy(self._unit)
	self:_chk_spawn_gear()
	self:enable_leg_arm_hitbox()

	if self._post_init_change_tweak_name then
		local new_tweak_name = self._post_init_change_tweak_name
		self._post_init_change_tweak_name = nil

		self:change_char_tweak(new_tweak_name)
	end
end

function CopBase:hide_and_remove_collisions_for_a_few_frames(frames)
	frames = frames or 6

	if self._hidden_frames then
		self._hidden_frames = frames

		return
	end

	self._unit:set_extension_update_enabled(Idstring("base"), true)

	self._hidden_frames = frames

	self:prevent_main_bones_disabling(true)
	self:set_force_invisible(true)

	local char_dmg_ext = self._unit:character_damage()

	if char_dmg_ext and char_dmg_ext.set_mover_collision_state then
		char_dmg_ext:set_mover_collision_state(false)
	end
end

function CopBase:update(unit, t, dt)
	if not self._hidden_frames then
		self._unit:set_extension_update_enabled(Idstring("base"), false)

		return
	end

	self._hidden_frames = self._hidden_frames - 1

	if self._hidden_frames <= 0 then
		self._hidden_frames = nil

		self._unit:set_extension_update_enabled(Idstring("base"), false)
		self:prevent_main_bones_disabling(false)
		self:set_force_invisible(false)

		local char_dmg_ext = self._unit:character_damage()

		if char_dmg_ext and char_dmg_ext.set_mover_collision_state then
			char_dmg_ext:set_mover_collision_state(true)
		end
	end
end

function CopBase:enable_leg_arm_hitbox()
	if self._unit:damage() and self._unit:damage():has_sequence("leg_arm_hitbox") then
		self._unit:damage():run_sequence_simple("leg_arm_hitbox")
	else
		Application:error("Unit " .. tostring(self._unit) .. " has no 'leg_arm_hitbox' sequence! Leg and arm hitboxes will not be enabled.")
	end
end

function CopBase:_chk_spawn_gear()
	local tweak = managers.job:current_level_data()

	if tweak and tweak.is_christmas_heist then
		if self._tweak_table == "spooc" then
			self._headwear_unit = safe_spawn_unit("units/payday2/characters/ene_acc_spook_santa_hat/ene_acc_spook_santa_hat", Vector3(), Rotation())
		elseif managers.perpetual_event:has_event_santa_hats() then
			if self._tweak_table == "tank_medic" or self._tweak_table == "tank_mini" then
				self._headwear_unit = safe_spawn_unit("units/pd2_dlc_xm20/characters/ene_acc_dozer_zeal_santa_hat/ene_acc_dozer_zeal_santa_hat", Vector3(), Rotation())
			elseif self._tweak_table == "tank" then
				local region = tweak_data.levels:get_ai_group_type()
				local difficulty_index = tweak_data:difficulty_to_index(Global and Global.game_settings and Global.game_settings.difficulty or "overkill")

				if region == "russia" or region == "federales" then
					self._headwear_unit = safe_spawn_unit("units/pd2_dlc_xm20/characters/ene_acc_dozer_akan_santa_hat/ene_acc_dozer_akan_santa_hat", Vector3(), Rotation())
				elseif difficulty_index == 8 then
					self._headwear_unit = safe_spawn_unit("units/pd2_dlc_xm20/characters/ene_acc_dozer_zeal_santa_hat/ene_acc_dozer_zeal_santa_hat", Vector3(), Rotation())
				else
					self._headwear_unit = safe_spawn_unit("units/pd2_dlc_xm20/characters/ene_acc_dozer_santa_hat/ene_acc_dozer_santa_hat", Vector3(), Rotation())
				end
			end
		end

		if self._headwear_unit then
			local align_obj_name = Idstring("Head")
			local align_obj = self._unit:get_object(align_obj_name)

			self._unit:link(align_obj_name, self._headwear_unit, self._headwear_unit:orientation_object():name())
		end
	end
end

function CopBase:_set_tags(tags)
	local tag_type = type(tags)

	if tag_type == "table" then
		self._tags = table.list_to_set(clone(tags))
	elseif tag_type == "string" then
		self._tags = {
			[tags] = true
		}
	else
		self._tags = nil
	end
end

function CopBase:has_tag(tag)
	return self._tags and self._tags[tag] or false
end

function CopBase:has_all_tags(tags)
	local my_tags = self._tags

	if not my_tags then
		return false
	end

	for _, tag in pairs(tags) do
		if not my_tags[tag] then
			return false
		end
	end

	return true
end

function CopBase:has_any_tag(tags)
	local my_tags = self._tags

	if not my_tags then
		return false
	end

	for _, tag in pairs(tags) do
		if my_tags[tag] then
			return true
		end
	end

	return false
end

function CopBase:get_tags()
	return self._tags
end

function CopBase:default_weapon_name(selection_name)
	local weap_ids = tweak_data.character.weap_ids
	local weap_unit_names = tweak_data.character.weap_unit_names

	if selection_name and self._default_weapons then
		local weapon_id = self._default_weapons[selection_name]

		if weapon_id then
			for i_weap_id, weap_id in ipairs(weap_ids) do
				if weapon_id == weap_id then
					return weap_unit_names[i_weap_id]
				end
			end

			Application:error("[CopBase:default_weapon_name] No weapon unit name in CharacterTweakData with id '" .. weapon_id .. "' with selection '" .. selection_name .. "' for unit:", self._unit)
		end
	end

	local default_weapon_id = self._default_weapon_id

	for i_weap_id, weap_id in ipairs(weap_ids) do
		if default_weapon_id == weap_id then
			return weap_unit_names[i_weap_id]
		end
	end

	Application:error("[CopBase:default_weapon_name] No weapon unit name in CharacterTweakData with default weapon id '" .. default_weapon_id .. "' for unit:", self._unit)
end

function CopBase:visibility_state()
	return self._visibility_state
end

function CopBase:lod_stage()
	return self._lod_stage
end

function CopBase:prevent_invisibility(state)
	state = state and true or false

	if state then
		if self._prevent_invisible then
			self._prevent_invisible = self._prevent_invisible + 1

			return
		else
			self._prevent_invisible = 1
		end
	elseif self._prevent_invisible then
		self._prevent_invisible = self._prevent_invisible - 1

		if self._prevent_invisible <= 0 then
			self._prevent_invisible = nil
		else
			return
		end
	else
		return
	end

	if self._prevent_invisible and not self._lod_stage then
		self:set_visibility_state(false)
	end
end

function CopBase:set_force_invisible(state)
	if state then
		if not self._force_invisible then
			self._force_invisible = true

			self:_update_visibility_state(false)
			self:set_anim_lod(false)
			self:chk_freeze_anims()
		end
	elseif self._force_invisible then
		self._force_invisible = false
		local new_lod = self._lod_stage
		self._lod_stage = false

		self:set_visibility_state(new_lod)
	end
end

function CopBase:set_visibility_state(stage)
	local state = stage and true

	if not state and self._prevent_invisible then
		state = true
		stage = 3
	end

	if self._force_invisible then
		self._lod_stage = stage

		return
	end

	if self._lod_stage == stage then
		return
	end

	if self._visibility_state ~= state then
		self:_update_visibility_state(state)
	end

	self:set_anim_lod(stage)

	self._lod_stage = stage

	self:chk_freeze_anims()
end

function CopBase:_update_visibility_state(state)
	self._unit:set_visible(state)

	local inventory = self._unit:inventory()

	if inventory then
		inventory:set_visibility_state(state)
	end

	if self._headwear_unit then
		self._headwear_unit:set_visible(state)
	end

	local spawn_manager_ext = self._unit:spawn_manager()

	if spawn_manager_ext then
		spawn_manager_ext:set_visibility_state(state)
	end

	self._visibility_state = state
end

function CopBase:set_anim_lod(stage)
	self._unit:set_animation_lod(unpack(self._anim_lods[stage or #self._anim_lods]))

	local inventory = self._unit:inventory()

	if inventory and inventory.set_lod_stage then
		inventory:set_lod_stage(stage)
	end

	if stage == 1 then
		self._unit:set_animatable_enabled(ids_lod1, true)
	elseif self._lod_stage == 1 then
		if self._ext_anim.recoil_auto and not self.is_husk_player then
			self._ext_movement:play_redirect("up_idle")
		end

		self._unit:set_animatable_enabled(ids_lod1, false)
	end
end

function CopBase:on_death_exit()
	self._unit:set_animations_enabled(false)
end

function CopBase:chk_freeze_anims()
	if (self._force_invisible or not self._lod_stage or self._lod_stage > 1) and self._ext_anim.can_freeze and not self._ext_anim.upper_body_active and not self._ext_anim.upper_body_ext_active then
		if not self._anims_frozen then
			self._anims_frozen = true

			self._unit:set_animations_enabled(false)
			self._ext_movement:on_anim_freeze(true)

			if self._force_invisible or not self._lod_stage then
				self:_set_animated_bones_state(false)
			end
		end
	elseif self._anims_frozen then
		self._anims_frozen = nil

		self._unit:set_animations_enabled(true)
		self._ext_movement:on_anim_freeze(false)

		if not self._force_invisible and self._lod_stage then
			self:_set_animated_bones_state(true)
		end
	end
end

function CopBase:prevent_main_bones_disabling(state)
	if state then
		if self._prevent_main_bones_disabling then
			self._prevent_main_bones_disabling = self._prevent_main_bones_disabling + 1

			return
		else
			self._prevent_main_bones_disabling = 1
		end
	elseif self._prevent_main_bones_disabling then
		self._prevent_main_bones_disabling = self._prevent_main_bones_disabling - 1

		if self._prevent_main_bones_disabling <= 0 then
			self._prevent_main_bones_disabling = nil
		else
			return
		end
	else
		return
	end

	if state then
		self:_set_animated_bones_state(true, true)
	elseif (self._force_invisible or not self._lod_stage) and self._ext_anim.can_freeze and not self._ext_anim.upper_body_active and not self._ext_anim.upper_body_ext_active then
		self:_set_animated_bones_state(false, true)
	else
		self:_set_animated_bones_state(true, true)
	end
end

function CopBase:_set_animated_bones_state(state, changing_prevention_state)
	if not changing_prevention_state and self._prevent_main_bones_disabling then
		return
	end

	self._unit:set_animatable_enabled(ids_lod, state)
	self._unit:set_animatable_enabled(ids_ik_aim, state)
end

function CopBase:anim_act_clbk(unit, anim_act, send_to_action)
	if send_to_action then
		unit:movement():on_anim_act_clbk(anim_act)
	elseif unit:unit_data().mission_element then
		unit:unit_data().mission_element:event(anim_act, unit)
	end
end

function CopBase:save(save_data)
	local my_save_data = {}

	if self._unit:interaction() and self._unit:interaction().tweak_data == "hostage_trade" then
		my_save_data.is_hostage_trade = true
	elseif self._unit:interaction() and self._unit:interaction().tweak_data == "hostage_convert" then
		my_save_data.is_hostage_convert = true
	end

	local buffs = {}

	for name, buff_list in pairs(self._buffs) do
		buffs[name] = {
			_total = buff_list._total
		}
	end

	if next(buffs) then
		my_save_data.buffs = buffs
	end

	if self._tweak_table ~= self._original_tweak_table then
		my_save_data.tweak_name_swap = self._tweak_table
	end

	if self._stats_name ~= self._original_stats_name then
		my_save_data.stats_name_swap = self._stats_name
	end

	if next(my_save_data) then
		save_data.base = my_save_data
	end
end

function CopBase:load(load_data)
	local my_load_data = load_data.base

	if not my_load_data then
		return
	end

	if my_load_data.is_hostage_trade then
		CopLogicTrade.hostage_trade(self._unit, true, false)
	elseif my_load_data.is_hostage_convert then
		self._unit:interaction():set_tweak_data("hostage_convert")
	end

	if my_load_data.buffs then
		self._buffs = my_load_data.buffs
	end

	if my_load_data.tweak_name_swap and my_load_data.tweak_name_swap ~= self._tweak_table then
		self._post_init_change_tweak_name = my_load_data.tweak_name_swap
	end

	if my_load_data.stats_name_swap and my_load_data.stats_name_swap ~= self._stats_name then
		self:change_stats_name(my_load_data.stats_name_swap)
	end
end

function CopBase:swap_material_config(material_applied_clbk)
	local new_material = self._material_translation_map[self._loading_material_key or tostring(self._unit:material_config():key())]

	if new_material then
		self._loading_material_key = new_material:key()
		self._is_in_original_material = not self._is_in_original_material

		self._unit:set_material_config(new_material, true, material_applied_clbk and callback(self, self, "on_material_applied", material_applied_clbk), 100)

		if not material_applied_clbk then
			self:on_material_applied()
		end
	else
		print("[CopBase:swap_material_config] fail", self._unit:material_config(), self._unit)
		Application:stack_dump()
	end
end

function CopBase:on_material_applied(material_applied_clbk)
	if not alive(self._unit) then
		return
	end

	self._loading_material_key = nil

	if self._unit:interaction() then
		self._unit:interaction():refresh_material()
	end

	if material_applied_clbk then
		material_applied_clbk()
	end
end

function CopBase:is_in_original_material()
	return self._is_in_original_material
end

function CopBase:set_material_state(original)
	if original and not self._is_in_original_material or not original and self._is_in_original_material then
		self:swap_material_config()
	end
end

function CopBase:char_tweak_name()
	return self._tweak_table
end

function CopBase:char_tweak()
	return self._char_tweak
end

function CopBase:melee_weapon()
	return self._melee_weapon_table or self._char_tweak.melee_weapon or "weapon"
end

function CopBase:pre_destroy(unit)
	if alive(self._headwear_unit) then
		self._headwear_unit:set_slot(0)

		self._headwear_unit = nil
	end

	unit:brain():pre_destroy(unit)
	self._ext_movement:pre_destroy()
	self._unit:inventory():pre_destroy()
	UnitBase.pre_destroy(self, unit)

	self._tweak_data_listener_holder = nil
end

function CopBase:_refresh_buff_total(name)
	local buff_list = self._buffs[name]
	local sum = 0

	for _, buff in pairs(buff_list.buffs) do
		sum = sum + buff
	end

	local sync_value = math.round(sum * 1000)
	buff_list._total = sync_value * 0.001

	managers.network:session():send_to_peers_synched("sync_enemy_buff", self._unit, name, sync_value)
end

function CopBase:_sync_buff_total(name, total)
	self._buffs[name] = self._buffs[name] or {}
	self._buffs[name]._total = total * 0.001
end

function CopBase:add_buff(name, value)
	if not Network:is_server() then
		return
	end

	local buff_list = self._buffs[name]

	if not buff_list then
		buff_list = {
			_next_id = 1,
			buffs = {}
		}
		self._buffs[name] = buff_list
	end

	local buff_list = self._buffs[name]
	local id = buff_list._next_id
	buff_list.buffs[id] = value
	buff_list._next_id = id + 1

	self:_refresh_buff_total(name)

	return id
end

function CopBase:remove_buff_by_id(name, id)
	if not Network:is_server() then
		return
	end

	local buff_list = self._buffs[name]

	if not buff_list then
		return
	end

	buff_list.buffs[id] = nil

	self:_refresh_buff_total(name)
end

function CopBase:get_total_buff(name)
	local buff_list = self._buffs[name]

	if not buff_list then
		return 0
	end

	if buff_list and buff_list._total then
		return buff_list._total
	end

	return 0
end

function CopBase:add_tweak_data_changed_listener(key, clbk)
	if not self._tweak_data_listener_holder then
		self._tweak_data_listener_holder = ListenerHolder:new()
	end

	self._tweak_data_listener_holder:add(key, clbk)
end

function CopBase:remove_tweak_data_changed_listener(key)
	if not self._tweak_data_listener_holder then
		return
	end

	self._tweak_data_listener_holder:remove(key)

	if self._tweak_data_listener_holder:is_empty() then
		self._tweak_data_listener_holder = nil
	end
end

function CopBase:_chk_call_tweak_data_changed_listeners(...)
	if self._tweak_data_listener_holder then
		self._tweak_data_listener_holder:call(...)
	end
end

function CopBase:change_char_tweak(new_tweak_name)
	local new_tweak_data = tweak_data.character[new_tweak_name]

	if not new_tweak_data then
		return
	end

	if new_tweak_name == self._tweak_table then
		return
	end

	local old_tweak_data = self._char_tweak
	self._tweak_table = new_tweak_name
	self._char_tweak = new_tweak_data
	local old_tags = self._tags
	local was_special = self:has_tag("special")

	self:_set_tags(new_tweak_data.tags)

	if was_special then
		managers.groupai:state():on_unit_tags_updated(self._unit, old_tags, self._tags)
	end

	self:_chk_call_tweak_data_changed_listeners(old_tweak_data, new_tweak_data)
end

function CopBase:change_stats_name(new_stats_name)
	if not new_stats_name or new_stats_name == self._stats_name then
		return
	end

	self._stats_name = new_stats_name
end
