VehicleTweakData = VehicleTweakData or class()

function VehicleTweakData:init(tweak_data)
	self:_init_data_falcogini()
	self:_init_data_muscle()
	self:_init_data_forklift()
	self:_init_data_forklift_2()
	self:_init_data_box_truck_1()
	self:_init_data_mower_1()
	self:_init_data_boat_rib_1()
	self:_init_data_blackhawk_1()
	self:_init_data_bike_1()
	self:_init_data_bike_2()
	self:_init_data_wanker()
	self:_init_data_golfcart()
end

function VehicleTweakData:_init_data_falcogini()
	self.falcogini = {}
	self.falcogini.name_id = "vhl_falcogini_name"
	self.falcogini.hud_label_offset = 140
	self.falcogini.animations = {
		driver = "drive_falcogini_driver",
		passenger_front = "drive_falcogini_passanger",
		vehicle_id = "falcogini"
	}
	self.falcogini.sound = {
		broken_engine = "falcogini_engine_broken_loop",
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 5,
		door_close = "car_door_open",
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "falcogini",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_start = "falcogini_engine_start",
		fix_engine_loop = "falcogini_engine_fix_loop",
		fix_engine_stop = "falcogini_engine_fix_stop",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 0.25,
		longitudal_slip_treshold = 0.8,
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01"
	}
	self.falcogini.seats = {
		driver = {
			driving = true,
			name = "driver"
		},
		passenger_front = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = true,
			name = "passenger_front",
			shooting_pos = Vector3(50, -20, 50)
		}
	}
	self.falcogini.loot_points = {
		loot = {
			name = "loot"
		}
	}
	self.falcogini.damage = {
		max_health = 100000
	}
	self.falcogini.max_speed = 200
	self.falcogini.max_rpm = 9000
	self.falcogini.loot_drop_point = "v_repair_engine"
	self.falcogini.max_loot_bags = 2
	self.falcogini.interact_distance = 350
	self.falcogini.driver_camera_offset = Vector3(0, 0, 2.5)
	self.falcogini.fov = 75
end

function VehicleTweakData:_init_data_muscle()
	self.muscle = {}
	self.muscle.name_id = "vhl_longfellow_name"
	self.muscle.hud_label_offset = 150
	self.muscle.animations = {
		driver = "drive_muscle_driver",
		passenger_back_left = "drive_muscle_back_left",
		passenger_back_right = "drive_muscle_back_right",
		passenger_front = "drive_muscle_passanger",
		vehicle_id = "muscle"
	}
	self.muscle.sound = {
		broken_engine = "falcogini_engine_broken_loop",
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 8,
		door_close = "car_door_open",
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "muscle",
		engine_speed_rtpc = "car_falcogini_speed",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 0.35,
		longitudal_slip_treshold = 0.8,
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01"
	}
	self.muscle.seats = {
		driver = {
			driving = true,
			name = "driver"
		},
		passenger_front = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = true,
			name = "passenger_front",
			shooting_pos = Vector3(50, -20, 50)
		},
		passenger_back_left = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = true,
			name = "passenger_back_left"
		},
		passenger_back_right = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = true,
			name = "passenger_back_right"
		}
	}
	self.muscle.loot_points = {
		loot_left = {
			name = "loot_left"
		},
		loot_right = {
			name = "loot_right"
		},
		loot = {
			name = "loot"
		}
	}
	self.muscle.trunk_point = "trunk"
	self.muscle.damage = {
		max_health = 9000000
	}
	self.muscle.max_speed = 160
	self.muscle.max_rpm = 8000
	self.muscle.loot_drop_point = "v_repair_engine"
	self.muscle.max_loot_bags = 4
	self.muscle.interact_distance = 350
	self.muscle.driver_camera_offset = Vector3(0, 0.2, 2.5)
	self.muscle.fov = 75
end

