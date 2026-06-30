core:module("CorePortableLocalUserStorage")
core:import("CoreFakeLocalUserStorage")

if IS_PC then
	Storage = CoreFakeLocalUserStorage.Storage
elseif IS_XB1 then
	Storage = CoreFakeLocalUserStorage.Storage
elseif IS_PS4 then
	Storage = CoreFakeLocalUserStorage.Storage
end
