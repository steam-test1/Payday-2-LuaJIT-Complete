IngameUIExt = IngameUIExt or class()

function IngameUIExt:init(unit)
	unit:set_extension_update_enabled(Idstring("ingame_ui"), false)
end

function IngameUIExt:set_active(unit)
	return
end

AIAttentionObject = AIAttentionObject or class()

function AIAttentionObject:init(unit)
	unit:set_extension_update_enabled(Idstring("attention"), false)
end

function AIAttentionObject:set_active()
	return
end

UseInteractionExt = UseInteractionExt or class()

function UseInteractionExt:init(unit)
	unit:set_extension_update_enabled(Idstring("interaction"), false)
end

function UseInteractionExt:set_active()
	return
end

SecurityCamera = SecurityCamera or class()

function SecurityCamera:init(unit)
	unit:set_extension_update_enabled(Idstring("base"), false)
end

SecurityCameraInteractionExt = SecurityCameraInteractionExt or class()

function SecurityCameraInteractionExt:init(unit)
	unit:set_extension_update_enabled(Idstring("interaction"), false)
end

function SecurityCameraInteractionExt:set_active()
	return
end

ContourExt = ContourExt or class()

function ContourExt:init(unit)
	unit:set_extension_update_enabled(Idstring("contour"), false)
end

function ContourExt:set_active()
	return
end

function ContourExt:update_materials()
	return
end

SyncUnitData = SyncUnitData or class()

function SyncUnitData:init(unit)
	unit:set_extension_update_enabled(Idstring("sync_unit_data"), false)
end

function SyncUnitData:set_active()
	return
end

AccessWeaponMenuInteractionExt = AccessWeaponMenuInteractionExt or class()

function AccessWeaponMenuInteractionExt:init(unit)
	unit:set_extension_update_enabled(Idstring("interaction"), false)
end

function AccessWeaponMenuInteractionExt:set_active()
	return
end

NetworkBaseExtension = NetworkBaseExtension or class()

function NetworkBaseExtension:init(unit)
	unit:set_extension_update_enabled(Idstring("network"), false)
end

function NetworkBaseExtension:set_active()
	return
end

DrivingInteractionExt = DrivingInteractionExt or class()

function DrivingInteractionExt:init(unit)
	unit:set_extension_update_enabled(Idstring("interaction"), false)
end

function DrivingInteractionExt:set_active()
	return
end

VehicleDamage = VehicleDamage or class()

function VehicleDamage:init(unit)
	unit:set_extension_update_enabled(Idstring("damage"), false)
end

function VehicleDamage:set_active()
	return
end

CarryData = CarryData or class()

function CarryData:init(unit)
	unit:set_extension_update_enabled(Idstring("carry_data"), false)
end

function CarryData:set_active()
	return
end

VehicleDrivingExt = VehicleDrivingExt or class()

function VehicleDrivingExt:init(unit)
	unit:set_extension_update_enabled(Idstring("vehicle_driving"), false)
end

VehicleCamera = VehicleCamera or class()

function VehicleCamera:init(unit)
	unit:set_extension_update_enabled(Idstring("camera"), false)
end