function VehicleTweakData:_init_data_forklift()
	self.forklift = {}
	self.forklift.name_id = "vhl_forklift_name"
	self.forklift.hud_label_offset = 220
	self.forklift.animations = {
		driver = "drive_forklift_driver",
		passenger_front = "drive_forklift_passanger",
		vehicle_id = "forklift"
	}
	self.forklift.sound = {
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 5,
		door_close = "sit_down_in_forklift",
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "forklift",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_start = "forklift_start",
		going_reverse = "forklift_reverse_warning",
		going_reverse_stop = "forklift_reverse_warning_stop",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 10,
		longitudal_slip_treshold = 10,
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01"
	}
	self.forklift.seats = {
		driver = {
			driving = true,
			name = "driver"
		},
		passenger_front = {
			allow_shooting = true,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_front"
		}
	}
	self.forklift.loot_points = {
		loot_left = {
			name = "loot"
		}
	}
	self.forklift.damage = {
		max_health = 9000000
	}
	self.forklift.max_speed = 20
	self.forklift.max_rpm = 1600
	self.forklift.loot_drop_point = "v_repair_engine"
	self.forklift.max_loot_bags = 3
	self.forklift.interact_distance = 350
	self.forklift.driver_camera_offset = Vector3(0, 0, 7.5)
	self.forklift.fov = 70
	self.forklift_3 = deep_clone(self.forklift)
	self.forklift_3.max_loot_bags = 0
end

function VehicleTweakData:_init_data_forklift_2()
	self.forklift_2 = {}
	self.forklift_2.name_id = "vhl_forklift_name"
	self.forklift_2.hud_label_offset = 220
	self.forklift_2.animations = {
		driver = "drive_forklift_driver",
		vehicle_id = "forklift"
	}
	self.forklift_2.sound = {
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 5,
		door_close = "sit_down_in_forklift",
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "forklift",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_start = "forklift_start",
		going_reverse = "forklift_reverse_warning",
		going_reverse_stop = "forklift_reverse_warning_stop",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 10,
		longitudal_slip_treshold = 10,
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01"
	}
	self.forklift_2.seats = {
		driver = {
			driving = true,
			name = "driver"
		}
	}
	self.forklift_2.loot_points = {
		loot_left = {
			name = "loot"
		}
	}
	self.forklift_2.damage = {
		max_health = 100000
	}
	self.forklift_2.max_speed = 20
	self.forklift_2.max_rpm = 1600
	self.forklift_2.loot_drop_point = "v_repair_engine"
	self.forklift_2.max_loot_bags = 0
	self.forklift_2.interact_distance = 350
	self.forklift_2.driver_camera_offset = Vector3(0, 0, 7.5)
	self.forklift_2.fov = 70
end

function VehicleTweakData:_init_data_box_truck_1()
	self.box_truck_1 = {}
	self.box_truck_1.name_id = "vhl_truck_name"
	self.box_truck_1.hud_label_offset = 325
	self.box_truck_1.animations = {
		driver = "drive_truck_driver",
		passenger_back_left = "drive_truck_back_left",
		passenger_back_right = "drive_truck_back_right",
		passenger_front = "drive_truck_passanger",
		vehicle_id = "truck"
	}
	self.box_truck_1.sound = {
		broken_engine = "falcogini_engine_broken_loop",
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 8,
		door_close = "car_door_open",
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "drive_truck",
		engine_speed_rtpc = "car_falcogini_speed",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 0.35,
		longitudal_slip_treshold = 0.98,
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01"
	}
	self.box_truck_1.seats = {
		driver = {
			driving = true,
			name = "driver"
		},
		passenger_front = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = true,
			name = "passenger_front",
			shooting_pos = Vector3(50, 0, 50)
		},
		passenger_back_left = {
			allow_shooting = true,
			driving = false,
			has_shooting_mode = true,
			name = "passenger_back_left"
		},
		passenger_back_right = {
			allow_shooting = true,
			driving = false,
			has_shooting_mode = true,
			name = "passenger_back_right"
		}
	}
	self.box_truck_1.loot_points = {
		loot_left = {
			name = "loot_left"
		},
		loot_right = {
			name = "loot_right"
		}
	}
	self.box_truck_1.damage = {
		max_health = 900000
	}
	self.box_truck_1.max_speed = 160
	self.box_truck_1.max_rpm = 8000
	self.box_truck_1.loot_drop_point = "v_repair_engine"
	self.box_truck_1.max_loot_bags = 50
	self.box_truck_1.interact_distance = 350
	self.box_truck_1.driver_camera_offset = Vector3(0, 0.2, 2.5)
	self.box_truck_1.fov = 75
