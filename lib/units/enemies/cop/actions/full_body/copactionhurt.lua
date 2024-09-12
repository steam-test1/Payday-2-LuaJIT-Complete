local mvec3_set = mvector3.set
local mvec3_set_z = mvector3.set_z
local mvec3_set_l = mvector3.set_length
local mvec3_sub = mvector3.subtract
local mvec3_add = mvector3.add
local mvec3_mul = mvector3.multiply
local mvec3_dot = mvector3.dot
local mvec3_cross = mvector3.cross
local mvec3_norm = mvector3.normalize
local mvec3_dir = mvector3.direction
local mvec3_rand_orth = mvector3.random_orthogonal
local mvec3_dis = mvector3.distance
local tmp_vec1 = Vector3()
local tmp_vec2 = Vector3()
local tmp_vec3 = Vector3()
CopActionHurt = CopActionHurt or class()
CopActionHurt.running_death_anim_variants = {
	male = 26,
	female = 5
}
CopActionHurt.death_anim_variants = {
	normal = {
		crouching = {
			fwd = {
				high = 14,
				low = 5
			},
			bwd = {
				high = 3,
				low = 1
			},
			l = {
				high = 3,
				low = 1
			},
			r = {
				high = 3,
				low = 1
			}
		},
		not_crouching = {
			fwd = {
				high = 13,
				low = 6
			},
			bwd = {
				high = 3,
				low = 2
			},
			l = {
				high = 3,
				low = 1
			},
			r = {
				high = 3,
				low = 1
			}
		}
	},
	heavy = {
		crouching = {
			fwd = {
				high = 7,
				low = 2
			},
			bwd = {
				high = 3,
				low = 1
			},
			l = {
				high = 3,
				low = 1
			},
			r = {
				high = 3,
				low = 1
			}
		},
		not_crouching = {
			fwd = {
				high = 6,
				low = 2
			},
			bwd = {
				high = 1,
				low = 1
			},
			l = {
				high = 1,
				low = 1
			},
			r = {
				high = 1,
				low = 1
			}
		}
	}
}
CopActionHurt.death_anim_fe_variants = {
	normal = {
		crouching = {
			fwd = {
				high = 5,
				low = 2
			},
			bwd = {
				high = 2,
				low = 0
			},
			l = {
				high = 2,
				low = 0
			},
			r = {
				high = 2,
				low = 0
			}
		},
		not_crouching = {
			fwd = {
				high = 6,
				low = 2
			},
			bwd = {
				high = 3,
				low = 0
			},
			l = {
				high = 2,
				low = 0
			},
			r = {
				high = 2,
				low = 0
			}
		}
	},
	heavy = {
		crouching = {
			fwd = {
				high = 0,
				low = 0
			},
			bwd = {
				high = 0,
				low = 0
			},
			l = {
				high = 0,
				low = 0
			},
			r = {
				high = 0,
				low = 0
			}
		},
		not_crouching = {
			fwd = {
				high = 0,
				low = 0
			},
			bwd = {
				high = 0,
				low = 0
			},
			l = {
				high = 0,
				low = 0
			},
			r = {
				high = 0,
				low = 0
			}
		}
	}
}
CopActionHurt.hurt_anim_variants_highest_num = 21
CopActionHurt.hurt_anim_variants = {
	hurt = {
		not_crouching = {
			fwd = {
				high = 13,
				low = 5
			},
			bwd = {
				high = 5,
				low = 2
			},
			l = {
				high = 5,
				low = 2
			},
			r = {
				high = 5,
				low = 2
			}
		}
	},
	heavy_hurt = {
		not_crouching = {
			fwd = {
				high = 21,
				low = 7
			},
			bwd = {
				high = 14,
				low = 7
			},
			l = {
				high = 11,
				low = 4
			},
			r = {
				high = 11,
				low = 4
			}
		}
	},
	expl_hurt = {
		not_crouching = {
			fwd = {
				high = 15,
				low = 15
			},
			bwd = {
				high = 15,
				low = 15
			},
			l = {
				high = 13,
				low = 13
			},
			r = {
				high = 13,
				low = 13
			}
		}
	},
	concussion = {
		not_crouching = {
			fwd = {
				high = 6,
				low = 6
			},
			bwd = {
				high = 1,
				low = 1
			},
			l = {
				high = 1,
				low = 1
			},
			r = {
				high = 1,
				low = 1
			}
		}
	}
}

for _, variant_data in pairs(CopActionHurt.hurt_anim_variants) do
	variant_data.crouching = deep_clone(variant_data.not_crouching)
end

CopActionHurt.running_hurt_anim_variants = {
	fwd = 14
}
CopActionHurt.shield_knock_variants = 5
CopActionHurt.tased_variants = 4
CopActionHurt.explosion_tased_variants = 5
CopActionHurt.fire_death_anim_variants_length = {
	9,
	5,
	5,
	7,
	4
}
CopActionHurt.fire_death_anim_variants = {
	fire = 5,
	money = 10
}
CopActionHurt.poison_death_anim_variants = {
	male = 1,
	female = 1
}
CopActionHurt.fire_hurt_sounds = {}
CopActionHurt.fire_death_sounds = {}
CopActionHurt.fire_hurt_sounds.fire = {
	sound_name = "burnhurt"
}
CopActionHurt.fire_death_sounds.fire = {
	sound_name = "burndeath"
}
CopActionHurt.fire_hurt_sounds.money = {
	skip_prefix = true,
	sound_name = "moneythrower_hurt"
}
CopActionHurt.fire_death_sounds.money = {
	skip_prefix = true,
	sound_name = "moneythrower_death"
}
CopActionHurt.network_allowed_hurt_types = {
	light_hurt = true,
	hurt = true,
	heavy_hurt = true,
	stagger = true,
	death = true,
	fatal = true,
	fire_hurt = true,
	poison_hurt = true,
	bleedout = true,
	knock_down = true,
	expl_hurt = true,
	counter_tased = true,
	shield_knock = true
}
ShieldActionHurt = ShieldActionHurt or class(CopActionHurt)
ShieldActionHurt.explosion_tased_variants = 4
ShieldActionHurt.hurt_anim_variants_highest_num = 4
ShieldActionHurt.hurt_anim_variants = deep_clone(CopActionHurt.hurt_anim_variants)
local shield_anim_overrides = {
	heavy_hurt = 2,
	hurt = 2,
	concussion = 4,
	expl_hurt = 2
}

for hurt_type, override in pairs(shield_anim_overrides) do
	if ShieldActionHurt.hurt_anim_variants[hurt_type] then
		for _, crh_state_entry in pairs(ShieldActionHurt.hurt_anim_variants[hurt_type]) do
			for _, dir_entry in pairs(crh_state_entry) do
				for height_name, height_entry in pairs(dir_entry) do
					dir_entry[height_name] = override
				end
			end
		end
	end
end

shield_anim_overrides = nil

