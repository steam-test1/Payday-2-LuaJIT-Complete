core:module("CoreInput")
core:import("CoreClass")

function shift()
	return Input:keyboard():down(Idstring("left shift")) or Input:keyboard():down(Idstring("right shift"))
end

function ctrl()
	return Input:keyboard():down(Idstring("left ctrl")) or Input:keyboard():down(Idstring("right ctrl"))
end

function alt()
	return Input:keyboard():down(Idstring("left alt"))
end

RepKey = RepKey or CoreClass.class()

function RepKey:init(keys, pause, rep)
	self._keys = keys or {}
	self._current_time = 0
	self._current_rep_time = 0
	self._pause = pause or 0.5
	self._rep = rep or 0.1
	self._input = Input:keyboard()
end

function RepKey:set_input(input)
	self._input = input
end

function RepKey:update(d, dt)
	local anykey = false

	for _, key in ipairs(self._keys) do
		if self._input:down(Idstring(key)) then
			anykey = true

			break
		end
	end

	local down = false

	if anykey then
		if self._current_time == 0 then
			down = true
		end

		if self._current_time >= self._pause then
			down = true

			if self._current_rep_time >= self._rep then
				down = true
				self._current_rep_time = 0
			else
				down = false
				self._current_rep_time = self._current_rep_time + dt
			end
		else
			self._current_time = self._current_time + dt
		end
	else
		self._current_time = 0
		self._current_rep_time = 0
	end

	return down
end

InputUtils = InputUtils or class()

local IDS_BACKSPACE = Idstring("backspace")
local IDS_DELETE = Idstring("delete")
local IDS_INSERT = Idstring("insert")
local IDS_LEFT = Idstring("left")
local IDS_RIGHT = Idstring("right")
local IDS_UP = Idstring("up")
local IDS_DOWN = Idstring("down")
local IDS_END = Idstring("end")
local IDS_HOME = Idstring("home")
local IDS_ENTER = Idstring("enter")
local IDS_ESC = Idstring("esc")
local IDS_A = Idstring("a")
local IDS_C = Idstring("c")
local IDS_X = Idstring("x")

function InputUtils.find_ctrl_backspace_block_from_end(str)
	local len = utf8.len(str)

	if len == 0 then
		return nil
	end

	local find = 1
	local state = 1

	for i = 1, len do
		local char = utf8.sub(str, i, i)
		local byte = utf8.byte(char)
		local is_ascii = bit.band(byte, bit.bnot(127)) == 0
		local is_space = byte == 32

		if not is_ascii then
			break
		end

		if state == 1 and not is_space then
			state = 2
		end

		if state == 2 and is_space then
			state = 3
		end

		if state == 3 and not is_space then
			find = find - 1

			break
		end

		find = find + 1
	end

	return find
end

function InputUtils.find_ctrl_backspace_block_from_start(str)
	return InputUtils.find_ctrl_backspace_block_from_end(utf8.reverse(str))
end

