slot_0_0_0 = require("neverlose/base64")
slot_0_1_0 = require("neverlose/csgo_weapons")
slot_0_2_0 = require("neverlose/clipboard")
slot_0_3_1 = slot_0_2_0.get

function slot_0_2_0.get(...)
	local var_1_0 = slot_0_3_1(...)
	local var_1_1 = var_1_0:find("\x00")

	if var_1_1 ~= nil then
		return var_1_0:sub(1, var_1_1 - 1)
	end

	return var_1_0
end

slot_0_3_0 = " "

function slot_0_4_0(arg_2_0, arg_2_1)
	for iter_2_0 = 1, #arg_2_0 do
		if arg_2_0[iter_2_0] == arg_2_1 then
			return iter_2_0
		end
	end

	return nil
end

function slot_0_5_0(...)
	local var_3_0 = ""

	for iter_3_0 = 1, select("#", ...) do
		var_3_0 = var_3_0 .. select(iter_3_0, ...)
	end

	return var_3_0
end

function slot_0_6_0(arg_4_0)
	if arg_4_0 > 0 then
		arg_4_0 = math.floor(arg_4_0 + 0.5)
	else
		arg_4_0 = math.ceil(arg_4_0 - 0.5)
	end

	return arg_4_0
end

slot_0_7_0 = {}
slot_0_7_0.user, slot_0_7_0.name = common.get_username(), "angelwings"
slot_0_7_0.build = "exclusive"
slot_0_8_1 = nil
slot_0_8_0 = {
	lerp = function(arg_5_0, arg_5_1, arg_5_2)
		return arg_5_0 + arg_5_2 * (arg_5_1 - arg_5_0)
	end,
	extrapolate = function(arg_6_0, arg_6_1, arg_6_2)
		return arg_6_0 + arg_6_1 * (arg_6_2 * globals.tickinterval)
	end,
	closest_ray_point = function(arg_7_0, arg_7_1, arg_7_2, arg_7_3)
		local var_7_0 = arg_7_2 - arg_7_0
		local var_7_1 = arg_7_1 - arg_7_0
		local var_7_2 = var_7_1.x * var_7_1.x + var_7_1.y * var_7_1.y
		local var_7_3 = (var_7_0.x * var_7_1.x + var_7_0.y * var_7_1.y) / var_7_2

		if arg_7_3 then
			if var_7_3 <= 0 then
				return arg_7_0
			end

			if var_7_3 >= 1 then
				return arg_7_1
			end
		end

		return arg_7_0 + var_7_3 * var_7_1
	end
}
slot_0_9_1 = nil
slot_0_9_0 = {
	antiaim = {
		angles = {
			enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
			pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
			yaw = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden")
			},
			yaw_modifier = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset")
			},
			body_yaw = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
			},
			freestanding = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
			},
			extended_angles = {
				ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
				ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
			}
		},
		misc = {
			fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
			slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
			leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
		}
	},
	ragebot = {
		main = {
			hide_shots = {
				ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
				ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options")
			},
			double_tap = {
				ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
				ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
				ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"),
				ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport"),
				ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Quick-Switch")
			}
		},
		selection = {
			min_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
		}
	}
}
slot_0_10_1 = nil
slot_0_10_0 = {}
slot_0_11_2 = {}
slot_0_11_2.__index = slot_0_11_2

function slot_0_11_2.new(arg_8_0)
	return setmetatable({
		count = 0,
		list = {}
	}, arg_8_0)
end

function slot_0_11_2.__len(arg_9_0)
	return arg_9_0.count
end

function slot_0_11_2.__call(arg_10_0, arg_10_1, arg_10_2)
	if arg_10_2 == false then
		return arg_10_0:unset(arg_10_1)
	end

	return arg_10_0:set(arg_10_1)
end

function slot_0_11_2.unset(arg_11_0, arg_11_1)
	local var_11_0 = slot_0_4_0(arg_11_0.list, arg_11_1)

	if var_11_0 ~= nil then
		arg_11_0.count = arg_11_0.count - 1

		table.remove(arg_11_0.list, var_11_0)
	end

	return arg_11_0
end

function slot_0_11_2.set(arg_12_0, arg_12_1, arg_12_2)
	if arg_12_2 == false then
		return arg_12_0:unset(arg_12_1)
	end

	if not slot_0_4_0(arg_12_0.list, arg_12_1) then
		arg_12_0.count = arg_12_0.count + 1

		table.insert(arg_12_0.list, arg_12_1)
	end

	return arg_12_0
end

function slot_0_11_2.fire(arg_13_0, ...)
	local var_13_0 = arg_13_0.list

	for iter_13_0 = 1, #var_13_0 do
		var_13_0[iter_13_0](...)
	end

	return arg_13_0
end

slot_0_12_3 = {}

function slot_0_13_4(arg_14_0, arg_14_1)
	local var_14_0 = rawget(arg_14_0, arg_14_1)

	if var_14_0 == nil then
		var_14_0 = slot_0_11_2:new()

		rawset(arg_14_0, arg_14_1, var_14_0)
	end

	return var_14_0
end

function slot_0_12_3.new(arg_15_0)
	return setmetatable({}, {
		__index = slot_0_13_4
	})
end

function slot_0_10_0.new(arg_16_0)
	return slot_0_12_3:new()
end

slot_0_11_1 = nil
slot_0_11_0 = {}
slot_0_12_2 = bit.lshift(1, 0)
slot_0_13_3 = {}
slot_0_13_3.__index = slot_0_13_3

function slot_0_13_3.__newindex(arg_17_0, arg_17_1, arg_17_2)
	arg_17_0[0][arg_17_1] = arg_17_2
end

function slot_0_13_3.__index(arg_18_0, arg_18_1)
	local var_18_0 = rawget(slot_0_13_3, arg_18_1)

	if var_18_0 ~= nil then
		return var_18_0
	end

	local var_18_1 = rawget(arg_18_0, arg_18_1)

	if var_18_1 ~= nil then
		return var_18_1
	end

	local var_18_2 = arg_18_0[0][arg_18_1]

	if var_18_2 == nil then
		return nil
	end

	if type(var_18_2) == "function" then
		local function var_18_3(...)
			local var_19_0 = {}
			local var_19_1 = select("#", ...)

			for iter_19_0 = 1, var_19_1 do
				var_19_0[iter_19_0] = select(iter_19_0, ...)
			end

			if bit.band(arg_18_0.flags, slot_0_12_2) ~= 0 then
				arg_18_0:fire_callbacks(var_19_0, var_19_1)
			end

			if var_19_0[1] == arg_18_0 then
				var_19_0[1] = arg_18_0[0]
			end

			return var_18_2(unpack(var_19_0, 1, var_19_1))
		end

		rawset(arg_18_0, arg_18_1, var_18_3)

		return var_18_3
	end

	return var_18_2
end

function slot_0_13_3.new(arg_20_0, arg_20_1)
	local var_20_0 = {
		flags = 0,
		[0] = arg_20_1,
		callbacks = {}
	}

	var_20_0.flags = bit.bor(var_20_0.flags, slot_0_12_2)

	return setmetatable(var_20_0, arg_20_0)
end

function slot_0_13_3.fire_callbacks(arg_21_0, ...)
	local var_21_0 = rawget(arg_21_0, "callbacks")

	for iter_21_0 = 1, #var_21_0 do
		var_21_0[iter_21_0](...)
	end

	return arg_21_0
end

function slot_0_13_3.get_flag(arg_22_0, arg_22_1)
	return bit.band(arg_22_0.flags, arg_22_1) ~= 0
end

function slot_0_13_3.set_flag(arg_23_0, arg_23_1, arg_23_2)
	if arg_23_2 then
		arg_23_0.flags = bit.bor(arg_23_0.flags, arg_23_1)
	else
		arg_23_0.flags = bit.band(arg_23_0.flags, bit.bnot(arg_23_1))
	end

	return arg_23_0
end

function slot_0_13_3.set_callback(arg_24_0, arg_24_1)
	local var_24_0 = rawget(arg_24_0, "callbacks")

	if slot_0_4_0(var_24_0, arg_24_1) == nil then
		table.insert(var_24_0, arg_24_1)
	end

	return arg_24_0
end

function slot_0_13_3.unset_callback(arg_25_0, arg_25_1)
	local var_25_0 = rawget(arg_25_0, "callbacks")
	local var_25_1 = slot_0_4_0(var_25_0, arg_25_1)

	if var_25_1 ~= nil then
		table.remove(var_25_0, var_25_1)
	end

	return arg_25_0
end

slot_0_11_0.group_flags = {
	callbacks = slot_0_12_2
}

function slot_0_11_0.cast(arg_26_0)
	return slot_0_13_3:new(arg_26_0)
end

function slot_0_11_0.create(...)
	return slot_0_13_3:new(ui.create(...))
end

slot_0_12_1 = nil
slot_0_12_0 = {}
slot_0_13_2 = "ui\\beepclear.wav"
slot_0_14_3 = "resource\\warning.wav"
slot_0_15_2 = cvar.play

function slot_0_16_3(arg_28_0, arg_28_1)
	local var_28_0 = " · "
	local var_28_1 = string.format("\a%s[%s]\aDEFAULT", arg_28_0:to_hex(), slot_0_7_0.name)

	print_raw(var_28_1 .. var_28_0 .. arg_28_1)
end

function slot_0_12_0.log(arg_29_0)
	slot_0_16_3(color(255, 255, 255, 200), arg_29_0)
end

function slot_0_12_0.success(arg_30_0)
	slot_0_16_3(color(250, 137, 250, 255), arg_30_0)
	slot_0_15_2:call(slot_0_13_2)
end

function slot_0_12_0.error(arg_31_0)
	slot_0_16_3(color(250, 0, 50, 255), arg_31_0)
	slot_0_15_2:call(slot_0_14_3)
end

slot_0_13_1 = nil
slot_0_13_0 = {}
slot_0_14_2 = {}

function slot_0_13_0.get()
	return slot_0_14_2
end

function slot_0_13_0.add(arg_33_0, arg_33_1, arg_33_2)
	slot_0_14_2[arg_33_0] = {
		arg_33_1,
		arg_33_2
	}
end

slot_0_14_1 = nil
slot_0_14_0 = {}

function slot_0_15_1(arg_34_0, arg_34_1, arg_34_2, arg_34_3)
	return arg_34_2 * arg_34_0 / arg_34_3 + arg_34_1
end

function slot_0_16_2()
	return globals.frametime
end

function slot_0_17_4(arg_36_0, arg_36_1, arg_36_2, arg_36_3, arg_36_4)
	if arg_36_3 <= 0 then
		return arg_36_2
	end

	if arg_36_4 <= arg_36_3 then
		return arg_36_2
	end

	arg_36_1 = arg_36_0(arg_36_3, arg_36_1, arg_36_2 - arg_36_1, arg_36_4)

	if type(arg_36_1) == "number" then
		if math.abs(arg_36_2 - arg_36_1) < 0.001 then
			return arg_36_2
		end

		local var_36_0 = arg_36_1 % 1

		if var_36_0 < 0.001 then
			return math.floor(arg_36_1)
		end

		if var_36_0 > 0.999 then
			return math.ceil(arg_36_1)
		end
	end

	return arg_36_1
end

function slot_0_14_0.interp(arg_37_0, arg_37_1, arg_37_2, arg_37_3)
	arg_37_3 = arg_37_3 or slot_0_15_1

	if type(arg_37_1) == "boolean" then
		arg_37_1 = arg_37_1 and 1 or 0
	end

	return slot_0_17_4(arg_37_3, arg_37_0, arg_37_1, slot_0_16_2(), arg_37_2)
end

slot_0_15_0 = nil
slot_0_16_1 = _G.render
slot_0_17_3 = math.floor
slot_0_18_4 = color(0, 0, 0, 0)
slot_0_19_4 = 1
slot_0_20_3 = "s"

function slot_0_21_3(arg_38_0)
	if slot_0_19_4 == 1 then
		return arg_38_0
	end

	return arg_38_0 * slot_0_19_4
end

slot_0_22_4 = 1
slot_0_23_3 = {}
slot_0_24_5 = color().alpha_modulate

function slot_0_25_5(arg_39_0, arg_39_1)
	if slot_0_22_4 == 1 then
		return arg_39_0
	elseif not arg_39_1 and slot_0_22_4 == 0 then
		return slot_0_18_4
	else
		return slot_0_24_5(arg_39_0, slot_0_22_4, true)
	end
end

slot_0_15_0 = setmetatable({
	cheap = false,
	dpi = slot_0_16_1.get_scale(2),
	push_alpha = function(arg_40_0)
		local var_40_0 = #slot_0_23_3

		if var_40_0 > 255 then
			error("alpha stack exceeded 255 objects, report to developers")
		end

		slot_0_23_3[var_40_0 + 1] = arg_40_0
		slot_0_22_4 = slot_0_22_4 * slot_0_23_3[var_40_0 + 1] * (slot_0_23_3[var_40_0] or 1)
	end,
	pop_alpha = function()
		local var_41_0 = #slot_0_23_3
		local var_41_1

		slot_0_23_3[var_41_0], var_41_1 = nil, var_41_0 - 1
		slot_0_22_4 = var_41_1 == 0 and 1 or slot_0_23_3[var_41_1] * (slot_0_23_3[var_41_1 - 1] or 1)
	end,
	get_alpha = function(arg_42_0)
		if arg_42_0 then
			return slot_0_23_3[arg_42_0]
		end

		return slot_0_22_4, #slot_0_23_3
	end,
	screen_size = function(arg_43_0)
		return slot_0_16_1.screen_size() / (arg_43_0 and 1 or slot_0_19_4)
	end,
	measure_text = function(arg_44_0, ...)
		return slot_0_16_1.measure_text(arg_44_0, ...) / slot_0_19_4
	end,
	load_font = function(arg_45_0, arg_45_1, arg_45_2)
		return slot_0_16_1.load_font(arg_45_0, arg_45_1, arg_45_2 or "")
	end,
	text = function(arg_46_0, arg_46_1, arg_46_2, arg_46_3, ...)
		slot_0_16_1.text(arg_46_0, slot_0_21_3(arg_46_1), slot_0_25_5(arg_46_2), arg_46_3, ...)

		if measure == true then
			return slot_0_15_0.measure_text(arg_46_0, arg_46_3, ...)
		end
	end,
	blur = function(arg_47_0, arg_47_1, arg_47_2, arg_47_3, arg_47_4)
		if slot_0_15_0.cheap then
			return
		end

		if type(arg_47_4) == "table" then
			for iter_47_0 = 1, 4 do
				arg_47_4[iter_47_0] = slot_0_21_3(arg_47_4[iter_47_0] or 0)
			end
		else
			arg_47_4 = slot_0_21_3(arg_47_4 or 0)
		end

		arg_47_3, arg_47_2 = (arg_47_3 or 1) * slot_0_22_4, slot_0_21_3(arg_47_2 or 2)

		if arg_47_3 > 0 and arg_47_2 > 0 then
			slot_0_16_1.blur(slot_0_21_3(arg_47_0), slot_0_21_3(arg_47_1), arg_47_2, arg_47_3, arg_47_4)
		end
	end,
	shadow = function(arg_48_0, arg_48_1, arg_48_2, arg_48_3, arg_48_4, arg_48_5)
		if slot_0_15_0.cheap then
			return
		end

		slot_0_16_1.shadow(slot_0_21_3(arg_48_0), slot_0_21_3(arg_48_1), slot_0_25_5(arg_48_2), slot_0_21_3(arg_48_3 or 16), slot_0_21_3(arg_48_4 or 0), slot_0_21_3(arg_48_5 or 0))
	end,
	line = function(arg_49_0, arg_49_1, arg_49_2)
		slot_0_16_1.line(slot_0_21_3(arg_49_0), slot_0_21_3(arg_49_1), slot_0_25_5(arg_49_2))
	end,
	rect = function(arg_50_0, arg_50_1, arg_50_2, arg_50_3, arg_50_4)
		if type(arg_50_3) == "table" then
			for iter_50_0 = 1, 4 do
				arg_50_3[iter_50_0] = slot_0_21_3(arg_50_3[iter_50_0] or 0)
			end
		else
			arg_50_3 = slot_0_21_3(arg_50_3 or 0)
		end

		slot_0_16_1.rect(slot_0_21_3(arg_50_0), slot_0_21_3(arg_50_1), slot_0_25_5(arg_50_2), arg_50_3, arg_50_4 or false)
	end,
	rect_outline = function(arg_51_0, arg_51_1, arg_51_2, arg_51_3, arg_51_4, arg_51_5)
		if type(arg_51_4) == "table" then
			for iter_51_0 = 1, 4 do
				arg_51_4[iter_51_0] = slot_0_21_3(arg_51_4[iter_51_0] or 0)
			end
		else
			arg_51_4 = slot_0_21_3(arg_51_4 or 0)
		end

		slot_0_16_1.rect_outline(slot_0_21_3(arg_51_0), slot_0_21_3(arg_51_1), slot_0_25_5(arg_51_2), slot_0_21_3(arg_51_3 or 0), arg_51_4, arg_51_5 or false)
	end,
	gradient = function(arg_52_0, arg_52_1, arg_52_2, arg_52_3, arg_52_4, arg_52_5, arg_52_6)
		arg_52_4, arg_52_5 = arg_52_4 or arg_52_2, arg_52_5 or arg_52_3

		slot_0_16_1.gradient(slot_0_21_3(arg_52_0), slot_0_21_3(arg_52_1), slot_0_25_5(arg_52_2, true), slot_0_25_5(arg_52_3, true), slot_0_25_5(arg_52_4, true), slot_0_25_5(arg_52_5, true), arg_52_6 or 0)
	end,
	circle = function(arg_53_0, arg_53_1, arg_53_2, arg_53_3, arg_53_4)
		slot_0_16_1.circle(slot_0_21_3(arg_53_0), slot_0_25_5(arg_53_1), slot_0_21_3(arg_53_2), arg_53_3 or 0, arg_53_4 or 1)
	end,
	circle_outline = function(arg_54_0, arg_54_1, arg_54_2, arg_54_3, arg_54_4, arg_54_5)
		slot_0_16_1.circle_outline(slot_0_21_3(arg_54_0), slot_0_25_5(arg_54_1), slot_0_21_3(arg_54_2), arg_54_3 or 0, arg_54_4 or 1, slot_0_21_3(arg_54_5 or 1))
	end,
	circle_3d = function(arg_55_0, arg_55_1, arg_55_2, arg_55_3, arg_55_4)
		slot_0_16_1.circle_3d(arg_55_0, slot_0_25_5(arg_55_1), arg_55_2, arg_55_3 or 0, arg_55_4 or 1, false)
	end,
	circle_3d_outline = function(arg_56_0, arg_56_1, arg_56_2, arg_56_3, arg_56_4, arg_56_5)
		slot_0_16_1.circle_3d_outline(arg_56_0, slot_0_25_5(arg_56_1), arg_56_2, arg_56_3 or 0, arg_56_4 or 1, slot_0_21_3(arg_56_5 or 1))
	end,
	circle_3d_gradient = function(arg_57_0, arg_57_1, arg_57_2, arg_57_3, arg_57_4, arg_57_5, arg_57_6)
		slot_0_16_1.circle_3d_gradient(arg_57_0, slot_0_25_5(arg_57_1), slot_0_25_5(arg_57_2), arg_57_3, arg_57_4 or 0, arg_57_5 or 1, slot_0_21_3(arg_57_6 or 1))
	end,
	texture = function(arg_58_0, arg_58_1, arg_58_2, arg_58_3, arg_58_4, arg_58_5)
		if not arg_58_0 then
			return
		end

		arg_58_3 = arg_58_3 or color()

		slot_0_16_1.texture(arg_58_0, slot_0_21_3(arg_58_1), slot_0_21_3(arg_58_2 or vector(arg_58_0.width, arg_58_0.height)), slot_0_25_5(arg_58_3), arg_58_4 or "", arg_58_5 or 0)
	end,
	push_clip_rect = function(arg_59_0, arg_59_1, arg_59_2)
		slot_0_16_1.push_clip_rect(slot_0_21_3(arg_59_0), slot_0_21_3(arg_59_1), arg_59_2 or false)
	end
}, {
	__index = slot_0_16_1
})
slot_0_16_0 = nil
slot_0_17_2 = {}
slot_0_18_3 = nil
slot_0_19_3 = color(255, 255, 255, 255)

function slot_0_20_2(arg_60_0, arg_60_1, arg_60_2)
	return arg_60_0.x >= arg_60_1.x and arg_60_0.x <= arg_60_2.x and arg_60_0.y >= arg_60_1.y and arg_60_0.y <= arg_60_2.y
end

slot_0_21_2 = slot_0_11_0.create("##DRAG")

slot_0_21_2:visibility(false)

slot_0_22_3 = slot_0_15_0.screen_size()
slot_0_16_0 = {
	data = slot_0_17_2,
	in_bounds = slot_0_20_2,
	new = function(arg_61_0, arg_61_1)
		if type(arg_61_1) ~= "table" then
			arg_61_1 = {}
		end

		slot_0_16_0[arg_61_0.id] = {
			x = slot_0_21_2:slider(arg_61_0.id .. "::x", 0, 10000, arg_61_0.pos.x / slot_0_22_3.x * 10000),
			y = slot_0_21_2:slider(arg_61_0.id .. "::y", 0, 10000, arg_61_0.pos.y / slot_0_22_3.y * 10000)
		}

		slot_0_16_0[arg_61_0.id].x:set_callback(function(arg_62_0)
			arg_61_0.pos.x = slot_0_6_0(arg_62_0:get() * 0.0001 * slot_0_22_3.x)
		end, true)
		slot_0_16_0[arg_61_0.id].y:set_callback(function(arg_63_0)
			arg_61_0.pos.y = slot_0_6_0(arg_63_0:get() * 0.0001 * slot_0_22_3.y)
		end, true)

		arg_61_0.__drag = {
			active = false,
			locked = false,
			point = vector(),
			progress = {
				0,
				0,
				0,
				0
			},
			border = arg_61_1.border or {
				vector(),
				oscreen
			},
			rulers = arg_61_1.rulers or {},
			on_release = arg_61_1.on_release,
			on_held = arg_61_1.on_held,
			on_active = arg_61_1.on_active,
			config = slot_0_16_0[arg_61_0.id]
		}

		events.mouse_input:set(function()
			if ui.get_alpha() > 0 and (arg_61_0.__drag.hovered or arg_61_0.__drag.active) then
				return false
			end
		end)
		events.dpi_change:set(function(arg_65_0, arg_65_1, arg_65_2)
			slot_0_16_0[arg_61_0.id].x:set(slot_0_16_0[arg_61_0.id].x.value)
			slot_0_16_0[arg_61_0.id].y:set(slot_0_16_0[arg_61_0.id].y.value)
		end)
	end,
	process = function(arg_66_0)
		slot_66_1_0 = arg_66_0.__drag

		if slot_66_1_0.locked or ui.get_alpha() == 0 then
			return
		end

		slot_66_2_0 = ui.get_mouse_position() / slot_0_15_0.dpi
		slot_66_3_0 = ui.get_position()
		slot_66_4_0 = ui.get_size()
		slot_66_5_0 = ui.get_alpha() > 0 and common.is_button_down(1)
		slot_66_6_0 = slot_0_20_2(slot_66_2_0, arg_66_0.pos, arg_66_0.pos + arg_66_0.size) and not slot_0_20_2(slot_66_2_0, slot_66_3_0 / slot_0_15_0.dpi, (slot_66_3_0 + slot_66_4_0) / slot_0_15_0.dpi)

		if slot_66_5_0 and slot_66_1_0.ready == nil then
			slot_66_1_0.ready, slot_66_1_0.point, slot_66_1_0.init = slot_66_6_0, arg_66_0.pos - slot_66_2_0, arg_66_0.pos:clone()
		end

		if slot_66_5_0 and slot_66_1_0.ready then
			if slot_0_18_3 == nil and slot_66_1_0.on_held then
				slot_66_1_0.on_held(arg_66_0, slot_66_1_0)
			end

			slot_0_18_3 = slot_66_1_0.ready and slot_0_18_3 == nil and arg_66_0.id or slot_0_18_3
			slot_66_1_0.active = slot_0_18_3 == arg_66_0.id
		elseif not slot_66_5_0 then
			if slot_66_1_0.active and slot_66_1_0.on_release then
				slot_66_1_0.on_release(arg_66_0, slot_66_1_0)
			end

			slot_66_1_0.active = false
			slot_66_1_0.ready, slot_66_1_0.point, slot_66_1_0.init, slot_66_1_0.aligning, slot_0_18_3 = nil
		end

		slot_66_7_0 = arg_66_0.pos * slot_0_15_0.dpi
		slot_66_8_0 = arg_66_0.size * slot_0_15_0.dpi
		slot_66_1_0.hovered = slot_66_6_0 or slot_66_1_0.active
		slot_66_9_0 = {}
		slot_66_10_0 = slot_66_7_0 + slot_66_8_0 * 0.5
		slot_66_11_0 = slot_66_1_0.point and (slot_66_1_0.point + slot_66_2_0) * slot_0_15_0.dpi or slot_66_7_0
		slot_66_1_0.progress[1] = slot_0_14_0.interp(slot_66_1_0.progress[1], slot_66_1_0.active, 0.1)
		slot_66_1_0.progress[2] = slot_0_14_0.interp(slot_66_1_0.progress[2], slot_66_1_0.active or slot_66_1_0.hovered, 0.1)
		slot_66_12_0 = slot_66_1_0.progress[1]
		slot_66_13_0 = slot_66_1_0.progress[2]

		slot_0_15_0.push_alpha(ui.get_alpha())
		slot_0_15_0.rect(arg_66_0.pos - 4, arg_66_0.pos + arg_66_0.size + 4, slot_0_19_3:alpha_modulate(0.1 * (slot_66_13_0 * 0.65 + 0.35), true), 6)
		slot_0_15_0.rect_outline(arg_66_0.pos - 5, arg_66_0.pos + arg_66_0.size + 5, slot_0_19_3:alpha_modulate(0.3 * slot_66_12_0, true), 1, 7)
		slot_0_15_0.push_alpha(slot_66_12_0)

		if slot_66_12_0 > 0 and not common.is_button_down(162) then
			slot_66_14_1 = (slot_66_11_0 + slot_66_8_0 * 0.5) / slot_0_15_0.dpi

			for iter_66_0, iter_66_1 in ipairs(slot_66_1_0.rulers) do
				iter_66_1[4] = iter_66_1[4] or {
					0
				}
				slot_66_20_0 = iter_66_1[2] / slot_0_15_0.dpi
				slot_66_22_0 = math.abs(iter_66_1[1] and slot_66_14_1.x - slot_66_20_0.x or slot_66_14_1.y - slot_66_20_0.y) < 10 * slot_0_15_0.dpi
				slot_66_23_0 = slot_66_20_0
				slot_66_24_0 = iter_66_1[1] and vector(slot_66_20_0.x + 1, iter_66_1[3] / slot_0_15_0.dpi) or vector(iter_66_1[3] / slot_0_15_0.dpi, slot_66_20_0.y + 1)
				slot_66_25_0 = iter_66_1[1] and 1 or 2

				if not slot_66_9_0[slot_66_25_0] then
					slot_66_9_0[slot_66_25_0] = slot_66_22_0 and (iter_66_1[1] and slot_66_20_0.x - arg_66_0.size.x * 0.5 or slot_66_20_0.y - arg_66_0.size.y * 0.5) or nil
				end

				slot_66_26_0 = math.abs(iter_66_1[1] and slot_66_10_0.x - slot_66_20_0.x or slot_66_10_0.y - slot_66_20_0.y)
				slot_66_1_0.progress[4] = slot_0_14_0.interp(slot_66_1_0.progress[4], slot_66_22_0 or slot_66_26_0 < 10 * slot_0_15_0.dpi, 0.1)
				slot_66_27_0 = slot_66_1_0.progress[4] * 0.35 + 0.1

				slot_0_15_0.rect(slot_66_23_0, slot_66_24_0, slot_0_19_3:alpha_modulate(slot_66_27_0, true))
			end

			if slot_66_1_0.border[3] then
				slot_66_15_2 = utilities.in_bounds(arg_66_0.pos, slot_66_1_0.border[1], slot_66_1_0.border[2] - arg_66_0.size * 0.5 - 1)
				slot_66_1_0.progress[3] = slot_0_14_0.interp(slot_66_1_0.progress[3], not slot_66_15_2, 0.1)
				slot_66_16_2 = slot_66_1_0.progress[3]

				slot_0_15_0.rect_outline(slot_66_1_0.border[1] / slot_0_15_0.dpi, slot_66_1_0.border[2] / slot_0_15_0.dpi, slot_0_19_3:alpha_modulate(slot_66_16_2 * 0.75 + 0.25, true), 1, 4)
			end
		end

		slot_0_15_0.pop_alpha()
		slot_0_15_0.pop_alpha()

		if slot_66_1_0.active then
			slot_66_14_0 = slot_66_11_0 / slot_0_15_0.dpi

			if common.is_button_down(160) then
				slot_66_15_1 = slot_66_1_0.init:to(slot_66_14_0)
				slot_66_16_1 = math.abs(slot_66_15_1.y)
				slot_66_17_1 = math.abs(slot_66_15_1.x)

				if slot_66_1_0.aligning == nil then
					if slot_66_16_1 > 0.9 then
						slot_66_1_0.aligning = 0
					elseif slot_66_17_1 > 0.9 then
						slot_66_1_0.aligning = 1
					end
				end

				if slot_66_1_0.aligning == 0 then
					slot_66_14_0.x = slot_66_1_0.init.x

					slot_0_15_0.rect(vector(slot_66_14_0.x + arg_66_0.size.x * 0.5, 0), vector(slot_66_14_0.x + arg_66_0.size.x * 0.5 + 1, slot_0_22_3.y), color(255, 64))
				elseif slot_66_1_0.aligning == 1 then
					slot_66_14_0.y = slot_66_1_0.init.y

					slot_0_15_0.rect(vector(0, slot_66_14_0.y + arg_66_0.size.y * 0.5), vector(slot_0_22_3.x, slot_66_14_0.y + arg_66_0.size.y * 0.5 + 1), color(255, 64))
				end
			end

			slot_66_14_0.x, slot_66_14_0.y = slot_66_9_0[1] or slot_66_14_0.x, slot_66_9_0[2] or slot_66_14_0.y
			slot_66_15_0 = (slot_66_1_0.border[1] - slot_66_8_0 * 0.5) / slot_0_15_0.dpi
			slot_66_16_0 = (slot_66_1_0.border[2] - slot_66_8_0 * 0.5) / slot_0_15_0.dpi
			slot_66_17_0 = math.clamp(slot_66_14_0.x, slot_66_15_0.x, math.min(slot_66_16_0.x, slot_0_22_3.x - arg_66_0.size.x))
			slot_66_18_0 = math.clamp(slot_66_14_0.y, slot_66_15_0.y, math.min(slot_66_16_0.y, slot_0_22_3.y - arg_66_0.size.y))

			arg_66_0:set_position(slot_66_17_0, slot_66_18_0)

			if slot_66_1_0.on_active then
				slot_66_1_0.on_active(arg_66_0, slot_66_1_0, slot_66_14_0)
			end
		end
	end
}
slot_0_17_1 = nil
slot_0_18_2 = nil
slot_0_18_2 = {
	update = function(arg_67_0)
		return 1
	end,
	paint = function(arg_68_0, arg_68_1, arg_68_2)
		return
	end,
	set_position = function(arg_69_0, arg_69_1, arg_69_2)
		local var_69_0
		local var_69_1

		if type(arg_69_1) == "userdata" then
			var_69_0, var_69_1 = arg_69_1.x, arg_69_1.y
		else
			var_69_0, var_69_1 = arg_69_1, arg_69_2
		end

		local var_69_2 = slot_0_15_0.screen_size()

		if arg_69_0.__drag then
			if var_69_0 then
				arg_69_0.__drag.config.x:set(var_69_0 / var_69_2.x * 10000)
			end

			if var_69_1 then
				arg_69_0.__drag.config.y:set(var_69_1 / var_69_2.y * 10000)
			end
		else
			arg_69_0.pos.x, arg_69_0.pos.y = var_69_0 or arg_69_0.pos.x, var_69_1 or arg_69_0.pos.y
		end
	end,
	get_drag_position = function(arg_70_0)
		local var_70_0 = arg_70_0.__drag and arg_70_0.__drag.config

		if not var_70_0 then
			return arg_70_0.pos
		end

		local var_70_1 = slot_0_15_0.screen_size()
		local var_70_2 = var_70_0.x:get()
		local var_70_3 = var_70_0.y:get()

		return vector(var_70_2 * 0.0001 * var_70_1.x, var_70_3 * 0.0001 * var_70_1.y)
	end,
	get_drag_size = function(arg_71_0)
		return arg_71_0.size:clone()
	end,
	__call = function(arg_72_0)
		local var_72_0 = arg_72_0.__list
		local var_72_1 = arg_72_0.__drag

		if var_72_0 then
			var_72_0.items, var_72_0.active = var_72_0.collect(), 0

			for iter_72_0 = 1, #var_72_0.items do
				if var_72_0.items[iter_72_0].active then
					var_72_0.active = var_72_0.active + 1
				end
			end
		end

		arg_72_0.alpha = arg_72_0:update()

		slot_0_15_0.push_alpha(arg_72_0.alpha)

		if arg_72_0.alpha > 0 then
			if var_72_1 then
				slot_0_16_0.process(arg_72_0)
			end

			if var_72_0 then
				slot_0_18_2.traverse(arg_72_0)
			end

			arg_72_0:paint(arg_72_0.pos, arg_72_0.pos + arg_72_0.size)
		end

		slot_0_15_0.pop_alpha()
	end,
	enlist = function(arg_73_0, arg_73_1, arg_73_2, arg_73_3)
		arg_73_0.__list = {
			active = 0,
			longest = 0,
			items = {},
			progress = setmetatable({}, {
				__mode = "k"
			}),
			minwidth = arg_73_0.size.x,
			collect = arg_73_1,
			paint = arg_73_2,
			rev = arg_73_3
		}
	end,
	traverse = function(arg_74_0)
		local var_74_0 = arg_74_0.__list
		local var_74_1 = 0
		local var_74_2 = vector()

		var_74_0.active, var_74_0.longest = 0, 0

		for iter_74_0 = 1, #var_74_0.items do
			local var_74_3 = var_74_0.items[iter_74_0]
			local var_74_4 = var_74_3.name or iter_74_0

			var_74_0.progress[var_74_4] = var_74_0.progress[var_74_4] or {
				0
			}

			local var_74_5 = anima.condition(var_74_0.progress[var_74_4], var_74_3.active, 6, {
				{
					1,
					3
				},
				{
					2,
					3
				}
			})

			if var_74_5 > 0 then
				slot_0_15_0.push_alpha(var_74_5)

				local var_74_6 = var_74_0.paint(arg_74_0, var_74_3, var_74_1, var_74_5)

				slot_0_15_0.pop_alpha()

				var_74_0.active, var_74_1 = var_74_0.active + 1, var_74_1 + var_74_6.y * var_74_5
				var_74_0.longest = math.max(var_74_0.longest, var_74_6.x)
			end
		end

		arg_74_0.size.x = anima.lerp(arg_74_0.size.x, math.max(var_74_0.longest, var_74_0.minwidth), 10, 0.5)
	end,
	lock = function(arg_75_0, arg_75_1)
		if not arg_75_0.__drag then
			return
		end

		arg_75_0.__drag.locked = arg_75_1 and true or false
	end
}
slot_0_18_2.__index = slot_0_18_2
slot_0_17_0 = {
	new = function(arg_76_0, arg_76_1, arg_76_2, arg_76_3)
		local var_76_0 = {
			alpha = 1,
			id = arg_76_0,
			pos = arg_76_1,
			size = arg_76_2,
			progress = {
				0
			}
		}

		if arg_76_3 then
			slot_0_16_0.new(var_76_0, type(arg_76_3) == "table" and arg_76_3 or nil)
		end

		return setmetatable(var_76_0, slot_0_18_2)
	end
}
slot_0_18_1 = nil
slot_0_18_0 = {}

function slot_0_19_2(arg_77_0)
	local var_77_0 = {}
	local var_77_1 = 0

	for iter_77_0 in string.gmatch(arg_77_0, ".[\x80-\xBF]*") do
		var_77_1 = var_77_1 + 1
		var_77_0[var_77_1] = iter_77_0
	end

	return var_77_0, var_77_1
end

function slot_0_18_0.gradient(arg_78_0, arg_78_1, arg_78_2, arg_78_3)
	local var_78_0 = {}
	local var_78_1, var_78_2 = slot_0_19_2(arg_78_0)
	local var_78_3 = 1 / (var_78_2 - 1)
	local var_78_4 = arg_78_3.r - arg_78_2.r
	local var_78_5 = arg_78_3.g - arg_78_2.g
	local var_78_6 = arg_78_3.b - arg_78_2.b
	local var_78_7 = arg_78_3.a - arg_78_2.a

	for iter_78_0 = 1, var_78_2 do
		local var_78_8 = var_78_1[iter_78_0]
		local var_78_9 = arg_78_1 % 2

		if var_78_9 > 1 then
			var_78_9 = 2 - var_78_9
		end

		local var_78_10 = arg_78_2.r + var_78_9 * var_78_4
		local var_78_11 = arg_78_2.g + var_78_9 * var_78_5
		local var_78_12 = arg_78_2.b + var_78_9 * var_78_6
		local var_78_13 = arg_78_2.a + var_78_9 * var_78_7
		local var_78_14 = string.format("%02x%02x%02x%02x", var_78_10, var_78_11, var_78_12, var_78_13)

		table.insert(var_78_0, "\a")
		table.insert(var_78_0, var_78_14)
		table.insert(var_78_0, var_78_8)

		arg_78_1 = arg_78_1 + var_78_3
	end

	return table.concat(var_78_0)
end

slot_0_19_1 = nil
slot_0_19_0 = {
	recorder = {}
}
slot_0_20_1 = nil
slot_0_20_0 = {
	aimtools = {
		"Pistols",
		"AutoSnipers",
		"AWP",
		"SSG-08",
		"Desert Eagle",
		"R8 Revolver"
	},
	states = {
		[0] = "Shared",
		"Standing",
		"Running",
		"Slow motion",
		"Crouching",
		"Move & Crouching",
		"Air",
		"Air & Crouching",
		"On use",
		"Fakelag",
		"Freestanding",
		"Safe Head",
		"Manual Yaw",
		"Warmup AA"
	}
}
slot_0_21_1 = nil
slot_0_21_0 = {}
slot_0_22_2 = ".\\" .. slot_0_7_0.name

function slot_0_23_2(arg_79_0)
	return type(arg_79_0.type) == "string" and type(arg_79_0.link) == "string" and type(arg_79_0.width) == "number" and type(arg_79_0.height) == "number"
end

function slot_0_24_4(arg_80_0)
	return function(arg_81_0)
		if not slot_0_23_2(arg_81_0) then
			return false
		end

		files.create_folder(slot_0_22_2)

		local var_81_0 = string.format("%s/%s.%s", slot_0_22_2, arg_80_0, arg_81_0.type)
		local var_81_1 = files.read(var_81_0, true)

		if var_81_1 ~= nil then
			slot_0_21_0[arg_80_0] = slot_0_15_0.load_image(var_81_1, vector(arg_81_0.width, arg_81_0.height))
		else
			network.get(arg_81_0.link, {}, function(arg_82_0)
				if arg_82_0 == nil then
					return
				end

				local var_82_0 = arg_82_0

				slot_0_21_0[arg_80_0] = slot_0_15_0.load_image(var_82_0, vector(arg_81_0.width, arg_81_0.height))

				files.write(var_81_0, var_82_0, true)
			end)
		end

		return true
	end
end

slot_0_24_4("eva_small")({
	height = 35,
	type = "png",
	width = 35,
	link = "https://cdn.hysteria.one/angelwings/angelwings_eva_img.png"
})
slot_0_24_4("billy")({
	height = 185,
	type = "png",
	width = 131,
	link = "https://cdn.hysteria.one/angelwings/billy.png"
})
slot_0_24_4("tulen")({
	height = 401,
	type = "png",
	width = 401,
	link = "https://cdn.hysteria.one/angelwings/tulen.png"
})

slot_0_22_1 = nil
slot_0_22_0 = {}
slot_0_24_3 = -1
slot_0_25_4 = {}

function slot_0_26_5(arg_83_0, arg_83_1)
	arg_83_0:set(unpack(arg_83_1))
	arg_83_0:disabled(true)
end

function slot_0_27_6()
	for iter_84_0 = 1, #slot_0_25_4 do
		local var_84_0 = slot_0_25_4[iter_84_0]

		slot_0_26_5(var_84_0.item, var_84_0.value)
	end
end

function slot_0_22_0.is_locked(arg_85_0)
	if slot_0_24_3 == -1 then
		return false
	end

	if arg_85_0 == -1 then
		return true
	end

	return arg_85_0 <= slot_0_24_3
end

function slot_0_22_0.push(arg_86_0, arg_86_1, ...)
	if not slot_0_22_0.is_locked(arg_86_0) then
		return arg_86_1
	end

	local var_86_0 = {
		...
	}

	if select("#", ...) == 0 then
		var_86_0 = {
			false
		}
	end

	table.insert(slot_0_25_4, {
		item = arg_86_1,
		value = var_86_0
	})

	local function var_86_1(arg_87_0)
		slot_0_26_5(arg_87_0, var_86_0)
	end

	arg_86_1:set_callback(var_86_1, true)

	return arg_86_1
end

function slot_0_22_0.update()
	slot_0_27_6()
end

function slot_0_28_7(arg_89_0)
	if arg_89_0 == "pre_save" then
		slot_0_27_6()
	end
end

utils.execute_after(0, slot_0_27_6)
events.config_state(slot_0_28_7)

slot_0_23_1 = nil
slot_0_23_0 = {}
slot_0_24_2 = 1
slot_0_25_3 = 2

function slot_0_26_4(arg_90_0)
	return (string.gsub(arg_90_0, "${(.-)}", "\a{Link Active}%1\aDEFAULT"))
end

function slot_0_27_5(arg_91_0)
	return string.rep(slot_0_3_0, arg_91_0)
end

function slot_0_28_6(arg_92_0, arg_92_1)
	local var_92_0 = string.rep(slot_0_3_0, arg_92_1)

	return var_92_0 .. arg_92_0 .. var_92_0
end

function slot_0_29_7(arg_93_0, arg_93_1, arg_93_2, arg_93_3, arg_93_4)
	return slot_0_27_5(arg_93_3) .. "\a" .. arg_93_0 .. ui.get_icon(arg_93_1) .. slot_0_27_5(arg_93_4) .. "\aDEFAULT" .. arg_93_2
end

function slot_0_30_5(arg_94_0, arg_94_1, arg_94_2, arg_94_3)
	return slot_0_29_7("{Link Active}", arg_94_0, arg_94_1, arg_94_2, arg_94_3)
end

function slot_0_31_7(arg_95_0, arg_95_1, arg_95_2, arg_95_3)
	local var_95_0 = slot_0_27_5(arg_95_3)
	local var_95_1 = slot_0_27_5(3)
	local var_95_2 = ui.get_icon(arg_95_1)

	return var_95_0 .. "\a" .. arg_95_0 .. var_95_2 .. var_95_1 .. "\aDEFAULT" .. arg_95_2 .. var_95_0
end

function slot_0_32_6(arg_96_0, arg_96_1, arg_96_2)
	return slot_0_31_7("{Link Active}", arg_96_0, arg_96_1, arg_96_2)
end

function slot_0_33_7(arg_97_0, arg_97_1, arg_97_2)
	local var_97_0 = slot_0_27_5(arg_97_2)
	local var_97_1 = ui.get_icon(arg_97_1)

	return var_97_0 .. "\a" .. arg_97_0 .. var_97_1 .. var_97_0
end

function slot_0_34_7(arg_98_0, arg_98_1)
	return slot_0_33_7("{Link Active}", arg_98_0, arg_98_1)
end

function slot_0_35_7(arg_99_0, arg_99_1)
	local var_99_0 = arg_99_0:get()

	if #var_99_0 == 0 then
		if arg_99_1 == nil then
			local var_99_1 = arg_99_0:type()
			local var_99_2 = arg_99_0:list()

			if var_99_1 == "selectable" then
				arg_99_1 = var_99_2
			elseif var_99_1 == "listable" then
				arg_99_1 = {}

				for iter_99_0 = 1, #var_99_2 do
					arg_99_1[iter_99_0] = iter_99_0
				end
			end
		end

		var_99_0 = arg_99_1

		arg_99_0:set(arg_99_1)
	end

	arg_99_0:set_callback(function()
		local var_100_0 = arg_99_0:get()

		if #var_100_0 > 0 then
			var_99_0 = var_100_0
		else
			arg_99_0:set(var_99_0)
		end
	end)
end

slot_0_36_8 = {
	category = slot_0_11_0.create("~", "##CATEGORY", slot_0_24_2),
	info = slot_0_11_0.create("~", "##INFO", slot_0_24_2),
	antiaim = {
		main = slot_0_11_0.create("~", "##AA_MAIN", slot_0_24_2),
		state = slot_0_11_0.create("~", "##AA_STATE", slot_0_25_3),
		recorder = slot_0_11_0.create("~", "##AA_RECORDER", slot_0_25_3),
		settings = slot_0_11_0.create("~", "##AA_SETTINGS", slot_0_25_3),
		presets = slot_0_11_0.create("~", "##AA_PRESETS", slot_0_25_3)
	},
	ragebot = slot_0_11_0.create("~", "##RAGEBOT", slot_0_25_3),
	visuals = slot_0_11_0.create("~", "##VISUALS", slot_0_25_3),
	misc = slot_0_11_0.create("~", "##MISC", slot_0_25_3)
}
slot_0_37_11 = nil

function slot_0_38_16()
	local var_101_0 = ui.get_style()
	local var_101_1 = color(40, 40, 40, 255)
	local var_101_2 = var_101_0["Link Active"]
	local var_101_3 = -globals.realtime * 0.8
	local var_101_4 = slot_0_18_0.gradient(slot_0_7_0.name, var_101_3, var_101_2, var_101_1)

	ui.sidebar(var_101_4, "sparkles")
end

events.render(slot_0_38_16)

slot_0_38_15 = nil
slot_0_38_14 = slot_0_36_8.category:list("##CATEGORY", {
	"Anti-Aim",
	"Ragebot",
	"Visuals",
	"Misc"
})
slot_0_23_0.category = slot_0_38_14
slot_0_39_16 = {}
slot_0_40_19 = string.lower(slot_0_7_0.build)
slot_0_39_16.welcome_text = slot_0_36_8.info:label(slot_0_30_5("user", slot_0_26_4(string.format("Welcome back, ${%s}", slot_0_7_0.user)), 1, 7))
slot_0_39_16.welcome_text = slot_0_36_8.info:label(slot_0_30_5("code-branch", slot_0_26_4(string.format("Your build is ${%s}", slot_0_40_19)), 1, 7))
slot_0_23_0.info = slot_0_39_16
slot_0_40_18 = {
	label = slot_0_36_8.info:label(slot_0_5_0("\a{Link Active}", "Links")),
	discord = slot_0_36_8.info:button(slot_0_34_7("discord", 10), nil, true),
	youtube = slot_0_36_8.info:button(slot_0_34_7("youtube", 10), nil, true),
	config = slot_0_36_8.info:button(slot_0_34_7("file", 10), nil, true)
}
slot_0_23_0.links = slot_0_40_18
slot_0_41_21 = {
	label = slot_0_36_8.info:label(slot_0_5_0("\a{Link Active}", "Config")),
	export = slot_0_36_8.info:button(slot_0_32_6("copy", "Export", 7), nil, true),
	import = slot_0_36_8.info:button(slot_0_32_6("paste", "Import", 7), nil, true),
	default = slot_0_36_8.info:button(slot_0_28_6("Load Default Config", 34), nil, true)
}
slot_0_23_0.configs = slot_0_41_21
slot_0_42_25 = {}
slot_0_43_31 = slot_0_36_8.antiaim.main
slot_0_44_33 = slot_0_36_8.antiaim.state
slot_0_45_32 = slot_0_36_8.antiaim.settings
slot_0_46_34 = slot_0_36_8.antiaim.presets
slot_0_47_37 = slot_0_36_8.antiaim.recorder

slot_0_13_0.add("##ANTIAIM_MAIN", slot_0_43_31, "AA")
slot_0_13_0.add("##ANTIAIM_STATE", slot_0_44_33, "AA")
slot_0_13_0.add("##ANTIAIM_SETTINGS", slot_0_45_32, "AA")

slot_0_42_25.enabled = slot_0_43_31:switch("Enabled")
slot_0_42_25.mode = slot_0_43_31:list("##MODE", {
	"Main",
	"Settings",
	"Presets"
})
slot_0_48_41 = {}
slot_0_49_43 = {
	unpack(slot_0_20_0.states, 0)
}
slot_0_50_46 = {}
slot_0_48_41.state = slot_0_44_33:combo("State", slot_0_49_43)
slot_0_51_47 = nil

function slot_0_52_41(arg_102_0)
	slot_0_36_8.info:visibility(arg_102_0)
end

function slot_0_53_40(arg_103_0)
	local var_103_0 = slot_0_48_41.state:get()

	slot_0_48_41.state:visibility(arg_103_0)

	local var_103_1 = false

	for iter_103_0 = 1, #slot_0_49_43 do
		local var_103_2 = slot_0_49_43[iter_103_0]
		local var_103_3 = slot_0_48_41[var_103_2]
		local var_103_4 = slot_0_50_46[var_103_2]
		local var_103_5 = arg_103_0 and var_103_2 == var_103_0

		if var_103_3 ~= nil and var_103_3.enabled ~= nil then
			var_103_3.enabled:visibility(var_103_5)

			var_103_5 = var_103_5 and var_103_3.enabled:get()
		end

		if var_103_3.bomb_e_fix ~= nil then
			var_103_3.bomb_e_fix:visibility(var_103_5)
		end

		local var_103_6 = var_103_3.mode:get()

		var_103_3.mode:visibility(var_103_5)

		local var_103_7 = var_103_6 == "Builder"
		local var_103_8 = var_103_6 == "Recorder"

		if var_103_4 ~= nil then
			if var_103_4.angles ~= nil then
				var_103_4.angles:visibility(var_103_7 and var_103_5)
			end

			if var_103_4.defensive ~= nil then
				var_103_4.defensive:visibility(var_103_7 and var_103_5)
			end

			if var_103_4.recorder ~= nil then
				var_103_4.recorder:visibility(var_103_8 and var_103_5)
			end
		end

		if var_103_8 and var_103_5 then
			var_103_1 = true
		end
	end

	slot_0_47_37:visibility(var_103_1)
end

function slot_0_54_43(arg_104_0)
	slot_0_46_34:visibility(arg_104_0)
end

function slot_0_55_46(arg_105_0)
	slot_0_45_32:visibility(arg_105_0)
end

function slot_0_56_43(arg_106_0)
	local var_106_0 = slot_0_42_25.mode:get()
	local var_106_1 = slot_0_42_25.enabled:get()
	local var_106_2 = var_106_0 == 1
	local var_106_3 = var_106_0 == 2
	local var_106_4 = var_106_0 == 3

	slot_0_42_25.enabled:visibility(arg_106_0)
	slot_0_42_25.mode:visibility(arg_106_0 and var_106_1)
	slot_0_52_41(not arg_106_0 or not var_106_1)
	slot_0_53_40(arg_106_0 and var_106_1 and var_106_2)
	slot_0_55_46(arg_106_0 and var_106_1 and var_106_3)
	slot_0_54_43(arg_106_0 and var_106_1 and var_106_4)
end

function slot_0_51_46()
	local var_107_0 = slot_0_38_14:get()

	slot_0_56_43(var_107_0 == 1)
end

function slot_0_52_40(arg_108_0, arg_108_1, arg_108_2)
	slot_108_3_0 = {
		"Off",
		"Offset",
		"Center",
		"Skitter",
		"Custom Ways",
		"Spin",
		"Random",
		"Angelic"
	}
	slot_108_4_0 = {
		"Off",
		"Left",
		"Right",
		"Jitter",
		"Random"
	}
	slot_108_5_0 = {
		"Left",
		"Right",
		"Forward",
		"Forward-Left",
		"Forward-Right",
		"Backward",
		"Backward-Left",
		"Backward-Right"
	}

	function slot_108_6_0(arg_109_0)
		return arg_109_0 > 0 and arg_109_0 .. "%" or "Off"
	end

	function slot_108_7_0(arg_110_0)
		return arg_110_0 > 1 and arg_110_0 .. "t" or "Off"
	end

	function slot_108_8_0(arg_111_0)
		return arg_111_0 > 0 and arg_111_0 .. "t" or "Off"
	end

	if arg_108_0 == "Move & Crouching" then
		arg_108_2.direction = arg_108_1:combo(slot_0_26_4("Direction"), {
			"General",
			unpack(slot_108_5_0)
		})
	end

	arg_108_2.yaw_offset = arg_108_1:slider("Offset", -90, 90, 0, nil, "°")
	arg_108_2.add_yaw = arg_108_1:switch("Add Yaw")
	arg_108_2.yaw_left = arg_108_1:slider(slot_0_26_4("${~}   Left##YAW"), -90, 90, 0, nil, "°")
	arg_108_2.yaw_right = arg_108_1:slider(slot_0_26_4("${~}   Right##YAW"), -90, 90, 0, nil, "°")

	if arg_108_0 == "Move & Crouching" then
		for iter_108_0 = 1, #slot_108_5_0 do
			slot_108_13_2 = slot_108_5_0[iter_108_0]
			arg_108_2[slot_108_13_2] = {
				enabled = arg_108_1:switch(slot_0_26_4("${~}   Enabled##YAW_") .. slot_108_13_2),
				yaw_offset = arg_108_1:slider(slot_0_26_4("${~}   Offset##YAW_") .. slot_108_13_2, -90, 90, 0, nil, "°"),
				yaw_left = arg_108_1:slider(slot_0_26_4("${~}   Left##YAW_") .. slot_108_13_2, -90, 90, 0, nil, "°"),
				yaw_right = arg_108_1:slider(slot_0_26_4("${~}   Right##YAW_") .. slot_108_13_2, -90, 90, 0, nil, "°")
			}
		end
	end

	slot_108_9_3 = nil

	function slot_108_10_3()
		local var_112_0 = arg_108_2.add_yaw:get()
		local var_112_1 = "General"

		if arg_108_2.direction ~= nil then
			var_112_1 = arg_108_2.direction:get()
		end

		local var_112_2 = var_112_1 == "General"

		arg_108_2.yaw_offset:visibility(var_112_2)
		arg_108_2.yaw_left:visibility(var_112_2 and var_112_0)
		arg_108_2.yaw_right:visibility(var_112_2 and var_112_0)

		for iter_112_0 = 1, #slot_108_5_0 do
			local var_112_3 = slot_108_5_0[iter_112_0]
			local var_112_4 = arg_108_2[var_112_3]

			if var_112_4 ~= nil then
				local var_112_5 = var_112_1 == var_112_3

				var_112_4.enabled:visibility(var_112_5)

				if not var_112_4.enabled:get() then
					var_112_5 = false
				end

				var_112_4.yaw_offset:visibility(var_112_5)
				var_112_4.yaw_left:visibility(var_112_5 and var_112_0)
				var_112_4.yaw_right:visibility(var_112_5 and var_112_0)
			end
		end
	end

	arg_108_2.add_yaw:set_callback(slot_108_10_3)

	if arg_108_2.direction ~= nil then
		arg_108_2.direction:set_callback(slot_108_10_3)

		for iter_108_1 = 1, #slot_108_5_0 do
			slot_108_16_0 = arg_108_2[slot_108_5_0[iter_108_1]]

			if slot_108_16_0 ~= nil then
				slot_108_16_0.enabled:set_callback(slot_108_10_3)
			end
		end
	end

	slot_108_10_3()

	arg_108_2.yaw_jitter = arg_108_1:combo("Jitter", slot_108_3_0)
	slot_108_9_2 = arg_108_2.yaw_jitter:create()
	arg_108_2.jitter_offset = arg_108_1:slider(slot_0_26_4("${~}   Degree"), -90, 90, 0, nil, "°")
	arg_108_2.way_count = slot_108_9_2:slider("Count", 3, 5, 3)
	arg_108_2.way_values = {}

	for iter_108_2 = 1, 5 do
		arg_108_2.way_values[iter_108_2] = slot_108_9_2:slider("Way " .. iter_108_2, -90, 90, 0, nil, "°")
	end

	slot_108_10_2 = nil

	function slot_108_11_2(arg_113_0)
		local var_113_0 = arg_113_0:get()

		for iter_113_0 = 1, #arg_108_2.way_values do
			arg_108_2.way_values[iter_113_0]:visibility(iter_113_0 <= var_113_0)
		end
	end

	function slot_108_12_1(arg_114_0)
		local var_114_0 = arg_114_0:get()
		local var_114_1 = var_114_0 == "Off"
		local var_114_2 = not var_114_1 and var_114_0 ~= "Custom Ways"
		local var_114_3 = not var_114_1 and var_114_0 == "Custom Ways"

		arg_108_2.jitter_offset:visibility(var_114_2)
		arg_108_2.way_count:visibility(var_114_3)

		if var_114_3 then
			arg_108_2.way_count:set_callback(slot_108_11_2, true)
		else
			arg_108_2.way_count:unset_callback(slot_108_11_2)
		end

		if not var_114_3 then
			for iter_114_0 = 1, #arg_108_2.way_values do
				arg_108_2.way_values[iter_114_0]:visibility(false)
			end
		end
	end

	arg_108_2.yaw_jitter:set_callback(slot_108_12_1, true)

	arg_108_2.body_yaw = arg_108_1:combo("Body Yaw", slot_108_4_0)
	slot_108_9_1 = arg_108_2.body_yaw:create()
	arg_108_2.invert_chance = slot_108_9_1:slider("Invert Chance", 1, 100, 100, nil, "%")
	arg_108_2.avoid_overlap = slot_108_9_1:switch("Avoid overlap")
	arg_108_2.freestanding_body_yaw = slot_108_9_1:combo("Freestanding", {
		"Off",
		"Peek Fake",
		"Peek Real"
	})
	arg_108_2.left_limit = arg_108_1:slider(slot_0_26_4("${~}   Left##BODY_YAW"), 0, 60, 60, nil, "°")
	arg_108_2.right_limit = arg_108_1:slider(slot_0_26_4("${~}   Right##BODY_YAW"), 0, 60, 60, nil, "°")
	slot_108_10_1 = nil

	function slot_108_11_1(arg_115_0)
		local var_115_0 = arg_115_0:get()
		local var_115_1 = var_115_0 == "Left"
		local var_115_2 = var_115_0 == "Right"
		local var_115_3 = var_115_0 == "Jitter"
		local var_115_4 = var_115_0 == "Random"

		arg_108_2.invert_chance:visibility(var_115_3)
		arg_108_2.left_limit:visibility(var_115_1 or var_115_3 or var_115_4)
		arg_108_2.right_limit:visibility(var_115_2 or var_115_3 or var_115_4)
	end

	arg_108_2.body_yaw:set_callback(slot_108_11_1, true)

	arg_108_2.random = arg_108_1:slider("Randomization", 0, 100, 0, nil, slot_108_6_0)
	arg_108_2.delay = arg_108_1:switch("Delay")
	slot_108_9_0 = arg_108_2.delay:create()
	arg_108_2.delay_affect_modifier = slot_108_9_0:switch("Affect Modifier")
	arg_108_2.delay_mode = slot_108_9_0:combo("Mode", {
		"Default",
		"Custom"
	})
	arg_108_2.delay_value = slot_108_9_0:slider("Ticks", 2, 14, 1, nil, "t")
	arg_108_2.delay_random = slot_108_9_0:slider("Random ticks", 0, 14, 0, nil, slot_108_8_0)
	arg_108_2.delay_count = slot_108_9_0:slider("Count", 2, 8, 2)
	arg_108_2.delay_values = {}

	for iter_108_3 = 1, 8 do
		arg_108_2.delay_values[iter_108_3] = slot_108_9_0:slider("Slider " .. iter_108_3, 1, 14, 1, nil, "t")
	end

	slot_108_10_0 = nil

	function slot_108_11_0(arg_116_0)
		local var_116_0 = arg_116_0:get()

		for iter_116_0 = 1, 8 do
			arg_108_2.delay_values[iter_116_0]:visibility(iter_116_0 <= var_116_0)
		end
	end

	function slot_108_12_0(arg_117_0)
		local var_117_0 = arg_117_0:get()
		local var_117_1 = var_117_0 == "Default"
		local var_117_2 = var_117_0 == "Custom"

		arg_108_2.delay_value:visibility(var_117_1)
		arg_108_2.delay_random:visibility(var_117_1)
		arg_108_2.delay_count:visibility(var_117_2)

		if var_117_2 then
			arg_108_2.delay_count:set_callback(slot_108_11_0, true)
		else
			arg_108_2.delay_count:unset_callback(slot_108_11_0)
		end

		if not var_117_2 then
			for iter_117_0 = 1, 8 do
				arg_108_2.delay_values[iter_117_0]:visibility(false)
			end
		end
	end

	arg_108_2.delay_mode:set_callback(slot_108_12_0, true)

	return arg_108_2
end

function slot_0_53_39(arg_118_0, arg_118_1, arg_118_2)
	slot_118_3_0 = {
		"Off",
		"Static",
		"Jitter",
		"Spin",
		"Random",
		"Angelic"
	}
	slot_118_4_0 = {
		"Off",
		"Static",
		"Spin",
		"Random",
		"Left/Right",
		"Side-Based"
	}
	slot_118_5_0 = {
		"Off",
		"Offset",
		"Center",
		"Skitter"
	}

	function slot_118_6_0(arg_119_0)
		return arg_119_0 > 0 and arg_119_0 .. "t" or "Off"
	end

	arg_118_2.force_break_lc = arg_118_1:switch("Force Break LC")
	slot_118_7_3 = arg_118_2.force_break_lc:create()
	arg_118_2.tickbase = slot_118_7_3:combo("Tickbase", {
		"Default",
		"Ticks",
		"Random"
	})
	arg_118_2.tickbase_ticks = slot_118_7_3:slider("Ticks", 2, 22, 15, nil, "t")
	arg_118_2.tickbase_min = slot_118_7_3:slider("Min. Ticks", 2, 22, 15, nil, "t")
	arg_118_2.tickbase_max = slot_118_7_3:slider("Max. Ticks", 2, 22, 15, nil, "t")
	slot_118_8_3 = nil

	function slot_118_9_2(arg_120_0)
		local var_120_0 = arg_120_0:get()
		local var_120_1 = var_120_0 == "Ticks"
		local var_120_2 = var_120_0 == "Random"

		arg_118_2.tickbase_ticks:visibility(var_120_1)
		arg_118_2.tickbase_min:visibility(var_120_2)
		arg_118_2.tickbase_max:visibility(var_120_2)
	end

	arg_118_2.tickbase:set_callback(slot_118_9_2, true)

	arg_118_2.enabled = arg_118_1:switch("Defensive AA")
	arg_118_2.pitch = arg_118_1:combo("Pitch", slot_118_3_0)
	arg_118_2.pitch_offset_1 = arg_118_1:slider(slot_0_26_4("${~}   Angle 1##PITCH"), -89, 89, 0, nil, "°")
	arg_118_2.pitch_offset_2 = arg_118_1:slider(slot_0_26_4("${~}   Angle 2##PITCH"), -89, 89, 0, nil, "°")
	arg_118_2.pitch_speed = arg_118_1:slider(slot_0_26_4("${~}   Speed##PITCH"), -50, 50, 20, 0.1)
	arg_118_2.yaw = arg_118_1:combo("Yaw", slot_118_4_0)
	arg_118_2.yaw_left = arg_118_1:slider(slot_0_26_4("${~}   Yaw Left##YAW"), -180, 180, 0, nil, "°")
	arg_118_2.yaw_right = arg_118_1:slider(slot_0_26_4("${~}   Yaw Right##YAW"), -180, 180, 0, nil, "°")
	arg_118_2.yaw_offset = arg_118_1:slider(slot_0_26_4("${~}   Yaw Offset##YAW"), 0, 360, 0, nil, "°")
	arg_118_2.yaw_speed = arg_118_1:slider(slot_0_26_4("${~}   Yaw Speed##YAW"), -50, 50, 20, 0.1)
	arg_118_2.yaw_modifier = arg_118_1:combo(slot_0_26_4("${~}   Modifier##MOD"), slot_118_5_0)
	arg_118_2.modifier_offset = arg_118_1:slider(slot_0_26_4("${~}   Degree##MOD"), -180, 180, 0, nil, "°")
	arg_118_2.delay = arg_118_1:switch(slot_0_26_4("${~}   Delay##MOD"))
	slot_118_7_2 = arg_118_2.delay:create()
	arg_118_2.delay_affect_modifier = slot_118_7_2:switch("Affect Modifier")
	arg_118_2.delay_mode = slot_118_7_2:combo("Mode", {
		"Default",
		"Custom"
	})
	arg_118_2.delay_value = slot_118_7_2:slider("Ticks", 2, 14, 1, nil, "t")
	arg_118_2.delay_random = slot_118_7_2:slider("Random ticks", 0, 14, 0, nil, slot_118_6_0)
	arg_118_2.delay_count = slot_118_7_2:slider("Count", 2, 8, 2)
	arg_118_2.delay_values = {}

	for iter_118_0 = 1, 8 do
		arg_118_2.delay_values[iter_118_0] = slot_118_7_2:slider("Slider " .. iter_118_0, 1, 14, 1, nil, "t")
	end

	slot_118_8_2 = nil

	function slot_118_9_1(arg_121_0)
		local var_121_0 = arg_121_0:get()

		for iter_121_0 = 1, 8 do
			arg_118_2.delay_values[iter_121_0]:visibility(iter_121_0 <= var_121_0)
		end
	end

	function slot_118_10_1(arg_122_0)
		local var_122_0 = arg_122_0:get()
		local var_122_1 = var_122_0 == "Default"
		local var_122_2 = var_122_0 == "Custom"

		arg_118_2.delay_value:visibility(var_122_1)
		arg_118_2.delay_random:visibility(var_122_1)
		arg_118_2.delay_count:visibility(var_122_2)

		if var_122_2 then
			arg_118_2.delay_count:set_callback(slot_118_9_1, true)
		else
			arg_118_2.delay_count:unset_callback(slot_118_9_1)
		end

		if not var_122_2 then
			for iter_122_0 = 1, 8 do
				arg_118_2.delay_values[iter_122_0]:visibility(false)
			end
		end
	end

	arg_118_2.delay_mode:set_callback(slot_118_10_1, true)

	arg_118_2.force_target_yaw = arg_118_1:switch("Force Target Yaw")
	slot_118_7_1 = nil

	function slot_118_8_1(arg_123_0)
		local var_123_0 = arg_123_0:get()
		local var_123_1 = var_123_0 == "Off"
		local var_123_2 = var_123_0 == "Static"
		local var_123_3

		var_123_3 = var_123_0 == "Jitter"

		local var_123_4

		var_123_4 = var_123_0 == "Random"

		local var_123_5 = var_123_0 == "Spin"
		local var_123_6 = var_123_0 == "Angelic"
		local var_123_7 = not var_123_1
		local var_123_8 = not var_123_1 and not var_123_2
		local var_123_9 = var_123_5

		if var_123_6 then
			var_123_7 = false
			var_123_8 = false
			var_123_9 = false
		end

		arg_118_2.pitch_offset_1:visibility(var_123_7)
		arg_118_2.pitch_offset_2:visibility(var_123_8)
		arg_118_2.pitch_speed:visibility(var_123_9)
	end

	function slot_118_9_0(arg_124_0)
		local var_124_0 = arg_124_0:get() ~= "Off"

		arg_118_2.modifier_offset:visibility(var_124_0)
		arg_118_2.delay:visibility(var_124_0)
	end

	function slot_118_10_0(arg_125_0)
		local var_125_0 = arg_125_0:get()
		local var_125_1 = var_125_0 == "Off"
		local var_125_2 = var_125_0 == "Spin"
		local var_125_3 = var_125_0 == "Left/Right"
		local var_125_4 = var_125_0 == "Side-Based"
		local var_125_5 = var_125_2 or var_125_4
		local var_125_6 = var_125_2
		local var_125_7 = var_125_3

		arg_118_2.yaw_left:visibility(var_125_7)
		arg_118_2.yaw_right:visibility(var_125_7)
		arg_118_2.yaw_offset:visibility(var_125_5)
		arg_118_2.yaw_speed:visibility(var_125_6)
		arg_118_2.yaw_modifier:visibility(not var_125_1)

		if not var_125_1 then
			arg_118_2.yaw_modifier:set_callback(slot_118_9_0, true)
		else
			arg_118_2.yaw_modifier:unset_callback(slot_118_9_0)
		end

		if var_125_1 then
			arg_118_2.modifier_offset:visibility(false)
			arg_118_2.delay:visibility(false)
		end
	end

	function slot_118_11_0(arg_126_0)
		local var_126_0 = arg_126_0:get()

		if not var_126_0 then
			arg_118_2.pitch_offset_1:visibility(false)
			arg_118_2.pitch_offset_2:visibility(false)
			arg_118_2.pitch_speed:visibility(false)
			arg_118_2.yaw_left:visibility(false)
			arg_118_2.yaw_right:visibility(false)
			arg_118_2.yaw_offset:visibility(false)
			arg_118_2.yaw_speed:visibility(false)
			arg_118_2.yaw_modifier:visibility(false)
			arg_118_2.modifier_offset:visibility(false)
			arg_118_2.delay:visibility(false)
		end

		if var_126_0 then
			arg_118_2.pitch:set_callback(slot_118_8_1, true)
			arg_118_2.yaw:set_callback(slot_118_10_0, true)
		else
			arg_118_2.pitch:unset_callback(slot_118_8_1)
			arg_118_2.yaw:unset_callback(slot_118_10_0)
			arg_118_2.yaw_modifier:unset_callback(slot_118_9_0)
		end

		arg_118_2.pitch:visibility(var_126_0)
		arg_118_2.yaw:visibility(var_126_0)
		arg_118_2.force_target_yaw:visibility(var_126_0)
	end

	arg_118_2.enabled:set_callback(slot_118_11_0, true)

	arg_118_2.flick_enabled = arg_118_1:switch("Defensive Flick")
	arg_118_2.flick_mode = arg_118_1:combo("Mode", {
		"Default",
		"Silent"
	})
	arg_118_2.flick_pitch = arg_118_1:slider("Pitch", -89, 89, 0)
	arg_118_2.flick_yaw = arg_118_1:slider("Yaw", 0, 180, 120)
	arg_118_2.flick_yaw_random = arg_118_2.flick_yaw:create():slider("Yaw Random", 0, 180, 0)
	arg_118_2.flick_limit = arg_118_1:slider("Limit", 0, 60, 60)
	arg_118_2.flick_speed = arg_118_1:slider("Speed", 2, 10, 7)
	arg_118_2.flick_speed_random = arg_118_2.flick_speed:create():slider("Speed Random", 0, 8, 0)
	slot_118_7_0 = nil

	function slot_118_8_0(arg_127_0)
		local var_127_0 = arg_127_0:get()

		arg_118_2.flick_mode:visibility(var_127_0)
		arg_118_2.flick_pitch:visibility(var_127_0)
		arg_118_2.flick_yaw:visibility(var_127_0)
		arg_118_2.flick_limit:visibility(var_127_0)
		arg_118_2.flick_speed:visibility(var_127_0)
	end

	arg_118_2.flick_enabled:set_callback(slot_118_8_0, true)

	return arg_118_2
end

function slot_0_54_42(arg_128_0, arg_128_1, arg_128_2)
	arg_128_2.record = arg_128_1:value("record", "[]")
	arg_128_2.inverse_inverter = arg_128_1:switch("Inverse Inverter")

	return arg_128_2
end

for iter_0_0 = 1, #slot_0_49_43 do
	slot_0_59_32 = slot_0_49_43[iter_0_0]
	slot_0_60_25 = string.format("##ANGLES_%s", slot_0_59_32)
	slot_0_61_19 = string.format("##DEFENSIVE_%s", slot_0_59_32)
	slot_0_62_13 = string.format("##RECORDER_%s", slot_0_59_32)
	slot_0_63_12 = slot_0_11_0.create("~", slot_0_60_25, slot_0_25_3)
	slot_0_64_9 = slot_0_11_0.create("~", slot_0_61_19, slot_0_25_3)
	slot_0_65_9 = slot_0_11_0.create("~", slot_0_62_13, slot_0_25_3)

	function slot_0_66_9(arg_129_0)
		local var_129_0 = string.format("##%s", slot_0_59_32)
		local var_129_1, var_129_2 = string.find(arg_129_0[2], "##")

		if var_129_2 ~= nil then
			var_129_0 = var_129_0 .. string.sub(arg_129_0[2], var_129_2 + 1)
		end

		arg_129_0[2] = arg_129_0[2] .. var_129_0
	end

	slot_0_67_9 = {}

	slot_0_44_33:set_callback(slot_0_66_9)
	slot_0_63_12:set_callback(slot_0_66_9)
	slot_0_64_9:set_callback(slot_0_66_9)
	slot_0_65_9:set_callback(slot_0_66_9)

	slot_0_67_9.mode = slot_0_44_33:combo("Mode", {
		"Builder",
		"Recorder"
	})

	slot_0_67_9.mode:set_callback(slot_0_51_46)

	if slot_0_59_32 ~= "Shared" then
		slot_0_44_33:set_flag(slot_0_11_0.group_flags.callbacks, false)

		slot_0_67_9.enabled = slot_0_44_33:switch(string.format("\a{Link Active}Allow %s", slot_0_59_32:lower()))

		slot_0_44_33:set_flag(slot_0_11_0.group_flags.callbacks, true)
		slot_0_67_9.enabled:set_callback(slot_0_51_46)
	end

	if slot_0_59_32 == "On use" then
		slot_0_67_9.bomb_e_fix = slot_0_44_33:switch("Bomb E Fix")
	end

	slot_0_67_9.angles = slot_0_52_40(slot_0_59_32, slot_0_63_12, {})

	if slot_0_59_32 ~= "Fakelag" then
		slot_0_67_9.defensive = slot_0_53_39(slot_0_59_32, slot_0_64_9, {})
	end

	slot_0_67_9.recorder = slot_0_54_42(slot_0_59_32, slot_0_65_9, {})

	slot_0_44_33:unset_callback(slot_0_66_9)
	slot_0_63_12:unset_callback(slot_0_66_9)
	slot_0_64_9:unset_callback(slot_0_66_9)
	slot_0_65_9:unset_callback(slot_0_66_9)

	slot_0_48_41[slot_0_59_32] = slot_0_67_9
	slot_0_50_46[slot_0_59_32] = {
		angles = slot_0_63_12,
		defensive = slot_0_64_9,
		recorder = slot_0_65_9
	}

	slot_0_13_0.add(slot_0_60_25, slot_0_63_12, "AA")
	slot_0_13_0.add(slot_0_61_19, slot_0_64_9, "AA")
	slot_0_13_0.add(slot_0_62_13, slot_0_65_9, "AA")
end

slot_0_55_45 = nil

slot_0_38_14:set_callback(slot_0_51_46)
slot_0_42_25.enabled:set_callback(slot_0_51_46)
slot_0_42_25.mode:set_callback(slot_0_51_46)
slot_0_48_41.state:set_callback(slot_0_51_46)
slot_0_51_46()

slot_0_42_25.builder = slot_0_48_41
slot_0_42_25.recorder = {
	sequence_list = slot_0_47_37:list("##SEQUENCE_LIST", {}),
	set_start_button = slot_0_47_37:button(slot_0_28_6("Set Start", 52), nil, true),
	set_end_button = slot_0_47_37:button(slot_0_28_6("Set End", 53), nil, true),
	save_button = slot_0_47_37:button(slot_0_28_6("Save", 57), nil, true),
	import_button = slot_0_47_37:button(slot_0_28_6("Import", 53), nil, true)
}
slot_0_50_45 = {
	list = slot_0_46_34:list("##PRESET_LIST", {
		"Empty"
	}),
	name = slot_0_46_34:input("##PRESET_NAME", ""),
	load = slot_0_46_34:button(slot_0_28_6("\a{Link Active}Load", 12), nil, true),
	save = slot_0_46_34:button(slot_0_28_6("Save", 12), nil, true),
	delete = slot_0_46_34:button(slot_0_28_6("\aCD6060FFDelete", 8), nil, true),
	import = slot_0_46_34:button(slot_0_28_6("Import", 19), nil, true),
	export = slot_0_46_34:button(slot_0_28_6("Export", 20), nil, true)
}
slot_0_42_25.presets = slot_0_50_45
slot_0_51_45 = {}
slot_0_52_39 = {}
slot_0_53_38 = {
	"Awp",
	"Auto",
	"Scout",
	"Pistol",
	"Deagle"
}
slot_0_54_41 = {
	"Standing",
	"Running",
	"Slow motion",
	"Air",
	"Air & Crouching",
	"Crouching",
	"Move & Crouching"
}
slot_0_52_39.enabled = slot_0_45_32:switch("Auto Hide Shots")
slot_0_55_44 = slot_0_52_39.enabled:create()
slot_0_52_39.weapons = slot_0_55_44:selectable("Weapons", slot_0_53_38)
slot_0_52_39.states = slot_0_55_44:selectable("States", slot_0_54_41)

slot_0_35_7(slot_0_52_39.weapons)
slot_0_35_7(slot_0_52_39.states, {
	"Slow motion",
	"Crouching",
	"Move & Crouching"
})
slot_0_22_0.push(2, slot_0_52_39.enabled)

slot_0_51_45.auto_hide_shots = slot_0_52_39
slot_0_53_37 = {
	enabled = slot_0_45_32:switch("Anti-Bruteforce")
}
slot_0_54_40 = slot_0_53_37.enabled:create()
slot_0_53_37.refresh_modifier = slot_0_54_40:combo("Refresh Modifier", {
	"Off",
	"Adaptive",
	"Increase",
	"Decrease"
})
slot_0_53_37.refresh_offset = slot_0_54_40:switch("Refresh Offset")
slot_0_53_37.enforce_delay = slot_0_54_40:switch("Enforce Delay Period")
slot_0_53_37.duration = slot_0_54_40:slider("Duration", 0, 100, 0, 0.1, function(arg_130_0)
	return arg_130_0 == 0 and "Inf." or arg_130_0 * 0.1 .. "s"
end)

slot_0_22_0.push(2, slot_0_53_37.enabled)

slot_0_51_45.antibrute = slot_0_53_37
slot_0_54_39 = {
	enabled = slot_0_45_32:switch("Safe Head")
}
slot_0_54_39.states = slot_0_54_39.enabled:create():selectable("Safe Head", {
	"Standing",
	"Crouch",
	"Air Crouch Knife",
	"Distance"
})

slot_0_35_7(slot_0_54_39.states)
slot_0_22_0.push(2, slot_0_54_39.enabled)

slot_0_51_45.safe_head = slot_0_54_39
slot_0_55_43 = {
	select = slot_0_45_32:combo("Manual Yaw", {
		"Off",
		"Left",
		"Right",
		"Backward",
		"Forward"
	})
}
slot_0_56_42 = slot_0_55_43.select:create()
slot_0_55_43.disable_yaw_modifiers = slot_0_56_42:switch("Disable Yaw Modifiers")
slot_0_55_43.body_freestanding = slot_0_56_42:switch("Body Freestanding")
slot_0_51_45.manual_yaw = slot_0_55_43
slot_0_56_41 = {
	select = slot_0_45_32:selectable("Disablers", {
		"On Warmup",
		"Enemies Dead"
	})
}
slot_0_51_45.disablers = slot_0_56_41
slot_0_57_38 = {
	enabled = slot_0_45_32:switch("Freestanding")
}
slot_0_58_37 = slot_0_57_38.enabled:create()
slot_0_57_38.disablers = slot_0_58_37:selectable("Disablers", {
	"Standing",
	"Running",
	"Slow motion",
	"Crouching",
	"Air"
})
slot_0_57_38.disable_yaw_modifiers = slot_0_58_37:switch("Disable Yaw Modifiers")
slot_0_57_38.body_freestanding = slot_0_58_37:switch("Body Freestanding")
slot_0_51_45.freestanding = slot_0_57_38
slot_0_58_36 = {
	enabled = slot_0_45_32:switch("Edge Yaw")
}
slot_0_51_45.edge_yaw = slot_0_58_36
slot_0_59_31 = {
	enabled = slot_0_45_32:switch("Invert Flick")
}
slot_0_51_45.invert_flick = slot_0_59_31
slot_0_60_24 = {
	value = slot_0_45_32:slider("Roll", -45, 45, 0, nil, "°")
}
slot_0_61_18 = slot_0_60_24.value:create()
slot_0_60_24.change_on_fakelag = slot_0_61_18:switch("Change on Fakelag")
slot_0_60_24.fakelag_value = slot_0_61_18:slider("Fakelag Roll", -45, 45, 0, nil, "°")
slot_0_62_12 = nil

function slot_0_63_11(arg_131_0)
	slot_0_60_24.fakelag_value:visibility(arg_131_0:get())
end

slot_0_60_24.change_on_fakelag:set_callback(slot_0_63_11, true)
slot_0_22_0.push(2, slot_0_60_24.value, 0)

slot_0_51_45.roll = slot_0_60_24
slot_0_42_25.settings = slot_0_51_45
slot_0_23_0.antiaim = slot_0_42_25
slot_0_43_30 = {}
slot_0_44_32 = slot_0_36_8.ragebot

slot_0_13_0.add("##RAGEBOT", slot_0_44_32, "AA")

slot_0_45_31 = {}
slot_0_46_33 = {
	"Higher than you",
	"Lower than you",
	"Lethal",
	"After X misses",
	"HP lower than X"
}
slot_0_45_31.enabled = slot_0_44_32:switch("Aimtools")
slot_0_47_36 = slot_0_11_0.cast(slot_0_45_31.enabled:create())
slot_0_45_31.flag = slot_0_47_36:switch("Draw Flags")
slot_0_45_31.weapon = slot_0_47_36:combo("Weapon", slot_0_20_0.aimtools)
slot_0_48_40 = nil

function slot_0_49_42(arg_132_0, arg_132_1)
	arg_132_0.conditions:visibility(arg_132_1)
	arg_132_0.max_misses:visibility(arg_132_1 and arg_132_0.conditions:get("After X misses"))
	arg_132_0.lower_hp:visibility(arg_132_1 and arg_132_0.conditions:get("HP lower than X"))
end

function slot_0_50_44(arg_133_0, arg_133_1)
	local var_133_0 = arg_133_0.conditions:get()

	arg_133_0.conditions:visibility(arg_133_1)

	for iter_133_0 = 1, #slot_0_46_33 do
		local var_133_1 = slot_0_46_33[iter_133_0]
		local var_133_2 = arg_133_0[var_133_1]

		if var_133_2 == nil then
			-- block empty
		else
			local var_133_3 = arg_133_1 and var_133_0 == var_133_1

			var_133_2.enabled:visibility(var_133_3)

			if not var_133_2.enabled:get() then
				var_133_3 = false
			end

			if var_133_2.max_misses ~= nil then
				var_133_2.max_misses:visibility(var_133_3)
			end

			if var_133_2.lower_hp ~= nil then
				var_133_2.lower_hp:visibility(var_133_3)
			end

			if var_133_2.value ~= nil then
				var_133_2.value:visibility(var_133_3)
			end
		end
	end
end

function slot_0_51_44(arg_134_0, arg_134_1)
	slot_0_49_42(arg_134_0.prefer_body, arg_134_1)
	slot_0_49_42(arg_134_0.force_safe, arg_134_1)
	slot_0_50_44(arg_134_0.hit_chance, arg_134_1)
	slot_0_50_44(arg_134_0.multipoints, arg_134_1)
end

function slot_0_52_38(arg_135_0, arg_135_1)
	local var_135_0 = arg_135_1:get()

	for iter_135_0 = 1, #arg_135_0 do
		local var_135_1 = arg_135_0[iter_135_0]
		local var_135_2 = slot_0_45_31[var_135_1]
		local var_135_3 = var_135_1 == var_135_0

		slot_0_51_44(var_135_2, var_135_3)
	end
end

function slot_0_48_39()
	slot_0_52_38(slot_0_20_0.aimtools, slot_0_45_31.weapon)
end

function slot_0_49_41(arg_137_0)
	local var_137_0 = {}

	local function var_137_1(arg_138_0)
		arg_138_0[2] = arg_138_0[2] .. string.format("##%s", arg_137_0)
	end

	slot_0_47_36:set_callback(var_137_1)

	var_137_0.conditions = slot_0_47_36:selectable(arg_137_0, slot_0_46_33)
	var_137_0.max_misses = slot_0_47_36:slider("\tMax Misses", 1, 10, 2)
	var_137_0.lower_hp = slot_0_47_36:slider("\tLower HP", 0, 100, 80)

	var_137_0.conditions:set_callback(slot_0_48_39)
	slot_0_47_36:unset_callback(var_137_1)

	return var_137_0
end

function slot_0_50_43(arg_139_0, arg_139_1, arg_139_2, arg_139_3)
	local var_139_0 = {}

	local function var_139_1(arg_140_0)
		arg_140_0[2] = arg_140_0[2] .. string.format("##%s", arg_139_0)
	end

	slot_0_47_36:set_callback(var_139_1)

	var_139_0.conditions = slot_0_47_36:combo(arg_139_0, slot_0_46_33)

	for iter_139_0 = 1, #slot_0_46_33 do
		local var_139_2 = slot_0_46_33[iter_139_0]

		local function var_139_3(arg_141_0)
			arg_141_0[2] = arg_141_0[2] .. string.format("##%s", var_139_2)
		end

		slot_0_47_36:set_callback(var_139_3)

		local var_139_4 = {
			enabled = slot_0_47_36:switch("\tEnabled")
		}

		if var_139_2 == "After X misses" then
			var_139_4.max_misses = slot_0_47_36:slider("\tMax Misses", 1, 10, 2)
		end

		if var_139_2 == "HP lower than X" then
			var_139_4.lower_hp = slot_0_47_36:slider("\tLower HP", 0, 100, 80)
		end

		var_139_4.value = slot_0_47_36:slider("\tValue", arg_139_1, arg_139_2, arg_139_3)

		slot_0_47_36:unset_callback(var_139_3)
		var_139_4.enabled:set_callback(slot_0_48_39)

		var_139_0[var_139_2] = var_139_4
	end

	slot_0_47_36:unset_callback(var_139_1)
	var_139_0.conditions:set_callback(slot_0_48_39)

	return var_139_0
end

function slot_0_51_43(arg_142_0, arg_142_1)
	arg_142_1.prefer_body = slot_0_49_41("Prefer Body Aim")
	arg_142_1.force_safe = slot_0_49_41("Force Safe Point")
	arg_142_1.hit_chance = slot_0_50_43("Hit Chance", 0, 100, 50)
	arg_142_1.multipoints = slot_0_50_43("Multipoints", 0, 100, 50)

	return arg_142_1
end

for iter_0_1 = 1, #slot_0_20_0.aimtools do
	slot_0_56_40 = slot_0_20_0.aimtools[iter_0_1]

	function slot_0_57_37(arg_143_0)
		local var_143_0 = string.format("##%s", slot_0_56_40)
		local var_143_1, var_143_2 = string.find(arg_143_0[2], "##")

		if var_143_2 ~= nil then
			var_143_0 = var_143_0 .. string.sub(arg_143_0[2], var_143_2 + 1)
		end

		arg_143_0[2] = arg_143_0[2] .. var_143_0
	end

	slot_0_47_36:set_callback(slot_0_57_37)

	slot_0_45_31[slot_0_56_40] = slot_0_51_43(slot_0_56_40, {})

	slot_0_47_36:unset_callback(slot_0_57_37)
end

slot_0_22_0.push(1, slot_0_45_31.enabled)
slot_0_45_31.weapon:set_callback(slot_0_48_39, true)

slot_0_43_30.aimtools = slot_0_45_31
slot_0_46_32 = {
	enabled = slot_0_44_32:switch("AI Peek")
}
slot_0_47_35 = slot_0_46_32.enabled:create()
slot_0_46_32.simulation = slot_0_47_35:slider("Simulation", 25, 35, 28, 0.01, "s")
slot_0_46_32.scan_frequency = slot_0_47_35:slider("Scan Frequency", 0, 30, 2, 0.01, "s")
slot_0_46_32.hit_chance = slot_0_47_35:slider("Hit Chance", 0, 100, 35, nil, function(arg_144_0)
	return arg_144_0 == 0 and "Def." or arg_144_0 .. "%"
end)
slot_0_46_32.weapons = slot_0_47_35:selectable("Weapons", {
	"AutoSnipers",
	"AWP",
	"SSG-08",
	"Pistols",
	"R8 Revolver",
	"Desert Eagle"
})
slot_0_46_32.hitboxes = slot_0_47_35:selectable("Hitboxes", {
	"Head",
	"Chest",
	"Stomach",
	"Arms",
	"Legs"
})
slot_0_46_32.unsafe = slot_0_47_35:switch("Unsafe", false)
slot_0_46_32.color = slot_0_47_35:color_picker("Color", color(200, 0, 0, 255))

slot_0_35_7(slot_0_46_32.weapons)
slot_0_35_7(slot_0_46_32.hitboxes)
slot_0_22_0.push(1, slot_0_46_32.enabled)

slot_0_43_30.ai_peek = slot_0_46_32
slot_0_47_34 = {
	enabled = slot_0_44_32:switch("Logs")
}
slot_0_48_38 = slot_0_47_34.enabled:create()
slot_0_47_34.output = slot_0_48_38:selectable("Output", {
	"Events",
	"Render",
	"Console"
})
slot_0_47_34.hit_color = slot_0_48_38:color_picker("Hit Color", color(163, 211, 80, 255))
slot_0_47_34.miss_color = slot_0_48_38:color_picker("Miss Color", color(240, 191, 86, 255))
slot_0_47_34.background_color = slot_0_48_38:color_picker("Background Color", color(22, 22, 22, 255))
slot_0_47_34.logo = slot_0_48_38:combo("Logo", {
	"Off",
	"!",
	"Icon",
	"Text"
})
slot_0_47_34.glow = slot_0_48_38:slider("Glow", 0, 150, 100, nil, "%")
slot_0_47_34.offset = slot_0_48_38:slider("Offset", 1, 144, 60, 5, "px")
slot_0_47_34.duration = slot_0_48_38:slider("Duration", 1, 8, 5, nil, "s.")
slot_0_49_40 = nil

function slot_0_50_42(arg_145_0)
	local var_145_0 = arg_145_0:get("Render")

	slot_0_47_34.background_color:visibility(var_145_0)
	slot_0_47_34.logo:visibility(var_145_0)
	slot_0_47_34.glow:visibility(var_145_0)
	slot_0_47_34.offset:visibility(var_145_0)
	slot_0_47_34.duration:visibility(var_145_0)
end

slot_0_47_34.output:set_callback(slot_0_50_42, true)

slot_0_43_30.logs = slot_0_47_34
slot_0_48_37 = {
	enabled = slot_0_44_32:switch("Dormant Aimbot")
}
slot_0_49_39 = slot_0_48_37.enabled:create()
slot_0_48_37.hitboxes = slot_0_49_39:selectable("Hitboxes", {
	"Head",
	"Chest",
	"Stomach",
	"Legs"
})
slot_0_48_37.alpha_modifier = slot_0_49_39:slider("Alpha Modifier", 0, 90, 80, nil, "%")
slot_0_48_37.minimum_damage = slot_0_49_39:slider("Minimum Damage", 0, 130, 0, nil, function(arg_146_0)
	if arg_146_0 == 0 then
		return "Def."
	end

	if arg_146_0 > 100 then
		return "+" .. arg_146_0 - 100
	end
end)

slot_0_35_7(slot_0_48_37.hitboxes)
slot_0_22_0.push(1, slot_0_48_37.enabled)

slot_0_43_30.dormant_aimbot = slot_0_48_37
slot_0_49_38 = {
	enabled = slot_0_44_32:switch("Force Shot")
}
slot_0_50_41 = slot_0_49_38.enabled:create()
slot_0_49_38.show_indicator = slot_0_50_41:switch("Show Indicator"):tooltip("Requires 'GameSense Indicators' enabled")

slot_0_22_0.push(1, slot_0_49_38.enabled)
slot_0_22_0.push(1, slot_0_49_38.show_indicator)

slot_0_43_30.force_shot = slot_0_49_38
slot_0_50_40 = nil

function slot_0_51_42(arg_147_0)
	local var_147_0 = arg_147_0:get() == 2

	slot_0_44_32:visibility(var_147_0)
end

slot_0_38_14:set_callback(slot_0_51_42, true)

slot_0_23_0.ragebot = slot_0_43_30
slot_0_44_31 = {}
slot_0_45_30 = slot_0_36_8.visuals

slot_0_13_0.add("##VISUALS", slot_0_45_30, "VISUALS")

slot_0_46_31 = {}
slot_0_47_33 = {
	"5:4",
	"4:3",
	"16:9",
	"16:10"
}
slot_0_48_36 = {
	["16:10"] = 160,
	["16:9"] = 177,
	["4:3"] = 133,
	["5:4"] = 125
}
slot_0_49_37 = {}

for iter_0_2 = 1, #slot_0_47_33 do
	slot_0_54_38 = slot_0_47_33[iter_0_2]
	slot_0_49_37[slot_0_48_36[slot_0_54_38]] = slot_0_54_38
end

slot_0_46_31.enabled = slot_0_45_30:switch("Aspect Ratio")
slot_0_50_39 = slot_0_46_31.enabled:create()
slot_0_46_31.value = slot_0_50_39:slider("##VALUE", 1, 200, 177, 0.01, function(arg_148_0)
	return slot_0_49_37[arg_148_0] or nil
end)

for iter_0_3 = 1, #slot_0_47_33 do
	slot_0_55_41 = slot_0_47_33[iter_0_3]
	slot_0_56_39 = slot_0_48_36[slot_0_55_41]

	function slot_0_57_36()
		slot_0_46_31.value:set(slot_0_56_39)
	end

	slot_0_58_35 = math.ceil(#slot_0_55_41 * 1.34)
	slot_0_59_30 = slot_0_28_6(slot_0_55_41, slot_0_58_35)

	slot_0_50_39:button(slot_0_59_30, slot_0_57_36, true)
end

slot_0_44_31.aspect_ratio = slot_0_46_31
slot_0_47_32 = {
	enabled = slot_0_45_30:switch("Viewmodel")
}
slot_0_48_35 = slot_0_47_32.enabled:create()
slot_0_47_32.fov = slot_0_48_35:slider("FOV", 2000, 17000, 6800, 0.01)
slot_0_47_32.offset_x = slot_0_48_35:slider("X", -2000, 2000, 0, 0.01)
slot_0_47_32.offset_y = slot_0_48_35:slider("Y", -2000, 2000, 0, 0.01)
slot_0_47_32.offset_z = slot_0_48_35:slider("Z", -2000, 2000, 0, 0.01)
slot_0_47_32.opposite_knife_hand = slot_0_48_35:switch("Opposite Knife Hand")
slot_0_44_31.viewmodel = slot_0_47_32
slot_0_48_34 = {
	enabled = slot_0_45_30:switch("Indicators")
}
slot_0_49_36 = slot_0_48_34.enabled:create()
slot_0_48_34.style = slot_0_49_36:list("Style", {
	"Stars",
	"Pixel",
	"りそう"
})
slot_0_48_34.offset = slot_0_49_36:slider("Offset", 0, 200, 32, nil, "px")
slot_0_48_34.accent_color = slot_0_49_36:color_picker("Accent", color(172, 167, 209, 255))
slot_0_48_34.secondary_color = slot_0_49_36:color_picker("Secondary", color(255, 255, 255, 255))
slot_0_50_38 = nil

function slot_0_51_41(arg_150_0)
	slot_0_48_34.offset:visibility(arg_150_0:get() ~= 3)
	slot_0_48_34.accent_color:visibility(arg_150_0:get() ~= 3)
	slot_0_48_34.secondary_color:visibility(arg_150_0:get() ~= 3)
end

slot_0_48_34.style:set_callback(slot_0_51_41, true)

slot_0_44_31.indicators = slot_0_48_34
slot_0_49_35 = {
	enabled = slot_0_45_30:switch("Solus UI")
}
slot_0_50_37 = slot_0_49_35.enabled:create()
slot_0_49_35.color = slot_0_50_37:color_picker("Color", color(172, 167, 209, 50))
slot_0_49_35.select = slot_0_50_37:listable("##SELECT", {
	"Watermark",
	"Spectators",
	"Hotkey List",
	"Anti-aimbot indication",
	"Frequency update information"
})
slot_0_49_35.only_key_state = slot_0_50_37:switch("Only Key State", false)

slot_0_35_7(slot_0_49_35.select)

slot_0_51_40 = nil

function slot_0_52_37(arg_151_0)
	slot_0_49_35.only_key_state:visibility(arg_151_0:get("Hotkey List"))
end

slot_0_49_35.select:set_callback(slot_0_52_37, true)

slot_0_44_31.solus_ui = slot_0_49_35
slot_0_50_36 = {
	enabled = slot_0_45_30:switch("Watermark")
}
slot_0_51_39 = slot_0_50_36.enabled:create()
slot_0_50_36.style = slot_0_51_39:listable("Style", {
	"Branded",
	"Corner"
})
slot_0_50_36.color = slot_0_51_39:color_picker("Color", color(172, 167, 209, 255))

slot_0_35_7(slot_0_50_36.style, {
	"Branded"
})

slot_0_44_31.watermark = slot_0_50_36
slot_0_51_38 = {
	enabled = slot_0_45_30:switch("Manual Arrows")
}
slot_0_52_36 = slot_0_51_38.enabled:create()
slot_0_51_38.style = slot_0_52_36:list("Style", {
	"Invictus",
	"Teamskeet",
	"Modern",
	"Ambani"
})
slot_0_51_38.animate_scope = slot_0_52_36:switch("Animate Scope", true)
slot_0_51_38.dynamic_mode = slot_0_52_36:switch("Dynamic Mode", true)
slot_0_51_38.offset = slot_0_52_36:slider("Offset", 5, 150, 40, nil, "px")
slot_0_51_38.accent_color = slot_0_52_36:color_picker("Accent", color(172, 167, 209, 255))
slot_0_51_38.secondary_color = slot_0_52_36:color_picker("Secondary", color(255, 255, 255, 255))
slot_0_53_35 = nil

function slot_0_54_36(arg_152_0)
	local var_152_0 = arg_152_0:get()

	slot_0_51_38.animate_scope:visibility(var_152_0 == 3)
	slot_0_51_38.dynamic_mode:visibility(var_152_0 == 1 or var_152_0 == 4)
end

slot_0_51_38.style:set_callback(slot_0_54_36, true)

slot_0_44_31.manual_arrows = slot_0_51_38
slot_0_52_35 = {
	enabled = slot_0_45_30:switch("Custom Scope")
}
slot_0_53_34 = slot_0_52_35.enabled:create()
slot_0_52_35.offset = slot_0_53_34:slider("Offset", 0, 500, 10, nil, "px")
slot_0_52_35.position = slot_0_53_34:slider("Position", 0, 500, 105, nil, "px")
slot_0_52_35.thickness = slot_0_53_34:slider("Thickness", 1, 10, 1, nil, "px")
slot_0_52_35.accent_color = slot_0_53_34:color_picker("Accent", color(255, 255, 255, 255))
slot_0_52_35.secondary_color = slot_0_53_34:color_picker("Secondary", color(255, 255, 255, 0))
slot_0_52_35.extra_options = slot_0_53_34:selectable("Extra Options", {
	"Rotate Angle",
	"Dynamic Offset"
})
slot_0_52_35.exclude_lines = slot_0_53_34:selectable("Exclude Lines", {
	"Left",
	"Top",
	"Right",
	"Bottom"
})
slot_0_44_31.custom_scope = slot_0_52_35
slot_0_53_33 = {
	enabled = slot_0_45_30:switch("Damage Indicator")
}
slot_0_54_35 = slot_0_53_33.enabled:create()
slot_0_53_33.if_override = slot_0_54_35:switch("If override")
slot_0_53_33.font = slot_0_54_35:combo("Font", {
	"Default",
	"Alternative"
})
slot_0_53_33.offset = slot_0_54_35:slider("Offset", 2, 8, 2, nil, "px")
slot_0_53_33.active_color = slot_0_54_35:color_picker("Active Color", color(172, 167, 209, 255))
slot_0_53_33.inactive_color = slot_0_54_35:color_picker("Inactive Color", color(255, 255, 255, 100))
slot_0_55_40 = nil

function slot_0_56_38(arg_153_0)
	slot_0_53_33.inactive_color:visibility(not arg_153_0:get())
end

slot_0_53_33.if_override:set_callback(slot_0_56_38, true)

slot_0_44_31.damage_indicator = slot_0_53_33
slot_0_54_34 = {
	enabled = slot_0_45_30:switch("Break LC Indicator")
}

slot_0_22_0.push(1, slot_0_54_34.enabled)

slot_0_44_31.break_lc_indicator = slot_0_54_34
slot_0_55_39 = {
	enabled = slot_0_45_30:switch("Velocity Warning")
}
slot_0_56_37 = slot_0_55_39.enabled:create()
slot_0_55_39.color_accent = slot_0_56_37:color_picker("Accent Color", color(255, 255, 255, 200))
slot_0_55_39.color_secondary = slot_0_56_37:color_picker("Secondary Color", color(150, 150, 150, 255))
slot_0_44_31.velocity_warning = slot_0_55_39
slot_0_56_36 = {
	enabled = slot_0_45_30:switch("Gamesense Indicators")
}
slot_0_57_35 = slot_0_56_36.enabled:create()
slot_0_56_36.spectator_list = slot_0_57_35:switch("Spectator List", true)
slot_0_56_36.feature_list = slot_0_57_35:listable("Indicators", {
	"Hit/Miss",
	"Dormant Aimbot",
	"Damage Override",
	"Hitchance Override",
	"Lag Compensation",
	"Hitbox Override",
	"Fake Latency",
	"Fake Angles",
	"Fake Duck",
	"Body Aim",
	"Safe Points",
	"Freestanding",
	"Bomb Info",
	"Hide Shots",
	"Double Tap"
})

slot_0_35_7(slot_0_56_36.feature_list, {
	"Damage Override",
	"Fake Latency",
	"Fake Duck",
	"Body Aim",
	"Safe Points",
	"Freestanding",
	"Bomb Info",
	"Hide Shots",
	"Double Tap"
})

slot_0_44_31.gamesense_indicators = slot_0_56_36
slot_0_57_34 = {
	enabled = slot_0_45_30:switch("Kibit Markers")
}
slot_0_58_34 = slot_0_57_34.enabled:create()
slot_0_57_34.color_x = slot_0_58_34:color_picker("Color X", color(0, 255, 255))
slot_0_57_34.color_y = slot_0_58_34:color_picker("Color Y", color(0, 255, 0))
slot_0_57_34.speed = slot_0_58_34:slider("Time", 0, 100, 0, 0.1, "s")
slot_0_44_31.kibit_markers = slot_0_57_34
slot_0_58_33 = {
	enabled = slot_0_45_30:switch("Grenade Radius")
}
slot_0_59_29 = slot_0_58_33.enabled:create()
slot_0_58_33.molotov = slot_0_59_29:switch("Molotov", true)
slot_0_58_33.molotov_color = slot_0_58_33.molotov:color_picker(color(245, 90, 90, 255))
slot_0_58_33.smoke = slot_0_59_29:switch("Smoke", true)
slot_0_58_33.smoke_color = slot_0_58_33.smoke:color_picker(color(130, 130, 255, 255))

slot_0_22_0.push(1, slot_0_58_33.enabled)

slot_0_60_23 = nil

function slot_0_61_17(arg_154_0)
	if not arg_154_0:get() and not slot_0_58_33.smoke:get() then
		slot_0_58_33.smoke:set(true)
	end
end

function slot_0_62_11(arg_155_0)
	if not arg_155_0:get() and not slot_0_58_33.molotov:get() then
		slot_0_58_33.molotov:set(true)
	end
end

slot_0_58_33.molotov:set_callback(slot_0_61_17)
slot_0_58_33.smoke:set_callback(slot_0_62_11)

slot_0_44_31.grenade_radius = slot_0_58_33
slot_0_59_28 = {
	label = slot_0_45_30:label("Static Watermark")
}
slot_0_60_22 = slot_0_59_28.label:create()
slot_0_59_28.style = slot_0_60_22:list("Style", {
	"Classic",
	"Modern"
})
slot_0_59_28.position = slot_0_60_22:combo("Position", {
	"Bottom",
	"Left",
	"Right"
})
slot_0_59_28.remove_spaces = slot_0_60_22:switch("Remove Spaces")
slot_0_59_28.color = slot_0_60_22:color_picker("Color", color(142, 165, 229, 255))
slot_0_60_21 = nil

function slot_0_61_16()
	local var_156_0 = slot_0_50_36.enabled:get() or slot_0_48_34.enabled:get()
	local var_156_1 = slot_0_49_35.enabled:get() and slot_0_49_35.select:get("Watermark")

	slot_0_59_28.label:disabled(var_156_0 or var_156_1)
end

slot_0_50_36.enabled:set_callback(slot_0_61_16)
slot_0_48_34.enabled:set_callback(slot_0_61_16)
slot_0_49_35.enabled:set_callback(slot_0_61_16)
slot_0_49_35.select:set_callback(slot_0_61_16)
slot_0_61_16()

slot_0_44_31.static_watermark = slot_0_59_28
slot_0_60_20 = nil

function slot_0_61_15(arg_157_0)
	local var_157_0 = arg_157_0:get() == 3

	slot_0_45_30:visibility(var_157_0)
end

slot_0_38_14:set_callback(slot_0_61_15, true)

slot_0_23_0.visuals = slot_0_44_31
slot_0_45_29 = {}
slot_0_46_30 = slot_0_36_8.misc

slot_0_13_0.add("##MISC", slot_0_46_30, "MISC")

slot_0_47_31 = {
	enabled = slot_0_46_30:switch("Clantag")
}
slot_0_45_29.clantag = slot_0_47_31
slot_0_48_33 = {
	enabled = slot_0_46_30:switch("Trashtalk")
}
slot_0_45_29.trashtalk = slot_0_48_33
slot_0_49_34 = {
	enabled = slot_0_46_30:switch("Fast Ladder")
}

slot_0_22_0.push(2, slot_0_49_34.enabled)

slot_0_45_29.fast_ladder = slot_0_49_34
slot_0_50_35 = {
	enabled = slot_0_46_30:switch("Edge Stop")
}

slot_0_22_0.push(1, slot_0_50_35.enabled)

slot_0_45_29.edge_stop = slot_0_50_35
slot_0_51_37 = {
	enabled = slot_0_46_30:switch("Collision Air Duck")
}

slot_0_22_0.push(1, slot_0_51_37.enabled)

slot_0_45_29.collision_air_duck = slot_0_51_37
slot_0_52_34 = {
	enabled = slot_0_46_30:switch("No Fall Damage")
}

slot_0_22_0.push(2, slot_0_52_34.enabled)

slot_0_45_29.no_fall_damage = slot_0_52_34
slot_0_53_32 = {
	enabled = slot_0_46_30:switch("Super Toss")
}

slot_0_22_0.push(2, slot_0_53_32.enabled)

slot_0_45_29.super_toss = slot_0_53_32
slot_0_54_33 = {
	enabled = slot_0_46_30:switch("Grenade Release")
}
slot_0_55_38 = slot_0_54_33.enabled:create()
slot_0_54_33.damage = slot_0_55_38:slider("Damage", 1, 50, 35, nil, "hp")

slot_0_22_0.push(2, slot_0_54_33.enabled)

slot_0_45_29.grenade_release = slot_0_54_33
slot_0_55_37 = {
	enabled = slot_0_46_30:switch("Fps Optimize")
}
slot_0_56_35 = slot_0_55_37.enabled:create()
slot_0_55_37.always_on = slot_0_56_35:switch("Always on")
slot_0_55_37.detections = slot_0_56_35:selectable("Detections", {
	"Peeking",
	"Hit Flag"
})
slot_0_55_37.select = slot_0_56_35:selectable("Optimizations", {
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
	"Weapon effects",
	"Teammates"
})

slot_0_35_7(slot_0_55_37.detections)
slot_0_35_7(slot_0_55_37.select, {
	"Blood",
	"Decals",
	"Sprites",
	"Ropes",
	"Dynamic lights",
	"Weapon effects"
})

slot_0_57_33 = nil

function slot_0_58_32(arg_158_0)
	slot_0_55_37.detections:visibility(not arg_158_0:get())
end

slot_0_55_37.always_on:set_callback(slot_0_58_32, true)

slot_0_45_29.fps_optimize = slot_0_55_37
slot_0_56_34 = {
	enabled = slot_0_46_30:switch("Ping Unlocker")
}
slot_0_57_32 = slot_0_56_34.enabled:create()
slot_0_56_34.value = slot_0_57_32:slider("Latency", 0, 200, 0, nil, "ms")

slot_0_22_0.push(2, slot_0_56_34.enabled)

slot_0_45_29.ping_unlocker = slot_0_56_34
slot_0_57_31 = {
	enabled = slot_0_46_30:switch("Animation Breaker")
}
slot_0_58_31 = slot_0_57_31.enabled:create()
slot_0_57_31.air_legs = slot_0_58_31:combo("Air Legs", {
	"Disabled",
	"Static",
	"Haram"
})
slot_0_57_31.ground_legs = slot_0_58_31:combo("Ground Legs", {
	"Default",
	"Static",
	"Jitter",
	"Allah",
	"Kangaroo"
})
slot_0_57_31.legs_offset_1 = slot_0_58_31:slider("Offset 1", 0, 100, 100)
slot_0_57_31.legs_offset_2 = slot_0_58_31:slider("Offset 2", 0, 100, 100)
slot_0_57_31.body_lean = slot_0_58_31:slider("Body Lean", -1, 100, -1, nil, function(arg_159_0)
	return arg_159_0 == -1 and "Off" or arg_159_0 .. "%"
end)
slot_0_57_31.pitch_on_land = slot_0_58_31:switch("Pitch on Land", true)

slot_0_22_0.push(2, slot_0_57_31.enabled)

slot_0_59_27 = nil

function slot_0_60_19(arg_160_0)
	local var_160_0 = arg_160_0:get() == "Jitter"

	slot_0_57_31.legs_offset_1:visibility(var_160_0)
	slot_0_57_31.legs_offset_2:visibility(var_160_0)
end

slot_0_57_31.ground_legs:set_callback(slot_0_60_19, true)

slot_0_45_29.animation_breaker = slot_0_57_31
slot_0_58_30 = {
	label = slot_0_46_30:label("Fake Duck")
}
slot_0_59_26 = slot_0_58_30.label:create()
slot_0_58_30.options = slot_0_59_26:selectable("Options", {
	"Unlock Speed",
	"On Freezetime"
})

slot_0_22_0.push(2, slot_0_58_30.label)
slot_0_22_0.push(2, slot_0_58_30.options, {})

slot_0_45_29.fake_duck = slot_0_58_30
slot_0_59_25 = {
	label = slot_0_46_30:label("Nickname Generator")
}
slot_0_60_18 = slot_0_59_25.label:create()
slot_0_59_25.input = slot_0_60_18:input("##INPUT")
slot_0_59_25.set_button = slot_0_60_18:button(slot_0_28_6("Set", 11), nil, false)
slot_0_59_25.generate_button = slot_0_60_18:button(slot_0_28_6("Generate", 5), nil, true)
slot_0_59_25.reset_button = slot_0_60_18:button(slot_0_28_6("Reset", 8), nil, true)
slot_0_45_29.nickname_generator = slot_0_59_25
slot_0_60_17 = nil

function slot_0_61_14(arg_161_0)
	local var_161_0 = arg_161_0:get() == 4

	slot_0_46_30:visibility(var_161_0)
end

slot_0_38_14:set_callback(slot_0_61_14, true)

slot_0_23_0.misc = slot_0_45_29
slot_0_46_29 = nil
slot_0_47_30 = ui.get_icon("sparkles")
slot_0_46_28 = slot_0_11_0.create("~", "##COPYRIGHT", slot_0_25_3):label(slot_0_5_0("\a{Link Active}", slot_0_47_30, slot_0_27_5(4), slot_0_7_0.name, "\aDEFAULT", " — 2026"))
slot_0_24_1 = nil
slot_0_24_0 = {}
slot_0_25_2 = 0
slot_0_26_3 = 0
slot_0_24_0.is_onground = false
slot_0_24_0.is_moving = false
slot_0_24_0.is_crouched = false
slot_0_24_0.is_peeking = false
slot_0_24_0.is_vulnerable = false
slot_0_24_0.velocity2d = 0
slot_0_24_0.duck_amount = 0
slot_0_24_0.team_num = 0
slot_0_24_0.sent_packets = 0
slot_0_24_0.forwardmove = 0
slot_0_24_0.sidemove = 0

function slot_0_27_4(arg_162_0)
	local var_162_0 = false
	local var_162_1 = false
	local var_162_2 = arg_162_0.m_vecVelocity
	local var_162_3 = arg_162_0:get_eye_position()
	local var_162_4 = slot_0_8_0.extrapolate(var_162_3, var_162_2, 14)
	local var_162_5 = entity.get_players(true)
	local var_162_6 = entity.get_threat(true)

	for iter_162_0 = 1, #var_162_5 do
		local var_162_7 = var_162_5[iter_162_0]

		if not var_162_7:is_alive() then
			-- block empty
		elseif var_162_7 == var_162_6 then
			var_162_1 = true
		else
			local var_162_8 = var_162_7:get_hitbox_position(0)
			local var_162_9 = slot_0_8_0.extrapolate(var_162_8, var_162_2, 4)
			local var_162_10 = utils.trace_bullet(arg_162_0, var_162_4, var_162_9)

			if var_162_10 ~= nil and var_162_10 > 0 then
				var_162_0 = true

				break
			end
		end
	end

	return var_162_0, var_162_1
end

function slot_0_28_5(arg_163_0)
	local var_163_0 = entity.get_local_player()

	if var_163_0 == nil then
		return
	end

	local var_163_1, var_163_2 = slot_0_27_4(var_163_0)

	slot_0_25_2 = var_163_0.m_fFlags
	slot_0_24_0.velocity2d = var_163_0.m_vecVelocity:length2d()
	slot_0_24_0.is_peeking = var_163_1
	slot_0_24_0.is_vulnerable = var_163_2

	if arg_163_0.choked_commands == 0 then
		slot_0_24_0.duck_amount = var_163_0.m_flDuckAmount
		slot_0_24_0.sent_packets = slot_0_24_0.sent_packets + 1
	end

	slot_0_24_0.is_moving = slot_0_24_0.velocity2d > 3.63
	slot_0_24_0.is_crouched = slot_0_24_0.duck_amount > 0
	slot_0_24_0.team_num = var_163_0.m_iTeamNum
	slot_0_24_0.forwardmove = arg_163_0.forwardmove
	slot_0_24_0.sidemove = arg_163_0.sidemove
end

function slot_0_29_6(arg_164_0)
	local var_164_0 = entity.get_local_player()

	if var_164_0 == nil then
		return
	end

	slot_0_26_3 = var_164_0.m_fFlags
	slot_0_24_0.is_onground = bit.band(slot_0_25_2, 1) == 1 and bit.band(slot_0_26_3, 1) == 1
end

events.createmove(slot_0_28_5)
events.createmove_run(slot_0_29_6)

slot_0_25_1 = nil
slot_0_25_0 = {}
slot_0_26_2 = nil
slot_0_27_3 = 0
slot_0_25_0.max_defensive_ticks = 0
slot_0_25_0.defensive_ticks = 0
slot_0_25_0.teleport_units_sqr = 0

function slot_0_28_4(arg_165_0)
	local var_165_0 = arg_165_0.m_nTickBase

	if math.abs(var_165_0 - slot_0_27_3) > 64 then
		slot_0_27_3 = 0
	end

	local var_165_1 = 0

	if var_165_0 > slot_0_27_3 then
		slot_0_27_3 = var_165_0
	elseif var_165_0 < slot_0_27_3 then
		var_165_1 = math.min(14, math.max(0, slot_0_27_3 - var_165_0 - 1))
	end

	if var_165_1 > 0 then
		if slot_0_25_0.max_defensive_ticks == 0 then
			slot_0_25_0.max_defensive_ticks = var_165_1
		end

		slot_0_25_0.defensive_ticks = var_165_1
	else
		slot_0_25_0.defensive_ticks = 0
		slot_0_25_0.max_defensive_ticks = 0
	end
end

function slot_0_29_5(arg_166_0, arg_166_1)
	local var_166_0 = (arg_166_1 - arg_166_0):lengthsqr()

	slot_0_25_0.teleport_units_sqr = var_166_0
end

function slot_0_30_4(arg_167_0)
	local var_167_0 = arg_167_0:get_simulation_time()

	if var_167_0 == nil then
		return
	end

	local var_167_1 = arg_167_0.m_vecOrigin

	if slot_0_26_2 ~= nil then
		local var_167_2 = to_ticks(var_167_0.current - var_167_0.old)

		if var_167_2 < 0 or var_167_2 > 0 and var_167_2 <= 64 then
			slot_0_29_5(slot_0_26_2, var_167_1)
		end
	end

	slot_0_26_2 = var_167_1
end

function slot_0_31_6()
	local var_168_0 = entity.get_local_player()

	if var_168_0 == nil then
		return
	end

	slot_0_28_4(var_168_0)
end

function slot_0_32_5()
	local var_169_0 = entity.get_local_player()

	if var_169_0 == nil then
		return
	end

	slot_0_30_4(var_169_0)
end

events.createmove(slot_0_31_6)
events.net_update_start(slot_0_32_5)

slot_0_26_1 = nil
slot_0_26_0 = {}
slot_0_27_2 = nil

function slot_0_28_3()
	if slot_0_24_0.is_onground then
		if slot_0_9_0.antiaim.misc.slow_walk:get() then
			return "Slow motion"
		end

		if not slot_0_24_0.is_moving then
			if slot_0_24_0.is_crouched then
				return "Crouching"
			end

			return "Standing"
		end

		if slot_0_24_0.is_crouched then
			return "Move & Crouching"
		end

		return "Running"
	end

	return slot_0_24_0.is_crouched and "Air & Crouching" or "Air"
end

function slot_0_29_4()
	slot_0_27_2 = slot_0_28_3()
end

function slot_0_26_0.get()
	return slot_0_27_2
end

events.createmove(slot_0_29_4)

slot_0_27_1 = nil
slot_0_27_0 = {}
slot_0_28_2 = slot_0_10_0:new()
slot_0_29_3 = {}

function slot_0_30_3(arg_173_0)
	local var_173_0 = globals.tickcount
	local var_173_1 = arg_173_0:get_eye_position()

	return {
		tick = var_173_0,
		player = arg_173_0,
		eye_pos = var_173_1,
		impacts = {}
	}
end

function slot_0_31_5(arg_174_0)
	local var_174_0 = entity.get(arg_174_0.userid, true)

	if var_174_0 == nil then
		return
	end

	table.insert(slot_0_29_3, slot_0_30_3(var_174_0))
end

function slot_0_32_4(arg_175_0)
	local var_175_0 = entity.get(arg_175_0.userid, true)
	local var_175_1 = entity.get(arg_175_0.attacker, true)

	if var_175_0 == nil or var_175_1 == nil then
		return
	end

	for iter_175_0 = #slot_0_29_3, 1, -1 do
		local var_175_2 = slot_0_29_3[iter_175_0]

		if var_175_2.player == var_175_1 then
			var_175_2.victim = var_175_0
			var_175_2.damage = arg_175_0.dmg_health
			var_175_2.hitgroup = arg_175_0.hitgroup

			break
		end
	end
end

function slot_0_33_6(arg_176_0)
	local var_176_0 = entity.get(arg_176_0.userid, true)

	if var_176_0 == nil then
		return
	end

	for iter_176_0 = #slot_0_29_3, 1, -1 do
		local var_176_1 = slot_0_29_3[iter_176_0]

		if var_176_1.player == var_176_0 then
			local var_176_2 = vector(arg_176_0.x, arg_176_0.y, arg_176_0.z)

			table.insert(var_176_1.impacts, var_176_2)

			break
		end
	end
end

function slot_0_34_6()
	local var_177_0 = entity.get_local_player()

	if var_177_0 == nil then
		return
	end

	local var_177_1

	if var_177_0:is_alive() then
		var_177_1 = var_177_0:get_hitbox_position(0)
	end

	for iter_177_0 = 1, #slot_0_29_3 do
		local var_177_2 = slot_0_29_3[iter_177_0]
		local var_177_3 = #var_177_2.impacts

		if var_177_3 == 0 then
			-- block empty
		else
			local var_177_4 = var_177_2.eye_pos
			local var_177_5 = var_177_2.impacts[var_177_3]

			slot_0_28_2.player_shot:fire({
				tick = var_177_2.tick,
				player = var_177_2.player,
				victim = var_177_2.victim,
				eye_pos = var_177_4,
				end_pos = var_177_5,
				damage = var_177_2.damage,
				hitgroup = var_177_2.hitgroup
			})

			if var_177_1 ~= nil and var_177_2.player ~= nil and var_177_2.player:is_enemy() then
				local var_177_6 = slot_0_8_0.closest_ray_point(var_177_4, var_177_5, var_177_1, true)
				local var_177_7 = var_177_1:distsqr(var_177_6)

				if var_177_7 <= 6400 then
					local var_177_8 = math.sqrt(var_177_7)

					slot_0_28_2.enemy_shot:fire({
						tick = var_177_2.tick,
						distance = var_177_8,
						player = var_177_2.player,
						victim = var_177_2.victim,
						eye_pos = var_177_4,
						end_pos = var_177_5,
						damage = var_177_2.damage,
						hitgroup = var_177_2.hitgroup
					})
				end
			end
		end
	end

	for iter_177_1 = 1, #slot_0_29_3 do
		slot_0_29_3[iter_177_1] = nil
	end
end

function slot_0_27_0.get_event_bus()
	return slot_0_28_2
end

events.weapon_fire(slot_0_31_5)
events.player_hurt(slot_0_32_4)
events.bullet_impact(slot_0_33_6)
events.net_update_start(slot_0_34_6)

slot_0_28_1 = nil
slot_0_28_0 = {}
slot_0_29_2 = "lTZA7O1VkC3wj2YacHuBdMPRE8mtQXpnJKe5Ux9L4SIvNirWohDygszf60FbqG+/="
slot_0_30_2 = ".\\" .. slot_0_7_0.name
slot_0_31_4 = slot_0_30_2 .. "\\db.dat"
slot_0_32_3 = {}

function slot_0_33_5()
	return files.read(slot_0_31_4)
end

function slot_0_34_5(arg_180_0, arg_180_1)
	if arg_180_1 == nil then
		arg_180_1 = false
	end

	return files.write(slot_0_31_4, arg_180_0, arg_180_1)
end

function slot_0_35_6(arg_181_0)
	local var_181_0, var_181_1 = pcall(json.stringify, arg_181_0)

	if not var_181_0 then
		return false, var_181_1
	end

	local var_181_2, var_181_3 = pcall(slot_0_0_0.encode, var_181_1, slot_0_29_2)
	local var_181_4 = var_181_3

	if not var_181_2 then
		return false, var_181_4
	end

	return true, var_181_4
end

function slot_0_36_7(arg_182_0)
	local var_182_0, var_182_1 = pcall(slot_0_0_0.decode, arg_182_0, slot_0_29_2)

	if not var_182_0 then
		return false, var_182_1
	end

	local var_182_2, var_182_3 = pcall(json.parse, var_182_1)
	local var_182_4 = var_182_3

	if not var_182_2 then
		return false, var_182_4
	end

	return true, var_182_4
end

function slot_0_37_10(arg_183_0)
	files.create_folder(slot_0_30_2)

	local var_183_0, var_183_1 = slot_0_35_6(arg_183_0)

	if not var_183_0 then
		slot_0_12_0.error("Unable to encode data")

		return false
	end

	if not slot_0_34_5(var_183_1) then
		slot_0_12_0.error("Unable to write db")

		return false
	end

	return true
end

function slot_0_38_13()
	files.create_folder(slot_0_30_2)

	local var_184_0 = slot_0_33_5()

	if var_184_0 == nil then
		if not slot_0_37_10({}) then
			slot_0_12_0.log("Unable to create db")
		end

		return {}
	end

	local var_184_1, var_184_2 = slot_0_36_7(var_184_0)

	if not var_184_1 then
		slot_0_12_0.error("Unable to decode db")
		slot_0_12_0.log("Trying to flush db")

		if not slot_0_37_10({}) then
			slot_0_12_0.error("Unable to flush db")
		end

		return {}
	end

	return var_184_2
end

slot_0_39_15 = {
	__index = function(arg_185_0, arg_185_1)
		return slot_0_32_3[arg_185_1]
	end,
	__newindex = function(arg_186_0, arg_186_1, arg_186_2)
		slot_0_32_3[arg_186_1] = arg_186_2

		slot_0_37_10(slot_0_32_3)
	end
}
slot_0_32_3 = slot_0_38_13()

setmetatable(slot_0_28_0, slot_0_39_15)

slot_0_29_1 = nil
slot_0_29_0 = {}
slot_0_30_1 = {}

function slot_0_31_3()
	local var_187_0 = ui.get_binds()

	for iter_187_0 in pairs(slot_0_30_1) do
		slot_0_30_1[iter_187_0] = nil
	end

	for iter_187_1 = 1, #var_187_0 do
		local var_187_1 = var_187_0[iter_187_1]
		local var_187_2 = var_187_1.reference:id()

		slot_0_30_1[var_187_2] = var_187_1
	end
end

function slot_0_29_0.get(arg_188_0)
	if arg_188_0 == nil then
		return nil
	end

	return slot_0_30_1[arg_188_0:id()]
end

events.render(slot_0_31_3)

slot_0_30_0 = nil
slot_0_31_2 = slot_0_23_0.links
slot_0_32_2 = nil

function slot_0_33_4()
	panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/BtbuapEw4e")
end

function slot_0_34_4()
	panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://youtube.com/channel/UCT78kJfwruisG8w4u8LOEkQ")
end

function slot_0_35_5()
	panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://en.neverlose.cc/market/item?id=5QrOCS")
end

slot_0_31_2.discord:set_callback(slot_0_33_4)
slot_0_31_2.youtube:set_callback(slot_0_34_4)
slot_0_31_2.config:set_callback(slot_0_35_5)

slot_0_31_1 = nil
slot_0_31_0 = {}
slot_0_32_1 = slot_0_23_0.configs
slot_0_33_3 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/="
slot_0_34_3 = "qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzoeQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBosRpsUCfjfIG9foE7BrUnzsfngov9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfrBr8YgoR0zsfHSVfjqHldBo9Ygob1Br9lSVfjBoMlhSHQ4eldBs92zaf7gr9YgHldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBa92BaM2BHldzIG9fofYgr80zaBYBeldzoElBP7ASVf2BaMYBsMlBsm9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoBrBaBngrfCgZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHgobYgs9lgag9fowxSVfCgr9nzsyrgrN9foDGBS7ASVfrzsfnzaMlBsv9fowxSVfCgr9nzsyrgrN9foD2ht29foylgoblgoBngHldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaMngoy1BaBHSVfjqHldgaMHBaU1BoEHBeldzIG9foBHBrUCgrfnBoZ9fowxSVfCgr9nzsyrgrN9foDChSHQ4eldBof1Brf1go9CBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofrBsBCBsM0Bap9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofngo8HBoBnBrZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofYgsBYgoMCzak9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBlgrB1goRnzsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHBr81BoEYza39fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzoEASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCzsECBrfrgsy1SVfjqHldBo9Ygob1Br9lSVfjBokQhS7ASVfHBryrBo91gre9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofCgabCBaUCgsZ9fowxSVfCgr9nzsyrgrN9foDCBaUYht29fofHgrRrgsM7zak9fowxSVfCgr9nzsyrgrN9foDrht29foB1Brb1BsB1grZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fo8HgrfYzaBCBpldzIG9foUlgsM7zaf2gsN9fowxSVf2gsB0grR1BaRnSVfjcIZAcV29foB2goU2BrM7zZldz50HcilASVfrgr9rgrb0BrRHSVfjqHldBo9Ygob1Br9lSVfjSVv9fI7ASVfnBrUrBr9rBoN9fow6kF2AhS7ASVfngsbHBaBYzsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYgafngobHBag9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtURkeUbQRfoDdqHldBsMlgo91BobrBpldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foEnBo9YgaUlga39fowxSVfCgr9nzsyrgrN9foDCht29foE1zsMlgaE0gom9fowxSVfCgr9nzsyrgrN9foDrgS7ASVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1l4eldBs9Ygo9nSVfjBV1l4eldBs9YgoyYSVfjBV1YzaUrBsBYzs90gsMYgaUnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBrRlBa80BrN9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsfnzaRYgaE0SVfjqHldBo9Ygob1Br9lSVfjBreQ4eldBo81BrRrBoMCzeldzIG9fofYgr80zaBYBeldzofHht29fof0grbngaElgoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgafHgrRCgsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoflgsUYzsm9fowxSVfCgr9nzsyrgrN9foDCzP7ASVfHBoyrgaUCBoO9fowxSVfCgr9nzsyrgrN9foDYhSHQ4eldBoM1zsBCzsf2BeldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBoM1zsE7goRCgpldzIG9fofYgr80zaBYBeldzoElBP7ASVfCBay0Brf0BoMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBablBoBlgr8rSVfjqHldBo9Ygob1Br9lSVfjgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBngo90zs9lBpldzIG9fofYgr80zaBYBeldzoZQ4eldBrU7BsUHBsflzZldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oB2Br9CgsRlBsf0zablgaUASVf2gr9ngrO9foDl4oyCgrUHBsMHBaf1BsRCga9ASVf2gr9nzak9foDl4o8rzsf2gs9lgr9YzabrBakQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB7zs9lBoR1goN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1lza8CgrUHBsf2Bsf2gaMngd29foEYgr8YgpldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9nzak9foDl4oM1gofYgaR2BoE2BoE7Ba8nhZHQht29foflzsMHBsRlBs39foDlhS7ASVf0goU1BoErgrO9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBr9CgsU0BsEngoE2gaylgC29foEYgr8YgpldzoM6grU0BaE0gofCzaMCgrB7gV29foEYgr81gHldzoM6zsU2Bs9ngsBrgob0BaBHgIHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfCzaR1gsfCBsB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoEHht29fofYgoBrgaE7Brm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoMHzab7goy1SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0gry1zsfnBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElBs8lzabYBoO9fowxSVfCgr9nzsyrgrN9foDlht29foElgay0grR1Brk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2Ba9Cgry7grR7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsE2BoECzaflgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE2BrflBrUlgrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BsRCgs87gr9lSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2Bs9nBrRlBr97SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsflBab2goECBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECgoRlzsRrgr39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2BoyCBob1BsbYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsf0goUrBoR2gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foErBs92BoU1BZldzIG9fofYgr80zaBYBeldzoylht29foErBo8ngrMrgrv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrUlzaM7goblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU2BafCgaBrBpldzIG9fofYgr80zaBYBeldzoylht29foE7Bry7grMHBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaUngr9lzaylSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsU7zaE0gsElBeldzIG9fofYgr80zaBYBeldzoNQ4eldBsUYBoU1zsMYzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBrf1BsU2gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBngaMHBoyrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsUlgs9CgrbYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsR1Ba81gay0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goE2BrfHzsRCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs82BoE1BaMlBpldzIG9fofYgr80zaBYBeldzovQ4eldBs8CBsRYzabrBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEngrM1gsBHBrk9fowxSVfCgr9nzsyrgrN9foDlht29foEngryYBsy1gsN9fowxSVfCgr9nzsyrgrN9foDlht29foEnzsElgsE7gov9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2gob1gaMYga8YSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs9lBa8YgayCBHldzIG9fofYgr80zaBYBeldzoRlht29foEYBsB0Bofnzav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2grEHBr9HgpldzIG9fofYgr80zaBYBeldzovQ4eldBs9rzsbrzaE2BpldzIG9fofYgr80zaBYBeldzoRlht29foEYgaBrgaRCgoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaf2BrRYzsU2SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsyCzsfCgoyrBpldzIG9fofYgr80zaBYBeldzoRlht29foE1gaE7Brf2zsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU0BayYgryCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaU0Br91Bay7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyHBo9nBa8lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1gofHzaf2gZldzIG9fofYgr80zaBYBeldzoNQ4eldBsyngoy0gabCgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1zaUHzsM2Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zabnBrRrBobnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsb2BaU1gr82geldzIG9fofYgr80zaBYBeldzoRlht29foE0BsyrgrUrgo39fowxSVfCgr9nzsyrgrN9foDlht29foE0Bo9ngoM7Bo39fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2zs92grUHBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsbYzs8HzsBrgHldzIG9fofYgr80zaBYBeldzovQ4eldBsb1goElBr80BHldzIG9fofYgr80zaBYBeldzoRlht29foflBafCgrM2zsg9fowxSVfCgr9nzsyrgrN9foDCht29foflBobrzsbYBrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBaUrgsB7BaR7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7grf2BoUnBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgo81zsR1ga39fowxSVfCgr9nzsyrgrN9foDCht29fof2BaB0BrU1gr39fowxSVfCgr9nzsyrgrN9foDlht29fof2BaUYBsUnBsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsE1zaU1zsBYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoEngrfHzab7zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoEYgoy0Bs81zZldzIG9fofYgr80zaBYBeldzoNQ4eldBoE0BaMlgaUCgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCBsBCBofCBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBoBHBrE1gab7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBoB0gaM0grMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBof1BrMlBoB0gpldzIG9fofYgr80zaBYBeldzoRlht29fofCzs91goUHgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBrUngoyHgrZ9fowxSVfCgr9nzsyrgrN9foDCht29fofrgsUlgsE0Bsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgaMlBobCBZldzIG9fofYgr80zaBYBeldzoylht29fof7gof7BsbnBs39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgab7goU0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsR0zayHzs80SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBo8lBaf7go90zeldzIG9fofYgr80zaBYBeldzovQ4eldBo8lBrB1BsbHgZldzIG9fofYgr80zaBYBeldzoRlht29fofnBsUYBayngZldzIG9fofYgr80zaBYBeldzoRlht29fofnBrE7zsUnzag9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgo8lzs82zaBHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCgrf1zaR7grE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo9rgsBnBsf0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBoy7BoUCgrfCzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1gsMYBo9Hzap9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCza87za82zsMYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYBab7grRrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyYgsE2gay1gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof1zsy1Bof2zae9fowxSVfCgr9nzsyrgrN9foDCht29fof0BaEYzabrgav9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsEngoflzsbCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsE1gaR0BsN9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCzsfngaMngofHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobrBr87gsR0gpldzIG9fofYgr80zaBYBeldzovQ4eldBobrgo9YBayHBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof0gsUCBsMYgr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBaR0zaMCBo39fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBayCgr8CgryYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrElBob2gaMrzZldzIG9fofYgr80zaBYBeldzoRlht29foB2BaR7gsBCzsZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bs91grbrzse9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBsfHBrElBrRnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsUYBrM2zs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrE7zsfYBaB7geldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBaR2goflgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrEHBoU1BsUHBpldzIG9fofYgr80zaBYBeldzoRlht29foB2goEYzaElgrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrBs9rBrM2BsE7SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBsyCzaRngabYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrfrgs8lgrU0gpldzIG9fofYgr80zaBYBeldzoRlht29foBCgaylga8ngrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBo87BrRnBaErSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBoylzsfnBrErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrf0Bay0goBlBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrBaRlgo8HBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrfCBoEHBsE1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrB7grU2BsRnzZldzIG9fofYgr80zaBYBeldzoRlht29foBrgoMHga91Bsp9fowxSVfCgr9nzsyrgrN9foDCht29foBrgoR1zaEYgag9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaMlBs8Cgs81SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUrBrBYzsU1zZldzIG9fofYgr80zaBYBeldzoylht29foB7Bry7gsbngsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaU7gaf0gofYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gsbnzsM0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrUHBsEnzsEYBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB7goflBrUCzaO9fowxSVfCgr9nzsyrgrN9foDCht29foB7zaU2BoyCBrg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgayngr9lBsblSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYBaBnBay0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRYgoE2zsMnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHzafHgsyrgok9fowxSVfCgr9nzsyrgrN9foDCht29foBHza9rBsfCgHldzIG9fofYgr80zaBYBeldzoRlht29foBnBa9Hza91grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgoECgsBlgo8rSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgoEYBs91zsfrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr87gsyrBobrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8nBafCgsElBHldzIG9fofYgr80zaBYBeldzoNQ4eldBr8YzaR7BoflgZldzIG9fofYgr80zaBYBeldzovQ4eldBr81BrR2goflgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBaE1BoECgsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgrEHzsRHgs9rSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9ngry0BsMYgpldzIG9fofYgr80zaBYBeldzovQ4eldBr91zaB1BobnBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYzsBCgsy0zZldzIG9fofYgr80zaBYBeldzoNQ4eldBry7gry7gry2BHldzIG9fofYgr80zaBYBeldzoRlht29foB1gay7go80zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrza8rzaBrBrMnSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzabCBaR0goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrblBaBlgrf1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrblgoB7BaRCBpldzIG9fofYgr80zaBYBeldzoylht29foB0BsU1BofHgpldzIG9fofYgr80zaBYBeldzoylht29foB0Bo9ngo9ngrZ9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzs9HBo9HBoBrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrzsy0Bs9YBayYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMlgrBrza8ngeldzIG9fofYgr80zaBYBeldzoRlht29foUlBsf7Baf1zaZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaR7za9rBeldzIG9fofYgr80zaBYBeldzoylht29foUlzsM7Ba92gr39fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BsB0Ba92za9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsRHBrfHBobYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaEYBrBlza91geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2za9lBoUCgsp9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BoEYgoylzsR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaf1zsRHBrBCBHldzIG9fofYgr80zaBYBeldzoylht29foUCzabngs8lSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaB2BoM7gsB2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU7za92gsECSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaUHBrB1zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaU1zaMrzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldga97zaRnzaMHSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7zsfrzs8Hzak9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHBaUYzsUrgsk9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBsE0go81BrO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfHBrUnza9YBoN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHBrRYBaRrzav9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsB2Bs9ngaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfHzsyYBoR1BrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBsBrgsy0gop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBoR7gaBlBok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnBrElgsU2grk9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngafrBsyHBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfngs80gsEngsp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfnzaBCBsfHzsm9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfnzaRrBoBnzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo81zsfCBa9HgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9lBa9Hgrb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9CzsBHzsUCgeldzIG9fofYgr80zaBYBeldzoNQ4eldgr82BablzsBCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgry0zsb1Bab0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza8HBrECzsyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldza9CgoyYBrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf0BrE0grU7BrO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0ga9YgaRYgaO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0gsB0zsy2gav9fowxSVfCgr9nzsyrgrN9foDCht29fobHgoyrgrfCgpldzIG9fofYgr80zaBYBeldzoRlht29fobYBabYBsR7geldzIG9fofYgr80zaBYBeldzoRlht29fob1zsUYBsBlBeldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgtmRgWRbmeRpQNXSfdzdvxSVf2zay1BrRlzaB7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCzs9Yza80geldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7ew9dM5fEgCcYZoXip6OCfjfIG9foE0Baf7BsM0BaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgry7gaflzsElSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhUYvKkFgDXF0IfoDdqHldBrb1zaR7BsR2gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foR0zaU2BsE0BpldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7O3XnZA8F9dzdvxSVfCBsR2BrMngs82SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfnBo8YBsMnBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7OCOFZrkie6Oip6OCfjfIG9foflgryCBay0gam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBsU0BrU7BsbnSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhsFe6kFeAfep3kCfjfIG9foB7BofCzsy0BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foR7grB1Bay1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7HKk5RyvdNa95QH8n3wc59dzdvxSVf2BsbngoRHgrf2SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBoEHgsM0go8nBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtS7Q6fPZrOtfjfIG9foEnBrR2zaE7Bo39fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVf2grB2goR7BoUlSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRIZ6c5p6OCfjfIG9foECgsRnBrbCBog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBr8YBaMrgrfrSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQhtfAfdBoRbZasHvEmZvhRne5OtNfOFebfoDdqHldBo91za8HgrE7gHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBnzsB7zsU2Bsp9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsXieCOFUdzdvxSVf2grynzsB0goU0SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBsy1BrU2BoUnBZldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHgAcY9ycFQ7XFQ6foDdqHldBsfHBrblBsE1zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foBlgrB1gsf0Bsg9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQskie6Oip6OCfjfIG9fof0goRlBrR0grN9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfngabYgaR1Br39fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgFtZgZUR2sfoDdqHldBsM2gr8rBs9YBeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foElzaf0gsU2Bov9fowxSVfCgr9nzsyrgrN9foDlht29foflBoUngo8rzap9fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCzaMCzaUHgr9YSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoM6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrBlBaE1grylBpldzIG9fofYgr80zaBYBeldzoElgS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBsNQhS7ASVf2BaRlzsElBrblSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2zsb0gayCzabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBs9Ygo82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr9ngov9fowxSVfCgr9nzsyrgrN9foDlht29foEYgr8nBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsbrgaRHzsflSVfjqHldBo9Ygob1Br9lSVfjgoylBP7ASVfrgsErBo80Bay1SVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foflga8ngoU1BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV12zs8lgry7gab7za9nza82gd29foEYgr8YBZldzoM6zaE0goMYzsErgab7BsElBt29foEYgr8YgpldzoM6goR7zsM2zsy2BrRrgrR0zV29foEYgr81gHldzoM6go97gsM0zafrBrfCBobnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoyHgr9YBrRCBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBnBsy7goECBHldzIG9fofYgr80zaBYBeldzoEChSHQ4eldBofYzaUHgrbrSVfjqHldBo9Ygob1Br9lSVfjkPvHOt29foUlgsM7zaf2gsN9fowxSVf2gaB0zayrBsR2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29fofYzs80BrU7zag9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11BsbnBa90BsB7zsU2BsM24eldBs9Ygo9nSVfjBV1ngsU0BaE0zaErgsBYgsb14eldBs9YgoyYSVfjBV1ngrUHBab1BoBrBofCzs82hZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBsRnBs81gry2SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoE6BV29foEYgr8YgpldzoE6BV29foEYgr81gHldzoE6BPHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzoUlht29foB0BaB2gsylgr39fowxSVfCgr9nzsyrgrN9fow79IZphSHQ4eldBoR2BaU0grUCBZldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9foErgoB1gsUngr39fowxSVfCgr9nzsyrgrN9fow79IZpht29foy1Bsy2Boy1gZldzIG9fofYgr80zaBYBeldzoBCgoB1hSHQ4eldBrfHBsR1gayngZldzIG9fofYgr80zaBYBeldzImCkFRASVf7BaRlgayCBsRlSVfjqHldBsR7gsyCBoylgHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foDl4oB0BoEHgoy0zabYgsBYBoBASVf2gr9ngre9foD24oMASVf2gr9ngrO9foD24oMASVf2gr9nzak9foD24oNQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foflzab2BsB1BoN9fowxSVfCgr9nzsyrgrN9foDlht29fofrBsE0gry2gam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf7Bo81BobCgaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foB7BrUHgofnBrm9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof7grblgof7gsN9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBV1YzaUrBsBYzs90gsMYgaUn4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBoUCBsyrgrf7SVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr8YgpldzoM6gsy1BoBHBrE1go8lgrBnBt29foEYgr81gHldzoM6gsy1BoBHBrE1go8lgrBnBSHkhS7ASVfCBablgsEHBaE1SVfjBPHQhS7ASVfrgof7gsECzsp9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVfCBr8nBoRrBsO9fowxSVfCgsRngoy1Bam9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBV1HBab1BaB0gsMYza8HzsMn4eldBs9YgoyYSVfjBV1HBab1BaB0gsMYza8HzsMnhZHQht29foflzsMHBsRlBs39foDlhS7ASVfCgr9nzsyrgrN9fow79IZpht29foblBobrgsMCzZldzIG9fofHgs8nzaylgeldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9ngrO9foDl4oBHBob7BsE1gsfrgsbYgrfASVf2gr9nzak9foDl4obnBa91gaBYgs8ngrRYBIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBo9Ygob1Br9lSVfjkPvHOSHQht29foB1BafCBr8lzag9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fof2gr92zsBrBpldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQhS7ASVf7Bs8HgrfHgr87SVfjqHldBo9Ygob1Br9lSVfjO5eA9nRASVf7BaRlgayCBsRlSVfjqHldBsMngry1BsElBHldz50HcilASVfCga87BsylBoMYSVfjcIZAcV29foB7gaf7BsMHgpldz50HcilASVfrgry1grU7gr9nSVfjqHldBo9Ygob1Br9lSVfjBs8lht29foUrzsbYBa92zeldz50Hci2Qht29foy7Brb2gry2zZldzIG9foUlgsM7zaf2gsN9fowxSVfCBs9YBsbrBrv9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV11zsylBrbCzaErgoyCgsRn4eldBs9Ygo9nSVfjBV1nga9lgsy1gaUHgo8rgaRC4eldBs9YgoyYSVfjBV1Hgs81gofYgrEHBsElgr90hZHQht29foflzsMHBsRlBs39foDlhS7ASVfCBr81za9Yzs39fowxSVfCgr9nzsyrgrN9foDlht29foBrBaM2za91Bav9fowxSVfCgr9nzsyrgrN9foDlht29foUYgr8lgoR1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf1zaE1Bsf1zaZ9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9fofrgoy1gr90zeldzIG9fofYgr80zaBYBeldzoeQ4eldBo90gobrgaU1BHldzIG9fofYgr80zaBYBeldzIG9foflzsM2gsR0BoO9fowxSVflSVfjqHldBoM0BaEHgsbCgpldzpGxSVf2gr9ngrN9foD24oMASVf2gr9ngre9foDl4oy2zs8lgrb2BrU0gaE2BaEASVf2gr9ngrO9foDl4o8HgablBsb1BsBHBr9HzsyASVf2gr9nzak9foDl4o8YgaRlzsyCBrBCBof0goeQSSHQ4eldBoM0BaR2gsM2zeldzoNQht29foB2gs82goyYzae9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBt1l4eldBs9Ygo9nSVfjBt1l4eldBs9YgoyYSVfjBt1lhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrBrU1gsElgsM1SVfjqHldBo9Ygob1Br9lSVfjBrvQhSHQfI7="

function slot_0_35_4(arg_192_0)
	local var_192_0, var_192_1 = pcall(json.stringify, arg_192_0)

	if not var_192_0 then
		return false, var_192_1
	end

	local var_192_2, var_192_3 = pcall(slot_0_0_0.encode, var_192_1, slot_0_33_3)

	if not var_192_2 then
		return false, var_192_3
	end

	return var_192_2, var_192_3
end

function slot_0_36_6(arg_193_0)
	local var_193_0, var_193_1 = pcall(slot_0_0_0.decode, arg_193_0, slot_0_33_3)

	if not var_193_0 then
		return false, var_193_1
	end

	local var_193_2, var_193_3 = pcall(json.parse, var_193_1)
	local var_193_4 = var_193_3

	if not var_193_2 then
		return false, var_193_4
	end

	return true, var_193_4
end

function slot_0_37_9()
	local var_194_0 = {}
	local var_194_1 = slot_0_13_0.get()

	for iter_194_0, iter_194_1 in pairs(var_194_1) do
		var_194_0[iter_194_0] = iter_194_1[1]:export()
	end

	return var_194_0
end

function slot_0_38_12(arg_195_0)
	local var_195_0 = slot_0_13_0.get()

	for iter_195_0, iter_195_1 in pairs(arg_195_0) do
		local var_195_1 = var_195_0[iter_195_0]

		if var_195_1 == nil then
			-- block empty
		else
			local var_195_2 = var_195_1[1]

			pcall(var_195_2.import, var_195_2, iter_195_1)
		end
	end

	slot_0_22_0.update()
end

function slot_0_31_0.encode(arg_196_0, arg_196_1)
	return slot_0_35_4(arg_196_1)
end

function slot_0_31_0.decode(arg_197_0, arg_197_1)
	return slot_0_36_6(arg_197_1)
end

slot_0_39_14 = nil

function slot_0_40_17()
	local var_198_0, var_198_1 = slot_0_35_4(slot_0_37_9())

	if not var_198_0 then
		return
	end

	slot_0_2_0.set(var_198_1)
	slot_0_12_0.success("exported config")
end

function slot_0_41_20(arg_199_0)
	local var_199_0 = string.find(arg_199_0, "\x00")

	if var_199_0 == nil then
		return arg_199_0
	end

	return arg_199_0:sub(1, var_199_0 - 1)
end

function slot_0_42_24()
	local var_200_0 = slot_0_2_0.get()
	local var_200_1 = slot_0_41_20(var_200_0)
	local var_200_2, var_200_3 = slot_0_36_6(var_200_1)

	if not var_200_2 then
		return
	end

	slot_0_38_12(var_200_3)
	slot_0_12_0.success("imported config")
end

function slot_0_43_29()
	local var_201_0, var_201_1 = slot_0_36_6(slot_0_34_3)

	if not var_201_0 then
		return
	end

	slot_0_38_12(var_201_1)
	slot_0_12_0.success("imported default config")
end

slot_0_32_1.export:set_callback(slot_0_40_17)
slot_0_32_1.import:set_callback(slot_0_42_24)
slot_0_32_1.default:set_callback(slot_0_43_29)

slot_0_32_0 = nil
slot_0_33_2 = slot_0_23_0.antiaim.presets
slot_0_34_2 = "MNVaEeiPfvJ4BgzWUmtsRZFS8OXc9kqhy3dobp5IDwuTAG6Kl2Cr7HnY10jxLQ+/="
slot_0_35_3 = "presets"
slot_0_36_5 = {}
slot_0_37_8 = slot_0_28_0[slot_0_35_3] or slot_0_36_5
slot_0_38_11 = {}
slot_0_39_13 = {}
slot_0_40_16 = nil
slot_0_41_19 = string.match

function slot_0_40_15(arg_202_0)
	return slot_0_41_19(arg_202_0, "^()%s*$") and "" or slot_0_41_19(arg_202_0, "^%s*(.*%S)")
end

function slot_0_41_18()
	slot_0_28_0[slot_0_35_3] = slot_0_37_8
end

function slot_0_42_23()
	local var_204_0 = {}
	local var_204_1 = slot_0_13_0.get()

	for iter_204_0, iter_204_1 in pairs(var_204_1) do
		local var_204_2 = iter_204_1[1]

		if iter_204_1[2] == "AA" then
			var_204_0[iter_204_0] = var_204_2:export()
		end
	end

	return var_204_0
end

function slot_0_43_28(arg_205_0)
	local var_205_0 = slot_0_13_0.get()

	for iter_205_0, iter_205_1 in pairs(arg_205_0) do
		local var_205_1 = var_205_0[iter_205_0]

		if var_205_1 == nil then
			-- block empty
		else
			local var_205_2 = var_205_1[1]

			if var_205_1[2] ~= "AA" then
				-- block empty
			else
				var_205_2:import(iter_205_1)
			end
		end
	end
end

function slot_0_44_30(arg_206_0, arg_206_1, arg_206_2, arg_206_3)
	return {
		name = arg_206_1,
		author = arg_206_0,
		content = arg_206_3,
		created_at = arg_206_2,
		updated_at = arg_206_2
	}
end

function slot_0_45_28(arg_207_0)
	local var_207_0 = slot_0_42_23()

	if var_207_0 == nil then
		return nil
	end

	return slot_0_44_30(common.get_username(), arg_207_0, common.get_unixtime(), var_207_0)
end

function slot_0_46_27(arg_208_0)
	if type(arg_208_0.content) == "string" then
		local var_208_0, var_208_1 = slot_0_31_0:decode(arg_208_0.content)

		if not var_208_0 then
			return
		end

		arg_208_0.content = var_208_1
	end

	table.insert(slot_0_38_11, arg_208_0)
end

function slot_0_47_29(arg_209_0)
	for iter_209_0 = #slot_0_39_13, 1, -1 do
		local var_209_0 = slot_0_39_13[iter_209_0]

		if var_209_0.name == arg_209_0 then
			return var_209_0, iter_209_0
		end
	end

	return nil, -1
end

function slot_0_48_32(arg_210_0)
	return slot_0_39_13[arg_210_0]
end

function slot_0_49_33(arg_211_0)
	local var_211_0 = slot_0_47_29(slot_0_40_15(arg_211_0))

	if var_211_0 == nil or var_211_0.content == nil then
		return false, "Preset is not valid"
	end

	slot_0_43_28(var_211_0.content)
	events.update_records:call()

	return true, var_211_0
end

function slot_0_50_34(arg_212_0)
	arg_212_0 = slot_0_40_15(arg_212_0)

	local var_212_0, var_212_1 = slot_0_47_29(arg_212_0)

	if var_212_0 == nil then
		local var_212_2 = slot_0_45_28(arg_212_0)

		if var_212_2 == nil then
			return false, "Unable to create preset"
		end

		table.insert(slot_0_37_8, var_212_2)
		slot_0_41_18()

		return true, var_212_2
	end

	if var_212_1 ~= -1 and var_212_1 <= #slot_0_38_11 then
		return false, "Can't modify script preset"
	end

	local var_212_3 = slot_0_42_23()

	if var_212_3 == nil then
		return false, "Unable to export config"
	end

	var_212_0.updated_at, var_212_0.content = common.get_unixtime(), var_212_3

	slot_0_41_18()

	return true, var_212_0
end

function slot_0_51_36(arg_213_0)
	local var_213_0, var_213_1 = slot_0_47_29(slot_0_40_15(arg_213_0))

	if var_213_1 ~= -1 and var_213_1 <= #slot_0_38_11 then
		return false, "Can't delete script preset"
	end

	local var_213_2 = var_213_1 - #slot_0_38_11

	table.remove(slot_0_37_8, var_213_2)

	return true, var_213_0
end

function slot_0_52_33()
	local var_214_0 = #slot_0_39_13

	if var_214_0 == 0 then
		return {
			"Empty"
		}
	end

	local var_214_1 = {}

	for iter_214_0 = 1, var_214_0 do
		local var_214_2 = slot_0_39_13[iter_214_0].name

		if iter_214_0 <= #slot_0_38_11 then
			var_214_2 = string.format("%s\a{Link Active}*", var_214_2)
		end

		var_214_1[iter_214_0] = var_214_2
	end

	return var_214_1
end

function slot_0_53_31()
	slot_0_39_13 = {}

	for iter_215_0 = 1, #slot_0_38_11 do
		table.insert(slot_0_39_13, slot_0_38_11[iter_215_0])
	end

	table.sort(slot_0_37_8, function(arg_216_0, arg_216_1)
		return arg_216_0.name < arg_216_1.name
	end)

	for iter_215_1 = 1, #slot_0_37_8 do
		table.insert(slot_0_39_13, slot_0_37_8[iter_215_1])
	end
end

slot_0_54_32 = nil

function slot_0_55_36(arg_217_0)
	local var_217_0 = arg_217_0:get()

	if var_217_0 == nil or var_217_0 <= 0 then
		return
	end

	local var_217_1 = slot_0_48_32(var_217_0)

	if var_217_1 == nil then
		return
	end

	slot_0_33_2.name:set(var_217_1.name)
end

function slot_0_56_33()
	local var_218_0, var_218_1 = slot_0_49_33(slot_0_33_2.name:get())

	if not var_218_0 then
		slot_0_12_0.error(var_218_1)

		return
	end

	events.update_records:call()
	slot_0_12_0.success(string.format("preset %s loaded", var_218_1.name))
end

function slot_0_57_30()
	local var_219_0, var_219_1 = slot_0_50_34(slot_0_33_2.name:get())

	if not var_219_0 then
		slot_0_12_0.error(var_219_1)

		return
	end

	slot_0_53_31()
	slot_0_33_2.list:update(slot_0_52_33())
	slot_0_12_0.success(string.format("preset %s saved", var_219_1.name))
end

function slot_0_58_29()
	local var_220_0, var_220_1 = slot_0_51_36(slot_0_33_2.name:get())

	if not var_220_0 then
		slot_0_12_0.error(var_220_1)

		return
	end

	slot_0_53_31()
	slot_0_33_2.list:update(slot_0_52_33())

	if var_220_1 ~= nil then
		slot_0_12_0.success(string.format("preset %s deleted", var_220_1.name))
	end
end

function slot_0_59_24()
	local var_221_0 = slot_0_42_23()

	if var_221_0 == nil then
		return
	end

	local var_221_1, var_221_2 = slot_0_31_0:encode(var_221_0)

	if not var_221_1 then
		slot_0_12_0.error("can't encode data")

		return
	end

	slot_0_2_0.set(var_221_2)
	slot_0_12_0.success("preset exported")
end

function slot_0_60_16()
	local var_222_0 = slot_0_2_0.get()
	local var_222_1, var_222_2 = slot_0_31_0:decode(var_222_0)

	if not var_222_1 then
		slot_0_12_0.error("can't decode data")

		return
	end

	slot_0_43_28(var_222_2)
	events.update_records:call()
	slot_0_12_0.success("preset imported")
end

slot_0_33_2.list:set_callback(slot_0_55_36)
slot_0_33_2.load:set_callback(slot_0_56_33)
slot_0_33_2.save:set_callback(slot_0_57_30)
slot_0_33_2.delete:set_callback(slot_0_58_29)
slot_0_33_2.export:set_callback(slot_0_59_24)
slot_0_33_2.import:set_callback(slot_0_60_16)
slot_0_46_27(slot_0_44_30("isabel", "Default", -1, "qCfof7ezm72eRHQNXSfdzdvxSVf2Ba9CBaMlgrN9fowxSVfCgr9nzsyrgrN9foD2BY7ASVf2gsEnBo90goECSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsRHgaEHBaMHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsb7gsRlBrb1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2goUrgsy7BoEYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2grUYgof1Ba8HSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCBrE2grBrBofCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaRngaMCzsR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsbnBobnBak9fowxSVfCgr9nzsyrgrN9foDHgY7ASVfrBoblBs82Bav9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrbHgoECBoR1gpldzIG9fofYgr80zaBYBeldzoR1ht29foU2zaM2gaRHBrO9fowxSVfCgr9nzsyrgrN9foDrBP7ASVfYgoE1gs9ngrk9fowxSVfCgr9nzsyrgrN9foDGBoeQ4eldzaf2go92go9lSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQhS7d4Vfof7ezm72eRHQNXSfyvdNa95QH8n3wc59dzdvxSVfCBayYgsRYzs8nSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29fofCga9HBrU2zsN9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgaBrBsflBsf0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMlBsB0grM2SVfjqHldBo9Ygob1Br9lSVfj4sfnht29foBlzaE2ga80BoN9fowxSVfCgr9nzsyrgrN9foDrgY7ASVfrBo9YgoRYBsUCSVfjqHldBo9Ygob1Br9lSVfjBS7ASVfrBr8ngsRCzaB7SVfjqHldBo9Ygob1Br9lSVfjgspQ4eldBrR2gs8HBoE2BeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrBrzsMrzeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrzsfCBs9CBoe9fowxSVfCgr9nzsyrgrN9foDlht29foR2zsy7goM1zZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldgobCgrRngsylSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0Bs8YgrynBpldzIG9fofYgr80zaBYBeldzoNQ4eldzsbHBabYBse9fowxSVfCgr9nzsyrgrN9foDHzPHQfdldfCgNsbkBmZghUYvKkFgDXF0IfoDdqHldBsU0zsMCBa80BZldzIG9fofYgr80zaBYBeldzd7rBS7ASVf2gsB2gafCBr81SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs8lBrB2Bo81geldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2Bry0gsU1geldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzabnBoRYzsO9fowxSVfCgr9nzsyrgrN9foDlht29fof0gaflzaflgsN9fowxSVfCgr9nzsyrgrN9foDlht29foB2zsM1zaRHgag9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBCzsUnzsylgo39fowxSVfCgr9nzsyrgrN9foDlht29foBHBoBCgs8ngre9fowxSVfCgr9nzsyrgrN9foDlht29foBYBrUYBsfYgap9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr8rBrBYgs92SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7Bay0gaR1gsUlSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foyrBoE0zaB7BpldzIG9fofYgr80zaBYBeldzoUHht29foy7zsyrBaR7BeldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsS7O3XnZA8F9dzdvxSVf2BrErgof7goy1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsBHzsU0gaBCgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs8Cgob0BsB1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBs87zaE7grB0gHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBrfHzsfHzsb0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaBHgr8CzsRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsMCBr90Bs9YSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBoblBrRngaBrBpldzIG9fofYgr80zaBYBeldzoNQ4eldBobYBsBngs9lzZldzIG9fofYgr80zaBYBeldzoNQ4eldBrBHgaM2BrBlBpldzIG9fofYgr80zaBYBeldzo8lht29foBnBoM0BrB1gsg9fowxSVfCgr9nzsyrgrN9foDlht29foBngaU1Ba97gom9fowxSVfCgr9nzsyrgrN9foDlht29foUlgsR7zsyYgae9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldgrBYBsf7BrU1SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghmIvpOSg78F0bXF0IfoDdqHldBsB0zaBYgsb0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEHBsRHgsfYgsp9fowxSVfCgr9nzsyrgrN9foDlht29fofCgob2gsyrBrN9fowxSVfCgr9nzsyrgrN9foDlht29fofrgrfHBofHgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoB1gsB1zsg9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCzablBs9lBsv9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrErzaElBoE1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrUHBobCgs9HgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHBoMrgrynBeldzIG9fofYgr80zaBYBeldzofASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaMrBsM0gav9fowxSVfCgr9nzsyrgrN9foDlht29foUlgr97grB0zsO9fowxSVfCgr9nzsyrgrN9foDlht29fo92BrRHzaB0gZldzIG9fofYgr80zaBYBeldzoNQ4eldgrf7BsfYBoBnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfYzsbHBrBngsO9fowxSVfCgr9nzsyrgrN9foDnBPHQfdldfCgNsbkBmZghsFe6kFeAfep3kCfjfIG9foECBoBngsM7grk9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoBngobrzaZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsRHBay1zs97gHldzIG9fofYgr80zaBYBeldzoNQ4eldBs9lgsR1gsf0gpldzIG9fofYgr80zaBYBeldzoNQ4eldBoM1BsE0Ba91geldzIG9fofYgr80zaBYBeldzoNQ4eldBoBYBoyHBaE1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBrMrgrf2Br92BHldzIG9fofYgr80zaBYBeldzoNQ4eldBrUCBaBHBay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldBrUrzsflzaMHgHldzIG9fofYgr80zaBYBeldzoNQ4eldBr9rzsRnza90SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrza9YgoUCgoy2SVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foUCzabHBaU1gsv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7zsErBr91gZldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYgry0BaE1SVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0PsEZsS7HKk5RyvdNa95QH8n3wc59dzdvxSVfCBr9lgoy2BoR2SVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBoU1za8rBsyrgpldzIG9fofYgr80zaBYBeldzovQ4eldBoRrBaU7zaBHBHldzIG9fofYgr80zaBYBeldzoNQ4eldBo81BsyCza9rSVfjqHldBo9Ygob1Br9lSVfjBd29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0BrR1BoE0BHldzIG9fofYgr80zaBYBeldzoNQ4eldBr82gaBlgr80BeldzIG9fofYgr80zaBYBeldzo8lht29foBYgrRlzs90gsO9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB1gsf7gay1gae9fowxSVfCgr9nzsyrgrN9foDGgsmQ4eldBryHzaB2Bo8lzeldzIG9fofYgr80zaBYBeldzoNQ4eldBrbnzsb1BoB7gZldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVf7BaRCgsU1BrU0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgoR0Bo8rBsUHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnzsf7BsMrBoN9fowxSVfCgr9nzsyrgrN9foDGzP7ASVf1zsECBabHgok9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQWcdNH9nRdzdvxSVf2BafngrUHBoE2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2Ba8HgoR7Br9CSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foErzaRYBr81Bo39fowxSVfCgr9nzsyrgrN9foDlht29foEnga8YgoErBsp9fowxSVfCgr9nzsyrgrN9foDlht29foE0goUrBrRlBop9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgrbHgoR7BsfrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgs9YBaECgo39fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBr87Bo8lgsbnBeldzIG9fofYgr80zaBYBeldzo8lht29foBngr90BaE2zs39fowxSVfCgr9nzsyrgrN9foDlht29foUlgay0grbrgrZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BaRlBr80Br87SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7BsUCgoMngoN9fowxSVfCgr9nzsyrgrN9foDlht29foUHgab0zsfYgpldzIG9fofYgr80zaBYBeldzoNQ4eldzaU2BrU2go97SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRIZ6c5p6OCfjfIG9foElzaE1Ba90Bag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2BoErgrEngsEYSVfjqHldBo9Ygob1Br9lSVfjBsOQ4eldBsRrBrU7BoMCzeldzIG9fofYgr80zaBYBeldzo8lht29foE0gaMlzsRnBsk9fowxSVfCgr9nzsyrgrN9foDlht29foflBa91zs80zsm9fowxSVfCgr9nzsyrgrN9foDlht29foflgrRnzsyrgre9fowxSVfCgr9nzsyrgrN9foDlht29fofYBoRCgo8HBsZ9fowxSVfCgr9nzsyrgrN9foDlht29fofYgab2gaM2BoO9fowxSVfCgr9nzsyrgrN9foDCht29foB2gsb1BrE7Bag9fowxSVfCgr9nzsyrgrN9foDr4eldgaMHBaU1BoEHBeldzIG9fofHgo82goRrgrZ9fowxSVfCgr9nzsyrgrN9foDlht29fo8lBa81go87BZldzIG9fofYgr80zaBYBeldz5O3cPgphSHQ4eldBrb2zsy1BoEnBpldzIG9fofYgr80zaBYBeldzd7CBP7ASVf7Bs90gs9rgsN9fowxSVfCgr9nzsyrgrN9fow79IZpht29foUnBryCgob1gHldzIG9fofYgr80zaBYBeldzd77gS7ASVfYBrErBoUlgag9fowxSVfCgr9nzsyrgrN9foDlht29fo9HBoU1BaMHzZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhSHQfdldfCgNsbkBmZghRne5OtNfOFebfoDdqHldBsMngaf2go8nzeldzIG9fofYgr80zaBYBeldzo8lht29foECBsUlBsE2BsZ9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBs97BoE0gr81BZldzIG9fofYgr80zaBYBeldzoNQ4eldBsb0BsMlBsEYgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflgsbCzaE7Bop9fowxSVfCgr9nzsyrgrN9foDlht29foflzsU1BsBnzsp9fowxSVfCgr9nzsyrgrN9foDGBsNQ4eldBoBCBrBYBoBlBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRnBrUHBrflBpldzIG9fofYgr80zaBYBeldzoNQ4eldBo9CgoElBr9YzeldzIG9fofYgr80zaBYBeldzoNQ4eldBoy1zsRYgaEYBZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrBsRHzabrgsyrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrB1ga9lza9CBHldzIG9fofYgr80zaBYBeldzoNQ4eldBrb7gab2BrUngHldzIG9fofYgr80zaBYBeldzoNQ4eldgaMrgaf1BrEHSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgNsbkBmZghRn3395ZbfoDdqHldBsf2grU2BoR0BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsB7go9rgo39fowxSVfCgr9nzsyrgrN9foDlht29foEHBr97zsRlgap9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsyHBsbHgaN9fowxSVfCgr9nzsyrgrN9foDlht29fof1BaUnBoBrgsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof0ga97Bsfrgam9fowxSVfCgr9nzsyrgrN9foDlht29foBlgoE1gsy1zav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf7BoMlgrBYgsbnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgaflBoECgrR1gZldzIG9fofYgr80zaBYBeldzoNQ4eldgaUHBs8CgsEYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldgsM0gaR0gay0SVfjqHldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foRngoM2zay1BZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMngrRYgabYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsBlzsb1zsZ9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7ezm72eRHQsciQYfiHKkipKcdfjfIG9foErgoU1gaR0Bsv9fowxSVfCgr9nzsyrgrN9foDlht29foEHgoBCBrU7gZldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gs9CgoBlgaErSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE7BaMHgrRYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab0gaMrzam9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE0zsEnBsR0gae9fowxSVfCgr9nzsyrgrN9foDlht29foflBr97zs8CBog9fowxSVfCgr9nzsyrgrN9foD7BI7ASVfCBsb7zsEYBof2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrRYgs82Bo8lSVfjqHldBo9Ygob1Br9lSVfj4sB1ht29fofrzsRHga87zZldzIG9fofYgr80zaBYBeldzo8lht29foBlBrElBoyrzsN9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrgr91BrRYzsfHSVfjqHldBo9Ygob1Br9lSVfjBC29foUlgsM7zaf2gsN9fowxSVfCgs8nBs8HBr9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBaMnza8ngae9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQht29foU2BoM1gaB7gse9fowxSVfCgr9nzsyrgrN9foDlht29foy2zsb7BabHgpldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoUR0PsEZsSHg78F0bXF0IfoDdqHldBsfCgsBnBo82BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2gsyCBsMHzsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gr82zs9lBr8lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsMCzaMnBoE1SVfjqHldBo9Ygob1Br9lSVfjBrgQ4eldBsb7Bsy0Brb7gpldzIG9fofYgr80zaBYBeldzoNQ4eldBo80Ba8rgsB1BZldzIG9fofYgr80zaBYBeldzoeQ4eldBoy0grUHzafnSVfjqHldBo9Ygob1Br9lSVfj4s80ht29fof0ga8lzabngok9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfrBa92BaEHBsM2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBHzaR7gs8rgeldzIG9fofYgr80zaBYBeldzoBASVf7BaRlgayCBsRlSVfjqHldBoRngoEngsBYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgoMlgoyngoU2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhS7ASVfrzsb0gaEHzaM2SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHBo9CBsUlzav9fowxSVfCgr9nzsyrgrN9foDlht29fo80BsfHzsM2gHldzIG9fofYgr80zaBYBeldzoNQ4eldzsfYBa8HgaBlSVfjqHldBo9Ygob1Br9lSVfjgoNQhtfAfdBoUR0RtRevsZQgURpzfoDdqHldBsR7goEHgr97geldzIG9fofYgr80zaBYBeldzovQ4eldBrUlBrUrgoUlBeldzIG9fofYgr80zaBYBeldzImCkFZQhtfAfdBoUR0RtRevsZQsmZmRtR0PRCfjfIG9foflzabHgaU0zsN9fowxSVfCgr9nzsyrgrN9foDl4eldgaMHBaU1BoEHBeldzIG9foEYBob1zsyCgsp9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsy1BrB2zay2SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofHgo82goRrgrZ9fowxSVfCgsUCgoblgrk9fowcqHldBsUCgryHgsyrgpldz5O3cPgp4eldBs9rgs9lgoE1Bpldz5O3cPgp4eldBsbCzafCzs82SVfjkPvHOt29foE0BrU0gobYgeldzo8ASVfCBablgsEHBaE1SVfjBt29fofrzsb7gaM0BaZ9foDl4eldBrBlgrMnzaBnBHldz5O3cPgphZ7ASVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BoM1BsU0gsMCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foBlzsb2goE0zsp9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzsMCBrMYgog9fowxSVfCgr9nzsyrgrN9foD7BP7ASVfCBs9rBa81zaR0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRCBaR2Brb7gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgsMngaE1gsp9fowxSVfCgr9nzsyrgrN9foD2hSHQ4eldBrRnBob1grb2BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrRngo9lzsm9fowxSVfCgr9nzsyrgrN9foD2ht29fo97zablgsBngeldzIG9fofHgafnzsMYgHldzpGxSVf2gafYzaRHzaBnSVfjO5eA9nRASVf2grBHgrMnBsyCSVfjBV29foE0BoyCBobnBZldzoEASVf2zsB7zs80grm9foD0BV29foflzsMHBsRlBs39foDl4eldBoB0zsU7BablgZldzoMASVfrBrMYBa81Br8rSVfjO5eA9nZQ4PG9foE7Bo91gsR1BrO9fow58F2rOt29foEYBrRYBa82zav9foDl4eldBsbCzafCzs82SVfjBd29foE0BrU0gobYgeldzoy14eldBoM0BaR2gsM2zeldzoMASVfCBrb0gaUlzsMHSVfjBV29foBrBa9lgoyrgog9fow58F2rOSHk4eldBo9Ygob1Br9lSVfjBV29foUlgsM7zaf2gsN9fowxSVfCgay2ga8nBry2SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCzafrgoE7zabCSVfjqHldBo9Ygob1Br9lSVfjkPvHOSHQht29foyHBaM0zsRnBHldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4Vfof7ezZEpNtRHhRHmNZERdzdvxSVf2BsM0BrB1BaBnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2BsbrgryYgoRnSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gaUrBob0gs91SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gabYBafHBafHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsR1zsU0gaMnzZldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs8YBrRrzsErgHldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBr9CgrU7BHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBs9CgrU7zaUYgZldzIG9fofYgr80zaBYBeldzoNQ4eldBs91goE2ga8rSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaE2gobHBaRCSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zab1BrUlgablSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsb1BoblgsMnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrB1zs8nzsEnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngoErBrMngHldzIG9fofYgr80zaBYBeldzoNQ4eldBoBnza82zsfnSVfjqHldBo9Ygob1Br9lSVfjBseQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoR7grRYBafHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo8CzaU0gsBHgHldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBo81gsBCgav9fowxSVfCgr9nzsyrgrN9foDlht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foBlzs9lgrU1grZ9fowxSVfCgr9nzsyrgrN9fow79IZpht29foB2BablgrMHzaN9fowxSVfCgr9nzsyrgrN9foDlht29foBrBoM2goMCBrp9fowxSVfCgr9nzsyrgrN9foDlht29foB7BobCzs9YBre9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfHzaU1zsE0Bo39fowxSVfCgr9nzsyrgrN9fow79IZpht29foyrBs91BsErgHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7ew9dfjfIG9foElBry1Bsf1BrO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BsU7Br97grbrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BrMrzs9Yzse9fowxSVfCgr9nzsyrgrN9foD2ht29foE7gaU0BsU2gsv9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBsUHgoR0BofnzeldzIG9fofYgr80zaBYBeldzoNQ4eldBsRrgr9Ygr82geldzIG9fofYgr80zaBYBeldzoNQ4eldBsylgoBlBaElBpldzIG9fofYgr80zaBYBeldzo8lht29foE1BsEnzsRlgsv9fowxSVfCgr9nzsyrgrN9foDlht29fof7BaR2zsU2gap9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgrUCzsRHzaRHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgryrBsy1goB7SVfjqHldBo9Ygob1Br9lSVfjBsylht29foBHBayYzaRnBap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsElBa91gaE7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR1Bsb7ga97gpldzIG9fofYgr80zaBYBeldzImCkFZQ4eldBrR0Ba80goe9fowxSVfCgr9nzsyrgrN9foD0BP7ASVfrgryrzs9HBrflSVfjqHldBo9Ygob1Br9lSVfjgP7ASVfrzsfrgrblBsR0SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foU2BoRlgobngoZ9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf7Bof1zs8rzsbCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fo8ngs87zaMCSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfYgo87BoRCBsm9fowxSVfCgr9nzsyrgrN9foDGzsNQhtfAfdBomEZimR0stZOeS7ew9dM5fEgCcYZoXip6OCfjfIG9foECgs8lBry2gsg9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2BoylgaEHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsR1zayHBrMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gsbCzsB7za8nSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVf2gofCgrU7BaUnSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBs91gayYBobHBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE1goy2gryrgoe9fowxSVfCgr9nzsyrgrN9foDlht29foE0Bsy2gaB7zsZ9fowxSVfCgr9nzsyrgrN9foD2ht29fof2Brf1zafngoO9fowxSVfCgr9nzsyrgrN9fow79IZpht29fofrgaf1goE0zak9fowxSVfCgr9nzsyrgrN9foDlht29fof7zsy2ga9rgam9fowxSVfCgr9nzsyrgrN9foDlht29fof1goBrzaBlgr39fowxSVfCgr9nzsyrgrN9foDlht29fof0BoBnBr9rBsm9fowxSVfCgr9nzsyrgrN9foD2zaNQ4eldBob1gaylBo8rgpldzIG9fofYgr80zaBYBeldzoflht29foBlBrfYzs9nBrv9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrElzsMYBaR1BeldzIG9fofYgr80zaBYBeldzoNQ4eldBrE0Br8HgoR2BpldzIG9fofYgr80zaBYBeldzoeQ4eldBrBHzaRnBs91BHldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf7grMnBsbYgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYzaM2gaUHgoe9fowxSVfCgr9nzsyrgrN9foDlht29fobrgoylBrB2zZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7gCcYZoXip6OCfjfIG9foElBaEYBsb0gsm9fowxSVfCgr9nzsyrgrN9foDlht29foElgrR1BoMHgsO9fowxSVfCgr9nzsyrgrN9foDnBP7ASVf2zaB2ga80grEYSVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1Br9rzaf7zsm9fowxSVfCgr9nzsyrgrN9foD2ht29foE0gsRlgoEngre9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCBsR7BrE0gr8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrbCBsR7zs9nSVfjqHldBo9Ygob1Br9lSVfjBsylht29fofngaB0goblBrv9fowxSVfCgr9nzsyrgrN9fow79IZpht29fof1grB7BoBHBaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0zsU7BofHBsv9fowxSVfCgr9nzsyrgrN9fow79IZpht29foBHgsb1goMlgaO9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsf7BoBYBaN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrzaRHza97BsUCSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foB1zsBHgrylzaZ9fowxSVfCgr9nzsyrgrN9foD2ht29foUCBsf0gaf0zsk9fowxSVfCgr9nzsyrgrN9foDlht29fo8Hza8lBs9HSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfngoBCgrf7gsZ9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfngoRlgsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo9nzsM7gsfCgpldzIG9fofYgr80zaBYBeldzoflht29foy1zaBrBoBHgpldzIG9fofYgr80zaBYBeldzoNQ4eldzay0gaflgoR7SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhm5eTOF23OCfjf50Hcild4Vfof7membZzR7pFmZQi95Zp9Ym3c5mwc59dzdvxSVf2Ba8rzsB2BoynSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaUYzaU7ga82SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE1goR7grE2BsO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zabHgofrBrE1SVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foE0grRnzay1goe9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zsyCzsMHBaO9fowxSVfCgr9nzsyrgrN9foDlht29foflBrfngoRHgrO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgsU0grBCzaEHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoU1grE0goM1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoy1gsUYgoR1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzsM7gaylzaB7SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBobrga9ngr9CgZldzIG9fofYgr80zaBYBeldzoNQ4eldBrECgrB7BrRCgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7za92BafrgpldzIG9fofYgr80zaBYBeldzoNQ4eldBrU7Bs9HgabCSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrUHgaM7goUrzZldzIG9fofYgr80zaBYBeldzoNQ4eldBry0BryCBo80gZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0ga9HBoUngop9fowxSVfCgr9nzsyrgrN9foDlht29fo8rBaMngo81zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy7gsE0BrMCBHldzIG9fofYgr80zaBYBeldzoflht29fobCBablgo9ngZldzIG9fofYgr80zaBYBeldzoNQhtfAfdBomEZimR0stZOeS7H3cIZ3cVNO8S9dzdvxSVf2BaflBrb7zaU0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsEngaB7zab0gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7go92gr8ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBsU1zsyHBsE2gHldzIG9fofYgr80zaBYBeldzoNQ4eldBsRlgaflBrbYgHldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foEngrR2Ba9HgeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2grM1gsR7zs8CSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM2BsbCBsfHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBofrBsfCBry2BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoUlBrE0BofCBHldzIG9fofYgr80zaBYBeldzoNQ4eldBoRYBrRYgrE0gZldzIG9fofYgr80zaBYBeldzoNQ4eldBo87zaM2gsB1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBoyHBaRrzs87gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrf2BsyrgrM2gHldzIG9fofYgr80zaBYBeldzo8lht29foB7BaBrBsfCBap9fowxSVfCgr9nzsyrgrN9foDlht29foB7BoE2Bob2grg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgr82zaM7BoEHSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaMHgs9lgrU2zZldzIG9fofYgr80zaBYBeldzoNQ4eldgafngaE1za8nzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUngaBCgay7BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfHgo92gsRrBsO9fowxSVfCgr9nzsyrgrN9foDCBPHQfdldfCgEmROespgvZbZhsFQnOtM5fEgCcYZoXip6OCfjfIG9foE2grMYBrM2gap9fowxSVfCgr9nzsyrgrN9fow79IZpht29foE7go91BrEHgap9fowxSVfCgr9nzsyrgrN9foDrgoNQ4eldBsR2goMCgayYBHldzIG9fofYgr80zaBYBeldzo8lht29foEngsRrgrBrBsk9fowxSVfCgr9nzsyrgrN9foDlht29foE1Bs8HBoynzsp9fowxSVfCgr9nzsyrgrN9foDCht29foflgry1grR2zaN9fowxSVfCgr9nzsyrgrN9foDlht29fof2gsMnBob2Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCgs92BrE2gaM0SVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfCgo97Bo9CBab1SVfjqHldBo9Ygob1Br9lSVfjBS7ASVfCzsBHzaU2BsB1SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof0Bryrzsf2gre9fowxSVfCgr9nzsyrgrN9foDGgaZQ4eldBrfYBofrBsR7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBrflBs8lBoB0SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgaynBoyYBs9HSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr9rgoEHgsb1BZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYgrU7Bablgsk9fowxSVfCgr9nzsyrgrN9foDlht29foUCgs9rBoBlBHldzIG9fofYgr80zaBYBeldzoNQ4eldgsBCBrf2zsBrSVfjqHldBo9Ygob1Br9lSVfjkPvHOS7ASVfnBaB7zsUHBrv9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf1BaB2gsf0gsZ9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldzsbYgaf7ga81SVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhsn1ykSgpfoDdqHldBsMnBsMrza8YzZldzIG9fofYgr80zaBYBeldzoNQ4eldBsR2BoR7BoBrBeldzIG9fofYgr80zaBYBeldzoNQ4eldBs8YBoflBofrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaM1Bob2gsMrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbnBsRngsErBpldzIG9fofYgr80zaBYBeldzoNQ4eldBoB2BoRCgs9ngpldzIG9fofYgr80zaBYBeldzoNQ4eldBoRCgsMnzsBnBpldzIG9fofYgr80zaBYBeldzoflht29fofngoElBoE0zae9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCgoyHBrf7BpldzIG9fofYgr80zaBYBeldzoNQ4eldBoyCgr9nBsRlBZldzIG9fofYgr80zaBYBeldzoNQ4eldBrMlgaBYBoEYBeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB7gaUHgrfYgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBYBa92zay7Bov9fowxSVfCgr9nzsyrgrN9foDY4eldgaMHBaU1BoEHBeldzIG9foB7BrU1zsMHBsp9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBr92grMrBa9lzeldzIG9fofYgr80zaBYBeldzo8lht29foB0BrR2gsE1geldzIG9fofYgr80zaBYBeldz5O3cPgpht29foB0zs8CBaM0Bs39fowxSVfCgr9nzsyrgrN9foDlht29foU2BobHgoUCgak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsbrBoR0za80SVfjqHldBo9Ygob1Br9lSVfjBt29foUlgsM7zaf2gsN9fowxSVf2gaUrBrbnzsBCSVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUrgaR2zaEnzeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foy2gsUnzs8YBpldzIG9fofYgr80zaBYBeldzoNQ4eldzaUYBsM7zaErSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRIZ6c5p6OCfjfIG9foElgaElza97grO9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsf7Bo9Hgo8YBZldzIG9fofYgr80zaBYBeldzoNQ4eldBsBCgsBnBsBrgeldzIG9fofYgr80zaBYBeldzoNQ4eldBsB0zsyCBsylgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7grUCgrU2grm9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVf2zaf7zs92gsbrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoMCBr9Hgr91zZldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCBsBlBo90BoM7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBrU1gsRrBofYSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBo9YBs9CBsblgZldzIG9fofYgr80zaBYBeldzoNQ4eldBoyrBrRnBo9lBZldzIG9fofYgr80zaBYBeldzoNQ4eldBobrzaRrBsyHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBlgr9Cgsy2BoO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBof7Boy2gsy1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoU7gsBlBrbYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgafCBrB7gsU1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrgoUnzsbnBaB1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgaM0BoM2BsyYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf7gof7zabrBoO9fowxSVfCgr9nzsyrgrN9foDlht29foUngrfrBrBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzaB2gry2BsBYSVfjqHldBo9Ygob1Br9lSVfjBPHQfdldfCgEmROespgvZbZhRne5OtNfOFebfoDdqHldBsE7gsMHza91zeldzIG9fofYgr80zaBYBeldzoNQ4eldBsU7gaM1ga8nBHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7gaylgrBrgae9fowxSVfCgr9nzsyrgrN9foDlht29foEngrBHBrb2Brk9fowxSVfCgr9nzsyrgrN9foDlht29foEYzsUHBry2gag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zsbnBsf1BrErSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoE2gsU2gsU7BHldzIG9fofYgr80zaBYBeldzoNQ4eldBofCzaylBrM7BZldzIG9fofYgr80zaBYBeldzoNQ4eldBoU2BoRrzsBrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBsBYBsUrgs39fowxSVfCgr9nzsyrgrN9foDCBP7ASVfCgsRlza87zs9lSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgoRHzsy0gr9rSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofnzsBnzsBYBsO9fowxSVfCgr9nzsyrgrN9foDlht29foBlgsyHgsf1Bam9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBrEnBsR1za9rgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrzaE7Baf1gsm9fowxSVfCgr9nzsyrgrN9foDlht29foBnBsbCBrylgog9fowxSVfCgr9nzsyrgrN9foDlht29foU2grM0BaB7zag9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfnBoUHBsf1gov9fowxSVfCgr9nzsyrgrN9foDlht29fo8rgrU0zaECgZldzIG9fofYgr80zaBYBeldzoNQ4eldzaRlgoMHBrbHSVfjqHldBo9Ygob1Br9lSVfjBsfl4eldgaMHBaU1BoEHBeldzIG9foU2grBHBrE2gsp9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBomEZimR0stZOeSHgD8SvpOVfjfIG9foElzayCza9Czap9fowxSVfCgr9nzsyrgrN9foDlht29foEngsEYzsEHBsp9fowxSVfCgr9nzsyrgrN9foDCBP7ASVf2grynBsE7gog9fowxSVfCgr9nzsyrgrN9foDlht29foE0gsU7zaBngs39fowxSVfCgr9nzsyrgrN9foDlht29fof2zaU7BafrBak9fowxSVfCgr9nzsyrgrN9foDlht29fof7goUCzaB0zak9fowxSVfCgr9nzsyrgrN9foDlht29foB2Bsf1gofngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrB2zsb1BoMCgpldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgabnBoEHgabYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrR7gaflgrBngeldzIG9fofYgr80zaBYBeldzoNQ4eldBrR1zablzs8YgpldzIG9fofYgr80zaBYBeldzoNQ4eldBryHzab7go87BHldzIG9fofYgr80zaBYBeldzo9ASVf7BaRlgayCBsRlSVfjqHldBrUrgay0BaR2zZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrza81gry1zsf0SVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrblBsMnzsMrgZldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foUCBr92gsb2BoZ9fowxSVfCgr9nzsyrgrN9foDlht29foUCzaErBof7go39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7Bob2ga8lBsy1SVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldgsUHBo9rgaMHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsynBo9nBry0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB0Bo87gayYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsy1goBlBrm9fowxSVfCgr9nzsyrgrN9foDlhS7d4Vfof7membZzR7pFmZQsciQYfiHKkipKcdfjfIG9foEHzsyrBsUlgap9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2goE1gsbHzaEnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go80goblBs9nSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBsbYgo8YBrbnBHldzIG9fofYgr80zaBYBeldzoNQ4eldBsb1BrfCzs8rgZldzIG9fofYgr80zaBYBeldzoflht29fofrBof2gaBrSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBr8nBsBrBa8YSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCzaM1BaE1zs8YSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fof1zsR2zay1gaO9fowxSVfCgr9nzsyrgrN9foDlht29fof0go8lBo9nBrk9fowxSVfCgr9nzsyrgrN9foD2BoMASVf7BaRlgayCBsRlSVfjqHldgaEYBrRrBsEHzZldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrBaErgoyrzay1SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBaBYzabHBrfHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBoy2goMYgabrSVfjqHldBo9Ygob1Br9lSVfjgoNQ4eldBrBnzsB1goR1zeldzIG9fofYgr80zaBYBeldzoNQ4eldBr8rBsMrBr92BeldzIG9fofYgr80zaBYBeldzoEASVf7BaRlgayCBsRlSVfjqHldBsU7BrB0gobrBpldzIG9fofYgr80zaBYBeldzoNQhS7ASVfrgoU0ga9rgoM1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr80Brynzsy7gHldzIG9fofYgr80zaBYBeldzoNQ4eldBrbYzaUHzsb1BZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyCgr90BoR1BHldzIG9fofYgr80zaBYBeldzoNQ4eldzsEYzsB0zsB7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf0zsMlgoU7BoZ9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgEmROespgvZbZhRYm3c5mwc59dzdvxSVf2BaMYgsb0BrN9fowxSVfCgr9nzsyrgrN9foDlht29foE2Bsf1BaB1Bsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gaMrgsBrza82SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gaRYBaylBoMlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zaMYBsy1zse9fowxSVfCgr9nzsyrgrN9foD24eldgaMHBaU1BoEHBeldzIG9foE7gaBrzs80Brv9fowxSVfCgr9nzsyrgrN9foDlhSHQ4eldBsyHza87gsE7BeldzIG9fofYgr80zaBYBeldzoNQ4eldBofYzaR7grUlSVfjqHldBo9Ygob1Br9lSVfjgC29foUlgsM7zaf2gsN9fowxSVfrgaB7zablgsE0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29fofrBrbHgaB0Ba39fowxSVfCgr9nzsyrgrN9foDlht29fofrgs82gobnBav9fowxSVfCgr9nzsyrgrN9foDnBP7ASVfCgsUlgaB2BaBlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCgrynza80grO9fowxSVfCgr9nzsyrgrN9foDCBP7ASVfrgaErBaUlBoRrSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBrRlgofYzs91SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrRlgo87gryHBZldzIG9fofYgr80zaBYBeldzoNQ4eldBr8ngrMlgo91geldzIG9fofYgr80zaBYBeldzoECBV29foUlgsM7zaf2gsN9fowxSVf7Bs9rgsB2BsR0SVfjqHldBo9Ygob1Br9lSVfjBPHQht29foBYBaR2zsU7zsm9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrUrBa82gaBHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrzaUCBob1Bsy7SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfnBrBnBo97zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf1Baf0BaB1Brm9fowxSVfCgr9nzsyrgrN9foDlht29fobYBsU2gr82BHldzIG9fofYgr80zaBYBeldzoNQhtfAfdBoRbePmRvWZVfjfIG9foElBa8Yzaf0Brv9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2gofYgrU7BaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVf2zablBaU2zs87SVfjqHldBo9Ygob1Br9lSVfjBrZQ4eldBoEYgrE0BrBCSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BV29foEYgr8YgpldzoM6BV29foEYgr81gHldzoM6gry7BrErgrbYzsRlgrU7gIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldBoBHBaMnzsBlSVfjqHldBo9Ygob1Br9lSVfjBoNQ4eldBoRCgoyHgrU2zZldzIG9fofYgr80zaBYBeldzoB2ht29fofnzaBHBrflBo39fowxSVfCgr9nzsyrgrN9foDCgS7ASVfCzs90goU2Ba8HSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrUCgs9HBoRCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr8CBaR7grb7SVfjqHldBo9Ygob1Br9lSVfjBo3Q4eldgsf1BrU7BofnSVfjqHldBo9Ygob1Br9lSVfjgYHQht29foflzabrBobCBsN9fowxSVfCgr9nzsyrgrN9fow79IZp4eldgaMHBaU1BoEHBeldzIG9foflzab2ga8HBoO9fowxSVfCgr9nzsyrgrN9foD2BaNQ4eldBoM1zsBCzsflgpldzIG9fofYgr80zaBYBeldzovQ4eldBoM0BafrBa9nBHldzIG9fofYgr80zaBYBeldzoZQ4eldBrB7zaR2BaRlzeldzIG9fofYgr80zaBYBeldzo8lht29foBrgo8YzsbYBav9fowxSVfCgr9nzsyrgrN9foDHht29foB7gaE7gsECBap9fowxSVfCgr9nzsyrgrN9fowxSVfCBablBsRHzsfnSVfjqHldBeldzIG9foflzsM2gsR0BoO9fowcqHldBs9Ygo9lSVfjBt1l4eldBs9Ygo92SVfjBV1rBsBYBoRHBaECzsy0BaU74eldBs9Ygo9nSVfjBV11Bo97gsElgsMCzaEHBoUY4eldBs9YgoyYSVfjBV1nBrbCBsRYBa9Ygry0BrMYhZHQht29foflzsMHBsRlBs39foDlhS7ASVfrgabYBafHza8lSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BaynBo97gsECBsECBsUlgo8ASVf2gr9ngrO9foDl4oM1gofYgaR2BoE2BoE7Ba8n4eldBs9YgoyYSVfjBV1lza8CgrUHBsf2Bsf2gaMngIHkhS7ASVfCBablgsEHBaE1SVfjBPHQ4eldzs87zaf2Br9nSVfjqHldBo9Ygob1Br9lSVfjqHldBoM0BaEHgsbCgpldzIG9foN9fowxSVfCBablBsRHzsfnSVfjFYG9foEYgr8YBeldzoE6BV29foEYgr8YBZldzoM6BrBYBoR7zsE2go82BsU1Ba9ASVf2gr9ngrO9foDl4o97zsM2zs8CBoylBo9rgaUASVf2gr9nzak9foDl4ob7BsEYgoRrBr80zsMrgsOQSSHQ4eldBoM0BaR2gsM2zeldzoNQhSHQ4eldBoyHzaRCBoErgeldzIG9fofYgr80zaBYBeldz5O3cPgp4eldgaMHBaU1BoEHBeldzIG9fofHBo81gs97Bsp9fowxSVfCgr9nzsyrgrN9foD2gS7ASVfCgr8rBrU2gaB7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaflgsy0ga81zeldzIG9fofYgr80zaBYBeldzoNQhS7ASVfCzs91zabCgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOt29foUlgsM7zaf2gsN9fowxSVf2BaEnBay0grfnSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2BaU1zs9HzaBYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsMYBo91ga9HgeldzIG9fofYgr80zaBYBeldzoylht29foE2Bsf2BoyCBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BsBCBaB7Ba9CSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsEHBoRnga9YBeldzIG9fofYgr80zaBYBeldzovQ4eldBsEYgoBHBaBYgeldzIG9fofYgr80zaBYBeldzoylht29foECBaM0Bs82Bog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2Bo8HBabHBr91SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsf1Bof0zaE0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foECzs87BrfHBsZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2BrEYBsf7zae9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2Brfngo9lBr9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsB7Baylga80BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foE7BsMCBoUrBrv9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf2gaB1ga9lgsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsU7go9YBay1BeldzIG9fofYgr80zaBYBeldzoRlht29foE7gay2zsR2BaN9fowxSVfCgr9nzsyrgrN9foDlht29foE7grf7zablgr39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2gsBCzaE7BsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBsRrgoUlgsf1BHldzIG9fofYgr80zaBYBeldzoNQ4eldBsR7BaRYBo90gHldzIG9fofYgr80zaBYBeldzoRlht29foEHzaMnzaU1zZldzIG9fofYgr80zaBYBeldzoNQ4eldBs82BsBCgsbHBpldzIG9fofYgr80zaBYBeldzoRlht29foEnBsf2zaMlBav9fowxSVfCgr9nzsyrgrN9foDCht29foEnBoEHgry0BrN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2go9lzaRrgsBYSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2go91grE1zaRlSVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2gob2BaR2ga8CSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBs80zaUlgrUngHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foEYBaMngrU1Bog9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grErzsfCgoyCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBs92gsBYgsO9fowxSVfCgr9nzsyrgrN9foDCht29foEYBrb0Bry2Bsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2grUrBrUHBo8nSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsyCBsBHgrb7BZldzIG9fofYgr80zaBYBeldzoylht29foE1BobCBo81Brv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zaU2gaBCBsb0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy7zsM1gr91BpldzIG9fofYgr80zaBYBeldzoNQ4eldBsy7zsBYzaM1geldzIG9fofYgr80zaBYBeldzoRlht29foE1gsfYgoMnBaO9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2za8CgsyCBsZ9fowxSVfCgr9nzsyrgrN9foDlht29foE1go81zsU0Bom9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf2zay7gsblBsBCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBsy0goBHBrf0gpldzIG9fofYgr80zaBYBeldzoRlht29foE0BsM7za9nBsm9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf2zsE1Br97Br81SVfjqHldBo9Ygob1Br9lSVfjBP7ASVf2zsfYgo8lgaf1SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBsbYBs97gsErBpldzIG9fofYgr80zaBYBeldzoRlht29foE0grbngsbrBrk9fowxSVfCgr9nzsyrgrN9foDCht29foE0za82BaBnzsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBaMCBo9lBsbrSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBaf0Brb0grBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoM7BrRrgaMHgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foflga9CBsf7gog9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBa8nzabHzaU1SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBsMrzsB7za91SVfjqHldBo9Ygob1Br9lSVfjBP7ASVfCBsM7grE7goE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE2zay7zabrgHldzIG9fofYgr80zaBYBeldz5O3cPgpht29fof2go9Cgsy0gap9fowxSVfCgr9nzsyrgrN9foDlht29fof2gr81zsEnzap9fowxSVfCgr9nzsyrgrN9foDlht29fof2zsMlBaU7Bok9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCBoErBofCBoE7SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBofrgsB2zaU0geldzIG9fofYgr80zaBYBeldzoNQ4eldBofrzsUlzs9lgpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofCzaBlBafrzsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCBobYza87gsUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoB7go81gs9HSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCBrR7BaR2zsEYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoUlBaf0Boe9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfCga8CgaE0goE1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoU0ga87zs8CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoRHzsy1gsbnzZldzIG9fofYgr80zaBYBeldzoylht29fofnBaMCga8Yzs39fowxSVfCgr9nzsyrgrN9foDCht29fofnBaBrzaE0gsZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoE7grM1goZ9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfCgoB2gab7goyrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBo8nBabnBsyrgZldzIG9fofYgr80zaBYBeldzovQ4eldBo9CzayHga92geldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofYBrRrgoECzsZ9fowxSVfCgr9nzsyrgrN9foDlht29fof1gaf7Bo9CBo39fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzaRlgrfYgsy0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBoyngaynBsblgHldzIG9fofYgr80zaBYBeldzoRlht29fof1grM0ga9HBHldzIG9fofYgr80zaBYBeldzoRlht29fof1grR2BsU1zaZ9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzab1zafCBsy2SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfCzsM2gry0BrUCSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBob2go8CBab0BpldzIG9fofYgr80zaBYBeldzoNQ4eldBob2zaUHzsElSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBobCgoUlgo8CgZldzIG9fofYgr80zaBYBeldzoRlht29fof0BrBngaRHzsO9fowxSVfCgr9nzsyrgrN9foDCht29fof0Br8YgrM1gsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfCzsR7BoElgr91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrMHzsylBof1SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrM1Bo9nBo91gHldzIG9fofYgr80zaBYBeldzoRlht29foB2Baf0BsUlBrp9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBsMHgaRrBobHSVfjqHldBo9Ygob1Br9lSVfjBP7ASVfrBsEYza90Brb2SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrECgsB2BaBHgpldzIG9fofYgr80zaBYBeldzovQ4eldBrE7grBlBsbYgZldzIG9fofYgr80zaBYBeldzoRlht29foB2gabCgrMrgam9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsMHBs8CBaZ9fowxSVfCgr9nzsyrgrN9foDlht29foB2gsf7zaE7gsv9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBs82gry2Ba9lSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrEYBrBlBsE2geldzIG9fofYgr80zaBYBeldzovQ4eldBrE1BoyHgoU0gHldzIG9fofYgr80zaBYBeldzoRlht29foBCBrRnBa97zsO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBoU1BaUngo9nSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrfngaBHgoM2BHldzIG9fofYgr80zaBYBeldzovQ4eldBrf1BabCgoB2BHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCzsM1zs8rBag9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrBrMHBa8ngsf1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrBCBof2gsE2zeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBrga97BsEHgop9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrBr8lgsUYzaE0SVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrBr8Hzay2grUrSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrUlBaEnBoRnzeldzIG9fofYgr80zaBYBeldzoRlht29foB7BrBrgrb7zap9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrgaB1gaR0goRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrU7gaUCzs8CgHldzIG9fofYgr80zaBYBeldzoylht29foB7gaR0goblzZldzIG9fofYgr80zaBYBeldzoRlht29foB7gsE2gob2grv9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrga8CBaB7BoynSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgay7Bsf1BoBrSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBrU1go9YBaE0BeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgrMrgoM1zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBHgr82Bsblgoe9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgsyCgsR1Br8YSVfjqHldBo9Ygob1Br9lSVfjBI7ASVfrgsyYBrECBok9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrgoMYgsyYza9CSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBr82BoRrBa8nBHldzIG9fofYgr80zaBYBeldzovQ4eldBr82grEYzabCBHldzIG9fofYgr80zaBYBeldzoRlht29foBngaR1Brf0Brm9fowxSVfCgr9nzsyrgrN9foDlht29foBngoMCBoR2Bag9fowxSVfCgr9nzsyrgrN9foDlht29foBngryHgafCBaZ9fowxSVfCgr9nzsyrgrN9foDCht29foBnzaBHBs8CBak9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrM2zaf2BoRHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldBr92gsbHgsRYBHldzIG9fofYgr80zaBYBeldzoRlht29foBYgo91zsElgrO9fowxSVfCgr9nzsyrgrN9foDCht29foBYzayrzaf0gov9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfrgrbrBoR1zsp9fowxSVfCgr9nzsyrgrN9foDlht29foB1ga91ga91Bsg9fowxSVfCgr9nzsyrgrN9foDHBP7ASVfrzaU1ga8nzsbrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBrynBryrBrBlgpldzIG9fofYgr80zaBYBeldzovQ4eldBry0BoMHzs81BHldzIG9fofYgr80zaBYBeldzoRlht29foB0BaMrBa9Czae9fowxSVfCgr9nzsyrgrN9foDlht29foB0Ba8rgaMHBov9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsE7zafCgsO9fowxSVfCgr9nzsyrgrN9foD1BP7ASVfrzsfYgo8Ygo9HSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldBrbYgsfYgsfrBHldzIG9fofYgr80zaBYBeldzovQ4eldBrb1zsEYgrM1gHldzIG9fofYgr80zaBYBeldzoRlht29foUlBa9rBryngom9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf7BaECgaMCzayHSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaMHgayYBrN9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7BablgaMYBs91SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgaErzsMYBsyYgZldzIG9fofYgr80zaBYBeldzoNQ4eldgaEHgsBCgsf0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU2grBrBayYzam9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVf7BsyYBaf7BoR0SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgaf2gr81BabHzZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUCzabHgsBrBog9fowxSVfCgr9nzsyrgrN9foD1BP7ASVf7Boy0goRnBeldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUrBsflgaRrBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gayYBsR2BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7gsBrzay7zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foU7zaylBry0gHldzIG9fofYgr80zaBYBeldz5O3cPgpht29foUYgayHgoylgZldzIG9fofYgr80zaBYBeldzovQ4eldgabCBrbngsyYSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsM7grb7BrRYSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsE2zs8nzaBnSVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgsB7goyYgrflSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgsBHgrMHBryCSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsbrBsEYgoUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgsb1grfHzaBnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoErBrR1zs80SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgofHgaUrBafYSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldgoB2BaR7Bs9YSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoUCBrE1gsfnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoRnzsR2goR0SVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldgoyrBoECgsb7SVfjqHldBo9Ygob1Br9lSVfjzaNQ4eldgoyHBrfrgop9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfnzabCBoMYgsk9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBaMYgs90BsN9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfYBobrgsb7Bom9fowxSVfCgr9nzsyrgrN9foDlht29fo9nBsM0BabrBpldzIG9fofYgr80zaBYBeldz5O3cPgpht29fo91zsb0zaM0zZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyngsB2Bob1BpldzIG9fofYgr80zaBYBeldz5O3cPgpht29foyYBo81grBHSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldzsB2zs97gaBnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsUYgrUHgrUnSVfjqHldBo9Ygob1Br9lSVfjgsNQ4eldzsRrzsb1BsUCSVfjqHldBo9Ygob1Br9lSVfjBI7ASVf0gs81Br9CBoO9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0grM0grEHgam9fowxSVfCgr9nzsyrgrN9foDHBP7ASVf0zab7grErBaN9fowxSVfCgr9nzsyrgrN9foDlhSHQhtfAfdBoRbZasHvEmZvhUFpCfoDdqHldBsy1zaBHBayrgeldzIG9fofYgr80zaBYBeldz5O3cPgpht29fofHBobYgrynzsm9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQNXSfyvdNa95QH8n3wc59dzdvxSVf2zsMCgaElzsMnSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBo91gaUCBab2BeldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7gCcYZoXip6OCfjfIG9foB0zayHgaEHBsO9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfHzsy7BsE2zsv9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQi8FGpcieIfoDdqHldBoEHBsBlgoRnBZldzIG9fofYgr80zaBYBeldz5O3cPgpht29foBCgofngrElgoe9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQi95Zp9Ym3c5mwc59dzdvxSVfCBa91BoM1zsU7SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoE7zsB7gaE0gpldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtS7H3cIZ3cVNO8S9dzdvxSVfrgafCBob1zsg9fowxSVfCgr9nzsyrgrN9fow58F2rOS7ASVfHga9rzaM1zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fIHQfdldfCgtmRgWRbmeRpQgcYOpfV8yUYvKkFgDXF0IfoDdqHldBsE0go8Hgs9CBZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29fof2gsRlzs8ngoe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQWcdNH9nRdzdvxSVf2goBHBsy2gaf1SVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldBs9rBs8Hgaf7BeldzIG9fofYgr80zaBYBeldz5O3cPgphS7d4VfofHveU7QtmEZtSHvHc50wc59dzdvxSVf2BoRHgoB0BofrSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQ4eldBoBngrMlBr9CBHldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldhS7d4VfofHveU7QtmEZtSHg3O5RytiZ3OVfjfIG9fofYzayngs92gak9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrgobrgab7BsE0SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRn3395ZbfoDdqHldBs91gobrzs87zZldzIG9fofYgr80zaBYBeldzpldSe29fpGkSe29fpldht29foE1zaB7Bsf7goe9fowxSVfCgr9nzsyrgrN9fow58F2rOSHQfdldfCgtmRgWRbmeRpQsciQYfiHKkipKcdfjfIG9foECgsB0BaE2zap9fowxSVfCgr9nzsyrgrN9fow9fp29SVvcSZ29SVv9fI7ASVfrBa9rzaRCzsErSVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtfAfdBoRbZasHvEmZvhRYm3c5mwc59dzdvxSVfCzs8HBaBHzs9lSVfjqHldBo9Ygob1Br9lSVfjSVv9SeldFHH9SeldSVvQ4eldgoU0grUHzaB1SVfjqHldBo9Ygob1Br9lSVfjO5eA9nZQhtvQ"))
slot_0_53_31()
slot_0_33_2.list:update(slot_0_52_33())

slot_0_33_1 = nil
slot_0_33_0 = {}
slot_0_34_1 = 0
slot_0_35_2 = false
slot_0_36_4 = nil
slot_0_37_7 = 0
slot_0_38_10 = 0
slot_0_39_12 = false
slot_0_40_14 = {
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
slot_0_41_17 = 0
slot_0_42_22 = 0
slot_0_43_27 = {}
slot_0_44_29 = slot_0_9_0.antiaim.angles
slot_0_45_27 = {}
slot_0_45_27.__index = slot_0_45_27

function slot_0_45_27.clear(arg_223_0)
	for iter_223_0 in pairs(arg_223_0) do
		arg_223_0[iter_223_0] = nil
	end
end

function slot_0_45_27.copy(arg_224_0, arg_224_1)
	for iter_224_0, iter_224_1 in pairs(arg_224_1) do
		arg_224_0[iter_224_0] = iter_224_1
	end
end

function slot_0_45_27.unset(arg_225_0)
	slot_0_44_29.enabled:override()
	slot_0_44_29.pitch:override()
	slot_0_44_29.yaw[1]:override()
	slot_0_44_29.yaw[2]:override()
	slot_0_44_29.yaw[3]:override()
	slot_0_44_29.yaw[4]:override()
	slot_0_44_29.yaw[5]:override()
	slot_0_44_29.yaw_modifier[1]:override()
	slot_0_44_29.yaw_modifier[2]:override()
	slot_0_44_29.body_yaw[1]:override()
	slot_0_44_29.body_yaw[2]:override()
	slot_0_44_29.body_yaw[3]:override()
	slot_0_44_29.body_yaw[4]:override()
	slot_0_44_29.body_yaw[5]:override()
	slot_0_44_29.body_yaw[6]:override()
	slot_0_44_29.freestanding[1]:override()
	slot_0_44_29.freestanding[2]:override()
	slot_0_44_29.freestanding[3]:override()
	slot_0_44_29.extended_angles[1]:override()
	slot_0_44_29.extended_angles[2]:override()
	slot_0_44_29.extended_angles[3]:override()
end

function slot_0_45_27.set(arg_226_0)
	slot_0_44_29.enabled:override(arg_226_0.enabled)
	slot_0_44_29.pitch:override(arg_226_0.pitch)
	slot_0_44_29.yaw[1]:override(arg_226_0.yaw)
	slot_0_44_29.yaw[2]:override(arg_226_0.yaw_base)
	slot_0_44_29.yaw[3]:override(arg_226_0.yaw_offset)
	slot_0_44_29.yaw[4]:override(arg_226_0.avoid_backstab)
	slot_0_44_29.yaw[5]:override(arg_226_0.hidden)
	slot_0_44_29.yaw_modifier[1]:override(arg_226_0.yaw_modifier)
	slot_0_44_29.yaw_modifier[2]:override(arg_226_0.modifier_offset)
	slot_0_44_29.body_yaw[1]:override(arg_226_0.body_yaw)
	slot_0_44_29.body_yaw[2]:override(arg_226_0.inverter)
	slot_0_44_29.body_yaw[3]:override(arg_226_0.left_limit)
	slot_0_44_29.body_yaw[4]:override(arg_226_0.right_limit)
	slot_0_44_29.body_yaw[5]:override(arg_226_0.options)
	slot_0_44_29.body_yaw[6]:override(arg_226_0.freestanding_body_yaw)
	slot_0_44_29.freestanding[1]:override(arg_226_0.freestanding)
	slot_0_44_29.freestanding[2]:override(arg_226_0.freestanding_disable_yaw_modifiers)
	slot_0_44_29.freestanding[3]:override(arg_226_0.freestanding_body_freestanding)
	slot_0_44_29.extended_angles[1]:override(arg_226_0.extended_angles)
	slot_0_44_29.extended_angles[2]:override(arg_226_0.extended_angles_pitch)
	slot_0_44_29.extended_angles[3]:override(arg_226_0.extended_angles_roll)
end

setmetatable(slot_0_43_27, slot_0_45_27)

slot_0_44_28 = {}
slot_0_45_26 = false
slot_0_46_26 = 0

function slot_0_47_28()
	slot_0_45_26 = not slot_0_45_26
end

function slot_0_48_31()
	slot_0_46_26 = slot_0_46_26 + 1
end

function slot_0_49_32(arg_229_0)
	if not arg_229_0.force_target_yaw:get() then
		return
	end

	if slot_0_25_0.defensive_ticks == 0 then
		return
	end

	slot_0_43_27.yaw_left = -9
	slot_0_43_27.yaw_right = 6
	slot_0_43_27.yaw_modifier = "Disabled"
	slot_0_43_27.modifier_offset = 0
	slot_0_43_27.body_yaw = true
	slot_0_43_27.inverter = false
	slot_0_43_27.left_limit = 60
	slot_0_43_27.right_limit = 60
	slot_0_43_27.options = {}
end

function slot_0_50_33(arg_230_0, arg_230_1)
	local var_230_0

	if arg_230_1.delay:get() then
		local var_230_1 = arg_230_1.delay_mode:get()

		if var_230_1 == "Default" then
			local var_230_2 = arg_230_1.delay_value:get()
			local var_230_3 = arg_230_1.delay_random:get()

			if var_230_3 > 0 then
				var_230_2 = utils.random_int(var_230_2, var_230_3)
			end

			var_230_0 = var_230_2
		end

		if var_230_1 == "Custom" then
			local var_230_4 = arg_230_1.delay_count:get()
			local var_230_5 = math.random(1, var_230_4)

			if arg_230_1.delay_values[var_230_5] ~= nil then
				var_230_0 = arg_230_1.delay_values[var_230_5]:get()
			end
		end
	end

	arg_230_0.delay_affects_modifier, arg_230_0.delay = arg_230_1.delay_affect_modifier:get(), var_230_0
end

function slot_0_51_35(arg_231_0, arg_231_1)
	local var_231_0 = arg_231_1.pitch:get()
	local var_231_1 = arg_231_1.pitch_speed:get()
	local var_231_2 = arg_231_1.pitch_offset_1:get()
	local var_231_3 = arg_231_1.pitch_offset_2:get()

	if var_231_0 == "Off" then
		return
	end

	if var_231_0 == "Static" then
		arg_231_0.pitch_offset = var_231_2

		return
	end

	if var_231_0 == "Jitter" then
		arg_231_0.pitch_offset = slot_0_45_26 and var_231_3 or var_231_2

		return
	end

	if var_231_0 == "Spin" then
		local var_231_4 = globals.curtime * var_231_1 * 0.1

		arg_231_0.pitch_offset = slot_0_8_0.lerp(var_231_2, var_231_3, var_231_4 % 1)

		return
	end

	if var_231_0 == "Random" then
		arg_231_0.pitch_offset = utils.random_int(var_231_2, var_231_3)

		return
	end

	if var_231_0 == "Angelic" then
		arg_231_0.pitch_offset = math.map(math.abs(globals.realtime % 0.3 - 0.15), 0, 0.15, -89, 89)

		return
	end
end

function slot_0_52_32(arg_232_0, arg_232_1)
	local var_232_0 = arg_232_1.yaw_modifier:get()

	if var_232_0 == "Off" then
		return
	end

	local var_232_1 = arg_232_1.modifier_offset:get()

	if var_232_0 == "Offset" then
		arg_232_0.yaw_offset = 0
		arg_232_0.yaw_modifier = "Offset"
		arg_232_0.modifier_offset = var_232_1
	end

	if var_232_0 == "Center" then
		if arg_232_1.delay_affect_modifier:get() then
			arg_232_0.yaw_left = arg_232_0.yaw_left - var_232_1 * 0.5
			arg_232_0.yaw_right = arg_232_0.yaw_right + var_232_1 * 0.5
		else
			local var_232_2 = bit.band(slot_0_46_26, 1) ~= 0

			arg_232_0.yaw_offset = arg_232_0.yaw_offset + (var_232_2 and var_232_1 or -var_232_1) * 0.5
		end
	end

	if var_232_0 == "Skitter" then
		arg_232_0.yaw_offset = 0
		arg_232_0.yaw_modifier = "Skitter"
		arg_232_0.modifier_offset = var_232_1
	end

	slot_0_50_33(arg_232_0, arg_232_1)
end

function slot_0_53_30(arg_233_0, arg_233_1)
	local var_233_0 = arg_233_1.yaw:get()

	if var_233_0 == "Off" then
		return
	end

	local var_233_1 = arg_233_1.yaw_speed:get()
	local var_233_2 = arg_233_1.yaw_offset:get()

	arg_233_0.yaw_left = 0
	arg_233_0.yaw_right = 0
	arg_233_0.yaw_offset = 0
	arg_233_0.delay = 1

	if var_233_0 == "Static" then
		arg_233_0.yaw_offset = var_233_2
	end

	if var_233_0 == "Spin" then
		local var_233_3 = globals.curtime * var_233_1 * 0.1
		local var_233_4 = var_233_2 * 0.5

		arg_233_0.yaw_offset = -(180 + slot_0_8_0.lerp(-var_233_4, var_233_4, var_233_3 % 1))
	end

	if var_233_0 == "Random" then
		local var_233_5 = math.abs(var_233_2 * 0.5)

		arg_233_0.yaw_offset = 180 + utils.random_int(-var_233_5, var_233_5)
	end

	if var_233_0 == "Left/Right" then
		arg_233_0.yaw_offset = 0
		arg_233_0.yaw_left = arg_233_0.yaw_left + arg_233_1.yaw_left:get()
		arg_233_0.yaw_right = arg_233_0.yaw_right + arg_233_1.yaw_right:get()
	end

	if var_233_0 == "Side-Based" then
		arg_233_0.yaw_offset = 0
		arg_233_0.yaw_left = arg_233_0.yaw_left - 90 + utils.random_int(-var_233_2, var_233_2)
		arg_233_0.yaw_right = arg_233_0.yaw_right + 90 + utils.random_int(-var_233_2, var_233_2)
	end

	slot_0_52_32(arg_233_0, arg_233_1)
end

function slot_0_54_31(arg_234_0, arg_234_1)
	local var_234_0

	if arg_234_1.tickbase:get() == "Ticks" then
		var_234_0 = arg_234_1.tickbase_ticks:get()
	end

	if arg_234_1.tickbase:get() == "Random" then
		var_234_0 = utils.random_int(arg_234_1.tickbase_min:get(), arg_234_1.tickbase_max:get())
	end

	if var_234_0 ~= nil then
		arg_234_0.force_defensive = arg_234_0.command_number % var_234_0 == 0
	end
end

function slot_0_55_35(arg_235_0, arg_235_1)
	local var_235_0 = 1

	if arg_235_1.delay:get() then
		local var_235_1 = arg_235_1.delays[1]:get()
		local var_235_2 = arg_235_1.delays[2]:get()

		var_235_0 = math.max(1, utils.random_int(var_235_1, var_235_2))
	end

	arg_235_0.delay = var_235_0
end

function slot_0_44_28.update(arg_236_0, arg_236_1)
	slot_0_43_27.hidden = false

	slot_0_9_0.ragebot.main.hide_shots[2]:override()
	slot_0_9_0.ragebot.main.double_tap[2]:override()

	if arg_236_1.choked_commands == 0 then
		slot_0_47_28()
		slot_0_48_31()
	end
end

function slot_0_44_28.apply(arg_237_0, arg_237_1, arg_237_2)
	if arg_237_2.force_break_lc ~= nil and arg_237_2.force_break_lc:get() then
		slot_0_43_27.hidden = true

		slot_0_9_0.ragebot.main.hide_shots[2]:override("Break LC")
		slot_0_9_0.ragebot.main.double_tap[2]:override("Always On")
		slot_0_54_31(arg_237_1, arg_237_2)
	end

	if arg_237_2.enabled:get() then
		local var_237_0 = {}

		slot_0_49_32(arg_237_2)
		slot_0_51_35(var_237_0, arg_237_2)
		slot_0_53_30(var_237_0, arg_237_2)

		slot_0_43_27.defensive = var_237_0

		return true
	end

	return false
end

slot_0_45_25 = {}
slot_0_46_25 = slot_0_23_0.antiaim.settings.invert_flick
slot_0_47_27 = 0

function slot_0_48_30()
	if rage.exploit:get() ~= 1 then
		return false
	end

	local var_238_0 = entity.get_local_player()

	if var_238_0 == nil then
		return false
	end

	local var_238_1 = var_238_0:get_player_weapon()

	if var_238_1 == nil then
		return false
	end

	local var_238_2 = var_238_1:get_weapon_info()

	if var_238_2 == nil or var_238_2.is_revolver then
		return false
	end

	return true
end

function slot_0_45_25.update(arg_239_0, arg_239_1, arg_239_2)
	if not arg_239_2.flick_enabled:get() then
		return false
	end

	if not slot_0_48_30() then
		return false
	end

	if arg_239_1.choked_commands == 0 then
		slot_0_47_27 = slot_0_47_27 + 1
	end

	arg_239_1.force_defensive = arg_239_1.command_number % 7 == 0

	if slot_0_25_0.defensive_ticks > 0 then
		local var_239_0 = arg_239_2.flick_speed:get()
		local var_239_1 = arg_239_2.flick_speed_random:get()

		if var_239_1 > 0 then
			var_239_0 = var_239_0 + utils.random_int(-var_239_1, var_239_1)
			var_239_0 = math.clamp(var_239_0, 2, 10)
		end

		if var_239_0 < slot_0_25_0.defensive_ticks - slot_0_25_0.max_defensive_ticks then
			return
		end
	end

	local var_239_2 = arg_239_2.flick_limit:get()

	slot_0_43_27.yaw = "Backward"
	slot_0_43_27.yaw_offset = 0
	slot_0_43_27.yaw_left = 0
	slot_0_43_27.yaw_right = 0
	slot_0_43_27.hidden = true
	slot_0_43_27.yaw_modifier = "Disabled"
	slot_0_43_27.modifier_offset = 0
	slot_0_43_27.body_yaw = true
	slot_0_43_27.inverter = false
	slot_0_43_27.left_limit = var_239_2
	slot_0_43_27.right_limit = var_239_2
	slot_0_43_27.options = {}

	local var_239_3 = {}
	local var_239_4 = arg_239_2.flick_pitch:get()
	local var_239_5 = arg_239_2.flick_yaw:get()
	local var_239_6 = arg_239_2.flick_yaw_random:get()

	var_239_3.yaw_offset, var_239_3.pitch_offset = var_239_5 + utils.random_int(-var_239_6 * 0.6, var_239_6 * 0.6), var_239_4

	local var_239_7 = slot_0_46_25.enabled:get()

	if arg_239_2.flick_mode:get() == "Silent" and bit.band(slot_0_47_27, 1) ~= 0 then
		var_239_7 = not var_239_7
	end

	if var_239_7 then
		var_239_3.yaw_offset = -var_239_3.yaw_offset
	end

	slot_0_43_27.defensive = var_239_3

	return true
end

slot_0_46_24 = {}
slot_0_47_26 = slot_0_23_0.antiaim.recorder
slot_0_48_29 = slot_0_23_0.antiaim.builder
slot_0_49_31 = "dWP7FQ3AEliGeqr98jbUM64XmCfc05gw1JDHhaYBKk2tRxVypInNouvsLZzOST+/="
slot_0_50_32 = {}
slot_0_51_34 = 0

function slot_0_52_31(arg_240_0)
	local var_240_0, var_240_1 = pcall(json.parse, arg_240_0)

	if not var_240_0 then
		return false, "Can't parse data"
	end

	return true, var_240_1
end

function slot_0_53_29(arg_241_0)
	local var_241_0, var_241_1 = pcall(slot_0_0_0.decode, arg_241_0, slot_0_49_31)

	if not var_241_0 then
		return false, "Can't decode data"
	end

	return true, var_241_1
end

function slot_0_54_30(arg_242_0)
	if type(arg_242_0) == "table" then
		arg_242_0 = "[ " .. table.concat(arg_242_0, ", ") .. " ]"
	end

	return arg_242_0
end

function slot_0_55_34(arg_243_0, arg_243_1)
	table.insert(arg_243_0, {
		measure = vector(0, arg_243_1)
	})

	return arg_243_1
end

function slot_0_56_32(arg_244_0, arg_244_1)
	local var_244_0 = slot_0_15_0.measure_text(1, "", arg_244_1)
	local var_244_1 = {
		text = arg_244_1,
		measure = var_244_0
	}

	table.insert(arg_244_0, var_244_1)

	return var_244_1
end

function slot_0_57_29(arg_245_0, arg_245_1, arg_245_2)
	local var_245_0 = string.format("%s: \a{Link Active}%s\aDEFAULT", arg_245_1, slot_0_54_30(arg_245_2))

	return slot_0_56_32(arg_245_0, var_245_0)
end

function slot_0_58_28(arg_246_0, arg_246_1, arg_246_2)
	if arg_246_0 == arg_246_1 and arg_246_0 == arg_246_2 then
		return ui.get_icon("arrow-right") .. slot_0_3_0:rep(3)
	end

	if arg_246_0 == arg_246_1 then
		return ui.get_icon("arrow-down") .. slot_0_3_0:rep(4)
	end

	if arg_246_0 == arg_246_2 then
		return ui.get_icon("arrow-up") .. slot_0_3_0:rep(4)
	end

	if arg_246_1 < arg_246_0 and arg_246_0 < arg_246_2 then
		return slot_0_3_0:rep(2) .. ui.get_icon("pipe") .. slot_0_3_0:rep(6)
	end

	return slot_0_3_0:rep(9)
end

function slot_0_59_23(arg_247_0)
	if arg_247_0 == nil then
		return {}
	end

	local var_247_0 = arg_247_0.data
	local var_247_1 = arg_247_0.sequence_start
	local var_247_2 = arg_247_0.sequence_end

	if var_247_0 == nil then
		return {}
	end

	local var_247_3 = {}

	for iter_247_0 = 1, #var_247_0 do
		local var_247_4 = var_247_0[iter_247_0]

		var_247_3[iter_247_0] = slot_0_5_0(slot_0_58_28(iter_247_0, var_247_1, var_247_2), "\a{Link Active}", iter_247_0, "\aDEFAULT", ":", " ", "Yaw: ", "\a{Link Active}", var_247_4[4], "\aDEFAULT", " ", "Modifier: ", "\a{Link Active}", var_247_4[8], "\aDEFAULT")
	end

	return var_247_3
end

function slot_0_60_15()
	return slot_0_48_29.state:get()
end

function slot_0_61_13(arg_249_0)
	return slot_0_48_29[arg_249_0]
end

function slot_0_62_10(arg_250_0, arg_250_1)
	local var_250_0, var_250_1 = pcall(json.stringify, arg_250_1)

	if not var_250_0 then
		return false
	end

	arg_250_0 = arg_250_0.recorder

	if arg_250_0 == nil then
		return false
	end

	arg_250_0.record:set(var_250_1)

	return true
end

function slot_0_63_10(arg_251_0, arg_251_1, arg_251_2)
	arg_251_0.pitch = arg_251_1[1]
	arg_251_0.yaw = arg_251_1[2]
	arg_251_0.yaw_base = arg_251_1[3]
	arg_251_0.yaw_offset = arg_251_1[4]
	arg_251_0.hidden = arg_251_1[6]
	arg_251_0.yaw_modifier = arg_251_1[7]
	arg_251_0.modifier_offset = arg_251_1[8]
	arg_251_0.body_yaw = arg_251_1[9]
	arg_251_0.inverter = arg_251_1[10]
	arg_251_0.left_limit = arg_251_1[11]
	arg_251_0.right_limit = arg_251_1[12]
	arg_251_0.options = arg_251_1[13]
	arg_251_0.freestanding_body_yaw = arg_251_1[14]
	arg_251_0.delay = nil

	if arg_251_2 then
		arg_251_0.inverter = not arg_251_0.inverter
	end
end

function slot_0_64_8()
	local var_252_0 = slot_0_59_23(slot_0_19_0.recorder)

	slot_0_47_26.sequence_list:update(var_252_0)
end

function slot_0_65_8(arg_253_0)
	slot_0_47_26.sequence_list:visibility(arg_253_0)
	slot_0_47_26.set_start_button:visibility(arg_253_0)
	slot_0_47_26.set_end_button:visibility(arg_253_0)
	slot_0_47_26.save_button:visibility(arg_253_0)
	slot_0_47_26.import_button:visibility(not arg_253_0)
end

function slot_0_66_8()
	for iter_254_0 = 0, #slot_0_20_0.states do
		local var_254_0 = slot_0_20_0.states[iter_254_0]
		local var_254_1 = slot_0_61_13(var_254_0)

		if var_254_1 == nil then
			-- block empty
		else
			local var_254_2 = var_254_1.recorder

			if var_254_2 == nil then
				-- block empty
			else
				local var_254_3 = var_254_2.record:get()
				local var_254_4, var_254_5 = pcall(json.parse, var_254_3)

				if not var_254_4 then
					-- block empty
				else
					slot_0_50_32[var_254_0] = var_254_5
				end
			end
		end
	end
end

function slot_0_46_24.update(arg_255_0, arg_255_1)
	local var_255_0 = slot_0_61_13(arg_255_1)

	if var_255_0 == nil then
		return
	end

	local var_255_1 = var_255_0.recorder

	if var_255_1 == nil then
		return
	end

	local var_255_2 = slot_0_19_0.recorder.data
	local var_255_3 = slot_0_19_0.recorder.capture

	if var_255_2 ~= nil and var_255_3 ~= nil then
		local var_255_4 = slot_0_47_26.sequence_list:get()

		if var_255_4 == nil then
			return false
		end

		local var_255_5 = var_255_2[var_255_4]

		if var_255_5 == nil then
			return false
		end

		local var_255_6 = var_255_1.inverse_inverter:get()

		slot_0_63_10(slot_0_43_27, var_255_5, var_255_6)

		return true
	end

	local var_255_7 = slot_0_50_32[arg_255_1]

	if var_255_7 == nil then
		return false
	end

	local var_255_8 = #var_255_7

	if globals.choked_commands == 0 then
		if var_255_8 <= slot_0_51_34 then
			slot_0_51_34 = 0
		end

		slot_0_51_34 = slot_0_51_34 + 1
	end

	local var_255_9 = var_255_7[slot_0_51_34]

	if var_255_9 == nil then
		return false
	end

	local var_255_10 = var_255_1.inverse_inverter:get()

	slot_0_63_10(slot_0_43_27, var_255_9, var_255_10)

	return true
end

function slot_0_67_8()
	slot_0_66_8()
end

slot_0_68_8 = nil

function slot_0_69_6()
	if slot_0_19_0.recorder.capture == nil then
		return
	end

	local var_257_0 = slot_0_47_26.sequence_list:get()

	if var_257_0 > slot_0_19_0.recorder.sequence_end then
		slot_0_19_0.recorder.sequence_end = #slot_0_19_0.recorder.data
	end

	slot_0_19_0.recorder.sequence_start = var_257_0

	slot_0_64_8()
end

function slot_0_70_4()
	if slot_0_19_0.recorder.capture == nil then
		return
	end

	local var_258_0 = slot_0_47_26.sequence_list:get()

	if var_258_0 < slot_0_19_0.recorder.sequence_start then
		slot_0_19_0.recorder.sequence_start = 1
	end

	slot_0_19_0.recorder.sequence_end = var_258_0

	slot_0_64_8()
end

function slot_0_71_4()
	local var_259_0 = slot_0_60_15()

	if var_259_0 == nil then
		return
	end

	local var_259_1 = slot_0_61_13(var_259_0)

	if var_259_1 == nil then
		return
	end

	local var_259_2 = slot_0_19_0.recorder.data

	if var_259_2 == nil then
		return
	end

	local var_259_3 = {}
	local var_259_4 = slot_0_19_0.recorder.sequence_start
	local var_259_5 = slot_0_19_0.recorder.sequence_end

	for iter_259_0 = var_259_4, var_259_5 do
		table.insert(var_259_3, var_259_2[iter_259_0])
	end

	slot_0_62_10(var_259_1, var_259_3)

	slot_0_19_0.recorder.data = nil
	slot_0_19_0.recorder.capture = nil
	slot_0_19_0.recorder.sequence_start = nil
	slot_0_19_0.recorder.sequence_end = nil

	slot_0_64_8()
	slot_0_65_8(false)
	slot_0_66_8()
end

function slot_0_72_4()
	local var_260_0 = slot_0_60_15()

	if var_260_0 == nil then
		return
	end

	if slot_0_61_13(var_260_0) == nil then
		return
	end

	local var_260_1 = slot_0_2_0.get()

	if var_260_1 == nil then
		return nil
	end

	local var_260_2, var_260_3 = slot_0_53_29(var_260_1)

	if not var_260_2 or var_260_3 == nil then
		return
	end

	local var_260_4, var_260_5 = slot_0_52_31(var_260_3)
	local var_260_6 = var_260_5

	if not var_260_4 or var_260_6 == nil then
		return
	end

	local var_260_7 = #var_260_6

	slot_0_19_0.recorder.data = var_260_6
	slot_0_19_0.recorder.capture = var_260_0
	slot_0_19_0.recorder.sequence_start = 1
	slot_0_19_0.recorder.sequence_end = var_260_7

	slot_0_65_8(true)
	slot_0_64_8()
end

slot_0_47_26.set_start_button:set_callback(slot_0_69_6)
slot_0_47_26.set_end_button:set_callback(slot_0_70_4)
slot_0_47_26.save_button:set_callback(slot_0_71_4)
slot_0_47_26.import_button:set_callback(slot_0_72_4)
events.update_records(slot_0_67_8)
slot_0_65_8(false)
slot_0_66_8()

slot_0_47_25 = {}
slot_0_48_28 = slot_0_23_0.antiaim.builder
slot_0_49_30 = nil

function slot_0_50_31(arg_261_0)
	local var_261_0 = {}

	if arg_261_0.x > 0 then
		table.insert(var_261_0, "Forward")
	end

	if arg_261_0.x < 0 then
		table.insert(var_261_0, "Backward")
	end

	if arg_261_0.y > 0 then
		table.insert(var_261_0, "Right")
	end

	if arg_261_0.y < 0 then
		table.insert(var_261_0, "Left")
	end

	return table.concat(var_261_0, "-")
end

function slot_0_51_33(arg_262_0)
	local var_262_0 = arg_262_0.angles
	local var_262_1 = var_262_0.yaw_offset:get()
	local var_262_2
	local var_262_3
	local var_262_4 = var_262_0.random:get()
	local var_262_5 = var_262_0.add_yaw:get()

	if var_262_5 then
		var_262_2 = var_262_0.yaw_left:get()
		var_262_3 = var_262_0.yaw_right:get()
	end

	if var_262_0.direction ~= nil then
		local var_262_6 = var_262_0[slot_0_50_31(vector(slot_0_24_0.forwardmove, slot_0_24_0.sidemove))]

		if var_262_6 ~= nil and var_262_6.enabled:get() then
			var_262_1 = var_262_6.yaw_offset:get()

			if var_262_5 then
				var_262_2 = var_262_6.yaw_left:get()
				var_262_3 = var_262_6.yaw_right:get()
			end
		end
	end

	if var_262_4 > 0 and var_262_2 ~= nil and var_262_3 ~= nil then
		local var_262_7 = var_262_4 * 0.01
		local var_262_8 = utils.random_float(-var_262_7 * 0.6, var_262_7 * 0.6)

		var_262_2 = var_262_2 + var_262_2 * var_262_8
		var_262_3 = var_262_3 + var_262_3 * var_262_8
	end

	slot_0_43_27.yaw = "Backward"
	slot_0_43_27.yaw_offset = var_262_1
	slot_0_43_27.yaw_left = var_262_2
	slot_0_43_27.yaw_right = var_262_3
end

function slot_0_52_30(arg_263_0)
	local var_263_0 = arg_263_0.angles
	local var_263_1 = var_263_0.yaw_jitter:get()
	local var_263_2 = var_263_0.jitter_offset:get()

	if var_263_1 == "Off" then
		slot_0_43_27.yaw_modifier = "Disabled"
		slot_0_43_27.modifier_offset = nil

		return
	end

	local var_263_3 = var_263_0.random:get()

	if var_263_3 > 0 then
		local var_263_4 = var_263_3 * 0.01

		var_263_2 = var_263_2 + var_263_2 * utils.random_float(-var_263_4 * 0.6, var_263_4 * 0.6)
	end

	slot_0_43_27.yaw_modifier = var_263_1
	slot_0_43_27.modifier_offset = var_263_2

	if var_263_0.way_values ~= nil then
		slot_0_43_27.way = {}

		for iter_263_0 = 1, var_263_0.way_count:get() do
			slot_0_43_27.way[iter_263_0] = var_263_0.way_values[iter_263_0]:get()
		end
	end
end

function slot_0_53_28(arg_264_0)
	local var_264_0 = arg_264_0.angles
	local var_264_1 = var_264_0.body_yaw:get()
	local var_264_2 = var_264_0.left_limit:get()
	local var_264_3 = var_264_0.right_limit:get()
	local var_264_4 = var_264_1 ~= "Off"

	if var_264_4 then
		slot_0_43_27.options = {}
		slot_0_43_27.left_limit = var_264_2
		slot_0_43_27.right_limit = var_264_3

		if var_264_1 == "Left" then
			slot_0_43_27.inverter = true
			slot_0_43_27.right_limit = var_264_2
		end

		if var_264_1 == "Right" then
			slot_0_43_27.inverter = false
			slot_0_43_27.left_limit = var_264_3
		end

		if var_264_1 == "Jitter" then
			table.insert(slot_0_43_27.options, "Jitter")

			slot_0_43_27.invert_chance = var_264_0.invert_chance:get()
		end

		if var_264_1 == "Random" then
			table.insert(slot_0_43_27.options, "Jitter")
			table.insert(slot_0_43_27.options, "Randomize Jitter")
		end

		if var_264_0.avoid_overlap:get() then
			table.insert(slot_0_43_27.options, "Avoid Overlap")
		end

		slot_0_43_27.freestanding_body_yaw = var_264_0.freestanding_body_yaw:get()
	end

	if var_264_0.delay:get() then
		local var_264_5 = var_264_0.delay_mode:get()
		local var_264_6 = var_264_0.delay_affect_modifier:get()

		if var_264_5 == "Default" then
			local var_264_7 = var_264_0.delay_value:get()
			local var_264_8 = var_264_0.delay_random:get()

			if var_264_8 > 0 then
				var_264_7 = utils.random_int(var_264_7, var_264_8)
			end

			slot_0_43_27.delay = var_264_7
			slot_0_43_27.delay_affects_modifier = var_264_6
		end

		if var_264_5 == "Custom" then
			local var_264_9 = var_264_0.delay_count:get()
			local var_264_10 = math.random(1, var_264_9)

			if var_264_0.delay_values[var_264_10] ~= nil then
				slot_0_43_27.delay = var_264_0.delay_values[var_264_10]:get()
				slot_0_43_27.delay_affects_modifier = var_264_6
			end
		end
	end

	slot_0_43_27.body_yaw = var_264_4
end

function slot_0_47_25.get(arg_265_0, arg_265_1)
	return slot_0_48_28[arg_265_1]
end

function slot_0_47_25.is_active_ex(arg_266_0, arg_266_1)
	return arg_266_1.enabled == nil or arg_266_1.enabled:get()
end

function slot_0_47_25.is_active(arg_267_0, arg_267_1)
	local var_267_0 = arg_267_0:get(arg_267_1)

	if var_267_0 == nil then
		return false
	end

	return slot_0_47_25:is_active_ex(var_267_0)
end

function slot_0_47_25.get_old_items(arg_268_0)
	return slot_0_49_30
end

function slot_0_47_25.apply_ex(arg_269_0, arg_269_1)
	if arg_269_1 == nil then
		return false
	end

	if arg_269_1.angles ~= nil then
		slot_0_43_27.enabled = true
		slot_0_43_27.pitch = "Down"
		slot_0_43_27.yaw_base = "At Target"

		slot_0_51_33(arg_269_1)
		slot_0_52_30(arg_269_1)
		slot_0_53_28(arg_269_1)
	end

	slot_0_49_30 = arg_269_1

	return true
end

function slot_0_47_25.apply(arg_270_0, arg_270_1)
	local var_270_0 = arg_270_0:get(arg_270_1)

	if var_270_0 == nil then
		return nil
	end

	if not arg_270_0:is_active_ex(var_270_0) then
		return nil
	end

	local var_270_1 = var_270_0.mode:get()

	if var_270_1 == "Builder" then
		arg_270_0:apply_ex(var_270_0)
	end

	if var_270_1 == "Recorder" then
		slot_0_46_24:update(arg_270_1)
	end

	return var_270_0
end

function slot_0_47_25.update(arg_271_0, arg_271_1)
	if rage.exploit:get() ~= 1 then
		local var_271_0 = arg_271_0:apply("Fakelag")

		if var_271_0 ~= nil then
			return var_271_0
		end
	end

	local var_271_1 = slot_0_26_0.get()
	local var_271_2 = arg_271_0:apply(var_271_1)

	if var_271_2 ~= nil then
		return var_271_2
	end

	return arg_271_0:apply("Shared")
end

slot_0_33_0.builder = slot_0_47_25
slot_0_48_27 = {}
slot_0_49_29 = slot_0_23_0.antiaim.settings.disablers

function slot_0_50_30()
	local var_272_0 = entity.get_game_rules()

	if var_272_0 == nil then
		return false
	end

	return var_272_0.m_bWarmupPeriod
end

function slot_0_51_32()
	local var_273_0 = entity.get_local_player()

	if var_273_0 == nil then
		return false
	end

	local var_273_1 = var_273_0.m_iTeamNum
	local var_273_2 = entity.get_player_resource()

	for iter_273_0 = 1, globals.max_players do
		if not var_273_2.m_bConnected[iter_273_0] then
			-- block empty
		else
			local var_273_3 = var_273_2.m_iTeam[iter_273_0]

			if var_273_0 == iter_273_0 or var_273_3 == var_273_1 then
				-- block empty
			elseif var_273_2.m_bAlive[iter_273_0] then
				return false
			end
		end
	end

	return true
end

function slot_0_52_29()
	if slot_0_49_29.select:get("On Warmup") and slot_0_50_30() then
		return true
	end

	if slot_0_49_29.select:get("Enemies Dead") and slot_0_51_32() then
		return true
	end

	return false
end

function slot_0_48_27.update(arg_275_0, arg_275_1)
	if not slot_0_52_29() then
		return false
	end

	if slot_0_47_25:apply("Warmup AA") == nil then
		local var_275_0 = globals.curtime * 5

		slot_0_43_27.pitch = "Disabled"
		slot_0_43_27.yaw = "Backward"
		slot_0_43_27.yaw_offset = 360 * (var_275_0 % 1)
		slot_0_43_27.yaw_modifier = "Disabled"
		slot_0_43_27.modifier_offset = 0
		slot_0_43_27.body_yaw = false
	end

	return true
end

slot_0_49_28 = {}
slot_0_50_29 = slot_0_23_0.antiaim.settings.auto_hide_shots
slot_0_51_31 = 1
slot_0_52_28 = 5

function slot_0_53_27()
	if not slot_0_24_0.is_onground then
		if slot_0_24_0.is_crouched then
			return "Air & Crouching"
		end

		return "Air"
	end

	if slot_0_24_0.is_crouched then
		if slot_0_24_0.is_moving then
			return "Move & Crouching"
		end

		return "Crouching"
	end

	if slot_0_24_0.is_moving then
		if slot_0_9_0.antiaim.misc.slow_walk:get() then
			return "Slow motion"
		end

		return "Running"
	end

	return "Standing"
end

function slot_0_54_29(arg_277_0)
	local var_277_0 = arg_277_0:get_weapon_info()

	if var_277_0 == nil then
		return nil
	end

	local var_277_1 = var_277_0.weapon_type
	local var_277_2 = arg_277_0:get_weapon_index()

	if var_277_1 == slot_0_51_31 then
		if var_277_2 == 1 then
			return "Deagle"
		end

		if var_277_2 == 64 then
			return "Revolver"
		end

		return "Pistol"
	end

	if var_277_1 == slot_0_52_28 then
		if var_277_2 == 40 then
			return "Scout"
		end

		if var_277_2 == 9 then
			return "Awp"
		end

		return "Auto"
	end

	return nil
end

function slot_0_55_33()
	slot_0_9_0.ragebot.main.double_tap[1]:override()
	slot_0_9_0.ragebot.main.hide_shots[1]:override()
end

function slot_0_56_31()
	slot_0_9_0.ragebot.main.double_tap[1]:override(false)
	slot_0_9_0.ragebot.main.hide_shots[1]:override(true)
end

function slot_0_57_28()
	if slot_0_9_0.antiaim.misc.fake_duck:get() then
		return false
	end

	if slot_0_9_0.antiaim.misc.fake_duck:get() then
		return false
	end

	if not slot_0_9_0.ragebot.main.double_tap[1]:get() then
		return false
	end

	local var_280_0 = entity.get_local_player()

	if var_280_0 == nil then
		return false
	end

	local var_280_1 = var_280_0:get_player_weapon()

	if var_280_1 == nil then
		return false
	end

	local var_280_2 = slot_0_54_29(var_280_1)

	if var_280_2 == nil or not slot_0_50_29.weapons:get(var_280_2) then
		return false
	end

	local var_280_3 = slot_0_53_27()

	if not slot_0_50_29.states:get(var_280_3) then
		return false
	end

	return true
end

function slot_0_58_27()
	slot_0_55_33()
end

function slot_0_49_28.update(arg_282_0, arg_282_1)
	if not slot_0_50_29.enabled:get() then
		return
	end

	if not slot_0_57_28() then
		return
	end

	slot_0_56_31()
end

events.shutdown(slot_0_58_27)

slot_0_50_28 = {}
slot_0_51_30 = slot_0_23_0.antiaim.settings.antibrute
slot_0_52_27 = nil
slot_0_53_26 = nil
slot_0_54_28 = nil
slot_0_55_32 = nil
slot_0_56_30 = slot_0_27_0.get_event_bus()

function slot_0_57_27()
	if slot_0_51_30.refresh_offset:get() then
		return math.random(-7, 13)
	end

	return nil
end

function slot_0_58_26()
	local var_284_0 = slot_0_51_30.refresh_modifier:get()

	if var_284_0 == "increase" then
		return math.random(0, 5)
	end

	if var_284_0 == "decrease" then
		return math.random(-5, 0)
	end

	if var_284_0 == "adaptive" then
		return math.random(-3, 5)
	end

	return nil
end

function slot_0_59_22()
	slot_0_52_27 = nil
	slot_0_53_26 = nil
	slot_0_54_28 = nil
	slot_0_55_32 = nil
end

function slot_0_50_28.update(arg_286_0, arg_286_1)
	if not slot_0_51_30.enabled:get() then
		return false
	end

	if slot_0_52_27 ~= nil and globals.curtime > slot_0_52_27 then
		slot_0_59_22()

		return false
	end

	if slot_0_53_26 ~= nil then
		slot_0_43_27.delay = slot_0_53_26
	end

	if slot_0_54_28 ~= nil and slot_0_43_27.yaw_offset ~= nil then
		slot_0_43_27.yaw_offset = slot_0_43_27.yaw_offset + slot_0_54_28
	end

	if slot_0_55_32 ~= nil and slot_0_43_27.modifier_offset ~= nil then
		slot_0_43_27.modifier_offset = slot_0_43_27.modifier_offset + slot_0_55_32
	end

	return true
end

function slot_0_60_14()
	local var_287_0 = slot_0_51_30.duration:get()

	if var_287_0 ~= 0 then
		slot_0_52_27 = globals.curtime + var_287_0 * 0.1
	end

	if slot_0_51_30.enforce_delay:get() then
		slot_0_53_26 = math.random(1, 5)
	end

	slot_0_54_28 = slot_0_57_27()
	slot_0_55_32 = slot_0_58_26()
end

slot_0_61_12 = nil

function slot_0_62_9(arg_288_0)
	local var_288_0 = arg_288_0:get()

	if not var_288_0 then
		slot_0_59_22()
	end

	slot_0_56_30.enemy_shot:set(slot_0_60_14, var_288_0)
end

function slot_0_63_9(arg_289_0)
	local var_289_0 = arg_289_0:get()

	if not var_289_0 then
		slot_0_59_22()
		slot_0_56_30.enemy_shot:set(slot_0_60_14, false)
	end

	if var_289_0 then
		slot_0_51_30.enabled:set_callback(slot_0_62_9, true)
	else
		slot_0_51_30.enabled:unset_callback(slot_0_62_9)
	end
end

slot_0_23_0.antiaim.enabled:set_callback(slot_0_63_9, true)

slot_0_51_29 = {}
slot_0_52_26 = slot_0_23_0.antiaim.settings.roll

function slot_0_53_25()
	if slot_0_52_26.change_on_fakelag:get() and rage.exploit:get() ~= 1 then
		return slot_0_52_26.fakelag_value:get()
	end

	return slot_0_52_26.value:get()
end

function slot_0_51_29.update(arg_291_0, arg_291_1)
	local var_291_0 = slot_0_53_25()

	if var_291_0 == nil or var_291_0 == 0 then
		return
	end

	arg_291_1.view_angles.z = var_291_0
end

slot_0_52_25 = {}
slot_0_53_24 = false

function slot_0_54_27(arg_292_0, arg_292_1)
	local var_292_0 = entity.get_local_player()

	if var_292_0 == nil then
		return false
	end

	local var_292_1 = var_292_0:get_player_weapon()

	if var_292_1 == nil then
		return false
	end

	local var_292_2 = var_292_0.m_iTeamNum
	local var_292_3 = var_292_0:get_origin()
	local var_292_4 = var_292_1:get_weapon_index() == 49

	if var_292_0.m_bIsDefusing or var_292_0.m_bIsGrabbingHostage then
		return false
	end

	if var_292_0.m_bInBombZone and (not arg_292_1.bomb_e_fix:get() or var_292_4) then
		return false
	end

	if var_292_2 == 3 and arg_292_0.view_angles.x > 15 then
		local var_292_5 = entity.get_entities("CPlantedC4")

		for iter_292_0 = 1, #var_292_5 do
			if (var_292_5[iter_292_0]:get_origin() - var_292_3):lengthsqr() < 3844 then
				return false
			end
		end
	end

	local var_292_6 = slot_0_15_0.camera_angles()
	local var_292_7 = vector():angles(var_292_6)
	local var_292_8 = var_292_0:get_eye_position()
	local var_292_9 = var_292_8 + var_292_7 * 128
	local var_292_10 = utils.trace_line(var_292_8, var_292_9, var_292_0, 4294967295, 0)

	if var_292_10.fraction ~= 1 then
		local var_292_11 = var_292_10.entity

		if var_292_11 == nil then
			return true
		end

		local var_292_12 = var_292_11:get_classname()

		if var_292_12 == "CWorld" then
			return true
		end

		if var_292_12 == "CFuncBrush" then
			return true
		end

		if var_292_12 == "CCSPlayer" then
			return true
		end

		if var_292_12 == "CHostage" then
			local var_292_13 = var_292_11:get_origin()

			if var_292_8:distsqr(var_292_13) < 7056 then
				return false
			end
		end

		if not slot_0_53_24 then
			slot_0_53_24 = true

			return false
		end
	end

	return true
end

function slot_0_52_25.update(arg_293_0, arg_293_1)
	if not arg_293_1.in_use then
		slot_0_53_24 = false

		return false
	end

	local var_293_0 = slot_0_47_25:get("On use")

	if var_293_0 == nil then
		return false
	end

	if not slot_0_47_25:is_active_ex(var_293_0) then
		return false
	end

	if not slot_0_54_27(arg_293_1, var_293_0) then
		return false
	end

	arg_293_1.in_use = false

	slot_0_47_25:apply_ex(var_293_0)

	if var_293_0 ~= nil and var_293_0.defensive ~= nil then
		slot_0_44_28:apply(arg_293_1, var_293_0.defensive)
		slot_0_45_25:update(arg_293_1, var_293_0.defensive)
	end

	if slot_0_43_27.yaw_offset ~= nil then
		slot_0_43_27.yaw_offset = slot_0_43_27.yaw_offset + 180
	end

	slot_0_43_27.pitch = "Disabled"
	slot_0_43_27.yaw_base = "Local View"
	slot_0_43_27.freestanding = false

	return true
end

slot_0_53_23 = {}
slot_0_54_26 = slot_0_23_0.antiaim.settings.manual_yaw
slot_0_55_31 = {
	Forward = 180,
	Right = 90,
	Left = -90,
	Backward = 0
}

function slot_0_56_29()
	return slot_0_55_31[slot_0_54_26.select:get()]
end

function slot_0_53_23.update(arg_295_0, arg_295_1)
	local var_295_0 = slot_0_56_29()

	if var_295_0 == nil then
		return false
	end

	local var_295_1 = slot_0_43_27.yaw_offset or 0

	slot_0_43_27.enabled = true
	slot_0_43_27.yaw_offset = var_295_1 + var_295_0
	slot_0_43_27.freestanding = false

	if slot_0_54_26.disable_yaw_modifiers:get() then
		slot_0_43_27.yaw_offset = var_295_1 + var_295_0
		slot_0_43_27.yaw_left = 0
		slot_0_43_27.yaw_right = 0
		slot_0_43_27.yaw_modifier = "Disabled"
		slot_0_43_27.modifier_offset = 0
	end

	if slot_0_54_26.body_freestanding:get() then
		slot_0_43_27.body_yaw = true
		slot_0_43_27.left_limit = 60
		slot_0_43_27.right_limit = 60
		slot_0_43_27.options = {}
		slot_0_43_27.freestanding_body_yaw = "Peek Fake"
	end

	local var_295_2 = slot_0_47_25:apply("Manual Yaw")

	if var_295_2 ~= nil then
		slot_0_43_27.yaw_offset = slot_0_43_27.yaw_offset + var_295_0

		if var_295_2.defensive ~= nil and (slot_0_45_25:update(arg_295_1, var_295_2.defensive) or slot_0_44_28:apply(arg_295_1, var_295_2.defensive)) then
			local var_295_3 = slot_0_43_27.defensive.yaw_offset

			if var_295_3 ~= nil then
				slot_0_43_27.defensive.yaw_offset = var_295_3 + var_295_0
			end
		end
	end

	slot_0_43_27.yaw_base = "Local View"

	return true
end

slot_0_54_25 = {}
slot_0_55_30 = slot_0_23_0.antiaim.settings.freestanding

function slot_0_56_28()
	if not slot_0_24_0.is_onground then
		return "Air"
	end

	if slot_0_24_0.is_crouched then
		return "Crouching"
	end

	if slot_0_24_0.is_moving then
		if slot_0_9_0.antiaim.misc.slow_walk:get() then
			return "Slow motion"
		end

		return "Running"
	end

	return "Standing"
end

function slot_0_57_26()
	return slot_0_55_30.disablers:get(slot_0_56_28())
end

function slot_0_58_25()
	return slot_0_55_30.enabled:get() and not slot_0_57_26()
end

function slot_0_59_21()
	local var_299_0 = rage.antiaim:get_target(false)
	local var_299_1 = rage.antiaim:get_target(true)

	if var_299_0 == nil or var_299_1 == nil then
		return nil
	end

	return var_299_1 - var_299_0
end

function slot_0_60_13(arg_300_0)
	local var_300_0 = slot_0_59_21()

	if var_300_0 == nil then
		return
	end

	local var_300_1 = slot_0_47_25:apply("Freestanding")

	if var_300_1 == nil then
		slot_0_43_27.freestanding = true
		slot_0_43_27.freestanding_disable_yaw_modifiers = slot_0_55_30.disable_yaw_modifiers:get()
		slot_0_43_27.freestanding_body_freestanding = slot_0_55_30.body_freestanding:get()

		return
	end

	slot_0_43_27.yaw_offset = slot_0_43_27.yaw_offset + var_300_0

	if var_300_1.defensive ~= nil and (slot_0_45_25:update(arg_300_0, var_300_1.defensive) or slot_0_44_28:apply(arg_300_0, var_300_1.defensive)) then
		local var_300_2 = slot_0_43_27.defensive.yaw_offset

		if var_300_2 ~= nil then
			slot_0_43_27.defensive.yaw_offset = var_300_2 + var_300_0
		end
	end

	slot_0_43_27.freestanding = false
end

function slot_0_54_25.update(arg_301_0, arg_301_1)
	if not slot_0_58_25() then
		slot_0_43_27.freestanding = false

		return false
	end

	slot_0_60_13(arg_301_1)

	return true
end

slot_0_55_29 = {}
slot_0_56_27 = slot_0_23_0.antiaim.settings.edge_yaw

function slot_0_57_25(arg_302_0)
	local var_302_0 = entity.get_local_player()

	if var_302_0 == nil then
		return nil
	end

	local var_302_1 = var_302_0:get_eye_position()

	if var_302_1 == nil then
		return nil
	end

	local var_302_2 = 1
	local var_302_3
	local var_302_4 = {}

	for iter_302_0 = -180, 179, 45 do
		local var_302_5 = var_302_1 + vector():angles(vector(0, iter_302_0, 0)) * 24
		local var_302_6 = utils.trace_line(var_302_1, var_302_5, var_302_0)

		if var_302_2 > var_302_6.fraction and (var_302_6.entity == nil or not var_302_6.entity:is_player()) then
			var_302_2, var_302_3 = var_302_6.fraction, iter_302_0
		end
	end

	if var_302_3 == nil then
		return nil
	end

	for iter_302_1 = var_302_3 - 30, var_302_3 + 30, 10 do
		local var_302_7 = var_302_1 + vector():angles(vector(0, iter_302_1, 0)) * 24
		local var_302_8 = utils.trace_line(var_302_1, var_302_7, var_302_0, nil, 1)

		if var_302_8.fraction < 1 then
			var_302_4[#var_302_4 + 1] = iter_302_1

			if var_302_2 > var_302_8.fraction then
				var_302_2, var_302_3 = var_302_8.fraction, iter_302_1
			end
		end
	end

	return math.normalize_yaw(var_302_3 * 2 - arg_302_0.move_yaw)
end

function slot_0_55_29.update(arg_303_0, arg_303_1)
	if not slot_0_56_27.enabled:get() then
		return false
	end

	local var_303_0 = slot_0_57_25(arg_303_1)

	if var_303_0 == nil then
		return false
	end

	local var_303_1 = slot_0_43_27.yaw_offset or 0

	slot_0_43_27.yaw_offset = var_303_1 + var_303_0

	return true
end

slot_0_56_26 = {}
slot_0_57_24 = slot_0_23_0.antiaim.settings.safe_head
slot_0_58_24 = 0

function slot_0_59_20(arg_304_0)
	local var_304_0 = arg_304_0:get_weapon_info()

	if var_304_0 == nil then
		return false
	end

	return var_304_0.weapon_type == 0 and arg_304_0:get_weapon_index() ~= 31
end

function slot_0_60_12(arg_305_0, arg_305_1)
	local var_305_0 = arg_305_0:get_player_weapon()

	if var_305_0 == nil then
		return nil
	end

	local var_305_1 = arg_305_0:get_origin()
	local var_305_2 = arg_305_1:get_origin() - var_305_1
	local var_305_3 = -var_305_2.z
	local var_305_4 = var_305_2:length2dsqr()

	if slot_0_24_0.is_onground then
		if (not slot_0_24_0.is_moving or slot_0_24_0.is_crouched) and var_305_3 >= 10 and var_305_4 > 1000000 then
			return "Distance"
		end

		if slot_0_24_0.is_crouched then
			if var_305_3 >= 48 then
				return "Crouch"
			end
		elseif not slot_0_24_0.is_moving and var_305_3 >= 24 then
			return "Standing"
		end

		return nil
	end

	if slot_0_24_0.is_crouched and slot_0_59_20(var_305_0) then
		return "Air Crouch Knife"
	end

	return nil
end

function slot_0_61_11(arg_306_0)
	local var_306_0 = arg_306_0:get_player_weapon()

	if var_306_0 == nil then
		return nil
	end

	local var_306_1 = slot_0_1_0(var_306_0)

	if var_306_1 == nil then
		return nil
	end

	local var_306_2 = var_306_1.max_speed or 250

	if arg_306_0.m_bIsScoped then
		var_306_2 = var_306_1.max_speed_alt or 250
	end

	if arg_306_0.m_flDuckAmount > 0.5 then
		var_306_2 = var_306_2 * 0.34
	end

	return var_306_2
end

function slot_0_62_8(arg_307_0, arg_307_1)
	local var_307_0 = arg_307_0:get_origin()
	local var_307_1 = arg_307_1:get_eye_position()
	local var_307_2 = arg_307_0.m_flDuckAmount > 0.5

	var_307_0.z = var_307_0.z + (var_307_2 and 45 or 60)

	return math.ceil(var_307_0.z - var_307_1.z)
end

function slot_0_63_8(arg_308_0)
	if slot_0_9_0.antiaim.angles.freestanding[1]:get_override() or slot_0_9_0.antiaim.angles.freestanding[1]:get() then
		return true
	end

	if arg_308_0 ~= nil and entity.is_dormant(arg_308_0) then
		return true
	end

	return false
end

function slot_0_64_7(arg_309_0)
	return arg_309_0.m_vecVelocity:length2d()
end

function slot_0_65_7(arg_310_0)
	return bit.band(arg_310_0.m_fFlags, 1) ~= 0
end

function slot_0_66_7(arg_311_0, arg_311_1)
	local var_311_0 = arg_311_1.m_iHealth

	if var_311_0 == nil or var_311_0 <= 0 then
		return false
	end

	local var_311_1 = arg_311_0:get_eye_position()
	local var_311_2 = arg_311_0.m_vecVelocity
	local var_311_3 = arg_311_1:get_hitbox_position(3)
	local var_311_4, var_311_5 = utils.trace_bullet(arg_311_0, var_311_1, var_311_3)

	if var_311_5 == nil then
		return
	end

	if var_311_5.entity ~= arg_311_1 then
		var_311_4 = 0
	end

	if var_311_4 ~= nil and var_311_0 <= var_311_4 then
		return true
	end

	local var_311_6 = slot_0_8_0.extrapolate(var_311_1, var_311_2, 16)
	local var_311_7, var_311_8 = utils.trace_bullet(arg_311_0, var_311_6, var_311_3)

	if var_311_8.entity ~= arg_311_1 then
		var_311_7 = 0
	end

	if var_311_7 ~= nil and var_311_0 <= var_311_7 then
		return true
	end

	return false
end

function slot_0_67_7(arg_312_0, arg_312_1)
	local var_312_0 = arg_312_1.m_iHealth

	if var_312_0 == nil or var_312_0 <= 0 then
		return false
	end

	local var_312_1 = arg_312_0:get_eye_position()
	local var_312_2 = arg_312_0.m_vecVelocity
	local var_312_3 = arg_312_1:get_hitbox_position(0)
	local var_312_4, var_312_5 = utils.trace_bullet(arg_312_0, var_312_1, var_312_3)

	if var_312_5 == nil then
		return
	end

	if var_312_5.entity ~= arg_312_1 then
		var_312_4 = 0
	end

	if var_312_4 ~= nil and var_312_0 <= var_312_4 then
		return true
	end

	local var_312_6 = slot_0_8_0.extrapolate(var_312_1, var_312_2, 32)
	local var_312_7, var_312_8 = utils.trace_bullet(arg_312_0, var_312_6, var_312_3)

	if var_312_8.entity ~= arg_312_1 then
		var_312_7 = 0
	end

	if var_312_7 ~= nil and var_312_0 <= var_312_7 then
		return true
	end

	return false
end

function slot_0_68_7(arg_313_0, arg_313_1)
	local var_313_0 = arg_313_0.m_iTeamNum == 3
	local var_313_1 = arg_313_0:get_player_weapon()
	local var_313_2 = slot_0_59_20(var_313_1)
	local var_313_3 = slot_0_24_0.is_onground and not slot_0_24_0.is_moving and not slot_0_24_0.is_crouched
	local var_313_4 = slot_0_62_8(arg_313_0, arg_313_1)

	if var_313_2 and not slot_0_24_0.is_onground and slot_0_24_0.is_crouched then
		return var_313_4 > (var_313_0 and -35 or -20)
	end

	local var_313_5 = var_313_3 and var_313_4 >= (var_313_0 and -6 or 20) or slot_0_24_0.is_crouched and slot_0_24_0.is_onground and var_313_4 >= (var_313_0 and -20 or -4)
	local var_313_6 = slot_0_64_7(arg_313_1)
	local var_313_7 = not slot_0_65_7(arg_313_1) and var_313_6 > 75 or not slot_0_66_7(arg_313_1, arg_313_0)

	if var_313_5 and var_313_7 then
		local var_313_8 = globals.tickcount
		local var_313_9 = slot_0_67_7(arg_313_1, arg_313_0)

		if var_313_9 == false then
			slot_0_58_24 = var_313_8 + 16

			return true
		end

		if var_313_9 == true then
			slot_0_58_24 = 0

			return false
		end

		return var_313_8 <= slot_0_58_24
	end

	return false
end

function slot_0_69_5(arg_314_0, arg_314_1)
	local var_314_0 = arg_314_0.m_vecVelocity:length()
	local var_314_1 = slot_0_61_11(arg_314_0) or 250
	local var_314_2 = arg_314_1.in_back and arg_314_1.forwardmove < 0
	local var_314_3 = arg_314_1.in_forward and arg_314_1.forwardmove > 0
	local var_314_4 = arg_314_1.in_moveleft and arg_314_1.sidemove < 0
	local var_314_5 = arg_314_1.in_moveright and arg_314_1.sidemove > 0
	local var_314_6 = var_314_0 > 1.1001 and var_314_0 < var_314_1 - var_314_1 * 0.1

	if slot_0_24_0.is_onground and not slot_0_24_0.is_moving and not slot_0_24_0.is_crouched then
		return 35
	end

	if not slot_0_24_0.is_onground then
		return 32
	end

	if var_314_3 then
		if var_314_6 then
			return var_314_5 and 33 or var_314_4 and 20 or 20
		end

		return var_314_5 and 38 or var_314_4 and 14 or 26
	end

	if var_314_2 then
		return var_314_5 and 30 or var_314_4 and 20 or 30
	end

	return var_314_5 and 38 or var_314_4 and 20 or 32
end

function slot_0_56_26.update(arg_315_0, arg_315_1)
	if not slot_0_57_24.enabled:get() then
		return false
	end

	local var_315_0 = entity.get_local_player()
	local var_315_1 = entity.get_threat()

	if var_315_0 == nil or var_315_1 == nil then
		return false
	end

	local var_315_2 = slot_0_60_12(var_315_0, var_315_1)

	if var_315_2 == nil or not slot_0_57_24.states:get(var_315_2) then
		return false
	end

	if slot_0_63_8() then
		slot_0_58_24 = 0

		return false
	end

	if not slot_0_68_7(var_315_0, var_315_1) then
		return
	end

	slot_0_43_27.pitch = "Down"
	slot_0_43_27.yaw_base = "At Target"
	slot_0_43_27.yaw = "Backward"
	slot_0_43_27.yaw_offset = -slot_0_69_5(var_315_0, arg_315_1) + 45
	slot_0_43_27.yaw_left = 0
	slot_0_43_27.yaw_right = 0
	slot_0_43_27.yaw_modifier = "Off"
	slot_0_43_27.modifier_offset = 0
	slot_0_43_27.body_yaw = true
	slot_0_43_27.left_limit = 0
	slot_0_43_27.right_limit = 0
	slot_0_43_27.options = {}
	slot_0_43_27.freestanding_body_yaw = "Off"
	slot_0_43_27.defensive = nil

	return true
end

function slot_0_57_23()
	if rage.exploit:get() == 1 then
		local var_316_0 = math.max(1, slot_0_43_27.delay or 1)

		slot_0_41_17 = slot_0_41_17 + 1

		if var_316_0 > slot_0_41_17 then
			return
		end
	end

	local var_316_1 = true

	if slot_0_43_27.options ~= nil and slot_0_4_0(slot_0_43_27.options, "Randomize Jitter") ~= nil then
		var_316_1 = utils.random_int(0, 1) == 0
	end

	if slot_0_43_27.invert_chance ~= nil and slot_0_43_27.invert_chance < utils.random_int(0, 100) then
		var_316_1 = false
	end

	slot_0_34_1 = slot_0_34_1 + 1

	if var_316_1 then
		slot_0_35_2 = not slot_0_35_2
	end

	slot_0_41_17 = 0
end

function slot_0_58_23()
	local var_317_0 = slot_0_43_27.defensive
	local var_317_1 = 1

	if var_317_0 ~= nil and var_317_0.delay ~= nil then
		var_317_1 = math.max(1, var_317_0.delay)
	end

	slot_0_42_22 = slot_0_42_22 + 1

	if var_317_1 > slot_0_42_22 then
		return
	end

	slot_0_38_10 = slot_0_38_10 + 1
	slot_0_39_12 = not slot_0_39_12
	slot_0_42_22 = 0
end

function slot_0_59_19()
	local var_318_0 = slot_0_43_27.defensive

	if var_318_0 == nil then
		return
	end

	if var_318_0.pitch_offset ~= nil then
		rage.antiaim:override_hidden_pitch(var_318_0.pitch_offset)
	end

	if var_318_0.yaw_offset ~= nil then
		local var_318_1 = var_318_0.yaw_offset

		if slot_0_43_27.yaw_offset ~= nil then
			var_318_1 = var_318_1 - slot_0_43_27.yaw_offset
		end

		if var_318_0.yaw_left ~= nil and slot_0_39_12 == true then
			var_318_1 = var_318_1 + var_318_0.yaw_left
		end

		if var_318_0.yaw_right ~= nil and slot_0_39_12 == false then
			var_318_1 = var_318_1 + var_318_0.yaw_right
		end

		if var_318_0.yaw_modifier == "Offset" then
			local var_318_2 = var_318_0.modifier_offset

			if not slot_0_39_12 then
				var_318_2 = 0
			end

			var_318_1 = var_318_1 + var_318_2
		end

		if var_318_0.yaw_modifier == "Center" then
			local var_318_3 = var_318_0.modifier_offset * 0.5

			if not slot_0_39_12 then
				var_318_3 = -var_318_3
			end

			var_318_1 = var_318_1 + var_318_3
		end

		if var_318_0.yaw_modifier == "Skitter" then
			local var_318_4 = var_318_0.modifier_offset
			local var_318_5 = slot_0_38_10 % #slot_0_40_14

			var_318_1 = var_318_1 + var_318_4 * slot_0_40_14[var_318_5 + 1]
		end

		rage.antiaim:override_hidden_yaw_offset(-var_318_1)
	end
end

function slot_0_60_11()
	if slot_0_43_27.yaw_left ~= nil and slot_0_43_27.yaw_right ~= nil then
		local var_319_0 = slot_0_43_27.yaw_offset or 0

		if slot_0_43_27.inverter == true then
			slot_0_43_27.yaw_offset = var_319_0 + slot_0_43_27.yaw_left
		end

		if slot_0_43_27.inverter == false then
			slot_0_43_27.yaw_offset = var_319_0 + slot_0_43_27.yaw_right
		end

		return
	end
end

function slot_0_61_10()
	local var_320_0 = slot_0_35_2

	if slot_0_43_27.delay_affects_modifier == false then
		var_320_0 = bit.band(slot_0_24_0.sent_packets, 1) ~= 0
	end

	if slot_0_43_27.yaw_modifier == "Angelic" then
		local var_320_1 = {
			"Offset",
			"Random",
			"Skitter",
			"Center"
		}
		local var_320_2 = slot_0_43_27.modifier_offset

		if globals.realtime - slot_0_37_7 > 0.15 then
			slot_0_37_7 = globals.realtime
			slot_0_36_4 = var_320_1[math.random(1, #var_320_1)]
		end

		local var_320_3 = globals.tickcount * 0.2
		local var_320_4 = slot_0_36_4
		local var_320_5 = math.floor(math.sin(var_320_3) * var_320_2)

		slot_0_43_27.yaw_modifier = var_320_4
		slot_0_43_27.modifier_offset = var_320_5
	end

	if slot_0_43_27.yaw_modifier == "Offset" then
		local var_320_6 = slot_0_43_27.yaw_offset or 0
		local var_320_7 = slot_0_43_27.modifier_offset

		slot_0_43_27.yaw_modifier = "Off"
		slot_0_43_27.modifier_offset = 0
		slot_0_43_27.yaw_offset = var_320_6 + (var_320_0 and var_320_7 or 0)

		return
	end

	if slot_0_43_27.yaw_modifier == "Center" then
		local var_320_8 = slot_0_43_27.yaw_offset or 0
		local var_320_9 = slot_0_43_27.modifier_offset

		if not var_320_0 then
			var_320_9 = -var_320_9
		end

		slot_0_43_27.yaw_modifier = "Off"
		slot_0_43_27.modifier_offset = 0
		slot_0_43_27.yaw_offset = var_320_8 + var_320_9 / 2

		return
	end

	if slot_0_43_27.yaw_modifier == "Skitter" then
		local var_320_10 = slot_0_34_1 % #slot_0_40_14
		local var_320_11 = slot_0_40_14[var_320_10 + 1]
		local var_320_12 = slot_0_43_27.yaw_offset or 0
		local var_320_13 = slot_0_43_27.modifier_offset

		slot_0_43_27.yaw_modifier = "Off"
		slot_0_43_27.modifier_offset = 0
		slot_0_43_27.yaw_offset = var_320_12 + var_320_13 * var_320_11

		return
	end

	if slot_0_43_27.yaw_modifier == "Custom Ways" then
		local var_320_14 = slot_0_43_27.yaw_offset or 0
		local var_320_15 = 0

		if slot_0_43_27.way ~= nil then
			local var_320_16 = #slot_0_43_27.way
			local var_320_17 = slot_0_34_1 % var_320_16 + 1
			local var_320_18 = slot_0_43_27.way[var_320_17]

			if var_320_18 ~= nil then
				var_320_15 = var_320_18
			end
		end

		slot_0_43_27.yaw_modifier = "Off"
		slot_0_43_27.modifier_offset = 0
		slot_0_43_27.yaw_offset = var_320_14 + var_320_15

		return
	end

	if slot_0_43_27.yaw_modifier == "Spin" then
		local var_320_19 = globals.curtime * 3
		local var_320_20 = slot_0_43_27.yaw_offset or 0
		local var_320_21 = slot_0_43_27.modifier_offset

		slot_0_43_27.yaw_modifier = "Off"
		slot_0_43_27.modifier_offset = 0
		slot_0_43_27.yaw_offset = var_320_20 + slot_0_8_0.lerp(-var_320_21, var_320_21, var_320_19 % 1)

		return
	end

	if slot_0_43_27.yaw_modifier == "Random" then
		local var_320_22 = slot_0_43_27.yaw_offset or 0
		local var_320_23 = slot_0_43_27.modifier_offset

		slot_0_43_27.yaw_modifier = "Off"
		slot_0_43_27.modifier_offset = 0
		slot_0_43_27.yaw_offset = var_320_22 + utils.random_int(-var_320_23, var_320_23)

		return
	end
end

function slot_0_62_7()
	if slot_0_43_27.options == nil then
		return
	end

	local var_321_0 = false
	local var_321_1 = {}

	for iter_321_0 = 1, #slot_0_43_27.options do
		local var_321_2 = slot_0_43_27.options[iter_321_0]

		if var_321_2 == "Jitter" then
			var_321_0 = true
		elseif var_321_2 == "Randomize Jitter" then
			-- block empty
		else
			table.insert(var_321_1, var_321_2)
		end
	end

	if var_321_0 then
		slot_0_43_27.inverter = slot_0_35_2
	end

	slot_0_43_27.options = var_321_1
end

function slot_0_63_7(arg_322_0)
	slot_0_49_28:update(arg_322_0)

	if slot_0_48_27:update(arg_322_0) then
		return
	end

	slot_0_44_28:update(arg_322_0)

	local var_322_0 = slot_0_47_25:update()

	slot_0_50_28:update(arg_322_0)

	if slot_0_52_25:update(arg_322_0) then
		return
	end

	slot_0_51_29:update(arg_322_0)

	if slot_0_53_23:update(arg_322_0) then
		return
	end

	if slot_0_54_25:update(arg_322_0) then
		return
	end

	if slot_0_56_26:update(arg_322_0) then
		return
	end

	if slot_0_55_29:update(arg_322_0) then
		return
	end

	if var_322_0 ~= nil and var_322_0.defensive ~= nil then
		slot_0_44_28:apply(arg_322_0, var_322_0.defensive)
		slot_0_45_25:update(arg_322_0, var_322_0.defensive)
	end
end

function slot_0_64_6(arg_323_0)
	rage.antiaim:override_hidden_yaw_offset(0)

	if arg_323_0.choked_commands == 0 then
		slot_0_57_23()
		slot_0_58_23()
	end

	slot_0_62_7()
	slot_0_61_10()
	slot_0_60_11()
	slot_0_59_19()
end

function slot_0_65_6()
	slot_0_9_0.ragebot.main.hide_shots[1]:override()
	slot_0_9_0.ragebot.main.double_tap[1]:override()
	slot_0_43_27:unset()
end

function slot_0_66_6(arg_325_0)
	slot_0_9_0.ragebot.main.hide_shots[1]:override()
	slot_0_9_0.ragebot.main.double_tap[1]:override()
	slot_0_43_27:clear()
	slot_0_43_27:unset()
	slot_0_63_7(arg_325_0)
	slot_0_64_6(arg_325_0)
	slot_0_43_27:set()
end

slot_0_67_6 = nil
slot_0_68_6 = slot_0_23_0.antiaim

function slot_0_69_4(arg_326_0)
	local var_326_0 = arg_326_0:get()

	if not var_326_0 then
		slot_0_43_27:unset()
		slot_0_9_0.ragebot.main.hide_shots[2]:override()
		slot_0_9_0.ragebot.main.double_tap[2]:override()
	end

	events.shutdown(slot_0_65_6, var_326_0)
	events.createmove(slot_0_66_6, var_326_0)
end

slot_0_68_6.enabled:set_callback(slot_0_69_4, true)

slot_0_34_0 = nil
slot_0_35_1 = nil
slot_0_36_3 = slot_0_23_0.ragebot.aimtools
slot_0_37_6 = 0
slot_0_38_9 = 1
slot_0_39_11 = 2
slot_0_40_13 = 3
slot_0_41_16 = 4
slot_0_42_21 = 5
slot_0_43_26 = 6
slot_0_44_27 = 7
slot_0_45_24 = 10
slot_0_46_23 = 1
slot_0_47_24 = 5
slot_0_48_26 = slot_0_20_0.aimtools
slot_0_49_27 = {}
slot_0_50_27 = {}

function slot_0_51_28(arg_327_0)
	local var_327_0 = {
		head_scale = ui.find("Aimbot", "Ragebot", "Selection", arg_327_0, "Multipoint", "Head Scale"),
		body_scale = ui.find("Aimbot", "Ragebot", "Selection", arg_327_0, "Multipoint", "Body Scale"),
		hit_chance = ui.find("Aimbot", "Ragebot", "Selection", arg_327_0, "Hit Chance"),
		body_aim = ui.find("Aimbot", "Ragebot", "Safety", arg_327_0, "Body Aim"),
		safe_points = ui.find("Aimbot", "Ragebot", "Safety", arg_327_0, "Safe Points")
	}

	slot_0_50_27[arg_327_0] = var_327_0
end

for iter_0_4 = 1, #slot_0_48_26 do
	slot_0_51_28(slot_0_48_26[iter_0_4])
end

function slot_0_51_27(arg_328_0)
	local var_328_0 = arg_328_0:get_weapon_info()

	if var_328_0 == nil then
		return nil
	end

	local var_328_1 = var_328_0.weapon_type
	local var_328_2 = arg_328_0:get_weapon_index()

	if var_328_1 == slot_0_46_23 then
		if var_328_2 == 1 then
			return "Desert Eagle"
		end

		if var_328_2 == 64 then
			return "R8 Revolver"
		end

		return "Pistols"
	end

	if var_328_1 == slot_0_47_24 then
		if var_328_2 == 9 then
			return "AWP"
		end

		if var_328_2 == 40 then
			return "SSG-08"
		end

		return "AutoSnipers"
	end

	return nil
end

function slot_0_52_24(arg_329_0)
	if arg_329_0 == slot_0_38_9 then
		return 4
	end

	if arg_329_0 == slot_0_40_13 then
		return 1.25
	end

	if arg_329_0 == slot_0_43_26 then
		return 0.75
	end

	if arg_329_0 == slot_0_44_27 then
		return 0.75
	end

	return 1
end

function slot_0_53_22(arg_330_0, arg_330_1, arg_330_2, arg_330_3)
	arg_330_1 = arg_330_1 * slot_0_52_24(arg_330_2)

	if arg_330_0.m_ArmorValue > 0 then
		if arg_330_2 == slot_0_38_9 then
			if arg_330_0.m_bHasHelmet then
				arg_330_1 = arg_330_1 * (arg_330_3 * 0.5)
			end
		else
			arg_330_1 = arg_330_1 * (arg_330_3 * 0.5)
		end
	end

	return arg_330_1
end

function slot_0_54_24(arg_331_0, arg_331_1, arg_331_2, arg_331_3, arg_331_4)
	local var_331_0 = arg_331_1 - arg_331_0
	local var_331_1 = arg_331_4.damage
	local var_331_2 = arg_331_4.armor_ratio
	local var_331_3 = arg_331_4.range
	local var_331_4 = arg_331_4.range_modifier
	local var_331_5 = math.min(var_331_3, var_331_0:length())
	local var_331_6 = var_331_1 * math.pow(var_331_4, var_331_5 * 0.002)

	return (slot_0_53_22(arg_331_2, var_331_6, arg_331_3, var_331_2))
end

function slot_0_55_27(arg_332_0, arg_332_1)
	local var_332_0 = arg_332_0:get_origin()
	local var_332_1 = arg_332_1:get_origin()

	return var_332_0.z - var_332_1.z > 53
end

function slot_0_56_25(arg_333_0, arg_333_1)
	local var_333_0 = arg_333_0:get_origin()

	return arg_333_1:get_origin().z - var_333_0.z > 53
end

function slot_0_57_22(arg_334_0, arg_334_1, arg_334_2, arg_334_3, arg_334_4)
	return slot_0_54_24(arg_334_0, arg_334_1, arg_334_2, arg_334_3, arg_334_4) >= arg_334_2.m_iHealth
end

function slot_0_58_22()
	for iter_335_0 = 1, #slot_0_48_26 do
		local var_335_0 = slot_0_48_26[iter_335_0]
		local var_335_1 = slot_0_50_27[var_335_0]

		var_335_1.head_scale:override()
		var_335_1.body_scale:override()
		var_335_1.hit_chance:override()
		var_335_1.body_aim:override()
		var_335_1.safe_points:override()
	end
end

function slot_0_59_18()
	return {
		misses = 0,
		force_safe = false,
		prefer_body = false
	}
end

function slot_0_60_10(arg_337_0)
	return slot_0_49_27[arg_337_0]
end

function slot_0_61_9(arg_338_0)
	local var_338_0 = slot_0_60_10(arg_338_0)

	if var_338_0 == nil then
		var_338_0 = slot_0_59_18()
		slot_0_49_27[arg_338_0] = var_338_0
	end

	return var_338_0
end

function slot_0_62_6(arg_339_0)
	slot_0_49_27[arg_339_0] = nil
end

function slot_0_63_6()
	for iter_340_0 in pairs(slot_0_49_27) do
		slot_0_62_6(iter_340_0)
	end
end

function slot_0_64_5(arg_341_0, arg_341_1, arg_341_2, arg_341_3, arg_341_4, arg_341_5)
	local var_341_0 = arg_341_0:get_eye_position()
	local var_341_1 = arg_341_2:get_hitbox_position(5)
	local var_341_2 = arg_341_1:get_weapon_info()
	local var_341_3 = arg_341_5.body_aim:get() ~= "Force" and (arg_341_4.conditions:get("Higher than you") and slot_0_55_27(arg_341_2, arg_341_0) or arg_341_4.conditions:get("Lower than you") and slot_0_56_25(arg_341_2, arg_341_0) or arg_341_4.conditions:get("Lethal") and slot_0_57_22(var_341_0, var_341_1, arg_341_2, 3, var_341_2) or arg_341_4.conditions:get("After X misses") and arg_341_3.misses > arg_341_4.max_misses:get() or arg_341_4.conditions:get("HP lower than X") and arg_341_2.m_iHealth < arg_341_4.lower_hp:get())

	arg_341_5.body_aim:override(var_341_3 and "Prefer" or nil)

	arg_341_3.prefer_body = var_341_3
end

function slot_0_65_5(arg_342_0, arg_342_1, arg_342_2, arg_342_3, arg_342_4, arg_342_5)
	local var_342_0 = arg_342_0:get_eye_position()
	local var_342_1 = arg_342_2:get_hitbox_position(5)
	local var_342_2 = arg_342_1:get_weapon_info()
	local var_342_3 = arg_342_4.conditions:get("Higher than you") and slot_0_55_27(arg_342_2, arg_342_0) or arg_342_4.conditions:get("Lower than you") and slot_0_56_25(arg_342_2, arg_342_0) or arg_342_4.conditions:get("Lethal") and slot_0_57_22(var_342_0, var_342_1, arg_342_2, 3, var_342_2) or arg_342_4.conditions:get("After X misses") and arg_342_3.misses > arg_342_4.max_misses:get() or arg_342_4.conditions:get("HP lower than X") and arg_342_2.m_iHealth < arg_342_4.lower_hp:get()

	arg_342_5.safe_points:override(var_342_3 and "Force" or nil)

	arg_342_3.force_safe = var_342_3
end

function slot_0_66_5(arg_343_0, arg_343_1, arg_343_2, arg_343_3, arg_343_4, arg_343_5)
	local var_343_0 = arg_343_0:get_eye_position()
	local var_343_1 = arg_343_2:get_hitbox_position(5)
	local var_343_2 = arg_343_1:get_weapon_info()
	local var_343_3 = arg_343_4["Higher than you"].enabled:get() and slot_0_55_27(arg_343_2, arg_343_0) and arg_343_4["Higher than you"].value:get() or arg_343_4["Lower than you"].enabled:get() and slot_0_56_25(arg_343_2, arg_343_0) and arg_343_4["Lower than you"].value:get() or arg_343_4.Lethal.enabled:get() and slot_0_57_22(var_343_0, var_343_1, arg_343_2, 3, var_343_2) and arg_343_4.Lethal.value:get() or arg_343_4["After X misses"].enabled:get() and arg_343_3.misses > arg_343_4["After X misses"].max_misses:get() and arg_343_4["After X misses"].value:get() or arg_343_4["HP lower than X"].enabled:get() and arg_343_2.m_iHealth < arg_343_4["HP lower than X"].lower_hp:get() and arg_343_4["HP lower than X"].value:get() or nil

	arg_343_5.hit_chance:override(var_343_3)

	arg_343_3.hit_chance = var_343_3
end

function slot_0_67_5(arg_344_0, arg_344_1, arg_344_2, arg_344_3, arg_344_4, arg_344_5)
	local var_344_0 = arg_344_0:get_eye_position()
	local var_344_1 = arg_344_2:get_hitbox_position(5)
	local var_344_2 = arg_344_1:get_weapon_info()
	local var_344_3 = arg_344_4["Higher than you"].enabled:get() and slot_0_55_27(arg_344_2, arg_344_0) and arg_344_4["Higher than you"].value:get() or arg_344_4["Lower than you"].enabled:get() and slot_0_56_25(arg_344_2, arg_344_0) and arg_344_4["Lower than you"].value:get() or arg_344_4.Lethal.enabled:get() and slot_0_57_22(var_344_0, var_344_1, arg_344_2, 3, var_344_2) and arg_344_4.Lethal.value:get() or arg_344_4["After X misses"].enabled:get() and arg_344_3.misses > arg_344_4["After X misses"].max_misses:get() and arg_344_4["After X misses"].value:get() or arg_344_4["HP lower than X"].enabled:get() and arg_344_2.m_iHealth < arg_344_4["HP lower than X"].lower_hp:get() and arg_344_4["HP lower than X"].value:get() or nil

	arg_344_5.head_scale:override(var_344_3)
	arg_344_5.body_scale:override(var_344_3)

	arg_344_3.multipoints = var_344_3
end

function slot_0_68_5(arg_345_0, arg_345_1, arg_345_2)
	local var_345_0 = slot_0_51_27(arg_345_2)
	local var_345_1 = slot_0_36_3[var_345_0]
	local var_345_2 = slot_0_50_27[var_345_0]

	if arg_345_1 ~= nil and var_345_1 ~= nil and var_345_2 ~= nil then
		local var_345_3 = slot_0_61_9(arg_345_1:get_index())

		slot_0_64_5(arg_345_0, arg_345_2, arg_345_1, var_345_3, var_345_1.prefer_body, var_345_2)
		slot_0_65_5(arg_345_0, arg_345_2, arg_345_1, var_345_3, var_345_1.force_safe, var_345_2)
		slot_0_66_5(arg_345_0, arg_345_2, arg_345_1, var_345_3, var_345_1.hit_chance, var_345_2)
		slot_0_67_5(arg_345_0, arg_345_2, arg_345_1, var_345_3, var_345_1.multipoints, var_345_2)
	else
		slot_0_58_22()
	end
end

function slot_0_69_3()
	slot_0_58_22()
end

function slot_0_70_3()
	local var_347_0 = entity.get_local_player()

	if var_347_0 == nil then
		return
	end

	local var_347_1 = var_347_0:get_player_weapon()

	if var_347_1 == nil then
		return
	end

	slot_0_68_5(var_347_0, entity.get_threat(), var_347_1)
end

function slot_0_71_3()
	local var_348_0 = entity.get_local_player()

	if var_348_0 == nil or not var_348_0:is_alive() then
		return
	end

	local var_348_1 = var_348_0:get_player_weapon()

	if var_348_1 == nil then
		return
	end

	local var_348_2 = entity.get_threat()
	local var_348_3 = slot_0_51_27(var_348_1)

	if var_348_2 == nil or var_348_3 == nil then
		return
	end

	local var_348_4 = slot_0_60_10(var_348_2:get_index())

	if var_348_4 == nil then
		return
	end

	local var_348_5 = {}

	if var_348_4.prefer_body then
		table.insert(var_348_5, "BODY")
	end

	if var_348_4.force_safe then
		table.insert(var_348_5, "SAFE")
	end

	if var_348_4.multipoints ~= nil then
		table.insert(var_348_5, var_348_4.multipoints)
	end

	if var_348_4.hit_chance ~= nil then
		table.insert(var_348_5, var_348_4.hit_chance .. "%")
	end

	if #var_348_5 == 0 then
		return
	end

	local var_348_6 = var_348_2:get_bbox()

	if var_348_6 == nil then
		return
	end

	local var_348_7 = var_348_6.pos1
	local var_348_8 = var_348_6.pos2
	local var_348_9 = var_348_6.alpha

	if var_348_7 == nil or var_348_8 == nil or var_348_9 == nil then
		return
	end

	local var_348_10 = vector((var_348_6.pos1.x + var_348_6.pos2.x) * 0.5, var_348_6.pos1.y - 20)

	slot_0_15_0.text(1, var_348_10, color(255, 255, 255, 200 * var_348_9), "c", table.concat(var_348_5, " + "))
end

function slot_0_72_3(arg_349_0)
	local var_349_0 = arg_349_0.state
	local var_349_1 = arg_349_0.target

	if var_349_0 == nil or var_349_1 == nil then
		return
	end

	local var_349_2 = slot_0_61_9(var_349_1:get_index())

	var_349_2.misses = var_349_2.misses + 1
end

function slot_0_73_2(arg_350_0)
	local var_350_0 = entity.get_local_player()
	local var_350_1 = entity.get(arg_350_0.userid, true)

	if var_350_0 ~= entity.get(arg_350_0.attacker, true) or var_350_0 == var_350_1 then
		return
	end

	slot_0_62_6(var_350_1:get_index())
end

function slot_0_74_2(arg_351_0)
	local var_351_0 = entity.get(arg_351_0.userid, true)

	if var_351_0 == nil then
		return
	end

	slot_0_62_6(var_351_0:get_index())
end

slot_0_75_2 = nil

function slot_0_76_2(arg_352_0)
	events.render(slot_0_71_3, arg_352_0:get())
end

function slot_0_77_2(arg_353_0)
	local var_353_0 = arg_353_0:get()

	if not var_353_0 then
		slot_0_58_22()
		slot_0_63_6()
	end

	if var_353_0 then
		slot_0_36_3.flag:set_callback(slot_0_76_2, true)
	else
		slot_0_36_3.flag:unset_callback(slot_0_76_2)
	end

	events.shutdown(slot_0_69_3, var_353_0)
	events.createmove(slot_0_70_3, var_353_0)
	events.aim_ack(slot_0_72_3, var_353_0)
	events.player_death(slot_0_73_2, var_353_0)
	events.player_spawn(slot_0_74_2, var_353_0)
end

slot_0_36_3.enabled:set_callback(slot_0_77_2, true)

slot_0_36_2 = nil
slot_0_37_5 = slot_0_23_0.ragebot.ai_peek
slot_0_38_8 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
slot_0_39_10 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
slot_0_40_12 = {
	ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
	ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"),
	ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
}
slot_0_41_15 = ffi.typeof("float[3]")
slot_0_42_20 = ffi.typeof("uint8_t[4]")
slot_0_43_25 = nil
slot_0_44_26 = ffi.typeof("                void(__thiscall*)(\n                    void*,\n                    float origin[3],\n                    float mins[3],\n                    float maxs[3],\n                    float angles[3],\n                    uint8_t face_color[4],\n                    uint8_t edge_color[4],\n                    float duration\n                )\n            ")
slot_0_43_24 = utils.get_vfunc("engine.dll", "VDebugOverlay004", 21, slot_0_44_26)
slot_0_44_25 = 1
slot_0_45_23 = 5
slot_0_46_22 = 0
slot_0_47_23 = 3
slot_0_48_25 = 5
slot_0_49_26 = 7
slot_0_50_26 = 8
slot_0_51_26 = 9
slot_0_52_23 = 10
slot_0_53_21 = 11
slot_0_54_23 = 12
slot_0_55_26 = 15
slot_0_56_24 = 17
slot_0_57_21 = {
	Head = {
		slot_0_46_22
	},
	Chest = {
		slot_0_48_25
	},
	Stomach = {
		slot_0_47_23
	},
	Arms = {
		slot_0_56_24,
		slot_0_55_26
	},
	Legs = {
		slot_0_50_26,
		slot_0_49_26,
		slot_0_52_23,
		slot_0_51_26
	}
}
slot_0_58_21 = 1
slot_0_59_17 = 2
slot_0_60_9 = 3
slot_0_61_8 = 4
slot_0_62_5 = 5
slot_0_63_5 = 6
slot_0_64_4 = 7
slot_0_65_4 = {
	[slot_0_46_22] = slot_0_58_21,
	[slot_0_48_25] = slot_0_59_17,
	[slot_0_47_23] = slot_0_60_9,
	[slot_0_50_26] = slot_0_63_5,
	[slot_0_49_26] = slot_0_64_4,
	[slot_0_54_23] = slot_0_63_5,
	[slot_0_53_21] = slot_0_64_4,
	[slot_0_56_24] = slot_0_61_8,
	[slot_0_55_26] = slot_0_62_5
}
slot_0_66_4 = nil
slot_0_66_3 = {}

function slot_0_67_4(arg_354_0, arg_354_1)
	slot_0_66_3[arg_354_0] = arg_354_1
end

function slot_0_68_4(arg_355_0)
	return {
		body_aim = ui.find("Aimbot", "Ragebot", "Safety", arg_355_0, "Body Aim"),
		safe_points = ui.find("Aimbot", "Ragebot", "Safety", arg_355_0, "Safe Points"),
		ensure_hitbox_safety = ui.find("Aimbot", "Ragebot", "Safety", arg_355_0, "Ensure Hitbox Safety"),
		min_damage = ui.find("Aimbot", "Ragebot", "Selection", arg_355_0, "Min. Damage"),
		hit_chance = ui.find("Aimbot", "Ragebot", "Selection", arg_355_0, "Hit Chance"),
		head_scale = ui.find("Aimbot", "Ragebot", "Selection", arg_355_0, "Multipoint", "Head Scale"),
		body_scale = ui.find("Aimbot", "Ragebot", "Selection", arg_355_0, "Multipoint", "Body Scale")
	}
end

slot_0_67_4("AutoSnipers", slot_0_68_4("AutoSnipers"))
slot_0_67_4("AWP", slot_0_68_4("AWP"))
slot_0_67_4("SSG-08", slot_0_68_4("SSG-08"))
slot_0_67_4("Desert Eagle", slot_0_68_4("Desert Eagle"))
slot_0_67_4("R8 Revolver", slot_0_68_4("R8 Revolver"))
slot_0_67_4("Pistols", slot_0_68_4("Pistols"))

slot_0_67_3 = nil
slot_0_68_3 = 0
slot_0_69_2 = nil

function slot_0_70_2(arg_356_0)
	return arg_356_0[0]
end

function slot_0_71_2()
	slot_0_67_3 = nil
	slot_0_68_3 = 0
	slot_0_69_2 = nil
end

function slot_0_72_2()
	for iter_358_0, iter_358_1 in pairs(slot_0_66_3) do
		iter_358_1.body_aim:override()
		iter_358_1.safe_points:override()
		iter_358_1.ensure_hitbox_safety:override()
		iter_358_1.hit_chance:override()
		iter_358_1.head_scale:override()
		iter_358_1.body_scale:override()
	end

	slot_0_38_8:override()
	slot_0_40_12[3]:override()
end

function slot_0_73_1()
	local var_359_0 = slot_0_37_5.hit_chance:get()
	local var_359_1 = slot_0_37_5.unsafe:get()

	for iter_359_0, iter_359_1 in pairs(slot_0_66_3) do
		if var_359_1 then
			iter_359_1.body_aim:override("Default")
			iter_359_1.safe_points:override("Default")
			iter_359_1.ensure_hitbox_safety:override({})
		end

		if var_359_0 ~= 0 then
			iter_359_1.hit_chance:override(var_359_0)
		end

		iter_359_1.head_scale:override(100)
		iter_359_1.body_scale:override(100)
	end

	slot_0_40_12[3]:override("On Shot")
end

function slot_0_74_1(arg_360_0)
	if arg_360_0 == 1 then
		return 4
	end

	if arg_360_0 == 3 then
		return 1.25
	end

	if arg_360_0 == 6 or arg_360_0 == 7 then
		return 0.75
	end

	return 1
end

function slot_0_75_1(arg_361_0, arg_361_1, arg_361_2, arg_361_3, arg_361_4)
	local var_361_0 = arg_361_2 - arg_361_1
	local var_361_1 = math.min(arg_361_0.range, var_361_0:length())
	local var_361_2 = arg_361_0.damage * math.pow(arg_361_0.range_modifier, var_361_1 * 0.002) * slot_0_74_1(arg_361_4)

	if arg_361_3.m_ArmorValue > 0 and (arg_361_4 ~= 1 or arg_361_3.m_bHasHelmet) then
		var_361_2 = var_361_2 * (arg_361_0.armor_ratio / 2)
	end

	return var_361_2
end

function slot_0_76_1()
	local var_362_0 = {}
	local var_362_1 = slot_0_37_5.hitboxes:get()

	for iter_362_0 = 1, #var_362_1 do
		local var_362_2 = var_362_1[iter_362_0]
		local var_362_3 = slot_0_57_21[var_362_2]

		for iter_362_1 = 1, #var_362_3 do
			table.insert(var_362_0, var_362_3[iter_362_1])
		end
	end

	return var_362_0
end

function slot_0_77_1(arg_363_0, arg_363_1)
	local var_363_0 = arg_363_0:get_weapon_index()
	local var_363_1 = arg_363_1.weapon_type

	if var_363_1 == slot_0_44_25 then
		if var_363_0 == 1 then
			return "Desert Eagle"
		end

		if var_363_0 == 64 then
			return "R8 Revolver"
		end

		return "Pistols"
	end

	if var_363_1 == slot_0_45_23 then
		if var_363_0 == 9 then
			return "AWP"
		end

		if var_363_0 == 40 then
			return "SSG-08"
		end

		return "AutoSnipers"
	end

	return nil
end

function slot_0_78_1(arg_364_0, arg_364_1, arg_364_2, arg_364_3, arg_364_4)
	local var_364_0 = {}
	local var_364_1 = arg_364_3.m_iHealth
	local var_364_2 = arg_364_1:get_eye_position()
	local var_364_3 = arg_364_2:get_weapon_info()

	for iter_364_0 = 1, #arg_364_0 do
		local var_364_4 = arg_364_0[iter_364_0]
		local var_364_5 = slot_0_65_4[var_364_4] or 0
		local var_364_6 = arg_364_3:get_hitbox_position(var_364_4)
		local var_364_7 = slot_0_75_1(var_364_3, var_364_2, var_364_6, arg_364_3, var_364_5)

		if arg_364_4 <= var_364_7 or var_364_1 <= var_364_7 then
			table.insert(var_364_0, var_364_6)
		end
	end

	return var_364_0
end

function slot_0_79_1(arg_365_0)
	if arg_365_0 == nil or not pcall(slot_0_70_2, arg_365_0) then
		return false
	end

	return true
end

function slot_0_80_1(arg_366_0, arg_366_1, arg_366_2)
	if arg_366_0 == nil or arg_366_1 == nil then
		return false
	end

	local var_366_0 = arg_366_2.max_clip1 > 0 and arg_366_1.m_iClip1 > 0
	local var_366_1 = globals.curtime >= arg_366_0.m_flNextAttack and globals.curtime >= arg_366_1.m_flNextPrimaryAttack

	return var_366_0 and var_366_1
end

function slot_0_81_1(arg_367_0, arg_367_1)
	local var_367_0 = slot_0_37_5.scan_frequency:get() * 0.01

	if var_367_0 > 0 then
		slot_0_68_3 = math.max(0, slot_0_68_3 - globals.frametime)

		if slot_0_68_3 > 0 then
			return false
		end

		slot_0_68_3 = var_367_0
	end

	if arg_367_0.in_forward or arg_367_0.in_back or arg_367_0.in_moveleft or arg_367_0.in_moveright then
		return false
	end

	local var_367_1 = arg_367_1.m_fFlags

	if bit.band(var_367_1, 1) == 0 then
		return false
	end

	if arg_367_1.m_vecVelocity:length2dsqr() > 480 then
		return false
	end

	return true
end

function slot_0_82_1(arg_368_0, arg_368_1)
	local var_368_0 = {
		ctx = arg_368_0,
		target = arg_368_1
	}

	var_368_0.simtime = 0
	var_368_0.retreat = -1
	var_368_0.teleport = 0

	return var_368_0
end

function slot_0_83_1(arg_369_0)
	slot_0_43_24(slot_0_41_15(arg_369_0.origin:unpack()), slot_0_41_15(arg_369_0.obb_mins:unpack()), slot_0_41_15(arg_369_0.obb_maxs:unpack()), slot_0_41_15(), slot_0_42_20(), slot_0_42_20(slot_0_37_5.color:get():unpack()), globals.tickinterval * 2)
end

function slot_0_84_1(arg_370_0)
	arg_370_0.in_forward = true
	arg_370_0.in_back = false
	arg_370_0.in_moveleft = false
	arg_370_0.in_moveright = false
	arg_370_0.in_duck = false
	arg_370_0.in_jump = false
	arg_370_0.in_speed = false
end

function slot_0_85_1(arg_371_0, arg_371_1, arg_371_2)
	local function var_371_0(arg_372_0)
		if arg_372_0 == arg_371_0 then
			return false
		end

		if not arg_372_0:is_enemy() then
			return false
		end

		return true
	end

	return utils.trace_bullet(arg_371_0, arg_371_1, arg_371_2, var_371_0)
end

function slot_0_86_1(arg_373_0, arg_373_1)
	local var_373_0
	local var_373_1
	local var_373_2 = arg_373_0:get_origin()
	local var_373_3 = (arg_373_1:get_origin() - var_373_2):angles().y + 180
	local var_373_4 = var_373_3 - 90
	local var_373_5 = var_373_3 + 90

	return var_373_4, var_373_5
end

function slot_0_87_1(arg_374_0, arg_374_1, arg_374_2, arg_374_3, arg_374_4)
	local var_374_0 = arg_374_2.m_iHealth

	for iter_374_0 = 1, #arg_374_3 do
		local var_374_1 = arg_374_3[iter_374_0]
		local var_374_2 = slot_0_85_1(arg_374_0, arg_374_1, var_374_1)
		local var_374_3 = arg_374_4 <= var_374_2
		local var_374_4 = var_374_0 <= var_374_2

		if var_374_3 or var_374_4 then
			return var_374_2
		end
	end

	return nil
end

function slot_0_88_1(arg_375_0, arg_375_1, arg_375_2, arg_375_3, arg_375_4, arg_375_5, arg_375_6)
	arg_375_0.view_angles.y = arg_375_2

	arg_375_1:think(1)

	if bit.band(arg_375_1.flags, 1) == 0 then
		return nil
	end

	local var_375_0 = slot_0_87_1(arg_375_3, arg_375_1.origin + vector(0, 0, arg_375_1.view_offset), arg_375_4, arg_375_5, arg_375_6)

	if var_375_0 ~= nil then
		arg_375_1:think(1)
	end

	return {
		ctx = arg_375_1,
		damage = var_375_0
	}
end

function slot_0_89_1(arg_376_0, arg_376_1, arg_376_2, arg_376_3, arg_376_4)
	local var_376_0 = true
	local var_376_1 = true
	local var_376_2 = arg_376_1:simulate_movement(nil, vector(), 1)
	local var_376_3 = arg_376_1:simulate_movement(nil, vector(), 1)
	local var_376_4, var_376_5 = slot_0_86_1(arg_376_1, arg_376_2)

	for iter_376_0 = 1, 25 do
		if var_376_0 then
			local var_376_6 = slot_0_88_1(arg_376_0, var_376_2, var_376_4, arg_376_1, arg_376_2, arg_376_3, arg_376_4)

			if var_376_6 ~= nil and var_376_6.damage ~= nil then
				return slot_0_82_1(var_376_6.ctx, arg_376_2)
			end

			if var_376_6 == nil then
				var_376_0 = false
			end
		end

		if var_376_1 then
			local var_376_7 = slot_0_88_1(arg_376_0, var_376_3, var_376_5, arg_376_1, arg_376_2, arg_376_3, arg_376_4)

			if var_376_7 ~= nil and var_376_7.damage ~= nil then
				return slot_0_82_1(var_376_7.ctx, arg_376_2)
			end

			if var_376_7 == nil then
				var_376_1 = false
			end
		end
	end
end

function slot_0_90_1(arg_377_0, arg_377_1, arg_377_2, arg_377_3, arg_377_4)
	local var_377_0 = arg_377_0.view_angles:clone()
	local var_377_1 = arg_377_0.forwardmove
	local var_377_2 = arg_377_0.sidemove
	local var_377_3 = arg_377_0.in_duck
	local var_377_4 = arg_377_0.in_jump
	local var_377_5 = arg_377_0.in_speed

	arg_377_0.forwardmove = 450
	arg_377_0.sidemove = 0
	arg_377_0.in_duck = false
	arg_377_0.in_jump = false
	arg_377_0.in_speed = false

	local var_377_6 = slot_0_89_1(arg_377_0, arg_377_1, arg_377_2, arg_377_3, arg_377_4)

	arg_377_0.view_angles.y = var_377_0.y
	arg_377_0.forwardmove = var_377_1
	arg_377_0.sidemove = var_377_2
	arg_377_0.in_duck = var_377_3
	arg_377_0.in_jump = var_377_4
	arg_377_0.in_speed = var_377_5

	return var_377_6
end

function slot_0_91_1(arg_378_0, arg_378_1, arg_378_2)
	local var_378_0 = slot_0_39_10:get()
	local var_378_1 = slot_0_76_1()

	if slot_0_67_3 ~= nil and slot_0_79_1(slot_0_67_3.target) then
		local var_378_2 = slot_0_67_3.ctx
		local var_378_3 = slot_0_67_3.target
		local var_378_4 = var_378_3.m_iHealth

		if var_378_0 >= 100 then
			var_378_0 = var_378_0 - 100 + var_378_4
		end

		local var_378_5 = slot_0_78_1(var_378_1, arg_378_1, arg_378_2, var_378_3, var_378_0)

		if slot_0_87_1(arg_378_1, var_378_2.origin + vector(0, 0, var_378_2.view_offset), var_378_3, var_378_5, var_378_0) ~= nil then
			slot_0_67_3.simtime = 0
		end

		slot_0_67_3.simtime = slot_0_67_3.simtime + globals.frametime

		return true
	end

	if not slot_0_81_1(arg_378_0, arg_378_1) then
		return false
	end

	local var_378_6 = entity.get_threat()

	if var_378_6 == nil or var_378_6:is_dormant() then
		return false
	end

	local var_378_7 = var_378_6.m_iHealth

	if var_378_0 >= 100 then
		var_378_0 = var_378_0 - 100 + var_378_7
	end

	local var_378_8 = slot_0_78_1(var_378_1, arg_378_1, arg_378_2, var_378_6, var_378_0)

	if slot_0_87_1(arg_378_1, arg_378_1:get_eye_position(), var_378_6, var_378_8, var_378_0) then
		return false
	end

	local var_378_9 = slot_0_90_1(arg_378_0, arg_378_1, var_378_6, var_378_8, var_378_0)

	if var_378_9 ~= nil then
		slot_0_67_3 = var_378_9
	end

	return slot_0_67_3 ~= nil
end

function slot_0_92_1()
	rage.exploit:force_teleport()
	slot_0_38_8:override(false)
end

function slot_0_93_1(arg_380_0, arg_380_1, arg_380_2)
	local var_380_0 = 450
	local var_380_1 = arg_380_2 - arg_380_1:get_origin()
	local var_380_2 = var_380_1:angles()
	local var_380_3 = var_380_1:length2dsqr()
	local var_380_4 = var_380_3 < 10

	if var_380_4 then
		local var_380_5 = arg_380_1.m_vecVelocity

		var_380_0 = -var_380_5:length()
		var_380_2 = var_380_5:angles()
	end

	arg_380_0.move_yaw = var_380_2.y
	arg_380_0.forwardmove = var_380_0
	arg_380_0.sidemove = 0

	slot_0_84_1(arg_380_0)
	slot_0_73_1()

	return var_380_4, var_380_3
end

function slot_0_94_1(arg_381_0, arg_381_1, arg_381_2, arg_381_3)
	local var_381_0 = slot_0_91_1(arg_381_0, arg_381_1, arg_381_2)

	if slot_0_67_3 == nil then
		return
	end

	if slot_0_67_3.simtime > slot_0_37_5.simulation:get() * 0.01 then
		var_381_0 = false
	end

	if arg_381_3.weapon_type == 5 and not arg_381_1.m_bIsScoped then
		var_381_0 = false
	end

	if var_381_0 and slot_0_67_3.retreat <= 0 then
		local var_381_1 = slot_0_67_3.ctx

		if slot_0_69_2 == nil then
			local var_381_2 = arg_381_1:get_origin()
			local var_381_3 = (var_381_1.origin - var_381_2):normalize()
			local var_381_4 = var_381_1.obb_mins
			local var_381_5 = var_381_1.obb_maxs

			slot_0_69_2 = utils.trace_hull(var_381_2, var_381_1.origin - var_381_3 * 25, var_381_4, var_381_5, arg_381_1, 33636363, 0).end_pos
		end

		local var_381_6 = slot_0_93_1(arg_381_0, arg_381_1, var_381_1.origin)

		slot_0_67_3.retreat = var_381_6 and 1 or 0

		slot_0_83_1(var_381_1)

		return
	end

	if not slot_0_80_1(arg_381_1, arg_381_2, arg_381_3) then
		slot_0_71_2()

		return
	end

	if slot_0_67_3.ctx ~= nil and slot_0_67_3.retreat ~= -1 then
		local var_381_7 = slot_0_93_1(arg_381_0, arg_381_1, slot_0_69_2)

		if arg_381_1.m_vecVelocity:length2dsqr() > 1600 then
			slot_0_92_1()
		end

		slot_0_67_3.retreat = slot_0_67_3.retreat + 1

		if var_381_7 then
			slot_0_72_2()
			slot_0_71_2()
		end
	end
end

function slot_0_95_1(arg_382_0)
	local var_382_0 = entity.get_local_player()

	if var_382_0 == nil then
		return
	end

	local var_382_1 = var_382_0:get_player_weapon()

	if var_382_1 == nil then
		return
	end

	local var_382_2 = var_382_1:get_weapon_info()

	if var_382_2 == nil then
		return
	end

	local var_382_3 = slot_0_77_1(var_382_1, var_382_2)

	if not (slot_0_40_12[1]:get() and slot_0_37_5.weapons:get(var_382_3)) then
		slot_0_72_2()
		slot_0_71_2()

		return
	end

	slot_0_94_1(arg_382_0, var_382_0, var_382_1, var_382_2)
end

function slot_0_96_0()
	slot_0_71_2()
end

slot_0_97_0 = nil

function slot_0_98_0(arg_384_0)
	local var_384_0 = arg_384_0:get()

	if not var_384_0 then
		slot_0_72_2()
		slot_0_71_2()
	end

	events.aim_fire(slot_0_96_0, var_384_0)
	events.createmove(slot_0_95_1, var_384_0)
end

slot_0_37_5.enabled:set_callback(slot_0_98_0, true)

slot_0_37_4 = nil
slot_0_38_7 = slot_0_23_0.ragebot.logs
slot_0_39_9 = string.upper(slot_0_7_0.name:sub(1, 1))
slot_0_40_11 = string.lower(slot_0_7_0.name)
slot_0_41_14 = 7
slot_0_42_19 = 5
slot_0_43_23 = slot_0_41_14
slot_0_44_24 = {}
slot_0_45_22 = {
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
slot_0_46_21 = {
	inferno = "burned",
	decoy = "decoyed",
	knife = "knifed",
	molotov = "harmed",
	c4 = "bombed",
	smokegrenade = "harmed",
	incgrenade = "harmed",
	hegrenade = "naded",
	flashbang = "harmed"
}

function slot_0_47_22(arg_385_0)
	if not slot_0_38_7.output:get("Events") then
		return
	end

	print_dev(arg_385_0)
end

function slot_0_48_24(arg_386_0, arg_386_1)
	if not slot_0_38_7.output:get("Render") then
		return
	end

	local var_386_0 = slot_0_38_7.duration:get()
	local var_386_1 = #slot_0_44_24 + 1

	slot_0_44_24[var_386_1] = {
		alpha = 0,
		text = arg_386_1,
		color = arg_386_0,
		time = var_386_0
	}

	return var_386_1
end

function slot_0_49_25(arg_387_0)
	if not slot_0_38_7.output:get("Console") then
		return
	end

	print_raw(arg_387_0)
end

function slot_0_50_25(arg_388_0, arg_388_1, arg_388_2)
	local var_388_0 = string.gsub(arg_388_0, "${(.-)}", string.format("\a%s%%1\a%s", arg_388_1, arg_388_2))

	if var_388_0:sub(1, 1) ~= "\a" then
		var_388_0 = "\a" .. arg_388_2 .. var_388_0
	end

	return var_388_0
end

function slot_0_51_25()
	for iter_389_0 = 1, #slot_0_44_24 do
		slot_0_44_24[iter_389_0] = nil
	end
end

function slot_0_52_22(arg_390_0)
	if arg_390_0 == "Off" then
		return nil
	end

	if arg_390_0 == "Icon" then
		return slot_0_39_9
	end

	if arg_390_0 == "Text" then
		return slot_0_40_11
	end

	return arg_390_0
end

function slot_0_53_20(arg_391_0, arg_391_1, arg_391_2, arg_391_3, arg_391_4)
	local var_391_0 = 4

	if arg_391_3 > 0 then
		local var_391_1 = math.map(arg_391_3, 0, 1.5, 0, 115, true)
		local var_391_2 = arg_391_2:clone()

		var_391_2.a = var_391_1 * arg_391_4

		slot_0_15_0.shadow(arg_391_0, arg_391_1, var_391_2, slot_0_6_0(8 * arg_391_3), 0, var_391_0)
	end

	local var_391_3 = arg_391_2:clone()

	var_391_3.a = var_391_3.a * arg_391_4

	slot_0_15_0.rect(arg_391_0, arg_391_1, var_391_3, var_391_0)
end

function slot_0_54_22()
	local var_392_0 = slot_0_38_7.background_color:get()
	local var_392_1 = globals.frametime
	local var_392_2 = #slot_0_44_24
	local var_392_3 = slot_0_15_0.screen_size() / 2

	var_392_3.y = var_392_3.y + slot_0_38_7.offset:get() * 5

	local var_392_4 = slot_0_38_7.logo:get()
	local var_392_5 = var_392_4 == "!"
	local var_392_6 = slot_0_52_22(var_392_4)
	local var_392_7 = 4
	local var_392_8 = ""
	local var_392_9 = slot_0_15_0.measure_text(var_392_7, var_392_8, var_392_6)

	for iter_392_0 = var_392_2, 1, -1 do
		local var_392_10 = slot_0_44_24[iter_392_0]
		local var_392_11 = var_392_10.time > 0 and var_392_2 - iter_392_0 < 6

		var_392_10.alpha = slot_0_14_0.interp(var_392_10.alpha, var_392_11, 0.075)

		if not var_392_11 then
			if var_392_10.alpha <= 0 then
				table.remove(slot_0_44_24, iter_392_0)
			end
		else
			var_392_10.time = var_392_10.time - var_392_1
		end
	end

	local var_392_12 = 1
	local var_392_13 = ""
	local var_392_14 = slot_0_38_7.glow:get() * 0.01

	for iter_392_1 = 1, #slot_0_44_24 do
		local var_392_15 = slot_0_44_24[iter_392_1]
		local var_392_16 = var_392_15.color
		local var_392_17 = var_392_15.text
		local var_392_18 = var_392_15.alpha

		if not var_392_5 then
			var_392_17 = var_392_17 .. " !"
		end

		local var_392_19 = slot_0_15_0.measure_text(var_392_12, var_392_13, var_392_17)
		local var_392_20 = var_392_19 + vector(slot_0_41_14, slot_0_42_19) * 2

		if var_392_6 ~= nil then
			var_392_20.x = var_392_20.x + var_392_9.x + slot_0_43_23
		end

		local var_392_21 = var_392_3 - var_392_20 / 2
		local var_392_22 = var_392_21 + vector(slot_0_41_14, slot_0_42_19)
		local var_392_23 = vector(var_392_22.x, var_392_21.y + (var_392_20.y - var_392_9.y) / 2)

		slot_0_53_20(var_392_21, var_392_21 + var_392_20, var_392_0, var_392_14, var_392_18)

		if var_392_6 ~= nil then
			local var_392_24 = var_392_16:clone()

			var_392_24.a = var_392_24.a * var_392_18

			slot_0_15_0.text(var_392_7, var_392_23, var_392_24, var_392_8, var_392_6)

			var_392_22.x = var_392_22.x + var_392_9.x + slot_0_43_23
		end

		var_392_22.y = var_392_21.y + (var_392_20.y - var_392_19.y) / 2

		local var_392_25 = color(255, 255, 255, 255 * var_392_18)

		slot_0_15_0.text(var_392_12, var_392_22, var_392_25, var_392_13, var_392_17)

		var_392_3.y = var_392_3.y - slot_0_6_0((var_392_20.y + 5) * var_392_18)
	end
end

function slot_0_55_25(arg_393_0)
	local var_393_0 = arg_393_0.target

	if var_393_0 == nil then
		return
	end

	local var_393_1 = slot_0_38_7.hit_color:get()
	local var_393_2 = var_393_0:get_name()
	local var_393_3 = var_393_0.m_iHealth
	local var_393_4 = arg_393_0.backtrack
	local var_393_5 = arg_393_0.hitchance
	local var_393_6 = arg_393_0.damage or 0
	local var_393_7 = arg_393_0.wanted_damage or 0
	local var_393_8 = slot_0_45_22[arg_393_0.hitgroup] or "?"
	local var_393_9 = slot_0_45_22[arg_393_0.wanted_hitgroup] or "?"
	local var_393_10 = var_393_7 - var_393_6 > 10
	local var_393_11 = var_393_9 ~= var_393_8
	local var_393_12
	local var_393_13 = string.format("hit ${%s}'s ${%s} for ${%d} dmg", var_393_2, var_393_8, var_393_6)
	local var_393_14
	local var_393_15 = {}

	table.insert(var_393_15, string.format("hit: ${%s}", var_393_2))

	if var_393_11 then
		table.insert(var_393_15, string.format("hb: ${%s}/%s", var_393_8, var_393_9))
	else
		table.insert(var_393_15, string.format("hb: ${%s}", var_393_8))
	end

	if var_393_10 then
		table.insert(var_393_15, string.format("dmg: ${%d}/%d", var_393_6, var_393_7))
	else
		table.insert(var_393_15, string.format("dmg: ${%d}", var_393_6))
	end

	table.insert(var_393_15, string.format("bt: ${%d}", var_393_4))
	table.insert(var_393_15, string.format("hc: ${%d%%}", var_393_5))

	if var_393_3 <= 0 then
		table.insert(var_393_15, "rph: ${0} (dead)")
	else
		table.insert(var_393_15, string.format("rph: ${%d}", var_393_3))
	end

	local var_393_16 = table.concat(var_393_15, "  ")
	local var_393_17 = slot_0_50_25(var_393_13, var_393_1:to_hex(), "c8c8c8ff")
	local var_393_18 = slot_0_50_25(var_393_16, var_393_1:to_hex(), "c8c8c8ff")

	slot_0_47_22(var_393_18)
	slot_0_49_25(var_393_18)
	slot_0_48_24(var_393_1, var_393_17)
end

function slot_0_56_23(arg_394_0)
	local var_394_0 = arg_394_0.target

	if var_394_0 == nil then
		return
	end

	local var_394_1 = slot_0_38_7.miss_color:get()
	local var_394_2 = var_394_0:get_name()
	local var_394_3 = arg_394_0.state
	local var_394_4 = arg_394_0.hitchance
	local var_394_5 = arg_394_0.backtrack
	local var_394_6 = arg_394_0.wanted_damage or 0
	local var_394_7 = slot_0_45_22[arg_394_0.wanted_hitgroup] or "?"
	local var_394_8
	local var_394_9 = string.format("missed ${%s}'s ${%s} due to ${%s}", var_394_2, var_394_7, var_394_3)
	local var_394_10
	local var_394_11 = {}

	table.insert(var_394_11, string.format("missed: ${%s}", var_394_2))
	table.insert(var_394_11, string.format("hb: ${%s}", var_394_7))
	table.insert(var_394_11, string.format("due: ${%s}", var_394_3))
	table.insert(var_394_11, string.format("dmg: ${%d}", var_394_6))
	table.insert(var_394_11, string.format("bt: ${%d}", var_394_5))
	table.insert(var_394_11, string.format("hc: ${%d%%}", var_394_4))

	local var_394_12 = table.concat(var_394_11, "  ")
	local var_394_13 = slot_0_50_25(var_394_9, var_394_1:to_hex(), "c8c8c8ff")
	local var_394_14 = slot_0_50_25(var_394_12, var_394_1:to_hex(), "c8c8c8ff")

	slot_0_47_22(var_394_14)
	slot_0_49_25(var_394_14)
	slot_0_48_24(var_394_1, var_394_13)
end

function slot_0_57_20(arg_395_0)
	if arg_395_0.state == nil then
		slot_0_55_25(arg_395_0)
	else
		slot_0_56_23(arg_395_0)
	end
end

function slot_0_58_20(arg_396_0)
	local var_396_0 = entity.get_local_player()
	local var_396_1 = entity.get(arg_396_0.userid, true)

	if entity.get(arg_396_0.attacker, true) ~= var_396_0 or var_396_1 == var_396_0 then
		return
	end

	local var_396_2 = arg_396_0.weapon
	local var_396_3 = slot_0_46_21[var_396_2]

	if var_396_3 == nil then
		return
	end

	local var_396_4 = slot_0_38_7.hit_color:get()
	local var_396_5 = var_396_1:get_name()
	local var_396_6 = var_396_1.m_iHealth
	local var_396_7 = arg_396_0.dmg_health
	local var_396_8
	local var_396_9 = string.format("%s ${%s} for ${%d} dmg", var_396_3, var_396_5, var_396_7)
	local var_396_10
	local var_396_11 = {}

	table.insert(var_396_11, string.format("harmed: ${%s}", var_396_5))
	table.insert(var_396_11, string.format("dmg: ${%d}", var_396_7))

	if var_396_6 <= 0 then
		table.insert(var_396_11, "rph: ${0} (dead)")
	else
		table.insert(var_396_11, string.format("rph: ${%d}", var_396_6))
	end

	table.insert(var_396_11, string.format("wep: ${%s}", var_396_2))

	local var_396_12 = table.concat(var_396_11, "  ")
	local var_396_13 = slot_0_50_25(var_396_9, var_396_4:to_hex(), "c8c8c8ff")
	local var_396_14 = slot_0_50_25(var_396_12, var_396_4:to_hex(), "c8c8c8ff")

	slot_0_47_22(var_396_14)
	slot_0_49_25(var_396_14)
	slot_0_48_24(var_396_4, var_396_13)
end

slot_0_59_16 = nil

function slot_0_60_8(arg_397_0)
	local var_397_0 = arg_397_0:get("Render")

	if not var_397_0 then
		slot_0_51_25()
	end

	events.render(slot_0_54_22, var_397_0)
end

function slot_0_61_7(arg_398_0)
	local var_398_0 = arg_398_0:get()

	if not var_398_0 then
		slot_0_51_25()
	end

	if not var_398_0 then
		events.render(slot_0_54_22, false)
	end

	if var_398_0 then
		slot_0_38_7.output:set_callback(slot_0_60_8, true)
	else
		slot_0_38_7.output:unset_callback(slot_0_60_8)
	end

	events.aim_ack(slot_0_57_20, var_398_0)
	events.player_hurt(slot_0_58_20, var_398_0)
end

slot_0_38_7.enabled:set_callback(slot_0_61_7, true)

slot_0_38_6 = nil
slot_0_39_8 = slot_0_23_0.ragebot.dormant_aimbot
slot_0_40_10 = true
slot_0_41_13 = 5
slot_0_42_18 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
slot_0_43_22 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
slot_0_44_23 = nil
slot_0_45_21 = nil
slot_0_46_20 = nil
slot_0_47_21 = nil
slot_0_48_23 = nil
slot_0_49_24 = false
slot_0_50_24 = false
slot_0_51_24 = 1
slot_0_52_21 = 0
slot_0_53_19 = {
	[0] = "Generic",
	"Head",
	"Chest",
	"Stomach",
	"Chest",
	"Chest",
	"Legs",
	"Legs",
	"Head",
	nil,
	"Gear"
}
slot_0_54_21 = {
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

function slot_0_55_24(arg_399_0, arg_399_1)
	for iter_399_0 = 1, #arg_399_0 do
		if arg_399_0[iter_399_0] == arg_399_1 then
			return true
		end
	end

	return false
end

function slot_0_56_22(arg_400_0)
	return arg_400_0 >= 1 and arg_400_0 <= 6
end

function slot_0_57_19()
	local var_401_0 = {}
	local var_401_1 = entity.get_player_resource()

	for iter_401_0 = 1, globals.max_players do
		local var_401_2 = entity.get(iter_401_0)

		if var_401_2 == nil then
			-- block empty
		elseif not (var_401_1.m_bConnected[iter_401_0] and var_401_2:is_enemy() and var_401_2:is_dormant()) then
			-- block empty
		else
			table.insert(var_401_0, var_401_2)
		end
	end

	return var_401_0
end

function slot_0_58_19(arg_402_0, arg_402_1, arg_402_2)
	local var_402_0 = arg_402_0:to(arg_402_1):angles()
	local var_402_1 = math.rad(var_402_0.y + 90)
	local var_402_2 = vector(math.cos(var_402_1), math.sin(var_402_1), 0) * arg_402_2

	return {
		{
			text = "Middle",
			vec = arg_402_1
		},
		{
			text = "Left",
			vec = arg_402_1 + var_402_2
		},
		{
			text = "Right",
			vec = arg_402_1 - var_402_2
		}
	}
end

function slot_0_59_15(arg_403_0, arg_403_1, arg_403_2, arg_403_3)
	local var_403_0, var_403_1 = utils.trace_bullet(arg_403_0, arg_403_1, arg_403_2, arg_403_3)

	if var_403_1 ~= nil then
		local var_403_2 = var_403_1.entity

		if var_403_2 == nil then
			return 0, var_403_1
		end

		if var_403_2:is_player() and not var_403_2:is_enemy() then
			return 0, var_403_1
		end
	end

	return var_403_0, var_403_1
end

function slot_0_60_7(arg_404_0)
	slot_0_42_18:override(false)

	local var_404_0 = entity.get_local_player()

	if var_404_0 == nil then
		return
	end

	local var_404_1 = var_404_0:get_player_weapon()

	if var_404_1 == nil then
		return
	end

	local var_404_2 = var_404_1:get_weapon_info()

	if var_404_2 == nil then
		return
	end

	local var_404_3 = var_404_1:get_inaccuracy()

	if var_404_3 == nil then
		return
	end

	local var_404_4 = globals.tickcount
	local var_404_5 = var_404_0:get_eye_position()
	local var_404_6 = var_404_0:get_simulation_time().current
	local var_404_7 = bit.band(var_404_0.m_fFlags, bit.lshift(1, 0)) ~= 0

	if var_404_4 < slot_0_52_21 then
		return
	end

	if arg_404_0.in_jump and not var_404_7 then
		return
	end

	local var_404_8 = var_404_2.weapon_type

	if not slot_0_56_22(var_404_8) or var_404_1.m_iClip1 <= 0 then
		return false
	end

	local var_404_9 = slot_0_57_19()
	local var_404_10 = slot_0_39_8.hitboxes:get()

	if var_404_4 % #var_404_9 ~= 0 then
		slot_0_51_24 = slot_0_51_24 + 1
	else
		slot_0_51_24 = 1
	end

	local var_404_11 = var_404_9[slot_0_51_24]

	if var_404_11 == nil then
		return
	end

	local var_404_12 = var_404_11:get_bbox()
	local var_404_13 = var_404_11:get_origin()
	local var_404_14 = var_404_11.m_flDuckAmount
	local var_404_15 = slot_0_39_8.alpha_modifier:get()
	local var_404_16 = slot_0_39_8.minimum_damage:get()

	if var_404_16 == 0 then
		var_404_16 = slot_0_43_22:get()
	end

	if var_404_16 >= 100 then
		var_404_16 = var_404_16 - 100 + var_404_11.m_iHealth
	end

	local var_404_17 = {}

	for iter_404_0 = 1, #slot_0_54_21 do
		local var_404_18 = slot_0_54_21[iter_404_0]
		local var_404_19 = var_404_18.vec
		local var_404_20 = var_404_18.scale
		local var_404_21 = var_404_18.hitbox

		if var_404_21 == "Head" then
			var_404_19 = var_404_19 - vector(0, 0, 10 * var_404_14)
		end

		if var_404_21 == "Chest" then
			var_404_19 = var_404_19 - vector(0, 0, 4 * var_404_14)
		end

		if #var_404_10 ~= 0 then
			if slot_0_55_24(var_404_10, var_404_21) then
				table.insert(var_404_17, {
					vec = var_404_19,
					scale = var_404_20,
					hitbox = var_404_21
				})
			end
		else
			table.insert(var_404_17, 1, {
				vec = var_404_19,
				scale = var_404_20,
				hitbox = var_404_21
			})
		end
	end

	if not (var_404_2.is_revolver and var_404_6 > var_404_1.m_flNextPrimaryAttack or var_404_6 > math.max(var_404_0.m_flNextAttack, var_404_1.m_flNextPrimaryAttack, var_404_1.m_flNextSecondaryAttack)) then
		return
	end

	local var_404_22
	local var_404_23

	if var_404_15 >= math.floor(var_404_12.alpha * 100) + 5 then
		return
	end

	for iter_404_1 = 1, #var_404_17 do
		local var_404_24 = var_404_17[iter_404_1]
		local var_404_25 = slot_0_58_19(var_404_5, var_404_13 + var_404_24.vec, var_404_24.scale)

		for iter_404_2 = 1, #var_404_25 do
			local var_404_26 = var_404_25[iter_404_2]
			local var_404_27 = var_404_26.vec
			local var_404_28, var_404_29 = slot_0_59_15(var_404_0, var_404_5, var_404_27, function(arg_405_0)
				return arg_405_0 == var_404_11
			end)

			if var_404_29 ~= nil and var_404_29:is_visible() then
				-- block empty
			elseif var_404_28 ~= 0 and var_404_16 < var_404_28 then
				var_404_22 = var_404_27
				var_404_23 = var_404_28
				slot_0_44_23 = var_404_11
				slot_0_46_20 = var_404_24.hitbox
				slot_0_47_21 = var_404_28
				slot_0_45_21 = var_404_26.text
				slot_0_48_23 = var_404_12.alpha

				break
			end
		end

		if var_404_22 and var_404_23 then
			break
		end
	end

	if not var_404_22 or not var_404_23 then
		return
	end

	local var_404_30 = var_404_5:to(var_404_22):angles()

	arg_404_0.block_movement = 1

	if slot_0_40_10 then
		local var_404_31 = not arg_404_0.in_jump and var_404_7
		local var_404_32 = var_404_0.m_bIsScoped or var_404_0.m_bResumeZoom
		local var_404_33 = var_404_2.weapon_type == slot_0_41_13

		if not var_404_32 and var_404_33 and var_404_31 then
			arg_404_0.in_attack2 = true
		end
	end

	if var_404_3 < 0.01 then
		arg_404_0.view_angles = var_404_30
		arg_404_0.in_attack = true
		slot_0_50_24 = true
	end
end

function slot_0_61_6(arg_406_0)
	utils.execute_after(0.03, function()
		if entity.get(arg_406_0.userid, true) == entity.get_local_player() then
			if slot_0_50_24 and not slot_0_49_24 then
				events.dormant_miss:call({
					userid = slot_0_44_23,
					aim_hitbox = slot_0_46_20,
					aim_damage = slot_0_47_21,
					aim_point = slot_0_45_21,
					accuracy = slot_0_48_23
				})
			end

			slot_0_49_24 = false
			slot_0_50_24 = false
			slot_0_44_23 = nil
			slot_0_46_20 = nil
			slot_0_47_21 = nil
			slot_0_45_21 = nil
			slot_0_48_23 = nil
		end
	end)
end

function slot_0_62_4(arg_408_0)
	local var_408_0 = entity.get_local_player()
	local var_408_1 = entity.get(arg_408_0.userid, true)
	local var_408_2 = entity.get(arg_408_0.attacker, true)

	if var_408_1 == nil or var_408_2 ~= var_408_0 then
		return
	end

	local var_408_3 = var_408_1:get_bbox()

	if var_408_3 == nil then
		return
	end

	if var_408_1:is_dormant() and slot_0_50_24 == true then
		slot_0_49_24 = true

		events.dormant_hit:call({
			userid = var_408_1,
			attacker = var_408_2,
			health = arg_408_0.health,
			armor = arg_408_0.armor,
			weapon = arg_408_0.weapon,
			dmg_health = arg_408_0.dmg_health,
			dmg_armor = arg_408_0.dmg_armor,
			hitgroup = arg_408_0.hitgroup,
			accuracy = var_408_3.alpha,
			hitbox = slot_0_53_19[arg_408_0.hitgroup],
			aim_point = slot_0_45_21,
			aim_hitbox = slot_0_46_20,
			aim_damage = slot_0_47_21
		})
	end
end

function slot_0_63_4()
	slot_0_42_18:override()
end

slot_0_64_3 = nil

function slot_0_65_3(arg_410_0)
	local var_410_0 = arg_410_0:get()

	if not var_410_0 then
		slot_0_42_18:override()
	end

	events.shutdown(slot_0_63_4, var_410_0)
	events.createmove(slot_0_60_7, var_410_0)
	events.weapon_fire(slot_0_61_6, var_410_0)
	events.player_hurt(slot_0_62_4, var_410_0)
end

slot_0_39_8.enabled:set_callback(slot_0_65_3, true)

slot_0_39_7 = nil
slot_0_40_9 = slot_0_23_0.ragebot.force_shot
slot_0_41_12 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
slot_0_42_17 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance", "Double Tap")
slot_0_43_21 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")
slot_0_44_22 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage", "Delay Shot")
slot_0_45_20 = ui.find("Aimbot", "Ragebot", "Safety", "Ensure Hitbox Safety")

function slot_0_46_19()
	if not slot_0_40_9.enabled:get() then
		return
	end

	local var_411_0 = entity.get_local_player()

	if var_411_0 == nil then
		return
	end

	local var_411_1 = var_411_0:get_player_weapon()

	if var_411_1 == nil then
		return
	end

	local var_411_2 = slot_0_1_0(var_411_1)

	if var_411_2 == nil then
		return
	end

	local var_411_3 = var_411_0.m_vecVelocity
	local var_411_4 = var_411_0.m_fFlags
	local var_411_5 = var_411_3:length()
	local var_411_6 = bit.band(var_411_4, 4) == 4

	slot_0_43_21:override("Default")
	slot_0_44_22:override(false)
	slot_0_45_20:override({})

	local var_411_7 = math.floor(math.min(var_411_2.max_player_speed, var_411_2.max_player_speed_alt))
	local var_411_8 = {
		cur = math.floor(var_411_1:get_inaccuracy() * 100),
		stand = math.floor(math.min(var_411_2.inaccuracy_stand, var_411_2.inaccuracy_stand_alt) * 100),
		crouch = math.floor(math.min(var_411_2.inaccuracy_crouch, var_411_2.inaccuracy_crouch_alt) * 100),
		move = math.floor(math.min(var_411_2.inaccuracy_move, var_411_2.inaccuracy_move_alt) * 100)
	}
	local var_411_9 = var_411_6 and var_411_8.crouch or var_411_8.stand
	local var_411_10 = var_411_9 + (var_411_8.move - var_411_9) / var_411_7 * math.min(var_411_5, var_411_7 / 2)

	if var_411_8.cur - var_411_10 <= 0 then
		slot_0_41_12:override(0)
		slot_0_42_17:override(0)
	else
		slot_0_41_12:override(nil)
		slot_0_42_17:override(nil)
	end
end

slot_0_47_20 = nil

function slot_0_48_22(arg_412_0)
	local var_412_0 = arg_412_0:get()

	if not var_412_0 then
		slot_0_41_12:override()
		slot_0_42_17:override()
		slot_0_43_21:override()
		slot_0_44_22:override()
		slot_0_45_20:override()
	end

	events.createmove:set(slot_0_46_19, var_412_0)
end

slot_0_40_9.enabled:set_callback(slot_0_48_22, true)

slot_0_35_0 = nil
slot_0_36_1 = nil
slot_0_37_3 = slot_0_23_0.visuals.aspect_ratio
slot_0_38_5 = cvar.r_aspectratio

function slot_0_39_6()
	slot_0_38_5:float(tonumber(slot_0_38_5:string()), true)
end

function slot_0_40_8(arg_414_0)
	slot_0_38_5:float(arg_414_0, true)
end

function slot_0_41_11()
	slot_0_39_6()
end

slot_0_42_16 = nil

function slot_0_43_20(arg_416_0)
	slot_0_40_8(arg_416_0:get() * 0.01)
end

function slot_0_44_21(arg_417_0)
	local var_417_0 = arg_417_0:get()

	if not var_417_0 then
		slot_0_39_6()
	end

	if var_417_0 then
		slot_0_37_3.value:set_callback(slot_0_43_20, true)
	else
		slot_0_37_3.value:unset_callback(slot_0_43_20)
	end

	events.shutdown(slot_0_41_11, var_417_0)
end

slot_0_37_3.enabled:set_callback(slot_0_44_21, true)

slot_0_37_2 = nil
slot_0_38_4 = slot_0_23_0.visuals.viewmodel
slot_0_39_5 = 0
slot_0_40_7 = cvar.cl_righthand
slot_0_41_10 = cvar.viewmodel_fov
slot_0_42_15 = cvar.viewmodel_offset_x
slot_0_43_19 = cvar.viewmodel_offset_y
slot_0_44_20 = cvar.viewmodel_offset_z
slot_0_45_19 = nil

function slot_0_46_18(arg_418_0)
	return tonumber(arg_418_0:string())
end

function slot_0_47_19(arg_419_0)
	if slot_0_40_7:string() == "1" then
		slot_0_40_7:int(arg_419_0 and 0 or 1, true)
	else
		slot_0_40_7:int(arg_419_0 and 1 or 0, true)
	end
end

function slot_0_48_21()
	slot_0_41_10:float(slot_0_46_18(slot_0_41_10), false)
	slot_0_42_15:float(slot_0_46_18(slot_0_42_15), false)
	slot_0_43_19:float(slot_0_46_18(slot_0_43_19), false)
	slot_0_44_20:float(slot_0_46_18(slot_0_44_20), false)
	slot_0_40_7:int(slot_0_40_7:string() == "1" and 1 or 0, false)
end

function slot_0_49_23()
	slot_0_48_21()
end

function slot_0_50_23()
	local var_422_0 = entity.get_local_player()

	if var_422_0 == nil then
		return
	end

	local var_422_1 = var_422_0:get_player_weapon()

	if var_422_1 == nil then
		return
	end

	local var_422_2 = var_422_1:get_weapon_index()

	if slot_0_45_19 ~= var_422_2 then
		slot_0_45_19 = var_422_2

		local var_422_3 = var_422_1:get_weapon_info()

		if var_422_3 == nil then
			return
		end

		local var_422_4 = var_422_3.weapon_type == slot_0_39_5

		slot_0_47_19(var_422_4)
	end
end

function slot_0_51_23(arg_423_0)
	if not arg_423_0 then
		slot_0_48_21()
	end

	if not arg_423_0 then
		events.pre_render(slot_0_50_23, arg_423_0)
	end

	events.shutdown(slot_0_49_23, arg_423_0)
end

slot_0_52_20 = nil

function slot_0_53_18(arg_424_0)
	slot_0_41_10:float(arg_424_0:get() * 0.01, true)
end

function slot_0_54_20(arg_425_0)
	slot_0_42_15:float(arg_425_0:get() * 0.01, true)
end

function slot_0_55_23(arg_426_0)
	slot_0_43_19:float(arg_426_0:get() * 0.01, true)
end

function slot_0_56_21(arg_427_0)
	slot_0_44_20:float(arg_427_0:get() * 0.01, true)
end

function slot_0_57_18(arg_428_0)
	local var_428_0 = arg_428_0:get()

	if not var_428_0 then
		slot_0_40_7:int(slot_0_40_7:string() == "1" and 1 or 0, false)
	else
		slot_0_45_19 = nil
	end

	events.pre_render(slot_0_50_23, var_428_0)
end

function slot_0_58_18(arg_429_0)
	local var_429_0 = arg_429_0:get()

	if var_429_0 then
		slot_0_38_4.fov:set_callback(slot_0_53_18, true)
		slot_0_38_4.offset_x:set_callback(slot_0_54_20, true)
		slot_0_38_4.offset_y:set_callback(slot_0_55_23, true)
		slot_0_38_4.offset_z:set_callback(slot_0_56_21, true)
		slot_0_38_4.opposite_knife_hand:set_callback(slot_0_57_18, true)
	else
		slot_0_38_4.fov:unset_callback(slot_0_53_18)
		slot_0_38_4.offset_x:unset_callback(slot_0_54_20)
		slot_0_38_4.offset_y:unset_callback(slot_0_55_23)
		slot_0_38_4.offset_z:unset_callback(slot_0_56_21)
		slot_0_38_4.opposite_knife_hand:unset_callback(slot_0_57_18)
	end

	slot_0_51_23(var_429_0)
end

slot_0_38_4.enabled:set_callback(slot_0_58_18, true)

slot_0_38_3 = nil
slot_0_39_4 = slot_0_23_0.visuals.indicators
slot_0_40_6 = {}
slot_0_41_9 = {
	{
		"✦",
		0,
		10,
		0.5
	},
	{
		"⋆",
		-3,
		3,
		0.2
	},
	{
		"★",
		-1,
		8,
		0.4
	},
	{
		"✦",
		0,
		6,
		0.7
	},
	{
		"⋆",
		-2,
		2,
		0.3
	},
	{
		"★",
		1,
		7,
		0.6
	},
	{
		"⋆",
		0,
		3,
		0.2
	},
	{
		"✦",
		0,
		8,
		0.7
	},
	{
		"⋆",
		-2,
		7,
		0.2
	}
}
slot_0_42_14 = 0
slot_0_43_18 = 0
slot_0_44_19 = 0
slot_0_45_18 = 0
slot_0_46_17 = 0

function slot_0_47_18()
	if not slot_0_24_0.is_onground then
		if slot_0_24_0.is_crouched then
			return "airc"
		end

		return "air"
	end

	if slot_0_24_0.is_crouched then
		if slot_0_24_0.is_moving then
			return "sneak"
		end

		return "crouch"
	end

	if slot_0_24_0.is_moving then
		if slot_0_9_0.antiaim.misc.slow_walk:get() then
			return "walk"
		end

		return "run"
	end

	return "stand"
end

function slot_0_48_20(arg_431_0, arg_431_1)
	local var_431_0 = globals.realtime
	local var_431_1 = {}
	local var_431_2 = #slot_0_41_9
	local var_431_3 = 0
	local var_431_4 = 0

	for iter_431_0 = 1, var_431_2 do
		local var_431_5 = slot_0_41_9[iter_431_0]
		local var_431_6 = slot_0_15_0.measure_text(1, "", var_431_5[1])

		var_431_3 = var_431_3 + (var_431_6.x + var_431_5[2])
		var_431_4 = math.max(var_431_4, var_431_6.y + var_431_5[3])
		var_431_1[iter_431_0] = var_431_6
	end

	local var_431_7 = arg_431_0:clone()

	var_431_7.x = slot_0_6_0(var_431_7.x - var_431_3 * 0.5 * (1 - slot_0_43_18))

	for iter_431_1 = 1, var_431_2 do
		local var_431_8 = slot_0_41_9[iter_431_1]
		local var_431_9 = var_431_1[iter_431_1]
		local var_431_10 = var_431_8[1]
		local var_431_11 = var_431_8[2]
		local var_431_12 = var_431_8[3]
		local var_431_13 = var_431_8[4]
		local var_431_14 = (math.sin(var_431_0 * var_431_13) * 0.5 + 0.5) * 0.7 + 0.3
		local var_431_15 = arg_431_1:clone()
		local var_431_16 = var_431_7:clone()

		var_431_16.x = var_431_16.x + var_431_11
		var_431_16.y = var_431_16.y + var_431_12
		var_431_15.a = var_431_15.a * var_431_14

		slot_0_15_0.text(1, var_431_16, var_431_15, "", var_431_10)

		var_431_7.x = var_431_7.x + (var_431_9.x + var_431_11)
	end

	arg_431_0.y = arg_431_0.y + var_431_4 * 0.66
end

function slot_0_49_22(arg_432_0, arg_432_1, arg_432_2)
	local var_432_0 = 4
	local var_432_1 = slot_0_7_0.name
	local var_432_2 = ""
	local var_432_3 = slot_0_15_0.measure_text(var_432_0, var_432_2, var_432_1)
	local var_432_4 = -globals.realtime * 1.25
	local var_432_5 = slot_0_18_0.gradient(var_432_1, var_432_4, arg_432_1, arg_432_2)
	local var_432_6 = arg_432_0:clone()

	var_432_6.x = slot_0_6_0(var_432_6.x - var_432_3.x * 0.5 * (1 - slot_0_43_18))

	slot_0_15_0.text(var_432_0, var_432_6, arg_432_1, var_432_2, var_432_5)

	arg_432_0.y = arg_432_0.y + var_432_3.y
end

function slot_0_50_22(arg_433_0, arg_433_1, arg_433_2)
	local var_433_0 = 1
	local var_433_1 = slot_0_47_18()
	local var_433_2 = ""
	local var_433_3 = slot_0_15_0.measure_text(var_433_0, var_433_2, var_433_1)
	local var_433_4 = arg_433_1:clone()
	local var_433_5 = arg_433_0:clone()

	var_433_4.a = var_433_4.a * arg_433_2
	var_433_5.x = slot_0_6_0(var_433_5.x - var_433_3.x * 0.5 * (1 - slot_0_43_18))

	slot_0_15_0.text(var_433_0, var_433_5, var_433_4, var_433_2, var_433_1)

	arg_433_0.y = arg_433_0.y + slot_0_6_0(var_433_3.y)
end

function slot_0_51_22(arg_434_0, arg_434_1, arg_434_2)
	local var_434_0 = 1
	local var_434_1 = "dt"
	local var_434_2 = ""
	local var_434_3 = slot_0_15_0.measure_text(var_434_0, var_434_2, var_434_1)
	local var_434_4 = arg_434_1:clone()
	local var_434_5 = arg_434_0:clone()
	local var_434_6 = rage.exploit:get()
	local var_434_7 = var_434_4:lerp(color(255, 0, 50, 255), 1 - var_434_6 * var_434_6)

	var_434_7.a = var_434_7.a * arg_434_2
	var_434_5.x = slot_0_6_0(var_434_5.x - var_434_3.x * 0.5 * (1 - slot_0_43_18))

	slot_0_15_0.text(var_434_0, var_434_5, var_434_7, var_434_2, var_434_1)

	arg_434_0.y = arg_434_0.y + slot_0_6_0(var_434_3.y * arg_434_2)
end

function slot_0_52_19(arg_435_0, arg_435_1, arg_435_2)
	local var_435_0 = 1
	local var_435_1 = "dmg"
	local var_435_2 = ""
	local var_435_3 = slot_0_15_0.measure_text(var_435_0, var_435_2, var_435_1)
	local var_435_4 = arg_435_1:clone()
	local var_435_5 = arg_435_0:clone()

	var_435_4.a = var_435_4.a * arg_435_2
	var_435_5.x = slot_0_6_0(var_435_5.x - var_435_3.x * 0.5 * (1 - slot_0_43_18))

	slot_0_15_0.text(var_435_0, var_435_5, var_435_4, var_435_2, var_435_1)

	arg_435_0.y = arg_435_0.y + slot_0_6_0(var_435_3.y * arg_435_2)
end

function slot_0_53_17(arg_436_0, arg_436_1, arg_436_2)
	local var_436_0 = 1
	local var_436_1 = "osaa"
	local var_436_2 = ""
	local var_436_3 = slot_0_15_0.measure_text(var_436_0, var_436_2, var_436_1)
	local var_436_4 = arg_436_1:clone()
	local var_436_5 = arg_436_0:clone()

	var_436_4.a = var_436_4.a * arg_436_2
	var_436_5.x = slot_0_6_0(var_436_5.x - var_436_3.x * 0.5 * (1 - slot_0_43_18))

	slot_0_15_0.text(var_436_0, var_436_5, var_436_4, var_436_2, var_436_1)

	arg_436_0.y = arg_436_0.y + slot_0_6_0(var_436_3.y * arg_436_2)
end

function slot_0_54_19(arg_437_0)
	local var_437_0 = arg_437_0:is_alive()
	local var_437_1 = arg_437_0.m_bIsScoped
	local var_437_2 = slot_0_29_0.get(slot_0_9_0.ragebot.selection.min_damage)
	local var_437_3 = var_437_2 ~= nil and var_437_2.active or false
	local var_437_4 = slot_0_9_0.ragebot.main.double_tap[1]:get()
	local var_437_5 = slot_0_9_0.ragebot.main.hide_shots[1]:get()

	slot_0_42_14 = slot_0_14_0.interp(slot_0_42_14, var_437_0, 0.05)
	slot_0_43_18 = slot_0_14_0.interp(slot_0_43_18, var_437_1, 0.05)
	slot_0_44_19 = slot_0_14_0.interp(slot_0_44_19, var_437_4, 0.05)
	slot_0_45_18 = slot_0_14_0.interp(slot_0_45_18, var_437_3, 0.05)
	slot_0_46_17 = slot_0_14_0.interp(slot_0_46_17, var_437_5, 0.05)
end

function slot_0_55_22()
	local var_438_0 = slot_0_15_0.screen_size() * 0.5
	local var_438_1 = slot_0_39_4.accent_color:get()
	local var_438_2 = slot_0_39_4.secondary_color:get()

	var_438_0.x = slot_0_6_0(var_438_0.x + slot_0_6_0(10 * slot_0_43_18))
	var_438_0.y = var_438_0.y + slot_0_39_4.offset:get()
	var_438_1.a = var_438_1.a * slot_0_42_14
	var_438_2.a = var_438_2.a * slot_0_42_14

	slot_0_48_20(var_438_0, var_438_1)
	slot_0_49_22(var_438_0, var_438_1, var_438_2)
	slot_0_50_22(var_438_0, color(255, 255, 255, 200), slot_0_42_14)
	slot_0_51_22(var_438_0, color(255, 255, 255, 200), slot_0_44_19 * slot_0_42_14)
	slot_0_52_19(var_438_0, color(255, 255, 255, 200), slot_0_45_18 * slot_0_42_14)
	slot_0_53_17(var_438_0, color(255, 255, 255, 200 * (1 - slot_0_44_19 * 0.5)), slot_0_46_17 * slot_0_42_14)
end

function slot_0_40_6.on_render()
	local var_439_0 = entity.get_local_player()

	if var_439_0 == nil then
		return
	end

	slot_0_54_19(var_439_0)

	if slot_0_42_14 > 0 then
		slot_0_55_22()
	end
end

slot_0_41_8 = {}
slot_0_42_13 = ""
slot_0_43_17 = 0
slot_0_44_18 = 0
slot_0_45_17 = 0
slot_0_46_16 = 0
slot_0_47_17 = 0
slot_0_48_19 = 0

function slot_0_49_21(arg_440_0)
	local var_440_0 = arg_440_0:get_player_weapon()

	if var_440_0 == nil then
		return false
	end

	local var_440_1 = var_440_0:get_weapon_info()

	if var_440_1 == nil then
		return false
	end

	if var_440_1.type ~= 9 then
		return false
	end

	return true
end

function slot_0_50_21(arg_441_0, arg_441_1)
	local var_441_0 = globals.realtime * 3
	local var_441_1 = math.abs(math.sin(var_441_0))

	return slot_0_8_0.lerp(arg_441_0, arg_441_1, var_441_1)
end

function slot_0_51_21()
	if not slot_0_24_0.is_onground then
		return "-AIR-"
	end

	if slot_0_24_0.is_crouched then
		return "-CROUCH-"
	end

	if slot_0_24_0.is_moving then
		if slot_0_9_0.antiaim.misc.slow_walk:get() then
			return "-WALKING-"
		end

		return "-MOVING-"
	end

	return "-STANDING-"
end

function slot_0_52_18()
	if slot_0_9_0.ragebot.main.double_tap[1]:get() then
		slot_0_42_13 = "DT"
	elseif slot_0_9_0.ragebot.main.hide_shots[1]:get() then
		slot_0_42_13 = "HIDE"
	end

	return slot_0_42_13, color(255, 255, 255, 255)
end

function slot_0_53_16(arg_444_0)
	if arg_444_0 == 0 then
		return "WAITING", color(255, 64, 64, 255)
	end

	if arg_444_0 == 1 then
		if slot_0_25_0.defensive_ticks > 0 then
			return "ACTIVE", color(120, 255, 255, 255)
		end

		return "READY", color(192, 255, 109, 255)
	end

	local var_444_0 = color(255, 64, 64, 255)
	local var_444_1 = color(192, 255, 109, 255)

	return "CHARGING", var_444_0:lerp(var_444_1, arg_444_0)
end

function slot_0_54_18(arg_445_0)
	local var_445_0 = arg_445_0:is_alive()
	local var_445_1 = arg_445_0.m_bIsScoped
	local var_445_2 = slot_0_49_21(arg_445_0)
	local var_445_3 = slot_0_29_0.get(slot_0_9_0.ragebot.selection.min_damage)
	local var_445_4 = var_445_3 ~= nil and var_445_3.active or false
	local var_445_5 = slot_0_9_0.ragebot.main.double_tap[1]:get()
	local var_445_6 = slot_0_9_0.ragebot.main.hide_shots[1]:get()
	local var_445_7 = 0

	if var_445_0 then
		var_445_7 = var_445_2 and 0.5 or 1
	end

	slot_0_43_17 = slot_0_14_0.interp(slot_0_43_17, var_445_7, 0.05)
	slot_0_44_18 = slot_0_14_0.interp(slot_0_44_18, var_445_1, 0.05)
	slot_0_46_16 = slot_0_14_0.interp(slot_0_46_16, var_445_5, 0.03)
	slot_0_47_17 = slot_0_14_0.interp(slot_0_47_17, var_445_4, 0.03)
	slot_0_48_19 = slot_0_14_0.interp(slot_0_48_19, var_445_6, 0.03)
end

function slot_0_55_21(arg_446_0, arg_446_1, arg_446_2, arg_446_3)
	local var_446_0 = 2
	local var_446_1 = ""
	local var_446_2 = "ANGELIC"
	local var_446_3 = "YAW"
	local var_446_4 = slot_0_15_0.measure_text(var_446_0, var_446_1, var_446_2)
	local var_446_5 = slot_0_15_0.measure_text(var_446_0, var_446_1, var_446_3)
	local var_446_6 = var_446_4.x + var_446_5.x
	local var_446_7 = math.max(var_446_4.y, var_446_5.y)
	local var_446_8 = arg_446_0:clone()
	local var_446_9 = var_446_6 * 0.5
	local var_446_10 = slot_0_50_21(0.25, 1)
	local var_446_11 = arg_446_1:clone()
	local var_446_12 = arg_446_2:clone()

	var_446_11.a = var_446_11.a * arg_446_3
	var_446_12.a = var_446_12.a * arg_446_3
	var_446_11.a = var_446_11.a * var_446_10
	var_446_8.x = slot_0_6_0(var_446_8.x - var_446_9 * (1 - slot_0_44_18) + 1)

	slot_0_15_0.text(var_446_0, var_446_8, var_446_12, var_446_1, var_446_2)

	var_446_8.x = slot_0_6_0(var_446_8.x + var_446_4.x)

	slot_0_15_0.text(var_446_0, var_446_8, var_446_11, var_446_1, var_446_3)

	arg_446_0.y = slot_0_6_0(arg_446_0.y + (var_446_7 - 3))
end

function slot_0_56_20(arg_447_0, arg_447_1, arg_447_2)
	local var_447_0 = 2
	local var_447_1 = ""
	local var_447_2 = slot_0_51_21()
	local var_447_3 = slot_0_15_0.measure_text(var_447_0, var_447_1, var_447_2)
	local var_447_4 = var_447_3.x
	local var_447_5 = var_447_3.y

	if var_447_4 > slot_0_45_17 then
		slot_0_45_17 = slot_0_14_0.interp(slot_0_45_17, var_447_4, 0.05)
	else
		slot_0_45_17 = var_447_4
	end

	local var_447_6 = arg_447_0:clone()
	local var_447_7 = slot_0_45_17 * 0.5

	var_447_6.x = slot_0_6_0(var_447_6.x - var_447_7 * (1 - slot_0_44_18) + 1)

	local var_447_8 = color(255, 255, 255, 255)

	var_447_8.a = var_447_8.a * arg_447_2

	slot_0_15_0.push_clip_rect(var_447_6, var_447_6 + vector(slot_0_45_17, var_447_5))
	slot_0_15_0.text(var_447_0, var_447_6, var_447_8, var_447_1, var_447_2)
	slot_0_15_0.pop_clip_rect()

	arg_447_0.y = slot_0_6_0(arg_447_0.y + (var_447_5 - 3))
end

function slot_0_57_17(arg_448_0, arg_448_1, arg_448_2)
	local var_448_0 = 2
	local var_448_1 = ""
	local var_448_2 = rage.exploit:get()
	local var_448_3, var_448_4 = slot_0_52_18()
	local var_448_5, var_448_6 = slot_0_53_16(var_448_2)
	local var_448_7 = string.format("\a%s%s \a%s%s", var_448_4:to_hex(), var_448_3, var_448_6:to_hex(), var_448_5)
	local var_448_8 = slot_0_15_0.measure_text(var_448_0, var_448_1, var_448_7)
	local var_448_9 = var_448_8.x
	local var_448_10 = var_448_8.y
	local var_448_11 = arg_448_0:clone()
	local var_448_12 = var_448_9 * 0.5

	var_448_11.x = slot_0_6_0(var_448_11.x - var_448_12 * arg_448_1 * (1 - slot_0_44_18) + 1)

	local var_448_13 = color(255, 255, 255, 255)

	var_448_13.a = var_448_13.a * arg_448_2 * arg_448_1

	local var_448_14 = var_448_13:clone()

	var_448_14.a = var_448_14.a * 0.5

	slot_0_15_0.push_clip_rect(var_448_11, var_448_11 + vector(var_448_9 * arg_448_1, var_448_10))
	slot_0_15_0.text(var_448_0, var_448_11, var_448_14, var_448_1, var_448_7)
	slot_0_15_0.pop_clip_rect()
	slot_0_15_0.push_clip_rect(var_448_11, var_448_11 + vector(var_448_9 * arg_448_1 * var_448_2, var_448_10))
	slot_0_15_0.text(var_448_0, var_448_11, var_448_13, var_448_1, var_448_7)
	slot_0_15_0.pop_clip_rect()

	arg_448_0.y = slot_0_6_0(arg_448_0.y + (var_448_10 - 3) * arg_448_1)
end

function slot_0_58_17(arg_449_0, arg_449_1, arg_449_2)
	local var_449_0 = 2
	local var_449_1 = ""
	local var_449_2 = "DMG"
	local var_449_3 = slot_0_15_0.measure_text(var_449_0, var_449_1, var_449_2)
	local var_449_4 = var_449_3.x
	local var_449_5 = var_449_3.y
	local var_449_6 = arg_449_0:clone()
	local var_449_7 = var_449_4 * 0.5

	var_449_6.x = slot_0_6_0(var_449_6.x - var_449_7 * arg_449_1 * (1 - slot_0_44_18) + 1)

	local var_449_8 = color(255, 255, 255, 255)

	var_449_8.a = var_449_8.a * arg_449_2 * arg_449_1

	slot_0_15_0.push_clip_rect(var_449_6, var_449_6 + vector(var_449_4 * arg_449_1, var_449_5))
	slot_0_15_0.text(var_449_0, var_449_6, var_449_8, var_449_1, var_449_2)
	slot_0_15_0.pop_clip_rect()

	arg_449_0.y = slot_0_6_0(arg_449_0.y + (var_449_5 - 3) * arg_449_1)
end

function slot_0_59_14()
	local var_450_0 = slot_0_15_0.screen_size() * 0.5
	local var_450_1 = slot_0_39_4.accent_color:get()
	local var_450_2 = slot_0_39_4.secondary_color:get()
	local var_450_3 = math.max(slot_0_46_16, slot_0_48_19)

	var_450_0.x = slot_0_6_0(var_450_0.x + slot_0_6_0(10 * slot_0_44_18))
	var_450_0.y = var_450_0.y + slot_0_39_4.offset:get()

	slot_0_55_21(var_450_0, var_450_1, var_450_2, slot_0_43_17)
	slot_0_56_20(var_450_0, color(255, 255, 255, 255), slot_0_43_17)
	slot_0_57_17(var_450_0, var_450_3, slot_0_43_17)
	slot_0_58_17(var_450_0, slot_0_47_17, slot_0_43_17)
end

function slot_0_41_8.on_render()
	local var_451_0 = entity.get_local_player()

	if var_451_0 == nil then
		return
	end

	slot_0_54_18(var_451_0)

	if slot_0_43_17 > 0 then
		slot_0_59_14()
	end
end

slot_0_42_12 = {}
slot_0_43_16 = 0
slot_0_44_17 = 0
slot_0_45_16 = 0
slot_0_46_15 = 0
slot_0_47_16 = false
slot_0_48_18 = false

function slot_0_49_20(arg_452_0)
	local var_452_0 = arg_452_0:get_override()

	if var_452_0 ~= nil then
		return var_452_0
	end

	return arg_452_0:get()
end

slot_0_50_20 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots")
slot_0_51_20 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
slot_0_52_17 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")

function slot_0_53_15(arg_453_0)
	if arg_453_0 == nil then
		return false
	end

	if slot_0_23_0.antiaim.settings.manual_yaw.select:get() == "Off" then
		return true
	end

	return false
end

function slot_0_54_17(arg_454_0)
	local var_454_0 = arg_454_0:is_alive()
	local var_454_1 = slot_0_49_20(slot_0_51_20)
	local var_454_2 = slot_0_49_20(slot_0_50_20)
	local var_454_3 = 0

	if var_454_0 then
		var_454_3 = 1
	end

	slot_0_47_16 = slot_0_53_15(arg_454_0)
	slot_0_48_18 = slot_0_49_20(slot_0_52_17)
	slot_0_43_16 = slot_0_14_0.interp(slot_0_43_16, var_454_3, 0.05)
	slot_0_44_17 = slot_0_14_0.interp(slot_0_44_17, rage.exploit:get() == 1, 0.03)
	slot_0_45_16 = slot_0_14_0.interp(slot_0_45_16, var_454_2, 0.03)
	slot_0_46_15 = slot_0_14_0.interp(slot_0_46_15, var_454_1, 0.03)

	if not rage.exploit:get() then
		slot_0_44_17 = 0
	end
end

function slot_0_55_20(arg_455_0, arg_455_1)
	local var_455_0 = 1
	local var_455_1 = slot_0_47_16 and "てんしのような YAW" or "リセット YAW"
	local var_455_2 = ""
	local var_455_3 = slot_0_15_0.measure_text(var_455_0, var_455_2, var_455_1)
	local var_455_4 = slot_0_6_0(var_455_3.x)
	local var_455_5 = slot_0_6_0(var_455_3.y)
	local var_455_6 = {
		218,
		118,
		0
	}
	local var_455_7 = {
		177,
		151,
		255
	}
	local var_455_8 = slot_0_47_16 and var_455_6 or var_455_7
	local var_455_9 = arg_455_0:clone()

	slot_0_6_0(var_455_9.x)
	slot_0_15_0.text(var_455_0, vector(var_455_9.x, var_455_9.y), color(var_455_8[1], var_455_8[2], var_455_8[3], 255 * arg_455_1), var_455_2, var_455_1)

	arg_455_0.y = arg_455_0.y + var_455_5
end

function slot_0_56_19(arg_456_0, arg_456_1)
	local var_456_0 = 1
	local var_456_1 = slot_0_47_16 and "どうてきな" or "デフォルト"
	local var_456_2 = ""
	local var_456_3 = slot_0_15_0.measure_text(var_456_0, var_456_2, var_456_1)
	local var_456_4 = slot_0_6_0(var_456_3.x)
	local var_456_5 = slot_0_6_0(var_456_3.y)
	local var_456_6 = {
		209,
		139,
		230
	}
	local var_456_7 = {
		255,
		0,
		0
	}
	local var_456_8 = slot_0_47_16 and var_456_6 or var_456_7
	local var_456_9 = arg_456_0:clone()

	var_456_9.x = slot_0_6_0(var_456_9.x)

	slot_0_15_0.text(var_456_0, vector(var_456_9.x, var_456_9.y), color(var_456_8[1], var_456_8[2], var_456_8[3], 255 * arg_456_1), var_456_2, var_456_1)

	arg_456_0.y = arg_456_0.y + var_456_5
end

function slot_0_57_16(arg_457_0, arg_457_1)
	local var_457_0 = 1
	local var_457_1 = not slot_0_48_18 and "倍の" or "倍の (フェイクダック)"
	local var_457_2 = ""
	local var_457_3 = slot_0_15_0.measure_text(var_457_0, var_457_2, var_457_1)
	local var_457_4 = slot_0_6_0(var_457_3.x)
	local var_457_5 = slot_0_6_0(var_457_3.y)
	local var_457_6 = slot_0_44_17 == 1 and {
		0,
		255,
		0
	} or {
		255,
		0,
		0
	}
	local var_457_7 = arg_457_0:clone()

	var_457_7.x = slot_0_6_0(var_457_7.x)

	slot_0_15_0.text(var_457_0, vector(var_457_7.x, var_457_7.y), color(var_457_6[1], var_457_6[2], var_457_6[3], 255 * arg_457_1 * slot_0_46_15), var_457_2, var_457_1)

	arg_457_0.y = arg_457_0.y + var_457_5
end

function slot_0_58_16(arg_458_0, arg_458_1)
	local var_458_0 = 1
	local var_458_1 = not slot_0_48_18 and "アンチエイム" or "アンチエイム (フェイクダック)"
	local var_458_2 = ""
	local var_458_3 = slot_0_15_0.measure_text(var_458_0, var_458_2, var_458_1)
	local var_458_4 = slot_0_6_0(var_458_3.x)
	local var_458_5 = slot_0_6_0(var_458_3.y)
	local var_458_6 = slot_0_48_18 and {
		255,
		0,
		0
	} or {
		209,
		139,
		230
	}
	local var_458_7 = arg_458_0:clone()

	var_458_7.x = slot_0_6_0(var_458_7.x)

	slot_0_15_0.text(var_458_0, vector(var_458_7.x, var_458_7.y), color(var_458_6[1], var_458_6[2], var_458_6[3], 255 * arg_458_1 * slot_0_45_16), var_458_2, var_458_1)

	arg_458_0.y = arg_458_0.y + var_458_5
end

function slot_0_59_13()
	local var_459_0 = slot_0_15_0.screen_size() * 0.5
	local var_459_1 = math.max(slot_0_46_15, slot_0_45_16)
	local var_459_2 = slot_0_49_20(slot_0_51_20)
	local var_459_3 = slot_0_49_20(slot_0_50_20)

	var_459_0.y = var_459_0.y + 45

	slot_0_55_20(var_459_0, slot_0_43_16)
	slot_0_56_19(var_459_0, slot_0_43_16)

	if var_459_2 then
		slot_0_57_16(var_459_0, slot_0_43_16)
	end

	if var_459_3 and not var_459_2 then
		slot_0_58_16(var_459_0, slot_0_43_16)
	end
end

function slot_0_42_12.on_render()
	local var_460_0 = entity.get_local_player()

	if var_460_0 == nil then
		return
	end

	slot_0_54_17(var_460_0)

	if slot_0_43_16 > 0 then
		slot_0_59_13()
	end
end

function slot_0_43_15(arg_461_0)
	local var_461_0 = arg_461_0 == 1
	local var_461_1 = arg_461_0 == 2
	local var_461_2 = arg_461_0 == 3

	events.render(slot_0_40_6.on_render, var_461_0)
	events.render(slot_0_41_8.on_render, var_461_1)
	events.render(slot_0_42_12.on_render, var_461_2)
end

slot_0_44_16 = nil

function slot_0_45_15(arg_462_0)
	slot_0_43_15(arg_462_0:get())
end

function slot_0_46_14(arg_463_0)
	local var_463_0 = arg_463_0:get()

	if not var_463_0 then
		slot_0_43_15(nil)
	end

	if var_463_0 then
		slot_0_39_4.style:set_callback(slot_0_45_15, true)
	else
		slot_0_39_4.style:unset_callback(slot_0_45_15)
	end
end

slot_0_39_4.enabled:set_callback(slot_0_46_14, true)

slot_0_39_3 = nil
slot_0_40_5 = slot_0_23_0.visuals.solus_ui
slot_0_41_7 = 5
slot_0_42_11 = 1

function slot_0_43_14(arg_464_0, arg_464_1)
	local var_464_0 = {}

	for iter_464_0 = 1, arg_464_1 do
		var_464_0[iter_464_0] = arg_464_0
	end

	return var_464_0
end

function slot_0_44_15(arg_465_0, arg_465_1, arg_465_2)
	if arg_465_2 or arg_465_0[#arg_465_0] ~= arg_465_1 then
		table.insert(arg_465_0, arg_465_1)
		table.remove(arg_465_0, 1)
	end
end

function slot_0_45_14(arg_466_0)
	local var_466_0 = 0
	local var_466_1 = 0

	for iter_466_0, iter_466_1 in pairs(arg_466_0) do
		var_466_1 = var_466_1 + iter_466_1
		var_466_0 = var_466_0 + 1
	end

	return var_466_1 / var_466_0
end

function slot_0_46_13()
	return {
		draw = function(arg_468_0, arg_468_1, arg_468_2, arg_468_3, arg_468_4, arg_468_5, arg_468_6)
			local var_468_0 = arg_468_2
			local var_468_1 = arg_468_5.clr_1

			arg_468_2 = 0
			arg_468_3 = arg_468_3 - var_468_0
			arg_468_5.h = arg_468_5.h - arg_468_5.thickness

			if arg_468_6 then
				slot_0_15_0.rect_outline(vector(arg_468_5.x, arg_468_5.y), vector(arg_468_5.x + arg_468_5.w - 1, arg_468_5.y + arg_468_5.h - 1 + arg_468_5.thickness), var_468_1)
			end

			if arg_468_2 == arg_468_3 then
				slot_0_15_0.line(vector(arg_468_5.x, arg_468_5.y + arg_468_5.h), vector(arg_468_5.x + arg_468_5.w, arg_468_5.y + arg_468_5.h), var_468_1)

				return
			end

			local var_468_2 = arg_468_5.w / (arg_468_4 - 1)
			local var_468_3 = arg_468_3 - arg_468_2

			for iter_468_0 = 1, arg_468_4 - 1 do
				local var_468_4 = vector((arg_468_1[iter_468_0] - var_468_0) / var_468_3, (arg_468_1[iter_468_0 + 1] - var_468_0) / var_468_3)
				local var_468_5 = {
					vector(arg_468_5.x + var_468_2 * (iter_468_0 - 1), arg_468_5.y + arg_468_5.h - arg_468_5.h * var_468_4.x),
					vector(arg_468_5.x + var_468_2 * iter_468_0, arg_468_5.y + arg_468_5.h - arg_468_5.h * var_468_4.y)
				}

				for iter_468_1 = 1, arg_468_5.thickness do
					slot_0_15_0.line(vector(var_468_5[1].x, var_468_5[1].y + iter_468_1 - 1), vector(var_468_5[2].x, var_468_5[2].y + iter_468_1 - 1), var_468_1)
				end
			end
		end,
		draw_histogram = function(arg_469_0, arg_469_1, arg_469_2, arg_469_3, arg_469_4, arg_469_5, arg_469_6)
			local var_469_0 = arg_469_2

			arg_469_2 = 0
			arg_469_3 = arg_469_3 - var_469_0

			if arg_469_6 then
				slot_0_15_0.rect_outline(vector(arg_469_5.x, arg_469_5.y), vector(arg_469_5.x + arg_469_5.w - 1, arg_469_5.y + arg_469_5.h - 1), color(255, 255, 255, 255))
			end

			local var_469_1 = arg_469_5.w / (arg_469_4 - 1)
			local var_469_2 = arg_469_3 - arg_469_2

			for iter_469_0 = 1, arg_469_4 - 1 do
				local var_469_3 = vector((arg_469_1[iter_469_0] - var_469_0) / var_469_2, (arg_469_1[iter_469_0 + 1] - var_469_0) / var_469_2)
				local var_469_4 = {
					vector(math.floor(arg_469_5.x + var_469_1 * (iter_469_0 - 1)), math.floor(arg_469_5.y + arg_469_5.h - arg_469_5.h * var_469_3.x)),
					vector(math.floor(arg_469_5.x + var_469_1 * iter_469_0), math.floor(arg_469_5.y + arg_469_5.h)),
					isZero = math.floor(arg_469_5.y + arg_469_5.h) == math.floor(arg_469_5.y + arg_469_5.h - arg_469_5.h * var_469_3.x)
				}

				if arg_469_5.draw_bar == "fill" then
					slot_0_15_0.rect(var_469_4[1], var_469_4[2], arg_469_5.clr_1)
				elseif arg_469_5.draw_bar == "gradient_fadeout" then
					local var_469_5 = arg_469_5.clr_1:clone()
					local var_469_6 = arg_469_5.clr_1:clone()

					var_469_6.a = 0

					slot_0_15_0.gradient(var_469_4[1], var_469_4[2], var_469_5, var_469_5, var_469_6, var_469_6)
				elseif arg_469_5.draw_bar == "gradient_fadein" then
					local var_469_7 = arg_469_5.clr_1:clone()
					local var_469_8 = arg_469_5.clr_1:clone()

					var_469_8.a = 0

					slot_0_15_0.gradient(var_469_4[1], var_469_4[2], var_469_8, var_469_8, var_469_7, var_469_7)
				end

				if arg_469_5.draw_peeks and not var_469_4.isZero then
					slot_0_15_0.line(var_469_4[1], var_469_4[2], arg_469_5.clr_2)
				end
			end
		end
	}
end

function slot_0_47_15(arg_470_0, arg_470_1, arg_470_2, arg_470_3, arg_470_4, ...)
	slot_0_15_0.rect(vector(arg_470_0, arg_470_1), vector(arg_470_0 + arg_470_2, arg_470_1 + arg_470_3), arg_470_4, ...)
end

function slot_0_48_17(arg_471_0, arg_471_1, arg_471_2, arg_471_3, arg_471_4, arg_471_5, arg_471_6, ...)
	local var_471_0
	local var_471_1
	local var_471_2
	local var_471_3

	if arg_471_6 then
		var_471_0, var_471_2 = arg_471_4, arg_471_4
		var_471_1, var_471_3 = arg_471_5, arg_471_5
	else
		var_471_0, var_471_1 = arg_471_4, arg_471_4
		var_471_2, var_471_3 = arg_471_5, arg_471_5
	end

	slot_0_15_0.gradient(vector(arg_471_0, arg_471_1), vector(arg_471_0 + arg_471_2, arg_471_1 + arg_471_3), var_471_0, var_471_1, var_471_2, var_471_3, ...)
end

function slot_0_49_19(arg_472_0, arg_472_1, arg_472_2, arg_472_3)
	local var_472_0 = arg_472_0.x
	local var_472_1 = arg_472_0.y
	local var_472_2 = arg_472_1.x - arg_472_0.x
	local var_472_3 = arg_472_1.y - arg_472_0.y
	local var_472_4 = arg_472_2:alpha_modulate(255 * arg_472_3)
	local var_472_5 = arg_472_2:alpha_modulate(50 * arg_472_3)

	slot_0_15_0.blur(arg_472_0, arg_472_1, 0.5, arg_472_3, slot_0_41_7)
	slot_0_15_0.rect(arg_472_0, arg_472_1, color(17, 17, 17, arg_472_2.a * arg_472_3), slot_0_41_7)
	slot_0_47_15(var_472_0 + slot_0_41_7, var_472_1, var_472_2 - slot_0_41_7 * 2, slot_0_42_11, var_472_4)
	slot_0_47_15(var_472_0 + slot_0_41_7, var_472_1 + var_472_3 - slot_0_42_11, var_472_2 - slot_0_41_7 * 2, slot_0_42_11, var_472_5)
	slot_0_15_0.circle_outline(vector(var_472_0 + slot_0_41_7, var_472_1 + slot_0_41_7), var_472_4, slot_0_41_7 + 0.5, 180, 0.25, slot_0_42_11)
	slot_0_15_0.circle_outline(vector(var_472_0 + var_472_2 - slot_0_41_7, var_472_1 + slot_0_41_7), var_472_4, slot_0_41_7 + 0.5, 270, 0.25, slot_0_42_11)
	slot_0_15_0.circle_outline(vector(var_472_0 + slot_0_41_7, var_472_1 + var_472_3 - slot_0_41_7), var_472_5, slot_0_41_7 + 0.5, 90, 0.25, slot_0_42_11)
	slot_0_15_0.circle_outline(vector(var_472_0 + var_472_2 - slot_0_41_7, var_472_1 + var_472_3 - slot_0_41_7), var_472_5, slot_0_41_7 + 0.5, 0, 0.25, slot_0_42_11)
	slot_0_48_17(var_472_0, var_472_1 + slot_0_41_7, slot_0_42_11, var_472_3 - slot_0_41_7 * 2, var_472_4, var_472_5, false)
	slot_0_48_17(var_472_0 + var_472_2 - slot_0_42_11, var_472_1 + slot_0_41_7, slot_0_42_11, var_472_3 - slot_0_41_7 * 2, var_472_4, var_472_5, false)
end

slot_0_50_19 = {}
slot_0_51_19 = 0

function slot_0_52_16()
	return slot_0_40_5.enabled:get() and slot_0_40_5.select:get("Watermark")
end

function slot_0_50_19.draw(arg_474_0)
	local var_474_0 = arg_474_0:clone()

	slot_0_51_19 = slot_0_14_0.interp(slot_0_51_19, slot_0_52_16(), 0.05)

	if slot_0_51_19 <= 0 then
		return
	end

	local var_474_1 = {}
	local var_474_2 = utils.net_channel()
	local var_474_3 = common.get_system_time()

	table.insert(var_474_1, "angelwings")
	table.insert(var_474_1, common.get_username())

	if var_474_2 ~= nil then
		table.insert(var_474_1, string.format("delay: %dms", var_474_2.latency[1] * 1000))
	end

	if var_474_3 ~= nil then
		table.insert(var_474_1, string.format("%02d:%02d:%02d", var_474_3.hours, var_474_3.minutes, var_474_3.seconds))
	end

	local var_474_4 = 1
	local var_474_5 = ""
	local var_474_6 = table.concat(var_474_1, " | ")
	local var_474_7 = slot_0_15_0.measure_text(var_474_4, var_474_5, var_474_6)
	local var_474_8 = color(255, 255, 255, 255)
	local var_474_9 = var_474_7 + vector(10, 8)

	var_474_0.x = var_474_0.x - var_474_9.x
	var_474_8.a = var_474_8.a * slot_0_51_19

	slot_0_49_19(var_474_0, var_474_0 + var_474_9, slot_0_40_5.color:get(), slot_0_51_19)
	slot_0_15_0.text(var_474_4, var_474_0 + vector(5, 4), var_474_8, var_474_5, var_474_6)

	arg_474_0.y = arg_474_0.y + (var_474_9.y + 10) * slot_0_51_19
end

slot_0_51_18 = {}
slot_0_52_15 = {}
slot_0_53_14 = 0
slot_0_54_16 = nil
slot_0_55_19 = nil
slot_0_56_18 = vector(400, 340)
slot_0_57_15 = vector(120, 20)
slot_0_58_15 = slot_0_15_0.screen_size()
slot_0_55_18 = slot_0_17_0.new("spectators", slot_0_56_18, slot_0_57_15, {
	border = {
		vector(0, 0),
		slot_0_58_15:clone()
	}
})

function slot_0_55_18.update()
	return slot_0_53_14
end

function slot_0_56_17()
	return slot_0_40_5.enabled:get() and slot_0_40_5.select:get("Spectators")
end

function slot_0_57_14(arg_477_0)
	local var_477_0 = arg_477_0.m_iObserverMode

	if var_477_0 == 4 or var_477_0 == 5 then
		local var_477_1 = arg_477_0.m_hObserverTarget

		if var_477_1 ~= nil then
			return var_477_1:get_spectators()
		end
	end

	return arg_477_0:get_spectators()
end

function slot_0_58_14(arg_478_0, arg_478_1)
	local var_478_0 = entity.get_local_player()
	local var_478_1 = {}
	local var_478_2 = false
	local var_478_3 = 0

	if var_478_0 ~= nil then
		local var_478_4 = slot_0_57_14(var_478_0) or {}

		for iter_478_0, iter_478_1 in pairs(var_478_4) do
			local var_478_5 = iter_478_1:get_index()
			local var_478_6 = iter_478_1:get_name()
			local var_478_7 = iter_478_1:get_steam_avatar()

			var_478_2 = true
			var_478_1[var_478_5] = iter_478_1
			slot_0_52_15[var_478_5] = slot_0_52_15[var_478_5] or {
				alpha = 0,
				name_width = 0,
				name_height = 0,
				name = var_478_6,
				avatar = var_478_7
			}

			local var_478_8 = slot_0_52_15[var_478_5]
			local var_478_9 = slot_0_15_0.measure_text(arg_478_0, arg_478_1, var_478_6)

			var_478_8.name = var_478_6
			var_478_8.name_width = var_478_9.x
			var_478_8.name_height = var_478_9.y
		end
	end

	for iter_478_2, iter_478_3 in pairs(slot_0_52_15) do
		local var_478_10 = var_478_1[iter_478_2] ~= nil

		iter_478_3.alpha = slot_0_14_0.interp(iter_478_3.alpha, var_478_10, 0.05)

		if iter_478_3.alpha <= 0.01 then
			slot_0_52_15[iter_478_2] = nil
		elseif (iter_478_3.alpha > 0 or var_478_10) and var_478_3 < iter_478_3.name_width then
			var_478_3 = iter_478_3.name_width
		end
	end

	return slot_0_52_15, var_478_2, var_478_3
end

function slot_0_51_18.draw()
	local var_479_0 = 1
	local var_479_1 = "c"
	local var_479_2 = "spectators"
	local var_479_3, var_479_4, var_479_5 = slot_0_58_14(var_479_0, var_479_1)
	local var_479_6 = slot_0_56_17() and (var_479_4 or ui.get_alpha() > 0)

	slot_0_53_14 = slot_0_14_0.interp(slot_0_53_14, var_479_6, 0.05)

	if slot_0_53_14 <= 0 then
		return
	end

	local var_479_7 = slot_0_55_18:get_drag_position():clone()
	local var_479_8 = math.max(66, var_479_5)
	local var_479_9 = vector(75 + var_479_8, 20)

	if slot_0_54_16 == nil then
		slot_0_54_16 = var_479_9.x
	end

	slot_0_54_16 = slot_0_14_0.interp(slot_0_54_16, var_479_9.x, 0.033)
	var_479_9.x = math.floor(slot_0_54_16)

	slot_0_49_19(var_479_7, var_479_7 + var_479_9, slot_0_40_5.color:get(), slot_0_53_14)
	slot_0_15_0.text(var_479_0, var_479_7 + var_479_9 / 2 - vector(0, 1), color(255, 255 * slot_0_53_14), var_479_1, var_479_2)

	local var_479_10 = 0

	var_479_7.y = var_479_7.y + 3

	for iter_479_0, iter_479_1 in pairs(var_479_3) do
		local var_479_11 = iter_479_1.name
		local var_479_12 = iter_479_1.avatar
		local var_479_13 = color(255, 255, 255, 255)
		local var_479_14 = slot_0_53_14 * iter_479_1.alpha

		var_479_13.a = var_479_13.a * var_479_14

		local var_479_15 = vector(iter_479_1.name_height, iter_479_1.name_height)
		local var_479_16 = vector(var_479_7.x + 5, var_479_7.y + var_479_9.y)
		local var_479_17 = vector(var_479_7.x + var_479_9.x - 5 - var_479_15.x, var_479_7.y + var_479_9.y)

		slot_0_15_0.text(var_479_0, var_479_16, var_479_13, "", var_479_11)

		if var_479_12 ~= nil then
			slot_0_15_0.texture(var_479_12, var_479_17, var_479_15, var_479_13)
		end

		var_479_10 = math.max(var_479_10, var_479_14)
		var_479_9.y = var_479_9.y + slot_0_6_0(15 * var_479_14)
	end

	var_479_9.y = var_479_9.y + slot_0_6_0(3 * var_479_10)
	slot_0_55_18.size = var_479_9

	slot_0_55_18()
end

slot_0_52_14 = {}
slot_0_53_13 = {}
slot_0_54_15 = 0
slot_0_55_17 = nil
slot_0_56_16 = nil
slot_0_57_13 = vector(400, 200)
slot_0_58_13 = vector(120, 20)
slot_0_59_12 = slot_0_15_0.screen_size()
slot_0_56_15 = slot_0_17_0.new("hotkey_list", slot_0_57_13, slot_0_58_13, {
	border = {
		vector(0, 0),
		slot_0_59_12:clone()
	}
})

function slot_0_56_15.update()
	return slot_0_54_15
end

function slot_0_57_12()
	return slot_0_40_5.enabled:get() and slot_0_40_5.select:get("Hotkey List")
end

function slot_0_58_12(arg_482_0, arg_482_1)
	if next(arg_482_1) == nil then
		arg_482_1 = arg_482_0:get()

		if next(arg_482_1) == nil then
			arg_482_1 = arg_482_0:list()
		end
	end

	local var_482_0 = {}

	for iter_482_0 = 1, #arg_482_1 do
		var_482_0[#var_482_0 + 1] = arg_482_1[iter_482_0]:sub(1, 1)
	end

	return table.concat(var_482_0, ", ")
end

function slot_0_59_11(arg_483_0, arg_483_1, arg_483_2)
	if type(arg_483_2) == "boolean" or slot_0_40_5.only_key_state:get() then
		if arg_483_1 == 1 then
			return "Holding"
		end

		if arg_483_1 == 2 then
			return "Toggled"
		end

		return "Enabled"
	end

	if type(arg_483_2) == "table" then
		return slot_0_58_12(arg_483_0, arg_483_2)
	end

	return tostring(arg_483_2)
end

function slot_0_60_6(arg_484_0, arg_484_1)
	local var_484_0 = {}
	local var_484_1 = false
	local var_484_2 = 0
	local var_484_3 = 0

	for iter_484_0, iter_484_1 in pairs(ui.get_binds()) do
		local var_484_4 = iter_484_1.reference:id()
		local var_484_5 = string.format("[%s]", string.lower(slot_0_59_11(iter_484_1.reference, iter_484_1.mode, iter_484_1.value)))
		local var_484_6 = iter_484_1.name

		if iter_484_1.active then
			var_484_1 = true
			var_484_0[var_484_4] = iter_484_1
		end

		slot_0_53_13[var_484_4] = slot_0_53_13[var_484_4] or {
			value_width = 0,
			name_width = 0,
			height = 0,
			alpha = 0,
			name = var_484_6,
			mode = iter_484_1.mode,
			value = iter_484_1.value,
			reference = iter_484_1.reference
		}

		local var_484_7 = slot_0_53_13[var_484_4]
		local var_484_8 = slot_0_15_0.measure_text(arg_484_0, arg_484_1, var_484_6)
		local var_484_9 = slot_0_15_0.measure_text(arg_484_0, arg_484_1, var_484_5)

		var_484_7.name = var_484_6
		var_484_7.value = var_484_5
		var_484_7.mode = iter_484_1.mode
		var_484_7.reference = iter_484_1.reference
		var_484_7.height = math.max(var_484_8.y, var_484_9.y)
		var_484_7.name_width = var_484_8.x
		var_484_7.value_width = var_484_9.x
	end

	for iter_484_2, iter_484_3 in pairs(slot_0_53_13) do
		local var_484_10 = var_484_0[iter_484_2] ~= nil

		iter_484_3.alpha = slot_0_14_0.interp(iter_484_3.alpha, var_484_10, 0.05)

		if iter_484_3.alpha <= 0.01 then
			slot_0_53_13[iter_484_2] = nil
		elseif iter_484_3.alpha > 0 or var_484_10 then
			if var_484_2 < iter_484_3.name_width then
				var_484_2 = iter_484_3.name_width
			end

			if var_484_3 < iter_484_3.value_width then
				var_484_3 = iter_484_3.value_width
			end
		end
	end

	return slot_0_53_13, var_484_1, var_484_2, var_484_3
end

function slot_0_52_14.draw()
	local var_485_0 = 1
	local var_485_1 = "c"
	local var_485_2 = "keybinds"
	local var_485_3, var_485_4, var_485_5 = slot_0_60_6(var_485_0, var_485_1)
	local var_485_6 = slot_0_57_12() and (var_485_4 or ui.get_alpha() > 0)

	slot_0_54_15 = slot_0_14_0.interp(slot_0_54_15, var_485_6, 0.033)

	if slot_0_54_15 <= 0 then
		return
	end

	local var_485_7 = slot_0_56_15:get_drag_position():clone()
	local var_485_8 = math.max(66, var_485_5)
	local var_485_9 = vector(75 + var_485_8, 20)

	if slot_0_55_17 == nil then
		slot_0_55_17 = var_485_9.x
	end

	slot_0_55_17 = slot_0_14_0.interp(slot_0_55_17, var_485_9.x, 0.035)
	var_485_9.x = math.floor(slot_0_55_17)

	slot_0_49_19(var_485_7, var_485_7 + var_485_9, slot_0_40_5.color:get(), slot_0_54_15)
	slot_0_15_0.text(var_485_0, var_485_7 + var_485_9 / 2 - vector(0, 1), color(255, 255 * slot_0_54_15), var_485_1, var_485_2)

	local var_485_10 = 0

	var_485_7.y = var_485_7.y + 3

	for iter_485_0, iter_485_1 in pairs(var_485_3) do
		local var_485_11 = iter_485_1
		local var_485_12 = var_485_11.name
		local var_485_13 = var_485_11.value
		local var_485_14 = color(255, 255, 255, 255)
		local var_485_15 = var_485_11.alpha * slot_0_54_15

		var_485_14.a = var_485_14.a * var_485_15

		local var_485_16 = vector(var_485_7.x + 5, var_485_7.y + var_485_9.y)
		local var_485_17 = vector(var_485_7.x + var_485_9.x - 5, var_485_7.y + var_485_9.y)

		slot_0_15_0.text(var_485_0, var_485_16, var_485_14, "", var_485_12)
		slot_0_15_0.text(var_485_0, var_485_17, var_485_14, "r", var_485_13)

		var_485_10 = math.max(var_485_10, var_485_11.alpha)
		var_485_9.y = var_485_9.y + slot_0_6_0(15 * var_485_11.alpha)
	end

	var_485_9.y = var_485_9.y + slot_0_6_0(3 * var_485_10)
	slot_0_56_15.size = var_485_9

	slot_0_56_15()
end

slot_0_53_12 = {}
slot_0_54_14 = 0
slot_0_55_16 = 0
slot_0_56_14 = 0
slot_0_57_11 = slot_0_43_14(0, 2)
slot_0_58_11 = slot_0_43_14(0, 3)
slot_0_59_10 = 0
slot_0_60_5 = 0
slot_0_61_5 = 0
slot_0_62_3 = 0
slot_0_63_3 = 0
slot_0_64_2 = 0
slot_0_65_2 = vector()
slot_0_66_2 = false
slot_0_67_2 = false

function slot_0_68_2()
	return slot_0_40_5.enabled:get() and slot_0_40_5.select:get("Anti-aimbot indication")
end

function slot_0_69_1()
	local var_487_0 = rage.antiaim:get_max_desync()
	local var_487_1 = rage.antiaim:get_rotation(false)
	local var_487_2 = rage.antiaim:get_rotation(true)
	local var_487_3 = math.normalize_yaw(var_487_2 - var_487_1)

	return math.clamp(var_487_3, -var_487_0, var_487_0)
end

function slot_0_70_1()
	local var_488_0 = slot_0_62_3

	if tonumber(var_488_0) < 10 then
		var_488_0 = "  " .. var_488_0
	end

	return string.format("FL: %s", var_488_0)
end

function slot_0_71_1()
	if slot_0_66_2 then
		slot_0_56_14 = slot_0_14_0.interp(slot_0_56_14, false, 0.05)

		local var_489_0 = slot_0_56_14 <= 0.01

		slot_0_55_16 = slot_0_14_0.interp(slot_0_55_16, var_489_0, 0.05)

		return
	end

	if slot_0_67_2 then
		slot_0_55_16 = slot_0_14_0.interp(slot_0_55_16, false, 0.05)

		local var_489_1 = slot_0_55_16 <= 0.01

		slot_0_56_14 = slot_0_14_0.interp(slot_0_56_14, var_489_1, 0.05)

		return
	end

	slot_0_55_16 = slot_0_14_0.interp(slot_0_55_16, false, 0.05)
	slot_0_56_14 = slot_0_14_0.interp(slot_0_56_14, false, 0.05)
end

function slot_0_72_1(arg_490_0)
	local var_490_0 = entity.get_local_player()

	if var_490_0 == nil then
		return
	end

	if arg_490_0.choked_commands == 0 then
		local var_490_1 = var_490_0.m_vecOrigin

		if slot_0_65_2 ~= nil then
			slot_0_64_2 = (var_490_1 - slot_0_65_2):length2dsqr()

			slot_0_44_15(slot_0_58_11, slot_0_64_2, true)
		end

		slot_0_44_15(slot_0_57_11, math.abs(slot_0_69_1()), true)

		slot_0_62_3 = slot_0_63_3
		slot_0_65_2 = var_490_1
	end

	slot_0_66_2 = rage.exploit:get() == 1
	slot_0_67_2 = slot_0_45_14(slot_0_58_11) > 3200
	slot_0_63_3 = arg_490_0.choked_commands
end

function slot_0_53_12.draw(arg_491_0)
	slot_491_1_0 = arg_491_0:clone()
	slot_491_2_0 = entity.get_local_player()
	slot_491_3_0 = slot_0_68_2() and slot_491_2_0 ~= nil and slot_491_2_0:is_alive()
	slot_0_54_14 = slot_0_14_0.interp(slot_0_54_14, slot_491_3_0, 0.05)

	slot_0_71_1()

	if slot_0_54_14 <= 0 then
		return
	end

	slot_491_4_0 = 1
	slot_491_5_0 = ""
	slot_491_6_0 = slot_0_40_5.color:get()
	slot_491_7_0 = slot_0_70_1()
	slot_491_8_0 = globals.frametime * 3.75
	slot_491_9_0 = 1200 + math.max(0, slot_0_45_14(slot_0_58_11) - 3800)
	slot_491_10_0 = math.abs(math.min(slot_0_64_2 - 3800, slot_491_9_0) / slot_491_9_0 * 100)

	if slot_0_60_5 ~= slot_491_10_0 and slot_0_61_5 < globals.realtime then
		slot_0_61_5 = globals.realtime + 0.005
		slot_0_60_5 = slot_0_60_5 + (slot_491_10_0 < slot_0_60_5 and -1 or 1)
	end

	slot_0_59_10 = slot_0_59_10 + (slot_0_67_2 and slot_491_8_0 or -slot_491_8_0)
	slot_0_59_10 = slot_0_59_10 > 1 and 1 or slot_0_59_10
	slot_0_59_10 = slot_0_59_10 < 0 and 0 or slot_0_59_10
	slot_491_11_0 = " | SHIFTING"
	slot_491_12_0 = slot_0_15_0.measure_text(slot_491_4_0, slot_491_5_0, slot_491_11_0)
	slot_491_13_0 = " | dst: " .. string.rep(" ", 10)
	slot_491_14_0 = slot_0_15_0.measure_text(slot_491_4_0, slot_491_5_0, slot_491_13_0)
	slot_491_15_0 = slot_0_15_0.measure_text(slot_491_4_0, slot_491_5_0, slot_491_7_0)
	slot_491_16_0 = color(255, 255, 255, 255)
	slot_491_17_0 = vector(slot_491_15_0.x + 8, 17)
	slot_491_17_0.x = slot_491_17_0.x + slot_491_12_0.x * slot_0_55_16
	slot_491_17_0.x = slot_491_17_0.x + slot_491_14_0.x * slot_0_56_14
	slot_491_1_0.x = slot_491_1_0.x - slot_491_17_0.x
	slot_491_16_0.a = slot_491_16_0.a * slot_0_54_14
	slot_491_18_0 = vector(slot_491_1_0.x + 4, slot_491_1_0.y + 2)

	slot_0_49_19(slot_491_1_0, slot_491_1_0 + slot_491_17_0, slot_0_40_5.color:get(), slot_0_54_14)
	slot_0_15_0.text(slot_491_4_0, slot_491_18_0, slot_491_16_0, slot_491_5_0, slot_491_7_0)

	slot_491_18_0.x = slot_491_18_0.x + slot_491_15_0.x

	if slot_0_55_16 > 0 then
		slot_491_19_2 = slot_491_16_0:clone()
		slot_491_19_2.a = slot_491_19_2.a * math.map(slot_0_55_16, 0.9, 1, 0, 1)

		slot_0_15_0.text(slot_491_4_0, slot_491_18_0, slot_491_19_2, slot_491_5_0, slot_491_11_0)
	end

	if slot_0_56_14 > 0 then
		slot_491_19_1 = slot_491_16_0:clone()
		slot_491_20_1 = math.map(slot_0_56_14, 0.9, 1, 0, 1)
		slot_491_19_1.a = slot_491_19_1.a * slot_491_20_1
		slot_491_21_1 = slot_0_15_0.measure_text(slot_491_4_0, slot_491_5_0, " | dst: ")
		slot_491_22_0 = vector(slot_491_18_0.x + slot_491_21_1.x + 2, slot_491_18_0.y + 4)
		slot_491_23_0 = slot_491_22_0 + vector(math.min(100, slot_0_60_5) / 100 * 24, 5)
		slot_491_24_0 = slot_491_6_0:clone()
		slot_491_25_0 = slot_491_6_0:clone()
		slot_491_24_0.a = 220 * slot_0_59_10 * slot_491_20_1 * slot_0_54_14
		slot_491_25_0.a = 25 * slot_0_59_10 * slot_491_20_1 * slot_0_54_14

		slot_0_15_0.text(slot_491_4_0, slot_491_18_0, slot_491_19_1, slot_491_5_0, slot_491_13_0)
		slot_0_15_0.gradient(slot_491_22_0, slot_491_23_0, slot_491_24_0, slot_491_25_0, slot_491_24_0, slot_491_25_0)
	end

	slot_491_19_0 = string.format("FAKE (%.1f°)", slot_0_45_14(slot_0_57_11))
	slot_491_20_0 = slot_0_15_0.measure_text(slot_491_4_0, slot_491_5_0, slot_491_19_0)
	slot_491_21_0 = vector(slot_491_20_0.x + 8, 18)
	slot_491_1_0.x = slot_491_1_0.x - slot_491_21_0.x - 4

	slot_0_49_19(slot_491_1_0, slot_491_1_0 + slot_491_21_0, slot_0_40_5.color:get(), slot_0_54_14)
	slot_0_15_0.text(slot_491_4_0, slot_491_1_0 + vector(4, 2), slot_491_16_0, slot_491_5_0, slot_491_19_0)

	arg_491_0.y = arg_491_0.y + (slot_491_21_0.y + 10) * slot_0_54_14
end

events.createmove(slot_0_72_1)

slot_0_54_13 = {}
slot_0_55_15 = slot_0_46_13()

function slot_0_56_13(arg_492_0)
	if arg_492_0 < 1 then
		return ("%.2f"):format(arg_492_0)
	end

	if arg_492_0 < 10 then
		return ("%.1f"):format(arg_492_0)
	end

	return ("%d"):format(arg_492_0)
end

pcall(ffi.cdef, "                bool EnumDisplaySettingsA(\n                    unsigned int  lpszDeviceName,\n                    unsigned long iModeNum,\n                    void*         lpDevMode\n                );\n            ")

slot_0_58_10 = ffi.typeof("                struct {\n                    char pad_0[120];\n                    unsigned long dmDisplayFrequency;\n                    char pad_1[32];\n                }\n            ")()

ffi.C.EnumDisplaySettingsA(0, -1, slot_0_58_10)

slot_0_59_9 = 0
slot_0_60_4 = common.get_timestamp()
slot_0_61_4 = slot_0_43_14(0, 90)
slot_0_62_2 = slot_0_43_14(0, 30)
slot_0_63_2 = 0
slot_0_64_1 = 0

function slot_0_65_1()
	return slot_0_40_5.enabled:get() and slot_0_40_5.select:get("Frequency update information")
end

function slot_0_66_1()
	slot_0_63_2 = 0.9 * slot_0_63_2 + 0.09999999999999998 * globals.absoluteframetime

	slot_0_44_15(slot_0_62_2, math.abs(slot_0_64_1 - 1 / slot_0_63_2), true)

	slot_0_64_1 = 1 / slot_0_63_2
end

function slot_0_67_1()
	slot_0_60_4 = common.get_timestamp()
end

function slot_0_68_1()
	local var_496_0 = common.get_timestamp() - slot_0_60_4

	slot_0_44_15(slot_0_61_4, var_496_0)
end

function slot_0_54_13.draw(arg_497_0)
	slot_0_66_1()

	local var_497_0 = arg_497_0:clone()
	local var_497_1 = slot_0_65_1()

	slot_0_59_9 = slot_0_14_0.interp(slot_0_59_9, var_497_1, 0.05)

	if slot_0_59_9 <= 0 then
		return
	end

	local var_497_2 = 1
	local var_497_3 = ""
	local var_497_4 = slot_0_40_5.color:get()
	local var_497_5 = slot_0_45_14(slot_0_61_4)
	local var_497_6 = tonumber(slot_0_58_10.dmDisplayFrequency)
	local var_497_7 = string.format("%sms / %dhz", slot_0_56_13(var_497_5), var_497_6)
	local var_497_8 = slot_0_15_0.measure_text(var_497_2, var_497_3, var_497_7)
	local var_497_9 = color(255, 255, 255, 255)
	local var_497_10 = vector(var_497_8.x + 8, 18)

	var_497_0.x = var_497_0.x - var_497_10.x
	var_497_9.a = var_497_9.a * slot_0_59_9

	slot_0_49_19(var_497_0, var_497_0 + var_497_10, slot_0_40_5.color:get(), slot_0_59_9)
	slot_0_15_0.text(var_497_2, vector(var_497_0.x + 4, var_497_0.y + 2), var_497_9, var_497_3, var_497_7)

	local var_497_11 = "IO | "
	local var_497_12 = slot_0_15_0.measure_text(var_497_2, var_497_3, var_497_11)
	local var_497_13 = var_497_11 .. "       "
	local var_497_14 = slot_0_15_0.measure_text(var_497_2, var_497_3, var_497_13)
	local var_497_15 = var_497_12.x + 4
	local var_497_16 = vector(var_497_14.x + 8, 18)
	local var_497_17 = {
		var_497_5,
		1,
		3,
		slot_0_45_14(slot_0_62_2) / 4,
		0
	}
	local var_497_18 = math.min(unpack(var_497_17))
	local var_497_19 = math.max(unpack(var_497_17))

	var_497_0.x = var_497_0.x - var_497_16.x

	local var_497_20 = vector(var_497_0.x - 4, var_497_0.y)

	slot_0_49_19(var_497_20, var_497_20 + var_497_16, slot_0_40_5.color:get(), slot_0_59_9)
	slot_0_15_0.text(var_497_2, var_497_0 + vector(0, 2), var_497_9, var_497_3, var_497_13)
	slot_0_55_15:draw_histogram(var_497_17, 0, var_497_19, #var_497_17, {
		draw_bar = "gradient_fadein",
		draw_peeks = false,
		thickness = 1,
		x = var_497_0.x - 4 + var_497_15,
		y = var_497_0.y + 4,
		w = var_497_16.x - var_497_15 - 4,
		h = var_497_16.y - 8,
		clr_1 = var_497_4:alpha_modulate(255 * slot_0_59_9),
		clr_2 = color(0, 127, 255, 255 * slot_0_59_9)
	}, false)
end

events.pre_render(slot_0_67_1)
events.post_render(slot_0_68_1)

function slot_0_55_14()
	local var_498_0 = slot_0_15_0.screen_size()
	local var_498_1 = vector(var_498_0.x - 10, 10)

	slot_0_50_19.draw(var_498_1)
	slot_0_51_18.draw()
	slot_0_52_14.draw()
	slot_0_53_12.draw(var_498_1)
	slot_0_54_13.draw(var_498_1)
end

events.render(slot_0_55_14)

slot_0_40_4 = nil
slot_0_41_6 = slot_0_23_0.visuals.watermark
slot_0_42_10 = {}
slot_0_43_13 = string.format("%s\a%%s.PINK", string.upper(slot_0_7_0.name))
slot_0_44_14 = string.format("VICTIM - %s [\a%%s%s\a%%s]", string.upper(slot_0_7_0.user), string.upper(slot_0_7_0.build))

function slot_0_42_10.on_render()
	local var_499_0 = slot_0_41_6.color:get():alpha_modulate(255)
	local var_499_1 = color()
	local var_499_2 = var_499_0:to_hex()
	local var_499_3 = var_499_1:to_hex()
	local var_499_4 = slot_0_15_0.screen_size()
	local var_499_5 = 2
	local var_499_6 = ""
	local var_499_7 = {
		string.format(slot_0_43_13, var_499_2),
		string.format(slot_0_44_14, var_499_2, var_499_3)
	}
	local var_499_8 = vector(8, var_499_4.y / 2)

	if slot_0_21_0.eva_small ~= nil then
		local var_499_9 = vector(35, 35)
		local var_499_10 = color(255, 255, 255)

		slot_0_15_0.texture(slot_0_21_0.eva_small, var_499_8, var_499_9, var_499_10, "f")

		var_499_8.x = var_499_8.x + var_499_9.x - 4
		var_499_8.y = var_499_8.y + var_499_9.y + 1
	end

	local var_499_11 = slot_0_15_0.measure_text(var_499_5, var_499_6, var_499_7[1])
	local var_499_12 = slot_0_15_0.measure_text(var_499_5, var_499_6, var_499_7[2])

	var_499_11.y = var_499_11.y - 2
	var_499_12.y = var_499_12.y - 2
	var_499_8.y = var_499_8.y - var_499_12.y

	slot_0_15_0.text(var_499_5, var_499_8, var_499_1, var_499_6, var_499_7[2])

	var_499_8.y = var_499_8.y - (var_499_11.y - 2)

	slot_0_15_0.text(var_499_5, var_499_8, var_499_1, var_499_6, var_499_7[1])
end

slot_0_43_12 = {}
slot_0_44_13 = 1
slot_0_45_13 = 3
slot_0_46_12 = 3
slot_0_47_14 = 34
slot_0_48_16 = 5
slot_0_49_18 = utils.get_vfunc("steamclient.dll", "SteamClient017", 2, "int(__thiscall*)(void*, int)")
slot_0_50_18 = utils.get_vfunc("steamclient.dll", "SteamClient017", 8, "int*(__thiscall*)(void*, int, int, const char*)")
slot_0_51_17 = utils.get_vfunc("steamclient.dll", "SteamClient017", 9, "int*(__thiscall*)(void*, int, const char*)")
slot_0_52_13 = utils.get_vfunc(35, "int(__thiscall*)(void*, uint64_t)")
slot_0_53_11 = utils.get_vfunc(5, "bool(__thiscall*)(void*, int, uint32_t*, uint32_t*)")
slot_0_54_12 = utils.get_vfunc(6, "bool(__thiscall*)(void*, int, unsigned char*, int)")
slot_0_55_13 = slot_0_49_18(slot_0_44_13)
slot_0_56_12 = slot_0_50_18(slot_0_55_13, slot_0_44_13, "SteamFriends015")
slot_0_57_10 = slot_0_51_17(slot_0_44_13, "SteamUtils009")
slot_0_58_9 = string.format("\a%%s%s\a%%s.pink", string.lower(slot_0_7_0.name))
slot_0_59_8 = string.format("build: \a%%s%s", string.lower(slot_0_7_0.build))
slot_0_60_3 = string.format("user: \a%%s%s", slot_0_7_0.user)

function slot_0_61_3()
	local var_500_0 = panorama.MyPersonaAPI

	if var_500_0 == nil then
		return 0ULL
	end

	local var_500_1 = var_500_0.GetXuid()

	return 76500000000000000ULL + tonumber(var_500_1:sub(4, -1))
end

slot_0_63_1 = (function(arg_501_0)
	local var_501_0 = slot_0_52_13(slot_0_56_12, arg_501_0)

	if var_501_0 <= 0 then
		return nil
	end

	local var_501_1 = ffi.new("unsigned int[?]", 1)
	local var_501_2 = ffi.new("unsigned int[?]", 1)

	if not slot_0_53_11(slot_0_57_10, var_501_0, var_501_1, var_501_2) then
		return nil
	end

	local var_501_3 = var_501_1[0] * var_501_2[0] * 4
	local var_501_4 = ffi.new("unsigned char[?]", var_501_3)

	if not slot_0_54_12(slot_0_57_10, var_501_0, var_501_4, var_501_3) then
		return nil
	end

	local var_501_5 = ffi.string(var_501_4, var_501_3)
	local var_501_6 = vector(var_501_1[0], var_501_2[0])

	return slot_0_15_0.load_image_rgba(var_501_5, var_501_6), var_501_6
end)(slot_0_61_3())

function slot_0_43_12.on_render()
	if slot_0_63_1 == nil then
		return
	end

	local var_502_0 = slot_0_41_6.color:get():alpha_modulate(255)
	local var_502_1 = color()
	local var_502_2 = var_502_0:to_hex()
	local var_502_3 = var_502_1:to_hex()
	local var_502_4 = slot_0_15_0.screen_size()
	local var_502_5 = vector(var_502_4.x, 0)
	local var_502_6 = 4
	local var_502_7 = ""
	local var_502_8 = string.format(slot_0_58_9, var_502_2, var_502_3)
	local var_502_9 = 1
	local var_502_10 = ""
	local var_502_11 = string.format(slot_0_59_8, var_502_2)
	local var_502_12 = 1
	local var_502_13 = ""
	local var_502_14 = string.format(slot_0_60_3, var_502_2)
	local var_502_15 = slot_0_15_0.measure_text(var_502_6, var_502_7, var_502_8)
	local var_502_16 = slot_0_15_0.measure_text(var_502_9, var_502_10, var_502_11)
	local var_502_17 = slot_0_15_0.measure_text(var_502_12, var_502_13, var_502_14)
	local var_502_18 = vector(slot_0_45_13, slot_0_46_12) * 2 + vector(math.max(var_502_15.x, var_502_16.x, var_502_17.x) + slot_0_47_14 + slot_0_48_16, math.max(var_502_15.y + var_502_16.y + var_502_17.y, slot_0_47_14))
	local var_502_19 = var_502_18 + vector(10, 0)
	local var_502_20 = var_502_5 + vector(-(slot_0_45_13 + slot_0_47_14), (var_502_18.y - slot_0_47_14) / 2)
	local var_502_21 = var_502_5 + vector(-var_502_19.x, 0)

	slot_0_15_0.gradient(var_502_21, var_502_21 + var_502_19, var_502_0:alpha_modulate(0), var_502_0:alpha_modulate(220), var_502_0:alpha_modulate(0), var_502_0:alpha_modulate(220))
	slot_0_15_0.texture(slot_0_63_1, var_502_20, vector(slot_0_47_14, slot_0_47_14), color(), "f")

	local var_502_22 = var_502_5 + vector(-var_502_18.x + slot_0_45_13, slot_0_46_12)

	slot_0_15_0.text(var_502_6, var_502_22, var_502_1, var_502_7, var_502_8)

	var_502_22.y = var_502_22.y + var_502_15.y

	slot_0_15_0.text(var_502_9, var_502_22, var_502_1, var_502_10, var_502_11)

	var_502_22.y = var_502_22.y + var_502_16.y

	slot_0_15_0.text(var_502_12, var_502_22, var_502_1, var_502_13, var_502_14)

	var_502_22.y = var_502_22.y + var_502_17.y
end

function slot_0_44_12(arg_503_0)
	if arg_503_0 == nil then
		arg_503_0 = {}
	end

	events.render(slot_0_42_10.on_render, arg_503_0.branded == true)
	events.render(slot_0_43_12.on_render, arg_503_0.corner == true)
end

slot_0_45_12 = nil

function slot_0_46_11(arg_504_0)
	slot_0_44_12({
		branded = arg_504_0:get("Branded"),
		corner = arg_504_0:get("Corner")
	})
end

function slot_0_47_13(arg_505_0)
	local var_505_0 = arg_505_0:get()

	if not var_505_0 then
		slot_0_44_12(nil)
	end

	if var_505_0 then
		slot_0_41_6.style:set_callback(slot_0_46_11, true)
	else
		slot_0_41_6.style:unset_callback(slot_0_46_11)
	end
end

slot_0_41_6.enabled:set_callback(slot_0_47_13, true)

slot_0_41_5 = nil
slot_0_42_9 = slot_0_23_0.visuals.manual_arrows
slot_0_43_11 = slot_0_23_0.antiaim.settings.manual_yaw
slot_0_44_11 = slot_0_15_0.load_font("C:\\Windows\\Fonts\\verdana.ttf", vector(16, 16.5, 0), "a")
slot_0_45_11 = slot_0_15_0.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a")
slot_0_46_10 = 0
slot_0_47_12 = 0

function slot_0_48_15(arg_506_0, arg_506_1, arg_506_2)
	return arg_506_0 + arg_506_1 * vector():angles(vector(0, arg_506_2, 0))
end

function slot_0_49_17()
	if not slot_0_42_9.dynamic_mode:get() then
		return 0
	end

	local var_507_0 = slot_0_42_9.style:get()

	if var_507_0 ~= 1 and var_507_0 ~= 4 then
		return 0
	end

	local var_507_1 = entity.get_local_player()
	local var_507_2 = entity.get_threat()

	if var_507_1 == nil or var_507_2 == nil then
		return 0
	end

	local var_507_3 = slot_0_15_0.camera_angles()
	local var_507_4 = var_507_2.m_angEyeAngles
	local var_507_5 = var_507_1:get_origin()
	local var_507_6 = var_507_2:get_origin()
	local var_507_7 = slot_0_48_15(var_507_5, 50, var_507_3.y + 110)
	local var_507_8 = slot_0_48_15(var_507_5, 30, var_507_3.y + 60)
	local var_507_9 = slot_0_48_15(var_507_5, 50, var_507_3.y - 110)
	local var_507_10 = slot_0_48_15(var_507_5, 30, var_507_3.y - 60)
	local var_507_11 = slot_0_48_15(var_507_6, 40, var_507_4.y + 115)
	local var_507_12 = slot_0_48_15(var_507_6, 20, var_507_4.y + 35)
	local var_507_13 = slot_0_48_15(var_507_6, 40, var_507_4.y - 115)
	local var_507_14 = slot_0_48_15(var_507_6, 20, var_507_4.y - 35)
	local var_507_15 = utils.trace_bullet(var_507_2, vector(var_507_11.x, var_507_11.y, var_507_11.z + 70), var_507_7)
	local var_507_16 = utils.trace_bullet(var_507_2, vector(var_507_12.x, var_507_12.y, var_507_12.z + 30), var_507_8)
	local var_507_17 = utils.trace_bullet(var_507_2, vector(var_507_13.x, var_507_13.y, var_507_13.z + 70), var_507_9)
	local var_507_18 = utils.trace_bullet(var_507_2, vector(var_507_14.x, var_507_14.y, var_507_14.z + 30), var_507_10)
	local var_507_19 = 0

	if var_507_15 == 0 then
		if var_507_18 > 0 then
			var_507_19 = 2
		elseif var_507_17 > 0 then
			var_507_19 = 1
		end
	end

	if var_507_17 == 0 then
		if var_507_16 > 0 then
			var_507_19 = -2
		elseif var_507_15 > 0 then
			var_507_19 = -1
		end
	end

	return var_507_19
end

function slot_0_50_17()
	return slot_0_43_11.select:get()
end

function slot_0_51_16()
	slot_0_47_12 = slot_0_49_17()
end

function slot_0_52_12()
	slot_510_0_0 = entity.get_local_player()

	if slot_510_0_0 == nil or not slot_510_0_0:is_alive() then
		return
	end

	slot_510_1_0 = slot_0_42_9.style:get()
	slot_510_2_0 = slot_0_42_9.offset:get()
	slot_510_3_0 = slot_0_42_9.accent_color:get()
	slot_510_4_0 = slot_0_42_9.secondary_color:get()
	slot_510_5_0 = slot_0_50_17()
	slot_510_6_0 = rage.antiaim:inverter()
	slot_510_7_0 = slot_510_5_0 == "Left" or slot_0_47_12 < 0
	slot_510_8_0 = slot_510_5_0 == "Right" or slot_0_47_12 > 0
	slot_510_9_0 = slot_510_0_0.m_bIsScoped
	slot_510_10_0 = slot_0_15_0.screen_size()
	slot_510_12_0, slot_510_13_0 = vector(slot_510_10_0.x / 2, slot_510_10_0.y / 2):unpack()
	slot_510_14_0 = slot_510_5_0 ~= nil and slot_510_5_0 ~= "Off"
	slot_0_46_10 = slot_0_14_0.interp(slot_0_46_10, slot_510_9_0 and slot_0_42_9.animate_scope:get(), 0.05)

	if slot_510_14_0 or slot_0_47_12 ~= 0 then
		if slot_510_1_0 == 1 then
			slot_510_15_3 = slot_0_45_11
			slot_510_16_3 = "+"
			slot_510_17_3 = slot_0_47_12 == -2 and "<<" or "<"
			slot_510_18_3 = slot_0_47_12 == 2 and ">>" or ">"
			slot_510_19_3 = slot_0_15_0.measure_text(slot_510_15_3, slot_510_16_3, slot_510_17_3)
			slot_510_20_3 = slot_0_15_0.measure_text(slot_510_15_3, slot_510_16_3, slot_510_18_3)
			slot_510_21_3 = slot_510_7_0 and slot_510_3_0 or slot_510_4_0
			slot_510_22_3 = slot_510_8_0 and slot_510_3_0 or slot_510_4_0
			slot_510_23_3 = vector(slot_510_12_0 - slot_510_2_0, slot_510_13_0 + 1 - slot_510_19_3.y * 0.5)
			slot_510_24_3 = vector(slot_510_12_0 + slot_510_2_0, slot_510_13_0 + 1 - slot_510_20_3.y * 0.5)
			slot_510_23_3.x = slot_510_23_3.x - slot_510_19_3.x

			slot_0_15_0.text(slot_510_15_3, slot_510_23_3, slot_510_21_3, slot_510_16_3, slot_510_17_3)
			slot_0_15_0.text(slot_510_15_3, slot_510_24_3, slot_510_22_3, slot_510_16_3, slot_510_18_3)
		end

		if slot_510_1_0 == 3 then
			slot_510_15_2 = slot_0_45_11
			slot_510_16_2 = "+"
			slot_510_17_2 = ""
			slot_510_18_2 = ""
			slot_510_19_2 = slot_0_15_0.measure_text(slot_510_15_2, slot_510_16_2, slot_510_17_2)
			slot_510_20_2 = slot_0_15_0.measure_text(slot_510_15_2, slot_510_16_2, slot_510_18_2)
			slot_510_21_2 = slot_510_7_0 and slot_510_3_0 or slot_510_4_0
			slot_510_22_2 = slot_510_8_0 and slot_510_3_0 or slot_510_4_0
			slot_510_23_2 = slot_0_6_0(20 * slot_0_46_10)
			slot_510_24_2 = slot_0_6_0(20 * slot_0_46_10)
			slot_510_21_2.a = slot_510_21_2.a - slot_510_21_2.a * (0.4 * slot_0_46_10)
			slot_510_22_2.a = slot_510_22_2.a - slot_510_22_2.a * (0.4 * slot_0_46_10)
			slot_510_25_1 = vector(slot_510_12_0 - slot_510_2_0 - slot_510_23_2, slot_510_13_0 - slot_510_19_2.y * 0.4)
			slot_510_26_1 = vector(slot_510_12_0 + slot_510_2_0 + slot_510_24_2, slot_510_13_0 - slot_510_20_2.y * 0.4)
			slot_510_25_1.x = slot_510_25_1.x - slot_510_19_2.x

			slot_0_15_0.text(slot_510_15_2, slot_510_25_1, slot_510_21_2, slot_510_16_2, slot_510_17_2)
			slot_0_15_0.text(slot_510_15_2, slot_510_26_1, slot_510_22_2, slot_510_16_2, slot_510_18_2)
		end

		if slot_510_1_0 == 4 then
			slot_510_15_1 = slot_0_44_11
			slot_510_16_1 = ""
			slot_510_17_1 = slot_0_47_12 == -2 and "❮❮" or "❮"
			slot_510_18_1 = slot_0_47_12 == 2 and "❯❯" or "❯"
			slot_510_19_1 = slot_0_15_0.measure_text(slot_510_15_1, slot_510_16_1, slot_510_17_1)
			slot_510_20_1 = slot_0_15_0.measure_text(slot_510_15_1, slot_510_16_1, slot_510_18_1)
			slot_510_21_1 = slot_510_7_0 and slot_510_3_0 or slot_510_4_0
			slot_510_22_1 = slot_510_8_0 and slot_510_3_0 or slot_510_4_0
			slot_510_23_1 = vector(slot_510_12_0 - slot_510_2_0, slot_510_13_0 - slot_510_19_1.y * 0.5)
			slot_510_24_1 = vector(slot_510_12_0 + slot_510_2_0, slot_510_13_0 - slot_510_20_1.y * 0.5)
			slot_510_23_1.x = slot_510_23_1.x - slot_510_19_1.x

			slot_0_15_0.text(slot_510_15_1, slot_510_23_1, slot_510_21_1, slot_510_16_1, slot_510_17_1)
			slot_0_15_0.text(slot_510_15_1, slot_510_24_1, slot_510_22_1, slot_510_16_1, slot_510_18_1)
		end
	end

	if slot_510_1_0 == 2 then
		slot_510_15_0 = 2
		slot_510_16_0 = 13
		slot_510_17_0 = 9
		slot_510_18_0 = color(35, 35, 35, 150)
		slot_510_19_0 = slot_510_7_0 and slot_510_3_0 or slot_510_18_0
		slot_510_20_0 = slot_510_8_0 and slot_510_3_0 or slot_510_18_0
		slot_510_21_0 = slot_510_6_0 == true and slot_510_4_0 or slot_510_18_0
		slot_510_22_0 = slot_510_6_0 == false and slot_510_4_0 or slot_510_18_0
		slot_510_23_0 = slot_510_12_0 - slot_510_2_0 - slot_510_16_0
		slot_510_24_0 = slot_510_12_0 + slot_510_2_0 + slot_510_16_0
		slot_510_25_0 = vector(slot_510_23_0 + slot_510_15_0 + 2, slot_510_13_0 - slot_510_17_0)
		slot_510_26_0 = vector(slot_510_24_0 - slot_510_15_0 - 2, slot_510_13_0 - slot_510_17_0)
		slot_510_27_0 = vector(-slot_510_15_0, slot_510_17_0 * 2)
		slot_510_28_0 = vector(slot_510_15_0, slot_510_17_0 * 2)

		slot_0_15_0.poly(slot_510_19_0, vector(slot_510_23_0 + 1 - slot_510_16_0, slot_510_13_0), vector(slot_510_23_0 + 1, slot_510_13_0 - slot_510_17_0), vector(slot_510_23_0 + 1, slot_510_13_0 + slot_510_17_0))
		slot_0_15_0.poly(slot_510_20_0, vector(slot_510_24_0 + slot_510_16_0, slot_510_13_0), vector(slot_510_24_0, slot_510_13_0 - slot_510_17_0), vector(slot_510_24_0, slot_510_13_0 + slot_510_17_0))
		slot_0_15_0.rect(slot_510_25_0, slot_510_25_0 + slot_510_27_0, slot_510_21_0)
		slot_0_15_0.rect(slot_510_26_0, slot_510_26_0 + slot_510_28_0, slot_510_22_0)
	end
end

slot_0_53_10 = nil

function slot_0_54_11(arg_511_0)
	local var_511_0 = arg_511_0:get()

	events.render(slot_0_52_12, var_511_0)
	events.createmove(slot_0_51_16, var_511_0)
end

slot_0_42_9.enabled:set_callback(slot_0_54_11, true)

slot_0_42_8 = nil
slot_0_43_10 = slot_0_23_0.visuals.custom_scope
slot_0_44_10 = 0.000925925925925926
slot_0_45_10 = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
slot_0_46_9 = 0

function slot_0_47_11()
	slot_512_0_0 = entity.get_local_player()

	if slot_512_0_0 == nil or not slot_512_0_0:is_alive() then
		return
	end

	slot_512_1_0 = slot_512_0_0:get_player_weapon()

	if slot_512_1_0 == nil then
		return
	end

	slot_0_46_9 = slot_0_14_0.interp(slot_0_46_9, slot_512_0_0.m_bIsScoped, 0.05)

	if slot_0_46_9 == 0 then
		return
	end

	slot_512_2_0 = slot_0_15_0.screen_size()
	slot_512_3_0 = slot_512_2_0 * 0.5
	slot_512_4_0 = slot_0_43_10.accent_color:get()
	slot_512_5_0 = slot_0_43_10.secondary_color:get()
	slot_512_6_1 = slot_0_43_10.offset:get() * slot_512_2_0.y * slot_0_44_10
	slot_512_7_1 = slot_0_43_10.position:get() * slot_512_2_0.y * slot_0_44_10
	slot_512_8_0 = slot_0_43_10.thickness:get()
	slot_512_9_0 = slot_0_43_10.extra_options:get("Rotate Angle")

	if slot_0_43_10.extra_options:get("Dynamic Offset") then
		slot_512_11_4 = slot_512_1_0:get_spread()
		slot_512_13_0 = (slot_512_1_0:get_inaccuracy() + slot_512_11_4) * 360
		slot_512_6_1 = slot_512_6_1 + slot_512_13_0
		slot_512_7_1 = slot_512_7_1 + slot_512_13_0
	end

	slot_512_6_0 = slot_0_6_0(slot_512_6_1)
	slot_512_7_0 = slot_0_6_0(slot_512_7_1)
	slot_512_4_0.a = slot_512_4_0.a * slot_0_46_9
	slot_512_5_0.a = slot_512_5_0.a * slot_0_46_9

	if slot_512_9_0 then
		slot_0_15_0.push_rotation(45)
	end

	if not slot_0_43_10.exclude_lines:get("Top") then
		slot_512_11_3 = vector(slot_512_3_0.x + 0.5 - slot_512_8_0 * 0.5, slot_512_3_0.y - slot_512_6_0 + 1)
		slot_512_12_3 = vector(slot_512_3_0.x + 0.5 + slot_512_8_0 * 0.5, slot_512_3_0.y - slot_512_7_0 + 1)

		slot_0_15_0.gradient(slot_512_11_3, slot_512_12_3, slot_512_4_0, slot_512_4_0, slot_512_5_0, slot_512_5_0)
	end

	if not slot_0_43_10.exclude_lines:get("Bottom") then
		slot_512_11_2 = vector(slot_512_3_0.x + 0.5 - slot_512_8_0 * 0.5, slot_512_3_0.y + slot_512_6_0)
		slot_512_12_2 = vector(slot_512_3_0.x + 0.5 + slot_512_8_0 * 0.5, slot_512_3_0.y + slot_512_7_0)

		slot_0_15_0.gradient(slot_512_11_2, slot_512_12_2, slot_512_4_0, slot_512_4_0, slot_512_5_0, slot_512_5_0)
	end

	if not slot_0_43_10.exclude_lines:get("Left") then
		slot_512_11_1 = vector(slot_512_3_0.x - slot_512_6_0 + 1, slot_512_3_0.y + 0.5 - slot_512_8_0 * 0.5)
		slot_512_12_1 = vector(slot_512_3_0.x - slot_512_7_0 + 1, slot_512_3_0.y + 0.5 + slot_512_8_0 * 0.5)

		slot_0_15_0.gradient(slot_512_11_1, slot_512_12_1, slot_512_4_0, slot_512_5_0, slot_512_4_0, slot_512_5_0)
	end

	if not slot_0_43_10.exclude_lines:get("Right") then
		slot_512_11_0 = vector(slot_512_3_0.x + slot_512_6_0, slot_512_3_0.y + 0.5 - slot_512_8_0 * 0.5)
		slot_512_12_0 = vector(slot_512_3_0.x + slot_512_7_0, slot_512_3_0.y + 0.5 + slot_512_8_0 * 0.5)

		slot_0_15_0.gradient(slot_512_11_0, slot_512_12_0, slot_512_4_0, slot_512_5_0, slot_512_4_0, slot_512_5_0)
	end

	if slot_512_9_0 then
		slot_0_15_0.pop_rotation()
	end
end

function slot_0_48_14()
	slot_0_45_10:override()
end

function slot_0_49_16(arg_514_0)
	if not arg_514_0 then
		slot_0_45_10:override()
	end

	events.render(slot_0_47_11, arg_514_0)
	events.shutdown(slot_0_48_14, arg_514_0)
end

slot_0_50_16 = nil

function slot_0_51_15(arg_515_0)
	local var_515_0 = arg_515_0:get()

	if var_515_0 then
		slot_0_45_10:override("Remove All")
	end

	slot_0_49_16(var_515_0)
end

slot_0_43_10.enabled:set_callback(slot_0_51_15, true)

slot_0_43_9 = nil
slot_0_44_9 = slot_0_23_0.visuals.damage_indicator
slot_0_45_9 = {
	Default = 1,
	Alternative = 2
}

function slot_0_46_8()
	local var_516_0 = slot_0_9_0.ragebot.selection.min_damage:get()

	if var_516_0 == 0 then
		return "A"
	end

	if var_516_0 > 100 then
		return string.format("+%d", var_516_0 - 100)
	end

	return var_516_0
end

function slot_0_47_10()
	local var_517_0 = entity.get_local_player()

	if var_517_0 == nil or not var_517_0:is_alive() then
		return
	end

	local var_517_1 = slot_0_29_0.get(slot_0_9_0.ragebot.selection.min_damage)

	if (var_517_1 == nil or not var_517_1.active) and slot_0_44_9.if_override:get() then
		return
	end

	local var_517_2 = var_517_1 ~= nil and var_517_1.active and slot_0_44_9.active_color:get() or slot_0_44_9.inactive_color:get()
	local var_517_3 = (slot_0_15_0.screen_size() / 2):clone()
	local var_517_4 = slot_0_45_9[slot_0_44_9.font:get()]

	if var_517_4 == nil then
		return
	end

	local var_517_5 = slot_0_44_9.offset:get()
	local var_517_6 = ""
	local var_517_7 = slot_0_46_8()
	local var_517_8 = slot_0_15_0.measure_text(var_517_4, var_517_6, var_517_7)

	var_517_3.x = var_517_3.x + var_517_5 + 2
	var_517_3.y = var_517_3.y - var_517_5
	var_517_3.y = var_517_3.y - var_517_8.y

	slot_0_15_0.text(var_517_4, var_517_3, var_517_2, var_517_6, var_517_7)
end

function slot_0_48_13(arg_518_0)
	events.render(slot_0_47_10, arg_518_0)
end

slot_0_49_15 = nil

function slot_0_50_15(arg_519_0)
	slot_0_48_13(arg_519_0:get())
end

slot_0_44_9.enabled:set_callback(slot_0_50_15, true)

slot_0_44_8 = nil
slot_0_45_8 = slot_0_23_0.visuals.break_lc_indicator
slot_0_46_7 = slot_0_15_0.load_font("Calibri", 11, "ad")
slot_0_47_9 = 0
slot_0_48_12 = 0
slot_0_49_14 = "lc status"
slot_0_50_14 = color()
slot_0_51_14 = 0
slot_0_52_11 = 0
slot_0_53_9 = 0
slot_0_54_10 = false
slot_0_55_12 = nil
slot_0_56_11 = slot_0_15_0.screen_size()
slot_0_57_9 = vector(60, 30)
slot_0_58_8 = vector((slot_0_56_11.x - slot_0_57_9.x) / 2, slot_0_56_11.y * 0.3475)
slot_0_55_11 = slot_0_17_0.new("lc_indicator", slot_0_58_8, slot_0_57_9, {
	rulers = {
		{
			true,
			vector(slot_0_56_11.x / 2, 0),
			slot_0_56_11.y
		}
	},
	border = {
		vector(slot_0_56_11.x * 0.5, 0),
		vector(slot_0_56_11.x * 0.5, slot_0_56_11.y)
	}
})

function slot_0_56_10()
	if not slot_0_23_0.antiaim.enabled:get() then
		return not slot_0_24_0.is_onground
	end

	local var_520_0 = entity.get_local_player()

	if var_520_0 == nil then
		return
	end

	local var_520_1 = var_520_0:get_player_weapon()

	if var_520_1 == nil then
		return
	end

	local var_520_2 = var_520_1:get_weapon_info()

	if var_520_2 == nil then
		return
	end

	local var_520_3 = var_520_2.weapon_type
	local var_520_4 = var_520_1:get_weapon_index()
	local var_520_5 = var_520_3 == 9
	local var_520_6 = var_520_4 == 64

	if var_520_5 or var_520_6 then
		return false
	end

	local var_520_7 = slot_0_33_0.builder:get_old_items()

	if var_520_7 == nil then
		return false
	end

	local var_520_8 = var_520_7.defensive

	if var_520_8 == nil then
		return false
	end

	return var_520_8.force_break_lc:get()
end

function slot_0_57_8(arg_521_0)
	if arg_521_0 <= 0 then
		return "failed", color(255, 64, 64)
	end

	if arg_521_0 <= 3 then
		return "bad", color(255, 175, 104)
	end

	if arg_521_0 <= 6 then
		return "ok", color(255, 255, 255)
	end

	if arg_521_0 <= 9 then
		return "good", color(205, 236, 142)
	end

	if arg_521_0 <= 11 then
		return "nice", color(122, 241, 182)
	end

	if arg_521_0 <= 12 then
		return "ideal lc", color(101, 213, 255)
	end

	return "angel lc", color(207, 145, 255)
end

function slot_0_58_7()
	local var_522_0 = slot_0_55_11:get_drag_position() + slot_0_55_11:get_drag_size() / 2
	local var_522_1 = ui.get_alpha()

	if var_522_1 > 0 then
		slot_0_48_12 = 1
	end

	if slot_0_48_12 <= 0 then
		return
	end

	local var_522_2 = ""
	local var_522_3 = slot_0_49_14
	local var_522_4 = slot_0_51_14 .. "t"
	local var_522_5 = slot_0_50_14:clone()
	local var_522_6 = color(255, 255, 255, 128)

	if slot_0_47_9 == 0 and var_522_1 > 0 then
		var_522_3 = "lc status"
		var_522_5 = color()
	end

	var_522_6.a = var_522_6.a * slot_0_48_12
	var_522_5.a = var_522_5.a * slot_0_48_12

	local var_522_7 = slot_0_15_0.measure_text(slot_0_46_7, var_522_2, var_522_3)
	local var_522_8 = slot_0_15_0.measure_text(slot_0_46_7, var_522_2, var_522_4)

	var_522_0.y = var_522_0.y - (var_522_7.y + var_522_8.y + 1) / 2

	local var_522_9 = var_522_0 + vector(-var_522_7.x * 0.5, 0)
	local var_522_10 = var_522_0 + vector(-var_522_8.x * 0.5, 0)

	var_522_10.y = var_522_10.y + (var_522_7.y + 1)

	slot_0_15_0.text(slot_0_46_7, var_522_9, var_522_5, var_522_2, var_522_3)
	slot_0_15_0.text(slot_0_46_7, var_522_10, var_522_6, var_522_2, var_522_4)

	slot_0_47_9 = math.max(0, slot_0_47_9 - globals.frametime)

	if slot_0_47_9 == 0 then
		slot_0_48_12 = math.max(0, slot_0_48_12 - globals.frametime * 8)
	end

	slot_0_55_11()
end

function slot_0_59_7()
	local var_523_0 = rage.exploit:get()
	local var_523_1 = var_523_0 - slot_0_52_11

	if var_523_1 > 0 then
		slot_0_54_10 = true
	end

	if slot_0_54_10 and var_523_1 < 0 then
		slot_0_54_10 = false

		if slot_0_56_10() or slot_0_53_9 > 0 then
			local var_523_2, var_523_3 = slot_0_57_8(slot_0_53_9)

			slot_0_47_9 = 0.66
			slot_0_48_12 = 1
			slot_0_50_14 = var_523_3
			slot_0_49_14 = var_523_2
			slot_0_51_14 = slot_0_53_9
		end
	end

	slot_0_52_11 = var_523_0
	slot_0_53_9 = slot_0_25_0.defensive_ticks
end

function slot_0_60_2(arg_524_0)
	events.render(slot_0_58_7, arg_524_0)
	events.createmove(slot_0_59_7, arg_524_0)
end

slot_0_61_2 = nil

function slot_0_62_1(arg_525_0)
	slot_0_60_2(arg_525_0:get())
end

slot_0_45_8.enabled:set_callback(slot_0_62_1, true)

slot_0_45_7 = nil
slot_0_46_6 = slot_0_23_0.visuals.velocity_warning
slot_0_47_8 = 0
slot_0_48_11 = nil
slot_0_49_13 = slot_0_15_0.screen_size()
slot_0_50_13 = vector(130, 12)
slot_0_51_13 = vector((slot_0_49_13.x - slot_0_50_13.x) / 2, slot_0_49_13.y * 0.285)
slot_0_48_10 = slot_0_17_0.new("velocity_warning", slot_0_51_13, slot_0_50_13, {
	rulers = {
		{
			true,
			vector(slot_0_49_13.x / 2, 0),
			slot_0_49_13.y
		}
	},
	border = {
		vector(slot_0_49_13.x * 0.5, 0),
		vector(slot_0_49_13.x * 0.5, slot_0_49_13.y)
	}
})

function slot_0_49_12()
	local var_526_0 = entity.get_local_player()

	if var_526_0 == nil then
		return
	end

	local var_526_1 = slot_0_48_10:get_drag_position():clone()
	local var_526_2 = slot_0_48_10:get_drag_size()
	local var_526_3 = -globals.realtime
	local var_526_4 = var_526_0:is_alive()
	local var_526_5 = ui.get_alpha() > 0
	local var_526_6 = slot_0_46_6.color_accent:get()
	local var_526_7 = slot_0_46_6.color_secondary:get()
	local var_526_8 = var_526_0.m_flVelocityModifier

	if not var_526_4 then
		var_526_8 = 1
	end

	local var_526_9 = var_526_5 or var_526_4 and var_526_8 < 1

	slot_0_47_8 = slot_0_14_0.interp(slot_0_47_8, var_526_9, 0.05)

	if slot_0_47_8 > 0 then
		var_526_6.a = var_526_6.a * slot_0_47_8
		var_526_7.a = var_526_7.a * slot_0_47_8

		local var_526_10 = slot_0_18_0.gradient(string.format("%d%%", var_526_8 * 100), var_526_3, var_526_6, var_526_7)
		local var_526_11 = 1
		local var_526_12 = ""
		local var_526_13 = string.format("velocity inflicted ~ %s", var_526_10)
		local var_526_14 = slot_0_15_0.measure_text(var_526_11, var_526_12, var_526_13)

		var_526_1.x = var_526_1.x + (var_526_2.x - var_526_14.x) / 2 + 1

		slot_0_15_0.text(var_526_11, var_526_1, var_526_6, var_526_12, var_526_13)
	end

	slot_0_48_10()
end

function slot_0_50_12(arg_527_0)
	events.render(slot_0_49_12, arg_527_0)
end

slot_0_51_12 = nil

function slot_0_52_10(arg_528_0)
	slot_0_50_12(arg_528_0:get())
end

slot_0_46_6.enabled:set_callback(slot_0_52_10, true)

slot_0_46_5 = nil
slot_0_47_7 = slot_0_23_0.visuals.grenade_radius
slot_0_48_9 = cvar.mp_friendlyfire
slot_0_49_11 = {}
slot_0_50_11 = {}

function slot_0_51_11(arg_529_0)
	if slot_0_48_9:int() == 1 then
		return false
	end

	local var_529_0 = entity.get_local_player()
	local var_529_1 = arg_529_0.m_hOwnerEntity

	if var_529_1 == nil or not var_529_1:is_player() then
		return false
	end

	if var_529_0 == var_529_1 or var_529_1:is_enemy() then
		return false
	end

	return true
end

function slot_0_52_9(arg_530_0)
	for iter_530_0 in pairs(arg_530_0) do
		arg_530_0[iter_530_0] = nil
	end
end

function slot_0_53_8()
	local var_531_0 = entity.get_entities("CSmokeGrenadeProjectile")
	local var_531_1 = {}

	for iter_531_0 = 1, #var_531_0 do
		local var_531_2 = var_531_0[iter_531_0]

		if not var_531_2.m_bDidSmokeEffect then
			-- block empty
		else
			local var_531_3 = var_531_2:get_index()

			if slot_0_49_11[var_531_3] == nil then
				local var_531_4 = var_531_2:get_origin()

				slot_0_49_11[var_531_3] = {
					radius = 125,
					alpha = 0,
					index = var_531_3,
					origin = var_531_4
				}
			end

			var_531_1[var_531_3] = true
		end
	end

	for iter_531_1 in pairs(slot_0_49_11) do
		if var_531_1[iter_531_1] == nil then
			slot_0_49_11[iter_531_1] = nil
		end
	end
end

function slot_0_54_9()
	local var_532_0 = entity.get_entities("CInferno")
	local var_532_1 = {}

	for iter_532_0 = 1, #var_532_0 do
		local var_532_2 = var_532_0[iter_532_0]
		local var_532_3 = var_532_2.m_fireCount

		if var_532_3 == 0 then
			-- block empty
		else
			local var_532_4 = var_532_2:get_index()

			if slot_0_50_11[var_532_4] == nil then
				local var_532_5 = var_532_2:get_origin()
				local var_532_6 = slot_0_51_11(var_532_2)

				slot_0_50_11[var_532_4] = {
					alpha = 0,
					radius = 0,
					fire_count = 0,
					index = var_532_4,
					origin = var_532_5,
					friendly = var_532_6
				}
			end

			local var_532_7 = slot_0_50_11[var_532_4]

			if var_532_3 > var_532_7.fire_count then
				var_532_7.fire_count = var_532_3

				local var_532_8 = 0
				local var_532_9
				local var_532_10
				local var_532_11 = {}
				local var_532_12 = 0
				local var_532_13 = var_532_2:get_origin()

				for iter_532_1 = 0, var_532_3 - 1 do
					if var_532_2.m_bFireIsBurning[iter_532_1] then
						var_532_11[var_532_12], var_532_12 = vector(var_532_2.m_fireXDelta[iter_532_1], var_532_2.m_fireYDelta[iter_532_1], var_532_2.m_fireZDelta[iter_532_1]), var_532_12 + 1
					end
				end

				for iter_532_2 = 1, var_532_12 do
					for iter_532_3 = 1, var_532_12 do
						local var_532_14 = var_532_11[iter_532_2]
						local var_532_15 = var_532_11[iter_532_3]
						local var_532_16 = (var_532_15 - var_532_14):lengthsqr()

						if var_532_8 < var_532_16 then
							var_532_8 = var_532_16
							var_532_9 = var_532_14
							var_532_10 = var_532_15
						end
					end
				end

				if var_532_9 ~= nil and var_532_10 ~= nil then
					var_532_7.radius = math.sqrt(var_532_8) / 2 + 40
				end
			end

			var_532_1[var_532_4] = true
		end
	end

	for iter_532_4 in pairs(slot_0_50_11) do
		if var_532_1[iter_532_4] == nil then
			slot_0_50_11[iter_532_4] = nil
		end
	end
end

function slot_0_55_10()
	local var_533_0 = globals.frametime
	local var_533_1 = slot_0_47_7.smoke_color:get()
	local var_533_2 = slot_0_47_7.molotov_color:get()

	for iter_533_0, iter_533_1 in pairs(slot_0_49_11) do
		iter_533_1.alpha = math.min(iter_533_1.alpha + var_533_0 * 4, 1)

		local var_533_3 = iter_533_1.radius * iter_533_1.alpha

		slot_0_15_0.circle_3d_outline(iter_533_1.origin, var_533_1, var_533_3, 0, 1, 1)
	end

	for iter_533_2, iter_533_3 in pairs(slot_0_50_11) do
		iter_533_3.alpha = math.min(iter_533_3.alpha + var_533_0 * 4, 1)

		local var_533_4 = iter_533_3.radius * iter_533_3.alpha

		slot_0_15_0.circle_3d_outline(iter_533_3.origin, var_533_2, var_533_4, 0, 1, 1)

		local var_533_5 = slot_0_15_0.world_to_screen(iter_533_3.origin)

		if var_533_5 ~= nil then
			if iter_533_3.teammate then
				slot_0_15_0.text(1, var_533_5, color(149, 184, 6, 255), "c", "✔")
			else
				slot_0_15_0.text(1, var_533_5, color(230, 21, 21, 255), "c", "❌")
			end
		end
	end
end

slot_0_56_9 = nil

function slot_0_57_7(arg_534_0)
	local var_534_0 = arg_534_0:get()

	if not var_534_0 then
		slot_0_52_9(slot_0_49_11)
	end

	events.net_update_start(slot_0_53_8, var_534_0)
end

function slot_0_58_6(arg_535_0)
	local var_535_0 = arg_535_0:get()

	if not var_535_0 then
		slot_0_52_9(slot_0_50_11)
	end

	events.net_update_start(slot_0_54_9, var_535_0)
end

function slot_0_59_6(arg_536_0)
	local var_536_0 = arg_536_0:get()

	if not var_536_0 then
		slot_0_52_9(slot_0_49_11)
		slot_0_52_9(slot_0_50_11)
		events.net_update_start(slot_0_53_8, false)
		events.net_update_start(slot_0_54_9, false)
	end

	if var_536_0 then
		slot_0_47_7.smoke:set_callback(slot_0_57_7, true)
		slot_0_47_7.molotov:set_callback(slot_0_58_6, true)
	else
		slot_0_47_7.smoke:unset_callback(slot_0_57_7)
		slot_0_47_7.molotov:unset_callback(slot_0_58_6)
	end

	events.render(slot_0_55_10, var_536_0)
end

slot_0_47_7.enabled:set_callback(slot_0_59_6, true)

slot_0_47_6 = nil
slot_0_48_8 = slot_0_23_0.visuals.gamesense_indicators
slot_0_49_10 = 380
slot_0_50_10 = 8
slot_0_51_10 = 24
slot_0_52_8 = 4
slot_0_53_7 = 3
slot_0_54_8 = slot_0_15_0.load_font("C:\\Windows\\Fonts\\calibrib.ttf", vector(25, 23.5, 0), "a")
slot_0_55_9 = {}
slot_0_55_9.__index = slot_0_55_9

function slot_0_55_9.new(arg_537_0, arg_537_1, arg_537_2)
	return setmetatable({
		id = arg_537_1,
		size = arg_537_2
	}, arg_537_0)
end

function slot_0_55_9.draw(arg_538_0, arg_538_1, arg_538_2, ...)
	slot_0_15_0.texture(arg_538_0.id, arg_538_1, arg_538_0.size, arg_538_2, ...)
end

slot_0_56_8 = {
	bomb_c4 = slot_0_15_0.load_image_from_file("materials\\panorama\\images\\icons\\ui\\bomb_c4.svg", vector(32, 32))
}
slot_0_57_6 = {
	bomb_c4 = slot_0_55_9:new(slot_0_56_8.bomb_c4, vector(32, 29))
}
slot_0_58_5 = {}
slot_0_59_5 = 100
slot_0_60_1 = 0
slot_0_61_1 = 0
slot_0_62_0 = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot")
slot_0_63_0 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
slot_0_64_0 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots")
slot_0_65_0 = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim")
slot_0_66_0 = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points")
slot_0_67_0 = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage")
slot_0_68_0 = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance")
slot_0_69_0 = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes")
slot_0_70_0 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
slot_0_71_0 = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
slot_0_72_0 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
slot_0_73_0 = slot_0_48_8.feature_list

function slot_0_74_0(arg_539_0)
	local var_539_0 = arg_539_0:get_override()

	if var_539_0 ~= nil then
		return var_539_0
	end

	return arg_539_0:get()
end

function slot_0_75_0(arg_540_0)
	local var_540_0 = slot_0_29_0.get(arg_540_0)

	return var_540_0 ~= nil and var_540_0.active
end

function slot_0_76_0()
	for iter_541_0 = 1, #slot_0_58_5 do
		slot_0_58_5[iter_541_0] = nil
	end
end

function slot_0_77_0(arg_542_0)
	local var_542_0 = slot_0_15_0.measure_text(slot_0_54_8, nil, arg_542_0.text)
	local var_542_1 = slot_0_15_0.screen_size()

	var_542_0.y = var_542_0.y + slot_0_52_8 * 2

	local var_542_2 = next(slot_0_58_5) == nil and var_542_1.y - (var_542_1.y - slot_0_49_10) / 2 or slot_0_58_5[#slot_0_58_5].offset - slot_0_50_10 - var_542_0.y

	arg_542_0.offset = var_542_2
	arg_542_0.text_size = var_542_0

	table.insert(slot_0_58_5, arg_542_0)

	return var_542_2
end

function slot_0_78_0(arg_543_0, arg_543_1, ...)
	arg_543_1 = table.concat({
		arg_543_1,
		...
	})

	return slot_0_77_0({
		text = arg_543_1,
		color = arg_543_0
	})
end

function slot_0_79_0(arg_544_0, arg_544_1)
	local var_544_0 = 0.5
	local var_544_1 = 0.5

	if arg_544_1 > 0 then
		local var_544_2 = arg_544_0 * var_544_0

		if arg_544_1 < (arg_544_0 - var_544_2) * var_544_1 then
			var_544_2 = arg_544_0 - arg_544_1 * (1 / var_544_1)
		end

		arg_544_0 = var_544_2
	end

	return arg_544_0
end

function slot_0_80_0(arg_545_0, arg_545_1)
	local var_545_0 = 1
	local var_545_1 = 500
	local var_545_2 = var_545_1 * 3.5
	local var_545_3 = (arg_545_1:get_origin() - arg_545_0:get_eye_position()):length()
	local var_545_4 = var_545_2 / 3
	local var_545_5 = var_545_1 * math.exp(-var_545_3 * var_545_3 / (2 * var_545_4 * var_545_4)) * var_545_0

	return slot_0_79_0(var_545_5, arg_545_0.m_ArmorValue)
end

function slot_0_81_0(arg_546_0)
	slot_546_1_0 = slot_0_75_0(slot_0_67_0)
	slot_546_2_0 = slot_0_75_0(slot_0_68_0)
	slot_546_3_0 = slot_0_75_0(slot_0_69_0)
	slot_546_4_0 = slot_0_72_0:get() > 0
	slot_546_5_0 = slot_0_74_0(slot_0_70_0)
	slot_546_6_0 = slot_0_74_0(slot_0_71_0) or slot_0_23_0.antiaim.settings.freestanding.enabled:get()
	slot_546_7_0 = slot_0_74_0(slot_0_65_0) == "Force"
	slot_546_8_0 = slot_0_74_0(slot_0_66_0) == "Force"
	slot_546_9_0 = slot_0_74_0(slot_0_63_0) and not slot_546_5_0
	slot_546_10_0 = slot_0_74_0(slot_0_64_0) and not slot_546_5_0 and not slot_546_9_0
	slot_546_11_0 = slot_0_74_0(slot_0_62_0)

	if slot_0_23_0.ragebot.force_shot.enabled:get() and slot_0_23_0.ragebot.force_shot.show_indicator:get() then
		slot_0_78_0(color(255, 255, 255, 200), "SHOT")
	end

	if slot_546_4_0 and slot_0_73_0:get("Fake Latency") then
		slot_546_12_3 = utils.net_channel()

		if slot_546_12_3 ~= nil then
			slot_546_13_2 = nil
			slot_546_14_2 = slot_0_74_0(slot_0_72_0)
			slot_546_15_2 = math.clamp(slot_546_12_3.latency[0] + slot_546_12_3.latency[1], 0.001, 0.2)
			slot_546_16_0 = math.clamp(slot_546_14_2 * 0.001 + slot_546_12_3.avg_latency[1], 0.001, 0.2)
			slot_546_17_0 = math.clamp(slot_546_15_2 / slot_546_16_0, 0, 1)

			if slot_546_17_0 < 0.5 then
				slot_546_13_2 = color(250, 234, 232, 255):lerp(color(213, 197, 84, 255), slot_546_17_0 * 2)
			else
				slot_546_13_2 = color(213, 197, 84, 255):lerp(color(143, 194, 21, 255), (slot_546_17_0 - 0.5) * 2)
			end

			slot_0_78_0(slot_546_13_2, "PING")
		end
	end

	if slot_546_10_0 and slot_0_73_0:get("Hide Shots") then
		slot_0_78_0(color(255, 255, 255, 200), "OSAA")
	end

	if slot_546_9_0 and slot_0_73_0:get("Double Tap") then
		slot_546_12_2 = color(255, 0, 50, 255)

		if rage.exploit:get() == 1 then
			slot_546_12_2 = color(255, 255, 255, 200)
		end

		slot_0_78_0(slot_546_12_2, "DT")
	end

	if slot_546_11_0 and slot_0_73_0:get("Dormant Aimbot") then
		slot_0_78_0(color(255, 255, 255, 200), "DA")
	end

	if slot_546_5_0 and slot_0_73_0:get("Fake Duck") then
		slot_0_78_0(color(255, 255, 255, 200), "DUCK")
	end

	if slot_546_8_0 and slot_0_73_0:get("Safe Points") then
		slot_0_78_0(color(255, 255, 255, 200), "SAFE")
	end

	if slot_546_7_0 and slot_0_73_0:get("Body Aim") then
		slot_0_78_0(color(255, 255, 255, 200), "BODY")
	end

	if slot_546_1_0 and slot_0_73_0:get("Damage Override") then
		slot_0_78_0(color(255, 255, 255, 200), "MD")
	end

	if slot_546_2_0 and slot_0_73_0:get("Hitchance Override") then
		slot_0_78_0(color(255, 255, 255, 200), "HITCHANCE OVR")
	end

	if slot_546_3_0 and slot_0_73_0:get("Hitbox Override") then
		slot_0_78_0(color(255, 255, 255, 200), "HITBOX OVR")
	end

	if slot_546_6_0 and slot_0_73_0:get("Freestanding") then
		slot_0_78_0(color(255, 255, 255, 200), "FS")
	end

	if not slot_0_24_0.is_onground and slot_0_73_0:get("Lag Compensation") then
		slot_546_12_1 = 255
		slot_546_13_1 = 0
		slot_546_14_1 = 50
		slot_546_15_1 = 255

		if slot_0_25_0.defensive_ticks > 0 or slot_0_25_0.teleport_units_sqr > 4096 then
			slot_546_12_1, slot_546_13_1, slot_546_14_1, slot_546_15_1 = 255, 255, 255, 200
		end

		slot_0_78_0(color(slot_546_12_1, slot_546_13_1, slot_546_14_1, slot_546_15_1), "LC")
	end

	if slot_0_73_0:get("Fake Angles") then
		slot_546_12_0 = rage.antiaim:get_max_desync()
		slot_546_13_0 = color(196, 15, 15)
		slot_546_14_0 = color(132, 196, 20)
		slot_546_15_0 = slot_546_13_0:lerp(slot_546_14_0, slot_546_12_0 / 58)

		slot_0_78_0(slot_546_15_0, "FAKE")
	end

	if slot_0_73_0:get("Hit/Miss") then
		slot_0_78_0(color(255, 255, 255, 200), slot_0_59_5 .. "%")
	end
end

function slot_0_82_0(arg_547_0, arg_547_1)
	local var_547_0 = arg_547_1:get_player_weapon()

	if var_547_0 == nil then
		return
	end

	if not var_547_0.m_bStartedArming then
		return
	end

	local var_547_1 = var_547_0.m_fArmedTime

	if var_547_1 == nil then
		return
	end

	local var_547_2 = arg_547_1:get_origin()
	local var_547_3 = arg_547_0.m_bombsiteCenterA
	local var_547_4 = arg_547_0.m_bombsiteCenterB
	local var_547_5 = var_547_2:distsqr(var_547_3) < var_547_2:distsqr(var_547_4) and "A" or "B"
	local var_547_6 = (var_547_1 - globals.curtime) / 3

	slot_0_77_0({
		text = var_547_5,
		color = color(252, 243, 105, 255),
		progress = 1 - var_547_6,
		draw_cmd = slot_0_57_6.bomb_c4
	})
end

function slot_0_83_0(arg_548_0, arg_548_1)
	local var_548_0 = arg_548_1.m_bBombDefused

	if not arg_548_1.m_bBombTicking or var_548_0 then
		return
	end

	local var_548_1 = globals.curtime
	local var_548_2 = arg_548_1.m_flC4Blow
	local var_548_3 = var_548_2 - var_548_1

	if var_548_3 > 0 then
		if arg_548_1.m_hBombDefuser ~= nil then
			local var_548_4 = slot_0_15_0.screen_size()
			local var_548_5 = arg_548_1.m_flDefuseCountDown
			local var_548_6 = (var_548_5 - var_548_1) / 10
			local var_548_7 = var_548_2 < var_548_5 and color(235, 50, 75, 125) or color(50, 235, 75, 125)
			local var_548_8 = (var_548_4.y - 2) * (1 - var_548_6)

			slot_0_15_0.rect(vector(0, 0), vector(20, var_548_4.y), color(0, 0, 0, 115))
			slot_0_15_0.rect(vector(1, 1 + var_548_8), vector(19, var_548_4.y - 1), var_548_7)
		end

		local var_548_9 = string.format("%s - %.1fs", arg_548_1.m_nBombSite == 1 and "B" or "A", var_548_3)

		slot_0_77_0({
			text = var_548_9,
			color = color(255, 255, 255, 200),
			draw_cmd = slot_0_57_6.bomb_c4
		})
	end

	local var_548_10 = arg_548_0.m_iHealth
	local var_548_11 = slot_0_80_0(arg_548_0, arg_548_1)
	local var_548_12 = math.floor(var_548_11)

	if var_548_10 <= var_548_12 then
		slot_0_78_0(color(255, 0, 50, 255), "FATAL")
	elseif var_548_12 > 0 then
		slot_0_78_0(color(252, 243, 105, 255), string.format("-%d HP", var_548_12))
	end
end

function slot_0_84_0(arg_549_0)
	local var_549_0 = entity.get_game_rules()

	if var_549_0 == nil then
		return
	end

	local var_549_1 = entity.get_player_resource()

	if var_549_1 == nil then
		return
	end

	local var_549_2 = var_549_0.m_bBombPlanted
	local var_549_3 = var_549_1.m_iPlayerC4

	if var_549_3 ~= nil and var_549_3 ~= 0 then
		local var_549_4 = entity.get(var_549_3)

		if var_549_4 ~= nil then
			slot_0_82_0(var_549_1, var_549_4)
		end
	end

	if var_549_2 then
		local var_549_5 = entity.get_entities("CPlantedC4")[1]

		if var_549_5 ~= nil then
			slot_0_83_0(arg_549_0, var_549_5)
		end
	end
end

function slot_0_85_0()
	local var_550_0 = entity.get_local_player()

	if var_550_0 == nil then
		return
	end

	if var_550_0:is_alive() then
		slot_0_81_0(var_550_0)
	end

	if slot_0_73_0:get("Bomb Info") then
		slot_0_84_0(var_550_0)
	end
end

function slot_0_86_0(arg_551_0, arg_551_1)
	local var_551_0 = (arg_551_0 + arg_551_1) / 2
	local var_551_1 = color(0, 0, 0, 0)
	local var_551_2 = color(0, 0, 0, 50)

	slot_0_15_0.gradient(arg_551_0, vector(var_551_0.x, arg_551_1.y), var_551_1, var_551_2, var_551_1, var_551_2)
	slot_0_15_0.gradient(arg_551_1, vector(var_551_0.x, arg_551_0.y), var_551_1, var_551_2, var_551_1, var_551_2)
end

function slot_0_87_0(arg_552_0, arg_552_1, arg_552_2, arg_552_3, arg_552_4, arg_552_5)
	slot_0_15_0.circle_outline(arg_552_0, color(0, 0, 0, 255), arg_552_2, arg_552_3, 1, arg_552_5)
	slot_0_15_0.circle_outline(arg_552_0, arg_552_1, arg_552_2 - 1, arg_552_3, arg_552_4, arg_552_5 - 2)
end

function slot_0_88_0()
	for iter_553_0 = 1, #slot_0_58_5 do
		local var_553_0 = slot_0_58_5[iter_553_0]

		if var_553_0.color == nil then
			-- block empty
		else
			local var_553_1 = vector(slot_0_53_7, var_553_0.offset)
			local var_553_2 = var_553_1 + vector(slot_0_51_10, slot_0_52_8)
			local var_553_3 = var_553_0.text_size + vector(50)
			local var_553_4 = var_553_0.color
			local var_553_5 = var_553_0.draw_cmd
			local var_553_6 = var_553_0.progress

			var_553_2.y = var_553_2.y + 2

			if var_553_5 ~= nil then
				var_553_3.x = var_553_3.x + var_553_5.size.x + 5
			end

			if var_553_6 ~= nil then
				var_553_3.x = var_553_3.x + 30
			end

			slot_0_86_0(var_553_1, var_553_1 + var_553_3)

			if var_553_5 ~= nil then
				local var_553_7 = var_553_1:clone()

				var_553_7.x = var_553_7.x + slot_0_51_10
				var_553_7.y = var_553_7.y + (var_553_3.y - var_553_5.size.y) / 2

				var_553_5:draw(var_553_7, var_553_4, "f")

				var_553_2.x = var_553_2.x + var_553_5.size.x + 5
			end

			slot_0_15_0.text(slot_0_54_8, var_553_2 + 1, color(0, 0, 0, 128), "", var_553_0.text)
			slot_0_15_0.text(slot_0_54_8, var_553_2, var_553_4, "", var_553_0.text)

			var_553_2.x = var_553_2.x + var_553_0.text_size.x

			if var_553_6 ~= nil then
				local var_553_8 = 10
				local var_553_9 = var_553_2.x + var_553_8 / 2 + 12
				local var_553_10 = var_553_1.y + var_553_3.y / 2
				local var_553_11 = vector(var_553_9, var_553_10)
				local var_553_12 = color(255, 255, 255, 200)

				slot_0_87_0(var_553_11, var_553_12, 10, 0, var_553_6, 5)
			end
		end
	end
end

function slot_0_89_0()
	local var_554_0 = entity.get_local_player()

	if var_554_0 == nil then
		return
	end

	local var_554_1 = var_554_0:get_spectators()

	if var_554_1 == nil then
		return
	end

	local var_554_2 = slot_0_15_0.screen_size()
	local var_554_3 = vector(var_554_2.x - 10, 5)

	for iter_554_0 = 1, #var_554_1 do
		local var_554_4 = var_554_1[iter_554_0]:get_name()
		local var_554_5 = color(255, 255, 255, 200)

		slot_0_15_0.text(1, var_554_3, var_554_5, "r", var_554_4)

		var_554_3.y = var_554_3.y + 18
	end
end

function slot_0_90_0()
	if globals.is_in_game then
		slot_0_85_0()
		slot_0_88_0()
	end

	slot_0_76_0()
end

function slot_0_91_0(arg_556_0)
	if arg_556_0.state == "death" or arg_556_0.state == "player death" or arg_556_0.state == "unregistered shot" then
		return
	end

	slot_0_61_1 = slot_0_61_1 + 1

	if arg_556_0.state == nil then
		slot_0_60_1 = slot_0_60_1 + 1
	end

	slot_0_59_5 = math.floor(slot_0_60_1 / math.max(1, slot_0_61_1) * 100)
end

function slot_0_92_0(arg_557_0)
	events.render(slot_0_90_0, arg_557_0)
	events.aim_ack(slot_0_91_0, arg_557_0)
end

slot_0_93_0 = nil

function slot_0_94_0(arg_558_0)
	events.render(slot_0_89_0, arg_558_0:get())
end

function slot_0_95_0(arg_559_0)
	local var_559_0 = arg_559_0:get()

	if not var_559_0 then
		events.render(slot_0_89_0, false)
	end

	if var_559_0 then
		slot_0_48_8.spectator_list:set_callback(slot_0_94_0, true)
	else
		slot_0_48_8.spectator_list:unset_callback(slot_0_94_0)
	end

	slot_0_92_0(var_559_0)
end

slot_0_48_8.enabled:set_callback(slot_0_95_0, true)

slot_0_48_7 = nil
slot_0_49_9 = slot_0_23_0.visuals.kibit_markers
slot_0_50_9 = {}

function slot_0_51_9()
	if not globals.is_in_game then
		return
	end

	local var_560_0 = globals.realtime

	for iter_560_0 = #slot_0_50_9, 1, -1 do
		if var_560_0 > slot_0_50_9[iter_560_0].time then
			table.remove(slot_0_50_9, iter_560_0)
		end
	end

	for iter_560_1 = 1, #slot_0_50_9 do
		local var_560_1 = slot_0_50_9[iter_560_1]
		local var_560_2 = 1
		local var_560_3 = var_560_1.time - var_560_0

		if var_560_3 < 0.7 then
			var_560_2 = var_560_3 / 0.7
		end

		local var_560_4 = slot_0_15_0.world_to_screen(var_560_1.point)

		if var_560_4 == nil then
			-- block empty
		else
			local var_560_5 = 1
			local var_560_6 = 4 + var_560_5
			local var_560_7 = slot_0_49_9.color_x:get()
			local var_560_8 = slot_0_49_9.color_y:get()
			local var_560_9 = vector(var_560_4.x - var_560_5, var_560_4.y - var_560_6)
			local var_560_10 = vector(var_560_4.x + var_560_5, var_560_4.y + var_560_6)
			local var_560_11 = vector(var_560_4.x - var_560_6, var_560_4.y - var_560_5)
			local var_560_12 = vector(var_560_4.x + var_560_6, var_560_4.y + var_560_5)

			var_560_7.a = var_560_7.a * var_560_2
			var_560_8.a = var_560_8.a * var_560_2

			slot_0_15_0.rect(var_560_11, var_560_12, var_560_7)
			slot_0_15_0.rect(var_560_9, var_560_10, var_560_8)
		end
	end
end

function slot_0_52_7(arg_561_0)
	local var_561_0 = globals.realtime + slot_0_49_9.speed:get() / 10

	table.insert(slot_0_50_9, {
		time = var_561_0,
		point = arg_561_0.aim
	})
end

slot_0_53_6 = nil

function slot_0_54_7(arg_562_0)
	local var_562_0 = arg_562_0:get()

	if not var_562_0 then
		for iter_562_0 = 1, #slot_0_50_9 do
			slot_0_50_9[iter_562_0] = nil
		end
	end

	events.render(slot_0_51_9, var_562_0)
	events.aim_ack(slot_0_52_7, var_562_0)
end

slot_0_49_9.enabled:set_callback(slot_0_54_7, true)

slot_0_49_8 = nil
slot_0_50_8 = slot_0_23_0.visuals.static_watermark
slot_0_51_8 = slot_0_23_0.visuals.watermark
slot_0_52_6 = slot_0_23_0.visuals.indicators
slot_0_53_5 = slot_0_23_0.visuals.solus_ui
slot_0_54_6 = {}
slot_0_55_8 = 0

function slot_0_56_7()
	if slot_0_55_8 <= 0 then
		return
	end

	local var_563_0 = globals.frametime * 1.66

	slot_0_55_8 = math.max(0, slot_0_55_8 - var_563_0)
end

function slot_0_57_5()
	local var_564_0 = slot_0_15_0.screen_size()
	local var_564_1 = vector(var_564_0.x * 0.5, var_564_0.y - 18)
	local var_564_2 = 4
	local var_564_3 = ""
	local var_564_4 = slot_0_7_0.name
	local var_564_5 = slot_0_15_0.measure_text(var_564_2, var_564_3, var_564_4)
	local var_564_6 = color(255, 255, 255, 255)

	var_564_1.x = var_564_1.x - var_564_5.x * 0.5
	var_564_1.y = var_564_1.y - var_564_5.y

	slot_0_15_0.text(var_564_2, var_564_1, var_564_6, var_564_3, var_564_4)

	if slot_0_55_8 > 0 then
		local var_564_7 = ""
		local var_564_8 = 5
		local var_564_9 = "¨˜”*°•"
		local var_564_10 = "•°*”˜¨"
		local var_564_11 = slot_0_15_0.measure_text(var_564_2, var_564_7, var_564_9)
		local var_564_12 = vector(var_564_1.x - var_564_11.x - var_564_8, var_564_1.y)
		local var_564_13 = vector(var_564_1.x + var_564_5.x + var_564_8, var_564_1.y)
		local var_564_14 = var_564_6:clone()

		var_564_14.a = var_564_14.a * slot_0_55_8

		slot_0_15_0.text(var_564_2, var_564_12, var_564_14, var_564_7, var_564_9)
		slot_0_15_0.text(var_564_2, var_564_13, var_564_14, var_564_7, var_564_10)
	end
end

function slot_0_54_6.on_render()
	slot_0_56_7()
	slot_0_57_5()
end

function slot_0_54_6.on_player_death(arg_566_0)
	local var_566_0 = entity.get_local_player()
	local var_566_1 = entity.get(arg_566_0.userid, true)

	if entity.get(arg_566_0.attacker, true) ~= var_566_0 or var_566_1 == var_566_0 then
		return
	end

	slot_0_55_8 = 1
end

slot_0_55_7 = {}
slot_0_56_6 = 4

function slot_0_57_4(arg_567_0, arg_567_1)
	return arg_567_0:gsub(".", "%1" .. arg_567_1, #arg_567_0 - 1)
end

function slot_0_58_4()
	local var_568_0 = ""
	local var_568_1 = "ANGEL"
	local var_568_2 = "WINGS"

	if not slot_0_50_8.remove_spaces:get() then
		var_568_0 = " "
		var_568_1 = slot_0_57_4(var_568_1, var_568_0)
		var_568_2 = slot_0_57_4(var_568_2, var_568_0)
	end

	local var_568_3 = slot_0_18_0.gradient(var_568_2, -globals.realtime, color(255, 255, 255, 255), color(55, 55, 55, 255))

	return var_568_1 .. var_568_0 .. var_568_3
end

function slot_0_59_4()
	return string.format("[%s]", slot_0_7_0.build:upper())
end

function slot_0_55_7.on_render()
	local var_570_0 = 1
	local var_570_1 = ""
	local var_570_2 = slot_0_15_0.screen_size()
	local var_570_3 = slot_0_50_8.color:get()
	local var_570_4 = slot_0_50_8.position:get()
	local var_570_5 = slot_0_58_4()
	local var_570_6 = slot_0_59_4()
	local var_570_7 = slot_0_15_0.measure_text(var_570_0, var_570_1, var_570_5)
	local var_570_8 = slot_0_15_0.measure_text(var_570_0, var_570_1, var_570_6)

	if var_570_4 == "Bottom" then
		local var_570_9 = vector(var_570_2.x * 0.5, var_570_2.y - 14)
		local var_570_10 = var_570_9 - vector(var_570_7.x * 0.5, var_570_7.y)

		var_570_9.y = var_570_9.y - var_570_7.y
		var_570_9.y = var_570_9.y - slot_0_56_6

		local var_570_11 = var_570_9 - vector(var_570_8.x * 0.5, var_570_8.y)

		slot_0_15_0.text(var_570_0, var_570_10, var_570_3, var_570_1, var_570_5)
		slot_0_15_0.text(var_570_0, var_570_11, color(200, 69, 69), var_570_1, var_570_6)

		return
	end

	local var_570_12 = vector(20, var_570_2.y * 0.5)
	local var_570_13 = var_570_7.x + var_570_8.x + slot_0_56_6
	local var_570_14 = math.max(var_570_7.y, var_570_8.y)

	if var_570_4 == "Right" then
		var_570_12.x = var_570_2.x - var_570_12.x
		var_570_12.x = var_570_12.x - var_570_13 + 1
	end

	var_570_12.y = var_570_12.y - var_570_14 * 0.5

	local var_570_15 = var_570_12:clone()
	local var_570_16 = var_570_12:clone()

	var_570_16.x = var_570_16.x + var_570_7.x
	var_570_16.x = var_570_16.x + slot_0_56_6

	slot_0_15_0.text(var_570_0, var_570_15, var_570_3, var_570_1, var_570_5)
	slot_0_15_0.text(var_570_0, var_570_16, color(200, 69, 69), var_570_1, var_570_6)
end

function slot_0_56_5(arg_571_0)
	local var_571_0 = arg_571_0 == 1
	local var_571_1 = arg_571_0 == 2

	events.render(slot_0_54_6.on_render, var_571_0)
	events.render(slot_0_55_7.on_render, var_571_1)
	events.player_death(slot_0_54_6.on_player_death, var_571_0)
end

slot_0_57_3 = nil

function slot_0_58_3(arg_572_0)
	local var_572_0 = arg_572_0:get()
	local var_572_1 = var_572_0 == 2

	slot_0_50_8.remove_spaces:visibility(var_572_1)
	slot_0_50_8.position:visibility(var_572_1)
	slot_0_50_8.color:visibility(var_572_1)
	slot_0_56_5(var_572_0)
end

function slot_0_59_3()
	local var_573_0 = slot_0_51_8.enabled:get() or slot_0_52_6.enabled:get()
	local var_573_1 = slot_0_53_5.enabled:get() and slot_0_53_5.select:get("Watermark")
	local var_573_2 = var_573_0 or var_573_1

	if var_573_2 then
		slot_0_56_5(nil)
	end

	if not var_573_2 then
		slot_0_50_8.style:set_callback(slot_0_58_3, true)
	else
		slot_0_50_8.style:unset_callback(slot_0_58_3)
	end
end

slot_0_52_6.enabled:set_callback(slot_0_59_3)
slot_0_51_8.enabled:set_callback(slot_0_59_3)
slot_0_53_5.enabled:set_callback(slot_0_59_3)
slot_0_53_5.select:set_callback(slot_0_59_3)
slot_0_59_3()

slot_0_36_0 = nil
slot_0_37_1 = nil
slot_0_38_2 = slot_0_23_0.misc.clantag
slot_0_39_2 = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag")
slot_0_40_3 = 0
slot_0_41_4 = {
	"",
	"a",
	"an",
	"ang",
	"ange",
	"angel",
	"angelw",
	"angelwi",
	"angelwin",
	"angelwing",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"angelwings",
	"ngelwings",
	"gelwings",
	"elwings",
	"lwings",
	"wings",
	"ings",
	"ngs",
	"gs",
	"s",
	""
}

function slot_0_42_7()
	return slot_0_6_0(globals.curtime * 4)
end

function slot_0_43_8()
	if not globals.is_in_game then
		return
	end

	local var_575_0 = slot_0_42_7() % #slot_0_41_4 + 1

	if slot_0_40_3 ~= var_575_0 then
		slot_0_40_3 = var_575_0

		common.set_clan_tag(slot_0_41_4[var_575_0] or "")
	end
end

slot_0_44_7 = nil

function slot_0_45_6(arg_576_0)
	local var_576_0 = arg_576_0:get()

	if not var_576_0 then
		common.set_clan_tag("")
	end

	local var_576_1 = slot_0_39_2
	local var_576_2 = var_576_1
	local var_576_3 = var_576_1.override

	if var_576_0 then
		-- block empty
	end

	var_576_3(var_576_2, nil)
	events.net_update_end(slot_0_43_8, var_576_0)
end

slot_0_38_2.enabled:set_callback(slot_0_45_6, true)

slot_0_38_1 = nil
slot_0_39_1 = slot_0_23_0.misc.trashtalk
slot_0_40_2 = 0
slot_0_41_3 = {}
slot_0_42_6 = "https://cdn.hysteria.one/angelwings/trashtalk.txt"

function slot_0_43_7(arg_577_0)
	if not arg_577_0 or string.find(arg_577_0, "404") then
		return
	end

	local var_577_0 = 0

	for iter_577_0 in string.gmatch(arg_577_0, "(.-)\n") do
		var_577_0 = var_577_0 + 1
		slot_0_41_3[var_577_0] = iter_577_0
	end
end

network.get(slot_0_42_6, nil, slot_0_43_7)

function slot_0_42_5(arg_578_0)
	local var_578_0 = entity.get_local_player()
	local var_578_1 = entity.get(arg_578_0.userid, true)

	if entity.get(arg_578_0.attacker, true) ~= var_578_0 or var_578_1 == var_578_0 then
		return
	end

	local var_578_2 = #slot_0_41_3
	local var_578_3 = math.random(1, var_578_2)

	if var_578_3 == slot_0_40_2 then
		var_578_3 = var_578_3 + 1

		if var_578_3 == var_578_2 then
			var_578_3 = 1
		end
	end

	utils.console_exec("say " .. slot_0_41_3[var_578_3])

	slot_0_40_2 = var_578_3
end

slot_0_43_6 = nil

function slot_0_44_6(arg_579_0)
	events.player_death(slot_0_42_5, arg_579_0:get())
end

slot_0_39_1.enabled:set_callback(slot_0_44_6, true)

slot_0_39_0 = nil
slot_0_40_1 = slot_0_23_0.misc.fast_ladder
slot_0_41_2 = 9

function slot_0_42_4(arg_580_0)
	local var_580_0 = arg_580_0:get_weapon_info()

	if var_580_0 == nil or var_580_0.weapon_type ~= 9 then
		return false
	end

	local var_580_1 = arg_580_0.m_fThrowTime

	if var_580_1 == nil or var_580_1 == 0 then
		return false
	end

	return true
end

function slot_0_43_5(arg_581_0)
	local var_581_0 = entity.get_local_player()

	if var_581_0 == nil then
		return
	end

	if var_581_0.m_MoveType ~= slot_0_41_2 then
		return
	end

	local var_581_1 = var_581_0:get_player_weapon()

	if var_581_1 == nil or slot_0_42_4(var_581_1) then
		return
	end

	arg_581_0.view_angles.y = slot_0_6_0(arg_581_0.view_angles.y)
	arg_581_0.view_angles.z = 0

	local var_581_2 = var_581_0.m_vecLadderNormal

	if var_581_2:lengthsqr() == 0 then
		return
	end

	local var_581_3 = slot_0_15_0.camera_angles()
	local var_581_4 = var_581_2:angles()
	local var_581_5 = var_581_4.y - var_581_3.y + 180
	local var_581_6 = var_581_4.x - var_581_3.x
	local var_581_7 = math.normalize_yaw(var_581_5)
	local var_581_8 = math.clamp(var_581_6, -89, 89)
	local var_581_9 = math.abs(var_581_7)
	local var_581_10 = 89
	local var_581_11 = -90
	local var_581_12 = var_581_8 < -45
	local var_581_13 = var_581_7 > 0
	local var_581_14 = arg_581_0.sidemove > 0
	local var_581_15 = arg_581_0.forwardmove > 0

	if var_581_9 > 70 and var_581_9 < 135 then
		if arg_581_0.forwardmove ~= 0 or arg_581_0.sidemove == 0 then
			return
		end

		if not var_581_13 then
			var_581_11 = -var_581_11
		end

		if var_581_13 then
			var_581_14 = not var_581_14
		end

		arg_581_0.in_back = var_581_14
		arg_581_0.in_forward = not var_581_14

		if var_581_13 then
			var_581_14 = not var_581_14
		end

		arg_581_0.in_moveleft = var_581_14
		arg_581_0.in_moveright = not var_581_14
		arg_581_0.view_angles.x = var_581_10
		arg_581_0.view_angles.y = math.normalize_yaw(var_581_4.y + var_581_11)

		return
	end

	if arg_581_0.sidemove ~= 0 or arg_581_0.forwardmove == 0 then
		return
	end

	if not var_581_13 then
		var_581_11 = -var_581_11
	end

	if not var_581_12 then
		var_581_15 = not var_581_15
	end

	arg_581_0.in_back = not var_581_15
	arg_581_0.in_forward = var_581_15

	if not var_581_13 then
		var_581_15 = not var_581_15
	end

	arg_581_0.in_moveleft = var_581_15
	arg_581_0.in_moveright = not var_581_15
	arg_581_0.view_angles.x = var_581_10
	arg_581_0.view_angles.y = math.normalize_yaw(var_581_4.y + var_581_11)
end

slot_0_44_5 = nil

function slot_0_45_5(arg_582_0)
	events.createmove(slot_0_43_5, arg_582_0:get())
end

slot_0_40_1.enabled:set_callback(slot_0_45_5, true)

slot_0_40_0 = nil
slot_0_41_1 = slot_0_23_0.misc.edge_stop

function slot_0_42_3(arg_583_0)
	local var_583_0 = entity.get_local_player()

	if var_583_0 == nil then
		return
	end

	local var_583_1 = var_583_0:simulate_movement()

	var_583_1:think(5)

	if var_583_1.velocity.z < 0 then
		arg_583_0.block_movement = 2
	end
end

slot_0_43_4 = nil

function slot_0_44_4(arg_584_0)
	events.createmove(slot_0_42_3, arg_584_0:get())
end

slot_0_41_1.enabled:set_callback(slot_0_44_4, true)

slot_0_41_0 = nil
slot_0_42_2 = slot_0_23_0.misc.collision_air_duck

function slot_0_43_3(arg_585_0)
	local var_585_0 = entity.get_local_player()

	if var_585_0 == nil then
		return
	end

	local var_585_1 = var_585_0.m_fFlags

	if bit.band(var_585_1, 1) ~= 0 then
		return
	end

	if arg_585_0.in_duck then
		return
	end

	local var_585_2 = false
	local var_585_3 = var_585_0:simulate_movement()

	arg_585_0.in_duck = true

	var_585_3:think(1)

	local var_585_4 = bit.band(var_585_3.flags, 1) == 0 and var_585_3.did_hit_collision
	local var_585_5 = false
	local var_585_6 = var_585_0:simulate_movement()

	arg_585_0.in_duck = false

	var_585_6:think(1)

	local var_585_7 = bit.band(var_585_6.flags, 1) == 0 and var_585_6.did_hit_collision

	if not var_585_4 and var_585_7 then
		arg_585_0.in_duck = true
	end
end

slot_0_44_3 = nil

function slot_0_45_4(arg_586_0)
	events.createmove(slot_0_43_3, arg_586_0:get())
end

slot_0_42_2.enabled:set_callback(slot_0_45_4, true)

slot_0_42_1 = nil
slot_0_43_2 = slot_0_23_0.misc.no_fall_damage
slot_0_44_2 = false

function slot_0_45_3(arg_587_0, arg_587_1)
	local var_587_0 = arg_587_0:get_origin()

	for iter_587_0 = 0, math.pi * 2, math.pi * 2 / 8 do
		local var_587_1 = math.sin(iter_587_0)
		local var_587_2 = math.cos(iter_587_0)
		local var_587_3 = var_587_0 + vector(10 * var_587_2, 10 * var_587_1, 0)
		local var_587_4 = var_587_3 - vector(0, 0, arg_587_1)

		if utils.trace_line(var_587_3, var_587_4, arg_587_0).fraction ~= 1 then
			return true
		end
	end

	return false
end

function slot_0_46_4(arg_588_0)
	local var_588_0 = entity.get_local_player()

	if var_588_0 == nil then
		return
	end

	if var_588_0.m_vecVelocity.z >= -500 then
		slot_0_44_2 = false
	elseif slot_0_45_3(var_588_0, 15) then
		slot_0_44_2 = false
	elseif slot_0_45_3(var_588_0, 75) then
		slot_0_44_2 = true
	end

	if var_588_0.m_vecVelocity.z < -500 then
		arg_588_0.in_duck = slot_0_44_2
	end
end

slot_0_47_5 = nil

function slot_0_48_6(arg_589_0)
	events.createmove(slot_0_46_4, arg_589_0:get())
end

slot_0_43_2.enabled:set_callback(slot_0_48_6, true)

slot_0_43_1 = nil
slot_0_44_1 = slot_0_23_0.misc.super_toss
slot_0_45_2 = 0.3

function slot_0_46_3(arg_590_0, arg_590_1, arg_590_2)
	if math.abs(arg_590_0.x) > math.abs(arg_590_0.y) then
		local var_590_0 = arg_590_0.y / arg_590_0.x
		local var_590_1 = 1 + var_590_0 * var_590_0
		local var_590_2 = -2 * arg_590_1.x - 2 * var_590_0 * arg_590_1.y
		local var_590_3 = arg_590_1:length2dsqr() - arg_590_2 * arg_590_2
		local var_590_4 = var_590_2 * var_590_2 - 4 * var_590_1 * var_590_3

		if var_590_4 < 0 then
			return arg_590_1 + (arg_590_0 * arg_590_1:dot(arg_590_0) - arg_590_1):normalized() * arg_590_2
		elseif var_590_4 < 0.001 then
			local var_590_5 = -var_590_2 / (2 * var_590_1)
			local var_590_6 = var_590_0 * var_590_5

			return vector(var_590_5, var_590_6)
		end

		local var_590_7 = math.sqrt(var_590_4)
		local var_590_8 = (-var_590_2 + var_590_7) / (2 * var_590_1)
		local var_590_9 = var_590_0 * var_590_8
		local var_590_10 = vector(var_590_8, var_590_9)
		local var_590_11 = (-var_590_2 - var_590_7) / (2 * var_590_1)
		local var_590_12 = var_590_0 * var_590_11
		local var_590_13 = vector(var_590_11, var_590_12)

		if arg_590_0:dot(var_590_10) > arg_590_0:dot(var_590_13) then
			return var_590_10
		end

		return var_590_13
	else
		local var_590_14 = arg_590_0.x / arg_590_0.y
		local var_590_15 = 1 + var_590_14 * var_590_14
		local var_590_16 = -2 * arg_590_1.y - 2 * var_590_14 * arg_590_1.x
		local var_590_17 = arg_590_1:length2dsqr() - arg_590_2 * arg_590_2
		local var_590_18 = var_590_16 * var_590_16 - 4 * var_590_15 * var_590_17

		if var_590_18 < 0 then
			return arg_590_1 + (arg_590_0 * arg_590_1:dot(arg_590_0) - arg_590_1):normalized() * arg_590_2
		elseif var_590_18 < 0.001 then
			local var_590_19 = -var_590_16 / (2 * var_590_15)
			local var_590_20 = var_590_14 * var_590_19

			return vector(var_590_20, var_590_19)
		end

		local var_590_21 = math.sqrt(var_590_18)
		local var_590_22 = (-var_590_16 + var_590_21) / (2 * var_590_15)
		local var_590_23 = var_590_14 * var_590_22
		local var_590_24 = vector(var_590_23, var_590_22)
		local var_590_25 = (-var_590_16 - var_590_21) / (2 * var_590_15)
		local var_590_26 = var_590_14 * var_590_25
		local var_590_27 = vector(var_590_26, var_590_25)

		if arg_590_0:dot(var_590_24) > arg_590_0:dot(var_590_27) then
			return var_590_24
		end

		return var_590_27
	end
end

function slot_0_47_4(arg_591_0, arg_591_1, arg_591_2, arg_591_3)
	local var_591_0 = vector():angles(arg_591_0)
	local var_591_1 = vector():angles(arg_591_0.x - (90 - math.abs(arg_591_0.x)) * 10 / 90, arg_591_0.y)
	local var_591_2 = var_591_1:dot(var_591_0) / var_591_0:length()
	local var_591_3 = math.clamp(arg_591_2 * 0.9, 15, 750)
	local var_591_4 = math.clamp(arg_591_3, 0, 1)
	local var_591_5 = var_591_3 * slot_0_8_0.lerp(slot_0_45_2, 1, var_591_4)

	arg_591_0.y = (slot_0_46_3(var_591_1, arg_591_1 * 1.25, var_591_5 * var_591_2) - arg_591_1 * 1.25):angles().y
	arg_591_0.x = math.clamp(arg_591_0.x + math.clamp(arg_591_1.z * 0.1, -20, 20), -89, 89)
end

function slot_0_48_5(arg_592_0, arg_592_1)
	local var_592_0 = math.rad(arg_592_1)
	local var_592_1 = math.cos(var_592_0)
	local var_592_2 = math.sin(var_592_0)
	local var_592_3 = var_592_1 * arg_592_0.forwardmove + var_592_2 * arg_592_0.sidemove

	arg_592_0.sidemove, arg_592_0.forwardmove = var_592_2 * arg_592_0.forwardmove + var_592_1 * arg_592_0.sidemove, var_592_3
end

function slot_0_49_7(arg_593_0)
	local var_593_0 = entity.get_local_player()

	if var_593_0 == nil then
		return
	end

	local var_593_1 = var_593_0:get_player_weapon()

	if var_593_1 == nil then
		return
	end

	local var_593_2 = var_593_1:get_weapon_info()

	if var_593_2 == nil or var_593_2.weapon_type ~= 9 then
		return
	end

	if var_593_1.m_fThrowTime == 0 then
		return
	end

	if var_593_0.m_nTickBase * globals.tickinterval < var_593_1.m_fThrowTime and rage.exploit:get() ~= 1 then
		return
	end

	local var_593_3 = arg_593_0.view_angles
	local var_593_4 = var_593_3.y
	local var_593_5 = slot_0_15_0.camera_angles()

	if var_593_5.x ~= var_593_3.x or var_593_5.y ~= var_593_3.y then
		return
	end

	slot_0_47_4(var_593_3, var_593_0.m_vecVelocity, var_593_2.throw_velocity, var_593_1.m_flThrowStrength)
	slot_0_48_5(arg_593_0, math.normalize_yaw(var_593_4 - var_593_3.y))
end

function slot_0_50_7(arg_594_0)
	local var_594_0 = entity.get_local_player()

	if var_594_0 == nil then
		return
	end

	local var_594_1 = var_594_0:get_player_weapon()

	if var_594_1 == nil then
		return
	end

	local var_594_2 = var_594_1:get_weapon_info()

	if var_594_2 ~= nil and var_594_2.weapon_type == 9 then
		slot_0_47_4(arg_594_0.angles, arg_594_0.velocity, var_594_2.throw_velocity, var_594_1.m_flThrowStrength)
	end
end

slot_0_51_7 = nil

function slot_0_52_5(arg_595_0)
	local var_595_0 = arg_595_0:get()

	events.createmove(slot_0_49_7, var_595_0)
	events.grenade_override_view(slot_0_50_7, var_595_0)
end

slot_0_44_1.enabled:set_callback(slot_0_52_5, true)

slot_0_44_0 = nil
slot_0_45_1 = slot_0_23_0.misc.grenade_release
slot_0_46_2 = nil

function slot_0_47_3(arg_596_0, arg_596_1)
	if arg_596_0 == nil or arg_596_1 == nil then
		return false
	end

	if arg_596_0:get_weapon_index() == 45 then
		return arg_596_1 > 0
	end

	return arg_596_1 >= slot_0_45_1.damage:get()
end

function slot_0_48_4(arg_597_0)
	local var_597_0 = entity.get_local_player()

	if var_597_0 == nil then
		return
	end

	local var_597_1 = var_597_0:get_player_weapon()

	if var_597_1 == nil then
		return
	end

	if not var_597_1.m_bPinPulled then
		return
	end

	if var_597_1.m_flThrowStrength <= 0 then
		return
	end

	if slot_0_47_3(var_597_1, slot_0_46_2) then
		arg_597_0.in_attack = false
		arg_597_0.in_attack2 = false
	end

	slot_0_46_2 = nil
end

function slot_0_49_6(arg_598_0)
	slot_0_46_2 = arg_598_0.damage
end

slot_0_50_6 = nil

function slot_0_51_6(arg_599_0)
	local var_599_0 = arg_599_0:get()

	events.createmove(slot_0_48_4, var_599_0)
	events.grenade_prediction(slot_0_49_6, var_599_0)
end

slot_0_45_1.enabled:set_callback(slot_0_51_6, true)

slot_0_45_0 = nil
slot_0_46_1 = slot_0_23_0.misc.fps_optimize
slot_0_47_2 = false
slot_0_48_3 = {}

function slot_0_49_5(arg_600_0)
	assert(type(arg_600_0) == "table", "cmds must be a table")
	assert(type(arg_600_0.set) == "function", "set must be a function")
	assert(type(arg_600_0.unset) == "function", "unset must be a function")

	return {
		set = arg_600_0.set,
		unset = arg_600_0.unset
	}
end

function slot_0_50_5(arg_601_0, arg_601_1)
	assert(type(arg_601_0) == "userdata", "convar must be a userdata")
	assert(type(arg_601_1) == "number", "value must be a number")

	local var_601_0
	local var_601_1 = arg_601_1

	local function var_601_2()
		if var_601_0 == nil then
			var_601_0 = arg_601_0:int()

			arg_601_0:int(var_601_1)
		end
	end

	local function var_601_3()
		if var_601_0 ~= nil then
			arg_601_0:int(var_601_0)

			var_601_0 = nil
		end
	end

	return slot_0_49_5({
		set = var_601_2,
		unset = var_601_3
	})
end

function slot_0_51_5(arg_604_0)
	assert(type(arg_604_0) == "function", "fn must be a function")

	local var_604_0 = {}

	arg_604_0(var_604_0)

	return slot_0_49_5(var_604_0)
end

slot_0_48_3.Fog = {
	slot_0_50_5(cvar.fog_enable, 0),
	slot_0_50_5(cvar.fog_enable_water_fog, 0)
}
slot_0_48_3.Blood = {
	slot_0_50_5(cvar.violence_hblood, 0)
}
slot_0_48_3.Bloom = {
	slot_0_50_5(cvar.mat_disable_bloom, 1)
}
slot_0_48_3.Decals = {
	slot_0_50_5(cvar.r_drawdecals, 0)
}
slot_0_48_3.Shadows = {
	slot_0_50_5(cvar.r_shadows, 0),
	slot_0_50_5(cvar.cl_csm_static_prop_shadows, 0),
	slot_0_50_5(cvar.cl_csm_shadows, 0),
	slot_0_50_5(cvar.cl_csm_world_shadows, 0),
	slot_0_50_5(cvar.cl_foot_contact_shadows, 0),
	slot_0_50_5(cvar.cl_csm_viewmodel_shadows, 0),
	slot_0_50_5(cvar.cl_csm_rope_shadows, 0),
	slot_0_50_5(cvar.cl_csm_sprite_shadows, 0),
	slot_0_50_5(cvar.cl_csm_translucent_shadows, 0),
	slot_0_50_5(cvar.cl_csm_entity_shadows, 0),
	slot_0_50_5(cvar.cl_csm_world_shadows_in_viewmodelcascade, 0)
}
slot_0_48_3.Sprites = {
	slot_0_50_5(cvar.r_drawsprites, 0)
}
slot_0_48_3.Particles = {
	slot_0_50_5(cvar.r_drawparticles, 0)
}
slot_0_48_3.Ropes = {
	slot_0_50_5(cvar.r_drawropes, 0)
}
slot_0_48_3["Dynamic lights"] = {
	slot_0_50_5(cvar.mat_disable_fancy_blending, 1)
}
slot_0_48_3["Map details"] = {
	slot_0_50_5(cvar.func_break_max_pieces, 0),
	slot_0_50_5(cvar.props_break_max_pieces, 0)
}
slot_0_48_3["Weapon effects"] = {
	slot_0_50_5(cvar.muzzleflash_light, 0),
	slot_0_50_5(cvar.r_drawtracers_firstperson, 0)
}
slot_0_48_3.Teammates = {
	slot_0_51_5(function(arg_605_0)
		local function var_605_0(arg_606_0)
			local var_606_0 = entity.get_local_player()

			if var_606_0 == nil then
				return
			end

			local var_606_1 = var_606_0:is_alive()

			entity.get_players(false, true, function(arg_607_0)
				if arg_607_0 ~= var_606_0 and not arg_607_0:is_enemy() then
					if arg_606_0 or not var_606_1 then
						arg_607_0.m_nRenderMode = 0
					else
						arg_607_0.m_nRenderMode = 10
					end
				end
			end)
		end

		local function var_605_1()
			var_605_0(true)
		end

		local function var_605_2()
			var_605_0(false)
		end

		local function var_605_3()
			var_605_0(false)
			events.shutdown(var_605_1, true)
			events.net_update_end(var_605_2, true)
		end

		arg_605_0.unset, arg_605_0.set = function()
			var_605_0(true)
			events.shutdown(var_605_1, false)
			events.net_update_end(var_605_2, false)
		end, var_605_3
	end)
}

function slot_0_49_4()
	if slot_0_46_1.always_on:get() then
		return true
	end

	if slot_0_24_0.is_peeking and slot_0_46_1.detections:get("Peeking") then
		return true
	end

	if slot_0_24_0.is_vulnerable and slot_0_46_1.detections:get("Hit Flag") then
		return true
	end

	return false
end

function slot_0_50_4()
	if not slot_0_47_2 then
		return
	end

	for iter_613_0, iter_613_1 in pairs(slot_0_48_3) do
		for iter_613_2 = 1, #iter_613_1 do
			iter_613_1[iter_613_2]:unset()
		end
	end

	slot_0_47_2 = false
end

function slot_0_51_4()
	if slot_0_47_2 then
		return
	end

	local var_614_0 = slot_0_46_1.select:get()

	for iter_614_0 = 1, #var_614_0 do
		local var_614_1 = var_614_0[iter_614_0]
		local var_614_2 = slot_0_48_3[var_614_1]

		for iter_614_1 = 1, #var_614_2 do
			var_614_2[iter_614_1]:set()
		end
	end

	slot_0_47_2 = true
end

function slot_0_52_4()
	slot_0_50_4()
end

function slot_0_53_4()
	if not slot_0_49_4() then
		return slot_0_50_4()
	end

	slot_0_51_4()
end

slot_0_54_5 = nil

function slot_0_55_6(arg_617_0)
	slot_0_50_4()
	slot_0_51_4()
end

function slot_0_56_4(arg_618_0)
	local var_618_0 = arg_618_0:get()

	if var_618_0 then
		slot_0_46_1.select:set_callback(slot_0_55_6, true)
	else
		slot_0_46_1.select:unset_callback(slot_0_55_6)
	end

	if not var_618_0 then
		slot_0_50_4()
	end

	events.shutdown(slot_0_52_4, var_618_0)
	events.net_update_end(slot_0_53_4, var_618_0)
end

slot_0_46_1.enabled:set_callback(slot_0_56_4, true)

slot_0_46_0 = nil
slot_0_47_1 = slot_0_23_0.misc.ping_unlocker
slot_0_48_2 = ui.find("Miscellaneous", "Main", "Other", "Fake Latency")
slot_0_49_3 = cvar.sv_maxunlag

function slot_0_50_3()
	slot_0_48_2:override()
	slot_0_48_2:disabled(false)
	slot_0_49_3:float(tonumber(slot_0_49_3:string()), true)
end

function slot_0_51_3(arg_620_0)
	slot_0_48_2:override(arg_620_0)
	slot_0_48_2:disabled(true)
	slot_0_49_3:float(0.4, true)
end

function slot_0_52_3()
	slot_0_50_3()
end

slot_0_53_3 = nil

function slot_0_54_4(arg_622_0)
	slot_0_51_3(arg_622_0:get())
end

function slot_0_55_5(arg_623_0)
	local var_623_0 = arg_623_0:get()

	if not var_623_0 then
		slot_0_50_3()
	end

	if var_623_0 then
		slot_0_47_1.value:set_callback(slot_0_54_4, true)
	else
		slot_0_47_1.value:unset_callback(slot_0_54_4)
	end

	events.shutdown(slot_0_52_3, var_623_0)
end

slot_0_47_1.enabled:set_callback(slot_0_55_5, true)

slot_0_47_0 = nil
slot_0_48_1 = slot_0_23_0.misc.animation_breaker
slot_0_49_2 = 2
slot_0_50_2 = 6
slot_0_51_2 = 12
slot_0_52_2 = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
slot_0_53_2 = ffi.typeof("            struct {\n                float  m_flLayerAnimtime;\n                float  m_flLayerFadeOuttime;\n\n                // dispatch flags\n                void  *m_pDispatchedStudioHdr;\n                int    m_nDispatchedSrc;\n                int    m_nDispatchedDst;\n\n                int    m_nOrder;\n                int    m_nSequence;\n                float  m_flPrevCycle;\n                float  m_flWeight;\n                float  m_flWeightDeltaRate;\n\n                // used for automatic crossfades between sequence changes;\n                float  m_flPlaybackRate;\n                float  m_flCycle;\n                int    m_pOwner;\n                int    m_nInvalidatePhysicsBits;\n            } **\n        ")

function slot_0_54_3(arg_624_0)
	return ffi.cast(slot_0_53_2, ffi.cast("uintptr_t", arg_624_0[0]) + 10640)[0]
end

function slot_0_55_4(arg_625_0)
	if slot_0_24_0.is_onground then
		local var_625_0 = slot_0_48_1.ground_legs:get()

		if var_625_0 == "Static" then
			slot_0_52_2:override("Sliding")

			arg_625_0.m_flPoseParameter[0] = 0

			return
		end

		if var_625_0 == "Jitter" then
			local var_625_1 = globals.tickcount
			local var_625_2 = slot_0_48_1.legs_offset_1:get()
			local var_625_3 = slot_0_48_1.legs_offset_2:get()
			local var_625_4 = 1 / (var_625_1 % 8 >= 4 and 200 or 400)
			local var_625_5 = var_625_1 % 4 >= 2 and var_625_2 or var_625_3

			slot_0_52_2:override("Sliding")

			arg_625_0.m_flPoseParameter[0] = var_625_5 * var_625_4

			return
		end

		if var_625_0 == "Allah" then
			slot_0_52_2:override("Walking")

			arg_625_0.m_flPoseParameter[7] = 0

			return
		end

		if var_625_0 == "Kangaroo" then
			arg_625_0.m_flPoseParameter[3] = math.random()
			arg_625_0.m_flPoseParameter[6] = math.random()
			arg_625_0.m_flPoseParameter[7] = math.random()
		end
	end

	slot_0_52_2:override()
end

function slot_0_56_3(arg_626_0, arg_626_1)
	local var_626_0 = slot_0_48_1.air_legs:get()

	if var_626_0 == "Disabled" then
		return
	end

	if slot_0_24_0.is_onground then
		return
	end

	if var_626_0 == "Static" then
		arg_626_0.m_flPoseParameter[6] = 1

		return
	end

	if var_626_0 == "kangaroo" then
		arg_626_0.m_flPoseParameter[3] = math.random()
		arg_626_0.m_flPoseParameter[6] = math.random()
		arg_626_0.m_flPoseParameter[7] = math.random()

		return
	end

	if var_626_0 == "Haram" then
		if not slot_0_24_0.is_moving then
			return
		end

		local var_626_1 = arg_626_1[slot_0_50_2]

		if var_626_1 == nil then
			return
		end

		var_626_1.m_flWeight = 1

		return
	end
end

function slot_0_57_2(arg_627_0)
	local var_627_0 = slot_0_48_1.body_lean:get()

	if var_627_0 == -1 then
		return
	end

	local var_627_1 = arg_627_0[slot_0_51_2]

	if var_627_1 == nil then
		return
	end

	var_627_1.m_flWeight = var_627_0 * 0.1
end

function slot_0_58_2(arg_628_0, arg_628_1)
	if not slot_0_48_1.pitch_on_land:get() then
		return
	end

	if not slot_0_24_0.is_onground then
		return
	end

	if not arg_628_1.landing then
		return
	end

	arg_628_0.m_flPoseParameter[12] = 0.5
end

function slot_0_59_2(arg_629_0)
	local var_629_0 = entity.get_local_player()

	if var_629_0 == nil or arg_629_0 ~= var_629_0 then
		return
	end

	local var_629_1 = arg_629_0:get_anim_state()

	if var_629_1 == nil then
		return
	end

	local var_629_2 = slot_0_54_3(arg_629_0)

	if var_629_2 == nil then
		return
	end

	if var_629_0.m_MoveType == slot_0_49_2 then
		slot_0_55_4(var_629_0)
		slot_0_56_3(var_629_0, var_629_2)
		slot_0_58_2(var_629_0, var_629_1)
	end

	slot_0_57_2(var_629_2)
end

slot_0_60_0 = nil

function slot_0_61_0(arg_630_0)
	local var_630_0 = arg_630_0:get()

	if not var_630_0 then
		slot_0_52_2:override()
	end

	events.post_update_clientside_animation(slot_0_59_2, var_630_0)
end

slot_0_48_1.enabled:set_callback(slot_0_61_0, true)

slot_0_48_0 = nil
slot_0_49_1 = slot_0_23_0.misc.fake_duck
slot_0_50_1 = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots")
slot_0_51_1 = ui.find("Aimbot", "Ragebot", "Main", "Double Tap")
slot_0_52_1 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
slot_0_53_1 = {}
slot_0_54_2 = 0

function slot_0_55_3()
	if slot_0_54_2 >= 14 then
		slot_0_54_2 = 0
	end

	slot_0_54_2 = slot_0_54_2 + 1
end

function slot_0_56_2()
	slot_0_50_1:override()
	slot_0_51_1:override()
end

function slot_0_57_1()
	slot_0_56_2()
end

function slot_0_58_1(arg_634_0)
	if not slot_0_52_1:get() then
		return
	end

	local var_634_0 = entity.get_local_player()

	if var_634_0 == nil then
		return
	end

	local var_634_1 = entity.get_game_rules()

	if var_634_1 == nil or not var_634_1.m_bFreezePeriod then
		return
	end

	arg_634_0.camera.z = var_634_0:get_origin().z + 64
end

function slot_0_59_1(arg_635_0)
	if not slot_0_52_1:get() then
		return slot_0_56_2()
	end

	local var_635_0 = entity.get_game_rules()

	if var_635_0 == nil or not var_635_0.m_bFreezePeriod then
		return
	end

	slot_0_55_3()

	arg_635_0.in_duck = slot_0_54_2 > 7
	arg_635_0.send_packet = slot_0_54_2 == 14

	slot_0_50_1:override(false)
	slot_0_51_1:override(false)
end

function slot_0_53_1.update(arg_636_0)
	local var_636_0 = arg_636_0:get("On Freezetime")

	events.shutdown(slot_0_57_1, var_636_0)
	events.createmove(slot_0_59_1, var_636_0)
	events.override_view(slot_0_58_1, var_636_0)
end

slot_0_54_1 = {}

function slot_0_55_2(arg_637_0)
	if not slot_0_52_1:get() then
		return
	end

	local var_637_0 = vector(arg_637_0.forwardmove, arg_637_0.sidemove)

	if var_637_0:length2dsqr() < 25 then
		return
	end

	var_637_0:normalize()

	arg_637_0.forwardmove = var_637_0.x * 150
	arg_637_0.sidemove = var_637_0.y * 150
end

function slot_0_54_1.update(arg_638_0)
	events.createmove_run(slot_0_55_2, arg_638_0:get("Unlock Speed"))
end

slot_0_55_1 = nil

function slot_0_56_1(arg_639_0)
	slot_0_53_1.update(arg_639_0)
	slot_0_54_1.update(arg_639_0)
end

slot_0_49_1.options:set_callback(slot_0_56_1, true)

slot_0_49_0 = nil
slot_0_50_0 = slot_0_23_0.misc.nickname_generator
slot_0_51_0 = cvar.name
slot_0_52_0 = nil
slot_0_53_0 = {
	"бля нормально наваху купил",
	"я вейп купил",
	"чд? кд?",
	"якубовчи567",
	"блек ангел убившка11",
	"таракан динис",
	"жульверик",
	"яростный минерльный чеченец кажэуал",
	"снеговой авпкингуля",
	"mr геймер300",
	"хсаю вв с первой пу",
	"куда в хуй",
	"hasbik style KZ",
	"60G AJlTaUcKuX 7oP",
	"4е в Xyя7y",
	"хсаю даже на тол4ке",
	"OnlyBaim gang$",
	"был выебан кизарухвх",
	"9PoCtHblU KUnKoG",
	"TTu3дoHюx",
	"CTaPaя Ho OTTacHeHьKaя",
	"я выезжаю носопырки",
	"✪FasTIK✪",
	"ЂΣƊOŁ∆G∆",
	"︻デ═一 ☭ sniper",
	"ГуСеЙн ШоУ",
	"oП Я кРуТоЙ А тЫ ХуЙ",
	"хуяторубиватор6731",
	"♕ａｒｔｅｍ １５４",
	"срега мобилкин",
	"матвей крабов",
	"койфовая криветка ебланище",
	"✧*:･ﾟ✧ 𝐅𝐔𝐂𝐊 𝐘𝐎𝐔 ✧*:･ﾟ✧",
	"SPASIBO ZA SKEET",
	"𝐍𝐚𝐀𝐢𝐫𝐌𝐚𝐱",
	"буйный славик газолир",
	"лёва таракан-56",
	"yKpoTuTeJlb_6a6yweK",
	"anatoly fakeyaw",
	"Валентин",
	"Супер Снайпер228",
	"Заказать педофuла",
	"Рамзан Кадыров",
	"проверка на читы",
	"main nick sanyaKiller228",
	"Борис Животное",
	"bmw top",
	"Дима[RUS]2005",
	"ислам магомедов",
	"ТИМАТИХВХ",
	"eldoradohvh",
	"бультазар",
	"я еблан бигити",
	"pavlo.matvei98",
	"www.CSGOSETTINGS.ru 111",
	"мамкаеб2009",
	"фугас тимоха",
	"VLAD_ПУСТОЙ",
	"Велимир (Not Cheater)",
	"ОпА$нЫй мастер клатчей леха ебать",
	"KirillMachine",
	"THIS IS OMLEEEEEEET (◣◢)",
	"soldier (солдат)",
	"-----= S.E.N.A.T.O.R =-----",
	"*-КрYчE_Бога_u_ЦаРя-*",
	"ᴛʜᴇʙᴇsᴛ",
	"♥§₭îℒȴ⊕ᗩᙡǞℙℰℜ₳🎆",
	"GloBal~BaNaN",
	"Fucking.Ba[nn]Y...",
	"d[oo]dLeZzzz...",
	"VIP Sex Energy VIP",
	"🥑𝕒𝕧𝕒𝕔𝕒𝕕𝕠🥑",
	"乂...𝔡.𝔦.𝔨.𝔦.y...乂",
	"║☾ Ħ Ξ ∀ 千 Σ 尺║",
	"彡[ᴅᴇᴀᴅ ᴋɪʟʟᴇʀ]彡",
	"ʀᴇᴘ ɪɴsᴀɴᴇ ᴡɪᴛʜ ᴀᴡᴘ",
	"Спуди Мун",
	"ᗫტ₦ℋℱǾℜ",
	"☢Ď₳ÑǤĒ℟☢",
	"Ģŗąņď_₥ąﮐŧξŗ",
	"F@$$$TiK...",
	"...::::K[RAM]m[ER]::::...",
	"опер окаянный",
	"ДОНАТ С PAYPAL",
	"shelzi228",
	"фарш",
	"танцую лезгинку",
	"OPERуполномоченный",
	"2 охлажденных яйца",
	"мазик окаянный",
	"Ballin' Maut",
	"Balin`Shprot",
	"MILLIONAR Balin",
	"КРАШ ТЕСТ МАРК 2",
	"​HVH RACING",
	"клубнично-вишневый слоняра",
	"яблочный гипопотам",
	"крол ржачный абрикосовый",
	"Агрессивный карбюратор",
	"tw1x^zz1^aced1v1",
	"s1mple",
	"꧁ℳaⲦⱔɪ℣aẕⱔɪ✞꧂",
	"•ᴮᴬᴰʙᴏʏツ",
	"꧁ঔৣ☬✞𝓓𝖔𝖓✞☬ঔৣ꧂",
	"∆♣️JOKER♥️∆",
	"SpraY",
	"꧁༺₦Ї₦ℑ₳༻꧂",
	"➢ Iᴍᴍᴏʀᴛᴀʟ",
	"╾━╤デ╦︻ ₳₭-❹❼ 𝓰𝓸𝓭",
	"︻デ═一GOD_SK",
	"🅼*🅰️*🆅*🅴*🆁*🅸*🅲*🅺",
	"༺Leͥgeͣnͫd༻ᴳᵒᵈ",
	"꧁✪♕BOT♕✪꧂",
	"🔥𝓖𝓡𝓐𝓢𝓤🔥",
	"TØXIC",
	"𝕵𝖆𝔳𝖎𝖎 ✪",
	"🅴🆉🆉 🅽🅾️🅾️🅱️🆂",
	"꧁༺J͓̽o͓̽s͓̽I͓̽༻꧂",
	"♡ AWP – senpai ◕‿◕ [ツ]",
	"ヅ [OnI-ChaN] FreSH[x]☪️",
	"꧁ᴳᵒᵈSlayer꧂",
	"༺Leͥgeͣnͫd༻",
	"✪₦Ї₦ℑ₳༻︻デ═一",
	".S!ckBoY^",
	"𝕾𝖙𝖚𝖗𝖒𝕽𝖊𝖇𝖊𝖑𝖑",
	"♥️𝓚𝓮𝓝𝓝𝔂𝓢♥️",
	"Snax",
	"꧁ঔৣ☬✞𝓵𝓮𝓰𝓮𝓷𝓭ˡᵒᵛᵉ ʸᵒᵘ✞☬ঔৣ꧂",
	"♕ѕнє ¢αℓℓ мє нα¢",
	"✪AnARcHY_",
	"bl1tz",
	"Carry Potter",
	"✪TaCt1CaL",
	"vk.com/vampire",
	"ᗰEᗰE ᔕEᑎᔕE",
	"”*°•.★..Angel_Of_The_Night..★.•°*”˜",
	"ñƤüβ£ϯ ΨнӹƤь ϯ£ნя £ნ£ϯ j£§ɥ§",
	"ęβãł țýä √ řøţ",
	"忍び 1 УПАЛ び忍",
	"MaJIeHkuu_Ho_OnacHekuu",
	"•۩۞۩[̲̅П̲̅о̲̅Л̲̅Ю̲̅б̲̅А̲̅С(ٿ)̲̅Ч̲̅и̅Т̲̲АК̲̅]۩۞۩•",
	"YбИuЦа_КрИпЕrОв",
	"Теперь я - Ютубер Омлет (◣◢)",
	"ⒶaŴÞ ︻デ 一 PUTIN",
	"VAAAAAAAC в чат!!! (づ ◕‿◕ )",
	"づ 从闩从长丫 仨五闩人",
	"+Yeb@shu_v_k@shu+",
	"£ნÿ ϯя",
	"AHHAHAHHAHAHH LIFEHACK ♥️♥️♥️♥️♥️",
	"ПуЛи_От_БаБуЛи",
	"ПаРеНь БеЗ сТрАхА",
	"Н.Е.С.О.К.Р.У.Ш.И.М.Ы.Й",
	"KpyToI_4elOBeK",
	"^^Stell^^::.[Pro_Game_Xom9k]",
	"3Jlou_ЗAdrOT",
	"ñüѫ¤Ƥ ñüƺѫå ϯÿƺ ɱ¤н¤ȹя",
	"я ķ¤нɥåλ ϯβ¤£ü ɱåɱķ£ β Ƥ¤ϯ",
	"ⒶaŴÞ ︻デ 一",
	"комсомольский цыган",
	"носатый нос райзена",
	"ашкудишка со вкусом уха",
	"pepper roni (пицца) со вкусом сметаны",
	"METAN HVH",
	"ШВЕДСКИЙ СТОЛ ГРИГОРИЯ ЛЕПСА",
	"ААААА КЫЗЛАР КУТАК БАС АШАЛАМАНААА БИЛЯЯЯ ЭУУУ",
	"Z V",
	"СЛЫШУ ZOV",
	"ТЮФЯЯЯК (ПАТРИК)",
	"GuGu_Zha_IIIagu",
	"GyGaBait",
	"ebaWu_V_KaWu (Z)",
	"МАМИНО ПРОТИВОРЕЧИЕ",
	"Nellячка UwU",
	"Фильм «Улыбка»",
	"Котлетосы из zыра",
	"Какао бобер",
	"Фальшивая утка",
	"Рыскание нижней части тела",
	"гусейн газ",
	"туалетный утюг",
	"Газования на удачу",
	"спираль маны",
	"Подкова сракотана",
	"Дупло хомяка",
	"Бельчий аул",
	"ЯЗЫК ТЕЛА",
	"тюльпановые горы радости",
	"Сыр быб рыр",
	"ШимпанZе (обидка)",
	"Ложные отставания",
	"Вбив / выбив зубов г.Урюпинск",
	"Гусейн газуй нах",
	"Зеница око",
	"Zorix(csgo)",
	"Пидер пайдер",
	"Зубы мудрости",
	"Щекотное теребоньканье",
	"ZELTR1X",
	"ZOLDY1337",
	"K1neXj.",
	"Evolvex",
	"ANGELS HVH",
	"Шестая пятка",
	"Мозолистый шалопай",
	"тюремский узурпатор",
	"Стояк пыхтун",
	"Натоптыши",
	"Набрал долгов",
	"Забив кальянов",
	"Турничковая забивка",
	"Тренировка под дождем",
	"Дрочу стоя",
	"Йожик жухлый",
	"Ехидная харя",
	"Кайфецкий кумарчик",
	"КАРТОФЕЛЬ",
	"SANCHEZJ X FIPP",
	"ГЕОРГИЙ ФАМУТИЛОВ",
	"АЗАЗАЗАЗА АЗЛАГОР",
	"Ребенок подкидышь",
	"ДЕТИ В ПОДВАЛЕ",
	"СТИВАХА",
	"Фрост снейк и парниша",
	"ТИМОФЕЙ И ЕГО ДРУГ ПЬЯНЫЙ ЕГОР",
	"Заблокированный скайп",
	"ДОКТОР БРАУН? слушаю.",
	"АРОМАТ ЗИРАПТОРСА ССЫТ В РАКОВИНУ",
	"СКАААЙ",
	"Доктор бабун",
	"нитрат фабурита",
	"черноголовка))",
	"Ссыканье в тазик",
	"ликтофат натрия",
	"Мытье в бидоне",
	"нипортам в раковине",
	"выгуливать колбасу вместо собаки на балконе",
	"Гиппопотам сырный",
	"зупифальный назальный спрей для ногтей",
	"Пидорские сырники",
	"гоги на уроги",
	"GoGiMan777",
	"Карамельные ноготочки",
	"деревянное яблоко",
	"арбузные сланцы",
	"hey? MACARENAA",
	"трицерапторс",
	"Хорошая одежда",
	"LXNER репир",
	"Модный приговор",
	"студент",
	"Релиз sqwore",
	"хайперпоп самара",
	"18двадцетин",
	"Цитрус от зуда",
	"Цитриновый кашель",
	"Тандум верде форте",
	"ТАБУН ГОСТЕЙ",
	"ОЛЕГ ТИНЬКОФФ",
	"SAILOR MOON РОБЕРТ С АРБУЗОМ",
	"КОЗАХСТАН ЫЫЫЫЫААААААА",
	"Велимир спиридонов",
	"Вахид бабев",
	"Сурикатный тушканчик",
	"Азиз шавершян",
	"вильветовый осьминог",
	"колбаса с лысым мужиком",
	"деньги и пахучие ноги",
	"Карась со стразами",
	"РЫБА МОЕЙ МЕЧТИ",
	"ЯЯЯЯЯЯЯЯЯЯЯЯЯЯЯЗЬ",
	"Тунец от халики",
	"Камбала в ванне",
	"кальянизация прошла успешно🌹",
	"шишка в мышке",
	"Плотное яблочко",
	"лопасти микрофона",
	"Кумарная сессия",
	"клавиатура информатика",
	"Пробирка биологички",
	"зеленое небо в закате",
	"темное озарение тепла",
	"пенящее счастье",
	"со скитулькой в ммулю",
	"богатые волосы киркорова",
	"Играю как fifty",
	"корова римзакса",
	"Рамоны от сереги",
	"путильфат гульзантия (привет)",
	"рафы от Raffaello",
	"красная машина с деревом от питольды",
	"Прикольный пудинг от пончика",
	"кожаная стена",
	"подстольные полупокеры",
	"амстердам гильгона",
	"Звонок на урок",
	"Табурет очки усы",
	"Читаю репчагу",
	"ЧИПСИ ОТ РЕНЕГАТА ТАТАРСКОГО",
	"ТАТАРСКИЙ MALIK163ONMYNECK",
	"НОВЫЙ РЕПИР",
	"ВУМПИР",
	"носатое уебище",
	"шестое чувство",
	"жопный предикт",
	"ЧИТЕРЫ ИМЕЮТ 6 ЧУВТСВО",
	"ТРЕТИЙ ГЛАЗ НА ПРАВОЙ ЩЕКЕ",
	"ПОДБОРОДОК В РАЗВАЛ С НОСОРОГОМ",
	"ГНИЛОЙ УТЮГ",
	"ПЬЯНАЯ ДЫНЯ",
	"БЕШЕНЫЙ КАРТОФЕЛЬ",
	"Пьяный пылесос",
	"UWU GANG",
	"Йобнутий ежик",
	"Ежик в тумане",
	"Манул в зоопарке",
	"темный валет",
	"нюхнул подмыхарик",
	"ушасто большие брови",
	"похожу на яндекс браузер",
	"Слон на крокодиле",
	"индюк в масле",
	"бурдюк с приколом",
	"киевская котлета",
	"шило на мыло",
	"Бабу на камень",
	"цукерберг панзерфауст 1337",
	"запорожье 9000",
	"Москвич 65",
	"я что похож на абонента",
	"Серега дурный",
	"иван нави",
	"Ответ на том конце",
	"Свет в начале елки",
	"сергей факел",
	"хуйпастрипс",
	"хуйпачипс",
	"Хуйпасоль",
	"Хуйпабургер",
	"Рис с касымаком",
	"Скаленаш мотыга",
	"Скаленаш такыш",
	"чифирок с горящим котом",
	"Она с Казахстана",
	"Насвай не кидаем это харам харам",
	"усатое позорище",
	"Утренний намаз под канун нового года",
	"мы не делаем трап мы делаем большие ногти",
	"узбек русский",
	"На носу героин",
	"Зависимый самовар",
	"синие волосы покорили небо",
	"ZV шмаль в плече",
	"Дефектный перфоратор",
	"самовыражающий никсвар",
	"настоящий пубертант",
	"Gloria damn",
	"антология антона",
	"gloria fuck",
	"cocki яки",
	"китайский реп",
	"цуфанзю фамерге (хвх)",
	"куталбык шурабзик",
	"тупой урод",
	"сумка со вкусом витальки",
	"черепа в афганистане пьют микрофон",
	"пить еду есть воду",
	"желтоволосый паспорт",
	"пиздец меня расперло нахуй чел",
	"Залог успехов",
	"Рыба в кляре",
	"Громофон",
	"Шуба под селедкой",
	"Мануал по манулам",
	"НИКОГДА НЕ ПРОИГРЫВАТЬ",
	"Пятьдесят",
	"семьсот десять",
	"грям арбуса",
	"вес хача",
	"1хбет",
	"yamete kudasai ^^",
	"Приехала чихуахуа",
	"чихнул без слез",
	"альпенист в песке",
	"Банановый рай",
	"Желток на чилипиздрике",
	"Говорящий портсигар",
	"Перевернутая канарейка",
	"жесткий кинотеатр",
	"Зимнее лето",
	"третий подбородок",
	"Лью лимонад мимо рта",
	"Перезаряжаю кефир",
	"кашляю хэшем",
	"Молоко 2 литра",
	"колбаса с капустой да еще и с печеньем",
	"да и в прикуску cockа кола",
	"Хитрый ксими",
	"Новомодный vertu",
	"интернет кабель",
	"Телефонный шнур",
	"шнур для бритья",
	"Барабашка без катушек",
	"Мокрое белье",
	"яйцо со стрипсом в ухе",
	"мои мысле на мыле они so low",
	"В ЧЕРНОМ СПИСКЕ",
	"тики токи от бурмалды",
	"ушастый шоколад",
	"мышка логиYECH",
	"MinYEAT",
	"МИНЬЕТ",
	"Гарик до челюсти",
	"Обидчевый школьник",
	"ПАБАКА УЛЫБАКА",
	"УХ-ТЫ-Ж-ЙО!",
	"Етижи пассатижи",
	"Шило в рыло",
	"Лайф в кайф",
	"КАЙФ ЛАЙФ",
	"Zahar bobr",
	"Вера в замая",
	"15 год это важно",
	"Коля хейтер",
	"писюнистый факультет",
	"всем спать",
	"вельветовый осьминог",
	"мясной медвед",
	"first day with neverlose.cc",
	"https://vk.com/avtopodborkazahstan",
	"Успешный автомобилист",
	"автоподбор KZ",
	"Базовая и полная",
	"май алмайды!",
	"Асты таза, стакандары сау"
}

function slot_0_54_0()
	if slot_0_52_0 == nil then
		return
	end

	common.set_name(slot_0_52_0)

	slot_0_52_0 = nil
end

function slot_0_55_0()
	slot_0_54_0()
end

slot_0_56_0 = nil

function slot_0_57_0()
	if slot_0_52_0 == nil then
		slot_0_52_0 = slot_0_51_0:string()
	end

	common.set_name(slot_0_50_0.input:get())
	events.shutdown(slot_0_55_0, true)
end

function slot_0_58_0()
	slot_0_54_0()
	events.shutdown(slot_0_55_0, false)
end

function slot_0_59_0()
	local var_644_0 = slot_0_53_0[math.random(1, #slot_0_53_0)]

	slot_0_50_0.input:set(var_644_0)
end

slot_0_50_0.set_button:set_callback(slot_0_57_0)
slot_0_50_0.reset_button:set_callback(slot_0_58_0)
slot_0_50_0.generate_button:set_callback(slot_0_59_0)

slot_0_37_0 = nil
slot_0_38_0 = {
	"crash",
	"flush",
	"buildmodelforworld",
	"envmap",
	"demos",
	"+mat_texture_list",
	"cc_random",
	"kdtree_test",
	"spincycle",
	"-mat_texture_list",
	"ai_test_los",
	"cl_soundscape_printdebuginfo"
}

for iter_0_5 = 1, #slot_0_38_0 do
	slot_0_43_0 = slot_0_38_0[iter_0_5]

	cvar[slot_0_43_0]:set_callback(function()
		print("\aFF4040FFerror CV" .. iter_0_5)

		return false
	end)
end
