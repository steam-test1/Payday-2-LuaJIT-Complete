require("lib/managers/NavFieldBuilder")

local mvec3_n_equal = mvector3.not_equal
local mvec3_set = mvector3.set
local mvec3_set_st = mvector3.set_static
local mvec3_set_z = mvector3.set_z
local mvec3_sub = mvector3.subtract
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_div = mvector3.divide
local mvec3_lerp = mvector3.lerp
local mvec3_cpy = mvector3.copy
local mvec3_set_l = mvector3.set_length
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_dis = mvector3.distance
local mvec3_rot = mvector3.rotate_with
local math_abs = math.abs
local math_max = math.max
local math_clamp = math.clamp
local math_ceil = math.ceil
local math_floor = math.floor
local math_lerp = math.lerp
local temp_vec1 = Vector3()
local temp_vec2 = Vector3()
local cone_height = Vector3(0, 0, 80)
local arrow_height = Vector3(0, 0, 1)

NavigationManager = NavigationManager or class()
NavigationManager.nav_states = {
	"allow_access",
	"forbid_access",
	"forbid_custom"
}
NavigationManager.nav_meta_operations = {
	"force_civ_submission",
	"relieve_forced_civ_submission"
}
NavigationManager.COVER_POSITION = 1
NavigationManager.COVER_FORWARD = 2
NavigationManager.COVER_TRACKER = 3
NavigationManager.COVER_RESERVED = 4
NavigationManager.COVER_RESERVATION = 5
NavigationManager.ACCESS_FLAGS_VERSION = 1
NavigationManager.ACCESS_FLAGS = {
	"civ_male",
	"civ_female",
	"gangster",
	"security",
	"security_patrol",
	"cop",
	"fbi",
	"swat",
	"murky",
	"sniper",
	"spooc",
	"shield",
	"tank",
	"taser",
	"teamAI1",
	"teamAI2",
	"teamAI3",
	"teamAI4",
	"SO_ID1",
	"SO_ID2",
	"SO_ID3",
	"pistol",
	"rifle",
	"ntl",
	"hos",
	"run",
	"fumble",
	"sprint",
	"crawl",
	"climb"
}
NavigationManager.ACCESS_FLAGS_OLD = {}
NavigationManager._sector_grid_size = 500

function NavigationManager:init()
	self._debug = IS_PC and Application:production_build()
	self._builder = NavFieldBuilder:new()
	self._get_room_height_at_pos = self._builder._get_room_height_at_pos
	self._dir_str_to_vec = self._builder._dir_str_to_vec
	self._grid_size = self._builder._grid_size
	self._nav_segments = {}
	self._coarse_searches = {}
	self._covers = {}
	self._next_pos_rsrv_expiry = false

	if self._debug then
		self._nav_links = {}
	end

	self._quad_field = World:quad_field()

	self._quad_field:set_nav_link_filter(NavigationManager.ACCESS_FLAGS)

	self._pos_rsrv_filters = {}
	self._obstacles = {}
	self._pos_rsrv_filters = {}
	self._pos_reservations = {}

	self:_init_draw_data()
end

function NavigationManager:_init_draw_data()
	local duration = 5

	self._draw_data = {
		next_draw_i_coarse = 1,
		next_draw_i_door = 1,
		next_draw_i_room = 1,
		next_draw_i_vis = 1,
		duration = duration,
		brush = {
			door = Draw:brush(Color(0.1, 0, 1, 1), duration),
			room_diag = Draw:brush(Color(1, 0.5, 0.5, 0), duration),
			room_diag_disabled = Draw:brush(Color(0.5, 0.7, 0, 0), duration),
			room_diag_obstructed = Draw:brush(Color(0.5, 0.5, 0, 0.5), duration),
			room_border = Draw:brush(Color(0.5, 0.3, 0.3, 0.8), duration),
			coarse_graph = Draw:brush(Color(0.2, 0.05, 0.2, 0.9)),
			vis_graph_rooms = Draw:brush(Color(0.6, 0.5, 0.2, 0.9), duration),
			vis_graph_node = Draw:brush(Color(1, 0.6, 0, 0.9), duration),
			vis_graph_links = Draw:brush(Color(0.2, 0.8, 0.1, 0.6), duration)
		},
		offsets = {
			Vector3(-1, -1),
			Vector3(-1, 1),
			Vector3(1, -1),
			Vector3(1, 1)
		}
	}
end

function NavigationManager:update(t, dt)
	if self._debug then
		self._builder:update(t, dt)

		if self._debug_draw_options then
			local options = self._debug_draw_options

			if options.blockers then
				self:_draw_nav_blockers()
			end

			if options.covers then
				self:_draw_covers()
			end

			if options.pos_reservations then
				self:_draw_pos_reservations(t)
			end
		end
	end

	self:_commence_coarce_searches(t)
end

function NavigationManager:_draw_pos_reservations(t)
	local to_remove = {}

	for key, res in pairs(self._pos_reservations) do
		local entry = res[1]

		if entry.expire_t and t > entry.expire_t then
			table.insert(to_remove, key)
		end

		if not entry.expire_t then
			if res.unit then
				if alive(res.unit) then
					Draw:brush(Color(1, 1, 0, 0), 0):cylinder(entry.position, res.unit:movement():m_pos(), 3)
				else
					Draw:brush(Color(1, 1, 0, 0), 0):sphere(entry.position, entry.radius + 5)
				end
			else
				Draw:brush(Color(0.3, 1, 1, 0), 0):sphere(entry.position, entry.radius + 5)
			end
		end
	end

	for _, key in ipairs(to_remove) do
		self._pos_reservations[key] = nil
	end
end

function NavigationManager:get_save_data()
	local save_data = self._load_data or {
		version = NavFieldBuilder._VERSION
	}

	return ScriptSerializer:to_generic_xml(save_data)
end

function NavigationManager:set_load_data(data)
	if Application:editor() then
		self._load_data = deep_clone(data)

		self._builder:load(self._load_data)
	end

	if data.version < 6 then
		data = self:_convert_nav_data_v5_to_v6(data)
	end

	if not next(self._nav_segments) then
		local setup_data = {
			quad_grid_size = self._grid_size,
			sector_grid_size = self._sector_grid_size
		}

		self._quad_field:setup(setup_data, callback(self, self, "clbk_navfield"))
		self._quad_field:set_nav_link_filter(NavigationManager.ACCESS_FLAGS)
	end

	self:_load_nav_data(data)
	self:_send_nav_field_to_engine(data)
	self:_resolve_segment_neighbours()

	if self._debug then
		self:set_debug_draw_state(nil)
	end
end

function NavigationManager:_convert_nav_data_v5_to_v6(data_v5)
	print("[NavigationManager:_convert_nav_data_v5_to_v6]")

	if not next(data_v5.vis_groups) then
		return {
			version = 6
		}
	end

	local t_ins = table.insert
	local segments = {}
	local visibility_groups = {}
	local data_v6 = {
		version = 6,
		segments = segments,
		visibility_groups = visibility_groups,
		quad_borders_x_pos = data_v5.room_borders_x_pos,
		quad_borders_x_neg = data_v5.room_borders_x_neg,
		quad_borders_y_pos = data_v5.room_borders_y_pos,
		quad_borders_y_neg = data_v5.room_borders_y_neg,
		quad_heights_xp_yp = data_v5.room_heights_xp_yp,
		quad_heights_xp_yn = data_v5.room_heights_xp_yn,
		quad_heights_xn_yp = data_v5.room_heights_xn_yp,
		quad_heights_xn_yn = data_v5.room_heights_xn_yn,
		door_low_pos = data_v5.door_low_pos,
		door_high_pos = data_v5.door_high_pos,
		door_low_quads = data_v5.door_low_rooms,
		door_high_quads = data_v5.door_high_rooms,
		helper_blockers = data_v5.helper_blockers
	}

	for i_vis_group, vis_group_v5 in ipairs(data_v5.vis_groups) do
		local quads = {}
		local visible_groups = {}
		local vis_grp = {
			visible_groups = visible_groups,
			quads = quads,
			pos = vis_group_v5.pos
		}

		t_ins(visibility_groups, vis_grp)

		for i_quad, _ in pairs(vis_group_v5.rooms) do
			t_ins(quads, i_quad)
		end

		for i_visible_group, _ in pairs(vis_group_v5.vis_groups) do
			t_ins(visible_groups, i_visible_group)
		end
	end

	for nav_seg_id, segment_v5 in pairs(data_v5.nav_segments) do
		local segment = {
			id = nav_seg_id,
			pos = segment_v5.pos,
			vis_groups = segment_v5.vis_groups,
			location_id = segment_v5.location_id,
			neighbours = {}
		}

		t_ins(segments, segment)
	end

	Application:check_termination()

	return data_v6
