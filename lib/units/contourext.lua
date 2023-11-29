ContourExt = ContourExt or class()
ContourExt.mod_lerp_opacity = false
ContourExt.raycast_update_skip_count = 3
local tmp_vec = Vector3()
local mvec3_dis_sq = mvector3.distance_sq
local math_lerp = math.lerp
local idstr_contour = Idstring("contour")
local idstr_material = Idstring("material")
local idstr_contour_color = Idstring("contour_color")
local idstr_contour_opacity = Idstring("contour_opacity")
ContourExt._types = {
	teammate = {
		persistence = 0.3,
		priority = 5,
		ray_check = true
	},
	teammate_downed = {
		priority = 4,
		color = tweak_data.contour.character.downed_color
	},
	teammate_downed_selected = {
		priority = 3,
		color = tweak_data.contour.character_interactable.selected_color
	},
	teammate_dead = {
		priority = 4,
		color = tweak_data.contour.character.dead_color
	},
	teammate_cuffed = {
		priority = 4,
		color = tweak_data.contour.character.downed_color
	},
	friendly = {
		priority = 3,
		material_swap_required = true,
		color = tweak_data.contour.character.friendly_color
	},
	drunk_pilot = {
		priority = 5
	},
	boris = {
		priority = 5
	},
	taxman = {
		priority = 5,
		color = tweak_data.contour.character_interactable.standard_color
	},
	mark_unit = {
		priority = 5,
		fadeout = 4.5,
		trigger_marked_event = true,
		color = tweak_data.contour.character.dangerous_color
	},
	mark_unit_dangerous = {
		priority = 5,
		fadeout = 9,
		trigger_marked_event = true,
		color = tweak_data.contour.character.dangerous_color
	},
	mark_unit_dangerous_damage_bonus = {
		priority = 4,
		damage_bonus = true,
		fadeout = 9,
		trigger_marked_event = true,
		color = tweak_data.contour.character.more_dangerous_color
	},
	mark_unit_dangerous_damage_bonus_distance = {
		priority = 4,
		damage_bonus = true,
		fadeout = 9,
		damage_bonus_distance = 1,
		trigger_marked_event = true,
		color = tweak_data.contour.character.more_dangerous_color
	},
	mark_unit_friendly = {
		priority = 3,
		color = tweak_data.contour.character.friendly_color
	},
	mark_enemy = {
		fadeout = 4.5,
		priority = 5,
		material_swap_required = true,
		fadeout_silent = 13.5,
		trigger_marked_event = true,
		color = tweak_data.contour.character.dangerous_color
	},
	mark_enemy_damage_bonus = {
		fadeout = 4.5,
		priority = 4,
		material_swap_required = true,
		damage_bonus = true,
		fadeout_silent = 13.5,
		trigger_marked_event = true,
		color = tweak_data.contour.character.more_dangerous_color
	},
	mark_enemy_damage_bonus_distance = {
		fadeout = 4.5,
		priority = 4,
		material_swap_required = true,
		damage_bonus = true,
		damage_bonus_distance = 1,
		fadeout_silent = 13.5,
		trigger_marked_event = true,
		color = tweak_data.contour.character.more_dangerous_color
	},
	highlight = {
		priority = 4,
		color = tweak_data.contour.interactable.standard_color
	},
	highlight_character = {
		priority = 6,
		material_swap_required = true,
		color = tweak_data.contour.interactable.standard_color
	},
	generic_interactable = {
		priority = 2,
		material_swap_required = true,
		color = tweak_data.contour.character_interactable.standard_color
	},
	generic_interactable_selected = {
		priority = 1,
		material_swap_required = true,
		color = tweak_data.contour.character_interactable.selected_color
	},
	hostage_trade = {
		priority = 1,
		material_swap_required = true,
		color = tweak_data.contour.character_interactable.standard_color
	},
	deployable_selected = {
		priority = 1,
		unique = true,
		color = tweak_data.contour.deployable.selected_color
	},
	deployable_disabled = {
		priority = 2,
		unique = true,
		color = tweak_data.contour.deployable.disabled_color
	},
	deployable_active = {
		priority = 3,
		unique = true,
		color = tweak_data.contour.deployable.active_color
	},
	deployable_interactable = {
		priority = 4,
		unique = true,
		color = tweak_data.contour.deployable.interact_color
	},
	medic_heal = {
		priority = 1,
		material_swap_required = true,
		fadeout = 2,
		color = tweak_data.contour.character.heal_color
	},
	tmp_invulnerable = {
		priority = 1,
		material_swap_required = true,
		fadeout = 1,
		color = tweak_data.contour.character.tmp_invulnerable_color
	},
	vulnerable = {
		priority = 1,
		color = tweak_data.contour.character.vulnerable_color
	},
	vulnerable_character = {
		priority = 1,
		material_swap_required = true,
		color = tweak_data.contour.character.vulnerable_color
	}
}
ContourExt.indexed_types = {}

