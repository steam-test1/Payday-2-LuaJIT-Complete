core:import("CoreMenuNode")
core:import("CoreSerialize")
core:import("CoreMenuItem")
core:import("CoreMenuItemToggle")

MenuNodeServerList = MenuNodeServerList or class(MenuNodeTable)

function MenuNodeServerList:init(data_node)
	MenuNodeServerList.super.init(self, data_node)
end

function MenuNodeServerList:update(t, dt)
	MenuNodeServerList.super.update(self, t, dt)
end

function MenuNodeServerList:_setup_columns()
	self:_add_column({
		align = "left",
		proportions = 1.9,
		text = string.upper("")
	})
	self:_add_column({
		align = "right",
		proportions = 1.7,
		text = string.upper("")
	})
	self:_add_column({
		align = "right",
		proportions = 1,
		text = string.upper("")
	})
	self:_add_column({
		align = "right",
		proportions = 0.225,
		text = string.upper("")
	})
end
