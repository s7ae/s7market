--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

base64 = require("neverlose/base64")
clipboard = require("neverlose/clipboard")
smoothy = require("neverlose/smoothy")
inspect = require("neverlose/inspect")
empty_0_4_0 = {}
empty_0_4_0.name = "phantom"
empty_0_4_0.build = "Beta"
empty_0_4_0.username = common.get_username()
empty_0_4_0.icon = ui.get_icon("stars")
cfg_0_5_0 = {
	ragebot = {
		double_tap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
		hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
		dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
		peek_assist = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
		peek_assist_auto_stop = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"),
		peek_assist_retreat = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"),
		hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
		minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
		body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
		safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
		double_tap_option = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
		hide_shots_option = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
	},
	antiaim = {
		angles = {
			enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
			pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
			yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
			yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
			yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
			avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
			hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
			yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
			modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
			body_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
			inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
			left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
			right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
			options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
			body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
			freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
			freestanding_yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
			freestanding_body = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
			extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
			extended_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
			extended_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
		},
		fakelag = {
			enabled = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"),
			limit = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
			variability = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Variability")
		},
		misc = {
			fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
			slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
			leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
		}
	},
	world = {
		world_marker = ui.find("Visuals", "World", "Other", "Hit Marker", "3D Marker"),
		damage_marker = ui.find("Visuals", "World", "Other", "Hit Marker", "Damage Marker"),
		scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
	},
	misc = {
		other = ui.find("Miscellaneous", "Main", "Other"),
		fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
		weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"),
		air_strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe")
	}
}
empty_0_6_0 = {}
empty_0_6_0.insecure = "B6B665FF"
utils_get_vfunc_2 = utils.get_vfunc("engine.dll", "VEngineClient014", 91, "float(__thiscall*)(void*)")

if IS_DEBUG then
	var_0_8_1 = print

	function print(...)
		print_dev(...)
		var_0_8_1(...)
	end
end

function empty_0_6_0.get_space(arg_2_0)
	local var_2_0 = {
		[2] = " ",
		[3] = " "
	}

	if arg_2_0 == nil then
		return ""
	end

	for iter_2_0 = 0, math.floor(arg_2_0 / 3) do
		local var_2_1 = arg_2_0 - iter_2_0 * 3

		if var_2_1 % 2 == 0 then
			local var_2_2 = var_2_1 / 2

			return string.rep(var_2_0[2], var_2_2) .. string.rep(var_2_0[3], iter_2_0)
		end
	end

	return ""
end

function empty_0_6_0.icon_button_ex(arg_3_0, arg_3_1, arg_3_2, arg_3_3, arg_3_4)
	local var_3_0 = ui.get_icon(arg_3_1)
	local var_3_1 = "\a" .. arg_3_0
	local var_3_2 = "\a" .. "DEFAULT"

	if arg_3_2 == nil then
		arg_3_2 = ""
	end

	local var_3_3 = empty_0_6_0.get_space(arg_3_3)
	local var_3_4 = empty_0_6_0.get_space(arg_3_4)

	return var_3_3 .. var_3_1 .. var_3_0 .. var_3_4 .. var_3_2 .. arg_3_2 .. var_3_3
end

function empty_0_6_0.icon_button(arg_4_0, arg_4_1, arg_4_2, arg_4_3)
	return empty_0_6_0.icon_button_ex("{Link Active}", arg_4_0, arg_4_1, arg_4_2, arg_4_3)
end

function empty_0_6_0.icon_title_ex(arg_5_0, arg_5_1, arg_5_2, arg_5_3, arg_5_4)
	local var_5_0 = ui.get_icon(arg_5_1)
	local var_5_1 = "\a" .. arg_5_0
	local var_5_2 = "\a" .. "DEFAULT"

	if arg_5_2 == nil then
		arg_5_2 = ""
	end

	return empty_0_6_0.get_space(arg_5_3) .. var_5_1 .. var_5_0 .. empty_0_6_0.get_space(arg_5_4) .. var_5_2 .. arg_5_2
end

function empty_0_6_0.icon_title(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
	return empty_0_6_0.icon_title_ex("{Link Active}", arg_6_0, arg_6_1, arg_6_2, arg_6_3)
end

function empty_0_6_0.link(arg_7_0)
	panorama.SteamOverlayAPI.OpenExternalBrowserURL(arg_7_0)
end

function empty_0_6_0.get_clock()
	return globals.frametime / utils_get_vfunc_2()
end

function empty_0_6_0.contains(arg_9_0, arg_9_1)
	if arg_9_0 == nil then
		return false
	end

	for iter_9_0 = 1, #arg_9_0 do
		if arg_9_0[iter_9_0] == arg_9_1 then
			return true
		end
	end

	return false
end

function empty_0_6_0.get_original(arg_10_0)
	return tonumber(cvar[arg_10_0]:string())
end

function empty_0_6_0.merge(...)
	local var_11_0 = ""

	for iter_11_0 = 1, select("#", ...) do
		var_11_0 = var_11_0 .. select(iter_11_0, ...)
	end

	return var_11_0
end

function empty_0_6_0.round(arg_12_0)
	return math.floor(arg_12_0 + 0.5)
end

function empty_0_6_0.extrapolate(arg_13_0, arg_13_1, arg_13_2)
	return arg_13_0 + arg_13_1 * globals.tickinterval * arg_13_2
end

function empty_0_6_0.find(arg_14_0, arg_14_1)
	for iter_14_0 = 1, #arg_14_0 do
		if arg_14_0[iter_14_0] == arg_14_1 then
			return iter_14_0
		end
	end

	return nil
end

cfg_0_7_0 = {
	get_u8_array = function(arg_15_0)
		local var_15_0 = {}
		local var_15_1 = 0

		for iter_15_0 in arg_15_0:gmatch(".[\x80-\xBF]*") do
			var_15_1 = var_15_1 + 1
			var_15_0[var_15_1] = iter_15_0
		end

		return var_15_0, var_15_1
	end,
	rainbow_palette = function(arg_16_0, arg_16_1, arg_16_2, arg_16_3)
		arg_16_0 = arg_16_0 or globals.realtime
		arg_16_1 = arg_16_1 or 6
		arg_16_2 = arg_16_2 or 0.2
		arg_16_3 = arg_16_3 or 255

		local var_16_0 = {}

		local function var_16_1(arg_17_0, arg_17_1, arg_17_2)
			local var_17_0
			local var_17_1
			local var_17_2
			local var_17_3 = math.floor(arg_17_0 * 6)
			local var_17_4 = arg_17_0 * 6 - var_17_3
			local var_17_5 = arg_17_2 * (1 - arg_17_1)
			local var_17_6 = arg_17_2 * (1 - var_17_4 * arg_17_1)
			local var_17_7 = arg_17_2 * (1 - (1 - var_17_4) * arg_17_1)
			local var_17_8 = var_17_3 % 6

			if var_17_8 == 0 then
				var_17_0, var_17_1, var_17_2 = arg_17_2, var_17_7, var_17_5
			elseif var_17_8 == 1 then
				var_17_0, var_17_1, var_17_2 = var_17_6, arg_17_2, var_17_5
			elseif var_17_8 == 2 then
				var_17_0, var_17_1, var_17_2 = var_17_5, arg_17_2, var_17_7
			elseif var_17_8 == 3 then
				var_17_0, var_17_1, var_17_2 = var_17_5, var_17_6, arg_17_2
			elseif var_17_8 == 4 then
				var_17_0, var_17_1, var_17_2 = var_17_7, var_17_5, arg_17_2
			elseif var_17_8 == 5 then
				var_17_0, var_17_1, var_17_2 = arg_17_2, var_17_5, var_17_6
			end

			return var_17_0 * 255, var_17_1 * 255, var_17_2 * 255
		end

		for iter_16_0 = 1, arg_16_1 do
			local var_16_2 = ((iter_16_0 - 1) / arg_16_1 + arg_16_0 * arg_16_2) % 1
			local var_16_3, var_16_4, var_16_5 = var_16_1(var_16_2, 0.7, 1)

			table.insert(var_16_0, color(var_16_3, var_16_4, var_16_5, arg_16_3))
		end

		return var_16_0
	end
}

function cfg_0_7_0.wave(arg_18_0, arg_18_1, arg_18_2, arg_18_3)
	arg_18_3 = arg_18_3 or globals.realtime

	local var_18_0 = {}
	local var_18_1, var_18_2 = cfg_0_7_0.get_u8_array(arg_18_0)
	local var_18_3 = 1 / (var_18_2 - 1)

	for iter_18_0 = 1, var_18_2 do
		local var_18_4 = math.abs((arg_18_3 - 1) % 2 - 1)
		local var_18_5 = arg_18_1:lerp(arg_18_2, var_18_4)
		local var_18_6 = "\a" .. var_18_5:to_hex() .. var_18_1[iter_18_0]

		table.insert(var_18_0, var_18_6)

		arg_18_3 = arg_18_3 + var_18_3
	end

	return table.concat(var_18_0)
end

function cfg_0_7_0.wave_text(arg_19_0, arg_19_1, arg_19_2, arg_19_3)
	arg_19_2 = arg_19_2 or globals.realtime
	arg_19_3 = arg_19_3 or 1

	local var_19_0 = {}
	local var_19_1, var_19_2 = cfg_0_7_0.get_u8_array(arg_19_0)

	if var_19_2 == 0 then
		return ""
	end

	local function var_19_3(arg_20_0)
		local var_20_0 = #arg_19_1

		if var_20_0 == 1 then
			return arg_19_1[1]
		end

		local var_20_1 = arg_20_0 * (var_20_0 - 1)
		local var_20_2 = math.floor(var_20_1)
		local var_20_3 = var_20_1 - var_20_2
		local var_20_4 = arg_19_1[var_20_2 + 1]
		local var_20_5 = arg_19_1[math.min(var_20_2 + 2, var_20_0)]

		return var_20_4:lerp(var_20_5, var_20_3)
	end

	for iter_19_0 = 1, var_19_2 do
		local var_19_4 = ((iter_19_0 - 1) / var_19_2 + arg_19_2 * 0.3) * arg_19_3 % 1
		local var_19_5 = var_19_3(var_19_4)

		table.insert(var_19_0, "\a" .. var_19_5:to_hex() .. var_19_1[iter_19_0])
	end

	return table.concat(var_19_0)
end

function cfg_0_7_0.lerp(arg_21_0, arg_21_1, arg_21_2)
	return arg_21_0 + (arg_21_1 - arg_21_0) * arg_21_2
end

function cfg_0_7_0.lerp_position(arg_22_0, arg_22_1, arg_22_2)
	return vector((arg_22_1.x - arg_22_0.x) * arg_22_2 + arg_22_0.x, (arg_22_1.y - arg_22_0.y) * arg_22_2 + arg_22_0.y, (arg_22_1.z - arg_22_0.z) * arg_22_2 + arg_22_0.z)
end

function cfg_0_7_0.linear(arg_23_0, arg_23_1, arg_23_2, arg_23_3)
	return arg_23_2 * arg_23_0 / arg_23_3 + arg_23_1
end

function cfg_0_7_0.solve(arg_24_0, arg_24_1, arg_24_2, arg_24_3, arg_24_4)
	if arg_24_3 <= 0 then
		return arg_24_2
	end

	if arg_24_4 <= arg_24_3 then
		return arg_24_2
	end

	arg_24_1 = arg_24_0(arg_24_3, arg_24_1, arg_24_2 - arg_24_1, arg_24_4)

	if type(arg_24_1) == "number" then
		if math.abs(arg_24_2 - arg_24_1) < 0.001 then
			return arg_24_2
		end

		local var_24_0 = arg_24_1 % 1

		if var_24_0 < 0.001 then
			return math.floor(arg_24_1)
		end

		if var_24_0 > 0.999 then
			return math.ceil(arg_24_1)
		end
	end

	return arg_24_1
end

function cfg_0_7_0.interp(arg_25_0, arg_25_1, arg_25_2, arg_25_3)
	arg_25_3 = arg_25_3 or cfg_0_7_0.linear

	if type(arg_25_1) == "boolean" then
		arg_25_1 = arg_25_1 and 1 or 0
	end

	return cfg_0_7_0.solve(arg_25_3, arg_25_0, arg_25_1, empty_0_6_0.get_clock(), arg_25_2)
end

empty_0_8_0 = {}
bit_band = bit.band
bit_bor = bit.bor
bit_bxor = bit.bxor
bit_lshift = bit.lshift
bit_rshift = bit.rshift
bit_bnot = bit.bnot
cfg_0_15_4 = {
	1116352408,
	1899447441,
	3049323471,
	3921009573,
	961987163,
	1508970993,
	2453635748,
	2870763221,
	3624381080,
	310598401,
	607225278,
	1426881987,
	1925078388,
	2162078206,
	2614888103,
	3248222580,
	3835390401,
	4022224774,
	264347078,
	604807628,
	770255983,
	1249150122,
	1555081692,
	1996064986,
	2554220882,
	2821834349,
	2952996808,
	3210313671,
	3336571891,
	3584528711,
	113926993,
	338241895,
	666307205,
	773529912,
	1294757372,
	1396182291,
	1695183700,
	1986661051,
	2177026350,
	2456956037,
	2730485921,
	2820302411,
	3259730800,
	3345764771,
	3516065817,
	3600352804,
	4094571909,
	275423344,
	430227734,
	506948616,
	659060556,
	883997877,
	958139571,
	1322822218,
	1537002063,
	1747873779,
	1955562222,
	2024104815,
	2227730452,
	2361852424,
	2428436474,
	2756734187,
	3204031479,
	3329325298
}

function func_0_16_5(...)
	local var_26_0 = 0

	for iter_26_0 = 1, select("#", ...) do
		var_26_0 = (var_26_0 + select(iter_26_0, ...)) % 4294967296
	end

	return var_26_0
end

function func_0_17_6(arg_27_0, arg_27_1)
	return string.char(bit_band(bit_rshift(arg_27_0, 24), 255), bit_band(bit_rshift(arg_27_0, 16), 255), bit_band(bit_rshift(arg_27_0, 8), 255), bit_band(arg_27_0, 255), bit_band(bit_rshift(arg_27_1, 24), 255), bit_band(bit_rshift(arg_27_1, 16), 255), bit_band(bit_rshift(arg_27_1, 8), 255), bit_band(arg_27_1, 255))
end

function func_0_18_7(arg_28_0, arg_28_1, arg_28_2, arg_28_3)
	return bit_lshift(arg_28_0, 24) + bit_lshift(arg_28_1, 16) + bit_lshift(arg_28_2, 8) + arg_28_3
end

function func_0_19_8(arg_29_0, arg_29_1)
	return bit_bor(bit_rshift(arg_29_0, arg_29_1), bit_lshift(bit_band(arg_29_0, bit_rshift(4294967295, 32 - arg_29_1)), 32 - arg_29_1))
end

function func_0_20_9(arg_30_0, arg_30_1, arg_30_2)
	return bit_bxor(bit_band(arg_30_0, arg_30_1), bit_band(bit_bnot(arg_30_0), arg_30_2))
end

function func_0_21_11(arg_31_0, arg_31_1, arg_31_2)
	return bit_bxor(bit_bxor(bit_band(arg_31_0, arg_31_1), bit_band(arg_31_0, arg_31_2)), bit_band(arg_31_1, arg_31_2))
end

function func_0_22_11(arg_32_0)
	return bit_bxor(bit_bxor(func_0_19_8(arg_32_0, 2), func_0_19_8(arg_32_0, 13)), func_0_19_8(arg_32_0, 22))
end

function func_0_23_13(arg_33_0)
	return bit_bxor(bit_bxor(func_0_19_8(arg_33_0, 6), func_0_19_8(arg_33_0, 11)), func_0_19_8(arg_33_0, 25))
end

function func_0_24_17(arg_34_0)
	return bit_bxor(bit_bxor(func_0_19_8(arg_34_0, 7), func_0_19_8(arg_34_0, 18)), bit_rshift(arg_34_0, 3))
end

function func_0_25_19(arg_35_0)
	return bit_bxor(bit_bxor(func_0_19_8(arg_35_0, 17), func_0_19_8(arg_35_0, 19)), bit_rshift(arg_35_0, 10))
end

function empty_0_8_0.hash(arg_36_0)
	local var_36_0 = {
		1779033703,
		3144134277,
		1013904242,
		2773480762,
		1359893119,
		2600822924,
		528734635,
		1541459225
	}
	local var_36_1 = #arg_36_0
	local var_36_2 = var_36_1 * 8

	arg_36_0 = string.format("%s%s", arg_36_0, string.char(128))

	local var_36_3 = 64 - (var_36_1 + 9) % 64

	if var_36_3 == 64 then
		var_36_3 = 0
	end

	arg_36_0 = string.format("%s%s", arg_36_0, string.rep(string.char(0), var_36_3))

	local var_36_4 = math.floor(var_36_2 / 4294967296)
	local var_36_5 = var_36_2 % 4294967296

	arg_36_0 = string.format("%s%s", arg_36_0, func_0_17_6(var_36_4, var_36_5))

	for iter_36_0 = 1, #arg_36_0, 64 do
		local var_36_6 = arg_36_0:sub(iter_36_0, iter_36_0 + 63)
		local var_36_7 = {}

		for iter_36_1 = 0, 15 do
			local var_36_8 = iter_36_1 * 4 + 1

			var_36_7[iter_36_1] = func_0_18_7(var_36_6:byte(var_36_8, var_36_8 + 3))
		end

		for iter_36_2 = 16, 63 do
			var_36_7[iter_36_2] = func_0_16_5(func_0_25_19(var_36_7[iter_36_2 - 2]), var_36_7[iter_36_2 - 7], func_0_24_17(var_36_7[iter_36_2 - 15]), var_36_7[iter_36_2 - 16])
		end

		local var_36_9 = var_36_0[1]
		local var_36_10 = var_36_0[2]
		local var_36_11 = var_36_0[3]
		local var_36_12 = var_36_0[4]
		local var_36_13 = var_36_0[5]
		local var_36_14 = var_36_0[6]
		local var_36_15 = var_36_0[7]
		local var_36_16 = var_36_0[8]

		for iter_36_3 = 0, 63 do
			local var_36_17 = func_0_16_5(var_36_16, func_0_23_13(var_36_13), func_0_20_9(var_36_13, var_36_14, var_36_15), cfg_0_15_4[iter_36_3 + 1], var_36_7[iter_36_3])
			local var_36_18 = func_0_16_5(func_0_22_11(var_36_9), func_0_21_11(var_36_9, var_36_10, var_36_11))

			var_36_16 = var_36_15
			var_36_15 = var_36_14
			var_36_14 = var_36_13
			var_36_13 = func_0_16_5(var_36_12, var_36_17)
			var_36_12 = var_36_11
			var_36_11 = var_36_10
			var_36_10 = var_36_9
			var_36_9 = func_0_16_5(var_36_17, var_36_18)
		end

		var_36_0[1] = func_0_16_5(var_36_0[1], var_36_9)
		var_36_0[2] = func_0_16_5(var_36_0[2], var_36_10)
		var_36_0[3] = func_0_16_5(var_36_0[3], var_36_11)
		var_36_0[4] = func_0_16_5(var_36_0[4], var_36_12)
		var_36_0[5] = func_0_16_5(var_36_0[5], var_36_13)
		var_36_0[6] = func_0_16_5(var_36_0[6], var_36_14)
		var_36_0[7] = func_0_16_5(var_36_0[7], var_36_15)
		var_36_0[8] = func_0_16_5(var_36_0[8], var_36_16)
	end

	local var_36_19 = ""

	for iter_36_4 = 1, 8 do
		var_36_19 = var_36_19 .. string.format("%08x", var_36_0[iter_36_4])
	end

	return var_36_19
end

empty_0_9_0 = {}
empty_0_10_1 = {}
empty_0_11_2 = {}
flag_0_12_2 = false
flag_0_13_3 = false
cfg_0_14_5 = {
	Separator = ui.get_style("Separator"),
	["Active Text"] = ui.get_style("Active Text"),
	["Link Active"] = ui.get_style("Link Active")
}

function empty_0_9_0.on_update(arg_37_0)
	for iter_37_0 = 1, #empty_0_10_1 do
		local var_37_0 = empty_0_10_1[iter_37_0]

		var_37_0.callback(unpack(var_37_0.args))
	end
end

function empty_0_9_0.on_complete(arg_38_0)
	for iter_38_0 = 1, #empty_0_11_2 do
		local var_38_0 = empty_0_11_2[iter_38_0]

		var_38_0.callback(unpack(var_38_0.args))
	end
end

function empty_0_9_0.add_complete(arg_39_0, arg_39_1, ...)
	local var_39_0 = {
		callback = arg_39_1,
		args = {
			...
		}
	}

	empty_0_11_2[#empty_0_11_2 + 1] = var_39_0

	return arg_39_1
end

function empty_0_9_0.listener(arg_40_0)
	local var_40_0 = false
	local var_40_1 = false

	for iter_40_0, iter_40_1 in pairs(cfg_0_14_5) do
		local var_40_2 = ui.get_style(iter_40_0)

		if flag_0_13_3 and not flag_0_12_2 and var_40_2 == iter_40_1 then
			var_40_1 = true
		end

		if var_40_2 ~= iter_40_1 then
			cfg_0_14_5[iter_40_0] = var_40_2
			var_40_0 = true
			var_40_1 = false
		end
	end

	if var_40_0 then
		empty_0_9_0:on_update()
	end

	if var_40_1 then
		empty_0_9_0:on_complete()
	end

	flag_0_13_3 = flag_0_12_2
	flag_0_12_2 = var_40_0
end

events.render(empty_0_9_0.listener)

empty_0_10_0 = {}
empty_0_10_0.delta_time = 0
empty_0_10_0.screen_size = vector()
empty_0_10_0.mouse_pos = vector()
empty_0_10_0.mouse_pos_prev = vector()
empty_0_10_0.mouse_delta = vector()
empty_0_10_0.mouse_down = {}
empty_0_10_0.mouse_down_duration = {}
empty_0_10_0.mouse_clicked = {}
empty_0_10_0.mouse_clicked_pos = {}
empty_0_10_0.mouse_drag_max_delta_sqr = {}

for iter_0_0 = 1, 4 do
	empty_0_10_0.mouse_down[iter_0_0] = false
	empty_0_10_0.mouse_down_duration[iter_0_0] = 0
	empty_0_10_0.mouse_clicked[iter_0_0] = false
	empty_0_10_0.mouse_clicked_pos[iter_0_0] = vector()
	empty_0_10_0.mouse_drag_max_delta_sqr[iter_0_0] = 0
end

function empty_0_10_0.update_user_display(arg_41_0)
	arg_41_0.delta_time = globals.frametime
	arg_41_0.screen_size = render.screen_size()
end

function empty_0_10_0.update_mouse_inputs(arg_42_0)
	local var_42_0 = ui.get_mouse_position()

	arg_42_0.mouse_pos = var_42_0
	arg_42_0.mouse_delta = arg_42_0.mouse_pos - arg_42_0.mouse_pos_prev
	arg_42_0.mouse_pos_prev = arg_42_0.mouse_pos

	for iter_42_0 = 1, 4 do
		arg_42_0.mouse_down[iter_42_0] = common.is_button_down(iter_42_0)
		arg_42_0.mouse_clicked[iter_42_0] = arg_42_0.mouse_down[iter_42_0] and arg_42_0.mouse_down_duration[iter_42_0] < 0
		arg_42_0.mouse_down_duration[iter_42_0] = arg_42_0.mouse_down[iter_42_0] and (arg_42_0.mouse_down_duration[iter_42_0] < 0 and 0 or arg_42_0.mouse_down_duration[iter_42_0] + arg_42_0.delta_time) or -1

		if arg_42_0.mouse_clicked[iter_42_0] then
			arg_42_0.mouse_clicked_pos[iter_42_0] = arg_42_0.mouse_pos
			arg_42_0.mouse_drag_max_delta_sqr[iter_42_0] = 0
		else
			local var_42_1 = var_42_0 - arg_42_0.mouse_clicked_pos[iter_42_0]

			arg_42_0.mouse_drag_max_delta_sqr[iter_42_0] = math.max(arg_42_0.mouse_drag_max_delta_sqr[iter_42_0], var_42_1:lengthsqr())
		end
	end
end

function empty_0_10_0.on_render(arg_43_0)
	arg_43_0:update_user_display()
	arg_43_0:update_mouse_inputs()
end

unused_0_11_1 = nil
empty_0_11_0 = {}
empty_0_12_1 = {}
unused_0_13_2 = nil
unused_0_14_3 = nil
ui_tab_Windows = ui.create("Windows"):visibility(false)

function apply_ui_config(arg_44_0)
	local var_44_0, var_44_1 = pcall(json.parse, arg_44_0)

	if not var_44_0 then
		return nil
	end

	return var_44_1
end

cfg_0_17_5 = {
	mouse_pos = vector(),
	mouse_pos_prev = vector()
}
cfg_0_17_5.mouse_down = false
cfg_0_17_5.mouse_clicked = false
cfg_0_17_5.mouse_down_duration = 0
cfg_0_17_5.mouse_delta = vector()
cfg_0_17_5.mouse_clicked_pos = vector()

function cfg_0_17_5.update_mouse_inputs()
	local var_45_0 = globals.frametime
	local var_45_1 = ui.get_mouse_position()
	local var_45_2 = common.is_button_down(1)

	cfg_0_17_5.mouse_pos_prev = cfg_0_17_5.mouse_pos
	cfg_0_17_5.mouse_pos = var_45_1
	cfg_0_17_5.mouse_delta = cfg_0_17_5.mouse_pos - cfg_0_17_5.mouse_pos_prev
	cfg_0_17_5.mouse_down = var_45_2
	cfg_0_17_5.mouse_clicked = var_45_2 and cfg_0_17_5.mouse_down_duration < 0
	cfg_0_17_5.mouse_down_duration = var_45_2 and (cfg_0_17_5.mouse_down_duration < 0 and 0 or cfg_0_17_5.mouse_down_duration + var_45_0) or -1

	if cfg_0_17_5.mouse_clicked then
		cfg_0_17_5.mouse_clicked_pos = cfg_0_17_5.mouse_pos
	end
end

empty_0_18_6 = {}
empty_0_18_6.__index = empty_0_18_6

function empty_0_18_6.__new(arg_46_0, arg_46_1, arg_46_2)
	if type(arg_46_2) ~= "table" then
		arg_46_2 = {}
	end

	return setmetatable({
		is_active = true,
		is_hovered = false,
		item = ui_tab_Windows:value(arg_46_1, ""),
		is_clamped = arg_46_2.clamped == true,
		pos = vector(),
		size = vector(),
		anchor = vector()
	}, arg_46_0)
end

function empty_0_18_6.get_pos(arg_47_0)
	return arg_47_0.pos
end

function empty_0_18_6.set_pos(arg_48_0, arg_48_1)
	local var_48_0 = render.screen_size()
	local var_48_1 = arg_48_1:clone()

	if arg_48_0.is_clamped then
		var_48_1.x = math.clamp(var_48_1.x, 0, var_48_0.x - arg_48_0.size.x)
		var_48_1.y = math.clamp(var_48_1.y, 0, var_48_0.y - arg_48_0.size.y)
	end

	if arg_48_0.pos ~= var_48_1 then
		arg_48_0.item:set(json.stringify({
			x = var_48_1.x + arg_48_0.size.x * arg_48_0.anchor.x,
			y = var_48_1.y + arg_48_0.size.y * arg_48_0.anchor.y
		}))
	end

	arg_48_0.pos = var_48_1

	return arg_48_0
end

function empty_0_18_6.get_size(arg_49_0)
	return arg_49_0.size
end

function empty_0_18_6.set_size(arg_50_0, arg_50_1)
	local var_50_0 = arg_50_1 - arg_50_0.size
	local var_50_1 = arg_50_0.pos - var_50_0 * arg_50_0.anchor

	arg_50_0.size = arg_50_1

	arg_50_0:set_pos(var_50_1)

	return arg_50_0
end

function empty_0_18_6.get_anchor(arg_51_0)
	return arg_51_0.anchor
end

function empty_0_18_6.set_anchor(arg_52_0, arg_52_1)
	arg_52_0.anchor.x = arg_52_1.x
	arg_52_0.anchor.y = arg_52_1.y

	return arg_52_0
end

function empty_0_18_6.build(arg_53_0)
	local var_53_0 = arg_53_0.item:get()
	local var_53_1 = apply_ui_config(var_53_0)

	if var_53_1 ~= nil and var_53_1.x ~= nil and var_53_1.y ~= nil then
		arg_53_0.pos = vector(var_53_1.x, var_53_1.y)
	end

	table.insert(empty_0_12_1, arg_53_0)

	return arg_53_0
end

function empty_0_18_6.update(arg_54_0)
	arg_54_0.is_active = true

	return arg_54_0
end

function on_createmove(arg_55_0, arg_55_1, arg_55_2)
	return arg_55_0.x >= arg_55_1.x and arg_55_0.x <= arg_55_2.x and arg_55_0.y >= arg_55_1.y and arg_55_0.y <= arg_55_2.y
end

function on_createmove_2()
	local var_56_0

	if ui.get_alpha() > 0 then
		for iter_56_0 = 1, #empty_0_12_1 do
			local var_56_1 = empty_0_12_1[iter_56_0]
			local var_56_2 = var_56_1.pos
			local var_56_3 = var_56_1.size

			if not var_56_1.is_active then
				-- block empty
			elseif not on_createmove(cfg_0_17_5.mouse_pos, var_56_2, var_56_2 + var_56_3) then
				-- block empty
			else
				var_56_0 = var_56_1
			end
		end
	end

	unused_0_13_2 = var_56_0
end

function on_createmove_3()
	if not cfg_0_17_5.mouse_down then
		unused_0_14_3 = nil

		return
	end

	if cfg_0_17_5.mouse_clicked and unused_0_13_2 ~= nil then
		unused_0_14_3 = unused_0_13_2
	end
end

function on_createmove_4()
	for iter_58_0 = 1, #empty_0_12_1 do
		local var_58_0 = empty_0_12_1[iter_58_0]

		var_58_0.is_dragged = false
		var_58_0.is_hovered = false
	end
end

function on_createmove_5()
	if unused_0_13_2 == nil then
		return
	end

	unused_0_13_2.is_hovered = true
end

function on_createmove_9()
	if unused_0_14_3 == nil then
		return
	end

	local var_60_0 = unused_0_14_3.pos + cfg_0_17_5.mouse_delta

	unused_0_14_3:set_pos(var_60_0)

	unused_0_14_3.is_dragged = true
end

function render_func()
	for iter_61_0 = 1, #empty_0_12_1 do
		empty_0_12_1[iter_61_0].is_active = false
	end
end

function render_func_2()
	cfg_0_17_5.update_mouse_inputs()
	on_createmove_2()
	on_createmove_3()
	on_createmove_4()
	on_createmove_5()
	on_createmove_9()
	render_func()
end

function render_func_3(arg_63_0)
	if not (unused_0_14_3 ~= nil or unused_0_13_2 ~= nil) then
		return
	end

	arg_63_0.in_attack = false
	arg_63_0.in_attack2 = false
end

function empty_0_11_0.new(arg_64_0, arg_64_1)
	return empty_0_18_6:__new(arg_64_0, arg_64_1)
end

events.render(render_func_2)
events.createmove(render_func_3)

empty_0_12_0 = {}
var_0_13_1 = ui.get_style()
var_0_14_2 = "\a" .. var_0_13_1["Link Active"]:to_hex()
var_0_15_2 = "\a" .. var_0_13_1["Small Text"]:to_hex()
var_0_16_3 = "\a" .. color(251, 41, 75):to_hex()
ref_0_17_4 = empty_0_6_0.merge(var_0_14_2, "phantom", "\aDEFAULT")
ref_0_18_5 = empty_0_6_0.merge(var_0_15_2, " · ", "\aDEFAULT")

function empty_0_12_0.success(...)
	local var_65_0 = empty_0_6_0.merge(...)

	cvar.playvol:call("ui/beepclear.wav", 1)
	print_raw(ref_0_17_4 .. ref_0_18_5 .. var_65_0)
end

function empty_0_12_0.error(...)
	local var_66_0 = empty_0_6_0.merge(var_0_16_3, ...)

	cvar.playvol:call("resource/warning.wav", 1)
	print_raw(ref_0_17_4 .. ref_0_18_5 .. var_66_0)
end

empty_0_13_0 = {}
unused_0_14_1 = nil
var_0_15_1 = "https://raw.githubusercontent.com/blameless1337/phantom/refs/heads/main/last.png"
var_0_16_2 = "nl\\phantom"
ref_0_17_3 = var_0_16_2 .. "\\last.png"
var_0_18_4 = files.read(ref_0_17_3)

if var_0_18_4 == nil then
	var_0_19_6 = network.get(var_0_15_1)

	files.create_folder(var_0_16_2)
	files.write(ref_0_17_3, var_0_19_6, true)

	var_0_18_4 = var_0_19_6
end

if var_0_18_4 ~= nil then
	empty_0_13_0.logo = render.load_image_from_file(ref_0_17_3, vector(1076, 1748))
end

function ui_callback(arg_67_0, arg_67_1)
	local var_67_0 = arg_67_0:get()

	if #var_67_0 == 0 then
		if arg_67_1 == nil then
			if arg_67_0.type == "selectable" then
				arg_67_1 = arg_67_0:list()
			elseif arg_67_0:type() == "listable" then
				arg_67_1 = {}

				for iter_67_0 = 1, #arg_67_0.list do
					arg_67_1[iter_67_0] = iter_67_0
				end
			end
		end

		var_67_0 = arg_67_1

		arg_67_0:set(arg_67_1)
	end

	arg_67_0:set_callback(function()
		local var_68_0 = arg_67_0:get()

		if #var_68_0 > 0 then
			var_67_0 = var_68_0
		else
			arg_67_0:set(var_67_0)
		end
	end)
end

empty_0_15_0 = {}
cfg_0_16_1 = {
	[1] = "T",
	[2] = "CT"
}
cfg_0_17_2 = {
	"Shared",
	"Standing",
	"Moving",
	"Walking",
	"Crouching",
	"Sneaking",
	"Air",
	"Air Crouching"
}
empty_0_18_3 = {}

function config_api()
	local var_69_0 = ui.get_style()
	local var_69_1 = var_69_0["Link Active"]
	local var_69_2 = var_69_0["Text Preview"]
	local var_69_3 = globals.realtime
	local var_69_4 = cfg_0_7_0.wave(empty_0_4_0.name, var_69_1, var_69_2, var_69_3)
	local var_69_5 = string.format("%s", var_69_4)

	ui.sidebar(var_69_5, empty_0_4_0.icon)
end

events.render(config_api)

empty_0_19_4 = {}
empty_0_15_0.home = empty_0_19_4
ref_0_20_7 = empty_0_6_0.icon_title("ghost")
empty_0_19_4.group_presets = ui.create(ref_0_20_7, "##Configurations", 1)
empty_0_19_4.group_userscripts = ui.create(ref_0_20_7, "##Welcome, " .. empty_0_4_0.username, 2)
empty_0_19_4.group_usersection = ui.create(ref_0_20_7, "##User Info", 2)
empty_0_19_4.group_userconfig = ui.create(ref_0_20_7, "##User Configs", 2)
empty_0_19_4.group_socials = ui.create(ref_0_20_7, "##Links", 2)
empty_0_21_9 = {}
empty_0_15_0.home.presets = empty_0_21_9
empty_0_21_9.list = empty_0_19_4.group_presets:list("##1", {
	"List is empty"
})
empty_0_21_9.input = empty_0_19_4.group_presets:input("")
empty_0_21_9.import_button = empty_0_19_4.group_presets:button(empty_0_6_0.icon_title_ex("DEFAULT", "download", "", 6, 6), nil, true):tooltip("·  Import current settings.\n\n·  Please note that the settings will be imported into the current configuration, not the selected preset.")
empty_0_21_9.export_button = empty_0_19_4.group_presets:button(empty_0_6_0.icon_title_ex("DEFAULT", "file", "", 6, 6), nil, true):tooltip("·  Export current settings.\n\n·  Please note that the settings will be exported from the current configuration, not the selected preset.")
empty_0_21_9.delete_button = empty_0_19_4.group_presets:button(empty_0_6_0.icon_title_ex("C12332FF", "trash-xmark", "", 6, 7), nil, true):tooltip("·  Delete preset.")
empty_0_21_9.save_button = empty_0_19_4.group_presets:button(empty_0_6_0.icon_title("floppy-disk", "Save" .. empty_0_6_0.get_space(6), 6, 6), nil, true):tooltip("·  Save/Create preset.")
empty_0_21_9.load_button = empty_0_19_4.group_presets:button(empty_0_6_0.icon_title("toggle-large-on", "Load" .. empty_0_6_0.get_space(6), 6, 6), nil, true):tooltip("·  Load preset.")
empty_0_21_9.cancel = empty_0_19_4.group_presets:button(empty_0_6_0.icon_title_ex("C12332FF", "xmark", "Cancel" .. empty_0_6_0.get_space(30), 30, 8), nil, true):disabled(true)
empty_0_21_9.confirm = empty_0_19_4.group_presets:button(empty_0_6_0.icon_title("check", "Confirm" .. empty_0_6_0.get_space(25), 25, 8), nil, true):disabled(true)
empty_0_22_9 = {}
empty_0_15_0.home.user_section = empty_0_22_9
empty_0_23_11 = {}
empty_0_22_9.user_info = empty_0_23_11

function config_api_3()
	local var_70_0 = string.format("%s\a%s ・ \a%s%s", "User", "DEFAULT", "{Link Active}", empty_0_4_0.username)

	return empty_0_6_0.icon_title("user", var_70_0, 4, 12)
end

function config_api_6()
	local var_71_0 = string.format("%s\a%s ・ \a%s%s", "Script Build", "DEFAULT", "{Link Active}", empty_0_4_0.build)

	return empty_0_6_0.icon_title("egg", var_71_0, 4, 12)
end

empty_0_23_11.nickname = empty_0_19_4.group_usersection:label(config_api_3())
empty_0_24_14 = {}
empty_0_22_9.user_configs = empty_0_24_14

function config_api_5()
	local var_72_0 = string.format("%s\a%s ・ \a%s%s", "Config", "DEFAULT", "{Link Active}", common.get_config_name())

	return empty_0_6_0.icon_title("folder-open", var_72_0, 4, 12)
end

function config_api_9()
	local var_73_0 = string.format("%s\a%s ・ \a%s%s", "Author", "DEFAULT", "{Link Active}", common.get_config_author())

	return empty_0_6_0.icon_title("arrow-turn-down-right", var_73_0, 11, 12)
end

empty_0_24_14.config_name = empty_0_19_4.group_userconfig:label(config_api_5())
empty_0_24_14.config_author = empty_0_19_4.group_userconfig:label(config_api_9())
empty_0_25_15 = {}
empty_0_22_9.socials = empty_0_25_15
empty_0_25_15.label = empty_0_19_4.group_socials:label(empty_0_6_0.icon_title("podcast", "Socials", 3, 11))
empty_0_25_15.discord = empty_0_19_4.group_socials:button(empty_0_6_0.icon_title("discord"), function()
	empty_0_6_0.link("https://discord.gg/NtkEWZnR7v")
end, true):tooltip("·  Join to discord server")
empty_0_25_15.telegram = empty_0_19_4.group_socials:button(empty_0_6_0.icon_title("youtube"), function()
	empty_0_6_0.link("https://www.youtube.com/@berserk1333")
end, true):tooltip("·  Youtube channel: berserk1333")
empty_0_20_6 = {}
empty_0_15_0.antiaim = empty_0_20_6
ref_0_21_8 = empty_0_6_0.icon_title("shield")
empty_0_20_6.group_conditions = ui.create(ref_0_21_8, "##Conditions", 1)
empty_0_20_6.group_state_enabled = ui.create(ref_0_21_8, "##StateEnabled", 2)
empty_0_20_6.group_tweaks = ui.create(ref_0_21_8, "##Tweaks", 1)
empty_0_22_8 = {}
empty_0_20_6.condition = empty_0_22_8
empty_0_22_8.team = empty_0_20_6.group_conditions:list("##Team", {
	empty_0_6_0.icon_title("land-mine-on", "T", 3, 11),
	empty_0_6_0.icon_title("wrench", "CT", 3, 11)
})
empty_0_22_8.list = empty_0_20_6.group_conditions:list("##Conditions", {
	empty_0_6_0.icon_title("share-nodes", cfg_0_17_2[1], 3, 11),
	empty_0_6_0.icon_title("person", cfg_0_17_2[2], 4, 13),
	empty_0_6_0.icon_title("person-running", cfg_0_17_2[3], 3, 11),
	empty_0_6_0.icon_title("person-walking", cfg_0_17_2[4], 5, 13),
	empty_0_6_0.icon_title("person-seat", cfg_0_17_2[5], 4, 11),
	empty_0_6_0.icon_title("wheelchair", cfg_0_17_2[6], 2, 10),
	empty_0_6_0.icon_title("person-snowboarding", cfg_0_17_2[7], 2, 11),
	empty_0_6_0.icon_title("person-sledding", cfg_0_17_2[8], 2, 11)
})
empty_0_22_8.about = empty_0_20_6.group_conditions:label(empty_0_6_0.icon_title("circle-info", "Select the team/condition for setup.", 5, 11))
empty_0_23_10 = {}
empty_0_20_6.builder = empty_0_23_10

function func_0_24_13(arg_76_0)
	cfg_76_1_0 = {
		pitch = arg_76_0:combo(empty_0_6_0.icon_title("arrows-from-dotted-line", "Pitch", 4, 13), cfg_0_5_0.antiaim.angles.pitch:list()),
		yaw = arg_76_0:combo(empty_0_6_0.icon_title("arrows-repeat", "Yaw", 3, 13), {
			"Disabled",
			"Left & Right",
			"Static"
		})
	}
	ref_76_2_0 = cfg_76_1_0.yaw:create()
	cfg_76_1_0.yaw_pages = ref_76_2_0:combo(empty_0_6_0.icon_title("page-caret-down", "Page", 5, 12), {
		"Main",
		"Delay"
	})
	cfg_76_1_0.yaw_base = ref_76_2_0:combo(empty_0_6_0.icon_title("compass", "Base", 3, 11), cfg_0_5_0.antiaim.angles.yaw_base:list())
	cfg_76_1_0.yaw_offset = ref_76_2_0:slider(empty_0_6_0.icon_title("chart-line-up", "Offset", 3, 11), -180, 180, 0, 1, "°")
	cfg_76_1_0.yaw_offset_left = ref_76_2_0:slider(empty_0_6_0.icon_title("arrow-left", "Offset Left", 4, 12), -180, 180, 0, 1, "°")
	cfg_76_1_0.yaw_offset_right = ref_76_2_0:slider(empty_0_6_0.icon_title("arrow-right", "Offset Right", 4, 12), -180, 180, 0, 1, "°")
	cfg_76_1_0.yaw_random = ref_76_2_0:slider(empty_0_6_0.icon_title("shuffle", "Randomization", 3, 11), 0, 100, 0, 1, function(arg_77_0)
		if arg_77_0 == 0 then
			return "Off"
		end

		return arg_77_0 .. "%"
	end)
	cfg_76_1_0.yaw_delay_type = ref_76_2_0:combo(empty_0_6_0.icon_title("shuffle", "Delay type", 3, 11), {
		"Default",
		"Left/Right"
	})
	cfg_76_1_0.yaw_delay = ref_76_2_0:slider(empty_0_6_0.icon_title("clock-twelve", "Delay", 3, 11), 1, 14, 0, 1, function(arg_78_0)
		if arg_78_0 == 1 then
			return "Off"
		end

		return arg_78_0 .. "t"
	end)
	cfg_76_1_0.yaw_delay_second = ref_76_2_0:slider(empty_0_6_0.icon_title("clock-six-thirty", "Delay Second", 3, 11), 0, 14, 0, 1, function(arg_79_0)
		if arg_79_0 == 0 then
			return "Off"
		end

		return arg_79_0 .. "t"
	end)
	cfg_76_1_0.yaw_delay_left = ref_76_2_0:slider(empty_0_6_0.icon_title("arrow-left", "Left delay", 4, 12), 1, 14, 0, 1, function(arg_80_0)
		if arg_80_0 == 1 then
			return "Off"
		end

		return arg_80_0 .. "t"
	end)
	cfg_76_1_0.yaw_delay_right = ref_76_2_0:slider(empty_0_6_0.icon_title("arrow-right", "Right delay", 4, 12), 1, 14, 0, 1, function(arg_81_0)
		if arg_81_0 == 1 then
			return "Off"
		end

		return arg_81_0 .. "t"
	end)
	cfg_76_1_0.yaw_delay_ticks_random = ref_76_2_0:slider(empty_0_6_0.icon_title("shuffle", "Random Ticks", 3, 11), 0, 14, 0, 1, function(arg_82_0)
		if arg_82_0 == 0 then
			return "Off"
		end

		return arg_82_0 .. "t"
	end)
	unused_76_3_0 = nil

	function update_visibility_14(arg_83_0)
		local var_83_0 = arg_83_0:get()

		cfg_76_1_0.yaw_delay_second:visibility(var_83_0 ~= 1)
		cfg_76_1_0.yaw_delay_ticks_random:visibility(var_83_0 ~= 1)
	end

	function update_visibility_15()
		local var_84_0 = cfg_76_1_0.yaw:get()
		local var_84_1 = cfg_76_1_0.yaw_pages:get()
		local var_84_2 = cfg_76_1_0.yaw_delay_type:get()
		local var_84_3 = var_84_0 == "Static"
		local var_84_4 = var_84_0 == "Left & Right"

		if not var_84_4 then
			cfg_76_1_0.yaw_pages:visibility(false)
		else
			cfg_76_1_0.yaw_pages:visibility(true)
		end

		if var_84_4 and var_84_1 == "Delay" then
			cfg_76_1_0.yaw_delay_type:visibility(true)

			if var_84_2 == "Default" then
				cfg_76_1_0.yaw_delay:set_callback(update_visibility_14, true)
				cfg_76_1_0.yaw_delay_left:visibility(false)
				cfg_76_1_0.yaw_delay_right:visibility(false)
			else
				cfg_76_1_0.yaw_delay:unset_callback(update_visibility_14)
				cfg_76_1_0.yaw_delay_second:visibility(false)
				cfg_76_1_0.yaw_delay_left:visibility(true)
				cfg_76_1_0.yaw_delay_right:visibility(true)
				cfg_76_1_0.yaw_delay_ticks_random:visibility(true)
			end
		end

		if not var_84_4 or var_84_1 ~= "Delay" then
			cfg_76_1_0.yaw_delay:unset_callback(update_visibility_14)
			cfg_76_1_0.yaw_delay_type:visibility(false)
			cfg_76_1_0.yaw_delay_second:visibility(false)
			cfg_76_1_0.yaw_delay_ticks_random:visibility(false)
			cfg_76_1_0.yaw_delay_left:visibility(false)
			cfg_76_1_0.yaw_delay_right:visibility(false)
		end

		if var_84_4 and var_84_1 ~= "Main" then
			cfg_76_1_0.yaw_base:visibility(false)
		else
			cfg_76_1_0.yaw_base:visibility(true)
		end

		cfg_76_1_0.yaw_offset:visibility(var_84_3)
		cfg_76_1_0.yaw_offset_left:visibility(var_84_4 and var_84_1 == "Main")
		cfg_76_1_0.yaw_offset_right:visibility(var_84_4 and var_84_1 == "Main")
		cfg_76_1_0.yaw_random:visibility(var_84_3 or var_84_4 and var_84_1 == "Main")
		cfg_76_1_0.yaw_delay:visibility(var_84_4 and var_84_1 == "Delay" and var_84_2 == "Default")
	end

	cfg_76_1_0.yaw:set_callback(update_visibility_15, true)
	cfg_76_1_0.yaw_pages:set_callback(update_visibility_15, true)
	cfg_76_1_0.yaw_delay_type:set_callback(update_visibility_15, true)

	cfg_76_1_0.yaw_modifier = arg_76_0:combo(empty_0_6_0.icon_title("arrows-repeat-1", "Modifier", 3, 12), {
		"Disabled",
		"Offset",
		"Center",
		"Skitter",
		"Spin",
		"Random",
		"3-Way",
		"5-Way"
	})
	cfg_76_1_0.modifier_offset = cfg_76_1_0.yaw_modifier:create():slider(empty_0_6_0.icon_title("chart-line-up", "Offset", 3, 11), -180, 180, 0, 1, "°")
	cfg_76_1_0.body_yaw = arg_76_0:switch(empty_0_6_0.icon_title("layer-group", "Body Yaw", 3, 12))
	ref_76_4_0 = cfg_76_1_0.body_yaw:create()
	cfg_76_1_0.body_limit_left = ref_76_4_0:slider(empty_0_6_0.icon_title("arrow-left-to-line", "Limit Left", 4, 12), 0, 60, 60, 1, "°")
	cfg_76_1_0.body_limit_random_left = ref_76_4_0:slider(empty_0_6_0.icon_title("arrow-left-to-line", "Random Left", 4, 12), 0, 60, 0, 1, "°")
	cfg_76_1_0.body_limit_right = ref_76_4_0:slider(empty_0_6_0.icon_title("arrow-right-to-line", "Limit Right", 4, 12), 0, 60, 60, 1, "°")
	cfg_76_1_0.body_limit_random_right = ref_76_4_0:slider(empty_0_6_0.icon_title("arrow-right-to-line", "Random Right", 4, 12), 0, 60, 0, 1, "°")
	cfg_76_1_0.body_inverter = ref_76_4_0:switch(empty_0_6_0.icon_title("toggle-large-on", "Inverter", 2, 10))
	cfg_76_1_0.body_freestanding = ref_76_4_0:combo(empty_0_6_0.icon_title("repeat", "Freestanding", 3, 11), cfg_0_5_0.antiaim.angles.body_freestanding:list())
	cfg_76_1_0.body_yaw_options = arg_76_0:selectable(empty_0_6_0.icon_title("arrow-turn-down-right", "Options", 11, 12), {
		"Jitter",
		"Avoid Overlap",
		"Anti Bruteforce"
	})
	cfg_76_1_0.body_random_jitter = cfg_76_1_0.body_yaw_options:create():switch(empty_0_6_0.icon_title("shuffle", "Randomize Jitter", 3, 11))
	unused_76_6_1 = nil

	function update_visibility_16(arg_85_0)
		local var_85_0 = arg_85_0

		cfg_76_1_0.body_random_jitter:visibility(var_85_0:get("Jitter"))
		cfg_76_1_0.body_inverter:visibility(not var_85_0:get("Jitter"))
	end

	cfg_76_1_0.body_yaw_options:set_callback(update_visibility_16, true)

	cfg_76_1_0.roll = arg_76_0:slider(empty_0_6_0.icon_title_ex(empty_0_6_0.insecure, "clone", "Roll", 3, 12), -45, 45, 0)
	ref_76_6_0 = cfg_76_1_0.roll:create()
	cfg_76_1_0.change_on_fakelag = ref_76_6_0:switch(empty_0_6_0.icon_title("arrow-up-arrow-down", "Change on fakelag", 4, 12))
	cfg_76_1_0.roll_fakelag = ref_76_6_0:slider(empty_0_6_0.icon_title_ex(empty_0_6_0.insecure, "clone", "Roll", 3, 12), -45, 45, 0)
	unused_76_7_1 = nil

	function update_visibility_18(arg_86_0)
		cfg_76_1_0.roll_fakelag:visibility(arg_86_0:get())
	end

	cfg_76_1_0.change_on_fakelag:set_callback(update_visibility_18, true)

	unused_76_7_0 = nil

	function update_visibility_17(arg_87_0)
		local var_87_0 = arg_87_0:get()

		cfg_76_1_0.yaw_modifier:visibility(var_87_0 ~= "Disabled")
	end

	function update_visibility_19(arg_88_0)
		local var_88_0 = arg_88_0:get()

		cfg_76_1_0.body_yaw_options:visibility(var_88_0 ~= false)
	end

	cfg_76_1_0.yaw:set_callback(update_visibility_17, true)
	cfg_76_1_0.body_yaw:set_callback(update_visibility_19, true)

	return cfg_76_1_0
end

function update_visibility(arg_89_0)
	cfg_89_1_0 = {
		force_break_lc = arg_89_0:switch("Force Break LC")
	}
	cfg_89_1_0.on_exploit = cfg_89_1_0.force_break_lc:create():selectable("Enable On", {
		"Double Tap",
		"Hide Shots"
	})

	ui_callback(cfg_89_1_0.on_exploit, "Double Tap")

	cfg_89_1_0.type = arg_89_0:combo("Type", {
		"Disabled",
		"Default",
		"Flick"
	})
	cfg_89_3_0 = {
		pitch = arg_89_0:combo("Pitch", {
			"Disabled",
			"Static",
			"Jitter",
			"Spin",
			"Random"
		})
	}
	ref_89_4_1 = cfg_89_3_0.pitch:create()
	cfg_89_3_0.pitch_offset = ref_89_4_1:slider("Offset", -89, 89, 0, nil, "°")
	cfg_89_3_0.pitch_offset_from = ref_89_4_1:slider("From Offset", -89, 89, 0, nil, "°")
	cfg_89_3_0.pitch_offset_to = ref_89_4_1:slider("To Offset", -89, 89, 0, nil, "°")
	cfg_89_3_0.pitch_speed = ref_89_4_1:slider("Speed", -50, 50, 20, 0.1)
	unused_89_5_3 = nil

	function update_visibility_21(arg_90_0)
		local var_90_0 = arg_90_0:get()
		local var_90_1 = var_90_0 == "Jitter"
		local var_90_2 = var_90_0 == "Spin"
		local var_90_3 = var_90_0 == "Random"
		local var_90_4 = var_90_0 ~= "Disabled" and not var_90_1 and not var_90_2 and not var_90_3
		local var_90_5 = var_90_1 or var_90_2 or var_90_3

		cfg_89_3_0.pitch_offset:visibility(var_90_4)
		cfg_89_3_0.pitch_offset_from:visibility(var_90_5)
		cfg_89_3_0.pitch_offset_to:visibility(var_90_5)
		cfg_89_3_0.pitch_speed:visibility(var_90_2)
	end

	cfg_89_3_0.pitch:set_callback(update_visibility_21, true)

	cfg_89_3_0.yaw = arg_89_0:combo("Yaw", {
		"Disabled",
		"Static",
		"Side-base",
		"Spin",
		"Random",
		"Left/Right"
	})
	ref_89_5_2 = cfg_89_3_0.yaw:create()
	cfg_89_3_0.yaw_offset = ref_89_5_2:slider("Offset", -180, 180, 0, nil, "°")
	cfg_89_3_0.yaw_left = ref_89_5_2:slider("Left Offset", -180, 180, 0, nil, "°")
	cfg_89_3_0.yaw_right = ref_89_5_2:slider("Right Offset", -180, 180, 0, nil, "°")
	cfg_89_3_0.yaw_speed = ref_89_5_2:slider("Speed", -50, 50, 20, 0.1)
	unused_89_6_3 = nil

	function update_visibility_24(arg_91_0)
		local var_91_0 = arg_91_0:get()
		local var_91_1 = var_91_0 == "Left/Right"
		local var_91_2 = var_91_0 == "Spin"
		local var_91_3 = var_91_0 == "Random"
		local var_91_4 = var_91_0 ~= "Disabled" and not var_91_1 and not var_91_2 and not var_91_3
		local var_91_5 = var_91_1 or var_91_2 or var_91_3

		cfg_89_3_0.yaw_offset:visibility(var_91_4)
		cfg_89_3_0.yaw_left:visibility(var_91_5)
		cfg_89_3_0.yaw_right:visibility(var_91_5)
		cfg_89_3_0.yaw_speed:visibility(var_91_2)
	end

	cfg_89_3_0.yaw:set_callback(update_visibility_24, true)

	cfg_89_1_0.default = cfg_89_3_0
	cfg_89_4_0 = {
		pitch = arg_89_0:combo("Pitch", {
			"Disabled",
			"Static",
			"Jitter",
			"Spin",
			"Random"
		})
	}
	ref_89_5_1 = cfg_89_4_0.pitch:create()
	cfg_89_4_0.pitch_offset = ref_89_5_1:slider("Offset", -89, 89, 0, nil, "°")
	cfg_89_4_0.pitch_offset_from = ref_89_5_1:slider("From Offset", -89, 89, 0, nil, "°")
	cfg_89_4_0.pitch_offset_to = ref_89_5_1:slider("To Offset", -89, 89, 0, nil, "°")
	cfg_89_4_0.pitch_speed = ref_89_5_1:slider("Speed", -50, 50, 20, 0.1)
	unused_89_6_2 = nil

	function update_visibility_23(arg_92_0)
		local var_92_0 = arg_92_0:get()
		local var_92_1 = var_92_0 == "Jitter"
		local var_92_2 = var_92_0 == "Spin"
		local var_92_3 = var_92_0 == "Random"
		local var_92_4 = var_92_0 ~= "Disabled" and not var_92_1 and not var_92_2 and not var_92_3
		local var_92_5 = var_92_1 or var_92_2 or var_92_3

		cfg_89_4_0.pitch_offset:visibility(var_92_4)
		cfg_89_4_0.pitch_offset_from:visibility(var_92_5)
		cfg_89_4_0.pitch_offset_to:visibility(var_92_5)
		cfg_89_4_0.pitch_speed:visibility(var_92_2)
	end

	cfg_89_4_0.pitch:set_callback(update_visibility_23, true)

	cfg_89_4_0.yaw = arg_89_0:combo("Yaw", {
		"Disabled",
		"Static",
		"Side-base",
		"Spin",
		"Random",
		"Left/Right"
	})
	ref_89_6_1 = cfg_89_4_0.yaw:create()
	cfg_89_4_0.yaw_offset = ref_89_6_1:slider("Offset", -180, 180, 0, nil, "°")
	cfg_89_4_0.yaw_left = ref_89_6_1:slider("Left Offset", -180, 180, 0, nil, "°")
	cfg_89_4_0.yaw_right = ref_89_6_1:slider("Right Offset", -180, 180, 0, nil, "°")
	cfg_89_4_0.yaw_speed = ref_89_6_1:slider("Speed", -50, 50, 20, 0.1)
	unused_89_7_1 = nil

	function update_visibility_25(arg_93_0)
		local var_93_0 = arg_93_0:get()
		local var_93_1 = var_93_0 == "Left/Right"
		local var_93_2 = var_93_0 == "Spin"
		local var_93_3 = var_93_0 == "Random"
		local var_93_4 = var_93_0 ~= "Disabled" and not var_93_1 and not var_93_2 and not var_93_3
		local var_93_5 = var_93_1 or var_93_2 or var_93_3

		cfg_89_4_0.yaw_offset:visibility(var_93_4)
		cfg_89_4_0.yaw_left:visibility(var_93_5)
		cfg_89_4_0.yaw_right:visibility(var_93_5)
		cfg_89_4_0.yaw_speed:visibility(var_93_2)
	end

	cfg_89_4_0.yaw:set_callback(update_visibility_25, true)

	cfg_89_4_0.speed = arg_89_0:slider("Speed", 2, 10, 7)
	cfg_89_4_0.speed_random = cfg_89_4_0.speed:create():slider("Speed Random", 0, 8, 0)
	cfg_89_1_0.flick = cfg_89_4_0
	unused_89_5_0 = nil

	function update_visibility_20(arg_94_0)
		local var_94_0 = arg_94_0:get()

		if var_94_0 == nil then
			return
		end

		cfg_89_1_0.default.pitch:visibility(var_94_0 ~= "Disabled" and var_94_0 ~= "Flick")
		cfg_89_1_0.default.yaw:visibility(var_94_0 ~= "Disabled" and var_94_0 ~= "Flick")
		cfg_89_1_0.flick.pitch:visibility(var_94_0 ~= "Disabled" and var_94_0 ~= "Default")
		cfg_89_1_0.flick.yaw:visibility(var_94_0 ~= "Disabled" and var_94_0 ~= "Default")
		cfg_89_1_0.flick.speed:visibility(var_94_0 ~= "Disabled" and var_94_0 ~= "Default")
		cfg_89_1_0.flick.speed_random:visibility(var_94_0 ~= "Disabled" and var_94_0 ~= "Default")
	end

	function update_visibility_22(arg_95_0)
		local var_95_0 = arg_95_0:get()

		if var_95_0 == nil then
			return
		end

		if var_95_0 then
			cfg_89_1_0.type:visibility(true)
			cfg_89_1_0.type:set_callback(update_visibility_20, true)
		else
			cfg_89_1_0.type:visibility(false)
			cfg_89_1_0.type:unset_callback(update_visibility_20)
		end

		if not var_95_0 then
			cfg_89_1_0.default.pitch:visibility(false)
			cfg_89_1_0.default.yaw:visibility(false)
			cfg_89_1_0.flick.pitch:visibility(false)
			cfg_89_1_0.flick.yaw:visibility(false)
			cfg_89_1_0.flick.speed:visibility(false)
			cfg_89_1_0.flick.speed_random:visibility(false)
		end
	end

	cfg_89_1_0.force_break_lc:set_callback(update_visibility_22, true)

	return cfg_89_1_0
end

function func_0_26_19(arg_96_0, arg_96_1)
	local var_96_0 = {}
	local var_96_1 = arg_96_0 .. arg_96_1
	local var_96_2 = ui.create(ref_0_21_8, "##BUILDER_" .. var_96_1, 2)
	local var_96_3 = ui.create(ref_0_21_8, "##DEFENSIVE_" .. var_96_1, 2)

	if arg_96_1 ~= "Shared" then
		var_96_0.enabled = empty_0_20_6.group_state_enabled:switch(empty_0_6_0.icon_title("toggle-large-on", "Enabled##" .. var_96_1, 2, 10))
	end

	var_96_0.angles = func_0_24_13(var_96_2)
	var_96_0.defensive = update_visibility(var_96_3)
	var_96_0.groups = {
		angles = var_96_2,
		defensive = var_96_3
	}

	return var_96_0
end

for iter_0_1 = 1, #cfg_0_16_1 do
	ref_0_31_27 = cfg_0_16_1[iter_0_1]
	empty_0_32_29 = {}

	for iter_0_2 = 1, #cfg_0_17_2 do
		ref_0_37_26 = cfg_0_17_2[iter_0_2]
		empty_0_32_29[ref_0_37_26] = func_0_26_19(ref_0_31_27, ref_0_37_26)
	end

	empty_0_23_10[ref_0_31_27] = empty_0_32_29
end

var_0_27_24 = ui.create(ref_0_21_8, "##SEND_TEAM", 2)

function update_visibility_4(arg_97_0)
	local var_97_0 = {}

	for iter_97_0, iter_97_1 in pairs(arg_97_0) do
		if type(iter_97_1) == "table" then
			var_97_0[iter_97_0] = update_visibility_4(iter_97_1)
		elseif type(iter_97_1.get) == "function" then
			var_97_0[iter_97_0] = {
				iter_97_1:get()
			}
		end
	end

	return var_97_0
end

function update_visibility_7(arg_98_0, arg_98_1)
	for iter_98_0, iter_98_1 in pairs(arg_98_1) do
		local var_98_0 = arg_98_0[iter_98_0]

		if type(var_98_0) == "table" then
			update_visibility_7(var_98_0, iter_98_1)
		elseif type(var_98_0.set) == "function" then
			pcall(var_98_0.set, var_98_0, unpack(iter_98_1))
		end
	end
end

function update_visibility_12()
	local var_99_0 = cfg_0_16_1[empty_0_22_8.team:get()]
	local var_99_1 = cfg_0_17_2[empty_0_22_8.list:get()]
	local var_99_2 = var_99_0 == cfg_0_16_1[1] and cfg_0_16_1[2] or cfg_0_16_1[1]
	local var_99_3 = empty_0_23_10[var_99_0][var_99_1]
	local var_99_4 = empty_0_23_10[var_99_2][var_99_1]

	update_visibility_7(var_99_4, update_visibility_4(var_99_3))
end

ref_0_31_26 = empty_0_6_0.icon_button("arrow-up-right-from-square", "Send to another team", 50, 10)

var_0_27_24:button(ref_0_31_26, update_visibility_12, true)

unused_0_28_25 = nil

function update_visibility_6()
	local var_100_0 = cfg_0_16_1[empty_0_22_8.team:get()]
	local var_100_1 = cfg_0_17_2[empty_0_22_8.list:get()]

	for iter_100_0 = 1, #cfg_0_16_1 do
		local var_100_2 = cfg_0_16_1[iter_100_0]

		for iter_100_1 = 1, #cfg_0_17_2 do
			local var_100_3 = cfg_0_17_2[iter_100_1]
			local var_100_4 = empty_0_23_10[var_100_2]

			if var_100_4 == nil then
				-- block empty
			else
				local var_100_5 = var_100_4[var_100_3]

				if var_100_5 == nil then
					-- block empty
				else
					local var_100_6 = var_100_0 == var_100_2 and var_100_1 == var_100_3

					if var_100_5.enabled ~= nil then
						var_100_5.enabled:visibility(var_100_6)

						if not var_100_5.enabled:get() then
							var_100_6 = false
						end
					end

					if var_100_5.groups ~= nil then
						for iter_100_2, iter_100_3 in pairs(var_100_5.groups) do
							iter_100_3:visibility(var_100_6)
						end
					end
				end
			end
		end
	end
end

for iter_0_3 = 1, #cfg_0_16_1 do
	ref_0_34_34 = cfg_0_16_1[iter_0_3]

	for iter_0_4 = 1, #cfg_0_17_2 do
		ref_0_39_21 = cfg_0_17_2[iter_0_4]
		ref_0_40_17 = empty_0_23_10[ref_0_34_34]

		if ref_0_40_17 == nil then
			-- block empty
		else
			ref_0_41_13 = ref_0_40_17[ref_0_39_21]

			if ref_0_41_13 == nil then
				-- block empty
			elseif ref_0_41_13.enabled ~= nil then
				ref_0_41_13.enabled:set_callback(update_visibility_6)
			end
		end
	end
end

empty_0_22_8.team:set_callback(update_visibility_6)
empty_0_22_8.list:set_callback(update_visibility_6)
update_visibility_6()

empty_0_24_12 = {}
empty_0_20_6.tweaks = empty_0_24_12
empty_0_24_12.options = empty_0_20_6.group_tweaks:label("Tweaks")
ref_0_25_13 = empty_0_24_12.options:create()
empty_0_24_12.avoid_backstab = ref_0_25_13:switch("Avoid Backstab")
empty_0_24_12.edge_yaw = ref_0_25_13:switch("Edge Yaw")
empty_0_24_12.manuals = ref_0_25_13:combo("Manual Yaw", {
	"Disabled",
	"Left",
	"Right",
	"Forward"
})
empty_0_24_12.static_manual = ref_0_25_13:switch("Static manuals")
empty_0_24_12.safe_head = ref_0_25_13:selectable("Safe Head", {
	"Standing",
	"Crouch",
	"Air Crouch Knife",
	"Taser in Air"
})
empty_0_24_12.warmup_aa = ref_0_25_13:selectable("Warmup AA", {
	"No enemies",
	"Warmup"
})
empty_0_24_12.warmup_aa_speed = ref_0_25_13:slider("Spin speed", 1, 100, 50, 1, "t")
unused_0_26_18 = nil

function update_visibility_2(arg_101_0)
	if arg_101_0:get("No enemies") or arg_101_0:get("Warmup") then
		empty_0_24_12.warmup_aa_speed:visibility(true)
	else
		empty_0_24_12.warmup_aa_speed:visibility(false)
	end
end

empty_0_24_12.warmup_aa:set_callback(update_visibility_2, true)

empty_0_25_12 = {}
empty_0_20_6.animation_breaker = empty_0_25_12
empty_0_25_12.enabled = empty_0_20_6.group_tweaks:switch("Animation Breaker")
ref_0_26_17 = empty_0_25_12.enabled:create()
empty_0_25_12.list = ref_0_26_17:list("##Mode", {
	"Off",
	"Default",
	"Delta",
	"Renewed"
})
empty_0_25_12.jitter = ref_0_26_17:slider("Jitter", 0, 100, 0, 1, function(arg_102_0)
	return arg_102_0 == 0 and "Default" or arg_102_0 .. "%"
end)
empty_0_25_12.legs_delta = ref_0_26_17:slider("Legs Delta 1", 0, 100, 0, 1, function(arg_103_0)
	return arg_103_0 == 0 and "Default" or arg_103_0 .. "%"
end)
empty_0_25_12.legs_delta_2 = ref_0_26_17:slider("Legs Delta 2", 0, 100, 0, 1, function(arg_104_0)
	return arg_104_0 == 0 and "Default" or arg_104_0 .. "%"
end)
empty_0_25_12.from = ref_0_26_17:slider("From", 0, 100, 0, 1, function(arg_105_0)
	return arg_105_0 == 0 and "Default" or arg_105_0 .. "%"
end)
empty_0_25_12.to = ref_0_26_17:slider("To", 0, 100, 0, 0.1, function(arg_106_0)
	return arg_106_0 == 0 and "Default" or arg_106_0 .. "%"
end)
empty_0_25_12.falling = ref_0_26_17:slider("Falling", 0, 100, 0, 1, function(arg_107_0)
	return arg_107_0 == 0 and "Default" or arg_107_0 .. "%"
end)
empty_0_25_12.leaning = ref_0_26_17:slider("Leaning", 0, 100, 0, 1, function(arg_108_0)
	return arg_108_0 == 0 and "NL" or arg_108_0 .. "%"
end)
unused_0_27_22 = nil

function update_visibility_3(arg_109_0)
	local var_109_0 = arg_109_0:get()

	if var_109_0 == 3 then
		empty_0_25_12.jitter:visibility(false)
		empty_0_25_12.legs_delta:visibility(true)
		empty_0_25_12.legs_delta_2:visibility(true)
		empty_0_25_12.from:visibility(false)
		empty_0_25_12.to:visibility(false)
	elseif var_109_0 == 4 then
		empty_0_25_12.jitter:visibility(false)
		empty_0_25_12.from:visibility(true)
		empty_0_25_12.to:visibility(true)
		empty_0_25_12.legs_delta:visibility(false)
		empty_0_25_12.legs_delta_2:visibility(false)
	elseif var_109_0 == 2 then
		empty_0_25_12.jitter:visibility(true)
		empty_0_25_12.from:visibility(false)
		empty_0_25_12.to:visibility(false)
		empty_0_25_12.legs_delta:visibility(false)
		empty_0_25_12.legs_delta_2:visibility(false)
	else
		empty_0_25_12.jitter:visibility(false)
		empty_0_25_12.from:visibility(false)
		empty_0_25_12.to:visibility(false)
		empty_0_25_12.legs_delta:visibility(false)
		empty_0_25_12.legs_delta_2:visibility(false)
	end
end

empty_0_25_12.list:set_callback(update_visibility_3, true)

empty_0_26_16 = {}
empty_0_20_6.freestanding = empty_0_26_16
empty_0_26_16.enabled = empty_0_20_6.group_tweaks:switch("Freestanding")
ref_0_27_21 = empty_0_26_16.enabled:create()
empty_0_26_16.disablers = ref_0_27_21:selectable("Disablers", cfg_0_17_2)
empty_0_26_16.enablers = ref_0_27_21:selectable("Enablers", cfg_0_17_2)
empty_0_26_16.body_yaw = ref_0_27_21:combo("Body Yaw", {
	"Disabled",
	"Static",
	"Jitter"
})
empty_0_21_7 = {}
empty_0_15_0.misc = empty_0_21_7
ref_0_22_7 = empty_0_6_0.icon_title("gears")
empty_0_21_7.group_ragebot = ui.create(ref_0_22_7, "Ragebot", 1)
empty_0_21_7.group_changers = ui.create(ref_0_22_7, "Changers", 2)
empty_0_21_7.group_miscellaneous = ui.create(ref_0_22_7, "Misc", 1)
empty_0_21_7.group_visuals = ui.create(ref_0_22_7, "Visuals", 2)
empty_0_23_9 = {}
empty_0_21_7.ragebot = empty_0_23_9
empty_0_24_11 = {}
empty_0_23_9.ai_peek = empty_0_24_11
empty_0_24_11.enabled = empty_0_21_7.group_ragebot:switch(empty_0_6_0.icon_title("microchip-ai", "Ai Peek", 4, 11))
ref_0_25_11 = empty_0_24_11.enabled:create()
empty_0_24_11.hitboxes = ref_0_25_11:selectable(empty_0_6_0.icon_title("list-radio", "Hitboxes", 2, 12), {
	"Head",
	"Chest",
	"Stomach",
	"Arms",
	"Legs"
})
empty_0_24_11.weapons = ref_0_25_11:selectable(empty_0_6_0.icon_title("gun", "Weapon", 2, 11), {
	"SSG-08",
	"Desert-Eagle",
	"Pistols"
})
empty_0_24_11.hitchance = ref_0_25_11:slider(empty_0_6_0.icon_title("dice", "Hit Chance", 1, 11), 0, 100, 30, 1, function(arg_110_0)
	if arg_110_0 == 0 then
		return "Auto"
	end

	return string.format("%s%%", arg_110_0)
end)
empty_0_24_11.simulation = ref_0_25_11:slider(empty_0_6_0.icon_title("clock", "Simulation", 3, 11), 25, 35, 30, 0.01, "s")
empty_0_24_11.rate_limit = ref_0_25_11:slider(empty_0_6_0.icon_title("wave-pulse", "Rate Limit", 2, 9), 0, 30, 3, 0.01, "s")
empty_0_24_11.color = ref_0_25_11:color_picker(empty_0_6_0.icon_title("palette", "Visualize Color", 3, 12), color())
unused_0_26_15 = nil
ref_0_27_20 = empty_0_24_11.hitboxes:get()

function ui_callback_4(arg_111_0)
	local var_111_0 = arg_111_0:get()

	if #var_111_0 > 0 then
		ref_0_27_20 = var_111_0
	else
		empty_0_24_11.hitboxes:set(ref_0_27_20)
	end
end

if #ref_0_27_20 == 0 then
	ref_0_27_20 = {
		"Head",
		"Chest",
		"Stomach"
	}

	empty_0_24_11.hitboxes:set(ref_0_27_20)
end

empty_0_24_11.hitboxes:set_callback(ui_callback_4, true)

empty_0_25_10 = {}
empty_0_23_9.hitchance_override = empty_0_25_10
empty_0_25_10.enabled = empty_0_21_7.group_ragebot:switch(empty_0_6_0.icon_title("gun-slash", "Hitchance Override", 2, 8))
ref_0_26_14 = empty_0_25_10.enabled:create()
cfg_0_27_19 = {
	"AutoSnipers",
	"AWP",
	"SSG-08"
}
empty_0_25_10.weapon = ref_0_26_14:list("##weapons", cfg_0_27_19)
empty_0_28_22 = {}
empty_0_25_10.options = empty_0_28_22

for iter_0_5 = 1, #cfg_0_27_19 do
	ref_0_33_31 = cfg_0_27_19[iter_0_5]
	cfg_0_34_33 = {
		modifiers = ref_0_26_14:selectable(empty_0_6_0.icon_title("gear", "Modifiers##" .. iter_0_5, 3, 11), {
			"No Scope",
			"In Air"
		}),
		distance = ref_0_26_14:slider(empty_0_6_0.icon_title("arrows-left-right", "Distance##" .. iter_0_5, 3, 11), 40, 201, 100, 0.1, function(arg_112_0)
			if arg_112_0 == 201 then
				return "Inf"
			end

			return string.format("%.1fm", arg_112_0 * 0.1)
		end),
		ns_hitchance = ref_0_26_14:slider(empty_0_6_0.icon_title("location-crosshairs-slash", "No Scope##" .. iter_0_5, 2, 8), 0, 100, 50, 1, "%"),
		air_hitchance = ref_0_26_14:slider(empty_0_6_0.icon_title("wind", "In Air##" .. iter_0_5, 3, 11), 0, 100, 50, 1, "%")
	}
	empty_0_25_10.options[ref_0_33_31] = cfg_0_34_33
end

unused_0_29_26 = nil

function update_visibility_11()
	local var_113_0 = empty_0_25_10.weapon:get()

	for iter_113_0 = 1, #cfg_0_27_19 do
		local var_113_1 = cfg_0_27_19[iter_113_0]
		local var_113_2 = var_113_0 == iter_113_0
		local var_113_3 = empty_0_28_22[var_113_1]
		local var_113_4 = var_113_3.modifiers:get("No Scope")
		local var_113_5 = var_113_3.modifiers:get("In Air")

		var_113_3.modifiers:visibility(var_113_2)
		var_113_3.distance:visibility(var_113_2 and var_113_4)
		var_113_3.ns_hitchance:visibility(var_113_2 and var_113_4)
		var_113_3.air_hitchance:visibility(var_113_2 and var_113_5)
	end
end

for iter_0_6 = 1, #cfg_0_27_19 do
	empty_0_28_22[cfg_0_27_19[iter_0_6]].modifiers:set_callback(update_visibility_11)
end

empty_0_25_10.weapon:set_callback(update_visibility_11, true)

empty_0_26_13 = {}
empty_0_23_9.dormant_aimbot = empty_0_26_13
empty_0_26_13.enabled = empty_0_21_7.group_ragebot:switch(empty_0_6_0.icon_title("eye-low-vision", "Dormant Aimbot", 2, 8))
ref_0_27_18 = empty_0_26_13.enabled:create()
empty_0_26_13.hitbox = ref_0_27_18:selectable(empty_0_6_0.icon_title("boxes-stacked", "Hitboxes", 2, 10), {
	"Head",
	"Chest",
	"Stomach",
	"Legs"
})
empty_0_26_13.accuracy = ref_0_27_18:slider(empty_0_6_0.icon_title("arrow-down-short-wide", "Accuracy", 2, 10), 30, 100, 90, 1, function(arg_114_0)
	if arg_114_0 == 30 then
		return "Inf."
	end

	return string.format("%d%%", arg_114_0)
end)
empty_0_26_13.damage = ref_0_27_18:slider(empty_0_6_0.icon_title("arrow-up-short-wide", "Min. Damage", 2, 10), 0, 100, 10, 1, function(arg_115_0)
	if arg_115_0 == 0 then
		return "Auto"
	end

	return arg_115_0
end)
unused_0_28_21 = nil
ref_0_29_25 = empty_0_26_13.hitbox:get()

function ui_callback_5(arg_116_0)
	local var_116_0 = arg_116_0:get()

	if #var_116_0 > 0 then
		ref_0_29_25 = var_116_0
	else
		empty_0_26_13.hitbox:set(ref_0_29_25)
	end
end

if #ref_0_29_25 == 0 then
	ref_0_29_25 = {
		"Head",
		"Chest",
		"Stomach"
	}

	empty_0_26_13.hitbox:set(ref_0_29_25)
end

empty_0_26_13.hitbox:set_callback(ui_callback_5, true)

empty_0_27_17 = {}
empty_0_23_9.fake_latency = empty_0_27_17
empty_0_27_17.enabled = empty_0_21_7.group_ragebot:switch(empty_0_6_0.icon_title("diagram-project", "Fake Latency", 3, 9))
ref_0_28_20 = empty_0_27_17.enabled:create()
empty_0_27_17.value = ref_0_28_20:slider(empty_0_6_0.icon_title("up-down", "Value", 7, 15), 0, 200, 0, 1, "ms")
empty_0_24_10 = {}
empty_0_21_7.changers = empty_0_24_10
empty_0_25_9 = {}
empty_0_24_10.aspect_ratio = empty_0_25_9
empty_0_25_9.enabled = empty_0_21_7.group_changers:switch(empty_0_6_0.icon_title("desktop", "Aspect Ratio", 3, 10))
ref_0_26_12 = empty_0_25_9.enabled:create()
cfg_0_27_16 = {
	"5:4",
	"4:3",
	"16:10",
	"16:9"
}
cfg_0_28_19 = {
	["16:10"] = 160,
	["5:4"] = 125,
	["4:3"] = 133,
	["16:9"] = 177
}
empty_0_29_24 = {}

for iter_0_7 = 1, #cfg_0_27_16 do
	ref_0_34_31 = cfg_0_27_16[iter_0_7]
	empty_0_29_24[cfg_0_28_19[ref_0_34_31]] = ref_0_34_31
end

function apply_ui_config_2(arg_117_0)
	if arg_117_0 == 0 then
		return "Off"
	end

	return empty_0_29_24[arg_117_0]
end

empty_0_25_9.proportion = ref_0_26_12:slider(empty_0_6_0.icon_title("up-down", "Value", 7, 15), 0, 200, 0, 0.01, apply_ui_config_2)

for iter_0_8 = 1, #cfg_0_27_16 do
	ref_0_35_29 = cfg_0_27_16[iter_0_8]
	ref_0_36_25 = cfg_0_28_19[ref_0_35_29]

	function apply_ui_config_3()
		empty_0_25_9.proportion:set(ref_0_36_25)
	end

	ref_0_26_12:button(empty_0_6_0.icon_title("", "" .. ref_0_35_29 .. empty_0_6_0.get_space(11), 12), apply_ui_config_3, true)
end

empty_0_26_11 = {}
empty_0_24_10.viewmodel = empty_0_26_11
empty_0_26_11.enabled = empty_0_21_7.group_changers:switch(empty_0_6_0.icon_title("hands", "Viewmodel", 3, 12))
ref_0_27_15 = empty_0_26_11.enabled:create()
empty_0_26_11.fov = ref_0_27_15:slider(empty_0_6_0.icon_title("arrows-maximize", "FOV", 4, 12), 0, 1000, tonumber(cvar.viewmodel_fov:string()) * 10, 0.1)
empty_0_26_11.x = ref_0_27_15:slider(empty_0_6_0.icon_title("arrows-left-right", "X", 3, 11), -100, 100, tonumber(cvar.viewmodel_offset_x:string()) * 10, 0.1)
empty_0_26_11.y = ref_0_27_15:slider(empty_0_6_0.icon_title("arrow-up-right-and-arrow-down-left-from-center", "Y", 3, 11), -100, 100, tonumber(cvar.viewmodel_offset_y:string()) * 10, 0.1)
empty_0_26_11.z = ref_0_27_15:slider(empty_0_6_0.icon_title("arrow-down-arrow-up", "Z", 4, 12), -100, 100, tonumber(cvar.viewmodel_offset_z:string()) * 10, 0.1)
empty_0_26_11.swap_knife_hand = ref_0_27_15:switch(empty_0_6_0.icon_title("fork-knife", "Swap Knife Hand", 2, 11))
empty_0_26_11.reset = ref_0_27_15:button(empty_0_6_0.icon_title("arrow-turn-down-left", "Reset", 95, 11) .. empty_0_6_0.get_space(95), nil, true)
empty_0_27_14 = {}
empty_0_24_10.keep_model_transparency = empty_0_27_14
empty_0_27_14.enabled = empty_0_21_7.group_changers:switch(empty_0_6_0.icon_title("transporter-3", "Keep Model Transparency", 4, 10))
empty_0_28_18 = {}
empty_0_24_10.game_disablers = empty_0_28_18
empty_0_28_18.options = empty_0_21_7.group_changers:selectable(empty_0_6_0.icon_title("game-board-simple", "Game Disablers", 5, 11), {
	"Fog",
	"Blood",
	"Bloom",
	"Decals",
	"Shadows",
	"Sprites",
	"Particles",
	"Ropes",
	"Dynamic lights",
	"Map details",
	"Weapon effects"
})
empty_0_25_8 = {}
empty_0_21_7.miscellaneous = empty_0_25_8
empty_0_26_10 = {}
empty_0_25_8.aimbot_logs = empty_0_26_10
empty_0_26_10.label = empty_0_21_7.group_miscellaneous:label(empty_0_6_0.icon_title("rectangle-history", "Aimbot Logs", 4, 11))
ref_0_27_13 = empty_0_26_10.label:create()
empty_0_26_10.options = ref_0_27_13:listable("##Aimbot Logs", {
	"Console",
	"Event",
	"Screen"
})
empty_0_26_10.screen_style = ref_0_27_13:combo("Screen Logs", {
	"Default",
	"Alternative",
	"Modern"
}):visibility(false)
empty_0_26_10.override_color = ref_0_27_13:switch("Override Color"):visibility(false)
empty_0_26_10.color = empty_0_26_10.override_color:color_picker({
	Hit = {
		color(160, 150, 240)
	},
	Miss = {
		color(230, 140, 140)
	}
}):visibility(false)
unused_0_28_17 = nil

function update_visibility_5(arg_119_0)
	local var_119_0 = arg_119_0:get()

	if unpack(var_119_0) ~= nil then
		empty_0_26_10.override_color:visibility(true)
	else
		empty_0_26_10.override_color:visibility(false)
	end

	if arg_119_0:get(3) then
		empty_0_26_10.screen_style:visibility(true)
	else
		empty_0_26_10.screen_style:visibility(false)
	end
end

function update_visibility_10(arg_120_0)
	if arg_120_0:get() then
		empty_0_26_10.color:visibility(true)
	else
		empty_0_26_10.color:visibility(false)
	end
end

empty_0_26_10.options:set_callback(update_visibility_5, true)
empty_0_26_10.override_color:set_callback(update_visibility_10, true)

empty_0_27_12 = {}
empty_0_25_8.exploits = empty_0_27_12
empty_0_27_12.label = empty_0_21_7.group_miscellaneous:label(empty_0_6_0.icon_title_ex(empty_0_6_0.insecure, "heart-pulse", "Exploits", 3, 9))
ref_0_28_16 = empty_0_27_12.label:create()
empty_0_27_12.type = ref_0_28_16:combo(empty_0_6_0.icon_title("bars-progress", "Type", 4, 11), {
	"Disabled",
	"Air Lag",
	"Auto Teleport"
})
empty_0_27_12.delay = ref_0_28_16:slider(empty_0_6_0.icon_title("timer", "Delay", 4, 10), 0, 16, 6, 1, "t")
unused_0_29_22 = nil

function update_visibility_9(arg_121_0)
	local var_121_0 = arg_121_0:get()

	empty_0_27_12.delay:visibility(var_121_0 ~= "Disabled" and var_121_0 ~= "Auto Teleport")
end

empty_0_27_12.type:set_callback(update_visibility_9, true)

empty_0_28_15 = {}
empty_0_25_8.movment = empty_0_28_15
empty_0_28_15.fast_ladder = empty_0_21_7.group_miscellaneous:switch(empty_0_6_0.icon_title("water-ladder", "Fast Ladder", 3, 9))
empty_0_28_15.no_fall_damage = empty_0_21_7.group_miscellaneous:switch(empty_0_6_0.icon_title("person-falling", "No Fall Damage", 5, 11))
empty_0_28_15.edge_quick_stop = empty_0_21_7.group_miscellaneous:switch(empty_0_6_0.icon_title("person-circle-exclamation", "Edge Quick Stop", 3, 9))
empty_0_29_21 = {}
empty_0_25_8.grenades = empty_0_29_21
empty_0_29_21.super_toss = empty_0_21_7.group_miscellaneous:switch(empty_0_6_0.icon_title("line-height", "Super Toss", 3, 9))
empty_0_29_21.nade_fix = empty_0_21_7.group_miscellaneous:switch(empty_0_6_0.icon_title("bomb", "Nade Fix", 4, 10))
empty_0_30_25 = {}
empty_0_25_8.clantag = empty_0_30_25
empty_0_30_25.enabled = empty_0_21_7.group_miscellaneous:switch(empty_0_6_0.icon_title("input-text", "Clantag", 2, 8))
empty_0_26_9 = {}
empty_0_21_7.visuals = empty_0_26_9
empty_0_27_11 = {}
empty_0_26_9.watermark = empty_0_27_11
empty_0_27_11.label = empty_0_21_7.group_visuals:label(empty_0_6_0.icon_title("bookmark", "Watermark", 6, 12))
ref_0_28_14 = empty_0_27_11.label:create()
empty_0_27_11.style = ref_0_28_14:list("##Watermark", {
	"Default",
	"Alternative"
})
empty_0_27_11.name = ref_0_28_14:input(empty_0_6_0.icon_title("text", "Name", 4, 12), empty_0_4_0.name):visibility(false)
empty_0_27_11.font = ref_0_28_14:combo(empty_0_6_0.icon_title("text-size", "Font", 2, 8), {
	"Default",
	"Upper",
	"Console",
	"Bold"
}):visibility(false)
empty_0_27_11.color = ref_0_28_14:color_picker(empty_0_6_0.icon_title("palette", "Color", 4, 10), {
	Solid = {
		color(255, 255, 255)
	},
	Gradient = {
		color(160, 150, 240),
		color(255, 255, 255)
	}
})
empty_0_27_11.addons = ref_0_28_14:selectable(empty_0_6_0.icon_title("gear", "Addons", 4, 10), {
	"Rainbow color",
	"Pulse"
}):visibility(false)
unused_0_29_20 = nil

function update_visibility_8(arg_122_0)
	local var_122_0 = not arg_122_0:get("Rainbow color")

	empty_0_27_11.color:visibility(var_122_0)
end

function update_visibility_13(arg_123_0)
	local var_123_0 = arg_123_0:get() == 1

	empty_0_27_11.font:visibility(var_123_0)
	empty_0_27_11.addons:visibility(var_123_0)
	empty_0_27_11.name:visibility(var_123_0)

	if var_123_0 then
		empty_0_27_11.addons:set_callback(update_visibility_8, true)
	else
		empty_0_27_11.addons:unset_callback(update_visibility_8)
		empty_0_27_11.color:visibility(var_123_0)
	end
end

empty_0_27_11.style:set_callback(update_visibility_13, true)

empty_0_28_13 = {}
empty_0_26_9.widgets = empty_0_28_13
empty_0_28_13.label = empty_0_21_7.group_visuals:label(empty_0_6_0.icon_title("window", "Widgets", 4, 11))
ref_0_29_19 = empty_0_28_13.label:create()
empty_0_28_13.select = ref_0_29_19:selectable(empty_0_6_0.icon_title("layer-group", "Elements", 4, 10), {
	"Defensive",
	"Velocity"
})
empty_0_28_13.color = ref_0_29_19:color_picker(empty_0_6_0.icon_title("palette", "Color", 4, 10), {
	Defensive = {
		color()
	},
	Velocity = {
		color()
	}
})
empty_0_29_18 = {}
empty_0_26_9.custom_scope = empty_0_29_18
empty_0_29_18.enabled = empty_0_21_7.group_visuals:switch(empty_0_6_0.icon_title("crosshairs", "Custom Scope", 4, 10))
ref_0_30_23 = empty_0_29_18.enabled:create()
empty_0_29_18.options = ref_0_30_23:selectable(empty_0_6_0.icon_title("gear", "Options", 4, 10), {
	"Inverted",
	"T Style",
	"Animation"
})
empty_0_29_18.length = ref_0_30_23:slider(empty_0_6_0.icon_title("arrows-to-dot", "Length", 4, 10), 0, 400, 100)
empty_0_29_18.offset = ref_0_30_23:slider(empty_0_6_0.icon_title("arrows-left-right", "Offset", 4, 10), 1, 50, 10)
empty_0_29_18.color = ref_0_30_23:color_picker(empty_0_6_0.icon_title("palette", "Color", 4, 10), color())
empty_0_30_22 = {}
empty_0_26_9.min_damage_indicator = empty_0_30_22
empty_0_30_22.enabled = empty_0_21_7.group_visuals:switch(empty_0_6_0.icon_title("gun", "Min. Damage Indicator", 3, 9))
ref_0_31_24 = empty_0_30_22.enabled:create()
empty_0_30_22.font = ref_0_31_24:combo(empty_0_6_0.icon_title("text-size", "Font", 2, 8), {
	"Default",
	"Small",
	"Console",
	"Bold"
})
empty_0_30_22.color = ref_0_31_24:color_picker(empty_0_6_0.icon_title("palette", "Color", 4, 10), color())
empty_0_31_23 = {}
empty_0_26_9.manual_arrows = empty_0_31_23
empty_0_31_23.enabled = empty_0_21_7.group_visuals:switch(empty_0_6_0.icon_title("arrow-right-arrow-left", "Manual Arrows", 4, 10))
ref_0_32_27 = empty_0_31_23.enabled:create()
empty_0_31_23.style = ref_0_32_27:combo("Style", {
	"Default",
	"Alternative"
})
empty_0_31_23.color = ref_0_32_27:color_picker("Color", {
	Active = {
		color(255)
	},
	Inactive = {
		color(175)
	}
})
empty_0_32_26 = {}
empty_0_26_9.hit_markers = empty_0_32_26
empty_0_32_26.select = empty_0_21_7.group_visuals:selectable(empty_0_6_0.icon_title("highlighter-line", "Hit Markers", 3, 9), {
	"Crosshair",
	"World"
})
empty_0_32_26.color = empty_0_32_26.select:color_picker({
	Crosshair = {
		color()
	},
	World = {
		color()
	}
})
empty_0_33_29 = {}
empty_0_26_9.gamesense_indicators = empty_0_33_29
empty_0_33_29.enabled = empty_0_21_7.group_visuals:switch(empty_0_6_0.icon_title("blanket", "Gamesense Indicators", 5, 11))
empty_0_34_29 = {}
empty_0_26_9.zeus_warning = empty_0_34_29
empty_0_34_29.enabled = empty_0_21_7.group_visuals:switch(empty_0_6_0.icon_title("siren-on", "Zeus Warning", 3, 8))
empty_0_16_0 = {}
var_0_17_1 = "phantom_"
empty_0_18_2 = {}

function base64_helper()
	local var_124_0 = clipboard.get()
	local var_124_1 = var_124_0:find("\x00")

	if var_124_1 ~= nil then
		var_124_0 = var_124_0:sub(1, var_124_1 - 1)
	end

	return var_124_0
end

function base64_helper_2(arg_125_0)
	local var_125_0 = {}

	for iter_125_0, iter_125_1 in pairs(arg_125_0) do
		if type(iter_125_1) ~= "table" then
			local var_125_1, var_125_2 = pcall(iter_125_1.export, iter_125_1)

			if var_125_1 and var_125_2 ~= nil then
				var_125_0[iter_125_0] = var_125_2
			end
		else
			var_125_0[iter_125_0] = base64_helper_2(iter_125_1)
		end
	end

	return var_125_0
end

function base64_helper_3(arg_126_0, arg_126_1)
	for iter_126_0, iter_126_1 in pairs(arg_126_1) do
		local var_126_0 = arg_126_0[iter_126_0]

		if type(var_126_0) ~= "table" then
			if var_126_0.import ~= nil then
				pcall(var_126_0.import, var_126_0, iter_126_1)
			end
		else
			base64_helper_3(var_126_0, iter_126_1)
		end
	end
end

function base64_helper_5(arg_127_0)
	local var_127_0, var_127_1 = pcall(json.stringify, arg_127_0)

	if not var_127_0 then
		return false, "Failed to convert config"
	end

	local var_127_2, var_127_3 = pcall(base64.encode, var_127_1)

	if not var_127_2 then
		return false, "Failed to encode config"
	end

	return true, var_0_17_1 .. var_127_3
end

function base64_helper_7(arg_128_0)
	local var_128_0 = string.match(arg_128_0, string.format("^%s(.-)$", var_0_17_1))

	if var_128_0 == nil then
		return false, "Invalid config"
	end

	local var_128_1, var_128_2 = pcall(base64.decode, var_128_0)

	if not var_128_1 then
		return false, "Failed to decode config"
	end

	local var_128_3, var_128_4 = pcall(json.parse, var_128_2)

	if not var_128_3 then
		return false, "Failed to parse config"
	end

	return true, var_128_4
end

function base64_helper_9(arg_129_0, arg_129_1)
	if type(arg_129_1) ~= "string" then
		return false, "Not supported type"
	end

	if arg_129_1 == "" then
		return false, "Config is empty"
	end

	local var_129_0, var_129_1 = base64_helper_7(arg_129_1)

	if not var_129_0 then
		return false, var_129_1
	end

	if not pcall(base64_helper_3, arg_129_0, var_129_1) then
		return false, "Data is invalid"
	end

	return true, nil
end

function empty_0_16_0.set_package(arg_130_0)
	if type(arg_130_0) ~= "table" then
		error("Invalid package")
	end

	empty_0_18_2 = arg_130_0
end

function empty_0_16_0.encode(arg_131_0)
	return base64_helper_5(arg_131_0)
end

function empty_0_16_0.decode(arg_132_0)
	return base64_helper_7(arg_132_0)
end

function empty_0_16_0.import(arg_133_0)
	if arg_133_0 == nil then
		arg_133_0 = empty_0_18_2
	end

	local var_133_0, var_133_1 = pcall(base64_helper)

	if not var_133_0 then
		return false, var_133_1
	end

	local var_133_2, var_133_3 = base64_helper_9(arg_133_0, var_133_1)
	local var_133_4 = var_133_3

	if not var_133_2 then
		return false, var_133_4
	end

	return true, nil
end

function empty_0_16_0.export_as_string(arg_134_0)
	if arg_134_0 == nil then
		arg_134_0 = empty_0_18_2
	end

	local var_134_0, var_134_1 = pcall(base64_helper_2, arg_134_0)

	if not var_134_0 then
		return false, var_134_1
	end

	local var_134_2, var_134_3 = base64_helper_5(var_134_1)

	if not var_134_2 then
		return false, var_134_3
	end

	return true, var_134_3
end

function empty_0_16_0.export(arg_135_0)
	local var_135_0, var_135_1 = empty_0_16_0.export_as_string(arg_135_0)

	if not var_135_0 then
		empty_0_12_0.error(var_135_1)

		return
	end

	clipboard.set(var_135_1)
	empty_0_12_0.success("Config exported to the clipboard")
end

function empty_0_16_0.load(arg_136_0, arg_136_1)
	if arg_136_0 == nil then
		arg_136_0 = empty_0_18_2
	end

	return base64_helper_9(arg_136_0, arg_136_1)
end

empty_0_17_0 = {}
var_0_18_1 = "phantom"
empty_0_19_2 = {}
var_0_20_4 = db[var_0_18_1] or empty_0_19_2
empty_0_21_5 = {}
empty_0_22_5 = {}
unused_0_23_7 = nil
string_match = string.match

function config_api_2(arg_137_0)
	return string_match(arg_137_0, "^()%s*$") and "" or string_match(arg_137_0, "^%s*(.*%S)")
end

function config_api_4(arg_138_0, arg_138_1, arg_138_2, arg_138_3)
	return {
		name = arg_138_1,
		author = arg_138_0,
		content = arg_138_3,
		created_at = arg_138_2,
		updated_at = arg_138_2
	}
end

function config_api_8(arg_139_0)
	local var_139_0, var_139_1 = empty_0_16_0.export_as_string()

	if not var_139_0 then
		return nil
	end

	return config_api_4(common.get_username(), arg_139_0, common.get_unixtime(), var_139_1)
end

function config_api_10(arg_140_0)
	for iter_140_0 = #empty_0_22_5, 1, -1 do
		local var_140_0 = empty_0_22_5[iter_140_0]

		if var_140_0.name == arg_140_0 then
			return var_140_0, iter_140_0
		end
	end

	return nil, -1
end

function config_api_11()
	db[var_0_18_1] = var_0_20_4
end

function empty_0_17_0.load(arg_142_0)
	arg_142_0 = config_api_2(arg_142_0)

	local var_142_0 = config_api_10(arg_142_0)

	if var_142_0 == nil or var_142_0.content == nil then
		return false, "Not found"
	end

	return empty_0_16_0.load(nil, var_142_0.content)
end

function empty_0_17_0.save(arg_143_0)
	arg_143_0 = config_api_2(arg_143_0)

	local var_143_0, var_143_1 = config_api_10(arg_143_0)

	if var_143_0 == nil then
		local var_143_2 = config_api_8(arg_143_0)

		if var_143_2 == nil then
			return false, "Failed to create new config"
		end

		var_143_0 = var_143_2

		table.insert(var_0_20_4, var_143_2)
	end

	if var_143_1 ~= -1 and var_143_1 <= #empty_0_21_5 then
		return false, "Failed to change default preset"
	end

	local var_143_3, var_143_4 = empty_0_16_0.export_as_string()

	if not var_143_3 then
		return false, "Failed to export config"
	end

	var_143_0.content = var_143_4
	var_143_0.updated_at = common.get_unixtime()

	config_api_11()

	return true, nil
end

function empty_0_17_0.delete(arg_144_0)
	arg_144_0 = config_api_2(arg_144_0)

	local var_144_0, var_144_1 = config_api_10(arg_144_0)

	if var_144_1 ~= -1 and var_144_1 <= #empty_0_21_5 then
		return false, "Can't delete default config"
	end

	local var_144_2 = var_144_1 - #empty_0_21_5

	table.remove(var_0_20_4, var_144_2)

	return true, nil
end

function empty_0_17_0.get(arg_145_0)
	return empty_0_22_5[arg_145_0]
end

function empty_0_17_0.get_list()
	local var_146_0 = #empty_0_22_5

	if var_146_0 == 0 then
		return {
			"No availabe presets"
		}
	end

	local var_146_1 = {}

	for iter_146_0 = 1, var_146_0 do
		local var_146_2 = empty_0_22_5[iter_146_0].name

		if iter_146_0 <= #empty_0_21_5 then
			var_146_2 = empty_0_6_0.icon_title_ex("DEFAULT", "lock", "\a{Small Text}•\a{Link Active}" .. empty_0_6_0.get_space(6) .. var_146_2, 4, 7)
		end

		var_146_1[iter_146_0] = var_146_2
	end

	return var_146_1
end

function empty_0_17_0.update_data()
	empty_0_22_5 = {}

	for iter_147_0 = 1, #empty_0_21_5 do
		table.insert(empty_0_22_5, empty_0_21_5[iter_147_0])
	end

	table.sort(var_0_20_4, function(arg_148_0, arg_148_1)
		return arg_148_0.name < arg_148_1.name
	end)

	for iter_147_1 = 1, #var_0_20_4 do
		table.insert(empty_0_22_5, var_0_20_4[iter_147_1])
	end
end

table.insert(empty_0_21_5, config_api_4("berserk", "berserk", -1, "phantom_eyJDVCBBaXIiOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjV9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0yN30sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6MzN9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIkNUIEFpciBDcm91Y2hpbmciOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjoxMX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjo0fSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMjN9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjQ5fSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjQsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6LTEwfX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIkNUIENyb3VjaGluZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfX19LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzYwODkwMTY4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDY1NjgwMzkzXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6NH0sXCIxODk3Mjg3NTg3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTE2fSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjozM30sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg1NTEyMDkxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjo0LFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjExfX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIkNUIE1vdmluZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfX19LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzYwODkwMTY4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDY1NjgwMzkzXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxODk3Mjg3NTg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg1NTEyMDkxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX19IiwiZGVmZW5zaXZlIjoie1wiMTQxMjc4NjUwNFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjQwODAzNTkxMTNcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMTkzNDc3MjM4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjA4OTYyNzg3OVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMyOTI4OTg5XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjcsXCI0MDUwNDgyMTUwXCI6e1wiMzQzNDg5MDUxOVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0MTI0MjY4NzYyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjU5ODA3MTY2NlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0ifSwiQ1QgU2hhcmVkIjp7ImFuZ2xlcyI6IntcIjExNzY1NDgyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNDIyMzI3NDI2XCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM5MTg5MTUyNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxNDczNjQyNDUzXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNDEyNzE1Mjk1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiNDA4MDM1OTExM1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIxOTM0NzcyMzhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMDg5NjI3ODc5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzI5Mjg5ODlcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIzNDM0ODkwNTE5XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQxMjQyNjg3NjJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTk4MDcxNjY2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9LCJDVCBTbmVha2luZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfX19LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzYwODkwMTY4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDY1NjgwMzkzXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6M30sXCIxODk3Mjg3NTg3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTE2fSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjo0NH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg1NTEyMDkxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjo0LFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOi01fX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIkNUIFN0YW5kaW5nIjp7ImFuZ2xlcyI6IntcIjExNzY1NDgyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNDIyMzI3NDI2XCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM5MTg5MTUyNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxNDczNjQyNDUzXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNDEyNzE1Mjk1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiNDA4MDM1OTExM1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIxOTM0NzcyMzhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMDg5NjI3ODc5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzI5Mjg5ODlcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIzNDM0ODkwNTE5XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQxMjQyNjg3NjJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTk4MDcxNjY2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9LCJDVCBXYWxraW5nIjp7ImFuZ2xlcyI6IntcIjExNzY1NDgyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNDIyMzI3NDI2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM5MTg5MTUyNTNcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfX19LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzYwODkwMTY4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDY1NjgwMzkzXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxODk3Mjg3NTg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg1NTEyMDkxMVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX19IiwiZGVmZW5zaXZlIjoie1wiMTQxMjc4NjUwNFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjQwODAzNTkxMTNcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMTkzNDc3MjM4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjA4OTYyNzg3OVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMyOTI4OTg5XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjcsXCI0MDUwNDgyMTUwXCI6e1wiMzQzNDg5MDUxOVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0MTI0MjY4NzYyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjU5ODA3MTY2NlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0ifSwiVCBBaXIiOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjV9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0yN30sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6MzN9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIlQgQWlyIENyb3VjaGluZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjExfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjR9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0yM30sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6NDl9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6NCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjotMTB9fX19IiwiZGVmZW5zaXZlIjoie1wiMTQxMjc4NjUwNFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjQwODAzNTkxMTNcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMTkzNDc3MjM4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjA4OTYyNzg3OVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMyOTI4OTg5XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjcsXCI0MDUwNDgyMTUwXCI6e1wiMzQzNDg5MDUxOVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0MTI0MjY4NzYyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjU5ODA3MTY2NlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0ifSwiVCBDcm91Y2hpbmciOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjR9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0xNn0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6MzN9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6NCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjoxMX19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiNDA4MDM1OTExM1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIxOTM0NzcyMzhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMDg5NjI3ODc5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzI5Mjg5ODlcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIzNDM0ODkwNTE5XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQxMjQyNjg3NjJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTk4MDcxNjY2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9LCJUIE1vdmluZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIlQgU2hhcmVkIjp7ImFuZ2xlcyI6IntcIjExNzY1NDgyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNDIyMzI3NDI2XCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM5MTg5MTUyNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxNDczNjQyNDUzXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNDEyNzE1Mjk1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjo0fSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMjd9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjQ5fSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiNDA4MDM1OTExM1wiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIxOTM0NzcyMzhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMDg5NjI3ODc5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzI5Mjg5ODlcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIzNDM0ODkwNTE5XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQxMjQyNjg3NjJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTk4MDcxNjY2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9LCJUIFNuZWFraW5nIjp7ImFuZ2xlcyI6IntcIjExNzY1NDgyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNDIyMzI3NDI2XCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM5MTg5MTUyNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxNDczNjQyNDUzXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNDEyNzE1Mjk1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjozfSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMTZ9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjQ0fSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjQsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6LTV9fX19IiwiZGVmZW5zaXZlIjoie1wiMTQxMjc4NjUwNFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjQwODAzNTkxMTNcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMTkzNDc3MjM4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjA4OTYyNzg3OVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMyOTI4OTg5XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjcsXCI0MDUwNDgyMTUwXCI6e1wiMzQzNDg5MDUxOVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0MTI0MjY4NzYyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjU5ODA3MTY2NlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0ifSwiVCBTdGFuZGluZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIlQgV2Fsa2luZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sImFudGlhaW0iOnsic3RhdGVfZW5hYmxlZCI6IntcIjEwMTk1NzY0MzFcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjExMjQ3OTQ4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTMxNjAzODkyNFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE1NTExNDM1ODFcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjE4NTUwNjAzNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjIzMDEwMDQyMTJcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIzMTI4NTI1MTc5XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzMjgzNTA3MTQ4XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzNDc5MzA4OTg0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzNTUwMzI5OTgyXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzNzA3MzQ5NVwiOntcIjI3NzY5ODM3MFwiOnRydWV9LFwiMzkzNDQ4NDc0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCI0MjQ0NjY4NjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiOTI3NDUyMzk5XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX19IiwidHdlYWtzIjoie1wiMTcxODI0Nzc3N1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTU0NjE5MzY4MFwiOntcIjI3NzY5ODM3MFwiOjJ9LFwiMTYyNDAxNTMzOVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTYyNDAxNTM0MFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjA4OTExNzExM1wiOntcIjI3NzY5ODM3MFwiOjZ9LFwiMzE1Njg5NTUxMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzUwMTk4NzMzMVwiOntcIjI3NzY5ODM3MFwiOjEwMH0sXCI0MTk5NTQ1Nzk0XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1ODYyNzkyXCI6e1wiMjc3Njk4MzcwXCI6MzJ9fX0sXCIyNTY2MTY1Mzc1XCI6e1wiMjU0MjY5MDc3XCI6W3tcIjE0Mjc4NTU4MzZcIjpmYWxzZSxcIjE3MzU3MDYxODJcIjpmYWxzZSxcIjE5MjgyMjk2MVwiOnRydWUsXCIxOTM0OTY5NzRcIjoxNjQsXCIyMDkwNTE1MDE4XCI6MSxcIjIzOTk0NDA5MDVcIjowLFwiMzMwNzA2ODM2M1wiOmZhbHNlfV0sXCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIxMjA4MTQ5NTAyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMDcxMzQ3NTI0XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI2NDQyNTIwODFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzU2NDI5Mjc4OFwiOntcIjQwNTA0ODIxNTBcIjp7XCIxNTM1OTc2NDE5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMjI1OTEzMzYzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzMzczNzk0MzUyXCI6e1wiMjc3Njk4MzcwXCI6NTB9LFwiMzU3NTY2NzA5NFwiOntcIjI3NzY5ODM3MFwiOjh9LFwiNzQ4OTA1MzY0XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTAwOTk1NjNcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fX0ifSwibWlzYyI6eyJjaGFuZ2VycyI6IntcIjI2MDk1NTk3MVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjgxNDg0MzI1MFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjM3NjIxMTI4ODNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjE5MjQ3MDEwNjFcIjpudWxsLFwiMjY2NTI5MTIyOVwiOm51bGwsXCIyODIwOTIxMjU0XCI6bnVsbCxcIjI5MTY2NTA5MTZcIjpudWxsLFwiNDYyNDIzODg0XCI6e1wiMjc3Njk4MzcwXCI6MTMzfX19LFwiMzc4MjkzOTA3MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDMyMzA0NDJcIjpudWxsLFwiMTA5NjA5MzEzOFwiOntcIjI3NzY5ODM3MFwiOjEwfSxcIjEyMjUyODA5MTdcIjp7XCIyNzc2OTgzNzBcIjoxMH0sXCIyNDU5OTIyNTg5XCI6e1wiMjc3Njk4MzcwXCI6NjAwfSxcIjI1ODM4MTA0MDhcIjp7XCIyNzc2OTgzNzBcIjotMTV9LFwiNDI3NjcyNTI1OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19fSIsIm1pc2NlbGxhbmVvdXMiOiJ7XCIxNDU1NzIwOTg1XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMjI2Nzc2MzQ4NFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjI2OTAwNjkzMThcIjp7XCI0MDUwNDgyMTUwXCI6e1wiNDE3NDYzOTM4OFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiNzA2OTM3NDQ0XCI6e1wiMjU1NjY4ODA0XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjE5MzQ1ODk4NlwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MC45NDExNzY1MzM2OTkwMzU2LFwiMTc3Njc2XCI6MC41ODgyMzUzMTg2NjA3MzYxLFwiMTc3Njg3XCI6MC42Mjc0NTEwMDI1OTc4MDg4fV19LFwiMjA4OTM1OTAwOVwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MC42NDA4ODA5NDIzNDQ2NjU1LFwiMTc3Njc2XCI6MC41NTA2MTg3Njc3MzgzNDIzLFwiMTc3Njg3XCI6MC43MjA1MjQwMTMwNDI0NX1dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMjc3Njk4MzcwXCI6dHJ1ZX0sXCI4MDAxOTc0MDJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjc3MzE4NzU3NlwiOntcIjQwNTA0ODIxNTBcIjp7XCIyMDg3ODM3NDg0XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzODUzMjg4MjExXCI6e1wiMjc3Njk4MzcwXCI6Nn19fSxcIjI5Njg0MjA4MDNcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIzMDk3NzkwNjI5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMzI5NTMzNzcwMVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjc2NzAwNDFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19IiwicmFnZWJvdCI6IntcIjI2MTUwNDIyNDhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDk3MDEwNjI2XCI6e1wiMjc3Njk4MzcwXCI6OTB9LFwiMTQ1MjQ4MjMyMFwiOntcIjI3NzY5ODM3MFwiOjd9LFwiMzk4MDM5MDYzM1wiOntcIjI3NzY5ODM3MFwiOjEwfX19LFwiMzQxNDk5NDQ2N1wiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjE1OTAxNDc4MDFcIjp7XCIyNzc2OTgzNzBcIjo3fSxcIjI3NzY3MDE2MjNcIjp7XCIyNzc2OTgzNzBcIjozMH0sXCIzNjU0MzA3ODA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzk5ODg2ODhcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMFwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCI0MTkxMTQ2MTgwXCI6e1wiMjc3Njk4MzcwXCI6M30sXCI5MzEwMTEyMDdcIjp7XCIyNzc2OTgzNzBcIjozMH19fSxcIjM3NjIxNTkyMTNcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIyNjIxOTk3ODg0XCI6e1wiMjc3Njk4MzcwXCI6MTAwfSxcIjI2MjE5OTc4ODVcIjp7XCIyNzc2OTgzNzBcIjoxMDB9LFwiMjYyMTk5Nzg4NlwiOntcIjI3NzY5ODM3MFwiOjEwMH0sXCIzMTQ4MjY1NTUwXCI6e1wiMjc3Njk4MzcwXCI6NTB9LFwiMzE0ODI2NTU1MVwiOntcIjI3NzY5ODM3MFwiOjUwfSxcIjMxNDgyNjU1NTJcIjp7XCIyNzc2OTgzNzBcIjo1MH0sXCIzNDM2OTI5MTY3XCI6e1wiMjc3Njk4MzcwXCI6NTB9LFwiMzQzNjkyOTE2OFwiOntcIjI3NzY5ODM3MFwiOjUwfSxcIjM0MzY5MjkxNjlcIjp7XCIyNzc2OTgzNzBcIjo1MH0sXCIzODc4MDI1MTkyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0Njg5NTM4NjNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ2ODk1Mzg2NFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDY4OTUzODY1XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQyNDAxMjQ3ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0NjI0MjM4ODRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSIsInZpc3VhbHMiOiJ7XCIxNTg3MTUwMDA5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMzUzNzU3NDcwMlwiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTE1OTU3MTExOFwiOntcIjI3NzY5ODM3MFwiOjIzM30sXCIxNzUzNDcwNDkyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjA0NDQ4NzE5XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjBcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjAuNTU4OTUxOTczOTE1MTAwMSxcIjE3NzY3NlwiOjAuNTU4OTUxOTczOTE1MTAwMSxcIjE3NzY4N1wiOjAuNTU4OTUxOTczOTE1MTAwMX1dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMzQ4MTU5NjczOVwiOntcIjI3NzY5ODM3MFwiOjV9fX0sXCIzNTc3NjIxMjU2XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjE3NzE5MzMyXCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjI3OTc1NTAwMTdcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjEuMCxcIjE3NzY4N1wiOjEuMH1dfSxcIjM2MTU3NzczMzZcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjAuNjg2Mjc0NTI4NTAzNDE4LFwiMTc3Njc2XCI6MC42ODYyNzQ1Mjg1MDM0MTgsXCIxNzc2ODdcIjowLjY4NjI3NDUyODUwMzQxOH1dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMjM2ODg3Nzk4XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjM4NDQ3Njk3MTZcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIzOTA2MjQzMDg5XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjI2MDQ0NDg3MTlcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMjM2NjkzODU2XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjowLjc2NzQxMDAzOTkwMTczMzQsXCIxNzc2NzZcIjowLjM4OTAwODU4MTYzODMzNjIsXCIxNzc2ODdcIjowLjg3MzM2MjQyMTk4OTQ0MDl9XX0sXCI4NTQ5NjA1OTVcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjAuOTQxMTc2NTMzNjk5MDM1NixcIjE3NzY3NlwiOjAuNTg4MjM1MzE4NjYwNzM2MSxcIjE3NzY4N1wiOjAuNjI3NDUxMDAyNTk3ODA4OH0se1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCIyNzQ0MjAzNTI5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNzY5MTE3NTI5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzNzAwMDQ2NTkxXCI6e1wiMjc3Njk4MzcwXCI6XCJCRVJTRVJLIEFJUiBMQUcgdjMuLi5MT0FESU5HIOKWiOKWiOKWiOKWiOKWiOKWiOKWiOKWiFwifSxcIjQyMTM2NTU1NzBcIjp7XCIyNzc2OTgzNzBcIjozfX19LFwiMzkyNDY4NDI3OVwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMzQ2NzUyODE0XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjA0NDQ4NzE5XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjEwMTU1ODcxMjRcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjEuMCxcIjE3NzY4N1wiOjEuMH1dfSxcIjMwOTQ4ODM2NzhcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjEuMCxcIjE3NzY4N1wiOjEuMH1dfX0sXCIyMDkwNTE1MDE4XCI6MH19fX0sXCIzOTk0NjI4NzY1XCI6e1wiMjU1NjY4ODA0XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjI0MTQ0NDE3M1wiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19LFwiNDIxMjc5MjUxXCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjoxLjAsXCIxNzc2ODdcIjoxLjB9XX19LFwiMjA5MDUxNTAxOFwiOjB9fSxcIjI3NzY5ODM3MFwiOjB9LFwiNzQ4MDgzNTgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjYwNDQ0ODcxOVwiOntcIjI3NzY5ODM3MFwiOntcIjIwOTAxNTU5MjZcIjp7XCIwXCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjoxLjAsXCIxNzc2ODdcIjoxLjB9XX19LFwiMjA5MDUxNTAxOFwiOjB9fSxcIjQyMTM2NTU1NzBcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9fQ=="))
table.insert(empty_0_21_5, config_api_4("shizowo", "shizowo", -1, "phantom_eyJDVCBBaXIiOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjR9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjN9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0xOH0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6Mjl9LFwiMzUwNzYwOTY4OFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI3MjU5MjU3MjlcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjg1NTEyMDkxMVwiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTEyMjM3NjA0XCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIkNUIEFpciBDcm91Y2hpbmciOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjoxMX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjo0fSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMjB9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjM1fSxcIjM1MDc2MDk2ODhcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNzI1OTI1NzI5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjkxMjIzNzYwNFwiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOi0xMH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIkNUIENyb3VjaGluZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfX19LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzYwODkwMTY4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDY1NjgwMzkzXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6NH0sXCIxODk3Mjg3NTg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTE2fSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjozM30sXCIzNTA3NjA5Njg4XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjcyNTkyNTcyOVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI5MTIyMzc2MDRcIjp7XCIyNzc2OTgzNzBcIjoxfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6NCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjoxMX19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIkNUIE1vdmluZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfX19LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzYwODkwMTY4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDY1NjgwMzkzXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6NH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6M30sXCIxODk3Mjg3NTg3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTE1fSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjoxNX0sXCIzNTA3NjA5Njg4XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjcyNTkyNTcyOVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI5MTIyMzc2MDRcIjp7XCIyNzc2OTgzNzBcIjoxfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6MixcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjozMH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiNDA4MDM1OTExM1wiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCIxOTM0NzcyMzhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMDg5NjI3ODc5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzI5Mjg5ODlcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIzNDM0ODkwNTE5XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQxMjQyNjg3NjJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTk4MDcxNjY2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9LCJDVCBTaGFyZWQiOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0yN30sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6NDl9LFwiMzUwNzYwOTY4OFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI3MjU5MjU3MjlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg1NTEyMDkxMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiOTEyMjM3NjA0XCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjMsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6NX19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiNDA4MDM1OTExM1wiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCIxOTM0NzcyMzhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMDg5NjI3ODc5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzI5Mjg5ODlcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIzNDM0ODkwNTE5XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQxMjQyNjg3NjJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTk4MDcxNjY2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9LCJDVCBTbmVha2luZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfX19LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzYwODkwMTY4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDY1NjgwMzkzXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6M30sXCIxODk3Mjg3NTg3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTE2fSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjo0NH0sXCIzNTA3NjA5Njg4XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjcyNTkyNTcyOVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI5MTIyMzc2MDRcIjp7XCIyNzc2OTgzNzBcIjoxfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6NCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjotNX19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIkNUIFN0YW5kaW5nIjp7ImFuZ2xlcyI6IntcIjExNzY1NDgyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNDIyMzI3NDI2XCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM5MTg5MTUyNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxNDczNjQyNDUzXCI6e1wiMjc3Njk4MzcwXCI6NX0sXCIyNDEyNzE1Mjk1XCI6e1wiMjc3Njk4MzcwXCI6NX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjo0fSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMTN9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjM2fSxcIjM1MDc2MDk2ODhcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNzI1OTI1NzI5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjkxMjIzNzYwNFwiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjozLFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOi04fX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIkNUIFdhbGtpbmciOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxNDczNjQyNDUzXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNDEyNzE1Mjk1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM1MDc2MDk2ODhcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNzI1OTI1NzI5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjkxMjIzNzYwNFwiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9fX19IiwiZGVmZW5zaXZlIjoie1wiMTQxMjc4NjUwNFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjQwODAzNTkxMTNcIjp7XCIyNzc2OTgzNzBcIjoxfX19LFwiMTkzNDc3MjM4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjA4OTYyNzg3OVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMyOTI4OTg5XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjcsXCI0MDUwNDgyMTUwXCI6e1wiMzQzNDg5MDUxOVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0MTI0MjY4NzYyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIyODI2MTM1MDcyXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjAyNDExNzkxXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjU5ODA3MTY2NlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0ifSwiVCBBaXIiOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjR9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjN9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0xOH0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6Mjl9LFwiMzUwNzYwOTY4OFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI3MjU5MjU3MjlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg1NTEyMDkxMVwiOntcIjI3NzY5ODM3MFwiOjJ9LFwiOTEyMjM3NjA0XCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIlQgQWlyIENyb3VjaGluZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfX19LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzYwODkwMTY4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDY1NjgwMzkzXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6NH0sXCIxODk3Mjg3NTg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTIwfSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjozNX0sXCIzNTA3NjA5Njg4XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjcyNTkyNTcyOVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6Mn0sXCI5MTIyMzc2MDRcIjp7XCIyNzc2OTgzNzBcIjoxfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjotMTB9fX19IiwiZGVmZW5zaXZlIjoie1wiMTQxMjc4NjUwNFwiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiNDA4MDM1OTExM1wiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCIxOTM0NzcyMzhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMDg5NjI3ODc5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzI5Mjg5ODlcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIzNDM0ODkwNTE5XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQxMjQyNjg3NjJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTk4MDcxNjY2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9LCJUIENyb3VjaGluZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDA5MTUxMDc4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMTQ3MzY0MjQ1M1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjQxMjcxNTI5NVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjY3Mjc2NDY2OVwiOntcIjI3NzY5ODM3MFwiOjYwfSxcIjM1NzUyNzMyMjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjU5MTYyMTM5NVwiOntcIjI3NzY5ODM3MFwiOjYwfX19LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMzYwODkwMTY4MVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDY1NjgwMzkzXCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCIxMTAwNjA1NDE3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNTIwNDg4NDIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxODIzMTg5MjYyXCI6e1wiMjc3Njk4MzcwXCI6NH0sXCIxODk3Mjg3NTg3XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIyMzE1NjM4NDkyXCI6e1wiMjc3Njk4MzcwXCI6LTE2fSxcIjI1NDkzNjkyOTZcIjp7XCIyNzc2OTgzNzBcIjozM30sXCIzNTA3NjA5Njg4XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIzNzE1MzMzODA3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjcyNTkyNTcyOVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiODU1MTIwOTExXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI5MTIyMzc2MDRcIjp7XCIyNzc2OTgzNzBcIjoxfX19LFwiODk2OTMyNTQ4XCI6e1wiMjc3Njk4MzcwXCI6NCxcIjQwNTA0ODIxNTBcIjp7XCI0NzgxNjUyNTdcIjp7XCIyNzc2OTgzNzBcIjoxMX19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIlQgTW92aW5nIjp7ImFuZ2xlcyI6IntcIjExNzY1NDgyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNDIyMzI3NDI2XCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM5MTg5MTUyNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxNDczNjQyNDUzXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNDEyNzE1Mjk1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjo0fSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjozfSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMTV9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjE1fSxcIjM1MDc2MDk2ODhcIjp7XCIyNzc2OTgzNzBcIjo3fSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNzI1OTI1NzI5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjoyfSxcIjkxMjIzNzYwNFwiOntcIjI3NzY5ODM3MFwiOjR9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjoyLFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjMwfX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6Mn19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIlQgU2hhcmVkIjp7ImFuZ2xlcyI6IntcIjExNzY1NDgyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNDIyMzI3NDI2XCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM5MTg5MTUyNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxNDczNjQyNDUzXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNDEyNzE1Mjk1XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjo1fSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMjd9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjQ5fSxcIjM1MDc2MDk2ODhcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNzI1OTI1NzI5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjkxMjIzNzYwNFwiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjozLFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjEwfX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIlQgU25lYWtpbmciOnsiYW5nbGVzIjoie1wiMTE3NjU0ODJcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE0MjIzMjc0MjZcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjk0MzY0NDQ1OVwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfX19LFwiMzkxODkxNTI1M1wiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjEsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjN9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOi0xNn0sXCIyNTQ5MzY5Mjk2XCI6e1wiMjc3Njk4MzcwXCI6NDR9LFwiMzUwNzYwOTY4OFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI3MjU5MjU3MjlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg1NTEyMDkxMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiOTEyMjM3NjA0XCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjQsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6LTV9fX19IiwiZGVmZW5zaXZlIjoie1wiMTQxMjc4NjUwNFwiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiNDA4MDM1OTExM1wiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCIxOTM0NzcyMzhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMDg5NjI3ODc5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzI5Mjg5ODlcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIzNDM0ODkwNTE5XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQxMjQyNjg3NjJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTk4MDcxNjY2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9LCJUIFN0YW5kaW5nIjp7ImFuZ2xlcyI6IntcIjExNzY1NDgyXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIxNDIyMzI3NDI2XCI6e1wiMjc3Njk4MzcwXCI6MSxcIjQwNTA0ODIxNTBcIjp7XCI5NDM2NDQ0NTlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX19fSxcIjM5MTg5MTUyNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjEwMDkxNTEwNzhcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIxNDczNjQyNDUzXCI6e1wiMjc3Njk4MzcwXCI6NX0sXCIyNDEyNzE1Mjk1XCI6e1wiMjc3Njk4MzcwXCI6NX0sXCIyNjcyNzY0NjY5XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzU3NTI3MzIyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNTkxNjIxMzk1XCI6e1wiMjc3Njk4MzcwXCI6NjB9fX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIzNjA4OTAxNjgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiNDIxMTcwNjQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI0NjU2ODAzOTNcIjp7XCIyNzc2OTgzNzBcIjoxLFwiNDA1MDQ4MjE1MFwiOntcIjExMDA2MDU0MTdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjE1MjA0ODg0MjFcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjE4MjMxODkyNjJcIjp7XCIyNzc2OTgzNzBcIjo0fSxcIjE4OTcyODc1ODdcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjIzMTU2Mzg0OTJcIjp7XCIyNzc2OTgzNzBcIjotMTN9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjM2fSxcIjM1MDc2MDk2ODhcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjM3MTUzMzM4MDdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNzI1OTI1NzI5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI4NTUxMjA5MTFcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjkxMjIzNzYwNFwiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCI4OTY5MzI1NDhcIjp7XCIyNzc2OTgzNzBcIjozLFwiNDA1MDQ4MjE1MFwiOntcIjQ3ODE2NTI1N1wiOntcIjI3NzY5ODM3MFwiOi04fX19fSIsImRlZmVuc2l2ZSI6IntcIjE0MTI3ODY1MDRcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCI0MDgwMzU5MTEzXCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjE5MzQ3NzIzOFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDA1MTkwMjQ4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIzNTMxMTE0XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjIwODk2Mjc4NzlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjIzMjkyODk4OVwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjo3LFwiNDA1MDQ4MjE1MFwiOntcIjM0MzQ4OTA1MTlcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNDEyNDI2ODc2MlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6MjB9LFwiMjgyNjEzNTA3MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzM0ODUxMDUwOFwiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDIwMjQxMTc5MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCI1OTgwNzE2NjZcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX19In0sIlQgV2Fsa2luZyI6eyJhbmdsZXMiOiJ7XCIxMTc2NTQ4MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTQyMjMyNzQyNlwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiOTQzNjQ0NDU5XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX0sXCIzOTE4OTE1MjUzXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMTAwOTE1MTA3OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjE0NzM2NDI0NTNcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI0MTI3MTUyOTVcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2NzI3NjQ2NjlcIjp7XCIyNzc2OTgzNzBcIjo2MH0sXCIzNTc1MjczMjIxXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1OTE2MjEzOTVcIjp7XCIyNzc2OTgzNzBcIjo2MH19fSxcIjQyMTE3MDY0OTJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjM2MDg5MDE2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI0MjExNzA2NDkyXCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQ2NTY4MDM5M1wiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiMTEwMDYwNTQxN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTUyMDQ4ODQyMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMTgyMzE4OTI2MlwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMTg5NzI4NzU4N1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjMxNTYzODQ5MlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMjU0OTM2OTI5NlwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzUwNzYwOTY4OFwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMzcxNTMzMzgwN1wiOntcIjI3NzY5ODM3MFwiOjB9LFwiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI3MjU5MjU3MjlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjg1NTEyMDkxMVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiOTEyMjM3NjA0XCI6e1wiMjc3Njk4MzcwXCI6MX19fSxcIjg5NjkzMjU0OFwiOntcIjI3NzY5ODM3MFwiOjAsXCI0MDUwNDgyMTUwXCI6e1wiNDc4MTY1MjU3XCI6e1wiMjc3Njk4MzcwXCI6MH19fX0iLCJkZWZlbnNpdmUiOiJ7XCIxNDEyNzg2NTA0XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiNDA4MDM1OTExM1wiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCIxOTM0NzcyMzhcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQwNTE5MDI0ODdcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMzUzMTExNFwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyMDg5NjI3ODc5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMzI5Mjg5ODlcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMjM2NzIyMDM4XCI6e1wiMjc3Njk4MzcwXCI6NyxcIjQwNTA0ODIxNTBcIjp7XCIzNDM0ODkwNTE5XCI6e1wiMjc3Njk4MzcwXCI6MH19fSxcIjQxMjQyNjg3NjJcIjp7XCIyNzc2OTgzNzBcIjowLFwiNDA1MDQ4MjE1MFwiOntcIjIzNjcyMjAzOFwiOntcIjI3NzY5ODM3MFwiOjIwfSxcIjI4MjYxMzUwNzJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMzNDg1MTA1MDhcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQyMDI0MTE3OTFcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiNTk4MDcxNjY2XCI6e1wiMjc3Njk4MzcwXCI6MCxcIjQwNTA0ODIxNTBcIjp7XCIyMzY3MjIwMzhcIjp7XCIyNzc2OTgzNzBcIjoyMH0sXCIzMzQ4NTEwNTA4XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MDUxOTAyNDg3XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI0MjM1MzExMTRcIjp7XCIyNzc2OTgzNzBcIjowfX19fSJ9LCJhbnRpYWltIjp7InN0YXRlX2VuYWJsZWQiOiJ7XCIxMDE5NTc2NDMxXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIxMTI0Nzk0OFwiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjEzMTYwMzg5MjRcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjE1NTExNDM1ODFcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjE4NTUwNjAzNTNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjIzMDEwMDQyMTJcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjMxMjg1MjUxNzlcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjMyODM1MDcxNDhcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjM0NzkzMDg5ODRcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjM1NTAzMjk5ODJcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjM3MDczNDk1XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIzOTM0NDg0NzRcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjQyNDQ2Njg2ODFcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCI5Mjc0NTIzOTlcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfX0iLCJ0d2Vha3MiOiJ7XCIxNzE4MjQ3Nzc3XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxNTQ2MTkzNjgwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNjI0MDE1MzM5XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIxNjI0MDE1MzQwXCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyMDg5MTE3MTEzXCI6e1wiMjc3Njk4MzcwXCI6MTAwfSxcIjMxNTY4OTU1MTFcIjp7XCIyNzc2OTgzNzBcIjoxMDB9LFwiMzUwMTk4NzMzMVwiOntcIjI3NzY5ODM3MFwiOjEwMH0sXCI0MTk5NTQ1Nzk0XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCI1ODYyNzkyXCI6e1wiMjc3Njk4MzcwXCI6NTh9fX0sXCIyNTY2MTY1Mzc1XCI6e1wiMjU0MjY5MDc3XCI6W3tcIjE0Mjc4NTU4MzZcIjpmYWxzZSxcIjE3MzU3MDYxODJcIjpmYWxzZSxcIjE5MjgyMjk2MVwiOnRydWUsXCIxOTM0OTY5NzRcIjoxNjQsXCIyMDkwNTE1MDE4XCI6MSxcIjIzOTk0NDA5MDVcIjowLFwiMzMwNzA2ODM2M1wiOmZhbHNlfV0sXCIyNzc2OTgzNzBcIjpmYWxzZSxcIjQwNTA0ODIxNTBcIjp7XCIxMjA4MTQ5NTAyXCI6e1wiMjc3Njk4MzcwXCI6MTkyfSxcIjMwNzEzNDc1MjRcIjp7XCIyNzc2OTgzNzBcIjoxfSxcIjY0NDI1MjA4MVwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIzNTY0MjkyNzg4XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjE1MzU5NzY0MTlcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjMyMjU5MTMzNjNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjMzNzM3OTQzNTJcIjp7XCIyNzc2OTgzNzBcIjo4fSxcIjM1NzU2NjcwOTRcIjp7XCIyNzc2OTgzNzBcIjoxMn0sXCI1NTQyOTkwMzhcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjc0ODkwNTM2NFwiOntcIjI1NDI2OTA3N1wiOlt7XCIxNDI3ODU1ODM2XCI6ZmFsc2UsXCIxNzM1NzA2MTgyXCI6MCxcIjE5MjgyMjk2MVwiOjEsXCIxOTM0OTY5NzRcIjo5MCxcIjIwOTA1MTUwMThcIjowLFwiMjM5OTQ0MDkwNVwiOjAsXCIzMzA3MDY4MzYzXCI6dHJ1ZX0se1wiMTQyNzg1NTgzNlwiOmZhbHNlLFwiMTczNTcwNjE4MlwiOjAsXCIxOTI4MjI5NjFcIjoyLFwiMTkzNDk2OTc0XCI6NjcsXCIyMDkwNTE1MDE4XCI6MCxcIjIzOTk0NDA5MDVcIjowLFwiMzMwNzA2ODM2M1wiOnRydWV9XSxcIjI3NzY5ODM3MFwiOjB9LFwiODUwMDk5NTYzXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX19In0sIm1pc2MiOnsiY2hhbmdlcnMiOiJ7XCIyNjA5NTU5NzFcIjp7XCIyNzc2OTgzNzBcIjoxOTUxfSxcIjI4MTQ4NDMyNTBcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjM3NjIxMTI4ODNcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjE5MjQ3MDEwNjFcIjpudWxsLFwiMjY2NTI5MTIyOVwiOm51bGwsXCIyODIwOTIxMjU0XCI6bnVsbCxcIjI5MTY2NTA5MTZcIjpudWxsLFwiNDYyNDIzODg0XCI6e1wiMjc3Njk4MzcwXCI6MTI1fX19LFwiMzc4MjkzOTA3MVwiOntcIjI3NzY5ODM3MFwiOnRydWUsXCI0MDUwNDgyMTUwXCI6e1wiMTAwMzIzMDQ0MlwiOm51bGwsXCIxMDk2MDkzMTM4XCI6e1wiMjc3Njk4MzcwXCI6MTV9LFwiMTIyNTI4MDkxN1wiOntcIjI3NzY5ODM3MFwiOi0yNX0sXCIyNDU5OTIyNTg5XCI6e1wiMjc3Njk4MzcwXCI6NjIwfSxcIjI1ODM4MTA0MDhcIjp7XCIyNzc2OTgzNzBcIjotNH0sXCI0Mjc2NzI1MjU4XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fX19IiwibWlzY2VsbGFuZW91cyI6IntcIjE0NTU3MjA5ODVcIjp7XCIyNTQyNjkwNzdcIjpbe1wiMTQyNzg1NTgzNlwiOmZhbHNlLFwiMTczNTcwNjE4MlwiOnRydWUsXCIxOTI4MjI5NjFcIjpmYWxzZSxcIjE5MzQ5Njk3NFwiOjgyLFwiMjA5MDUxNTAxOFwiOjEsXCIyMzk5NDQwOTA1XCI6MCxcIjMzMDcwNjgzNjNcIjpmYWxzZX1dLFwiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIyMjY3NzYzNDg0XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZX0sXCIyNjkwMDY5MzE4XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjQxNzQ2MzkzODhcIjp7XCIyNzc2OTgzNzBcIjozfSxcIjcwNjkzNzQ0NFwiOntcIjI1NTY2ODgwNFwiOntcIjI3NzY5ODM3MFwiOntcIjIwOTAxNTU5MjZcIjp7XCIxOTM0NTg5ODZcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjAuNDMwNDgzNzI4NjQ3MjMyMDYsXCIxNzc2NzZcIjowLjkzODg2NDY0ODM0MjEzMjYsXCIxNzc2ODdcIjowLjc2NDEwODcxNzQ0MTU1ODh9XX0sXCIyMDg5MzU5MDA5XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjowLjU1MDYxODc2NzczODM0MjMsXCIxNzc2NzZcIjowLjU1MDYxODc2NzczODM0MjMsXCIxNzc2ODdcIjowLjcyMDUyNDAxMzA0MjQ1fV19fSxcIjIwOTA1MTUwMThcIjoxfX0sXCIyNzc2OTgzNzBcIjp0cnVlfSxcIjgwMDE5NzQwMlwiOntcIjI3NzY5ODM3MFwiOjB9fX0sXCIyNzczMTg3NTc2XCI6e1wiNDA1MDQ4MjE1MFwiOntcIjIwODc4Mzc0ODRcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjM4NTMyODgyMTFcIjp7XCIyNzc2OTgzNzBcIjo5fX19LFwiMjk2ODQyMDgwM1wiOntcIjI3NzY5ODM3MFwiOmZhbHNlfSxcIjMwOTc3OTA2MjlcIjp7XCIyNzc2OTgzNzBcIjp0cnVlfSxcIjMyOTUzMzc3MDFcIjp7XCIyNTQyNjkwNzdcIjpbe1wiMTQyNzg1NTgzNlwiOmZhbHNlLFwiMTczNTcwNjE4MlwiOnRydWUsXCIxOTI4MjI5NjFcIjpmYWxzZSxcIjE5MzQ5Njk3NFwiOjgyLFwiMjA5MDUxNTAxOFwiOjEsXCIyMzk5NDQwOTA1XCI6MCxcIjMzMDcwNjgzNjNcIjpmYWxzZX1dLFwiMjc3Njk4MzcwXCI6dHJ1ZX0sXCI3NjcwMDQxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9fSIsInJhZ2Vib3QiOiJ7XCIyNjE1MDQyMjQ4XCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMDk3MDEwNjI2XCI6e1wiMjc3Njk4MzcwXCI6NDV9LFwiMTQ1MjQ4MjMyMFwiOntcIjI3NzY5ODM3MFwiOjE1fSxcIjM5ODAzOTA2MzNcIjp7XCIyNzc2OTgzNzBcIjowfX19LFwiMzQxNDk5NDQ2N1wiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjE1OTAxNDc4MDFcIjp7XCIyNzc2OTgzNzBcIjo3fSxcIjI3NzY3MDE2MjNcIjp7XCIyNzc2OTgzNzBcIjoyNX0sXCIzNjU0MzA3ODA4XCI6e1wiMjc3Njk4MzcwXCI6MX0sXCIzNzk5ODg2ODhcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMFwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCI0MTkxMTQ2MTgwXCI6e1wiMjc3Njk4MzcwXCI6MTB9LFwiOTMxMDExMjA3XCI6e1wiMjc3Njk4MzcwXCI6MTAwfX19LFwiMzc2MjE1OTIxM1wiOntcIjI3NzY5ODM3MFwiOmZhbHNlLFwiNDA1MDQ4MjE1MFwiOntcIjI2MjE5OTc4ODRcIjp7XCIyNzc2OTgzNzBcIjoxOTV9LFwiMjYyMTk5Nzg4NVwiOntcIjI3NzY5ODM3MFwiOjEwMH0sXCIyNjIxOTk3ODg2XCI6e1wiMjc3Njk4MzcwXCI6NjB9LFwiMzE0ODI2NTU1MFwiOntcIjI3NzY5ODM3MFwiOjM1fSxcIjMxNDgyNjU1NTFcIjp7XCIyNzc2OTgzNzBcIjo1MH0sXCIzMTQ4MjY1NTUyXCI6e1wiMjc3Njk4MzcwXCI6NTB9LFwiMzQzNjkyOTE2N1wiOntcIjI3NzY5ODM3MFwiOjUwfSxcIjM0MzY5MjkxNjhcIjp7XCIyNzc2OTgzNzBcIjo1MH0sXCIzNDM2OTI5MTY5XCI6e1wiMjc3Njk4MzcwXCI6NDB9LFwiMzg3ODAyNTE5MlwiOntcIjI3NzY5ODM3MFwiOjJ9LFwiNDY4OTUzODYzXCI6e1wiMjc3Njk4MzcwXCI6MX0sXCI0Njg5NTM4NjRcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjQ2ODk1Mzg2NVwiOntcIjI3NzY5ODM3MFwiOjJ9fX0sXCI0MjQwMTI0NzgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiNDYyNDIzODg0XCI6e1wiMjc3Njk4MzcwXCI6ODB9fX19IiwidmlzdWFscyI6IntcIjE1ODcxNTAwMDlcIjp7XCIyNzc2OTgzNzBcIjpmYWxzZX0sXCIzNTM3NTc0NzAyXCI6e1wiMjc3Njk4MzcwXCI6dHJ1ZSxcIjQwNTA0ODIxNTBcIjp7XCIxMTU5NTcxMTE4XCI6e1wiMjc3Njk4MzcwXCI6MTYwfSxcIjE3NTM0NzA0OTJcIjp7XCIyNzc2OTgzNzBcIjowfSxcIjI2MDQ0NDg3MTlcIjp7XCIyNzc2OTgzNzBcIjp7XCIyMDkwMTU1OTI2XCI6e1wiMFwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19fSxcIjIwOTA1MTUwMThcIjowfX0sXCIzNDgxNTk2NzM5XCI6e1wiMjc3Njk4MzcwXCI6NX19fSxcIjM1Nzc2MjEyNTZcIjp7XCIyNzc2OTgzNzBcIjp0cnVlLFwiNDA1MDQ4MjE1MFwiOntcIjIxNzcxOTMzMlwiOntcIjI3NzY5ODM3MFwiOntcIjIwOTAxNTU5MjZcIjp7XCIyNzk3NTUwMDE3XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjoxLjAsXCIxNzc2ODdcIjoxLjB9XX0sXCIzNjE1Nzc3MzM2XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjowLjAsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjoxLjAsXCIxNzc2ODdcIjoxLjB9XX19LFwiMjA5MDUxNTAxOFwiOjF9fSxcIjIzNjg4Nzc5OFwiOntcIjI3NzY5ODM3MFwiOjF9fX0sXCIzODQ0NzY5NzE2XCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2V9LFwiMzkwNjI0MzA4OVwiOntcIjQwNTA0ODIxNTBcIjp7XCIyNjA0NDQ4NzE5XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjIzNjY5Mzg1NlwiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MC43Njc0MTAwMzk5MDE3MzM0LFwiMTc3Njc2XCI6MC4zODkwMDg1ODE2MzgzMzYyLFwiMTc3Njg3XCI6MC44NzMzNjI0MjE5ODk0NDA5fV19LFwiODU0OTYwNTk1XCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjowLjc2ODYyNzUyNDM3NTkxNTUsXCIxNzc2NzZcIjowLjM4ODIzNTMzMDU4MTY2NTA0LFwiMTc3Njg3XCI6MC44NzQ1MDk4NzEwMDYwMTJ9LHtcIjE3NzY3MFwiOjAuMCxcIjE3NzY3MVwiOjAuMCxcIjE3NzY3NlwiOjAuMCxcIjE3NzY4N1wiOjAuMH1dfX0sXCIyMDkwNTE1MDE4XCI6MH19LFwiMjc0NDIwMzUyOVwiOntcIjI3NzY5ODM3MFwiOjF9LFwiMjc2OTExNzUyOVwiOntcIjI3NzY5ODM3MFwiOjB9LFwiMzcwMDA0NjU5MVwiOntcIjI3NzY5ODM3MFwiOlwicGhhbnRvbVwifSxcIjQyMTM2NTU1NzBcIjp7XCIyNzc2OTgzNzBcIjozfX19LFwiMzkyNDY4NDI3OVwiOntcIjQwNTA0ODIxNTBcIjp7XCIxMzQ2NzUyODE0XCI6e1wiMjc3Njk4MzcwXCI6MH0sXCIyNjA0NDQ4NzE5XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjEwMTU1ODcxMjRcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjAuNzE0NDAyODU0NDQyNTk2NCxcIjE3NzY3NlwiOjAuNzE0NDAyODU0NDQyNTk2NCxcIjE3NzY4N1wiOjAuNzMzNjI0NDU4MzEyOTg4M31dfSxcIjMwOTQ4ODM2NzhcIjp7XCIyMDkwMTU1OTI2XCI6W3tcIjE3NzY3MFwiOjEuMCxcIjE3NzY3MVwiOjEuMCxcIjE3NzY3NlwiOjEuMCxcIjE3NzY4N1wiOjEuMH1dfX0sXCIyMDkwNTE1MDE4XCI6MH19fX0sXCIzOTk0NjI4NzY1XCI6e1wiMjU1NjY4ODA0XCI6e1wiMjc3Njk4MzcwXCI6e1wiMjA5MDE1NTkyNlwiOntcIjI0MTQ0NDE3M1wiOntcIjIwOTAxNTU5MjZcIjpbe1wiMTc3NjcwXCI6MS4wLFwiMTc3NjcxXCI6MS4wLFwiMTc3Njc2XCI6MS4wLFwiMTc3Njg3XCI6MS4wfV19LFwiNDIxMjc5MjUxXCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjoxLjAsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjoxLjAsXCIxNzc2ODdcIjoxLjB9XX19LFwiMjA5MDUxNTAxOFwiOjB9fSxcIjI3NzY5ODM3MFwiOjB9LFwiNzQ4MDgzNTgxXCI6e1wiMjc3Njk4MzcwXCI6ZmFsc2UsXCI0MDUwNDgyMTUwXCI6e1wiMjYwNDQ0ODcxOVwiOntcIjI3NzY5ODM3MFwiOntcIjIwOTAxNTU5MjZcIjp7XCIwXCI6e1wiMjA5MDE1NTkyNlwiOlt7XCIxNzc2NzBcIjowLjY0NTgzMzMxMzQ2NTExODQsXCIxNzc2NzFcIjoxLjAsXCIxNzc2NzZcIjoxLjAsXCIxNzc2ODdcIjoxLjB9XX19LFwiMjA5MDUxNTAxOFwiOjB9fSxcIjQyMTM2NTU1NzBcIjp7XCIyNzc2OTgzNzBcIjoxfX19fSJ9fQ=="))
empty_0_17_0.update_data()
events.shutdown(config_api_11)

unused_0_18_0 = nil
ref_0_19_1 = empty_0_15_0.home.presets
cfg_0_20_3 = {
	misc = {
		changers = empty_0_15_0.misc.group_changers,
		miscellaneous = empty_0_15_0.misc.group_miscellaneous,
		ragebot = empty_0_15_0.misc.group_ragebot,
		visuals = empty_0_15_0.misc.group_visuals
	},
	antiaim = {
		state_enabled = empty_0_15_0.antiaim.group_state_enabled,
		tweaks = empty_0_15_0.antiaim.group_tweaks
	}
}

for iter_0_9, iter_0_10 in pairs(empty_0_15_0.antiaim.builder) do
	for iter_0_11, iter_0_12 in pairs(iter_0_10) do
		cfg_0_20_3[string.format("%s %s", iter_0_9, iter_0_11)] = iter_0_12.groups
	end
end

empty_0_16_0.set_package(cfg_0_20_3)

ui_callback_2 = nil

function base64_helper_4()
	local var_149_0, var_149_1 = empty_0_17_0.save(ref_0_19_1.input:get())

	if not var_149_0 then
		empty_0_12_0.error(var_149_1)

		return
	end

	empty_0_17_0.update_data()
	ref_0_19_1.list:update(empty_0_17_0.get_list())
	empty_0_12_0.success("Config saved")
	common.add_notify(empty_0_4_0.name, "Config saved")
end

function base64_helper_6()
	local var_150_0, var_150_1 = empty_0_17_0.delete(ref_0_19_1.input:get())

	if not var_150_0 then
		empty_0_12_0.error(var_150_1)

		return
	end

	empty_0_17_0.update_data()
	ref_0_19_1.list:update(empty_0_17_0.get_list())
	empty_0_12_0.success("Config deleted")
	common.add_notify(empty_0_4_0.name, "Config deleted")
end

function base64_helper_8()
	local var_151_0, var_151_1 = empty_0_16_0.export_as_string()

	if not var_151_0 then
		empty_0_12_0.error(var_151_1)

		return
	end

	clipboard.set(var_151_1)
	empty_0_12_0.success("Config exported to clipboard")
	common.add_notify(empty_0_4_0.name, "Config exported to clipboard")
end

function config_api_7(arg_152_0)
	assert(type(arg_152_0) == "function", "action must be a function")

	function ui_callback_2()
		arg_152_0()

		ui_callback_2 = nil
	end

	ref_0_19_1.cancel:disabled(false)
	ref_0_19_1.confirm:disabled(false)
	ref_0_19_1.list:disabled(true)
	ref_0_19_1.input:disabled(true)
	ref_0_19_1.import_button:disabled(true)
	ref_0_19_1.export_button:disabled(true)
	ref_0_19_1.delete_button:disabled(true)
	ref_0_19_1.save_button:disabled(true)
	ref_0_19_1.load_button:disabled(true)
end

unused_0_26_7 = nil

function ui_callback_3(arg_154_0)
	local var_154_0 = arg_154_0:get()

	if var_154_0 == nil or var_154_0 <= 0 then
		return
	end

	local var_154_1 = empty_0_17_0.get(var_154_0)

	if var_154_1 == nil then
		ref_0_19_1.input:set("")
	else
		ref_0_19_1.input:set(var_154_1.name)
	end
end

function base64_helper_10()
	if ui_callback_2 ~= nil then
		ui_callback_2()
	end

	ref_0_19_1.list:disabled(false)
	ref_0_19_1.input:disabled(false)
	ref_0_19_1.import_button:disabled(false)
	ref_0_19_1.export_button:disabled(false)
	ref_0_19_1.delete_button:disabled(false)
	ref_0_19_1.save_button:disabled(false)
	ref_0_19_1.load_button:disabled(false)
	ref_0_19_1.cancel:disabled(true)
	ref_0_19_1.confirm:disabled(true)
end

function base64_helper_11()
	if ui_callback_2 ~= nil then
		ui_callback_2 = nil
	end

	ref_0_19_1.list:disabled(false)
	ref_0_19_1.input:disabled(false)
	ref_0_19_1.import_button:disabled(false)
	ref_0_19_1.export_button:disabled(false)
	ref_0_19_1.delete_button:disabled(false)
	ref_0_19_1.save_button:disabled(false)
	ref_0_19_1.load_button:disabled(false)
	ref_0_19_1.cancel:disabled(true)
	ref_0_19_1.confirm:disabled(true)
end

function base64_helper_12()
	local var_157_0, var_157_1 = empty_0_17_0.load(ref_0_19_1.input:get())

	if not var_157_0 then
		empty_0_12_0.error(var_157_1)

		return
	end

	empty_0_12_0.success("Config loaded")
	common.add_notify(empty_0_4_0.name, "Config loaded")
end

ref_0_19_1.confirm:set_callback(function()
	base64_helper_10()
end)
ref_0_19_1.cancel:set_callback(function()
	base64_helper_11()
end)
ref_0_19_1.load_button:set_callback(function()
	base64_helper_12()
end)
ref_0_19_1.save_button:set_callback(function()
	config_api_7(base64_helper_4)
end)
ref_0_19_1.delete_button:set_callback(function()
	config_api_7(base64_helper_6)
end)
ref_0_19_1.import_button:set_callback(function()
	local var_163_0, var_163_1 = empty_0_16_0.load(nil, clipboard.get())

	if not var_163_0 then
		empty_0_12_0.error(var_163_1)

		return
	end

	empty_0_12_0.success("Config imported from clipboard")
	common.add_notify(empty_0_4_0.name, "Config imported from clipboard")
end)
ref_0_19_1.export_button:set_callback(function()
	config_api_7(base64_helper_8)
end)
ref_0_19_1.list:set_callback(function(arg_165_0)
	ui_callback_3(arg_165_0)
end, true)
ref_0_19_1.list:update(empty_0_17_0.get_list())

empty_0_19_0 = {}
const_0_20_2 = 0
const_0_21_3 = 0
const_0_22_3 = 0
empty_0_19_0.is_onground = false
empty_0_19_0.is_moving = false
empty_0_19_0.is_crouched = false
empty_0_19_0.velocity2d = 0
empty_0_19_0.duck_amount = 0
empty_0_19_0.team_num = 0
empty_0_19_0.sent_packets = 0
empty_0_19_0.fakelag = 0

function on_createmove_8(arg_166_0)
	local var_166_0 = entity.get_local_player()

	if var_166_0 == nil then
		return
	end

	const_0_20_2 = var_166_0.m_fFlags
	empty_0_19_0.velocity2d = var_166_0.m_vecVelocity:length2d()

	if const_0_22_3 > arg_166_0.choked_commands then
		empty_0_19_0.fakelag = const_0_22_3
	end

	const_0_22_3 = arg_166_0.choked_commands

	if arg_166_0.choked_commands == 0 then
		empty_0_19_0.duck_amount = var_166_0.m_flDuckAmount
		empty_0_19_0.sent_packets = empty_0_19_0.sent_packets + 1
	end

	empty_0_19_0.is_moving = empty_0_19_0.velocity2d > 3.63
	empty_0_19_0.is_crouched = empty_0_19_0.duck_amount > 0
	empty_0_19_0.team_num = var_166_0.m_iTeamNum
end

function on_createmove_11(arg_167_0)
	local var_167_0 = entity.get_local_player()

	if var_167_0 == nil then
		return
	end

	const_0_21_3 = var_167_0.m_fFlags
	empty_0_19_0.is_onground = bit.band(const_0_20_2, 1) == 1 and bit.band(const_0_21_3, 1) == 1
end

events.createmove(on_createmove_8)
events.createmove_run(on_createmove_11)

unused_0_20_1 = nil
empty_0_20_0 = {}
unused_0_21_2 = nil
const_0_22_2 = 0
empty_0_20_0.defensive_ticks = 0
empty_0_20_0.max_defensive_ticks = 0
empty_0_20_0.teleport_units_sqr = 0

function on_createmove_7(arg_168_0)
	local var_168_0 = arg_168_0.m_nTickBase

	if math.abs(var_168_0 - const_0_22_2) > 64 then
		const_0_22_2 = 0
	end

	local var_168_1 = 0

	if var_168_0 > const_0_22_2 then
		const_0_22_2 = var_168_0
	elseif var_168_0 < const_0_22_2 then
		var_168_1 = math.min(14, math.max(0, const_0_22_2 - var_168_0 - 1))
	end

	if var_168_1 > 0 then
		if empty_0_20_0.max_defensive_ticks == 0 then
			empty_0_20_0.max_defensive_ticks = var_168_1
		end

		empty_0_20_0.defensive_ticks = var_168_1
	else
		empty_0_20_0.defensive_ticks = 0
		empty_0_20_0.max_defensive_ticks = 0
	end
end

function on_createmove_10(arg_169_0, arg_169_1)
	local var_169_0 = (arg_169_1 - arg_169_0):lengthsqr()

	empty_0_20_0.teleport_units_sqr = var_169_0
end

function on_createmove_13(arg_170_0)
	local var_170_0 = arg_170_0:get_simulation_time()

	if var_170_0 == nil then
		return
	end

	local var_170_1 = arg_170_0.m_vecOrigin

	if unused_0_21_2 ~= nil then
		local var_170_2 = to_ticks(var_170_0.current - var_170_0.old)

		if var_170_2 < 0 or var_170_2 > 0 and var_170_2 <= 64 then
			on_createmove_10(unused_0_21_2, var_170_1)
		end
	end

	unused_0_21_2 = var_170_1
end

function on_createmove_15()
	local var_171_0 = entity.get_local_player()

	if var_171_0 == nil then
		return
	end

	on_createmove_7(var_171_0)
end

function on_createmove_17()
	local var_172_0 = entity.get_local_player()

	if var_172_0 == nil then
		return
	end

	on_createmove_13(var_172_0)
end

events.createmove(on_createmove_15)
events.net_update_start(on_createmove_17)

unused_0_21_1 = nil
empty_0_21_0 = {}
empty_0_22_1 = {}

function on_createmove_6()
	local var_173_0 = ui.get_binds()

	for iter_173_0 in pairs(empty_0_22_1) do
		empty_0_22_1[iter_173_0] = nil
	end

	for iter_173_1 = 1, #var_173_0 do
		local var_173_1 = var_173_0[iter_173_1]
		local var_173_2 = var_173_1.reference:id()

		empty_0_22_1[var_173_2] = var_173_1
	end
end

function empty_0_21_0.get(arg_174_0)
	if arg_174_0 == nil then
		return nil
	end

	return empty_0_22_1[arg_174_0:id()]
end

events.render(on_createmove_6)

empty_0_22_0 = {}
empty_0_23_1 = {}
const_0_24_2 = 0

function on_createmove_12(arg_175_0)
	const_0_24_2 = const_0_24_2 + 1
	empty_0_23_1[const_0_24_2] = arg_175_0
end

function on_createmove_14()
	for iter_176_0 = 1, const_0_24_2 do
		empty_0_23_1[iter_176_0] = nil
	end

	const_0_24_2 = 0
end

function on_createmove_16()
	if not empty_0_19_0.is_onground then
		return
	end

	if empty_0_19_0.is_moving then
		on_createmove_12("Moving")

		if empty_0_19_0.is_crouched then
			return
		end

		if cfg_0_5_0.antiaim.misc.slow_walk:get() then
			on_createmove_12("Walking")
		end

		return
	end

	on_createmove_12("Standing")
end

function on_createmove_18()
	if not empty_0_19_0.is_crouched then
		return
	end

	on_createmove_12("Crouching")

	if empty_0_19_0.is_moving then
		on_createmove_12("Sneaking")
	end
end

function on_createmove_19()
	if empty_0_19_0.is_onground then
		return
	end

	on_createmove_12("Air")

	if empty_0_19_0.is_crouched then
		on_createmove_12("Air Crouching")
	end
end

function empty_0_22_0.get()
	return empty_0_23_1
end

function on_createmove_20()
	on_createmove_14()
	on_createmove_16()
	on_createmove_18()
	on_createmove_19()
end

events.createmove(on_createmove_20)

empty_0_23_0 = {}
empty_0_24_1 = {}
ref_0_25_2 = cfg_0_5_0.antiaim.angles
empty_0_26_4 = {}
empty_0_26_4.__index = empty_0_26_4

function empty_0_26_4.clear(arg_182_0)
	for iter_182_0 in pairs(arg_182_0) do
		arg_182_0[iter_182_0] = nil
	end
end

function empty_0_26_4.copy(arg_183_0, arg_183_1)
	for iter_183_0, iter_183_1 in pairs(arg_183_1) do
		arg_183_0[iter_183_0] = iter_183_1
	end
end

function empty_0_26_4.unset(arg_184_0)
	ref_0_25_2.enabled:override()
	ref_0_25_2.pitch:override()
	ref_0_25_2.yaw:override()
	ref_0_25_2.yaw_base:override()
	ref_0_25_2.yaw_offset:override()
	ref_0_25_2.avoid_backstab:override()
	ref_0_25_2.hidden:override()
	ref_0_25_2.yaw_modifier:override()
	ref_0_25_2.modifier_offset:override()
	ref_0_25_2.body_yaw:override()
	ref_0_25_2.inverter:override()
	ref_0_25_2.left_limit:override()
	ref_0_25_2.right_limit:override()
	ref_0_25_2.options:override()
	ref_0_25_2.body_freestanding:override()
	ref_0_25_2.freestanding:override()
	ref_0_25_2.freestanding_yaw_modifier:override()
	ref_0_25_2.freestanding_body:override()
	ref_0_25_2.extended_angles:override()
	ref_0_25_2.extended_pitch:override()
	ref_0_25_2.extended_roll:override()
end

function empty_0_26_4.set(arg_185_0)
	ref_0_25_2.enabled:override(arg_185_0.enabled)
	ref_0_25_2.pitch:override(arg_185_0.pitch)
	ref_0_25_2.yaw:override(arg_185_0.yaw)
	ref_0_25_2.yaw_base:override(arg_185_0.yaw_base)
	ref_0_25_2.yaw_offset:override(arg_185_0.yaw_offset)
	ref_0_25_2.avoid_backstab:override(arg_185_0.avoid_backstab)
	ref_0_25_2.hidden:override(arg_185_0.hidden)
	ref_0_25_2.yaw_modifier:override(arg_185_0.yaw_modifier)
	ref_0_25_2.modifier_offset:override(arg_185_0.modifier_offset)
	ref_0_25_2.body_yaw:override(arg_185_0.body_yaw)
	ref_0_25_2.inverter:override(arg_185_0.inverter)
	ref_0_25_2.left_limit:override(arg_185_0.left_limit)
	ref_0_25_2.right_limit:override(arg_185_0.right_limit)
	ref_0_25_2.options:override(arg_185_0.options)
	ref_0_25_2.body_freestanding:override(arg_185_0.freestanding_body_yaw)
	ref_0_25_2.freestanding:override(arg_185_0.freestanding)
	ref_0_25_2.freestanding_yaw_modifier:override(arg_185_0.freestanding_disable_yaw_modifiers)
	ref_0_25_2.freestanding_body:override(arg_185_0.freestanding_body_freestanding)
	ref_0_25_2.extended_angles:override(arg_185_0.extended_angles)
	ref_0_25_2.extended_pitch:override(arg_185_0.extended_angles_pitch)
	ref_0_25_2.extended_roll:override(arg_185_0.extended_angles_roll)
end

setmetatable(empty_0_24_1, empty_0_26_4)

empty_0_25_1 = {}
ref_0_26_3 = empty_0_15_0.antiaim.builder
empty_0_27_6 = {}

function func_0_28_10(arg_186_0, arg_186_1)
	empty_0_24_1.pitch = arg_186_1.pitch:get()
end

function func_0_29_14(arg_187_0, arg_187_1)
	local var_187_0 = arg_187_1.yaw:get()

	empty_0_24_1.yaw_base = arg_187_1.yaw_base:get()

	if var_187_0 == "Disabled" then
		empty_0_24_1.yaw = "Disabled"
		empty_0_24_1.yaw_offset = 0

		return
	end

	if var_187_0 == "Static" then
		local var_187_1 = arg_187_1.yaw_offset:get()
		local var_187_2 = arg_187_1.yaw_random:get()

		if var_187_2 > 0 then
			var_187_1 = var_187_1 + var_187_1 * (utils.random_int(-var_187_2, var_187_2) / 100)
		end

		empty_0_24_1.yaw = "Backward"
		empty_0_24_1.yaw_offset = var_187_1

		return
	end

	if var_187_0 == "Left & Right" then
		local var_187_3 = arg_187_1.yaw_offset_left:get()
		local var_187_4 = arg_187_1.yaw_offset_right:get()
		local var_187_5 = arg_187_1.yaw_random:get()
		local var_187_6 = arg_187_1.yaw_delay:get()
		local var_187_7 = arg_187_1.yaw_delay_type:get()
		local var_187_8 = arg_187_1.yaw_delay_left:get()
		local var_187_9 = arg_187_1.yaw_delay_right:get()
		local var_187_10 = arg_187_1.yaw_delay_second:get()
		local var_187_11 = arg_187_1.yaw_delay_ticks_random:get()

		if var_187_5 > 0 then
			local var_187_12 = var_187_5 * 0.01
			local var_187_13 = utils.random_float(-var_187_12 * 0.6, var_187_12 * 0.6)

			var_187_3 = var_187_3 + var_187_3 * var_187_13
			var_187_4 = var_187_4 + var_187_4 * var_187_13
		end

		if var_187_7 == "Default" then
			if var_187_6 > 0 and var_187_10 > 0 then
				var_187_6 = utils.random_int(var_187_6, var_187_10)
			end
		else
			var_187_6 = rage.antiaim:inverter() and var_187_9 or var_187_8
		end

		local var_187_14 = var_187_6 + utils.random_int(0, var_187_11)

		empty_0_24_1.yaw = "Backward"
		empty_0_24_1.yaw_offset = 0
		empty_0_24_1.yaw_left = var_187_3
		empty_0_24_1.yaw_right = var_187_4
		empty_0_24_1.delay = var_187_14

		return
	end
end

function func_0_30_18(arg_188_0, arg_188_1)
	if arg_188_1.yaw:get() == "Disabled" then
		return
	end

	local var_188_0 = arg_188_1.yaw_modifier:get()
	local var_188_1 = arg_188_1.modifier_offset:get()

	empty_0_24_1.yaw_modifier = var_188_0
	empty_0_24_1.modifier_offset = var_188_1
end

function func_0_31_22(arg_189_0, arg_189_1)
	local var_189_0 = arg_189_1.body_limit_left:get()
	local var_189_1 = arg_189_1.body_limit_right:get()
	local var_189_2 = arg_189_1.body_limit_random_left:get()
	local var_189_3 = arg_189_1.body_limit_random_right:get()

	empty_0_24_1.body_yaw = arg_189_1.body_yaw:get()
	empty_0_24_1.inverter = arg_189_1.body_inverter:get()
	empty_0_24_1.left_limit = utils.random_int(var_189_0, var_189_0 - var_189_2)
	empty_0_24_1.right_limit = utils.random_int(var_189_1, var_189_1 - var_189_3)
	empty_0_24_1.options = arg_189_1.body_yaw_options:get()
	empty_0_24_1.freestanding_body_yaw = arg_189_1.body_freestanding:get()

	if arg_189_1.body_random_jitter:get() then
		table.insert(empty_0_24_1.options, "Randomize Jitter")
	end
end

function func_0_32_25(arg_190_0, arg_190_1)
	arg_190_0.view_angles.z = arg_190_1.roll:get()

	if arg_190_1.change_on_fakelag:get() and rage.exploit:get() ~= 1 then
		arg_190_0.view_angles.z = arg_190_1.roll_fakelag:get()
	end
end

function empty_0_27_6.update(arg_191_0, arg_191_1, arg_191_2)
	empty_0_24_1.enabled = true

	func_0_28_10(arg_191_1, arg_191_2)
	func_0_29_14(arg_191_1, arg_191_2)
	func_0_30_18(arg_191_1, arg_191_2)
	func_0_31_22(arg_191_1, arg_191_2)
	func_0_32_25(arg_191_1, arg_191_2)
end

empty_0_28_9 = {}

function func_0_29_13(arg_192_0)
	if not arg_192_0.force_break_lc:get() then
		return false
	end

	if cfg_0_5_0.ragebot.double_tap:get() then
		return arg_192_0.on_exploit:get("Double Tap")
	end

	if cfg_0_5_0.ragebot.hide_shots:get() then
		return arg_192_0.on_exploit:get("Hide Shots")
	end

	return false
end

function lerp_func_2(arg_193_0, arg_193_1)
	cfg_0_5_0.ragebot.double_tap_option:override()
	cfg_0_5_0.ragebot.hide_shots_option:override()

	if not arg_193_1.force_break_lc:get() then
		return
	end

	local var_193_0
	local var_193_1

	if cfg_0_5_0.ragebot.double_tap_option:get() == "Always On" then
		var_193_0 = "On Peek"
	end

	if cfg_0_5_0.ragebot.hide_shots_option:get() == "Break LC" then
		var_193_1 = "Favor Fire Rate"
	end

	if arg_193_1.on_exploit:get("Double Tap") then
		var_193_0 = "Always On"
	end

	if arg_193_1.on_exploit:get("Hide Shots") then
		var_193_1 = "Break LC"
	end

	cfg_0_5_0.ragebot.double_tap_option:override(var_193_0)
	cfg_0_5_0.ragebot.hide_shots_option:override(var_193_1)
end

cfg_0_31_21 = {
	update_pitch = function(arg_194_0, arg_194_1, arg_194_2, arg_194_3)
		arg_194_3.pitch = arg_194_2.default.pitch:get()
		arg_194_3.pitch_offset = arg_194_2.default.pitch_offset:get()
		arg_194_3.pitch_offset_from = arg_194_2.default.pitch_offset_from:get()
		arg_194_3.pitch_offset_to = arg_194_2.default.pitch_offset_to:get()
		arg_194_3.pitch_speed = arg_194_2.default.pitch_speed:get()
	end,
	update_yaw = function(arg_195_0, arg_195_1, arg_195_2, arg_195_3)
		local var_195_0 = arg_195_2.default.yaw:get()

		if var_195_0 == "Static" then
			arg_195_3.yaw_offset = arg_195_2.default.yaw_offset:get()

			return
		end

		if var_195_0 == "Side-base" then
			local var_195_1 = arg_195_2.default.yaw_offset:get()

			arg_195_3.yaw_offset = 0
			arg_195_3.yaw_left = -var_195_1
			arg_195_3.yaw_right = var_195_1

			return
		end

		if var_195_0 == "Spin" then
			local var_195_2 = globals.curtime * (arg_195_2.default.yaw_speed:get() * 0.1)

			arg_195_3.yaw_offset = cfg_0_7_0.lerp(arg_195_2.default.yaw_left:get(), arg_195_2.default.yaw_right:get(), var_195_2 % 1)

			return
		end

		if var_195_0 == "Random" then
			arg_195_3.yaw_offset = utils.random_int(arg_195_2.default.yaw_left:get(), arg_195_2.default.yaw_right:get())

			return
		end

		if var_195_0 == "Left/Right" then
			arg_195_3.yaw_offset = 0
			arg_195_3.yaw_left = arg_195_2.default.yaw_left:get()
			arg_195_3.yaw_right = arg_195_2.default.yaw_right:get()

			return
		end
	end
}
cfg_0_32_24 = {
	update_pitch = function(arg_196_0, arg_196_1, arg_196_2, arg_196_3)
		arg_196_3.pitch = arg_196_2.flick.pitch:get()
		arg_196_3.pitch_offset = arg_196_2.flick.pitch_offset:get()
		arg_196_3.pitch_offset_from = arg_196_2.flick.pitch_offset_from:get()
		arg_196_3.pitch_offset_to = arg_196_2.flick.pitch_offset_to:get()
		arg_196_3.pitch_speed = arg_196_2.flick.pitch_speed:get()
	end,
	update_yaw = function(arg_197_0, arg_197_1, arg_197_2, arg_197_3)
		local var_197_0 = arg_197_2.flick.yaw:get()

		if var_197_0 == "Static" then
			arg_197_3.yaw_offset = arg_197_2.flick.yaw_offset:get()

			return
		end

		if var_197_0 == "Side-base" then
			local var_197_1 = arg_197_2.flick.yaw_offset:get()

			arg_197_3.yaw_offset = 0
			arg_197_3.yaw_left = -var_197_1
			arg_197_3.yaw_right = var_197_1

			return
		end

		if var_197_0 == "Spin" then
			local var_197_2 = globals.curtime * (arg_197_2.flick.yaw_speed:get() * 0.1)

			arg_197_3.yaw_offset = cfg_0_7_0.lerp(arg_197_2.flick.yaw_left:get(), arg_197_2.flick.yaw_right:get(), var_197_2 % 1)

			return
		end

		if var_197_0 == "Random" then
			arg_197_3.yaw_offset = utils.random_int(arg_197_2.flick.yaw_left:get(), arg_197_2.flick.yaw_right:get())

			return
		end

		if var_197_0 == "Left/Right" then
			arg_197_3.yaw_offset = 0
			arg_197_3.yaw_left = arg_197_2.flick.yaw_left:get()
			arg_197_3.yaw_right = arg_197_2.flick.yaw_right:get()

			return
		end
	end,
	update_speed = function(arg_198_0, arg_198_1, arg_198_2, arg_198_3)
		local var_198_0 = arg_198_2.flick.speed:get()

		arg_198_1.force_defensive = arg_198_1.command_number % var_198_0 == 0
	end
}

function func_0_33_28(arg_199_0, arg_199_1, arg_199_2)
	local var_199_0 = arg_199_1.type:get()

	if var_199_0 == "Default" then
		cfg_0_31_21:update_pitch(arg_199_0, arg_199_1, arg_199_2)
		cfg_0_31_21:update_yaw(arg_199_0, arg_199_1, arg_199_2)
	end

	if var_199_0 == "Flick" then
		cfg_0_32_24:update_pitch(arg_199_0, arg_199_1, arg_199_2)
		cfg_0_32_24:update_yaw(arg_199_0, arg_199_1, arg_199_2)
		cfg_0_32_24:update_speed(arg_199_0, arg_199_1, arg_199_2)
	end
end

function empty_0_28_9.update(arg_200_0, arg_200_1, arg_200_2)
	lerp_func_2(arg_200_1, arg_200_2)

	if func_0_29_13(arg_200_2) then
		local var_200_0 = {}

		empty_0_24_1.hidden = true

		func_0_33_28(arg_200_1, arg_200_2, var_200_0)

		empty_0_24_1.defensive = var_200_0
	end
end

function empty_0_25_1.get(arg_201_0, arg_201_1, arg_201_2)
	local var_201_0 = ref_0_26_3[arg_201_1]

	if var_201_0 == nil then
		return nil
	end

	return var_201_0[arg_201_2]
end

function empty_0_25_1.is_active_ex(arg_202_0, arg_202_1)
	if arg_202_1.enabled == nil then
		return true
	end

	return arg_202_1.enabled:get()
end

function empty_0_25_1.is_active(arg_203_0, arg_203_1, arg_203_2)
	local var_203_0 = arg_203_0:get(arg_203_1, arg_203_2)

	if var_203_0 == nil then
		return false
	end

	return arg_203_0:is_active_ex(var_203_0)
end

function empty_0_25_1.apply_ex(arg_204_0, arg_204_1, arg_204_2)
	empty_0_27_6:update(arg_204_1, arg_204_2.angles)
	empty_0_28_9:update(arg_204_1, arg_204_2.defensive)
end

function empty_0_25_1.apply(arg_205_0, arg_205_1, arg_205_2, arg_205_3)
	local var_205_0 = arg_205_0:get(arg_205_2, arg_205_3)

	if var_205_0 == nil then
		return nil
	end

	if not arg_205_0:is_active_ex(var_205_0) then
		return nil
	end

	arg_205_0:apply_ex(arg_205_1, var_205_0)

	return var_205_0
end

function empty_0_25_1.update(arg_206_0, arg_206_1, arg_206_2)
	local var_206_0 = empty_0_22_0.get()
	local var_206_1 = var_206_0[#var_206_0]

	return empty_0_25_1:apply(arg_206_1, arg_206_2, var_206_1) or empty_0_25_1:apply(arg_206_1, arg_206_2, "Shared")
end

empty_0_26_2 = {}
ref_0_27_5 = empty_0_15_0.antiaim.tweaks

function empty_0_26_2.update(arg_207_0)
	empty_0_24_1.avoid_backstab = ref_0_27_5.avoid_backstab:get()
end

empty_0_27_4 = {}
ref_0_28_8 = empty_0_15_0.antiaim.tweaks
const_0_29_12 = 45

function lerp_func()
	local var_208_0 = entity.get_local_player()

	if var_208_0 == nil then
		return nil
	end

	local var_208_1 = var_208_0:get_eye_position()

	if var_208_1 == nil then
		return nil
	end

	local var_208_2 = -180
	local var_208_3 = {}

	while var_208_2 < 180 do
		local var_208_4 = var_208_1 + vector():angles(0, var_208_2, 0) * 25

		if utils.trace_line(var_208_1, var_208_4, var_208_0, 4294967295, 0):did_hit() then
			table.insert(var_208_3, var_208_2)
		end

		var_208_2 = var_208_2 + const_0_29_12
	end

	local var_208_5 = #var_208_3

	if var_208_5 == 0 then
		return nil
	end

	local var_208_6 = var_208_3[1]

	if var_208_5 >= 2 then
		var_208_6 = cfg_0_7_0.lerp(var_208_3[1], var_208_3[var_208_5], 0.5)
	end

	local var_208_7 = render.camera_angles()

	if math.normalize_yaw(var_208_6 - var_208_7.y + 90) < 0 then
		return nil
	end

	return math.normalize_yaw(var_208_6 * 2 - var_208_7.y)
end

function empty_0_27_4.update(arg_209_0)
	if not ref_0_28_8.edge_yaw:get() then
		return
	end

	local var_209_0 = lerp_func()

	if var_209_0 == nil then
		return
	end

	empty_0_24_1.yaw_base = "Local View"
	empty_0_24_1.yaw = "Static"
	empty_0_24_1.yaw_offset = var_209_0
end

empty_0_28_7 = {}
ref_0_29_11 = empty_0_15_0.antiaim.tweaks
cfg_0_30_15 = {
	Right = 90,
	Left = -90,
	Forward = 180,
	Backward = 0
}

function animstate_func()
	return cfg_0_30_15[ref_0_29_11.manuals:get()]
end

function empty_0_28_7.update(arg_211_0, arg_211_1)
	local var_211_0 = animstate_func()

	if var_211_0 == nil then
		return false
	end

	local var_211_1 = empty_0_15_0.antiaim.tweaks.static_manual:get()
	local var_211_2 = empty_0_24_1.yaw_offset or 0

	if var_211_1 then
		empty_0_24_1.body_yaw = true
		empty_0_24_1.inverter = false
		empty_0_24_1.left_limit = 60
		empty_0_24_1.right_limit = 60
		empty_0_24_1.freestanding_body_yaw = "Peek Fake"
		empty_0_24_1.options = {
			"Avoid Overlap",
			"Anti Bruteforce"
		}
		empty_0_24_1.delay = 0
		empty_0_24_1.yaw_offset = var_211_0
		empty_0_24_1.yaw_modifier = "Off"
		empty_0_24_1.yaw_left = 0
		empty_0_24_1.yaw_right = 0
	else
		empty_0_24_1.yaw_offset = var_211_2 + var_211_0
	end

	empty_0_24_1.yaw_base = "Local View"
	empty_0_24_1.freestanding = false

	return true
end

empty_0_29_10 = {}
ref_0_30_14 = empty_0_15_0.antiaim.animation_breaker
ref_0_31_19 = cfg_0_5_0.antiaim.misc.leg_movement
ffi_type_decl_3 = ffi.typeof("            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ")

function func_0_33_27(arg_212_0)
	return ffi.cast(ffi_type_decl_3, ffi.cast("uintptr_t", arg_212_0[0]) + 10640)[0]
end

function func_0_34_28(arg_213_0, arg_213_1)
	local var_213_0 = ref_0_30_14.falling:get()

	if var_213_0 == 0 then
		return
	end

	arg_213_0.m_flPoseParameter[6] = var_213_0 * 0.01
end

function func_0_35_28(arg_214_0, arg_214_1)
	local var_214_0 = ref_0_30_14.list:get()

	if var_214_0 == 1 then
		ref_0_31_19:override()

		return
	end

	if var_214_0 == 2 then
		local var_214_1 = globals.tickcount % 4 > 1 and ref_0_30_14.jitter:get() / 100 or 1

		arg_214_0.m_flPoseParameter[0] = var_214_1

		ref_0_31_19:override("Sliding")

		return
	end

	if var_214_0 == 3 then
		local var_214_2 = globals.tickcount
		local var_214_3 = ref_0_30_14.legs_delta:get()
		local var_214_4 = ref_0_30_14.legs_delta_2:get()
		local var_214_5 = 1 / (var_214_2 % 8 >= 4 and 200 or 400)
		local var_214_6 = var_214_2 % 4 >= 2 and var_214_3 or var_214_4

		arg_214_0.m_flPoseParameter[0] = var_214_6 * var_214_5

		ref_0_31_19:override("Sliding")

		return
	end

	if var_214_0 == 4 then
		local var_214_7 = ref_0_30_14.from:get() / 100
		local var_214_8 = ref_0_30_14.to:get() / 100

		arg_214_0.m_flPoseParameter[0] = globals.client_tick % 3 == 0 and var_214_7 or var_214_8

		ref_0_31_19:override(globals.tickcount % 3 == 0 and "Walking" or "Sliding")

		return
	end

	ref_0_31_19:override()
end

function ui_callback_8(arg_215_0)
	local var_215_0 = ref_0_30_14.leaning:get()

	if var_215_0 == 0 or not empty_0_19_0.is_moving then
		return
	end

	arg_215_0[12].m_flWeight = var_215_0 / 100
end

function ui_callback_10(arg_216_0)
	if entity.get_local_player() ~= arg_216_0 then
		return
	end

	if arg_216_0:get_anim_state() == nil then
		return
	end

	local var_216_0 = func_0_33_27(arg_216_0)

	if var_216_0 == nil then
		return
	end

	if empty_0_19_0.is_onground then
		func_0_35_28(arg_216_0, var_216_0)
	else
		func_0_34_28(arg_216_0, var_216_0)
	end

	ui_callback_8(var_216_0)
end

unused_0_38_21 = nil

function ui_callback_14(arg_217_0)
	local var_217_0 = arg_217_0:get()

	if not var_217_0 then
		ref_0_31_19:override()
	end

	events.post_update_clientside_animation(ui_callback_10, var_217_0)
end

ref_0_30_14.enabled:set_callback(ui_callback_14, true)

empty_0_30_13 = {}
ref_0_31_18 = empty_0_15_0.antiaim.freestanding

function func_0_32_22(arg_218_0, arg_218_1)
	return arg_218_0:get(arg_218_1) or arg_218_0:get("Shared")
end

function func_0_33_26()
	local var_219_0 = empty_0_22_0.get()
	local var_219_1 = var_219_0[#var_219_0]

	if func_0_32_22(ref_0_31_18.disablers, var_219_1) then
		return false
	end

	if func_0_32_22(ref_0_31_18.enablers, var_219_1) then
		return true
	end

	return ref_0_31_18.enabled:get()
end

function func_0_34_27()
	local var_220_0 = rage.antiaim:get_target(false)
	local var_220_1 = rage.antiaim:get_target(true)

	if var_220_0 == nil or var_220_1 == nil then
		return nil
	end

	return var_220_1 - var_220_0
end

function func_0_35_27()
	local var_221_0 = ref_0_31_18.body_yaw:get()

	if var_221_0 == "Disabled" then
		return
	end

	if var_221_0 == "Static" then
		empty_0_24_1.body_yaw = true
		empty_0_24_1.left_limit = 60
		empty_0_24_1.right_limit = 60
		empty_0_24_1.options = {
			"Avoid Overlap",
			"Anti Bruteforce"
		}
		empty_0_24_1.freestanding_body_yaw = "Peek Fake"
		empty_0_24_1.delay = 0

		return
	end

	if var_221_0 == "Jitter" then
		empty_0_24_1.body_yaw = true
		empty_0_24_1.left_limit = 60
		empty_0_24_1.right_limit = 60
		empty_0_24_1.options = {
			"Jitter"
		}
		empty_0_24_1.freestanding_body_yaw = "Off"
		empty_0_24_1.delay = 0

		return
	end
end

function empty_0_30_13.update(arg_222_0)
	empty_0_24_1.freestanding = func_0_33_26()
	empty_0_24_1.freestanding_disable_yaw_modifiers = false
	empty_0_24_1.freestanding_body_freestanding = false

	if empty_0_24_1.freestanding and func_0_34_27() ~= nil then
		func_0_35_27()
	end
end

empty_0_31_17 = {}
ref_0_32_21 = empty_0_15_0.antiaim.tweaks

function func_0_33_25(arg_223_0)
	return arg_223_0:get_weapon_index() == 31
end

function func_0_34_26(arg_224_0)
	local var_224_0 = arg_224_0:get_weapon_info()

	if var_224_0 == nil then
		return false
	end

	if var_224_0.weapon_type ~= 0 then
		return false
	end

	if func_0_33_25(arg_224_0) then
		return false
	end

	return true
end

function func_0_35_26()
	local var_225_0 = entity.get_local_player()
	local var_225_1 = entity.get_threat()

	if var_225_0 == nil or var_225_1 == nil then
		return nil
	end

	local var_225_2 = var_225_0:get_player_weapon()

	if var_225_2 == nil then
		return nil
	end

	local var_225_3 = var_225_0:get_origin() - var_225_1:get_origin()
	local var_225_4 = func_0_34_26(var_225_2)
	local var_225_5 = func_0_33_25(var_225_2)

	if empty_0_19_0.is_onground and not empty_0_19_0.is_moving and not empty_0_19_0.is_crouched and ref_0_32_21.safe_head:get("Standing") then
		return "Standing"
	end

	if empty_0_19_0.is_onground and empty_0_19_0.is_crouched and var_225_3.z > 50 and ref_0_32_21.safe_head:get("Crouch") then
		return "Crouch"
	end

	if not empty_0_19_0.is_onground and var_225_4 and var_225_3.z > -15 and ref_0_32_21.safe_head:get("Air Crouch Knife") then
		return "Air Crouch Knife"
	end

	if not empty_0_19_0.is_onground and var_225_5 and var_225_3.z > -15 and ref_0_32_21.safe_head:get("Taser in Air") then
		return "Taser in Air"
	end

	return nil
end

function empty_0_31_17.update(arg_226_0, arg_226_1)
	if func_0_35_26() == nil then
		return false
	end

	empty_0_24_1.pitch = "Down"
	empty_0_24_1.yaw_base = "At Target"
	empty_0_24_1.yaw = "Backward"
	empty_0_24_1.yaw_offset = 10
	empty_0_24_1.yaw_left = 0
	empty_0_24_1.yaw_right = 0
	empty_0_24_1.yaw_modifier = "Off"
	empty_0_24_1.modifier_offset = 0
	empty_0_24_1.body_yaw = true
	empty_0_24_1.left_limit = 0
	empty_0_24_1.right_limit = 0
	empty_0_24_1.freestanding_body_yaw = "Off"
	empty_0_24_1.defensive = nil

	return true
end

empty_0_32_20 = {}
ref_0_33_24 = empty_0_15_0.antiaim.tweaks

function lerp_func_8()
	local var_227_0 = entity.get_local_player()

	if var_227_0 == nil then
		return false
	end

	local var_227_1 = var_227_0.m_iTeamNum
	local var_227_2 = entity.get_player_resource()

	for iter_227_0 = 1, globals.max_players do
		if not var_227_2.m_bConnected[iter_227_0] then
			-- block empty
		else
			local var_227_3 = entity.get(iter_227_0)

			if var_227_3 == nil or var_227_3 == var_227_0 then
				-- block empty
			elseif var_227_3.m_iTeam == var_227_1 then
				-- block empty
			elseif var_227_3:is_alive() then
				return false
			end
		end
	end

	return true
end

function lerp_func_12()
	local var_228_0 = entity.get_game_rules()

	if var_228_0 == nil then
		return false
	end

	return var_228_0.m_bWarmupPeriod
end

function lerp_func_15()
	if ref_0_33_24.warmup_aa:get("No enemies") and lerp_func_8() then
		return true
	end

	if ref_0_33_24.warmup_aa:get("Warmup") and lerp_func_12() then
		return true
	end

	return false
end

function empty_0_32_20.update(arg_230_0)
	if not lerp_func_15() then
		return false
	end

	local var_230_0 = cfg_0_7_0.lerp(0, 360, globals.realtime * (ref_0_33_24.warmup_aa_speed:get() * 0.1) % 1)

	empty_0_24_1.enabled = true
	empty_0_24_1.pitch = "Disabled"
	empty_0_24_1.yaw = "Backward"
	empty_0_24_1.yaw_offset = math.normalize_yaw(var_230_0)
	empty_0_24_1.yaw_modifier = "Off"
	empty_0_24_1.modifier_offset = 0
	empty_0_24_1.body_yaw = false
	empty_0_24_1.freestanding = false

	return true
end

unused_0_33_23 = nil
empty_0_33_22 = {}
cfg_0_34_24 = {
	-1,
	1,
	0,
	-1,
	1,
	0,
	-1,
	0,
	1,
	-1,
	0,
	1
}
cfg_0_35_24 = {
	-1,
	0,
	1
}
cfg_0_36_22 = {
	-1,
	-0.5,
	0,
	0.5,
	1
}
flag_0_37_23 = false
const_0_38_20 = 0
const_0_39_19 = 0

function func_0_40_16(arg_231_0)
	if type(arg_231_0) ~= "number" then
		return 1
	end

	return math.max(1, arg_231_0)
end

cfg_0_41_12 = {
	update_inverter = function(arg_232_0, arg_232_1, arg_232_2)
		if empty_0_19_0.fakelag < 6 then
			local var_232_0 = func_0_40_16(arg_232_2.delay)

			const_0_39_19 = const_0_39_19 + 1

			if var_232_0 > const_0_39_19 then
				return
			end
		end

		local var_232_1 = true

		if type(arg_232_2.options) == "table" and empty_0_6_0.find(arg_232_2.options, "Randomize Jitter") then
			var_232_1 = utils.random_int(0, 1) == 1
		end

		const_0_39_19 = 0

		if var_232_1 then
			flag_0_37_23 = not flag_0_37_23
		end

		const_0_38_20 = const_0_38_20 + 1
	end,
	update_body_yaw = function(arg_233_0, arg_233_1, arg_233_2)
		if type(arg_233_2.options) == "table" then
			local var_233_0 = empty_0_6_0.find(arg_233_2.options, "Jitter")

			if var_233_0 ~= nil then
				arg_233_2.inverter = flag_0_37_23

				table.remove(arg_233_2.options, var_233_0)
			end
		end
	end,
	update_yaw = function(arg_234_0, arg_234_1, arg_234_2)
		local var_234_0 = arg_234_2.yaw_left
		local var_234_1 = arg_234_2.yaw_right

		if var_234_0 ~= nil and var_234_1 ~= nil then
			local var_234_2 = arg_234_2.yaw_offset or 0

			if arg_234_2.inverter == true then
				arg_234_2.yaw_offset = var_234_2 + var_234_0
			end

			if arg_234_2.inverter == false then
				arg_234_2.yaw_offset = var_234_2 + var_234_1
			end
		end
	end,
	update_yaw_modifier = function(arg_235_0, arg_235_1, arg_235_2)
		if arg_235_2.yaw_modifier == "Offset" then
			local var_235_0 = arg_235_2.yaw_offset or 0
			local var_235_1 = arg_235_2.modifier_offset

			arg_235_2.yaw_modifier = "Disabled"
			arg_235_2.modifier_offset = 0

			if flag_0_37_23 then
				arg_235_2.yaw_offset = var_235_0 + var_235_1
			end

			return
		end

		if arg_235_2.yaw_modifier == "Center" then
			local var_235_2 = arg_235_2.yaw_offset or 0
			local var_235_3 = arg_235_2.modifier_offset

			if flag_0_37_23 then
				var_235_3 = -var_235_3
			end

			arg_235_2.yaw_modifier = "Disabled"
			arg_235_2.modifier_offset = 0
			arg_235_2.yaw_offset = var_235_2 + var_235_3 / 2

			return
		end

		if arg_235_2.yaw_modifier == "Skitter" then
			local var_235_4 = const_0_38_20 % #cfg_0_34_24
			local var_235_5 = cfg_0_34_24[var_235_4 + 1]
			local var_235_6 = arg_235_2.yaw_offset or 0
			local var_235_7 = arg_235_2.modifier_offset * var_235_5

			arg_235_2.yaw_modifier = "Off"
			arg_235_2.modifier_offset = 0
			arg_235_2.yaw_offset = var_235_6 + var_235_7

			return
		end

		if arg_235_2.yaw_modifier == "Spin" then
			local var_235_8 = globals.curtime * 2.5
			local var_235_9 = arg_235_2.yaw_offset or 0
			local var_235_10 = arg_235_2.modifier_offset
			local var_235_11 = cfg_0_7_0.lerp(-var_235_10, var_235_10, var_235_8 % 1)

			arg_235_2.yaw_modifier = "Off"
			arg_235_2.modifier_offset = 0
			arg_235_2.yaw_offset = var_235_9 + var_235_11

			return
		end

		if arg_235_2.yaw_modifier == "Random" then
			local var_235_12 = arg_235_2.yaw_offset or 0
			local var_235_13 = arg_235_2.modifier_offset
			local var_235_14 = utils.random_int(-var_235_13, var_235_13)

			arg_235_2.yaw_modifier = "Disabled"
			arg_235_2.modifier_offset = 0
			arg_235_2.yaw_offset = var_235_12 + var_235_14

			return
		end

		if arg_235_2.yaw_modifier == "3-Way" then
			local var_235_15 = const_0_38_20 % #cfg_0_35_24
			local var_235_16 = cfg_0_35_24[var_235_15 + 1]
			local var_235_17 = arg_235_2.yaw_offset or 0
			local var_235_18 = arg_235_2.modifier_offset * var_235_16

			arg_235_2.yaw_modifier = "Off"
			arg_235_2.modifier_offset = 0
			arg_235_2.yaw_offset = var_235_17 + var_235_18

			return
		end

		if arg_235_2.yaw_modifier == "5-Way" then
			local var_235_19 = const_0_38_20 % #cfg_0_36_22
			local var_235_20 = cfg_0_36_22[var_235_19 + 1]
			local var_235_21 = arg_235_2.yaw_offset or 0
			local var_235_22 = arg_235_2.modifier_offset * var_235_20

			arg_235_2.yaw_modifier = "Off"
			arg_235_2.modifier_offset = 0
			arg_235_2.yaw_offset = var_235_21 + var_235_22

			return
		end
	end,
	update = function(arg_236_0, arg_236_1, arg_236_2)
		if arg_236_2 == nil then
			return
		end

		if arg_236_1.choked_commands == 0 then
			arg_236_0:update_inverter(arg_236_1, arg_236_2)
		end

		arg_236_0:update_body_yaw(arg_236_1, arg_236_2)
		arg_236_0:update_yaw(arg_236_1, arg_236_2)
		arg_236_0:update_yaw_modifier(arg_236_1, arg_236_2)
	end
}
cfg_0_42_10 = {
	update_pitch = function(arg_237_0, arg_237_1, arg_237_2)
		local var_237_0 = arg_237_2.defensive

		if var_237_0 == nil then
			return
		end

		local var_237_1 = var_237_0.pitch or "Disabled"
		local var_237_2 = var_237_0.pitch_offset or 0
		local var_237_3 = var_237_0.pitch_offset_from or 0
		local var_237_4 = var_237_0.pitch_offset_to or 0
		local var_237_5 = var_237_0.pitch_speed or 10

		if var_237_1 == "Static" then
			rage.antiaim:override_hidden_pitch(var_237_2)
		end

		if var_237_1 == "Jitter" then
			local var_237_6 = empty_0_19_0.sent_packets % 2 == 0 and var_237_3 or var_237_4

			rage.antiaim:override_hidden_pitch(var_237_6)
		end

		if var_237_1 == "Spin" then
			local var_237_7 = globals.curtime * (var_237_5 * 0.1)
			local var_237_8 = cfg_0_7_0.lerp(var_237_3, var_237_4, var_237_7 % 1)

			rage.antiaim:override_hidden_pitch(var_237_8)
		end

		if var_237_1 == "Random" then
			local var_237_9 = utils.random_int(var_237_3, var_237_4)

			rage.antiaim:override_hidden_pitch(var_237_9)
		end
	end,
	update_yaw = function(arg_238_0, arg_238_1, arg_238_2)
		local var_238_0 = arg_238_2.defensive

		if var_238_0 == nil then
			return
		end

		if var_238_0.pitch_offset == nil then
			return
		end

		local var_238_1 = var_238_0.yaw_offset or 0

		if arg_238_2.yaw_offset ~= nil then
			var_238_1 = var_238_1 - arg_238_2.yaw_offset
		end

		if var_238_0.yaw_left ~= nil and flag_0_37_23 == true then
			var_238_1 = var_238_1 + var_238_0.yaw_left
		end

		if var_238_0.yaw_right ~= nil and flag_0_37_23 == false then
			var_238_1 = var_238_1 + var_238_0.yaw_right
		end

		if var_238_0.yaw_modifier == "Offset" then
			local var_238_2 = var_238_0.modifier_offset

			if not flag_0_37_23 then
				var_238_2 = 0
			end

			var_238_1 = var_238_1 + var_238_2
		end

		if var_238_0.yaw_modifier == "Center" then
			local var_238_3 = var_238_0.modifier_offset * 0.5

			if not flag_0_37_23 then
				var_238_3 = -var_238_3
			end

			var_238_1 = var_238_1 + var_238_3
		end

		if var_238_0.yaw_modifier == "Skitter" then
			local var_238_4 = var_238_0.modifier_offset
			local var_238_5 = const_0_38_20 % #skitter

			var_238_1 = var_238_1 + var_238_4 * skitter[var_238_5 + 1]
		end

		rage.antiaim:override_hidden_yaw_offset(-var_238_1)
	end,
	update = function(arg_239_0, arg_239_1, arg_239_2)
		if arg_239_2 == nil then
			return
		end

		arg_239_0:update_pitch(arg_239_1, arg_239_2)
		arg_239_0:update_yaw(arg_239_1, arg_239_2)
	end
}

function empty_0_33_22.update(arg_240_0, arg_240_1)
	rage.antiaim:override_hidden_yaw_offset(0)
	cfg_0_41_12:update(arg_240_1, empty_0_24_1)
	cfg_0_42_10:update(arg_240_1, empty_0_24_1)
end

function on_createmove_25()
	local var_241_0 = entity.get_local_player()

	if var_241_0 == nil then
		return nil
	end

	local var_241_1 = var_241_0.m_iTeamNum

	if var_241_1 == 2 then
		return "T"
	end

	if var_241_1 == 3 then
		return "CT"
	end

	return nil
end

function on_createmove_27(arg_242_0)
	local var_242_0 = on_createmove_25()

	empty_0_26_2:update()

	if empty_0_32_20:update() then
		return
	end

	empty_0_25_1:update(arg_242_0, var_242_0)

	if empty_0_28_7:update(arg_242_0) then
		return
	end

	empty_0_27_4:update()
	empty_0_30_13:update()
	empty_0_31_17:update(arg_242_0)
end

function on_createmove_29(arg_243_0)
	empty_0_33_22:update(arg_243_0)
end

function on_createmove_31()
	empty_0_24_1:unset()
end

function on_createmove_33(arg_245_0)
	empty_0_24_1:clear()
	empty_0_24_1:unset()
	on_createmove_27(arg_245_0)
	on_createmove_29(arg_245_0)
	empty_0_24_1:set()
end

events.shutdown(on_createmove_31)
events.createmove(on_createmove_33)

unused_0_24_0 = nil
unused_0_25_0 = nil
unused_0_26_1 = nil
ref_0_27_3 = empty_0_15_0.misc.ragebot.ai_peek
ref_0_28_6 = cfg_0_5_0.ragebot.double_tap
ref_0_29_9 = cfg_0_5_0.ragebot.minimum_damage
cfg_0_30_12 = {
	cfg_0_5_0.ragebot.peek_assist,
	cfg_0_5_0.ragebot.peek_assist_auto_stop,
	cfg_0_5_0.ragebot.peek_assist_retreat
}
ffi_type_decl = ffi.typeof("float[3]")
ffi_type_decl_2 = ffi.typeof("uint8_t[4]")
unused_0_33_21 = nil
ffi_type_decl_4 = ffi.typeof("                    void(__thiscall*)(\n                        void*,\n                        float origin[3],\n                        float mins[3],\n                        float maxs[3],\n                        float angles[3],\n                        uint8_t face_color[4],\n                        uint8_t edge_color[4],\n                        float duration\n                    )\n                ")
utils_get_vfunc = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, ffi_type_decl_4)
const_0_34_21 = 1
const_0_35_22 = 5
const_0_36_20 = 0
const_0_37_21 = 3
const_0_38_18 = 5
const_0_39_18 = 7
const_0_40_15 = 8
const_0_41_11 = 9
const_0_42_9 = 10
const_0_43_9 = 11
const_0_44_10 = 12
const_0_45_11 = 15
const_0_46_10 = 17
cfg_0_47_10 = {
	Head = {
		const_0_36_20
	},
	Chest = {
		const_0_38_18
	},
	Stomach = {
		const_0_37_21
	},
	Arms = {
		const_0_46_10,
		const_0_45_11
	},
	Legs = {
		const_0_40_15,
		const_0_39_18,
		const_0_42_9,
		const_0_41_11
	}
}
const_0_48_8 = 1
const_0_49_8 = 2
const_0_50_6 = 3
const_0_51_3 = 4
const_0_52_1 = 5
const_0_53_1 = 6
const_0_54_1 = 7
cfg_0_55_2 = {
	[const_0_36_20] = const_0_48_8,
	[const_0_38_18] = const_0_49_8,
	[const_0_37_21] = const_0_50_6,
	[const_0_40_15] = const_0_53_1,
	[const_0_39_18] = const_0_54_1,
	[const_0_44_10] = const_0_53_1,
	[const_0_43_9] = const_0_54_1,
	[const_0_46_10] = const_0_51_3,
	[const_0_45_11] = const_0_52_1
}
unused_0_56_3 = nil
empty_0_56_2 = {}

function func_0_57_2(arg_246_0, arg_246_1)
	empty_0_56_2[arg_246_0] = arg_246_1
end

function func_0_58_2(arg_247_0)
	return {
		hit_chance = ui.find("Aimbot", "Ragebot", "Selection", arg_247_0, "Hit Chance"),
		head_scale = ui.find("Aimbot", "Ragebot", "Selection", arg_247_0, "Multipoint", "Head Scale"),
		body_scale = ui.find("Aimbot", "Ragebot", "Selection", arg_247_0, "Multipoint", "Body Scale")
	}
end

func_0_57_2("AutoSnipers", func_0_58_2("AutoSnipers"))
func_0_57_2("AWP", func_0_58_2("AWP"))
func_0_57_2("SSG-08", func_0_58_2("SSG-08"))
func_0_57_2("Desert Eagle", func_0_58_2("Desert Eagle"))
func_0_57_2("R8 Revolver", func_0_58_2("R8 Revolver"))
func_0_57_2("Pistols", func_0_58_2("Pistols"))

unused_0_57_1 = nil
const_0_58_1 = 0
unused_0_59_1 = nil

function func_0_60_1(arg_248_0)
	return arg_248_0[0]
end

function func_0_61_1()
	unused_0_57_1 = nil
	const_0_58_1 = 0
	unused_0_59_1 = nil
end

function func_0_62_1()
	for iter_250_0, iter_250_1 in pairs(empty_0_56_2) do
		iter_250_1.hit_chance:override()
		iter_250_1.head_scale:override()
		iter_250_1.body_scale:override()
	end

	ref_0_28_6:override()
	cfg_0_30_12[3]:override()
end

function func_0_63_1()
	local var_251_0 = ref_0_27_3.hitchance:get()

	for iter_251_0, iter_251_1 in pairs(empty_0_56_2) do
		if var_251_0 ~= 0 then
			iter_251_1.hit_chance:override(var_251_0)
		end

		iter_251_1.head_scale:override(100)
		iter_251_1.body_scale:override(100)
	end

	cfg_0_30_12[3]:override("On Shot")
end

function func_0_64_1(arg_252_0)
	if arg_252_0 == 1 then
		return 4
	end

	if arg_252_0 == 3 then
		return 1.25
	end

	if arg_252_0 == 6 or arg_252_0 == 7 then
		return 0.75
	end

	return 1
end

function func_0_65_1(arg_253_0, arg_253_1, arg_253_2, arg_253_3, arg_253_4)
	local var_253_0 = arg_253_2 - arg_253_1
	local var_253_1 = math.min(arg_253_0.range, var_253_0:length())
	local var_253_2 = arg_253_0.damage * math.pow(arg_253_0.range_modifier, var_253_1 * 0.002) * func_0_64_1(arg_253_4)

	if arg_253_3.m_ArmorValue > 0 and (arg_253_4 ~= 1 or arg_253_3.m_bHasHelmet) then
		var_253_2 = var_253_2 * (arg_253_0.armor_ratio / 2)
	end

	return var_253_2
end

function func_0_66_1()
	local var_254_0 = {}
	local var_254_1 = ref_0_27_3.hitboxes:get()

	for iter_254_0 = 1, #var_254_1 do
		local var_254_2 = var_254_1[iter_254_0]
		local var_254_3 = cfg_0_47_10[var_254_2]

		for iter_254_1 = 1, #var_254_3 do
			table.insert(var_254_0, var_254_3[iter_254_1])
		end
	end

	return var_254_0
end

function func_0_67_1(arg_255_0, arg_255_1)
	local var_255_0 = arg_255_0:get_weapon_index()
	local var_255_1 = arg_255_1.weapon_type

	if var_255_1 == const_0_34_21 then
		if var_255_0 == 1 then
			return "Desert Eagle"
		end

		if var_255_0 == 64 then
			return "R8 Revolver"
		end

		return "Pistols"
	end

	if var_255_1 == const_0_35_22 then
		if var_255_0 == 9 then
			return "AWP"
		end

		if var_255_0 == 40 then
			return "SSG-08"
		end

		return "AutoSnipers"
	end

	return nil
end

function func_0_68_1(arg_256_0, arg_256_1, arg_256_2, arg_256_3, arg_256_4)
	local var_256_0 = {}
	local var_256_1 = arg_256_3.m_iHealth
	local var_256_2 = arg_256_1:get_eye_position()
	local var_256_3 = arg_256_2:get_weapon_info()

	for iter_256_0 = 1, #arg_256_0 do
		local var_256_4 = arg_256_0[iter_256_0]
		local var_256_5 = cfg_0_55_2[var_256_4] or 0
		local var_256_6 = arg_256_3:get_hitbox_position(var_256_4)
		local var_256_7 = func_0_65_1(var_256_3, var_256_2, var_256_6, arg_256_3, var_256_5)

		if arg_256_4 <= var_256_7 or var_256_1 <= var_256_7 then
			table.insert(var_256_0, var_256_6)
		end
	end

	return var_256_0
end

function func_0_69_1(arg_257_0)
	if arg_257_0 == nil or not pcall(func_0_60_1, arg_257_0) then
		return false
	end

	return true
end

function func_0_70_1(arg_258_0, arg_258_1, arg_258_2)
	if arg_258_0 == nil or arg_258_1 == nil then
		return false
	end

	local var_258_0 = arg_258_2.max_clip1 > 0 and arg_258_1.m_iClip1 > 0
	local var_258_1 = globals.curtime >= arg_258_0.m_flNextAttack and globals.curtime >= arg_258_1.m_flNextPrimaryAttack

	return var_258_0 and var_258_1
end

function func_0_71_1(arg_259_0, arg_259_1)
	local var_259_0 = ref_0_27_3.rate_limit:get() * 0.01

	if var_259_0 > 0 then
		const_0_58_1 = math.max(0, const_0_58_1 - globals.frametime)

		if const_0_58_1 > 0 then
			return false
		end

		const_0_58_1 = var_259_0
	end

	if arg_259_0.in_forward or arg_259_0.in_back or arg_259_0.in_moveleft or arg_259_0.in_moveright then
		return false
	end

	local var_259_1 = arg_259_1.m_fFlags

	if bit.band(var_259_1, 1) == 0 then
		return false
	end

	if arg_259_1.m_vecVelocity:length2dsqr() > 480 then
		return false
	end

	return true
end

function func_0_72_1(arg_260_0, arg_260_1)
	local var_260_0 = {
		ctx = arg_260_0,
		target = arg_260_1
	}

	var_260_0.simtime = 0
	var_260_0.retreat = -1
	var_260_0.teleport = 0

	return var_260_0
end

function func_0_73_1(arg_261_0)
	utils_get_vfunc(ffi_type_decl(arg_261_0.origin:unpack()), ffi_type_decl(arg_261_0.obb_mins:unpack()), ffi_type_decl(arg_261_0.obb_maxs:unpack()), ffi_type_decl(), ffi_type_decl_2(), ffi_type_decl_2(ref_0_27_3.color:get():unpack()), globals.tickinterval * 2)
end

function func_0_74_0(arg_262_0)
	arg_262_0.in_forward = true
	arg_262_0.in_back = false
	arg_262_0.in_moveleft = false
	arg_262_0.in_moveright = false
	arg_262_0.in_duck = false
	arg_262_0.in_jump = false
	arg_262_0.in_speed = false
end

function func_0_75_0(arg_263_0, arg_263_1, arg_263_2)
	local function var_263_0(arg_264_0)
		if arg_264_0 == arg_263_0 then
			return false
		end

		if not arg_264_0:is_enemy() then
			return false
		end

		return true
	end

	return utils.trace_bullet(arg_263_0, arg_263_1, arg_263_2, var_263_0)
end

function func_0_76_0(arg_265_0, arg_265_1)
	local var_265_0
	local var_265_1
	local var_265_2 = arg_265_0:get_origin()
	local var_265_3 = (arg_265_1:get_origin() - var_265_2):angles().y + 180
	local var_265_4 = var_265_3 - 90
	local var_265_5 = var_265_3 + 90

	return var_265_4, var_265_5
end

function func_0_77_0(arg_266_0, arg_266_1, arg_266_2, arg_266_3, arg_266_4)
	local var_266_0 = arg_266_2.m_iHealth

	for iter_266_0 = 1, #arg_266_3 do
		local var_266_1 = arg_266_3[iter_266_0]
		local var_266_2 = func_0_75_0(arg_266_0, arg_266_1, var_266_1)
		local var_266_3 = arg_266_4 <= var_266_2
		local var_266_4 = var_266_0 <= var_266_2

		if var_266_3 or var_266_4 then
			return var_266_2
		end
	end

	return nil
end

function func_0_78_0(arg_267_0, arg_267_1, arg_267_2, arg_267_3, arg_267_4, arg_267_5, arg_267_6)
	arg_267_0.view_angles.y = arg_267_2

	arg_267_1:think(1)

	if bit.band(arg_267_1.flags, 1) == 0 then
		return nil
	end

	local var_267_0 = func_0_77_0(arg_267_3, arg_267_1.origin + vector(0, 0, arg_267_1.view_offset), arg_267_4, arg_267_5, arg_267_6)

	if var_267_0 ~= nil then
		arg_267_1:think(1)
	end

	return {
		ctx = arg_267_1,
		damage = var_267_0
	}
end

function func_0_79_0(arg_268_0, arg_268_1, arg_268_2, arg_268_3, arg_268_4)
	local var_268_0 = true
	local var_268_1 = true
	local var_268_2 = arg_268_1:simulate_movement(nil, vector(), 1)
	local var_268_3 = arg_268_1:simulate_movement(nil, vector(), 1)
	local var_268_4, var_268_5 = func_0_76_0(arg_268_1, arg_268_2)

	for iter_268_0 = 1, 25 do
		if var_268_0 then
			local var_268_6 = func_0_78_0(arg_268_0, var_268_2, var_268_4, arg_268_1, arg_268_2, arg_268_3, arg_268_4)

			if var_268_6 ~= nil and var_268_6.damage ~= nil then
				return func_0_72_1(var_268_6.ctx, arg_268_2)
			end

			if var_268_6 == nil then
				var_268_0 = false
			end
		end

		if var_268_1 then
			local var_268_7 = func_0_78_0(arg_268_0, var_268_3, var_268_5, arg_268_1, arg_268_2, arg_268_3, arg_268_4)

			if var_268_7 ~= nil and var_268_7.damage ~= nil then
				return func_0_72_1(var_268_7.ctx, arg_268_2)
			end

			if var_268_7 == nil then
				var_268_1 = false
			end
		end
	end
end

function func_0_80_0(arg_269_0, arg_269_1, arg_269_2, arg_269_3, arg_269_4)
	local var_269_0 = arg_269_0.view_angles:clone()
	local var_269_1 = arg_269_0.forwardmove
	local var_269_2 = arg_269_0.sidemove
	local var_269_3 = arg_269_0.in_duck
	local var_269_4 = arg_269_0.in_jump
	local var_269_5 = arg_269_0.in_speed

	arg_269_0.forwardmove = 450
	arg_269_0.sidemove = 0
	arg_269_0.in_duck = false
	arg_269_0.in_jump = false
	arg_269_0.in_speed = false

	local var_269_6 = func_0_79_0(arg_269_0, arg_269_1, arg_269_2, arg_269_3, arg_269_4)

	arg_269_0.view_angles.y = var_269_0.y
	arg_269_0.forwardmove = var_269_1
	arg_269_0.sidemove = var_269_2
	arg_269_0.in_duck = var_269_3
	arg_269_0.in_jump = var_269_4
	arg_269_0.in_speed = var_269_5

	return var_269_6
end

function func_0_81_0(arg_270_0, arg_270_1, arg_270_2)
	local var_270_0 = ref_0_29_9:get()
	local var_270_1 = func_0_66_1()

	if unused_0_57_1 ~= nil and func_0_69_1(unused_0_57_1.target) then
		local var_270_2 = unused_0_57_1.ctx
		local var_270_3 = unused_0_57_1.target
		local var_270_4 = var_270_3.m_iHealth

		if var_270_0 >= 100 then
			var_270_0 = var_270_0 - 100 + var_270_4
		end

		local var_270_5 = func_0_68_1(var_270_1, arg_270_1, arg_270_2, var_270_3, var_270_0)

		if func_0_77_0(arg_270_1, var_270_2.origin + vector(0, 0, var_270_2.view_offset), var_270_3, var_270_5, var_270_0) ~= nil then
			unused_0_57_1.simtime = 0
		end

		unused_0_57_1.simtime = unused_0_57_1.simtime + globals.frametime

		return true
	end

	if not func_0_71_1(arg_270_0, arg_270_1) then
		return false
	end

	local var_270_6 = entity.get_threat()

	if var_270_6 == nil or var_270_6:is_dormant() then
		return false
	end

	local var_270_7 = var_270_6.m_iHealth

	if var_270_0 >= 100 then
		var_270_0 = var_270_0 - 100 + var_270_7
	end

	local var_270_8 = func_0_68_1(var_270_1, arg_270_1, arg_270_2, var_270_6, var_270_0)

	if func_0_77_0(arg_270_1, arg_270_1:get_eye_position(), var_270_6, var_270_8, var_270_0) then
		return false
	end

	local var_270_9 = func_0_80_0(arg_270_0, arg_270_1, var_270_6, var_270_8, var_270_0)

	if var_270_9 ~= nil then
		unused_0_57_1 = var_270_9
	end

	return unused_0_57_1 ~= nil
end

function func_0_82_0()
	rage.exploit:force_teleport()
	ref_0_28_6:override(false)
end

function func_0_83_0(arg_272_0, arg_272_1, arg_272_2)
	local var_272_0 = 450
	local var_272_1 = arg_272_2 - arg_272_1:get_origin()
	local var_272_2 = var_272_1:angles()
	local var_272_3 = var_272_1:length2dsqr()
	local var_272_4 = var_272_3 < 10

	if var_272_4 then
		local var_272_5 = arg_272_1.m_vecVelocity

		var_272_0 = -var_272_5:length()
		var_272_2 = var_272_5:angles()
	end

	arg_272_0.move_yaw = var_272_2.y
	arg_272_0.forwardmove = var_272_0
	arg_272_0.sidemove = 0

	func_0_74_0(arg_272_0)
	func_0_63_1()

	return var_272_4, var_272_3
end

function func_0_84_0(arg_273_0, arg_273_1, arg_273_2, arg_273_3)
	local var_273_0 = func_0_81_0(arg_273_0, arg_273_1, arg_273_2)

	if unused_0_57_1 == nil then
		return
	end

	if unused_0_57_1.simtime > ref_0_27_3.simulation:get() * 0.01 then
		var_273_0 = false
	end

	if arg_273_3.weapon_type == 5 and not arg_273_1.m_bIsScoped then
		var_273_0 = false
	end

	if var_273_0 and unused_0_57_1.retreat <= 0 then
		local var_273_1 = unused_0_57_1.ctx

		if unused_0_59_1 == nil then
			local var_273_2 = arg_273_1:get_origin()
			local var_273_3 = (var_273_1.origin - var_273_2):normalize()
			local var_273_4 = var_273_1.obb_mins
			local var_273_5 = var_273_1.obb_maxs

			unused_0_59_1 = utils.trace_hull(var_273_2, var_273_1.origin - var_273_3 * 25, var_273_4, var_273_5, arg_273_1, 33636363, 0).end_pos
		end

		local var_273_6 = func_0_83_0(arg_273_0, arg_273_1, var_273_1.origin)

		unused_0_57_1.retreat = var_273_6 and 1 or 0

		func_0_73_1(var_273_1)

		return
	end

	if not func_0_70_1(arg_273_1, arg_273_2, arg_273_3) then
		func_0_61_1()

		return
	end

	if unused_0_57_1.ctx ~= nil and unused_0_57_1.retreat ~= -1 then
		local var_273_7 = func_0_83_0(arg_273_0, arg_273_1, unused_0_59_1)

		if arg_273_1.m_vecVelocity:length2dsqr() > 1600 then
			func_0_82_0()
		end

		unused_0_57_1.retreat = unused_0_57_1.retreat + 1

		if var_273_7 then
			func_0_62_1()
			func_0_61_1()
		end
	end
end

function on_createmove_45(arg_274_0)
	local var_274_0 = entity.get_local_player()

	if var_274_0 == nil then
		return
	end

	local var_274_1 = var_274_0:get_player_weapon()

	if var_274_1 == nil then
		return
	end

	local var_274_2 = var_274_1:get_weapon_info()

	if var_274_2 == nil then
		return
	end

	local var_274_3 = func_0_67_1(var_274_1, var_274_2)

	if not (cfg_0_30_12[1]:get() and ref_0_27_3.weapons:get(var_274_3)) then
		func_0_62_1()
		func_0_61_1()

		return
	end

	func_0_84_0(arg_274_0, var_274_0, var_274_1, var_274_2)
end

function on_createmove_46()
	func_0_61_1()
end

unused_0_87_0 = nil

function on_createmove_47(arg_276_0)
	local var_276_0 = arg_276_0:get()

	if not var_276_0 then
		func_0_62_1()
		func_0_61_1()
	end

	events.aim_fire(on_createmove_46, var_276_0)
	events.createmove(on_createmove_45, var_276_0)
end

ref_0_27_3.enabled:set_callback(on_createmove_47, true)

unused_0_27_2 = nil
ref_0_28_5 = empty_0_15_0.misc.ragebot.hitchance_override
const_0_29_8 = 0.0254
ref_0_30_11 = ref_0_28_5.weapon:list()
const_0_31_15 = 0
const_0_32_18 = 0
const_0_33_19 = 0
const_0_34_20 = 0

function func_0_35_21(arg_277_0)
	local var_277_0 = empty_0_21_0.get(arg_277_0)

	return var_277_0 ~= nil and var_277_0.active
end

empty_0_36_19 = {}

for iter_0_13 = 1, #ref_0_30_11 do
	ref_0_41_10 = ref_0_30_11[iter_0_13]
	empty_0_36_19[ref_0_41_10] = {
		hit_chance = ui.find("Aimbot", "Ragebot", "Selection", ref_0_41_10, "Hit Chance"),
		auto_scope = ui.find("Aimbot", "Ragebot", "Accuracy", ref_0_41_10, "Auto Scope")
	}
end

function func_0_37_20(arg_278_0)
	local var_278_0 = arg_278_0:get_classname()

	if arg_278_0:get_weapon_info().weapon_type == 5 then
		if var_278_0 == "CWeaponAWP" then
			return "AWP"
		end

		if var_278_0 == "CWeaponSSG08" then
			return "SSG-08"
		end

		return "AutoSnipers"
	end

	return nil
end

function func_0_38_17(arg_279_0, arg_279_1, arg_279_2)
	local var_279_0 = arg_279_0:get_origin()

	return arg_279_2 >= arg_279_1:get_origin():dist(var_279_0) * const_0_29_8
end

function func_0_39_17(arg_280_0, arg_280_1, arg_280_2)
	if arg_280_0.m_bIsScoped then
		return false
	end

	if arg_280_2 == 201 then
		return true
	end

	return func_0_38_17(arg_280_0, arg_280_1, arg_280_2 * 0.1)
end

function func_0_40_13(arg_281_0)
	const_0_33_19 = arg_281_0:get() * 0.1 / const_0_29_8
	const_0_34_20 = 1.5
end

function func_0_41_9()
	local var_282_0 = globals.frametime

	const_0_34_20 = math.max(const_0_34_20 - var_282_0, 0)

	if const_0_34_20 > 0 then
		const_0_31_15 = cfg_0_7_0.interp(const_0_31_15, 1, 0.05)
		const_0_32_18 = cfg_0_7_0.interp(const_0_32_18, const_0_33_19, 0.05)

		return
	end

	const_0_31_15 = cfg_0_7_0.interp(const_0_31_15, 0, 0.05)
end

function func_0_42_8()
	if const_0_31_15 <= 0 then
		return
	end

	local var_283_0 = entity.get_local_player()

	if var_283_0 == nil or not var_283_0:is_alive() then
		return
	end

	local var_283_1 = color(255, 255, 255, 128 * const_0_31_15)
	local var_283_2 = var_283_0:get_origin()

	render.circle_3d(var_283_2, var_283_1, const_0_32_18, 0, 1, true)
end

function func_0_43_8()
	for iter_284_0, iter_284_1 in pairs(empty_0_36_19) do
		iter_284_1.hit_chance:override()
	end
end

function func_0_44_9()
	for iter_285_0, iter_285_1 in pairs(empty_0_36_19) do
		iter_285_1.auto_scope:override()
	end
end

function func_0_45_10()
	local var_286_0 = entity.get_local_player()

	if var_286_0 == nil or not var_286_0:is_alive() then
		return false, false
	end

	local var_286_1 = entity.get_threat()

	if var_286_1 == nil or not var_286_1:is_alive() then
		return false, false
	end

	local var_286_2 = var_286_0:get_player_weapon()

	if var_286_2 == nil then
		return false, false
	end

	local var_286_3 = func_0_37_20(var_286_2)

	if var_286_3 == nil then
		return false, false
	end

	local var_286_4 = empty_0_36_19[var_286_3]
	local var_286_5 = ref_0_28_5.options[var_286_3]

	if var_286_4 == nil or var_286_5 == nil then
		return false, false
	end

	if func_0_35_21(var_286_4.hit_chance) then
		return false, false
	end

	if var_286_5.modifiers:get("In Air") and not empty_0_19_0.is_onground then
		local var_286_6 = var_286_5.air_hitchance:get()

		var_286_4.hit_chance:override(var_286_6)

		return true, false
	end

	if var_286_5.modifiers:get("No Scope") then
		local var_286_7 = var_286_5.distance:get()

		if func_0_39_17(var_286_0, var_286_1, var_286_7) then
			local var_286_8 = var_286_5.ns_hitchance:get()

			var_286_4.hit_chance:override(var_286_8)
			var_286_4.auto_scope:override(false)

			return true, true
		end
	end

	return false, false
end

function on_createmove_36()
	func_0_43_8()
	func_0_44_9()
end

function on_createmove_38()
	local var_288_0, var_288_1 = func_0_45_10()

	if not var_288_0 then
		func_0_43_8()
	end

	if not var_288_1 then
		func_0_44_9()
	end
end

function on_createmove_40()
	func_0_41_9()
	func_0_42_8()
end

unused_0_49_7 = nil

function on_createmove_44()
	local var_290_0 = false

	for iter_290_0, iter_290_1 in pairs(ref_0_28_5.options) do
		local var_290_1 = iter_290_1.modifiers:get()

		if next(var_290_1) ~= nil then
			var_290_0 = true

			break
		end
	end

	if not ref_0_28_5.enabled:get() then
		var_290_0 = false

		on_createmove_36()
	end

	events.render(on_createmove_40, var_290_0)
	events.createmove(on_createmove_38, var_290_0)
	events.shutdown(on_createmove_36)
end

function ui_callback_25(arg_291_0)
	func_0_40_13(arg_291_0)
end

ref_0_28_5.enabled:set_callback(on_createmove_44, true)

for iter_0_14, iter_0_15 in pairs(ref_0_28_5.options) do
	iter_0_15.modifiers:set_callback(on_createmove_44, true)
	iter_0_15.distance:set_callback(ui_callback_25)
end

unused_0_28_4 = nil
ref_0_29_7 = empty_0_15_0.misc.ragebot.dormant_aimbot
unused_0_30_10 = nil
unused_0_31_14 = nil
unused_0_32_17 = nil
unused_0_33_18 = nil
unused_0_34_19 = nil
flag_0_35_20 = false
flag_0_36_18 = false
const_0_37_19 = 1
const_0_38_16 = 0
cfg_0_39_16 = {
	[0] = "generic",
	"head",
	"chest",
	"stomach",
	"left arm",
	"right arm",
	"left leg",
	"right leg",
	"neck",
	nil,
	"gear"
}
cfg_0_40_12 = {
	{
		scale = 5,
		hitbox = "Stomach",
		vec = vector(0, 0, 40)
	},
	{
		scale = 6,
		hitbox = "Chest",
		vec = vector(0, 0, 50)
	},
	{
		scale = 3,
		hitbox = "Head",
		vec = vector(0, 0, 58)
	},
	{
		scale = 4,
		hitbox = "Legs",
		vec = vector(0, 0, 20)
	}
}

function func_0_41_8(arg_292_0)
	return arg_292_0 >= 1 and arg_292_0 <= 6
end

function func_0_42_7()
	local var_293_0 = {}
	local var_293_1 = entity.get_player_resource()

	for iter_293_0 = 1, globals.max_players do
		local var_293_2 = entity.get(iter_293_0)

		if var_293_2 == nil then
			-- block empty
		elseif not (var_293_1.m_bConnected[iter_293_0] and var_293_2:is_enemy() and var_293_2:is_dormant()) then
			-- block empty
		else
			table.insert(var_293_0, var_293_2)
		end
	end

	return var_293_0
end

function func_0_43_7(arg_294_0, arg_294_1, arg_294_2)
	local var_294_0 = arg_294_0:to(arg_294_1):angles()
	local var_294_1 = math.rad(var_294_0.y + 90)
	local var_294_2 = vector(math.cos(var_294_1), math.sin(var_294_1), 0) * arg_294_2

	return {
		{
			text = "Middle",
			vec = arg_294_1
		},
		{
			text = "Left",
			vec = arg_294_1 + var_294_2
		},
		{
			text = "Right",
			vec = arg_294_1 - var_294_2
		}
	}
end

function func_0_44_8(arg_295_0, arg_295_1, arg_295_2, arg_295_3)
	local var_295_0, var_295_1 = utils.trace_bullet(arg_295_0, arg_295_1, arg_295_2, arg_295_3)

	if var_295_1 ~= nil then
		local var_295_2 = var_295_1.entity

		if var_295_2 == nil then
			return 0, var_295_1
		end

		if var_295_2:is_player() and not var_295_2:is_enemy() then
			return 0, var_295_1
		end
	end

	return var_295_0, var_295_1
end

function func_0_45_9(arg_296_0)
	cfg_0_5_0.ragebot.dormant_aimbot:override(false)

	local var_296_0 = entity.get_local_player()
	local var_296_1 = var_296_0:get_player_weapon()

	if var_296_1 == nil then
		return
	end

	local var_296_2 = var_296_1:get_weapon_info()

	if var_296_2 == nil then
		return
	end

	local var_296_3 = var_296_1:get_inaccuracy()

	if var_296_3 == nil then
		return
	end

	local var_296_4 = globals.tickcount
	local var_296_5 = var_296_0:get_eye_position()
	local var_296_6 = var_296_0:get_simulation_time().current
	local var_296_7 = bit.band(var_296_0.m_fFlags, bit.lshift(1, 0)) ~= 0

	if var_296_4 < const_0_38_16 then
		return
	end

	if arg_296_0.in_jump and not var_296_7 then
		return
	end

	local var_296_8 = var_296_2.weapon_type

	if not func_0_41_8(var_296_8) or var_296_1.m_iClip1 <= 0 then
		return false
	end

	local var_296_9 = func_0_42_7()
	local var_296_10 = ref_0_29_7.hitbox:get()

	if var_296_4 % #var_296_9 ~= 0 then
		const_0_37_19 = const_0_37_19 + 1
	else
		const_0_37_19 = 1
	end

	local var_296_11 = var_296_9[const_0_37_19]

	if var_296_11 == nil then
		return
	end

	local var_296_12 = var_296_11:get_bbox()
	local var_296_13 = var_296_11:get_origin()
	local var_296_14 = var_296_11.m_flDuckAmount
	local var_296_15 = ref_0_29_7.accuracy:get()
	local var_296_16 = ref_0_29_7.damage:get()

	if var_296_16 == 0 then
		var_296_16 = cfg_0_5_0.ragebot.minimum_damage:get()
	end

	if var_296_16 > 100 then
		var_296_16 = var_296_16 - 100 + var_296_11.m_iHealth
	end

	local var_296_17 = {}

	for iter_296_0 = 1, #cfg_0_40_12 do
		local var_296_18 = cfg_0_40_12[iter_296_0]
		local var_296_19 = var_296_18.vec
		local var_296_20 = var_296_18.scale
		local var_296_21 = var_296_18.hitbox

		if var_296_21 == "Head" then
			var_296_19 = var_296_19 - vector(0, 0, 10 * var_296_14)
		end

		if var_296_21 == "Chest" then
			var_296_19 = var_296_19 - vector(0, 0, 4 * var_296_14)
		end

		if #var_296_10 ~= 0 then
			if empty_0_6_0.contains(var_296_10, var_296_21) then
				table.insert(var_296_17, {
					vec = var_296_19,
					scale = var_296_20,
					hitbox = var_296_21
				})
			end
		else
			table.insert(var_296_17, 1, {
				vec = var_296_19,
				scale = var_296_20,
				hitbox = var_296_21
			})
		end
	end

	if not (var_296_2.is_revolver and var_296_6 > var_296_1.m_flNextPrimaryAttack or var_296_6 > math.max(var_296_0.m_flNextAttack, var_296_1.m_flNextPrimaryAttack, var_296_1.m_flNextSecondaryAttack)) then
		return
	end

	local var_296_22
	local var_296_23

	if var_296_15 > math.floor(var_296_12.alpha * 100) + 5 then
		return
	end

	for iter_296_1 = 1, #var_296_17 do
		local var_296_24 = var_296_17[iter_296_1]
		local var_296_25 = func_0_43_7(var_296_5, var_296_13 + var_296_24.vec, var_296_24.scale)

		for iter_296_2 = 1, #var_296_25 do
			local var_296_26 = var_296_25[iter_296_2]
			local var_296_27 = var_296_26.vec
			local var_296_28, var_296_29 = func_0_44_8(var_296_0, var_296_5, var_296_27, function(arg_297_0)
				return arg_297_0 == var_296_11
			end)

			if var_296_29 ~= nil and var_296_29:is_visible() then
				-- block empty
			elseif var_296_28 ~= 0 and var_296_16 < var_296_28 then
				var_296_22 = var_296_27
				var_296_23 = var_296_28
				unused_0_30_10 = var_296_11
				unused_0_32_17 = var_296_24.hitbox
				unused_0_33_18 = var_296_28
				unused_0_31_14 = var_296_26.text
				unused_0_34_19 = var_296_12.alpha

				break
			end
		end

		if var_296_22 and var_296_23 then
			break
		end
	end

	if not var_296_22 or not var_296_23 then
		return
	end

	local var_296_30 = var_296_5:to(var_296_22):angles()

	arg_296_0.block_movement = 1

	if var_296_3 < 0.01 then
		arg_296_0.view_angles = var_296_30
		arg_296_0.in_attack = true
		flag_0_36_18 = true
	end
end

function on_createmove_35()
	cfg_0_5_0.ragebot.dormant_aimbot:override()
end

function on_createmove_37(arg_299_0)
	utils.execute_after(0.03, function()
		if entity.get(arg_299_0.userid, true) == entity.get_local_player() then
			if flag_0_36_18 and not flag_0_35_20 then
				events.dormant_miss:call({
					userid = unused_0_30_10,
					aim_hitbox = unused_0_32_17,
					aim_damage = unused_0_33_18,
					aim_point = unused_0_31_14,
					accuracy = unused_0_34_19
				})
			end

			flag_0_35_20 = false
			flag_0_36_18 = false
			unused_0_30_10 = nil
			unused_0_32_17 = nil
			unused_0_33_18 = nil
			unused_0_31_14 = nil
			unused_0_34_19 = nil
		end
	end)
end

function on_createmove_39(arg_301_0)
	local var_301_0 = entity.get_local_player()
	local var_301_1 = entity.get(arg_301_0.userid, true)
	local var_301_2 = entity.get(arg_301_0.attacker, true)

	if var_301_1 == nil or var_301_2 ~= var_301_0 then
		return
	end

	local var_301_3 = var_301_1:get_bbox()

	if var_301_3 == nil then
		return
	end

	if var_301_1:is_dormant() and flag_0_36_18 == true then
		flag_0_35_20 = true

		events.dormant_hit:call({
			userid = var_301_1,
			attacker = var_301_2,
			health = arg_301_0.health,
			armor = arg_301_0.armor,
			weapon = arg_301_0.weapon,
			dmg_health = arg_301_0.dmg_health,
			dmg_armor = arg_301_0.dmg_armor,
			hitgroup = arg_301_0.hitgroup,
			accuracy = var_301_3.alpha,
			hitbox = cfg_0_39_16[arg_301_0.hitgroup],
			aim_point = unused_0_31_14,
			aim_hitbox = unused_0_32_17,
			aim_damage = unused_0_33_18
		})
	end
end

unused_0_49_6 = nil

function on_createmove_43(arg_302_0)
	local var_302_0 = arg_302_0:get()

	if not var_302_0 then
		cfg_0_5_0.ragebot.dormant_aimbot:override()
	end

	events.shutdown(on_createmove_35)
	events.createmove(func_0_45_9, var_302_0)
	events.weapon_fire(on_createmove_37, var_302_0)
	events.player_hurt(on_createmove_39, var_302_0)
end

ref_0_29_7.enabled:set_callback(on_createmove_43, true)

unused_0_29_6 = nil
ref_0_30_9 = empty_0_15_0.misc.ragebot.fake_latency

function on_shutdown()
	cfg_0_5_0.misc.fake_latency:override()
	cfg_0_5_0.misc.fake_latency:disabled(false)
end

function on_shutdown_2(arg_304_0)
	cfg_0_5_0.misc.fake_latency:override(arg_304_0)
	cfg_0_5_0.misc.fake_latency:disabled(true)
end

unused_0_33_17 = nil

function on_shutdown_6(arg_305_0)
	on_shutdown_2(arg_305_0:get())
end

function on_shutdown_9(arg_306_0)
	local var_306_0 = arg_306_0:get()

	if not var_306_0 then
		on_shutdown()
	end

	if var_306_0 then
		ref_0_30_9.value:set_callback(on_shutdown_6, true)
	else
		ref_0_30_9.value:unset_callback(on_shutdown_6)
	end

	events.shutdown(on_shutdown, var_306_0)
end

ref_0_30_9.enabled:set_callback(on_shutdown_9, true)

unused_0_26_0 = nil
unused_0_27_1 = nil
ref_0_28_3 = empty_0_15_0.misc.miscellaneous.aimbot_logs
cfg_0_29_5 = {
	[0] = "generic",
	"head",
	"chest",
	"stomach",
	"left arm",
	"right arm",
	"left leg",
	"right leg",
	"neck",
	nil,
	"gear"
}
empty_0_30_8 = {}

function on_aim_ack(arg_307_0, arg_307_1, arg_307_2)
	return "\a" .. arg_307_1 .. arg_307_0 .. "\a" .. arg_307_2
end

function on_aim_ack_2(arg_308_0)
	print_raw(arg_308_0)
end

function on_aim_ack_3(arg_309_0)
	print_dev(arg_309_0)
end

function on_aim_ack_4(arg_310_0)
	table.insert(empty_0_30_8, arg_310_0)

	if #empty_0_30_8 > 6 then
		table.remove(empty_0_30_8, 1)
	end
end

function on_aim_ack_5(arg_311_0, arg_311_1)
	if type(arg_311_0) ~= "string" then
		error("log state is not a string")
	end

	if type(arg_311_1) ~= "table" then
		error("log data is not a table")
	end

	local var_311_0 = {
		state = arg_311_0,
		data = arg_311_1
	}

	var_311_0.alpha = 0
	var_311_0.time = globals.realtime + 5

	return var_311_0
end

function on_aim_ack_6(arg_312_0)
	if arg_312_0.state == "hit" then
		if ref_0_28_3.override_color:get() then
			return ref_0_28_3.color:get("Hit")[1]
		end

		return color(160, 150, 240)
	end

	if arg_312_0.state == "miss" then
		if ref_0_28_3.override_color:get() then
			return ref_0_28_3.color:get("Miss")[1]
		end

		return color(230, 140, 140)
	end

	return color()
end

function on_aim_ack_7()
	local var_313_0 = {}

	for iter_313_0 = 1, #empty_0_30_8 do
		table.insert(var_313_0, empty_0_30_8[iter_313_0])
	end

	return var_313_0
end

function on_aim_ack_8(arg_314_0)
	return on_aim_ack(empty_0_4_0.name .. " » ", on_aim_ack_6(arg_314_0):to_hex(), "DEFAULT")
end

function on_aim_ack_9(arg_315_0)
	local var_315_0 = on_aim_ack_6(arg_315_0):to_hex()
	local var_315_1 = "DEFAULT"

	if arg_315_0.state == "hit" then
		local var_315_2 = arg_315_0.data

		return string.format("Registered shot in %s %s for %s dmg (hc: %s | bt: %s | dmg: %s | hitgroup: %s)", on_aim_ack(var_315_2.name, var_315_0, var_315_1), var_315_2.hitgroup, on_aim_ack(var_315_2.damage, var_315_0, var_315_1), on_aim_ack(var_315_2.hitchance .. "%", var_315_0, var_315_1), on_aim_ack(var_315_2.backtrack .. "t", var_315_0, var_315_1), on_aim_ack(var_315_2.wanted_dmg, var_315_0, var_315_1), on_aim_ack(var_315_2.wanted_hitgroup, var_315_0, var_315_1))
	end

	if arg_315_0.state == "miss" then
		local var_315_3 = arg_315_0.data

		return string.format("Missed shot at %s %s due to %s (dmg: %s | bt: %s | hc: %s)", on_aim_ack(var_315_3.name, var_315_0, var_315_1), var_315_3.hitgroup, on_aim_ack(var_315_3.reason, var_315_0, var_315_1), on_aim_ack(var_315_3.damage, var_315_0, var_315_1), on_aim_ack(var_315_3.backtrack .. "t", var_315_0, var_315_1), on_aim_ack(var_315_3.hitchance .. "%", var_315_0, var_315_1))
	end

	return ""
end

function on_aim_ack_10()
	local var_316_0 = globals.realtime

	for iter_316_0 = #empty_0_30_8, 1, -1 do
		local var_316_1 = empty_0_30_8[iter_316_0]
		local var_316_2 = var_316_0 > var_316_1.time

		var_316_1.alpha = cfg_0_7_0.interp(var_316_1.alpha, not var_316_2, 0.05)

		if var_316_2 and var_316_1.alpha <= 0 then
			table.remove(empty_0_30_8, iter_316_0)
		end
	end
end

function on_aim_ack_11(arg_317_0)
	local var_317_0 = ref_0_28_3.options:get(1)
	local var_317_1 = ref_0_28_3.options:get(2)
	local var_317_2 = ref_0_28_3.options:get(3)
	local var_317_3 = on_aim_ack_8(arg_317_0) .. on_aim_ack_9(arg_317_0)

	if var_317_0 then
		on_aim_ack_2(var_317_3)
	end

	if var_317_1 then
		on_aim_ack_3(var_317_3)
	end

	if var_317_2 then
		on_aim_ack_4(arg_317_0)
	end
end

empty_0_42_6 = {}
const_0_43_6 = 10
const_0_44_7 = 6

function on_aim_ack_13()
	local var_318_0 = render.screen_size()

	return (vector(var_318_0.x * 0.5, var_318_0.y * 0.65))
end

function render_damage_4(arg_319_0, arg_319_1)
	local var_319_0 = arg_319_1:to_hex()
	local var_319_1 = "DEFAULT"
	local var_319_2 = ui.get_icon("stars")

	if arg_319_0.state == "hit" then
		local var_319_3 = arg_319_0.data

		return string.format("%s Hit %s %s (%d%%) for %s dmg", on_aim_ack(var_319_2, var_319_0, var_319_1), on_aim_ack(var_319_3.name .. "'s", var_319_0, var_319_1), var_319_3.hitgroup, var_319_3.hitchance, on_aim_ack(var_319_3.damage, var_319_0, var_319_1))
	end

	if arg_319_0.state == "miss" then
		local var_319_4 = arg_319_0.data

		return string.format("%s Missed %s %s (%d%%) due to %s", on_aim_ack(var_319_2, var_319_0, var_319_1), on_aim_ack(var_319_4.name .. "'s", var_319_0, var_319_1), var_319_4.hitgroup, var_319_4.hitchance, on_aim_ack(var_319_4.reason, var_319_0, var_319_1))
	end

	return ""
end

function render_func_13(arg_320_0, arg_320_1, arg_320_2, arg_320_3)
	local var_320_0 = 5
	local var_320_1 = color(20, 20, 20, 170)

	var_320_1.a = var_320_1.a * arg_320_3

	local var_320_2 = color(100, 100, 100, 170)

	var_320_2.a = var_320_2.a * arg_320_3

	local var_320_3 = arg_320_2:clone()

	var_320_3.a = var_320_3.a * arg_320_3

	render.shadow(arg_320_0, arg_320_1, var_320_3, 20, 0, var_320_0)
	render.rect(arg_320_0, arg_320_1, var_320_1, var_320_0)
	render.rect_outline(arg_320_0, arg_320_1, var_320_2, 1, var_320_0)
end

function empty_0_42_6.draw()
	local var_321_0 = on_aim_ack_13()
	local var_321_1 = on_aim_ack_7()
	local var_321_2 = 1
	local var_321_3 = ""

	for iter_321_0 = 1, #var_321_1 do
		local var_321_4 = var_321_1[iter_321_0]
		local var_321_5 = var_321_4.alpha
		local var_321_6 = on_aim_ack_6(var_321_4)
		local var_321_7 = render_damage_4(var_321_4, var_321_6)
		local var_321_8 = color(255, 255, 255, 255)

		var_321_8.a = var_321_8.a * var_321_5

		local var_321_9 = render.measure_text(var_321_2, var_321_3, var_321_7) + vector(const_0_43_6, const_0_44_7) * 2
		local var_321_10 = var_321_0 - vector(var_321_9.x / 2, 0)
		local var_321_11 = var_321_10 + vector(const_0_43_6, const_0_44_7)

		render_func_13(var_321_10, var_321_10 + var_321_9, var_321_6, var_321_5)
		render.text(var_321_2, var_321_11, var_321_8, var_321_3, var_321_7)

		var_321_0.y = var_321_0.y + math.floor((var_321_9.y + 16) * var_321_5)
	end
end

empty_0_43_5 = {}
const_0_44_6 = 10
const_0_45_7 = 6

function on_aim_ack_14()
	local var_322_0 = render.screen_size()

	return (vector(var_322_0.x * 0.5, var_322_0.y * 0.65))
end

function on_aim_ack_15(arg_323_0, arg_323_1)
	local var_323_0 = arg_323_1:to_hex()
	local var_323_1 = "DEFAULT"
	local var_323_2 = ui.get_icon("stars")

	if arg_323_0.state == "hit" then
		local var_323_3 = arg_323_0.data

		return string.format("%s Hit %s %s (%d%%) for %s dmg", on_aim_ack(var_323_2, var_323_0, var_323_1), on_aim_ack(var_323_3.name .. "'s", var_323_0, var_323_1), var_323_3.hitgroup, var_323_3.hitchance, on_aim_ack(var_323_3.damage, var_323_0, var_323_1))
	end

	if arg_323_0.state == "miss" then
		local var_323_4 = arg_323_0.data

		return string.format("%s Missed %s %s (%d%%) due to %s", on_aim_ack(var_323_2, var_323_0, var_323_1), on_aim_ack(var_323_4.name .. "'s", var_323_0, var_323_1), var_323_4.hitgroup, var_323_4.hitchance, on_aim_ack(var_323_4.reason, var_323_0, var_323_1))
	end

	return ""
end

function render_func_14(arg_324_0, arg_324_1, arg_324_2)
	local var_324_0 = arg_324_1.x - arg_324_0.x
	local var_324_1 = math.floor(var_324_0) / 2
	local var_324_2 = arg_324_2:alpha_modulate(0)

	render.gradient(arg_324_0, vector(arg_324_0.x + var_324_1, arg_324_1.y), var_324_2, arg_324_2, var_324_2, arg_324_2)
	render.gradient(arg_324_1, vector(arg_324_1.x - var_324_0 + var_324_1, arg_324_0.y), var_324_2, arg_324_2, var_324_2, arg_324_2)
end

function render_damage_11(arg_325_0, arg_325_1, arg_325_2, arg_325_3)
	local var_325_0 = arg_325_2:clone()

	var_325_0.a = var_325_0.a * arg_325_3

	render_func_14(arg_325_0, arg_325_0 + vector(arg_325_1.x - arg_325_0.x, 2), var_325_0)
end

function empty_0_43_5.draw()
	local var_326_0 = on_aim_ack_14()
	local var_326_1 = on_aim_ack_7()
	local var_326_2 = 1
	local var_326_3 = ""
	local var_326_4 = 0

	for iter_326_0 = 1, #var_326_1 do
		local var_326_5 = var_326_1[iter_326_0].alpha

		var_326_4 = math.max(var_326_4, var_326_5)
	end

	for iter_326_1 = 1, #var_326_1 do
		local var_326_6 = var_326_1[iter_326_1]
		local var_326_7 = var_326_6.alpha
		local var_326_8 = on_aim_ack_6(var_326_6)
		local var_326_9 = on_aim_ack_15(var_326_6, var_326_8)
		local var_326_10 = color(255, 255, 255, 255)

		var_326_10.a = var_326_10.a * var_326_7

		local var_326_11 = render.measure_text(var_326_2, var_326_3, var_326_9) + vector(const_0_44_6, const_0_45_7) * 2
		local var_326_12 = var_326_0 - vector(var_326_11.x / 2, 0)
		local var_326_13 = var_326_12 + vector(const_0_44_6, const_0_45_7)

		render_damage_11(var_326_12, var_326_12 + var_326_11, var_326_8, var_326_7)
		render.text(var_326_2, var_326_13, var_326_10, var_326_3, var_326_9)

		var_326_0.y = var_326_0.y + math.floor((var_326_11.y + 16) * var_326_7)
	end
end

empty_0_44_5 = {}
const_0_45_6 = 10
const_0_46_5 = 6

function render_damage_6(arg_327_0)
	return arg_327_0:sub(1, 1):upper() .. arg_327_0:sub(2)
end

function render_damage_8()
	local var_328_0 = render.screen_size()

	return (vector(var_328_0.x * 0.5, var_328_0.y * 0.65))
end

function render_damage_10(arg_329_0, arg_329_1)
	local var_329_0 = arg_329_1:to_hex()
	local var_329_1 = "DEFAULT"

	if arg_329_0.state == "hit" then
		local var_329_2 = arg_329_0.data

		return string.format("Hit %s %s (%d%%) for %s dmg bt: %s", on_aim_ack(var_329_2.name .. "'s", var_329_0, var_329_1), var_329_2.hitgroup, var_329_2.hitchance, on_aim_ack(var_329_2.damage, var_329_0, var_329_1), on_aim_ack(var_329_2.backtrack, var_329_0, var_329_1))
	end

	if arg_329_0.state == "miss" then
		local var_329_3 = arg_329_0.data

		return string.format("Missed %s %s (%d%%) due to %s dmg: %s bt: %s", on_aim_ack(var_329_3.name .. "'s", var_329_0, var_329_1), var_329_3.hitgroup, var_329_3.hitchance, on_aim_ack(var_329_3.reason, var_329_0, var_329_1), on_aim_ack(var_329_3.damage, var_329_0, var_329_1), on_aim_ack(var_329_3.backtrack, var_329_0, var_329_1))
	end

	return ""
end

function render_func_15(arg_330_0, arg_330_1, arg_330_2, arg_330_3)
	local var_330_0 = 5
	local var_330_1 = color(35, 40, 70, 170)

	var_330_1.a = var_330_1.a * arg_330_3

	local var_330_2 = color(90, 116, 180, 255)

	var_330_2.a = var_330_2.a * arg_330_3

	local var_330_3 = arg_330_2:clone()

	var_330_3.a = var_330_3.a * arg_330_3

	render.shadow(arg_330_0, arg_330_1, var_330_3, 20, 0, var_330_0)
	render.rect(arg_330_0, arg_330_1, var_330_1, var_330_0)
	render.rect_outline(arg_330_0, arg_330_1, var_330_2, 1, var_330_0)
end

function empty_0_44_5.draw()
	local var_331_0 = render_damage_8()
	local var_331_1 = on_aim_ack_7()
	local var_331_2 = 1
	local var_331_3 = ""
	local var_331_4 = 1
	local var_331_5 = ""
	local var_331_6 = render_damage_6(empty_0_4_0.name)
	local var_331_7 = render.measure_text(var_331_4, var_331_5, var_331_6)

	for iter_331_0 = 1, #var_331_1 do
		local var_331_8 = var_331_1[iter_331_0]
		local var_331_9 = var_331_8.alpha
		local var_331_10 = on_aim_ack_6(var_331_8)
		local var_331_11 = render_damage_10(var_331_8, var_331_10)
		local var_331_12 = var_331_10:clone()

		var_331_12.a = var_331_12.a * var_331_9

		local var_331_13 = color(255, 255, 255, 255)

		var_331_13.a = var_331_13.a * var_331_9

		local var_331_14 = render.measure_text(var_331_2, var_331_3, var_331_11)
		local var_331_15 = vector(var_331_7.x + var_331_14.x + 5, math.max(var_331_7.y, var_331_14.y)) + vector(const_0_45_6, const_0_46_5) * 2
		local var_331_16 = var_331_0 - vector(var_331_15.x / 2, 0)
		local var_331_17 = var_331_16 + vector(const_0_45_6, const_0_46_5)

		render_func_15(var_331_16, var_331_16 + var_331_15, var_331_10, var_331_9)
		render.text(var_331_4, var_331_17, var_331_12, var_331_5, var_331_6)

		var_331_17.x = var_331_17.x + var_331_7.x + 4

		render.text(var_331_2, var_331_17, var_331_13, var_331_3, var_331_11)

		var_331_0.y = var_331_0.y + math.floor((var_331_15.y + 16) * var_331_9)
	end
end

function on_aim_ack_12(arg_332_0)
	local var_332_0 = arg_332_0.target

	if var_332_0 == nil then
		return
	end

	local var_332_1 = var_332_0:get_name() or "unknown"
	local var_332_2 = arg_332_0.damage or 0
	local var_332_3 = cfg_0_29_5[arg_332_0.hitgroup] or "?"
	local var_332_4 = cfg_0_29_5[arg_332_0.wanted_hitgroup] or "?"
	local var_332_5 = arg_332_0.hitchance or 0
	local var_332_6 = arg_332_0.backtrack or 0
	local var_332_7 = on_aim_ack_5("hit", {
		name = var_332_1,
		damage = var_332_2,
		hitgroup = var_332_3,
		hitchance = var_332_5,
		backtrack = var_332_6,
		wanted_dmg = arg_332_0.wanted_damage,
		wanted_hitgroup = var_332_4
	})

	on_aim_ack_11(var_332_7)
end

function ui_callback_21(arg_333_0)
	local var_333_0 = arg_333_0.target

	if var_333_0 == nil then
		return
	end

	local var_333_1 = var_333_0:get_name() or "unknown"
	local var_333_2 = arg_333_0.wanted_damage or 0
	local var_333_3 = arg_333_0.state or "unknown"
	local var_333_4 = cfg_0_29_5[arg_333_0.wanted_hitgroup] or "?"
	local var_333_5 = arg_333_0.hitchance or 0
	local var_333_6 = arg_333_0.backtrack or 0
	local var_333_7 = on_aim_ack_5("miss", {
		name = var_333_1,
		damage = var_333_2,
		reason = var_333_3:lower(),
		hitgroup = var_333_4,
		hitchance = var_333_5,
		backtrack = var_333_6
	})

	on_aim_ack_11(var_333_7)
end

function ui_callback_22(arg_334_0)
	if arg_334_0.state == nil then
		on_aim_ack_12(arg_334_0)
	else
		ui_callback_21(arg_334_0)
	end
end

unused_0_48_3 = nil

function on_createmove_41(arg_335_0)
	local var_335_0 = arg_335_0:get()

	events.render(empty_0_42_6.draw, var_335_0 == "Default")
	events.render(empty_0_43_5.draw, var_335_0 == "Alternative")
	events.render(empty_0_44_5.draw, var_335_0 == "Modern")
end

function on_createmove_42(arg_336_0)
	local var_336_0 = arg_336_0:get(1)
	local var_336_1 = arg_336_0:get(2)
	local var_336_2 = arg_336_0:get(3)
	local var_336_3 = var_336_0 or var_336_1 or var_336_2

	if var_336_2 then
		ref_0_28_3.screen_style:set_callback(on_createmove_41, true)
	else
		ref_0_28_3.screen_style:unset_callback(on_createmove_41)
	end

	if not var_336_2 then
		events.render(empty_0_42_6.draw, false)
		events.render(empty_0_43_5.draw, false)
		events.render(empty_0_44_5.draw, false)
	end

	events.render(on_aim_ack_10, var_336_2)
	events.aim_ack(ui_callback_22, var_336_3)
end

ref_0_28_3.options:set_callback(on_createmove_42, true)

unused_0_28_2 = nil
ref_0_29_4 = empty_0_15_0.misc.miscellaneous.exploits

function on_createmove_21()
	if cfg_0_5_0.ragebot.hide_shots:get() then
		return
	end

	if entity.get_local_player() == nil then
		return
	end

	local var_337_0 = ref_0_29_4.type:get()
	local var_337_1 = empty_0_22_0.get()
	local var_337_2 = var_337_1[#var_337_1]
	local var_337_3 = var_337_2 == "Air" or var_337_2 == "Air Crouching"

	if var_337_0 == "Air Lag" and var_337_3 then
		if globals.tickcount % (ref_0_29_4.delay:get() * 0.5) == 0 and entity.get_threat(true) then
			rage.exploit:force_teleport()
		end

		if entity.get_threat() ~= nil then
			rage.exploit:force_charge()
		end

		return
	end

	if var_337_0 == "Auto Teleport" and var_337_3 then
		if entity.get_threat(true) then
			rage.exploit:force_teleport()
		end

		return
	end
end

unused_0_31_11 = nil

function on_createmove_23(arg_338_0)
	local var_338_0 = arg_338_0:get() ~= "Disabled"

	events.createmove(on_createmove_21, var_338_0)
end

ref_0_29_4.type:set_callback(on_createmove_23, true)

unused_0_29_3 = nil
ref_0_30_6 = empty_0_15_0.misc.miscellaneous.movment.fast_ladder

function on_createmove_22(arg_339_0)
	local var_339_0 = entity.get_local_player()

	if var_339_0.m_MoveType ~= 9 then
		return
	end

	if arg_339_0.forwardmove == 0 and arg_339_0.sidemove == 0 then
		return
	end

	if bit.band(var_339_0.m_fFlags, 1) == 1 then
		return
	end

	local var_339_1 = var_339_0.m_vecLadderNormal

	if var_339_1:normalize() == 0 then
		return
	end

	local var_339_2 = var_339_1:angles()
	local var_339_3 = arg_339_0.view_angles
	local var_339_4 = 0

	if arg_339_0.forwardmove ~= 0 then
		var_339_4 = arg_339_0.forwardmove
	elseif arg_339_0.sidemove ~= 0 then
		local var_339_5 = var_339_3.y - var_339_2.y

		if var_339_5 > 180 then
			var_339_5 = var_339_5 - 360
		elseif var_339_5 < -180 then
			var_339_5 = var_339_5 + 360
		end

		if var_339_5 <= 0 then
			var_339_4 = arg_339_0.sidemove > 0 and 450 or -450
		else
			var_339_4 = arg_339_0.sidemove > 0 and -450 or 450
		end
	end

	if var_339_4 == 0 then
		return
	end

	local var_339_6 = var_339_4 > 0

	if var_339_3.x - var_339_2.x > 45 then
		var_339_6 = not var_339_6
	end

	local var_339_7 = var_339_3.y - var_339_2.y

	if var_339_7 > 180 then
		var_339_7 = var_339_7 - 360
	elseif var_339_7 < -180 then
		var_339_7 = var_339_7 + 360
	end

	local var_339_8 = var_339_7 <= 0

	arg_339_0.in_back = var_339_6 and 1 or 0
	arg_339_0.in_forward = var_339_6 and 0 or 1

	if var_339_8 then
		arg_339_0.in_moveleft = var_339_6 and 1 or 0
		arg_339_0.in_moveright = var_339_6 and 0 or 1
	else
		arg_339_0.in_moveleft = var_339_6 and 0 or 1
		arg_339_0.in_moveright = var_339_6 and 1 or 0
	end

	arg_339_0.view_angles.x = 89
	arg_339_0.view_angles.y = var_339_2.y + (var_339_8 and 90 or -90)
end

unused_0_32_13 = nil

function on_createmove_24(arg_340_0)
	local var_340_0 = arg_340_0:get()

	events.createmove(on_createmove_22, var_340_0)
end

ref_0_30_6:set_callback(on_createmove_24, true)

unused_0_30_5 = nil
ref_0_31_9 = empty_0_15_0.misc.miscellaneous.movment.no_fall_damage

function lerp_func_3(arg_341_0)
	local var_341_0 = entity.get_local_player()

	if not var_341_0 then
		return
	end

	local var_341_1 = var_341_0:get_origin()

	if var_341_0.m_vecVelocity.z > -500 then
		return
	end

	local var_341_2 = vector(var_341_1.x, var_341_1.y, var_341_1.z)
	local var_341_3 = vector(var_341_1.x, var_341_1.y, var_341_1.z - 50)
	local var_341_4 = vector(var_341_1.x, var_341_1.y, var_341_1.z - 15)

	if utils.trace_line(var_341_2, var_341_4).fraction ~= 1 then
		arg_341_0.in_duck = 0
	elseif utils.trace_line(var_341_2, var_341_3).fraction ~= 1 then
		arg_341_0.in_duck = 1
	end
end

unused_0_33_14 = nil

function lerp_func_7(arg_342_0)
	local var_342_0 = arg_342_0:get()

	events.createmove(lerp_func_3, var_342_0)
end

ref_0_31_9:set_callback(lerp_func_7, true)

unused_0_31_8 = nil
ref_0_32_11 = empty_0_15_0.misc.miscellaneous.movment.edge_quick_stop

function lerp_func_6(arg_343_0)
	local var_343_0 = entity.get_local_player()

	if not var_343_0 or not var_343_0:is_alive() then
		return
	end

	local var_343_1 = var_343_0:simulate_movement()

	var_343_1:think(5)

	if var_343_1.velocity.z < 0 then
		arg_343_0.block_movement = 2
	end
end

unused_0_34_15 = nil

function lerp_func_11(arg_344_0)
	local var_344_0 = arg_344_0:get()

	events.createmove(lerp_func_6, var_344_0)
end

ref_0_32_11:set_callback(lerp_func_11, true)

unused_0_32_10 = nil
ref_0_33_12 = empty_0_15_0.misc.miscellaneous.grenades.super_toss
const_0_34_14 = 0.3
flag_0_35_16 = false

function lerp_func_14(arg_345_0, arg_345_1, arg_345_2, arg_345_3)
	arg_345_0.x = arg_345_0.x - 10 + math.abs(arg_345_0.x) / 9

	local var_345_0 = vector():angles(arg_345_0)
	local var_345_1 = arg_345_3 * 1.25
	local var_345_2 = math.clamp(arg_345_1 * 0.9, 15, 750)
	local var_345_3 = math.clamp(arg_345_2, 0, 1)
	local var_345_4 = var_345_2 * cfg_0_7_0.lerp(const_0_34_14, 1, var_345_3)
	local var_345_5 = var_345_0

	for iter_345_0 = 1, 7 do
		var_345_5 = (var_345_0 * (var_345_5 * var_345_4 + var_345_1):length() - var_345_1) / var_345_4

		var_345_5:normalize()
	end

	local var_345_6 = var_345_5:angles()

	if var_345_6.x > -10 then
		var_345_6.x = 0.9 * var_345_6.x + 9
	else
		var_345_6.x = 1.125 * var_345_6.x + 11.25
	end

	return var_345_6
end

function on_createmove_30(arg_346_0)
	if flag_0_35_16 then
		cfg_0_5_0.misc.air_strafe:override(nil)

		flag_0_35_16 = false
	end

	local var_346_0 = entity.get_local_player()

	if var_346_0 == nil then
		return
	end

	local var_346_1 = var_346_0:get_player_weapon()

	if var_346_1 == nil then
		return
	end

	local var_346_2 = var_346_1:get_weapon_info()

	if var_346_2 == nil or var_346_2.weapon_type ~= 9 then
		return
	end

	if var_346_1.m_fThrowTime == 0 then
		return
	end

	if var_346_0.m_nTickBase * globals.tickinterval < var_346_1.m_fThrowTime and rage.exploit:get() ~= 1 then
		return
	end

	local var_346_3 = arg_346_0.view_angles

	if var_346_3 == nil then
		return
	end

	local var_346_4 = render.camera_angles()

	if not (var_346_4.x == var_346_3.x or var_346_4.y == var_346_3.y) then
		return
	end

	local var_346_5 = var_346_0:simulate_movement()

	var_346_5:think()

	arg_346_0.view_angles = lerp_func_14(var_346_3, var_346_2.throw_velocity, var_346_1.m_flThrowStrength, var_346_5.velocity)

	cfg_0_5_0.misc.air_strafe:override(false)

	flag_0_35_16 = true
end

function on_createmove_32(arg_347_0)
	local var_347_0 = entity.get_local_player()
	local var_347_1 = var_347_0:get_player_weapon()

	if var_347_1 == nil then
		return
	end

	local var_347_2 = var_347_1:get_weapon_info()

	if var_347_2 ~= nil and var_347_2.weapon_type == 9 then
		local var_347_3 = var_347_0:simulate_movement(nil, arg_347_0.velocity)

		var_347_3:think()

		arg_347_0.angles = lerp_func_14(arg_347_0.angles, var_347_2.throw_velocity, var_347_1.m_flThrowStrength, var_347_3.velocity)
	end
end

unused_0_39_14 = nil

function on_createmove_34(arg_348_0)
	local var_348_0 = arg_348_0:get()

	if not var_348_0 and flag_0_35_16 then
		cfg_0_5_0.misc.air_strafe:override(nil)

		flag_0_35_16 = false
	end

	events.createmove(on_createmove_30, var_348_0)
	events.grenade_override_view(on_createmove_32, var_348_0)
end

ref_0_33_12:set_callback(on_createmove_34, true)

unused_0_33_11 = nil
ref_0_34_13 = empty_0_15_0.misc.miscellaneous.grenades.nade_fix

function on_createmove_26(arg_349_0)
	local var_349_0 = entity.get_local_player()

	if not var_349_0 or not var_349_0:is_alive() then
		return
	end

	if entity.get(arg_349_0.userid, true) ~= var_349_0 then
		return
	end

	utils.execute_after(globals.tickinterval, function()
		utils.console_exec("slot3;slot2;slot1")
	end)
end

function on_createmove_28(arg_351_0)
	local var_351_0 = entity.get_local_player():get_player_weapon()

	if var_351_0 == nil then
		return
	end

	local var_351_1 = var_351_0:get_weapon_info()

	if var_351_1 == nil then
		return
	end

	local var_351_2 = cfg_0_5_0.misc.weapon_actions:get()

	for iter_351_0 = 1, #var_351_2 do
		if var_351_2[iter_351_0] == "Quick Switch" then
			table.remove(var_351_2, iter_351_0)
		end
	end

	cfg_0_5_0.misc.weapon_actions:override(var_351_2)

	if var_351_1.weapon_type == 9 then
		rage.exploit:allow_defensive(false)
	else
		cfg_0_5_0.misc.weapon_actions:override()
	end
end

ref_0_34_13:set_callback(function(arg_352_0)
	local var_352_0 = arg_352_0:get()

	events.grenade_thrown(on_createmove_26, var_352_0)
	events.createmove(on_createmove_28, var_352_0)
	events.shutdown(function()
		cfg_0_5_0.misc.weapon_actions:override()
	end, var_352_0)

	if not var_352_0 then
		cfg_0_5_0.misc.weapon_actions:override()
	end
end, true)

unused_0_34_12 = nil
ref_0_35_14 = empty_0_15_0.misc.miscellaneous.clantag

function render_func_6(arg_354_0, arg_354_1)
	if not globals.is_connected then
		return
	end

	local var_354_0 = "               " .. arg_354_0 .. "                      "
	local var_354_1 = (globals.tickcount + math.floor(utils.net_channel().avg_latency[0] + 0.22 / globals.tickinterval + 0.5)) / math.floor(0.3 / globals.tickinterval + 0.5)
	local var_354_2 = arg_354_1[math.floor(var_354_1 % #arg_354_1) + 1] + 1

	return string.sub(var_354_0, var_354_2, var_354_2 + 15)
end

function render_func_7()
	if not globals.is_in_game then
		return
	end

	if not globals.choked_commands then
		return
	end

	local var_355_0 = render_func_6("phantom", {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		7,
		6,
		5,
		4,
		3,
		2,
		1,
		0
	})

	if entity.get_game_rules().m_gamePhase == 5 or entity.get_game_rules().m_gamePhase == 4 then
		var_355_0 = render_func_6("phantom", {
			11
		})

		common.set_clan_tag(var_355_0)
	elseif var_355_0 ~= tag_text_prev then
		common.set_clan_tag(var_355_0)
	end

	tag_text_prev = var_355_0
end

function on_shutdown_20()
	common.set_clan_tag("")
end

unused_0_39_13 = nil

function on_shutdown_23(arg_357_0)
	local var_357_0 = arg_357_0:get()

	if not var_357_0 then
		on_shutdown_20()
	end

	events.pre_render(render_func_7, var_357_0)
end

ref_0_35_14.enabled:set_callback(on_shutdown_23, true)

unused_0_27_0 = nil
unused_0_28_1 = nil
ref_0_29_2 = empty_0_15_0.misc.changers.aspect_ratio
var_0_30_4 = cvar.r_aspectratio
unused_0_31_7 = nil

function on_shutdown_3()
	local var_358_0 = render.screen_size()

	return var_358_0.x / var_358_0.y
end

function on_shutdown_4()
	local var_359_0 = var_0_30_4:float()

	if var_359_0 == 0 then
		return on_shutdown_3()
	end

	return var_359_0
end

function on_shutdown_5()
	return ref_0_29_2.proportion:get() * 0.01
end

function on_shutdown_8()
	var_0_30_4:float(tonumber(var_0_30_4:string()), true)
end

function on_shutdown_13()
	on_shutdown_8()
end

function on_shutdown_16()
	if not ref_0_29_2.enabled:get() then
		return
	end

	if not (on_shutdown_5() > 0) then
		if unused_0_31_7 == nil then
			return
		end

		local var_363_0 = on_shutdown_3()

		unused_0_31_7 = cfg_0_7_0.interp(unused_0_31_7, var_363_0, 0.1)

		if unused_0_31_7 == var_363_0 then
			unused_0_31_7 = nil
		end

		var_0_30_4:float(unused_0_31_7 or 0, true)

		return
	end

	if unused_0_31_7 == nil then
		unused_0_31_7 = on_shutdown_4()
	end

	local var_363_1 = on_shutdown_5()

	unused_0_31_7 = cfg_0_7_0.interp(unused_0_31_7, var_363_1, 0.1)

	var_0_30_4:float(unused_0_31_7, true)
end

unused_0_38_12 = nil

function on_shutdown_22(arg_364_0)
	local var_364_0 = arg_364_0:get()

	if not var_364_0 then
		on_shutdown_8()
	end

	events.pre_render(on_shutdown_16, var_364_0)
	events.shutdown(on_shutdown_13, not var_364_0)
end

ref_0_29_2.enabled:set_callback(on_shutdown_22, true)

unused_0_29_1 = nil
ref_0_30_3 = empty_0_15_0.misc.changers.viewmodel
empty_0_31_6 = {}

function func_0_32_8(arg_365_0)
	return empty_0_6_0.get_original(arg_365_0) or 0
end

function func_0_33_9(arg_366_0)
	cvar[arg_366_0]:float(func_0_32_8(arg_366_0), true)
end

function func_0_34_10(arg_367_0, arg_367_1)
	if empty_0_31_6[arg_367_0] == arg_367_1 then
		return
	end

	empty_0_31_6[arg_367_0] = arg_367_1

	cvar[arg_367_0]:float(arg_367_1, true)
end

function on_shutdown_7(arg_368_0, arg_368_1)
	if empty_0_31_6[arg_368_0] == nil then
		empty_0_31_6[arg_368_0] = func_0_32_8(arg_368_0)
	end

	func_0_34_10(arg_368_0, cfg_0_7_0.interp(empty_0_31_6[arg_368_0], arg_368_1, 0.1))
end

function on_shutdown_12()
	func_0_33_9("viewmodel_fov")
	func_0_33_9("viewmodel_offset_x")
	func_0_33_9("viewmodel_offset_y")
	func_0_33_9("viewmodel_offset_z")
	func_0_33_9("cl_righthand")
end

function on_shutdown_15()
	if not ref_0_30_3.enabled:get() then
		on_shutdown_7("viewmodel_fov", func_0_32_8("viewmodel_fov"))
		on_shutdown_7("viewmodel_offset_x", func_0_32_8("viewmodel_offset_x"))
		on_shutdown_7("viewmodel_offset_y", func_0_32_8("viewmodel_offset_y"))
		on_shutdown_7("viewmodel_offset_z", func_0_32_8("viewmodel_offset_z"))

		return
	end

	on_shutdown_7("viewmodel_fov", ref_0_30_3.fov:get() * 0.1)
	on_shutdown_7("viewmodel_offset_x", ref_0_30_3.x:get() * 0.1)
	on_shutdown_7("viewmodel_offset_y", ref_0_30_3.y:get() * 0.1)
	on_shutdown_7("viewmodel_offset_z", ref_0_30_3.z:get() * 0.1)
end

function on_shutdown_19()
	if not ref_0_30_3.enabled:get() or not ref_0_30_3.swap_knife_hand:get() then
		func_0_33_9("cl_righthand")

		return
	end

	local var_371_0 = entity.get_local_player()

	if var_371_0 == nil then
		return
	end

	local var_371_1 = var_371_0:get_player_weapon()

	if var_371_1 == nil then
		return
	end

	local var_371_2 = func_0_32_8("cl_righthand")

	if var_371_1:get_classname() == "CKnife" then
		if var_371_2 == 0 then
			cvar.cl_righthand:float(1, true)

			return
		end

		cvar.cl_righthand:float(0, true)

		return
	end

	func_0_33_9("cl_righthand")
end

function on_shutdown_21()
	on_shutdown_15()
	on_shutdown_19()
end

unused_0_40_8 = nil

function on_shutdown_24(arg_373_0)
	if arg_373_0:get() then
		events.pre_render(on_shutdown_21, true)
	end

	events.shutdown(on_shutdown_12)
end

function ui_callback_17(arg_374_0)
	if arg_374_0:get() then
		ref_0_30_3.fov:set(func_0_32_8("viewmodel_fov") / 0.1)
		ref_0_30_3.x:set(func_0_32_8("viewmodel_offset_x") / 0.1)
		ref_0_30_3.y:set(func_0_32_8("viewmodel_offset_y") / 0.1)
		ref_0_30_3.z:set(func_0_32_8("viewmodel_offset_z") / 0.1)
	end
end

ref_0_30_3.enabled:set_callback(on_shutdown_24, true)
ref_0_30_3.reset:set_callback(ui_callback_17, true)

unused_0_30_2 = nil
ref_0_31_5 = empty_0_15_0.misc.changers.keep_model_transparency
ref_0_32_7 = smoothy.new(255)

function ui_callback_6()
	local var_375_0 = entity.get_local_player()

	if var_375_0 == nil or not var_375_0:is_alive() then
		return
	end

	ref_0_32_7:update(0.035, (var_375_0.m_bIsScoped or var_375_0.m_bResumeZoom) and 100 or 255)

	if ref_0_32_7.value == 255 then
		return
	end

	return empty_0_6_0.round(ref_0_32_7.value)
end

unused_0_34_9 = nil

function ui_callback_7(arg_376_0)
	local var_376_0 = arg_376_0:get()

	events.localplayer_transparency(ui_callback_6, var_376_0)
end

ref_0_31_5.enabled:set_callback(ui_callback_7, true)

unused_0_31_4 = nil
ref_0_32_6 = empty_0_15_0.misc.changers.game_disablers
flag_0_33_7 = false
empty_0_34_8 = {}

function func_0_35_10(arg_377_0, arg_377_1)
	local var_377_0 = {
		convar = arg_377_0
	}

	var_377_0.old_value = nil
	var_377_0.new_value = arg_377_1

	return var_377_0
end

empty_0_34_8.Fog = {
	func_0_35_10(cvar.fog_enable, 0),
	func_0_35_10(cvar.fog_enable_water_fog, 0)
}
empty_0_34_8.Blood = {
	func_0_35_10(cvar.violence_hblood, 0)
}
empty_0_34_8.Bloom = {
	func_0_35_10(cvar.mat_disable_bloom, 1)
}
empty_0_34_8.Decals = {
	func_0_35_10(cvar.r_drawdecals, 0)
}
empty_0_34_8.Shadows = {
	func_0_35_10(cvar.r_shadows, 0),
	func_0_35_10(cvar.cl_csm_static_prop_shadows, 0),
	func_0_35_10(cvar.cl_csm_shadows, 0),
	func_0_35_10(cvar.cl_csm_world_shadows, 0),
	func_0_35_10(cvar.cl_foot_contact_shadows, 0),
	func_0_35_10(cvar.cl_csm_viewmodel_shadows, 0),
	func_0_35_10(cvar.cl_csm_rope_shadows, 0),
	func_0_35_10(cvar.cl_csm_sprite_shadows, 0),
	func_0_35_10(cvar.cl_csm_translucent_shadows, 0),
	func_0_35_10(cvar.cl_csm_entity_shadows, 0),
	func_0_35_10(cvar.cl_csm_world_shadows_in_viewmodelcascad, 0)
}
empty_0_34_8.Sprites = {
	func_0_35_10(cvar.r_drawsprites, 0)
}
empty_0_34_8.Particles = {
	func_0_35_10(cvar.r_drawparticles, 0)
}
empty_0_34_8.Ropes = {
	func_0_35_10(cvar.r_drawropes, 0)
}
empty_0_34_8["Dynamic lights"] = {
	func_0_35_10(cvar.mat_disable_fancy_blending, 1)
}
empty_0_34_8["Map details"] = {
	func_0_35_10(cvar.func_break_max_pieces, 0),
	func_0_35_10(cvar.props_break_max_pieces, 0)
}
empty_0_34_8["Weapon effects"] = {
	func_0_35_10(cvar.muzzleflash_light, 0),
	func_0_35_10(cvar.r_drawtracers_firstperson, 0)
}

function on_shutdown_10()
	return true
end

function on_shutdown_11()
	if not flag_0_33_7 then
		return
	end

	for iter_379_0, iter_379_1 in pairs(empty_0_34_8) do
		for iter_379_2 = 1, #iter_379_1 do
			local var_379_0 = iter_379_1[iter_379_2]
			local var_379_1 = var_379_0.convar

			if var_379_0.old_value == nil then
				-- block empty
			else
				var_379_1:int(var_379_0.old_value)

				var_379_0.old_value = nil
			end
		end
	end

	flag_0_33_7 = false
end

function on_shutdown_14()
	if flag_0_33_7 then
		return
	end

	local var_380_0 = ref_0_32_6.options:get()

	for iter_380_0 = 1, #var_380_0 do
		local var_380_1 = var_380_0[iter_380_0]
		local var_380_2 = empty_0_34_8[var_380_1]

		for iter_380_1 = 1, #var_380_2 do
			local var_380_3 = var_380_2[iter_380_1]
			local var_380_4 = var_380_3.convar

			if var_380_4 == nil or var_380_3.old_value ~= nil then
				-- block empty
			else
				var_380_3.old_value = var_380_4:int()

				var_380_4:int(var_380_3.new_value)
			end
		end
	end

	flag_0_33_7 = true
end

function on_shutdown_18()
	on_shutdown_11()
end

function render_watermark()
	if not on_shutdown_10() then
		return on_shutdown_11()
	end

	on_shutdown_14()
end

unused_0_40_7 = nil

function render_watermark_2(arg_383_0)
	local var_383_0 = arg_383_0:get()

	if unpack(var_383_0) ~= nil then
		events.net_update_end(render_watermark, true)
	end

	on_shutdown_18()
	events.shutdown(on_shutdown_18, true)
end

ref_0_32_6.options:set_callback(render_watermark_2, true)

unused_0_28_0 = nil
unused_0_29_0 = nil
ref_0_30_1 = empty_0_15_0.misc.visuals.watermark
unused_0_31_3 = nil
const_0_32_5 = 0
ref_0_33_6 = smoothy.new()
cfg_0_34_7 = {
	Upper = 2,
	Console = 3,
	Bold = 4,
	Default = 1
}
ref_0_35_8 = empty_0_11_0.new("custom_watermark", {
	clamped = true
})
render_screen_size = render.screen_size()
vec_0_37_12 = vector(render_screen_size.x / 2, render_screen_size.y - 25)

ref_0_35_8:set_anchor(vector(0.5, 0))
ref_0_35_8:set_pos(vec_0_37_12)
ref_0_35_8:build()

function lerp_func_16()
	return cfg_0_34_7[ref_0_30_1.font:get()] or 0
end

function lerp_func_17()
	local var_385_0 = ref_0_30_1.addons

	const_0_32_5 = const_0_32_5 + globals.frametime

	if var_385_0:get("Rainbow color") then
		return cfg_0_7_0.rainbow_palette(-const_0_32_5, 12, 0.2, 255), nil, true
	end

	if ref_0_30_1.color:get() == "Solid" then
		local var_385_1 = ref_0_30_1.color:get("Solid")

		return color(var_385_1[1].r, var_385_1[1].g, var_385_1[1].b), nil, false
	end

	if ref_0_30_1.color:get() == "Gradient" then
		local var_385_2 = ref_0_30_1.color:get("Gradient")

		return color(var_385_2[1].r, var_385_2[1].g, var_385_2[1].b), color(var_385_2[2].r, var_385_2[2].g, var_385_2[2].b), false
	end

	return color(), nil, false
end

function render_func_8(arg_386_0, arg_386_1, arg_386_2, arg_386_3)
	local var_386_0 = ref_0_30_1.name:get()

	if #var_386_0 <= 0 then
		var_386_0 = empty_0_4_0.name
	end

	if arg_386_0 == 2 then
		var_386_0 = var_386_0:upper()
	end

	if arg_386_3 then
		return cfg_0_7_0.wave_text(var_386_0, arg_386_1, -const_0_32_5 * 3, 0.7)
	elseif arg_386_2 ~= nil then
		return cfg_0_7_0.wave(var_386_0, arg_386_1, arg_386_2, -const_0_32_5)
	end

	return string.format("\a%s%s", arg_386_1:to_hex(), var_386_0)
end

function render_func_9()
	if ref_0_30_1.addons:get("Pulse") then
		local var_387_0 = math.abs(globals.realtime * 1.5 % 2 - 1)

		return math.floor(255 * var_387_0 + 0.5)
	end

	return 255
end

function render_func_4()
	local var_388_0 = lerp_func_16()
	local var_388_1 = render_func_8(var_388_0, lerp_func_17())
	local var_388_2 = render.measure_text(var_388_0, "", var_388_1)
	local var_388_3 = ref_0_35_8:get_pos():clone()
	local var_388_4 = render_func_9()

	ref_0_33_6:update(0.05, ref_0_35_8.is_hovered and 0.5 or 1)

	local var_388_5 = color():alpha_modulate(var_388_4 * ref_0_33_6.value)

	render.text(var_388_0, var_388_3, var_388_5, "", var_388_1)
	ref_0_35_8:set_size(var_388_2)
	ref_0_35_8:update()
end

unused_0_32_4 = nil
vec_0_33_5 = vector(30, 48)

function lerp_func_10()
	return color(), color(120, 214, 122, 255)
end

function lerp_func_13(arg_390_0, arg_390_1)
	local var_390_0 = arg_390_0:to_hex()
	local var_390_1 = arg_390_1:to_hex()
	local var_390_2 = "\a" .. var_390_0 .. "PHANTOM  " .. "\a" .. var_390_1 .. "[" .. empty_0_4_0.build:upper() .. "]"
	local var_390_3 = "\a" .. var_390_0 .. "USER:  " .. "\a" .. var_390_1 .. empty_0_4_0.username:upper()

	return var_390_2 .. "\n" .. var_390_3
end

function lerp_func_5()
	local var_391_0 = 2
	local var_391_1 = ""
	local var_391_2 = lerp_func_13(lerp_func_10())
	local var_391_3 = render.screen_size()
	local var_391_4 = vector(20, var_391_3.y / 2)

	if empty_0_13_0.logo ~= nil then
		local var_391_5 = vector(var_391_4.x, var_391_4.y - vec_0_33_5.y / 2)

		render.texture(empty_0_13_0.logo, var_391_5, vec_0_33_5, color(), "f")

		var_391_4.x = var_391_4.x + vec_0_33_5.x + 10
	end

	local var_391_6 = render.measure_text(var_391_0, var_391_1, var_391_2)
	local var_391_7 = vector(var_391_4.x, var_391_4.y - var_391_6.y / 2)

	render.text(var_391_0, var_391_7, color(), var_391_1, var_391_2)
end

unused_0_33_4 = nil

function lerp_func_9(arg_392_0)
	local var_392_0 = arg_392_0:get()

	events.render(render_func_4, var_392_0 == 1)
	events.render(lerp_func_5, var_392_0 == 2)
end

ref_0_30_1.style:set_callback(lerp_func_9, true)

unused_0_30_0 = nil
ref_0_31_1 = empty_0_15_0.misc.visuals.widgets

function lerp_func_4(arg_393_0, arg_393_1, arg_393_2, arg_393_3)
	if arg_393_3 > 0 then
		render.shadow(arg_393_0, vector(cfg_0_7_0.lerp(arg_393_0.x, arg_393_1.x, arg_393_3), arg_393_1.y), arg_393_2, 15)
	end

	render.rect(arg_393_0, arg_393_1, color(0, 0, 0, arg_393_2.a))

	arg_393_0 = arg_393_0 + 1
	arg_393_1 = arg_393_1 - 1

	if arg_393_3 > 0 then
		render.rect(arg_393_0, vector(cfg_0_7_0.lerp(arg_393_0.x, arg_393_1.x, arg_393_3), arg_393_1.y), arg_393_2)
	end
end

function render_func_5(arg_394_0, arg_394_1, arg_394_2, arg_394_3, arg_394_4)
	if type(arg_394_3) ~= "number" then
		arg_394_3 = 1
	end

	if type(arg_394_4) ~= "number" then
		arg_394_4 = 1
	end

	local var_394_0 = vector(100, 4)
	local var_394_1 = render.measure_text(1, nil, arg_394_1)
	local var_394_2 = math.max(var_394_1.x, var_394_0.x)
	local var_394_3 = var_394_1.y + var_394_0.y + 8
	local var_394_4 = arg_394_0:get_pos():clone()
	local var_394_5 = vector(var_394_2, var_394_3)
	local var_394_6 = arg_394_2:clone()
	local var_394_7 = color()

	var_394_6.a = var_394_6.a * arg_394_4
	var_394_7.a = var_394_7.a * arg_394_4

	render.text(1, var_394_4 + vector((var_394_2 - var_394_1.x) / 2, 0), var_394_7, nil, arg_394_1)

	var_394_4.y = var_394_4.y + var_394_1.y + 8

	lerp_func_4(var_394_4, var_394_4 + var_394_0, var_394_6, arg_394_3)
	arg_394_0:set_size(var_394_5)
	arg_394_0:update()
end

unused_0_34_4 = nil
ref_0_35_6 = empty_0_11_0.new("defensive_widget")
render_screen_size_2 = render.screen_size()
vec_0_37_10 = vector(render_screen_size_2.x / 2, 200)

ref_0_35_6:set_anchor(vector(0.5, 0))
ref_0_35_6:set_pos(vec_0_37_10)
ref_0_35_6:build()

function ui_callback_9()
	if empty_0_20_0.defensive_ticks > 0 then
		return empty_0_20_0.defensive_ticks / empty_0_20_0.max_defensive_ticks
	end

	return 0
end

function ui_callback_12()
	local var_396_0 = "- defensive -"
	local var_396_1 = ref_0_31_1.color:get("Defensive")[1]
	local var_396_2 = ui_callback_9()
	local var_396_3 = var_396_2
	local var_396_4 = ui.get_alpha()

	if var_396_4 > 0 then
		var_396_2 = 1 - globals.tickcount % 14 / 13
		var_396_3 = var_396_4
	end

	render_func_5(ref_0_35_6, var_396_0, var_396_1, var_396_2, var_396_3)
end

unused_0_38_8 = nil

function ui_callback_15(arg_397_0)
	events.render(ui_callback_12, arg_397_0:get("Defensive"))
end

ref_0_31_1.select:set_callback(ui_callback_15, true)

unused_0_35_5 = nil
ref_0_36_6 = empty_0_11_0.new("velocity_widget")
render_screen_size_4 = render.screen_size()
vec_0_38_7 = vector(render_screen_size_4.x / 2, 280)

ref_0_36_6:set_anchor(vector(0.5, 0))
ref_0_36_6:set_pos(vec_0_38_7)
ref_0_36_6:build()

function ui_callback_11()
	local var_398_0 = entity.get_local_player()

	if var_398_0 == nil then
		return 1
	end

	local var_398_1 = var_398_0.m_flVelocityModifier

	if var_398_1 < 1 then
		return var_398_1
	end

	return 1
end

function ui_callback_13()
	local var_399_0 = "- velocity -"
	local var_399_1 = ref_0_31_1.color:get("Velocity")[1]
	local var_399_2 = ui_callback_11()
	local var_399_3 = math.map(var_399_2, 0.9, 1, 1, 0, true)

	if ui.get_alpha() > 0 then
		var_399_2 = globals.realtime * 2 % 1
		var_399_3 = 1
	end

	render_func_5(ref_0_36_6, var_399_0, var_399_1, var_399_2, var_399_3)
end

unused_0_39_7 = nil

function ui_callback_16(arg_400_0)
	events.render(ui_callback_13, arg_400_0:get("Velocity"))
end

ref_0_31_1.select:set_callback(ui_callback_16, true)

unused_0_31_0 = nil
ref_0_32_1 = empty_0_15_0.misc.visuals.custom_scope
const_0_33_2 = 0

function func_0_34_3()
	local var_401_0 = ref_0_32_1.color:get()
	local var_401_1 = var_401_0:clone()
	local var_401_2 = var_401_0:clone()

	var_401_2.a = 0

	return var_401_1, var_401_2
end

function func_0_35_4()
	local var_402_0 = entity.get_local_player()
	local var_402_1 = false

	if var_402_0 ~= nil then
		var_402_1 = var_402_0:is_alive() and var_402_0.m_bIsScoped
	end

	cfg_0_5_0.world.scope_overlay:override("Remove All")

	const_0_33_2 = cfg_0_7_0.interp(const_0_33_2, var_402_1, 0.05)
end

function func_0_36_5()
	if const_0_33_2 == 0 then
		return
	end

	local var_403_0 = render.screen_size() / 2
	local var_403_1 = ref_0_32_1.offset:get()
	local var_403_2 = ref_0_32_1.length:get()

	if ref_0_32_1.options:get("Animation") then
		var_403_1 = var_403_1 * const_0_33_2
		var_403_2 = var_403_2 * const_0_33_2
	end

	local var_403_3 = empty_0_6_0.round(var_403_1)
	local var_403_4 = empty_0_6_0.round(var_403_2)
	local var_403_5, var_403_6 = func_0_34_3()

	var_403_5.a = var_403_5.a * const_0_33_2
	var_403_6.a = var_403_6.a * const_0_33_2

	if ref_0_32_1.options:get("Inverted") then
		var_403_5, var_403_6 = var_403_6, var_403_5
	end

	if not ref_0_32_1.options:get("T Style") then
		local var_403_7 = vector(var_403_0.x, var_403_0.y - var_403_3):floor()
		local var_403_8 = vector(var_403_0.x + 1, var_403_0.y - var_403_3 - var_403_4):floor()

		render.gradient(var_403_7, var_403_8, var_403_5, var_403_5, var_403_6, var_403_6)
	end

	local var_403_9
	local var_403_10 = vector(var_403_0.x, var_403_0.y + var_403_3 + 1):floor()
	local var_403_11 = vector(var_403_0.x + 1, var_403_0.y + var_403_3 + var_403_4 + 1):floor()

	render.gradient(var_403_10, var_403_11, var_403_5, var_403_5, var_403_6, var_403_6)

	local var_403_12
	local var_403_13 = vector(var_403_0.x - var_403_3, var_403_0.y):floor()
	local var_403_14 = vector(var_403_0.x - var_403_3 - var_403_4, var_403_0.y + 1):floor()

	render.gradient(var_403_13, var_403_14, var_403_5, var_403_6, var_403_5, var_403_6)

	local var_403_15
	local var_403_16 = vector(var_403_0.x + var_403_3 + 1, var_403_0.y):floor()
	local var_403_17 = vector(var_403_0.x + var_403_3 + var_403_4 + 1, var_403_0.y + 1):floor()

	render.gradient(var_403_16, var_403_17, var_403_5, var_403_6, var_403_5, var_403_6)
end

function render_damage()
	cfg_0_5_0.world.scope_overlay:override()
end

function render_damage_2()
	func_0_35_4()
	func_0_36_5()
end

unused_0_39_6 = nil

function lerp_func_20(arg_406_0)
	local var_406_0 = arg_406_0:get()

	if not var_406_0 then
		render_damage()
	end

	events.shutdown(render_damage, var_406_0)
	events.render(render_damage_2, var_406_0)
end

ref_0_32_1.enabled:set_callback(lerp_func_20, true)

unused_0_32_0 = nil
ref_0_33_1 = empty_0_15_0.misc.visuals.min_damage_indicator
ref_0_34_2 = cfg_0_5_0.ragebot.minimum_damage
cfg_0_35_3 = {
	Console = 3,
	Bold = 4,
	Small = 2,
	Default = 1
}
ref_0_36_4 = empty_0_11_0.new("min_damage_indicator")
render_screen_size_3 = render.screen_size() / 2 + vector(10, -10)

ref_0_36_4:set_anchor(vector(0, 1))
ref_0_36_4:set_pos(render_screen_size_3)
ref_0_36_4:build()

function lerp_func_18()
	local var_407_0 = entity.get_local_player()
	local var_407_1 = ui.get_alpha() == 1

	if var_407_0 ~= nil then
		if not var_407_0:is_alive() and not var_407_1 then
			return
		end
	elseif not var_407_1 then
		return
	end

	local var_407_2 = cfg_0_35_3[ref_0_33_1.font:get()] or 1
	local var_407_3 = ""
	local var_407_4 = tostring(ref_0_34_2:get())
	local var_407_5 = ref_0_36_4.pos:clone()
	local var_407_6 = ref_0_33_1.color:get()
	local var_407_7 = render.measure_text(var_407_2, var_407_3, var_407_4)

	render.text(var_407_2, var_407_5, var_407_6, var_407_3, var_407_4)
	ref_0_36_4:set_size(var_407_7)
	ref_0_36_4:update()
end

unused_0_38_4 = nil

function lerp_func_19(arg_408_0)
	events.render(lerp_func_18, arg_408_0:get())
end

ref_0_33_1.enabled:set_callback(lerp_func_19, true)

unused_0_33_0 = nil
ref_0_34_1 = empty_0_15_0.misc.visuals.manual_arrows
render_load_font = render.load_font("verdana", 23, "abd")
render_load_font_2 = render.load_font("verdana", 15, "ad")
const_0_37_3 = 45
const_0_38_3 = 0
const_0_39_4 = 0
const_0_40_4 = 0

function lerp_func_23()
	return empty_0_15_0.antiaim.tweaks.manuals:get()
end

function lerp_func_26(arg_410_0)
	local var_410_0 = ref_0_34_1.color:get("Active")[1]

	return ref_0_34_1.color:get("Inactive")[1]:lerp(var_410_0, arg_410_0)
end

function render_func_12()
	local var_411_0 = entity.get_local_player()
	local var_411_1 = var_411_0 ~= nil and var_411_0:is_alive()
	local var_411_2 = var_411_1 and var_411_0.m_bIsScoped
	local var_411_3 = var_411_1 and lerp_func_23() == "Left"
	local var_411_4 = var_411_1 and lerp_func_23() == "Right"

	const_0_38_3 = cfg_0_7_0.interp(const_0_38_3, var_411_3, 0.05)
	const_0_39_4 = cfg_0_7_0.interp(const_0_39_4, var_411_4, 0.05)
	const_0_40_4 = cfg_0_7_0.interp(const_0_40_4, var_411_2, 0.05)
end

cfg_0_44_4 = {
	on_render = function()
		local var_412_0 = render.screen_size() * 0.5

		var_412_0.y = var_412_0.y - 4
		var_412_0.y = var_412_0.y - 15 * const_0_40_4

		local var_412_1
		local var_412_2 = render_load_font
		local var_412_3 = ""
		local var_412_4 = "<"
		local var_412_5 = lerp_func_26(const_0_38_3)
		local var_412_6 = render.measure_text(var_412_2, var_412_3, var_412_4)
		local var_412_7 = var_412_0 + vector(-var_412_6.x - const_0_37_3 + 1, -var_412_6.y / 2 - 1)

		render.text(var_412_2, var_412_7, var_412_5, var_412_3, var_412_4)

		local var_412_8
		local var_412_9 = render_load_font
		local var_412_10 = ""
		local var_412_11 = ">"
		local var_412_12 = lerp_func_26(const_0_39_4)
		local var_412_13 = render.measure_text(var_412_9, var_412_10, var_412_11)
		local var_412_14 = var_412_0 + vector(const_0_37_3, -var_412_13.y / 2 - 1)

		render.text(var_412_9, var_412_14, var_412_12, var_412_10, var_412_11)
	end
}
cfg_0_45_4 = {
	on_render = function()
		local var_413_0 = render.screen_size() * 0.5

		var_413_0.y = var_413_0.y - 4
		var_413_0.y = var_413_0.y - 10 * const_0_40_4

		local var_413_1
		local var_413_2 = render_load_font_2
		local var_413_3 = ""
		local var_413_4 = "<"
		local var_413_5 = lerp_func_26(const_0_38_3)
		local var_413_6 = render.measure_text(var_413_2, var_413_3, var_413_4)
		local var_413_7 = var_413_0 + vector(-var_413_6.x - const_0_37_3 + 1, -var_413_6.y / 2 - 1)

		render.text(var_413_2, var_413_7, var_413_5, var_413_3, var_413_4)

		local var_413_8
		local var_413_9 = render_load_font_2
		local var_413_10 = ""
		local var_413_11 = ">"
		local var_413_12 = lerp_func_26(const_0_39_4)
		local var_413_13 = render.measure_text(var_413_9, var_413_10, var_413_11)
		local var_413_14 = var_413_0 + vector(const_0_37_3, -var_413_13.y / 2 - 1)

		render.text(var_413_9, var_413_14, var_413_12, var_413_10, var_413_11)
	end
}

function ui_callback_20(arg_414_0)
	events.render(render_func_12, arg_414_0 ~= nil)
	events.render(cfg_0_44_4.on_render, arg_414_0 == "Default")
	events.render(cfg_0_45_4.on_render, arg_414_0 == "Alternative")
end

unused_0_47_3 = nil

function ui_callback_23(arg_415_0)
	ui_callback_20(arg_415_0:get())
end

function ui_callback_24(arg_416_0)
	local var_416_0 = arg_416_0:get()

	if var_416_0 then
		ref_0_34_1.style:set_callback(ui_callback_23, true)
	else
		ref_0_34_1.style:unset_callback(ui_callback_23)
	end

	if not var_416_0 then
		ui_callback_20(nil)
	end
end

ref_0_34_1.enabled:set_callback(ui_callback_24, true)

unused_0_34_0 = nil
ref_0_35_1 = empty_0_15_0.misc.visuals.hit_markers

function func_0_36_2(arg_417_0, arg_417_1, arg_417_2, arg_417_3)
	local var_417_0
	local var_417_1 = vector(arg_417_0.x - arg_417_1, arg_417_0.y - arg_417_1)
	local var_417_2 = vector(arg_417_0.x - arg_417_2, arg_417_0.y - arg_417_2)

	render.line(var_417_1, var_417_2, arg_417_3)

	local var_417_3
	local var_417_4 = vector(arg_417_0.x + arg_417_1, arg_417_0.y - arg_417_1)
	local var_417_5 = vector(arg_417_0.x + arg_417_2, arg_417_0.y - arg_417_2)

	render.line(var_417_4, var_417_5, arg_417_3)

	local var_417_6
	local var_417_7 = vector(arg_417_0.x - arg_417_1, arg_417_0.y + arg_417_1)
	local var_417_8 = vector(arg_417_0.x - arg_417_2, arg_417_0.y + arg_417_2)

	render.line(var_417_7, var_417_8, arg_417_3)

	local var_417_9
	local var_417_10 = vector(arg_417_0.x + arg_417_1, arg_417_0.y + arg_417_1)
	local var_417_11 = vector(arg_417_0.x + arg_417_2, arg_417_0.y + arg_417_2)

	render.line(var_417_10, var_417_11, arg_417_3)
end

function on_shutdown_17(arg_418_0, arg_418_1, arg_418_2, arg_418_3)
	local var_418_0
	local var_418_1 = vector(arg_418_0.x - arg_418_1, arg_418_0.y - arg_418_2)
	local var_418_2 = vector(arg_418_0.x + arg_418_1, arg_418_0.y + arg_418_2)

	render.rect(var_418_1, var_418_2, arg_418_3, 0, true)

	local var_418_3
	local var_418_4 = vector(arg_418_0.x - arg_418_2, arg_418_0.y - arg_418_1)
	local var_418_5 = vector(arg_418_0.x + arg_418_2, arg_418_0.y + arg_418_1)

	render.rect(var_418_4, var_418_5, arg_418_3, 0, true)
end

empty_0_38_2 = {}
const_0_39_3 = 0
const_0_40_3 = 0

function lerp_func_22()
	const_0_40_3 = math.max(const_0_40_3 - globals.frametime, 0)

	if const_0_40_3 == 0 then
		const_0_39_3 = cfg_0_7_0.interp(const_0_39_3, 0, 0.075)
	end
end

function lerp_func_25()
	if const_0_39_3 == 0 then
		return
	end

	local var_420_0 = unpack(ref_0_35_1.color:get("Crosshair"))

	var_420_0.a = var_420_0.a * const_0_39_3

	local var_420_1 = render.screen_size() * 0.5
	local var_420_2 = 4
	local var_420_3 = 6 + var_420_2

	func_0_36_2(var_420_1, var_420_2, var_420_3, var_420_0)
end

function lerp_func_28()
	const_0_40_3 = 0
	const_0_39_3 = 0
end

function lerp_func_30(arg_422_0)
	if entity.get_local_player() ~= entity.get(arg_422_0.attacker, true) then
		return
	end

	const_0_40_3 = 0.5
	const_0_39_3 = 1
end

function lerp_func_31()
	lerp_func_22()
	lerp_func_25()
end

unused_0_46_2 = nil

function lerp_func_32(arg_424_0)
	local var_424_0 = arg_424_0:get("Crosshair")

	if not var_424_0 then
		const_0_40_3 = 0
		const_0_39_3 = 0
	end

	events.on_shutdown(lerp_func_28, var_424_0)
	events.render(lerp_func_31, var_424_0)
	events.player_hurt(lerp_func_30, var_424_0)
end

ref_0_35_1.select:set_callback(lerp_func_32, true)

empty_0_39_2 = {}
empty_0_40_2 = {}

function lerp_func_21()
	for iter_425_0 = 1, #empty_0_40_2 do
		empty_0_40_2[iter_425_0] = nil
	end
end

function lerp_func_24(arg_426_0)
	if arg_426_0 then
		cfg_0_5_0.world.world_marker:override(false)
	else
		cfg_0_5_0.world.world_marker:override()
	end
end

function lerp_func_27(arg_427_0)
	local var_427_0 = {
		pos = arg_427_0
	}

	var_427_0.alpha = 1
	var_427_0.clock = 3
	empty_0_40_2[#empty_0_40_2 + 1] = var_427_0
end

function lerp_func_29()
	for iter_428_0 = #empty_0_40_2, 1, -1 do
		local var_428_0 = empty_0_40_2[iter_428_0]

		var_428_0.clock = math.max(var_428_0.clock - globals.frametime, 0)

		if var_428_0.clock == 0 then
			var_428_0.alpha = cfg_0_7_0.interp(var_428_0.alpha, 0, 0.075)

			if var_428_0.alpha == 0 then
				table.remove(empty_0_40_2, iter_428_0)
			end
		end
	end
end

function render_indicator()
	local var_429_0 = unpack(ref_0_35_1.color:get("World"))
	local var_429_1 = 1
	local var_429_2 = 5

	for iter_429_0 = 1, #empty_0_40_2 do
		local var_429_3 = empty_0_40_2[iter_429_0]
		local var_429_4 = render.world_to_screen(var_429_3.pos)

		if var_429_4 == nil then
			-- block empty
		else
			local var_429_5 = var_429_0:clone()

			var_429_5.a = var_429_5.a * var_429_3.alpha

			on_shutdown_17(var_429_4, var_429_1, var_429_2, var_429_5)
		end
	end
end

function render_damage_3()
	lerp_func_21()
end

function render_damage_5(arg_431_0)
	if entity.get_local_player() == nil then
		return
	end

	lerp_func_27(arg_431_0.aim)
end

function render_damage_7(arg_432_0)
	if arg_432_0.state == nil then
		render_damage_5(arg_432_0)
	end
end

function render_damage_9()
	lerp_func_29()
	render_indicator()
end

unused_0_50_1 = nil

function render_damage_12(arg_434_0)
	local var_434_0 = arg_434_0:get("World")

	if not var_434_0 then
		lerp_func_21()
	end

	lerp_func_24(var_434_0)
	events.render(render_damage_9, var_434_0)
	events.aim_ack(render_damage_7, var_434_0)
	events.on_shutdown(render_damage_3, var_434_0)
end

ref_0_35_1.select:set_callback(render_damage_12, true)

unused_0_35_0 = nil
ref_0_36_1 = empty_0_15_0.misc.visuals.gamesense_indicators
const_0_37_1 = 380
const_0_38_1 = 8
const_0_39_1 = 24
const_0_40_1 = 4
const_0_41_1 = 3
render_load_font_4 = render.load_font("Calibri Bold", 25, "a")
empty_0_43_1 = {}
empty_0_43_1.__index = empty_0_43_1

function empty_0_43_1.new(arg_435_0, arg_435_1, arg_435_2)
	local var_435_0 = {
		id = arg_435_1,
		size = arg_435_2
	}

	return setmetatable(var_435_0, arg_435_0)
end

function empty_0_43_1.draw(arg_436_0, arg_436_1, arg_436_2, ...)
	local var_436_0 = arg_436_0.id
	local var_436_1 = arg_436_0.size

	render.texture(var_436_0, arg_436_1, var_436_1, arg_436_2, ...)
end

cfg_0_44_1 = {
	bomb = render.load_image_from_file("materials/panorama/images/icons/ui/bomb_c4.svg", vector(32, 32))
}
cfg_0_45_1 = {
	c4 = empty_0_43_1:new(cfg_0_44_1.bomb, vector(32, 29))
}
empty_0_46_0 = {}
ref_0_47_0 = cfg_0_5_0.ragebot.dormant_aimbot
ref_0_48_0 = cfg_0_5_0.ragebot.double_tap
ref_0_49_0 = cfg_0_5_0.ragebot.hide_shots
ref_0_50_0 = cfg_0_5_0.ragebot.body_aim
ref_0_51_0 = cfg_0_5_0.ragebot.safe_points
ref_0_52_0 = cfg_0_5_0.ragebot.minimum_damage
ref_0_53_0 = cfg_0_5_0.antiaim.angles.freestanding
ref_0_54_0 = cfg_0_5_0.antiaim.misc.fake_duck
ref_0_55_0 = cfg_0_5_0.misc.fake_latency

function render_func_16(arg_437_0)
	local var_437_0 = arg_437_0:get_override()

	if var_437_0 ~= nil then
		return var_437_0
	end

	return arg_437_0:get()
end

function render_func_17(arg_438_0)
	local var_438_0 = empty_0_21_0.get(arg_438_0)

	return var_438_0 ~= nil and var_438_0.active
end

function render_func_18()
	for iter_439_0 = 1, #empty_0_46_0 do
		empty_0_46_0[iter_439_0] = nil
	end
end

function render_func_19(arg_440_0)
	local var_440_0 = render.measure_text(render_load_font_4, nil, arg_440_0.text)
	local var_440_1 = render.screen_size()

	var_440_0.y = var_440_0.y + const_0_40_1 * 2

	local var_440_2 = next(empty_0_46_0) == nil and var_440_1.y - (var_440_1.y - const_0_37_1) / 2 or empty_0_46_0[#empty_0_46_0].offset - const_0_38_1 - var_440_0.y

	arg_440_0.offset = var_440_2
	arg_440_0.text_size = var_440_0

	table.insert(empty_0_46_0, arg_440_0)

	return var_440_2
end

function lerp_func_33(arg_441_0, arg_441_1, ...)
	arg_441_1 = table.concat({
		arg_441_1,
		...
	})

	return render_func_19({
		text = arg_441_1,
		color = arg_441_0
	})
end

function lerp_func_34(arg_442_0, arg_442_1)
	local var_442_0 = 0.5
	local var_442_1 = 0.5

	if arg_442_1 > 0 then
		local var_442_2 = arg_442_0 * var_442_0

		if arg_442_1 < (arg_442_0 - var_442_2) * var_442_1 then
			var_442_2 = arg_442_0 - arg_442_1 * (1 / var_442_1)
		end

		arg_442_0 = var_442_2
	end

	return arg_442_0
end

function lerp_func_35(arg_443_0, arg_443_1)
	local var_443_0 = 1
	local var_443_1 = 500
	local var_443_2 = var_443_1 * 3.5
	local var_443_3 = (arg_443_1:get_origin() - arg_443_0:get_eye_position()):length()
	local var_443_4 = var_443_2 / 3
	local var_443_5 = var_443_1 * math.exp(-var_443_3 * var_443_3 / (2 * var_443_4 * var_443_4)) * var_443_0

	return lerp_func_34(var_443_5, arg_443_0.m_ArmorValue)
end

function lerp_func_36(arg_444_0)
	local var_444_0 = render_func_17(ref_0_52_0)
	local var_444_1 = ref_0_55_0:get() > 0
	local var_444_2 = render_func_16(ref_0_54_0)
	local var_444_3 = render_func_16(ref_0_53_0)
	local var_444_4 = render_func_16(ref_0_50_0) == "Force"
	local var_444_5 = render_func_16(ref_0_51_0) == "Force"
	local var_444_6 = render_func_16(ref_0_48_0) and not var_444_2
	local var_444_7 = render_func_16(ref_0_49_0) and not var_444_2 and not var_444_6
	local var_444_8 = render_func_16(ref_0_47_0)

	if var_444_1 then
		local var_444_9 = utils.net_channel()

		if var_444_9 ~= nil then
			local var_444_10
			local var_444_11 = render_func_16(ref_0_55_0)
			local var_444_12 = math.clamp(var_444_9.latency[0] + var_444_9.latency[1], 0.001, 0.2)
			local var_444_13 = math.clamp(var_444_11 * 0.001 + var_444_9.avg_latency[1], 0.001, 0.2)
			local var_444_14 = math.clamp(var_444_12 / var_444_13, 0, 1)

			if var_444_14 < 0.5 then
				var_444_10 = color(250, 234, 232, 255):lerp(color(213, 197, 84, 255), var_444_14 * 2)
			else
				var_444_10 = color(213, 197, 84, 255):lerp(color(143, 194, 21, 255), (var_444_14 - 0.5) * 2)
			end

			lerp_func_33(var_444_10, "PING")
		end
	end

	if var_444_7 then
		lerp_func_33(color(255, 255, 255, 200), "OSAA")
	end

	if var_444_6 then
		local var_444_15 = color(255, 0, 50, 255)

		if rage.exploit:get() == 1 then
			var_444_15 = color(255, 255, 255, 200)
		end

		lerp_func_33(var_444_15, "DT")
	end

	if var_444_8 then
		lerp_func_33(color(255, 255, 255, 200), "DA")
	end

	if var_444_2 then
		lerp_func_33(color(255, 255, 255, 200), "DUCK")
	end

	if var_444_5 then
		lerp_func_33(color(255, 255, 255, 200), "SAFE")
	end

	if var_444_4 then
		lerp_func_33(color(255, 255, 255, 200), "BODY")
	end

	if var_444_0 then
		lerp_func_33(color(255, 255, 255, 200), "MD")
	end

	if var_444_3 then
		lerp_func_33(color(255, 255, 255, 200), "FS")
	end
end

function render_func_20(arg_445_0, arg_445_1)
	local var_445_0 = arg_445_1:get_player_weapon()

	if var_445_0 == nil then
		return
	end

	if not var_445_0.m_bStartedArming then
		return
	end

	local var_445_1 = var_445_0.m_fArmedTime

	if var_445_1 == nil then
		return
	end

	local var_445_2 = arg_445_1:get_origin()
	local var_445_3 = arg_445_0.m_bombsiteCenterA
	local var_445_4 = arg_445_0.m_bombsiteCenterB
	local var_445_5 = var_445_2:distsqr(var_445_3) < var_445_2:distsqr(var_445_4) and "A" or "B"
	local var_445_6 = (var_445_1 - globals.curtime) / 3

	render_func_19({
		text = var_445_5,
		color = color(252, 243, 105, 255),
		progress = 1 - var_445_6,
		draw_element = cfg_0_45_1.c4
	})
end

function render_func_21(arg_446_0, arg_446_1)
	local var_446_0 = arg_446_1.m_bBombDefused

	if not arg_446_1.m_bBombTicking or var_446_0 then
		return
	end

	local var_446_1 = globals.curtime
	local var_446_2 = arg_446_1.m_flC4Blow
	local var_446_3 = var_446_2 - var_446_1

	if var_446_3 > 0 then
		if arg_446_1.m_hBombDefuser ~= nil then
			local var_446_4 = render.screen_size()
			local var_446_5 = arg_446_1.m_flDefuseCountDown
			local var_446_6 = (var_446_5 - var_446_1) / 10
			local var_446_7 = var_446_2 < var_446_5 and color(235, 50, 75, 125) or color(50, 235, 75, 125)
			local var_446_8 = (var_446_4.y - 2) * (1 - var_446_6)

			render.rect(vector(0, 0), vector(20, var_446_4.y), color(0, 0, 0, 115))
			render.rect(vector(1, 1 + var_446_8), vector(19, var_446_4.y - 1), var_446_7)
		end

		local var_446_9 = string.format("%s - %.1fs", arg_446_1.m_nBombSite == 1 and "B" or "A", var_446_3)

		render_func_19({
			text = var_446_9,
			color = color(255, 255, 255, 200),
			draw_element = cfg_0_45_1.c4
		})
	end

	local var_446_10 = arg_446_0.m_iHealth
	local var_446_11 = lerp_func_35(arg_446_0, arg_446_1)
	local var_446_12 = math.floor(var_446_11)

	if var_446_10 <= var_446_12 then
		lerp_func_33(color(255, 0, 50, 255), "FATAL")
	elseif var_446_12 > 0 then
		lerp_func_33(color(252, 243, 105, 255), string.format("-%d HP", var_446_12))
	end
end

function render_func_22(arg_447_0)
	local var_447_0 = entity.get_game_rules()

	if var_447_0 == nil then
		return
	end

	local var_447_1 = entity.get_player_resource()

	if var_447_1 == nil then
		return
	end

	local var_447_2 = var_447_0.m_bBombPlanted
	local var_447_3 = var_447_1.m_iPlayerC4

	if var_447_3 ~= nil and var_447_3 ~= 0 then
		local var_447_4 = entity.get(var_447_3)

		if var_447_4 ~= nil then
			render_func_20(var_447_1, var_447_4)
		end
	end

	if var_447_2 then
		local var_447_5 = entity.get_entities("CPlantedC4")[1]

		if var_447_5 ~= nil then
			render_func_21(arg_447_0, var_447_5)
		end
	end
end

function render_func_23()
	local var_448_0 = entity.get_local_player()

	if var_448_0 == nil then
		return
	end

	if var_448_0:is_alive() then
		lerp_func_36(var_448_0)
	end

	render_func_22(var_448_0)
end

function render_func_24(arg_449_0, arg_449_1)
	local var_449_0 = (arg_449_0 + arg_449_1) / 2
	local var_449_1 = color(0, 0, 0, 0)
	local var_449_2 = color(0, 0, 0, 50)

	render.gradient(arg_449_0, vector(var_449_0.x, arg_449_1.y), var_449_1, var_449_2, var_449_1, var_449_2)
	render.gradient(arg_449_1, vector(var_449_0.x, arg_449_0.y), var_449_1, var_449_2, var_449_1, var_449_2)
end

function render_func_25(arg_450_0, arg_450_1, arg_450_2, arg_450_3, arg_450_4, arg_450_5)
	render.circle_outline(arg_450_0, color(0, 0, 0, 255), arg_450_2, arg_450_3, 1, arg_450_5)
	render.circle_outline(arg_450_0, arg_450_1, arg_450_2 - 1, arg_450_3, arg_450_4, arg_450_5 - 2)
end

function render_func_26()
	for iter_451_0 = 1, #empty_0_46_0 do
		local var_451_0 = empty_0_46_0[iter_451_0]

		if var_451_0.color == nil then
			-- block empty
		else
			local var_451_1 = vector(const_0_41_1, var_451_0.offset)
			local var_451_2 = var_451_1 + vector(const_0_39_1, const_0_40_1)
			local var_451_3 = var_451_0.text_size + vector(50)
			local var_451_4 = var_451_0.color
			local var_451_5 = var_451_0.draw_element
			local var_451_6 = var_451_0.progress

			var_451_2.y = var_451_2.y + 2

			if var_451_5 ~= nil then
				var_451_3.x = var_451_3.x + var_451_5.size.x + 5
			end

			if var_451_6 ~= nil then
				var_451_3.x = var_451_3.x + 30
			end

			render_func_24(var_451_1, var_451_1 + var_451_3)

			if var_451_5 ~= nil then
				local var_451_7 = var_451_1:clone()

				var_451_7.x = var_451_7.x + const_0_39_1
				var_451_7.y = var_451_7.y + (var_451_3.y - var_451_5.size.y) / 2

				var_451_5:draw(var_451_7, var_451_4, "f")

				var_451_2.x = var_451_2.x + var_451_5.size.x + 5
			end

			render.text(render_load_font_4, var_451_2 + 1, color(0, 0, 0, 128), "", var_451_0.text)
			render.text(render_load_font_4, var_451_2, var_451_4, "", var_451_0.text)

			var_451_2.x = var_451_2.x + var_451_0.text_size.x

			if var_451_6 ~= nil then
				local var_451_8 = 10
				local var_451_9 = var_451_2.x + var_451_8 / 2 + 12
				local var_451_10 = var_451_1.y + var_451_3.y / 2
				local var_451_11 = vector(var_451_9, var_451_10)
				local var_451_12 = color(255, 255, 255, 200)

				render_func_25(var_451_11, var_451_12, 10, 0, var_451_6, 5)
			end
		end
	end
end

function render_func_27()
	if globals.is_in_game then
		render_func_23()
		render_func_26()
	end

	render_func_18()
end

unused_0_72_0 = nil

function render_func_28(arg_453_0)
	events.render(render_func_27, arg_453_0:get())
end

ref_0_36_1.enabled:set_callback(render_func_28, true)

unused_0_36_0 = nil
ref_0_37_0 = empty_0_15_0.misc.visuals.zeus_warning
render_load_font_3 = render.load_font("Calibri", 29, "ad")
const_0_39_0 = 550
ref_0_40_0 = const_0_39_0 * const_0_39_0

function render_func_10(arg_454_0)
	if arg_454_0 == nil then
		return false
	end

	return arg_454_0:get_weapon_index() == 31
end

function render_func_11(arg_455_0, arg_455_1)
	local var_455_0 = arg_455_1:get_player_weapon()

	if not render_func_10(var_455_0) then
		return
	end

	local var_455_1 = arg_455_0:get_origin()

	if (arg_455_1:get_origin() - var_455_1):lengthsqr() > ref_0_40_0 then
		return
	end

	local var_455_2 = arg_455_1:get_bbox()

	if var_455_2 == nil or var_455_2.alpha <= 0 then
		return
	end

	local var_455_3 = var_455_2.pos1
	local var_455_4 = var_455_2.pos2

	if var_455_3 == nil or var_455_4 == nil then
		return
	end

	local var_455_5 = math.abs(globals.realtime * 2 % 2 - 1)
	local var_455_6 = math.map(var_455_5, 0, 1, 0.33, 1)
	local var_455_7 = var_455_2.alpha * var_455_6

	if var_455_7 <= 0 then
		return
	end

	local var_455_8 = 40
	local var_455_9 = vector(var_455_3.x + (var_455_4.x - var_455_3.x) / 2, var_455_3.y - 16 - var_455_8 / 2):floor()
	local var_455_10 = color(225, 165, 145, 200)

	var_455_10.a = var_455_10.a * var_455_7

	local var_455_11 = color(255, 255, 255, 255)

	var_455_11.a = var_455_11.a * var_455_7

	local var_455_12 = color(255, 255, 255, 245)

	var_455_12.a = var_455_12.a * var_455_7

	render.circle(var_455_9, var_455_10, 18, 0, 1)
	render.circle_outline(var_455_9, var_455_11, 19, 0, 1)

	local var_455_13 = var_455_9 + vector(0, 2)

	render.text(render_load_font_3, var_455_13, var_455_12, "c", "!")
end

function ui_callback_18()
	local var_456_0 = entity.get_local_player()

	if var_456_0 == nil or not var_456_0:is_alive() then
		return
	end

	local var_456_1 = entity.get_players(true)

	for iter_456_0 = 1, #var_456_1 do
		local var_456_2 = var_456_1[iter_456_0]

		render_func_11(var_456_0, var_456_2)
	end
end

unused_0_44_0 = nil

function ui_callback_19(arg_457_0)
	events.render(ui_callback_18, arg_457_0:get())
end

ref_0_37_0.enabled:set_callback(ui_callback_19, true)

