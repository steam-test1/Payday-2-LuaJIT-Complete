core:module("CoreOverlayEffectManager")
core:import("CoreCode")

OverlayEffectManager = OverlayEffectManager or class()

function OverlayEffectManager:init()
	local gui = Overlay:newgui()
	self._vp_overlay = Application:create_scene_viewport(0, 0, 1, 1)
	self._overlay_camera = Overlay:create_camera()

	self._vp_overlay:set_camera(self._overlay_camera)

	self._ws = gui:create_screen_workspace()

	self._ws:set_timer(TimerManager:main())

	self._playing_effects = {}
	self._playing_effects_external = {}
	self._paused = nil
	self._presets = {}

	self:add_preset("custom", {
		blend_mode = "normal",
		fade_in = 0,
		sustain = 0,
		fade_out = 0,
		color = Color(1, 0, 0, 0)
	})
	self:set_default_layer(30)
	managers.viewport:add_resolution_changed_func(callback(self, self, "change_resolution"))
end

function OverlayEffectManager:set_visible(visible)
	self._ws:panel():set_visible(visible)
end

function OverlayEffectManager:add_preset(name, settings)
	self._presets[name] = settings
end

function OverlayEffectManager:presets()
	return self._presets
end

function OverlayEffectManager:set_default_layer(layer)
	self._default_layer = layer
end

function OverlayEffectManager:update(t, dt)
	self._vp_overlay:update()
	self:check_pause_state()
	self:progress_effects(t, dt)
end

function OverlayEffectManager:destroy()
	if CoreCode.alive(self._overlay_camera) then
		Overlay:delete_camera(self._overlay_camera)

		self._overlay_camera = nil
	end

	if self._vp_overlay then
		Application:destroy_viewport(self._vp_overlay)

		self._vp_overlay = nil
	end

	if CoreCode.alive(self._ws) then
		Overlay:newgui():destroy_workspace(self._ws)

		self._ws = nil
	end
end

function OverlayEffectManager:render()
	if Global.render_debug.render_overlay then
		Application:render("Overlay", self._vp_overlay)
	end
end

function OverlayEffectManager:progress_effects(t, dt, paused)
	for key, effect in pairs(self._playing_effects) do
		local data = effect.data

		if not paused or data.play_paused then
			local eff_t = data.timer and data.timer:time() or paused and TimerManager:game():time() or t
			local fade_in_end_t = effect.start_t + data.fade_in
			local sustain_end_t = data.sustain and fade_in_end_t + data.sustain
			local effect_end_t = sustain_end_t and sustain_end_t + data.fade_out
			local new_alpha = nil

			if eff_t < fade_in_end_t then
				new_alpha = (eff_t - effect.start_t) / data.fade_in
			elseif not sustain_end_t or eff_t < sustain_end_t then
				new_alpha = 1
			elseif eff_t < effect_end_t then
				new_alpha = 1 - (eff_t - sustain_end_t) / data.fade_out
			else
				self._ws:panel():remove(effect.rectangle)
				self._ws:panel():remove(effect.text)

				if effect.video then
					self._ws:panel():remove(effect.video)
				end

				self._playing_effects[key] = nil
			end

			if new_alpha then
				new_alpha = new_alpha * data.color.alpha
				effect.current_alpha = new_alpha

				if effect.gradient_points then
					for i = 2, #effect.gradient_points, 2 do
						effect.gradient_points[i] = effect.gradient_points[i]:with_alpha(new_alpha)
					end

					effect.rectangle:set_gradient_points(effect.gradient_points)
				else
					effect.rectangle:set_color(data.color:with_alpha(new_alpha))
				end

				effect.text:set_color((data.text_color or Color.white):with_alpha(new_alpha * (data.text_color and data.text_color.alpha or 1)))
			end
		end
	end
end

function OverlayEffectManager:paused_update(t, dt)
	self:check_pause_state(true)
	self:progress_effects(t, dt, true)
end

function OverlayEffectManager:check_pause_state(paused)
	if self._paused then
		if not paused then
			for key, effect in pairs(self._playing_effects) do
				effect.rectangle:show()
				effect.text:show()
			end

			self._paused = nil
		end
	elseif paused then
		for _, effect in pairs(self._playing_effects) do
			if not effect.data.play_paused then
				effect.rectangle:hide()
				effect.text:hide()
			end
		end

		self._paused = true
	end
end

