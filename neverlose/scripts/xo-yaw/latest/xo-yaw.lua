slot_0_0_1 = nil
slot_0_0_0 = {
	data = {}
}

function slot_0_0_0.listen(arg_1_0)
	if slot_0_0_0.data[arg_1_0] then
		return print(string.format("Already listening for %s.", arg_1_0))
	end

	slot_0_0_0.data[arg_1_0] = common.get_timestamp()
end

function slot_0_0_0.finish(arg_2_0)
	if not slot_0_0_0.data[arg_2_0] then
		return print(string.format("Failed to finish %s benchmark.\nReason: Event doesn't exist.", arg_2_0))
	end

	print(string.format("%s took %f ms.", arg_2_0, common.get_timestamp() - slot_0_0_0.data[arg_2_0]))

	slot_0_0_0.data[arg_2_0] = nil
end

function slot_0_0_0.listener(arg_3_0, arg_3_1, ...)
	local var_3_0 = common.get_timestamp()
	local var_3_1 = {
		arg_3_1(...)
	}

	print(string.format("%s took %f ms.", arg_3_0, common.get_timestamp() - var_3_0))

	return unpack(var_3_1)
end

function slot_0_1_0(arg_4_0, ...)
	return true, arg_4_0(...)
end

slot_0_2_0 = require("neverlose/puiwka")
slot_0_3_0 = require("neverlose/aa_handler")
slot_0_4_0 = require("neverlose/sec-base64")
slot_0_5_0 = require("neverlose/memory")
slot_0_6_0 = require("neverlose/md5")
slot_0_7_0 = require("neverlose/inspect")
slot_0_8_0 = (function()
	return {
		data = {},
		new_frame = function(arg_6_0, arg_6_1)
			for iter_6_0, iter_6_1 in pairs(arg_6_0.data) do
				if arg_6_1 - iter_6_1.last_tick >= iter_6_1.speed then
					iter_6_1.flicked = not iter_6_1.flicked
					iter_6_1.last_tick = arg_6_1
				end
			end
		end,
		flick = function(arg_7_0, arg_7_1, arg_7_2, arg_7_3, arg_7_4)
			local var_7_0 = math.min(arg_7_2, arg_7_3)
			local var_7_1 = math.max(arg_7_2, arg_7_3)

			if not arg_7_0.data[arg_7_1] then
				arg_7_0.data[arg_7_1] = {
					flicked = false,
					last_tick = 0,
					speed = arg_7_4
				}
			end

			if arg_7_0.data[arg_7_1].speed ~= arg_7_4 then
				arg_7_0.data[arg_7_1].speed = arg_7_4
			end

			return arg_7_0.data[arg_7_1].flicked and var_7_1 or var_7_0
		end
	}
end)()
slot_0_9_0 = (function()
	return {
		data = {},
		new_frame = function(arg_9_0, arg_9_1)
			for iter_9_0, iter_9_1 in pairs(arg_9_0.data) do
				if arg_9_1 - iter_9_1.last_tick >= iter_9_1.speed then
					local var_9_0 = iter_9_1.times

					for iter_9_2 = 1, var_9_0 do
						if iter_9_1.forward or iter_9_1.spin then
							if iter_9_1.value < iter_9_1.max then
								iter_9_1.value = iter_9_1.value + 1
							elseif iter_9_1.spin then
								iter_9_1.value = iter_9_1.min
							else
								iter_9_1.forward = false
							end
						elseif iter_9_1.value > iter_9_1.min then
							iter_9_1.value = iter_9_1.value - 1
						else
							iter_9_1.forward = true
						end
					end

					iter_9_1.last_tick = arg_9_1
				end
			end
		end,
		sway = function(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5)
			local var_10_0 = math.min(arg_10_2, arg_10_3)
			local var_10_1 = math.max(arg_10_2, arg_10_3)
			local var_10_2 = arg_10_5 or 1

			if not arg_10_0.data[arg_10_1] then
				arg_10_0.data[arg_10_1] = {
					forward = true,
					last_tick = 0,
					value = var_10_0,
					min = var_10_0,
					max = var_10_1,
					speed = arg_10_4,
					times = var_10_2
				}
			end

			local var_10_3 = arg_10_0.data[arg_10_1]

			if var_10_3.min ~= var_10_0 or var_10_3.max ~= var_10_1 then
				arg_10_0.data[arg_10_1] = {
					forward = true,
					last_tick = 0,
					value = var_10_0,
					min = var_10_0,
					max = var_10_1,
					speed = arg_10_4,
					times = var_10_2
				}
			end

			if arg_10_0.data[arg_10_1].speed ~= arg_10_4 then
				arg_10_0.data[arg_10_1].speed = arg_10_4
			end

			if arg_10_0.data[arg_10_1].times ~= var_10_2 then
				arg_10_0.data[arg_10_1].times = var_10_2
			end

			return arg_10_0.data[arg_10_1].value
		end,
		spin = function(arg_11_0, arg_11_1, arg_11_2, arg_11_3, arg_11_4, arg_11_5)
			local var_11_0 = math.min(arg_11_2, arg_11_3)
			local var_11_1 = math.max(arg_11_2, arg_11_3)
			local var_11_2 = arg_11_5 or 1

			if not arg_11_0.data[arg_11_1] then
				arg_11_0.data[arg_11_1] = {
					forward = true,
					spin = true,
					last_tick = 0,
					value = var_11_0,
					min = var_11_0,
					max = var_11_1,
					speed = arg_11_4,
					times = var_11_2
				}
			end

			local var_11_3 = arg_11_0.data[arg_11_1]

			if var_11_3.min ~= var_11_0 or var_11_3.max ~= var_11_1 then
				arg_11_0.data[arg_11_1] = {
					forward = true,
					spin = true,
					last_tick = 0,
					value = var_11_0,
					min = var_11_0,
					max = var_11_1,
					speed = arg_11_4,
					times = var_11_2
				}
			end

			if arg_11_0.data[arg_11_1].speed ~= arg_11_4 then
				arg_11_0.data[arg_11_1].speed = arg_11_4
			end

			if arg_11_0.data[arg_11_1].times ~= var_11_2 then
				arg_11_0.data[arg_11_1].times = var_11_2
			end

			return arg_11_0.data[arg_11_1].value
		end
	}
end)()

function slot_0_10_0(arg_12_0, arg_12_1, arg_12_2)
	local var_12_0, var_12_1 = slot_0_1_0(render.load_font, arg_12_0, arg_12_1, arg_12_2)

	if not var_12_0 then
		print(string.format("xo-yaw.lua -> Failed to load font %s", arg_12_0))

		return 1
	end

	return var_12_1
end

slot_0_11_0 = {
	update_date = "15 April 2026",
	label = "xo-yaw",
	version = "Sunset",
	switch = false,
	online = 0,
	menu_alpha = 0,
	jitter = 0,
	username = common.get_username(),
	screen = render.screen_size(),
	screen_center = render.screen_size() / 2,
	colors = {
		default = color("FF90D9FF"),
		white = color(),
		link_active = color(),
		warning = color(),
		idle = color(225, 90)
	},
	functions = {
		backstab = false,
		legit = false,
		edge = false,
		air_exploit = false,
		nade_fix = false,
		randomization = false,
		hidden_static = false,
		hidden_aa = false,
		vanish = false,
		safe_head = false
	},
	states = {
		"Global",
		"Stand",
		"Move",
		"Slow Walk",
		"Crouch",
		"Crouch Move",
		"Air",
		"Air+",
		"Fake Lag",
		"Using"
	},
	hidden_states = {
		"Stand",
		"Move",
		"Slow Walk",
		"Crouch",
		"Crouch Move",
		"Air",
		"Air+",
		"On Peek"
	},
	states_enum = {
		USING = 10,
		FAKELAG = 9,
		AIR_CR = 8,
		AIR = 7,
		CROUCH_MOVE = 6,
		CROUCH = 5,
		SLOWWALK = 4,
		MOVE = 3,
		STAND = 2,
		GLOBAL = 1
	}
}
slot_0_12_0 = {
	native_inverter = false,
	velocity_modifier = 0,
	landing = false,
	on_ground = false,
	moving = 0,
	velocity = 0,
	crouch = false,
	condition = "",
	body_yaw = 0
}
slot_0_13_0 = {
	max_tickbase = 0,
	ticks = 0,
	max = 0
}
slot_0_14_0 = {
	RAGE = {
		aimbot = {
			hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"),
			double_tap = {
				main = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
				options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
			},
			hide_shots = {
				main = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
				options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
			}
		},
		other = {
			auto_scope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"),
			min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
			hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
			body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
			safe_point = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
			dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
			peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist")
		}
	},
	AA = {
		angles = {
			enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
			pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
			yaw = {
				main = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
				base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
				offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
				backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
				hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
			},
			yaw_modifier = {
				main = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
				offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
			},
			body_yaw = {
				main = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
				inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
				left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
				right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
				options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
				freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
			},
			freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
			extended_angles = {
				main = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
				pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
				roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
			}
		},
		fake_lag = {
			main = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"),
			limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
			variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
		},
		other = {
			fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
			slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
			leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
		}
	},
	VISUALS = {
		scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
		thirdperson = ui.find("Visuals", "World", "Main", "Force Thirdperson"),
		hitmarker = ui.find("Visuals", "World", "Other", "Hit Marker"),
		fov = ui.find("Visuals", "World", "Main", "Field of View")
	},
	MISC = {
		clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
		windows = ui.find("Miscellaneous", "Main", "Other", "Windows"),
		log_events = ui.find("Miscellaneous", "Main", "Other", "Log Events"),
		fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
		air_duck = ui.find("Miscellaneous", "Main", "Movement", "Air Duck"),
		weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions")
	}
}
slot_0_15_0 = (function()
	local var_13_0 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 7, "int(__thiscall*)(void*)")
	local var_13_1 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 9, "void(__thiscall*)(void*, const char*, int)")
	local var_13_2 = utils.get_vfunc("vgui2.dll", "VGUI_System010", 11, "int(__thiscall*)(void*, int, const char*, int)")

	local function var_13_3(...)
		local var_14_0 = tostring(table.concat({
			...
		}))

		var_13_1(var_14_0, string.len(var_14_0))
	end

	local function var_13_4()
		local var_15_0 = var_13_0()

		if var_15_0 > 0 then
			local var_15_1 = ffi.typeof("char[?]")(var_15_0)

			var_13_2(0, var_15_1, var_15_0)

			local var_15_2 = ffi.string(var_15_1, var_15_0 - 1)
			local var_15_3
			local var_15_4 = var_15_2:find("_xoyaw")

			if var_15_4 then
				var_15_2 = var_15_2:sub(1, var_15_4)
			end

			return var_15_2
		end
	end

	return {
		set = var_13_3,
		get = var_13_4
	}
end)()
slot_0_16_1 = nil
slot_0_16_0 = {
	DEV_MODE = not _IS_MARKET
}
slot_0_17_3 = nil
slot_0_17_2 = {}
slot_0_18_4 = "99w2HabpkgfgUY"
slot_0_19_4 = "https://xo-back.sokirkoyaw.ru/reports"

function slot_0_20_4(arg_16_0, arg_16_1)
	return slot_0_6_0.sumhexa(string.format("reports-%s%s", arg_16_0, arg_16_1))
end

slot_0_21_3 = {}

function slot_0_17_2.send(arg_17_0, arg_17_1, arg_17_2)
	if slot_0_21_3[arg_17_2] then
		return false
	end

	slot_0_21_3[arg_17_2] = true

	local var_17_0 = slot_0_20_4(arg_17_0, slot_0_18_4)

	network.post(slot_0_19_4, {
		username = arg_17_0,
		signature = var_17_0,
		report = arg_17_1
	}, {
		["Content-Type"] = "application/json"
	}, function(...)
		return
	end)
end

function slot_0_17_2.markup(arg_19_0, arg_19_1, arg_19_2)
	return ("\n\nUsername: <b>%s</b>\nCallback: <b>%s</b> (%s)\n\nError:\n<code>%s</code>"):format(common.get_username(), arg_19_0, arg_19_1, arg_19_2)
end

slot_0_18_3 = {}

function slot_0_19_3(arg_20_0)
	if slot_0_18_3[arg_20_0] == nil then
		slot_0_18_3[arg_20_0] = {}

		events[arg_20_0]:set(function(arg_21_0)
			local var_21_0 = slot_0_18_3[arg_20_0]

			var_21_0.local_player = entity.get_local_player()
			var_21_0.is_valid = var_21_0.local_player ~= nil and var_21_0.local_player:is_alive()
		end)

		return slot_0_18_3[arg_20_0]
	end

	return slot_0_18_3[arg_20_0]
end

slot_0_20_3 = {
	__index = function(arg_22_0, arg_22_1)
		local var_22_0 = events[arg_22_1]

		return {
			set = function(arg_23_0, arg_23_1)
				local var_23_0 = slot_0_19_3(arg_22_1)
				local var_23_1

				if not slot_0_16_0.DEV_MODE then
					function var_23_1(arg_24_0)
						local var_24_0
						local var_24_1

						if arg_24_0 == nil then
							var_24_0, var_24_1 = slot_0_1_0(arg_23_1, var_23_0.local_player, var_23_0.is_valid)
						else
							var_24_0, var_24_1 = slot_0_1_0(arg_23_1, arg_24_0, var_23_0.local_player, var_23_0.is_valid)
						end

						if not var_24_0 then
							return slot_0_17_2.send(common.get_username(), slot_0_17_2.markup(arg_22_0.name, arg_22_1, var_24_1), arg_22_0.name)
						end

						return var_24_1
					end
				else
					function var_23_1(arg_25_0)
						if arg_25_0 == nil then
							return arg_23_1(var_23_0.local_player, var_23_0.is_valid)
						else
							return arg_23_1(arg_25_0, var_23_0.local_player, var_23_0.is_valid)
						end
					end
				end

				var_22_0:set(var_23_1)
			end
		}
	end,
	__tostring = function(arg_26_0)
		return "callback instance(" .. arg_26_0.name .. ")"
	end
}
slot_0_21_2 = {}

function slot_0_22_2(arg_27_0)
	if slot_0_21_2[arg_27_0] == nil then
		slot_0_21_2[arg_27_0] = setmetatable({
			name = arg_27_0
		}, slot_0_20_3)
	end

	return slot_0_21_2[arg_27_0]
end

slot_0_23_2 = {
	__index = function(arg_28_0, arg_28_1)
		return slot_0_22_2(arg_28_1)
	end
}
slot_0_16_0 = setmetatable(slot_0_16_0, slot_0_23_2)
slot_0_17_1 = nil
slot_0_17_0 = {}
slot_0_18_2 = utils.get_vfunc("engine.dll", "VEngineClient014", 91, "float(__thiscall*)(void*)")

function slot_0_19_2(arg_29_0, arg_29_1, arg_29_2, arg_29_3, arg_29_4)
	local var_29_0 = arg_29_0(arg_29_3, arg_29_1, arg_29_2 - arg_29_1, arg_29_4)

	if type(var_29_0) == "number" then
		if math.abs(arg_29_2 - var_29_0) <= 0.01 then
			return arg_29_2
		end

		local var_29_1 = var_29_0 % 1

		if var_29_1 < 0.001 then
			return math.floor(var_29_0)
		end

		if var_29_1 > 0.999 then
			return math.ceil(var_29_0)
		end
	end

	return var_29_0
end

slot_0_20_2 = {}
slot_0_20_2.__call, slot_0_20_2.__metatable = function(arg_30_0, arg_30_1, arg_30_2, arg_30_3)
	local var_30_0 = type(arg_30_0.value)
	local var_30_1 = type(arg_30_2)

	if var_30_1 == "boolean" then
		arg_30_2 = arg_30_2 and 1 or 0
		var_30_1 = "number"
	end

	assert(var_30_0 == var_30_1, string.format("type mismatch, expected %s (received %s)", var_30_0, var_30_1))

	if arg_30_2 ~= arg_30_0.to then
		arg_30_0.clock = 0
		arg_30_0.from = arg_30_0.value
		arg_30_0.to = arg_30_2
	end

	local var_30_2 = globals.frametime / slot_0_18_2()
	local var_30_3 = arg_30_1 or 0.15

	if arg_30_0.clock == var_30_3 then
		return arg_30_2
	end

	if var_30_2 <= 0 and var_30_3 <= var_30_2 then
		arg_30_0.clock = 0
		arg_30_0.from = arg_30_2
		arg_30_0.to = arg_30_2
		arg_30_0.value = arg_30_2

		return arg_30_2
	end

	arg_30_0.clock = math.min(arg_30_0.clock + var_30_2, var_30_3)
	arg_30_0.value = slot_0_19_2(arg_30_3 or arg_30_0.easings, arg_30_0.from, arg_30_0.to, arg_30_0.clock, var_30_3)

	return arg_30_0.value
end, false
slot_0_20_2.__index = slot_0_20_2

function slot_0_17_0.new(arg_31_0, arg_31_1, arg_31_2)
	if type(arg_31_1) == "boolean" then
		arg_31_1 = arg_31_1 and 1 or 0
	end

	local var_31_0 = {}

	var_31_0.clock = 0
	var_31_0.value = arg_31_1 or 0
	var_31_0.easings = arg_31_2 or function(arg_32_0, arg_32_1, arg_32_2, arg_32_3)
		return arg_32_2 * arg_32_0 / arg_32_3 + arg_32_1
	end

	return setmetatable(var_31_0, slot_0_20_2)
end

slot_0_18_1 = nil
slot_0_18_0 = {}
slot_0_19_1 = {}
slot_0_20_1 = ""
slot_0_21_1 = false
slot_0_22_1 = vector()
slot_0_23_1 = false
slot_0_24_2 = false
slot_0_25_4 = false
slot_0_26_2 = slot_0_11_0.screen_center.x + 20
slot_0_27_4 = slot_0_11_0.screen_center.x - 20
slot_0_28_4 = nil
slot_0_29_5 = ui.create("...")

function slot_0_18_0.add(arg_33_0, arg_33_1, arg_33_2)
	slot_0_19_1[arg_33_0] = {
		dragging = false,
		is_in_b = false,
		is_rmb_pressed = false,
		id = arg_33_0,
		menu = {
			x = slot_0_29_5:slider(arg_33_0 .. "_x", 0, slot_0_11_0.screen.x, arg_33_1.x),
			y = slot_0_29_5:slider(arg_33_0 .. "_y", 0, slot_0_11_0.screen.y, arg_33_1.y)
		},
		position = arg_33_1,
		size = arg_33_2,
		max = slot_0_11_0.screen - arg_33_2,
		drag = vector(),
		process = function(arg_34_0)
			if not slot_0_23_1 then
				return arg_34_0
			end

			local var_34_0 = arg_34_0.position
			local var_34_1 = arg_34_0.position + arg_34_0.size
			local var_34_2 = slot_0_22_1.x >= var_34_0.x and slot_0_22_1.y >= var_34_0.y and slot_0_22_1.x <= var_34_1.x and slot_0_22_1.y <= var_34_1.y

			arg_34_0.is_rmb_pressed = var_34_2 and slot_0_25_4
			arg_34_0.is_in_b = var_34_2

			if var_34_2 or arg_34_0.dragging then
				slot_0_21_1 = true
			end

			if (var_34_2 or arg_34_0.dragging) and (slot_0_20_1 == "" or slot_0_20_1 == arg_33_0) and slot_0_24_2 then
				slot_0_20_1 = arg_33_0

				if not arg_34_0.dragging then
					arg_34_0.dragging = true
					arg_34_0.drag = slot_0_22_1 - var_34_0
				else
					arg_34_0.position = slot_0_22_1 - arg_34_0.drag
				end

				if false then
					if arg_34_0.position.x > slot_0_27_4 and arg_34_0.position.x < slot_0_26_2 then
						arg_34_0.position.x = slot_0_11_0.screen_center.x
					end

					local var_34_3 = arg_34_0.position.x + arg_34_0.size.x

					if var_34_3 > slot_0_27_4 and var_34_3 < slot_0_26_2 then
						arg_34_0.position.x = slot_0_11_0.screen_center.x - arg_34_0.size.x
					end

					local var_34_4 = arg_34_0.size.x / 2
					local var_34_5 = arg_34_0.position.x + var_34_4

					if var_34_5 > slot_0_27_4 and var_34_5 < slot_0_26_2 then
						arg_34_0.position.x = slot_0_11_0.screen_center.x - var_34_4
					end
				end
			elseif not slot_0_24_2 then
				slot_0_20_1 = ""
				arg_34_0.dragging = false
				arg_34_0.drag = vector(0, 0)
			end

			arg_34_0.position = vector(math.clamp(arg_34_0.position.x, 0, arg_34_0.max.x), math.clamp(arg_34_0.position.y, 0, arg_34_0.max.y))

			arg_34_0.menu.x:set(arg_34_0.position.x)
			arg_34_0.menu.y:set(arg_34_0.position.y)

			return arg_34_0
		end
	}

	if slot_0_19_1[arg_33_0].menu.x:get() ~= arg_33_1.x then
		slot_0_19_1[arg_33_0].position = vector(slot_0_19_1[arg_33_0].menu.x:get(), slot_0_19_1[arg_33_0].menu.y:get())
	end

	slot_0_19_1[arg_33_0].menu.x:visibility(false)
	slot_0_19_1[arg_33_0].menu.y:visibility(false)

	return slot_0_19_1[arg_33_0]
end

slot_0_16_0.Containers.render:set(function()
	slot_0_28_4 = nil
	slot_0_21_1 = false
	slot_0_23_1 = slot_0_11_0.menu_alpha > 0

	if slot_0_23_1 then
		slot_0_22_1 = ui.get_mouse_position()
		slot_0_24_2 = common.is_button_down(1)
		slot_0_25_4 = common.is_button_down(2)

		if slot_0_25_4 then
			slot_0_24_2 = false
		end
	end
end)
slot_0_16_0.Containers.mouse_input:set(function()
	return not slot_0_21_1
end)

function slot_0_19_0(arg_37_0, arg_37_1)
	local var_37_0 = globals.realtime * (arg_37_1 or 1) % math.pi
	local var_37_1 = math.sin(var_37_0 + (arg_37_0 or 0))

	return (math.abs(var_37_1))
end

function slot_0_20_0(arg_38_0)
	local var_38_0 = rage.antiaim:get_target()

	if var_38_0 == nil then
		return
	end

	local var_38_1 = arg_38_0:get_origin()
	local var_38_2 = math.normalize_yaw(var_38_0 - 180)
	local var_38_3
	local var_38_4 = math.huge

	entity.get_players(true, true, function(arg_39_0)
		local var_39_0 = (arg_39_0:get_origin() - var_38_1):angles()

		if math.abs(var_39_0.y - var_38_2) < var_38_4 then
			var_38_3 = arg_39_0
			var_38_4 = math.abs(var_39_0.y - var_38_2)
		end
	end)

	return var_38_3
end

slot_0_21_0 = {}
slot_0_22_0 = nil

function slot_0_21_0.convert(arg_40_0)
	if arg_40_0 == nil then
		return {}
	end

	local var_40_0 = {}

	for iter_40_0 = 1, #arg_40_0 do
		var_40_0[arg_40_0[iter_40_0]] = true
	end

	return var_40_0
end