end

function NavigationManager:_load_nav_data(data)
	if not data.segments then
		return
	end

	for _, nav_seg in pairs(data.segments) do
		local unique_id = tostring(nav_seg.id)
		local segment = {
			id = nav_seg.id,
			unique_id = unique_id,
			pos = nav_seg.pos,
			neighbours = {},
			location_id = nav_seg.location_id,
			vis_groups = nav_seg.vis_groups
		}

		self._nav_segments[unique_id] = segment
	end
end

function NavigationManager:_resolve_segment_neighbours(both_ways)
	for _, segment in pairs(self._nav_segments) do
		local ids_id = Idstring(segment.unique_id)
		local neighbours = self._quad_field:nav_segment_neighbours(ids_id)

		for other_id, doors in pairs(neighbours) do
			segment.neighbours[other_id] = {}

			for _, door_pos in ipairs(doors) do
				table.insert(segment.neighbours[other_id], mvector3.copy(door_pos))

				if both_ways then
					local other_segment = self._nav_segments[other_id]

					if other_segment then
						if not other_segment.neighbours[segment.id] then
							other_segment.neighbours[segment.id] = {}
						end

						table.insert(other_segment.neighbours[segment.id], mvector3.copy(door_pos))
					end
				end
			end
		end
	end
end

function NavigationManager:clear()
	self._builder:clear()
	self:_clear()
end

function NavigationManager:_clear()
	self:_unregister_cover_units()

	self._load_data = nil

	self._quad_field:clear_all()
	self._quad_field:set_nav_link_filter(NavigationManager.ACCESS_FLAGS)

	self._nav_segments = {}
	self._worlds = {}
	self._coarse_searches = {}
end

function NavigationManager:is_data_ready()
	return next(self._nav_segments) and true
end

function NavigationManager:build_nav_segments(build_settings, complete_clbk)
	local draw_options = self._debug_draw_options

	self:_clear()

	self._build_complete_clbk = complete_clbk

	self._builder:build_nav_segments(build_settings, callback(self, self, "build_complete_clbk", draw_options))
	self:set_debug_draw_state(self._debug_draw_options)
end

function NavigationManager:build_complete_clbk(draw_options)
	if self._builder:is_data_complete() then
		self:_create_load_data_from_builder()

		local data = self._load_data

		if data.version < 6 then
			data = self:_convert_nav_data_v5_to_v6(self._load_data)
		end

		self:_load_nav_data(data)
		self._quad_field:clear_all()

		local setup_data = {
			quad_grid_size = self._grid_size,
			sector_grid_size = self._sector_grid_size
		}

		self._quad_field:setup(setup_data, callback(self, self, "clbk_navfield"))
		self._quad_field:set_nav_link_filter(NavigationManager.ACCESS_FLAGS)
		self:_send_nav_field_to_engine(data)
		self:_resolve_segment_neighbours()
	end

	self:set_debug_draw_state(draw_options)

	if self._build_complete_clbk then
		self._build_complete_clbk()
	end
end

function NavigationManager:_create_load_data_from_builder()
	local load_data = {}

	for _, room in ipairs(self._builder._rooms) do
		room.covers = nil
		room.nav_links = nil
	end

	for _, nav_seg in pairs(self._builder._nav_segments) do
		nav_seg.disabled = nil

		if nav_seg.neighbours then
			for other_nav_seg, door_list in pairs(nav_seg.neighbours) do
				for i_door, door_id in ipairs(door_list) do
					if type(door_id) ~= "number" then
						door_list[i_door] = nil

						if not next(door_list) then
							nav_seg.neighbours[other_nav_seg] = nil

							break
						end
					end
				end
			end
		end
	end

	local grid_size = self._grid_size

	load_data.room_borders_x_pos = {}
	load_data.room_borders_x_neg = {}
	load_data.room_borders_y_pos = {}
	load_data.room_borders_y_neg = {}
	load_data.room_heights_xp_yp = {}
	load_data.room_heights_xp_yn = {}
	load_data.room_heights_xn_yp = {}
	load_data.room_heights_xn_yn = {}
	load_data.room_vis_groups = {}

	local t_ins = table.insert

	for _, room in ipairs(self._builder._rooms) do
		t_ins(load_data.room_borders_x_pos, room.borders.x_pos / grid_size)
		t_ins(load_data.room_borders_x_neg, room.borders.x_neg / grid_size)
		t_ins(load_data.room_borders_y_pos, room.borders.y_pos / grid_size)
		t_ins(load_data.room_borders_y_neg, room.borders.y_neg / grid_size)
		t_ins(load_data.room_heights_xp_yp, room.height.xp_yp)
		t_ins(load_data.room_heights_xp_yn, room.height.xp_yn)
		t_ins(load_data.room_heights_xn_yp, room.height.xn_yp)
		t_ins(load_data.room_heights_xn_yn, room.height.xn_yn)
		t_ins(load_data.room_vis_groups, room.vis_group)
	end

	load_data.door_low_pos = {}
	load_data.door_high_pos = {}
	load_data.door_low_rooms = {}
	load_data.door_high_rooms = {}

	for i_door, door in ipairs(self._builder._room_doors) do
		t_ins(load_data.door_low_pos, Vector3(door.pos.x / grid_size, door.pos.y / grid_size, door.pos.z))
		t_ins(load_data.door_high_pos, Vector3(door.pos1.x / grid_size, door.pos1.y / grid_size, door.pos1.z))
		t_ins(load_data.door_low_rooms, door.rooms[1])
		t_ins(load_data.door_high_rooms, door.rooms[2])
	end

	load_data.vis_groups = self._builder._visibility_groups
	load_data.nav_segments = self._builder._nav_segments
	load_data.helper_blockers = self._builder._helper_blockers
	load_data.version = NavFieldBuilder._VERSION
	self._load_data = load_data
end

function NavigationManager:set_nav_segment_state(id, state, filter_group)
	local unique_id = tostring(id)

	if not self._nav_segments[unique_id] then
		debug_pause("[NavigationManager:set_nav_segment_state] nonexistent nav_segment", unique_idid)

		return
	end

	if state == "forbid_custom" then
		local access_filter = self:convert_SO_AI_group_to_access(filter_group)

		self._quad_field:set_nav_segment_blocked_filter(unique_id, access_filter)

		self._nav_segments[unique_id].blocked_group = filter_group

		return
	end

	self._quad_field:set_nav_segment_blocked_filter(unique_id, 0)

	self._nav_segments[unique_id].blocked_group = nil

	local wanted_state = state == "allow_access" and true or false
	local cur_state = self._quad_field:is_nav_segment_enabled(unique_id)
	local seg_disabled_state

	if not wanted_state then
		seg_disabled_state = true
	end

	self._nav_segments[unique_id].disabled = seg_disabled_state

	if wanted_state ~= cur_state then
		self._quad_field:set_nav_segment_enabled(unique_id, wanted_state)
		managers.groupai:state():on_nav_segment_state_change(unique_id, wanted_state)
	end
end

function NavigationManager:perform_nav_segment_meta_operation(id, operation)
	local unique_id = tostring(id)
	local nav_segment = self._nav_segments[unique_id]

	if operation == "force_civ_submission" then
		nav_segment.force_civ_submission = true
	elseif operation == "relieve_forced_civ_submission" then
		nav_segment.force_civ_submission = nil
	end
end

