BossDamage = BossDamage or class(CopDamage)

function BossDamage:seq_clbk_armorbreak()
	if not self._unit:character_damage():dead() then
		self._unit:sound():say(self._unit:sound().armorbreak_str or "armorbreak")
	end
end

function BossDamage:die(...)
	local contour_ext = self._unit:contour()

	if contour_ext and contour_ext.clear_all then
		contour_ext:clear_all()
	end

	BossDamage.super.die(self, ...)
end
