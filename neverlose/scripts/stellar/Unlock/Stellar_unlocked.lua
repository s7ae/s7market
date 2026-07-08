slot_0_0_0 = require("neverlose/pui")
slot_0_1_0 = require("neverlose/smoothy")
slot_0_2_0 = require("neverlose/base64")
slot_0_3_0 = require("neverlose/clipboard")
slot_0_4_0 = require("neverlose/inspect")
slot_0_5_0 = require("neverlose/exploits")
slot_0_6_0 = require("neverlose/mtools")
slot_0_7_0 = (function()return{LettersList={},Breathe=function(a,b,c)c=c or 1;b=b or 0;return(math.cos(globals.realtime*c+b)+1)/2 end,Text=function(d,e,f,g)local h=0;local i=#e:gsub("[\x80-\xBF]","")local j=""for k in e:gmatch(".[\x80-\xBF]*")do h=h+1+(g or 0)local l=h/i;j=string.format("%s\a%s%s",j,f(h,i,k,l):to_hex(),k)end;return j end,Gradient=function(m,n,o)n=n or{color(255,255,255),color(0,0,0)}o=o or 0;if o<=0 then return n[1]end;if o>=1 then return n[#n]end;local p=1/(#n-1)local q=math.floor(o/p)local r=n[q+1]local s=n[q+2]return r:lerp(s,(o-q*p)/p)end,Static=function(t,u,v)u=u or"AN EXAMPLE OF A STATIC GRADIENT"return t:Text(u,function(w,x,y,z)return t:Gradient(v,w/x)end)end,Animate=function(A,B,C,D,E)B=B or"EXAMPLE OF AN ANIMATED GRADIENT"D=D or 3;return A:Text(B,function(F,G,H,I)return A:Gradient(C,A:Breathe(I,-D))end,E)end,Letters=function(J,K,L,M,N,O)if J.LettersList[K]==nil then J.LettersList[K]={Revers=N<0 and true or false,Number=N<0 and string.len(K)or 1}end;K=K or"EXAMPLE OF AN ANIMATED GRADIENT"N=N or 3;return J:Text(K,function(P,Q,R,S)if O==nil or O==false then if J.LettersList[K].Revers then J.LettersList[K].Number=J.LettersList[K].Number+N/750;if N>0 and J.LettersList[K].Number>Q+1 or J.LettersList[K].Number<1 then J.LettersList[K].Revers=not J.LettersList[K].Revers end else J.LettersList[K].Number=J.LettersList[K].Number-N/750;if N>0 and J.LettersList[K].Number<1 or J.LettersList[K].Number>Q+1 then J.LettersList[K].Revers=not J.LettersList[K].Revers end end else J.LettersList[K].Number=J.LettersList[K].Number+N/750;if N>0 and J.LettersList[K].Number>Q+2 or J.LettersList[K].Number<1 then J.LettersList[K].Number=N<0 and string.len(K)+2 or 1 end end;if P~=math.floor(J.LettersList[K].Number)then return L else return J:Gradient(M,J:Breathe(S,-N))end end)end}end)()
slot_0_8_0 = 15
slot_0_9_0 = ui.get_alpha() > 0

function lerp(arg_1_0, arg_1_1, arg_1_2)
	return arg_1_0 + (arg_1_1 - arg_1_0) * arg_1_2
end

function math.clamp(arg_2_0, arg_2_1, arg_2_2)
	if arg_2_0 < arg_2_1 then
		return arg_2_1
	end

	if arg_2_2 < arg_2_0 then
		return arg_2_2
	end

	return arg_2_0
end

function smooth(arg_3_0, arg_3_1, arg_3_2, arg_3_3)
	arg_3_3 = arg_3_3 or globals.frametime() or 0.016
	arg_3_2 = math.clamp(arg_3_2 * arg_3_3 * 60, 0, 1)

	return arg_3_0 + (arg_3_1 - arg_3_0) * arg_3_2
end

ffi.cdef("void* __stdcall URLDownloadToFileA(void*, const char*, const char*, int, int);\nbool DeleteUrlCacheEntryA(const char*);\n\ntypedef void*(__thiscall* get_client_entity_t)(void*, int);\ntypedef struct { char pad[20]; int m_nOrder, m_nSequence; float m_flPrevCycle, m_flWeight, m_flWeightDeltaRate, m_flPlaybackRate, m_flCycle; void* m_pOwner; char pad2[4]; } animstate_layer_t;\n\ntypedef int(__fastcall* clantag_t)(const char*, const char*);\ntypedef struct { float x, y, z; } Vector_t;\n\ntypedef struct { char pad[20]; int m_nOrder, m_nSequence; float m_flPrevCycle, m_flWeight, m_flWeightDeltaRate, m_flPlaybackRate, m_flCycle; void* m_pOwner; char pad2[4]; } c_animlayers;\n\ntypedef struct {\n    char pad[0x60]; void* pEntity, *pActiveWeapon, *pLastActiveWeapon; float flLastUpdateTime; int iLastUpdateFrame;\n    float flLastUpdateIncrement, flEyeYaw, flEyePitch, flGoalFeetYaw, flLastFeetYaw, flMoveYaw, flLastMoveYaw;\n    float flLeanAmount, flFeetCycle, flMoveWeight, flMoveWeightSmoothed, flDuckAmount, flHitGroundCycle, flRecrouchWeight;\n    Vector_t vecOrigin, vecLastOrigin, vecVelocity, vecVelocityNormalized, vecVelocityNormalizedNonZero;\n    float flVelocityLenght2D, flJumpFallVelocity, flSpeedNormalized, flRunningSpeed, flDuckingSpeed;\n    float flDurationMoving, flDurationStill, flNextLowerBodyYawUpdateTime, flDurationInAir, flLeftGroundHeight;\n    float flHitGroundWeight, flWalkToRunTransition, flAffectedFraction, flMinBodyYaw, flMaxBodyYaw, flMinPitch, flMaxPitch;\n    int iAnimsetVersion;\n} CCSGOPlayerAnimationState_t;\n")

slot_0_10_0 = ffi.typeof("uintptr_t**")
slot_0_11_0 = utils.get_vfunc("client.dll", "VClientEntityList003", 3, "void*(__thiscall*)(void*, int)")
slot_0_12_0 = nil

files.create_folder("nl/stellar")

slot_0_13_0 = {
	urlmon = ffi.load("UrlMon"),
	wininet = ffi.load("WinInet")
}

function slot_0_13_0.download_file_from_url(arg_4_0, arg_4_1)
	slot_0_13_0.wininet.DeleteUrlCacheEntryA(arg_4_0)
	slot_0_13_0.urlmon.URLDownloadToFileA(nil, arg_4_0, arg_4_1, 0, 0)
end

if files.read("nl/stellar/PublicaSans-Regular.ttf") == nil then
	slot_0_13_0.download_file_from_url("https://github.com/ohooma21-collab/stellaring/raw/refs/heads/main/PublicaSans-Regular.ttf", "nl/stellar/PublicaSans-Regular.ttf")
end

slot_0_15_0 = nil
slot_0_16_0 = render.screen_size()
slot_0_17_0 = {
	x = 0,
	h = 100,
	w = 100,
	y = 0
}
;({}).main_panel = slot_0_17_0
slot_0_19_0 = 0
slot_0_20_0 = nil
slot_0_21_0 = state or {}
slot_0_21_0.velocity_pos = slot_0_21_0.velocity_pos or {
	x = 10,
	h = 35,
	w = 220,
	y = 500
}
slot_0_22_0 = 0

function draggable(arg_5_0, arg_5_1, arg_5_2, arg_5_3)
	arg_5_1 = arg_5_1 or {}

	local var_5_0 = arg_5_1.lock_x or false
	local var_5_1 = arg_5_1.lock_y or false
	local var_5_2 = ui.get_mouse_position()
	local var_5_3 = var_5_2.x
	local var_5_4 = var_5_2.y
	local var_5_5 = common.is_button_down(1)
	local var_5_6 = render.screen_size()
	local var_5_7 = var_5_6.x
	local var_5_8 = var_5_6.y

	if arg_5_1.use_backdrop then
		local var_5_9 = arg_5_2 and var_5_5 and 100 or 0

		slot_0_22_0 = lerp(slot_0_22_0, var_5_9, 0.02)

		if slot_0_22_0 > 1 then
			render.rect(vector(0, 0), vector(var_5_7, var_5_8), color(0, 0, 0, math.floor(slot_0_22_0)))
		end
	end

	if not var_5_5 then
		if arg_5_2 and slot_0_20_0 == arg_5_3 then
			if arg_5_3 == "velocity_indicator" then
				for iter_5_0, iter_5_1 in pairs(arg_5_0) do
					db.velocity_pos_y = iter_5_1.y
				end
			elseif arg_5_3 == "damage_indicator" then
				for iter_5_2, iter_5_3 in pairs(arg_5_0) do
					db.damage_pos_x = iter_5_3.x
					db.damage_pos_y = iter_5_3.y
				end
			elseif arg_5_3 == "crosshair_indicator" then
				for iter_5_4, iter_5_5 in pairs(arg_5_0) do
					db.crosshair_pos_y = iter_5_5.y
				end
			elseif arg_5_3 == "logs_indicator" then
				for iter_5_6, iter_5_7 in pairs(arg_5_0) do
					db.logs_pos_y = iter_5_7.y
				end
			end

			slot_0_20_0 = nil
		end

		arg_5_2 = nil

		return nil
	end

	if arg_5_2 then
		slot_0_20_0 = arg_5_3

		local var_5_10 = arg_5_2.item

		if not var_5_0 then
			var_5_10.x = var_5_3 - arg_5_2.offset_x
		end

		if not var_5_1 then
			var_5_10.y = var_5_4 - arg_5_2.offset_y
		end

		if arg_5_1.min_x and var_5_10.x < arg_5_1.min_x then
			var_5_10.x = arg_5_1.min_x
		end

		if arg_5_1.max_x and var_5_10.x > arg_5_1.max_x then
			var_5_10.x = arg_5_1.max_x
		end

		if arg_5_1.min_y and var_5_10.y < arg_5_1.min_y then
			var_5_10.y = arg_5_1.min_y
		end

		if arg_5_1.max_y and var_5_10.y > arg_5_1.max_y then
			var_5_10.y = arg_5_1.max_y
		end

		return arg_5_2
	end

	if slot_0_20_0 and slot_0_20_0 ~= arg_5_3 then
		return nil
	end

	for iter_5_8, iter_5_9 in pairs(arg_5_0) do
		if var_5_3 >= iter_5_9.x and var_5_3 <= iter_5_9.x + iter_5_9.w and var_5_4 >= iter_5_9.y and var_5_4 <= iter_5_9.y + iter_5_9.h then
			arg_5_2 = {
				item = iter_5_9,
				offset_x = var_5_3 - iter_5_9.x,
				offset_y = var_5_4 - iter_5_9.y
			}
			slot_0_20_0 = arg_5_3

			break
		end
	end

	return arg_5_2
end

slot_0_23_0 = {
	enabled = ui.find("Aimbot", "Anti Aim", "Angles", "Enabled"),
	pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Pitch"),
	yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw"),
	actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"),
	yaw_base = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Base"),
	offset_y = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	avoid_backstab = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Avoid Backstab"),
	yaw_modifier = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier"),
	yaw_modifier_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw Modifier", "Offset"),
	bodyyaw = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw"),
	bodyyaw_inverter = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Inverter"),
	bodyyaw_left_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Left Limit"),
	bodyyaw_right_limit = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Right Limit"),
	hslag = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
	bodyyaw_options = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Options"),
	bodyyaw_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Body Yaw", "Freestanding"),
	freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding"),
	freestanding_disable_yaw_modifiers = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Disable Yaw Modifiers"),
	freestanding_body_freestanding = ui.find("Aimbot", "Anti Aim", "Angles", "Freestanding", "Body Freestanding"),
	extended_angles = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles"),
	extended_angles_pitch = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Pitch"),
	extended_angles_roll = ui.find("Aimbot", "Anti Aim", "Angles", "Extended Angles", "Extended Roll"),
	fake_duck = ui.find("Aimbot", "Anti Aim", "Misc", "Fake Duck"),
	lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
	slow_walk = ui.find("Aimbot", "Anti Aim", "Misc", "Slow Walk"),
	hitbox = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"),
	legs_movement = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
	leg = ui.find("Aimbot", "Anti Aim", "Misc", "Leg Movement"),
	baim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
	fov = ui.find("Visuals", "World", "Main", "Field of View"),
	ovrzoom = ui.find("Visuals", "World", "Main", "Override Zoom"),
	scope_overlay = ui.find("Visuals", "World", "Main", "Override Zoom", "Scope Overlay"),
	lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
	hide_shots_options = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots", "Options"),
	clantag = ui.find("Miscellaneous", "Main", "In-Game", "Clan Tag"),
	doubletap = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
	dormant_aimbot = ui.find("Aimbot", "Ragebot", "Main", "Enabled", "Dormant Aimbot"),
	hide_shots = ui.find("Aimbot", "Ragebot", "Main", "Hide Shots"),
	minimum_damage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
	body_aim = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
	safe_points = ui.find("Aimbot", "Ragebot", "Safety", "Safe Points"),
	fake_latency = ui.find("Miscellaneous", "Main", "Other", "Fake Latency"),
	weapon_actions = ui.find("Miscellaneous", "Main", "Other", "Weapon Actions"),
	field_of_view = ui.find("Visuals", "World", "Main", "Field of View"),
	override_zoom = ui.find("Visuals", "World", "Main", "Override Zoom"),
	headscale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale"),
	bodyscale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Body Scale"),
	rbody = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
	fakelag = ui.find("Aimbot", "Anti Aim", "Fake Lag", "Limit"),
	yaw_offset = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Offset"),
	hidden_yaw = ui.find("Aimbot", "Anti Aim", "Angles", "Yaw", "Hidden"),
	hitchance_scout = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"),
	autostop_scout = ui.find("Aimbot", "Ragebot", "Accuracy", "SSG-08", "Auto Stop", "Options"),
	filters = ui.find("Miscellaneous", "Main", "Other", "Filters"),
	hit_chance = ui.find("Aimbot", "Ragebot", "Selection", "Hit Chance"),
	ssg_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "SSG-08", "Hit Chance"),
	awp_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AWP", "Hit Chance"),
	autosnipers_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "AutoSnipers", "Hit Chance"),
	revolver_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "R8 Revolver", "Hit Chance"),
	pistols_hitchance = ui.find("Aimbot", "Ragebot", "Selection", "Pistols", "Hit Chance"),
	air_strafe = slot_0_0_0.find("Miscellaneous", "Main", "Movement", "Air Strafe")
}
slot_0_24_0 = {
	hitboxes = ui.find("Aimbot", "Ragebot", "Selection", "Hitboxes"),
	multipoint = {
		head_scale = ui.find("Aimbot", "Ragebot", "Selection", "Multipoint", "Head Scale")
	},
	mindamage = ui.find("Aimbot", "Ragebot", "Selection", "Min. Damage"),
	autoscope = ui.find("Aimbot", "Ragebot", "Accuracy", "Auto Scope"),
	doubletap = {
		switch = ui.find("Aimbot", "Ragebot", "Main", "Double Tap"),
		lag_options = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Lag Options"),
		fakelag_limit = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Fake Lag Limit"),
		immediate_teleport = ui.find("Aimbot", "Ragebot", "Main", "Double Tap", "Immediate Teleport")
	},
	peek_assist = {
		switch = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist"),
		autostop = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Auto Stop"),
		retreat_mode = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Retreat Mode"),
		max_distance = ui.find("Aimbot", "Ragebot", "Main", "Peek Assist", "Max Distance")
	},
	body_aim_mode = ui.find("Aimbot", "Ragebot", "Safety", "Body Aim"),
	thirdperson_switch = ui.find("Visuals", "World", "Main", "Force Thirdperson")
}
slot_0_25_0 = {
	online = "soon",
	build = "faerich",
	username = common.get_username(),
	state = {
		"Default",
		"Standing",
		"Running",
		"Walking",
		"Crouching",
		"Crouching Moving",
		"Aerobic",
		"Aerobic+"
	}
}
slot_0_26_0 = {
	first = slot_0_0_0.create(ui.get_icon("house-chimney"), "   ", 1),
	two = slot_0_0_0.create(ui.get_icon("house-chimney"), "  ", 2),
	three = slot_0_0_0.create(ui.get_icon("house-chimney"), "\n\n", 1),
	four = slot_0_0_0.create(ui.get_icon("house-chimney"), "\n\n\n", 2),
	mode = slot_0_0_0.create(ui.get_icon("house-chimney"), " ", 1),
	five = slot_0_0_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n\n\n", 1),
	yaw = slot_0_0_0.create(ui.get_icon("house-chimney"), "\n", 1),
	modifier = slot_0_0_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n", 1),
	body_yaw = slot_0_0_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n", 1),
	defensive = slot_0_0_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n\n\n\n\n\n", 1),
	antiaim_tweaks = slot_0_0_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n\n\n\n", 2),
	tweaks = slot_0_0_0.create(ui.get_icon("house-chimney"), "\n\n\n\n\n\n\n\n\n\n\n", 2),
	render = slot_0_0_0.create(ui.get_icon("house-chimney"), "Visuals", 1),
	ragebot = slot_0_0_0.create(ui.get_icon("house-chimney"), "Ragebot", 1),
	branded = slot_0_0_0.create(ui.get_icon("house-chimney"), "Branded", 1),
	other = slot_0_0_0.create(ui.get_icon("house-chimney"), "Other", 2)
}
slot_0_27_0 = {
	"SSG-08",
	"AWP",
	"Auto snipers",
	"Revolver"
}
slot_0_28_0 = {
	main = {
		categories = slot_0_26_0.two:list("\n", {
			"\v\f<layer-group>   \rMain",
			"\v\f<brackets-curly>   \rAnti-aim angles",
			"\v\f<wand-magic-sparkles>   \rMiscellaneous",
			"\v\f<folder>    \rConfigs"
		}),
		username = slot_0_26_0.first:label("Welcome back, \v"),
		username_button = slot_0_26_0.first:button(" " .. slot_0_25_0.username .. " \v[" .. slot_0_25_0.build .. "] ", function()
			return
		end, true),
		online = slot_0_26_0.first:label("They're playing now \v"),
		online_button = slot_0_26_0.first:button(" " .. slot_0_25_0.online .. " ", function()
			return
		end, true),
		main_text = slot_0_26_0.three:label("  \v\f<gift>   \rStay up to date on all the happenings!"),
		discord = slot_0_26_0.three:button("         \v\f<discord>  Discord         ", function()
			panorama.SteamOverlayAPI.OpenExternalBrowserURL("https://discord.gg/q4GNGe5g8s")
			cvar.play:call("ui/beepclear")
		end, true),
		verify = slot_0_26_0.three:button("          \v\f<key>  Verify           ", function()
			return
		end, true)
	},
	antiaim = {
		manual = slot_0_26_0.antiaim_tweaks:combo("\a363636FF•   \rManual Yaw", {
			"Disabled",
			"Left",
			"Right",
			"Forward"
		}, false, function(arg_10_0)
			return {
				static = arg_10_0:switch("Static yaw", false)
			}
		end),
		freestanding = slot_0_26_0.antiaim_tweaks:switch("\a363636FF•   \rFreestanding", false, function(arg_11_0)
			return {
				disablers = arg_11_0:selectable("Disablers", {
					"Standing",
					"Running",
					"Walking",
					"Crouching",
					"Crouching Moving",
					"Aerobic",
					"Aerobic+"
				}),
				disable_yaw_modifiers = arg_11_0:switch("Disable Yaw Modifiers", false),
				body_freestanding = arg_11_0:switch("Body Freestanding", false)
			}
		end),
		safe_head = slot_0_26_0.tweaks:switch("\a363636FF•   \rSafe Head", false, function(arg_12_0)
			return {
				state = arg_12_0:listable("Current state", {
					"Standing",
					"Crouching",
					"Aerobic+",
					"Knife",
					"Zeus"
				})
			}, true
		end),
		avoid_backstab = slot_0_26_0.tweaks:switch("\a363636FF•   \rAvoid Backstab", false),
		mode = slot_0_26_0.mode:combo("\a363636FF•   \rAnti-aim type", {
			"Single",
			"Teams"
		}),
		teams = slot_0_26_0.mode:combo("\a363636FF•   \rTeams", {
			"CT",
			"T"
		}, function(arg_13_0)
			return {
				send_to_another_team = arg_13_0:button("     Send to another team      ", function()
					local var_14_0 = menu.antiaim.teams:get() == "CT" and builder[i].ct or builder[i].t
					local var_14_1 = menu.antiaim.teams:get() == "CT" and builder[i].t or builder[i].ct

					paste_settings(var_14_1, copy_settings(var_14_0))
				end, true),
				copy = arg_13_0:button("       Copy       ", function()
					antiaim_vars.copied_settings = copy_settings(builder[i])
				end, true),
				paste = arg_13_0:button("       Paste       ", function()
					paste_settings(builder[i], antiaim_vars.copied_settings)
				end, true)
			}
		end),
		conditions = slot_0_26_0.five:combo("\a363636FF•   \rConditions", slot_0_25_0.state)
	},
	misc = {
		indicators = slot_0_26_0.render:switch("\a363636FF•   \rIndicators", false, function(arg_17_0)
			return {
				indicator_type = arg_17_0:list("\n", {
					"Crosshair",
					"Gamesense",
					"Damage",
					"Velocity"
				}),
				crosshair_enable = arg_17_0:switch("Enable \vCrosshair", false),
				crosshair_style = arg_17_0:list("\n\n", {
					"Style:\v Default",
					"Style:\v Modern"
				}),
				crosshair_color = arg_17_0:color_picker("Color", 255, 255, 255),
				gamesense_enable = arg_17_0:switch("Enable \vGamesense", false),
				gamesense_type = arg_17_0:list("\n\n", {
					"Default",
					"Modern"
				}),
				gamesense_binds = arg_17_0:selectable("Binds", {
					"Dormant",
					"Double tap",
					"Ping spike",
					"On shot anti-aim",
					"Freestanding",
					"Duck peek assist",
					"Minimum damage override",
					"Bomb info",
					"Force safe points",
					"Force body aim",
					"Aimbot stats",
					"Spectators"
				}),
				damage_enable = arg_17_0:switch("Enable \vDamage", false),
				damage_mode = arg_17_0:list("\n\n", {
					"Always on",
					"On Hotkey"
				}),
				damage_font = arg_17_0:combo("Font", {
					"Default",
					"Pixel"
				}),
				velocity_enable = arg_17_0:switch("Enable \vVelocity", false),
				velocity_color = arg_17_0:color_picker("Color", 255, 255, 255)
			}, true
		end),
		animation = slot_0_26_0.render:switch("\a363636FF•   \rAnimation", false, function(arg_18_0)
			return {
				ground = arg_18_0:combo("On ground", {
					"Disabled",
					"Reversed",
					"Moonwalk"
				}),
				air = arg_18_0:combo("In air", {
					"Disabled",
					"Static",
					"Moonwalk"
				}),
				addons = arg_18_0:selectable("Addons", {
					"Move Lean",
					"Smooth"
				}),
				movelean = arg_18_0:slider("Move line", 0, 100, 100, nil, "%")
			}, true
		end),
		scope_overlay = slot_0_26_0.render:switch("\a363636FF•   \rScope", false, function(arg_19_0)
			return {
				scope_position = arg_19_0:slider("Position", 0, 500, 160, 1, "%"),
				scope_offset = arg_19_0:slider("Offset", 0, 500, 5),
				scope_color = arg_19_0:color_picker("Color", 255, 255, 255)
			}, true
		end),
		aimbot_logs = slot_0_26_0.ragebot:switch("\a363636FF•   \rNotifications", false, function(arg_20_0)
			return {
				aimbot_type = arg_20_0:listable("\n", {
					"Console",
					"Screen",
					"Event"
				}),
				aimbot_event = arg_20_0:selectable("\n", {
					"Hit",
					"Miss",
					"Hurt"
				}),
				aimbot_hit = arg_20_0:color_picker("Hit color", 255, 255, 255),
				aimbot_miss = arg_20_0:color_picker("Miss color", 255, 255, 255),
				aimbot_hurt = arg_20_0:color_picker("Hurt color", 255, 255, 255)
			}, true
		end),
		automatic_peek = slot_0_26_0.ragebot:switch("\a363636FF•   \rAutomatic peek", false, function(arg_21_0)
			return {
				hitboxes = arg_21_0:selectable("Hitboxes", {
					"Head",
					"Chest",
					"Stomach",
					"Arms",
					"Legs"
				}),
				distance = arg_21_0:slider("Distance", 0, 50, 20, 1),
				visualize = arg_21_0:switch("Visualize lines"),
				visualize_type = arg_21_0:combo("Type", {
					"Lines",
					"Boxes"
				}),
				visualize_color = arg_21_0:color_picker("Visualize color", color(255, 255, 255, 255))
			}, true
		end),
		dormant_aimbot = slot_0_26_0.ragebot:switch("\a363636FF•   \rDormant aimbot", false, function(arg_22_0)
			return {
				hitboxes = arg_22_0:selectable("Hitboxes", {
					"Head",
					"Chest",
					"Stomach",
					"Arms",
					"Legs"
				}),
				hitchance = arg_22_0:slider("Hitchance", 0, 100, 0, 1),
				damage = arg_22_0:slider("Damage", 0, 100, 0, 1)
			}, true
		end),
		hitchance_override = slot_0_26_0.ragebot:switch("\a363636FF•   \rHitchance override", false, function(arg_23_0)
			return {
				hitchance_type = arg_23_0:list("\n", {
					"SSG-08",
					"AWP",
					"Auto Snipers",
					"Revolver"
				}),
				hitchance_enable_scout = arg_23_0:switch("Override \v SSG-08", false),
				hitchance_enable_awp = arg_23_0:switch("Override \v AWP", false),
				hitchance_enable_at = arg_23_0:switch("Override \v Auto Snipers", false),
				hitchance_enable_revolver = arg_23_0:switch("Override \v Revolver", false),
				scout_hitchance_air = arg_23_0:slider("Air", 0, 100, 35, 1),
				scout_hitchance_no_scope = arg_23_0:slider("No scope", 0, 100, 35, 1),
				awp_hitchance_air = arg_23_0:slider("Air", 0, 100, 35, 1),
				awp_hitchance_no_scope = arg_23_0:slider("No scope", 0, 100, 35, 1),
				at_hitchance_air = arg_23_0:slider("Air", 0, 100, 35, 1),
				at_hitchance_no_scope = arg_23_0:slider("No scope", 0, 100, 35, 1),
				revolver_hitchance_air = arg_23_0:slider("Air", 0, 100, 35, 1)
			}, true
		end),
		grenades = slot_0_26_0.other:switch("\a363636FF•   \rGrenades", false, function(arg_24_0)
			return {
				grenade_type = arg_24_0:list("\n", {
					"Super toss",
					"Grenade release"
				}),
				grenade_super_toss = arg_24_0:switch("Enable \vSuper toss", false),
				grenade_release = arg_24_0:switch("Enable \vGrenade release", false),
				grenade_release_amount = arg_24_0:slider("HP Trigger", 0, 50, 25, 1),
				grenade_release_type_nades = arg_24_0:selectable("Disablers", {
					"HE Grenade",
					"Smoke",
					"Molotov"
				})
			}, true
		end),
		movement = slot_0_26_0.other:switch("\a363636FF•   \rMovement", false, function(arg_25_0)
			return {
				select = arg_25_0:list("\n", {
					"Fast Ladder",
					"No Fall Damage"
				}),
				fast_ladder = arg_25_0:switch("Enable \vFast Ladder", false),
				no_fall_damage = arg_25_0:switch("Enable \vNo Fall Damage", false)
			}, true
		end),
		branded = slot_0_26_0.render:label("\a363636FF•   \rBranding", true, function(arg_26_0)
			return {
				typing = arg_26_0:list("\n", {
					"Watermark",
					"Clantag",
					"Shit talking"
				}),
				clantag = arg_26_0:switch("Enable \vClantag", false),
				shit_talking = arg_26_0:switch("Enable \vShit talking", false),
				shit_talking_type = arg_26_0:selectable("Trigger", {
					"Kill",
					"Death",
					"Revenge"
				}),
				watermark_style = arg_26_0:list("\n", {
					"Style:\v Default",
					"Style:\v Modern"
				}),
				watermark_default_color = arg_26_0:color_picker("Color", 255, 116, 116),
				watermark_modern_color = arg_26_0:color_picker("Color", 160, 196, 255)
			}
		end),
		aspect_ratio = slot_0_26_0.other:switch("\a363636FF•   \rAspect ratio", false, function(arg_27_0)
			return {
				aspect_ratio = arg_27_0:slider("Value", 50, 200, 133),
				aspect_ratio_pre = arg_27_0:button("16:10", function()
					return
				end, true),
				aspect_ratio_pre2 = arg_27_0:button("16:9", function()
					return
				end, true),
				aspect_ratio_pre3 = arg_27_0:button("5:4", function()
					return
				end, true),
				aspect_ratio_pre4 = arg_27_0:button("4:3", function()
					return
				end, true),
				aspect_ratio_pre5 = arg_27_0:button("3:2", function()
					return
				end, true)
			}, true
		end),
		viewmodel = slot_0_26_0.other:switch("\a363636FF•   \rViewmodel", false, function(arg_33_0)
			return {
				fov = arg_33_0:slider("Fov", -1000, 1000, 600, 0.1),
				x = arg_33_0:slider("X", -150, 150, 15, 0.1),
				y = arg_33_0:slider("Y", -150, 150, 15, 0.1),
				z = arg_33_0:slider("Z", -150, 150, -15, 0.1),
				left_knife = arg_33_0:switch("Left knife", false),
				default = arg_33_0:button("        Default        ", function()
					return
				end, true)
			}, true
		end)
	},
	configs = {
		list = slot_0_26_0.three:list("\n", {
			""
		}),
		text = slot_0_26_0.first:input("Enter name", ""),
		save = slot_0_26_0.three:button("   \f<floppy-disk>   ", function()
			return
		end, true),
		delete = slot_0_26_0.three:button("   \aff2121FF\f<trash>   ", function()
			return
		end, true),
		load = slot_0_26_0.three:button("        Load        ", function()
			return
		end, true),
		export = slot_0_26_0.three:button("   \f<copy>   ", function()
			return
		end, true),
		import = slot_0_26_0.three:button("   \f<clipboard>   ", function()
			return
		end, true)
	}
}