function InputUtils.common_text_input_key_press(text, key, max_length, multi_line, enter_callback, esc_callback, arrow_key_callback)
	local selection_start, selection_end = text:selection()
	local text_length = utf8.len(text:text())

	if key == IDS_BACKSPACE then
		if selection_start == selection_end and selection_start > 0 then
			if ctrl() then
				local prev_text = utf8.sub(text:text(), 1, selection_start)
				local index = InputUtils.find_ctrl_backspace_block_from_start(prev_text)

				if index then
					index = index - 1
				else
					index = selection_start
				end

				if index == 0 then
					index = index + 1
				end

				text:set_selection(selection_start - index, selection_end)
			else
				text:set_selection(selection_start - 1, selection_end)
			end
		end

		text:replace_text("")
	elseif key == IDS_DELETE then
		if selection_start == selection_end and selection_start < text_length then
			if ctrl() then
				local next_text = utf8.sub(text:text(), selection_start + 1)
				local index = InputUtils.find_ctrl_backspace_block_from_end(next_text)

				if index then
					index = index - 1
				else
					index = selection_start
				end

				if index == 0 then
					index = index + 1
				end

				text:set_selection(selection_start, selection_end + index)
			else
				text:set_selection(selection_start, selection_end + 1)
			end
		end

		text:replace_text("")
	elseif key == IDS_INSERT then
		local clipboard = Application:get_clipboard() or ""

		text:replace_text(clipboard)

		if max_length and max_length < utf8.len(text:text()) then
			text:set_text(utf8.sub(text:text(), 1, max_length))
		end

		if not multi_line then
			local lines = text:line_breaks()

			if #lines > 1 then
				local line_start = lines[2]
				local line_end = utf8.len(text:text())

				text:set_selection(line_start, line_end)
				text:replace_text("")
			end
		end
	elseif key == IDS_LEFT or key == IDS_RIGHT then
		local is_key_left = key == IDS_LEFT

		if selection_start == selection_end then
			text:set_selection_direction(is_key_left and "left" or "right")
		end

		local is_direction_left = text:selection_direction() == "left"
		local new_start = selection_start
		local new_end = selection_end
		local start_modification = 0
		local end_modification = 0

		if ctrl() then
			local prev_text, index

			if is_key_left then
				if is_direction_left then
					prev_text = utf8.sub(text:text(), 1, selection_start)
					index = InputUtils.find_ctrl_backspace_block_from_start(prev_text)
				else
					prev_text = utf8.sub(text:text(), selection_start, selection_end)
					index = InputUtils.find_ctrl_backspace_block_from_start(prev_text)
				end
			elseif is_direction_left then
				prev_text = utf8.sub(text:text(), selection_start + 1, selection_end)
				index = InputUtils.find_ctrl_backspace_block_from_end(prev_text)
			else
				prev_text = utf8.sub(text:text(), selection_end + 1)
				index = InputUtils.find_ctrl_backspace_block_from_end(prev_text)
			end

			if index then
				index = index - 1
			else
				index = is_direction_left and selection_start or text_length
			end

			if index == 0 then
				index = index + 1
			end

			if shift() then
				if is_key_left then
					if is_direction_left then
						start_modification = -index
					else
						end_modification = -index
					end
				elseif is_direction_left then
					start_modification = index
				else
					end_modification = index
				end
			elseif is_direction_left then
				new_end = new_start
				start_modification = -index
				end_modification = -index
			else
				new_start = new_end
				start_modification = index
				end_modification = index
			end
		elseif shift() then
			if is_direction_left then
				if is_key_left then
					start_modification = -1
				else
					start_modification = 1
				end
			elseif is_key_left then
				end_modification = -1
			else
				end_modification = 1
			end
		elseif is_key_left then
			new_end = new_start
			start_modification = -1
			end_modification = -1
		else
			new_start = new_end
			start_modification = 1
			end_modification = 1
		end

		text:set_selection(new_start + start_modification, new_end + end_modification)
	elseif key == IDS_UP then
		if arrow_key_callback then
			arrow_key_callback("up")
		end
	elseif key == IDS_DOWN then
		if arrow_key_callback then
			arrow_key_callback("down")
		end
	elseif key == IDS_END then
		if shift() then
			if selection_start == selection_end then
				text:set_selection_direction("right")
			end

			if text:selection_direction() == "right" then
				text:set_selection(selection_start, text_length)
			else
				text:set_selection(selection_end, text_length)
				text:set_selection_direction("right")
			end
		else
			text:set_selection(text_length, text_length)
		end
	elseif key == IDS_HOME then
		if shift() then
			if selection_start == selection_end then
				text:set_selection_direction("left")
			end

			if text:selection_direction() == "left" then
				text:set_selection(0, selection_end)
			else
				text:set_selection(0, selection_start)
				text:set_selection_direction("left")
			end
		else
			text:set_selection(0, 0)
		end
	elseif key == IDS_ENTER then
		if enter_callback then
			enter_callback()
		end
	elseif key == IDS_ESC then
		if esc_callback then
			if not _G.IS_VR then
				text:set_text("")
				text:set_selection(0, 0)
			end

			esc_callback()
		end
	elseif key == IDS_A and ctrl() then
		text:set_selection(0, text_length)
	elseif key == IDS_C and ctrl() then
		if selection_start ~= selection_end then
			Application:set_clipboard(utf8.sub(text:text(), selection_start + 1, selection_end))
		end
	elseif key == IDS_X and ctrl() and selection_start ~= selection_end then
		Application:set_clipboard(utf8.sub(text:text(), selection_start + 1, selection_end))
		text:replace_text("")
	end
end

function InputUtils.common_text_input_update_caret(text, caret, focus, placeholder, empty_offset, hide_placeholder_on_focus)
	if not focus then
		local text_len = utf8.len(text:text())

		text:set_selection(text_len, text_len)
	end

	local selection_start, selection_end = text:selection()
	local x, y, w, h = text:selection_rect()
	local text_s = text:text()

	if selection_start == 0 and selection_end == 0 and utf8.len(text_s) == 0 then
		if text:align() == "center" then
			x = text:world_center_x()
		else
			x = text:world_x()
		end

		y = text:world_y()

		if empty_offset then
			if empty_offset.y then
				y = y + empty_offset.y
			end

			if empty_offset.x then
				x = x + empty_offset.x
			end
		end
	end

	h = text:line_height()

	if w < 3 then
		w = 3
	end

	if not focus then
		w = 0
		h = 0
	end

	caret:set_world_shape(x, y + 2, w, h - 4)

	if placeholder then
		placeholder:set_visible(utf8.len(text_s) == 0 and (not hide_placeholder_on_focus or not focus))
	end

	local navigating_through_text = false

	if Input:keyboard() and focus and utf8.len(text_s) > 0 then
		navigating_through_text = Input:keyboard():down(IDS_LEFT) or Input:keyboard():down(IDS_RIGHT)
	end

	if selection_start ~= selection_end then
		caret:set_layer(text:layer() - 2)
	else
		caret:set_layer(text:layer() + 1)
	end

	return selection_start == selection_end and focus and not navigating_through_text
end