for name, preset in pairs(ContourExt._types) do
	table.insert(ContourExt.indexed_types, name)
end

table.sort(ContourExt.indexed_types)

if #ContourExt.indexed_types > 128 then
	Application:error("[ContourExt] max # contour presets exceeded!")
end

function ContourExt:init(unit)
	self._unit = unit
	self._update_enabled = false

	self._unit:set_extension_update_enabled(idstr_contour, false)

	ContourExt._slotmask_world_geometry = ContourExt._slotmask_world_geometry or managers.slot:get_mask("contour_ray_check")

	if self.init_contour then
		self:add(self.init_contour)
	end
end

function ContourExt:contour_list()
	return self._contour_list or {}
end

function ContourExt:set_is_child(state)
	self._is_child_contour = state
end

function ContourExt:apply_to_linked(func_name, ...)
	local spawn_ext = self._unit:spawn_manager()

	if not spawn_ext then
		return
	end

	local linked_units = spawn_ext:linked_units()

	if not linked_units then
		return
	end

	local entries = spawn_ext:spawned_units()
	local entry, contour_ext, contour_func = nil

	for unit_id, _ in pairs(linked_units) do
		entry = entries[unit_id]

		if entry then
			contour_ext = alive(entry.unit) and entry.unit:contour()

			if contour_ext then
				contour_func = contour_ext[func_name]

				if contour_func then
					contour_func(contour_ext, ...)
				else
					Application:error("[ContourExt:apply_to_linked] No function with name '" .. tostring(func_name) .. "' found in contour extension. ", self._unit, entry.unit)
				end
			end
		end
	end
end

function ContourExt:add(type, sync, multiplier, override_color, is_element)
	self._contour_list = self._contour_list or {}
	local data = self._types[type]
	local fadeout = data.fadeout

	if data.fadeout_silent and managers.groupai:state():whisper_mode() then
		fadeout = data.fadeout_silent
	end

	if fadeout and multiplier then
		fadeout = fadeout * multiplier
	end

	sync = sync and not self._is_child_contour or false

	if sync then
		local sync_unit = self._unit
		local u_id = self._unit:id()

		if u_id == -1 then
			sync_unit, u_id = nil
			local corpse_data = managers.enemy:get_corpse_unit_data_from_key(self._unit:key())

			if corpse_data then
				u_id = corpse_data.u_id
			end
		end

		if u_id then
			managers.network:session():send_to_peers_synched("sync_contour_add", sync_unit, u_id, table.index_of(ContourExt.indexed_types, type), multiplier or 1)
		else
			sync = nil

			Application:error("[ContourExt:add] Unit isn't network-synced and isn't a registered corpse, can't sync. ", self._unit)
		end
	end

	for _, setup in ipairs(self._contour_list) do
		if setup.type == type then
			if fadeout then
				setup.fadeout_t = TimerManager:game():time() + fadeout
			elseif not setup.data.unique then
				setup.ref_c = setup.ref_c + 1
			end

			if is_element then
				setup.ref_c_element = (setup.ref_c_element or 0) + 1
			end

			local old_color = setup.color or data.color
			setup.color = override_color or nil

			if old_color ~= override_color then
				self:_upd_color()
			end

			return setup
		end
	end

	if not self._removed_occlusion then
		self._removed_occlusion = true

		managers.occlusion:remove_occlusion(self._unit)
	end

	local setup = {
		ref_c = 1,
		type = type,
		ref_c_element = is_element and 1 or nil,
		sync = sync,
		fadeout_t = fadeout and TimerManager:game():time() + fadeout or nil,
		color = override_color or nil,
		data = data
	}

	if data.ray_check then
		setup.upd_skip_count = ContourExt.raycast_update_skip_count
		local mov_ext = self._unit:movement()

		if mov_ext and mov_ext.m_com then
			setup.ray_pos = mov_ext:m_com()
		end
	end

	local i = 1
	local contour_list = self._contour_list
	local old_preset_type = contour_list[1] and contour_list[1].type

	while contour_list[i] and contour_list[i].data.priority <= data.priority do
		i = i + 1
	end

	table.insert(contour_list, i, setup)

	if not old_preset_type or i == 1 and old_preset_type ~= setup.type then
		self:_apply_top_preset()
	end

	if not self._update_enabled then
		self:_chk_update_state()
	end

	if data.damage_bonus or data.damage_bonus_distance then
		self:_chk_damage_bonuses()
	end

	if data.trigger_marked_event then
		self:_chk_mission_marked_events(setup)
	end

	self:apply_to_linked("add", type, false, multiplier, override_color)

	return setup
