function NewRaycastWeaponBase:set_scope_enabled(enabled)
	print("[ScopeBase] set_scope_enabled", enabled)

	if self:is_npc() then
		print("[ScopeBase] is_npc does not use PiP scope")

		return
	end

	if self._scope_camera_configuration and _G.IS_VR then
		local camera
		local user_unit = managers.player:player_unit()

		if not user_unit then
			camera = managers.menu:player()
		else
			camera = user_unit:camera()
		end

		print("[ScopeBase] preparing to use PiP scope. camera:", camera)

		if camera then
			if enabled then
				local config = self._scope_camera_configuration

				camera:link_scope(config.a_camera, config.a_screen, config.material, config.channel, config.fov)

				self.pip_camera_linked = true
			else
				camera:unlink_scope()

				self.pip_camera_linked = nil
			end
		end
	end
end

function NewRaycastWeaponBase:configure_scope()
	if self:is_npc() then
		return
	end

	local parts_tweak = tweak_data.weapon.factory.parts

	for part_id, part in pairs(self._parts) do
		if parts_tweak[part_id] and parts_tweak[part_id].camera then
			local camera = parts_tweak[part_id] and parts_tweak[part_id].camera

			if camera then
				local config = {}

				config.a_camera = part.unit:get_object(Idstring(camera.a_camera))
				config.a_screen = part.unit:get_object(Idstring(camera.a_screen))

				local material
				local material_name = Idstring(camera.material)
				local material_config = part.unit:get_objects_by_type(IDS_MATERIAL)

				for _, _material in ipairs(material_config) do
					if _material:name() == material_name then
						material = _material

						break
					end
				end

				config.material = material
				config.channel = Idstring(camera.channel)
				config.fov = camera.fov or 20
				self._scope_camera_configuration = config

				break
			end
		end
	end
end
