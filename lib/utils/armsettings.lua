local enum = 0

local function set_enum()
	enum = enum + 1

	return enum
end

ArmSetting = {}
ArmSetting.SET_ARM_ANIMATOR_ENABLED = set_enum()
ArmSetting.SET_ARM_ANIMATOR_PRESENT = set_enum()
