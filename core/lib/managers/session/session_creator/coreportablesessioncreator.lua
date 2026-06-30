core:module("CorePortableSessionCreator")
core:import("CoreFakeSessionCreator")

if IS_PC then
	Creator = CoreFakeSessionCreator.Creator
elseif IS_XB1 then
	Creator = CoreFakeSessionCreator.Creator
elseif IS_PS4 then
	Creator = CoreFakeSessionCreator.Creator
end