function slot_0_21_0.invert(arg_41_0)
	if arg_41_0 == nil then
		return {}
	end

	local var_41_0 = {}

	for iter_41_0, iter_41_1 in pairs(arg_41_0) do
		if iter_41_1 then
			var_41_0[#var_41_0 + 1] = iter_41_0
		end
	end

	return var_41_0
end

function slot_0_21_0.contains(arg_42_0, arg_42_1)
	local var_42_0 = false

	for iter_42_0 = 1, #arg_42_0 do
		if arg_42_0[iter_42_0] == arg_42_1 then
			var_42_0 = true

			break
		end
	end

	return var_42_0
end

function slot_0_21_0.tostring(arg_43_0)
	local var_43_0 = ""
	local var_43_1 = {}

	for iter_43_0 in pairs(arg_43_0) do
		table.insert(var_43_1, iter_43_0)
	end

	table.sort(var_43_1)

	for iter_43_1 = 1, #var_43_1 do
		local var_43_2 = var_43_1[iter_43_1]
		local var_43_3 = arg_43_0[var_43_2]

		var_43_0 = var_43_0 .. var_43_2 .. tostring(var_43_3)
	end

	return var_43_0
end

function string.clamp(arg_44_0, arg_44_1)
	if arg_44_1 < arg_44_0:len() then
		arg_44_0 = arg_44_0:sub(0, arg_44_1) .. "..."
	end

	return arg_44_0
end

function string.split(arg_45_0, arg_45_1)
	local var_45_0 = {}
	local var_45_1 = string.format("(.-)%s", arg_45_1)
	local var_45_2 = 0
	local var_45_3, var_45_4, var_45_5 = string.find(arg_45_0, var_45_1, 1)

	while var_45_3 do
		if var_45_3 ~= 1 or var_45_5 ~= "" then
			table.insert(var_45_0, var_45_5)
		end

		var_45_2 = var_45_4 + 1
		var_45_3, var_45_4, var_45_5 = string.find(arg_45_0, var_45_1, var_45_2)
	end

	if var_45_2 <= #arg_45_0 then
		local var_45_6 = arg_45_0:sub(var_45_2)

		table.insert(var_45_0, var_45_6)
	end

	return var_45_0
end

function string.proper_len(arg_46_0)
	return #arg_46_0:gsub("[\x80-\xBF]", "")
end

function string.wave(arg_47_0, arg_47_1, arg_47_2, arg_47_3)
	local var_47_0 = 0
	local var_47_1 = 1 / (string.proper_len(arg_47_0) - 1)
	local var_47_2, var_47_3 = arg_47_0:gsub("(.[\x80-\xBF]*)", function(arg_48_0)
		local var_48_0 = slot_0_19_0(var_47_0, arg_47_3)
		local var_48_1 = arg_47_1:lerp(arg_47_2, var_48_0)

		var_47_0 = var_47_0 + var_47_1

		return string.format("\a%s%s", var_48_1:to_hex(), arg_48_0), var_48_1
	end)

	return var_47_2, var_47_3
end

slot_0_23_0 = slot_0_2_0.initialize("xo-yaw")
slot_0_24_1 = {}
slot_0_25_3 = nil
slot_0_25_2 = {
	Home = slot_0_2_0.name("house", "## Home", 0, 5),
	Global = slot_0_2_0.name("earth-americas", "Global", 0, 5),
	group_global = slot_0_2_0.name("gears", "## General", 0, 5),
	tab_selection = slot_0_2_0.name("", "## Selection", 0, 0),
	Information = slot_0_2_0.name("", "## Information", 0, 0),
	Configs = slot_0_2_0.name("", "## Configs", 0, 0),
	Clickable = slot_0_2_0.name("computer-mouse-scrollwheel", "Clickable", 0, 5),
	Ragebot_Main = slot_0_2_0.name("", "## Main", 0, 0),
	AAOther_Tab = slot_0_2_0.name("", "## Other", 0, 0),
	AAAngles_Tab = slot_0_2_0.name("", "## Angles", 0, 0),
	AADefensive_Tab = slot_0_2_0.name("", "## Defensive", 0, 0),
	Visuals_Indication = slot_0_2_0.name("", "## Indicate", 0, 0),
	Visuals_View = slot_0_2_0.name("", "## View", 0, 0),
	Visuals_InGame = slot_0_2_0.name("", "## In-Game", 0, 0),
	Misc_Movement = slot_0_2_0.name("", "## Movement", 0, 0),
	Misc_InGame = slot_0_2_0.name("", "## Shared Features", 0, 0),
	Misc_Other = slot_0_2_0.name("", "## Modifications", 0, 0),
	toggle_on = slot_0_2_0.name("toggle-on", "%s", 1, 9),
	toggle_off = slot_0_2_0.name("toggle-off", "%s", 1, 9),
	["Unlock Ping Spike"] = slot_0_2_0.name("satellite-dish", "Unlock Ping", 3, 12),
	Tweaks = slot_0_2_0.name("wand-magic-sparkles", "Tweaks", 0, 12),
	["Automatic Teleport"] = slot_0_2_0.name("user-alien", "Discharge Exploit", 2, 15),
	["Baim Lethal"] = slot_0_2_0.name("skull", "Body Aim if Lethal", 2, 13),
	["Event Logger"] = slot_0_2_0.name("comment", "Event Logger", 2, 13),
	["Fast Switch"] = slot_0_2_0.name("hand-fist", "Quick Switch", 3, 14),
	["Break LC"] = slot_0_2_0.name("transporter", "Force Teleport Exploit", 2, 13),
	["Manual Yaw4ik"] = slot_0_2_0.name("street-view", "Manual Yaw", 1, 13),
	["Safe H"] = slot_0_2_0.name("user-shield", "Safe Head", 1, 9),
	["FS Disablers"] = slot_0_2_0.name("toggle-large-off", "FS Disablers", 0, 11),
	Randomization = slot_0_2_0.name("shuffle", "Randomization", 2, 11),
	["Legit AA"] = slot_0_2_0.name("circle-up", "Allow Anti Aim on Use", 2, 11),
	Edge = slot_0_2_0.name("magnet", "Edge Yaw", 3, 12),
	Backstab = slot_0_2_0.name("knife-kitchen", "Anti Backstab", 1, 11),
	["Vanish Mode"] = slot_0_2_0.name("eye-slash", "Vanish Mode", 0, 9),
	["Force Lag"] = slot_0_2_0.name("bolt", "Force Lag", 2, 12),
	["Hide Shots Def"] = slot_0_2_0.name("thumbs-up", "Compatible with Hide Shots", 1, 12),
	["Build Defensive"] = slot_0_2_0.name("terminal", "Build Defensive", 1, 11),
	Preset = slot_0_2_0.name("user-pen", "Preset", 0, 10),
	["Player State"] = slot_0_2_0.name("person-walking-arrow-loop-left", "Player State", 0, 10),
	["Crosshair Indicators"] = slot_0_2_0.name("sliders", "Crosshair Indicators", 0, 10),
	["Manual Arrows"] = slot_0_2_0.name("location-arrow", "Manual Arrows", 0, 13),
	Widgets = slot_0_2_0.name("pen-swirl", "Widgets", 0, 12),
	GS = slot_0_2_0.name("gallery-thumbnails", "Screen Indicators", 0, 10),
	Viewmodel = slot_0_2_0.name("hand-sparkles", "Override Viewmodel", 1, 8),
	["Animate Zoom"] = slot_0_2_0.name("magnifying-glass", "Animate Scope Zoom", 2, 11),
	["Aspect Ratio"] = slot_0_2_0.name("display", "Override Aspect Ratio", 1, 10),
	["Custom Scope"] = slot_0_2_0.name("crosshairs-simple", "Better Scope Overlay", 1, 11),
	["Hit Marker"] = slot_0_2_0.name("bullseye-arrow", "Hit Marker", 1, 11),
	["Grenade Radius"] = slot_0_2_0.name("bomb", "Grenade Radius", 1, 11),
	["Fast Ladder"] = slot_0_2_0.name("water-ladder", "Fast Ladder", 1, 11),
	["No Fall Damage"] = slot_0_2_0.name("person-falling-burst", "No Fall Damage", 1, 8),
	["Unmute Players"] = slot_0_2_0.name("volume-slash", "Unmute Muted Players", 0, 9),
	["Taskbar Notify"] = slot_0_2_0.name("triangle-exclamation", "Taskbar Notification", 2, 12),
	Trashtalk = slot_0_2_0.name("face-angry-horns", "Trashtalk", 1, 10),
	["Drop Nades"] = slot_0_2_0.name("bomb", "Drop Nades", 2, 11),
	["Custom Console"] = slot_0_2_0.name("square-terminal", "Custom Console Color", 3, 13),
	Clantag = slot_0_2_0.name("user-tag", "Clan Tag", 0, 9),
	["Shared Logo"] = slot_0_2_0.name("sparkles", "Shared Logo", 2, 12),
	["Damage Indicator"] = slot_0_2_0.name("hundred-points", "Damage Indicator", 0, 11),
	["Animation Breakers"] = slot_0_2_0.name("person-walking", "Animation Breaker", 4, 14),
	Reset = slot_0_2_0.name("rotate-left", "Reset", 0, 5)
}

for iter_0_0, iter_0_1 in pairs(slot_0_25_2) do
	ui.localize("en", iter_0_0, iter_0_1)
end

function slot_0_26_1(arg_49_0, arg_49_1)
	arg_49_0:name(arg_49_0:get() and string.format(ui.localize("en", "toggle_on"), " Override " .. arg_49_1) or string.format(ui.localize("en", "toggle_off"), " Override " .. arg_49_1))
end

slot_0_27_3 = nil
slot_0_27_2 = {}

slot_0_23_0:new_group(1, "Home", "Information", function(arg_50_0)
	arg_50_0:label("username")(slot_0_2_0.name("user", string.format("Welcome back, \a{Link Active}%s!", slot_0_11_0.username), 2, 10))
	arg_50_0:label("version")(slot_0_2_0.name("tag", string.format("Branch: \a{Link Active}%s", slot_0_11_0.version), 2, 10))
	arg_50_0:label("updated")(slot_0_2_0.name("circle-check", string.format("Updated: \a{Link Active}%s \t\t", slot_0_11_0.update_date), 2, 8))
	arg_50_0:button("discord_button")(string.format("\a{Link Active}%s  \a{Active Text}Discord", ui.get_icon("discord")), function()
		panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/GkJhY44rdB")
	end, true)

	arg_50_0:button("discord_verify")(string.format("\a{Link Active}%s  \a{Active Text}Get Discord Token", ui.get_icon("user-check")), nil, true).disabled = true

	arg_50_0:button("products")(string.format("\a{Link Active}%s  \a{Active Text}Products:", ui.get_icon("cart-shopping")), nil, true)
	arg_50_0:button("bloom_tool")(string.format("\a{Link Active}%s  \a{Active Text}Bloom.tool", ui.get_icon("handshake")), function()
		panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=Jsrk0K")
	end, true)
end)
slot_0_23_0:new_group(2, "Home", "Configs", function(arg_53_0)
	arg_53_0:list("config_list")("## Presets")

	arg_53_0:button("load")(slot_0_2_0.name("loader", "Load", 2, 5), nil, true).tooltip = "Loads a choosen config."
	arg_53_0:button("save")(slot_0_2_0.name("floppy-disk", "Save", 2, 5), nil, true).tooltip = "Creates / Overwrites current config."
	arg_53_0:button("remove")(slot_0_2_0.name("trash", "Remove", 2, 5), nil, true).tooltip = "Removes a config."
	arg_53_0:button("cfg_tutorial")(slot_0_2_0.name("file-circle-question", "", 5, 0), nil, true).tooltip = "Tutorial: how to load config (in console)"

	slot_0_23_0:reference("cfg_tutorial"):set_callback(function(arg_54_0)
		if arg_54_0 then
			common.add_notify("xo-yaw.lua", "Check your console")
			utils.console_exec("play ui/beepclear")
			print_raw("\n\a{Link Active}xo-yaw \a808080FF· \aDEFAULTGet config in your clipboard \n\a{Link Active}xo-yaw \a808080FF· \aDEFAULTWrite name for config and click save\n\a{Link Active}xo-yaw \a808080FF· \aDEFAULTClick import")
		end
	end)

	arg_53_0:button("export")(slot_0_2_0.name("file-export", "Export", 2, 5), nil, true).tooltip = "Exports a config."
	arg_53_0:button("import")(slot_0_2_0.name("file-import", "Import", 2, 5), nil, true).tooltip = "Imports a config."
	arg_53_0:button("default")(slot_0_2_0.name("file-check", "Default", 2, 5), nil, true).tooltip = "Loads default config from script author."

	arg_53_0:input("config_name")("## Name")
end)

slot_0_28_3 = nil
slot_0_28_2 = {
	tabs = {
		" Ragebot",
		"Anti Aim",
		"Visuals",
		"Misc"
	},
	icons = {
		"crosshairs",
		"user-shield",
		"paintbrush",
		"sparkles"
	}
}
slot_0_24_1.general_selection = slot_0_23_0:new_group(1, "group_global", "tab_selection", function(arg_55_0)
	slot_0_28_2.tab_list = arg_55_0:list("general_tabs")("\n", slot_0_28_2.tabs)

	function slot_0_28_2.handle_tabs()
		for iter_56_0, iter_56_1 in next, slot_0_28_2.tabs do
			ui.localize("en", iter_56_1, string.format("%s %s\t\aDEFAULT%s", slot_0_28_2.tab_list:get() == iter_56_0 and "\a{Link Active}" or "\aDEFAULT", ui.get_icon(slot_0_28_2.icons[iter_56_0]), slot_0_28_2.tabs[iter_56_0]))
		end
	end

	slot_0_28_2.tab_list.saveable = false

	slot_0_28_2.tab_list:set_callback(slot_0_28_2.handle_tabs, true)
end)
slot_0_29_3 = nil
slot_0_24_1.rage_main = slot_0_23_0:new_group(2, "group_global", "Ragebot_Main", function(arg_57_0)
	arg_57_0:selectable("rage_tweaks")("Tweaks", {
		"Fix Throw Nades",
		"Ignore Shift While Air Strafe"
	})

	local var_57_0
	local var_57_1, var_57_2 = arg_57_0:switch("automatic_tp")("Automatic Teleport")

	var_57_2:selectable("automatic_tp_weapons")("Weapons", {
		"Auto",
		"Scout",
		"AWP",
		"Pistols",
		"Taser",
		"Knife"
	})
	var_57_2:slider("automatic_tp_delay")("Delay", 1, 6, 2)
	var_57_1:set_callback(function(arg_58_0)
		var_57_2.visibility = arg_58_0:get()
	end, true)
	arg_57_0:switch("baim_lethal")("Baim Lethal")

	local var_57_3
	local var_57_4, var_57_5 = arg_57_0:switch("event_logger")("Event Logger")
	local var_57_6 = var_57_5:selectable("event_logger_events")("Events", {
		"Aimbot Shots",
		"Damage Dealt",
		"Purchases"
	})
	local var_57_7 = var_57_5:selectable("event_logger_draw")("Draw", {
		"Console",
		"Events",
		"Custom Notify"
	})
	local var_57_8 = var_57_5:color_picker("event_logger_clr")("Color", slot_0_11_0.colors.default)
	local var_57_9 = var_57_5:color_picker("event_logger_miss_clr")("Miss Color", color(255, 0, 0))

	local function var_57_10()
		if var_57_4:get() then
			local var_59_0 = slot_0_21_0.convert(slot_0_14_0.MISC.log_events:get())

			for iter_59_0, iter_59_1 in pairs(var_57_6:get()) do
				if iter_59_1 then
					var_59_0[iter_59_1] = false
				end
			end

			slot_0_14_0.MISC.log_events:override(slot_0_21_0.invert(var_59_0))
		else
			slot_0_14_0.MISC.log_events:override()
		end
	end

	var_57_4:set_callback(function(arg_60_0)
		var_57_5.visibility = arg_60_0:get()

		var_57_10()
	end, true)
	var_57_6:set_callback(function(arg_61_0)
		var_57_8.visibility = #arg_61_0:get() ~= 0
		var_57_9.visibility = arg_61_0:get("Aimbot Shots")

		var_57_10()
	end, true)
	slot_0_14_0.MISC.log_events:set_callback(var_57_10, true)
	arg_57_0:switch("fast_switch")("Fast Switch"):set_callback(function(arg_62_0)
		if arg_62_0:get() then
			local var_62_0 = slot_0_21_0.convert(slot_0_14_0.MISC.weapon_actions:get())

			var_62_0["Quick Switch"] = false

			slot_0_14_0.MISC.weapon_actions:override(slot_0_21_0.invert(var_62_0))
		else
			slot_0_14_0.MISC.weapon_actions:override()
		end
	end)
	arg_57_0:switch("force_tp")("Break LC")
	arg_57_0:slider("ping_spike_unlock")("Unlock Ping Spike", 0, 200, 0, 1, function(arg_63_0)
		if arg_63_0 == 0 then
			return "Off"
		end

		return arg_63_0 .. "ms"
	end)
	slot_0_23_0:reference("ping_spike_unlock"):set_callback(function(arg_64_0)
		if arg_64_0:get() == 0 then
			return slot_0_14_0.MISC.fake_latency:override()
		end

		slot_0_14_0.MISC.fake_latency:override(arg_64_0:get())
	end)
end)
slot_0_30_2 = nil
slot_0_24_1.antiaim_other = slot_0_23_0:new_group(1, "group_global", "AAOther_Tab", function(arg_65_0)
	local var_65_0
	local var_65_1, var_65_2 = arg_65_0:combo("manual_yaw")("Manual Yaw4ik", {
		"Disabled",
		"Forward",
		"Backward",
		"Left",
		"Right"
	})

	var_65_2:switch("manual_yaw_disabler")("Disable Yaw Modifiers", true)
	var_65_2:switch("manual_yaw_body_freestanding")("Body Freestanding")
	arg_65_0:selectable("safe_head")("Safe H", {
		"Stand",
		"Crouch",
		"Crouch Move",
		"Slow Walk",
		"Air+",
		"Air Knife",
		"Air Zeus"
	})
	arg_65_0:selectable("freestand_disablers")("FS Disablers", {
		"Stand",
		"Move",
		"Slow Walk",
		"Crouch",
		"Crouch Move",
		"Air",
		"Air+"
	})

	local var_65_3
	local var_65_4
	local var_65_5
	local var_65_6
	local var_65_7, var_65_8 = arg_65_0:switch("randomize_switch")("Randomization")
	local var_65_9 = var_65_8:switch("randomize_on_warmup")("On Warmup", true)
	local var_65_10 = var_65_8:switch("randomize_on_round_end")("On Round End", true)

	var_65_7:set_callback(function(arg_66_0)
		var_65_9.visibility = arg_66_0:get()
		var_65_10.visibility = arg_66_0:get()
	end, true)
	arg_65_0:switch("legit_aa")("Legit AA")
	arg_65_0:switch("edge_yaw")("Edge")
	arg_65_0:switch("anti_backstab")("Backstab"):set_callback(function(arg_67_0)
		slot_0_14_0.AA.angles.yaw.backstab:override(not arg_67_0:get())
	end, true)
	arg_65_0:switch("vanish_mode")("Vanish Mode")
end)
slot_0_24_1.antiaim_angles = slot_0_23_0:new_group(2, "group_global", "AAAngles_Tab", function(arg_68_0)
	local var_68_0 = arg_68_0:combo("antiaim_type")("Preset", {
		"Disabled",
		"Aggressive",
		"Unrivaled",
		"Classic",
		"Builder"
	})
	local var_68_1 = arg_68_0:combo("PlayerState")("Player State", slot_0_11_0.states)

	var_68_0:set_callback(function(arg_69_0)
		var_68_1.visibility = arg_69_0:get() == "Builder"
	end, true)

	for iter_68_0, iter_68_1 in ipairs(slot_0_11_0.states) do
		slot_0_24_1[iter_68_1] = slot_0_23_0:new_group(2, "group_global", string.format("## %s Angles", iter_68_1), function(arg_70_0)
			if iter_68_1 ~= slot_0_11_0.states[1] then
				arg_68_0:switch("Enabled_" .. iter_68_1)("Override " .. iter_68_1):set_callback(function(arg_71_0)
					slot_0_26_1(arg_71_0, iter_68_1)
				end, true)
			end

			if iter_68_1 ~= slot_0_11_0.states[10] then
				arg_70_0:combo("Pitch_" .. iter_68_1)("Pitch", {
					"Disabled",
					"Down",
					"Fake Down",
					"Fake Up"
				}):set("Down")

				slot_70_1_1 = nil
				slot_70_2_2, slot_70_3_3 = arg_70_0:combo("Yaw_" .. iter_68_1)("Yaw", {
					"Disabled",
					"Backward",
					"Static"
				})

				slot_70_2_2:set("Backward")
				slot_70_3_3:combo("YawBase_" .. iter_68_1)("Yaw Base", {
					"Local View",
					"At Target"
				})
				slot_70_3_3:combo("YawType_" .. iter_68_1)("Yaw Type", {
					"180",
					"Left / Right",
					"Flick",
					"Sway",
					"Spin"
				})
				slot_70_3_3:slider("YawOffset_" .. iter_68_1)("Offset", -180, 180, 0, 1, "°")
				slot_70_3_3:slider("YawOffsetLeft_" .. iter_68_1)("Left Offset", -180, 180, 0, 1, "°")
				slot_70_3_3:slider("YawOffsetRight_" .. iter_68_1)("Right Offset", -180, 180, 0, 1, "°")
				slot_70_3_3:slider("YawRandomize_" .. iter_68_1)("Randomize", -180, 180, 0, 1, "°")
				slot_70_3_3:slider("YawD_" .. iter_68_1)("Delay ## Bebra", 0, 10, 0, 1, function(arg_72_0)
					if arg_72_0 == 0 then
						return "Off"
					end

					return arg_72_0 .. "t"
				end)
				slot_70_3_3:slider("YawD2_" .. iter_68_1)("Second Delay ## Bebra", 0, 10, 0, 1, function(arg_73_0)
					if arg_73_0 == 0 then
						return "Off"
					end

					return arg_73_0 .. "t"
				end)
				slot_70_3_3:slider("YawDelay_" .. iter_68_1)("Delay", 1, 64, 5, 1, "t")
				slot_70_3_3:slider("YawSpeed_" .. iter_68_1)("Speed", 1, 64, 5, 1, "t")
				slot_0_23_0:reference("YawBase_" .. iter_68_1):set("At Target")

				function slot_70_4_3()
					local var_74_0 = slot_0_23_0:reference("YawType_" .. iter_68_1):get()

					slot_0_23_0:reference("YawOffset_" .. iter_68_1).visibility = var_74_0 == "180"
					slot_0_23_0:reference("YawOffsetLeft_" .. iter_68_1).visibility = var_74_0 ~= "180"
					slot_0_23_0:reference("YawOffsetRight_" .. iter_68_1).visibility = var_74_0 ~= "180"
					slot_0_23_0:reference("YawD_" .. iter_68_1).visibility = var_74_0 == "Left / Right"
					slot_0_23_0:reference("YawD2_" .. iter_68_1).visibility = var_74_0 == "Left / Right" and slot_0_23_0:reference("YawD_" .. iter_68_1):get() > 0
					slot_0_23_0:reference("YawDelay_" .. iter_68_1).visibility = var_74_0 == "Flick" or var_74_0 == "Sway"
					slot_0_23_0:reference("YawSpeed_" .. iter_68_1).visibility = var_74_0 == "Sway" or var_74_0 == "Spin"
				end

				slot_0_23_0:reference("YawD_" .. iter_68_1):set_callback(slot_70_4_3, true)
				slot_0_23_0:reference("YawType_" .. iter_68_1):set_callback(slot_70_4_3, true)
			end

			slot_70_1_0 = nil
			slot_70_2_1, slot_70_3_2 = arg_70_0:combo("YawModifier_" .. iter_68_1)("Yaw Modifier", {
				"Disabled",
				"Center",
				"Offset",
				"Random",
				"Spin",
				"Meta",
				"3-Way",
				"5-Way"
			})

			slot_70_3_2:switch("YawModifierWayType_" .. iter_68_1)("Custom Way Values")
			slot_70_3_2:combo("YawModifierWay_" .. iter_68_1)("Mode", {
				"2-Way",
				"3-Way",
				"5-Way"
			})

			for iter_70_0 = 1, 5 do
				slot_70_3_2:slider(string.format("YawModifierOffset_%s_%s", iter_70_0, iter_68_1))(string.format("Offset %s", iter_70_0 == 1 and "" or iter_70_0), -180, 180, 0, 1, "°")
			end

			slot_70_3_2:slider("YawModifierRandomize_" .. iter_68_1)("Randomize", 0, 180, 0, 1, function(arg_75_0)
				if arg_75_0 == 0 then
					return "Off"
				end

				return arg_75_0 .. "°"
			end)
			slot_70_3_2:slider("YawModifierDelay_" .. iter_68_1)("Delay Cycle", 4, 200, 50, 1, function(arg_76_0)
				if arg_76_0 == 4 then
					return "Off"
				end

				return arg_76_0 .. "t"
			end)
			slot_70_3_2:slider("YawModifierDelayT_" .. iter_68_1)("Delay Time", 5, 30, 15, 1, "t")
			slot_70_3_2:switch("YawModifierSafeYaw_" .. iter_68_1)("Safe Yaw")

			function slot_70_4_2()
				local var_77_0 = slot_0_23_0:reference("YawModifierWayType_" .. iter_68_1):get()
				local var_77_1 = slot_0_23_0:reference("YawModifier_" .. iter_68_1):get()

				slot_0_23_0:reference("YawModifierWayType_" .. iter_68_1).visibility = var_77_1 == "5-Way" or var_77_1 == "3-Way"
				slot_0_23_0:reference("YawModifierOffset_2_" .. iter_68_1).visibility = var_77_0 and (var_77_1 == "5-Way" or var_77_1 == "3-Way")
				slot_0_23_0:reference("YawModifierOffset_3_" .. iter_68_1).visibility = var_77_0 and (var_77_1 == "5-Way" or var_77_1 == "3-Way")
				slot_0_23_0:reference("YawModifierOffset_4_" .. iter_68_1).visibility = var_77_0 and var_77_1 == "5-Way"
				slot_0_23_0:reference("YawModifierOffset_5_" .. iter_68_1).visibility = var_77_0 and var_77_1 == "5-Way"
				slot_0_23_0:reference("YawModifierWay_" .. iter_68_1).visibility = var_77_1 == "Meta"
				slot_0_23_0:reference("YawModifierDelay_" .. iter_68_1).visibility = var_77_1 == "Meta"
				slot_0_23_0:reference("YawModifierDelayT_" .. iter_68_1).visibility = var_77_1 == "Meta"
				slot_0_23_0:reference("YawModifierDelayT_" .. iter_68_1).disabled = var_77_1 == "Meta" and slot_0_23_0:reference("YawModifierDelay_" .. iter_68_1):get() == 4
				slot_0_23_0:reference("YawModifierSafeYaw_" .. iter_68_1).visibility = var_77_1 == "Meta"
				slot_0_23_0:reference("YawModifierSafeYaw_" .. iter_68_1).disabled = var_77_1 == "Meta" and slot_0_23_0:reference("YawModifierDelay_" .. iter_68_1):get() == 4
			end

			slot_0_23_0:reference("YawModifierDelay_" .. iter_68_1):set_callback(slot_70_4_2, true)
			slot_0_23_0:reference("YawModifier_" .. iter_68_1):set_callback(slot_70_4_2, true)
			slot_0_23_0:reference("YawModifierWayType_" .. iter_68_1):set_callback(slot_70_4_2, true)

			slot_70_2_0 = nil
			slot_70_3_1, slot_70_4_1 = arg_70_0:switch("BodyYaw_" .. iter_68_1)("Body Yaw")

			slot_70_4_1:combo("LimitType_" .. iter_68_1)("Limit Type", {
				"Default",
				"Flick",
				"Sway"
			})
			slot_70_4_1:slider("LeftLimit_" .. iter_68_1)("Left Limit", 0, 58, 58, 1, "°")
			slot_70_4_1:slider("RightLimit_" .. iter_68_1)("Right Limit", 0, 58, 58, 1, "°")
			slot_70_4_1:slider("LimitDelay_" .. iter_68_1)("Delay", 1, 64, 5, 1, "t")
			slot_70_4_1:slider("LimitSpeed_" .. iter_68_1)("Speed", 1, 64, 5, 1, "t")
			slot_70_4_1:selectable("FakeOptions_" .. iter_68_1)("Options", {
				"Avoid Overlap",
				"Jitter",
				"Randomize Jitter",
				"Anti Bruteforce"
			})
			slot_70_4_1:combo("Freestanding_" .. iter_68_1)("Freestanding", {
				"Off",
				"Peek Fake",
				"Peek Real"
			})

			function slot_70_5_1()
				local var_78_0 = slot_0_23_0:reference("LimitType_" .. iter_68_1):get()

				slot_0_23_0:reference("LimitDelay_" .. iter_68_1).visibility = var_78_0 ~= "Default"
				slot_0_23_0:reference("LimitSpeed_" .. iter_68_1).visibility = var_78_0 == "Sway"
			end

			slot_0_23_0:reference("LimitType_" .. iter_68_1):set_callback(slot_70_5_1, true)

			slot_70_3_0 = nil
			slot_70_4_0, slot_70_5_0 = arg_70_0:switch("ExtendedAngles_" .. iter_68_1)("Extended Angles")

			slot_70_5_0:slider("ExtendedPitch_" .. iter_68_1)("Pitch", -180, 180, 0, 1, "°")
			slot_70_5_0:slider("ExtendedRoll_" .. iter_68_1)("Roll", 0, 90, 45, 1, "°")
		end)

		local var_68_2

		local function var_68_3()
			local var_79_0

			if iter_68_1 ~= slot_0_11_0.states[1] then
				var_79_0 = slot_0_23_0:reference("Enabled_" .. iter_68_1)
				var_79_0.visibility = var_68_1:get() == iter_68_1 and var_68_0.reference:get() == "Builder"
			end

			slot_0_24_1[iter_68_1].visibility = var_68_1:get() == iter_68_1 and slot_0_28_2.tab_list.reference:get() == 2 and (iter_68_1 == slot_0_11_0.states[1] and true or var_79_0:get()) and var_68_0.reference:get() == "Builder"
		end

		if iter_68_1 ~= slot_0_11_0.states[1] then
			slot_0_23_0:reference("Enabled_" .. iter_68_1):set_callback(var_68_3, true)
		end

		var_68_0.reference:set_callback(function(arg_80_0)
			var_68_1.visibility = arg_80_0:get() == "Builder"

			var_68_3()
		end, true)
		var_68_1:set_callback(var_68_3, true)
		slot_0_28_2.tab_list:set_callback(var_68_3, true)
	end
end)
slot_0_24_1.defensive_setup = slot_0_23_0:new_group(2, "group_global", "AADefensive_Tab", function(arg_81_0)
	local var_81_0 = {
		"Stand",
		"Move",
		"Slow Walk",
		"Crouch",
		"Crouch Move",
		"Air",
		"Air+"
	}
	local var_81_1 = {}

	for iter_81_0 = 1, #var_81_0 do
		var_81_1[iter_81_0] = var_81_0[iter_81_0]
	end

	table.insert(var_81_1, "On Peek")
	table.insert(var_81_1, "Triggers")

	local var_81_2
	local var_81_3 = {
		"Flashed",
		"Taking Damage",
		"Weapon Switch",
		"Edge Direction"
	}
	local var_81_4, var_81_5 = arg_81_0:selectable("hidden_conditions")("Force Lag", var_81_0)

	var_81_5:selectable("hidden_triggers")("Triggers", var_81_3)

	local var_81_6 = arg_81_0:switch("hidden_hs")("Hide Shots Def")
	local var_81_7 = arg_81_0:switch("hidden_aa")("Build Defensive")
	local var_81_8 = arg_81_0:combo("DefPlayerState")("Player State", var_81_1)

	var_81_7:set_callback(function(arg_82_0)
		var_81_8.visibility = arg_82_0:get()
	end)

	for iter_81_1, iter_81_2 in ipairs(var_81_1) do
		slot_0_24_1[iter_81_2 .. "defensive"] = slot_0_23_0:new_group(2, "group_global", string.format("## %s Defensive Angles", iter_81_2), function(arg_83_0)
			arg_81_0:switch("DefEnabled_" .. iter_81_2)("Override " .. iter_81_2):set_callback(function(arg_84_0)
				slot_0_26_1(arg_84_0, iter_81_2)
			end, true)

			if iter_81_2 ~= "Triggers" then
				local var_83_0, var_83_1 = arg_83_0:combo("DefMode_" .. iter_81_2)("Mode", {
					"Default",
					"Flick"
				})
				local var_83_2, var_83_3 = arg_83_0:combo("DefPitch_" .. iter_81_2)("Pitch", {
					"Default",
					"Static",
					"Jitter",
					"Spin"
				})

				var_83_2:set("Default")
				var_83_3:slider("DefPitchOffset1_" .. iter_81_2)("Offset 1", -89, 89, 0, 1, "°")
				var_83_3:slider("DefPitchOffset2_" .. iter_81_2)("Offset 2", -89, 89, 0, 1, "°")
				var_83_3:slider("DefPitchSpeed_" .. iter_81_2)("Speed", 1, 64, 5, 1, "t")
				var_83_3:slider("DefPitchRandom_" .. iter_81_2)("Randomize", 0, 89, 0, 1, "°")

				local var_83_4, var_83_5 = arg_83_0:combo("DefYaw_" .. iter_81_2)("Yaw", {
					"Default",
					"Static",
					"Jitter",
					"Spin",
					"3-Way",
					"5-Way"
				})

				var_83_5:slider("DefYawOffset_" .. iter_81_2)("Offset", -180, 180, 0, 1, "°")
				var_83_5:slider("DefYawD_" .. iter_81_2)("Delay", 1, 10, 0, 1, function(arg_85_0)
					return arg_85_0 .. "t"
				end)
				var_83_5:slider("DefYawSpeed_" .. iter_81_2)("Speed", 1, 64, 5, 1, "t")
				var_83_5:slider("DefYawRandom_" .. iter_81_2)("Randomize", 0, 180, 0, 1, "°")

				local function var_83_6()
					local var_86_0 = slot_0_23_0:reference("DefMode_" .. iter_81_2):get()
					local var_86_1 = slot_0_23_0:reference("DefPitch_" .. iter_81_2):get()
					local var_86_2 = slot_0_23_0:reference("DefYaw_" .. iter_81_2):get()
					local var_86_3 = var_86_0 == "Default"
					local var_86_4

					var_86_4 = var_86_0 == "Flick"

					local var_86_5 = slot_0_23_0:reference("DefForceTargetYaw_" .. iter_81_2)

					if var_86_5 ~= nil then
						var_86_5.visibility = var_86_3
					end

					slot_0_23_0:reference("DefPitch_" .. iter_81_2).visibility = var_86_3
					slot_0_23_0:reference("DefYaw_" .. iter_81_2).visibility = var_86_3
					slot_0_23_0:reference("DefPitchOffset1_" .. iter_81_2).visibility = var_86_3 and var_86_1 ~= "Default"
					slot_0_23_0:reference("DefPitchOffset2_" .. iter_81_2).visibility = var_86_3 and (var_86_1 == "Jitter" or var_86_1 == "Spin")
					slot_0_23_0:reference("DefPitchSpeed_" .. iter_81_2).visibility = var_86_3 and var_86_1 == "Spin"
					slot_0_23_0:reference("DefPitchRandom_" .. iter_81_2).visibility = var_86_3 and var_86_1 ~= "Default"
					slot_0_23_0:reference("DefYawOffset_" .. iter_81_2).visibility = var_86_3 and (var_86_2 == "Static" or var_86_2 == "Jitter" or var_86_2 == "Spin")
					slot_0_23_0:reference("DefYawD_" .. iter_81_2).visibility = var_86_3 and var_86_2 == "Jitter"
					slot_0_23_0:reference("DefYawSpeed_" .. iter_81_2).visibility = var_86_3 and var_86_2 == "Spin"
					slot_0_23_0:reference("DefYawRandom_" .. iter_81_2).visibility = var_86_3 and (var_86_2 == "Static" or var_86_2 == "Jitter" or var_86_2 == "Spin")
				end

				slot_0_23_0:reference("DefMode_" .. iter_81_2):set_callback(var_83_6, true)
				slot_0_23_0:reference("DefPitch_" .. iter_81_2):set_callback(var_83_6, true)
				slot_0_23_0:reference("DefYaw_" .. iter_81_2):set_callback(var_83_6, true)
			end

			if iter_81_2 ~= "On Peek" then
				arg_83_0:switch("DefForceTargetYaw_" .. iter_81_2)("Force Target Yaw")
			end
		end)

		local var_81_9

		local function var_81_10()
			local var_87_0 = slot_0_23_0:reference("DefEnabled_" .. iter_81_2)

			var_87_0.visibility = var_81_8:get() == iter_81_2 and var_81_7.reference:get()
			slot_0_24_1[iter_81_2 .. "defensive"].visibility = var_81_8:get() == iter_81_2 and slot_0_28_2.tab_list.reference:get() == 2 and (iter_81_2 == slot_0_11_0.hidden_states and true or var_87_0:get()) and var_81_7.reference:get()
		end

		slot_0_23_0:reference("DefEnabled_" .. iter_81_2):set_callback(var_81_10, true)
		var_81_7.reference:set_callback(function(arg_88_0)
			var_81_8.visibility = arg_88_0:get()

			var_81_10()
		end, true)
		var_81_8:set_callback(var_81_10, true)
		slot_0_28_2.tab_list:set_callback(var_81_10, true)
	end
end)
slot_0_31_3 = nil
slot_0_24_1.visuals_indication = slot_0_23_0:new_group(2, "group_global", "Visuals_Indication", function(arg_89_0)
	slot_89_1_0 = nil
	slot_89_2_1, slot_89_3_2 = arg_89_0:switch("crosshair_indicators")("Crosshair Indicators")
	slot_89_4_3 = slot_89_3_2:combo("crosshair_indicators_type")("Type", {
		"Stylish",
		"Modern"
	})

	slot_89_3_2:switch("crosshair_indicators_align")("Scope Alignment", true)
	slot_89_3_2:switch("crosshair_indicators_glow")("Shadow Effect")
	slot_89_3_2:color_picker("crosshair_indicators_clr")("Primary Color", slot_0_11_0.colors.default)
	slot_89_3_2:color_picker("crosshair_indicators_clr2")("Secondary Color", slot_0_11_0.colors.white)

	slot_89_5_3 = slot_89_3_2:slider("crosshair_indicators_anim_speed")("Animation Speed", 1, 100, 25, 0.1, "x")

	slot_89_2_1:set_callback(function(arg_90_0)
		slot_89_3_2.visibility = arg_90_0:get()
	end, true)
	slot_89_4_3:set_callback(function(arg_91_0)
		slot_89_5_3.visibility = arg_91_0:get() == "Stylish"
	end, true)

	slot_89_2_0 = nil
	slot_89_3_1 = arg_89_0:switch("damage_indicator")("Damage Indicator")
	slot_89_4_2 = slot_89_3_1:color_picker("damage_indicator_clr")()
	slot_89_3_1.tooltip = "You can restore default position by clicking M2 on indicator."

	slot_89_3_1:set_callback(function(arg_92_0)
		slot_89_4_2.visibility = arg_92_0:get()
	end, true)

	slot_89_3_0 = nil
	slot_89_4_1, slot_89_5_2 = arg_89_0:switch("manual_arrows")("Manual Arrows")

	slot_89_5_2:color_picker("manual_arrows_clr")("Primary Color", slot_0_11_0.colors.default)
	slot_89_5_2:color_picker("manual_arrows_clr2")("Secondary Color", slot_0_11_0.colors.idle)
	slot_89_4_1:set_callback(function(arg_93_0)
		slot_89_5_2.visibility = arg_93_0:get()
	end, true)

	slot_89_4_0 = nil
	slot_89_5_1, slot_89_6_1 = arg_89_0:switch("widgets")("Widgets")
	slot_89_7_1 = slot_89_6_1:selectable("widgets_items")("Items", {
		"Watermark",
		"Keybinds"
	})
	slot_89_8_1 = slot_89_7_1:color_picker("widgets_clr")(slot_0_11_0.colors.default)
	slot_89_9_1 = slot_89_6_1:slider("widgets_rounding")("Rounding", 1, 8, 2)
	slot_89_10_0 = slot_89_6_1:switch("widgets_glow")("Shadow Effect")
	slot_89_11_0 = slot_89_6_1:input("widgets_name")("Username", slot_0_11_0.username)

	function slot_89_12_0()
		local var_94_0, var_94_1 = slot_0_1_0(function()
			if slot_89_5_1:get() then
				local var_95_0 = slot_0_21_0.convert(slot_0_14_0.MISC.windows:get())

				if slot_89_7_1:get("Watermark") then
					var_95_0.Watermark = false
				end

				if slot_89_7_1:get("Keybinds") then
					var_95_0.Hotkeys = false
				end

				slot_0_14_0.MISC.windows:override(slot_0_21_0.invert(var_95_0))
			else
				slot_0_14_0.MISC.windows:override()
			end
		end)

		if not var_94_0 then
			print_raw("failed to override windows")
		end
	end

	slot_89_7_1:set_callback(function(arg_96_0)
		slot_89_12_0()

		local var_96_0 = #arg_96_0:get() ~= 0

		slot_89_8_1.visibility = var_96_0
		slot_89_9_1.visibility = var_96_0
		slot_89_10_0.visibility = var_96_0
		slot_89_11_0.visibility = arg_96_0:get("Watermark")
	end, true)
	slot_89_5_1:set_callback(function(arg_97_0)
		slot_89_12_0()

		slot_89_6_1.visibility = arg_97_0:get()
	end, true)
	slot_0_14_0.MISC.windows:set_callback(slot_89_12_0, true)

	slot_89_11_0.saveable = false
	slot_89_5_0 = nil
	slot_89_6_0, slot_89_7_0 = arg_89_0:switch("gamesense")("GS")
	slot_89_8_0 = slot_89_7_0:selectable("gamesense_items")("Features", {
		"Indicators",
		"Net Graph"
	})
	slot_89_9_0 = slot_89_7_0:selectable("gamesense_inds")("Items", {
		"Bomb",
		"Ping Spike",
		"Double Tap",
		"Hide Shots",
		"Body Aim",
		"Safe Point",
		"Fake Duck",
		"Freestanding",
		"Minimum Damage",
		"Hit Chance",
		"Edge Yaw",
		"Dormant Aimbot",
		"Aimbot Shots"
	})

	slot_89_6_0:set_callback(function(arg_98_0)
		slot_89_7_0.visibility = arg_98_0:get()
	end, true)
	slot_89_8_0:set_callback(function(arg_99_0)
		slot_89_9_0.visibility = arg_99_0:get("Indicators")
	end, true)
end)
slot_0_24_1.visuals_view = slot_0_23_0:new_group(1, "group_global", "Visuals_View", function(arg_100_0)
	slot_100_1_1 = nil
	slot_100_1_0 = {
		fov = tonumber(cvar.viewmodel_fov:string()) or 68,
		x = tonumber(cvar.viewmodel_offset_x:string()) or 1,
		y = tonumber(cvar.viewmodel_offset_y:string()) or -2,
		z = tonumber(cvar.viewmodel_offset_z:string()) or -1.5
	}
	slot_100_2_1, slot_100_3_2 = arg_100_0:switch("viewmodel")("Viewmodel")

	slot_100_3_2:slider("viewmodel_fov")("Field of View", -1800, 1800, slot_100_1_0.fov * 10, 0.1)
	slot_100_3_2:slider("viewmodel_x")("Offset X", -1800, 1800, slot_100_1_0.x * 10, 0.1)
	slot_100_3_2:slider("viewmodel_y")("Offset Y", -1800, 1800, slot_100_1_0.y * 10, 0.1)
	slot_100_3_2:slider("viewmodel_z")("Offset Z", -1800, 1800, slot_100_1_0.z * 10, 0.1)
	slot_100_3_2:switch("viewmodel_sleeve")("Remove Sleeve")
	slot_100_3_2:switch("viewmodel_flip")("Flip Knife Hand")

	slot_100_3_2:button("viewmodel_reset")("Reset", nil, true).tooltip = "Resets viewmodel values to default"

	slot_100_2_1:set_callback(function(arg_101_0)
		slot_100_3_2.visibility = arg_101_0:get()
	end, true)

	slot_100_2_0 = nil
	slot_100_3_1 = {
		"16:9",
		"16:10",
		"3:2",
		"4:3",
		"5:4"
	}
	slot_100_4_1 = {}

	for iter_100_0 = 1, #slot_100_3_1 do
		slot_100_9_0 = slot_100_3_1[iter_100_0]
		slot_100_10_0, slot_100_11_1 = slot_100_9_0:match("(%d*):(%d*)")
		slot_100_4_1[math.floor(slot_100_10_0 / slot_100_11_1 * 100)] = slot_100_9_0
	end

	slot_100_5_1, slot_100_6_0 = arg_100_0:switch("aspect_ratio")("Aspect Ratio")
	slot_100_7_0 = slot_100_6_0:slider("aspect_ratio_value")("", 0, 300, math.floor(slot_0_11_0.screen.x / slot_0_11_0.screen.y * 100), 0.01, function(arg_102_0)
		if arg_102_0 == 0 then
			return "Off"
		end

		return slot_100_4_1[arg_102_0] or string.format("%.2f", arg_102_0 * 0.01)
	end)

	for iter_100_1 = 1, #slot_100_3_1 do
		slot_100_12_0 = slot_100_3_1[iter_100_1]
		slot_100_13_0, slot_100_14_0 = slot_100_12_0:match("(%d*):(%d*)")
		slot_100_15_0 = math.floor(slot_100_13_0 / slot_100_14_0 * 100)

		slot_100_6_0:button(string.format("AspectRatioBtn%s", iter_100_1))((" %s "):format(slot_100_12_0), function()
			slot_100_7_0:set(slot_100_15_0)
		end, true)
	end

	slot_100_5_1:set_callback(function(arg_104_0)
		slot_100_6_0.visibility = arg_104_0:get()
	end, true)
	arg_100_0:switch("animate_zoom")("Animate Zoom")

	slot_100_3_0 = nil
	slot_100_4_0, slot_100_5_0 = arg_100_0:switch("anim_breaker")("Animation Breakers")

	slot_100_5_0:combo("anim_breaker_ground")("Leg Movement", {
		"Disabled",
		"Frozen",
		"Walking",
		"Sliding",
		"Jitter"
	})
	slot_100_5_0:combo("anim_breaker_air")("In Air", {
		"Disabled",
		"Frozen",
		"Walking"
	})
	slot_100_5_0:switch("anim_breaker_pitch")("Zero Pitch on Land")
	slot_100_5_0:switch("anim_breaker_slowwalk")("Sliding Slow Walk")
	slot_100_5_0:switch("anim_breaker_crouch")("Sliding Crouch")
	slot_100_5_0:switch("anim_breaker_move_lean")("Move Lean")
	slot_100_4_0:set_callback(function(arg_105_0)
		slot_100_5_0.visibility = arg_105_0:get()
	end, true)
end)
slot_0_24_1.visuals_ingame = slot_0_23_0:new_group(2, "group_global", "Visuals_InGame", function(arg_106_0)
	local var_106_0
	local var_106_1, var_106_2 = arg_106_0:switch("custom_scope")("Custom Scope")
	local var_106_3 = var_106_2:switch("custom_scope_invert")("Color")

	var_106_3.tooltip = "If switch is enabled, colors would be inverted."

	var_106_3:color_picker("custom_scope_clr")(slot_0_11_0.colors.default)
	var_106_2:slider("custom_scope_size")("Size", 1, 500, 100)
	var_106_2:slider("custom_scope_gap")("Gap", 1, 500, 10)

	local function var_106_4()
		var_106_2.visibility = var_106_1:get()

		if var_106_1:get() then
			slot_0_14_0.VISUALS.scope_overlay:override("Remove All")
		else
			slot_0_14_0.VISUALS.scope_overlay:override()
		end
	end

	var_106_1:set_callback(var_106_4, true)
	slot_0_14_0.VISUALS.scope_overlay:set_callback(var_106_4, true)

	local var_106_5
	local var_106_6, var_106_7 = arg_106_0:switch("hit_marker")("Hit Marker")
	local var_106_8
	local var_106_9 = var_106_7:switch("kibit_marker")("Kibit Marker")
	local var_106_10 = var_106_9:color_picker("kibit_marker_clr")()

	var_106_9:set_callback(function(arg_108_0)
		var_106_10.visibility = arg_108_0:get()
	end, true)

	local var_106_11
	local var_106_12 = var_106_7:switch("damage_marker")("Damage Marker")
	local var_106_13 = var_106_12:color_picker("damage_marker_clr")(slot_0_11_0.colors.default)

	var_106_12:set_callback(function(arg_109_0)
		var_106_13.visibility = arg_109_0:get()
	end, true)
	var_106_6:set_callback(function(arg_110_0)
		if arg_110_0:get() then
			slot_0_14_0.VISUALS.hitmarker:override(false)
		else
			slot_0_14_0.VISUALS.hitmarker:override()
		end

		var_106_7.visibility = arg_110_0:get()
	end, true)

	local var_106_14
	local var_106_15, var_106_16 = arg_106_0:switch("grenade_radius")("Grenade Radius")

	var_106_16:selectable("grenade_radius_timer")("Timer", {
		"Bar",
		"Text"
	})

	local var_106_17 = var_106_16:switch("smoke_radius")("Smoke Radius")
	local var_106_18 = var_106_17:color_picker("smoke_radius_clr")()

	var_106_17:set_callback(function(arg_111_0)
		var_106_18.visibility = arg_111_0:get()
	end, true)

	local var_106_19 = var_106_16:switch("molotov_radius")("Molotov Radius")
	local var_106_20 = var_106_19:color_picker("molotov_radius_clr")()

	var_106_19:set_callback(function(arg_112_0)
		var_106_20.visibility = arg_112_0:get()
	end, true)
	var_106_16:switch("molotov_safety")("Molotov Safety")
	var_106_15:set_callback(function(arg_113_0)
		var_106_16.visibility = arg_113_0:get()
	end, true)
end)
slot_0_32_4 = nil
slot_0_24_1.misc_movement = slot_0_23_0:new_group(1, "group_global", "Misc_Movement", function(arg_114_0)
	arg_114_0:switch("fast_ladder")("Fast Ladder").tooltip = "Increases your climb speed on ladders."
	arg_114_0:switch("no_fall_damage")("No Fall Damage").tooltip = "Attempts to prevent damage from falling."
end)
slot_0_24_1.misc_other = slot_0_23_0:new_group(2, "group_global", "Misc_Other", function(arg_115_0)
	arg_115_0:switch("unmute_players")("Unmute Players").tooltip = "Automatically unmutes muted players."
	arg_115_0:switch("taskbar_notify")("Taskbar Notify").tooltip = "Flashes icon in taskbar, when round starts."

	local var_115_0
	local var_115_1 = arg_115_0:switch("custom_console")("Custom Console")
	local var_115_2 = var_115_1:color_picker("custom_console_clr")()

	var_115_1:set_callback(function(arg_116_0)
		var_115_2.visibility = arg_116_0:get()
	end, true)

	local var_115_3
	local var_115_4, var_115_5 = arg_115_0:switch("trashtalk")("Trashtalk")

	var_115_5:switch("trashtalk_revenge")("Revenge")
	var_115_4:set_callback(function(arg_117_0)
		var_115_5.visibility = arg_117_0:get()
	end, true)

	arg_115_0:switch("drop_nades")("Drop Nades").tooltip = string.format("Very useful function for fast drop nades (for 2v2/3v3/5v5 games) \n\affff00ff%s You should bind this function", ui.get_icon("circle-exclamation"))
end)
slot_0_24_1.misc_ingame = slot_0_23_0:new_group(2, "group_global", "Misc_InGame", function(arg_118_0)
	local var_118_0
	local var_118_1, var_118_2 = arg_118_0:switch("clantag")("Clantag")
	local var_118_3 = var_118_2:combo("clantag_type")("Type", {
		"Script",
		"Custom"
	})
	local var_118_4 = var_118_2:input("clantag_input")("Tag", "xo-yaw.lua")

	local function var_118_5()
		if var_118_1:get() then
			slot_0_14_0.MISC.clantag:override(false)

			if var_118_3:get() == "Custom" and var_118_4:get() == "" then
				common.set_clan_tag("")
				slot_0_14_0.MISC.clantag:override()

				return
			end

			return
		end

		utils.execute_after(0.1, function()
			common.set_clan_tag("")
		end)
		slot_0_14_0.MISC.clantag:override()
	end

	var_118_1.tooltip = "Animated & Synchronized clantag spammer."

	var_118_3:set_callback(function(arg_121_0)
		var_118_4.visibility = arg_121_0:get() == "Custom"

		var_118_5()
	end, true)
	var_118_1:set_callback(function(arg_122_0)
		var_118_2.visibility = arg_122_0:get()

		var_118_5()
	end, true)
	var_118_4:set_callback(var_118_5, true)
	slot_0_14_0.MISC.clantag:set_callback(var_118_5, true)
end)
slot_0_33_4 = nil
slot_0_34_5 = nil
slot_0_35_5 = nil
slot_0_36_5 = 11111

slot_0_16_0["Menu Colors"].render:set(function()
	slot_0_11_0.menu_alpha = ui.get_alpha()

	if slot_0_11_0.menu_alpha ~= 1 then
		return
	end

	local var_123_0 = ui.get_style()
	local var_123_1 = var_123_0["Link Active"]
	local var_123_2 = var_123_0["Active Text"]
	local var_123_3 = ""
	local var_123_4
	local var_123_5 = "xo-yaw.lua"
	local var_123_6 = #var_123_5 + 1

	for iter_123_0 = 1, var_123_6 do
		local var_123_7 = var_123_5:sub(iter_123_0, iter_123_0)
		local var_123_8 = (iter_123_0 - 1) / var_123_6
		local var_123_9 = slot_0_19_0(var_123_8 * 1.5, -2)
		local var_123_10 = var_123_1:lerp(var_123_0["Text Preview"], var_123_9)

		if iter_123_0 == 1 then
			var_123_4 = var_123_10
		end

		var_123_3 = var_123_3 .. string.format("\a%s%s", var_123_10:to_hex(), var_123_7)
	end

	ui.sidebar(var_123_3, string.format("\a%s%s", var_123_4:to_hex(), ui.get_icon("link-horizontal")))

	local var_123_11 = var_123_0["Link Active"]:to_hex()
	local var_123_12 = var_123_0["Active Text"]:to_hex()

	if var_123_11 ~= slot_0_34_5 or var_123_12 ~= slot_0_35_5 or slot_0_11_0.online ~= slot_0_36_5 then
		slot_0_11_0.colors.link_active = var_123_0["Link Active"]
		slot_0_34_5 = var_123_11
		slot_0_35_5 = var_123_12
		slot_0_36_5 = slot_0_11_0.online
	end
end)
slot_0_28_2.tab_list:set_callback(function(arg_124_0)
	slot_0_24_1.rage_main.visibility = arg_124_0:get() == 1
	slot_0_24_1.antiaim_other.visibility = arg_124_0:get() == 2
	slot_0_24_1.antiaim_angles.visibility = arg_124_0:get() == 2
	slot_0_24_1.defensive_setup.visibility = arg_124_0:get() == 2
	slot_0_24_1.visuals_indication.visibility = arg_124_0:get() == 3
	slot_0_24_1.visuals_view.visibility = arg_124_0:get() == 3
	slot_0_24_1.visuals_ingame.visibility = arg_124_0:get() == 3
	slot_0_24_1.misc_movement.visibility = arg_124_0:get() == 4
	slot_0_24_1.misc_ingame.visibility = arg_124_0:get() == 4
	slot_0_24_1.misc_other.visibility = arg_124_0:get() == 4
end, true)

slot_0_24_0 = slot_0_23_0:get_raw()
slot_0_25_1 = nil
slot_0_25_0 = {
	print = function(arg_125_0, arg_125_1)
		local var_125_0 = arg_125_1:gsub("(\a%x+)xo%-yaw \a808080FF· \aDEFAULT", "\aDEFAULT")
		local var_125_1 = slot_0_21_0.convert(slot_0_24_0.event_logger_draw)

		if slot_0_24_0.event_logger and var_125_1.Console or arg_125_0 then
			print_raw(arg_125_1)
		end

		if slot_0_24_0.event_logger and var_125_1.Events or arg_125_0 then
			print_dev(var_125_0)
		end
	end,
	format = function(arg_126_0, arg_126_1)
		if type(arg_126_0) ~= "string" then
			return arg_126_0
		end

		if not arg_126_1 then
			arg_126_1 = slot_0_11_0.colors.link_active:to_hex()
		else
			arg_126_1 = arg_126_1:to_hex()
		end

		arg_126_0 = string.gsub(arg_126_0, "[\v\r]", {
			["\r"] = "\aDEFAULT",
			["\v"] = "\a" .. arg_126_1
		})

		return arg_126_0
	end,
	extrapolate = function(arg_127_0, arg_127_1, arg_127_2)
		local var_127_0 = globals.tickinterval
		local var_127_1 = arg_127_0.m_vecVelocity
		local var_127_2 = arg_127_2:clone()

		var_127_2.x = var_127_2.x + var_127_1.x * var_127_0 * arg_127_1
		var_127_2.y = var_127_2.y + var_127_1.y * var_127_0 * arg_127_1

		if not arg_127_0.m_hGroundEntity then
			var_127_2.z = var_127_2.z + var_127_1.z * var_127_0 * arg_127_1 - cvar.sv_gravity:float() * var_127_0
		end

		return utils.trace_hull(arg_127_2, var_127_2, arg_127_0.m_vecMins, arg_127_0.m_vecMaxs, arg_127_0).end_pos:clone()
	end,
	get_list_text = function(arg_128_0)
		return arg_128_0:list()[arg_128_0:get()]
	end,
	get_list_index = function(arg_129_0, arg_129_1)
		local var_129_0 = arg_129_0:list()
		local var_129_1

		for iter_129_0, iter_129_1 in pairs(var_129_0) do
			if arg_129_1 == iter_129_1 or arg_129_1 == iter_129_1:sub(5, -1) then
				var_129_1 = iter_129_0

				break
			end
		end

		return var_129_1
	end
}
slot_0_26_0 = nil

events.grenade_thrown:set(function(arg_130_0)
	if not slot_0_24_0.fast_switch then
		return
	end

	local var_130_0 = entity.get_local_player()

	if entity.get(arg_130_0.userid, true) ~= var_130_0 then
		return
	end

	utils.console_exec("slot3; slot2; slot1")
end)
events.weapon_fire:set(function(arg_131_0)
	if not slot_0_24_0.fast_switch then
		return
	end

	if arg_131_0.weapon ~= "weapon_taser" then
		return
	end

	local var_131_0 = entity.get_local_player()

	if entity.get(arg_131_0.userid, true) ~= var_131_0 then
		return
	end

	utils.console_exec("slot3; slot2; slot1")
end)

slot_0_27_1 = nil
slot_0_27_0 = {
	data = {}
}

function slot_0_28_1(arg_132_0, arg_132_1, arg_132_2, arg_132_3)
	return -arg_132_2 * math.cos(arg_132_0 / arg_132_3 * (math.pi / 2)) + arg_132_2 + arg_132_1
end

function slot_0_27_0.add(arg_133_0, arg_133_1, arg_133_2)
	slot_0_27_0.data[#slot_0_27_0.data + 1] = {
		offset = 0,
		text = arg_133_1,
		time = globals.realtime + arg_133_0,
		anim = slot_0_17_0:new(0.1, slot_0_28_1),
		color = arg_133_2
	}
end

slot_0_16_0["Hitlog Render"].render:set(function(arg_134_0, arg_134_1)
	if not slot_0_24_0.event_logger or not slot_0_23_0:reference("event_logger_draw"):get("Custom Notify") then
		return
	end

	local var_134_0 = slot_0_11_0.screen:clone()

	var_134_0.x = var_134_0.x * 0.5
	var_134_0.y = var_134_0.y - 340

	local var_134_1 = 0
	local var_134_2 = 0

	for iter_134_0 = #slot_0_27_0.data, 1, -1 do
		local var_134_3 = slot_0_27_0.data[iter_134_0]

		if var_134_3 == nil then
			-- block empty
		else
			local var_134_4 = var_134_3.time - globals.realtime
			local var_134_5 = var_134_3.anim(0.15, var_134_4 > 0)

			if var_134_5 < 0.1 then
				table.remove(slot_0_27_0.data, iter_134_0)
			else
				if var_134_3.offset ~= var_134_1 then
					var_134_3.offset = math.clamp(var_134_1 > var_134_3.offset and var_134_3.offset + 200 * globals.frametime or var_134_1, 0, var_134_1)
				end

				local var_134_6 = render.measure_text(1, nil, var_134_3.text)
				local var_134_7 = var_134_6.x * var_134_5

				if var_134_2 < var_134_6.y then
					var_134_2 = var_134_6.y
				end

				local var_134_8 = var_134_0:clone()

				var_134_8.x = var_134_8.x - var_134_7 * 0.5
				var_134_8.y = var_134_8.y + var_134_3.offset

				local var_134_9 = vector(var_134_7, var_134_6.y + 1)

				if var_134_5 ~= 0 then
					render.push_clip_rect(var_134_8, var_134_8 + var_134_9)
					render.shadow(vector(var_134_8.x, var_134_8.y + 7), vector(var_134_8.x + var_134_6.x, var_134_8.y + 7), var_134_3.color:alpha_modulate(var_134_5 * 0.8, true), 20)
					render.text(1, var_134_8, slot_0_11_0.colors.white:alpha_modulate(var_134_5, true), nil, var_134_3.text)
					render.pop_clip_rect()

					var_134_1 = var_134_1 + var_134_2 + 2
				end
			end
		end
	end

	for iter_134_1 = 1, #slot_0_27_0.data do
		if #slot_0_27_0.data - iter_134_1 > 7 then
			slot_0_27_0.data[iter_134_1].time = 0
		end
	end
end)

slot_0_28_0 = nil
slot_0_29_2 = slot_0_17_0:new(slot_0_14_0.VISUALS.fov:get())

slot_0_16_0["Animate Zoom"].override_view:set(function(arg_135_0, arg_135_1, arg_135_2)
	if not slot_0_24_0.animate_zoom or not arg_135_2 then
		return
	end

	arg_135_0.fov = slot_0_29_2(0.12, arg_135_0.fov)
end)

slot_0_29_1 = nil
slot_0_29_0 = {}
slot_0_30_1 = false
slot_0_31_2 = nil
slot_0_32_3 = nil
slot_0_33_3 = nil
slot_0_34_4 = cvar.cl_righthand
slot_0_35_4 = tonumber(slot_0_34_4:string()) or 1
slot_0_36_4 = false

function slot_0_37_4()
	cvar.viewmodel_fov:float(tonumber(cvar.viewmodel_fov:string()))
	cvar.viewmodel_offset_x:float(tonumber(cvar.viewmodel_offset_x:string()))
	cvar.viewmodel_offset_y:float(tonumber(cvar.viewmodel_offset_y:string()))
	cvar.viewmodel_offset_z:float(tonumber(cvar.viewmodel_offset_z:string()))
end

function slot_0_38_3()
	if slot_0_24_0.viewmodel then
		cvar.viewmodel_fov:float(slot_0_24_0.viewmodel_fov * 0.1, true)
		cvar.viewmodel_offset_x:float(slot_0_24_0.viewmodel_x * 0.1, true)
		cvar.viewmodel_offset_y:float(slot_0_24_0.viewmodel_y * 0.1, true)
		cvar.viewmodel_offset_z:float(slot_0_24_0.viewmodel_z * 0.1, true)
	else
		slot_0_37_4()
	end
end

function slot_0_39_4()
	for iter_138_0, iter_138_1 in ipairs({
		"viewmodel",
		"viewmodel_fov",
		"viewmodel_x",
		"viewmodel_y",
		"viewmodel_z"
	}) do
		slot_0_23_0:reference(iter_138_1):set_callback(slot_0_38_3, true)
	end

	slot_0_23_0:reference("viewmodel_reset"):set_callback(function()
		slot_0_23_0:reference("viewmodel_fov"):set(tonumber(cvar.viewmodel_fov:string()) * 10)
		slot_0_23_0:reference("viewmodel_x"):set(tonumber(cvar.viewmodel_offset_x:string()) * 10)
		slot_0_23_0:reference("viewmodel_y"):set(tonumber(cvar.viewmodel_offset_y:string()) * 10)
		slot_0_23_0:reference("viewmodel_z"):set(tonumber(cvar.viewmodel_offset_z:string()) * 10)
	end)
end

function slot_0_40_3(arg_140_0)
	if slot_0_30_1 == arg_140_0 then
		return
	end

	slot_0_30_1 = arg_140_0

	for iter_140_0, iter_140_1 in ipairs(materials.get_materials("sleeve")) do
		if iter_140_1:is_valid() then
			iter_140_1:var_flag(2, arg_140_0)
		end
	end
end

function slot_0_41_3(arg_141_0)
	if arg_141_0 and slot_0_24_0.viewmodel_flip then
		cvar.cl_righthand:int(slot_0_35_4 == 0 and 1 or 0, true)
	else
		cvar.cl_righthand:int(slot_0_35_4, true)
	end
end

slot_0_16_0.Viewmodel.pre_render:set(function(arg_142_0, arg_142_1)
	if not slot_0_24_0.viewmodel or not arg_142_1 then
		if not slot_0_36_4 then
			cvar.cl_righthand:int(slot_0_35_4, true)

			slot_0_36_4 = true
		end

		slot_0_40_3(false)

		return
	end

	slot_0_36_4 = false

	local var_142_0 = arg_142_0:get_player_weapon()

	if not var_142_0 then
		return
	end

	local var_142_1 = var_142_0:get_classname() == "CKnife"

	if var_142_0 ~= slot_0_31_2 then
		slot_0_41_3(var_142_1)

		slot_0_31_2 = var_142_0
	elseif not var_142_1 then
		slot_0_35_4 = tonumber(slot_0_34_4:string()) or 1
	end

	slot_0_33_3 = var_142_1

	slot_0_40_3(slot_0_24_0.viewmodel_sleeve)
end)
slot_0_16_0.Viewmodel.shutdown:set(function()
	cvar.cl_righthand:int(slot_0_35_4, true)
	slot_0_37_4()
	slot_0_40_3(false)
end)
slot_0_39_4()

slot_0_30_0 = nil
slot_0_31_1 = false
slot_0_32_2 = cvar.r_aspectratio:float() or 0

function slot_0_33_2()
	if slot_0_31_1 then
		cvar.r_aspectratio:float(slot_0_32_2)

		slot_0_31_1 = false
	end
end

function slot_0_34_3()
	local var_145_0 = slot_0_24_0.aspect_ratio and slot_0_24_0.aspect_ratio_value / 100 or slot_0_32_2

	cvar.r_aspectratio:float(var_145_0)

	if var_145_0 == 0 then
		slot_0_31_1 = true

		slot_0_33_2()
	else
		slot_0_31_1 = var_145_0 ~= 0
	end
end

slot_0_23_0:reference("aspect_ratio"):set_callback(slot_0_34_3, true)
slot_0_23_0:reference("aspect_ratio_value"):set_callback(slot_0_34_3, true)
slot_0_16_0["Aspect Ratio"].shutdown:set(slot_0_33_2)

slot_0_31_0 = nil
slot_0_32_1 = "\t"
slot_0_33_1 = "\t"

function slot_0_34_2(arg_146_0)
	local var_146_0 = {}
	local var_146_1 = #arg_146_0

	if var_146_1 < 2 then
		table.insert(var_146_0, arg_146_0)

		return var_146_0
	end

	for iter_146_0 = 1, 8 do
		table.insert(var_146_0, string.format("%s%s%s", slot_0_32_1, arg_146_0, slot_0_33_1))
	end

	for iter_146_1 = 1, var_146_1 do
		local var_146_2 = arg_146_0:sub(iter_146_1, var_146_1)

		table.insert(var_146_0, string.format("%s%s%s", slot_0_32_1, var_146_2, slot_0_33_1))
	end

	table.insert(var_146_0, string.format("%s%s", slot_0_32_1, slot_0_33_1))

	for iter_146_2 = math.min(2, var_146_1), var_146_1 do
		local var_146_3 = arg_146_0:sub(1, iter_146_2)

		table.insert(var_146_0, string.format("%s%s%s", slot_0_32_1, var_146_3, slot_0_33_1))
	end

	for iter_146_3 = 1, 4 do
		table.insert(var_146_0, string.format("%s%s%s", slot_0_32_1, arg_146_0, slot_0_33_1))
	end

	return var_146_0
end

slot_0_35_3 = -1
slot_0_36_3 = nil

function slot_0_37_3()
	if slot_0_24_0.clantag_type == "Script" then
		slot_0_36_3 = slot_0_34_2("xo-yaw.lua")
	else
		slot_0_36_3 = slot_0_34_2(slot_0_24_0.clantag_input)
	end
end

slot_0_23_0:reference("clantag_type"):set_callback(slot_0_37_3, true)
slot_0_23_0:reference("clantag_input"):set_callback(slot_0_37_3)
slot_0_16_0.Clantag.net_update_end:set(function(arg_148_0, arg_148_1)
	if not slot_0_24_0.clantag then
		return
	end

	if arg_148_0 == nil or arg_148_0.m_iTeamNum == 0 then
		return
	end

	local var_148_0 = utils.net_channel()

	if var_148_0 == nil then
		return
	end

	local var_148_1 = var_148_0.latency[0] / globals.tickinterval
	local var_148_2 = globals.tickcount + var_148_1
	local var_148_3 = math.floor(var_148_2 * 0.0625) % #slot_0_36_3 + 1

	if var_148_3 == slot_0_35_3 then
		return
	end

	slot_0_35_3 = var_148_3

	common.set_clan_tag(slot_0_36_3[var_148_3] or "")
end)
slot_0_16_0.Clantag.shutdown:set(function()
	common.set_clan_tag("")
end)

slot_0_32_0 = nil

slot_0_16_0["No Fall Damage"].createmove:set(function(arg_150_0, arg_150_1, arg_150_2)
	if not slot_0_24_0.no_fall_damage or not arg_150_2 then
		return
	end

	local var_150_0 = arg_150_1:get_origin()

	if var_150_0 == nil then
		return
	end

	local var_150_1 = utils.trace_line(var_150_0, vector(var_150_0.x, var_150_0.y, var_150_0.z - 500), nil, nil, 1)

	if not var_150_1.end_pos then
		return
	end

	if var_150_0.z - var_150_1.end_pos.z <= 70 and var_150_0.z - var_150_1.end_pos.z >= 12 and bit.band(arg_150_1.m_fFlags, 1) == 0 and arg_150_1.m_vecVelocity.z < -450 then
		arg_150_0.in_duck = true
	end
end)

slot_0_33_0 = nil

ffi.cdef("        typedef long* hwnd;\n        typedef const char* lpcstr;\n\n        hwnd FindWindowA(lpcstr lpClassName, lpcstr lpWindowName);\n        bool FlashWindow(hwnd hWnd, bool bInvert);\n    ")

slot_0_34_1 = ffi.C.FindWindowA("Valve001", nil)

if not slot_0_34_1 then
	error("Window not found!")
end

function slot_0_35_2()
	if not slot_0_24_0.taskbar_notify then
		return
	end

	local var_151_0 = entity.get_game_rules()

	if not var_151_0 then
		return
	end

	if var_151_0.m_bIsValveDS then
		return
	end

	ffi.C.FlashWindow(slot_0_34_1, false)
end

slot_0_16_0["Taskbar Notification"].round_start:set(slot_0_35_2)

slot_0_34_0 = nil
slot_0_35_1 = utils.get_vfunc("client.dll", "GameClientExports001", 3, "void(__thiscall*)(void*, int)")

function slot_0_36_2()
	if not slot_0_24_0.unmute_players then
		return
	end

	for iter_152_0, iter_152_1 in pairs(entity.get_players()) do
		if iter_152_1 == nil then
			-- block empty
		else
			slot_0_35_1(iter_152_1:get_index())
		end
	end
end

slot_0_23_0:reference("unmute_players"):set_callback(slot_0_36_2, true)
slot_0_16_0["Unmute Players"].player_connect_full:set(slot_0_36_2)

slot_0_35_0 = nil
slot_0_36_1 = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)")
slot_0_37_2 = false
slot_0_38_2 = color()

