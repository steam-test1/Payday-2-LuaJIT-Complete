HybridMenuHandler = HybridMenuHandler or class()

function HybridMenuHandler:init(node_gui, node)
	self._items = {}
	self._node_gui = node_gui
	self._node = node
	node._allow_deselect = true

	local orig = node_gui._align_marker

	function node_gui:_align_marker(row_item)
		if not row_item then
			self._marker_data.marker:hide()

			return
		end

		orig(self, row_item)
	end

	local input = managers.menu:active_menu().input

	function input._menu_input_core_pre_update_clbk()
		local item = self._selected_item

		if item and item.TYPE ~= nil then
			local axis_timer = input:axis_timer()

			if axis_timer.x <= 0 then
				input._item_input_action_map[item.TYPE](item, input._controller)
			end
		end
	end
end

function HybridMenuHandler:select_index(index)
	self:select_item(self._items[index])
end

function HybridMenuHandler:select_item(item)
	if item == self._selected_item then
		return
	end

	local selected_item = self._selected_item

	if selected_item then
		local _parent = selected_item._parent

		if selected_item.TYPE ~= nil then
			managers.menu:active_menu().logic:_select_item()
			self._node_gui:_align_marker()
		elseif _parent and not _parent._click_selection and _parent.select_item then
			_parent:select_item()
		end

		self._selected_item = nil
	end

	if item then
		local _parent = item._parent

		self._selected_item = item

		if item.TYPE ~= nil then
			managers.menu:active_menu().logic:_select_item(item:name())
		else
			managers.menu:active_menu().logic:_select_item()

			if _parent then
				if _parent._click_selection ~= false then
					_parent:hover_item(item, true)
				elseif _parent.select_item then
					_parent:select_item(item, true)
				end
			end
		end
	end
end

function HybridMenuHandler:mouse_moved(o, x, y)
	for _, item in pairs(self._items) do
		if item.TYPE ~= nil and self._node_gui:row_item(item).gui_panel:inside(x, y) then
			self:select_item(item)

			break
		end
	end
end

function HybridMenuHandler:move_up()
	self:move_selection(-1)
end

function HybridMenuHandler:move_down()
	self:move_selection(1)
end

function HybridMenuHandler:move_selection(move)
	if not self._selected_item then
		self:select_index(1)

		return
	end

	local index = table.index_of(self._items, self._selected_item)
	local new_index = (index - 1 + move) % #self._items + 1
	local next_item = self._items[new_index]

	if next_item.tree_visible and not next_item:tree_visible() or next_item.skip_selection and next_item:skip_selection() then
		self:move_selection(move + math.sign(move))
	else
		self:select_index(new_index)
	end
end

function HybridMenuHandler:add_item(item)
	table.insert(self._items, item)

	if item.TYPE ~= nil then
		local orig = item.highlight_row_item

		function item.highlight_row_item(itm, node, row_item, mouse_over, ...)
			local ret = orig(itm, node, row_item, mouse_over, ...)

			if mouse_over then
				self:select_item(item)
			end

			return ret
		end
	else
		if item.set_selected_changed_callback then
			local orig = item._on_selected_changed_callback

			item:set_selected_changed_callback(function(state)
				if orig then
					orig(item, state)
				end

				if state and table.contains(self._items, item) then
					self:select_item(item)
				end
			end)
		end

		if item.set_hover_changed_callback then
			local orig = item._on_hover_changed_callback

			item:set_hover_changed_callback(function(state)
				if orig then
					orig(item, state)
				end

				if state and table.contains(self._items, item) then
					self:select_item(item)
				end
			end)
		end
	end
end

function HybridMenuHandler:allow_input()
	return true
end
