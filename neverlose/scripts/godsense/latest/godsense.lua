slot_0_0_0 = ui.get_icon
slot_0_1_0 = require("neverlose/pui")
slot_0_2_0 = require("neverlose/clipboard")
slot_0_3_0 = require("neverlose/base64")
slot_0_4_0 = require("neverlose/smoothy")

cvar.cl_use_opens_buy_menu:int(0)

function slot_0_5_0()
	local var_1_0 = {}
	local var_1_1 = {}
	local var_1_2

	var_1_0.__metatable = false
	var_1_1.__order = {}

	function var_1_1.struct(arg_2_0, arg_2_1)
		assert(type(arg_2_1) == "string", "invalid class name")
		assert(rawget(arg_2_0, arg_2_1) == nil, "cannot overwrite subclass")
		table.insert(arg_2_0.__order, arg_2_1)

		return function(arg_3_0)
			assert(type(arg_3_0) == "table", "invalid class data")
			rawset(arg_2_0, arg_2_1, setmetatable(arg_3_0, {
				__metatable = false,
				__index = function(arg_4_0, arg_4_1)
					return rawget(var_1_0, arg_4_1) or rawget(var_1_2, arg_4_1)
				end
			}))

			return var_1_2
		end
	end

	var_1_2 = setmetatable(var_1_1, var_1_0)

	function var_1_2.run(arg_5_0)
		local var_5_0 = var_1_1.__order

		for iter_5_0 = 1, #var_5_0 do
			local var_5_1 = var_1_2[var_5_0[iter_5_0]]

			if var_5_1 and type(var_5_1.init) == "function" then
				var_5_1:init()
			end
		end
	end

	return var_1_2
end

