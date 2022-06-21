HuskBossDamage = HuskBossDamage or class(HuskCopDamage)

function HuskBossDamage:seq_clbk_armorbreak()
	BossDamage.seq_clbk_armorbreak(self)
end

function HuskBossDamage:die(...)
	local contour_ext = self._unit:contour()

	if contour_ext then
		contour_ext:remove(contour_ext.init_contour or "highlight_character")
	end

	HuskBossDamage.super.die(self, ...)
end