function CopActionHurt:init(action_desc, common_data)
	self._common_data = common_data
	self._ext_movement = common_data.ext_movement
	self._ext_inventory = common_data.ext_inventory
	self._ext_anim = common_data.ext_anim
	self._body_part = action_desc.body_part
	self._unit = common_data.unit
	self._machine = common_data.machine
	self._attention = common_data.attention
	self._action_desc = action_desc
	local t = TimerManager:game():time()
	local tweak_table = self._unit:base()._tweak_table
	local is_civilian = CopDamage.is_civilian(tweak_table)
	local is_female = (self._machine:get_global("female") or 0) == 1
	local crouching = self._ext_anim.crouch or self._ext_anim.crouching or self._ext_anim.hurt and self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "crh") > 0
	local fire_variant = "fire"
	local redir_res = nil
	local action_type = action_desc.hurt_type

	if action_type == "knock_down" then
		action_type = "heavy_hurt"
	end

	if action_type == "fatal" then
		redir_res = self._ext_movement:play_redirect("fatal")

		if not redir_res then
			debug_pause("[CopActionHurt:init] fatal redirect failed in", self._machine:segment_state(Idstring("base")))

			return
		end

		managers.hud:set_mugshot_downed(self._unit:unit_data().mugshot_id)
	elseif action_desc.variant == "tase" then
		redir_res = self._ext_movement:play_redirect("tased")

		if not redir_res then
			debug_pause("[CopActionHurt:init] tased redirect failed in", self._machine:segment_state(Idstring("base")))

			return
		end

		managers.hud:set_mugshot_tased(self._unit:unit_data().mugshot_id)
	elseif action_type == "fire_hurt" then
		local weapon_unit = action_desc.weapon_unit
		local base_ext = alive(weapon_unit) and weapon_unit:base()

		if base_ext then
			local td = base_ext.weapon_tweak_data and base_ext:weapon_tweak_data() or base_ext.get_name_id and tweak_data.weapon[base_ext:get_name_id()]

			if td then
				fire_variant = td.fire_variant or fire_variant
			end
		end

		redir_res = self._ext_movement:play_redirect(tostring(fire_variant) .. "_hurt")

		if not redir_res then
			debug_pause("[CopActionHurt:init] " .. tostring(fire_variant) .. "_hurt redirect failed in", self._machine:segment_state(Idstring("base")))

			return
		end

		local dir_str = nil
		local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)

		if fwd_dot < 0 then
			local hit_pos = action_desc.hit_pos
			local hit_vec = (hit_pos - common_data.pos):with_z(0):normalized()

			if mvector3.dot(hit_vec, common_data.right) > 0 then
				dir_str = "r"
			else
				dir_str = "l"
			end
		else
			dir_str = "bwd"
		end

		self._machine:set_parameter(redir_res, dir_str, 1)

		if self._unit:character_damage().set_last_time_unit_got_fire_damage then
			self._unit:character_damage():set_last_time_unit_got_fire_damage(t + 20)
		end
	elseif action_type == "taser_tased" then
		if self._unit:brain() and self._unit:brain()._current_logic_name ~= "intimidated" then
			local tase_data = tweak_data.tase_data[action_desc.variant] or tweak_data.tase_data.light

			if tase_data.duration then
				redir_res = self._ext_movement:play_redirect("explosion_tased")

				if not redir_res then
					debug_pause("[CopActionHurt:init] explosion_tased redirect failed in", self._machine:segment_state(Idstring("upper_body")))

					return
				end

				local nr_variants = self.explosion_tased_variants
				local variant = 1

				if nr_variants > 1 then
					variant = self:_pseudorandom(nr_variants)
				end

				self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
			else
				redir_res = self._ext_movement:play_redirect("taser")

				if not redir_res then
					debug_pause("[CopActionHurt:init] taser redirect failed in", self._machine:segment_state(Idstring("upper_body")))

					return
				end

				local nr_variants = self.tased_variants
				local variant = 1

				if nr_variants > 1 then
					variant = self:_pseudorandom(nr_variants)
				end

				self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
			end
		end
	elseif action_type == "light_hurt" then
		if not self._ext_anim.upper_body_active or self._ext_anim.upper_body_empty or self._ext_anim.recoil then
			redir_res = self._ext_movement:play_redirect(action_type)

			if not redir_res then
				debug_pause("[CopActionHurt:init] light_hurt redirect failed in", self._machine:segment_state(Idstring("upper_body")))

				return
			end

			local dir_str = nil
			local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)

			if fwd_dot < 0 then
				local hit_pos = action_desc.hit_pos
				local hit_vec = (hit_pos - common_data.pos):with_z(0):normalized()

				if mvector3.dot(hit_vec, common_data.right) > 0 then
					dir_str = "r"
				else
					dir_str = "l"
				end
			else
				dir_str = "bwd"
			end

			self._machine:set_parameter(redir_res, dir_str, 1)

			local height_str = self._ext_movement:m_com().z < action_desc.hit_pos.z and "high" or "low"

			self._machine:set_parameter(redir_res, height_str, 1)
		end

		self._expired = true

		return true
	elseif action_type == "hurt_sick" then
		local ecm_hurts_table = self._common_data.char_tweak.ecm_hurts

		if not ecm_hurts_table or not next(ecm_hurts_table) then
			debug_pause_unit(self._unit, "[CopActionHurt:init] Unit missing ecm_hurts in Character Tweak Data", self._unit)

			return
		end

		local sick_variants = {}

		for i, d in pairs(ecm_hurts_table) do
			table.insert(sick_variants, i)
		end

		local variant = #sick_variants == 1 and sick_variants[1] or sick_variants[self:_pseudorandom(#sick_variants)]
		redir_res = self._ext_movement:play_redirect("hurt_sick_" .. tostring(variant))

		if not redir_res then
			debug_pause("[CopActionHurt:init] hurt_sick_" .. tostring(variant) .. " redirect failed in", self._machine:segment_state(Idstring("base")))

			return
		end

		local duration = ecm_hurts_table[variant]
		self._sick_time = t + duration
	elseif action_type == "poison_hurt" then
		redir_res = self._ext_movement:play_redirect("hurt_poison")

		if not redir_res then
			debug_pause("[CopActionHurt:init] hurt_poison redirect failed in", self._machine:segment_state(Idstring("base")))

			return
		end
	elseif action_type == "bleedout" then
		redir_res = self._ext_movement:play_redirect("bleedout")

		if not redir_res then
			debug_pause("[CopActionHurt:init] bleedout redirect failed in", self._machine:segment_state(Idstring("base")))

			return
		end
	elseif action_type == "death" and action_desc.variant == "fire" then
		local variant = 1
		local weapon_unit = action_desc.weapon_unit
		local base_ext = alive(weapon_unit) and weapon_unit:base()

		if base_ext then
			local td = base_ext.weapon_tweak_data and base_ext:weapon_tweak_data() or base_ext.get_name_id and tweak_data.weapon[base_ext:get_name_id()]

			if td then
				fire_variant = td.fire_variant or fire_variant
			end
		end

		if self._ext_anim.ragdoll and not self._ext_anim.hurt_fire or self._ext_movement:died_on_rope() then
			variant = 0

			self:force_ragdoll()
		else
			local variant_count = CopActionHurt.fire_death_anim_variants[fire_variant] or 5

			if variant_count > 1 then
				variant = self:_pseudorandom(variant_count)
			end

			self:_prepare_ragdoll()

			redir_res = self._ext_movement:play_redirect("death_" .. fire_variant)

			if not redir_res then
				debug_pause("[CopActionHurt:init] death_fire redirect failed in", self._machine:segment_state(Idstring("base")))

				return
			end

			for i = 1, variant_count do
				local state_value = 0

				if i == variant then
					state_value = 1
				end

				self._machine:set_parameter(redir_res, "var" .. tostring(i), state_value)
			end
		end

		self:_start_enemy_fire_effect_on_death(variant, fire_variant)
	elseif action_type == "death" and action_desc.variant == "poison" then
		if self._ext_anim.run or self._ext_anim.sprint or self._ext_anim.ragdoll then
			self:force_ragdoll()
		else
			self:_prepare_ragdoll()

			redir_res = self._ext_movement:play_redirect("death_poison")

			if not redir_res then
				debug_pause("[CopActionHurt:init] death_poison redirect failed in", self._machine:segment_state(Idstring("base")))

				return
			end

			local variant = CopActionHurt.forced_death_var or self.poison_death_anim_variants[is_female and "female" or "male"] or 1

			if not CopActionHurt.forced_death_var and variant > 1 then
				variant = self:_pseudorandom(variant)
			end

			self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
		end
	elseif action_type == "death" and not crouching and (self._ext_anim.run or self._ext_anim.sprint) and self._ext_anim.move_fwd and not common_data.char_tweak.no_run_death_anim then
		self:_prepare_ragdoll()

		redir_res = self._ext_movement:play_redirect("death_run")

		if not redir_res then
			debug_pause("[CopActionHurt:init] death_run redirect failed in", self._machine:segment_state(Idstring("base")))

			return
		end

		local variant = self.running_death_anim_variants[is_female and "female" or "male"] or 1

		if variant > 1 then
			variant = self:_pseudorandom(variant)
		end

		self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
	elseif action_type == "death" and (self._ext_anim.run or self._ext_anim.sprint or self._ext_anim.ragdoll) and self:_start_ragdoll() then
		self.update = self._upd_ragdolled
	elseif action_type == "heavy_hurt" and not crouching and (self._ext_anim.run or self._ext_anim.sprint) and self._ext_anim.move_fwd then
		redir_res = self._ext_movement:play_redirect("heavy_hurt_run")

		if not redir_res then
			debug_pause("[CopActionHurt:init] heavy_hurt_run redirect failed in", self._machine:segment_state(Idstring("base")))

			return
		end

		local variant = self.running_hurt_anim_variants.fwd or 1

		if variant > 1 then
			variant = self:_pseudorandom(variant)
		end

		self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
	elseif action_type == "shield_knock" then
		redir_res = self._ext_movement:play_redirect("shield_knock")

		if not redir_res then
			debug_pause("[CopActionHurt:init] shield_knock redirect failed in", self._machine:segment_state(Idstring("base")))

			return
		end

		local variant = 1
		local variant_count = CopActionHurt.shield_knock_variants or 5

		if variant_count > 1 then
			variant = self:_pseudorandom(variant_count)
		end

		self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
	else
		local variant, height, old_variant, old_info = nil

		if (action_type == "hurt" or action_type == "heavy_hurt") and self._ext_anim.hurt then
			for i = 1, self.hurt_anim_variants_highest_num do
				if self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "var" .. i) then
					old_variant = i

					break
				end
			end

			if old_variant ~= nil then
				old_info = {
					fwd = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "fwd"),
					bwd = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "bwd"),
					l = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "l"),
					r = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "r"),
					high = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "high"),
					low = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "low"),
					crh = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "crh"),
					mod = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "mod"),
					hvy = self._machine:get_parameter(self._machine:segment_state(Idstring("base")), "hvy")
				}
			end
		end

		local redirect = action_type

		if redirect == "concussion" then
			redirect = "concussion_stun"
		end

		if redirect then
			redir_res = self._ext_movement:play_redirect(redirect)
		else
			Application:stack_dump_error("There's no redirect in CopActionHurt!")
		end

		if not redir_res then
			debug_pause_unit(self._unit, "[CopActionHurt:init]", redirect, "redirect failed in", self._machine:segment_state(Idstring("base")), self._unit)

			return
		end

		if action_desc.variant ~= "bleeding" then
			local nr_variants = self._ext_anim.base_nr_variants
			local death_type = nil

			if nr_variants then
				variant = self:_pseudorandom(nr_variants)
			else
				local fwd_dot = action_desc.direction_vec:dot(common_data.fwd)
				local right_dot = action_desc.direction_vec:dot(common_data.right)
				local dir_str = nil

				if math.abs(right_dot) < math.abs(fwd_dot) then
					if fwd_dot < 0 then
						dir_str = "fwd"
					else
						dir_str = "bwd"
					end
				elseif right_dot > 0 then
					dir_str = "l"
				else
					dir_str = "r"
				end

				self._machine:set_parameter(redir_res, dir_str, 1)

				local hit_z = action_desc.hit_pos.z
				height = self._ext_movement:m_com().z < hit_z and "high" or "low"

				if action_type == "death" then
					if is_civilian then
						death_type = "normal"
					else
						death_type = action_desc.death_type
					end

					if is_female then
						variant = self.death_anim_fe_variants[death_type][crouching and "crouching" or "not_crouching"][dir_str][height]
					else
						variant = self.death_anim_variants[death_type][crouching and "crouching" or "not_crouching"][dir_str][height]
					end

					if variant > 1 then
						variant = self:_pseudorandom(variant)
					end

					self:_prepare_ragdoll()
				elseif action_type ~= "counter_tased" and action_type ~= "taser_tased" then
					if old_variant and (old_info[dir_str] == 1 and old_info[height] == 1 and old_info.mod == 1 and action_type == "hurt" or old_info.hvy == 1 and action_type == "heavy_hurt") then
						variant = old_variant
					end

					if not variant then
						variant = self.hurt_anim_variants[action_type][crouching and "crouching" or "not_crouching"][dir_str][height]

						if variant > 1 then
							variant = self:_pseudorandom(variant)
						end
					end
				end
			end

			variant = variant or 1

			if variant then
				self._machine:set_parameter(redir_res, "var" .. tostring(variant), 1)
			end

			if height then
				self._machine:set_parameter(redir_res, height, 1)
			end

			if crouching then
				self._machine:set_parameter(redir_res, "crh", 1)
			end

			if action_type == "hurt" then
				self._machine:set_parameter(redir_res, "mod", 1)
			elseif action_type == "heavy_hurt" then
				self._machine:set_parameter(redir_res, "hvy", 1)
			elseif action_type == "death" and (death_type or action_desc.death_type) == "heavy" and not is_civilian then
				self._machine:set_parameter(redir_res, "heavy", 1)
			elseif action_type == "expl_hurt" then
				self._machine:set_parameter(redir_res, "expl", 1)
			end
		end
	end

	if self._ext_anim.upper_body_active and not self._ext_anim.upper_body_empty and not self._ragdolled then
		self._ext_movement:play_redirect("up_idle")
	end

	self._last_vel_z = 0
	self._hurt_type = action_type
	self._variant = action_desc.variant
	self._body_part = action_desc.body_part

	if action_type == "bleedout" then
		self.update = self._upd_bleedout
		self._shoot_t = t + 1

		if Network:is_server() then
			self._ext_inventory:equip_selection(1, true)
		end

		local weapon_unit = self._ext_inventory:equipped_unit()
		self._weapon_base = weapon_unit:base()
		local weap_tweak = weapon_unit:base():weapon_tweak_data()
		local weapon_usage_tweak = common_data.char_tweak.weapon[weap_tweak.usage]
		self._weapon_unit = weapon_unit
		self._weap_tweak = weap_tweak
		self._w_usage_tweak = weapon_usage_tweak
		self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
		self._spread = weapon_usage_tweak.spread
		self._falloff = weapon_usage_tweak.FALLOFF
		self._head_modifier_name = Idstring("look_head")
		self._arm_modifier_name = Idstring("aim_r_arm")
		self._head_modifier = self._machine:get_modifier(self._head_modifier_name)
		self._arm_modifier = self._machine:get_modifier(self._arm_modifier_name)
		self._aim_vec = mvector3.copy(common_data.fwd)
		self._anim = redir_res

		if not self._shoot_history then
			self._shoot_history = {
				focus_error_roll = self:_pseudorandom(360),
				focus_start_t = t,
				focus_delay = weapon_usage_tweak.focus_delay,
				m_last_pos = common_data.pos + common_data.fwd * 500
			}
		end
	elseif self._sick_time then
		self.update = self._upd_sick
	elseif action_desc.variant == "tase" then
		-- Nothing
	elseif self._ragdolled then
		-- Nothing
	elseif self._unit:anim_data().skip_force_to_graph then
		self.update = self._upd_empty
	else
		self.update = self._upd_hurt
	end

	local shoot_chance = nil

	if self._ext_inventory and not self._weapon_dropped and common_data.char_tweak.shooting_death and not self._ext_movement:cool() and t - self._ext_movement:not_cool_t() > 3 then
		local weapon_unit = self._ext_inventory:equipped_unit()

		if weapon_unit then
			if action_type == "counter_tased" or action_type == "taser_tased" then
				weapon_unit:base():on_reload()

				shoot_chance = 1
			elseif action_type == "death" or action_type == "hurt" or action_type == "heavy_hurt" then
				shoot_chance = 0.1
			end
		end
	end

	if shoot_chance then
		local equipped_weapon = self._ext_inventory:equipped_unit()
		local rand = self:_pseudorandom()

		if equipped_weapon and (not equipped_weapon:base().clip_empty or not equipped_weapon:base():clip_empty()) and rand <= shoot_chance then
			self._weapon_unit = equipped_weapon

			self._unit:movement():set_friendly_fire(true)

			self._friendly_fire = true

			if equipped_weapon:base():weapon_tweak_data().auto then
				equipped_weapon:base():start_autofire()

				self._shooting_hurt = true
			else
				self._delayed_shooting_hurt_clbk_id = "shooting_hurt" .. tostring(self._unit:key())

				managers.enemy:add_delayed_clbk(self._delayed_shooting_hurt_clbk_id, callback(self, self, "clbk_shooting_hurt"), TimerManager:game():time() + math.lerp(0.2, 0.4, self:_pseudorandom()))
			end
		end
	end

	if not self._unit:base().nick_name then
		if action_desc.variant == "fire" then
			local base_ext = self._unit:base()

			if action_desc.hurt_type == "fire_hurt" then
				local sound_data = CopActionHurt.fire_hurt_sounds[fire_variant] or CopActionHurt.fire_hurt_sounds.fire

				if sound_data.skip_prefix or not base_ext or not base_ext.has_tag or not base_ext:has_any_tag({
					"spooc",
					"tank",
					"shield"
				}) then
					self._unit:sound():say(sound_data.sound_name, nil, sound_data.skip_prefix)
				end
			elseif action_desc.hurt_type == "death" then
				local sound_data = CopActionHurt.fire_death_sounds[fire_variant] or CopActionHurt.fire_death_sounds.fire

				if not sound_data.skip_prefix and base_ext and base_ext.has_tag and base_ext:has_tag("tank") then
					self._unit:sound():say("x02a_any_3p")
				else
					self._unit:sound():say(sound_data.sound_name, nil, sound_data.skip_prefix)
				end
			end
		elseif action_type == "death" then
			self._unit:sound():say("x02a_any_3p")
		elseif action_type == "counter_tased" or action_type == "taser_tased" then
			self._unit:sound():say("tasered")
		else
			self._unit:sound():say("x01a_any_3p")
		end

		if Network:is_server() then
			local radius, filter_name = nil
			local default_radius = managers.groupai:state():whisper_mode() and tweak_data.upgrades.cop_hurt_alert_radius_whisper or tweak_data.upgrades.cop_hurt_alert_radius

			if action_desc.attacker_unit and alive(action_desc.attacker_unit) and action_desc.attacker_unit:base().upgrade_value then
				radius = action_desc.attacker_unit:base():upgrade_value("player", "silent_kill") or default_radius
			elseif action_desc.attacker_unit and alive(action_desc.attacker_unit) and action_desc.attacker_unit:base().is_local_player then
				radius = managers.player:upgrade_value("player", "silent_kill", default_radius)
			end

			local new_alert = {
				"vo_distress",
				common_data.ext_movement:m_head_pos(),
				radius or default_radius,
				self._unit:brain():SO_access(),
				self._unit
			}

			managers.groupai:state():propagate_alert(new_alert)
		end
	end

	if action_type == "death" or action_type == "bleedout" or action_desc.variant == "tased" or action_type == "fatal" then
		self._floor_normal = self:_get_floor_normal(common_data.pos, common_data.fwd, common_data.right)
	end

	CopActionAct._create_blocks_table(self, action_desc.blocks)
	self._ext_movement:enable_update()

	if (self._body_part == 1 or self._body_part == 2) and Network:is_server() then
		local stand_rsrv = self._unit:brain():get_pos_rsrv("stand")

		if not stand_rsrv or mvector3.distance_sq(stand_rsrv.position, common_data.pos) > 400 then
			self._unit:brain():add_pos_rsrv("stand", {
				radius = 30,
				position = mvector3.copy(common_data.pos)
			})
		end
	end

	if self:is_network_allowed(action_desc) then
		local params = {
			CopActionHurt.hurt_type_to_idx(action_desc.hurt_type),
			action_desc.body_part,
			CopActionHurt.death_type_to_idx(action_desc.death_type),
			CopActionHurt.type_to_idx(action_desc.type),
			CopActionHurt.variant_to_idx(action_desc.variant),
			action_desc.direction_vec or Vector3(),
			action_desc.hit_pos or Vector3()
		}

		self._common_data.ext_network:send("action_hurt_start", unpack(params))
	end

	return true
