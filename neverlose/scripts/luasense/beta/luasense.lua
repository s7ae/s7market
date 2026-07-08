slot_0_0_0 = require("neverlose/clipboard")
slot_0_1_0 = require("neverlose/pui")
slot_0_2_0 = require("neverlose/inspect")
slot_0_3_0 = require("neverlose/gradient")
slot_0_4_0 = require("neverlose/base64")
slot_0_5_0 = require("neverlose/smoothy")
slot_0_6_0 = require("neverlose/voice_listener")
slot_0_7_0 = {}
slot_0_8_0 = {}
slot_0_9_0 = {}
slot_0_10_0 = {}
slot_0_11_0 = {}
slot_0_12_0 = {}
slot_0_13_0 = {}
slot_0_14_0 = {}
slot_0_15_0 = {}
slot_0_16_0 = {}
slot_0_17_0 = {}
slot_0_18_0 = {}
slot_0_19_1 = {}
slot_0_19_0 = {
	common = {
		get_username = common.get_username,
		get_time = common.get_time
	},
	entity = {
		get = entity.get,
		get_local_player = entity.get_local_player
	},
	render = {
		measure_text = render.measure_text,
		text = render.text,
		rect = render.rect,
		circle = render.circle,
		shadow = render.shadow,
		screen_size = render.screen_size(),
		screen_center = render.screen_size() / 2
	},
	math = {
		floor = math.floor,
		ceil = math.ceil,
		min = math.min,
		max = math.max,
		abs = math.abs,
		difference = math.difference,
		normalize_yaw = math.normalize_yaw,
		lerp = function(arg_1_0, arg_1_1, arg_1_2)
			return arg_1_0 + arg_1_2 * (arg_1_1 - arg_1_0)
		end
	},
	string = {
		format = string.format,
		lower = string.lower,
		find = string.find
	},
	utils = {
		random_int = utils.random_int,
		random_float = utils.random_float
	},
	globals = {
		realtime = globals.realtime,
		curtime = globals.curtime,
		frametime = globals.frametime,
		tickcount = globals.tickcount,
		commandack = globals.commandack
	},
	ui = {
		getalpha = ui.get_alpha,
		get_icon = ui.get_icon,
		get_style = ui.get_style
	},
	colors = {
		black = color(0, 0, 0, 255),
		white = color(255, 255, 255, 255),
		transparent = color(0, 0, 0, 0)
	},
	entity_methods = {
		is_enemy = function(arg_2_0)
			return arg_2_0:is_enemy()
		end,
		is_alive = function(arg_3_0)
			return arg_3_0:is_alive()
		end,
		get_player_weapon = function(arg_4_0)
			return arg_4_0:get_player_weapon()
		end,
		get_name = function(arg_5_0)
			return arg_5_0:get_name()
		end
	},
	string_ops = {
		to_hex = function(arg_6_0)
			return arg_6_0:to_hex()
		end,
		alpha_modulate = function(arg_7_0, arg_7_1)
			return arg_7_0:alpha_modulate(arg_7_1)
		end
	},
	events = {
		register = slot_0_11_0.register,
		set = function(arg_8_0, arg_8_1)
			events[arg_8_0]:set(arg_8_1)
		end
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
	weapon_actions = {
		knife = "Knifed",
		inferno = "Burned",
		hegrenade = "Naded"
	},
	print = {
		raw = print_raw,
		dev = print_dev
	},
	panorama = {
		get_name = panorama.MyPersonaAPI.GetName,
		get_xuid = panorama.MyPersonaAPI.GetXuid
	}
}
slot_0_20_0 = "BETA"
slot_0_21_0 = new_class():struct("core")({
	username = slot_0_19_0.common.get_username(),
	steamid = slot_0_19_0.panorama.get_xuid(),
	steam_name = slot_0_19_0.panorama.get_name(),
	screen_size = slot_0_19_0.render.screen_size,
	screen_center = slot_0_19_0.render.screen_center,
	dpi_scale = slot_0_19_0.render.screen_size / vector(2560, 1440),
	hitgroups = slot_0_19_0.hitgroups,
	wpn2act = slot_0_19_0.weapon_actions,
	branded_printing = function(arg_9_0, arg_9_1)
		local var_9_0 = slot_0_9_0.visuals.accent:get()
		local var_9_1 = slot_0_19_0.string.format("[%s] %s", "\a" .. slot_0_19_0.string_ops.to_hex(var_9_0) .. "Lua\aDEFAULTSense", arg_9_1)

		slot_0_19_0.print.raw(var_9_1)
		slot_0_19_0.print.dev(var_9_1)
	end,
	with_icon = function(arg_10_0, arg_10_1, arg_10_2, arg_10_3)
		local var_10_0 = slot_0_19_0.ui.get_icon(arg_10_1)

		if arg_10_3 ~= nil then
			var_10_0 = "\a" .. (type(arg_10_3) == "string" and arg_10_3 or slot_0_19_0.string_ops.to_hex(arg_10_3)) .. var_10_0 .. "\aDEFAULT"
		end

		return var_10_0 .. " " .. arg_10_2
	end,
	gradient = slot_0_3_0.text_animate("S E N S E", -2, {
		color(255, 255, 255),
		color(91, 91, 91)
	})
}):struct("shared")({
	data = {
		team = 0,
		throw_time = 0,
		pin_pulled = false,
		movetype = -1,
		able_to_render = false,
		scoped = false
	},
	collect = function(arg_11_0)
		local var_11_0 = entity.get_local_player()

		if var_11_0 == nil then
			return
		end

		if not var_11_0:is_alive() then
			return
		end

		arg_11_0.data.localplayer = var_11_0

		local var_11_1 = var_11_0:get_player_weapon()

		if var_11_1 == nil then
			return
		end

		arg_11_0.data.scoped = var_11_0.m_bIsScoped
		arg_11_0.data.movetype = var_11_0.m_MoveType
		arg_11_0.data.pin_pulled = var_11_1.m_bPinPulled
		arg_11_0.data.throw_time = var_11_1.m_fThrowTime
		arg_11_0.data.team = var_11_0.m_iTeamNum
		arg_11_0.data.velocity = var_11_0.m_vecVelocity
	end,
	collect_render_info = function(arg_12_0)
		local var_12_0 = arg_12_0.data.localplayer

		if var_12_0 == nil then
			return
		end

		if not var_12_0 then
			return
		end

		if not var_12_0:is_alive() then
			arg_12_0.data.able_to_render = false

			return
		end

		arg_12_0.data.able_to_render = true
	end
}):struct("safecall")({
	execute = function(arg_13_0, arg_13_1, arg_13_2, arg_13_3)
		return function(...)
			local var_14_0, var_14_1 = pcall(arg_13_3, ...)

			if not var_14_0 then
				local var_14_2 = "safe call failed [" .. arg_13_1 .. "] -> " .. var_14_1

				if arg_13_2 then
					print_raw(var_14_2, "\npayload->", slot_0_2_0({
						...
					}))
				end

				return false, var_14_2
			else
				return var_14_1, var_14_0
			end
		end
	end
}):struct("refs")({
	weapon_action = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"),
	pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
	base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
	offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
	jitter = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
	jitter_val = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
	body_yaw = {
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
		ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding")
	},
	freestand = {
		ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
		ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
		ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding")
	},
	def = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
	legs = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
	slow = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
	scope_type = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
	hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
	inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
	fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
	freestand_bind = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	hideshot_config = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
	autopeek = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
	fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
})
slot_0_22_0 = ui.find("Miscellaneous", "Main", "Movement", "Quick Stop")
slot_0_23_0 = slot_0_21_0.core
slot_0_23_0.shared_data = slot_0_21_0.shared.data

function slot_0_11_0.register(arg_15_0, arg_15_1, arg_15_2)
	events[arg_15_0]:set(slot_0_21_0.safecall:execute(arg_15_1, arg_15_0 ~= "shutdown", arg_15_2))
end

slot_0_24_0 = {
	black = color(0, 255),
	white = color(255)
}
getmetatable(color()).override = function(arg_16_0, arg_16_1, arg_16_2)
	local var_16_0 = arg_16_0:clone()

	var_16_0[arg_16_1] = arg_16_2

	return var_16_0
end
slot_0_25_1 = nil
slot_0_25_0 = {}
slot_0_26_0 = 2.2222222222222223

function slot_0_25_0.difference(arg_17_0, arg_17_1)
	return math.abs(arg_17_0 - arg_17_1)
end

function slot_0_25_0.color_lerp(arg_18_0, arg_18_1, arg_18_2)
	local var_18_0 = globals.frametime * 100

	arg_18_2 = arg_18_2 * math.min(var_18_0, slot_0_26_0)

	return arg_18_0:lerp(arg_18_1, arg_18_2)
end

function slot_0_25_0.lerp(arg_19_0, arg_19_1, arg_19_2)
	if arg_19_0 == arg_19_1 then
		return arg_19_1
	end

	arg_19_2 = arg_19_2 * (globals.frametime * 170)

	local var_19_0 = arg_19_0 + (arg_19_1 - arg_19_0) * arg_19_2

	if math.abs(var_19_0 - arg_19_1) < 0.01 then
		return arg_19_1
	end

	return var_19_0
end

math.normalize_yaw = math.normalize_yaw
slot_0_27_0 = new_class():struct("manager")({
	base_speed = 0.07,
	_list = {},
	new = function(arg_20_0, arg_20_1, arg_20_2, arg_20_3, arg_20_4)
		arg_20_3 = arg_20_3 or arg_20_0.base_speed

		local var_20_0 = type(arg_20_2) ~= "number"

		if arg_20_0._list[arg_20_1] == nil then
			arg_20_0._list[arg_20_1] = arg_20_4 and arg_20_4 or var_20_0 and color(0, 0, 0, 0) or 0
		end

		local var_20_1 = var_20_0 and arg_20_2.lerp or slot_0_25_0.lerp

		arg_20_0._list[arg_20_1] = var_20_1(arg_20_0._list[arg_20_1], arg_20_2, arg_20_3)

		return arg_20_0._list[arg_20_1]
	end,
	get = function(arg_21_0, arg_21_1)
		return arg_21_0._list[arg_21_1]
	end,
	reset = function(arg_22_0, arg_22_1)
		arg_22_0._list[arg_22_1] = nil
	end,
	clear = function(arg_23_0)
		arg_23_0._list = {}
	end
}).manager
slot_0_28_0 = {
	conditions = {
		"Standing",
		"Running",
		"Slowmotion",
		"Crouch",
		"Crouch Moving",
		"Air",
		"Air Crouch",
		"Manual"
	},
	cheats = {
		"NL",
		"GS"
	}
}

function slot_0_29_0(arg_24_0, arg_24_1, arg_24_2)
	return slot_0_1_0.create(slot_0_23_0:with_icon(arg_24_0, "", "{Link Active}"), arg_24_1, arg_24_2)
end

slot_0_30_0 = slot_0_29_0("igloo", "", 1)
slot_0_31_0 = slot_0_29_0("igloo", "", 1)
slot_0_32_0 = slot_0_29_0("igloo", "\nchooser", 1)
slot_0_33_0 = slot_0_29_0("igloo", "Links", 1)
slot_0_34_0 = slot_0_29_0("igloo", "Discord", 1)
slot_0_35_0 = slot_0_29_0("igloo", "\nconfigs2", 2)
slot_0_36_0 = slot_0_29_0("igloo", "\nconfigs", 2)
slot_0_37_0 = slot_0_29_0("atom", "\ncurrent state", 2)
slot_0_38_0 = slot_0_29_0("atom", "\n233332", 2)
slot_0_39_0 = slot_0_29_0("atom", "\n2332", 2)
slot_0_40_0 = slot_0_29_0("atom", "\nTickbase", 2)
slot_0_41_0 = slot_0_29_0("atom", "", 2)
slot_0_42_0 = slot_0_29_0("atom", "\n4", 1)
slot_0_43_0 = slot_0_29_0("atom", "\nlister", 1)
slot_0_44_0 = slot_0_29_0("atom", "\n", 1)
slot_0_45_0 = slot_0_29_0("atom", "\nextra1", 1)
slot_0_46_0 = slot_0_29_0("atom", "\nextra", 2)
slot_0_47_0 = slot_0_29_0("atom", "\n5", 1)
slot_0_48_0 = slot_0_29_0("atom", "Defensive", 1)
slot_0_49_0 = slot_0_29_0("rectangles-mixed", "\nvisuals2", 2)
slot_0_50_0 = slot_0_29_0("rectangles-mixed", "\ntab selector", 1)
slot_0_51_0 = slot_0_29_0("rectangles-mixed", "Visuals", 1)
slot_0_52_0 = slot_0_29_0("rectangles-mixed", "Movement", 1)
slot_0_53_0 = slot_0_29_0("rectangles-mixed", "Extra", 2)
slot_0_54_0 = slot_0_29_0("rectangles-mixed", "\nvisuals", 2)
slot_0_55_0 = slot_0_29_0("rectangles-mixed", "Widgets\nwidgets", 2)
slot_0_56_0 = slot_0_29_0("rectangles-mixed", "\nPing Spike")
slot_0_57_0 = {
	slot_0_23_0:with_icon("star-christmas", " Meta - \a55555586japan (new settings)", "{Link Active}"),
	slot_0_23_0:with_icon("sun", " Aggressive [fixed] - \a55555586brandon", "{Link Active}"),
	slot_0_23_0:with_icon("soap", " Snap [test] - \a55555586japan", "{Link Active}"),
	slot_0_23_0:with_icon("gitter", " Custom Jitter - \a55555586brandon", "{Link Active}"),
	slot_0_23_0:with_icon("crown", " Royal - \a55555586japan x brandon", "{Link Active}"),
	"------------------------------------------",
	"Create new config..."
}
slot_0_58_0 = {
	github_url = "https://raw.githubusercontent.com/zxjapan/ls_config/refs/heads/main/codes.txt",
	github_token = "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",
	github_api_url = "https://api.github.com/repos/zxjapan/ls_config/contents/codes.txt",
	db_key = "userverified"
}
slot_0_59_0 = " "

if ({
	robertica = true,
	Netflix234 = true,
	ceenai = true,
	david2020 = true,
	xRazor = true,
	Andreic2001 = true
})[common.get_username()] then
	error("blacklisted")

	return
end

slot_0_9_0 = {
	main = {
		username = slot_0_30_0:label(slot_0_23_0:with_icon("person-circle-question", "   User\n", "{Link Active}")),
		user_button = slot_0_30_0:button(common.get_username(), nil, true),
		version = slot_0_30_0:label(slot_0_23_0:with_icon("code-commit", "  Version\n", "{Link Active}")),
		version_button = slot_0_30_0:button("3.00.zb1", nil, true),
		scripts = slot_0_33_0:label("Scripts\n"),
		live_button = slot_0_33_0:button(slot_0_23_0:with_icon("circle-1", " Live\n", "{Link Active}"), function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=luasense")
		end, true),
		beta_button = slot_0_33_0:button(slot_0_23_0:with_icon("circle-2", " Beta", "{Link Active}"), function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=byAMx1")
		end, true),
		configs = slot_0_33_0:label("Brandon configs\n"),
		live_button2 = slot_0_33_0:button(slot_0_23_0:with_icon("square-1", " Live\n", "{Link Active}"), function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=RuE7C8")
		end, true),
		beta_button2 = slot_0_33_0:button(slot_0_23_0:with_icon("square-2", " Beta", "{Link Active}"), function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://neverlose.cc/market/item?id=MAxYSG")
		end, true),
		youtube = slot_0_33_0:label("Socials\n"),
		yt_button = slot_0_33_0:button(slot_0_23_0:with_icon("youtube", " YT\n", "{Link Active}"), function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://www.youtube.com/@vorbic")
		end, true),
		dc_label = slot_0_34_0:label(slot_0_23_0:with_icon("bug", " Encounter any Bugs?\n", "{Link Active}")),
		dc_button = slot_0_34_0:button(slot_0_23_0:with_icon("discord", " Join Us!\n", "{Link Active}"), function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/NgU7NzRxXr")
		end, true),
		dc_label = slot_0_34_0:label(slot_0_23_0:with_icon("check", " Want to verify?\n", "{Link Active}")),
		verify_switch = slot_0_34_0:button("           Click me!           ", function()
			slot_0_58_0.check()
		end, false),
		new_button = slot_0_36_0:button(slot_0_23_0:with_icon("plus", " save \n"), function()
			slot_0_7_0.save_config()
		end, true),
		import_button = slot_0_36_0:button(slot_0_23_0:with_icon("up-from-line", " import \n", "{Link Active}"), function()
			slot_0_7_0.import_config()
		end, true),
		export_button = slot_0_36_0:button(slot_0_23_0:with_icon("down-from-line", " export \n", "{Link Active}"), function()
			slot_0_7_0.export_config()
		end, true),
		load_button = slot_0_36_0:button(slot_0_23_0:with_icon("plus", " load \n"), function()
			slot_0_7_0.load_config()
		end, true),
		delete_button = slot_0_36_0:button("                                   \aFF0000FFdelete                                  \n", function()
			slot_0_7_0.delete_config()
		end, true),
		input_name = slot_0_35_0:input("Config Name", "Type Here"),
		preset_list = slot_0_35_0:list("", slot_0_8_0)
	},
	labels = {},
	rage = {
		state_label = slot_0_37_0:label("oh oh im not meant to be empty!"),
		aa_lister = slot_0_43_0:list("\n", {
			slot_0_23_0:with_icon("gears", "  Settings", "{Link Active}"),
			slot_0_23_0:with_icon("helmet-safety", "  Anti-Aim", "{Link Active}"),
			slot_0_23_0:with_icon("shield-plus", "  Defensive", "{Link Active}")
		}),
		anims = {},
		team_list = slot_0_44_0:combo(slot_0_23_0:with_icon("people-group", "  Choose Team", "{Link Active}"), {
			"T",
			"CT"
		}),
		state_list = slot_0_44_0:combo(slot_0_23_0:with_icon("person-running", "   Anti-Aim State", "{Link Active}"), slot_0_28_0.conditions),
		manual = slot_0_45_0:combo(slot_0_23_0:with_icon("square-poll-horizontal", " Yaw Base", "{Link Active}"), "At Target", "Left", "Right", "Forward"),
		freestanding_bind = slot_0_45_0:switch(slot_0_23_0:with_icon("block-brick-fire", "  Freestanding", "{Link Active}"), false, function(arg_37_0)
			return {
				prefer_manual = arg_37_0:switch("Prefer Manual AA"),
				keep_fs = arg_37_0:switch("Keep FS Enabled After Manual AA"),
				freestand_options = arg_37_0:selectable("Disablers", slot_0_28_0.conditions),
				freestand_enablers = arg_37_0:selectable("Enablers", slot_0_28_0.conditions),
				freestand_body = arg_37_0:list("Bodyyaw", {
					"Static",
					"Jitter"
				})
			}, false
		end),
		avoid_knife = slot_0_46_0:switch(slot_0_23_0:with_icon("sword", "  Avoid Backstab", "{Link Active}"), false),
		safe_head = slot_0_46_0:switch(slot_0_23_0:with_icon("eye-slash", "  Hide Head", "{Link Active}"), false, function(arg_38_0)
			return {
				safe_options = arg_38_0:listable("Conditions", {
					"Standing",
					"Crouch",
					"Air Crouch Knife",
					"Distance",
					"Height Advantage",
					"Taser In Air"
				})
			}, true
		end),
		hidden_builder = slot_0_48_0:switch("Hidden", false, function(arg_39_0)
			return {
				state_list = arg_39_0:combo("Condition", slot_0_28_0.conditions),
				antiaim_label = arg_39_0:label(" "),
				antiaim_conditions = arg_39_0:selectable("Active On", slot_0_28_0.conditions),
				disablers = arg_39_0:selectable("Disablers", {
					"Freestanding",
					"Manual aa",
					"Peek Assist"
				}),
				on_exploit = arg_39_0:selectable("On Exploit", {
					"Doubletap",
					"Hideshots"
				}),
				antiaim_label = arg_39_0:label(" ")
			}, true
		end),
		anims = slot_0_46_0:switch(slot_0_23_0:with_icon("flask-round-potion", "  Animations", "{Link Active}"), false, function(arg_40_0)
			return {
				move_jitter_mode = arg_40_0:list("Jitter Mode", {
					"Default",
					"Delta"
				}),
				move_jitter = arg_40_0:slider("Jitter", 0, 10, 0, 1, function(arg_41_0)
					if arg_41_0 == 0 then
						return "Default"
					else
						return tostring(arg_41_0) .. "%"
					end
				end),
				move_legs1 = arg_40_0:slider("Legs Delta 1", 0, 100, 0, 1, function(arg_42_0)
					if arg_42_0 == 0 then
						return "Default"
					else
						return tostring(arg_42_0) .. "%"
					end
				end),
				move_legs2 = arg_40_0:slider("Legs Delta 2", 0, 100, 0, 1, function(arg_43_0)
					if arg_43_0 == 0 then
						return "Default"
					else
						return tostring(arg_43_0) .. "%"
					end
				end),
				move_fall = arg_40_0:slider("Falling", 0, 10, 0, 1, function(arg_44_0)
					if arg_44_0 == 0 then
						return "Default"
					else
						return tostring(arg_44_0) .. "%"
					end
				end),
				move_lean_val = arg_40_0:slider("Leaning", 0, 100, 0, 1, function(arg_45_0)
					if arg_45_0 == 0 then
						return "NL"
					else
						return tostring(arg_45_0)
					end
				end)
			}, true
		end),
		additions = slot_0_46_0:selectable(slot_0_23_0:with_icon("plus-large", "  Additions", "{Link Active}"), {
			"Warmup / Round End AA",
			"No Fakelag on Exploits",
			"Fluccate Fakelag on Body"
		})
	},
	defensive = {
		defensive_settings = slot_0_48_0:label(slot_0_23_0:with_icon("helmet-safety", "  Defensive Settings", "{Link Active}"))
	},
	misc_chooser = slot_0_50_0:list("\n", {
		slot_0_23_0:with_icon("palette", "  Visuals", "{Link Active}"),
		slot_0_23_0:with_icon("swatchbook", "  Misc", "{Link Active}")
	}),
	visuals = {
		scope = {},
		accent = slot_0_49_0:color_picker(slot_0_23_0:with_icon("image-landscape", "Accent", "{Link Active}"), color("96C83CFF")),
		watermark_style = slot_0_49_0:list("", {
			"Legacy",
			"Recode",
			"Desync.Max"
		}),
		watermark = slot_0_49_0:combo("Watermark Position", {
			"Left",
			"Right",
			"Bottom"
		}),
		molotov_radius = slot_0_51_0:switch(slot_0_23_0:with_icon("circle-xmark", "  Molotov Radius", "{Link Active}"), false),
		smokes_radius = slot_0_51_0:switch(slot_0_23_0:with_icon("circle", "  Smoke Radius", "{Link Active}"), false),
		gs_inds = slot_0_51_0:switch(slot_0_23_0:with_icon("badge-dollar", "  500$ Indicators", "{Link Active}"), false),
		scope = slot_0_55_0:switch(slot_0_23_0:with_icon("telescope", "  Scope Overlay", "{Link Active}"), false, function(arg_46_0)
			return {
				scope_style = arg_46_0:list("Style", {
					"Default",
					"T",
					"X"
				}),
				scope_settings = arg_46_0:selectable("Settings", {
					"Spread Based",
					"Glow",
					"Animated Zoom"
				}),
				scope_size = arg_46_0:slider("Size", 0, 300, 100),
				scope_gap = arg_46_0:slider("Gap", 0, 300, 5),
				scope_color1 = arg_46_0:color_picker("Color", color(255, 255, 255, 255)),
				scope_color2 = arg_46_0:color_picker("Second Color", color(255, 255, 255, 0))
			}, true
		end),
		kibit_hitmark = slot_0_51_0:switch(slot_0_23_0:with_icon("bullseye-arrow", "  Kibit Hitmarker", "{Link Active}"), false, function(arg_47_0)
			return {
				kibit_hitmark_color = arg_47_0:color_picker("Color", color(88, 255, 209, 255))
			}, true
		end),
		notifs = slot_0_55_0:switch(slot_0_23_0:with_icon("bell", "  Notifications", "{Link Active}"), false, function(arg_48_0)
			return {
				notifs_prefix = arg_48_0:switch("Prefix infront of text"),
				notifs_prefix_font = arg_48_0:list("Font", {
					"Default",
					"Small",
					"Console",
					"Bold"
				}),
				notifs_prefix_clr = arg_48_0:color_picker("Prefix color", color(0, 255, 0, 255)),
				notifs_hit_clr = arg_48_0:color_picker("Hit color", color(0, 255, 0, 255)),
				notifs_miss_clr = arg_48_0:color_picker("Miss color", color(255, 0, 0, 255)),
				notifs_glow_amount = arg_48_0:slider("Glow amount", 0, 100, 41),
				notifs_round_amount = arg_48_0:slider("Rounded amount", 0, 15, 11)
			}, true
		end),
		slowed_down = slot_0_55_0:switch(slot_0_23_0:with_icon("turtle", "  Slowed Down", "{Link Active}"), false, function(arg_49_0)
			return {
				style = arg_49_0:list("Glow", "Yes", "No")
			}, true
		end)
	},
	misc = {
		aspect_ratio = slot_0_53_0:switch(slot_0_23_0:with_icon("arrows-to-circle", "  Aspect Ratio Manager", "{Link Active}"), false),
		no_fall = slot_0_52_0:switch(slot_0_23_0:with_icon("person-falling", "  No Fall Damage", "{Link Active}"), false),
		fast_ladder = slot_0_52_0:switch(slot_0_23_0:with_icon("water-ladder", "  Fast Ladder", "{Link Active}"), false),
		view_model_changer = slot_0_53_0:switch(slot_0_23_0:with_icon("eye", "  View Model", "{Link Active}"), false),
		clantag = slot_0_53_0:switch(slot_0_23_0:with_icon("tag", "  Clantag [\vsynced\r]", "{Link Active}"), false),
		log_event = slot_0_53_0:selectable(slot_0_23_0:with_icon("calendar-star", "  Log Events", "{Link Active}"), {
			"Aimbot",
			"Purchases"
		}),
		client_nickname = slot_0_53_0:switch(slot_0_23_0:with_icon("user", "  Client Sided Nickname", "{Link Active}"), false, function(arg_50_0)
			return {
				client_nickname_text = arg_50_0:input("Nickname", "Type Here")
			}, true
		end),
		super_toss = slot_0_53_0:switch(slot_0_23_0:with_icon("arrow-up-right-from-square", "  Super Toss", "{Link Active}"), false),
		freeze_fakeduck = slot_0_52_0:switch(slot_0_23_0:with_icon("duck", "  Freezetime Fakeduck", "{Link Active}"), false),
		unlock_fakeduck = slot_0_52_0:switch(slot_0_23_0:with_icon("unlock", "  Unlock Fakeduck Speed", "{Link Active}"), false),
		fake_latency_toggle = slot_0_56_0:switch(slot_0_23_0:with_icon("trash-clock", "  Fake Latency", "{Link Active}"), false, function(arg_51_0)
			return {
				fake_latency_slider = arg_51_0:slider(slot_0_23_0:with_icon("trash-clock", " Fake Latency", "{Link Active}"), 0, 200, 0, 1, "ms")
			}, true
		end)
	}
}

slot_0_9_0.rage.hidden_builder:visibility(false)

slot_0_9_0.defensive.defensive_conditions = slot_0_9_0.defensive.defensive_settings:create():selectable("Conditions", slot_0_28_0.conditions)
slot_0_9_0.defensive.game_events = slot_0_9_0.defensive.defensive_settings:create():selectable("Game Events", {
	"Weapon Switch",
	"Weapon Reload"
})
slot_0_9_0.defensive.force_hideshot = slot_0_9_0.defensive.defensive_settings:create():switch("Force On Hideshots")

function slot_0_9_0.capitalize(arg_52_0)
	return (arg_52_0:gsub("^%l", string.upper))
end

function slot_0_9_0.menu_handler()
	local var_53_0 = {}
	local var_53_1 = {}

	local function var_53_2(arg_54_0)
		var_53_0[arg_54_0] = {}
		var_53_0[arg_54_0].defensive_tickbase = slot_0_40_0:slider(slot_0_23_0:with_icon("shield-check", "   \aFFF800FFTickbase", "\aFFF800FF"), 0, 1, 0, 1, function(arg_55_0)
			return arg_55_0 == 0 and "Neverlose" or "LuaSense"
		end)
		var_53_0[arg_54_0].tick_random = var_53_0[arg_54_0].defensive_tickbase:create():switch("Random choke\n" .. arg_54_0, false)
		var_53_0[arg_54_0].tick_speed1 = var_53_0[arg_54_0].defensive_tickbase:create():slider("Choke\n" .. arg_54_0, 1, 22, 1, 1, function(arg_56_0)
			return arg_56_0 == 16 and "Neverlose" or tostring(arg_56_0)
		end)
		var_53_0[arg_54_0].tick_speed2 = var_53_0[arg_54_0].defensive_tickbase:create():slider("Choke 2nd\n" .. arg_54_0, 1, 22, 1, 1, function(arg_57_0)
			return arg_57_0 == 16 and "Neverlose" or tostring(arg_57_0)
		end)
		var_53_0[arg_54_0].tick_speed_info = var_53_0[arg_54_0].defensive_tickbase:create():label("Default choke value for Neverlose is 16.")

		local function var_54_0(arg_58_0)
			var_53_0[arg_54_0]["yaw_mode" .. arg_58_0] = slot_0_39_0:combo(slot_0_23_0:with_icon("ruler", "   Yaw" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), {
				"L - R",
				"Automatic"
			})
			var_53_0[arg_54_0]["yaw_random_methods" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():combo(slot_0_23_0:with_icon("rectangles-mixed", "  Random" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), {
				"Default",
				"Sinusoidal",
				"Chaotic"
			})

			for iter_58_0, iter_58_1 in ipairs({
				"center",
				"left",
				"right"
			}) do
				var_53_0[arg_54_0]["yaw_" .. iter_58_1 .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  " .. slot_0_9_0.capitalize(iter_58_1) .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), -180, 180, 0, 1, "°")
			end

			var_53_0[arg_54_0]["yaw_randomize" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():slider("Randomize\n" .. arg_58_0 .. arg_54_0, 0, 180, 0, 1)
			var_53_0[arg_54_0]["frequency" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():slider("Frequency\n" .. arg_58_0 .. arg_54_0, 0, 60, 0, 1)
			var_53_0[arg_54_0]["amplitude" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():slider("Amplitude\n" .. arg_58_0 .. arg_54_0, 0, 30, 0, 1)
			var_53_0[arg_54_0]["r_min" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():slider("Min\n" .. arg_58_0 .. arg_54_0, 0, 100, 0, 1)
			var_53_0[arg_54_0]["r_max" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():slider("Max\n" .. arg_58_0 .. arg_54_0, 0, 100, 0, 1)
			var_53_0[arg_54_0]["scale" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():slider("Scale\n" .. arg_58_0 .. arg_54_0, 0, 100, 0, 1)
			var_53_0[arg_54_0]["antibrute" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():switch(slot_0_23_0:with_icon("shirt-running", "  Anti-bruteforce" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), false)
			var_53_0[arg_54_0]["antibrute_method" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():list("Method", {
				"Decrease",
				"Randomize",
				"Increase"
			})
			var_53_0[arg_54_0]["anti_timeout" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():slider(slot_0_23_0:with_icon("reply-clock", "  Timeout" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), 0, 30, 0, 1, function(arg_59_0)
				return arg_59_0 == 0 and "Infinite" or tostring(arg_59_0)
			end)
			var_53_0[arg_54_0]["anti_timeout_info" .. arg_58_0] = var_53_0[arg_54_0]["yaw_mode" .. arg_58_0]:create():label("If you put timeout at 0 it will be infinite till round ends")
			var_53_0[arg_54_0]["Jitter" .. arg_58_0] = slot_0_39_0:combo(slot_0_23_0:with_icon("angle-90", "   Modifier" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), {
				"Disabled",
				"Center",
				"Offset",
				"Random",
				"Spin",
				"3-way",
				"5-way",
				"Hold",
				"Torpedo"
			})
			var_53_0[arg_54_0]["center_options" .. arg_58_0] = var_53_0[arg_54_0]["Jitter" .. arg_58_0]:create():combo(slot_0_23_0:with_icon("rectangles-mixed", "  Random" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), {
				"Randomize",
				"Min - Max",
				"Custom"
			})
			var_53_0[arg_54_0]["yaw_jitter_ovr" .. arg_58_0] = var_53_0[arg_54_0]["Jitter" .. arg_58_0]:create():slider(slot_0_23_0:with_icon("slider", "  Offset" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), -180, 180, 0, 1, "°")
			var_53_0[arg_54_0]["jitter_randomize" .. arg_58_0] = var_53_0[arg_54_0]["Jitter" .. arg_58_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Randomize" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), 0, 180, 0, 1)
			var_53_0[arg_54_0]["center_min" .. arg_58_0] = var_53_0[arg_54_0]["Jitter" .. arg_58_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Min" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), -180, 180, 0, 1)
			var_53_0[arg_54_0]["center_max" .. arg_58_0] = var_53_0[arg_54_0]["Jitter" .. arg_58_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Max" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), -180, 180, 0, 1)
			var_53_0[arg_54_0]["custom_amount" .. arg_58_0] = var_53_0[arg_54_0]["Jitter" .. arg_58_0]:create():slider(slot_0_23_0:with_icon("sliders-simple", "  Slider Amount" .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), 1, 22)

			for iter_58_2 = 1, 22 do
				var_53_0[arg_54_0]["custom_slider_" .. iter_58_2 .. arg_58_0] = var_53_0[arg_54_0]["Jitter" .. arg_58_0]:create():slider(slot_0_23_0:with_icon("angle-right", "    " .. iter_58_2 .. "\n" .. arg_58_0 .. arg_54_0, "{Link Active}"), -180, 180, 0)
			end
		end

		local function var_54_1(arg_60_0)
			var_53_0[arg_54_0]["body_yaw" .. arg_60_0] = slot_0_39_0:switch(slot_0_23_0:with_icon("infinity", "  Body" .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), true)
			var_53_0[arg_54_0]["fake_options" .. arg_60_0] = slot_0_39_0:combo(slot_0_23_0:with_icon("option", "  Options" .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), {
				"Jitter",
				"Static"
			})
			var_53_0[arg_54_0]["speed_options" .. arg_60_0] = var_53_0[arg_54_0]["fake_options" .. arg_60_0]:create():combo(slot_0_23_0:with_icon("bars-progress", "  Method" .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), {
				"Neverlose",
				"Inverter",
				"Amnesia"
			})
			var_53_0[arg_54_0]["body_speed" .. arg_60_0] = var_53_0[arg_54_0]["fake_options" .. arg_60_0]:create():slider(slot_0_23_0:with_icon("gauge-simple-high", "  Speed" .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), 1, 20, 0, 1, function(arg_61_0)
				return arg_61_0 == 1 and "Default" or tostring(arg_61_0)
			end)
			var_53_0[arg_54_0]["amnesia_tick_speed" .. arg_60_0] = var_53_0[arg_54_0]["fake_options" .. arg_60_0]:create():slider("Amnesia Tick\n" .. arg_60_0 .. arg_54_0, 1, 22, 16)
			var_53_0[arg_54_0]["random_speed" .. arg_60_0] = var_53_0[arg_54_0]["fake_options" .. arg_60_0]:create():switch(slot_0_23_0:with_icon("shuffle", "  Random Speed" .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), false)
			var_53_0[arg_54_0]["random_speed_method" .. arg_60_0] = var_53_0[arg_54_0]["fake_options" .. arg_60_0]:create():combo(slot_0_23_0:with_icon("rectangles-mixed", "  Random" .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), {
				"Random",
				"Custom"
			})
			var_53_0[arg_54_0]["custom_speed_amount" .. arg_60_0] = var_53_0[arg_54_0]["fake_options" .. arg_60_0]:create():slider(slot_0_23_0:with_icon("sliders-simple", "  Slider Amount" .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), 1, 22)

			for iter_60_0 = 1, 22 do
				var_53_0[arg_54_0]["custom_speed_slider_" .. iter_60_0 .. arg_60_0] = var_53_0[arg_54_0]["fake_options" .. arg_60_0]:create():slider(slot_0_23_0:with_icon("angle-right", "    " .. iter_60_0 .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), 1, 20, 0)
			end

			var_53_0[arg_54_0]["ran_speed_1" .. arg_60_0] = var_53_0[arg_54_0]["fake_options" .. arg_60_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Min Speed" .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), 1, 20, 1)
			var_53_0[arg_54_0]["ran_speed_2" .. arg_60_0] = var_53_0[arg_54_0]["fake_options" .. arg_60_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Max Speed" .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), 1, 20, 1)

			for iter_60_1, iter_60_2 in ipairs({
				"left",
				"right"
			}) do
				slot_60_6_1 = "fake_" .. iter_60_2 .. arg_60_0
				var_53_0[arg_54_0][slot_60_6_1] = var_53_0[arg_54_0]["body_yaw" .. arg_60_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  " .. slot_0_9_0.capitalize(iter_60_2) .. "\n" .. arg_60_0 .. arg_54_0, "{Link Active}"), 0, 60, 60, 1, "°")
				slot_60_6_0 = "fake_" .. iter_60_2 .. "_random" .. arg_60_0
				var_53_0[arg_54_0][slot_60_6_0] = var_53_0[arg_54_0]["body_yaw" .. arg_60_0]:create():slider("Randomize\n" .. arg_60_0 .. arg_54_0, 0, 60, 0, 1)
			end
		end

		var_54_0("")
		var_54_0("_ct")
		var_54_1("")
		var_54_1("_ct")

		var_53_0[arg_54_0].send_to = slot_0_41_0:button(slot_0_23_0:with_icon("star", "      Send To CT      \n" .. arg_54_0, "{Link Active}"), function()
			send_to_opposite_team()
		end, true)
		var_53_0[arg_54_0].reset = slot_0_41_0:button("      \aFF0000FFReset      \n" .. arg_54_0, function()
			reset_current_state()
		end, true)
		var_53_0[arg_54_0].send_to_ct = slot_0_41_0:button(slot_0_23_0:with_icon("star", "      Send To T      \n" .. arg_54_0, "{Link Active}"), function()
			send_to_opposite_team()
		end, true)
		var_53_0[arg_54_0].reset_ct = slot_0_41_0:button("      \aFF0000FFReset      \n" .. arg_54_0, function()
			reset_current_state()
		end, true)
	end

	local function var_53_3(arg_66_0)
		var_53_1[arg_66_0] = {}
		var_53_1[arg_66_0].def_toggle = slot_0_39_0:switch(slot_0_23_0:with_icon("shield-check", "  Enable " .. arg_66_0 .. "\n" .. arg_66_0, "{Link Active}"), false)
		var_53_1[arg_66_0].def_toggle_ct = slot_0_39_0:switch(slot_0_23_0:with_icon("shield-check", "  Enable " .. arg_66_0 .. "\n" .. arg_66_0, "{Link Active}"), false)

		local function var_66_0(arg_67_0)
			var_53_1[arg_66_0]["def_pitch" .. arg_67_0] = slot_0_39_0:combo("Pitch\n" .. arg_66_0 .. arg_67_0, {
				"Down",
				"Random",
				"Auto",
				"Custom"
			})
			var_53_1[arg_66_0]["pitch_offset" .. arg_67_0] = var_53_1[arg_66_0]["def_pitch" .. arg_67_0]:create():slider("Pitch\n" .. arg_66_0, -89, 89, 0, 1, "°")
			var_53_1[arg_66_0]["yaw_mode" .. arg_67_0] = slot_0_39_0:combo(slot_0_23_0:with_icon("ruler", "   Yaw" .. "\n" .. arg_67_0 .. arg_66_0, "{Link Active}"), {
				"L - R",
				"Sideways",
				"Random",
				"Spin"
			})
			var_53_1[arg_66_0]["yaw_random_methods" .. arg_67_0] = var_53_1[arg_66_0]["yaw_mode" .. arg_67_0]:create():combo(slot_0_23_0:with_icon("rectangles-mixed", "  Random" .. "\n" .. arg_67_0 .. arg_66_0, "{Link Active}"), {
				"Default",
				"Sinusoidal",
				"Chaotic"
			})

			for iter_67_0, iter_67_1 in ipairs({
				"center",
				"left",
				"right"
			}) do
				var_53_1[arg_66_0]["yaw_" .. iter_67_1 .. arg_67_0] = var_53_1[arg_66_0]["yaw_mode" .. arg_67_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  " .. slot_0_9_0.capitalize(iter_67_1) .. "\n" .. arg_67_0 .. arg_66_0, "{Link Active}"), -180, 180, 0, 1, "°")
			end

			var_53_1[arg_66_0]["spin_speed" .. arg_67_0] = var_53_1[arg_66_0]["yaw_mode" .. arg_67_0]:create():slider("Spin Speed\n" .. arg_67_0 .. arg_66_0, 1, 10)
			var_53_1[arg_66_0]["yaw_randomize" .. arg_67_0] = var_53_1[arg_66_0]["yaw_mode" .. arg_67_0]:create():slider("Randomize\n" .. arg_67_0 .. arg_66_0, 0, 180, 0, 1)
			var_53_1[arg_66_0]["frequency" .. arg_67_0] = var_53_1[arg_66_0]["yaw_mode" .. arg_67_0]:create():slider("Frequency\n" .. arg_67_0 .. arg_66_0, 0, 60, 0, 1)
			var_53_1[arg_66_0]["amplitude" .. arg_67_0] = var_53_1[arg_66_0]["yaw_mode" .. arg_67_0]:create():slider("Amplitude\n" .. arg_67_0 .. arg_66_0, 0, 30, 0, 1)
			var_53_1[arg_66_0]["r_min" .. arg_67_0] = var_53_1[arg_66_0]["yaw_mode" .. arg_67_0]:create():slider("Min\n" .. arg_67_0 .. arg_66_0, 0, 100, 0, 1)
			var_53_1[arg_66_0]["r_max" .. arg_67_0] = var_53_1[arg_66_0]["yaw_mode" .. arg_67_0]:create():slider("Max\n" .. arg_67_0 .. arg_66_0, 0, 100, 0, 1)
			var_53_1[arg_66_0]["scale" .. arg_67_0] = var_53_1[arg_66_0]["yaw_mode" .. arg_67_0]:create():slider("Scale\n" .. arg_67_0 .. arg_66_0, 0, 100, 0, 1)
			var_53_1[arg_66_0]["Jitter" .. arg_67_0] = slot_0_39_0:combo(slot_0_23_0:with_icon("angle-90", "   Modifier" .. "\n" .. arg_67_0 .. arg_66_0, "{Link Active}"), {
				"Disabled",
				"Center",
				"Offset",
				"Random",
				"Spin",
				"3-way",
				"5-way"
			})
			var_53_1[arg_66_0]["center_options" .. arg_67_0] = var_53_1[arg_66_0]["Jitter" .. arg_67_0]:create():combo(slot_0_23_0:with_icon("rectangles-mixed", "  Random" .. "\n" .. arg_67_0 .. arg_66_0, "{Link Active}"), {
				"Randomize",
				"Min - Max"
			})
			var_53_1[arg_66_0]["yaw_jitter_ovr" .. arg_67_0] = var_53_1[arg_66_0]["Jitter" .. arg_67_0]:create():slider(slot_0_23_0:with_icon("slider", "  Offset" .. "\n" .. arg_67_0 .. arg_66_0, "{Link Active}"), -180, 180, 0, 1, "°")
			var_53_1[arg_66_0]["jitter_randomize" .. arg_67_0] = var_53_1[arg_66_0]["Jitter" .. arg_67_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Randomize" .. "\n" .. arg_67_0 .. arg_66_0, "{Link Active}"), 0, 180, 0, 1)
			var_53_1[arg_66_0]["center_min" .. arg_67_0] = var_53_1[arg_66_0]["Jitter" .. arg_67_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Min" .. "\n" .. arg_67_0 .. arg_66_0, "{Link Active}"), -180, 180, 0, 1)
			var_53_1[arg_66_0]["center_max" .. arg_67_0] = var_53_1[arg_66_0]["Jitter" .. arg_67_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Max" .. "\n" .. arg_67_0 .. arg_66_0, "{Link Active}"), -180, 180, 0, 1)
		end

		local function var_66_1(arg_68_0)
			var_53_1[arg_66_0]["body_yaw" .. arg_68_0] = slot_0_39_0:switch(slot_0_23_0:with_icon("infinity", "  Body" .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), true)
			var_53_1[arg_66_0]["fake_options" .. arg_68_0] = slot_0_39_0:combo(slot_0_23_0:with_icon("option", "  Options" .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), {
				"Jitter",
				"Static"
			})
			var_53_1[arg_66_0]["speed_options" .. arg_68_0] = var_53_1[arg_66_0]["fake_options" .. arg_68_0]:create():combo(slot_0_23_0:with_icon("bars-progress", "  Method" .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), {
				"Neverlose",
				"Inverter",
				"Amnesia"
			})
			var_53_1[arg_66_0]["body_speed" .. arg_68_0] = var_53_1[arg_66_0]["fake_options" .. arg_68_0]:create():slider(slot_0_23_0:with_icon("gauge-simple-high", "  Speed" .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), 1, 20, 0, 1, function(arg_69_0)
				return arg_69_0 == 1 and "Default" or tostring(arg_69_0)
			end)
			var_53_1[arg_66_0]["amnesia_tick_speed" .. arg_68_0] = var_53_1[arg_66_0]["fake_options" .. arg_68_0]:create():slider("Amnesia Tick\n" .. arg_68_0 .. arg_66_0, 1, 22, 16)
			var_53_1[arg_66_0]["random_speed" .. arg_68_0] = var_53_1[arg_66_0]["fake_options" .. arg_68_0]:create():switch(slot_0_23_0:with_icon("shuffle", "  Random Speed" .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), false)
			var_53_1[arg_66_0]["random_speed_method" .. arg_68_0] = var_53_1[arg_66_0]["fake_options" .. arg_68_0]:create():combo(slot_0_23_0:with_icon("rectangles-mixed", "  Random" .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), {
				"Random"
			})
			var_53_1[arg_66_0]["ran_speed_1" .. arg_68_0] = var_53_1[arg_66_0]["fake_options" .. arg_68_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Min Speed" .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), 1, 20, 1)
			var_53_1[arg_66_0]["ran_speed_2" .. arg_68_0] = var_53_1[arg_66_0]["fake_options" .. arg_68_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  Max Speed" .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), 1, 20, 1)

			for iter_68_0, iter_68_1 in ipairs({
				"left",
				"right"
			}) do
				slot_68_6_1 = "fake_" .. iter_68_1 .. arg_68_0
				var_53_1[arg_66_0][slot_68_6_1] = var_53_1[arg_66_0]["body_yaw" .. arg_68_0]:create():slider(slot_0_23_0:with_icon("angle-right", "  " .. slot_0_9_0.capitalize(iter_68_1) .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), 0, 60, 60, 1, "°")
				slot_68_6_0 = "fake_" .. iter_68_1 .. "_random" .. arg_68_0
				var_53_1[arg_66_0][slot_68_6_0] = var_53_1[arg_66_0]["body_yaw" .. arg_68_0]:create():slider("Randomize\n" .. arg_68_0 .. arg_66_0, 0, 60, 0, 1)
			end

			var_53_1[arg_66_0]["def_activation" .. arg_68_0] = slot_0_41_0:combo(slot_0_23_0:with_icon("chart-network", "  Activation" .. "\n" .. arg_68_0 .. arg_66_0, "{Link Active}"), {
				"Always",
				"Hittable"
			})
		end

		var_66_0("")
		var_66_0("_ct")
		var_66_1("")
		var_66_1("_ct")

		var_53_1[arg_66_0].send_to = slot_0_41_0:button(slot_0_23_0:with_icon("star", "      Send To CT      \n" .. arg_66_0, "{Link Active}"), function()
			send_to_opposite_team()
		end, true)
		var_53_1[arg_66_0].reset = slot_0_41_0:button("      \aFF0000FFReset      \n" .. arg_66_0, function()
			reset_current_state()
		end, true)
		var_53_1[arg_66_0].send_to_ct = slot_0_41_0:button(slot_0_23_0:with_icon("star", "      Send To T      \n" .. arg_66_0, "{Link Active}"), function()
			send_to_opposite_team()
		end, true)
		var_53_1[arg_66_0].reset_ct = slot_0_41_0:button("      \aFF0000FFReset      \n" .. arg_66_0, function()
			reset_current_state()
		end, true)
	end

	for iter_53_0, iter_53_1 in pairs(slot_0_28_0.conditions) do
		var_53_2(iter_53_1)
		var_53_3(iter_53_1)
	end

	slot_0_9_0.rage.builder_elements = var_53_0
	slot_0_9_0.rage.defensive_elements = var_53_1
end

slot_0_9_0.menu_handler()

function slot_0_9_0.set_visibility(arg_74_0, arg_74_1, arg_74_2, arg_74_3)
	slot_74_4_0 = arg_74_2 and "_ct" or ""
	slot_74_5_0 = slot_0_9_0.rage.aa_lister and slot_0_9_0.rage.aa_lister:get() == arg_74_3
	arg_74_1 = arg_74_1 and slot_74_5_0

	slot_0_9_0.visuals.notifs.notifs_prefix_font:visibility(slot_0_9_0.visuals.notifs.notifs_prefix:get())

	slot_74_6_1 = {}
	slot_74_7_1 = {}

	function slot_74_8_0(arg_75_0, arg_75_1)
		local var_75_0 = arg_74_0[arg_75_0]

		if var_75_0 and var_75_0.get then
			return var_75_0:get()
		end

		return arg_75_1
	end

	slot_74_9_0 = arg_74_0["Jitter" .. slot_74_4_0]
	slot_74_10_0 = slot_74_9_0 and slot_74_9_0:get() ~= "Hold" and slot_74_9_0:get() ~= "Torpedo" or false
	slot_74_11_0 = slot_74_9_0 and slot_74_9_0:get() ~= "Disabled" or false
	slot_74_12_0 = slot_74_8_0("center_options" .. slot_74_4_0, "")
	slot_74_13_0 = slot_74_12_0 == "Custom"
	slot_74_14_0 = slot_74_12_0 == "Min - Max"
	slot_74_15_0 = slot_74_12_0 == "Randomize"
	slot_74_16_0 = slot_74_13_0 and slot_74_9_0:get() ~= "Disabled"
	slot_74_17_0 = slot_74_8_0("custom_amount" .. slot_74_4_0, 0)
	slot_74_18_0 = slot_74_8_0("yaw_random_methods" .. slot_74_4_0, "")
	slot_74_19_0 = slot_74_18_0 == "Chaotic"
	slot_74_20_0 = slot_74_18_0 == "Sinusoidal"
	slot_74_21_0 = slot_74_18_0 == "Default"
	slot_74_22_0 = slot_74_8_0("random_speed" .. slot_74_4_0, false)
	slot_74_23_0 = slot_74_8_0("random_speed_method" .. slot_74_4_0, "") == "Custom"
	slot_74_24_0 = slot_74_8_0("custom_speed_amount" .. slot_74_4_0, 0)
	slot_74_25_0 = slot_74_8_0("yaw_mode" .. slot_74_4_0, "") == "Spin"
	slot_74_26_0 = slot_74_8_0("defensive_tickbase", 0) == 1
	slot_74_27_0 = slot_74_8_0("antibrute" .. slot_74_4_0, false)
	slot_74_28_0 = slot_74_8_0("speed_options" .. slot_74_4_0, "") == "Amnesia"
	slot_74_29_0 = slot_74_8_0("yaw_mode" .. slot_74_4_0, "") == "Sideways" or slot_74_8_0("yaw_mode" .. slot_74_4_0, "") == "Random" or slot_74_8_0("yaw_mode" .. slot_74_4_0, "") == "Spin"

	function slot_74_30_0()
		for iter_76_0 = 1, 22 do
			local var_76_0 = arg_74_0["custom_slider_" .. iter_76_0 .. slot_74_4_0]

			if var_76_0 and var_76_0.visibility then
				var_76_0:visibility(iter_76_0 <= slot_74_17_0 and slot_74_16_0 and slot_74_10_0 and slot_74_5_0)
			end

			local var_76_1 = arg_74_0["custom_speed_slider_" .. iter_76_0 .. slot_74_4_0]

			if var_76_1 and var_76_1.visibility then
				var_76_1:visibility(iter_76_0 <= slot_74_24_0 and slot_74_23_0 and slot_74_22_0 and slot_74_5_0)
			end
		end
	end

	slot_74_31_0 = arg_74_0["body_speed" .. slot_74_4_0]

	if slot_74_31_0 and slot_74_31_0.override then
		if slot_74_22_0 then
			slot_74_31_0:override(1)
		else
			slot_74_31_0:override()
		end
	end

	slot_74_32_0 = arg_74_0["yaw_jitter_ovr" .. slot_74_4_0]

	if slot_74_32_0 and slot_74_32_0.disabled then
		slot_74_32_0:disabled(slot_74_14_0 or slot_74_13_0 or not slot_74_10_0)
	end

	slot_74_6_0 = {
		def_activation = false,
		custom_amount = slot_74_13_0 and slot_74_10_0,
		custom_speed_amount = slot_74_23_0 and slot_74_22_0,
		amnesia_tick_speed = slot_74_28_0,
		spin_speed = slot_74_25_0,
		yaw_randomize = slot_74_21_0,
		r_min = slot_74_19_0,
		r_max = slot_74_19_0,
		scale = slot_74_19_0,
		frequency = slot_74_20_0,
		amplitude = slot_74_20_0,
		def_pitch = arg_74_1,
		yaw_mode = arg_74_1,
		yaw_center = arg_74_1 and show_yaw_center,
		yaw_left = arg_74_1 and not slot_74_29_0,
		yaw_right = arg_74_1 and not slot_74_29_0,
		antibrute_method = slot_74_27_0,
		anti_timeout = slot_74_27_0,
		anti_timeout_info = slot_74_27_0,
		ran_speed_1 = slot_74_22_0 and not slot_74_23_0,
		ran_speed_2 = slot_74_22_0 and not slot_74_23_0,
		random_speed_method = slot_74_22_0,
		speed_options = arg_74_1,
		Jitter = arg_74_1,
		center_options = arg_74_1 and slot_74_10_0,
		center_min = slot_74_14_0 and slot_74_10_0,
		center_max = slot_74_14_0 and slot_74_10_0,
		jitter_randomize = slot_74_15_0 and slot_74_10_0,
		yaw_jitter_ovr = arg_74_1 and slot_74_11_0,
		body_yaw = arg_74_1,
		fake_left = arg_74_1,
		fake_right = arg_74_1,
		fake_options = arg_74_1,
		send_to = arg_74_1,
		reset = arg_74_1,
		body_speed = arg_74_1
	}
	slot_74_7_0 = {
		defensive_tickbase = arg_74_1,
		tick_random = slot_74_26_0 and arg_74_1,
		tick_speed1 = slot_74_26_0 and arg_74_1,
		tick_speed2 = slot_74_26_0 and slot_74_8_0("tick_random", false) and arg_74_1,
		tick_speed_info = slot_74_26_0 and arg_74_1
	}

	slot_74_30_0()

	for iter_74_0, iter_74_1 in pairs(slot_74_6_0) do
		slot_74_38_1 = arg_74_0[iter_74_0 .. slot_74_4_0]

		if slot_74_38_1 and slot_74_38_1.visibility then
			slot_74_38_1:visibility(iter_74_1)
		end
	end

	for iter_74_2, iter_74_3 in pairs(slot_74_7_0) do
		slot_74_38_0 = arg_74_0[iter_74_2]

		if slot_74_38_0 and slot_74_38_0.visibility then
			slot_74_38_0:visibility(iter_74_3)
		end
	end
end

function slot_0_9_0.hide_side(arg_77_0, arg_77_1)
	local var_77_0 = arg_77_1 and "_ct" or ""

	for iter_77_0, iter_77_1 in ipairs({
		"def_toggle",
		"def_pitch",
		"yaw_mode",
		"yaw_center",
		"yaw_left",
		"yaw_right",
		"Jitter",
		"center_options",
		"center_min",
		"center_max",
		"jitter_randomize",
		"fake_left",
		"fake_right",
		"yaw_jitter_ovr",
		"body_yaw",
		"fake_options",
		"reset",
		"send_to",
		"body_speed",
		"speed_options",
		"def_activation",
		"spin_speed"
	}) do
		local var_77_1 = arg_77_0[iter_77_1 .. var_77_0]

		if var_77_1 and var_77_1:visibility() then
			var_77_1:visibility(false)
		end
	end
end

function slot_0_9_0.visibility_handler()
	slot_78_0_0 = slot_0_9_0.misc_chooser:get() == 1
	slot_78_1_0 = slot_0_9_0.misc_chooser:get() == 2
	slot_78_2_0 = slot_0_9_0.rage.team_list:get() == "T"
	slot_78_3_0 = slot_0_9_0.rage.team_list:get() == "CT"
	slot_78_4_0 = slot_0_9_0.rage.aa_lister:get() == 1
	slot_78_5_0 = slot_0_9_0.rage.aa_lister:get() == 2
	slot_78_6_0 = slot_0_9_0.rage.aa_lister:get() == 3
	slot_78_7_0 = slot_78_5_0 or slot_78_6_0

	slot_0_9_0.rage.state_label:name(slot_0_23_0:with_icon("wrench", "  Current State ", "{Link Active}") .. "\a" .. ui.get_style("Link Active"):to_hex() .. " • \r " .. slot_0_9_0.rage.state_list:get())
	slot_0_9_0.rage.state_label:visibility(slot_78_7_0)
	slot_0_9_0.rage.team_list:visibility(slot_78_7_0)
	slot_0_9_0.rage.state_list:visibility(slot_78_7_0)
	slot_0_9_0.rage.anims:visibility(slot_78_4_0)
	slot_0_9_0.rage.freestanding_bind:visibility(slot_78_4_0)
	slot_0_9_0.rage.manual:visibility(slot_78_4_0)
	slot_0_9_0.rage.safe_head:visibility(slot_78_4_0)
	slot_0_9_0.rage.avoid_knife:visibility(slot_78_4_0)
	slot_0_9_0.rage.additions:visibility(slot_78_4_0)
	slot_0_1_0.traverse(slot_0_9_0.visuals, function(arg_79_0)
		arg_79_0:visibility(slot_78_0_0)
	end)
	slot_0_1_0.traverse(slot_0_9_0.misc, function(arg_80_0)
		arg_80_0:visibility(slot_78_1_0)
	end)

	if slot_0_9_0.rage.anims.move_jitter_mode:get() == 1 then
		slot_0_9_0.rage.anims.move_legs1:visibility(false)
		slot_0_9_0.rage.anims.move_legs2:visibility(false)
		slot_0_9_0.rage.anims.move_jitter:visibility(true)
	else
		slot_0_9_0.rage.anims.move_legs1:visibility(true)
		slot_0_9_0.rage.anims.move_legs2:visibility(true)
		slot_0_9_0.rage.anims.move_jitter:visibility(false)
	end

	for iter_78_0, iter_78_1 in pairs(slot_0_28_0.conditions) do
		slot_78_14_1 = slot_0_9_0.rage.state_list:get() == iter_78_1
		slot_78_16_2 = slot_0_9_0.rage.hidden_builder.state_list:get() == iter_78_1
		slot_78_17_0 = slot_0_9_0.rage.builder_elements[iter_78_1]

		slot_0_9_0.hide_side(slot_78_17_0, false)
		slot_0_9_0.hide_side(slot_78_17_0, true)

		if slot_78_2_0 then
			slot_78_18_1 = slot_78_17_0.yaw_mode:get() == "Static" or slot_78_17_0.yaw_mode:get() == "3-way" or slot_78_17_0.yaw_mode:get() == "5-way"

			slot_0_9_0.set_visibility(slot_78_17_0, slot_78_14_1, false, 2)
		elseif slot_78_3_0 then
			slot_78_18_0 = slot_78_17_0.yaw_mode_ct:get() == "Static" or slot_78_17_0.yaw_mode_ct:get() == "3-way" or slot_78_17_0.yaw_mode_ct:get() == "5-way"

			slot_0_9_0.set_visibility(slot_78_17_0, slot_78_14_1, true, 2)
		end
	end

	for iter_78_2, iter_78_3 in pairs(slot_0_28_0.conditions) do
		slot_78_14_0 = slot_0_9_0.rage.state_list:get() == iter_78_3 and slot_78_6_0
		slot_78_15_0 = slot_0_9_0.rage.defensive_elements[iter_78_3]

		if slot_78_6_0 then
			for iter_78_4, iter_78_5 in pairs(slot_78_15_0) do
				if iter_78_5.visibility then
					iter_78_5:visibility(false)
				end
			end

			if slot_78_15_0.def_toggle then
				slot_78_15_0.def_toggle:visibility(slot_78_14_0 and slot_78_2_0)
			end

			if slot_78_15_0.def_toggle_ct then
				slot_78_15_0.def_toggle_ct:visibility(slot_78_14_0 and slot_78_3_0)
			end

			slot_78_15_0.def_activation:visibility(false)
			slot_78_15_0.def_activation_ct:visibility(false)

			if slot_78_2_0 then
				slot_78_15_0.reset:visibility(slot_78_14_0)
				slot_78_15_0.send_to:visibility(slot_78_14_0)
			else
				slot_78_15_0.reset_ct:visibility(slot_78_14_0)
				slot_78_15_0.send_to_ct:visibility(slot_78_14_0)
			end

			if slot_78_2_0 then
				slot_0_9_0.set_visibility(slot_78_15_0, slot_78_14_0, false, 3)

				slot_78_16_1 = slot_78_15_0.def_toggle and slot_78_15_0.def_toggle:get() or false

				for iter_78_6, iter_78_7 in pairs(slot_78_15_0) do
					if iter_78_6:find("_ct") then
						if iter_78_7.visibility then
							iter_78_7:visibility(false)
						end
					elseif iter_78_6 ~= "def_toggle" and iter_78_6 ~= "def_toggle_ct" and iter_78_7.visibility and iter_78_7:visibility() then
						iter_78_7:visibility(slot_78_16_1)
					end
				end

				if slot_78_15_0.pitch_offset then
					slot_78_15_0.pitch_offset:visibility(slot_78_14_0 and slot_78_16_1 and slot_78_15_0.def_pitch:get() == "Custom")
				end
			end

			if slot_78_3_0 then
				slot_0_9_0.set_visibility(slot_78_15_0, slot_78_14_0, true, 3)

				slot_78_16_0 = slot_78_15_0.def_toggle_ct and slot_78_15_0.def_toggle_ct:get() or false

				for iter_78_8, iter_78_9 in pairs(slot_78_15_0) do
					if not iter_78_8:find("_ct") then
						if iter_78_9.visibility then
							iter_78_9:visibility(false)
						end
					elseif iter_78_8 ~= "def_toggle" and iter_78_8 ~= "def_toggle_ct" and iter_78_9.visibility and iter_78_9:visibility() then
						iter_78_9:visibility(slot_78_16_0)
					end
				end

				if slot_78_15_0.pitch_offset_ct then
					slot_78_15_0.pitch_offset_ct:visibility(slot_78_14_0 and slot_78_16_0 and slot_78_15_0.def_pitch_ct:get() == "Custom")
				end
			end
		else
			for iter_78_10, iter_78_11 in pairs(slot_78_15_0) do
				if iter_78_11.visibility then
					iter_78_11:visibility(false)
				end
			end
		end
	end
end

if not db.configurations4 then
	slot_0_60_0 = {}
end

slot_0_61_0 = nil

function slot_0_7_0.is_config_in_list(arg_81_0)
	for iter_81_0, iter_81_1 in ipairs(slot_0_8_0) do
		if iter_81_1:find(arg_81_0) then
			return true
		end
	end

	return false
end

slot_0_9_0.main.preset_list:set_callback(function()
	local var_82_0 = slot_0_9_0.main.preset_list:get()
	local var_82_1 = slot_0_7_0.get_config_name_from_index(var_82_0)

	if var_82_1 then
		slot_0_9_0.main.input_name:set(var_82_1)
	end
end)

function slot_0_7_0.check_index()
	if slot_0_19_0.ui.getalpha() > 0 then
		local var_83_0 = slot_0_9_0.main.preset_list:get()
		local var_83_1 = #slot_0_57_0

		if var_83_0 <= 6 then
			slot_0_9_0.main.new_button:disabled(true)
			slot_0_9_0.main.import_button:disabled(true)
			slot_0_9_0.main.export_button:disabled(true)
			slot_0_9_0.main.delete_button:disabled(true)
		else
			slot_0_9_0.main.new_button:disabled(false)
			slot_0_9_0.main.import_button:disabled(false)
			slot_0_9_0.main.export_button:disabled(false)
			slot_0_9_0.main.load_button:disabled(false)
			slot_0_9_0.main.delete_button:disabled(false)
		end
	else
		return
	end
end

slot_0_11_0.register("render", "ls_utils.check_index", slot_0_7_0.check_index)

function slot_0_7_0.export_config()
	local var_84_0 = slot_0_1_0.save()
	local var_84_1 = json.stringify(slot_0_1_0.save())

	slot_0_0_0.set(var_84_1)
	slot_0_12_0.push("config has been successfully exported!")
end

function slot_0_7_0.import_config()
	local var_85_0 = slot_0_0_0.get()
	local var_85_1 = json.parse(var_85_0)

	slot_0_1_0.load(var_85_1)
	slot_0_12_0.push("config has been successfully imported!")
end

function slot_0_7_0.save_config()
	local var_86_0 = slot_0_9_0.main.preset_list:get()
	local var_86_1 = #slot_0_57_0
	local var_86_2 = slot_0_9_0.main.input_name:get()

	if not var_86_2 or var_86_2 == "" then
		slot_0_12_0.push("please enter a valid config name")

		return
	end

	local var_86_3 = db.configurations4 or {}
	local var_86_4 = slot_0_7_0.get_config_name_from_index(var_86_0)

	if #var_86_3 == 0 then
		table.remove(slot_0_57_0, 8)
	end

	if var_86_1 < var_86_0 and var_86_4 and var_86_4 ~= var_86_2 then
		print("creating new config:", var_86_2)
		slot_0_12_0.push("creating new config:" .. var_86_2)
	elseif var_86_3[var_86_2] then
		print("updating existing config:", var_86_2)
		slot_0_12_0.push("updating existing config:" .. var_86_2)
	end

	var_86_3[var_86_2] = slot_0_1_0.save()
	db.configurations4 = var_86_3

	slot_0_7_0.update_config_list()
	slot_0_12_0.push("config saved : " .. var_86_2)
end

function slot_0_7_0.update_config_list()
	slot_0_8_0 = {}

	local var_87_0 = db.configurations4 or {}
	local var_87_1 = {}

	for iter_87_0, iter_87_1 in pairs(var_87_0) do
		table.insert(var_87_1, iter_87_0)
	end

	table.sort(var_87_1)

	for iter_87_2, iter_87_3 in ipairs(var_87_1) do
		table.insert(slot_0_8_0, slot_0_23_0:with_icon("list-ul", iter_87_3, "{Link Active}"))
	end

	local var_87_2 = {}

	for iter_87_4 = 1, 6 do
		table.insert(var_87_2, slot_0_57_0[iter_87_4])
	end

	if #var_87_1 == 0 then
		table.insert(var_87_2, slot_0_57_0[7])
	end

	for iter_87_5, iter_87_6 in ipairs(slot_0_8_0) do
		table.insert(var_87_2, iter_87_6)
	end

	slot_0_9_0.main.preset_list:update(var_87_2)
end

slot_0_7_0.update_config_list()

function slot_0_7_0.get_config_name_from_index(arg_88_0)
	local var_88_0 = db.configurations4 or {}
	local var_88_1 = {}

	for iter_88_0, iter_88_1 in pairs(var_88_0) do
		table.insert(var_88_1, iter_88_0)
	end

	table.sort(var_88_1)

	if arg_88_0 <= 6 then
		return nil
	elseif #var_88_1 == 0 and arg_88_0 == 7 then
		return nil
	else
		local var_88_2

		if #var_88_1 == 0 then
			var_88_2 = arg_88_0 - 7
		else
			var_88_2 = arg_88_0 - 6
		end

		return var_88_1[var_88_2]
	end
end

slot_0_62_1 = {
	["crouch moving"] = "Crouch Moving",
	crouch = "Crouch",
	manual = "Manual",
	jitter = "Jitter",
	jitter_ct = "Jitter_ct",
	air = "Air",
	["air crouch"] = "Air Crouch",
	center = "Center",
	["l - r"] = "L - R",
	running = "Running",
	standing = "Standing",
	slowmotion = "Slowmotion"
}

function renameKeys(arg_89_0)
	if type(arg_89_0) ~= "table" then
		return arg_89_0
	end

	local var_89_0 = {}

	for iter_89_0, iter_89_1 in pairs(arg_89_0) do
		local var_89_1 = string.lower(iter_89_0)

		var_89_0[slot_0_62_1[var_89_1] or iter_89_0] = renameKeys(iter_89_1)
	end

	return var_89_0
end

function slot_0_7_0.load_config()
	local var_90_0 = slot_0_9_0.main.preset_list:get()

	if not var_90_0 or var_90_0 == 0 then
		slot_0_12_0.push("please select valid config to load")

		return
	end

	if var_90_0 <= #slot_0_57_0 - 1 then
		if var_90_0 == 1 then
			local var_90_1 = "{\"defensive\":{\"antiaim_conditions\":[\"~\"],\"defensive_conditions\":[\"Slowmotion\",\"Crouch\",\"Crouch Moving\",\"Air\",\"Air Crouch\",\"~\"],\"disablers\":[\"~\"],\"force_hideshot\":true,\"game_events\":[\"~\"],\"on_exploit\":[\"~\"],\"state_list\":\"Standing\"},\"main\":{\"input_name\":\"default\",\"preset_list\":1.0},\"misc\":{\"aim_logs\":true,\"aspect_ratio\":true,\"aspect_ratio_val\":134.0,\"clantag\":false,\"fast_ladder\":true,\"fps_boost\":true,\"kibit_hitmark\":false,\"kibit_hitmark_color\":\"#58FFD1FF\",\"no_fall\":true,\"view_model_changer\":true,\"viewmodel_changer_fov\":68.0,\"viewmodel_changer_x\":100.0,\"viewmodel_changer_y\":-100.0,\"viewmodel_changer_z\":200.0},\"rage\":{\"additions\":[\"Warmup / Round End AA\",\"Improve Fakelag on Defensive\",\"Avoid Backstab\",\"~\"],\"anims\":true,\"builder_elements\":{\"Air\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":2.0,\"fake_left_random_ct\":2.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":5.0,\"fake_right_random_ct\":5.0,\"flick_left\":-11.0,\"flick_left_body\":24.0,\"flick_left_body_ct\":24.0,\"flick_left_ct\":-11.0,\"flick_right\":11.0,\"flick_right_body\":26.0,\"flick_right_body_ct\":26.0,\"flick_right_ct\":11.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":5.0,\"flick_speed_random_ct\":6.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-29.0,\"yaw_left_ct\":-29.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":35.0,\"yaw_right_ct\":35.0},\"Air Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Random\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":-7.0,\"flick_left_body\":24.0,\"flick_left_body_ct\":24.0,\"flick_left_ct\":-7.0,\"flick_right\":15.0,\"flick_right_body\":26.0,\"flick_right_body_ct\":26.0,\"flick_right_ct\":15.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":3.0,\"flick_speed_random_ct\":3.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":-89.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-18.0,\"yaw_left_ct\":-18.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":44.0,\"yaw_right_ct\":44.0},\"Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":0.0,\"flick_left_body_ct\":0.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":0.0,\"flick_right_body_ct\":0.0,\"flick_right_ct\":0.0,\"flick_speed\":1.0,\"flick_speed_ct\":1.0,\"flick_speed_random\":1.0,\"flick_speed_random_ct\":1.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-32.0,\"yaw_left_ct\":-32.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":46.0,\"yaw_right_ct\":46.0},\"Crouch Moving\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":-3.0,\"flick_left_body\":25.0,\"flick_left_body_ct\":8.0,\"flick_left_ct\":-7.0,\"flick_right\":6.0,\"flick_right_body\":29.0,\"flick_right_body_ct\":8.0,\"flick_right_ct\":12.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":3.0,\"flick_speed_random_ct\":5.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-22.0,\"yaw_left_ct\":-22.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":44.0,\"yaw_right_ct\":44.0},\"Manual\":{\"Jitter\":\"Center\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":0.0,\"flick_left_body_ct\":0.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":0.0,\"flick_right_body_ct\":0.0,\"flick_right_ct\":0.0,\"flick_speed\":1.0,\"flick_speed_ct\":1.0,\"flick_speed_random\":1.0,\"flick_speed_random_ct\":1.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"Static\",\"yaw_mode_ct\":\"Static\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Running\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Random\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":-12.0,\"flick_left_body\":26.0,\"flick_left_body_ct\":26.0,\"flick_left_ct\":-12.0,\"flick_right\":8.0,\"flick_right_body\":20.0,\"flick_right_body_ct\":20.0,\"flick_right_ct\":8.0,\"flick_speed\":8.0,\"flick_speed_ct\":8.0,\"flick_speed_random\":5.0,\"flick_speed_random_ct\":5.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":180.0,\"yaw_jitter_ovr_ct\":180.0,\"yaw_left\":-24.0,\"yaw_left_ct\":-24.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":37.0,\"yaw_right_ct\":37.0},\"Slowmotion\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":0.0,\"flick_left_body_ct\":0.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":0.0,\"flick_right_body_ct\":0.0,\"flick_right_ct\":0.0,\"flick_speed\":1.0,\"flick_speed_ct\":1.0,\"flick_speed_random\":1.0,\"flick_speed_random_ct\":1.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-23.0,\"yaw_left_ct\":-23.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":47.0,\"yaw_right_ct\":47.0},\"Standing\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":-5.0,\"center_max_ct\":0.0,\"center_min\":5.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":0.0,\"flick_left_body_ct\":0.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":0.0,\"flick_right_body_ct\":0.0,\"flick_right_ct\":0.0,\"flick_speed\":1.0,\"flick_speed_ct\":1.0,\"flick_speed_random\":1.0,\"flick_speed_random_ct\":1.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":92.0,\"yaw_jitter_ovr_ct\":92.0,\"yaw_left\":-24.0,\"yaw_left_ct\":-24.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":41.0,\"yaw_right_ct\":41.0}},\"freestand_body\":2.0,\"freestand_enablers\":[\"~\"],\"freestand_options\":[\"~\"],\"freestanding_bind\":false,\"hidden_builder\":false,\"keep_fs\":true,\"manual\":\"At Target\",\"prefer_manual\":true,\"safe_head\":false,\"safe_options\":[\"~\"],\"state_list\":\"Air Crouch\",\"team_list\":1.0,\"~anims\":{\"move_fall\":0.0,\"move_jitter\":0.0,\"move_jitter_mode\":2.0,\"move_lean_val\":100.0,\"move_legs1\":0.0,\"move_legs2\":100.0}},\"visuals\":{\"accent\":\"#DFC3FFFF\",\"crosshair_ind\":false,\"fake_latency_slider\":0.0,\"fake_latency_toggle\":false,\"gs_inds\":false,\"molotov_radius\":true,\"notifs\":false,\"scope\":true,\"slowed_down\":true,\"smokes_radius\":true,\"unlock_fakeduck\":true,\"watermark\":\"Left\",\"watermark_style\":1.0,\"~notifs\":{\"notifs_glow_amount\":41.0,\"notifs_hit_clr\":\"#00FF00FF\",\"notifs_miss_clr\":\"#FF0000FF\",\"notifs_prefix\":false,\"notifs_prefix_clr\":\"#00FF00FF\",\"notifs_prefix_font\":1.0,\"notifs_round_amount\":11.0},\"~scope\":{\"scope_color1\":\"#FFFFFFFF\",\"scope_color2\":\"#FFFFFF00\",\"scope_gap\":5.0,\"scope_settings\":[\"~\"],\"scope_size\":100.0,\"scope_style\":1.0}}}"
			local var_90_2 = json.parse(var_90_1)

			slot_0_1_0.load(var_90_2)
			slot_0_12_0.push("Meta preset has been successfully imported!")
		elseif var_90_0 == 2 then
			local var_90_3 = "{\"defensive\":{\"antiaim_conditions\":[\"~\"],\"defensive_conditions\":[\"Crouch\",\"Crouch Moving\",\"~\"],\"disablers\":[\"~\"],\"force_hideshot\":false,\"game_events\":[\"~\"],\"on_exploit\":[\"~\"],\"state_list\":\"Standing\"},\"main\":{\"input_name\":\"omg?\",\"preset_list\":2.0},\"misc\":{\"aim_logs\":true,\"aspect_ratio\":true,\"aspect_ratio_val\":139.0,\"clantag\":false,\"fast_ladder\":true,\"fps_boost\":true,\"kibit_hitmark\":true,\"kibit_hitmark_color\":\"#58FFD1FF\",\"no_fall\":true,\"view_model_changer\":true,\"viewmodel_changer_fov\":65.0,\"viewmodel_changer_x\":205.0,\"viewmodel_changer_y\":100.0,\"viewmodel_changer_z\":-100.0},\"rage\":{\"additions\":[\"Warmup / Round End AA\",\"Improve Fakelag on Defensive\",\"Avoid Backstab\",\"~\"],\"anims\":true,\"builder_elements\":{\"Air\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":16.0,\"flick_left_body_ct\":16.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":16.0,\"flick_right_body_ct\":16.0,\"flick_right_ct\":0.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":7.0,\"flick_speed_random_ct\":7.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":39.0,\"yaw_left\":-19.0,\"yaw_left_ct\":-22.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":23.0,\"yaw_right_ct\":27.0},\"Air Crouch\":{\"Jitter\":\"Center\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":16.0,\"flick_left_body_ct\":16.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":16.0,\"flick_right_body_ct\":16.0,\"flick_right_ct\":0.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":7.0,\"flick_speed_random_ct\":7.0,\"jitter_randomize\":7.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":-10.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-10.0,\"yaw_left_ct\":-24.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":31.0,\"yaw_right_ct\":30.0},\"Crouch\":{\"Jitter\":\"Center\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":16.0,\"flick_left_body_ct\":16.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":16.0,\"flick_right_body_ct\":16.0,\"flick_right_ct\":0.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":7.0,\"flick_speed_random_ct\":7.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":20.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":-31.0,\"yaw_jitter_ovr_ct\":-3.0,\"yaw_left\":5.0,\"yaw_left_ct\":-10.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":5.0,\"yaw_right_ct\":16.0},\"Crouch Moving\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":16.0,\"flick_left_body_ct\":16.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":16.0,\"flick_right_body_ct\":16.0,\"flick_right_ct\":0.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":7.0,\"flick_speed_random_ct\":7.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":20.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":-30.0,\"yaw_left\":-10.0,\"yaw_left_ct\":-8.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":31.0,\"yaw_right_ct\":20.0},\"Manual\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":16.0,\"flick_left_body_ct\":16.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":16.0,\"flick_right_body_ct\":16.0,\"flick_right_ct\":0.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":7.0,\"flick_speed_random_ct\":7.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"Static\",\"yaw_mode_ct\":\"Static\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Running\":{\"Jitter\":\"Center\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":16.0,\"flick_left_body_ct\":16.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":16.0,\"flick_right_body_ct\":16.0,\"flick_right_ct\":0.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":7.0,\"flick_speed_random_ct\":7.0,\"jitter_randomize\":14.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":-58.0,\"yaw_jitter_ovr_ct\":-62.0,\"yaw_left\":6.0,\"yaw_left_ct\":6.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":6.0,\"yaw_right_ct\":6.0},\"Slowmotion\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":16.0,\"flick_left_body_ct\":16.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":16.0,\"flick_right_body_ct\":16.0,\"flick_right_ct\":0.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":7.0,\"flick_speed_random_ct\":7.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-23.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"Static\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":47.0,\"yaw_right_ct\":0.0},\"Standing\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":0.0,\"custom_speed_slider_10\":0.0,\"custom_speed_slider_10_ct\":0.0,\"custom_speed_slider_11\":0.0,\"custom_speed_slider_11_ct\":0.0,\"custom_speed_slider_12\":0.0,\"custom_speed_slider_12_ct\":0.0,\"custom_speed_slider_13\":0.0,\"custom_speed_slider_13_ct\":0.0,\"custom_speed_slider_14\":0.0,\"custom_speed_slider_14_ct\":0.0,\"custom_speed_slider_15\":0.0,\"custom_speed_slider_15_ct\":0.0,\"custom_speed_slider_16\":0.0,\"custom_speed_slider_16_ct\":0.0,\"custom_speed_slider_17\":0.0,\"custom_speed_slider_17_ct\":0.0,\"custom_speed_slider_18\":0.0,\"custom_speed_slider_18_ct\":0.0,\"custom_speed_slider_19\":0.0,\"custom_speed_slider_19_ct\":0.0,\"custom_speed_slider_1_ct\":0.0,\"custom_speed_slider_2\":0.0,\"custom_speed_slider_20\":0.0,\"custom_speed_slider_20_ct\":0.0,\"custom_speed_slider_21\":0.0,\"custom_speed_slider_21_ct\":0.0,\"custom_speed_slider_22\":0.0,\"custom_speed_slider_22_ct\":0.0,\"custom_speed_slider_2_ct\":0.0,\"custom_speed_slider_3\":0.0,\"custom_speed_slider_3_ct\":0.0,\"custom_speed_slider_4\":0.0,\"custom_speed_slider_4_ct\":0.0,\"custom_speed_slider_5\":0.0,\"custom_speed_slider_5_ct\":0.0,\"custom_speed_slider_6\":0.0,\"custom_speed_slider_6_ct\":0.0,\"custom_speed_slider_7\":0.0,\"custom_speed_slider_7_ct\":0.0,\"custom_speed_slider_8\":0.0,\"custom_speed_slider_8_ct\":0.0,\"custom_speed_slider_9\":0.0,\"custom_speed_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"None\",\"extend_option_ct\":\"None\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":16.0,\"flick_left_body_ct\":16.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":16.0,\"flick_right_body_ct\":16.0,\"flick_right_ct\":0.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":7.0,\"flick_speed_random_ct\":7.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"Static\",\"yaw_mode_ct\":\"Static\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0}},\"freestand_body\":1.0,\"freestand_enablers\":[\"~\"],\"freestand_options\":[\"~\"],\"freestanding_bind\":false,\"hidden_builder\":false,\"keep_fs\":true,\"manual\":\"At Target\",\"prefer_manual\":true,\"safe_head\":false,\"safe_options\":[\"~\"],\"state_list\":\"Standing\",\"team_list\":2.0,\"~anims\":{\"move_fall\":0.0,\"move_jitter\":0.0,\"move_jitter_mode\":2.0,\"move_lean_val\":100.0,\"move_legs1\":0.0,\"move_legs2\":100.0}},\"visuals\":{\"accent\":\"#96C83CFF\",\"crosshair_ind\":false,\"fake_latency_slider\":0.0,\"fake_latency_toggle\":false,\"gs_inds\":false,\"molotov_radius\":true,\"notifs\":true,\"scope\":true,\"slowed_down\":true,\"smokes_radius\":true,\"unlock_fakeduck\":true,\"watermark\":\"Bottom\",\"watermark_style\":1.0,\"~notifs\":{\"notifs_glow_amount\":41.0,\"notifs_hit_clr\":\"#00FF00FF\",\"notifs_miss_clr\":\"#FF0000FF\",\"notifs_prefix\":false,\"notifs_prefix_clr\":\"#00FF00FF\",\"notifs_prefix_font\":1.0,\"notifs_round_amount\":11.0},\"~scope\":{\"scope_color1\":\"#FFFFFFFF\",\"scope_color2\":\"#FFFFFF00\",\"scope_gap\":5.0,\"scope_settings\":[\"~\"],\"scope_size\":100.0,\"scope_style\":1.0}}}"
			local var_90_4 = json.parse(var_90_3)

			slot_0_1_0.load(var_90_4)
			slot_0_12_0.push("Aggressive preset has been successfully imported!")
		elseif var_90_0 == 3 then
			local var_90_5 = "{\"defensive\":{\"defensive_conditions\":[\"Standing\",\"Slowmotion\",\"Crouch\",\"Crouch Moving\",\"Air\",\"Air Crouch\",\"~\"],\"force_hideshot\":false,\"game_events\":[\"~\"]},\"main\":{\"input_name\":\"type here\",\"preset_list\":3.0},\"misc\":{\"aspect_ratio\":true,\"aspect_ratio_val\":133.0,\"clantag\":false,\"client_nickname\":false,\"fake_latency_toggle\":false,\"fast_ladder\":true,\"freeze_fakeduck\":false,\"log_event\":[\"~\"],\"no_fall\":true,\"super_toss\":false,\"unlock_fakeduck\":false,\"view_model_changer\":false,\"viewmodel_changer_fov\":68.0,\"viewmodel_changer_x\":205.0,\"viewmodel_changer_y\":100.0,\"viewmodel_changer_z\":-100.0,\"~client_nickname\":{\"client_nickname_text\":\"Type Here\"},\"~fake_latency_toggle\":{\"fake_latency_slider\":0.0}},\"misc_chooser\":1.0,\"rage\":{\"aa_lister\":1.0,\"additions\":[\"Warmup / Round End AA\",\"~\"],\"anims\":true,\"avoid_knife\":false,\"builder_elements\":{\"Air\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":4.0,\"body_speed_ct\":4.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":1.0,\"custom_speed_slider_10\":1.0,\"custom_speed_slider_10_ct\":1.0,\"custom_speed_slider_11\":1.0,\"custom_speed_slider_11_ct\":1.0,\"custom_speed_slider_12\":1.0,\"custom_speed_slider_12_ct\":1.0,\"custom_speed_slider_13\":1.0,\"custom_speed_slider_13_ct\":1.0,\"custom_speed_slider_14\":1.0,\"custom_speed_slider_14_ct\":1.0,\"custom_speed_slider_15\":1.0,\"custom_speed_slider_15_ct\":1.0,\"custom_speed_slider_16\":1.0,\"custom_speed_slider_16_ct\":1.0,\"custom_speed_slider_17\":1.0,\"custom_speed_slider_17_ct\":1.0,\"custom_speed_slider_18\":1.0,\"custom_speed_slider_18_ct\":1.0,\"custom_speed_slider_19\":1.0,\"custom_speed_slider_19_ct\":1.0,\"custom_speed_slider_1_ct\":1.0,\"custom_speed_slider_2\":1.0,\"custom_speed_slider_20\":1.0,\"custom_speed_slider_20_ct\":1.0,\"custom_speed_slider_21\":1.0,\"custom_speed_slider_21_ct\":1.0,\"custom_speed_slider_22\":1.0,\"custom_speed_slider_22_ct\":1.0,\"custom_speed_slider_2_ct\":1.0,\"custom_speed_slider_3\":1.0,\"custom_speed_slider_3_ct\":1.0,\"custom_speed_slider_4\":1.0,\"custom_speed_slider_4_ct\":1.0,\"custom_speed_slider_5\":1.0,\"custom_speed_slider_5_ct\":1.0,\"custom_speed_slider_6\":1.0,\"custom_speed_slider_6_ct\":1.0,\"custom_speed_slider_7\":1.0,\"custom_speed_slider_7_ct\":1.0,\"custom_speed_slider_8\":1.0,\"custom_speed_slider_8_ct\":1.0,\"custom_speed_slider_9\":1.0,\"custom_speed_slider_9_ct\":1.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-18.0,\"yaw_left_ct\":-18.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":27.0,\"yaw_right_ct\":27.0},\"Air Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":4.0,\"anti_timeout_ct\":4.0,\"antibrute\":true,\"antibrute_ct\":true,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":4.0,\"body_speed_ct\":4.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":1.0,\"custom_speed_slider_10\":1.0,\"custom_speed_slider_10_ct\":1.0,\"custom_speed_slider_11\":1.0,\"custom_speed_slider_11_ct\":1.0,\"custom_speed_slider_12\":1.0,\"custom_speed_slider_12_ct\":1.0,\"custom_speed_slider_13\":1.0,\"custom_speed_slider_13_ct\":1.0,\"custom_speed_slider_14\":1.0,\"custom_speed_slider_14_ct\":1.0,\"custom_speed_slider_15\":1.0,\"custom_speed_slider_15_ct\":1.0,\"custom_speed_slider_16\":1.0,\"custom_speed_slider_16_ct\":1.0,\"custom_speed_slider_17\":1.0,\"custom_speed_slider_17_ct\":1.0,\"custom_speed_slider_18\":1.0,\"custom_speed_slider_18_ct\":1.0,\"custom_speed_slider_19\":1.0,\"custom_speed_slider_19_ct\":1.0,\"custom_speed_slider_1_ct\":1.0,\"custom_speed_slider_2\":1.0,\"custom_speed_slider_20\":1.0,\"custom_speed_slider_20_ct\":1.0,\"custom_speed_slider_21\":1.0,\"custom_speed_slider_21_ct\":1.0,\"custom_speed_slider_22\":1.0,\"custom_speed_slider_22_ct\":1.0,\"custom_speed_slider_2_ct\":1.0,\"custom_speed_slider_3\":1.0,\"custom_speed_slider_3_ct\":1.0,\"custom_speed_slider_4\":1.0,\"custom_speed_slider_4_ct\":1.0,\"custom_speed_slider_5\":1.0,\"custom_speed_slider_5_ct\":1.0,\"custom_speed_slider_6\":1.0,\"custom_speed_slider_6_ct\":1.0,\"custom_speed_slider_7\":1.0,\"custom_speed_slider_7_ct\":1.0,\"custom_speed_slider_8\":1.0,\"custom_speed_slider_8_ct\":1.0,\"custom_speed_slider_9\":1.0,\"custom_speed_slider_9_ct\":1.0,\"defensive_tickbase\":1.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":true,\"tick_speed1\":5.0,\"tick_speed2\":15.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-19.0,\"yaw_left_ct\":-19.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":47.0,\"yaw_right_ct\":47.0},\"Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":4.0,\"body_speed_ct\":4.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":1.0,\"custom_speed_slider_10\":1.0,\"custom_speed_slider_10_ct\":1.0,\"custom_speed_slider_11\":1.0,\"custom_speed_slider_11_ct\":1.0,\"custom_speed_slider_12\":1.0,\"custom_speed_slider_12_ct\":1.0,\"custom_speed_slider_13\":1.0,\"custom_speed_slider_13_ct\":1.0,\"custom_speed_slider_14\":1.0,\"custom_speed_slider_14_ct\":1.0,\"custom_speed_slider_15\":1.0,\"custom_speed_slider_15_ct\":1.0,\"custom_speed_slider_16\":1.0,\"custom_speed_slider_16_ct\":1.0,\"custom_speed_slider_17\":1.0,\"custom_speed_slider_17_ct\":1.0,\"custom_speed_slider_18\":1.0,\"custom_speed_slider_18_ct\":1.0,\"custom_speed_slider_19\":1.0,\"custom_speed_slider_19_ct\":1.0,\"custom_speed_slider_1_ct\":1.0,\"custom_speed_slider_2\":1.0,\"custom_speed_slider_20\":1.0,\"custom_speed_slider_20_ct\":1.0,\"custom_speed_slider_21\":1.0,\"custom_speed_slider_21_ct\":1.0,\"custom_speed_slider_22\":1.0,\"custom_speed_slider_22_ct\":1.0,\"custom_speed_slider_2_ct\":1.0,\"custom_speed_slider_3\":1.0,\"custom_speed_slider_3_ct\":1.0,\"custom_speed_slider_4\":1.0,\"custom_speed_slider_4_ct\":1.0,\"custom_speed_slider_5\":1.0,\"custom_speed_slider_5_ct\":1.0,\"custom_speed_slider_6\":1.0,\"custom_speed_slider_6_ct\":1.0,\"custom_speed_slider_7\":1.0,\"custom_speed_slider_7_ct\":1.0,\"custom_speed_slider_8\":1.0,\"custom_speed_slider_8_ct\":1.0,\"custom_speed_slider_9\":1.0,\"custom_speed_slider_9_ct\":1.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":-30.0,\"yaw_center_ct\":-30.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-30.0,\"yaw_left_ct\":-30.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":45.0,\"yaw_right_ct\":45.0},\"Crouch Moving\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":4.0,\"anti_timeout_ct\":4.0,\"antibrute\":true,\"antibrute_ct\":true,\"antibrute_method\":2.0,\"antibrute_method_ct\":2.0,\"body_speed\":4.0,\"body_speed_ct\":4.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":6.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":86.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":-180.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":1.0,\"custom_speed_slider_10\":1.0,\"custom_speed_slider_10_ct\":1.0,\"custom_speed_slider_11\":1.0,\"custom_speed_slider_11_ct\":1.0,\"custom_speed_slider_12\":1.0,\"custom_speed_slider_12_ct\":1.0,\"custom_speed_slider_13\":1.0,\"custom_speed_slider_13_ct\":1.0,\"custom_speed_slider_14\":1.0,\"custom_speed_slider_14_ct\":1.0,\"custom_speed_slider_15\":1.0,\"custom_speed_slider_15_ct\":1.0,\"custom_speed_slider_16\":1.0,\"custom_speed_slider_16_ct\":1.0,\"custom_speed_slider_17\":1.0,\"custom_speed_slider_17_ct\":1.0,\"custom_speed_slider_18\":1.0,\"custom_speed_slider_18_ct\":1.0,\"custom_speed_slider_19\":1.0,\"custom_speed_slider_19_ct\":1.0,\"custom_speed_slider_1_ct\":1.0,\"custom_speed_slider_2\":1.0,\"custom_speed_slider_20\":1.0,\"custom_speed_slider_20_ct\":1.0,\"custom_speed_slider_21\":1.0,\"custom_speed_slider_21_ct\":1.0,\"custom_speed_slider_22\":1.0,\"custom_speed_slider_22_ct\":1.0,\"custom_speed_slider_2_ct\":1.0,\"custom_speed_slider_3\":1.0,\"custom_speed_slider_3_ct\":1.0,\"custom_speed_slider_4\":1.0,\"custom_speed_slider_4_ct\":1.0,\"custom_speed_slider_5\":1.0,\"custom_speed_slider_5_ct\":1.0,\"custom_speed_slider_6\":1.0,\"custom_speed_slider_6_ct\":1.0,\"custom_speed_slider_7\":1.0,\"custom_speed_slider_7_ct\":1.0,\"custom_speed_slider_8\":1.0,\"custom_speed_slider_8_ct\":1.0,\"custom_speed_slider_9\":1.0,\"custom_speed_slider_9_ct\":1.0,\"defensive_tickbase\":1.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":3.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":6.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":true,\"tick_speed1\":7.0,\"tick_speed2\":15.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":-76.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-30.0,\"yaw_left_ct\":-30.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":33.0,\"yaw_right_ct\":33.0},\"Manual\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":1.0,\"custom_speed_slider_10\":1.0,\"custom_speed_slider_10_ct\":1.0,\"custom_speed_slider_11\":1.0,\"custom_speed_slider_11_ct\":1.0,\"custom_speed_slider_12\":1.0,\"custom_speed_slider_12_ct\":1.0,\"custom_speed_slider_13\":1.0,\"custom_speed_slider_13_ct\":1.0,\"custom_speed_slider_14\":1.0,\"custom_speed_slider_14_ct\":1.0,\"custom_speed_slider_15\":1.0,\"custom_speed_slider_15_ct\":1.0,\"custom_speed_slider_16\":1.0,\"custom_speed_slider_16_ct\":1.0,\"custom_speed_slider_17\":1.0,\"custom_speed_slider_17_ct\":1.0,\"custom_speed_slider_18\":1.0,\"custom_speed_slider_18_ct\":1.0,\"custom_speed_slider_19\":1.0,\"custom_speed_slider_19_ct\":1.0,\"custom_speed_slider_1_ct\":1.0,\"custom_speed_slider_2\":1.0,\"custom_speed_slider_20\":1.0,\"custom_speed_slider_20_ct\":1.0,\"custom_speed_slider_21\":1.0,\"custom_speed_slider_21_ct\":1.0,\"custom_speed_slider_22\":1.0,\"custom_speed_slider_22_ct\":1.0,\"custom_speed_slider_2_ct\":1.0,\"custom_speed_slider_3\":1.0,\"custom_speed_slider_3_ct\":1.0,\"custom_speed_slider_4\":1.0,\"custom_speed_slider_4_ct\":1.0,\"custom_speed_slider_5\":1.0,\"custom_speed_slider_5_ct\":1.0,\"custom_speed_slider_6\":1.0,\"custom_speed_slider_6_ct\":1.0,\"custom_speed_slider_7\":1.0,\"custom_speed_slider_7_ct\":1.0,\"custom_speed_slider_8\":1.0,\"custom_speed_slider_8_ct\":1.0,\"custom_speed_slider_9\":1.0,\"custom_speed_slider_9_ct\":1.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Static\",\"fake_options_ct\":\"Static\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Amnesia\",\"speed_options_ct\":\"Amnesia\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Running\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":1.0,\"custom_speed_slider_10\":1.0,\"custom_speed_slider_10_ct\":1.0,\"custom_speed_slider_11\":1.0,\"custom_speed_slider_11_ct\":1.0,\"custom_speed_slider_12\":1.0,\"custom_speed_slider_12_ct\":1.0,\"custom_speed_slider_13\":1.0,\"custom_speed_slider_13_ct\":1.0,\"custom_speed_slider_14\":1.0,\"custom_speed_slider_14_ct\":1.0,\"custom_speed_slider_15\":1.0,\"custom_speed_slider_15_ct\":1.0,\"custom_speed_slider_16\":1.0,\"custom_speed_slider_16_ct\":1.0,\"custom_speed_slider_17\":1.0,\"custom_speed_slider_17_ct\":1.0,\"custom_speed_slider_18\":1.0,\"custom_speed_slider_18_ct\":1.0,\"custom_speed_slider_19\":1.0,\"custom_speed_slider_19_ct\":1.0,\"custom_speed_slider_1_ct\":1.0,\"custom_speed_slider_2\":1.0,\"custom_speed_slider_20\":1.0,\"custom_speed_slider_20_ct\":1.0,\"custom_speed_slider_21\":1.0,\"custom_speed_slider_21_ct\":1.0,\"custom_speed_slider_22\":1.0,\"custom_speed_slider_22_ct\":1.0,\"custom_speed_slider_2_ct\":1.0,\"custom_speed_slider_3\":1.0,\"custom_speed_slider_3_ct\":1.0,\"custom_speed_slider_4\":1.0,\"custom_speed_slider_4_ct\":1.0,\"custom_speed_slider_5\":1.0,\"custom_speed_slider_5_ct\":1.0,\"custom_speed_slider_6\":1.0,\"custom_speed_slider_6_ct\":1.0,\"custom_speed_slider_7\":1.0,\"custom_speed_slider_7_ct\":1.0,\"custom_speed_slider_8\":1.0,\"custom_speed_slider_8_ct\":1.0,\"custom_speed_slider_9\":1.0,\"custom_speed_slider_9_ct\":1.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":12.0,\"ran_speed_2_ct\":12.0,\"random_speed\":true,\"random_speed_ct\":true,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Inverter\",\"speed_options_ct\":\"Inverter\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":-27.0,\"yaw_jitter_ovr_ct\":-27.0,\"yaw_left\":-25.0,\"yaw_left_ct\":-25.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":42.0,\"yaw_right_ct\":42.0},\"Slowmotion\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Custom\",\"center_options_ct\":\"Randomize\",\"custom_amount\":4.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":-22.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":-111.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":1.0,\"custom_speed_slider_10\":1.0,\"custom_speed_slider_10_ct\":1.0,\"custom_speed_slider_11\":1.0,\"custom_speed_slider_11_ct\":1.0,\"custom_speed_slider_12\":1.0,\"custom_speed_slider_12_ct\":1.0,\"custom_speed_slider_13\":1.0,\"custom_speed_slider_13_ct\":1.0,\"custom_speed_slider_14\":1.0,\"custom_speed_slider_14_ct\":1.0,\"custom_speed_slider_15\":1.0,\"custom_speed_slider_15_ct\":1.0,\"custom_speed_slider_16\":1.0,\"custom_speed_slider_16_ct\":1.0,\"custom_speed_slider_17\":1.0,\"custom_speed_slider_17_ct\":1.0,\"custom_speed_slider_18\":1.0,\"custom_speed_slider_18_ct\":1.0,\"custom_speed_slider_19\":1.0,\"custom_speed_slider_19_ct\":1.0,\"custom_speed_slider_1_ct\":1.0,\"custom_speed_slider_2\":1.0,\"custom_speed_slider_20\":1.0,\"custom_speed_slider_20_ct\":1.0,\"custom_speed_slider_21\":1.0,\"custom_speed_slider_21_ct\":1.0,\"custom_speed_slider_22\":1.0,\"custom_speed_slider_22_ct\":1.0,\"custom_speed_slider_2_ct\":1.0,\"custom_speed_slider_3\":1.0,\"custom_speed_slider_3_ct\":1.0,\"custom_speed_slider_4\":1.0,\"custom_speed_slider_4_ct\":1.0,\"custom_speed_slider_5\":1.0,\"custom_speed_slider_5_ct\":1.0,\"custom_speed_slider_6\":1.0,\"custom_speed_slider_6_ct\":1.0,\"custom_speed_slider_7\":1.0,\"custom_speed_slider_7_ct\":1.0,\"custom_speed_slider_8\":1.0,\"custom_speed_slider_8_ct\":1.0,\"custom_speed_slider_9\":1.0,\"custom_speed_slider_9_ct\":1.0,\"defensive_tickbase\":0.0,\"fake_left\":56.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":45.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":7.0,\"ran_speed_1_ct\":11.0,\"ran_speed_2\":10.0,\"ran_speed_2_ct\":17.0,\"random_speed\":true,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Amnesia\",\"speed_options_ct\":\"Amnesia\",\"tick_random\":false,\"tick_speed1\":22.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-31.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":45.0,\"yaw_right_ct\":0.0},\"Standing\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Custom\",\"center_options_ct\":\"Randomize\",\"custom_amount\":4.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":-22.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":-57.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":1.0,\"custom_speed_slider_10\":1.0,\"custom_speed_slider_10_ct\":1.0,\"custom_speed_slider_11\":1.0,\"custom_speed_slider_11_ct\":1.0,\"custom_speed_slider_12\":1.0,\"custom_speed_slider_12_ct\":1.0,\"custom_speed_slider_13\":1.0,\"custom_speed_slider_13_ct\":1.0,\"custom_speed_slider_14\":1.0,\"custom_speed_slider_14_ct\":1.0,\"custom_speed_slider_15\":1.0,\"custom_speed_slider_15_ct\":1.0,\"custom_speed_slider_16\":1.0,\"custom_speed_slider_16_ct\":1.0,\"custom_speed_slider_17\":1.0,\"custom_speed_slider_17_ct\":1.0,\"custom_speed_slider_18\":1.0,\"custom_speed_slider_18_ct\":1.0,\"custom_speed_slider_19\":1.0,\"custom_speed_slider_19_ct\":1.0,\"custom_speed_slider_1_ct\":1.0,\"custom_speed_slider_2\":1.0,\"custom_speed_slider_20\":1.0,\"custom_speed_slider_20_ct\":1.0,\"custom_speed_slider_21\":1.0,\"custom_speed_slider_21_ct\":1.0,\"custom_speed_slider_22\":1.0,\"custom_speed_slider_22_ct\":1.0,\"custom_speed_slider_2_ct\":1.0,\"custom_speed_slider_3\":1.0,\"custom_speed_slider_3_ct\":1.0,\"custom_speed_slider_4\":1.0,\"custom_speed_slider_4_ct\":1.0,\"custom_speed_slider_5\":1.0,\"custom_speed_slider_5_ct\":1.0,\"custom_speed_slider_6\":1.0,\"custom_speed_slider_6_ct\":1.0,\"custom_speed_slider_7\":1.0,\"custom_speed_slider_7_ct\":1.0,\"custom_speed_slider_8\":1.0,\"custom_speed_slider_8_ct\":1.0,\"custom_speed_slider_9\":1.0,\"custom_speed_slider_9_ct\":1.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":20.0,\"ran_speed_2_ct\":20.0,\"random_speed\":true,\"random_speed_ct\":true,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-33.0,\"yaw_left_ct\":-33.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":41.0,\"yaw_right_ct\":41.0}},\"defensive_elements\":{\"Air\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":0.0,\"body_speed_ct\":0.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Air Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":0.0,\"body_speed_ct\":0.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":0.0,\"body_speed_ct\":0.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Crouch Moving\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":0.0,\"body_speed_ct\":0.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Manual\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":0.0,\"body_speed_ct\":0.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Running\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":0.0,\"body_speed_ct\":0.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Slowmotion\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":0.0,\"body_speed_ct\":0.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Standing\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":0.0,\"body_speed_ct\":0.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0}},\"freestanding_bind\":false,\"hidden_builder\":false,\"manual\":\"At Target\",\"safe_head\":false,\"state_list\":\"Running\",\"team_list\":\"T\",\"~anims\":{\"move_fall\":0.0,\"move_jitter\":0.0,\"move_jitter_mode\":1.0,\"move_lean_val\":0.0,\"move_legs1\":0.0,\"move_legs2\":0.0},\"~freestanding_bind\":{\"freestand_body\":1.0,\"freestand_enablers\":[\"~\"],\"freestand_options\":[\"~\"],\"keep_fs\":false,\"prefer_manual\":false},\"~hidden_builder\":{\"antiaim_conditions\":[\"~\"],\"disablers\":[\"~\"],\"on_exploit\":[\"~\"],\"state_list\":\"Standing\"},\"~safe_head\":{\"safe_options\":[\"~\"]}},\"visuals\":{\"accent\":\"#96C83CFF\",\"gs_inds\":false,\"kibit_hitmark\":false,\"molotov_radius\":false,\"notifs\":false,\"scope\":true,\"slowed_down\":false,\"smokes_radius\":false,\"watermark\":\"Left\",\"watermark_style\":1.0,\"~kibit_hitmark\":{\"kibit_hitmark_color\":\"#58FFD1FF\"},\"~notifs\":{\"notifs_glow_amount\":41.0,\"notifs_hit_clr\":\"#00FF00FF\",\"notifs_miss_clr\":\"#FF0000FF\",\"notifs_prefix\":false,\"notifs_prefix_clr\":\"#00FF00FF\",\"notifs_prefix_font\":1.0,\"notifs_round_amount\":11.0},\"~scope\":{\"scope_color1\":\"#FFFFFFFF\",\"scope_color2\":\"#FFFFFF00\",\"scope_gap\":5.0,\"scope_settings\":[\"~\"],\"scope_size\":190.0,\"scope_style\":1.0}}}"
			local var_90_6 = json.parse(var_90_5)

			slot_0_1_0.load(var_90_6)
			slot_0_12_0.push("Snap [Test] preset has been successfully imported!")
		elseif var_90_0 == 4 then
			local var_90_7 = "{\"defensive\":{\"defensive_conditions\":[\"Standing\",\"Slowmotion\",\"Crouch\",\"Crouch Moving\",\"Air\",\"Air Crouch\",\"~\"],\"force_hideshot\":true,\"game_events\":[\"~\"]},\"main\":{\"input_name\":\"hold test\",\"preset_list\":4.0},\"misc\":{\"aspect_ratio\":true,\"aspect_ratio_val\":133.0,\"clantag\":false,\"client_nickname\":true,\"fake_latency_toggle\":false,\"fast_ladder\":true,\"freeze_fakeduck\":false,\"log_event\":[\"Aimbot\",\"Purchases\",\"~\"],\"no_fall\":true,\"super_toss\":false,\"unlock_fakeduck\":true,\"view_model_changer\":false,\"viewmodel_changer_fov\":68.0,\"viewmodel_changer_x\":205.0,\"viewmodel_changer_y\":100.0,\"viewmodel_changer_z\":-100.0,\"~client_nickname\":{\"client_nickname_text\":\"brandon\"},\"~fake_latency_toggle\":{\"fake_latency_slider\":0.0}},\"misc_chooser\":2.0,\"rage\":{\"aa_lister\":2.0,\"additions\":[\"Warmup / Round End AA\",\"~\"],\"anims\":true,\"avoid_knife\":true,\"builder_elements\":{\"Air\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-18.0,\"yaw_left_ct\":-18.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":27.0,\"yaw_right_ct\":27.0},\"Air Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":4.0,\"anti_timeout_ct\":4.0,\"antibrute\":true,\"antibrute_ct\":true,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":5.0,\"body_speed_ct\":5.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":1.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":3.0,\"ran_speed_1_ct\":3.0,\"ran_speed_2\":4.0,\"ran_speed_2_ct\":4.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":16.0,\"tick_speed2\":16.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-19.0,\"yaw_left_ct\":-19.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":47.0,\"yaw_right_ct\":47.0},\"Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":-30.0,\"yaw_center_ct\":-30.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-30.0,\"yaw_left_ct\":-30.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":45.0,\"yaw_right_ct\":45.0},\"Crouch Moving\":{\"Jitter\":\"3-way\",\"Jitter_ct\":\"3-way\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":4.0,\"anti_timeout_ct\":4.0,\"antibrute\":true,\"antibrute_ct\":true,\"antibrute_method\":2.0,\"antibrute_method_ct\":2.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Custom\",\"center_options_ct\":\"Custom\",\"custom_amount\":6.0,\"custom_amount_ct\":6.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":86.0,\"custom_slider_12_ct\":86.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":15.0,\"custom_slider_4_ct\":15.0,\"custom_slider_5\":-10.0,\"custom_slider_5_ct\":-10.0,\"custom_slider_6\":15.0,\"custom_slider_6_ct\":15.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":1.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":3.0,\"ran_speed_1_ct\":3.0,\"ran_speed_2\":6.0,\"ran_speed_2_ct\":6.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":true,\"tick_speed1\":14.0,\"tick_speed2\":18.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":6.0,\"yaw_jitter_ovr_ct\":6.0,\"yaw_left\":-30.0,\"yaw_left_ct\":-30.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":33.0,\"yaw_right_ct\":33.0},\"Manual\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Static\",\"fake_options_ct\":\"Static\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Amnesia\",\"speed_options_ct\":\"Amnesia\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Running\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":3.0,\"fake_left_random_ct\":3.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":3.0,\"fake_right_random_ct\":3.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":12.0,\"ran_speed_2_ct\":12.0,\"random_speed\":true,\"random_speed_ct\":true,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Amnesia\",\"speed_options_ct\":\"Amnesia\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":-27.0,\"yaw_jitter_ovr_ct\":-27.0,\"yaw_left\":-30.0,\"yaw_left_ct\":-30.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":30.0,\"yaw_right_ct\":30.0},\"Slowmotion\":{\"Jitter\":\"Random\",\"Jitter_ct\":\"Random\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Custom\",\"center_options_ct\":\"Custom\",\"custom_amount\":4.0,\"custom_amount_ct\":4.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":-22.0,\"custom_slider_4_ct\":-22.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":-111.0,\"custom_slider_6_ct\":-111.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":56.0,\"fake_left_ct\":56.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":45.0,\"fake_right_ct\":45.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":11.0,\"ran_speed_1_ct\":11.0,\"ran_speed_2\":18.0,\"ran_speed_2_ct\":18.0,\"random_speed\":true,\"random_speed_ct\":true,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":22.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-38.0,\"yaw_left_ct\":-38.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":44.0,\"yaw_right_ct\":44.0},\"Standing\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":4.0,\"custom_amount_ct\":4.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":-22.0,\"custom_slider_4_ct\":-22.0,\"custom_slider_5\":-57.0,\"custom_slider_5_ct\":-57.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":20.0,\"ran_speed_2_ct\":20.0,\"random_speed\":true,\"random_speed_ct\":true,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-33.0,\"yaw_left_ct\":-33.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":41.0,\"yaw_right_ct\":41.0}},\"defensive_elements\":{\"Air\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Air Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Crouch Moving\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Manual\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Running\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Slowmotion\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Standing\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0}},\"freestanding_bind\":false,\"hidden_builder\":false,\"manual\":\"At Target\",\"safe_head\":true,\"state_list\":\"Standing\",\"team_list\":\"T\",\"~anims\":{\"move_fall\":0.0,\"move_jitter\":0.0,\"move_jitter_mode\":2.0,\"move_lean_val\":100.0,\"move_legs1\":0.0,\"move_legs2\":100.0},\"~freestanding_bind\":{\"freestand_body\":1.0,\"freestand_enablers\":[\"~\"],\"freestand_options\":[\"~\"],\"keep_fs\":false,\"prefer_manual\":false},\"~hidden_builder\":{\"antiaim_conditions\":[\"~\"],\"disablers\":[\"~\"],\"on_exploit\":[\"~\"],\"state_list\":\"Standing\"},\"~safe_head\":{\"safe_options\":[3.0,\"~\"]}},\"visuals\":{\"accent\":\"#96C83CFF\",\"gs_inds\":false,\"kibit_hitmark\":false,\"molotov_radius\":false,\"notifs\":false,\"scope\":true,\"slowed_down\":true,\"smokes_radius\":false,\"watermark\":\"Left\",\"watermark_style\":1.0,\"~kibit_hitmark\":{\"kibit_hitmark_color\":\"#58FFD1FF\"},\"~notifs\":{\"notifs_glow_amount\":41.0,\"notifs_hit_clr\":\"#00FF00FF\",\"notifs_miss_clr\":\"#FF0000FF\",\"notifs_prefix\":false,\"notifs_prefix_clr\":\"#00FF00FF\",\"notifs_prefix_font\":1.0,\"notifs_round_amount\":11.0},\"~scope\":{\"scope_color1\":\"#FFFFFFFF\",\"scope_color2\":\"#8A8A8A00\",\"scope_gap\":5.0,\"scope_settings\":[\"~\"],\"scope_size\":201.0,\"scope_style\":1.0}}}"
			local var_90_8 = json.parse(var_90_7)

			slot_0_1_0.load(var_90_8)
			slot_0_12_0.push("Custom Jitter preset has been successfully imported!")
		elseif var_90_0 == 5 then
			local var_90_9 = "{\"defensive\":{\"defensive_conditions\":[\"Standing\",\"Slowmotion\",\"Crouch\",\"Crouch Moving\",\"Air Crouch\",\"~\"],\"force_hideshot\":false,\"game_events\":[\"~\"]},\"main\":{\"input_name\":\"defaultnyuanza\",\"preset_list\":5.0},\"misc\":{\"aspect_ratio\":true,\"aspect_ratio_val\":133.0,\"clantag\":false,\"client_nickname\":false,\"fake_latency_toggle\":false,\"fast_ladder\":true,\"freeze_fakeduck\":true,\"log_event\":[\"Aimbot\",\"Purchases\",\"~\"],\"no_fall\":true,\"super_toss\":true,\"unlock_fakeduck\":true,\"view_model_changer\":true,\"viewmodel_changer_fov\":72.0,\"viewmodel_changer_x\":0.0,\"viewmodel_changer_y\":-174.0,\"viewmodel_changer_z\":-314.0,\"~client_nickname\":{\"client_nickname_text\":\"Type Here\"},\"~fake_latency_toggle\":{\"fake_latency_slider\":30.0}},\"misc_chooser\":1.0,\"rage\":{\"aa_lister\":2.0,\"additions\":[\"~\"],\"anims\":true,\"avoid_knife\":true,\"builder_elements\":{\"Air\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":8.0,\"body_speed_ct\":8.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Custom\",\"center_options_ct\":\"Custom\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":59.0,\"fake_left_ct\":59.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":59.0,\"fake_right_ct\":59.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-30.0,\"yaw_left_ct\":-30.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":4.0,\"yaw_randomize_ct\":4.0,\"yaw_right\":30.0,\"yaw_right_ct\":30.0},\"Air Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":7.0,\"amplitude_ct\":7.0,\"anti_timeout\":4.0,\"anti_timeout_ct\":4.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":2.0,\"antibrute_method_ct\":2.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":12.0,\"custom_amount_ct\":12.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":-24.0,\"custom_slider_12_ct\":-24.0,\"custom_slider_13\":6.0,\"custom_slider_13_ct\":6.0,\"custom_slider_14\":-6.0,\"custom_slider_14_ct\":-6.0,\"custom_slider_15\":-10.0,\"custom_slider_15_ct\":-10.0,\"custom_slider_16\":-23.0,\"custom_slider_16_ct\":-23.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":-19.0,\"custom_slider_6_ct\":-19.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":6.0,\"custom_speed_amount_ct\":6.0,\"custom_speed_slider_1\":1.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":1.0,\"custom_speed_slider_2\":1.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":1.0,\"custom_speed_slider_3\":1.0,\"custom_speed_slider_3_ct\":1.0,\"custom_speed_slider_4\":1.0,\"custom_speed_slider_4_ct\":1.0,\"custom_speed_slider_5\":1.0,\"custom_speed_slider_5_ct\":1.0,\"custom_speed_slider_6\":20.0,\"custom_speed_slider_6_ct\":20.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":59.0,\"fake_left_ct\":59.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":59.0,\"fake_right_ct\":59.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":18.0,\"frequency_ct\":18.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":6.0,\"ran_speed_1_ct\":6.0,\"ran_speed_2\":10.0,\"ran_speed_2_ct\":10.0,\"random_speed\":true,\"random_speed_ct\":true,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":true,\"tick_speed1\":12.0,\"tick_speed2\":16.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-20.0,\"yaw_left_ct\":-20.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":4.0,\"yaw_randomize_ct\":4.0,\"yaw_right\":42.0,\"yaw_right_ct\":42.0},\"Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":6.0,\"custom_amount_ct\":6.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":-15.0,\"custom_slider_5_ct\":-15.0,\"custom_slider_6\":19.0,\"custom_slider_6_ct\":19.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":6.0,\"custom_speed_amount_ct\":6.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":3.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":3.0,\"custom_speed_slider_3\":4.0,\"custom_speed_slider_3_ct\":4.0,\"custom_speed_slider_4\":5.0,\"custom_speed_slider_4_ct\":5.0,\"custom_speed_slider_5\":3.0,\"custom_speed_slider_5_ct\":3.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":1.0,\"fake_left\":59.0,\"fake_left_ct\":59.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":59.0,\"fake_right_ct\":59.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":16.0,\"tick_speed2\":1.0,\"yaw_center\":-30.0,\"yaw_center_ct\":-30.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-30.0,\"yaw_left_ct\":-30.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":5.0,\"yaw_randomize_ct\":5.0,\"yaw_right\":46.0,\"yaw_right_ct\":46.0},\"Crouch Moving\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":4.0,\"anti_timeout_ct\":4.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":2.0,\"antibrute_method_ct\":2.0,\"body_speed\":8.0,\"body_speed_ct\":8.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":1.0,\"center_max_ct\":1.0,\"center_min\":-1.0,\"center_min_ct\":-1.0,\"center_options\":\"Min - Max\",\"center_options_ct\":\"Min - Max\",\"custom_amount\":6.0,\"custom_amount_ct\":6.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":-6.0,\"custom_slider_13_ct\":-6.0,\"custom_slider_14\":-19.0,\"custom_slider_14_ct\":-19.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":-15.0,\"custom_slider_5_ct\":-15.0,\"custom_slider_6\":19.0,\"custom_slider_6_ct\":19.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":5.0,\"custom_speed_amount_ct\":5.0,\"custom_speed_slider_1\":4.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":4.0,\"custom_speed_slider_2\":4.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":4.0,\"custom_speed_slider_3\":6.0,\"custom_speed_slider_3_ct\":6.0,\"custom_speed_slider_4\":4.0,\"custom_speed_slider_4_ct\":4.0,\"custom_speed_slider_5\":4.0,\"custom_speed_slider_5_ct\":4.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":59.0,\"fake_left_ct\":59.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":59.0,\"fake_right_ct\":59.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":4.0,\"ran_speed_1_ct\":4.0,\"ran_speed_2\":14.0,\"ran_speed_2_ct\":14.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":true,\"tick_speed1\":14.0,\"tick_speed2\":18.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":6.0,\"yaw_jitter_ovr_ct\":6.0,\"yaw_left\":-27.0,\"yaw_left_ct\":-27.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":3.0,\"yaw_randomize_ct\":3.0,\"yaw_right\":40.0,\"yaw_right_ct\":40.0},\"Manual\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Running\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":4.0,\"anti_timeout_ct\":4.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":2.0,\"antibrute_method_ct\":2.0,\"body_speed\":6.0,\"body_speed_ct\":6.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":6.0,\"custom_speed_amount_ct\":6.0,\"custom_speed_slider_1\":3.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":3.0,\"custom_speed_slider_2\":3.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":3.0,\"custom_speed_slider_3\":3.0,\"custom_speed_slider_3_ct\":3.0,\"custom_speed_slider_4\":3.0,\"custom_speed_slider_4_ct\":3.0,\"custom_speed_slider_5\":3.0,\"custom_speed_slider_5_ct\":3.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":59.0,\"fake_left_ct\":59.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":59.0,\"fake_right_ct\":59.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":4.0,\"ran_speed_1_ct\":4.0,\"ran_speed_2\":6.0,\"ran_speed_2_ct\":6.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Custom\",\"random_speed_method_ct\":\"Custom\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":-27.0,\"yaw_jitter_ovr_ct\":-27.0,\"yaw_left\":-27.0,\"yaw_left_ct\":-27.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":3.0,\"yaw_randomize_ct\":3.0,\"yaw_right\":39.0,\"yaw_right_ct\":39.0},\"Slowmotion\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":4.0,\"anti_timeout_ct\":4.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":2.0,\"antibrute_method_ct\":2.0,\"body_speed\":10.0,\"body_speed_ct\":8.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Custom\",\"center_options_ct\":\"Custom\",\"custom_amount\":6.0,\"custom_amount_ct\":6.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":-19.0,\"custom_slider_5_ct\":-19.0,\"custom_slider_6\":15.0,\"custom_slider_6_ct\":15.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":4.0,\"custom_speed_amount_ct\":4.0,\"custom_speed_slider_1\":16.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":16.0,\"custom_speed_slider_2\":13.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":13.0,\"custom_speed_slider_3\":20.0,\"custom_speed_slider_3_ct\":20.0,\"custom_speed_slider_4\":11.0,\"custom_speed_slider_4_ct\":11.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":58.0,\"fake_left_ct\":58.0,\"fake_left_random\":28.0,\"fake_left_random_ct\":28.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":58.0,\"fake_right_ct\":58.0,\"fake_right_random\":28.0,\"fake_right_random_ct\":28.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":14.0,\"ran_speed_2_ct\":14.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Custom\",\"random_speed_method_ct\":\"Custom\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":true,\"tick_speed1\":2.0,\"tick_speed2\":22.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-31.0,\"yaw_left_ct\":-31.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":5.0,\"yaw_randomize_ct\":5.0,\"yaw_right\":47.0,\"yaw_right_ct\":47.0},\"Standing\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":8.0,\"body_speed_ct\":8.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":4.0,\"custom_amount_ct\":4.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":-22.0,\"custom_slider_4_ct\":-22.0,\"custom_slider_5\":-57.0,\"custom_slider_5_ct\":-57.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"custom_speed_amount\":1.0,\"custom_speed_amount_ct\":1.0,\"custom_speed_slider_1\":2.0,\"custom_speed_slider_10\":2.0,\"custom_speed_slider_10_ct\":2.0,\"custom_speed_slider_11\":2.0,\"custom_speed_slider_11_ct\":2.0,\"custom_speed_slider_12\":2.0,\"custom_speed_slider_12_ct\":2.0,\"custom_speed_slider_13\":2.0,\"custom_speed_slider_13_ct\":2.0,\"custom_speed_slider_14\":2.0,\"custom_speed_slider_14_ct\":2.0,\"custom_speed_slider_15\":2.0,\"custom_speed_slider_15_ct\":2.0,\"custom_speed_slider_16\":2.0,\"custom_speed_slider_16_ct\":2.0,\"custom_speed_slider_17\":2.0,\"custom_speed_slider_17_ct\":2.0,\"custom_speed_slider_18\":2.0,\"custom_speed_slider_18_ct\":2.0,\"custom_speed_slider_19\":2.0,\"custom_speed_slider_19_ct\":2.0,\"custom_speed_slider_1_ct\":2.0,\"custom_speed_slider_2\":2.0,\"custom_speed_slider_20\":2.0,\"custom_speed_slider_20_ct\":2.0,\"custom_speed_slider_21\":2.0,\"custom_speed_slider_21_ct\":2.0,\"custom_speed_slider_22\":2.0,\"custom_speed_slider_22_ct\":2.0,\"custom_speed_slider_2_ct\":2.0,\"custom_speed_slider_3\":2.0,\"custom_speed_slider_3_ct\":2.0,\"custom_speed_slider_4\":2.0,\"custom_speed_slider_4_ct\":2.0,\"custom_speed_slider_5\":2.0,\"custom_speed_slider_5_ct\":2.0,\"custom_speed_slider_6\":2.0,\"custom_speed_slider_6_ct\":2.0,\"custom_speed_slider_7\":2.0,\"custom_speed_slider_7_ct\":2.0,\"custom_speed_slider_8\":2.0,\"custom_speed_slider_8_ct\":2.0,\"custom_speed_slider_9\":2.0,\"custom_speed_slider_9_ct\":2.0,\"defensive_tickbase\":0.0,\"fake_left\":59.0,\"fake_left_ct\":59.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":59.0,\"fake_right_ct\":59.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":20.0,\"ran_speed_2_ct\":20.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-23.0,\"yaw_left_ct\":-23.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":6.0,\"yaw_randomize_ct\":6.0,\"yaw_right\":45.0,\"yaw_right_ct\":45.0}},\"defensive_elements\":{\"Air\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Air Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":6.0,\"body_speed_ct\":8.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Inverter\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-25.0,\"yaw_left_ct\":-25.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":5.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":53.0,\"yaw_right_ct\":41.0},\"Crouch\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Crouch Moving\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":6.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Custom\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Static\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":82.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Amnesia\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":-15.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-27.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":12.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":32.0,\"yaw_right_ct\":0.0},\"Manual\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Running\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":10.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Inverter\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-41.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":3.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":41.0,\"yaw_right_ct\":0.0},\"Slowmotion\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Standing\":{\"Jitter\":\"Disabled\",\"Jitter_ct\":\"Disabled\",\"amnesia_tick_speed\":16.0,\"amnesia_tick_speed_ct\":16.0,\"amplitude\":0.0,\"amplitude_ct\":0.0,\"body_speed\":1.0,\"body_speed_ct\":1.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"def_activation\":\"Always\",\"def_activation_ct\":\"Always\",\"def_pitch\":\"Down\",\"def_pitch_ct\":\"Down\",\"def_toggle\":false,\"def_toggle_ct\":false,\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"frequency\":0.0,\"frequency_ct\":0.0,\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"pitch_offset\":0.0,\"pitch_offset_ct\":0.0,\"r_max\":0.0,\"r_max_ct\":0.0,\"r_min\":0.0,\"r_min_ct\":0.0,\"ran_speed_1\":1.0,\"ran_speed_1_ct\":1.0,\"ran_speed_2\":1.0,\"ran_speed_2_ct\":1.0,\"random_speed\":false,\"random_speed_ct\":false,\"random_speed_method\":\"Random\",\"random_speed_method_ct\":\"Random\",\"scale\":0.0,\"scale_ct\":0.0,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"spin_speed_ct\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_random_methods\":\"Default\",\"yaw_random_methods_ct\":\"Default\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0}},\"freestanding_bind\":false,\"hidden_builder\":false,\"manual\":\"At Target\",\"safe_head\":true,\"state_list\":\"Slowmotion\",\"team_list\":\"T\",\"~anims\":{\"move_fall\":0.0,\"move_jitter\":0.0,\"move_jitter_mode\":2.0,\"move_lean_val\":100.0,\"move_legs1\":0.0,\"move_legs2\":100.0},\"~freestanding_bind\":{\"freestand_body\":2.0,\"freestand_enablers\":[\"~\"],\"freestand_options\":[\"~\"],\"keep_fs\":true,\"prefer_manual\":true},\"~hidden_builder\":{\"antiaim_conditions\":[\"~\"],\"disablers\":[\"~\"],\"on_exploit\":[\"~\"],\"state_list\":\"Standing\"},\"~safe_head\":{\"safe_options\":[3.0,\"~\"]}},\"visuals\":{\"accent\":\"#FBC3FAFF\",\"gs_inds\":true,\"kibit_hitmark\":true,\"molotov_radius\":false,\"notifs\":false,\"scope\":true,\"slowed_down\":true,\"smokes_radius\":false,\"watermark\":\"Bottom\",\"watermark_style\":1.0,\"~kibit_hitmark\":{\"kibit_hitmark_color\":\"#58FFD1FF\"},\"~notifs\":{\"notifs_glow_amount\":41.0,\"notifs_hit_clr\":\"#FBC3FAFF\",\"notifs_miss_clr\":\"#FF0000FF\",\"notifs_prefix\":true,\"notifs_prefix_clr\":\"#FBC3FAFF\",\"notifs_prefix_font\":4.0,\"notifs_round_amount\":11.0},\"~scope\":{\"scope_color1\":\"#C5C5C5FF\",\"scope_color2\":\"#FFFFFF00\",\"scope_gap\":5.0,\"scope_settings\":[\"~\"],\"scope_size\":197.0,\"scope_style\":1.0}}}"
			local var_90_10 = json.parse(var_90_9)

			slot_0_1_0.load(var_90_10)
			slot_0_12_0.push("Royal preset has been successfully imported!")
		end

		return
	end

	local var_90_11 = slot_0_7_0.get_config_name_from_index(var_90_0)

	if not var_90_11 then
		slot_0_12_0.push("no config found with the selected index")

		return
	end

	local var_90_12 = (db.configurations4 or {})[var_90_11]

	if not var_90_12 then
		slot_0_12_0.push("no config found with name : " .. var_90_11)

		return
	end

	local var_90_13 = "{\"defensive\":{\"antiaim_conditions\":[\"Standing\",\"Slowmotion\",\"Crouch\",\"Crouch Moving\",\"Air\",\"Air Crouch\",\"~\"],\"defensive_conditions\":[\"Standing\",\"Slowmotion\",\"Crouch\",\"Crouch Moving\",\"Air\",\"Air Crouch\",\"~\"],\"disablers\":[\"freestanding\",\"manual aa\",\"peek assist\",\"~\"],\"force_hideshot\":true,\"game_events\":[\"~\"],\"on_exploit\":[\"doubletap\",\"hideshots\",\"~\"],\"state_list\":\"Air Crouch\"},\"main\":{\"input_name\":\"default\",\"preset_list\":6.0},\"misc\":{\"aim_logs\":true,\"aspect_ratio\":true,\"aspect_ratio_val\":134.0,\"clantag\":false,\"fake_latency\":15.0,\"fast_ladder\":true,\"fps_boost\":true,\"kibit_hitmark\":false,\"kibit_hitmark_color\":\"#58FFD1FF\",\"no_fall\":false,\"view_model_changer\":true,\"viewmodel_changer_fov\":68.0,\"viewmodel_changer_x\":100.0,\"viewmodel_changer_y\":-100.0,\"viewmodel_changer_z\":200.0},\"rage\":{\"anim_options\":[1.0,2.0,\"~\"],\"anims\":true,\"anti_back\":false,\"builder_elements\":{\"Air\":{\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Auto\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Spin\",\"extend_option\":\"none\",\"extend_option_ct\":\"none\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":2.0,\"fake_left_random_ct\":2.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":5.0,\"fake_right_random_ct\":5.0,\"flick_left\":-11.0,\"flick_left_body\":24.0,\"flick_left_body_ct\":24.0,\"flick_left_ct\":-11.0,\"flick_right\":11.0,\"flick_right_body\":26.0,\"flick_right_body_ct\":26.0,\"flick_right_ct\":11.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":5.0,\"flick_speed_random_ct\":6.0,\"Jitter\":\"Disabled\",\"jitter_ct\":\"Disabled\",\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":3.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-29.0,\"yaw_left_ct\":-29.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":35.0,\"yaw_right_ct\":35.0},\"Air Crouch\":{\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Spin\",\"extend_option\":\"none\",\"extend_option_ct\":\"none\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":-7.0,\"flick_left_body\":24.0,\"flick_left_body_ct\":24.0,\"flick_left_ct\":-7.0,\"flick_right\":15.0,\"flick_right_body\":26.0,\"flick_right_body_ct\":26.0,\"flick_right_ct\":15.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":3.0,\"flick_speed_random_ct\":3.0,\"Jitter\":\"Disabled\",\"jitter_ct\":\"Disabled\",\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":-89.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":2.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-18.0,\"yaw_left_ct\":-18.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":44.0,\"yaw_right_ct\":44.0},\"Crouch\":{\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Spin\",\"extend_option\":\"none\",\"extend_option_ct\":\"none\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":0.0,\"flick_left_body_ct\":0.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":0.0,\"flick_right_body_ct\":0.0,\"flick_right_ct\":0.0,\"flick_speed\":1.0,\"flick_speed_ct\":1.0,\"flick_speed_random\":1.0,\"flick_speed_random_ct\":1.0,\"Jitter\":\"Disabled\",\"jitter_ct\":\"Disabled\",\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-32.0,\"yaw_left_ct\":-32.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":46.0,\"yaw_right_ct\":46.0},\"Crouch Moving\":{\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Spin\",\"extend_option\":\"none\",\"extend_option_ct\":\"none\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":-3.0,\"flick_left_body\":25.0,\"flick_left_body_ct\":8.0,\"flick_left_ct\":-7.0,\"flick_right\":6.0,\"flick_right_body\":29.0,\"flick_right_body_ct\":8.0,\"flick_right_ct\":12.0,\"flick_speed\":7.0,\"flick_speed_ct\":7.0,\"flick_speed_random\":3.0,\"flick_speed_random_ct\":5.0,\"Jitter\":\"Disabled\",\"jitter_ct\":\"Disabled\",\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-22.0,\"yaw_left_ct\":-22.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":44.0,\"yaw_right_ct\":44.0},\"Manual\":{\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Static\",\"extend_option\":\"none\",\"extend_option_ct\":\"none\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":0.0,\"flick_left_body_ct\":0.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":0.0,\"flick_right_body_ct\":0.0,\"flick_right_ct\":0.0,\"flick_speed\":1.0,\"flick_speed_ct\":1.0,\"flick_speed_random\":1.0,\"flick_speed_random_ct\":1.0,\"Jitter\":\"Center\",\"jitter_ct\":\"Center\",\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":0.0,\"yaw_left_ct\":0.0,\"yaw_mode\":\"Static\",\"yaw_mode_ct\":\"Static\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":0.0,\"yaw_right_ct\":0.0},\"Running\":{\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Random\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Random\",\"extend_option\":\"none\",\"extend_option_ct\":\"none\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":-12.0,\"flick_left_body\":26.0,\"flick_left_body_ct\":26.0,\"flick_left_ct\":-12.0,\"flick_right\":8.0,\"flick_right_body\":20.0,\"flick_right_body_ct\":20.0,\"flick_right_ct\":8.0,\"flick_speed\":8.0,\"flick_speed_ct\":8.0,\"flick_speed_random\":5.0,\"flick_speed_random_ct\":5.0,\"Jitter\":\"Disabled\",\"jitter_ct\":\"Disabled\",\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":true,\"limit_random_ct\":true,\"pitch_offset\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":180.0,\"yaw_jitter_ovr_ct\":180.0,\"yaw_left\":-24.0,\"yaw_left_ct\":-24.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":37.0,\"yaw_right_ct\":37.0},\"Slowmotion\":{\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":0.0,\"center_max_ct\":0.0,\"center_min\":0.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Auto\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Spin\",\"extend_option\":\"none\",\"extend_option_ct\":\"none\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":0.0,\"flick_left_body_ct\":0.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":0.0,\"flick_right_body_ct\":0.0,\"flick_right_ct\":0.0,\"flick_speed\":1.0,\"flick_speed_ct\":1.0,\"flick_speed_random\":1.0,\"flick_speed_random_ct\":1.0,\"Jitter\":\"Disabled\",\"jitter_ct\":\"Disabled\",\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":0.0,\"yaw_jitter_ovr_ct\":0.0,\"yaw_left\":-23.0,\"yaw_left_ct\":-23.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":47.0,\"yaw_right_ct\":47.0},\"Standing\":{\"anti_timeout\":0.0,\"anti_timeout_ct\":0.0,\"antibrute\":false,\"antibrute_ct\":false,\"antibrute_method\":1.0,\"antibrute_method_ct\":1.0,\"body_speed\":2.0,\"body_speed_ct\":2.0,\"body_yaw\":true,\"body_yaw_ct\":true,\"center_max\":-5.0,\"center_max_ct\":0.0,\"center_min\":5.0,\"center_min_ct\":0.0,\"center_options\":\"Randomize\",\"center_options_ct\":\"Randomize\",\"custom_amount\":1.0,\"custom_amount_ct\":1.0,\"custom_slider_1\":0.0,\"custom_slider_10\":0.0,\"custom_slider_10_ct\":0.0,\"custom_slider_11\":0.0,\"custom_slider_11_ct\":0.0,\"custom_slider_12\":0.0,\"custom_slider_12_ct\":0.0,\"custom_slider_13\":0.0,\"custom_slider_13_ct\":0.0,\"custom_slider_14\":0.0,\"custom_slider_14_ct\":0.0,\"custom_slider_15\":0.0,\"custom_slider_15_ct\":0.0,\"custom_slider_16\":0.0,\"custom_slider_16_ct\":0.0,\"custom_slider_17\":0.0,\"custom_slider_17_ct\":0.0,\"custom_slider_18\":0.0,\"custom_slider_18_ct\":0.0,\"custom_slider_19\":0.0,\"custom_slider_19_ct\":0.0,\"custom_slider_1_ct\":0.0,\"custom_slider_2\":0.0,\"custom_slider_20\":0.0,\"custom_slider_20_ct\":0.0,\"custom_slider_21\":0.0,\"custom_slider_21_ct\":0.0,\"custom_slider_22\":0.0,\"custom_slider_22_ct\":0.0,\"custom_slider_2_ct\":0.0,\"custom_slider_3\":0.0,\"custom_slider_3_ct\":0.0,\"custom_slider_4\":0.0,\"custom_slider_4_ct\":0.0,\"custom_slider_5\":0.0,\"custom_slider_5_ct\":0.0,\"custom_slider_6\":0.0,\"custom_slider_6_ct\":0.0,\"custom_slider_7\":0.0,\"custom_slider_7_ct\":0.0,\"custom_slider_8\":0.0,\"custom_slider_8_ct\":0.0,\"custom_slider_9\":0.0,\"custom_slider_9_ct\":0.0,\"def_activation\":\"Always\",\"def_static_offset\":0.0,\"defensive_pitch\":\"Auto\",\"defensive_tickbase\":0.0,\"defensive_yaw\":\"Spin\",\"extend_option\":\"none\",\"extend_option_ct\":\"none\",\"fake_left\":60.0,\"fake_left_ct\":60.0,\"fake_left_random\":0.0,\"fake_left_random_ct\":0.0,\"fake_options\":\"Jitter\",\"fake_options_ct\":\"Jitter\",\"fake_right\":60.0,\"fake_right_ct\":60.0,\"fake_right_random\":0.0,\"fake_right_random_ct\":0.0,\"flick_left\":0.0,\"flick_left_body\":0.0,\"flick_left_body_ct\":0.0,\"flick_left_ct\":0.0,\"flick_right\":0.0,\"flick_right_body\":0.0,\"flick_right_body_ct\":0.0,\"flick_right_ct\":0.0,\"flick_speed\":1.0,\"flick_speed_ct\":1.0,\"flick_speed_random\":1.0,\"flick_speed_random_ct\":1.0,\"Jitter\":\"Disabled\",\"jitter_ct\":\"Disabled\",\"jitter_randomize\":0.0,\"jitter_randomize_ct\":0.0,\"limit_random\":false,\"limit_random_ct\":false,\"pitch_offset\":0.0,\"ran_speed_1\":2.0,\"ran_speed_1_ct\":2.0,\"ran_speed_2\":2.0,\"ran_speed_2_ct\":2.0,\"random_speed\":false,\"random_speed_ct\":false,\"speed_options\":\"Neverlose\",\"speed_options_ct\":\"Neverlose\",\"spin_speed\":1.0,\"tick_random\":false,\"tick_speed1\":1.0,\"tick_speed2\":1.0,\"yaw_center\":0.0,\"yaw_center_ct\":0.0,\"yaw_jitter_ovr\":92.0,\"yaw_jitter_ovr_ct\":92.0,\"yaw_left\":-24.0,\"yaw_left_ct\":-24.0,\"yaw_mode\":\"L - R\",\"yaw_mode_ct\":\"L - R\",\"yaw_randomize\":0.0,\"yaw_randomize_ct\":0.0,\"yaw_right\":41.0,\"yaw_right_ct\":41.0}},\"fluccate_fakelag\":true,\"freestand_body\":2.0,\"freestand_enablers\":[\"~\"],\"freestand_options\":[\"~\"],\"freestanding_bind\":false,\"keep_fs\":true,\"Manual\":\"At Target\",\"move_lean_val\":100.0,\"prefer_manual\":true,\"safe_head\":[\"~\"],\"state_list\":\"Air Crouch\",\"team_list\":1.0},\"visuals\":{\"accent\":\"#DFC3FFFF\",\"crosshair_ind\":false,\"gs_inds\":false,\"molotov_radius\":true,\"notifs\":false,\"notifs_hit_clr\":\"#00FF00FF\",\"notifs_miss_clr\":\"#FF0000FF\",\"scope\":true,\"slowed_down\":true,\"smokes_radius\":true,\"watermark\":\"Left\",\"watermark_style\":1.0}}"
	local var_90_14 = renameKeys(var_90_12)

	slot_0_1_0.load(var_90_14)
	slot_0_12_0.push("config loaded : " .. var_90_11)
end

function slot_0_7_0.delete_config()
	local var_91_0 = slot_0_9_0.main.preset_list:get()

	if var_91_0 <= 7 then
		slot_0_12_0.push("cannot delete predefined config")

		return
	end

	local var_91_1 = slot_0_7_0.get_config_name_from_index(var_91_0)

	if not var_91_1 then
		slot_0_12_0.push("no config found with the selected index")

		return
	end

	local var_91_2 = db.configurations4 or {}

	var_91_2[var_91_1] = nil
	db.configurations4 = var_91_2

	slot_0_7_0.update_config_list()
	slot_0_12_0.push("config deleted : " .. var_91_1)
end

function slot_0_58_0.start()
	local var_92_0 = slot_0_20_0 == "BETA"
	local var_92_1 = "https://api.github.com/repos/zxjapan/ls_config/contents/codes.txt"
	local var_92_2 = "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"

	network.get(var_92_1, {
		["Cache-Control"] = "no-cache",
		Accept = "application/vnd.github.v3.raw",
		["User-Agent"] = "LuaSense",
		Authorization = "token " .. var_92_2
	}, function(arg_93_0, arg_93_1, arg_93_2)
		if not arg_93_0 then
			slot_0_12_0.push("Failed to fetch verification codes")

			return
		end

		local var_93_0 = {}

		for iter_93_0 in arg_93_0:gmatch("[^\r\n]+") do
			table.insert(var_93_0, iter_93_0)
		end

		local var_93_1 = var_92_0 and ":beta" or ":live"
		local var_93_2

		for iter_93_1, iter_93_2 in ipairs(var_93_0) do
			if iter_93_2:sub(-#var_93_1) == var_93_1 then
				var_93_2 = iter_93_2

				break
			end
		end

		if not var_93_2 then
			slot_0_12_0.push(string.format("No %s verification codes available", var_92_0 and "beta" or "live"))

			return
		end

		slot_0_0_0.set(var_93_2)
		slot_0_12_0.push(string.format("Your verification code: %s", var_93_2))
		slot_0_12_0.push("Code is in your Console!")
		slot_0_23_0:branded_printing(string.format("Your verification code: %s", var_93_2))
		slot_0_23_0:branded_printing("Please enter this code in our Discord bot")
	end)
end

function slot_0_58_0.check()
	slot_0_58_0.start()
end

slot_0_62_0 = nil
slot_0_63_1 = ffi.cast("uintptr_t**", utils.opcode_scan("engine.dll", "A1 ? ? ? ? 0F 28 C1 F3 0F 5C 80 ? ? ? ? F3 0F 11 45 ? A1 ? ? ? ? 56 85 C0 75 04 33 F6 EB 26 80 78 14 00 74 F6 8B 4D 08 33 D2 E8 ? ? ? ? 8B F0 85 F6", 1))
slot_0_64_1 = ffi.typeof("        struct {\n            int64_t         unknown;\n            int64_t         steamID64;\n            char            szName[128];\n            int             userId;\n            char            szSteamID[20];\n            char            pad_0x00A8[0x10];\n            unsigned long   iSteamID;\n            char            szFriendsName[128];\n            bool            fakeplayer;\n            bool            ishltv;\n            unsigned int    customfiles[4];\n            unsigned char   filesdownloaded;\n        }\n    ")
slot_0_65_1 = utils.get_vfunc(11, ffi.typeof("$*(__thiscall*)(void*, int, int*)", slot_0_64_1))
slot_0_66_1 = nil

function slot_0_67_1(arg_95_0)
	local var_95_0 = entity.get_local_player()

	if not var_95_0 then
		return
	end

	local var_95_1 = slot_0_63_1[0][0]

	if not var_95_1 then
		return
	end

	local var_95_2 = ffi.cast("void***", var_95_1 + 21184)[0]

	if not var_95_2 then
		return
	end

	local var_95_3 = slot_0_65_1(var_95_2, var_95_0:get_index() - 1, nil)

	if not var_95_3 then
		return
	end

	local var_95_4 = ffi.string(var_95_3[0].szName)

	if arg_95_0 ~= var_95_4 and slot_0_66_1 == nil then
		slot_0_66_1 = var_95_4
	end

	ffi.copy(var_95_3[0].szName, arg_95_0, #arg_95_0 + 1)
end

slot_0_68_1 = false

function slot_0_69_1()
	local var_96_0 = slot_0_9_0.misc.client_nickname.client_nickname_text:get():sub(0, 32)

	slot_0_9_0.misc.client_nickname.client_nickname_text:set(var_96_0)

	if not slot_0_9_0.misc.client_nickname:get() or #var_96_0 == 0 then
		if slot_0_68_1 then
			slot_0_68_1 = false

			slot_0_67_1(slot_0_66_1 or panorama.MyPersonaAPI.GetName())

			slot_0_66_1 = nil
		end

		return
	end

	slot_0_68_1 = true

	slot_0_67_1(var_96_0)
end

events.net_update_start(slot_0_69_1)
events.net_update_end(slot_0_69_1)
slot_0_69_1()

slot_0_23_0.super_toss = {
	damp = 0.3
}

function slot_0_23_0.resolve_grenade_throw(arg_97_0, arg_97_1, arg_97_2, arg_97_3)
	arg_97_0.x = arg_97_0.x - 10 + math.abs(arg_97_0.x) / 9

	local var_97_0 = vector():angles(arg_97_0)
	local var_97_1 = arg_97_3 * 1.25
	local var_97_2 = math.clamp(arg_97_1 * 0.9, 15, 750)
	local var_97_3 = math.clamp(arg_97_2, 0, 1)
	local var_97_4 = var_97_2 * slot_0_19_0.math.lerp(slot_0_23_0.super_toss.damp, 1, var_97_3)
	local var_97_5 = var_97_0

	for iter_97_0 = 1, 8 do
		var_97_5 = (var_97_0 * (var_97_5 * var_97_4 + var_97_1):length() - var_97_1) / var_97_4

		var_97_5:normalize()
	end

	local var_97_6 = var_97_5:angles()

	if var_97_6.x > -10 then
		var_97_6.x = 0.9 * var_97_6.x + 9
	else
		var_97_6.x = 1.125 * var_97_6.x + 11.25
	end

	return var_97_6
end

function slot_0_23_0.on_grenade_override_view(arg_98_0)
	local var_98_0 = entity.get_local_player()

	if var_98_0 == nil or not var_98_0:is_alive() then
		return
	end

	if not slot_0_9_0.misc.super_toss:get() then
		return
	end

	local var_98_1 = var_98_0:get_player_weapon()

	if var_98_1 == nil then
		return
	end

	local var_98_2 = var_98_1:get_weapon_info()

	if var_98_2 == nil then
		return
	end

	if var_98_2.weapon_type ~= 9 then
		return
	end

	arg_98_0.angles = slot_0_23_0.resolve_grenade_throw(arg_98_0.angles, var_98_2.throw_velocity, var_98_1.m_flThrowStrength, arg_98_0.velocity)
end

slot_0_63_0 = vector()
slot_0_64_0 = vector()

function slot_0_23_0.handle_supertoss(arg_99_0)
	if arg_99_0.jitter_move ~= true then
		return
	end

	if not slot_0_9_0.misc.super_toss:get() then
		return
	end

	local var_99_0 = entity.get_local_player()

	if var_99_0 == nil then
		return
	end

	if var_99_0:get_player_weapon() == nil then
		return
	end

	local var_99_1 = var_99_0:get_player_weapon()
	local var_99_2 = var_99_1:get_weapon_info()
	local var_99_3 = var_99_1:get_name()

	if var_99_2 == nil or var_99_2.weapon_type ~= 9 then
		return
	end

	if var_99_1.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
		return
	end

	arg_99_0.in_speed = true

	local var_99_4 = var_99_0:simulate_movement()

	var_99_4:think()

	arg_99_0.view_angles = slot_0_23_0.resolve_grenade_throw(arg_99_0.view_angles, var_99_2.throw_velocity, var_99_1.m_flThrowStrength, var_99_4.velocity)
end

events.createmove(slot_0_23_0.handle_supertoss)
events.grenade_override_view(slot_0_23_0.on_grenade_override_view)

slot_0_65_0 = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck")
slot_0_66_0 = slot_0_5_0.new(46)
slot_0_23_0.freezetime = false

function slot_0_23_0.fake_duck(arg_100_0)
	local var_100_0 = entity.get_local_player()

	if not slot_0_9_0.misc.freeze_fakeduck:get() then
		return
	end

	if not slot_0_23_0.freezetime then
		return
	end

	if var_100_0 == nil or not var_100_0:is_alive() then
		return
	end

	if not slot_0_65_0:get() then
		return
	end

	local var_100_1 = var_100_0.m_flDuckAmount

	arg_100_0.in_bullrush = true

	if arg_100_0.choked_commands < 7 then
		arg_100_0.in_duck = false
	else
		arg_100_0.in_duck = true
	end

	arg_100_0.send_packet = not arg_100_0.choked_commands == 14
end

function slot_0_23_0.on_override_view(arg_101_0)
	local var_101_0 = entity.get_local_player()

	if not slot_0_9_0.misc.freeze_fakeduck:get() then
		return
	end

	if not slot_0_23_0.freezetime then
		return
	end

	if var_101_0 == nil or not var_101_0:is_alive() then
		return
	end

	if not slot_0_65_0:get() then
		return
	end

	local var_101_1 = var_101_0.m_flDuckAmount
	local var_101_2 = var_101_0.m_vecAbsOrigin.z + var_101_0.m_vecViewOffset.z
	local var_101_3 = slot_0_66_0(0.1, var_101_0.m_vecAbsOrigin.z + var_101_0.m_vecViewOffset.z)

	if bit.band(var_101_0.m_fFlags, 1) == 1 and math.abs(var_101_3 - var_101_2) < 20 then
		arg_101_0.camera.z = var_101_3
	end
end

events.createmove(slot_0_23_0.fake_duck)
events.override_view(slot_0_23_0.on_override_view)

slot_0_23_0.clantag = {
	step = 1,
	speed = 2,
	ref = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
	list = {
		"",
		"l",
		"lu",
		"lua",
		"luas",
		"luase",
		"luasen",
		"luasens",
		"luasense",
		"luasense",
		"luasens",
		"luasen",
		"luase",
		"luas",
		"lua",
		"lu",
		"l",
		""
	},
	run = function(arg_102_0)
		local function var_102_0()
			local var_103_0 = math.floor(globals.curtime * arg_102_0.speed + 0.5) % #arg_102_0.list + 1

			if var_103_0 == arg_102_0.step then
				return
			end

			arg_102_0.step = var_103_0

			arg_102_0.ref:override(false)
			common.set_clan_tag(arg_102_0.list[var_103_0])
		end

		slot_0_9_0.misc.clantag:set_callback(function(arg_104_0)
			if arg_104_0:get() then
				events.net_update_end:set(var_102_0)
			else
				events.net_update_end:unset(var_102_0)
				common.set_clan_tag("")
			end
		end, true)
		events.shutdown:set(function()
			common.set_clan_tag("")
			arg_102_0.ref:override()
		end)
	end
}
slot_0_67_0 = false
no_fall_damage = false
slot_0_68_0 = math.pi * 2
slot_0_69_0 = slot_0_68_0 / 8

function slot_0_70_0(arg_106_0, arg_106_1)
	local var_106_0 = arg_106_0:get_origin()

	for iter_106_0 = 0, slot_0_68_0, slot_0_69_0 do
		local var_106_1 = math.sin(iter_106_0)
		local var_106_2 = math.cos(iter_106_0)
		local var_106_3 = var_106_0.x + var_106_2 * 10
		local var_106_4 = var_106_0.y + var_106_1 * 10
		local var_106_5 = vector(var_106_3, var_106_4, var_106_0.z)
		local var_106_6 = var_106_5:clone()

		var_106_6.z = var_106_6.z - arg_106_1

		if utils.trace_line(var_106_5, var_106_6, arg_106_0).fraction ~= 1 then
			return true
		end
	end

	return false
end

events.createmove_run:set(function()
	self = entity.get_local_player()

	if self == nil then
		return
	end

	if not slot_0_9_0.misc.no_fall:get() then
		return
	end

	if self.m_vecVelocity.z >= -500 then
		slot_0_67_0 = false

		return
	end

	if slot_0_70_0(self, 15) then
		slot_0_67_0 = false
	elseif slot_0_70_0(self, 75) then
		slot_0_67_0 = true
	end

	self.in_duck = slot_0_67_0
end)
slot_0_11_0.register("createmove", "unlock_spike", function()
	local var_108_0 = cvar.sv_maxunlag

	if slot_0_9_0.misc.fake_latency_toggle:get() then
		slot_0_23_0.refs.fake_latency:override(slot_0_9_0.misc.fake_latency_toggle.fake_latency_slider:get())
		var_108_0:float(0.4, true)
	else
		slot_0_23_0.refs.fake_latency:override()
		var_108_0:float(tonumber(var_108_0:string()), true)
	end
end)

slot_0_16_0.rotation = 0
slot_0_16_0.shadow_anim = 0

function slot_0_16_0.handle()
	slot_109_0_0 = slot_0_9_0.visuals.scope:get()

	if not slot_109_0_0 then
		return
	end

	slot_109_1_0 = entity.get_local_player()

	if slot_109_1_0 == nil then
		return
	end

	slot_109_2_0 = slot_109_1_0:get_player_weapon()

	if not slot_109_2_0 then
		return
	end

	if slot_109_2_0 == nil then
		return
	end

	slot_0_23_0.refs.scope_type:override("Remove All")

	slot_109_3_0 = slot_0_9_0.visuals.scope.scope_settings:get(3)
	slot_109_4_0 = slot_109_1_0.m_bIsScoped
	slot_109_5_0 = slot_109_0_0 and slot_109_4_0 and 1 or 0
	slot_109_6_0 = slot_109_3_0 and slot_0_27_0:new("scope_overlay", slot_109_5_0) or slot_109_5_0

	if slot_109_6_0 < 0.1 then
		return
	end

	slot_109_7_0 = slot_0_9_0.visuals.scope.scope_style:get()
	slot_109_8_0 = slot_0_9_0.visuals.scope.scope_settings:get(1)
	slot_109_9_1 = slot_0_9_0.visuals.scope.scope_size:get()
	slot_109_10_0 = slot_0_9_0.visuals.scope.scope_gap:get()
	slot_109_11_0 = slot_0_9_0.visuals.scope.scope_color1:get()
	slot_109_12_0 = slot_0_9_0.visuals.scope.scope_color2:get()
	slot_109_13_0 = slot_0_9_0.visuals.scope.scope_settings:get(2)
	slot_109_14_0 = slot_109_8_0 and slot_0_27_0:new("spread_dependensy", slot_109_2_0:get_inaccuracy() * 75) + slot_109_10_0 or slot_109_10_0
	slot_109_15_0 = {
		slot_109_11_0:override("a", slot_109_11_0.a * slot_109_6_0),
		slot_109_12_0:override("a", slot_109_12_0.a * slot_109_6_0)
	}
	slot_109_9_0 = slot_109_9_1 * slot_109_6_0
	slot_109_16_0 = slot_0_23_0.screen_size / 2
	slot_0_16_0.rotation = slot_0_27_0:new("scop_ratator", slot_109_7_0 == 3 and 45 or 90)
	slot_0_16_0.shadow_anim = slot_0_27_0:new("scope_shadow_anim", slot_109_13_0 and 15 or 1)

	if slot_0_16_0.rotation ~= 90 then
		render.push_rotation(slot_0_16_0.rotation, slot_0_23_0.screen_size / 2)
	end

	if slot_0_16_0.shadow_anim ~= 1 then
		render.shadow(slot_109_16_0 - vector(slot_109_9_0 + slot_109_14_0, -1), slot_109_16_0 - vector(slot_109_14_0, 0), slot_109_15_0[1], slot_0_16_0.shadow_anim)
		render.shadow(slot_109_16_0 + vector(slot_109_14_0, 1), slot_109_16_0 + vector(slot_109_9_0 + slot_109_14_0, 0), slot_109_15_0[1], slot_0_16_0.shadow_anim)
		render.shadow(slot_109_16_0 + vector(0, slot_109_14_0), slot_109_16_0 + vector(-1, slot_109_9_0 + slot_109_14_0), slot_109_15_0[1], slot_0_16_0.shadow_anim)
	end

	render.gradient(slot_109_16_0 - vector(slot_109_9_0 + slot_109_14_0, -1), slot_109_16_0 - vector(slot_109_14_0, 0), slot_109_15_0[2], slot_109_15_0[1], slot_109_15_0[2], slot_109_15_0[1])
	render.gradient(slot_109_16_0 + vector(slot_109_9_0 + slot_109_14_0, 1), slot_109_16_0 + vector(slot_109_14_0, 0), slot_109_15_0[2], slot_109_15_0[1], slot_109_15_0[2], slot_109_15_0[1])

	if slot_109_7_0 ~= 2 then
		if slot_0_16_0.shadow_anim ~= 1 then
			render.shadow(slot_109_16_0 - vector(-1, slot_109_9_0 + slot_109_14_0), slot_109_16_0 - vector(0, slot_109_14_0), slot_109_15_0[1], slot_0_16_0.shadow_anim)
		end

		render.gradient(slot_109_16_0 - vector(-1, slot_109_9_0 + slot_109_14_0), slot_109_16_0 - vector(0, slot_109_14_0), slot_109_15_0[2], slot_109_15_0[2], slot_109_15_0[1], slot_109_15_0[1])
	end

	render.gradient(slot_109_16_0 + vector(1, slot_109_9_0 + slot_109_14_0), slot_109_16_0 + vector(0, slot_109_14_0), slot_109_15_0[2], slot_109_15_0[2], slot_109_15_0[1], slot_109_15_0[1])

	if slot_0_16_0.rotation ~= 90 then
		render.pop_rotation()
	end
end

slot_0_11_0.register("render", "scope_overlay", slot_0_16_0.handle)

slot_0_9_0.misc.viewmodel_changer_fov = slot_0_9_0.misc.view_model_changer:create():slider("Field Of View", 0, 100, 68)
slot_0_9_0.misc.viewmodel_changer_x = slot_0_9_0.misc.view_model_changer:create():slider("X Axis", -3000, 3000, 205, 0.01)
slot_0_9_0.misc.viewmodel_changer_y = slot_0_9_0.misc.view_model_changer:create():slider("Y Axis", -3000, 3000, 100, 0.01)
slot_0_9_0.misc.viewmodel_changer_z = slot_0_9_0.misc.view_model_changer:create():slider("Z Axis", -3000, 3000, -100, 0.01)
slot_0_13_0.cvars = {
	viewmodel_fov = cvar.viewmodel_fov,
	viewmodel_offset_x = cvar.viewmodel_offset_x,
	viewmodel_offset_y = cvar.viewmodel_offset_y,
	viewmodel_offset_z = cvar.viewmodel_offset_z
}

function slot_0_13_0.handle()
	if slot_0_9_0.misc.view_model_changer:get() then
		slot_0_13_0.cvars.viewmodel_fov:float(slot_0_9_0.misc.viewmodel_changer_fov:get(), true)
		slot_0_13_0.cvars.viewmodel_offset_x:float(slot_0_9_0.misc.viewmodel_changer_x:get() / 100, true)
		slot_0_13_0.cvars.viewmodel_offset_y:float(slot_0_9_0.misc.viewmodel_changer_y:get() / 100, true)
		slot_0_13_0.cvars.viewmodel_offset_z:float(slot_0_9_0.misc.viewmodel_changer_z:get() / 100, true)
	else
		slot_0_13_0.cvars.viewmodel_fov:float(68)
		slot_0_13_0.cvars.viewmodel_offset_x:float(2.5)
		slot_0_13_0.cvars.viewmodel_offset_y:float(0)
		slot_0_13_0.cvars.viewmodel_offset_z:float(-1.5)
	end
end

function slot_0_13_0.destroy()
	slot_0_13_0.cvars.viewmodel_fov:float(68)
	slot_0_13_0.cvars.viewmodel_offset_x:float(2.5)
	slot_0_13_0.cvars.viewmodel_offset_y:float(0)
	slot_0_13_0.cvars.viewmodel_offset_z:float(-1.5)
end

slot_0_11_0.register("render", "viewmodel", slot_0_13_0.handle)
slot_0_11_0.register("shutdown", "viewmodel", slot_0_13_0.destroy)

slot_0_9_0.misc.aspect_ratio_val = slot_0_9_0.misc.aspect_ratio:create():slider("Aspect Value", 50, 300, 0, 0.01)
slot_0_71_0 = {
	cvar = cvar.r_aspectratio
}
slot_0_71_0.cvar_float_raw = slot_0_71_0.cvar.float

function slot_0_23_0.handle_aspect(arg_112_0)
	local var_112_0 = slot_0_27_0:new("aspect_ratio", slot_0_9_0.misc.aspect_ratio_val:get() / 100, 0.1)

	if slot_0_9_0.misc.aspect_ratio_val:get() == 50 then
		var_112_0 = 0
	end

	if not slot_0_9_0.misc.aspect_ratio:get() then
		var_112_0 = 0
	end

	if var_112_0 ~= slot_0_71_0.cvar_float_raw(slot_0_71_0.cvar) then
		slot_0_71_0.cvar_float_raw(slot_0_71_0.cvar, var_112_0)
	end
end

function aspect_ratio_destroy()
	aspect_ratio.cvar_float_raw(slot_0_71_0.cvar, 0)
end

aspect_ratio_ratios = {
	[161] = "16:10",
	[177] = "16:9",
	[125] = "5:4",
	[150] = "3:2",
	[133] = "4:3"
}
slot_0_72_0 = 0

for iter_0_0, iter_0_1 in pairs(aspect_ratio_ratios) do
	slot_0_72_0 = slot_0_72_0 + 1
	slot_0_78_1 = slot_0_9_0.misc.aspect_ratio:create():button(iter_0_1, function()
		slot_0_9_0.misc.aspect_ratio_val:set(iter_0_0)
	end)
end

slot_0_10_0.animlayer_offset = 10640
slot_0_10_0.animlayer_t = ffi.typeof("    struct {\n        char pad_0x0000[0x18];\n        uint32_t seq;\n        float prev_cycle;\n        float weight;\n        float weight_delta_rate;\n        float playback_rate;\n        float cycle;\n        void *entity;\n        char pad_0x0038[0x4];\n    }**\n")

function slot_0_10_0.get_anim_layer(arg_115_0)
	local var_115_0 = ffi.cast("void***", arg_115_0[0])

	if var_115_0 == ffi.NULL then
		return nil
	end

	return ffi.cast(slot_0_10_0.animlayer_t, ffi.cast("char*", var_115_0) + slot_0_10_0.animlayer_offset)[0]
end

function slot_0_10_0.handle(arg_116_0)
	if not slot_0_9_0.rage.anims:get() then
		return
	end

	local var_116_0 = entity.get_local_player()

	if not var_116_0 or arg_116_0 ~= var_116_0 then
		return
	end

	local var_116_1 = slot_0_9_0.rage.anims.move_lean_val:get() * 0.1

	if var_116_1 ~= -1 then
		local var_116_2 = slot_0_10_0.get_anim_layer(var_116_0)

		if var_116_2 then
			var_116_2[12].weight = var_116_1
		end
	end

	local var_116_3 = slot_0_9_0.rage.anims.move_fall:get() * 0.1

	if var_116_3 ~= -1 then
		var_116_0.m_flPoseParameter[6] = var_116_3
	end
end

function slot_0_10_0.handle_pre_render()
	if not slot_0_9_0.rage.anims:get() then
		return
	end

	local var_117_0 = entity.get_local_player()

	if not var_117_0 then
		return
	end

	local var_117_1 = slot_0_9_0.rage.anims.move_jitter_mode:get()
	local var_117_2 = slot_0_9_0.rage.anims.move_jitter:get()
	local var_117_3 = globals.tickcount

	if var_117_1 == 1 then
		if var_117_2 > 1 then
			var_117_0.m_flPoseParameter[0] = globals.tickcount % 4 >= 2 and 86 or 50 / (globals.tickcount % 8 >= 4 and 200 or 400)
		end
	else
		local var_117_4 = globals.tickcount % 8
		local var_117_5 = globals.tickcount % 4
		local var_117_6 = 1 / (var_117_4 >= 4 and 200 or 400)
		local var_117_7 = var_117_5 >= 2 and slot_0_9_0.rage.anims.move_legs1:get() or slot_0_9_0.rage.anims.move_legs2:get()

		var_117_0.m_flPoseParameter[0] = var_117_7 * var_117_6
	end
end

function slot_0_10_0.handle_legs(arg_118_0)
	if not slot_0_9_0.rage.anims:get() then
		slot_0_23_0.refs.legs:override()

		return
	end

	local var_118_0 = slot_0_9_0.rage.anims.move_jitter_mode:get()
	local var_118_1 = slot_0_9_0.rage.anims.move_jitter:get()
	local var_118_2 = globals.commandack

	if var_118_1 > 5 and var_118_0 == 1 then
		slot_0_23_0.refs.legs:override(var_118_2 % 3 == 0 and "Default" or "Sliding")
	elseif slot_0_9_0.rage.anims.move_legs1:get() > 1 or slot_0_9_0.rage.anims.move_legs2:get() > 1 then
		slot_0_23_0.refs.legs:override("Sliding")
	else
		slot_0_23_0.refs.legs:override()
	end
end

slot_0_11_0.register("post_update_clientside_animation", "animbreaker.handle", slot_0_10_0.handle)
slot_0_11_0.register("createmove", "animbreaker.handle_legs", slot_0_10_0.handle_legs)
slot_0_11_0.register("post_update_clientside_animation", "animbreaker.handle_pre_render", slot_0_10_0.handle_pre_render)

gs_settings = slot_0_9_0.visuals.gs_inds:create()
slot_0_73_0 = {}
slot_0_74_0 = {}
slot_0_75_0 = render.screen_size()
slot_0_76_0 = {
	on_plant_time = 0,
	planting = false,
	planting_site = "",
	fill = 0
}
slot_0_77_0 = {
	ping = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
	da = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
	dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
	body = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
	safe = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
	hs = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
	fd = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	fs = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding")
}
slot_0_78_0 = gs_settings:listable("", {
	"Double Tap",
	"Hide Shots",
	"Damage",
	"Hitchance",
	"Fake Duck",
	"Body Aim",
	"Safe Points",
	"Dormant Aimbot",
	"Freestanding",
	"PING",
	"Bomb Info"
})
slot_0_79_0 = gs_settings:switch("Enable Spectator List", false)
slot_0_73_0.font = render.load_font("Calibri Bold", vector(25, 23.5, 0), "da")
slot_0_80_0 = render.load_image("\x89PNG\r\n\x1A\n\x00\x00\x00\rIHDR\x00\x00\x00d\x00\x00\x00\\\b\x03\x00\x00\x00\xAF\x15\xE0\xA6\x00\x00\x00\x01sRGB\x01\xD9\xC9,\x7F\x00\x00\x00\tpHYs\x00\x00\v\x13\x00\x00\v\x13\x01\x00\x9A\x9C\x18\x00\x00\x02\xDFPLTE\x00\x00\x00\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFF\xFFv\x99it\x00\x00\x00\xF5tRNS\x00\x01C\x93X\x06Z\xFB\xFF\xFD\x96\x04\xD5\xF9\x02\x0E\xE3\x18\x16\xEA+\x1B\xEF6)sr\x1E\xF2?uk \xEB\xF42!\xF6G/\xE7\xE27^\xB7\x0F#\xF8Q\b\xB3\x9A}\xF7c\x00pz\xC1%n-\xE0b\xFC\xC2(v\xAE\x88\v\xC9]~\xFA\xE9'\\\xDF\x121\x84،ϗ:\x8A\x03\xAC\xDA\x1Cl.B\x8F{\xA1K\x95\x10\xCA\x13U=\x1A3\nNi\x82\xBBAǀ\x87\x91\x9E\xA6\xAA\x86\x7F_&\xDC\xFEI\xE8\x17\xC3F\x89\x92\xBA,\xC0\xB8\xA3\x9F\xA8\xAF\xB1\xB5\xBC\xD4|\xF3\x9D$\r\x8E[\x05\xD9љ\xF1\xCC˛O\x14\xCE\xC5\xCD\x190\xF5\a\xDE\x15\xA4\x1D\x11\xE5\x83*\xA0q\xD6\xD0ƹ\xA9mR5\xDD\f\xE4d\xED\xBFčw\x85\x8B\x90\xEE\xE6\xA5x\xEC\t`\x1F\x81\xAB\x9C\x988aJ\xB24Lۧ\xD2E9S\xB0\xF0\xBD\x94M\xB4DT>\xA2\"Yj\xE1׭@H;\xBEet4r\x01\xD4\x00\x00\anIDATx\x9C\xED\x9A\xF9[\xD4F\x18ǳ\"2+\x8B\x8AX\xD0B\xE5\x10T(B\x11p\x11\x11\x10\x95\"(V,\x88\x14\x05\xE4\xB4\x1C\xC5 `E\xBCQ\x01\xA1\x88\x88\xA2\xA2xq\x15\x15\v\x88x\v\x15T\x14\xCF\nx\xB6\xB5\xD5Z\xDB\xDA\xEB\x0Fhf&\xBB\x9B\x84\xDD%\x86\xA5\xCF\xD3>\xBE\xBFd\xE7\x9B\xF7}?9f\x92w&K\x10\x02L4@k\xA0\xB6\x90\xC07\xB1A:@<\xB8\x9F\x19\xBA\x12\x00\x80ސ\xFE\x85\f\x1DFA\x80~\xFFB\x86\x1B@Ȉ\xFE\x85\xBCc\b!F\x9AK8rԻ=\x0E\xD9\xD8\x04B\xDE㨢\x91\xA3M\xCD\x041\xF4\xCD\x01\xB0\x18\xC3\x11-\xAD d,G\x1D7\x1E\x00k\x1B!\x90\xF7a:\xDB\tl\xD1\xCE\x1E\xAA\x1F\xB0E\x87\x89Pt\x14\x02\xB1\x13\xC3P'\x8E\xE8\f\xC5I,M\xEA\xA2\x03\xC5\xC9B \x84+\f\x15\xB3o\xCB\x14=(\xBA\xB1\xB4\xA9\xE3\xA1\xE6n&\b\xE2\xE1\t\x83\xA7905/\xA4MgJ\xBA3\xA0\x04f\nb\x10\xDE\x1F\xA2h\x1F\xA66\x02I\xB3\x18\x8A\xD4\xC3\x17J~\xB3\x85A\x889(\xA3\xFF\\\x86\xF4\x11\x92\xE61\x14\xCB\x00$\xCD\x17\xFC\xA8\xF9\x18\xC5\a2⃐\xB2@!\x04/DJ\xC8'B\x19D(\xBA\x03\x16\x8B\x14\xCAb\x942L!\x8CE\x02\b\x17̐ݕ\b\x85\xB2\x04\t\x91\xF2v\x14\xF6\x88\x8E\x11\x0E!\xC6\xC4B\x8BS\bK\x91\xF0\xA9\xBC\x1D\x9F\x90\xE8\x96\xE4\xF8Yr\x1F\x18o\xED\x7FcR\xE3P\xDBe\x83D\xB2f\x82\xA9\x9B\x13I\x92)\xCB#\xB1\x05\xA6\xA6\xA5\xF3\xB4\x88@\x18\xA0\xB5\xE2s\x97\x95\x19l\x86\xFEtw\xAAW\xDB{\xE1\x96\x03i\x0F4a\xAB\x18}|Ȕ\xF9\xAB2\x91\xBA\x1A\vnb\x8D0\xA8'\xB5\xB7\x8Ca\xB6`\r\xAD\x19\xAC\xC5\xCA:\r1\x80\xF3z\x9C\xD0{\x83\xBFL\xB2ZBc\xFD\xD5\x05\xBE\x91\x85\xA2|\x1B\xCD\xE5B\xD6&ٹ\x19\xF0\xCB\x10\xB0yKv\x8E\xC2\"\xB2\xD3r\xD3\x17n͛\x98\xBF%\xEB\x8B\x02\xEC\xB2\r\xE5\x93Gx\x92Q\xF2\x9BT\xC8\aa\xA1\xF6m\x14\x8B\x9DR\x98\x10\xCF\xEDE\f\x0F^}\xCBz\a\x0FH1\x03\xE2\xB7s\x17ӃW\xE7*٥4;\x1B\xA2%\x87\x18jq\ne>\f \x11)\xC9ͅ\x04\xA2\x06\xF5\x8A\xCB2\xD2\xE5x\xF0\x82\xECVǐA\xF6\xA0\xC6\xDE\xD2\xD5\\\x04O\xC8>>\x90\xFD\xA8Qv@\x89\a/\xC8A>\x90\xED\xAA=xA\x0E\xF1\x81\xA4\xF6\x11\x12\r=c\xE2\x0E\x1F\x11\x89\xCA+f\x0E%*\xC3K\x8D\xE35\r)\x80\x9E\xB9\x85:U\xD5\xC3\xFD\x80\xD5rbR\xA6x\x8DbBACr\xFA\b\x91H)\xCF/\x010\xA99z\f\x96uǩ\x9F\xB5\\ȉ\xBEB\xE08\xB1\xFC*+\xD6Adc\x10\xB8\x96\x98\xBD\xA0\xC4g\x82\xA6!uj\x8B\\\rA\x02\x82\xFF\x05H\x88\xDAE\x0E\x1A\x82\v\xD9\xF1êJ\n\xEA\xF75\xB8\x9E\x9C\x91޸gީ\xA6\xD3KE\xFC g\x1Cx@\xB2U\x1C\xB4\xA1\x1B?\x88\xFBY\x1E\x904UWf\x95J\x889\xAAy\xF6\xE2ƹ(\x1E\x90tU\x10\x13U\x90\xCC\xF3(D\x82[\x17\xD4.\xA4\xF4\x06\x89V\x05\xB98\x81\t\x11_\xCAkn\x19Ͱ\x96\xC9\xDBf\x91I_\xA7l\xB8\xDCܺі\x03\x11[\xB4]q/\x91H\x0E\xBB\xE6_m\xBDf\xDA\x14\xA3\x02\xD2nD\\/R@xY#\x82\x1C\xF5V\xD2ݕ\a\xB4JE\xE17\x04A\x94\x9A\xCC\xC5j󬸎ʨQ\xA8QeF\x94_\x18ˀ\x18\xEE'o\xE6\x9APݬ\x99$\xB3\x9D\xA9n\xB15)\xE9\x96\x0E5J\xC3H\xF2\xB6/_H\xBD\x11~\x8D\xD7\xC0\x86\xAF\x87\x94\xB8\x03\xEE2 \xF7\xE0>\x12\x802\xB8\r\x03zA\xD4F\xBA\x05\xB4u\xC0\xF6I\xEC\x93\xDB\x1B\xA4t(nI\xBF\x81\xAD\xFB\xC1Dg;XĀ\xA0ŭ.\x00:\xF1\xD6\x1Fս\x81\xA0\x1B=\t\"\xB1σ^ z\xB0\xA0\xDCq\xF9\xA1D\xD2N\xB5*:\b\xDD\x13xiN\x06\x81gE<\x02\x00M>\x1F\xD3\xD5\xCBm\xB0\xAA\x12n\xB5\xF8A\xF2\xA8\x1F\xDA\xF7鄙\xCDT\x1Eg6\xE4\x11tm\x02\xE0\t\xDC.\xA1\xEB\xB0[tї\x8D}\xD2z\x81\xC0K~O\xD6\x05\xFCk\b\"\x15\xB0!\xA7j)s\x02 \xDCL\xBF\xBA\xA6\x11T\x94\r\xAF^Zt\b\x98\aA\x9D\x9E\x18\\\xED\x05r\x9A\xBA\x1B\r2\xC8dj\x86\xE1*\x91H쨽y\x12\x13\x15\x1D\xB6\xA7\xE1\a\xE4\x01eo\x05\xB4\x7F\x1C5;\xAA\xA3}\xCD\xD9ϩ\xC1\xBC!\xF8Q߰\xDCX\x05\x04\xCE_\x02iߧ\xEC\xFD7\x91\xA8S%\t\xF8\x96\xDAzvKJ,\xA0` \xA9k\xA36\xCE%\x92\xEE\n:\x10\xD7]V\xA0ݭGy\x8E\xF6\xC3\x05\xB2\x8Cv\xEC\xDB\x10K\x1B\xEC\xD5F\xB1\xDF!\xB19FZi3\r\x00ǳ\xC4\xF5\xE4n\x00\xBE\xAF\x15\xE9\x06\xED\x05\xBE\xE7\xE3\x89\x1D\xCF\xDAp ^\x7F\x84\x87\xF0\xC3]e\x90h\xD8%\xCB\x1FZ\xB1N\x1F\xDE\xF8\x83\xF4o8\xF8\x88\xD5\x00\xA0:(\x14\xF8\xA1Zt\x06\xB0F\xC3+\x15\xFB\xE0\x15\x1D<\xA9\n\xEB\xE8\t\x11\xFF\b\x7F\xCE\x1D\xF0<6\x96\x05\x91\xCAz\xD7c\xB8?\x19\x80\xA9p\xFB\x02\x04\xA0\x9Az?=N\xE8ۆצ\x86\xE1FHS0\x17\x02\xCEX\xD2M\x11\xFBLd\x90\xC5p_\x17=^d\x831\x82\x1E\xF9?a\x9F\x15(A\xB7,<\xFD\xA5\x94\x03\x01u\x03\xF1\x1B\xD6L9\xA4\v\xEE\xF3\x01\xE0g\xB8}\x05\xAE\xA0\xD5\xC2<p\f\xF5Dz\x14\x87\xA3\x04\x97\xE5\xF3ê\x04.\x04\x00\xFB\x89\xC5$\x19\xF6\vPj\x05\x17)+\x01\xE0׭\xD99\xE9ԭ\v\x89\xC8y\x90o\b|/A\xDD\x10\xFB\xBC\xC2\t-\x9Fʺ\x1B(\x9E˅\xF4\xD5<\x9F\xD0\x19w%\x94f\xD2Z>=\r\xB4\xD6\x14d\x8D\x97\xFC\xEAT'\xD6\xD1SQzy\xEFt\xB7\xFAX\xDE\xD6\xC8,e\x8F\\\xC3\a/\xFB@0սO\xB9\xC5\x15\x15\x15\x85\x06~U\xBFٱF\x06aֲϰ0W>k\x1E\x11\xDB\x17kJ~\xFD\xFAŦ\x91Jf\x8Aڝq\xF1=շ\xF6_1o\x17\x92$\x9D|\x18\x8B\xFD/Ih\xBF+\x84?\xA0\v9]mU\xAE\xDE\x12\xD1w$\xF13\x85\xF2\x02\xF5\xDD\xF9\n\xE19\xEEͦ\xC2!\xA5(\xC1no\x85b\x83\x94\x14\x85\xA0\xBD\f)\xD1jg1\xEAl\x10\x8A\xF7e~\xBA,GR\x12C\xE9D\xAF*O7n0O\xBB\x8E\x0Fґ\xB9\x16\xD5\xF3sӐ\xE3H\xAAW\xB6x\xC3\xC3n\xA0;r\xC1\x92\xA9y\xA1\xA7_\vS\x8A\xA9G\x14\x0Fa\x90?Q\xF0$)S\xCB@e\xBC\v\xCB\xEF9\x02\xAF\x13\xF4W\x80\xB5\xE8Dl\xD9k\x05Eh\xDD2\x91\xA5iG@;K\bd%\f=W\xCB\x16\xF1\xB7_Υ\xE9@\xAF\x8C@!\x902\x189\x87#v\xA0\xF2n'G\xFD\x8B\xBA`:\xA1B \xBA\x91V\x86N܅\x95\x1A4\xF1\xE6|`&\x1C\xFE\x0E(\xBD\xA7\xB9\xBFg\x1CA%\xE3z\x8D\xE5Sj\xD5~\x10\xA2\xC1\x7F\x16(3\xFCG\f\xCB\xDE\x1D\xFBb\xBAp\x96\xE1\xABv\xD1[\x03VLA\xA6\xF53\x83\x88iM\xBF\x93ѻ\x9B\xDC\xFE\x01Q\x900+D^\xBAl\x00\x00\x00\x00IEND\xAEB`\x82", vector(30, 25))

function slot_0_81_0(arg_119_0, arg_119_1, arg_119_2, arg_119_3, arg_119_4, arg_119_5, arg_119_6)
	local var_119_0 = (arg_119_3 - arg_119_0) * arg_119_6 + arg_119_0
	local var_119_1 = (arg_119_4 - arg_119_1) * arg_119_6 + arg_119_1
	local var_119_2 = (arg_119_5 - arg_119_2) * arg_119_6 + arg_119_2

	return var_119_0, var_119_1, var_119_2
end

function slot_0_82_0(arg_120_0)
	local var_120_0 = 0
	local var_120_1 = 0
	local var_120_2 = 0
	local var_120_3 = 0
	local var_120_4 = {
		utils.net_channel(),
		(utils.net_channel())
	}

	if arg_120_0 ~= nil and arg_120_0:is_alive() then
		var_120_4[1] = utils.net_channel()
		var_120_4[2] = var_120_4[1]

		if var_120_4[1] then
			local var_120_5 = var_120_4[1].sequence_nr[0]
			local var_120_6 = (var_120_4[2].sequence_nr[1] + var_120_5) / math.min(math.max(0.1, 0.001), 0.2)

			return math.clamp(-1.7014636e+38, math.min(math.max(var_120_6, 0), 1), var_120_6)
		end
	end
end

function slot_0_73_0.indicator(arg_121_0, arg_121_1, arg_121_2, arg_121_3, arg_121_4, arg_121_5)
	slot_121_6_0 = render.screen_size().x / 100 + 2
	slot_121_7_0 = render.screen_size().y / 1.47
	slot_121_8_0 = render.measure_text(slot_0_73_0.font, bad, arg_121_0)
	arg_121_1 = arg_121_1 + 1

	if arg_121_5 then
		render.gradient(vector(slot_121_6_0 - 17, slot_121_7_0 + arg_121_1), vector(slot_121_6_0 + (slot_121_8_0.x + arg_121_5.width + 8) / 2, slot_121_7_0 + arg_121_1 + slot_121_8_0.y + 8), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55))
		render.gradient(vector(slot_121_6_0 + (slot_121_8_0.x + arg_121_5.width + 6) / 2, slot_121_7_0 + arg_121_1), vector(slot_121_6_0 + slot_121_8_0.x + arg_121_5.width + 17 + 8, slot_121_7_0 + arg_121_1 + slot_121_8_0.y + 8), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0))
		render.texture(arg_121_5, vector(slot_121_6_0 + 1, slot_121_7_0 + arg_121_1 + 3), color(0, 0, 0, 200))
		render.texture(arg_121_5, vector(slot_121_6_0, slot_121_7_0 + arg_121_1 + 2), arg_121_2)
		render.text(slot_0_73_0.font, vector(slot_121_6_0 + arg_121_5.width + 8, slot_121_7_0 + 5 + arg_121_1), arg_121_2, "bad", arg_121_0)
	else
		render.gradient(vector(slot_121_6_0 - 17, slot_121_7_0 + arg_121_1), vector(slot_121_6_0 + slot_121_8_0.x / 2, slot_121_7_0 + arg_121_1 + slot_121_8_0.y + 8), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55))
		render.gradient(vector(slot_121_6_0 + slot_121_8_0.x / 2, slot_121_7_0 + arg_121_1), vector(slot_121_6_0 + slot_121_8_0.x + 17, slot_121_7_0 + arg_121_1 + slot_121_8_0.y + 8), color(0, 0, 0, 55), color(0, 0, 0, 0), color(0, 0, 0, 55), color(0, 0, 0, 0))
		render.text(slot_0_73_0.font, vector(slot_121_6_0, slot_121_7_0 + 5 + arg_121_1), arg_121_2, "bad", arg_121_0)
	end

	if arg_121_3 and arg_121_4 then
		if arg_121_5 then
			slot_121_9_0 = slot_121_7_0 + arg_121_1 + slot_121_8_0.y * 0.6

			render.circle_outline(vector(slot_121_6_0 + slot_121_8_0.x + arg_121_5.width + 18, slot_121_9_0), color(0, 0, 0, 255), 9.5, 90, 1, 4)
			render.circle_outline(vector(slot_121_6_0 + slot_121_8_0.x + arg_121_5.width + 18, slot_121_9_0), arg_121_3, 9, 90, arg_121_4, 3)
		else
			render.circle_outline(vector(slot_121_6_0 + slot_121_8_0.x + 18, slot_121_7_0 + arg_121_1 + slot_121_8_0.y / 2 + 2), color(0, 0, 0, 255), 10.5, 90, 1, 4)
			render.circle_outline(vector(slot_121_6_0 + slot_121_8_0.x + 18, slot_121_7_0 + arg_121_1 + slot_121_8_0.y / 2 + 2), arg_121_3, 10, 90, arg_121_4, 3)
		end
	end
end

function slot_0_73_0.get_bind_state(arg_122_0)
	local var_122_0 = false
	local var_122_1 = 0
	local var_122_2 = ui.get_binds()

	for iter_122_0 = 1, #var_122_2 do
		if var_122_2[iter_122_0].name == arg_122_0 and var_122_2[iter_122_0].active then
			var_122_0 = true
			var_122_1 = var_122_2[iter_122_0].value
		end
	end

	return {
		var_122_0,
		var_122_1
	}
end

function slot_0_73_0.spectators_get()
	local var_123_0 = {}
	local var_123_1 = entity.get_local_player()
	local var_123_2

	if var_123_1 ~= nil then
		if var_123_1.m_hObserverTarget then
			var_123_2 = var_123_1.m_hObserverTarget
		else
			var_123_2 = var_123_1
		end

		local var_123_3 = entity.get_players(false, false)

		if var_123_3 ~= nil then
			for iter_123_0, iter_123_1 in pairs(var_123_3) do
				local var_123_4 = iter_123_1.m_hObserverTarget

				if var_123_4 and var_123_4 == var_123_2 then
					table.insert(var_123_0, iter_123_1)
				end
			end
		end
	end

	return var_123_0
end

function slot_0_73_0.handle()
	if not slot_0_9_0.visuals.gs_inds:get() then
		return
	end

	slot_124_0_0 = entity.get_local_player()

	if slot_124_0_0 == nil or slot_124_0_0:is_alive() == false then
		return
	end

	slot_124_1_0 = entity.get_entities("CPlantedC4", true)[1]
	slot_124_2_0 = ""
	slot_124_3_0 = 0
	slot_124_4_0 = false
	slot_124_5_0 = 0
	slot_124_6_0 = 0
	slot_124_7_0 = false

	if slot_124_1_0 ~= nil then
		slot_124_3_0 = slot_124_1_0.m_flC4Blow - globals.curtime
		slot_124_4_0 = slot_124_1_0.m_bBombDefused

		if slot_124_3_0 > 0 and not slot_124_4_0 then
			slot_124_8_1 = slot_124_1_0.m_hBombDefuser ~= 4294967295
			slot_124_9_1 = slot_124_1_0.m_flDefuseLength
			slot_124_10_1 = slot_124_8_1 and slot_124_1_0.m_flDefuseCountDown - globals.curtime or -1

			if slot_124_10_1 > 0 then
				slot_124_11_2 = slot_124_10_1 < slot_124_3_0 and color(58, 191, 54, 160) or color(252, 18, 19, 125)
				slot_124_12_3 = (slot_0_75_0.y - 50) / slot_124_9_1 * slot_124_10_1

				render.rect(vector(0, 0), vector(16, slot_0_75_0.y), color(25, 25, 25, 160))
				render.rect_outline(vector(0, 0), vector(16, slot_0_75_0.y), color(25, 25, 25, 160))
				render.rect(vector(0, slot_0_75_0.y - slot_124_12_3), vector(16, slot_0_75_0.y), slot_124_11_2)
			end

			slot_124_2_0 = slot_124_1_0.m_nBombSite == 0 and "A" or "B"
			slot_124_11_1 = slot_124_0_0.m_iHealth
			slot_124_12_2 = slot_124_0_0.m_ArmorValue
			slot_124_13_1 = slot_124_1_0.m_vecOrigin
			slot_124_14_1 = slot_124_0_0.m_vecOrigin
			slot_124_15_1 = slot_124_13_1:dist(slot_124_14_1)
			slot_124_16_1 = 450.7
			slot_124_17_1 = 75.68
			slot_124_18_1 = 789.2
			slot_124_19_1 = (slot_124_15_1 - slot_124_17_1) / slot_124_18_1
			slot_124_5_0 = slot_124_16_1 * math.exp(-slot_124_19_1 * slot_124_19_1)

			if slot_124_12_2 > 0 then
				slot_124_20_1 = slot_124_5_0 * 0.5
				slot_124_21_1 = (slot_124_5_0 - slot_124_20_1) * 0.5

				if slot_124_12_2 < slot_124_21_1 then
					slot_124_12_1 = slot_124_12_2 * 2
					slot_124_20_1 = slot_124_5_0 - slot_124_21_1
				end

				slot_124_5_0 = slot_124_20_1
			end

			slot_124_6_0 = math.ceil(slot_124_5_0)
			slot_124_7_0 = slot_124_11_1 <= slot_124_6_0 and true or false
		end
	end

	if slot_0_76_0.planting then
		slot_0_76_0.fill = 3.125 - (3.125 + slot_0_76_0.on_plant_time - globals.curtime)

		if slot_0_76_0.fill > 3.125 then
			slot_0_76_0.fill = 3.125
		end
	end

	slot_124_8_0 = 44
	slot_124_9_0 = 0
	slot_124_10_0 = slot_124_0_0:get_resource().m_iPing
	slot_124_11_0 = slot_0_9_0.misc.fake_latency_toggle.fake_latency_slider:get()
	slot_124_12_0 = slot_0_77_0.ping:get()
	slot_124_13_0 = math.max(slot_124_12_0, slot_124_11_0) / 2
	slot_124_14_0 = math.min(1, slot_124_10_0 / slot_124_13_0)
	slot_124_15_0 = {
		255,
		0,
		0
	}
	slot_124_16_0 = {
		150,
		189,
		18
	}
	slot_124_17_0, slot_124_18_0, slot_124_19_0 = color(255, 255, 255):to_hsv()
	slot_124_20_0, slot_124_21_0, slot_124_22_0 = color(151, 175, 54):to_hsv()
	slot_124_23_0 = color()
	slot_124_24_1, slot_124_25_0, slot_124_26_0 = slot_0_81_0(slot_124_17_0, slot_124_18_0, slot_124_19_0, slot_124_20_0, slot_124_21_0, slot_124_22_0, slot_0_82_0(slot_124_0_0))

	slot_124_23_0:as_hsv(slot_124_24_1, slot_124_25_0, slot_124_26_0, 255)

	slot_124_24_0 = {
		{
			"PING",
			slot_0_78_0:get("PING") and (slot_0_77_0.ping:get() > 0 or slot_124_11_0 > 0) and slot_124_0_0:is_alive(),
			slot_124_23_0
		},
		{
			"DT",
			slot_0_78_0:get("Double Tap") and not slot_0_77_0.hs:get() and slot_0_77_0.dt:get(),
			rage.exploit:get() == 1 and color(255, 200) or color(255, 0, 53, 255)
		},
		{
			"OSAA",
			slot_0_78_0:get("Hide Shots") and slot_0_77_0.hs:get(),
			color(200, 255)
		},
		{
			"DA",
			slot_0_78_0:get("Dormant Aimbot") and slot_0_77_0.da:get(),
			color(255, 200)
		},
		{
			"DUCK",
			slot_0_78_0:get("Fake Duck") and slot_0_77_0.fd:get(),
			color(255, 200)
		},
		{
			"BODY",
			slot_0_78_0:get("Body Aim") and slot_0_77_0.body:get() == "Force",
			color(255, 200)
		},
		{
			"SAFE",
			slot_0_78_0:get("Safe Points") and slot_0_77_0.safe:get() == "Force",
			color(255, 200)
		},
		{
			slot_124_2_0 .. " - " .. string.format("%.1f", slot_124_3_0) .. "s",
			slot_0_78_0:get("Bomb Info") and slot_124_3_0 > 0 and not slot_124_4_0,
			color(255, 200),
			[6] = slot_0_80_0
		},
		{
			"FATAL",
			slot_0_78_0:get("Bomb Info") and slot_124_0_0:is_alive() and slot_124_7_0,
			(color(255, 0, 0, 255))
		},
		{
			"-" .. slot_124_6_0 .. " HP",
			slot_0_78_0:get("Bomb Info") and slot_124_0_0:is_alive() and not slot_124_7_0 and slot_124_5_0 > 0.5,
			(color(210, 216, 112, 255))
		},
		{
			slot_0_76_0.planting_site .. " ",
			slot_0_78_0:get("Bomb Info") and slot_0_76_0.planting,
			color(210, 216, 112, 255),
			color(255, 255),
			slot_0_76_0.fill / 3.3,
			slot_0_80_0
		},
		{
			"FS",
			slot_0_78_0:get("Freestanding") and (slot_0_77_0.fs:get() or slot_0_9_0.rage.freestanding_bind:get()),
			color(255, 200)
		},
		{
			"H1TCHANCE",
			slot_0_78_0:get("Hitchance") and slot_0_73_0.get_bind_state("Hit Chance")[1],
			color(255, 255)
		},
		{
			"MD",
			slot_0_78_0:get("Damage") and slot_0_73_0.get_bind_state("Min. Damage")[1],
			color(255, 200)
		}
	}

	for iter_124_0, iter_124_1 in pairs(slot_124_24_0) do
		if iter_124_1[2] then
			slot_0_73_0.indicator(iter_124_1[1], slot_124_9_0, iter_124_1[3], iter_124_1[4], iter_124_1[5], iter_124_1[6])

			slot_124_9_0 = slot_124_9_0 - slot_124_8_0
		end
	end
end

function slot_0_73_0.spectators()
	if not slot_0_79_0:get() or not slot_0_9_0.visuals.gs_inds:get() then
		return
	end

	local var_125_0 = 5
	local var_125_1 = slot_0_73_0.spectators_get()

	for iter_125_0, iter_125_1 in pairs(var_125_1) do
		local var_125_2 = iter_125_1:get_name()
		local var_125_3 = render.measure_text(1, nil, var_125_2).x

		render.text(1, vector(slot_0_75_0.x - var_125_3 - 2, 2 + var_125_0), color(255), nil, var_125_2)

		var_125_0 = var_125_0 + 17
	end
end

function slot_0_74_0.reset_bomb()
	slot_0_76_0.planting = false
	slot_0_76_0.fill = 0
	slot_0_76_0.on_plant_time = 0
	slot_0_76_0.planting_site = ""
end

function slot_0_74_0.bomb_beginplant(arg_127_0)
	local var_127_0 = entity.get_player_resource()

	if var_127_0 == nil then
		return
	end

	slot_0_76_0.on_plant_time = globals.curtime
	slot_0_76_0.planting = true

	local var_127_1 = var_127_0.m_bombsiteCenterA
	local var_127_2 = var_127_0.m_bombsiteCenterB
	local var_127_3 = entity.get(arg_127_0.userid, true):get_origin()
	local var_127_4 = var_127_3:dist(var_127_1)
	local var_127_5 = var_127_3:dist(var_127_2)

	slot_0_76_0.planting_site = var_127_4 < var_127_5 and "A" or "B"
end

slot_0_9_0.visuals.molotov_radius.molotov_color = slot_0_9_0.visuals.molotov_radius:create():color_picker("Circle Color", color(255, 183, 183))
slot_0_9_0.visuals.smokes_radius.smoks_color = slot_0_9_0.visuals.smokes_radius:create():color_picker("Circle Color", color(197, 199, 255))
slot_0_83_1 = nil
slot_0_83_0 = {}
slot_0_84_1 = 17.55
slot_0_85_1 = 125

function slot_0_83_0.distance_2d(arg_128_0, arg_128_1)
	return math.sqrt((arg_128_1.x - arg_128_0.x)^2 + (arg_128_1.y - arg_128_0.y)^2)
end

function slot_0_83_0.lerp_position(arg_129_0, arg_129_1, arg_129_2)
	return vector((arg_129_1.x - arg_129_0.x) * arg_129_2 + arg_129_0.x, (arg_129_1.y - arg_129_0.y) * arg_129_2 + arg_129_0.y, (arg_129_1.z - arg_129_0.z) * arg_129_2 + arg_129_0.z)
end

function slot_0_83_0.draw()
	if not entity.get_local_player() then
		return
	end

	if slot_0_9_0.visuals.molotov_radius:get() then
		local var_130_0 = entity.get_entities("CInferno")

		for iter_130_0 = 1, #var_130_0 do
			local var_130_1 = var_130_0[iter_130_0]
			local var_130_2 = var_130_1:get_origin()
			local var_130_3 = 40
			local var_130_4 = {}
			local var_130_5 = 0
			local var_130_6
			local var_130_7

			for iter_130_1 = 1, 64 do
				if var_130_1.m_bFireIsBurning[iter_130_1] == true then
					table.insert(var_130_4, vector(var_130_1.m_fireXDelta[iter_130_1], var_130_1.m_fireYDelta[iter_130_1], var_130_1.m_fireZDelta[iter_130_1]))
				end
			end

			for iter_130_2 = 1, #var_130_4 do
				for iter_130_3 = 1, #var_130_4 do
					local var_130_8 = slot_0_83_0.distance_2d(var_130_4[iter_130_2], var_130_4[iter_130_3])

					if var_130_5 < var_130_8 then
						var_130_5 = var_130_8
						var_130_6 = var_130_4[iter_130_2]
						var_130_7 = var_130_4[iter_130_3]
					end
				end
			end

			if var_130_6 and var_130_7 then
				local var_130_9 = var_130_2 + slot_0_83_0.lerp_position(var_130_6, var_130_7, 0.5)
				local var_130_10 = slot_0_9_0.visuals.molotov_radius.molotov_color:get()

				render.circle_3d_outline(var_130_9, color(var_130_10.r, var_130_10.g, var_130_10.b, 255), var_130_5 / 2 + var_130_3, 0, 1)
			end
		end
	end

	if slot_0_9_0.visuals.smokes_radius:get() then
		local var_130_11 = globals.tickcount
		local var_130_12 = globals.tickinterval
		local var_130_13 = entity.get_entities("CSmokeGrenadeProjectile")

		for iter_130_4 = 1, #var_130_13 do
			local var_130_14 = var_130_13[iter_130_4]

			if var_130_14:get_classname() == "CSmokeGrenadeProjectile" and var_130_14.m_bDidSmokeEffect == true then
				local var_130_15 = var_130_14.m_nSmokeEffectTickBegin

				if var_130_15 ~= nil then
					local var_130_16 = var_130_12 * (var_130_11 - var_130_15)

					if var_130_16 > 0 and slot_0_84_1 - var_130_16 > 0 then
						local var_130_17 = 1

						if grenade_timer then
							var_130_17 = 1 - var_130_16 / slot_0_84_1
						end

						local var_130_18 = slot_0_9_0.visuals.smokes_radius.smoks_color:get()
						local var_130_19 = var_130_18.r
						local var_130_20 = var_130_18.g
						local var_130_21 = var_130_18.b
						local var_130_22 = var_130_18.a
						local var_130_23 = slot_0_85_1

						if var_130_16 < 0.3 then
							var_130_23 = var_130_23 * 0.6 + var_130_23 * (var_130_16 / 0.3) * 0.4
							var_130_22 = var_130_22 * (var_130_16 / 0.3)
						end

						if slot_0_84_1 - var_130_16 < 1 then
							var_130_23 = var_130_23 * ((slot_0_84_1 - var_130_16) / 1 * 0.3 + 0.7)
						end

						render.circle_3d_outline(var_130_14:get_origin(), color(var_130_19, var_130_20, var_130_21, var_130_22 * math.min(1, var_130_17 * 1.3)), var_130_23, 0, 1)
					end
				end
			end
		end
	end
end

slot_0_84_0 = {
	lag_timer = 0,
	ground_timer = 0,
	in_air = function(arg_131_0, arg_131_1)
		if not arg_131_1 then
			return false
		end

		local var_131_0 = arg_131_1.m_fFlags

		if bit.band(var_131_0, 1) ~= 0 then
			if arg_131_0.ground_timer == 5 then
				return false
			end

			arg_131_0.ground_timer = arg_131_0.ground_timer + 1
		else
			arg_131_0.ground_timer = 0
		end

		return true
	end,
	is_moving = function(arg_132_0, arg_132_1)
		local var_132_0 = arg_132_1.m_vecVelocity

		return math.sqrt(var_132_0.x * var_132_0.x + var_132_0.y * var_132_0.y) > 2
	end,
	is_crouching = function(arg_133_0, arg_133_1)
		return arg_133_1.m_bDucked
	end,
	team_num = function(arg_134_0, arg_134_1)
		return arg_134_1.m_iTeamNum
	end,
	get_state = function(arg_135_0, arg_135_1)
		local var_135_0 = arg_135_0:is_moving(arg_135_1)
		local var_135_1 = arg_135_0:is_crouching(arg_135_1)
		local var_135_2 = arg_135_0:in_air(arg_135_1)

		if slot_0_9_0.rage.manual:get() ~= "At Target" then
			return "Manual"
		end

		if var_135_2 then
			return var_135_1 and "Air Crouch" or "Air"
		end

		if slot_0_23_0.refs.slow:get() then
			return "Slowmotion"
		end

		if var_135_1 then
			return var_135_0 and "Crouch Moving" or "Crouch"
		end

		return var_135_0 and "Running" or "Standing"
	end
}
slot_0_85_0 = {
	manual_last_pressed = globals.realtime
}

function slot_0_86_0(arg_136_0, arg_136_1, arg_136_2, arg_136_3, arg_136_4, arg_136_5)
	return math.sqrt((arg_136_0 - arg_136_3) * (arg_136_0 - arg_136_3) + (arg_136_1 - arg_136_4) * (arg_136_1 - arg_136_4))
end

function slot_0_87_0(arg_137_0, arg_137_1, arg_137_2, arg_137_3, arg_137_4)
	local var_137_0 = arg_137_0.m_vecVelocity
	local var_137_1 = arg_137_2 + globals.tickinterval * var_137_0.x * arg_137_1
	local var_137_2 = arg_137_3 + globals.tickinterval * var_137_0.y * arg_137_1
	local var_137_3 = arg_137_4 + globals.tickinterval * var_137_0.z * arg_137_1

	return var_137_1, var_137_2, var_137_3
end

function reset_current_state()
	local var_138_0 = slot_0_9_0.rage.team_list:get()
	local var_138_1 = var_138_0 == "T" and "" or "_ct"
	local var_138_2 = slot_0_9_0.rage.aa_lister:get()
	local var_138_3 = {
		"yaw_mode",
		"yaw_left",
		"yaw_right",
		"Jitter",
		"yaw_jitter_ovr",
		"body_yaw",
		"fake_left",
		"fake_right",
		"fake_options",
		"body_speed"
	}
	local var_138_4 = {
		fake_options = "Jitter",
		yaw_mode = "L - R",
		body_speed = 2,
		fake_right = 60,
		fake_left = 60,
		yaw_right = 0,
		yaw_left = 0,
		yaw_jitter_ovr = 0,
		Jitter = "Disabled",
		body_yaw = true
	}
	local var_138_5 = slot_0_9_0.rage.state_list:get()
	local var_138_6

	if var_138_2 == 2 then
		var_138_6 = slot_0_9_0.rage.builder_elements[var_138_5]
	elseif var_138_2 == 3 then
		var_138_6 = slot_0_9_0.rage.defensive_elements[var_138_5]
	else
		slot_0_12_0.push("Error: Please select Anti-Aim or Defensive tab")

		return
	end

	if not var_138_6 then
		slot_0_12_0.push("Error: No settings found for the selected state")

		return
	end

	for iter_138_0, iter_138_1 in ipairs(var_138_3) do
		local var_138_7 = var_138_6[iter_138_1 .. var_138_1]

		if var_138_7 and var_138_7.set and var_138_4[iter_138_1] then
			var_138_7:set(var_138_4[iter_138_1])
		end
	end

	local var_138_8 = var_138_2 == 2 and "Anti-Aim" or "Defensive"

	slot_0_12_0.push(var_138_8 .. " settings reset to default values for " .. (var_138_0 == "T" and "T-side" or "CT-side"))
end

function send_to_opposite_team()
	local var_139_0 = slot_0_9_0.rage.state_list:get()
	local var_139_1 = slot_0_9_0.rage.team_list:get()
	local var_139_2 = slot_0_9_0.rage.aa_lister:get()
	local var_139_3 = var_139_1 == "T"
	local var_139_4 = var_139_1 == "CT"

	if not var_139_0 then
		slot_0_12_0.push("Error: No state selected.")

		return
	end

	local var_139_5

	if var_139_2 == 2 then
		var_139_5 = slot_0_9_0.rage.builder_elements[var_139_0]
	elseif var_139_2 == 3 then
		var_139_5 = slot_0_9_0.rage.defensive_elements[var_139_0]
	else
		slot_0_12_0.push("Error: Please select Anti-Aim or Defensive tab")

		return
	end

	if not var_139_5 then
		slot_0_12_0.push("Error: No settings found for the selected state: " .. var_139_0)

		return
	end

	local var_139_6 = {
		"yaw_mode",
		"yaw",
		"yaw_randomize",
		"yaw_center",
		"yaw_left",
		"yaw_right",
		"Jitter",
		"yaw_jitter_ovr",
		"jitter_randomize",
		"body_yaw",
		"body_speed",
		"random_speed",
		"fake_left",
		"fake_left_random",
		"fake_right",
		"fake_right_random",
		"fake_options",
		"antibrute",
		"anti_timeout",
		"antibrute_method",
		"ran_speed_1",
		"ran_speed_2",
		"speed_options",
		"center_options",
		"custom_speed_amount",
		"random_speed_method",
		"custom_amount",
		"amnesia_tick_speed",
		"yaw_random_methods",
		"r_min",
		"r_max",
		"scale",
		"frequency",
		"amplitude"
	}

	for iter_139_0 = 1, 22 do
		table.insert(var_139_6, "custom_slider_" .. iter_139_0)
		table.insert(var_139_6, "custom_speed_slider_" .. iter_139_0)
	end

	local var_139_7 = var_139_4 and "_ct" or ""
	local var_139_8 = var_139_3 and "_ct" or ""

	if var_139_7 == var_139_8 then
		slot_0_12_0.push("Error: Source and target teams are the same.")

		return
	end

	local var_139_9 = 0
	local var_139_10 = 0

	for iter_139_1, iter_139_2 in ipairs(var_139_6) do
		local var_139_11 = iter_139_2 .. var_139_7
		local var_139_12 = iter_139_2 .. var_139_8
		local var_139_13 = var_139_5[var_139_11]
		local var_139_14 = var_139_5[var_139_12]

		if var_139_13 and var_139_14 and var_139_13.get and var_139_14.set then
			var_139_10 = var_139_10 + 1

			if pcall(function()
				local var_140_0 = var_139_13:get()

				var_139_14:set(var_140_0)
			end) then
				var_139_9 = var_139_9 + 1
			end
		end
	end

	local var_139_15 = var_139_4 and "CT-side" or "T-side"
	local var_139_16 = var_139_3 and "CT-side" or "T-side"
	local var_139_17 = var_139_2 == 2 and "Anti-Aim" or "Defensive"

	slot_0_12_0.push("Transferred " .. var_139_9 .. "/" .. var_139_10 .. " " .. var_139_17 .. " settings from " .. var_139_15 .. " to " .. var_139_16 .. " for state: " .. var_139_0)
end

function slot_0_14_0.handle(arg_141_0)
	if not slot_0_9_0.misc.fast_ladder:get() then
		return
	end

	if slot_0_23_0.shared_data.movetype ~= 9 then
		return
	end

	if math.abs(arg_141_0.forwardmove) < 50 then
		return
	end

	local var_141_0 = entity.get_local_player()

	if arg_141_0.sidemove == 0 then
		arg_141_0.view_angles.y = arg_141_0.view_angles.y + 45
	end

	if arg_141_0.in_forward and arg_141_0.sidemove < 0 then
		arg_141_0.view_angles.y = arg_141_0.view_angles.y + 90
	end

	if arg_141_0.in_back and arg_141_0.sidemove > 0 then
		arg_141_0.view_angles.y = arg_141_0.view_angles.y + 90
	end

	arg_141_0.in_moveleft = arg_141_0.in_back
	arg_141_0.in_moveright = arg_141_0.in_forward

	if arg_141_0.view_angles.x < 0 then
		arg_141_0.view_angles.x = -45
	end
end

slot_0_11_0.register("createmove", "fast_ladder", slot_0_14_0.handle)

slot_0_88_0 = false
slot_0_89_0 = false
slot_0_90_0 = 0
slot_0_91_0 = 0
slot_0_92_0 = 0
slot_0_93_0 = 0
slot_0_94_0 = 0
slot_0_95_0 = 0
slot_0_96_0 = 0
slot_0_97_0 = 0
slot_0_98_0 = 0
slot_0_99_0 = 0
slot_0_100_0 = 4

function slot_0_101_0(arg_142_0)
	for iter_142_0, iter_142_1 in ipairs(slot_0_28_0.conditions) do
		if arg_142_0 == iter_142_1 then
			return true
		end
	end

	return false
end

slot_0_102_0 = 0
slot_0_103_0 = false
slot_0_104_0 = nil

function check_weapon_swap()
	local var_143_0 = entity.get_local_player()

	if var_143_0 == nil or not var_143_0:is_alive() then
		return
	end

	local var_143_1 = var_143_0:get_player_weapon()

	if var_143_1 then
		local var_143_2 = var_143_1:get_weapon_index()

		if slot_0_104_0 == nil then
			slot_0_104_0 = var_143_2

			return
		end

		if var_143_2 ~= slot_0_104_0 then
			slot_0_104_0 = var_143_2

			return true
		end
	end
end

slot_0_105_0 = false

function check_reloading()
	local var_144_0 = entity.get_local_player()

	if var_144_0 == nil or not var_144_0:is_alive() then
		return
	end

	local var_144_1 = var_144_0:get_player_weapon()

	if var_144_1 then
		local var_144_2 = var_144_1:get_weapon_reload()

		if var_144_2 > 0 and var_144_2 < 1 then
			if not slot_0_105_0 then
				slot_0_105_0 = true

				return true
			end
		elseif slot_0_105_0 then
			slot_0_105_0 = false

			return false
		end
	else
		return false
	end
end

slot_0_106_0 = 0

function slot_0_23_0.calculate_yaw_5way(arg_145_0, arg_145_1, arg_145_2)
	local var_145_0

	if arg_145_0 % 7 < 1.4 then
		var_145_0 = utils.random_float(arg_145_1 / -2, arg_145_1 / -2 - arg_145_2)
	elseif arg_145_0 % 7 < 1.75 then
		var_145_0 = utils.random_float(arg_145_1 / -2.5, arg_145_1 / -2.5 - arg_145_2)
	elseif arg_145_0 % 7 < 2.3333333333333335 then
		var_145_0 = 0
	elseif arg_145_0 % 7 < 3.5 then
		var_145_0 = utils.random_float(arg_145_1 / 2.5, arg_145_1 / 2.5 - arg_145_2)
	elseif arg_145_0 % 7 < 7 then
		var_145_0 = utils.random_float(arg_145_1 / 2, arg_145_1 / 2 - arg_145_2)
	end

	return var_145_0
end

function slot_0_23_0.calculate_yaw_3way(arg_146_0, arg_146_1, arg_146_2)
	local var_146_0

	if arg_146_0 % 7 < 2.3333333333333335 then
		var_146_0 = utils.random_float(arg_146_1 / -2, arg_146_1 / -2 - arg_146_2)
	elseif arg_146_0 % 7 < 3.5 then
		var_146_0 = 0
	elseif arg_146_0 % 7 < 7 then
		var_146_0 = utils.random_float(arg_146_1 / 2, arg_146_1 / 2 - arg_146_2)
	end

	return var_146_0
end

slot_0_107_0 = {
	max_tickbase = 0,
	is_defensive = function()
		local var_147_0 = entity.get_local_player()

		if not var_147_0 or not var_147_0:is_alive() then
			return
		end

		local var_147_1 = var_147_0.m_nTickBase

		if math.abs(var_147_1 - slot_0_106_0) > 64 then
			slot_0_106_0 = 0
		end

		if var_147_1 > slot_0_106_0 then
			slot_0_106_0 = var_147_1
		elseif var_147_1 < slot_0_106_0 then
			return math.min(14, math.max(0, slot_0_106_0 - var_147_1 - 1)) > 1
		end

		return false
	end
}
slot_0_108_0 = 0
slot_0_109_0 = 0
slot_0_110_0 = 0
slot_0_111_0 = false
slot_0_112_0 = false
slot_0_113_0 = 180
slot_0_114_0 = 0
slot_0_115_0 = 0

function slot_0_116_0(arg_148_0)
	local var_148_0 = 2
	local var_148_1 = 2 * arg_148_0

	slot_0_109_0 = slot_0_109_0 + 1

	if slot_0_111_0 and var_148_0 <= slot_0_109_0 or not slot_0_111_0 and var_148_1 <= slot_0_109_0 then
		slot_0_111_0 = not slot_0_111_0
		slot_0_109_0 = 0
	end

	return slot_0_111_0, slot_0_111_0 and (slot_0_109_0 == 1 and slot_0_113_0 or slot_0_113_0) or 0
end

function slot_0_23_0.random_choke(arg_149_0, arg_149_1, arg_149_2)
	return arg_149_0 % arg_149_1[arg_149_2 and math.random(1, #arg_149_1) or (arg_149_0 - 1) % #arg_149_1 + 1] == 0
end

function slot_0_23_0.choke_aa(arg_150_0, arg_150_1)
	local var_150_0 = arg_150_0[arg_150_1 % #arg_150_0 + 1]

	arg_150_1 = arg_150_1 + 1

	return var_150_0
end

events.createmove:set(function(arg_151_0)
	jumping = arg_151_0.in_jump == true
end)
events.createmove_run:set(function(arg_152_0)
	if slot_0_23_0.refs.fd:get() and slot_0_9_0.misc.unlock_fakeduck:get() and not jumping and bit.band(entity.get_local_player().m_fFlags, 1) ~= 0 then
		arg_152_0.forwardmove = arg_152_0.forwardmove * 2
		arg_152_0.sidemove = arg_152_0.sidemove * 2
	end
end)

function slot_0_23_0.closest_ray_point(arg_153_0, arg_153_1, arg_153_2)
	local var_153_0 = arg_153_0 - arg_153_1
	local var_153_1 = arg_153_2 - arg_153_1
	local var_153_2 = var_153_1:length()
	local var_153_3 = var_153_1 / var_153_2
	local var_153_4 = var_153_3:dot(var_153_0)

	if var_153_4 < 0 then
		return arg_153_1
	elseif var_153_2 < var_153_4 then
		return arg_153_2
	end

	return arg_153_1 + var_153_3 * var_153_4
end

slot_0_23_0.active_brute = false
slot_0_23_0.active_timeout = false
slot_0_23_0.dist = 0
slot_0_23_0.brute_target = "none"

function slot_0_23_0.get_camera_pos(arg_154_0)
	local var_154_0 = arg_154_0.m_vecOrigin

	if var_154_0.x == nil then
		return
	end

	local var_154_1 = arg_154_0.m_vecViewOffset

	var_154_0.z = var_154_0.z + (var_154_1.z - arg_154_0.m_flDuckAmount * 16)

	return var_154_0.x, var_154_0.y, var_154_0.z
end

function slot_0_23_0.fired_at(arg_155_0, arg_155_1, arg_155_2)
	local var_155_0 = {
		slot_0_23_0.get_camera_pos(arg_155_1)
	}

	if var_155_0[1] == nil then
		return
	end

	local var_155_1 = arg_155_0:get_hitbox_position(0)
	local var_155_2 = {
		var_155_1.x - var_155_0[1],
		var_155_1.y - var_155_0[2],
		var_155_1.z - var_155_0[3]
	}
	local var_155_3 = {
		arg_155_2[1] - var_155_0[1],
		arg_155_2[2] - var_155_0[2],
		arg_155_2[3] - var_155_0[3]
	}
	local var_155_4 = (var_155_2[1] * var_155_3[1] + var_155_2[2] * var_155_3[2] + var_155_2[3] * var_155_3[3]) / (math.pow(var_155_3[1], 2) + math.pow(var_155_3[2], 2) + math.pow(var_155_3[3], 2))
	local var_155_5 = {
		var_155_0[1] + var_155_3[1] * var_155_4,
		var_155_0[2] + var_155_3[2] * var_155_4,
		var_155_0[3] + var_155_3[3] * var_155_4
	}
	local var_155_6 = math.abs(math.sqrt(math.pow(var_155_1.x - var_155_5[1], 2) + math.pow(var_155_1.y - var_155_5[2], 2) + math.pow(var_155_1.z - var_155_5[3], 2)))
	local var_155_7 = utils.trace_bullet(arg_155_1, vector(arg_155_2[1], arg_155_2[2], arg_155_2[3]), var_155_1)
	local var_155_8 = utils.trace_bullet(arg_155_0, vector(var_155_5[1], var_155_5[2], var_155_5[3]), var_155_1)

	return var_155_6 < 129 and (var_155_7 > 0.99 or var_155_8 > 0.99)
end

slot_0_117_0 = 0
slot_0_23_0.antibrute = {
	damaged = 0,
	latest = 0,
	players = entity.get_players(false, true),
	trigger = function(arg_156_0)
		local var_156_0 = entity.get_local_player()

		if var_156_0 == nil or not var_156_0:is_alive() then
			return
		end

		local var_156_1 = slot_0_84_0:get_state(var_156_0)

		slot_0_84_0.state = var_156_1

		if var_156_1 == "none" then
			return
		end

		local var_156_2 = slot_0_9_0.rage.builder_elements[var_156_1]

		if not var_156_2.antibrute:get() and slot_0_23_0.shared_data.team == 2 or not var_156_2.antibrute_ct:get() and slot_0_23_0.shared_data.team == 3 then
			return
		end

		local var_156_3 = entity.get(arg_156_0.userid, true)

		if not var_156_3 or not var_156_3:is_enemy() or var_156_3:is_dormant() then
			return
		end

		if slot_0_23_0.fired_at(var_156_0, var_156_3, {
			arg_156_0.x,
			arg_156_0.y,
			arg_156_0.z
		}) and slot_0_23_0.antibrute.latest ~= globals.tickcount then
			slot_0_23_0.antibrute.latest = globals.tickcount
			slot_0_23_0.brute_target = var_156_3:get_name()
			slot_0_23_0.active_brute = true
			slot_0_23_0.active_timeout = false
			slot_0_23_0.antibrute.latest = globals.tickcount

			if slot_0_23_0.shared_data.team == 2 then
				if var_156_2.anti_timeout:get() == 0 then
					slot_0_23_0.active_brute = true
				else
					utils.execute_after(var_156_2.anti_timeout:get(), function()
						slot_0_23_0.active_brute = false
						slot_0_23_0.active_timeout = true
					end)
				end
			elseif slot_0_23_0.shared_data.team == 3 then
				if var_156_2.anti_timeout_ct:get() == 0 then
					slot_0_23_0.active_brute = true
				else
					utils.execute_after(var_156_2.anti_timeout_ct:get(), function()
						slot_0_23_0.active_brute = false
						slot_0_23_0.active_timeout = true
					end)
				end
			end
		end
	end,
	run = function(arg_159_0)
		events.bullet_impact:set(arg_159_0.trigger)
		events.player_hurt:set(function(arg_160_0)
			if entity.get(arg_160_0.userid, true) == lp then
				arg_159_0.damaged = globals.tickcount
			end
		end)
	end
}

slot_0_23_0.antibrute:run()

slot_0_23_0.choked_commands = 0

function slot_0_23_0.update_choked_commands(arg_161_0)
	slot_0_23_0.choked_commands = arg_161_0.choked_commands
end

events.createmove(slot_0_23_0.update_choked_commands)

slot_0_23_0.choke_values = {
	6,
	6,
	6
}
slot_0_23_0.tick_choke = 0
slot_0_23_0.allow_inverter = true
slot_0_23_0.brute_modifier = 0
slot_0_23_0.brute_modifier_ct = 0
slot_0_118_0 = false
slot_0_119_0 = false
slot_0_23_0.auto = false

function slot_0_23_0.get_ref(arg_162_0, arg_162_1, arg_162_2)
	local var_162_0 = slot_0_23_0.shared_data.team == 2 and "" or "_ct"
	local var_162_1 = arg_162_0 .. var_162_0

	return arg_162_1[var_162_1]:get() or arg_162_1[var_162_1]:get_override()
end

slot_0_23_0.index = 0
slot_0_23_0.yaw_ovr = 0
slot_0_120_0 = 0
slot_0_121_0 = {}
slot_0_122_0 = 1
slot_0_123_0 = 1
slot_0_124_0 = 0
slot_0_125_0 = false
slot_0_23_0.ctx = {
	pitch = "Down",
	counter = 0,
	torpedo_value = 0,
	yaw = 0,
	tick_count = 0,
	hold_value = 0,
	offset = 0
}
slot_0_126_0 = false
slot_0_127_0 = 0.5

function slot_0_128_0(arg_163_0, arg_163_1)
	return math.floor(math.random() * (arg_163_1 - arg_163_0 + 1) + arg_163_0)
end

slot_0_129_0 = 0
slot_0_130_0 = 0

function slot_0_23_0.update_counters()
	slot_0_23_0.tick_choke = slot_0_23_0.tick_choke + 1
	slot_0_23_0.ctx.counter = slot_0_23_0.ctx.counter + 1
	slot_0_98_0 = slot_0_98_0 + 1
	slot_0_99_0 = slot_0_99_0 + 1
	slot_0_102_0 = slot_0_102_0 + 1

	if slot_0_102_0 > 1 then
		slot_0_103_0 = not slot_0_103_0
		slot_0_102_0 = 0
	end
end

events.createmove(slot_0_23_0.update_counters)

function slot_0_23_0.apply_yaw_settings(arg_165_0, arg_165_1, arg_165_2, arg_165_3, arg_165_4, arg_165_5, arg_165_6, arg_165_7)
	if slot_0_23_0.choked_commands > 0 then
		return
	end

	slot_165_8_0 = slot_0_23_0.get_ref
	slot_165_9_0 = utils.random_float
	slot_165_10_0 = utils.random_int
	slot_165_11_0 = slot_165_8_0("Jitter", arg_165_1, arg_165_2)
	slot_165_12_0 = slot_165_8_0("yaw_randomize", arg_165_1, arg_165_2)
	slot_165_13_0 = slot_165_8_0("fake_options", arg_165_1, arg_165_2)
	slot_165_14_0 = slot_165_8_0("center_options", arg_165_1, arg_165_2)
	slot_165_15_0 = slot_165_14_0 == "Custom"
	slot_165_16_0 = entity.get_local_player()
	slot_165_18_0 = entity.get_local_player():get_player_weapon(false):get_classname()

	function slot_165_19_0(arg_166_0, arg_166_1)
		local var_166_0 = slot_165_8_0("yaw_random_methods", arg_165_1, arg_165_2)

		if var_166_0 == "Default" then
			if arg_166_0 > 0 then
				local var_166_1 = arg_166_0 - arg_166_1
				local var_166_2 = arg_166_0

				return slot_165_9_0(math.min(var_166_1, var_166_2), math.max(var_166_1, var_166_2))
			elseif arg_166_0 < 0 then
				local var_166_3 = arg_166_0
				local var_166_4 = arg_166_0 + arg_166_1

				return slot_165_9_0(math.min(var_166_3, var_166_4), math.max(var_166_3, var_166_4))
			else
				return 0
			end
		elseif var_166_0 == "Sinusoidal" then
			local var_166_5 = slot_165_8_0("frequency", arg_165_1, arg_165_2)
			local var_166_6 = slot_165_8_0("amplitude", arg_165_1, arg_165_2)

			return arg_166_0 + math.sin(globals.curtime * var_166_5) * var_166_6
		elseif var_166_0 == "Chaotic" then
			local var_166_7 = slot_165_8_0("r_min", arg_165_1, arg_165_2)
			local var_166_8 = slot_165_8_0("r_max", arg_165_1, arg_165_2)
			local var_166_9 = globals.curtime * slot_165_8_0("scale", arg_165_1, arg_165_2)

			return arg_166_0 + slot_165_9_0(var_166_7, var_166_8) * math.sin(var_166_9) * math.cos(var_166_9 * 2) * math.sin(var_166_9 * 0.5)
		end

		return arg_166_0
	end

	function slot_165_20_0(arg_167_0, arg_167_1, arg_167_2, arg_167_3, arg_167_4)
		local var_167_0 = math.random(1, 100)

		if arg_167_4 then
			if var_167_0 <= 45 then
				slot_0_129_0 = slot_165_19_0(arg_167_0, slot_165_12_0)
			elseif var_167_0 <= 75 then
				slot_0_129_0 = -math.abs(slot_165_19_0(arg_167_0 * 0.8, slot_165_12_0))
			else
				slot_0_129_0 = slot_0_128_0(-5, 0)
			end
		elseif var_167_0 <= 45 then
			slot_0_129_0 = slot_165_19_0(arg_167_1, slot_165_12_0)
		elseif var_167_0 <= 75 then
			slot_0_129_0 = math.abs(slot_165_19_0(arg_167_1 * 0.8, slot_165_12_0))
		else
			slot_0_129_0 = slot_0_128_0(0, 5)
		end

		return slot_0_129_0
	end

	function slot_165_21_0(arg_168_0, arg_168_1, arg_168_2, arg_168_3, arg_168_4)
		if slot_0_23_0.ctx.counter % math.random(5, 7) == 0 then
			slot_0_23_0.ctx.torpedo_value = math.random(-3, 6)
		elseif arg_168_4 then
			slot_0_23_0.ctx.torpedo_value = slot_165_19_0(arg_168_0, slot_165_12_0)
		else
			slot_0_23_0.ctx.torpedo_value = slot_165_19_0(arg_168_1, slot_165_12_0)
		end

		return slot_0_23_0.ctx.torpedo_value
	end

	slot_165_22_0 = nil
	slot_165_23_0 = slot_0_23_0.refs.body_yaw

	if slot_165_13_0 == "Static" then
		slot_165_22_0 = slot_165_19_0(slot_165_8_0("yaw_left", arg_165_1, arg_165_2), slot_165_12_0)

		slot_165_23_0[3]:override(slot_165_10_0(slot_165_8_0("fake_left", arg_165_1, arg_165_2), slot_165_8_0("fake_left", arg_165_1, arg_165_2) - slot_165_8_0("fake_left_random", arg_165_1, arg_165_2)))
		slot_165_23_0[4]:override(slot_165_10_0(slot_165_8_0("fake_right", arg_165_1, arg_165_2), slot_165_8_0("fake_right", arg_165_1, arg_165_2) - slot_165_8_0("fake_right_random", arg_165_1, arg_165_2)))
		slot_0_23_0.refs.inverter:override(true)
	else
		if slot_165_15_0 then
			slot_165_24_1 = {}

			for iter_165_0 = 1, slot_165_8_0("custom_amount", arg_165_1, arg_165_2) do
				slot_165_29_0 = slot_165_8_0("custom_slider_" .. iter_165_0, arg_165_1, arg_165_2)

				if slot_165_29_0 then
					table.insert(slot_165_24_1, slot_165_29_0)
				end
			end

			if #slot_165_24_1 > 0 then
				slot_0_122_0 = slot_0_122_0 % #slot_165_24_1 + 1
				slot_0_120_0 = slot_165_24_1[slot_0_122_0]
			end
		end

		if slot_165_11_0 ~= "Center" then
			slot_165_24_0 = slot_165_14_0 == "Min - Max" and math.random(slot_165_8_0("center_min", arg_165_1, arg_165_2), slot_165_8_0("center_max", arg_165_1, arg_165_2)) or slot_165_14_0 == "Randomize" and slot_165_9_0(slot_165_8_0("yaw_jitter_ovr", arg_165_1, arg_165_2), slot_165_8_0("yaw_jitter_ovr", arg_165_1, arg_165_2) - slot_165_8_0("jitter_randomize", arg_165_1, arg_165_2)) or slot_165_15_0 and slot_0_120_0 or slot_165_9_0(slot_165_8_0("yaw_jitter_ovr", arg_165_1, arg_165_2), slot_165_8_0("yaw_jitter_ovr", arg_165_1, arg_165_2))

			slot_0_23_0.refs.jitter:override(slot_165_11_0)
			slot_0_23_0.refs.jitter_val:override(slot_165_24_0)
		else
			slot_0_23_0.refs.jitter:override("Disabled")
			slot_0_23_0.refs.jitter_val:override(0)
		end

		if arg_165_0 then
			if slot_165_11_0 == "Center" then
				slot_165_22_0 = slot_165_15_0 and slot_0_120_0 or slot_165_19_0(arg_165_5, slot_165_12_0)
			elseif slot_165_11_0 == "3-way" or slot_165_11_0 == "5-way" or slot_165_11_0 == "Spin" then
				slot_165_22_0 = slot_165_19_0(arg_165_5, slot_165_12_0)
			elseif slot_165_11_0 == "Hold" then
				slot_165_22_0 = slot_165_20_0(arg_165_5, arg_165_6, arg_165_1, arg_165_2, arg_165_0)
			elseif slot_165_11_0 == "Torpedo" then
				slot_165_22_0 = slot_165_21_0(arg_165_5, arg_165_6, arg_165_1, arg_165_2, arg_165_0)
			else
				slot_165_22_0 = slot_165_19_0(slot_165_8_0("yaw_left", arg_165_1, arg_165_2), slot_165_12_0)
			end

			if slot_0_126_0 then
				slot_165_23_0[3]:override(slot_165_10_0(slot_165_8_0("fake_left", arg_165_1, arg_165_2), slot_165_8_0("fake_left", arg_165_1, arg_165_2) - slot_165_8_0("fake_left_random", arg_165_1, arg_165_2)))
				slot_165_23_0[4]:override(slot_165_10_0(slot_165_8_0("fake_right", arg_165_1, arg_165_2), slot_165_8_0("fake_right", arg_165_1, arg_165_2) - slot_165_8_0("fake_right_random", arg_165_1, arg_165_2)))
				slot_0_23_0.refs.inverter:override(false)
			else
				slot_165_23_0[3]:override(slot_165_10_0(slot_165_8_0("fake_left", arg_165_1, arg_165_2), slot_165_8_0("fake_left", arg_165_1, arg_165_2) - slot_165_8_0("fake_left_random", arg_165_1, arg_165_2)))
				slot_165_23_0[4]:override(slot_165_10_0(-slot_165_8_0("fake_right", arg_165_1, arg_165_2), -slot_165_8_0("fake_right", arg_165_1, arg_165_2) - slot_165_8_0("fake_right_random", arg_165_1, arg_165_2)))
				slot_0_23_0.refs.inverter:override(slot_0_23_0.allow_inverter)
			end
		else
			if slot_165_11_0 == "Center" then
				slot_165_22_0 = slot_165_15_0 and slot_0_120_0 or slot_165_19_0(arg_165_6, slot_165_12_0)
			elseif slot_165_11_0 == "3-way" or slot_165_11_0 == "5-way" or slot_165_11_0 == "Spin" then
				slot_165_22_0 = slot_165_19_0(arg_165_6, slot_165_12_0)
			elseif slot_165_11_0 == "Hold" then
				slot_165_22_0 = slot_165_20_0(arg_165_5, arg_165_6, arg_165_1, arg_165_2, arg_165_0)
			elseif slot_165_11_0 == "Torpedo" then
				slot_165_22_0 = slot_165_21_0(arg_165_5, arg_165_6, arg_165_1, arg_165_2, arg_165_0)
			else
				slot_165_22_0 = slot_165_19_0(slot_165_8_0("yaw_right", arg_165_1, arg_165_2), slot_165_12_0)
			end

			if slot_0_126_0 then
				slot_165_23_0[3]:override(slot_165_10_0(slot_165_8_0("fake_left", arg_165_1, arg_165_2), slot_165_8_0("fake_left", arg_165_1, arg_165_2) - slot_165_8_0("fake_left_random", arg_165_1, arg_165_2)))
				slot_165_23_0[4]:override(slot_165_10_0(slot_165_8_0("fake_right", arg_165_1, arg_165_2), slot_165_8_0("fake_right", arg_165_1, arg_165_2) - slot_165_8_0("fake_right_random", arg_165_1, arg_165_2)))
			else
				slot_165_23_0[3]:override(slot_165_10_0(-slot_165_8_0("fake_left", arg_165_1, arg_165_2), -slot_165_8_0("fake_left", arg_165_1, arg_165_2) - slot_165_8_0("fake_left_random", arg_165_1, arg_165_2)))
				slot_165_23_0[4]:override(slot_165_10_0(slot_165_8_0("fake_right", arg_165_1, arg_165_2), slot_165_8_0("fake_right", arg_165_1, arg_165_2) - slot_165_8_0("fake_right_random", arg_165_1, arg_165_2)))
			end

			slot_0_23_0.refs.inverter:override(false)
		end
	end

	return slot_165_22_0
end

slot_0_131_0 = {
	Forward = 180,
	Right = 90,
	Left = -90
}
slot_0_132_0 = {
	"Standing",
	"Running",
	"Slowmotion",
	"Crouch",
	"Crouch Moving",
	"Air",
	"Air Crouch"
}

function slot_0_23_0.should_disable_freestand(arg_169_0, arg_169_1)
	for iter_169_0, iter_169_1 in pairs(slot_0_132_0) do
		if arg_169_0:get(iter_169_0) and arg_169_1 == iter_169_1 then
			return true
		end
	end

	return false
end

function slot_0_23_0.apply_manual(arg_170_0)
	slot_0_85_0.manual_state = arg_170_0

	slot_0_23_0.refs.base:override("local view")

	if slot_0_9_0.rage.freestanding_bind.prefer_manual:get() then
		slot_0_23_0.refs.freestand_bind:set(false)

		if not slot_0_9_0.rage.freestanding_bind.keep_fs:get() then
			slot_0_9_0.rage.freestanding_bind:set(false)
		end
	end
end

function slot_0_23_0.handle_safe_head()
	local var_171_0 = entity.get_local_player()

	if var_171_0 == nil then
		return
	end

	if not var_171_0:is_alive() then
		return
	end

	local var_171_1 = slot_0_84_0:get_state(var_171_0)
	local var_171_2 = var_171_0:get_player_weapon(false)

	if var_171_2 == nil then
		return
	end

	local var_171_3 = var_171_2:get_classname()
	local var_171_4 = slot_0_9_0.rage.safe_head.safe_options
	local var_171_5 = entity.get_threat(false)
	local var_171_6 = var_171_3:find("Knife")
	local var_171_7 = var_171_3:find("Taser")
	local var_171_8 = var_171_0:get_origin()
	local var_171_9 = 0
	local var_171_10 = (var_171_5 == nil and 0 or var_171_5:get_origin()) - var_171_8
	local var_171_11 = -var_171_10.z
	local var_171_12 = var_171_10:length2dsqr()
	local var_171_13 = var_171_4:get(1)
	local var_171_14 = var_171_4:get(2)
	local var_171_15 = var_171_4:get(3)
	local var_171_16 = var_171_4:get(4)
	local var_171_17 = var_171_4:get(5)
	local var_171_18 = var_171_4:get(6)

	if var_171_13 and var_171_1 == "Standing" then
		return true
	elseif var_171_14 and var_171_1 == "Crouch" then
		return true
	elseif var_171_15 and var_171_1 == "Air Crouch" and var_171_6 then
		return true
	elseif var_171_18 and var_171_1 == "Air Crouch" and var_171_7 then
		return true
	elseif var_171_16 and var_171_5 ~= nil and var_171_12 > 1000000 then
		return true
	elseif var_171_17 and var_171_11 >= 24 then
		return true
	else
		return false
	end
end

function slot_0_23_0.distance(arg_172_0, arg_172_1, arg_172_2, arg_172_3, arg_172_4, arg_172_5)
	return math.sqrt((arg_172_0 - arg_172_3) * (arg_172_0 - arg_172_3) + (arg_172_1 - arg_172_4) * (arg_172_1 - arg_172_4))
end

function slot_0_23_0.extrapolate(arg_173_0, arg_173_1, arg_173_2, arg_173_3, arg_173_4)
	local var_173_0 = arg_173_0.m_vecVelocity.x
	local var_173_1 = arg_173_0.m_vecVelocity.y
	local var_173_2 = arg_173_0.m_vecVelocity.z
	local var_173_3 = arg_173_2 + globals.tickinterval * var_173_0 * arg_173_1
	local var_173_4 = arg_173_3 + globals.tickinterval * var_173_1 * arg_173_1
	local var_173_5 = arg_173_4 + globals.tickinterval * var_173_2 * arg_173_1

	return var_173_3, var_173_4, var_173_5
end

slot_0_23_0.round_end = false
slot_0_23_0.last_values = {
	body_mode_val = "Disabled",
	yaw4_val = 0,
	yaw3_val = 0,
	inverter_val = false,
	body_enable_val = false,
	jitter_val_val = 0,
	jitter_mode_val = "Disabled",
	pitch_val = "Disabled",
	offset_val = 0,
	base_val = "At Target",
	body6_val = "Off"
}

function slot_0_23_0.handle_neverlose_body(arg_174_0, arg_174_1, arg_174_2, arg_174_3)
	if slot_0_23_0.choked_commands == 0 then
		local var_174_0 = entity.get_local_player()

		if var_174_0 == nil or not var_174_0:is_alive() then
			return
		end

		if var_174_0:get_player_weapon(false) == nil then
			return
		end

		local var_174_1 = slot_0_23_0.refs
		local var_174_2 = not slot_0_23_0.should_disable_freestand(arg_174_0.rage.freestanding_bind.freestand_options, arg_174_1) and (arg_174_0.rage.freestanding_bind:get() or arg_174_0.rage.freestanding_bind:get_override())
		local var_174_3 = slot_0_85_0.manual_state
		local var_174_4 = globals.tickcount

		local function var_174_5(arg_175_0)
			for iter_175_0, iter_175_1 in pairs(arg_175_0) do
				slot_0_23_0.last_values[iter_175_0] = iter_175_1
			end
		end

		slot_0_23_0.refs.backstab:override(arg_174_0.rage.avoid_knife:get())

		if var_174_2 then
			local var_174_6 = arg_174_0.rage.freestanding_bind.freestand_body:get()

			if var_174_6 == 1 or var_174_6 == 2 then
				var_174_5({
					body6_val = "Off",
					body_enable_val = true,
					base_val = "At Target",
					pitch_val = "Down",
					offset_val = var_174_3,
					body_mode_val = var_174_6 == 1 and "Static" or "Jitter"
				})
			end

			slot_0_126_0 = var_174_6 == 1
		elseif arg_174_0.rage.manual:get() ~= "At Target" then
			var_174_5({
				base_val = "local view",
				offset_val = var_174_3 - arg_174_3
			})

			slot_0_126_0 = false
		elseif arg_174_0.rage.safe_head:get() and slot_0_23_0.handle_safe_head() then
			var_174_5({
				body_mode_val = "Static",
				offset_val = 30,
				body6_val = "Off",
				body_enable_val = true,
				base_val = "At Target",
				pitch_val = "Down"
			})

			slot_0_126_0 = true
		elseif (entity.get_game_rules().m_bWarmupPeriod or slot_0_23_0.round_end) and arg_174_0.rage.additions:get(1) then
			var_174_5({
				body_mode_val = "Disabled",
				body6_val = "Off",
				body_enable_val = false,
				base_val = "local view",
				pitch_val = "Disabled",
				offset_val = var_174_4 * 25 % 360
			})

			slot_0_126_0 = false
		else
			var_174_5({
				body6_val = "off",
				body_enable_val = true,
				base_val = "At Target",
				pitch_val = "down",
				offset_val = arg_174_3 - slot_0_23_0.brute_modifier
			})

			slot_0_126_0 = false
		end
	end

	local var_174_7 = slot_0_23_0.refs

	var_174_7.offset:override(slot_0_23_0.last_values.offset_val)
	var_174_7.pitch:set(slot_0_23_0.last_values.pitch_val)
	var_174_7.body_yaw[6]:override(slot_0_23_0.last_values.body6_val)
	var_174_7.base:override(slot_0_23_0.last_values.base_val)
end

slot_0_133_0 = slot_0_19_0.utils.random_int
slot_0_134_0 = slot_0_19_0.utils.random_float
slot_0_135_0 = slot_0_19_0.math.normalize_yaw
slot_0_136_0 = slot_0_23_0.get_ref
slot_0_137_0 = globals.commandack
slot_0_138_0 = globals.tickcount
slot_0_139_0 = {}

for iter_0_2, iter_0_3 in pairs(slot_0_132_0) do
	slot_0_139_0[iter_0_3] = iter_0_2
end

function slot_0_140_0(arg_176_0, arg_176_1, arg_176_2, arg_176_3)
	slot_176_4_0 = slot_0_23_0.get_ref("def_toggle", arg_176_0, arg_176_1)

	if not arg_176_2 or not slot_176_4_0 then
		return false
	end

	slot_176_5_0 = slot_0_23_0.refs.body_yaw
	slot_176_6_0 = slot_0_23_0.get_ref
	slot_176_7_0 = slot_176_6_0("yaw_mode", arg_176_0, arg_176_1)
	slot_176_8_0 = slot_176_6_0("def_pitch", arg_176_0, arg_176_1)
	slot_176_9_0 = slot_176_8_0 == "Down" and 89 or slot_176_8_0 == "Random" and slot_0_134_0(-89, 89) or slot_176_8_0 == "Auto" and (globals.tickcount % 178 > 89 and -(globals.tickcount % 89) or globals.tickcount % 89) or slot_176_6_0("pitch_offset", arg_176_0, arg_176_1)

	rage.antiaim:override_hidden_pitch(slot_176_9_0)

	slot_176_10_0 = nil

	function slot_176_11_0(arg_177_0, arg_177_1, arg_177_2, arg_177_3)
		local var_177_0 = slot_0_23_0.get_ref("yaw_random_methods", arg_177_2, arg_177_3)

		if var_177_0 == "Default" then
			return slot_0_134_0(arg_177_0, arg_177_0 - arg_177_1)
		elseif var_177_0 == "Sinusoidal" then
			local var_177_1 = slot_0_23_0.get_ref("frequency", arg_177_2, arg_177_3)
			local var_177_2 = slot_0_23_0.get_ref("amplitude", arg_177_2, arg_177_3)

			return arg_177_0 + math.sin(globals.curtime * var_177_1) * var_177_2
		elseif var_177_0 == "Chaotic" then
			local var_177_3 = slot_0_23_0.get_ref("r_min", arg_177_2, arg_177_3)
			local var_177_4 = slot_0_23_0.get_ref("r_max", arg_177_2, arg_177_3)
			local var_177_5 = slot_0_23_0.get_ref("scale", arg_177_2, arg_177_3)
			local var_177_6 = globals.curtime * var_177_5

			return arg_177_0 + slot_0_134_0(var_177_3, var_177_4) * math.sin(var_177_6) * math.cos(var_177_6 * 2) * math.sin(var_177_6 * 0.5)
		end

		return arg_177_0
	end

	if slot_176_7_0 == "Sideways" then
		slot_176_12_3 = arg_176_3 and 90 or -90

		rage.antiaim:override_hidden_yaw_offset(slot_176_12_3)

		slot_176_10_0 = 0
	elseif slot_176_7_0 == "Random" then
		slot_176_12_2 = slot_0_135_0(math.random(-180, 180), -180, 180)

		rage.antiaim:override_hidden_yaw_offset(slot_176_12_2)

		slot_176_10_0 = 0
	elseif slot_176_7_0 == "Spin" then
		slot_176_12_1 = globals.tickcount * 2^slot_176_6_0("spin_speed", arg_176_0, arg_176_1) % 360

		rage.antiaim:override_hidden_yaw_offset(slot_176_12_1)

		slot_176_10_0 = 0
	elseif slot_176_7_0 == "L - R" then
		slot_176_12_0 = arg_176_3
		slot_176_13_0 = slot_176_6_0("Jitter", arg_176_0, arg_176_1)
		slot_176_14_0 = slot_176_6_0("yaw_randomize", arg_176_0, arg_176_1)
		slot_176_15_0 = slot_176_6_0("center_options", arg_176_0, arg_176_1)
		slot_176_16_0 = slot_176_15_0 == "Custom"
		slot_176_17_0 = slot_176_6_0("yaw_left", arg_176_0, arg_176_1)
		slot_176_18_0 = slot_176_6_0("yaw_right", arg_176_0, arg_176_1)

		if slot_176_13_0 ~= "Center" then
			slot_176_19_0 = slot_176_15_0 == "Min - Max" and math.random(slot_176_6_0("center_min", arg_176_0, arg_176_1), slot_176_6_0("center_max", arg_176_0, arg_176_1)) or slot_176_15_0 == "Randomize" and slot_0_134_0(slot_176_6_0("yaw_jitter_ovr", arg_176_0, arg_176_1), slot_176_6_0("yaw_jitter_ovr", arg_176_0, arg_176_1) - slot_176_6_0("jitter_randomize", arg_176_0, arg_176_1))

			if slot_0_107_0.is_defensive() then
				slot_0_23_0.refs.jitter:override(slot_176_13_0)
				slot_0_23_0.refs.jitter_val:override(slot_176_19_0)
			end
		elseif slot_0_107_0.is_defensive() then
			slot_0_23_0.refs.jitter:override("Disabled")
			slot_0_23_0.refs.jitter_val:override(0)
		end

		if slot_176_12_0 then
			if slot_176_13_0 == "Center" then
				slot_176_10_0 = slot_176_11_0(slot_176_17_0, slot_176_14_0, arg_176_0, arg_176_1)
			elseif slot_176_13_0 == "3-way" or slot_176_13_0 == "5-way" or slot_176_13_0 == "Spin" then
				slot_176_10_0 = slot_176_11_0(slot_176_17_0, slot_176_14_0, arg_176_0, arg_176_1)
			else
				slot_176_10_0 = slot_176_11_0(slot_176_6_0("yaw_left", arg_176_0, arg_176_1), slot_176_14_0, arg_176_0, arg_176_1)
			end

			if slot_0_126_0 then
				slot_176_5_0[3]:override(slot_0_133_0(slot_176_6_0("fake_left", arg_176_0, arg_176_1), slot_176_6_0("fake_left", arg_176_0, arg_176_1) - slot_176_6_0("fake_left_random", arg_176_0, arg_176_1)))
				slot_176_5_0[4]:override(slot_0_133_0(slot_176_6_0("fake_right", arg_176_0, arg_176_1), slot_176_6_0("fake_right", arg_176_0, arg_176_1) - slot_176_6_0("fake_right_random", arg_176_0, arg_176_1)))
				slot_0_23_0.refs.inverter:override(false)
			else
				slot_176_5_0[3]:override(slot_0_133_0(slot_176_6_0("fake_left", arg_176_0, arg_176_1), slot_176_6_0("fake_left", arg_176_0, arg_176_1) - slot_176_6_0("fake_left_random", arg_176_0, arg_176_1)))
				slot_176_5_0[4]:override(slot_0_133_0(-slot_176_6_0("fake_right", arg_176_0, arg_176_1), -slot_176_6_0("fake_right", arg_176_0, arg_176_1) - slot_176_6_0("fake_right_random", arg_176_0, arg_176_1)))
				slot_0_23_0.refs.inverter:override(slot_0_23_0.allow_inverter)
			end
		else
			if slot_176_13_0 == "Center" then
				slot_176_10_0 = slot_176_11_0(slot_176_18_0, slot_176_14_0, arg_176_0, arg_176_1)
			elseif slot_176_13_0 == "3-way" or slot_176_13_0 == "5-way" or slot_176_13_0 == "Spin" then
				slot_176_10_0 = slot_176_11_0(slot_176_18_0, slot_176_14_0, arg_176_0, arg_176_1)
			else
				slot_176_10_0 = slot_176_11_0(slot_176_6_0("yaw_right", arg_176_0, arg_176_1), slot_176_14_0, arg_176_0, arg_176_1)
			end

			if slot_0_126_0 then
				slot_176_5_0[3]:override(slot_0_133_0(slot_176_6_0("fake_left", arg_176_0, arg_176_1), slot_176_6_0("fake_left", arg_176_0, arg_176_1) - slot_176_6_0("fake_left_random", arg_176_0, arg_176_1)))
				slot_176_5_0[4]:override(slot_0_133_0(slot_176_6_0("fake_right", arg_176_0, arg_176_1), slot_176_6_0("fake_right", arg_176_0, arg_176_1) - slot_176_6_0("fake_right_random", arg_176_0, arg_176_1)))
			else
				slot_176_5_0[3]:override(slot_0_133_0(-slot_176_6_0("fake_left", arg_176_0, arg_176_1), -slot_176_6_0("fake_left", arg_176_0, arg_176_1) - slot_176_6_0("fake_left_random", arg_176_0, arg_176_1)))
				slot_176_5_0[4]:override(slot_0_133_0(slot_176_6_0("fake_right", arg_176_0, arg_176_1), slot_176_6_0("fake_right", arg_176_0, arg_176_1) - slot_176_6_0("fake_right_random", arg_176_0, arg_176_1)))
			end

			slot_0_23_0.refs.inverter:override(false)
		end

		rage.antiaim:override_hidden_yaw_offset(0)
	end

	return true, slot_176_10_0
end

function slot_0_23_0.handle_def(arg_178_0)
	local var_178_0 = entity.get_local_player()

	if var_178_0 == nil or not var_178_0:is_alive() then
		return
	end

	local var_178_1 = slot_0_84_0:get_state(var_178_0)

	if var_178_1 == "none" then
		return
	end

	local var_178_2 = slot_0_9_0.rage.builder_elements[var_178_1]
	local var_178_3 = var_178_0:get_player_weapon(false)

	if not var_178_3 then
		return
	end

	local var_178_4 = var_178_3:get_classname()
	local var_178_5 = false
	local var_178_6 = false
	local var_178_7 = {
		1,
		1,
		1
	}

	if var_178_2.defensive_tickbase:get() == 1 then
		if var_178_2.tick_random:get() then
			var_178_7 = {
				var_178_2.tick_speed1:get(),
				var_178_2.tick_speed2:get()
			}
		else
			var_178_7 = {
				var_178_2.tick_speed1:get()
			}
		end

		local var_178_8 = slot_0_23_0.random_choke(slot_0_23_0.tick_choke, var_178_7, true)

		slot_0_23_0.refs.def:override("On peek")

		arg_178_0.force_defensive = var_178_8 and not var_178_4:find("Grenade")
	else
		for iter_178_0, iter_178_1 in pairs(slot_0_132_0) do
			if slot_0_9_0.defensive.defensive_conditions:get(iter_178_0) and var_178_1 == iter_178_1 then
				var_178_5 = true

				break
			end
		end
	end

	local var_178_9 = check_weapon_swap() and slot_0_9_0.defensive.game_events:get(1)

	if slot_0_9_0.defensive.force_hideshot:get() then
		slot_0_23_0.refs.hideshot_config:override("Break LC")
	else
		slot_0_23_0.refs.hideshot_config:override("Favor Fire Rate")
	end

	if var_178_9 or check_reloading() and slot_0_9_0.defensive.game_events:get(2) then
		slot_0_23_0.refs.def:override("Always on")
	elseif var_178_5 then
		slot_0_23_0.refs.def:override("Always on")
	elseif slot_0_125_0 then
		slot_0_23_0.refs.def:override("Disabled")
	else
		slot_0_23_0.refs.def:override("On peek")
	end

	if not var_178_4:find("Grenade") then
		slot_0_22_0:override(true)
	end
end

events.createmove(slot_0_23_0.handle_def)

function slot_0_23_0.antiaim(arg_179_0)
	slot_179_1_0 = entity.get_local_player()

	if slot_179_1_0 == nil or not slot_179_1_0:is_alive() then
		return
	end

	slot_179_2_0 = slot_0_84_0:get_state(slot_179_1_0)

	if slot_179_2_0 == "none" then
		return
	end

	slot_0_84_0.state = slot_179_2_0

	slot_0_23_0.refs.yaw:override("Backward")

	slot_179_3_0 = slot_0_23_0.shared_data.team
	slot_179_4_0 = slot_0_9_0.rage.builder_elements[slot_179_2_0]
	slot_179_5_0 = slot_0_9_0.rage.defensive_elements[slot_179_2_0]
	slot_179_6_0 = slot_179_1_0:get_player_weapon(false)

	if slot_179_6_0 == nil then
		return
	end

	slot_179_7_0 = slot_179_6_0:get_classname()
	slot_179_8_0 = slot_0_9_0.rage.manual:get()
	slot_179_9_0 = entity.get_game_rules()
	slot_179_10_0 = 0
	slot_179_11_0 = 0

	if slot_0_131_0[slot_179_8_0] then
		slot_0_23_0.apply_manual(slot_0_131_0[slot_179_8_0])
	else
		slot_0_23_0.refs.base:override("At Target")

		slot_0_85_0.manual_state = 0

		if slot_0_9_0.rage.freestanding_bind:get() then
			slot_0_23_0.refs.freestand_bind:override(not slot_0_23_0.should_disable_freestand(slot_0_9_0.rage.freestanding_bind.freestand_options, slot_179_2_0))
		else
			slot_179_12_2 = slot_0_23_0.should_disable_freestand(slot_0_9_0.rage.freestanding_bind.freestand_enablers, slot_179_2_0)

			slot_0_9_0.rage.freestanding_bind:override(slot_179_12_2)
			slot_0_23_0.refs.freestand_bind:override(slot_179_12_2)
		end
	end

	if slot_0_9_0.rage.additions:get(1) and slot_179_9_0.m_bWarmupPeriod then
		slot_0_23_0.refs.fakelag:override(1)
	elseif slot_0_9_0.rage.additions:get(2) and rage.exploit:get() == 1 then
		slot_0_23_0.refs.fakelag:override(1)
	elseif slot_0_9_0.rage.additions:get(3) and rage.exploit:get() == 1 and slot_0_88_0 then
		slot_0_23_0.refs.fakelag:override(1)
	else
		slot_0_23_0.refs.fakelag:override()
	end

	slot_179_12_1 = false

	if slot_0_9_0.rage.hidden_builder:get() then
		slot_179_13_1 = slot_179_4_0.def_activation:get()

		for iter_179_0, iter_179_1 in pairs(slot_0_132_0) do
			if slot_0_9_0.rage.hidden_builder.antiaim_conditions:get(iter_179_0) and slot_179_2_0 == iter_179_1 and (slot_179_13_1 == "Always" or slot_179_13_1 == "Hittable" and entity.get_threat(true) ~= nil) then
				slot_179_12_0 = true

				break
			end
		end
	end

	slot_179_13_0 = (not slot_0_9_0.rage.freestanding_bind:get() or not slot_0_9_0.rage.hidden_builder.disablers:get(1)) and (slot_0_9_0.rage.manual:get() == "At Target" or not slot_0_9_0.rage.hidden_builder.disablers:get(2)) and (not slot_0_23_0.refs.autopeek:get() or not slot_0_9_0.rage.hidden_builder.disablers:get(3))

	if slot_0_23_0.active_timeout and not slot_0_119_0 then
		slot_0_12_0.push("anti-brute timed out and was reset", clr)
	end

	slot_0_119_0 = slot_0_23_0.active_timeout

	if slot_0_23_0.active_brute and not slot_0_118_0 then
		slot_179_14_2 = slot_179_4_0.antibrute_method:get()

		slot_0_12_0.push(string.format("changed anti-aim due to %s bullet [method:%s]", slot_0_23_0.brute_target, slot_179_14_2), clr)
	end

	slot_0_118_0 = slot_0_23_0.active_brute

	if slot_0_23_0.active_brute then
		slot_179_14_1 = slot_179_4_0.antibrute_method:get()

		if slot_179_14_1 == 1 then
			slot_0_23_0.brute_modifier = 10
		elseif slot_179_14_1 == 2 then
			slot_0_23_0.brute_modifier = slot_0_133_0(5, 10)
		else
			slot_0_23_0.brute_modifier = -10
		end
	else
		slot_0_23_0.brute_modifier = 0
	end

	slot_179_14_0 = rage.exploit:get() == 1 or slot_0_77_0.hs:get()
	slot_179_15_0, slot_179_16_0 = slot_0_140_0(slot_179_5_0, slot_179_3_0, slot_0_107_0.is_defensive(), slot_0_88_0)

	if slot_179_15_0 then
		if slot_0_126_0 then
			slot_0_23_0.refs.body_yaw[5]:override("")
		else
			slot_179_17_2 = slot_0_136_0("speed_options", slot_179_5_0, slot_179_3_0)
			slot_0_23_0.allow_inverter = slot_179_17_2 ~= "Neverlose"

			if slot_0_136_0("fake_options", slot_179_5_0, slot_179_3_0) == "Static" then
				slot_0_23_0.refs.body_yaw[5]:override("")
			else
				slot_0_23_0.refs.body_yaw[5]:override(slot_179_17_2 == "Neverlose" and "Jitter" or "off")
			end
		end
	elseif slot_0_126_0 then
		slot_0_23_0.refs.body_yaw[5]:override("")
	else
		slot_179_17_1 = slot_0_136_0("speed_options", slot_179_4_0, slot_179_3_0)
		slot_0_23_0.allow_inverter = slot_179_17_1 ~= "Neverlose"

		if slot_0_136_0("fake_options", slot_179_4_0, slot_179_3_0) == "Static" then
			slot_0_23_0.refs.body_yaw[5]:override("")
		else
			slot_0_23_0.refs.body_yaw[5]:override(slot_179_17_1 == "Neverlose" and "Jitter" or "off")
		end
	end

	slot_179_17_0 = slot_0_136_0("center_options", slot_179_4_0, slot_179_3_0)
	slot_0_23_0.yaw_ovr = slot_179_17_0 == "Min - Max" and slot_0_133_0(slot_0_136_0("center_min", slot_179_4_0, slot_179_3_0), slot_0_136_0("center_max", slot_179_4_0, slot_179_3_0)) or slot_179_17_0 == "Randomize" and slot_0_133_0(slot_0_136_0("yaw_jitter_ovr", slot_179_4_0, slot_179_3_0), slot_0_136_0("yaw_jitter_ovr", slot_179_4_0, slot_179_3_0) - slot_0_136_0("jitter_randomize", slot_179_4_0, slot_179_3_0)) or 0
	slot_179_19_0 = slot_0_136_0("Jitter", slot_179_4_0, slot_179_3_0) == "Center" and slot_0_23_0.yaw_ovr / 2 or 0
	slot_179_20_0 = slot_0_136_0("yaw_left", slot_179_4_0, slot_179_3_0) + slot_179_19_0
	slot_179_21_0 = slot_0_136_0("yaw_right", slot_179_4_0, slot_179_3_0) - slot_179_19_0
	slot_179_22_0 = slot_0_136_0("yaw_mode", slot_179_4_0, slot_179_3_0)
	slot_179_23_0 = 0

	if slot_179_22_0 == "L - R" then
		if not slot_179_15_0 then
			slot_0_23_0.refs.hidden:override(false)

			slot_179_23_0 = slot_0_23_0.apply_yaw_settings(slot_0_88_0, slot_179_4_0, slot_179_3_0, slot_179_10_0, slot_0_120_0, slot_179_20_0, slot_179_21_0, arg_179_0)
		else
			slot_0_23_0.refs.hidden:override(true)

			slot_179_23_0 = slot_179_16_0
		end
	elseif slot_179_22_0 == "Automatic" then
		slot_179_24_1 = slot_0_136_0("random_speed", slot_179_4_0, slot_179_3_0) and slot_0_133_0(slot_0_136_0("ran_speed_1", slot_179_4_0, slot_179_3_0), slot_0_136_0("ran_speed_2", slot_179_4_0, slot_179_3_0)) or slot_0_136_0("body_speed", slot_179_4_0, slot_179_3_0)

		if slot_0_137_0 % slot_179_24_1 == 1 then
			slot_0_23_0.auto = not slot_0_23_0.auto
			slot_179_23_0 = slot_0_23_0.apply_yaw_settings(not slot_0_23_0.auto, slot_179_4_0, slot_179_3_0, slot_179_10_0, slot_0_120_0, slot_179_20_0, slot_179_21_0, arg_179_0)
		end
	end

	slot_179_24_0 = slot_0_136_0("custom_speed_amount", slot_179_4_0, slot_179_3_0)
	slot_179_25_0 = {}
	slot_179_26_0 = slot_0_136_0("random_speed_method", slot_179_4_0, slot_179_3_0) == "Custom"

	if slot_179_26_0 then
		for iter_179_2 = 1, slot_179_24_0 do
			slot_179_31_0 = slot_0_136_0("custom_speed_slider_" .. iter_179_2, slot_179_4_0, slot_179_3_0)

			if slot_179_31_0 then
				table.insert(slot_179_25_0, slot_179_31_0)
			end
		end

		if not slot_0_123_0 or slot_0_123_0 > #slot_179_25_0 then
			slot_0_123_0 = 1
		end
	end

	if slot_179_15_0 then
		slot_179_27_2 = 0

		if not slot_0_136_0("random_speed", slot_179_5_0, slot_179_3_0) then
			slot_179_27_2 = slot_0_136_0("body_speed", slot_179_5_0, slot_179_3_0) or 0
		elseif slot_0_136_0("random_speed_method", slot_179_5_0, slot_179_3_0) == "Random" then
			slot_179_27_2 = slot_0_133_0(slot_0_136_0("ran_speed_1", slot_179_5_0, slot_179_3_0) or 0, slot_0_136_0("ran_speed_2", slot_179_5_0, slot_179_3_0) or 0)
		elseif slot_179_26_0 and #slot_179_25_0 > 0 then
			slot_179_27_2 = slot_179_25_0[slot_0_123_0] or 0
		end

		if slot_179_27_2 < slot_0_98_0 then
			slot_0_98_0 = 0
			slot_0_88_0 = not slot_0_88_0

			if slot_179_26_0 and #slot_179_25_0 > 0 then
				slot_0_123_0 = slot_0_123_0 % #slot_179_25_0 + 1
			end
		end
	else
		slot_179_27_1 = 0

		if not slot_0_136_0("random_speed", slot_179_4_0, slot_179_3_0) then
			slot_179_27_1 = slot_0_136_0("body_speed", slot_179_4_0, slot_179_3_0) or 0
		elseif slot_0_136_0("random_speed_method", slot_179_4_0, slot_179_3_0) == "Random" then
			slot_179_27_1 = slot_0_133_0(slot_0_136_0("ran_speed_1", slot_179_4_0, slot_179_3_0) or 0, slot_0_136_0("ran_speed_2", slot_179_4_0, slot_179_3_0) or 0)
		elseif slot_179_26_0 and #slot_179_25_0 > 0 then
			slot_179_27_1 = slot_179_25_0[slot_0_123_0] or 0
		end

		if rage.exploit:get() == 0 or slot_0_9_0.rage.freestanding_bind:get() then
			if slot_0_98_0 > 1 then
				slot_0_98_0 = 0
				slot_0_88_0 = not slot_0_88_0

				if slot_179_26_0 and #slot_179_25_0 > 0 then
					slot_0_123_0 = slot_0_123_0 % #slot_179_25_0 + 1
				end
			end
		elseif slot_179_27_1 < slot_0_98_0 then
			slot_0_98_0 = 0
			slot_0_88_0 = not slot_0_88_0

			if slot_179_26_0 and #slot_179_25_0 > 0 then
				slot_0_123_0 = slot_0_123_0 % #slot_179_25_0 + 1
			end
		end
	end

	if slot_179_7_0:find("Grenade") or slot_179_7_0:find("Flashbang") then
		slot_0_124_0 = globals.tickcount
	elseif math.max(slot_179_6_0.m_flNextPrimaryAttack, slot_179_1_0.m_flNextAttack) - globals.tickinterval - globals.curtime < 0 then
		slot_0_125_0 = true
	else
		slot_0_125_0 = false
	end

	slot_179_27_0 = slot_179_6_0.m_fThrowTime
	slot_0_125_0 = slot_0_124_0 + 15 == globals.tickcount or slot_179_27_0 and slot_179_27_0 ~= 0

	if slot_179_15_0 then
		if slot_0_125_0 then
			slot_0_23_0.refs.body_yaw[1]:override(false)
		elseif speed_option == "Amnesia" then
			if slot_0_99_0 > slot_0_136_0("amnesia_tick_speed", slot_179_5_0, slot_179_3_0) then
				slot_0_99_0 = 0
				slot_0_89_0 = not slot_0_89_0
			end

			slot_0_23_0.refs.body_yaw[1]:override(not slot_0_89_0)
		else
			slot_0_23_0.refs.body_yaw[1]:override(slot_0_136_0("body_yaw", slot_179_5_0, slot_179_3_0) and true or false)
		end
	elseif slot_0_125_0 then
		slot_0_23_0.refs.body_yaw[1]:override(false)
	elseif speed_option == "Amnesia" then
		if slot_0_99_0 > slot_0_136_0("amnesia_tick_speed", slot_179_4_0, slot_179_3_0) then
			slot_0_99_0 = 0
			slot_0_89_0 = not slot_0_89_0
		end

		slot_0_23_0.refs.body_yaw[1]:override(not slot_0_89_0)
	else
		slot_0_23_0.refs.body_yaw[1]:override(slot_0_136_0("body_yaw", slot_179_4_0, slot_179_3_0) and true or false)
	end

	slot_0_23_0.handle_neverlose_body(slot_0_9_0, slot_179_2_0, slot_179_7_0, slot_179_23_0)
end

slot_0_12_0 = {
	show_time = 3,
	per_notify_offset = 35,
	prefix_icon = "",
	base_offset = 100 * slot_0_23_0.dpi_scale.x,
	anim_speed = slot_0_27_0.base_speed / 3,
	list = {}
}

function slot_0_141_2(arg_180_0, arg_180_1, arg_180_2, arg_180_3)
	arg_180_1 = math.floor(arg_180_1)

	local var_180_0 = arg_180_2 * 255

	slot_0_12_0.prefix_icon = slot_0_9_0.visuals.notifs.notifs_prefix:get() and "pipe" or "triangle-exclamation"

	local var_180_1 = slot_0_9_0.visuals.notifs.notifs_prefix:get() and "luasense  " or ""
	local var_180_2 = render.measure_text(4, nil, var_180_1)
	local var_180_3 = render.measure_text(1, nil, arg_180_0)
	local var_180_4 = vector(27, 12)
	local var_180_5 = vector(var_180_2.x + var_180_3.x, math.max(var_180_2.y, var_180_3.y)) + var_180_4
	local var_180_6 = slot_0_9_0.visuals.notifs.notifs_round_amount:get()
	local var_180_7 = color(23, 23, 23, var_180_0)

	arg_180_3 = arg_180_3:override("a", var_180_0)

	local var_180_8 = vector(slot_0_23_0.screen_size.x / 2 - var_180_5.x / 2, slot_0_23_0.screen_size.y - arg_180_1)

	if slot_0_9_0.visuals.notifs.notifs_glow_amount:get() ~= 0 then
		render.shadow(var_180_8, var_180_8 + var_180_5, arg_180_3, slot_0_9_0.visuals.notifs.notifs_glow_amount:get(), 1, var_180_6)
	end

	render.rect(var_180_8, var_180_8 + var_180_5, var_180_7, var_180_6)

	local var_180_9 = var_180_8 + vector(var_180_4.x / 2, var_180_5.y / 2 - var_180_2.y / 2)
	local var_180_10 = var_180_1 ~= "" and var_180_9 + vector(var_180_2.x, 0) or var_180_8 + vector(var_180_4.x / 2, var_180_5.y / 2 - var_180_3.y / 2)

	if var_180_1 ~= "" then
		render.text(slot_0_9_0.visuals.notifs.notifs_prefix_font:get(), var_180_9, slot_0_9_0.visuals.notifs.notifs_prefix_clr:get():override("a", var_180_0), "l", slot_0_9_0.visuals.notifs.notifs_prefix_font:get() == 2 and var_180_1:upper() or var_180_1)
	end

	render.text(1, var_180_10, slot_0_24_0.white:override("a", var_180_0), "l", arg_180_0)
end

function slot_0_12_0.push(arg_181_0, arg_181_1)
	table.insert(slot_0_12_0.list, 1, {
		state = 0,
		offset = 50,
		text = slot_0_23_0:with_icon(slot_0_12_0.prefix_icon, arg_181_0, arg_181_1 or slot_0_9_0.visuals.accent:get()),
		shows_until = globals.realtime + slot_0_12_0.show_time,
		color = arg_181_1 or slot_0_9_0.visuals.accent:get()
	})
end

function slot_0_12_0.handle()
	if #slot_0_12_0.list == 0 then
		return
	end

	local var_182_0 = slot_0_12_0.base_offset
	local var_182_1 = globals.realtime

	for iter_182_0, iter_182_1 in pairs(slot_0_12_0.list) do
		var_182_0 = var_182_0 + slot_0_12_0.per_notify_offset

		local var_182_2 = var_182_0
		local var_182_3 = var_182_1 > iter_182_1.shows_until or iter_182_0 > 3
		local var_182_4 = var_182_3 and 0 or 1

		slot_0_12_0.list[iter_182_0].state = slot_0_25_0.lerp(iter_182_1.state, var_182_4, slot_0_12_0.anim_speed)
		slot_0_12_0.list[iter_182_0].offset = slot_0_25_0.lerp(iter_182_1.offset, var_182_2, slot_0_12_0.anim_speed)

		slot_0_141_2(iter_182_1.text, slot_0_12_0.list[iter_182_0].offset, slot_0_12_0.list[iter_182_0].state, iter_182_1.color)

		if iter_182_1.state < 0.01 and var_182_3 then
			table.remove(slot_0_12_0.list, iter_182_0)
		end
	end
end

slot_0_11_0.register("render", "notifications", slot_0_12_0.handle)

slot_0_141_1 = nil
slot_0_141_0 = {
	database = db.luasense_draggable3 or {},
	menu = {},
	items = {
		"slowed_down"
	},
	drag = {}
}
slot_0_141_0.current_drugging_item = nil
slot_0_141_0.hovered_something = false
slot_0_141_0.scale_anim = 0
slot_0_141_0.scale_target = 0
slot_0_141_0.scale_velocity = 0
slot_0_143_2 = render.measure_text(1, nil, "Max velocity reduced by 100%").x + 3
slot_0_144_2 = slot_0_23_0.screen_size / 2

for iter_0_4, iter_0_5 in pairs(slot_0_141_0.items) do
	if slot_0_141_0.database[iter_0_5 .. "_pos_x"] == nil then
		slot_0_141_0.database[iter_0_5 .. "_pos_x"] = slot_0_23_0.screen_size.x / 2 - slot_0_143_2 / 2
	end

	if slot_0_141_0.database[iter_0_5 .. "_pos_y"] == nil then
		slot_0_141_0.database[iter_0_5 .. "_pos_y"] = slot_0_23_0.screen_size.y / 4
	end

	slot_0_141_0.menu[iter_0_5] = {
		pos_x = slot_0_141_0.database[iter_0_5 .. "_pos_x"],
		pos_y = slot_0_141_0.database[iter_0_5 .. "_pos_y"]
	}
end

function slot_0_141_0.adjust()
	local var_183_0 = vector(2560, 1440)
	local var_183_1 = slot_0_23_0.screen_size / var_183_0

	for iter_183_0, iter_183_1 in pairs(slot_0_141_0.items) do
		slot_0_141_0.database[iter_183_1 .. "_pos_x"] = slot_0_141_0.database[iter_183_1 .. "_pos_x"]
		slot_0_141_0.database[iter_183_1 .. "_pos_x"] = slot_0_141_0.database[iter_183_1 .. "_pos_x"]
	end
end

function slot_0_141_0.in_bounds(arg_184_0, arg_184_1)
	local var_184_0 = ui.get_mouse_position()

	return var_184_0.x >= arg_184_0.x and var_184_0.x <= arg_184_1.x and var_184_0.y >= arg_184_0.y and var_184_0.y <= arg_184_1.y
end

function slot_0_141_0.drag_handle(arg_185_0, arg_185_1, arg_185_2, arg_185_3)
	arg_185_3 = arg_185_3 or 0
	slot_185_4_0 = slot_0_23_0.screen_size.x / 2

	if slot_0_141_0.drag[arg_185_2] == nil then
		slot_0_141_0.drag[arg_185_2] = {
			is_dragging = false,
			drag_position = vector(0, 0)
		}
	end

	slot_185_5_0 = ui.get_mouse_position()
	slot_185_6_0 = vector()
	slot_185_7_0 = slot_0_19_0.ui.getalpha() / 255
	slot_185_8_0 = slot_0_141_0.scale_target

	if slot_185_7_0 > 0 then
		slot_0_141_0.scale_target = slot_185_7_0 < 1 and 1.1 or 1
	else
		slot_0_141_0.scale_target = 0.7
	end

	slot_185_9_0 = 0.1
	slot_185_10_0 = 0.7
	slot_185_11_0 = globals.frametime * 100
	slot_185_12_0 = slot_0_141_0.scale_target - slot_0_141_0.scale_anim
	slot_0_141_0.scale_velocity = (slot_0_141_0.scale_velocity or 0) * slot_185_10_0 + slot_185_12_0 * slot_185_9_0 * slot_185_11_0
	slot_0_141_0.scale_anim = slot_0_141_0.scale_anim + slot_0_141_0.scale_velocity

	if slot_0_141_0.scale_anim < 0.6 then
		slot_0_141_0.scale_anim = 0.6
	end

	if slot_0_141_0.scale_anim > 1.2 then
		slot_0_141_0.scale_anim = 1.2
	end

	slot_0_141_0.centering = slot_0_141_0.centering or {}
	slot_185_13_0 = slot_0_23_0.screen_size.x / 2 - arg_185_1.x / 2
	slot_185_14_0 = slot_0_141_0.database[arg_185_2 .. "_pos_x"]

	if slot_0_141_0.in_bounds(arg_185_0, arg_185_0 + arg_185_1) then
		slot_0_141_0.hovered_something = true

		if common.is_button_down(2) then
			slot_0_141_0.centering[arg_185_2] = true
		end
	end

	if slot_0_141_0.centering[arg_185_2] then
		slot_0_141_0.database[arg_185_2 .. "_pos_x"] = slot_0_25_0.lerp(slot_185_14_0, slot_185_13_0, 0.15)

		if math.abs(slot_0_141_0.database[arg_185_2 .. "_pos_x"] - slot_185_13_0) < 0.5 then
			slot_0_141_0.database[arg_185_2 .. "_pos_x"] = slot_185_13_0
			slot_0_141_0.centering[arg_185_2] = false
		end
	end

	if slot_0_141_0.in_bounds(arg_185_0, arg_185_0 + arg_185_1) and common.is_button_down(1) and not slot_0_141_0.drag[arg_185_2].is_dragging and (slot_0_141_0.current_drugging_item == nil or slot_0_141_0.current_drugging_item == arg_185_2) then
		slot_0_141_0.drag[arg_185_2].is_dragging = true
		slot_0_141_0.current_drugging_item = arg_185_2
		slot_0_141_0.drag[arg_185_2].drag_position = arg_185_0 - slot_185_5_0
	end

	if not slot_0_141_0.in_bounds(slot_185_6_0, slot_0_23_0.screen_size) then
		slot_0_141_0.drag[arg_185_2].is_dragging = false
	end

	if not common.is_button_down(1) then
		slot_0_141_0.drag[arg_185_2].is_dragging = false
		slot_0_141_0.current_drugging_item = nil
	end

	if slot_0_141_0.drag[arg_185_2].is_dragging and slot_0_19_0.ui.getalpha() > 0 then
		slot_185_15_1 = slot_0_23_0.screen_size - arg_185_1
		slot_185_16_1 = math.clamp(slot_185_5_0.x + slot_0_141_0.drag[arg_185_2].drag_position.x, 0, slot_185_15_1.x)
		slot_185_17_1 = math.clamp(slot_185_5_0.y + slot_0_141_0.drag[arg_185_2].drag_position.y, 0, slot_185_15_1.y)
		slot_185_18_1 = 35
		slot_185_19_1 = slot_185_16_1 + arg_185_1.x / 2

		if slot_185_18_1 > math.abs(slot_185_19_1 - slot_185_4_0) then
			slot_185_16_1 = slot_185_4_0 - arg_185_1.x / 2
		end

		slot_0_141_0.database[arg_185_2 .. "_pos_x"] = slot_0_25_0.lerp(slot_0_141_0.database[arg_185_2 .. "_pos_x"], slot_185_16_1, 0.08)
		slot_0_141_0.database[arg_185_2 .. "_pos_y"] = slot_0_25_0.lerp(slot_0_141_0.database[arg_185_2 .. "_pos_y"], slot_185_17_1, 0.08)
	end

	slot_185_15_0 = slot_0_141_0.scale_anim or 1
	slot_185_16_0 = arg_185_0 + arg_185_1 / 2
	slot_185_17_0 = arg_185_1 * slot_185_15_0
	slot_185_18_0 = slot_185_16_0 - slot_185_17_0 / 2

	render.rect_outline(slot_185_18_0 - 6, slot_185_18_0 + slot_185_17_0 + 6, color(255, 255, 255, slot_0_19_0.ui.getalpha() * 150 * arg_185_3), 1, 4)
	render.line(vector(slot_185_4_0, 2), vector(slot_185_4_0, slot_0_23_0.screen_size.y), color(255, 255, 255, slot_0_19_0.ui.getalpha() * 45 * arg_185_3))

	slot_185_19_0 = "PRESS \aFFFFFFFFM2\aDEFAULT TO CENTER"
	slot_185_20_0 = 4
	slot_185_21_0 = render.measure_text(slot_185_20_0, nil, slot_185_19_0)
	slot_185_22_0 = slot_185_18_0.x + slot_185_17_0.x / 2 - slot_185_21_0.x / 2
	slot_185_23_0 = (slot_185_18_0 + slot_185_17_0 + 6).y + 4

	render.text(slot_185_20_0, vector(slot_185_22_0, slot_185_23_0), color(200, 200, 200, slot_0_19_0.ui.getalpha() * 220 * arg_185_3), nil, slot_185_19_0)
end

slot_0_141_0.adjust()
events.mouse_input:set(function()
	if (slot_0_141_0.hovered_something or slot_0_141_0.current_drugging_item) and slot_0_19_0.ui.getalpha() > 0 then
		return false
	end
end)

slot_0_23_0.slowdown_handle = slot_0_21_0.safecall:execute("slowed_down", true, function()
	if not slot_0_23_0.shared_data.able_to_render or not slot_0_9_0.visuals.slowed_down:get() then
		return
	end

	slot_187_0_0 = entity.get_local_player()

	if slot_187_0_0 == nil or not slot_187_0_0:is_alive() then
		return
	end

	slot_187_1_0 = slot_0_19_0.ui.getalpha()
	slot_187_2_0 = slot_187_1_0 == 1 and 0.5 or slot_187_0_0.m_flVelocityModifier
	slot_187_3_0 = slot_0_27_0:new("velocity_modifier", slot_0_141_0.current_drugging_item == "slowed_down" and 100 or slot_187_2_0 == 1 and 0 or 255)

	if slot_187_3_0 < 0.03 then
		return
	end

	slot_187_4_1 = vector(slot_0_141_0.database.slowed_down_pos_x, slot_0_141_0.database.slowed_down_pos_y)
	slot_187_5_0 = slot_187_4_1
	slot_187_6_0 = slot_0_9_0.visuals.accent:get():alpha_modulate(slot_187_3_0)
	slot_187_7_0 = "Max velocity reduced by"
	slot_187_8_0 = slot_0_19_0.render.measure_text(1, nil, slot_187_7_0 .. " 100%")
	slot_187_9_0 = vector(slot_187_8_0.x + 3, 6)

	slot_0_19_0.render.text(1, slot_187_4_1, slot_0_19_0.colors.white:alpha_modulate(slot_187_3_0), nil, slot_0_19_0.string.format(slot_187_7_0 .. " %d%%", slot_187_2_0 * 100))

	slot_187_4_0 = slot_187_4_1 + vector(0, 15)
	slot_187_10_0 = {
		slot_187_4_0 - 1,
		slot_187_4_0 + slot_187_9_0 + 1
	}

	if slot_0_9_0.visuals.slowed_down.style:get() == 1 then
		slot_0_19_0.render.rect(slot_187_10_0[1], slot_187_10_0[2], slot_0_19_0.colors.black:alpha_modulate(slot_0_19_0.math.min(200, slot_187_3_0)), 2)
		slot_0_19_0.render.shadow(slot_187_10_0[1], slot_187_10_0[2], slot_187_6_0, 25, 0, 3)
		slot_0_19_0.render.rect(slot_187_4_0 + 1, slot_187_4_0 + slot_187_9_0 * vector(slot_187_2_0, 1) - 1, slot_187_6_0, 2)
	elseif slot_0_9_0.visuals.slowed_down.style:get() == 2 then
		slot_187_11_0 = color(0, 0, 0, 255):alpha_modulate(slot_187_3_0)

		slot_0_19_0.render.rect(slot_187_10_0[1], slot_187_10_0[2], slot_0_19_0.colors.black:alpha_modulate(slot_0_19_0.math.min(125, slot_187_3_0)), 2)
		render.rect_outline(slot_187_10_0[1], slot_187_10_0[2], color(25, 25, 25, 255):alpha_modulate(slot_0_19_0.math.min(255, slot_187_3_0)), 1, 2)
		slot_0_19_0.render.rect(slot_187_4_0 + 1, slot_187_4_0 + slot_187_9_0 * vector(slot_187_2_0, 1) - 1, slot_187_6_0, 2)
	end

	slot_0_141_0.drag_handle(slot_187_5_0, slot_187_9_0 + vector(1, 15), "slowed_down", slot_187_1_0)
end)

slot_0_11_0.register("render", "ls_utils.slowdown_handle", slot_0_23_0.slowdown_handle)

slot_0_142_0 = {
	gradient = slot_0_3_0.text_animate("S E N S E", -2, {
		color(255, 255, 255),
		color(91, 91, 91)
	}),
	desync = slot_0_3_0.text_animate(".max", -1, {
		color(255, 255, 255),
		color(255, 255, 255)
	})
}
slot_0_142_0.starting_padding = 15
slot_0_143_1 = slot_0_23_0.screen_size / 2

function slot_0_142_0.build_text(arg_188_0, arg_188_1)
	slot_0_142_0.gradient:animate()

	local var_188_0 = arg_188_1 and arg_188_1 or slot_0_9_0.visuals.accent:get():to_hex()
	local var_188_1 = "\a" .. var_188_0 .. "L U A " .. slot_0_142_0.gradient:get_animated_text()

	if slot_0_20_0 == "BETA" then
		var_188_1 = var_188_1 .. " \aEB6161FF[BETA]"
	end

	local var_188_2 = render.measure_text(1, "s", var_188_1)

	return var_188_1, var_188_2
end

function slot_0_142_0.build_desync_max(arg_189_0, arg_189_1)
	slot_0_142_0.gradient:animate()

	local var_189_0 = arg_189_1 and arg_189_1 or slot_0_9_0.visuals.accent:get():to_hex()
	local var_189_1 = "\a" .. var_189_0 .. "luasync" .. slot_0_142_0.desync:get_animated_text()
	local var_189_2 = render.measure_text(1, "s", var_189_1)

	return var_189_1, var_189_2
end

function slot_0_144_1(arg_190_0, arg_190_1)
	local var_190_0 = vector(0, 0)

	if arg_190_1 == "Bottom" then
		var_190_0 = vector(slot_0_143_1.x - arg_190_0.x / 2, slot_0_23_0.screen_center.y * 2 - slot_0_142_0.starting_padding)
	elseif arg_190_1 == "Left" then
		var_190_0 = vector(slot_0_142_0.starting_padding, slot_0_23_0.screen_center.y)
	elseif arg_190_1 == "Right" then
		var_190_0 = vector(slot_0_23_0.screen_size.x - arg_190_0.x - slot_0_142_0.starting_padding, slot_0_23_0.screen_center.y)
	elseif arg_190_1 == "perm" then
		var_190_0 = vector(slot_0_143_1.x - 20, slot_0_23_0.screen_center.y - slot_0_23_0.screen_center.y + 15)
	else
		var_190_0 = vector(slot_0_143_1.x - arg_190_0.x / 2, slot_0_23_0.screen_center.y * 2 - slot_0_142_0.starting_padding)
	end

	return var_190_0 + arg_190_0
end

slot_0_142_0.render = slot_0_21_0.safecall:execute("watermark_render", true, function()
	if not globals.is_in_game then
		return
	end

	local var_191_0, var_191_1 = pcall(function()
		local var_192_0 = slot_0_9_0.visuals.watermark:get()
		local var_192_1 = slot_0_9_0.visuals.watermark_style:get()
		local var_192_2
		local var_192_3

		if var_192_1 == 1 then
			var_192_2, var_192_3 = slot_0_142_0.build_text()

			if not var_192_2 or not var_192_3 then
				return
			end
		elseif var_192_1 == 2 then
			var_192_2 = "LUASENSE"
			var_192_3 = render.measure_text(1, "s", var_192_2 .. "  ")
		elseif var_192_1 == 3 then
			var_192_2, var_192_3 = slot_0_142_0.build_desync_max()

			if not var_192_2 or not var_192_3 then
				return
			end
		end

		if not slot_0_143_1 then
			return
		end

		local var_192_4 = slot_0_144_1(var_192_3, var_192_0)
		local var_192_5 = slot_0_144_1(var_192_3, "perm")

		if var_192_1 == 1 then
			render.text(1, var_192_4 - var_192_3, color(255), "s", var_192_2)
		elseif var_192_1 == 2 then
			render.text(1, var_192_4 - var_192_3, color(255), "s", slot_0_23_0:with_icon("star", var_192_2, slot_0_9_0.visuals.accent:get():to_hex()))
		elseif var_192_1 == 3 then
			render.text(1, var_192_4 - var_192_3, color(255), "s", var_192_2)
		end
	end)

	if not var_191_0 then
		print("Rendering error:", var_191_1)
	end
end)

slot_0_11_0.register("render", "watermark.render", slot_0_142_0.render)
events.createmove(function(...)
	local var_193_0 = entity.get_local_player()

	if var_193_0 == nil or not var_193_0:is_alive() then
		return
	end

	slot_0_23_0.antiaim(...)
end)

slot_0_143_0 = render.world_to_screen
slot_0_144_0 = render.rect
slot_0_145_0 = render.screen_size
slot_0_146_0 = ui.find
slot_0_147_0 = 0.5
slot_0_148_0 = 1
slot_0_149_0 = {}

function slot_0_150_0()
	if not slot_0_9_0.visuals.kibit_hitmark:get() then
		return
	end

	for iter_194_0, iter_194_1 in pairs(slot_0_149_0) do
		if iter_194_1.FadeTime <= 0 then
			slot_0_149_0[iter_194_0] = nil
		else
			iter_194_1.WaitTime = iter_194_1.WaitTime - globals.frametime

			if iter_194_1.WaitTime <= 0 then
				iter_194_1.FadeTime = iter_194_1.FadeTime - 1 / slot_0_147_0 * globals.frametime
			end

			if iter_194_1.Position.x ~= nil and iter_194_1.Position.y ~= nil and iter_194_1.Position.z ~= nil then
				local var_194_0 = slot_0_143_0(vector(iter_194_1.Position.x, iter_194_1.Position.y, iter_194_1.Position.z))

				if var_194_0 ~= nil then
					local var_194_1 = var_194_0.x
					local var_194_2 = var_194_0.y
					local var_194_3 = slot_0_145_0()
					local var_194_4 = slot_0_9_0.visuals.kibit_hitmark.kibit_hitmark_color:get()
					local var_194_5 = var_194_4:override("a", var_194_4.a * iter_194_1.FadeTime)

					slot_0_144_0(vector(var_194_1 - 1 / var_194_3.x * var_194_3.x, var_194_2 - 5 / var_194_3.y * var_194_3.y), vector(var_194_1 + 1 / var_194_3.x * var_194_3.x, var_194_2 + 5 / var_194_3.y * var_194_3.y), var_194_5, 0, true)
					slot_0_144_0(vector(var_194_1 - 5 / var_194_3.x * var_194_3.x, var_194_2 - 1 / var_194_3.y * var_194_3.y), vector(var_194_1 + 5 / var_194_3.x * var_194_3.x, var_194_2 + 1 / var_194_3.y * var_194_3.y), var_194_5, 0, true)
				end
			end
		end
	end
end

slot_0_11_0.register("render", "paint_kibit", slot_0_150_0)

function slot_0_151_0(arg_195_0)
	slot_0_149_0[arg_195_0.id] = {
		FadeTime = 1,
		Position = arg_195_0.aim,
		WaitTime = slot_0_148_0,
		Reason = arg_195_0.state
	}
end

slot_0_152_0 = {
	reason_redirect = {
		["prediction error"] = "pred. error"
	}
}
slot_0_152_0.last_tick_triggered = 0

function slot_0_152_0.aim_ack(arg_196_0)
	slot_0_151_0(arg_196_0)

	if not slot_0_9_0.misc.log_event:get(1) and not slot_0_9_0.visuals.notifs:get() then
		return
	end

	local var_196_0 = arg_196_0.target

	if var_196_0 == nil then
		return
	end

	local var_196_1 = slot_0_152_0.reason_redirect[arg_196_0.state] or arg_196_0.state
	local var_196_2 = var_196_0:get_name()
	local var_196_3 = var_196_0.m_iHealth
	local var_196_4 = arg_196_0.spread
	local var_196_5 = arg_196_0.backtrack
	local var_196_6 = arg_196_0.hitchance
	local var_196_7 = arg_196_0.damage
	local var_196_8 = arg_196_0.wanted_damage
	local var_196_9 = slot_0_23_0.hitgroups[arg_196_0.hitgroup] or "?"
	local var_196_10 = slot_0_23_0.hitgroups[arg_196_0.wanted_hitgroup] or "?"
	local var_196_11 = slot_0_9_0.visuals.accent:get():to_hex()

	if var_196_1 == nil then
		local var_196_12 = string.format("\a%sRegistered \aDEFAULTshot at %s's %s for \a%s%d(%d) \aDEFAULTdamage (hp: \a%s%d\aDEFAULT) (aimed: \a%s%s\aDEFAULT) (bt: \a%s%s\aDEFAULT) (spread: \a%s%.1f°\aDEFAULT)", var_196_11, var_196_2, var_196_9, var_196_11, var_196_7, var_196_8, var_196_11, var_196_3, var_196_11, var_196_10, var_196_11, var_196_5, var_196_11, var_196_4)

		slot_0_23_0:branded_printing(var_196_12)

		return
	end

	local var_196_13 = string.format("\a%sMissed \aDEFAULTshot at %s's %s due to \a%s%s \aDEFAULT(hc: \a%s%d%%\aDEFAULT) (damage: \a%s%d\aDEFAULT) (bt: \a%s%s\aDEFAULT)", var_196_11, var_196_2, var_196_10, var_196_11, var_196_1, var_196_11, var_196_6, var_196_11, var_196_8, var_196_11, var_196_5)
	local var_196_14 = string.format("\a%sMissed \aDEFAULTshot at \a%s%s\aDEFAULT's %s due to \a%s%s\aDEFAULT(%d%%) [damage: \a%s%d \aDEFAULT bt: \a%s%s\aDEFAULT", var_196_11, var_196_2, var_196_11, var_196_10, var_196_11, var_196_1, var_196_6, var_196_11, var_196_8, var_196_11, var_196_5)

	if var_196_4 ~= nil then
		var_196_13 = string.format("%s (spread: \a%s%.1f°\aDEFAULT)", var_196_13, var_196_11, var_196_4)
	end

	slot_0_23_0:branded_printing(var_196_13)

	if slot_0_9_0.visuals.notifs:get() then
		local var_196_15 = slot_0_9_0.visuals.notifs.notifs_miss_clr:get()
		local var_196_16 = "\a" .. var_196_15:to_hex()

		slot_0_12_0.push(string.format("Missed %s%s\aDEFAULT's %s%s\aDEFAULT due to %s%s\aDEFAULT!", var_196_16, var_196_2, var_196_16, var_196_10, var_196_16, var_196_1), var_196_15)
	end
end

function slot_0_12_0.hurt(arg_197_0)
	local var_197_0 = entity.get_local_player()
	local var_197_1 = slot_0_19_0.entity.get(arg_197_0.userid, true)
	local var_197_2 = slot_0_19_0.entity.get(arg_197_0.attacker, true)

	if var_197_0 == nil or var_197_1 == nil or var_197_2 == nil then
		return
	end

	if var_197_1 == var_197_0 or var_197_2 ~= var_197_0 then
		return
	end

	local var_197_3 = slot_0_19_0.weapon_actions[arg_197_0.weapon] or "Hit"
	local var_197_4 = slot_0_19_0.hitgroups[arg_197_0.hitgroup] or "?"
	local var_197_5 = slot_0_9_0.visuals.notifs.notifs_hit_clr:get()
	local var_197_6 = slot_0_19_0.string_ops.to_hex(var_197_5)

	slot_0_12_0.push(slot_0_19_0.string.format("%s \a%s%s\aDEFAULT's \a%s%s \aDEFAULTfor \a%s%s\aDEFAULT!", var_197_3, var_197_6, slot_0_19_0.entity_methods.get_name(var_197_1), var_197_6, var_197_4, var_197_6, arg_197_0.dmg_health), var_197_5)
end

function slot_0_152_0.handle_hurt(arg_198_0)
	local var_198_0 = entity.get_local_player()
	local var_198_1 = slot_0_19_0.entity.get(arg_198_0.userid, true)
	local var_198_2 = slot_0_19_0.entity.get(arg_198_0.attacker, true)

	if var_198_0 == nil or var_198_1 == nil or var_198_2 == nil then
		return
	end

	if var_198_1 == var_198_0 or var_198_2 ~= var_198_0 then
		return
	end

	local var_198_3 = slot_0_23_0.wpn2act[arg_198_0.weapon]

	if var_198_3 == nil then
		return
	end

	local var_198_4 = slot_0_9_0.visuals.accent:get():to_hex()
	local var_198_5 = slot_0_19_0.entity_methods.get_name(var_198_1)
	local var_198_6 = slot_0_19_0.string.format("%s \a%s%s \aDEFAULTfor \a%s%d \aDEFAULTdamage (%d health remaining)", var_198_3, var_198_4, var_198_5:lower(), var_198_4, arg_198_0.dmg_health, arg_198_0.health)

	slot_0_23_0:branded_printing(var_198_6)
end

function slot_0_152_0.handle_purchase(arg_199_0)
	if not slot_0_9_0.misc.log_event:get(2) then
		return
	end

	local var_199_0 = slot_0_19_0.entity.get(arg_199_0.userid, true)

	if var_199_0 == nil or not slot_0_19_0.entity_methods.is_enemy(var_199_0) then
		return
	end

	local var_199_1 = arg_199_0.weapon

	if var_199_1 == "weapon_unknown" then
		return
	end

	local var_199_2 = slot_0_19_0.entity_methods.get_name(var_199_0)
	local var_199_3 = slot_0_9_0.visuals.accent:get():to_hex()
	local var_199_4 = slot_0_19_0.string.format("\a%s%s \aDEFAULTbought \a%s%s", var_199_3, slot_0_19_0.string.lower(var_199_2), var_199_3, var_199_1)

	slot_0_23_0:branded_printing(var_199_4)
end

function slot_0_152_0.player_hurt(arg_200_0)
	if slot_0_9_0.misc.log_event:get(1) then
		slot_0_152_0.handle_hurt(arg_200_0)
	end

	if slot_0_9_0.visuals.notifs:get() then
		slot_0_12_0.hurt(arg_200_0)
	end
end

slot_0_11_0.register("item_purchase", "hitlogs.handle_purchase", slot_0_152_0.handle_purchase)
slot_0_11_0.register("aim_ack", "hitlogs.aim_ack", slot_0_152_0.aim_ack)
slot_0_11_0.register("player_hurt", "hitlogs.player_hurt", slot_0_152_0.player_hurt)
slot_0_11_0.register("shutdown", "draggables_shut", function()
	db.luasense_draggable2 = slot_0_141_0.database
end)
events.createmove:set(slot_0_21_0.safecall:execute("ls_utils.collect_render_shared_info", true, function()
	slot_0_21_0.shared:collect_render_info()
end))
events.createmove:set(slot_0_21_0.safecall:execute("ls_utils.collect", true, function()
	slot_0_21_0.shared:collect()
end))
events.round_end:set(function()
	slot_0_23_0.brute_modifier = 0
	slot_0_23_0.brute_modifier_ct = 0
	slot_0_23_0.active_brute = false
	slot_0_23_0.round_end = true
end)
events.round_start:set(function()
	slot_0_23_0.round_end = false
	slot_0_23_0.freezetime = true
end)
events.round_freeze_end:set(function()
	slot_0_23_0.freezetime = false
end)
events.render:set(function()
	slot_0_73_0.handle()
	slot_0_73_0.spectators()
	slot_0_78_0:visibility(slot_0_9_0.visuals.gs_inds:get())
	slot_0_79_0:visibility(slot_0_9_0.visuals.gs_inds:get())
	slot_0_83_0.draw()

	if slot_0_19_0.ui.getalpha() > 0 then
		slot_0_9_0.visibility_handler()
	end

	slot_0_23_0.handle_aspect()
end)
events.render:set(function()
	if slot_0_19_0.ui.getalpha() > 0 then
		local var_208_0 = slot_0_19_0.ui.get_style("Link Active")
		local var_208_1 = slot_0_3_0.text_animate("LuaSense", -1, {
			var_208_0,
			slot_0_19_0.colors.white
		})

		slot_0_1_0.sidebar(var_208_1:get_animated_text(), "hand-sparkles")
		var_208_1:animate()
	end
end)
events.bomb_defused:set(function(arg_209_0)
	slot_0_74_0.reset_bomb()
end)
events.bomb_planted:set(function(arg_210_0)
	slot_0_74_0.reset_bomb()
end)
events.bomb_abortplant:set(function(arg_211_0)
	slot_0_74_0.reset_bomb()
end)
events.round_prestart:set(function(arg_212_0)
	slot_0_74_0.reset_bomb()
end)
events.bomb_beginplant:set(function(arg_213_0)
	slot_0_74_0.bomb_beginplant(arg_213_0)
end)
slot_0_23_0.clantag:run()
slot_0_1_0.setup(slot_0_9_0)
