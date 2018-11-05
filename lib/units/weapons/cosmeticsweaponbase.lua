local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()

function NewRaycastWeaponBase:change_cosmetics(cosmetics, async_clbk)
	self:set_cosmetics_data(cosmetics)
	self:_apply_cosmetics(async_clbk or function ()
	end)
end

function NewRaycastWeaponBase:set_cosmetics_data(cosmetics)
	print("NewRaycastWeaponBase:set_cosmetics_data", "cosmetics_id", cosmetics and cosmetics.id or "NONE")

	if not cosmetics then
		self._cosmetics_id = nil
		self._cosmetics_quality = nil
		self._cosmetics_bonus = nil
		self._cosmetics_data = nil

		return
	end

	self._cosmetics_id = cosmetics and cosmetics.id
	self._cosmetics_quality = cosmetics and cosmetics.quality
	self._cosmetics_bonus = cosmetics and cosmetics.bonus
	self._cosmetics_data = self._cosmetics_id and tweak_data.blackmarket.weapon_skins[self._cosmetics_id]
end

function NewRaycastWeaponBase:get_cosmetics_bonus()
	return self._cosmetics_bonus
end

function NewRaycastWeaponBase:get_cosmetics_quality()
	return self._cosmetics_quality
end

function NewRaycastWeaponBase:get_cosmetics_id()
	return self._cosmetics_id
end

function NewRaycastWeaponBase:get_cosmetics_data()
	return self._cosmetics_data
end

function NewRaycastWeaponBase:_material_config_name(part_id, unit_name, use_cc_material_config, force_third_person)
	if self:is_npc() or force_third_person then
		if use_cc_material_config and tweak_data.weapon.factory.parts[part_id].cc_thq_material_config then
			return tweak_data.weapon.factory.parts[part_id].cc_thq_material_config
		end

		if tweak_data.weapon.factory.parts[part_id].thq_material_config then
			return tweak_data.weapon.factory.parts[part_id].thq_material_config
		end

		local cc_string = use_cc_material_config and "_cc" or ""
		local thq_string = (self:use_thq() or force_third_person) and "_thq" or ""

		return Idstring(unit_name .. cc_string .. thq_string)
	end

	if use_cc_material_config and tweak_data.weapon.factory.parts[part_id].cc_material_config then
		return tweak_data.weapon.factory.parts[part_id].cc_material_config
	end

	return Idstring(unit_name .. "_cc")
end

function NewRaycastWeaponBase:_update_materials()
	if not self._parts then
		return
	end

	local use = not self:is_npc() or self:use_thq()
	local use_cc_material_config = use and self._cosmetics_data and true or false
	local is_thq = self:is_npc() and self:use_thq()

	if is_thq or use_cc_material_config then
		if not self._materials then
			local material_config_ids = Idstring("material_config")

			for part_id, part in pairs(self._parts) do
				local part_data = managers.weapon_factory:get_part_data_by_part_id_from_weapon(part_id, self._factory_id, self._blueprint)

				if part_data then
					local new_material_config_ids = self:_material_config_name(part_id, part_data.unit, use_cc_material_config)

					if part.unit:material_config() ~= new_material_config_ids and DB:has(material_config_ids, new_material_config_ids) then
						part.unit:set_material_config(new_material_config_ids, true)
					end
				end
			end

			if use_cc_material_config then
				self._materials = {}
				self._materials_default = {}

				for part_id, part in pairs(self._parts) do
					local materials = part.unit:get_objects_by_type(Idstring("material"))

					for _, m in ipairs(materials) do
						if m:variable_exists(Idstring("wear_tear_value")) then
							self._materials[part_id] = self._materials[part_id] or {}
							self._materials[part_id][m:key()] = m
						end
					end
				end
			end
		end
	elseif self._materials then
		local material_config_ids = Idstring("material_config")

		for part_id, part in pairs(self._parts) do
			if tweak_data.weapon.factory.parts[part_id] then
				local new_material_config_ids = tweak_data.weapon.factory.parts[part_id].material_config or Idstring(self:is_npc() and tweak_data.weapon.factory.parts[part_id].third_unit or tweak_data.weapon.factory.parts[part_id].unit)

				if part.unit:material_config() ~= new_material_config_ids and DB:has(material_config_ids, new_material_config_ids) then
					part.unit:set_material_config(new_material_config_ids, true)
				end
			end
		end

		self._materials = nil
	end
end
local material_defaults = {
	diffuse_layer1_texture = Idstring("units/payday2_cash/safes/default/base_gradient/base_default_df"),
	diffuse_layer2_texture = Idstring("units/payday2_cash/safes/default/pattern_gradient/gradient_default_df"),
	diffuse_layer0_texture = Idstring("units/payday2_cash/safes/default/pattern/pattern_default_df"),
	diffuse_layer3_texture = Idstring("units/payday2_cash/safes/default/sticker/sticker_default_df")
}
local material_textures = {
	pattern = "diffuse_layer0_texture",
	sticker = "diffuse_layer3_texture",
	pattern_gradient = "diffuse_layer2_texture",
	base_gradient = "diffuse_layer1_texture"
}
local material_variables = {
	cubemap_pattern_control = "cubemap_pattern_control",
	pattern_pos = "pattern_pos",
	uv_scale = "uv_scale",
	uv_offset_rot = "uv_offset_rot",
	pattern_tweak = "pattern_tweak",
	wear_and_tear = (managers.blackmarket and managers.blackmarket:skin_editor() and managers.blackmarket:skin_editor():active() or Application:production_build()) and "wear_tear_value" or nil
}

