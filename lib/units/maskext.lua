require("lib/managers/BlackMarketManager")

MaskExt = MaskExt or class()
local mvec1 = Vector3()
local mvec2 = Vector3()
local mvec3 = Vector3()
local IDS_BASE = Idstring("base")
local IDS_MATERIAL = Idstring("material")
local IDS_NORMAL = Idstring("normal")
local IDS_MATERIAL_AMOUNT = Idstring("material_amount")
local IDS_TINT_COLOR_A = Idstring("tint_color_a")
local IDS_TINT_COLOR_B = Idstring("tint_color_b")
local IDS_REFLECTION_TEXTURE = Idstring("reflection_texture")
local IDS_MATERIAL_TEXTURE = Idstring("material_texture")
local IDS_DIFFUSE_LAYER0_TEXTURE = Idstring("diffuse_layer0_texture")
local IDS_DIFFUSE_LAYER1_TEXTURE = Idstring("diffuse_layer1_texture")
local IDS_DIFFUSE_LAYER2_TEXTURE = Idstring("diffuse_layer2_texture")
local IDS_MATERIAL_AMOUNTS = Idstring("material_amounts")
local IDS_MATCAP_PLASTIC_DF = Idstring("units/payday2/matcaps/matcap_plastic_df")
local IDS_RT_OLD = Idstring("solid_mask")
local IDS_RT_NEW = Idstring("solid_mask:MATS_3")
local IDS_RT_DEPTH_OLD = Idstring("solid_mask:DEPTH_SCALING")
local IDS_RT_DEPTH_NEW = Idstring("solid_mask:DEPTH_SCALING:MATS_3")
local MATCAP_MODE_TILE = 0
local MATCAP_MODE_MATCAP = 1
local MATCAP_MODE_STRIP = 2

function MaskExt:init(unit)
	self._unit = unit
	self._textures = {}
	self._materials = nil
	self._materials_mat3 = nil

	self:_init_tintable_materials()
	unit:set_extension_update_enabled(IDS_BASE, false)
end

function MaskExt:_init_tintable_materials()
	local tmp_mat_tintables_a = self.mat_tintables_a and string.split(self.mat_tintables_a, ";") or false

	if tmp_mat_tintables_a then
		self._mat_tintables_a = {}
		self._mat_tintables_a_default = {}

		for _, v in ipairs(tmp_mat_tintables_a) do
			local split = string.split(v, ":")
			self._mat_tintables_a[split[1]] = split[2]
			self._mat_tintables_a_default[split[1]] = self._unit:material(Idstring(split[1])):get_variable(Idstring(split[2]))
		end
	end

	local tmp_mat_tintables_b = self.mat_tintables_b and string.split(self.mat_tintables_b, ";") or false

	if tmp_mat_tintables_b then
		self._mat_tintables_b = {}
		self._mat_tintables_b_default = {}

		for _, v in ipairs(tmp_mat_tintables_b) do
			local split = string.split(v, ":")
			self._mat_tintables_b[split[1]] = split[2]
			self._mat_tintables_b_default[split[1]] = self._unit:material(Idstring(split[1])):get_variable(Idstring(split[2]))
		end
	end
end

function MaskExt:swap_to_fps()
	local glass_id_string = Idstring("glass")
	local mtr_hair_solid_id_string = Idstring("mtr_hair_solid")
	local mtr_hair_effect_id_string = Idstring("mtr_hair_effect")
	local mtr_bloom_glow_id_string = Idstring("mtr_bloom_glow")
	local mtr_opacity = Idstring("mtr_opacity")
	local mtr_feathers = Idstring("mtr_feathers")
	local mat_shadow = Idstring("mat_shadow")
	local glow_id_strings = {}
	local sweep_id_strings = {}
	local glow_tint_stat_id_strings = {}
	local glow_tint_anim_id_strings = {}

	for i = 1, 5 do
		sweep_id_strings[Idstring("sweep" .. tostring(i)):key()] = true
		glow_id_strings[Idstring("glow" .. tostring(i)):key()] = true
		glow_tint_stat_id_strings[Idstring("mat_glow_static_" .. tostring(i)):key()] = true
		glow_tint_anim_id_strings[Idstring("mat_glow_anim_" .. tostring(i)):key()] = true
	end

	for _, material in ipairs(self._unit:get_objects_by_type(IDS_MATERIAL)) do
		if material:name() ~= mtr_hair_solid_id_string and material:name() ~= mtr_opacity and material:name() ~= mtr_feathers and material:name() ~= mtr_hair_effect_id_string and not glow_tint_stat_id_strings[material:name():key()] then
			if glow_tint_anim_id_strings[material:name():key()] then
				-- Nothing
			elseif material:name() == glass_id_string then
				material:set_render_template(Idstring("opacity:CUBE_ENVIRONMENT_MAPPING:CUBE_FRESNEL:DIFFUSE_TEXTURE:FPS"))
			elseif material:name() == mat_shadow then
				print("[MASK]  SHADOW MATERIAL")
				material:set_render_template(Idstring("effect:DIFFUSE0_TEXTURE:FPS:INTERSECTION_FADEOUT"))
			elseif material:name() == mtr_bloom_glow_id_string then
				material:set_render_template(Idstring("generic:DEPTH_SCALING:DIFFUSE_TEXTURE:SELF_ILLUMINATION:SELF_ILLUMINATION_BLOOM"))
			elseif glow_id_strings[material:name():key()] then
				material:set_render_template(Idstring("effect:BLEND_ADD:DIFFUSE0_TEXTURE"))
			elseif sweep_id_strings[material:name():key()] then
				material:set_render_template(Idstring("effect:BLEND_ADD:DIFFUSE0_TEXTURE:DIFFUSE0_THRESHOLD_SWEEP"))
			elseif material:render_template() == IDS_RT_OLD then
				material:set_render_template(IDS_RT_DEPTH_OLD)
			else
				material:set_render_template(IDS_RT_DEPTH_NEW)
			end
		end
	end