function NavigationManager:delete_nav_segment(id)
	local draw_options = self._debug_draw_options

	self:set_debug_draw_state(false)
	self._builder:delete_segment(id)

	if self._builder:is_data_complete() then
		self:_create_load_data_from_builder()

		local data = self._load_data

		if data.version < 6 then
			data = self:_convert_nav_data_v5_to_v6(self._load_data)
		end

		self:_load_nav_data(data)
		self._quad_field:clear_all()

		local setup_data = {
			quad_grid_size = self._grid_size,
			sector_grid_size = self._sector_grid_size
		}

		self._quad_field:setup(setup_data, callback(self, self, "clbk_navfield"))
		self._quad_field:set_nav_link_filter(NavigationManager.ACCESS_FLAGS)
		self:_send_nav_field_to_engine(data)
		self:_resolve_segment_neighbours()
	end

	if id == self._selected_segment_id then
		self._selected_segment_id = nil

		if draw_options then
			draw_options.selected_segment = nil
		end
	end

	self:set_debug_draw_state(draw_options)
end

function NavigationManager:build_visibility_graph(complete_clbk, all_visible, neg_filter, pos_filter, ray_dis)
	if not next(self._builder._nav_segments) then
		Application:error("[NavigationManager:build_visibility_graph] ground needs to be built before visibilty graph")

		return
	end

	local draw_options = self._debug_draw_options

	self:set_debug_draw_state(false)

	self._build_complete_clbk = complete_clbk

	self._builder:build_visibility_graph(callback(self, self, "build_complete_clbk", draw_options), all_visible, ray_dis, pos_filter, neg_filter)
end

function NavigationManager:set_debug_draw_state(options)
	self._debug_draw_options = options

	if options then
		options.selected_segment = nil

		if self._selected_segment_id then
			for _, segment in pairs(self._nav_segments) do
				if segment.id == self._selected_segment_id then
					options.selected_segment = Idstring(segment.unique_id)

					break
				end
			end
		end
	end

	self._quad_field:set_draw_state(options)
end

function NavigationManager:get_debug_draw_state()
	return self._debug_draw_options
end

function NavigationManager:set_selected_segment(unit)
	self._selected_segment_id = unit and unit:unit_data().unit_id

	self:set_debug_draw_state(self._debug_draw_options)
end

function NavigationManager:_draw_nav_blockers()
	if self._load_data and self._load_data.helper_blockers then
		local obj_name = Idstring("help_blocker")
		local nav_segments = self._nav_segments
		local registered_blockers = self._load_data.helper_blockers
		local all_blockers = World:find_units_quick("all", 15)

		for _, blocker_unit in ipairs(all_blockers) do
			local id = blocker_unit:unit_data().unit_id

			if registered_blockers[id] then
				local help_blocker_object = blocker_unit:get_object(obj_name)
				local draw_pos = blocker_unit:oobb():center()
				local r, g, b = 1, 0, 0

				if help_blocker_object then
					draw_pos = help_blocker_object:oobb():center()
					r, g, b = 0, 1, 0
				end

				local owner_segment_id = registered_blockers[id]

				for _, segment in pairs(self._nav_segments) do
					if segment.id == owner_segment_id and (not self._selected_segment_id or self._selected_segment_id == segment.id) then
						Draw:brush(Color(0.1, r, g, b)):unit(blocker_unit)
						Application:draw(blocker_unit, r, g, b)
						Application:draw_cylinder(draw_pos, segment.pos + math.UP * 5, 2, r, g, b)

						break
					end
				end
			end
		end
	end
end

function NavigationManager:_draw_doors(progress)
	local selected_seg = self._selected_segment_id
	local room_mask

	if selected_seg and self._nav_segments[selected_seg] and next(self._nav_segments[selected_seg].vis_groups) then
		room_mask = {}

		for _, i_vis_group in ipairs(self._nav_segments[selected_seg].vis_groups) do
			local vis_group_rooms = self._visibility_groups[i_vis_group].rooms

			for i_room, _ in pairs(vis_group_rooms) do
				room_mask[i_room] = true
			end
		end
	end

	local data = self._draw_data
	local doors = self._room_doors
	local nr_doors = #doors
	local i_door = data.next_draw_i_door
	local wanted_index = math.clamp(math.ceil(nr_doors * progress), 1, nr_doors)

	while i_door <= wanted_index and i_door <= nr_doors do
		local door = doors[i_door]

		if not room_mask or room_mask[door.rooms[1]] or room_mask[door.rooms[2]] then
			self:_draw_door(door)
		end

		i_door = i_door + 1
	end

	if progress == 1 then
		data.next_draw_i_door = 1
	else
		data.next_draw_i_door = i_door
	end
end

function NavigationManager:_draw_door(door)
	local brush = self._draw_data.brush.door

	brush:cylinder(door.pos, door.pos1, 2)
end

function NavigationManager:_draw_anim_nav_links()
	if not self._nav_links then
		return
	end

	local brush = Draw:brush(Color(0.3, 0.8, 0.2, 0.1))
	local brush_obstructed = Draw:brush(Color(0.6, 0.2, 0.05, 0.025))

	for element, _ in pairs(self._nav_links) do
		local start_pos = element:value("position")

		;(element:nav_link():is_obstructed() and brush_obstructed or brush):cone(element:nav_link_end_pos(), start_pos, 20)
	end
end

function NavigationManager:_draw_covers()
	local reserved = self.COVER_RESERVED

	for i_cover, cover in ipairs(self._covers) do
		local draw_pos = cover[NavigationManager.COVER_POSITION]
		local tracker = cover[NavigationManager.COVER_TRACKER]

		if tracker:lost() then
			Application:draw_cone(draw_pos, draw_pos + cone_height, 30, 1, 0, 0)

			local placed_pos = tracker:position()

			Application:draw_sphere(placed_pos, 20, 1, 0, 0)
			Application:draw_line(placed_pos, draw_pos, 1, 0, 0)
		else
			Application:draw_cone(draw_pos, draw_pos + cone_height, 30, 0, 1, 0)
		end

		Application:draw_rotation(draw_pos + arrow_height, Rotation(cover[NavigationManager.COVER_FORWARD], math.UP))

		if cover[reserved] then
			Application:draw_sphere(draw_pos, 18, 0, 0, 0)
		end
	end
end

function NavigationManager:cover_info()
	local reserved = self.COVER_RESERVED

	for i_cover, cover in ipairs(self._covers) do
		if cover[reserved] then
			print("cover", i_cover, "reserved", cover[reserved], "times")
		end
	end
end

function NavigationManager:find_random_position_in_segment(seg_id)
	return self._quad_field:random_position_in_nav_segment(seg_id)
end

function NavigationManager:register_cover_units()
	if not self:is_data_ready() then
		return
	end

	local covers = {}
	local cover_data = managers.worlddefinition:get_cover_data()
	local t_ins = table.insert

	if cover_data then
		local function _register_cover(pos, fwd)
			local nav_tracker = self._quad_field:create_nav_tracker(pos, true)
			local cover = {
				nav_tracker:field_position(),
				fwd,
				nav_tracker
			}

			t_ins(covers, cover)

			local location_script_data = self._quad_field:get_script_data(nav_tracker, true)

			if not location_script_data.covers then
				location_script_data.covers = {}
			end

			t_ins(location_script_data.covers, cover)
		end

		local tmp_rot = Rotation(0, 0, 0)

		if cover_data.rotations then
			local rotations = cover_data.rotations

			for i, yaw in ipairs(cover_data.rotations) do
				mrotation.set_yaw_pitch_roll(tmp_rot, yaw, 0, 0)
				mrotation.y(tmp_rot, temp_vec1)
				_register_cover(cover_data.positions[i], mvector3.copy(temp_vec1))
			end
		else
			for _, cover_desc in ipairs(cover_data) do
				mrotation.set_yaw_pitch_roll(tmp_rot, cover_desc[2], 0, 0)
				mrotation.y(tmp_rot, temp_vec1)
				_register_cover(cover_desc[1], mvector3.copy(temp_vec1))
			end
		end
	else
		local all_cover_units = World:find_units_quick("all", managers.slot:get_mask("cover"))

		for i, unit in ipairs(all_cover_units) do
			local pos = unit:position()
			local fwd = unit:rotation():y()
			local nav_tracker = self._quad_field:create_nav_tracker(pos, true)
			local cover = {
				nav_tracker:field_position(),
				fwd,
				nav_tracker,
				true
			}

			t_ins(covers, cover)

			local location_script_data = self._quad_field:get_script_data(nav_tracker, true)

			if not location_script_data.covers then
				location_script_data.covers = {}
			end

			t_ins(location_script_data.covers, cover)
			self:_safe_remove_unit(unit)
		end
	end

	self._covers = covers
