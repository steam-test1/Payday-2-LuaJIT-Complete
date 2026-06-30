AnimationTweakData = AnimationTweakData or class()

function AnimationTweakData:init()
	self.hold_types = {}
	self.hold_types.bullpup = {
		weight = 1000
	}
	self.hold_types.uzi = {
		weight = 1001
	}
	self.animation_redirects = {
		ben = "benelli",
		beretta92 = "b92fs",
		c45 = "colt_1911",
		g17 = "glock_17",
		m14 = "new_m14",
		m4 = "new_m4",
		mp5 = "new_mp5",
		raging_bull = "new_raging_bull"
	}
end