function slot_0_39_3(arg_153_0)
	arg_153_0 = arg_153_0 or slot_0_11_0.colors.white

	materials.get_materials("vgui/hud/800", false, function(arg_154_0)
		arg_154_0:color_modulate(arg_153_0)
		arg_154_0:alpha_modulate(arg_153_0.a / 255)
	end)
	materials.get_materials("vgui_white", false, function(arg_155_0)
		arg_155_0:color_modulate(arg_153_0)
		arg_155_0:alpha_modulate(arg_153_0.a / 255)
	end)
end

slot_0_16_0["Console Color"].pre_render:set(function()
	if not slot_0_24_0.custom_console then
		if slot_0_37_2 then
			slot_0_37_2 = false

			slot_0_39_3()
		end

		return
	end

	local var_156_0 = slot_0_24_0.custom_console_clr

	if var_156_0 ~= slot_0_38_2 then
		slot_0_37_2 = not slot_0_36_1()

		slot_0_39_3(var_156_0)

		slot_0_38_2 = var_156_0
	end

	if slot_0_36_1() then
		if not slot_0_37_2 then
			slot_0_37_2 = true

			slot_0_39_3(var_156_0)
		end
	elseif slot_0_37_2 then
		slot_0_37_2 = false

		slot_0_39_3()
	end
end)
events.shutdown:set(slot_0_39_3)

slot_0_36_0 = nil
slot_0_37_1 = {}
slot_0_38_1 = {
	"weapon_molotov",
	"weapon_incgrenade",
	"weapon_hegrenade"
}
slot_0_39_2 = {}

for iter_0_2, iter_0_3 in next, slot_0_38_1 do
	slot_0_39_2[iter_0_3] = true
end