end

function CopActionHurt:is_network_allowed(action_desc)
	if not CopActionHurt.network_allowed_hurt_types[action_desc.hurt_type] then
		return false
	end

	if action_desc.allow_network == false then
		return false
	end

	if self._unit:in_slot(managers.slot:get_mask("criminals")) then
		return false
	end

	return true
end

function CopActionHurt:_pseudorandom(a, b)
	local mult = 10
	local ht = managers.game_play_central:get_heist_timer()
	local is_host = Network:is_server() or Global.game_settings.single_player

	if not is_host then
		self._host_peer = self._host_peer or managers.network:session():peer(1)

		if self._host_peer then
			ht = ht + Network:qos(self._host_peer:rpc()).ping / 1000
		end
	end

	local t = math.floor(ht * mult + 0.5) / mult
	local r = math.random() * 999 + 1
	local uid = self._unit:id()
	local seed = uid^(t / 183.62) * 100 % 100000

	math.randomseed(seed)

	local ret = nil

	if a and b then
		ret = math.random(a, b)
	elseif a then
		ret = math.random(a)
	else
		ret = math.random()
	end

	math.randomseed(os.time() / r + Application:time())

	for i = 1, math.round(math.random() * 10) do
		math.random()
	end

	return ret
end

CopActionHurt.idx_to_hurt_type_map = {
	"bleedout",
	"light_hurt",
	"heavy_hurt",
	"expl_hurt",
	"hurt",
	"hurt_sick",
	"shield_knock",
	"knock_down",
	"stagger",
	"counter_tased",
	"taser_tased",
	"death",
	"fatal",
	"fire_hurt",
	"poison_hurt",
	"concussion",
	"healed"
}