end

function NavigationManager:_unregister_cover_units()
	for i_cover, cover in ipairs(self._covers) do
		if alive(cover[NavigationManager.COVER_TRACKER]) then
			self._quad_field:destroy_nav_tracker(cover[NavigationManager.COVER_TRACKER])
		else
			Application:error("[NavigationManager:_unregister_cover_units] Cover tracker is not alive!", i_cover, inspect(cover))
		end
	end

	self._covers = {}
end

function NavigationManager:_safe_remove_unit(unit)
	if Application:editor() then
		managers.editor:delete_unit(unit)
	else
		unit:set_slot(0)
	end
end

function NavigationManager:remove_AI_blocker_units()
	local all_units = World:find_units_quick("all", 15)

	for i, unit in pairs(all_units) do
		self:_safe_remove_unit(unit)
	end
end

function NavigationManager:register_anim_nav_link(element)
	if element:nav_link() then
		if Application:editor() then
			managers.editor:output_error("[NavigationManager:register_anim_nav_link] Navigation link is already registered id: " .. tostring(element._id))
		else
			Application:error("[NavigationManager:register_anim_nav_link] Navigation link is already registered", element._id)
		end

		return
	end

	if self._nav_links then
		self._nav_links[element] = true
	end

	local nav_link = self._quad_field:add_nav_link(element:value("position"), element:nav_link_end_pos(), {
		element = element
	}, element:nav_link_access(), element:chance(), element._id)
	local is_obstructed = nav_link:is_obstructed()

	element:set_nav_link(nav_link)

	local start_nav_seg_id = nav_link:start_nav_segment()
	local end_nav_seg_id = nav_link:end_nav_segment()

	if start_nav_seg_id ~= end_nav_seg_id then
		local start_nav_seg = self._nav_segments[start_nav_seg_id]
		local new_neighbour

		if not is_obstructed and (not start_nav_seg.neighbours[end_nav_seg_id] or not next(start_nav_seg.neighbours[end_nav_seg_id])) then
			new_neighbour = true
		end

		local neighbours_list_name = is_obstructed and "disabled_neighbours" or "neighbours"

		start_nav_seg[neighbours_list_name] = start_nav_seg[neighbours_list_name] or {}
		start_nav_seg[neighbours_list_name][end_nav_seg_id] = start_nav_seg[neighbours_list_name][end_nav_seg_id] or {}

		table.insert(start_nav_seg[neighbours_list_name][end_nav_seg_id], nav_link)

		if new_neighbour then
			managers.groupai:state():on_nav_seg_neighbour_state(start_nav_seg_id, end_nav_seg_id, true)
		end
	end
end

function NavigationManager:unregister_anim_nav_link(element)
	local nav_link = element:nav_link()

	if not nav_link then
		return
	end

	if self._nav_links then
		self._nav_links[element] = nil
	end

	local start_nav_seg_id = nav_link:start_nav_segment()
	local end_nav_seg_id = nav_link:end_nav_segment()
	local start_nav_seg = self._nav_segments[start_nav_seg_id]

	if not start_nav_seg_id or not end_nav_seg_id or not start_nav_seg then
		Application:error("[NavigationManager] Nav link start or end point is not in the navigation mesh. Element id: ", element._id, " nav_link ", nav_link)

		return
	end

	if start_nav_seg.disabled_neighbours and start_nav_seg.disabled_neighbours[end_nav_seg_id] then
		for i_door, door_id in pairs(start_nav_seg.disabled_neighbours[end_nav_seg_id]) do
			if door_id == nav_link then
				table.remove(start_nav_seg.disabled_neighbours[end_nav_seg_id], i_door)

				if not next(start_nav_seg.disabled_neighbours[end_nav_seg_id]) then
					start_nav_seg.disabled_neighbours[end_nav_seg_id] = nil
				end

				if not next(start_nav_seg.disabled_neighbours) then
					start_nav_seg.disabled_neighbours = nil
				end

				break
			end
		end
	end

	local was_in_group_ai
	local start_nav_seg_neighbours = start_nav_seg.neighbours

	if start_nav_seg_neighbours and start_nav_seg_neighbours[end_nav_seg_id] then
		for i_door, door_id in pairs(start_nav_seg_neighbours[end_nav_seg_id]) do
			if door_id == nav_link then
				was_in_group_ai = true

				if #start_nav_seg_neighbours[end_nav_seg_id] == 1 then
					start_nav_seg_neighbours[end_nav_seg_id] = nil

					managers.groupai:state():on_nav_seg_neighbour_state(start_nav_seg_id, end_nav_seg_id, false)

					break
				end

				table.remove(start_nav_seg_neighbours[end_nav_seg_id], i_door)

				break
			end
		end
	end

	if was_in_group_ai then
		managers.groupai:state():on_nav_link_unregistered(element:id())
	end

	element:set_nav_link()
	self._quad_field:remove_nav_link(element._id)
end

function NavigationManager:reserve_cover(cover, filter)
	local reserved = cover[self.COVER_RESERVED]

	if reserved then
		cover[self.COVER_RESERVED] = reserved + 1
	else
		cover[self.COVER_RESERVED] = 1

		local reservation = {
			radius = 60,
			position = cover[NavigationManager.COVER_POSITION],
			filter = filter
		}

		cover[self.COVER_RESERVATION] = reservation

		self:add_pos_reservation(reservation)
	end
end

function NavigationManager:release_cover(cover)
	local reserved = cover[self.COVER_RESERVED]

	if not reserved then
		return
	end

	if reserved == 1 then
		cover[self.COVER_RESERVED] = nil

		self:unreserve_pos(cover[self.COVER_RESERVATION])

		cover[self.COVER_RESERVED] = nil
		cover[self.COVER_RESERVATION] = nil
	else
		cover[self.COVER_RESERVED] = reserved - 1
	end
end

function NavigationManager:find_cover_near_pos_1(near_pos, threat_pos, max_near_dis, min_threat_dis, allow_fwd)
	local search_params = {
		variation_z = 250,
		near_pos = near_pos,
		threat_pos = threat_pos,
		forbid_fwd = not allow_fwd,
		max_distance = max_near_dis,
		min_threat_distance = min_threat_dis
	}

	return self._quad_field:find_cover(search_params)
end

function NavigationManager:find_cover_away_from_pos(near_pos, threat_pos, nav_seg_id)
	if type(nav_seg_id) == "table" then
		nav_seg_id = self._convert_nav_seg_map_to_vec(nav_seg_id)
	end

	local search_params = {
		forbid_fwd = true,
		near_pos = near_pos,
		threat_pos = threat_pos,
		in_nav_seg = nav_seg_id,
		optimal_threat_dis = mvec3_dis(near_pos, threat_pos) + 100
	}

	return self._quad_field:find_cover(search_params)
end

function NavigationManager._convert_nav_seg_map_to_vec(nav_seg_map)
	local nav_seg_vec = {}

	for nav_seg, _ in pairs(nav_seg_map) do
		table.insert(nav_seg_vec, nav_seg)
	end

	return nav_seg_vec
end

function NavigationManager:find_cover_in_nav_seg_1(nav_seg_id)
	if type(nav_seg_id) == "table" then
		nav_seg_id = self._convert_nav_seg_map_to_vec(nav_seg_id)
	end

	local search_params = {
		in_nav_seg = nav_seg_id
	}

	return self._quad_field:find_cover(search_params)
end

function NavigationManager:find_cover_in_nav_seg_2(nav_seg_id, defend_pos, defend_dir)
	if type(nav_seg_id) == "table" then
		nav_seg_id = self._convert_nav_seg_map_to_vec(nav_seg_id)
	end

	local search_params = {
		near_pos = defend_pos,
		in_nav_seg = nav_seg_id,
		threat_dir = defend_dir
	}

	return self._quad_field:find_cover(search_params)
end

function NavigationManager:find_cover_in_nav_seg_3(nav_seg_id, max_near_dis, near_pos, threat_pos)
	if type(nav_seg_id) == "table" then
		nav_seg_id = self._convert_nav_seg_map_to_vec(nav_seg_id)
	end

	local search_params = {
		near_pos = near_pos,
		threat_pos = threat_pos,
		in_nav_seg = nav_seg_id,
		max_distance = max_near_dis
	}

	return self._quad_field:find_cover(search_params)
