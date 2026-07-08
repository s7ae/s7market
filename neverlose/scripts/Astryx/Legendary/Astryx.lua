--by scriptleaks https://discord.gg/n4DpEunxbj t.me/scriptleakslol

gradient_ok, gradient_mod = pcall(require, "neverlose/gradient")

if not gradient_ok then
	print_raw("gradient load failed: " .. tostring(gradient_mod))

	gradient_mod = nil
end

function gradient_text_animate(arg_1_0, arg_1_1, arg_1_2)
	if not gradient_mod or not gradient_mod.text_animate then
		return nil
	end

	local var_1_0, var_1_1 = pcall(function()
		return gradient_mod.text_animate(arg_1_0, arg_1_1, arg_1_2)
	end)

	if not var_1_0 then
		print_raw("gradient anim failed: " .. tostring(var_1_1))
	end

	return var_1_1
end

anti_aim_mod = require("neverlose/anti_aim")
base64_mod = require("neverlose/base64")
pui_mod = require("neverlose/pui")
clipboard_mod = require("neverlose/clipboard")
bomb_mod = require("neverlose/bomb")

ffi.cdef(" \ntypedef struct { \n    char pad_0000[20];\n    int m_nOrder;\n    int m_nSequence; \n    float m_flPrevCycle; \n    float m_flWeight; \n    float m_flWeightDeltaRate; \n    float m_flPlaybackRate; \n    float m_flCycle; \n    void *m_pOwner; \n    char pad_0038[4];\n    } animstate_layer_t;\n")

ffi_ptr_type = ffi.typeof("uintptr_t**")
get_client_entity = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
rage_cfg = {
	min_damage = {
		global = ui.find("Aimbot", "Ragebot", "Selection", "Global", "Min. Damage"),
		pistols = ui.find("Aimbot", "Ragebot", "Selection", "Pistols", "Min. Damage"),
		autosnipers = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Min. Damage"),
		awpnaxyi = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Min. Damage"),
		scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Min. Damage"),
		deagle = ui.find("Aimbot", "Ragebot", "Selection", "Desert Eagle", "Min. Damage"),
		revik = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Min. Damage"),
		taser = ui.find("Aimbot", "Ragebot", "Selection", "Taser", "Min. Damage"),
		prsnipers = ui.find("Aimbot", "Ragebot", "Selection", "Snipers", "Min. Damage"),
		rifles = ui.find("Aimbot", "Ragebot", "Selection", "Rifles", "Min. Damage"),
		smgs = ui.find("Aimbot", "Ragebot", "Selection", "SMGs", "Min. Damage"),
		shotguns = ui.find("Aimbot", "Ragebot", "Selection", "Shotguns", "Min. Damage"),
		machiguns = ui.find("Aimbot", "Ragebot", "Selection", "Machineguns", "Min. Damage"),
		vityaAK47 = ui.find("Aimbot", "Ragebot", "Selection", "AK-47", "Min. Damage"),
		m4ma1 = ui.find("Aimbot", "Ragebot", "Selection", "M4A1/M4A4", "Min. Damage"),
		AUG = ui.find("Aimbot", "Ragebot", "Selection", "AUG/SG 553", "Min. Damage")
	},
	hitchance = {
		global = ui.find("Aimbot", "Ragebot", "Selection", "Global", "Hit Chance"),
		pistols = ui.find("Aimbot", "Ragebot", "Selection", "Pistols", "Hit Chance"),
		autosnipers = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"),
		awp = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"),
		scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"),
		deagle = ui.find("Aimbot", "Ragebot", "Selection", "Desert Eagle", "Hit Chance"),
		revolver = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"),
		rifles = ui.find("Aimbot", "Ragebot", "Selection", "Rifles", "Hit Chance"),
		smgs = ui.find("Aimbot", "Ragebot", "Selection", "SMGs", "Hit Chance"),
		shotguns = ui.find("Aimbot", "Ragebot", "Selection", "Shotguns", "Hit Chance"),
		machineguns = ui.find("Aimbot", "Ragebot", "Selection", "Machineguns", "Hit Chance")
	},
	multipoints = {
		global = ui.find("Aimbot", "Ragebot", "Selection", "Global", "Multipoint"),
		pistols = ui.find("Aimbot", "Ragebot", "Selection", "Pistols", "Multipoint"),
		autosnipers = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Multipoint"),
		awpblya = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Multipoint"),
		scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Multipoint"),
		deagle = ui.find("Aimbot", "Ragebot", "Selection", "Desert Eagle", "Multipoint"),
		revik = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Multipoint"),
		taser = ui.find("Aimbot", "Ragebot", "Selection", "Taser", "Multipoint"),
		prsnipers = ui.find("Aimbot", "Ragebot", "Selection", "Snipers", "Multipoint"),
		rifles = ui.find("Aimbot", "Ragebot", "Selection", "Rifles", "Multipoint"),
		smgs = ui.find("Aimbot", "Ragebot", "Selection", "SMGs", "Multipoint"),
		shotguns = ui.find("Aimbot", "Ragebot", "Selection", "Shotguns", "Multipoint"),
		machiguns = ui.find("Aimbot", "Ragebot", "Selection", "Machineguns", "Multipoint"),
		vityaAK47 = ui.find("Aimbot", "Ragebot", "Selection", "AK-47", "Multipoint"),
		m4ma1 = ui.find("Aimbot", "Ragebot", "Selection", "M4A1/M4A4", "Multipoint"),
		AUG = ui.find("Aimbot", "Ragebot", "Selection", "AUG/SG 553", "Multipoint")
	},
	hitboxes = {
		global = ui.find("Aimbot", "Ragebot", "Selection", "Global", "Hitboxes"),
		pistols = ui.find("Aimbot", "Ragebot", "Selection", "Pistols", "Hitboxes"),
		autosnipers = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hitboxes"),
		awpblya = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hitboxes"),
		scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hitboxes"),
		deagle = ui.find("Aimbot", "Ragebot", "Selection", "Desert Eagle", "Hitboxes"),
		revik = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hitboxes"),
		taser = ui.find("Aimbot", "Ragebot", "Selection", "Taser", "Hitboxes"),
		prsnipers = ui.find("Aimbot", "Ragebot", "Selection", "Snipers", "Hitboxes"),
		rifles = ui.find("Aimbot", "Ragebot", "Selection", "Rifles", "Hitboxes"),
		smgs = ui.find("Aimbot", "Ragebot", "Selection", "SMGs", "Hitboxes"),
		shotguns = ui.find("Aimbot", "Ragebot", "Selection", "Shotguns", "Hitboxes"),
		machiguns = ui.find("Aimbot", "Ragebot", "Selection", "Machineguns", "Hitboxes"),
		vityaAK47 = ui.find("Aimbot", "Ragebot", "Selection", "AK-47", "Hitboxes"),
		m4ma1 = ui.find("Aimbot", "Ragebot", "Selection", "M4A1/M4A4", "Hitboxes"),
		AUG = ui.find("Aimbot", "Ragebot", "Selection", "AUG/SG 553", "Hitboxes")
	},
	body_aim = {
		global = ui.find("Aimbot", "Ragebot", "Safety", "Global", "Body Aim"),
		pistols = ui.find("Aimbot", "Ragebot", "Safety", "Pistols", "Body Aim"),
		autosnipers = ui.find("Aimbot", "Ragebot", "Safety", "AutoSnipers", "Body Aim"),
		awpblya = ui.find("Aimbot", "Ragebot", "Safety", "AWP", "Body Aim"),
		scout = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Body Aim"),
		deagle = ui.find("Aimbot", "Ragebot", "Safety", "Desert Eagle", "Body Aim"),
		revik = ui.find("Aimbot", "Ragebot", "Safety", "R8 Revolver", "Body Aim"),
		taser = ui.find("Aimbot", "Ragebot", "Safety", "Taser", "Body Aim"),
		prsnipers = ui.find("Aimbot", "Ragebot", "Safety", "Snipers", "Body Aim"),
		rifles = ui.find("Aimbot", "Ragebot", "Safety", "Rifles", "Body Aim"),
		smgs = ui.find("Aimbot", "Ragebot", "Safety", "SMGs", "Body Aim"),
		shotguns = ui.find("Aimbot", "Ragebot", "Safety", "Shotguns", "Body Aim"),
		machiguns = ui.find("Aimbot", "Ragebot", "Safety", "Machineguns", "Body Aim"),
		vityaAK47 = ui.find("Aimbot", "Ragebot", "Safety", "AK-47", "Body Aim"),
		m4ma1 = ui.find("Aimbot", "Ragebot", "Safety", "M4A1/M4A4", "Body Aim"),
		AUG = ui.find("Aimbot", "Ragebot", "Safety", "AUG/SG 553", "Body Aim")
	},
	force_safe_point = {
		global = ui.find("Aimbot", "Ragebot", "Safety", "Global", "Safe Points"),
		pistols = ui.find("Aimbot", "Ragebot", "Safety", "Pistols", "Safe Points"),
		autosnipers = ui.find("Aimbot", "Ragebot", "Safety", "AutoSnipers", "Safe Points"),
		awpblya = ui.find("Aimbot", "Ragebot", "Safety", "AWP", "Safe Points"),
		scout = ui.find("Aimbot", "Ragebot", "Safety", "SSG-08", "Safe Points"),
		deagle = ui.find("Aimbot", "Ragebot", "Safety", "Desert Eagle", "Safe Points"),
		revik = ui.find("Aimbot", "Ragebot", "Safety", "R8 Revolver", "Safe Points"),
		taser = ui.find("Aimbot", "Ragebot", "Safety", "Taser", "Safe Points"),
		prsnipers = ui.find("Aimbot", "Ragebot", "Safety", "Snipers", "Safe Points"),
		rifles = ui.find("Aimbot", "Ragebot", "Safety", "Rifles", "Safe Points"),
		smgs = ui.find("Aimbot", "Ragebot", "Safety", "SMGs", "Safe Points"),
		shotguns = ui.find("Aimbot", "Ragebot", "Safety", "Shotguns", "Safe Points"),
		machiguns = ui.find("Aimbot", "Ragebot", "Safety", "Machineguns", "Safe Points"),
		vityaAK47 = ui.find("Aimbot", "Ragebot", "Safety", "AK-47", "Safe Points"),
		m4ma1 = ui.find("Aimbot", "Ragebot", "Safety", "M4A1/M4A4", "Safe Points"),
		AUG = ui.find("Aimbot", "Ragebot", "Safety", "AUG/SG 553", "Safe Points")
	},
	dormant = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
	hideshots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
	unlock_hidden = ui.find("Miscellaneous", "Main", "Other", "Unlock Hidden Cvars"),
	scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
	aa_enable = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
	aa_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	aa_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
	aa_yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
	aa_manual = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	aa_manual2 = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	aa_yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
	aa_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
	aa_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
	aa_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
	aa_hidden = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
	aa_bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
	doubletapfin = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
	fakedick = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	fakexyetensi = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
	aa_slowwalk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	leg_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
	body_right = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
	body_left = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
	body_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
	pitch_select = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	strafe = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe"),
	strafe_smooth = ui.find("Miscellaneous", "Main", "Movement", "Air Strafe", "Smoothing"),
	freestand = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	dt = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
	dt_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
	dt_lag = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options")
}
num_const = 0
const_0197 = 0
dummy_0067 = nil
dummy_0081 = nil
val_0165 = "Standing"
const_0198 = 0
const_0199 = 6
dummy_0073 = nil
val_0148 = false
const_0193 = 0
const_0195 = 0
const_0192 = 0
ui_ui = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay")
cfg_0151 = {
	active = false,
	values = {}
}
cfg_0153 = {
	counter = 0,
	state = "fast"
}
v_0123 = gradient_text_animate("Astryx Legendary", -2.2, {
	ui.get_style("Link Active"),
	color(0, 0, 0, 255)
})
cfg_0164 = {
	home = {
		main = pui_mod.create(ui.get_icon("female"), "\nHome", 1),
		cfg = pui_mod.create(ui.get_icon("window-maximize"), "Config System", 1),
		info = pui_mod.create(ui.get_icon("window-maximize"), "Info", 2)
	},
	antiaim = {
		main = pui_mod.create(ui.get_icon("female"), "\nAnti Aim", 2),
		conditions = pui_mod.create(ui.get_icon("users"), "Conditions", 1),
		manuals = pui_mod.create(ui.get_icon("users"), "Helpers", 1),
		extension = pui_mod.create(ui.get_icon("users"), "Other", 1),
		global = pui_mod.create(ui.get_icon("users"), "Global", 2),
		baseys = pui_mod.create(ui.get_icon("users"), "Yaw Base", 2),
		builder = pui_mod.create(ui.get_icon("users"), "Builder", 2)
	},
	other = {
		main = pui_mod.create(ui.get_icon("area-chart"), "\nOther", 3),
		misc = pui_mod.create(ui.get_icon("cubes"), "Misc", 1),
		visual = pui_mod.create(ui.get_icon("cubes"), "Visual", 2),
		rage = pui_mod.create(ui.get_icon("cubes"), "Rage", 1),
		helpers = pui_mod.create(ui.get_icon("cubes"), "Helpers", 2)
	}
}
cfg_0155 = {
	"Standing",
	"Moving",
	"Walking",
	"Slow Walk",
	"Crouching",
	"Crouch Moving",
	"Air",
	"Air Duck"
}

cfg_0164.home.info:label(ui.get_icon("paw") .. " Welcome back: " .. tostring(common.get_username() or "user"))
cfg_0164.home.info:label(ui.get_icon("database") .. " Builder: Legendary")
cfg_0164.home.info:label(ui.get_icon("moon") .. "Last Update: 12.03.2026")

cfg_0152 = {
	owner_cfg = "https://neverlose.cc/market/?search=author%3Akaizo&type=0",
	owner_youtube = "https://www.youtube.com/@yukihvh/featured",
	codder_youtube = "https://www.youtube.com/@Mentanolhvh",
	codder_cfg = "https://ru.neverlose.cc/market/?page=0&search=mentanol&sort=drec0&type=0&filter=0",
	rickroll = "https://www.youtube.com/watch?v=HRbW75fYLvo&t=1s"
}

function on_createmove(arg_3_0)
	if arg_3_0 and arg_3_0 ~= "" then
		panorama.SteamOverlayAPI.OpenExternalBrowserURL(arg_3_0)
	end
end

cfg_0164.home.info:button(" "):set_callback(function()
	on_createmove(cfg_0152.rickroll)
end)
cfg_0164.home.info:button("Codder Cfg"):set_callback(function()
	on_createmove(cfg_0152.codder_cfg)
end)
cfg_0164.home.info:button("Codder YouTube"):set_callback(function()
	on_createmove(cfg_0152.codder_youtube)
end)
cfg_0164.home.info:button("Owner Cfg"):set_callback(function()
	on_createmove(cfg_0152.owner_cfg)
end)
cfg_0164.home.info:button("Owner YouTube"):set_callback(function()
	on_createmove(cfg_0152.owner_youtube)
end)

cfg_0161 = {
	list = cfg_0164.home.cfg:list("Configs", {
		"Default"
	}),
	name = cfg_0164.home.cfg:input("Name"),
	save = cfg_0164.home.cfg:button(ui.get_icon("floppy-disk") .. " Save"),
	load = cfg_0164.home.cfg:button(ui.get_icon("upload") .. " Load"),
	delete = cfg_0164.home.cfg:button(ui.get_icon("trash") .. " Delete"),
	export = cfg_0164.home.cfg:button(ui.get_icon("share-nodes") .. " Export"),
	import = cfg_0164.home.cfg:button(ui.get_icon("file-import") .. " Import")
}
val_0156 = db.astryx_configs or {}
db.astryx_configs = val_0156
empty_0009 = {}

if rage_cfg.unlock_hidden then
	rage_cfg.unlock_hidden:set(true)
end

val_0159 = "@Astryx"
val_0150 = ""
empty_0008 = {}
const_0171 = 0.5
const_0185 = 0

