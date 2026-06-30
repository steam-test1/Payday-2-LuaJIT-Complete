PunchingBagDamage = PunchingBagDamage or class()

function PunchingBagDamage:init(unit)
	unit:set_extension_update_enabled(Idstring("damage"), false)
end

function PunchingBagDamage:damage_melee(unit)
	return
end

function PunchingBagDamage:damage_bullet(unit)
	return
end

function PunchingBagDamage:damage_fire(unit)
	return
end

function PunchingBagDamage:damage_dot(unit)
	return
end

function PunchingBagDamage:damage_explosion(unit)
	return
end

function PunchingBagDamage:damage_tase(unit)
	return
end

function PunchingBagDamage:damage_mission(unit)
	return
end

function PunchingBagDamage:dead()
	return false
end
