HuskMedicDamage = HuskMedicDamage or class(HuskCopDamage)
HuskMedicDamage._init_medic = MedicDamage._init_medic
HuskMedicDamage._register_healing = MedicDamage._register_healing
HuskMedicDamage._unregister_healing = MedicDamage._unregister_healing
HuskMedicDamage.get_healing_radius = MedicDamage.get_healing_radius
HuskMedicDamage.get_healing_radius_sq = MedicDamage.get_healing_radius_sq
HuskMedicDamage.verify_heal_requesting_unit = MedicDamage.verify_heal_requesting_unit
HuskMedicDamage.is_available_for_healing = MedicDamage.is_available_for_healing
HuskMedicDamage.heal_unit = MedicDamage.heal_unit
HuskMedicDamage.heal_unit_external = MedicDamage.heal_unit_external
HuskMedicDamage.sync_heal_action = MedicDamage.sync_heal_action
HuskMedicDamage.check_medic_heal = MedicDamage.check_medic_heal
HuskMedicDamage.do_medic_heal_and_action = MedicDamage.do_medic_heal_and_action

function HuskMedicDamage:init(...)
	HuskMedicDamage.super.init(self, ...)
	self:_init_medic()
end

function HuskMedicDamage:die(...)
	HuskMedicDamage.super.die(self, ...)
	self:_unregister_healing()
end

function HuskMedicDamage:destroy(...)
	HuskMedicDamage.super.destroy(self, ...)
	self:_unregister_healing()
end