end

function MaskExt:apply_blueprint(blueprint, async_clbk)
	if not blueprint then
		Application:error("[MaskExt:apply_blueprint] NO BLUEPRINT GIVEN!!")

		return
	end

	local td_bm_mats = tweak_data.blackmarket.materials
	local texture_load_result_clbk = async_clbk and callback(self, self, "clbk_texture_loaded", async_clbk)

	if not self._materials and not self._materials_mat3 then
		local materials = self._unit:get_objects_by_type(IDS_MATERIAL)
		self._materials = {}
		self._materials_mat3 = {}

		for _, material in ipairs(materials) do
			if material:variable_exists(IDS_MATERIAL_AMOUNTS) then
				table.insert(self._materials_mat3, material)
			elseif material:variable_exists(IDS_MATERIAL_AMOUNT) then
				table.insert(self._materials, material)
				Application:warn("[MaskExt] Using outdated material modes, please update this mask to use solid_mask:MATS_3 render template", self._unit)
			end
		end
	end

	local material_id = blueprint.material.id
	local pattern_id = blueprint.pattern.id
	local color_a_id = blueprint.color_a.id
	local color_b_id = blueprint.color_b.id
	local color_c_id = blueprint.color_c and blueprint.color_c.id or "strip_paint"
	self._tint_color_a = mvec1
	self._tint_color_b = mvec2
	self._tint_color_c = mvec3
	local material_data = td_bm_mats[material_id]
	local color_a_data = td_bm_mats[color_a_id]
	local color_b_data = td_bm_mats[color_b_id]
	local color_c_data = td_bm_mats[color_c_id]

	if not material_data then
		Application:error("Missing material id", blueprint.material.id)

		return
	end

	if not color_a_data and color_a_id ~= "nothing" then
		Application:error("Missing color_a id", blueprint.color_a.id)
	end

	if not color_b_data and color_b_id ~= "nothing" then
		Application:error("Missing color_b id", blueprint.color_b.id)
	end

	if not color_c_data and color_c_id ~= "nothing" then
		Application:error("Missing color_c id", blueprint.color_c.id)
	end

	mvector3.set_static(self._tint_color_a, (color_a_data and color_a_data.color or Color.red):unpack())
	mvector3.set_static(self._tint_color_b, (color_b_data and color_b_data.color or Color.green):unpack())
	mvector3.set_static(self._tint_color_c, (color_c_data and color_c_data.color or Color.blue):unpack())

	if material_id ~= "nothing" then
		local old_reflection = self._textures.reflection and self._textures.reflection.name
		local new_reflection = Idstring(material_data.texture)

		if old_reflection ~= new_reflection then
			self._textures.reflection = {
				texture = false,
				ready = 0,
				name = new_reflection,
				target = IDS_REFLECTION_TEXTURE
			}
		end
	end

	local old_pattern = self._textures.pattern and self._textures.pattern.name
	local new_pattern = Idstring(tweak_data.blackmarket.textures[pattern_id].texture)

	if old_pattern ~= new_pattern then
		self._textures.pattern = {
			texture = false,
			ready = 0,
			name = new_pattern,
			target = IDS_MATERIAL_TEXTURE
		}
	end

	if color_a_id ~= "nothing" then
		local old_color_a = self._textures.new_color_a and self._textures.new_color_a.name
		local new_color_a = Idstring(color_a_data.texture)

		if old_color_a ~= new_color_a then
			self._textures.color_a = {
				texture = false,
				ready = 0,
				name = new_color_a,
				target = IDS_DIFFUSE_LAYER0_TEXTURE
			}
		end
	end

	if color_b_id ~= "nothing" then
		local old_color_b = self._textures.new_color_b and self._textures.new_color_b.name
		local new_color_b = Idstring(color_b_data.texture)

		if old_color_b ~= new_color_b then
			self._textures.color_b = {
				texture = false,
				ready = 0,
				name = new_color_b,
				target = IDS_DIFFUSE_LAYER1_TEXTURE
			}
		end
	end

	if color_c_id ~= "nothing" then
		local old_color_c = self._textures.new_color_c and self._textures.new_color_c.name
		local new_color_c = Idstring(color_c_data.texture)

		if old_color_c ~= new_color_c then
			self._textures.color_c = {
				texture = false,
				ready = 0,
				name = new_color_c,
				target = IDS_DIFFUSE_LAYER2_TEXTURE
			}
		end
	end

	self._material_amount = material_data.material_amount or MATCAP_MODE_MATCAP
	self._material_amounts = Vector3(color_a_data and color_a_data.material_amount or MATCAP_MODE_MATCAP, color_b_data and color_b_data.material_amount or MATCAP_MODE_MATCAP, color_c_data and color_c_data.material_amount or MATCAP_MODE_MATCAP)

	if (not blueprint.color_a or blueprint.color_a.id ~= "nothing") and self._mat_tintables_a and not color_a_data.does_not_apply_color then
		for mat_name, value_id in pairs(self._mat_tintables_a) do
			local material = self._unit:material(Idstring(mat_name))

			material:set_variable(Idstring(value_id), self._tint_color_a)
		end
	elseif self._mat_tintables_a_default then
		for mat_name, original_value in pairs(self._mat_tintables_a_default) do
			local material = self._unit:material(Idstring(mat_name))
			local variable_name = self._mat_tintables_a[mat_name]

			material:set_variable(Idstring(variable_name), original_value)
		end
	end

	if (not blueprint.color_b or blueprint.color_b.id ~= "nothing") and self._mat_tintables_b and not color_b_data.does_not_apply_color then
		for mat_name, value_id in pairs(self._mat_tintables_b) do
			local material = self._unit:material(Idstring(mat_name))

			material:set_variable(Idstring(value_id), self._tint_color_b)
		end
	elseif self._mat_tintables_b_default then
		for mat_name, original_value in pairs(self._mat_tintables_b_default) do
			local material = self._unit:material(Idstring(mat_name))
			local variable_name = self._mat_tintables_b[mat_name]

			material:set_variable(Idstring(variable_name), original_value)
		end
	end

	if not async_clbk then
		self:_apply_mask_variables()
	end

	self._requesting = async_clbk and true

	for tex_id, texture_data in pairs(self._textures) do
		if async_clbk then
			if not texture_data.ready or texture_data.ready <= 0 then
				TextureCache:request(texture_data.name, "normal", texture_load_result_clbk, 90)
			end
		else
			self:_apply_mask_textures(texture_data)
		end
	end

	self._requesting = nil

	if async_clbk then
		self:_chk_load_complete(async_clbk)
	end