function CopActionHurt.hurt_type_to_idx(hurt_type)
	local res = nil

	for idx, hurt in pairs(CopActionHurt.idx_to_hurt_type_map) do
		if hurt == hurt_type then
			res = idx

			break
		end
	end

	if not res then
		Application:error("No idx for hurt type! ", hurt_type)

		return table.index_of(CopActionHurt.idx_to_hurt_type_map, "death")
	end

	return res
end

function CopActionHurt.idx_to_hurt_type(idx)
	return CopActionHurt.idx_to_hurt_type_map[idx]
end

CopActionHurt.idx_to_death_type_map = {
	[1.0] = "normal",
	[2.0] = "heavy"
}

function CopActionHurt.death_type_to_idx(death)
	return table.index_of(CopActionHurt.idx_to_death_type_map, death)
end

function CopActionHurt.idx_to_death_type(idx)
	return CopActionHurt.idx_to_death_type_map[idx]
end

CopActionHurt.idx_to_type_map = {
	"hurt",
	"heavy_hurt",
	"hurt_sick",
	"poison_hurt",
	"death"
}

function CopActionHurt.type_to_idx(hurt_type)
	return table.index_of(CopActionHurt.idx_to_type_map, hurt_type)
end

function CopActionHurt.idx_to_type(idx)
	return CopActionHurt.idx_to_type_map[idx]