function OverlayEffectManager:play_effect(data)
	if data then
		local spawn_alpha = data.color.alpha * (data.fade_in > 0 and 0 or 1)
		local rectangle = nil

		if data.gradient_points then
			rectangle = self._ws:panel():gradient({
				w = RenderSettings.resolution.x,
				h = RenderSettings.resolution.y,
				color = data.color:with_alpha(spawn_alpha),
				gradient_points = data.gradient_points,
				orientation = data.orientation
			})
		else
			rectangle = self._ws:panel():rect({
				w = RenderSettings.resolution.x,
				h = RenderSettings.resolution.y,
				color = data.color:with_alpha(spawn_alpha)
			})
		end

		rectangle:set_layer(self._default_layer)
		rectangle:set_blend_mode(data.blend_mode)

		if data.play_paused or not self._paused then
			rectangle:show()
		else
			rectangle:hide()
		end

		local text_string = data.text and (data.localize and managers.localization and managers.localization:text(data.text) or data.text) or ""

		if data.text_to_upper then
			text_string = utf8.to_upper(text_string)
		end

		if _G.IS_VR then
			text_string = nil
		end

		local text = self._ws:panel():text({
			vertical = "center",
			valign = "center",
			align = "center",
			halign = "center",
			text = text_string,
			font = data.font or "core/fonts/system_font",
			font_size = data.font_size or 21,
			blend_mode = data.text_blend_mode or data.blend_mode or "normal",
			color = (data.text_color or Color.white):with_alpha(spawn_alpha * (data.text_color and data.text_color.alpha or 1)),
			layer = self._default_layer + 1
		})
		local effect = {
			rectangle = rectangle,
			text = text,
			start_t = (data.timer or TimerManager:game()):time(),
			data = {},
			current_alpha = spawn_alpha,
			gradient_points = data.gradient_points
		}

		if data.video then
			effect.video = self._ws:panel():video({
				valign = "center",
				vertical = "center",
				align = "center",
				loop = false,
				halign = "center",
				video = data.video,
				width = data.video_width,
				height = data.video_height,
				layer = self._default_layer + 1
			})
		end

		for key, value in pairs(data) do
			effect.data[key] = value
		end

		local id = 1

		while self._playing_effects[id] do
			id = id + 1
		end

		table.insert(self._playing_effects, id, effect)

		return id
	else
		cat_error("georgios", "OverlayEffectManager, no effect_data sent to play_effect")
	end
end

function OverlayEffectManager:stop_effect(id)
	if id then
		if self._playing_effects[id] then
			self._ws:panel():remove(self._playing_effects[id].rectangle)
			self._ws:panel():remove(self._playing_effects[id].text)

			if self._playing_effects[id].video then
				self._ws:panel():remove(self._playing_effects[id].video)
			end

			self._playing_effects[id] = nil
		end
	else
		for key, effect in pairs(self._playing_effects) do
			self._ws:panel():remove(effect.rectangle)
			self._ws:panel():remove(effect.text)

			if effect.video then
				self._ws:panel():remove(effect.video)
			end
		end

		self._playing_effects = {}
	end
end

function OverlayEffectManager:fade_out_effect(id)
	if id then
		local effect = self._playing_effects[id]

		if effect then
			effect.start_t = (effect.data.timer or TimerManager:game()):time()
			effect.data.sustain = 0
			effect.data.fade_in = 0
			effect.data.color = effect.data.color:with_alpha(effect.current_alpha)
		end
	else
		for key, effect in pairs(self._playing_effects) do
			effect.start_t = (effect.data.timer or TimerManager:game()):time()
			effect.data.sustain = 0
			effect.data.fade_in = 0
			effect.data.color = effect.data.color:with_alpha(effect.current_alpha)
		end
	end
end

function OverlayEffectManager:change_resolution()
	local res = RenderSettings.resolution

	for _, effect in pairs(self._playing_effects) do
		effect.rectangle:configure({
			w = res.x,
			h = res.y
		})
	end

	for _, effect in pairs(self._playing_effects_external) do
		effect.rectangle:configure({
			w = res.x,
			h = res.y
		})
	end
end

