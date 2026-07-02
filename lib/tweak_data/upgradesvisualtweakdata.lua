UpgradesVisualTweakData = UpgradesVisualTweakData or class()

function UpgradesVisualTweakData:init()
	self.upgrade = {}
	self.upgrade.c45 = {
		base = true,
		fire_obj = "fire",
		objs = {
			g_extension = false,
			g_extension1 = false
		}
	}
	self.upgrade.c45_mag1 = nil
	self.upgrade.c45_mag2 = nil
	self.upgrade.c45_recoil1 = {
		fire_obj = "fire_2",
		objs = {
			g_extension = true,
			g_extension1 = false
		}
	}
	self.upgrade.c45_recoil2 = nil
	self.upgrade.c45_recoil3 = {
		fire_obj = "fire_2",
		objs = {
			g_extension = false,
			g_extension1 = true
		}
	}
	self.upgrade.c45_recoil4 = nil
	self.upgrade.c45_damage1 = nil
	self.upgrade.c45_damage2 = nil
	self.upgrade.c45_damage3 = nil
	self.upgrade.c45_damage4 = nil
	self.upgrade.beretta92 = {
		base = true,
		fire_obj = "fire",
		objs = {
			g_silencer = true,
			g_silencer_2 = false
		}
	}
	self.upgrade.beretta_mag1 = nil
	self.upgrade.beretta_mag2 = nil
	self.upgrade.beretta_recoil1 = nil
	self.upgrade.beretta_recoil2 = nil
	self.upgrade.beretta_recoil3 = {
		fire_obj = "fire_2",
		objs = {
			g_silencer = false,
			g_silencer_2 = true
		}
	}
	self.upgrade.beretta_recoil4 = nil
	self.upgrade.beretta_spread1 = nil
	self.upgrade.beretta_spread2 = nil
	self.upgrade.raging_bull = {
		base = true,
		fire_obj = "fire",
		objs = {
			g_6_bullets = true,
			g_6_bullets_dumdum = false,
			g_6_bullets_dumdum_not_empty = false,
			g_6_bullets_not_empty = true,
			g_muzzle_1 = true,
			g_muzzle_2 = false,
			g_shell_1 = true,
			g_shell_1_dumdum = false,
			g_shell_2 = true,
			g_shell_2_dumdum = false,
			g_shell_3 = true,
			g_shell_3_dumdum = false,
			g_shell_4 = true,
			g_shell_4_dumdum = false,
			g_shell_5 = true,
			g_shell_5_dumdum = false,
			g_shell_6 = true,
			g_shell_6_dumdum = false,
			g_sight = false,
			g_sight_short = true
		}
	}
	self.upgrade.raging_bull_spread1 = {
		fire_obj = "fire_2",
		objs = {
			g_muzzle_1 = false,
			g_muzzle_2 = true,
			g_sight = true,
			g_sight_short = false
		}
	}
	self.upgrade.raging_bull_spread2 = nil
	self.upgrade.raging_bull_spread3 = nil
	self.upgrade.raging_bull_spread4 = nil
	self.upgrade.raging_bull_reload_speed1 = nil
	self.upgrade.raging_bull_reload_speed2 = nil
	self.upgrade.raging_bull_damage1 = nil
	self.upgrade.raging_bull_damage2 = nil
	self.upgrade.raging_bull_damage3 = {
		objs = {
			g_6_bullets = false,
			g_6_bullets_dumdum = true,
			g_6_bullets_dumdum_not_empty = true,
			g_6_bullets_not_empty = false,
			g_shell_1 = false,
			g_shell_1_dumdum = true,
			g_shell_2 = false,
			g_shell_2_dumdum = true,
			g_shell_3 = false,
			g_shell_3_dumdum = true,
			g_shell_4 = false,
			g_shell_4_dumdum = true,
			g_shell_5 = false,
			g_shell_5_dumdum = true,
			g_shell_6 = false,
			g_shell_6_dumdum = true
		}
	}
	self.upgrade.raging_bull_damage4 = nil
	self.upgrade.m4 = {
		base = true,
		fire_obj = "fire",
		objs = {
			g_front_steelsight = true,
			g_front_steelsight_down = true,
			g_gfx_lens = false,
			g_handle_sight = true,
			g_nozzle_1 = true,
			g_nozzle_2 = false,
			g_reddot = false,
			g_sight = false,
			g_sight_il = true
		}
	}
	self.upgrade.m4_mag1 = nil
	self.upgrade.m4_mag2 = nil
	self.upgrade.m4_spread1 = nil
	self.upgrade.m4_spread2 = {
		fire_obj = "fire_nozzle_2",
		objs = {
			g_nozzle_1 = false,
			g_nozzle_2 = true
		}
	}
	self.upgrade.m4_spread3 = nil
	self.upgrade.m4_spread4 = {
		objs = {
			g_front_steelsight = false,
			g_front_steelsight_down = true,
			g_gfx_lens = true,
			g_handle_sight = false,
			g_reddot = true,
			g_sight = true,
			g_sight_il = false
		}
	}
	self.upgrade.m4_damage1 = nil
	self.upgrade.m4_damage2 = nil
	self.upgrade.m14 = {
		base = true,
		objs = {
			g_iron_sight_1 = true,
			g_iron_sight_2 = false,
			g_reddot = false,
			g_sight = false,
			g_sight_lens = false
		}
	}
	self.upgrade.m14_mag1 = nil
	self.upgrade.m14_mag2 = nil
	self.upgrade.m14_spread1 = {
		objs = {
			g_iron_sight_1 = true,
			g_iron_sight_2 = false,
			g_reddot = false,
			g_sight = true,
			g_sight_lens = true
		}
	}
	self.upgrade.m14_spread2 = {
		objs = {
			g_iron_sight_1 = false,
			g_iron_sight_2 = true,
			g_reddot = true,
			g_sight = true,
			g_sight_lens = true
		}
	}
	self.upgrade.m14_damage1 = nil
	self.upgrade.m14_damage2 = nil
	self.upgrade.m14_recoil1 = nil
	self.upgrade.m14_recoil2 = nil
	self.upgrade.m14_recoil3 = nil
	self.upgrade.m14_recoil4 = nil
	self.upgrade.mp5 = {
		base = true,
		objs = {
			g_double = false,
			g_mag = true,
			g_mag_straight = false,
			g_standard_grip = true,
			g_standard_grip_not = false
		}
	}
	self.upgrade.mp5_spread1 = nil
	self.upgrade.mp5_spread2 = {
		objs = {
			g_standard_grip = false,
			g_standard_grip_not = true
		}
	}
	self.upgrade.mp5_recoil1 = nil
	self.upgrade.mp5_recoil2 = nil
	self.upgrade.mp5_reload_speed1 = {
		objs = {
			g_double = false,
			g_mag = false,
			g_mag_straight = true
		}
	}
	self.upgrade.mp5_reload_speed2 = nil
	self.upgrade.mp5_reload_speed3 = {
		objs = {
			g_double = true,
			g_mag = false,
			g_mag_straight = false
		}
	}
	self.upgrade.mp5_reload_speed4 = nil
	self.upgrade.mp5_enter_steelsight_speed1 = nil
	self.upgrade.mp5_enter_steelsight_speed2 = nil
	self.upgrade.mac11 = {
		base = true,
		objs = {
			g_mag = true,
			g_mag_extended = false,
			g_silencer_big = true,
			g_silencer_bigger = false
		}
	}
	self.upgrade.mac11_recoil1 = nil
	self.upgrade.mac11_recoil2 = nil
	self.upgrade.mac11_recoil3 = nil
	self.upgrade.mac11_recoil4 = {
		objs = {
			g_silencer_big = false,
			g_silencer_bigger = true
		}
	}
	self.upgrade.mac11_enter_steelsight_speed1 = nil
	self.upgrade.mac11_enter_steelsight_speed2 = nil
	self.upgrade.mac11_mag1 = {
		objs = {
			g_mag = false,
			g_mag_extended = true
		}
	}
	self.upgrade.mac11_mag2 = nil
	self.upgrade.mac11_mag3 = nil
	self.upgrade.mac11_mag4 = nil
	self.upgrade.r870_shotgun = {
		base = true,
		objs = {
			g_extender = false,
			g_kylflans = false,
			g_rail = true
		}
	}
	self.upgrade.remington_mag1 = {
		objs = {
			g_extender = true
		}
	}
	self.upgrade.remington_mag2 = nil
	self.upgrade.remington_recoil1 = nil
	self.upgrade.remington_recoil2 = nil
	self.upgrade.remington_recoil3 = nil
	self.upgrade.remington_recoil4 = {
		objs = {
			g_kylflans = true,
			g_rail = false
		}
	}
	self.upgrade.remington_damage1 = nil
	self.upgrade.remington_damage2 = nil
	self.upgrade.remington_damage3 = nil
	self.upgrade.remington_damage4 = nil
	self.upgrade.mossberg = {
		base = true,
		objs = {
			g_pump_1 = true,
			g_pump_2 = false,
			g_reload_pipe = true,
			g_reload_pipe_2 = false,
			g_shell_extension = false
		}
	}
	self.upgrade.mossberg_mag1 = nil
	self.upgrade.mossberg_mag2 = {
		objs = {
			g_shell_extension = true
		}
	}
	self.upgrade.mossberg_reload_speed1 = nil
	self.upgrade.mossberg_reload_speed2 = nil
	self.upgrade.mossberg_fire_rate_multiplier1 = nil
	self.upgrade.mossberg_fire_rate_multiplier2 = {
		objs = {
			g_reload_pipe = false,
			g_reload_pipe_2 = true
		}
	}
	self.upgrade.mossberg_fire_rate_multiplier3 = nil
	self.upgrade.mossberg_fire_rate_multiplier4 = {
		objs = {
			g_pump_1 = false,
			g_pump_2 = true
		}
	}
	self.upgrade.mossberg_recoil_multiplier1 = nil
	self.upgrade.mossberg_recoil_multiplier2 = nil
	self.upgrade.hk21 = {
		base = true,
		objs = {
			g_l_bipod = false,
			g_lens = false,
			g_mag = false,
			g_mag_plast = false,
			g_mag_rund = true,
			g_r_bipod = false,
			g_reddot = false,
			g_sight = false,
			g_sight_iron = true
		}
	}
	self.upgrade.hk21_mag1 = nil
	self.upgrade.hk21_mag2 = nil
	self.upgrade.hk21_mag3 = nil
	self.upgrade.hk21_mag4 = {
		objs = {
			g_mag = true,
			g_mag_plast = true,
			g_mag_rund = false
		}
	}
	self.upgrade.hk21_recoil1 = {
		objs = {
			g_l_bipod = true,
			g_r_bipod = true
		}
	}
	self.upgrade.hk21_recoil2 = {
		objs = {
			g_lens = true,
			g_reddot = true,
			g_sight = true,
			g_sight_iron = false
		}
	}
	self.upgrade.hk21_damage1 = nil
	self.upgrade.hk21_damage2 = nil
	self.upgrade.hk21_damage3 = nil
	self.upgrade.hk21_damage4 = nil
	self.upgrade.ak47 = {
		base = true,
		objs = {
			g_dot = false,
			g_dot_sight = false,
			g_il_steelsight = true,
			g_lens = false,
			g_plastic = false,
			g_steelsight = true,
			g_wood = true
		}
	}
	self.upgrade.ak47_damage1 = nil
	self.upgrade.ak47_damage2 = nil
	self.upgrade.ak47_damage3 = nil
	self.upgrade.ak47_damage4 = nil
	self.upgrade.ak47_mag1 = nil
	self.upgrade.ak47_mag2 = nil
	self.upgrade.ak47_recoil1 = nil
	self.upgrade.ak47_recoil2 = nil
	self.upgrade.ak47_recoil3 = {
		objs = {
			g_plastic = true,
			g_wood = false
		}
	}
	self.upgrade.ak47_recoil4 = nil
	self.upgrade.ak47_spread1 = {
		objs = {
			g_dot = true,
			g_dot_sight = true,
			g_il_steelsight = false,
			g_lens = true,
			g_steelsight = false
		}
	}
	self.upgrade.ak47_spread2 = nil
	self.upgrade.glock = {
		base = true,
		objs = {
			g_mag = true,
			g_mag_long = false
		}
	}
	self.upgrade.glock_damage1 = nil
	self.upgrade.glock_damage2 = nil
	self.upgrade.glock_mag1 = {
		objs = {
			g_mag = false,
			g_mag_long = true
		}
	}
	self.upgrade.glock_mag2 = nil
	self.upgrade.glock_mag3 = nil
	self.upgrade.glock_mag4 = nil
	self.upgrade.glock_recoil1 = nil
	self.upgrade.glock_recoil2 = nil
	self.upgrade.glock_reload_speed1 = nil
	self.upgrade.glock_reload_speed2 = nil
	self.upgrade.m79 = {
		base = true,
		objs = {
			g_grenade = true,
			g_grenade_high_explosive = false,
			g_sight = false
		}
	}
	self.upgrade.m79_clip_num1 = nil
	self.upgrade.m79_clip_num2 = nil
	self.upgrade.m79_damage1 = nil
	self.upgrade.m79_damage2 = nil
	self.upgrade.m79_damage3 = nil
	self.upgrade.m79_damage4 = {
		objs = {
			g_grenade = false,
			g_grenade_high_explosive = true
		}
	}
	self.upgrade.m79_expl_range1 = nil
	self.upgrade.m79_expl_range2 = {
		objs = {
			g_sight = true
		}
	}
end
