LootDropManager = LootDropManager or class()

function LootDropManager:init()
	self:_setup()
end

function LootDropManager:_setup()
	self:add_qlvl_to_weapon_mods()

	if not Global.lootdrop_manager then
		Global.lootdrop_manager = {}

		self:_setup_items()
	end

	self._global = Global.lootdrop_manager
end

function LootDropManager:reset()
	Global.lootdrop_manager = nil

	self:_setup()
end

function LootDropManager:save(data)
	data.LootDropManager = self._global
end

function LootDropManager:load(data)
	self._global = data.LootDropManager
end

function LootDropManager:add_qlvl_to_weapon_mods(override_tweak_data)
	local weapon_mods_tweak_data = override_tweak_data or tweak_data.blackmarket.weapon_mods
	local weapons_data = {}

	for weapon_id, data in pairs(Global.blackmarket_manager.weapons) do
		weapons_data[data.factory_id] = data.level
	end

	for part_id, data in pairs(tweak_data.weapon.factory.parts) do
		local weapon_uses_part = managers.weapon_factory:get_weapons_uses_part(part_id) or {}
		local min_level = managers.experience:level_cap()

		for _, factory_id in ipairs(weapon_uses_part) do
			if not table.contains(tweak_data.weapon.factory[factory_id].default_blueprint, part_id) then
				min_level = math.min(min_level, weapons_data[factory_id] or 0)
			end
		end

		weapon_mods_tweak_data[part_id].qlvl = min_level
	end
end

function LootDropManager:_setup_items()
	local pc_items = {}
	Global.lootdrop_manager.pc_items = pc_items

	local function sort_pc(type, data)
		for id, item_data in pairs(data) do
			local dlcs = item_data.dlcs or {}
			local dlc = item_data.dlc

			if dlc then
				table.insert(dlcs, dlc)
			end

			local has_dlc = #dlcs == 0

			for _, dlc in pairs(dlcs) do
				has_dlc = has_dlc or managers.dlc:is_dlc_unlocked(dlc)
			end

			if has_dlc then
				if item_data.pc then
					pc_items[item_data.pc] = pc_items[item_data.pc] or {}
					pc_items[item_data.pc][type] = pc_items[item_data.pc][type] or {}

					table.insert(pc_items[item_data.pc][type], id)
				end

				if item_data.pcs then
					for _, pc in ipairs(item_data.pcs) do
						pc_items[pc] = pc_items[pc] or {}
						pc_items[pc][type] = pc_items[pc][type] or {}

						table.insert(pc_items[pc][type], id)
					end
				end
			end
		end
	end

	local k, v = nil

	for key, data in pairs(tweak_data.blackmarket) do
		if type(data) == "table" then
			k, v = next(data)

			if type(v) == "table" then
				sort_pc(key, data)
			end
		end
	end
end