slot_0_28_0.main.username:depend({
	slot_0_28_0.main.categories,
	1
})
slot_0_28_0.main.username_button:depend({
	slot_0_28_0.main.categories,
	1
})
slot_0_28_0.main.online:depend({
	slot_0_28_0.main.categories,
	1
})
slot_0_28_0.main.online_button:depend({
	slot_0_28_0.main.categories,
	1
})
slot_0_28_0.main.verify:depend({
	slot_0_28_0.main.categories,
	1
})
slot_0_28_0.main.discord:depend({
	slot_0_28_0.main.categories,
	1
})
slot_0_28_0.main.main_text:depend({
	slot_0_28_0.main.categories,
	1
})
slot_0_28_0.antiaim.conditions:depend({
	slot_0_28_0.main.categories,
	2
})
slot_0_28_0.antiaim.safe_head:depend({
	slot_0_28_0.main.categories,
	2
})
slot_0_28_0.antiaim.manual:depend({
	slot_0_28_0.main.categories,
	2
})
slot_0_28_0.antiaim.freestanding:depend({
	slot_0_28_0.main.categories,
	2
})
slot_0_28_0.antiaim.avoid_backstab:depend({
	slot_0_28_0.main.categories,
	2
})
slot_0_28_0.misc.automatic_peek.visualize_type:depend({
	slot_0_28_0.misc.automatic_peek.visualize,
	true
})
slot_0_28_0.misc.automatic_peek.visualize_color:depend({
	slot_0_28_0.misc.automatic_peek.visualize,
	true
})
slot_0_28_0.misc.animation.movelean:depend({
	slot_0_28_0.misc.animation.addons,
	"Move Lean"
})
slot_0_28_0.misc.indicators:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.branded:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.aspect_ratio:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.viewmodel:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.dormant_aimbot:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.automatic_peek:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.hitchance_override:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.aimbot_logs:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.animation:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.scope_overlay:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.grenades:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.indicators:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.movement:depend({
	slot_0_28_0.main.categories,
	3
})
slot_0_28_0.misc.movement.fast_ladder:depend({
	slot_0_28_0.misc.movement.select,
	1
})
slot_0_28_0.misc.movement.no_fall_damage:depend({
	slot_0_28_0.misc.movement.select,
	2
})
slot_0_28_0.misc.branded.watermark_style:depend({
	slot_0_28_0.misc.branded.typing,
	1
})
slot_0_28_0.misc.branded.watermark_modern_color:depend({
	slot_0_28_0.misc.branded.typing,
	1
}, {
	slot_0_28_0.misc.branded.watermark_style,
	3
})
slot_0_28_0.misc.branded.watermark_default_color:depend({
	slot_0_28_0.misc.branded.typing,
	1
})
slot_0_28_0.misc.aimbot_logs.aimbot_event:depend({
	slot_0_28_0.misc.aimbot_logs.aimbot_type,
	function()
		for iter_40_0, iter_40_1 in ipairs(slot_0_28_0.misc.aimbot_logs.aimbot_type:get()) do
			if iter_40_1 == 1 or iter_40_1 == 2 or iter_40_1 == 3 then
				return true
			end
		end

		return false
	end,
	true
})
slot_0_28_0.misc.aimbot_logs.aimbot_hit:depend({
	slot_0_28_0.misc.aimbot_logs.aimbot_event,
	"Hit"
})
slot_0_28_0.misc.aimbot_logs.aimbot_miss:depend({
	slot_0_28_0.misc.aimbot_logs.aimbot_event,
	"Miss"
})
slot_0_28_0.misc.aimbot_logs.aimbot_hurt:depend({
	slot_0_28_0.misc.aimbot_logs.aimbot_event,
	"Hurt"
})
slot_0_28_0.misc.grenades.grenade_super_toss:depend({
	slot_0_28_0.misc.grenades.grenade_type,
	1
})
slot_0_28_0.misc.grenades.grenade_release:depend({
	slot_0_28_0.misc.grenades.grenade_type,
	2
})
slot_0_28_0.misc.grenades.grenade_release_amount:depend({
	slot_0_28_0.misc.grenades.grenade_type,
	2
}, {
	slot_0_28_0.misc.grenades.grenade_release,
	true
})
slot_0_28_0.misc.grenades.grenade_release_type_nades:depend({
	slot_0_28_0.misc.grenades.grenade_type,
	2
}, {
	slot_0_28_0.misc.grenades.grenade_release,
	true
})
slot_0_28_0.misc.indicators.gamesense_enable:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	2
})
slot_0_28_0.misc.indicators.gamesense_type:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	2
}, {
	slot_0_28_0.misc.indicators.gamesense_enable,
	true
})
slot_0_28_0.misc.indicators.gamesense_binds:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	2
}, {
	slot_0_28_0.misc.indicators.gamesense_enable,
	true
})
slot_0_28_0.misc.hitchance_override.hitchance_enable_scout:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	1
})
slot_0_28_0.misc.hitchance_override.hitchance_enable_awp:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	2
})
slot_0_28_0.misc.hitchance_override.hitchance_enable_at:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	3
})
slot_0_28_0.misc.hitchance_override.hitchance_enable_revolver:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	4
})
slot_0_28_0.misc.hitchance_override.scout_hitchance_air:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	1
}, {
	slot_0_28_0.misc.hitchance_override.hitchance_enable_scout,
	true
})
slot_0_28_0.misc.hitchance_override.scout_hitchance_no_scope:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	1
}, {
	slot_0_28_0.misc.hitchance_override.hitchance_enable_scout,
	true
})
slot_0_28_0.misc.hitchance_override.awp_hitchance_air:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	2
}, {
	slot_0_28_0.misc.hitchance_override.hitchance_enable_awp,
	true
})
slot_0_28_0.misc.hitchance_override.awp_hitchance_no_scope:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	2
}, {
	slot_0_28_0.misc.hitchance_override.hitchance_enable_awp,
	true
})
slot_0_28_0.misc.hitchance_override.at_hitchance_air:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	3
}, {
	slot_0_28_0.misc.hitchance_override.hitchance_enable_at,
	true
})
slot_0_28_0.misc.hitchance_override.at_hitchance_no_scope:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	3
}, {
	slot_0_28_0.misc.hitchance_override.hitchance_enable_at,
	true
})
slot_0_28_0.misc.hitchance_override.revolver_hitchance_air:depend({
	slot_0_28_0.misc.hitchance_override.hitchance_type,
	4
}, {
	slot_0_28_0.misc.hitchance_override.hitchance_enable_revolver,
	true
})
slot_0_28_0.misc.indicators.crosshair_enable:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	1
})
slot_0_28_0.misc.indicators.crosshair_color:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	1
}, {
	slot_0_28_0.misc.indicators.crosshair_enable,
	true
})
slot_0_28_0.misc.indicators.crosshair_style:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	1
}, {
	slot_0_28_0.misc.indicators.crosshair_enable,
	true
})
slot_0_28_0.misc.indicators.damage_enable:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	3
})
slot_0_28_0.misc.indicators.damage_mode:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	3
}, {
	slot_0_28_0.misc.indicators.damage_enable,
	true
})
slot_0_28_0.misc.indicators.damage_font:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	3
}, {
	slot_0_28_0.misc.indicators.damage_enable,
	true
})
slot_0_28_0.misc.indicators.velocity_enable:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	4
})
slot_0_28_0.misc.indicators.velocity_color:depend({
	slot_0_28_0.misc.indicators.indicator_type,
	4
}, {
	slot_0_28_0.misc.indicators.velocity_enable,
	true
})
slot_0_28_0.misc.branded.clantag:depend({
	slot_0_28_0.misc.branded.typing,
	2
})
slot_0_28_0.misc.branded.shit_talking:depend({
	slot_0_28_0.misc.branded.typing,
	3
})
slot_0_28_0.misc.branded.shit_talking_type:depend({
	slot_0_28_0.misc.branded.typing,
	3
}, {
	slot_0_28_0.misc.branded.shit_talking,
	true
})
slot_0_28_0.configs.list:depend({
	slot_0_28_0.main.categories,
	4
})
slot_0_28_0.configs.text:depend({
	slot_0_28_0.main.categories,
	4
})
slot_0_28_0.configs.load:depend({
	slot_0_28_0.main.categories,
	4
})
slot_0_28_0.configs.save:depend({
	slot_0_28_0.main.categories,
	4
})
slot_0_28_0.configs.delete:depend({
	slot_0_28_0.main.categories,
	4
})
slot_0_28_0.configs.export:depend({
	slot_0_28_0.main.categories,
	4
})
slot_0_28_0.configs.import:depend({
	slot_0_28_0.main.categories,
	4
})

function denync_format(arg_41_0)
	if arg_41_0 == 1 then
		return "Jitter"
	elseif arg_41_0 == 0 then
		return "Disabled"
	end

	return ""
end

function defensive_format(arg_42_0)
	if arg_42_0 == 1 then
		return "Setup"
	elseif arg_42_0 == 0 then
		return "Disabled"
	end

	return ""
end

slot_0_29_0 = {
	end_time = 0,
	ground_ticks = 1,
	stateid = 0,
	single = {
		yaw_add = 0,
		yaw_modifier_offset = 0,
		body_switch = false,
		body_ticks = 0,
		yaw_switch = false,
		yaw_ticks = 0,
		is_inverted = false
	},
	t = {
		yaw_add = 0,
		yaw_modifier_offset = 0,
		body_switch = false,
		body_ticks = 0,
		yaw_switch = false,
		yaw_ticks = 0,
		is_inverted = false
	},
	ct = {
		yaw_add = 0,
		yaw_modifier_offset = 0,
		body_switch = false,
		body_ticks = 0,
		yaw_switch = false,
		yaw_ticks = 0,
		is_inverted = false
	}
}

function copy_settings(arg_43_0)
	local var_43_0 = {}

	for iter_43_0, iter_43_1 in pairs(arg_43_0) do
		if type(iter_43_1) == "table" and iter_43_1.get then
			var_43_0[iter_43_0] = iter_43_1:get()
		elseif type(iter_43_1) == "table" then
			var_43_0[iter_43_0] = copy_settings(iter_43_1)
		end
	end

	slot_0_3_0.set(slot_0_2_0.encode(json.stringify(var_43_0)))
	cvar.play:call("ui/beepclear")

	return var_43_0
end

function paste_settings(arg_44_0, arg_44_1)
	if not arg_44_1 then
		cvar.play:call("resource/warning.wav")

		return
	end

	for iter_44_0, iter_44_1 in pairs(arg_44_1) do
		if type(iter_44_1) ~= "table" and arg_44_0[iter_44_0] and arg_44_0[iter_44_0].set then
			arg_44_0[iter_44_0]:set(iter_44_1)
		elseif type(iter_44_1) == "table" and type(arg_44_0[iter_44_0]) == "table" then
			paste_settings(arg_44_0[iter_44_0], iter_44_1)
		end
	end

	cvar.play:call("ui/beepclear")
end

builder = {}

for iter_0_0 = 1, #slot_0_25_0.state do
	builder[iter_0_0] = {
		enabled = slot_0_26_0.five:switch("\a363636FF•   \rOverride \v" .. slot_0_25_0.state[iter_0_0], false),
		single = {
			type = slot_0_26_0.yaw:slider("Yaw", 0, 2, 0, 1, function(arg_45_0)
				if arg_45_0 == 1 then
					return "Offset"
				elseif arg_45_0 == 2 then
					return "Left / Right"
				elseif arg_45_0 == 0 then
					return "Disabled"
				end

				return ""
			end),
			offset = slot_0_26_0.yaw:slider("Offset", -90, 90, 0, 1),
			left = slot_0_26_0.yaw:slider("Left", -90, 90, 0, 1, "°", false, function(arg_46_0)
				return {
					left_randomize_value = arg_46_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			right = slot_0_26_0.yaw:slider("Right", -90, 90, 0, 1, "°", false, function(arg_47_0)
				return {
					right_randomize_value = arg_47_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			modifier = slot_0_26_0.modifier:slider("Modifier", 0, 3, 0, 1, function(arg_48_0)
				if arg_48_0 == 1 then
					return "Offset"
				elseif arg_48_0 == 2 then
					return "Center"
				elseif arg_48_0 == 3 then
					return "Random"
				elseif arg_48_0 == 0 then
					return "Disabled"
				end

				return ""
			end),
			modifier_offset = slot_0_26_0.modifier:slider("Offset", -90, 90, 0, 1, false, function(arg_49_0)
				return {
					modifier_randomize_value = arg_49_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			modifier_center = slot_0_26_0.modifier:slider("Center", -90, 90, 0, 1, false, function(arg_50_0)
				return {
					modifier_randomize_value = arg_50_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			modifier_random = slot_0_26_0.modifier:slider("Random", -90, 90, 0, 1, false, function(arg_51_0)
				return {
					modifier_randomize_value = arg_51_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			body_yaw = slot_0_26_0.body_yaw:slider("Desync", 0, 1, 0, 1, denync_format, function(arg_52_0, arg_52_1)
				local var_52_0 = {
					body_yaw_left = arg_52_0:slider("Left limit", 0, 60, 60, 1, "°"),
					body_yaw_right = arg_52_0:slider("Right limit", 0, 60, 60, 1, "°"),
					body_yaw_delay_type = arg_52_0:list("\n", {
						"Delay: \vDefault",
						"Delay: \vModern",
						"Delay: \vPhase"
					}),
					body_yaw_delay = arg_52_0:slider("Amount", 1, 10, 0, 1, "t"),
					body_yaw_delay_random_value = arg_52_0:slider("Randomize", 0, 10, 0, 1, "t"),
					body_yaw_delay_min = arg_52_0:slider("Min", 1, 10, 0, 1, "t"),
					body_yaw_delay_max = arg_52_0:slider("Max", 1, 10, 0, 1, "t"),
					body_yaw_delay_choke = arg_52_0:slider("Choke", 0, 14, 0, 1, "t"),
					body_yaw_delay_phase = arg_52_0:slider("Phase", 0, 8, 0, 1, "")
				}
				local var_52_1 = {}

				for iter_52_0 = 1, 8 do
					local var_52_2 = arg_52_0:slider("Phase \v#" .. iter_52_0, 1, 10, 0, 1, "t")

					var_52_2:depend({
						var_52_0.body_yaw_delay_phase,
						function(arg_53_0)
							return var_52_0.body_yaw_delay_phase:get() >= iter_52_0
						end
					}, {
						var_52_0.body_yaw_delay_type,
						3
					})

					var_52_1[iter_52_0] = var_52_2
				end

				var_52_0.phase_sliders = var_52_1
				var_52_0.phase_sliders[0] = {
					skipsave = true
				}

				return var_52_0
			end),
			defensive = slot_0_26_0.defensive:slider("Defensive setup", 0, 1, 0, 1, defensive_format, function(arg_54_0)
				return {
					options = arg_54_0:selectable("Options", {
						"Double Tap",
						"Hide shots"
					}),
					pitch = arg_54_0:combo("Pitch", "Up", "Down", "Zero", "Random", "Customize"),
					pitch_value = arg_54_0:slider("Pitch Value", -89, 89, 0, 1, "°"),
					yaw = arg_54_0:combo("Yaw", "Spin", "Random", "Sideways", "Crawling", "Customize"),
					yaw_value = arg_54_0:slider("Degree", -180, 180, 0, 1, "°"),
					yaw_spin = arg_54_0:slider("Speed", 0, 10, 0, 1, "°"),
					choke_enable = arg_54_0:switch("Custom \vChoke"),
					choke_random = arg_54_0:switch("Randomize Choke"),
					choke_amount = arg_54_0:slider("From", 0, 22, 0, 1, "t"),
					choke_random_value = arg_54_0:slider("To", 0, 22, 0, 1, "t")
				}
			end)
		},
		t = {
			type = slot_0_26_0.yaw:slider("Yaw", 0, 2, 0, 1, function(arg_55_0)
				if arg_55_0 == 1 then
					return "Offset"
				elseif arg_55_0 == 2 then
					return "Left / Right"
				elseif arg_55_0 == 0 then
					return "Disabled"
				end

				return ""
			end),
			offset = slot_0_26_0.yaw:slider("Offset", -90, 90, 0, 1, "°"),
			left = slot_0_26_0.yaw:slider("Left", -90, 90, 0, 1, "°", false, function(arg_56_0)
				return {
					left_randomize_value = arg_56_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			right = slot_0_26_0.yaw:slider("Right", -90, 90, 0, 1, "°", false, function(arg_57_0)
				return {
					right_randomize_value = arg_57_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			modifier = slot_0_26_0.modifier:slider("Modifier", 0, 3, 0, 1, function(arg_58_0)
				if arg_58_0 == 1 then
					return "Offset"
				elseif arg_58_0 == 2 then
					return "Center"
				elseif arg_58_0 == 3 then
					return "Random"
				elseif arg_58_0 == 0 then
					return "Disabled"
				end

				return ""
			end),
			modifier_offset = slot_0_26_0.modifier:slider("Offset", -90, 90, 0, 1, false, function(arg_59_0)
				return {
					modifier_randomize_value = arg_59_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			modifier_center = slot_0_26_0.modifier:slider("Center", -90, 90, 0, 1, false, function(arg_60_0)
				return {
					modifier_randomize_value = arg_60_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			modifier_random = slot_0_26_0.modifier:slider("Random", -90, 90, 0, 1, false, function(arg_61_0)
				return {
					modifier_randomize_value = arg_61_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			body_yaw = slot_0_26_0.body_yaw:slider("Desync", 0, 3, 0, 1, denync_format, function(arg_62_0, arg_62_1)
				local var_62_0 = {
					body_yaw_left = arg_62_0:slider("Left limit", 0, 60, 60, 1, "°"),
					body_yaw_right = arg_62_0:slider("Right limit", 0, 60, 60, 1, "°"),
					body_yaw_delay_type = arg_62_0:list("\n", {
						"Delay: \vDefault",
						"Delay: \vModern",
						"Delay: \vPhase"
					}),
					body_yaw_delay = arg_62_0:slider("Amount", 1, 10, 0, 1, "t"),
					body_yaw_delay_random_value = arg_62_0:slider("Randomize", 0, 10, 0, 1, "t"),
					body_yaw_delay_min = arg_62_0:slider("Min", 1, 10, 0, 1, "t"),
					body_yaw_delay_max = arg_62_0:slider("Max", 1, 10, 0, 1, "t"),
					body_yaw_delay_choke = arg_62_0:slider("Choke", 0, 14, 0, 1, "t"),
					body_yaw_delay_phase = arg_62_0:slider("Phase", 0, 8, 0, 1, "")
				}
				local var_62_1 = {}

				for iter_62_0 = 1, 8 do
					local var_62_2 = arg_62_0:slider("Phase \v#" .. iter_62_0, 1, 10, 0, 1, "t")

					var_62_2:depend({
						var_62_0.body_yaw_delay_phase,
						function(arg_63_0)
							return var_62_0.body_yaw_delay_phase:get() >= iter_62_0
						end
					}, {
						var_62_0.body_yaw_delay_type,
						3
					})

					var_62_1[iter_62_0] = var_62_2
				end

				var_62_0.phase_sliders = var_62_1
				var_62_0.phase_sliders[0] = {
					skipsave = true
				}

				return var_62_0
			end),
			defensive = slot_0_26_0.defensive:slider("Defensive setup", 0, 1, 0, 1, defensive_format, function(arg_64_0)
				return {
					options = arg_64_0:selectable("Options", {
						"Double Tap",
						"Hide shots"
					}),
					pitch = arg_64_0:combo("Pitch", "Up", "Down", "Zero", "Random", "Customize"),
					pitch_value = arg_64_0:slider("Pitch Value", -89, 89, 0, 1, "°"),
					yaw = arg_64_0:combo("Yaw", "Spin", "Random", "Sideways", "Crawling", "Customize"),
					yaw_value = arg_64_0:slider("Degree", -180, 180, 0, 1, "°"),
					yaw_spin = arg_64_0:slider("Speed", 0, 10, 0, 1, "°"),
					choke_enable = arg_64_0:switch("Custom \vChoke"),
					choke_random = arg_64_0:switch("Randomize Choke"),
					choke_amount = arg_64_0:slider("From", 0, 22, 0, 1, "t"),
					choke_random_value = arg_64_0:slider("To", 0, 22, 0, 1, "t")
				}
			end)
		},
		ct = {
			type = slot_0_26_0.yaw:slider("Yaw", 0, 2, 0, 1, function(arg_65_0)
				if arg_65_0 == 1 then
					return "Offset"
				elseif arg_65_0 == 2 then
					return "Left / Right"
				elseif arg_65_0 == 0 then
					return "Disabled"
				end

				return ""
			end),
			offset = slot_0_26_0.yaw:slider("Offset", -90, 90, 0, 1),
			left = slot_0_26_0.yaw:slider("Left", -90, 90, 0, 1, "°", false, function(arg_66_0)
				return {
					left_randomize_value = arg_66_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			right = slot_0_26_0.yaw:slider("Right", -90, 90, 0, 1, "°", false, function(arg_67_0)
				return {
					right_randomize_value = arg_67_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			modifier = slot_0_26_0.modifier:slider("Modifier", 0, 3, 0, 1, function(arg_68_0)
				if arg_68_0 == 1 then
					return "Offset"
				elseif arg_68_0 == 2 then
					return "Center"
				elseif arg_68_0 == 3 then
					return "Random"
				elseif arg_68_0 == 0 then
					return "Disabled"
				end

				return ""
			end),
			modifier_offset = slot_0_26_0.modifier:slider("Offset", -90, 90, 0, 1, false, function(arg_69_0)
				return {
					modifier_randomize_value = arg_69_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			modifier_center = slot_0_26_0.modifier:slider("Center", -90, 90, 0, 1, false, function(arg_70_0)
				return {
					modifier_randomize_value = arg_70_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			modifier_random = slot_0_26_0.modifier:slider("Random", -90, 90, 0, 1, false, function(arg_71_0)
				return {
					modifier_randomize_value = arg_71_0:slider("Randomize", 0, 100, 0, 1, true, "By adjusting the \v'Randomize'\r slider, you increase randomization.")
				}
			end),
			body_yaw = slot_0_26_0.body_yaw:slider("Desync", 0, 3, 0, 1, denync_format, function(arg_72_0, arg_72_1)
				local var_72_0 = {
					body_yaw_left = arg_72_0:slider("Left limit", 0, 60, 60, 1, "°"),
					body_yaw_right = arg_72_0:slider("Right limit", 0, 60, 60, 1, "°"),
					body_yaw_delay_type = arg_72_0:list("\n", {
						"Delay: \vDefault",
						"Delay: \vModern",
						"Delay: \vPhase"
					}),
					body_yaw_delay = arg_72_0:slider("Amount", 1, 10, 0, 1, "t"),
					body_yaw_delay_random_value = arg_72_0:slider("Randomize", 0, 10, 0, 1, "t"),
					body_yaw_delay_min = arg_72_0:slider("Min", 1, 10, 0, 1, "t"),
					body_yaw_delay_max = arg_72_0:slider("Max", 1, 10, 0, 1, "t"),
					body_yaw_delay_choke = arg_72_0:slider("Choke", 0, 14, 0, 1, "t"),
					body_yaw_delay_phase = arg_72_0:slider("Phase", 0, 8, 0, 1, "")
				}
				local var_72_1 = {}

				for iter_72_0 = 1, 8 do
					local var_72_2 = arg_72_0:slider("Phase \v#" .. iter_72_0, 1, 10, 0, 1, "t")

					var_72_2:depend({
						var_72_0.body_yaw_delay_phase,
						function(arg_73_0)
							return var_72_0.body_yaw_delay_phase:get() >= iter_72_0
						end
					}, {
						var_72_0.body_yaw_delay_type,
						3
					})

					var_72_1[iter_72_0] = var_72_2
				end

				var_72_0.phase_sliders = var_72_1
				var_72_0.phase_sliders[0] = {
					skipsave = true
				}

				return var_72_0
			end),
			defensive = slot_0_26_0.defensive:slider("Defensive setup", 0, 1, 0, 1, defensive_format, function(arg_74_0)
				return {
					options = arg_74_0:selectable("Options", {
						"Double Tap",
						"Hide shots"
					}),
					pitch = arg_74_0:combo("Pitch", "Up", "Down", "Zero", "Random", "Customize"),
					pitch_value = arg_74_0:slider("Pitch Value", -89, 89, 0, 1, "°"),
					yaw = arg_74_0:combo("Yaw", "Spin", "Random", "Sideways", "Crawling", "Customize"),
					yaw_value = arg_74_0:slider("Degree", -180, 180, 0, 1, "°"),
					yaw_spin = arg_74_0:slider("Speed", 0, 10, 0, 1, "°"),
					choke_enable = arg_74_0:switch("Custom \vChoke"),
					choke_random = arg_74_0:switch("Randomize Choke"),
					choke_amount = arg_74_0:slider("From", 0, 22, 0, 1, "t"),
					choke_random_value = arg_74_0:slider("To", 0, 22, 0, 1, "t")
				}
			end)
		}
	}

	function slot_0_34_1(arg_75_0)
		local var_75_0 = arg_75_0:get()

		for iter_75_0 = 1, #var_75_0 do
			if var_75_0[iter_75_0] == "Double Tap" or var_75_0[iter_75_0] == "Hide shots" then
				return true
			end
		end

		return false
	end

	builder[iter_0_0].single.type:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	})
	builder[iter_0_0].single.offset:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.type,
		1
	})
	builder[iter_0_0].single.left:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.type,
		2
	})
	builder[iter_0_0].single.right:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.type,
		2
	})
	builder[iter_0_0].single.modifier:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	})
	builder[iter_0_0].single.modifier_offset:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.modifier,
		1
	})
	builder[iter_0_0].single.modifier_center:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.modifier,
		2
	})
	builder[iter_0_0].single.modifier_random:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.modifier,
		3
	})
	builder[iter_0_0].single.body_yaw:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	})
	builder[iter_0_0].single.body_yaw.body_yaw_left:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.body_yaw,
		1
	})
	builder[iter_0_0].single.body_yaw.body_yaw_right:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.body_yaw,
		1
	})
	builder[iter_0_0].single.body_yaw.body_yaw_delay_type:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.body_yaw,
		1
	})
	builder[iter_0_0].single.body_yaw.body_yaw_delay:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.body_yaw,
		1
	}, {
		builder[iter_0_0].single.body_yaw.body_yaw_delay_type,
		1
	})
	builder[iter_0_0].single.body_yaw.body_yaw_delay_random_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.body_yaw,
		1
	}, {
		builder[iter_0_0].single.body_yaw.body_yaw_delay_type,
		1
	}, {
		builder[iter_0_0].single.body_yaw.body_yaw_delay,
		function(arg_76_0)
			return arg_76_0:get() > 1
		end
	})
	builder[iter_0_0].single.body_yaw.body_yaw_delay_min:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.body_yaw,
		1
	}, {
		builder[iter_0_0].single.body_yaw.body_yaw_delay_type,
		2
	})
	builder[iter_0_0].single.body_yaw.body_yaw_delay_max:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.body_yaw,
		1
	}, {
		builder[iter_0_0].single.body_yaw.body_yaw_delay_type,
		2
	})
	builder[iter_0_0].single.body_yaw.body_yaw_delay_choke:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.body_yaw,
		1
	}, {
		builder[iter_0_0].single.body_yaw.body_yaw_delay_type,
		2
	})
	builder[iter_0_0].single.body_yaw.body_yaw_delay_phase:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.body_yaw,
		1
	}, {
		builder[iter_0_0].single.body_yaw.body_yaw_delay_type,
		3
	})
	builder[iter_0_0].single.defensive:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	})
	builder[iter_0_0].single.defensive.pitch:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	}, {
		builder[iter_0_0].single.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].single.defensive.pitch_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	}, {
		builder[iter_0_0].single.defensive.pitch,
		"Customize"
	}, {
		builder[iter_0_0].single.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].single.defensive.yaw:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	}, {
		builder[iter_0_0].single.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].single.defensive.yaw_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	}, {
		builder[iter_0_0].single.defensive.yaw,
		"Customize"
	}, {
		builder[iter_0_0].single.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].single.defensive.yaw_spin:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	}, {
		builder[iter_0_0].single.defensive.yaw,
		"Spin"
	}, {
		builder[iter_0_0].single.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].single.defensive.options:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	})
	builder[iter_0_0].single.defensive.choke_enable:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	}, {
		builder[iter_0_0].single.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].single.defensive.choke_amount:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	}, {
		builder[iter_0_0].single.defensive.choke_enable,
		true
	}, {
		builder[iter_0_0].single.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].single.defensive.choke_random:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	}, {
		builder[iter_0_0].single.defensive.choke_enable,
		true
	}, {
		builder[iter_0_0].single.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].single.defensive.choke_random_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Single"
	}, {
		builder[iter_0_0].single.defensive,
		1
	}, {
		builder[iter_0_0].single.defensive.choke_enable,
		true
	}, {
		builder[iter_0_0].single.defensive.choke_random,
		true
	}, {
		builder[iter_0_0].single.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].t.type:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	})
	builder[iter_0_0].t.offset:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.type,
		1
	})
	builder[iter_0_0].t.left:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.type,
		2
	})
	builder[iter_0_0].t.right:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.type,
		2
	})
	builder[iter_0_0].t.modifier:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	})
	builder[iter_0_0].t.modifier_offset:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.modifier,
		1
	})
	builder[iter_0_0].t.modifier_center:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.modifier,
		2
	})
	builder[iter_0_0].t.modifier_random:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.modifier,
		3
	})
	builder[iter_0_0].t.body_yaw:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	})
	builder[iter_0_0].t.body_yaw.body_yaw_left:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.body_yaw,
		1
	})
	builder[iter_0_0].t.body_yaw.body_yaw_right:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.body_yaw,
		1
	})
	builder[iter_0_0].t.body_yaw.body_yaw_delay_type:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.body_yaw,
		1
	})
	builder[iter_0_0].t.body_yaw.body_yaw_delay:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.body_yaw,
		1
	}, {
		builder[iter_0_0].t.body_yaw.body_yaw_delay_type,
		1
	})
	builder[iter_0_0].t.body_yaw.body_yaw_delay_random_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.body_yaw,
		1
	}, {
		builder[iter_0_0].t.body_yaw.body_yaw_delay_type,
		1
	}, {
		builder[iter_0_0].t.body_yaw.body_yaw_delay,
		function(arg_77_0)
			return arg_77_0:get() > 1
		end
	})
	builder[iter_0_0].t.body_yaw.body_yaw_delay_min:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.body_yaw,
		1
	}, {
		builder[iter_0_0].t.body_yaw.body_yaw_delay_type,
		2
	})
	builder[iter_0_0].t.body_yaw.body_yaw_delay_max:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.body_yaw,
		1
	}, {
		builder[iter_0_0].t.body_yaw.body_yaw_delay_type,
		2
	})
	builder[iter_0_0].t.body_yaw.body_yaw_delay_choke:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.body_yaw,
		1
	}, {
		builder[iter_0_0].t.body_yaw.body_yaw_delay_type,
		2
	})
	builder[iter_0_0].t.body_yaw.body_yaw_delay_phase:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.body_yaw,
		1
	}, {
		builder[iter_0_0].t.body_yaw.body_yaw_delay_type,
		3
	})
	builder[iter_0_0].t.defensive:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	})
	builder[iter_0_0].t.defensive.pitch:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	}, {
		builder[iter_0_0].t.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].t.defensive.pitch_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	}, {
		builder[iter_0_0].t.defensive.pitch,
		"Customize"
	}, {
		builder[iter_0_0].t.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].t.defensive.yaw:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	}, {
		builder[iter_0_0].t.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].t.defensive.yaw_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	}, {
		builder[iter_0_0].t.defensive.yaw,
		"Customize"
	}, {
		builder[iter_0_0].t.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].t.defensive.yaw_spin:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	}, {
		builder[iter_0_0].t.defensive.yaw,
		"Spin"
	}, {
		builder[iter_0_0].t.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].t.defensive.options:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	})
	builder[iter_0_0].t.defensive.choke_enable:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	}, {
		builder[iter_0_0].t.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].t.defensive.choke_amount:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	}, {
		builder[iter_0_0].t.defensive.choke_enable,
		true
	}, {
		builder[iter_0_0].t.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].t.defensive.choke_random:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	}, {
		builder[iter_0_0].t.defensive.choke_enable,
		true
	}, {
		builder[iter_0_0].t.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].t.defensive.choke_random_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"T"
	}, {
		builder[iter_0_0].t.defensive,
		1
	}, {
		builder[iter_0_0].t.defensive.choke_enable,
		true
	}, {
		builder[iter_0_0].t.defensive.choke_random,
		true
	}, {
		builder[iter_0_0].t.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].ct.type:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	})
	builder[iter_0_0].ct.offset:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.type,
		1
	})
	builder[iter_0_0].ct.left:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.type,
		2
	})
	builder[iter_0_0].ct.right:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.type,
		2
	})
	builder[iter_0_0].ct.modifier:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	})
	builder[iter_0_0].ct.modifier_offset:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.modifier,
		1
	})
	builder[iter_0_0].ct.modifier_center:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.modifier,
		2
	})
	builder[iter_0_0].ct.modifier_random:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.modifier,
		3
	})
	builder[iter_0_0].ct.body_yaw:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	})
	builder[iter_0_0].ct.body_yaw.body_yaw_left:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.body_yaw,
		1
	})
	builder[iter_0_0].ct.body_yaw.body_yaw_right:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.body_yaw,
		1
	})
	builder[iter_0_0].ct.body_yaw.body_yaw_delay_type:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.body_yaw,
		1
	})
	builder[iter_0_0].ct.body_yaw.body_yaw_delay:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.body_yaw,
		1
	}, {
		builder[iter_0_0].ct.body_yaw.body_yaw_delay_type,
		1
	})
	builder[iter_0_0].ct.body_yaw.body_yaw_delay_random_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.body_yaw,
		1
	}, {
		builder[iter_0_0].ct.body_yaw.body_yaw_delay_type,
		1
	}, {
		builder[iter_0_0].ct.body_yaw.body_yaw_delay,
		function(arg_78_0)
			return arg_78_0:get() > 1
		end
	})
	builder[iter_0_0].ct.body_yaw.body_yaw_delay_min:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.body_yaw,
		1
	}, {
		builder[iter_0_0].ct.body_yaw.body_yaw_delay_type,
		2
	})
	builder[iter_0_0].ct.body_yaw.body_yaw_delay_max:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.body_yaw,
		1
	}, {
		builder[iter_0_0].ct.body_yaw.body_yaw_delay_type,
		2
	})
	builder[iter_0_0].ct.body_yaw.body_yaw_delay_choke:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.body_yaw,
		1
	}, {
		builder[iter_0_0].ct.body_yaw.body_yaw_delay_type,
		2
	})
	builder[iter_0_0].ct.body_yaw.body_yaw_delay_phase:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.body_yaw,
		1
	}, {
		builder[iter_0_0].ct.body_yaw.body_yaw_delay_type,
		3
	})
	builder[iter_0_0].ct.defensive:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	})
	builder[iter_0_0].ct.defensive.pitch:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	}, {
		builder[iter_0_0].ct.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].ct.defensive.pitch_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	}, {
		builder[iter_0_0].ct.defensive.pitch,
		"Customize"
	}, {
		builder[iter_0_0].ct.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].ct.defensive.yaw:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	}, {
		builder[iter_0_0].ct.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].ct.defensive.yaw_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	}, {
		builder[iter_0_0].ct.defensive.yaw,
		"Customize"
	}, {
		builder[iter_0_0].ct.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].ct.defensive.yaw_spin:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	}, {
		builder[iter_0_0].ct.defensive.yaw,
		"Spin"
	}, {
		builder[iter_0_0].ct.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].ct.defensive.options:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	})
	builder[iter_0_0].ct.defensive.choke_enable:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	}, {
		builder[iter_0_0].ct.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].ct.defensive.choke_amount:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	}, {
		builder[iter_0_0].ct.defensive.choke_enable,
		true
	}, {
		builder[iter_0_0].ct.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].ct.defensive.choke_random:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	}, {
		builder[iter_0_0].ct.defensive.choke_enable,
		true
	}, {
		builder[iter_0_0].ct.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].ct.defensive.choke_random_value:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		builder[iter_0_0].enabled,
		true
	}, {
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	}, {
		slot_0_28_0.antiaim.teams,
		"CT"
	}, {
		builder[iter_0_0].ct.defensive,
		1
	}, {
		builder[iter_0_0].ct.defensive.choke_enable,
		true
	}, {
		builder[iter_0_0].ct.defensive.choke_random,
		true
	}, {
		builder[iter_0_0].ct.defensive.options,
		slot_0_34_1
	})
	builder[iter_0_0].enabled:depend({
		slot_0_28_0.antiaim.conditions,
		slot_0_25_0.state[iter_0_0]
	}, {
		slot_0_28_0.main.categories,
		2
	})
	slot_0_28_0.antiaim.mode:depend({
		slot_0_28_0.main.categories,
		2
	})
	slot_0_28_0.antiaim.teams:depend({
		slot_0_28_0.main.categories,
		2
	}, {
		slot_0_28_0.antiaim.mode,
		"Teams"
	})