function OverlayEffectManager:add_effect_external(data)
	if not data then
		Application:error("[OverlayEffectManager:add_effect_external] No data passed to play effect.")

		return
	end

	local spawn_alpha = data.alpha_start or 0
	local spawn_show = spawn_alpha > 0
	local rectangle = nil

	if data.gradient_points then
		rectangle = self._ws:panel():gradient({
			w = RenderSettings.resolution.x,
			h = RenderSettings.resolution.y,
			color = data.color:with_alpha(spawn_alpha),
			gradient_points = data.gradient_points,
			orientation = data.orientation
		})
	else
		rectangle = self._ws:panel():rect({
			w = RenderSettings.resolution.x,
			h = RenderSettings.resolution.y,
			color = data.color:with_alpha(spawn_alpha)
		})
	end

	rectangle:set_layer(data.layer or self._default_layer)
	rectangle:set_blend_mode(data.blend_mode)

	if spawn_show then
		rectangle:show()
	else
		rectangle:hide()
	end

	local text_string = data.text and (data.localize and managers.localization and managers.localization:text(data.text) or data.text)

	if _G.IS_VR then
		text_string = nil
	end

	if text_string and data.text_to_upper then
		text_string = utf8.to_upper(text_string)
	end

	local text = nil

	if text_string then
		text = self._ws:panel():text({
			vertical = "center",
			valign = "center",
			align = "center",
			halign = "center",
			text = text_string,
			font = data.font or "core/fonts/system_font",
			font_size = data.font_size or 21,
			blend_mode = data.text_blend_mode or data.blend_mode or "normal",
			color = (data.text_color or Color.white):with_alpha(spawn_alpha * (data.text_color and data.text_color.alpha or 1)),
			layer = self._default_layer + 1
		})

		if spawn_show then
			text:show()
		else
			text:hide()
		end
	end

	local effect = {
		rectangle = rectangle,
		text = text,
		start_t = (data.timer or TimerManager:game()):time(),
		data = {},
		current_alpha = spawn_alpha,
		gradient_points = data.gradient_points,
		hidden = not spawn_show
	}

	if data.video then
		effect.video = self._ws:panel():video({
			valign = "center",
			vertical = "center",
			align = "center",
			loop = false,
			halign = "center",
			video = data.video,
			width = data.video_width,
			height = data.video_height,
			layer = self._default_layer + 1
		})
	end

	for key, value in pairs(data) do
		effect.data[key] = value
	end

	local id = 1

	while self._playing_effects_external[id] do
		id = id + 1
	end

	table.insert(self._playing_effects_external, id, effect)

	return id
end

function OverlayEffectManager:modify_effect_color_external(id, new_color)
	local effect = self._playing_effects_external[id]

	if not effect then
		Application:error("[OverlayEffectManager:modify_effect_color_external] No effect found with id '" .. tostring(id) .. "'.")

		return
	end

	local data = effect.data

	if effect.gradient_points then
		if CoreClass.type_name(new_color) ~= "table" then
			Application:error("[OverlayEffectManager:modify_effect_color_external] Attempted to modify gradient points without sending a table. Type of parameter passed is '" .. CoreClass.type_name(new_color) .. "'.")

			return
		end

		data.gradient_points = new_color
		effect.gradient_points = new_color

		for i = 2, #effect.gradient_points, 2 do
			effect.gradient_points[i] = effect.gradient_points[i]:with_alpha(effect.current_alpha)
		end

		effect.rectangle:set_gradient_points(effect.gradient_points)
	else
		data.color = new_color

		effect.rectangle:set_color(data.color:with_alpha(effect.current_alpha))
	end
end

function OverlayEffectManager:remove_effect_external(id)
	local effect = self._playing_effects_external[id]

	if not effect then
		Application:error("[OverlayEffectManager:remove_effect_color_external] No effect found with id '" .. tostring(id) .. "'.")

		return
	end

	self._ws:panel():remove(effect.rectangle)

	if effect.text then
		self._ws:panel():remove(effect.text)
	end

	if effect.video then
		self._ws:panel():remove(effect.video)
	end

	self._playing_effects_external[id] = nil
end

function OverlayEffectManager:progress_effect_external(id, new_alpha)
	local effect = self._playing_effects_external[id]

	if not effect then
		Application:error("[OverlayEffectManager:progress_effect_external] No effect found with id '" .. tostring(id) .. "'.")

		return
	end

	local data = effect.data
	new_alpha = new_alpha * data.color.alpha
	effect.current_alpha = new_alpha

	if effect.gradient_points then
		for i = 2, #effect.gradient_points, 2 do
			effect.gradient_points[i] = effect.gradient_points[i]:with_alpha(new_alpha)
		end

		effect.rectangle:set_gradient_points(effect.gradient_points)
	else
		effect.rectangle:set_color(data.color:with_alpha(new_alpha))
	end

	if effect.text then
		effect.text:set_color((data.text_color or Color.white):with_alpha(new_alpha * (data.text_color and data.text_color.alpha or 1)))
	end

	if new_alpha > 0 then
		if effect.hidden then
			effect.hidden = false

			effect.rectangle:show()

			if effect.text then
				effect.text:show()
			end

			if effect.video then
				effect.video:show()
			end
		end
	elseif not effect.hidden then
		effect.hidden = true

		effect.rectangle:hide()

		if effect.text then
			effect.text:hide()
		end

		if effect.video then
			effect.video:hide()
		end
	end
end
