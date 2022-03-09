HuskBossDamage = HuskBossDamage or class(HuskCopDamage)

function HuskBossDamage:seq_clbk_armorbreak()
	BossDamage.seq_clbk_armorbreak(self)
end