end

function VehicleTweakData:_init_data_mower_1()
	self.mower_1 = {}
	self.mower_1.name_id = "vhl_lawn_mower_name"
	self.mower_1.hud_label_offset = 80
	self.mower_1.animations = {
		driver = "drive_mower_1_driver",
		vehicle_id = "mower_1"
	}
	self.mower_1.sound = {
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 5,
		door_close = "sit_down_in_forklift",
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "forklift",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_start = "forklift_start",
		going_reverse = "forklift_reverse_warning",
		going_reverse_stop = "forklift_reverse_warning_stop",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 10,
		longitudal_slip_treshold = 10,
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01"
	}
	self.mower_1.seats = {
		driver = {
			driving = true,
			name = "driver"
		}
	}
	self.mower_1.loot_points = {
		loot_left = {
			name = "loot"
		}
	}
	self.mower_1.damage = {
		max_health = 9000000
	}
	self.mower_1.max_speed = 20
	self.mower_1.max_rpm = 1600
	self.mower_1.loot_drop_point = "v_repair_engine"
	self.mower_1.max_loot_bags = 1
	self.mower_1.interact_distance = 350
	self.mower_1.driver_camera_offset = Vector3(0, 0, 3.5)
	self.mower_1.fov = 70
end

function VehicleTweakData:_init_data_boat_rib_1()
	self.boat_rib_1 = {}
	self.boat_rib_1.name_id = "vhl_rib_boat_name"
	self.boat_rib_1.hud_label_offset = 1
	self.boat_rib_1.animations = {
		driver = "drive_boat_rib_1_driver",
		passenger_back_left = "drive_boat_rib_1_back_left",
		passenger_back_right = "drive_boat_rib_1_back_right",
		passenger_front = "drive_boat_rib_1_passanger",
		vehicle_id = "boat_rib_1"
	}
	self.boat_rib_1.sound = {
		bump = "water_splash_bump",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 0.3,
		door_close = "car_silence",
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "drive_rubber_boat",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_start = "car_silence",
		going_reverse = "car_silence",
		going_reverse_stop = "car_silence",
		hit = "water_splash_skid",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 0.2,
		longitudal_slip_treshold = 0.2,
		slip = "water_splash_skid",
		slip_stop = "car_silence"
	}
	self.boat_rib_1.seats = {
		driver = {
			driving = true,
			name = "driver"
		},
		passenger_front = {
			allow_shooting = true,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_front"
		},
		passenger_back_left = {
			allow_shooting = true,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_back_left"
		},
		passenger_back_right = {
			allow_shooting = true,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_back_right"
		}
	}
	self.boat_rib_1.loot_points = {
		loot_left = {
			name = "loot"
		}
	}
	self.boat_rib_1.damage = {
		max_health = 9000000
	}
	self.boat_rib_1.max_speed = 20
	self.boat_rib_1.max_rpm = 1600
	self.boat_rib_1.loot_drop_point = "v_repair_engine"
	self.boat_rib_1.max_loot_bags = 1
	self.boat_rib_1.interact_distance = 350
	self.boat_rib_1.driver_camera_offset = Vector3(0, 0, 3.5)
	self.boat_rib_1.fov = 70
end