function NewRaycastWeaponBase:_apply_cosmetics(async_clbk)
	material_variables.wear_and_tear = (managers.blackmarket and managers.blackmarket:skin_editor() and managers.blackmarket:skin_editor():active() or Application:production_build()) and "wear_tear_value" or nil

	self:_update_materials()

	local cosmetics_data = self:get_cosmetics_data()

	if not self._parts or not cosmetics_data or not self._materials or table.size(self._materials) == 0 then
		if async_clbk then
			async_clbk()
		end

		return
	end

	local texture_load_result_clbk = async_clbk and callback(self, self, "clbk_texture_loaded", async_clbk)
	local textures = {}
	local base_variable, base_texture, mat_variable, mat_texture, type_variable, type_texture, p_type, custom_variable, texture_key = nil
	local wear_tear_value = self._cosmetics_quality and tweak_data.economy.qualities[self._cosmetics_quality] and tweak_data.economy.qualities[self._cosmetics_quality].wear_tear_value or 1

	for part_id, materials in pairs(self._materials) do
		for _, material in pairs(materials) do
			material:set_variable(Idstring("wear_tear_value"), wear_tear_value)

			p_type = managers.weapon_factory:get_type_from_part_id(part_id)

			for key, variable in pairs(material_variables) do
				mat_variable = cosmetics_data.parts and cosmetics_data.parts[part_id] and cosmetics_data.parts[part_id][material:name():key()] and cosmetics_data.parts[part_id][material:name():key()][key]
				type_variable = cosmetics_data.types and cosmetics_data.types[p_type] and cosmetics_data.types[p_type][key]
				base_variable = cosmetics_data[key]

				if mat_variable or type_variable or base_variable then
					material:set_variable(Idstring(variable), mat_variable or type_variable or base_variable)
				end
			end

			for key, material_texture in pairs(material_textures) do
				mat_texture = cosmetics_data.parts and cosmetics_data.parts[part_id] and cosmetics_data.parts[part_id][material:name():key()] and cosmetics_data.parts[part_id][material:name():key()][key]
				type_texture = cosmetics_data.types and cosmetics_data.types[p_type] and cosmetics_data.types[p_type][key]
				base_texture = cosmetics_data[key]

				if mat_texture or type_texture or base_texture then
					texture_key = mat_texture and mat_texture:key() or type_texture and type_texture:key() or base_texture and base_texture:key()
					textures[texture_key] = textures[texture_key] or {
						applied = false,
						ready = false,
						name = mat_texture or type_texture or base_texture
					}

					if type(textures[texture_key].name) == "string" then
						textures[texture_key].name = Idstring(textures[texture_key].name)
					end
				end
			end
		end
	end

	for key, old_texture in pairs(self._textures) do
		if not textures[key] and not old_texture.applied then
			TextureCache:unretrieve(old_texture.name)
		end
	end

	self._textures = textures
	self._requesting = async_clbk and true

	for tex_key, texture_data in pairs(self._textures) do
		if async_clbk then
			if not texture_data.ready then
				if DB:has(Idstring("texture"), texture_data.name) then
					TextureCache:request(texture_data.name, "normal", texture_load_result_clbk, 90)
				else
					Application:error("[NewRaycastWeaponBase:_apply_cosmetics] Weapon cosmetics tried to use no-existing texture!", "texture", texture_data.name)
				end
			end
		else
			texture_data.ready = true
		end
	end

	self._requesting = nil

	self:_chk_load_complete(async_clbk)
end

function NewRaycastWeaponBase:clbk_texture_loaded(async_clbk, tex_name)
	if not alive(self._unit) then
		return
	end

	local texture_data = self._textures[tex_name:key()]

	if texture_data and not texture_data.ready then
		texture_data.ready = true
	end

	self:_chk_load_complete(async_clbk)
end

function NewRaycastWeaponBase:_chk_load_complete(async_clbk)
	if self._requesting then
		return
	end

	for tex_id, texture_data in pairs(self._textures) do
		if not texture_data.ready then
			return
		end
	end

	self:_set_material_textures()

	if async_clbk then
		async_clbk()
	end
end

function NewRaycastWeaponBase:_set_material_textures()
	local cosmetics_data = self:get_cosmetics_data()

	if not self._parts or not cosmetics_data or not self._materials or table.size(self._materials) == 0 then
		return
	end

	local p_type, base_texture, mat_texture, type_texture, new_texture = nil

	for part_id, materials in pairs(self._materials) do
		p_type = managers.weapon_factory:get_type_from_part_id(part_id)

		for _, material in pairs(materials) do
			for key, material_texture in pairs(material_textures) do
				mat_texture = cosmetics_data.parts and cosmetics_data.parts[part_id] and cosmetics_data.parts[part_id][material:name():key()] and cosmetics_data.parts[part_id][material:name():key()][key]
				type_texture = cosmetics_data.types and cosmetics_data.types[p_type] and cosmetics_data.types[p_type][key]
				base_texture = cosmetics_data[key]
				new_texture = mat_texture or type_texture or base_texture or material_defaults[material_texture]

				if type(new_texture) == "string" then
					new_texture = Idstring(new_texture)
				end

				if new_texture then
					Application:set_material_texture(material, Idstring(material_texture), new_texture, Idstring("normal"))
				end
			end
		end
	end

	for tex_id, texture_data in pairs(self._textures) do
		if not texture_data.applied then
			texture_data.applied = true

			TextureCache:unretrieve(texture_data.name)
		end
	end
end