end

CopActionHurt.idx_to_variant_map = {
	"bullet",
	"melee",
	"explosion",
	"other"
}

function CopActionHurt.variant_to_idx(var)
	local idx = table.index_of(CopActionHurt.idx_to_variant_map, var)

	if idx < 0 then
		return 4
	else
		return idx
	end
end

function CopActionHurt.idx_to_variant(idx)
	return CopActionHurt.idx_to_variant_map[idx]
end

local tmp_used_flame_objects = nil

function CopActionHurt:_start_enemy_fire_effect_on_death(death_variant, fire_variant)
	if self._burn_death_effects_clbk_id then
		return
	end

	local fire_td = tweak_data.fire
	local fire_bones = fire_td.fire_bones

	if not tmp_used_flame_objects then
		tmp_used_flame_objects = {}

		for _, effect in ipairs(fire_bones) do
			table.insert(tmp_used_flame_objects, false)
		end
	end

	local effect_tbl = fire_variant and fire_td[fire_variant .. "_death_anims"] or fire_td.fire_death_anims
	effect_tbl = effect_tbl[death_variant] or effect_tbl[0]
	local effect_category = fire_td.effects[effect_tbl.effect]
	local num_objects = #fire_bones
	local num_effects = num_objects == 0 and 0 or num_objects <= 3 and math.random(num_objects) or math.random(3, num_objects)
	local effects_table = {}
	local costs = fire_td.effects_cost
	local get_object_f = self._unit.get_object
	local effect_m = World:effect_manager()
	local spawn_f = effect_m.spawn
	local idx = 1
	local effect_id = nil

	for i = 1, num_effects do
		while tmp_used_flame_objects[idx] do
			idx = math.random(num_objects)
		end

		local effect_name = effect_category[costs[i] or "cheap"]

		if effect_name then
			local bone = get_object_f(self._unit, Idstring(fire_bones[idx]))

			if bone then
				effect_id = spawn_f(effect_m, {
					effect = Idstring(effect_name),
					parent = bone
				})

				table.insert(effects_table, effect_id)
			end
		end

		tmp_used_flame_objects[idx] = true
	end

	self._burn_death_effects = {
		fire_effects = effects_table
	}

	for idx, _ in ipairs(tmp_used_flame_objects) do
		tmp_used_flame_objects[idx] = false
	end

	if effect_tbl.burn_sound_name ~= "no_sound" then
		self._burn_death_effects.burn_sound_name = effect_tbl.burn_sound_name
		self._burn_death_effects.burn_fade_sound_name = effect_tbl.burn_fade_sound_name

		managers.fire:start_burn_body_sound(self._unit, self._burn_death_effects)
	end

	self._burn_death_effects_clbk_id = "DeathFireEffects" .. tostring(self._unit:key())

	managers.enemy:add_delayed_clbk(self._burn_death_effects_clbk_id, callback(self, self, "_remove_burn_death_effects"), TimerManager:game():time() + effect_tbl.duration)
end

function CopActionHurt:_remove_burn_death_effects(destroyed)
	self._burn_death_effects_clbk_id = nil

	if self._burn_death_effects then
		local effect_m = World:effect_manager()
		local kill_f = destroyed and effect_m.kill or effect_m.fade_kill

		for _, effect_id in ipairs(self._burn_death_effects.fire_effects) do
			kill_f(effect_m, effect_id)
		end

		if self._burn_death_effects.burn_sound_source then
			self._burn_death_effects.burn_sound_source.destroyed = destroyed

			managers.fire:stop_burn_body_sound(self._burn_death_effects.burn_sound_source)
		end

		self._burn_death_effects = nil
	end
end

function CopActionHurt:_dragons_breath_sparks()
	local enemy_effect_name = Idstring("effects/payday2/particles/impacts/sparks/dragons_breath_hit_effect")
	local bone_spine = self._unit:get_object(Idstring("Spine"))

	if bone_spine then
		World:effect_manager():spawn({
			effect = enemy_effect_name,
			parent = bone_spine
		})
	end
end