slot_0_23_0:reference("drop_nades"):set_callback(function(arg_157_0)
	if not arg_157_0:get() then
		return
	end

	local var_157_0 = entity.get_local_player()

	if var_157_0 == nil or not var_157_0:is_alive() then
		return
	end

	if #slot_0_37_1 > 0 then
		return
	end

	local var_157_1 = 1
	local var_157_2 = var_157_0:get_player_weapon(true)

	for iter_157_0 = 1, #var_157_2 do
		local var_157_3 = var_157_2[iter_157_0]

		if var_157_3 then
			local var_157_4 = var_157_3:get_index()
			local var_157_5 = var_157_3:get_weapon_info().console_name

			if slot_0_39_2[var_157_5] then
				slot_0_37_1[#slot_0_37_1 + 1] = function(arg_158_0)
					arg_158_0.no_choke = true
					arg_158_0.send_packet = false
					arg_158_0.in_use = 1
					arg_158_0.weaponselect = var_157_4
					arg_158_0.view_angles = render.camera_angles()
				end
				slot_0_37_1[#slot_0_37_1 + 1] = function(arg_159_0)
					local var_159_0 = entity.get_local_player()

					if var_159_0 == nil or not var_159_0:is_alive() then
						return
					end

					local var_159_1 = var_159_0:get_player_weapon()

					if not var_159_1 then
						return
					end

					local var_159_2 = var_159_1:get_weapon_info()

					if var_157_5 ~= var_159_2.console_name then
						return
					end

					arg_159_0.no_choke = true
					arg_159_0.send_packet = false
					arg_159_0.in_use = 1
					arg_159_0.view_angles = render.camera_angles()

					utils.console_exec("drop")
				end

				for iter_157_1 = 1, 2 do
					slot_0_37_1[#slot_0_37_1 + 1] = function(arg_160_0)
						arg_160_0.no_choke = true
						arg_160_0.send_packet = false
						arg_160_0.in_use = 1
						arg_160_0.view_angles = render.camera_angles()
					end
				end

				var_157_1 = var_157_1 + 1
			end
		end
	end
end, false)
slot_0_16_0["Drop Nades"].createmove:set(function(arg_161_0, arg_161_1, arg_161_2)
	if not arg_161_2 then
		return
	end

	if arg_161_0.choked_commands == 0 and #slot_0_37_1 > 0 then
		slot_0_37_1[1](arg_161_0)
		table.remove(slot_0_37_1, 1)
	end
end)

slot_0_37_0 = nil

slot_0_16_0["Fast Ladder"].createmove:set(function(arg_162_0, arg_162_1, arg_162_2)
	if not slot_0_24_0.fast_ladder or not arg_162_2 then
		return
	end

	if arg_162_1.m_MoveType ~= 9 then
		return
	end

	local var_162_0 = arg_162_1:get_player_weapon()

	if var_162_0 == nil then
		return
	end

	local var_162_1 = var_162_0.m_fThrowTime

	if var_162_1 ~= nil and var_162_1 ~= 0 then
		return
	end

	if arg_162_0.forwardmove > 0 then
		if arg_162_0.view_angles.x < 45 then
			arg_162_0.view_angles.x = 89
			arg_162_0.in_moveright = 1
			arg_162_0.in_moveleft = 0
			arg_162_0.in_forward = 0
			arg_162_0.in_back = 1

			if arg_162_0.sidemove == 0 then
				arg_162_0.view_angles.y = arg_162_0.view_angles.y + 90
			end

			if arg_162_0.sidemove < 0 then
				arg_162_0.view_angles.y = arg_162_0.view_angles.y + 150
			end

			if arg_162_0.sidemove > 0 then
				arg_162_0.view_angles.y = arg_162_0.view_angles.y + 30
			end
		end
	elseif arg_162_0.forwardmove < 0 then
		arg_162_0.view_angles.x = 89
		arg_162_0.in_moveleft = 1
		arg_162_0.in_moveright = 0
		arg_162_0.in_forward = 1
		arg_162_0.in_back = 0

		if arg_162_0.sidemove == 0 then
			arg_162_0.view_angles.y = arg_162_0.view_angles.y + 90
		end

		if arg_162_0.sidemove > 0 then
			arg_162_0.view_angles.y = arg_162_0.view_angles.y + 150
		end

		if arg_162_0.sidemove < 0 then
			arg_162_0.view_angles.y = arg_162_0.view_angles.y + 30
		end
	end
end)

slot_0_38_0 = nil
slot_0_39_1 = {}
slot_0_40_2 = 5

slot_0_16_0["Kibit Marker"].aim_ack:set(function(arg_163_0, arg_163_1, arg_163_2)
	if not slot_0_24_0.hit_marker or not slot_0_24_0.kibit_marker or not arg_163_2 then
		return
	end

	slot_0_39_1[#slot_0_39_1 + 1] = {
		slot_0_17_0:new(0.1),
		globals.realtime + 3,
		arg_163_0.aim or vector(),
		slot_0_24_0.kibit_marker_clr or color(),
		slot_0_40_2 * render.get_scale(2)
	}
end)
slot_0_16_0["Kibit Marker"].render:set(function(arg_164_0, arg_164_1)
	if not slot_0_24_0.hit_marker or not slot_0_24_0.kibit_marker or not arg_164_1 then
		return
	end

	for iter_164_0, iter_164_1 in pairs(slot_0_39_1) do
		if not iter_164_1 then
			-- block empty
		else
			local var_164_0 = iter_164_1[2] - globals.realtime
			local var_164_1 = iter_164_1[1](0.2, var_164_0 > 0)

			if var_164_1 < 0.01 then
				table.remove(slot_0_39_1, iter_164_0)
			else
				local var_164_2 = render.world_to_screen(iter_164_1[3])

				if var_164_2 == nil then
					-- block empty
				else
					local var_164_3 = iter_164_1[4]:alpha_modulate(var_164_1, true)
					local var_164_4 = iter_164_1[5]

					render.rect(var_164_2 - vector(1, var_164_4), var_164_2 + vector(1, var_164_4), var_164_3)
					render.rect(var_164_2 - vector(var_164_4, 1), var_164_2 + vector(var_164_4, 1), var_164_3)
				end
			end
		end
	end
end)

slot_0_39_0 = nil
slot_0_40_1 = {}
slot_0_41_2 = {
	0,
	5,
	2,
	13,
	14,
	7,
	8
}
slot_0_42_4 = slot_0_10_0("Calibri", 12, "adb")

slot_0_16_0["Damage Marker"].player_hurt:set(function(arg_165_0, arg_165_1, arg_165_2)
	if not slot_0_24_0.hit_marker or not slot_0_24_0.damage_marker or not arg_165_2 then
		return
	end

	local var_165_0 = entity.get(arg_165_0.userid, true)
	local var_165_1 = entity.get(arg_165_0.attacker, true)

	if var_165_0 == nil or var_165_0 == arg_165_1 or var_165_1 == nil or var_165_1 ~= arg_165_1 then
		return
	end

	local var_165_2 = slot_0_41_2[arg_165_0.hitgroup] or 3

	slot_0_40_1[#slot_0_40_1 + 1] = {
		{
			slot_0_17_0:new(0.01),
			slot_0_17_0:new(0)
		},
		globals.realtime + 2,
		slot_0_24_0.damage_marker_clr or color(),
		arg_165_0.dmg_health or 0,
		var_165_0:get_hitbox_position(var_165_2)
	}
end)
slot_0_16_0["Damage Markers"].render:set(function(arg_166_0, arg_166_1)
	if not slot_0_24_0.hit_marker or not slot_0_24_0.damage_marker or not arg_166_1 then
		return
	end

	for iter_166_0, iter_166_1 in pairs(slot_0_40_1) do
		if iter_166_1 == nil then
			-- block empty
		else
			local var_166_0 = iter_166_1[2] - globals.realtime
			local var_166_1 = iter_166_1[1][1](0.2, var_166_0 > 0)

			if var_166_1 < 0.01 then
				table.remove(slot_0_40_1, iter_166_0)
			else
				local var_166_2 = render.world_to_screen(vector(iter_166_1[5].x, iter_166_1[5].y, iter_166_1[5].z + 60 - var_166_0 * 40))

				if var_166_2 == nil then
					-- block empty
				else
					local var_166_3 = iter_166_1[1][2](1.5, iter_166_1[4])

					render.text(slot_0_42_4, var_166_2, iter_166_1[3]:alpha_modulate(var_166_1, true), "s", math.floor(var_166_3))
				end
			end
		end
	end
end)

slot_0_40_0 = nil
slot_0_41_1 = {
	global = slot_0_17_0:new(),
	size = slot_0_17_0:new(),
	inverted = slot_0_17_0:new()
}
slot_0_42_3 = slot_0_11_0.screen_center

slot_0_16_0["Custom Scope"].render:set(function(arg_167_0, arg_167_1)
	local var_167_0 = slot_0_41_1.global(0.2, slot_0_24_0.custom_scope and arg_167_1)

	if var_167_0 <= 0 then
		return
	end

	local var_167_1 = slot_0_24_0.custom_scope_clr:alpha_modulate(255 * var_167_0)
	local var_167_2 = slot_0_41_1.size(0.065, arg_167_0 and arg_167_0.m_bIsScoped or false)
	local var_167_3 = slot_0_24_0.custom_scope_size * var_167_2 * var_167_0
	local var_167_4 = slot_0_24_0.custom_scope_gap

	if var_167_3 < 0.01 then
		return
	end

	local var_167_5 = slot_0_41_1.inverted(0.1, slot_0_24_0.custom_scope_invert)
	local var_167_6 = var_167_1:lerp(var_167_1:alpha_modulate(0), var_167_5)
	local var_167_7 = var_167_1:alpha_modulate(0):lerp(var_167_1, var_167_5)

	render.gradient(vector(slot_0_42_3.x, slot_0_42_3.y - var_167_4), vector(slot_0_42_3.x + 1, slot_0_42_3.y - var_167_4 - var_167_3), var_167_6, var_167_6, var_167_7, var_167_7)
	render.gradient(vector(slot_0_42_3.x, slot_0_42_3.y + var_167_4 + 1), vector(slot_0_42_3.x + 1, slot_0_42_3.y + var_167_4 + var_167_3 + 1), var_167_6, var_167_6, var_167_7, var_167_7)
	render.gradient(vector(slot_0_42_3.x - var_167_4, slot_0_42_3.y), vector(slot_0_42_3.x - var_167_4 - var_167_3, slot_0_42_3.y + 1), var_167_6, var_167_7, var_167_6, var_167_7)
	render.gradient(vector(slot_0_42_3.x + var_167_4 + 1, slot_0_42_3.y), vector(slot_0_42_3.x + var_167_4 + var_167_3 + 1, slot_0_42_3.y + 1), var_167_6, var_167_7, var_167_6, var_167_7)
end)

slot_0_41_0 = nil
slot_0_42_2 = slot_0_23_0:reference("rage_tweaks").reference
slot_0_43_1 = false
slot_0_44_2 = 1

function slot_0_45_3()
	if slot_0_43_1 then
		slot_0_14_0.AA.fake_lag.limit:override()

		slot_0_43_1 = false
	end
end

slot_0_16_0["Ragebot Tweaks"].createmove:set(function(arg_169_0, arg_169_1, arg_169_2)
	slot_0_11_0.functions.nade_fix = false

	if #slot_0_24_0.rage_tweaks == 0 or not arg_169_2 then
		return slot_0_45_3()
	end

	local var_169_0 = slot_0_21_0.convert(slot_0_24_0.rage_tweaks)

	if var_169_0["Fix Throw Nades"] then
		local var_169_1 = arg_169_1:get_player_weapon()

		if var_169_1 == nil then
			-- block empty
		else
			local var_169_2 = var_169_1:get_weapon_info()

			if ({
				weapon_molotov = 1,
				weapon_hegrenade = 1,
				weapon_incgrenade = 1,
				weapon_smokegrenade = 1,
				weapon_flashbang = 1
			})[var_169_2.console_name] then
				if var_169_1.m_bPinPulled then
					slot_0_44_2 = globals.curtime
				end

				if var_169_1.m_fThrowTime > 0 then
					slot_0_44_2 = globals.curtime
				end
			end

			if globals.curtime - slot_0_44_2 < 0.33 then
				slot_0_11_0.functions.nade_fix = true

				rage.exploit:allow_defensive(false)
			end
		end
	end

	if var_169_0["Ignore Shift While Air Strafe"] and not slot_0_12_0.onground and slot_0_12_0.velocity > 30 then
		arg_169_0.in_speed = false
	end

	slot_0_43_1 = true
end)

slot_0_42_1 = nil
slot_0_42_0 = {
	condition = function(arg_170_0, arg_170_1)
		if entity.get_local_player() == nil then
			return
		end

		local var_170_0 = slot_0_12_0.crouch or slot_0_14_0.AA.other.fake_duck:get()
		local var_170_1 = slot_0_12_0.velocity

		if arg_170_0 and rage.exploit:get() == 0 and not slot_0_14_0.RAGE.aimbot.double_tap.main:get() and not slot_0_14_0.RAGE.aimbot.hide_shots.main:get() and not slot_0_11_0.functions.legit then
			return slot_0_11_0.states[9]
		end

		if not arg_170_1 and slot_0_11_0.functions.legit then
			return slot_0_11_0.states[10]
		end

		if not slot_0_12_0.onground then
			return slot_0_11_0.states[(var_170_0 or slot_0_14_0.MISC.air_duck:get()) and 8 or 7]
		end

		if var_170_0 then
			return slot_0_11_0.states[var_170_1 > 10 and 6 or 5]
		end

		if var_170_1 > 10 then
			return slot_0_11_0.states[slot_0_14_0.AA.other.slow_walk:get() and 4 or 3]
		end

		return slot_0_11_0.states[2]
	end
}
slot_0_43_0 = nil
slot_0_44_1 = {
	Right = 90,
	Left = -90,
	Backward = 0,
	Forward = 180
}
slot_0_45_2 = slot_0_3_0.new("Manual AA", 6)

slot_0_16_0["Manual Yaw"].createmove:set(function(arg_171_0, arg_171_1, arg_171_2)
	if slot_0_24_0.manual_yaw == "Disabled" or not arg_171_2 then
		return
	end

	slot_0_45_2:tick()

	slot_0_45_2.yaw.main = "Backward"
	slot_0_45_2.yaw.offset = slot_0_44_1[slot_0_24_0.manual_yaw]
	slot_0_45_2.yaw.base = "Local View"

	if slot_0_24_0.manual_yaw_disabler then
		slot_0_45_2.yaw_modifier.main = "Disabled"
		slot_0_45_2.body_yaw.options = {}
	end

	if slot_0_24_0.manual_yaw_body_freestanding then
		local var_171_0 = slot_0_14_0.AA.angles.body_yaw.inverter:get()

		slot_0_45_2.body_yaw.main = true
		slot_0_45_2.body_yaw.inverter = var_171_0
		slot_0_45_2.body_yaw.left_limit = 60
		slot_0_45_2.body_yaw.right_limit = 60
		slot_0_45_2.body_yaw.freestanding = "Peek Fake"
	end

	slot_0_45_2.freestanding = false

	slot_0_45_2:run()
end)

slot_0_44_0 = nil

function slot_0_45_1(arg_172_0, arg_172_1)
	local var_172_0 = {}
	local var_172_1
	local var_172_2 = arg_172_0:get_eye_position() + vector(0, 0, 10)

	for iter_172_0 = 18, 360, 18 do
		iter_172_0 = math.normalize_yaw(iter_172_0)

		local var_172_3 = var_172_2 + vector():angles(0, iter_172_0) * 96
		local var_172_4 = utils.trace_line(var_172_2, var_172_3, arg_172_0, 33570827)
		local var_172_5 = var_172_4.entity

		if var_172_5 and var_172_5:get_classname() == "CWorld" and var_172_4.fraction < 0.35 then
			var_172_0[#var_172_0 + 1] = {
				vecTraceEnd = var_172_4.end_pos,
				flYaw = iter_172_0
			}
		end
	end

	table.sort(var_172_0, function(arg_173_0, arg_173_1)
		return arg_173_0.flYaw < arg_173_1.flYaw
	end)

	if #var_172_0 >= 2 then
		var_172_1 = (var_172_2 - var_172_0[1].vecTraceEnd:lerp(var_172_0[#var_172_0].vecTraceEnd, 0.5)):angles()
	end

	if var_172_1 then
		local var_172_6 = arg_172_1.view_angles.y
		local var_172_7 = var_172_1.y
		local var_172_8 = math.normalize_yaw(var_172_7 - var_172_6)

		if math.abs(var_172_8) < 90 then
			var_172_8 = 0
			var_172_6 = math.normalize_yaw(var_172_7 + 180)
		end

		return math.normalize_yaw(-var_172_6 + var_172_7 + var_172_8 + 180)
	end
end

slot_0_46_2 = slot_0_3_0.new("Edge Yaw", 5)

slot_0_16_0["Edge Yaw"].createmove:set(function(arg_174_0, arg_174_1, arg_174_2)
	slot_0_11_0.functions.edge = false

	if not slot_0_24_0.edge_yaw or not arg_174_2 then
		return
	end

	slot_0_46_2:tick()

	local var_174_0 = slot_0_45_1(arg_174_1, arg_174_0)

	if var_174_0 and not slot_0_11_0.functions.legit then
		slot_0_46_2.yaw.main = "Backward"
		slot_0_46_2.yaw.base = "Local View"
		slot_0_46_2.yaw.offset = var_174_0
		slot_0_11_0.functions.edge = true
	end

	slot_0_46_2:run()
end)

slot_0_45_0 = nil
slot_0_46_1 = slot_0_3_0.new("FS disablers", 34)

slot_0_16_0["FS Disablers AI"].createmove:set(function(arg_175_0, arg_175_1, arg_175_2)
	if #slot_0_24_0.freestand_disablers == 0 or not arg_175_2 then
		return
	end

	local var_175_0 = false
	local var_175_1 = slot_0_42_0.condition(false)

	for iter_175_0, iter_175_1 in pairs(slot_0_24_0.freestand_disablers) do
		if iter_175_1 == var_175_1 then
			var_175_0 = true

			break
		end
	end

	if not var_175_0 or not slot_0_14_0.AA.angles.freestanding:get() then
		return
	end

	slot_0_46_1:tick()

	slot_0_46_1.freestanding = false

	slot_0_46_1:run()
end)

slot_0_46_0 = nil

function slot_0_47_1(arg_176_0, arg_176_1)
	for iter_176_0, iter_176_1 in pairs(arg_176_1) do
		local var_176_0 = iter_176_1:get_origin()

		if arg_176_0:dist(var_176_0) < 128 then
			return true
		end
	end

	return false
end

slot_0_48_3 = {
	"CHostage",
	"CPlantedC4"
}
slot_0_49_4 = -1
slot_0_50_4 = slot_0_3_0.new("Legit AA", 8)

slot_0_16_0["Legit AA"].createmove:set(function(arg_177_0, arg_177_1, arg_177_2)
	slot_0_11_0.functions.legit = false

	if not slot_0_24_0.legit_aa or not arg_177_2 then
		return
	end

	if not arg_177_0.in_use then
		slot_0_49_4 = -1

		return
	end

	local var_177_0 = arg_177_1:get_player_weapon()

	if var_177_0 == nil then
		return
	end

	if var_177_0:get_classname() == "CC4" then
		return
	end

	local var_177_1 = arg_177_1:get_origin()

	for iter_177_0 = 1, #slot_0_48_3 do
		if slot_0_47_1(var_177_1, entity.get_entities(slot_0_48_3[iter_177_0], false)) then
			return
		end
	end

	if slot_0_49_4 == -1 then
		slot_0_49_4 = globals.tickcount + 1
	end

	arg_177_0.in_use = slot_0_49_4 > globals.tickcount

	slot_0_50_4:tick()

	slot_0_50_4.pitch = "Disabled"
	slot_0_50_4.yaw.main = "Backward"
	slot_0_50_4.yaw.base = "Local View"
	slot_0_50_4.yaw.offset = 180
	slot_0_50_4.body_yaw.main = true
	slot_0_50_4.freestanding = false
	slot_0_11_0.functions.legit = true

	slot_0_50_4:run()
end)

slot_0_47_0 = nil
slot_0_48_2 = slot_0_3_0.new("Vanish Anti Aim", 9)

function slot_0_49_3(arg_178_0)
	return arg_178_0[0]
end

function slot_0_50_3(arg_179_0)
	if not slot_0_1_0(slot_0_49_3, arg_179_0) then
		return false
	end

	return true
end

slot_0_16_0.Vanish.createmove:set(function(arg_180_0, arg_180_1, arg_180_2)
	slot_0_11_0.functions.vanish = false

	if not slot_0_24_0.vanish_mode or slot_0_24_0.antiaim_type == "Disabled" or slot_0_24_0.manual_yaw ~= "Disabled" or slot_0_11_0.functions.legit or slot_0_11_0.functions.edge or not arg_180_2 then
		return
	end

	local var_180_0
	local var_180_1
	local var_180_2 = entity.get_threat(true)

	if var_180_2 ~= nil then
		local var_180_3 = true

		var_180_1 = var_180_2
	else
		local var_180_4 = false

		var_180_1 = slot_0_20_0(arg_180_1)
	end

	if utils.net_channel() == nil or var_180_1 == nil then
		return
	end

	if not slot_0_50_3(var_180_1) then
		return
	end

	slot_0_48_2:tick()

	if var_180_1:is_alive() then
		local var_180_5 = var_180_1:get_player_weapon()

		if var_180_5 then
			local var_180_6 = var_180_5:get_classid()

			if ({
				[113] = true,
				[96] = true,
				[77] = true,
				[47] = true,
				[156] = true,
				[99] = true,
				[107] = true,
				[268] = true
			})[var_180_6] then
				slot_0_11_0.functions.vanish = true
			end

			if slot_0_11_0.functions.vanish then
				slot_0_48_2.yaw.main = "Backward"
				slot_0_48_2.yaw.base = "At Target"
				slot_0_48_2.yaw.offset = 5
				slot_0_48_2.yaw_modifier.main = "Disabled"
				slot_0_48_2.body_yaw.main = true
				slot_0_48_2.body_yaw.options = {
					""
				}
				slot_0_48_2.body_yaw.freestanding = ""

				rage.antiaim:inverter(false)

				slot_0_48_2.body_yaw.left_limit = 2
				slot_0_48_2.body_yaw.right_limit = 2
			end
		end
	end

	slot_0_48_2:run()
end)

slot_0_48_1 = nil
slot_0_48_0 = {
	is_air_weapon = false,
	on_condition = false,
	weapon = false,
	presets = {
		Stand = {
			[3] = {
				left_limit = 20,
				offset = 5,
				inverter = false,
				right_limit = 20
			},
			[2] = {
				left_limit = 20,
				offset = 0,
				inverter = false,
				right_limit = 25
			}
		},
		["Slow Walk"] = {
			[3] = {
				left_limit = 20,
				offset = 5,
				inverter = false,
				right_limit = 20
			},
			[2] = {
				left_limit = 20,
				offset = 0,
				inverter = false,
				right_limit = 25
			}
		},
		Crouch = {
			[3] = {
				left_limit = 35,
				offset = -5,
				inverter = true,
				right_limit = 60
			},
			[2] = {
				left_limit = 20,
				offset = 21,
				inverter = false,
				right_limit = 26
			}
		},
		["Crouch Move"] = {
			[3] = {
				left_limit = 35,
				offset = -5,
				inverter = true,
				right_limit = 60
			},
			[2] = {
				left_limit = 20,
				offset = 21,
				inverter = false,
				right_limit = 26
			}
		},
		["Air+"] = {
			[3] = {
				left_limit = 2,
				offset = 5,
				inverter = false,
				right_limit = 2
			},
			[2] = {
				left_limit = 2,
				offset = 5,
				inverter = false,
				right_limit = 2
			}
		},
		[107] = {
			[3] = {
				left_limit = 20,
				offset = 15,
				inverter = false,
				right_limit = 20
			},
			[2] = {
				left_limit = 20,
				offset = 15,
				inverter = false,
				right_limit = 20
			}
		},
		[268] = {
			[3] = {
				left_limit = 58,
				offset = 13,
				inverter = false,
				right_limit = 58
			},
			[2] = {
				left_limit = 58,
				offset = 23,
				inverter = false,
				right_limit = 58
			}
		}
	}
}
slot_0_49_2 = slot_0_23_0:reference("safe_head").reference
slot_0_50_2 = slot_0_3_0.new("Safe Head", 15)

slot_0_16_0["Safe Head"].createmove:set(function(arg_181_0, arg_181_1, arg_181_2)
	slot_0_11_0.functions.safe_head = false
	slot_0_48_0.weapon = false

	if #slot_0_24_0.safe_head == 0 or slot_0_11_0.functions.legit or slot_0_11_0.functions.edge or slot_0_24_0.manual_yaw ~= "Disabled" or slot_0_11_0.functions.randomization then
		return
	end

	slot_0_48_0.on_condition = false
	slot_0_48_0.is_air_weapon = false
	slot_0_48_0.class_id = 0

	local var_181_0 = slot_0_42_0.condition(false, true)

	if var_181_0 == "Air" or var_181_0 == "Air+" and not slot_0_48_0.on_condition then
		local var_181_1 = arg_181_1:get_player_weapon()

		if var_181_1 then
			local var_181_2 = var_181_1:get_classid()

			slot_0_48_0.class_id = var_181_2

			if var_181_2 == 107 then
				slot_0_48_0.on_condition = slot_0_49_2:get(6)
			elseif var_181_2 == 268 then
				slot_0_48_0.on_condition = slot_0_49_2:get(7)
			end

			slot_0_48_0.is_air_weapon = true
		end
	end

	if not slot_0_48_0.on_condition then
		for iter_181_0, iter_181_1 in pairs(slot_0_24_0.safe_head) do
			if var_181_0 == iter_181_1 then
				slot_0_48_0.on_condition = true

				break
			end
		end
	end

	if not slot_0_48_0.on_condition then
		return
	end

	slot_0_11_0.functions.safe_head = slot_0_48_0.is_air_weapon

	if not slot_0_11_0.functions.safe_head then
		local var_181_3 = arg_181_1:get_origin()
		local var_181_4 = slot_0_20_0(arg_181_1)
		local var_181_5 = 0

		if var_181_4 and var_181_4:is_alive() and not var_181_4:is_dormant() then
			local var_181_6 = var_181_4:get_origin()

			if (slot_0_48_0.is_air_weapon and var_181_3.z - 1 or var_181_6.z + 5) < var_181_3.z then
				slot_0_11_0.functions.safe_head = true
			end
		end
	end

	slot_0_48_0.weapon = slot_0_48_0.is_air_weapon

	slot_0_50_2:tick()

	if slot_0_11_0.functions.safe_head then
		local var_181_7 = slot_0_48_0.is_air_weapon and slot_0_48_0.presets[slot_0_48_0.class_id] or slot_0_48_0.presets[slot_0_12_0.condition]

		if not var_181_7 then
			return
		end

		local var_181_8 = var_181_7[arg_181_1.m_iTeamNum]

		if not var_181_8 then
			return
		end

		slot_0_50_2.yaw.main = "Backward"
		slot_0_50_2.yaw.base = "At Target"
		slot_0_50_2.yaw.offset = var_181_8.offset
		slot_0_50_2.yaw_modifier.main = "Disabled"
		slot_0_50_2.body_yaw.main = true
		slot_0_50_2.body_yaw.options = ""
		slot_0_50_2.body_yaw.left_limit = var_181_8.left_limit
		slot_0_50_2.body_yaw.right_limit = var_181_8.right_limit

		rage.antiaim:inverter(var_181_8.inverter)
	end

	slot_0_50_2:run()
end)

slot_0_49_1 = nil
slot_0_49_0 = {
	tp = 1,
	cvar = cvar.sv_maxusrcmdprocessticks
}
slot_0_50_1 = false
slot_0_49_0.orig_value = tonumber(slot_0_49_0.cvar:string())
slot_0_49_0.last_tick = globals.tickcount

function slot_0_49_0.backups()
	if slot_0_50_1 then
		slot_0_14_0.AA.fake_lag.limit:override()
		slot_0_14_0.AA.other.fake_duck:override()
		slot_0_14_0.AA.fake_lag.variability:override()
		slot_0_14_0.RAGE.aimbot.double_tap.options:override()
		slot_0_49_0.cvar:int(slot_0_49_0.orig_value)

		slot_0_50_1 = false
	end
end

slot_0_16_0["Exploit TP"].createmove:set(function(arg_183_0, arg_183_1, arg_183_2)
	slot_0_11_0.functions.air_exploit = false

	if not slot_0_24_0.force_tp or not arg_183_2 then
		return slot_0_49_0.backups()
	end

	slot_0_50_1 = true

	if not slot_0_12_0.onground then
		slot_0_14_0.AA.fake_lag.limit:override(17)
		slot_0_14_0.AA.fake_lag.variability:override(0)
		slot_0_14_0.RAGE.aimbot.double_tap.options:override("On Peek")

		if globals.tickcount % 2 == 1 then
			slot_0_49_0.cvar:int(16)

			slot_0_49_0.tp = slot_0_49_0.tp + 1

			slot_0_14_0.AA.other.fake_duck:override(true)
		end

		if slot_0_49_0.tp > 2 then
			slot_0_49_0.cvar:int(19)

			slot_0_49_0.tp = 1

			slot_0_14_0.AA.other.fake_duck:override()
		end

		slot_0_11_0.functions.air_exploit = true
	else
		slot_0_49_0.backups()
	end
end)

slot_0_50_0 = nil
slot_0_51_2 = slot_0_3_0.new("Conditional AA", 1)
slot_0_52_2 = 1
slot_0_53_3 = nil
slot_0_54_4 = -1
slot_0_55_4 = 0
slot_0_56_5 = 0
slot_0_57_5 = false
slot_0_58_6 = 0
slot_0_59_7 = false
slot_0_60_8 = 0
slot_0_61_6 = {}
slot_0_62_7 = {
	["2-Way"] = {
		-0.5,
		0.5
	},
	["3-Way"] = {
		-0.5,
		0,
		0.5
	},
	["5-Way"] = {
		-0.75,
		1,
		0,
		0.4,
		-0.25
	}
}

function slot_0_63_6()
	for iter_184_0, iter_184_1 in next, slot_0_11_0.states do
		slot_0_61_6[iter_184_1] = {
			previous_angle = 0,
			ticks = 0,
			current = 0,
			is_active = false
		}
	end
end

slot_0_63_6()

for iter_0_4, iter_0_5 in next, slot_0_11_0.states do
	slot_0_23_0:reference("YawModifier_" .. iter_0_5):set_callback(slot_0_63_6)
	slot_0_23_0:reference("YawModifierWay_" .. iter_0_5):set_callback(slot_0_63_6)
	slot_0_23_0:reference("YawModifierDelayT_" .. iter_0_5):set_callback(slot_0_63_6)
	slot_0_23_0:reference("YawModifierSafeYaw_" .. iter_0_5):set_callback(slot_0_63_6)
end

slot_0_16_0["Conditional AA"].createmove:set(function(arg_185_0, arg_185_1, arg_185_2)
	if slot_0_24_0.antiaim_type ~= "Builder" or not arg_185_2 then
		return
	end

	slot_185_3_0 = slot_0_12_0.condition

	if not slot_0_24_0["Enabled_" .. slot_185_3_0] then
		slot_185_3_0 = "Global"
	end

	slot_185_4_0 = slot_0_24_0["YawOffset_" .. slot_185_3_0]
	slot_185_5_0 = slot_0_24_0["YawType_" .. slot_185_3_0]
	slot_185_6_0 = slot_0_24_0["YawModifier_" .. slot_185_3_0]
	slot_185_7_0 = slot_0_24_0["YawModifierOffset_1_" .. slot_185_3_0]
	slot_185_8_0 = slot_0_24_0["YawModifierRandomize_" .. slot_185_3_0]
	slot_185_9_0 = rage.antiaim:inverter()
	slot_185_10_0 = slot_0_24_0["LimitType_" .. slot_185_3_0]
	slot_185_11_0 = slot_0_24_0["LeftLimit_" .. slot_185_3_0]
	slot_185_12_0 = slot_0_24_0["RightLimit_" .. slot_185_3_0]
	slot_185_13_0 = slot_0_24_0["FakeOptions_" .. slot_185_3_0]
	slot_185_14_0 = 0
	slot_185_15_3 = slot_0_24_0["YawD_" .. slot_185_3_0]
	slot_185_16_1 = slot_0_24_0["YawD2_" .. slot_185_3_0]

	if slot_185_15_3 ~= nil and slot_185_15_3 > 0 then
		slot_185_14_0 = slot_185_15_3

		if slot_185_16_1 ~= nil and slot_185_16_1 > 0 then
			slot_185_14_0 = utils.random_int(slot_185_15_3, slot_185_16_1)
		end
	end

	if not slot_0_11_0.functions.vanish and slot_185_14_0 > 0 and slot_0_21_0.contains(slot_185_13_0, "Jitter") then
		if arg_185_0.choked_commands == 0 then
			slot_0_57_5 = not slot_0_57_5
		end

		slot_185_9_0 = slot_0_57_5
		slot_185_15_2 = {}

		for iter_185_0 = 1, #slot_185_13_0 do
			slot_185_20_2 = slot_185_13_0[iter_185_0]

			if slot_185_20_2 ~= "Jitter" then
				table.insert(slot_185_15_2, slot_185_20_2)
			end
		end

		slot_185_13_0 = slot_185_15_2
	end

	if slot_185_5_0 ~= "180" and not slot_0_11_0.functions.safe_head and not slot_0_11_0.functions.vanish and not slot_0_11_0.functions.hidden_static then
		if slot_185_5_0 == "Left / Right" then
			if slot_185_14_0 > 0 and rage.exploit:get() == 1 then
				if arg_185_0.choked_commands == 0 then
					slot_0_58_6 = slot_0_58_6 + 1

					if slot_185_14_0 <= slot_0_58_6 then
						slot_0_58_6 = 0
						slot_0_59_7 = not slot_0_59_7
					end
				end

				slot_185_9_0 = slot_0_59_7
				slot_185_15_1 = {}

				for iter_185_1 = 1, #slot_185_13_0 do
					slot_185_20_1 = slot_185_13_0[iter_185_1]

					if slot_185_20_1 ~= "Jitter" then
						table.insert(slot_185_15_1, slot_185_20_1)
					end
				end

				slot_185_13_0 = slot_185_15_1
			end

			slot_185_4_0 = slot_185_9_0 and slot_0_24_0["YawOffsetLeft_" .. slot_185_3_0] or slot_0_24_0["YawOffsetRight_" .. slot_185_3_0]
		end

		if slot_185_5_0 == "Flick" then
			slot_185_4_0 = slot_0_8_0:flick(slot_0_12_0.condition, slot_0_24_0["YawOffsetLeft_" .. slot_185_3_0], slot_0_24_0["YawOffsetRight_" .. slot_185_3_0], slot_0_24_0["YawDelay_" .. slot_185_3_0])
		end

		if slot_185_5_0 == "Sway" then
			slot_185_4_0 = slot_0_9_0:sway(slot_0_12_0.condition, slot_0_24_0["YawOffsetLeft_" .. slot_185_3_0], slot_0_24_0["YawOffsetRight_" .. slot_185_3_0], slot_0_24_0["YawDelay_" .. slot_185_3_0], slot_0_24_0["YawSpeed_" .. slot_185_3_0])
		end

		if slot_185_5_0 == "Spin" then
			slot_185_4_0 = slot_0_9_0:spin(slot_0_12_0.condition, slot_0_24_0["YawOffsetLeft_" .. slot_185_3_0], slot_0_24_0["YawOffsetRight_" .. slot_185_3_0], 1, slot_0_24_0["YawSpeed_" .. slot_185_3_0])
		end
	end

	if slot_185_8_0 ~= 0 then
		if slot_185_7_0 > 0 then
			slot_185_7_0 = utils.random_int(math.clamp(slot_185_7_0 - slot_185_8_0, -180, 180), math.clamp(slot_185_7_0 + slot_185_8_0, -180, 180))
		else
			slot_185_7_0 = utils.random_int(math.clamp(slot_185_7_0 + slot_185_8_0, -180, 180), math.clamp(slot_185_7_0 - slot_185_8_0, -180, 180))
		end
	end

	if slot_185_6_0 == "Offset" then
		slot_185_4_0 = slot_185_4_0 + (slot_185_9_0 and slot_185_7_0 or 0)
		slot_185_6_0 = "Disabled"
		slot_185_7_0 = 0
	end

	if slot_185_6_0 == "Center" then
		slot_185_4_0 = slot_185_4_0 + (slot_185_9_0 and slot_185_7_0 or -slot_185_7_0) * 0.5
		slot_185_6_0 = "Disabled"
		slot_185_7_0 = 0
	end

	if slot_185_6_0 == "Meta" then
		slot_185_6_0 = "Disabled"
		slot_185_15_0 = slot_0_61_6[slot_185_3_0]
		slot_185_15_0.ticks = slot_185_15_0.ticks + 1
		slot_185_16_0 = slot_0_24_0["YawModifierWay_" .. slot_185_3_0]
		slot_185_17_0 = slot_0_62_7[slot_185_16_0]
		slot_185_18_0 = slot_185_17_0[slot_0_11_0.jitter % #slot_185_17_0 + 1]
		slot_185_19_0 = slot_0_24_0["YawModifierDelay_" .. slot_185_3_0]
		slot_185_20_0 = slot_0_24_0["YawModifierDelayT_" .. slot_185_3_0]

		if slot_185_19_0 ~= 4 and not slot_185_15_0.is_delay and slot_185_15_0.ticks % slot_185_19_0 == 0 and not slot_0_11_0.functions.legit then
			slot_185_15_0.is_delay = true
		end

		slot_185_21_0 = false

		if slot_185_15_0.is_delay then
			if slot_185_20_0 > slot_185_15_0.current then
				slot_185_15_0.current = slot_185_15_0.current + 1

				if slot_0_24_0["YawModifierSafeYaw_" .. slot_185_3_0] then
					slot_185_23_0 = slot_0_48_0.presets.Stand[arg_185_1.m_iTeamNum]
					slot_185_4_0 = slot_185_23_0.offset
					slot_185_13_0 = {
						""
					}
					slot_185_9_0 = slot_185_23_0.inverter
					slot_185_11_0 = slot_185_23_0.left_limit
					slot_185_12_0 = slot_185_23_0.right_limit
					slot_185_21_0 = true
				end

				slot_185_4_0 = slot_185_4_0 + slot_0_60_8
			else
				slot_185_15_0.is_delay = false
				slot_185_15_0.ticks = 0
				slot_185_15_0.current = 0
				slot_185_15_0.previous_angle = 0
				slot_0_60_8 = 0
			end
		else
			slot_185_22_0 = 0

			if slot_185_16_0 == "2-Way" and slot_0_21_0.contains(slot_185_13_0, "Jitter") then
				slot_185_22_0 = math.normalize_yaw(slot_185_4_0 + (slot_185_9_0 and slot_185_7_0 / 2 or slot_185_7_0 * -1 / 2))
			else
				slot_185_22_0 = math.normalize_yaw(slot_185_4_0 + slot_185_7_0 * slot_185_18_0)
			end

			slot_185_15_0.previous_angle = slot_185_22_0
		end

		if not slot_185_21_0 then
			slot_185_4_0 = slot_185_15_0.previous_angle
		end
	end

	if slot_185_6_0 == "3-Way" or slot_185_6_0 == "5-Way" then
		if arg_185_0.choked_commands == 0 then
			slot_0_52_2 = slot_0_52_2 + 1

			if slot_0_52_2 > (slot_185_6_0 == "3-Way" and 3 or 5) then
				slot_0_52_2 = 1
			end
		end

		if slot_0_24_0["YawModifierWayType_" .. slot_185_3_0] then
			slot_185_4_0 = slot_185_4_0 + slot_0_24_0["YawModifierOffset_" .. slot_0_52_2 .. "_" .. slot_185_3_0]
			slot_185_6_0 = "Disabled"
			slot_185_7_0 = 0
		end
	end

	if slot_185_10_0 == "Flick" then
		slot_185_11_0 = slot_0_8_0:flick(string.format("LFlick %s", slot_0_12_0.condition), slot_185_11_0, slot_185_12_0, slot_0_24_0["LimitDelay_" .. slot_185_3_0])
		slot_185_12_0 = slot_0_8_0:flick(string.format("RFlick %s", slot_0_12_0.condition), slot_185_11_0, slot_185_12_0, slot_0_24_0["LimitDelay_" .. slot_185_3_0])
	elseif slot_185_10_0 == "Sway" then
		slot_185_11_0 = slot_0_9_0:sway(string.format("LSway %s", slot_0_12_0.condition), slot_185_11_0, slot_185_12_0, slot_0_24_0["LimitDelay_" .. slot_185_3_0], slot_0_24_0["LimitSpeed_" .. slot_185_3_0])
		slot_185_12_0 = slot_0_9_0:sway(string.format("RSway %s", slot_0_12_0.condition), slot_185_11_0, slot_185_12_0, slot_0_24_0["LimitDelay_" .. slot_185_3_0], slot_0_24_0["LimitSpeed_" .. slot_185_3_0])
	end

	slot_0_51_2:tick()

	slot_0_51_2.enabled = true
	slot_0_51_2.pitch = slot_0_11_0.functions.legit and "Disabled" or slot_0_24_0["Pitch_" .. slot_185_3_0]
	slot_0_51_2.yaw.main = slot_0_24_0["Yaw_" .. slot_185_3_0]
	slot_0_51_2.yaw.base = slot_0_24_0["YawBase_" .. slot_185_3_0]
	slot_0_51_2.yaw.offset = slot_185_4_0 + utils.random_int(0, slot_0_24_0["YawRandomize_" .. slot_185_3_0])
	slot_0_51_2.yaw_modifier.main = slot_185_6_0
	slot_0_51_2.yaw_modifier.offset = slot_185_7_0
	slot_0_51_2.body_yaw.main = slot_0_24_0["BodyYaw_" .. slot_185_3_0]
	slot_0_51_2.body_yaw.inverter = slot_185_9_0
	slot_0_51_2.body_yaw.left_limit = slot_185_11_0
	slot_0_51_2.body_yaw.right_limit = slot_185_12_0
	slot_0_51_2.body_yaw.options = slot_185_13_0
	slot_0_51_2.body_yaw.freestanding = slot_0_24_0["Freestanding_" .. slot_185_3_0]
	slot_0_51_2.extended_angles.main = slot_0_24_0["ExtendedAngles_" .. slot_185_3_0]
	slot_0_51_2.extended_angles.pitch = slot_0_24_0["ExtendedPitch_" .. slot_185_3_0]
	slot_0_51_2.extended_angles.roll = slot_0_24_0["ExtendedRoll_" .. slot_185_3_0]

	slot_0_51_2:run()
end)

slot_0_51_1 = nil
slot_0_51_0 = {}
slot_0_52_1 = 1
slot_0_53_2 = nil
slot_0_54_3 = -1
slot_0_55_3 = 0
slot_0_56_4 = 0
slot_0_51_0.Aggressive = {
	[slot_0_11_0.states[slot_0_11_0.states_enum.STAND]] = {
		limit_type = "Default",
		yaw_mod_randomize = 500,
		yaw_mod = "Disabled",
		yaw_delay_second = 8,
		yaw_type = "Left / Right",
		right_limit = 58,
		yaw_delay = 3,
		yaw_mod_deg = 0,
		left_limit = 58,
		left_offset = {
			-19,
			-23
		},
		right_offset = {
			36,
			45
		},
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.MOVE]] = {
		limit_type = "Default",
		yaw_mod_randomize = 220,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_limit = 58,
		left_limit = 58,
		yaw_delay = 2,
		yaw_mod_deg = 0,
		left_offset = {
			-22,
			-25
		},
		right_offset = {
			36,
			40
		},
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.SLOWWALK]] = {
		limit_type = "Default",
		yaw_mod_randomize = 50,
		yaw_mod = "Disabled",
		yaw_delay_second = 6,
		yaw_type = "Left / Right",
		right_limit = 58,
		yaw_delay = 3,
		yaw_mod_deg = 0,
		left_limit = 58,
		left_offset = {
			-26,
			-32
		},
		right_offset = {
			40,
			47
		},
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.CROUCH]] = {
		limit_type = "Default",
		yaw_mod_randomize = 0,
		yaw_mod = "3-Way",
		yaw_mod_deg = 15,
		yaw_type = "Left / Right",
		right_limit = 58,
		left_limit = 58,
		left_offset = {
			-25,
			-30
		},
		right_offset = {
			40,
			46
		},
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.CROUCH_MOVE]] = {
		limit_type = "Default",
		yaw_mod_randomize = 200,
		yaw_mod = "Disabled",
		yaw_delay_second = 4,
		yaw_type = "Left / Right",
		right_limit = 58,
		yaw_delay = 2,
		yaw_mod_deg = 0,
		left_limit = 58,
		left_offset = {
			-17,
			-22
		},
		right_offset = {
			41,
			43
		},
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.AIR]] = {
		limit_type = "Default",
		yaw_mod_randomize = 200,
		yaw_mod = "Disabled",
		yaw_delay_second = 6,
		yaw_type = "Left / Right",
		right_limit = 58,
		yaw_delay = 3,
		yaw_mod_deg = 0,
		left_limit = 58,
		left_offset = {
			-24,
			-26
		},
		right_offset = {
			26,
			30
		},
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.AIR_CR]] = {
		limit_type = "Default",
		yaw_mod_randomize = 200,
		yaw_mod = "Disabled",
		yaw_delay_second = 7,
		yaw_type = "Left / Right",
		right_limit = 58,
		yaw_delay = 2,
		yaw_mod_deg = 0,
		left_limit = 58,
		left_offset = {
			-17,
			-20
		},
		right_offset = {
			38,
			41
		},
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.USING]] = {
		yaw_type = "180",
		left_offset = 1,
		yaw_offset = 180,
		right_offset = 1
	}
}
slot_0_51_0.Classic = {
	[slot_0_11_0.states[slot_0_11_0.states_enum.STAND]] = {
		limit_type = "Default",
		yaw_mod_randomize = 200,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 33,
		left_offset = -23,
		right_limit = 58,
		yaw_mod_deg = 5,
		yaw_delay = 1,
		limit_delay = 58,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.MOVE]] = {
		limit_type = "Default",
		yaw_mod_randomize = 50,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 30,
		left_offset = -30,
		right_limit = 58,
		yaw_mod_deg = 0,
		yaw_delay = 1,
		limit_delay = 58,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.SLOWWALK]] = {
		limit_type = "Default",
		yaw_mod_randomize = 20,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 43,
		left_offset = -29,
		right_limit = 58,
		yaw_mod_deg = -15,
		yaw_delay = 1,
		limit_delay = 58,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.CROUCH]] = {
		limit_type = "Default",
		yaw_mod_randomize = 50,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 49,
		left_offset = -29,
		right_limit = 58,
		left_limit = 58,
		yaw_delay = 1,
		yaw_mod_deg = 15,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.CROUCH_MOVE]] = {
		limit_type = "Default",
		yaw_mod_randomize = 30,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 43,
		left_offset = -18,
		right_limit = 58,
		yaw_mod_deg = 0,
		yaw_delay = 1,
		limit_delay = 58,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.AIR]] = {
		limit_type = "Default",
		yaw_mod_randomize = 10,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 39,
		left_offset = -25,
		right_limit = 58,
		yaw_mod_deg = 0,
		yaw_delay = 1,
		limit_delay = 58,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.AIR_CR]] = {
		limit_type = "Default",
		yaw_mod_randomize = 25,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 37,
		left_offset = -17,
		right_limit = 58,
		yaw_mod_deg = 0,
		yaw_delay = 1,
		limit_delay = 58,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.USING]] = {
		yaw_type = "180",
		left_offset = 1,
		yaw_offset = 180,
		right_offset = 1
	}
}
slot_0_51_0.Unrivaled = {
	[slot_0_11_0.states[slot_0_11_0.states_enum.STAND]] = {
		limit_type = "Default",
		yaw_mod_randomize = 50,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 38,
		left_offset = -23,
		right_limit = 58,
		left_limit = 58,
		yaw_delay = 1,
		yaw_mod_deg = 0,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.MOVE]] = {
		limit_type = "Default",
		yaw_mod_randomize = 20,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 33,
		left_offset = -26,
		right_limit = 58,
		left_limit = 58,
		yaw_delay = 1,
		yaw_mod_deg = -15,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.SLOWWALK]] = {
		limit_type = "Default",
		yaw_mod_randomize = 20,
		yaw_mod = "Disabled",
		yaw_delay_second = 5,
		yaw_type = "Left / Right",
		left_offset = -23,
		right_limit = 58,
		right_offset = 43,
		yaw_delay = 4,
		yaw_mod_deg = -15,
		limit_delay = 58,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.CROUCH]] = {
		limit_type = "Default",
		yaw_mod_randomize = 50,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 49,
		left_offset = -29,
		right_limit = 58,
		left_limit = 58,
		yaw_delay = 1,
		yaw_mod_deg = 15,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.CROUCH_MOVE]] = {
		limit_type = "Default",
		yaw_mod_randomize = 40,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 42,
		left_offset = -19,
		right_limit = 58,
		left_limit = 58,
		yaw_delay = 1,
		yaw_mod_deg = 0,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.AIR]] = {
		limit_type = "Default",
		yaw_mod_randomize = 10,
		yaw_mod = "Disabled",
		yaw_delay_second = 3,
		yaw_type = "Left / Right",
		left_offset = -14,
		right_limit = 58,
		right_offset = 39,
		yaw_delay = 1,
		yaw_mod_deg = 0,
		left_limit = 58,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.AIR_CR]] = {
		limit_type = "Default",
		yaw_mod_randomize = 30,
		yaw_mod = "Disabled",
		yaw_type = "Left / Right",
		right_offset = 38,
		left_offset = -17,
		right_limit = 58,
		left_limit = 58,
		yaw_delay = 1,
		yaw_mod_deg = 0,
		fake_options = {
			"Jitter"
		}
	},
	[slot_0_11_0.states[slot_0_11_0.states_enum.USING]] = {
		yaw_type = "180",
		left_offset = 1,
		yaw_offset = 180,
		right_offset = 1
	}
}
slot_0_57_4 = slot_0_3_0.new("Presets", 2)
slot_0_58_5 = false
slot_0_59_6 = 0
slot_0_60_7 = false

