WeaponFalloffTemplate = WeaponFalloffTemplate or class()

function WeaponFalloffTemplate.setup_weapon_falloff_templates()
	local weapon_falloff_templates = {
		SHOTGUN_FALL_PRIMARY_LOW = {
			far_falloff = 1800,
			far_multiplier = 0.5,
			near_multiplier = 1,
			optimal_distance = 600,
			optimal_range = 600,
			near_falloff = 300
		},
		SHOTGUN_FALL_PRIMARY_MEDIUM = {
			far_falloff = 2100,
			far_multiplier = 0.5,
			near_multiplier = 1,
			optimal_distance = 700,
			optimal_range = 700,
			near_falloff = 350
		},
		SHOTGUN_FALL_PRIMARY_HIGH = {
			far_falloff = 2400,
			far_multiplier = 0.5,
			near_multiplier = 1,
			optimal_distance = 800,
			optimal_range = 800,
			near_falloff = 400
		},
		SNIPER_FALL_LOW = {
			far_falloff = 1000,
			far_multiplier = 1.1,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 1500,
			near_falloff = 0
		},
		SNIPER_FALL_MEDIUM = {
			far_falloff = 1000,
			far_multiplier = 1.2,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 2000,
			near_falloff = 0
		},
		SNIPER_FALL_HIGH = {
			far_falloff = 1000,
			far_multiplier = 1.2,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 2500,
			near_falloff = 0
		},
		SNIPER_FALL_VERYHIGH = {
			far_falloff = 500,
			far_multiplier = 1.2,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 2500,
			near_falloff = 0
		},
		LMG_FALL_MEDIUM = {
			far_falloff = 1700,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 1700,
			near_falloff = 0
		},
		LMG_FALL_HIGH = {
			far_falloff = 1800,
			far_multiplier = 0.8,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 1800,
			near_falloff = 0
		},
		AKI_PISTOL_FALL_AUTO = {
			far_falloff = 1500,
			far_multiplier = 0.75,
			near_multiplier = 1.1,
			optimal_distance = 500,
			optimal_range = 500,
			near_falloff = 250
		},
		AKI_PISTOL_FALL_LOW = {
			far_falloff = 1800,
			far_multiplier = 0.75,
			near_multiplier = 1.1,
			optimal_distance = 600,
			optimal_range = 600,
			near_falloff = 300
		},
		AKI_PISTOL_FALL_MEDIUM = {
			far_falloff = 2100,
			far_multiplier = 0.75,
			near_multiplier = 1.1,
			optimal_distance = 700,
			optimal_range = 700,
			near_falloff = 350
		},
		AKI_PISTOL_FALL_HIGH = {
			far_falloff = 2400,
			far_multiplier = 0.75,
			near_multiplier = 1.1,
			optimal_distance = 800,
			optimal_range = 800,
			near_falloff = 400
		},
		AKI_PISTOL_FALL_VERYHIGH = {
			far_falloff = 2550,
			far_multiplier = 0.75,
			near_multiplier = 1.1,
			optimal_distance = 850,
			optimal_range = 850,
			near_falloff = 425
		},
		AKI_SMG_FALL_LOW = {
			far_falloff = 2100,
			far_multiplier = 0.75,
			near_multiplier = 1.05,
			optimal_distance = 700,
			optimal_range = 700,
			near_falloff = 350
		},
		AKI_SMG_FALL_MEDIUM = {
			far_falloff = 2400,
			far_multiplier = 0.75,
			near_multiplier = 1.05,
			optimal_distance = 800,
			optimal_range = 800,
			near_falloff = 400
		},
		AKI_SMG_FALL_HIGH = {
			far_falloff = 2550,
			far_multiplier = 0.75,
			near_multiplier = 1.05,
			optimal_distance = 850,
			optimal_range = 850,
			near_falloff = 425
		}
	}
	weapon_falloff_templates.AKI_SHOTGUN_FALL_LOW = deep_clone(weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_LOW)
	weapon_falloff_templates.AKI_SHOTGUN_FALL_MEDIUM = deep_clone(weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_MEDIUM)
	weapon_falloff_templates.AKI_SHOTGUN_FALL_HIGH = deep_clone(weapon_falloff_templates.SHOTGUN_FALL_PRIMARY_HIGH)
	weapon_falloff_templates.PISTOL_FALL_AUTO = {
		far_falloff = 1500,
		far_multiplier = 0.75,
		near_multiplier = 1.1,
		optimal_distance = 500,
		optimal_range = 500,
		near_falloff = 250
	}
	weapon_falloff_templates.PISTOL_FALL_LOW = {
		far_falloff = 1800,
		far_multiplier = 0.75,
		near_multiplier = 1.1,
		optimal_distance = 600,
		optimal_range = 600,
		near_falloff = 300
	}
	weapon_falloff_templates.PISTOL_FALL_MEDIUM = {
		far_falloff = 2100,
		far_multiplier = 0.75,
		near_multiplier = 1.1,
		optimal_distance = 700,
		optimal_range = 700,
		near_falloff = 350
	}
	weapon_falloff_templates.PISTOL_FALL_HIGH = {
		far_falloff = 2400,
		far_multiplier = 0.75,
		near_multiplier = 1.1,
		optimal_distance = 800,
		optimal_range = 800,
		near_falloff = 400
	}
	weapon_falloff_templates.PISTOL_FALL_VERYHIGH = {
		far_falloff = 2550,
		far_multiplier = 0.75,
		near_multiplier = 1.1,
		optimal_distance = 850,
		optimal_range = 850,
		near_falloff = 425
	}
	weapon_falloff_templates.SMG_FALL_LOW = deep_clone(weapon_falloff_templates.AKI_SMG_FALL_LOW)
	weapon_falloff_templates.SMG_FALL_MEDIUM = deep_clone(weapon_falloff_templates.AKI_SMG_FALL_MEDIUM)
	weapon_falloff_templates.SMG_FALL_HIGH = deep_clone(weapon_falloff_templates.AKI_SMG_FALL_HIGH)
	weapon_falloff_templates.SHOTGUN_FALL_SECONDARY_LOW = {
		far_falloff = 300,
		far_multiplier = 0.6,
		near_multiplier = 1,
		optimal_distance = 600,
		optimal_range = 500,
		near_falloff = 0
	}
	weapon_falloff_templates.SHOTGUN_FALL_SECONDARY_MEDIUM = {
		far_falloff = 300,
		far_multiplier = 0.6,
		near_multiplier = 1,
		optimal_distance = 700,
		optimal_range = 500,
		near_falloff = 0
	}
	weapon_falloff_templates.SHOTGUN_FALL_SECONDARY_HIGH = {
		far_falloff = 300,
		far_multiplier = 0.6,
		near_multiplier = 1,
		optimal_distance = 700,
		optimal_range = 500,
		near_falloff = 0
	}
	weapon_falloff_templates.SHOTGUN_FALL_SECONDARY_VERYHIGH = {
		far_falloff = 400,
		far_multiplier = 0.7,
		near_multiplier = 1,
		optimal_distance = 800,
		optimal_range = 600,
		near_falloff = 0
	}
	weapon_falloff_templates.SPECIAL_LOW = {
		far_falloff = 300,
		far_multiplier = 0.6,
		near_multiplier = 1,
		optimal_distance = 0,
		optimal_range = 1500,
		near_falloff = 0
	}

	return weapon_falloff_templates
end
