MutatorTweakData = MutatorTweakData or class()

function MutatorTweakData:init(tweak_data)
	self:init_piggybank(tweak_data)
end

function MutatorTweakData:init_piggybank(tweak_data)
	self.piggybank = {
		drop_count = 10,
		normal_kill_points = 1,
		special_kill_points = 2,
		progress_range = 1000,
		pig_levels = {
			{
				range = 200,
				sequre_zone_index = 1,
				piggy_unit_index = 1,
				bag_requirement = 0,
				dialogs = {},
				sequences = {
					grow = "anim_pig_idle"
				}
			},
			{
				range = 200,
				sequre_zone_index = 1,
				piggy_unit_index = 1,
				bag_requirement = 1,
				dialogs = {
					explode = "Play_alm_pda9_12",
					show = "Play_alm_pda9_05"
				},
				sequences = {
					explode = "anim_pig_explode",
					grow = "anim_pig_grow",
					show = "anim_pig_idle"
				}
			},
			{
				range = 300,
				sequre_zone_index = 2,
				piggy_unit_index = 2,
				bag_requirement = 20,
				dialogs = {
					explode = "Play_alm_pda9_13",
					show = "Play_alm_pda9_07"
				},
				sequences = {
					explode = "anim_pig_explode",
					grow = "anim_pig_grow",
					show = "show"
				}
			},
			{
				range = 400,
				sequre_zone_index = 3,
				piggy_unit_index = 3,
				bag_requirement = 80,
				dialogs = {
					explode = "Play_alm_pda9_14",
					show = "Play_alm_pda9_08"
				},
				sequences = {
					explode = "anim_pig_explode",
					grow = "anim_pig_grow",
					show = "show"
				}
			},
			{
				range = 500,
				sequre_zone_index = 4,
				piggy_unit_index = 4,
				bag_requirement = 240,
				dialogs = {
					explode = "Play_alm_pda9_15",
					show = "Play_alm_pda9_09"
				},
				sequences = {
					explode = "anim_pig_explode",
					grow = "anim_pig_grow",
					show = "show"
				}
			},
			{
				range = 0,
				piggy_unit_index = 4,
				bag_requirement = 560,
				dialogs = {
					explode = "Play_alm_pda9_16",
					show = "Play_alm_pda9_10"
				},
				sequences = {
					explode = "anim_pig_explode",
					show = "show_eyes"
				}
			}
		},
		level_coordinates = {
			firestarter_1 = {
				position = Vector3(-848.169, -1484.02, -5.18241),
				rotation = Rotation(-1.16773, 0, 0)
			},
			firestarter_2 = {
				position = Vector3(-2125.22, 2789.92, -24.3859),
				rotation = Rotation(-89.9757, 0, 0)
			},
			firestarter_3 = {
				position = Vector3(-3965.54, 3311.53, -5.18584),
				rotation = Rotation(-177.786, 0, -0)
			},
			jewelry_store = {
				position = Vector3(-20.6412, 3653.49, 19.8175),
				rotation = Rotation(179.94, 0, -0)
			},
			branchbank = {
				position = Vector3(-3965.54, 3311.53, -5.18584),
				rotation = Rotation(-177.786, 0, -0)
			},
			friend = {
				position = Vector3(5946.33, -2580.53, -706.687),
				rotation = Rotation(180, 0, 0)
			},
			mallcrasher = {
				position = Vector3(910.249, 2821.75, -405.186),
				rotation = Rotation(91.0357, 0, 0)
			},
			four_stores = {
				position = Vector3(2871.21, -3397.01, -0.183399),
				rotation = Rotation(90.0561, 0, 0)
			},
			red2 = {
				position = Vector3(-3453.65, 26.286, -0.182674),
				rotation = Rotation(91.5345, 0, 0)
			},
			pal = {
				position = Vector3(-7405.17, -1171.12, 12.0178),
				rotation = Rotation(-75.7504, 0, 0)
			},
			chas = {
				position = Vector3(-2064.14, 71.772, -25.187),
				rotation = Rotation(89.9898, 0, 0)
			},
			sand = {
				position = Vector3(17287.9, -5197.53, -33.264),
				rotation = Rotation(90.5937, 0, 0)
			},
			chca = {
				position = Vector3(-9286.68, 15719.9, -5.18678),
				rotation = Rotation(-179.139, 0, -0)
			},
			pent = {
				position = Vector3(266.625, -1042.33, 12894.8),
				rotation = Rotation(-176.891, 0, -0)
			},
			ranc = {
				position = Vector3(4668.93, 1418.8, 394.821),
				rotation = Rotation(-90.2844, 0, -0)
			},
			pex = {
				position = Vector3(587.78, -1303.05, -30.0338),
				rotation = Rotation(87.9926, 0, 0)
			},
			roberts = {
				position = Vector3(1862.43, -341.785, -76.7702),
				rotation = Rotation(122.244, 0, -0)
			},
			rvd1 = {
				position = Vector3(-2175.52, -2698.72, -25.186),
				rotation = Rotation(-86.9155, 0, 0)
			},
			rvd2 = {
				position = Vector3(-26.96, 1537.23, -5.18682),
				rotation = Rotation(-88.8213, 0, 0)
			},
			run = {
				position = Vector3(-2829.11, -9281.92, 2044.81),
				rotation = Rotation(173.33, 0, -0)
			},
			mad = {
				position = Vector3(6250.55, 3727.1, 3.74605),
				rotation = Rotation(177.542, 0, -0)
			},
			wwh = {
				position = Vector3(2879.52, -177.076, 1144.81),
				rotation = Rotation(-48.4087, 0, 0)
			},
			sah = {
				position = Vector3(0, 2050, -100),
				rotation = Rotation(180, 0, 0)
			},
			brb = {
				position = Vector3(-2959.35, -2782.98, -22.9985),
				rotation = Rotation(-89.5724, 0, 0)
			},
			crojob2 = {
				position = Vector3(2931.11, 1758.48, -2.65967),
				rotation = Rotation(171.697, 0, -0)
			},
			mus = {
				position = Vector3(-5826.79, 1504.41, -1004.54),
				rotation = Rotation(-160.412, 0, -0)
			},
			big = {
				position = Vector3(4283.11, -362.942, -605.189),
				rotation = Rotation(88.2822, 0, 0)
			},
			hox_3 = {
				position = Vector3(-2993.59, -796.747, -10.7954),
				rotation = Rotation(-9.33604, 0, 0)
			},
			fex = {
				position = Vector3(-11.9599, 3013.34, -2.68673),
				rotation = Rotation(0, 0, 0)
			},
			gallery = {
				position = Vector3(3238.55, -1577.97, -124.998),
				rotation = Rotation(-13.4452, 0, 0)
			},
			jolly = {
				position = Vector3(11228.9, 1337.76, -5.18679),
				rotation = Rotation(-1.50457, 0, 0)
			},
			nightclub = {
				position = Vector3(2425.23, -5667.32, -80.1866),
				rotation = Rotation(87.6614, 0, 0)
			},
			ukrainian_job = {
				position = Vector3(-20.6412, 3653.49, 19.8175),
				rotation = Rotation(179.94, 0, -0)
			},
			mex = {
				position = Vector3(3804.28, -9322.23, -3205.19),
				rotation = Rotation(-165.413, 0, -0)
			},
			des = {
				position = Vector3(-180, -2700, 100),
				rotation = Rotation(0, 0, 0)
			}
		},
		event_jobs_from_level = {}
	}
	local event_levels = table.map_keys(self.piggybank.level_coordinates)

	for index, job_id in ipairs(tweak_data.narrative:get_jobs_index()) do
		local job_tweak = tweak_data.narrative.jobs[job_id]
		local job_in_event = #job_tweak.chain > 0

		for _, stage in ipairs(job_tweak.chain) do
			if not table.contains(event_levels, stage.level_id) then
				job_in_event = false

				break
			end
		end

		if job_in_event then
			table.insert(self.piggybank.event_jobs_from_level, job_id)
		end
	end

	self.piggybank.rewards = {
		default = 1000,
		overkill = 2000,
		overkill_145 = 2500,
		hard = 1500,
		easy_wish = 3000,
		overkill_290 = 3500,
		sm_wish = 4000,
		normal = 1000
	}
end