function VehicleTweakData:_init_data_blackhawk_1()
	self.blackhawk_1 = {}
	self.blackhawk_1.name_id = "vhl_blackhawk_name"
	self.blackhawk_1.hud_label_offset = 150
	self.blackhawk_1.animations = {
		driver = "drive_blackhawk_1_driver",
		passenger_back_left = "drive_blackhawk_1_back_left",
		passenger_back_right = "drive_blackhawk_1_back_right",
		passenger_front = "drive_blackhawk_1_passanger",
		vehicle_id = "blackhawk_1"
	}
	self.blackhawk_1.sound = {
		broken_engine = "heli_silence",
		bump = "heli_silence",
		bump_rtpc = "heli_silence",
		bump_treshold = 8,
		door_close = "heli_silence",
		engine_rpm_rtpc = "heli_silence",
		engine_sound_event = "heli_silence",
		engine_speed_rtpc = "heli_silence",
		engine_start = "heli_silence",
		hit = "heli_silence",
		hit_rtpc = "heli_silence",
		lateral_slip_treshold = 0.35,
		longitudal_slip_treshold = 0.8,
		slip = "heli_silence",
		slip_stop = "heli_silence"
	}
	self.blackhawk_1.seats = {
		driver = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = false,
			name = "driver"
		},
		passenger_front = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_front"
		},
		passenger_back_left = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_back_left"
		},
		passenger_back_right = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_back_right"
		}
	}
	self.blackhawk_1.loot_points = {
		loot_left = {
			name = "loot_left"
		},
		loot_right = {
			name = "loot_right"
		}
	}
	self.blackhawk_1.damage = {
		max_health = 9e+27
	}
	self.blackhawk_1.max_speed = 160
	self.blackhawk_1.max_rpm = 8000
	self.blackhawk_1.loot_drop_point = "v_repair_engine"
	self.blackhawk_1.max_loot_bags = 4
	self.blackhawk_1.interact_distance = 350
	self.blackhawk_1.driver_camera_offset = Vector3(0, 0, 0)
	self.blackhawk_1.fov = 75
	self.blackhawk_2 = deep_clone(self.blackhawk_1)
	self.blackhawk_2.name_id = nil
end

function VehicleTweakData:_init_data_bike_1()
	self.bike_1 = {}
	self.bike_1.name_id = "vhl_bike_name"
	self.bike_1.hud_label_offset = 220
	self.bike_1.animations = {
		driver = "drive_bike_1_driver",
		vehicle_id = "bike_1"
	}
	self.bike_1.sound = {
		bump = "mc_bumper_01",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 6,
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "mc_harley",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_start = "mc_harley_start",
		hit = "mc_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 0.25,
		longitudal_slip_treshold = 0.95,
		slip = "mc_skid",
		slip_stop = "mc_skid_stop"
	}
	self.bike_1.seats = {
		driver = {
			driving = true,
			name = "driver"
		}
	}
	self.bike_1.loot_points = {
		loot_left = {
			name = "loot"
		}
	}
	self.bike_1.damage = {
		max_health = 18000000
	}
	self.bike_1.max_speed = 180
	self.bike_1.max_rpm = 3000
	self.bike_1.loot_drop_point = "v_repair_engine"
	self.bike_1.max_loot_bags = 0
	self.bike_1.interact_distance = 250
	self.bike_1.driver_camera_offset = Vector3(0, -4, 5)
	self.bike_1.fov = 75
	self.bike_1.camera_limits = {
		driver = {
			pitch = 30,
			yaw = 30
		}
	}
end

function VehicleTweakData:_init_data_bike_2()
	self.bike_2 = {}
	self.bike_2.name_id = "vhl_rust_bike_name"
	self.bike_2.hud_label_offset = 220
	self.bike_2.animations = {
		driver = "drive_bike_1_driver",
		vehicle_id = "bike_1"
	}
	self.bike_2.sound = {
		bump = "mc_bumper_01",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 6,
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "mc_harley",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_start = "mc_harley_start",
		hit = "mc_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 0.25,
		longitudal_slip_treshold = 0.95,
		slip = "mc_skid",
		slip_stop = "mc_skid_stop"
	}
	self.bike_2.seats = {
		driver = {
			driving = true,
			name = "driver"
		}
	}
	self.bike_2.loot_points = {
		loot_left = {
			name = "loot"
		}
	}
	self.bike_2.damage = {
		max_health = 18000000
	}
	self.bike_2.max_speed = 180
	self.bike_2.max_rpm = 3000
	self.bike_2.loot_drop_point = "v_repair_engine"
	self.bike_2.max_loot_bags = 0
	self.bike_2.interact_distance = 250
	self.bike_2.driver_camera_offset = Vector3(0, -4, 5)
	self.bike_2.fov = 75
	self.bike_2.camera_limits = {
		driver = {
			pitch = 30,
			yaw = 30
		}
	}