slot_0_16_0.Presets.createmove:set(function(arg_186_0, arg_186_1, arg_186_2)
	slot_186_3_0 = slot_0_24_0.antiaim_type

	if slot_186_3_0 ~= "Aggressive" and slot_186_3_0 ~= "Classic" and slot_186_3_0 ~= "Unrivaled" or not arg_186_2 then
		return
	end

	slot_186_4_0 = slot_0_51_0[slot_186_3_0]
	slot_186_5_0 = slot_0_42_0.condition(slot_186_4_0["Fake Lag"] ~= nil)

	if slot_186_5_0 == nil or slot_186_5_0 == "" then
		return
	end

	slot_186_6_0 = slot_186_4_0[slot_186_5_0]
	slot_186_7_0 = slot_186_6_0.yaw_offset or 0
	slot_186_8_0 = slot_186_6_0.yaw_type or "180"
	slot_186_9_0 = slot_186_6_0.yaw_mod or "Disabled"
	slot_186_10_0 = slot_186_6_0.yaw_mod_deg or 0
	slot_186_11_0 = slot_186_6_0.yaw_mod_randomize
	slot_186_12_0 = slot_186_6_0.inverter
	slot_186_13_0 = slot_186_6_0.limit_type
	slot_186_14_0 = slot_186_6_0.left_limit or 58
	slot_186_15_0 = slot_186_6_0.right_limit or 58
	slot_186_16_0 = slot_186_6_0.fake_options
	slot_186_17_0 = type(slot_186_6_0.left_offset) == "table" and utils.random_int(slot_186_6_0.left_offset[1], slot_186_6_0.left_offset[2]) or slot_186_6_0.left_offset
	slot_186_18_0 = type(slot_186_6_0.right_offset) == "table" and utils.random_int(slot_186_6_0.right_offset[1], slot_186_6_0.right_offset[2]) or slot_186_6_0.right_offset
	slot_186_19_0 = slot_186_6_0.yaw_delay_second ~= nil and utils.random_int(slot_186_6_0.yaw_delay, slot_186_6_0.yaw_delay_second) or slot_186_6_0.yaw_delay

	if slot_186_12_0 == nil then
		slot_186_12_0 = rage.antiaim:inverter()
	end

	if not slot_0_11_0.functions.vanish and slot_186_16_0 ~= nil and slot_0_21_0.contains(slot_186_16_0, "Jitter") then
		if arg_186_0.choked_commands == 0 then
			slot_0_58_5 = not slot_0_58_5
		end

		slot_186_12_0 = slot_0_58_5
		slot_186_20_1 = {}

		for iter_186_0 = 1, #slot_186_16_0 do
			slot_186_25_1 = slot_186_16_0[iter_186_0]

			if slot_186_25_1 ~= "Jitter" then
				table.insert(slot_186_20_1, slot_186_25_1)
			end
		end

		slot_186_16_0 = slot_186_20_1
	end

	if slot_186_8_0 ~= "180" and not slot_0_11_0.functions.safe_head and not slot_0_11_0.functions.vanish and not slot_0_11_0.functions.hidden_static then
		if slot_186_8_0 == "Left / Right" then
			if slot_186_19_0 ~= nil and rage.exploit:get() == 1 then
				if arg_186_0.choked_commands == 0 then
					slot_0_59_6 = slot_0_59_6 + 1

					if slot_186_19_0 <= slot_0_59_6 then
						slot_0_59_6 = 0
						slot_0_60_7 = not slot_0_60_7
					end
				end

				slot_186_12_0 = slot_0_60_7
				slot_186_20_0 = {}

				for iter_186_1 = 1, #slot_186_16_0 do
					slot_186_25_0 = slot_186_16_0[iter_186_1]

					if slot_186_25_0 ~= "Jitter" then
						table.insert(slot_186_20_0, slot_186_25_0)
					end
				end

				slot_186_16_0 = slot_186_20_0
			end

			slot_186_7_0 = slot_186_12_0 and slot_186_17_0 or slot_186_18_0
		end

		if slot_186_8_0 == "Flick" then
			slot_186_7_0 = slot_0_8_0:flick(slot_0_12_0.condition, slot_186_17_0, slot_186_18_0, slot_186_6_0.yaw_delay)
		end

		if slot_186_8_0 == "Sway" then
			slot_186_7_0 = slot_0_9_0:sway(slot_0_12_0.condition, slot_186_17_0, slot_186_18_0, slot_186_6_0.yaw_delay, slot_186_6_0.yaw_speed)
		end

		if slot_186_8_0 == "Spin" then
			slot_186_7_0 = slot_0_9_0:spin(slot_0_12_0.condition, slot_186_17_0, slot_186_18_0, 1, slot_186_6_0.yaw_speed)
		end
	end

	if slot_186_11_0 ~= nil then
		if slot_186_10_0 > 0 then
			slot_186_10_0 = utils.random_int(math.clamp(slot_186_10_0 - slot_186_11_0, -180, 180), math.clamp(slot_186_10_0 + slot_186_11_0, -180, 180))
		else
			slot_186_10_0 = utils.random_int(math.clamp(slot_186_10_0 + slot_186_11_0, -180, 180), math.clamp(slot_186_10_0 - slot_186_11_0, -180, 180))
		end
	end

	if slot_186_9_0 == "Offset" then
		slot_186_7_0 = slot_186_7_0 + (slot_186_12_0 and slot_186_10_0 or 0)
		slot_186_9_0 = "Disabled"
		slot_186_10_0 = 0
	end

	if slot_186_9_0 == "Center" then
		slot_186_7_0 = slot_186_7_0 + (slot_186_12_0 and slot_186_10_0 or -slot_186_10_0) * 0.5
		slot_186_9_0 = "Disabled"
		slot_186_10_0 = 0
	end

	if slot_186_9_0 == "3-Way" or slot_186_9_0 == "5-Way" then
		if arg_186_0.choked_commands == 0 then
			slot_0_52_1 = slot_0_52_1 + 1

			if slot_0_52_1 > (slot_186_9_0 == "3-Way" and 3 or 5) then
				slot_0_52_1 = 1
			end
		end

		if slot_186_6_0.custom_way_modifier ~= nil then
			slot_186_7_0 = slot_186_6_0.yaw_ways[slot_0_52_1]
			slot_186_9_0 = "Disabled"
			slot_186_10_0 = 0
		end
	end

	if slot_186_13_0 ~= nil then
		if slot_186_13_0 == "Flick" then
			slot_186_14_0 = slot_0_8_0:flick(string.format("LFlick %s", slot_0_12_0.condition), slot_186_14_0, slot_186_15_0, slot_186_6_0.limit_delay)
			slot_186_15_0 = slot_0_8_0:flick(string.format("RFlick %s", slot_0_12_0.condition), slot_186_14_0, slot_186_15_0, slot_186_6_0.limit_delay)
		elseif slot_186_13_0 == "Sway" then
			slot_186_14_0 = slot_0_9_0:sway(string.format("LSway %s", slot_0_12_0.condition), slot_186_14_0, slot_186_15_0, slot_186_6_0.limit_delay, slot_186_6_0.limit_speed)
			slot_186_15_0 = slot_0_9_0:sway(string.format("RSway %s", slot_0_12_0.condition), slot_186_14_0, slot_186_15_0, slot_186_6_0.limit_delay, slot_186_6_0.limit_speed)
		end
	end

	slot_0_57_4:tick()

	slot_0_57_4.enabled = true
	slot_0_57_4.pitch = slot_0_11_0.functions.legit and "Disabled" or "Down"
	slot_0_57_4.yaw.main = "Backward"
	slot_0_57_4.yaw.base = "At Target"
	slot_0_57_4.yaw.offset = slot_186_7_0
	slot_0_57_4.yaw_modifier.main = slot_186_9_0
	slot_0_57_4.yaw_modifier.offset = slot_186_10_0
	slot_0_57_4.body_yaw.main = slot_186_6_0.body_yaw or true
	slot_0_57_4.body_yaw.inverter = slot_186_12_0
	slot_0_57_4.body_yaw.left_limit = slot_186_14_0
	slot_0_57_4.body_yaw.right_limit = slot_186_15_0
	slot_0_57_4.body_yaw.options = slot_186_16_0
	slot_0_57_4.body_yaw.freestanding = slot_186_6_0.freestanding or "Off"

	slot_0_57_4:run()
end)

slot_0_52_0 = nil
slot_0_53_1 = slot_0_3_0.new("Hidden", 7)
slot_0_54_2 = false

function slot_0_55_2()
	if slot_0_54_2 then
		slot_0_14_0.RAGE.aimbot.double_tap.options:override()
		slot_0_14_0.RAGE.aimbot.hide_shots.options:override()

		slot_0_54_2 = false
	end
end

slot_0_56_3 = slot_0_23_0:reference("hidden_conditions").reference
slot_0_57_3 = slot_0_23_0:reference("hidden_triggers").reference
slot_0_58_4 = utils.get_netvar_offset("DT_CSPlayer", "m_flFlashDuration") - 16

function slot_0_59_5(arg_188_0)
	return ffi.cast("float*", ffi.cast("uint32_t", arg_188_0[0]) + slot_0_58_4)[0]
end

function slot_0_60_6(arg_189_0, arg_189_1)
	return arg_189_0 % (arg_189_1 + 1) / arg_189_1
end

function slot_0_61_5(arg_190_0, arg_190_1)
	if arg_190_1 == "Static" then
		return slot_0_24_0["DefPitchOffset1_" .. arg_190_0]
	end

	if arg_190_1 == "Jitter" then
		return bit.band(slot_0_11_0.jitter, 1) == 0 and slot_0_24_0["DefPitchOffset1_" .. arg_190_0] or slot_0_24_0["DefPitchOffset2_" .. arg_190_0]
	end

	if arg_190_1 == "Spin" then
		local var_190_0 = slot_0_24_0["DefPitchOffset1_" .. arg_190_0]
		local var_190_1 = slot_0_24_0["DefPitchOffset2_" .. arg_190_0]
		local var_190_2 = slot_0_24_0["DefPitchSpeed_" .. arg_190_0]

		return var_190_0 + slot_0_60_6(slot_0_11_0.jitter, var_190_2) * (var_190_1 - var_190_0)
	end

	return 0
end

