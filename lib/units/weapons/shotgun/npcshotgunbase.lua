NPCShotgunBase = NPCShotgunBase or class(NPCRaycastWeaponBase)

function NPCShotgunBase:init(...)
	NPCShotgunBase.super.init(self, ...)

	self._do_shotgun_push = true
end