function CopActionHurt:_get_floor_normal(at_pos, fwd, right)
	local padding_height = 150
	local center_pos = at_pos + math.UP

	mvec3_set_z(center_pos, center_pos.z + padding_height)

	local fall = 100
	local down_vec = Vector3(0, 0, -fall - padding_height)
	local dis = 50
	local fwd_pos, bwd_pos, r_pos, l_pos = nil
	local from_pos = fwd * dis

	mvec3_add(from_pos, center_pos)

	local to_pos = from_pos + down_vec
	local down_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", 1)

	if down_ray then
		fwd_pos = down_ray.position
	else
		fwd_pos = to_pos:with_z(at_pos.z)
	end

	mvec3_set(from_pos, fwd)
	mvec3_mul(from_pos, -dis)
	mvec3_add(from_pos, center_pos)
	mvec3_set(to_pos, from_pos)
	mvec3_add(to_pos, down_vec)

	down_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", 1)

	if down_ray then
		bwd_pos = down_ray.position
	else
		bwd_pos = to_pos:with_z(at_pos.z)
	end

	mvec3_set(from_pos, right)
	mvec3_mul(from_pos, dis)
	mvec3_add(from_pos, center_pos)
	mvec3_set(to_pos, from_pos)
	mvec3_add(to_pos, down_vec)

	down_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", 1)

	if down_ray then
		r_pos = down_ray.position
	else
		r_pos = to_pos:with_z(at_pos.z)
	end

	mvec3_set(from_pos, right)
	mvec3_mul(from_pos, -dis)
	mvec3_add(from_pos, center_pos)
	mvec3_set(to_pos, from_pos)
	mvec3_add(to_pos, down_vec)

	down_ray = World:raycast("ray", from_pos, to_pos, "slot_mask", 1)

	if down_ray then
		l_pos = down_ray.position
	else
		l_pos = to_pos

		mvec3_set_z(l_pos, at_pos.z)
	end

	local pose_fwd = fwd_pos

	mvec3_sub(pose_fwd, bwd_pos)

	local pose_l = l_pos

	mvec3_sub(pose_l, r_pos)

	local ground_normal = pose_fwd:cross(pose_l)

	mvec3_norm(ground_normal)

	return ground_normal
end

function CopActionHurt:on_exit()
	if self._shooting_hurt then
		self._shooting_hurt = false

		if self._weapon_unit then
			self._weapon_unit:base():stop_autofire()
		end
	end

	if self._delayed_shooting_hurt_clbk_id then
		managers.enemy:remove_delayed_clbk(self._delayed_shooting_hurt_clbk_id)

		self._delayed_shooting_hurt_clbk_id = nil
	end

	if self._friendly_fire then
		self._unit:movement():set_friendly_fire(false)

		self._friendly_fire = nil
	end

	if self._modifier_on then
		self._machine:allow_modifier(self._head_modifier_name)
		self._machine:allow_modifier(self._arm_modifier_name)
	end

	if self._expired then
		CopActionWalk._chk_correct_pose(self)
	end

	if not self._expired and Network:is_server() then
		if self._hurt_type == "bleedout" or self._hurt_type == "fatal" or self._variant == "tase" then
			self._unit:network():send("action_hurt_end")
		end

		if self._hurt_type == "bleedout" or self._hurt_type == "fatal" then
			self._ext_inventory:equip_selection(2, true)
		end
	end

	if self._hurt_type == "fatal" or self._variant == "tase" then
		managers.hud:set_mugshot_normal(self._unit:unit_data().mugshot_id)
	end

	local char_dmg_ext = self._unit:character_damage()

	if char_dmg_ext then
		if self._hurt_type == "taser_tased" and char_dmg_ext.on_tase_ended then
			char_dmg_ext:on_tase_ended()
		end

		if self._hurt_type == "fire_hurt" and char_dmg_ext.set_last_time_unit_got_fire_damage then
			char_dmg_ext:set_last_time_unit_got_fire_damage(TimerManager:game():time())
		end

		if char_dmg_ext.call_listener then
			char_dmg_ext:call_listener("on_exit_hurt")
		end
	end
end

function CopActionHurt:_get_pos_clamped_to_graph(test_head)
	local tracker = self._ext_movement:nav_tracker()
	local r = tracker:field_position()
	local new_pos = tmp_vec1

	mvec3_set(new_pos, self._unit:get_animation_delta_position())
	mvec3_set_z(new_pos, 0)
	mvec3_add(new_pos, r)

	local ray_params = nil

	if test_head then
		local h = tmp_vec2

		mvec3_set(h, self._common_data.ext_movement._obj_head:position())
		mvec3_set_z(h, new_pos.z)

		ray_params = {
			trace = true,
			tracker_from = tracker,
			pos_to = h
		}
		local hit = managers.navigation:raycast(ray_params)
		local nh = ray_params.trace[1]
		local collision_side = ray_params.trace[2]

		if hit and collision_side then
			mvec3_set(tmp_vec3, managers.navigation._dir_str_to_vec[collision_side])
			mvec3_sub(h, nh)
			mvec3_set_z(h, 0)

			local error_amount = -mvec3_dot(tmp_vec3, h)

			mvec3_mul(tmp_vec3, error_amount)
			mvector3.add(new_pos, tmp_vec3)
		end
	else
		ray_params = {
			tracker_from = tracker
		}
	end

	ray_params.pos_to = new_pos
	ray_params.trace = true

	managers.navigation:raycast(ray_params)
	mvector3.set(new_pos, ray_params.trace[1])

	return new_pos
end

function CopActionHurt:_upd_empty(t)
end

function CopActionHurt:_upd_sick(t)
	if not self._sick_time or self._sick_time < t then
		if self._ext_anim.needs_idle then
			self._ext_movement:play_redirect("exit")

			self.update = self._upd_sick_exit
		else
			self._expired = true
		end
	end
end

function CopActionHurt:_upd_sick_exit(t)
	if not self._ext_anim.hurt then
		self._expired = true
	end
end

function CopActionHurt:_upd_tased(t)
	if not self._tased_time or self._tased_time < t then
		if self._tased_down_time and t < self._tased_down_time then
			local redir_res = self._ext_movement:play_redirect("fatal")

			if not redir_res then
				debug_pause("[CopActionHurt:init] fatal redirect failed in", self._machine:segment_state(Idstring("base")))
			end

			self.update = self._upd_tased_down
		else
			self._expired = true
		end
	end
end

function CopActionHurt:_upd_tased_down(t)
	if not self._tased_down_time or self._tased_down_time < t then
		self._expired = true
	end
end

function CopActionHurt:_upd_taser_tased(t)
	if not self._taser_tased_t or self._taser_tased_t < t then
		self._expired = true
	end
end

function CopActionHurt:_upd_hurt(t)
	if self._shooting_hurt and not alive(self._weapon_unit) then
		self._shooting_hurt = false
		self._weapon_unit = false
	end

	local dt = TimerManager:game():delta_time()

	if self._ext_anim.hurt or self._ext_anim.death then
		if self._shooting_hurt then
			local weap_unit = self._weapon_unit
			local weap_unit_base = weap_unit:base()
			local shoot_from_pos = weap_unit:position()
			local shoot_fwd = weap_unit:rotation():y()

			weap_unit_base:trigger_held(shoot_from_pos, shoot_fwd, 3)

			if weap_unit_base.clip_empty and weap_unit_base:clip_empty() then
				self._shooting_hurt = false

				weap_unit_base:stop_autofire()
			end
		end

		self._last_pos = self:_get_pos_clamped_to_graph(true)

		CopActionWalk._set_new_pos(self, dt)

		local new_rot = self._unit:get_animation_delta_rotation()
		new_rot = self._common_data.rot * new_rot

		mrotation.set_yaw_pitch_roll(new_rot, new_rot:yaw(), 0, 0)

		if self._ext_anim.death then
			local rel_prog = math.clamp(self._machine:segment_relative_time(Idstring("base")), 0, 1)

			if self._floor_normal == nil then
				self._floor_normal = Vector3(0, 0, 1)
			end

			local normal = math.lerp(math.UP, self._floor_normal, rel_prog)
			local fwd = new_rot:y()

			mvec3_cross(tmp_vec1, fwd, normal)
			mvec3_cross(fwd, normal, tmp_vec1)

			new_rot = Rotation(fwd, normal)
		end

		self._ext_movement:set_rotation(new_rot)
	else
		if self._shooting_hurt then
			self._shooting_hurt = false

			self._weapon_unit:base():stop_autofire()
		end

		if self._hurt_type == "death" then
			self._died = true
		else
			self._expired = true
		end
	end
