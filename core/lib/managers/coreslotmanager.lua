core:module("CoreSlotManager")

SlotManager = SlotManager or class()

function SlotManager:init()
	local unit_manager = World:unit_manager()

	unit_manager:set_slot_limited(0, 0)
	unit_manager:set_slot_infinite(1)
	unit_manager:set_slot_infinite(10)
	unit_manager:set_slot_infinite(11)
	unit_manager:set_slot_infinite(15)
	unit_manager:set_slot_infinite(19)
	unit_manager:set_slot_infinite(29)
	unit_manager:set_slot_infinite(35)

	self._masks = {
		statics = World:make_slot_mask(1, 15, 36),
		editor_all = World:make_slot_mask(1, 10, 11, 15, 19, 35, 36),
		mission_elements = World:make_slot_mask(10),
		surface_move = World:make_slot_mask(1, 11, 20, 21, 24, 35, 38),
		hub_elements = World:make_slot_mask(10),
		sound_layer = World:make_slot_mask(19),
		environment_layer = World:make_slot_mask(19),
		portal_layer = World:make_slot_mask(19),
		ai_layer = World:make_slot_mask(19),
		dynamics = World:make_slot_mask(11),
		statics_layer = World:make_slot_mask(1, 11, 15),
		dynamics_layer = World:make_slot_mask(11),
		dump_all = World:make_slot_mask(1),
		wires = World:make_slot_mask(35),
		brush_placeable = World:make_slot_mask(1),
		brushes = World:make_slot_mask(29)
	}
end

function SlotManager:get_mask(...)
	local mask = nil
	local arg_list = {
		...
	}

	for _, name in pairs(arg_list) do
		local next_mask = self._masks[name]

		if next_mask then
			if not mask then
				mask = next_mask
			else
				mask = mask + next_mask
			end
		else
			Application:error("Invalid slotmask \"" .. tostring(name) .. "\".")
		end
	end

	if #arg_list == 0 then
		Application:error("No parameters passed to get_mask function.")
	end

	return mask
end

function SlotManager:get_mask_name(slotmask)
	return table.get_key(self._masks, slotmask)
end

function SlotManager:get_mask_map()
	return self._masks
end

function SlotManager:make_slot_mask_table(v)
	local type = type
	local next = next
	local unpack = unpack
	local str_slotmasks = {}
	local num_slotmasks = {}
	local neg_num_slotmasks = {}

	for i = 1, #v do
		local var = v[i]
		local v_type = type(var)

		if v_type == "string" then
			str_slotmasks[#str_slotmasks + 1] = var
		elseif v_type == "number" then
			if var == 0 then
				print("[SlotManager:make_slot_mask_table] Slotmask 0 detected, skipping. Avoid using with other values, as its used for deleting units")
			elseif var < 0 then
				neg_num_slotmasks[#neg_num_slotmasks + 1] = -var
			else
				num_slotmasks[#num_slotmasks + 1] = var
			end
		else
			print("[SlotManager:make_slot_mask_table] Invalid variable inside table sent, type ", v_type)
		end
	end

	local slotmask = nil

	if next(str_slotmasks) then
		slotmask = managers.slot:get_mask(unpack(str_slotmasks))
	end

	if next(num_slotmasks) then
		local num_slotmask = World:make_slot_mask(unpack(num_slotmasks))

		if slotmask then
			slotmask = slotmask + num_slotmask
		else
			slotmask = num_slotmask
		end
	end

	if next(neg_num_slotmasks) then
		local neg_num_slotmask = World:make_slot_mask(unpack(neg_num_slotmasks))

		if slotmask then
			slotmask = slotmask - neg_num_slotmask
		else
			print("[SlotManager:make_slot_mask_table] Negative slotmask values can't be used on their own, numbers above 0 or strings should be used as well. " .. tostring(neg_num_slotmasks))
		end
	end

	return slotmask
end

function SlotManager:make_slot_mask_number(v)
	local slotmask = nil

	if v < 0 then
		print("[SlotManager:make_slot_mask_number] Can't make a slotmask using a negative value, numbers above 0 or equal should be used")
	else
		if v == 0 then
			print("[SlotManager:make_slot_mask_number] Slotmask 0 detected. Ensure this is intended, as its used for deleting units")
		end

		slotmask = World:make_slot_mask(v)
	end

	return slotmask
end

function SlotManager:make_slot_mask_string(v)
	return self:get_mask(v)
end

function SlotManager:make_slot_mask(v)
	local v_type = type(v)
	local func = self["make_slot_mask_" .. v_type]

	if func then
		return func(self, v)
	else
		print("[SlotManager:make_slot_mask] Invalid variable sent, type ", v_type)
	end
end