end

function antiaim(arg_79_0)
	slot_79_1_0 = entity.get_local_player()

	if slot_79_1_0 == nil or not slot_79_1_0:is_alive() then
		return
	end

	function in_air()
		if entity.get_local_player() == nil then
			return
		end

		if bit.band(entity.get_local_player().m_fFlags, 1) == 1 then
			slot_0_29_0.ground_ticks = slot_0_29_0.ground_ticks + 1
		else
			slot_0_29_0.ground_ticks = 0
			slot_0_29_0.end_time = globals.curtime + 1
		end

		return slot_0_29_0.ground_ticks > 1 and slot_0_29_0.end_time > globals.curtime
	end

	function get_player_state(arg_81_0)
		in_air()

		local var_81_0 = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 0)) ~= 0
		local var_81_1 = slot_0_29_0.end_time > globals.curtime + 0.9
		local var_81_2 = slot_0_23_0.slow_walk:get()
		local var_81_3 = bit.band(entity.get_local_player().m_fFlags, bit.lshift(1, 1)) ~= 0 or slot_0_23_0.fake_duck:get()
		local var_81_4 = entity.get_local_player().m_vecVelocity.x
		local var_81_5 = entity.get_local_player().m_vecVelocity.y
		local var_81_6 = math.sqrt(var_81_4^2 + var_81_5^2) > 5

		if var_81_0 and not var_81_6 and not var_81_3 then
			return "Standing"
		elseif not var_81_1 and not var_81_3 and not var_81_2 then
			return "Running"
		elseif var_81_2 and var_81_0 then
			return "Walking"
		elseif var_81_3 and not var_81_6 and not var_81_1 and var_81_0 then
			return "Crouching"
		elseif var_81_3 and var_81_6 and not var_81_1 and var_81_0 then
			return "Crouching Moving"
		elseif var_81_1 and not var_81_3 then
			return "Aerobic"
		elseif var_81_3 and (var_81_1 or not var_81_0) then
			return "Aerobic+"
		else
			return "Default"
		end
	end

	slot_79_2_0 = get_player_state(arg_79_0)
	slot_0_29_0.stateid = 1

	for iter_79_0 = 1, #slot_0_25_0.state do
		if builder[iter_79_0].enabled:get() and slot_0_25_0.state[iter_79_0] == slot_79_2_0 then
			slot_0_29_0.stateid = iter_79_0

			break
		end
	end

	slot_79_3_0 = slot_79_1_0.m_iTeamNum
	slot_79_4_0 = slot_0_28_0.antiaim.mode:get()
	slot_79_5_0 = nil

	if slot_79_4_0 == "Single" then
		slot_79_5_0 = builder[slot_0_29_0.stateid].single
	elseif slot_79_4_0 == "Teams" then
		if slot_79_3_0 == 2 then
			slot_79_5_0 = builder[slot_0_29_0.stateid].t
		elseif slot_79_3_0 == 3 then
			slot_79_5_0 = builder[slot_0_29_0.stateid].ct
		else
			slot_79_5_0 = builder[slot_0_29_0.stateid].single
		end
	end

	if slot_0_28_0.antiaim.manual:get() == "Forward" then
		slot_0_23_0.yaw_base:override("Local View")
		slot_0_23_0.offset_y:override(180)
	elseif slot_0_28_0.antiaim.manual:get() == "Left" then
		slot_0_23_0.yaw_base:override("Local View")
		slot_0_23_0.offset_y:override(-90)
	elseif slot_0_28_0.antiaim.manual:get() == "Right" then
		slot_0_23_0.yaw_base:override("Local View")
		slot_0_23_0.offset_y:override(90)
	end

	if arg_79_0.choked_commands == 0 then
		slot_0_23_0.pitch:override("Down")
		slot_0_23_0.yaw:override("Backward")
		slot_0_23_0.yaw_base:override("At Target")
		slot_0_23_0.freestanding:override(slot_0_28_0.antiaim.freestanding:get())
		slot_0_23_0.freestanding_body_freestanding:override(slot_0_28_0.antiaim.freestanding.body_freestanding:get())
		slot_0_23_0.freestanding_disable_yaw_modifiers:override(slot_0_28_0.antiaim.freestanding.disable_yaw_modifiers:get())
		slot_0_23_0.avoid_backstab:override(slot_0_28_0.antiaim.avoid_backstab:get())

		slot_79_6_1 = slot_79_4_0 == "Single" and slot_0_29_0.single or slot_79_3_0 == 2 and slot_0_29_0.t or slot_0_29_0.ct
		slot_79_6_1.is_inverted = not rage.antiaim:inverter()
		slot_79_7_1 = 1

		if slot_79_5_0.body_yaw:get() > 0 then
			slot_79_8_4 = slot_79_5_0.body_yaw.body_yaw_delay_type:get()

			if slot_79_8_4 == 1 then
				slot_79_9_6 = slot_79_5_0.body_yaw.body_yaw_delay:get()
				slot_79_10_11 = slot_79_5_0.body_yaw.body_yaw_delay_random_value:get()

				if slot_79_10_11 > 0 and slot_79_9_6 > 1 then
					slot_79_11_3 = slot_79_9_6 - slot_79_10_11 / 100 * slot_79_9_6
					slot_79_12_3 = slot_79_9_6 + slot_79_10_11 / 100 * slot_79_9_6
					slot_79_7_1 = math.floor(math.random(slot_79_11_3, slot_79_12_3) + 0.5)
				else
					slot_79_7_1 = slot_79_9_6
				end

				if slot_79_7_1 <= slot_79_6_1.body_ticks then
					slot_79_6_1.body_ticks = 0
				else
					slot_79_6_1.body_ticks = slot_79_6_1.body_ticks + 1
				end
			elseif slot_79_8_4 == 2 then
				slot_79_9_5 = slot_79_5_0.body_yaw.body_yaw_delay_min:get()
				slot_79_10_10 = slot_79_5_0.body_yaw.body_yaw_delay_max:get()

				if slot_79_10_10 < slot_79_9_5 then
					slot_79_9_5, slot_79_10_10 = slot_79_10_10, slot_79_9_5
				end

				slot_79_11_2 = slot_79_9_5 < slot_79_10_10
				slot_79_7_1 = not slot_79_11_2 and slot_79_9_5 == 0 and 1 or slot_79_11_2 and math.random(slot_79_9_5, slot_79_10_10) or slot_79_9_5

				if slot_79_5_0.body_yaw.body_yaw_delay_choke:get() > 0 then
					choke_value = slot_79_11_2 and math.random(slot_79_9_5, slot_79_10_10) or slot_79_9_5
				end
			elseif slot_79_8_4 == 3 then
				slot_79_9_4 = slot_79_5_0.body_yaw.body_yaw_delay_phase:get()

				if slot_79_9_4 > 0 then
					slot_79_10_9 = globals.tickcount % slot_79_9_4 + 1

					if slot_79_10_9 <= 8 and slot_79_5_0.body_yaw.phase_sliders[slot_79_10_9] then
						slot_79_7_1 = slot_79_5_0.body_yaw.phase_sliders[slot_79_10_9]:get()
					else
						slot_79_7_1 = 1
					end
				else
					slot_79_7_1 = 1
				end
			end
		end

		if slot_79_5_0.body_yaw:get() == 1 and slot_79_7_1 > 1 then
			slot_79_6_1.yaw_ticks = slot_79_6_1.yaw_ticks + 1

			if slot_79_7_1 <= slot_79_6_1.yaw_ticks then
				slot_79_6_1.yaw_ticks = 0
				slot_79_6_1.yaw_switch = not slot_79_6_1.yaw_switch
			end

			slot_79_6_1.is_inverted = slot_79_6_1.yaw_switch
		end

		if slot_79_5_0.body_yaw:get() > 0 then
			slot_0_23_0.bodyyaw:override(true)

			if slot_79_5_0.body_yaw:get() == 1 then
				if slot_79_7_1 > 1 then
					slot_0_23_0.bodyyaw_inverter:override(slot_79_6_1.is_inverted)
					slot_0_23_0.bodyyaw_options:override("")
				else
					slot_0_23_0.bodyyaw_inverter:override()
					slot_0_23_0.bodyyaw_options:override("Jitter")
				end
			end

			slot_0_23_0.bodyyaw_freestanding:override("Off")
			slot_0_23_0.bodyyaw_left_limit:override()
			slot_0_23_0.bodyyaw_right_limit:override()
		else
			slot_0_23_0.bodyyaw:override(false)
			slot_0_23_0.bodyyaw_options:override()
			slot_0_23_0.bodyyaw_inverter:override()
			slot_0_23_0.bodyyaw_freestanding:override()
			slot_0_23_0.bodyyaw_left_limit:override()
			slot_0_23_0.bodyyaw_right_limit:override()
		end

		if slot_79_5_0.type:get() == 1 then
			slot_79_6_1.yaw_add = slot_79_5_0.offset:get()
		elseif slot_79_5_0.type:get() == 2 then
			slot_79_8_3 = slot_79_5_0.left:get()
			slot_79_9_3 = slot_79_5_0.right:get()
			slot_79_10_8 = slot_79_5_0.left.left_randomize_value
			slot_79_11_1 = slot_79_5_0.right.right_randomize_value

			if slot_79_10_8 then
				slot_79_12_2 = slot_79_10_8:get()

				if slot_79_12_2 > 0 then
					slot_79_13_1 = slot_79_12_2 / 100 * slot_79_8_3
					slot_79_8_3 = math.random(slot_79_8_3 - slot_79_13_1, slot_79_8_3)
				end
			end

			if slot_79_11_1 then
				slot_79_12_1 = slot_79_11_1:get()

				if slot_79_12_1 > 0 then
					slot_79_13_0 = slot_79_12_1 / 100 * slot_79_9_3
					slot_79_9_3 = math.random(slot_79_9_3 - slot_79_13_0, slot_79_9_3)
				end
			end

			slot_79_6_1.yaw_add = slot_79_6_1.is_inverted and slot_79_8_3 or slot_79_9_3
		else
			slot_79_6_1.yaw_add = 0
		end

		if slot_79_5_0.modifier:get() ~= 0 then
			slot_79_8_2 = 0
			slot_79_9_2 = slot_79_5_0.modifier:get()

			if slot_79_9_2 == 1 then
				slot_79_8_2 = slot_79_5_0.modifier_offset:get()
				slot_79_10_7 = slot_79_5_0.modifier_offset.modifier_randomize_value

				if slot_79_10_7 then
					slot_79_10_6 = slot_79_10_7:get()

					if slot_79_10_6 > 0 then
						slot_79_8_2 = slot_79_8_2 + math.random(-slot_79_10_6 / 100 * slot_79_8_2, slot_79_10_6 / 100 * slot_79_8_2)
					end
				end
			elseif slot_79_9_2 == 2 then
				slot_79_8_2 = slot_79_5_0.modifier_center:get()
				slot_79_10_5 = slot_79_5_0.modifier_center.modifier_randomize_value

				if slot_79_10_5 then
					slot_79_10_4 = slot_79_10_5:get()

					if slot_79_10_4 > 0 then
						slot_79_8_2 = slot_79_8_2 + math.random(-slot_79_10_4 / 100 * slot_79_8_2, slot_79_10_4 / 100 * slot_79_8_2)
					end
				end
			elseif slot_79_9_2 == 3 then
				slot_79_8_2 = slot_79_5_0.modifier_random:get()
				slot_79_10_3 = slot_79_5_0.modifier_random.modifier_randomize_value

				if slot_79_10_3 then
					slot_79_10_2 = slot_79_10_3:get()

					if slot_79_10_2 > 0 then
						slot_79_8_2 = slot_79_8_2 + math.random(-slot_79_10_2 / 100 * slot_79_8_2, slot_79_10_2 / 100 * slot_79_8_2)
					end
				end
			end

			if slot_79_6_1.is_inverted then
				slot_79_6_1.yaw_add = slot_79_6_1.yaw_add + slot_79_8_2 * 0.5
			else
				slot_79_6_1.yaw_add = slot_79_6_1.yaw_add - slot_79_8_2 * 0.5
			end

			slot_0_23_0.yaw_modifier:override("Disabled")
			slot_0_23_0.yaw_modifier_offset:override(0)
		else
			slot_0_23_0.yaw_modifier:override()
			slot_0_23_0.yaw_modifier_offset:override()
		end

		slot_0_23_0.yaw_offset:override(slot_79_6_1.yaw_add)
	end

	slot_79_6_0 = slot_79_1_0:get_player_weapon()

	if slot_79_6_0 == nil then
		return
	end

	slot_79_7_0 = slot_79_6_0:get_classname()

	if slot_79_7_0 == nil then
		return
	end

	slot_79_8_1 = false

	if slot_0_28_0.antiaim.safe_head:get() then
		function slot_79_9_1()
			slot_0_23_0.pitch:override("Down")
			slot_0_23_0.offset_y:override(0)
			slot_0_23_0.yaw_modifier:override("Disabled")
			slot_0_23_0.yaw_modifier_offset:override(0)
			slot_0_23_0.bodyyaw:override(true)
			slot_0_23_0.bodyyaw_options:override("")
			slot_0_23_0.bodyyaw_left_limit:override(0)
			slot_0_23_0.bodyyaw_right_limit:override(0)
			slot_0_23_0.bodyyaw_freestanding:override("Off")
			slot_0_23_0.hidden_yaw:override(false)
		end

		slot_79_10_1 = {
			slot_0_28_0.antiaim.safe_head.state:get(4) and slot_79_7_0 == "CKnife" and slot_79_2_0 == "Aerobic+",
			slot_0_28_0.antiaim.safe_head.state:get(5) and slot_79_7_0 == "CWeaponTaser" and slot_79_2_0 == "Aerobic+",
			slot_0_28_0.antiaim.safe_head.state:get(1) and slot_79_2_0 == "Standing",
			slot_0_28_0.antiaim.safe_head.state:get(2) and slot_79_2_0 == "Crouching",
			slot_0_28_0.antiaim.safe_head.state:get(3) and slot_79_2_0 == "Aerobic+"
		}

		if slot_79_10_1[1] or slot_79_10_1[2] or slot_79_10_1[3] or slot_79_10_1[4] or slot_79_10_1[5] then
			slot_79_9_1()
			slot_0_23_0.hidden_yaw:set(false)

			slot_79_8_0 = true
		end
	end

	slot_79_9_0 = nil

	if slot_79_4_0 == "Single" then
		slot_79_9_0 = builder[slot_0_29_0.stateid].single
	elseif slot_79_4_0 == "Teams" then
		if slot_79_3_0 == 2 then
			slot_79_9_0 = builder[slot_0_29_0.stateid].t
		elseif slot_79_3_0 == 3 then
			slot_79_9_0 = builder[slot_0_29_0.stateid].ct
		else
			slot_79_9_0 = builder[slot_0_29_0.stateid].single
		end
	end

	slot_79_10_0 = slot_79_9_0.defensive
	slot_79_11_0 = slot_79_10_0.options:get("Hide shots")
	slot_79_12_0 = slot_79_10_0.options:get("Double tap")

	if slot_79_10_0:get() == 1 and (slot_79_11_0 or slot_79_12_0) or slot_79_11_0 or slot_79_12_0 then
		slot_0_23_0.hidden_yaw:override(true)

		if slot_79_10_0:get() == 1 and slot_79_10_0.choke_enable:get() and (slot_79_11_0 or slot_79_12_0) then
			slot_79_14_1 = slot_79_10_0.choke_amount:get()

			if slot_79_10_0.choke_random:get() then
				slot_79_15_1 = math.min(slot_79_14_1, slot_79_10_0.choke_random_value:get())
				slot_79_16_1 = math.max(slot_79_14_1, slot_79_10_0.choke_random_value:get())
				slot_79_14_1 = utils.random_int(slot_79_15_1, slot_79_16_1)
			end

			arg_79_0.force_defensive = arg_79_0.command_number % slot_79_14_1 == 0
		else
			arg_79_0.force_defensive = false
		end
	else
		slot_0_23_0.hidden_yaw:override(false)

		arg_79_0.force_defensive = false
	end

	if slot_79_11_0 then
		slot_0_23_0.hide_shots_options:override("Break LC")
		slot_0_23_0.hidden_yaw:override(true)
	else
		slot_0_23_0.hide_shots_options:override()
	end

	if slot_79_12_0 then
		slot_0_23_0.lag_options:override("Always On")
		slot_0_23_0.hidden_yaw:override(true)
	else
		slot_0_23_0.lag_options:override()
	end

	slot_79_14_0 = slot_79_10_0.pitch:get()
	slot_79_15_0 = nil

	if slot_79_14_0 == "Up" then
		slot_79_15_0 = -89
	elseif slot_79_14_0 == "Down" then
		slot_79_15_0 = 89
	elseif slot_79_14_0 == "Zero" then
		slot_79_15_0 = 0
	elseif slot_79_14_0 == "Random" then
		slot_79_15_0 = utils.random_int(-89, 89)
	else
		slot_79_15_0 = slot_79_10_0.pitch_value:get()
	end

	rage.antiaim:override_hidden_pitch(slot_79_15_0)

	slot_79_16_0 = slot_79_10_0.yaw:get()
	slot_79_17_0 = nil

	if slot_79_16_0 == "Sideways" then
		slot_79_17_0 = rage.antiaim:inverter() and -90 or 90
	elseif slot_79_16_0 == "Spin" then
		slot_79_17_0 = globals.curtime * slot_79_10_0.yaw_spin:get() * 2 % 360
	elseif slot_79_16_0 == "Random" then
		slot_79_17_0 = utils.random_int(-180, 180)
	elseif slot_79_16_0 == "Crawling" then
		slot_79_17_0 = not rage.antiaim:inverter() and globals.tickcount % 20 < 10 and 120 or -120
	else
		slot_79_17_0 = slot_79_10_0.yaw_value:get()
	end

	rage.antiaim:override_hidden_yaw_offset(slot_79_17_0)