end

function ContourExt:change_color(type, color)
	if not self._contour_list then
		return
	end

	for i, setup in ipairs(self._contour_list) do
		if setup.type == type then
			setup.color = color

			self:_upd_color(false, true)

			break
		end
	end

	self:apply_to_linked("change_color", type, color)
end

function ContourExt:change_color_by_id(id, ...)
	if not self._contour_list then
		return
	end

	for i, setup in ipairs(self._contour_list) do
		if setup == id then
			self:change_color(setup.type, ...)

			break
		end
	end
end

function ContourExt:flash(type, frequency)
	if not self._contour_list then
		return
	end

	for i, setup in ipairs(self._contour_list) do
		if setup.type == type then
			setup.flash_frequency = frequency and frequency > 0 and frequency or nil
			setup.flash_t = setup.flash_frequency and TimerManager:game():time() + setup.flash_frequency or nil
			setup.flash_on = not setup.flash_on or nil

			self:_chk_update_state()

			break
		end
	end

	self:apply_to_linked("flash", type, frequency)
end

function ContourExt:flash_by_id(id, ...)
	if not self._contour_list then
		return
	end

	for i, setup in ipairs(self._contour_list) do
		if setup == id then
			self:flash(setup.type, ...)

			break
		end
	end
end

function ContourExt:is_flashing()
	if self._contour_list then
		for i, setup in ipairs(self._contour_list) do
			if setup.flash_frequency then
				return true
			end
		end
	end

	return false
end

function ContourExt:remove(type, sync, is_element)
	if not self._contour_list then
		return
	end

	for i, setup in ipairs(self._contour_list) do
		if setup.type == type then
			self:_remove(i, sync, is_element)

			break
		end
	end

	self:apply_to_linked("remove", type, false, false)
end

function ContourExt:remove_by_id(id, ...)
	if not self._contour_list then
		return
	end

	for i, setup in ipairs(self._contour_list) do
		if setup == id then
			self:remove(setup.type, ...)

			break
		end
	end
end

function ContourExt:has_id(id)
	if self._contour_list then
		for i, setup in ipairs(self._contour_list) do
			if setup.type == id then
				return true
			end
		end
	end

	return false
end

