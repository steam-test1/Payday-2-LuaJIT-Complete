HuskBossDamage = HuskBossDamage or class(HuskCopDamage)

function HuskBossDamage:seq_clbk_armorbreak()
	BossDamage.seq_clbk_armorbreak(self)
end

function HuskBossDamage:die(...)
	local contour_ext = self._unit:contour()

	if contour_ext and contour_ext.clear_all then
		contour_ext:clear_all()
	end

	HuskBossDamage.super.die(self, ...)
end