ffi.cdef("    typedef struct { float x; float y; float z; } Vector;\n\n    typedef struct {\n        int id; int version; int checksum;\n        char name[64]; int length;\n        Vector eyePosition; Vector illumPosition;\n        Vector hullMin; Vector hullMax;\n        Vector bbMin; Vector bbMax;\n        int flags; int numBones; int boneIndex;\n        int numBoneControllers; int boneControllerIndex;\n        int numHitboxSets; int hitboxSetIndex;\n    } StudioHdr;\n\n    typedef struct {\n        int parent; int bonecontroller[6];\n        float pos[3]; float quat[4]; float rot[3];\n        float posscale[3]; float rotscale[3];\n        float poseToBone[12]; float qAlignment[4];\n        int flags; int proctype; int procindex;\n        int physicsbone; int surfacepropidx;\n        int contents; int surfacepropLookup;\n    } mstudiobone_t;\n\n    typedef struct {\n        int sznameindex; int numhitboxes; int hitboxindex;\n    } mstudiohitboxset_t;\n\n    typedef struct {\n        int bone; int group;\n        Vector bbmin; Vector bbmax;\n        int szhitboxnameindex; int unused[8];\n    } mstudiobbox_t;\n")
slot_0_5_0():struct("globals")({
	timestamp = 1,
	logs_name = "[GodSense]",
	name = "godsense",
	ZWSP = " ",
	space_char = " ",
	username = common.get_username(),
	screen_size = render.screen_size(),
	statements = {
		teams = {
			[1] = "Counter-Terrorists",
			[2] = "Terrorists"
		},
		states = {
			"Standing",
			"Running",
			"Walking",
			"Crouching",
			"Sneaking",
			"Air",
			"Air Crouching",
			"Freestanding",
			"Manuals"
		}
	},
	disablers_on = {
		"Grenade",
		"Peek"
	},
	reference = {
		rage = {
			main = {
				dormant_aimbot = slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
				hide_shots = slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
				hide_shots_options = slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
				double_tap = slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Double Tap"),
				double_tap_lag_options = slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
				peek_assist = {
					slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
					slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Style"),
					slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"),
					slot_0_1_0.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode")
				}
			},
			selection = {
				hit_chance = slot_0_1_0.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
				minimum_damage = slot_0_1_0.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
				safe_points = slot_0_1_0.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
				body_aim = slot_0_1_0.find("Aimbot", "Ragebot", "Safety", "Body Aim")
			}
		},
		antiaim = {
			angles = {
				enabled = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
				pitch = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
				yaw = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
				yaw_base = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
				yaw_add = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
				avoid_backstab = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
				hidden = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
				yaw_modifier = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
				modifier_offset = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
				body_yaw = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
				inverter = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
				left_limit = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
				right_limit = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
				options = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
				freestanding_body_yaw = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
				freestanding = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
				freestand_peek = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
				disable_yaw_modifiers = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
				body_freestanding = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
				extended_angles = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
				extended_pitch = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
				extended_roll = slot_0_1_0.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll")
			},
			fake_lag = {
				enabled = slot_0_1_0.find("Aimbot", "Anti Aim", "Fake Lag", "Enabled"),
				limit = slot_0_1_0.find("Aimbot", "Anti Aim", "Fake Lag", "Limit")
			},
			misc = {
				fake_duck = slot_0_1_0.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
				slow_walk = slot_0_1_0.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
				leg_movement = slot_0_1_0.find("Aimbot", "Anti Aim", "Misc", "Leg Movement")
			}
		}
	}
}):struct("string")({
	lerp = function(arg_6_0, arg_6_1, arg_6_2, arg_6_3)
		return arg_6_1[arg_6_2]:lerp(arg_6_1[arg_6_2 + 1], arg_6_3)
	end,
	wave = function(arg_7_0, arg_7_1, arg_7_2, ...)
		local var_7_0 = #arg_7_1

		if var_7_0 < 2 then
			return arg_7_1
		end

		local var_7_1 = {
			...
		}
		local var_7_2 = 1 / (var_7_0 - 1)
		local var_7_3 = #var_7_1 - 1
		local var_7_4 = {}
		local var_7_5 = 0

		for iter_7_0 in arg_7_1:gmatch(".[\x80-\xBF]*") do
			local var_7_6 = (arg_7_2 + var_7_5 * var_7_2) % 2

			if var_7_6 > 1 then
				var_7_6 = 2 - var_7_6
			end

			local var_7_7 = math.floor(var_7_6 * var_7_3) + 1

			if var_7_7 >= #var_7_1 then
				var_7_7 = #var_7_1 - 1
			end

			local var_7_8 = arg_7_0:lerp(var_7_1, var_7_7, var_7_6 * var_7_3 % 1)

			var_7_4[#var_7_4 + 1] = "\a" .. var_7_8:to_hex()
			var_7_4[#var_7_4 + 1] = iter_7_0
			var_7_5 = var_7_5 + 1
		end

		return table.concat(var_7_4)
	end,
	_pad_cache = {},
	calculate_padding = function(arg_8_0, arg_8_1)
		local var_8_0 = arg_8_0._pad_cache[arg_8_1]

		if var_8_0 then
			return var_8_0[1], var_8_0[2]
		end

		local var_8_1 = 0
		local var_8_2 = 0
		local var_8_3 = arg_8_1

		while var_8_3 >= 6 do
			var_8_1 = var_8_1 + 1
			var_8_3 = var_8_3 - 3
		end

		while var_8_3 >= 4 do
			var_8_2 = var_8_2 + 1
			var_8_3 = var_8_3 - 2
		end

		if var_8_3 == 3 then
			var_8_1 = var_8_1 + 1
		elseif var_8_3 == 2 then
			var_8_2 = var_8_2 + 1
		end

		arg_8_0._pad_cache[arg_8_1] = {
			var_8_1,
			var_8_2
		}

		return var_8_1, var_8_2
	end,
	_rep_cache = {},
	_rep = function(arg_9_0, arg_9_1, arg_9_2)
		if arg_9_2 <= 0 then
			return ""
		end

		local var_9_0 = arg_9_1 .. arg_9_2
		local var_9_1 = arg_9_0._rep_cache[var_9_0]

		if var_9_1 then
			return var_9_1
		end

		local var_9_2 = string.rep(arg_9_1, arg_9_2)

		arg_9_0._rep_cache[var_9_0] = var_9_2

		return var_9_2
	end,
	format = function(arg_10_0, arg_10_1, arg_10_2, arg_10_3, arg_10_4, arg_10_5, arg_10_6)
		arg_10_3 = arg_10_3 or 0
		arg_10_4 = arg_10_4 or 0
		arg_10_5 = arg_10_5 or 0

		local var_10_0 = arg_10_0.globals.ZWSP
		local var_10_1 = arg_10_0.globals.space_char
		local var_10_2 = 0
		local var_10_3 = 0
		local var_10_4 = 0
		local var_10_5 = 0
		local var_10_6 = 0
		local var_10_7 = 0

		if arg_10_3 >= 2 then
			var_10_2, var_10_3 = arg_10_0:calculate_padding(arg_10_3)
		end

		if arg_10_4 >= 2 then
			var_10_4, var_10_5 = arg_10_0:calculate_padding(arg_10_4)
		end

		if arg_10_5 >= 2 then
			var_10_6, var_10_7 = arg_10_0:calculate_padding(arg_10_5)
		end

		local var_10_8 = arg_10_0:_rep(var_10_1, var_10_2) .. arg_10_0:_rep(var_10_0, var_10_3)

		if type(arg_10_6) == "userdata" then
			arg_10_6 = "\a" .. arg_10_6:to_hex()
		end

		if arg_10_1 then
			local var_10_9 = arg_10_6 or "\a{Link Active}"
			local var_10_10 = slot_0_0_0(arg_10_1)

			if #var_10_10 == 0 then
				var_10_10 = tostring(arg_10_1)
			end

			var_10_8 = var_10_8 .. string.format("%s%s\aDEFAULT", var_10_9, var_10_10)
		end

		return ((var_10_8 .. arg_10_0:_rep(var_10_1, var_10_4) .. arg_10_0:_rep(var_10_0, var_10_5)) .. (arg_10_2 or "")) .. arg_10_0:_rep(var_10_1, var_10_6) .. arg_10_0:_rep(var_10_0, var_10_7)
	end,
	colored = function(arg_11_0, ...)
		local var_11_0 = {}

		for iter_11_0, iter_11_1 in ipairs({
			...
		}) do
			var_11_0[#var_11_0 + 1] = "\a" .. iter_11_1[2]:to_hex() .. iter_11_1[1]
		end

		return table.concat(var_11_0)
	end
}):struct("menu")({
	elements = {},
	init = function(arg_12_0)
		slot_12_1_0 = "•"
		slot_12_2_1 = arg_12_0.string:format("house", "", 2, 2, 0)
		slot_12_3_2 = slot_0_1_0.create(slot_12_2_1, "Information", 1)
		slot_12_4_2 = slot_0_1_0.create(slot_12_2_1, "Presets System", 2)
		slot_12_5_2 = slot_0_1_0.create(slot_12_2_1, "Watermark Customize", 1)
		arg_12_0.elements.welcome = slot_12_3_2:label(arg_12_0.string:format("angles-right", "Welcome back, \v" .. common.get_username() .. "\r!", 5, 5, 0))
		arg_12_0.elements.godsense = slot_12_3_2:button(arg_12_0.string:format(nil, "Godsense", 31, 2, 31), function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=mWvUWf")
		end, true)
		arg_12_0.elements.godsense_beta = slot_12_3_2:button(arg_12_0.string:format(nil, "Godsense Beta", 15, 2, 15), function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=5xxDR1")
		end, true)
		arg_12_0.elements.slider_reklama = slot_12_3_2:slider(arg_12_0.string:format("angles-right", "Socials and Figs", 5, 5, 0), 0, 2, 0, 1, function(arg_15_0)
			if arg_15_0 == 0 then
				return "Crewqx"
			elseif arg_15_0 == 1 then
				return "Lucy"
			else
				return "Mapsat"
			end
		end)
		slot_12_6_2 = {
			{
				"crew",
				"w8hKN5",
				"https://www.youtube.com/@crewqx",
				31
			},
			{
				"lucy",
				"i7WZrR",
				"https://www.youtube.com/@lxcy66",
				31
			},
			{
				"maps",
				"v7MnJQ",
				"https://www.youtube.com/@mapsathvh",
				31
			}
		}

		for iter_12_0, iter_12_1 in ipairs(slot_12_6_2) do
			slot_12_12_3 = iter_12_0 - 1
			slot_12_13_2 = slot_12_3_2:button(arg_12_0.string:format("link", "Config", 31, 2, 31), function()
				panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=" .. iter_12_1[2])
			end, true)
			slot_12_14_1 = slot_12_3_2:button(arg_12_0.string:format("youtube", "Youtube", 25, 2, 25), function()
				panorama.SteamOverlayAPI.OpenExternalBrowserURL(iter_12_1[3])
			end, true)

			slot_12_13_2:depend({
				arg_12_0.elements.slider_reklama,
				slot_12_12_3
			})
			slot_12_14_1:depend({
				arg_12_0.elements.slider_reklama,
				slot_12_12_3
			})

			arg_12_0.elements["config_" .. iter_12_1[1]] = slot_12_13_2
			arg_12_0.elements["youtube_" .. iter_12_1[1]] = slot_12_14_1
		end

		arg_12_0.elements.preset_list = slot_12_4_2:list("", {})
		arg_12_0.elements.preset_input = slot_12_4_2:input("")
		slot_12_7_2 = slot_12_4_2:switch(" ", false)
		slot_12_8_2 = slot_12_4_2:switch(" ", false)

		slot_12_7_2:visibility(false)
		slot_12_8_2:visibility(false)

		arg_12_0.elements.preset_buttons = {
			hidden_switch = slot_12_7_2,
			save_switch = slot_12_8_2
		}
		slot_12_9_2 = slot_12_7_2
		slot_12_10_2 = slot_12_8_2
		slot_12_11_2 = arg_12_0.elements.preset_buttons

		function slot_12_12_2(arg_18_0, arg_18_1, arg_18_2, arg_18_3, arg_18_4)
			local var_18_0 = slot_12_4_2:button(arg_12_0.string:format(arg_18_0, "", arg_18_1, arg_18_2, 0), arg_18_3, true, arg_18_4)

			var_18_0:depend({
				slot_12_9_2,
				false
			}):depend({
				slot_12_10_2,
				false
			})

			return var_18_0
		end

		slot_12_11_2.create = slot_12_12_2("layer-plus", 4, 4, nil, "Create preset.")
		slot_12_11_2.load = slot_12_12_2("cloud-arrow-down", 4, 4, nil, "Load preset.")
		slot_12_11_2.save = slot_12_4_2:button(arg_12_0.string:format("floppy-disk", "", 4, 4, 0), function()
			slot_12_8_2:set(true)
		end, true, "Save preset."):depend({
			slot_12_9_2,
			false
		}):depend({
			slot_12_10_2,
			false
		})
		slot_12_11_2.export = slot_12_12_2("file-export", 6, 4, nil, "Export preset.")
		slot_12_11_2.import = slot_12_12_2("file-import", 5, 6, nil, "Import preset")
		slot_12_11_2.delete = slot_12_4_2:button(arg_12_0.string:format("trash-can", "", 25, 25, 0, "\aF9A19AFF"), function()
			slot_12_9_2:set(true)
		end, true, "Delete preset."):depend({
			slot_12_9_2,
			false
		}):depend({
			slot_12_10_2,
			false
		})
		slot_12_11_2.delete_confirm = slot_12_4_2:button(arg_12_0.string:format("trash-check", "", 53, 54, 0, "\a45ec4aFF"), function()
			slot_12_9_2:set(false)
		end, true, "Confirm delete."):depend({
			slot_12_9_2,
			true
		})
		slot_12_11_2.delete_cancel = slot_12_4_2:button(arg_12_0.string:format("trash-xmark", "", 53, 54, 0, "\aF9A19AFF"), function()
			slot_12_9_2:set(false)
		end, true, "Cancel delete."):depend({
			slot_12_9_2,
			true
		})
		slot_12_11_2.save_confirm = slot_12_4_2:button(arg_12_0.string:format("check", "", 53, 54, 0, "\a45ec4aFF"), function()
			slot_12_10_2:set(false)
		end, true, "Confirm save."):depend({
			slot_12_10_2,
			true
		})
		slot_12_11_2.save_cancel = slot_12_4_2:button(arg_12_0.string:format("xmark", "", 53, 54, 0, "\aF9A19AFF"), function()
			slot_12_10_2:set(false)
		end, true, "Cancel save."):depend({
			slot_12_10_2,
			true
		})
		arg_12_0.elements.watermark = slot_12_5_2:label(arg_12_0.string:format("layer-plus", "Watermark", 0, 10, 2))
		slot_12_13_1 = arg_12_0.elements.watermark:create()
		arg_12_0.elements.watermark_gear = {
			pos_x = slot_12_13_1:slider("x", 0, render.screen_size().x, render.screen_size().x / 2):visibility(false),
			pos_y = slot_12_13_1:slider("y", 0, render.screen_size().y, render.screen_size().y - 20):visibility(false),
			input = slot_12_13_1:input(arg_12_0.string:format("wand-magic-sparkles", "Text", 0, 8, 2), "godsense"),
			font = slot_12_13_1:combo(arg_12_0.string:format("object-subtract", "Font", 0, 10, 2), {
				"Default",
				"Bold",
				"Console",
				"Pixel"
			}),
			mode = slot_12_13_1:selectable(arg_12_0.string:format("layer-plus", "Mods", 0, 10, 2), {
				"Rainbow",
				"Encode",
				"Pulse"
			}),
			accent_color = slot_12_13_1:color_picker(arg_12_0.string:format("angles-right", "Accent", 2, 11, 2), {
				Static = {
					color(255, 255, 255, 255)
				},
				Gradient = {
					color(255, 255, 255, 255),
					color(180, 180, 180, 50)
				}
			})
		}

		arg_12_0.elements.watermark_gear.accent_color:depend({
			arg_12_0.elements.watermark_gear.mode,
			"Rainbow",
			true
		})
		events.render(function()
			local var_25_0 = slot_0_1_0.get_style()["Link Active"]
			local var_25_1 = color(var_25_0.r, var_25_0.g, var_25_0.b, 0)
			local var_25_2 = arg_12_0.string:wave("Godsense Beta", globals.realtime, var_25_0, var_25_1)

			arg_12_0.elements.godsense_beta:name(arg_12_0.string:format(nil, var_25_2, 15, 2, 15))
		end)

		slot_12_2_0 = {}
		slot_12_3_1 = arg_12_0.string:format("person", "", 2, 2, 0)
		slot_12_4_1 = slot_0_1_0.create(slot_12_3_1, "Selection & Builder", 1)
		slot_12_5_1 = slot_0_1_0.create(slot_12_3_1, "", 1)
		slot_12_6_1 = slot_0_1_0.create(slot_12_3_1, "\n", 1)
		slot_12_7_1 = slot_0_1_0.create(slot_12_3_1, "Force Defensive", 1)
		slot_12_8_1 = slot_0_1_0.create(slot_12_3_1, "Hotkeys & Options", 2)
		slot_12_9_1 = slot_0_1_0.create(slot_12_3_1, "\n\n\n", 2)
		slot_12_10_1 = slot_0_1_0.create(slot_12_3_1, "\n\n", 2)
		slot_12_2_0.teams = slot_12_4_1:list("", {
			arg_12_0.string:format(slot_12_1_0, "Counter-Terrorists", 2, 5, 2),
			arg_12_0.string:format(slot_12_1_0, "Terrorists", 2, 5, 2)
		})
		slot_12_11_1 = slot_0_1_0.get_style()["Link Active"]
		slot_12_12_1 = {}

		for iter_12_2, iter_12_3 in ipairs(arg_12_0.globals.statements.states) do
			slot_12_12_1[iter_12_2] = arg_12_0.string:format(slot_12_1_0, iter_12_3, 2, 5, 2, slot_12_11_1)
		end

		slot_12_13_0 = {}

		for iter_12_4, iter_12_5 in ipairs(arg_12_0.globals.disablers_on) do
			slot_12_13_0[iter_12_4] = arg_12_0.string:format(slot_12_1_0, iter_12_5, 2, 5, 2, slot_12_11_1)
		end

		slot_12_2_0.conditions = slot_12_5_1:slider(arg_12_0.string:format(slot_12_1_0, "States", 2, 5, 2), 1, 9, 1, 1, function(arg_26_0)
			return ({
				"Standing",
				"Running",
				"Walking",
				"Crouching",
				"Sneaking",
				"Air",
				"Air Crouching",
				"Freestanding",
				"Manuals"
			})[arg_26_0] or "Unknown"
		end)
		slot_12_14_0 = {
			state = slot_12_7_1:selectable(arg_12_0.string:format("gear", "Snap States", 2, 4, 0), slot_12_12_1)
		}
		slot_12_15_0 = slot_12_14_0.state:create()
		slot_12_14_0.hide_shots = slot_12_15_0:combo(arg_12_0.string:format("folder-open", "Shots Options", 2, 4, 0, "\a{Small Text}"), {
			"Favor Fire Rate",
			"Favor Fake Lag",
			"Break LC"
		})
		slot_12_14_0.disablers_on = slot_12_15_0:selectable(arg_12_0.string:format("code-compare", "Disable on", 2, 4, 0, "\a{Small Text}"), slot_12_13_0)
		slot_12_2_0.snap = slot_12_14_0
		slot_12_16_0 = {}
		slot_12_17_0 = arg_12_0.globals.statements.states
		slot_12_18_0 = arg_12_0.globals.statements.teams
		slot_12_19_0 = 9

		for iter_12_6 = 1, #slot_12_17_0 do
			slot_12_24_0 = slot_12_17_0[iter_12_6]
			slot_12_16_0[slot_12_24_0] = {}

			for iter_12_7 = 1, #slot_12_18_0 do
				slot_12_29_0 = slot_12_18_0[iter_12_7]
				slot_12_16_0[slot_12_24_0][slot_12_29_0] = {}
				slot_12_30_0 = slot_12_16_0[slot_12_24_0][slot_12_29_0]
				slot_12_31_0 = iter_12_6
				slot_12_32_0 = iter_12_7

				function slot_12_33_0()
					return slot_12_2_0.conditions.value ~= slot_12_19_0
				end

				function slot_12_34_0()
					return slot_12_2_0.teams:get() == slot_12_32_0
				end

				function slot_12_35_0()
					return slot_12_2_0.conditions.value == slot_12_31_0
				end

				slot_12_30_0.yaw = slot_12_6_1:slider(arg_12_0.string:format("split", "Yaw Mode", 1, 8, 2), 0, 1, 0, nil, function(arg_30_0)
					return arg_30_0 == 0 and "Static" or "L&R"
				end):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				})
				slot_12_30_0.yaw_offset = slot_12_6_1:slider(arg_12_0.string:format("⤷", "Offset", 20, 15, 2, "\a{Small Text}"), -180, 180, 0, 1, "°"):depend({
					slot_12_30_0.yaw,
					0
				}, {
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				})
				slot_12_36_0 = slot_12_30_0.yaw:create()
				slot_12_30_0.left_yaw = slot_12_36_0:slider(arg_12_0.string:format(slot_12_1_0, "Left Offset", 8, 5, nil, "\a{Small Text}"), -180, 180, 0, nil, "°"):depend({
					slot_12_30_0.yaw,
					1
				}, {
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				})
				slot_12_30_0.right_yaw = slot_12_36_0:slider(arg_12_0.string:format(slot_12_1_0, "Right Offset", 8, 5, nil, "\a{Small Text}"), -180, 180, 0, nil, "°"):depend({
					slot_12_30_0.yaw,
					1
				}, {
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				})
				slot_12_30_0.yaw_randomize = slot_12_36_0:slider(arg_12_0.string:format("angles-right", "\a{Small Text}Randomize", 15, 5, nil, "\a{Small Text}"), 0, 100, 0, 1, "%"):depend({
					slot_12_30_0.yaw,
					1
				}, {
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				})

				slot_12_36_0:label(arg_12_0.string:format("angles-right", "Extended Options", 3, 5, nil, "\a{Small Text}")):depend({
					slot_12_30_0.yaw,
					1
				})

				slot_12_30_0.delay_custom_sliders = slot_12_36_0:slider(arg_12_0.string:format("merge", "Delay", 20, 5, 0, "\a{Small Text}"), 0, 8, 0, 1, function(arg_31_0)
					if arg_31_0 == 0 then
						return "Off"
					elseif arg_31_0 == 1 then
						return "Default"
					elseif arg_31_0 == 2 then
						return "Random"
					else
						return "Ways {" .. arg_31_0 .. "}"
					end
				end):depend({
					slot_12_30_0.yaw,
					1
				}, {
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				})
				slot_12_30_0.delay_chance = slot_12_36_0:switch(arg_12_0.string:format("brain-circuit", "Delay Chance", 15, 5, nil, "\a{Small Text}")):depend({
					slot_12_30_0.yaw,
					1
				}, {
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				}, {
					slot_12_30_0.delay_custom_sliders,
					function()
						return slot_12_30_0.delay_custom_sliders.value > 0
					end
				})
				slot_12_30_0.delay_chance_amount = slot_12_36_0:slider(arg_12_0.string:format(slot_12_1_0, "Chance", 20, 5, nil, "\a{Small Text}"), 0, 100, 100, 1, "%"):depend({
					slot_12_30_0.yaw,
					1
				}, {
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				}, {
					slot_12_30_0.delay_chance,
					true
				}, {
					slot_12_30_0.delay_custom_sliders,
					function()
						return slot_12_30_0.delay_custom_sliders.value > 0
					end
				})
				slot_12_30_0.delay_chance_mode = slot_12_36_0:combo(arg_12_0.string:format(slot_12_1_0, "Chance Mode", 20, 5, nil, "\a{Small Text}"), {
					"Default",
					"Per Swap",
					"Per Tick"
				}):depend({
					slot_12_30_0.yaw,
					1
				}, {
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				}, {
					slot_12_30_0.delay_chance,
					true
				}, {
					slot_12_30_0.delay_custom_sliders,
					function()
						return slot_12_30_0.delay_custom_sliders.value > 0
					end
				})

				for iter_12_8 = 1, 10 do
					slot_12_41_1 = iter_12_8
					slot_12_30_0["delay_" .. iter_12_8] = slot_12_36_0:slider(arg_12_0.string:format("angles-right", iter_12_8, 10 + 5 * iter_12_8, 2, 3, "\a{Small Text}"), 2, 20, 2, 1, "t"):depend({
						slot_12_2_0.conditions,
						slot_12_35_0
					}, {
						slot_12_2_0.teams,
						slot_12_34_0
					}, {
						slot_12_2_0.conditions,
						slot_12_33_0
					}, {
						slot_12_30_0.yaw,
						1
					}, {
						slot_12_30_0.delay_custom_sliders,
						function()
							return slot_12_41_1 <= slot_12_30_0.delay_custom_sliders.value
						end
					})
				end

				slot_12_30_0.randomize_delay_btn = slot_12_36_0:button(arg_12_0.string:format("shuffle", "Shuffle", 2, 5, 2, "\a{Small Text}"), function()
					local var_36_0 = slot_12_30_0.delay_custom_sliders:get()

					for iter_36_0 = 1, var_36_0 do
						slot_12_30_0["delay_" .. iter_36_0]:set(math.random(2, 13))
					end
				end, true):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				}, {
					slot_12_30_0.delay_custom_sliders,
					function()
						return slot_12_30_0.delay_custom_sliders.value > 2
					end
				})
				slot_12_30_0.reset_delay_btn = slot_12_36_0:button(arg_12_0.string:format("trash-can", "Reset", 2, 5, 2, "\a{Small Text}"), function()
					slot_12_30_0.delay_custom_sliders:set(3)

					for iter_38_0 = 1, 10 do
						slot_12_30_0["delay_" .. iter_38_0]:set(2)
					end
				end, true):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_2_0.conditions,
					slot_12_33_0
				}, {
					slot_12_30_0.delay_custom_sliders,
					function()
						return slot_12_30_0.delay_custom_sliders.value > 2
					end
				})
				slot_12_37_0 = arg_12_0.globals.reference.antiaim.angles.yaw_modifier:list()
				slot_12_30_0.yaw_modifier = slot_12_6_1:combo(arg_12_0.string:format("gear", "Yaw Modifiers", 1, 8, 2), slot_12_37_0):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				})
				slot_12_38_0 = slot_12_30_0.yaw_modifier:create()
				slot_12_30_0.randomize_btn = slot_12_38_0:switch(arg_12_0.string:format("shuffle", "Randomize", 15, 5, 0, "\a{Small Text}")):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_30_0.yaw_modifier,
					"Disabled",
					true
				})
				slot_12_30_0.modifier_offset = slot_12_6_1:slider(arg_12_0.string:format("⤷", "Offset", 20, 15, 0, "\a{Small Text}"), -180, 180, 0, 1, "°"):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_30_0.yaw_modifier,
					"Disabled",
					true
				}, {
					slot_12_30_0.randomize_btn,
					false
				})
				slot_12_30_0.randomize_custom_sliders = slot_12_38_0:slider(arg_12_0.string:format("split", "Randomize", 25, 5, 0, "\a{Small Text}"), 2, 10, 0, 1, function(arg_40_0)
					return arg_40_0 == 2 and "Random" or "Ways {" .. arg_40_0 .. "}"
				end):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_30_0.randomize_btn,
					true
				}, {
					slot_12_30_0.yaw_modifier,
					"Disabled",
					true
				})

				for iter_12_9 = 1, 10 do
					slot_12_43_0 = iter_12_9
					slot_12_30_0["randomize_" .. iter_12_9] = slot_12_38_0:slider(arg_12_0.string:format("angles-right", iter_12_9, 10 + 5 * iter_12_9, 2, 2), -180, 180, 0):depend({
						slot_12_2_0.conditions,
						slot_12_35_0
					}, {
						slot_12_2_0.teams,
						slot_12_34_0
					}, {
						slot_12_30_0.randomize_btn,
						true
					}, {
						slot_12_30_0.yaw_modifier,
						"Disabled",
						true
					}, {
						slot_12_30_0.randomize_custom_sliders,
						function()
							local var_41_0 = slot_12_30_0.randomize_custom_sliders.value

							if var_41_0 == 2 then
								return slot_12_43_0 <= 2
							end

							return var_41_0 >= slot_12_43_0 and var_41_0 > 2
						end
					})
				end

				slot_12_30_0.randomize_shuffle_btn = slot_12_38_0:button(arg_12_0.string:format("shuffle", "Shuffle", 2, 5, 2, "\a{Small Text}"), function()
					local var_42_0 = slot_12_30_0.randomize_custom_sliders:get()

					for iter_42_0 = 1, var_42_0 do
						slot_12_30_0["randomize_" .. iter_42_0]:set(math.random(-20, 20))
					end
				end, true):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_30_0.randomize_btn,
					true
				}, {
					slot_12_30_0.yaw_modifier,
					"Disabled",
					true
				}, {
					slot_12_30_0.randomize_custom_sliders,
					function()
						return slot_12_30_0.randomize_custom_sliders.value > 2
					end
				})
				slot_12_30_0.randomize_reset_btn = slot_12_38_0:button(arg_12_0.string:format("trash-can", "Reset", 2, 5, 2, "\a{Small Text}"), function()
					slot_12_30_0.randomize_custom_sliders:set(2)

					for iter_44_0 = 1, 10 do
						slot_12_30_0["randomize_" .. iter_44_0]:set(0)
					end
				end, true):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_30_0.randomize_btn,
					true
				}, {
					slot_12_30_0.yaw_modifier,
					"Disabled",
					true
				}, {
					slot_12_30_0.randomize_custom_sliders,
					function()
						return slot_12_30_0.randomize_custom_sliders.value > 2
					end
				})
				slot_12_30_0.body_yaw = slot_12_6_1:switch(arg_12_0.string:format("rotate", "Body Yaw", 2, 9, 2), true):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				})
				slot_12_39_0 = slot_12_30_0.body_yaw:create()
				slot_12_30_0.body_jitter = slot_12_39_0:switch(arg_12_0.string:format("toggle-large-on", "Jitter", 2, 6, 2), true):depend({
					slot_12_30_0.body_yaw,
					true
				})

				slot_12_30_0.delay_custom_sliders:set_callback(function(arg_46_0)
					slot_12_30_0.body_jitter:disabled(arg_46_0:get() > 0)
				end, true)

				slot_12_30_0.mode = slot_12_39_0:combo(arg_12_0.string:format("split", "Mode", 2, 6, 0), {
					"Static",
					"Ticks",
					"Random"
				}):depend({
					slot_12_30_0.body_yaw,
					true
				})
				slot_12_30_0.mode_ticks = slot_12_39_0:slider(arg_12_0.string:format("⤷", "Ticks", 10, 2, 2), 4, 16, 4, 1, "t"):depend({
					slot_12_30_0.body_yaw,
					true
				}, {
					slot_12_30_0.mode,
					"Ticks"
				})
				slot_12_30_0.mode_random = slot_12_39_0:slider(arg_12_0.string:format("⤷", "Random", 10, 2, 2), 4, 16, 4, 1, "x"):depend({
					slot_12_30_0.body_yaw,
					true
				}, {
					slot_12_30_0.mode,
					"Random"
				})
				slot_12_30_0.limit_mode = slot_12_39_0:combo(arg_12_0.string:format("leaf", "Limit Mode", 2, 6, 2), {
					"Default",
					"Ticks",
					"Random"
				}):depend({
					slot_12_30_0.body_yaw,
					true
				})
				slot_12_30_0.left_limit = slot_12_39_0:slider(arg_12_0.string:format(slot_12_1_0, "Left Limit", 8, 6, 2), 0, 60, 60):depend({
					slot_12_30_0.body_yaw,
					true
				}, {
					slot_12_30_0.limit_mode,
					"Default"
				})
				slot_12_30_0.right_limit = slot_12_39_0:slider(arg_12_0.string:format(slot_12_1_0, "Right Limit", 8, 6, 2), 0, 60, 60):depend({
					slot_12_30_0.body_yaw,
					true
				}, {
					slot_12_30_0.limit_mode,
					"Default"
				})
				slot_12_30_0.tick_slider = slot_12_39_0:slider(arg_12_0.string:format(slot_12_1_0, "Tick", 8, 6, 2), 2, 20, 2, 1, "t"):depend({
					slot_12_30_0.body_yaw,
					true
				}, {
					slot_12_30_0.limit_mode,
					"Ticks"
				})
				slot_12_30_0.from_limit = slot_12_39_0:slider(arg_12_0.string:format(slot_12_1_0, " [1] ", 8, 6, 2), 0, 60, 60):depend({
					slot_12_30_0.body_yaw,
					true
				}, {
					slot_12_30_0.limit_mode,
					function()
						return slot_12_30_0.limit_mode:get() ~= "Default"
					end
				})
				slot_12_30_0.to_limit = slot_12_39_0:slider(arg_12_0.string:format(slot_12_1_0, " [2] ", 8, 6, 2), 0, 60, 60):depend({
					slot_12_30_0.body_yaw,
					true
				}, {
					slot_12_30_0.limit_mode,
					function()
						return slot_12_30_0.limit_mode:get() ~= "Default"
					end
				})
				slot_12_30_0.defensive_choke = slot_12_7_1:combo(arg_12_0.string:format("angles-right", "Choke", 10, 5, 2), {
					"Default",
					"Custom"
				}):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				}, {
					slot_12_14_0.state,
					function()
						return slot_12_14_0.state:get(slot_12_31_0)
					end
				})
				slot_12_40_0 = slot_12_30_0.defensive_choke:create()
				slot_12_30_0.random_choke = slot_12_40_0:switch(arg_12_0.string:format("shuffle", "Randomize", 2, 4, 2, "\a{Small Text}"), false):depend({
					slot_12_30_0.defensive_choke,
					"Custom"
				})
				slot_12_30_0.choke_slider = slot_12_40_0:slider(arg_12_0.string:format("angles-right", "Tick", 10, 2, 2, "\a{Small Text}"), 2, 20, 16, 1, "t"):depend({
					slot_12_30_0.defensive_choke,
					"Custom"
				}, {
					slot_12_30_0.random_choke,
					false
				})
				slot_12_30_0.choke_method = slot_12_40_0:combo(arg_12_0.string:format("bug", "Mode Selection", 2, 5, 2, "\a{Small Text}"), {
					"Random",
					"Ways"
				}):depend({
					slot_12_30_0.defensive_choke,
					"Custom"
				}, {
					slot_12_30_0.random_choke,
					true
				})
				slot_12_30_0.choke_from = slot_12_40_0:slider(arg_12_0.string:format("angles-right", "[1]", 10, 2, 2, "\a{Small Text}"), 2, 20, 16, 1, "t"):depend({
					slot_12_30_0.defensive_choke,
					"Custom"
				}, {
					slot_12_30_0.random_choke,
					true
				}, {
					slot_12_30_0.choke_method,
					"Random"
				})
				slot_12_30_0.choke_to = slot_12_40_0:slider(arg_12_0.string:format("angles-right", "[2]", 10, 2, 2, "\a{Small Text}"), 2, 20, 16, 1, "t"):depend({
					slot_12_30_0.defensive_choke,
					"Custom"
				}, {
					slot_12_30_0.random_choke,
					true
				}, {
					slot_12_30_0.choke_method,
					"Random"
				})
				slot_12_30_0.choke_sliders = slot_12_40_0:slider(arg_12_0.string:format(slot_12_1_0, "Sliders", 15, 5, 0, "\a{Small Text}"), 2, 10, 2):depend({
					slot_12_30_0.defensive_choke,
					"Custom"
				}, {
					slot_12_30_0.random_choke,
					true
				}, {
					slot_12_30_0.choke_method,
					"Ways"
				})

				for iter_12_10 = 1, 10 do
					slot_12_45_0 = iter_12_10
					slot_12_30_0["choke1_" .. iter_12_10] = slot_12_40_0:slider(arg_12_0.string:format("angles-right", iter_12_10, 10 + 5 * iter_12_10, 2, 2, "\a{Small Text}"), 2, 20, 2, 1, "t"):depend({
						slot_12_30_0.defensive_choke,
						"Custom"
					}, {
						slot_12_30_0.random_choke,
						true
					}, {
						slot_12_30_0.choke_method,
						"Ways"
					}, {
						slot_12_30_0.choke_sliders,
						function()
							return slot_12_45_0 <= slot_12_30_0.choke_sliders.value
						end
					})
				end

				slot_12_30_0.randomize_choke_btn = slot_12_40_0:button(arg_12_0.string:format("shuffle", "Shuffle", 2, 5, 2, "\a{Small Text}"), function()
					local var_51_0 = slot_12_30_0.choke_sliders:get()

					for iter_51_0 = 1, var_51_0 do
						slot_12_30_0["choke1_" .. iter_51_0]:set(math.random(1, 15))
					end
				end, true):depend({
					slot_12_30_0.defensive_choke,
					"Custom"
				}, {
					slot_12_30_0.random_choke,
					true
				}, {
					slot_12_30_0.choke_method,
					"Ways"
				})
				slot_12_30_0.reset_choke_btn = slot_12_40_0:button(arg_12_0.string:format("xmark", "Reset", 2, 5, 2), function()
					slot_12_30_0.choke_sliders:set(2)

					for iter_52_0 = 1, 10 do
						slot_12_30_0["choke1_" .. iter_52_0]:set(1)
					end
				end, true):depend({
					slot_12_30_0.defensive_choke,
					"Custom"
				}, {
					slot_12_30_0.random_choke,
					true
				}, {
					slot_12_30_0.choke_method,
					"Ways"
				})
				slot_12_30_0.copy = slot_12_10_1:button(arg_12_0.string:format("file-export", " ", 51, 0, 50, "\a{Small Text}"), nil, true, "Export selected state to clipboard."):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				})
				slot_12_30_0.paste = slot_12_10_1:button(arg_12_0.string:format("file-import", " ", 52, 1, 52, "\a{Small Text}"), nil, true, "Import pasted state from clipboard."):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				})
				slot_12_30_0.forward_btn = slot_12_10_1:button(arg_12_0.string:format("share-all", "Send To Opposite Team", 47, 5, 48, "\a{Small Text}"), nil, true, "Send selected state to next team"):depend({
					slot_12_2_0.conditions,
					slot_12_35_0
				}, {
					slot_12_2_0.teams,
					slot_12_34_0
				})
				slot_12_41_0 = slot_0_1_0.setup(slot_12_30_0, true)

				slot_12_30_0.copy:set_callback(function()
					local var_53_0, var_53_1 = pcall(function()
						return slot_0_3_0.encode(msgpack.pack(slot_12_41_0:save()))
					end)

					if not var_53_0 then
						return
					end

					slot_0_2_0.set(var_53_1)
					cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
				end)
				slot_12_30_0.paste:set_callback(function()
					local var_55_0 = slot_0_2_0.get()

					if not var_55_0 or var_55_0 == "" then
						return
					end

					local var_55_1, var_55_2 = pcall(function()
						return msgpack.unpack(slot_0_3_0.decode(var_55_0))
					end)

					if not var_55_1 or type(var_55_2) ~= "table" then
						return
					end

					slot_12_41_0:load(var_55_2)
					cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
				end)
				slot_12_30_0.forward_btn:set_callback(function()
					local var_57_0 = slot_12_29_0 == "Counter-Terrorists" and "Terrorists" or "Counter-Terrorists"
					local var_57_1 = slot_12_41_0:save()

					slot_0_1_0.setup(slot_12_16_0[slot_12_24_0][var_57_0], true):load(var_57_1)
					cvar.playvol:call("ui\\beepclear", 1)
				end)
			end
		end

		slot_12_2_0.builder = slot_12_16_0
		slot_12_20_0 = {}
		slot_12_21_1 = {}

		for iter_12_11, iter_12_12 in ipairs(slot_12_12_1) do
			if iter_12_11 ~= 8 then
				slot_12_21_1[#slot_12_21_1 + 1] = iter_12_12
			end
		end

		slot_12_20_0.freestanding = slot_12_8_1:switch(arg_12_0.string:format("arrows-turn-to-dots", "Freestanding", 2, 6, 2), false, function(arg_58_0)
			return {
				prefer_manual = arg_58_0:switch(arg_12_0.string:format("gear", "Prefer Manuals", 5, 3, 0, "\a{Small Text}")),
				disablers = arg_58_0:selectable(arg_12_0.string:format("angles-right", "Disablers", 5, 3, 0, "\a{Small Text}"), slot_12_21_1)
			}
		end)
		slot_12_20_0.manuals = slot_12_8_1:combo(arg_12_0.string:format("rotate", "Manual Yaw", 3, 5, 0), {
			"Disabled",
			"Left",
			"Right",
			"Forward"
		})
		slot_12_2_0.hotkeys = slot_12_20_0
		slot_12_21_0 = {
			avoid_backstab = slot_12_9_1:switch(arg_12_0.string:format("sparkles", "Avoid Backstab", 2, 6, 2)),
			safe_head = slot_12_9_1:selectable(arg_12_0.string:format("shield", "Safe Head", 2, 6, 2), {
				"Knife",
				"Zeus x27",
				"Height Difference"
			})
		}

		slot_12_21_0.safe_head:tooltip("\vKnife\r & \vZeus x27\r working only on Air Crouch. \n\n\vHeight Difference\r working automatically when you upper then enemy.")

		slot_12_21_0.warmup_aa = slot_12_9_1:selectable(arg_12_0.string:format("timer", "Warmup AA", 2, 6, 2), {
			"No enemy alive",
			"Warmup"
		}, function(arg_59_0, arg_59_1)
			return {
				pitch = arg_59_0:combo(arg_12_0.string:format(slot_12_1_0, "Pitch", 4, 6, 2, "\a{Small Text}"), {
					"Disabled",
					"Down",
					"Fake Up",
					"Random"
				}):depend({
					arg_59_1,
					true
				}),
				yaw = arg_59_0:combo(arg_12_0.string:format(slot_12_1_0, "Yaw", 4, 6, 2, "\a{Small Text}"), {
					"Spin",
					"Random",
					"L&R"
				}):depend({
					arg_59_1,
					true
				}),
				range = arg_59_0:slider(arg_12_0.string:format("angles-right", "Range", 12, 5, nil, "\a{Small Text}"), 0, 180, 180, "°"):depend({
					arg_59_1,
					true
				}),
				speed = arg_59_0:slider(arg_12_0.string:format("angles-right", "Speed", 12, 5, nil, "\a{Small Text}"), 0, 14, 3, 1, "t"):depend({
					arg_59_1,
					true
				}),
				left_yaw = arg_59_0:slider(arg_12_0.string:format("arrow-left", "Left Offset", 12, 5), -180, 180, 0):depend({
					arg_59_1,
					true
				}),
				right_yaw = arg_59_0:slider(arg_12_0.string:format("arrow-right", "Right Offset", 12, 5), -180, 180, 0):depend({
					arg_59_1,
					true
				})
			}
		end)

		slot_12_21_0.warmup_aa.range:depend({
			slot_12_21_0.warmup_aa.yaw,
			"L&R",
			true
		})
		slot_12_21_0.warmup_aa.speed:depend({
			slot_12_21_0.warmup_aa.yaw,
			"L&R",
			true
		})
		slot_12_21_0.warmup_aa.left_yaw:depend({
			slot_12_21_0.warmup_aa.yaw,
			"L&R"
		})
		slot_12_21_0.warmup_aa.right_yaw:depend({
			slot_12_21_0.warmup_aa.yaw,
			"L&R"
		})

		slot_12_2_0.options = slot_12_21_0
		arg_12_0.elements.angles = slot_12_2_0
		slot_12_3_0 = {}
		slot_12_4_0 = arg_12_0.string:format("leaf", "", 2, 2, 0)
		slot_12_5_0 = slot_0_1_0.create(slot_12_4_0, "Movement", 1)
		slot_12_6_0 = slot_0_1_0.create(slot_12_4_0, "Visuals", 2)
		slot_12_7_0 = slot_0_1_0.create(slot_12_4_0, "Animations", 1)
		slot_12_8_0 = slot_0_1_0.create(slot_12_4_0, "Aimbot", 2)
		slot_12_9_0 = {
			fast_ladder = slot_12_5_0:switch(arg_12_0.string:format("arrow-up-right-dots", "Fast Ladder", 2, 6, 2)),
			no_fall_damage = slot_12_5_0:switch(arg_12_0.string:format("person-falling-burst", "Avoid Fall Damage", 2, 4, 2)),
			fakeduck = slot_12_5_0:label(arg_12_0.string:format("duck", "Fast Duck Features", 2, 6, 2), function(arg_60_0)
				return {
					unlock_speed_fd = arg_60_0:switch(arg_12_0.string:format("rabbit-running", "Unlock Speed", 4, 4, 0, "\a{Small Text}")),
					freezetime_fakeduck = arg_60_0:switch(arg_12_0.string:format("send-back", "Freezetime Allow", 4, 4, 0, "\a{Small Text}"))
				}
			end)
		}
		slot_12_3_0.movement = slot_12_9_0
		slot_12_10_0 = {
			aspect_ratio = slot_12_6_0:slider(arg_12_0.string:format("toggle-large-on", "Aspect Ratio", 2, 6, 2), 50, 200, 177, 1, function(arg_61_0)
				if arg_61_0 == 177 then
					return "16:9"
				elseif arg_61_0 == 133 then
					return "4:3"
				elseif arg_61_0 == 161 then
					return "16:10"
				elseif arg_61_0 == 150 then
					return "3:2"
				elseif arg_61_0 == 125 then
					return "5:4"
				else
					return arg_61_0 .. "%"
				end
			end),
			viewmodel = slot_12_6_0:switch(arg_12_0.string:format("hands-clapping", "Viewmodel", 2, 7), false, function(arg_62_0, arg_62_1)
				return {
					fov = arg_62_0:slider(arg_12_0.string:format(slot_12_1_0, "Field of View", 4, 6, nil, "\a{Small Text}"), 0, 90, math.floor(cvar.viewmodel_fov:float()), 1):depend({
						arg_62_1,
						true
					}),
					axis_x = arg_62_0:slider(arg_12_0.string:format(slot_12_1_0, "Offset X", 4, 6, nil, "\a{Small Text}"), -200, 200, math.floor(cvar.viewmodel_offset_x:float() * 100) / 10, 0.1):depend({
						arg_62_1,
						true
					}),
					axis_y = arg_62_0:slider(arg_12_0.string:format(slot_12_1_0, "Offset Y", 4, 6, nil, "\a{Small Text}"), -200, 200, math.floor(cvar.viewmodel_offset_y:float() * 100) / 10, 0.1):depend({
						arg_62_1,
						true
					}),
					axis_z = arg_62_0:slider(arg_12_0.string:format(slot_12_1_0, "Offset Z", 4, 6, nil, "\a{Small Text}"), -200, 200, math.floor(cvar.viewmodel_offset_z:float() * 100) / 10, 0.1):depend({
						arg_62_1,
						true
					}),
					opposite_knife_hand = arg_62_0:switch(arg_12_0.string:format("angles-right", "Knife in opposite hand", 4, 6, 0, "\a{Small Text}")):depend({
						arg_62_1,
						true
					})
				}
			end),
			manual_arrows = slot_12_6_0:switch(arg_12_0.string:format("wand-magic-sparkles", "Manual Arrows", 2, 6), false, function(arg_63_0, arg_63_1)
				return {
					font = arg_63_0:combo(arg_12_0.string:format("lasso-sparkles", "Font", 4, 6, nil, "\a{Small Text}"), {
						"Default",
						"Small",
						"Console",
						"Bold"
					}):depend({
						arg_63_1,
						true
					}),
					left_letter = arg_63_0:input(arg_12_0.string:format(slot_12_1_0, "Left Symbol", 6, 4, nil, "\a{Small Text}"), "<"):depend({
						arg_63_1,
						true
					}),
					right_letter = arg_63_0:input(arg_12_0.string:format(slot_12_1_0, "Right Symbol", 6, 4, nil, "\a{Small Text}"), ">"):depend({
						arg_63_1,
						true
					}),
					forward_letter = arg_63_0:input(arg_12_0.string:format(slot_12_1_0, "Forward Symbol", 6, 4, nil, "\a{Small Text}"), "^"):depend({
						arg_63_1,
						true
					}),
					col = arg_63_0:color_picker(arg_12_0.string:format(slot_12_1_0, "Color", 6, 4, nil, "\a{Small Text}"), color(255)):depend({
						arg_63_1,
						true
					}),
					offset = arg_63_0:slider(arg_12_0.string:format("slider", "\a{Small Text}Distance", 20, 4, nil, "\a{Small Text}"), 0, 150, 75):depend({
						arg_63_1,
						true
					})
				}
			end),
			keep_model_transparency = slot_12_6_0:switch(arg_12_0.string:format("transporter-1", "Keep Model Transparency", 3, 6, nil)),
			hit_marker = slot_12_6_0:selectable(arg_12_0.string:format("paintbrush-fine", "Hit Marker", 2, 6), {
				"2D",
				"3D"
			}, function(arg_64_0, arg_64_1)
				return {
					duration_time = arg_64_0:slider(arg_12_0.string:format("angles-right", "Duration", 12, 6, nil, "\a{Small Text}"), 1, 100, 20, 0.1, "s"):depend({
						arg_64_1,
						true
					}),
					color_2d = arg_64_0:color_picker(arg_12_0.string:format("angles-right", "Color 2D", 12, 6, nil, "\a{Small Text}"), {
						["3D"] = {
							color(255, 255, 255, 255)
						},
						["2D"] = {
							color(255, 255, 255, 255)
						}
					}):depend({
						arg_64_1,
						true
					})
				}
			end),
			scope_overlay = slot_12_6_0:switch(arg_12_0.string:format("crosshairs-simple", "Scope Overlay", 2, 6), false, function(arg_65_0, arg_65_1)
				return {
					color = arg_65_0:color_picker(arg_12_0.string:format(slot_12_1_0, "Color", 4, 6), {
						Simple = {
							color(255, 255, 255, 255)
						}
					}):depend({
						arg_65_1,
						true
					}),
					length = arg_65_0:slider(arg_12_0.string:format(slot_12_1_0, "Length", 4, 6), 5, 300, 200):depend({
						arg_65_1,
						true
					}),
					offset = arg_65_0:slider(arg_12_0.string:format(slot_12_1_0, "Gap", 4, 6), 1, 100, 5):depend({
						arg_65_1,
						true
					})
				}
			end),
			dmg_indicator = slot_12_6_0:switch(arg_12_0.string:format("layer-plus", "Damage Indicator", 2, 6), false, function(arg_66_0, arg_66_1)
				return {
					mode = arg_66_0:combo(arg_12_0.string:format("angles-right", "Render mode", 4, 7, nil, "\a{Small Text}"), {
						"Default",
						"Advanced"
					}):depend({
						arg_66_1,
						true
					})
				}
			end)
		}
		slot_12_3_0.visuals = slot_12_10_0
		slot_12_11_0 = {
			jitter_legs = slot_12_7_0:switch(arg_12_0.string:format("user-ninja", "Jitter Legs", 2, 6, 0), false, function(arg_67_0, arg_67_1)
				return {
					mode = arg_67_0:combo(arg_12_0.string:format("shuffle", "Anim variance", 6, 6, 0), {
						"Default",
						"Skeet"
					}):depend({
						arg_67_1,
						true
					}),
					skeet_animfix = arg_67_0:switch(arg_12_0.string:format("angles-right", "Enable Skeet Jitter Legs", 20, 10, 0, "\a{Small Text}")):depend({
						arg_67_1,
						true
					}),
					enable = arg_67_0:switch(arg_12_0.string:format("angles-right", "Enable Default Jitter", 20, 10, 0, "\a{Small Text}")):depend({
						arg_67_1,
						true
					}),
					from = arg_67_0:slider(arg_12_0.string:format("angles-right", "[1]", 20, 10, 0, "\a{Small Text}"), 0, 100, 10, 0.01, "x"):depend({
						arg_67_1,
						true
					}),
					to = arg_67_0:slider(arg_12_0.string:format("angles-right", "[2]", 20, 10, 0, "\a{Small Text}"), 0, 100, 90, 0.01, "x"):depend({
						arg_67_1,
						true
					})
				}
			end)
		}

		slot_12_11_0.jitter_legs.skeet_animfix:depend({
			slot_12_11_0.jitter_legs.mode,
			"Skeet"
		})
		slot_12_11_0.jitter_legs.enable:depend({
			slot_12_11_0.jitter_legs.mode,
			"Default"
		})
		slot_12_11_0.jitter_legs.from:depend({
			slot_12_11_0.jitter_legs.enable,
			true
		}, {
			slot_12_11_0.jitter_legs.mode,
			"Default"
		})
		slot_12_11_0.jitter_legs.to:depend({
			slot_12_11_0.jitter_legs.enable,
			true
		}, {
			slot_12_11_0.jitter_legs.mode,
			"Default"
		})

		slot_12_11_0.interpolating = slot_12_7_0:switch(arg_12_0.string:format("seedling", "Interpolating", 2, 6, 0), false, function(arg_68_0, arg_68_1)
			return {
				slider = arg_68_0:slider(arg_12_0.string:format("angles-right", "Value", 4, 6, nil, "\a{Small Text}"), 0, 14, 9, 1, function(arg_69_0)
					if arg_69_0 == 0 then
						return "Default"
					elseif arg_69_0 == 4 then
						return "Low"
					elseif arg_69_0 == 9 then
						return "High"
					elseif arg_69_0 == 14 then
						return "Max."
					else
						return arg_69_0 .. "t"
					end
				end):depend({
					arg_68_1,
					true
				})
			}
		end)
		slot_12_11_0.leaning = slot_12_7_0:slider(arg_12_0.string:format("person-burst", "Leaning", 2, 6, 0), 0, 100, 0, 1, function(arg_70_0)
			if arg_70_0 == 0 then
				return "Default"
			elseif arg_70_0 == 25 then
				return "Low"
			elseif arg_70_0 == 50 then
				return "Medium"
			elseif arg_70_0 == 75 then
				return "High"
			elseif arg_70_0 == 100 then
				return "Max"
			else
				return arg_70_0 .. "%"
			end
		end)
		slot_12_11_0.falling = slot_12_7_0:slider(arg_12_0.string:format("person-falling-burst", "Falling", 2, 6, 0), 0, 100, 0, 1, function(arg_71_0)
			if arg_71_0 == 0 then
				return "Default"
			elseif arg_71_0 == 50 then
				return "Force"
			elseif arg_71_0 == 100 then
				return "Max"
			else
				return arg_71_0 .. "%"
			end
		end)
		slot_12_3_0.animations = slot_12_11_0
		slot_12_12_0 = {
			log_event = slot_12_8_0:switch(arg_12_0.string:format("bell-exclamation", "Log Events", 2, 6), false, function(arg_72_0, arg_72_1)
				return {
					color = arg_72_0:color_picker(arg_12_0.string:format("angles-right", "Color Logs", 4, 6, nil, "\a{Small Text}"), {
						Prefix = {
							color("#CAC1F2FF")
						},
						["Main text"] = {
							color("#BABABAFF")
						}
					}):depend({
						arg_72_1,
						true
					}),
					purchases = arg_72_0:switch(arg_12_0.string:format("bag-shopping", "Purchase", 4, 6, nil, "\a{Small Text}")):depend({
						arg_72_1,
						true
					}),
					damage_dealt = arg_72_0:switch(arg_12_0.string:format("bone-break", "Damage Logs", 4, 6, nil, "\a{Small Text}")):depend({
						arg_72_1,
						true
					})
				}
			end),
			ping_spike_unlock = slot_12_8_0:switch(arg_12_0.string:format("unlock", "Unlock Fake Latency", 2, 6)),
			super_toss = slot_12_8_0:switch(arg_12_0.string:format("brackets-curly", "Super Toss", 1, 5)),
			notifications = slot_12_8_0:switch(arg_12_0.string:format("bell", "Notifications", 2, 6, 2), false, function(arg_73_0, arg_73_1)
				return {
					hit_color = arg_73_0:color_picker(arg_12_0.string:format(slot_12_1_0, "Hit Color", 4, 6, nil, "\a{Small Text}"), color(100, 220, 100, 255)):depend({
						arg_73_1,
						true
					}),
					miss_color = arg_73_0:color_picker(arg_12_0.string:format(slot_12_1_0, "Miss Color", 4, 6, nil, "\a{Small Text}"), color(220, 100, 100, 255)):depend({
						arg_73_1,
						true
					}),
					warning_color = arg_73_0:color_picker(arg_12_0.string:format(slot_12_1_0, "Warning Color", 4, 6, nil, "\a{Small Text}"), color(220, 180, 50, 255)):depend({
						arg_73_1,
						true
					})
				}
			end):disabled(true)
		}
		slot_12_3_0.aimbot = slot_12_12_0
		arg_12_0.elements.misc = slot_12_3_0
	end
}):struct("presets")({
	utf8_len = function(arg_74_0, arg_74_1)
		local var_74_0, var_74_1 = arg_74_1:gsub("[^\x80-\xC1]", "")

		return var_74_1
	end,
	clean_name = function(arg_75_0, arg_75_1)
		return (arg_75_1:gsub("[%z\x01-\x1F]", ""):gsub("{.-}", ""):match("^%s*(.-)%s*$") or ""):gsub("^DEFAULT", ""):match("^%s*(.-)%s*$") or ""
	end,
	is_system_preset = function(arg_76_0, arg_76_1)
		for iter_76_0, iter_76_1 in ipairs(arg_76_0.system_presets) do
			if arg_76_1 == iter_76_1 then
				return true
			end
		end

		return false
	end,
	is_separator = function(arg_77_0, arg_77_1)
		return arg_77_1 == arg_77_0.separator
	end,
	save_database = function(arg_78_0)
		db.godsense_new666 = arg_78_0.database
	end,
	update = function(arg_79_0)
		local var_79_0 = {}

		for iter_79_0 in pairs(arg_79_0.database) do
			if not arg_79_0:is_system_preset(iter_79_0) then
				var_79_0[#var_79_0 + 1] = iter_79_0
			end
		end

		table.sort(var_79_0)

		local var_79_1 = {}

		for iter_79_1, iter_79_2 in ipairs(arg_79_0.system_presets) do
			var_79_1[#var_79_1 + 1] = iter_79_2
		end

		if #var_79_0 > 0 then
			var_79_1[#var_79_1 + 1] = arg_79_0.separator
		end

		for iter_79_3, iter_79_4 in ipairs(var_79_0) do
			var_79_1[#var_79_1 + 1] = iter_79_4
		end

		arg_79_0.menu.elements.preset_list:update(var_79_1)
	end,
	disabler = function(arg_80_0)
		local var_80_0 = arg_80_0.menu.elements.preset_list
		local var_80_1 = var_80_0:list()[var_80_0:get()]
		local var_80_2 = arg_80_0:is_system_preset(var_80_1 or "")
		local var_80_3 = arg_80_0:is_separator(var_80_1 or "")
		local var_80_4 = var_80_2 or var_80_3
		local var_80_5 = arg_80_0.menu.elements.preset_buttons

		var_80_5.save:disabled(var_80_4)
		var_80_5.delete:disabled(var_80_4)
		var_80_5.import:disabled(var_80_4)
		var_80_5.export:disabled(var_80_4)
		var_80_5.load:disabled(var_80_3)
	end,
	make_setup = function(arg_81_0)
		local var_81_0 = {
			preset_input = true,
			preset_list = true,
			preset_buttons = true
		}
		local var_81_1 = {}

		for iter_81_0, iter_81_1 in pairs(arg_81_0.menu.elements) do
			if not var_81_0[iter_81_0] then
				var_81_1[iter_81_0] = iter_81_1
			end
		end

		local var_81_2 = {
			var_81_1
		}

		table.insert(var_81_2, arg_81_0.menu.elements.misc)

		local var_81_3 = arg_81_0.globals.statements.states
		local var_81_4 = arg_81_0.globals.statements.teams
		local var_81_5 = arg_81_0.menu.elements.angles.builder

		for iter_81_2, iter_81_3 in ipairs(var_81_3) do
			for iter_81_4, iter_81_5 in ipairs(var_81_4) do
				local var_81_6 = var_81_5[iter_81_3] and var_81_5[iter_81_3][iter_81_5]

				if var_81_6 then
					var_81_2[#var_81_2 + 1] = var_81_6
				end
			end
		end

		return slot_0_1_0.setup(var_81_2, true)
	end,
	_event = function(arg_82_0, arg_82_1, arg_82_2)
		common.add_event(arg_82_1, arg_82_2 or "check")
		cvar.playvol:call(arg_82_2 == "ban" and "ui\\weapon_cant_buy" or "ui\\beepclear", 1)
	end,
	save = function(arg_83_0)
		local var_83_0 = arg_83_0.menu.elements.preset_list
		local var_83_1 = var_83_0:list()[var_83_0:get()]

		if not var_83_1 or var_83_1 == "" then
			arg_83_0:_event("Invalid preset name", "ban")

			return
		end

		if arg_83_0:is_system_preset(var_83_1) then
			arg_83_0:_event("Cannot modify system preset", "ban")

			return
		end

		local var_83_2, var_83_3 = pcall(function()
			local var_84_0 = arg_83_0:make_setup():save()
			local var_84_1 = arg_83_0.menu.elements.watermark_gear

			var_84_0.__watermark_x = var_84_1.pos_x:get()
			var_84_0.__watermark_y = var_84_1.pos_y:get()

			return slot_0_3_0.encode(msgpack.pack(var_84_0))
		end)

		if not var_83_2 or not var_83_3 then
			arg_83_0:_event("Failed to save. (Encode error)", "ban")

			return
		end

		arg_83_0.database[var_83_1] = var_83_3

		arg_83_0:save_database()
		arg_83_0:_event("Preset saved successfully", "check")
		arg_83_0:update()

		for iter_83_0, iter_83_1 in ipairs(arg_83_0.menu.elements.preset_list:list()) do
			if iter_83_1 == var_83_1 then
				arg_83_0.menu.elements.preset_list:set(iter_83_0)

				break
			end
		end
	end,
	load = function(arg_85_0)
		local var_85_0 = arg_85_0.menu.elements.preset_list
		local var_85_1 = var_85_0:list()[var_85_0:get()]

		if not var_85_1 or not arg_85_0.database[var_85_1] then
			arg_85_0:_event("Failed to load. (Preset not found)", "ban")

			return
		end

		local var_85_2, var_85_3 = pcall(function()
			local var_86_0 = arg_85_0:make_setup()
			local var_86_1 = slot_0_3_0.decode(arg_85_0.database[var_85_1])
			local var_86_2 = msgpack.unpack(var_86_1)
			local var_86_3 = arg_85_0.menu.elements.watermark_gear

			if var_86_2 and var_86_2.__watermark_x then
				var_86_3.pos_x:set(var_86_2.__watermark_x)
				var_86_3.pos_y:set(var_86_2.__watermark_y)

				db.godsense_watermark_x = var_86_2.__watermark_x
				db.godsense_watermark_y = var_86_2.__watermark_y
			else
				local var_86_4 = render.screen_size()
				local var_86_5 = var_86_3.input:get() or ""
				local var_86_6 = var_86_3.font:get()
				local var_86_7 = ({
					Pixel = 2,
					Console = 3,
					Bold = 4,
					Default = 1
				})[var_86_6] or 1

				if var_86_6 == "Pixel" then
					var_86_5 = var_86_5:upper()
				end

				local var_86_8 = render.measure_text(var_86_7, "c", var_86_5)
				local var_86_9 = var_86_4.x * 0.5
				local var_86_10 = var_86_4.y - var_86_8.y * 0.5 - 8

				var_86_3.pos_x:set(var_86_9)
				var_86_3.pos_y:set(var_86_10)

				db.godsense_watermark_x = var_86_9
				db.godsense_watermark_y = var_86_10
			end

			if var_86_2 then
				var_86_2.__watermark_x = nil
				var_86_2.__watermark_y = nil
			end

			var_86_0:load(var_86_2 or {})
		end)

		if not var_85_2 then
			arg_85_0:_event("Failed to load. (" .. tostring(var_85_3) .. ")", "ban")

			return
		end

		arg_85_0:_event("Preset loaded successfully", "check")
	end,
	delete = function(arg_87_0)
		local var_87_0 = arg_87_0.menu.elements.preset_list
		local var_87_1 = var_87_0:list()[var_87_0:get()]

		if not var_87_1 or var_87_1 == "" then
			arg_87_0:_event("Invalid selection", "ban")

			return
		end

		if arg_87_0:is_system_preset(var_87_1) then
			arg_87_0:_event("Cannot delete system preset", "ban")

			return
		end

		if not arg_87_0.database[var_87_1] then
			arg_87_0:_event("Preset doesn't exist", "ban")

			return
		end

		arg_87_0.database[var_87_1] = nil

		arg_87_0:save_database()
		arg_87_0:_event("Preset deleted successfully", "check")
		arg_87_0:update()
	end,
	export = function(arg_88_0)
		local var_88_0 = arg_88_0.menu.elements.preset_list
		local var_88_1 = var_88_0:list()[var_88_0:get()]

		if not var_88_1 then
			arg_88_0:_event("No preset selected", "ban")

			return
		end

		local var_88_2 = arg_88_0.database[var_88_1]

		if not var_88_2 or var_88_2 == "" then
			arg_88_0:_event("Preset has no data to export", "ban")

			return
		end

		slot_0_2_0.set(var_88_2)
		arg_88_0:_event("Preset exported to clipboard", "check")
	end,
	import = function(arg_89_0)
		local var_89_0 = slot_0_2_0.get()

		if not var_89_0 or var_89_0 == "" then
			arg_89_0:_event("Clipboard is empty", "ban")

			return
		end

		local var_89_1 = arg_89_0.menu.elements.preset_input:get()

		if not var_89_1 or var_89_1 == "" then
			arg_89_0:_event("Please enter a name for the imported preset", "ban")

			return
		end

		if arg_89_0:is_system_preset(var_89_1) then
			arg_89_0:_event("Cannot import to system preset", "ban")

			return
		end

		if not pcall(function()
			local var_90_0 = msgpack.unpack(slot_0_3_0.decode(var_89_0))

			assert(type(var_90_0) == "table", "not a table")
		end) then
			arg_89_0:_event("Failed to import. (Invalid preset format)", "ban")

			return
		end

		arg_89_0.database[var_89_1] = var_89_0

		arg_89_0:save_database()
		arg_89_0:_event("Imported successfully", "check")
		arg_89_0:update()

		for iter_89_0, iter_89_1 in ipairs(arg_89_0.menu.elements.preset_list:list()) do
			if iter_89_1 == var_89_1 then
				arg_89_0.menu.elements.preset_list:set(iter_89_0)

				break
			end
		end

		arg_89_0:disabler()
	end,
	init = function(arg_91_0)
		local var_91_0 = "•"

		arg_91_0.system_presets = {
			arg_91_0.string:format("", "\a{Link Active}Advanced " .. var_91_0, 0, 0, 0),
			arg_91_0.string:format("", "\a{Link Active}Agressive " .. var_91_0, 0, 0, 0),
			arg_91_0.string:format("", "\a{Link Active}Experemental " .. var_91_0, 0, 0, 0)
		}
		arg_91_0.separator = arg_91_0.string:format("", string.rep("─", 39), 0, 0, 0)
		arg_91_0.database = db.godsense_new666 or {}

		for iter_91_0, iter_91_1 in ipairs(arg_91_0.system_presets) do
			if arg_91_0.database[iter_91_1] and arg_91_0.database[iter_91_1] ~= "" and not pcall(function()
				msgpack.unpack(slot_0_3_0.decode(arg_91_0.database[iter_91_1]))
			end) then
				arg_91_0.database[iter_91_1] = nil
			end
		end

		local var_91_1 = {
			"",
			"",
			""
		}

		for iter_91_2, iter_91_3 in ipairs(arg_91_0.system_presets) do
			if not arg_91_0.database[iter_91_3] then
				arg_91_0.database[iter_91_3] = var_91_1[iter_91_2]
			end
		end

		utils.execute_after(0.1, function()
			arg_91_0.menu.elements.preset_input:set("")
			arg_91_0:update()

			local var_93_0 = arg_91_0.menu.elements.preset_buttons

			var_93_0.create:set_callback(function()
				local var_94_0 = arg_91_0.menu.elements.preset_input:get()

				if not var_94_0 or var_94_0 == "" then
					arg_91_0:_event("Invalid preset name", "ban")

					return
				end

				if arg_91_0:utf8_len(var_94_0) < 2 or arg_91_0:utf8_len(var_94_0) > 20 then
					arg_91_0:_event("Preset name must be between 2 and 20 characters", "ban")

					return
				end

				if arg_91_0:is_system_preset(var_94_0) then
					arg_91_0:_event("Cannot modify system preset", "ban")

					return
				end

				local var_94_1 = var_94_0:lower()

				for iter_94_0, iter_94_1 in ipairs(arg_91_0.system_presets) do
					if var_94_1 == arg_91_0:clean_name(iter_94_1):lower() then
						arg_91_0:_event("Cannot use system preset name", "ban")

						return
					end
				end

				if arg_91_0.database[var_94_0] then
					arg_91_0:_event("Preset already exists, use Save to overwrite", "ban")

					return
				end

				local var_94_2, var_94_3 = pcall(function()
					return slot_0_3_0.encode(msgpack.pack({}))
				end)

				if not var_94_2 then
					arg_91_0:_event("Failed to create. (Encode error)", "ban")

					return
				end

				arg_91_0.database[var_94_0] = var_94_3

				arg_91_0:save_database()

				local var_94_4 = arg_91_0.menu.elements.watermark_gear
				local var_94_5 = render.screen_size()
				local var_94_6 = var_94_4.input:get() or ""
				local var_94_7 = var_94_4.font:get()
				local var_94_8 = ({
					Pixel = 2,
					Console = 3,
					Bold = 4,
					Default = 1
				})[var_94_7] or 1

				if var_94_7 == "Pixel" then
					var_94_6 = var_94_6:upper()
				end

				local var_94_9 = render.measure_text(var_94_8, "c", var_94_6)
				local var_94_10 = var_94_5.x * 0.5
				local var_94_11 = var_94_5.y - var_94_9.y * 0.5 - 8

				var_94_4.pos_x:set(var_94_10)
				var_94_4.pos_y:set(var_94_11)

				db.godsense_watermark_x = var_94_10
				db.godsense_watermark_y = var_94_11

				arg_91_0:_event("Preset created successfully", "check")
				arg_91_0:update()

				for iter_94_2, iter_94_3 in ipairs(arg_91_0.menu.elements.preset_list:list()) do
					if iter_94_3 == var_94_0 then
						arg_91_0.menu.elements.preset_list:set(iter_94_2)

						break
					end
				end

				arg_91_0:disabler()
			end)
			var_93_0.save:set_callback(function()
				local var_96_0 = arg_91_0.menu.elements.preset_list
				local var_96_1 = var_96_0:list()[var_96_0:get()]

				if not var_96_1 or arg_91_0:is_separator(var_96_1) or arg_91_0:is_system_preset(var_96_1) then
					arg_91_0:_event("Select a user preset to overwrite", "ban")

					return
				end

				if not arg_91_0.database[var_96_1] then
					arg_91_0:_event("Preset doesn't exist, use Create instead", "ban")

					return
				end

				var_93_0.save_switch:set(true)
			end)
			var_93_0.save_confirm:set_callback(function()
				arg_91_0:save()
				var_93_0.save_switch:set(false)
			end)
			var_93_0.save_cancel:set_callback(function()
				var_93_0.save_switch:set(false)
				cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
			end)
			var_93_0.delete_confirm:set_callback(function()
				arg_91_0:delete()
				var_93_0.hidden_switch:set(false)
			end)
			var_93_0.delete_cancel:set_callback(function()
				var_93_0.hidden_switch:set(false)
				cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
			end)
			var_93_0.load:set_callback(function()
				arg_91_0:load()
			end)
			var_93_0.export:set_callback(function()
				arg_91_0:export()
			end)
			var_93_0.import:set_callback(function()
				arg_91_0:import()
			end)
			arg_91_0.menu.elements.preset_list:set_callback(function()
				arg_91_0:disabler()

				local var_104_0 = arg_91_0.menu.elements.preset_list
				local var_104_1 = var_104_0:list()[var_104_0:get()]

				if not var_104_1 then
					cvar.playvol:call("ui\\weapon_cant_buy", 1)

					return
				end

				cvar.playvol:call("ui\\csgo_ui_contract_type1", 1)
				arg_91_0.menu.elements.preset_input:set(arg_91_0:clean_name(var_104_1))
			end)
		end)
		events.shutdown:set(function()
			db.godsense_new666 = arg_91_0.database
		end)
	end
}):struct("context")({
	create = function(arg_106_0)
		local var_106_0 = arg_106_0.globals.reference
		local var_106_1 = {
			reset = function(arg_107_0)
				arg_107_0.enabled = nil
				arg_107_0.pitch = nil
				arg_107_0.yaw = nil
				arg_107_0.yaw_offset = nil
				arg_107_0.yaw_base = nil
				arg_107_0.yaw_modifier = nil
				arg_107_0.modifier_offset = nil
				arg_107_0.left_limit = nil
				arg_107_0.right_limit = nil
				arg_107_0.body_yaw = nil
				arg_107_0.body_yaw_options = nil
				arg_107_0.disable_yaw_modifiers = nil
				arg_107_0.body_freestanding = nil
				arg_107_0.freestanding = nil
				arg_107_0.freestand_peek = nil
				arg_107_0.lag_options = nil
				arg_107_0.hs_options = nil
				arg_107_0.avoid_backstab = nil
				arg_107_0.ignore_inverter = false
			end,
			run = function(arg_108_0)
				local var_108_0 = var_106_0.antiaim.angles

				var_108_0.enabled:override(arg_108_0.enabled or true)
				var_108_0.pitch:override(arg_108_0.pitch or "Disabled")
				var_108_0.yaw:override(arg_108_0.yaw or "Disabled")
				var_108_0.yaw_add:override(arg_108_0.yaw_offset or 0)
				var_108_0.yaw_base:override(arg_108_0.yaw_base or "Local View")
				var_108_0.yaw_modifier:override(arg_108_0.yaw_modifier or "Disabled")
				var_108_0.modifier_offset:override(arg_108_0.modifier_offset or 0)
				var_108_0.left_limit:override(arg_108_0.left_limit or 0)
				var_108_0.right_limit:override(arg_108_0.right_limit or 0)
				var_108_0.body_yaw:override(arg_108_0.body_yaw or false)
				var_108_0.options:override(arg_108_0.body_yaw_options or {})
				var_108_0.disable_yaw_modifiers:override(arg_108_0.disable_yaw_modifiers or false)
				var_108_0.body_freestanding:override(arg_108_0.body_freestanding or false)
				var_108_0.freestanding:override(arg_108_0.freestanding or false)
				var_108_0.freestand_peek:override(arg_108_0.freestand_peek or "Off")
				var_106_0.rage.main.double_tap_lag_options:override(arg_108_0.lag_options or "On Peek")
				var_106_0.rage.main.hide_shots_options:override(arg_108_0.hs_options or "Favor Fire Rate")
				var_108_0.avoid_backstab:override(arg_108_0.avoid_backstab or false)
			end
		}

		for iter_106_0, iter_106_1 in pairs(var_106_0.antiaim.angles) do
			iter_106_1:override()
		end

		return setmetatable({}, {
			__index = var_106_1
		})
	end
}):struct("builder")({
	switch_delay = 0,
	switch = false,
	last_flick = 0,
	max_angle_variation = 15,
	current_modifier_slider = 1,
	current_slider = 1,
	body_ticks = 0,
	current_side = false,
	_flippers = {},
	_team_map = {
		[2] = "Terrorists",
		[3] = "Counter-Terrorists"
	},
	init = function(arg_109_0)
		local var_109_0 = arg_109_0.context:create()

		events.createmove(function(arg_110_0)
			var_109_0:reset()
			arg_109_0:createmove(arg_110_0, var_109_0)
			var_109_0:run()
		end)
		events.player_death(function(arg_111_0)
			local var_111_0 = entity.get_local_player()

			if var_111_0 and entity.get(arg_111_0.userid, true) == var_111_0 then
				arg_109_0._flippers = {}
			end
		end)
		events.round_start(function()
			arg_109_0._flippers = {}
		end)
	end,
	add_yaw_randomization = function(arg_113_0, arg_113_1, arg_113_2, arg_113_3, arg_113_4)
		if arg_113_2 <= 0 then
			return arg_113_1
		end

		local var_113_0 = arg_113_1 + (math.random() * 2 - 1) * arg_113_0.max_angle_variation * (arg_113_2 / 100)

		if arg_113_3 and arg_113_4 then
			var_113_0 = math.min(math.max(var_113_0, arg_113_3), arg_113_4)
		end

		return var_113_0
	end,
	current_state = function(arg_114_0, arg_114_1, arg_114_2)
		local var_114_0 = arg_114_1:get_anim_state()

		if not var_114_0 then
			return
		end

		local var_114_1 = arg_114_1.m_flDuckAmount
		local var_114_2 = arg_114_1.m_vecVelocity:length2d()
		local var_114_3 = var_114_0.on_ground and not var_114_0.landed_on_ground_this_frame

		if arg_114_0.manual_yaw:think() then
			return "Manuals", 9
		end

		if arg_114_0.freestanding:think(arg_114_1, arg_114_2) then
			return "Freestanding", 8
		end

		if arg_114_0.safe_head:think(var_114_3, var_114_1) then
			return "Safe Head"
		end

		if var_114_3 then
			if arg_114_0.globals.reference.antiaim.misc.slow_walk:get() then
				return "Walking", 3
			end

			if var_114_2 < 5 then
				if var_114_1 > 0 then
					return "Crouching", 4
				end

				return "Standing", 1
			else
				if var_114_1 > 0 then
					return "Sneaking", 5
				end

				return "Running", 2
			end
		end

		if var_114_1 > 0 then
			return "Air Crouching", 7
		end

		return "Air", 6
	end,
	get_flipper = function(arg_115_0, arg_115_1)
		if not arg_115_0._flippers[arg_115_1] then
			arg_115_0._flippers[arg_115_1] = {
				last_flip = 0,
				packets = 0,
				state = false
			}
		end

		return arg_115_0._flippers[arg_115_1]
	end,
	yaw = function(arg_116_0, arg_116_1, arg_116_2, arg_116_3, arg_116_4, arg_116_5, arg_116_6)
		local var_116_0 = arg_116_3.yaw:get()
		local var_116_1 = arg_116_3.yaw_offset:get()

		if var_116_0 == 0 then
			arg_116_2.yaw_offset = var_116_1

			return
		end

		local var_116_2 = arg_116_3.left_yaw:get()
		local var_116_3 = arg_116_3.right_yaw:get()
		local var_116_4 = arg_116_3.yaw_randomize:get()
		local var_116_5 = arg_116_3.delay_custom_sliders:get()
		local var_116_6 = (arg_116_5 or "x") .. "_" .. (arg_116_6 or "x")
		local var_116_7 = arg_116_0:get_flipper(var_116_6)

		if var_116_5 > 0 then
			if arg_116_1.choked_commands == 0 then
				var_116_7.packets = var_116_7.packets + 1

				local var_116_8

				if var_116_5 == 1 then
					var_116_8 = arg_116_3.delay_1:get()
				elseif var_116_5 == 2 then
					var_116_8 = math.random(arg_116_3.delay_1:get(), arg_116_3.delay_2:get())
				else
					var_116_8 = arg_116_3["delay_" .. math.random(1, var_116_5)]:get()
				end

				if var_116_8 <= var_116_7.packets - var_116_7.last_flip then
					if arg_116_3.delay_chance:get() then
						if math.random(100) <= arg_116_3.delay_chance_amount:get() then
							var_116_7.state = not var_116_7.state
						end
					else
						var_116_7.state = not var_116_7.state
					end

					var_116_7.last_flip = var_116_7.packets
				end
			end

			rage.antiaim:inverter(var_116_7.state)

			arg_116_2.yaw_offset = arg_116_0:add_yaw_randomization(var_116_7.state and var_116_2 or var_116_3, var_116_4, -180, 180)
		else
			local var_116_9 = arg_116_4.m_flPoseParameter[11] * 120 - 60 > 0

			arg_116_2.yaw_offset = arg_116_0:add_yaw_randomization(var_116_9 and var_116_2 or var_116_3, var_116_4, -180, 180)
		end
	end,
	modifier = function(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
		arg_117_2.yaw_modifier = arg_117_3.yaw_modifier:get()

		if not arg_117_3.randomize_btn:get() then
			arg_117_2.modifier_offset = arg_117_3.modifier_offset:get()

			return
		end

		local var_117_0 = arg_117_3.randomize_custom_sliders:get()
		local var_117_1 = var_117_0 == 2 and math.random(1, 2) or math.random(1, var_117_0)

		arg_117_2.modifier_offset = arg_117_3["randomize_" .. var_117_1]:get()
	end,
	body = function(arg_118_0, arg_118_1, arg_118_2, arg_118_3)
		local var_118_0 = arg_118_3.body_yaw:get()
		local var_118_1 = arg_118_3.left_limit:get()
		local var_118_2 = arg_118_3.right_limit:get()
		local var_118_3 = arg_118_3.limit_mode:get()
		local var_118_4 = arg_118_3.mode:get()
		local var_118_5 = arg_118_3.mode_ticks:get()
		local var_118_6 = arg_118_3.mode_random:get()
		local var_118_7 = arg_118_3.from_limit:get()
		local var_118_8 = arg_118_3.to_limit:get()

		if not arg_118_0.globals.reference.antiaim.misc.fake_duck:get() then
			if var_118_4 == "Ticks" then
				var_118_0 = globals.tickcount % var_118_5 > 1
			elseif var_118_4 == "Random" then
				var_118_0 = utils.random_int(0, var_118_6) == var_118_6
			end
		end

		arg_118_2.body_yaw = var_118_0
		arg_118_2.body_yaw_options = arg_118_3.body_jitter:get() and "Jitter" or ""

		if var_118_3 == "Ticks" then
			local var_118_9 = globals.tickcount % arg_118_3.tick_slider:get() > 1

			var_118_1 = var_118_9 and var_118_7 or var_118_8
			var_118_2 = var_118_9 and var_118_7 or var_118_8
		elseif var_118_3 == "Random" then
			var_118_1 = utils.random_int(0, 1) == 1 and var_118_7 or var_118_8
			var_118_2 = utils.random_int(0, 1) == 1 and var_118_7 or var_118_8
		end

		arg_118_2.left_limit = var_118_1
		arg_118_2.right_limit = var_118_2
	end,
	createmove = function(arg_119_0, arg_119_1, arg_119_2)
		local var_119_0 = entity.get_local_player()

		if not var_119_0 or not var_119_0:is_alive() then
			return
		end

		local var_119_1 = arg_119_0._team_map[var_119_0.m_iTeamNum]

		if not var_119_1 then
			return
		end

		local var_119_2, var_119_3 = arg_119_0:current_state(var_119_0, arg_119_1)

		if not var_119_2 then
			return
		end

		if var_119_2 == "Safe Head" then
			arg_119_0.safe_head:createmove(arg_119_2)

			return
		end

		local var_119_4 = arg_119_0.menu.elements.angles.builder[var_119_2]

		if not var_119_4 then
			return
		end

		local var_119_5 = var_119_4[var_119_1]

		if not var_119_5 then
			return
		end

		arg_119_2.pitch = "Down"
		arg_119_2.yaw = "Backward"
		arg_119_2.yaw_base = var_119_2 == "Manuals" and "Local View" or "At Target"
		arg_119_2.avoid_backstab = arg_119_0.menu.elements.angles.options.avoid_backstab:get()

		arg_119_0.warmup_aa:createmove(arg_119_1, arg_119_2)

		if not arg_119_0.warmup_aa:think() then
			if var_119_2 ~= "Manuals" then
				arg_119_0:yaw(arg_119_1, arg_119_2, var_119_5, var_119_0)
			end

			arg_119_0:modifier(arg_119_1, arg_119_2, var_119_5)
			arg_119_0:body(arg_119_1, arg_119_2, var_119_5)
			arg_119_0.break_lc:createmove(var_119_0, arg_119_1, arg_119_2, var_119_5)
			arg_119_0.freestanding:createmove(arg_119_1, arg_119_2, var_119_0, var_119_3)
		end

		arg_119_0.manual_yaw:createmove(arg_119_2)
	end
}):struct("break_lc")({
	current_slider = 1,
	switch_slider = 0,
	get_sequence_activity = function(arg_120_0)
		local var_120_0 = entity.get_local_player()

		if not var_120_0 then
			return nil, nil
		end

		local var_120_1 = var_120_0:get_anim_overlay(1)

		if not var_120_1 then
			return nil, nil
		end

		return var_120_1.activity, var_120_1.weight
	end,
	think = function(arg_121_0, arg_121_1, arg_121_2)
		local var_121_0, var_121_1 = arg_121_0.builder:current_state(arg_121_1, arg_121_2)

		if not arg_121_0.menu.elements.angles.snap.state:get(var_121_1) then
			return false
		end

		local var_121_2 = arg_121_1:get_player_weapon()

		if not var_121_2 then
			return false
		end

		if var_121_2:get_weapon_info().weapon_type == 9 then
			return false
		end

		local var_121_3 = arg_121_0:get_sequence_activity()

		if arg_121_0.menu.elements.angles.snap.disablers_on:get(1) and var_121_3 == 961 then
			return false
		end

		if arg_121_0.menu.elements.angles.snap.disablers_on:get(2) and arg_121_0.globals.reference.rage.main.peek_assist[1]:get() and (var_121_1 == 2 or var_121_1 == 8 or var_121_1 == 9) then
			return false
		end

		return true
	end,
	createmove = function(arg_122_0, arg_122_1, arg_122_2, arg_122_3, arg_122_4)
		if not arg_122_0:think(arg_122_1, arg_122_2) then
			arg_122_3.lag_options = nil
			arg_122_3.hs_options = nil

			return
		end

		local var_122_0 = arg_122_0:get_sequence_activity()
		local var_122_1 = arg_122_0.globals.reference.rage.main.peek_assist[1]:get()

		arg_122_3.hs_options = (var_122_0 == 961 or var_122_1) and "Favor Fire Rate" or arg_122_0.menu.elements.angles.snap.hide_shots:get()

		if arg_122_4.defensive_choke:get() == "Custom" then
			arg_122_3.lag_options = "On Peek"

			if not arg_122_4.random_choke:get() then
				arg_122_2.force_defensive = arg_122_2.command_number % arg_122_4.choke_slider:get() == 0
			elseif arg_122_4.choke_method:get() == "Random" then
				arg_122_2.force_defensive = arg_122_2.command_number % math.random(arg_122_4.choke_from:get(), arg_122_4.choke_to:get()) == 0
			else
				local var_122_2 = arg_122_4.choke_sliders:get()

				if var_122_2 > 0 then
					local var_122_3 = arg_122_4["choke1_" .. math.random(1, var_122_2)]:get() or 1

					arg_122_2.force_defensive = arg_122_2.command_number % var_122_3 == 0
				end
			end
		else
			arg_122_3.lag_options = "Always On"
		end
	end
}):struct("freestanding")({
	_disabler_index = {
		1,
		2,
		3,
		4,
		5,
		6,
		7,
		nil,
		8
	},
	current_state = function(arg_123_0, arg_123_1, arg_123_2)
		local var_123_0 = arg_123_1:get_anim_state()

		if var_123_0 == nil then
			return
		end

		local var_123_1 = arg_123_1.m_flDuckAmount
		local var_123_2 = arg_123_1.m_vecVelocity:length2d()
		local var_123_3 = var_123_0.on_ground and not var_123_0.landed_on_ground_this_frame

		if arg_123_0.manual_yaw:think() then
			return "Manuals", 9
		end

		if arg_123_0.safe_head:think(var_123_3, var_123_1) then
			return "Safe Head"
		end

		if var_123_3 then
			if arg_123_0.globals.reference.antiaim.misc.slow_walk:get() then
				return "Slowing", 3
			end

			if var_123_2 < 5 then
				if var_123_1 > 0 then
					return "Crouching", 4
				end

				return "Standing", 1
			else
				if var_123_1 > 0 then
					return "Sneaking", 5
				end

				return "Running", 2
			end
		end

		if var_123_1 > 0 then
			return "Air Crouching", 7
		end

		return "Air", 6
	end,
	think = function(arg_124_0, arg_124_1, arg_124_2)
		if not arg_124_0.menu.elements.angles.hotkeys.freestanding:get() then
			return false
		end

		local var_124_0 = arg_124_1:get_anim_state()

		if not var_124_0 then
			return false
		end

		local var_124_1 = arg_124_1.m_flDuckAmount
		local var_124_2 = arg_124_1.m_vecVelocity:length2d()
		local var_124_3 = var_124_0.on_ground and not var_124_0.landed_on_ground_this_frame
		local var_124_4

		if not var_124_3 then
			var_124_4 = var_124_1 > 0 and 7 or 6
		elseif var_124_2 > 5 then
			var_124_4 = var_124_1 > 0 and 5 or arg_124_0.globals.reference.antiaim.misc.slow_walk:get() and 3 or 2
		else
			var_124_4 = var_124_1 > 0 and 4 or 1
		end

		local var_124_5 = ({
			1,
			2,
			3,
			4,
			5,
			6,
			7,
			nil,
			8
		})[var_124_4]

		if var_124_5 and arg_124_0.menu.elements.angles.hotkeys.freestanding.disablers:get(var_124_5) then
			return false
		end

		return true
	end,
	createmove = function(arg_125_0, arg_125_1, arg_125_2, arg_125_3)
		if not arg_125_0:think(arg_125_3, arg_125_1) then
			return
		end

		arg_125_2.freestanding = true
	end
}):struct("manual_yaw")({
	_offsets = {
		Forward = 180,
		Right = 90,
		Left = -90
	},
	think = function(arg_126_0)
		local var_126_0 = arg_126_0.menu.elements.angles.hotkeys.manuals:get()

		if var_126_0 == "Disabled" then
			return false
		end

		local var_126_1 = arg_126_0._offsets[var_126_0]

		if not var_126_1 then
			return false
		end

		return true, var_126_1
	end,
	createmove = function(arg_127_0, arg_127_1)
		local var_127_0, var_127_1 = arg_127_0:think()

		if not var_127_0 then
			return
		end

		arg_127_1.yaw_offset = var_127_1

		if arg_127_1.freestanding == true and arg_127_0.menu.elements.angles.hotkeys.freestanding.prefer_manual:get() then
			arg_127_1.freestanding = false
		end
	end
}):struct("safe_head")({
	think = function(arg_128_0, arg_128_1, arg_128_2)
		local var_128_0 = arg_128_0.menu.elements.angles.options.safe_head

		if not var_128_0:get(1) and not var_128_0:get(2) and not var_128_0:get(3) then
			return false
		end

		local var_128_1 = entity.get_local_player()

		if not var_128_1 or not var_128_1:is_alive() then
			return false
		end

		local var_128_2 = var_128_1:get_player_weapon()

		if not var_128_2 then
			return false
		end

		local var_128_3 = var_128_2:get_classname()
		local var_128_4 = var_128_3 == "CKnife"
		local var_128_5 = var_128_3 == "CWeaponTaser"
		local var_128_6 = not arg_128_1 and arg_128_2 > 0

		if var_128_4 and var_128_0:get(1) and var_128_6 then
			return true, "Knife"
		end

		if var_128_5 and var_128_0:get(2) and var_128_6 then
			return true, "Zeus x27"
		end

		if var_128_0:get(3) and arg_128_1 and arg_128_2 > 0 then
			local var_128_7 = entity.get_threat()

			if var_128_7 and (var_128_1:get_origin() - var_128_7:get_origin()).z >= 25 then
				return true, "Height Difference"
			end
		end

		return false
	end,
	createmove = function(arg_129_0, arg_129_1)
		local var_129_0 = entity.get_local_player()

		if not var_129_0 or not var_129_0:is_alive() then
			return
		end

		local var_129_1 = var_129_0:get_anim_state()

		if not var_129_1 then
			return
		end

		local var_129_2 = var_129_0.m_flDuckAmount
		local var_129_3 = var_129_1.on_ground and not var_129_1.landed_on_ground_this_frame

		if not arg_129_0:think(var_129_3, var_129_2) then
			return
		end

		arg_129_1.pitch = "Down"
		arg_129_1.yaw = "Backward"
		arg_129_1.yaw_base = "Local View"
		arg_129_1.modifier_offset = 0
		arg_129_1.yaw_modifier = "Disabled"
		arg_129_1.body_yaw = true
		arg_129_1.left_limit = 1
		arg_129_1.right_limit = 1
		arg_129_1.body_yaw_options = {}

		rage.antiaim:inverter(false)
	end
}):struct("warmup_aa")({
	_INTERVAL = 4,
	_cache_tick = -1,
	offset = 0,
	_pitch_map = {
		["Fake Up"] = "Fake Up",
		Disabled = "Disabled",
		Down = "Down"
	},
	think = function(arg_130_0)
		local var_130_0 = globals.tickcount

		if var_130_0 - arg_130_0._cache_tick < arg_130_0._INTERVAL and arg_130_0._cache ~= nil then
			return arg_130_0._cache
		end

		local var_130_1 = arg_130_0.menu.elements.angles.options.warmup_aa
		local var_130_2 = var_130_1:get(1)
		local var_130_3 = var_130_1:get(2)

		if not var_130_2 and not var_130_3 then
			arg_130_0._cache = false
			arg_130_0._cache_tick = var_130_0

			return false
		end

		local var_130_4 = entity.get_game_rules()

		if not var_130_4 then
			arg_130_0._cache = false
			arg_130_0._cache_tick = var_130_0

			return false
		end

		if var_130_3 and var_130_4.m_bWarmupPeriod then
			arg_130_0._cache = true
			arg_130_0._cache_tick = var_130_0

			return true
		end

		if var_130_2 then
			local var_130_5 = true

			entity.get_players(true, true, function(arg_131_0)
				if arg_131_0 and arg_131_0:is_alive() then
					var_130_5 = false

					return true
				end
			end)

			arg_130_0._cache = var_130_5
			arg_130_0._cache_tick = var_130_0

			return var_130_5
		end

		arg_130_0._cache = false
		arg_130_0._cache_tick = var_130_0

		return false
	end,
	calculate_offset = function(arg_132_0, arg_132_1, arg_132_2, arg_132_3, arg_132_4, arg_132_5)
		if arg_132_1 == "Spin" then
			return -math.fmod(globals.curtime * (arg_132_2 * 290), arg_132_3 * 2) + arg_132_3
		elseif arg_132_1 == "Random" then
			return math.sin(globals.curtime * arg_132_2) * arg_132_3
		else
			return globals.realtime % 0.2 >= 0.1 and arg_132_4 or arg_132_5
		end
	end,
	createmove = function(arg_133_0, arg_133_1, arg_133_2)
		if not arg_133_0:think() then
			return
		end

		local var_133_0 = arg_133_0.menu.elements.angles.options.warmup_aa
		local var_133_1 = var_133_0.pitch:get()

		arg_133_2.pitch = arg_133_0._pitch_map[var_133_1] or ({
			"Disabled",
			"Down",
			"Fake Up"
		})[math.random(1, 3)]
		arg_133_2.yaw_offset = arg_133_0:calculate_offset(var_133_0.yaw:get(), var_133_0.speed:get(), var_133_0.range:get(), var_133_0.left_yaw:get(), var_133_0.right_yaw:get())
		arg_133_2.body_yaw = true
		arg_133_2.left_limit = 60
		arg_133_2.right_limit = 60
		arg_133_2.yaw_modifier = "Disabled"
		arg_133_2.modifier_offset = 0
		arg_133_2.freestand_peek = "Peek Fake"
	end
}):struct("fast_ladder")({
	init = function(arg_134_0)
		local function var_134_0(arg_135_0)
			arg_134_0:createmove(arg_135_0)
		end

		arg_134_0.menu.elements.misc.movement.fast_ladder:set_callback(function(arg_136_0)
			events.createmove(var_134_0, arg_136_0:get())
		end, true)
	end,
	createmove = function(arg_137_0, arg_137_1)
		local var_137_0 = entity.get_local_player()

		if not var_137_0 or not var_137_0:is_alive() then
			return
		end

		local var_137_1 = var_137_0:get_player_weapon()

		if not var_137_1 then
			return
		end

		if var_137_1:get_weapon_info().weapon_type == 9 and var_137_1.m_fThrowTime ~= nil and var_137_1.m_fThrowTime ~= 0 then
			return
		end

		if var_137_0.m_MoveType ~= 9 then
			return
		end

		if arg_137_1.sidemove ~= 0 or arg_137_1.forwardmove == 0 then
			return
		end

		if arg_137_1.in_use then
			return
		end

		local var_137_2 = var_137_0.m_vecLadderNormal

		if var_137_2:normalize() == 0 then
			return
		end

		local var_137_3 = var_137_2:angles()
		local var_137_4 = arg_137_1.forwardmove > 0
		local var_137_5 = math.normalize_yaw(arg_137_1.view_angles.y - var_137_3.y)
		local var_137_6 = math.abs(var_137_5) <= 45

		if var_137_6 then
			var_137_4 = not var_137_4
		end

		arg_137_1.in_back = var_137_4 and 1 or 0
		arg_137_1.in_forward = var_137_4 and 0 or 1
		arg_137_1.in_moveleft = var_137_6 and (var_137_4 and 1 or 0) or var_137_4 and 0 or 1
		arg_137_1.in_moveright = var_137_6 and (var_137_4 and 0 or 1) or var_137_4 and 1 or 0
		arg_137_1.view_angles.x = 89
		arg_137_1.view_angles.y = var_137_3.y + (var_137_6 and 90 or -90)
	end
}):struct("no_fall_damage")({
	_gravity_tick = -999,
	_gravity_cache = 0,
	init = function(arg_138_0)
		local function var_138_0(arg_139_0)
			arg_138_0:createmove(arg_139_0)
		end

		arg_138_0.menu.elements.misc.movement.no_fall_damage:set_callback(function(arg_140_0)
			events.createmove(var_138_0, arg_140_0:get())
		end, true)
	end,
	will_hit_ground = function(arg_141_0, arg_141_1, arg_141_2, arg_141_3)
		local var_141_0 = arg_141_1.m_vecMins
		local var_141_1 = arg_141_1.m_vecMaxs

		var_141_1.z = 54

		local var_141_2 = utils.trace_hull(arg_141_2, arg_141_2 - vector(0, 0, arg_141_3), var_141_0, var_141_1, arg_141_1, 1)

		if var_141_2.fraction < 1 and not var_141_2.start_solid and not var_141_2.all_solid and var_141_2.plane.normal.z >= 0.7 then
			return true, var_141_2
		end

		return false
	end,
	is_fatal_fall = function(arg_142_0, arg_142_1, arg_142_2)
		local var_142_0 = globals.tickcount

		if var_142_0 - arg_142_0._gravity_tick > 64 then
			arg_142_0._gravity_cache = cvar.sv_gravity:float()
			arg_142_0._gravity_tick = var_142_0
		end

		local var_142_1 = globals.tickinterval
		local var_142_2 = arg_142_0._gravity_cache * var_142_1 * 0.5
		local var_142_3 = arg_142_1
		local var_142_4 = arg_142_2

		while var_142_3 > 11 do
			var_142_4 = var_142_4 - var_142_2
			var_142_3 = var_142_3 + var_142_1 * var_142_4
		end

		return var_142_4 <= -580 and var_142_3 >= 9
	end,
	createmove = function(arg_143_0, arg_143_1)
		local var_143_0 = entity.get_local_player()

		if not var_143_0 or not var_143_0:is_alive() then
			return
		end

		if bit.band(var_143_0.m_fFlags, 1) == 1 then
			return
		end

		local var_143_1 = var_143_0:get_origin():clone()

		if bit.band(var_143_0.m_fFlags, 2) == 0 then
			var_143_1.z = var_143_1.z + 9
		end

		local var_143_2, var_143_3 = arg_143_0:will_hit_ground(var_143_0, var_143_1, 1000)

		if not var_143_2 then
			return
		end

		local var_143_4 = var_143_3.fraction * 1000
		local var_143_5 = var_143_0.m_vecVelocity

		if var_143_5.z >= 0 or var_143_4 >= 11 then
			if arg_143_0:is_fatal_fall(var_143_4, var_143_5.z) then
				arg_143_1.in_duck = 1
				arg_143_1.in_jump = 0
			end
		elseif var_143_5.z < -580 and var_143_4 > 9 then
			arg_143_1.in_jump = 1
			arg_143_1.in_duck = 0
		end
	end
}):struct("unlock_fakeduck_speed")({
	init = function(arg_144_0)
		local function var_144_0(arg_145_0)
			arg_144_0:createmove(arg_145_0)
		end

		arg_144_0.menu.elements.misc.movement.fakeduck.unlock_speed_fd:set_callback(function(arg_146_0)
			local var_146_0 = arg_146_0:get()

			events.createmove(var_144_0, var_146_0)
			events.createmove_run(var_144_0, var_146_0)
		end, true)
	end,
	createmove = function(arg_147_0, arg_147_1)
		if not arg_147_0.globals.reference.antiaim.misc.fake_duck:get() then
			return
		end

		local var_147_0 = arg_147_1.forwardmove
		local var_147_1 = arg_147_1.sidemove
		local var_147_2 = vector(var_147_0, var_147_1):length2d()

		if math.abs(var_147_0) > 5 or math.abs(var_147_1) > 5 then
			local var_147_3 = 450 / var_147_2

			arg_147_1.forwardmove = var_147_0 * var_147_3
			arg_147_1.sidemove = var_147_1 * var_147_3
		end
	end
}):struct("freezetime_fakeduck")({
	init = function(arg_148_0)
		local function var_148_0(arg_149_0)
			arg_148_0:override_view(arg_149_0)
		end

		local function var_148_1(arg_150_0)
			arg_148_0:createmove(arg_150_0)
		end

		arg_148_0.menu.elements.misc.movement.fakeduck.freezetime_fakeduck:set_callback(function(arg_151_0)
			local var_151_0 = arg_151_0:get()

			events.override_view(var_148_0, var_151_0)
			events.createmove(var_148_1, var_151_0)
		end, true)
	end,
	override_view = function(arg_152_0, arg_152_1)
		if not arg_152_0.globals.reference.antiaim.misc.fake_duck:get() then
			return
		end

		local var_152_0 = entity.get_local_player()

		if not var_152_0 or not var_152_0:is_alive() then
			return
		end

		local var_152_1 = entity.get_game_rules()

		if not var_152_1 or not var_152_1.m_bFreezePeriod then
			return
		end

		arg_152_1.camera.z = var_152_0:get_origin().z + 64
	end,
	createmove = function(arg_153_0, arg_153_1)
		if not arg_153_0.globals.reference.antiaim.misc.fake_duck:get() then
			return
		end

		local var_153_0 = entity.get_game_rules()

		if not var_153_0 or not var_153_0.m_bFreezePeriod then
			return
		end

		arg_153_1.in_duck = arg_153_1.choked_commands >= 7 and 1 or 0
		arg_153_1.send_packet = arg_153_1.choked_commands == 14
	end
}):struct("aspect_ratio")({
	r_aspectratio = cvar.r_aspectratio,
	init = function(arg_154_0)
		events.shutdown(function()
			arg_154_0:shutdown()
		end)
		arg_154_0.menu.elements.misc.visuals.aspect_ratio:set_callback(function(arg_156_0)
			arg_154_0.r_aspectratio:float(arg_156_0:get() * 0.01, true)
		end, true)
	end,
	shutdown = function(arg_157_0)
		arg_157_0.r_aspectratio:float(tonumber(arg_157_0.r_aspectratio:string()))
	end
}):struct("viewmodel")({
	lerp_speed = 0.05,
	target_fov = 68,
	target_x = 0,
	target_y = 0,
	target_z = 0,
	current_fov = 68,
	current_x = 0,
	current_y = 0,
	current_z = 0,
	cvar_fov = cvar.viewmodel_fov,
	cvar_axis_x = cvar.viewmodel_offset_x,
	cvar_axis_y = cvar.viewmodel_offset_y,
	cvar_axis_z = cvar.viewmodel_offset_z,
	lerp = function(arg_158_0, arg_158_1, arg_158_2, arg_158_3)
		return arg_158_1 + (arg_158_2 - arg_158_1) * arg_158_3
	end,
	update = function(arg_159_0)
		local var_159_0 = entity.get_local_player()

		if not var_159_0 or not var_159_0:is_alive() then
			return
		end

		local var_159_1 = arg_159_0.menu.elements.misc.visuals.viewmodel

		if not var_159_1:get() then
			return
		end

		arg_159_0.target_fov = var_159_1.fov:get()
		arg_159_0.target_x = var_159_1.axis_x:get() * 0.1
		arg_159_0.target_y = var_159_1.axis_y:get() * 0.1
		arg_159_0.target_z = var_159_1.axis_z:get() * 0.1
	end,
	apply_value = function(arg_160_0)
		local var_160_0 = entity.get_local_player()

		if not var_160_0 or not var_160_0:is_alive() then
			return
		end

		if not arg_160_0.menu.elements.misc.visuals.viewmodel:get() then
			arg_160_0.target_fov = 68
			arg_160_0.target_x = 0
			arg_160_0.target_y = 0
			arg_160_0.target_z = 0
		end

		local var_160_1 = arg_160_0.lerp_speed

		arg_160_0.current_fov = arg_160_0:lerp(arg_160_0.current_fov, arg_160_0.target_fov, var_160_1)
		arg_160_0.current_x = arg_160_0:lerp(arg_160_0.current_x, arg_160_0.target_x, var_160_1)
		arg_160_0.current_y = arg_160_0:lerp(arg_160_0.current_y, arg_160_0.target_y, var_160_1)
		arg_160_0.current_z = arg_160_0:lerp(arg_160_0.current_z, arg_160_0.target_z, var_160_1)

		arg_160_0.cvar_fov:float(arg_160_0.current_fov, true)
		arg_160_0.cvar_axis_x:float(arg_160_0.current_x, true)
		arg_160_0.cvar_axis_y:float(arg_160_0.current_y, true)
		arg_160_0.cvar_axis_z:float(arg_160_0.current_z, true)
	end,
	apply_hand = function(arg_161_0)
		local var_161_0 = entity.get_local_player()

		if not var_161_0 or not var_161_0:get_player_weapon() then
			return
		end

		local var_161_1 = arg_161_0.menu.elements.misc.visuals.viewmodel

		if not var_161_1:get() then
			return
		end

		local var_161_2 = var_161_0:get_player_weapon():get_classname() == "CKnife"

		cvar.cl_righthand:int(var_161_2 and var_161_1.opposite_knife_hand:get() and 0 or 1)
	end,
	init = function(arg_162_0)
		events.pre_render(function()
			arg_162_0:update()
			arg_162_0:apply_value()
			arg_162_0:apply_hand()
		end)
	end
}):struct("scope_overlay")({
	reference = slot_0_1_0.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
	alpha = slot_0_4_0.new(0),
	scoped = slot_0_4_0.new(0),
	init = function(arg_164_0)
		events.render(function()
			arg_164_0:render()
		end)
		events.shutdown(function()
			arg_164_0.reference:override()
		end)
	end,
	render = function(arg_167_0)
		local var_167_0 = entity.get_local_player()

		if not var_167_0 or not var_167_0:is_alive() then
			return
		end

		local var_167_1 = arg_167_0.alpha(0.1, arg_167_0.menu.elements.misc.visuals.scope_overlay:get())
		local var_167_2 = var_167_1 * arg_167_0.scoped(0.05, var_167_0.m_bIsScoped)

		if var_167_1 < 0.1 then
			return
		end

		arg_167_0.reference:override("Remove All")

		local var_167_3 = arg_167_0.globals.screen_size * 0.5
		local var_167_4 = math.floor(arg_167_0.menu.elements.misc.visuals.scope_overlay.offset:get())
		local var_167_5 = math.floor(arg_167_0.menu.elements.misc.visuals.scope_overlay.length:get())
		local var_167_6 = var_167_5 - var_167_4
		local var_167_7 = arg_167_0.menu.elements.misc.visuals.scope_overlay.color:get("Simple")[1]
		local var_167_8 = math.floor(var_167_7.a * var_167_2)
		local var_167_9 = color(var_167_7.r, var_167_7.g, var_167_7.b, var_167_8)
		local var_167_10 = color(var_167_7.r, var_167_7.g, var_167_7.b, 0)

		render.gradient(vector(var_167_3.x, var_167_3.y - var_167_4 + 1), vector(var_167_3.x + 1, var_167_3.y - var_167_5), var_167_9, var_167_9, var_167_10, var_167_10)
		render.gradient(vector(var_167_3.x, var_167_3.y + var_167_4), vector(var_167_3.x + 1, var_167_3.y + var_167_5), var_167_9, var_167_9, var_167_10, var_167_10)
		render.gradient(vector(var_167_3.x - var_167_4 + 1, var_167_3.y), vector(var_167_3.x - var_167_4 - var_167_6 + 1, var_167_3.y + 1), var_167_9, var_167_10, var_167_9, var_167_10)
		render.gradient(vector(var_167_3.x + var_167_4, var_167_3.y), vector(var_167_3.x + var_167_4 + var_167_6 + 1, var_167_3.y + 1), var_167_9, var_167_10, var_167_9, var_167_10)
	end
}):struct("player_transparency")({
	init = function(arg_168_0)
		events.localplayer_transparency(function(arg_169_0)
			local var_169_0 = entity.get_local_player()

			if not var_169_0 or not var_169_0:is_alive() then
				return arg_169_0
			end

			if not arg_168_0.menu.elements.misc.visuals.keep_model_transparency:get() then
				return arg_169_0
			end

			return (var_169_0.m_bIsScoped or var_169_0.m_bResumeZoom) and 59 or arg_169_0
		end)
	end
}):struct("manual_arrows")({
	alpha = slot_0_4_0.new(0),
	_font_map = {
		Small = 2,
		Console = 3,
		Bold = 4
	},
	init = function(arg_170_0)
		local var_170_0 = render.load_font("Verdana Bold", 20, "ad")

		arg_170_0._font_map.Default = var_170_0

		events.render(function()
			arg_170_0:render(var_170_0)
		end)
	end,
	render = function(arg_172_0, arg_172_1)
		local var_172_0 = entity.get_local_player()

		if not var_172_0 or not var_172_0:is_alive() then
			return
		end

		local var_172_1 = arg_172_0.alpha(0.1, arg_172_0.menu.elements.misc.visuals.manual_arrows:get())

		if var_172_1 <= 0 then
			return
		end

		local var_172_2, var_172_3 = arg_172_0.manual_yaw:think()

		if not var_172_3 then
			return
		end

		local var_172_4 = arg_172_0.menu.elements.misc.visuals.manual_arrows
		local var_172_5 = arg_172_0._font_map[var_172_4.font:get()] or arg_172_1
		local var_172_6 = var_172_4.col:get()
		local var_172_7 = var_172_6:alpha_modulate(var_172_6.a * var_172_1)
		local var_172_8 = var_172_4.offset:get()
		local var_172_9 = arg_172_0.globals.screen_size
		local var_172_10 = vector(var_172_9.x * 0.5, var_172_9.y * 0.5 - 2)

		if var_172_3 == -90 then
			render.text(var_172_5, var_172_10 - vector(var_172_8), var_172_7, "c", var_172_4.left_letter:get())
		elseif var_172_3 == 90 then
			render.text(var_172_5, var_172_10 + vector(var_172_8), var_172_7, "c", var_172_4.right_letter:get())
		elseif var_172_3 == 180 then
			render.text(var_172_5, var_172_10 - vector(0, var_172_8), var_172_7, "c", var_172_4.forward_letter:get())
		end
	end
}):struct("log_events")({
	aim_fire_tick = 0,
	nade_type = {
		inferno = "Burned",
		knife = "Knifed",
		hegrenade = "Naded"
	},
	weapon_names = {
		weapon_molotov = "Molotov",
		weapon_smokegrenade = "Smoke",
		weapon_flashbang = "Flashbang",
		weapon_hegrenade = "HE",
		weapon_usp_silencer = "USP-S",
		weapon_m4a4 = "M4A4",
		weapon_m4a1_silencer = "M4A1-S",
		weapon_knife_butterfly = "Butterfly Knife",
		weapon_knife_karambit = "Karambit",
		weapon_deagle = "Desert Eagle",
		weapon_ak47 = "AK-47",
		weapon_awp = "AWP",
		item_defuser = "Defuse Kit",
		weapon_taser = "Zeus X27",
		item_assaultsuit = "Kevlar + Helmet",
		weapon_glock = "Glock-18",
		item_kevlar = "Kevlar",
		weapon_c4 = "C4",
		weapon_decoy = "Decoy",
		weapon_incgrenade = "Molotov"
	},
	hitgroups = {
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
	},
	print = function(arg_173_0, arg_173_1, arg_173_2)
		if not arg_173_0.menu.elements.misc.aimbot.log_event:get() then
			return
		end

		local var_173_0 = arg_173_0.menu.elements.misc.aimbot.log_event.color:get("Prefix")[1]:to_hex()

		common.add_event(arg_173_1, arg_173_2 or "check")
		print_raw(string.format("\a%s%s\aDEFAULT %s", var_173_0, arg_173_0.globals.logs_name, arg_173_1))
	end,
	init = function(arg_174_0)
		local var_174_0 = arg_174_0.menu.elements.misc.aimbot.log_event
		local var_174_1 = slot_0_1_0.find("Miscellaneous", "Main", "Other", "Log Events")

		local function var_174_2()
			arg_174_0.aim_fire_tick = globals.server_tick
		end

		local function var_174_3(arg_176_0)
			arg_174_0:aim_ack(arg_176_0)
		end

		local function var_174_4(arg_177_0)
			arg_174_0:player_hurt(arg_177_0)
		end

		local function var_174_5(arg_178_0)
			arg_174_0:item_purchase(arg_178_0)
		end

		var_174_0.damage_dealt:set_callback(function(arg_179_0)
			local var_179_0 = arg_179_0:get()

			events.aim_fire(var_174_2, var_179_0)
			events.aim_ack(var_174_3, var_179_0)
			events.player_hurt(var_174_4, var_179_0)
		end, true)
		var_174_0.purchases:set_callback(function(arg_180_0)
			local var_180_0 = arg_180_0:get()

			events.item_purchase(var_174_5, var_180_0)
			var_174_1:override(var_180_0 and {} or nil)
		end, true)
		events.shutdown(function()
			var_174_1:override()
		end)
	end,
	aim_ack = function(arg_182_0, arg_182_1)
		local var_182_0 = arg_182_1.target

		if not var_182_0 then
			return
		end

		local var_182_1 = math.max(globals.server_tick - arg_182_0.aim_fire_tick - 1, 0)
		local var_182_2 = arg_182_0.menu.elements.misc.aimbot.log_event.color:get("Main text")[1]:to_hex()
		local var_182_3 = arg_182_1.state
		local var_182_4 = var_182_0:get_name()
		local var_182_5 = arg_182_0.hitgroups[arg_182_1.hitgroup] or "body"
		local var_182_6 = arg_182_0.hitgroups[arg_182_1.wanted_hitgroup] or "body"

		if var_182_3 == "correction" or var_182_3 == "backtrack failure" then
			var_182_3 = "?"
		end

		if not var_182_3 then
			arg_182_0:print(string.format("Hit \a%s%s\aDEFAULT's \a%s%s\aDEFAULT%s for \a%s%d\aDEFAULT%s damage [hc: \a%s%d%%\aDEFAULT \a898989FF-\aDEFAULT bt: \a%s%st\aDEFAULT]%s", var_182_2, var_182_4, var_182_2, var_182_5, var_182_6 ~= var_182_5 and string.format("(\aC6CBD1FF%s\aDEFAULT)", var_182_6) or "", var_182_2, arg_182_1.damage, arg_182_1.wanted_damage ~= arg_182_1.damage and string.format("(\aC6CBD1FF%d\aDEFAULT)", arg_182_1.wanted_damage) or "", var_182_2, arg_182_1.hitchance, var_182_2, arg_182_1.backtrack, var_182_1 ~= 0 and string.format(" \aDEFAULT(delay=\a%s%.0fms\aDEFAULT)", var_182_2, to_time(var_182_1) * 1000) or ""), "check")
		else
			arg_182_0:print(string.format("\aC6CBD1FFMissed \a%s%s\aDEFAULT's \a%s%s\aDEFAULT due to \a%s%s\aDEFAULT [hc: \a%s%d%%\aDEFAULT \a898989FF-\aDEFAULT bt: \a%s%dt\aDEFAULT] (damage: \a%s%shp\aDEFAULT)", var_182_2, var_182_4, var_182_2, var_182_6, var_182_2, var_182_3, var_182_2, arg_182_1.hitchance, var_182_2, arg_182_1.backtrack, var_182_2, arg_182_1.wanted_damage), "xmark")
		end
	end,
	player_hurt = function(arg_183_0, arg_183_1)
		local var_183_0 = entity.get_local_player()
		local var_183_1 = entity.get(arg_183_1.userid, true)
		local var_183_2 = entity.get(arg_183_1.attacker, true)

		if var_183_1 == var_183_0 or var_183_2 ~= var_183_0 then
			return
		end

		local var_183_3 = arg_183_0.nade_type[arg_183_1.weapon]

		if not var_183_3 then
			return
		end

		local var_183_4 = arg_183_0.menu.elements.misc.aimbot.log_event.color:get("Main text")[1]:to_hex()

		arg_183_0:print(string.format("\aC6CBD1FF%s \a%s%s%s\aDEFAULT for \a%s%s\aDEFAULT damage", var_183_3, var_183_4, var_183_1:get_name(), arg_183_1.health > 0 and string.format("\aDEFAULT(\aC6CBD1FF%shp\aDEFAULT)", arg_183_1.health) or "", var_183_4, arg_183_1.dmg_health))
	end,
	item_purchase = function(arg_184_0, arg_184_1)
		local var_184_0 = entity.get(arg_184_1.userid, true)

		if not var_184_0 or not var_184_0:is_enemy() then
			return
		end

		local var_184_1 = arg_184_1.weapon

		if var_184_1 == "weapon_unknown" then
			return
		end

		local var_184_2 = arg_184_0.menu.elements.misc.aimbot.log_event.color:get("Main text")[1]:to_hex()
		local var_184_3 = arg_184_0.weapon_names[var_184_1] or var_184_1:gsub("^weapon_", ""):gsub("^item_", ""):gsub("_", " ")

		arg_184_0:print(string.format("\a%s%s\aDEFAULT bought \a%s%s\aDEFAULT", var_184_2, var_184_0:get_name(), var_184_2, var_184_3), "basket-shopping")
	end
}):struct("fake_latency")({
	sv_maxunlag = cvar.sv_maxunlag,
	init = function(arg_185_0)
		local function var_185_0()
			arg_185_0.sv_maxunlag:float(0.1)
		end

		events.shutdown(var_185_0)
		arg_185_0.menu.elements.misc.aimbot.ping_spike_unlock:set_callback(function(arg_187_0)
			if arg_187_0:get() then
				arg_185_0.sv_maxunlag:float(0.4, true)
			else
				var_185_0()
			end
		end, true)
	end
}):struct("hit_marker")({
	realtime = 0,
	world_time = 0,
	world_pos = vector(),
	init = function(arg_188_0)
		local function var_188_0(arg_189_0)
			arg_188_0:player_hurt(arg_189_0)
		end

		local function var_188_1(arg_190_0)
			if arg_190_0.state ~= nil then
				return
			end

			arg_188_0:aim_ack(arg_190_0)
		end

		local function var_188_2()
			arg_188_0:render()
		end

		arg_188_0.menu.elements.misc.visuals.hit_marker:set_callback(function(arg_192_0)
			local var_192_0 = arg_192_0:get(1)
			local var_192_1 = arg_192_0:get(2)
			local var_192_2 = var_192_0 or var_192_1

			events.player_hurt(var_188_0, var_192_0)
			events.aim_ack(var_188_1, var_192_1)
			events.render_ingame(var_188_2, var_192_2)

			if not var_192_0 then
				arg_188_0.realtime = 0
			end

			if not var_192_1 then
				arg_188_0.world_time = 0
			end
		end, true)
	end,
	ease_out_cubic = function(arg_193_0, arg_193_1)
		arg_193_1 = arg_193_1 - 1

		return arg_193_1 * arg_193_1 * arg_193_1 + 1
	end,
	aim_ack = function(arg_194_0, arg_194_1)
		if not arg_194_1.aim then
			return
		end

		arg_194_0.world_pos = arg_194_1.aim
		arg_194_0.world_time = globals.realtime + arg_194_0.menu.elements.misc.visuals.hit_marker.duration_time:get() / 10
	end,
	player_hurt = function(arg_195_0, arg_195_1)
		local var_195_0 = entity.get_local_player()

		if not var_195_0 or not var_195_0:is_alive() then
			return
		end

		local var_195_1 = entity.get(arg_195_1.userid, true)
		local var_195_2 = entity.get(arg_195_1.attacker, true)

		if var_195_2 == var_195_0 and var_195_1 ~= var_195_2 then
			arg_195_0.realtime = globals.realtime + arg_195_0.menu.elements.misc.visuals.hit_marker.duration_time:get() / 10
		end
	end,
	line = function(arg_196_0, arg_196_1, arg_196_2, arg_196_3)
		local var_196_0 = color(0, arg_196_3.a * 0.5)
		local var_196_1 = arg_196_2 * 2
		local var_196_2, var_196_3 = arg_196_1:unpack()

		render.line(arg_196_1 - vector(var_196_1, var_196_1) - 1, arg_196_1 - vector(arg_196_2, arg_196_2) + 1, var_196_0)
		render.line(arg_196_1 - vector(var_196_1, -var_196_1) - 1, arg_196_1 - vector(arg_196_2, -arg_196_2) + 1, var_196_0)
		render.line(arg_196_1 + vector(var_196_1, -var_196_1) + 1, arg_196_1 + vector(arg_196_2, -arg_196_2) + 1, var_196_0)
		render.line(arg_196_1 + vector(var_196_1, var_196_1) + 1, arg_196_1 + vector(arg_196_2, arg_196_2) + 1, var_196_0)
		render.line(vector(var_196_2 - var_196_1, var_196_3 - var_196_1), vector(var_196_2 - arg_196_2, var_196_3 - arg_196_2), arg_196_3)
		render.line(vector(var_196_2 - var_196_1, var_196_3 + var_196_1), vector(var_196_2 - arg_196_2, var_196_3 + arg_196_2), arg_196_3)
		render.line(vector(var_196_2 + var_196_1, var_196_3 - var_196_1), vector(var_196_2 + arg_196_2, var_196_3 - arg_196_2), arg_196_3)
		render.line(vector(var_196_2 + var_196_1, var_196_3 + var_196_1), vector(var_196_2 + arg_196_2, var_196_3 + arg_196_2), arg_196_3)
	end,
	render = function(arg_197_0)
		if arg_197_0.menu.elements.misc.visuals.hit_marker:get(2) then
			local var_197_0 = globals.realtime - arg_197_0.world_time
			local var_197_1 = 1 - math.clamp(var_197_0 * 2.5, 0, 1)
			local var_197_2 = arg_197_0:ease_out_cubic(var_197_1)

			if var_197_2 > 0 then
				local var_197_3 = arg_197_0.menu.elements.misc.visuals.hit_marker.color_2d:get("3D")[1]

				var_197_3.a = var_197_3.a * var_197_2

				local var_197_4 = 5
				local var_197_5 = arg_197_0.world_pos:to_screen()

				if var_197_5 and var_197_5.x then
					render.rect(var_197_5 - vector(var_197_4, 0), var_197_5 + vector(var_197_4, 0), var_197_3)
					render.rect(var_197_5 - vector(0, var_197_4), var_197_5 + vector(0, var_197_4), var_197_3)
				end
			end
		end

		if arg_197_0.menu.elements.misc.visuals.hit_marker:get(1) then
			local var_197_6 = globals.realtime - arg_197_0.realtime
			local var_197_7 = 1 - math.clamp(var_197_6 * 2.5, 0, 1)
			local var_197_8 = arg_197_0:ease_out_cubic(var_197_7)

			if var_197_8 > 0 then
				local var_197_9 = arg_197_0.menu.elements.misc.visuals.hit_marker.color_2d:get("2D")[1]

				var_197_9.a = var_197_9.a * var_197_8

				arg_197_0:line(arg_197_0.globals.screen_size / 2, 5, var_197_9)
			end
		end
	end
}):struct("dmg_indicator")({
	screensize = render.screen_size(),
	verdana = render.load_font("Verdana", 10, "ad"),
	on_render = function(arg_198_0)
		if not arg_198_0.menu.elements.misc.visuals.dmg_indicator:get() then
			return
		end

		local var_198_0 = entity.get_local_player()

		if not var_198_0 or var_198_0.m_iHealth <= 0 then
			return
		end

		local var_198_1 = arg_198_0.menu.elements.misc.visuals.dmg_indicator.mode:get() == "Advanced" and arg_198_0.verdana or 1
		local var_198_2 = slot_0_1_0.get_binds()

		for iter_198_0, iter_198_1 in pairs(var_198_2) do
			if iter_198_1.name == "Min. Damage" and iter_198_1.active then
				render.text(var_198_1, vector(arg_198_0.screensize.x / 2 + 4, arg_198_0.screensize.y / 2 - 15), color(), "", iter_198_1.value)

				break
			end
		end
	end,
	init = function(arg_199_0)
		local function var_199_0()
			arg_199_0:on_render()
		end

		arg_199_0.menu.elements.misc.visuals.dmg_indicator:set_callback(function(arg_201_0)
			events.render(var_199_0, arg_201_0:get())
		end, true)
	end
}):struct("animations")({
	last_jumped_time = 0,
	command_number = 0,
	smoothed_data = {},
	hitbox_bone_cache = {},
	animlayer_t = ffi.typeof("        struct {\n            bool client_blend; float blend_in; void *studio_hdr;\n            int dispatch_sequence; int second_dispatch_sequence;\n            uint32_t order; uint32_t sequence;\n            float prev_cycle; float weight; float weight_delta_rate;\n            float playback_rate; float cycle; void *entity;\n            char pad_0x0038[0x4];\n        } **\n    "),
	native_GetClientEntity = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "uintptr_t(__thiscall*)(void*, int)"),
	native_GetModel = utils.get_vfunc("engine.dll", "VModelInfoClient004", 1, "void*(__thiscall*)(void*, int)"),
	native_GetStudioModel = utils.get_vfunc("engine.dll", "VModelInfoClient004", 32, "StudioHdr*(__thiscall*)(void*, void*)"),
	is_valid_pointer = function(arg_202_0, arg_202_1)
		if not arg_202_1 then
			return false
		end

		local var_202_0 = tonumber(ffi.cast("uintptr_t", arg_202_1))

		return var_202_0 and var_202_0 > 65536 and var_202_0 < 140737488355327
	end,
	is_valid_matrix = function(arg_203_0, arg_203_1)
		return arg_203_1 and arg_203_1[11] == arg_203_1[11]
	end,
	get_anim_overlay = function(arg_204_0, arg_204_1, arg_204_2)
		return ffi.cast(arg_204_0.animlayer_t, ffi.cast("char*", arg_204_1[0]) + 10640)[0][arg_204_2]
	end,
	get_bone_array = function(arg_205_0, arg_205_1)
		local var_205_0 = arg_205_0.native_GetClientEntity(arg_205_1:get_index())

		if not arg_205_0:is_valid_pointer(var_205_0) then
			return
		end

		local var_205_1 = ffi.cast("uintptr_t*", var_205_0 + 9896)[0]

		if not arg_205_0:is_valid_pointer(var_205_1) then
			return
		end

		return var_205_1
	end,
	jitter_bone_matrix = function(arg_206_0, arg_206_1, arg_206_2, arg_206_3)
		if not arg_206_0:is_valid_matrix(arg_206_1) then
			return
		end

		local var_206_0 = arg_206_0.command_number % 3 == 0
		local var_206_1 = arg_206_3 == 2 and arg_206_2 >= 65 and arg_206_2 <= 78 or arg_206_2 >= 70 and arg_206_2 <= 87
		local var_206_2 = var_206_0 and 1 or -1
		local var_206_3 = var_206_0 and -1 or -2

		if arg_206_2 ~= 8 then
			if not var_206_1 then
				arg_206_1[3] = arg_206_1[3] + var_206_2
			end

			arg_206_1[7] = arg_206_1[7] + (var_206_1 and var_206_3 or var_206_2)
		end

		arg_206_1[11] = arg_206_1[11] + var_206_2
	end,
	get_hitbox_bones = function(arg_207_0, arg_207_1)
		local var_207_0 = arg_207_0.hitbox_bone_cache[arg_207_1]

		if var_207_0 then
			return var_207_0
		end

		local var_207_1 = arg_207_0.native_GetModel(arg_207_1)

		if not arg_207_0:is_valid_pointer(var_207_1) then
			return
		end

		local var_207_2 = arg_207_0.native_GetStudioModel(var_207_1)

		if not arg_207_0:is_valid_pointer(var_207_2) or var_207_2.numHitboxSets <= 0 then
			return
		end

		local var_207_3 = ffi.cast("mstudiohitboxset_t*", ffi.cast("uintptr_t", var_207_2) + var_207_2.hitboxSetIndex)

		if not var_207_3 or var_207_3.numhitboxes <= 0 then
			return
		end

		local var_207_4 = ffi.cast("mstudiobbox_t*", ffi.cast("uintptr_t", var_207_3) + var_207_3.hitboxindex)
		local var_207_5 = {}

		for iter_207_0 = 0, var_207_3.numhitboxes - 1 do
			local var_207_6 = var_207_4[iter_207_0].bone

			if var_207_6 and var_207_6 >= 0 and var_207_6 < var_207_2.numBones then
				var_207_5[#var_207_5 + 1] = var_207_6
			end
		end

		arg_207_0.hitbox_bone_cache[arg_207_1] = var_207_5

		return var_207_5
	end,
	apply_jitter_hitboxes = function(arg_208_0, arg_208_1)
		if not arg_208_1 or not arg_208_1:is_alive() then
			return
		end

		local var_208_0 = arg_208_1.m_nModelIndex

		if not var_208_0 then
			return
		end

		local var_208_1 = arg_208_0:get_bone_array(arg_208_1)

		if not var_208_1 then
			return
		end

		local var_208_2 = arg_208_0:get_hitbox_bones(var_208_0)

		if not var_208_2 or #var_208_2 == 0 then
			return
		end

		local var_208_3 = ffi.cast("float*", var_208_1)

		for iter_208_0, iter_208_1 in ipairs(var_208_2) do
			arg_208_0:jitter_bone_matrix(var_208_3 + iter_208_1 * 12, iter_208_1, arg_208_1.m_iTeamNum)
		end
	end,
	reset_hitbox_cache = function(arg_209_0, arg_209_1)
		if arg_209_1 and arg_209_1.userid then
			local var_209_0 = entity.get(arg_209_1.userid, true)

			if var_209_0 and var_209_0 == entity.get_local_player() then
				arg_209_0.hitbox_bone_cache = {}
			end
		else
			arg_209_0.hitbox_bone_cache = {}
		end
	end,
	reset = function(arg_210_0)
		arg_210_0.smoothed_data = {}
		arg_210_0.hitbox_bone_cache = {}
	end,
	update = function(arg_211_0, arg_211_1)
		local var_211_0 = entity.get_local_player()

		if not var_211_0 or not var_211_0:is_alive() then
			if next(arg_211_0.smoothed_data) then
				arg_211_0.smoothed_data = {}
			end

			return
		end

		if var_211_0 ~= arg_211_1 then
			return
		end

		if not var_211_0:get_player_weapon() then
			return
		end

		local var_211_1 = arg_211_0.menu.elements.misc.animations
		local var_211_2 = var_211_0:get_index()
		local var_211_3 = arg_211_0.smoothed_data[var_211_2]

		if not var_211_3 then
			var_211_3 = {
				smoothed_pose_p = {},
				smoothed_layers = {}
			}

			for iter_211_0 = 0, 12 do
				var_211_3.smoothed_pose_p[iter_211_0] = 0
				var_211_3.smoothed_layers[iter_211_0] = 0
			end

			arg_211_0.smoothed_data[var_211_2] = var_211_3
		end

		if var_211_1.interpolating:get() then
			local var_211_4 = var_211_1.interpolating.slider:get()

			if var_211_4 > 0 then
				local var_211_5 = globals.tickinterval * var_211_4
				local var_211_6 = 1 - var_211_5
				local var_211_7 = var_211_0.m_flPoseParameter
				local var_211_8 = var_211_3.smoothed_pose_p
				local var_211_9 = var_211_3.smoothed_layers

				for iter_211_1 = 0, 12 do
					var_211_8[iter_211_1] = var_211_5 * var_211_8[iter_211_1] + var_211_6 * var_211_7[iter_211_1]
					var_211_7[iter_211_1] = var_211_8[iter_211_1]

					local var_211_10 = arg_211_0:get_anim_overlay(var_211_0, iter_211_1)

					if var_211_10 then
						var_211_9[iter_211_1] = var_211_5 * var_211_9[iter_211_1] + var_211_6 * var_211_10.weight
						var_211_10.weight = var_211_9[iter_211_1]
					end
				end
			end
		end

		local var_211_11 = arg_211_0:get_anim_overlay(var_211_0, 12)

		if var_211_11 then
			local var_211_12 = var_211_1.leaning:get()

			if var_211_12 ~= 0 then
				var_211_11.weight = var_211_12 * 0.01
			end
		end

		local var_211_13 = var_211_1.falling:get()

		var_211_0.m_flPoseParameter[6] = var_211_13 ~= 0 and var_211_13 / 100 or 0

		local var_211_14 = var_211_0:get_anim_state()

		if var_211_14 and var_211_14.landed_on_ground_this_frame then
			arg_211_0.last_jumped_time = globals.realtime
		end

		local var_211_15 = var_211_1.jitter_legs:get()
		local var_211_16 = var_211_15 and var_211_1.jitter_legs.mode:get()
		local var_211_17 = var_211_15 and var_211_16 == "Skeet" and var_211_1.jitter_legs.skeet_animfix:get()
		local var_211_18 = var_211_15 and var_211_16 == "Default" and var_211_1.jitter_legs.enable:get()

		if var_211_15 then
			if var_211_16 == "Default" and var_211_18 then
				local var_211_19 = var_211_1.jitter_legs.from:get() * 0.01
				local var_211_20 = var_211_1.jitter_legs.to:get() * 0.01

				var_211_0.m_flPoseParameter[0] = (globals.clock_offset + globals.client_tick) % 3 == 0 and var_211_19 or var_211_20
			elseif var_211_16 == "Skeet" and var_211_17 and var_211_14 then
				local var_211_21 = var_211_0.m_flDuckAmount
				local var_211_22 = var_211_0.m_vecVelocity:length2d()

				if var_211_14.on_ground and not var_211_14.landed_on_ground_this_frame and var_211_22 > 5 and var_211_21 <= 0 then
					arg_211_0:apply_jitter_hitboxes(var_211_0)

					local var_211_23 = globals.tickcount % 3

					var_211_0.m_flPoseParameter[0] = var_211_23 > 1 and 0 or 0.9
				end
			end
		end
	end,
	init = function(arg_212_0)
		local var_212_0 = arg_212_0.globals.reference.antiaim.misc

		events.post_update_clientside_animation(function(arg_213_0)
			arg_212_0:update(arg_213_0)
		end)
		events.createmove(function(arg_214_0)
			arg_212_0.command_number = arg_214_0.command_number

			local var_214_0 = arg_212_0.menu.elements.misc.animations
			local var_214_1 = var_214_0.jitter_legs:get()
			local var_214_2 = var_214_1 and var_214_0.jitter_legs.mode:get()
			local var_214_3 = var_214_1 and var_214_2 == "Skeet" and var_214_0.jitter_legs.skeet_animfix:get()
			local var_214_4 = var_214_1 and var_214_2 == "Default" and var_214_0.jitter_legs.enable:get()

			if not var_214_1 then
				var_212_0.leg_movement:override()

				return
			end

			if var_214_2 == "Default" and var_214_4 then
				var_212_0.leg_movement:override(arg_214_0.command_number % 3 == 0 and "Walking" or "Sliding")
			elseif var_214_2 == "Skeet" and var_214_3 then
				local var_214_5 = entity.get_local_player()

				if var_214_5 and var_214_5:is_alive() then
					local var_214_6 = var_214_5:get_anim_state()

					if var_214_6 then
						local var_214_7 = var_214_6.on_ground and not var_214_6.landed_on_ground_this_frame and var_214_5.m_vecVelocity:length2d() > 5 and var_214_5.m_flDuckAmount <= 0

						var_212_0.leg_movement:override(var_214_7 and "Sliding" or nil)
					end
				end
			else
				var_212_0.leg_movement:override()
			end
		end)

		local var_212_1 = {
			"player_spawn",
			"player_death",
			"round_prestart",
			"round_start",
			"level_init",
			"map_load",
			"map_change"
		}

		for iter_212_0, iter_212_1 in ipairs(var_212_1) do
			events[iter_212_1](function(arg_215_0)
				arg_212_0:reset_hitbox_cache(arg_215_0)
			end)
		end

		events.round_start(function()
			arg_212_0:reset()
		end)
		events.disconnect(function()
			arg_212_0:reset()
		end)
	end
}):struct("super_toss")({
	enabled = false,
	solve_angles = function(arg_218_0, arg_218_1, arg_218_2, arg_218_3, arg_218_4)
		local var_218_0 = 0.3

		arg_218_1.x = arg_218_1.x - 10 + math.abs(arg_218_1.x) / 9

		local var_218_1 = vector():angles(arg_218_1)
		local var_218_2 = math.clamp(arg_218_2 * 0.9, 15, 750)
		local var_218_3 = math.clamp(arg_218_3, 0, 1)
		local var_218_4 = var_218_2 * (var_218_0 + (1 - var_218_0) * var_218_3)
		local var_218_5 = arg_218_4 * 1.25
		local var_218_6 = var_218_1

		for iter_218_0 = 1, 8 do
			var_218_6 = (var_218_1 * (var_218_6 * var_218_4 + var_218_5):length() - var_218_5) / var_218_4

			var_218_6:normalize()
		end

		local var_218_7 = var_218_6:angles()

		if var_218_7.x > -10 then
			var_218_7.x = 0.9 * var_218_7.x + 9
		else
			var_218_7.x = 1.125 * var_218_7.x + 11.25
		end

		return var_218_7
	end,
	grenade_override = function(arg_219_0, arg_219_1)
		local var_219_0 = entity.get_local_player()

		if not var_219_0 then
			return
		end

		local var_219_1 = var_219_0:get_player_weapon()

		if not var_219_1 then
			return
		end

		local var_219_2 = var_219_1:get_weapon_info()

		if not var_219_2 then
			return
		end

		arg_219_1.angles = arg_219_0:solve_angles(arg_219_1.angles, var_219_2.throw_velocity, var_219_1.m_flThrowStrength, arg_219_1.velocity)
	end,
	createmove = function(arg_220_0, arg_220_1)
		if not arg_220_1.jitter_move then
			return
		end

		local var_220_0 = entity.get_local_player()

		if not var_220_0 then
			return
		end

		local var_220_1 = var_220_0:get_player_weapon()

		if not var_220_1 then
			return
		end

		local var_220_2 = var_220_1:get_weapon_info()

		if not var_220_2 or var_220_2.weapon_type ~= 9 then
			return
		end

		if var_220_1.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
			return
		end

		arg_220_1.in_speed = true

		local var_220_3 = var_220_0:simulate_movement()

		var_220_3:think()

		arg_220_1.view_angles = arg_220_0:solve_angles(arg_220_1.view_angles, var_220_2.throw_velocity, var_220_1.m_flThrowStrength, var_220_3.velocity)
	end,
	init = function(arg_221_0)
		events.createmove(function(arg_222_0)
			if arg_221_0.enabled then
				arg_221_0:createmove(arg_222_0)
			end
		end)
		events.grenade_override_view(function(arg_223_0)
			if arg_221_0.enabled then
				arg_221_0:grenade_override(arg_223_0)
			end
		end)
		arg_221_0.menu.elements.misc.aimbot.super_toss:set_callback(function(arg_224_0)
			arg_221_0.enabled = arg_224_0:get()
		end, true)

		arg_221_0.enabled = arg_221_0.menu.elements.misc.aimbot.super_toss:get()
	end
}):struct("watermark")({
	pos_loaded = false,
	dragging = false,
	_cached_hh = 0,
	_cached_hw = 0,
	_enc_chars = "abcdefghijklmnopqrstuvwxyz0123456789~!@#$%^&*+-/=?_<>",
	screen = render.screen_size(),
	position = vector(0, 0),
	drag_offset = vector(0, 0),
	c_white = color(255, 255, 255, 255),
	_rainbow_colors = {
		color(255, 0, 0, 255),
		color(255, 127, 0, 255),
		color(255, 255, 0, 255),
		color(0, 255, 0, 255),
		color(0, 0, 255, 255),
		color(75, 0, 130, 255),
		color(148, 0, 211, 255),
		color(255, 0, 0, 255)
	},
	save_pos = function(arg_225_0, arg_225_1, arg_225_2)
		db.godsense_watermark_x = arg_225_1
		db.godsense_watermark_y = arg_225_2
	end,
	load_pos = function(arg_226_0)
		local var_226_0 = db.godsense_watermark_x
		local var_226_1 = db.godsense_watermark_y

		if var_226_0 and var_226_1 then
			arg_226_0.loaded_x = var_226_0
			arg_226_0.loaded_y = var_226_1
		end

		arg_226_0.pos_loaded = true
	end,
	is_point_in_rect = function(arg_227_0, arg_227_1, arg_227_2)
		return arg_227_1.x >= arg_227_2.x1 and arg_227_1.x <= arg_227_2.x2 and arg_227_1.y >= arg_227_2.y1 and arg_227_1.y <= arg_227_2.y2
	end,
	_font_idx = {
		Pixel = 2,
		Console = 3,
		Bold = 4,
		Default = 1
	},
	on_render = function(arg_228_0)
		if not globals.is_in_game then
			return
		end

		slot_228_1_0 = arg_228_0.menu.elements.watermark_gear

		if not arg_228_0.pos_loaded then
			arg_228_0:load_pos()
		end

		if arg_228_0.loaded_x then
			slot_228_1_0.pos_x:set(arg_228_0.loaded_x)
			slot_228_1_0.pos_y:set(arg_228_0.loaded_y)

			arg_228_0.loaded_x = nil
			arg_228_0.loaded_y = nil
		end

		slot_228_2_0 = slot_228_1_0.input:get()

		if not slot_228_2_0 or slot_228_2_0 == "" then
			return
		end

		slot_228_3_0 = globals.realtime
		slot_228_4_0 = slot_228_1_0.font:get()
		slot_228_5_0 = arg_228_0._font_idx[slot_228_4_0] or 1
		slot_228_6_0 = slot_228_1_0.mode:get("Rainbow")
		slot_228_7_0 = slot_228_1_0.mode:get("Encode")
		slot_228_9_0 = slot_228_1_0.mode:get("Pulse") and math.sin(slot_228_3_0 * 5) * 0.5 + 0.5 or 1

		if slot_228_7_0 then
			slot_228_10_2 = arg_228_0._enc_chars
			slot_228_11_1 = #slot_228_10_2
			slot_228_12_1 = #slot_228_2_0
			slot_228_13_1 = math.floor(math.clamp(math.abs(slot_228_3_0 * 0.5 % 2 - 1) * (slot_228_12_1 + 1), 0, slot_228_12_1))
			slot_228_14_3 = {}

			for iter_228_0 = 1, slot_228_12_1 do
				slot_228_19_2 = math.random(slot_228_11_1)
				slot_228_14_3[iter_228_0] = slot_228_10_2:sub(slot_228_19_2, slot_228_19_2)
			end

			slot_228_2_0 = slot_228_2_0:sub(1, slot_228_13_1) .. table.concat(slot_228_14_3):sub(slot_228_13_1 + 1)
		end

		if slot_228_4_0 == "Pixel" then
			slot_228_2_0 = slot_228_2_0:upper()
		end

		if slot_228_2_0 ~= arg_228_0._last_text or slot_228_4_0 ~= arg_228_0._last_font_name then
			slot_228_10_1 = render.measure_text(slot_228_5_0, "c", slot_228_2_0)
			arg_228_0._cached_hw = slot_228_10_1.x * 0.5
			arg_228_0._cached_hh = slot_228_10_1.y * 0.5
			arg_228_0._last_text = slot_228_2_0
			arg_228_0._last_font_name = slot_228_4_0
		end

		slot_228_10_0 = arg_228_0._cached_hw
		slot_228_11_0 = arg_228_0._cached_hh
		slot_228_12_0 = nil
		slot_228_13_0 = nil

		if slot_228_6_0 then
			slot_228_14_2 = arg_228_0._rainbow_colors
			slot_228_15_2 = {}
			slot_228_16_3 = 0
			slot_228_17_2 = #slot_228_2_0
			slot_228_18_1 = 1
			slot_228_19_1 = math.floor(255 * slot_228_9_0)

			while slot_228_18_1 <= slot_228_17_2 do
				slot_228_20_1 = slot_228_2_0:byte(slot_228_18_1)
				slot_228_21_2 = nil

				if slot_228_20_1 >= 240 then
					slot_228_21_2 = slot_228_2_0:sub(slot_228_18_1, slot_228_18_1 + 3)
					slot_228_18_1 = slot_228_18_1 + 4
				elseif slot_228_20_1 >= 224 then
					slot_228_21_2 = slot_228_2_0:sub(slot_228_18_1, slot_228_18_1 + 2)
					slot_228_18_1 = slot_228_18_1 + 3
				elseif slot_228_20_1 >= 192 then
					slot_228_21_2 = slot_228_2_0:sub(slot_228_18_1, slot_228_18_1 + 1)
					slot_228_18_1 = slot_228_18_1 + 2
				else
					slot_228_21_2 = slot_228_2_0:sub(slot_228_18_1, slot_228_18_1)
					slot_228_18_1 = slot_228_18_1 + 1
				end

				slot_228_23_2 = ((slot_228_17_2 > 1 and 1 - slot_228_16_3 / (slot_228_17_2 - 1) or 0) + slot_228_3_0 * 1.2) % 1 * 7
				slot_228_24_2 = math.floor(slot_228_23_2)

				if slot_228_24_2 >= 7 then
					slot_228_24_2 = 6
				end

				slot_228_25_1 = slot_228_23_2 - slot_228_24_2
				slot_228_26_1 = slot_228_14_2[slot_228_24_2 + 1]
				slot_228_27_1 = slot_228_14_2[slot_228_24_2 + 2]
				slot_228_15_2[#slot_228_15_2 + 1] = "\a" .. color(math.floor(slot_228_26_1.r + (slot_228_27_1.r - slot_228_26_1.r) * slot_228_25_1), math.floor(slot_228_26_1.g + (slot_228_27_1.g - slot_228_26_1.g) * slot_228_25_1), math.floor(slot_228_26_1.b + (slot_228_27_1.b - slot_228_26_1.b) * slot_228_25_1), slot_228_19_1):to_hex() .. slot_228_21_2
				slot_228_16_3 = slot_228_16_3 + 1
			end

			slot_228_12_0 = table.concat(slot_228_15_2)
			slot_228_13_0 = arg_228_0.c_white
		else
			slot_228_14_1, slot_228_15_1 = slot_228_1_0.accent_color:get()

			if slot_228_14_1 == "Static" then
				slot_228_16_2 = type(slot_228_15_1) == "table" and slot_228_15_1[1] or slot_228_15_1
				slot_228_13_0 = color(slot_228_16_2.r, slot_228_16_2.g, slot_228_16_2.b, math.floor(slot_228_16_2.a * slot_228_9_0))
				slot_228_12_0 = slot_228_2_0
			else
				slot_228_16_1 = slot_228_15_1[1] or arg_228_0.c_white
				slot_228_17_1 = slot_228_15_1[2] or arg_228_0.c_white
				slot_228_12_0 = arg_228_0.string:wave(slot_228_2_0, slot_228_3_0, color(slot_228_16_1.r, slot_228_16_1.g, slot_228_16_1.b, math.floor(slot_228_16_1.a * slot_228_9_0)), color(slot_228_17_1.r, slot_228_17_1.g, slot_228_17_1.b, math.floor(slot_228_17_1.a * slot_228_9_0)))
				slot_228_13_0 = arg_228_0.c_white
			end
		end

		slot_228_14_0 = arg_228_0.screen.x
		slot_228_15_0 = arg_228_0.screen.y

		if arg_228_0._sp_hw ~= slot_228_10_0 or arg_228_0._sp_hh ~= slot_228_11_0 then
			arg_228_0._sp_hw = slot_228_10_0
			arg_228_0._sp_hh = slot_228_11_0
			arg_228_0._snap_points = {
				{
					label = "Bottom Center",
					pos = vector(slot_228_14_0 * 0.5, slot_228_15_0 - slot_228_11_0 - 8)
				},
				{
					label = "Left Center",
					pos = vector(slot_228_10_0 + 4, slot_228_15_0 * 0.5)
				},
				{
					label = "Right Center",
					pos = vector(slot_228_14_0 - slot_228_10_0 - 4, slot_228_15_0 * 0.5)
				}
			}
		end

		slot_228_16_0 = arg_228_0._snap_points
		slot_228_17_0 = vector(slot_228_1_0.pos_x:get(), slot_228_1_0.pos_y:get())
		slot_228_17_0.x = math.max(slot_228_10_0, math.min(slot_228_14_0 - slot_228_10_0, slot_228_17_0.x))
		slot_228_17_0.y = math.max(slot_228_11_0, math.min(slot_228_15_0 - slot_228_11_0, slot_228_17_0.y))

		slot_228_1_0.pos_x:set(slot_228_17_0.x)
		slot_228_1_0.pos_y:set(slot_228_17_0.y)

		arg_228_0.position = slot_228_17_0
		slot_228_18_0 = slot_0_1_0.get_mouse_position()
		slot_228_19_0 = slot_0_1_0.get_alpha() > 0
		slot_228_20_0 = arg_228_0:is_point_in_rect(slot_228_18_0, {
			x1 = slot_228_17_0.x - slot_228_10_0,
			y1 = slot_228_17_0.y - slot_228_11_0,
			x2 = slot_228_17_0.x + slot_228_10_0,
			y2 = slot_228_17_0.y + slot_228_11_0
		})

		if common.is_button_down(1) then
			if slot_228_20_0 and not arg_228_0.dragging and slot_228_19_0 then
				arg_228_0.dragging = true
				arg_228_0.drag_offset = vector(slot_228_18_0.x - slot_228_17_0.x, slot_228_18_0.y - slot_228_17_0.y)
			end
		elseif arg_228_0.dragging and common.is_button_released(1) then
			arg_228_0.dragging = false

			arg_228_0:save_pos(slot_228_1_0.pos_x:get(), slot_228_1_0.pos_y:get())
		end

		if arg_228_0.dragging and slot_228_19_0 then
			arg_228_0.fading = false
			slot_228_21_1 = vector(math.max(slot_228_10_0, math.min(slot_228_14_0 - slot_228_10_0, slot_228_18_0.x - arg_228_0.drag_offset.x)), math.max(slot_228_11_0, math.min(slot_228_15_0 - slot_228_11_0, slot_228_18_0.y - arg_228_0.drag_offset.y)))
			slot_228_22_1 = nil
			slot_228_23_1 = math.huge
			slot_228_24_1 = (slot_228_14_0 * 0.009)^2

			for iter_228_1, iter_228_2 in ipairs(slot_228_16_0) do
				slot_228_30_1 = slot_228_21_1.x - iter_228_2.pos.x
				slot_228_31_1 = slot_228_21_1.y - iter_228_2.pos.y
				slot_228_32_1 = slot_228_30_1 * slot_228_30_1 + slot_228_31_1 * slot_228_31_1

				if slot_228_32_1 < slot_228_24_1 and slot_228_32_1 < slot_228_23_1 then
					slot_228_23_1 = slot_228_32_1
					slot_228_22_1 = iter_228_2
				end
			end

			slot_228_25_0 = slot_228_22_1 and slot_228_22_1.pos or slot_228_21_1

			if not arg_228_0.smooth_pos then
				arg_228_0.smooth_pos = vector(slot_228_25_0.x, slot_228_25_0.y)
			end

			slot_228_26_0 = slot_228_22_1 and 0.18 or 0.35
			arg_228_0.smooth_pos.x = arg_228_0.smooth_pos.x + (slot_228_25_0.x - arg_228_0.smooth_pos.x) * slot_228_26_0
			arg_228_0.smooth_pos.y = arg_228_0.smooth_pos.y + (slot_228_25_0.y - arg_228_0.smooth_pos.y) * slot_228_26_0
			arg_228_0.circle_sizes = arg_228_0.circle_sizes or {}
			arg_228_0.label_alphas = arg_228_0.label_alphas or {}
			arg_228_0.circle_alphas = arg_228_0.circle_alphas or {}
			arg_228_0.dist_alphas = arg_228_0.dist_alphas or {}
			slot_228_27_0 = arg_228_0.circle_sizes
			slot_228_28_1 = arg_228_0.label_alphas
			slot_228_29_1 = arg_228_0.circle_alphas
			slot_228_30_0 = arg_228_0.dist_alphas
			slot_228_31_0 = arg_228_0.smooth_pos.x
			slot_228_32_0 = arg_228_0.smooth_pos.y

			for iter_228_3, iter_228_4 in ipairs(slot_228_16_0) do
				slot_228_38_0 = slot_228_22_1 and slot_228_22_1.label == iter_228_4.label
				slot_228_39_0 = math.abs(math.sin(slot_228_3_0 * 1.8 + iter_228_3))
				slot_228_40_0 = slot_228_31_0 - iter_228_4.pos.x
				slot_228_41_0 = slot_228_32_0 - iter_228_4.pos.y
				slot_228_42_0 = math.max(0, 1 - math.sqrt(slot_228_40_0 * slot_228_40_0 + slot_228_41_0 * slot_228_41_0) / 200)
				slot_228_30_0[iter_228_3] = (slot_228_30_0[iter_228_3] or 0) + (slot_228_42_0 - (slot_228_30_0[iter_228_3] or 0)) * 0.06
				slot_228_43_0 = slot_228_30_0[iter_228_3]
				slot_228_44_0 = slot_228_38_0 and 12 or 6 + slot_228_39_0 * 2.5
				slot_228_27_0[iter_228_3] = (slot_228_27_0[iter_228_3] or slot_228_44_0) + (slot_228_44_0 - (slot_228_27_0[iter_228_3] or slot_228_44_0)) * 0.06
				slot_228_45_0 = (slot_228_38_0 and 40 or 45 + slot_228_39_0 * 20) * slot_228_43_0
				slot_228_29_1[iter_228_3] = (slot_228_29_1[iter_228_3] or slot_228_45_0) + (slot_228_45_0 - (slot_228_29_1[iter_228_3] or slot_228_45_0)) * 0.06
				slot_228_46_0 = (slot_228_38_0 and 255 or 120) * slot_228_43_0
				slot_228_28_1[iter_228_3] = (slot_228_28_1[iter_228_3] or slot_228_46_0) + (slot_228_46_0 - (slot_228_28_1[iter_228_3] or slot_228_46_0)) * 0.06

				render.circle(iter_228_4.pos, color(255, 255, 255, math.floor(slot_228_29_1[iter_228_3])), slot_228_27_0[iter_228_3], 32, 1)
				render.circle(iter_228_4.pos, color(255, 255, 255, math.floor(slot_228_29_1[iter_228_3] * 1.3)), slot_228_27_0[iter_228_3] * 0.5, 32, 1)
				render.text(1, vector(iter_228_4.pos.x, iter_228_4.pos.y - 20), color(255, 255, 255, math.floor(slot_228_28_1[iter_228_3])), "c", iter_228_4.label)
			end

			slot_228_1_0.pos_x:set(slot_228_31_0)
			slot_228_1_0.pos_y:set(slot_228_32_0)

			arg_228_0.position = arg_228_0.smooth_pos
		else
			if not arg_228_0.fading and arg_228_0.circle_sizes then
				arg_228_0.fading = true
			end

			if arg_228_0.fading and arg_228_0.circle_sizes then
				slot_228_21_0 = true
				slot_228_22_0 = arg_228_0.circle_sizes
				slot_228_23_0 = arg_228_0.label_alphas
				slot_228_24_0 = arg_228_0.circle_alphas

				for iter_228_5, iter_228_6 in ipairs(slot_228_16_0) do
					slot_228_22_0[iter_228_5] = (slot_228_22_0[iter_228_5] or 0) * 0.93
					slot_228_23_0[iter_228_5] = (slot_228_23_0[iter_228_5] or 0) * 0.93
					slot_228_24_0[iter_228_5] = (slot_228_24_0[iter_228_5] or 0) * 0.93

					render.circle(iter_228_6.pos, color(255, 255, 255, math.floor(slot_228_24_0[iter_228_5])), slot_228_22_0[iter_228_5], 32, 1)
					render.circle(iter_228_6.pos, color(255, 255, 255, math.floor(slot_228_24_0[iter_228_5] * 1.3)), slot_228_22_0[iter_228_5] * 0.5, 32, 1)
					render.text(1, vector(iter_228_6.pos.x, iter_228_6.pos.y - 20), color(255, 255, 255, math.floor(slot_228_23_0[iter_228_5])), "c", iter_228_6.label)

					if slot_228_23_0[iter_228_5] > 0.5 then
						slot_228_21_0 = false
					end
				end

				if slot_228_21_0 then
					arg_228_0.fading = false
					arg_228_0.smooth_pos = nil
					arg_228_0.circle_sizes = nil
					arg_228_0.label_alphas = nil
					arg_228_0.circle_alphas = nil
					arg_228_0.dist_alphas = nil
				end
			end
		end

		render.text(slot_228_5_0, arg_228_0.position, slot_228_13_0, "c", slot_228_12_0)
	end,
	init = function(arg_229_0)
		events.shutdown(function()
			local var_230_0 = arg_229_0.menu.elements.watermark_gear

			db.godsense_watermark_x = var_230_0.pos_x:get()
			db.godsense_watermark_y = var_230_0.pos_y:get()
		end)

		local function var_229_0()
			arg_229_0:on_render()
		end

		arg_229_0.menu.elements.watermark_gear.input:set_callback(function(arg_232_0)
			events.render(var_229_0, arg_232_0:get() ~= "")
		end, true)
	end
}):struct("sidebar")({
	on_render = function(arg_233_0)
		if slot_0_1_0.get_alpha() <= 0 then
			return
		end

		local var_233_0 = slot_0_1_0.get_style("Link Active")
		local var_233_1 = color(var_233_0.r, var_233_0.g, var_233_0.b, 200)
		local var_233_2 = color(var_233_0.r, var_233_0.g, var_233_0.b, 0)

		slot_0_1_0.sidebar(arg_233_0.string:wave("G o d S e n s e", globals.realtime, var_233_1, var_233_2), "leaf")
	end,
	init = function(arg_234_0)
		local function var_234_0()
			arg_234_0:on_render()
		end

		events.render(var_234_0)
	end
}):run()