end

function watermark()
	if slot_0_28_0.misc.branded.watermark_style:get() == 1 then
		local var_83_0 = "stellar.nightly"
		local var_83_1 = 1
		local var_83_2 = render.measure_text(var_83_1, nil, var_83_0)
		local var_83_3 = vector(slot_0_16_0.x / 2 - var_83_2.x / 2, slot_0_16_0.y - var_83_2.y - 10)

		render.text(var_83_1, var_83_3, slot_0_28_0.misc.branded.watermark_default_color:get(), nil, var_83_0)
	elseif slot_0_28_0.misc.branded.watermark_style:get() == 2 then
		local var_83_4 = "stellar nightly / "
		local var_83_5 = slot_0_25_0.username or ""
		local var_83_6 = 4
		local var_83_7 = render.measure_text(var_83_6, nil, var_83_4)
		local var_83_8 = vector(10, slot_0_16_0.y / 2 - var_83_7.y / 2)

		render.text(var_83_6, var_83_8, slot_0_28_0.misc.branded.watermark_modern_color:get(), nil, var_83_4)

		local var_83_9 = vector(var_83_8.x + var_83_7.x, var_83_8.y)

		render.text(var_83_6, var_83_9, color(255, 255, 255, 255), nil, var_83_5)
	end
end

function get_bind(arg_84_0)
	local var_84_0 = false
	local var_84_1 = 0
	local var_84_2 = ui.get_binds()

	for iter_84_0 = 1, #var_84_2 do
		if var_84_2[iter_84_0].name == arg_84_0 and var_84_2[iter_84_0].active then
			var_84_0 = true
			var_84_1 = var_84_2[iter_84_0].value
		end
	end

	return {
		var_84_0,
		var_84_1
	}
end

slot_0_30_0 = {
	last_texture_update_time = 0,
	current_slowdown = 0,
	current_exploit_charge = 0,
	limit_lines_alpha = 0,
	last_frame_time = 0,
	lerp_speed = 0.2,
	fade_speed = 0.1,
	max_cache_size = 50,
	limit_lines_alpha_velocity = 0,
	crosshair_pos_initialized = false,
	was_active = false,
	texture_update_cooldown = 0.15,
	indicators_state = {
		DT = {
			x = 0,
			a = 0,
			e = false,
			y = 0
		},
		HS = {
			x = 0,
			a = 0,
			e = false,
			y = 0
		},
		FA = {
			x = 0,
			a = 0,
			e = false,
			y = 0
		},
		BODY = {
			x = 0,
			a = 0,
			e = false,
			y = 0
		},
		SAFE = {
			x = 0,
			a = 0,
			e = false,
			y = 0
		},
		FS = {
			x = 0,
			a = 0,
			e = false,
			y = 0
		}
	},
	title_state = {
		x = 0,
		animated_h = 0
	},
	indicator_panel = {
		x = 0,
		h = 0,
		w = 0,
		y = 0
	},
	velocity_pos = {
		w = 150,
		h = 30
	},
	mi = {
		lerped_dmg_value = 0,
		lerped_alpha = 0,
		damage_pos_initialized = false,
		lerp_speed = 0.05,
		fade_speed = 0.1,
		damage_pos = {
			x = 0,
			h = 15,
			w = 30,
			y = 0
		},
		boundary_box = {
			x = 0,
			h = 130,
			w = 130,
			y = 0
		}
	},
	texture_cache = {},
	cache_keys = {}
}
slot_0_31_0 = "<svg width=\"800px\" height=\"800px\" viewBox=\"0 0 24 24\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n  <path fill-rule=\"evenodd\" clip-rule=\"evenodd\" d=\"M13.0618 4.4295C12.6211 3.54786 11.3635 3.54786 10.9228 4.4295L3.88996 18.5006C3.49244 19.2959 4.07057 20.2317 4.95945 20.2317H19.0252C19.914 20.2317 20.4922 19.2959 20.0947 18.5006L13.0618 4.4295ZM9.34184 3.6387C10.4339 1.45376 13.5507 1.45377 14.6428 3.63871L21.6756 17.7098C22.6608 19.6809 21.228 22 19.0252 22H4.95945C2.75657 22 1.32382 19.6809 2.30898 17.7098L9.34184 3.6387Z\" fill=\"%s\"/>\n  <path d=\"M12 8V13\" stroke=\"%s\" stroke-width=\"1.7\" stroke-linecap=\"round\"/>\n  <path d=\"M12 16L12 16.5\" stroke=\"%s\" stroke-width=\"1.7\" stroke-linecap=\"round\"/>\n</svg>\n"
slot_0_32_0 = nil
slot_0_33_0 = velocity_pos or {
	w = 133,
	h = 37
}
slot_0_34_0 = limit_lines_alpha_velocity or 0
slot_0_35_0 = {}
slot_0_36_0 = {}
slot_0_37_0 = 10
slot_0_38_0 = 0.15
slot_0_39_0 = 3
slot_0_33_0 = slot_0_33_0 or {}
slot_0_40_0 = render.screen_size()
slot_0_33_0.w = 150
slot_0_33_0.h = 30
slot_0_33_0.x = slot_0_40_0.x / 2 - slot_0_33_0.w / 2
slot_0_33_0.y = db.velocity_pos_y or slot_0_40_0.y / 2 - 100

function rgb_to_hex(arg_85_0)
	if not arg_85_0 then
		return "#FFFFFF"
	end

	local var_85_0 = math.floor(math.max(0, math.min(255, arg_85_0.r or 0)))
	local var_85_1 = math.floor(math.max(0, math.min(255, arg_85_0.g or 0)))
	local var_85_2 = math.floor(math.max(0, math.min(255, arg_85_0.b or 0)))

	return string.format("#%02X%02X%02X", var_85_0, var_85_1, var_85_2)
end

function manage_cache(arg_86_0)
	table.insert(slot_0_36_0, arg_86_0)

	if #slot_0_36_0 > slot_0_37_0 then
		local var_86_0 = table.remove(slot_0_36_0, 1)

		slot_0_30_0.texture_cache[var_86_0] = nil
	end
end

function velocity()
	slot_87_0_0 = entity.get_local_player()

	if not slot_87_0_0 or not slot_87_0_0:is_alive() then
		return
	end

	slot_87_1_0 = slot_87_0_0.m_flVelocityModifier or 1
	slot_87_2_0 = slot_87_1_0 < 1 or math.abs(slot_87_1_0 - (last_slowdown or 1)) > 0.01
	last_slowdown = slot_87_1_0
	slot_87_3_0 = slot_0_28_0.misc.indicators:get()
	slot_87_4_0 = slot_0_28_0.misc.indicators.velocity_enable:get()
	slot_87_5_0 = ui.get_alpha() > 0

	if not slot_87_3_0 or not slot_87_4_0 then
		target_alpha = 0
	elseif slot_87_5_0 then
		target_alpha = 255
	else
		target_alpha = slot_87_2_0 and 255 or 0
	end

	current_alpha = lerp(current_alpha or 0, target_alpha, math.min(1, (globals.curtime - (last_frame_time or 0)) * 10))

	if current_alpha < 1 then
		return
	end

	current_slowdown = current_slowdown or slot_87_1_0
	slot_87_6_0 = string.format("%d%%", math.floor(current_slowdown * 100 + 0.5))
	slot_87_7_0 = globals.curtime
	current_slowdown = lerp(current_slowdown, slot_87_1_0, math.min(1, (slot_87_7_0 - (last_frame_time or 0)) * 10))
	last_frame_time = slot_87_7_0

	if not slot_87_0_0:is_alive() then
		target_alpha = 0
	end

	slot_0_32_0 = draggable({
		slot_0_33_0
	}, {
		lock_x = true,
		use_backdrop = true
	}, slot_0_32_0, "velocity_indicator")

	if slot_0_32_0 then
		slot_0_33_0.y = slot_0_32_0.item.y
	end

	slot_87_8_0 = slot_0_33_0.x
	slot_87_9_0 = slot_0_33_0.y
	slot_87_10_0 = slot_0_33_0.w
	slot_87_11_0 = slot_0_33_0.h
	slot_87_12_0 = common.is_button_down(1)
	slot_87_13_0 = slot_0_32_0 and slot_87_12_0
	slot_87_14_0 = slot_87_13_0 and 255 or 0
	slot_0_34_0 = lerp(slot_0_34_0, slot_87_14_0, 0.02)

	if slot_0_34_0 > 1 and (slot_87_5_0 or slot_87_13_0) then
		slot_87_15_1 = color(128, 128, 128, math.floor(slot_0_34_0))
		slot_87_16_1 = slot_87_8_0 + slot_87_10_0 / 2

		render.line(vector(slot_87_16_1, 0), vector(slot_87_16_1, slot_0_40_0.y), slot_87_15_1)
	end

	if slot_0_22_0 and slot_0_22_0 > 1 then
		render.rect(vector(0, 0), vector(slot_0_40_0.x, slot_0_40_0.y), color(0, 0, 0, math.floor(slot_0_22_0)))
	end

	slot_87_15_0 = slot_0_28_0.misc.indicators.velocity_color:get()
	slot_87_16_0 = (not last_bar_color_obj or last_bar_color_obj.r ~= slot_87_15_0.r or last_bar_color_obj.g ~= slot_87_15_0.g or last_bar_color_obj.b ~= slot_87_15_0.b) and rgb_to_hex(slot_87_15_0) or last_color
	last_bar_color_obj = slot_87_15_0
	last_color = slot_87_16_0

	if not slot_0_35_0[slot_87_16_0] and slot_87_7_0 - (last_texture_update_time or 0) >= slot_0_38_0 then
		slot_87_17_1 = string.format(slot_0_31_0, slot_87_16_0, slot_87_16_0, slot_87_16_0)
		slot_87_18_1 = render.load_image(slot_87_17_1, vector(19, 19))

		if slot_87_18_1 then
			slot_0_35_0[slot_87_16_0] = slot_87_18_1

			manage_cache(slot_87_16_0)

			last_texture_update_time = slot_87_7_0
		end
	end

	icon = slot_0_35_0[slot_87_16_0] or icon

	render.rect(vector(slot_87_8_0, slot_87_9_0), vector(slot_87_8_0 + slot_87_10_0, slot_87_9_0 + slot_87_11_0), color(25, 25, 25, 200 * current_alpha / 255), 8)

	slot_87_17_0 = 19
	slot_87_18_0 = slot_87_8_0 + 6
	slot_87_19_0 = slot_87_9_0 + slot_87_11_0 / 2 - slot_87_17_0 / 2

	if icon then
		render.texture(icon, vector(slot_87_18_0 + 1.5, slot_87_19_0), vector(slot_87_17_0, slot_87_17_0), color(255, 255, 255, current_alpha))
	end

	slot_87_20_0 = slot_87_18_0 + slot_87_17_0 + 8
	slot_87_21_0 = slot_87_9_0 + 9

	render.text(1, vector(slot_87_20_0 + 77, slot_87_21_0 - 4.5), color(255, 255, 255, 220 * current_alpha / 255), nil, slot_87_6_0)

	slot_87_22_0 = "slowed"
	slot_87_23_0 = render.measure_text(1, nil, slot_87_22_0)

	render.text(1, vector(slot_87_8_0 + slot_87_10_0 - slot_87_23_0.x - 68, slot_87_21_0 - 4.5), color(255, 255, 255, 220 * current_alpha / 255), nil, slot_87_22_0)
	render.rect(vector(slot_87_20_0, slot_87_9_0 + 6), vector(slot_87_20_0 + 1, slot_87_9_0 + slot_87_11_0 - 6), color(100, 100, 100, 180 * current_alpha / 255), 1)

	slot_87_24_0 = (slot_87_10_0 - 18) * 0.66
	slot_87_25_0 = 4
	slot_87_26_0 = 1
	slot_87_27_0 = slot_87_8_0 + (slot_87_10_0 - slot_87_24_0) / 2 + 17.5
	slot_87_28_0 = slot_87_9_0 + slot_87_11_0 / 2 + 2

	render.rect(vector(slot_87_27_0, slot_87_28_0), vector(slot_87_27_0 + slot_87_24_0, slot_87_28_0 + slot_87_25_0), color(60, 60, 60, 255 * current_alpha / 255), slot_87_26_0)
	render.rect(vector(slot_87_27_0, slot_87_28_0), vector(slot_87_27_0 + slot_87_24_0 * current_slowdown, slot_87_28_0 + slot_87_25_0), color(slot_87_15_0.r, slot_87_15_0.g, slot_87_15_0.b, current_alpha), slot_87_26_0)
end

function crosshair()
	slot_88_0_0 = entity.get_local_player()

	if not slot_88_0_0 or not slot_88_0_0:is_alive() then
		return
	end

	slot_88_1_0 = render.screen_size()
	slot_88_2_0 = slot_88_1_0.x / 2
	slot_88_3_0 = slot_88_1_0.y / 2
	slot_88_4_0 = 0.1
	slot_88_5_0 = 0.04
	slot_88_6_0 = 8
	slot_88_7_0 = 4
	slot_88_8_0 = ui.get_alpha() > 0
	slot_88_9_0 = slot_0_28_0.misc.indicators:get()
	slot_88_10_0 = slot_0_28_0.misc.indicators.crosshair_enable:get()
	slot_88_11_0 = slot_88_9_0 and slot_88_10_0
	slot_88_12_0 = nil
	slot_88_13_0 = nil
	slot_88_14_1 = nil

	if slot_88_11_0 then
		slot_88_15_1 = slot_0_28_0.misc.indicators.crosshair_style:get()

		if slot_88_15_1 == 1 then
			slot_88_12_0 = 4
			slot_88_13_0 = 2
			slot_88_14_0 = "stellar"
		elseif slot_88_15_1 == 2 then
			slot_88_12_0 = 2
			slot_88_13_0 = 2
			slot_88_14_0 = "STELLAR"
		else
			slot_88_12_0 = 4
			slot_88_13_0 = 2
			slot_88_14_0 = "stellar"
		end
	else
		slot_88_12_0 = 4
		slot_88_13_0 = 2
		slot_88_14_0 = ""
	end

	slot_88_15_0 = {
		DT = slot_0_23_0.doubletap:get(),
		HS = slot_0_23_0.hide_shots:get(),
		FA = slot_0_23_0.fake_duck:get(),
		BODY = slot_0_23_0.body_aim:get() == "Force",
		SAFE = slot_0_23_0.safe_points:get() == "Force",
		FS = slot_0_23_0.freestanding:get()
	}
	slot_88_16_0 = entity.get_local_player()
	slot_88_17_0 = slot_88_16_0 and slot_88_16_0.m_bIsScoped or false
	slot_88_18_0 = slot_88_3_0 - 100
	slot_88_19_0 = slot_88_3_0 + 100

	if not slot_0_30_0.crosshair_pos_initialized then
		slot_0_30_0.indicator_panel.y = db.crosshair_pos_y or slot_88_3_0
		slot_0_30_0.crosshair_pos_initialized = true
	end

	if slot_88_8_0 then
		slot_0_30_0.dragging_context_crosshair = draggable({
			slot_0_30_0.indicator_panel
		}, {
			lock_x = true,
			use_backdrop = true,
			min_y = slot_88_18_0,
			max_y = slot_88_19_0
		}, slot_0_30_0.dragging_context_crosshair, "crosshair_indicator")
	else
		slot_0_30_0.dragging_context_crosshair = nil
	end

	slot_88_20_0 = slot_0_30_0.dragging_context_crosshair and common.is_button_down(1)
	slot_88_21_0 = slot_88_20_0 and 255 or 0
	slot_0_30_0.limit_lines_alpha = lerp(slot_0_30_0.limit_lines_alpha, slot_88_21_0, 0.02)
	slot_88_22_0 = render.measure_text(slot_88_12_0, nil, slot_88_14_0)
	slot_88_23_0 = slot_88_17_0 and slot_88_2_0 + 35 or slot_88_2_0 - slot_88_22_0.x / 2
	slot_0_30_0.indicator_panel.x = slot_0_30_0.title_state.x - 10
	slot_0_30_0.indicator_panel.w = slot_88_22_0.x + 20
	slot_88_24_0 = slot_88_22_0.y
	slot_88_25_0 = 0

	for iter_88_0, iter_88_1 in pairs(slot_88_15_0) do
		slot_88_31_1 = slot_0_30_0.indicators_state[iter_88_0]
		slot_88_31_1.a = lerp(slot_88_31_1.a, iter_88_1 and 1 or 0, slot_88_4_0)

		if slot_88_31_1.a > 0.01 then
			slot_88_25_0 = slot_88_25_0 + 1
		end
	end

	if slot_88_25_0 > 0 then
		slot_88_24_0 = slot_88_24_0 + slot_88_25_0 * slot_88_6_0 - (slot_88_6_0 - slot_88_22_0.y / 2)
	end

	slot_88_26_0 = slot_88_7_0 + 3
	slot_88_27_0 = slot_88_24_0 + slot_88_7_0 + slot_88_26_0
	slot_0_30_0.title_state.animated_h = lerp(slot_0_30_0.title_state.animated_h, slot_88_27_0, slot_88_5_0)

	if math.abs(slot_88_27_0 - slot_0_30_0.title_state.animated_h) < 0.1 then
		slot_0_30_0.title_state.animated_h = slot_88_27_0
	end

	slot_88_28_0 = vector(slot_0_30_0.indicator_panel.x, slot_0_30_0.indicator_panel.y)
	slot_88_29_0 = vector(slot_0_30_0.indicator_panel.x + slot_0_30_0.indicator_panel.w, slot_0_30_0.indicator_panel.y + slot_0_30_0.title_state.animated_h)

	if slot_88_8_0 then
		render.rect(slot_88_28_0, slot_88_29_0, color(255, 255, 255, 10), 5)
	end

	if slot_88_11_0 and (not slot_0_20_0 or slot_0_20_0 == "crosshair_indicator") then
		if not slot_0_30_0.was_active then
			slot_0_30_0.title_state.x = slot_88_23_0
		else
			slot_0_30_0.title_state.x = lerp(slot_0_30_0.title_state.x, slot_88_23_0, slot_88_5_0)
		end

		if math.abs(slot_88_23_0 - slot_0_30_0.title_state.x) < 0.1 then
			slot_0_30_0.title_state.x = slot_88_23_0
		end

		if slot_0_30_0.limit_lines_alpha > 1 and (slot_88_8_0 or slot_88_20_0) then
			slot_88_30_1 = color(128, 128, 128, math.floor(slot_0_30_0.limit_lines_alpha))

			render.line(vector(slot_88_2_0, slot_88_18_0), vector(slot_88_2_0, slot_88_28_0.y), slot_88_30_1)
			render.line(vector(slot_88_2_0, slot_88_29_0.y), vector(slot_88_2_0, slot_88_19_0), slot_88_30_1)
		end

		slot_88_30_0 = slot_0_28_0.misc.indicators.crosshair_color:get()

		render.text(slot_88_12_0, vector(slot_0_30_0.title_state.x, slot_0_30_0.indicator_panel.y + slot_88_7_0), slot_88_30_0, nil, slot_88_14_0)

		slot_88_31_0 = slot_88_22_0.y + slot_88_7_0 - (slot_88_6_0 - slot_88_22_0.y / 2)

		for iter_88_2, iter_88_3 in pairs(slot_88_15_0) do
			slot_88_37_0 = slot_0_30_0.indicators_state[iter_88_2]

			if slot_88_37_0.a > 0.01 then
				slot_88_38_0 = slot_88_31_0
				slot_88_39_0 = render.measure_text(slot_88_13_0, nil, iter_88_2)
				slot_88_40_0 = slot_88_17_0 and slot_88_2_0 + 35 or slot_88_2_0 - slot_88_39_0.x / 2

				if iter_88_3 and not slot_88_37_0.e then
					slot_88_37_0.y, slot_88_37_0.x = slot_88_38_0, slot_88_40_0
				end

				slot_88_37_0.y = lerp(slot_88_37_0.y, slot_88_38_0, slot_88_5_0)
				slot_88_37_0.x = lerp(slot_88_37_0.x, slot_88_40_0, slot_88_5_0)

				if math.abs(slot_88_38_0 - slot_88_37_0.y) < 0.1 then
					slot_88_37_0.y = slot_88_38_0
				end

				if math.abs(slot_88_40_0 - slot_88_37_0.x) < 0.1 then
					slot_88_37_0.x = slot_88_40_0
				end

				slot_88_37_0.e = iter_88_3

				render.text(slot_88_13_0, vector(slot_88_37_0.x, slot_0_30_0.indicator_panel.y + slot_88_37_0.y), color(255, 255, 255, math.floor(slot_88_37_0.a * 255)), nil, iter_88_2)

				slot_88_31_0 = slot_88_31_0 + slot_88_6_0
			else
				slot_88_37_0.e = false
			end
		end

		slot_0_30_0.indicator_panel.h = slot_0_30_0.title_state.animated_h
	else
		for iter_88_4, iter_88_5 in pairs(slot_0_30_0.indicators_state) do
			iter_88_5.a, iter_88_5.y, iter_88_5.e = 0, 0, false
		end

		slot_0_30_0.title_state.animated_h = 0
	end

	slot_0_30_0.was_active = slot_88_11_0
end

function damage()
	slot_89_0_0 = entity.get_local_player()

	if not slot_89_0_0 or not slot_89_0_0:is_alive() or not slot_0_28_0.misc.indicators:get() or not slot_0_28_0.misc.indicators.damage_enable:get() then
		slot_0_30_0.lerped_alpha = slot_0_30_0.lerped_alpha or 0
		slot_0_30_0.lerped_alpha = lerp(slot_0_30_0.lerped_alpha, 0, slot_0_30_0.fade_speed)

		return
	end

	slot_89_1_0 = ui.get_alpha() > 0
	slot_89_2_0 = render.screen_size()
	slot_0_30_0.mi.boundary_box.x = slot_89_2_0.x / 2 - slot_0_30_0.mi.boundary_box.w / 2
	slot_0_30_0.mi.boundary_box.y = slot_89_2_0.y / 2 - slot_0_30_0.mi.boundary_box.h / 2
	slot_89_3_0 = slot_0_28_0.misc.indicators.damage_mode:get()
	slot_89_4_2 = 0
	slot_89_5_0 = false
	slot_0_30_0.lerped_dmg_value = slot_0_30_0.lerped_dmg_value or 0

	if slot_89_3_0 == 1 then
		slot_89_4_1 = slot_0_23_0.minimum_damage:get()
		slot_89_5_0 = slot_89_4_1 > 0
		slot_0_30_0.lerped_dmg_value = slot_89_4_1
	elseif slot_89_3_0 == 2 then
		slot_89_6_1, slot_89_7_1 = unpack(get_bind("Min. Damage"))

		if slot_89_6_1 and slot_89_7_1 > 0 then
			slot_89_4_0 = slot_89_7_1
			slot_89_5_0 = true
			slot_0_30_0.lerped_dmg_value = lerp(slot_0_30_0.lerped_dmg_value, slot_89_4_0, slot_0_30_0.lerp_speed)
		end
	end

	slot_0_30_0.lerped_alpha = slot_0_30_0.lerped_alpha or 0
	slot_0_30_0.lerped_alpha = lerp(slot_0_30_0.lerped_alpha, slot_89_5_0 and 1 or 0, slot_0_30_0.fade_speed)

	if slot_0_30_0.lerped_alpha < 0.01 or not slot_89_5_0 then
		return
	end

	slot_89_6_0 = 1

	if slot_0_28_0.misc.indicators.damage_font:get() == "Pixel" then
		slot_89_6_0 = 2
	elseif slot_0_28_0.misc.indicators.damage_font:get() == "Default" then
		slot_89_6_0 = 1
	end

	slot_89_7_0 = tostring(math.floor(slot_0_30_0.lerped_dmg_value + 0.5))
	slot_89_8_0 = render.measure_text(slot_89_6_0, nil, slot_89_7_0)
	slot_0_30_0.mi.damage_pos.w = slot_89_8_0.x

	if not slot_0_30_0.mi.damage_pos_initialized then
		slot_0_30_0.mi.damage_pos.x = db.damage_pos_x or slot_89_2_0.x / 2 - slot_89_8_0.x / 2 + 10
		slot_0_30_0.mi.damage_pos.y = db.damage_pos_y or slot_89_2_0.y / 2 - slot_89_8_0.y / 2 - 9
		slot_0_30_0.mi.damage_pos_initialized = true
	end

	slot_89_9_0 = 5

	if slot_89_1_0 then
		slot_0_30_0.dragging_context_damage = draggable({
			indicator = slot_0_30_0.mi.damage_pos
		}, {
			use_backdrop = true,
			min_x = slot_0_30_0.mi.boundary_box.x + slot_89_9_0,
			max_x = slot_0_30_0.mi.boundary_box.x + slot_0_30_0.mi.boundary_box.w - slot_89_9_0 - slot_0_30_0.mi.damage_pos.w,
			min_y = slot_0_30_0.mi.boundary_box.y + slot_89_9_0,
			max_y = slot_0_30_0.mi.boundary_box.y + slot_0_30_0.mi.boundary_box.h - slot_89_9_0 - slot_0_30_0.mi.damage_pos.h
		}, slot_0_30_0.dragging_context_damage, "damage_indicator")
	end

	if slot_0_30_0.dragging_context_damage then
		render.rect(vector(slot_0_30_0.mi.boundary_box.x, slot_0_30_0.mi.boundary_box.y), vector(slot_0_30_0.mi.boundary_box.x + slot_0_30_0.mi.boundary_box.w, slot_0_30_0.mi.boundary_box.y + slot_0_30_0.mi.boundary_box.h), color(255, 255, 255, 10), 5)
	end

	slot_89_10_0 = math.floor(slot_0_30_0.lerped_alpha * 255)

	render.text(slot_89_6_0, vector(slot_0_30_0.mi.damage_pos.x, slot_0_30_0.mi.damage_pos.y), color(255, 255, 255, slot_89_10_0), nil, slot_89_7_0)
end

slot_0_41_0 = {
	radius = 0,
	scope = 0,
	alpha = 0
}