end

function VehicleTweakData:_init_data_wanker()
	self.wanker = {}
	self.wanker.hud_label_offset = 150
	self.wanker.animations = {
		driver = "drive_wanker_driver",
		passenger_back_left = "drive_wanker_back_left",
		passenger_back_right = "drive_wanker_back_right",
		passenger_front = "drive_wanker_passanger",
		vehicle_id = "wanker"
	}
	self.wanker.sound = {
		broken_engine = "heli_silence",
		bump = "heli_silence",
		bump_rtpc = "heli_silence",
		bump_treshold = 8,
		door_close = "heli_silence",
		engine_rpm_rtpc = "heli_silence",
		engine_sound_event = "heli_silence",
		engine_speed_rtpc = "heli_silence",
		engine_start = "heli_silence",
		hit = "heli_silence",
		hit_rtpc = "heli_silence",
		lateral_slip_treshold = 0.35,
		longitudal_slip_treshold = 0.8,
		slip = "heli_silence",
		slip_stop = "heli_silence"
	}
	self.wanker.seats = {
		driver = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = false,
			name = "driver"
		},
		passenger_front = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_front"
		},
		passenger_back_left = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_back_left"
		},
		passenger_back_right = {
			allow_shooting = false,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_back_right"
		}
	}
	self.wanker.loot_points = {
		loot_left = {
			name = "loot_left"
		},
		loot_right = {
			name = "loot_right"
		}
	}
	self.wanker.damage = {
		max_health = 9e+27
	}
	self.wanker.max_speed = 160
	self.wanker.max_rpm = 8000
	self.wanker.loot_drop_point = "v_repair_engine"
	self.wanker.max_loot_bags = 4
	self.wanker.interact_distance = 350
	self.wanker.driver_camera_offset = Vector3(0, 0, 0)
	self.wanker.fov = 75
end

function VehicleTweakData:_init_data_golfcart()
	self.golfcart = {}
	self.golfcart.name_id = "vhl_golfcart_name"
	self.golfcart.hud_label_offset = 220
	self.golfcart.animations = {
		driver = "drive_forklift_driver",
		passenger_front = "drive_forklift_passanger",
		vehicle_id = "forklift"
	}
	self.golfcart.sound = {
		bump = "car_bumper_01",
		bump_rtpc = "car_bump_vel",
		bump_treshold = 5,
		door_close = "sit_down_in_forklift",
		engine_rpm_rtpc = "car_falcogini_rpm",
		engine_sound_event = "ranc_gc_engine",
		engine_speed_rtpc = "car_falcogini_speed",
		engine_start = "ranc_gc_ignition",
		hit = "car_hit_gen_01",
		hit_rtpc = "car_hit_vel",
		lateral_slip_treshold = 10,
		longitudal_slip_treshold = 10,
		slip = "car_skid_01",
		slip_stop = "car_skid_stop_01"
	}
	self.golfcart.seats = {
		driver = {
			driving = true,
			name = "driver"
		},
		passenger_front = {
			allow_shooting = true,
			driving = false,
			has_shooting_mode = false,
			name = "passenger_front"
		}
	}
	self.golfcart.loot_points = {
		loot_left = {
			name = "loot"
		}
	}
	self.golfcart.damage = {
		max_health = 9000000
	}
	self.golfcart.max_speed = 70
	self.golfcart.max_rpm = 4000
	self.golfcart.loot_drop_point = "v_repair_engine"
	self.golfcart.max_loot_bags = 4
	self.golfcart.interact_distance = 350
	self.golfcart.driver_camera_offset = Vector3(0, 0, 7.5)
	self.golfcart.fov = 70
end