end

function MaskExt:_apply_mask_textures(texture_data)
	texture_data.ready = texture_data.ready and texture_data.ready + 1 or 1

	for _, material in ipairs(self._materials_mat3) do
		Application:set_material_texture(material, texture_data.target, texture_data.name, IDS_NORMAL, 0)
	end

	for _, material in ipairs(self._materials) do
		Application:set_material_texture(material, texture_data.target, texture_data.name, IDS_NORMAL, 0)
	end
end

function MaskExt:_apply_mask_variables()
	for _, material in ipairs(self._materials_mat3 or {}) do
		material:set_variable(IDS_MATERIAL_AMOUNT, self._material_amount or 1)
		material:set_variable(IDS_MATERIAL_AMOUNTS, self._material_amounts or Vector3(1, 1, 1))
	end

	for _, material in ipairs(self._materials or {}) do
		material:set_variable(IDS_TINT_COLOR_A, self._tint_color_a)
		material:set_variable(IDS_TINT_COLOR_B, self._tint_color_b)
		material:set_variable(IDS_MATERIAL_AMOUNT, self._material_amount and math.clamp(self._material_amount, 0, 1) or 1)
	end
end

function MaskExt:clbk_texture_loaded(async_clbk, tex_name)
	if not alive(self._unit) then
		return
	end

	for tex_id, texture_data in pairs(self._textures) do
		if texture_data.name == tex_name and (not texture_data.ready or texture_data.ready <= 0) then
			self:_apply_mask_textures(texture_data)
		end
	end

	self:_chk_load_complete(async_clbk)
end

function MaskExt:_chk_load_complete(async_clbk)
	if self._requesting then
		return
	end

	for tex_id, texture_data in pairs(self._textures) do
		if not texture_data.ready or texture_data.ready <= 0 then
			return
		end
	end

	self:_apply_mask_variables()

	self._materials = nil
	self._materials_mat3 = nil

	async_clbk()
end

function MaskExt:destroy(unit)
	for tex_id, texture_data in pairs(self._textures) do
		if not texture_data.ready or texture_data.ready <= 0 then
			TextureCache:unretrieve(texture_data.name)
		end
	end

	self._textures = {}
end