function scope()
	local var_90_0 = entity.get_local_player()
	local var_90_1 = slot_0_28_0.misc.scope_overlay:get()

	if not slot_0_28_0.misc.indicators:get() or not var_90_1 or not var_90_0 or not var_90_0:is_alive() then
		slot_0_23_0.scope_overlay:override()

		slot_0_41_0.scope = lerp(slot_0_41_0.scope, 0, 0.1)

		return
	end

	slot_0_23_0.scope_overlay:override("Remove All")

	slot_0_41_0.scope = lerp(slot_0_41_0.scope, var_90_0.m_bIsScoped and 1 or 0, 0.1)

	if slot_0_41_0.scope <= 0.01 then
		return
	end

	local var_90_2 = slot_0_28_0.misc.scope_overlay.scope_color:get()
	local var_90_3 = math.floor(var_90_2.a * slot_0_41_0.scope)
	local var_90_4 = color(var_90_2.r, var_90_2.g, var_90_2.b, var_90_3)
	local var_90_5 = color(var_90_2.r, var_90_2.g, var_90_2.b, 0)
	local var_90_6 = slot_0_28_0.misc.scope_overlay.scope_position:get() * slot_0_41_0.scope
	local var_90_7 = slot_0_28_0.misc.scope_overlay.scope_offset:get()
	local var_90_8 = render.screen_size().x
	local var_90_9 = render.screen_size().y
	local var_90_10 = var_90_8 / 2
	local var_90_11 = var_90_9 / 2
	local var_90_12 = 0.5

	render.gradient(vector(var_90_10 - var_90_12, var_90_11 - var_90_7), vector(var_90_10 + var_90_12, var_90_11 - var_90_7 - var_90_6), var_90_4, var_90_4, var_90_5, var_90_5)
	render.gradient(vector(var_90_10 - var_90_12, var_90_11 + var_90_7), vector(var_90_10 + var_90_12, var_90_11 + var_90_7 + var_90_6), var_90_4, var_90_4, var_90_5, var_90_5)
	render.gradient(vector(var_90_10 - var_90_7, var_90_11 - var_90_12), vector(var_90_10 - var_90_7 - var_90_6, var_90_11 + var_90_12), var_90_4, var_90_5, var_90_4, var_90_5)
	render.gradient(vector(var_90_10 + var_90_7, var_90_11 - var_90_12), vector(var_90_10 + var_90_7 + var_90_6, var_90_11 + var_90_12), var_90_4, var_90_5, var_90_4, var_90_5)
end