function ContourExt:clear_all()
	if self._contour_list then
		while self._contour_list and next(self._contour_list) do
			self:remove(self._contour_list[#self._contour_list].type, false, false)
		end
	end

	self._contour_list = nil
	self._materials = nil
end

function ContourExt:_remove(index, sync, is_element)
	local setup = self._contour_list and self._contour_list[index]

	if not setup then
		return
	end

	if is_element and setup.ref_c_element then
		setup.ref_c_element = setup.ref_c_element - 1

		if setup.ref_c_element <= 0 then
			setup.ref_c_element = nil
		end
	end

	if setup.ref_c and setup.ref_c > 1 then
		setup.ref_c = setup.ref_c - 1

		return
	end

	local was_swap = nil

	if setup.data.material_swap_required then
		local base_ext = self._unit:base()

		if base_ext and base_ext.set_material_state then
			local should_swap = true

			for _, other_setup in ipairs(self._contour_list) do
				if setup ~= other_setup and other_setup.data.material_swap_required then
					should_swap = false

					break
				end
			end

			if should_swap then
				was_swap = true

				base_ext:set_material_state(true)
			end
		end
	end

	if #self._contour_list == 1 then
		if self._removed_occlusion then
			self._removed_occlusion = nil

			managers.occlusion:add_occlusion(self._unit)
		end

		if not was_swap then
			for _, material in ipairs(self._materials or self._unit:get_objects_by_type(idstr_material)) do
				if alive(material) then
					material:set_variable(idstr_contour_opacity, 0)
				end
			end
		end
	end

	self._last_opacity = nil

	table.remove(self._contour_list, index)

	if #self._contour_list == 0 then
		self._contour_list = nil
		self._materials = nil
	elseif index == 1 then
		self:_apply_top_preset()
	end

	if sync then
		local sync_unit = self._unit
		local u_id = self._unit:id()

		if u_id == -1 then
			sync_unit, u_id = nil
			local corpse_data = managers.enemy:get_corpse_unit_data_from_key(self._unit:key())

			if corpse_data then
				u_id = corpse_data.u_id
			end
		end

		if u_id then
			managers.network:session():send_to_peers_synched("sync_contour_remove", sync_unit, u_id, table.index_of(ContourExt.indexed_types, setup.type))
		else
			Application:error("[ContourExt:_remove] Unit isn't network-synced and isn't a registered corpse, can't sync. ", self._unit)
		end
	end

	if self._update_enabled then
		self:_chk_update_state()
	end

	if setup.data.damage_bonus or setup.data.damage_bonus_distance then
		self:_chk_damage_bonuses()
	end

	if setup.data.trigger_marked_event then
		self:_chk_mission_marked_events()
	end
end

function ContourExt:update(unit, t, dt)
	local index = 1
	local setup, cam_pos, is_current = nil
	local ray_check_slotmask = self._slotmask_world_geometry

	while self._contour_list and index <= #self._contour_list do
		setup = self._contour_list[index]
		is_current = index == 1

		if setup.fadeout_t and setup.fadeout_t < t then
			self:remove(setup.type, false, false)
		else
			index = index + 1
			local turn_off = nil

			if is_current and setup.data.ray_check then
				if setup.upd_skip_count > 0 then
					setup.upd_skip_count = setup.upd_skip_count - 1

					if self._last_opacity == 0 then
						turn_off = true
					else
						turn_off = false
					end
				else
					setup.upd_skip_count = ContourExt.raycast_update_skip_count
					local turn_on = false
					cam_pos = cam_pos or managers.viewport:get_current_camera_position()

					if cam_pos then
						local ray_pos = setup.ray_pos

						if not ray_pos then
							ray_pos = tmp_vec

							unit:m_position(ray_pos)
						end

						turn_on = mvec3_dis_sq(cam_pos, ray_pos) > 16000000 or unit:raycast("ray", cam_pos, ray_pos, "slot_mask", ray_check_slotmask, "report")
					end

					if setup.data.persistence then
						if turn_on then
							setup.last_turned_on_t = t
						else
							local last_t = setup.last_turned_on_t

							if not last_t or setup.data.persistence < t - last_t then
								turn_off = true
								setup.last_turned_on_t = nil
							end
						end
					else
						turn_off = not turn_on
					end
				end
			end

			if setup.flash_t then
				local flash = setup.flash_on

				if setup.flash_t < t then
					setup.flash_t = setup.flash_t + setup.flash_frequency
					flash = not flash
					setup.flash_on = flash
				end

				turn_off = turn_off or not flash
			end

			if is_current then
				if turn_off then
					self:_upd_opacity(0)
				else
					self:_upd_opacity(self.mod_lerp_opacity and setup.fadeout_t and math_lerp(1, 0, t / setup.fadeout_t) or 1)
				end
			end
		end
	end
end

function ContourExt:_upd_opacity(opacity, is_retry, no_child_upd)
	if opacity == self._last_opacity then
		return
	end

	self._last_opacity = opacity
	self._materials = self._materials or self._unit:get_objects_by_type(idstr_material)

	for _, material in ipairs(self._materials) do
		if not alive(material) then
			self:update_materials()

			if not is_retry then
				self:_upd_opacity(opacity, true, true)
			end

			break
		end

		material:set_variable(idstr_contour_opacity, opacity)
	end

	if not no_child_upd then
		self:apply_to_linked("_upd_opacity", opacity)
	end
end

function ContourExt:_upd_color(is_retry, no_child_upd)
	local setup = self._contour_list and self._contour_list[1]

	if not setup then
		return
	end

	local color = setup.color or setup.data.color

	if not color then
		return
	end

	self._materials = self._materials or self._unit:get_objects_by_type(idstr_material)

	for _, material in ipairs(self._materials) do
		if not alive(material) then
			self:update_materials()

			if not is_retry then
				self:_upd_color(true, true)
			end

			break
		end

		material:set_variable(idstr_contour_color, color)
	end

	if not no_child_upd then
		self:apply_to_linked("_upd_color")
	end
end

function ContourExt:_apply_top_preset()
	local setup = self._contour_list[1]
	self._last_opacity = nil
	local was_swap = nil

	if setup.data.material_swap_required then
		local base_ext = self._unit:base()

		if base_ext and base_ext.is_in_original_material and base_ext.swap_material_config then
			was_swap = true
			self._materials = nil
			self._last_opacity = nil

			if base_ext:is_in_original_material() then
				base_ext:swap_material_config(callback(self, ContourExt, "material_applied", true))
			else
				self:material_applied()
			end
		end
	end

	if not was_swap then
		if setup.data.material_swap_required then
			Application:error("[ContourExt:_apply_top_preset] Attempted to apply a material swap contour to a unit without a 'base' extension or required functions.", self._unit)
		end

		self:material_applied()
	end
end

function ContourExt:material_applied(material_was_swapped)
	if not self._contour_list then
		return
	end

	local setup = self._contour_list[1]
	local data = setup.data

	if material_was_swapped then
		self:update_materials()
	else
		self._materials = nil

		self:_upd_color()

		if not data.ray_check then
			local opacity = self._last_opacity or 1
			self._last_opacity = nil

			self:_upd_opacity(opacity)
		end
	end
end

function ContourExt:_chk_update_state()
	local needs_update = false

	if not self._is_child_contour and self._contour_list then
		for i, setup in ipairs(self._contour_list) do
			if setup.fadeout_t or setup.flash_t or setup.data.ray_check then
				needs_update = true

				break
			end
		end
	end

	if self._update_enabled ~= needs_update then
		self._update_enabled = needs_update

		self._unit:set_extension_update_enabled(idstr_contour, needs_update)
	end
end

function ContourExt:_chk_damage_bonuses()
	local char_dmg_ext = self._unit:character_damage()

	if not char_dmg_ext or not char_dmg_ext.on_marked_state then
		Application:error("[ContourExt:_chk_damage_bonuses] No 'character_damage' extension found on unit or said extensions lacks a 'on_marked_state' function.", self._unit)

		return
	end

	local dmg_bonus, dmg_bonus_dist_idx = nil

	if self._contour_list then
		local data = nil

		for _, setup in ipairs(self._contour_list) do
			data = setup.data
			dmg_bonus = dmg_bonus or data.damage_bonus

			if data.damage_bonus_distance and (not dmg_bonus_dist_idx or dmg_bonus_dist_idx < data.damage_bonus_distance) then
				dmg_bonus_dist_idx = data.damage_bonus_distance
			end
		end
	end

	char_dmg_ext:on_marked_state(dmg_bonus, dmg_bonus_dist_idx)
end

function ContourExt:_chk_mission_marked_events(added_setup)
	local element = self._unit:unit_data() and self._unit:unit_data().mission_element

	if not element then
		if not self._unit:unit_data() then
			Application:error("[ContourExt:_chk_mission_marked_events] No 'unit_data' extension?", self._unit)
		end

		return
	end

	local event_name = added_setup and "marked" or "unmarked"
	local should_trigger_event = true

	if self._contour_list then
		for _, setup in ipairs(self._contour_list) do
			if (not added_setup or setup ~= added_setup) and setup.data.trigger_marked_event then
				should_trigger_event = false

				break
			end
		end
	end

	if should_trigger_event then
		element:event(event_name, self._unit)
	end
end

function ContourExt:update_materials()
	if self._contour_list then
		self._materials = nil

		self:_upd_color()

		local opacity = self._last_opacity or 1
		self._last_opacity = nil

		self:_upd_opacity(opacity)
	end
end

function ContourExt:save(data)
	local my_save_data = {}

	if self._contour_list then
		local element_contours = {}

		for _, setup in ipairs(self._contour_list) do
			if setup.sync and setup.ref_c_element then
				table.insert(element_contours, {
					type = setup.type,
					ref_c_element = setup.ref_c_element
				})
			end
		end

		if next(element_contours) then
			my_save_data.element_contours = element_contours
		end
	end

	if next(my_save_data) then
		data.ContourExt = my_save_data
	end
end

function ContourExt:load(load_data)
	local my_load_data = load_data.ContourExt

	if not my_load_data then
		return
	end

	if my_load_data and my_load_data.element_contours then
		for _, setup in ipairs(my_load_data.element_contours) do
			for i = 1, setup.ref_c_element do
				self:add(setup.type)
			end
		end
	end
end

function ContourExt:destroy(unit)
	if self._removed_occlusion then
		self._removed_occlusion = nil

		managers.occlusion:add_occlusion(self._unit)
	end
end
