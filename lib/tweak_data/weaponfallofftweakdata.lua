WeaponFalloffTemplate = WeaponFalloffTemplate or class()

function WeaponFalloffTemplate.setup_weapon_falloff_templates()
	local weapon_falloff_templates = {
		ASSAULT_FALL_LOW = {
			far_falloff = 1000,
			far_multiplier = 1,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 3000,
			near_falloff = 0
		},
		ASSAULT_FALL_MEDIUM = {
			far_falloff = 1000,
			far_multiplier = 1,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 3200,
			near_falloff = 0
		},
		ASSAULT_FALL_HIGH = {
			far_falloff = 1000,
			far_multiplier = 1,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 4000,
			near_falloff = 0
		},
		SHOTGUN_FALL_PRIMARY_LOW = {
			far_falloff = 400,
			far_multiplier = 0.5,
			near_multiplier = 1,
			optimal_distance = 200,
			optimal_range = 600,
			near_falloff = 0
		},
		SHOTGUN_FALL_PRIMARY_MEDIUM = {
			far_falloff = 300,
			far_multiplier = 0.6,
			near_multiplier = 1,
			optimal_distance = 700,
			optimal_range = 500,
			near_falloff = 0
		},
		SHOTGUN_FALL_PRIMARY_HIGH = {
			far_falloff = 300,
			far_multiplier = 0.6,
			near_multiplier = 1,
			optimal_distance = 700,
			optimal_range = 500,
			near_falloff = 0
		},
		SNIPER_FALL_LOW = {
			far_falloff = 500,
			far_multiplier = 1.1,
			near_multiplier = 1,
			optimal_distance = 400,
			optimal_range = 1600,
			near_falloff = 0
		},
		SNIPER_FALL_MEDIUM = {
			far_falloff = 500,
			far_multiplier = 1.5,
			near_multiplier = 1,
			optimal_distance = 400,
			optimal_range = 1500,
			near_falloff = 200
		},
		SNIPER_FALL_HIGH = {
			far_falloff = 1000,
			far_multiplier = 1.8,
			near_multiplier = 1,
			optimal_distance = 500,
			optimal_range = 1500,
			near_falloff = 0
		},
		SNIPER_FALL_VERYHIGH = {
			far_falloff = 500,
			far_multiplier = 1.3,
			near_multiplier = 1,
			optimal_distance = 600,
			optimal_range = 2000,
			near_falloff = 0
		},
		LMG_FALL_MEDIUM = {
			far_falloff = 300,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 1700,
			near_falloff = 0
		},
		LMG_FALL_HIGH = {
			far_falloff = 700,
			far_multiplier = 0.8,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 1800,
			near_falloff = 0
		},
		AKI_PISTOL_FALL_AUTO = {
			far_falloff = 300,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 300,
			optimal_range = 1000,
			near_falloff = 0
		},
		AKI_PISTOL_FALL_LOW = {
			far_falloff = 300,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 300,
			optimal_range = 1000,
			near_falloff = 0
		},
		AKI_PISTOL_FALL_MEDIUM = {
			far_falloff = 400,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 300,
			optimal_range = 1000,
			near_falloff = 0
		},
		AKI_PISTOL_FALL_HIGH = {
			far_falloff = 500,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 300,
			optimal_range = 1000,
			near_falloff = 0
		},
		AKI_PISTOL_FALL_VERYHIGH = {
			far_falloff = 600,
			far_multiplier = 0.8,
			near_multiplier = 1,
			optimal_distance = 300,
			optimal_range = 1000,
			near_falloff = 0
		},
		AKI_SMG_FALL_LOW = {
			far_falloff = 300,
			far_multiplier = 0.5,
			near_multiplier = 1.3,
			optimal_distance = 500,
			optimal_range = 900,
			near_falloff = 0
		},
		AKI_SMG_FALL_MEDIUM = {
			far_falloff = 400,
			far_multiplier = 0.6,
			near_multiplier = 1.3,
			optimal_distance = 400,
			optimal_range = 1200,
			near_falloff = 100
		},
		AKI_SMG_FALL_HIGH = {
			far_falloff = 500,
			far_multiplier = 0.7,
			near_multiplier = 1.2,
			optimal_distance = 300,
			optimal_range = 1700,
			near_falloff = 0
		},
		AKI_SHOTGUN_FALL_LOW = {
			far_falloff = 200,
			far_multiplier = 0.5,
			near_multiplier = 1,
			optimal_distance = 500,
			optimal_range = 500,
			near_falloff = 0
		},
		AKI_SHOTGUN_FALL_MEDIUM = {
			far_falloff = 600,
			far_multiplier = 0.6,
			near_multiplier = 1,
			optimal_distance = 500,
			optimal_range = 500,
			near_falloff = 0
		},
		AKI_SHOTGUN_FALL_HIGH = {
			far_falloff = 500,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 500,
			optimal_range = 600,
			near_falloff = 0
		},
		PISTOL_FALL_AUTO = {
			far_falloff = 300,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 300,
			optimal_range = 1000,
			near_falloff = 0
		},
		PISTOL_FALL_LOW = {
			far_falloff = 100,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 500,
			optimal_range = 700,
			near_falloff = 0
		},
		PISTOL_FALL_MEDIUM = {
			far_falloff = 100,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 700,
			optimal_range = 1000,
			near_falloff = 200
		},
		PISTOL_FALL_HIGH = {
			far_falloff = 100,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 1000,
			optimal_range = 1000,
			near_falloff = 500
		},
		PISTOL_FALL_VERYHIGH = {
			far_falloff = 100,
			far_multiplier = 0.8,
			near_multiplier = 1,
			optimal_distance = 1000,
			optimal_range = 1000,
			near_falloff = 500
		},
		PISTOL_FALL_SUPER = {
			far_falloff = 1000,
			far_multiplier = 1,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 3000,
			near_falloff = 0
		},
		SMG_FALL_LOW = {
			far_falloff = 500,
			far_multiplier = 0.5,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 1200,
			near_falloff = 0
		},
		SMG_FALL_MEDIUM = {
			far_falloff = 500,
			far_multiplier = 0.6,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 1500,
			near_falloff = 0
		},
		SMG_FALL_HIGH = {
			far_falloff = 500,
			far_multiplier = 0.7,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 2000,
			near_falloff = 0
		},
		SHOTGUN_FALL_SECONDARY_LOW = {
			far_falloff = 400,
			far_multiplier = 0.5,
			near_multiplier = 1,
			optimal_distance = 500,
			optimal_range = 400,
			near_falloff = 0
		},
		SHOTGUN_FALL_SECONDARY_MEDIUM = {
			far_falloff = 400,
			far_multiplier = 0.5,
			near_multiplier = 1,
			optimal_distance = 500,
			optimal_range = 500,
			near_falloff = 0
		},
		SHOTGUN_FALL_SECONDARY_HIGH = {
			far_falloff = 0,
			far_multiplier = 0.6,
			near_multiplier = 1,
			optimal_distance = 500,
			optimal_range = 500,
			near_falloff = 400
		},
		SHOTGUN_FALL_SECONDARY_VERYHIGH = {
			far_falloff = 200,
			far_multiplier = 0.5,
			near_multiplier = 1,
			optimal_distance = 400,
			optimal_range = 600,
			near_falloff = 0
		},
		SPECIAL_LOW = {
			far_falloff = 300,
			far_multiplier = 0.6,
			near_multiplier = 1,
			optimal_distance = 0,
			optimal_range = 1500,
			near_falloff = 0
		}
	}

	return weapon_falloff_templates
end