slot_0_42_0 = {
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
slot_0_43_0 = {}
slot_0_44_0 = 5
slot_0_45_0 = 5
slot_0_46_0 = render.load_font("Verdana", 12, "b")

function slot_0_47_0(arg_91_0, arg_91_1, arg_91_2, arg_91_3, arg_91_4)
	if #slot_0_43_0 >= slot_0_45_0 then
		table.remove(slot_0_43_0, 1)
	end

	table.insert(slot_0_43_0, {
		anim_y = 0,
		alpha = 0,
		type = arg_91_0,
		name = arg_91_1,
		group = arg_91_2,
		damage_or_reason = arg_91_3,
		colors = arg_91_4,
		time = globals.realtime + slot_0_44_0,
		created = globals.realtime
	})
end

function slot_0_48_0(arg_92_0, arg_92_1)
	if type(arg_92_0) ~= "table" then
		arg_92_0 = {
			arg_92_0
		}
	end

	for iter_92_0, iter_92_1 in ipairs(arg_92_0) do
		if iter_92_1 == arg_92_1 then
			return true
		end
	end

	return false
end

events.aim_ack:set(function(arg_93_0)
	if not slot_0_28_0.misc.aimbot_logs:get() then
		return
	end

	local var_93_0 = slot_0_28_0.misc.aimbot_logs.aimbot_type:get()

	if not slot_0_48_0(var_93_0, 2) and not slot_0_48_0(var_93_0, 1) and not slot_0_48_0(var_93_0, 3) then
		return
	end

	local var_93_1 = entity.get_local_player()

	if not var_93_1 or not arg_93_0.target or not var_93_1:is_alive() then
		return
	end

	local var_93_2 = var_93_1:get_player_weapon()

	if var_93_2 then
		local var_93_3 = var_93_2:get_weapon_info()

		if var_93_3 and var_93_3.console_name == "weapon_taser" then
			return
		end
	end

	local var_93_4 = entity.get(arg_93_0.target)

	if not var_93_4 then
		return
	end

	local var_93_5 = var_93_4:get_name() or "unknown"
	local var_93_6 = slot_0_42_0[arg_93_0.wanted_hitgroup] or "no hitbox"
	local var_93_7 = arg_93_0.backtrack or 0
	local var_93_8 = arg_93_0.hitchance or 0
	local var_93_9 = arg_93_0.damage or 0
	local var_93_10 = arg_93_0.spread or 0
	local var_93_11 = slot_0_28_0.misc.aimbot_logs.aimbot_hit:get() or {
		r = 255,
		b = 255,
		g = 255,
		a = 255
	}
	local var_93_12 = slot_0_28_0.misc.aimbot_logs.aimbot_miss:get() or {
		r = 255,
		b = 255,
		g = 255,
		a = 255
	}
	local var_93_13 = var_93_9 > 0 and var_93_11 or var_93_12
	local var_93_14 = var_93_9 > 0 and "Hit" or "Miss"
	local var_93_15 = ""

	if var_93_14 == "Miss" then
		var_93_15 = arg_93_0.state == "spread" and "spread" or arg_93_0.state == "prediction error" and "prediction error" or arg_93_0.state == "jitter correction" and "jitter correction" or arg_93_0.state == "correction" and "resolver" or arg_93_0.state == "lagcomp failure" and "fake lag correction" or "unregistered shot"
	end

	local var_93_16

	if var_93_14 == "Hit" then
		var_93_16 = string.format("\a%sstellar \aDEFAULT• \aDEFAULTHit \a%s%s \aDEFAULT～ \aDEFAULTgroup: \a%s%s \aDEFAULT～ \aDEFAULTdamage: \a%s%d \aDEFAULT～ \aDEFAULTbt: \a%s%dt \aDEFAULT～ \aDEFAULThc: \a%s%d", var_93_13:to_hex(), var_93_13:to_hex(), var_93_5, var_93_13:to_hex(), var_93_6, var_93_13:to_hex(), var_93_9, var_93_13:to_hex(), var_93_7, var_93_13:to_hex(), var_93_8)
	else
		var_93_16 = string.format("\a%sstellar \aDEFAULT• \aDEFAULTMiss \a%s%s \aDEFAULT～ \aDEFAULTgroup: \a%s%s \aDEFAULT～ \aDEFAULTreason: \a%s%s \aDEFAULT～ \aDEFAULTbt: \a%s%dt \aDEFAULT～ \aDEFAULThc: \a%s%d \aDEFAULT～ \aDEFAULTspread: \a%s%.1f°", var_93_13:to_hex(), var_93_13:to_hex(), var_93_5, var_93_13:to_hex(), var_93_6, var_93_13:to_hex(), var_93_15, var_93_13:to_hex(), var_93_7, var_93_13:to_hex(), var_93_8, var_93_13:to_hex(), var_93_10)
	end

	if slot_0_48_0(var_93_0, 1) then
		print_raw(var_93_16)
	end

	if slot_0_48_0(var_93_0, 3) then
		print_dev(var_93_16)
	end

	if slot_0_48_0(var_93_0, 2) then
		if var_93_14 == "Hit" then
			slot_0_47_0("Hit", var_93_5, var_93_6, var_93_9, {
				var_93_11,
				var_93_11,
				var_93_11
			})
		else
			slot_0_47_0("Miss", var_93_5, var_93_6, var_93_15, {
				var_93_12,
				var_93_12,
				var_93_12
			})
		end
	end
end)
events.player_hurt:set(function(arg_94_0)
	if not slot_0_28_0.misc.aimbot_logs:get() then
		return
	end

	local var_94_0 = slot_0_28_0.misc.aimbot_logs.aimbot_type:get()

	if not slot_0_48_0(var_94_0, 2) and not slot_0_48_0(var_94_0, 1) and not slot_0_48_0(var_94_0, 3) then
		return
	end

	local var_94_1 = entity.get_local_player()
	local var_94_2 = entity.get(arg_94_0.attacker, true)
	local var_94_3 = entity.get(arg_94_0.userid, true)

	if not var_94_2 or not var_94_3 or var_94_2 ~= var_94_1 then
		return
	end

	local var_94_4 = arg_94_0.weapon
	local var_94_5

	if var_94_4 == "hegrenade" then
		var_94_5 = "Naded"
	elseif var_94_4 == "inferno" then
		var_94_5 = "Burned"
	elseif var_94_4 == "knife" then
		var_94_5 = arg_94_0.health == 0 and "Knifed" or "Knife"
	elseif var_94_4 == "taser" or var_94_4 == "zeus" or var_94_4 == "weapon_taser" then
		var_94_5 = "Zeused"
	else
		return
	end

	local var_94_6 = slot_0_28_0.misc.aimbot_logs.aimbot_hurt:get() or {
		r = 255,
		b = 255,
		g = 255,
		a = 255
	}
	local var_94_7 = arg_94_0.dmg_health or 0
	local var_94_8

	if var_94_5 == "Knifed" or var_94_5 == "Zeused" then
		var_94_8 = string.format("\a%sstellar \aDEFAULT• %s \a%s%s", var_94_6:to_hex(), var_94_5, var_94_6:to_hex(), var_94_3:get_name())
	else
		var_94_8 = string.format("\a%sstellar \aDEFAULT• %s \a%s%s \aDEFAULT～ \aDEFAULTdamage: \a%s%d", var_94_6:to_hex(), var_94_5, var_94_6:to_hex(), var_94_3:get_name(), var_94_6:to_hex(), var_94_7)
	end

	if slot_0_48_0(var_94_0, 1) then
		print_raw(var_94_8)
	end

	if slot_0_48_0(var_94_0, 3) then
		print_dev(var_94_8)
	end

	if slot_0_48_0(var_94_0, 2) then
		slot_0_47_0(var_94_5, var_94_3:get_name(), "", var_94_7, {
			var_94_6,
			var_94_6,
			var_94_6
		})
	end
end)

slot_0_49_0 = {
	{
		name = "player",
		type = "Hit",
		group = "head",
		damage_or_reason = 100
	},
	{
		name = "player",
		type = "Miss",
		group = "head",
		damage_or_reason = "spread"
	},
	{
		name = "player",
		type = "Burned",
		group = "",
		damage_or_reason = 10
	}
}
slot_0_50_0 = false

for iter_0_1 = 1, #slot_0_49_0 do
	slot_0_49_0[iter_0_1].alpha = 0
	slot_0_49_0[iter_0_1].anim_y = 0
end

slot_0_51_0 = {
	x = 0,
	h = 0,
	w = 0,
	y = db.logs_pos_y or 500
}
slot_0_52_0 = nil
slot_0_53_0 = 0

events.render:set(function()
	slot_95_0_0 = ui.get_alpha() > 0

	if not slot_0_28_0.misc.aimbot_logs:get() then
		return
	end

	slot_95_1_0 = slot_0_28_0.misc.aimbot_logs.aimbot_type:get()

	if not slot_0_48_0(slot_95_1_0, 2) then
		return
	end

	slot_95_2_0 = 1
	slot_95_3_0 = render.screen_size()

	if not slot_95_3_0 then
		return
	end

	slot_95_4_0 = slot_95_3_0.x
	slot_95_5_0 = slot_95_3_0.y

	if db.logs_pos_y == nil then
		db.logs_pos_y = slot_95_5_0 / 2 + 150
	end

	slot_0_51_0.y = db.logs_pos_y
	slot_95_6_0 = slot_95_4_0 / 2
	slot_95_7_0 = slot_0_51_0.y
	slot_95_8_0 = 24
	slot_95_9_0 = 6
	slot_95_10_0 = color(255, 255, 255)
	slot_95_12_0 = #(slot_95_0_0 and slot_0_49_0 or slot_0_43_0) * slot_95_8_0

	if slot_95_12_0 == 0 then
		slot_95_12_0 = slot_95_8_0 * 3
	end

	slot_0_51_0.x = slot_95_6_0 - 150
	slot_0_51_0.w = 300
	slot_0_51_0.h = slot_95_12_0
	slot_0_52_0 = draggable({
		main = slot_0_51_0
	}, {
		lock_x = true,
		min_y = 20,
		max_y = slot_95_5_0 - slot_95_12_0 - 20
	}, slot_0_52_0, "logs_indicator")

	if slot_0_52_0 then
		slot_0_51_0.y = slot_0_52_0.item.y
		db.logs_pos_y = slot_0_52_0.item.y
	end

	slot_95_13_0 = slot_0_52_0 and 100 or 0
	slot_0_19_0 = lerp(slot_0_19_0, slot_95_13_0, globals.frametime * 10)

	if slot_0_19_0 > 1 then
		render.line(vector(slot_95_6_0, 0), vector(slot_95_6_0, slot_95_5_0), color(180, 180, 180, slot_0_19_0))
	end

	slot_95_14_0 = slot_0_52_0 and 100 or 0
	slot_0_53_0 = lerp(slot_0_53_0, slot_95_14_0, 0.02)

	if slot_0_53_0 > 1 then
		slot_95_15_2 = render.rect
		slot_95_16_1 = vector(0, 0)
		slot_95_17_0 = vector(slot_95_4_0, slot_95_5_0)
		slot_95_18_0 = color
		slot_95_19_1 = 0
		slot_95_20_3 = 0
		slot_95_21_4 = 0
		slot_95_22_7 = math.floor
		slot_95_23_0 = slot_0_53_0

		slot_95_15_2(slot_95_16_1, slot_95_17_0, slot_95_18_0(slot_95_19_1, slot_95_20_3, slot_95_21_4, slot_95_22_7(slot_95_23_0)))
	end

	slot_95_15_1 = globals.frametime * 8
	slot_95_16_0 = slot_95_0_0 and 1 or 0

	if slot_95_0_0 and not slot_0_50_0 then
		for iter_95_0 = 1, #slot_0_49_0 do
			slot_0_49_0[iter_95_0].anim_y = 0
		end
	end

	for iter_95_1 = 1, #slot_0_49_0 do
		slot_95_21_3 = slot_0_49_0[iter_95_1]
		slot_95_22_6 = lerp
		slot_95_23_0 = slot_95_21_3.alpha
		slot_95_24_0 = slot_95_16_0
		slot_95_25_0 = slot_95_15_1
		slot_95_21_3.alpha = slot_95_22_6(slot_95_23_0, slot_95_24_0, slot_95_25_0)
		slot_95_22_5 = (iter_95_1 - 1) * slot_95_8_0
		slot_95_23_0 = lerp
		slot_95_24_0 = slot_95_21_3.anim_y
		slot_95_25_0 = slot_95_22_5
		slot_95_26_1 = slot_95_15_1
		slot_95_23_0 = slot_95_23_0(slot_95_24_0, slot_95_25_0, slot_95_26_1)
		slot_95_21_3.anim_y = slot_95_23_0
		slot_95_23_0 = slot_95_21_3.alpha
		slot_95_24_0 = 0.01

		if slot_95_23_0 < slot_95_24_0 then
			-- block empty
		else
			slot_95_23_0 = slot_95_21_3.anim_y
			slot_95_23_0 = slot_95_7_0 + slot_95_23_0
			slot_95_24_0 = {}
			slot_95_25_0 = 0
			slot_95_26_1 = 0

			function slot_95_27_1(arg_96_0, arg_96_1)
				local var_96_0 = render.measure_text(slot_95_2_0, "s", arg_96_0)

				table.insert(slot_95_24_0, {
					text = arg_96_0,
					color = arg_96_1,
					width = var_96_0.x
				})

				slot_95_25_0 = slot_95_25_0 + var_96_0.x
				slot_95_26_1 = math.max(slot_95_26_1, var_96_0.y)
			end

			slot_95_28_2 = nil

			if slot_95_21_3.type == "Hit" then
				slot_95_28_2 = slot_0_28_0.misc.aimbot_logs.aimbot_hit:get() or {
					r = 255,
					b = 255,
					g = 255,
					a = 255
				}
			elseif slot_95_21_3.type == "Miss" then
				slot_95_28_2 = slot_0_28_0.misc.aimbot_logs.aimbot_miss:get() or {
					r = 255,
					b = 255,
					g = 255,
					a = 255
				}
			else
				slot_95_28_2 = slot_0_28_0.misc.aimbot_logs.aimbot_hurt:get() or {
					r = 255,
					b = 255,
					g = 255,
					a = 255
				}
			end

			slot_95_28_1 = color(slot_95_28_2.r, slot_95_28_2.g, slot_95_28_2.b, slot_95_28_2.a)
			slot_95_29_1 = " ～ "

			if slot_95_21_3.type == "Hit" then
				slot_95_27_1("Hit ", slot_95_10_0)
				slot_95_27_1(slot_95_21_3.name, slot_95_28_1)
				slot_95_27_1(slot_95_29_1 .. "group: ", slot_95_10_0)
				slot_95_27_1(slot_95_21_3.group, slot_95_28_1)
				slot_95_27_1(slot_95_29_1 .. "damage: ", slot_95_10_0)
				slot_95_27_1(tostring(slot_95_21_3.damage_or_reason), slot_95_28_1)
			elseif slot_95_21_3.type == "Miss" then
				slot_95_27_1("Miss ", slot_95_10_0)
				slot_95_27_1(slot_95_21_3.name, slot_95_28_1)
				slot_95_27_1(slot_95_29_1 .. "group: ", slot_95_10_0)
				slot_95_27_1(slot_95_21_3.group, slot_95_28_1)
				slot_95_27_1(slot_95_29_1 .. "reason: ", slot_95_10_0)
				slot_95_27_1(slot_95_21_3.damage_or_reason, slot_95_28_1)
			else
				slot_95_27_1(slot_95_21_3.type .. " ", slot_95_10_0)
				slot_95_27_1(slot_95_21_3.name, slot_95_28_1)

				if slot_95_21_3.damage_or_reason and slot_95_21_3.type ~= "Knifed" and slot_95_21_3.type ~= "Zeused" then
					slot_95_27_1(slot_95_29_1 .. "damage: ", slot_95_10_0)
					slot_95_27_1(tostring(slot_95_21_3.damage_or_reason), slot_95_28_1)
				end
			end

			slot_95_30_1 = slot_95_25_0 + slot_95_9_0 * 2
			slot_95_31_1 = color(0, 0, 0, math.floor(150 * slot_95_21_3.alpha))
			slot_95_32_1 = slot_95_6_0 - slot_95_30_1 / 2
			slot_95_33_1 = slot_95_6_0 + slot_95_30_1 / 2

			render.rect(vector(slot_95_32_1, slot_95_23_0), vector(slot_95_33_1, slot_95_23_0 + 20), slot_95_31_1, 3)

			slot_95_34_1 = slot_95_6_0 - slot_95_25_0 / 2
			slot_95_35_0 = slot_95_23_0 + (20 - slot_95_26_1) / 2

			for iter_95_2, iter_95_3 in ipairs(slot_95_24_0) do
				slot_95_41_0 = color(iter_95_3.color.r, iter_95_3.color.g, iter_95_3.color.b, 255 * slot_95_21_3.alpha)

				render.text(slot_95_2_0, vector(slot_95_34_1, slot_95_35_0), slot_95_41_0, nil, iter_95_3.text)

				slot_95_34_1 = slot_95_34_1 + iter_95_3.width
			end
		end
	end

	if not slot_95_0_0 then
		slot_95_15_0 = 3

		if #slot_0_43_0 == 0 then
			-- block empty
		else
			for iter_95_4 = #slot_0_43_0, 1, -1 do
				slot_95_20_0 = slot_0_43_0[iter_95_4]

				if not slot_95_20_0 then
					-- block empty
				else
					if slot_95_20_0.time then
						slot_95_21_2 = slot_95_20_0.time - globals.realtime

						if slot_95_21_2 <= 0 then
							slot_95_22_4 = table.remove
							slot_95_23_0 = slot_0_43_0
							slot_95_24_0 = iter_95_4

							slot_95_22_4(slot_95_23_0, slot_95_24_0)

							goto label_95_0
						end

						slot_95_22_3 = 0.5

						if slot_95_21_2 < slot_95_22_3 then
							slot_95_23_0 = slot_95_21_2 / slot_95_22_3
							slot_95_20_0.alpha = slot_95_23_0
						else
							slot_95_23_0 = slot_95_20_0.alpha
							slot_95_24_0 = 1

							if slot_95_23_0 < slot_95_24_0 then
								slot_95_23_0 = slot_95_20_0.alpha
								slot_95_24_0 = slot_95_20_0.alpha
								slot_95_24_0 = 1 - slot_95_24_0
								slot_95_24_0 = slot_95_24_0 / slot_95_15_0
								slot_95_23_0 = slot_95_23_0 + slot_95_24_0
								slot_95_20_0.alpha = slot_95_23_0
							end
						end
					else
						slot_95_20_0.alpha = slot_95_20_0.alpha - 1 / slot_95_15_0

						if slot_95_20_0.alpha <= 0 then
							slot_95_21_1 = table.remove
							slot_95_22_2 = slot_0_43_0
							slot_95_23_0 = iter_95_4

							slot_95_21_1(slot_95_22_2, slot_95_23_0)

							goto label_95_0
						end
					end

					slot_95_21_0 = (iter_95_4 - 1) * slot_95_8_0
					slot_95_22_1 = slot_95_20_0.anim_y
					slot_95_23_0 = slot_95_20_0.anim_y
					slot_95_23_0 = slot_95_21_0 - slot_95_23_0
					slot_95_23_0 = slot_95_23_0 / slot_95_15_0
					slot_95_20_0.anim_y = slot_95_22_1 + slot_95_23_0
					slot_95_22_0 = slot_95_7_0 + slot_95_20_0.anim_y
					slot_95_23_0 = {}
					slot_95_24_0 = 0
					slot_95_25_0 = 0

					function slot_95_26_0(arg_97_0, arg_97_1)
						local var_97_0 = render.measure_text(slot_95_2_0, "s", arg_97_0)

						table.insert(slot_95_23_0, {
							text = arg_97_0,
							color = arg_97_1,
							width = var_97_0.x
						})

						slot_95_24_0 = slot_95_24_0 + var_97_0.x
						slot_95_25_0 = math.max(slot_95_25_0, var_97_0.y)
					end

					slot_95_27_0 = color(slot_95_20_0.colors[1].r, slot_95_20_0.colors[1].g, slot_95_20_0.colors[1].b)
					slot_95_28_0 = " ～ "

					if slot_95_20_0.type == "Hit" then
						slot_95_26_0("Hit ", slot_95_10_0)
						slot_95_26_0(slot_95_20_0.name, slot_95_27_0)
						slot_95_26_0(slot_95_28_0 .. "group: ", slot_95_10_0)
						slot_95_26_0(slot_95_20_0.group, slot_95_27_0)
						slot_95_26_0(slot_95_28_0 .. "damage: ", slot_95_10_0)
						slot_95_26_0(tostring(slot_95_20_0.damage_or_reason), slot_95_27_0)
					elseif slot_95_20_0.type == "Miss" then
						slot_95_26_0("Miss ", slot_95_10_0)
						slot_95_26_0(slot_95_20_0.name, slot_95_27_0)
						slot_95_26_0(slot_95_28_0 .. "group: ", slot_95_10_0)
						slot_95_26_0(slot_95_20_0.group, slot_95_27_0)
						slot_95_26_0(slot_95_28_0 .. "reason: ", slot_95_10_0)
						slot_95_26_0(slot_95_20_0.damage_or_reason, slot_95_27_0)
					else
						slot_95_26_0(slot_95_20_0.type .. " ", slot_95_10_0)
						slot_95_26_0(slot_95_20_0.name, slot_95_27_0)

						if slot_95_20_0.damage_or_reason and slot_95_20_0.type ~= "Knifed" and slot_95_20_0.type ~= "Zeused" then
							slot_95_26_0(slot_95_28_0 .. "damage: ", slot_95_10_0)
							slot_95_26_0(tostring(slot_95_20_0.damage_or_reason), slot_95_27_0)
						end
					end

					slot_95_29_0 = slot_95_24_0 + slot_95_9_0 * 2
					slot_95_30_0 = color(0, 0, 0, math.floor(150 * slot_95_20_0.alpha))
					slot_95_31_0 = slot_95_6_0 - slot_95_29_0 / 2
					slot_95_32_0 = slot_95_6_0 + slot_95_29_0 / 2

					render.rect(vector(slot_95_31_0, slot_95_22_0), vector(slot_95_32_0, slot_95_22_0 + 20), slot_95_30_0, 3)

					slot_95_33_0 = slot_95_6_0 - slot_95_24_0 / 2
					slot_95_34_0 = slot_95_22_0 + (20 - slot_95_25_0) / 2

					for iter_95_5, iter_95_6 in ipairs(slot_95_23_0) do
						slot_95_40_0 = color(iter_95_6.color.r, iter_95_6.color.g, iter_95_6.color.b, 255 * slot_95_20_0.alpha)

						render.text(slot_95_2_0, vector(slot_95_33_0, slot_95_34_0), slot_95_40_0, nil, iter_95_6.text)

						slot_95_33_0 = slot_95_33_0 + iter_95_6.width
					end
				end

				::label_95_0::
			end
		end
	end

	slot_0_50_0 = slot_95_0_0
end)

slot_0_54_0 = {
	"SSG-08",
	"AWP",
	"Auto snipers",
	"Revolver"
}
slot_0_55_0 = {}

for iter_0_2, iter_0_3 in ipairs(slot_0_54_0) do
	slot_0_55_0[iter_0_3] = {
		air = 35,
		no_scope = 35,
		enabled = false
	}
end

function hitchance()
	local var_98_0 = entity.get_local_player()

	if not var_98_0 or not var_98_0:is_alive() or not slot_0_28_0.misc.hitchance_override:get() then
		slot_0_23_0.hit_chance:override()

		return
	end

	local var_98_1 = var_98_0:get_player_weapon()

	if not var_98_1 then
		slot_0_23_0.hit_chance:override()

		return
	end

	local var_98_2 = var_98_1:get_weapon_info()

	if not var_98_2 then
		slot_0_23_0.hit_chance:override()

		return
	end

	local var_98_3

	if var_98_2.console_name == "weapon_ssg08" then
		var_98_3 = "SSG-08"
	elseif var_98_2.console_name == "weapon_awp" then
		var_98_3 = "AWP"
	elseif var_98_2.console_name == "weapon_scar20" or var_98_2.console_name == "weapon_g3sg1" then
		var_98_3 = "Auto snipers"
	elseif var_98_2.console_name == "weapon_revolver" then
		var_98_3 = "Revolver"
	else
		slot_0_23_0.hit_chance:override()

		return
	end

	slot_0_6_0.AntiAims.Condition:Update()

	slot_0_55_0["SSG-08"].enabled = slot_0_28_0.misc.hitchance_override.hitchance_enable_scout:get()
	slot_0_55_0.AWP.enabled = slot_0_28_0.misc.hitchance_override.hitchance_enable_awp:get()
	slot_0_55_0["Auto snipers"].enabled = slot_0_28_0.misc.hitchance_override.hitchance_enable_at:get()
	slot_0_55_0.Revolver.enabled = slot_0_28_0.misc.hitchance_override.hitchance_enable_revolver:get()

	if var_98_3 == "SSG-08" then
		slot_0_55_0[var_98_3].air = slot_0_28_0.misc.hitchance_override.scout_hitchance_air:get()
		slot_0_55_0[var_98_3].no_scope = slot_0_28_0.misc.hitchance_override.scout_hitchance_no_scope:get()
	elseif var_98_3 == "AWP" then
		slot_0_55_0[var_98_3].air = slot_0_28_0.misc.hitchance_override.awp_hitchance_air:get()
		slot_0_55_0[var_98_3].no_scope = slot_0_28_0.misc.hitchance_override.awp_hitchance_no_scope:get()
	elseif var_98_3 == "Auto snipers" then
		slot_0_55_0[var_98_3].air = slot_0_28_0.misc.hitchance_override.at_hitchance_air:get()
		slot_0_55_0[var_98_3].no_scope = slot_0_28_0.misc.hitchance_override.at_hitchance_no_scope:get()
	elseif var_98_3 == "Revolver" then
		slot_0_55_0[var_98_3].air = slot_0_28_0.misc.hitchance_override.revolver_hitchance_air:get()
	end

	if not slot_0_55_0[var_98_3] or not slot_0_55_0[var_98_3].enabled then
		slot_0_23_0.hit_chance:override()

		return
	end

	local var_98_4 = var_98_0 and var_98_0.m_bIsScoped or false
	local var_98_5 = slot_0_6_0.AntiAims.Condition:GetDev("Air")
	local var_98_6

	if not var_98_4 then
		local var_98_7 = slot_0_55_0[var_98_3].no_scope

		if var_98_7 > 0 then
			slot_0_23_0.hit_chance:override(var_98_7)

			return
		end
	end

	if var_98_5 then
		local var_98_8 = slot_0_55_0[var_98_3].air

		if var_98_8 > 0 then
			slot_0_23_0.hit_chance:override(var_98_8)

			return
		end
	end

	slot_0_23_0.hit_chance:override()
end

events.createmove:set(function()
	hitchance()
end)

slot_0_56_0 = {
	config = {
		max_steps = 4,
		dmg_max = 100,
		dmg_min = 1,
		trace_h = 18,
		snipers = {
			CWeaponSCAR20 = true,
			CWeaponG3SG1 = true,
			CWeaponAWP = true,
			CWeaponSSG08 = true
		},
		hitboxes_groups = {
			Head = {
				0
			},
			Chest = {
				4,
				5,
				6
			},
			Stomach = {
				2,
				3
			},
			Arms = {
				13,
				14,
				15,
				16,
				17,
				18
			},
			Legs = {
				7,
				8,
				9,
				10
			}
		}
	},
	state = {
		retreat = false,
		exploit = false,
		shooting = false,
		peeking = false,
		target_locked = false,
		moving = false,
		enabled = false,
		debug_alpha_value = 0,
		last_tick = 0,
		active_idx = 0,
		center = vector(),
		points = {},
		visuals = {},
		debug_lines = {},
		tween_pos = {},
		tween_alpha = {},
		alpha_global = slot_0_1_0.new(),
		alpha_debug = slot_0_1_0.new()
	},
	contains = function(arg_100_0, arg_100_1)
		if type(arg_100_0) ~= "table" then
			return false
		end

		for iter_100_0, iter_100_1 in pairs(arg_100_0) do
			if iter_100_1 == arg_100_1 then
				return true
			end
		end

		return false
	end,
	is_enemy = function(arg_101_0)
		return arg_101_0 and arg_101_0:get_classname() == "CCSPlayer" and arg_101_0:is_enemy()
	end,
	angle_to_vec = function(arg_102_0, arg_102_1, arg_102_2)
		local var_102_0 = math.rad(arg_102_2)

		return vector(arg_102_0.x + math.cos(var_102_0) * arg_102_1, arg_102_0.y + math.sin(var_102_0) * arg_102_1, arg_102_0.z)
	end,
	move_cmd = function(arg_103_0, arg_103_1, arg_103_2)
		local var_103_0 = arg_103_2:get_origin():to(arg_103_1):angles().y

		arg_103_0.in_forward = true
		arg_103_0.in_back = false
		arg_103_0.in_moveleft = false
		arg_103_0.in_moveright = false
		arg_103_0.in_speed = false
		arg_103_0.forwardmove = 800
		arg_103_0.sidemove = 0
		arg_103_0.move_yaw = var_103_0
	end
}

function slot_0_56_0.get_hitbox_ids()
	local var_104_0 = slot_0_28_0.misc.automatic_peek.hitboxes:get()
	local var_104_1 = {}

	for iter_104_0, iter_104_1 in pairs(var_104_0) do
		local var_104_2 = slot_0_56_0.config.hitboxes_groups[iter_104_1]

		if var_104_2 then
			for iter_104_2, iter_104_3 in pairs(var_104_2) do
				table.insert(var_104_1, iter_104_3)
			end
		end
	end

	return var_104_1
end

function slot_0_56_0.calc_point(arg_105_0, arg_105_1, arg_105_2, arg_105_3, arg_105_4, arg_105_5, arg_105_6, arg_105_7)
	local var_105_0 = arg_105_5 and vector(arg_105_0.x, arg_105_0.y, arg_105_5.z) - arg_105_1 or arg_105_0
	local var_105_1 = slot_0_56_0.angle_to_vec(var_105_0, arg_105_3 * arg_105_4, arg_105_2)

	if arg_105_4 > 1 then
		var_105_0 = slot_0_56_0.angle_to_vec(var_105_1, -arg_105_3, arg_105_2)
	end

	local var_105_2 = utils.trace_hull(var_105_1, var_105_1 + vector(0, 0, slot_0_56_0.config.trace_h), arg_105_6, arg_105_7, slot_0_56_0.is_enemy, 33636363).end_pos
	local var_105_3 = vector(0, 0, math.min(slot_0_56_0.config.trace_h, math.abs(arg_105_0.z - var_105_2.z)))
	local var_105_4 = utils.trace_hull(var_105_0 + var_105_3, var_105_1 + var_105_3, arg_105_6, arg_105_7, slot_0_56_0.is_enemy, 33636363).end_pos

	if var_105_1:dist2d(var_105_4) > arg_105_3 * 0.95 then
		return false
	elseif arg_105_5 and var_105_1:dist2d(arg_105_5) > arg_105_3 + 0.001 then
		return false
	end

	return utils.trace_hull(var_105_4, vector(var_105_4.x, var_105_4.y, arg_105_0.z - 240), arg_105_6, arg_105_7, slot_0_56_0.is_enemy, 33636363).end_pos + arg_105_1
end

function slot_0_56_0.calc_points(arg_106_0, arg_106_1, arg_106_2, arg_106_3, arg_106_4)
	local var_106_0 = arg_106_0.m_vecViewOffset
	local var_106_1 = arg_106_0.m_vecMins
	local var_106_2 = arg_106_0.m_vecMaxs
	local var_106_3 = {
		[0] = slot_0_56_0.calc_point(arg_106_1, var_106_0, arg_106_2, arg_106_4, 0, nil, var_106_1, var_106_2)
	}

	slot_0_56_0.state.visuals[0] = var_106_3[0]

	for iter_106_0 = 1, 2 do
		for iter_106_1 = 1, arg_106_3 / 2 do
			local var_106_4 = iter_106_0 == 1 and iter_106_1 or iter_106_1 + arg_106_3 / 2
			local var_106_5 = iter_106_0 == 1 and arg_106_2 - 90 or arg_106_2 + 90
			local var_106_6 = var_106_3[var_106_4 == arg_106_3 / 2 + 1 and 0 or var_106_4 - 1]
			local var_106_7 = slot_0_56_0.calc_point(arg_106_1, var_106_0, var_106_5, arg_106_4, iter_106_1, var_106_6, var_106_1, var_106_2)

			if var_106_4 >= 1 and (not var_106_7 or var_106_6 and var_106_7 and slot_0_56_0.config.trace_h < math.abs(var_106_6.z - var_106_7.z)) then
				for iter_106_2 = var_106_4, iter_106_0 == 1 and arg_106_3 / 2 or arg_106_3 do
					var_106_3[iter_106_2] = false
					slot_0_56_0.state.visuals[iter_106_2] = false
				end

				break
			end

			var_106_3[var_106_4] = var_106_7
			slot_0_56_0.state.visuals[var_106_4] = var_106_7
		end
	end

	return var_106_3
end

function slot_0_56_0.find_best(arg_107_0, arg_107_1, arg_107_2, arg_107_3)
	local var_107_0 = arg_107_2.m_iHealth
	local var_107_1 = math.clamp(slot_0_24_0.mindamage:get(), slot_0_56_0.config.dmg_min, slot_0_56_0.config.dmg_max)

	for iter_107_0, iter_107_1 in pairs(arg_107_0) do
		slot_0_56_0.state.debug_lines[iter_107_0] = {}

		if iter_107_1 then
			for iter_107_2, iter_107_3 in pairs(arg_107_3) do
				local var_107_2 = arg_107_2:get_hitbox_position(iter_107_3)

				if var_107_2 then
					local var_107_3, var_107_4 = utils.trace_bullet(arg_107_1, iter_107_1, var_107_2)

					table.insert(slot_0_56_0.state.debug_lines[iter_107_0], {
						iter_107_1,
						var_107_2
					})

					if var_107_3 >= math.min(var_107_1, var_107_0) and var_107_3 > 0 then
						return iter_107_1, iter_107_0
					end
				end
			end
		end
	end

	return nil, 0
end

function slot_0_56_0.can_shoot(arg_108_0, arg_108_1)
	if not arg_108_1 then
		return false
	end

	local var_108_0 = arg_108_0.m_flNextAttack or 0
	local var_108_1 = arg_108_1.m_flNextPrimaryAttack or 0

	return math.max(0, var_108_0, var_108_1) <= globals.curtime and arg_108_1.m_iClip1 > 0
end

function slot_0_56_0.should_engage(arg_109_0, arg_109_1)
	if not arg_109_1 then
		return false
	end

	local var_109_0 = arg_109_0:get_player_weapon()

	if not slot_0_56_0.can_shoot(arg_109_0, var_109_0) or var_109_0.m_fLastShotTime - globals.curtime > 0 then
		return false
	end

	if not slot_0_24_0.autoscope:get() and slot_0_56_0.config.snipers[var_109_0:get_classname()] and not arg_109_0.m_bIsScoped then
		return false
	end

	if slot_0_24_0.doubletap.switch:get() and rage.exploit:get() ~= 1 then
		return false
	end

	if arg_109_0.m_flVelocityModifier ~= 1 or arg_109_1:get_bbox().alpha < 0.45 then
		return false
	end

	return true
end

function slot_0_56_0.handle(arg_110_0)
	if not slot_0_28_0.misc.automatic_peek:get() then
		slot_0_24_0.peek_assist.switch:override()
		slot_0_24_0.peek_assist.autostop:override()
		slot_0_24_0.peek_assist.retreat_mode:override()
		slot_0_24_0.peek_assist.max_distance:override()
		slot_0_24_0.doubletap.fakelag_limit:override()
		slot_0_24_0.doubletap.immediate_teleport:override()
		slot_0_24_0.doubletap.switch:override()
		slot_0_24_0.doubletap.lag_options:override()
		slot_0_24_0.multipoint.head_scale:override()

		slot_0_56_0.state.enabled = false

		return
	end

	slot_0_24_0.doubletap.fakelag_limit:override(1)
	slot_0_24_0.doubletap.immediate_teleport:override(false)
	slot_0_24_0.peek_assist.switch:override(true)
	slot_0_24_0.peek_assist.autostop:override("Early")

	slot_110_1_0 = entity.get_local_player()
	slot_110_2_0 = slot_110_1_0.m_vecVelocity:length2d()
	slot_110_3_0 = bit.band(slot_110_1_0.m_fFlags, 1) ~= 1 or arg_110_0.in_forward or arg_110_0.in_moveleft or arg_110_0.in_moveright or arg_110_0.in_back or arg_110_0.in_jump
	slot_110_4_0 = slot_0_56_0.state.center
	slot_110_5_0 = slot_110_1_0:get_origin()
	slot_110_6_0 = slot_110_4_0:dist2d(slot_110_5_0)

	if not slot_0_56_0.state.target_locked and not slot_0_56_0.state.moving or slot_110_6_0 > 0.05 and slot_110_2_0 < 1.11 and slot_110_2_0 ~= 0 then
		slot_0_56_0.state.center = slot_110_5_0
	end

	slot_110_7_0 = entity.get_threat()
	slot_0_56_0.state.target = slot_110_7_0

	if not slot_110_7_0 then
		slot_0_56_0.state.center = slot_110_5_0

		for iter_110_0 = 0, slot_0_56_0.config.max_steps do
			slot_0_56_0.state.visuals[iter_110_0] = false
			slot_0_56_0.state.debug_lines[iter_110_0] = {}
		end

		slot_0_56_0.state.enabled = false
		slot_0_56_0.state.active_idx = 0
		slot_0_56_0.state.target_locked = false
		slot_0_56_0.state.tracing = false

		return
	end

	slot_110_8_0 = slot_110_7_0 and slot_110_4_0:to(slot_110_7_0:get_origin()):angles().y or render.camera_angles().y
	slot_110_9_0 = slot_0_28_0.misc.automatic_peek.distance:get() or 20
	slot_110_10_0 = slot_0_56_0.calc_points(slot_110_1_0, slot_110_4_0, slot_110_8_0, slot_0_56_0.config.max_steps, slot_110_9_0)
	slot_0_56_0.state.enabled = true
	slot_110_11_0 = nil
	slot_110_12_0 = 0

	if not slot_110_3_0 and slot_0_56_0.should_engage(slot_110_1_0, slot_110_7_0) then
		slot_110_11_0, slot_110_12_0 = slot_0_56_0.find_best(slot_110_10_0, slot_110_1_0, slot_110_7_0, slot_0_56_0.get_hitbox_ids())
		slot_0_56_0.state.tracing = true
	else
		slot_0_56_0.state.tracing = false
	end

	slot_0_56_0.state.target_locked = slot_110_11_0 ~= nil
	slot_0_56_0.state.active_idx = slot_110_12_0

	if slot_0_56_0.state.target_locked then
		slot_0_56_0.move_cmd(arg_110_0, slot_110_11_0, slot_110_1_0)

		slot_0_56_0.state.moving = false
		slot_0_56_0.state.peeking = true
		slot_0_56_0.state.shooting = false
		slot_0_56_0.state.exploit = false
		slot_0_56_0.state.retreat = false
	elseif slot_110_3_0 then
		slot_0_56_0.state.moving = false
		slot_0_56_0.state.peeking = false
		slot_0_56_0.state.shooting = false
		slot_0_56_0.state.exploit = false
		slot_0_56_0.state.retreat = false
	elseif slot_0_56_0.state.peeking then
		slot_0_56_0.state.moving = true
		slot_0_56_0.state.shooting = true
		slot_0_56_0.state.peeking = false
	end

	if not slot_0_56_0.state.moving then
		slot_0_56_0.state.last_tick = globals.tickcount
	end

	if slot_0_56_0.state.moving then
		if slot_110_6_0 < 0.05 then
			slot_0_56_0.state.moving = false
			slot_0_56_0.state.shooting = false
			slot_0_56_0.state.exploit = false
			slot_0_56_0.state.retreat = false
		elseif slot_0_56_0.state.shooting and rage.exploit:get() == 1 and slot_0_56_0.state.last_tick - globals.tickcount <= -7 then
			rage.exploit:force_teleport()

			slot_0_56_0.state.shooting = false
			slot_0_56_0.state.exploit = true
		elseif slot_0_56_0.state.last_tick == globals.tickcount - 1 then
			slot_0_56_0.state.retreat = true
		end
	end

	slot_0_24_0.multipoint.head_scale:override(slot_0_56_0.state.target_locked and 100 or nil)
	slot_0_24_0.peek_assist.retreat_mode:override(slot_0_56_0.state.target_locked and "On Shot" or slot_0_56_0.state.moving and {
		"On Shot",
		"On Key Release"
	} or nil)

	slot_110_13_1 = slot_0_24_0.doubletap.switch
	slot_110_14_0 = slot_110_13_1
	slot_110_13_0 = slot_110_13_1.override

	if slot_0_56_0.state.exploit and rage.exploit:get() ~= 1 then
		-- block empty
	end

	slot_110_13_0(slot_110_14_0, nil)
	slot_0_24_0.doubletap.lag_options:override(slot_0_56_0.state.retreat and "Always On" or "On Peek")
end

function slot_0_56_0.render()
	slot_111_0_0 = entity.get_local_player()

	if not slot_111_0_0 or not slot_111_0_0:is_alive() or not slot_0_24_0.thirdperson_switch:get() or not slot_0_28_0.misc.automatic_peek:get() or not slot_0_28_0.misc.automatic_peek.visualize:get() then
		return
	end

	slot_111_1_0 = slot_0_56_0.state.visuals
	slot_111_2_0 = slot_0_28_0.misc.automatic_peek.visualize_color:get()
	slot_111_3_0 = slot_0_56_0.state.enabled
	slot_111_4_0 = slot_0_56_0.state
	slot_111_5_0 = slot_0_56_0.state.active_idx

	if slot_111_4_0.alpha_global(0.04, slot_111_3_0) <= 0 then
		return
	end

	slot_111_6_0 = slot_0_28_0.misc.automatic_peek.visualize_type:get() or "Lines"

	for iter_111_0 = 0, #slot_111_1_0 do
		slot_111_11_1 = slot_111_1_0[iter_111_0]
		slot_111_12_1 = slot_111_4_0.tween_alpha[iter_111_0](0.04, slot_111_11_1 and slot_111_3_0)

		if slot_111_12_1 > 0 and slot_111_11_1 then
			slot_111_4_0.tween_pos[iter_111_0](slot_111_12_1 > 0.2 and 0.015 or 0, (slot_111_5_0 == iter_111_0 and slot_111_11_1 + vector(0, 0, 1.5) or slot_111_11_1) + vector(0, 0, -26 + 4 * slot_111_12_1))

			slot_111_13_0 = render.world_to_screen(slot_111_4_0.tween_pos[iter_111_0].value)

			if slot_111_13_0 and slot_111_13_0.x ~= 0 then
				slot_111_14_1 = slot_111_5_0 == iter_111_0 and slot_111_2_0 or slot_111_2_0:alpha_modulate(100 + 155 * (slot_111_5_0 == iter_111_0 and 1 or 0) * slot_111_12_1)

				if slot_111_6_0 == "Lines" then
					render.circle(slot_111_13_0, slot_111_14_1, 2.5, 0, 1)
				elseif slot_111_6_0 == "Boxes" then
					slot_111_15_1 = 10
					slot_111_16_2 = slot_111_13_0 - vector(slot_111_15_1 / 2, slot_111_15_1 / 2, 0)
					slot_111_17_2 = slot_111_13_0 + vector(slot_111_15_1 / 2, slot_111_15_1 / 2, 0)

					render.rect(slot_111_16_2, slot_111_17_2, slot_111_14_1, 2)
				end
			end

			if slot_111_6_0 == "Lines" then
				slot_111_14_0 = iter_111_0 == slot_0_56_0.config.max_steps / 2 and 0 or iter_111_0
				slot_111_15_0 = iter_111_0 + 1

				if slot_111_15_0 <= #slot_111_1_0 then
					slot_111_16_1 = slot_111_4_0.tween_alpha[slot_111_15_0].value

					if slot_111_16_1 > 0 then
						slot_111_17_1 = render.world_to_screen(slot_111_4_0.tween_pos[slot_111_14_0].value)
						slot_111_18_1 = render.world_to_screen(slot_111_4_0.tween_pos[slot_111_15_0].value)

						if slot_111_17_1 and slot_111_18_1 and slot_111_17_1.x ~= 0 and slot_111_18_1.x ~= 0 then
							render.line(slot_111_17_1, slot_111_18_1, slot_111_2_0:alpha_modulate(255 * slot_111_16_1))
						end
					end
				end
			end
		end
	end

	slot_0_56_0.state.debug_alpha_value = slot_0_56_0.state.debug_alpha_value or 0
	slot_0_56_0.state.debug_alpha_value = lerp(slot_0_56_0.state.debug_alpha_value, slot_0_56_0.state.tracing and 1 or 0, 0.04)
	slot_111_7_0 = slot_0_56_0.state.debug_alpha_value

	if slot_111_7_0 > 0 then
		for iter_111_1, iter_111_2 in pairs(slot_0_56_0.state.debug_lines) do
			for iter_111_3, iter_111_4 in pairs(iter_111_2) do
				slot_111_18_0 = render.world_to_screen(iter_111_4[1])
				slot_111_19_0 = render.world_to_screen(iter_111_4[2])

				if slot_111_18_0 and slot_111_19_0 then
					render.line(slot_111_18_0, slot_111_19_0, slot_111_2_0:alpha_modulate(25 * slot_111_7_0))
				end
			end
		end
	end
end

function slot_0_56_0.init()
	for iter_112_0 = 0, slot_0_56_0.config.max_steps do
		slot_0_56_0.state.debug_lines[iter_112_0] = {}
		slot_0_56_0.state.visuals[iter_112_0] = false
		slot_0_56_0.state.tween_pos[iter_112_0] = slot_0_1_0.new(vector())
		slot_0_56_0.state.tween_alpha[iter_112_0] = slot_0_1_0.new()
	end
end

slot_0_57_1 = 5
slot_0_58_1 = nil
slot_0_59_1 = nil
slot_0_60_1 = nil
slot_0_61_1 = nil
slot_0_62_1 = nil
slot_0_63_1 = false
slot_0_64_1 = false
slot_0_65_1 = 1
slot_0_66_1 = 0
slot_0_67_1 = {
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
slot_0_68_2 = {
	Stomach = 3,
	Chest = 2,
	Head = 1,
	Legs = 4
}
slot_0_69_2 = {
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

function in_list(arg_113_0, arg_113_1)
	for iter_113_0 = 1, #arg_113_0 do
		if arg_113_0[iter_113_0] == arg_113_1 then
			return true
		end
	end

	return false
end

function is_valid_weapon(arg_114_0)
	return arg_114_0 >= 1 and arg_114_0 <= 6
end

function fetch_targets()
	local var_115_0 = {}
	local var_115_1 = entity.get_player_resource()

	for iter_115_0 = 1, globals.max_players do
		local var_115_2 = entity.get(iter_115_0)

		if var_115_2 and var_115_1.m_bConnected[iter_115_0] and var_115_2:is_enemy() and var_115_2:is_dormant() then
			table.insert(var_115_0, var_115_2)
		end
	end

	return var_115_0
end

function create_aim_points(arg_116_0, arg_116_1, arg_116_2)
	local var_116_0 = arg_116_0:to(arg_116_1):angles()
	local var_116_1 = math.rad(var_116_0.y + 90)
	local var_116_2 = vector(math.cos(var_116_1), math.sin(var_116_1), 0) * arg_116_2

	return {
		{
			text = "Middle",
			vec = arg_116_1
		},
		{
			text = "Left",
			vec = arg_116_1 + var_116_2
		},
		{
			text = "Right",
			vec = arg_116_1 - var_116_2
		}
	}
end

function bullet_trace(arg_117_0, arg_117_1, arg_117_2, arg_117_3)
	local var_117_0, var_117_1 = utils.trace_bullet(arg_117_0, arg_117_1, arg_117_2, arg_117_3)

	if var_117_1 and var_117_1.entity and var_117_1.entity:is_player() and not var_117_1.entity:is_enemy() then
		return 0, var_117_1
	end

	return var_117_0 or 0, var_117_1
end

function process_move(arg_118_0)
	slot_0_23_0.dormant_aimbot:override(false)

	slot_118_1_0 = entity.get_local_player()

	if not slot_118_1_0 then
		return
	end

	slot_118_2_0 = slot_118_1_0:get_player_weapon()

	if not slot_118_2_0 then
		return
	end

	slot_118_3_0 = slot_118_2_0:get_weapon_info()

	if not slot_118_3_0 then
		return
	end

	slot_118_4_0 = slot_118_2_0:get_inaccuracy()

	if not slot_118_4_0 then
		return
	end

	slot_118_5_0 = globals.tickcount
	slot_118_6_0 = slot_118_1_0:get_eye_position()
	slot_118_7_0 = slot_118_1_0:get_simulation_time().current
	slot_118_8_0 = bit.band(slot_118_1_0.m_fFlags, bit.lshift(1, 0)) ~= 0

	if slot_118_5_0 < slot_0_66_1 then
		return
	end

	if arg_118_0.in_jump and not slot_118_8_0 then
		return
	end

	if not is_valid_weapon(slot_118_3_0.weapon_type) or slot_118_2_0.m_iClip1 <= 0 then
		return
	end

	slot_118_9_0 = fetch_targets()
	slot_118_10_0 = slot_0_28_0.misc.dormant_aimbot.hitboxes:get()

	if slot_118_5_0 % #slot_118_9_0 ~= 0 then
		slot_0_65_1 = slot_0_65_1 + 1
	else
		slot_0_65_1 = 1
	end

	slot_118_11_0 = slot_118_9_0[slot_0_65_1]

	if not slot_118_11_0 then
		return
	end

	slot_118_12_0 = slot_118_11_0:get_bbox()
	slot_118_13_0 = slot_118_11_0:get_origin()
	slot_118_14_0 = slot_118_11_0.m_flDuckAmount
	slot_118_15_0 = slot_0_28_0.misc.dormant_aimbot.hitchance:get()
	slot_118_16_0 = slot_0_28_0.misc.dormant_aimbot.damage:get()

	if slot_118_16_0 == 0 then
		slot_118_16_0 = slot_0_28_0.misc.dormant_aimbot.damage:get()
	end

	if slot_118_16_0 >= 100 then
		slot_118_16_0 = slot_118_16_0 - 100 + slot_118_11_0.m_iHealth
	end

	slot_118_17_0 = {}

	for iter_118_0 = 1, #slot_0_69_2 do
		slot_118_22_1 = slot_0_69_2[iter_118_0]
		slot_118_23_1 = slot_118_22_1.vec
		slot_118_24_2 = slot_118_22_1.scale
		slot_118_25_1 = slot_118_22_1.hitbox

		if slot_118_25_1 == "Head" then
			slot_118_23_1 = slot_118_23_1 - vector(0, 0, 10 * slot_118_14_0)
		elseif slot_118_25_1 == "Chest" then
			slot_118_23_1 = slot_118_23_1 - vector(0, 0, 4 * slot_118_14_0)
		end

		if #slot_118_10_0 ~= 0 then
			slot_118_26_1 = slot_0_68_2[slot_118_25_1]

			if in_list(slot_118_10_0, slot_118_26_1) then
				table.insert(slot_118_17_0, {
					vec = slot_118_23_1,
					scale = slot_118_24_2,
					hitbox = slot_118_25_1
				})
			end
		else
			table.insert(slot_118_17_0, 1, {
				vec = slot_118_23_1,
				scale = slot_118_24_2,
				hitbox = slot_118_25_1
			})
		end
	end

	if not (slot_118_3_0.is_revolver and slot_118_7_0 > slot_118_2_0.m_flNextPrimaryAttack or slot_118_7_0 > math.max(slot_118_1_0.m_flNextAttack, slot_118_2_0.m_flNextPrimaryAttack, slot_118_2_0.m_flNextSecondaryAttack)) then
		return
	end

	if slot_118_15_0 >= math.floor(slot_118_12_0.alpha * 100) + 5 then
		return
	end

	slot_118_19_0 = nil
	slot_118_20_0 = nil

	for iter_118_1 = 1, #slot_118_17_0 do
		slot_118_25_0 = slot_118_17_0[iter_118_1]
		slot_118_26_0 = create_aim_points(slot_118_6_0, slot_118_13_0 + slot_118_25_0.vec, slot_118_25_0.scale)

		for iter_118_2 = 1, #slot_118_26_0 do
			slot_118_31_0 = slot_118_26_0[iter_118_2]
			slot_118_32_0 = slot_118_31_0.vec
			slot_118_33_0, slot_118_34_0 = bullet_trace(slot_118_1_0, slot_118_6_0, slot_118_32_0, function(arg_119_0)
				return arg_119_0 == slot_118_11_0
			end)

			if slot_118_34_0 and slot_118_34_0:is_visible() then
				-- block empty
			elseif slot_118_33_0 ~= 0 and slot_118_16_0 < slot_118_33_0 then
				slot_118_19_0 = slot_118_32_0
				slot_118_20_0 = slot_118_33_0
				slot_0_58_1 = slot_118_11_0
				slot_0_60_1 = slot_118_25_0.hitbox
				slot_0_61_1 = slot_118_33_0
				slot_0_59_1 = slot_118_31_0.text
				slot_0_62_1 = slot_118_12_0.alpha

				break
			end
		end

		if slot_118_19_0 and slot_118_20_0 then
			break
		end
	end

	if not slot_118_19_0 or not slot_118_20_0 then
		return
	end

	slot_118_21_0 = slot_118_6_0:to(slot_118_19_0):angles()
	arg_118_0.block_movement = 1
	slot_118_22_0 = not arg_118_0.in_jump and slot_118_8_0
	slot_118_23_0 = slot_118_1_0.m_bIsScoped or slot_118_1_0.m_bResumeZoom
	slot_118_24_0 = slot_118_3_0.weapon_type == slot_0_57_1

	if not slot_118_23_0 and slot_118_24_0 and slot_118_22_0 then
		arg_118_0.in_attack2 = true
	end

	if slot_118_4_0 < 0.01 then
		arg_118_0.view_angles = slot_118_21_0
		arg_118_0.in_attack = true
		slot_0_64_1 = true
	end
end

function handle_shot(arg_120_0)
	utils.execute_after(0.03, function()
		if entity.get(arg_120_0.userid, true) == entity.get_local_player() then
			if slot_0_64_1 and not slot_0_63_1 then
				events.dormant_miss:call({
					userid = slot_0_58_1,
					aim_hitbox = slot_0_60_1,
					aim_damage = slot_0_61_1,
					aim_point = slot_0_59_1,
					accuracy = slot_0_62_1
				})
			end

			slot_0_63_1, slot_0_64_1 = false, false
			slot_0_58_1, slot_0_60_1, slot_0_61_1, slot_0_59_1, slot_0_62_1 = nil
		end
	end)
end

function handle_hit(arg_122_0)
	local var_122_0 = entity.get_local_player()
	local var_122_1 = entity.get(arg_122_0.userid, true)
	local var_122_2 = entity.get(arg_122_0.attacker, true)

	if not var_122_1 or var_122_2 ~= var_122_0 then
		return
	end

	local var_122_3 = var_122_1:get_bbox()

	if not var_122_3 then
		return
	end

	if var_122_1:is_dormant() and slot_0_64_1 then
		slot_0_63_1 = true

		events.dormant_hit:call({
			userid = var_122_1,
			attacker = var_122_2,
			health = arg_122_0.health,
			armor = arg_122_0.armor,
			weapon = arg_122_0.weapon,
			dmg_health = arg_122_0.dmg_health,
			dmg_armor = arg_122_0.dmg_armor,
			hitgroup = arg_122_0.hitgroup,
			accuracy = var_122_3.alpha,
			hitbox = slot_0_67_1[arg_122_0.hitgroup],
			aim_point = slot_0_59_1,
			aim_hitbox = slot_0_60_1,
			aim_damage = slot_0_61_1
		})
	end
end

function handle_shutdown()
	slot_0_23_0.dormant_aimbot:override()
end

slot_0_57_0 = {}
slot_0_58_0 = 0.3

function slot_0_57_0.resolve_grenade_throw(arg_124_0, arg_124_1, arg_124_2, arg_124_3)
	arg_124_0.x = arg_124_0.x - 10 + math.abs(arg_124_0.x) / 9

	local var_124_0 = vector():angles(arg_124_0)
	local var_124_1 = arg_124_3 * 1.25

	if arg_124_2 <= 0.1 then
		return arg_124_0
	end

	local var_124_2 = math.clamp(arg_124_1 * 0.9, 15, 750) * math.clamp(arg_124_2, 0, 1) * lerp(slot_0_58_0, 1, math.clamp(arg_124_2, 0, 1))
	local var_124_3 = var_124_0

	for iter_124_0 = 1, 4 do
		var_124_3 = (var_124_0 * (var_124_3 * var_124_2 + var_124_1):length() - var_124_1) / var_124_2

		var_124_3:normalize()
	end

	local var_124_4 = var_124_3:angles()

	var_124_4.x = var_124_4.x > -10 and 0.9 * var_124_4.x + 9 or 1.125 * var_124_4.x + 11.25

	return var_124_4
end

function slot_0_57_0.on_grenade_override_view(arg_125_0)
	if not slot_0_28_0.misc.grenades:get() or not slot_0_28_0.misc.grenades.grenade_super_toss:get() then
		return
	end

	local var_125_0 = entity.get_local_player()
	local var_125_1 = entity.get_local_player():get_player_weapon()

	if not var_125_0 or not var_125_1 then
		return
	end

	local var_125_2 = var_125_1:get_weapon_info()

	if not var_125_2 then
		return
	end

	arg_125_0.angles = slot_0_57_0.resolve_grenade_throw(arg_125_0.angles, var_125_2.throw_velocity, var_125_1.m_flThrowStrength, arg_125_0.velocity)
end

function slot_0_57_0.on_createmove_1(arg_126_0)
	if not slot_0_28_0.misc.grenades:get() or not slot_0_28_0.misc.grenades.grenade_super_toss:get() then
		return
	end

	if not arg_126_0.jitter_move then
		return
	end

	local var_126_0 = entity.get_local_player()
	local var_126_1 = entity.get_local_player():get_player_weapon()

	if not var_126_0 or not var_126_1 then
		return
	end

	local var_126_2 = var_126_1:get_weapon_info()

	if not var_126_2 or var_126_2.weapon_type ~= 9 or var_126_1.m_fThrowTime < globals.curtime - to_time(globals.clock_offset) then
		return
	end

	arg_126_0.in_speed = true

	local var_126_3 = var_126_0:simulate_movement()

	var_126_3:think()

	arg_126_0.view_angles = slot_0_57_0.resolve_grenade_throw(arg_126_0.view_angles, var_126_2.throw_velocity, var_126_1.m_flThrowStrength, var_126_3.velocity)
end

function slot_0_57_0.grenade_release(arg_127_0)
	if not slot_0_28_0.misc.grenades:get() or not slot_0_28_0.misc.grenades.grenade_release:get() then
		return
	end

	local var_127_0 = entity.get_local_player()

	if not var_127_0 or not var_127_0:is_alive() then
		return
	end

	local var_127_1 = var_127_0:get_player_weapon()

	if not var_127_1 then
		return
	end

	local var_127_2 = var_127_1:get_classname()

	if not var_127_2 then
		return
	end

	local var_127_3 = ({
		CSmokeGrenade = "Smoke",
		CHEGrenade = "HE Grenade",
		CMolotovGrenade = "Molotov"
	})[var_127_2]

	if var_127_3 and slot_0_28_0.misc.grenades.grenade_release_type_nades:get(var_127_3) then
		return
	end

	if var_127_2 == "CMolotovGrenade" and var_127_1.m_bPinPulled then
		local var_127_4 = entity.get_entities("CInferno")

		if #var_127_4 > 0 then
			local var_127_5 = var_127_0:get_origin()
			local var_127_6 = var_127_0:get_eye_position()
			local var_127_7 = render.camera_angles()
			local var_127_8
			local var_127_9 = 999999
			local var_127_10 = 15

			for iter_127_0, iter_127_1 in ipairs(var_127_4) do
				local var_127_11 = iter_127_1:get_origin()
				local var_127_12 = var_127_5:dist(var_127_11)
				local var_127_13 = (var_127_11 - var_127_6):angles()
				local var_127_14 = math.abs((var_127_13.y - var_127_7.y + 180) % 360 - 180)
				local var_127_15 = math.abs((var_127_13.x - var_127_7.x + 180) % 360 - 180)
				local var_127_16 = utils.trace_line(var_127_6, var_127_11, var_127_0)

				if var_127_12 < 500 and var_127_12 < var_127_9 and var_127_16.fraction > 0.97 and var_127_14 < var_127_10 and var_127_15 < var_127_10 then
					var_127_8 = iter_127_1
					var_127_9 = var_127_12
				end
			end

			if var_127_8 then
				utils.console_exec("+attack")
				utils.console_exec("+attack2")
				utils.execute_after(0.05, function()
					utils.console_exec("-attack")
					utils.console_exec("-attack2")
				end)

				return
			end
		end
	elseif var_127_2 == "CHEGrenade" or var_127_2 == "CSmokeGrenade" then
		local var_127_17 = slot_0_28_0.misc.grenades

		if var_127_17.grenade_type:get("Grenade Release") and var_127_1.m_bPinPulled and var_127_17.grenade_release_amount:get() < arg_127_0.damage then
			utils.console_exec("+attack")
			utils.execute_after(0.1, function()
				utils.console_exec("-attack")
			end)
		end
	end
end

slot_0_59_0 = {
	no_fall_damage = function(arg_130_0)
		local var_130_0 = entity.get_local_player()

		if not var_130_0 or not slot_0_28_0.misc.movement.no_fall_damage:get() then
			return
		end

		local var_130_1 = var_130_0:get_origin()

		if var_130_0.m_vecVelocity.z <= -500 then
			if utils.trace_line(vector(var_130_1.x, var_130_1.y, var_130_1.z), vector(var_130_1.x, var_130_1.y, var_130_1.z - 15)).fraction ~= 1 then
				arg_130_0.in_duck = 0
			elseif utils.trace_line(vector(var_130_1.x, var_130_1.y, var_130_1.z), vector(var_130_1.x, var_130_1.y, var_130_1.z - 55)).fraction ~= 1 then
				arg_130_0.in_duck = 1
			end
		end
	end,
	fast_ladder = function(arg_131_0)
		local var_131_0 = entity.get_local_player()

		if not var_131_0 or not slot_0_28_0.misc.movement.fast_ladder:get() then
			return
		end

		if var_131_0.m_MoveType == 9 then
			arg_131_0.view_angles.y = math.floor(arg_131_0.view_angles.y + 0.5)

			if arg_131_0.forwardmove > 0 then
				if arg_131_0.view_angles.x < 45 then
					arg_131_0.view_angles.x = 89
					arg_131_0.in_moveright = 1
					arg_131_0.in_moveleft = 0
					arg_131_0.in_forward = 0
					arg_131_0.in_back = 1

					if arg_131_0.sidemove == 0 then
						arg_131_0.view_angles.y = arg_131_0.view_angles.y + 90
					elseif arg_131_0.sidemove < 0 then
						arg_131_0.view_angles.y = arg_131_0.view_angles.y + 150
					elseif arg_131_0.sidemove > 0 then
						arg_131_0.view_angles.y = arg_131_0.view_angles.y + 30
					end
				end
			elseif arg_131_0.forwardmove < 0 then
				arg_131_0.view_angles.x = 89
				arg_131_0.in_moveleft = 1
				arg_131_0.in_moveright = 0
				arg_131_0.in_forward = 1
				arg_131_0.in_back = 0

				if arg_131_0.sidemove == 0 then
					arg_131_0.view_angles.y = arg_131_0.view_angles.y + 90
				elseif arg_131_0.sidemove > 0 then
					arg_131_0.view_angles.y = arg_131_0.view_angles.y + 150
				elseif arg_131_0.sidemove < 0 then
					arg_131_0.view_angles.y = arg_131_0.view_angles.y + 30
				end
			end
		end
	end
}

function slot_0_57_0.grenade_release(arg_132_0)
	if not slot_0_28_0.misc.grenades:get() or not slot_0_28_0.misc.grenades.grenade_release:get() then
		return
	end

	local var_132_0 = entity.get_local_player()

	if not var_132_0 or not var_132_0:is_alive() then
		return
	end

	local var_132_1 = var_132_0:get_player_weapon()

	if not var_132_1 then
		return
	end

	local var_132_2 = var_132_1:get_classname()

	if not var_132_2 then
		return
	end

	local var_132_3 = ({
		CSmokeGrenade = "Smoke",
		CHEGrenade = "HE Grenade",
		CMolotovGrenade = "Molotov"
	})[var_132_2]

	if var_132_3 and slot_0_28_0.misc.grenades.grenade_release_type_nades:get(var_132_3) then
		return
	end

	if var_132_2 == "CMolotovGrenade" and var_132_1.m_bPinPulled then
		local var_132_4 = entity.get_entities("CInferno")

		if #var_132_4 > 0 then
			local var_132_5 = var_132_0:get_origin()
			local var_132_6 = var_132_0:get_eye_position()
			local var_132_7 = render.camera_angles()
			local var_132_8
			local var_132_9 = 999999
			local var_132_10 = 15

			for iter_132_0, iter_132_1 in ipairs(var_132_4) do
				local var_132_11 = iter_132_1:get_origin()
				local var_132_12 = var_132_5:dist(var_132_11)
				local var_132_13 = (var_132_11 - var_132_6):angles()
				local var_132_14 = math.abs((var_132_13.y - var_132_7.y + 180) % 360 - 180)
				local var_132_15 = math.abs((var_132_13.x - var_132_7.x + 180) % 360 - 180)
				local var_132_16 = utils.trace_line(var_132_6, var_132_11, var_132_0)

				if var_132_12 < 500 and var_132_12 < var_132_9 and var_132_16.fraction > 0.97 and var_132_14 < var_132_10 and var_132_15 < var_132_10 then
					var_132_8 = iter_132_1
					var_132_9 = var_132_12
				end
			end

			if var_132_8 then
				utils.console_exec("+attack")
				utils.console_exec("+attack2")
				utils.execute_after(0.05, function()
					utils.console_exec("-attack")
					utils.console_exec("-attack2")
				end)

				return
			end
		end
	elseif var_132_2 == "CHEGrenade" or var_132_2 == "CSmokeGrenade" then
		local var_132_17 = slot_0_28_0.misc.grenades

		if var_132_17.grenade_type:get("Grenade Release") and var_132_1.m_bPinPulled and var_132_17.grenade_release_amount:get() < arg_132_0.damage then
			utils.console_exec("+attack")
			utils.execute_after(0.1, function()
				utils.console_exec("-attack")
			end)
		end
	end
end

slot_0_60_0 = render.load_font("Calibri Bold", vector(24, 24), "ad")
slot_0_61_0 = 0
slot_0_62_0 = 0

function black_box(arg_135_0, arg_135_1, arg_135_2, arg_135_3, arg_135_4, arg_135_5, arg_135_6, arg_135_7)
	slot_135_8_0 = render.screen_size().x
	slot_135_9_0 = render.screen_size().y + 50

	if arg_135_7 == "100%" then
		slot_135_10_0 = render.measure_text(slot_0_60_0, "c", arg_135_1)

		if arg_135_2 == nil and arg_135_3 == nil then
			render.gradient(vector(slot_135_8_0 / 40, slot_135_9_0 / 1.43 - 4 - arg_135_0), vector(slot_135_8_0 / 40 + slot_135_10_0.x + 5, slot_135_9_0 / 1.43 + 27 - arg_135_0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), 0)
			render.gradient(vector(slot_135_8_0 / 40 - 45, slot_135_9_0 / 1.43 - 4 - arg_135_0), vector(slot_135_8_0 / 40, slot_135_9_0 / 1.43 + 27 - arg_135_0), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), 0)
			render.text(slot_0_60_0, vector(slot_135_8_0 / 62, slot_135_9_0 / 1.43 + 3 - arg_135_0), color(arg_135_4, arg_135_5, arg_135_6, 255), nil, arg_135_1)
		elseif arg_135_2 ~= nil and arg_135_3 ~= nil then
			render.gradient(vector(slot_135_8_0 / 40, slot_135_9_0 / 1.43 - 4 - arg_135_0), vector(slot_135_8_0 / 40 + slot_135_10_0.x, slot_135_9_0 / 1.43 + 27 - arg_135_0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), 0)
			render.gradient(vector(slot_135_8_0 / 40 - 45, slot_135_9_0 / 1.43 - 4 - arg_135_0), vector(slot_135_8_0 / 40, slot_135_9_0 / 1.43 + 27 - arg_135_0), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), 0)
			render.text(slot_0_60_0, vector(slot_135_8_0 / 62 + 38, slot_135_9_0 / 1.43 + 3 - arg_135_0), color(arg_135_4, arg_135_5, arg_135_6, 255), nil, arg_135_1)
			render.texture(arg_135_2, vector(slot_135_8_0 / 62, slot_135_9_0 / 1.43 - arg_135_0), vector(32, 28), color(arg_135_4, arg_135_5, arg_135_6, 255), f, 0)
			render.circle_outline(vector(slot_135_8_0 / 62 + 70, slot_135_9_0 / 1.43 + 12 - arg_135_0), color(10, 10, 10, 255), 10, 0, 1, 5)
			render.circle_outline(vector(slot_135_8_0 / 62 + 70, slot_135_9_0 / 1.43 + 12 - arg_135_0), color(200, 200, 200), 9, 0, arg_135_3, 3)
		elseif arg_135_2 ~= nil and arg_135_3 == nil then
			render.gradient(vector(slot_135_8_0 / 40, slot_135_9_0 / 1.43 - 4 - arg_135_0), vector(slot_135_8_0 / 40 + slot_135_10_0.x, slot_135_9_0 / 1.43 + 27 - arg_135_0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), 0)
			render.gradient(vector(slot_135_8_0 / 40 - 45, slot_135_9_0 / 1.43 - 4 - arg_135_0), vector(slot_135_8_0 / 40, slot_135_9_0 / 1.43 + 27 - arg_135_0), color(0, 0, 0, 0), color(0, 0, 0, 50), color(0, 0, 0, 0), color(0, 0, 0, 50), 0)
			render.text(slot_0_60_0, vector(slot_135_8_0 / 62 + 38, slot_135_9_0 / 1.43 + 3 - arg_135_0), color(arg_135_4, arg_135_5, arg_135_6, 255), nil, arg_135_1)
			render.texture(arg_135_2, vector(slot_135_8_0 / 62, slot_135_9_0 / 1.43 - arg_135_0), vector(32, 28), color(arg_135_4, arg_135_5, arg_135_6, 255), f, 0)
		end
	end
end

events.aim_ack:set(function(arg_136_0)
	if arg_136_0.state then
		slot_0_62_0 = slot_0_62_0 + 1
	else
		slot_0_61_0 = slot_0_61_0 + 1
	end
end)

slot_0_63_0 = {}

events.render:set(function()
	slot_137_0_0 = entity.get_local_player()

	if not slot_137_0_0 or not slot_137_0_0:is_alive() then
		return
	end

	if not slot_0_28_0.misc.indicators or not slot_0_28_0.misc.indicators:get() then
		return
	end

	if not slot_0_28_0.misc.indicators.gamesense_enable:get() then
		return
	end

	slot_137_1_0 = slot_0_28_0.misc.indicators.gamesense_type:get()
	slot_137_2_0 = slot_0_28_0.misc.indicators.gamesense_binds
	slot_137_3_0 = render.screen_size().y
	slot_137_4_0 = 50
	slot_137_5_0 = slot_137_3_0 - 100
	slot_137_6_0 = 36
	slot_137_7_0 = "100%"
	slot_137_8_0 = {}
	slot_137_9_0 = 0

	function slot_137_10_0(arg_138_0, arg_138_1, arg_138_2, arg_138_3, arg_138_4, arg_138_5, arg_138_6, arg_138_7)
		if not arg_138_1 then
			slot_0_63_0[arg_138_7] = nil

			return false
		end

		if not slot_0_63_0[arg_138_7] then
			slot_0_63_0[arg_138_7] = {
				current = slot_137_9_0 + slot_137_6_0,
				target = slot_137_9_0
			}
		else
			slot_0_63_0[arg_138_7].target = slot_137_9_0
		end

		slot_0_63_0[arg_138_7].current = lerp(slot_0_63_0[arg_138_7].current, slot_0_63_0[arg_138_7].target, 0.1)

		black_box(slot_0_63_0[arg_138_7].current, arg_138_0, arg_138_5, arg_138_6, arg_138_2, arg_138_3, arg_138_4, slot_137_7_0)

		slot_137_9_0 = slot_137_9_0 + slot_137_6_0

		return true
	end

	if slot_0_28_0.misc.indicators.gamesense_enable:get() then
		slot_137_11_0 = 0

		if slot_137_2_0 and slot_137_2_0:get("Double tap") and slot_0_23_0.doubletap and slot_0_23_0.doubletap:get() then
			slot_137_12_10 = rage.exploit:get() == 1
			slot_137_13_3 = "DT"

			if not slot_137_8_0[slot_137_13_3] then
				if slot_137_12_10 then
					slot_137_10_0("DT", true, 200, 200, 200, nil, nil, slot_137_13_3)
				else
					slot_137_10_0("DT", true, 229, 26, 55, nil, nil, slot_137_13_3)
				end

				slot_137_8_0[slot_137_13_3] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("Dormant") and slot_0_23_0.dormant_aimbot and slot_0_23_0.dormant_aimbot:get() then
			slot_137_12_9 = "DA"

			if not slot_137_8_0[slot_137_12_9] then
				slot_137_10_0("DA", true, 200, 200, 200, nil, nil, slot_137_12_9)

				slot_137_8_0[slot_137_12_9] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("Ping spike") and slot_0_23_0.fake_latency and slot_0_23_0.fake_latency:get() > 0 then
			slot_137_12_8 = "PING"

			if not slot_137_8_0[slot_137_12_8] then
				slot_137_10_0("PING", true, 150, 190, 50, nil, nil, slot_137_12_8)

				slot_137_8_0[slot_137_12_8] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("On shot anti-aim") and slot_0_23_0.hide_shots and slot_0_23_0.hide_shots:get() then
			slot_137_12_7 = "OSAA"

			if not slot_137_8_0[slot_137_12_7] then
				slot_137_10_0("OSAA", true, 200, 200, 200, nil, nil, slot_137_12_7)

				slot_137_8_0[slot_137_12_7] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("Freestanding") and slot_0_23_0.freestanding and slot_0_23_0.freestanding:get_override() then
			slot_137_12_6 = "FS"

			if not slot_137_8_0[slot_137_12_6] then
				slot_137_10_0("FS", true, 200, 200, 200, nil, nil, slot_137_12_6)

				slot_137_8_0[slot_137_12_6] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("Duck peek assist") and slot_0_23_0.fake_duck and slot_0_23_0.fake_duck:get() then
			slot_137_12_5 = "DUCK"

			if not slot_137_8_0[slot_137_12_5] then
				slot_137_10_0("DUCK", true, 200, 200, 200, nil, nil, slot_137_12_5)

				slot_137_8_0[slot_137_12_5] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("Minimum damage override") then
			slot_137_12_4 = get_bind("Min. Damage")
			slot_137_13_2 = "MD"

			if slot_137_12_4 and slot_137_12_4[1] and not slot_137_8_0[slot_137_13_2] then
				slot_137_10_0("MD", true, 200, 200, 200, nil, nil, slot_137_13_2)

				slot_137_8_0[slot_137_13_2] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("Force safe points") and slot_0_23_0.safe_points and slot_0_23_0.safe_points:get() == "Force" then
			slot_137_12_3 = "SAFE"

			if not slot_137_8_0[slot_137_12_3] then
				slot_137_10_0("SAFE", true, 200, 200, 200, nil, nil, slot_137_12_3)

				slot_137_8_0[slot_137_12_3] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("Force body aim") and slot_0_23_0.body_aim and slot_0_23_0.body_aim:get() == "Force" then
			slot_137_12_2 = "BODY"

			if not slot_137_8_0[slot_137_12_2] then
				slot_137_10_0("BODY", true, 200, 200, 200, nil, nil, slot_137_12_2)

				slot_137_8_0[slot_137_12_2] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("Aimbot stats") then
			slot_137_12_1 = slot_0_61_0 + slot_0_62_0 > 0 and math.floor(slot_0_61_0 / (slot_0_61_0 + slot_0_62_0) * 100) or 0
			slot_137_13_1 = "STATS"

			if not slot_137_8_0[slot_137_13_1] then
				slot_137_10_0(slot_0_61_0 .. "/" .. slot_0_62_0 .. " (" .. slot_137_12_1 .. "%)", true, 200, 200, 200, nil, nil, slot_137_13_1)

				slot_137_8_0[slot_137_13_1] = true
			end
		end

		if slot_137_2_0 and slot_137_2_0:get("Spectators") then
			slot_137_12_0 = entity.get_local_player()

			if slot_137_12_0 then
				slot_137_13_0 = slot_137_12_0:get_spectators() or {}
				slot_137_14_0 = render.screen_size().x - 5
				slot_137_15_0 = 20

				for iter_137_0 = 1, #slot_137_13_0 do
					slot_137_20_0 = slot_137_13_0[iter_137_0]:get_name() or ""

					render.text(fonts.calibri_bold, vector(slot_137_14_0, slot_137_15_0 + 16 * iter_137_0), color(255, 255, 255, 225), "r", slot_137_20_0)
				end
			end
		end
	end
end)
events.round_start:set(function()
	slot_0_61_0 = 0
	slot_0_62_0 = 0
end)

function entity.get_anim_layer(arg_140_0, arg_140_1)
	return ffi.cast("c_animlayers**", ffi.cast("char*", ffi.cast("void***", arg_140_0)) + 10640)[0][arg_140_1 or 1]
end

events.post_update_clientside_animation:set(function()
	if not slot_0_28_0.misc.animation:get() then
		return
	end

	local var_141_0 = entity.get_local_player()

	if not var_141_0 then
		return
	end

	local var_141_1 = var_141_0.m_vecVelocity:length()
	local var_141_2 = var_141_0.m_flPoseParameter
	local var_141_3 = slot_0_28_0.misc.animation
	local var_141_4 = var_141_3.air:get()

	if var_141_4 == "Static" then
		var_141_2[6] = 1
	elseif var_141_4 == "Moonwalk" and var_141_1 > 5 then
		local var_141_5 = entity.get_anim_layer(slot_0_11_0(var_141_0:get_index()), 6)

		if var_141_5 then
			var_141_5.m_flWeight = 1
		end
	end

	local var_141_6 = var_141_3.ground:get()

	if var_141_6 == "Reversed" then
		var_141_2[0] = 1

		slot_0_23_0.leg:override("Sliding")
	elseif var_141_6 == "Moonwalk" then
		var_141_2[7] = 1

		slot_0_23_0.leg:override("Walking")
	end

	if var_141_3.addons:get("Move Lean") and var_141_1 >= 3 then
		local var_141_7 = entity.get_anim_layer(slot_0_11_0(var_141_0:get_index()), 12)

		if var_141_7 then
			var_141_7.m_flWeight = var_141_3.movelean:get() / 100
		end
	end
end)

function aspect_ratio()
	local var_142_0 = slot_0_28_0.misc.aspect_ratio:get() and slot_0_28_0.misc.aspect_ratio.aspect_ratio:get() / 100 or 1.7

	slot_0_39_0 = lerp(slot_0_39_0, var_142_0, 0.05)

	cvar.r_aspectratio:float(slot_0_39_0)
end

slot_0_64_0 = {
	aspect_ratio_pre3 = 133,
	aspect_ratio_pre5 = 150,
	aspect_ratio_pre2 = 177,
	aspect_ratio_pre = 160,
	aspect_ratio_pre4 = 125
}

for iter_0_4, iter_0_5 in pairs(slot_0_64_0) do
	slot_0_28_0.misc.aspect_ratio[iter_0_4]:set_callback(function()
		slot_0_28_0.misc.aspect_ratio.aspect_ratio:set(iter_0_5)
	end)
end

slot_0_65_0 = {
	x = 1,
	z = -1,
	fov = 60,
	y = 1
}
slot_0_66_0 = cvar.cl_righthand:int()
slot_0_67_0 = false

function viewmodel()
	local var_144_0 = slot_0_28_0.misc.viewmodel:get()
	local var_144_1 = {
		fov = var_144_0 and slot_0_28_0.misc.viewmodel.fov:get() / 10 or 60,
		x = var_144_0 and slot_0_28_0.misc.viewmodel.x:get() / 10 or 1,
		y = var_144_0 and slot_0_28_0.misc.viewmodel.y:get() / 10 or 1,
		z = var_144_0 and slot_0_28_0.misc.viewmodel.z:get() / 10 or -1
	}

	slot_0_65_0.fov = lerp(slot_0_65_0.fov, var_144_1.fov, 0.05)
	slot_0_65_0.x = lerp(slot_0_65_0.x, var_144_1.x, 0.05)
	slot_0_65_0.y = lerp(slot_0_65_0.y, var_144_1.y, 0.05)
	slot_0_65_0.z = lerp(slot_0_65_0.z, var_144_1.z, 0.05)

	cvar.viewmodel_fov:float(slot_0_65_0.fov, true)
	cvar.viewmodel_offset_x:float(slot_0_65_0.x, true)
	cvar.viewmodel_offset_y:float(slot_0_65_0.y, true)
	cvar.viewmodel_offset_z:float(slot_0_65_0.z, true)

	local var_144_2 = entity.get_local_player()

	if not var_144_2 then
		return
	end

	local var_144_3 = var_144_2:get_player_weapon()

	if not var_144_3 then
		return
	end

	local var_144_4 = var_144_3:get_classname()
	local var_144_5 = slot_0_28_0.misc.viewmodel.left_knife:get()

	if var_144_4 == "CKnife" and var_144_5 then
		cvar.cl_righthand:int(0)

		slot_0_67_0 = true
	else
		cvar.cl_righthand:int(1)

		slot_0_67_0 = false
	end
end

slot_0_28_0.misc.viewmodel.default:set_callback(function()
	slot_0_28_0.misc.viewmodel.fov:set(600)
	slot_0_28_0.misc.viewmodel.x:set(10)
	slot_0_28_0.misc.viewmodel.y:set(10)
	slot_0_28_0.misc.viewmodel.z:set(-10)
end)

slot_0_68_0 = (function()
	local var_146_0 = "stellar"
	local var_146_1 = 1
	local var_146_2 = 0.2
	local var_146_3 = 1.3
	local var_146_4 = 0
	local var_146_5 = "typing"
	local var_146_6 = ""

	return function()
		if not slot_0_28_0.misc.branded:get() or not slot_0_28_0.misc.branded.clantag:get() then
			slot_0_23_0.clantag:override()

			if var_146_6 ~= "" then
				common.set_clan_tag("")

				var_146_6 = ""
			end

			return
		end

		slot_0_23_0.clantag:override(false)

		local var_147_0 = globals.curtime

		if var_147_0 - var_146_4 < var_146_2 then
			return
		end

		if var_146_5 == "typing" then
			var_146_1 = var_146_1 + 1

			if var_146_1 > #var_146_0 then
				var_146_1 = #var_146_0
				var_146_5 = "pause_typing"
				var_146_4 = var_147_0

				return
			end
		elseif var_146_5 == "pause_typing" then
			if var_147_0 - var_146_4 >= var_146_3 then
				var_146_5 = "deleting"
				var_146_1 = 1
			else
				return
			end
		elseif var_146_5 == "deleting" then
			var_146_1 = var_146_1 + 1

			if var_146_1 > #var_146_0 + 1 then
				var_146_5 = "pause_deleting"
				var_146_4 = var_147_0

				return
			end
		elseif var_146_5 == "pause_deleting" then
			if var_147_0 - var_146_4 >= var_146_3 then
				var_146_5 = "typing"
				var_146_1 = 1
			else
				return
			end
		end

		local var_147_1 = ""

		if var_146_5 == "typing" or var_146_5 == "pause_typing" then
			var_147_1 = var_146_0:sub(1, var_146_1)
		elseif var_146_5 == "deleting" and var_146_1 <= #var_146_0 then
			var_147_1 = var_146_0:sub(var_146_1)
		end

		if var_147_1 ~= var_146_6 then
			common.set_clan_tag(var_147_1)

			var_146_6 = var_147_1
		end

		var_146_4 = var_147_0
	end
end)()
slot_0_69_0 = {
	{
		"fuck",
		"bot",
		"1",
		"мать ебал твою жирный",
		"отсоси у stellar.lua"
	},
	{
		"ez",
		"game",
		"by stellar"
	},
	{
		"1 ротовыебанный пидарас",
		"полируй яйки мои мразь"
	},
	{
		"1 тараканище",
		"щенок пошел нахуй",
		"отполируй хуяку мне ртом матери своей"
	},
	{
		"жироеблый толстопуз поднимись с колен",
		"сакай хуй мне усатый пидорас"
	},
	{
		"выебан",
		"1"
	},
	{
		"жировоз папни мали",
		"всоси мне ублюдок жирный"
	},
	{
		"$$$$$$$$$$$$$$$$$$$$$$$$$$",
		"мать ебал"
	}
}
slot_0_70_0 = {
	{
		"no way",
		"i die",
		"wtf",
		"ДА КАК ТЫ МЕНЯ УБИЛ СЫН ШЛЮХИ"
	},
	{
		"gg",
		"i was lagging",
		":(",
		"везучий пидорас"
	},
	{
		"повезло тебе хуйня толстая",
		"запутался в кнопках и как то убил жирный хуйлан"
	},
	{
		"жди пидарас в следующем раунде я ебну тебя и мамашу твою топором",
		")"
	},
	{
		"везучий хуесос",
		"пиздец",
		"гандон"
	},
	{
		"ПОВЕЗЛО СОЛЕВОМУ ПАРАНОИКУ",
		"че ты сделал ублюдок"
	}
}
slot_0_71_0 = {
	{
		"avenged",
		"you",
		"idiot"
	},
	{
		"lol",
		"deserved",
		"noob"
	}
}
slot_0_72_0 = {}

function trashtalk(arg_148_0)
	local var_148_0 = entity.get_local_player()

	if not var_148_0 or not var_148_0:is_alive() then
		return
	end

	if not slot_0_28_0.misc.branded:get() or not slot_0_28_0.misc.branded.shit_talking:get() then
		return
	end

	local var_148_1 = var_148_0:get_player_info()

	if not var_148_1 then
		return
	end

	local var_148_2 = var_148_1.userid
	local var_148_3 = entity.get(arg_148_0.userid, true)
	local var_148_4 = entity.get(arg_148_0.attacker, true)
	local var_148_5 = var_148_3 and var_148_3:get_player_info()
	local var_148_6 = var_148_4 and var_148_4:get_player_info()
	local var_148_7 = var_148_5 and var_148_5.userid or -1
	local var_148_8 = var_148_6 and var_148_6.userid or -1
	local var_148_9

	if slot_0_28_0.misc.branded.shit_talking_type:get("Kill") and var_148_2 == var_148_8 and var_148_7 ~= var_148_2 then
		var_148_9 = slot_0_69_0[math.random(#slot_0_69_0)]
	elseif slot_0_28_0.misc.branded.shit_talking_type:get("Death") and var_148_2 == var_148_7 and var_148_8 ~= var_148_2 then
		var_148_9 = slot_0_70_0[math.random(#slot_0_70_0)]
		slot_0_72_0[var_148_2] = var_148_8
	elseif slot_0_28_0.misc.branded.shit_talking_type:get("Revenge") and slot_0_72_0[var_148_2] == var_148_7 then
		var_148_9 = slot_0_71_0[math.random(#slot_0_71_0)]
		slot_0_72_0[var_148_2] = nil
	end

	if var_148_9 then
		for iter_148_0, iter_148_1 in ipairs(var_148_9) do
			utils.execute_after(iter_148_0 - 1.5, function()
				utils.console_exec("say " .. iter_148_1)
			end)
		end
	end
end

events.player_death:set(trashtalk)

slot_0_73_0 = {}

events.render:set(function(arg_150_0)
	local var_150_0 = {
		{
			slot_0_28_0.antiaim.manual,
			"Manual Yaw"
		},
		{
			slot_0_28_0.antiaim.freestanding,
			"Freestanding"
		},
		{
			slot_0_28_0.antiaim.safe_head,
			"Safe Head"
		},
		{
			slot_0_28_0.antiaim.avoid_backstab,
			"Avoid Backstab"
		},
		{
			slot_0_28_0.misc.indicators,
			"Indicators"
		},
		{
			slot_0_28_0.misc.animation,
			"Animation"
		},
		{
			slot_0_28_0.misc.scope_overlay,
			"Scope Overlay"
		},
		{
			slot_0_28_0.misc.aimbot_logs,
			"Aimbot Logs"
		},
		{
			slot_0_28_0.misc.automatic_peek,
			"Automatic Peek"
		},
		{
			slot_0_28_0.misc.dormant_aimbot,
			"Dormant Aimbot"
		},
		{
			slot_0_28_0.misc.hitchance_override,
			"Hitchance Override"
		},
		{
			slot_0_28_0.misc.grenades,
			"Grenades"
		},
		{
			slot_0_28_0.misc.branded,
			"Branding"
		},
		{
			slot_0_28_0.misc.aspect_ratio,
			"Aspect Ratio"
		},
		{
			slot_0_28_0.misc.viewmodel,
			"Viewmodel"
		}
	}

	for iter_150_0 = 1, #builder do
		if builder[iter_150_0] and builder[iter_150_0].enabled then
			table.insert(var_150_0, {
				builder[iter_150_0].enabled,
				"Override \v" .. (slot_0_25_0.state and slot_0_25_0.state[iter_150_0] or "State " .. iter_150_0)
			})
		end
	end

	for iter_150_1, iter_150_2 in ipairs(var_150_0) do
		local var_150_1 = iter_150_2[1]
		local var_150_2 = iter_150_2[2]

		if var_150_1 then
			local var_150_3 = var_150_1:get()

			if slot_0_73_0[var_150_1] ~= var_150_3 then
				slot_0_73_0[var_150_1] = var_150_3

				var_150_1:name((var_150_3 and "\v•" or "\a363636FF•") .. "   \r" .. var_150_2)
			end
		end
	end
end)

function config_system()
	local var_151_0 = common.get_username()
	local var_151_1 = slot_0_0_0.setup({
		slot_0_28_0,
		builder
	}, true)
	local var_151_2 = "eyJkYXRhIjpbeyJhbnRpYWltIjp7ImF2b2lkX2JhY2tzdGFiIjpmYWxzZSwiY29uZGl0aW9ucyI6IkFlcm9iaWMiLCJmcmVlc3RhbmRpbmciOmZhbHNlLCJtYW51YWwiOiJEaXNhYmxlZCIsIm1vZGUiOiJTaW5nbGUiLCJzYWZlX2hlYWQiOmZhbHNlLCJ0ZWFtcyI6IkNUIiwifmZyZWVzdGFuZGluZyI6eyJib2R5X2ZyZWVzdGFuZGluZyI6ZmFsc2UsImRpc2FibGVfeWF3X21vZGlmaWVycyI6ZmFsc2UsImRpc2FibGVycyI6WyJ+Il19LCJ+bWFudWFsIjp7InN0YXRpYyI6ZmFsc2V9LCJ+c2FmZV9oZWFkIjp7InN0YXRlIjpbIn4iXX19LCJjb25maWdzIjp7Imxpc3QiOjIuMCwidGV4dCI6Im1pcmEifSwibWFpbiI6eyJjYXRlZ29yaWVzIjo0LjB9fSxbeyJjdCI6eyJib2R5X3lhdyI6Mi4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjoyLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjpmYWxzZSwic2luZ2xlIjp7ImJvZHlfeWF3IjowLjAsImxlZnQiOjAuMCwibW9kaWZpZXIiOjAuMCwibW9kaWZpZXJfY2VudGVyIjowLjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjowLjAsInR5cGUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX0seyJjdCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjp0cnVlLCJzaW5nbGUiOnsiYm9keV95YXciOjIuMCwibGVmdCI6LTIxLjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6LTkuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjE5LjAsInR5cGUiOjIuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjIuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MTIuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJ0Ijp7ImJvZHlfeWF3IjowLjAsImxlZnQiOjAuMCwibW9kaWZpZXIiOjAuMCwibW9kaWZpZXJfY2VudGVyIjowLjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjowLjAsInR5cGUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX19LHsiY3QiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fSwiZW5hYmxlZCI6dHJ1ZSwic2luZ2xlIjp7ImJvZHlfeWF3IjoxLjAsImxlZnQiOi0xOS4wLCJtb2RpZmllciI6MS4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjotNy4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjoyNy4wLCJ0eXBlIjoyLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6Mi4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjQuMCwiYm9keV95YXdfZGVsYXlfbWluIjoyLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoyLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjEyLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjYuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjoxMS4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX0seyJjdCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjp0cnVlLCJzaW5nbGUiOnsiYm9keV95YXciOjIuMCwibGVmdCI6LTE2LjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6LTE2LjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjoyMC4wLCJ0eXBlIjoyLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjozLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjozLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjI3LjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fSwidCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19fSx7ImN0Ijp7ImJvZHlfeWF3IjowLjAsImxlZnQiOjAuMCwibW9kaWZpZXIiOjAuMCwibW9kaWZpZXJfY2VudGVyIjowLjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjowLjAsInR5cGUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX0sImVuYWJsZWQiOnRydWUsInNpbmdsZSI6eyJib2R5X3lhdyI6Mi4wLCJsZWZ0IjotMTQuMCwibW9kaWZpZXIiOjIuMCwibW9kaWZpZXJfY2VudGVyIjotMzUuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjE2LjAsInR5cGUiOjIuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MTkuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJ0Ijp7ImJvZHlfeWF3IjowLjAsImxlZnQiOjAuMCwibW9kaWZpZXIiOjAuMCwibW9kaWZpZXJfY2VudGVyIjowLjAsIm1vZGlmaWVyX29mZnNldCI6MC4wLCJtb2RpZmllcl9yYW5kb20iOjAuMCwib2Zmc2V0IjowLjAsInJpZ2h0IjowLjAsInR5cGUiOjAuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6MS4wLCJib2R5X3lhd19kZWxheV9taW4iOjEuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX19LHsiY3QiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fSwiZW5hYmxlZCI6dHJ1ZSwic2luZ2xlIjp7ImJvZHlfeWF3IjoyLjAsImxlZnQiOi0yNC4wLCJtb2RpZmllciI6Mi4wLCJtb2RpZmllcl9jZW50ZXIiOi0yMS4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MjIuMCwidHlwZSI6Mi4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MjIuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX0seyJjdCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjp0cnVlLCJzaW5nbGUiOnsiYm9keV95YXciOjEuMCwibGVmdCI6LTIyLjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6NDQuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjIxLjAsInR5cGUiOjIuMCwifmJvZHlfeWF3Ijp7ImJvZHlfeWF3X2RlbGF5IjoxLjAsImJvZHlfeWF3X2RlbGF5X2Nob2tlIjowLjAsImJvZHlfeWF3X2RlbGF5X21heCI6NC4wLCJib2R5X3lhd19kZWxheV9taW4iOjIuMCwiYm9keV95YXdfZGVsYXlfcGhhc2UiOjAuMCwiYm9keV95YXdfZGVsYXlfcmFuZG9tX3ZhbHVlIjowLjAsImJvZHlfeWF3X2RlbGF5X3R5cGUiOjEuMCwiYm9keV95YXdfbGVmdCI6NjAuMCwiYm9keV95YXdfbW9kZXJuX2xpbWl0Ijo2MC4wLCJib2R5X3lhd19yYW5kb21pemVfdmFsdWUiOjAuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MTIuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjE0LjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjoxNi4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX0seyJjdCI6eyJib2R5X3lhdyI6MC4wLCJsZWZ0IjowLjAsIm1vZGlmaWVyIjowLjAsIm1vZGlmaWVyX2NlbnRlciI6MC4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MC4wLCJ0eXBlIjowLjAsIn5ib2R5X3lhdyI6eyJib2R5X3lhd19kZWxheSI6MS4wLCJib2R5X3lhd19kZWxheV9jaG9rZSI6MC4wLCJib2R5X3lhd19kZWxheV9tYXgiOjEuMCwiYm9keV95YXdfZGVsYXlfbWluIjoxLjAsImJvZHlfeWF3X2RlbGF5X3BoYXNlIjowLjAsImJvZHlfeWF3X2RlbGF5X3JhbmRvbV92YWx1ZSI6MC4wLCJib2R5X3lhd19kZWxheV90eXBlIjoxLjAsImJvZHlfeWF3X2xlZnQiOjYwLjAsImJvZHlfeWF3X21vZGVybl9saW1pdCI6NjAuMCwiYm9keV95YXdfcmFuZG9taXplX3ZhbHVlIjowLjAsImJvZHlfeWF3X3JpZ2h0Ijo2MC4wfSwifmxlZnQiOnsibGVmdF9yYW5kb21pemVfdmFsdWUiOjAuMH0sIn5tb2RpZmllcl9jZW50ZXIiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX29mZnNldCI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfcmFuZG9tIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5yaWdodCI6eyJyaWdodF9yYW5kb21pemVfdmFsdWUiOjAuMH19LCJlbmFibGVkIjp0cnVlLCJzaW5nbGUiOnsiYm9keV95YXciOjIuMCwibGVmdCI6LTMxLjAsIm1vZGlmaWVyIjoyLjAsIm1vZGlmaWVyX2NlbnRlciI6NS4wLCJtb2RpZmllcl9vZmZzZXQiOjAuMCwibW9kaWZpZXJfcmFuZG9tIjowLjAsIm9mZnNldCI6MC4wLCJyaWdodCI6MjkuMCwidHlwZSI6Mi4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6NzMuMCwiYm9keV95YXdfcmlnaHQiOjYwLjB9LCJ+bGVmdCI6eyJsZWZ0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfSwifm1vZGlmaWVyX2NlbnRlciI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6OS4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+bW9kaWZpZXJfb2Zmc2V0Ijp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9yYW5kb20iOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifnJpZ2h0Ijp7InJpZ2h0X3JhbmRvbWl6ZV92YWx1ZSI6MC4wfX0sInQiOnsiYm9keV95YXciOjAuMCwibGVmdCI6MC4wLCJtb2RpZmllciI6MC4wLCJtb2RpZmllcl9jZW50ZXIiOjAuMCwibW9kaWZpZXJfb2Zmc2V0IjowLjAsIm1vZGlmaWVyX3JhbmRvbSI6MC4wLCJvZmZzZXQiOjAuMCwicmlnaHQiOjAuMCwidHlwZSI6MC4wLCJ+Ym9keV95YXciOnsiYm9keV95YXdfZGVsYXkiOjEuMCwiYm9keV95YXdfZGVsYXlfY2hva2UiOjAuMCwiYm9keV95YXdfZGVsYXlfbWF4IjoxLjAsImJvZHlfeWF3X2RlbGF5X21pbiI6MS4wLCJib2R5X3lhd19kZWxheV9waGFzZSI6MC4wLCJib2R5X3lhd19kZWxheV9yYW5kb21fdmFsdWUiOjAuMCwiYm9keV95YXdfZGVsYXlfdHlwZSI6MS4wLCJib2R5X3lhd19sZWZ0Ijo2MC4wLCJib2R5X3lhd19tb2Rlcm5fbGltaXQiOjYwLjAsImJvZHlfeWF3X3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJib2R5X3lhd19yaWdodCI6NjAuMH0sIn5sZWZ0Ijp7ImxlZnRfcmFuZG9taXplX3ZhbHVlIjowLjB9LCJ+bW9kaWZpZXJfY2VudGVyIjp7Im1vZGlmaWVyX21heCI6MC4wLCJtb2RpZmllcl9taW4iOjAuMCwibW9kaWZpZXJfcmFuZG9taXplX3ZhbHVlIjowLjAsIm1vZGlmaWVyX3R5cGUiOjEuMH0sIn5tb2RpZmllcl9vZmZzZXQiOnsibW9kaWZpZXJfbWF4IjowLjAsIm1vZGlmaWVyX21pbiI6MC4wLCJtb2RpZmllcl9yYW5kb21pemVfdmFsdWUiOjAuMCwibW9kaWZpZXJfdHlwZSI6MS4wfSwifm1vZGlmaWVyX3JhbmRvbSI6eyJtb2RpZmllcl9tYXgiOjAuMCwibW9kaWZpZXJfbWluIjowLjAsIm1vZGlmaWVyX3JhbmRvbWl6ZV92YWx1ZSI6MC4wLCJtb2RpZmllcl90eXBlIjoxLjB9LCJ+cmlnaHQiOnsicmlnaHRfcmFuZG9taXplX3ZhbHVlIjowLjB9fX1dXSwibmFtZSI6Im1pcmEiLCJ1c2VyIjoicHVua3VpIn0="
	local var_151_3 = db.stellar_configs or {}

	if type(var_151_3.Default) ~= "table" or next(var_151_3.Default) == nil then
		local var_151_4, var_151_5 = pcall(function()
			return json.parse(slot_0_2_0.decode(var_151_2))
		end)

		if var_151_4 and type(var_151_5) == "table" and var_151_5.data then
			var_151_3.Default = var_151_5.data
			db.stellar_configs = var_151_3
		end
	end

	local var_151_6 = "Default"

	function update_config_list()
		local var_153_0 = {
			"Default  \a525252FF～  stellar"
		}

		for iter_153_0, iter_153_1 in pairs(var_151_3) do
			if iter_153_0 ~= "Default" then
				table.insert(var_153_0, iter_153_0 .. "  \a525252FF～  " .. var_151_0)
			end
		end

		slot_0_28_0.configs.list:update(var_153_0)

		local var_153_1 = 1
		local var_153_2 = var_151_6

		if var_151_6 ~= "Default" then
			for iter_153_2 = 2, #var_153_0 do
				if var_153_0[iter_153_2]:find(var_153_2, 1, true) then
					var_153_1 = iter_153_2

					break
				end
			end
		end

		slot_0_28_0.configs.list:set(var_153_1)
		slot_0_28_0.configs.text:set(var_151_6)
	end

	function load_config(arg_154_0)
		if arg_154_0 == "Default" then
			local var_154_0, var_154_1 = pcall(function()
				return json.parse(slot_0_2_0.decode(var_151_2))
			end)

			if var_154_0 and var_154_1 and var_154_1.data then
				var_151_1:load(var_154_1.data)

				var_151_6 = "Default"

				update_config_list()
				print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Default config successfully loaded")
				cvar.play:call("ui/beepclear")
			else
				print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Failed to load Default config")
				cvar.play:call("resource/warning.wav")
			end
		else
			local var_154_2 = var_151_3[arg_154_0]

			if var_154_2 then
				var_151_1:load(var_154_2)

				var_151_6 = arg_154_0

				update_config_list()
				print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Config \ad6f1ffFF" .. arg_154_0 .. "\aFFFFFFFF successfully loaded")
				cvar.play:call("ui/beepclear")
			else
				print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Config \ad6f1ffFF" .. arg_154_0 .. "\aFFFFFFFF not found")
				cvar.play:call("resource/warning.wav")
			end
		end
	end

	function save_config(arg_156_0)
		if not arg_156_0 or arg_156_0 == "" then
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Please enter a config name")
			cvar.play:call("resource/warning.wav")

			return
		end

		if arg_156_0 == "Default" then
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Cannot overwrite Default config")
			cvar.play:call("resource/warning.wav")

			return
		end

		var_151_3[arg_156_0] = var_151_1:save()
		var_151_6 = arg_156_0

		update_config_list()

		db.stellar_configs = var_151_3

		print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Config \ad6f1ffFF" .. arg_156_0 .. "\aFFFFFFFF successfully saved")
		cvar.play:call("ui/beepclear")
	end

	function delete_config(arg_157_0)
		if arg_157_0 == "Default" then
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Cannot delete Default config")
			cvar.play:call("resource/warning.wav")

			return
		end

		if var_151_3[arg_157_0] then
			var_151_3[arg_157_0] = nil

			if var_151_6 == arg_157_0 then
				var_151_6 = "Default"

				slot_0_28_0.configs.text:set("Default")
			end

			update_config_list()

			db.stellar_configs = var_151_3

			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Config \ad6f1ffFF" .. arg_157_0 .. "\aFFFFFFFF successfully deleted")
			cvar.play:call("ui/beepclear")
		else
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Config \ad6f1ffFF" .. arg_157_0 .. "\aFFFFFFFF not found")
			cvar.play:call("resource/warning.wav")
		end
	end

	function export_config(arg_158_0)
		local var_158_0 = var_151_3[arg_158_0]

		if var_158_0 then
			slot_0_3_0.set(slot_0_2_0.encode(json.stringify({
				name = arg_158_0,
				user = var_151_0,
				data = var_158_0
			})))
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Config \ad6f1ffFF" .. arg_158_0 .. "\aFFFFFFFF exported to clipboard")
			cvar.play:call("ui/beepclear")
		else
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Config \ad6f1ffFF" .. arg_158_0 .. "\aFFFFFFFF not found")
			cvar.play:call("resource/warning.wav")
		end
	end

	function import_config()
		local var_159_0 = slot_0_3_0.get()

		if not var_159_0 or var_159_0 == "" then
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • No data in clipboard")
			cvar.play:call("resource/warning.wav")

			return
		end

		local var_159_1, var_159_2 = pcall(function()
			return json.parse(slot_0_2_0.decode(var_159_0))
		end)

		if not var_159_1 or type(var_159_2) ~= "table" or type(var_159_2.data) ~= "table" then
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Invalid config data in clipboard")
			cvar.play:call("resource/warning.wav")

			return
		end

		local var_159_3 = var_159_2.name or slot_0_28_0.configs.text:get()

		if not var_159_3 or var_159_3 == "" then
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Please enter a config name")
			cvar.play:call("resource/warning.wav")

			return
		end

		var_151_3[var_159_3] = var_159_2.data
		var_151_6 = var_159_3

		var_151_1:load(var_159_2.data)
		update_config_list()

		local var_159_4 = {
			"Default"
		}

		for iter_159_0, iter_159_1 in pairs(var_151_3) do
			if iter_159_0 ~= "Default" then
				table.insert(var_159_4, iter_159_0)
			end
		end

		for iter_159_2, iter_159_3 in ipairs(var_159_4) do
			if iter_159_3 == var_159_3 then
				slot_0_28_0.configs.list:set(iter_159_2)

				break
			end
		end

		db.stellar_configs = var_151_3

		print_raw("\ad6f1ffFFstellar\aFFFFFFFF • Config \ad6f1ffFF" .. var_159_3 .. "\aFFFFFFFF successfully imported")
		cvar.play:call("ui/beepclear")
	end

	slot_0_28_0.configs.list:set_callback(function()
		local var_161_0 = slot_0_28_0.configs.list:get()
		local var_161_1 = {
			"Default"
		}

		for iter_161_0, iter_161_1 in pairs(var_151_3) do
			if iter_161_0 ~= "Default" then
				table.insert(var_161_1, iter_161_0)
			end
		end

		local var_161_2 = var_161_1[var_161_0]

		if var_161_2 then
			slot_0_28_0.configs.text:set(var_161_2)
		end
	end)
	slot_0_28_0.configs.load:set_callback(function()
		local var_162_0 = slot_0_28_0.configs.list:get()
		local var_162_1 = {
			"Default"
		}

		for iter_162_0, iter_162_1 in pairs(var_151_3) do
			if iter_162_0 ~= "Default" then
				table.insert(var_162_1, iter_162_0)
			end
		end

		local var_162_2 = var_162_1[var_162_0]

		if var_162_2 then
			load_config(var_162_2)
		else
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • No config selected")
			cvar.play:call("resource/warning.wav")
		end
	end)
	slot_0_28_0.configs.save:set_callback(function()
		local var_163_0 = slot_0_28_0.configs.text:get()

		save_config(var_163_0)
	end)
	slot_0_28_0.configs.delete:set_callback(function()
		local var_164_0 = slot_0_28_0.configs.list:get()
		local var_164_1 = {
			"Default"
		}

		for iter_164_0, iter_164_1 in pairs(var_151_3) do
			if iter_164_0 ~= "Default" then
				table.insert(var_164_1, iter_164_0)
			end
		end

		local var_164_2 = var_164_1[var_164_0]

		if var_164_2 then
			delete_config(var_164_2)
		else
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • No config selected")
			cvar.play:call("resource/warning.wav")
		end
	end)
	slot_0_28_0.configs.export:set_callback(function()
		local var_165_0 = slot_0_28_0.configs.list:get()
		local var_165_1 = {
			"Default"
		}

		for iter_165_0, iter_165_1 in pairs(var_151_3) do
			if iter_165_0 ~= "Default" then
				table.insert(var_165_1, iter_165_0)
			end
		end

		local var_165_2 = var_165_1[var_165_0]

		if var_165_2 then
			export_config(var_165_2)
		else
			print_raw("\ad6f1ffFFstellar\aFFFFFFFF • No config selected")
			cvar.play:call("resource/warning.wav")
		end
	end)
	slot_0_28_0.configs.import:set_callback(function()
		import_config()
	end)
	update_config_list()

	return var_151_1
end

config_system()
events.createmove:set(antiaim)
events.render:set(function(arg_167_0)
	watermark()
	crosshair()
	damage()
	velocity()
	aspect_ratio()
	viewmodel()
	slot_0_68_0()
	scope()

	if ui.get_alpha() > 0.1 then
		local var_167_0 = slot_0_7_0:Animate("stellar.nightly", {
			ui.get_style("Link Active"),
			color(50)
		}, -2.5, 1)

		ui.sidebar(var_167_0, ui.get_icon("dove"))
	end
end)
events.createmove:set(function(arg_168_0)
	if ui.get_alpha() > 0 then
		arg_168_0.in_attack = false
		arg_168_0.in_attack2 = false
		arg_168_0.in_use = false
	end

	slot_0_59_0.no_fall_damage(arg_168_0)
	slot_0_59_0.fast_ladder(arg_168_0)
end)
