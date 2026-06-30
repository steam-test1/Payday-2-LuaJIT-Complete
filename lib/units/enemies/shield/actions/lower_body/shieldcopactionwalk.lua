ShieldCopActionWalk = ShieldCopActionWalk or class(CopActionWalk)
ShieldCopActionWalk._walk_anim_velocities = {
	stand = {
		cbt = {
			walk = {
				bwd = 208,
				fwd = 242.75,
				l = 227.5,
				r = 208.75
			},
			run = {
				bwd = 281.88,
				fwd = 342.5,
				l = 364.29,
				r = 361.25
			},
			sprint = {
				bwd = 451,
				fwd = 548,
				l = 582.86,
				r = 578
			}
		}
	}
}
ShieldCopActionWalk._walk_anim_velocities.stand.ntl = ShieldCopActionWalk._walk_anim_velocities.stand.cbt
ShieldCopActionWalk._walk_anim_velocities.stand.hos = ShieldCopActionWalk._walk_anim_velocities.stand.cbt
ShieldCopActionWalk._walk_anim_velocities.stand.wnd = ShieldCopActionWalk._walk_anim_velocities.stand.cbt
ShieldCopActionWalk._walk_anim_velocities.crouch = ShieldCopActionWalk._walk_anim_velocities.stand
ShieldCopActionWalk._walk_anim_lengths = {
	stand = {
		cbt = {
			walk = {
				bwd = 24,
				fwd = 28,
				l = 26,
				r = 26
			},
			run = {
				bwd = 16,
				fwd = 18,
				l = 21,
				r = 21
			},
			sprint = {
				bwd = 16,
				fwd = 18,
				l = 21,
				r = 21
			},
			run_start = {
				bwd = 26,
				fwd = 31,
				l = 27,
				r = 29
			},
			run_start_turn = {
				bwd = 26,
				l = 37,
				r = 26
			},
			run_stop = {
				bwd = 29,
				fwd = 28,
				l = 34,
				r = 30
			}
		}
	}
}

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
ShieldCopActionWalk._fallback_pose = "crouch"