function slot_0_62_6(arg_191_0, arg_191_1)
	if arg_191_1 == "Static" then
		return slot_0_24_0["DefYawOffset_" .. arg_191_0]
	end

	if arg_191_1 == "Jitter" then
		local var_191_0 = slot_0_24_0["DefYawOffset_" .. arg_191_0]
		local var_191_1 = slot_0_24_0["DefYawD_" .. arg_191_0]

		return var_191_1 > slot_0_11_0.jitter % (var_191_1 * 2) and var_191_0 or -var_191_0
	end

	if arg_191_1 == "Spin" then
		local var_191_2 = slot_0_24_0["DefYawOffset_" .. arg_191_0]
		local var_191_3 = slot_0_24_0["DefYawSpeed_" .. arg_191_0]

		return var_191_2 * 2 * slot_0_60_6(slot_0_11_0.jitter, var_191_3 + 1)
	end

	if arg_191_1 == "3-Way" then
		local var_191_4 = {
			90,
			180,
			-90
		}

		return var_191_4[slot_0_11_0.jitter % #var_191_4 + 1] + utils.random_float(-15, 15)
	end

	if arg_191_1 == "5-Way" then
		local var_191_5 = {
			90,
			135,
			180,
			225,
			270
		}

		return var_191_5[slot_0_11_0.jitter % #var_191_5 + 1] + utils.random_float(-15, 15)
	end

	return 0
end

function slot_0_63_5(arg_192_0)
	local var_192_0 = arg_192_0:get_player_weapon()
	local var_192_1 = arg_192_0:get_anim_overlay(10)

	if slot_0_57_3:get("Flashed") and slot_0_59_5(arg_192_0) > 0 then
		return "Flashed"
	end

	if slot_0_57_3:get("Taking Damage") and var_192_1.cycle < 0.99 then
		return "Taking Damage"
	end

	if slot_0_57_3:get("Weapon Switch") and arg_192_0.m_flNextAttack > globals.curtime then
		return "Weapon Switch"
	end

	if slot_0_57_3:get("Edge Direction") and (slot_0_14_0.AA.angles.freestanding:get() and rage.antiaim:get_target(true) or slot_0_24_0.manual_yaw ~= "Disabled") then
		return "Edge Direction"
	end

	return nil
end

function slot_0_64_5(arg_193_0, arg_193_1)
	local var_193_0 = slot_0_63_5(arg_193_0)

	if var_193_0 ~= nil then
		return "Triggers", var_193_0
	end

	if not slot_0_56_3:get(arg_193_1) then
		return nil, nil
	end

	return arg_193_1, nil
end

function slot_0_65_5(arg_194_0, arg_194_1, arg_194_2)
	if arg_194_2 == "On Peek" then
		return
	end

	if not slot_0_24_0["DefForceTargetYaw_" .. arg_194_2] then
		return
	end

	if slot_0_13_0.ticks == 0 then
		return
	end

	local var_194_0 = arg_194_1:get_player_weapon()

	if var_194_0 == nil then
		return
	end

	if var_194_0:get_weapon_index() == 64 then
		return
	end

	local var_194_1 = false

	if arg_194_2 ~= "Triggers" then
		slot_0_53_1.yaw.main = "Backward"
		slot_0_53_1.yaw.base = "At Target"
		slot_0_53_1.yaw.offset = 0
		slot_0_53_1.yaw_modifier.main = "Disabled"
		slot_0_53_1.yaw_modifier.offset = 0
	end

	slot_0_53_1.body_yaw.main = true
	slot_0_53_1.body_yaw.left_limit = 58
	slot_0_53_1.body_yaw.right_limit = 58

	if arg_194_0.choked_commands == 0 then
		var_194_1 = not var_194_1
	end

	rage.antiaim:inverter(var_194_1)

	slot_0_53_1.body_yaw.options = {
		""
	}
	slot_0_53_1.body_yaw.freestanding = "Off"
	slot_0_11_0.functions.hidden_static = true
end

function slot_0_66_4(arg_195_0, arg_195_1, arg_195_2)
	local var_195_0 = 360 * slot_0_60_6(slot_0_11_0.jitter, 10)
	local var_195_1 = utils.random_int(170, 190)

	if arg_195_2 == "Flashed" or arg_195_2 == "Taking Damage" then
		rage.antiaim:override_hidden_pitch(-45)
		rage.antiaim:override_hidden_yaw_offset(var_195_0)

		return
	end

	if arg_195_2 == "Weapon Switch" then
		rage.antiaim:override_hidden_pitch(-45)
		rage.antiaim:override_hidden_yaw_offset(var_195_1)

		return
	end

	if arg_195_2 == "Safe Head" then
		rage.antiaim:override_hidden_pitch(7)
		rage.antiaim:override_hidden_yaw_offset(var_195_1)

		return
	end

	if arg_195_2 == "Edge Direction" then
		slot_0_65_5(arg_195_0, arg_195_1, "Triggers")
		rage.antiaim:override_hidden_pitch(0)
		rage.antiaim:override_hidden_yaw_offset(var_195_1)

		return
	end

	if arg_195_2 == "Freestanding" then
		slot_0_65_5(arg_195_0, arg_195_1, "Triggers")
		rage.antiaim:override_hidden_pitch(-20)
		rage.antiaim:override_hidden_yaw_offset(var_195_1)

		return
	end
end

function slot_0_67_4(arg_196_0)
	local var_196_0 = slot_0_24_0["DefPitch_" .. arg_196_0]

	if var_196_0 == "Default" then
		return
	end

	local var_196_1 = slot_0_61_5(arg_196_0, var_196_0)
	local var_196_2 = slot_0_24_0["DefPitchRandom_" .. arg_196_0]
	local var_196_3 = var_196_1 + utils.random_int(-var_196_2, var_196_2)

	rage.antiaim:override_hidden_pitch(math.clamp(var_196_3, -89, 89))
end

function slot_0_68_5(arg_197_0)
	local var_197_0 = slot_0_24_0["DefYaw_" .. arg_197_0]

	if var_197_0 == "Default" then
		return
	end

	local var_197_1 = slot_0_62_6(arg_197_0, var_197_0)
	local var_197_2 = slot_0_24_0["DefYawRandom_" .. arg_197_0]
	local var_197_3 = var_197_1 + utils.random_int(-var_197_2, var_197_2)

	rage.antiaim:override_hidden_yaw_offset(math.normalize_yaw(-var_197_3, -180, 180))
end

function slot_0_69_6(arg_198_0, arg_198_1)
	if rage.exploit:get() ~= 1 then
		return
	end

	local var_198_0 = rage.antiaim:inverter()

	if arg_198_1 ~= "On Peek" then
		slot_0_53_1.yaw.main = "Backward"
		slot_0_53_1.yaw.base = "At Target"
		slot_0_53_1.yaw.offset = 0
		slot_0_53_1.yaw_modifier.main = "Disabled"
		slot_0_53_1.yaw_modifier.offset = 12
		slot_0_53_1.body_yaw.main = true
		slot_0_53_1.body_yaw.inverter = false
		slot_0_53_1.body_yaw.left_limit = 60
		slot_0_53_1.body_yaw.right_limit = 60
		slot_0_53_1.body_yaw.options = {
			"Anti Bruteforce"
		}
		slot_0_53_1.body_yaw.freestanding = "Peek Fake"
		arg_198_0.force_defensive = slot_0_9_0:spin(0, 64, 1, 1) > 63 and true or false
	end

	rage.antiaim:override_hidden_pitch(0)
	rage.antiaim:override_hidden_yaw_offset(var_198_0 and 100 or -100)
end

function slot_0_70_6(arg_199_0, arg_199_1, arg_199_2, arg_199_3)
	local var_199_0 = slot_0_24_0["DefMode_" .. arg_199_2]

	slot_0_53_1.yaw.hidden = true

	if arg_199_2 == "Triggers" then
		slot_0_66_4(arg_199_0, arg_199_1, arg_199_3)

		if arg_199_3 == "Edge Direction" or arg_199_3 == "Freestanding" then
			return
		end

		slot_0_65_5(arg_199_0, arg_199_1, arg_199_2)
	elseif var_199_0 == "Default" then
		slot_0_65_5(arg_199_0, arg_199_1, arg_199_2)
		slot_0_67_4(arg_199_2)
		slot_0_68_5(arg_199_2)
	elseif var_199_0 == "Flick" then
		slot_0_69_6(arg_199_0, arg_199_2)
	end
end

slot_0_16_0["Defensive Build"].createmove:set(function(arg_200_0, arg_200_1, arg_200_2)
	slot_0_11_0.functions.hidden_aa = false
	slot_0_11_0.functions.hidden_static = false

	local var_200_0 = entity.get_game_rules()
	local var_200_1 = slot_0_14_0.RAGE.aimbot.double_tap.main:get()
	local var_200_2 = slot_0_14_0.RAGE.aimbot.hide_shots.main:get()

	if not (arg_200_2 and not slot_0_11_0.functions.vanish and (slot_0_24_0.hidden_hs or not var_200_2 or not not var_200_1) and not slot_0_11_0.functions.air_exploit and not slot_0_11_0.functions.edge and not slot_0_11_0.functions.backstab and (not var_200_0 or not var_200_0.m_bFreezePeriod)) then
		slot_0_53_1.yaw.hidden = false

		slot_0_55_2()

		return
	end

	local var_200_3 = slot_0_12_0.condition
	local var_200_4
	local var_200_5 = false
	local var_200_6, var_200_7 = slot_0_64_5(arg_200_1, var_200_3)

	if var_200_6 then
		if slot_0_24_0["DefEnabled_" .. var_200_3] and slot_0_24_0["DefMode_" .. var_200_3] == "Flick" then
			var_200_4 = var_200_3
		elseif slot_0_24_0["DefEnabled_" .. var_200_6] then
			var_200_4 = var_200_6
		end

		var_200_5 = true
	elseif slot_0_24_0["DefEnabled_On Peek"] then
		var_200_4 = "On Peek"
	end

	slot_0_53_1:tick()

	if var_200_5 then
		slot_0_14_0.RAGE.aimbot.double_tap.options:override("Always On")
		slot_0_14_0.RAGE.aimbot.hide_shots.options:override("Break LC")

		slot_0_54_2 = true
	else
		slot_0_55_2()
	end

	if not slot_0_24_0.hidden_aa or not var_200_4 then
		slot_0_53_1.yaw.hidden = false

		return
	end

	slot_0_70_6(arg_200_0, arg_200_1, var_200_4, var_200_7)
	slot_0_53_1:run()
end)

slot_0_53_0 = nil
slot_0_54_1 = slot_0_3_0.new("Randomization", 10)

slot_0_16_0.Randomization.createmove:set(function(arg_201_0, arg_201_1, arg_201_2)
	slot_0_11_0.functions.randomization = false

	if not slot_0_24_0.randomize_switch or slot_0_24_0.manual_yaw ~= "Disabled" or slot_0_11_0.functions.legit or not arg_201_2 then
		return
	end

	local var_201_0 = false
	local var_201_1 = entity.get_game_rules()

	if var_201_1 == nil then
		return
	end

	slot_0_54_1:tick()

	if slot_0_24_0.randomize_on_round_end and globals.curtime < var_201_1.m_flRestartRoundTime then
		local var_201_2 = true

		entity.get_players(true, true, function(arg_202_0)
			if arg_202_0:is_alive() then
				var_201_2 = false
			end
		end)

		if var_201_2 then
			slot_0_11_0.functions.randomization = true
		end
	end

	if slot_0_24_0.randomize_on_warmup and var_201_1.m_bWarmupPeriod then
		slot_0_11_0.functions.randomization = true
	end

	if slot_0_11_0.functions.randomization then
		slot_0_54_1.pitch = "Disabled"
		slot_0_54_1.yaw.main = "Backward"
		slot_0_54_1.yaw.offset = -slot_0_9_0:spin("Salam", -180, 180, 1, 5)
		slot_0_54_1.yaw.base = "At Target"
		slot_0_54_1.yaw_modifier.main = "Disabled"
		slot_0_54_1.yaw_modifier.offset = 0
		slot_0_54_1.body_yaw.main = false
		slot_0_54_1.body_yaw.left_limit = 58
		slot_0_54_1.body_yaw.right_limit = 58
		slot_0_54_1.body_yaw.options = {
			""
		}
		slot_0_54_1.body_yaw.freestanding = ""

		rage.exploit:allow_defensive(false)

		arg_201_0.no_choke = true
	end

	slot_0_54_1:run()
end)

slot_0_54_0 = nil
slot_0_55_1 = slot_0_3_0.new("Anti backstab", 24)

function slot_0_56_2(arg_203_0)
	local var_203_0 = {
		distance = 300
	}
	local var_203_1 = arg_203_0:get_eye_position()
	local var_203_2 = entity.get_players(true)

	for iter_203_0, iter_203_1 in pairs(var_203_2) do
		local var_203_3 = iter_203_1:get_player_weapon()

		if not var_203_3 then
			-- block empty
		else
			local var_203_4 = var_203_3:get_classname()

			if not var_203_4 then
				-- block empty
			elseif var_203_4 ~= "CKnife" then
				-- block empty
			else
				local var_203_5 = iter_203_1:get_origin()
				local var_203_6 = var_203_1:dist(var_203_5)

				if var_203_6 > var_203_0.distance then
					-- block empty
				else
					var_203_0.ent = iter_203_1
					var_203_0.distance = var_203_6
				end
			end
		end
	end

	if not var_203_0.ent then
		return
	end

	local var_203_7 = (var_203_1 - var_203_0.ent:get_origin()):angles()
	local var_203_8 = render.camera_angles()
	local var_203_9 = math.normalize_yaw(var_203_7.y - var_203_8.y)

	slot_0_55_1:tick()

	slot_0_55_1.yaw.base = "Local View"
	slot_0_55_1.yaw.offset = var_203_9

	slot_0_55_1:run()

	slot_0_11_0.functions.backstab = true
end

slot_0_16_0["Anti Backstab"].createmove:set(function(arg_204_0, arg_204_1, arg_204_2)
	slot_0_11_0.functions.backstab = false

	if not slot_0_24_0.anti_backstab or slot_0_11_0.functions.edge or slot_0_11_0.functions.legit or not arg_204_2 then
		return
	end

	slot_0_56_2(arg_204_1)
end)

slot_0_55_0 = nil
slot_0_56_1 = {
	head = {
		"какой же ты хуевый / статик нынче не в моде",
		"кузя",
		"как же ты сочно отлетел / с луасенсом играешь что ли?",
		"1 / только попробуй оправдаться / убогое чмо",
		"тебя только что суйдус обоссал / твои действия?",
		"S[[DF[F[FS[SDF[DS[FSD[FDS[F[F[F[F / stupid skeetless",
		"1 / надеюсь теперь ты познал что такое пенить",
		"1 / sleep dog",
		"1 / ahahahahahahahah",
		"не устал позориться обмудок? / ливни уже нахуй",
		"ммм наивный / 1 хуесос",
		"че ты там чавкаешь пиздой / сиди молча",
		"четко в жбан / прямо как в твою мать из дробовика",
		"БАМ",
		"L / kys",
		"u think im lucky?? / just xo-yaw",
		"добрый вечер",
		"нормас я тебя шлёпнул / сразу видно чувачела с асидом / только эту хуйню тапнуть можно",
		"соси уебанец / не чувствую тебя абсолютно",
		"1 / лови по шляпе",
		"1 / прям как в тире "
	},
	body = {
		"я твоей маме тараканов в жопу пихал / животное ебаное",
		"ХА ЧМО ЗАЦЕНИ АЙДИШНИК / market.neverlose.cc/xo-yaw",
		"u mad? / i just broke lagcomp",
		"я не прожимал боди / у меня чит прекрасный",
		"FEEL THE XO-YAW / чмо ебаное",
		"как же я тебя обоссал / немощ ссаный",
		"? / what you do dog?",
		"нищая хуйня / куда ты поползла",
		"скули чмо в хуй папе",
		"ммм наивный / 1 хуесос",
		"ты читаешься как книга / слишком хуевый для меня",
		"ебучая калека / в следующий раз будешь умнее",
		"сын говна / снова совершил ошибку",
		"че шнырь ебаный / ниче не перепутал?",
		"и что ты сейчас сделал / ты серьезно надеелся что ты сможешь меня убить?",
		"прямо в пузо / как и хотел"
	},
	taser = {
		"сгорел пидорас ебаный",
		"ммм наивный / 1 хуесос",
		"шлюха на зевсе",
		"a12 / f12",
		"yt bot",
		"лови электрический привет / долбаеб"
	},
	inferno = {
		"сгорел пидорас ебаный",
		"че смок тяжело кинуть долбаеб?",
		"гори в аду",
		"нихуя я тебя зажарил ублюдка",
		"F]DFDSFSD]F[DSFSDFS] / FIRE IN THE HELL"
	},
	hegrenade = {
		"взорван хуйсос",
		"allah akbar хуйсос",
		"лети обратно к матери / ебанат",
		"аллах акбар / но локально",
		"бахнуло как надо / кровь да кишки"
	},
	death = {
		"что ты сделал / безмозглый",
		"не повезло",
		"ну фу / что ты делаешь",
		"only luck in this game",
		"хуя меня пингануло жоско",
		"НЕТ / ОНО ЖЕ ПЕРЕПИКАЕТ",
		"чмо ебаное / 5х5 на 2к евро слетаем ссаный мусор?",
		"ну отлично / опять в дез мисснул",
		"сервер копеечный / ну зато у пидораса тут стреляет",
		"F][SD[]FSD][FD[]FSD[]] / хуесосу опять повезло",
		"фу / ублюдок что ты сделал в очередной раз",
		"ебаный сочник / ну ниче в следующем раунде в письку дунешь",
		"так держать / сын шлюхи ебаный",
		"на подпике / иди нахуй"
	}
}
slot_0_57_2 = nil
slot_0_58_3 = false

function slot_0_59_4(arg_205_0)
	local var_205_0 = slot_0_56_1[arg_205_0]

	if not var_205_0 then
		return nil
	end

	local var_205_1 = #var_205_0

	if var_205_1 == 0 then
		return nil
	end

	local var_205_2
	local var_205_3 = 0

	while var_205_3 < var_205_1 do
		var_205_2 = var_205_0[utils.random_int(1, var_205_1)]

		if var_205_2 ~= slot_0_57_2 then
			slot_0_57_2 = var_205_2

			break
		end

		var_205_3 = var_205_3 + 1
	end

	return var_205_2 and string.split(var_205_2, " / ")
end

function slot_0_60_5(arg_206_0)
	slot_0_58_3 = true

	local var_206_0 = 0

	for iter_206_0, iter_206_1 in ipairs(arg_206_0) do
		var_206_0 = var_206_0 + string.proper_len(iter_206_1) / 7

		utils.execute_after(var_206_0, function()
			utils.console_exec("say " .. iter_206_1)
		end)
	end

	utils.execute_after(var_206_0, function()
		slot_0_58_3 = false
	end)
end

slot_0_16_0.Trashtalk.player_death:set(function(arg_209_0, arg_209_1, arg_209_2)
	if not slot_0_24_0.trashtalk or slot_0_58_3 then
		return
	end

	local var_209_0 = entity.get_game_rules()

	if not var_209_0 or var_209_0.m_bWarmupPeriod then
		return
	end

	local var_209_1 = entity.get(arg_209_0.userid, true)
	local var_209_2 = entity.get(arg_209_0.attacker, true)

	if not var_209_1 or not var_209_2 then
		return
	end

	local var_209_3

	if slot_0_24_0.trashtalk_revenge then
		if var_209_1 == arg_209_1 and var_209_2:is_enemy() then
			killer_index = var_209_2:get_index()
		end

		if var_209_1:get_index() == killer_index then
			utils.execute_after(0.4, utils.console_exec, "say 1")

			killer_index = nil
		end
	end

	if var_209_2 == arg_209_1 and var_209_1:is_enemy() then
		var_209_3 = arg_209_0.headshot and "head" or "body"

		if slot_0_56_1[arg_209_0.weapon] ~= nil then
			var_209_3 = arg_209_0.weapon
		end
	end

	if var_209_1 == arg_209_1 and var_209_2:is_enemy() then
		var_209_3 = "death"
	end

	if not var_209_3 then
		return
	end

	local var_209_4 = slot_0_59_4(var_209_3)

	if not var_209_4 then
		return
	end

	slot_0_60_5(var_209_4)
end)
slot_0_16_0.Trashtalk.round_start:set(function()
	killer_index = nil
	slot_0_57_2 = nil
end)

slot_0_56_0 = nil
slot_0_57_1 = {
	[0] = "generic",
	"head",
	"chest",
	"stomach",
	"left arm",
	"right arm",
	"left leg",
	"right leg",
	"neck",
	"generic",
	"gear"
}
slot_0_58_2 = {
	inferno = "Burned ",
	knife = "Knifed ",
	hegrenade = "Naded "
}

slot_0_16_0["Event Logs"].player_hurt:set(function(arg_211_0, arg_211_1, arg_211_2)
	if not slot_0_24_0.event_logger or not slot_0_21_0.contains(slot_0_24_0.event_logger_events, "Damage Dealt") then
		return
	end

	local var_211_0 = entity.get(arg_211_0.userid, true)
	local var_211_1 = entity.get(arg_211_0.attacker, true)

	if var_211_0 == nil or var_211_0 == arg_211_1 or var_211_1 ~= arg_211_1 then
		return
	end

	if not slot_0_58_2[arg_211_0.weapon] then
		return
	end

	local var_211_2 = slot_0_24_0.event_logger_clr

	var_211_2.a = 255

	local var_211_3 = {
		string.format("\v%s \a808080FF· \aDEFAULT", slot_0_11_0.label),
		string.format("%s", slot_0_58_2[arg_211_0.weapon]),
		string.format("\v%s\r ", var_211_0:get_name() or "unknown"),
		"for ",
		string.format("\v%d\r ", arg_211_0.dmg_health or 0),
		"damage (",
		string.format("\v%d\r ", arg_211_0.health or 0),
		"remaining)"
	}

	slot_0_27_0.add(5, string.format("\a%s%s \aDEFAULT%s\a%s%s\aDEFAULT for \a%s%d \aDEFAULTdamage", var_211_2:to_hex(), ui.get_icon("check"), slot_0_58_2[arg_211_0.weapon], var_211_2:to_hex(), var_211_0:get_name(), var_211_2:to_hex(), arg_211_0.dmg_health), var_211_2)
	slot_0_25_0.print(false, slot_0_25_0.format(table.concat(var_211_3, ""), var_211_2))
end)
slot_0_16_0["Event Logs"].item_purchase:set(function(arg_212_0, arg_212_1, arg_212_2)
	if not slot_0_24_0.event_logger or not slot_0_21_0.contains(slot_0_24_0.event_logger_events, "Purchases") then
		return
	end

	local var_212_0 = arg_212_0.weapon

	if var_212_0 == nil or var_212_0 == "weapon_unknown" then
		return
	end

	local var_212_1 = entity.get(arg_212_0.userid, true)

	if var_212_1 == nil or not var_212_1:is_enemy() then
		return
	end

	local var_212_2 = slot_0_24_0.event_logger_clr

	var_212_2.a = 255

	local var_212_3 = var_212_0:gsub("weapon_", ""):gsub("item_", "")
	local var_212_4 = {
		string.format("\v%s \a808080FF· \aDEFAULT", slot_0_11_0.label),
		string.format("\v%s\r ", var_212_1:get_name() or "unknown"),
		"bought ",
		string.format("\v%s", var_212_3)
	}

	slot_0_27_0.add(5, string.format("\a%s%s %s \aDEFAULTbought \a%s%s", var_212_2:to_hex(), ui.get_icon("cart-shopping"), var_212_1:get_name(), var_212_2:to_hex(), var_212_3), var_212_2)
	slot_0_25_0.print(false, slot_0_25_0.format(table.concat(var_212_4, ""), var_212_2))
end)
slot_0_16_0["Event Logs"].aim_ack:set(function(arg_213_0, arg_213_1)
	if not slot_0_24_0.event_logger or not slot_0_21_0.contains(slot_0_24_0.event_logger_events, "Aimbot Shots") then
		return
	end

	slot_213_2_0 = arg_213_0.target

	if slot_213_2_0 == nil then
		return
	end

	if arg_213_0.state then
		if arg_213_0.state == "correction" then
			arg_213_0.state = "resolver"
		end

		slot_213_3_1 = slot_0_24_0.event_logger_miss_clr
		slot_213_3_1.a = 255
		slot_213_4_1 = {
			string.format("\v%s \a808080FF· \aDEFAULT", slot_0_11_0.label),
			"Missed ",
			string.format("\v%s\r", slot_213_2_0:get_name() or "unknown"),
			"'s ",
			string.format("\v%s\r", slot_0_57_1[arg_213_0.wanted_hitgroup] or "generic"),
			"(",
			string.format("\v%d\r", arg_213_0.wanted_damage or 0),
			") ",
			"due to ",
			string.format("\v%s\r ", arg_213_0.state),
			"(",
			string.format("\v%d%%\r", arg_213_0.hitchance or 0),
			") (",
			string.format("\v%.2f\r", arg_213_0.spread or 0),
			"°, bt: ",
			string.format("\v%d\r", arg_213_0.backtrack or 0),
			")"
		}

		slot_0_27_0.add(5, string.format("\a%s%s \aDEFAULTMissed at \a%s%s\aDEFAULT due to \a%s%s", slot_213_3_1:to_hex(), ui.get_icon("xmark"), slot_213_3_1:to_hex(), slot_213_2_0:get_name(), slot_213_3_1:to_hex(), arg_213_0.state), slot_213_3_1)
		slot_0_25_0.print(false, slot_0_25_0.format(table.concat(slot_213_4_1, ""), slot_213_3_1))

		return
	end

	slot_213_3_0 = arg_213_0.wanted_damage - arg_213_0.damage > 0
	slot_213_4_0 = arg_213_0.hitgroup ~= arg_213_0.wanted_hitgroup
	slot_213_5_0 = slot_0_24_0.event_logger_clr
	slot_213_5_0.a = 255
	slot_213_6_0 = {
		string.format("\v%s \a808080FF· \aDEFAULT", slot_0_11_0.label),
		"Hit ",
		string.format("\v%s\r", slot_213_2_0:get_name()),
		"'s ",
		string.format("\v%s\r ", slot_0_57_1[arg_213_0.hitgroup] or "generic"),
		"for ",
		string.format("\v%d\r", arg_213_0.damage or 0),
		slot_213_3_0 and "(" or "",
		slot_213_3_0 and string.format("\v%d\r", arg_213_0.wanted_damage or 0) or "",
		slot_213_3_0 and ") damage " or " damage ",
		slot_213_4_0 and "(aimed:" or "",
		slot_213_4_0 and string.format("\v%s\r", slot_0_57_1[arg_213_0.wanted_hitgroup]) or "",
		slot_213_4_0 and ")" or "",
		"(",
		string.format("\v%d%%\r", arg_213_0.hitchance or 0),
		") ",
		"(",
		string.format("\v%.2f\r", arg_213_0.spread or 0),
		"°, bt: ",
		string.format("\v%d\r", arg_213_0.backtrack or 0),
		")"
	}

	slot_0_27_0.add(5, string.format("\a%s%s \aDEFAULTHit \a%s%s\aDEFAULT in the \a%s%s\aDEFAULT for \a%s%d \aDEFAULTdamage", slot_213_5_0:to_hex(), ui.get_icon("check"), slot_213_5_0:to_hex(), slot_213_2_0:get_name(), slot_213_5_0:to_hex(), slot_0_57_1[arg_213_0.hitgroup], slot_213_5_0:to_hex(), arg_213_0.damage), slot_213_5_0)
	slot_0_25_0.print(false, slot_0_25_0.format(table.concat(slot_213_6_0, ""), slot_213_5_0))
end)

slot_0_57_0 = nil
slot_0_58_1 = {}
slot_0_59_3 = 16
slot_0_60_4 = {
	stomach = 2
}

function slot_0_61_4()
	slot_0_14_0.RAGE.aimbot.hitboxes:override()
end

function slot_0_62_5(arg_215_0, arg_215_1, arg_215_2)
	local var_215_0 = globals.tickinterval
	local var_215_1 = cvar.sv_gravity:float() * var_215_0
	local var_215_2 = cvar.sv_jump_impulse:float() * var_215_0
	local var_215_3 = arg_215_1
	local var_215_4 = arg_215_1
	local var_215_5 = arg_215_0.m_vecVelocity
	local var_215_6 = var_215_5.z > 0 and -var_215_1 or var_215_2

	for iter_215_0 = 1, arg_215_2 do
		local var_215_7 = var_215_3

		var_215_3 = vector(var_215_3.x + var_215_5.x * var_215_0, var_215_3.y + var_215_5.y * var_215_0, var_215_3.z + (var_215_5.z + var_215_6) * var_215_0)

		if utils.trace_line(var_215_7, var_215_3, arg_215_0).fraction <= 0.99 then
			return var_215_7
		end
	end

	return var_215_3
end

function slot_0_63_4(arg_216_0)
	slot_0_58_1 = {}

	local var_216_0 = entity.get_local_player()

	if var_216_0 == nil or not var_216_0:is_alive() then
		return
	end

	local var_216_1 = var_216_0:get_player_weapon()

	if var_216_1 == nil then
		return
	end

	local var_216_2 = var_216_1.m_iClip1
	local var_216_3 = var_216_1:get_weapon_info()

	if var_216_2 == -1 or var_216_3 == nil then
		return
	end

	local var_216_4 = var_216_2 >= 2 and 1 / var_216_3.cycle_time > 2
	local var_216_5 = 1

	if slot_0_14_0.RAGE.aimbot.double_tap.main:get() and rage.exploit:get() == 1 and var_216_4 then
		var_216_5 = 2
	end

	local var_216_6 = {
		var_216_0
	}

	for iter_216_0, iter_216_1 in pairs(entity.get_players()) do
		if not iter_216_1:is_enemy() then
			table.insert(var_216_6, iter_216_1)
		end
	end

	local var_216_7 = var_216_0:get_origin()

	entity.get_players(true, false, function(arg_217_0)
		if not arg_217_0:is_alive() then
			return
		end

		if arg_217_0:is_dormant() then
			return
		end

		local var_217_0 = arg_217_0:get_resource()

		if not var_217_0 then
			return
		end

		local var_217_1 = var_217_0.m_iArmor
		local var_217_2 = arg_217_0.m_iHealth
		local var_217_3 = (var_216_7 - arg_217_0:get_eye_position()):length()
		local var_217_4 = var_216_3.damage * 1.25 * math.pow(var_216_3.range_modifier, var_217_3 * 0.002)

		if var_217_1 > 0 then
			var_217_4 = var_217_4 * var_216_3.armor_ratio * 0.5
		end

		if var_217_2 <= math.ceil(var_217_4) * var_216_5 then
			slot_0_58_1[arg_217_0:get_index()] = true
		end
	end)

	return ((function(arg_218_0)
		if not arg_218_0 or not arg_218_0:is_alive() then
			return
		end

		local var_218_0 = var_216_0:get_eye_position()
		local var_218_1 = arg_218_0.m_iHealth
		local var_218_2 = slot_0_62_5(var_216_0, var_218_0, slot_0_59_3)
		local var_218_3 = 0

		for iter_218_0, iter_218_1 in pairs(slot_0_60_4) do
			local var_218_4 = arg_218_0:get_hitbox_position(iter_218_1)
			local var_218_5 = slot_0_62_5(arg_218_0, var_218_4, slot_0_59_3)
			local var_218_6 = utils.trace_bullet(var_216_0, var_218_0, var_218_4, var_216_6)

			if var_218_3 < var_218_6 then
				var_218_3 = var_218_6
			end

			local var_218_7 = utils.trace_bullet(var_216_0, var_218_0, var_218_5, var_216_6)

			if var_218_3 < var_218_7 then
				var_218_3 = var_218_7
			end

			local var_218_8 = utils.trace_bullet(var_216_0, var_218_2, var_218_4, var_216_6)

			if var_218_3 < var_218_8 then
				var_218_3 = var_218_8
			end

			local var_218_9 = utils.trace_bullet(var_216_0, var_218_2, var_218_5, var_216_6)

			if var_218_3 < var_218_9 then
				var_218_3 = var_218_9
			end
		end

		if var_218_1 <= var_218_3 * var_216_5 then
			return math.ceil(var_218_3 - 0.5)
		end
	end)(arg_216_0))
end

function slot_0_64_4()
	local var_219_0 = entity.get_threat()
	local var_219_1 = slot_0_63_4(var_219_0)

	if var_219_0 == nil or var_219_0:is_dormant() or not var_219_1 or var_219_1 == 0 then
		return
	end

	slot_0_14_0.RAGE.aimbot.hitboxes:override("Stomach")

	return true
end

slot_0_16_0["Lethal Baim"].net_update_end:set(function(arg_220_0, arg_220_1)
	if not slot_0_24_0.baim_lethal or not arg_220_1 then
		slot_0_61_4()

		return
	end

	if not slot_0_64_4() then
		return slot_0_61_4()
	end
end)
esp.enemy:new_text(string.format("%s · baimable", slot_0_11_0.label), "FB", function(arg_221_0)
	local var_221_0 = arg_221_0:get_index()

	if slot_0_58_1[var_221_0] then
		return "BAIM"
	end
end)

slot_0_58_0 = nil
slot_0_59_2 = {
	["Auto Snipers"] = {
		38,
		11
	},
	Pistols = {
		4,
		63,
		36,
		3,
		1,
		64,
		2,
		30,
		61,
		32
	},
	Scout = {
		40
	},
	AWP = {
		9
	},
	Taser = {
		31
	}
}
slot_0_60_3 = cvar.sv_gravity
slot_0_61_3 = 0
slot_0_62_4 = 0

slot_0_16_0["Automatic Teleport"].createmove:set(function(arg_222_0, arg_222_1, arg_222_2)
	if not slot_0_24_0.automatic_tp or #slot_0_24_0.automatic_tp_weapons == 0 or not arg_222_2 then
		return rage.exploit:allow_charge(true)
	end

	if slot_0_12_0.onground or slot_0_12_0.velocity < 100 then
		return
	end

	if rage.exploit:get() ~= 1 then
		return
	end

	local var_222_0 = entity.get_threat()

	if var_222_0 == nil then
		return
	end

	local var_222_1 = arg_222_1:get_player_weapon()

	if var_222_1 == nil then
		return
	end

	local var_222_2 = var_222_1:get_weapon_index()
	local var_222_3 = false
	local var_222_4 = false

	for iter_222_0, iter_222_1 in ipairs(slot_0_24_0.automatic_tp_weapons) do
		local var_222_5 = slot_0_59_2[iter_222_1]

		if var_222_5 then
			for iter_222_2, iter_222_3 in ipairs(var_222_5) do
				if iter_222_3 == var_222_2 then
					var_222_3 = true

					break
				end
			end
		elseif iter_222_1 == "Knife" then
			var_222_4 = true
		end
	end

	if not var_222_3 and var_222_4 and var_222_1:get_classid() == 107 then
		var_222_3 = true
	end

	if not var_222_3 then
		return
	end

	local var_222_6 = var_222_0:get_resource()

	if not var_222_6 then
		return
	end

	local var_222_7 = var_222_6.m_iPing
	local var_222_8 = math.max(5, to_ticks(var_222_7 * (var_222_7 <= 10 and 2 or 1.75) / 1000))
	local var_222_9 = var_222_0:get_hitbox_position(4)
	local var_222_10 = arg_222_1:get_hitbox_position(4)
	local var_222_11, var_222_12 = utils.trace_bullet(var_222_0, var_222_9, slot_0_25_0.extrapolate(arg_222_1, var_222_8, var_222_10))

	if (var_222_11 and var_222_11 > 0 or false) and (var_222_12.entity and var_222_12.entity:get_classname() ~= "CWorld" or false) and slot_0_61_3 < globals.realtime then
		if slot_0_62_4 == slot_0_24_0.automatic_tp_delay then
			slot_0_61_3 = globals.realtime + 0.5

			rage.exploit:force_teleport()
			rage.exploit:allow_charge(false)

			slot_0_62_4 = 0
		end

		slot_0_62_4 = slot_0_62_4 + 1
	else
		rage.exploit:allow_charge(true)
	end
end)

slot_0_59_1 = nil
slot_0_59_0 = {}
slot_0_60_2 = {}

function slot_0_59_0.get(arg_223_0)
	local var_223_0 = slot_0_60_2[arg_223_0]

	return var_223_0 ~= nil and var_223_0.active
end

slot_0_59_0.is_any_active = false

slot_0_16_0["Update Hotkeys"].render:set(function()
	slot_0_60_2 = {}
	slot_0_59_0.is_any_active = false

	local var_224_0 = ui.get_binds()

	for iter_224_0 = 1, #var_224_0 do
		local var_224_1 = var_224_0[iter_224_0]

		if var_224_1.active then
			slot_0_59_0.is_any_active = true
		end

		local var_224_2 = var_224_1.name

		slot_0_60_2[var_224_2] = var_224_1
	end
end)

slot_0_60_1 = nil
slot_0_60_0 = {
	alpha = slot_0_17_0:new(),
	allign = slot_0_17_0:new(),
	state = slot_0_17_0:new(),
	glow = slot_0_17_0:new(),
	blind = slot_0_17_0:new(),
	modern = slot_0_17_0:new(),
	stylish = slot_0_17_0:new()
}
slot_0_61_2 = {
	{
		get_text = function()
			return math.floor(slot_0_12_0.velocity_modifier * 100) .. "%"
		end,
		condition = function()
			return slot_0_12_0.velocity_modifier ~= 1
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "PING",
		condition = function()
			return slot_0_14_0.MISC.fake_latency:get() ~= 0
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "DT",
		condition = function()
			return slot_0_14_0.RAGE.aimbot.double_tap.main:get()
		end,
		color = function()
			return color(255, 25, 25):lerp(slot_0_11_0.colors.white, rage.exploit:get())
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "OS",
		condition = function()
			return slot_0_14_0.RAGE.aimbot.hide_shots.main:get()
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "FS",
		condition = function()
			return slot_0_14_0.AA.angles.freestanding:get()
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "DMG",
		condition = function()
			return slot_0_59_0.get("Min. Damage")
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "HC",
		condition = function()
			return slot_0_59_0.get("Hit Chance")
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "BAIM",
		condition = function()
			local var_234_0 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers"):get()

			return slot_0_14_0.RAGE.other.body_aim:get() == "Force" and #var_234_0 == 0
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "SAFE",
		condition = function()
			return slot_0_14_0.RAGE.other.safe_point:get() == "Force"
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "DUCK",
		condition = function()
			return slot_0_14_0.AA.other.fake_duck:get()
		end,
		anim = slot_0_17_0:new()
	}
}
slot_0_62_3 = {
	{
		get_text = function()
			return string.format("%d%%", math.floor(slot_0_12_0.velocity_modifier * 100))
		end,
		condition = function()
			return slot_0_12_0.velocity_modifier ~= 1
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "vanish",
		condition = function()
			return slot_0_11_0.functions.vanish
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "safe",
		condition = function()
			return slot_0_11_0.functions.safe_head
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "spike",
		condition = function()
			return slot_0_14_0.MISC.fake_latency:get() ~= 0
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "doubletap",
		condition = function()
			return slot_0_14_0.RAGE.aimbot.double_tap.main:get()
		end,
		color = function()
			return color(255, 25, 25):lerp(slot_0_11_0.colors.white, rage.exploit:get())
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "onshot",
		condition = function()
			return slot_0_14_0.RAGE.aimbot.hide_shots.main:get()
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "freestand",
		condition = function()
			return slot_0_14_0.AA.angles.freestanding:get()
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "damage",
		condition = function()
			return slot_0_59_0.get("Min. Damage")
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "hitchance",
		condition = function()
			return slot_0_59_0.get("Hit Chance")
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "bodyaim",
		condition = function()
			local var_248_0 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers"):get()

			return slot_0_14_0.RAGE.other.body_aim:get() == "Force" and #var_248_0 == 0
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "safepoint",
		condition = function()
			return slot_0_14_0.RAGE.other.safe_point:get() == "Force"
		end,
		anim = slot_0_17_0:new()
	},
	{
		text = "duck",
		condition = function()
			return slot_0_14_0.AA.other.fake_duck:get()
		end,
		anim = slot_0_17_0:new()
	}
}
slot_0_63_3 = slot_0_10_0("Tahoma", vector(11, 10.5), "abd")

function slot_0_64_3(arg_251_0, arg_251_1)
	if arg_251_1 <= 0 then
		return
	end

	slot_251_2_0 = math.max(0.2, math.abs(math.sin(globals.realtime * 2.5)))
	slot_251_3_1 = slot_0_60_0.allign
	slot_251_4_1 = 0.1

	if arg_251_0 and arg_251_0.m_bIsScoped or false then
		slot_251_5_2 = not slot_0_24_0.crosshair_indicators_align

		if false then
			slot_251_5_2 = false
		end
	else
		slot_251_5_2 = true
	end

	slot_251_3_0 = slot_251_3_1(slot_251_4_1, slot_251_5_2)
	slot_251_4_0 = 1
	slot_251_5_1 = arg_251_0 and arg_251_0:get_player_weapon() or false

	if not slot_251_5_1 then
		-- block empty
	else
		slot_251_6_1 = slot_251_5_1:get_weapon_info()
		slot_251_4_0 = slot_0_60_0.blind(0.075, slot_251_6_1.weapon_type == 9 and 0.3 or 1)
	end

	slot_251_5_0 = slot_0_11_0.colors.white:alpha_modulate(arg_251_1 * slot_251_4_0, true)
	slot_251_6_0 = slot_0_24_0.crosshair_indicators_clr2:alpha_modulate(255 * arg_251_1 * slot_251_4_0)
	slot_251_7_0 = slot_0_24_0.crosshair_indicators_clr:alpha_modulate(255 * arg_251_1 * slot_251_2_0 * slot_251_4_0)
	slot_251_8_0 = render.screen_size()
	slot_251_8_0.x = slot_251_8_0.x * 0.5 + (1 - slot_251_3_0)
	slot_251_8_0.y = slot_251_8_0.y * 0.5 + 20
	slot_251_9_1 = "XO-YAW"
	slot_251_9_0 = string.format("%s \a%s%s", slot_251_9_1, slot_251_7_0:to_hex(), slot_0_11_0.version:upper())
	slot_251_10_1 = render.measure_text(2, "s", slot_251_9_0)
	slot_251_11_2 = slot_251_8_0:clone()
	slot_251_11_2.x = slot_251_11_2.x - slot_251_10_1.x * 0.5 * slot_251_3_0
	slot_251_12_1 = slot_0_60_0.glow(0.2, slot_0_24_0.crosshair_indicators_glow)

	if slot_251_12_1 > 0.01 then
		render.shadow(vector(slot_251_11_2.x + 2, slot_251_11_2.y + 7), vector(slot_251_11_2.x + slot_251_10_1.x - 4, slot_251_11_2.y + 7), slot_251_7_0:alpha_modulate(slot_251_12_1, true), 20, 0, 0)
	end

	render.text(2, slot_251_11_2, slot_251_5_0, "s", slot_251_9_0)

	slot_251_8_0.y = slot_251_8_0.y + (slot_251_10_1.y - 4)
	slot_251_10_0 = string.upper(slot_0_11_0.functions.vanish and "VANISH" or slot_0_11_0.functions.safe_head and "SAFE" or slot_0_12_0.condition)
	slot_251_11_1 = render.measure_text(2, "s", slot_251_10_0)
	slot_251_12_0 = slot_0_60_0.state(0.1, slot_251_11_1.x)

	if slot_251_12_0 > slot_251_11_1.x then
		slot_251_12_0 = slot_251_11_1.x
	end

	slot_251_13_0 = slot_251_8_0:clone()
	slot_251_13_0.x = slot_251_13_0.x - slot_251_12_0 * 0.5 * slot_251_3_0
	slot_251_14_0 = vector(slot_251_12_0, slot_251_11_1.y)

	render.push_clip_rect(slot_251_13_0, slot_251_13_0 + slot_251_14_0)
	render.text(2, slot_251_13_0, slot_251_6_0, "s", slot_251_10_0)
	render.pop_clip_rect()

	slot_251_8_0.y = slot_251_8_0.y + (slot_251_11_1.y - 4)
	slot_251_11_0 = 0

	for iter_251_0, iter_251_1 in pairs(slot_0_61_2) do
		slot_251_17_0 = iter_251_1.anim(0.1, iter_251_1.condition())

		if slot_251_17_0 <= 0.01 then
			-- block empty
		else
			slot_251_18_0 = iter_251_1.text or iter_251_1.get_text()
			slot_251_19_0 = iter_251_1.color and iter_251_1.color() or slot_0_11_0.colors.white
			slot_251_20_0 = render.measure_text(2, "s", slot_251_18_0)
			slot_251_21_0 = slot_251_8_0:clone()
			slot_251_21_0.x = slot_251_21_0.x - slot_251_20_0.x * 0.5 * slot_251_3_0
			slot_251_21_0.y = slot_251_21_0.y + slot_251_11_0

			render.text(2, slot_251_21_0, slot_251_19_0:alpha_modulate(arg_251_1 * slot_251_17_0 * slot_251_4_0, true), "s", slot_251_18_0)

			slot_251_11_0 = slot_251_11_0 + (slot_251_20_0.y - 4) * slot_251_17_0
		end
	end
end

function slot_0_65_4(arg_252_0, arg_252_1)
	if arg_252_1 <= 0 then
		return
	end

	local var_252_0 = slot_0_60_0.allign
	local var_252_1 = 0.1
	local var_252_2

	if arg_252_0 and arg_252_0.m_bIsScoped or false then
		var_252_2 = not slot_0_24_0.crosshair_indicators_align

		if false then
			var_252_2 = false
		end
	else
		var_252_2 = true
	end

	local var_252_3 = var_252_0(var_252_1, var_252_2)
	local var_252_4 = 1
	local var_252_5 = arg_252_0 and arg_252_0:get_player_weapon() or false

	if not var_252_5 then
		-- block empty
	else
		local var_252_6 = var_252_5:get_weapon_info()

		var_252_4 = slot_0_60_0.blind(0.075, var_252_6.weapon_type == 9 and 0.3 or 1)
	end

	local var_252_7 = slot_0_24_0.crosshair_indicators_clr:alpha_modulate(255 * arg_252_1 * var_252_4)
	local var_252_8 = slot_0_24_0.crosshair_indicators_clr2:alpha_modulate(255 * arg_252_1 * var_252_4)
	local var_252_9 = render.screen_size()

	var_252_9.x = var_252_9.x * 0.5 + (1 - var_252_3)
	var_252_9.y = var_252_9.y * 0.5 + 20

	local var_252_10 = "XO-YAW"
	local var_252_11 = string.wave("xo-yaw.lua°", var_252_7, var_252_8, slot_0_24_0.crosshair_indicators_anim_speed / 10)
	local var_252_12 = render.measure_text(slot_0_63_3, "s", var_252_11)
	local var_252_13 = var_252_9:clone()

	var_252_13.x = var_252_13.x - var_252_12.x * 0.5 * var_252_3

	local var_252_14 = slot_0_60_0.glow(0.2, slot_0_24_0.crosshair_indicators_glow)

	if var_252_14 > 0.01 then
		local var_252_15 = var_252_7:lerp(var_252_8, slot_0_19_0(0.5, slot_0_24_0.crosshair_indicators_anim_speed / 10))

		render.shadow(vector(var_252_13.x + 2, var_252_13.y + 7), vector(var_252_13.x + var_252_12.x - 4, var_252_13.y + 7), var_252_15:alpha_modulate(var_252_14 * arg_252_1, true), 20, 0, 0)
	end

	render.text(slot_0_63_3, var_252_13, var_252_7, "s", var_252_11)

	var_252_9.y = var_252_9.y + var_252_12.y * 0.9

	local var_252_16 = 0

	for iter_252_0, iter_252_1 in pairs(slot_0_62_3) do
		local var_252_17 = iter_252_1.anim(0.15, iter_252_1.condition())

		if var_252_17 <= 0.01 then
			-- block empty
		else
			local var_252_18 = iter_252_1.text or iter_252_1.get_text()
			local var_252_19 = iter_252_1.color and iter_252_1.color() or slot_0_11_0.colors.white
			local var_252_20 = render.measure_text(1, "s", var_252_18)
			local var_252_21 = var_252_20.x * var_252_17
			local var_252_22 = var_252_9:clone()

			var_252_22.x = var_252_22.x - var_252_21 * 0.5 * var_252_3
			var_252_22.y = var_252_22.y + var_252_16

			local var_252_23 = vector(var_252_21, var_252_20.y)

			render.push_clip_rect(var_252_22, var_252_22 + var_252_23)
			render.text(1, var_252_22, var_252_19:alpha_modulate(arg_252_1 * var_252_17 * var_252_4, true), "s", var_252_18)
			render.pop_clip_rect()

			var_252_16 = var_252_16 + (var_252_20.y - 2) * var_252_17
		end
	end
end

slot_0_16_0["Crosshair Indicators"].render:set(function(arg_253_0, arg_253_1)
	local var_253_0 = slot_0_60_0.alpha(0.2, slot_0_24_0.crosshair_indicators and arg_253_1)

	if var_253_0 <= 0 then
		return
	end

	local var_253_1 = slot_0_24_0.crosshair_indicators_type
	local var_253_2 = slot_0_60_0.modern(0.2, var_253_1 == "Modern")

	if var_253_2 > 0.01 then
		slot_0_64_3(arg_253_0, var_253_0 * var_253_2)
	end

	local var_253_3 = slot_0_60_0.stylish(0.2, var_253_1 == "Stylish")

	if var_253_3 > 0.01 then
		slot_0_65_4(arg_253_0, var_253_0 * var_253_3)
	end
end)

slot_0_61_1 = nil
slot_0_61_0 = {
	alpha = slot_0_17_0:new(),
	scope = slot_0_17_0:new(),
	right = slot_0_17_0:new(),
	left = slot_0_17_0:new()
}
slot_0_62_2 = slot_0_10_0("Tahoma", 25, "ab")

slot_0_16_0["Manual Arrows"].render:set(function(arg_254_0, arg_254_1)
	local var_254_0 = slot_0_61_0.alpha(0.2, slot_0_24_0.manual_arrows and arg_254_1)

	if var_254_0 <= 0 then
		return
	end

	local var_254_1 = slot_0_61_0.scope(0.075, arg_254_0 and not arg_254_0.m_bIsScoped or false)

	if var_254_1 <= 0 then
		return
	end

	local var_254_2 = slot_0_24_0.manual_arrows_clr:alpha_modulate(255)
	local var_254_3 = slot_0_24_0.manual_arrows_clr2
	local var_254_4 = var_254_3:lerp(var_254_2, slot_0_61_0.left(0.2, slot_0_24_0.manual_yaw == "Left"))
	local var_254_5 = var_254_3:lerp(var_254_2, slot_0_61_0.right(0.2, slot_0_24_0.manual_yaw == "Right"))

	render.text(slot_0_62_2, vector(slot_0_11_0.screen_center.x - 53, slot_0_11_0.screen_center.y - 12), var_254_4:alpha_modulate(var_254_0 * var_254_1, true), "b", "‹")
	render.text(slot_0_62_2, vector(slot_0_11_0.screen_center.x + 43, slot_0_11_0.screen_center.y - 12), var_254_5:alpha_modulate(var_254_0 * var_254_1, true), "b", "›")
end)

slot_0_62_1 = nil
slot_0_62_0 = {
	alpha = slot_0_17_0:new(),
	number = slot_0_17_0:new()
}
slot_0_63_2 = slot_0_18_0.add("Damage Indicator", vector(slot_0_11_0.screen_center.x + 5, slot_0_11_0.screen_center.y - 22), vector(20, 20))

slot_0_16_0["Damage Indicator"].render:set(function(arg_255_0, arg_255_1)
	local var_255_0 = slot_0_62_0.alpha(0.2, slot_0_24_0.damage_indicator and arg_255_1)

	if var_255_0 <= 0 then
		return
	end

	slot_0_63_2:process()

	if slot_0_63_2.is_in_b and slot_0_63_2.is_rmb_pressed and slot_0_11_0.menu_alpha > 0 then
		slot_0_63_2.position = vector(slot_0_11_0.screen_center.x + 5, slot_0_11_0.screen_center.y - 22)
	end

	local var_255_1 = slot_0_14_0.RAGE.other.min_damage:get()
	local var_255_2 = slot_0_62_0.number(0.045, var_255_1)
	local var_255_3 = var_255_2 == 0 and "AUTO" or math.floor(var_255_2)

	if slot_0_11_0.menu_alpha > 0.01 then
		var_255_3 = "DMG"

		local var_255_4 = render.measure_text(2, "s", var_255_3)

		render.rect_outline(slot_0_63_2.position, slot_0_63_2.position + slot_0_63_2.size, slot_0_11_0.colors.white:alpha_modulate(var_255_0 * slot_0_11_0.menu_alpha, true), 1, 3)

		slot_0_63_2.size = var_255_4 + 5
	end

	render.text(2, vector(slot_0_63_2.position.x + 3, slot_0_63_2.position.y + 2), slot_0_24_0.damage_indicator_clr:alpha_modulate(var_255_0, true), "s", var_255_3)
end)

slot_0_63_1 = nil
slot_0_63_0 = {
	glow = slot_0_17_0:new()
}
slot_0_64_2 = cvar.cl_interp
slot_0_65_3 = cvar.cl_interp_ratio
slot_0_66_3 = cvar.cl_updaterate

function slot_0_67_3(arg_256_0, arg_256_1, arg_256_2, arg_256_3)
	arg_256_3 = arg_256_3 or 1

	local var_256_0 = slot_0_24_0.widgets_rounding

	arg_256_0 = arg_256_0 - 1
	arg_256_1 = arg_256_1 + 1

	local var_256_1 = 255 * arg_256_3
	local var_256_2 = arg_256_2.a
	local var_256_3 = arg_256_2:alpha_modulate(var_256_1)
	local var_256_4 = var_256_3:alpha_modulate(var_256_3.a * 0.5)
	local var_256_5 = var_256_3:alpha_modulate(var_256_3.a * 0.7)
	local var_256_6 = arg_256_1 - arg_256_0
	local var_256_7 = slot_0_63_0.glow(0.2, slot_0_24_0.widgets_glow)

	if var_256_7 > 0.01 then
		render.shadow(arg_256_0, arg_256_1 + vector(-1), var_256_5:alpha_modulate(var_256_7, true), 35, 0, var_256_0)
	end

	local var_256_8 = color(17, var_256_2)
	local var_256_9 = var_256_8:alpha_modulate(var_256_2 * 0.25)

	render.gradient(arg_256_0 + vector(0, var_256_0), arg_256_1, var_256_8, var_256_8, var_256_9, var_256_9)
	render.rect(arg_256_0 + vector(var_256_0), arg_256_0 + vector(var_256_6.x - var_256_0, var_256_0), var_256_8)
	render.circle(arg_256_0 + var_256_0, var_256_8, var_256_0, 180, 0.25)
	render.circle(arg_256_0 + vector(var_256_6.x - var_256_0, var_256_0), var_256_8, var_256_0, 270, 0.25)
	render.circle_outline(arg_256_0 + var_256_0, var_256_4, var_256_0, 180, 0.25, 0)
	render.circle_outline(arg_256_0 + vector(var_256_6.x - var_256_0, var_256_0), var_256_4, var_256_0, 270, 0.25, 0)
	render.rect(arg_256_0 + vector(var_256_0), arg_256_0 + vector(var_256_6.x - var_256_0, 1), var_256_4)
	render.rect(arg_256_0 + vector(0, var_256_6.y - 1), arg_256_1, var_256_3)
	render.gradient(arg_256_0 + vector(0, var_256_0), arg_256_0 + vector(1, var_256_6.y - 1), var_256_4, var_256_4, var_256_3, var_256_3)
	render.gradient(arg_256_0 + vector(var_256_6.x - 1, var_256_0), arg_256_0 + vector(var_256_6.x, var_256_6.y - 1), var_256_4, var_256_4, var_256_3, var_256_3)
end

function slot_0_68_4()
	local var_257_0 = utils.net_channel()

	if not var_257_0 then
		return 0
	end

	local var_257_1 = var_257_0.avg_latency[1]
	local var_257_2 = 0

	if slot_0_66_3:float() > 0.001 then
		var_257_1 = var_257_1 + -0.5 / slot_0_66_3:float()
	end

	local var_257_3 = math.max(0, var_257_1)

	return math.floor(var_257_3 * 1000)
end

slot_0_69_5 = nil
slot_0_69_4 = {
	items = {},
	alpha = slot_0_17_0:new(),
	width = slot_0_17_0:new(125),
	dragging = slot_0_17_0:new()
}
slot_0_70_5 = slot_0_18_0.add("keybinds", vector(100, 100), vector(125, 18))

function slot_0_69_4.render(arg_258_0)
	slot_0_70_5:process()

	arg_258_0 = arg_258_0 * slot_0_69_4.dragging(0.1, slot_0_70_5.dragging and 0.5 or 1)

	local var_258_0 = vector(slot_0_70_5.position.x, slot_0_70_5.position.y + slot_0_70_5.size.y + 5)
	local var_258_1 = 125
	local var_258_2 = 0

	for iter_258_0, iter_258_1 in pairs(ui.get_binds()) do
		local var_258_3 = iter_258_1.name
		local var_258_4 = iter_258_1.value

		if not slot_0_69_4.items[var_258_3] then
			slot_0_69_4.items[var_258_3] = {
				name = var_258_3,
				alpha = slot_0_17_0:new()
			}
		end

		local var_258_5 = slot_0_69_4.items[var_258_3]
		local var_258_6 = var_258_5.alpha(0.1, iter_258_1.active)

		if var_258_6 > 0.01 then
			local var_258_7 = string.clamp(var_258_5.name, 15)
			local var_258_8 = slot_0_11_0.colors.white:alpha_modulate(arg_258_0 * var_258_6, true)

			render.text(1, var_258_0 + vector(5, var_258_2), var_258_8, "s", var_258_7)

			local var_258_9
			local var_258_10 = type(var_258_4)

			if var_258_10 == "table" then
				var_258_9 = table.concat(var_258_4, ", ")
			else
				var_258_9 = var_258_10 == "boolean" and (var_258_4 == false and "disabled" or iter_258_1.mode == 1 and "holding" or "toggled") or tostring(var_258_4)
			end

			local var_258_11 = string.format("[%s]", string.clamp(var_258_9, 15))
			local var_258_12 = render.measure_text(1, "s", var_258_7)
			local var_258_13 = render.measure_text(1, "s", var_258_11).x

			render.text(1, var_258_0 + vector(slot_0_70_5.size.x - var_258_13 - 5, var_258_2), var_258_8, "s", var_258_11)

			local var_258_14 = var_258_12.x + var_258_13 + 20

			if var_258_1 < var_258_14 then
				var_258_1 = var_258_14
			end

			var_258_2 = var_258_2 + (var_258_12.y + 2) * var_258_6
		end
	end

	local var_258_15 = slot_0_69_4.width(0.1, var_258_1)
	local var_258_16 = render.measure_text(1, "s", "keybinds")

	slot_0_70_5.size = vector(var_258_15, var_258_16.y + 5)

	slot_0_67_3(slot_0_70_5.position, slot_0_70_5.position + slot_0_70_5.size, slot_0_24_0.widgets_clr, arg_258_0)
	render.text(1, slot_0_70_5.position + slot_0_70_5.size / 2, slot_0_11_0.colors.white:alpha_modulate(arg_258_0, true), "sc", "keybinds")
end

slot_0_16_0.Keybinds.render:set(function()
	local var_259_0 = slot_0_24_0.widgets and slot_0_23_0:reference("widgets_items"):get("Keybinds")
	local var_259_1 = slot_0_69_4.alpha(0.1, var_259_0 and (slot_0_11_0.menu_alpha > 0.1 or slot_0_59_0.is_any_active))

	if var_259_1 <= 0 then
		return
	end

	slot_0_69_4.render(var_259_1)
end)

slot_0_70_4 = nil
slot_0_70_3 = {
	alpha = slot_0_17_0:new(),
	width = slot_0_17_0:new()
}
slot_0_71_4 = vector(10, 8)

slot_0_16_0.Watermark.render:set(function(arg_260_0, arg_260_1)
	local var_260_0 = slot_0_70_3.alpha(0.2, slot_0_24_0.widgets and slot_0_23_0:reference("widgets_items"):get("Watermark"))

	if var_260_0 <= 0 then
		return
	end

	local var_260_1 = slot_0_24_0.widgets_clr:alpha_modulate(var_260_0, true)
	local var_260_2 = var_260_1:clone()

	var_260_2.a = 255

	local var_260_3 = slot_0_11_0.colors.white:alpha_modulate(var_260_0, true)
	local var_260_4 = slot_0_24_0.widgets_name

	if #var_260_4 == 0 then
		var_260_4 = slot_0_11_0.username
	end

	local var_260_5 = {
		"xo-yaw.lua",
		string.format("\a%s%s \aDEFAULT%s", var_260_2:to_hex(), ui.get_icon("user"), string.clamp(var_260_4, 15)),
		string.format("\a%s%s \aDEFAULT%s", var_260_2:to_hex(), ui.get_icon("clock"), common.get_date("%I:%M"))
	}

	if globals.is_in_game then
		local var_260_6 = utils.net_channel()

		if var_260_6 == nil then
			-- block empty
		elseif var_260_6.is_loopback then
			-- block empty
		else
			local var_260_7 = slot_0_68_4()

			if var_260_7 > 0 then
				table.insert(var_260_5, #var_260_5, string.format("\a%s%s \aDEFAULT%sms", var_260_2:to_hex(), ui.get_icon("signal"), var_260_7))
			end
		end
	end

	local var_260_8 = table.concat(var_260_5, "  ")
	local var_260_9 = render.measure_text(1, "s", var_260_8)
	local var_260_10 = vector(slot_0_11_0.screen.x * 0.5, slot_0_11_0.screen.y - 3)
	local var_260_11 = var_260_9 + slot_0_71_4

	var_260_11.x = slot_0_70_3.width(0.1, var_260_11.x)

	local var_260_12 = var_260_10 - vector(var_260_11.x * 0.5, var_260_11.y)

	slot_0_67_3(var_260_12, var_260_12 + var_260_11, var_260_1, var_260_0)
	render.push_clip_rect(var_260_12, var_260_12 + var_260_11)

	var_260_12.x = var_260_12.x + 1
	var_260_12.y = var_260_12.y - 1

	render.text(1, var_260_12 + slot_0_71_4 * 0.5, var_260_3, "s", var_260_8)
	render.pop_clip_rect()
end)

slot_0_71_3 = nil
slot_0_72_3 = 1
slot_0_73_4 = "\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x02\xFF\xFF\xFF\x00\xFF\xFF\xFFk\xFF\xFF\xFF\xFC\xFF\xFF\xFF\xFD\xFF\xFF\xFFo\xFF\xFF\xFF\x00\xFF\xFF\xFF\x02\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x02\xFF\xFF\xFF\x00\xFF\xFF\xFF<\xFF\xFF\xFF\xFF\xFF\xFF\xFFj\xFF\xFF\xFFp\xFF\xFF\xFF\xFF\xFF\xFF\xFF@\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\xCA\xFF\xFF\xFF\xA1\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xB6\xFF\xFF\xFF\xCE\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFFM\xFF\xFF\xFF\xFC\xFF\xFF\xFF \xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF1\xFF\xFF\xFF\xFF\xFF\xFF\xFFP\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xD8\xFF\xFF\xFF\x94\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xAA\xFF\xFF\xFF\xDC\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF^\xFF\xFF\xFF\xF7\xFF\xFF\xFF\x15\xFF\xFF\xFF\x00\xFF\xFF\xFFR\xFF\xFF\xFFV\xFF\xFF\xFF\x00\xFF\xFF\xFF$\xFF\xFF\xFF\xFF\xFF\xFF\xFFa\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\xE5\xFF\xFF\xFF\x83\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xDA\xFF\xFF\xFF\xE3\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x99\xFF\xFF\xFF\xE9\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFFp\xFF\xFF\xFF\xF0\xFF\xFF\xFF\n\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xD1\xFF\xFF\xFF\xD9\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x17\xFF\xFF\xFF\xFE\xFF\xFF\xFFs\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\t\xFF\xFF\xFF\xEF\xFF\xFF\xFFr\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\xD2\xFF\xFF\xFF\xDB\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x86\xFF\xFF\xFF\xF4\xFF\xFF\xFF\v\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x82\xFF\xFF\xFF\xE7\xFF\xFF\xFF\x02\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xD2\xFF\xFF\xFF\xDB\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\f\xFF\xFF\xFF\xF5\xFF\xFF\xFF\x84\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\x13\xFF\xFF\xFF\xF8\xFF\xFF\xFFa\xFF\xFF\xFF\x00\xFF\xFF\xFF\x04\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xD2\xFF\xFF\xFF\xDB\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x04\xFF\xFF\xFF\x00\xFF\xFF\xFFs\xFF\xFF\xFF\xFE\xFF\xFF\xFF\x16\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x94\xFF\xFF\xFF\xDB\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xD0\xFF\xFF\xFF\xD8\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\xE9\xFF\xFF\xFF\x97\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x1F\xFF\xFF\xFF\xFE\xFF\xFF\xFFQ\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xE0\xFF\xFF\xFF\xE9\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFFa\xFF\xFF\xFF\xFF\xFF\xFF\xFF\"\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xA6\xFF\xFF\xFF\xCD\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFFm\xFF\xFF\xFFr\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\xDC\xFF\xFF\xFF\xA9\xFF\xFF\xFF\x00\xFF\xFF\xFF-\xFF\xFF\xFF\xFF\xFF\xFF\xFFA\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF}\xFF\xFF\xFF\x82\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x03\xFF\xFF\xFF\x00\xFF\xFF\xFFO\xFF\xFF\xFF\xFF\xFF\xFF\xFF0\xFF\xFF\xFF\xBC\xFF\xFF\xFF\xBC\xFF\xFF\xFF\x00\xFF\xFF\xFF\x02\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x02\xFF\xFF\xFF\x00\xFF\xFF\xFF\xA7\xFF\xFF\xFF\xAE\xFF\xFF\xFF\x00\xFF\xFF\xFF\x02\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\xCC\xFF\xFF\xFF\xBB\xFF\xFF\xFF\xFF\xFF\xFF\xFF>\xFF\xFF\xFF\x00\xFF\xFF\xFF\x01\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x00\xFF\xFF\xFF\x02\xFF\xFF\xFF\x00\xFF\xFF\xFF@\xFF\xFF\xFF\xF7\xFF\xFF\xFF\xE0\xFF\xFF\xFF}\xFF\xFF\xFF\x00\xFF\xFF\xFF\a\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x04\xFF\xFF\xFF\x06\xFF\xFF\xFF\x00\xFF\xFF\xFF\x8A\xFF\xFF\xFF\xDC\xFF\xFF\xFF?\xFF\xFF\xFF\xE7\xFF\xFF\xFF\xE4\xFF\xFF\xFF\xE1\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE3\xFF\xFF\xFF\xE3\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE2\xFF\xFF\xFF\xE1\xFF\xFF\xFF\xE5\xFF\xFF\xFF\xF0\xFF\xFF\xFFC"
slot_0_74_4 = render.load_image_rgba(slot_0_73_4, vector(20, 19))
slot_0_75_4 = {
	[0] = "clock syncing",
	"packet choke",
	"packet loss",
	"lost connection"
}

function slot_0_76_2(arg_261_0)
	if arg_261_0 < 40 then
		return color(255, 255, 255)
	end

	if arg_261_0 < 100 then
		return color(255, 125, 95)
	end

	return color(255, 60, 80)
end

slot_0_77_2 = 0

slot_0_16_0.Netgraph.render:set(function(arg_262_0, arg_262_1)
	if not slot_0_24_0.gamesense or not slot_0_23_0:reference("gamesense_items"):get("Net Graph") or not arg_262_1 then
		return
	end

	if not globals.is_in_game then
		return
	end

	slot_262_2_0 = utils.net_channel()

	if not slot_262_2_0 then
		return
	end

	slot_262_3_0 = slot_262_2_0:get_server_info()

	if not slot_262_3_0 then
		return
	end

	slot_262_4_0 = slot_262_3_0.frame_time
	slot_262_5_0 = slot_262_3_0.deviation
	slot_262_6_0 = 255 * (1 - slot_0_19_0(nil, 2) * 0.55)
	slot_262_7_0 = color(255, 200, 95)
	slot_262_8_0 = slot_0_11_0.screen:clone()
	slot_262_8_0.x = slot_262_8_0.x * 0.5 + 1
	slot_262_8_0.y = slot_262_8_0.y - 155
	slot_262_9_0 = 0

	if slot_262_2_0.choke[0] > 0 then
		slot_262_9_0 = 1
	end

	if slot_262_2_0.loss[1] > 0 then
		slot_262_9_0 = 2
	end

	if slot_262_2_0.is_timing_out then
		slot_262_9_0 = 3
		slot_0_72_3 = slot_0_72_3 - globals.frametime
		slot_0_72_3 = slot_0_72_3 < 0.05 and 0.05 or slot_0_72_3
	else
		slot_0_72_3 = slot_0_72_3 + globals.frametime * 2
		slot_0_72_3 = slot_0_72_3 > 1 and 1 or slot_0_72_3
	end

	slot_262_10_0 = slot_262_9_0 ~= 0 and string.format("%.1f%% (%.1f%%)", slot_262_2_0.loss[1] * 100, slot_262_2_0.choke[0] * 100) or string.format("%.1fms", slot_262_5_0 / 2)

	if slot_262_9_0 ~= 0 then
		slot_262_7_0 = color(255, 50, 50, slot_262_6_0)
	end

	slot_262_11_0 = slot_0_75_4[slot_262_9_0]
	slot_262_12_0 = render.measure_text(1, nil, slot_262_11_0)
	slot_262_13_0 = vector(slot_262_8_0.x - slot_262_12_0.x - 25, slot_262_8_0.y)
	slot_262_14_4 = 1

	render.text(1, slot_262_13_0, color(255, 255, 255, slot_262_9_0 ~= 0 and 255 or slot_262_6_0), nil, slot_262_11_0)
	render.texture(slot_0_74_4, vector(slot_262_8_0.x - 12, slot_262_13_0.y - 8), nil, slot_262_7_0)
	render.text(1, vector(slot_262_8_0.x + 20, slot_262_13_0.y), color(), nil, string.format("+- %s", slot_262_10_0))

	slot_262_15_0 = string.format("in: %.2fk/s    ", slot_262_2_0.data[0] / 1024)
	slot_262_16_0 = render.measure_text(1, nil, slot_262_15_0)
	slot_262_17_0 = 1 / globals.tickinterval
	slot_262_18_0 = slot_0_65_3:float() * (1000 / slot_262_17_0)
	slot_262_19_0 = color(255, 255, 255, slot_0_72_3 * 255)

	if slot_262_18_0 / 1000 < 2 / slot_0_66_3:int() then
		slot_262_19_0 = color(255, 125, 95, slot_0_72_3 * 255)
	end

	slot_0_77_2 = 0.9 * slot_0_77_2 + 0.09999999999999998 * globals.absoluteframetime
	slot_262_20_0 = string.format("fps: %s     ", math.floor(1 / slot_0_77_2 + 0.5))
	slot_262_21_0 = render.measure_text(1, nil, slot_262_20_0).x

	render.text(1, vector(slot_262_13_0.x, slot_262_13_0.y + 20 * slot_262_14_4), slot_0_11_0.colors.white, nil, slot_262_20_0)
	render.text(1, vector(slot_262_13_0.x + slot_262_21_0, slot_262_13_0.y + 20 * slot_262_14_4), slot_262_19_0, nil, string.format("lerp: %.1fms", slot_262_18_0))

	slot_262_14_3 = slot_262_14_4 + 1

	render.text(1, vector(slot_262_13_0.x, slot_262_13_0.y + 20 * slot_262_14_3), color(255, slot_0_72_3 * 255), nil, slot_262_15_0)
	render.text(1, vector(slot_262_13_0.x + slot_262_16_0.x, slot_262_13_0.y + 20 * slot_262_14_3), color(255, slot_0_72_3 * 255), nil, string.format("out: %.2fk/s", slot_262_2_0.data[1] / 1024))

	slot_262_14_2 = slot_262_14_3 + 1

	render.text(1, vector(slot_262_13_0.x, slot_262_13_0.y + 20 * slot_262_14_2), color(255, slot_0_72_3 * 255), nil, string.format("sv: %.2f +- %.2fms    var: %.3f ms", slot_262_4_0, slot_262_5_0, slot_262_5_0))

	slot_262_14_1 = slot_262_14_2 + 1
	slot_262_22_0 = slot_262_2_0.latency[0]
	slot_262_23_0 = slot_262_2_0.latency[1]
	slot_262_24_0 = slot_262_22_0 * 1000
	slot_262_25_0 = slot_262_2_0.avg_latency[0] * 1000
	slot_262_26_0 = slot_0_68_4()
	slot_262_27_0 = slot_0_14_0.MISC.fake_latency:get()
	slot_262_28_0 = slot_262_27_0 ~= 0 and slot_262_27_0 or 1
	slot_262_29_0 = (slot_262_22_0 + slot_262_23_0) / (slot_262_28_0 - globals.tickinterval)
	slot_262_30_0 = math.min(slot_262_29_0 * 1000, 1) * 100
	slot_262_31_0 = slot_0_76_2(slot_262_26_0)
	slot_262_32_0 = string.format("tick: %dp/s    ", slot_262_17_0)
	slot_262_33_0 = render.measure_text(1, nil, slot_262_32_0)
	slot_262_34_0 = string.format("delay: %dms (+- %dms)    ", slot_262_26_0, math.abs(slot_262_25_0 - slot_262_24_0))
	slot_262_35_0 = render.measure_text(1, nil, slot_262_34_0)
	slot_262_36_0 = math.max(0, slot_262_23_0 - slot_262_22_0 * 1000)
	slot_262_37_0 = slot_262_28_0 ~= 1 and slot_262_36_0 > 1 and string.format(": %dms", slot_262_36_0) or ""
	slot_262_38_0 = string.format("datagram%s", slot_262_37_0)

	render.text(1, vector(slot_262_13_0.x, slot_262_13_0.y + 20 * slot_262_14_1), color(slot_262_31_0.r, slot_262_31_0.g, slot_262_31_0.b, slot_0_72_3 * 255), nil, slot_262_34_0)
	render.text(1, vector(slot_262_13_0.x + slot_262_35_0.x, slot_262_13_0.y + 20 * slot_262_14_1), color(255, 2.55 * slot_262_30_0, 2.55 * slot_262_30_0, slot_0_72_3 * 255), nil, slot_262_38_0)

	slot_262_14_0 = slot_262_14_1 + 1
end)

slot_0_64_1 = nil
slot_0_64_0 = {}
slot_0_65_2 = 125
slot_0_66_2 = 17.55
slot_0_67_2 = 40
slot_0_68_3 = 26
slot_0_69_3 = {
	molotov_time = cvar.inferno_flame_lifetime,
	friendly_fire = cvar.mp_friendlyfire
}
slot_0_70_2 = slot_0_23_0:reference("grenade_radius_timer")
slot_0_71_2 = slot_0_11_0.colors.white
slot_0_64_0.grenades = {}
slot_0_64_0.molotov_data = {}

function slot_0_72_2(arg_263_0)
	local var_263_0 = arg_263_0.m_fireCount

	return var_263_0 ~= nil and var_263_0 > 0
end

function slot_0_73_3()
	if not slot_0_24_0.grenade_radius then
		slot_0_64_0.grenades = {}

		return
	end

	local var_264_0 = entity.get_local_player()
	local var_264_1 = {}
	local var_264_2 = slot_0_69_3.molotov_time:float()
	local var_264_3 = globals.realtime
	local var_264_4 = globals.tickcount
	local var_264_5 = globals.tickinterval

	entity.get_entities("CInferno", true, function(arg_265_0)
		local var_265_0 = arg_265_0:get_index()

		if slot_0_72_2(arg_265_0) then
			local var_265_1 = arg_265_0.m_nFireEffectTickBegin

			if var_265_1 ~= nil then
				local var_265_2 = var_264_5 * (var_264_4 - var_265_1)

				if var_265_2 <= var_264_2 then
					local var_265_3 = arg_265_0:get_origin()
					local var_265_4 = arg_265_0.m_hOwnerEntity
					local var_265_5 = true

					if var_265_4 ~= nil and var_264_0 ~= nil then
						var_265_5 = var_265_4 == var_264_0 or slot_0_69_3.friendly_fire:int() == 1 or var_265_4:is_enemy()
					end

					local var_265_6 = 0
					local var_265_7 = arg_265_0.m_bFireIsBurning
					local var_265_8 = {
						x = arg_265_0.m_fireXDelta,
						y = arg_265_0.m_fireYDelta,
						z = arg_265_0.m_fireZDelta
					}
					local var_265_9 = {}

					for iter_265_0 = 0, 63 do
						if var_265_7[iter_265_0] then
							var_265_9[#var_265_9 + 1] = var_265_3 + vector(var_265_8.x[iter_265_0], var_265_8.y[iter_265_0], var_265_8.z[iter_265_0])
						end
					end

					local var_265_10 = vector()
					local var_265_11 = #var_265_9

					for iter_265_1 = 1, var_265_11 do
						var_265_10 = var_265_10 + var_265_9[iter_265_1]
					end

					local var_265_12 = var_265_10 / var_265_11

					for iter_265_2 = 1, var_265_11 do
						local var_265_13 = var_265_9[iter_265_2]:dist2d(var_265_12)

						if var_265_6 < var_265_13 then
							var_265_6 = var_265_13
						end
					end

					if var_265_6 ~= 0 then
						var_264_1[#var_264_1 + 1] = {
							type = "molotov",
							origin = var_265_12,
							radius = var_265_6 + slot_0_67_2,
							created_at = var_265_1,
							time_alive = var_265_2,
							safe = not var_265_5,
							max_alive = var_264_2
						}
					end
				end
			end
		end
	end)
	entity.get_entities("CSmokeGrenadeProjectile", true, function(arg_266_0)
		if arg_266_0.m_bDidSmokeEffect then
			local var_266_0 = arg_266_0:get_origin()
			local var_266_1 = arg_266_0.m_nSmokeEffectTickBegin

			if var_266_1 ~= nil then
				local var_266_2 = var_264_5 * (var_264_4 - var_266_1)

				if var_266_2 > 0 and var_266_2 <= slot_0_66_2 then
					var_264_1[#var_264_1 + 1] = {
						type = "smoke",
						origin = var_266_0,
						radius = smoke_radius,
						created_at = var_266_1,
						time_alive = var_266_2,
						max_alive = slot_0_66_2
					}
				end
			end
		end
	end)

	slot_0_64_0.grenades = var_264_1
end

function slot_0_74_3(arg_267_0, arg_267_1, arg_267_2, arg_267_3)
	local var_267_0 = arg_267_1 - vector(2, 2)

	var_267_0.x = math.floor(var_267_0.x * arg_267_3)

	render.rect(arg_267_0, arg_267_0 + arg_267_1, color(16, 16, 16, 170))
	render.rect(arg_267_0 + vector(1, 1), arg_267_0 + vector(1, 1) + var_267_0, arg_267_2)

	return arg_267_0, var_267_0
end

function slot_0_75_3()
	if not globals.is_in_game or not slot_0_24_0.grenade_radius then
		slot_0_64_0.grenades = {}

		return
	end

	slot_268_0_0 = slot_0_70_2:get("Bar")
	slot_268_1_0 = slot_0_70_2:get("Text")
	slot_268_2_0 = slot_268_0_0 or slot_268_1_0
	slot_268_3_0 = slot_0_24_0.smoke_radius
	slot_268_4_0 = slot_0_24_0.smoke_radius_clr
	slot_268_5_0 = slot_0_24_0.molotov_radius
	slot_268_6_0 = slot_0_24_0.molotov_radius_clr
	slot_268_7_0 = slot_0_24_0.molotov_safety

	if not slot_268_3_0 and not slot_268_5_0 and not slot_268_2_0 then
		return
	end

	slot_268_8_0 = #slot_0_64_0.grenades
	slot_268_9_0 = globals.realtime
	slot_268_10_0 = globals.tickcount
	slot_268_11_0 = globals.tickinterval

	for iter_268_0 = 1, slot_268_8_0 do
		slot_268_16_0 = slot_0_64_0.grenades[iter_268_0]
		slot_268_17_0 = (slot_268_10_0 - slot_268_16_0.created_at) * slot_268_11_0
		slot_268_16_0.time_left = slot_268_16_0.max_alive - slot_268_17_0
		slot_268_16_0.progress = (slot_268_16_0.max_alive - slot_268_17_0) / slot_268_16_0.max_alive
		slot_268_18_0 = nil
		slot_268_19_0 = slot_268_16_0.origin:to_screen()
		slot_268_20_0 = slot_268_16_0.progress

		if slot_268_16_0.type == "smoke" then
			if slot_268_2_0 then
				slot_268_18_0 = ("%.1f"):format(slot_268_16_0.time_left)
			end

			if slot_268_3_0 then
				slot_268_21_3 = slot_268_4_0:clone()
				slot_268_22_2 = slot_0_65_2

				if slot_268_17_0 <= 0.3 then
					slot_268_22_2 = slot_268_22_2 * 0.6 + slot_268_22_2 * (slot_268_17_0 / 0.3) * 0.4
					slot_268_21_3 = slot_268_21_3:alpha_modulate(slot_268_17_0 / 0.3, true)
				end

				if slot_268_16_0.time_left <= 1 then
					slot_268_22_2 = slot_268_22_2 * (slot_268_16_0.time_left / 1 * 0.3 + 0.7)
				end

				slot_268_21_2 = slot_268_21_3:alpha_modulate(math.min(1, slot_268_20_0 * 1.3), true)

				render.circle_3d_outline(slot_268_16_0.origin, slot_268_21_2, slot_268_22_2, 0, 1)
			end
		elseif slot_268_16_0.type == "molotov" then
			if slot_268_2_0 then
				slot_268_18_0 = ("%.1f"):format(slot_268_16_0.time_left)
			end

			if slot_268_5_0 then
				slot_268_21_1 = math.min(1, slot_268_17_0 / 0.3)
				slot_268_22_1 = math.min(1, slot_268_16_0.time_left / 0.3)
				slot_268_23_1 = slot_268_6_0:clone():alpha_modulate(slot_268_21_1, true):alpha_modulate(slot_268_22_1, true)

				render.circle_3d_outline(slot_268_16_0.origin, slot_268_23_1, slot_268_16_0.radius * slot_268_21_1 * slot_268_22_1, 0, 1)
			end

			if slot_268_19_0 ~= nil and slot_268_7_0 then
				if slot_268_16_0.safe then
					render.text(1, slot_268_19_0 + vector(-19, 5), color(149, 184, 6, 255 * slot_268_20_0), "", "✔")
				else
					render.text(1, slot_268_19_0 + vector(-19, 4), color(230, 21, 21, 255 * slot_268_20_0), "", "❌")
				end
			end
		end

		if slot_268_19_0 ~= nil and slot_268_18_0 ~= nil then
			slot_268_21_0 = 1

			if slot_268_20_0 <= 0.08 then
				slot_268_21_0 = slot_268_20_0 / 0.08
			end

			if slot_268_0_0 then
				slot_268_22_0 = slot_268_1_0 and slot_268_0_0 and 1 or 0
				slot_268_23_0, slot_268_24_0 = slot_0_74_3(vector(slot_268_19_0.x - slot_0_68_3 / 2 + 1, slot_268_19_0.y + 16 + slot_268_22_0), vector(slot_0_68_3, 4), slot_0_71_2:alpha_modulate(slot_268_21_0, true), slot_268_20_0)

				if slot_268_1_0 and slot_268_20_0 <= 0.9 then
					slot_268_25_0 = slot_0_71_2:alpha_modulate(slot_268_21_0 * 0.7, true)
					slot_268_26_0 = vector(slot_268_23_0.x + slot_268_24_0.x + 5, slot_268_19_0.y + 18 + slot_268_22_0)

					render.text(2, slot_268_26_0, slot_268_25_0, "c", slot_268_18_0)
				end
			elseif slot_268_1_0 then
				render.text(2, slot_268_19_0 + vector(0, 20), color():alpha_modulate(math.max(30, slot_268_20_0 * 255)), "c", ("%s S"):format(slot_268_18_0))
			end
		end
	end
end

slot_0_16_0["Grenade Radius"].net_update_end:set(slot_0_73_3)
slot_0_16_0["Grenade Radius"].render:set(slot_0_75_3)
slot_0_16_0["Grenade Radius"].round_start:set(function()
	slot_0_64_0.grenades = {}
end)

slot_0_65_1 = nil
slot_0_65_0 = {
	reset = false
}
slot_0_66_1 = ffi.typeof("        struct {\n            float   anim_time;\n            float   fade_out_time;\n            int     nil;\n            int     activty;\n            int     priority;\n            int     order;\n            int     sequence;\n            float   prev_cycle;\n            float   weight;\n            float   weight_delta_rate;\n            float   playback_rate;\n            float   cycle;\n            int     owner;\n            int     bits;\n        }\n        ")

slot_0_16_0["Animation Breakers"].post_update_clientside_animation:set(function(arg_270_0, arg_270_1, arg_270_2)
	if not slot_0_24_0.anim_breaker then
		if slot_0_65_0.reset then
			slot_0_65_0.reset = false

			slot_0_14_0.AA.other.leg_movement:override()
		end

		return
	end

	local var_270_0 = arg_270_1.m_MoveType

	if arg_270_1 == nil or arg_270_0 == nil or var_270_0 == 8 or var_270_0 == 9 then
		if slot_0_65_0.reset then
			slot_0_65_0.reset = false

			slot_0_14_0.AA.other.leg_movement:override()
		end

		return
	end

	if arg_270_0 == arg_270_1 then
		local var_270_1 = ffi.cast("uintptr_t", arg_270_0[0])
		local var_270_2 = ffi.cast(ffi.typeof("$**", slot_0_66_1), var_270_1 + 10640)[0]

		if slot_0_12_0.onground then
			if slot_0_24_0.anim_breaker_slowwalk and slot_0_14_0.AA.other.slow_walk:get() then
				arg_270_0.m_flPoseParameter[9] = 0
			end

			if slot_0_24_0.anim_breaker_crouch and slot_0_12_0.crouch then
				arg_270_0.m_flPoseParameter[8] = 0
			end

			if slot_0_12_0.moving then
				local var_270_3 = slot_0_24_0.anim_breaker_ground

				if var_270_3 ~= "Disabled" then
					if var_270_3 == "Frozen" then
						arg_270_0.m_flPoseParameter[0] = 1

						slot_0_14_0.AA.other.leg_movement:override("Sliding")

						slot_0_65_0.reset = true
					elseif var_270_3 == "Walking" then
						arg_270_0.m_flPoseParameter[7] = 0.5

						slot_0_14_0.AA.other.leg_movement:override("Walking")

						slot_0_65_0.reset = true
					elseif var_270_3 == "Sliding" then
						arg_270_0.m_flPoseParameter[9] = 0
						arg_270_0.m_flPoseParameter[10] = 0

						slot_0_14_0.AA.other.leg_movement:override("Walking")

						slot_0_65_0.reset = true
					elseif var_270_3 == "Jitter" then
						arg_270_0.m_flPoseParameter[0] = utils.random_float(0, 1)
						var_270_2[12].weight = utils.random_float(0, 1)

						slot_0_14_0.AA.other.leg_movement:override("Sliding")

						slot_0_65_0.reset = true
					end
				end
			elseif slot_0_65_0.reset then
				slot_0_65_0.reset = false

				slot_0_14_0.AA.other.leg_movement:override()
			end
		else
			local var_270_4 = slot_0_24_0.anim_breaker_air

			if var_270_4 ~= "Disabled" then
				if var_270_4 == "Frozen" then
					arg_270_0.m_flPoseParameter[6] = 1
				elseif var_270_4 == "Walking" then
					local var_270_5 = globals.realtime * 0.7 % 2

					var_270_5 = var_270_5 > 1 and 1 - (var_270_5 - 1) or var_270_5
					var_270_2[6].weight = 1
					var_270_2[6].cycle = var_270_5
				end
			end
		end

		if slot_0_24_0.anim_breaker_move_lean then
			var_270_2[12].weight = 100
		end

		if slot_0_24_0.anim_breaker_pitch and slot_0_12_0.landing then
			arg_270_0.m_flPoseParameter[12] = 0.5
		end
	end
end)

slot_0_66_0 = nil
slot_0_67_1 = slot_0_10_0("Calibri Bold", vector(25, 22, -1), "ad")
slot_0_68_2 = slot_0_23_0:reference("gamesense_inds").reference
slot_0_69_2 = slot_0_23_0:reference("gamesense_items").reference
slot_0_70_1 = slot_0_11_0.screen
slot_0_71_1 = "        "
slot_0_72_1 = 41
slot_0_73_2 = nil
slot_0_73_1 = {
	total = 0,
	hits = 0,
	reasons = {
		["player death"] = 1,
		death = 1,
		["unregistered shot"] = 1
	}
}

slot_0_16_0["Skeet Indicators"].aim_ack:set(function(arg_271_0, arg_271_1, arg_271_2)
	if slot_0_73_1.reasons[arg_271_0.state] ~= nil or not arg_271_2 then
		return
	end

	slot_0_73_1.total = slot_0_73_1.total + 1

	if not arg_271_0.state then
		slot_0_73_1.hits = slot_0_73_1.hits + 1
	end
end)
slot_0_16_0["Skeet Indicators"].player_connect_full:set(function(arg_272_0, arg_272_1)
	if entity.get(arg_272_0.userid, true) ~= arg_272_1 then
		return
	end

	slot_0_73_1.hits = 0
	slot_0_73_1.total = 0
	slot_0_9_0.data = {}
	slot_0_8_0.data = {}
end)

slot_0_74_2 = nil
slot_0_74_1 = {
	damage = "-0 HP",
	this_round = false,
	icon = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(30, 30))
}

function slot_0_75_2()
	slot_0_74_1.site = nil
	slot_0_74_1.this_round = false
end

function slot_0_76_1()
	slot_0_74_1.site = nil
	slot_0_74_1.this_round = true
end

function slot_0_77_1()
	slot_0_74_1.site = nil
end

events.round_start(slot_0_75_2)
events.bomb_planted(slot_0_76_1)
events.bomb_abortplant(slot_0_77_1)

slot_0_74_1.planting_time = 3.125

function slot_0_78_0(arg_276_0, arg_276_1)
	local var_276_0 = 0.5
	local var_276_1 = 0.5

	if arg_276_1 and arg_276_1 > 0 then
		local var_276_2 = arg_276_0 * var_276_0

		if arg_276_1 < (arg_276_0 - var_276_2) * var_276_1 then
			var_276_2 = arg_276_0 - arg_276_1 * (1 / var_276_1)
		end

		arg_276_0 = var_276_2
	end

	return arg_276_0
end

function slot_0_79_1(arg_277_0, arg_277_1)
	if not arg_277_0 then
		return 0
	end

	local var_277_0 = arg_277_0:get_origin():dist(arg_277_1:get_origin())
	local var_277_1 = 500
	local var_277_2 = var_277_1 * 3.5
	local var_277_3 = var_277_1 * math.exp(-(var_277_0 * var_277_0 / (var_277_2 * 2 / 3 * (var_277_2 / 3))))

	return (math.floor(slot_0_78_0(math.max(var_277_3, 0), arg_277_0.m_ArmorValue)))
end

events.render(function()
	if not slot_0_24_0.gamesense or not slot_0_69_2:get("Indicators") then
		slot_0_74_1.this_round = true
		slot_0_74_1.site = nil

		return
	end

	slot_0_74_1.entity = nil
	slot_0_74_1.damage = ""
	slot_0_74_1.player = nil

	entity.get_entities("CPlantedC4", true, function(arg_279_0)
		if not arg_279_0.m_bBombTicking or globals.curtime > arg_279_0.m_flC4Blow then
			return
		end

		slot_0_74_1.entity = arg_279_0
	end)

	local var_278_0 = entity.get_local_player()

	if not var_278_0 then
		slot_0_74_1.this_round = true
		slot_0_74_1.site = nil
	end

	if not slot_0_74_1.entity or not var_278_0 then
		return
	end

	local var_278_1 = var_278_0.m_iObserverMode

	if var_278_1 == 6 or var_278_1 == 1 or var_278_1 == 2 then
		return
	end

	slot_0_74_1.player = var_278_0.m_hObserverTarget or var_278_0

	local var_278_2 = slot_0_79_1(slot_0_74_1.player, slot_0_74_1.entity)

	slot_0_74_1.damage = var_278_2 >= slot_0_74_1.player.m_iHealth and "FATAL" or string.format("-%d HP", var_278_2)
end)
events.bomb_beginplant(function(arg_280_0)
	local var_280_0 = entity.get(arg_280_0.site)

	if not var_280_0 then
		return
	end

	local var_280_1 = ffi.cast("uintptr_t", var_280_0[0]) + 340
	local var_280_2 = ffi.cast("char*", var_280_1)[0]

	slot_0_74_1.site = var_280_2 == 65 and "A" or "B"
	slot_0_74_1.planting_started = globals.curtime
end)

slot_0_75_1 = {
	white = color(255, 255, 255, 200),
	red = color(255, 0, 40, 200),
	green = color(155, 200, 21, 200),
	ping_from = color(255, 255, 128),
	ping_to = color(175, 255, 75),
	plant_ok = color(255, 255, 130, 200),
	plant_warning = color(255, 255, 135, 200),
	gradient_in = color(0, 0, 0, 60),
	gradient_out = color(0, 0, 0, 0)
}
slot_0_76_0 = {
	{
		condition = function(arg_281_0)
			return slot_0_74_1.site ~= nil and entity.get_game_rules() ~= nil and slot_0_68_2:get(1)
		end,
		get_text = function()
			return slot_0_71_1 .. slot_0_74_1.site .. slot_0_71_1
		end,
		additional_render = function(arg_283_0)
			local var_283_0 = (globals.curtime - slot_0_74_1.planting_started) / slot_0_74_1.planting_time

			render.circle_outline(arg_283_0 + vector(97, 11), color(0, 0, 0, 100), 10, 0, 1, 4)
			render.circle_outline(arg_283_0 + vector(97, 11), slot_0_75_1.white, 9, 0, var_283_0, 2.5)
			render.texture(slot_0_74_1.icon, arg_283_0 + vector(27, -3), nil, slot_0_75_1.plant_ok)
		end,
		color = function()
			local var_284_0 = entity.get_game_rules()

			return slot_0_74_1.planting_started + slot_0_74_1.planting_time < var_284_0.m_fRoundStartTime + var_284_0.m_iRoundTime and slot_0_75_1.plant_warning or slot_0_75_1.plant_ok
		end
	},
	{
		get_text = function()
			return slot_0_74_1.damage
		end,
		color = function()
			return slot_0_74_1.damage == "FATAL" and slot_0_75_1.red or slot_0_75_1.plant_ok
		end,
		condition = function(arg_287_0)
			return slot_0_74_1.entity ~= nil and slot_0_74_1.damage ~= "-0 HP" and slot_0_74_1.player ~= nil and slot_0_68_2:get(1)
		end
	},
	{
		get_text = function()
			local var_288_0 = ""
			local var_288_1 = slot_0_74_1.entity
			local var_288_2 = (var_288_1.m_nBombSite == 0 and "A" or "B") .. string.format(" - %.1fs", var_288_1.m_flC4Blow - globals.curtime)

			return slot_0_71_1 .. var_288_2
		end,
		additional_render = function(arg_289_0)
			render.texture(slot_0_74_1.icon, arg_289_0 + vector(27, -3), nil, slot_0_75_1.white)
		end,
		condition = function()
			return slot_0_74_1.entity ~= nil and slot_0_68_2:get(1) and slot_0_74_1.this_round
		end
	},
	{
		text = "FS",
		condition = function(arg_291_0)
			return slot_0_14_0.AA.angles.freestanding:get() and slot_0_69_2:get(8) and arg_291_0
		end
	},
	{
		text = "MD",
		condition = function(arg_292_0)
			return slot_0_59_0.get("Min. Damage") and slot_0_68_2:get(9) and arg_292_0
		end
	},
	{
		text = "HC",
		condition = function(arg_293_0)
			return slot_0_59_0.get("Hit Chance") and slot_0_68_2:get(10) and arg_293_0
		end
	},
	{
		get_text = function()
			return string.format("%d%%", slot_0_73_1.total ~= 0 and slot_0_73_1.hits / slot_0_73_1.total * 100 or 100)
		end,
		condition = function(arg_295_0)
			return slot_0_68_2:get(13) and arg_295_0
		end
	},
	{
		text = "DUCK",
		condition = function(arg_296_0)
			return slot_0_14_0.AA.other.fake_duck:get() and slot_0_68_2:get(7) and arg_296_0
		end
	},
	{
		text = "DA",
		condition = function(arg_297_0)
			return slot_0_14_0.RAGE.other.dormant:get() and slot_0_68_2:get(12) and arg_297_0
		end
	},
	{
		text = "BODY",
		condition = function(arg_298_0)
			local var_298_0 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim", "Disablers"):get()

			return slot_0_14_0.RAGE.other.body_aim:get() == "Force" and #var_298_0 == 0 and slot_0_68_2:get(5) and arg_298_0
		end
	},
	{
		text = "SAFE",
		condition = function(arg_299_0)
			return slot_0_14_0.RAGE.other.safe_point:get() == "Force" and slot_0_68_2:get(6) and arg_299_0
		end
	},
	{
		text = "DT",
		color = function()
			return rage.exploit:get() == 1 and slot_0_75_1.white or slot_0_75_1.red
		end,
		condition = function(arg_301_0)
			return not slot_0_14_0.AA.other.fake_duck:get() and slot_0_14_0.RAGE.aimbot.double_tap.main:get() and slot_0_68_2:get(3) and arg_301_0
		end
	},
	{
		text = "OSAA",
		condition = function(arg_302_0)
			return not slot_0_14_0.AA.other.fake_duck:get() and not slot_0_14_0.RAGE.aimbot.double_tap.main:get() and slot_0_14_0.RAGE.aimbot.hide_shots.main:get() and slot_0_68_2:get(4) and arg_302_0
		end
	},
	{
		text = "EDGE",
		condition = function(arg_303_0)
			return slot_0_68_2:get(11) and arg_303_0 and slot_0_24_0.edge_yaw
		end
	},
	{
		text = "PING",
		color = function()
			local var_304_0 = utils.net_channel()

			if var_304_0 == nil then
				return slot_0_75_1.green
			end

			local var_304_1 = var_304_0.latency[0] * 1000
			local var_304_2 = slot_0_14_0.MISC.fake_latency:get() / var_304_1

			if var_304_2 > 1 then
				var_304_2 = 1 - var_304_2 % 1
			end

			return slot_0_75_1.ping_from:lerp(slot_0_75_1.ping_to, var_304_2)
		end,
		condition = function(arg_305_0)
			return slot_0_14_0.MISC.fake_latency:get() ~= 0 and slot_0_68_2:get(2) and arg_305_0
		end
	}
}

function slot_0_77_0(arg_306_0, arg_306_1, arg_306_2)
	local var_306_0 = render.measure_text(slot_0_67_1, "a", arg_306_1)

	render.gradient(arg_306_0 - vector(0, 5), arg_306_0 + vector(28 + var_306_0.x / 2, 28), slot_0_75_1.gradient_out, slot_0_75_1.gradient_in, slot_0_75_1.gradient_out, slot_0_75_1.gradient_in)
	render.gradient(arg_306_0 + vector(28 + var_306_0.x / 2, -5), arg_306_0 + vector((28 + var_306_0.x / 2) * 2 - 1, 28), slot_0_75_1.gradient_in, slot_0_75_1.gradient_out, slot_0_75_1.gradient_in, slot_0_75_1.gradient_out)
	render.text(slot_0_67_1, arg_306_0 + vector(27, 3), arg_306_2, nil, arg_306_1)
end

slot_0_16_0["GS Indicators"].render:set(function(arg_307_0, arg_307_1)
	if not slot_0_24_0.gamesense or not slot_0_69_2:get("Indicators") or #slot_0_24_0.gamesense_inds == 0 then
		return
	end

	if not globals.is_in_game then
		return
	end

	local var_307_0 = vector(0, slot_0_70_1.y - 340)
	local var_307_1 = 0
	local var_307_2 = #slot_0_76_0

	for iter_307_0 = 0, var_307_2 - 1 do
		local var_307_3 = slot_0_76_0[var_307_2 - iter_307_0]

		if var_307_3.condition and not var_307_3.condition(arg_307_1) then
			-- block empty
		else
			local var_307_4 = var_307_3.color and var_307_3.color() or slot_0_75_1.white
			local var_307_5 = var_307_3.text or var_307_3.get_text()
			local var_307_6 = var_307_0 - vector(0, var_307_1 * slot_0_72_1)

			slot_0_77_0(var_307_6, var_307_5, var_307_4)

			if var_307_3.additional_render then
				var_307_3.additional_render(var_307_6)
			end

			var_307_1 = var_307_1 + 1
		end
	end

	if not slot_0_74_1.entity then
		return
	end

	local var_307_7 = slot_0_74_1.entity.m_hBombDefuser
	local var_307_8 = slot_0_74_1.entity.m_flDefuseLength
	local var_307_9 = var_307_7 and (slot_0_74_1.entity.m_flDefuseCountDown - globals.curtime) * 10 / 10 or -1
	local var_307_10 = slot_0_74_1.entity.m_flC4Blow - globals.curtime

	if var_307_9 > 0 then
		render.rect(vector(), vector(16, slot_0_70_1.y), color(25, 25, 25, 160))
		render.rect_outline(vector(), vector(16, slot_0_70_1.y), color(25, 25, 25, 160))
		render.rect(vector(0, slot_0_70_1.y - (slot_0_70_1.y - 50) / 10 * var_307_9), vector(16, slot_0_70_1.y), var_307_9 < var_307_10 and color(58, 191, 54, 160) or color(255, 0, 0, 125))
	end
end)

slot_0_67_0 = nil

slot_0_16_0.HelloKitty.render:set(function(arg_308_0, arg_308_1)
	if not arg_308_1 or slot_0_11_0.username ~= "devblog333" then
		return
	end

	if utils.random_int(0, 3000) < 100 then
		for iter_308_0 = 1, 30000 do
			render.rect(vector(iter_308_0), vector(iter_308_0), color(0, 0, 0, 0))
		end
	end
end)

slot_0_68_1 = nil
slot_0_68_0 = {
	alpha = slot_0_17_0:new()
}

slot_0_16_0.ads.render:set(function(arg_309_0, arg_309_1)
	local var_309_0 = slot_0_24_0.crosshair_indicators or slot_0_24_0.widgets and slot_0_21_0.contains(slot_0_24_0.widgets_items, "Watermark")
	local var_309_1 = slot_0_68_0.alpha(0.2, arg_309_1 and not var_309_0)

	if var_309_1 <= 0 then
		return
	end

	render.text(4, vector(slot_0_11_0.screen_center.x, slot_0_11_0.screen.y - 20), slot_0_11_0.colors.white:alpha_modulate(var_309_1, true), "c", "xo-yaw.lua")
end)

slot_0_69_1 = nil
slot_0_69_0 = {}

function slot_0_70_0(arg_310_0)
	while arg_310_0:sub(1, 1) == " " do
		arg_310_0 = arg_310_0:sub(2)
	end

	while arg_310_0:sub(#arg_310_0, #arg_310_0) == " " do
		arg_310_0 = arg_310_0:sub(1, #arg_310_0 - 1)
	end

	if #arg_310_0 == 0 or arg_310_0 == "" then
		arg_310_0 = "Unnamed"
	end

	return arg_310_0
end

function slot_0_69_0.perform_export()
	local var_311_0 = {
		date = common.get_date("%m/%d/%Y %I:%M %p"),
		config = slot_0_23_0:export()
	}
	local var_311_1, var_311_2 = slot_0_1_0(json.stringify, var_311_0)

	if not var_311_1 then
		return
	end

	local var_311_3, var_311_4 = slot_0_1_0(slot_0_4_0.encode, var_311_2)

	if not var_311_3 then
		return
	end

	return string.format("xoyaw_%s_xoyaw", var_311_4)
end

function slot_0_69_0.perform_import(arg_312_0)
	if type(arg_312_0) ~= "string" then
		return
	end

	if arg_312_0:find("xoyaw_") then
		arg_312_0 = arg_312_0:gsub("xoyaw_", "")
	end

	if arg_312_0:find("_xoyaw") then
		arg_312_0 = arg_312_0:gsub("_xoyaw", "")
	end

	local var_312_0, var_312_1 = slot_0_1_0(slot_0_4_0.decode, arg_312_0)

	if not var_312_0 then
		slot_0_25_0.print(true, slot_0_25_0.format("\vxo-yaw \r· Failed to decode your configuration."))
		utils.console_exec("play buttons\\weapon_cant_buy.wav")

		return
	end

	local var_312_2, var_312_3 = slot_0_1_0(json.parse, var_312_1)

	if not var_312_2 then
		slot_0_25_0.print(true, slot_0_25_0.format("\vxo-yaw \r· Failed to parse your configuration."))
		utils.console_exec("play buttons\\weapon_cant_buy.wav")

		return
	end

	slot_0_23_0:import(var_312_3.config)
	slot_0_25_0.print(true, slot_0_25_0.format(string.format("\vxo-yaw \a808080FF· \aDEFAULTConfig was loaded successfully. Creation date: \v%s", var_312_3.date)))
	utils.console_exec("play ui\\beepclear")

	return true
end

slot_0_71_0 = {
	__index = {
		load = function(arg_313_0)
			slot_0_69_0.perform_import(arg_313_0.data)
		end,
		import = function(arg_314_0)
			local var_314_0 = slot_0_15_0.get()

			if not slot_0_69_0.perform_import(var_314_0) then
				return false
			end

			arg_314_0.data = var_314_0

			return true
		end,
		export = function(arg_315_0)
			if arg_315_0.data:find("_xoyaw") == nil then
				arg_315_0.data = ("%s_xoyaw"):format(arg_315_0.data)
			end

			slot_0_25_0.print(true, slot_0_25_0.format(string.format("\vxo-yaw \a808080FF· \aDEFAULTConfig \v%s \rwas copied successfully.", arg_315_0.name)))
			utils.console_exec("play ui\\beepclear")
			slot_0_15_0.set(arg_315_0.data)
		end,
		save = function(arg_316_0)
			arg_316_0.data = slot_0_69_0.perform_export()

			slot_0_25_0.print(true, slot_0_25_0.format(string.format("\vxo-yaw \a808080FF· \aDEFAULTConfig \v%s \rwas saved successfully.", arg_316_0.name)))
			utils.console_exec("play ui\\beepclear")
		end,
		to_db = function(arg_317_0)
			return {
				name = arg_317_0.name,
				data = arg_317_0.data
			}
		end
	}
}
slot_0_72_0 = setmetatable({}, {
	__index = function(arg_318_0, arg_318_1)
		local var_318_0 = files.read("xo_configs.json")

		if var_318_0 == nil then
			return nil
		end

		local var_318_1, var_318_2 = slot_0_1_0(json.parse, var_318_0)

		if not var_318_1 then
			return nil
		end

		return var_318_2[arg_318_1]
	end,
	__newindex = function(arg_319_0, arg_319_1, arg_319_2)
		local var_319_0 = files.read("xo_configs.json")

		if var_319_0 == nil then
			var_319_0 = "{}"
		end

		local var_319_1, var_319_2 = slot_0_1_0(json.parse, var_319_0)

		if not var_319_1 then
			var_319_2 = {}
		end

		var_319_2[arg_319_1] = arg_319_2

		files.write("xo_configs.json", json.stringify(var_319_2))
	end
})
slot_0_73_0 = "xo_configs"
slot_0_74_0 = {}

function slot_0_69_0.update_list(arg_320_0)
	local var_320_0 = {}
	local var_320_1 = #slot_0_74_0

	for iter_320_0 = 1, var_320_1 do
		local var_320_2 = slot_0_74_0[iter_320_0]

		var_320_0[#var_320_0 + 1] = var_320_2.name
	end

	if #var_320_0 == 0 then
		var_320_0[#var_320_0 + 1] = "No configs here! Create one."
	end

	slot_0_23_0:reference("config_list").reference:update(var_320_0)
end

function slot_0_69_0.lookup(arg_321_0, arg_321_1)
	arg_321_1 = slot_0_70_0(arg_321_1)

	local var_321_0 = #slot_0_74_0

	for iter_321_0 = 1, var_321_0 do
		local var_321_1 = slot_0_74_0[iter_321_0]

		if var_321_1.name == arg_321_1 then
			return var_321_1, iter_321_0
		end
	end
end

function slot_0_69_0.create(arg_322_0, arg_322_1)
	arg_322_1 = slot_0_70_0(arg_322_1)

	local var_322_0 = {
		name = arg_322_1,
		data = slot_0_69_0.perform_export()
	}

	slot_0_74_0[#slot_0_74_0 + 1] = setmetatable(var_322_0, slot_0_71_0)

	slot_0_25_0.print(true, slot_0_25_0.format(string.format("\vxo-yaw \a808080FF· \aDEFAULTConfig \v%s \rwas created successfully.", arg_322_1)))
	utils.console_exec("play ui\\beepclear")
	arg_322_0:update_list()
	arg_322_0:flush()
end

function slot_0_69_0.on_list_name(arg_323_0)
	if #slot_0_74_0 == 0 then
		return
	end

	local var_323_0 = slot_0_74_0[slot_0_23_0:reference("config_list").reference:get()]

	if var_323_0 == nil then
		var_323_0 = slot_0_74_0[#slot_0_74_0]
	end

	slot_0_23_0:reference("config_name").reference:set(var_323_0.name)
end

function slot_0_69_0.destroy(arg_324_0, arg_324_1)
	local var_324_0 = #slot_0_74_0

	for iter_324_0 = 1, var_324_0 do
		if slot_0_74_0[iter_324_0].name == arg_324_1.name then
			table.remove(slot_0_74_0, iter_324_0)

			break
		end
	end

	arg_324_0:update_list()
	arg_324_0:flush()
	arg_324_0:on_list_name()
end

function slot_0_69_0.init(arg_325_0)
	local var_325_0 = slot_0_72_0[slot_0_73_0]

	if var_325_0 == nil then
		var_325_0 = {}
	end

	local var_325_1 = #var_325_0

	for iter_325_0 = 1, var_325_1 do
		local var_325_2 = var_325_0[iter_325_0]

		slot_0_74_0[iter_325_0] = setmetatable(var_325_2, slot_0_71_0)
	end

	arg_325_0:update_list()
	arg_325_0:on_list_name()
end

function slot_0_69_0.flush(arg_326_0)
	local var_326_0 = {}
	local var_326_1 = #slot_0_74_0

	for iter_326_0 = 1, var_326_1 do
		local var_326_2 = slot_0_74_0[iter_326_0]

		var_326_0[#var_326_0 + 1] = var_326_2:to_db()
	end

	slot_0_72_0[slot_0_73_0] = var_326_0
end

slot_0_75_0 = {
	"load",
	"import",
	"export"
}

for iter_0_6, iter_0_7 in ipairs(slot_0_75_0) do
	slot_0_23_0:reference(iter_0_7).reference:set_callback(function()
		local var_327_0 = slot_0_23_0:reference("config_name").reference:get()
		local var_327_1, var_327_2 = slot_0_69_0:lookup(var_327_0)

		if var_327_1 == nil then
			return
		end

		var_327_1[iter_0_7](var_327_1)
		slot_0_23_0:reference("config_list").reference:set(var_327_2)
	end)
end

slot_0_23_0:reference("save"):set_callback(function()
	local var_328_0 = slot_0_23_0:reference("config_name").reference:get()
	local var_328_1, var_328_2 = slot_0_69_0:lookup(var_328_0)

	if var_328_1 == nil then
		slot_0_69_0:create(var_328_0)
		slot_0_23_0:reference("config_list").reference:set(#slot_0_74_0)
	else
		var_328_1:save()
	end
end)
slot_0_23_0:reference("remove"):set_callback(function()
	local var_329_0 = slot_0_23_0:reference("config_name").reference:get()
	local var_329_1, var_329_2 = slot_0_69_0:lookup(var_329_0)

	if var_329_1 == nil then
		return
	else
		slot_0_25_0.print(true, slot_0_25_0.format(string.format("\vxo-yaw \a808080FF· \aDEFAULTConfig \v%s \rwas removed successfully.", var_329_1.name)))
		utils.console_exec("play ui\\beepclear")
		slot_0_69_0:destroy(var_329_1)
	end
end)
slot_0_23_0:reference("config_list"):set_callback(function()
	slot_0_69_0:on_list_name()
end)
slot_0_23_0:reference("default"):set_callback(function()
	slot_0_69_0.perform_import("xoyaw_eyJjb25maWciOiI0MTE2OTgwNTkwOjA7MjYwMzY5NDgyOTpmYWxzZTsyMjA3MTA5NjI1OjQ1OzgxMzQ5OTM0Mzp0cnVlOzE2NTgxNTI5NTc6RGVmYXVsdDsxMDI1MDM3MDUxOnt9OzEzMDEzNzQ2MzM6ZmFsc2U7OTkwMjUxNzQ5OmZhbHNlOzI1Nzk5ODU4MDE6e307MzMyODM0MDMyODoxODA7MTMyNTI4MTIzMzowOzM2NjQ0MTQ5NTI6dHJ1ZTsyNDY5MDUzNTQ0OjU7MzcwNzc5NzE4NDpEZWZhdWx0OzI3MTY3MzUwMzQ6dHJ1ZTszODA3NTYxMTY2OjU7NTMwMTQ1OTUxOkRlZmF1bHQ7MjA0NjYwMTczNTowOzQyNDg4MzkxODI6ZmFsc2U7MjAzOTkzNjk1NzowOzE1OTIyMTY3NDowOzE4NDk3MjQxNTI6NTsxNDg1OTk2NDE6MDsyMjQ4NTcxODM4OkJhY2t3YXJkOzI2MzA0OTUzMjc6NTszNTAwODkzNzAzOjA7NDExNDE2NjM2ODp0cnVlOzIzODMzMjE5MTQ6ZmFsc2U7MTUwMDQ4ODM2OnRydWU7Mzc0ODA5NTI2Njo1OzM2ODE1ODE4Mzg6NTg7MzQ4OTc1NjU0Mzp0cnVlOzEzODc2ODg0NDowOzI2MjQxNTc5MjY6RGVmYXVsdDs0MDQ3MjE2NDY0OjQ1OzU3ODcwMDA1NDpGRjkwRDlGRjsyNTc1ODM4NTY3OjA7NDQ0ODQxODYwOnRydWU7MTg0MDkzNTU4MzpEb3duOzQ0Nzg1NjIyMDoxODA7MjI1NDk5MjYzNzp7fTsyNjE1NjU5MTk6LTQ1OzIyNzE3NTc5NDc6MDsxMjE1NzcwMDAxOlN0YXRpYzsyMDc2NzAxNjI4OlNwaW47NzQxNTc2MTg0OkF0IFRhcmdldDsyMDA2MTAwMDk1OntDb25zb2xlLEV2ZW50c307MzY2NjQyMzA0MDowOzI4NDgxNjAwNDU6ZmFsc2U7MzU5MTAyMTc0NDpEaXNhYmxlZDsyMDU2MTgwOTAzOkJhY2t3YXJkOzE4MTA4NDI5NDg6MDs0MDEyOTA1NDYwOmZhbHNlOzI4MTAzNjg1NDE6MDszMzA0NjMwNjEyOmZhbHNlOzEzODQ0MjM4NjQ6NTg7MzM4OTg1OTM4OmZhbHNlOzcyNjY5MjUwNzpVbnJpdmFsZWQ7MjA3MDYwMTMwNzo1OzMyNTUwMjkwMjY6dHJ1ZTsxMjAyMDk1NjU1OkRpc2FibGVkOzM2NjgwNzc0MjU6MDs0MzkzNzAzNTI6NTg7MjY5NDUzOTAyMjowOzE2OTc0MDkwNDM6MDs0MTI0ODc5ODM6dHJ1ZTsxMjY1MjQ5OTk4OmZhbHNlOzM0MzI5MTcwNDc6NTs1MTExNTI2MzpmYWxzZTsyMDU4MDMyNzM5OnRydWU7MzQ0NjYzMzY1NDpmYWxzZTsxMTAwNjA4NzI3OjA7MTY2NDMzNzcyNDpFMUUxRTE1QTsxNTcxMDU5MTQ4OjA7MjM5NjExMTgwNDpmYWxzZTszNDcyNTE0MzA0OjA7MjgzNzkxMzYyNjpmYWxzZTsyMTIxMTExNzI0OkRvd247MjM3MDM3NzMwNTp7fTszMjQyOTY5Njc3OjU7NDA2NzU1NjQxNzpmYWxzZTszNjEyMDQ5NTAzOmZhbHNlOzQwODI3OTc5MDg6MTgwOzExNTUxNTQwNDE6NTsxNjAyODIxMzg2OntCb21iLFBpbmcgU3Bpa2UsRG91YmxlIFRhcCxIaWRlIFNob3RzLEJvZHkgQWltLFNhZmUgUG9pbnRzLEZha2UgRHVjayxGcmVlc3RhbmRpbmcsTWluaW11bSBEYW1hZ2UsSGl0IENoYW5jZSxFZGdlIFlhdyxEb3JtYW50IEFpbWJvdCxBaW1ib3QgU2hvdHN9OzIyNjUzNDU3NzE6ZmFsc2U7MTA4MDEyNzA3MjpGRjAwMDBGRjszMzc0MjA1Nzk6MDszMDcyOTkwNzkxOmZhbHNlOzMzNDUxNTYwNTY6MTs2MDk1ODA1Nzo1OzI1ODE3MjkwMjc6dHJ1ZTs4NTg3ODQzMjY6U3RhdGljOzEzNDcwNTE3ODowOzI0Nzk0OTQ3OTQ6NTg7MTY5MTAxOTg3OTpEb3duOzcxMTA3NjUzMjpGRjkwRDlGRjsyNzg1OTMyMjYzOmZhbHNlOzE0ODg2MjExNjI6MDszMDE1MTM3NDU6MDszMDE0Njg0OTE3OjE7MTkyNjc5MDkzMTpCYWNrd2FyZDsxMDI5Njc5MDQzOjQ1OzI1MDU1NjI2Njk6ZmFsc2U7MzM5NzYyNzcyMzowOzM3NDE4NzUwMDU6RGlzYWJsZWQ7Mzg0MjE0NjcwMDp0cnVlOzIyMzg2MzA4NDc6OTA7MzI1MTM4MTQzOnRydWU7MTQ0MzcyODc2Nzo1OzEyNzQ1ODkwNzI6ZmFsc2U7NDE4ODE2Mzc3NjpmYWxzZTs3MjM5MjY0MjM6Sml0dGVyOzI0ODk4NzAyNjA6NTs0NzM0NTU6MTs0MjY4NDM2NjUyOntTbG93IFdhbGssQ3JvdWNoLENyb3VjaCBNb3ZlLEFpcixBaXIrfTszMjM5MTg2MDE5OjU7NDI5MTIyNDEyNTowOzM5OTA2OTE4MDc6RGlzYWJsZWQ7NDcwODI0ODAzOkRlZmF1bHQ7MTkzOTYxNDkyNzpEaXNhYmxlZDsyOTUzNTAzODc0OjEwOzIzNDIxMTc3NTY6MDszMzUzNzk1MzczOjA7MzYzNzA0OTEwNDo1ODs0MjgwMzMwOTI5OjA7Mzk3Mzc3NTU1NTpBdCBUYXJnZXQ7MzQwMzM2NjkwMjoxOzE2MDU2MjI4MzU6RGVmYXVsdDszNjcxMzYyNzI5OjA7MTMzODE1OTY5NjpmYWxzZTs4OTEyNTU3NzA6NTs0MTUwMjUzNjM5OlN0eWxpc2g7MjU4OTQ5MDA1NzowOzI1ODcyNzk5OTY6QmFja3dhcmQ7MTUzNTk2ODE4NTotMzA7MjA5MDMxOTc1ODoxMDs0MTA0NzQ4MjMxOjA7Mzk3MDQ2NDc1MDowOzI5NjUzNjQyMDo1ODsxOTIxMzA1MzgyOk9mZjsyODAzMzU4NDM0OjA7MjE0ODgxNjQ4OmZhbHNlOzI4NzgzNzY4NjU6NTszNzIzNzEzMjY2OjA7MjY4NjYzNzMyODowOzI5NzAyODE0OTM6MTA7NDE2ODEyNDc1Njp7fTsxMjIwNjA1MTk0OkZsaWNrOzIxMzc5MDM3NTQ6dHJ1ZTs5OTE2MDkwOTE6MDszMzQ3NjA4MTQ6e307MzEyMTM0MDA2NzpmYWxzZTsyOTY2NjU1ODY1OjYwMDsyOTgyMzEzMjAyOmZhbHNlOzMyNjg3MTQ5Mjk6NTg7MzQ1NjQwNzM4Nzo1OzQ5NjUxOTY2OmZhbHNlOzM3MDU0MjM3MTpKaXR0ZXI7Mzc2OTQxNTU2OmZhbHNlOzIwOTU3Njc5MDc6MDs0MTMxNDEzODc6RkZGRkZGRkY7OTAyNjQ3MDA3OkRpc2FibGVkOzIzNTA2MzE5NzpEZWZhdWx0OzQyMzM0NTgzMDE6MDsxOTI1NDc4MDY5OlN0YXRpYzsyMDA5NzQ0NzQwOjE7MzU1ODYzNzk4NToxODA7MjA2NTMyNjQ2ODo1OzIwMTYyODA0MDI6MDsxMTA0MzA0NzI3OmZhbHNlOzM3OTI0NDc3MDM6NTg7MzcyMTk4MjMwODo1Ozk3NDk5MjUwNzoxNzc7MTQ1OTkyODI1OTowOzI5Nzg1NTA1MzE6ZmFsc2U7MzE1NzM2OTMzOjU4OzI4NDAwOTM3MTQ6T2ZmOzE0MTU4NzgyNTk6e0ZsYXNoZWQsVGFraW5nIERhbWFnZSxXZWFwb24gTm90IFJlYWR5LFNhZmUgSGVhZH07Mjc3MzQ3NDcxNToxODA7MTAzNDE1MjU2NDpmYWxzZTsxMTI0NjE1OTM3OkF0IFRhcmdldDsxNjUyNTY5MDQ2OnRydWU7Mjg1NTQ5MzM5NTpmYWxzZTs0MjA4NDQxOTY0OjA7MTEzOTIwODYxMjp0cnVlOzIwNTAzODQzMjo1OzEwNDAxODA4MDU6MDsyNzcxMjUwMDA1OjA7MTA1NDc3Nzc1OkRlZmF1bHQ7Mjc4MzA3NjMzNDpmYWxzZTsxNjMxMDA2NjY4OmZhbHNlOzcwODU2MTkwMTpmYWxzZTsyNTUxNDk5MDY1OjA7MzgxMDIyOTk1ODp7fTsyMzUyMTgxMjU2OjA7MjkwNjAyNzcyMDoxOzI3NTQ5Mzg4ODE6MDs2NzIwOTU5NDg6MDs1MjU0MzYyOTI6MDsxMjI1MDMzMTgyOmZhbHNlOzM1MTUzMzIyOTk6MjszMzUxMjAzNjk0OkRvd247MTE5NzQ3MDExMjowOzcxMDU4MTQyMTowOzM0ODg3MTExNDoxOzI4MDQ4NDg3MjA6ZmFsc2U7MTY1MTgyMzUxNDpBdCBUYXJnZXQ7MjgxMTUzNzg1NzpGRjAwMDBGRjszODQzODYwMzE2OjE4MDsxOTA2MjY3MjU1OjA7MTkzNjAwODgyOjA7MTg3MzI2MTgxNDowOzM3OTAwNjkzMTg6MTgwOzQyOTA3MzcyMjM6dHJ1ZTszMTQwMjQzNzEzOjA7Mjk0OTY2Njk4MDowOzMyNjU2MDkwNTk6ZmFsc2U7MzU3NDQ3OTY0MDpEZWZhdWx0OzQwNTYxNzU4ODU6MDsyODE5MjMxMzUyOjA7MTg5NzI1OTg2OmZhbHNlOzk2MTAwODk5Nzo1OzMxODc5OTQxNDI6RG93bjsyMTkwMjIzNTIzOjA7MjI2NTQwODE3ODo1OzIxMzY4MTQwNDk6NTg7Njk1NDQ1Njg5OnRydWU7MjU0MDc4Nzg6NTA7Mzg3NzI1OTczMToxODA7MTUyODEwMDU2MjowOzEwMjg1NTYzMTg6MDszMjIzNTUwNDA4OkRlZmF1bHQ7NDA0OTM4MDE3ODowOzQxMjM4NDMyMjY6MzM7MjcyNjA1MzAyNzowOzI3OTQ5MTEwNTE6NTg7OTYzOTc4Nzc4OjU7MTE3NDQ4MTQxMjpEZWZhdWx0OzE3NTExMTMyNzI6ZmFsc2U7MjAwMjI5NzI3Mjo1MzUzNTM4RjszOTcwODIzMzczOnRydWU7MTg3NTg2ODQyNTowOzMwMzYzODM0NTM6ZmFsc2U7MTgyOTE3NDAzNDpEZWZhdWx0OzI4NTc5MTk4NTg6QXQgVGFyZ2V0OzI3Nzc0NjE1OTU6QmFja3dhcmQ7MzM4NTQ4NTU3ODpmYWxzZTs1NDk5ODYwMzk6ZmFsc2U7MjE0NzM4NDIzNTowOzM0MzA0Njc5OTI6RGVmYXVsdDszODM4MTIyMTA1OnRydWU7MjE4OTgyNDM0NDowOzE5OTM1NjEwMzQ6MTs0MDI2MDQ3MDUxOjU4OzU2MjU5OTQ0MDpEZWZhdWx0OzE1MDg1MDkwMjI6Sml0dGVyOzE5NDc5MjY3NjQ6RGlzYWJsZWQ7MzgzNDQ0NTAyMjp0cnVlOzc3NTUyNTEyNjoxOzIxMzkxMDcyNzM6NDU7OTI4OTE4NjI2OjA7MjQ0NDM5MTU2MjowOzQxMTU3MDU1MDo1OzMzNzA0MjQ5NDA6T2ZmOzI5MTk5NDg2MzY6LTEwOzM2ODA0OTQxODg6ZmFsc2U7ODc1MDgxNDQ3OjE7MjgxNTY1Mzk4OjA7MTg1MTU0OTE3NzoyMTszNjkwOTgzMTc6ZmFsc2U7MzY4MDA0NDc2OTo1OzI5MzcwMTIxOTc6ZmFsc2U7MzA1NzkwMTU4NTo1OzI4OTcxMTI4MjQ6NTg7MjY2ODYxOTg1OjA7MTU5MTkzMzAxNzowOzE4MzI3MjcxMDg6QmFja3dhcmQ7MTkyODM1NTcxMTpmYWxzZTsyODgyMjM3NDk5OjA7Mjg3MzE4MjQ5NjoxOzIwNjEwMTUxNDA6QmFja3dhcmQ7MjU3MDI0NjAxMTo3OzIyMjA1Mjc5ODk6RGlzYWJsZWQ7MzU1NjE4MzI5MzpEZWZhdWx0OzIwNDgyODQwNjk6dHJ1ZTszOTYyNjI2MjYwOjA7NTQ0MzI0MjU0OjU7Mzk0ODkwNDk4MjowOzc1NzIyMDQ6ZmFsc2U7MTkxMjE1NTc0NDo1OzIwNjg3MjE3NDE6U3RhdGljOzI3NDgyMTc0NjA6dHJ1ZTs0MjA3NTYzNDE2OjQ1Ozk5MTE5MTg4OTp0cnVlOzI4ODQ1NTI1NTA6MDszNTI5MDc0MDQ1OkZGOTBEOUZGOzExMDU0MjE4OTE6T2ZmOzE2NTI1NDM5Mzc6MTA7NDExNzc2NjI0NjpEaXNhYmxlZDsyNTY0NTA1NTI0OjE7MTA1NjIyMzk5MzoyOzQzODU5NTg5MjpmYWxzZTsyMzczMjA4NDcwOjU7MTIxNDE2MDMxMzpmYWxzZTs2NDk2MzEzMzE6NDU7NTExMjg3MDI1OnRydWU7MTE5MTI4NTkxOjA7ODc3NDAyMjgxOjA7NjE3MzY2Njc6MTAwOzE4NzUwOTM2NzE6MDszNTYxODY5NzA0Oi04OTsyNzc4NTczMzIzOjE4MDs0MDkzMDY2OTc0OkRpc2FibGVkOzUzMDg3Mzk0NzoxMDsyMTI5MTUxNTkwOnt9OzEwODIyMzI2MzM6dHJ1ZTszOTQwMDU4MjQxOjU7NDE2NDc1MDIzODowOzExNDc1Mzk3NzI6ZmFsc2U7NDE0NjI3MDQ4MjpPbiBQZWVrOzI3NTI1NzQ1NjU6NTszNzM3MjQ0NzAwOjA7MTM5MjIxMDc0OkRlZmF1bHQ7MjkwNjUzNTM5Mzo1OzQwMzY1OTI2Nzp7Q3JvdWNoLENyb3VjaCBNb3ZlLEFpciBLbmlmZSxBaXIgWmV1c307MzA2NzQxMjc5NjowOzc2ODE3NDI2NDowOzQxNTMwMTMyMDA6MTs0MjUwODY3MjAxOnRydWU7MTUxMTU1ODA6RnJvemVuOzI5MTY4MDQxMjU6NDU7NDEwNDI3NjkzMzowOzE2MjU0MzcyMzU6NTg7MTMyMzc1NDk4OjA7NjcxNzM1NTE1OjE7MTAxOTg4MDI2NTpPZmY7MzQ5NjQ1NzQ0ODpTcGluOzIwMDMyMTk4ODk6RGVmYXVsdDsxODc2ODkyMjYzOkRlZmF1bHQ7MjUwODI2OTQ5OTpmYWxzZTszMzM1MjY5Nzg4OmZhbHNlOzk5MDc0MjQzMDo1OzI0NjczMzc5NTk6MTszNjQ2MDA2OTI3OnRydWU7MjY1OTk3MzAxNjp0cnVlOzE2MzYzNzUwNTY6MDsxMzA0OTIwNzU4OnRydWU7MjI4NDM5MjIwOTo1OzQ4NTY2NTc5NDp0cnVlOzE4MjI4MTQ2NzI6T2ZmOzI3ODIyMzcwMzA6RkY5MEQ5RkY7Mzc3ODY0MTcyNTowMEFGRkZGRjs2MTM0MTA4MDowOzQxNTE5MjQyNTQ6e307MzA3Mjk2OTExOTpEb3duOzIzMTMyNzY0MjM6RkY5MEQ5RkY7MTIzNjUzNzk5NTo1ODsyOTcxMTQxNzc3Ont9OzUxMzU5MTA4NjpEaXNhYmxlZDsyNTgxODkzMjUxOjA7MTk1NjI5NDk2ODowOzIwNTE1NzE0ODM6NTsyMTkyNjAzMTU3Ont9OzM2MzI5MTU2OTY6RG93bjsyMjE0MjE3NDM3OjA7MTcxNDI1ODYwNzowOzE0OTMwODcyMjk6RG93bjsxOTk5OTkwMDk2OjQ7NDY4MzkxNzU4OjA7MTk4NDQ4MTIwNTowOzI4NDIyNDE5MTU6MDs5OTMwMDYwNTU6dHJ1ZTsyMjkwMjE5MTg3OjE4MDsxODY2NTk1Mjc4OjA7Mjg1ODI3MTk0OjA7MTYxMjkwNDcyOjE4MDsxMDg5Njg3NzEyOkJhY2t3YXJkOzEwMzA2OTgwNjg6MDsxODEwODU2MDU4OjU4OzM1MTI0MjM3MTY6MDs0MTM5ODI5MTI2OjA7MTA5NjU5MTU0MDowOzU2NjQ0MzAxNjpmYWxzZTs0MTc1Njg3OTM5OjA7MjY3MzA4MDM5MzpTcGluOzE2ODA0NDY6NTsxODc5OTQxNTQwOjA7MzkxNjUyMDAyNjp0cnVlOzMwNTM1ODU2NTA6MDsxMjIzNjIxMzIwOntBaW1ib3QgU2hvdHMsRGFtYWdlIERlYWx0LFB1cmNoYXNlc307MzY0MDc0NjUwOTowOzIxMjEyMTMyMzI6MDsxMzA0NzY1MjI3OjA7NDE4NDc1ODI1NDpGRjkwRDlGRjszNzczMzM0Njc0OjQ1OzQ0Nzk0OTM3NDpEZWZhdWx0OzE3OTc4ODg2Mzk6ZmFsc2U7MTc5OTgxNzgzMzpmYWxzZTszNDM4OTUxNzkzOjA7MzA1MzE1NTA5MzpHbG9iYWw7MjcwNzM1MjA0ODo1OzY1ODUxNjc3OTpEZWZhdWx0OzI0ODU2MDI5MjU6MDsxNTY0OTg0MzkwOjA7MTI4NjY0MDAyOTpPZmY7NTMzNDY5MjM6NTszMzcyMjE0ODE0OjU7MTA4Nzg4MjYxNzpPZmY7MTc3NTAwMTczNTp0cnVlOzExMDcxMDgyNzE6MDszNjE0NzYyMTI5OjA7MjI1ODYzNjA4MjpmYWxzZTszNjcxOTA2Nzc4OnRydWU7MjI1MjczMzg4MzpBdCBUYXJnZXQ7MzE1OTYxNTc0MDp0cnVlOzE0NTcxNTUzOTk6NTszNjcyNjQ4MzY6NTg7MjI4OTgyMTMxOi04OTsxODAxOTU3MTE0OjA7MzU3Njg1MTY5MDpGRkZGRkZGRjsyNjQ4NjM3MDA5OmZhbHNlOzEyMDgxMzkzMjE6MDs0MTExNzk0NjUwOjEzOzEyNjExMDcwOTI6NTsxOTQzNDA5NDA2OjA7MzkzNDE3ODY3Nzo1OzE3NDkwNzc3MTowOzgzOTUzNjk4NjowOzM4MzgxMDQ1Mjc6e307Mzk5NTQxNzMyMzpmYWxzZTszMDUzMDI1NDg3OjE7MTYwMDUxOTIwNDpTY3JpcHQ7NDAxMTM1NzY2NzpPZmY7NDE5MTQ4Nzc5OkRlZmF1bHQ7MjE4MzYyOTU5NTpBdCBUYXJnZXQ7NzY5OTEyOTY5OmZhbHNlOzM4OTQ5MjM0MzA6NDU7MjI3NzA2MTg1MDo1OzM1ODY4MjMzMzQ6MDsyODE4NzgyMzEyOmZhbHNlOzEzMTE5NTY0OTY6MDsxNjk2NTE5MzE3OjU7NDE4MjI1NjkzNzowOzQyMTgyMzkzMzI6dHJ1ZTszNTY4NjcyMDM1OjA7MjQyODA0OTk1ODowOzEwMzgxOTM2OTE6NTs2MDM3NjIzMDpmYWxzZTsyMDYzNzIzNDY3OmZhbHNlOzI3OTI5Njg2NzI6NTg7MzI5NTE1NDM3OjU7NjMxMTY2NTk4OjA7MzcwNDA4NDYwNjowOzc3Mzg0OTUyNTpEb3duOzczOTQ2NzQzMjp7SW5kaWNhdG9yc307ODg4MDI1Mjc0Ont9OzMxNDQyMTU0NDA6MDs2ODE1MzYxODA6NTsxOTk3MDUwOTY0OmZhbHNlOzE3NzQ2MDUzOTQ6MDsyNzY1MzY2MTkzOnt9OzE4OTc0Mzk2ODp4by15YXcubHVhOzM5OTg4ODIyMjI6U3BpbjsxMjYwODY1NDI1OkF0IFRhcmdldDsyOTg1MzkzMDAyOmZhbHNlOzE0NzM2MTkwMjk6NTg7MzA1Mjk3MTM5MjpEZWZhdWx0OzM0Mjc0MTk3NzA6MDsyNTUyMTU4NDgzOmZhbHNlOzQxNjc0MTE5MDc6MDszNDU0OTQ1ODIwOjU7MzczODY3OTk1NzpEZWZhdWx0OzQyNDE5ODg0NDowOzM4NTMzODYyOTY6dHJ1ZTszMTY3MTYwOTM5OmZhbHNlOzIwMzkxMzA5ODA6MDsyMzgxNTc4NzEzOjA7MjM5OTIwMzowOzQwMzYyNjg5MDE6MDsxMjk5ODU5NDM2OjQ1OzEyNDM2NzU5OTA6ZmFsc2U7MTUzODAxOTIxNDo1OzI2NjUwMjY3NDk6NTsxMTUwOTUyNTY5OnRydWU7Mjc1NTQ0NDQ0OTowOzE5NjI2NTcwNjc6dHJ1ZTszMTY2MDMwMDc2Oi01MDsxMjgyNjIzMDA0OjEyMDsxOTQ4NDUxMjUzOjE7MTk2MzU1MTg5Mzp0cnVlOzE3Mzk1NDA0OTM6ZmFsc2U7MTE1Mjg3NzY4MjpmYWxzZTszNTQxMTQ4MTg4OkF0IFRhcmdldDsxOTcwNzIyMTQ6ZmFsc2U7NDA2MDM0NzA0MDp7fTsxMTkwNzYzMDg4OjU7MTI1NDQ4OTUzODpmYWxzZTszNjYxODIxNTk5OjU4OzQ5MDY1MTkyODpPZmY7MzU4NTM0NTc1OjA7MjQzOTc5NjEzNTowOzI1NTMwODExMjk6MDsyMjI2NDA5MzAwOkZGRkZGRkZGOzIwODg4OTI5ODg6RGVmYXVsdDs0OTU3MDEzMTo1OzI4NjE1MTc0MTY6ZmFsc2U7MTgxNjA0ODAzMToxODA7MzMyMjYxMTY3NDpmYWxzZTsyMTE1NTg1MzM3OkJhY2t3YXJkOyIsImRhdGUiOiIxMi8yNi8yMDI0IDAyOjA5IFBNIn0=_xoyaw")
end)
slot_0_69_0:init()
events.shutdown:set(function()
	slot_0_69_0:flush()
end)
slot_0_16_0["Defensive Detect"].createmove:set(function(arg_333_0, arg_333_1, arg_333_2)
	if not arg_333_2 then
		return
	end

	local var_333_0 = arg_333_1.m_nTickBase

	if math.abs(var_333_0 - slot_0_13_0.max_tickbase) > 64 then
		slot_0_13_0.max_tickbase = 0
	end

	local var_333_1 = 0

	if var_333_0 > slot_0_13_0.max_tickbase then
		slot_0_13_0.max_tickbase = var_333_0
	elseif var_333_0 < slot_0_13_0.max_tickbase then
		var_333_1 = math.min(14, math.max(0, slot_0_13_0.max_tickbase - var_333_0 - 1))
	end

	if var_333_1 > 0 then
		if slot_0_13_0.max == 0 then
			slot_0_13_0.max = var_333_1
		end

		slot_0_13_0.ticks = var_333_1
	else
		slot_0_13_0.max = 0
		slot_0_13_0.ticks = 0
	end
end)
slot_0_16_0["Player Information"].createmove:set(function(arg_334_0, arg_334_1, arg_334_2)
	if not arg_334_2 then
		return
	end

	local var_334_0 = arg_334_1:get_anim_state()

	slot_0_12_0.crouch = arg_334_1.m_flDuckAmount > 0.89
	slot_0_12_0.velocity = var_334_0.velocity_length_xy
	slot_0_12_0.moving = slot_0_12_0.velocity > 10
	slot_0_12_0.onground = var_334_0.on_ground and not var_334_0.landed_on_ground_this_frame
	slot_0_12_0.landing = var_334_0.landing and slot_0_12_0.onground

	local var_334_1 = 1
	local var_334_2 = arg_334_1.m_flStamina

	if var_334_2 > 0 and slot_0_12_0.onground then
		local var_334_3 = math.clamp(1 - var_334_2 / 100, 0, 1)

		var_334_1 = var_334_3 * var_334_3
	end

	slot_0_12_0.velocity_modifier = arg_334_1.m_flVelocityModifier * var_334_1

	slot_0_3_0.on_createmove()

	slot_0_12_0.condition = slot_0_42_0.condition(slot_0_24_0["Enabled_Fake Lag"])

	if slot_0_12_0.condition == "Fake Lag" or arg_334_0.choked_commands == 0 then
		slot_0_8_0:new_frame(globals.tickcount)
		slot_0_9_0:new_frame(globals.tickcount)

		slot_0_11_0.jitter = slot_0_11_0.jitter + 1
		slot_0_12_0.body_yaw = math.normalize_yaw(var_334_0.eye_yaw - var_334_0.abs_yaw)
	end
end)
slot_0_16_0["Reset Overrides"].render:set(function()
	for iter_335_0, iter_335_1 in pairs(slot_0_14_0.AA.angles) do
		if iter_335_1.type then
			iter_335_1:override()
		else
			for iter_335_2, iter_335_3 in pairs(iter_335_1) do
				iter_335_3:override()
			end
		end
	end
end)