end

function NavigationManager:find_cover_from_threat(nav_seg_id, optimal_threat_dis, near_pos, threat_pos)
	if type(nav_seg_id) == "table" then
		nav_seg_id = self._convert_nav_seg_map_to_vec(nav_seg_id)
	end

	local search_params = {
		near_pos = near_pos,
		threat_pos = threat_pos,
		in_nav_seg = nav_seg_id,
		optimal_threat_dis = optimal_threat_dis
	}

	return self._quad_field:find_cover(search_params)
end

function NavigationManager:find_cover_in_cone_from_threat_pos_1(threat_pos, furthest_pos, near_pos, search_from_pos, angle, min_dis, nav_seg, optimal_threat_dis, rsrv_filter)
	return self._quad_field:find_cover_in_cone(near_pos, threat_pos, angle, furthest_pos, rsrv_filter)
end

function NavigationManager:find_walls_accross_tracker(from_tracker, accross_vec, angle, nr_rays)
	angle = angle or 180

	local center_pos = from_tracker:field_position()

	nr_rays = math.max(2, nr_rays or 4)

	local rot_step = angle / (nr_rays - 1)
	local rot_offset = (math.random() * 2 - 1) * angle * 0.5
	local ray_rot = Rotation(-angle * 0.5 + rot_offset - rot_step)
	local vec_to = Vector3(accross_vec.x, accross_vec.y)

	mvec3_rot(vec_to, ray_rot)

	local pos_to = Vector3()

	mrotation.set_yaw_pitch_roll(ray_rot, rot_step, 0, 0)

	local tracker_from, pos_from

	if from_tracker:lost() then
		pos_from = center_pos
	else
		tracker_from = from_tracker
	end

	local ray_params = {
		trace = true,
		tracker_from = tracker_from,
		pos_from = pos_from,
		pos_to = pos_to
	}
	local ray_results = {}
	local i_ray = 1

	while i_ray <= nr_rays do
		mvec3_rot(vec_to, ray_rot)
		mvec3_set(pos_to, vec_to)
		mvec3_add(pos_to, center_pos)

		local hit = self:raycast(ray_params)

		if hit then
			table.insert(ray_results, {
				ray_params.trace[1],
				true
			})
		else
			table.insert(ray_results, {
				ray_params.trace[1]
			})
		end

		i_ray = i_ray + 1
	end

	return #ray_results > 0 and ray_results
end

function NavigationManager:find_segment_doors(from_seg_id, approve_clbk)
	local all_nav_segs = self._nav_segments
	local from_seg = all_nav_segs[from_seg_id]
	local found_doors = {}

	for neighbour_seg_id, door_list in pairs(from_seg.neighbours) do
		if not all_nav_segs[neighbour_seg_id].disabled and (not approve_clbk or approve_clbk(neighbour_seg_id)) then
			for _, door in ipairs(door_list) do
				if door.x then
					table.insert(found_doors, door)
				end
			end
		end
	end

	return found_doors
end

function NavigationManager:_commence_coarce_searches(t)
	local search_data = self._coarse_searches[1]

	if not search_data then
		return
	end

	table.remove(self._coarse_searches, 1)

	local result = self:_execute_coarce_search(search_data)

	search_data.results_callback(result)
end

