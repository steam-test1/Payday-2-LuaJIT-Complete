CriminalActionWalk = CriminalActionWalk or class(CopActionWalk)
CriminalActionWalk.is_criminal = true
CriminalActionWalk._anim_block_presets = {
	block_all = {
		light_hurt = -1,
		shoot = -1,
		turn = -1,
		stand = -1,
		death = -1,
		dodge = -1,
		crouch = -1,
		walk = -1,
		act = -1,
		hurt = -1,
		heavy_hurt = -1,
		idle = -1,
		action = -1
	},
	block_lower = {
		light_hurt = -1,
		turn = -1,
		crouch = -1,
		stand = -1,
		death = -1,
		dodge = -1,
		heavy_hurt = -1,
		walk = -1,
		act = -1,
		hurt = -1,
		idle = -1
	},
	block_upper = {
		crouch = -1,
		shoot = -1,
		action = -1,
		stand = -1
	},
	block_none = {
		crouch = -1,
		stand = -1
	}
}
CriminalActionWalk._walk_anim_velocities = HuskPlayerMovement._walk_anim_velocities
CriminalActionWalk._walk_anim_lengths = HuskPlayerMovement._walk_anim_lengths