function LootDropManager:droppable_items(item_pc, infamous_success, skip_types)
	local plvl = managers.experience:current_level()
	local xp_no_next_lv = managers.experience:next_level_data_points() - managers.experience:next_level_data_current_points()
	local pc_items = self._global.pc_items[item_pc]
	local droppable_items = {}
	local maxed_inventory_items = {}

	for type, items in pairs(pc_items) do
		local type_tweak = tweak_data.blackmarket[type]
		droppable_items[type] = {}
		maxed_inventory_items[type] = {}

		if not skip_types or not skip_types[type] then
			for i, item in ipairs(items) do
				local item_tweak = type_tweak[item]
				local is_infamous = item_tweak.infamous or item_tweak.global_value == "infamous" or false
				local is_dlc = item_tweak.dlcs or item_tweak.dlc or false
				local got_qlvl = item_tweak.qlvl or false
				local fixed_global_value = item_tweak.global_value or false
				local pass_infamous = not is_infamous or infamous_success
				local pass_dlc = true
				local pass_qlvl = not got_qlvl or got_qlvl <= plvl
				local pass_xp_card = type ~= "xp" or xp_no_next_lv > (tweak_data:get_value("experience_manager", "loot_drop_value", item_tweak.value_id) or 0)
				local global_value = fixed_global_value or "normal"

				if is_infamous then
					global_value = "infamous"
				elseif is_dlc then
					local dlcs = {}

					if item_tweak.dlcs then
						for _, dlc in ipairs(item_tweak.dlcs) do
							table.insert(dlcs, dlc)
						end
					end

					if item_tweak.dlc then
						table.insert(dlcs, item_tweak.dlc)
					end

					local dlc_global_values = {}

					for _, dlc in ipairs(dlcs) do
						if managers.dlc:is_dlc_unlocked(dlc) then
							table.insert(dlc_global_values, dlc)
						end
					end

					if #dlc_global_values > 0 then
						global_value = fixed_global_value or dlc_global_values[math.random(#dlc_global_values)]
					else
						pass_dlc = false
					end
				end

				local amount_in_inventory = managers.blackmarket:get_item_amount(global_value, type, item, true)

				if pass_infamous and pass_dlc and pass_qlvl and pass_xp_card then
					local weight = item_tweak.weight or tweak_data.lootdrop.DEFAULT_WEIGHT
					local type_weight_mod_func = tweak_data.lootdrop.type_weight_mod_funcs[type]

					if type_weight_mod_func then
						weight = weight * type_weight_mod_func(global_value, type, item)
					end

					if amount_in_inventory > 0 then
						weight = weight * (item_tweak.got_item_weight_mod or tweak_data.lootdrop.got_item_weight_mod or 0.5)
					end

					local add_entry = {
						entry = item,
						global_value = global_value,
						weight = weight
					}

					if not item_tweak.max_in_inventory or amount_in_inventory < item_tweak.max_in_inventory then
						table.insert(droppable_items[type], add_entry)
					else
						table.insert(maxed_inventory_items[type], add_entry)
					end
				end
			end
		end

		if #droppable_items[type] == 0 then
			droppable_items[type] = nil
		end
	end

	return droppable_items, maxed_inventory_items
end

function LootDropManager:infamous_chance(setup_data)
	local infamous_diff = 1

	if not setup_data or not setup_data.disable_difficulty then
		local difficulty_stars = managers.job:current_difficulty_stars() or 0
		infamous_diff = tweak_data.lootdrop.risk_infamous_multiplier[difficulty_stars] or 1
	end

	local chance = tweak_data.lootdrop.global_values.infamous.chance
	local multiplier = managers.player:upgrade_value("player", "passive_loot_drop_multiplier", 1) * managers.player:upgrade_value("player", "loot_drop_multiplier", 1) * infamous_diff * (setup_data and setup_data.increase_infamous or 1)

	if managers.experience:current_rank() > 0 then
		for infamy, item in pairs(tweak_data.infamy.items) do
			if managers.infamy:owned(infamy) and item.upgrades and item.upgrades.infamous_lootdrop then
				multiplier = multiplier * item.upgrades.infamous_lootdrop
			end
		end
	end

	return chance * multiplier, chance, multiplier
end

function LootDropManager:get_random_item_pc(setup_data)
	return self:_get_random_item_pc(false, nil, setup_data)
end

function LootDropManager:_get_random_item_pc(debug, debug_stars, setup_data)
	local stars = debug_stars or managers.experience:level_to_stars()
	local pcs = tweak_data.lootdrop.STARS[stars].pcs
	local chance_curve = tweak_data.lootdrop.STARS_CURVES[stars]
	local start_chance = tweak_data.lootdrop.PC_CHANCE[stars]
	local no_pcs, item_pc = nil

	if setup_data and setup_data.max_pcs then
		no_pcs = setup_data.max_pcs
	else
		no_pcs = #pcs
	end

	for i = 1, no_pcs do
		local chance = no_pcs > 1 and math.lerp(start_chance, 1, math.pow((i - 1) / (no_pcs - 1), chance_curve)) or 1
		local roll = math.rand(1)

		if roll <= chance then
			item_pc = pcs[i]

			break
		end
	end

	return item_pc
end

function LootDropManager:new_make_drop(return_data, setup_data)
	return_data = type(return_data) == "table" and return_data or {}

	self:_new_make_drop(false, true, nil, return_data, setup_data)
end

function LootDropManager:_new_make_drop(debug, add_to_inventory, debug_stars, return_data, setup_data)
	local plvl = managers.experience:current_level()
	local pstars = managers.experience:level_to_stars()
	local stars = debug_stars or pstars
	local pc = stars * 10

	if not debug then
		print("[LootDropManager] Player level", plvl)
		print("[LootDropManager] Player stars", pstars)
		print("[LootDropManager] Stars", stars)
		print("[LootDropManager] Pay class", pc)
		print("[LootDropManager] Difficulty stars", managers.job:current_difficulty_stars() or 0)
	end

	return_data = return_data or {}
	return_data.job_stars = stars
	return_data.total_stars = stars
	return_data.player_level = plvl
	return_data.player_stars = pstars
	return_data.payclass = pc
	local item_pc = self:_get_random_item_pc(debug, debug_stars, setup_data)
	return_data.item_payclass = item_pc
	local infamous_chance, infamous_base_chance, infamous_base_multiplier = self:infamous_chance(setup_data)
	local infamous_roll = math.rand(1)
	local infamous_success = infamous_roll < infamous_chance

	if not debug then
		print("[LootDropManager] infamous_success", infamous_success, "infamous_roll", infamous_roll, "infamous_chance", infamous_chance, "infamous_base_chance", infamous_base_chance, "infamous_base_multiplier", infamous_base_multiplier)
	end

	local droppable_items, maxed_inventory_items = self:droppable_items(item_pc, infamous_success, setup_data and setup_data.skip_types)
	local weighted_type_chance = {}
	local sum = 0

	for type, items in pairs(droppable_items) do
		weighted_type_chance[type] = tweak_data.lootdrop.WEIGHTED_TYPE_CHANCE[pc][type]
		sum = sum + weighted_type_chance[type]

		if not debug then
			print("[LootDropManager] added", type, weighted_type_chance[type], "to sum", sum)
		end
	end

	if setup_data and setup_data.preferred_type and setup_data.preferred_chance then
		local increase = setup_data.preferred_chance * sum
		weighted_type_chance[setup_data.preferred_type] = (weighted_type_chance[setup_data.preferred_type] or 0) + increase
		sum = sum + increase
	end

	if not debug then
		print("[LootDropManager] sum", sum)
	end

	local normalized_chance = {}

	for type, items in pairs(droppable_items) do
		normalized_chance[type] = weighted_type_chance[type] > 0 and weighted_type_chance[type] / sum or 0
	end

	if not debug then
		print("[LootDropManager] normalized_chance: pc", inspect(normalized_chance))
	end

	local pc_type = setup_data and setup_data.preferred_type_drop or self:_get_type_items(normalized_chance, debug)
	local drop_table = droppable_items[pc_type] or maxed_inventory_items[pc_type]
	local global_value, entry = nil

	if drop_table then
		sum = 0

		for index, item_data in ipairs(drop_table) do
			sum = sum + item_data.weight
		end

		normalized_chance = {}

		for index, item_data in ipairs(drop_table) do
			normalized_chance[index] = item_data.weight / sum
		end

		if not debug then
			print("[LootDropManager] normalized_chance: item", inspect(normalized_chance))
		end

		local dropped_index = self:_get_type_items(normalized_chance, debug)
		local dropped_item = drop_table[dropped_index]

		if not debug then
			print("[LootDropManager] GOT: ", dropped_index, dropped_item.global_value, pc_type, dropped_item.entry)
		end

		if add_to_inventory then
			managers.blackmarket:add_to_inventory(dropped_item.global_value, pc_type, dropped_item.entry)
		end

		global_value = dropped_item.global_value
		entry = dropped_item.entry
	end

	return_data.global_value = global_value
	return_data.type_items = pc_type
	return_data.item_entry = entry

	return global_value, pc_type, entry, pc
end

function LootDropManager:new_make_mass_drop(amount, item_pc, return_data, setup_data)
	local plvl = managers.experience:current_level()
	local pstars = managers.experience:level_to_stars()
	local stars = pstars
	local pc = stars * 10
	local pcs = tweak_data.lootdrop.STARS[stars].pcs
	local chance_curve = tweak_data.lootdrop.STARS_CURVES[stars]
	local start_chance = tweak_data.lootdrop.PC_CHANCE[stars]
	return_data = return_data or {}
	return_data.job_stars = stars
	return_data.total_stars = stars
	return_data.player_level = plvl
	return_data.player_stars = pstars
	return_data.payclass = pc
	local infamous_chance, infamous_base_chance, infamous_base_multiplier = self:infamous_chance(setup_data)
	local infamous_success = false

	for i = 1, amount do
		if math.rand(1) < infamous_chance then
			infamous_success = true

			break
		end
	end

	local droppable_items, maxed_inventory_items = self:droppable_items(item_pc or 40, infamous_success, setup_data and setup_data.skip_types)
	local global_value, entry = nil
	return_data.items = {}
	return_data.progress = {
		total = amount
	}
	local co = coroutine.create(function ()
		local itr = 0

		for i = 1, amount do
			local weighted_type_chance = {}
			local sum = 0

			for type, items in pairs(droppable_items) do
				weighted_type_chance[type] = tweak_data.lootdrop.WEIGHTED_TYPE_CHANCE[pc][type]
				sum = sum + weighted_type_chance[type]
			end

			if setup_data and setup_data.preferred_type and setup_data.preferred_chance then
				local increase = setup_data.preferred_chance * sum
				weighted_type_chance[setup_data.preferred_type] = (weighted_type_chance[setup_data.preferred_type] or 0) + increase
				sum = sum + increase
			end

			local normalized_chance = {}

			for type, items in pairs(droppable_items) do
				normalized_chance[type] = weighted_type_chance[type] > 0 and weighted_type_chance[type] / sum or 0
			end

			local pc_type = setup_data and setup_data.preferred_type_drop or self:_get_type_items(normalized_chance, true)
			local drop_table = droppable_items[pc_type] or maxed_inventory_items[pc_type]

			if drop_table then
				sum = 0

				for index, item_data in ipairs(drop_table) do
					sum = sum + item_data.weight
				end

				normalized_chance = {}

				for index, item_data in ipairs(drop_table) do
					normalized_chance[index] = item_data.weight / sum
				end

				local dropped_index = self:_get_type_items(normalized_chance, true)
				local dropped_item = drop_table[dropped_index]

				managers.blackmarket:add_to_inventory(dropped_item.global_value, pc_type, dropped_item.entry)

				global_value = dropped_item.global_value
				entry = dropped_item.entry
			end

			local item = {
				global_value = global_value,
				type_items = pc_type,
				item_entry = entry
			}

			table.insert(return_data.items, item)

			itr = itr + 1

			if itr > 5 then
				coroutine.yield()

				itr = 0
				return_data.progress.current = i
				droppable_items, maxed_inventory_items = self:droppable_items(item_pc or 40, infamous_success, setup_data and setup_data.skip_types)
			end
		end
	end)
	local result = coroutine.resume(co)
	local status = coroutine.status(co)

	return co
end

function LootDropManager:debug_drop(amount, add_to_inventory, stars)
	amount = amount or 10
	add_to_inventory = add_to_inventory or false
	local debug_infamous = 0
	local debug_max_pc = 0

	if stars == "random" then
		-- Nothing
	elseif not stars then
		stars = 5
	end

	self._debug_drop_result = {}

	for i = 1, amount do
		local s = stars == "random" and math.random(10) or stars
		local global_value, category, id, pc = self:_make_drop(true, add_to_inventory, s)
		self._debug_drop_result[global_value] = self._debug_drop_result[global_value] or {}
		self._debug_drop_result[global_value][category] = self._debug_drop_result[global_value][category] or {}
		self._debug_drop_result[global_value][category][id] = (self._debug_drop_result[global_value][category][id] or 0) + 1

		if global_value == "infamous" then
			debug_infamous = debug_infamous + 1
		end

		if pc == tweak_data.lootdrop.STARS[s].pcs[1] then
			debug_max_pc = debug_max_pc + 1
		end
	end

	if stars ~= "random" then
		Application:debug(debug_max_pc .. " dropped at PC " .. stars, "infamous items dropped: " .. debug_infamous)
	end

	Global.debug_drop_result = self._debug_drop_result
end

function LootDropManager:make_drop(return_data)
	return_data = type(return_data) == "table" and return_data or {}

	self:_make_drop(false, true, nil, return_data)
end

function LootDropManager:_make_drop(debug, add_to_inventory, debug_stars, return_data)
	local plvl = managers.experience:current_level()
	local stars = debug_stars or managers.job:current_job_stars()
	return_data = return_data or {}
	return_data.job_stars = stars
	return_data.player_level = plvl
	local difficulty = Global.game_settings.difficulty or "easy"
	local difficulty_id = math.max(0, (tweak_data:difficulty_to_index(difficulty) or 0) - 2)
	stars = stars + difficulty_id
	local player_stars = math.max(math.ceil(plvl / 10), 1)
	difficulty_id = math.min(difficulty_id, stars - return_data.job_stars)
	stars = player_stars
	return_data.player_stars = player_stars
	return_data.difficulty_stars = difficulty_id
	return_data.total_stars = stars
	local pc = math.lerp(0, 100, stars / 10)
	return_data.payclass = pc
	local drop_pc = stars * 10
	local pcs = tweak_data.lootdrop.STARS[stars].pcs
	local chance_risk_mod = tweak_data.lootdrop.risk_pc_multiplier[difficulty_id] or 0
	local chance_curve = tweak_data.lootdrop.STARS_CURVES[stars]
	local start_chance = tweak_data.lootdrop.PC_CHANCE[stars]
	local no_pcs = #pcs
	local pc = nil

	for i = 1, no_pcs do
		local chance = math.lerp(start_chance, 1, math.pow((i - 1) / (no_pcs - 1), chance_curve))
		local roll = math.rand(1)

		if roll <= chance then
			pc = pcs[i]
			return_data.item_payclass = pc

			break
		end
	end

	local pc_items = self._global.pc_items[pc]
	local i_pc_items = {}
	local weighted_type_chance = tweak_data.lootdrop.WEIGHTED_TYPE_CHANCE[drop_pc]
	local sum = 0

	for type, items in pairs(pc_items) do
		sum = sum + weighted_type_chance[type]
	end

	local normalized_chance = {}

	for type, items in pairs(pc_items) do
		normalized_chance[type] = weighted_type_chance[type] / sum
	end

	local has_result = nil

	while not has_result do
		local type_items = self:_get_type_items(normalized_chance, debug)
		local items = pc_items[type_items]
		local item_entry = items[math.random(#items)]
		local global_value = "normal"
		local block_item = false
		local blackmarket_item_entry = tweak_data.blackmarket[type_items][item_entry]

		if not blackmarket_item_entry.qlvl or blackmarket_item_entry.qlvl <= plvl then
			local global_value_chance = math.rand(1)
			local quality_mul = managers.player:upgrade_value("player", "passive_loot_drop_multiplier", 1) * managers.player:upgrade_value("player", "loot_drop_multiplier", 1)

			if blackmarket_item_entry.infamous and global_value_chance < tweak_data.lootdrop.global_values.infamous.chance * quality_mul then
				global_value = "infamous"
			else
				local dlcs = blackmarket_item_entry.dlcs or {}
				local dlc = blackmarket_item_entry.dlc

				if dlc then
					table.insert(dlcs, dlc)
				end

				local dlc_global_values = {}

				for _, dlc in pairs(dlcs) do
					if managers.dlc:is_dlc_unlocked(dlc) then
						table.insert(dlc_global_values, dlc)
					else
						block_item = true
					end
				end

				if #dlc_global_values > 0 then
					global_value = dlc_global_values[math.random(#dlc_global_values)]
					block_item = false
				end
			end

			if block_item then
				-- Nothing
			elseif blackmarket_item_entry.max_in_inventory and blackmarket_item_entry.max_in_inventory <= managers.blackmarket:get_item_amount(global_value, type_items, item_entry, true) then
				-- Nothing
			elseif not blackmarket_item_entry.infamous or global_value == "infamous" then
				has_result = true

				if add_to_inventory then
					managers.blackmarket:add_to_inventory(global_value, type_items, item_entry)

					return_data.global_value = global_value
					return_data.type_items = type_items
					return_data.item_entry = item_entry
				end

				return global_value, type_items, item_entry, pc
			end
		end
	end
end

function LootDropManager:_get_type_items(normalized_chance, debug)
	local seed = math.rand(1)

	for type, weight in pairs(normalized_chance) do
		seed = seed - weight

		if seed <= 0 then
			return type
		end
	end

	return next(normalized_chance)
end

function LootDropManager:can_drop_weapon_mods()
	local plvl = managers.experience:current_level()
	local dropable_items = {}

	for item, item_tweak in pairs(tweak_data.blackmarket.weapon_mods) do
		if item_tweak.pc or item_tweak.pcs then
			local is_infamous = item_tweak.infamous or false
			local is_dlc = item_tweak.dlcs or item_tweak.dlc or false
			local got_qlvl = item_tweak.qlvl or false
			local pass_infamous = true
			local pass_dlc = true
			local pass_qlvl = not got_qlvl or got_qlvl <= plvl
			local pass_max_in_inventory = nil
			local global_value = "normal"

			if is_infamous then
				global_value = "infamous"
			elseif is_dlc then
				local dlcs = item_tweak.dlcs or {}

				if item_tweak.dlc then
					table.insert(dlcs, item_tweak.dlc)
				end

				local dlc_global_values = {}

				for _, dlc in pairs(dlcs) do
					if managers.dlc:is_dlc_unlocked(dlc) then
						table.insert(dlc_global_values, dlc)
					end
				end

				if #dlc_global_values > 0 then
					global_value = dlc_global_values[math.random(#dlc_global_values)]
				else
					pass_dlc = false
				end
			end

			local amount_in_inventory = managers.blackmarket:get_item_amount(global_value, "weapon_mods", item, true)
			pass_max_in_inventory = not item_tweak.max_in_inventory or amount_in_inventory < item_tweak.max_in_inventory

			if pass_infamous and pass_dlc and pass_qlvl and pass_max_in_inventory then
				table.insert(dropable_items, true)
			end
		end
	end

	return #dropable_items > 0
end

function LootDropManager:specific_fake_loot_pc(preferred)
	return tweak_data.lootdrop.card_to_drop[preferred] or 1
end

function LootDropManager:new_fake_loot_pc(debug_pc, skip_mods)
	local sum = 0
	local to_drop = tweak_data.lootdrop.card_to_drop

	for skip, value in pairs(skip_mods) do
		if value then
			to_drop[skip] = nil
		end
	end

	local WEIGHTS = tweak_data.lootdrop.WEIGHTED_TYPE_CHANCE[(debug_pc or managers.experience:level_to_stars()) * 10]

	for type in pairs(to_drop) do
		sum = sum + WEIGHTS[type]
	end

	local variant = math.random(sum)

	for type, card in pairs(to_drop) do
		variant = variant - WEIGHTS[type]

		if variant <= 0 then
			return card
		end
	end

	return 1
end

function LootDropManager:get_amount_mass_drop(data)
	if not data then
		return 0
	end

	local num_rewards = 1

	if data.coins and data.coins > 0 then
		num_rewards = num_rewards + 1
	end

	if data.cash and data.cash > 0 then
		num_rewards = num_rewards + 1
	end

	if data.xp and data.xp > 0 then
		num_rewards = num_rewards + 1
	end

	if data.additional_lootdrops then
		num_rewards = num_rewards + data.additional_lootdrops
	end

	return num_rewards
end

function LootDropManager:set_mass_drop(data)
	if not data or data.coroutine then
		return false
	end

	local amount_coins = data.coins or 0

	if amount_coins > 0 then
		managers.custom_safehouse:add_coins(amount_coins)
	end

	local amount_cash = data.cash or 0

	if amount_cash > 0 then
		managers.money:add_to_spending(amount_cash)
	end

	local amount_xp = data.xp or 0

	if amount_xp > 0 then
		managers.experience:give_experience(amount_xp)
	end

	local amount_lootdrops = data.inventory_reward and 0 or 1
	amount_lootdrops = amount_lootdrops + (data.additional_lootdrops or 0)
	local item_pc = managers.lootdrop:get_random_item_pc()
	data.coroutine = self:new_make_mass_drop(amount_lootdrops, item_pc, data)

	return true
end

function LootDropManager:fetch_mass_lootdrops(data)
	if data and data.coroutine then
		local status = coroutine.status(data.coroutine)

		if status == "dead" then
			local lootdrops = {
				items = clone(data.items)
			}

			table.list_append(lootdrops.items, data.special_rewards or {})

			lootdrops.cash = data.cash
			lootdrops.xp = data.xp
			local amount_coins = data.coins or 0

			if amount_coins > 0 then
				lootdrops.coins = data.coins
			end

			data.coroutine = false

			return lootdrops
		elseif status == "suspended" then
			coroutine.resume(data.coroutine)
		end

		return false
	end

	return {}
end