function NavigationManager:_execute_coarce_search(search_data)
	local search_id = search_data.id
	local t = TimerManager:game():time()
	local all_nav_segments = self._nav_segments

	for i = 1, 500 do
		local next_search_seg = search_data.seg_to_search[#search_data.seg_to_search]
		local next_search_i_seg = next_search_seg.i_seg

		table.remove(search_data.seg_to_search)

		local neighbours = all_nav_segments[next_search_i_seg].neighbours

		if neighbours[search_data.end_i_seg] then
			local entry_found

			for _, door in ipairs(neighbours[search_data.end_i_seg]) do
				if door.x then
					entry_found = true

					break
				elseif t > door:delay_time() and door:check_access(search_data.access_pos, search_data.access_neg) then
					entry_found = true

					break
				end
			end

			if entry_found then
				local i_seg = next_search_i_seg
				local this_seg = next_search_seg
				local prev_seg = search_data.end_i_seg
				local path = {
					{
						search_data.end_i_seg,
						search_data.to_pos
					}
				}
				local searched = search_data.seg_searched

				table.insert(path, 1, {
					next_search_i_seg,
					next_search_seg.pos
				})

				while this_seg.from do
					i_seg = this_seg.from
					this_seg = searched[i_seg]

					table.insert(path, 1, {
						i_seg,
						this_seg.pos
					})
				end

				return path
			end
		end

		local to_pos = search_data.to_pos
		local new_segments = self:_sort_nav_segs_after_pos(to_pos, next_search_i_seg, search_data.discovered_seg, search_data.verify_clbk, search_data.access_pos, search_data.access_neg)
		local to_search = search_data.seg_to_search

		if new_segments then
			if search_data.access_pos then
				for i_seg in pairs(new_segments) do
					if self._quad_field:is_nav_segment_blocked(i_seg, search_data.access_pos) then
						new_segments[i_seg] = nil
					end
				end
			end

			for _, seg_data in pairs(new_segments) do
				local new_seg_weight = seg_data.weight
				local search_index = #to_search

				while search_index > 0 and new_seg_weight > to_search[search_index].weight do
					search_index = search_index - 1
				end

				table.insert(to_search, search_index + 1, seg_data)
			end
		end

		if #to_search == 0 then
			return false
		end

		search_data.seg_searched[next_search_i_seg] = next_search_seg
	end

	debug_pause("[NavigationManager:_execute_coarce_search] endless loop", inspect(search_data))

	return false
end

function NavigationManager:_sort_nav_segs_after_pos(to_pos, i_seg, ignore_seg, verify_clbk, access_pos, access_neg)
	local all_segs = self._nav_segments
	local t = TimerManager:game():time()
	local seg = all_segs[i_seg]
	local neighbours = seg.neighbours
	local found_segs

	local function check_segment(neighbour_seg_id, end_pos)
		local weight = mvec3_dis(end_pos, to_pos)
		local segment_data = {
			from = i_seg,
			i_seg = neighbour_seg_id,
			pos = end_pos,
			weight = weight
		}

		if found_segs and found_segs[neighbour_seg_id] then
			if weight < found_segs[neighbour_seg_id].weight then
				found_segs[neighbour_seg_id] = segment_data
			end
		else
			found_segs = found_segs or {}
			found_segs[neighbour_seg_id] = segment_data
			ignore_seg[neighbour_seg_id] = true
		end
	end

	for neighbour_seg_id, door_list in pairs(neighbours) do
		if not ignore_seg[neighbour_seg_id] and not all_segs[neighbour_seg_id].disabled and (not verify_clbk or verify_clbk(neighbour_seg_id)) then
			for _, door in ipairs(door_list) do
				if door.x then
					local end_pos = door

					check_segment(neighbour_seg_id, end_pos)
				elseif not alive(door) then
					debug_pause("[NavigationManager:_sort_nav_segs_after_pos] dead nav_link! between NavSegments", i_seg, "-", neighbour_seg_id)
				elseif not door:is_obstructed() and t > door:delay_time() and door:check_access(access_pos, access_neg) then
					local end_pos = door:script_data().element:nav_link_end_pos()

					check_segment(neighbour_seg_id, end_pos)
				end
			end
		end
	end

	return found_segs
end

function NavigationManager:raycast(params)
	local res = self._quad_field:test_walkability(params)

	return res
end

function NavigationManager._is_pos_in_room(pos, borders, height)
	if pos.x >= borders.x_neg and pos.x <= borders.x_pos and pos.y >= borders.y_neg and pos.y <= borders.y_pos then
		local z = NavFieldBuilder._get_room_height_at_pos(height, borders, pos)

		if math.abs(z - pos.z) < 100 then
			return true
		end
	end
end

function NavigationManager._is_pos_in_room_xy(pos, borders)
	if pos.x >= borders.x_neg and pos.x <= borders.x_pos and pos.y >= borders.y_neg and pos.y <= borders.y_pos then
		return true
	end
end

function NavigationManager:search_pos_to_pos(params)
	if params.access_pos then
		params.blocked_nav_segs = params.access_pos
	end

	self._quad_field:detailed_search(params)
end

function NavigationManager:search_coarse(params)
	local pos_to, start_i_seg, end_i_seg, access_pos, access_neg

	if params.from_seg then
		start_i_seg = params.from_seg
	elseif params.from_tracker then
		start_i_seg = params.from_tracker:nav_segment()
	end

	if not self._nav_segments[start_i_seg] then
		Application:error("[NavigationManager] Invalid start segment for coarse search (", start_i_seg, ")")

		return
	end

	if params.to_seg then
		end_i_seg = params.to_seg
	elseif params.to_tracker then
		end_i_seg = params.to_tracker:nav_segment()
	end

	if not self._nav_segments[end_i_seg] then
		Application:error("[NavigationManager] Invalid end segment for coarse search (", end_i_seg, ")")

		return
	end

	pos_to = params.to_pos or self._nav_segments[end_i_seg].pos

	if start_i_seg == end_i_seg then
		if params.results_clbk then
			params.results_clbk({
				{
					start_i_seg
				},
				{
					end_i_seg,
					mvec3_cpy(pos_to)
				}
			})

			return
		else
			return {
				{
					start_i_seg
				},
				{
					end_i_seg,
					mvec3_cpy(pos_to)
				}
			}
		end
	end

	if type_name(params.access_pos) == "table" then
		access_pos = self._quad_field:convert_access_filter_to_number(params.access_pos)
	elseif type_name(params.access_pos) == "string" then
		access_pos = self._quad_field:convert_nav_link_flag_to_bitmask(params.access_pos)
	else
		access_pos = params.access_pos
	end

	if params.access_neg then
		access_neg = self._quad_field:convert_nav_link_flag_to_bitmask(params.access_neg)
	else
		access_neg = 0
	end

	local new_search_data = {
		id = params.id,
		to_pos = mvec3_cpy(pos_to),
		start_i_seg = start_i_seg,
		end_i_seg = end_i_seg,
		seg_searched = {},
		discovered_seg = {
			[start_i_seg] = true
		},
		seg_to_search = {
			{
				i_seg = start_i_seg
			}
		},
		results_callback = params.results_clbk,
		verify_clbk = params.verify_clbk,
		access_pos = access_pos,
		access_neg = access_neg
	}

	if params.results_clbk then
		table.insert(self._coarse_searches, new_search_data)
	else
		local result = self:_execute_coarce_search(new_search_data)

		return result
	end
end

function NavigationManager:cancel_pathing_search(search_id)
	self._quad_field:abort_detailed_search(search_id)
end

function NavigationManager:cancel_coarse_search(search_id)
	for i, search_data in ipairs(self._coarse_searches) do
		if search_id == search_data.id then
			table.remove(self._coarse_searches, i)

			return
		end
	end
end

function NavigationManager:print_rect_info()
	local camera = setup:freeflight():enabled() and setup:freeflight()._camera_object or managers.viewport:get_current_camera()
	local cam_pos = camera:position()
	local cam_fwd = camera:rotation():y() * 20000
	local cam_look_ray = World:raycast("ray", cam_pos, cam_pos + cam_fwd)

	if cam_look_ray then
		local look_pos = cam_look_ray.position
		local nav_tracker = self._quad_field:create_nav_tracker(look_pos, true)
		local nav_seg_id = nav_tracker:nav_segment()

		print("- - - - -\nnav_segment:", nav_seg_id, self._nav_segments[nav_seg_id].disabled and "disabled")
		self._quad_field:destroy_nav_tracker(nav_tracker)

		if managers.groupai:state()._area_data then
			local areas_text = ""

			for area_id, area in pairs(managers.groupai:state()._area_data) do
				if area.nav_segs[nav_seg_id] then
					for k, v in pairs(area) do
						areas_text = areas_text .. k .. ": " .. tostring(inspect(v)) .. "\n"
					end
				end
			end

			print("areas: " .. areas_text)
		end
	else
		print("camera ray missed")
	end
end

function NavigationManager:draw_path(path, color_link, color_node, duration)
	if path then
		color_node = color_node and Color(unpack(color_node)) or Color(0.2, math.random(), math.random(), math.random())
		color_link = color_link and Color(unpack(color_link)) or Color(0.1, math.random(), math.random(), math.random())

		local brush_node = Draw:brush(color_node, duration)
		local brush_link = Draw:brush(color_link, duration)

		brush_node:sphere(CopActionWalk._nav_point_pos(path[1]), 15)

		for i = 2, #path do
			if path[i].x then
				brush_node:sphere(path[i], 8)

				if path[i - 1].x then
					brush_link:cylinder(path[i], path[i - 1], 5)
				else
					brush_link:cylinder(path[i], CopActionWalk._nav_point_pos(path[i - 1]), 5)
				end
			else
				local start_pos = CopActionWalk._nav_point_pos(path[i])
				local end_pos = start_pos + Rotation(path[i].element:value("rotation"), 0, 0):y() * 100

				brush_node:sphere(start_pos, 8)
				brush_node:sphere(end_pos, 8)
				brush_link:cone(end_pos, start_pos, 30)

				if path[i - 1].x then
					brush_link:cylinder(start_pos, path[i - 1], 5)
				else
					brush_link:cylinder(start_pos, CopActionWalk._nav_point_pos(path[i - 1]), 5)
				end
			end
		end
	end
end

function NavigationManager:create_nav_tracker(start_pos, allow_disabled)
	return self._quad_field:create_nav_tracker(start_pos, allow_disabled)
end

function NavigationManager:destroy_nav_tracker(nav_tracker)
	if alive(nav_tracker) then
		self._quad_field:destroy_nav_tracker(nav_tracker)
	end
end

function NavigationManager:get_nav_seg_from_i_room(i_room)
	return self._visibility_groups[self._rooms[i_room].vis_group].seg
end

function NavigationManager:get_nav_seg_from_i_vis_group(i_group)
	return self._visibility_groups[i_group].seg
end

function NavigationManager:get_nav_seg_from_pos(pos, allow_disabled)
	return self._quad_field:find_nav_segment(pos, allow_disabled)
end

function NavigationManager:get_nav_seg_neighbours(seg_id)
	return self._nav_segments[seg_id].neighbours
end

function NavigationManager:on_game_started()
	Application:debug("[NavigationManager:on_game_started()]")
	self:register_cover_units()
	self:remove_AI_blocker_units()
end

function NavigationManager:on_simulation_started()
	if self:is_data_ready() then
		self:_unregister_cover_units()
		self:register_cover_units()
	end

	self:remove_AI_blocker_units()
end

function NavigationManager:reserve_pos(start_t, duration, pos, step_clbk, radius, filter)
	local entry = {
		position = mvec3_cpy(pos),
		radius = radius,
		start_t = start_t,
		expire_t = start_t and duration and start_t + duration,
		filter = filter
	}
	local quad_field = self._quad_field
	local free_chk_func = quad_field.is_position_unreserved
	local search_pos = entry.position
	local found_pos

	repeat
		if free_chk_func(quad_field, entry) then
			self:add_pos_reservation(entry)

			return entry
		elseif not step_clbk or not step_clbk(search_pos) then
			return
		end
	until false
end

function NavigationManager:is_pos_free(desc)
	return self._quad_field:is_position_unreserved(desc)
end

function NavigationManager:add_pos_reservation(desc)
	if self._debug and not desc.filter then
		print("[NavigationManager:add_pos_reservation] No filter added")
	end

	desc.id = self._quad_field:add_position_reservation(desc)

	if self._pos_reservations[desc.id] and not self._pos_reservations[desc.id][1].expire_t then
		if not Application:editor() then
			debug_pause("[NavigationManager:add_pos_reservation] LEAKING POS RESERVATION!!", inspect(self._pos_reservations[desc.id]))
		end

		return
	end

	self._pos_reservations[desc.id] = {
		desc
	}

	if self._debug and desc.filter then
		for u_key, u_data in pairs(managers.enemy:all_enemies()) do
			if u_data.unit:movement():pos_rsrv_id() == desc.filter then
				self._pos_reservations[desc.id].unit = u_data.unit
				self._pos_reservations[desc.id].u_name = u_data.unit:name()
				self._pos_reservations[desc.id].stack = Application:stack()

				return
			end
		end
	end
end

function NavigationManager:unreserve_pos(desc)
	if not desc or desc.unreserved then
		Application:error("[NavigationManager:unreserve_pos] Reservation already unreserved:", desc.id)

		return
	end

	if self._pos_reservations then
		self._pos_reservations[desc.id] = nil
	end

	self._quad_field:remove_position_reservation(desc.id)

	desc.id = nil
end

function NavigationManager:move_pos_rsrv(desc)
	if self._pos_reservations[desc.id] then
		self._pos_reservations[desc.id].position = desc.position

		self._quad_field:move_position_reservation(desc.id, desc.position)
	end
end

function NavigationManager:on_simulation_ended()
	if self._nav_links then
		local nav_links = clone(self._nav_links)

		for element, _ in pairs(nav_links) do
			self:unregister_anim_nav_link(element)
		end
	end

	for nav_seg_id, nav_seg in pairs(self._nav_segments) do
		for neighbour_nav_seg_id, door_list in pairs(nav_seg.neighbours) do
			for i = #door_list, 1, -1 do
				if not door_list[i].x then
					table.remove(door_list, i)
				end
			end

			if not next(door_list) then
				nav_seg.neighbours[neighbour_nav_seg_id] = nil
			end
		end
	end

	self:_unregister_cover_units()

	for i, obs_data in ipairs(self._obstacles) do
		self._quad_field:remove_obstacle(obs_data.id)
	end

	self._obstacles = {}

	self:_clear()

	if self._load_data then
		self:set_load_data(self._load_data)
	end
end

function NavigationManager:_send_nav_field_to_engine(load_data)
	if not load_data.segments then
		return
	end

	local segments = {}

	for _, nav_seg in pairs(load_data.segments) do
		local unique_id = tostring(nav_seg.id)

		table.insert(segments, {
			unique_id = unique_id,
			position = nav_seg.pos,
			vis_groups = nav_seg.vis_groups
		})
	end

	local engine_data = {
		quad_borders_x_pos = load_data.quad_borders_x_pos,
		quad_borders_x_neg = load_data.quad_borders_x_neg,
		quad_borders_y_pos = load_data.quad_borders_y_pos,
		quad_borders_y_neg = load_data.quad_borders_y_neg,
		quad_heights_xp_yp = load_data.quad_heights_xp_yp,
		quad_heights_xp_yn = load_data.quad_heights_xp_yn,
		quad_heights_xn_yp = load_data.quad_heights_xn_yp,
		quad_heights_xn_yn = load_data.quad_heights_xn_yn,
		door_low_pos = load_data.door_low_pos,
		door_high_pos = load_data.door_high_pos,
		door_low_quads = load_data.door_low_quads,
		door_high_quads = load_data.door_high_quads,
		visibility_groups = load_data.visibility_groups,
		segments = segments
	}

	self._quad_field:load_nav_data(engine_data, 0, Vector3(), Rotation())
end

function NavigationManager:get_pos_reservation_id()
	local i = 1
	local filters = self._pos_rsrv_filters

	while filters[i] do
		i = i + 1
	end

	filters[i] = true

	return i
end

function NavigationManager:release_pos_reservation_id(id)
	self._pos_rsrv_filters[id] = nil
end

function NavigationManager:convert_nav_link_maneuverability_to_SO_access(maneuverability)
	local t_ins = table.insert
	local nav_link_filter = {}

	if maneuverability <= 7 then
		t_ins(nav_link_filter, "security_patrol")
	end

	if maneuverability <= 4 then
		t_ins(nav_link_filter, "spooc")
	end

	if maneuverability <= 3 then
		t_ins(nav_link_filter, "murky")
		t_ins(nav_link_filter, "sniper")
		t_ins(nav_link_filter, "taser")
		t_ins(nav_link_filter, "teamAI1")
		t_ins(nav_link_filter, "teamAI2")
		t_ins(nav_link_filter, "teamAI3")
		t_ins(nav_link_filter, "teamAI4")
	end

	if maneuverability <= 2 then
		t_ins(nav_link_filter, "fbi")
		t_ins(nav_link_filter, "swat")
		t_ins(nav_link_filter, "gangster")
	end

	if maneuverability <= 1 then
		t_ins(nav_link_filter, "security")
		t_ins(nav_link_filter, "cop")
		t_ins(nav_link_filter, "tank")
		t_ins(nav_link_filter, "shield")
	end

	if maneuverability <= 0 then
		t_ins(nav_link_filter, "civ_male")
		t_ins(nav_link_filter, "SO_ID1")
		t_ins(nav_link_filter, "SO_ID2")
		t_ins(nav_link_filter, "SO_ID3")
	end

	local access_filter = self:convert_access_filter_to_number(nav_link_filter)

	print("[NavigationManager:convert_nav_link_maneuverability_to_SO_access] maneuverability", maneuverability, "nav_link_filter", inspect(nav_link_filter), "access_filter", access_filter)

	return access_filter
end

function NavigationManager:convert_SO_AI_group_to_access(ai_group_name)
	local ai_group_filter

	if ai_group_name == "friendlies" then
		ai_group_filter = {
			"teamAI1",
			"teamAI2",
			"teamAI3",
			"teamAI4"
		}
	elseif ai_group_name == "enemies" then
		ai_group_filter = {
			"cop",
			"security_patrol",
			"shield",
			"tank",
			"security",
			"gangster",
			"swat",
			"fbi",
			"taser",
			"sniper",
			"murky",
			"spooc"
		}
	elseif ai_group_name == "civilians" then
		ai_group_filter = {
			"civ_male",
			"civ_female",
			"SO_ID1",
			"SO_ID2",
			"SO_ID3"
		}
	elseif ai_group_name == "chavez" or ai_group_name == "bank_manager_old_man" or ai_group_name == "escort_guy_1" or ai_group_name == "escort_guy_2" or ai_group_name == "escort_guy_3" or ai_group_name == "escort_guy_5" then
		ai_group_filter = {
			"SO_ID1"
		}
	elseif ai_group_name == "escort_guy_4" then
		ai_group_filter = {
			"SO_ID2"
		}
	elseif ai_group_name == "unique_patrol_forbid" then
		ai_group_filter = {
			"security_patrol"
		}
	else
		debug_pause("[NavigationManager:convert_SO_AI_group_to_access] Unknown SO AI group name", ai_group_name)

		return 0
	end

	local access_filter = self:convert_access_filter_to_number(ai_group_filter)

	return access_filter
end

function NavigationManager:convert_access_filter_to_number(access_filter)
	return self._quad_field:convert_access_filter_to_number(access_filter)
end

function NavigationManager:convert_access_filter_to_string(access_filter)
	return self._quad_field:convert_access_filter_to_string(access_filter)
end

function NavigationManager:convert_access_filter_to_table(access_filter)
	return self._quad_field:convert_access_filter_to_table(access_filter)
end

function NavigationManager:convert_access_flag(access_flag)
	return self._quad_field:convert_nav_link_flag_to_bitmask(access_flag)
end

function NavigationManager:check_access(access_filter, pos, neg)
	return self._quad_field:check_access_bitmask(access_filter, pos, neg)
end

function NavigationManager:upgrade_access_filter(access_filter_bitmask_old, version)
	local old_translation = self.ACCESS_FLAGS_OLD[version]

	self._quad_field:set_nav_link_filter(old_translation)

	local access_filter_table_old = self._quad_field:convert_nav_link_filter(access_filter_bitmask_old)

	self._quad_field:set_nav_link_filter(self.ACCESS_FLAGS)

	local access_filter_bitmask_new = self._quad_field:convert_nav_link_filter(access_filter_table_old)

	return access_filter_bitmask_new
end

function NavigationManager:get_nav_seg_metadata(nav_seg_id)
	return self._nav_segments[nav_seg_id]
end

function NavigationManager:set_location_ID(nav_seg_id, location_id)
	self:_set_nav_seg_metadata(nav_seg_id, "location_id", location_id)
end

function NavigationManager:set_suspicion_multiplier(nav_seg_id, suspicion_mul)
	self:_set_nav_seg_metadata(nav_seg_id, "suspicion_mul", suspicion_mul)
end

function NavigationManager:set_detection_multiplier(nav_seg_id, detection_mul)
	self:_set_nav_seg_metadata(nav_seg_id, "detection_mul", detection_mul)
end

function NavigationManager:_set_nav_seg_metadata(nav_seg_id, param_name, param_value)
	if self._nav_segments then
		local nav_seg = self._nav_segments[nav_seg_id]

		if nav_seg then
			nav_seg[param_name] = param_value
		end
	end

	self._builder:set_nav_seg_metadata(nav_seg_id, param_name, param_value)
end

function NavigationManager:add_obstacle(obstacle_unit, obstacle_obj_name)
	local obstacle_obj = obstacle_unit:get_object(obstacle_obj_name)

	if not obstacle_obj then
		Application:error("[NavigationManager:add_obstacle] There was no obj to reference in this unit!", obstacle_unit, obstacle_obj_name, world_id)

		return
	end

	local id = self._quad_field:add_obstacle(obstacle_obj)

	table.insert(self._obstacles, {
		id = id,
		unit = obstacle_unit,
		obstacle_obj_name = obstacle_obj_name
	})
end

function NavigationManager:remove_obstacle(obstacle_unit, obstacle_obj_name)
	local obstacle_obj = obstacle_unit:get_object(obstacle_obj_name)

	if not obstacle_obj then
		Application:error("[NavigationManager:remove_obstacle] There was no obj to reference in this unit!", obstacle_unit, obstacle_obj_name)

		return
	end

	self._quad_field:remove_obstacle(obstacle_obj)

	local temp_array = {}
	local removed

	for i, obs_data in ipairs(self._obstacles) do
		removed = false

		if not alive(obs_data.unit) then
			Application:debug("[NavigationManager:remove_obstacle] Found dead unit in obstalce list, removing it:", i)

			removed = true
		elseif obs_data.unit:key() == obstacle_unit:key() and obs_data.obstacle_obj_name == obstacle_obj_name then
			Application:debug("[NavigationManager:remove_obstacle] obstacle removed", obs_data.obstacle_obj_name, obs_data.id)
			self._quad_field:remove_obstacle(obs_data.id)

			removed = true
		end

		if not removed then
			table.insert(temp_array, self._obstacles[i])
		end
	end

	Application:debug("[NavigationManager:remove_obstacle] Inspecting obstacles removed:", removed, removed and inspect(temp_array))

	self._obstacles = temp_array
end

function NavigationManager:clbk_navfield(event_name, args, args2, args3)
	if event_name == "add_nav_seg_neighbours" then
		for nav_seg_id, add_neighbours in pairs(args) do
			local nav_seg = self._nav_segments[nav_seg_id]

			if not nav_seg then
				return
			end

			for _, other_nav_seg_id in ipairs(add_neighbours) do
				if nav_seg.disabled_neighbours[other_nav_seg_id] then
					nav_seg.neighbours[other_nav_seg_id] = nav_seg.neighbours[other_nav_seg_id] or {}

					local i_door = 1

					while i_door <= #nav_seg.disabled_neighbours[other_nav_seg_id] do
						local door = table.remove(nav_seg.disabled_neighbours[other_nav_seg_id], i_door)

						if door.x then
							table.insert(nav_seg.neighbours[other_nav_seg_id], door)
						else
							i_door = i_door + 1
						end
					end

					if not next(nav_seg.disabled_neighbours[other_nav_seg_id]) then
						nav_seg.disabled_neighbours[other_nav_seg_id] = nil
					end

					if not next(nav_seg.disabled_neighbours) then
						nav_seg.disabled_neighbours = nil
					end
				end
			end
		end

		for nav_seg_id, add_neighbours in pairs(args) do
			managers.groupai:state():on_nav_seg_neighbours_state(nav_seg_id, args, true)
		end
	elseif event_name == "remove_nav_seg_neighbours" then
		for nav_seg_id, rem_neighbours in pairs(args) do
			local nav_seg = self._nav_segments[nav_seg_id]

			if not nav_seg then
				return
			end

			for _, other_nav_seg_id in ipairs(rem_neighbours) do
				local other_nav_seg = self._nav_segments[other_nav_seg_id]

				nav_seg.disabled_neighbours = nav_seg.disabled_neighbours or {}
				nav_seg.disabled_neighbours[other_nav_seg_id] = nav_seg.disabled_neighbours[other_nav_seg_id] or {}

				local i_door = 1

				while i_door <= #nav_seg.neighbours[other_nav_seg_id] do
					if nav_seg.neighbours[other_nav_seg_id][i_door].x then
						local door = table.remove(nav_seg.neighbours[other_nav_seg_id], i_door)

						table.insert(nav_seg.disabled_neighbours[other_nav_seg_id], door)
					else
						i_door = i_door + 1
					end
				end

				if not next(nav_seg.neighbours[other_nav_seg_id]) then
					nav_seg.neighbours[other_nav_seg_id] = nil
				end
			end
		end

		for nav_seg_id, rem_neighbours in pairs(args) do
			managers.groupai:state():on_nav_seg_neighbours_state(nav_seg_id, args, false)
		end
	elseif event_name == "invalidated_script_data" then
		if args.covers then
			for i_cover, cover in ipairs(args.covers) do
				cover[NavigationManager.COVER_TRACKER]:move(cover[NavigationManager.COVER_POSITION])

				local location_script_data = self._quad_field:get_script_data(cover[NavigationManager.COVER_TRACKER], true)

				if not location_script_data.covers then
					location_script_data.covers = {}
				end

				table.insert(location_script_data.covers, cover)
			end
		end
	elseif event_name == "unobstruct_nav_link" then
		local nav_seg_from_id = args
		local nav_seg_to_id = args2
		local nav_link_id = args3
		local nav_seg_from = self._nav_segments[nav_seg_from_id]

		if not nav_seg_from then
			return
		end

		if nav_seg_from.disabled_neighbours and nav_seg_from.disabled_neighbours[nav_seg_to_id] then
			for i_door, door in pairs(nav_seg_from.disabled_neighbours[nav_seg_to_id]) do
				if not door.x and door:script_data().element:id() == nav_link_id then
					local is_first_door = not nav_seg_from.neighbours[nav_seg_to_id]
					local new_neighbour = table.remove(nav_seg_from.disabled_neighbours[nav_seg_to_id], i_door)

					nav_seg_from.neighbours[nav_seg_to_id] = nav_seg_from.neighbours[nav_seg_to_id] or {}

					table.insert(nav_seg_from.neighbours[nav_seg_to_id], new_neighbour)

					if not next(nav_seg_from.disabled_neighbours[nav_seg_to_id]) then
						nav_seg_from.disabled_neighbours[nav_seg_to_id] = nil
					end

					if is_first_door then
						managers.groupai:state():on_nav_seg_neighbour_state(nav_seg_from_id, nav_seg_to_id, true)
					end

					return
				end
			end
		end
	elseif event_name == "obstruct_nav_link" then
		local nav_seg_from_id = args
		local nav_seg_to_id = args2
		local nav_link_id = args3
		local nav_seg_from = self._nav_segments[nav_seg_from_id]

		if not nav_seg_from.neighbours[nav_seg_to_id] then
			debug_pause("[NavigationManager:clbk_navfield] did not have such neighbour", event_name, args, args2, args3)

			return
		end

		for i_door, door in pairs(nav_seg_from.neighbours[nav_seg_to_id]) do
			if not door.x and door:script_data().element:id() == nav_link_id then
				local neighbour = table.remove(nav_seg_from.neighbours[nav_seg_to_id], i_door)

				nav_seg_from.disabled_neighbours = nav_seg_from.disabled_neighbours or {}
				nav_seg_from.disabled_neighbours[nav_seg_to_id] = nav_seg_from.disabled_neighbours[nav_seg_to_id] or {}

				table.insert(nav_seg_from.disabled_neighbours[nav_seg_to_id], neighbour)

				if not next(nav_seg_from.neighbours[nav_seg_to_id]) then
					nav_seg_from.neighbours[nav_seg_to_id] = nil

					managers.groupai:state():on_nav_seg_neighbour_state(nav_seg_from_id, nav_seg_to_id, false)
				end

				managers.groupai:state():on_nav_link_unregistered(nav_link_id)

				return
			end
		end

		debug_pause("[NavigationManager:clbk_navfield] did not find nav_link", event_name, args, args2, args3)
	end
end

function NavigationManager:destroy()
	self._quad_field:clear_all()
end