for iter_0_0 = 1, #val_0159 do
	empty_0008[#empty_0008 + 1] = val_0159:sub(1, iter_0_0)
end

for iter_0_1 = #val_0159 - 1, 1, -1 do
	empty_0008[#empty_0008 + 1] = val_0159:sub(1, iter_0_1)
end

const_0186 = 1
dummy_0086 = nil
v_0120 = cfg_0164.other.misc:switch("\f<avocado> Clan Tag", false)
v_0115 = cfg_0164.other.visual:switch("\f<lightbulb> Aspect Ratio", false, nil, function(arg_9_0)
	dummy_0086 = arg_9_0:slider("Aspect", 0, 300, 177)

	return {
		b32 = arg_9_0:button("3:2"),
		b43 = arg_9_0:button("4:3"),
		b54 = arg_9_0:button("5:4"),
		b169 = arg_9_0:button("16:9"),
		b1610 = arg_9_0:button("16:10")
	}
end)
cfg_0163 = {
	choked_commands = 0,
	command_number = 0,
	ticks_processed = 0,
	tickbase_difference = 0,
	max_process_ticks = cvar.sv_maxusrcmdprocessticks:int() - 1,
	reset = function(arg_10_0)
		arg_10_0.ticks_processed = 0
		arg_10_0.tickbase_difference = 0
		arg_10_0.choked_commands = 0
		arg_10_0.command_number = 0
	end,
	is_active = function(arg_11_0)
		return rage_cfg.doubletapfin:get()
	end
}

function render_crosshair_8(arg_12_0, arg_12_1, arg_12_2)
	return arg_12_0 + (arg_12_1 - arg_12_0) * arg_12_2
end

menu = menu or {}
menu.render = menu.render or {}
menu.render.viewmodel = {}
v_0118 = cfg_0164.other.visual:switch("\f<camera> Viewmodel", false, nil, function(arg_13_0)
	menu.render.viewmodel.enable = arg_13_0:switch("Enable", true)
	menu.render.viewmodel.default = arg_13_0:switch("Use default", false)
	menu.render.viewmodel.fov = arg_13_0:slider("FOV", 0, 1400, 600)
	menu.render.viewmodel.x = arg_13_0:slider("Offset X", -200, 200, 10)
	menu.render.viewmodel.y = arg_13_0:slider("Offset Y", -200, 200, 10)
	menu.render.viewmodel.z = arg_13_0:slider("Offset Z", -200, 200, -10)
	menu.render.viewmodel.opposite_knife = arg_13_0:switch("Knife left hand", false)
end)

function menu.render.viewmodel.get()
	return v_0118:get()
end

v_0125 = gradient_text_animate("Astryx", -6, {
	color(255, 255, 255),
	color(255, 255, 255)
})
empty_0007 = {}
render_load_font_2 = render.load_font("Verdana", 13, "abc")

function render_crosshair_9()
	if rage and rage.exploit and rage.exploit.get then
		local var_15_0, var_15_1 = pcall(function()
			return rage.exploit:get()
		end)

		if var_15_0 then
			if type(var_15_1) == "number" then
				return math.clamp(var_15_1, 0, 1)
			elseif type(var_15_1) == "boolean" then
				return var_15_1 and 1 or 0
			end
		end
	end

	return rage_cfg.doubletapfin:get() and 1 or 0
end

const_0180 = 0
const_0176 = 0

function render_crosshair_10(arg_17_0, arg_17_1)
	if type(arg_17_0) ~= "table" then
		return arg_17_0 == arg_17_1
	end

	for iter_17_0, iter_17_1 in ipairs(arg_17_0) do
		if iter_17_1 == arg_17_1 then
			return true
		end
	end

	return false
end

cfg_0157 = {
	wm_font = render.load_font("Verdana", 14, "ab"),
	skeet_font = render.load_font("Calibri Bold", 24, "ad"),
	modern_font = render.load_font("Verdana", 20, "ab")
}
const_0170 = 20
const_0168 = 20
val_0146 = false
const_0167 = 0
const_0187 = 0
v_0121 = cfg_0164.other.visual:switch("\f<bookmark> Watermark", false, nil, function(arg_18_0)
	local var_18_0 = empty_0007

	var_18_0.wm_type = arg_18_0:selectable("Type", {
		"Indicator",
		"Watermark",
		"Crosshair"
	}, true)
	var_18_0.text = arg_18_0:list("Text", {
		"Astryx",
		"Moon",
		"luck 100%"
	})
	var_18_0.mode = arg_18_0:list("Mode", {
		"Static",
		"Gradient"
	})
	var_18_0.elements = arg_18_0:selectable("Elements", {
		"FPS",
		"Ping",
		"Session time",
		"Username"
	}, true)
	var_18_0.cr1 = arg_18_0:color_picker("Color 1", color(255, 255, 255))
	var_18_0.cr2 = arg_18_0:color_picker("Color 2", color(20, 20, 20, 200))
	var_18_0.spd = arg_18_0:slider("Gradient Speed", 1, 10, 4)

	local function var_18_1()
		local var_19_0 = var_18_0.wm_type:get()
		local var_19_1 = render_crosshair_10(var_19_0, "Indicator")
		local var_19_2 = render_crosshair_10(var_19_0, "Watermark")
		local var_19_3 = render_crosshair_10(var_19_0, "Crosshair")

		var_18_0.text:visibility(var_19_1)
		var_18_0.mode:visibility(var_19_1)
		var_18_0.elements:visibility(var_19_2)
	end

	var_18_0.wm_type:set_callback(var_18_1)
	var_18_1()

	return var_18_0
end)
v_0119 = gradient_text_animate("Astryx", -6, {
	color(255, 255, 255),
	color(255, 255, 255)
})

function render_crosshair_11()
	if not v_0121:get() then
		return
	end

	render_screen_size = render.screen_size()
	const_0175 = 1
	ref_0047 = empty_0007.cr1:get()
	ref_0046 = empty_0007.cr2:get()
	ref_0045 = empty_0007.wm_type:get()

	if render_crosshair_10(ref_0045, "Indicator") then
		val_0144 = ({
			"Astryx Legendary",
			"Moon",
			"luck 100%"
		})[empty_0007.text:get()] or "Astryx Legendary"

		v_0119:set_text(val_0144)
		v_0119:set_colors({
			ref_0047,
			color(255, 255, 255)
		})
		v_0119:set_speed(-empty_0007.spd:get())
		v_0119:animate()

		ref_0049 = v_0119:get_animated_text()
		render_measure_text_3 = render.measure_text(const_0175, ref_0049)
		vec_0065 = vector(render_screen_size.x / 2 - render_measure_text_3.x / 2 - 15, render_screen_size.y - 18)

		if empty_0007.mode:get() == 1 then
			render.text(const_0175, vec_0065, ref_0047, nil, val_0144)
		else
			v_0125:set_text(val_0144)
			v_0125:set_colors({
				ref_0047,
				ref_0046
			})
			v_0125:set_speed(-empty_0007.spd:get() * 0.5)
			v_0125:animate()
			render.text(const_0175, vec_0065, color(255, 255, 255), nil, v_0125:get_animated_text())
		end
	end

	if render_crosshair_10(ref_0045, "Watermark") then
		ref_0050 = empty_0007.elements:get() or {}
		e_0002 = {}

		for iter_20_0, iter_20_1 in ipairs(ref_0050) do
			if iter_20_1 == "FPS" then
				math_floor_4 = math.floor(1 / globals.frametime)

				table.insert(e_0002, ui.get_icon("gauge") .. " " .. string.format("%03d", math_floor_4))
			end

			if iter_20_1 == "Ping" then
				const_0182 = 0
				utils_net_channel = utils.net_channel()

				if utils_net_channel then
					val_0141 = (utils_net_channel.avg_latency[0] or 0) + (utils_net_channel.avg_latency[1] or 0)
					val_0135 = (utils_net_channel.latency[0] - utils_net_channel.avg_latency[0]) * 0.5
					const_0182 = math.floor((val_0141 + val_0135) * 1000 + 0.5)
				end

				table.insert(e_0002, ui.get_icon("wifi") .. " " .. const_0182)
			end

			if iter_20_1 == "Session time" then
				math_floor_3 = math.floor(globals.realtime)
				math_floor_5 = math.floor(math_floor_3 / 3600)
				math_floor_6 = math.floor(math_floor_3 % 3600 / 60)
				ref_0020 = math_floor_3 % 60

				table.insert(e_0002, ui.get_icon("clock") .. " " .. string.format("%02d:%02d:%02d", math_floor_5, math_floor_6, ref_0020))
			end

			if iter_20_1 == "Username" then
				table.insert(e_0002, ui.get_icon("user") .. " " .. tostring(common.get_username() or "user"))
			end
		end

		val_0160 = "Astryx"
		ref_0040 = val_0160

		for iter_20_2, iter_20_3 in ipairs(ref_0050) do
			if iter_20_3 == "FPS" then
				ref_0041 = val_0160:gsub(ui.get_icon("gauge") .. " %d+", ui.get_icon("gauge") .. " 999")

				break
			end
		end

		if #e_0002 > 0 then
			val_0160 = val_0160 .. "   |   " .. table.concat(e_0002, "    ")
		end

		ref_0039 = cfg_0157.wm_font or 1
		render_measure_text = render.measure_text(ref_0039, nil, val_0160)
		const_0179 = 20
		const_0190 = 9
		math_max_3 = math.max(render_measure_text.x + const_0179 * 2, 320)
		math_max_4 = math.max(render_measure_text.y + const_0190 * 2, 32)
		ref_0013 = const_0170
		ref_0021 = const_0168
		val_0132 = ui.get_mouse_position and ui.get_mouse_position() or nil
		is_button_down = common.is_button_down and common.is_button_down(1) or false

		if val_0132 then
			ref_0018 = ref_0013 <= val_0132.x and val_0132.x <= ref_0013 + math_max_3 and ref_0021 <= val_0132.y and val_0132.y <= ref_0021 + math_max_4

			if ui.get_alpha() > 0.1 and ref_0018 and is_button_down and not val_0146 then
				val_0146 = true
				const_0167 = val_0132.x - ref_0013
				const_0187 = val_0132.y - ref_0021
			end

			if not is_button_down then
				val_0146 = false
			end

			if val_0146 then
				const_0170 = math.floor(val_0132.x - const_0167)
				const_0168 = math.floor(val_0132.y - const_0187)
				ref_0013 = const_0170
				ref_0021 = const_0168
			end
		end

		ref_0019 = empty_0007.cr1:get()
		ref_0005 = empty_0007.cr2:get()
		ref_0006 = ref_0013
		ref_0003 = ref_0021
		ref_0004 = ref_0013 + math_max_3
		ref_0007 = ref_0021 + math_max_4
		ref_0010 = math_max_4 / 2
		const_0166 = 3
		const_0183 = 38

		render.rect(vector(ref_0006 - const_0166, ref_0003 - const_0166), vector(ref_0004 + const_0166, ref_0007 + const_0166), color(ref_0019.r, ref_0019.g, ref_0019.b, const_0183), ref_0010 + const_0166)
		render.rect(vector(ref_0006, ref_0003), vector(ref_0004, ref_0007), color(ref_0005.r, ref_0005.g, ref_0005.b, math.min(ref_0005.a, 220)), ref_0010)

		ref_0011 = ref_0013 + math_max_3 / 2 - render_measure_text.x / 2
		ref_0008 = ref_0021 + math_max_4 / 2 - render_measure_text.y / 2 - 1

		v_0119:set_text(val_0160)
		v_0119:set_colors({
			ref_0019,
			color(255, 255, 255)
		})
		v_0119:set_speed(-empty_0007.spd:get())
		v_0119:animate()
		render.text(ref_0039, vector(ref_0011, ref_0008), color(255, 255, 255, 255), nil, v_0119:get_animated_text())
	end

	if render_crosshair_10(ref_0045, "Crosshair") then
		val_0158 = "Astryx"
		entity_get_local_player_6 = entity.get_local_player()

		if not entity_get_local_player_6 or not entity_get_local_player_6:is_alive() then
			return
		end

		ref_0048 = entity_get_local_player_6 and entity_get_local_player_6:is_alive() and entity_get_local_player_6.m_bIsScoped and 30 or 0
		const_0180 = const_0180 or 0
		const_0180 = const_0180 + (ref_0048 - const_0180) * 0.35
		math_clamp_4 = math.clamp(render_crosshair_9(), 0, 1)
		ref_0016 = rage_cfg.dt and rage_cfg.dt:get() and 1 or 0
		const_0176 = const_0176 or 0
		num_const = num_const or 0
		const_0176 = const_0176 + (math_clamp_4 - const_0176) * 0.18
		num_const = num_const + (ref_0016 - num_const) * 0.18
		ref_0015 = empty_0007.cr1:get()
		ref_0017 = empty_0007.cr2:get()
		ref_0014 = render_load_font_2 or 1
		ref_0012 = val_0158

		if v_0125 and pcall(function()
			v_0125:set_text(val_0158)
			v_0125:set_colors({
				ref_0015,
				ref_0017
			})
			v_0125:set_speed(-empty_0007.spd:get() * 0.5)
			v_0125:animate()
		end) then
			ref_0012 = v_0125:get_animated_text()
		end

		render_measure_text_2 = render.measure_text(ref_0014, ref_0012)
		vec_0059 = vector(render_screen_size.x / 2 - render_measure_text_2.x / 2 - 20 + const_0180, render_screen_size.y / 2 + 15)

		render.text(ref_0014, vec_0059, color(255, 255, 255, 255), nil, ref_0012)
		render.text(ref_0014, vector(vec_0059.x + 1, vec_0059.y), color(255, 255, 255, 220), nil, ref_0012)

		if num_const > 0.01 then
			math_floor_7 = math.floor(255 * num_const)
			vec_0063 = vector(vec_0059.x + render_measure_text_2.x + 50, vec_0059.y + render_measure_text_2.y / 2 + 8)
			const_0169 = 5.5
			const_0173 = 2
			math_floor_8 = color(ref_0017.r, ref_0017.g, ref_0017.b, math.floor(75 * num_const))
			c_0062 = color(ref_0015.r, ref_0015.g, ref_0015.b, math_floor_7)

			render.circle_outline(vec_0063, math_floor_8, const_0169, 0, 1, const_0173)

			math_clamp_3 = math.clamp(const_0176, 0, 1)

			if math_clamp_3 > 0.001 then
				render.circle_outline(vec_0063, c_0062, const_0169, -90, math_clamp_3, const_0173)
			end
		end
	end
end

v_0117 = cfg_0164.other.visual:switch("\f<leaf> Damage Indicator", false, nil, function(arg_22_0)
	return {
		color = arg_22_0:color_picker(ui.get_icon("droplet") .. " Color", color(255, 255, 255)),
		offset = arg_22_0:slider(ui.get_icon("pencil") .. " Offset", 0, 100, 30)
	}
end)

function render_damage_indicator_12()
	if not v_0117:get() then
		return
	end

	entity_get_local_player_7 = entity.get_local_player()

	if not entity_get_local_player_7 or not entity_get_local_player_7:is_alive() then
		return
	end

	ref_0044 = entity_get_local_player_7:get_player_weapon()

	if not ref_0044 then
		return
	end

	ref_0043 = ref_0044:get_classname() or ""
	ref_0042 = rage_cfg.min_damage
	const_0177 = 0

	if ref_0043:find("AWP") then
		const_0177 = ref_0042.awpnaxyi:get()
	elseif ref_0043:find("SSG08") then
		const_0177 = ref_0042.scout:get()
	elseif ref_0043:find("Deagle") then
		const_0177 = ref_0042.deagle:get()
	elseif ref_0043:find("Revolver") then
		const_0177 = ref_0042.revik:get()
	elseif ref_0043:find("Taser") then
		const_0177 = ref_0042.taser:get()
	elseif ref_0043:find("Glock") or ref_0043:find("P250") or ref_0043:find("USP") or ref_0043:find("HKP2000") or ref_0043:find("FiveSeven") or ref_0043:find("Tec9") or ref_0043:find("CZ75") then
		const_0177 = ref_0042.pistols:get()
	elseif ref_0043:find("AK47") then
		const_0177 = ref_0042.vityaAK47:get()
	elseif ref_0043:find("M4A1") or ref_0043:find("M4A4") then
		const_0177 = ref_0042.m4ma1:get()
	elseif ref_0043:find("AUG") or ref_0043:find("SG556") then
		const_0177 = ref_0042.AUG:get()
	elseif ref_0043:find("SCAR20") or ref_0043:find("G3SG1") then
		const_0177 = ref_0042.autosnipers:get()
	elseif ref_0043:find("MP") or ref_0043:find("MAC10") or ref_0043:find("Bizon") or ref_0043:find("P90") or ref_0043:find("UMP") then
		const_0177 = ref_0042.smgs:get()
	elseif ref_0043:find("Nova") or ref_0043:find("XM1014") or ref_0043:find("MAG7") or ref_0043:find("SawedOff") then
		const_0177 = ref_0042.shotguns:get()
	elseif ref_0043:find("M249") or ref_0043:find("Negev") then
		const_0177 = ref_0042.machiguns:get()
	else
		const_0177 = ref_0042.global:get()
	end

	render_screen_size_2 = render.screen_size()
	ref_0051 = render_screen_size_2.x / 2
	ref_0057 = render_screen_size_2.y / 2
	ref_0053 = v_0117.offset:get()
	vec_0064 = vector(ref_0051 + 5, ref_0057 - 15 - ref_0053)
	ref_0009 = v_0117.color:get()

	render.text(1, vec_0064, ref_0009, "b", tostring(const_0177))
end

v_0124 = cfg_0164.other.misc:switch("\f<comments> Trash Talk", false, nil, function(arg_24_0)
	return {
		mode = arg_24_0:selectable(ui.get_icon("comment") .. " Mode", {
			ui.get_icon("skull") .. " Trash Talk",
			ui.get_icon("ghost") .. " On Death"
		}, true),
		delay = arg_24_0:slider(ui.get_icon("clock") .. " Delay", 0, 15, 1)
	}
end)
cfg_0149 = {
	{
		"Межгалактическое возмездие в 992 году",
		{
			0.8,
			"Тогда была битва за Astryx...."
		},
		{
			0.8,
			"Щас можешь купить его без последствий"
		}
	},
	{
		"Я слышал хруст....",
		{
			0.8,
			"Твоя голова была разломана"
		}
	},
	{
		"1",
		{
			0.8,
			"Сорри я случайно написал"
		}
	},
	{
		"Хз иди купи кфг у Mentanol",
		{
			0.8,
			"Ибо ты дохнишь как муха"
		}
	},
	{
		"Я твою мать ногами пинал",
		{
			0.7,
			"Давай без агресии пожалуйста"
		}
	},
	{
		"3 I ATLAS БЫЛ НАЕБОМ",
		{
			0.9,
			"А ТЫ ПОВЕРИЛ ХАХАХАХАХ"
		}
	},
	{
		"Сам зевс мне дал эти анти аимы",
		{
			1.2,
			"Теперь мне нет равных с Astryx"
		}
	},
	{
		"._. OWNED BY ASTRYX ._."
	},
	{
		"Летай как ракета",
		{
			0.9,
			"Жалко что твоя мать сдохла"
		}
	},
	{
		"А вот если бы у тебя был Astryx",
		{
			0.7,
			"Ты бы не сидел щас в спеках"
		}
	},
	{
		"Скочад чаты бисплатна можна у Astryx",
		{
			0.8,
			"И купить луа)"
		}
	},
	{
		"Бабушки смотрят на мой swag",
		{
			0.8,
			"Ведь я играю с Astryx lua"
		}
	},
	{
		"ASTRYX LOADED....",
		{
			0.8,
			"GODMODE ACTIVE"
		}
	},
	{
		"Mentanol create number one lua...",
		{
			0.8,
			"I'm play wich astryx"
		}
	},
	{
		"Вор в законе снова на свободе",
		{
			0.8,
			"Крути ногу делай ветер"
		}
	}
}
cfg_0154 = {
	{
		"МЕНЯ ОПЯТЬ УБИВАЕТ ОНО",
		{
			1.1,
			"Везучий сын шлюхи"
		},
		{
			1.3,
			"))))"
		}
	},
	{
		"ДА ДА ДА Я ТЕБЕ ПОВЕРЮ",
		{
			0.6,
			"И ЧИТ НЕ МИСНЕТ И У ТЕБЯ МАТЬ ЖИВА"
		}
	},
	{
		"в первые в жизни ты выиграл...",
		{
			1.2,
			"ты выиграл езду тебе по губам"
		}
	},
	{
		"Зевс проклял меня за мои грехи...",
		{
			0.8,
			"Знал бы он что мне похуй"
		},
		{
			1.2,
			"Ведь я с Astryx"
		}
	},
	{
		"Че в хуй?",
		{
			0.9,
			"Скажи отцу на хуй с дика на дике ты ему?"
		},
		{
			1.4,
			"Соври"
		}
	},
	{
		"ПРОСТИТЕ МЕНЯ ЗА МОЮ ИГРУ",
		{
			0.8,
			"ТАМ ПРОСТО ТАКОЙ ХАЧ ИГРАЕТ"
		}
	}
}

function render_crosshair_12(arg_25_0)
	utils.console_exec("say " .. arg_25_0)
end

empty_0011 = {}
const_0174 = 0

function render_crosshair_13(arg_26_0)
	local var_26_0 = math.max(globals.curtime, const_0174) + v_0124.delay:get()

	table.insert(empty_0011, {
		time = var_26_0,
		text = arg_26_0[1]
	})

	local var_26_1 = var_26_0 + 0.1

	for iter_26_0 = 2, #arg_26_0 do
		local var_26_2 = arg_26_0[iter_26_0][1]
		local var_26_3 = arg_26_0[iter_26_0][2]

		var_26_1 = var_26_1 + var_26_2

		table.insert(empty_0011, {
			time = var_26_1,
			text = var_26_3
		})
	end

	const_0174 = var_26_1
end

events.player_death(function(arg_27_0)
	if not v_0124:get() then
		return
	end

	local var_27_0 = entity.get_local_player()

	if not var_27_0 then
		return
	end

	local var_27_1 = entity.get(arg_27_0.attacker, true)
	local var_27_2 = entity.get(arg_27_0.userid, true)

	if not var_27_1 or not var_27_2 then
		return
	end

	if var_27_1 == var_27_0 then
		local var_27_3 = cfg_0149[math.random(#cfg_0149)]

		render_crosshair_13(var_27_3)
	end

	if var_27_2 == var_27_0 then
		local var_27_4 = cfg_0154[math.random(#cfg_0154)]

		render_crosshair_13(var_27_4)
	end
end)

cfg_0145 = {
	render = {
		current_values = {
			x = 1,
			y = 1,
			fov = 38,
			z = -1
		}
	}
}

function render_crosshair_14()
	if not v_0118:get() then
		return
	end

	local var_28_0 = menu.render.viewmodel.default:get()
	local var_28_1 = {
		fov = var_28_0 and 38 or menu.render.viewmodel.fov:get() / 10,
		x = var_28_0 and 1 or menu.render.viewmodel.x:get() / 10,
		y = var_28_0 and 1 or menu.render.viewmodel.y:get() / 10,
		z = var_28_0 and -1 or menu.render.viewmodel.z:get() / 10
	}
	local var_28_2 = cfg_0145.render.current_values

	var_28_2.fov = render_crosshair_8(var_28_2.fov, var_28_1.fov, 0.05)
	var_28_2.x = render_crosshair_8(var_28_2.x, var_28_1.x, 0.05)
	var_28_2.y = render_crosshair_8(var_28_2.y, var_28_1.y, 0.05)
	var_28_2.z = render_crosshair_8(var_28_2.z, var_28_1.z, 0.05)

	cvar.viewmodel_fov:float(var_28_2.fov, true)
	cvar.viewmodel_offset_x:float(var_28_2.x, true)
	cvar.viewmodel_offset_y:float(var_28_2.y, true)
	cvar.viewmodel_offset_z:float(var_28_2.z, true)

	local var_28_3 = entity.get_local_player()

	if not var_28_3 then
		return
	end

	local var_28_4 = var_28_3:get_player_weapon()

	if not var_28_4 then
		return
	end

	local var_28_5 = var_28_4:get_classname()
	local var_28_6 = menu.render.viewmodel.opposite_knife:get()

	cvar.cl_righthand:int(var_28_5 == "CKnife" and var_28_6 and 0 or 1)
end

v_0128 = cfg_0164.other.visual:switch("\f<crosshairs-simple> Hit Marker", false, nil, function(arg_29_0)
	return {
		color = arg_29_0:color_picker("\f<sparkles> Marker Color", color(255, 255, 255, 255)),
		size = arg_29_0:slider("Size", 6, 20, 10),
		gap = arg_29_0:slider("Gap", 2, 12, 5),
		wait = arg_29_0:slider("Wait time", 0, 100, 25),
		fade = arg_29_0:slider("Fade time", 5, 100, 25)
	}
end)
menu = menu or {}
menu.misc = menu.misc or {}
menu.misc.scope = {}
v_0127 = cfg_0164.other.visual:switch("\f<eye> Custom Scope", false, nil, function(arg_30_0)
	return {
		color = arg_30_0:color_picker("Color", color(255, 255, 255, 255)),
		length = arg_30_0:slider("Length", 1, 200, 60),
		gap = arg_30_0:slider("Gap", 0, 50, 8),
		tshape = arg_30_0:switch("T-Style", false)
	}
end)

function menu.misc.scope.get()
	return v_0127:get()
end

v_0130 = cfg_0164.other.visual:switch("\f<person-cane> Custom Animations", false, nil, function(arg_32_0)
	return {
		air = arg_32_0:list("Air animation", {
			"Disabled",
			"Moonwalk",
			"Static legs"
		}),
		ground = arg_32_0:list("Ground animation", {
			"Disabled",
			"Moonwalk",
			"Static legs"
		})
	}
end)
dummy_0075 = nil

function process_animstate(arg_33_0)
	if dummy_0075 == arg_33_0 then
		return
	end

	dummy_0075 = arg_33_0

	rage_cfg.leg_movement:override(arg_33_0)
end

function process_animstate_2()
	if not v_0130:get() then
		rage_cfg.leg_movement:override()

		return
	end

	local var_34_0 = entity.get_local_player()

	if not var_34_0 or not var_34_0:is_alive() then
		return
	end

	local var_34_1 = get_client_entity(var_34_0:get_index())

	if not var_34_1 then
		return
	end

	if not var_34_0:get_anim_state() then
		return
	end

	local var_34_2 = var_34_0.m_vecVelocity
	local var_34_3 = math.sqrt(var_34_2.x^2 + var_34_2.y^2) > 5
	local var_34_4 = bit.band(var_34_0.m_fFlags, 1) == 0
	local var_34_5 = v_0130.air:get()
	local var_34_6 = v_0130.ground:get()
	local var_34_7 = ffi.cast("animstate_layer_t**", ffi.cast("uintptr_t", var_34_1) + 10640)[0]

	if var_34_4 then
		if var_34_5 == 2 then
			if var_34_7 and var_34_7[6] and var_34_3 then
				var_34_7[6].m_flWeight = 1
			end
		elseif var_34_5 == 3 then
			var_34_0.m_flPoseParameter[6] = 1
		else
			var_34_0.m_flPoseParameter[6] = 0
		end
	else
		var_34_0.m_flPoseParameter[6] = 0
	end

	if not var_34_4 then
		if var_34_6 == 1 then
			process_animstate(nil)
		elseif var_34_6 == 2 then
			process_animstate("Walking")
		elseif var_34_6 == 3 then
			process_animstate("Sliding")
		end
	else
		process_animstate(nil)
	end
end

v_0131 = cfg_0164.other.visual:switch("\f<palette> Console Modulation", false, nil, function(arg_35_0)
	return {
		color = arg_35_0:color_picker("Color", color(255, 255, 255, 255))
	}
end)
empty_0010 = {}
vfunc_resolver = utils.get_vfunc("engine.dll", "VEngineClient014", 11, "bool(__thiscall*)(void*)")

;(function()
	empty_0010 = {
		materials.get_materials("vgui_white")[1],
		materials.get("vgui/hud/800corner1"),
		materials.get("vgui/hud/800corner2"),
		materials.get("vgui/hud/800corner3"),
		materials.get("vgui/hud/800corner4")
	}
end)()

function bombsite_e_fix_2(arg_37_0)
	for iter_37_0 = 1, #empty_0010 do
		local var_37_0 = empty_0010[iter_37_0]

		if var_37_0 then
			var_37_0:alpha_modulate(arg_37_0.a / 255)
			var_37_0:color_modulate(arg_37_0)
		end
	end
end

dummy_0105 = nil
val_0147 = false

function bombsite_e_fix_3()
	local var_38_0 = v_0131:get()

	if not vfunc_resolver or not vfunc_resolver() then
		return
	end

	local var_38_1 = v_0131.color:get()

	if var_38_0 == val_0147 and dummy_0105 == var_38_1 then
		return
	end

	val_0147 = var_38_0
	dummy_0105 = var_38_1

	if var_38_0 then
		bombsite_e_fix_2(var_38_1)
	else
		bombsite_e_fix_2(color(255, 255, 255, 255))
	end
end

v_0112 = cfg_0164.other.misc:switch(ui.get_icon("bug") .. " Combat Logs", false, nil, function(arg_39_0)
	return {
		output = arg_39_0:selectable(ui.get_icon("snowflake") .. " Output", {
			ui.get_icon("sliders") .. " Console",
			ui.get_icon("print") .. " Screen"
		}, true),
		hit_line = arg_39_0:color_picker(ui.get_icon("check") .. " Hit line", color(120, 255, 120, 255)),
		miss_line = arg_39_0:color_picker(ui.get_icon("xmark") .. " Miss line", color(255, 120, 120, 255))
	}
end)
v_0126 = cfg_0164.other.misc:switch("\f<volume-high> Unmute Players", false, nil)
panorama_open = panorama.open.GameStateAPI
const_0189 = 0

function bombsite_e_fix_4()
	if not v_0126:get() then
		return
	end

	if globals.curtime < const_0189 then
		return
	end

	const_0189 = globals.curtime + 2

	for iter_40_0 = 1, globals.max_players do
		local var_40_0 = panorama_open.GetPlayerXuidStringFromEntIndex(iter_40_0)

		if panorama_open.IsXuidValid(var_40_0) and panorama_open.IsSelectedPlayerMuted(var_40_0) then
			panorama_open.ToggleMute(var_40_0)
		end
	end
end

v_0113 = cfg_0164.other.misc:switch("\f<face-frown> No fall damage", false)
v_0129 = cfg_0164.other.misc:switch("\f<paper-plane> Strafe Extension", false, nil, function(arg_41_0)
	return {
		velocity = arg_41_0:switch("Velocity Strafe", false),
		disable_standalone = arg_41_0:switch("Disable Standalone", false)
	}
end)
v_0116 = cfg_0164.other.misc:switch("\f<rss> Ping Spike", false, nil, function(arg_42_0)
	return {
		amount = arg_42_0:slider("Amount", 0, 200, 0)
	}
end)
v_0114 = cfg_0164.other.misc:switch(ui.get_icon("list-dropdown") .. " Gamesense Indicators", false, function(arg_43_0)
	return {
		style = arg_43_0:combo("Style", {
			"Skeet",
			"Modern"
		}),
		select = arg_43_0:selectable("Select", {
			"Double Tap",
			"Hide Shots",
			"Fake Latency",
			"Min. Damage Override",
			"Body Aim",
			"Fake Duck",
			"Force Safe Point",
			"Freestanding",
			"Dormant Aimbot",
			"Bomb Information",
			"Hit/Miss Rate"
		}),
		color = arg_43_0:color_picker("Main Color", color(255, 255, 255)),
		bg = arg_43_0:switch("Enable background"),
		bg_color = arg_43_0:color_picker("Background Color", color(0, 0, 0, 100)),
		animated = arg_43_0:switch("Animated")
	}
end)
empty_0006 = {}
v_0122 = cfg_0164.other.helpers:switch("\f<bomb_mod> Super Toss", false, nil, function(arg_44_0)
	empty_0006.fix_move = arg_44_0:switch(ui.get_icon("person-running") .. " Fix movement", true)
	empty_0006.predict = arg_44_0:switch(ui.get_icon("wand-magic-sparkles") .. " Predict velocity", true)

	return empty_0006
end)
val_0162 = false

function render_crosshair_15(arg_45_0, arg_45_1, arg_45_2, arg_45_3)
	local var_45_0 = vector():angles(arg_45_0)
	local var_45_1 = arg_45_3 * 1.25
	local var_45_2 = math.clamp(arg_45_1 * 0.9, 15, 750) * (math.clamp(arg_45_2, 0, 1) * 0.7 + 0.3)
	local var_45_3 = var_45_1 - var_45_0 * var_45_0:dot(var_45_1)
	local var_45_4 = var_45_3:lengthsqr()

	if var_45_4 < var_45_2 * var_45_2 then
		return (var_45_0 * math.sqrt(var_45_2 * var_45_2 - var_45_4) - var_45_3):normalized():angles()
	end

	local var_45_5 = (var_45_0 * 0.001 - var_45_3):normalized()
	local var_45_6 = 1 - var_45_2 * var_45_2 / var_45_4

	return var_45_5:lerp(var_45_0, var_45_6):normalized():angles()
end

v_0093 = cfg_0164.other.helpers:switch("\f<align-center> Fast ladder", false)
v_0060 = cfg_0164.other.rage:switch("\f<snowflake> Dormant Aimbot", false, nil, function(arg_46_0)
	return {
		gunselect = arg_46_0:selectable("Select weapon", {
			"Ssg8",
			"Awp",
			"AutoSnipers",
			"R8"
		}),
		dormantMinDamage = arg_46_0:slider("Min Damage", 0, 100, 0),
		Dormanthitchance = arg_46_0:slider("Hit Chance", 0, 100, 0)
	}
end)
v_0108 = cfg_0164.other.rage:switch("\f<key> Magic Key", false)
empty_0002 = {}
empty_0003 = {}
v_0095 = cfg_0164.other.rage:switch("\f<wind> Hitchance In Air", false, nil, function(arg_47_0)
	empty_0002.weapons = arg_47_0:selectable(ui.get_icon("crosshairs") .. " Weapons", {
		"Global",
		"AWP",
		"SSG-08",
		"AutoSnipers",
		"Rifles",
		"Pistols"
	}, true)
	empty_0002.value = arg_47_0:slider(ui.get_icon("rocket") .. " Hitchance", 0, 100, 60)

	local function var_47_0()
		local var_48_0 = empty_0002.weapons:get()

		empty_0002.value:visibility(var_48_0 and #var_48_0 > 0)
	end

	empty_0002.weapons:set_callback(var_47_0)
	var_47_0()
end)
empty_0004 = {}
v_0084 = cfg_0164.other.rage:switch("\f<ban> Hitchance In NoScope", false, nil, function(arg_49_0)
	empty_0004.weapons = arg_49_0:selectable(ui.get_icon("gun") .. " Weapons", {
		"Global",
		"AWP",
		"SSG-08",
		"AutoSnipers"
	}, true)
	empty_0004.value = arg_49_0:slider(ui.get_icon("percent") .. " Hitchance", 0, 100, 50)

	local function var_49_0()
		local var_50_0 = empty_0004.weapons:get()

		empty_0004.value:visibility(var_50_0 and #var_50_0 > 0)
	end

	empty_0004.weapons:set_callback(var_49_0)
	var_49_0()
end)
empty_0001 = {}

if v_0084:get() then
	v_0090 = empty_0004.weapons:get()
	get_local_player = entity.get_local_player()

	if not get_local_player then
		return
	end

	v_0106 = get_local_player:get_player_weapon()

	if not v_0106 then
		return
	end

	v_0096 = v_0106:get_classname() or ""
	val_0140 = (v_0096:find("AWP") or v_0096:find("SSG08") or v_0096:find("SCAR20") or v_0096:find("G3SG1")) and not get_local_player.m_bIsScoped

	if v_0090 and #v_0090 > 0 then
		v_0098 = empty_0004.value:get()

		function func_0069(arg_51_0)
			for iter_51_0, iter_51_1 in ipairs(v_0090) do
				if iter_51_1 == arg_51_0 then
					return true
				end
			end

			return false
		end

		function apply_settings(arg_52_0, arg_52_1)
			if not arg_52_0 then
				return
			end

			if val_0140 and (func_0069(arg_52_1) or func_0069("Global")) then
				if empty_0001[arg_52_1] == nil then
					empty_0001[arg_52_1] = arg_52_0:get()
				end

				arg_52_0:override(v_0098)
			elseif empty_0001[arg_52_1] ~= nil then
				arg_52_0:override(empty_0001[arg_52_1])

				empty_0001[arg_52_1] = nil
			end
		end

		v_0110 = rage_cfg.hitchance

		apply_settings(v_0110.global, "Global")
		apply_settings(v_0110.awp, "AWP")
		apply_settings(v_0110.scout, "SSG-08")
		apply_settings(v_0110.autosnipers, "AutoSnipers")
	end
end

function render_damage_indicator()
	local var_53_0 = entity.get_local_player()

	if not var_53_0 then
		return "Global"
	end

	local var_53_1 = var_53_0:get_player_weapon()

	if not var_53_1 then
		return "Global"
	end

	local var_53_2 = var_53_1:get_classname() or ""

	if var_53_2:find("SSG08") then
		return "SSG-08"
	elseif var_53_2:find("AWP") then
		return "AWP"
	elseif var_53_2:find("SCAR20") or var_53_2:find("G3SG1") then
		return "AutoSnipers"
	elseif var_53_2:find("AK47") or var_53_2:find("M4") or var_53_2:find("AUG") then
		return "Rifles"
	elseif var_53_2:find("Glock") or var_53_2:find("P250") or var_53_2:find("Deagle") then
		return "Pistols"
	end

	return "Global"
end

cfg_0138 = {
	initialized = false,
	hitboxes = {},
	multipoints = {}
}

function render_damage_indicator_2()
	if cfg_0138.initialized then
		return
	end

	for iter_54_0, iter_54_1 in pairs(rage_cfg.hitboxes) do
		cfg_0138.hitboxes[iter_54_0] = iter_54_1:get()
	end

	for iter_54_2, iter_54_3 in pairs(rage_cfg.multipoints) do
		cfg_0138.multipoints[iter_54_2] = iter_54_3:get()
	end

	cfg_0138.initialized = true
end

function render_damage_indicator_3()
	for iter_55_0, iter_55_1 in pairs(rage_cfg.hitboxes) do
		iter_55_1:override("Head")
	end

	for iter_55_2, iter_55_3 in pairs(rage_cfg.multipoints) do
		iter_55_3:override("Head")
	end
end

function render_damage_indicator_4()
	if not cfg_0138.initialized then
		return
	end

	for iter_56_0, iter_56_1 in pairs(rage_cfg.hitboxes) do
		if cfg_0138.hitboxes[iter_56_0] ~= nil then
			iter_56_1:override(cfg_0138.hitboxes[iter_56_0])
		else
			iter_56_1:override(nil)
		end
	end

	for iter_56_2, iter_56_3 in pairs(rage_cfg.multipoints) do
		if cfg_0138.multipoints[iter_56_2] ~= nil then
			iter_56_3:override(cfg_0138.multipoints[iter_56_2])
		else
			iter_56_3:override(nil)
		end
	end
end

function render_damage_indicator_5()
	local var_57_0 = v_0060:get()
	local var_57_1 = render_damage_indicator()
	local var_57_2 = v_0060.gunselect:get() or {}
	local var_57_3 = false

	for iter_57_0, iter_57_1 in ipairs(var_57_2) do
		if iter_57_1 == var_57_1 then
			var_57_3 = true

			break
		end
	end

	if var_57_0 then
		rage_cfg.dormant:set(true)

		if not var_57_3 then
			return
		end

		if cfg_0151.active then
			return
		end

		cfg_0151.active = true
		cfg_0151.values = {}

		local var_57_4 = v_0060.Dormanthitchance:get()
		local var_57_5 = v_0060.dormantMinDamage:get()
		local var_57_6 = {
			Ssg8 = rage_cfg.min_damage.scout,
			Awp = rage_cfg.min_damage.awpnaxyi,
			AutoSnipers = rage_cfg.min_damage.autosnipers,
			R8 = rage_cfg.min_damage.revik
		}
		local var_57_7 = {
			Ssg8 = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"),
			Awp = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"),
			AutoSnipers = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"),
			R8 = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance")
		}

		for iter_57_2, iter_57_3 in pairs(var_57_6) do
			cfg_0151.values[iter_57_2] = {
				dmg = iter_57_3:get(),
				hc = var_57_7[iter_57_2]:get()
			}

			iter_57_3:set(var_57_5)
			var_57_7[iter_57_2]:set(var_57_4)
		end
	else
		rage_cfg.dormant:set(false)

		if not cfg_0151.active then
			return
		end

		local var_57_8 = {
			Ssg8 = rage_cfg.min_damage.scout,
			Awp = rage_cfg.min_damage.awpnaxyi,
			AutoSnipers = rage_cfg.min_damage.autosnipers,
			R8 = rage_cfg.min_damage.revik
		}
		local var_57_9 = {
			Ssg8 = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"),
			Awp = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"),
			AutoSnipers = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"),
			R8 = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance")
		}

		for iter_57_4, iter_57_5 in pairs(cfg_0151.values) do
			if var_57_8[iter_57_4] and iter_57_5 then
				var_57_8[iter_57_4]:set(iter_57_5.dmg)
				var_57_9[iter_57_4]:set(iter_57_5.hc)
			end
		end

		cfg_0151.active = false
		cfg_0151.values = {}
	end
end

val_0143 = false

function clan_tag_update()
	local var_58_0 = v_0116:get()

	if var_58_0 == val_0143 then
		return
	end

	val_0143 = var_58_0

	if var_58_0 then
		cvar.sv_maxunlag:float(0.4)
		rage_cfg.fakexyetensi:override(v_0116.amount:get())
		rage_cfg.fakexyetensi:disabled(true)
	else
		cvar.sv_maxunlag:float(0.2)
		rage_cfg.fakexyetensi:override()
		rage_cfg.fakexyetensi:disabled(false)
	end
end

function clan_tag_update_2(arg_59_0)
	if not v_0113:get() then
		return
	end

	local var_59_0 = entity.get_local_player()

	if not var_59_0 or not var_59_0:is_alive() then
		return
	end

	if var_59_0.m_vecVelocity.z > -500 then
		return
	end

	local var_59_1 = var_59_0:get_origin()
	local var_59_2 = utils.trace_line(var_59_1, vector(var_59_1.x, var_59_1.y, var_59_1.z - 100)).fraction * 100

	if var_59_2 < 20 then
		arg_59_0.in_duck = 1
		arg_59_0.in_jump = 1
	elseif var_59_2 < 40 then
		arg_59_0.in_duck = 1
	end
end

v_0071 = cfg_0164.antiaim.conditions:combo("\f<person> Condition", {
	"\f<person> Standing",
	"\f<person-running> Moving",
	"\f<person-walking> Walking",
	"\f<person-hiking> Slow Walk",
	"\f<person-breastfeeding> Crouching",
	"\f<person-rays> Crouch Moving",
	"\f<person-falling> Air",
	"\f<person-digging> Air Duck"
})

function clan_tag_update_3(arg_60_0)
	print_raw("\affd700FFAstryx \aFFFFFFF" .. arg_60_0)
end

function clan_tag_update_4()
	if not entity.get_local_player() then
		val_0150 = ""
		const_0186 = 1
		const_0185 = 0

		return
	end

	local var_61_0 = globals.curtime

	if not var_61_0 then
		return
	end

	if not v_0120:get() then
		if val_0150 ~= "" then
			common.set_clan_tag("")

			val_0150 = ""
			const_0186 = 1
			const_0185 = var_61_0
		end

		return
	end

	if var_61_0 >= const_0185 then
		local var_61_1 = empty_0008[const_0186] or ""

		if var_61_1 ~= val_0150 then
			common.set_clan_tag(var_61_1)

			val_0150 = var_61_1
		end

		const_0186 = const_0186 + 1

		if const_0186 > #empty_0008 then
			const_0186 = 1
		end

		const_0185 = var_61_0 + const_0171
	end
end

function visibility_updater()
	if not dummy_0086 then
		return
	end

	if v_0115:get() then
		utils.console_exec("r_aspectratio " .. dummy_0086:get() / 100)
	else
		utils.console_exec("r_aspectratio 0")
	end
end

v_0115.b32:set_callback(function()
	dummy_0086:set(150)
end)
v_0115.b43:set_callback(function()
	dummy_0086:set(133)
end)
v_0115.b54:set_callback(function()
	dummy_0086:set(125)
end)
v_0115.b169:set_callback(function()
	dummy_0086:set(177)
end)
v_0115.b1610:set_callback(function()
	dummy_0086:set(160)
end)
v_0115:set_callback(visibility_updater)

if dummy_0086 then
	dummy_0086:set_callback(visibility_updater)
end

v_0079 = cfg_0164.antiaim.global:switch(ui.get_icon("mars") .. " Pitch mode", false, nil, function(arg_68_0)
	return {
		modes = arg_68_0:combo("Mode", {
			"Off",
			"Down",
			"Zero",
			"Minimal"
		}),
		customsld = arg_68_0:slider("Custom Value", -89, 89, 0)
	}
end)

function render_crosshair()
	local var_69_0 = v_0079:get()
	local var_69_1 = v_0079.modes:get()

	v_0079.modes:visibility(var_69_0)
	v_0079.customsld:visibility(var_69_0 and var_69_1 == "Custom")
end

v_0079:set_callback(render_crosshair)
v_0079.modes:set_callback(render_crosshair)
render_crosshair()

v_0104 = cfg_0164.antiaim.global:switch(ui.get_icon("rotate") .. " Yaw Settings", false, nil, function(arg_70_0)
	return {
		yaw_amount = arg_70_0:slider(ui.get_icon("rotate") .. " Yaw Amount", -180, 180, 0)
	}
end)
v_0094 = cfg_0164.antiaim.global:switch(ui.get_icon("sliders") .. " Jitter Settings", false, nil, function(arg_71_0)
	return {
		mode = arg_71_0:combo(ui.get_icon("Sliders") .. "Mode", {
			"Disabled",
			"Center",
			"Offset",
			"Random",
			"3-Way",
			"5-Way"
		}),
		jittersettings = arg_71_0:combo("Jitter Settings", {
			"Default",
			"Custom"
		}),
		jittersliderL = arg_71_0:slider("Jitter Amount[L]", -180, 180, 0),
		jittersliderR = arg_71_0:slider("Jitter Amount[R]", -180, 180, 0),
		jitterdelay = arg_71_0:combo("Delay Mode", {
			"Default",
			"Normal",
			"Medium",
			"High",
			"Fluctate",
			"Random"
		}),
		delay_min = arg_71_0:slider("Delay Min", 1, 15, 1),
		delay_max = arg_71_0:slider("Delay Max", 1, 15, 15),
		fluctuate_time = arg_71_0:slider("Fluctuate Time (sec)", 1, 5, 2),
		offset = arg_71_0:slider("Offset", -180, 180, 0)
	}
end)

function render_crosshair_2()
	local var_72_0 = v_0094.jittersettings:get()
	local var_72_1 = v_0094.mode:get()
	local var_72_2 = var_72_0 == "Custom"
	local var_72_3 = var_72_0 == "Default"
	local var_72_4

	var_72_4 = var_72_1 == "Offset"

	local var_72_5 = var_72_1 ~= "Disabled"

	v_0094.offset:visibility(var_72_3)
	v_0094.jittersliderL:visibility(var_72_5 and var_72_2)
	v_0094.jittersliderR:visibility(var_72_5 and var_72_2)
	v_0094.jitterdelay:visibility(var_72_5 and var_72_2)

	local var_72_6 = v_0094.jitterdelay:get()

	v_0094.delay_min:visibility(var_72_5 and var_72_2 and (var_72_6 == "Random" or var_72_6 == "Fluctate"))
	v_0094.delay_max:visibility(var_72_5 and var_72_2 and (var_72_6 == "Random" or var_72_6 == "Fluctate"))
	v_0094.fluctuate_time:visibility(var_72_5 and var_72_2 and var_72_6 == "Fluctate")
end

v_0094:set_callback(render_crosshair_2)
v_0094.mode:set_callback(render_crosshair_2)
v_0094.jittersettings:set_callback(render_crosshair_2)
v_0094.jitterdelay:set_callback(render_crosshair_2)

v_0107 = cfg_0164.antiaim.manuals:switch(ui.get_icon("child-reaching") .. " Safe Head", false, nil, function(arg_73_0)
	return {
		targets = arg_73_0:selectable(ui.get_icon("crosshairs") .. " Targers", {
			ui.get_icon("knife") .. " Safe Knife",
			ui.get_icon("bolt") .. " Safe Taser"
		}, true)
	}
end)
v_0103 = cfg_0164.antiaim.baseys:combo("\f<satellite-dish> Yaw Base", {
	"\f<street-view> Local View",
	"\f<crosshairs> At Target"
})
v_0097 = cfg_0164.antiaim.manuals:switch(ui.get_icon("shield-halved") .. " Freestand", false, nil, function(arg_74_0)
	return {
		cond = arg_74_0:selectable(ui.get_icon("list-check") .. " Enable", {
			ui.get_icon("person") .. " Standing",
			ui.get_icon("person-running") .. " Moving",
			ui.get_icon("person-walking") .. " Slow Walk",
			ui.get_icon("person-breastfeeding") .. " Crouching",
			ui.get_icon("person-rays") .. " Crouch Moving",
			ui.get_icon("person-falling") .. " Air",
			ui.get_icon("person-digging") .. " Air Duck"
		}, true)
	}
end)
v_0100 = cfg_0164.antiaim.manuals:combo("\f<compass> Manual Yaw", {
	"Off",
	"\f<arrow-left> Left",
	"\f<arrow-right> Right",
	"\f<arrow-down> Backward",
	"\f<arrow-up> Forward"
})
v_0077 = cfg_0164.antiaim.manuals:switch("\f<arrows-spin> Avoid Backstab", false)

function visibility_updater_2(arg_75_0)
	if not v_0097:get() then
		return false
	end

	local var_75_0 = v_0097.cond:get()

	if not var_75_0 then
		return false
	end

	for iter_75_0, iter_75_1 in ipairs(var_75_0) do
		if iter_75_1:gsub("^.-%s", "") == arg_75_0 then
			return true
		end
	end

	return false
end

v_0064 = cfg_0164.antiaim.builder:switch(ui.get_icon("person-burst") .. " Desync Mode", false, nil, function(arg_76_0)
	return {
		mode = arg_76_0:list(ui.get_icon("sliders") .. " Type", {
			"Static",
			"Jitter",
			"Random",
			"Sway"
		}),
		left = arg_76_0:slider("[L] Left Limit", 0, 60, 0),
		right = arg_76_0:slider("[R] Right Limit", 0, 60, 0),
		speed = arg_76_0:slider("Sway Speed", 1, 20, 5),
		options = arg_76_0:selectable(ui.get_icon("settings") .. "Options", {
			ui.get_icon("shuffle") .. " Jitter",
			ui.get_icon("refresh-cw") .. " Randomize Jitter",
			ui.get_icon("activity") .. " Anti Bruteforce"
		}, true)
	}
end)
v_0063 = cfg_0164.antiaim.builder:switch(ui.get_icon("shield") .. " Force Defensive", false, nil, function(arg_77_0)
	return {
		mode = arg_77_0:combo(ui.get_icon("bolt") .. " Mode", {
			"On Peek",
			"Always On",
			"Disabled"
		}),
		pitch = arg_77_0:combo(ui.get_icon("arrow-up") .. " Pitch", {
			"Static",
			"Switch",
			"Random",
			"Jitter",
			"Sway",
			"Slide"
		}),
		pitch_val = arg_77_0:slider("Pitch [MIN]", -89, 89, 0),
		pitch_val2 = arg_77_0:slider("Pitch [MAX]", -89, 89, 0),
		yaw = arg_77_0:combo(ui.get_icon("rotate") .. " Yaw", {
			"Sideways",
			"Side-based",
			"Spin",
			"Random",
			"Jitter",
			"Sway"
		}),
		yaw_val = arg_77_0:slider("Yaw [L]", -180, 180, 0),
		yaw_val2 = arg_77_0:slider("Yaw [R]", -180, 180, 0),
		yaw_side = arg_77_0:slider("Yaw Side-Based", -180, 180, 0),
		yaw_jitter = arg_77_0:slider("Yaw Jitter Range", -180, 180, 0),
		spin = arg_77_0:slider("Spin speed", 1, 20, 5)
	}
end)
v_0069 = cfg_0164.antiaim.builder:switch(ui.get_icon("clock") .. " Override Fake lag")
v_0078 = cfg_0164.antiaim.builder:combo(ui.get_icon("align-justify") .. " Mode", {
	"Default",
	"Adaptive",
	"Fluctate",
	"Velocity",
	"Random"
})
v_0061 = cfg_0164.antiaim.builder:slider("Lag amount[MIN]", 0, 15, 15)
v_0089 = cfg_0164.antiaim.builder:slider("Lag amount[MAX]", 0, 15, 15)
v_0080 = cfg_0164.antiaim.builder:slider("Fluctate lag time", 1, 5, 1)
v_0085 = cfg_0164.antiaim.builder:slider(ui.get_icon("exchange") .. "Amount", 0, 15, 15)
const_0194 = 0
val_0142 = false

function bombsite_e_fix()
	if not v_0069:get() then
		v_0078:visibility(false)
		v_0085:visibility(false)
		v_0061:visibility(false)
		v_0089:visibility(false)
		v_0080:visibility(false)

		return
	end

	v_0078:visibility(true)

	local var_78_0 = v_0078:get()

	v_0085:visibility(var_78_0 == "Default" or var_78_0 == "Adaptive")
	v_0061:visibility(var_78_0 == "Fluctate" or var_78_0 == "Random")
	v_0089:visibility(var_78_0 == "Fluctate" or var_78_0 == "Random")
	v_0080:visibility(var_78_0 == "Fluctate")
end

v_0069:set_callback(bombsite_e_fix)
v_0078:set_callback(bombsite_e_fix)
bombsite_e_fix()

v_0076 = cfg_0164.antiaim.extension:switch("\f<bomb_mod> Air Lag", false, nil)
v_0091 = cfg_0164.antiaim.extension:switch("\f<gauge> Slow Walk", false, nil)

function render_crosshair_3()
	local var_79_0 = v_0063.mode:get()
	local var_79_1 = v_0063.pitch:get()
	local var_79_2 = v_0063.yaw:get()
	local var_79_3 = var_79_1 == "Static"

	v_0063.pitch_val:visibility(true)
	v_0063.pitch_val2:visibility(not var_79_3)

	local var_79_4 = var_79_2 == "Spin"
	local var_79_5 = var_79_2 == "Side-based"
	local var_79_6 = var_79_2 == "Jitter"

	v_0063.yaw_val:visibility(not var_79_4 and not var_79_5 and not var_79_6)
	v_0063.yaw_val2:visibility(not var_79_4 and not var_79_5 and not var_79_6)
	v_0063.yaw_side:visibility(var_79_5)
	v_0063.yaw_jitter:visibility(var_79_6)
	v_0063.spin:visibility(var_79_4)
end

v_0063.pitch:set_callback(render_crosshair_3)
v_0063.yaw:set_callback(render_crosshair_3)
render_crosshair_3()

function render_crosshair_4()
	local var_80_0 = v_0094.mode:get()

	v_0094.offset:visibility(var_80_0 ~= "Disabled")
end

v_0094.mode:set_callback(render_crosshair_4)
render_crosshair_4()

function render_crosshair_5(arg_81_0)
	local var_81_0

	if type(arg_81_0) == "table" then
		var_81_0 = {}

		for iter_81_0, iter_81_1 in pairs(arg_81_0) do
			var_81_0[render_crosshair_5(iter_81_0)] = render_crosshair_5(iter_81_1)
		end
	else
		var_81_0 = arg_81_0
	end

	return var_81_0
end

empty_0005 = {}

for iter_0_2, iter_0_3 in ipairs(cfg_0155) do
	empty_0005[iter_0_3] = {
		fakelag_amount = 15,
		pitch_mode = "Off",
		fakelag_mode = "Default",
		fakelag_timer = 1,
		fakelag_max = 15,
		fakelag_min = 1,
		fakelag_enable = false,
		desync_speed = 5,
		desync_right = 0,
		desync_left = 0,
		desync_mode = 1,
		desync_enable = false,
		yaw_fluctuate_time = 2,
		yaw_delay_max = 15,
		yaw_delay_min = 1,
		yaw_delay = "Default",
		yaw_right = 0,
		yaw_left = 0,
		yaw_settings = "Default",
		yaw_offset = 0,
		yaw_mode = "Disabled",
		yaw_enable = false,
		yaw_set_amount = 0,
		yaw_set_enable = false,
		pitch_custom = 0,
		pitch_enable = false,
		def_spin = 5,
		def_yaw_jitter = 0,
		def_yaw_side = 0,
		def_yaw_val2 = 0,
		def_yaw_val = 0,
		def_yaw = "Sideways",
		def_pitch_val2 = 0,
		def_pitch_val = 0,
		def_pitch = "Static",
		def_mode = "Disabled",
		def_enable = false,
		desync_options = {},
		HelpersAndexploits = {
			safe_knife = false,
			safe_taser = false,
			safe_head = false,
			air_lag = false,
			avoid_backstab = false,
			manual_yaw = 1,
			freestand_enable = false,
			freestand_cond = {}
		},
		misc = {
			gs_indicators_bg = false,
			gs_indicators_animated = false,
			gs_indicators_style = "Skeet",
			gs_indicators_enable = false,
			ping_spike_amount = 0,
			ping_spike_enable = false,
			strafe_disable_standalone = false,
			strafe_velocity = false,
			strafe_enable = false,
			unmute_enable = false,
			logs_enable = false,
			trashtalk_delay = 1,
			trashtalk_enable = false,
			clantag_enable = false,
			no_fall_damage = false,
			trashtalk_mode = {},
			logs_output = {},
			gs_indicators_select = {}
		},
		visual = {
			vm_enable = false,
			anim_ground = 1,
			anim_air = 1,
			anim_enable = false,
			scope_tshape = false,
			scope_gap = 8,
			scope_length = 60,
			hitmarker_wait = 0.3,
			scope_enable = false,
			dmg_offset = 30,
			vm_y = 10,
			dmg_enable = false,
			watermark_speed = 4,
			console_enable = false,
			watermark_mode = 1,
			watermark_text = 1,
			watermark_type = 1,
			watermark_enable = false,
			hitmarker_size = 12,
			hitmarker_gap = 6,
			hitmarker_fade = 0.25,
			aspect_enable = false,
			hitmarker_enable = false,
			vm_knife_left = false,
			vm_z = -10,
			aspect_value = 177,
			vm_x = 10,
			vm_fov = 38,
			vm_default = false,
			watermark_elements = {}
		},
		rage = {
			hc_ns_value = 50,
			hc_ns_enable = false,
			hc_air_value = 60,
			hc_air_enable = false,
			magic_key = false,
			dormant_min_damage = 0,
			dormant_hitchance = 0,
			dormant_enable = false,
			dormant_weapons = {},
			hc_air_weapons = {},
			hc_ns_weapons = {}
		},
		helpers = {
			fast_ladder = false,
			super_toss_predict = false,
			super_toss_fix_move = false,
			super_toss_enable = false
		}
	}
end

function func_0067(arg_82_0)
	return arg_82_0:gsub("^.-%s", "")
end

v_0068 = func_0067(v_0071:get())
cfg_0137 = {
	visual = {},
	misc = {},
	rage = {},
	helpers = {},
	HelpersAndexploits = {}
}

function func_0066()
	cfg_0137 = cfg_0137 or {}
	cfg_0137.HelpersAndexploits = cfg_0137.HelpersAndexploits or {}

	local var_83_0 = cfg_0137.HelpersAndexploits

	var_83_0.safe_head = v_0107:get()
	var_83_0.safe_taser = v_0107.targets:get()
	var_83_0.safe_knife = v_0107.targets:get()
	var_83_0.freestand_enable = rage_cfg.freestand:get()
	var_83_0.freestand_cond = v_0097.cond:get()
	var_83_0.manual_yaw = v_0100:get()
	var_83_0.avoid_backstab = v_0077:get()
	var_83_0.air_lag = v_0076:get()
end

function func_0068()
	cfg_0137 = cfg_0137 or {}
	cfg_0137.visual = cfg_0137.visual or {}
	ref_0052 = cfg_0137.visual
	ref_0052.aspect_enable = v_0115:get()
	ref_0052.aspect_value = dummy_0086 and dummy_0086:get() or 177
	ref_0052.vm_enable = v_0118:get()
	ref_0052.vm_default = menu.render.viewmodel.default:get()
	ref_0052.vm_fov = menu.render.viewmodel.fov:get()
	ref_0052.vm_x = menu.render.viewmodel.x:get()
	ref_0052.vm_y = menu.render.viewmodel.y:get()
	ref_0052.vm_z = menu.render.viewmodel.z:get()
	ref_0052.vm_knife_left = menu.render.viewmodel.opposite_knife:get()
	ref_0052.watermark_enable = v_0121:get()
	ref_0052.watermark_type = empty_0007.wm_type:get()
	ref_0052.watermark_text = empty_0007.text:get()
	ref_0052.watermark_mode = empty_0007.mode:get()
	ref_0052.watermark_elements = empty_0007.elements:get()
	ref_0052.watermark_color1 = empty_0007.cr1:get()
	ref_0052.watermark_color2 = empty_0007.cr2:get()
	ref_0052.watermark_speed = empty_0007.spd:get()
	ref_0054 = empty_0007.cr1:get()
	ref_0056 = empty_0007.cr2:get()
	ref_0052.watermark_color1 = {
		ref_0054.r,
		ref_0054.g,
		ref_0054.b,
		ref_0054.a
	}
	ref_0052.watermark_color2 = {
		ref_0056.r,
		ref_0056.g,
		ref_0056.b,
		ref_0056.a
	}
	ref_0052.hitmarker_enable = v_0128:get()
	ref_0052.hitmarker_wait = v_0128.wait:get()
	ref_0052.hitmarker_fade = v_0128.fade:get()
	ref_0052.hitmarker_gap = v_0128.gap:get()
	ref_0052.hitmarker_size = v_0128.size:get()
	ref_0052.hitmarker_color = v_0128.color:get()
	ref_0055 = v_0128.color:get()
	ref_0052.hitmarker_color = {
		ref_0055.r,
		ref_0055.g,
		ref_0055.b,
		ref_0055.a
	}
	ref_0052.dmg_enable = v_0117:get()
	ref_0052.dmg_color = v_0117.color:get()
	ref_0052.dmg_offset = v_0117.offset:get()
	ref_0052.scope_enable = v_0127:get()
	ref_0052.scope_color = v_0127.color:get()
	ref_0052.scope_length = v_0127.length:get()
	ref_0052.scope_gap = v_0127.gap:get()
	ref_0052.scope_tshape = v_0127.tshape:get()
	ref_0052.anim_enable = v_0130:get()
	ref_0052.anim_air = v_0130.air:get()
	ref_0052.anim_ground = v_0130.ground:get()
	ref_0052.console_enable = v_0131:get()
	ref_0052.console_color = v_0131.color:get()
end

function render_crosshair_6()
	cfg_0137 = cfg_0137 or {}
	cfg_0137.misc = cfg_0137.misc or {}

	local var_85_0 = cfg_0137.misc

	var_85_0.clantag_enable = v_0120:get()
	var_85_0.trashtalk_enable = v_0124:get()
	var_85_0.trashtalk_delay = v_0124.delay:get()
	var_85_0.trashtalk_mode = v_0124.mode:get()
	var_85_0.logs_enable = v_0112:get()
	var_85_0.logs_output = v_0112.output:get()
	var_85_0.unmute_enable = v_0126:get()
	var_85_0.no_fall_damage = v_0113:get()
	var_85_0.strafe_enable = v_0129:get()
	var_85_0.strafe_velocity = v_0129.velocity:get()
	var_85_0.strafe_disable_standalone = v_0129.disable_standalone:get()
	var_85_0.ping_spike_enable = v_0116:get()
	var_85_0.ping_spike_amount = v_0116.amount:get()
	var_85_0.gs_indicators_enable = v_0114:get()
	var_85_0.gs_indicators_style = v_0114.style:get()
	var_85_0.gs_indicators_select = v_0114.select:get()
	var_85_0.gs_indicators_animated = v_0114.animated:get()
	var_85_0.gs_indicators_color = v_0114.color:get()
	var_85_0.gs_indicators_bg = v_0114.bg:get()
	var_85_0.gs_indicators_bg_color = v_0114.bg_color:get()
end

function render_damage_indicator_6()
	cfg_0137 = cfg_0137 or {}
	cfg_0137.rage = cfg_0137.rage or {}

	local var_86_0 = cfg_0137.rage

	var_86_0.dormant_enable = v_0060:get()
	var_86_0.dormant_weapons = v_0060.gunselect:get()
	var_86_0.dormant_hitchance = v_0060.Dormanthitchance:get()
	var_86_0.dormant_min_damage = v_0060.dormantMinDamage:get()
	var_86_0.magic_key = v_0108:get()
	var_86_0.hc_air_enable = v_0095:get()
	var_86_0.hc_air_weapons = empty_0002.weapons:get()
	var_86_0.hc_air_value = empty_0002.value:get()
	var_86_0.hc_ns_enable = v_0084:get()
	var_86_0.hc_ns_weapons = empty_0004.weapons:get()
	var_86_0.hc_ns_value = empty_0004.value:get()
end

function fast_ladder_move()
	cfg_0137 = cfg_0137 or {}
	cfg_0137.helpers = cfg_0137.helpers or {}

	local var_87_0 = cfg_0137.helpers

	var_87_0.super_toss_enable = v_0122:get()
	var_87_0.super_toss_fix_move = empty_0006.fix_move:get()
	var_87_0.super_toss_predict = empty_0006.predict:get()
	var_87_0.fast_ladder = v_0093:get()
end

function apply_settings_2(arg_88_0)
	local var_88_0 = empty_0005[arg_88_0]

	if not var_88_0 then
		return
	end

	var_88_0.def_enable = v_0063:get()
	var_88_0.def_mode = v_0063.mode:get()
	var_88_0.def_pitch = v_0063.pitch:get()
	var_88_0.def_pitch_val = v_0063.pitch_val:get()
	var_88_0.def_pitch_val2 = v_0063.pitch_val2:get()
	var_88_0.def_yaw = v_0063.yaw:get()
	var_88_0.def_yaw_val = v_0063.yaw_val:get()
	var_88_0.def_yaw_val2 = v_0063.yaw_val2:get()
	var_88_0.def_yaw_side = v_0063.yaw_side:get()
	var_88_0.def_yaw_jitter = v_0063.yaw_jitter:get()
	var_88_0.def_spin = v_0063.spin:get()
	var_88_0.pitch_enable = v_0079:get()
	var_88_0.pitch_mode = v_0079.modes:get()
	var_88_0.pitch_custom = v_0079.customsld:get()
	var_88_0.yaw_set_enable = v_0104:get()
	var_88_0.yaw_set_amount = v_0104.yaw_amount:get()
	var_88_0.yaw_enable = v_0094:get()
	var_88_0.yaw_mode = v_0094.mode:get()
	var_88_0.yaw_settings = v_0094.jittersettings:get()
	var_88_0.yaw_offset = v_0094.offset:get()
	var_88_0.yaw_left = v_0094.jittersliderL:get()
	var_88_0.yaw_right = v_0094.jittersliderR:get()
	var_88_0.yaw_delay = v_0094.jitterdelay:get()
	var_88_0.yaw_delay_min = v_0094.delay_min:get()
	var_88_0.yaw_delay_max = v_0094.delay_max:get()
	var_88_0.yaw_fluctuate_time = v_0094.fluctuate_time:get()
	var_88_0.desync_enable = v_0064:get()
	var_88_0.desync_mode = v_0064.mode:get()
	var_88_0.desync_left = v_0064.left:get()
	var_88_0.desync_right = v_0064.right:get()
	var_88_0.desync_speed = v_0064.speed:get()
	var_88_0.desync_options = v_0064.options:get()
	var_88_0.fakelag_enable = v_0069:get()
	var_88_0.fakelag_mode = v_0078:get()
	var_88_0.fakelag_amount = v_0085:get()
	var_88_0.fakelag_min = v_0061:get()
	var_88_0.fakelag_max = v_0089:get()
	var_88_0.fakelag_timer = v_0080:get()
end

function apply_settings_3(arg_89_0)
	ref_0023 = empty_0005[arg_89_0]

	if not ref_0023 then
		return
	end

	if ref_0023.yaw_set_enable ~= nil then
		v_0104:set(ref_0023.yaw_set_enable)
	end

	if ref_0023.yaw_set_amount ~= nil then
		v_0104.yaw_amount:set(ref_0023.yaw_set_amount)
	end

	if ref_0023.pitch_enable ~= nil then
		v_0079:set(ref_0023.pitch_enable)
	end

	if ref_0023.pitch_mode ~= nil then
		v_0079.modes:set(ref_0023.pitch_mode)
	end

	if ref_0023.pitch_custom ~= nil then
		v_0079.customsld:set(ref_0023.pitch_custom)
	end

	render_crosshair()
	v_0094:set(ref_0023.yaw_enable)
	v_0094.mode:set(ref_0023.yaw_mode)
	v_0094.jittersettings:set(ref_0023.yaw_settings)
	v_0094.offset:set(ref_0023.yaw_offset)
	v_0094.jittersliderL:set(ref_0023.yaw_left)
	v_0094.jittersliderR:set(ref_0023.yaw_right)
	v_0094.jitterdelay:set(ref_0023.yaw_delay)
	v_0094.delay_min:set(ref_0023.yaw_delay_min)
	v_0094.delay_max:set(ref_0023.yaw_delay_max)
	v_0094.fluctuate_time:set(ref_0023.yaw_fluctuate_time)
	v_0064:set(ref_0023.desync_enable)
	v_0064.mode:set(ref_0023.desync_mode)
	v_0064.left:set(ref_0023.desync_left)
	v_0064.right:set(ref_0023.desync_right)
	v_0064.speed:set(ref_0023.desync_speed)

	if ref_0023.desync_options ~= nil then
		v_0064.options:set(ref_0023.desync_options)
	end

	v_0063:set(ref_0023.def_enable)
	v_0063.mode:set(ref_0023.def_mode)
	v_0063.pitch:set(ref_0023.def_pitch)
	v_0063.pitch_val:set(ref_0023.def_pitch_val)
	v_0063.pitch_val2:set(ref_0023.def_pitch_val2)
	v_0063.yaw:set(ref_0023.def_yaw)
	v_0063.yaw_val:set(ref_0023.def_yaw_val)
	v_0063.yaw_val2:set(ref_0023.def_yaw_val2)
	v_0063.yaw_side:set(ref_0023.def_yaw_side or 0)
	v_0063.yaw_jitter:set(ref_0023.def_yaw_jitter)
	v_0063.spin:set(ref_0023.def_spin)

	if ref_0023.fakelag_enable ~= nil then
		v_0069:set(ref_0023.fakelag_enable)
	end

	if ref_0023.fakelag_mode ~= nil then
		v_0078:set(ref_0023.fakelag_mode)
	end

	if ref_0023.fakelag_amount ~= nil then
		v_0085:set(ref_0023.fakelag_amount)
	end

	if ref_0023.fakelag_min ~= nil then
		v_0061:set(ref_0023.fakelag_min)
	end

	if ref_0023.fakelag_max ~= nil then
		v_0089:set(ref_0023.fakelag_max)
	end

	if ref_0023.fakelag_timer ~= nil then
		v_0080:set(ref_0023.fakelag_timer)
	end
end

function apply_settings_4()
	cfg_0137 = cfg_0137 or {}
	cfg_0137.HelpersAndexploits = cfg_0137.HelpersAndexploits or {}

	local var_90_0 = cfg_0137.HelpersAndexploits

	if not var_90_0 then
		return
	end

	v_0107:set(var_90_0.safe_head)
	v_0107.targets:set(var_90_0.safe_taser and var_90_0.safe_knife)
	rage_cfg.freestand:set(var_90_0.freestand_enable)
	v_0100:set(var_90_0.manual_yaw)
	v_0077:set(var_90_0.avoid_backstab)
	v_0076:set(var_90_0.air_lag)
end

function apply_settings_5()
	ref_0026 = cfg_0137.visual

	if not ref_0026 then
		return
	end

	v_0115:set(ref_0026.aspect_enable)

	if dummy_0086 then
		dummy_0086:set(ref_0026.aspect_value)
	end

	v_0118:set(ref_0026.vm_enable)
	menu.render.viewmodel.default:set(ref_0026.vm_default)
	menu.render.viewmodel.fov:set(ref_0026.vm_fov)
	menu.render.viewmodel.x:set(ref_0026.vm_x)
	menu.render.viewmodel.y:set(ref_0026.vm_y)
	menu.render.viewmodel.z:set(ref_0026.vm_z)
	menu.render.viewmodel.opposite_knife:set(ref_0026.vm_knife_left)

	if ref_0026.hitmarker_enable ~= nil then
		v_0128:set(ref_0026.hitmarker_enable)
	end

	if ref_0026.hitmarker_wait ~= nil then
		v_0128.wait:set(ref_0026.hitmarker_wait)
	end

	if ref_0026.hitmarker_fade ~= nil then
		v_0128.fade:set(ref_0026.hitmarker_fade)
	end

	if ref_0026.hitmarker_gap ~= nil then
		v_0128.gap:set(ref_0026.hitmarker_gap)
	end

	if ref_0026.hitmarker_size ~= nil then
		v_0128.size:set(ref_0026.hitmarker_size)
	end

	if ref_0026.hitmarker_color then
		v_0128.color:set(color(ref_0026.hitmarker_color[1], ref_0026.hitmarker_color[2], ref_0026.hitmarker_color[3], ref_0026.hitmarker_color[4]))
	end

	ref_0027 = ref_0026.hitmarker_color

	if ref_0027 then
		v_0128.color:set(color(ref_0027[1], ref_0027[2], ref_0027[3], ref_0027[4]))
	end

	v_0121:set(ref_0026.watermark_enable)
	empty_0007.wm_type:set(ref_0026.watermark_type)
	empty_0007.text:set(ref_0026.watermark_text)
	empty_0007.mode:set(ref_0026.watermark_mode)
	empty_0007.elements:set(ref_0026.watermark_elements)
	empty_0007.cr1:set(ref_0026.watermark_color1)
	empty_0007.cr2:set(ref_0026.watermark_color2)
	empty_0007.spd:set(ref_0026.watermark_speed)

	if ref_0026.watermark_color1 then
		empty_0007.cr1:set(color(ref_0026.watermark_color1[1], ref_0026.watermark_color1[2], ref_0026.watermark_color1[3], ref_0026.watermark_color1[4]))
	end

	if ref_0026.watermark_color2 then
		empty_0007.cr2:set(color(ref_0026.watermark_color2[1], ref_0026.watermark_color2[2], ref_0026.watermark_color2[3], ref_0026.watermark_color2[4]))
	end

	v_0117:set(ref_0026.dmg_enable)
	v_0117.color:set(ref_0026.dmg_color)
	v_0117.offset:set(ref_0026.dmg_offset)
	v_0127:set(ref_0026.scope_enable)
	v_0127.color:set(ref_0026.scope_color)
	v_0127.length:set(ref_0026.scope_length)
	v_0127.gap:set(ref_0026.scope_gap)
	v_0127.tshape:set(ref_0026.scope_tshape)
	v_0130:set(ref_0026.anim_enable)
	v_0130.air:set(ref_0026.anim_air)
	v_0130.ground:set(ref_0026.anim_ground)
	v_0131:set(ref_0026.console_enable)
	v_0131.color:set(ref_0026.console_color)
end

function render_crosshair_7()
	local var_92_0 = cfg_0137.misc

	if not var_92_0 then
		return
	end

	v_0120:set(var_92_0.clantag_enable)
	v_0124:set(var_92_0.trashtalk_enable)
	v_0124.delay:set(var_92_0.trashtalk_delay)
	v_0124.mode:set(var_92_0.trashtalk_mode)
	v_0112:set(var_92_0.logs_enable)
	v_0112.output:set(var_92_0.logs_output)
	v_0126:set(var_92_0.unmute_enable)
	v_0113:set(var_92_0.no_fall_damage)

	if var_92_0.strafe_enable ~= nil then
		v_0129:set(var_92_0.strafe_enable)
	end

	v_0129.velocity:set(var_92_0.strafe_velocity)
	v_0129.disable_standalone:set(var_92_0.strafe_disable_standalone)
	v_0116:set(var_92_0.ping_spike_enable)
	v_0116.amount:set(var_92_0.ping_spike_amount)

	if var_92_0.gs_indicators_enable ~= nil then
		v_0114:set(var_92_0.gs_indicators_enable)
	end

	if var_92_0.gs_indicators_style then
		v_0114.style:set(var_92_0.gs_indicators_style)
	end

	if var_92_0.gs_indicators_select then
		v_0114.select:set(var_92_0.gs_indicators_select)
	end

	if var_92_0.gs_indicators_animated ~= nil then
		v_0114.animated:set(var_92_0.gs_indicators_animated)
	end

	if var_92_0.gs_indicators_color then
		v_0114.color:set(var_92_0.gs_indicators_color)
	end

	if var_92_0.gs_indicators_bg ~= nil then
		v_0114.bg:set(var_92_0.gs_indicators_bg)
	end

	if var_92_0.gs_indicators_bg_color then
		v_0114.bg_color:set(var_92_0.gs_indicators_bg_color)
	end
end

function render_damage_indicator_7()
	local var_93_0 = cfg_0137.rage

	if not var_93_0 then
		return
	end

	v_0060:set(var_93_0.dormant_enable)
	v_0060.gunselect:set(var_93_0.dormant_weapons)
	v_0060.Dormanthitchance:set(var_93_0.dormant_hitchance)
	v_0060.dormantMinDamage:set(var_93_0.dormant_min_damage)
	v_0108:set(var_93_0.magic_key)
	v_0095:set(var_93_0.hc_air_enable)
	empty_0002.weapons:set(var_93_0.hc_air_weapons)
	empty_0002.value:set(var_93_0.hc_air_value)
	v_0084:set(var_93_0.hc_ns_enable)
	empty_0004.weapons:set(var_93_0.hc_ns_weapons)
	empty_0004.value:set(var_93_0.hc_ns_value)
end

function fast_ladder_move_2()
	local var_94_0 = cfg_0137.helpers

	if not var_94_0 then
		return
	end

	v_0122:set(var_94_0.super_toss_enable)
	empty_0006.fix_move:set(var_94_0.super_toss_fix_move)
	empty_0006.predict:set(var_94_0.super_toss_predict)

	if var_94_0.fast_ladder ~= nil then
		v_0093:set(var_94_0.fast_ladder)
	end
end

function fast_ladder_move_3()
	local var_95_0 = entity.get_local_player()

	if not var_95_0 then
		return val_0165
	end

	local var_95_1 = var_95_0.m_vecVelocity

	if not var_95_1 then
		return val_0165
	end

	local var_95_2 = math.sqrt((var_95_1.x or 0)^2 + (var_95_1.y or 0)^2)
	local var_95_3 = var_95_0.m_fFlags or 0
	local var_95_4 = var_95_0.m_flDuckAmount or 0
	local var_95_5 = bit.band(var_95_3, 1) == 1
	local var_95_6 = "Standing"

	if rage_cfg.aa_slowwalk and rage_cfg.aa_slowwalk:get() then
		var_95_6 = "Slow Walk"
	elseif not var_95_5 then
		if var_95_4 > 0.7 then
			var_95_6 = "Air Duck"
		else
			var_95_6 = "Air"
		end
	elseif var_95_4 > 0.7 then
		if var_95_2 > 15 then
			var_95_6 = "Crouch Moving"
		else
			var_95_6 = "Crouching"
		end
	elseif var_95_2 > 20 and var_95_2 < 110 then
		var_95_6 = "Walking"
	elseif var_95_2 >= 110 then
		var_95_6 = "Moving"
	end

	if var_95_6 ~= val_0165 then
		const_0198 = const_0198 + 1

		if const_0198 >= const_0199 then
			val_0165 = var_95_6
			const_0198 = 0
		end
	else
		const_0198 = 0
	end

	return val_0165
end

function ui_callback_handler(arg_96_0)
	if not v_0093:get() then
		return
	end

	local var_96_0 = entity.get_local_player()

	if not var_96_0 then
		return
	end

	if var_96_0.m_MoveType == 9 then
		arg_96_0.view_angles.y = math.floor(arg_96_0.view_angles.y + 0.5)

		if arg_96_0.forwardmove > 0 then
			if arg_96_0.view_angles.x < 45 then
				arg_96_0.view_angles.x = 89
				arg_96_0.in_moveright = 1
				arg_96_0.in_moveleft = 0
				arg_96_0.in_forward = 0
				arg_96_0.in_back = 1

				if arg_96_0.sidemove == 0 then
					arg_96_0.view_angles.y = arg_96_0.view_angles.y + 90
				elseif arg_96_0.sidemove < 0 then
					arg_96_0.view_angles.y = arg_96_0.view_angles.y + 150
				elseif arg_96_0.sidemove > 0 then
					arg_96_0.view_angles.y = arg_96_0.view_angles.y + 30
				end
			end
		elseif arg_96_0.forwardmove < 0 then
			arg_96_0.view_angles.x = 89
			arg_96_0.in_moveleft = 1
			arg_96_0.in_moveright = 0
			arg_96_0.in_forward = 1
			arg_96_0.in_back = 0

			if arg_96_0.sidemove == 0 then
				arg_96_0.view_angles.y = arg_96_0.view_angles.y + 90
			elseif arg_96_0.sidemove < 0 then
				arg_96_0.view_angles.y = arg_96_0.view_angles.y + 150
			elseif arg_96_0.sidemove < 0 then
				arg_96_0.view_angles.y = arg_96_0.view_angles.y + 30
			end
		end
	end
end

v_0071:set_callback(function()
	local var_97_0 = func_0067(v_0071:get())

	apply_settings_2(v_0068)
	apply_settings_3(var_97_0)

	v_0068 = var_97_0
end)

function apply_settings_6(arg_98_0)
	arg_98_0 = arg_98_0 % 360

	if arg_98_0 > 180 then
		arg_98_0 = arg_98_0 - 360
	elseif arg_98_0 < -180 then
		arg_98_0 = arg_98_0 + 360
	end

	return arg_98_0
end

function apply_settings_7(arg_99_0)
	local var_99_0 = globals.tickcount

	arg_99_0._lr_state = arg_99_0._lr_state or {
		next_switch = 0,
		side = 0,
		next_stage_switch = 0,
		stage = 1
	}

	local var_99_1 = arg_99_0._lr_state
	local var_99_2 = arg_99_0.yaw_delay or "Default"
	local var_99_3 = 1

	if var_99_2 == "Normal" then
		var_99_3 = 4
	elseif var_99_2 == "Medium" then
		var_99_3 = 8
	elseif var_99_2 == "High" then
		var_99_3 = 20
	elseif var_99_2 == "Fluctate" then
		if not var_99_1.fluct then
			var_99_1.fluct = false
		end

		var_99_1.fluct = not var_99_1.fluct
		var_99_3 = var_99_1.fluct and (arg_99_0.yaw_delay_min or 1) or arg_99_0.yaw_delay_max or 15
	elseif var_99_2 == "Random" then
		var_99_3 = math.random(arg_99_0.yaw_delay_min or 1, arg_99_0.yaw_delay_max or 15)
	else
		var_99_3 = 1
	end

	local var_99_4 = math.max(1, var_99_3 * 2)

	if var_99_0 >= var_99_1.next_switch then
		var_99_1.side = var_99_1.side == 0 and 1 or 0
		var_99_1.next_switch = var_99_0 + var_99_4
	end

	local var_99_5 = false

	if arg_99_0.yaw_randomization and arg_99_0.yaw_randomization > 0 then
		var_99_5 = math.random(0, 100) < arg_99_0.yaw_randomization
	end

	local var_99_6 = var_99_1.side

	if var_99_5 then
		var_99_6 = math.random(0, 1) == 0 and 0 or 1
	end

	if arg_99_0.yaw_settings == "Custom" then
		if var_99_6 == 1 then
			return arg_99_0.yaw_right or 0
		else
			return arg_99_0.yaw_left or 0
		end
	else
		local var_99_7 = arg_99_0.yaw_offset or 0

		return var_99_6 == 1 and var_99_7 or -var_99_7
	end
end

events.createmove:set(function(arg_100_0)
	render_damage_indicator_2()
	clan_tag_update()
	render_damage_indicator_5()
	clan_tag_update_2(arg_100_0)
	ui_callback_handler(arg_100_0)

	if v_0108:get() then
		render_damage_indicator_3()
	else
		render_damage_indicator_4()
	end

	entity_get_local_player_2 = entity.get_local_player()

	if not entity_get_local_player_2 then
		return
	end

	v_0111 = fast_ladder_move_3()

	if v_0095:get() then
		v_0070 = empty_0002.weapons:get()
		v_0066 = v_0111 == "Air" or v_0111 == "Air Duck"

		if v_0070 and #v_0070 > 0 then
			v_0065 = empty_0002.value:get()

			function on_createmove_2(arg_101_0)
				for iter_101_0, iter_101_1 in ipairs(v_0070) do
					if iter_101_1 == arg_101_0 then
						return true
					end
				end

				return false
			end

			function on_createmove_3(arg_102_0, arg_102_1)
				if not arg_102_0 then
					return
				end

				if v_0066 and (on_createmove_2(arg_102_1) or on_createmove_2("Global")) then
					if empty_0003[arg_102_1] == nil then
						empty_0003[arg_102_1] = arg_102_0:get()
					end

					arg_102_0:override(v_0065)
				elseif empty_0003[arg_102_1] ~= nil then
					arg_102_0:override(empty_0003[arg_102_1])

					empty_0003[arg_102_1] = nil
				end
			end

			v_0109 = rage_cfg.hitchance

			on_createmove_3(v_0109.global, "Global")
			on_createmove_3(v_0109.awp, "AWP")
			on_createmove_3(v_0109.scout, "SSG-08")
			on_createmove_3(v_0109.autosnipers, "AutoSnipers")
			on_createmove_3(v_0109.rifles, "Rifles")
			on_createmove_3(v_0109.pistols, "Pistols")
		end
	end

	v_0062 = empty_0005[v_0111]

	if not v_0062 then
		return
	end

	if v_0062.pitch_enable then
		v_0088 = v_0062.pitch_mode

		if v_0088 == "Off" then
			rage_cfg.aa_pitch:override("Disabled")
		elseif v_0088 == "Down" then
			rage_cfg.aa_pitch:override("Down")
		elseif v_0088 == "Zero" then
			rage_cfg.aa_pitch:override("Disabled")
			rage.antiaim:override_hidden_pitch(0)
		elseif v_0088 == "Minimal" then
			rage_cfg.aa_pitch:override("Down")
		end
	else
		rage_cfg.aa_pitch:override()
		rage.antiaim:override_hidden_pitch(0)
	end

	cfg_0163.command_number = arg_100_0.command_number
	cfg_0163.choked_commands = arg_100_0.choked_commands
	v_0092 = entity_get_local_player_2.m_nTickBase or 0

	if cfg_0163.command_number ~= 0 then
		cfg_0163.ticks_processed = math.clamp(math.abs(v_0092 - cfg_0163.tickbase_difference), 0, cfg_0163.max_process_ticks - cfg_0163.choked_commands)
		cfg_0163.tickbase_difference = math.max(v_0092, cfg_0163.tickbase_difference)
		cfg_0163.command_number = 0
	end

	if v_0107:get() and not v_0076:get() then
		v_0082 = v_0107.targets:get()

		if not v_0082 or #v_0082 == 0 then
			return
		end

		v_0061 = false
		v_0060 = false

		for iter_100_0, iter_100_1 in ipairs(v_0082) do
			v_0035 = iter_100_1:gsub("^.-%s", "")

			if v_0035 == "Safe Knife" then
				v_0061 = true
			elseif v_0035 == "Safe Taser" then
				v_0060 = true
			end
		end

		v_0083 = entity_get_local_player_2:get_player_weapon()

		if v_0083 then
			v_0074 = v_0083:get_classname()
			v_0014 = v_0074 and v_0074:find("Knife")
			v_0012 = v_0074 == "CWeaponTaser"

			if (v_0111 == "Air" or v_0111 == "Air Duck") and (v_0061 and v_0014 or v_0060 and v_0012) then
				rage_cfg.aa_yaw_offset:override(0)
				rage_cfg.aa_modifier:override("Disabled")
				rage_cfg.aa_modifier_offset:override(0)
				rage_cfg.body_left:override(0)
				rage_cfg.body_right:override(0)
				rage.antiaim:override_hidden_pitch(0)
				rage.antiaim:override_hidden_yaw_offset(0)
				rage_cfg.aa_hidden:override(false)

				return
			end
		end
	end

	v_0102 = visibility_updater_2(v_0111)

	if rage_cfg.freestand then
		if v_0102 then
			rage_cfg.aa_hidden:override(false)
			rage_cfg.aa_modifier:override("Disabled")
		end

		rage_cfg.freestand:override(v_0102)
	end

	const_0191 = 0

	if v_0062.yaw_enable then
		v_0087 = v_0062.yaw_delay ~= "Default"
		v_0072 = apply_settings_7(v_0062)
		v_0101 = v_0062._lr_state.side == 1 and 1 or -1

		if v_0062.yaw_enable and v_0062.yaw_delay ~= "Default" then
			const_0191 = apply_settings_7(v_0062)
		end

		v_0051 = v_0062.yaw_mode

		if v_0062.yaw_enable and v_0062.yaw_delay ~= "Default" then
			rage_cfg.aa_modifier:override("Disabled")
			rage_cfg.aa_modifier_offset:override(0)
		elseif v_0051 == "Disabled" then
			rage_cfg.aa_modifier:override("Disabled")
			rage_cfg.aa_modifier_offset:override(0)
		elseif v_0051 == "Center" then
			rage_cfg.aa_modifier:override("Center")

			if v_0062.yaw_settings == "Custom" then
				v_0013 = v_0062.yaw_right or 0
				v_0023 = v_0062.yaw_left or 0
				v_0039 = v_0101 == 1 and v_0013 or -v_0023

				rage_cfg.aa_modifier_offset:override(v_0039)
			else
				rage_cfg.aa_modifier_offset:override(0)
			end
		elseif v_0051 == "Offset" then
			if v_0062.yaw_settings == "Custom" then
				rage_cfg.aa_modifier:override("Center")

				if not v_0062.yaw_left then
					const_0172 = 0
				end

				if not v_0062.yaw_right then
					const_0181 = 0
				end

				v_0021 = v_0062._lr_state.side == 1 and (v_0062.yaw_right or 0) or v_0062.yaw_left or 0

				rage_cfg.aa_modifier_offset:override(v_0021)
			else
				rage_cfg.aa_modifier:override("Offset")

				v_0028 = v_0062.yaw_offset or 0
				v_0041 = v_0062._lr_state.side == 1 and v_0028 or -v_0028

				rage_cfg.aa_modifier_offset:override(v_0041)
			end
		elseif v_0051 == "Random" then
			if v_0062.yaw_settings == "Custom" then
				rage_cfg.aa_modifier:override("Center")

				v_0040 = v_0062.yaw_left or 0
				v_0029 = v_0062.yaw_right or 0

				rage_cfg.aa_modifier_offset:override(math.random(math.min(v_0040, v_0029), math.max(v_0040, v_0029)))
			else
				rage_cfg.aa_modifier:override("Offset")

				v_0057 = v_0062.yaw_offset or 0

				rage_cfg.aa_modifier_offset:override(math.random(-v_0057, v_0057))
			end
		elseif v_0051 == "3-Way" then
			if v_0062.yaw_settings == "Custom" then
				rage_cfg.aa_modifier:override("Center")

				v_0015 = v_0062.yaw_left or 0
				v_0018 = v_0062.yaw_right or 0
				t_0024 = {
					v_0015,
					0,
					v_0018
				}

				rage_cfg.aa_modifier_offset:override(t_0024[globals.tickcount % 3 + 1])
			else
				rage_cfg.aa_modifier:override("Offset")

				v_0024 = v_0062.yaw_offset or 0
				t_0025 = {
					-v_0024,
					0,
					v_0024
				}

				rage_cfg.aa_modifier_offset:override(t_0025[globals.tickcount % 3 + 1])
			end
		elseif v_0051 == "5-Way" then
			if v_0062.yaw_settings == "Custom" then
				rage_cfg.aa_modifier:override("Center")

				v_0053 = v_0062.yaw_left or 0
				v_0047 = v_0062.yaw_right or 0
				t_0022 = {
					v_0053,
					v_0053 / 2,
					0,
					v_0047 / 2,
					v_0047
				}

				rage_cfg.aa_modifier_offset:override(t_0022[globals.tickcount % 5 + 1])
			else
				rage_cfg.aa_modifier:override("Offset")

				v_0026 = v_0062.yaw_offset or 0
				t_0028 = {
					-v_0026,
					-v_0026 / 2,
					0,
					v_0026 / 2,
					v_0026
				}

				rage_cfg.aa_modifier_offset:override(t_0028[globals.tickcount % 5 + 1])
			end
		end
	elseif not v_0102 then
		rage_cfg.aa_modifier:override("Disabled")
		rage_cfg.aa_modifier_offset:override(0)
	end

	v_0099 = v_0103:get():gsub("^.-%s", "")

	if v_0099 ~= dummy_0081 then
		if v_0099 == "Local View" then
			rage_cfg.aa_yaw_base:override("Local view")
		elseif v_0099 == "At Target" then
			rage_cfg.aa_yaw_base:override("At Target")
		end

		dummy_0081 = v_0099
	end

	v_0058 = false
	entity_get_local_player_5 = entity.get_local_player()

	if v_0077:get() and entity_get_local_player_5 then
		entity_get_players = entity.get_players(true)

		for iter_100_2, iter_100_3 in ipairs(entity_get_players) do
			if iter_100_3 and iter_100_3:is_alive() then
				v_0038 = iter_100_3:get_player_weapon()

				if v_0038 then
					v_0017 = v_0038:get_classname()

					if v_0017 then
						v_0025 = v_0017:find("Knife")
						v_0019 = v_0017 == "CWeaponTaser"
						v_0034 = v_0017 == "CWeaponGlock"

						if (v_0025 or v_0019 or v_0034) and (entity_get_local_player_5:get_origin() - iter_100_3:get_origin()):length() < 150 then
							v_0058 = true

							break
						end
					end
				end
			end
		end
	end

	v_0020 = v_0100:get():gsub("^.-%s", "")

	rage_cfg.aa_yaw:override("Backward")

	const_0184 = 0
	const_0178 = 0

	if v_0062.yaw_set_enable then
		const_0184 = v_0104.yaw_amount:get()
	end

	if v_0020 == "Left" then
		const_0178 = -90
	elseif v_0020 == "Right" then
		const_0178 = 90
	elseif v_0020 == "Forward" then
		const_0178 = 180
	elseif v_0020 == "Backward" or v_0020 == "Off" then
		const_0178 = 0
	end

	v_0052 = entity_get_local_player_5.m_vecVelocity:length2d()

	if v_0129.velocity:get() then
		v_0062.lerp_velocity = v_0062.lerp_velocity or 0
		v_0062.lerp_velocity = v_0062.lerp_velocity + ((v_0052 > 5 and v_0052 / 20 or 0) - v_0062.lerp_velocity) * 0.33

		if v_0062.lerp_velocity ~= 0 then
			rage_cfg.strafe_smooth:override(math.clamp(35 / (0.08 * v_0062.lerp_velocity), 17.5, 100))
		end
	else
		rage_cfg.strafe_smooth:override()
	end

	if v_0129.disable_standalone:get() then
		rage_cfg.strafe:override(v_0052 > 5)
	else
		rage_cfg.strafe:override()
	end

	if v_0076:get() then
		v_0043 = entity_get_local_player_5.m_fFlags or 0

		if not (bit.band(v_0043, 1) == 1) then
			if (arg_100_0.choked_commands or 0) < 17 then
				rage_cfg.dt_lag:override("Adaptive")
				rage.exploit:force_teleport()
				rage.exploit:force_charge()
			else
				rage_cfg.dt_lag:override()
			end
		else
			rage_cfg.dt_lag:override()
		end
	end

	if v_0058 then
		rage_cfg.aa_manual:override(180)
	elseif v_0094:get() then
		rage_cfg.aa_manual:override(const_0184 + const_0178 + const_0191)
	else
		rage_cfg.aa_manual:override(const_0184 + const_0178)
	end

	v_0034 = false

	if v_0062 and v_0062.def_enable then
		if v_0062.def_mode == "Always On" then
			v_0034 = true
		elseif v_0062.def_mode == "On Peek" then
			v_0034 = rage.exploit:get()
		end
	end

	if v_0062.def_enable and v_0062.def_mode == "Always On" then
		rage_cfg.dt_lag:override("Always on")
	else
		rage_cfg.dt_lag:override()
	end

	if v_0062.desync_enable or v_0034 then
		rage_cfg.aa_bodyyaw:override(true)
	else
		rage_cfg.aa_bodyyaw:override()
	end

	v_0062._desync_random_next = v_0062._desync_random_next or 0
	v_0062._desync_random_l = v_0062._desync_random_l or 0
	v_0062._desync_random_r = v_0062._desync_random_r or 0

	if v_0062.desync_enable and not v_0034 then
		math_floor_fn = math.floor(v_0062.desync_left or 0)
		math_floor_2 = math.floor(v_0062.desync_right or 0)
		v_0037 = v_0062.desync_mode or 1
		v_0016 = math_floor_fn
		v_0027 = math_floor_2

		if v_0037 == 1 then
			v_0016 = math_floor_fn
			v_0027 = math_floor_2
		elseif v_0037 == 2 then
			if globals.tickcount % 2 == 0 then
				v_0062._desync_jitter = not v_0062._desync_jitter
			end

			if v_0062._desync_jitter then
				v_0016 = math_floor_fn
				v_0027 = math_floor_2
			else
				v_0016 = math_floor_2
				v_0027 = math_floor_fn
			end
		elseif v_0037 == 3 then
			if globals.curtime >= v_0062._desync_random_next then
				v_0062._desync_random_l = math.random(0, math_floor_fn)
				v_0062._desync_random_r = math.random(0, math_floor_2)
				v_0062._desync_random_next = globals.curtime + 0.15
			end

			v_0016 = v_0062._desync_random_l
			v_0027 = v_0062._desync_random_r
		elseif v_0037 == 4 then
			v_0044 = v_0062.desync_speed or 5
			math_abs_fn = math.abs(math.sin(globals.curtime * v_0044))
			v_0016 = math.floor(math_abs_fn * math_floor_fn)
			v_0027 = math.floor(math_abs_fn * math_floor_2)
		end

		v_0033 = v_0062.desync_options
		e_0001 = {}

		if v_0033 and #v_0033 > 0 then
			for iter_100_4, iter_100_5 in ipairs(v_0033) do
				v_0032 = iter_100_5:gsub("^.-%s", "")

				if v_0032 == "Jitter" then
					table.insert(e_0001, "Jitter")
				elseif v_0032 == "Randomize Jitter" then
					table.insert(e_0001, "Randomize Jitter")
				elseif v_0032 == "Anti Bruteforce" then
					table.insert(e_0001, "Anti Bruteforce")
				end
			end
		end

		if #e_0001 > 0 then
			rage_cfg.body_options:override(e_0001)
		else
			rage_cfg.body_options:override()
		end

		math_clamp_fn = math.clamp(v_0016, 0, 60)
		math_clamp_2 = math.clamp(v_0027, 0, 60)

		rage_cfg.body_left:override(math_clamp_fn)
		rage_cfg.body_right:override(math_clamp_2)
	elseif not v_0034 then
		rage_cfg.body_left:override()
		rage_cfg.body_right:override()
		rage_cfg.body_options:override()
	end

	if not v_0062 or not v_0062.def_enable then
		rage_cfg.aa_hidden:override(false)
	else
		v_0036 = false

		if v_0062.def_mode == "Always On" then
			v_0036 = true
		elseif v_0062.def_mode == "On Peek" then
			v_0036 = rage.exploit:get()
		else
			v_0036 = false
		end

		if not v_0036 then
			rage_cfg.aa_hidden:override(false)
		else
			rage_cfg.aa_hidden:override(true)

			globals_ref = globals.tickcount % 2 == 0
			v_0031 = v_0062.def_yaw_val
			v_0022 = v_0062.def_yaw_val2
			v_0054 = v_0062.def_yaw_side
			v_0049 = v_0062.def_pitch_val
			v_0058 = v_0062.def_pitch_val2

			if v_0058 < v_0049 then
				v_0049, v_0058 = v_0058, v_0049
			end

			if v_0062.def_pitch == "Static" then
				rage.antiaim:override_hidden_pitch(v_0062.def_pitch_val)
			elseif v_0062.def_pitch == "Switch" then
				if globals.tickcount % 6 == 0 then
					v_0062._pitch_switch = not v_0062._pitch_switch
				end

				rage.antiaim:override_hidden_pitch(v_0062._pitch_switch and v_0049 or v_0058)
			elseif v_0062.def_pitch == "Jitter" then
				if globals.tickcount % 4 == 0 then
					v_0062._pitch_jitter = not v_0062._pitch_jitter
				end

				v_0035 = v_0062._pitch_jitter and v_0049 or v_0058

				rage.antiaim:override_hidden_pitch(v_0035)
			elseif v_0062.def_pitch == "Random" then
				rage.antiaim:override_hidden_pitch(math.random(v_0049, v_0058))
			elseif v_0062.def_pitch == "Sway" then
				v_0030 = (v_0058 - v_0049) / 2
				v_0029 = (v_0058 + v_0049) / 2
				math_sin = math.sin(globals.curtime * 2) * v_0030

				rage.antiaim:override_hidden_pitch(v_0029 + math_sin)
			elseif v_0062.def_pitch == "Slide" then
				v_0062._slide = v_0062._slide or v_0049
				const_0188 = 0.5
				v_0062._slide = v_0062._slide + const_0188

				if v_0058 < v_0062._slide then
					v_0062._slide = v_0049
				end

				rage.antiaim:override_hidden_pitch(v_0062._slide)
			end

			if v_0062.def_yaw == "Sideways" then
				v_0062._side = v_0062._side or false

				if globals.tickcount % 2 == 0 then
					v_0062._side = not v_0062._side
				end

				v_0045 = v_0062._side and v_0031 or v_0022

				rage.antiaim:override_hidden_yaw_offset(apply_settings_6(v_0045))
			elseif v_0062.def_yaw == "Side-based" then
				rage.antiaim:override_hidden_yaw_offset(v_0054)
			elseif v_0062.def_yaw == "Spin" then
				const_0197 = (const_0197 + v_0062.def_spin * 4) % 360

				rage.antiaim:override_hidden_yaw_offset(const_0197 - 180)
			elseif v_0062.def_yaw == "Random" then
				math_min_2 = math.min(v_0031, v_0022)
				math_max_2 = math.max(v_0031, v_0022)
				utils_random_int = utils.random_int(math_min_2, math_max_2)

				rage.antiaim:override_hidden_yaw_offset(apply_settings_6(utils_random_int))
			elseif v_0062.def_yaw == "Jitter" then
				v_0062._yaw_jitter = v_0062._yaw_jitter or false

				if globals.tickcount % 2 == 0 then
					v_0062._yaw_jitter = not v_0062._yaw_jitter
				end

				v_0032 = v_0062.def_yaw_jitter or 0
				v_0050 = v_0062._yaw_jitter and v_0032 or -v_0032

				rage.antiaim:override_hidden_yaw_offset(apply_settings_6(v_0050))
			elseif v_0062.def_yaw == "Sway" then
				math_min_fn = math.min(v_0031, v_0022)
				math_max_fn = math.max(v_0031, v_0022)
				v_0031 = (math_max_fn - math_min_fn) / 2
				v_0033 = (math_max_fn + math_min_fn) / 2
				math_sin_2 = math.sin(globals.curtime * 3) * v_0031

				rage.antiaim:override_hidden_yaw_offset(apply_settings_6(v_0033 + math_sin_2))
			end
		end
	end

	if v_0122:get() then
		if val_0162 then
			rage_cfg.strafe:override()
			rage_cfg.strafe_smooth:override()

			val_0162 = false
		end

		if arg_100_0.jitter_move then
			entity_get_local_player_4 = entity.get_local_player()

			if entity_get_local_player_4 and entity_get_local_player_4:is_alive() then
				v_0036 = entity_get_local_player_4:get_player_weapon()

				if v_0036 then
					v_0055 = v_0036:get_weapon_info()

					if v_0055 and v_0055.weapn_type == 9 then
						v_0059 = v_0036.mfThrowTime or 0
						rage_exploit = 0.1 * rage.exploit:get()

						if v_0059 > 0 and v_0059 - rage_exploit <= globals.curtime then
							if empty_0006.fix_move:get() then
								rage_cfg.strafe:override(false)
								rage_cfg.strafe_smooth:override(0)

								val_0162 = true
							end

							v_0030 = entity_get_local_player_4.m_vecVelocity

							if empty_0006.predict:get() then
								v_0038 = entity_get_local_player_4:simulate_movement()

								v_0038:think(1)

								v_0030 = v_0038.velocity
							end

							if entity_get_local_player_4.m_MoveType == 9 then
								arg_100_0.in_moveleft = 0
								arg_100_0.inmoveright = 0
								arg_100_0.in_forward = 0
								arg_100_0.in_back = 0
								v_0030 = vector(0, 0, 0)
							end

							arg_100_0.view_angles = render_crosshair_15(arg_100_0.view_angles, v_0055.throw_velocity, v_0036.m_flThrowStrength, v_0030)
						end
					end
				end
			end
		end
	end

	if v_0069:get() then
		entity_get_local_player_3 = entity.get_local_player()

		if not entity_get_local_player_3 or not entity_get_local_player_3:is_alive() then
			return
		end

		v_0048 = v_0078:get()
		v_0037 = arg_100_0.choked_commands or 0
		v_0042 = v_0085:get()

		if v_0048 == 1 then
			v_0042 = v_0085:get()
		elseif v_0048 == 2 then
			v_0056 = entity_get_local_player_3.m_vecVelocity:length2d()

			if v_0056 < 20 then
				v_0042 = v_0089:get()
			elseif v_0056 < 120 then
				v_0042 = math.floor((v_0061:get() + v_0089:get()) / 2)
			else
				v_0042 = v_0061:get()
			end
		elseif v_0048 == 3 then
			const_0194 = const_0194 + 1

			if const_0194 > v_0080:get() * 10 then
				val_0142 = not val_0142
				const_0194 = 0
			end

			if val_0142 then
				v_0042 = v_0089:get()
			else
				v_0042 = v_0061:get()
			end
		elseif v_0048 == 4 then
			v_0046 = entity_get_local_player_3.m_vecVelocity:length2d()
			v_0042 = math.clamp(math.floor(v_0046 / 20), v_0061:get(), v_0089:get())
		elseif v_0048 == 5 then
			const_0192 = const_0192 + 1

			if const_0192 > 10 then
				const_0195 = math.random(v_0061:get(), v_0089:get())
				const_0192 = 0
			end

			v_0042 = const_0195
		end

		if v_0037 < v_0042 then
			arg_100_0.send_packet = false
		else
			arg_100_0.send_packet = true
		end
	else
		arg_100_0.send_packet = true
	end
end)
apply_settings_2(v_0068)

function visibility_updater_3()
	local var_103_0 = func_0067(v_0071:get())
	local var_103_1 = empty_0005[var_103_0]

	if not var_103_1 then
		return
	end

	var_103_1.def_enable = v_0063:get()
	var_103_1.def_mode = v_0063.mode:get()
	var_103_1.def_pitch = v_0063.pitch:get()
	var_103_1.def_pitch_val = v_0063.pitch_val:get()
	var_103_1.def_pitch_val2 = v_0063.pitch_val2:get()
	var_103_1.def_yaw = v_0063.yaw:get()
	var_103_1.def_yaw_val = v_0063.yaw_val:get()
	var_103_1.def_yaw_val2 = v_0063.yaw_val2:get()
	var_103_1.def_yaw_side = v_0063.yaw_side:get()
	var_103_1.def_yaw_jitter = v_0063.yaw_jitter:get()
	var_103_1.def_spin = v_0063.spin:get()
end

v_0063.pitch:set_callback(visibility_updater_3)
v_0063.pitch_val:set_callback(visibility_updater_3)
v_0063.yaw:set_callback(visibility_updater_3)
v_0063.yaw_val:set_callback(visibility_updater_3)
v_0063.pitch_val2:set_callback(visibility_updater_3)
v_0063.yaw_val2:set_callback(visibility_updater_3)
v_0063.spin:set_callback(visibility_updater_3)
v_0063.mode:set_callback(visibility_updater_3)
v_0063.yaw_side:set_callback(visibility_updater_3)
v_0063.yaw_jitter:set_callback(visibility_updater_3)
v_0063:set_callback(visibility_updater_3)

function visibility_updater_4()
	local var_104_0 = func_0067(v_0071:get())
	local var_104_1 = empty_0005[var_104_0]

	if not var_104_1 then
		return
	end

	var_104_1.pitch_enable = v_0079:get()
	var_104_1.pitch_mode = v_0079.modes:get()
	var_104_1.pitch_custom = v_0079.customsld:get()

	render_crosshair()
end

v_0079:set_callback(visibility_updater_4)
v_0079.modes:set_callback(visibility_updater_4)
v_0079.customsld:set_callback(visibility_updater_4)
render_crosshair()

function visibility_updater_5()
	v_0064.speed:visibility(v_0064.mode:get() == 4)
end

v_0064.mode:set_callback(visibility_updater_5)
visibility_updater_5()

function ui_callback_handler_2()
	local var_106_0 = func_0067(v_0071:get())
	local var_106_1 = empty_0005[var_106_0]

	if not var_106_1 then
		return
	end

	var_106_1.yaw_enable = v_0094:get()
	var_106_1.yaw_mode = v_0094.mode:get()
	var_106_1.yaw_offset = v_0094.offset:get()
	var_106_1.yaw_enable = v_0094:get()
	var_106_1.yaw_mode = v_0094.mode:get()
	var_106_1.yaw_settings = v_0094.jittersettings:get()
	var_106_1.yaw_offset = v_0094.offset:get()
	var_106_1.yaw_left = v_0094.jittersliderL:get()
	var_106_1.yaw_right = v_0094.jittersliderR:get()
	var_106_1.yaw_delay = v_0094.jitterdelay:get()
	var_106_1.yaw_delay_min = v_0094.delay_min:get()
	var_106_1.yaw_delay_max = v_0094.delay_max:get()
	var_106_1.yaw_fluctuate_time = v_0094.fluctuate_time:get()
end

v_0094:set_callback(ui_callback_handler_2)
v_0094.mode:set_callback(ui_callback_handler_2)
v_0094.offset:set_callback(ui_callback_handler_2)
v_0094.jittersettings:set_callback(ui_callback_handler_2)
v_0094.jittersliderL:set_callback(ui_callback_handler_2)
v_0094.jittersliderR:set_callback(ui_callback_handler_2)
v_0094.jitterdelay:set_callback(ui_callback_handler_2)
v_0094.delay_min:set_callback(ui_callback_handler_2)
v_0094.delay_max:set_callback(ui_callback_handler_2)
v_0094.fluctuate_time:set_callback(ui_callback_handler_2)

function lerp_helper()
	local var_107_0 = func_0067(v_0071:get())
	local var_107_1 = empty_0005[var_107_0]

	if not var_107_1 then
		return
	end

	var_107_1.desync_enable = v_0064:get()
	var_107_1.desync_mode = v_0064.mode:get()
	var_107_1.desync_left = v_0064.left:get()
	var_107_1.desync_right = v_0064.right:get()
	var_107_1.desync_speed = v_0064.speed:get()
end

v_0064:set_callback(lerp_helper)
v_0064.mode:set_callback(lerp_helper)
v_0064.left:set_callback(lerp_helper)
v_0064.right:set_callback(lerp_helper)
v_0064.speed:set_callback(lerp_helper)

function lerp_helper_2()
	local var_108_0 = func_0067(v_0071:get())
	local var_108_1 = empty_0005[var_108_0]

	if not var_108_1 then
		return
	end

	var_108_1.fakelag_enable = v_0069:get()
	var_108_1.fakelag_mode = v_0078:get()
	var_108_1.fakelag_amount = v_0085:get()
	var_108_1.fakelag_min = v_0061:get()
	var_108_1.fakelag_max = v_0089:get()
	var_108_1.fakelag_timer = v_0080:get()
end

v_0069:set_callback(lerp_helper_2)
v_0078:set_callback(lerp_helper_2)
v_0085:set_callback(lerp_helper_2)
v_0061:set_callback(lerp_helper_2)
v_0089:set_callback(lerp_helper_2)
v_0080:set_callback(lerp_helper_2)

const_0196 = 0
cfg_0134 = {
	wait = 0,
	alpha = 0,
	active = false,
	fade = 0.25
}

function lerp_helper_3()
	cfg_0134.active = false
	cfg_0134.alpha = 0
	cfg_0134.wait = 0
	cfg_0134.fade = 0.25
end

function lerp_helper_4()
	if not v_0128:get() then
		return
	end

	cfg_0134.active = true
	cfg_0134.alpha = 1
	cfg_0134.wait = v_0128.wait:get() / 100
	cfg_0134.fade = v_0128.fade:get() / 100
end

function lerp_helper_5()
	if not v_0128:get() then
		return
	end

	if not cfg_0134.active then
		return
	end

	if not globals.is_in_game then
		return
	end

	local var_111_0 = render.screen_size()
	local var_111_1 = var_111_0.x / 2
	local var_111_2 = var_111_0.y / 2

	cfg_0134.wait = cfg_0134.wait - globals.frametime

	if cfg_0134.wait <= 0 then
		cfg_0134.alpha = cfg_0134.alpha - 1 / cfg_0134.fade * globals.frametime
	end

	if cfg_0134.alpha <= 0 then
		lerp_helper_3()

		return
	end

	local var_111_3 = v_0128.gap:get()
	local var_111_4 = v_0128.size:get()
	local var_111_5 = v_0128.color:get()
	local var_111_6 = color(var_111_5.r, var_111_5.g, var_111_5.b, math.floor(var_111_5.a * cfg_0134.alpha))

	render.line(vector(var_111_1 + var_111_3, var_111_2 + var_111_3), vector(var_111_1 + var_111_4, var_111_2 + var_111_4), var_111_6)
	render.line(vector(var_111_1 - var_111_3, var_111_2 + var_111_3), vector(var_111_1 - var_111_4, var_111_2 + var_111_4), var_111_6)
	render.line(vector(var_111_1 - var_111_3, var_111_2 - var_111_3), vector(var_111_1 - var_111_4, var_111_2 - var_111_4), var_111_6)
	render.line(vector(var_111_1 + var_111_3, var_111_2 - var_111_3), vector(var_111_1 + var_111_4, var_111_2 - var_111_4), var_111_6)
end

function apply_settings_8()
	if #empty_0011 == 0 then
		return
	end

	local var_112_0 = globals.curtime

	for iter_112_0 = #empty_0011, 1, -1 do
		local var_112_1 = empty_0011[iter_112_0]

		if var_112_0 >= var_112_1.time then
			render_crosshair_12(var_112_1.text)
			table.remove(empty_0011, iter_112_0)
		end
	end
end

events.render:set(function()
	local var_113_0 = globals.curtime

	apply_settings_8()

	if globals.curtime >= const_0189 then
		const_0189 = globals.curtime + 2

		bombsite_e_fix_4()
	end

	if not v_0127:get() then
		return
	end

	if ui_ui then
		ui_ui:set("Remove all")
	end

	local var_113_1 = entity.get_local_player()

	if not var_113_1 or not var_113_1:is_alive() then
		return
	end

	local var_113_2 = 0
	local var_113_3 = var_113_1:get_player_weapon()

	if var_113_3 then
		local var_113_4 = var_113_3:get_classname() or ""

		if var_113_4:find("AWP") or var_113_4:find("SSG08") or var_113_4:find("SCAR20") or var_113_4:find("G3SG1") then
			if var_113_1.m_bIsScoped then
				const_0193 = globals.curtime + 0.01
			end

			if globals.curtime < const_0193 then
				var_113_2 = 1
			end
		else
			const_0193 = 0
		end
	end

	const_0196 = const_0196 or 0
	const_0196 = const_0196 + (var_113_2 - const_0196) * 0.15

	if const_0196 < 0.01 then
		return
	end

	local var_113_5 = v_0127.color:get()
	local var_113_6 = math.floor(var_113_5.a * const_0196)
	local var_113_7 = color(var_113_5.r, var_113_5.g, var_113_5.b, var_113_6)
	local var_113_8 = color(var_113_5.r, var_113_5.g, var_113_5.b, 0)
	local var_113_9 = v_0127.length:get() * const_0196
	local var_113_10 = v_0127.gap:get()
	local var_113_11 = v_0127.tshape:get()
	local var_113_12 = render.screen_size()
	local var_113_13 = var_113_12.x / 2 + 0.5
	local var_113_14 = var_113_12.y / 2 + 0.5
	local var_113_15 = 0.5

	if not var_113_11 then
		render.gradient(vector(var_113_13 - var_113_15, var_113_14 - var_113_10 - 0.5), vector(var_113_13 + var_113_15, var_113_14 - var_113_10 - var_113_9 - 0.5), var_113_7, var_113_7, var_113_8, var_113_8)
	end

	render.gradient(vector(var_113_13 - var_113_15, var_113_14 + var_113_10 + 0.5), vector(var_113_13 + var_113_15, var_113_14 + var_113_10 + var_113_9 + 0.5), var_113_7, var_113_7, var_113_8, var_113_8)
	render.gradient(vector(var_113_13 - var_113_10, var_113_14 - var_113_15), vector(var_113_13 - var_113_10 - var_113_9, var_113_14 + var_113_15), var_113_7, var_113_8, var_113_7, var_113_8)
	render.gradient(vector(var_113_13 + var_113_10, var_113_14 - var_113_15), vector(var_113_13 + var_113_10 + var_113_9, var_113_14 + var_113_15), var_113_7, var_113_8, var_113_7, var_113_8)
end)

render_load_font = render.load_font("Verdana", 11, "a")
cfg_0136 = {
	anim = 0,
	list = {}
}
cfg_0139 = {
	[0] = "generic",
	"head",
	"chest",
	"stomach",
	"left arm",
	"right arm",
	"left leg",
	"right leg",
	"neck"
}

function render_damage_indicator_8(arg_114_0)
	local var_114_0 = v_0112.output:get()

	if type(var_114_0) ~= "table" then
		return false
	end

	for iter_114_0, iter_114_1 in ipairs(var_114_0) do
		if tostring(iter_114_1):find(arg_114_0) then
			return true
		end
	end

	return false
end

function render_damage_indicator_9(arg_115_0)
	if not arg_115_0 then
		return "unknown"
	end

	local var_115_0, var_115_1 = pcall(function()
		return arg_115_0:get_name()
	end)

	return var_115_0 and var_115_1 or "unknown"
end

function render_damage_indicator_10(arg_117_0, arg_117_1)
	table.insert(cfg_0136.list, 1, {
		alpha = 1,
		time = 5,
		draw_alpha = 0,
		text = arg_117_0,
		state = arg_117_1 or "info"
	})

	if #cfg_0136.list > 6 then
		table.remove(cfg_0136.list)
	end
end

function render_damage_indicator_11(arg_118_0)
	print_raw("\aFFD700FFAstryx \aFFFFFFFF· " .. arg_118_0)
end

cfg_0133 = {
	miss = 0,
	hits = 0
}

events.aim_ack:set(function(arg_119_0)
	if not v_0112:get() then
		return
	end

	if not arg_119_0.target then
		return
	end

	local var_119_0 = entity.get(arg_119_0.target)

	if not var_119_0 then
		return
	end

	local var_119_1 = render_damage_indicator_9(var_119_0)
	local var_119_2 = (arg_119_0.damage or 0) > 0 and arg_119_0.state == nil

	if var_119_2 then
		cfg_0133.hits = cfg_0133.hits + 1
	else
		cfg_0133.miss = cfg_0133.miss + 1
	end

	if var_119_2 then
		local var_119_3 = cfg_0139[arg_119_0.hitgroup] or "unknown"
		local var_119_4 = arg_119_0.damage or 0
		local var_119_5 = arg_119_0.hitchance or 0
		local var_119_6 = arg_119_0.backtrack or 0
		local var_119_7 = ("%s | Hit %s | %s | %d dmg | hc: %d%% | bt: %dt"):format(ui.get_icon("check"), var_119_1, var_119_3, var_119_4, var_119_5, var_119_6)

		if render_damage_indicator_8("Console") then
			render_damage_indicator_11(var_119_7)
		end

		if render_damage_indicator_8("Screen") then
			render_damage_indicator_10(var_119_7, "hit")
		end
	else
		local var_119_8 = cfg_0139[arg_119_0.wanted_hitgroup or arg_119_0.hitgroup] or "unknown"
		local var_119_9 = arg_119_0.wanted_damage or arg_119_0.damage or 0
		local var_119_10 = arg_119_0.hitchance or 0
		local var_119_11 = arg_119_0.backtrack or 0
		local var_119_12 = arg_119_0.state or arg_119_0.reason or arg_119_0.miss_reason or "resolver/spread"
		local var_119_13 = ("%s | Missed %s | %s | %d dmg | %s | hc: %d%% | bt: %dt"):format(ui.get_icon("xmark"), var_119_1, var_119_8, var_119_9, tostring(var_119_12), var_119_10, var_119_11)

		if render_damage_indicator_8("Console") then
			render_damage_indicator_11(var_119_13)
		end

		if render_damage_indicator_8("Screen") then
			render_damage_indicator_10(var_119_13, "miss")
		end
	end
end)

function lerp_helper_6()
	if not v_0112:get() then
		return
	end

	if not render_damage_indicator_8("Screen") then
		return
	end

	local var_120_0 = render.screen_size()
	local var_120_1 = #cfg_0136.list > 0

	cfg_0136.anim = render_crosshair_8(cfg_0136.anim, var_120_1 and 1 or 0, 0.12)

	if cfg_0136.anim < 0.01 then
		return
	end

	for iter_120_0 = #cfg_0136.list, 1, -1 do
		local var_120_2 = cfg_0136.list[iter_120_0]

		var_120_2.time = var_120_2.time - globals.frametime

		local var_120_3 = var_120_2.time > 0 and 1 or 0

		var_120_2.draw_alpha = render_crosshair_8(var_120_2.draw_alpha or 0, var_120_3, 0.13)

		if var_120_2.time <= 0 then
			var_120_2.alpha = var_120_2.alpha - globals.frametime * 2.4
		end

		if var_120_2.alpha <= 0.01 and var_120_2.draw_alpha <= 0.01 then
			table.remove(cfg_0136.list, iter_120_0)
		end
	end

	local var_120_4 = var_120_0.y / 2 + 110
	local var_120_5 = 22

	for iter_120_1, iter_120_2 in ipairs(cfg_0136.list) do
		local var_120_6 = math.clamp((iter_120_2.draw_alpha or 0) * iter_120_2.alpha * cfg_0136.anim, 0, 1)

		if var_120_6 > 0.01 then
			local var_120_7 = iter_120_2.text
			local var_120_8 = render.measure_text(render_load_font, nil, var_120_7)
			local var_120_9 = var_120_0.x / 2 - var_120_8.x / 2
			local var_120_10 = var_120_4 + (iter_120_1 - 1) * var_120_5
			local var_120_11 = vector(var_120_9 - 8, var_120_10 - 4)
			local var_120_12 = vector(var_120_9 + var_120_8.x + 8, var_120_10 + var_120_8.y + 5)
			local var_120_13 = iter_120_2.state == "hit" and v_0112.hit_line:get() or v_0112.miss_line:get()

			render.rect(var_120_11, var_120_12, color(15, 15, 15, math.floor(130 * var_120_6)), 4)
			render.text(render_load_font, vector(var_120_9, var_120_10), color(255, 255, 255, math.floor(255 * var_120_6)), nil, var_120_7)
			render.rect(vector(var_120_11.x, var_120_12.y - 2), vector(var_120_11.x + (var_120_12.x - var_120_11.x) * iter_120_2.alpha, var_120_12.y), color(var_120_13.r, var_120_13.g, var_120_13.b, math.floor(var_120_13.a * var_120_6)), 2)
		end
	end
end

function func_0070()
	if not v_0114:get() then
		return
	end

	if not entity.get_local_player() then
		return
	end

	local var_121_0 = v_0114.style:get()
	local var_121_1 = v_0114.select:get()
	local var_121_2 = v_0114.color:get()
	local var_121_3 = v_0114.animated:get()
	local var_121_4 = 20
	local var_121_5 = render.screen_size().y / 2 + 10
	local var_121_6 = 0

	local function var_121_7(arg_122_0)
		if type(var_121_1) ~= "table" then
			return var_121_1 == arg_122_0
		end

		for iter_122_0, iter_122_1 in ipairs(var_121_1) do
			if iter_122_1 == arg_122_0 then
				return true
			end
		end

		return false
	end

	local function var_121_8(arg_123_0)
		if var_121_0 ~= "Modern" then
			return arg_123_0
		end

		if not var_121_3 then
			return arg_123_0
		end

		local var_123_0 = globals.realtime * 2
		local var_123_1 = (math.sin(var_123_0) + 1) * 0.5

		return color(arg_123_0.r + (255 - arg_123_0.r) * var_123_1, arg_123_0.g + (255 - arg_123_0.g) * var_123_1, arg_123_0.b + (255 - arg_123_0.b) * var_123_1, 255)
	end

	local function var_121_9()
		local var_124_0 = math.clamp(render_crosshair_9() or 0, 0, 1)

		if var_124_0 < 0.5 then
			local var_124_1 = var_124_0 * 2

			return color(255, 255 * var_124_1, 255 * var_124_1, 255)
		else
			local var_124_2 = (var_124_0 - 0.5) * 2

			return color(255 - 75 * var_124_2, 255, 255 * (1 - var_124_2), 255)
		end
	end

	local var_121_10 = (function()
		local var_125_0 = entity.get_local_player()

		if not var_125_0 then
			return "global"
		end

		local var_125_1 = var_125_0:get_player_weapon()

		if not var_125_1 then
			return "global"
		end

		local var_125_2 = (var_125_1:get_classname() or ""):upper()

		if var_125_2:find("GLOCK") or var_125_2:find("P250") or var_125_2:find("TEC9") or var_125_2:find("HKP2000") or var_125_2:find("USP") or var_125_2:find("FIVESEVEN") or var_125_2:find("ELITE") then
			return "pistols"
		elseif var_125_2:find("SCAR20") or var_125_2:find("G3SG1") then
			return "autosnipers"
		elseif var_125_2:find("AWP") then
			return "awpnaxyi"
		elseif var_125_2:find("SSG08") then
			return "scout"
		elseif var_125_2:find("DEAGLE") then
			return "deagle"
		elseif var_125_2:find("REVOLVER") then
			return "revik"
		elseif var_125_2:find("NEGEV") or var_125_2:find("M249") then
			return "machiguns"
		elseif var_125_2:find("NOVA") or var_125_2:find("XM1014") or var_125_2:find("MAG7") or var_125_2:find("SAWEDOFF") then
			return "shotguns"
		elseif var_125_2:find("MP9") or var_125_2:find("MAC10") or var_125_2:find("MP7") or var_125_2:find("UMP45") or var_125_2:find("P90") or var_125_2:find("BIZON") then
			return "smgs"
		elseif var_125_2:find("AK47") then
			return "vityaAK47"
		elseif var_125_2:find("M4A1") or var_125_2:find("M4A4") then
			return "m4ma1"
		elseif var_125_2:find("AUG") or var_125_2:find("SG556") then
			return "AUG"
		elseif var_125_2:find("GALIL") or var_125_2:find("FAMAS") then
			return "rifles"
		elseif var_125_2:find("TASER") then
			return "taser"
		end

		return "global"
	end)()

	local function var_121_11(arg_126_0)
		return (arg_126_0[var_121_10] or arg_126_0.global):get()
	end

	local function var_121_12(arg_127_0, arg_127_1, arg_127_2, arg_127_3, arg_127_4)
		if not var_121_7(arg_127_0) or not arg_127_2 then
			return
		end

		local var_127_0

		if var_121_0 == "Skeet" then
			var_127_0 = arg_127_3 or color(255, 255, 255, 255)
		else
			var_127_0 = arg_127_3 or var_121_2
		end

		if arg_127_0 == "Double Tap" then
			var_127_0 = var_121_9()
		end

		local var_127_1 = var_127_0

		if var_121_0 == "Modern" and arg_127_0 ~= "Double Tap" then
			var_127_1 = var_121_8(var_127_0)
		end

		if var_121_0 == "Skeet" then
			render.text(cfg_0157.skeet_font, vector(var_121_4, var_121_5 + var_121_6), var_127_1, nil, arg_127_1)

			var_121_6 = var_121_6 + 32

			return
		end

		if var_121_0 == "Modern" then
			local var_127_2 = ({
				["Double Tap"] = ui.get_icon("clock"),
				["Hide Shots"] = ui.get_icon("eye-slash"),
				["Min. Damage Override"] = ui.get_icon("crosshairs"),
				["Body Aim"] = ui.get_icon("person"),
				["Force Safe Point"] = ui.get_icon("shield"),
				Freestanding = ui.get_icon("shield-halved"),
				["Fake Latency"] = ui.get_icon("wifi"),
				["Dormant Aimbot"] = ui.get_icon("snowflake"),
				["Fake Duck"] = ui.get_icon("person-swimming"),
				["Hit/Miss Rate"] = ui.get_icon("window-restore")
			})[arg_127_0] or ""

			if v_0114.bg and v_0114.bg:get() then
				local var_127_3 = 140
				local var_127_4 = 20

				if arg_127_0 == "Hit/Miss Rate" then
					var_127_3 = var_127_3 * 1.25
				end

				render.rect(vector(var_121_4 - 6, var_121_5 + var_121_6 - 2), vector(var_121_4 - 6 + var_127_3, var_121_5 + var_121_6 + var_127_4), v_0114.bg_color:get(), 4)
			end

			render.text(cfg_0157.modern_font, vector(var_121_4, var_121_5 + var_121_6), var_127_1, nil, "|")

			local var_127_5 = arg_127_4 and arg_127_1 or var_127_2 .. " " .. arg_127_1

			render.text(cfg_0157.modern_font, vector(var_121_4 + 10, var_121_5 + var_121_6), var_127_1, nil, var_127_5)

			var_121_6 = var_121_6 + 30
		end
	end

	local var_121_13 = rage_cfg.dt:get()
	local var_121_14 = rage_cfg.hideshots:get()
	local var_121_15 = rage_cfg.fakedick:get()
	local var_121_16 = var_121_11(rage_cfg.force_safe_point)
	local var_121_17 = var_121_11(rage_cfg.body_aim)
	local var_121_18 = var_121_11(rage_cfg.min_damage)
	local var_121_19 = v_0060:get()
	local var_121_20 = false

	if v_0097:get() and v_0097.cond then
		local var_121_21 = v_0097.cond:get()

		var_121_20 = type(var_121_21) == "table" and #var_121_21 > 0
	end

	local var_121_22 = v_0116:get() and v_0116.amount:get() > 25

	var_121_12("Dormant Aimbot", "DA", var_121_19, var_121_0 == "Skeet" and color(180, 255, 60, 255) or var_121_2)
	var_121_12("Double Tap", "DT", var_121_13)
	var_121_12("Hide Shots", "HS", var_121_14)
	var_121_12("Fake Latency", "PING", var_121_22, var_121_0 == "Skeet" and color(180, 255, 60, 255) or var_121_2)
	var_121_12("Freestanding", "FS", var_121_20, var_121_0 == "Skeet" and color(255, 255, 255, 255) or var_121_2)
	var_121_12("Min. Damage Override", "MD", var_121_18 > 0 and var_121_18 < 13)
	var_121_12("Force Safe Point", "SAFE", var_121_16 == "Force")
	var_121_12("Body Aim", "BAIM", var_121_17 == "Force")
	var_121_12("Fake Duck", "FD", var_121_15)

	if var_121_7("Hit/Miss Rate") then
		local var_121_23 = cfg_0133 and cfg_0133.hits or 0
		local var_121_24 = var_121_23 + (cfg_0133 and cfg_0133.miss or 0)

		if var_121_24 > 0 then
			local var_121_25 = math.floor(var_121_23 / var_121_24 * 100)
			local var_121_26 = var_121_23 .. "/" .. var_121_24 .. " (" .. var_121_25 .. "%)"

			var_121_12("Hit/Miss Rate", var_121_26, true)
		end
	end
end

function visibility_updater_6()
	if not v_0114 then
		return
	end

	local var_128_0 = v_0114.style:get() == "Modern"

	v_0114.color:visibility(var_128_0)
	v_0114.bg:visibility(var_128_0)
	v_0114.animated:visibility(var_128_0)
	v_0114.bg_color:visibility(var_128_0 and v_0114.bg:get())
end

v_0114.style:set_callback(visibility_updater_6)
v_0114.bg:set_callback(visibility_updater_6)
visibility_updater_6()
events.game_end:set(function()
	cfg_0133.hits = 0
	cfg_0133.miss = 0
end)

function apply_settings_9(arg_130_0)
	empty_0009 = {
		"Default"
	}

	for iter_130_0, iter_130_1 in pairs(val_0156) do
		if iter_130_0 ~= "Default" then
			table.insert(empty_0009, iter_130_0)
		end
	end

	cfg_0161.list:update(empty_0009)

	if arg_130_0 then
		for iter_130_2, iter_130_3 in ipairs(empty_0009) do
			if iter_130_3 == arg_130_0 then
				cfg_0161.list:set(iter_130_2)
				cfg_0161.name:set(iter_130_3)
			end
		end
	end
end

cfg_0161.save:set_callback(function()
	local var_131_0 = cfg_0161.name:get()
	local var_131_1 = cfg_0161.list:get()
	local var_131_2 = empty_0009[var_131_1]
	local var_131_3 = var_131_0 and var_131_0 ~= "" and var_131_0 or var_131_2

	if not var_131_3 or var_131_3 == "" then
		clan_tag_update_3("Config name empty")

		return
	end

	apply_settings_2(v_0068)
	func_0068()
	render_crosshair_6()
	render_damage_indicator_6()
	fast_ladder_move()
	func_0066()

	local var_131_4 = {
		aa_cfg = render_crosshair_5(empty_0005),
		global = render_crosshair_5(cfg_0137)
	}

	val_0156[var_131_3] = var_131_4
	db.astryx_configs = val_0156

	apply_settings_9(var_131_3)
	clan_tag_update_3("Cconfig " .. var_131_3 .. " saved")
end)
cfg_0161.load:set_callback(function()
	local var_132_0 = cfg_0161.list:get()
	local var_132_1 = empty_0009[var_132_0]

	if not var_132_1 then
		return
	end

	local var_132_2 = val_0156[var_132_1]

	if not var_132_2 then
		return
	end

	if type(var_132_2) ~= "table" or type(var_132_2.aa_cfg) ~= "table" then
		clan_tag_update_3("broken cfg data, resetting")

		empty_0005 = {}
		cfg_0137 = {}
	else
		empty_0005 = render_crosshair_5(var_132_2.aa_cfg)
		cfg_0137 = render_crosshair_5(var_132_2.global or {})
	end

	apply_settings_3(v_0068)
	apply_settings_5()
	render_crosshair_7()
	render_damage_indicator_7()
	fast_ladder_move_2()
	apply_settings_4()
	clan_tag_update_3("Cconfig " .. var_132_1 .. " loaded")
end)
cfg_0161.delete:set_callback(function()
	local var_133_0 = cfg_0161.list:get()
	local var_133_1 = empty_0009[var_133_0]

	if var_133_1 == "Default" then
		clan_tag_update_3("Ccannot delete default")

		return
	end

	val_0156[var_133_1] = nil
	db.astryx_configs = val_0156

	apply_settings_9()
	clan_tag_update_3("Cconfig " .. var_133_1 .. " deleted")
end)

function ui_callback_handler_3(arg_134_0)
	local var_134_0 = {}

	for iter_134_0, iter_134_1 in pairs(arg_134_0) do
		local var_134_1 = type(iter_134_1)

		if var_134_1 == "table" then
			var_134_0[iter_134_0] = ui_callback_handler_3(iter_134_1)
		elseif var_134_1 == "number" or var_134_1 == "boolean" or var_134_1 == "string" then
			var_134_0[iter_134_0] = iter_134_1
		end
	end

	return var_134_0
end

function ui_callback_handler_4(arg_135_0)
	if type(arg_135_0) ~= "table" then
		return arg_135_0
	end

	local var_135_0 = true
	local var_135_1 = 0

	for iter_135_0 in pairs(arg_135_0) do
		if type(iter_135_0) ~= "number" then
			var_135_0 = false

			break
		end

		if var_135_1 < iter_135_0 then
			var_135_1 = iter_135_0
		end
	end

	local var_135_2 = {}

	if var_135_0 then
		for iter_135_1 = 1, var_135_1 do
			var_135_2[iter_135_1] = ui_callback_handler_4(arg_135_0[iter_135_1])
		end
	else
		for iter_135_2, iter_135_3 in pairs(arg_135_0) do
			var_135_2[tostring(iter_135_2)] = ui_callback_handler_4(iter_135_3)
		end
	end

	return var_135_2
end

cfg_0161.export:set_callback(function()
	local var_136_0 = cfg_0161.list:get()
	local var_136_1 = empty_0009[var_136_0]

	if not var_136_1 then
		clan_tag_update_3("Nno config selected")

		return
	end

	if not val_0156[var_136_1] then
		clan_tag_update_3("Cconfig not found")

		return
	end

	func_0068()
	render_crosshair_6()
	render_damage_indicator_6()
	fast_ladder_move()
	func_0066()

	local var_136_2 = {
		aa_cfg = render_crosshair_5(empty_0005),
		global = render_crosshair_5(cfg_0137)
	}
	local var_136_3 = ui_callback_handler_4(var_136_2)
	local var_136_4 = ui_callback_handler_3(var_136_3)
	local var_136_5 = base64_mod.encode(json.stringify(var_136_4))

	clipboard_mod.set(var_136_5)
	clan_tag_update_3("Cconfig exported")
end)

function apply_settings_10(arg_137_0)
	if type(arg_137_0) ~= "table" then
		return arg_137_0
	end

	local var_137_0 = {}

	for iter_137_0, iter_137_1 in pairs(arg_137_0) do
		var_137_0[tonumber(iter_137_0) or iter_137_0] = apply_settings_10(iter_137_1)
	end

	return var_137_0
end

cfg_0161.import:set_callback(function()
	local var_138_0 = clipboard_mod.get()

	if not var_138_0 or var_138_0 == "" then
		clan_tag_update_3("Cclipboard empty")

		return
	end

	local var_138_1 = base64_mod.decode(var_138_0)

	if not var_138_1 then
		clan_tag_update_3("Ddecode failed")

		return
	end

	local var_138_2, var_138_3 = pcall(function()
		return json.parse(var_138_1)
	end)

	if not var_138_2 or not var_138_3 then
		clan_tag_update_3("Iimport parse error")

		return
	end

	local var_138_4 = apply_settings_10(var_138_3)
	local var_138_5 = cfg_0161.list:get()
	local var_138_6 = empty_0009[var_138_5]

	if not var_138_6 then
		clan_tag_update_3("Nno config selected")

		return
	end

	val_0156[var_138_6] = {
		aa_cfg = render_crosshair_5(var_138_4.aa_cfg or {}),
		global = render_crosshair_5(var_138_4.global or {})
	}
	db.astryx_configs = val_0156

	local var_138_7 = var_138_4.aa_cfg or {}

	for iter_138_0, iter_138_1 in pairs(var_138_7) do
		if empty_0005[iter_138_0] then
			for iter_138_2, iter_138_3 in pairs(iter_138_1) do
				empty_0005[iter_138_0][iter_138_2] = iter_138_3
			end
		else
			empty_0005[iter_138_0] = iter_138_1
		end
	end

	cfg_0137 = render_crosshair_5(var_138_4.global or {})

	apply_settings_3(func_0067(v_0071:get()))
	apply_settings_5()
	render_crosshair_7()
	render_damage_indicator_7()
	fast_ladder_move_2()
	apply_settings_4()
	clan_tag_update_3("Cconfig imported")
end)
apply_settings_9()

function on_shutdown(arg_140_0)
	if not v_0122:get() then
		return
	end

	local var_140_0 = entity.get_local_player()

	if not var_140_0 or not var_140_0:is_alive() then
		return
	end

	local var_140_1 = var_140_0:get_player_weapon()

	if not var_140_1 then
		return
	end

	local var_140_2 = var_140_1:get_weapon_info()

	if not var_140_2 then
		return
	end

	arg_140_0.angles = render_crosshair_15(arg_140_0.angles, var_140_2.throw_velocity, var_140_1.m_flThrowStrength, arg_140_0.velocity)
end

v_0122:set_callback(function(arg_141_0)
	local var_141_0 = arg_141_0:get()

	events.grenade_override_view(on_shutdown, var_141_0)
end, true)
events.player_hurt:set(function(arg_142_0)
	local var_142_0 = entity.get_local_player()

	if not var_142_0 then
		return
	end

	if entity.get(arg_142_0.attacker, true) == var_142_0 then
		lerp_helper_4()
	end
end)
events.player_spawned:set(function(arg_143_0)
	local var_143_0 = entity.get_local_player()

	if not var_143_0 then
		return
	end

	if entity.get(arg_143_0.userid, true) == var_143_0 then
		lerp_helper_3()
	end
end)
events.round_start:set(function()
	lerp_helper_3()
end)
events.pre_render(function()
	bombsite_e_fix_3()
end)
events.render(function()
	render_crosshair_2()
	lerp_helper_6()
	clan_tag_update_4()
	render_crosshair_14()
	bombsite_e_fix_4()
	render_damage_indicator_12()
	func_0070()
	lerp_helper_5()

	if v_0125 then
		v_0125:set_colors({
			cr1,
			cr2
		})
		v_0125:set_speed(-empty_0007.spd:get() * 0.5)
		v_0125:animate()
		render.text(font, pos, color(255, 255, 255), nil, v_0125:get_animated_text())
	else
		render.text(font, pos, cr1, nil, text)
	end

	render_crosshair_11()

	if v_0123 and ui.get_alpha() > 0.1 then
		v_0123:set_colors({
			ui.get_style("Link Active"),
			color(0, 0, 0, 255)
		})
		v_0123:set_speed(-2.2)
		v_0123:animate()
		pui_mod.sidebar(v_0123:get_animated_text(), ui.get_icon("star"))
	end
end)
events.shutdown(function()
	bombsite_e_fix_2(color(255, 255, 255, 255))
end)
events.post_update_clientside_animation:set(function()
	process_animstate_2()
end)
pui_mod.setup({})