end

function CopActionHurt:_upd_bleedout(t)
	if self._floor_normal then
		local normal = nil

		if self._ext_anim.bleedout_enter then
			local rel_t = self._machine:segment_relative_time(Idstring("base"))
			rel_t = math.min(1, rel_t + 0.5)
			local rel_prog = math.clamp(rel_t, 0, 1)
			normal = math.lerp(math.UP, self._floor_normal, rel_prog)

			self._ext_movement:set_m_pos(self._common_data.pos)
		else
			normal = self._floor_normal
			self._floor_normal = nil
		end

		mvec3_cross(tmp_vec1, self._common_data.fwd, normal)
		mvec3_cross(tmp_vec2, normal, tmp_vec1)

		local new_rot = Rotation(tmp_vec2, normal)

		self._ext_movement:set_rotation(new_rot)
	end

	if not self._ext_anim.bleedout_enter and self._weapon_unit then
		if self._attention and not self._ext_anim.reload and not self._ext_anim.equip then
			local autotarget, target_pos = nil

			if self._attention.handler then
				target_pos = self._attention.handler:get_attention_m_pos()
			elseif self._attention.unit then
				target_pos = tmp_vec1

				self._attention.unit:character_damage():shoot_pos_mid(target_pos)
			else
				target_pos = self._attention.pos
			end

			local shoot_from_pos = self._ext_movement:m_head_pos()
			local target_vec = target_pos - shoot_from_pos
			local target_dis = mvec3_norm(target_vec)

			if not self._modifier_on then
				self._modifier_on = true

				self._machine:force_modifier(self._head_modifier_name)
				self._machine:force_modifier(self._arm_modifier_name)
			end

			if self._look_dir then
				local angle_diff = self._look_dir:angle(target_vec)
				local rot_speed_rel = math.pow(math.min(angle_diff / 90, 1), 0.5)
				local rot_speed = math.lerp(40, 360, rot_speed_rel)
				local dt = t - self._bleedout_look_t
				local rot_amount = math.min(rot_speed * dt, angle_diff)
				local diff_axis = self._look_dir:cross(target_vec)
				local rot = Rotation(diff_axis, rot_amount)
				self._look_dir = self._look_dir:rotate_with(rot)

				mvector3.normalize(self._look_dir)
			else
				self._look_dir = target_vec
			end

			self._bleedout_look_t = t

			self._head_modifier:set_target_z(self._look_dir)
			self._arm_modifier:set_target_y(self._look_dir)

			local aim_polar = self._look_dir:to_polar_with_reference(self._common_data.fwd, math.UP)
			local aim_spin_d90 = aim_polar.spin / 90
			local anim = self._machine:segment_state(Idstring("base"))
			local fwd = 1 - math.clamp(math.abs(aim_spin_d90), 0, 1)

			self._machine:set_parameter(anim, "angle0", fwd)

			local bwd = math.clamp(math.abs(aim_spin_d90), 1, 2) - 1

			self._machine:set_parameter(anim, "angle180", bwd)

			local l = 1 - math.clamp(math.abs(aim_spin_d90 - 1), 0, 1)

			self._machine:set_parameter(anim, "angle90neg", l)

			local r = 1 - math.clamp(math.abs(aim_spin_d90 + 1), 0, 1)

			self._machine:set_parameter(anim, "angle90", r)

			if self._shoot_t < t then
				if self._weapon_unit:base():clip_empty() then
					local res = CopActionReload._play_bleedout_reload(self)
				elseif self._common_data.allow_fire then
					local falloff = CopActionShoot._get_shoot_falloff(self, target_dis, self._falloff)
					local spread = self._spread
					local new_target_pos = self._attention.handler and self._attention.handler:get_attention_m_pos() or CopActionShoot._get_unit_shoot_pos(self, self._attention.unit, t, target_pos, target_dis, self._w_usage_tweak)

					if new_target_pos then
						target_pos = new_target_pos
					else
						spread = math.min(20, spread)
					end

					local spread_pos = tmp_vec2

					mvec3_rand_orth(spread_pos, target_vec)
					mvec3_set_l(spread_pos, spread)
					mvec3_add(spread_pos, target_pos)

					target_dis = mvec3_dir(target_vec, shoot_from_pos, spread_pos)

					self._weapon_base:singleshot(shoot_from_pos, target_vec, falloff.dmg_mul)

					local rand = self:_pseudorandom()
					self._shoot_t = t + math.lerp(falloff.recoil[1], falloff.recoil[2], rand)
				end
			end
		elseif self._modifier_on then
			self._modifier_on = false

			self._machine:allow_modifier(self._head_modifier_name)
			self._machine:allow_modifier(self._arm_modifier_name)
		end
	end
end

function CopActionHurt:_upd_ragdolled(t)
	local dt = TimerManager:game():delta_time()

	if self._shooting_hurt then
		local weap_unit = self._weapon_unit
		local weap_unit_base = weap_unit:base()
		local shoot_from_pos = weap_unit:position()
		local shoot_fwd = weap_unit:rotation():y()

		weap_unit_base:trigger_held(shoot_from_pos, shoot_fwd, 3)

		if weap_unit_base.clip_empty and weap_unit_base:clip_empty() then
			self._shooting_hurt = false

			weap_unit_base:stop_autofire()
		end
	end

	if self._ragdoll_active then
		self._hips_obj:m_position(tmp_vec1)
		self._ext_movement:set_position(tmp_vec1)
	end

	if not self._ragdoll_freeze_clbk_id and not self._shooting_hurt then
		self._died = true
	end
end

function CopActionHurt:type()
	return "hurt"
end

function CopActionHurt:hurt_type()
	return self._hurt_type
end

function CopActionHurt:expired()
	return self._expired
end

function CopActionHurt:chk_block(action_type, t)
	if self._hurt_type == "death" then
		return true
	elseif action_type == "death" then
		return false
	elseif CopActionAct.chk_block(self, action_type, t) then
		return true
	elseif (action_type == "hurt" or action_type == "heavy_hurt" or action_type == "hurt_sick" or action_type == "poison_hurt") and not self._ext_anim.hurt_exit then
		return true
	elseif action_type == "turn" then
		return true
	end
end

function CopActionHurt:on_attention(attention)
	self._attention = attention
end

