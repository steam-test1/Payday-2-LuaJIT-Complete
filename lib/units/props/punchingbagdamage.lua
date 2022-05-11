PunchingBagDamage = PunchingBagDamage or class()

function PunchingBagDamage:init(unit)
	unit:set_extension_update_enabled(Idstring("damage"), false)
end

function PunchingBagDamage:damage_melee(unit)
end

function PunchingBagDamage:damage_bullet(unit)
end

function PunchingBagDamage:damage_fire(unit)
end

function PunchingBagDamage:damage_dot(unit)
end

function PunchingBagDamage:damage_explosion(unit)
end

function PunchingBagDamage:damage_tase(unit)
end

function PunchingBagDamage:damage_mission(unit)
end

function PunchingBagDamage:dead()
	return false
end
