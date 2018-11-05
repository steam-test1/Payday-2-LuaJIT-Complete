ShieldCopActionWalk = ShieldCopActionWalk or class(CopActionWalk)
ShieldCopActionWalk._walk_anim_velocities = {stand = {cbt = {
	walk = {
		bwd = 187.5,
		l = 186.589,
		fwd = 194.2,
		r = 191.379
	},
	run = {
		bwd = 333.33,
		l = 333.33,
		fwd = 348.3,
		r = 340.62
	},
	sprint = {
		bwd = 434.1,
		l = 368.116,
		fwd = 546,
		r = 470.636
	}
}}}
ShieldCopActionWalk._walk_anim_velocities.stand.ntl = ShieldCopActionWalk._walk_anim_velocities.stand.cbt
ShieldCopActionWalk._walk_anim_velocities.stand.hos = ShieldCopActionWalk._walk_anim_velocities.stand.cbt
ShieldCopActionWalk._walk_anim_velocities.stand.wnd = ShieldCopActionWalk._walk_anim_velocities.stand.cbt
ShieldCopActionWalk._walk_anim_velocities.crouch = ShieldCopActionWalk._walk_anim_velocities.stand
ShieldCopActionWalk._walk_anim_lengths = {stand = {cbt = {
	walk = {
		bwd = 27,
		l = 29,
		fwd = 29,
		r = 29
	},
	run = {
		bwd = 18,
		l = 18,
		fwd = 22,
		r = 20
	},
	sprint = {
		bwd = 15,
		l = 18,
		fwd = 18,
		r = 19
	},
	run_start = {
		bwd = 26,
		l = 27,
		fwd = 31,
		r = 29
	},
	run_start_turn = {
		bwd = 26,
		l = 37,
		r = 26
	},
	run_stop = {
		bwd = 29,
		l = 34,
		fwd = 28,
		r = 30
	}
}}}

for pose, stances in pairs(ShieldCopActionWalk._walk_anim_lengths) do
	for stance, speeds in pairs(stances) do
		for speed, sides in pairs(speeds) do
			for side, speed in pairs(sides) do
				sides[side] = speed * 0.03333
			end
		end
	end
end

ShieldCopActionWalk._walk_anim_lengths.stand.ntl = ShieldCopActionWalk._walk_anim_lengths.stand.cbt
ShieldCopActionWalk._walk_anim_lengths.stand.hos = ShieldCopActionWalk._walk_anim_lengths.stand.cbt
ShieldCopActionWalk._walk_anim_lengths.stand.wnd = ShieldCopActionWalk._walk_anim_lengths.stand.cbt
ShieldCopActionWalk._walk_anim_lengths.crouch = ShieldCopActionWalk._walk_anim_lengths.stand