function CopActionHurt:on_death_exit()
	if self._shooting_hurt then
		self._shooting_hurt = false

		if self._weapon_unit then
			self._weapon_unit:base():stop_autofire()
		end
	end

	if not self._ragdolled then
		self._unit:set_animations_enabled(false)
	end
end

function CopActionHurt:on_death_drop(unit, stage)
	if self._weapon_dropped then
		return
	end

	if self._delayed_shooting_hurt_clbk_id then
		managers.enemy:remove_delayed_clbk(self._delayed_shooting_hurt_clbk_id)

		self._delayed_shooting_hurt_clbk_id = nil
	end

	if self._shooting_hurt then
		if stage == 2 then
			if self._weapon_unit then
				self._weapon_unit:base():stop_autofire()
			end

			self._ext_inventory:drop_weapon()

			self._weapon_dropped = true
			self._shooting_hurt = false
		end
	elseif self._ext_inventory then
		self._ext_inventory:drop_weapon()

		self._weapon_dropped = true
	end
end

function CopActionHurt:body_part()
	return self._body_part
end

function CopActionHurt:need_upd()
	if self._died then
		return false
	else
		return true
	end
end

function CopActionHurt:on_inventory_event(event)
	local weapon_unit = self._ext_inventory:equipped_unit()

	if weapon_unit then
		local weap_tweak = weapon_unit:base():weapon_tweak_data()
		local weapon_usage_tweak = self._common_data.char_tweak.weapon[weap_tweak.usage]
		self._weapon_unit = weapon_unit
		self._weapon_base = weapon_unit:base()
		self._weap_tweak = weap_tweak
		self._w_usage_tweak = weapon_usage_tweak
		self._reload_speed = weapon_usage_tweak.RELOAD_SPEED
		self._spread = weapon_usage_tweak.spread
		self._falloff = weapon_usage_tweak.FALLOFF
		self._automatic_weap = weap_tweak.auto and true
	else
		self._weapon_unit = false
		self._shooting_hurt = false
	end
end

function CopActionHurt:save(save_data)
	for i, k in pairs(self._action_desc) do
		if type_name(k) ~= "Unit" or alive(k) then
			save_data[i] = k
		end
	end
end

function CopActionHurt:_prepare_ragdoll()
	if self._unit:damage() and self._unit:damage():has_sequence("prepare_ragdoll") then
		self._unit:damage():run_sequence_simple("prepare_ragdoll")
	end
end

function CopActionHurt:_start_ragdoll(reset_momentum)
	if self._ragdolled then
		return true
	end

	if reset_momentum and self._unit:damage() and self._unit:damage():has_sequence("leg_arm_hitbox") then
		self._unit:damage():run_sequence_simple("leg_arm_hitbox")
	end

	if self._unit:damage() and self._unit:damage():has_sequence("switch_to_ragdoll") then
		self:on_death_drop(self._unit, 2)

		self._ragdolled = true

		self._unit:base():set_visibility_state(1)
		self._unit:set_driving("orientation_object")
		self._unit:anim_state_machine():set_enabled(false)
		self._unit:set_animations_enabled(false)

		local res = self._unit:damage():run_sequence_simple("switch_to_ragdoll")

		self._unit:add_body_activation_callback(callback(self, self, "clbk_body_active_state"))

		self._root_act_tags = {}
		local hips_body = self._unit:body("rag_Hips")
		local tag = hips_body:activate_tag()

		if tag == Idstring("") then
			tag = Idstring("root_follow")

			hips_body:set_activate_tag(tag)
		end

		self._root_act_tags[tag:key()] = true
		tag = hips_body:deactivate_tag()

		if tag == Idstring("") then
			tag = Idstring("root_follow")

			hips_body:set_deactivate_tag(tag)
		end

		self._root_act_tags[tag:key()] = true
		self._hips_obj = self._unit:get_object(Idstring("Hips"))
		self._ragdoll_active = true

		self._ext_movement:enable_update()

		local hips_pos = self._hips_obj:position()
		self._rag_pos = hips_pos
		self._ragdoll_freeze_clbk_id = "freeze_rag" .. tostring(self._unit:key())

		managers.enemy:add_delayed_clbk(self._ragdoll_freeze_clbk_id, callback(self, self, "clbk_chk_freeze_ragdoll"), TimerManager:game():time() + 3)

		if self._unit:anim_data().repel_loop then
			self._unit:sound():anim_clbk_play_sound(self._unit, "repel_end")
		end

		return true
	end
end

function CopActionHurt:force_ragdoll(reset_momentum)
	if self:_start_ragdoll(reset_momentum) then
		self.update = self._upd_ragdolled

		self._ext_movement:enable_update()
	end
end

function CopActionHurt:clbk_body_active_state(tag, unit, body, activated)
	if self._root_act_tags[tag:key()] then
		if activated then
			self._died = false
			self._ragdoll_active = true

			self._ext_movement:enable_update()
		else
			self._ragdoll_active = false

			if not self._shooting_hurt then
				self._died = true
			end
		end
	end
end

CopActionHurt._apply_freefall = CopActionWalk._apply_freefall

function CopActionHurt:_freeze_ragdoll()
	self._root_act_tags = {}

	if self._unit:damage() and self._unit:damage():has_sequence("freeze_ragdoll") then
		self._unit:damage():run_sequence_simple("freeze_ragdoll")
	end
end

function CopActionHurt:clbk_chk_freeze_ragdoll()
	if not alive(self._unit) then
		self._ragdoll_freeze_clbk_id = nil

		return
	end

	local t = TimerManager:game():time()

	self._hips_obj:m_position(tmp_vec1)

	local cur_dis = mvec3_dis(self._rag_pos, tmp_vec1)

	if cur_dis < 30 then
		self:_freeze_ragdoll()

		self._ragdoll_freeze_clbk_id = nil
	else
		mvec3_set(self._rag_pos, tmp_vec1)
		managers.enemy:add_delayed_clbk(self._ragdoll_freeze_clbk_id, callback(self, self, "clbk_chk_freeze_ragdoll"), t + 1.5)
	end
end

function CopActionHurt:clbk_shooting_hurt()
	self._delayed_shooting_hurt_clbk_id = nil

	if not alive(self._weapon_unit) then
		return
	end

	local fire_obj = self._weapon_unit:base().fire_object and self._weapon_unit:base():fire_object()

	if fire_obj then
		self._weapon_unit:base():singleshot(fire_obj:position(), fire_obj:rotation(), 1, false, nil, nil, nil, nil)
	end
end

function CopActionHurt:on_destroy()
	if self._burn_death_effects_clbk_id then
		managers.enemy:remove_delayed_clbk(self._burn_death_effects_clbk_id)

		self._burn_death_effects_clbk_id = nil
	end

	self:_remove_burn_death_effects(true)

	if self._shooting_hurt then
		self._shooting_hurt = false

		if self._weapon_unit then
			self._weapon_unit:base():stop_autofire()
		end
	end

	if self._delayed_shooting_hurt_clbk_id then
		managers.enemy:remove_delayed_clbk(self._delayed_shooting_hurt_clbk_id)

		self._delayed_shooting_hurt_clbk_id = nil
	end
end
